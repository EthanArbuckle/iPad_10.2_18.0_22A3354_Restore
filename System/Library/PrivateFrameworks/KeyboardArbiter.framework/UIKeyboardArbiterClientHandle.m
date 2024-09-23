@implementation UIKeyboardArbiterClientHandle

void __48___UIKeyboardArbiterClientHandle_didAttachLayer__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE80D38];
  v4 = (void *)a1[4];
  v5 = a2;
  objc_msgSend(v3, "targetWithPid:environmentIdentifier:", objc_msgSend(v4, "processIdentifier"), a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTarget:", v6);

  objc_msgSend(v5, "setInheritingEnvironment:", a1[6]);
  objc_msgSend(MEMORY[0x24BE80BC0], "grantWithNamespace:sourceEnvironment:attributes:", *MEMORY[0x24BEBECC0], a1[6], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdditionalAttributes:", v8);

}

uint64_t __53___UIKeyboardArbiterClientHandle_activeProcessResign__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queue_activeProcessResignWithCompletion:");
}

void __61___UIKeyboardArbiterClientHandle_beginAcquiringFocusOnQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  _OWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _OWORD v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    memset(v11, 0, sizeof(v11));
    _UIArbiterLog();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v4;
    LODWORD(v8) = 12;
    v5 = (_OWORD *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v9, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v11);
    objc_msgSend(v6, "errorWithMessage:", v7);

    if (v5 != v11)
      free(v5);
    objc_msgSend(WeakRetained, "clearAcquiringFocus");
  }

}

void __72___UIKeyboardArbiterClientHandle_takeProcessAssertionOnRemoteWithQueue___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  _OWORD *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _OWORD v13[32];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  memset(v13, 0, sizeof(v13));
  if (a2)
  {
    _UIArbiterLog();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
    v4 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v4;
    LODWORD(v10) = 12;
    v5 = (_OWORD *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v11, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v13);
    objc_msgSend(v6, "debugWithMessage:", v7);
  }
  else
  {
    _UIArbiterLog();
    v8 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v9;
    LODWORD(v10) = 12;
    v5 = (_OWORD *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v11, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v13);
    objc_msgSend(v6, "errorWithMessage:", v7);
  }

  if (v5 != v13)
    free(v5);
}

void __72___UIKeyboardArbiterClientHandle_takeProcessAssertionOnRemoteWithQueue___block_invoke_480(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  _OWORD v16[32];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  memset(v16, 0, sizeof(v16));
  v4 = a3;
  _UIArbiterLog();
  v5 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  v6 = *(_QWORD *)(a1 + 32);
  v12 = 138412546;
  v13 = v6;
  v14 = 2112;
  v15 = v4;
  LODWORD(v11) = 22;
  v7 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v12, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDD17C8]);

  v10 = (void *)objc_msgSend(v9, "initWithUTF8String:", v16);
  objc_msgSend(v8, "errorWithMessage:", v10);

  if (v7 != v16)
    free(v7);
}

void __72___UIKeyboardArbiterClientHandle_takeProcessAssertionOnRemoteWithQueue___block_invoke_484(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  _OWORD v18[32];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 128) - 1;
  *(_QWORD *)(v1 + 128) = v2;
  if (!v2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v4 + 120))
    {
      if (*(_QWORD *)(v4 + 24))
      {
        memset(v18, 0, sizeof(v18));
        _UIArbiterLog();
        v5 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(_QWORD *)(v6 + 120);
        v14 = 138412546;
        v15 = v6;
        v16 = 2048;
        v17 = v7;
        LODWORD(v13) = 22;
        v8 = (_OWORD *)_os_log_send_and_compose_impl();

        +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v14, v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v18);
        objc_msgSend(v9, "errorWithMessage:", v10);

        if (v8 != v18)
          free(v8);
        if (TIGetDisableArbiterConnectionTimeoutValue_onceToken != -1)
          dispatch_once(&TIGetDisableArbiterConnectionTimeoutValue_onceToken, &__block_literal_global_657);
        objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v11, "valueForPreferenceKey:", CFSTR("DisableArbiterConnectionTimeout"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v11) = objc_msgSend(v12, "BOOLValue");
        if ((v11 & 1) == 0)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "invalidate");
      }
    }
  }
}

void __44___UIKeyboardArbiterClientHandle_invalidate__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  _OWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _OWORD v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    memset(v11, 0, sizeof(v11));
    _UIArbiterLog();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v4;
    LODWORD(v8) = 12;
    v5 = (_OWORD *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v9, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v11);
    objc_msgSend(v6, "debugWithMessage:", v7);

    if (v5 != v11)
      free(v5);
  }
}

@end
