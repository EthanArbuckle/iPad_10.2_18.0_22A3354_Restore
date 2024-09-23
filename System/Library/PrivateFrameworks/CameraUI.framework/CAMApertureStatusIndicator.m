@implementation CAMApertureStatusIndicator

- (BOOL)canShowValue
{
  return 1;
}

- (void)setApertureValue:(double)a3
{
  if (self->_apertureValue != a3)
  {
    self->_apertureValue = a3;
    -[CAMControlStatusIndicator setNeedsUpdateValueText](self, "setNeedsUpdateValueText");
  }
}

- (id)imageNameForCurrentState
{
  return CFSTR("f.cursive");
}

- (id)valueText
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CAMApertureStatusIndicator apertureValue](self, "apertureValue");
  v3 = v2;
  v4 = (void *)objc_opt_class();
  if (v3 >= 10.0)
    objc_msgSend(v4, "integerFormatter");
  else
    objc_msgSend(v4, "decimalFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    -[CAMControlStatusIndicator updateImage](self, "updateImage");
  }
}

- (double)apertureValue
{
  return self->_apertureValue;
}

- (BOOL)isOn
{
  return self->_on;
}

@end
