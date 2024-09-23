@implementation VNCanceller

- (VNCanceller)init
{
  VNCanceller *v2;
  VNCanceller *v3;
  VNCanceller *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNCanceller;
  v2 = -[VNCanceller init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_releaseSignallingBlock
{
  os_unfair_lock_s *p_lock;
  id signallingBlock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  signallingBlock = self->_signallingBlock;
  self->_signallingBlock = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)tryToPerformBlock:(id)a3 usingSignallingBlock:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  _BOOL4 signalled;
  void *v9;
  id signallingBlock;

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  signalled = self->_signalled;
  if (self->_signalled)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v9 = _Block_copy(v7);
    signallingBlock = self->_signallingBlock;
    self->_signallingBlock = v9;

    os_unfair_lock_unlock(&self->_lock);
    if (v6)
      v6[2](v6);
    -[VNCanceller _releaseSignallingBlock](self, "_releaseSignallingBlock");
  }

  return !signalled;
}

- (void)reset
{
  -[VNCanceller _releaseSignallingBlock](self, "_releaseSignallingBlock");
  os_unfair_lock_lock(&self->_lock);
  self->_signalled = 0;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)signalCancellation
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_signalled)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_signalled = 1;
    v4 = (void (**)(_QWORD))_Block_copy(self->_signallingBlock);
    os_unfair_lock_unlock(p_lock);
    if (v4)
    {
      v4[2](v4);

    }
  }
}

- (BOOL)wasSignalled
{
  VNCanceller *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_signalled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_signallingBlock, 0);
}

@end
