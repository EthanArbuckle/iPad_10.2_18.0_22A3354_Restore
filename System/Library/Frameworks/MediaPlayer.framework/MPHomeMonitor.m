@implementation MPHomeMonitor

+ (BOOL)isCurrentDeviceValidHomeAccessory
{
  int v2;
  void *v3;
  char v4;

  v2 = _os_feature_enabled_impl();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAudioAccessory");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (MPHomeMonitor)init
{
  MPHomeMonitor *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPHomeMonitor;
  v2 = -[MPHomeMonitor init](&v7, sel_init);
  if (v2)
  {
    +[MPHomeManagerObserver sharedObserver](MPHomeManagerObserver, "sharedObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", v2);

    if (!+[MPHomeMonitor isCurrentDeviceValidHomeAccessory](MPHomeMonitor, "isCurrentDeviceValidHomeAccessory"))
    {
      v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_FAULT, "MPHomeMonitor initialized for non-valid accessory", v6, 2u);
      }

    }
  }
  return v2;
}

- (BOOL)isSoundCheckEnabled
{
  void *v2;
  char v3;

  +[MPHomeManagerObserver sharedObserver](MPHomeManagerObserver, "sharedObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSoundCheckEnabled");

  return v3;
}

- (void)setSoundCheckEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[MPHomeManagerObserver sharedObserver](MPHomeManagerObserver, "sharedObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSoundCheckEnabled:", v3);

}

- (void)_postNotificationWithName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  MPHomeMonitor *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "<MPHomeMonitor %p> Posting Notification: %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", v4, self);

}

- (void)currentHomeDidChange
{
  -[MPHomeMonitor _postNotificationWithName:](self, "_postNotificationWithName:", CFSTR("MPHomeManagerObserverCurrentHomeDidChangeNotification"));
}

- (void)currentUserDidChange
{
  -[MPHomeMonitor _postNotificationWithName:](self, "_postNotificationWithName:", CFSTR("MPHomeManagerObserverCurrentUserDidChangeNotification"));
}

- (void)homeUsersDidChange
{
  -[MPHomeMonitor _postNotificationWithName:](self, "_postNotificationWithName:", CFSTR("MPHomeManagerObserverUsersDidChangeNotification"));
}

- (void)soundCheckSettingDidUpdate:(BOOL)a3
{
  -[MPHomeMonitor _postNotificationWithName:](self, "_postNotificationWithName:", CFSTR("MPHomeManagerObserverSoundCheckSettingChangedNotification"));
}

+ (void)setupIfNecessary
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  int v7;
  NSObject *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory](MPHomeMonitor, "isCurrentDeviceValidHomeAccessory"))
  {
    +[MPHomeMonitor sharedMonitor](MPHomeMonitor, "sharedMonitor");
    v2 = objc_claimAutoreleasedReturnValue();
    +[MPHomeManagerObserver sharedObserver](MPHomeManagerObserver, "sharedObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(v3, "setupDidComplete");
      v6 = CFSTR("Setting up");
      if (v5)
        v6 = CFSTR("Setup complete");
      v7 = 134218242;
      v8 = v2;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeMonitor setupIfNecessary:] <MPHomeMonitor %p> %@", (uint8_t *)&v7, 0x16u);
    }

  }
  else
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "[MPHomeMonitor setupIfNecessary:] Ignoring - Device is not valid home accessory", (uint8_t *)&v7, 2u);
    }
  }

}

+ (MPHomeMonitor)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_45723);
  return (MPHomeMonitor *)(id)sharedMonitor___sharedMonitor;
}

void __30__MPHomeMonitor_sharedMonitor__block_invoke()
{
  MPHomeMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(MPHomeMonitor);
  v1 = (void *)sharedMonitor___sharedMonitor;
  sharedMonitor___sharedMonitor = (uint64_t)v0;

}

@end
