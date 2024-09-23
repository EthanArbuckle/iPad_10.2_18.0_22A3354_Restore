@implementation CBTwilightParams

- (CBTwilightParams)initWithService:(unsigned int)a3
{
  CBTwilightNightShiftAdaptationParams *v3;
  uint64_t v4;
  objc_super v6;
  unsigned int v7;
  SEL v8;
  CBTwilightParams *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CBTwilightParams;
  v9 = -[CBChromaticCorrectionParams initFromTwilightFromService:](&v6, sel_initFromTwilightFromService_, a3);
  if (v9)
  {
    v3 = [CBTwilightNightShiftAdaptationParams alloc];
    v4 = -[CBTwilightNightShiftAdaptationParams initWithService:](v3, "initWithService:", v7);
    v9->_nightShiftAdaptation = (CBTwilightNightShiftAdaptationParams *)v4;
  }
  return v9;
}

- (CBTwilightNightShiftAdaptationParams)nightShiftAdaptation
{
  return self->_nightShiftAdaptation;
}

@end
