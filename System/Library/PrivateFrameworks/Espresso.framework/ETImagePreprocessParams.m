@implementation ETImagePreprocessParams

- (ETImagePreprocessParams)initWithHeight:(unint64_t)a3 Width:(unint64_t)a4 NumChannels:(unint64_t)a5 Scale:(float)a6 BiasR:(float)a7 BiasG:(float)a8 BiasB:(float)a9 NetworkWantBGR:(BOOL)a10
{
  ETImagePreprocessParams *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ETImagePreprocessParams;
  result = -[ETImagePreprocessParams init](&v17, sel_init);
  if (result)
  {
    if (a5 - 3 >= 2 && a5 != 1)
      Espresso::throw_exception_selector<Espresso::invalid_argument_error,unsigned long &>("channels need to be 1, 3, or 4 but got %lu", a5);
    result->_height = a3;
    result->_width = a4;
    result->_channels = a5;
    result->_scale = a6;
    result->_bias_r = a7;
    result->_network_wants_bgr = a10;
  }
  return result;
}

- (BOOL)network_wants_bgr
{
  return self->_network_wants_bgr;
}

- (float)bias_r
{
  return self->_bias_r;
}

- (float)bias_g
{
  return self->_bias_g;
}

- (float)bias_b
{
  return self->_bias_b;
}

- (float)scale
{
  return self->_scale;
}

- (unint64_t)channels
{
  return self->_channels;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)width
{
  return self->_width;
}

@end
