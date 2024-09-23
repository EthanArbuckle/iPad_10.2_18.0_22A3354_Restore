@implementation MRMediaSuggestionPreferences

- (void)_updateGlobalToggleState
{
  id *v1;
  void *v2;
  CFPropertyListRef v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  int v18;
  id *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    objc_sync_enter(v1);
    -[MRMediaSuggestionPreferences dictionaryRepresentation](v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = CFPreferencesCopyAppValue(CFSTR("ShowWhenListeningEnabled"), CFSTR("com.apple.suggestions"));
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x1E0C9AAB0];
    if (v3)
      v5 = (void *)v3;
    v6 = v5;

    objc_msgSend(v1[3], "setObject:forKeyedSubscript:", v6, CFSTR("HomeScreen"));
    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.Home"));

    v9 = objc_msgSend(v6, "BOOLValue");
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8 ^ 1u);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C9AAA0];
    }
    objc_msgSend(v1[3], "setObject:forKeyedSubscript:", v10, CFSTR("Home"));
    if (v9)

    v11 = (void *)MEMORY[0x1E0C99E20];
    v12 = (void *)CFPreferencesCopyAppValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"));
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1[4], "setObject:forKeyedSubscript:", v13, CFSTR("HomeScreen"));

    objc_msgSend(v1[4], "objectForKeyedSubscript:", CFSTR("HomeScreen"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1[4], "setObject:forKeyedSubscript:", v14, CFSTR("Home"));

    -[MRMediaSuggestionPreferences dictionaryRepresentation](v1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v2, "isEqualToDictionary:", v15);

    if ((v16 & 1) == 0)
    {
      _MRLogForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v1;
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestionPreferences] Updated to new state: %@", (uint8_t *)&v18, 0xCu);
      }

    }
    objc_sync_exit(v1);

    return (void *)(v16 ^ 1u);
  }
  return result;
}

- (id)dictionaryRepresentation
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[MRMediaSuggestionPreferences globalDisplayPreferencesForContexts](v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("globalDisplayPreferencesForContexts"));

    -[MRMediaSuggestionPreferences disabledBundlesForContexts](v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("disabledBundlesForContexts"));

    -[MRMediaSuggestionPreferences bundlesDisabledInAllContexts](v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("bundlesDisabledInAllContexts"));

    objc_sync_exit(v1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)globalDisplayPreferencesForContexts
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)objc_msgSend(v1[3], "mutableCopy");
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)disabledBundlesForContexts
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)objc_msgSend(v1[4], "mutableCopy");
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)bundlesDisabledInAllContexts
{
  id *v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  id v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v2 = v1[4];
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = 0;
      v5 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          v8 = v1[4];
          if (v4)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", v7);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "intersectSet:", v9);
          }
          else
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", v7, (_QWORD)v11);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = (void *)objc_msgSend(v9, "mutableCopy");
          }

        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v3);

      if (v4)
        goto LABEL_16;
    }
    else
    {

    }
    v4 = (void *)objc_opt_new();
LABEL_16:
    objc_sync_exit(v1);

    return v4;
  }
  return 0;
}

- (BOOL)suggestionsDisabledInContext:(id)a3
{
  id v4;
  MRMediaSuggestionPreferences *v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_globalDisplayPreferencesForContexts, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue") ^ 1;

  objc_sync_exit(v5);
  return v7;
}

+ (NSArray)allContexts
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("HomeScreen");
  v3[1] = CFSTR("Home");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (MRMediaSuggestionPreferences)init
{
  MRMediaSuggestionPreferences *v2;
  uint64_t v3;
  NSMutableDictionary *globalDisplayPreferencesForContexts;
  uint64_t v5;
  NSMutableDictionary *disabledBundlesForContexts;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *callbackQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MRMediaSuggestionPreferences;
  v2 = -[MRMediaSuggestionPreferences init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    globalDisplayPreferencesForContexts = v2->_globalDisplayPreferencesForContexts;
    v2->_globalDisplayPreferencesForContexts = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    disabledBundlesForContexts = v2->_disabledBundlesForContexts;
    v2->_disabledBundlesForContexts = (NSMutableDictionary *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.MediaRemote.MRMediaSuggestionPreferences.callbackQueue", v7);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v8;

    -[MRMediaSuggestionPreferences _updateGlobalToggleState](v2);
    -[MRMediaSuggestionPreferences _registerForNotifications](v2);
  }
  return v2;
}

- (void)_registerForNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (a1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_processNotification, CFSTR("com.apple.spotlightui.prefschanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_processNotification, CFSTR("com.apple.suggestions.settingsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (_QWORD)initWithGlobalPreferences:(void *)a3 disabledBundlesForContexts:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)MRMediaSuggestionPreferences;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "mutableCopy");
      v8 = (void *)a1[3];
      a1[3] = v7;

      v9 = objc_msgSend(v6, "mutableCopy");
      v10 = (void *)a1[4];
      a1[4] = v9;

    }
  }

  return a1;
}

- (id)description
{
  MRMediaSuggestionPreferences *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRMediaSuggestionPreferences dictionaryRepresentation](v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, v2, v5);

  objc_sync_exit(v2);
  return v6;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)MRMediaSuggestionPreferences;
  -[MRMediaSuggestionPreferences dealloc](&v4, sel_dealloc);
}

- (void)setUserDisplayPreferencesDidChangeCallback:(id)a3
{
  id v4;
  uint64_t v5;
  id userDisplayPreferencesDidChangeCallback;
  MRMediaSuggestionPreferences *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  v5 = MEMORY[0x194036C44](v4);

  userDisplayPreferencesDidChangeCallback = obj->_userDisplayPreferencesDidChangeCallback;
  obj->_userDisplayPreferencesDidChangeCallback = (id)v5;

  objc_sync_exit(obj);
}

- (_QWORD)snapshot
{
  void **v1;
  _QWORD *v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = -[MRMediaSuggestionPreferences initWithGlobalPreferences:disabledBundlesForContexts:]([MRMediaSuggestionPreferences alloc], v1[3], v1[4]);
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)disabledBundleIdentifiersInContext:(id)a3
{
  id v4;
  MRMediaSuggestionPreferences *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_disabledBundlesForContexts, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_sync_exit(v5);
  return v8;
}

- (void)_notifyListener
{
  _QWORD *v1;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)MEMORY[0x194036C44](v1[1]);
    objc_sync_exit(v1);

    if (v2)
    {
      v3 = v1[2];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__MRMediaSuggestionPreferences__notifyListener__block_invoke;
      block[3] = &unk_1E30C6770;
      v5 = v2;
      dispatch_async(v3, block);

    }
  }
}

uint64_t __47__MRMediaSuggestionPreferences__notifyListener__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)userDisplayPreferencesDidChangeCallback
{
  return self->_userDisplayPreferencesDidChangeCallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledBundlesForContexts, 0);
  objc_storeStrong((id *)&self->_globalDisplayPreferencesForContexts, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_userDisplayPreferencesDidChangeCallback, 0);
}

@end
