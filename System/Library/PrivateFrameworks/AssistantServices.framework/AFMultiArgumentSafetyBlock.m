@implementation AFMultiArgumentSafetyBlock

- (AFMultiArgumentSafetyBlock)initWithBlock:(id)a3
{
  return -[AFMultiArgumentSafetyBlock initWithBlock:defaultValueArray:](self, "initWithBlock:defaultValueArray:", a3, 0);
}

- (AFMultiArgumentSafetyBlock)initWithBlock:(id)a3 defaultValues:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id *v11;
  id v12;
  AFMultiArgumentSafetyBlock *v13;
  id *v15;
  void *v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "addObject:", v7);
    v15 = (id *)&v17;
    v9 = v16;
    if (v9)
    {
      v10 = v9;
      do
      {
        objc_msgSend(v8, "addObject:", v10);
        v11 = v15++;
        v12 = *v11;

        v10 = v12;
      }
      while (v12);
    }
  }
  else
  {
    v8 = 0;
  }
  v13 = -[AFMultiArgumentSafetyBlock initWithBlock:defaultValueArray:](self, "initWithBlock:defaultValueArray:", v6, v8);

  return v13;
}

- (AFMultiArgumentSafetyBlock)initWithBlock:(id)a3 defaultValueArray:(id)a4
{
  id v7;
  id v8;
  AFMultiArgumentSafetyBlock *v9;
  uint64_t v10;
  id block;
  uint64_t v12;
  NSMethodSignature *blockMethodSignature;
  unint64_t v14;
  uint64_t v15;
  NSArray *defaultValueArray;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFSafetyBlock.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  if (!_Block_has_signature(v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFSafetyBlock.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_Block_has_signature((__bridge void *)block)"));

  }
  v22.receiver = self;
  v22.super_class = (Class)AFMultiArgumentSafetyBlock;
  v9 = -[AFMultiArgumentSafetyBlock init](&v22, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    block = v9->_block;
    v9->_block = (id)v10;

    if (_Block_has_signature(v9->_block))
    {
      objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", _Block_signature(v9->_block));
      v12 = objc_claimAutoreleasedReturnValue();
      blockMethodSignature = v9->_blockMethodSignature;
      v9->_blockMethodSignature = (NSMethodSignature *)v12;

    }
    if (!v9->_blockMethodSignature)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("AFSafetyBlock.m"), 207, CFSTR("Copied block %@ is expected to have a signature."), v9->_block);

    }
    v14 = objc_msgSend(v8, "count");
    if (v14 >= -[NSMethodSignature numberOfArguments](v9->_blockMethodSignature, "numberOfArguments"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("AFSafetyBlock.m"), 208, CFSTR("Number of default values (%lu) is expected to be equal or less than the number of block arguments (%lu)."), objc_msgSend(v8, "count"), -[NSMethodSignature numberOfArguments](v9->_blockMethodSignature, "numberOfArguments") - 1);

    }
    v15 = objc_msgSend(v8, "copy");
    defaultValueArray = v9->_defaultValueArray;
    v9->_defaultValueArray = (NSArray *)v15;

  }
  return v9;
}

- (BOOL)invoke
{
  return -[AFMultiArgumentSafetyBlock invokeWithValueArray:](self, "invokeWithValueArray:", self->_defaultValueArray);
}

- (BOOL)invokeWithValues:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id *v8;
  id v9;
  BOOL v10;
  id *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "addObject:", v4);
    v12 = (id *)&v14;
    v6 = v13;
    if (v6)
    {
      v7 = v6;
      do
      {
        objc_msgSend(v5, "addObject:", v7);
        v8 = v12++;
        v9 = *v8;

        v7 = v9;
      }
      while (v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = -[AFMultiArgumentSafetyBlock invokeWithValueArray:](self, "invokeWithValueArray:", v5);

  return v10;
}

- (BOOL)invokeWithValueArray:(id)a3
{
  id v5;
  unint64_t v6;
  atomic_flag *p_hasInvoked;
  unsigned __int8 v8;
  void *v9;
  id v10;
  id block;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6 >= -[NSMethodSignature numberOfArguments](self->_blockMethodSignature, "numberOfArguments"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFSafetyBlock.m"), 235, CFSTR("Number of values for invocation (%lu) is expected to be equal or less than the number of block arguments (%lu)."), objc_msgSend(v5, "count"), -[NSMethodSignature numberOfArguments](self->_blockMethodSignature, "numberOfArguments") - 1);

  }
  p_hasInvoked = &self->_hasInvoked;
  do
    v8 = __ldaxr((unsigned __int8 *)p_hasInvoked);
  while (__stlxr(1u, (unsigned __int8 *)p_hasInvoked));
  if ((v8 & 1) == 0 && self->_block)
  {
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", self->_blockMethodSignature);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__AFMultiArgumentSafetyBlock_invokeWithValueArray___block_invoke;
    v14[3] = &unk_1E3A33428;
    v15 = v9;
    v10 = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
    objc_msgSend(v10, "invokeWithTarget:", self->_block);

    block = self->_block;
    self->_block = 0;

  }
  return (v8 & 1) == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValueArray, 0);
  objc_storeStrong((id *)&self->_blockMethodSignature, 0);
  objc_storeStrong(&self->_block, 0);
}

void __51__AFMultiArgumentSafetyBlock_invokeWithValueArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setArgument:atIndex:", &v5, a3 + 1);

}

@end
