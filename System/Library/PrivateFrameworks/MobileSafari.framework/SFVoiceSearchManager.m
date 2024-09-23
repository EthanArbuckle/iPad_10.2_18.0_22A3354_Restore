@implementation SFVoiceSearchManager

- (int64_t)availability
{
  return self->_availability;
}

+ (SFVoiceSearchManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_55);
  return (SFVoiceSearchManager *)(id)sharedManager_manager;
}

- (BOOL)liveCompletionList
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("LiveCompletionList"));

  return v3;
}

void __37__SFVoiceSearchManager_sharedManager__block_invoke()
{
  SFVoiceSearchManager *v0;
  void *v1;

  v0 = objc_alloc_init(SFVoiceSearchManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (void)_updateDictationAvailability
{
  int64_t v3;
  id v4;

  v3 = -[SFVoiceSearchManager _voiceSearchAvailability](self, "_voiceSearchAvailability");
  if (self->_availability != v3)
  {
    self->_availability = v3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("SFVoiceSearchAvailabilityDidChangeNotification"), self);

  }
}

- (SFVoiceSearchManager)init
{
  SFVoiceSearchManager *v2;
  SFVoiceSearchManager *v3;
  SFVoiceSearchManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFVoiceSearchManager;
  v2 = -[SFVoiceSearchManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_availability = -[SFVoiceSearchManager _voiceSearchAvailability](v2, "_voiceSearchAvailability");
    v4 = v3;
  }

  return v3;
}

- (int64_t)_voiceSearchAvailability
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  Class v9;
  void *v10;
  int64_t v11;
  _Unwind_Exception *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "dictationIsEnabled") & 1) == 0 && (objc_msgSend(v3, "suppressDictationOptIn") & 1) != 0)
    goto LABEL_14;
  objc_msgSend(v2, "enabledDictationLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {

LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v5 = getAFDictationRestrictedSymbolLoc_ptr;
  v17 = getAFDictationRestrictedSymbolLoc_ptr;
  if (!getAFDictationRestrictedSymbolLoc_ptr)
  {
    v6 = (void *)AssistantServicesLibrary();
    v5 = dlsym(v6, "AFDictationRestricted");
    v15[3] = (uint64_t)v5;
    getAFDictationRestrictedSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v14, 8);
  if (!v5)
  {
    v13 = (_Unwind_Exception *)-[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:].cold.1();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v13);
  }
  v8 = ((uint64_t (*)(uint64_t))v5)(v7);

  if ((v8 & 1) != 0)
    goto LABEL_14;
  v9 = NSClassFromString(CFSTR("UIDictationController"));
  if (v9)
  {
    -[objc_class sharedInstance](v9, "sharedInstance", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "dictationDisabledDueToTelephonyActivity"))
      v11 = 2;
    else
      v11 = 1;

  }
  else
  {
    v11 = 1;
  }
LABEL_15:

  return v11;
}

- (id)_kfed
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("VoiceSearchKfed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)queryItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("qtype"), CFSTR("voice_search"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[SFVoiceSearchManager _kfed](self, "_kfed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("kfed-service"), v5);
    objc_msgSend(v3, "addObject:", v6);

  }
  return (NSArray *)v3;
}

- (BOOL)presentDictationDiscoveryAlertIfNeeded
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "dictationIsEnabled") & 1) != 0 || (objc_msgSend(v2, "suppressDictationOptIn") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    if (dictationControllerClass_onceToken != -1)
      dispatch_once(&dictationControllerClass_onceToken, &__block_literal_global_65);
    objc_msgSend(objc_retainAutorelease((id)dictationControllerClass_cachedClass), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();
    if ((v3 & 1) != 0)
      objc_msgSend(v4, "presentAlertOfType:withCompletion:", 1, 0);

  }
  return v3 & 1;
}

@end
