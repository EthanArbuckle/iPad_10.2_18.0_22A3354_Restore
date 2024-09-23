@implementation LAContext

void __83__LAContext_UI__evaluateAccessControl_operation_options_presentationContext_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16[3];

  v5 = a2;
  v6 = a3;
  if (v6 && !*(_BYTE *)(a1 + 88) && (objc_msgSend(MEMORY[0x24BDDA9C8], "error:hasCode:", v6, -1004) & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __83__LAContext_UI__evaluateAccessControl_operation_options_presentationContext_reply___block_invoke_2;
    v10[3] = &unk_24FDCD668;
    objc_copyWeak(v16, (id *)(a1 + 64));
    v7 = *(id *)(a1 + 32);
    v8 = *(void **)(a1 + 72);
    v9 = *(void **)(a1 + 80);
    v11 = v7;
    v16[1] = v8;
    v16[2] = v9;
    v12 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 56);
    v13 = v6;
    v14 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

    objc_destroyWeak(v16);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __83__LAContext_UI__evaluateAccessControl_operation_options_presentationContext_reply___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  LAContextUIHelper *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28[3];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    LAViewControllerForPresentationContext(*(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc_init(LAContextUIHelper);
      objc_msgSend(WeakRetained, "setUiHelper:", v5);
      objc_msgSend(WeakRetained, "addContextObserver:", v5);
      LA_LOG();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 80);
        v8 = *(_QWORD *)(a1 + 88);
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v30 = v7;
        v31 = 1024;
        v32 = v8;
        v33 = 2114;
        v34 = v9;
        v35 = 2112;
        v36 = WeakRetained;
        _os_log_impl(&dword_22FE91000, v6, OS_LOG_TYPE_DEFAULT, "evaluateAccessControl:%{public}@ operation:%d options:%{public}@ on %@", buf, 0x26u);
      }

      v10 = objc_alloc(MEMORY[0x24BDDA938]);
      objc_msgSend(WeakRetained, "externalizedContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithExternalizedContext:", v11);

      objc_msgSend(*(id *)(a1 + 48), "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDDA8F8]);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = (void *)MEMORY[0x24BDBD1A8];
      if (v14)
        v16 = (void *)v14;
      v17 = v16;

      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __83__LAContext_UI__evaluateAccessControl_operation_options_presentationContext_reply___block_invoke_3;
      v22[3] = &unk_24FDCD640;
      objc_copyWeak(v28, v2);
      v18 = *(id *)(a1 + 40);
      v19 = *(void **)(a1 + 80);
      v23 = v18;
      v28[1] = v19;
      v24 = v4;
      v20 = v12;
      v21 = *(void **)(a1 + 88);
      v25 = v20;
      v28[2] = v21;
      v26 = *(id *)(a1 + 56);
      v27 = *(id *)(a1 + 64);
      objc_msgSend(WeakRetained, "_validateAvailableMechanims:completion:", v17, v22);

      objc_destroyWeak(v28);
    }
    else
    {
      objc_msgSend(WeakRetained, "evaluateAccessControl:operation:options:reply:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
    }

  }
}

void __83__LAContext_UI__evaluateAccessControl_operation_options_presentationContext_reply___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_authenticateWithOptions:acl:availableMechanisms:hostVC:context:operation:updatedOptions:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __112__LAContext_UI___authenticateWithOptions_acl_availableMechanisms_hostVC_context_operation_updatedOptions_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  os_log_type_t v8;
  id WeakRetained;
  void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LA_LOG();
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v8 = LALogTypeForInternalError();
  else
    v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v7, v8))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v10 = WeakRetained;
    v11 = CFSTR("successfully");
    if (v6)
      v11 = v6;
    v14 = 138412546;
    v15 = WeakRetained;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_22FE91000, v7, v8, "evaluateAccessControl on %@ finished %{public}@", (uint8_t *)&v14, 0x16u);

  }
  v12 = objc_loadWeakRetained((id *)(a1 + 48));
  v13 = v12;
  if (v12)
  {
    if (v6)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    else
      objc_msgSend(v12, "evaluateAccessControl:operation:options:reply:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __56__LAContext_UI___validateAvailableMechanims_completion___block_invoke(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v4;
  id v5;
  char v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__LAContext_UI___validateAvailableMechanims_completion___block_invoke_2;
  block[3] = &unk_24FDCD6E0;
  v6 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __56__LAContext_UI___validateAvailableMechanims_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 48))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(v2, "removeObject:", &unk_24FDDD958);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

@end
