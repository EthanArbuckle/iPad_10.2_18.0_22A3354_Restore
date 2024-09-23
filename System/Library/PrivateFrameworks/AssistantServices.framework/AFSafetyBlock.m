@implementation AFSafetyBlock

- (AFSafetyBlock)initWithBlock:(id)a3
{
  id v4;
  AFSafetyBlock *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSafetyBlock;
  v5 = -[AFSafetyBlock init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1A1AC0C3C](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (BOOL)invokeWithSignal:(int64_t)a3
{
  atomic_flag *p_hasInvoked;
  unsigned __int8 v5;
  void (**block)(id, int64_t);
  id v7;

  p_hasInvoked = &self->_hasInvoked;
  do
    v5 = __ldaxr((unsigned __int8 *)p_hasInvoked);
  while (__stlxr(1u, (unsigned __int8 *)p_hasInvoked));
  if ((v5 & 1) == 0)
  {
    block = (void (**)(id, int64_t))self->_block;
    if (block)
    {
      block[2](block, a3);
      v7 = self->_block;
      self->_block = 0;

    }
  }
  return (v5 & 1) == 0;
}

- (BOOL)invoke
{
  return -[AFSafetyBlock invokeWithSignal:](self, "invokeWithSignal:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[AFSafetyBlock invokeWithSignal:](self, "invokeWithSignal:", -1);
  v3.receiver = self;
  v3.super_class = (Class)AFSafetyBlock;
  -[AFSafetyBlock dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
