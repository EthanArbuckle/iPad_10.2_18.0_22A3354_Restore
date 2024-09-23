@implementation AFOneArgumentSafetyBlock

- (AFOneArgumentSafetyBlock)initWithBlock:(id)a3
{
  return -[AFOneArgumentSafetyBlock initWithBlock:defaultValue:](self, "initWithBlock:defaultValue:", a3, 0);
}

- (AFOneArgumentSafetyBlock)initWithBlock:(id)a3 defaultValue:(id)a4
{
  id v6;
  id v7;
  AFOneArgumentSafetyBlock *v8;
  uint64_t v9;
  id block;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AFOneArgumentSafetyBlock;
  v8 = -[AFOneArgumentSafetyBlock init](&v12, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x1A1AC0C3C](v6);
    block = v8->_block;
    v8->_block = (id)v9;

    objc_storeStrong(&v8->_defaultValue, a4);
  }

  return v8;
}

- (BOOL)invokeWithValue:(id)a3
{
  id v4;
  atomic_flag *p_hasInvoked;
  unsigned __int8 v6;
  void (**block)(id, id);
  id v8;

  v4 = a3;
  p_hasInvoked = &self->_hasInvoked;
  do
    v6 = __ldaxr((unsigned __int8 *)p_hasInvoked);
  while (__stlxr(1u, (unsigned __int8 *)p_hasInvoked));
  if ((v6 & 1) == 0)
  {
    block = (void (**)(id, id))self->_block;
    if (block)
    {
      block[2](block, v4);
      v8 = self->_block;
      self->_block = 0;

    }
  }

  return (v6 & 1) == 0;
}

- (void)dealloc
{
  objc_super v3;

  -[AFOneArgumentSafetyBlock invokeWithValue:](self, "invokeWithValue:", self->_defaultValue);
  v3.receiver = self;
  v3.super_class = (Class)AFOneArgumentSafetyBlock;
  -[AFOneArgumentSafetyBlock dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
