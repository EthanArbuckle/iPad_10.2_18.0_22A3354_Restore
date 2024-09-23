@implementation NFPromiseSeal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
}

- (NFPromiseSeal)init
{
  NFPromiseSeal *v2;
  NFPromiseSeal *v3;
  uint64_t v4;
  NSMutableArray *handlers;
  NFUnfairLock *v6;
  NFUnfairLock *lock;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NFPromiseSeal;
  v2 = -[NFPromiseSeal init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    v4 = objc_opt_new();
    handlers = v3->_handlers;
    v3->_handlers = (NSMutableArray *)v4;

    v6 = objc_alloc_init(NFUnfairLock);
    lock = v3->_lock;
    v3->_lock = v6;

  }
  return v3;
}

- (void)resolveOn:(id)a3 reject:(id)a4 resolve:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__NFPromiseSeal_resolveOn_reject_resolve___block_invoke;
  v14[3] = &unk_24CE72418;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  -[NFPromiseSeal registerHandler:](self, "registerHandler:", v14);

}

- (void)seal:(id)a3 error:(id)a4 resolution:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[NFPromiseSeal lock](self, "lock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lock");

  if (-[NFPromiseSeal state](self, "state") && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NFPromiseSeal seal:error:resolution:].cold.1();
  if (!-[NFPromiseSeal state](self, "state"))
  {
    -[NFPromiseSeal setState:](self, "setState:", 1);
    v21 = v8;
    -[NFPromiseSeal setValue:](self, "setValue:", v8);
    -[NFPromiseSeal setError:](self, "setError:", v9);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[NFPromiseSeal handlers](self, "handlers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
          -[NFPromiseSeal value](self, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NFPromiseSeal error](self, "error");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, unint64_t, void *, void *))(v16 + 16))(v16, a5, v17, v18);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    -[NFPromiseSeal handlers](self, "handlers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeAllObjects");

    v8 = v21;
  }
  -[NFPromiseSeal lock](self, "lock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unlock");

}

- (unint64_t)state
{
  return self->_state;
}

- (void)registerHandler:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, _BOOL8, void *, void *);

  v11 = (void (**)(id, _BOOL8, void *, void *))a3;
  -[NFPromiseSeal lock](self, "lock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  v5 = -[NFPromiseSeal state](self, "state");
  if (!v5)
  {
    -[NFPromiseSeal handlers](self, "handlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x212BF7858](v11);
    objc_msgSend(v8, "addObject:", v9);
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    -[NFPromiseSeal error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

    -[NFPromiseSeal value](self, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFPromiseSeal error](self, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v7, v8, v9);
LABEL_5:

  }
  -[NFPromiseSeal lock](self, "lock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (NSError)error
{
  return self->_error;
}

- (id)value
{
  return self->_value;
}

void __42__NFPromiseSeal_resolveOn_reject_resolve___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id *v9;
  void *v10;
  id *v11;
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (a2 == 1)
  {
    v10 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __42__NFPromiseSeal_resolveOn_reject_resolve___block_invoke_3;
    v13[3] = &unk_24CE723C8;
    v9 = &v15;
    v15 = *(id *)(a1 + 48);
    v11 = &v14;
    v14 = v8;
    v12 = v13;
    goto LABEL_5;
  }
  if (!a2)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __42__NFPromiseSeal_resolveOn_reject_resolve___block_invoke_2;
    v16[3] = &unk_24CE723C8;
    v9 = &v18;
    v10 = *(void **)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    v11 = &v17;
    v17 = v7;
    v12 = v16;
LABEL_5:
    NFPromiseInvokeOnQueue(v10, v12);

  }
}

uint64_t __42__NFPromiseSeal_resolveOn_reject_resolve___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("pending promise is being deallocated"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_212A0B000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)resolve:(id)a3
{
  -[NFPromiseSeal seal:error:resolution:](self, "seal:error:resolution:", a3, 0, 0);
}

uint64_t __33__NFPromiseSeal_alwaysOn_always___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __33__NFPromiseSeal_alwaysOn_always___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __33__NFPromiseSeal_alwaysOn_always___block_invoke_2;
  v2[3] = &unk_24CE72440;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  NFPromiseInvokeOnQueue(v1, v2);

}

- (NFPromiseSeal)initWithValue:(id)a3
{
  id v5;
  NFPromiseSeal *v6;
  NFPromiseSeal *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPromiseSeal;
  v6 = -[NFPromiseSeal init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_value, a3);
    v7->_state = 1;
  }

  return v7;
}

- (void)alwaysOn:(id)a3 always:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __33__NFPromiseSeal_alwaysOn_always___block_invoke;
  v10[3] = &unk_24CE72468;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NFPromiseSeal registerHandler:](self, "registerHandler:", v10);

}

- (NFPromiseSeal)initWithError:(id)a3
{
  id v5;
  NFPromiseSeal *v6;
  NFPromiseSeal *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPromiseSeal;
  v6 = -[NFPromiseSeal init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_state = 1;
  }

  return v7;
}

- (void)reject:(id)a3
{
  -[NFPromiseSeal seal:error:resolution:](self, "seal:error:resolution:", 0, a3, 1);
}

uint64_t __42__NFPromiseSeal_resolveOn_reject_resolve___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (void)seal:error:resolution:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Seal must be pending to seal"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_212A0B000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

@end
