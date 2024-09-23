@implementation MSAuthenticationManager

- (MSAuthenticationManager)initWithAlertManager:(id)a3
{
  id v5;
  MSAuthenticationManager *v6;
  MSAuthenticationManager *v7;
  ACAccountStore *v8;
  ACAccountStore *acAccountStore;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSAuthenticationManager;
  v6 = -[MSAuthenticationManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_alertManager, a3);
    v8 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    acAccountStore = v7->_acAccountStore;
    v7->_acAccountStore = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__didReceiveAccountConfigChangedNotification, *MEMORY[0x1E0C8F010], v7->_acAccountStore);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C8F010], self->_acAccountStore);

  if (-[MSAuthenticationManager isListeningToKeybagChanges](self, "isListeningToKeybagChanges"))
    notify_cancel(-[MSAuthenticationManager keybagChangeNotifyToken](self, "keybagChangeNotifyToken"));
  v4.receiver = self;
  v4.super_class = (Class)MSAuthenticationManager;
  -[MSAuthenticationManager dealloc](&v4, sel_dealloc);
}

- (void)_renewCredentialsForAccount:(id)a3
{
  id v4;
  ACAccountStore *acAccountStore;
  id v6;
  _QWORD v7[4];
  id v8;
  MSAuthenticationManager *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Renewing credential for %@", buf, 0xCu);
  }
  self->_state = 2;
  acAccountStore = self->_acAccountStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__MSAuthenticationManager__renewCredentialsForAccount___block_invoke;
  v7[3] = &unk_1E994D3C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[ACAccountStore renewCredentialsForAccount:force:reason:completion:](acAccountStore, "renewCredentialsForAccount:force:reason:completion:", v6, 0, CFSTR("Photo Stream"), v7);

}

- (void)waitForDeviceUnlock
{
  const char *v3;
  _QWORD handler[5];

  if (!-[MSAuthenticationManager isListeningToKeybagChanges](self, "isListeningToKeybagChanges"))
  {
    v3 = (const char *)*MEMORY[0x1E0D4E600];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __46__MSAuthenticationManager_waitForDeviceUnlock__block_invoke;
    handler[3] = &unk_1E994D798;
    handler[4] = self;
    if (!notify_register_dispatch(v3, &self->_keybagChangeNotifyToken, MEMORY[0x1E0C80D38], handler))
      -[MSAuthenticationManager setIsListeningToKeybagChanges:](self, "setIsListeningToKeybagChanges:", 1);
  }
}

- (void)didEncounterAuthenticationFailureForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int bagRefetchCount;
  ACAccountStore *acAccountStore;
  _QWORD v10[4];
  id v11;
  MSAuthenticationManager *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Encountered authentication error for personID %@.", buf, 0xCu);
  }
  if (!self->_state)
  {
    -[ACAccountStore aa_primaryAppleAccount](self->_acAccountStore, "aa_primaryAppleAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aa_personID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v5 || !objc_msgSend(v6, "isEqualToString:", v4))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v4;
        _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot find primary account for personID %@. Ignoring authentication error.", buf, 0xCu);
      }
      goto LABEL_20;
    }
    if ((objc_msgSend(v5, "aa_isPrimaryEmailVerified") & 1) != 0)
    {
      if (MKBDeviceUnlockedSinceBoot() == 1)
      {
        bagRefetchCount = self->_bagRefetchCount;
        self->_bagRefetchCount = bagRefetchCount + 1;
        if (bagRefetchCount > 1)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "We've refetched the bag too many times. Prompting user to change password.", buf, 2u);
          }
          -[MSAuthenticationManager _renewCredentialsForAccount:](self, "_renewCredentialsForAccount:", v5);
        }
        else
        {
          self->_state = 1;
          acAccountStore = self->_acAccountStore;
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke;
          v10[3] = &unk_1E994D438;
          v11 = v4;
          v12 = self;
          v13 = v5;
          -[ACAccountStore aa_updatePropertiesForAppleAccount:completion:](acAccountStore, "aa_updatePropertiesForAppleAccount:completion:", v13, v10);

        }
        goto LABEL_20;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "The device has not been unlocked yet. Waiting for unlock.", buf, 2u);
      }
      -[MSAuthenticationManager waitForDeviceUnlock](self, "waitForDeviceUnlock");
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "The account for personID %@ is not yet vetted. Waiting for account change.", buf, 0xCu);
    }
    self->_bagRefetchCount = 0;
    self->_state = 2;
LABEL_20:

    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Ignoring authentication failure as we are already handling a previous authentication error.", buf, 2u);
  }
LABEL_21:

}

- (void)_didReceiveAccountConfigChangedNotification
{
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    if ((self->_state - 1) > 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Received account change notification, but we weren't waiting for it. Ignoring.", v6, 2u);
      }
    }
    else
    {
      self->_state = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Received account change notification. Retrying activities.", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:", CFSTR("MSAuthenticationManagerDidReceiveAuthenticationChangeNotification"), self);

    }
  }
  else
  {
    -[MSAuthenticationManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__didReceiveAccountConfigChangedNotification, 0, 0);
  }
}

- (void)didEncounterAuthenticationSuccessForPersonID:(id)a3
{
  self->_bagRefetchCount = 0;
}

- (void)rearmAuthenticationAlert
{
  int state;
  _BOOL4 v4;
  uint8_t v5[16];
  uint8_t buf[16];

  state = self->_state;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (state == 2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Resetting authentication state. No longer waiting for user to reauth.", buf, 2u);
    }
    self->_state = 0;
  }
  else if (v4)
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Not resetting authentication state as we're waiting for a server response.", v5, 2u);
  }
}

- (BOOL)isWaitingForAuth
{
  return (self->_state - 1) < 2;
}

- (BOOL)isListeningToKeybagChanges
{
  return self->_isListeningToKeybagChanges;
}

- (void)setIsListeningToKeybagChanges:(BOOL)a3
{
  self->_isListeningToKeybagChanges = a3;
}

- (int)keybagChangeNotifyToken
{
  return self->_keybagChangeNotifyToken;
}

- (void)setKeybagChangeNotifyToken:(int)a3
{
  self->_keybagChangeNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acAccountStore, 0);
  objc_storeStrong((id *)&self->_alertManager, 0);
}

void __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  char v15;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke_2;
  block[3] = &unk_1E994D410;
  v15 = a2;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  v14 = v5;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v2 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v11 = v2;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "The account for personID %@ has been successfully reauthenticated.", buf, 0xCu);
    }
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    v5 = *(void **)(v3 + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke_13;
    v8[3] = &unk_1E994D3E8;
    v8[4] = v3;
    v9 = v4;
    objc_msgSend(v5, "saveVerifiedAccount:withCompletionHandler:", v9, v8);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not reauthenticate personID %@. Error: %{public}@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_renewCredentialsForAccount:", *(_QWORD *)(a1 + 48));
  }
}

void __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke_13(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke_2_14;
  block[3] = &unk_1E994D8D0;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__MSAuthenticationManager_didEncounterAuthenticationFailureForPersonID___block_invoke_2_14(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_didReceiveAccountConfigChangedNotification");
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = 138412290;
    v4 = v2;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to save account %@ after authentication.", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t __46__MSAuthenticationManager_waitForDeviceUnlock__block_invoke(uint64_t a1, int a2)
{
  uint64_t result;
  uint8_t v5[16];

  result = MKBGetDeviceLockState();
  if ((_DWORD)result == 3 || !(_DWORD)result)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Device unlocked.", v5, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_didReceiveAccountConfigChangedNotification");
    notify_cancel(a2);
    return objc_msgSend(*(id *)(a1 + 32), "setIsListeningToKeybagChanges:", 0);
  }
  return result;
}

void __55__MSAuthenticationManager__renewCredentialsForAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v5;
      _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to renew credentials for account %@: %@.", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Successfully renewed credentials for account %@", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "_didReceiveAccountConfigChangedNotification");
  }

}

+ (id)sharedManager
{
  if (sharedManager_onceToken_79 != -1)
    dispatch_once(&sharedManager_onceToken_79, &__block_literal_global_80);
  return (id)sharedManager_mgr_81;
}

void __40__MSAuthenticationManager_sharedManager__block_invoke()
{
  MSAuthenticationManager *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [MSAuthenticationManager alloc];
  +[MSAlertManager sharedAlertManager](MSAlertManager, "sharedAlertManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[MSAuthenticationManager initWithAlertManager:](v0, "initWithAlertManager:", v3);
  v2 = (void *)sharedManager_mgr_81;
  sharedManager_mgr_81 = v1;

}

@end
