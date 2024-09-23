@implementation REAudioSessionComponentWrapper

- (REAudioSessionComponentWrapper)initWithComponent:(void *)a3
{
  REAudioSessionComponentWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REAudioSessionComponentWrapper;
  result = -[REAudioSessionComponentWrapper init](&v5, sel_init);
  if (result)
    result->_component = a3;
  return result;
}

- (void)component
{
  return self->_component;
}

- (void)setComponent:(void *)a3
{
  self->_component = a3;
}

@end
