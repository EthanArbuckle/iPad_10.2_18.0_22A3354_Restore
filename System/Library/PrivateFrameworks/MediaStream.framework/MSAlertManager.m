@implementation MSAlertManager

- (MSAlertManager)init
{
  MSAlertManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *personIDToNotification;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSAlertManager;
  v2 = -[MSAlertManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    personIDToNotification = v2->_personIDToNotification;
    v2->_personIDToNotification = v3;

  }
  return v2;
}

- (void)_userDidRespondToNotification:(__CFUserNotification *)a3 info:(id)a4 responseFlags:(unint64_t)a5
{
  __CFDictionary *Mutable;
  NSMutableDictionary *personIDToNotification;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  id v14;

  v14 = a4;
  Mutable = (__CFDictionary *)_notificationToInfo_dict;
  if (!_notificationToInfo_dict)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    _notificationToInfo_dict = (uint64_t)Mutable;
  }
  CFDictionaryRemoveValue(Mutable, a3);
  personIDToNotification = self->_personIDToNotification;
  objc_msgSend(v14, "personID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](personIDToNotification, "removeObjectForKey:", v10);

  objc_msgSend(v14, "completionBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v14, "completionBlock");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[2](v12, 1, a5);

  }
  +[MSPowerAssertionManager sharedManager](MSPowerAssertionManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "releaseUIBusy");

}

- (void)_dismissNotificationForPersonID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFDictionary *Mutable;
  void *v9;
  __CFDictionary *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_personIDToNotification, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Dismissing notification for personID %@", (uint8_t *)&v14, 0xCu);
    }
    v6 = -[NSMutableDictionary objectForKey:](self->_personIDToNotification, "objectForKey:", v4);
    if (v6)
    {
      v7 = (void *)v6;
      Mutable = (const __CFDictionary *)_notificationToInfo_dict;
      if (!_notificationToInfo_dict)
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        _notificationToInfo_dict = (uint64_t)Mutable;
      }
      CFDictionaryGetValue(Mutable, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CFUserNotificationCancel((CFUserNotificationRef)v7);
      -[NSMutableDictionary removeObjectForKey:](self->_personIDToNotification, "removeObjectForKey:", v4);
      v10 = (__CFDictionary *)_notificationToInfo_dict;
      if (!_notificationToInfo_dict)
      {
        v10 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        _notificationToInfo_dict = (uint64_t)v10;
      }
      CFDictionaryRemoveValue(v10, v7);
      objc_msgSend(v9, "completionBlock");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v9, "completionBlock");
        v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v12[2](v12, 0, 3);

      }
      +[MSPowerAssertionManager sharedManager](MSPowerAssertionManager, "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "releaseUIBusy");

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot find notification associated with person ID %@ to dismiss. Ignoring.", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (void)_showNotificationInfo:(id)a3
{
  id v4;
  void *v5;
  __CFDictionary *Mutable;
  NSMutableDictionary *personIDToNotification;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFRunLoop *v11;
  __CFRunLoopSource *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "personID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSAlertManager _dismissNotificationForPersonID:](self, "_dismissNotificationForPersonID:", v5);

  Mutable = (__CFDictionary *)_notificationToInfo_dict;
  if (!_notificationToInfo_dict)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    _notificationToInfo_dict = (uint64_t)Mutable;
  }
  CFDictionarySetValue(Mutable, (const void *)objc_msgSend(v4, "userNotification"), v4);
  personIDToNotification = self->_personIDToNotification;
  v8 = objc_msgSend(v4, "userNotification");
  objc_msgSend(v4, "personID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](personIDToNotification, "setObject:forKey:", v8, v9);

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (__CFRunLoop *)objc_msgSend(v10, "getCFRunLoop");
  v12 = (__CFRunLoopSource *)objc_msgSend(v4, "runLoopSource");

  CFRunLoopAddSource(v11, v12, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  +[MSPowerAssertionManager sharedManager](MSPowerAssertionManager, "sharedManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "retainUIBusy");

}

- (void)displayAlertForPersonID:(id)a3 notificationDict:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  const __CFAllocator *v10;
  __CFUserNotification *v11;
  __CFUserNotification *v12;
  CFRunLoopSourceRef RunLoopSource;
  CFRunLoopSourceRef v14;
  void *v15;
  SInt32 error;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  error = 0;
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, &error, (CFDictionaryRef)a4);
  if (v11)
  {
    v12 = v11;
    RunLoopSource = CFUserNotificationCreateRunLoopSource(v10, v11, (CFUserNotificationCallBack)_notificationCallBack, 0);
    if (RunLoopSource)
    {
      v14 = RunLoopSource;
      +[MSAMNotificationInfo info](MSAMNotificationInfo, "info");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setOwner:", self);
      objc_msgSend(v15, "setPersonID:", v8);
      objc_msgSend(v15, "setRunLoopSource:", v14);
      objc_msgSend(v15, "setUserNotification:", v12);
      objc_msgSend(v15, "setCompletionBlock:", v9);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Showing alert to user.", buf, 2u);
      }
      -[MSAlertManager _showNotificationInfo:](self, "_showNotificationInfo:", v15);

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create user notification run loop source. Cannot display notification.", buf, 2u);
      }
      CFRelease(v12);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v18 = error;
    _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create user notification. Error: %ld", buf, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personIDToNotification, 0);
}

+ (id)sharedAlertManager
{
  if (sharedAlertManager_onceToken != -1)
    dispatch_once(&sharedAlertManager_onceToken, &__block_literal_global_30);
  return (id)sharedAlertManager_mgr;
}

void __36__MSAlertManager_sharedAlertManager__block_invoke()
{
  MSAlertManager *v0;
  void *v1;

  v0 = objc_alloc_init(MSAlertManager);
  v1 = (void *)sharedAlertManager_mgr;
  sharedAlertManager_mgr = (uint64_t)v0;

}

@end
