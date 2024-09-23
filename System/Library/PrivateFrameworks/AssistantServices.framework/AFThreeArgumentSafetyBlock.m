@implementation AFThreeArgumentSafetyBlock

- (AFThreeArgumentSafetyBlock)initWithBlock:(id)a3
{
  return -[AFThreeArgumentSafetyBlock initWithBlock:defaultValue1:defaultValue2:defaultValue3:](self, "initWithBlock:defaultValue1:defaultValue2:defaultValue3:", a3, 0, 0, 0);
}

- (AFThreeArgumentSafetyBlock)initWithBlock:(id)a3 defaultValue1:(id)a4 defaultValue2:(id)a5 defaultValue3:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AFThreeArgumentSafetyBlock *v14;
  uint64_t v15;
  id block;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AFThreeArgumentSafetyBlock;
  v14 = -[AFThreeArgumentSafetyBlock init](&v18, sel_init);
  if (v14)
  {
    v15 = MEMORY[0x1A1AC0C3C](v10);
    block = v14->_block;
    v14->_block = (id)v15;

    objc_storeStrong(&v14->_defaultValue1, a4);
    objc_storeStrong(&v14->_defaultValue2, a5);
    objc_storeStrong(&v14->_defaultValue3, a6);
  }

  return v14;
}

- (BOOL)invokeWithValue:(id)a3 andValue:(id)a4 andValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  atomic_flag *p_hasInvoked;
  unsigned __int8 v12;
  void (**block)(id, id, id, id);
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_hasInvoked = &self->_hasInvoked;
  do
    v12 = __ldaxr((unsigned __int8 *)p_hasInvoked);
  while (__stlxr(1u, (unsigned __int8 *)p_hasInvoked));
  if ((v12 & 1) == 0)
  {
    block = (void (**)(id, id, id, id))self->_block;
    if (block)
    {
      block[2](block, v8, v9, v10);
      v14 = self->_block;
      self->_block = 0;

    }
  }

  return (v12 & 1) == 0;
}

- (void)dealloc
{
  objc_super v3;

  -[AFThreeArgumentSafetyBlock invokeWithValue:andValue:andValue:](self, "invokeWithValue:andValue:andValue:", self->_defaultValue1, self->_defaultValue2, self->_defaultValue3);
  v3.receiver = self;
  v3.super_class = (Class)AFThreeArgumentSafetyBlock;
  -[AFThreeArgumentSafetyBlock dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue3, 0);
  objc_storeStrong(&self->_defaultValue2, 0);
  objc_storeStrong(&self->_defaultValue1, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
