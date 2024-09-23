@implementation FAFamilySettings

- (void)launchiCloudFamilySettings
{
  -[FAFamilySettings launchiCloudFamilySettingsWithOptions:](self, "launchiCloudFamilySettingsWithOptions:", 0);
}

- (BOOL)isAccountSignedIn
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)launchiCloudFamilySettingsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FAFetchFamilyCircleRequest *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(FAFetchFamilyCircleRequest);
    -[FAFetchFamilyCircleRequest setDoNotFetchFromServer:](v7, "setDoNotFetchFromServer:", 1);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__FAFamilySettings_launchiCloudFamilySettingsWithOptions___block_invoke;
    v8[3] = &unk_1E8562240;
    v8[4] = self;
    v9 = v4;
    -[FAFetchFamilyCircleRequest startRequestWithCompletionHandler:](v7, "startRequestWithCompletionHandler:", v8);

  }
  else
  {
    -[FAFamilySettings _launchPrefsUsingDaemonWithOptions:](self, "_launchPrefsUsingDaemonWithOptions:", v4);
  }

}

void __58__FAFamilySettings_launchiCloudFamilySettingsWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "members");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_launchPrefsUsingDaemonWithOptions:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v9 = (void *)getAAUIFamilySetupPrompterClass_softClass;
    v23 = getAAUIFamilySetupPrompterClass_softClass;
    if (!getAAUIFamilySetupPrompterClass_softClass)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getAAUIFamilySetupPrompterClass_block_invoke;
      v19[3] = &unk_1E85620F8;
      v19[4] = &v20;
      __getAAUIFamilySetupPrompterClass_block_invoke((uint64_t)v19);
      v9 = (void *)v21[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v20, 8);
    v11 = [v10 alloc];
    objc_msgSend(*(id *)(a1 + 32), "iTunesAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithiTunesAccount:", v12);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 32);
    *(_QWORD *)(v14 + 32) = v13;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 32));
    v16 = *(_QWORD **)(a1 + 32);
    v17 = (void *)v16[4];
    objc_msgSend(v16, "presentingViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "promptIfEligibleWithPresentingViewController:isFirstRun:", v18, 0);

  }
}

- (void)_launchPrefsUsingDaemonWithOptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", &__block_literal_global_9);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchICloudFamilySettingsWithOptions:", v4);

}

void __55__FAFamilySettings__launchPrefsUsingDaemonWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1CAEBA000, v3, OS_LOG_TYPE_DEFAULT, "FAFamilySettings: Error from service launching family settings - %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)familySetupPrompterDidFinish:(id)a3
{
  FAFamilySettings *retainedSelf;
  FAFamilySetupPrompter *prompter;

  retainedSelf = self->_retainedSelf;
  self->_retainedSelf = 0;

  prompter = self->_prompter;
  self->_prompter = 0;

}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  self->_presentingViewController = (UIViewController *)a3;
}

- (ACAccount)iTunesAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 64, 1);
}

- (void)setITunesAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isFirstRun
{
  return self->_isFirstRun;
}

- (void)setIsFirstRun:(BOOL)a3
{
  self->_isFirstRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_prompter, 0);
}

@end
