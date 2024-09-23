@implementation NSAutoreleasePool

+ (NSAutoreleasePool)allocWithZone:(_NSZone *)a3
{
  uint64_t i;
  unint64_t *v4;
  NSAutoreleasePool *v5;
  unint64_t v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_NSDoAPCache)
  {
    for (i = 0; i != 4; ++i)
    {
      v4 = (unint64_t *)((char *)&_NSAPCache + 8 * i);
      v5 = (NSAutoreleasePool *)*v4;
      if (*v4)
      {
        while (1)
        {
          v6 = __ldaxr(v4);
          if ((NSAutoreleasePool *)v6 != v5)
            break;
          if (!__stlxr(0, v4))
            return v5;
        }
        __clrex();
      }
    }
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___NSAutoreleasePool;
  return (NSAutoreleasePool *)objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
}

- (NSAutoreleasePool)init
{
  self->_token = (void *)_CFAutoreleasePoolPush();
  self->_reserved3 = 0;
  self->_reserved2 = 0;
  self->_reserved = 0;
  return self;
}

- (void)release
{
  NSString *v4;
  NSString *v5;
  void *token;
  uint64_t i;
  unint64_t *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_reserved2)
  {
    v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: This pool has already been released, do not drain it (double release)."), v4);
  }
  if (self->_reserved3)
  {
    v5 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: This pool has already been drained, do not release it (double release)."), v5);
  }
  token = self->_token;
  self->_reserved2 = (void *)-1;
  self->_token = 0;
  if (token)
  {
    _CFAutoreleasePoolPop();
    if (_NSDoAPCache)
    {
      objc_removeAssociatedObjects(self);
      for (i = 0; i != 4; ++i)
      {
        v8 = (unint64_t *)((char *)&_NSAPCache + 8 * i);
        if (!*v8)
        {
          while (!__ldaxr(v8))
          {
            if (!__stlxr((unint64_t)self, v8))
              return;
          }
          __clrex();
        }
      }
    }
    v10.receiver = self;
    v10.super_class = (Class)NSAutoreleasePool;
    -[NSAutoreleasePool dealloc](&v10, sel_dealloc);
  }
}

- (void)drain
{
  NSString *v4;
  NSString *v5;
  void *token;
  uint64_t i;
  unint64_t *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_reserved2)
  {
    v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: This pool has already been released, do not drain it (double release)."), v4);
  }
  if (self->_reserved3)
  {
    v5 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: This pool has already been drained, do not release it (double release)."), v5);
  }
  token = self->_token;
  self->_token = 0;
  self->_reserved3 = (void *)-1;
  if (token)
  {
    _CFAutoreleasePoolPop();
    if (_NSDoAPCache)
    {
      objc_removeAssociatedObjects(self);
      for (i = 0; i != 4; ++i)
      {
        v8 = (unint64_t *)((char *)&_NSAPCache + 8 * i);
        if (!*v8)
        {
          while (!__ldaxr(v8))
          {
            if (!__stlxr((unint64_t)self, v8))
              return;
          }
          __clrex();
        }
      }
    }
    v10.receiver = self;
    v10.super_class = (Class)NSAutoreleasePool;
    -[NSAutoreleasePool dealloc](&v10, sel_dealloc);
  }
}

+ (void)addObject:(id)anObject
{
  _CFAutoreleasePoolAddObject();
}

- (NSAutoreleasePool)initWithCapacity:(unint64_t)a3
{
  NSString *v4;

  v4 = _NSMethodExceptionProem((objc_class *)self, a2);
  NSLog((NSString *)CFSTR("%@: Do not use this init method."), v4);
  return -[NSAutoreleasePool init](self, "init");
}

- (void)addObject:(id)anObject
{
  unsigned int v4;
  unsigned int v5;
  NSString *v6;

  do
  {
    v4 = __ldaxr(&addObject__logCount);
    v5 = v4 + 1;
  }
  while (__stlxr(v5, &addObject__logCount));
  if ((v5 & 0xF) == 1)
  {
    v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: Do not use this instance method on specific pools -- just use -autorelease instead."), v6);
  }
  if (self->_token)
    _CFAutoreleasePoolAddObject();
}

- (NSAutoreleasePool)retain
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Cannot retain an autorelease pool"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
  objc_exception_throw(v2);
}

- (unint64_t)retainCount
{
  return 1;
}

- (NSAutoreleasePool)autorelease
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Cannot autorelease an autorelease pool"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
  objc_exception_throw(v2);
}

- (void)dealloc
{
  NSString *v2;

  v2 = _NSMethodExceptionProem((objc_class *)self, a2);
  NSLog((NSString *)CFSTR("%@: WARNING: Do not call this method directly.\n"), v2);
}

+ (unint64_t)autoreleasedObjectCount
{
  return 0;
}

+ (unint64_t)topAutoreleasePoolCount
{
  return 0;
}

+ (BOOL)autoreleasePoolExists
{
  return 0;
}

+ (unint64_t)poolCountHighWaterMark
{
  return 0;
}

+ (unint64_t)poolCountHighWaterResolution
{
  return 0;
}

+ (unint64_t)totalAutoreleasedObjects
{
  return 0;
}

@end
