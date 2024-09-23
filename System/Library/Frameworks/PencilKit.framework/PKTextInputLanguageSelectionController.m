@implementation PKTextInputLanguageSelectionController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKTextInputLanguageSelectionController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECEE6148 != -1)
    dispatch_once(&qword_1ECEE6148, block);
  return (id)_MergedGlobals_118;
}

void __56__PKTextInputLanguageSelectionController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_118;
  _MergedGlobals_118 = (uint64_t)v1;

}

- (PKTextInputLanguageSelectionController)init
{
  PKTextInputLanguageSelectionController *v2;
  uint64_t v3;
  NSMutableDictionary *observers;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v8;
  NSHashTable *languageSelectionControllerObservers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKTextInputLanguageSelectionController;
  v2 = -[PKTextInputLanguageSelectionController init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__handleKeyboardPreferencesChanged_, *MEMORY[0x1E0DC4F98], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleKeyboardCurrentInputModeChanged_, *MEMORY[0x1E0DC5528], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)NotificationCallback, CFSTR("com.apple.PencilKit"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    languageSelectionControllerObservers = v2->_languageSelectionControllerObservers;
    v2->_languageSelectionControllerObservers = (NSHashTable *)v8;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4F98], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5528], 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.PencilKit"), 0);
  v6.receiver = self;
  v6.super_class = (Class)PKTextInputLanguageSelectionController;
  -[PKTextInputLanguageSelectionController dealloc](&v6, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_languageSelectionControllerObservers, "addObject:", a3);
}

- (void)_pencilPreferencesChangedCallback:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  id v9;

  -[PKTextInputLanguageSelectionController _cachedLanguageIdentifiers](self, "_cachedLanguageIdentifiers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKTextInputLanguageSelectionController _enabledLanguagesByPreference](self, "_enabledLanguagesByPreference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputLanguageSelectionController _cachedLanguageIdentifiers](self, "_cachedLanguageIdentifiers");
    v6 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v7 | v6)
    {
      v9 = (id)v7;
      if (v7 && v6)
      {
        v8 = objc_msgSend((id)v6, "isEqual:", v7);

        v7 = (unint64_t)v9;
        if ((v8 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
      -[PKTextInputLanguageSelectionController _clearCachesAndUpdateIconObservers](self, "_clearCachesAndUpdateIconObservers");
      -[PKTextInputLanguageSelectionController _notifyLanguageSelectionDidChange](self, "_notifyLanguageSelectionDidChange");
      v7 = (unint64_t)v9;
    }
LABEL_10:

  }
}

- (void)_handleKeyboardCurrentInputModeChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  UIMenu *cachedLanguageMenu;

  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalTextInputLocales");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    cachedLanguageMenu = self->_cachedLanguageMenu;
    self->_cachedLanguageMenu = 0;

    -[PKTextInputLanguageSelectionController set_cachedLanguageIdentifiers:](self, "set_cachedLanguageIdentifiers:", 0);
    -[PKTextInputLanguageSelectionController set_cachedLanguageIdentifiersForEmojiAlternatives:](self, "set_cachedLanguageIdentifiersForEmojiAlternatives:", 0);
  }
}

- (void)_clearCachesAndUpdateIconObservers
{
  UIMenu *cachedLanguageMenu;

  cachedLanguageMenu = self->_cachedLanguageMenu;
  self->_cachedLanguageMenu = 0;

  -[PKTextInputLanguageSelectionController set_cachedLanguageIdentifiers:](self, "set_cachedLanguageIdentifiers:", 0);
  -[PKTextInputLanguageSelectionController set_cachedLanguageIdentifiersForEmojiAlternatives:](self, "set_cachedLanguageIdentifiersForEmojiAlternatives:", 0);
  -[PKTextInputLanguageSelectionController notifyLanguageDidChange](self, "notifyLanguageDidChange");
}

- (id)_enabledLanguagesByPreference
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.PencilKit"));
  objc_msgSend(v2, "objectForKey:", CFSTR("CurrentScribbleLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  +[PKTextInputLanguageSelectionController _preferencesLanguagesForTesting](PKTextInputLanguageSelectionController, "_preferencesLanguagesForTesting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[PKTextInputLanguageSelectionController _preferencesLanguagesForTesting](PKTextInputLanguageSelectionController, "_preferencesLanguagesForTesting");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v9 = v7;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v9 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
    v9 = v7;
  }
LABEL_13:

  objc_msgSend((id)objc_opt_class(), "filteredEnabledLocaleIdentifiers", v19);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "additionalTextInputLocales");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  v17 = v13;
  if (!v16)
  {
    objc_msgSend((id)objc_opt_class(), "_sortedStringsArray:withArray:", v13, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (void)_switchToLanguageIfSupported:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedAndEnabledLocaleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend((id)objc_opt_class(), "_filterEnglishWithLanguages:outRemapTarget:", v5, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
  {
    v8 = v4;
LABEL_8:
    -[PKTextInputLanguageSelectionController currentLanguageIdentifiers](self, "currentLanguageIdentifiers");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject firstObject](v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", v8);

    if ((v12 & 1) == 0)
    {
      v13 = -[NSObject mutableCopy](v10, "mutableCopy");
      objc_msgSend(v13, "removeObject:", v8);
      objc_msgSend(v13, "insertObject:atIndex:", v8, 0);
      objc_msgSend((id)objc_opt_class(), "_sortedStringsArray:withArray:", v5, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputLanguageSelectionController _updateWithLanguageIdentifiers:](self, "_updateWithLanguageIdentifiers:", v14);
      -[PKTextInputLanguageSelectionController notifyLanguageDidChange](self, "notifyLanguageDidChange");
      v15 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "LanguageController: Saving languages in preferences: %@", buf, 0xCu);

      }
      +[PKSettingsDaemon setCurrentScribbleLanguageIdentifiers:](PKSettingsDaemon, "setCurrentScribbleLanguageIdentifiers:", v14);

    }
    goto LABEL_15;
  }
  if (v7 && objc_msgSend(v5, "containsObject:", v4))
  {
    v8 = v7;

    v9 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "LanguageController: Switching to remapped language: %@", buf, 0xCu);
    }

    goto LABEL_8;
  }
  v10 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "LanguageController: Rejected switching to unsupported language: %@", buf, 0xCu);
  }
  v8 = v4;
LABEL_15:

}

- (void)_updateWithLanguageIdentifiers:(id)a3
{
  -[PKTextInputLanguageSelectionController set_cachedLanguageIdentifiers:](self, "set_cachedLanguageIdentifiers:", a3);
  if (self->_cachedLanguageMenu)
    -[PKTextInputLanguageSelectionController _updateSelectedLanguageInCachedMenu](self, "_updateSelectedLanguageInCachedMenu");
}

- (NSArray)currentLanguageIdentifiers
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PKTextInputLanguageSelectionController _cachedLanguageIdentifiers](self, "_cachedLanguageIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PKTextInputLanguageSelectionController _enabledLanguagesByPreference](self, "_enabledLanguagesByPreference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "LanguageController: Loading preferences. Languages: %@", (uint8_t *)&v8, 0xCu);

    }
    -[PKTextInputLanguageSelectionController _updateWithLanguageIdentifiers:](self, "_updateWithLanguageIdentifiers:", v4);

  }
  -[PKTextInputLanguageSelectionController _cachedLanguageIdentifiers](self, "_cachedLanguageIdentifiers");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldIdentifyLanguages
{
  void *v2;
  BOOL v3;

  -[PKTextInputLanguageSelectionController currentLanguageIdentifiers](self, "currentLanguageIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (UIImage)languageIdentificationIcon
{
  void *v3;
  void *v4;
  void *v5;

  -[PKTextInputLanguageSelectionController currentLanguageIdentifiers](self, "currentLanguageIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKTextInputLanguageSelectionController _iconForLanguageIdentifier:](self, "_iconForLanguageIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (UIImage *)v5;
}

- (id)_iconForLanguageIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DC3968];
  v4 = a3;
  objc_msgSend(v3, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputModeWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indicatorTextIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateLanguageMenuIfNecessary
{
  PKTextInputLanguageSelectionController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  PKTextInputLanguageSelectionController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UIMenu *cachedLanguageMenu;
  uint64_t v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  _QWORD v31[6];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!self->_cachedLanguageMenu)
  {
    v2 = self;
    objc_msgSend((id)objc_opt_class(), "filteredEnabledLocaleIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v3;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v30)
    {
      v5 = *(_QWORD *)v33;
      v27 = *MEMORY[0x1E0DC45E8];
      v28 = *(_QWORD *)v33;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v33 != v5)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v6);
          objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController", v27);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "inputModeWithIdentifier:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "indicatorIcon");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "extendedDisplayName");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            objc_msgSend(v9, "languageWithRegion");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              v14 = objc_alloc(MEMORY[0x1E0CB3498]);
              objc_msgSend(v9, "extendedDisplayName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v27;
              objc_msgSend(v9, "languageWithRegion");
              v16 = v4;
              v17 = v2;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v18;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, v19);
              objc_msgSend(v10, "setAccessibilityAttributedLabel:", v20);

              v2 = v17;
              v4 = v16;
              v5 = v28;

            }
          }
          v21 = (void *)MEMORY[0x1E0DC3428];
          objc_msgSend(v9, "extendedDisplayName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __72__PKTextInputLanguageSelectionController__updateLanguageMenuIfNecessary__block_invoke;
          v31[3] = &unk_1E7778D68;
          v31[4] = v7;
          v31[5] = v2;
          objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v22, v10, v7, v31);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "languageWithRegion");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setAccessibilityLanguage:", v24);

          objc_msgSend(v4, "addObject:", v23);
          ++v6;
        }
        while (v30 != v6);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v30);
    }

    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E777DEE8, 0, 0, 1, v4);
    v25 = objc_claimAutoreleasedReturnValue();
    cachedLanguageMenu = v2->_cachedLanguageMenu;
    v2->_cachedLanguageMenu = (UIMenu *)v25;

  }
}

uint64_t __72__PKTextInputLanguageSelectionController__updateLanguageMenuIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "LanguageController: Switcher menu selected %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_switchToLanguageIfSupported:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_notifyLanguageSelectionDidChange");
}

- (void)_notifyLanguageSelectionDidChange
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSHashTable copy](self->_languageSelectionControllerObservers, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "textInputLanguageSelectionControllerDidChangeLanguage:", self, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updateSelectedLanguageInCachedMenu
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  UIMenu *v15;
  UIMenu *cachedLanguageMenu;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_cachedLanguageMenu)
  {
    -[PKTextInputLanguageSelectionController currentLanguageIdentifiers](self, "currentLanguageIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[UIMenu children](self->_cachedLanguageMenu, "children", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          objc_msgSend(v10, "setState:", v12);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    v13 = (void *)MEMORY[0x1E0DC39D0];
    -[UIMenu children](self->_cachedLanguageMenu, "children");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "menuWithTitle:image:identifier:options:children:", &stru_1E777DEE8, 0, 0, 1, v14);
    v15 = (UIMenu *)objc_claimAutoreleasedReturnValue();
    cachedLanguageMenu = self->_cachedLanguageMenu;
    self->_cachedLanguageMenu = v15;

  }
}

- (id)registerObserver:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *observers;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  +[PKTextInputLanguageSelectionToken tokenWithStore:](PKTextInputLanguageSelectionToken, "tokenWithStore:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  v7 = (void *)objc_msgSend(v4, "copy");
  -[NSMutableDictionary setObject:forKey:](observers, "setObject:forKey:", v7, v5);

  if (-[PKTextInputLanguageSelectionController shouldIdentifyLanguages](self, "shouldIdentifyLanguages"))
  {
    -[PKTextInputLanguageSelectionController languageIdentificationIcon](self, "languageIdentificationIcon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputLanguageSelectionController languageSelectionMenu](self, "languageSelectionMenu");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void *))v4 + 2))(v4, v8, v9);

  }
  return v5;
}

- (void)removeObserver:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_observers, "removeObjectForKey:", a3);
}

- (void)notifyLanguageDidChange
{
  void *v3;
  void *v4;
  NSMutableDictionary *observers;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if (-[NSMutableDictionary count](self->_observers, "count"))
  {
    if (-[PKTextInputLanguageSelectionController shouldIdentifyLanguages](self, "shouldIdentifyLanguages"))
    {
      -[PKTextInputLanguageSelectionController languageIdentificationIcon](self, "languageIdentificationIcon");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    -[PKTextInputLanguageSelectionController languageSelectionMenu](self, "languageSelectionMenu");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    observers = self->_observers;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__PKTextInputLanguageSelectionController_notifyLanguageDidChange__block_invoke;
    v8[3] = &unk_1E7778D90;
    v9 = v3;
    v10 = v4;
    v6 = v4;
    v7 = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](observers, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

uint64_t __65__PKTextInputLanguageSelectionController_notifyLanguageDidChange__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a3 + 16))(a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (UIMenu)languageSelectionMenu
{
  UIMenu *v3;

  if (-[PKTextInputLanguageSelectionController shouldIdentifyLanguages](self, "shouldIdentifyLanguages"))
  {
    -[PKTextInputLanguageSelectionController _updateLanguageMenuIfNecessary](self, "_updateLanguageMenuIfNecessary");
    -[PKTextInputLanguageSelectionController _updateSelectedLanguageInCachedMenu](self, "_updateSelectedLanguageInCachedMenu");
    v3 = self->_cachedLanguageMenu;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)ensureKeyboardLanguageConsistencyIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0DC3938], "hasInputOrAssistantViewsOnScreen"))
  {
    -[PKTextInputLanguageSelectionController _currentKeyboardIdentifier](self, "_currentKeyboardIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputLanguageSelectionController currentLanguageIdentifiers](self, "currentLanguageIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v6 = v5;
      v7 = v3;
      v8 = v7;
      if (v6 != v7)
      {
        if (v6)
        {
          v9 = objc_msgSend(v6, "isEqualToString:", v7);

          if ((v9 & 1) != 0)
            goto LABEL_12;
        }
        else
        {

        }
        v10 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 138412290;
          v12 = v8;
          _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "LanguageController: Propagating keyboard language to Scribble: %@", (uint8_t *)&v11, 0xCu);
        }

        -[PKTextInputLanguageSelectionController _switchToLanguageIfSupported:](self, "_switchToLanguageIfSupported:", v8);
        goto LABEL_12;
      }

    }
LABEL_12:

  }
}

- (id)_currentKeyboardIdentifier
{
  void *v2;
  void *v3;
  id v4;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  objc_msgSend((id)objc_opt_class(), "_getNormalizedLanguageIdentifier:dedupLanguageKey:forInputMode:", &v6, 0, v3);
  v4 = v6;

  return v4;
}

+ (id)activeInputModes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeInputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_inputModesForTesting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "_inputModesForTesting");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  objc_msgSend(v3, "additionalTextInputLocales");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaletteKeyboardUtilities textInputResponderForEditing](PKPaletteKeyboardUtilities, "textInputResponderForEditing");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textInputModeForResponder:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v9, "addObject:", v11);
    }
    else
    {
      v26 = v10;
      objc_msgSend(v3, "additionalTextInputLocales");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localeIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localeIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v16;
      v25 = (void *)v14;
      objc_msgSend(MEMORY[0x1E0DBDBA8], "_inputModesForLocale:language:modeFetcher:", v16, v14, &__block_literal_global_21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(MEMORY[0x1E0DC3960], "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v22);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v19);
      }

      v10 = v26;
    }
    objc_msgSend(v9, "addObjectsFromArray:", v4);

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

uint64_t __58__PKTextInputLanguageSelectionController_activeInputModes__block_invoke()
{
  return TIGetDefaultInputModesForLanguage();
}

+ (void)_enumerateSupportedAndEnabledLocaleIdentifiersWithBlock:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void (**v16)(id, id, _BYTE *);
  unsigned __int8 v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = (void (**)(id, id, _BYTE *))a3;
  objc_msgSend(a1, "activeInputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v18 = 0;
        v19 = 0;
        objc_msgSend(a1, "_getNormalizedLanguageIdentifier:dedupLanguageKey:forInputMode:", &v19, &v18, v11);
        v12 = v19;
        v13 = v18;
        if (v12 && (objc_msgSend(v5, "containsObject:", v13) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0;
          if (objc_msgSend(MEMORY[0x1E0D16828], "isLocaleSupported:", v14))
          {
            objc_msgSend(v5, "addObject:", v13);
            v16[2](v16, v12, &v17);
          }
          v15 = v17;

          if (v15)
          {

            goto LABEL_15;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

}

- (NSArray)currentLanguageIdentifiersForEmojiAlternatives
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v7[16];

  -[PKTextInputLanguageSelectionController _cachedLanguageIdentifiersForEmojiAlternatives](self, "_cachedLanguageIdentifiersForEmojiAlternatives");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "LanguageController: Loading language identifiers for emoji alternatives.", v7, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "_currentLanguageIdentifiersForEmojiAlternatives");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputLanguageSelectionController set_cachedLanguageIdentifiersForEmojiAlternatives:](self, "set_cachedLanguageIdentifiersForEmojiAlternatives:", v5);

  }
  -[PKTextInputLanguageSelectionController _cachedLanguageIdentifiersForEmojiAlternatives](self, "_cachedLanguageIdentifiersForEmojiAlternatives");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)_currentLanguageIdentifiersForEmojiAlternatives
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "activeInputModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v20 = 0;
        v21 = 0;
        objc_msgSend(a1, "_getNormalizedLanguageIdentifier:dedupLanguageKey:forInputMode:mappingYueToZh:", &v21, &v20, v14, 0);
        v15 = v21;
        v16 = v20;
        if (v15 && (objc_msgSend(v8, "containsObject:", v16) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(MEMORY[0x1E0D16828], "isLocaleSupported:", v17))
            objc_msgSend(v8, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_filterEnglishWithLanguages:(id)a3 outRemapTarget:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t, _BYTE *);
  void *v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  id v38;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_preferredLanguagesForTesting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "_preferredLanguagesForTesting");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(v7, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(a1, "_getNormalizedLanguageIdentifier:dedupLanguageKey:forInputModeIdentifier:", &v38, 0, v10);
  v11 = v38;
  v12 = v6;
  MEMORY[0x1C3B7F3A4](v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("zh"));

  v15 = v12;
  if (v14)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__5;
    v32 = __Block_byref_object_dispose__5;
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __85__PKTextInputLanguageSelectionController__filterEnglishWithLanguages_outRemapTarget___block_invoke;
    v24 = &unk_1E7778DD8;
    v26 = &v34;
    v27 = &v28;
    v17 = v16;
    v25 = v17;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v21);
    v15 = v12;
    if (*((_BYTE *)v35 + 24))
    {
      v18 = (void *)objc_msgSend(v12, "mutableCopy", v21, v22, v23, v24);
      objc_msgSend(v18, "removeObjectsAtIndexes:", v17);
      v15 = (void *)objc_msgSend(v18, "copy");

      if (a4)
      {
        objc_msgSend(CFSTR("zh_"), "stringByAppendingString:", v29[5]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_getNormalizedLanguageIdentifier:dedupLanguageKey:forInputModeIdentifier:", a4, 0, v19);

      }
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);
  }

  return v15;
}

void __85__PKTextInputLanguageSelectionController__filterEnglishWithLanguages_outRemapTarget___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  MEMORY[0x1C3B7F3A4]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("zh")))
  {
    MEMORY[0x1C3B7F3B0](v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v9 + 24)
      && (v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isEqualToString:", v8),
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8),
          (v10 & 1) == 0))
    {
      *(_BYTE *)(v9 + 24) = 0;
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = 0;

      *a4 = 1;
    }
    else
    {
      *(_BYTE *)(v9 + 24) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
    }

  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("en")))
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }

}

+ (id)filteredEnabledLocaleIdentifiers
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PKTextInputLanguageSelectionController_filteredEnabledLocaleIdentifiers__block_invoke;
  v7[3] = &unk_1E7778E00;
  v8 = v3;
  v4 = v3;
  objc_msgSend(a1, "_enumerateSupportedAndEnabledLocaleIdentifiersWithBlock:", v7);
  objc_msgSend(a1, "_filterEnglishWithLanguages:outRemapTarget:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __74__PKTextInputLanguageSelectionController_filteredEnabledLocaleIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)supportedAndEnabledLocaleIdentifiers
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__PKTextInputLanguageSelectionController_supportedAndEnabledLocaleIdentifiers__block_invoke;
  v6[3] = &unk_1E7778E00;
  v4 = v3;
  v7 = v4;
  objc_msgSend(a1, "_enumerateSupportedAndEnabledLocaleIdentifiersWithBlock:", v6);

  return v4;
}

uint64_t __78__PKTextInputLanguageSelectionController_supportedAndEnabledLocaleIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (BOOL)hasSomeSupportedAndEnabledLocale
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__PKTextInputLanguageSelectionController_hasSomeSupportedAndEnabledLocale__block_invoke;
  v4[3] = &unk_1E7778E28;
  v4[4] = &v5;
  objc_msgSend(a1, "_enumerateSupportedAndEnabledLocaleIdentifiersWithBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __74__PKTextInputLanguageSelectionController_hasSomeSupportedAndEnabledLocale__block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

+ (id)_preferredRecognitionLocaleIdentifierFromIdentifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
      MEMORY[0x1C3B7F3A4](v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("zh"), (_QWORD)v12) & 1) != 0)
        break;

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v8;

    if (v10)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(v3, "firstObject", (_QWORD)v12);
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v10;
}

+ (void)_getNormalizedLanguageIdentifier:(id *)a3 dedupLanguageKey:(id *)a4 forInputMode:(id)a5
{
  objc_msgSend(a1, "_getNormalizedLanguageIdentifier:dedupLanguageKey:forInputMode:mappingYueToZh:", a3, a4, a5, 1);
}

+ (void)_getNormalizedLanguageIdentifier:(id *)a3 dedupLanguageKey:(id *)a4 forInputMode:(id)a5 mappingYueToZh:(BOOL)a6
{
  _BOOL8 v6;
  id v10;

  v6 = a6;
  objc_msgSend(a5, "languageWithRegion");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_getNormalizedLanguageIdentifier:dedupLanguageKey:forInputModeIdentifier:mappingYueToZh:", a3, a4, v10, v6);

}

+ (void)_getNormalizedLanguageIdentifier:(id *)a3 dedupLanguageKey:(id *)a4 forInputModeIdentifier:(id)a5
{
  objc_msgSend(a1, "_getNormalizedLanguageIdentifier:dedupLanguageKey:forInputModeIdentifier:mappingYueToZh:", a3, a4, a5, 1);
}

+ (void)_getNormalizedLanguageIdentifier:(id *)a3 dedupLanguageKey:(id *)a4 forInputModeIdentifier:(id)a5 mappingYueToZh:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;

  v6 = a6;
  v9 = a5;
  MEMORY[0x1C3B7F3A4]();
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1C3B7F3B0](v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("yue")))
  {

    v10 = CFSTR("zh");
  }
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v10, v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v10;
  }
  v13 = v12;
  v15 = v10;
  if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("zh")) & 1) != 0
    || (v14 = v15, !v6)
    && (v14 = v15, -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("yue"))))
  {
    v14 = v13;

  }
  if (a3)
    *a3 = objc_retainAutorelease(v13);
  if (a4)
    *a4 = objc_retainAutorelease(v14);

}

+ (id)_sortedStringsArray:(id)a3 withArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__PKTextInputLanguageSelectionController__sortedStringsArray_withArray___block_invoke;
  v9[3] = &unk_1E7778E50;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "sortedArrayWithOptions:usingComparator:", 16, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __72__PKTextInputLanguageSelectionController__sortedStringsArray_withArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "indexOfObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v6);

  if (v7 == v8)
    return 0;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v7 > v8)
    return 1;
  v12 = v8 == 0x7FFFFFFFFFFFFFFFLL || v7 < v8;
  return v12 << 63 >> 63;
}

+ (NSArray)_inputModesForTesting
{
  return (NSArray *)(id)__inputModesForTesting;
}

+ (void)set_inputModesForTesting:(id)a3
{
  id v4;
  id v5;

  objc_storeStrong((id *)&__inputModesForTesting, a3);
  v4 = a3;
  +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "set_cachedLanguageIdentifiers:", 0);
}

+ (NSArray)_preferencesLanguagesForTesting
{
  return (NSArray *)(id)__preferencesLanguagesForTesting;
}

+ (void)set_preferencesLanguagesForTesting:(id)a3
{
  id v4;
  id v5;

  objc_storeStrong((id *)&__preferencesLanguagesForTesting, a3);
  v4 = a3;
  +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "set_cachedLanguageIdentifiers:", 0);
}

+ (NSArray)_preferredLanguagesForTesting
{
  return (NSArray *)(id)__preferredLanguagesForTesting;
}

+ (void)set_preferredLanguagesForTesting:(id)a3
{
  id v4;
  id v5;

  objc_storeStrong((id *)&__preferredLanguagesForTesting, a3);
  v4 = a3;
  +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "set_cachedLanguageIdentifiers:", 0);
}

+ (void)_performOperations:(id)a3 withActiveInputModeIdentifiers:(id)a4 preferencesLanguages:(id)a5 preferredLanguages:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(MEMORY[0x1E0DC3960], "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  objc_msgSend(a1, "_performOperations:withActiveInputModes:preferencesLanguages:preferredLanguages:", v9, v13, v11, v12);
}

+ (void)_performOperations:(id)a3 withActiveInputModes:(id)a4 preferencesLanguages:(id)a5 preferredLanguages:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);

  v10 = a6;
  v11 = a5;
  v12 = (void (**)(_QWORD))a3;
  objc_msgSend(a1, "set_inputModesForTesting:", a4);
  objc_msgSend(a1, "set_preferencesLanguagesForTesting:", v11);

  objc_msgSend(a1, "set_preferredLanguagesForTesting:", v10);
  v12[2](v12);

  objc_msgSend(a1, "set_inputModesForTesting:", 0);
  objc_msgSend(a1, "set_preferencesLanguagesForTesting:", 0);
  objc_msgSend(a1, "set_preferredLanguagesForTesting:", 0);
}

- (NSArray)_cachedLanguageIdentifiers
{
  return self->__cachedLanguageIdentifiers;
}

- (void)set_cachedLanguageIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)_cachedLanguageIdentifiersForEmojiAlternatives
{
  return self->__cachedLanguageIdentifiersForEmojiAlternatives;
}

- (void)set_cachedLanguageIdentifiersForEmojiAlternatives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedLanguageIdentifiersForEmojiAlternatives, 0);
  objc_storeStrong((id *)&self->__cachedLanguageIdentifiers, 0);
  objc_storeStrong((id *)&self->_languageSelectionControllerObservers, 0);
  objc_storeStrong((id *)&self->_iconDisplayTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedLanguageMenu, 0);
}

@end
