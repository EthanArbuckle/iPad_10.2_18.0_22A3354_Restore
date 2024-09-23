@implementation LSSpringBoardCall

void __48___LSSpringBoardCall_callWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "callSpringBoardWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }
  else if (_LSGetOSStatusFromNSError(v5) == -2026)
  {
    objc_msgSend(*(id *)(a1 + 32), "promptAndCallSpringBoardWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __47___LSSpringBoardCall_Private__springBoardQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("LS SpringBoard call queue", v2);
  v1 = (void *)+[_LSSpringBoardCall(Private) springBoardQueue]::result;
  +[_LSSpringBoardCall(Private) springBoardQueue]::result = (uint64_t)v0;

}

void __65___LSSpringBoardCall_Private__springBoardDeadlockPreventionQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("LS SpringBoard sync call deadlock prevention queue", v2);
  v1 = (void *)+[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::result;
  +[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::result = (uint64_t)v0;

}

void __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E1045440;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v2, "openApplication:withOptions:clientHandle:completion:", v3, v4, v5, v6);

}

void __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5 == 0);
  MEMORY[0x186DAF214](v4);

}

void __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "springBoardQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_4;
  v22 = &unk_1E1045490;
  v4 = *(id *)(a1 + 40);
  v5 = *v2;
  v23 = v4;
  v24 = v5;
  v25 = *(id *)(a1 + 48);
  v26 = *(id *)(a1 + 56);
  _LSDispatchWithTimeout(v3, &v19, 10.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "result", v19, v20, v21, v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(v6, "result"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "BOOLValue"),
        v8,
        v7,
        !v9))
  {
    objc_msgSend(v6, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0CB2FE0]) & 1) != 0)
      {
        objc_msgSend(v6, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "code") == 60;

        if (v14)
        {
          _LSDefaultLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_182882000, v15, OS_LOG_TYPE_DEFAULT, "application launch failed - timeout waiting for launch.", buf, 2u);
          }
LABEL_12:

          v17 = *(_QWORD *)(a1 + 64);
          objc_msgSend(v6, "error");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

          goto LABEL_13;
        }
      }
      else
      {

      }
    }
    _LSDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v16;
      _os_log_impl(&dword_182882000, v15, OS_LOG_TYPE_DEFAULT, "application launch failed - received error %@", buf, 0xCu);

    }
    goto LABEL_12;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_13:

}

void __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_5;
  v11[3] = &unk_1E1045468;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v12 = v8;
  v13 = v9;
  v10 = v3;
  v14 = v10;
  objc_msgSend(v4, "openApplication:withOptions:clientHandle:completion:", v5, v6, v7, v11);

}

void __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint8_t buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_5_cold_1(v8, (uint64_t)v6, buf, v7);
    }

    v15 = *MEMORY[0x1E0CB2938];
    v16 = CFSTR("Unable to launch. See logs for more detail.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), 115, (uint64_t)"-[_LSSpringBoardCall(Private) callSpringBoardWithCompletionHandler:]_block_invoke", 271, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v10;
  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v5)
    v12 = v6 == 0;
  else
    v12 = 0;
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v14, v6);

  MEMORY[0x186DAF214]();
}

void __77___LSSpringBoardCall_Private__promptAndCallSpringBoardWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "callSpringBoardWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_5_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138478083;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Request to open %{private}@ failed error: %@", buf, 0x16u);

}

@end
