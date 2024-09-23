@implementation CUIStyleEffectConfiguration

- (BOOL)useSimplifiedEffect
{
  return self->_useSimplifiedEffect;
}

- (void)setAppearanceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    v4[1] = self->_state;
    v4[2] = self->_presentationState;
    v4[3] = self->_value;
    v4[4] = self->_dimension1;
    v4[5] = -[NSString copy](self->_appearanceName, "copy");
    *((_BYTE *)v5 + 48) = self->_useSimplifiedEffect;
    *((_BYTE *)v5 + 49) = self->_foregroundColorShouldTintEffects;
    v5[7] = *(_QWORD *)&self->_brightnessMultiplier;
    v5[8] = *(_QWORD *)&self->_effectScale;
  }
  return v5;
}

- (CUIStyleEffectConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIStyleEffectConfiguration;
  return -[CUIStyleEffectConfiguration init](&v3, sel_init);
}

- (NSString)appearanceName
{
  return self->_appearanceName;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIStyleEffectConfiguration;
  -[CUIStyleEffectConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldIgnoreForegroundColor
{
  return 0;
}

- (BOOL)shouldRespectOutputBlending
{
  return 0;
}

- (id)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p useSimplifiedEffect %d\nstate: %d\nvalue: %ddimension1: %d appearance: %@> "), NSStringFromClass(v3), self, -[CUIStyleEffectConfiguration useSimplifiedEffect](self, "useSimplifiedEffect"), -[CUIStyleEffectConfiguration state](self, "state"), -[CUIStyleEffectConfiguration value](self, "value"), -[CUIStyleEffectConfiguration dimension1](self, "dimension1"), self->_appearanceName);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (unint64_t)dimension1
{
  return self->_dimension1;
}

- (void)setDimension1:(unint64_t)a3
{
  self->_dimension1 = a3;
}

- (void)setUseSimplifiedEffect:(BOOL)a3
{
  self->_useSimplifiedEffect = a3;
}

- (BOOL)foregroundColorShouldTintEffects
{
  return self->_foregroundColorShouldTintEffects;
}

- (void)setForegroundColorShouldTintEffects:(BOOL)a3
{
  self->_foregroundColorShouldTintEffects = a3;
}

- (double)brightnessMultiplier
{
  return self->_brightnessMultiplier;
}

- (void)setBrightnessMultiplier:(double)a3
{
  self->_brightnessMultiplier = a3;
}

- (unint64_t)colorTemperature
{
  return self->_colorTemperature;
}

- (void)setColorTemperature:(unint64_t)a3
{
  self->_colorTemperature = a3;
}

- (double)effectScale
{
  return self->_effectScale;
}

- (void)setEffectScale:(double)a3
{
  self->_effectScale = a3;
}

@end
