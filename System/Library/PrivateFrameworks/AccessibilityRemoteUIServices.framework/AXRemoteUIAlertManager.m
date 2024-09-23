@implementation AXRemoteUIAlertManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance__sharedInstance;
}

void __40__AXRemoteUIAlertManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXRemoteUIAlertManager _init]([AXRemoteUIAlertManager alloc], "_init");
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

- (id)_init
{
  AXRemoteUIAlertManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXRemoteUIAlertManager;
  v2 = -[AXRemoteUIAlertManager init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[AXRemoteUIAlertManager setRemoteCallbackHolders:](v2, "setRemoteCallbackHolders:", v3);

  }
  return v2;
}

- (void)presentRemoteUIAlertWithIdentifier:(id)a3 viewControllerClassName:(id)a4 userInfo:(id)a5 presentationHandler:(id)a6 dismissalHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  const __CFString *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *))a7;
  -[AXRemoteUIAlertManager remoteCallbackHolders](self, "remoteCallbackHolders");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v33 = v14;
    v34 = v13;
    v35 = v12;
    v19 = (void *)objc_opt_new();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[AXRemoteUIAlertManager remoteCallbackHolders](self, "remoteCallbackHolders");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          -[AXRemoteUIAlertManager remoteCallbackHolders](self, "remoteCallbackHolders", v33, v34, v35);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "remoteAlertHandle");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "invalidate");

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v22);
    }

    v29 = v19;
    AXPerformBlockOnMainThread();
    AXPerformBlockOnMainThread();
    if (v16)
    {
      v30 = (void *)MEMORY[0x24BDD1540];
      v40 = *MEMORY[0x24BDD0FC8];
      v41 = CFSTR("dismissing existing remote UI alert");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AccessibilityRemoteUIServices"), -110, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, v32);

    }
    v13 = v34;
    v12 = v35;
    v14 = v33;
  }
  else
  {
    -[AXRemoteUIAlertManager _sbs_presentRemoteUIAlertWithIdentifier:viewControllerClassName:userInfo:presentationHandler:dismissalHandler:](self, "_sbs_presentRemoteUIAlertWithIdentifier:viewControllerClassName:userInfo:presentationHandler:dismissalHandler:", v12, v13, v14, v15, v16);
  }

}

void __131__AXRemoteUIAlertManager_presentRemoteUIAlertWithIdentifier_viewControllerClassName_userInfo_presentationHandler_dismissalHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "remoteCallbackHolders", (_QWORD)v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "dismissalHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "dismissalHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void (**)(_QWORD, _QWORD))objc_msgSend(v11, "copy");

          v12[2](v12, 0);
        }
        objc_msgSend(*(id *)(a1 + 40), "remoteCallbackHolders");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectForKey:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

void __131__AXRemoteUIAlertManager_presentRemoteUIAlertWithIdentifier_viewControllerClassName_userInfo_presentationHandler_dismissalHandler___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "remoteCallbackHolders");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (void)_sbs_presentRemoteUIAlertWithIdentifier:(id)a3 viewControllerClassName:(id)a4 userInfo:(id)a5 presentationHandler:(id)a6 dismissalHandler:(id)a7
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v12 = (objc_class *)MEMORY[0x24BEB0AE8];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_msgSend([v12 alloc], "initWithServiceName:viewControllerClassName:", v17, v16);

  v19 = objc_alloc_init(MEMORY[0x24BEB0AD0]);
  v20 = (void *)objc_msgSend(MEMORY[0x24BEB0AF8], "newHandleWithDefinition:configurationContext:", v18, v19);
  objc_msgSend(v20, "registerObserver:", self);
  objc_msgSend(v20, "handleID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x24BEB0AC8]);
  v23 = (id)MEMORY[0x24BDBD1B8];
  if (v15)
    v23 = v15;
  v27[0] = CFSTR("userInfo");
  v27[1] = CFSTR("handleId");
  v28[0] = v23;
  v28[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUserInfo:", v24);

  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setPresentationHandler:", v14);

  objc_msgSend(v25, "setDismissalHandler:", v13);
  objc_msgSend(v25, "setRemoteAlertHandle:", v20);
  -[AXRemoteUIAlertManager remoteCallbackHolders](self, "remoteCallbackHolders");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v21);

  objc_msgSend(v20, "activateWithContext:", v22);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3;
  void *v4;

  objc_msgSend(a3, "handleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  AXPerformBlockOnMainThread();

}

void __55__AXRemoteUIAlertManager_remoteAlertHandleDidActivate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "remoteCallbackHolders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "presentationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "presentationHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v3;
  void *v4;

  objc_msgSend(a3, "handleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  AXPerformBlockOnMainThread();

}

void __57__AXRemoteUIAlertManager_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "remoteCallbackHolders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dismissalHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v7, "dismissalHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void (**)(_QWORD, _QWORD))objc_msgSend(v4, "copy");

    v5[2](v5, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "remoteCallbackHolders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (NSMutableDictionary)remoteCallbackHolders
{
  return self->_remoteCallbackHolders;
}

- (void)setRemoteCallbackHolders:(id)a3
{
  objc_storeStrong((id *)&self->_remoteCallbackHolders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCallbackHolders, 0);
}

@end
