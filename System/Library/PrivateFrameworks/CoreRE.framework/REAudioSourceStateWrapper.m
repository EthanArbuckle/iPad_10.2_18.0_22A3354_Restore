@implementation REAudioSourceStateWrapper

- (REAudioSourceStateWrapper)init
{
  -[REAudioSourceStateWrapper doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (REAudioSourceStateWrapper)initWithState:(void *)a3
{
  REAudioSourceStateWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REAudioSourceStateWrapper;
  result = -[REAudioSourceStateWrapper init](&v5, sel_init);
  if (result)
    result->_state = a3;
  return result;
}

- (void)state
{
  return self->_state;
}

- (void)setState:(void *)a3
{
  self->_state = a3;
}

@end
