@implementation MXDuckingSource

- (MXDuckingSource)initWithType:(unsigned int)a3 ID:(unint64_t)a4 duckVolume:(float)a5 duckFadeDuration:(float)a6
{
  MXDuckingSource *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MXDuckingSource;
  result = -[MXDuckingSource init](&v11, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_ID = a4;
    result->_duckVolume = a5;
    result->_duckFadeDuration = a6;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MXDuckingSource;
  -[MXDuckingSource dealloc](&v2, sel_dealloc);
}

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)ID
{
  return self->_ID;
}

- (float)duckVolume
{
  return self->_duckVolume;
}

- (void)setDuckVolume:(float)a3
{
  self->_duckVolume = a3;
}

- (float)duckFadeDuration
{
  return self->_duckFadeDuration;
}

- (void)setDuckFadeDuration:(float)a3
{
  self->_duckFadeDuration = a3;
}

@end
