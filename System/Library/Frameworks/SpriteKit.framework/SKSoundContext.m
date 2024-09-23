@implementation SKSoundContext

+ (id)context
{
  return objc_alloc_init(SKSoundContext);
}

+ (id)currentContext
{
  ALCcontext *CurrentContext;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (onceToken != -1)
    dispatch_once(&onceToken, &__block_literal_global_10);
  CurrentContext = alcGetCurrentContext();
  v3 = (void *)_contexts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CurrentContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "nonretainedObjectValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __32__SKSoundContext_currentContext__block_invoke()
{
  SKThreadSafeMapTable *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SKThreadSafeMapTable alloc];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SKThreadSafeMapTable initWithNSMapTable:](v0, "initWithNSMapTable:", v3);
  v2 = (void *)_contexts;
  _contexts = v1;

}

- (SKSoundContext)init
{
  SKSoundContext *v2;
  ALCdevice *device;
  ALCcontext *Context;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKSoundContext;
  v2 = -[SKSoundContext init](&v9, sel_init);
  if (v2)
  {
    if (onceToken != -1)
      dispatch_once(&onceToken, &__block_literal_global_4);
    if (objc_msgSend((id)_contexts, "count"))
    {
      device = v2->_device;
    }
    else
    {
      device = alcOpenDevice(0);
      v2->_device = device;
    }
    Context = alcCreateContext(device, 0);
    v2->_context = Context;
    if (Context)
    {
      v5 = (void *)_contexts;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v2->_context));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, v7);

    }
    else
    {
      v6 = v2;
      v2 = 0;
    }

  }
  return v2;
}

void __22__SKSoundContext_init__block_invoke()
{
  SKThreadSafeMapTable *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SKThreadSafeMapTable alloc];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SKThreadSafeMapTable initWithNSMapTable:](v0, "initWithNSMapTable:", v3);
  v2 = (void *)_contexts;
  _contexts = v1;

}

- (void)setSuspended:(BOOL)a3
{
  ALCcontext *context;

  if (self->_suspended != a3)
  {
    self->_suspended = a3;
    context = self->_context;
    if (a3)
    {
      alcSuspendContext(context);
      alcMakeContextCurrent(0);
    }
    else
    {
      alcMakeContextCurrent(context);
      alcProcessContext(self->_context);
    }
  }
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void)makeCurrentContext
{
  alcMakeContextCurrent(self->_context);
}

- (CGPoint)listenerPosition
{
  double v2;
  double v3;
  ALfloat value3;
  ALfloat value2;
  ALfloat value1;
  CGPoint result;

  if (self->_context)
  {
    value1 = 0.0;
    value3 = 0.0;
    value2 = 0.0;
    alGetListener3f(4100, &value1, &value2, &value3);
    v2 = value1;
    v3 = value2;
  }
  else
  {
    v2 = *MEMORY[0x1E0C9D538];
    v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setListenerPosition:(CGPoint)a3
{
  ALfloat x;
  ALfloat y;

  if (self->_context)
  {
    x = a3.x;
    y = a3.y;
    alListener3f(4100, x, y, 0.0);
  }
}

- (double)gain
{
  ALfloat value;

  if (!self->_context)
    return 0.0;
  value = 0.0;
  alGetListenerf(4106, &value);
  return value;
}

- (void)setGain:(double)a3
{
  ALfloat v3;

  if (self->_context)
  {
    v3 = a3;
    alListenerf(4106, v3);
  }
}

- (void)dealloc
{
  ALCcontext *context;
  void *v4;
  void *v5;
  ALCdevice *device;
  objc_super v7;

  context = self->_context;
  if (context)
  {
    v4 = (void *)_contexts;
    if (_contexts)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObjectForKey:", v5);

      context = self->_context;
    }
    alcDestroyContext(context);
    self->_context = 0;
  }
  if (!_contexts || !objc_msgSend((id)_contexts, "count"))
  {
    device = self->_device;
    if (device)
    {
      alcCloseDevice(device);
      self->_device = 0;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)SKSoundContext;
  -[SKSoundContext dealloc](&v7, sel_dealloc);
}

@end
