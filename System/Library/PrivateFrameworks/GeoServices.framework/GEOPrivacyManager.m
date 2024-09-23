@implementation GEOPrivacyManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__GEOPrivacyManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBC100 != -1)
    dispatch_once(&qword_1ECDBC100, block);
  return (id)_MergedGlobals_246;
}

- (BOOL)hasFiredResetPrivacyWarningsNotification
{
  return self->_hasFiredResetPrivacyWarningsNotification;
}

- (BOOL)hasFiredLocationServicesDisabledNotification
{
  return self->_hasFiredLocationServicesDisabledNotification;
}

void __34__GEOPrivacyManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_246;
  _MergedGlobals_246 = (uint64_t)v1;

}

- (GEOPrivacyManager)init
{
  GEOPrivacyManager *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  GEOPrivacyManager *v6;
  GEOPrivacyManager *v7;
  _QWORD handler[4];
  GEOPrivacyManager *v10;
  objc_super v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)GEOPrivacyManager;
  v2 = -[GEOPrivacyManager init](&v11, sel_init);
  if (v2)
  {
    GEOGetGEOPrivacyManagerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v13 = CFSTR("com.apple.Preferences.ResetPrivacyWarningsNotification");
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "Subscribing for notifications to %{private}@", buf, 0xCu);
    }

    GEOGetGEOPrivacyManagerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v13 = CFSTR("com.apple.callhistory.RecentsClearedNotification");
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Subscribing for notifications to %{private}@", buf, 0xCu);
    }

    GEOGetGEOPrivacyManagerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v13 = CFSTR("com.apple.locationd/Prefs");
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Subscribing for notifications to %{private}@", buf, 0xCu);
    }

    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __25__GEOPrivacyManager_init__block_invoke;
    handler[3] = &unk_1E1C093A8;
    v6 = v2;
    v10 = v6;
    xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E0C80D38], handler);
    v7 = v6;

  }
  return v2;
}

void __25__GEOPrivacyManager_init__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  _QWORD block[4];
  NSObject *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Preferences.ResetPrivacyWarningsNotification")))
  {
    GEOGetGEOPrivacyManagerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v16 = v3;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Received and responding to notification: %{private}@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__GEOPrivacyManager_init__block_invoke_13;
    block[3] = &unk_1E1BFF6F8;
    v14 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v5 = v14;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.callhistory.RecentsClearedNotification")))
  {
    GEOGetGEOPrivacyManagerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v16 = v3;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_INFO, "Received and responding to notification: %{private}@", buf, 0xCu);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __25__GEOPrivacyManager_init__block_invoke_14;
    v11[3] = &unk_1E1BFF6F8;
    v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v11);
    v5 = v12;
  }
  else
  {
    v7 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.locationd/Prefs"));
    GEOGetGEOPrivacyManagerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v16 = v3;
        _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Received and responding to notification: %{private}@", buf, 0xCu);
      }

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __25__GEOPrivacyManager_init__block_invoke_15;
      v9[3] = &unk_1E1BFF6F8;
      v10 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], v9);
      v5 = v10;
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v3;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Received unexpected notification: %{public}@", buf, 0xCu);
    }
  }

}

uint64_t __25__GEOPrivacyManager_init__block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fireResetLocationAndPrivacyNotification");
}

uint64_t __25__GEOPrivacyManager_init__block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fireRecentsClearedNotification");
}

uint64_t __25__GEOPrivacyManager_init__block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locationServicesStateChanged");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GEOPrivacyManager;
  -[GEOPrivacyManager dealloc](&v2, sel_dealloc);
}

- (void)_fireRecentsClearedNotification
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  GEOGetGEOPrivacyManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Firing Recents Cleared notification.", v5, 2u);
  }

  self->_hasFiredCallHistoryRecentsClearedNotification = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", kGEOCallHistoryRecentsClearedNotification, self);

}

- (void)_fireResetLocationAndPrivacyNotification
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  GEOGetGEOPrivacyManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Firing Reset Location and Privacy notification.", v5, 2u);
  }

  self->_hasFiredResetPrivacyWarningsNotification = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", kGEOResetPrivacyWarningsNotification, self);

}

- (void)_locationServicesStateChanged
{
  char v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = objc_msgSend(getCLLocationManagerClass(), "locationServicesEnabled");
  if (!self->_hasLastKnownLocationServicesEnabled || (v3 & 1) == 0)
  {
    self->_lastKnownLocationServicesEnabled = v3;
    self->_hasLastKnownLocationServicesEnabled = 1;
    if ((v3 & 1) == 0)
    {
      GEOGetGEOPrivacyManagerLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Firing Location Services disabled notification", v6, 2u);
      }

      self->_hasFiredLocationServicesDisabledNotification = 1;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:", CFSTR("GEOLocationServicesDisabledNotification"), self);

    }
  }
}

- (BOOL)hasFiredCallHistoryRecentsClearedNotification
{
  return self->_hasFiredCallHistoryRecentsClearedNotification;
}

@end
