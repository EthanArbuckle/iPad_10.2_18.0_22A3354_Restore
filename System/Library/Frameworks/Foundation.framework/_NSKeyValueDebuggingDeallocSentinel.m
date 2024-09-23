@implementation _NSKeyValueDebuggingDeallocSentinel

+ (void)_invalidateSentinelWithKey:(void *)a3 fromObject:(id)a4
{
  objc_msgSend(objc_getAssociatedObject(a4, a3), "invalidate");
}

- (_NSKeyValueDebuggingDeallocSentinel)initWithObjectPointer:(unint64_t)a3 callbackBlock:(id)a4
{
  _NSKeyValueDebuggingDeallocSentinel *v6;
  _NSKeyValueDebuggingDeallocSentinel *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_NSKeyValueDebuggingDeallocSentinel;
  v6 = -[_NSKeyValueDebuggingDeallocSentinel init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isInvalid = 0;
    v6->_objectPointer = a3;
    v6->_callbackBlock = (id)objc_msgSend(a4, "copy");
  }
  return v7;
}

- (void)invalidate
{
  BOOL *p_isInvalid;
  unsigned __int8 v4;

  p_isInvalid = &self->_isInvalid;
  do
    v4 = __ldaxr((unsigned __int8 *)p_isInvalid);
  while (__stlxr(1u, (unsigned __int8 *)p_isInvalid));
  if ((v4 & 1) == 0)
  {

    self->_callbackBlock = 0;
  }
}

- (void)dealloc
{
  unsigned __int8 v3;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = atomic_load((unsigned __int8 *)&self->_isInvalid);
  if ((v3 & 1) == 0)
  {
    (*((void (**)(void))self->_callbackBlock + 2))();

  }
  v4.receiver = self;
  v4.super_class = (Class)_NSKeyValueDebuggingDeallocSentinel;
  -[_NSKeyValueDebuggingDeallocSentinel dealloc](&v4, sel_dealloc);
}

@end
