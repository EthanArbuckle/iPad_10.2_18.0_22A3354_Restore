@implementation AFPreferences

- (BOOL)suppressDictationOptIn
{
  return _AFSupportPreferencesBoolForKeyWithDefault(CFSTR("Suppress Dictation Opt In"), 0);
}

- (id)_languageCodeWithFallback:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  -[AFPreferences _registerForLanguageCodeChangeNotifications](self, "_registerForLanguageCodeChangeNotifications");
  _AFPreferencesValueForKeyWithContext(CFSTR("Session Language"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3 && !v5)
  {
    -[AFPreferences bestSupportedLanguageCodeForLanguageCode:](self, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[AFPreferences _languageCodeWithFallback:]";
      v11 = 2112;
      v12 = v6;
      _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s No language code saved, but Assistant is enabled - returning: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v6;
}

- (BOOL)dictationIsEnabled
{
  AFPreferences *v2;
  void *v3;

  v2 = self;
  -[AFPreferences _registerForDictationEnablementChangeNotifications](self, "_registerForDictationEnablementChangeNotifications");
  _AFPreferencesValueForKeyWithContext(CFSTR("Dictation Enabled"), CFSTR("com.apple.assistant.support"), v2->_instanceContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = _AFPreferencesBoolFromValueWithDefault(v3, (uint64_t)CFSTR("Dictation Enabled"), 0);

  return (char)v2;
}

- (BOOL)assistantIsEnabled
{
  AFPreferences *v2;
  void *v3;

  v2 = self;
  -[AFPreferences _registerForAssistantEnablementChangeNotifications](self, "_registerForAssistantEnablementChangeNotifications");
  _AFPreferencesValueForKeyWithContext(CFSTR("Assistant Enabled"), CFSTR("com.apple.assistant.support"), v2->_instanceContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = _AFPreferencesBoolFromValueWithDefault(v3, (uint64_t)CFSTR("Assistant Enabled"), 0);

  return (char)v2;
}

- (void)_registerForAssistantEnablementChangeNotifications
{
  atomic_flag *p_registeredForAssistantEnablement;
  unsigned __int8 v4;

  p_registeredForAssistantEnablement = &self->_registeredForAssistantEnablement;
  do
    v4 = __ldaxr((unsigned __int8 *)p_registeredForAssistantEnablement);
  while (__stlxr(1u, (unsigned __int8 *)p_registeredForAssistantEnablement));
  if ((v4 & 1) == 0)
  {
    -[AFPreferences _registerForInternalPrefs](self, "_registerForInternalPrefs");
    -[AFPreferences _registerForDarwinNotification:block:](self, "_registerForDarwinNotification:block:", CFSTR("AFAssistantEnablementDidChangeDarwinNotification"), &__block_literal_global_777);
  }
}

- (void)_registerForDictationEnablementChangeNotifications
{
  atomic_flag *p_registeredForDictationEnablement;
  unsigned __int8 v4;

  p_registeredForDictationEnablement = &self->_registeredForDictationEnablement;
  do
    v4 = __ldaxr((unsigned __int8 *)p_registeredForDictationEnablement);
  while (__stlxr(1u, (unsigned __int8 *)p_registeredForDictationEnablement));
  if ((v4 & 1) == 0)
  {
    -[AFPreferences _registerForInternalPrefs](self, "_registerForInternalPrefs");
    -[AFPreferences _registerForDarwinNotification:block:](self, "_registerForDarwinNotification:block:", CFSTR("AFDictationEnablementDidChangeDarwinNotification"), &__block_literal_global_778);
  }
}

- (void)_registerForLanguageCodeChangeNotifications
{
  atomic_flag *p_registeredForLanguageCode;
  unsigned __int8 v4;

  p_registeredForLanguageCode = &self->_registeredForLanguageCode;
  do
    v4 = __ldaxr((unsigned __int8 *)p_registeredForLanguageCode);
  while (__stlxr(1u, (unsigned __int8 *)p_registeredForLanguageCode));
  if ((v4 & 1) == 0)
  {
    -[AFPreferences _registerForInternalPrefs](self, "_registerForInternalPrefs");
    -[AFPreferences _registerForDarwinNotification:block:](self, "_registerForDarwinNotification:block:", CFSTR("AFLanguageCodeDidChangeDarwinNotification"), &__block_literal_global_774);
  }
}

void __34__AFPreferences_sharedPreferences__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[AFInstanceContext currentContext](AFInstanceContext, "currentContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[AFPreferences sharedPreferencesWithInstanceContext:](AFPreferences, "sharedPreferencesWithInstanceContext:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedPreferences_sSharedPreferences;
  sharedPreferences_sSharedPreferences = v0;

}

+ (id)sharedPreferencesWithInstanceContext:(id)a3
{
  id v3;
  AFPreferences *v4;

  v3 = a3;
  v4 = -[AFPreferences initWithInstanceContext:]([AFPreferences alloc], "initWithInstanceContext:", v3);

  return v4;
}

- (AFPreferences)initWithInstanceContext:(id)a3
{
  id v4;
  AFPreferences *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *navTokenQueue;
  AFInstanceContext *v9;
  AFInstanceContext *instanceContext;
  uint64_t v11;
  AFPreferencesNotificationCenter *trampoline;
  NSMutableArray *v13;
  NSMutableArray *trampolineObservers;
  NSLock *v15;
  NSLock *trampolineObserverListLock;
  NSObject *v17;
  AFInstanceContext *v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  AFPreferences *v24;
  __int16 v25;
  AFInstanceContext *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AFPreferences;
  v5 = -[AFPreferences init](&v20, sel_init);
  if (v5)
  {
    if (AFLogInitIfNeeded_once != -1)
      dispatch_once(&AFLogInitIfNeeded_once, &__block_literal_global_2748);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("navTokenQueue", v6);
    navTokenQueue = v5->_navTokenQueue;
    v5->_navTokenQueue = (OS_dispatch_queue *)v7;

    if (v4)
    {
      v9 = (AFInstanceContext *)v4;
    }
    else
    {
      +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
      v9 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v9;

    +[AFPreferencesNotificationCenter sharedInstance](AFPreferencesNotificationCenter, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    trampoline = v5->_trampoline;
    v5->_trampoline = (AFPreferencesNotificationCenter *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    trampolineObservers = v5->_trampolineObservers;
    v5->_trampolineObservers = v13;

    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    trampolineObserverListLock = v5->_trampolineObserverListLock;
    v5->_trampolineObserverListLock = v15;

    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v19 = v5->_instanceContext;
      *(_DWORD *)buf = 136315650;
      v22 = "-[AFPreferences initWithInstanceContext:]";
      v23 = 2048;
      v24 = v5;
      v25 = 2112;
      v26 = v19;
      _os_log_debug_impl(&dword_19AF50000, v17, OS_LOG_TYPE_DEBUG, "%s %p %@", buf, 0x20u);
    }
    -[AFPreferences _registerForDarwinNotification:block:](v5, "_registerForDarwinNotification:block:", CFSTR("kAFPreferencesDidChangeDarwinNotification"), &__block_literal_global_770);
  }

  return v5;
}

- (void)_registerForDarwinNotification:(__CFString *)a3 block:(id)a4
{
  id v6;
  AFPreferencesNotificationCenter *trampoline;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  trampoline = self->_trampoline;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__AFPreferences__registerForDarwinNotification_block___block_invoke;
  v10[3] = &unk_1E3A2EA38;
  objc_copyWeak(&v12, &location);
  v8 = v6;
  v11 = v8;
  -[AFPreferencesNotificationCenter addObserverForDarwinName:usingBlock:](trampoline, "addObserverForDarwinName:usingBlock:", a3, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_trampolineObserverListLock, "lock");
  -[NSMutableArray addObject:](self->_trampolineObservers, "addObject:", v9);
  -[NSLock unlock](self->_trampolineObserverListLock, "unlock");

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_registerForInternalPrefs
{
  atomic_flag *p_registeredForInternalPrefs;
  unsigned __int8 v3;

  p_registeredForInternalPrefs = &self->_registeredForInternalPrefs;
  do
    v3 = __ldaxr((unsigned __int8 *)p_registeredForInternalPrefs);
  while (__stlxr(1u, (unsigned __int8 *)p_registeredForInternalPrefs));
  if ((v3 & 1) == 0)
    -[AFPreferences _registerForDarwinNotification:block:](self, "_registerForDarwinNotification:block:", CFSTR("AFInternalPreferencesDidChangeDarwinNotification"), &__block_literal_global_773);
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1)
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_754);
  return (id)sharedPreferences_sSharedPreferences;
}

- (BOOL)isDictationHIPAACompliant
{
  if (AFDeviceHighestLanguageModelCapabilityIdentifier_onceToken != -1)
    dispatch_once(&AFDeviceHighestLanguageModelCapabilityIdentifier_onceToken, &__block_literal_global_475);
  if (AFDeviceHighestLanguageModelCapabilityIdentifier_deviceHighestCapabilityIdentifier == 1
    && AFDictationHasHighQualityModels()
    && -[AFPreferences siriDataSharingOptInStatus](self, "siriDataSharingOptInStatus") != 1
    && !-[AFPreferences assistantIsEnabled](self, "assistantIsEnabled")
    && -[AFPreferences dictationIsEnabled](self, "dictationIsEnabled"))
  {
    return _AFPreferencesForceOnDeviceOnlyDictationEnabled();
  }
  else
  {
    return 0;
  }
}

- (int64_t)siriDataSharingOptInStatus
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
  return _AFPreferencesSiriDataSharingOptInStatusWithContext(self->_instanceContext);
}

- (id)offlineDictationStatus
{
  void *v2;
  void *v3;
  id v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Offline Dictation Status"), CFSTR("com.apple.assistant.support"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)languageCode
{
  return -[AFPreferences _languageCodeWithFallback:](self, "_languageCodeWithFallback:", 1);
}

- (BOOL)deviceHasPairedWatches
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("Has paired watches"), 0, CFSTR("com.apple.assistant"), self->_instanceContext);
}

- (BOOL)deviceHasAtvOrHomepodInHome
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("Has ATV or HomePods in the home"), 0, CFSTR("com.apple.assistant"), self->_instanceContext);
}

- (id)_AFSupportPreferencesValueForKey:(id)a3
{
  return _AFPreferencesValueForKeyWithContext((const __CFString *)a3, CFSTR("com.apple.assistant.support"), 0);
}

- (void)_AFSupportPreferencesSetValue:(id)a3 forKey:(id)a4
{
  _AFPreferencesSetValueForKeyWithContext(a3, (const __CFString *)a4, CFSTR("com.apple.assistant.support"), 0);
}

- (void)_preferencesDidChangeExternally
{
  NSObject *v3;
  void *v4;
  AFInstanceContext *instanceContext;
  int v6;
  const char *v7;
  __int16 v8;
  AFPreferences *v9;
  __int16 v10;
  AFInstanceContext *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    v6 = 136315650;
    v7 = "-[AFPreferences _preferencesDidChangeExternally]";
    v8 = 2048;
    v9 = self;
    v10 = 2112;
    v11 = instanceContext;
    _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s %p %@", (uint8_t *)&v6, 0x20u);
  }
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AFPreferencesDidChangeNotification"), self);

}

- (void)_internalPreferencesDidChangeExternally
{
  NSObject *v3;
  AFInstanceContext *instanceContext;
  int v5;
  const char *v6;
  __int16 v7;
  AFPreferences *v8;
  __int16 v9;
  AFInstanceContext *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    v5 = 136315650;
    v6 = "-[AFPreferences _internalPreferencesDidChangeExternally]";
    v7 = 2048;
    v8 = self;
    v9 = 2112;
    v10 = instanceContext;
    _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s %p %@", (uint8_t *)&v5, 0x20u);
  }
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
}

- (void)_languageCodeDidChangeExternally
{
  void *v3;
  void *v4;
  AFInstanceContext *instanceContext;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  AFPreferences *v11;
  __int16 v12;
  AFInstanceContext *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
  v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    v6 = v3;
    -[AFPreferences languageCode](self, "languageCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315906;
    v9 = "-[AFPreferences _languageCodeDidChangeExternally]";
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = instanceContext;
    v14 = 2112;
    v15 = v7;
    _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s %p %@ languageCode = %@", (uint8_t *)&v8, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AFLanguageCodeDidChangeNotification"), 0);

}

- (void)_outputVoiceDidChangeExternally
{
  void *v3;
  void *v4;
  AFInstanceContext *instanceContext;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  AFPreferences *v11;
  __int16 v12;
  AFInstanceContext *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
  v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    v6 = v3;
    -[AFPreferences outputVoice](self, "outputVoice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315906;
    v9 = "-[AFPreferences _outputVoiceDidChangeExternally]";
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = instanceContext;
    v14 = 2112;
    v15 = v7;
    _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s %p %@ outputVoice = %@", (uint8_t *)&v8, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AFOutputVoiceDidChangeNotification"), 0);

}

- (void)_nanoPrefsDidChangeExternally
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("AFNanoPreferencesDidChangeNotification"), 0);

}

- (void)_assistantEnablementDidChangeExternally
{
  void *v3;
  AFInstanceContext *instanceContext;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  AFPreferences *v9;
  __int16 v10;
  AFInstanceContext *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
  v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    v5 = v3;
    v6 = 136315906;
    v7 = "-[AFPreferences _assistantEnablementDidChangeExternally]";
    v8 = 2048;
    v9 = self;
    v10 = 2112;
    v11 = instanceContext;
    v12 = 1024;
    v13 = -[AFPreferences assistantIsEnabled](self, "assistantIsEnabled");
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s %p %@ assistantIsEnabled = %d", (uint8_t *)&v6, 0x26u);

  }
}

- (void)_dictationEnablementDidChangeExternally
{
  void *v3;
  AFInstanceContext *instanceContext;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  AFPreferences *v9;
  __int16 v10;
  AFInstanceContext *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
  v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    v5 = v3;
    v6 = 136315906;
    v7 = "-[AFPreferences _dictationEnablementDidChangeExternally]";
    v8 = 2048;
    v9 = self;
    v10 = 2112;
    v11 = instanceContext;
    v12 = 1024;
    v13 = -[AFPreferences dictationIsEnabled](self, "dictationIsEnabled");
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s %p %@ dictationIsEnabled = %d", (uint8_t *)&v6, 0x26u);

  }
}

- (void)synchronizeLogPreferencesDomain
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.logging"));
}

- (void)synchronizeAVVCPreferencesDomain
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.avfoundation.avvc"));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)AFPreferences;
  -[AFPreferences description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {instanceContext = %@}"), v4, self->_instanceContext);

  return v5;
}

- (AFPreferences)init
{
  return -[AFPreferences initWithInstanceContext:](self, "initWithInstanceContext:", 0);
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  AFInstanceContext *instanceContext;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  AFPreferences *v18;
  __int16 v19;
  AFInstanceContext *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_trampolineObservers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[AFPreferencesNotificationCenter removeObserver:](self->_trampoline, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
    }
    while (v5);
  }

  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    *(_DWORD *)buf = 136315650;
    v16 = "-[AFPreferences dealloc]";
    v17 = 2048;
    v18 = self;
    v19 = 2112;
    v20 = instanceContext;
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s %p %@", buf, 0x20u);
  }
  v10.receiver = self;
  v10.super_class = (Class)AFPreferences;
  -[AFPreferences dealloc](&v10, sel_dealloc);
}

- (id)instanceContext
{
  return self->_instanceContext;
}

- (void)synchronize
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  AFInstanceContext *instanceContext;
  int v6;
  const char *v7;
  __int16 v8;
  AFPreferences *v9;
  __int16 v10;
  AFInstanceContext *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    v6 = 136315650;
    v7 = "-[AFPreferences synchronize]";
    v8 = 2048;
    v9 = self;
    v10 = 2112;
    v11 = instanceContext;
    _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s %p %@", (uint8_t *)&v6, 0x20u);
  }
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kAFPreferencesDidChangeDarwinNotification"), 0, 0, 1u);
}

- (void)_registerForOutputVoice
{
  atomic_flag *p_registeredForOutputVoice;
  unsigned __int8 v4;

  p_registeredForOutputVoice = &self->_registeredForOutputVoice;
  do
    v4 = __ldaxr((unsigned __int8 *)p_registeredForOutputVoice);
  while (__stlxr(1u, (unsigned __int8 *)p_registeredForOutputVoice));
  if ((v4 & 1) == 0)
  {
    -[AFPreferences _registerForInternalPrefs](self, "_registerForInternalPrefs");
    -[AFPreferences _registerForDarwinNotification:block:](self, "_registerForDarwinNotification:block:", CFSTR("AFOutputLanguageDidChangeDarwinNotification"), &__block_literal_global_775);
  }
}

- (void)_registerForNanoPrefsChangeNotifications
{
  atomic_flag *p_registeredForNanoPrefs;
  unsigned __int8 v4;

  p_registeredForNanoPrefs = &self->_registeredForNanoPrefs;
  do
    v4 = __ldaxr((unsigned __int8 *)p_registeredForNanoPrefs);
  while (__stlxr(1u, (unsigned __int8 *)p_registeredForNanoPrefs));
  if ((v4 & 1) == 0)
  {
    -[AFPreferences _registerForDarwinNotification:block:](self, "_registerForDarwinNotification:block:", CFSTR("com.apple.assistant.nano.preferences.did_change"), &__block_literal_global_776);
    -[AFPreferences _registerForDarwinNotification:block:](self, "_registerForDarwinNotification:block:", CFSTR("com.apple.assistant.nano.preferences.did_change.internal"), &__block_literal_global_776);
  }
}

- (BOOL)enableEuclidAlternatives
{
  return +[AFFeatureFlags isDictationEuclidAlternativesEnabled](AFFeatureFlags, "isDictationEuclidAlternativesEnabled");
}

- (id)enabledDictationLocales
{
  void *v2;
  void *v3;
  id v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("DictationLanguagesEnabled"), CFSTR("com.apple.keyboard.preferences"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)activeDictationLanguages
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AFPreferences enabledDictationLocales](self, "enabledDictationLocales");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");

        if (v12)
        {
          objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)dictationSLSLanguagesEnabled
{
  void *v2;
  void *v3;
  id v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Dictation SLS Languages Enabled"), CFSTR("com.apple.assistant.support"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)isSmartLanguageSelectionEnabled
{
  void *v2;
  void *v3;
  char v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Dictation SLS Enabled"), CFSTR("com.apple.assistant.support"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    if (AFDeviceHighestLanguageModelCapabilityIdentifier_onceToken != -1)
      dispatch_once(&AFDeviceHighestLanguageModelCapabilityIdentifier_onceToken, &__block_literal_global_475);
    v4 = AFDeviceHighestLanguageModelCapabilityIdentifier_deviceHighestCapabilityIdentifier ^ 1;
  }

  return v4 & 1;
}

- (void)setSmartLanguageSelection:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  AFInstanceContext *v5;
  id v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = self->_instanceContext;
  objc_msgSend(v4, "numberWithBool:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v6, CFSTR("Dictation SLS Enabled"), CFSTR("com.apple.assistant.support"), v5);

}

- (BOOL)offlineDictationOverride
{
  void *v2;
  char v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Enable Offline Dictation Override"), CFSTR("com.apple.assistant.support"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setOfflineDictationOverride:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  AFInstanceContext *v5;
  id v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = self->_instanceContext;
  objc_msgSend(v4, "numberWithBool:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v6, CFSTR("Enable Offline Dictation Override"), CFSTR("com.apple.assistant.support"), v5);

}

- (void)setOfflineDictationStatus:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, CFSTR("Offline Dictation Status"), CFSTR("com.apple.assistant.support"), self->_instanceContext);
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
}

- (id)offlineDictationProfileOverridePath
{
  void *v2;
  void *v3;
  id v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Offline Dictation Profile Override Path"), CFSTR("com.apple.assistant.support"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setOfflineDictationProfileOverridePath:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, CFSTR("Offline Dictation Profile Override Path"), CFSTR("com.apple.assistant.support"), self->_instanceContext);
}

- (id)speechProfileExternalOfflineModelRootPath
{
  void *v2;
  void *v3;
  id v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Speech Profile External Offline Model Root Path"), CFSTR("com.apple.assistant.support"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setSpeechProfileExternalOfflineModelRootPath:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, CFSTR("Speech Profile External Offline Model Root Path"), CFSTR("com.apple.assistant.support"), self->_instanceContext);
}

- (void)_setAssistantIsEnabledLocal:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  AFInstanceContext *instanceContext;
  void *v7;
  AFInstanceContext *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "-[AFPreferences _setAssistantIsEnabledLocal:]";
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v10, 0x12u);
  }
  instanceContext = self->_instanceContext;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = instanceContext;
  objc_msgSend(v7, "numberWithBool:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v9, CFSTR("Assistant Enabled"), CFSTR("com.apple.assistant.support"), v8);

}

- (void)_setDictationIsEnabledLocal:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  AFInstanceContext *instanceContext;
  void *v7;
  AFInstanceContext *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "-[AFPreferences _setDictationIsEnabledLocal:]";
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v10, 0x12u);
  }
  instanceContext = self->_instanceContext;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = instanceContext;
  objc_msgSend(v7, "numberWithBool:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v9, CFSTR("Dictation Enabled"), CFSTR("com.apple.assistant.support"), v8);

  CFPreferencesSetAppValue(CFSTR("Dictation Enabled"), v9, CFSTR("com.apple.UIKit"));
}

- (void)setAssistantIsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  AFSettingsConnection *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFPreferences setAssistantIsEnabled:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  v6 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setAssistantEnabled:](v6, "setAssistantEnabled:", v3);
  -[AFSettingsConnection barrier](v6, "barrier");

}

- (void)setDictationIsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  AFSettingsConnection *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFPreferences setDictationIsEnabled:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  v6 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setDictationEnabled:](v6, "setDictationEnabled:", v3);
  -[AFSettingsConnection barrier](v6, "barrier");

}

- (BOOL)_dictationIsAllowed
{
  void *v2;
  char v3;

  _AFSupportPreferencesBoolValueForKey(CFSTR("Dictation Allowed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _AFPreferencesBoolFromValueWithDefault(v2, (uint64_t)CFSTR("Dictation Allowed"), 1);

  return v3;
}

- (void)_setDictationIsAllowed:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFPreferences _setDictationIsAllowed:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v5, CFSTR("Dictation Allowed"), CFSTR("com.apple.assistant.support"), 0);
  CFPreferencesSetAppValue(CFSTR("Dictation Allowed"), v5, CFSTR("com.apple.UIKit"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kAFPreferencesDidChangeDarwinNotification"), 0, 0, 1u);

}

- (BOOL)onDeviceDictationAvailableAlertPresented
{
  return _AFSupportPreferencesBoolForKeyWithDefault(CFSTR("On Device Dictation Available Alert Presented"), 0);
}

- (void)_setOnDeviceDictationAvailableAlertPresentedLocal:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[AFPreferences _setOnDeviceDictationAvailableAlertPresentedLocal:]";
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v6, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v5, CFSTR("On Device Dictation Available Alert Presented"), CFSTR("com.apple.assistant.support"), 0);

  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
}

- (void)setOnDeviceDictationAvailableAlertPresented:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  AFSettingsConnection *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFPreferences setOnDeviceDictationAvailableAlertPresented:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  v6 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setOnDeviceDictationAvailableAlertPresented:](v6, "setOnDeviceDictationAvailableAlertPresented:", v3);

}

- (void)getOfflineDictationStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  AFSettingsConnection *v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__8870;
  v14 = __Block_byref_object_dispose__8871;
  v15 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__AFPreferences_getOfflineDictationStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E3A2EB68;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  objc_msgSend(v5, "getOfflineDictationStatusWithCompletion:", v7);

  _Block_object_dispose(&v10, 8);
}

- (BOOL)forceOfflineRecognitionEnabled
{
  void *v3;
  char v4;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (!AFIsInternalInstall_isInternal)
    return 0;
  _AFPreferencesValueForKeyWithContext(CFSTR("Force Offline Recognition Enabled"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setForceOfflineRecognitionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFPreferences setForceOfflineRecognitionEnabled:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v6, CFSTR("Force Offline Recognition Enabled"), CFSTR("com.apple.assistant"), self->_instanceContext);

  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
}

- (BOOL)utteranceDetectionEnabled
{
  void *v3;
  char v4;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (!AFIsInternalInstall_isInternal)
    return 0;
  _AFPreferencesValueForKeyWithContext(CFSTR("Utterance Detection Enabled"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setUtteranceDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFPreferences setUtteranceDetectionEnabled:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v6, CFSTR("Utterance Detection Enabled"), CFSTR("com.apple.assistant"), self->_instanceContext);

  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
}

- (BOOL)preferOnlineRecognitionEnabled
{
  void *v3;
  char v4;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (!AFIsInternalInstall_isInternal)
    return 0;
  _AFPreferencesValueForKeyWithContext(CFSTR("Prefer Online Recognition Enabled"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setPreferOnlineRecognitionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFPreferences setPreferOnlineRecognitionEnabled:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v6, CFSTR("Prefer Online Recognition Enabled"), CFSTR("com.apple.assistant"), self->_instanceContext);

  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
}

- (void)setDictationSLSLanguagesEnabled:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, CFSTR("Dictation SLS Languages Enabled"), CFSTR("com.apple.assistant.support"), self->_instanceContext);
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
}

- (void)resetSessionLanguage
{
  _AFPreferencesSetValueForKeyWithContext(0, CFSTR("Session Language"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
}

- (BOOL)isInRestrictedSharingMode
{
  return 0;
}

- (BOOL)dictationAutoPunctuationEnabled
{
  return _AFSupportPreferencesBoolForKeyWithDefault(CFSTR("Dictation Auto Punctuation Enabled"), 1);
}

- (BOOL)displayedLowStorageNotificationForLanguage:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _AFSupportPreferencesValueForKey:](self, "_AFSupportPreferencesValueForKey:", CFSTR("Displayed Low Storage Notification Status"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "containsObject:", v4);
  else
    v6 = 0;

  return v6;
}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  AFSettingsConnection *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "-[AFPreferences suppressLowStorageNotificationForLanguage:suppress:]";
    v11 = 2112;
    v12 = v6;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s language: %@, suppress: %d", (uint8_t *)&v9, 0x1Cu);
  }
  v8 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection suppressLowStorageNotificationForLanguage:suppress:](v8, "suppressLowStorageNotificationForLanguage:suppress:", v6, v4);
  -[AFSettingsConnection barrier](v8, "barrier");

}

- (void)_suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _AFSupportPreferencesValueForKey:](self, "_AFSupportPreferencesValueForKey:", CFSTR("Displayed Low Storage Notification Status"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v9, "containsObject:", v14);
    if (v4)
    {
      if ((v10 & 1) == 0)
      {
        objc_msgSend(v9, "arrayByAddingObject:", v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFPreferences _AFSupportPreferencesSetValue:forKey:](self, "_AFSupportPreferencesSetValue:forKey:", v11, CFSTR("Displayed Low Storage Notification Status"));

        -[AFPreferences synchronize](self, "synchronize");
      }
    }
    else if (v10)
    {
      v12 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v12, "removeObject:", v14);
      v13 = (void *)objc_msgSend(v12, "copy");
      -[AFPreferences _AFSupportPreferencesSetValue:forKey:](self, "_AFSupportPreferencesSetValue:forKey:", v13, CFSTR("Displayed Low Storage Notification Status"));

      -[AFPreferences synchronize](self, "synchronize");
    }
  }

}

- (void)setDictationAutoPunctuationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  AFSettingsConnection *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFPreferences setDictationAutoPunctuationEnabled:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  v6 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setDictationAutoPunctuationEnabled:](v6, "setDictationAutoPunctuationEnabled:", v3);
  -[AFSettingsConnection barrier](v6, "barrier");

}

- (void)_setDictationAutoPunctuationEnabledLocal:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFPreferences _setDictationAutoPunctuationEnabledLocal:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v6, CFSTR("Dictation Auto Punctuation Enabled"), CFSTR("com.apple.assistant.support"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (id)dictationAutoPunctuationSupportedLocales
{
  if (dictationAutoPunctuationSupportedLocales_onceToken != -1)
    dispatch_once(&dictationAutoPunctuationSupportedLocales_onceToken, &__block_literal_global_789);
  return (id)dictationAutoPunctuationSupportedLocales_supportedLocales;
}

- (BOOL)allowExplicitContent
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("Allow Explicit Content"), 0, CFSTR("com.apple.assistant.support"), self->_instanceContext);
}

- (int64_t)getSearchQueriesDataSharingStatus
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
  return _AFPreferencesSearchQueriesDataSharingStatusWithContext(self->_instanceContext);
}

- (void)setSearchQueriesDataSharingStatus:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _BYTE *v15;
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  AFSettingsConnection *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 2)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_1E3A33DD0[a3];
    v10 = v9;
    *(_DWORD *)buf = 136315395;
    *(_QWORD *)&buf[4] = "-[AFPreferences setSearchQueriesDataSharingStatus:completion:]";
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v17 = __Block_byref_object_copy__8870;
  v18 = __Block_byref_object_dispose__8871;
  v19 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  v11 = *(void **)(*(_QWORD *)&buf[8] + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__AFPreferences_setSearchQueriesDataSharingStatus_completion___block_invoke;
  v13[3] = &unk_1E3A2EBB0;
  v12 = v6;
  v14 = v12;
  v15 = buf;
  objc_msgSend(v11, "setSearchQueriesDataSharingStatus:completion:", a3, v13);

  _Block_object_dispose(buf, 8);
}

- (BOOL)startAlertEnabled
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("StartAlertEnabled"), 0, CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
}

- (void)setStartAlertEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("StartAlertEnabled"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);

}

- (BOOL)showServerOnUI
{
  AFInstanceContext *v3;
  char v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
  v3 = self->_instanceContext;
  if (AFIsCustomerInstallOrPPT())
    v4 = 0;
  else
    v4 = _AFPreferencesBoolValueForKeyWithContext(CFSTR("Show Server on UI"), 1, CFSTR("com.apple.assistant.backedup"), v3);

  return v4;
}

- (void)setShowServerOnUI:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  AFInstanceContext *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = self->_instanceContext;
  objc_msgSend(v5, "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v7, CFSTR("Show Server on UI"), CFSTR("com.apple.assistant.backedup"), v6);

  -[AFPreferences synchronize](self, "synchronize");
}

- (BOOL)debugButtonIsEnabled
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
  if (AFIsCustomerInstallOrPPT())
    return 0;
  else
    return _AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Debug Button Enabled"), 1);
}

- (void)setDebugButtonIsEnabled:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Debug Button Enabled"), CFSTR("com.apple.assistant.backedup"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (BOOL)siriXDebugStatusEnabled
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
  if (AFIsCustomerInstallOrPPT())
    return 0;
  else
    return _AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Siri X Debug Status Enabled"), 0);
}

- (void)setSiriXDebugStatusEnabled:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Siri X Debug Status Enabled"), CFSTR("com.apple.assistant.backedup"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (BOOL)showsHoldToTalkIndicator
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("Indicate Hold-To-Talk Mode"), 0, CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
}

- (void)setShowsHoldToTalkIndicator:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Indicate Hold-To-Talk Mode"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);

}

- (BOOL)suppressAssistantOptIn
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("Suppress Assistant Opt In"), 0, CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
}

- (void)setSuppressAssistantOptIn:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  AFInstanceContext *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = self->_instanceContext;
  objc_msgSend(v5, "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v7, CFSTR("Suppress Assistant Opt In"), CFSTR("com.apple.assistant.backedup"), v6);

  -[AFPreferences synchronize](self, "synchronize");
}

- (void)setSuppressDictationOptIn:(BOOL)a3
{
  _AFPreferencesSetSuppressDictationOptIn(a3);
  -[AFPreferences synchronize](self, "synchronize");
}

- (void)_setSuppressDictationOptInLocal:(BOOL)a3
{
  _AFPreferencesSetSuppressDictationOptIn(a3);
}

- (BOOL)alwaysAllowVoiceActivation
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Always Allow Voice Activation"), 0);
}

- (void)setAlwaysAllowVoiceActivation:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Always Allow Voice Activation"), CFSTR("com.apple.assistant.backedup"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (BOOL)siriResponseShouldAlwaysPrintWithoutOverride
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Always Print Siri Response"), 0);
}

- (BOOL)siriResponseShouldAlwaysPrint
{
  if ((_AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Always Print Siri Response"), 0) & 1) != 0)
    return 1;
  else
    return _AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Always Print Siri Response Override"), 0);
}

- (void)setSiriResponseShouldAlwaysPrint:(BOOL)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v5, CFSTR("Always Print Siri Response"), CFSTR("com.apple.assistant.backedup"), 0);

  if (!a3)
    _AFPreferencesSetSiriResponseShouldAlwaysPrintOverride(0);
  -[AFPreferences synchronize](self, "synchronize");
}

- (BOOL)alwaysObscureBackgroundContentWhenActive
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Always Obscure Background Content When Active"), 0);
}

- (void)setAlwaysObscureBackgroundContentWhenActive:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Always Obscure Background Content When Active"), CFSTR("com.apple.assistant.backedup"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (BOOL)alwaysShowRecognizedSpeech
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Always Show Recognized Speech"), 0);
}

- (void)setAlwaysShowRecognizedSpeech:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Always Show Recognized Speech"), CFSTR("com.apple.assistant.backedup"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (BOOL)crownActivationEnabled
{
  return _AFSupportPreferencesBoolForKeyWithDefault(CFSTR("Crown Activation Enabled"), 1);
}

- (void)setCrownActivationEnabled:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Crown Activation Enabled"), CFSTR("com.apple.assistant.support"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (BOOL)listenAfterSpeakingDisabled
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("Listen After Speaking Disabled"), 0, CFSTR("com.apple.assistant"), self->_instanceContext);
}

- (void)setListenAfterSpeakingDisabled:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Listen After Speaking Disabled"), CFSTR("com.apple.assistant"), self->_instanceContext);

  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
}

- (BOOL)curareOrchestrationEnabled
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("Curare Orchestration Enabled"), 0, CFSTR("com.apple.assistant"), self->_instanceContext);
}

- (void)setCurareOrchestrationEnabled:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Curare Orchestration Enabled"), CFSTR("com.apple.assistant"), self->_instanceContext);

  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
}

- (BOOL)cloudSyncEnabled
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Cloud Sync Enabled"), 1);
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[AFPreferences setCloudSyncEnabled:]";
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v8, 0x12u);
  }
  _AFPreferencesEnableCloudSync(v3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v6, CFSTR("Cloud Sync Enabled Modification Date"), CFSTR("com.apple.assistant.backedup"), 0);

  -[AFPreferences synchronize](self, "synchronize");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.cloud.synch.changed"), 0, 0, 1u);
}

- (void)setInternalUserClassification:(unint64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Internal User Classification"), CFSTR("com.apple.assistant.backedup"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (unint64_t)internalUserClassification
{
  void *v2;
  unint64_t v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Internal User Classification"), CFSTR("com.apple.assistant.backedup"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  if (v3 >= 3)
    return 0;
  else
    return v3;
}

- (void)setConversationAwarenessForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  AFSettingsConnection *v17;

  v4 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8870;
  v16 = __Block_byref_object_dispose__8871;
  v17 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  v7 = (void *)v13[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__AFPreferences_setConversationAwarenessForCurrentlyRoutedDevice_withCompletion___block_invoke;
  v9[3] = &unk_1E3A2EBD8;
  v8 = v6;
  v10 = v8;
  v11 = &v12;
  objc_msgSend(v7, "setConversationAwarenessForCurrentlyRoutedDevice:withCompletion:", v4, v9);

  _Block_object_dispose(&v12, 8);
}

- (void)getConversationAwarenessForCurrentlyRoutedDeviceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  AFSettingsConnection *v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__8870;
  v14 = __Block_byref_object_dispose__8871;
  v15 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__AFPreferences_getConversationAwarenessForCurrentlyRoutedDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E3A2EBD8;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  objc_msgSend(v5, "getConversationAwarenessForCurrentlyRoutedDevice:", v7);

  _Block_object_dispose(&v10, 8);
}

- (void)setPersonalVolumeForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  AFSettingsConnection *v17;

  v4 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8870;
  v16 = __Block_byref_object_dispose__8871;
  v17 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  v7 = (void *)v13[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__AFPreferences_setPersonalVolumeForCurrentlyRoutedDevice_withCompletion___block_invoke;
  v9[3] = &unk_1E3A2EBD8;
  v8 = v6;
  v10 = v8;
  v11 = &v12;
  objc_msgSend(v7, "setPersonalVolumeForCurrentlyRoutedDevice:withCompletion:", v4, v9);

  _Block_object_dispose(&v12, 8);
}

- (void)getPersonalVolumeForCurrentlyRoutedDeviceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  AFSettingsConnection *v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__8870;
  v14 = __Block_byref_object_dispose__8871;
  v15 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__AFPreferences_getPersonalVolumeForCurrentlyRoutedDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E3A2EBD8;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  objc_msgSend(v5, "getPersonalVolumeForCurrentlyRoutedDevice:", v7);

  _Block_object_dispose(&v10, 8);
}

- (void)setHeadGesturesForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  AFSettingsConnection *v17;

  v4 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8870;
  v16 = __Block_byref_object_dispose__8871;
  v17 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  v7 = (void *)v13[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__AFPreferences_setHeadGesturesForCurrentlyRoutedDevice_withCompletion___block_invoke;
  v9[3] = &unk_1E3A2EBD8;
  v8 = v6;
  v10 = v8;
  v11 = &v12;
  objc_msgSend(v7, "setHeadGesturesForCurrentlyRoutedDevice:withCompletion:", v4, v9);

  _Block_object_dispose(&v12, 8);
}

- (void)getHeadGesturesForCurrentlyRoutedDeviceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  AFSettingsConnection *v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__8870;
  v14 = __Block_byref_object_dispose__8871;
  v15 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__AFPreferences_getHeadGesturesForCurrentlyRoutedDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E3A2EBD8;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  objc_msgSend(v5, "getHeadGesturesForCurrentlyRoutedDevice:", v7);

  _Block_object_dispose(&v10, 8);
}

- (void)getSpokenNotificationTemporarilyDisabledStatusWithCompletion:(id)a3
{
  -[AFPreferences getAnnounceNotificationsTemporarilyDisabledStatusForPlatform:completion:](self, "getAnnounceNotificationsTemporarilyDisabledStatusForPlatform:completion:", 1, a3);
}

- (void)getSpokenNotificationTemporarilyDisabledEndDateWithCompletion:(id)a3
{
  -[AFPreferences getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:completion:](self, "getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:completion:", 1, a3);
}

- (void)setSpokenNotificationTemporarilyDisabledUntil:(id)a3
{
  -[AFPreferences setAnnounceNotificationsTemporarilyDisabledUntil:platform:](self, "setAnnounceNotificationsTemporarilyDisabledUntil:platform:", a3, 1);
}

- (void)clearSpokenNotificationTemporarilyDisabledStatus
{
  AFSettingsConnection *v2;

  v2 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection clearSpokenNotificationTemporarilyDisabledStatus](v2, "clearSpokenNotificationTemporarilyDisabledStatus");
  -[AFSettingsConnection barrier](v2, "barrier");

}

- (void)getSpokenNotificationTemporarilyDisabledForApp:(id)a3 completion:(id)a4
{
  -[AFPreferences getAnnounceNotificationsTemporarilyDisabledForApp:platform:completion:](self, "getAnnounceNotificationsTemporarilyDisabledForApp:platform:completion:", a3, 1, a4);
}

- (void)getSpokenNotificationTemporarilyDisabledEndDateForApp:(id)a3 completion:(id)a4
{
  -[AFPreferences getAnnounceNotificationsTemporarilyDisabledEndDateForApp:platform:completion:](self, "getAnnounceNotificationsTemporarilyDisabledEndDateForApp:platform:completion:", a3, 1, a4);
}

- (void)setSpokenNotificationTemporarilyDisabledForApp:(id)a3 until:(id)a4
{
  -[AFPreferences setAnnounceNotificationsTemporarilyDisabledUntil:forApp:platform:](self, "setAnnounceNotificationsTemporarilyDisabledUntil:forApp:platform:", a4, a3, 1);
}

- (BOOL)lastAnnouncementInThreadWasCancelledForApp:(id)a3 threadID:(id)a4
{
  return _AFPreferencesLastAnnouncementInThreadWasCancelled(a3, a4);
}

- (void)markLastAnnouncementInThreadAsCancelledForApp:(id)a3 threadID:(id)a4
{
  _AFPreferencesInsertThreadCancellationForApp(a3, a4);
}

- (void)removeThreadCancellationForApp:(id)a3 threadID:(id)a4
{
  _AFPreferencesRemoveThreadCancellationForApp(a3, a4);
}

- (void)setSpokenNotificationsProxCardSeen
{
  AFSettingsConnection *v2;

  v2 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setSpokenNotificationProxCardSeen:](v2, "setSpokenNotificationProxCardSeen:", 1);
  -[AFSettingsConnection barrier](v2, "barrier");

}

- (void)setSpokenNotificationSkipTriggerlessReplyConfirmation:(BOOL)a3
{
  _AFPreferencesSetSpokenNotificationSkipTriggerlessReplyConfirmation(a3);
}

- (BOOL)spokenNotificationSkipTriggerlessReplyConfirmation
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Spoken Notification Skip Triggerless Reply Confirmation"), 0);
}

- (void)setSpokenNotificationIsAlwaysOpportune:(BOOL)a3
{
  _BOOL8 v3;
  AFSettingsConnection *v4;

  v3 = a3;
  v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setSpokenNotificationIsAlwaysOpportune:](v4, "setSpokenNotificationIsAlwaysOpportune:", v3);
  -[AFSettingsConnection barrier](v4, "barrier");

}

- (void)getSpokenNotificationIsAlwaysOpportuneWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  AFSettingsConnection *v14;

  v4 = a3;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__8870;
    v13 = __Block_byref_object_dispose__8871;
    v14 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
    v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__AFPreferences_getSpokenNotificationIsAlwaysOpportuneWithCompletion___block_invoke;
    v6[3] = &unk_1E3A2EC00;
    v7 = v4;
    v8 = &v9;
    objc_msgSend(v5, "getSpokenNotificationIsAlwaysOpportuneWithCompletion:", v6);

    _Block_object_dispose(&v9, 8);
  }

}

- (void)setSpokenNotificationShouldAnnounceAllNotifications:(BOOL)a3
{
  _BOOL8 v3;
  AFSettingsConnection *v4;

  v3 = a3;
  v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setSpokenNotificationShouldAnnounceAllNotifications:](v4, "setSpokenNotificationShouldAnnounceAllNotifications:", v3);
  -[AFSettingsConnection barrier](v4, "barrier");

}

- (void)getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  AFSettingsConnection *v14;

  v4 = a3;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__8870;
    v13 = __Block_byref_object_dispose__8871;
    v14 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
    v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__AFPreferences_getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion___block_invoke;
    v6[3] = &unk_1E3A2EC00;
    v7 = v4;
    v8 = &v9;
    objc_msgSend(v5, "getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:", v6);

    _Block_object_dispose(&v9, 8);
  }

}

- (void)setAnnounceNotificationsOnBuiltInSpeakerEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AFSettingsConnection *v4;

  v3 = a3;
  v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setAnnounceNotificationsOnBuiltInSpeakerEnabled:](v4, "setAnnounceNotificationsOnBuiltInSpeakerEnabled:", v3);
  -[AFSettingsConnection barrier](v4, "barrier");

}

- (void)setAnnounceNotificationsOnHearingAidsSupported:(BOOL)a3
{
  _BOOL8 v3;
  AFSettingsConnection *v4;

  v3 = a3;
  v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setAnnounceNotificationsOnHearingAidsSupported:](v4, "setAnnounceNotificationsOnHearingAidsSupported:", v3);
  -[AFSettingsConnection barrier](v4, "barrier");

}

- (void)setAnnounceNotificationsOnHearingAidsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AFSettingsConnection *v4;

  v3 = a3;
  v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setAnnounceNotificationsOnHearingAidsEnabled:](v4, "setAnnounceNotificationsOnHearingAidsEnabled:", v3);
  -[AFSettingsConnection barrier](v4, "barrier");

}

- (void)setSpokenNotificationShouldSkipTriggerlessReplies:(BOOL)a3
{
  _BOOL8 v3;
  AFSettingsConnection *v4;

  v3 = a3;
  v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setSpokenNotificationShouldSkipTriggerlessReplies:](v4, "setSpokenNotificationShouldSkipTriggerlessReplies:", v3);
  -[AFSettingsConnection barrier](v4, "barrier");

}

- (void)getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  AFSettingsConnection *v14;

  v4 = a3;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__8870;
    v13 = __Block_byref_object_dispose__8871;
    v14 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
    v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __81__AFPreferences_getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion___block_invoke;
    v6[3] = &unk_1E3A2EC00;
    v7 = v4;
    v8 = &v9;
    objc_msgSend(v5, "getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:", v6);

    _Block_object_dispose(&v9, 8);
  }

}

- (void)getAnnounceNotificationsTemporarilyDisabledStatusForPlatform:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  int64_t v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  char v25;

  v6 = a4;
  if (v6)
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v25 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 0;
    v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __89__AFPreferences_getAnnounceNotificationsTemporarilyDisabledStatusForPlatform_completion___block_invoke;
    v19[3] = &unk_1E3A2EC28;
    v21 = v24;
    v9 = v7;
    v20 = v9;
    -[AFPreferences getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:completion:](self, "getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:completion:", a3, v19);
    if (a3 == 2)
    {
      dispatch_group_enter(v9);
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __89__AFPreferences_getAnnounceNotificationsTemporarilyDisabledStatusForPlatform_completion___block_invoke_2;
      v16[3] = &unk_1E3A31BB0;
      v18 = v22;
      v17 = v9;
      -[AFPreferences getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:](self, "getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:", v16);

    }
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __89__AFPreferences_getAnnounceNotificationsTemporarilyDisabledStatusForPlatform_completion___block_invoke_3;
    v11[3] = &unk_1E3A2EC78;
    v15 = a3;
    v12 = v6;
    v13 = v22;
    v14 = v24;
    dispatch_group_notify(v9, v10, v11);

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
  }

}

- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  AFSettingsConnection *v16;

  v6 = a4;
  if (v6)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__8870;
    v15 = __Block_byref_object_dispose__8871;
    v16 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
    v7 = (void *)v12[5];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __90__AFPreferences_getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform_completion___block_invoke;
    v8[3] = &unk_1E3A2EC50;
    v9 = v6;
    v10 = &v11;
    objc_msgSend(v7, "getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:completion:", a3, v8);

    _Block_object_dispose(&v11, 8);
  }

}

- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 platform:(int64_t)a4
{
  id v6;
  AFSettingsConnection *v7;

  v6 = a3;
  v7 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setAnnounceNotificationsTemporarilyDisabledUntil:platform:](v7, "setAnnounceNotificationsTemporarilyDisabledUntil:platform:", v6, a4);

  -[AFSettingsConnection barrier](v7, "barrier");
}

- (void)getAnnounceNotificationsTemporarilyDisabledForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  int64_t v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  _QWORD v25[3];
  char v26;
  _QWORD v27[3];
  char v28;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v28 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = 0;
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __87__AFPreferences_getAnnounceNotificationsTemporarilyDisabledForApp_platform_completion___block_invoke;
    v22[3] = &unk_1E3A2EC28;
    v24 = v27;
    v12 = v10;
    v23 = v12;
    -[AFPreferences getAnnounceNotificationsTemporarilyDisabledEndDateForApp:platform:completion:](self, "getAnnounceNotificationsTemporarilyDisabledEndDateForApp:platform:completion:", v8, a4, v22);
    if (a4 == 2)
    {
      dispatch_group_enter(v12);
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __87__AFPreferences_getAnnounceNotificationsTemporarilyDisabledForApp_platform_completion___block_invoke_2;
      v19[3] = &unk_1E3A31BB0;
      v21 = v25;
      v20 = v12;
      -[AFPreferences getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:](self, "getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:", v19);

    }
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __87__AFPreferences_getAnnounceNotificationsTemporarilyDisabledForApp_platform_completion___block_invoke_3;
    v14[3] = &unk_1E3A2EC78;
    v16 = v25;
    v17 = v27;
    v18 = a4;
    v15 = v9;
    dispatch_group_notify(v12, v13, v14);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);
  }

}

- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  AFSettingsConnection *v19;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__8870;
    v18 = __Block_byref_object_dispose__8871;
    v19 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
    v10 = (void *)v15[5];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__AFPreferences_getAnnounceNotificationsTemporarilyDisabledEndDateForApp_platform_completion___block_invoke;
    v11[3] = &unk_1E3A2EC50;
    v12 = v9;
    v13 = &v14;
    objc_msgSend(v10, "getAnnounceNotificationsTemporarilyDisabledEndDateForApp:platform:completion:", v8, a4, v11);

    _Block_object_dispose(&v14, 8);
  }

}

- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 forApp:(id)a4 platform:(int64_t)a5
{
  id v8;
  id v9;
  AFSettingsConnection *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setAnnounceNotificationsTemporarilyDisabledUntil:forApp:platform:](v10, "setAnnounceNotificationsTemporarilyDisabledUntil:forApp:platform:", v9, v8, a5);

  -[AFSettingsConnection barrier](v10, "barrier");
}

- (void)getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  AFSettingsConnection *v14;

  v4 = a3;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__8870;
    v13 = __Block_byref_object_dispose__8871;
    v14 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
    v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__AFPreferences_getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion___block_invoke;
    v6[3] = &unk_1E3A2EC00;
    v7 = v4;
    v8 = &v9;
    objc_msgSend(v5, "getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:", v6);

    _Block_object_dispose(&v9, 8);
  }

}

- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  _BOOL8 v3;
  AFSettingsConnection *v4;

  v3 = a3;
  v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setAnnounceNotificationsInCarPlayTemporarilyDisabled:](v4, "setAnnounceNotificationsInCarPlayTemporarilyDisabled:", v3);
  -[AFSettingsConnection barrier](v4, "barrier");

}

- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled
{
  AFSettingsConnection *v2;

  v2 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection clearAnnounceNotificationsInCarPlayTemporarilyDisabled](v2, "clearAnnounceNotificationsInCarPlayTemporarilyDisabled");
  -[AFSettingsConnection barrier](v2, "barrier");

}

- (void)getAnnounceNotificationsInCarPlayTypeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  AFSettingsConnection *v14;

  v4 = a3;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__8870;
    v13 = __Block_byref_object_dispose__8871;
    v14 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
    v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__AFPreferences_getAnnounceNotificationsInCarPlayTypeWithCompletion___block_invoke;
    v6[3] = &unk_1E3A2ECA0;
    v7 = v4;
    v8 = &v9;
    objc_msgSend(v5, "getAnnounceNotificationsInCarPlayTypeWithCompletion:", v6);

    _Block_object_dispose(&v9, 8);
  }

}

- (void)setAnnounceNotificationsInCarPlayType:(int64_t)a3
{
  AFSettingsConnection *v4;

  v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setAnnounceNotificationsInCarPlayType:](v4, "setAnnounceNotificationsInCarPlayType:", a3);
  -[AFSettingsConnection barrier](v4, "barrier");

}

- (void)clearAnnounceNotificationsInCarPlayType
{
  AFSettingsConnection *v2;

  v2 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection clearAnnounceNotificationsInCarPlayType](v2, "clearAnnounceNotificationsInCarPlayType");
  -[AFSettingsConnection barrier](v2, "barrier");

}

- (void)getMessageWithoutConfirmationEnabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  AFSettingsConnection *v14;

  v4 = a3;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__8870;
    v13 = __Block_byref_object_dispose__8871;
    v14 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
    v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__AFPreferences_getMessageWithoutConfirmationEnabledWithCompletion___block_invoke;
    v6[3] = &unk_1E3A2EC00;
    v7 = v4;
    v8 = &v9;
    objc_msgSend(v5, "getMessageWithoutConfirmationEnabledWithCompletion:", v6);

    _Block_object_dispose(&v9, 8);
  }

}

- (void)setMessageWithoutConfirmationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AFSettingsConnection *v4;

  v3 = a3;
  v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setMessageWithoutConfirmationEnabled:](v4, "setMessageWithoutConfirmationEnabled:", v3);
  -[AFSettingsConnection barrier](v4, "barrier");

}

- (void)clearMessageWithoutConfirmationEnabled
{
  AFSettingsConnection *v2;

  v2 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection clearMessageWithoutConfirmationEnabled](v2, "clearMessageWithoutConfirmationEnabled");
  -[AFSettingsConnection barrier](v2, "barrier");

}

- (void)getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  AFSettingsConnection *v14;

  v4 = a3;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__8870;
    v13 = __Block_byref_object_dispose__8871;
    v14 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
    v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77__AFPreferences_getMessageWithoutConfirmationInCarPlayEnabledWithCompletion___block_invoke;
    v6[3] = &unk_1E3A2EC00;
    v7 = v4;
    v8 = &v9;
    objc_msgSend(v5, "getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:", v6);

    _Block_object_dispose(&v9, 8);
  }

}

- (void)setMessageWithoutConfirmationInCarPlayEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AFSettingsConnection *v4;

  v3 = a3;
  v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setMessageWithoutConfirmationInCarPlayEnabled:](v4, "setMessageWithoutConfirmationInCarPlayEnabled:", v3);
  -[AFSettingsConnection barrier](v4, "barrier");

}

- (void)clearMessageWithoutConfirmationInCarPlayEnabled
{
  AFSettingsConnection *v2;

  v2 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection clearMessageWithoutConfirmationInCarPlayEnabled](v2, "clearMessageWithoutConfirmationInCarPlayEnabled");
  -[AFSettingsConnection barrier](v2, "barrier");

}

- (void)getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  AFSettingsConnection *v14;

  v4 = a3;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__8870;
    v13 = __Block_byref_object_dispose__8871;
    v14 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
    v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __78__AFPreferences_getMessageWithoutConfirmationHeadphonesEnabledWithCompletion___block_invoke;
    v6[3] = &unk_1E3A2EC00;
    v7 = v4;
    v8 = &v9;
    objc_msgSend(v5, "getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:", v6);

    _Block_object_dispose(&v9, 8);
  }

}

- (void)getShowAppsBehindSiriInCarPlayEnabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  AFSettingsConnection *v14;

  v4 = a3;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__8870;
    v13 = __Block_byref_object_dispose__8871;
    v14 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
    v5 = (void *)v10[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__AFPreferences_getShowAppsBehindSiriInCarPlayEnabledWithCompletion___block_invoke;
    v6[3] = &unk_1E3A2EC00;
    v7 = v4;
    v8 = &v9;
    objc_msgSend(v5, "getShowAppsBehindSiriInCarPlayEnabledWithCompletion:", v6);

    _Block_object_dispose(&v9, 8);
  }

}

- (void)setShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AFSettingsConnection *v4;

  v3 = a3;
  v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setShowAppsBehindSiriInCarPlayEnabled:](v4, "setShowAppsBehindSiriInCarPlayEnabled:", v3);
  -[AFSettingsConnection barrier](v4, "barrier");

}

- (void)clearShowAppsBehindSiriInCarPlayEnabled
{
  AFSettingsConnection *v2;

  v2 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection clearShowAppsBehindSiriInCarPlayEnabled](v2, "clearShowAppsBehindSiriInCarPlayEnabled");
  -[AFSettingsConnection barrier](v2, "barrier");

}

- (BOOL)siriInCallEnabled
{
  return +[AFFeatureFlags isBlindedSphinxEnabled](AFFeatureFlags, "isBlindedSphinxEnabled")
      || _AFPreferencesGetSiriInCallEnablementState() == 2;
}

- (void)setSiriInCallEnabled:(BOOL)a3
{
  _AFPreferencesSetSiriInCallEnabled(a3);
}

- (void)setLongLivedIdentifierUploadingEnabled:(BOOL)a3
{
  void *v4;
  AFSettingsConnection *v5;

  _AFPreferencesSetLongLivedIdentifierUploadingEnabled(a3);
  v5 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection resetSessionsAtNextRequestBoundary](v5, "resetSessionsAtNextRequestBoundary");
  -[AFSettingsConnection barrier](v5, "barrier");
  if ((_AFPreferencesLongLivedIdentifierUploadingEnabled() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D21020], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forUploadHeaderNamed:", 0, CFSTR("userId"));

  }
}

- (BOOL)isMediaEntitySyncDisabled
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((_AFPreferencesBoolValueForKeyWithContext(CFSTR("Is Trial config set to disable media entity sync"), 0, CFSTR("com.apple.assistant"), self->_instanceContext) & 1) != 0)return -[AFPreferences shouldDisableMediaEntitySync](self, "shouldDisableMediaEntitySync");
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[AFPreferences isMediaEntitySyncDisabled]";
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s isMediaEntitySyncDisabledSyncConfig configured to false with Trial", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (BOOL)isSyncDisabledForFullUoDDevices
{
  int v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = _AFPreferencesBoolValueForKeyWithContext(CFSTR("Is Trial config set to disable sync for FullUoD en_US devices"), 0, CFSTR("com.apple.assistant"), self->_instanceContext);
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[AFPreferences isSyncDisabledForFullUoDDevices]";
    v7 = 1024;
    v8 = v2;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s isSyncDisabledForFullUoDDevices configured to '%d' with Trial", (uint8_t *)&v5, 0x12u);
  }
  return v2;
}

- (BOOL)shouldDisableMediaEntitySync
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  int64_t v6;
  int v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[AFPreferences languageCode](self, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v13 = 136315138;
      v14 = "-[AFPreferences shouldDisableMediaEntitySync]";
      v11 = "%s isMediaEntitySyncDisabled=false because languageCode is nil";
LABEL_12:
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v13, 0xCu);
    }
LABEL_13:
    LOBYTE(v8) = 0;
    goto LABEL_14;
  }
  if ((_AFPreferencesBoolValueForKeyWithContext(CFSTR("Is Siri full UOD Supported"), 0, CFSTR("com.apple.assistant"), self->_instanceContext) & 1) == 0)
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v13 = 136315138;
      v14 = "-[AFPreferences shouldDisableMediaEntitySync]";
      v11 = "%s isMediaEntitySyncDisabled=false because device doesn't support full Siri X";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v4 = +[AFFeatureFlags isSiriPommesEnabled](AFFeatureFlags, "isSiriPommesEnabled");
  v5 = +[AFFeatureFlags isSiriPommesEnabledForLanguage:](AFFeatureFlags, "isSiriPommesEnabledForLanguage:", v3);
  v6 = -[AFPreferences siriDataSharingOptInStatus](self, "siriDataSharingOptInStatus");
  v7 = _AFPreferencesBoolValueForKeyWithContext(CFSTR("Has ATV or HomePods in the home"), 0, CFSTR("com.apple.assistant"), self->_instanceContext);
  if (v6 == 2)
    v8 = (v4 && v5) & ~v7;
  else
    v8 = 0;
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v13 = 136316418;
    v14 = "-[AFPreferences shouldDisableMediaEntitySync]";
    v15 = 1024;
    v16 = v8;
    v17 = 1024;
    v18 = v4;
    v19 = 1024;
    v20 = v5;
    v21 = 1024;
    v22 = v7;
    v23 = 1024;
    v24 = v6 == 2;
    _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s isMediaEntitySyncDisabled=%d: pommesEnabled=%d pommesEnabledForLanguage=%d hasATVOrHomePodInHome=%d optedOutOfDataSharing=%d ", (uint8_t *)&v13, 0x2Au);
  }
LABEL_14:

  return v8;
}

- (BOOL)hasSufficientAssetToDisableServerFallback
{
  return 0;
}

- (BOOL)shouldDisableServerFallbackNL
{
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (+[AFFeatureFlags isNLServerFallbackDisabledWithExperiment](AFFeatureFlags, "isNLServerFallbackDisabledWithExperiment"))
  {
    v3 = _AFPreferencesBoolValueForKeyWithContext(CFSTR("Is Trial config set to disable NL Server Fallback for NL"), 0, CFSTR("com.apple.assistant"), self->_instanceContext);
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      if (v3)
        v5 = CFSTR("YES");
      v7 = 136315394;
      v8 = "-[AFPreferences shouldDisableServerFallbackNL]";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s shouldDisableServerFallbackNL = %@ with Trial", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)shouldDisableServerFallbackDomain
{
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (+[AFFeatureFlags isNLServerFallbackDisabledWithExperiment](AFFeatureFlags, "isNLServerFallbackDisabledWithExperiment"))
  {
    v3 = _AFPreferencesBoolValueForKeyWithContext(CFSTR("Is Trial config set to disable NL Server Fallback for Domain"), 0, CFSTR("com.apple.assistant"), self->_instanceContext);
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      if (v3)
        v5 = CFSTR("YES");
      v7 = 136315394;
      v8 = "-[AFPreferences shouldDisableServerFallbackDomain]";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s shouldDisableServerFallbackDomain = %@ with Trial", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)setMessageWithoutConfirmationHeadphonesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AFSettingsConnection *v4;

  v3 = a3;
  v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setMessageWithoutConfirmationHeadphonesEnabled:](v4, "setMessageWithoutConfirmationHeadphonesEnabled:", v3);
  -[AFSettingsConnection barrier](v4, "barrier");

}

- (void)clearMessageWithoutConfirmationHeadphonesEnabled
{
  AFSettingsConnection *v2;

  v2 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection clearMessageWithoutConfirmationHeadphonesEnabled](v2, "clearMessageWithoutConfirmationHeadphonesEnabled");
  -[AFSettingsConnection barrier](v2, "barrier");

}

- (BOOL)hasPresentedCompactVoiceTriggerDisclosure
{
  return _AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Compact Voice Trigger Disclosure Presented"), 0);
}

- (void)setCompactVoiceTriggerDisclosurePresented:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Compact Voice Trigger Disclosure Presented"), CFSTR("com.apple.assistant.backedup"), 0);

  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
  -[AFPreferences synchronize](self, "synchronize");
}

- (BOOL)hasPresentedCompactVoiceTriggerDiscoveryNotificationForBTDeviceWithAddress:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  _AFHashedBluetoothAddressForDiscoveryNotification(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesValueForKeyWithContext(CFSTR("Compact Voice Trigger Discovery Notification Presented For Bluetooth Device"), CFSTR("com.apple.assistant.backedup"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setCompactVoiceTriggerDiscoveryNotificationPresented:(BOOL)a3 forBTDeviceWithAddress:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  _AFHashedBluetoothAddressForDiscoveryNotification(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesValueForKeyWithContext(CFSTR("Compact Voice Trigger Discovery Notification Presented For Bluetooth Device"), CFSTR("com.apple.assistant.backedup"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v8, "removeObjectForKey:", v6);
    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v6);

LABEL_6:
  _AFPreferencesSetValueForKeyWithContext(v8, CFSTR("Compact Voice Trigger Discovery Notification Presented For Bluetooth Device"), CFSTR("com.apple.assistant.backedup"), 0);
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));

  -[AFPreferences synchronize](self, "synchronize");
}

- (BOOL)deviceUsesCompactVoiceTrigger
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(getVTPreferencesClass(), "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "voiceTriggerEnabled"))
  {
    -[AFPreferences languageCode](self, "languageCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[AFPreferences bestSupportedLanguageCodeForLanguageCode:](self, "bestSupportedLanguageCodeForLanguageCode:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v3, "isCompactVoiceTriggerAvailableForLanguageCode:", v4))
      v5 = MGGetBoolAnswer();
    else
      v5 = 0;
    if (objc_msgSend(v3, "getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:", 0, 0, 0) != 1)
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)assistantOnDemandAssetSubscriptionAllowed
{
  return 1;
}

- (BOOL)designModeIsEnabled
{
  return _AFSupportPreferencesBoolForKeyWithDefault(CFSTR("HI/CI Design Mode"), 0);
}

- (void)setDesignModeEnabled:(BOOL)a3
{
  _AFPreferencesSetSiriDesignModeEnabled(a3);
}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _BYTE *v12;
  _BYTE buf[24];
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  AFSettingsConnection *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    *(_QWORD *)&buf[4] = "-[AFPreferences setSiriDataSharingOptInStatus:completion:]";
    *(_WORD *)&buf[12] = 2049;
    *(_QWORD *)&buf[14] = a3;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %{private}ld", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v14 = __Block_byref_object_copy__8870;
  v15 = __Block_byref_object_dispose__8871;
  v16 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  v8 = *(void **)(*(_QWORD *)&buf[8] + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__AFPreferences_setSiriDataSharingOptInStatus_completion___block_invoke;
  v10[3] = &unk_1E3A2EBB0;
  v9 = v6;
  v11 = v9;
  v12 = buf;
  objc_msgSend(v8, "setSiriDataSharingOptInStatus:completion:", a3, v10);

  _Block_object_dispose(buf, 8);
}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _BYTE *v19;
  _BYTE buf[24];
  int64_t v21;
  __int128 v22;
  uint64_t v23;

  v9 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316163;
    *(_QWORD *)&buf[4] = "-[AFPreferences setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]";
    *(_WORD *)&buf[12] = 2049;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    v21 = a5;
    LOWORD(v22) = 2113;
    *(_QWORD *)((char *)&v22 + 2) = v12;
    WORD5(v22) = 1024;
    HIDWORD(v22) = v9;
    _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s Setting Siri Data Sharing OptIn status=%{private}ld from source=%ld with reason=%{private}@, and propagating to home accessories=%d", buf, 0x30u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v21 = (int64_t)__Block_byref_object_copy__8870;
  *(_QWORD *)&v22 = __Block_byref_object_dispose__8871;
  *((_QWORD *)&v22 + 1) = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__AFPreferences_setSiriDataSharingOptInStatus_propagateToHomeAccessories_source_reason_completion___block_invoke;
  v17[3] = &unk_1E3A2EBB0;
  v16 = v13;
  v18 = v16;
  v19 = buf;
  objc_msgSend(v15, "setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:", a3, v9, a5, v12, v17);

  _Block_object_dispose(buf, 8);
}

- (void)setSiriDataSharingOptInAlertPresented:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  AFSettingsConnection *v17;

  v4 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8870;
  v16 = __Block_byref_object_dispose__8871;
  v17 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  v7 = (void *)v13[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__AFPreferences_setSiriDataSharingOptInAlertPresented_completion___block_invoke;
  v9[3] = &unk_1E3A2EBB0;
  v8 = v6;
  v10 = v8;
  v11 = &v12;
  objc_msgSend(v7, "setSiriDataSharingOptInAlertPresented:completion:", v4, v9);

  _Block_object_dispose(&v12, 8);
}

- (BOOL)shouldSuppressSiriDataSharingOptInAlert
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
  return _AFSupportPreferencesBoolForKeyWithDefault(CFSTR("Suppress Siri Data Sharing Opt In"), 0);
}

- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _BYTE *v12;
  _BYTE buf[24];
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  AFSettingsConnection *v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[AFPreferences setSiriDataSharingHomePodSetupDeviceIsValid:completion:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v14 = __Block_byref_object_copy__8870;
  v15 = __Block_byref_object_dispose__8871;
  v16 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  v8 = *(void **)(*(_QWORD *)&buf[8] + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__AFPreferences_setSiriDataSharingHomePodSetupDeviceIsValid_completion___block_invoke;
  v10[3] = &unk_1E3A2EBB0;
  v9 = v6;
  v11 = v9;
  v12 = buf;
  objc_msgSend(v8, "setSiriDataSharingHomePodSetupDeviceIsValid:completion:", v4, v10);

  _Block_object_dispose(buf, 8);
}

- (void)setHomeAccessoriesRepromptStatus:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, CFSTR("Siri Data Sharing Accessory Reprompt Status"), CFSTR("com.apple.assistant.backedup"), 0);
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
}

- (id)getHomeAccessoriesRepromptStatus
{
  void *v2;
  id v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Siri Data Sharing Accessory Reprompt Status"), CFSTR("com.apple.assistant.backedup"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;

  return v3;
}

- (void)appendToSiriDataSharingOptInStatusHistory:(int64_t)a3 previousOptInStatus:(int64_t)a4 statusChangeSource:(int64_t)a5 reason:(id)a6
{
  const __CFString *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  __CFString *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  _QWORD v39[8];
  _QWORD v40[10];

  v40[8] = *MEMORY[0x1E0C80C00];
  v10 = (const __CFString *)a6;
  v39[0] = CFSTR("Date");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v11;
  v39[1] = CFSTR("New Opt-In Status");
  if ((unint64_t)a3 > 3)
    v12 = CFSTR("(unknown)");
  else
    v12 = off_1E3A35998[a3];
  v13 = v12;
  v40[1] = v13;
  v39[2] = CFSTR("Previous Opt-In Status");
  if ((unint64_t)a4 > 3)
    v14 = CFSTR("(unknown)");
  else
    v14 = off_1E3A35998[a4];
  v15 = v14;
  v40[2] = v15;
  v39[3] = CFSTR("Source");
  if ((unint64_t)a5 > 0xB)
    v16 = CFSTR("(unknown)");
  else
    v16 = off_1E3A358B0[a5];
  v17 = v16;
  v18 = v17;
  v19 = CFSTR("Unspecified");
  v32 = (__CFString *)v10;
  if (v10)
    v19 = v10;
  v40[3] = v17;
  v40[4] = v19;
  v39[4] = CFSTR("Reason");
  v39[5] = CFSTR("Build Version");
  v20 = (void *)MGCopyAnswer();
  v40[5] = v20;
  v39[6] = CFSTR("Product Version");
  v21 = (void *)MGCopyAnswer();
  v39[7] = CFSTR("Schema Version");
  v40[6] = v21;
  v40[7] = CFSTR("1.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[AFPreferences appendToSiriDataSharingOptInStatusHistory:previousOptInStatus:statusChangeSource:reason:]";
    v35 = 2112;
    v36 = (uint64_t)v22;
    _os_log_impl(&dword_19AF50000, v23, OS_LOG_TYPE_INFO, "%s Appending siri data sharing opt-in status information to history: %@", buf, 0x16u);
  }
  -[AFPreferences siriDataSharingOptInStatusHistory](self, "siriDataSharingOptInStatusHistory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");
  v26 = v25;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v27;

  if ((unint64_t)objc_msgSend(v28, "count") >= 0x64)
  {
    do
    {
      v29 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v30 = v29;
        v31 = objc_msgSend(v28, "count");
        *(_DWORD *)buf = 136315650;
        v34 = "-[AFPreferences appendToSiriDataSharingOptInStatusHistory:previousOptInStatus:statusChangeSource:reason:]";
        v35 = 2048;
        v36 = v31;
        v37 = 2048;
        v38 = 100;
        _os_log_impl(&dword_19AF50000, v30, OS_LOG_TYPE_INFO, "%s Siri data sharing opt-in status history size of %ld is greater than maximum of %ld. Removing oldest entry.", buf, 0x20u);

      }
      objc_msgSend(v28, "removeObjectAtIndex:", objc_msgSend(v28, "count") - 1);
    }
    while ((unint64_t)objc_msgSend(v28, "count") > 0x63);
  }
  objc_msgSend(v28, "insertObject:atIndex:", v22, 0);
  _AFPreferencesSetValueForKeyWithContext(v28, CFSTR("Siri Data Sharing Opt-In Status History"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
  -[AFPreferences synchronize](self, "synchronize");

}

- (id)siriDataSharingOptInStatusHistory
{
  void *v2;
  id v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Siri Data Sharing Opt-In Status History"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)getHomeAccessorySiriDataSharingChangeLog
{
  void *v2;
  id v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Home Accessories Siri Data Sharing Opt-In Change Log"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)appendHomeAccessorySiriDataSharingChangeLogEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFPreferences appendHomeAccessorySiriDataSharingChangeLogEvent:]";
    v17 = 2112;
    v18 = (uint64_t)v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Appending home accessory Siri data sharing opt-in status event to change log: %@", buf, 0x16u);
  }
  -[AFPreferences getHomeAccessorySiriDataSharingChangeLog](self, "getHomeAccessorySiriDataSharingChangeLog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  if ((unint64_t)objc_msgSend(v10, "count") >= 0x64)
  {
    *(_QWORD *)&v11 = 136315394;
    v14 = v11;
    do
    {
      v12 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v14;
        v16 = "-[AFPreferences appendHomeAccessorySiriDataSharingChangeLogEvent:]";
        v17 = 2048;
        v18 = 100;
        _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s Home accessory Siri data sharing opt-in status change log size is greater than maximum of %ld. Removing oldest entry.", buf, 0x16u);
      }
      objc_msgSend(v10, "removeObjectAtIndex:", 0, v14);
    }
    while ((unint64_t)objc_msgSend(v10, "count") > 0x63);
  }
  objc_msgSend(v4, "buildDictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);
  _AFPreferencesSetValueForKeyWithContext(v10, CFSTR("Home Accessories Siri Data Sharing Opt-In Change Log"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
  -[AFPreferences synchronize](self, "synchronize");

}

- (id)getHomeAccessorySiriDataSharingPropagationLog
{
  void *v2;
  id v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Home Accessories Siri Data Sharing Opt-In Propagation Log"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)insertHomeAccessorySiriDataSharingPropagationLogEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  AFPreferences *v19;
  void **v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[AFPreferences insertHomeAccessorySiriDataSharingPropagationLogEvent:]";
    v23 = 2112;
    v24 = (uint64_t)v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Appending home accessory Siri data sharing propagation event to propagation log: %@", buf, 0x16u);
  }
  -[AFPreferences getHomeAccessorySiriDataSharingPropagationLog](self, "getHomeAccessorySiriDataSharingPropagationLog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v19 = self;

  objc_msgSend(v4, "accessoryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  if ((unint64_t)objc_msgSend(v16, "count") >= 0x64)
  {
    do
    {
      v17 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[AFPreferences insertHomeAccessorySiriDataSharingPropagationLogEvent:]";
        v23 = 2048;
        v24 = 100;
        _os_log_impl(&dword_19AF50000, v17, OS_LOG_TYPE_INFO, "%s Home accessory Siri data sharing opt-in status propagation log size is greater than maximum of %ld. Removing oldest entry.", buf, 0x16u);
      }
      objc_msgSend(v16, "removeObjectAtIndex:", 0, v19);
    }
    while ((unint64_t)objc_msgSend(v16, "count") > 0x63);
  }
  objc_msgSend(v4, "buildDictionaryRepresentation", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v18);
  objc_msgSend(v10, "setObject:forKey:", v16, v11);
  _AFPreferencesSetValueForKeyWithContext(v10, CFSTR("Home Accessories Siri Data Sharing Opt-In Propagation Log"), CFSTR("com.apple.assistant.backedup"), v20[5]);
  objc_msgSend(v20, "synchronize");

}

- (id)supplementalLanguageDictionaryForProduct:(id)a3
{
  return 0;
}

- (id)supplementalLanguagesForProduct:(id)a3 forBuildVersion:(id)a4
{
  return 0;
}

- (id)supplementalLanguages
{
  return 0;
}

- (id)supplementalLanguagesModificationDate
{
  return 0;
}

- (id)horsemanSupplementalLanguageDictionary
{
  return 0;
}

- (void)setIgnoreServerManualEndpointingThreshold:(BOOL)a3
{
  AFPreferencesSetIgnoreServerManualEndpointingThreshold(a3);
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
}

- (void)setManualEndpointingThreshold:(id)a3
{
  id v4;

  _AFPreferencesSetValueForKeyWithContext(a3, CFSTR("Manual Endpointing Threshold"), CFSTR("com.apple.assistant"), 0);
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AFPreferencesManualEndpointingThresholdDidChangeNotification"), self);

}

- (void)setStreamingDictationEnabled:(BOOL)a3
{
  AFPreferencesSetStreamingDictationEnabled(a3);
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
}

- (void)setCompanionConnectionsOverBLEEnabled:(BOOL)a3
{
  _AFPreferencesEnableBLECompanionConnections(a3);
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
}

- (BOOL)myriadCoordinationEnabled
{
  void *v2;
  char v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Allow Myriad Coordination"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (BOOL)myriadCoordinationEnabledForAccessoryLogging
{
  void *v2;
  char v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Allow Myriad Coordination"), CFSTR("com.apple.assistant"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _AFPreferencesBoolFromValueWithDefault(v2, (uint64_t)CFSTR("Allow Myriad Coordination"), 1);

  return v3;
}

- (void)setMyriadCoordinationEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Allow Myriad Coordination"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (BOOL)disableMyriadBLEActivity
{
  void *v2;
  char v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Disable Myriad BLE Activity"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)myriadDuckingEnabled
{
  void *v2;
  void *v3;
  char v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Allow Myriad Ducking"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setMyriadDuckingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Allow Myriad Ducking"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (id)myriadDeviceGroup
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Device Group"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;

      v3 = v5;
    }
  }

  return v3;
}

- (void)setMyriadDeviceGroup:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, CFSTR("Myriad Device Group"), CFSTR("com.apple.assistant"), self->_instanceContext);
}

- (BOOL)myriadServerHasProvisioned
{
  void *v2;
  void *v3;
  char v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Server Has Provisioned Myriad"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setMyriadServerHasProvisioned:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Server Has Provisioned Myriad"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (BOOL)myriadServerProvisioning
{
  void *v2;
  void *v3;
  char v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Server Provisions Myriad"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setMyriadServerProvisioning:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Server Provisions Myriad"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (unsigned)myriadDeviceClass
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Device Class"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setMyriadDeviceClass:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Device Class"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (int)myriadConstantGoodness
{
  void *v2;
  void *v3;
  int v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Constant Goodness"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (void)setMyriadConstantGoodness:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Constant Goodness"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (float)myriadDeviceAdjust
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Device Adjust"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setMyriadDeviceAdjust:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Device Adjust"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (double)myriadDeviceDelay
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Device Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setMyriadDeviceDelay:(double)a3
{
  id v4;

  *(float *)&a3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Device Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (double)myriadTestDeviceDelay
{
  void *v2;
  double v3;
  BOOL v4;
  double v5;

  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Test Device Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  v3 = 0.0;
  if (AFIsInternalInstall_isInternal)
    v4 = v2 == 0;
  else
    v4 = 1;
  if (!v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v5;
  }

  return v3;
}

- (void)setMyriadTestDeviceDelay:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Test Device Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (double)myriadDeviceSlowdown
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Device Slowdown"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setMyriadDeviceSlowdown:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Device Slowdown"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (double)myriadDeviceTrumpDelay
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Device Trump Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 1.75;
  }

  return v5;
}

- (void)setMyriadDeviceTrumpDelay:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Device Trump Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (id)myriadLastWin
{
  void *v2;
  id v3;
  void *v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Last Win"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (void)setMyriadLastWin
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v3, CFSTR("Myriad Last Win"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (double)myriadDeviceVTEndTimeDistanceThreshold
{
  void *v2;
  double v3;
  double v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad VTEndtimeDistanceThreshold"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v4;
  }

  return v3;
}

- (void)setMyriadDeviceVTEndTimeDistanceThreshold:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad VTEndtimeDistanceThreshold"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (BOOL)myriadShouldIgnoreAdjustedBoost
{
  void *v2;
  char v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Ignore Adjusted Boost"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (void)setIgnoreMyriadAdjustedBoost:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Ignore Adjusted Boost"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (BOOL)ignoreMyriadPlatformBias
{
  void *v3;
  char v4;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (!AFIsInternalInstall_isInternal)
    return 0;
  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Ignore Platform Bias"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setIgnoreMyriadPlatformBias:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Ignore Platform Bias"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (id)myriadMonitorTimeOutInterval
{
  void *v2;
  id v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Monitor Timeout Interval"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (double)myriadMaxNoOperationDelay
{
  void *v2;
  double v3;
  double v4;
  double v5;

  _AFPreferencesValueForKeyWithContext(CFSTR("Myriad Max No Op Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.005;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    if (v4 != 0.0)
    {
      objc_msgSend(v2, "doubleValue");
      v3 = v5;
    }
  }

  return v3;
}

- (void)setMyriadMaxNoOperationDelay:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Max No Op Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (void)setOpportuneSpeakingFileLoggingIsEnabled:(BOOL)a3
{
  _AFPreferencesSetOpportuneSpeakingFileLoggingIsEnabled(a3);
}

- (void)setLimitedAudioLoggingEnabled:(BOOL)a3
{
  _AFPreferencesSetLimitedPersistentAudioLogging(a3);
}

- (void)setDatabaseSyncEnabled:(BOOL)a3
{
  _AFPreferencesSetDatabaseSyncingEnabled(a3);
}

- (double)autoDismissalIdleTimeout
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  _AFPreferencesValueForKeyWithContext(CFSTR("Auto Dismissal Idle Timeout"), CFSTR("com.apple.assistant"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 6.0;
  }

  return v5;
}

- (void)setAutoDismissalIdleTimeout:(double)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Auto Dismissal Idle Timeout"), CFSTR("com.apple.assistant"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (double)autoDismissalExtendedIdleTimeout
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  _AFPreferencesValueForKeyWithContext(CFSTR("Auto Dismissal Extended Idle Timeout"), CFSTR("com.apple.assistant"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 20.0;
  }

  return v5;
}

- (void)setAutoDismissalExtendedIdleTimeout:(double)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Auto Dismissal Extended Idle Timeout"), CFSTR("com.apple.assistant"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (double)autoDismissalMaxAttentionSamplingTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  _AFPreferencesValueForKeyWithContext(CFSTR("Auto Dismissal Max Attention Sampling Time"), CFSTR("com.apple.assistant"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 30.0;
  }

  return v5;
}

- (void)setAutoDismissalMaxAttentionSamplingTime:(double)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Auto Dismissal Max Attention Sampling Time"), CFSTR("com.apple.assistant"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (void)setSiriDebugUIEnabled:(BOOL)a3
{
  _AFPreferencesSetEnableSiriDebugUI(a3);
}

- (void)setAlwaysInAmbient:(BOOL)a3
{
  _AFPreferencesSetAlwaysInAmbient(a3);
}

- (void)setOverrideModeWhileInAmbient:(BOOL)a3
{
  _AFPreferencesSetOverrideModeWhileInAmbient(a3);
}

- (void)setDeviceUnlockSignal:(BOOL)a3
{
  _AFPreferencesSetDeviceUnlockSignal(a3);
}

- (void)setSiriSpeakerGradingDebugUIEnabled:(BOOL)a3
{
  _AFPreferencesSetEnableSpeakerGradingDebugUI(a3);
}

- (BOOL)feedbackBannerForAcceptsEnabled
{
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
    return _AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Enable Feedback Banner for Accepts"), 1);
  else
    return 0;
}

- (void)setFeedbackBannerForAcceptsEnabled:(BOOL)a3
{
  _AFPreferencesSetFeedbackBannerForAcceptsEnabled(a3);
}

- (BOOL)feedbackBannerForNearMissesEnabled
{
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
    return _AFBackedUpPreferencesBoolForKeyWithDefault(CFSTR("Enable Feedback Banner for Near Misses"), 1);
  else
    return 0;
}

- (void)setFeedbackBannerForNearMissesEnabled:(BOOL)a3
{
  _AFPreferencesSetFeedbackBannerForNearMissesEnabled(a3);
}

- (void)setEnableDragAndDrop:(BOOL)a3
{
  _AFPreferencesSetEnabledDragAndDrop(a3);
}

- (void)setEnableNonFullScreenAppearance:(BOOL)a3
{
  _AFPreferencesSetEnabledNonFullScreen(a3);
}

- (BOOL)disableAssistantWhilePasscodeLocked
{
  void *v2;
  BOOL v3;

  -[AFPreferences _registerForInternalPrefs](self, "_registerForInternalPrefs");
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F40]) == 2;

  return v3;
}

- (void)setDisableAssistantWhilePasscodeLocked:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[AFPreferences _registerForInternalPrefs](self, "_registerForInternalPrefs");
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoolValue:forSetting:", !v3, *MEMORY[0x1E0D46F40]);

}

- (BOOL)assistantLanguageForceRTL
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("SessionLanguageUIForceRTL"), 0, CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
}

- (void)setAssistantLanguageForceRTL:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("SessionLanguageUIForceRTL"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);

}

- (BOOL)quickTypeGestureEnabled
{
  void *v2;
  void *v3;
  char v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Quick Type Gesture Enabled"), CFSTR("com.apple.assistant.support"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setQuickTypeGestureEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  AFInstanceContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v3 = a3;
  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = self->_instanceContext;
  objc_msgSend(v4, "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v6, CFSTR("Quick Type Gesture Enabled"), CFSTR("com.apple.assistant.support"), v5);

  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFSTR("Quick Type Gesture Enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logEventWithType:context:", 3206, v9);

  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v11 = CFSTR("disabled");
    if (v3)
      v11 = CFSTR("enabled");
    v14 = 136315394;
    v15 = "_AFPreferencesSetQuickTypeGestureEnabled";
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s #preferences Setting Quick Type Gesture %@", (uint8_t *)&v14, 0x16u);
  }
  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "synchronize");

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kAFPreferencesDidChangeDarwinNotification"), 0, 0, 1u);
}

- (BOOL)isCurrentLocaleNativelySupported
{
  id v2;
  NSObject *v3;
  const char *v4;
  BOOL v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v2 = -[AFPreferences _bestSupportedLanguageCodeForLanguageCode:isGoodFit:](self, "_bestSupportedLanguageCodeForLanguageCode:isGoodFit:", 0, &v6);
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = "YES";
    if (!v6)
      v4 = "NO";
    *(_DWORD *)buf = 136315394;
    v8 = "-[AFPreferences isCurrentLocaleNativelySupported]";
    v9 = 2080;
    v10 = v4;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s supported: %s", buf, 0x16u);
  }
  return v6;
}

- (BOOL)isLocaleIdentifierNativelySupported:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  BOOL v9;
  NSObject *v10;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const char *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v12 = 0;
    v19[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AFPreferences _bestSupportedLanguageCodeForLanguageCodes:isGoodFit:](self, "_bestSupportedLanguageCodeForLanguageCodes:isGoodFit:", v5, &v12);

    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v14 = "-[AFPreferences isLocaleIdentifierNativelySupported:]";
      *(_DWORD *)buf = 136315650;
      if (v12)
        v8 = "YES";
      else
        v8 = "NO";
      v15 = 2112;
      v16 = v4;
      v17 = 2080;
      v18 = v8;
      _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %@ supported: %s", buf, 0x20u);
    }
    v9 = v12 != 0;
  }
  else
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFPreferences isLocaleIdentifierNativelySupported:]";
      _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s No language code given, answer is NO.", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (id)_languagePreferencesForCurrentSystemConfiguration
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[AFPreferences _languagePreferencesForCurrentSystemConfiguration]";
    v26 = 2112;
    v27 = v2;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s preferredLanguages = %@", buf, 0x16u);
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count") + 1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[AFPreferences _languagePreferencesForCurrentSystemConfiguration]";
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s currentLocale identifier = %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _AFAddCountryCodeToLanguageIdentifier(v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v10);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v2;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        _AFAddCountryCodeToLanguageIdentifier(v6, *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v16, (_QWORD)v19);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v17 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[AFPreferences _languagePreferencesForCurrentSystemConfiguration]";
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_19AF50000, v17, OS_LOG_TYPE_INFO, "%s total preferences = %@", buf, 0x16u);
  }

  return v4;
}

- (id)_bestSupportedLanguageCodeForLanguageCode:(id)a3 isGoodFit:(BOOL *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v12 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)v7;
  }
  else
  {
    -[AFPreferences _languagePreferencesForCurrentSystemConfiguration](self, "_languagePreferencesForCurrentSystemConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[AFPreferences _bestSupportedLanguageCodeForLanguageCode:isGoodFit:]";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s input: nil -> %@", buf, 0x16u);
    }
  }
  -[AFPreferences _bestSupportedLanguageCodeForLanguageCodes:isGoodFit:](self, "_bestSupportedLanguageCodeForLanguageCodes:isGoodFit:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)allSiriLanguageCodesForSystemLanguageCode:(id)a3 isGoodFit:(BOOL *)a4
{
  __CFString *v6;
  NSObject *v7;
  unint64_t v8;
  __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  int v18;
  NSObject *v19;
  const __CFString *v20;
  objc_class *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  AFPreferences *v35;
  BOOL *v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  void *v43;
  _QWORD v44[2];
  const __CFString *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[AFPreferences allSiriLanguageCodesForSystemLanguageCode:isGoodFit:]";
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v8 = 0x1E0C99000uLL;
  if (-[__CFString length](v6, "length"))
  {
    v46[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[AFPreferences _languagePreferencesForCurrentSystemConfiguration](self, "_languagePreferencesForCurrentSystemConfiguration");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString firstObject](v9, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v6 = (__CFString *)v10;
LABEL_7:
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[AFPreferences allSiriLanguageCodesForSystemLanguageCode:isGoodFit:]";
      v40 = 2112;
      v41 = v9;
      _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s preferences %@", buf, 0x16u);
    }
    if (!v6)
      goto LABEL_30;
    objc_msgSend(&unk_1E3AA9AF8, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByAddingObject:", CFSTR("zxx"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB34D0];
    v44[0] = v6;
    v44[1] = CFSTR("zxx");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferredLocalizationsFromArray:forPreferences:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(CFSTR("zxx"), "isEqualToString:", v17);
    v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v20 = CFSTR("<Sentinel> (not a special-cased language)");
      if (!v18)
        v20 = v17;
      *(_DWORD *)buf = 136315394;
      v39 = "-[AFPreferences allSiriLanguageCodesForSystemLanguageCode:isGoodFit:]";
      v40 = 2112;
      v41 = v20;
      _os_log_impl(&dword_19AF50000, v19, OS_LOG_TYPE_INFO, "%s sentinelOrSpecialCase = %@", buf, 0x16u);
    }
    if ((v18 & 1) == 0)
    {
      v35 = self;
      v36 = a4;
      v21 = (objc_class *)MEMORY[0x1E0C99DC8];
      v22 = v17;
      v23 = v6;
      v24 = (void *)objc_msgSend([v21 alloc], "initWithLocaleIdentifier:", v22);

      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v23);
      objc_msgSend(v24, "countryCode");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "countryCode");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v26, "isEqualToString:", v27) & 1) != 0)
      {

        self = v35;
        a4 = v36;
        goto LABEL_17;
      }
      objc_msgSend(v24, "countryCode");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {

        self = v35;
        a4 = v36;
      }
      else
      {
        objc_msgSend(v25, "countryCode");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        self = v35;
        a4 = v36;
        if (!v32)
        {
LABEL_17:
          objc_msgSend(&unk_1E3AA9AF8, "objectForKey:", v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = AFSiriLogContextConnection;
          v8 = 0x1E0C99000;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v39 = "-[AFPreferences allSiriLanguageCodesForSystemLanguageCode:isGoodFit:]";
            v40 = 2112;
            v41 = v22;
            v42 = 2112;
            v43 = v28;
            _os_log_impl(&dword_19AF50000, v29, OS_LOG_TYPE_INFO, "%s Special-case: %@ -> %@", buf, 0x20u);
          }

          if (v28)
          {
            if (a4)
              *a4 = 1;
            goto LABEL_31;
          }
LABEL_30:
          -[AFPreferences _bestSupportedLanguageCodeForLanguageCodes:isGoodFit:](self, "_bestSupportedLanguageCodeForLanguageCodes:isGoodFit:", v9, a4);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v33;
          objc_msgSend(*(id *)(v8 + 3360), "arrayWithObjects:count:", &v37, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_31:
          goto LABEL_32;
        }
      }
    }

    v8 = 0x1E0C99000uLL;
    goto LABEL_30;
  }
  v30 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "-[AFPreferences allSiriLanguageCodesForSystemLanguageCode:isGoodFit:]";
    _os_log_error_impl(&dword_19AF50000, v30, OS_LOG_TYPE_ERROR, "%s Somehow we have no language preferences!", buf, 0xCu);
    if (!a4)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (a4)
LABEL_24:
    *a4 = 0;
LABEL_25:
  v45 = CFSTR("en-US");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v28;
}

- (id)bestSupportedLanguageCodeForLanguageCode:(id)a3
{
  return -[AFPreferences _bestSupportedLanguageCodeForLanguageCode:isGoodFit:](self, "_bestSupportedLanguageCodeForLanguageCode:isGoodFit:", a3, 0);
}

- (BOOL)_languageCode:(id)a3 isGoodFitForPreferredLanguages:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "containsObject:", v5) & 1) != 0
    || (_AFBestEffortNormalizedLanguageIdentifier(v5),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "containsObject:", v7),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (_AFPreferenceAdditionalGoodFitSystemLocales_onceToken != -1)
      dispatch_once(&_AFPreferenceAdditionalGoodFitSystemLocales_onceToken, &__block_literal_global_1516);
    v11 = (id)_AFPreferenceAdditionalGoodFitSystemLocales_sSpecialCases;
    if ((objc_msgSend(v11, "containsObject:", v10) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      _AFBestEffortNormalizedLanguageIdentifier(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "containsObject:", v12);

    }
  }

  return v9;
}

- (id)_bestSupportedLanguageCodeForLanguageCodes:(id)a3 isGoodFit:(BOOL *)a4
{
  __CFString *v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  AFPreferences *v20;
  void *v21;
  BOOL *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[AFPreferences _bestSupportedLanguageCodeForLanguageCodes:isGoodFit:]";
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (!-[__CFString count](v6, "count"))
  {
    if (a4)
      *a4 = 0;
    v12 = CFSTR("en-US");
    goto LABEL_29;
  }
  v20 = self;
  v22 = a4;
  _AFPreferencesAlternativeLocaleLanguages();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (!-[__CFString count](v6, "count"))
  {
LABEL_14:
    if (v9)
      v14 = v9;
    else
      v14 = v6;
    v11 = v14;
    AFPreferencesSupportedLanguages();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:", v15, v11);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[AFPreferences _bestSupportedLanguageCodeForLanguageCodes:isGoodFit:]";
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_19AF50000, v17, OS_LOG_TYPE_INFO, "%s Preferred Languages = %@, -> Best Supported Languages = %@", buf, 0x20u);
    }
    -[__CFString firstObject](v16, "firstObject", v20);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString length](v12, "length"))
    {

      v18 = AFSiriLogContextConnection;
      v12 = CFSTR("en-US");
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[AFPreferences _bestSupportedLanguageCodeForLanguageCodes:isGoodFit:]";
        v25 = 2112;
        v26 = CFSTR("en-US");
        _os_log_impl(&dword_19AF50000, v18, OS_LOG_TYPE_INFO, "%s falling back to %@", buf, 0x16u);
      }
    }
    if (v22)
      *v22 = objc_msgSend(v21, "_languageCode:isGoodFitForPreferredLanguages:", v12, v11);

    goto LABEL_25;
  }
  v10 = 0;
  while (1)
  {
    -[__CFString objectAtIndex:](v6, "objectAtIndex:", v10, v20);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v12)
      break;
LABEL_13:

    if (++v10 >= (unint64_t)-[__CFString count](v6, "count"))
      goto LABEL_14;
  }
  v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[AFPreferences _bestSupportedLanguageCodeForLanguageCodes:isGoodFit:]";
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s %@ is intentionally supported as %@", buf, 0x20u);
  }
  if (v10)
  {
    if (!v9)
      v9 = (__CFString *)-[__CFString mutableCopy](v6, "mutableCopy");
    -[__CFString replaceObjectAtIndex:withObject:](v9, "replaceObjectAtIndex:withObject:", v10, v12);
    goto LABEL_13;
  }
  if (v22 && (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("hi-IN")) & 1) == 0)
    *v22 = 1;
LABEL_25:

LABEL_29:
  return v12;
}

- (void)setLanguageCode:(id)a3
{
  id v4;
  NSObject *v5;
  AFSettingsConnection *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFPreferences setLanguageCode:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  -[AFPreferences _registerForLanguageCodeChangeNotifications](self, "_registerForLanguageCodeChangeNotifications");
  v6 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setLanguage:](v6, "setLanguage:", v4);
  -[AFSettingsConnection barrier](v6, "barrier");

}

- (BOOL)multilingualResponseEnabledForLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[AFFeatureFlags isMultilingualResponseVariantSelectorEnabled](AFFeatureFlags, "isMultilingualResponseVariantSelectorEnabled")&& AFDeviceSupportsSiriUOD())
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v12 = 136315394;
      v13 = "-[AFPreferences multilingualResponseEnabledForLanguage:]";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v12, 0x16u);
    }
    _AFPreferencesValueForKeyWithContext(CFSTR("Multilingual Response Enablement Per Language"), CFSTR("com.apple.assistant.backedup"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v6, "allKeys"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7)
      && (objc_msgSend(v6, "objectForKey:", v4), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = v8;
      v10 = objc_msgSend(v8, "BOOLValue");

    }
    else
    {
      v10 = -[AFPreferences _defaultMultilingualResponseEnabledForLanguage:](self, "_defaultMultilingualResponseEnabledForLanguage:", v4);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_defaultMultilingualResponseEnabledForLanguage:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("en-IN")))
    return 0;
  objc_msgSend(getTIInputModeControllerClass(), "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enabledInputModeIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasPrefix:", CFSTR("hi-Translit"), (_QWORD)v13) & 1) != 0
          || (objc_msgSend(v10, "hasPrefix:", CFSTR("hi_Latn")) & 1) != 0
          || (objc_msgSend(v10, "hasPrefix:", CFSTR("hi@sw=Devanagari-Hindi")) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_16;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (void)setMultilingualResponseEnabled:(BOOL)a3 forLanguage:(id)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (+[AFFeatureFlags isMultilingualResponseVariantSelectorEnabled](AFFeatureFlags, "isMultilingualResponseVariantSelectorEnabled")&& AFDeviceSupportsSiriUOD())
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v11 = 136315650;
      v12 = "-[AFPreferences setMultilingualResponseEnabled:forLanguage:]";
      v13 = 1024;
      v14 = v4;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %d %@", (uint8_t *)&v11, 0x1Cu);
    }
    _AFPreferencesValueForKeyWithContext(CFSTR("Multilingual Response Enablement Per Language"), CFSTR("com.apple.assistant.backedup"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v5);

    _AFPreferencesSetValueForKeyWithContext(v9, CFSTR("Multilingual Response Enablement Per Language"), CFSTR("com.apple.assistant.backedup"), 0);
    CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));

  }
}

- (void)synchronizeVoiceServicesLanguageCode
{
  void *v2;
  id v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Session Language"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)VSPreferencesCopySpokenLanguageIdentifier();
  if ((objc_msgSend(v3, "isEqualToString:", v2) & 1) == 0)
    VSPreferencesSetSpokenLanguageIdentifier();

}

- (void)setInProgressOutputVoice:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[AFPreferences setInProgressOutputVoice:]";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  _AFPreferencesSetInProgressOutputVoice(v3);
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));

}

- (id)outputVoice
{
  return -[AFPreferences _outputVoiceWithFallback:](self, "_outputVoiceWithFallback:", 1);
}

- (id)_outputVoiceWithFallback:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  AFVoiceInfo *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  AFVoiceInfo *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[AFPreferences _registerForOutputVoice](self, "_registerForOutputVoice");
  -[AFPreferences _registerForLanguageCodeChangeNotifications](self, "_registerForLanguageCodeChangeNotifications");
  _AFPreferencesOutputVoiceWithContext(self->_instanceContext);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (AFVoiceInfo *)v5;
  if (v3 && !v5)
  {
    if (-[AFPreferences assistantIsEnabled](self, "assistantIsEnabled"))
    {
      -[AFPreferences languageCode](self, "languageCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7 || (AFPreferencesLanguageIsSupported(v7) & 1) == 0)
      {
        -[AFPreferences bestSupportedLanguageCodeForLanguageCode:](self, "bestSupportedLanguageCodeForLanguageCode:", v8);
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      AFOutputVoiceLanguageForRecognitionLanguage(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = -[AFVoiceInfo initWithLanguageCode:]([AFVoiceInfo alloc], "initWithLanguageCode:", v10);
      v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v13 = 136315394;
        v14 = "-[AFPreferences _outputVoiceWithFallback:]";
        v15 = 2112;
        v16 = v6;
        _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s No output voice saved, but Assistant is enabled - returning: %@", (uint8_t *)&v13, 0x16u);
      }

    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (void)setOutputVoice:(id)a3
{
  id v4;
  AFSettingsConnection *v5;

  v4 = a3;
  -[AFPreferences _registerForOutputVoice](self, "_registerForOutputVoice");
  -[AFPreferences setShouldSkipIntelligenceVoiceSelectionUpsell:](self, "setShouldSkipIntelligenceVoiceSelectionUpsell:", 1);
  v5 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFSettingsConnection setOutputVoice:](v5, "setOutputVoice:", v4);

  -[AFSettingsConnection barrier](v5, "barrier");
}

- (BOOL)shouldSkipIntelligenceVoiceSelectionUpsell
{
  void *v2;
  char v3;
  _BOOL4 v4;
  int v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;

  _AFPreferencesValueForKeyWithContext(CFSTR("ShouldSkipIntelligenceVoiceSelectionUpsell"), CFSTR("com.apple.assistant.backedup"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) != 0)
    return 1;
  v4 = +[AFFeatureFlags isSystemAssistantExperienceEnabled](AFFeatureFlags, "isSystemAssistantExperienceEnabled");
  v5 = AFDeviceSupportsSAE();
  if (!v4 || v5 == 0)
    return 1;
  _AFPreferencesOutputVoiceWithContext(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AFVoiceInfo voiceInfoForSessionLanguageCode:](AFVoiceInfo, "voiceInfoForSessionLanguageCode:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  v13 = v12 ^ 1;
  return v13;
}

- (void)setShouldSkipIntelligenceVoiceSelectionUpsell:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v4;
  int v5;
  id v7;

  v3 = a3;
  v4 = +[AFFeatureFlags isSystemAssistantExperienceEnabled](AFFeatureFlags, "isSystemAssistantExperienceEnabled");
  v5 = AFDeviceSupportsSAE();
  if (v4 && v5 != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    _AFPreferencesSetValueForKeyWithContext(v7, CFSTR("ShouldSkipIntelligenceVoiceSelectionUpsell"), CFSTR("com.apple.assistant.backedup"), 0);

  }
}

- (void)setLanguageCode:(id)a3 outputVoice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AFSettingsConnection *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "-[AFPreferences setLanguageCode:outputVoice:]";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v10, 0x20u);
  }
  v9 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_instanceContext);
  -[AFPreferences _registerForLanguageCodeChangeNotifications](self, "_registerForLanguageCodeChangeNotifications");
  -[AFPreferences _registerForOutputVoice](self, "_registerForOutputVoice");
  -[AFSettingsConnection setLanguage:outputVoice:](v9, "setLanguage:outputVoice:", v6, v7);
  -[AFSettingsConnection barrier](v9, "barrier");

}

- (int64_t)useDeviceSpeakerForTTS
{
  void *v2;
  void *v3;
  int64_t v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Use device speaker for TTS"), CFSTR("com.apple.assistant.backedup"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 1;

  return v4;
}

- (void)setUseDeviceSpeakerForTTS:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("Use device speaker for TTS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("Type To Siri Enabled");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", AFPreferencesTypeToSiriEnabled());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventWithType:context:", 3203, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v9, CFSTR("Use device speaker for TTS"), CFSTR("com.apple.assistant.backedup"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (int64_t)accessibleEndpointerThreshold
{
  void *v2;
  void *v3;
  int64_t v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Accessible Endpointer Threshold"), CFSTR("com.apple.assistant.backedup"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 1;

  return v4;
}

- (void)setAccessibleEndpointerThreshold:(int64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Accessible Endpointer Threshold"), CFSTR("com.apple.assistant.backedup"), 0);

  -[AFPreferences synchronize](self, "synchronize");
}

- (BOOL)isAccessibleEndpointerEnabled
{
  return -[AFPreferences accessibleEndpointerThreshold](self, "accessibleEndpointerThreshold") > 1;
}

- (void)setLanguageDetectorEnabled:(BOOL)a3
{
  _AFPreferencesSetDictationLanguageDetectorEnabled(a3);
}

- (BOOL)infersQoSFromInstanceUUIDForEAR
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("Infers QoS from Instance UUID for EAR"), 1, CFSTR("com.apple.assistant"), self->_instanceContext);
}

- (void)setKeepRecordedAudioFiles:(BOOL)a3
{
  const void *v3;

  v3 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  CFPreferencesSetValue(CFSTR("Keep Recorded Audio Files"), v3, CFSTR("com.apple.assistant"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
}

- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  AFSettingsConnection *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(AFSettingsConnection);
  -[AFSettingsConnection getExperimentForConfigurationIdentifier:completion:](v7, "getExperimentForConfigurationIdentifier:completion:", v6, v5);

  -[AFSettingsConnection barrier](v7, "barrier");
}

- (void)setMediaPlaybackEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFPreferences setMediaPlaybackEnabled:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v7, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v6, CFSTR("Media Playback Enabled"), CFSTR("com.apple.assistant"), self->_instanceContext);

  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
}

- (BOOL)mediaPlaybackEnabled
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("Media Playback Enabled"), 1, CFSTR("com.apple.assistant"), self->_instanceContext);
}

- (id)siriSpeechRate
{
  void *v2;
  id v3;

  _AFPreferencesValueForKeyWithContext(CFSTR("Siri Speech Rate"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = &unk_1E3AAA9C8;

  return v3;
}

- (void)setSiriSpeechRate:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, CFSTR("Siri Speech Rate"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
}

- (BOOL)useAtypicalSpeechModel
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("Use Atypical Speech Model"), 0, CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
}

- (void)setUseAtypicalSpeechModel:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Use Atypical Speech Model"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);

}

- (BOOL)isSiriAccessibilityBargeInEnabled
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("BargeIn Support Enabled"), 1, CFSTR("com.apple.assistant.backedup"), self->_instanceContext);
}

- (void)setSiriAccessibilityBargeInEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("BargeIn Support Enabled"), CFSTR("com.apple.assistant.backedup"), self->_instanceContext);

}

- (id)bluetoothPreferredCarAudioRoute
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AFPreferencesValueForKeyWithContext(CFSTR("preferredOutputRoute_v2"), CFSTR("com.apple.siri.CarBluetooth"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    v4 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v5 = v4;
      v8 = 136315650;
      v9 = "-[AFPreferences bluetoothPreferredCarAudioRoute]";
      v10 = 2112;
      v11 = (id)objc_opt_class();
      v12 = 2112;
      v13 = v2;
      v6 = v11;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s Expected a String, but found %@: %@", (uint8_t *)&v8, 0x20u);

    }
    v3 = 0;
  }

  return v3;
}

- (void)setBluetoothPreferredCarAudioRoute:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AFPreferences bluetoothPreferredCarAudioRoute](self, "bluetoothPreferredCarAudioRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("preferredOutputRoute_v2"), CFSTR("com.apple.siri.CarBluetooth"), 0);
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("A2DP")))
    {
      v6 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v11 = 136315138;
        v12 = "-[AFPreferences setBluetoothPreferredCarAudioRoute:]";
        _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s #BTCarAudioRoute BT car PreferredRoute is changed to A2DP", (uint8_t *)&v11, 0xCu);
      }
      v7 = "com.apple.preferences-sounds.preferredOutputRoute.changed.A2DP";
    }
    else
    {
      v8 = objc_msgSend(v4, "isEqualToString:", CFSTR("DeviceSpeaker"));
      v9 = AFSiriLogContextConnection;
      v10 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
      if (v8)
      {
        if (v10)
        {
          v11 = 136315138;
          v12 = "-[AFPreferences setBluetoothPreferredCarAudioRoute:]";
          _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s #BTCarAudioRoute BT car PreferredRoute is changed to DeviceSpeaker", (uint8_t *)&v11, 0xCu);
        }
        v7 = "com.apple.preferences-sounds.preferredOutputRoute.changed.DeviceSpeaker";
      }
      else
      {
        if (v10)
        {
          v11 = 136315138;
          v12 = "-[AFPreferences setBluetoothPreferredCarAudioRoute:]";
          _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s #BTCarAudioRoute BT car PreferredRoute is changed to HFP", (uint8_t *)&v11, 0xCu);
        }
        v7 = "com.apple.preferences-sounds.preferredOutputRoute.changed.HFP";
      }
    }
    notify_post(v7);
  }

}

- (BOOL)prewarmOrbEnabled
{
  return _AFPreferencesBoolValueForKeyWithContext(CFSTR("Prewarm Orb Enabled"), 1, CFSTR("com.apple.assistant"), self->_instanceContext);
}

- (void)_registerForNavStatusIfNeeded
{
  NSObject *v3;
  uint32_t v4;

  if (!self->_navTokenIsValid)
  {
    if (AFIsHorseman_onceToken != -1)
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
    if (!AFIsHorseman_isHorseman)
    {
      dispatch_get_global_queue(0, 0);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = notify_register_dispatch("com.apple.siri.nav_status", &self->_navToken, v3, &__block_literal_global_916);

      self->_navTokenIsValid = v4 == 0;
    }
  }
}

- (id)valueForSessionContextPreferenceKey:(id)a3
{
  _BOOL8 v5;
  void *v7;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Navigation Status")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFPreferences.m"), 6822, CFSTR("This SPI is not to be used with other keys"));

  }
  v5 = -[AFPreferences currentNavigationState](self, "currentNavigationState") - 1 < 3;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
}

- (void)setValue:(id)a3 forSessionContextKey:(id)a4
{
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("Navigation Status")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFPreferences.m"), 6830, CFSTR("This SPI is not to be used with other keys"));

  }
  -[AFPreferences setCurrentNavigationState:](self, "setCurrentNavigationState:", objc_msgSend(v8, "BOOLValue"));

}

- (unint64_t)currentNavigationState
{
  NSObject *navTokenQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  navTokenQueue = self->_navTokenQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AFPreferences_currentNavigationState__block_invoke;
  v5[3] = &unk_1E3A36F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(navTokenQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCurrentNavigationState:(unint64_t)a3
{
  NSObject *navTokenQueue;
  _QWORD v4[6];

  navTokenQueue = self->_navTokenQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__AFPreferences_setCurrentNavigationState___block_invoke;
  v4[3] = &unk_1E3A353C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(navTokenQueue, v4);
}

- (void)setTLSSessionTicketsFlushPending:(BOOL)a3
{
  int64_t v3;
  id v4;

  v3 = 1;
  if (!a3)
    v3 = 2;
  self->_tlsSessionTicketFlushRequestPending = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AFPreferencesSetValueForKeyWithContext(v4, CFSTR("Flush Session Tickets Cache"), CFSTR("com.apple.assistant"), 0);

}

- (BOOL)tlsSessionTicketsFlushPending
{
  int64_t tlsSessionTicketFlushRequestPending;
  int v3;
  void *v5;
  int64_t v6;

  tlsSessionTicketFlushRequestPending = self->_tlsSessionTicketFlushRequestPending;
  if (tlsSessionTicketFlushRequestPending)
  {
    LOBYTE(v3) = tlsSessionTicketFlushRequestPending == 1;
  }
  else
  {
    _AFPreferencesValueForKeyWithContext(CFSTR("Flush Session Tickets Cache"), CFSTR("com.apple.assistant"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "BOOLValue");

    v6 = 1;
    if (!v3)
      v6 = 2;
    self->_tlsSessionTicketFlushRequestPending = v6;
  }
  return v3;
}

- (void)_setLoggingDefaultValue:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", CFSTR("/Library/Managed Preferences/mobile"), 0);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/Library/Managed Preferences/mobile"), 1, 0, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), CFSTR("com.apple.assistant.logging"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/Library/Managed Preferences/mobile"), "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v10);
  v12 = (id)objc_msgSend(v11, "mutableCopy");

  if (!v12)
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v13)
    objc_msgSend(v12, "setObject:forKey:", v13, v5);
  else
    objc_msgSend(v12, "removeObjectForKey:", v5);
  _CFPreferencesWriteManagedDomainForUser();
  notify_post("com.apple.AppSupport.loggingDefaultsChanged");

}

- (void)setFileLoggingIsEnabled:(BOOL)a3
{
  void *v3;

  if (a3)
    v3 = &unk_1E3AA5D58;
  else
    v3 = 0;
  -[AFPreferences _setLoggingDefaultValue:forKey:](self, "_setLoggingDefaultValue:forKey:", v3, CFSTR("AFLogLevel"));
}

- (BOOL)fileLoggingIsEnabled
{
  return CFPreferencesGetAppIntegerValue(CFSTR("AFLogLevel"), CFSTR("com.apple.assistant.logging"), 0) > 0;
}

- (void)setCardLoggingEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("Card Logging Enabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.assistant.logging"));
}

- (BOOL)cardLoggingEnabled
{
  char v2;
  void *v3;
  void *v4;

  if (AFIsCustomerInstallOrPPT())
    return 0;
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("Card Logging Enabled"), CFSTR("com.apple.assistant.logging"));
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (void)setCommandLoggingEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("AFCommandLoggingEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("com.apple.assistant.logging"));
}

- (BOOL)commandLoggingEnabled
{
  void *v2;
  char v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AFCommandLoggingEnabled"), CFSTR("com.apple.assistant.logging"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setNetworkLoggingEnabled:(BOOL)a3
{
  _AFPreferencesSetNetworkLoggingEnabled(a3);
}

- (void)setAVVCLoggingEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  CFPreferencesSetAppValue(CFSTR("dump_input"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"), CFSTR("com.apple.avfoundation.avvc"));
  CFPreferencesSetAppValue(CFSTR("debug_level"), &unk_1E3AA5D70, CFSTR("com.apple.avfoundation.avvc"));
  CFPreferencesSetAppValue(CFSTR("debug_state"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("com.apple.avfoundation.avvc"));
  CFPreferencesSetAppValue(CFSTR("debug_callbacks"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("com.apple.avfoundation.avvc"));
  CFPreferencesSetAppValue(CFSTR("debug_timing"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("com.apple.avfoundation.avvc"));
  CFPreferencesSetAppValue(CFSTR("debug_logtofile"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("com.apple.avfoundation.avvc"));
}

- (BOOL)avvcLoggingEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("dump_input"), CFSTR("com.apple.avfoundation.avvc"));
  if (objc_msgSend(v2, "BOOLValue"))
  {
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("debug_level"), CFSTR("com.apple.avfoundation.avvc"));
    if ((int)objc_msgSend(v3, "intValue") < 2)
    {
      v8 = 0;
    }
    else
    {
      v4 = (void *)CFPreferencesCopyAppValue(CFSTR("debug_state"), CFSTR("com.apple.avfoundation.avvc"));
      if (objc_msgSend(v4, "BOOLValue"))
      {
        v5 = (void *)CFPreferencesCopyAppValue(CFSTR("debug_callbacks"), CFSTR("com.apple.avfoundation.avvc"));
        if (objc_msgSend(v5, "BOOLValue"))
        {
          v6 = (void *)CFPreferencesCopyAppValue(CFSTR("debug_timing"), CFSTR("com.apple.avfoundation.avvc"));
          if (objc_msgSend(v6, "BOOLValue"))
          {
            v7 = (void *)CFPreferencesCopyAppValue(CFSTR("debug_logtofile"), CFSTR("com.apple.avfoundation.avvc"));
            v8 = objc_msgSend(v7, "BOOLValue");

          }
          else
          {
            v8 = 0;
          }

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)autoDismissal2018Enabled
{
  void *v2;
  void *v3;
  char v4;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (!AFIsInternalInstall_isInternal)
    return 0;
  _AFPreferencesValueForKeyWithContext(CFSTR("Auto Dismissal 2018 Enabled"), CFSTR("com.apple.assistant"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setAutoDismissal2018Enabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _AFPreferencesSetValueForKeyWithContext(v5, CFSTR("Auto Dismissal 2018 Enabled"), CFSTR("com.apple.assistant"), 0);

    -[AFPreferences synchronize](self, "synchronize");
  }
}

- (BOOL)dismissWhenFaceAttentionIsLostEnabled
{
  void *v2;
  void *v3;
  char v4;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (!AFIsInternalInstall_isInternal)
    return 0;
  _AFPreferencesValueForKeyWithContext(CFSTR("Dismiss When Face Attention is Lost"), CFSTR("com.apple.assistant"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setDismissWhenFaceAttentionIsLostEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _AFPreferencesSetValueForKeyWithContext(v5, CFSTR("Dismiss When Face Attention is Lost"), CFSTR("com.apple.assistant"), 0);

    -[AFPreferences synchronize](self, "synchronize");
  }
}

- (BOOL)dismissWhenDeviceIsLoweredEnabled
{
  void *v2;
  void *v3;
  char v4;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (!AFIsInternalInstall_isInternal)
    return 0;
  _AFPreferencesValueForKeyWithContext(CFSTR("Dismiss When Device is Lowered"), CFSTR("com.apple.assistant"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setDismissWhenDeviceIsLoweredEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _AFPreferencesSetValueForKeyWithContext(v5, CFSTR("Dismiss When Device is Lowered"), CFSTR("com.apple.assistant"), 0);

    -[AFPreferences synchronize](self, "synchronize");
  }
}

- (double)handsOnIdleTimeInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (!AFIsInternalInstall_isInternal)
    return 0.0;
  _AFPreferencesValueForKeyWithContext(CFSTR("Hands-On Idle Time Interval (sec)"), CFSTR("com.apple.assistant"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 3.0;
  }

  return v5;
}

- (void)setHandsOnIdleTimeInterval:(double)a3
{
  void *v5;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _AFPreferencesSetValueForKeyWithContext(v5, CFSTR("Hands-On Idle Time Interval (sec)"), CFSTR("com.apple.assistant"), 0);

    -[AFPreferences synchronize](self, "synchronize");
  }
}

- (double)handsOffIdleTimeInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (!AFIsInternalInstall_isInternal)
    return 0.0;
  _AFPreferencesValueForKeyWithContext(CFSTR("Hands-Off Idle Time Interval (sec)"), CFSTR("com.apple.assistant"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 3.0;
  }

  return v5;
}

- (void)setHandsOffIdleTimeInterval:(double)a3
{
  void *v5;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _AFPreferencesSetValueForKeyWithContext(v5, CFSTR("Hands-Off Idle Time Interval (sec)"), CFSTR("com.apple.assistant"), 0);

    -[AFPreferences synchronize](self, "synchronize");
  }
}

- (void)setConfigOverrideWithValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[AFPreferences configOverrides](self, "configOverrides");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (!v8)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  objc_msgSend(v8, "setObject:forKey:", v9, v6);
  -[AFPreferences setConfigOverrides:](self, "setConfigOverrides:", v8);

}

- (void)removeConfigOverrideForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AFPreferences configOverrides](self, "configOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "removeObjectForKey:", v7);
    -[AFPreferences setConfigOverrides:](self, "setConfigOverrides:", v5);
  }

}

- (void)setConfigOverrides:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, CFSTR("Config Overrides"), CFSTR("com.apple.assistant"), 0);
  -[AFPreferences synchronize](self, "synchronize");
}

- (id)configOverrides
{
  void *v2;
  void *v3;
  void *v4;

  _AFPreferencesValueForKeyWithContext(CFSTR("Config Overrides"), CFSTR("com.apple.assistant"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AFPreferencesValueForKeyWithContext(CFSTR("Config Profile Overrides"), CFSTR("com.apple.assistant"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (void)setServerOverride:(id)a3
{
  _AFPreferencesSetValueForKeyWithContext(a3, CFSTR("Server Override"), CFSTR("com.apple.assistant"), self->_instanceContext);
}

- (id)_nanoPreferencesValueForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[AFPreferences _registerForNanoPrefsChangeNotifications](self, "_registerForNanoPrefsChangeNotifications");
  _AFNanoPreferencesValueForKey((uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setNanoPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[AFPreferences _registerForNanoPrefsChangeNotifications](self, "_registerForNanoPrefsChangeNotifications");
  _AFNanoPreferencesSetValueForKey(v7, (uint64_t)v6);

}

- (BOOL)nanoAssistantEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("Assistant Enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setNanoAssistantEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("Assistant Enabled"));

}

- (BOOL)nanoDictationEnabled
{
  void *v2;
  char v3;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("Dictation Enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setNanoDictationEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("Dictation Enabled"));

}

- (BOOL)nanoDictationAutoPunctuationEnabled
{
  void *v2;
  char v3;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("Dictation Auto Punctuation Enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setNanoDictationAutoPunctuationEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("Dictation Auto Punctuation Enabled"));

}

- (void)setNanoLanguageCode:(id)a3 outputVoice:(id)a4 forTinkerDevice:(id)a5
{
  id (__cdecl *v7)();
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v7 = (id (__cdecl *)())getNPSDomainAccessorClass;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v16 = (id)objc_msgSend(objc_alloc((Class)v7()), "initWithDomain:pairedDevice:", CFSTR("com.apple.assistant.nano"), v8);

  objc_msgSend(v16, "setObject:forKey:", v10, CFSTR("Session Language Tinker"));
  objc_msgSend(v9, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setObject:forKey:", v11, CFSTR("Output Voice Tinker"));
  v12 = (id)objc_msgSend(v16, "synchronize");
  v13 = objc_alloc_init((Class)getNPSManagerClass(v12));
  objc_msgSend(v16, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Session Language Tinker"), CFSTR("Output Voice Tinker"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "synchronizeNanoDomain:keys:", v14, v15);

}

- (BOOL)nanoPhraseSpotterEnabled
{
  void *v2;
  char v3;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("PHS Enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setNanoPhraseSpotterEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("PHS Enabled"));

}

- (BOOL)nanoJSSupported
{
  void *v2;
  char v3;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("JS Supported"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)nanoVTPhraseType
{
  void *v2;
  unint64_t v3;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("VT Phrase Type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");

  return v3;
}

- (void)setNanoVTPhraseType:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("VT Phrase Type"));

}

- (BOOL)nanoRaiseToSpeakEnabled
{
  void *v2;
  char v3;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("RTS Enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setNanoRaiseToSpeakEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("RTS Enabled"));

}

- (int64_t)nanoUseDeviceSpeakerForTTS
{
  void *v2;
  void *v3;
  int64_t v4;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("Use device speaker for TTS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 2;

  return v4;
}

- (void)setNanoUseDeviceSpeakerForTTS:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("Use device speaker for TTS"));

}

- (float)nanoTTSSpeakerVolume
{
  void *v2;
  double v3;
  float v4;
  float v5;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("TTS Speaker Volume"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    LODWORD(v3) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setNanoTTSSpeakerVolume:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("TTS Speaker Volume"));

}

- (id)nanoLanguageCode
{
  return -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("Session Language"));
}

- (void)setNanoLanguageCode:(id)a3
{
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", a3, CFSTR("Session Language"));
}

- (id)nanoOutputVoice
{
  void *v2;
  AFVoiceInfo *v3;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("Output Voice"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = -[AFVoiceInfo initWithDictionaryRepresentation:]([AFVoiceInfo alloc], "initWithDictionaryRepresentation:", v2);
  else
    v3 = 0;

  return v3;
}

- (void)setNanoOutputVoice:(id)a3
{
  id v4;

  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("Output Voice"));

}

- (BOOL)nanoCrownActivationEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("Crown Activation Enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setNanoCrownActivationEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("Crown Activation Enabled"));

}

- (BOOL)nanoMessageWithoutConfirmationEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("Message Without Confirmation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setNanoMessageWithoutConfirmationEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("Message Without Confirmation"));

}

- (id)nanoOfflineDictationStatus
{
  void *v2;
  id v3;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("Offline Dictation Status"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)nanoDictationAutoPunctuationSupportedLanguages
{
  void *v2;
  id v3;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("Dictation Auto Punctuation Supported Languages"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)nanoSiriResponseShouldAlwaysPrint
{
  void *v2;
  void *v3;
  char v4;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("Siri Response Should Always Print"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setNanoSiriResponseShouldAlwaysPrint:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("Siri Response Should Always Print"));

}

- (BOOL)nanoAlwaysShowRecognizedSpeech
{
  void *v2;
  void *v3;
  char v4;

  -[AFPreferences _nanoPreferencesValueForKey:](self, "_nanoPreferencesValueForKey:", CFSTR("Always Show Recognized Speech 2.0"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setNanoAlwaysShowRecognizedSpeech:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AFPreferences _setNanoPreferencesValue:forKey:](self, "_setNanoPreferencesValue:forKey:", v4, CFSTR("Always Show Recognized Speech 2.0"));

}

- (void)erasePreferences
{
  NSObject *v3;
  AFInstanceContext *instanceContext;
  int v5;
  const char *v6;
  __int16 v7;
  AFInstanceContext *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    instanceContext = self->_instanceContext;
    v5 = 136315394;
    v6 = "-[AFPreferences erasePreferences]";
    v7 = 2112;
    v8 = instanceContext;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Unable to erase all Siri preferences for %@.", (uint8_t *)&v5, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trampolineObservers, 0);
  objc_storeStrong((id *)&self->_trampolineObserverListLock, 0);
  objc_storeStrong((id *)&self->_trampoline, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_navTokenQueue, 0);
}

uint64_t __43__AFPreferences_setCurrentNavigationState___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_registerForNavStatusIfNeeded");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 24))
  {
    result = notify_set_state(*(_DWORD *)(v3 + 28), *(_QWORD *)(a1 + 40));
    if (!(_DWORD)result)
      return notify_post("com.apple.siri.nav_status");
  }
  return result;
}

uint64_t __39__AFPreferences_currentNavigationState__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  BOOL v4;
  uint64_t state64;

  result = objc_msgSend(*(id *)(a1 + 32), "_registerForNavStatusIfNeeded");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 24))
  {
    state64 = 0;
    result = notify_get_state(*(_DWORD *)(v3 + 28), &state64);
    if ((_DWORD)result)
      v4 = 1;
    else
      v4 = state64 > 3;
    if (!v4)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = state64;
  }
  return result;
}

void __46__AFPreferences__registerForNavStatusIfNeeded__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("AFPreferencesNavStatusDidChangeNotification"), 0);

}

void __72__AFPreferences_setSiriDataSharingHomePodSetupDeviceIsValid_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __66__AFPreferences_setSiriDataSharingOptInAlertPresented_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __99__AFPreferences_setSiriDataSharingOptInStatus_propagateToHomeAccessories_source_reason_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __58__AFPreferences_setSiriDataSharingOptInStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __69__AFPreferences_getShowAppsBehindSiriInCarPlayEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __78__AFPreferences_getMessageWithoutConfirmationHeadphonesEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __77__AFPreferences_getMessageWithoutConfirmationInCarPlayEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __68__AFPreferences_getMessageWithoutConfirmationEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __69__AFPreferences_getAnnounceNotificationsInCarPlayTypeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __84__AFPreferences_getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __94__AFPreferences_getAnnounceNotificationsTemporarilyDisabledEndDateForApp_platform_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __87__AFPreferences_getAnnounceNotificationsTemporarilyDisabledForApp_platform_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  id v6;

  v6 = a2;
  v5 = 0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "compare:", v3);

    if (v4 == 1)
      v5 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __87__AFPreferences_getAnnounceNotificationsTemporarilyDisabledForApp_platform_completion___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __87__AFPreferences_getAnnounceNotificationsTemporarilyDisabledForApp_platform_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a1[7];
  v3 = AFSiriLogContextConnection;
  v4 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  if (v2 == 2)
  {
    if (v4)
    {
      v5 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v6 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
      v11 = 136315650;
      v12 = "-[AFPreferences getAnnounceNotificationsTemporarilyDisabledForApp:platform:completion:]_block_invoke_3";
      v13 = 1024;
      v14 = v5;
      v15 = 1024;
      v16 = v6;
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s announce notifications disabledForCarPlay: %{BOOL}d || disabledUntilEndDate: %{BOOL}d", (uint8_t *)&v11, 0x18u);
    }
    v7 = a1[4];
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
      v8 = 1;
    else
      v8 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) != 0;
  }
  else
  {
    if (v4)
    {
      v9 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
      v11 = 136315394;
      v12 = "-[AFPreferences getAnnounceNotificationsTemporarilyDisabledForApp:platform:completion:]_block_invoke";
      v13 = 1024;
      v14 = v9;
      _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s announce notifications disabledUntilEndDate: %{BOOL}d", (uint8_t *)&v11, 0x12u);
    }
    v7 = a1[4];
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, v8);
}

void __90__AFPreferences_getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __89__AFPreferences_getAnnounceNotificationsTemporarilyDisabledStatusForPlatform_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  id v6;

  v6 = a2;
  v5 = 0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "compare:", v3);

    if (v4 == 1)
      v5 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __89__AFPreferences_getAnnounceNotificationsTemporarilyDisabledStatusForPlatform_completion___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __89__AFPreferences_getAnnounceNotificationsTemporarilyDisabledStatusForPlatform_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = a1[7];
  v3 = a1[4];
  v4 = v2 == 2 && *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24)
    || *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24) != 0;
  return (*(uint64_t (**)(uint64_t, _BOOL8))(v3 + 16))(v3, v4);
}

void __81__AFPreferences_getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __83__AFPreferences_getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __70__AFPreferences_getSpokenNotificationIsAlwaysOpportuneWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __71__AFPreferences_getHeadGesturesForCurrentlyRoutedDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __72__AFPreferences_setHeadGesturesForCurrentlyRoutedDevice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __73__AFPreferences_getPersonalVolumeForCurrentlyRoutedDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __74__AFPreferences_setPersonalVolumeForCurrentlyRoutedDevice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __80__AFPreferences_getConversationAwarenessForCurrentlyRoutedDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __81__AFPreferences_setConversationAwarenessForCurrentlyRoutedDevice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __62__AFPreferences_setSearchQueriesDataSharingStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __57__AFPreferences_dictationAutoPunctuationSupportedLocales__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("en-US"), CFSTR("en-GB"), CFSTR("en-IN"), CFSTR("en-CA"), CFSTR("zh-CN"), CFSTR("zh-HK"), CFSTR("ja-JP"), CFSTR("fr-FR"), CFSTR("de-DE"), CFSTR("en-AU"), CFSTR("es-ES"), CFSTR("es-MX"), CFSTR("es-US"), CFSTR("zh-TW"), CFSTR("en-SG"), CFSTR("fr-CA"), CFSTR("ko-KR"),
    CFSTR("ar-SA"),
    CFSTR("ar-UA"),
    CFSTR("it-IT"),
    CFSTR("yue-CN"),
    CFSTR("fr-CH"),
    CFSTR("de-CH"),
    CFSTR("it-CH"),
    CFSTR("nl-NL"),
    CFSTR("sv-SE"),
    CFSTR("fr-BE"),
    CFSTR("nl-BE"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dictationAutoPunctuationSupportedLocales_supportedLocales;
  dictationAutoPunctuationSupportedLocales_supportedLocales = v0;

}

void __57__AFPreferences_getOfflineDictationStatusWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __67__AFPreferences__registerForDictationEnablementChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFPreferences _registerForDictationEnablementChangeNotifications]_block_invoke";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Dictation Enablement Changed!", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(v2, "_dictationEnablementDidChangeExternally");

}

void __67__AFPreferences__registerForAssistantEnablementChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFPreferences _registerForAssistantEnablementChangeNotifications]_block_invoke";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Assistant Enablement Changed!", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(v2, "_assistantEnablementDidChangeExternally");

}

void __57__AFPreferences__registerForNanoPrefsChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFPreferences _registerForNanoPrefsChangeNotifications]_block_invoke";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Nano Prefs Changed!", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(v2, "_nanoPrefsDidChangeExternally");

}

void __40__AFPreferences__registerForOutputVoice__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFPreferences _registerForOutputVoice]_block_invoke";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Output Voice Changed!", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(v2, "_outputVoiceDidChangeExternally");

}

void __60__AFPreferences__registerForLanguageCodeChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFPreferences _registerForLanguageCodeChangeNotifications]_block_invoke";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Language Code Changed!", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(v2, "_languageCodeDidChangeExternally");

}

void __42__AFPreferences__registerForInternalPrefs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFPreferences _registerForInternalPrefs]_block_invoke";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Internal Preferences Changed!", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(v2, "_internalPreferencesDidChangeExternally");

}

void __41__AFPreferences_initWithInstanceContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFPreferences initWithInstanceContext:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s Preferences Changed!", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(v2, "_preferencesDidChangeExternally");

}

void __54__AFPreferences__registerForDarwinNotification_block___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

@end
