@implementation CADisplayPreset

- (CADisplayPreset)initWithIsReference:(BOOL)a3 userAdjustment:(id)a4
{
  double v4;

  LODWORD(v4) = 1.0;
  return -[CADisplayPreset initWithIsReference:userAdjustment:autoLuminanceBoost:](self, "initWithIsReference:userAdjustment:autoLuminanceBoost:", a3, a4, v4);
}

- (CADisplayPreset)initWithIsReference:(BOOL)a3 userAdjustment:(id)a4 autoLuminanceBoost:(float)a5
{
  _BOOL4 v7;
  CADisplayPreset *v8;
  CADisplayPreset *v9;
  double v10;
  double v11;
  objc_super v13;
  uint64_t v14;

  v7 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CADisplayPreset;
  v8 = -[CADisplayPreset init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_autoLuminanceBoost = a5;
    v10 = 100.0;
    v11 = 2.0;
    if (v7)
      v11 = 100.0;
    else
      v10 = 600.0;
    v8->_allowTrueTone = !v7;
    v8->_allowNightShift = !v7;
    v8->_allowAutoBrightness = !v7;
    v8->_minSliderBrightness = v11;
    v8->_maxSliderBrightness = v10;
    v8->_isReference = v7;
    v8->_userAdjustment = (CAUserAdjustment *)a4;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CADisplayPreset;
  -[CADisplayPreset dealloc](&v3, sel_dealloc);
}

- (id)userAdjustmentCommand
{
  CAUserAdjustmentCommand *v3;
  double v4;

  if (!self->_isReference)
    return 0;
  v3 = [CAUserAdjustmentCommand alloc];
  *(float *)&v4 = self->_autoLuminanceBoost;
  return -[CAUserAdjustmentCommand initWithUserAdjustment:autoLuminanceBoost:](v3, "initWithUserAdjustment:autoLuminanceBoost:", self->_userAdjustment, v4);
}

- (void)applyUserAdjustmentCommand:(id)a3
{
  id v5;

  v5 = (id)objc_msgSend(a3, "userAdjustment");

  self->_userAdjustment = (CAUserAdjustment *)objc_msgSend(a3, "userAdjustment");
}

- (BOOL)allowTrueTone
{
  return self->_allowTrueTone;
}

- (BOOL)allowNightShift
{
  return self->_allowNightShift;
}

- (BOOL)allowAutoBrightness
{
  return self->_allowAutoBrightness;
}

- (double)minSliderBrightness
{
  return self->_minSliderBrightness;
}

- (double)maxSliderBrightness
{
  return self->_maxSliderBrightness;
}

- (BOOL)isReference
{
  return self->_isReference;
}

- (CAUserAdjustment)userAdjustment
{
  return self->_userAdjustment;
}

@end
