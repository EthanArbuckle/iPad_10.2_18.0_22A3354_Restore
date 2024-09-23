@implementation MRUSpatialAudioMode

- (MRUSpatialAudioMode)initWithType:(int64_t)a3
{
  return -[MRUSpatialAudioMode initWithType:isEnabled:](self, "initWithType:isEnabled:", a3, 1);
}

- (MRUSpatialAudioMode)initWithType:(int64_t)a3 isEnabled:(BOOL)a4
{
  MRUSpatialAudioMode *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUSpatialAudioMode;
  result = -[MRUSpatialAudioMode init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_isEnabled = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  MRUSpatialAudioMode *v4;
  MRUSpatialAudioMode *v5;

  v4 = (MRUSpatialAudioMode *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MRUSpatialAudioMode type](v5, "type");
      -[MRUSpatialAudioMode isEnabled](v5, "isEnabled");

    }
  }

  return self == v4;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

@end
