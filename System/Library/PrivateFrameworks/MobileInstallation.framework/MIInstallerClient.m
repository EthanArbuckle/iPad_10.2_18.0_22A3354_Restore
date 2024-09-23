@implementation MIInstallerClient

- (void)_invalidateObject
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[MIInstallerClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  _CreateError((uint64_t)"-[MIInstallerClient _invalidateObject]", 197, (void *)*MEMORY[0x1E0D3ACC0], 131, 0, 0, CFSTR("Connection was invalidated before all delegate messages were received"), v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MIInstallerClient delegateMessageDeliveryCompleteWithError:](self, "delegateMessageDeliveryCompleteWithError:", v6);
  -[MIInstallerClient setConnection:](self, "setConnection:", 0);
  -[MIInstallerClient setProgressBlock:](self, "setProgressBlock:", 0);
  -[MIInstallerClient setAppDictionaryEnumBlock:](self, "setAppDictionaryEnumBlock:", 0);

}

- (MIInstallerClient)init
{
  MIInstallerClient *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MIInstallerClient;
  v2 = -[MIInstallerClient init](&v22, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mobile.installd"), 4096);
    -[MIInstallerClient setConnection:](v2, "setConnection:", v3);

    -[MIInstallerClient connection](v2, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      MobileInstallerProtocolInterface();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIInstallerClient connection](v2, "connection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRemoteObjectInterface:", v5);

      MobileInstallerDelegateProtocolInterface();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIInstallerClient connection](v2, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setExportedInterface:", v7);

      -[MIInstallerClient connection](v2, "connection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setExportedObject:", v2);

      objc_initWeak(&location, v2);
      v10 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __25__MIInstallerClient_init__block_invoke;
      v19[3] = &unk_1E6163628;
      objc_copyWeak(&v20, &location);
      -[MIInstallerClient connection](v2, "connection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setInterruptionHandler:", v19);

      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __25__MIInstallerClient_init__block_invoke_3;
      v17[3] = &unk_1E6163628;
      objc_copyWeak(&v18, &location);
      -[MIInstallerClient connection](v2, "connection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setInvalidationHandler:", v17);

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = dispatch_queue_create("com.apple.mobileinstallation_client", v13);
      -[MIInstallerClient setQueue:](v2, "setQueue:", v14);

      pthread_cond_init(&v2->_delegatesCompleteCond, 0);
      pthread_mutex_init(&v2->_delegatesCompleteCondMutex, 0);
      -[MIInstallerClient setDelegatesComplete:](v2, "setDelegatesComplete:", 0);
      -[MIInstallerClient connection](v2, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resume");

      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

void __25__MIInstallerClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__MIInstallerClient_init__block_invoke_2;
  block[3] = &unk_1E6163790;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_sync(v2, block);

}

void __25__MIInstallerClient_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  id v10;

  _CreateError((uint64_t)"-[MIInstallerClient init]_block_invoke_2", 223, (void *)*MEMORY[0x1E0D3ACC0], 131, 0, 0, CFSTR("Connection was interrupted before all delegate messages were received"), a8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegateMessageDeliveryCompleteWithError:", v10);

}

void __25__MIInstallerClient_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__MIInstallerClient_init__block_invoke_4;
  block[3] = &unk_1E6163790;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_sync(v2, block);

}

uint64_t __25__MIInstallerClient_init__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateObject");
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_delegatesCompleteCondMutex);
  pthread_cond_destroy(&self->_delegatesCompleteCond);
  v3.receiver = self;
  v3.super_class = (Class)MIInstallerClient;
  -[MIInstallerClient dealloc](&v3, sel_dealloc);
}

+ (id)installerWithProgressBlock:(id)a3 releaseTerminationAssertionBlock:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setProgressBlock:", v6);

  objc_msgSend(v7, "setReleaseTerminationAssertBlock:", v5);
  return v7;
}

+ (id)installerWithProgressBlock:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "installerWithProgressBlock:releaseTerminationAssertionBlock:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)installerWithAppDictionaryEnumerator:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setAppDictionaryEnumBlock:", v3);

  return v4;
}

- (void)reportProgress:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MIInstallerClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__MIInstallerClient_reportProgress___block_invoke;
  v7[3] = &unk_1E61637B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __36__MIInstallerClient_reportProgress___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "progressBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "progressBlock");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

- (void)enumerateAppDictionary:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MIInstallerClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MIInstallerClient_enumerateAppDictionary_error___block_invoke;
  block[3] = &unk_1E61637E0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __50__MIInstallerClient_enumerateAppDictionary_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "appDictionaryEnumBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "appDictionaryEnumBlock");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)delegateMessageDeliveryCompleteWithError:(id)a3
{
  id v4;

  v4 = a3;
  pthread_mutex_lock(&self->_delegatesCompleteCondMutex);
  if (!-[MIInstallerClient delegatesComplete](self, "delegatesComplete"))
  {
    -[MIInstallerClient setDelegatesComplete:](self, "setDelegatesComplete:", 1);
    -[MIInstallerClient setDelegatesCompleteError:](self, "setDelegatesCompleteError:", v4);
  }
  pthread_cond_signal(&self->_delegatesCompleteCond);
  pthread_mutex_unlock(&self->_delegatesCompleteCondMutex);

}

- (void)releaseTerminationAssertion
{
  NSObject *v3;
  _QWORD block[5];

  -[MIInstallerClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MIInstallerClient_releaseTerminationAssertion__block_invoke;
  block[3] = &unk_1E6163790;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __48__MIInstallerClient_releaseTerminationAssertion__block_invoke(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  objc_msgSend(*(id *)(a1 + 32), "releaseTerminationAssertBlock");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

- (id)_waitForPendingDelegateMessages
{
  _opaque_pthread_mutex_t *p_delegatesCompleteCondMutex;
  void *v4;
  void *v5;

  p_delegatesCompleteCondMutex = &self->_delegatesCompleteCondMutex;
  pthread_mutex_lock(&self->_delegatesCompleteCondMutex);
  if (!-[MIInstallerClient delegatesComplete](self, "delegatesComplete"))
  {
    do
      pthread_cond_wait(&self->_delegatesCompleteCond, p_delegatesCompleteCondMutex);
    while (!-[MIInstallerClient delegatesComplete](self, "delegatesComplete"));
  }
  -[MIInstallerClient delegatesCompleteError](self, "delegatesCompleteError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  pthread_mutex_unlock(p_delegatesCompleteCondMutex);
  return v5;
}

- (void)installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 withOptions:(id)a6 returningResultInfo:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v8 = a7;
  v14 = a8;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  -[MIInstallerClient connection](self, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke;
  v25[3] = &unk_1E6163830;
  v25[4] = self;
  v20 = v14;
  v26 = v20;
  objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke_3;
  v23[3] = &unk_1E6163880;
  v23[4] = self;
  v24 = v20;
  v22 = v20;
  objc_msgSend(v21, "installURL:identity:targetingDomain:options:returningResultInfo:completion:", v17, v16, a5, v15, v8, v23);

}

void __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  char v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "_waitForPendingDelegateMessages");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v18 = v19;
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 32), "queue", v18);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke_4;
  block[3] = &unk_1E6163858;
  v13 = *(id *)(a1 + 40);
  v26 = a2;
  v21 = v9;
  v22 = v10;
  v14 = *(_QWORD *)(a1 + 32);
  v23 = v11;
  v24 = v14;
  v25 = v13;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  dispatch_sync(v12, block);

}

uint64_t __100__MIInstallerClient_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return objc_msgSend(*(id *)(a1 + 56), "_invalidateObject");
}

- (void)stageInstallURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  -[MIInstallerClient connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke;
  v23[3] = &unk_1E6163830;
  v23[4] = self;
  v18 = v12;
  v24 = v18;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke_3;
  v21[3] = &unk_1E61638D0;
  v21[4] = self;
  v22 = v18;
  v20 = v18;
  objc_msgSend(v19, "stageInstallURL:identity:targetingDomain:withOptions:completion:", v15, v14, a5, v13, v21);

}

void __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __85__MIInstallerClient_stageInstallURL_identity_targetingDomain_withOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)finalizeStagedInstallForUUID:(id)a3 returningResultInfo:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[MIInstallerClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke;
  v17[3] = &unk_1E6163830;
  v17[4] = self;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke_3;
  v15[3] = &unk_1E6163880;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "finalizeStagedInstallForUUID:returningResultInfo:completion:", v9, v5, v15);

}

void __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  char v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "_waitForPendingDelegateMessages");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v18 = v19;
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 32), "queue", v18);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke_4;
  block[3] = &unk_1E6163858;
  v13 = *(id *)(a1 + 40);
  v26 = a2;
  v21 = v9;
  v22 = v10;
  v14 = *(_QWORD *)(a1 + 32);
  v23 = v11;
  v24 = v14;
  v25 = v13;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  dispatch_sync(v12, block);

}

uint64_t __81__MIInstallerClient_finalizeStagedInstallForUUID_returningResultInfo_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return objc_msgSend(*(id *)(a1 + 56), "_invalidateObject");
}

- (void)cancelUpdateForStagedUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke;
  v15[3] = &unk_1E6163830;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke_3;
  v13[3] = &unk_1E6163920;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "cancelUpdateForStagedUUID:completion:", v7, v13);

}

void __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke_4;
  block[3] = &unk_1E61638F8;
  v7 = *(id *)(a1 + 40);
  v14 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v8;
  v13 = v7;
  v9 = v5;
  dispatch_sync(v6, block);

}

uint64_t __58__MIInstallerClient_cancelUpdateForStagedUUID_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)registerPlaceholderForReference:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke;
  v15[3] = &unk_1E6163830;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke_3;
  v13[3] = &unk_1E6163948;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "registerPlaceholderForReference:completion:", v7, v13);

}

void __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __64__MIInstallerClient_registerPlaceholderForReference_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)revertForLSWithIdentifier:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke;
  v18[3] = &unk_1E6163830;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke_3;
  v16[3] = &unk_1E6163880;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "revertForLSWithIdentifier:withOptions:completion:", v10, v9, v16);

}

void __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  char v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "_waitForPendingDelegateMessages");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v18 = v19;
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 32), "queue", v18);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke_4;
  block[3] = &unk_1E6163858;
  v13 = *(id *)(a1 + 40);
  v26 = a2;
  v21 = v9;
  v22 = v10;
  v14 = *(_QWORD *)(a1 + 32);
  v23 = v11;
  v24 = v14;
  v25 = v13;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  dispatch_sync(v12, block);

}

uint64_t __70__MIInstallerClient_revertForLSWithIdentifier_withOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return objc_msgSend(*(id *)(a1 + 56), "_invalidateObject");
}

- (void)revertIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke;
  v18[3] = &unk_1E6163830;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke_3;
  v16[3] = &unk_1E6163880;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "revertIdentity:withOptions:completion:", v10, v9, v16);

}

void __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  char v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "_waitForPendingDelegateMessages");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v18 = v19;
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 32), "queue", v18);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke_4;
  block[3] = &unk_1E6163858;
  v13 = *(id *)(a1 + 40);
  v26 = a2;
  v21 = v9;
  v22 = v10;
  v14 = *(_QWORD *)(a1 + 32);
  v23 = v11;
  v24 = v14;
  v25 = v13;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  dispatch_sync(v12, block);

}

uint64_t __59__MIInstallerClient_revertIdentity_withOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return objc_msgSend(*(id *)(a1 + 56), "_invalidateObject");
}

- (void)uninstallIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke;
  v18[3] = &unk_1E6163830;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke_3;
  v16[3] = &unk_1E6163970;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "uninstallIdentifiers:withOptions:completion:", v10, v9, v16);

}

void __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_waitForPendingDelegateMessages");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v11 = v12;
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 32), "queue", v11);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __65__MIInstallerClient_uninstallIdentifiers_withOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)uninstallIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke;
  v18[3] = &unk_1E6163830;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke_3;
  v16[3] = &unk_1E6163830;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "uninstallIdentity:withOptions:completion:", v10, v9, v16);

}

void __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __62__MIInstallerClient_uninstallIdentity_withOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)finalizeReference:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke;
  v15[3] = &unk_1E6163830;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke_3;
  v13[3] = &unk_1E6163948;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "finalizeReference:completion:", v7, v13);

}

void __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __54__MIInstallerClient_finalizeReference_withCompletion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)acquireReferenceforInstalledAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 matchingInstallSessionID:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[MIInstallerClient connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke;
  v20[3] = &unk_1E6163830;
  v20[4] = self;
  v15 = v10;
  v21 = v15;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke_3;
  v18[3] = &unk_1E6163998;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:", v12, a4, v11, v18);

}

void __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __114__MIInstallerClient_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)invalidateReference:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke;
  v15[3] = &unk_1E6163830;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke_3;
  v13[3] = &unk_1E6163830;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "invalidateReference:completion:", v7, v13);

}

void __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __56__MIInstallerClient_invalidateReference_withCompletion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)lookupUninstalledWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke;
  v15[3] = &unk_1E6163830;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke_3;
  v13[3] = &unk_1E61639C0;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "lookupUninstalledWithOptions:completion:", v7, v13);

}

void __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __61__MIInstallerClient_lookupUninstalledWithOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)clearUninstalledIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke;
  v18[3] = &unk_1E6163830;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke_3;
  v16[3] = &unk_1E6163830;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "clearUninstalledIdentifiers:withOptions:completion:", v10, v9, v16);

}

void __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __72__MIInstallerClient_clearUninstalledIdentifiers_withOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)lookupSystemAppStateWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke;
  v15[3] = &unk_1E6163830;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke_3;
  v13[3] = &unk_1E61639C0;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "lookupSystemAppStateWithOptions:completion:", v7, v13);

}

void __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __64__MIInstallerClient_lookupSystemAppStateWithOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)updateSystemAppStateForIdentifier:(id)a3 appState:(int)a4 completion:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = a3;
  -[MIInstallerClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke;
  v17[3] = &unk_1E6163830;
  v17[4] = self;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke_3;
  v15[3] = &unk_1E6163830;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "updateSystemAppStateForIdentifier:appState:completion:", v9, v5, v15);

}

void __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __75__MIInstallerClient_updateSystemAppStateForIdentifier_appState_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)registerContentsForDiskImageAtURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke;
  v15[3] = &unk_1E6163830;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke_3;
  v13[3] = &unk_1E6163830;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "registerContentsForDiskImageAtURL:completion:", v7, v13);

}

void __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __66__MIInstallerClient_registerContentsForDiskImageAtURL_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)unregisterContentsForDiskImageAtURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke;
  v15[3] = &unk_1E6163830;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke_3;
  v13[3] = &unk_1E6163830;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "unregisterContentsForDiskImageAtURL:completion:", v7, v13);

}

void __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __68__MIInstallerClient_unregisterContentsForDiskImageAtURL_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)enumerateInstalledAppsWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke;
  v15[3] = &unk_1E6163830;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke_3;
  v13[3] = &unk_1E6163830;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "enumerateInstalledAppsWithOptions:completion:", v7, v13);

}

void __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_waitForPendingDelegateMessages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v3)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v9 = v3;
      MOLogWrite();
    }
    v4 = v3;

  }
  objc_msgSend(*(id *)(a1 + 32), "queue", v9);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v12 = v4;
  v13 = v7;
  v14 = v6;
  v8 = v4;
  dispatch_sync(v5, block);

}

uint64_t __66__MIInstallerClient_enumerateInstalledAppsWithOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)fetchInfoForFrameworkAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke;
  v18[3] = &unk_1E6163830;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke_3;
  v16[3] = &unk_1E6163970;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "fetchInfoForFrameworkAtURL:options:completion:", v10, v9, v16);

}

void __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __67__MIInstallerClient_fetchInfoForFrameworkAtURL_options_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)fetchInfoForContainerizedAppWithBundleID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke;
  v19[3] = &unk_1E6163830;
  v19[4] = self;
  v13 = v8;
  v20 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3AD48]), "initWithBundleID:", v10);

  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke_3;
  v17[3] = &unk_1E6163970;
  v17[4] = self;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v14, "fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:", v15, 2, v9, v17);

}

void __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __81__MIInstallerClient_fetchInfoForContainerizedAppWithBundleID_options_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)updateSinfForIXWithIdentifier:(id)a3 withOptions:(id)a4 sinfData:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[MIInstallerClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke;
  v21[3] = &unk_1E6163830;
  v21[4] = self;
  v16 = v10;
  v22 = v16;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke_3;
  v19[3] = &unk_1E61639E8;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "updateSinfForIXWithIdentifier:withOptions:sinfData:completion:", v13, v12, v11, v19);

}

void __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __83__MIInstallerClient_updateSinfForIXWithIdentifier_withOptions_sinfData_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)updateiTunesMetadataForIXWithIdentifier:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke;
  v18[3] = &unk_1E6163830;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke_3;
  v16[3] = &unk_1E6163830;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "updateiTunesMetadataForIXWithIdentifier:metadata:completion:", v10, v9, v16);

}

void __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __81__MIInstallerClient_updateiTunesMetadataForIXWithIdentifier_metadata_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)registerSafeHarborAtPath:(id)a3 forIdentity:(id)a4 ofType:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  -[MIInstallerClient connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke;
  v23[3] = &unk_1E6163830;
  v23[4] = self;
  v18 = v12;
  v24 = v18;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke_3;
  v21[3] = &unk_1E6163830;
  v21[4] = self;
  v22 = v18;
  v20 = v18;
  objc_msgSend(v19, "registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:", v15, v14, a5, v13, v21);

}

void __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __88__MIInstallerClient_registerSafeHarborAtPath_forIdentity_ofType_withOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)removeSafeHarborForIdentity:(id)a3 ofType:(unint64_t)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[MIInstallerClient connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke;
  v20[3] = &unk_1E6163830;
  v20[4] = self;
  v15 = v10;
  v21 = v15;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke_3;
  v18[3] = &unk_1E6163830;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "removeSafeHarborForIdentity:ofType:withOptions:completion:", v12, a4, v11, v18);

}

void __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __79__MIInstallerClient_removeSafeHarborForIdentity_ofType_withOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)listSafeHarborsOfType:(unint64_t)a3 forPersona:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[MIInstallerClient connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke;
  v20[3] = &unk_1E6163830;
  v20[4] = self;
  v15 = v10;
  v21 = v15;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke_3;
  v18[3] = &unk_1E61639C0;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "listSafeHarborsOfType:forPersona:withOptions:completion:", a3, v12, v11, v18);

}

void __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __77__MIInstallerClient_listSafeHarborsOfType_forPersona_withOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)checkCapabilities:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MIInstallerClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke;
  v18[3] = &unk_1E6163830;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke_3;
  v16[3] = &unk_1E61639C0;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "checkCapabilities:withOptions:completion:", v10, v9, v16);

}

void __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __62__MIInstallerClient_checkCapabilities_withOptions_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failureReason:(unint64_t)a5 underlyingError:(id)a6 failureSource:(unint64_t)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v13 = a8;
  v14 = a6;
  v15 = a3;
  -[MIInstallerClient connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke;
  v24[3] = &unk_1E6163830;
  v24[4] = self;
  v18 = v13;
  v25 = v18;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke_3;
  v22[3] = &unk_1E6163830;
  v22[4] = self;
  v23 = v18;
  v20 = v18;
  objc_msgSend(v19, "updatePlaceholderMetadataForApp:installType:failureReason:underlyingError:failureSource:completion:", v15, a4, a5, v14, a7, v22);

}

void __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __120__MIInstallerClient_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)getAppMetadataForApp:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke;
  v15[3] = &unk_1E6163830;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke_3;
  v13[3] = &unk_1E6163A10;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "getAppMetadataForApp:completion:", v7, v13);

}

void __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __53__MIInstallerClient_getAppMetadataForApp_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)snapshotWKAppInCompanionAppID:(id)a3 toURL:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[MIInstallerClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76__MIInstallerClient_snapshotWKAppInCompanionAppID_toURL_options_completion___block_invoke;
  v21[3] = &unk_1E6163830;
  v21[4] = self;
  v16 = v10;
  v22 = v16;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __76__MIInstallerClient_snapshotWKAppInCompanionAppID_toURL_options_completion___block_invoke_3;
  v19[3] = &unk_1E61639C0;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "snapshotWKAppInCompanionAppID:toURL:options:completion:", v13, v12, v11, v19);

}

void __76__MIInstallerClient_snapshotWKAppInCompanionAppID_toURL_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MIInstallerClient_snapshotWKAppInCompanionAppID_toURL_options_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __76__MIInstallerClient_snapshotWKAppInCompanionAppID_toURL_options_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __76__MIInstallerClient_snapshotWKAppInCompanionAppID_toURL_options_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MIInstallerClient_snapshotWKAppInCompanionAppID_toURL_options_completion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __76__MIInstallerClient_snapshotWKAppInCompanionAppID_toURL_options_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)setSystemAppMigrationComplete:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[MIInstallerClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke;
  v12[3] = &unk_1E6163830;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke_3;
  v10[3] = &unk_1E6163830;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "setSystemAppMigrationComplete:", v10);

}

void __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __51__MIInstallerClient_setSystemAppMigrationComplete___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)systemAppMigratorHasCompleted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[MIInstallerClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke;
  v12[3] = &unk_1E6163830;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke_3;
  v10[3] = &unk_1E6163920;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "systemAppMigratorHasCompleted:", v10);

}

void __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke_4;
  block[3] = &unk_1E61638F8;
  v7 = *(id *)(a1 + 40);
  v14 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v8;
  v13 = v7;
  v9 = v5;
  dispatch_sync(v6, block);

}

uint64_t __51__MIInstallerClient_systemAppMigratorHasCompleted___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)waitForSystemAppMigratorToComplete:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[MIInstallerClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke;
  v12[3] = &unk_1E6163830;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke_3;
  v10[3] = &unk_1E6163830;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "waitForSystemAppMigratorToComplete:", v10);

}

void __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __56__MIInstallerClient_waitForSystemAppMigratorToComplete___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)waitForSystemAppMigratorWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[MIInstallerClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke;
  v12[3] = &unk_1E6163830;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke_3;
  v10[3] = &unk_1E6163830;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "waitForSystemAppMigratorToComplete:", v10);

}

void __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __60__MIInstallerClient_waitForSystemAppMigratorWithCompletion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)createSerializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 withCompletion:(id)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v7 = *(_QWORD *)&a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[MIInstallerClient connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke;
  v23[3] = &unk_1E6163830;
  v23[4] = self;
  v18 = v12;
  v24 = v18;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke_3;
  v21[3] = &unk_1E6163830;
  v21[4] = self;
  v22 = v18;
  v20 = v18;
  objc_msgSend(v19, "createSerializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:withCompletion:", v15, v14, v13, v7, v21);

}

void __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __131__MIInstallerClient_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)setLaunchWarningForApp:(id)a3 withUniqueInstallIdentifier:(id)a4 warningData:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[MIInstallerClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke;
  v21[3] = &unk_1E6163830;
  v21[4] = self;
  v16 = v10;
  v22 = v16;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke_3;
  v19[3] = &unk_1E6163830;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:", v13, v12, v11, v19);

}

void __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke_4;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __95__MIInstallerClient_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

- (void)linkedBundleIDsForAppIdentity:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[MIInstallerClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke;
  v15[3] = &unk_1E6163830;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke_3;
  v13[3] = &unk_1E6163A38;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "linkedBundleIDsForAppIdentity:withCompletion:", v7, v13);

}

void __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __66__MIInstallerClient_linkedBundleIDsForAppIdentity_withCompletion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (void)referencesForBundleWithIdentifier:(id)a3 inDomain:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v8 = a5;
  v9 = a3;
  -[MIInstallerClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke;
  v17[3] = &unk_1E6163830;
  v17[4] = self;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke_3;
  v15[3] = &unk_1E61639C0;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "referencesForBundleWithIdentifier:inDomain:completion:", v9, a4, v15);

}

void __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke_2;
  block[3] = &unk_1E6163808;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateObject");
}

void __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke_4;
  block[3] = &unk_1E61638A8;
  v8 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_sync(v7, block);

}

uint64_t __79__MIInstallerClient_referencesForBundleWithIdentifier_inDomain_withCompletion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "_invalidateObject");
}

- (int)pidForTesting
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  -[MIInstallerClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__MIInstallerClient_pidForTesting__block_invoke_2;
  v5[3] = &unk_1E6163A80;
  v5[4] = &v6;
  objc_msgSend(v3, "getPidForTestingWithCompletion:", v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

void __34__MIInstallerClient_pidForTesting__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v3 = v2;
    MOLogWrite();
    v2 = v3;
  }

}

uint64_t __34__MIInstallerClient_pidForTesting__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)dieForTesting
{
  void *v2;
  id v3;

  -[MIInstallerClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_26);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dieForTesting");

}

void __34__MIInstallerClient_dieForTesting__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v3 = v2;
    MOLogWrite();
    v2 = v3;
  }

}

- (id)raiseException
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  -[MIInstallerClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__MIInstallerClient_raiseException__block_invoke;
  v8[3] = &unk_1E6163AC8;
  v8[4] = &v9;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __35__MIInstallerClient_raiseException__block_invoke_2;
  v7[3] = &unk_1E6163AC8;
  v7[4] = &v9;
  objc_msgSend(v4, "raiseExceptionWithCompletion:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __35__MIInstallerClient_raiseException__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__MIInstallerClient_raiseException__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)setTestMode:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[MIInstallerClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __33__MIInstallerClient_setTestMode___block_invoke;
  v13[3] = &unk_1E6163AC8;
  v13[4] = &v14;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __33__MIInstallerClient_setTestMode___block_invoke_2;
  v12[3] = &unk_1E6163AC8;
  v12[4] = &v14;
  objc_msgSend(v6, "setTestModeWithCompletion:", v12);

  v7 = (void *)v15[5];
  if (!v7)
    goto LABEL_4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D3ACC0]))
  {
    v9 = objc_msgSend((id)v15[5], "code");

    if (v9 == 157)
    {
LABEL_4:
      v10 = 1;
      goto LABEL_11;
    }
  }
  else
  {

  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v10 = 0;
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
LABEL_11:
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __33__MIInstallerClient_setTestMode___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __33__MIInstallerClient_setTestMode___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)endTestMode:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[MIInstallerClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __33__MIInstallerClient_endTestMode___block_invoke;
  v13[3] = &unk_1E6163AC8;
  v13[4] = &v14;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __33__MIInstallerClient_endTestMode___block_invoke_2;
  v12[3] = &unk_1E6163AC8;
  v12[4] = &v14;
  objc_msgSend(v6, "endTestModeWithCompletion:", v12);

  v7 = (void *)v15[5];
  if (!v7)
    goto LABEL_4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D3ACC0]))
  {
    v9 = objc_msgSend((id)v15[5], "code");

    if (v9 == 157)
    {
LABEL_4:
      v10 = 1;
      goto LABEL_11;
    }
  }
  else
  {

  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v10 = 0;
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
LABEL_11:
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __33__MIInstallerClient_endTestMode___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __33__MIInstallerClient_endTestMode___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)getTestModeEnabled:(BOOL *)a3 outError:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  BOOL v10;
  _QWORD v12[7];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[MIInstallerClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__MIInstallerClient_getTestModeEnabled_outError___block_invoke;
  v13[3] = &unk_1E6163AC8;
  v13[4] = &v18;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __49__MIInstallerClient_getTestModeEnabled_outError___block_invoke_2;
  v12[3] = &unk_1E6163AF0;
  v12[4] = &v14;
  v12[5] = &v18;
  v12[6] = a3;
  objc_msgSend(v8, "getTestModeWithCompletion:", v12);

  if (v19[5] && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    MOLogWrite();
  v9 = *((unsigned __int8 *)v15 + 24);
  if (a4 && !*((_BYTE *)v15 + 24))
  {
    *a4 = objc_retainAutorelease((id)v19[5]);
    v9 = *((unsigned __int8 *)v15 + 24);
  }
  v10 = v9 != 0;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __49__MIInstallerClient_getTestModeEnabled_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __49__MIInstallerClient_getTestModeEnabled_outError___block_invoke_2(_QWORD *a1, char a2, void *a3)
{
  id v6;
  _BYTE *v7;
  id v8;

  v6 = a3;
  if (v6)
  {
    v8 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    v6 = v8;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    v7 = (_BYTE *)a1[6];
    if (v7)
      *v7 = a2;
  }

}

- (BOOL)setTestFlags:(unint64_t)a3 withError:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[MIInstallerClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__MIInstallerClient_setTestFlags_withError___block_invoke;
  v12[3] = &unk_1E6163AC8;
  v12[4] = &v13;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __44__MIInstallerClient_setTestFlags_withError___block_invoke_2;
  v11[3] = &unk_1E6163AC8;
  v11[4] = &v13;
  objc_msgSend(v8, "setTestFlags:withCompletion:", a3, v11);

  v9 = (void *)v14[5];
  if (a4 && v9)
    *a4 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v13, 8);

  return v9 == 0;
}

void __44__MIInstallerClient_setTestFlags_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __44__MIInstallerClient_setTestFlags_withError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)clearTestFlags:(unint64_t)a3 withError:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[MIInstallerClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__MIInstallerClient_clearTestFlags_withError___block_invoke;
  v12[3] = &unk_1E6163AC8;
  v12[4] = &v13;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __46__MIInstallerClient_clearTestFlags_withError___block_invoke_2;
  v11[3] = &unk_1E6163AC8;
  v11[4] = &v13;
  objc_msgSend(v8, "clearTestFlags:withCompletion:", a3, v11);

  v9 = (void *)v14[5];
  if (a4 && v9)
    *a4 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v13, 8);

  return v9 == 0;
}

void __46__MIInstallerClient_clearTestFlags_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__MIInstallerClient_clearTestFlags_withError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)setEligibilityTestOverrides:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[MIInstallerClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__MIInstallerClient_setEligibilityTestOverrides_withError___block_invoke;
  v13[3] = &unk_1E6163AC8;
  v13[4] = &v14;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __59__MIInstallerClient_setEligibilityTestOverrides_withError___block_invoke_2;
  v12[3] = &unk_1E6163AC8;
  v12[4] = &v14;
  objc_msgSend(v9, "setEligibilityTestOverrides:withCompletion:", v6, v12);

  v10 = (void *)v15[5];
  if (a4 && v10)
    *a4 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v14, 8);

  return v10 == 0;
}

void __59__MIInstallerClient_setEligibilityTestOverrides_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __59__MIInstallerClient_setEligibilityTestOverrides_withError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)appDictionaryEnumBlock
{
  return self->_appDictionaryEnumBlock;
}

- (void)setAppDictionaryEnumBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)releaseTerminationAssertBlock
{
  return self->_releaseTerminationAssertBlock;
}

- (void)setReleaseTerminationAssertBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)delegatesComplete
{
  return self->_delegatesComplete;
}

- (void)setDelegatesComplete:(BOOL)a3
{
  self->_delegatesComplete = a3;
}

- (NSError)delegatesCompleteError
{
  return self->_delegatesCompleteError;
}

- (void)setDelegatesCompleteError:(id)a3
{
  objc_storeStrong((id *)&self->_delegatesCompleteError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatesCompleteError, 0);
  objc_storeStrong(&self->_releaseTerminationAssertBlock, 0);
  objc_storeStrong(&self->_appDictionaryEnumBlock, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
