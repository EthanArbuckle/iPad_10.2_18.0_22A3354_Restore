@implementation AVMediaSecondaryPlaybackControlConfiguration

- (AVMediaSecondaryPlaybackControlConfiguration)init
{
  return -[AVMediaSecondaryPlaybackControlConfiguration initWithType:](self, "initWithType:", 0);
}

- (AVMediaSecondaryPlaybackControlConfiguration)initWithType:(unint64_t)a3
{
  AVMediaSecondaryPlaybackControlConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMediaSecondaryPlaybackControlConfiguration;
  result = -[AVMediaSecondaryPlaybackControlConfiguration init](&v5, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_enabled = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVMediaSecondaryPlaybackControlConfiguration *v4;

  v4 = objc_alloc_init(AVMediaSecondaryPlaybackControlConfiguration);
  -[AVMediaSecondaryPlaybackControlConfiguration setType:](v4, "setType:", -[AVMediaSecondaryPlaybackControlConfiguration type](self, "type"));
  -[AVMediaSecondaryPlaybackControlConfiguration setEnabled:](v4, "setEnabled:", -[AVMediaSecondaryPlaybackControlConfiguration isEnabled](self, "isEnabled"));
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
