@implementation LAContextUIHelper

- (void)dealloc
{
  id WeakRetained;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  LAContextUIHelper *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_ui);
  objc_msgSend(WeakRetained, "dismiss");

  LA_LOG();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_22FE91000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocated", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)LAContextUIHelper;
  -[LAContextUIHelper dealloc](&v5, sel_dealloc);
}

- (void)authenticateWithOptions:(id)a3 availableMechanisms:(id)a4 hostVC:(id)a5 context:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  LAAuthorizationViewController **p_ui;
  id WeakRetained;
  void *v19;
  LAAuthorizationViewController *v20;
  uint64_t v21;
  void *v22;
  LAAuthorizationViewController *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  void (**v28)(id, _QWORD, void *);
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a7;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  p_ui = &self->_ui;
  WeakRetained = objc_loadWeakRetained((id *)p_ui);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDDA9C8], "errorWithCode:message:", -1008, CFSTR("Another interactive authentication is ongoing"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v19);

  }
  else
  {
    v20 = [LAAuthorizationViewController alloc];
    v21 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __86__LAContextUIHelper_authenticateWithOptions_availableMechanisms_hostVC_context_reply___block_invoke;
    v29[3] = &unk_24FDCD730;
    v30 = v13;
    v31 = v15;
    v32 = v12;
    __86__LAContextUIHelper_authenticateWithOptions_availableMechanisms_hostVC_context_reply___block_invoke((uint64_t)v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v21;
    v25 = 3221225472;
    v26 = __86__LAContextUIHelper_authenticateWithOptions_availableMechanisms_hostVC_context_reply___block_invoke_2;
    v27 = &unk_24FDCD758;
    v28 = v16;
    v23 = -[LAAuthorizationViewController initWithConfiguration:completion:](v20, "initWithConfiguration:completion:", v22, &v24);

    -[LAAuthorizationViewController presentInContainerViewController:](v23, "presentInContainerViewController:", v14, v24, v25, v26, v27);
    objc_storeWeak((id *)p_ui, v23);

  }
}

id __86__LAContextUIHelper_authenticateWithOptions_availableMechanisms_hostVC_context_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(MEMORY[0x24BE60818], "buildWithAvailableMechanisms:", *(_QWORD *)(a1 + 32));
  v3 = objc_alloc(MEMORY[0x24BE60810]);
  objc_msgSend(*(id *)(a1 + 40), "externalizedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithContext:requirement:options:", v4, v2, *(_QWORD *)(a1 + 48));

  return v5;
}

void __86__LAContextUIHelper_authenticateWithOptions_availableMechanisms_hostVC_context_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  __CFString *v7;
  uint64_t v8;
  uint8_t buf[4];
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LA_LOG();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v5, v6))
      goto LABEL_8;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(err=%@)"), v3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v6 = OS_LOG_TYPE_DEFAULT;
    v7 = CFSTR("successfully");
  }
  *(_DWORD *)buf = 138543362;
  v10 = v7;
  _os_log_impl(&dword_22FE91000, v5, v6, "Authorization sheet finished %{public}@", buf, 0xCu);
  if (v3)

LABEL_8:
  if (v3)
    v8 = 0;
  else
    v8 = MEMORY[0x24BDBD1B8];
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v8, v3);

}

- (void)cancel
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  LAContextUIHelper *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  LA_LOG();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_22FE91000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelled", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_ui);
  objc_msgSend(WeakRetained, "dismiss");

}

- (void)contextDidBecomeInvalid:(id)a3
{
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    -[LAContextUIHelper cancel](self, "cancel");
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__LAContextUIHelper_contextDidBecomeInvalid___block_invoke;
    block[3] = &unk_24FDCD780;
    objc_copyWeak(&v7, &location);
    v6 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __45__LAContextUIHelper_contextDidBecomeInvalid___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "contextDidBecomeInvalid:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ui);
}

@end
