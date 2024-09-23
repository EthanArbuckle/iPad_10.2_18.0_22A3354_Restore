@implementation DMFOSStateHandler

- (DMFOSStateHandler)initWithQueue:(id)a3 name:(id)a4 stateHandlerBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  DMFOSStateHandler *v11;
  uint64_t v12;
  id block;
  uint64_t v14;
  NSString *name;
  id v17;
  id v18;
  id location;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)DMFOSStateHandler;
  v11 = -[DMFOSStateHandler init](&v20, sel_init);
  if (v11)
  {
    v12 = MEMORY[0x1BCCB7F34](v10);
    block = v11->_block;
    v11->_block = (id)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    objc_initWeak(&location, v11);
    objc_copyWeak(&v18, &location);
    v17 = v8;
    v11->_handle = os_state_add_handler();

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

uint64_t __58__DMFOSStateHandler_initWithQueue_name_stateHandlerBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD block[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) == 2)
  {
    v5 = (void *)os_transaction_create();
    v6 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__DMFOSStateHandler_initWithQueue_name_stateHandlerBlock___block_invoke_2;
    block[3] = &unk_1E6ED7D40;
    v11 = v5;
    v7 = v5;
    dispatch_async(v6, block);
    v8 = objc_msgSend(WeakRetained, "_serializeState");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (os_state_data_s)_serializeState
{
  void (**v3)(void);
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  os_state_data_s *v8;
  uint64_t v9;
  void *v10;
  id v12;

  -[DMFOSStateHandler block](self, "block");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    v7 = objc_msgSend(v5, "length");
    if ((unint64_t)(v7 + 200) < 0x8000)
    {
      v9 = v7;
      v8 = (os_state_data_s *)malloc_type_calloc(1uLL, v7 + 200, 0xED55C9D0uLL);
      v8->var0 = 1;
      v8->var1.var1 = v9;
      -[DMFOSStateHandler name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getCString:maxLength:encoding:", v8->var3, 64, 4);

      objc_msgSend(v5, "getBytes:length:", v8->var4, v9);
      goto LABEL_9;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DMFOSStateHandler _serializeState].cold.2(self);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[DMFOSStateHandler _serializeState].cold.1(self, (uint64_t)v6);
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)DMFOSStateHandler;
  -[DMFOSStateHandler dealloc](&v3, sel_dealloc);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)handle
{
  return self->_handle;
}

- (void)setHandle:(unint64_t)a3
{
  self->_handle = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_block, 0);
}

- (void)_serializeState
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl(&dword_1B8C0C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Can't encode os_state data '%{public}@', too large", (uint8_t *)&v2, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

@end
