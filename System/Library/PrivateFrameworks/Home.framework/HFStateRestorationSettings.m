@implementation HFStateRestorationSettings

- (void)setSelectedHomeIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Saving home identifier %@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(v3, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("HFSelectedHomeKey"), v6, CFSTR("com.apple.sync.NanoHome"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.sync.NanoHome"));
  notify_post("HFHomeSyncPreferencesDidChange");

}

+ (HFStateRestorationSettings)sharedInstance
{
  if (_MergedGlobals_259 != -1)
    dispatch_once(&_MergedGlobals_259, &__block_literal_global_11_7);
  return (HFStateRestorationSettings *)(id)qword_1ED379160;
}

- (NSUUID)selectedHomeIdentifier
{
  void *v2;
  void *v3;

  CFPreferencesAppSynchronize(CFSTR("com.apple.sync.NanoHome"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("HFSelectedHomeKey"), CFSTR("com.apple.sync.NanoHome"));
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);
  else
    v3 = 0;

  return (NSUUID *)v3;
}

void __34__HFStateRestorationSettings_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_selectedHomeDidChange");

}

- (void)_selectedHomeDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HFStateRestorationSettings selectedHomeIdentifier](self, "selectedHomeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HFStateRestorationSettings observers](self, "observers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "stateRestorationSettings:selectedHomeIdentifierDidUpdateExternally:", self, v3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFStateRestorationSettings observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

void __44__HFStateRestorationSettings_sharedInstance__block_invoke_2()
{
  HFStateRestorationSettings *v0;
  void *v1;

  v0 = objc_alloc_init(HFStateRestorationSettings);
  v1 = (void *)qword_1ED379160;
  qword_1ED379160 = (uint64_t)v0;

}

- (HFStateRestorationSettings)init
{
  HFStateRestorationSettings *v2;
  uint64_t v3;
  NSHashTable *observers;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HFStateRestorationSettings;
  v2 = -[HFStateRestorationSettings init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    objc_initWeak(&location, v2);
    v5 = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __34__HFStateRestorationSettings_init__block_invoke;
    v8[3] = &unk_1EA727D48;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch("HFHomeSyncPreferencesDidChange", &v2->_notifyRegistrationToken, v5, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (NSString)selectedHomeAppTabIdentifier
{
  return (NSString *)-[HFStateRestorationSettings _homeAppPreferencesValueForKey:ofClass:](self, "_homeAppPreferencesValueForKey:ofClass:", CFSTR("HOLastSelectedTab"), objc_opt_class());
}

- (id)_homeAppPreferencesValueForKey:(id)a3 ofClass:(Class)a4
{
  void *v4;
  void *v5;
  id v6;

  v4 = (id)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.Home"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(-[HFStateRestorationSettings notifyRegistrationToken](self, "notifyRegistrationToken"));
  v3.receiver = self;
  v3.super_class = (Class)HFStateRestorationSettings;
  -[HFStateRestorationSettings dealloc](&v3, sel_dealloc);
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFStateRestorationSettings observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (NSUUID)selectedRoomIdentifierForSelectedHome
{
  void *v3;
  void *v4;

  -[HFStateRestorationSettings selectedHomeIdentifier](self, "selectedHomeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStateRestorationSettings selectedRoomIdentifierForHomeIdentifier:](self, "selectedRoomIdentifierForHomeIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v4;
}

- (id)selectedRoomIdentifierForHomeIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HFStateRestorationSettings _roomKeyForHomeIdentifier:](self, "_roomKeyForHomeIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStateRestorationSettings _homeAppPreferencesValueForKey:ofClass:](self, "_homeAppPreferencesValueForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
  else
    v6 = 0;

  return v6;
}

- (void)saveSelectedRoomIdentifier:(id)a3 forHomeIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[HFStateRestorationSettings _roomKeyForHomeIdentifier:](self, "_roomKeyForHomeIdentifier:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFStateRestorationSettings _setHomeAppPreferencesValue:forKey:](self, "_setHomeAppPreferencesValue:forKey:", v7, v8);
}

- (id)_roomKeyForHomeIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, CFSTR("-selectedRoom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setSelectedHomeAppTabIdentifier:(id)a3
{
  -[HFStateRestorationSettings _setHomeAppPreferencesValue:forKey:](self, "_setHomeAppPreferencesValue:forKey:", a3, CFSTR("HOLastSelectedTab"));
}

- (void)syncToNanoPrefs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("HFSelectedHomeKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.sync.NanoHome"), v5);

}

- (void)_setHomeAppPreferencesValue:(id)a3 forKey:(id)a4
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  int v8;
  __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (__CFString *)a4;
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Updating value for Home.app preference %@ to: %@", (uint8_t *)&v8, 0x16u);
  }

  CFPreferencesSetAppValue(v6, v5, CFSTR("com.apple.Home"));
}

- (int)notifyRegistrationToken
{
  return self->_notifyRegistrationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
