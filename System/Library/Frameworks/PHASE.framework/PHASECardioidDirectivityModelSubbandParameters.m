@implementation PHASECardioidDirectivityModelSubbandParameters

- (PHASECardioidDirectivityModelSubbandParameters)init
{
  PHASECardioidDirectivityModelSubbandParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASECardioidDirectivityModelSubbandParameters;
  result = -[PHASECardioidDirectivityModelSubbandParameters init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_frequency = xmmword_216739CB0;
    result->_sharpness = 1.0;
  }
  return result;
}

- (void)setFrequency:(double)frequency
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_frequency = PHASEGetPropertyBounded<double>(v8, v7, frequency, 20.0, 20000.0);

}

- (void)setPattern:(double)pattern
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_pattern = PHASEGetPropertyBounded<double>(v8, v7, pattern, 0.0, 1.0);

}

- (void)setSharpness:(double)sharpness
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sharpness = PHASEGetPropertyBounded<double>(v8, v7, sharpness, 1.0, 1.79769313e308);

}

- (double)frequency
{
  return self->_frequency;
}

- (double)pattern
{
  return self->_pattern;
}

- (double)sharpness
{
  return self->_sharpness;
}

@end
