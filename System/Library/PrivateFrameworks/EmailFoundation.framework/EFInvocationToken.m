@implementation EFInvocationToken

- (EFInvocationToken)initWithLabel:(id)a3
{
  id v4;
  EFInvocationToken *v5;
  NSLock *v6;
  NSLock *lock;
  NSMutableArray *v8;
  NSMutableArray *blocks;
  uint64_t v10;
  NSString *label;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EFInvocationToken;
  v5 = -[EFInvocationToken init](&v13, sel_init);
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v5->_lock;
    v5->_lock = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    blocks = v5->_blocks;
    v5->_blocks = v8;

    v10 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v10;

  }
  return v5;
}

- (EFInvocationToken)init
{
  return -[EFInvocationToken initWithLabel:](self, "initWithLabel:", 0);
}

- (void)addInvocationBlock:(id)a3
{
  _BOOL4 isInvoked;
  NSMutableArray *blocks;
  void *v7;
  void *v8;
  void (**aBlock)(void);

  aBlock = (void (**)(void))a3;
  if (!aBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFInvocationToken.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  -[NSLock lock](self->_lock, "lock");
  isInvoked = self->_isInvoked;
  if (!self->_isInvoked)
  {
    blocks = self->_blocks;
    v7 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](blocks, "addObject:", v7);

  }
  -[NSLock unlock](self->_lock, "unlock");
  if (isInvoked)
    aBlock[2]();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  _BOOL4 isInvoked;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  -[EFInvocationToken label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[EFInvocationToken label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)objc_msgSend(v4, "initWithFormat:", CFSTR(" (%@)"), v5);

  }
  else
  {
    v6 = &stru_1E62A84D8;
  }
  -[NSLock lock](self->_lock, "lock");
  isInvoked = self->_isInvoked;
  v8 = -[NSMutableArray count](self->_blocks, "count");
  -[NSLock unlock](self->_lock, "unlock");
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_opt_class();
  if (isInvoked)
    v11 = &stru_1E62A84D8;
  else
    v11 = CFSTR("not ");
  objc_msgSend((id)objc_opt_class(), "_descriptionString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p%@> %@%@ - %lu blocks"), v10, self, v6, v11, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)label
{
  return self->_label;
}

+ (id)_descriptionString
{
  return CFSTR("invoked");
}

- (BOOL)isInvoked
{
  BOOL isInvoked;

  -[NSLock lock](self->_lock, "lock");
  isInvoked = self->_isInvoked;
  -[NSLock unlock](self->_lock, "unlock");
  return isInvoked;
}

- (void)invoke
{
  NSLock **p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  -[NSLock lock](self->_lock, "lock");
  -[EFInvocationToken _nts_consumeBlocks](self, "_nts_consumeBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isInvoked = 1;
  -[NSLock unlock](*p_lock, "unlock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_nts_consumeBlocks
{
  NSMutableArray *v2;
  NSMutableArray *blocks;

  if (self->_isInvoked)
  {
    v2 = (NSMutableArray *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v2 = self->_blocks;
    blocks = self->_blocks;
    self->_blocks = 0;

  }
  return v2;
}

+ (id)tokenWithLabel:(id)a3 invocationBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabel:", v6);
  objc_msgSend(v8, "addInvocationBlock:", v7);

  return v8;
}

+ (id)tokenWithInvocationBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInvocationBlock:", v4);

  return v5;
}

- (EFInvocationToken)initWithInvocationBlock:(id)a3
{
  id v4;
  EFInvocationToken *v5;
  EFInvocationToken *v6;

  v4 = a3;
  v5 = -[EFInvocationToken initWithLabel:](self, "initWithLabel:", 0);
  v6 = v5;
  if (v5)
    -[EFInvocationToken addInvocationBlock:](v5, "addInvocationBlock:", v4);

  return v6;
}

- (void)removeAllInvocationBlocks
{
  -[NSLock lock](self->_lock, "lock");
  if (!self->_isInvoked)
    -[NSMutableArray removeAllObjects](self->_blocks, "removeAllObjects");
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)addInvocable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__EFInvocationToken_addInvocable___block_invoke;
  v6[3] = &unk_1E62A5860;
  v7 = v4;
  v5 = v4;
  -[EFInvocationToken addInvocationBlock:](self, "addInvocationBlock:", v6);

}

uint64_t __34__EFInvocationToken_addInvocable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

@end
