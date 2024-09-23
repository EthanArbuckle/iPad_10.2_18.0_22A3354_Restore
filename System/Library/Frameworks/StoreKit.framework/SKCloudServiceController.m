@implementation SKCloudServiceController

- (SKCloudServiceController)init
{
  SKCloudServiceController *v2;
  SKCloudServiceController *v3;
  void *v4;
  id v5;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKCloudServiceController;
  v2 = -[SKCloudServiceController init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_allowsPromptingForPrivacyAcknowledgement = 1;
    v7 = 0;
    -[SKCloudServiceController _cloudServiceStatusMonitorWithError:](v2, "_cloudServiceStatusMonitorWithError:", &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SKCloudServiceController init].cold.1((uint64_t)v3, (uint64_t)v5);

  }
  return v3;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_cloudServiceStatusMonitor)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getICCloudServiceStatusCapabilitiesDidChangeNotification();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, v5, self->_cloudServiceStatusMonitor);

    getICCloudServiceStatusStorefrontCountryCodeDidChangeNotification();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, v6, self->_cloudServiceStatusMonitor);

    getICCloudServiceStatusStorefrontIdentifierDidChangeNotification();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, v7, self->_cloudServiceStatusMonitor);

    -[ICCloudServiceStatusMonitor endObservingCloudServiceStatus](self->_cloudServiceStatusMonitor, "endObservingCloudServiceStatus");
  }
  os_unfair_lock_unlock(p_lock);
  v8.receiver = self;
  v8.super_class = (Class)SKCloudServiceController;
  -[SKCloudServiceController dealloc](&v8, sel_dealloc);
}

+ (SKCloudServiceAuthorizationStatus)authorizationStatus
{
  return +[SKPrivacyController authorizationStatus](SKPrivacyController, "authorizationStatus");
}

+ (void)requestAuthorization:(void *)completionHandler
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = completionHandler;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SKCloudServiceController_requestAuthorization___block_invoke;
  v5[3] = &unk_1E5B27DD8;
  v6 = v3;
  v4 = v3;
  +[SKPrivacyController requestAuthorization:](SKPrivacyController, "requestAuthorization:", v5);

}

void __49__SKCloudServiceController_requestAuthorization___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v5 = __49__SKCloudServiceController_requestAuthorization___block_invoke_2;
    v6 = &unk_1E5B27DB0;
    v7 = v2;
    v8 = a2;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v4, 3221225472))
      v5((uint64_t)&v4);
    else
      dispatch_async(MEMORY[0x1E0C80D38], &v4);

  }
}

uint64_t __49__SKCloudServiceController_requestAuthorization___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)requestCapabilitiesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  id v6;
  id *v7;
  _QWORD v8[4];
  id v9;
  _QWORD block[2];
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id v15;

  v4 = completionHandler;
  v15 = 0;
  -[SKCloudServiceController _cloudServiceStatusMonitorWithError:](self, "_cloudServiceStatusMonitorWithError:", &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__SKCloudServiceController_requestCapabilitiesWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5B27E28;
    v7 = &v9;
    v9 = v4;
    objc_msgSend(v5, "requestCapabilitiesWithCompletionHandler:", v8);
LABEL_8:

    goto LABEL_9;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v11 = __69__SKCloudServiceController_requestCapabilitiesWithCompletionHandler___block_invoke;
    v12 = &unk_1E5B26970;
    v7 = &v14;
    v14 = v4;
    v13 = v6;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v11((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

    goto LABEL_8;
  }
LABEL_9:

}

uint64_t __69__SKCloudServiceController_requestCapabilitiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __69__SKCloudServiceController_requestCapabilitiesWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD block[2];
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v6 = v5;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v8 = __69__SKCloudServiceController_requestCapabilitiesWithCompletionHandler___block_invoke_3;
    v9 = &unk_1E5B27E00;
    v10 = v5;
    v12 = a2;
    v11 = *(id *)(a1 + 32);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v8((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __69__SKCloudServiceController_requestCapabilitiesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    +[SKCloudServiceController _publicErrorForPrivateError:](SKCloudServiceController, "_publicErrorForPrivateError:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)requestStorefrontCountryCodeWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  id v6;
  id *v7;
  _QWORD v8[4];
  id v9;
  _QWORD block[2];
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id v15;

  v4 = completionHandler;
  v15 = 0;
  -[SKCloudServiceController _cloudServiceStatusMonitorWithError:](self, "_cloudServiceStatusMonitorWithError:", &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__SKCloudServiceController_requestStorefrontCountryCodeWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5B27E78;
    v7 = &v9;
    v9 = v4;
    objc_msgSend(v5, "requestStorefrontCountryCodeWithCompletionHandler:", v8);
LABEL_8:

    goto LABEL_9;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v11 = __78__SKCloudServiceController_requestStorefrontCountryCodeWithCompletionHandler___block_invoke;
    v12 = &unk_1E5B26970;
    v7 = &v14;
    v14 = v4;
    v13 = v6;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v11((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

    goto LABEL_8;
  }
LABEL_9:

}

uint64_t __78__SKCloudServiceController_requestStorefrontCountryCodeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __78__SKCloudServiceController_requestStorefrontCountryCodeWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD block[2];
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v9 = __78__SKCloudServiceController_requestStorefrontCountryCodeWithCompletionHandler___block_invoke_3;
    v10 = &unk_1E5B27E50;
    v11 = v6;
    v13 = *(id *)(a1 + 32);
    v12 = v5;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v9((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __78__SKCloudServiceController_requestStorefrontCountryCodeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    +[SKCloudServiceController _publicErrorForPrivateError:](SKCloudServiceController, "_publicErrorForPrivateError:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)requestStorefrontIdentifierWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  id v6;
  id *v7;
  _QWORD v8[4];
  id v9;
  _QWORD block[2];
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id v15;

  v4 = completionHandler;
  v15 = 0;
  -[SKCloudServiceController _cloudServiceStatusMonitorWithError:](self, "_cloudServiceStatusMonitorWithError:", &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__SKCloudServiceController_requestStorefrontIdentifierWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5B27E78;
    v7 = &v9;
    v9 = v4;
    objc_msgSend(v5, "requestStorefrontIdentifierWithCompletionHandler:", v8);
LABEL_8:

    goto LABEL_9;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v11 = __77__SKCloudServiceController_requestStorefrontIdentifierWithCompletionHandler___block_invoke;
    v12 = &unk_1E5B26970;
    v7 = &v14;
    v14 = v4;
    v13 = v6;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v11((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

    goto LABEL_8;
  }
LABEL_9:

}

uint64_t __77__SKCloudServiceController_requestStorefrontIdentifierWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __77__SKCloudServiceController_requestStorefrontIdentifierWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD block[2];
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v9 = __77__SKCloudServiceController_requestStorefrontIdentifierWithCompletionHandler___block_invoke_3;
    v10 = &unk_1E5B27E50;
    v11 = v6;
    v13 = *(id *)(a1 + 32);
    v12 = v5;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v9((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __77__SKCloudServiceController_requestStorefrontIdentifierWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    +[SKCloudServiceController _publicErrorForPrivateError:](SKCloudServiceController, "_publicErrorForPrivateError:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)requestUserTokenForDeveloperToken:(NSString *)developerToken completionHandler:(void *)completionHandler
{
  NSString *v6;
  void *v7;
  void *v8;
  id v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[2];
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;

  v6 = developerToken;
  v7 = completionHandler;
  v18 = 0;
  -[SKCloudServiceController _cloudServiceStatusMonitorWithError:](self, "_cloudServiceStatusMonitorWithError:", &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__SKCloudServiceController_requestUserTokenForDeveloperToken_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5B27E78;
    v10 = &v12;
    v12 = v7;
    objc_msgSend(v8, "requestUserTokenForDeveloperToken:options:completionHandler:", v6, 1, v11);
LABEL_8:

    goto LABEL_9;
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v14 = __80__SKCloudServiceController_requestUserTokenForDeveloperToken_completionHandler___block_invoke;
    v15 = &unk_1E5B26970;
    v10 = &v17;
    v17 = v7;
    v16 = v9;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v14((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

    goto LABEL_8;
  }
LABEL_9:

}

uint64_t __80__SKCloudServiceController_requestUserTokenForDeveloperToken_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __80__SKCloudServiceController_requestUserTokenForDeveloperToken_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[2];
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v8 = __80__SKCloudServiceController_requestUserTokenForDeveloperToken_completionHandler___block_invoke_3;
    v9 = &unk_1E5B27E50;
    v10 = v5;
    v12 = *(id *)(a1 + 32);
    v11 = v6;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v8((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __80__SKCloudServiceController_requestUserTokenForDeveloperToken_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    +[SKCloudServiceController _publicErrorForPrivateError:](SKCloudServiceController, "_publicErrorForPrivateError:", *(_QWORD *)(a1 + 40));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (BOOL)_allowsPromptingForPrivacyAcknowledgement
{
  SKCloudServiceController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(v2) = v2->_allowsPromptingForPrivacyAcknowledgement;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_setAllowsPromptingForPrivacyAcknowledgement:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  ICCloudServiceStatusMonitor *cloudServiceStatusMonitor;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  self->_allowsPromptingForPrivacyAcknowledgement = v3;
  cloudServiceStatusMonitor = self->_cloudServiceStatusMonitor;
  if (cloudServiceStatusMonitor)
    -[ICCloudServiceStatusMonitor setPrivacyAcknowledgementPolicy:](cloudServiceStatusMonitor, "setPrivacyAcknowledgementPolicy:", v3);
  os_unfair_lock_unlock(p_lock);
}

- (void)_handleCapabilitiesDidChangeNotification:(id)a3
{
  _QWORD block[2];
  void (*v4)(uint64_t);
  void *v5;
  SKCloudServiceController *v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v4 = __69__SKCloudServiceController__handleCapabilitiesDidChangeNotification___block_invoke;
  v5 = &unk_1E5B267D8;
  v6 = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3))
    v4((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __69__SKCloudServiceController__handleCapabilitiesDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 138543618;
    v5 = v2;
    v6 = 2114;
    v7 = CFSTR("SKCloudServiceCapabilitiesDidChangeNotification");
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Posting %{public}@.", (uint8_t *)&v4, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SKCloudServiceCapabilitiesDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_handleStorefrontCountryCodeDidChangeNotification:(id)a3
{
  _QWORD block[2];
  void (*v4)(uint64_t);
  void *v5;
  SKCloudServiceController *v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v4 = __78__SKCloudServiceController__handleStorefrontCountryCodeDidChangeNotification___block_invoke;
  v5 = &unk_1E5B267D8;
  v6 = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3))
    v4((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __78__SKCloudServiceController__handleStorefrontCountryCodeDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 138543618;
    v5 = v2;
    v6 = 2114;
    v7 = CFSTR("SKStorefrontCountryCodeDidChangeNotification");
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Posting %{public}@.", (uint8_t *)&v4, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SKStorefrontCountryCodeDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_handleStorefrontIdentifierDidChangeNotification:(id)a3
{
  _QWORD block[2];
  void (*v4)(uint64_t);
  void *v5;
  SKCloudServiceController *v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v4 = __77__SKCloudServiceController__handleStorefrontIdentifierDidChangeNotification___block_invoke;
  v5 = &unk_1E5B267D8;
  v6 = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3))
    v4((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __77__SKCloudServiceController__handleStorefrontIdentifierDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 138543618;
    v5 = v2;
    v6 = 2114;
    v7 = CFSTR("SKStorefrontIdentifierDidChangeNotification");
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Posting %{public}@.", (uint8_t *)&v4, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SKStorefrontIdentifierDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

+ (id)_publicErrorForPrivateError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _Unwind_Exception *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v6 = (_QWORD *)getICErrorDomainSymbolLoc_ptr;
  v25 = getICErrorDomainSymbolLoc_ptr;
  if (!getICErrorDomainSymbolLoc_ptr)
  {
    v7 = (void *)iTunesCloudLibrary();
    v6 = dlsym(v7, "ICErrorDomain");
    v23[3] = (uint64_t)v6;
    getICErrorDomainSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v22, 8);
  if (!v6)
  {
    v21 = (_Unwind_Exception *)-[SKAccountPageSpecifierProvider _appleAccount].cold.1();
    _Block_object_dispose(&v22, 8);
    _Unwind_Resume(v21);
  }
  v8 = objc_msgSend(v5, "isEqualToString:", *v6, v22);

  if (!v8)
    goto LABEL_17;
  v9 = objc_msgSend(v3, "code");
  if (v9 <= -7101)
  {
    switch(v9)
    {
      case -8100:
        v13 = 0;
        v11 = 0;
        v12 = 8;
        goto LABEL_18;
      case -7401:
        v13 = 0;
        goto LABEL_30;
      case -7101:
        objc_msgSend(v3, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CB2938]);
        v13 = objc_claimAutoreleasedReturnValue();

LABEL_30:
        v11 = 0;
        v12 = 1;
        goto LABEL_18;
    }
LABEL_17:
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR"), &stru_1E5B2D460, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = 0;
    goto LABEL_18;
  }
  if (v9 > -7010)
  {
    if (v9 != -7009)
    {
      if (v9 == -7007)
      {
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PRIVACY_ACKNOWLEDGEMENT_REQUIRED"), &stru_1E5B2D460, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        v13 = 0;
        v12 = 9;
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PERMISSION_DENIED"), &stru_1E5B2D460, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0CB2938]);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = 6;
  }
  else
  {
    if (v9 != -7100)
    {
      if (v9 == -7011)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v11 = 0;
        v12 = 1;
        v13 = (uint64_t)CFSTR("Failed to send message to remote cloud service status monitor.");
LABEL_24:
        objc_msgSend(v10, "setObject:forKey:", v13, *MEMORY[0x1E0CB2938]);
        v16 = (void *)v13;
        goto LABEL_25;
      }
      goto LABEL_17;
    }
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NETWORK_FAILED"), &stru_1E5B2D460, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v12 = 7;
  }
LABEL_18:
  if (v11 | v13)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = v15;
    if (v11)
    {
      objc_msgSend(v15, "setObject:forKey:", v11, *MEMORY[0x1E0CB2D50]);
      if (v13)
        goto LABEL_24;
      v16 = 0;
    }
    else
    {
      v16 = 0;
      if (v13)
        goto LABEL_24;
    }
LABEL_25:
    v17 = (void *)objc_msgSend(v10, "copy");

    goto LABEL_26;
  }
  v11 = 0;
  v16 = 0;
  v17 = 0;
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), v12, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_cloudServiceStatusMonitorWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  ICCloudServiceStatusMonitor *cloudServiceStatusMonitor;
  void *v7;
  objc_class *v8;
  ICCloudServiceStatusMonitor *v9;
  ICCloudServiceStatusMonitor *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ICCloudServiceStatusMonitor *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (+[SKCloudServiceController authorizationStatus](SKCloudServiceController, "authorizationStatus") != SKCloudServiceAuthorizationStatusAuthorized)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PERMISSION_DENIED"), &stru_1E5B2D460, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
    {
      v27 = *MEMORY[0x1E0CB2D50];
      v28[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 6, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    if (!a3)
      goto LABEL_15;
LABEL_14:
    *a3 = objc_retainAutorelease(v16);
    goto LABEL_15;
  }
  os_unfair_lock_lock(p_lock);
  cloudServiceStatusMonitor = self->_cloudServiceStatusMonitor;
  if (!cloudServiceStatusMonitor)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v7 = (void *)getICCloudServiceStatusMonitorClass_softClass_0;
    v26 = getICCloudServiceStatusMonitorClass_softClass_0;
    if (!getICCloudServiceStatusMonitorClass_softClass_0)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __getICCloudServiceStatusMonitorClass_block_invoke_0;
      v22[3] = &unk_1E5B26828;
      v22[4] = &v23;
      __getICCloudServiceStatusMonitorClass_block_invoke_0((uint64_t)v22);
      v7 = (void *)v24[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v23, 8);
    v9 = (ICCloudServiceStatusMonitor *)objc_alloc_init(v8);
    v10 = self->_cloudServiceStatusMonitor;
    self->_cloudServiceStatusMonitor = v9;

    if (!self->_allowsPromptingForPrivacyAcknowledgement)
      -[ICCloudServiceStatusMonitor setPrivacyAcknowledgementPolicy:](self->_cloudServiceStatusMonitor, "setPrivacyAcknowledgementPolicy:", 0);
    -[ICCloudServiceStatusMonitor beginObservingCloudServiceStatus](self->_cloudServiceStatusMonitor, "beginObservingCloudServiceStatus");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    getICCloudServiceStatusCapabilitiesDidChangeNotification();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__handleCapabilitiesDidChangeNotification_, v12, self->_cloudServiceStatusMonitor);

    getICCloudServiceStatusStorefrontCountryCodeDidChangeNotification();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__handleStorefrontCountryCodeDidChangeNotification_, v13, self->_cloudServiceStatusMonitor);

    getICCloudServiceStatusStorefrontIdentifierDidChangeNotification();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__handleStorefrontIdentifierDidChangeNotification_, v14, self->_cloudServiceStatusMonitor);

    cloudServiceStatusMonitor = self->_cloudServiceStatusMonitor;
  }
  v15 = cloudServiceStatusMonitor;
  os_unfair_lock_unlock(p_lock);
  v16 = 0;
  if (a3)
    goto LABEL_14;
LABEL_15:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudServiceStatusMonitor, 0);
}

- (void)init
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = a1;
  v4 = 2114;
  v5 = a2;
  _os_log_error_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Cannot setup cloud service status monitor upon initialization. Encountered error: %{public}@.", (uint8_t *)&v2, 0x16u);
}

@end
