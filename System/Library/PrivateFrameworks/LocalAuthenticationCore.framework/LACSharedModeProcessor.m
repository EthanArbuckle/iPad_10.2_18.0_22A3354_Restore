@implementation LACSharedModeProcessor

- (LACSharedModeProcessor)initWithReplyQueue:(id)a3 dataSource:(id)a4 policyTraitsManager:(id)a5 policyCoordinator:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LACSharedModeProcessor *v15;
  LACSharedModeProcessor *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LACSharedModeProcessor;
  v15 = -[LACSharedModeProcessor init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_replyQueue, a3);
    objc_storeStrong((id *)&v16->_dataSource, a4);
    objc_storeStrong((id *)&v16->_policyTraitsManager, a5);
    objc_storeStrong((id *)&v16->_policyCoordinator, a6);
  }

  return v16;
}

- (BOOL)canProcessRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  BOOL v10;
  int v12;
  LACSharedModeProcessor *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "acl");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "acl"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = +[LACAccessControl checkACLAllowsAll:](LACAccessControl, "checkACLAllowsAll:", v7),
        v7,
        v6,
        v8))
  {
    LACLogSharedMode();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = self;
      _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ not needed for this request type", (uint8_t *)&v12, 0xCu);
    }

    v10 = 0;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  LACSharedModeProcessor *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[LACSharedModeProcessor canProcessRequest:](self, "canProcessRequest:", v8))
  {
    LACLogSharedMode();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = self;
      _os_log_impl(&dword_2409DC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will start", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __66__LACSharedModeProcessor_processRequest_configuration_completion___block_invoke;
    v13[3] = &unk_2510C0B08;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v10;
    v14 = v8;
    -[LACSharedModeProcessor _processRequest:completion:](self, "_processRequest:completion:", v14, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    +[LACEvaluationResult resultWithNext:](LACEvaluationResult, "resultWithNext:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v12);

  }
}

void __66__LACSharedModeProcessor_processRequest_configuration_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  LACLogSharedMode();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v6 = 138543362;
    v7 = WeakRetained;
    _os_log_impl(&dword_2409DC000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish", (uint8_t *)&v6, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 40);
  +[LACEvaluationResult resultWithNext:](LACEvaluationResult, "resultWithNext:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

}

- (void)_processRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  LACSharedModeDataSource *dataSource;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  dataSource = self->_dataSource;
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __53__LACSharedModeProcessor__processRequest_completion___block_invoke;
  v16[3] = &unk_2510C1448;
  v10 = v6;
  v17 = v10;
  __53__LACSharedModeProcessor__processRequest_completion___block_invoke((uint64_t)v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __53__LACSharedModeProcessor__processRequest_completion___block_invoke_2;
  v13[3] = &unk_2510C1168;
  objc_copyWeak(&v15, &location);
  v12 = v7;
  v14 = v12;
  -[LACSharedModeDataSource fetchSharedModeWithOptions:completion:](dataSource, "fetchSharedModeWithOptions:completion:", v11, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

LACMutableSharedModeDataSourceRequestOptions *__53__LACSharedModeProcessor__processRequest_completion___block_invoke(uint64_t a1)
{
  LACMutableSharedModeDataSourceRequestOptions *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(LACMutableSharedModeDataSourceRequestOptions);
  objc_msgSend(*(id *)(a1 + 32), "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACMutableSharedModeDataSourceRequestOptions setIsPreflight:](v2, "setIsPreflight:", objc_msgSend(v5, "BOOLValue"));

  return v2;
}

void __53__LACSharedModeProcessor__processRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_msgSend(*((id *)WeakRetained + 4), "policyTraitsForSharedMode:", v3);
    v7 = (void *)v5[3];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__LACSharedModeProcessor__processRequest_completion___block_invoke_3;
    v8[3] = &unk_2510C1470;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "updatePolicyEvaluationWithTraits:completion:", v6, v8);

    objc_destroyWeak(&v10);
  }

}

void __53__LACSharedModeProcessor__processRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  id WeakRetained;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LACLogSharedMode();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = 138543618;
    v8 = WeakRetained;
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_2409DC000, v4, v5, "%{public}@ Policy update for shared mode finished err=%{public}@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyTraitsManager, 0);
  objc_storeStrong((id *)&self->_policyCoordinator, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

@end
