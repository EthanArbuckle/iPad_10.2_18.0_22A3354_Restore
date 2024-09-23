@implementation CBTwilightPolicy

- (id)isEnabledPropertyKey
{
  return CFSTR("TwilightEnabled");
}

- (BOOL)luxIsInActiveRange:(float)a3
{
  float v3;

  -[CBChromaticCorrectionParams luxActivationThreshold](self->_params, "luxActivationThreshold");
  return a3 <= v3;
}

- (BOOL)nitsAreInActiveRange:(float)a3
{
  float v3;
  float v4;
  BOOL v7;

  -[CBFloatArray get:](-[CBChromaticCorrectionParams nitsTable](self->_params, "nitsTable"), "get:", 0);
  v7 = 0;
  if (a3 >= v3)
  {
    -[CBChromaticCorrectionParams nitsActivationThreshold](self->_params, "nitsActivationThreshold");
    return a3 <= v4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBTwilightPolicy *v4;

  v4 = self;
  v3 = a2;

  v4->_params = 0;
  v2.receiver = v4;
  v2.super_class = (Class)CBTwilightPolicy;
  -[CBTwilightPolicy dealloc](&v2, sel_dealloc);
}

- (const)name
{
  return "Twilight";
}

- (id)strengthNotification
{
  return CFSTR("TwilightStrength");
}

- (id)rampIdentifier
{
  return CFSTR("Twilight");
}

- (float)cappedRampStartLux:(float)a3
{
  float v3;

  -[CBChromaticCorrectionParams luxActivationThreshold](self->_params, "luxActivationThreshold");
  return fminf(a3, v3);
}

- (float)cappedRampTargetLux:(float)a3
{
  float v3;

  -[CBTwilightPolicy rampTargetLuxCap](self, "rampTargetLuxCap");
  return fminf(a3, v3);
}

- (float)rampTargetLuxCap
{
  float v2;
  float v3;
  float v5;

  -[CBChromaticCorrectionParams luxActivationThreshold](self->_params, "luxActivationThreshold");
  v5 = v2;
  -[CBChromaticCorrectionParams rampDownLuxDeltaThreshold](self->_params, "rampDownLuxDeltaThreshold");
  return v5 + v3;
}

- (CBChromaticCorrectionParams)params
{
  return (CBChromaticCorrectionParams *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

@end
