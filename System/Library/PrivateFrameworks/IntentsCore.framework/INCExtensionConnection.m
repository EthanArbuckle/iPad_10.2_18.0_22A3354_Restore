@implementation INCExtensionConnection

- (INCExtensionConnection)initWithIntent:(id)a3
{
  return -[INCExtensionConnection initWithIntent:supportedExtensionTypes:remoteProxyProvider:](self, "initWithIntent:supportedExtensionTypes:remoteProxyProvider:", a3, 7, 0);
}

- (INCExtensionConnection)initWithIntent:(id)a3 supportedExtensionTypes:(int64_t)a4 remoteProxyProvider:(id)a5
{
  return -[INCExtensionConnection initWithIntent:supportedExtensionTypes:donateInteraction:groupIdentifier:remoteProxyProvider:](self, "initWithIntent:supportedExtensionTypes:donateInteraction:groupIdentifier:remoteProxyProvider:", a3, a4, 1, 0, a5);
}

- (INCExtensionConnection)initWithIntent:(id)a3 supportedExtensionTypes:(int64_t)a4 donateInteraction:(BOOL)a5 groupIdentifier:(id)a6 remoteProxyProvider:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  INCExtensionConnection *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  INCExtensionTransaction *v18;
  INCExtensionTransaction *transaction;
  INCAppProxy *v20;
  INCAppProxy *appProxy;
  unint64_t v22;
  INCDisplayLayoutMonitorObserver *v23;
  INCDisplayLayoutMonitorObserver *layoutObserver;
  INCDisplayLayoutMonitorObserver *v25;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v9 = a5;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v30.receiver = self;
  v30.super_class = (Class)INCExtensionConnection;
  v15 = -[INCExtensionConnection init](&v30, sel_init);
  if (v15)
  {
    v16 = dispatch_queue_create("INCExtensionConnectionQueue", 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    v18 = -[INCExtensionTransaction initWithIntent:donateInteraction:groupIdentifier:]([INCExtensionTransaction alloc], "initWithIntent:donateInteraction:groupIdentifier:", v12, v9, v13);
    transaction = v15->_transaction;
    v15->_transaction = v18;

    v15->_requestTimeoutInterval = 10.0;
    v20 = -[INCAppProxy _initWithConnection:]([INCAppProxy alloc], "_initWithConnection:", v15);
    appProxy = v15->_appProxy;
    v15->_appProxy = v20;

    v15->_supportedExtensionTypes = a4;
    v15->_appProtectionPolicy = INThisProcessIsAssistantd();
    -[INCExtensionConnection setRemoteExtensionProxyProvider:](v15, "setRemoteExtensionProxyProvider:", v14);
    v22 = objc_msgSend(v12, "_executionContext");
    if (v22 <= 9 && ((1 << v22) & 0x304) != 0)
      -[INCExtensionConnection setRequiresTCC:](v15, "setRequiresTCC:", 0);
    v23 = objc_alloc_init(INCDisplayLayoutMonitorObserver);
    layoutObserver = v15->_layoutObserver;
    v15->_layoutObserver = v23;

    objc_initWeak(&location, v15);
    v25 = v15->_layoutObserver;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __119__INCExtensionConnection_initWithIntent_supportedExtensionTypes_donateInteraction_groupIdentifier_remoteProxyProvider___block_invoke;
    v27[3] = &unk_1E6BC41B8;
    objc_copyWeak(&v28, &location);
    -[INCDisplayLayoutMonitorObserver setHandler:](v25, "setHandler:", v27);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)setRemoteExtensionProxyProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)resumeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6BC4AB8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v8);
  dispatch_async(queue, v7);

}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  id v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void (**v33)(_QWORD);
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  void (**v43)(_QWORD);
  _QWORD v44[4];
  __CFString *v45;
  __CFString *v46;
  uint64_t v47;
  id v48;
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_transaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "extensionInputItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "extensionInputItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setExtensionInputItems:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "intent");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = (os_log_t *)MEMORY[0x1E0CBD670];
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v51 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
    v52 = 2112;
    v53 = v6;
    _os_log_impl(&dword_1B727D000, v8, OS_LOG_TYPE_INFO, "%s Resuming connection for intent: %@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "supportedExtensionTypes") & 4) != 0)
  {
    +[INCLocalExtensionRegistry sharedInstance](INCLocalExtensionRegistry, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localExtensionForIdentifier:", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v13 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    v14 = CFSTR("YES");
    if (!v11)
      v14 = CFSTR("NO");
    *(_DWORD *)buf = 136315394;
    v51 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
    v52 = 2112;
    v53 = v14;
    _os_log_impl(&dword_1B727D000, v13, OS_LOG_TYPE_INFO, "%s Local extension: %@", buf, 0x16u);
  }
  if (!v11)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "supportedExtensionTypes") & 2) != 0)
    {
      +[INCExtensionPlugInBundleManager sharedManager](INCExtensionPlugInBundleManager, "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "intent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "extensionForIntent:", v22);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v23 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v51 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
          v52 = 2112;
          v53 = v18;
          v54 = 2112;
          v55 = v10;
          _os_log_impl(&dword_1B727D000, v23, OS_LOG_TYPE_INFO, "%s Found plug in bundle extension extension %@ for identifier: %@", buf, 0x20u);
        }
        v24 = objc_alloc(MEMORY[0x1E0CBDD20]);
        objc_msgSend(v3, "extensionInputItems");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (__CFString *)objc_msgSend(v24, "initWithInputItems:extension:", v25, v18);

        v26 = *(_QWORD *)(a1 + 40);
        if (v26)
        {
          v27 = -[INCExtensionProxy _initWithConnection:extension:vendorRemote:auditTokenValue:]([INCExtensionProxy alloc], "_initWithConnection:extension:vendorRemote:auditTokenValue:", *(_QWORD *)(a1 + 32), 0, v20, 0);
          (*(void (**)(uint64_t, id, _QWORD))(v26 + 16))(v26, v27, 0);

        }
        goto LABEL_32;
      }
    }
    v28 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1B727D000, v28, OS_LOG_TYPE_INFO, "%s Checking if the app can handle intent using in-app intent handling", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CBD730], "appInfoWithIntent:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_26;
    v44[3] = &unk_1E6BC4280;
    v45 = v6;
    v18 = v29;
    v46 = v18;
    v31 = *(id *)(a1 + 40);
    v32 = *(_QWORD *)(a1 + 32);
    v49 = v31;
    v47 = v32;
    v48 = v3;
    v33 = (void (**)(_QWORD))MEMORY[0x1BCCA5FB8](v44);
    if (objc_msgSend(*(id *)(a1 + 32), "appProtectionPolicy") != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "intent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "didAuthenticateAppProtection");

      if ((v35 & 1) == 0)
      {
        v36 = (void *)MEMORY[0x1E0CF9688];
        -[__CFString applicationIdentifier](v18, "applicationIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "applicationWithBundleIdentifier:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v38, "isLocked"))
        {
          objc_msgSend(MEMORY[0x1E0CF9690], "sharedGuard");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v41[0] = v30;
          v41[1] = 3221225472;
          v41[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_2_46;
          v41[3] = &unk_1E6BC42D0;
          v40 = *(void **)(a1 + 40);
          v41[4] = *(_QWORD *)(a1 + 32);
          v42 = v40;
          v43 = v33;
          objc_msgSend(v39, "getIsChallengeCurrentlyRequiredForSubject:completion:", v38, v41);

LABEL_31:
          v20 = v45;
          goto LABEL_32;
        }

      }
    }
    v33[2](v33);
    goto LABEL_31;
  }
  v15 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v51 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
    v52 = 2112;
    v53 = v11;
    v54 = 2112;
    v55 = v10;
    _os_log_impl(&dword_1B727D000, v15, OS_LOG_TYPE_INFO, "%s Found local extension %@ for identifier: %@", buf, 0x20u);
  }
  v16 = objc_alloc(MEMORY[0x1E0CBDD20]);
  objc_msgSend(v3, "extensionInputItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (__CFString *)objc_msgSend(v16, "initWithInputItems:privateIntentHandlerProvider:", v17, v11);

  v19 = *(_QWORD *)(a1 + 40);
  if (v19)
  {
    v20 = -[INCExtensionProxy _initWithConnection:extension:vendorRemote:auditTokenValue:]([INCExtensionProxy alloc], "_initWithConnection:extension:vendorRemote:auditTokenValue:", *(_QWORD *)(a1 + 32), 0, v18, 0);
    (*(void (**)(uint64_t, __CFString *, _QWORD))(v19 + 16))(v19, v20, 0);
LABEL_32:

  }
}

- (INCExtensionTransaction)_transaction
{
  return self->_transaction;
}

- (NSArray)extensionInputItems
{
  return self->_extensionInputItems;
}

- (INIntent)intent
{
  return -[INCExtensionTransaction currentIntent](self->_transaction, "currentIntent");
}

- (int64_t)supportedExtensionTypes
{
  return self->_supportedExtensionTypes;
}

- (OS_dispatch_queue)_queue
{
  return self->_queue;
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _INCOptionalLocalExtension *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject **v12;
  NSObject *v13;
  uint64_t v14;
  _INCOptionalLocalExtension *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  dispatch_block_t v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[5];
  _BYTE v46[32];
  uint8_t buf[40];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || (v11 = *(void **)(a1 + 40)) == 0)
  {
    if (!*(_QWORD *)(a1 + 80))
      return;
    if (objc_msgSend(*(id *)(a1 + 48), "_type") != 2
      || (objc_msgSend(*(id *)(a1 + 48), "_codableDescription"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          v3 = objc_msgSend(v2, "isEligibleForWidgets"),
          v2,
          !v3))
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80), 0, *(_QWORD *)(a1 + 32));
      return;
    }
    v4 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke_2";
      _os_log_impl(&dword_1B727D000, v4, OS_LOG_TYPE_INFO, "%s Returning an optional local extension for the provided widget intent", buf, 0xCu);
    }
    v5 = objc_alloc_init(_INCOptionalLocalExtension);
    v6 = objc_alloc(MEMORY[0x1E0CBDD20]);
    objc_msgSend(*(id *)(a1 + 56), "extensionInputItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithInputItems:privateIntentHandlerProvider:", v7, v5);

    v9 = *(_QWORD *)(a1 + 80);
    v10 = -[INCExtensionProxy _initWithConnection:extension:vendorRemote:auditTokenValue:]([INCExtensionProxy alloc], "_initWithConnection:extension:vendorRemote:auditTokenValue:", *(_QWORD *)(a1 + 64), 0, v8, 0);
    (*(void (**)(uint64_t, id, _QWORD))(v9 + 16))(v9, v10, 0);

  }
  else
  {
    v12 = (NSObject **)MEMORY[0x1E0CBD670];
    v13 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_1B727D000, v13, OS_LOG_TYPE_INFO, "%s Completed extension request with: %@", buf, 0x16u);
      v11 = *(void **)(a1 + 40);
    }
    objc_msgSend(v11, "_auxiliaryConnection");
    v15 = (_INCOptionalLocalExtension *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
    memset(buf, 0, 32);
    if (v15)
      -[_INCOptionalLocalExtension auditToken](v15, "auditToken");
    objc_msgSend(*(id *)(a1 + 72), "_extensionBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(a1 + 48);
    *(_OWORD *)v46 = *(_OWORD *)buf;
    *(_OWORD *)&v46[16] = *(_OWORD *)&buf[16];
    objc_msgSend(v17, "trimDataAgainstTCCForAuditToken:bundle:", v46, v8);
    v18 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_31;
    v45[3] = &unk_1E6BC49F0;
    v45[4] = *(_QWORD *)(a1 + 64);
    v19 = (void *)MEMORY[0x1BCCA5FB8](v45);
    v20 = *v12;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)v46 = 136315394;
      *(_QWORD *)&v46[4] = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke_3";
      *(_WORD *)&v46[12] = 2112;
      *(_QWORD *)&v46[14] = v21;
      _os_log_impl(&dword_1B727D000, v20, OS_LOG_TYPE_INFO, "%s Getting vendor remote for extension: %@", v46, 0x16u);
    }
    v42[0] = v18;
    v42[1] = 3221225472;
    v42[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_35;
    v42[3] = &unk_1E6BC4208;
    v22 = v16;
    v43 = v22;
    v23 = v19;
    v44 = v23;
    -[_INCOptionalLocalExtension remoteObjectProxyWithErrorHandler:](v5, "remoteObjectProxyWithErrorHandler:", v42);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v18;
    v39[1] = 3221225472;
    v39[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_36;
    v39[3] = &unk_1E6BC4AB8;
    v40 = v22;
    v41 = v23;
    v25 = v23;
    v26 = v22;
    -[_INCOptionalLocalExtension setInterruptionHandler:](v5, "setInterruptionHandler:", v39);
    objc_msgSend(*(id *)(a1 + 64), "_takeAssertionsForIntent:extensionBundleIdentifier:processIdentifier:", *(_QWORD *)(a1 + 48), v26, -[_INCOptionalLocalExtension processIdentifier](v5, "processIdentifier"));
    objc_msgSend(*(id *)(a1 + 64), "_queue");
    v27 = objc_claimAutoreleasedReturnValue();
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_37;
    block[3] = &unk_1E6BC4230;
    v28 = *(id *)(a1 + 80);
    v29 = *(_QWORD *)(a1 + 64);
    v30 = *(void **)(a1 + 72);
    v36 = v28;
    block[4] = v29;
    v34 = v30;
    v35 = v24;
    v37 = *(_OWORD *)buf;
    v38 = *(_OWORD *)&buf[16];
    v31 = v24;
    v32 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v27, v32);

  }
}

- (void)_takeAssertionsForIntent:(id)a3 extensionBundleIdentifier:(id)a4 processIdentifier:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v5 = *(_QWORD *)&a5;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((_DWORD)v5)
  {
    -[INCExtensionConnection _takeInUseAssertionForIntent:extensionBundleIdentifier:](self, "_takeInUseAssertionForIntent:extensionBundleIdentifier:", v8, v9);
    -[INCExtensionConnection _takeRunningBoardAssertionForProcessIdentifier:](self, "_takeRunningBoardAssertionForProcessIdentifier:", v5);
  }
  else
  {
    v10 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[INCExtensionConnection _takeAssertionsForIntent:extensionBundleIdentifier:processIdentifier:]";
      v13 = 2114;
      v14 = v9;
    }
  }

}

- (void)_takeInUseAssertionForIntent:(id)a3 extensionBundleIdentifier:(id)a4
{
  INIntentBackgroundHandlingAssertion *v5;
  id v6;
  INIntentBackgroundHandlingAssertion *backgroundHandlingAssertion;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_backgroundHandlingAssertion)
  {
    v9 = 0;
    objc_msgSend(a3, "_intents_backgroundHandlingAssertionForBundleIdentifier:context:error:", a4, 1, &v9);
    v5 = (INIntentBackgroundHandlingAssertion *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    backgroundHandlingAssertion = self->_backgroundHandlingAssertion;
    self->_backgroundHandlingAssertion = v5;

    if (v6)
    {
      v8 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[INCExtensionConnection _takeInUseAssertionForIntent:extensionBundleIdentifier:]";
        v12 = 2114;
        v13 = v6;
        _os_log_error_impl(&dword_1B727D000, v8, OS_LOG_TYPE_ERROR, "%s Error acquiring background assertion: %{public}@", buf, 0x16u);
      }
    }

  }
}

- (void)_takeRunningBoardAssertionForProcessIdentifier:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  RBSAssertion *v8;
  RBSAssertion *processAssertion;
  RBSAssertion *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  _QWORD v18[2];

  v3 = *(_QWORD *)&a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  -[INCExtensionConnection _invalidateRunningBoardAssertion](self, "_invalidateRunningBoardAssertion");
  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.siri"), CFSTR("IntentStartupGrant"));
  v6 = objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (RBSAssertion *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87C98]), "initWithExplanation:target:attributes:", CFSTR("Delivering an intent to an extension"), v5, v7);
  processAssertion = self->_processAssertion;
  self->_processAssertion = v8;

  v10 = self->_processAssertion;
  v13 = 0;
  LOBYTE(v6) = -[RBSAssertion acquireWithError:](v10, "acquireWithError:", &v13);
  v11 = v13;
  if ((v6 & 1) == 0)
  {
    v12 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[INCExtensionConnection _takeRunningBoardAssertionForProcessIdentifier:]";
      v16 = 2114;
      v17 = v11;
      _os_log_error_impl(&dword_1B727D000, v12, OS_LOG_TYPE_ERROR, "%s Failed to acquire assertion: %{public}@", buf, 0x16u);
    }
  }

}

- (void)_invalidateRunningBoardAssertion
{
  RBSAssertion *processAssertion;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[RBSAssertion isValid](self->_processAssertion, "isValid"))
  {
    processAssertion = self->_processAssertion;
    v7 = 0;
    v4 = -[RBSAssertion invalidateWithError:](processAssertion, "invalidateWithError:", &v7);
    v5 = v7;
    if ((v4 & 1) == 0)
    {
      v6 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v9 = "-[INCExtensionConnection _invalidateRunningBoardAssertion]";
        v10 = 2114;
        v11 = v5;
        _os_log_error_impl(&dword_1B727D000, v6, OS_LOG_TYPE_ERROR, "%s Failed to invalidate process assertion: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    v5 = 0;
  }

}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__INCExtensionConnection_reset__block_invoke;
  block[3] = &unk_1E6BC42F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __31__INCExtensionConnection_reset__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_invalidateDisplayLayoutMonitor");
  objc_msgSend(*(id *)(a1 + 32), "_transaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "reset");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAssertions");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cancel");

}

- (void)_invalidateDisplayLayoutMonitor
{
  FBSDisplayLayoutMonitor *displayLayoutMonitor;

  -[FBSDisplayLayoutMonitor invalidate](self->_displayLayoutMonitor, "invalidate");
  displayLayoutMonitor = self->_displayLayoutMonitor;
  self->_displayLayoutMonitor = 0;

}

- (void)_invalidateAssertions
{
  -[INCExtensionConnection _invalidateInUseAssertion](self, "_invalidateInUseAssertion");
  -[INCExtensionConnection _invalidateRunningBoardAssertion](self, "_invalidateRunningBoardAssertion");
}

- (void)_invalidateInUseAssertion
{
  INIntentBackgroundHandlingAssertion *backgroundHandlingAssertion;
  INIntentBackgroundHandlingAssertion *v4;

  backgroundHandlingAssertion = self->_backgroundHandlingAssertion;
  if (backgroundHandlingAssertion)
  {
    -[INIntentBackgroundHandlingAssertion invalidate](backgroundHandlingAssertion, "invalidate");
    v4 = self->_backgroundHandlingAssertion;
    self->_backgroundHandlingAssertion = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[INCExtensionConnection _invalidateDisplayLayoutMonitor](self, "_invalidateDisplayLayoutMonitor");
  -[INCExtensionConnection _invalidateAssertions](self, "_invalidateAssertions");
  v3.receiver = self;
  v3.super_class = (Class)INCExtensionConnection;
  -[INCExtensionConnection dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_xpcObject, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcInterface, 0);
  objc_storeStrong(&self->_remoteExtensionProxyProvider, 0);
  objc_storeStrong(&self->_appHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_extensionInputItems, 0);
  objc_storeStrong((id *)&self->_appProxy, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_backgroundHandlingAssertion, 0);
  objc_storeStrong((id *)&self->_requestTimer, 0);
  objc_storeStrong((id *)&self->_layoutObserver, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
}

- (void)setExtensionInputItems:(id)a3
{
  objc_storeStrong((id *)&self->_extensionInputItems, a3);
}

- (void)setTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)_startRequestTimerWithExtensionProxy:(id)a3
{
  id v4;
  INWatchdogTimer *requestTimer;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  OS_dispatch_queue *queue;
  INWatchdogTimer *v16;
  INWatchdogTimer *v17;
  _QWORD v18[4];
  id v19;
  INCExtensionConnection *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  requestTimer = self->_requestTimer;
  if (requestTimer)
  {
    if (-[INWatchdogTimer cancelIfNotAlreadyCanceled](requestTimer, "cancelIfNotAlreadyCanceled"))
    {
      v6 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[INCExtensionConnection _startRequestTimerWithExtensionProxy:]";
        _os_log_impl(&dword_1B727D000, v6, OS_LOG_TYPE_INFO, "%s Cancelling request timer from previous request", buf, 0xCu);
      }
    }
  }
  if (objc_msgSend(v4, "_isExtensionBeingDebugged"))
  {
    v7 = (void *)*MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      -[INCExtensionConnection intent](self, "intent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[INCExtensionConnection _startRequestTimerWithExtensionProxy:]";
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1B727D000, v8, OS_LOG_TYPE_INFO, "%s Waiting indefinitely for intent: %@", buf, 0x16u);

    }
  }
  else
  {
    -[INCExtensionConnection _transaction](self, "_transaction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCExtensionConnection _timeoutIntervalForTransactionState:](self, "_timeoutIntervalForTransactionState:", v11);
    v13 = v12;

    objc_initWeak((id *)buf, self);
    v14 = objc_alloc(MEMORY[0x1E0CBDD00]);
    queue = self->_queue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__INCExtensionConnection__startRequestTimerWithExtensionProxy___block_invoke;
    v18[3] = &unk_1E6BC4388;
    objc_copyWeak(&v21, (id *)buf);
    v19 = v4;
    v20 = self;
    v16 = (INWatchdogTimer *)objc_msgSend(v14, "initWithTimeoutInterval:onQueue:timeoutHandler:", queue, v18, v13);
    v17 = self->_requestTimer;
    self->_requestTimer = v16;

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  -[INWatchdogTimer start](self->_requestTimer, "start");
  -[INCExtensionConnection _setShouldObserveLayout:](self, "_setShouldObserveLayout:", 1);

}

- (double)_timeoutIntervalForTransactionState:(id)a3
{
  id v4;
  double requestTimeoutInterval;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  requestTimeoutInterval = self->_requestTimeoutInterval;
  objc_msgSend(v4, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v4, "type");

    if (v7 == 4)
    {
      requestTimeoutInterval = 60.0;
      goto LABEL_14;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v4, "type");

    if (v9 == 4)
    {
      requestTimeoutInterval = 300.0;
      goto LABEL_14;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v4, "type");

    if (v11 == 4)
      requestTimeoutInterval = 180.0;
  }
  else
  {

  }
LABEL_14:

  return requestTimeoutInterval;
}

- (void)_setShouldObserveLayout:(BOOL)a3
{
  void *v4;
  FBSDisplayLayoutMonitor *v5;
  FBSDisplayLayoutMonitor *displayLayoutMonitor;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *);
  void *v10;
  id v11;
  id location;

  if (self->_shouldObserveLayout != a3)
  {
    self->_shouldObserveLayout = a3;
    -[INCExtensionConnection _invalidateDisplayLayoutMonitor](self, "_invalidateDisplayLayoutMonitor");
    if (self->_shouldObserveLayout)
    {
      objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v7 = MEMORY[0x1E0C809B0];
      v8 = 3221225472;
      v9 = __50__INCExtensionConnection__setShouldObserveLayout___block_invoke;
      v10 = &unk_1E6BC4320;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v4, "setTransitionHandler:", &v7);
      objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v4, v7, v8, v9, v10);
      v5 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
      displayLayoutMonitor = self->_displayLayoutMonitor;
      self->_displayLayoutMonitor = v5;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);

    }
  }
}

void __50__INCExtensionConnection__setShouldObserveLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[2], "updateDisplayLayout:", v6);

}

- (double)requestTimeoutInterval
{
  return self->_requestTimeoutInterval;
}

- (BOOL)_cancelRequestTimer
{
  INWatchdogTimer *requestTimer;
  BOOL v4;
  void *v5;
  INWatchdogTimer *v6;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  requestTimer = self->_requestTimer;
  if (requestTimer
    && (-[INWatchdogTimer cancelIfNotAlreadyCanceled](requestTimer, "cancelIfNotAlreadyCanceled") & 1) == 0)
  {
    v5 = (void *)*MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v8 = v5;
      -[INCExtensionConnection intent](self, "intent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[INCExtensionConnection _cancelRequestTimer]";
      v12 = 2112;
      v13 = v9;
      _os_log_error_impl(&dword_1B727D000, v8, OS_LOG_TYPE_ERROR, "%s Intent handling already timed out, ignoring extension response for intent %@", (uint8_t *)&v10, 0x16u);

    }
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  v6 = self->_requestTimer;
  self->_requestTimer = 0;

  -[INCExtensionConnection _setShouldObserveLayout:](self, "_setShouldObserveLayout:", 0);
  return v4;
}

- (INCExtensionConnection)initWithIntent:(id)a3 remoteProxyProvider:(id)a4
{
  return -[INCExtensionConnection initWithIntent:supportedExtensionTypes:remoteProxyProvider:](self, "initWithIntent:supportedExtensionTypes:remoteProxyProvider:", a3, 7, a4);
}

- (void)setIntent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  INCExtensionTransaction *transaction;
  INCExtensionTransactionState *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  INCExtensionTransactionState *v12;
  id v13;

  v13 = a3;
  -[INCExtensionTransaction currentIntent](self->_transaction, "currentIntent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setExecutionContext:", objc_msgSend(v4, "_executionContext"));

  -[INCExtensionTransaction state](self->_transaction, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCExtensionTransaction state](self->_transaction, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    transaction = self->_transaction;
    v8 = [INCExtensionTransactionState alloc];
    v9 = objc_msgSend(v5, "type");
    objc_msgSend(v5, "intentResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userActivities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[INCExtensionTransactionState initWithType:intent:intentResponse:userActivities:](v8, "initWithType:intent:intentResponse:userActivities:", v9, v13, v10, v11);
    -[INCExtensionTransaction setState:](transaction, "setState:", v12);

  }
}

- (BOOL)requiresTCC
{
  void *v2;
  char v3;

  -[INCExtensionTransaction request](self->_transaction, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresTCC");

  return v3;
}

- (void)setRequiresTCC:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[INCExtensionTransaction request](self->_transaction, "request");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequiresTCC:", v3);

}

- (BOOL)requiresTrustCheck
{
  void *v2;
  char v3;

  -[INCExtensionTransaction request](self->_transaction, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresTrustCheck");

  return v3;
}

- (void)setRequiresTrustCheck:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[INCExtensionTransaction request](self->_transaction, "request");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequiresTrustCheck:", v3);

}

- (id)xpcListenerEndpointWithInterface:(id)a3 object:(id)a4
{
  id v6;
  NSXPCListener *xpcListener;
  NSXPCListener *v8;
  NSXPCListener *v9;

  v6 = a4;
  -[INCExtensionConnection setXPCInterface:](self, "setXPCInterface:", a3);
  -[INCExtensionConnection setXPCObject:](self, "setXPCObject:", v6);

  xpcListener = self->_xpcListener;
  if (!xpcListener)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v8 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    v9 = self->_xpcListener;
    self->_xpcListener = v8;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener resume](self->_xpcListener, "resume");
    xpcListener = self->_xpcListener;
  }
  return -[NSXPCListener endpoint](xpcListener, "endpoint");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v6 = (NSXPCListener *)a3;
  v7 = a4;
  if (self->_xpcListener == v6 && self->_xpcInterface)
  {
    -[INCExtensionConnection setXPCConnection:](self, "setXPCConnection:", v7);
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __61__INCExtensionConnection_listener_shouldAcceptNewConnection___block_invoke;
    v13 = &unk_1E6BC43B0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v7, "setInvalidationHandler:", &v10);
    objc_msgSend(v7, "setExportedInterface:", self->_xpcInterface, v10, v11, v12, v13);
    objc_msgSend(v7, "setExportedObject:", self->_xpcObject);
    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldObserveLayout
{
  return self->_shouldObserveLayout;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (INCAppProxy)appProxy
{
  return self->_appProxy;
}

- (int64_t)appProtectionPolicy
{
  return self->_appProtectionPolicy;
}

- (void)setAppProtectionPolicy:(int64_t)a3
{
  self->_appProtectionPolicy = a3;
}

- (void)setRequestTimeoutInterval:(double)a3
{
  self->_requestTimeoutInterval = a3;
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (id)appHandler
{
  return self->_appHandler;
}

- (void)setAppHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)remoteExtensionProxyProvider
{
  return self->_remoteExtensionProxyProvider;
}

- (NSXPCInterface)xpcInterface
{
  return self->_xpcInterface;
}

- (void)setXPCInterface:(id)a3
{
  objc_storeStrong((id *)&self->_xpcInterface, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXPCConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (id)xpcObject
{
  return self->_xpcObject;
}

- (void)setXPCObject:(id)a3
{
  objc_storeStrong(&self->_xpcObject, a3);
}

void __61__INCExtensionConnection_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setXPCInterface:", 0);

}

void __63__INCExtensionConnection__startRequestTimerWithExtensionProxy___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "_vendorRemote");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E6BC4EA8;
  objc_msgSend(v2, "cancelTransactionDueToTimeoutWithIntentIdentifier:completion:", v6, &__block_literal_global_435);

  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_invalidateAssertions");
    objc_msgSend(WeakRetained, "_setShouldObserveLayout:", 0);
    v8 = WeakRetained;
    v9 = WeakRetained[15];
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INCExtensionErrorDomain"), 1307, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

      v8 = WeakRetained;
    }
    v11 = (void *)v8[3];
    v8[3] = 0;

    v7 = WeakRetained;
  }

}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_26(id *a1)
{
  void *v2;
  int v3;
  int v4;
  char v5;
  void *v6;
  char v7;
  int v8;
  os_log_t *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void (**v19)(id, _QWORD, id);
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(id, _QWORD, void *);
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_className");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1[5], "supportsMultiwindow");
  v4 = objc_msgSend(a1[4], "_intents_isExemptFromMulitWindowRequirementForInAppHandling");
  if ((objc_msgSend(a1[4], "_intents_hasSystemIntentHandler") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1[5], "supportedIntentsByApp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v2);

    v5 = v7 ^ 1;
  }
  v8 = v3 | v4;
  v9 = (os_log_t *)MEMORY[0x1E0CBD670];
  v10 = (void *)*MEMORY[0x1E0CBD670];
  v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO);
  if (v8 != 1 || (v5 & 1) != 0)
  {
    if (v11)
    {
      v21 = a1[5];
      v22 = v10;
      objc_msgSend(v21, "applicationIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v36 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
      v37 = 2112;
      v38 = v23;
      _os_log_impl(&dword_1B727D000, v22, OS_LOG_TYPE_INFO, "%s The app %@ can NOT handle intent with in-app intent handling. Looking for an extension.", buf, 0x16u);

    }
    if ((objc_msgSend(a1[6], "supportedExtensionTypes") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unable to resume connection with an undefined extension type"), 0);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v30);
    }
    v24 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v25 = a1[4];
      *(_DWORD *)buf = 136315394;
      v36 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
      v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_1B727D000, v24, OS_LOG_TYPE_INFO, "%s Starting extension request for intent: %@", buf, 0x16u);
    }
    v26 = a1[4];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_29;
    v31[3] = &unk_1E6BC4258;
    v27 = a1[7];
    v31[4] = a1[6];
    v34 = a1[8];
    v32 = a1[4];
    v33 = a1[7];
    objc_msgSend(v27, "startRequestForIntent:completion:", v26, v31);

  }
  else
  {
    if (v11)
    {
      v12 = a1[5];
      v13 = v10;
      objc_msgSend(v12, "applicationIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v36 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
      v37 = 2112;
      v38 = v14;
      _os_log_impl(&dword_1B727D000, v13, OS_LOG_TYPE_INFO, "%s The app %@ can handle intent with in-app intent handling. Using it.", buf, 0x16u);

    }
    if (a1[8])
    {
      if (objc_msgSend(a1[6], "requiresTCC")
        && (v15 = (void *)MEMORY[0x1E0CBDD40],
            objc_msgSend(a1[5], "applicationIdentifier"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v15, "_siriAuthorizationStatusForAppID:", v16),
            v16,
            v17 != 3))
      {
        v28 = (void (**)(id, _QWORD, void *))a1[8];
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CBD400], 3005, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v28[2](v28, 0, v29);

      }
      else
      {
        v18 = objc_msgSend(a1[5], "isRequiresAppLaunchPreflight");
        v19 = (void (**)(id, _QWORD, id))a1[8];
        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CBD400], 3006, 0);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v19[2](v19, 0, v20);
        }
        else
        {
          v20 = -[INCExtensionProxy _initWithConnection:extension:vendorRemote:auditTokenValue:]([INCExtensionProxy alloc], "_initWithConnection:extension:vendorRemote:auditTokenValue:", a1[6], 0, 0, 0);
          ((void (**)(id, id, id))v19)[2](v19, v20, 0);
        }

      }
    }
  }

}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_2_46(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E6BC42A8;
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v5 = v3;
  dispatch_async(v4, block);

}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "BOOLValue"))
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CBD400], 1320, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_29(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1[4], "_queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6BC47D8;
  v17 = v9;
  v18 = v8;
  v23 = a1[7];
  v19 = a1[5];
  v11 = a1[6];
  v12 = a1[4];
  v20 = v11;
  v21 = v12;
  v22 = v7;
  v13 = v7;
  v14 = v8;
  v15 = v9;
  dispatch_async(v10, block);

}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_setShouldObserveLayout:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_2_32;
  v6[3] = &unk_1E6BC41E0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315650;
      v7 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
      v8 = 2114;
      v9 = v5;
      v10 = 2114;
      v11 = v3;
      _os_log_error_impl(&dword_1B727D000, v4, OS_LOG_TYPE_ERROR, "%s Unable to get remote object proxy (%{public}@). XPC error: %{public}@", (uint8_t *)&v6, 0x20u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_36(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[INCExtensionConnection resumeWithCompletionHandler:]_block_invoke";
    v8 = 2114;
    v9 = v5;
    _os_log_debug_impl(&dword_1B727D000, v2, OS_LOG_TYPE_DEBUG, "%s Received an XPC connection interruption (%{public}@). The remote process exited or crashed.", (uint8_t *)&v6, 0x16u);
  }
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INCExtensionErrorDomain"), 1306, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_37(_QWORD *a1)
{
  uint64_t v1;
  INCExtensionProxy *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v1 = a1[7];
  if (v1)
  {
    v3 = [INCExtensionProxy alloc];
    v4 = a1[4];
    v5 = a1[5];
    v6 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", a1 + 8, "{?=[8I]}");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[INCExtensionProxy _initWithConnection:extension:vendorRemote:auditTokenValue:](v3, "_initWithConnection:extension:vendorRemote:auditTokenValue:", v4, v5, v6, v8);
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v7, 0);

  }
}

void __54__INCExtensionConnection_resumeWithCompletionHandler___block_invoke_2_32(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void (**v5)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "_invalidateAssertions");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cancel");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  objc_msgSend(*(id *)(a1 + 32), "interruptionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "interruptionHandler");
    v5 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, *(_QWORD *)(a1 + 40));

  }
}

void __119__INCExtensionConnection_initWithIntent_supportedExtensionTypes_donateInteraction_groupIdentifier_remoteProxyProvider___block_invoke(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[7];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __119__INCExtensionConnection_initWithIntent_supportedExtensionTypes_donateInteraction_groupIdentifier_remoteProxyProvider___block_invoke_2;
    v6[3] = &unk_1E6BC4190;
    v8 = a2;
    v7 = WeakRetained;
    dispatch_async(v5, v6);

  }
}

uint64_t __119__INCExtensionConnection_initWithIntent_supportedExtensionTypes_donateInteraction_groupIdentifier_remoteProxyProvider___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *MEMORY[0x1E0CBD670];
  v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v8 = 136315394;
      v9 = "-[INCExtensionConnection initWithIntent:supportedExtensionTypes:donateInteraction:groupIdentifier:remoteProxy"
           "Provider:]_block_invoke_2";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1B727D000, v3, OS_LOG_TYPE_INFO, "%s Pausing request timer %@", (uint8_t *)&v8, 0x16u);
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "stop");
  }
  else
  {
    if (v4)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v8 = 136315394;
      v9 = "-[INCExtensionConnection initWithIntent:supportedExtensionTypes:donateInteraction:groupIdentifier:remoteProxy"
           "Provider:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1B727D000, v3, OS_LOG_TYPE_INFO, "%s Resuming request timer %@", (uint8_t *)&v8, 0x16u);
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "start");
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    INLogInitIfNeeded();
}

@end
