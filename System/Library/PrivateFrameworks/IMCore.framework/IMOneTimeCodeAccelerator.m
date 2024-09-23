@implementation IMOneTimeCodeAccelerator

+ (IMSyncedSettingsManaging)syncedSettingsManager
{
  void *v2;
  int v3;
  IMSyncedSettingsManager *v4;
  void *v5;

  if (!qword_1EE65F200)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSyncedSettingsEnabled");

    if (v3)
    {
      v4 = objc_alloc_init(IMSyncedSettingsManager);
      v5 = (void *)qword_1EE65F200;
      qword_1EE65F200 = (uint64_t)v4;

    }
  }
  return (IMSyncedSettingsManaging *)(id)qword_1EE65F200;
}

+ (void)setSyncedSettingsManager:(id)a3
{
  objc_storeStrong((id *)&qword_1EE65F200, a3);
}

- (void)_deleteVerificationCodesDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  void (**v16)(_QWORD, _QWORD);
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Delete Verifications Codes setting updated.", (uint8_t *)&v17, 2u);
    }

  }
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("LocallySet"));

  if ((v8 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "reason is not locally set", (uint8_t *)&v17, 2u);
      }

    }
    -[IMOneTimeCodeAccelerator settingUpdateBlock](self, "settingUpdateBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[IMOneTimeCodeAccelerator syncedSettingsManager](IMOneTimeCodeAccelerator, "syncedSettingsManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "settingValueForKey:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = CFSTR("NO");
          if ((_DWORD)v13)
            v15 = CFSTR("YES");
          v17 = 138412290;
          v18 = v15;
          _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Calling setting update block with %@", (uint8_t *)&v17, 0xCu);
        }

      }
      -[IMOneTimeCodeAccelerator settingUpdateBlock](self, "settingUpdateBlock");
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v16[2](v16, v13);

    }
  }

}

- (IMOneTimeCodeAccelerator)initWithBlockForUpdates:(id)a3
{
  id v4;
  IMOneTimeCodeAccelerator *v5;
  void *v6;
  id updateBlock;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMOneTimeCodeAccelerator;
  v5 = -[IMOneTimeCodeAccelerator init](&v14, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    updateBlock = v5->_updateBlock;
    v5->_updateBlock = v6;

    -[IMOneTimeCodeAccelerator setUpConnectionToDaemaon](v5, "setUpConnectionToDaemaon");
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isSyncedSettingsEnabled");

    if (v9)
    {
      +[IMOneTimeCodeAccelerator syncedSettingsManager](IMOneTimeCodeAccelerator, "syncedSettingsManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        +[IMOneTimeCodeAccelerator syncedSettingsManager](IMOneTimeCodeAccelerator, "syncedSettingsManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObserver:selector:key:", v5, sel__deleteVerificationCodesDidChange_, 2);

      }
    }
  }

  return v5;
}

- (void)consumeCodeWithGuid:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Sending request to daemon to consume code with GUID: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMDaemonMultiplexedConnectionManaging remoteProxy](self->_daemonConnection, "remoteProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "consumeCodeWithMessageGUID:", v4);

}

- (void)onboardDeleteVerificationCodesIfNeededWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Sending request to onboarding delete verification codes if needed", v7, 2u);
    }

  }
  -[IMDaemonMultiplexedConnectionManaging remoteProxy](self->_daemonConnection, "remoteProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onboardDeleteVerificationCodesIfNeededWithReply:", v4);

}

- (void)onboardDeleteVerificationCodesIfNeededWithMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Sending request to onboarding delete verification codes if needed, using custom message: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  -[IMDaemonMultiplexedConnectionManaging remoteProxy](self->_daemonConnection, "remoteProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "onboardDeleteVerificationCodesIfNeededWithMessage:reply:", v6, v7);

}

- (void)setAutoDeletionPreference:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDaemonMultiplexedConnectionManaging remoteProxy](self->_daemonConnection, "remoteProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoDeletionPreference:", v3);

}

- (void)fetchAutoDeletionPreferenceWithCompletionHandler:(id)a3
{
  IMDaemonMultiplexedConnectionManaging *daemonConnection;
  id v4;
  id v5;

  if (a3)
  {
    daemonConnection = self->_daemonConnection;
    v4 = a3;
    -[IMDaemonMultiplexedConnectionManaging remoteProxy](daemonConnection, "remoteProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchAutoDeletionPreferenceWithReply:", v4);

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[IMOneTimeCodeAccelerator setUpdateBlock:](self, "setUpdateBlock:", 0);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSyncedSettingsEnabled");

  if (v5)
  {
    +[IMOneTimeCodeAccelerator syncedSettingsManager](IMOneTimeCodeAccelerator, "syncedSettingsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      +[IMOneTimeCodeAccelerator syncedSettingsManager](IMOneTimeCodeAccelerator, "syncedSettingsManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:key:", self, 2);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)IMOneTimeCodeAccelerator;
  -[IMOneTimeCodeAccelerator dealloc](&v9, sel_dealloc);
}

- (void)setUpConnectionToDaemaon
{
  NSObject *v3;
  void *v4;
  void *v5;
  IMDaemonMultiplexedConnectionManaging *v6;
  IMDaemonMultiplexedConnectionManaging *daemonConnection;
  IMDaemonMultiplexedConnectionManaging *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Setting up IMAgent connect for OTC", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__incomingCodeUpdateFromDaemon_, CFSTR("com.apple.imcore.otcUpdated"), 0);

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "multiplexedConnectionWithLabel:capabilities:context:", CFSTR("com.apple.IMCore.IMOneTimeCodeAccelerator"), 545259520, 0);
  v6 = (IMDaemonMultiplexedConnectionManaging *)objc_claimAutoreleasedReturnValue();
  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = v6;

  v8 = self->_daemonConnection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1A20EE97C;
  v9[3] = &unk_1E471E348;
  v9[4] = self;
  -[IMDaemonMultiplexedConnectionManaging connectWithCompletion:](v8, "connectWithCompletion:", v9);
}

- (void)_incomingCodeUpdateFromDaemon:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Recevied updated valid codes list from daemon: %@", (uint8_t *)&v13, 0xCu);

    }
  }
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("validCodes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMOneTimeCodeAccelerator updateBlock](self, "updateBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = v8 == 0;
  else
    v10 = 1;
  v11 = !v10;

  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Sending codes to SPI ", (uint8_t *)&v13, 2u);
      }

    }
    (*((void (**)(void))self->_updateBlock + 2))();
  }

}

- (id)settingUpdateBlock
{
  return self->_settingUpdateBlock;
}

- (void)setSettingUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (IMDaemonMultiplexedConnectionManaging)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnection, a3);
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong(&self->_settingUpdateBlock, 0);
}

@end
