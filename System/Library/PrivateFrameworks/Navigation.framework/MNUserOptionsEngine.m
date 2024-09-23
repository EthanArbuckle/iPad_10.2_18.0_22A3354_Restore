@implementation MNUserOptionsEngine

+ (id)sharedInstance
{
  if (qword_1ED0C3F90 != -1)
    dispatch_once(&qword_1ED0C3F90, &__block_literal_global_22);
  return (id)_MergedGlobals_30;
}

void __37__MNUserOptionsEngine_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_30;
  _MergedGlobals_30 = v0;

}

- (MNUserOptionsEngine)init
{
  MNUserOptionsEngine *v2;
  uint64_t v3;
  MNUserOptions *options;
  MNUserOptionsEngine *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MNUserOptionsEngine;
  v2 = -[MNUserOptionsEngine init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    options = v2->_options;
    v2->_options = (MNUserOptions *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSString)currentVoiceLanguage
{
  NSString *navSessionLanguage;

  navSessionLanguage = self->_navSessionLanguage;
  if (navSessionLanguage)
    return navSessionLanguage;
  +[MNVoiceLanguageUtil systemDefaultVoiceLanguage](MNVoiceLanguageUtil, "systemDefaultVoiceLanguage");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)registerObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  MNObserverHashTable *v7;
  MNObserverHashTable *observers;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EEEEB7B8) & 1) != 0)
    {
      if (!self->_observers)
      {
        GetAudioLogForMNUserOptionsEngineCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "ⓤ Creating observer table", (uint8_t *)&v11, 2u);
        }

        v7 = -[MNObserverHashTable initWithProtocol:]([MNObserverHashTable alloc], "initWithProtocol:", &unk_1EEEEB7B8);
        observers = self->_observers;
        self->_observers = v7;

      }
      GetAudioLogForMNUserOptionsEngineCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEBUG, "ⓤ Adding observer : %@", (uint8_t *)&v11, 0xCu);
      }

      -[MNObserverHashTable registerObserver:](self->_observers, "registerObserver:", v5);
    }
    else
    {
      GetAudioLogForMNUserOptionsEngineCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEBUG, "⒰ object isn't a MNUserOptionsObserver : %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *p_super;
  _BOOL4 v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EEEEB7B8);
    GetAudioLogForMNUserOptionsEngineCategory();
    p_super = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
    if ((v6 & 1) == 0)
    {
      if (v8)
      {
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1B0AD7000, p_super, OS_LOG_TYPE_DEBUG, "⒰ object isn't a MNUserOptionsObserver : %@", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_11;
    }
    if (v8)
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1B0AD7000, p_super, OS_LOG_TYPE_DEBUG, "ⓤ Removing observer : %@", (uint8_t *)&v10, 0xCu);
    }

    -[MNObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", v5);
    if (!-[MNObserverHashTable hasObservers](self->_observers, "hasObservers"))
    {
      GetAudioLogForMNUserOptionsEngineCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEBUG, "ⓤ Observer table empty; destroying",
          (uint8_t *)&v10,
          2u);
      }

      p_super = &self->_observers->super;
      self->_observers = 0;
LABEL_11:

    }
  }

}

- (void)update:(id)a3
{
  id v4;
  MNUserOptions *v5;
  MNUserOptions *v6;
  MNUserOptions *options;
  NSObject *v8;
  MNUserOptions *v9;
  int v10;
  MNUserOptions *v11;
  __int16 v12;
  MNUserOptions *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[MNUserOptions isEqual:](self->_options, "isEqual:", v4))
    {
      GetAudioLogForMNUserOptionsEngineCategory();
      v5 = (MNUserOptions *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1B0AD7000, &v5->super, OS_LOG_TYPE_INFO, "ⓤ Ignoring options update; they are unchanged",
          (uint8_t *)&v10,
          2u);
      }
    }
    else
    {
      v5 = self->_options;
      v6 = (MNUserOptions *)objc_msgSend(v4, "copy");
      options = self->_options;
      self->_options = v6;

      GetAudioLogForMNUserOptionsEngineCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = self->_options;
        v10 = 138412546;
        v11 = v5;
        v12 = 2112;
        v13 = v9;
        _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "ⓤ Notifying observers with old options : %@ and new options : %@", (uint8_t *)&v10, 0x16u);
      }

      -[MNObserverHashTable userOptionsEngine:didChangeFrom:to:](self->_observers, "userOptionsEngine:didChangeFrom:to:", self, v5, self->_options);
    }

  }
}

- (id)localizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "_navigationBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNUserOptionsEngine currentVoiceLanguage](self, "currentVoiceLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v7 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v5, "localizations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "preferredLocalizationsFromArray:forPreferences:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:localization:", v4, &stru_1E61D9090, CFSTR("Navigation"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      GetAudioLogForMNUserOptionsEngineCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v20 = 138412802;
        v21 = v4;
        v22 = 2112;
        v23 = v6;
        v24 = 2112;
        v25 = v11;
        _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_INFO, "⒰ trying to find key: %@, language: %@, canonical language identifier: %@", (uint8_t *)&v20, 0x20u);
      }

      if (v12)
      {
        if (objc_msgSend(v12, "isEqualToString:", v4))
        {
          GetAudioLogForMNUserOptionsEngineCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v20 = 138412802;
            v21 = v4;
            v22 = 2112;
            v23 = v6;
            v24 = 2112;
            v25 = v11;
            _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_ERROR, "⒰ a string for key wasn't found : key: %@, language: %@, canonical language identifier: %@", (uint8_t *)&v20, 0x20u);
          }

        }
        v15 = v12;
      }
      else
      {
        _MNLocalizedStringFromThisBundle(v4);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (void *)v16;
        else
          v18 = v4;
        v15 = v18;

      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)updateNavigationSessionLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_navSessionLanguage, a3);
}

- (MNUserOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_navSessionLanguage, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
