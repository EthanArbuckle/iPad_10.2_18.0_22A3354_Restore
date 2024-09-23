@implementation FCInterestToken

- (void).cxx_destruct
{
  objc_storeStrong(&self->_removeInterestBlock, 0);
}

+ (FCInterestToken)interestTokenWithRemoveInterestBlock:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCallbackQueue:removeInterestBlock:", 0, v3);

  return (FCInterestToken *)v4;
}

- (FCInterestToken)initWithCallbackQueue:(id)a3 removeInterestBlock:(id)a4
{
  id v6;
  id v7;
  FCInterestToken *v8;
  void *v9;
  id removeInterestBlock;
  id v11;
  void *v12;
  void *v14;
  _QWORD aBlock[4];
  id v16;
  id v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "removeInterestBlock != nil");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCInterestToken initWithCallbackQueue:removeInterestBlock:]";
    v21 = 2080;
    v22 = "FCInterestToken.m";
    v23 = 1024;
    v24 = 44;
    v25 = 2114;
    v26 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v18.receiver = self;
  v18.super_class = (Class)FCInterestToken;
  v8 = -[FCInterestToken init](&v18, sel_init);
  if (v8)
  {
    if (v6)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __61__FCInterestToken_initWithCallbackQueue_removeInterestBlock___block_invoke;
      aBlock[3] = &unk_1E463B790;
      v16 = v6;
      v17 = v7;
      v9 = _Block_copy(aBlock);
      removeInterestBlock = v8->_removeInterestBlock;
      v8->_removeInterestBlock = v9;

      v11 = v16;
    }
    else
    {
      v12 = _Block_copy(v7);
      v11 = v8->_removeInterestBlock;
      v8->_removeInterestBlock = v12;
    }

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  (*((void (**)(void))self->_removeInterestBlock + 2))();
  v3.receiver = self;
  v3.super_class = (Class)FCInterestToken;
  -[FCInterestToken dealloc](&v3, sel_dealloc);
}

- (FCInterestToken)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCInterestToken init]";
    v9 = 2080;
    v10 = "FCInterestToken.m";
    v11 = 1024;
    v12 = 39;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCInterestToken init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

void __61__FCInterestToken_initWithCallbackQueue_removeInterestBlock___block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
}

+ (FCInterestToken)interestTokenWithCallbackQueue:(id)a3 removeInterestBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCallbackQueue:removeInterestBlock:", v6, v5);

  return (FCInterestToken *)v7;
}

- (id)removeInterestBlock
{
  return self->_removeInterestBlock;
}

- (void)setRemoveInterestBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
