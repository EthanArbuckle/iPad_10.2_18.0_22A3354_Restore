@implementation _REAudioManagerCancellable

- (_REAudioManagerCancellable)init
{
  _REAudioManagerCancellable *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_REAudioManagerCancellable;
  result = -[_REAudioManagerCancellable init](&v3, sel_init);
  if (result)
  {
    result->_audioService = 0;
    atomic_store(0, (unsigned __int8 *)&result->_cancelled);
  }
  return result;
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
}

- (BOOL)isCancelled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

- (AudioService)audioService
{
  return self->_audioService;
}

- (void)setAudioService:(AudioService *)a3
{
  self->_audioService = a3;
}

@end
