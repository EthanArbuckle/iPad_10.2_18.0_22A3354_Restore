@implementation MCUserNotificationManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_39);
  return (id)sharedManager_manager_0;
}

void __42__MCUserNotificationManager_sharedManager__block_invoke()
{
  MCUserNotificationManager *v0;
  void *v1;

  v0 = objc_alloc_init(MCUserNotificationManager);
  v1 = (void *)sharedManager_manager_0;
  sharedManager_manager_0 = (uint64_t)v0;

}

- (MCUserNotificationManager)init
{
  MCUserNotificationManager *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  MCUserNotificationManager *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCUserNotificationManager;
  v2 = -[MCUserNotificationManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__MCUserNotificationManager_init__block_invoke;
    v7[3] = &unk_1E41E4048;
    v8 = v2;
    v5 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.managedconfiguration.appwhitelistdidchange"), 0, v4, v7);

  }
  return v2;
}

void __33__MCUserNotificationManager_init__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MCUserNotificationManager_init__block_invoke_2;
  block[3] = &unk_1E41E0C18;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __33__MCUserNotificationManager_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mainQueueDidReceiveAppWhitelistChangedNotification");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[MCUserNotificationManager cancelAllNotificationsCompletionBlock:](self, "cancelAllNotificationsCompletionBlock:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MCUserNotificationManager;
  -[MCUserNotificationManager dealloc](&v4, sel_dealloc);
}

- (BOOL)hasOutstandingNotifications
{
  NSObject *v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  syncQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MCUserNotificationManager_hasOutstandingNotifications__block_invoke;
  block[3] = &unk_1E41E35E0;
  block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __56__MCUserNotificationManager_hasOutstandingNotifications__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = syncQueueCurrentlyVisibleNotificationEntry != 0;
  return result;
}

- (void)promptUserToLogIntoiTunesWithTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, uint64_t, _QWORD);
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  void (**v19)(id, uint64_t, _QWORD);
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, uint64_t, _QWORD))a6;
  if (MCIsEffectivelyInAppWhitelistMode())
  {
    v13 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_ERROR, "Device is in an explicit whitelist mode", buf, 2u);
    }
    if (v12)
      v12[2](v12, 3, 0);
  }
  else
  {
    syncQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke;
    v15[3] = &unk_1E41E40E8;
    v19 = v12;
    v16 = v9;
    v17 = v10;
    v18 = v11;
    dispatch_async(v14, v15);

  }
}

void __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  MCUserNotificationQueueEntry *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  syncQueueiTunesLoginCompletionBlocks();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    MCLocalizedString(CFSTR("MDM_APP_INSTALL_BUTTON_LOGIN"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("MDM_APP_INSTALL_BUTTON_CANCEL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 56))
    {
      v6 = (void *)MEMORY[0x1A1AF040C]();
      objc_msgSend(v2, "addObject:", v6);

    }
    v7 = objc_alloc_init(MCUserNotificationQueueEntry);
    -[MCUserNotificationQueueEntry setTitle:](v7, "setTitle:", *(_QWORD *)(a1 + 32));
    -[MCUserNotificationQueueEntry setMessage:](v7, "setMessage:", *(_QWORD *)(a1 + 40));
    -[MCUserNotificationQueueEntry setDefaultButtonText:](v7, "setDefaultButtonText:", v4);
    -[MCUserNotificationQueueEntry setAlternateButtonText:](v7, "setAlternateButtonText:", v5);
    -[MCUserNotificationQueueEntry setDisplayOnLockScreen:](v7, "setDisplayOnLockScreen:", 0);
    -[MCUserNotificationQueueEntry setDisplayInAppWhitelistModes:](v7, "setDisplayInAppWhitelistModes:", 0);
    -[MCUserNotificationQueueEntry setDismissAfterTimeInterval:](v7, "setDismissAfterTimeInterval:", 900.0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke_89;
    v9[3] = &unk_1E41E40C0;
    v10 = *(id *)(a1 + 48);
    -[MCUserNotificationQueueEntry setCompletionBlock:](v7, "setCompletionBlock:", v9);
    objc_msgSend(*(id *)(a1 + 48), "park");
    syncQueueNotificationQueue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

    syncQueueCheckToShowNextNotification();
    goto LABEL_9;
  }
  v3 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v3, OS_LOG_TYPE_DEFAULT, "An iTunes login prompt is already shown. Not showing another prompt.", buf, 2u);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v4 = (void *)MEMORY[0x1A1AF040C]();
    objc_msgSend(v2, "addObject:", v4);
LABEL_9:

  }
}

void __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke_89(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  int v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "unpark");
  syncQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke_2;
  block[3] = &unk_1E41E4098;
  v11 = a2;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  v7 = v5;
  dispatch_async(v6, block);

}

void __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  int v10;

  syncQueueiTunesLoginCompletionBlocks();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_msgSend(v2, "copy");
    objc_msgSend(v2, "removeAllObjects");
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke_3;
    v6[3] = &unk_1E41E4070;
    v7 = v3;
    v10 = *(_DWORD *)(a1 + 48);
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v5 = v3;
    dispatch_async(v4, v6);

  }
}

void __98__MCUserNotificationManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    *(_DWORD *)buf = 67109120;
    v18 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEFAULT, "Calling completions for %d iTunes login events.", buf, 8u);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1A1AF0250](v6);
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v10 + 16))(v10, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v6;
    }
    while (v6);
  }

}

- (void)inviteUserToVPPWithTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  syncQueue();
  v13 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke;
  v18[3] = &unk_1E41E40E8;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  v17 = v12;
  dispatch_async(v13, v18);

}

void __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  MCUserNotificationQueueEntry *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[16];

  syncQueueVPPInvitationCompletionBlocks();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    MCLocalizedFormat(CFSTR("MDM_CAD_CONTINUE_BUTTON"), v3, v4, v5, v6, v7, v8, v9, v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(CFSTR("MDM_CAD_CANCEL_BUTTON"), v12, v13, v14, v15, v16, v17, v18, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 56))
    {
      v20 = (void *)MEMORY[0x1A1AF040C]();
      objc_msgSend(v2, "addObject:", v20);

    }
    v21 = objc_alloc_init(MCUserNotificationQueueEntry);
    -[MCUserNotificationQueueEntry setTitle:](v21, "setTitle:", *(_QWORD *)(a1 + 32));
    -[MCUserNotificationQueueEntry setMessage:](v21, "setMessage:", *(_QWORD *)(a1 + 40));
    -[MCUserNotificationQueueEntry setDefaultButtonText:](v21, "setDefaultButtonText:", v11);
    -[MCUserNotificationQueueEntry setAlternateButtonText:](v21, "setAlternateButtonText:", v19);
    -[MCUserNotificationQueueEntry setDisplayOnLockScreen:](v21, "setDisplayOnLockScreen:", 0);
    -[MCUserNotificationQueueEntry setDisplayInAppWhitelistModes:](v21, "setDisplayInAppWhitelistModes:", 0);
    -[MCUserNotificationQueueEntry setDismissAfterTimeInterval:](v21, "setDismissAfterTimeInterval:", 0.0);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke_95;
    v25[3] = &unk_1E41E40C0;
    v26 = *(id *)(a1 + 48);
    -[MCUserNotificationQueueEntry setCompletionBlock:](v21, "setCompletionBlock:", v25);
    objc_msgSend(*(id *)(a1 + 48), "park");
    syncQueueNotificationQueue();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v21);

    syncQueueCheckToShowNextNotification();
    goto LABEL_9;
  }
  v10 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v10, OS_LOG_TYPE_DEFAULT, "An invitation prompt is already shown. Not showing another one.", buf, 2u);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v11 = (void *)MEMORY[0x1A1AF040C]();
    objc_msgSend(v2, "addObject:", v11);
LABEL_9:

  }
}

void __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke_95(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  int v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "unpark");
  syncQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke_2;
  block[3] = &unk_1E41E4098;
  v11 = a2;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  v7 = v5;
  dispatch_sync(v6, block);

}

void __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;

  syncQueueVPPInvitationCompletionBlocks();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "removeAllObjects");
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke_3;
    block[3] = &unk_1E41E4110;
    v9 = v3;
    v12 = v2;
    v13 = *(_DWORD *)(a1 + 48);
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v5 = v2;
    v6 = v3;
    dispatch_sync(v4, block);

  }
}

void __88__MCUserNotificationManager_inviteUserToVPPWithTitle_message_assertion_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    *(_DWORD *)buf = 67109120;
    v18 = objc_msgSend(v3, "count") + 1;
    _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_DEFAULT, "Calling completions for %d invitation prompts", buf, 8u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1A1AF0250](v6);
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v10 + 16))(v10, 3, *(_QWORD *)(a1 + 40));
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v6;
    }
    while (v6);
  }

}

- (id)displayQueueProfileError:(id)a3 targetDevice:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  __CFString *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = v6;
  while (v9)
  {
    v12 = v11;
    v11 = v9;

    objc_msgSend(v11, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v11, "localizedDescription");
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }

    objc_msgSend(v11, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v6, "MCContainsErrorDomain:code:", CFSTR("MCProfileErrorDomain"), 1016))
  {
    MCLocalizedString(CFSTR("INSTALL_PROFILE_ERROR_INCOMPATIBLE_TITLE"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("INSTALL_PROFILE_ERROR_INCOMPATIBLE_MESSAGE");
LABEL_9:
    MCLocalizedString(v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    v19 = 0;
LABEL_11:
    v10 = v18;
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "MCContainsErrorDomain:code:", CFSTR("MCProfileErrorDomain"), 1017))
  {
    MCLocalizedString(CFSTR("INSTALL_PROFILE_ERROR_UNSUPPORTED_TITLE"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("INSTALL_PROFILE_ERROR_UNSUPPORTED_MESSAGE");
    goto LABEL_9;
  }
  objc_msgSend(v6, "domain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("MCInstallationErrorDomain"));

  if (!v26)
  {
    v19 = 0;
    v16 = 0;
    goto LABEL_12;
  }
  v27 = objc_msgSend(v6, "code");
  v19 = 0;
  if (v27 <= 4036)
  {
    if (v27 != 4009)
    {
      if (v27 == 4035)
      {
        objc_msgSend(v6, "userInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v8);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = v10;
        v41 = 0;
        -[MCUserNotificationManager _updateTitle:andMessage:withTargetFailureInfoForDevice:fromError:](self, "_updateTitle:andMessage:withTargetFailureInfoForDevice:fromError:", &v41, &v40, a4, v32);
        v16 = v41;
        v18 = v40;

        goto LABEL_10;
      }
      if (v27 == 4036)
      {
        MCLocalizedString(CFSTR("INSTALL_PROFILE_TITLE"));
        v16 = (id)objc_claimAutoreleasedReturnValue();
        -[MCUserNotificationManager _purgatoryMessageForDevice:](self, "_purgatoryMessageForDevice:", a4);
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_43:
        v18 = (id)v28;

        MCLocalizedString(CFSTR("INSTALL_PROFILE_OK"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      goto LABEL_44;
    }
    v30 = v11;
LABEL_37:
    v16 = 0;
    goto LABEL_21;
  }
  if (v27 != 4037)
  {
    if (v27 == 4054)
    {
      MCLocalizedString(CFSTR("INSTALL_PROFILE_DISABLED_TITLE"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("ERROR_PROFILE_DRIVEN_ENROLLMENT_BLOCKED");
    }
    else
    {
      if (v27 != 4055)
      {
LABEL_44:
        v16 = 0;
        goto LABEL_12;
      }
      MCLocalizedString(CFSTR("INSTALL_PROFILE_DISABLED_TITLE"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("ERROR_PROFILE_DRIVEN_USER_ENROLLMENT_NOT_SUPPORTED");
    }
    MCLocalizedErrorStringByDevice(v29);
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  objc_msgSend(v6, "userInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("RestrictionCause"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v34, "isEqualToString:", CFSTR("Profile")))
  {
    v35 = CFSTR("INSTALL_PROFILE_DISABLED_MESSAGE_PROFILE");
LABEL_50:
    MCLocalizedString(v35);
    v36 = objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  if (!objc_msgSend(v34, "isEqualToString:", CFSTR("LockdownMode")))
  {
    if ((objc_msgSend(v34, "isEqualToString:", CFSTR("StolenDeviceProtection")) & 1) != 0)
    {
      v37 = v11;

      goto LABEL_37;
    }
    v35 = CFSTR("INSTALL_PROFILE_DISABLED_MESSAGE");
    goto LABEL_50;
  }
  MCLocalizedStringByDevice(CFSTR("INSTALL_PROFILE_DISABLED_MESSAGE_LOCKDOWN_MODE"));
  v36 = objc_claimAutoreleasedReturnValue();
LABEL_51:
  v38 = (void *)v36;

  MCLocalizedString(CFSTR("INSTALL_PROFILE_DISABLED_TITLE"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v10 = v38;
LABEL_12:
  if (!v10)
  {
    v20 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v6;
      _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_FAULT, "Please file a radar to 'Remote Management - MDMv1 | All' to add a user notification for error: %{public}@", buf, 0xCu);
    }
    MCLocalizedString(CFSTR("INSTALL_PROFILE_ERROR_GENERAL_MESSAGE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = v16;
  if (v16)
  {
    if (v19)
      goto LABEL_18;
LABEL_23:
    MCLocalizedString(CFSTR("INSTALL_PROFILE_ERROR_OK"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v39) = 1;
    LOWORD(v39) = 0;
    -[MCUserNotificationManager displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:](self, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", 0, v21, v10, v24, 0, 0, 0.0, 0, v39, 0, 0);

    if (v16)
      goto LABEL_20;
    goto LABEL_19;
  }
  MCLocalizedString(CFSTR("INSTALL_PROFILE_ERROR_GENERAL_TITLE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_23;
LABEL_18:
  BYTE2(v39) = 1;
  LOWORD(v39) = 0;
  -[MCUserNotificationManager displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:](self, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", 0, v21, v10, v19, 0, 0, 0.0, 0, v39, 0, 0);
  if (!v16)
LABEL_19:

LABEL_20:
  v22 = v11;

LABEL_21:
  return v11;
}

- (void)displayUserNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButtonText:(id)a6 alternateButtonText:(id)a7 otherButtonText:(id)a8 textfieldPlaceholder:(id)a9 displayOnLockScreen:(BOOL)a10 dismissOnLock:(BOOL)a11 displayInAppWhitelistModes:(BOOL)a12 dismissAfterTimeInterval:(double)a13 assertion:(id)a14 completionBlock:(id)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  MCUserNotificationQueueEntry *v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  MCUserNotificationQueueEntry *v41;
  id v42;
  id v43;
  void *v44;
  _QWORD block[4];
  MCUserNotificationQueueEntry *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint8_t buf[16];

  v42 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v25 = a8;
  v26 = a9;
  v27 = a14;
  v28 = a15;
  if (a12 || !MCIsEffectivelyInAppWhitelistMode())
  {
    v43 = v25;
    v44 = v27;
    v31 = v23;
    v32 = v21;
    v33 = v28;
    v34 = v26;
    v35 = v24;
    v36 = v22;
    v37 = objc_alloc_init(MCUserNotificationQueueEntry);
    -[MCUserNotificationQueueEntry setTitle:](v37, "setTitle:", v21);
    -[MCUserNotificationQueueEntry setMessage:](v37, "setMessage:", v22);
    -[MCUserNotificationQueueEntry setDefaultButtonText:](v37, "setDefaultButtonText:", v31);
    -[MCUserNotificationQueueEntry setAlternateButtonText:](v37, "setAlternateButtonText:", v35);
    -[MCUserNotificationQueueEntry setOtherButtonText:](v37, "setOtherButtonText:", v43);
    -[MCUserNotificationQueueEntry setTextfieldPlaceholder:](v37, "setTextfieldPlaceholder:", v34);
    -[MCUserNotificationQueueEntry setDisplayOnLockScreen:](v37, "setDisplayOnLockScreen:", a10);
    -[MCUserNotificationQueueEntry setDismissOnLock:](v37, "setDismissOnLock:", a11);
    -[MCUserNotificationQueueEntry setDisplayInAppWhitelistModes:](v37, "setDisplayInAppWhitelistModes:", a12);
    -[MCUserNotificationQueueEntry setDismissAfterTimeInterval:](v37, "setDismissAfterTimeInterval:", a13);
    v38 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __268__MCUserNotificationManager_displayUserNotificationWithIdentifier_title_message_defaultButtonText_alternateButtonText_otherButtonText_textfieldPlaceholder_displayOnLockScreen_dismissOnLock_displayInAppWhitelistModes_dismissAfterTimeInterval_assertion_completionBlock___block_invoke;
    v47[3] = &unk_1E41E4138;
    v39 = v44;
    v48 = v39;
    v49 = v33;
    -[MCUserNotificationQueueEntry setCompletionBlock:](v37, "setCompletionBlock:", v47);
    v30 = v42;
    -[MCUserNotificationQueueEntry setIdentifier:](v37, "setIdentifier:", v42);
    objc_msgSend(v39, "park");
    syncQueue();
    v40 = objc_claimAutoreleasedReturnValue();
    block[0] = v38;
    v22 = v36;
    v24 = v35;
    v26 = v34;
    v28 = v33;
    block[1] = 3221225472;
    block[2] = __268__MCUserNotificationManager_displayUserNotificationWithIdentifier_title_message_defaultButtonText_alternateButtonText_otherButtonText_textfieldPlaceholder_displayOnLockScreen_dismissOnLock_displayInAppWhitelistModes_dismissAfterTimeInterval_assertion_completionBlock___block_invoke_2;
    block[3] = &unk_1E41E0C18;
    v46 = v37;
    v41 = v37;
    dispatch_barrier_async(v40, block);

    v21 = v32;
    v23 = v31;
    v25 = v43;
    v27 = v44;

  }
  else
  {
    v29 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v29, OS_LOG_TYPE_DEFAULT, "Not displaying notification in limited apps mode.", buf, 2u);
    }
    v30 = v42;
    if (v28)
      (*((void (**)(id, uint64_t, _QWORD))v28 + 2))(v28, 3, 0);
  }

}

void __268__MCUserNotificationManager_displayUserNotificationWithIdentifier_title_message_defaultButtonText_alternateButtonText_otherButtonText_textfieldPlaceholder_displayOnLockScreen_dismissOnLock_displayInAppWhitelistModes_dismissAfterTimeInterval_assertion_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "unpark");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void __268__MCUserNotificationManager_displayUserNotificationWithIdentifier_title_message_defaultButtonText_alternateButtonText_otherButtonText_textfieldPlaceholder_displayOnLockScreen_dismissOnLock_displayInAppWhitelistModes_dismissAfterTimeInterval_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;

  syncQueueNotificationQueue();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

  syncQueueCheckToShowNextNotification();
}

- (void)cancelAllNotificationsCompletionBlock:(id)a3
{
  -[MCUserNotificationManager cancelNotificationEntriesMatchingPredicate:completionBlock:](self, "cancelNotificationEntriesMatchingPredicate:completionBlock:", &__block_literal_global_127, a3);
}

uint64_t __67__MCUserNotificationManager_cancelAllNotificationsCompletionBlock___block_invoke()
{
  return 1;
}

- (void)mainQueueDidReceiveAppWhitelistChangedNotification
{
  NSObject *v2;

  syncQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_barrier_sync(v2, &__block_literal_global_128);

}

void __79__MCUserNotificationManager_mainQueueDidReceiveAppWhitelistChangedNotification__block_invoke()
{
  NSObject *v0;
  __CFUserNotification *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (MCIsEffectivelyInAppWhitelistMode())
  {
    if (syncQueueCurrentlyVisibleNotificationEntry
      && (objc_msgSend((id)syncQueueCurrentlyVisibleNotificationEntry, "displayInAppWhitelistModes") & 1) == 0)
    {
      v0 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19ECC4000, v0, OS_LOG_TYPE_INFO, "Dismissing notification because we entered limited apps mode.", buf, 2u);
      }
      objc_msgSend((id)syncQueueCurrentlyVisibleNotificationEntry, "notification");
      v1 = (__CFUserNotification *)objc_claimAutoreleasedReturnValue();
      CFUserNotificationCancel(v1);

      v2 = (void *)syncQueueCurrentlyVisibleNotificationEntry;
      syncQueueCurrentlyVisibleNotificationEntry = 0;

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    syncQueueNotificationQueue();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v10, "displayInAppWhitelistModes"))
            v11 = v4;
          else
            v11 = v3;
          objc_msgSend(v11, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v7);
    }

    syncQueueNotificationQueue();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    syncQueueNotificationQueue();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v4);

    if (objc_msgSend(v3, "count"))
    {
      v14 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        v16 = objc_msgSend(v3, "count");
        *(_DWORD *)buf = 67109120;
        v25 = v16;
        _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_INFO, "Canceling %d pending notifications because we entered limited apps mode.", buf, 8u);

      }
      dispatch_get_global_queue(0, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79__MCUserNotificationManager_mainQueueDidReceiveAppWhitelistChangedNotification__block_invoke_130;
      block[3] = &unk_1E41E0C18;
      v19 = v3;
      dispatch_async(v17, block);

    }
  }
}

void __79__MCUserNotificationManager_mainQueueDidReceiveAppWhitelistChangedNotification__block_invoke_130(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v6, "completionBlock", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "completionBlock");
          v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v8[2](v8, 3, 0);

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

}

- (void)cancelNotificationsWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__MCUserNotificationManager_cancelNotificationsWithIdentifier_completionBlock___block_invoke;
  v8[3] = &unk_1E41E41A0;
  v9 = v6;
  v7 = v6;
  -[MCUserNotificationManager cancelNotificationEntriesMatchingPredicate:completionBlock:](self, "cancelNotificationEntriesMatchingPredicate:completionBlock:", v8, a4);

}

uint64_t __79__MCUserNotificationManager_cancelNotificationsWithIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)cancelNotificationEntriesMatchingPredicate:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke;
    v7[3] = &unk_1E41E4218;
    v8 = v5;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  syncQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke_2;
  v3[3] = &unk_1E41E4218;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_barrier_sync(v2, v3);

}

void __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke_2(uint64_t a1)
{
  __CFUserNotification *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  if (syncQueueCurrentlyVisibleNotificationEntry && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_msgSend((id)syncQueueCurrentlyVisibleNotificationEntry, "notification");
    v2 = (__CFUserNotification *)objc_claimAutoreleasedReturnValue();
    CFUserNotificationCancel(v2);

  }
  syncQueueNotificationQueue();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke_3;
  v14[3] = &unk_1E41E41C8;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v5, "predicateWithBlock:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  syncQueueNotificationQueue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectsInArray:", v7);

  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke_4;
  block[3] = &unk_1E41E41F0;
  v12 = v7;
  v13 = *(id *)(a1 + 40);
  v10 = v7;
  dispatch_async(v9, block);

}

uint64_t __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__MCUserNotificationManager_cancelNotificationEntriesMatchingPredicate_completionBlock___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "completionBlock", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v7, "completionBlock");
          v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v9[2](v9, 3, 0);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateTitle:(id *)a3 andMessage:(id *)a4 withTargetFailureInfoForDevice:(unint64_t)a5 fromError:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  switch(objc_msgSend(a6, "code"))
  {
    case 1011:
      MCLocalizedString(CFSTR("INSTALL_WARNING_TARGET_GENERAL_TITLE"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      -[MCUserNotificationManager _invalidTargetMessageForDevice:](self, "_invalidTargetMessageForDevice:", a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1012:
      -[MCUserNotificationManager _updateTitle:andMessage:withUnavailableTargetInfoForDevice:](self, "_updateTitle:andMessage:withUnavailableTargetInfoForDevice:", a3, a4, a5);
      return;
    case 1014:
      MCLocalizedString(CFSTR("INSTALL_WARNING_TARGET_UNAVAILABLE_WATCH_TITLE"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      MCLocalizedFormat(CFSTR("INSTALL_WARNING_TARGET_UNAVAILABLE_WATCH_ARCHIVED_MESSAGE"), v11, v12, v13, v14, v15, v16, v17, v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1015:
      MCLocalizedString(CFSTR("INSTALL_WARNING_TARGET_GENERAL_TITLE"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      MCLocalizedStringByDevice(CFSTR("INSTALL_WARNING_TARGET_MISMATCH_MESSAGE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      *a4 = v10;
      break;
    default:
      return;
  }
}

- (void)_updateTitle:(id *)a3 andMessage:(id *)a4 withUnavailableTargetInfoForDevice:(unint64_t)a5
{
  __CFString *v7;
  void *v8;

  if (a5 == 3)
  {
    MCLocalizedString(CFSTR("INSTALL_WARNING_TARGET_UNAVAILABLE_HOMEPOD_TITLE"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("INSTALL_WARNING_TARGET_UNAVAILABLE_HOMEPOD_MESSAGE");
  }
  else if (a5 == 2)
  {
    MCLocalizedString(CFSTR("INSTALL_WARNING_TARGET_UNAVAILABLE_WATCH_TITLE"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    if (!MCGestaltIsPhone())
    {
      MCLocalizedStringByDevice(CFSTR("INSTALL_WARNING_TARGET_MISMATCH_MESSAGE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v7 = CFSTR("INSTALL_WARNING_TARGET_UNAVAILABLE_WATCH_MESSAGE");
  }
  else
  {
    MCLocalizedString(CFSTR("INSTALL_WARNING_TARGET_UNAVAILABLE_TITLE"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("INSTALL_WARNING_TARGET_UNAVAILABLE_MESSAGE");
  }
  MCLocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  *a4 = v8;
}

- (id)_purgatoryMessageForDevice:(unint64_t)a3
{
  unint64_t v4;
  __CFString *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3 - 1;
  if (a3 - 1 < 7 && ((0x67u >> v4) & 1) != 0)
  {
    v5 = off_1E41E4308[v4];
  }
  else
  {
    v6 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      +[MCProfile stringForDeviceType:](MCProfile, "stringForDeviceType:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "MCUserNotificationManager: No purgatory message for device of type %{public}@", (uint8_t *)&v10, 0xCu);

    }
    v5 = CFSTR("INSTALL_PROFILE_MESSAGE_SETTINGS_APP");
  }
  MCLocalizedString(v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_invalidTargetMessageForDevice:(unint64_t)a3
{
  __CFString *v3;

  if (a3 - 1 > 5)
    v3 = CFSTR("INSTALL_WARNING_TARGET_INVALID_MESSAGE");
  else
    v3 = off_1E41E42B8[a3 - 1];
  MCLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
