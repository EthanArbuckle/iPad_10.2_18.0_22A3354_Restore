@implementation AXSettings

- (id)speechVoiceIdentifierForLanguage:(id)a3 sourceKey:(id)a4 exists:(BOOL *)a5
{
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  dispatch_semaphore_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  dispatch_semaphore_t v20;
  void *v21;
  void *v22;
  dispatch_semaphore_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t *v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CF37F0]))
  {
    v10 = dispatch_semaphore_create(0);
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__12;
    v44 = __Block_byref_object_dispose__12;
    v45 = 0;
    -[AXSettings swiftSettings](self, "swiftSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "voiceover");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke;
    v37[3] = &unk_1E24C87D8;
    v39 = &v40;
    v13 = v10;
    v38 = v13;
    objc_msgSend(v12, "speechVoiceIdentifierForLanguage:completionHandler:", v8, v37);

    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    v14 = (id)v41[5];
    v15 = v38;
LABEL_7:

    _Block_object_dispose(&v40, 8);
    goto LABEL_8;
  }
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CF37D8]))
  {
    v16 = dispatch_semaphore_create(0);
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__12;
    v44 = __Block_byref_object_dispose__12;
    v45 = 0;
    -[AXSettings swiftSettings](self, "swiftSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "spokenContent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke_2;
    v34[3] = &unk_1E24C87D8;
    v36 = &v40;
    v19 = v16;
    v35 = v19;
    objc_msgSend(v18, "speechVoiceIdentifierForLanguage:exists:completionHandler:", v8, a5, v34);

    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    v14 = (id)v41[5];

    _Block_object_dispose(&v40, 8);
  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CF37E0]))
    {
      v20 = dispatch_semaphore_create(0);
      v40 = 0;
      v41 = &v40;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__12;
      v44 = __Block_byref_object_dispose__12;
      v45 = 0;
      -[AXSettings swiftSettings](self, "swiftSettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "assistiveTouch");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke_3;
      v31[3] = &unk_1E24C87D8;
      v33 = &v40;
      v13 = v20;
      v32 = v13;
      objc_msgSend(v22, "speechVoiceIdentifierForLanguage:completionHandler:", v8, v31);

      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      v14 = (id)v41[5];
      v15 = v32;
      goto LABEL_7;
    }
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CF37D0]))
    {
      v40 = 0;
      v41 = &v40;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__12;
      v44 = __Block_byref_object_dispose__12;
      v45 = 0;
      v24 = dispatch_semaphore_create(0);
      -[AXSettings swiftSettings](self, "swiftSettings");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "liveSpeech");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke_4;
      v28[3] = &unk_1E24C87D8;
      v30 = &v40;
      v27 = v24;
      v29 = v27;
      objc_msgSend(v26, "speechVoiceIdentifierForKeyboard:completionHandler:", v8, v28);

      dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
      v14 = (id)v41[5];

      _Block_object_dispose(&v40, 8);
    }
    else
    {
      v14 = 0;
    }
  }
LABEL_8:

  return v14;
}

+ (AXSettings)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_34);
  return (AXSettings *)(id)sharedInstance_settings;
}

- (id)domainNameForPreferenceKey:(id)a3
{
  return -[AXSettings _domainNameForDomain:](self, "_domainNameForDomain:", -[AXSettings _domainForPreferenceKey:](self, "_domainForPreferenceKey:", a3));
}

- (id)valueForPreferenceKey:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXSettings;
  -[AXBaseSettings valueForPreferenceKey:](&v9, sel_valueForPreferenceKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AXSettings _domainForPreferenceKey:](self, "_domainForPreferenceKey:", v4);
  if (v5)
    v7 = 1;
  else
    v7 = v6 == 1;
  if (!v7)
  {
    -[AXSettings _migratePreferenceIfNecessary:](self, "_migratePreferenceIfNecessary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (unint64_t)_domainForPreferenceKey:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend((id)PreferenceKeyToDomainMap, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = v4;
  v11 = v3;
  v5 = v3;
  v6 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();
  v7 = (int)objc_msgSend(v6, "intValue", v9, 3221225472, __38__AXSettings__domainForPreferenceKey___block_invoke, &unk_1E24C5200);

  return v7;
}

- (id)_migratePreferenceIfNecessary:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v4 = (__CFString *)a3;
  v5 = -[AXSettings _domainNameForDomain:](self, "_domainNameForDomain:", 1);
  v6 = (void *)CFPreferencesCopyAppValue(v4, v5);
  if (v6)
  {
    -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, v4);
    CFPreferencesSetAppValue(v4, 0, v5);
  }

  return v6;
}

- (id)allDomainNamesForPreferenceKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AXSettings _domainForPreferenceKey:](self, "_domainForPreferenceKey:", v5);

  -[AXSettings _domainNameForDomain:](self, "_domainNameForDomain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axSafelyAddObject:", v8);

  return v6;
}

- (__CFString)_domainNameForDomain:(unint64_t)a3
{
  __CFString *result;
  __CFString **v4;
  const void *v5;
  void *v6;

  switch(a3)
  {
    case 1uLL:
    case 6uLL:
      v5 = (const void *)AXCPCopySharedResourcesPreferencesDomainForDomain();
      return (__CFString *)CFAutorelease(v5);
    case 2uLL:
      v4 = (__CFString **)MEMORY[0x1E0DDE300];
      goto LABEL_17;
    case 3uLL:
      v4 = (__CFString **)MEMORY[0x1E0DDE330];
      goto LABEL_17;
    case 4uLL:
      v4 = (__CFString **)MEMORY[0x1E0DDE008];
      goto LABEL_17;
    case 5uLL:
      v4 = (__CFString **)MEMORY[0x1E0DDE0E8];
      goto LABEL_17;
    case 7uLL:
      v4 = (__CFString **)MEMORY[0x1E0DDE118];
      goto LABEL_17;
    case 8uLL:
      v4 = (__CFString **)MEMORY[0x1E0DDE250];
      goto LABEL_17;
    case 9uLL:
      v4 = (__CFString **)MEMORY[0x1E0DDE2B8];
      goto LABEL_17;
    case 0xAuLL:
      v4 = (__CFString **)MEMORY[0x1E0DDE298];
      goto LABEL_17;
    case 0xBuLL:
      v4 = (__CFString **)MEMORY[0x1E0DDE180];
      goto LABEL_17;
    case 0xCuLL:
      v4 = (__CFString **)MEMORY[0x1E0DDE280];
      goto LABEL_17;
    case 0xDuLL:
      v4 = (__CFString **)MEMORY[0x1E0DDE2E8];
      goto LABEL_17;
    case 0xEuLL:
      v4 = (__CFString **)MEMORY[0x1E0DDE0C0];
      goto LABEL_17;
    case 0xFuLL:
      v4 = (__CFString **)MEMORY[0x1E0DDDF58];
LABEL_17:
      result = *v4;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _AXAssert();

      result = 0;
      break;
  }
  return result;
}

uint64_t __38__AXSettings__domainForPreferenceKey___block_invoke(uint64_t result)
{
  if (!*(_QWORD *)(result + 32))
    return _AXAssert();
  return result;
}

- (BOOL)speakCorrectionsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("SpeakCorrectionsEnabled"), 0);
}

- (BOOL)shouldPerformValidationsAtRuntime
{
  return AXSettingsReturnBoolValue(CFSTR("shouldPerformValidationsAtRuntime"), 0);
}

- (BOOL)appValidationTestingMode
{
  return AXSettingsReturnBoolValue(CFSTR("AXSAppValidatingTestingPreference"), 0);
}

void __28__AXSettings_sharedInstance__block_invoke()
{
  AXSettings *v0;
  void *v1;

  InitializeMaps();
  v0 = objc_alloc_init(AXSettings);
  v1 = (void *)sharedInstance_settings;
  sharedInstance_settings = (uint64_t)v0;

}

- (AXSettings)init
{
  AXSettings *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *unarchivedVoiceCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXSettings;
  v2 = -[AXBaseSettings init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    unarchivedVoiceCache = v2->_unarchivedVoiceCache;
    v2->_unarchivedVoiceCache = v3;

  }
  -[AXSettings _listenForAccessibilitySupportPassthroughs](v2, "_listenForAccessibilitySupportPassthroughs");
  return v2;
}

- (void)_listenForAccessibilitySupportPassthroughs
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_accessibilitySupportSettingDidChange, (CFStringRef)*MEMORY[0x1E0DDE150], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void __39__AXSettings_preferenceKeyForSelector___block_invoke(uint64_t a1)
{
  id v1;

  if (!*(_QWORD *)(a1 + 32))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    _AXAssert();

  }
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;

  v3 = (void *)SelectorToPreferenceKeyMap;
  NSStringFromSelector(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v5;
  AXPerformBlockAsynchronouslyOnMainThread();

  return v7;
}

- (BOOL)zoomEnabled
{
  return _AXSZoomTouchEnabled() != 0;
}

- (NSDictionary)perAppSettingsStats
{
  uint64_t v2;

  v2 = objc_opt_class();
  return (NSDictionary *)AXSettingsReturnObjectValueWithClass(CFSTR("AXSPerAppSettingsStats"), 0, v2);
}

- (BOOL)laserEnabled
{
  return 1;
}

- (BOOL)didTriggerSOSValueSet
{
  uint64_t v2;
  void *v3;
  BOOL v4;

  v2 = objc_opt_class();
  AXSettingsReturnObjectValueWithClass(CFSTR("AXSDidTriggerSOSToday"), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)backTapEnabled
{
  return _AXSBackTapEnabled() != 0;
}

- (NSSet)assistiveTouchSwitches
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AssistiveTouchSwitchesPreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v3 = (void *)MEMORY[0x1E0CB3710],
        v4 = objc_opt_class(),
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class()),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "secureUnarchiveData:withExpectedClass:otherAllowedClasses:", v2, v4, v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v6;
}

- (id)keysToIgnoreDuringBuddyTransfer
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("AllCachedAvailableResourcesKey"), CFSTR("TTSSynthesisProviderCachedComponentsKey"), CFSTR("AXSVoiceOverActivitiesPreference"), CFSTR("VoiceOverCustomCammndProfile"), CFSTR("GizmoAutoSpeakComplicationsPreference"), CFSTR("AssistiveTouchRecentGestures"), CFSTR("AssistiveTouchSavedGestures"), 0);
}

- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v10 = (void *)SelectorToPreferenceKeyMap;
  NSStringFromSelector(a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v15.receiver = self;
    v15.super_class = (Class)AXSettings;
    -[AXBaseSettings registerUpdateBlock:forRetrieveSelector:withListener:](&v15, sel_registerUpdateBlock_forRetrieveSelector_withListener_, v8, a4, v9);
  }
  else
  {
    -[AXSettings swiftSettings](self, "swiftSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "observeWithSelector:listener:block:", a4, v9, v8);

    if ((v14 & 1) == 0)
    {
      AXPerformBlockAsynchronouslyOnMainThread();

    }
  }

}

void __67__AXSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke(uint64_t a1)
{
  id v1;

  if (!*(_QWORD *)(a1 + 32))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    _AXAssert();

  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  -[AXSettings swiftSettings](self, "swiftSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forwardingTargetForSelector:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)targetForKVOKey:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;

  v4 = (NSString *)a3;
  -[AXSettings swiftSettings](self, "swiftSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forwardingTargetForSelector:", NSSelectorFromString(v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB3380], CFSTR("Undefined forwarding target for axsettings key %@"), v4);

  return v6;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXSettings targetForKVOKey:](self, "targetForKVOKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AXSettings targetForKVOKey:](self, "targetForKVOKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (_TtC22AccessibilityUtilities13AXPreferences)swiftSettings
{
  _TtC22AccessibilityUtilities13AXPreferences *swiftSettings;
  _TtC22AccessibilityUtilities13AXPreferences *v4;
  _TtC22AccessibilityUtilities13AXPreferences *v5;

  swiftSettings = self->_swiftSettings;
  if (!swiftSettings)
  {
    v4 = objc_alloc_init(_TtC22AccessibilityUtilities13AXPreferences);
    v5 = self->_swiftSettings;
    self->_swiftSettings = v4;

    swiftSettings = self->_swiftSettings;
  }
  return swiftSettings;
}

- (void)nukeAll
{
  NSObject *v3;
  uint8_t v4[16];
  _OWORD v5[6];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5[2] = xmmword_18C737088;
  v5[3] = unk_18C737098;
  v5[4] = xmmword_18C7370A8;
  v5[5] = unk_18C7370B8;
  v5[0] = xmmword_18C737068;
  v5[1] = unk_18C737078;
  v6 = 12;
  AXLogSettings();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_INFO, "nuking all AX settings!", v4, 2u);
  }

  -[AXSettings nukePrefsForDomains:numDomains:](self, "nukePrefsForDomains:numDomains:", v5, 13);
}

- (void)nukePrefsForDomains:(unint64_t *)a3 numDomains:(unint64_t)a4
{
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  CFIndex Count;
  CFIndex v15;
  CFIndex i;
  const void *ValueAtIndex;

  if (a4)
  {
    v7 = 0;
    v8 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v9 = (const __CFString *)*MEMORY[0x1E0C9B250];
    v10 = (const __CFString *)*MEMORY[0x1E0C9B248];
    do
    {
      v11 = -[AXSettings _domainNameForDomain:](self, "_domainNameForDomain:", a3[v7]);
      v12 = CFPreferencesCopyKeyList(v11, v8, v9);
      if (v12)
      {
        v13 = v12;
        CFPreferencesSetMultiple(0, v12, v11, v8, v10);
        Count = CFArrayGetCount(v13);
        if (Count >= 1)
        {
          v15 = Count;
          for (i = 0; i != v15; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v13, i);
            if (ValueAtIndex)
              -[AXBaseSettings postNotificationForPreferenceKey:](self, "postNotificationForPreferenceKey:", ValueAtIndex);
          }
        }
        CFRelease(v13);
      }
      ++v7;
    }
    while (v7 != a4);
  }
}

- (void)_handleVoiceUnarchivedCache:(id)a3
{
  NSMutableDictionary *v4;
  id v5;

  v5 = a3;
  v4 = self->_unarchivedVoiceCache;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectForKey:](self->_unarchivedVoiceCache, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (unint64_t)laserZoomPanningStyle
{
  return AXSettingsReturnIntegerValue(CFSTR("LaserZoomPanningStyle"), *MEMORY[0x1E0CF3EB8]);
}

- (void)setLaserZoomPanningStyle:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("LaserZoomPanningStyle"));

}

- (void)setAssistiveTouchAlwaysShowMenuEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchAlwaysShowMenu"));

}

- (BOOL)assistiveTouchAlwaysShowMenuEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchAlwaysShowMenu"), 1);
}

- (void)setSupportsAdvancedDisplayFilters:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("kAXSupportsAdvancedDisplayFiltersPreference"));

}

- (BOOL)supportsAdvancedDisplayFilters
{
  return AXSettingsReturnBoolValue(CFSTR("kAXSupportsAdvancedDisplayFiltersPreference"), 0);
}

- (void)setAssistiveTouchOpenMenuSwaggleEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchOpenMenuSwaggle"));

}

- (BOOL)assistiveTouchOpenMenuSwaggleEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchOpenMenuSwaggle"), 0);
}

- (void)setAssistiveTouchMouseBehavesLikeFinger:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseBehavesLikeFinger"));

}

- (BOOL)assistiveTouchMouseBehavesLikeFinger
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseBehavesLikeFinger"), 1);
}

- (void)setAssistiveTouchMouseKeysEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseKeys"));

}

- (BOOL)assistiveTouchMouseKeysEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseKeys"), 0);
}

- (void)setAssistiveTouchMouseKeysOptionToggleEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseKeysOptionToggle"));

}

- (BOOL)assistiveTouchMouseKeysOptionToggleEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseKeysOptionToggle"), 0);
}

- (void)setAssistiveTouchMouseKeysUseMainKeyboardKeys:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseKeysUseMainKeyboardKeys"));

}

- (BOOL)assistiveTouchMouseKeysUseMainKeyboardKeys
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseKeysUseMainKeyboardKeys"), 1);
}

- (void)setAssistiveTouchMouseKeysDelay:(int64_t)a3
{
  int64_t v4;
  id v5;

  if ((a3 & (unint64_t)~(a3 >> 63)) >= 4)
    v4 = 4;
  else
    v4 = a3 & ~(a3 >> 63);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("AssistiveTouchMouseKeysDelay"));

}

- (BOOL)assistiveTouchMouseAlwaysShowSoftwareKeyboardEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseAlwaysShowSoftwareKeyboard"), 0);
}

- (void)setAssistiveTouchMouseAlwaysShowSoftwareKeyboardEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseAlwaysShowSoftwareKeyboard"));

}

- (BOOL)assistiveTouchMouseAllowAppleBluetoothDevicesPairing
{
  int v2;

  v2 = AXIsInternalInstall();
  if (v2)
    LOBYTE(v2) = AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseAllowAppleBluetoothDevicesPairing"), 0);
  return v2;
}

- (void)setAssistiveTouchMouseAllowAppleBluetoothDevicesPairing:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseAllowAppleBluetoothDevicesPairing"));

}

- (int64_t)assistiveTouchMouseKeysDelay
{
  return AXSettingsReturnIntegerValue(CFSTR("AssistiveTouchMouseKeysDelay"), 2);
}

- (void)setAssistiveTouchMouseKeysMaxSpeed:(int64_t)a3
{
  int64_t v4;
  id v5;

  if ((a3 & (unint64_t)~(a3 >> 63)) >= 0xA)
    v4 = 10;
  else
    v4 = a3 & ~(a3 >> 63);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("AssistiveTouchMouseKeysMaxSpeed"));

}

- (int64_t)assistiveTouchMouseKeysMaxSpeed
{
  return AXSettingsReturnIntegerValue(CFSTR("AssistiveTouchMouseKeysMaxSpeed"), 5);
}

- (void)setAssistiveTouchSpeed:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchSpeed"));

}

- (double)assistiveTouchSpeed
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchSpeed"), *MEMORY[0x1E0CF3BD0]);
}

- (void)setAssistiveTouchVirtualTrackpadEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchVirtualTrackpadEnabled"));

}

- (BOOL)assistiveTouchVirtualTrackpadEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchVirtualTrackpadEnabled"), 0);
}

- (void)setAssistiveTouchVirtualTrackpadSpeed:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchVirtualTrackpadSpeed"));

}

- (double)assistiveTouchVirtualTrackpadSpeed
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchVirtualTrackpadSpeed"), 1.0);
}

- (void)setAssistiveTouchVirtualTrackpadScrollSpeed:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchVirtualTrackpadScrollSpeed"));

}

- (double)assistiveTouchVirtualTrackpadScrollSpeed
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchVirtualTrackpadScrollSpeed"), 1.0);
}

- (double)assistiveTouchVirtualTrackpadHoldDuration
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchVirtualTrackpadHoldDuration"), 0.2);
}

- (void)setAssistiveTouchVirtualTrackpadHoldDuration:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchVirtualTrackpadHoldDuration"));

}

- (double)assistiveTouchVirtualTrackpadFadeDelay
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchVirtualTrackpadFadeDelay"), 4.0);
}

- (void)setAssistiveTouchVirtualTrackpadFadeDelay:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchVirtualTrackpadFadeDelay"));

}

- (int64_t)assistiveTouchVirtualTrackpadBorderColor
{
  return AXSettingsReturnIntegerValue(CFSTR("AssistiveTouchVirtualTrackpadBorderColor"), 0);
}

- (void)setAssistiveTouchVirtualTrackpadBorderColor:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchVirtualTrackpadBorderColor"));

}

- (int64_t)assistiveTouchVirtualTrackpadInnerColor
{
  return AXSettingsReturnIntegerValue(CFSTR("AssistiveTouchVirtualTrackpadInnerColor"), 0);
}

- (void)setAssistiveTouchVirtualTrackpadInnerColor:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchVirtualTrackpadInnerColor"));

}

- (double)assistiveTouchVirtualTrackpadBorderOpacity
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchVirtualTrackpadBorderOpacity"), 0.6);
}

- (void)setAssistiveTouchVirtualTrackpadBorderOpacity:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchVirtualTrackpadBorderOpacity"));

}

- (double)assistiveTouchVirtualTrackpadInnerOpacity
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchVirtualTrackpadInnerOpacity"), 0.2);
}

- (void)setAssistiveTouchVirtualTrackpadInnerOpacity:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchVirtualTrackpadInnerOpacity"));

}

- (double)assistiveTouchVirtualTrackpadBorderWidth
{
  int IsPad;
  double v3;

  IsPad = AXDeviceIsPad();
  v3 = 40.0;
  if (!IsPad)
    v3 = 25.0;
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchVirtualTrackpadBorderWidth"), v3);
}

- (void)setAssistiveTouchVirtualTrackpadBorderWidth:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchVirtualTrackpadBorderWidth"));

}

- (void)setAssistiveTouchVirtualTrackpadScrollToggleEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchVirtualTrackpadScrollToggle"));

}

- (BOOL)assistiveTouchVirtualTrackpadScrollToggleEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchVirtualTrackpadScrollToggle"), 1);
}

- (void)setAssistiveTouchVirtualTrackpadFullScreenToggleEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchVirtualTrackpadFullScreenToggle"));

}

- (BOOL)assistiveTouchVirtualTrackpadFullScreenToggleEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchVirtualTrackpadFullScreenToggle"), 0);
}

- (id)_gesturesForPreferenceKeyMigratingIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3710];
    v7 = (void *)MEMORY[0x1E0C99E60];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v9, v5, &v35);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v35;

    if (v11)
    {
      AXLogSettings();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AXSettings _gesturesForPreferenceKeyMigratingIfNecessary:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);

    }
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v5)
      _AXAssert();
LABEL_22:
    v10 = 0;
    goto LABEL_24;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v10 = v5;
    goto LABEL_24;
  }
  objc_msgSend(v5, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v5, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _AXAssert();

  }
  objc_msgSend(v5, "firstObject", v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) == 0)
    goto LABEL_22;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = v5;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v23);
        +[AXNamedReplayableGesture gestureWithLegacyFormatDictionary:](AXNamedReplayableGesture, "gestureWithLegacyFormatDictionary:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v25);
  }

  -[AXSettings _setGestures:forPreferenceKey:](self, "_setGestures:forPreferenceKey:", v10, v4);
LABEL_24:

  return v10;
}

- (void)_setGestures:(id)a3 forPreferenceKey:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v6 = (void *)MEMORY[0x1E0CB36F8];
  v17 = 0;
  v7 = a4;
  objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v8, v7);

  if (v9)
  {
    AXLogSettings();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AXSettings _gesturesForPreferenceKeyMigratingIfNecessary:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

- (void)setAssistiveTouchCustomGestures:(id)a3
{
  -[AXSettings _setGestures:forPreferenceKey:](self, "_setGestures:forPreferenceKey:", a3, CFSTR("AssistiveTouchCustomGestures"));
}

- (NSArray)assistiveTouchCustomGestures
{
  return (NSArray *)-[AXSettings _gesturesForPreferenceKeyMigratingIfNecessary:](self, "_gesturesForPreferenceKeyMigratingIfNecessary:", CFSTR("AssistiveTouchCustomGestures"));
}

- (void)setAssistiveTouchRecentGestures:(id)a3
{
  -[AXSettings _setGestures:forPreferenceKey:](self, "_setGestures:forPreferenceKey:", a3, CFSTR("AssistiveTouchRecentGestures"));
}

- (NSArray)assistiveTouchRecentGestures
{
  return (NSArray *)-[AXSettings _gesturesForPreferenceKeyMigratingIfNecessary:](self, "_gesturesForPreferenceKeyMigratingIfNecessary:", CFSTR("AssistiveTouchRecentGestures"));
}

- (void)setAssistiveTouchSavedGestures:(id)a3
{
  -[AXSettings _setGestures:forPreferenceKey:](self, "_setGestures:forPreferenceKey:", a3, CFSTR("AssistiveTouchSavedGestures"));
}

- (NSArray)assistiveTouchSavedGestures
{
  return (NSArray *)-[AXSettings _gesturesForPreferenceKeyMigratingIfNecessary:](self, "_gesturesForPreferenceKeyMigratingIfNecessary:", CFSTR("AssistiveTouchSavedGestures"));
}

- (void)setAssistiveTouchPreferredPointPicker:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchPreferredPointPickerPreference"));

}

- (int64_t)assistiveTouchPreferredPointPicker
{
  void *v2;
  int64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AssistiveTouchPreferredPointPickerPreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 1;

  return v3;
}

- (BOOL)assistiveTouchScannerCursorHighVisibilityEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchCursorHighVisibilityPreference"), 0);
}

- (void)setAssistiveTouchScannerCursorHighVisibilityEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchCursorHighVisibilityPreference"));

}

- (void)setAssistiveTouchScanningMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchScanningModePreference"));

}

- (int64_t)assistiveTouchScanningMode
{
  void *v2;
  int64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AssistiveTouchScanningModePreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)assistiveTouchAutoScanningEnabled
{
  return -[AXSettings switchControlScanningStyle](self, "switchControlScanningStyle") == 0;
}

- (void)setAssistiveTouchGroupElementsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchScanShouldGroupElements"));

}

- (BOOL)assistiveTouchGroupElementsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchScanShouldGroupElements"), 1);
}

- (void)setAssistiveTouchScannerCompactMenuEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchScanShouldUseCompactMenu"));

}

- (BOOL)assistiveTouchScannerCompactMenuEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchScanShouldUseCompactMenu"), 0);
}

- (BOOL)assistiveTouchScannerMenuLabelsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchScannerMenuLabelsEnabled"), 1);
}

- (void)setAssistiveTouchScannerMenuLabelsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchScannerMenuLabelsEnabled"));

}

- (double)assistiveTouchAxisSweepSpeed
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchAxisSweepSpeed"), *MEMORY[0x1E0CF3AF8] + *MEMORY[0x1E0CF3AE8] * 30.0);
}

- (void)setAssistiveTouchAxisSweepSpeed:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3AF8] >= a3)
    a3 = *MEMORY[0x1E0CF3AF8];
  if (*MEMORY[0x1E0CF3AF8]
     + (double)(unint64_t)(*MEMORY[0x1E0CF3AF0] - *MEMORY[0x1E0CF3B00]) * *MEMORY[0x1E0CF3AE8] < a3)
    a3 = *MEMORY[0x1E0CF3AF8]
       + (double)(unint64_t)(*MEMORY[0x1E0CF3AF0] - *MEMORY[0x1E0CF3B00]) * *MEMORY[0x1E0CF3AE8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchAxisSweepSpeed"));

}

- (void)setAssistiveTouchActionRepeatInterval:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3AE0] >= a3)
    a3 = *MEMORY[0x1E0CF3AE0];
  if (*MEMORY[0x1E0CF3AD8] < a3)
    a3 = *MEMORY[0x1E0CF3AD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchActionRepeatIntervalPreference"));

}

- (double)assistiveTouchActionRepeatInterval
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchActionRepeatIntervalPreference"), 0.5);
}

- (void)setAssistiveTouchActionRepeatEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchActionRepeatEnabledPreference"));

}

- (BOOL)assistiveTouchActionRepeatEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchActionRepeatEnabledPreference"), 0);
}

- (void)setAssistiveTouchDelayAfterInput:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3B08] < a3)
    a3 = *MEMORY[0x1E0CF3B08];
  if (*MEMORY[0x1E0CF3B10] >= a3)
    a3 = *MEMORY[0x1E0CF3B10];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchDelayAfterInputPreference"));

}

- (double)assistiveTouchDelayAfterInput
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchDelayAfterInputPreference"), 0.5);
}

- (void)setAssistiveTouchDelayAfterInputEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchDelayAfterInputEnabledPreference"));

}

- (BOOL)assistiveTouchDelayAfterInputEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchDelayAfterInputEnabledPreference"), 0);
}

- (void)setAssistiveTouchInputHoldDuration:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3B38] < a3)
    a3 = *MEMORY[0x1E0CF3B38];
  if (*MEMORY[0x1E0CF3B40] >= a3)
    a3 = *MEMORY[0x1E0CF3B40];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchInputHoldDurationPreference"));

}

- (double)assistiveTouchInputHoldDuration
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchInputHoldDurationPreference"), *MEMORY[0x1E0CF3B40]);
}

- (void)setAssistiveTouchInputHoldEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchInputHoldEnabledPreference"));

}

- (BOOL)assistiveTouchInputHoldEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchInputHoldEnabledPreference"), 0);
}

- (void)setAssistiveTouchLongPressDuration:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchLongPressDurationPreference"));

}

- (double)assistiveTouchLongPressDuration
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchLongPressDurationPreference"), *MEMORY[0x1E0CF3B48]);
}

- (void)setAssistiveTouchLongPressEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchLongPressDurationEnabledPreference"));

}

- (BOOL)assistiveTouchLongPressEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchLongPressDurationEnabledPreference"), 0);
}

- (void)setAssistiveTouchLongPressPauseScanningEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchLongPressPauseScanningEnabledPreference"));

}

- (BOOL)assistiveTouchLongPressPauseScanningEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchLongPressPauseScanningEnabledPreference"), 1);
}

- (void)setAssistiveTouchInputCoalescingDuration:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3B28] < a3)
    a3 = *MEMORY[0x1E0CF3B28];
  if (*MEMORY[0x1E0CF3B30] >= a3)
    a3 = *MEMORY[0x1E0CF3B30];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchInputCoalescingDurationPreference"));

}

- (double)assistiveTouchInputCoalescingDuration
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchInputCoalescingDurationPreference"), *MEMORY[0x1E0CF3B30]);
}

- (void)setAssistiveTouchInputCoalescingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchInputCoalescingEnabledPreference"));

}

- (BOOL)assistiveTouchInputCoalescingEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchInputCoalescingEnabledPreference"), 0);
}

- (void)setAssistiveTouchStepInterval:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3BE0] >= a3)
    a3 = *MEMORY[0x1E0CF3BE0];
  if (*MEMORY[0x1E0CF3BD8] < a3)
    a3 = *MEMORY[0x1E0CF3BD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchStepInterval"));

}

- (double)assistiveTouchStepInterval
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchStepInterval"), 1.0);
}

- (BOOL)assistiveTouchScanTimeoutEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchScannerScanTimeoutEnabled"), 1);
}

- (void)setAssistiveTouchScanTimeoutEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchScannerScanTimeoutEnabled"));

}

- (double)assistiveTouchScanTimeout
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchScannerScanTimeout"), 15.0);
}

- (void)setAssistiveTouchScanTimeout:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3BC8] > a3)
    a3 = *MEMORY[0x1E0CF3BC8];
  if (a3 >= *MEMORY[0x1E0CF3BC0])
    a3 = *MEMORY[0x1E0CF3BC0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchScannerScanTimeout"));

}

- (void)setAssistiveTouchScanCycles:(int64_t)a3
{
  int64_t v4;
  int64_t v5;
  id v6;

  v4 = *MEMORY[0x1E0CF3B58];
  if (*MEMORY[0x1E0CF3B58] <= a3)
    v4 = a3;
  if (v4 >= *MEMORY[0x1E0CF3B50])
    v5 = *MEMORY[0x1E0CF3B50];
  else
    v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, CFSTR("AssistiveTouchScanCyclesPreference"));

}

- (int64_t)assistiveTouchScanCycles
{
  return AXSettingsReturnIntegerValue(CFSTR("AssistiveTouchScanCyclesPreference"), 4);
}

- (void)setAssistiveTouchScannerSoundEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchScannerSoundEnabled"));

}

- (BOOL)assistiveTouchScannerSoundEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchScannerSoundEnabled"), 0);
}

- (void)setAssistiveTouchScannerSpeechRate:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSAssistiveTouchScannerSpeechRatePreference);

}

- (double)assistiveTouchScannerSpeechRate
{
  return AXSettingsReturnDoubleValue((void *)kAXSAssistiveTouchScannerSpeechRatePreference, 0.5);
}

- (void)setIgnoreTrackpad:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSIgnoreTrackpad"));

}

- (BOOL)ignoreTrackpad
{
  return AXSettingsReturnBoolValue(CFSTR("AXSIgnoreTrackpad"), 0);
}

- (void)setAssistiveTouchSwitches:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchSwitchesPreference"));

}

- (void)setAssistiveTouchCameraPointPickerSwitches:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchCameraPointPickerSwitchesPreference"));

}

- (NSSet)assistiveTouchCameraPointPickerSwitches
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AssistiveTouchCameraPointPickerSwitchesPreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v3 = (void *)MEMORY[0x1E0CB3710],
        v4 = objc_opt_class(),
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class()),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "secureUnarchiveData:withExpectedClass:otherAllowedClasses:", v2, v4, v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v6;
}

- (void)setAssistiveTouchCursorColor:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchCursorColorPreference"));

}

- (int64_t)assistiveTouchCursorColor
{
  return AXSettingsReturnIntegerValue(CFSTR("AssistiveTouchCursorColorPreference"), 3);
}

- (void)setAssistiveTouchMousePointerColor:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMousePointerColorPreference"));

}

- (int64_t)assistiveTouchMousePointerColor
{
  return AXSettingsReturnIntegerValue(CFSTR("AssistiveTouchMousePointerColorPreference"), 1);
}

- (void)setAssistiveTouchMousePointerSizeMultiplier:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3BA8] > a3)
    a3 = *MEMORY[0x1E0CF3BA8];
  if (a3 >= *MEMORY[0x1E0CF3BA0])
    a3 = *MEMORY[0x1E0CF3BA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMousePointerSizeMultiplierPreference"));

}

- (double)assistiveTouchMousePointerSizeMultiplier
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchMousePointerSizeMultiplierPreference"), *MEMORY[0x1E0CF3B98]);
}

- (void)setAssistiveTouchMousePointerTimeoutEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMousePointerTimeoutEnabledPreference"));

}

- (BOOL)assistiveTouchMousePointerTimeoutEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMousePointerTimeoutEnabledPreference"), 1);
}

- (void)setAssistiveTouchMousePointerTimeout:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMousePointerTimeoutPreference"));

}

- (double)assistiveTouchMousePointerTimeout
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchMousePointerTimeoutPreference"), *MEMORY[0x1E0CF3BB0]);
}

- (void)setAssistiveTouchMouseDwellControlEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseDwellControlEnabledPreference"));

}

- (BOOL)assistiveTouchMouseDwellControlEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseDwellControlEnabledPreference"), 0);
}

- (void)_assignActionToUnsetHotCorner:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  -[AXSettings assistiveTouchMouseDwellControlCornerCustomization](self, "assistiveTouchMouseDwellControlCornerCustomization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v7;

  v9 = (void *)*MEMORY[0x1E0CF3510];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CF3510]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_8;
  v9 = (void *)*MEMORY[0x1E0CF3518];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CF3518]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_8;
  v9 = (void *)*MEMORY[0x1E0CF3500];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CF3500]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12
    || (v9 = (void *)*MEMORY[0x1E0CF3508],
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CF3508]),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
LABEL_8:
    v14 = v9;
    if (v14)
    {
      v15 = v14;
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v14);
      -[AXSettings setAssistiveTouchMouseDwellControlCornerCustomization:](self, "setAssistiveTouchMouseDwellControlCornerCustomization:", v8);

    }
  }

}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = a3;
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assistiveTouchEnabled");

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) == 0 && v3)
  {
    objc_msgSend(v7, "setAssistiveTouchEnabled:", 1);

    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAssistiveTouchEnabledByOnDeviceEyeTracking:", 1);

    goto LABEL_7;
  }
  v10 = objc_msgSend(v7, "assistiveTouchEnabledByOnDeviceEyeTracking") & v6;

  if (v10 != 1)
  {
LABEL_7:
    if (!v3)
      goto LABEL_10;
    goto LABEL_8;
  }
  if (!v3)
  {
    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAssistiveTouchEnabled:", 0);

    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAssistiveTouchMouseDwellControlEnabled:", 0);

    goto LABEL_10;
  }
LABEL_8:
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAssistiveTouchMouseDwellControlEnabled:", 1);

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingEnabledPreference"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[AXSettings _assignActionToUnsetHotCorner:](self, "_assignActionToUnsetHotCorner:", CFSTR("AXAssistiveTouchIconTypeCalibrateOnDeviceEyeTracking"));
    -[AXSettings _assignActionToUnsetHotCorner:](self, "_assignActionToUnsetHotCorner:", CFSTR("AXAssistiveTouchIconTypeHome"));
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v15, CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingEnabledPreference"));

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0DDE1A0], 0, 0, 1u);
}

- (BOOL)assistiveTouchMouseOnDeviceEyeTrackingEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingEnabledPreference"), 0);
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingOnboardingCompleted:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingOnboardingCompletedPreference"));

}

- (BOOL)assistiveTouchMouseOnDeviceEyeTrackingOnboardingCompleted
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingOnboardingCompletedPreference"), 0);
}

- (BOOL)assistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompleted
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompletedPreference"), 0);
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompleted:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompletedPreference"));

}

- (NSArray)assistiveTouchMouseOnDeviceEyeTrackingCalibratedValues
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  AXSettingsReturnObjectValueWithClass(CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingCalibratedValuesPreference"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingCalibratedValues:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingCalibratedValuesPreference"));
}

- (NSDictionary)assistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  AXSettingsReturnObjectValueWithClass(CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMapPreference"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMapPreference"));
}

- (BOOL)assistiveTouchForceOnDeviceEyeTrackingExperience
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchForceOnDeviceEyeTrackingExperiencePreference"), 0);
}

- (void)setAssistiveTouchForceOnDeviceEyeTrackingExperience:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchForceOnDeviceEyeTrackingExperiencePreference"));

}

- (unint64_t)assistiveTouchOnDeviceEyeTrackingSmoothingBufferSize
{
  return AXSettingsReturnIntegerValue(CFSTR("AssistiveTouchOnDeviceEyeTrackingSmoothingBufferSizePreference"), *MEMORY[0x1E0CF3BB8]);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingSmoothingBufferSize:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchOnDeviceEyeTrackingSmoothingBufferSizePreference"));

}

- (BOOL)assistiveTouchOnDeviceEyeTrackingAutoHideEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AXSAssistiveTouchOnDeviceEyeTrackingAutoHideEnabled"), 0);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingAutoHideEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchOnDeviceEyeTrackingAutoHideEnabled"));

}

- (double)assistiveTouchOnDeviceEyeTrackingAutoHideTimeout
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSAssistiveTouchOnDeviceEyeTrackingAutoHideTimeout"), *MEMORY[0x1E0CF3B20]);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingAutoHideTimeout:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchOnDeviceEyeTrackingAutoHideTimeout"));

}

- (double)assistiveTouchOnDeviceEyeTrackingAutoHideOpacity
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSAssistiveTouchOnDeviceEyeTrackingAutoHideOpacity"), *MEMORY[0x1E0CF3B18]);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingAutoHideOpacity:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchOnDeviceEyeTrackingAutoHideOpacity"));

}

- (BOOL)assistiveTouchEnabledByOnDeviceEyeTracking
{
  return AXSettingsReturnBoolValue(CFSTR("AXSAssistiveTouchEnabledByOnDeviceEyeTracking"), 0);
}

- (void)setAssistiveTouchEnabledByOnDeviceEyeTracking:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchEnabledByOnDeviceEyeTracking"));

}

- (BOOL)assistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints"), 0);
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingShouldShowUncalibratedPoints"));

}

- (BOOL)assistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages"), 1);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchOnDeviceEyeTrackingShouldUseWeightedAverages"));

}

- (BOOL)assistiveTouchOnDeviceEyeTrackingShouldUseMotionFilter
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchOnDeviceEyeTrackingShouldUseMotionFilte"), 0);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingShouldUseMotionFilter:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchOnDeviceEyeTrackingShouldUseMotionFilte"));

}

- (BOOL)assistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur"), 0);
}

- (void)setAssistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchOnDeviceEyeTrackingShouldUseGaussianBlur"));

}

- (int64_t)assistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategy
{
  return AXSettingsReturnIntegerValue(CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategyPreference"), *MEMORY[0x1E0CF3C08]);
}

- (void)setAssistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategy:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingCalibrationStrategyPreference"));

}

- (void)setAssistiveTouchMouseDwellControlAutorevertEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseDwellControlAutorevertEnabledPreference"));

}

- (BOOL)assistiveTouchMouseDwellControlAutorevertEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseDwellControlAutorevertEnabledPreference"), 1);
}

- (void)setAssistiveTouchMouseDwellControlAutorevertAction:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AssistiveTouchMouseDwellControlAutorevertActionPreference"));
}

- (NSString)assistiveTouchMouseDwellControlAutorevertAction
{
  uint64_t v2;

  v2 = objc_opt_class();
  return (NSString *)AXSettingsReturnObjectValueWithClass(CFSTR("AssistiveTouchMouseDwellControlAutorevertActionPreference"), CFSTR("AXAssistiveTouchIconTypeDwellClick"), v2);
}

- (double)assistiveTouchMouseDwellControlActivationTimeout
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchMouseDwellControlActivationTimeoutPreference"), *MEMORY[0x1E0CF3B78]);
}

- (void)setAssistiveTouchMouseDwellControlActivationTimeout:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3B80] < a3)
    a3 = *MEMORY[0x1E0CF3B80];
  if (*MEMORY[0x1E0CF3B88] >= a3)
    a3 = *MEMORY[0x1E0CF3B88];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseDwellControlActivationTimeoutPreference"));

}

- (double)assistiveTouchMouseDwellControlMovementToleranceRadius
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchMouseDwellControlMovementToleranceRadiusPreference"), *MEMORY[0x1E0CF3B90]);
}

- (void)setAssistiveTouchMouseDwellControlMovementToleranceRadius:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseDwellControlMovementToleranceRadiusPreference"));

}

- (void)setAssistiveTouchMouseDwellControlCornerCustomization:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("kAXSAssistiveTouchMouseDwellControlCornerCustomizationPreference"));
}

- (NSDictionary)assistiveTouchMouseDwellControlCornerCustomization
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  AXSettingsReturnObjectValueWithClass(CFSTR("kAXSAssistiveTouchMouseDwellControlCornerCustomizationPreference"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setAssistiveTouchMouseDwellControlMutatedMenu:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchMouseDwellControlMutatedMenuPreference"));

}

- (BOOL)assistiveTouchMouseDwellControlMutatedMenu
{
  return AXSettingsReturnBoolValue(CFSTR("AXSAssistiveTouchMouseDwellControlMutatedMenuPreference"), 0);
}

- (void)setAssistiveTouchMouseDwellControlShowPrompt:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseDwellControlShowPromptPreference"));

}

- (BOOL)assistiveTouchMouseDwellControlShowPrompt
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMouseDwellControlShowPromptPreference"), 0);
}

- (unint64_t)assistiveTouchMouseZoomPanningStyle
{
  return AXSettingsReturnIntegerValue(CFSTR("AssistiveTouchMouseZoomPanningStylePreference"), *MEMORY[0x1E0CF3EB8]);
}

- (void)setAssistiveTouchMouseZoomPanningStyle:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMouseZoomPanningStylePreference"));

}

- (BOOL)assistiveTouchMotionTrackerConfigurable
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchMotionTrackerConfigurablePreference"), 0);
}

- (void)setAssistiveTouchMotionTrackerConfigurable:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMotionTrackerConfigurablePreference"));

}

- (BOOL)assistiveTouchForceEyeTrackerExperience
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchForceEyeTrackerExperiencePreference"), 0);
}

- (void)setAssistiveTouchForceEyeTrackerExperience:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchForceEyeTrackerExperiencePreference"));

}

- (unint64_t)assistiveTouchMotionTrackerSmoothingBufferSize
{
  return AXSettingsReturnIntegerValue(CFSTR("AssistiveTouchMotionTrackerSmoothingBufferSizePreference"), *MEMORY[0x1E0CF3B60]);
}

- (void)setAssistiveTouchMotionTrackerSmoothingBufferSize:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMotionTrackerSmoothingBufferSizePreference"));

}

- (double)assistiveTouchMotionTrackerSmoothingMaxDelta
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchMotionTrackerSmoothingMaxDeltaPreference"), 0.0);
}

- (void)setAssistiveTouchMotionTrackerSmoothingMaxDelta:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMotionTrackerSmoothingMaxDeltaPreference"));

}

- (double)assistiveTouchMotionTrackerXNormalizationOrder
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchMotionTrackerXNormalizationOrderPreference"), 1.0);
}

- (void)setAssistiveTouchMotionTrackerXNormalizationOrder:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMotionTrackerXNormalizationOrderPreference"));

}

- (double)assistiveTouchMotionTrackerYNormalizationOrder
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchMotionTrackerYNormalizationOrderPreference"), 1.0);
}

- (void)setAssistiveTouchMotionTrackerYNormalizationOrder:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMotionTrackerYNormalizationOrderPreference"));

}

- (double)assistiveTouchMotionTrackerXNormalizationOffset
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchMotionTrackerXNormalizationOffsetPreference"), 0.0);
}

- (void)setAssistiveTouchMotionTrackerXNormalizationOffset:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMotionTrackerXNormalizationOffsetPreference"));

}

- (double)assistiveTouchMotionTrackerYNormalizationOffset
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchMotionTrackerYNormalizationOffsetPreference"), 0.0);
}

- (void)setAssistiveTouchMotionTrackerYNormalizationOffset:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchMotionTrackerYNormalizationOffsetPreference"));

}

- (BOOL)assistiveTouchMotionTrackerShouldOffsetBufferPoints
{
  return AXSettingsReturnBoolValue(CFSTR("AXSAssistiveTouchMotionTrackerShouldOffsetBufferPointsPreference"), 1);
}

- (void)assistiveTouchMotionTrackerShouldOffsetBufferPoints:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchMotionTrackerShouldOffsetBufferPointsPreference"));

}

- (BOOL)assistiveTouchBubbleModeEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AXSAssistiveTouchBubbleModeEnabled"), 0);
}

- (void)setAssistiveTouchBubbleModeEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchBubbleModeEnabled"));

}

- (BOOL)assistiveTouchEyeTrackingAutoHideEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AXSAssistiveTouchEyeTrackingAutoHideEnabled"), 0);
}

- (void)setAssistiveTouchEyeTrackingAutoHideEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchEyeTrackingAutoHideEnabled"));

}

- (double)assistiveTouchEyeTrackingAutoHideTimeout
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSAssistiveTouchEyeTrackingAutoHideTimeout"), *MEMORY[0x1E0CF3B20]);
}

- (void)setAssistiveTouchEyeTrackingAutoHideTimeout:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchEyeTrackingAutoHideTimeout"));

}

- (double)assistiveTouchEyeTrackingAutoHideOpacity
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSAssistiveTouchEyeTrackingAutoHideOpacity"), *MEMORY[0x1E0CF3B18]);
}

- (void)setAssistiveTouchEyeTrackingAutoHideOpacity:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchEyeTrackingAutoHideOpacity"));

}

- (BOOL)assistiveTouchMouseClickSoundsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AXSAssistiveTouchMouseClickSounds"), 0);
}

- (void)setAssistiveTouchMouseClickSoundsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchMouseClickSounds"));

}

- (void)setAssistiveTouchHeadMovementSensitivity:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchHeadMovementSensitivityPreference"));

}

- (int64_t)assistiveTouchHeadMovementSensitivity
{
  return AXSettingsReturnIntegerValue(CFSTR("AssistiveTouchHeadMovementSensitivityPreference"), 1);
}

- (void)setAssistiveTouchSwitchUsageConfirmed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchSwitchUsageConfirmedPreference"));

}

- (BOOL)assistiveTouchSwitchUsageConfirmed
{
  return AXSettingsReturnBoolValue(CFSTR("AXSAssistiveTouchSwitchUsageConfirmedPreference"), 0);
}

- (void)setAssistiveTouchScannerAddedTripleClickAutomatically:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchAutoAddedTCItem"));

}

- (BOOL)assistiveTouchScannerAddedTripleClickAutomatically
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchAutoAddedTCItem"), 0);
}

- (void)setAssistiveTouchScannerPrefersCompact:(BOOL)a3 forLanguage:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = v6;
    AXLanguageCanonicalFormToGeneralLanguage(v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AssistiveTouchScannerPrefersCompactForLanguagePreference"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    if (!v9)
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v11);

    -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v9, CFSTR("AssistiveTouchScannerPrefersCompactForLanguagePreference"));
  }
}

- (BOOL)assistiveTouchScannerPrefersCompact:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  AXLanguageCanonicalFormToGeneralLanguage(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AssistiveTouchScannerPrefersCompactForLanguagePreference"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 0;

  return v7;
}

- (void)setAssistiveTouchSingleTapAction:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSAssistiveTouchSingleTapAction"));
}

- (NSString)assistiveTouchSingleTapAction
{
  __CFString *v2;
  __CFString *v3;
  char v4;
  __CFString *v5;
  __CFString *v6;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSAssistiveTouchSingleTapAction"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v5 = CFSTR("AXAssistiveTouchIconTypeOpenMenu");
    goto LABEL_5;
  }
  v4 = -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("__NONE__"));
  v5 = v3;
  if ((v4 & 1) == 0)
  {
LABEL_5:
    v6 = v5;
    goto LABEL_6;
  }
  v6 = 0;
LABEL_6:

  return (NSString *)v6;
}

- (void)setAssistiveTouchDoubleTapAction:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSAssistiveTouchDoubleTapAction"));
}

- (NSString)assistiveTouchDoubleTapAction
{
  void *v2;
  void *v3;
  id v4;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSAssistiveTouchDoubleTapAction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "isEqualToString:", CFSTR("__NONE__")) & 1) == 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (void)setAssistiveTouchDoubleTapActionTimeout:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchDoubleTapActionTimeout"));

}

- (double)assistiveTouchDoubleTapActionTimeout
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSAssistiveTouchDoubleTapActionTimeout"), 0.3);
}

- (void)setAssistiveTouchLongPressActionDuration:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchLongPressActionDuration"));

}

- (double)assistiveTouchLongPressActionDuration
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSAssistiveTouchLongPressActionDuration"), 0.75);
}

- (void)setAssistiveTouchLongPressAction:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSAssistiveTouchLongPressAction"));
}

- (NSString)assistiveTouchLongPressAction
{
  void *v2;
  void *v3;
  id v4;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSAssistiveTouchLongPressAction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "isEqualToString:", CFSTR("__NONE__")) & 1) == 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (void)setAssistiveTouchOrbAction:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSAssistiveTouchOrbPreference"));
}

- (NSString)assistiveTouchOrbAction
{
  __CFString *v2;
  __CFString *v3;
  char v4;
  __CFString *v5;
  __CFString *v6;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSAssistiveTouchOrbPreference"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v5 = CFSTR("AXAssistiveTouchIconTypeHome");
    goto LABEL_5;
  }
  v4 = -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("__NONE__"));
  v5 = v3;
  if ((v4 & 1) == 0)
  {
LABEL_5:
    v6 = v5;
    goto LABEL_6;
  }
  v6 = 0;
LABEL_6:

  return (NSString *)v6;
}

- (NSArray)assistiveTouchMouseCustomizedClickActions
{
  void *v2;
  void *v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSAssistiveTouchMouseCustomizedClickActionsPreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXCustomizableMouse deserialize:](AXCustomizableMouse, "deserialize:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)updateCustomizableMouse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  -[AXSettings assistiveTouchMouseCustomizedClickActions](self, "assistiveTouchMouseCustomizedClickActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __38__AXSettings_updateCustomizableMouse___block_invoke;
  v12 = &unk_1E24C8760;
  v7 = v4;
  v13 = v7;
  v14 = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v9);
  if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v7, "hasCustomActions", v9, v10, v11, v12))
      objc_msgSend(v6, "addObject:", v7);
  }
  else if (objc_msgSend(v7, "hasCustomActions", v9, v10, v11, v12))
  {
    objc_msgSend(v6, "setObject:atIndexedSubscript:", v7, v16[3]);
  }
  else
  {
    objc_msgSend(v6, "removeObjectAtIndex:", v16[3]);
  }
  +[AXCustomizableMouse serialize:](AXCustomizableMouse, "serialize:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v8, CFSTR("AXSAssistiveTouchMouseCustomizedClickActionsPreference"));

  _Block_object_dispose(&v15, 8);
}

uint64_t __38__AXSettings_updateCustomizableMouse___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToMouse:", a2);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (NSDictionary)assistiveTouchEyeTrackerCustomizedSettings
{
  return (NSDictionary *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSAssistiveTouchEyeTrackerCustomizedSettingsPreference"));
}

- (void)setAssistiveTouchEyeTrackerCustomizedSettings:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSAssistiveTouchEyeTrackerCustomizedSettingsPreference"));
}

- (id)smoothingBufferSizeForEyeTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v13;

  v4 = a3;
  -[AXSettings _legacyIdentifierForEyeTracker:](self, "_legacyIdentifierForEyeTracker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {

LABEL_4:
    -[AXSettings assistiveTouchEyeTrackerCustomizedSettings](self, "assistiveTouchEyeTrackerCustomizedSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AssistiveTouchMotionTrackerSmoothingBufferSizePreference"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v7 = objc_msgSend(v5, "length");

  if (v7)
    goto LABEL_4;
  AXLogSettings();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[AXSettings smoothingBufferSizeForEyeTracker:].cold.1();

  v11 = 0;
LABEL_7:

  return v11;
}

- (void)updateSmoothingBufferSize:(id)a3 forEyeTracker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v6 = a3;
  v7 = a4;
  -[AXSettings _legacyIdentifierForEyeTracker:](self, "_legacyIdentifierForEyeTracker:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C99E08];
    -[AXSettings assistiveTouchEyeTrackerCustomizedSettings](self, "assistiveTouchEyeTrackerCustomizedSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15
      || (objc_msgSend(v13, "objectForKeyedSubscript:", v8), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "setObject:forKey:", v6, CFSTR("AssistiveTouchMotionTrackerSmoothingBufferSizePreference"));
    objc_msgSend(v7, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v16, v17);

    -[AXSettings setAssistiveTouchEyeTrackerCustomizedSettings:](self, "setAssistiveTouchEyeTrackerCustomizedSettings:", v13);
  }
  else
  {
    AXLogSettings();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AXSettings updateSmoothingBufferSize:forEyeTracker:].cold.1();

  }
}

- (id)_legacyIdentifierForEyeTracker:(id)a3
{
  return (id)objc_msgSend(a3, "deviceUniqueID");
}

- (void)setAssistiveTouchMainScreenCustomization:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSAssistiveTouchMainScreenCustomizationPreference"));
}

- (BOOL)assistiveTouchCustomizationEnabled
{
  void *v2;
  BOOL v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSAssistiveTouchMainScreenCustomizationPreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (double)assistiveTouchIdleOpacity
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSAssistiveTouchIdleOpacityPreference"), *MEMORY[0x1E0CF3050]);
}

- (void)setAssistiveTouchIdleOpacity:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssistiveTouchIdleOpacityPreference"));

}

- (NSDictionary)assistiveTouchMainScreenDefaultCustomization
{
  _BOOL4 IsSiriAvailable;
  int IsVoiceControlAvailable;
  __CFString **v4;
  __CFString *v5;
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  IsSiriAvailable = AXDeviceIsSiriAvailable();
  IsVoiceControlAvailable = AXDeviceIsVoiceControlAvailable();
  v7[0] = CFSTR("AXAssistiveTouchIconLocationTopLeft");
  v7[1] = CFSTR("AXAssistiveTouchIconLocationTopMiddle");
  v8[0] = CFSTR("AXAssistiveTouchIconTypeCustom");
  v8[1] = CFSTR("AXAssistiveTouchIconTypeNotificationCenter");
  v7[2] = CFSTR("AXAssistiveTouchIconLocationTopRight");
  v7[3] = CFSTR("AXAssistiveTouchIconLocationMidLeft");
  v4 = AXAssistiveTouchIconTypeVoiceControl;
  if (!IsVoiceControlAvailable)
    v4 = AXAssistiveTouchIconTypeGestures;
  if (IsSiriAvailable)
    v4 = AXAssistiveTouchIconTypeSiri;
  v5 = *v4;
  v8[2] = CFSTR("AXAssistiveTouchIconTypeDevice");
  v8[3] = v5;
  v7[4] = CFSTR("AXAssistiveTouchIconLocationBottomMiddle");
  v7[5] = CFSTR("AXAssistiveTouchIconLocationMidRight");
  v8[4] = CFSTR("AXAssistiveTouchIconTypeHome");
  v8[5] = CFSTR("AXAssistiveTouchIconTypeControlCenter");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)assistiveTouchMainScreenCustomization
{
  void *v3;
  uint64_t v4;
  _BOOL4 IsSiriAvailable;
  int IsVoiceControlAvailable;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  const __CFString *v24;
  const __CFString *v25;
  id obj;
  _BOOL4 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSAssistiveTouchMainScreenCustomizationPreference"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[AXSettings assistiveTouchMainScreenDefaultCustomization](self, "assistiveTouchMainScreenDefaultCustomization");
    v4 = objc_claimAutoreleasedReturnValue();

    -[AXSettings setAssistiveTouchMainScreenCustomization:](self, "setAssistiveTouchMainScreenCustomization:", v4);
    v3 = (void *)v4;
  }
  IsSiriAvailable = AXDeviceIsSiriAvailable();
  IsVoiceControlAvailable = AXDeviceIsVoiceControlAvailable();
  v7 = IsVoiceControlAvailable;
  v27 = IsSiriAvailable;
  if (!IsSiriAvailable || (IsVoiceControlAvailable & 1) == 0)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      v11 = CFSTR("AXAssistiveTouchIconTypeGestures");
      if (v7)
        v11 = CFSTR("AXAssistiveTouchIconTypeVoiceControl");
      v25 = v11;
      v24 = CFSTR("AXAssistiveTouchIconTypeActionButton");
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v3, "objectForKeyedSubscript:", v13, v24);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("AXAssistiveTouchIconTypeSiri"));

          if (((v15 ^ 1 | v27) & 1) == 0)
          {
            v16 = (void *)objc_msgSend(v3, "mutableCopy");
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, v13);

            v3 = v16;
          }
          objc_msgSend(v3, "objectForKeyedSubscript:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("AXAssistiveTouchIconTypeVoiceControl"));

          if (((v18 ^ 1 | v7) & 1) == 0)
          {
            v19 = (void *)objc_msgSend(v3, "mutableCopy");
            objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("AXAssistiveTouchIconTypeGestures"), v13);

            v3 = v19;
          }
          if (AXDeviceHasStaccato())
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v13);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("AXAssistiveTouchIconTypeMute"));

            if (v21)
            {
              v22 = (void *)objc_msgSend(v3, "mutableCopy");
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, v13);

              v3 = v22;
            }
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v9);
    }

  }
  return (NSDictionary *)v3;
}

- (BOOL)assistiveTouchGameControllerEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AXSAssitiveTouchGameControllerPreference"), 0);
}

- (void)setAssistiveTouchGameControllerEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAssitiveTouchGameControllerPreference"));

}

- (NSArray)switchControlRecipes
{
  uint64_t v3;
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
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SCRecipes"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathForResource:ofType:", CFSTR("SwitchControlDefaultRecipes"), CFSTR("plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithContentsOfFile:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        +[AXSwitchRecipe recipeWithDictionaryRepresentation:](AXSwitchRecipe, "recipeWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  if (!v3)
    -[AXSettings setSwitchControlRecipes:](self, "setSwitchControlRecipes:", v8);

  return (NSArray *)v8;
}

- (void)setSwitchControlRecipes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, CFSTR("SCRecipes"), (_QWORD)v13);

}

- (NSUUID)switchControlLaunchRecipeUUID
{
  void *v2;
  void *v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SCLaunchRecipeUUID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);
  else
    v3 = 0;

  return (NSUUID *)v3;
}

- (void)setSwitchControlLaunchRecipeUUID:(id)a3
{
  id v4;

  objc_msgSend(a3, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCLaunchRecipeUUID"));

}

- (id)_switchControlMenuItemsForPreferenceKey:(id)a3 allTypes:(id)a4 enabledByDefault:(BOOL)a5 topLevel:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  void *v40;
  NSMutableSet *migratedSwitchControlMenuItemsPreferenceKeys;
  NSMutableSet *v42;
  NSMutableSet *v43;
  void *v45;
  id v46;
  id v47;
  AXSettings *v48;
  uint64_t v49;
  id obj;
  id obja;
  _BOOL4 v52;
  _BOOL4 v53;
  unsigned int v54;
  _QWORD v55[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _BYTE v66[128];
  _QWORD v67[2];
  _QWORD v68[2];
  _BYTE v69[128];
  uint64_t v70;

  v6 = a6;
  v52 = a5;
  v70 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
  }
  if ((-[NSMutableSet containsObject:](self->_migratedSwitchControlMenuItemsPreferenceKeys, "containsObject:", v9) & 1) == 0)
  {
    if (v11)
    {
      v48 = self;
      v53 = -[AXSettings _switchControlHasEmptyTopLevelMenuItems:](self, "_switchControlHasEmptyTopLevelMenuItems:", v11);
      v45 = v11;
      v11 = (void *)objc_msgSend(v11, "mutableCopy");
      v12 = objc_msgSend(v11, "count");
      v13 = (id *)MEMORY[0x1E0CF3750];
      if (v12 - 1 >= 0)
      {
        v14 = v12;
        v15 = *MEMORY[0x1E0CF3750];
        do
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", --v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[AXSettings _allSubmenuKeys](v48, "_allSubmenuKeys");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "containsObject:", v17);

          if ((objc_msgSend(v10, "containsObject:", v17) & 1) == 0 && (v6 & v19 & 1) == 0)
            objc_msgSend(v11, "removeObjectAtIndex:", v14);

        }
        while (v14 > 0);
      }
      v46 = v10;
      v47 = v9;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v20 = v10;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      if (v21)
      {
        v22 = v21;
        v54 = !v53;
        v23 = *(_QWORD *)v57;
        obj = *v13;
        v49 = *MEMORY[0x1E0CF3610];
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v57 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
            v55[0] = MEMORY[0x1E0C809B0];
            v55[1] = 3221225472;
            v55[2] = __89__AXSettings__switchControlMenuItemsForPreferenceKey_allTypes_enabledByDefault_topLevel___block_invoke;
            v55[3] = &unk_1E24C8788;
            v55[4] = v25;
            v26 = objc_msgSend(v11, "indexOfObjectPassingTest:", v55);
            v27 = objc_msgSend(v20, "indexOfObject:", v25);
            if (v26 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v28 = v27;
              v64[0] = obj;
              v64[1] = v49;
              v65[0] = v25;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v54);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v65[1] = v29;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28 <= objc_msgSend(v11, "count"))
                objc_msgSend(v11, "insertObject:atIndex:", v30, v28);
              else
                objc_msgSend(v11, "addObject:", v30);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        }
        while (v22);
      }

      v31 = v45;
    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("SCTopLevelMenuItems")))
      {
        -[AXSettings _switchControlMigratePreMonarchIncludedMenuItemsForNewTypes:](self, "_switchControlMigratePreMonarchIncludedMenuItemsForNewTypes:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
        -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v11, v9);
        migratedSwitchControlMenuItemsPreferenceKeys = self->_migratedSwitchControlMenuItemsPreferenceKeys;
        if (!migratedSwitchControlMenuItemsPreferenceKeys)
        {
          v42 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
          v43 = self->_migratedSwitchControlMenuItemsPreferenceKeys;
          self->_migratedSwitchControlMenuItemsPreferenceKeys = v42;

          migratedSwitchControlMenuItemsPreferenceKeys = self->_migratedSwitchControlMenuItemsPreferenceKeys;
        }
        -[NSMutableSet addObject:](migratedSwitchControlMenuItemsPreferenceKeys, "addObject:", v9);
        goto LABEL_38;
      }
      v47 = v9;
      v48 = self;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v46 = v10;
      obja = v10;
      v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v61;
        v35 = *MEMORY[0x1E0CF3750];
        v36 = *MEMORY[0x1E0CF3610];
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v61 != v34)
              objc_enumerationMutation(obja);
            v38 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
            v67[1] = v36;
            v68[0] = v38;
            v67[0] = v35;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v52);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v68[1] = v39;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v40);

          }
          v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        }
        while (v33);
      }
      v31 = obja;
    }

    v10 = v46;
    v9 = v47;
    self = v48;
    goto LABEL_35;
  }
LABEL_38:

  return v11;
}

uint64_t __89__AXSettings__switchControlMenuItemsForPreferenceKey_allTypes_enabledByDefault_topLevel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CF3750]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_switchControlMigratePreMonarchIncludedMenuItemsForNewTypes:(id)a3
{
  id v3;
  CFStringRef *v4;
  int AppBooleanValue;
  BOOL v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  BOOL v18;
  int v19;
  BOOL v20;
  int v21;
  BOOL v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  char v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  CFStringRef *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  unsigned int v56;
  id obj;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  Boolean keyExistsAndHasValidFormat;
  _QWORD v68[5];
  _BYTE v69[128];
  _QWORD v70[2];
  _QWORD v71[2];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  keyExistsAndHasValidFormat = 0;
  v4 = (CFStringRef *)MEMORY[0x1E0DDE008];
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AXSAssistiveTouchScannerMenuIncludeHomeItem"), (CFStringRef)*MEMORY[0x1E0DDE008], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v6 = AppBooleanValue == 0;
  else
    v6 = 0;
  v7 = !v6;
  v8 = CFPreferencesGetAppBooleanValue(CFSTR("AXSAssistiveTouchScannerMenuIncludeGesturesItem"), *v4, &keyExistsAndHasValidFormat);
  v9 = keyExistsAndHasValidFormat;
  v10 = CFPreferencesGetAppBooleanValue(CFSTR("AXSAssistiveTouchScannerMenuIncludeScrollItem"), *v4, &keyExistsAndHasValidFormat);
  v11 = keyExistsAndHasValidFormat;
  v12 = CFPreferencesGetAppBooleanValue(CFSTR("AXSAssistiveTouchScannerMenuIncludeDeviceItem"), *v4, &keyExistsAndHasValidFormat);
  v13 = keyExistsAndHasValidFormat;
  v14 = CFPreferencesGetAppBooleanValue(CFSTR("AXSAssistiveTouchScannerMenuIncludeSettingsItem"), *v4, &keyExistsAndHasValidFormat);
  if (v9)
    v15 = v8 == 0;
  else
    v15 = 0;
  v16 = !v15;
  v54 = v16;
  if (v15)
    v17 = v7;
  else
    v17 = 1;
  if (v11)
    v18 = v10 == 0;
  else
    v18 = 0;
  v19 = !v18;
  v56 = v19;
  if (!v18)
    v17 = 1;
  if (v13)
    v20 = v12 == 0;
  else
    v20 = 0;
  v21 = !v20;
  v52 = v21;
  if (!v20)
    v17 = 1;
  if (keyExistsAndHasValidFormat)
    v22 = v14 == 0;
  else
    v22 = 0;
  v23 = !v22;
  if (!v22)
    v17 = 1;
  v48 = v17;
  v49 = v23;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v58 = (id)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v3;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v64;
    v27 = *MEMORY[0x1E0CF3688];
    v55 = *MEMORY[0x1E0CF3700];
    v53 = *MEMORY[0x1E0CF3618];
    v51 = *MEMORY[0x1E0CF3548];
    v50 = *MEMORY[0x1E0CF36E8];
    v47 = *MEMORY[0x1E0CF3708];
    v28 = *MEMORY[0x1E0CF3750];
    v29 = *MEMORY[0x1E0CF3610];
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v64 != v26)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        v32 = objc_msgSend(v31, "isEqualToString:", v27);
        v33 = v7;
        if ((v32 & 1) == 0)
        {
          v34 = objc_msgSend(v31, "isEqualToString:", v55);
          v33 = v56;
          if ((v34 & 1) == 0)
          {
            v35 = objc_msgSend(v31, "isEqualToString:", v53);
            v33 = v54;
            if ((v35 & 1) == 0)
            {
              v36 = objc_msgSend(v31, "isEqualToString:", v51);
              v33 = v52;
              if ((v36 & 1) == 0)
              {
                if ((objc_msgSend(v31, "isEqualToString:", v50) & 1) != 0
                  || (v37 = objc_msgSend(v31, "isEqualToString:", v47), v33 = v48, v37))
                {
                  v33 = v49;
                }
              }
            }
          }
        }
        v70[1] = v29;
        v71[0] = v31;
        v70[0] = v28;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v71[1] = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "addObject:", v39);

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    }
    while (v25);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v68[0] = CFSTR("AXSAssistiveTouchScannerMenuIncludeHomeItem");
  v68[1] = CFSTR("AXSAssistiveTouchScannerMenuIncludeGesturesItem");
  v68[2] = CFSTR("AXSAssistiveTouchScannerMenuIncludeScrollItem");
  v68[3] = CFSTR("AXSAssistiveTouchScannerMenuIncludeDeviceItem");
  v68[4] = CFSTR("AXSAssistiveTouchScannerMenuIncludeSettingsItem");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  v42 = (CFStringRef *)MEMORY[0x1E0DDE008];
  if (v41)
  {
    v43 = v41;
    v44 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v60 != v44)
          objc_enumerationMutation(v40);
        CFPreferencesSetAppValue(*(CFStringRef *)(*((_QWORD *)&v59 + 1) + 8 * j), 0, *v42);
      }
      v43 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v43);
  }

  CFPreferencesAppSynchronize(*v42);
  return v58;
}

- (id)topLevelKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[19];

  v12[18] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CF3608];
  v12[0] = *MEMORY[0x1E0CF3690];
  v12[1] = v2;
  v3 = *MEMORY[0x1E0CF3688];
  v12[2] = *MEMORY[0x1E0CF3700];
  v12[3] = v3;
  v4 = *MEMORY[0x1E0CF3618];
  v12[4] = *MEMORY[0x1E0CF3738];
  v12[5] = v4;
  v5 = *MEMORY[0x1E0CF36F8];
  v12[6] = *MEMORY[0x1E0CF3600];
  v12[7] = v5;
  v6 = *MEMORY[0x1E0CF3548];
  v12[8] = *MEMORY[0x1E0CF36E8];
  v12[9] = v6;
  v7 = *MEMORY[0x1E0CF3708];
  v12[10] = *MEMORY[0x1E0CF36A8];
  v12[11] = v7;
  v8 = *MEMORY[0x1E0CF36F0];
  v12[12] = *MEMORY[0x1E0CF3740];
  v12[13] = v8;
  v9 = *MEMORY[0x1E0CF36A0];
  v12[14] = *MEMORY[0x1E0CF3698];
  v12[15] = v9;
  v10 = *MEMORY[0x1E0CF3528];
  v12[16] = *MEMORY[0x1E0CF3748];
  v12[17] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 18);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)switchControlTopLevelMenuItems
{
  void *v3;
  void *v4;

  -[AXSettings topLevelKeys](self, "topLevelKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings _switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:](self, "_switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:", CFSTR("SCTopLevelMenuItems"), v3, 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSwitchControlTopLevelMenuItems:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SCTopLevelMenuItems"));
}

- (BOOL)switchControlHasEmptyTopLevelMenu
{
  AXSettings *v2;
  void *v3;

  v2 = self;
  -[AXSettings switchControlTopLevelMenuItems](self, "switchControlTopLevelMenuItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[AXSettings _switchControlHasEmptyTopLevelMenuItems:](v2, "_switchControlHasEmptyTopLevelMenuItems:", v3);

  return (char)v2;
}

- (BOOL)_switchControlHasEmptyTopLevelMenuItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v7 = *MEMORY[0x1E0CF3610];
    v8 = *MEMORY[0x1E0CF3750];
    v9 = *MEMORY[0x1E0CF3738];
    v18 = *MEMORY[0x1E0CF3698];
    v17 = *MEMORY[0x1E0CF36A0];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        if (v13)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", v9))
          {
            if ((AXDeviceSupportsSideApp() & 1) != 0)
              goto LABEL_17;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", v18) & 1) == 0
                 && !objc_msgSend(v14, "isEqualToString:", v17)
                 || -[AXSettings switchControlTapBehavior](self, "switchControlTapBehavior") == 2)
          {
LABEL_17:

            v15 = 0;
            goto LABEL_18;
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v5)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_18:

  return v15;
}

- (void)setSwitchControlShouldUseShortFirstPage:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCShouldUseShortFirstPage"));

}

- (BOOL)switchControlShouldUseShortFirstPage
{
  void *v2;
  void *v3;
  char v4;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SCShouldUseShortFirstPage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (NSArray)gestureKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[13];

  v11[12] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CF3640];
  v11[0] = *MEMORY[0x1E0CF3678];
  v11[1] = v2;
  v3 = *MEMORY[0x1E0CF3668];
  v11[2] = *MEMORY[0x1E0CF3660];
  v11[3] = v3;
  v4 = *MEMORY[0x1E0CF3630];
  v11[4] = *MEMORY[0x1E0CF3680];
  v11[5] = v4;
  v5 = *MEMORY[0x1E0CF3620];
  v11[6] = *MEMORY[0x1E0CF3658];
  v11[7] = v5;
  v6 = *MEMORY[0x1E0CF3650];
  v11[8] = *MEMORY[0x1E0CF3628];
  v11[9] = v6;
  v7 = *MEMORY[0x1E0CF3670];
  v11[10] = *MEMORY[0x1E0CF3638];
  v11[11] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXForceTouchAvailableAndEnabled())
  {
    objc_msgSend(v8, "arrayByAddingObject:", *MEMORY[0x1E0CF3648]);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  return (NSArray *)v8;
}

- (NSArray)switchControlGesturesMenuItems
{
  void *v3;
  void *v4;

  -[AXSettings gestureKeys](self, "gestureKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings _switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:](self, "_switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:", CFSTR("SCGesturesMenuItems"), v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSwitchControlGesturesMenuItems:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SCGesturesMenuItems"));
}

- (NSArray)switchControlGesturesTopLevelMenuItems
{
  void *v3;
  void *v4;

  -[AXSettings gestureKeys](self, "gestureKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings _switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:](self, "_switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:", CFSTR("SCGesturesTopLevelMenuItems"), v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSwitchControlGesturesTopLevelMenuItems:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SCGesturesTopLevelMenuItems"));
}

- (NSArray)deviceKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[26];

  v15[25] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CF35E0];
  v15[0] = *MEMORY[0x1E0CF3550];
  v15[1] = v2;
  v3 = *MEMORY[0x1E0CF3560];
  v15[2] = *MEMORY[0x1E0CF3588];
  v15[3] = v3;
  v4 = *MEMORY[0x1E0CF3598];
  v15[4] = *MEMORY[0x1E0CF3578];
  v15[5] = v4;
  v5 = *MEMORY[0x1E0CF35F8];
  v15[6] = *MEMORY[0x1E0CF3580];
  v15[7] = v5;
  v6 = *MEMORY[0x1E0CF35B8];
  v15[8] = *MEMORY[0x1E0CF35C8];
  v15[9] = v6;
  v7 = *MEMORY[0x1E0CF35E8];
  v15[10] = *MEMORY[0x1E0CF35F0];
  v15[11] = v7;
  v8 = *MEMORY[0x1E0CF35A8];
  v15[12] = *MEMORY[0x1E0CF35B0];
  v15[13] = v8;
  v9 = *MEMORY[0x1E0CF35C0];
  v15[14] = *MEMORY[0x1E0CF3568];
  v15[15] = v9;
  v10 = *MEMORY[0x1E0CF3558];
  v15[16] = *MEMORY[0x1E0CF35A0];
  v15[17] = v10;
  v11 = *MEMORY[0x1E0CF35D8];
  v15[18] = *MEMORY[0x1E0CF3570];
  v15[19] = v11;
  v12 = *MEMORY[0x1E0CF3590];
  v15[20] = *MEMORY[0x1E0CF35D0];
  v15[21] = v12;
  v13 = *MEMORY[0x1E0CF3540];
  v15[22] = *MEMORY[0x1E0CF3530];
  v15[23] = v13;
  v15[24] = *MEMORY[0x1E0CF3538];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 25);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)switchControlDeviceMenuItems
{
  void *v3;
  void *v4;

  -[AXSettings deviceKeys](self, "deviceKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings _switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:](self, "_switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:", CFSTR("SCDeviceMenuItems"), v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSwitchControlDeviceMenuItems:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SCDeviceMenuItems"));
}

- (NSArray)switchControlDeviceTopLevelMenuItems
{
  void *v3;
  void *v4;

  -[AXSettings deviceKeys](self, "deviceKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings _switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:](self, "_switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:", CFSTR("SCDeviceTopLevelMenuItems"), v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSwitchControlDeviceTopLevelMenuItems:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SCDeviceTopLevelMenuItems"));
}

- (NSArray)settingsKeys
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CF3718];
  v5[0] = *MEMORY[0x1E0CF3730];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0CF3720];
  v5[2] = *MEMORY[0x1E0CF3728];
  v5[3] = v3;
  v5[4] = *MEMORY[0x1E0CF3710];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)switchControlSettingsMenuItems
{
  void *v3;
  void *v4;

  -[AXSettings settingsKeys](self, "settingsKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings _switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:](self, "_switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:", CFSTR("SCSettingsMenuItems"), v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSwitchControlSettingsMenuItems:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SCSettingsMenuItems"));
}

- (NSArray)switchControlSettingsTopLevelMenuItems
{
  void *v3;
  void *v4;

  -[AXSettings settingsKeys](self, "settingsKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings _switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:](self, "_switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:", CFSTR("SCSettingsTopLevelMenuItems"), v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSwitchControlSettingsTopLevelMenuItems:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SCSettingsTopLevelMenuItems"));
}

- (void)setSwitchControlMediaControlsMenuItems:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SCMediaControlsMenuItems"));
}

- (NSArray)mediaControlsKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CF36C0];
  v6[0] = *MEMORY[0x1E0CF36C8];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0CF36D8];
  v6[2] = *MEMORY[0x1E0CF36B8];
  v6[3] = v3;
  v4 = *MEMORY[0x1E0CF36D0];
  v6[4] = *MEMORY[0x1E0CF36E0];
  v6[5] = v4;
  v6[6] = *MEMORY[0x1E0CF36B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 7);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)switchControlMediaControlsMenuItems
{
  void *v3;
  void *v4;

  -[AXSettings mediaControlsKeys](self, "mediaControlsKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings _switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:](self, "_switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:", CFSTR("SCMediaControlsMenuItems"), v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSwitchControlMediaControlsTopLevelMenuItems:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SCMediaControlsTopLevelMenuItems"));
}

- (NSArray)switchControlMediaControlsTopLevelMenuItems
{
  void *v3;
  void *v4;

  -[AXSettings mediaControlsKeys](self, "mediaControlsKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings _switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:](self, "_switchControlMenuItemsForPreferenceKey:allTypes:enabledByDefault:topLevel:", CFSTR("SCMediaControlsTopLevelMenuItems"), v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)_allSubmenuKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D20];
  -[AXSettings gestureKeys](self, "gestureKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings deviceKeys](self, "deviceKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings settingsKeys](self, "settingsKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings mediaControlsKeys](self, "mediaControlsKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 4, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)switchControlShouldUseExtendedKeyboardPredictions
{
  return _AXSSwitchControlExtendedKeyboardPredictionsEnabled() != 0;
}

- (void)setSwitchControlShouldUseExtendedKeyboardPredictions:(BOOL)a3
{
  _AXSSwitchControlExtendedKeyboardPredictionsSetEnabled();
}

- (BOOL)assistiveTouchShouldUseExtendedKeyboardPredictions
{
  return _AXSAssistiveTouchExtendedKeyboardPredictionsEnabled() != 0;
}

- (void)setAssistiveTouchShouldUseExtendedKeyboardPredictions:(BOOL)a3
{
  _AXSAssistiveTouchExtendedKeyboardPredictionsSetEnabled();
}

- (BOOL)switchControlIgnoreInvalidSwitchConfiguration
{
  return AXSettingsReturnBoolValue(CFSTR("SCIgnoreInvalidSwitchConfiguration"), 0);
}

- (void)setSwitchControlIgnoreInvalidSwitchConfiguration:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCIgnoreInvalidSwitchConfiguration"));

}

- (BOOL)switchControlRestartScanningAtCurrentKey
{
  return AXSettingsReturnBoolValue(CFSTR("SCRestartScanningAtCurrentKey"), 0);
}

- (void)setSwitchControlRestartScanningAtCurrentKey:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCRestartScanningAtCurrentKey"));

}

- (int64_t)switchControlPointPickerSelectionStyle
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = AXSettingsReturnIntegerValue(CFSTR("SCSwitchControlPointPickerSelectionStyle"), 0);
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SCSwitchControlPointPickerSelectionStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SCSwitchControlPointPickerHighPrecisionEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "BOOLValue"))
        v3 = 2;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v7, CFSTR("SCSwitchControlPointPickerSelectionStyle"));

      -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("SCSwitchControlPointPickerHighPrecisionEnabled"));
    }

  }
  return v3;
}

- (void)setSwitchControlPointPickerSelectionStyle:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCSwitchControlPointPickerSelectionStyle"));

}

- (BOOL)switchControlUseCameraForPointMode
{
  int v2;

  v2 = AXDeviceSupportsHeadTracking();
  if (v2)
    LOBYTE(v2) = AXSettingsReturnBoolValue(CFSTR("SCUseCameraForPointPicker"), 0);
  return v2;
}

- (void)setSwitchControlUseCameraForPointMode:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCUseCameraForPointPicker"));

}

- (double)switchControlCameraPointPickerSensitivity
{
  return AXSettingsReturnDoubleValue(CFSTR("SCCameraPointPickerSensitivity"), 0.495);
}

- (void)setSwitchControlCameraPointPickerSensitivity:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCCameraPointPickerSensitivity"));

}

- (double)switchControlCameraPointPickerMovementToleranceInJoystickMode
{
  return AXSettingsReturnDoubleValue(CFSTR("SCCameraPointPickerMovementToleranceInJoystickMode"), 0.495);
}

- (void)setSwitchControlCameraPointPickerMovementToleranceInJoystickMode:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCCameraPointPickerMovementToleranceInJoystickMode"));

}

- (unint64_t)switchControlCameraPointPickerMode
{
  return AXSettingsReturnIntegerValue(CFSTR("SCCameraPointPickerMode"), 2);
}

- (void)setSwitchControlCameraPointPickerMode:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCCameraPointPickerMode"));

}

- (double)switchControlCameraPointPickerDwellActivationTimeout
{
  return AXSettingsReturnDoubleValue(CFSTR("SCCameraPointPickerDwellActivationTimeoutPreference"), *MEMORY[0x1E0CF3C38]);
}

- (void)setSwitchControlCameraPointPickerDwellActivationTimeout:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3C40] < a3)
    a3 = *MEMORY[0x1E0CF3C40];
  if (*MEMORY[0x1E0CF3C48] >= a3)
    a3 = *MEMORY[0x1E0CF3C48];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCCameraPointPickerDwellActivationTimeoutPreference"));

}

- (double)switchControlCameraPointPickerDwellMovementToleranceRadius
{
  return AXSettingsReturnDoubleValue(CFSTR("SCCameraPointPickerDwellMovementToleranceRadiusPreference"), *MEMORY[0x1E0CF3C50]);
}

- (void)setSwitchControlCameraPointPickerDwellMovementToleranceRadius:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCCameraPointPickerDwellMovementToleranceRadiusPreference"));

}

- (int64_t)switchControlScanningStyle
{
  void *v3;
  int64_t result;
  void *v5;
  int64_t v6;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SCScanningStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AssistiveTouchAutoScanningEnabled"));
    result = objc_claimAutoreleasedReturnValue();
    if (!result)
      return result;
    v5 = (void *)result;
    if (objc_msgSend((id)result, "BOOLValue"))
      v3 = &unk_1E24F7F70;
    else
      v3 = &unk_1E24F7F88;
    -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v3, CFSTR("SCScanningStyle"));
    -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("AssistiveTouchAutoScanningEnabled"));

  }
  v6 = objc_msgSend(v3, "integerValue");

  return v6;
}

- (void)setSwitchControlScanningStyle:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCScanningStyle"));

}

- (int64_t)switchControlFirstLaunchScanningMode
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SCFirstLaunchScanningMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = AXSettingsReturnIntegerValue(CFSTR("SCFirstLaunchScanningMode"), 0);
  else
    v4 = -[AXSettings assistiveTouchScanningMode](self, "assistiveTouchScanningMode");
  v5 = v4;

  return v5;
}

- (void)setSwitchControlFirstLaunchScanningMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCFirstLaunchScanningMode"));

}

- (id)switchControlLocStringForFirstLaunchScanningMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((unint64_t)a3 > 3)
    return 0;
  AXParameterizedLocalizedString(2, off_1E24C8A18[a3], a3, v3, v4, v5, v6, v7, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)switchControlDwellTime
{
  return AXSettingsReturnDoubleValue(CFSTR("SCDwellTime"), 1.0);
}

- (void)setSwitchControlDwellTime:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3C30] > a3)
    a3 = *MEMORY[0x1E0CF3C30];
  if (a3 >= *MEMORY[0x1E0CF3C28])
    a3 = *MEMORY[0x1E0CF3C28];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCDwellTime"));

}

- (BOOL)switchControlDebugLoggingEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("SCDebugLoggingEnabled"), 0);
}

- (void)setSwitchControlDebugLoggingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCDebugLoggingEnabled"));

}

- (int64_t)switchControlTapBehavior
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = AXSettingsReturnIntegerValue(CFSTR("SCTapBehaviorPreference"), 0);
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SCTapBehaviorPreference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AssistiveTouchScannerSelectTimeoutEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "BOOLValue"))
        v3 = 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v7, CFSTR("SCTapBehaviorPreference"));

      -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("AssistiveTouchScannerSelectTimeoutEnabled"));
    }

  }
  v8 = -[AXSettings switchControlScanningStyle](self, "switchControlScanningStyle");
  if (v3 == 1 && v8 == 2)
    return 0;
  else
    return v3;
}

- (void)setSwitchControlTapBehavior:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCTapBehaviorPreference"));

}

- (void)setSwitchControlAutoTapTimeout:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3EC8] > a3)
    a3 = *MEMORY[0x1E0CF3EC8];
  if (a3 >= *MEMORY[0x1E0CF3EC0])
    a3 = *MEMORY[0x1E0CF3EC0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchScannerSelectTimeout"));

}

- (double)switchControlAutoTapTimeout
{
  return AXSettingsReturnDoubleValue(CFSTR("AssistiveTouchScannerSelectTimeout"), 0.75);
}

- (BOOL)switchControlShouldAlwaysActivateKeyboardKeys
{
  return AXSettingsReturnBoolValue(CFSTR("SCShouldAlwaysActivateKeyboardKeys"), 0);
}

- (void)setSwitchControlShouldAlwaysActivateKeyboardKeys:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCShouldAlwaysActivateKeyboardKeys"));

}

- (BOOL)switchControlIsEnabledAsReceiver
{
  return AXSettingsReturnBoolValue(CFSTR("SCIsEnabledAsReceiver"), 0);
}

- (void)setSwitchControlIsEnabledAsReceiver:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCIsEnabledAsReceiver"));

}

- (int64_t)switchControlScanAfterTapLocation
{
  return AXSettingsReturnIntegerValue(CFSTR("SCScanAfterTapLocation"), 0);
}

- (void)setSwitchControlScanAfterTapLocation:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCScanAfterTapLocation"));

}

- (void)_switchControlClearMenuItemPreferences
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const __CFString *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet removeAllObjects](self->_migratedSwitchControlMenuItemsPreferenceKeys, "removeAllObjects");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[AXSettings _switchControlMenuItemPreferences](self, "_switchControlMenuItemPreferences", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(const __CFString **)(*((_QWORD *)&v9 + 1) + 8 * i);
        -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, v8);
        CFPreferencesSetAppValue(v8, 0, -[AXSettings _domainNameForDomain:](self, "_domainNameForDomain:", 1));
        CFPreferencesAppSynchronize(-[AXSettings _domainNameForDomain:](self, "_domainNameForDomain:", 1));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)_switchControlMenuItemPreferences
{
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SCTopLevelMenuItems");
  v3[1] = CFSTR("SCGesturesTopLevelMenuItems");
  v3[2] = CFSTR("SCDeviceTopLevelMenuItems");
  v3[3] = CFSTR("SCDeviceTopLevelMenuItems");
  v3[4] = CFSTR("SCSettingsTopLevelMenuItems");
  v3[5] = CFSTR("SCMediaControlsTopLevelMenuItems");
  v3[6] = CFSTR("SCGesturesMenuItems");
  v3[7] = CFSTR("SCDeviceMenuItems");
  v3[8] = CFSTR("SCSettingsMenuItems");
  v3[9] = CFSTR("SCMediaControlsMenuItems");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_switchControlClearMenuItemMigrationTracking
{
  -[NSMutableSet removeAllObjects](self->_migratedSwitchControlMenuItemsPreferenceKeys, "removeAllObjects");
}

- (void)setTeachableMomentsNotificationsSeen:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSTeachableMomentsNotificationSeen"));
}

- (NSDictionary)teachableMomentsNotificationsSeen
{
  uint64_t v2;

  v2 = objc_opt_class();
  return (NSDictionary *)AXSettingsReturnObjectValueWithClass(CFSTR("AXSTeachableMomentsNotificationSeen"), 0, v2);
}

- (void)setTeachableMomentsDelayBeforeSending:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSTeachableMomentsDelayBeforeSending"));

}

- (double)teachableMomentsDelayBeforeSending
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSTeachableMomentsDelayBeforeSending"), 1800.0);
}

- (BOOL)zoomPreferencesWereInitialized
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomPreferencesWereInitialized"), 0);
}

- (void)setZoomPreferencesWereInitialized:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomPreferencesWereInitialized"));

}

- (CGRect)zoomWindowFrame
{
  void *v2;
  void *v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("ZoomWindowFrame"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (double *)objc_msgSend(objc_retainAutorelease(v2), "bytes");
    v5 = *v4;
    v6 = v4[1];
    v7 = v4[2];
    v8 = v4[3];
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)setZoomWindowFrame:(CGRect)a3
{
  void *v4;
  CGRect v5;

  v5 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v5, 32);
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomWindowFrame"), *(_QWORD *)&v5.origin.x, *(_QWORD *)&v5.origin.y, *(_QWORD *)&v5.size.width, *(_QWORD *)&v5.size.height);

}

- (double)dockSize
{
  return AXSettingsReturnDoubleValue(CFSTR("DockSize"), *MEMORY[0x1E0CF3830]);
}

- (void)setDockSize:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("DockSize"));

}

- (double)zoomScale
{
  return AXSettingsReturnDoubleValue(CFSTR("ZoomScale"), *MEMORY[0x1E0CF3848]);
}

- (void)setZoomScale:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomScale"));

}

- (CGPoint)zoomPanOffset
{
  NSString *v2;
  NSString *v3;
  NSPoint v4;
  CGFloat x;
  CGFloat y;
  double v7;
  double v8;
  CGPoint result;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("ZoomPanOffset"));
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = NSPointFromString(v2);
    x = v4.x;
    y = v4.y;
  }
  else
  {
    x = *MEMORY[0x1E0C9D538];
    y = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v7 = x;
  v8 = y;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setZoomPanOffset:(CGPoint)a3
{
  id v4;

  NSStringFromPoint(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomPanOffset"));

}

- (CGPoint)zoomSlugNormalizedPosition
{
  void *v2;
  void *v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("ZoomSlugPosition"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (double *)objc_msgSend(objc_retainAutorelease(v2), "bytes");
    v5 = *v4;
    v6 = v4[1];
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v7 = v5;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setZoomSlugNormalizedPosition:(CGPoint)a3
{
  void *v4;
  CGPoint v5;

  v5 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v5, 16);
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomSlugPosition"), *(_QWORD *)&v5.x, *(_QWORD *)&v5.y);

}

- (NSString)zoomCurrentLensEffect
{
  void *v2;
  uint64_t v3;

  v2 = (void *)*MEMORY[0x1E0CF3898];
  v3 = objc_opt_class();
  return (NSString *)AXSettingsReturnObjectValueWithClass(CFSTR("ZoomCurrentLensEffect"), v2, v3);
}

- (void)setZoomCurrentLensEffect:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("ZoomCurrentLensEffect"));
}

- (BOOL)zoomShowedBanner
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomShowedBanner"), 0);
}

- (void)setZoomShowedBanner:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomShowedBanner"));

}

- (BOOL)zoomInStandby
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomInStandby"), 1);
}

- (void)setZoomInStandby:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomInStandby"));

}

- (NSString)zoomCurrentLensMode
{
  void *v2;
  uint64_t v3;
  void *v4;

  AXZoomLensDefault();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  AXSettingsReturnObjectValueWithClass(CFSTR("ZoomCurrentLensMode"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setZoomCurrentLensMode:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("ZoomCurrentLensMode"));
}

- (BOOL)zoomShouldFollowFocus
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomShouldFollowFocus"), 1);
}

- (void)setZoomShouldFollowFocus:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomShouldFollowFocus"));

}

- (BOOL)zoomShouldShowSlug
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomShouldShowSlug"), 0);
}

- (void)setZoomShouldShowSlug:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomShouldShowSlug"));

}

- (BOOL)zoomPeekZoomEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomPeekZoomEnabled"), 1);
}

- (void)setZoomPeekZoomEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomPeekZoomEnabled"));

}

- (BOOL)zoomPeekZoomEverEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomPeekZoomEverEnabled"), 0);
}

- (void)setZoomPeekZoomEverEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomPeekZoomEverEnabled"));

}

- (int64_t)zoomSlugSingleTapAction
{
  return AXSettingsReturnIntegerValue(CFSTR("ZoomSlugSingleTapAction"), 1);
}

- (void)setZoomSlugSingleTapAction:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomSlugSingleTapAction"));

}

- (int64_t)zoomSlugDoubleTapAction
{
  return AXSettingsReturnIntegerValue(CFSTR("ZoomSlugDoubleTapAction"), 2);
}

- (void)setZoomSlugDoubleTapAction:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomSlugDoubleTapAction"));

}

- (int64_t)zoomSlugTripleTapAction
{
  return AXSettingsReturnIntegerValue(CFSTR("ZoomSlugTripleTapAction"), 0);
}

- (void)setZoomSlugTripleTapAction:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomSlugTripleTapAction"));

}

- (BOOL)zoomSlugTapAndSlideToAdjustZoomLevelEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomSlugTapAndSlideToAdjustZoomLevel"), 1);
}

- (void)setZoomSlugTapAndSlideToAdjustZoomLevelEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomSlugTapAndSlideToAdjustZoomLevel"));

}

- (BOOL)zoomAlwaysUseWindowedZoomForTyping
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomAlwaysUseWindowZoomForTyping"), 0);
}

- (void)setZoomAlwaysUseWindowedZoomForTyping:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomAlwaysUseWindowZoomForTyping"));

}

- (NSString)zoomPreferredCurrentLensMode
{
  int IsPad;
  void **v3;
  void *v4;
  uint64_t v5;

  IsPad = AXDeviceIsPad();
  v3 = (void **)MEMORY[0x1E0CF38A8];
  if (!IsPad)
    v3 = (void **)MEMORY[0x1E0CF38A0];
  v4 = *v3;
  v5 = objc_opt_class();
  return (NSString *)AXSettingsReturnObjectValueWithClass(CFSTR("ZoomPreferredLensMode"), v4, v5);
}

- (void)setZoomPreferredCurrentLensMode:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("ZoomPreferredLensMode"));
}

- (NSString)zoomPreferredCurrentDockPosition
{
  void *v2;
  uint64_t v3;

  v2 = (void *)*MEMORY[0x1E0CF3868];
  v3 = objc_opt_class();
  return (NSString *)AXSettingsReturnObjectValueWithClass(CFSTR("ZoomPreferredDockPosition"), v2, v3);
}

- (void)setZoomPreferredCurrentDockPosition:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("ZoomPreferredDockPosition"));
}

- (double)zoomPreferredMaximumZoomScale
{
  return AXSettingsReturnDoubleValue(CFSTR("ZoomPreferredMaximumZoomScale"), *MEMORY[0x1E0CF3840]);
}

- (void)setZoomPreferredMaximumZoomScale:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF38C8] > a3)
    a3 = *MEMORY[0x1E0CF38C8];
  if (a3 >= *MEMORY[0x1E0CF38B8])
    a3 = *MEMORY[0x1E0CF38B8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomPreferredMaximumZoomScale"));

}

- (NSOrderedSet)zoomPreferredLensModes
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  AXZoomUserSelectableLensModes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  AXSettingsReturnObjectValueWithClass(CFSTR("ZoomPreferredLensModes"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return (NSOrderedSet *)v4;
}

- (NSOrderedSet)zoomPreferredDockPositions
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  AXZoomDockPositions();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  AXSettingsReturnObjectValueWithClass(CFSTR("ZoomPreferredDockPositions"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return (NSOrderedSet *)v4;
}

- (void)setZoomPreferredLensModes:(id)a3
{
  id v4;

  objc_msgSend(a3, "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomPreferredLensModes"));

}

- (void)setZoomPreferredDockPositions:(id)a3
{
  id v4;

  objc_msgSend(a3, "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomPreferredDockPositions"));

}

- (double)zoomIdleSlugOpacity
{
  return AXSettingsReturnDoubleValue(CFSTR("ZoomIdleSlugOpacity"), *MEMORY[0x1E0CF3838]);
}

- (void)setZoomIdleSlugOpacity:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomIdleSlugOpacity"));

}

- (void)setZoomControllerColor:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomControllerColorPreference"));

}

- (int64_t)zoomControllerColor
{
  return AXSettingsReturnIntegerValue(CFSTR("ZoomControllerColorPreference"), 1);
}

- (BOOL)zoomShouldAllowFullscreenAutopanning
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomShouldAllowFullscreenAutopanning"), 1);
}

- (void)setZoomShouldAllowFullscreenAutopanning:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomShouldAllowFullscreenAutopanning"));

}

- (BOOL)zoomKeyboardShortcutsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomShouldUseKeyboardShortcutsPreference"), 1);
}

- (void)setZoomKeyboardShortcutsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomShouldUseKeyboardShortcutsPreference"));

}

- (BOOL)zoomAdjustZoomLevelKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomAdjustZoomLevelKeyboardShortcutEnabledPreference"), 1);
}

- (void)setZoomAdjustZoomLevelKbShortcutEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomAdjustZoomLevelKeyboardShortcutEnabledPreference"));

}

- (BOOL)zoomToggleZoomKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomToggleZoomKeyboardShortcutEnabledPreference"), 1);
}

- (void)setZoomToggleZoomKbShortcutEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomToggleZoomKeyboardShortcutEnabledPreference"));

}

- (BOOL)zoomPanZoomKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomPanZoomKeyboardShortcutEnabledPreference"), 1);
}

- (void)setZoomPanZoomKbShortcutEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomPanZoomKeyboardShortcutEnabledPreference"));

}

- (BOOL)zoomResizeZoomWindowKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomResizeZoomWindowKeyboardShortcutEnabledPreference"), 0);
}

- (void)setZoomResizeZoomWindowKbShortcutEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomResizeZoomWindowKeyboardShortcutEnabledPreference"));

}

- (BOOL)zoomSwitchZoomModeKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomSwitchZoomModeKeyboardShortcutEnabledPreference"), 0);
}

- (void)setZoomSwitchZoomModeKbShortcutEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomSwitchZoomModeKeyboardShortcutEnabledPreference"));

}

- (BOOL)zoomTempToggleZoomKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomTempToggleZoomKeyboardShortcutEnabledPreference"), 0);
}

- (void)setZoomTempToggleZoomKbShortcutEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomTempToggleZoomKeyboardShortcutEnabledPreference"));

}

- (BOOL)zoomScrollWheelKbShortcutEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomScrollWheelKeyboardShortcutEnabledPreference"), 0);
}

- (void)setZoomScrollWheelKbShortcutEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomScrollWheelKeyboardShortcutEnabledPreference"));

}

- (BOOL)zoomTrackpadGestureEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("kAXZoomTrackpadGestureEnabledPreference"), 0);
}

- (void)setZoomTrackpadGestureEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("kAXZoomTrackpadGestureEnabledPreference"));

}

- (BOOL)zoomAutopannerShouldPanWithAcceleration
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomAutopannerShouldPanWithAccelerationPreference"), 0);
}

- (void)setZoomAutopannerShouldPanWithAcceleration:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomAutopannerShouldPanWithAccelerationPreference"));

}

- (BOOL)zoomShowWhileMirroring
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomShowZoomWhileMirroringPreference"), 0);
}

- (void)setZoomShowWhileMirroring:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomShowZoomWhileMirroringPreference"));

}

- (void)zoomUserHadLegacyZoomEnabled:(BOOL *)a3 wasZoomedIn:(BOOL *)a4 withScale:(double *)a5
{
  CFStringRef *v8;
  void *v9;
  char v10;
  float v11;
  double v12;
  id v13;

  v8 = (CFStringRef *)MEMORY[0x1E0DDE330];
  v9 = (void *)CFPreferencesCopyAppValue(CFSTR("Zoomed"), (CFStringRef)*MEMORY[0x1E0DDE330]);
  v10 = objc_msgSend(v9, "BOOLValue");
  v13 = (id)CFPreferencesCopyAppValue(CFSTR("ZoomLevel"), *v8);

  objc_msgSend(v13, "floatValue");
  v12 = v11;
  if (*MEMORY[0x1E0CF38C8] > v12)
    v12 = *MEMORY[0x1E0CF38C8];
  if (a3)
    *a3 = v9 != 0;
  if (a4)
    *a4 = v10;
  if (a5)
    *a5 = v12;

}

- (BOOL)zoomDebugDisableZoomLensScaleTransform
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomDebugDisableZoomLensScaleTransform"), 0);
}

- (void)setZoomDebugDisableZoomLensScaleTransform:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomDebugDisableZoomLensScaleTransform"));

}

- (BOOL)zoomDebugShowExternalFocusRect
{
  return AXSettingsReturnBoolValue(CFSTR("ZoomDebugShowExternalFocusRectPreference"), 0);
}

- (void)setZoomDebugShowExternalFocusRect:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomDebugShowExternalFocusRectPreference"));

}

- (void)setGuidedAccessAXFeaturesEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("kAXSGuidedAccessAXFeaturesEnabled"));

}

- (BOOL)guidedAccessAXFeaturesEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("kAXSGuidedAccessAXFeaturesEnabled"), 0);
}

- (void)setGuidedAccessAllowsUnlockWithTouchID:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("GuidedAccessAllowsUnlockWithTouchID"));

}

- (BOOL)guidedAccessAllowsUnlockWithTouchID
{
  return AXSettingsReturnBoolValue(CFSTR("GuidedAccessAllowsUnlockWithTouchID"), 0);
}

- (NSString)guidedAccessToneIdentifierForTimeRestrictionEvents
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GuidedAccessToneIdentifierForTimeRestrictionEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_5;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)getTLToneManagerClass_softClass;
  v14 = getTLToneManagerClass_softClass;
  if (!getTLToneManagerClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getTLToneManagerClass_block_invoke;
    v10[3] = &unk_1E24C4AE0;
    v10[4] = &v11;
    __getTLToneManagerClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v5, "sharedToneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "toneWithIdentifierIsValid:", v3);

  if ((v7 & 1) == 0)
  {
LABEL_5:
    -[AXSettings guidedAccessDefaultToneIdentifierForTimeRestrictionEvents](self, "guidedAccessDefaultToneIdentifierForTimeRestrictionEvents");
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  return (NSString *)v3;
}

- (void)setGuidedAccessToneIdentifierForTimeRestrictionEvents:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("GuidedAccessToneIdentifierForTimeRestrictionEvent"));
}

- (NSString)guidedAccessDefaultToneIdentifierForTimeRestrictionEvents
{
  id *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (id *)getTLToneIdentifierNoneSymbolLoc_ptr;
  v8 = getTLToneIdentifierNoneSymbolLoc_ptr;
  if (!getTLToneIdentifierNoneSymbolLoc_ptr)
  {
    v3 = (void *)ToneLibraryLibrary();
    v2 = (id *)dlsym(v3, "TLToneIdentifierNone");
    v6[3] = (uint64_t)v2;
    getTLToneIdentifierNoneSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    -[AXSettings guidedAccessDefaultToneIdentifierForTimeRestrictionEvents].cold.1();
  return (NSString *)*v2;
}

- (BOOL)guidedAccessShouldSpeakForTimeRestrictionEvents
{
  return AXSettingsReturnBoolValue(CFSTR("GuidedAccessSpeakForTimeRestrictionEvent"), 0);
}

- (void)setGuidedAccessShouldSpeakForTimeRestrictionEvents:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("GuidedAccessSpeakForTimeRestrictionEvent"));

}

- (BOOL)guidedAccessOverrideIdleTime
{
  return AXSettingsReturnBoolValue(CFSTR("kAXSGuidedAccessOverrideIdleTimePreference"), 1);
}

- (int64_t)guidedAccessAutoLockTimeInSeconds
{
  return AXSettingsReturnIntegerValue(CFSTR("GuidedAccessAutoLockTimeInSeconds"), *MEMORY[0x1E0CF3520]);
}

- (void)setGuidedAccessAutoLockTimeInSeconds:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("GuidedAccessAutoLockTimeInSeconds"));

}

- (BOOL)guidedAccessAllowsMultipleWindows
{
  return 1;
}

- (BOOL)guidedAccessUserPrefersMirroringForExternalDisplays
{
  return AXSettingsReturnBoolValue(CFSTR("GuidedAccessUserPrefersMirroringForExternalDisplays"), 0);
}

- (void)setGuidedAccessUserPrefersMirroringForExternalDisplays:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("GuidedAccessUserPrefersMirroringForExternalDisplays"));

}

- (NSDictionary)gaxInternalSettingsUserAppProfile
{
  return (NSDictionary *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GAXInternalSettingUserAppProfile"));
}

- (void)setGaxInternalSettingsUserAppProfile:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("GAXInternalSettingUserAppProfile"));
}

- (NSDictionary)gaxInternalSettingsUserGlobalProfile
{
  return (NSDictionary *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GAXInternalSettingUserGlobalProfile"));
}

- (void)setGaxInternalSettingsUserGlobalProfile:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("GAXInternalSettingUserGlobalProfile"));
}

- (NSDictionary)gaxInternalSettingsSavedAccessibilityFeatures
{
  return (NSDictionary *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GAXGlobalProfileSavedAXFeatures"));
}

- (void)setGaxInternalSettingsSavedAccessibilityFeatures:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("GAXGlobalProfileSavedAXFeatures"));
}

- (NSArray)gaxInternalSettingsSavedAccessibilityTripleClickOptions
{
  return (NSArray *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GAXGlobalProfileSavedAXTripleClickOptions"));
}

- (void)setGaxInternalSettingsSavedAccessibilityTripleClickOptions:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("GAXGlobalProfileSavedAXTripleClickOptions"));
}

- (NSArray)gaxInternalSettingsUserConfiguredAppIDs
{
  return (NSArray *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GAXGlobalProfileUserConfiguredAppIds"));
}

- (void)setGaxInternalSettingsUserConfiguredAppIDs:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("GAXGlobalProfileUserConfiguredAppIds"));
}

- (NSNumber)gaxInternalSettingsActiveAppOrientation
{
  return (NSNumber *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GAXGlobalProfileActiveAppOrientation"));
}

- (void)setGaxInternalSettingsActiveAppOrientation:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("GAXGlobalProfileActiveAppOrientation"));
}

- (NSString)gaxInternalSettingsActiveAppID
{
  return (NSString *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GAXGlobalProfileActiveAppID"));
}

- (void)setGaxInternalSettingsActiveAppID:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("GAXGlobalProfileActiveAppID"));
}

- (BOOL)gaxInternalSettingsTimeRestrictionHasExpired
{
  return AXSettingsReturnBoolValue(CFSTR("GAXInternalSettingTimeRestrictionHasExpired"), 0);
}

- (void)setGaxInternalSettingsTimeRestrictionHasExpired:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("GAXInternalSettingTimeRestrictionHasExpired"));

}

- (BOOL)gaxInternalSettingsIsActiveAppSelfLocked
{
  return AXSettingsReturnBoolValue(CFSTR("AXGAXInternalSettingIsActiveAppSelfLocked"), 0);
}

- (void)setGaxInternalSettingsIsActiveAppSelfLocked:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXGAXInternalSettingIsActiveAppSelfLocked"));

}

- (BOOL)gaxInternalSettingsSystemDidRestartDueToLowBattery
{
  return AXSettingsReturnBoolValue(CFSTR("GAXGlobalProfileSystemDidRestartDueToLowBattery"), 0);
}

- (void)setGaxInternalSettingsSystemDidRestartDueToLowBattery:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("GAXGlobalProfileSystemDidRestartDueToLowBattery"));

}

- (NSNumber)gaxInternalSettingsECID
{
  return (NSNumber *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GAXGlobalProfileECID"));
}

- (void)setGaxInternalSettingsECID:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("GAXGlobalProfileECID"));
}

- (NSString)gaxInternalSettingsProductBuildVersion
{
  return (NSString *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GAXGlobalProfileProductBuildVersion"));
}

- (void)setGaxInternalSettingsProductBuildVersion:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("GAXGlobalProfileProductBuildVersion"));
}

- (NSDate)gaxInternalSettingsLastActivationDate
{
  return (NSDate *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GAXGlobalProfileLastActivationDate"));
}

- (void)setGaxInternalSettingsLastActivationDate:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("GAXGlobalProfileLastActivationDate"));
}

- (NSDate)gaxInternalSettingsLastPasscodeSetDate
{
  return (NSDate *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GAXGlobalProfileLastPasscodeSetDate"));
}

- (void)setGaxInternalSettingsLastPasscodeSetDate:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("GAXGlobalProfileLastPasscodeSetDate"));
}

- (void)setAssistiveTouchCameraSwitchPreviewEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchCameraSwitchPreviewEnabledPreference"));

}

- (BOOL)assistiveTouchCameraSwitchPreviewEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchCameraSwitchPreviewEnabledPreference"), 0);
}

- (void)setAssistiveTouchInternalOnlyHiddenNubbitModeEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchInternalOnlyHiddenNubbitModeEnabledPreference"));

}

- (BOOL)assistiveTouchInternalOnlyHiddenNubbitMode
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchInternalOnlyHiddenNubbitModeEnabledPreference"), 0);
}

- (void)setAssistiveTouchInternalOnlyPearlTrackingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchInternalOnlyPearlTrackingEnabledPreference"));

}

- (BOOL)assistiveTouchInternalOnlyPearlTrackingEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchInternalOnlyPearlTrackingEnabledPreference"), 0);
}

- (void)setValidateSecondPartyApps:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ValidateSecondPartyApps"));

}

- (BOOL)validateSecondPartyApps
{
  return AXSettingsReturnBoolValue(CFSTR("ValidateSecondPartyApps"), 0);
}

- (void)setIncludeBacktraceInLogs:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("IncludeBacktraceInLogs"));

}

- (BOOL)includeBacktraceInLogs
{
  return AXSettingsReturnBoolValue(CFSTR("IncludeBacktraceInLogs"), 0);
}

- (BOOL)ignoreAXAsserts
{
  return AXSettingsReturnBoolValue(CFSTR("IgnoreAXAsserts"), 0);
}

- (void)setIgnoreAXAsserts:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("IgnoreAXAsserts"));

}

- (BOOL)ignoreAXServerEntitlements
{
  return AXSettingsReturnBoolValue(CFSTR("IgnoreAXServerEntitlements"), 0);
}

- (void)setIgnoreAXServerEntitlements:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("IgnoreAXServerEntitlements"));

}

- (BOOL)logAXNotificationPosting
{
  return AXSettingsReturnBoolValue(CFSTR("LogAXNotificationPosting"), 0);
}

- (void)setLogAXNotificationPosting:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("LogAXNotificationPosting"));

}

- (BOOL)useNewAXBundleLoader
{
  return AXSettingsReturnBoolValue(CFSTR("UseNewAXBundleLoader"), 1);
}

- (void)setUseNewAXBundleLoader:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("UseNewAXBundleLoader"));

}

- (void)setShouldPerformValidationsAtRuntime:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("shouldPerformValidationsAtRuntime"));

}

- (void)setInternalLoggingColorTheme:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("InternalLoggingColorThemePreference"));

}

- (int64_t)internalLoggingColorTheme
{
  void *v2;
  int64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("InternalLoggingColorThemePreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (void)setEnableVoiceOverCaptions:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverCaptionPanelEnabled"));

}

- (BOOL)enableVoiceOverCaptions
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverCaptionPanelEnabled"), 0);
}

- (void)setSyncPronunciationsWithCloudKit:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverPronunciationCloudKitSyncingEnabled"));

}

- (BOOL)syncPronunciationsWithCloudKit
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverPronunciationCloudKitSyncingEnabled"), 0);
}

- (void)setDidTriggerSOSToday:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSDidTriggerSOSToday"));

}

- (BOOL)didTriggerSOSToday
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v2 = objc_opt_class();
  AXSettingsReturnObjectValueWithClass(CFSTR("AXSDidTriggerSOSToday"), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:toDate:options:", 16, v3, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "day") < 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)voiceOverFlashlightNotificationsEnabled
{
  int v2;

  v2 = MGGetBoolAnswer();
  if (v2)
    LOBYTE(v2) = AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverFlashlightNotificationsEnabled"), 1);
  return v2;
}

- (void)setVoiceOverFlashlightNotificationsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverFlashlightNotificationsEnabled"));

}

- (BOOL)voiceOverShowBrailleWatchSettings
{
  return _os_feature_enabled_impl();
}

- (double)voiceOverDelayUntilSpeakUnderTouch
{
  return AXSettingsReturnDoubleValue((void *)kAXSVoiceOverDelayUntilSpeakUnderTouch, 0.0);
}

- (void)setVoiceOverDelayUntilSpeakUnderTouch:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSVoiceOverDelayUntilSpeakUnderTouch);

}

- (BOOL)shouldCaptureVisionEngineDiagnosticsToDisk
{
  return AXSettingsReturnBoolValue(CFSTR("VisionEngineCaptureDiagnosticsToDisk"), 0);
}

- (void)setShouldCaptureVisionEngineDiagnosticsToDisk:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VisionEngineCaptureDiagnosticsToDisk"));

}

- (BOOL)automaticAccessibilityEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AutomaticAccessibilityEnabled"), 0);
}

- (void)setAutomaticAccessibilityEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AutomaticAccessibilityEnabled"));

}

- (BOOL)automaticAccessibilityIgnoreAppAccessibilityPreferred
{
  return 1;
}

- (void)setAutomaticAccessibilityIgnoreAppAccessibilityPreferred:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AutomaticAccessibilityIgnoreAppAccessibilityPreferred"));

}

- (BOOL)automaticAccessibilityVisualizationsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AutomaticAccessibilityVisualizationsEnabled"), 0);
}

- (void)setAutomaticAccessibilityVisualizationsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AutomaticAccessibilityVisualizationsEnabled"));

}

- (id)automaticAccessibilityModes
{
  uint64_t v2;

  v2 = objc_opt_class();
  return AXSettingsReturnObjectValueWithClass(CFSTR("AutomaticAccessibilityModes"), 0, v2);
}

- (void)setAutomaticAccessibilityModes:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AutomaticAccessibilityModes"));
}

- (int64_t)automaticAccessibilityModeForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[AXSettings automaticAccessibilityModes](self, "automaticAccessibilityModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = 0;

  return v7;
}

- (void)setAutomaticAccessibilityMode:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v6 = a4;
  -[AXSettings automaticAccessibilityModes](self, "automaticAccessibilityModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, v6);

  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v12, CFSTR("AutomaticAccessibilityModes"));
}

- (id)voiceOverSelectedActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSVoiceOverSelectedActivityPreference"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AXSettings voiceOverActivities](self, "voiceOverActivities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__AXSettings_voiceOverSelectedActivity__block_invoke;
    v8[3] = &unk_1E24C87B0;
    v9 = v3;
    objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __39__AXSettings_voiceOverSelectedActivity__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 32));
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)setVoiceOverSelectedActivity:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverSelectedActivityPreference"));

}

- (BOOL)securePayAssertionActive
{
  return AXSettingsReturnBoolValue(CFSTR("AXSSecurePayAssertionActive"), 0);
}

- (void)setSecurePayAssertionActive:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSSecurePayAssertionActive"));

}

- (void)setLiveRegionStatusForWebOrApp:(id)a3 status:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSVoiceOverLiveRegionAppStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v8, CFSTR("AXSVoiceOverLiveRegionAppStatus"));

}

- (BOOL)liveRegionStatusEverSet
{
  void *v2;
  BOOL v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSVoiceOverLiveRegionAppStatus"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)liveRegionStatusForWebOrApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSVoiceOverLiveRegionAppStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setVoiceOverKeyboardModifierChoice:(int64_t)a3
{
  id v5;

  if ((a3 & 3) == 0)
    _AXAssert();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("AXSVoiceOverKeyboardModifierChoicePreference"));

}

- (int64_t)voiceOverKeyboardModifierChoice
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverKeyboardModifierChoicePreference"), 1);
}

- (void)setSkipHearingAidMFiAuth:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("InternalSkipHearingAidMFiAuth"));

}

- (BOOL)skipHearingAidMFiAuth
{
  return AXSettingsReturnBoolValue(CFSTR("InternalSkipHearingAidMFiAuth"), 0);
}

- (void)setEnableHearingAidReporter:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("InternalEnableHearingAidReporter"));

}

- (BOOL)enableHearingAidReporter
{
  return AXSettingsReturnBoolValue(CFSTR("InternalEnableHearingAidReporter"), 0);
}

- (BOOL)guidedAccessDisallowDirectInactiveToActiveTransition
{
  return AXSettingsReturnBoolValue(CFSTR("AXSInternalGuidedAccessDisallowDirectInactiveToActiveTransition"), 0);
}

- (void)setGuidedAccessDisallowDirectInactiveToActiveTransition:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSInternalGuidedAccessDisallowDirectInactiveToActiveTransition"));

}

- (NSNumber)guidedAccessOverrideTimeRestrictionDuration
{
  return (NSNumber *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSInternalGuidedAccessOverrideTimeRestrictionDuration"));
}

- (void)setGuidedAccessOverrideTimeRestrictionDuration:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSInternalGuidedAccessOverrideTimeRestrictionDuration"));
}

- (BOOL)guidedAccessEnableExperimentalUI
{
  return AXSettingsReturnBoolValue(CFSTR("AXSInternalGuidedAccessEnableExperimentalUI"), 0);
}

- (void)setGuidedAccessEnableExperimentalUI:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSInternalGuidedAccessEnableExperimentalUI"));

}

- (void)setClassicInvertColors:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  _AXSClassicInvertColorsSetEnabled();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("AXSClassicInvertColorsPreference"));

}

- (BOOL)classicInvertColors
{
  return _AXSClassicInvertColorsEnabled() != 0;
}

- (void)setTripleClickOrderedOptions:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSTripleClickUserOrderedPreference"));
}

- (NSArray)tripleClickOrderedOptions
{
  uint64_t v2;

  v2 = objc_opt_class();
  return (NSArray *)AXSettingsReturnObjectValueWithClass(CFSTR("AXSTripleClickUserOrderedPreference"), 0, v2);
}

- (void)setSpeakCorrectionsEnabled:(BOOL)a3
{
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("SpeakCorrectionsEnabled"));

  if (a3)
  {
    _AXSSetAccessibilityEnabled();
  }
  else
  {
    v6 = 0;
    if (MEMORY[0x18D785604](*MEMORY[0x1E0DDE270], &v6))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      _AXSAccessibilitySetiTunesPreference();
    }
  }
}

- (BOOL)letterFeedbackEnabled
{
  return _AXSLetterFeedbackEnabled() != 0;
}

- (void)setLetterFeedbackEnabled:(BOOL)a3
{
  _AXSSetLetterFeedbackEnabled();
}

- (BOOL)phoneticFeedbackEnabled
{
  return _AXSPhoneticFeedbackEnabled() != 0;
}

- (void)setPhoneticFeedbackEnabled:(BOOL)a3
{
  _AXSSetPhoneticFeedbackEnabled();
}

- (double)characterFeedbackDelayDuration
{
  return AXSettingsReturnDoubleValue(CFSTR("CharacterFeedbackDelayPreference"), *MEMORY[0x1E0CF3C00]);
}

- (void)setCharacterFeedbackDelayDuration:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3BF8] < a3)
    a3 = *MEMORY[0x1E0CF3BF8];
  if (*MEMORY[0x1E0CF3C00] >= a3)
    a3 = *MEMORY[0x1E0CF3C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("CharacterFeedbackDelayPreference"));

}

- (BOOL)quickTypeWordFeedbackEnabled
{
  return _AXSQuickTypePredictionFeedbackEnabled() != 0;
}

- (void)setQuickTypeWordFeedbackEnabled:(BOOL)a3
{
  _AXSSetQuickTypePredictionFeedbackEnabled();
}

- (BOOL)wordFeedbackEnabled
{
  return _AXSWordFeedbackEnabled() != 0;
}

- (void)setWordFeedbackEnabled:(BOOL)a3
{
  _AXSSetWordFeedbackEnabled();
}

- (void)setShowSpeechController:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ShowSpeechController"));

}

- (BOOL)showSpeechController
{
  return AXSettingsReturnBoolValue(CFSTR("ShowSpeechController"), 0);
}

- (void)setSpeechControllerIdleOpacity:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SpeechControllerIdleOpacity"));

}

- (double)speechControllerIdleOpacity
{
  return AXSettingsReturnDoubleValue(CFSTR("SpeechControllerIdleOpacity"), 0.35);
}

- (void)setSpeechControllerLongPressAction:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SpeechControllerLongPressAction"));

}

- (int64_t)speechControllerLongPressAction
{
  return AXSettingsReturnIntegerValue(CFSTR("SpeechControllerLongPressAction"), 1);
}

- (void)setSpeechControllerDoubleTapAction:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SpeechControllerDoubleTapAction"));

}

- (int64_t)speechControllerDoubleTapAction
{
  return AXSettingsReturnIntegerValue(CFSTR("SpeechControllerDoubleTapAction"), 2);
}

- (float)quickSpeakVolume
{
  void *v2;
  float v3;
  float v4;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("QuickSpeakVolume"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "floatValue");
    v3 = v4;
  }

  return v3;
}

- (void)setQuickSpeakVolume:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("QuickSpeakVolume"));

}

- (BOOL)quickSpeakUnderlineSentence
{
  return AXSettingsReturnBoolValue(CFSTR("QuickSpeakUnderlineSentence"), 0);
}

- (void)setQuickSpeakUnderlineSentence:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("QuickSpeakUnderlineSentence"));

}

- (void)setQuickSpeakSpeakingRate:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("QuickSpeakRate"));

}

- (float)quickSpeakSpeakingRate
{
  void *v2;
  float v3;
  float v4;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("QuickSpeakRate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0.5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "floatValue");
    v3 = v4;
  }

  return v3;
}

- (void)setQuickSpeakSentenceHighlightOption:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("QuickSpeakSentenceHighlight"));

}

- (unint64_t)quickSpeakSentenceHighlightOption
{
  void *v2;
  unint64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("QuickSpeakSentenceHighlight"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 1;

  return v3;
}

- (int64_t)quickSpeakWordHighlightColor
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSQuickSpeakWordHighlightColorPreference"), 0);
}

- (void)setQuickSpeakWordHighlightColor:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSQuickSpeakWordHighlightColorPreference"));

}

- (int64_t)quickSpeakSentenceHighlightColor
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSQuickSpeakSentenceHighlightColorPreference"), 0);
}

- (void)setQuickSpeakSentenceHighlightColor:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSQuickSpeakSentenceHighlightColorPreference"));

}

- (void)setQuickSpeakHighlightOption:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("QuickSpeakHighlightChoice"));

}

- (unint64_t)quickSpeakHighlightOption
{
  void *v2;
  unint64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("QuickSpeakHighlightChoice"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 3;

  return v3;
}

- (id)speechVoiceIdentifierForLanguageWithoutFallback:(id)a3 sourceKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SpeechVoiceIdentifierForLanguage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)liveSpeechVoiceIdentifierForKeyboardID:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__12;
  v18 = __Block_byref_object_dispose__12;
  v19 = 0;
  v5 = dispatch_semaphore_create(0);
  -[AXSettings swiftSettings](self, "swiftSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "liveSpeech");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__AXSettings_liveSpeechVoiceIdentifierForKeyboardID___block_invoke;
  v11[3] = &unk_1E24C87D8;
  v13 = &v14;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v7, "speechVoiceIdentifierForKeyboard:completionHandler:", v4, v11);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __53__AXSettings_liveSpeechVoiceIdentifierForKeyboardID___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (int64_t)liveSpeechMaxRecentsCount
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSliveSpeechMaxRecentsCountPreference"), 1);
}

- (void)setliveSpeechMaxRecentsCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSliveSpeechMaxRecentsCountPreference"));

}

- (id)speechVoiceIdentifierForLanguage:(id)a3 source:(int64_t)a4 exists:(BOOL *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a3;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%d"), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings speechVoiceIdentifierForLanguage:sourceKey:exists:](self, "speechVoiceIdentifierForLanguage:sourceKey:exists:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __64__AXSettings_speechVoiceIdentifierForLanguage_sourceKey_exists___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)userDidSelectVoiceForLanguage:(id)a3 sourceKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C89B88], "currentLanguageCode");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  AXCRemapLanguageCodeToFallbackIfNeccessary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("UserDidSelectVoiceForLanguage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  return v12;
}

- (id)customSettingsForVoice:(id)a3 sourceKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SpeechCustomVoiceSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setCustomSettingsForVoice:(id)a3 sourceKey:(id)a4 settings:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a5;
  v9 = a4;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SpeechCustomVoiceSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = (void *)MEMORY[0x1E0C9AA70];
  v12 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v12, "objectForKeyedSubscript:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v19);

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v19);

  v17 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v12, "objectForKeyedSubscript:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v9);

  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v12, CFSTR("SpeechCustomVoiceSettings"));
}

- (void)setSpeechVoiceIdentifier:(id)a3 forLanguage:(id)a4 source:(int64_t)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%d"), a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[AXSettings setSpeechVoiceIdentifier:forLanguage:sourceKey:](self, "setSpeechVoiceIdentifier:forLanguage:sourceKey:", v10, v9, v11);

}

- (void)setSpeechVoiceIdentifier:(id)a3 forLanguage:(id)a4 sourceKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  dispatch_semaphore_t v16;
  dispatch_semaphore_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  dispatch_semaphore_t v23;
  _QWORD v24[4];
  dispatch_semaphore_t v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  AXLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_18C62B000, v11, OS_LOG_TYPE_INFO, "AXSettings: Updating selected voice identifier: %@, language: %@, key: %@", buf, 0x20u);
  }

  if (v9 && (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CF37E8]) & 1) == 0)
  {
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CF37F0]))
    {
      v12 = dispatch_semaphore_create(0);
      -[AXSettings swiftSettings](self, "swiftSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "voiceover");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __61__AXSettings_setSpeechVoiceIdentifier_forLanguage_sourceKey___block_invoke;
      v24[3] = &unk_1E24C4C38;
      v25 = v12;
      v15 = v12;
      objc_msgSend(v14, "setWithVoiceId:forLanguage:completionHandler:", v8, v9, v24);

      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      v16 = v25;
    }
    else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CF37D8]))
    {
      v17 = dispatch_semaphore_create(0);
      -[AXSettings swiftSettings](self, "swiftSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "spokenContent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __61__AXSettings_setSpeechVoiceIdentifier_forLanguage_sourceKey___block_invoke_2;
      v22[3] = &unk_1E24C4C38;
      v23 = v17;
      v15 = v17;
      objc_msgSend(v19, "setWithVoiceId:forLanguage:completionHandler:", v8, v9, v22);

      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      v16 = v23;
    }
    else
    {
      -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SpeechVoiceIdentifierForLanguage"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v20, "mutableCopy");

      if (!v15)
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      -[NSObject objectForKey:](v15, "objectForKey:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (dispatch_semaphore_t)objc_msgSend(v21, "mutableCopy");

      if (!v16)
      {
        v16 = (dispatch_semaphore_t)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
        -[NSObject setObject:forKey:](v15, "setObject:forKey:", v16, v10);
      }
      if (v8)
        -[NSObject setObject:forKey:](v16, "setObject:forKey:", v8, v9);
      else
        -[NSObject removeObjectForKey:](v16, "removeObjectForKey:", v9);
      -[NSObject setObject:forKey:](v15, "setObject:forKey:", v16, v10);
      -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v15, CFSTR("SpeechVoiceIdentifierForLanguage"));
    }

  }
}

intptr_t __61__AXSettings_setSpeechVoiceIdentifier_forLanguage_sourceKey___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __61__AXSettings_setSpeechVoiceIdentifier_forLanguage_sourceKey___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setUserDidSelectVoiceForLanguage:(id)a3 sourceKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11 && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CF37E8]) & 1) == 0)
  {
    -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("UserDidSelectVoiceForLanguage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if (!v8)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (!v10)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      objc_msgSend(v8, "setObject:forKey:", v10, v6);
    }
    objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v11);
    objc_msgSend(v8, "setObject:forKey:", v10, v6);
    -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v8, CFSTR("UserDidSelectVoiceForLanguage"));

  }
}

- (id)selectedSpeechVoiceIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SpeechVoiceIdentifierForLanguage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v10, "allValues", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++));
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)selectedSpeechVoiceIdentifiersWithLanguageSource
{
  return -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SpeechVoiceIdentifierForLanguage"));
}

- (void)setSelectedSpeechVoiceIdentifiersWithLanguageSource:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SpeechVoiceIdentifierForLanguage"));
}

- (id)selectedSpeechVoiceIdentifiersForSourceKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SpeechVoiceIdentifierForLanguage"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v9), "isEqualToString:", v4))
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v10, "allValues");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v21;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v21 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15++));
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v13);
          }

        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)spokenContentShouldUseLanguageDetection
{
  return AXSettingsReturnBoolValue(CFSTR("SpokenContentShouldUseLanguageDetection"), 1);
}

- (void)setSpokenContentShouldUseLanguageDetection:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SpokenContentShouldUseLanguageDetection"));

}

- (NSString)spokenContentDefaultFallbackLanguage
{
  return (NSString *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SpokenContentDefaultFallbackLanguage"));
}

- (void)setSpokenContentDefaultFallbackLanguage:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SpokenContentDefaultFallbackLanguage"));
}

- (void)_clearWhitetailMigrationSettings
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("AssistiveTouchScannerPrefersCompactForLanguagePreference"));
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("AssistiveTouchScannerAlternativeVoiceForLanguagePreference"));
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("AXSAssistiveTouchDefaultDialectPreference"));
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("QuickSpeakPrefersCompactForLanguage"));
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("QuickSpeakAlternativeVoiceForLanguage"));
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("AXSVoiceOverCompactVoicePreference"));
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("VoiceOverTouchPitchCompactVoice"));
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("AXSVoiceOverAlternativeVoicesPreference"));
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("com.apple.voiceovertouch.default.dialect"));
}

- (id)_voiceOverDefaultDialect
{
  return -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("com.apple.voiceovertouch.default.dialect"));
}

- (id)_switchControlScannerDefaultDialect
{
  return -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSAssistiveTouchDefaultDialectPreference"));
}

- (id)_switchControlPrefersCompact
{
  return -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AssistiveTouchScannerPrefersCompactForLanguagePreference"));
}

- (id)_switchControlAltVoices
{
  return -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AssistiveTouchScannerAlternativeVoiceForLanguagePreference"));
}

- (id)_voiceOverAlternativeVoiceIdentifiers
{
  return -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSVoiceOverAlternativeVoicesPreference"));
}

- (id)_voiceOverPrefersCompactByLanguage
{
  return -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSVoiceOverCompactVoicePreference"));
}

- (id)_quickSpeakPrefersCompact
{
  return -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("QuickSpeakPrefersCompactForLanguage"));
}

- (id)_quickSpeakAltVoices
{
  void *v2;
  void *v3;

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForPreferenceKey:", CFSTR("QuickSpeakAlternativeVoiceForLanguage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_quickSpeakSpeakingRateLanguages
{
  return -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("QuickSpeakLanguageSpeakingRate"));
}

- (void)setQuickSpeakSpeakingRate:(float)a3 forLanguage:(id)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  if (a4)
  {
    v6 = a4;
    -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("QuickSpeakLanguageSpeakingRate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v7, "mutableCopy");

    if (!v10)
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    *(float *)&v8 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v6);

    -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v10, CFSTR("QuickSpeakLanguageSpeakingRate"));
  }
}

- (float)quickSpeakSpeakingRateForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v12;

  v4 = a3;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("QuickSpeakLanguageSpeakingRate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      if (v7 == 3.4028e38
        || (objc_msgSend(v6, "floatValue"), v8 >= *MEMORY[0x1E0C899B8])
        && (objc_msgSend(v6, "floatValue"), v9 <= *MEMORY[0x1E0C899A0]))
      {
        objc_msgSend(v6, "floatValue");
        v10 = v12;
        goto LABEL_8;
      }
      -[AXSettings _removeSpeakingRatePreferenceForLanguage:](self, "_removeSpeakingRatePreferenceForLanguage:", v4);
    }
  }
  v10 = 3.4028e38;
LABEL_8:

  return v10;
}

- (void)_removeSpeakingRatePreferenceForLanguage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("QuickSpeakLanguageSpeakingRate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObjectForKey:", v4);
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, CFSTR("QuickSpeakLanguageSpeakingRate"));

}

- (BOOL)siriAutoUpdateListInitialized
{
  void *v2;
  char v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SiriAutoUpdateListInitializedPreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSiriAutoUpdateListInitialized:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SiriAutoUpdateListInitializedPreference"));

}

- (void)setQuickSpeakNubbitNormalizedPosition:(CGPoint)a3
{
  id v4;

  NSStringFromPoint(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("QuickSpeakNubbitNormalizedPosition"));

}

- (CGPoint)quickSpeakNubbitNormalizedPosition
{
  NSString *v2;
  NSString *v3;
  NSPoint v4;
  CGFloat x;
  CGFloat y;
  double v7;
  double v8;
  CGPoint result;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("QuickSpeakNubbitNormalizedPosition"));
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = NSPointFromString(v2);
    x = v4.x;
    y = v4.y;
  }
  else
  {
    x = 0.0;
    y = 0.2;
  }

  v7 = x;
  v8 = y;
  result.y = v8;
  result.x = v7;
  return result;
}

- (NSArray)customPronunciationSubstitutions
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", kAXSCustomPronunciationSubstitutionsPreference);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v3 = (void *)MEMORY[0x1E0CB3710],
        v4 = objc_opt_class(),
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class()),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "secureUnarchiveData:withExpectedClass:otherAllowedClasses:", v2, v4, v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v6;
}

- (void)setCustomPronunciationSubstitutions:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSCustomPronunciationSubstitutionsPreference);

}

- (void)setVoiceOverPunctuationGroup:(id)a3
{
  id v4;

  objc_msgSend(a3, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverPunctuationGroupPreference"));

}

- (NSUUID)voiceOverPunctuationGroup
{
  void *v2;
  void *v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSVoiceOverPunctuationGroupPreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);
  else
    v3 = 0;

  return (NSUUID *)v3;
}

- (void)setVoiceOverPunctuationLevel:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverPunctuationLevelPreference"));

}

- (int64_t)voiceOverPunctuationLevel
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverPunctuationLevelPreference"), 1);
}

- (void)setVoiceOverLinkFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverLinkFeedbackPreference"));

}

- (int64_t)voiceOverLinkFeedback
{
  int64_t result;

  result = AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverLinkFeedbackPreference"), 18);
  if (!result)
    return 18;
  return result;
}

- (void)setVoiceOverInlineTextCompletionAppearanceFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("kAXSVoiceOverInlineTextCompletionAppearanceFeedbackPreference"));

}

- (int64_t)voiceOverInlineTextCompletionAppearanceFeedback
{
  int64_t result;

  result = AXSettingsReturnIntegerValue(CFSTR("kAXSVoiceOverInlineTextCompletionAppearanceFeedbackPreference"), 6);
  if (!result)
    return 6;
  return result;
}

- (void)setVoiceOverInlineTextCompletionInsertionFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("kAXSVoiceOverInlineTextCompletionInsertionFeedbackPreference"));

}

- (int64_t)voiceOverInlineTextCompletionInsertionFeedback
{
  int64_t result;

  result = AXSettingsReturnIntegerValue(CFSTR("kAXSVoiceOverInlineTextCompletionInsertionFeedbackPreference"), 10);
  if (!result)
    return 10;
  return result;
}

- (void)setVoiceOverDeletionFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverDeletionFeedbackPreference"));

}

- (int64_t)voiceOverDeletionFeedback
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverDeletionFeedbackPreference"), 1);
}

- (void)setVoiceOverCapitalLetterFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverCapitalLetterFeedbackPreference"));

}

- (int64_t)voiceOverCapitalLetterFeedback
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverCapitalLetterFeedbackPreference"), 0);
}

- (void)setVoiceOverRotorSummaryFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverRotorSummaryFeedbackPreference"));

}

- (int64_t)voiceOverRotorSummaryFeedback
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverRotorSummaryFeedbackPreference"), 2);
}

- (void)setVoiceOverMoreContentOutputFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverMoreContentOutputFeedbackPreference"));

}

- (int64_t)voiceOverMoreContentOutputFeedback
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverMoreContentOutputFeedbackPreference"), 1);
}

- (void)setVoiceOverContainerOutputFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverContainerOutputFeedbackPreference"));

}

- (int64_t)voiceOverContainerOutputFeedback
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverContainerOutputFeedbackPreference"), 26);
}

- (void)setVoiceOverActionsFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverActionsFeedbackPreference"));

}

- (int64_t)voiceOverActionsFeedback
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverActionsFeedbackPreference"), 18);
}

- (void)setVoiceOverActionFeedbackFirstInListOnly:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverFirstInListOnlyActionsFeedback"));

}

- (BOOL)voiceOverActionFeedbackFirstInListOnly
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverFirstInListOnlyActionsFeedback"), 0);
}

- (void)setVoiceOverDiscoveredSensitiveContentFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverDiscoveredSensitiveContentFeedback"));

}

- (int64_t)voiceOverDiscoveredSensitiveContentFeedback
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverDiscoveredSensitiveContentFeedback"), 0);
}

- (void)setVoiceOverTouchSingleLetterQuickNavEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverTouchSingleLetterQuickNavPreference"));

}

- (BOOL)voiceOverTouchSingleLetterQuickNavEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverTouchSingleLetterQuickNavPreference"), 0);
}

- (void)setVoiceOverQuickNavAnnouncementFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverQuickNavAnnouncementFeedback"));

}

- (int64_t)voiceOverQuickNavAnnouncementFeedback
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverQuickNavAnnouncementFeedback"), 4);
}

- (BOOL)voiceOverSpeaksOverTelephoneCalls
{
  return 0;
}

- (void)setVoiceOverSpeaksOverTelephoneCalls:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverSpeaksOverTelephoneCalls"));

}

- (BOOL)voiceOverSpeakTableHeaders
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverSpeakTableHeadersPreference"), 1);
}

- (void)setVoiceOverSpeakTableHeaders:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverSpeakTableHeadersPreference"));

}

- (BOOL)voiceOverSpeakTableColumnRowInformation
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverSpeakTableColumnRowInformationPreference"), 1);
}

- (void)setVoiceOverSpeakTableColumnRowInformation:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverSpeakTableColumnRowInformationPreference"));

}

- (void)setVoiceOverHelpMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTouchHelpModePreference"));

}

- (int64_t)voiceOverHelpMode
{
  void *v2;
  int64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverTouchHelpModePreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (void)setVoiceOverNavigateImagesOption:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("NavigateImagesPreference"));

}

- (int64_t)voiceOverNavigateImagesOption
{
  void *v2;
  int64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("NavigateImagesPreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 1;

  return v3;
}

- (void)setVoiceOverPhoneticsFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTouchPhoneticsEnabledPreference"));

}

- (int64_t)voiceOverPhoneticsFeedback
{
  void *v2;
  int64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverTouchPhoneticsEnabledPreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 1;

  return v3;
}

- (void)setVoiceOverHardwareTypingFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTouchTypingHardwareFeedback"));

}

- (int64_t)voiceOverHardwareTypingFeedback
{
  void *v2;
  int64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverTouchTypingHardwareFeedback"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 2;

  return v3;
}

- (void)setVoiceOverSoftwareTypingFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTouchTypingFeedback"));

}

- (int64_t)voiceOverSoftwareTypingFeedback
{
  void *v2;
  int64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverTouchTypingFeedback"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 2;

  return v3;
}

- (void)setVoiceOverBrailleGesturesTypingFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTouchTypingBrailleGesturesFeedback"));

}

- (int64_t)voiceOverBrailleGesturesTypingFeedback
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverTouchTypingBrailleGesturesFeedback"), 2);
}

- (void)setVoiceOverActivationWorkaround:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VOActivationWorkaround"));

}

- (int64_t)voiceOverActivationWorkaround
{
  void *v2;
  int64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VOActivationWorkaround"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_voiceOverRotorItemEnabled:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[AXSettings voiceOverRotorItems](self, "voiceOverRotorItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__AXSettings__voiceOverRotorItemEnabled___block_invoke;
  v9[3] = &unk_1E24C8800;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
  v7 = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__AXSettings__voiceOverRotorItemEnabled___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKey:", CFSTR("RotorItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("Enabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "BOOLValue");

    *a4 = 1;
  }

}

- (id)voiceOverRotorItemWithVoiceID:(id)a3 rate:(id)a4 volume:(id)a5 pitch:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  AXVoiceOverVoiceRotorItem *v17;

  v9 = (void *)MEMORY[0x1E0CB3A28];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF3968]), "initWithVoiceId:rate:pitch:volume:voiceSettings:effects:", v13, v12, v10, v11, 0, 0);
  v17 = -[AXVoiceOverVoiceRotorItem initWithIdentifier:selection:userDefinedName:]([AXVoiceOverVoiceRotorItem alloc], "initWithIdentifier:selection:userDefinedName:", v15, v16, 0);

  return v17;
}

- (void)setDefaultVoiceSelection:(id)a3 languageID:(id)a4 rate:(id)a5 pitch:(id)a6 volume:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[AXSettings swiftSettings](self, "swiftSettings");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "voiceover");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v19 = v18;

  objc_msgSend(v12, "floatValue");
  v21 = v20;

  objc_msgSend(v13, "floatValue");
  v23 = v22;

  LODWORD(v24) = v19;
  LODWORD(v25) = v21;
  LODWORD(v26) = v23;
  objc_msgSend(v17, "setWithVoiceId:forLanguage:rate:volume:pitch:", v16, v15, v24, v25, v26);

}

- (BOOL)voiceOverHandwritingEnabled
{
  return -[AXSettings _voiceOverRotorItemEnabled:](self, "_voiceOverRotorItemEnabled:", *MEMORY[0x1E0CF3DB8]);
}

- (BOOL)voiceOverBrailleGesturesEnabled
{
  if (-[AXSettings _voiceOverRotorItemEnabled:](self, "_voiceOverRotorItemEnabled:", *MEMORY[0x1E0CF3D70]))
    return 1;
  else
    return -[AXSettings voiceOverTouchBrailleGesturesActivationGestureEnabled](self, "voiceOverTouchBrailleGesturesActivationGestureEnabled");
}

- (void)setVoiceOverBrailleWordWrapEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverBrailleWordWrapEnabled"));

}

- (BOOL)voiceOverBrailleWordWrapEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverBrailleWordWrapEnabled"), 1);
}

- (NSDictionary)voiceOverBrailleDisconnectOnSleep
{
  uint64_t v2;

  v2 = objc_opt_class();
  return (NSDictionary *)AXSettingsReturnObjectValueWithClass(CFSTR("VoiceOverBrailleDisplayDisconnectOnSleepPreference"), 0, v2);
}

- (void)setVoiceOverBrailleDisconnectOnSleep:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("VoiceOverBrailleDisplayDisconnectOnSleepPreference"));
}

- (NSArray)voiceOverBrailleDisplays
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  AXSettingsReturnObjectValueWithClass(CFSTR("VoiceOverBrailleDisplays"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    -[AXSettings voiceOverBrailleBluetoothDisplay](self, "voiceOverBrailleBluetoothDisplay");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      v10[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v7 = objc_claimAutoreleasedReturnValue();

      -[AXSettings setVoiceOverBrailleDisplays:](self, "setVoiceOverBrailleDisplays:", v7);
      -[AXSettings setVoiceOverBrailleBluetoothDisplay:](self, "setVoiceOverBrailleBluetoothDisplay:", 0);
      v4 = (void *)v7;
    }

  }
  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_1328);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

BOOL __38__AXSettings_voiceOverBrailleDisplays__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v3 = (id *)getkSCROBrailleDisplayDriverIdentifierSymbolLoc_ptr;
  v15 = getkSCROBrailleDisplayDriverIdentifierSymbolLoc_ptr;
  if (!getkSCROBrailleDisplayDriverIdentifierSymbolLoc_ptr)
  {
    v4 = (void *)ScreenReaderOutputLibrary();
    v3 = (id *)dlsym(v4, "kSCROBrailleDisplayDriverIdentifier");
    v13[3] = (uint64_t)v3;
    getkSCROBrailleDisplayDriverIdentifierSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v12, 8);
  if (!v3)
    __38__AXSettings_voiceOverBrailleDisplays__block_invoke_cold_1();
  v5 = *v3;
  objc_msgSend(v2, "objectForKey:", v5, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.scrod.braille.driver.generic.hid")))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v7 = (_QWORD *)getkSCROBrailleDisplayMainSizeSymbolLoc_ptr;
    v15 = getkSCROBrailleDisplayMainSizeSymbolLoc_ptr;
    if (!getkSCROBrailleDisplayMainSizeSymbolLoc_ptr)
    {
      v8 = (void *)ScreenReaderOutputLibrary();
      v7 = dlsym(v8, "kSCROBrailleDisplayMainSize");
      v13[3] = (uint64_t)v7;
      getkSCROBrailleDisplayMainSizeSymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&v12, 8);
    if (!v7)
      __38__AXSettings_voiceOverBrailleDisplays__block_invoke_cold_2();
    objc_msgSend(v2, "objectForKey:", *v7, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)setVoiceOverBrailleDisplays:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("VoiceOverBrailleDisplays"));
}

- (BOOL)voiceOverUseRingerSwitchToControlNotificationOutput
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverRingerSwitchForNotificationsEnabled"), 1);
}

- (void)setVoiceOverUseRingerSwitchToControlNotificationOutput:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverRingerSwitchForNotificationsEnabled"));

}

- (int64_t)voiceOverBannerNotificationOutput
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverBannerNotificationOutput"), 82);
}

- (void)setVoiceOverBannerNotificationOutput:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverBannerNotificationOutput"));

}

- (int64_t)voiceOverLockedScreenNotificationOutput
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverLockScreenNotificationOutput"), 48);
}

- (void)setVoiceOverLockedScreenNotificationOutput:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverLockScreenNotificationOutput"));

}

- (BOOL)voiceOverBrailleFormattingEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("kAXSVoiceOverBrailleFormatting"), 0);
}

- (void)setVoiceOverBrailleFormattingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("kAXSVoiceOverBrailleFormatting"));

}

- (void)setVoiceOverBrailleAutoAdvanceDuration:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverBrailleAutoAdvanceDuration"));

}

- (double)voiceOverBrailleAutoAdvanceDuration
{
  double v2;
  double result;

  v2 = *MEMORY[0x1E0CF3CA0];
  result = AXSettingsReturnDoubleValue(CFSTR("VoiceOverBrailleAutoAdvanceDuration"), *MEMORY[0x1E0CF3CA0]);
  if (result > *MEMORY[0x1E0CF3CA8] || result < *MEMORY[0x1E0CF3CB0])
    return v2;
  return result;
}

- (void)setVoiceOverHintsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTouchHintsEnabled"));

}

- (BOOL)voiceOverHintsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverTouchHintsEnabled"), 1);
}

- (void)setVoiceOverAudioDuckingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTouchAudioDuckingEnabled"));

}

- (BOOL)voiceOverAudioDuckingEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverTouchAudioDuckingEnabled"), 1);
}

- (void)setVoiceOverIgnoreTrackpad:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverIgnoreTrackpad"));

}

- (BOOL)voiceOverIgnoreTrackpad
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverIgnoreTrackpad"), 0);
}

- (void)setVoiceOverAudioFollowsHDMIAudio:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverAudioFollowsHDMIAudio"));

}

- (BOOL)voiceOverAudioFollowsHDMIAudio
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverAudioFollowsHDMIAudio"), 0);
}

- (void)setAutomationTrueTouch:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AutomationTrueTouch"));

}

- (BOOL)automationTrueTouch
{
  return AXSettingsReturnBoolValue(CFSTR("AutomationTrueTouch"), 0);
}

- (void)setVoiceOverPitch:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSVoiceOverPitchPreference);

}

- (double)voiceOverPitch
{
  return AXSettingsReturnDoubleValue((void *)kAXSVoiceOverPitchPreference, 0.5);
}

- (void)setVoiceOverSoundEffectsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverUseSoundEffects"));

}

- (BOOL)voiceOverSoundEffectsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverUseSoundEffects"), 1);
}

- (int64_t)voiceOverVerbosityEmojiFeedback
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverVerbosityEmojiFeedbackPreference"), 18);
}

- (void)setVoiceOverVerbosityEmojiFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverVerbosityEmojiFeedbackPreference"));

}

- (BOOL)voiceOverVerbosityEmojiSuffixEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverVerbosityEmojiSuffixEnabledPreference"), 0);
}

- (void)setVoiceOverVerbosityEmojiSuffixEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverVerbosityEmojiSuffixEnabledPreference"));

}

- (double)voiceOverSoundVolume
{
  return AXSettingsReturnDoubleValue(CFSTR("VoiceOverSoundVolume"), 0.800000012);
}

- (void)setVoiceOverSoundVolume:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverSoundVolume"));

}

- (BOOL)voiceOverAdjustSoundVolumeIndependently
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverAdjustSoundVolumeIndependently"), 0) ^ 1;
}

- (void)setVoiceOverAdjustSoundVolumeIndependently:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverAdjustSoundVolumeIndependently"));

}

- (BOOL)voiceOverAlwaysTurnOnBluetooth
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverTurnOnBluetoothEnabled"), 0);
}

- (void)setVoiceOverAlwaysTurnOnBluetooth:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverTurnOnBluetoothEnabled"));

}

- (BOOL)voiceOverHapticsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverHapticsEnabled"), 1);
}

- (void)setVoiceOverHapticsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverHapticsEnabled"));

}

- (double)voiceOverHapticIntensity
{
  return AXSettingsReturnDoubleValue(CFSTR("VoiceOverHapticIntensity"), 1.0);
}

- (void)setVoiceOverHapticIntensity:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverHapticIntensity"));

}

- (void)setVoiceOverSpeakingRateInRotorEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SpeakingRateInRotorEnabled"));

}

- (BOOL)voiceOverSpeakingRateInRotorEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("SpeakingRateInRotorEnabled"), 1);
}

- (void)setVoiceOverSpeakNotificationsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SpeakNotificationInLockScreen"));

}

- (BOOL)voiceOverSpeakNotificationsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("SpeakNotificationInLockScreen"), 0);
}

- (void)setVoiceOverRotorItems:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("VoiceOverTouchRotorItemsPreference"));
}

- (double)voiceOverMediaDuckingVolume
{
  return AXSettingsReturnDoubleValue(CFSTR("VoiceOverTouchMediaDuckingVolume"), 0.800000012);
}

- (void)setVoiceOverMediaDuckingVolume:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTouchMediaDuckingVolume"));

}

- (int64_t)voiceOverMediaDuckingMode
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverTouchMediaDuckingMode"), 1);
}

- (void)setVoiceOverMediaDuckingMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTouchMediaDuckingMode"));

}

- (NSArray)voiceOverRotorItems
{
  _QWORD *v3;
  id *v4;
  id *v5;
  id *v6;
  id *v7;
  id *v8;
  id *v9;
  id *v10;
  id *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  unint64_t v22;
  char v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t i;
  uint64_t j;
  void *v38;
  AXSettings *v39;
  id v40;
  _QWORD block[6];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE v58[128];
  _QWORD v59[11];
  _QWORD v60[56];

  v60[54] = *MEMORY[0x1E0C80C00];
  v60[0] = (id)*MEMORY[0x1E0CF3D90];
  v60[1] = (id)*MEMORY[0x1E0CF3E98];
  v60[2] = (id)*MEMORY[0x1E0CF3DE8];
  v60[3] = (id)*MEMORY[0x1E0CF3E60];
  v60[4] = (id)*MEMORY[0x1E0CF3E40];
  v60[5] = (id)*MEMORY[0x1E0CF3E90];
  v60[6] = (id)*MEMORY[0x1E0CF3D60];
  v60[7] = (id)*MEMORY[0x1E0CF3E18];
  v60[8] = (id)*MEMORY[0x1E0CF3E38];
  v60[9] = (id)*MEMORY[0x1E0CF3DC8];
  v60[10] = (id)*MEMORY[0x1E0CF3DE0];
  v60[11] = (id)*MEMORY[0x1E0CF3E88];
  v60[12] = (id)*MEMORY[0x1E0CF3D80];
  v60[13] = (id)*MEMORY[0x1E0CF3D68];
  v60[14] = (id)*MEMORY[0x1E0CF3D48];
  v60[15] = (id)*MEMORY[0x1E0CF3D20];
  v60[16] = (id)*MEMORY[0x1E0CF3D30];
  v60[17] = (id)*MEMORY[0x1E0CF3D38];
  v60[18] = (id)*MEMORY[0x1E0CF3D28];
  v60[19] = (id)*MEMORY[0x1E0CF3D40];
  v60[20] = (id)*MEMORY[0x1E0CF3CF8];
  v60[21] = (id)*MEMORY[0x1E0CF3D70];
  v60[22] = (id)*MEMORY[0x1E0CF3DB8];
  v3 = (_QWORD *)MEMORY[0x1E0CF3EA0];
  v60[23] = (id)*MEMORY[0x1E0CF3EA0];
  v60[24] = (id)*MEMORY[0x1E0CF3EB0];
  v4 = (id *)MEMORY[0x1E0CF3DA0];
  v60[25] = (id)*MEMORY[0x1E0CF3DA0];
  v5 = (id *)MEMORY[0x1E0CF3DC0];
  v60[26] = (id)*MEMORY[0x1E0CF3DC0];
  v6 = (id *)MEMORY[0x1E0CF3DF0];
  v60[27] = (id)*MEMORY[0x1E0CF3DF0];
  v7 = (id *)MEMORY[0x1E0CF3DB0];
  v60[28] = (id)*MEMORY[0x1E0CF3DB0];
  v60[29] = (id)*MEMORY[0x1E0CF3E50];
  v60[30] = (id)*MEMORY[0x1E0CF3DF8];
  v60[31] = (id)*MEMORY[0x1E0CF3DD8];
  v60[32] = (id)*MEMORY[0x1E0CF3D58];
  v60[33] = (id)*MEMORY[0x1E0CF3E80];
  v60[34] = (id)*MEMORY[0x1E0CF3E10];
  v60[35] = (id)*MEMORY[0x1E0CF3D88];
  v60[36] = (id)*MEMORY[0x1E0CF3E58];
  v60[37] = (id)*MEMORY[0x1E0CF3E30];
  v60[38] = (id)*MEMORY[0x1E0CF3D98];
  v60[39] = (id)*MEMORY[0x1E0CF3E20];
  v60[40] = (id)*MEMORY[0x1E0CF3DD0];
  v60[41] = (id)*MEMORY[0x1E0CF3E48];
  v60[42] = (id)*MEMORY[0x1E0CF3E68];
  v60[43] = (id)*MEMORY[0x1E0CF3E28];
  v60[44] = (id)*MEMORY[0x1E0CF3E78];
  v8 = (id *)MEMORY[0x1E0CF3E70];
  v60[45] = (id)*MEMORY[0x1E0CF3E70];
  v60[46] = (id)*MEMORY[0x1E0CF3DA8];
  v60[47] = (id)*MEMORY[0x1E0CF3E08];
  v9 = (id *)MEMORY[0x1E0CF3D00];
  v60[48] = (id)*MEMORY[0x1E0CF3D00];
  v60[49] = (id)*MEMORY[0x1E0CF3D18];
  v10 = (id *)MEMORY[0x1E0CF3D10];
  v60[50] = (id)*MEMORY[0x1E0CF3D10];
  v60[51] = (id)*MEMORY[0x1E0CF3EA8];
  v11 = (id *)MEMORY[0x1E0CF3E00];
  v60[52] = (id)*MEMORY[0x1E0CF3E00];
  v60[53] = (id)*MEMORY[0x1E0CF3D08];
  v59[0] = (id)*MEMORY[0x1E0CF3D90];
  v59[1] = (id)*MEMORY[0x1E0CF3E98];
  v59[2] = (id)*MEMORY[0x1E0CF3DE8];
  v59[3] = *v4;
  v59[4] = *v5;
  v59[5] = *v6;
  v59[6] = *v7;
  v59[7] = *v8;
  v59[8] = *v9;
  v59[9] = *v10;
  v59[10] = *v11;
  v39 = self;
  v12 = v3;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverTouchRotorItemsPreference"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v13;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__12;
  v56 = __Block_byref_object_dispose__12;
  if (v13)
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
  else
    v14 = (void *)objc_opt_new();
  v57 = v14;
  v15 = objc_msgSend((id)v53[5], "count");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)v53[5];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __33__AXSettings_voiceOverRotorItems__block_invoke;
  v50[3] = &unk_1E24C8868;
  v40 = v16;
  v51 = v40;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v50);
  v18 = (void *)_AXSVoiceOverTouchCopyTactileGraphicsDisplay();

  v19 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  do
  {
    if ((objc_msgSend(v40, "containsObject:", v60[v19]) & 1) != 0)
      goto LABEL_17;
    if (objc_msgSend((id)v60[v19], "isEqualToString:", *v12))
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v20, "physicalMemory") < 0x77359400)
        goto LABEL_16;
      v21 = AXRuntimeCheck_HasANE();

      if (!v21)
        goto LABEL_17;
    }
    if (v18
      || (objc_msgSend((id)v60[v19], "isEqualToString:", *MEMORY[0x1E0CF3D48]) & 1) == 0
      && (objc_msgSend((id)v60[v19], "isEqualToString:", *MEMORY[0x1E0CF3D20]) & 1) == 0
      && (objc_msgSend((id)v60[v19], "isEqualToString:", *MEMORY[0x1E0CF3D30]) & 1) == 0
      && (objc_msgSend((id)v60[v19], "isEqualToString:", *MEMORY[0x1E0CF3D38]) & 1) == 0
      && (objc_msgSend((id)v60[v19], "isEqualToString:", *MEMORY[0x1E0CF3D28]) & 1) == 0
      && (objc_msgSend((id)v60[v19], "isEqualToString:", *MEMORY[0x1E0CF3D40]) & 1) == 0)
    {
      *((_BYTE *)v47 + 24) = 1;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v60[v19], CFSTR("RotorItem"));
      v22 = 0;
      v23 = 1;
      do
      {
        if (AXSafeEqual())
          break;
        v23 = v22++ < 0xA;
      }
      while (v22 != 11);
      if (-[AXSettings voiceOverSpeakingRateInRotorEnabled](v39, "voiceOverSpeakingRateInRotorEnabled"))
        v23 |= AXSafeEqual() != 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23 & 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v24, CFSTR("Enabled"));

      objc_msgSend((id)v53[5], "addObject:", v20);
LABEL_16:

    }
LABEL_17:
    ++v19;
  }
  while (v19 != 54);
  v25 = (void *)objc_msgSend((id)v53[5], "copy");

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v26 = v25;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
  v28 = v27;
  if (v27)
  {
    v29 = *(_QWORD *)v43;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v30);
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("RotorItem"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        while ((objc_msgSend((id)v60[v33], "isEqualToString:", v32) & 1) == 0)
        {
          if (++v33 == 54)
          {
            *((_BYTE *)v47 + 24) = 1;
            objc_msgSend((id)v53[5], "removeObject:", v31);
            break;
          }
        }

        ++v30;
      }
      while (v30 != v28);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
    }
    while (v28);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AXSettings_voiceOverRotorItems__block_invoke_2;
  block[3] = &unk_1E24C88B8;
  block[4] = &v52;
  block[5] = &v46;
  if (voiceOverRotorItems_onceToken != -1)
    dispatch_once(&voiceOverRotorItems_onceToken, block);
  v34 = (void *)objc_msgSend((id)v53[5], "copy");

  if (*((_BYTE *)v47 + 24))
    -[AXBaseSettings setValue:forPreferenceKey:](v39, "setValue:forPreferenceKey:", v34, CFSTR("VoiceOverTouchRotorItemsPreference"));
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  for (i = 10; i != -1; --i)

  for (j = 53; j != -1; --j)
  return (NSArray *)v34;
}

void __33__AXSettings_voiceOverRotorItems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", CFSTR("RotorItem"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __33__AXSettings_voiceOverRotorItems__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = a1;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RotorItem"), v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Enabled"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v2, "containsObject:", v9) & 1) != 0)
        {
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __33__AXSettings_voiceOverRotorItems__block_invoke_3;
          v15[3] = &unk_1E24C8890;
          v16 = v9;
          v17 = v10;
          v11 = objc_msgSend(v3, "indexOfObjectPassingTest:", v15);
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v11, v8);

        }
        else
        {
          objc_msgSend(v3, "addObject:", v8);
          objc_msgSend(v2, "addObject:", v9);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  v12 = objc_msgSend(v3, "count");
  if (v12 != objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v13 + 32) + 8) + 40), "count"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v13 + 40) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v13 + 32) + 8) + 40), v3);
  }

}

uint64_t __33__AXSettings_voiceOverRotorItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RotorItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Enabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToNumber:", *(_QWORD *)(a1 + 40)) ^ 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setVoiceOverSpeakActionConfirmation:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverSpeakActionConfirmationPreference"));

}

- (BOOL)voiceOverSpeakActionConfirmation
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverSpeakActionConfirmationPreference"), 1);
}

- (void)setVoiceOverRotorUpdatesWithElement:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverRotorUpdatesWithElementPreference"));

}

- (BOOL)voiceOverRotorUpdatesWithElement
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverRotorUpdatesWithElementPreference"), 1);
}

- (void)setVoiceOverEditAppsActionEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverEditAppsActionEnabledPreference"));

}

- (BOOL)voiceOverEditAppsActionEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverEditAppsActionEnabledPreference"), 1);
}

- (void)_localeChange:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_1334);

}

uint64_t __28__AXSettings__localeChange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", a2);
  AnyUserPreferredLanguageIsRTL |= result == 2;
  return result;
}

- (BOOL)anyUserPreferredLangaugeIsRTL
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AXSettings_anyUserPreferredLangaugeIsRTL__block_invoke;
  block[3] = &unk_1E24C4C38;
  block[4] = self;
  if (anyUserPreferredLangaugeIsRTL_onceToken[0] != -1)
    dispatch_once(anyUserPreferredLangaugeIsRTL_onceToken, block);
  return AnyUserPreferredLanguageIsRTL;
}

void __43__AXSettings_anyUserPreferredLangaugeIsRTL__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_localeChange:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__localeChange_, *MEMORY[0x1E0C99720], 0);

}

- (void)setVoiceOverBrailleTableIdentifier:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("voiceOverBrailleTableIdentifier"));
}

- (NSString)voiceOverBrailleTableIdentifier
{
  void *v2;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("voiceOverBrailleTableIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setVoiceOverBrailleLanguageRotorItems:(id)a3
{
  _AXSVoiceOverTouchSetBrailleLanguageRotorItems();
}

- (NSArray)voiceOverBrailleLanguageRotorItems
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[2];
  void *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)_AXSVoiceOverTouchCopyBrailleLanguageRotorItems();
  if (objc_msgSend(v2, "count"))
  {
    v3 = v2;
  }
  else
  {
    v4 = (void *)objc_opt_new();
    +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03538], "defaultTablesArrayForLocale:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C9AAB0];
      v23[0] = CFSTR("Default");
      v23[1] = CFSTR("Enabled");
      v24[0] = MEMORY[0x1E0C9AAB0];
      v24[1] = MEMORY[0x1E0C9AAB0];
      v23[2] = CFSTR("LanguageDefaults");
      objc_msgSend(v6, "localeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v10;
      objc_msgSend(v8, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v13);

      if ((unint64_t)objc_msgSend(v7, "count") >= 2)
      {
        v14 = 1;
        do
        {
          objc_msgSend(v7, "objectAtIndex:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19[1] = CFSTR("RotorItem");
          v20[0] = v9;
          v19[0] = CFSTR("Enabled");
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v20[1] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v17);

          ++v14;
        }
        while (v14 < objc_msgSend(v7, "count"));
      }

    }
    v3 = (id)objc_msgSend(v4, "copy");

  }
  return (NSArray *)v3;
}

- (void)setVoiceOverAlwaysUseNemethCodeForMathEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("voiceOverAlwaysUseNemethCodeForMathEnabled"));

}

- (BOOL)voiceOverAlwaysUseNemethCodeForMathEnabled
{
  void *v2;
  char v3;
  void *v4;
  void *v5;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("voiceOverAlwaysUseNemethCodeForMathEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("en_US")) & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(v5, "isEqualToString:", CFSTR("en_CA"));

  }
  return v3;
}

- (NSNumber)voiceOverHandwritingWasNativeAutocorrectEnabled
{
  return (NSNumber *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverHandwritingWasNativeAutocorrectEnabled"));
}

- (void)setVoiceOverHandwritingWasNativeAutocorrectEnabled:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("VoiceOverHandwritingWasNativeAutocorrectEnabled"));
}

- (BOOL)voiceOverBrailleGradeTwoAutoTranslateEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverShowGrade2AutoTranslate"), 0);
}

- (void)setVoiceOverBrailleGradeTwoAutoTranslateEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverShowGrade2AutoTranslate"));

}

- (BOOL)voiceOverShowSoftwareKeyboardWithBraille
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverShowSWKeyboardWithBraille"), 0);
}

- (void)setVoiceOverShowSoftwareKeyboardWithBraille:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverShowSWKeyboardWithBraille"));

}

- (BOOL)voiceOverSpeakNonfocusableElementsAfterDelay
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverSpeakNonfocusableElementsAfterDelay"), 1);
}

- (void)setVoiceOverSpeakNonfocusableElementsAfterDelay:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverSpeakNonfocusableElementsAfterDelay"));

}

- (BOOL)voiceOverSilenceAnnouncements
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverSilenceAnnouncements"), 0);
}

- (void)setVoiceOverSilenceAnnouncements:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverSilenceAnnouncements"));

}

- (int64_t)voiceOverPreferredTVInteractionMode
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverTouchTVInteractionMode"), 1);
}

- (void)setVoiceOverPreferredTVInteractionMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTouchTVInteractionMode"));

}

- (BOOL)voiceOverPrefersFollowFocusNavigationStyle
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverTouchTVPrefersFollowFocusNavigationStyle"), 0);
}

- (void)setVoiceOverPrefersFollowFocusNavigationStyle:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTouchTVPrefersFollowFocusNavigationStyle"));

}

- (BOOL)voiceOverExploreFocusAffectsNativeFocus
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverExploreFocusAffectsNativeFocus"), 0);
}

- (void)setVoiceOverExploreFocusAffectsNativeFocus:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverExploreFocusAffectsNativeFocus"));

}

- (int64_t)voiceOverDescribedMedia
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverTouchDescribedMedia"), *MEMORY[0x1E0CF3CE0]);
}

- (void)setVoiceOverDescribedMedia:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTouchDescribedMedia"));

}

- (NSData)voiceOverCustomCommandProfile
{
  return (NSData *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverCustomCammndProfile"));
}

- (void)setVoiceOverCustomCommandProfile:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("VoiceOverCustomCammndProfile"));
}

- (BOOL)voiceOverShouldDisallowUSBRestrictedMode
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverShouldDisallowUSBRestrictedMode"), 0);
}

- (void)setVoiceOverShouldDisallowUSBRestrictedMode:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverShouldDisallowUSBRestrictedMode"));

}

- (NSArray)voiceOverDetectionModeItems
{
  id v2;
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = 0;
  v4 = MEMORY[0x1E0C9AAB0];
  do
  {
    if ((AXDeviceSupportsDetectionMode() & 1) != 0 || v3 > 5 || ((1 << v3) & 0x23) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      AXNameForDetectionMode(v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("Detector"));

      objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("Enabled"));
      objc_msgSend(v2, "axSafelyAddObject:", v5);

    }
    ++v3;
  }
  while (v3 != 6);
  v7 = objc_opt_class();
  AXSettingsReturnObjectValueWithClass(CFSTR("VoiceOverDetectionModeItems"), v2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v2, "count");
  v10 = objc_msgSend(v8, "count");
  v11 = v8;
  if (v9 != v10)
  {
    -[AXSettings setVoiceOverDetectionModeItems:](self, "setVoiceOverDetectionModeItems:", v2);
    v11 = v2;
  }
  v12 = v11;

  return v12;
}

- (void)setVoiceOverDetectionModeItems:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("VoiceOverDetectionModeItems"));
}

- (BOOL)liveRecognitionActive
{
  return AXSettingsReturnBoolValue(CFSTR("AXSLiveRecognitionActive"), 0);
}

- (void)setLiveRecognitionActive:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSLiveRecognitionActive"));

}

- (BOOL)liveRecognitionOverlayOpen
{
  return AXSettingsReturnBoolValue(CFSTR("AXSLiveRecognitionOverlayOpen"), 0);
}

- (void)setLiveRecognitionOverlayOpen:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSLiveRecognitionOverlayOpen"));

}

- (NSArray)enabledLiveRecognitionModes
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSEnabledLiveRecognitionModes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (void)setEnabledLiveRecognitionModes:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSEnabledLiveRecognitionModes"));
}

- (BOOL)switchControlShouldDisallowUSBRestrictedMode
{
  return AXSettingsReturnBoolValue(CFSTR("SCShouldDisallowUSBRestrictedMode"), 0);
}

- (void)setSwitchControlShouldDisallowUSBRestrictedMode:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCShouldDisallowUSBRestrictedMode"));

}

- (BOOL)voiceOverUserDidReadUSBRestrictedModeAlert
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverUserDidReadUSBRestrictedModeAlert"), 0);
}

- (void)setVoiceOverUserDidReadUSBRestrictedModeAlert:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverUserDidReadUSBRestrictedModeAlert"));

}

- (BOOL)switchControlUserDidReadUSBRestrictedModeAlert
{
  return AXSettingsReturnBoolValue(CFSTR("SCUserDidReadUSBRestrictedModeAlert"), 0);
}

- (void)setSwitchControlUserDidReadUSBRestrictedModeAlert:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SCUserDidReadUSBRestrictedModeAlert"));

}

- (void)addRotorOptionsForLoginSession
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id obj;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _BYTE v23[128];
  _QWORD v24[4];

  v24[2] = *MEMORY[0x1E0C80C00];
  -[AXSettings voiceOverRotorItems](self, "voiceOverRotorItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = *MEMORY[0x1E0CF3DB8];
  v24[0] = *MEMORY[0x1E0CF3D70];
  v24[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v16 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v16)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v21[0] = CFSTR("RotorItem");
        v21[1] = CFSTR("Enabled");
        v22[0] = v8;
        v22[1] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "count"))
        {
          v10 = 0;
          while (1)
          {
            objc_msgSend(v3, "objectAtIndex:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKey:", CFSTR("RotorItem"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqualToString:", v8);

            if (v13)
              break;

            if (++v10 >= (unint64_t)objc_msgSend(v3, "count"))
              goto LABEL_10;
          }
          objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v10, v9);

        }
        else
        {
LABEL_10:
          objc_msgSend(v3, "addObject:", v9);
        }

        ++v7;
      }
      while (v7 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

  -[AXSettings setVoiceOverRotorItems:](self, "setVoiceOverRotorItems:", v3);
}

- (void)configureZoomForLoginSession
{
  -[AXSettings setZoomShouldShowSlug:](self, "setZoomShouldShowSlug:", 1);
  -[AXSettings setZoomScale:](self, "setZoomScale:", 2.0);
  -[AXSettings setZoomInStandby:](self, "setZoomInStandby:", 0);
}

- (void)clearVoicePrefersCompactSettings
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("AXSVoiceOverCompactVoicePreference"));
}

- (void)setVoiceOverAlternativeVoiceIdentifier:(id)a3 forLanguage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSVoiceOverAlternativeVoicesPreference"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (!v8)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  if (v9)
    objc_msgSend(v8, "setObject:forKey:", v9, v6);
  else
    objc_msgSend(v8, "removeObjectForKey:", v6);
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v8, CFSTR("AXSVoiceOverAlternativeVoicesPreference"));

}

- (id)voiceOverAlternativeVoiceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSVoiceOverAlternativeVoicesPreference"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (id)_voiceOverTouchSpeakingRateLanguages
{
  return -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverLanguageSpeakingRate"));
}

- (void)setVoiceOverSpeakingRate:(float)a3 forLanguage:(id)a4
{
  NSObject *v4;

  AXLogSettings();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[AXSettings setVoiceOverSpeakingRate:forLanguage:].cold.1(v4);

}

- (float)voiceOverSpeakingRateForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;

  v4 = a3;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverLanguageSpeakingRate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "floatValue");
    v8 = v7;
  }
  else
  {
    v8 = 3.4028e38;
  }

  return v8;
}

- (float)voiceOverEffectiveSpeakingRate
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  float v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  float *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = (float *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = dispatch_semaphore_create(0);
  -[AXSettings swiftSettings](self, "swiftSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceover");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__AXSettings_voiceOverEffectiveSpeakingRate__block_invoke;
  v9[3] = &unk_1E24C8920;
  v11 = &v12;
  v6 = v3;
  v10 = v6;
  objc_msgSend(v5, "effectiveSpeakingRateWithCompletionHandler:", v9);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = v13[6];

  _Block_object_dispose(&v12, 8);
  return v7;
}

intptr_t __44__AXSettings_voiceOverEffectiveSpeakingRate__block_invoke(uint64_t a1, float a2)
{
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setVoiceOverEffectiveSpeakingRate:(float)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  double v9;
  _QWORD v10[4];
  dispatch_semaphore_t v11;

  v5 = dispatch_semaphore_create(0);
  -[AXSettings swiftSettings](self, "swiftSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voiceover");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__AXSettings_setVoiceOverEffectiveSpeakingRate___block_invoke;
  v10[3] = &unk_1E24C4C38;
  v11 = v5;
  v8 = v5;
  *(float *)&v9 = a3;
  objc_msgSend(v7, "setEffectiveSpeakingRate:completionHandler:", v10, v9);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __48__AXSettings_setVoiceOverEffectiveSpeakingRate___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)voiceOverShouldOutputToHearingAid
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverOutputToHearingAid"), 0);
}

- (void)setVoiceOverShouldOutputToHearingAid:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverOutputToHearingAid"));

}

- (BOOL)voiceOverTouchBrailleGesturesShouldUseLockedConfiguration
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverBrailleGesturesShouldUseLockedConfiguration"), 0);
}

- (void)setVoiceOverTouchBrailleGesturesShouldUseLockedConfiguration:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverBrailleGesturesShouldUseLockedConfiguration"));

}

- (int64_t)voiceOverTouchBrailleGesturesLockedOrientation
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverBrailleGesturesLockedOrientation"), 3);
}

- (void)setVoiceOverTouchBrailleGesturesLockedOrientation:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverBrailleGesturesLockedOrientation"));

}

- (int64_t)voiceOverTouchBrailleGesturesLockedTypingMode
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverBrailleGesturesLockedTypingMode"), 0);
}

- (void)setVoiceOverTouchBrailleGesturesLockedTypingMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverBrailleGesturesLockedTypingMode"));

}

- (BOOL)voiceOverTouchBrailleGesturesDidPlayCalibrationHint
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverBrailleGesturesDidPlayCalibrationHint"), 0);
}

- (void)setVoiceOverTouchBrailleGesturesDidPlayCalibrationHint:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverBrailleGesturesDidPlayCalibrationHint"));

}

- (BOOL)voiceOverBrailleAlertsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverBrailleAlertsEnabled"), 1);
}

- (void)setVoiceOverBrailleAlertsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverBrailleAlertsEnabled"));

}

- (BOOL)voiceOverBrailleAlertShowUntilDismissed
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverBrailleAlertShowUntilDismissed"), 0);
}

- (void)setVoiceOverBrailleAlertShowUntilDismissed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverBrailleAlertShowUntilDismissed"));

}

- (double)voiceOverBrailleAlertDisplayDuration
{
  return AXSettingsReturnDoubleValue(CFSTR("VoiceOverBrailleDisplayAlertDuration"), *MEMORY[0x1E0CF3C98]);
}

- (void)setVoiceOverBrailleAlertDisplayDuration:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3CB8] <= a3)
    a3 = *MEMORY[0x1E0CF3CB8];
  if (a3 < *MEMORY[0x1E0CF3CC0])
    a3 = *MEMORY[0x1E0CF3CC0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverBrailleDisplayAlertDuration"));

}

- (double)voiceOverBrailleKeyDebounceTimeout
{
  return AXSettingsReturnDoubleValue(CFSTR("VoiceOverBrailleKeyDebounceTimeout"), 0.3);
}

- (void)setVoiceOverBrailleKeyDebounceTimeout:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3CC8] <= a3)
    a3 = *MEMORY[0x1E0CF3CC8];
  if (a3 < *MEMORY[0x1E0CF3CD0])
    a3 = *MEMORY[0x1E0CF3CD0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverBrailleKeyDebounceTimeout"));

}

- (double)voiceOverDoubleTapInterval
{
  return AXSettingsReturnDoubleValue((void *)kAXSVoiceOverDoubleTapInterval, 0.35);
}

- (void)setVoiceOverDoubleTapInterval:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3CE8] <= a3)
    a3 = *MEMORY[0x1E0CF3CE8];
  if (a3 < *MEMORY[0x1E0CF3CF0])
    a3 = *MEMORY[0x1E0CF3CF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSVoiceOverDoubleTapInterval);

}

- (int64_t)voiceOverNavigationDirectionMode
{
  if (-[AXSettings anyUserPreferredLangaugeIsRTL](self, "anyUserPreferredLangaugeIsRTL"))
    return AXSettingsReturnIntegerValue(CFSTR("VoiceOverNavigationDirectionMode"), 0);
  else
    return 0;
}

- (void)setVoiceOverNavigationDirectionMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverNavigationDirectionMode"));

}

- (id)_audioHardwareChannelLayout
{
  return -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSAudioHardwareChannelLayoutsPreference"));
}

- (void)_setAudioHardwareChannelLayout:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSAudioHardwareChannelLayoutsPreference"));
}

- (BOOL)tapToSpeakTimeEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("TapToSpeakTimeEnabled"), *MEMORY[0x1E0CF3760]);
}

- (void)setTapToSpeakTimeEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TapToSpeakTimeEnabled"));

}

- (int64_t)tapToSpeakTimeAvailability
{
  return AXSettingsReturnIntegerValue(CFSTR("TapToSpeakTimeAvailability"), *MEMORY[0x1E0CF3758]);
}

- (void)setTapToSpeakTimeAvailability:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TapToSpeakTimeAvailability"));

}

- (BOOL)tapticTimeIsAvailable
{
  return -[AXSettings voiceOverEnabled](self, "voiceOverEnabled")
      || !-[AXSettings tapToSpeakTimeEnabled](self, "tapToSpeakTimeEnabled")
      || -[AXSettings tapToSpeakTimeAvailability](self, "tapToSpeakTimeAvailability") != 2;
}

- (BOOL)voiceOverTapticTimeMode
{
  unsigned __int8 *v3;
  int v4;

  if (-[AXSettings voiceOverEnabled](self, "voiceOverEnabled"))
  {
    v3 = (unsigned __int8 *)MEMORY[0x1E0CF3778];
LABEL_5:
    LOBYTE(v4) = AXSettingsReturnBoolValue(CFSTR("VoiceOverTapticTimeMode"), *v3);
    return v4;
  }
  v4 = -[AXSettings tapticTimeIsAvailable](self, "tapticTimeIsAvailable");
  if (v4)
  {
    v3 = (unsigned __int8 *)MEMORY[0x1E0CF3770];
    goto LABEL_5;
  }
  return v4;
}

- (void)setVoiceOverTapticTimeMode:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTapticTimeMode"));

}

- (int64_t)voiceOverTapticTimeEncoding
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverTapticTimeEncoding"), *MEMORY[0x1E0CF3790]);
}

- (void)setVoiceOverTapticTimeEncoding:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTapticTimeEncoding"));

}

- (float)voiceOverTapticTimeSpeed
{
  return AXSettingsReturnDoubleValue(CFSTR("VoiceOverTapticTimeSpeed"), *MEMORY[0x1E0CF3798]);
}

- (void)setVoiceOverTapticTimeSpeed:(float)a3
{
  id v4;

  if (*MEMORY[0x1E0CF37A8] >= a3)
    a3 = *MEMORY[0x1E0CF37A8];
  if (*MEMORY[0x1E0CF37A0] < a3)
    a3 = *MEMORY[0x1E0CF37A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTapticTimeSpeed"));

}

- (BOOL)voiceOverTapticChimesEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverTapticChimesEnabled"), *MEMORY[0x1E0CF3768]);
}

- (void)setVoiceOverTapticChimesEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTapticChimesEnabled"));

}

- (BOOL)tapticTimeInternalFlashScreenEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("TapticTimeInternalFlashScreenEnabled"), 0);
}

- (void)setTapticTimeInternalFlashScreenEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TapticTimeInternalFlashScreenEnabled"));

}

- (int64_t)voiceOverTapticChimesAvailability
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverTapticChimesAvailability"), 1);
}

- (void)setVoiceOverTapticChimesAvailability:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTapticChimesAvailability"));

}

- (int64_t)voiceOverTapticChimesFrequencyEncoding
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverTapticChimesFrequencyEncoding"), *MEMORY[0x1E0CF3780]);
}

- (void)setVoiceOverTapticChimesFrequencyEncoding:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTapticChimesFrequencyEncoding"));

}

- (int64_t)voiceOverTapticChimesSoundType
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverTapticChimesSoundType"), *MEMORY[0x1E0CF3788]);
}

- (void)setVoiceOverTapticChimesSoundType:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverTapticChimesSoundType"));

}

- (BOOL)voiceOverTouchBrailleShouldReverseDots
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverTouchShouldReverseDots"), 0);
}

- (void)setVoiceOverTouchBrailleShouldReverseDots:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverTouchShouldReverseDots"));

}

- (BOOL)voiceOverTouchBrailleGestureControl
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverTouchBrailleGestureControl"), 0);
}

- (void)setVoiceOverTouchBrailleGestureControl:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverTouchBrailleGestureControl"));

}

- (BOOL)voiceOverTouchBrailleShowTextStyleStatus
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverTouchBrailleShowTextStyleStatus"), 0);
}

- (void)setVoiceOverTouchBrailleShowTextStyleStatus:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverTouchBrailleShowTextStyleStatus"));

}

- (BOOL)voiceOverTouchUpdateBrailleWithoutConnectedDisplay
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverTouchUpdateBrailleWithoutConnectedDisplay"), 0);
}

- (void)setVoiceOverTouchUpdateBrailleWithoutConnectedDisplay:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverTouchUpdateBrailleWithoutConnectedDisplay"));

}

- (id)voiceOverTouchPreferredBrailleTableIdentifiers
{
  uint64_t v2;

  v2 = objc_opt_class();
  return AXSettingsReturnObjectValueWithClass(CFSTR("AXSVoiceOverTouchBraillePreferredTableIdentifiers"), MEMORY[0x1E0C9AA70], v2);
}

- (void)setVoiceOverTouchPreferredBrailleTableIdentifiers:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSVoiceOverTouchBraillePreferredTableIdentifiers"));
}

- (id)preferredBrailleTableIdentifierForKeyboardLanguage:(id)a3 keyboardLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[AXSettings voiceOverTouchPreferredBrailleTableIdentifiers](self, "voiceOverTouchPreferredBrailleTableIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v6)
    {
      v10 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setPreferredBrailleTableIdentifier:(id)a3 forKeyboardLanguage:(id)a4 keyboardLayout:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  -[AXSettings voiceOverTouchPreferredBrailleTableIdentifiers](self, "voiceOverTouchPreferredBrailleTableIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_opt_new();
  v16 = v15;

  if (v9)
  {
    v17 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, v17);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v8);
  -[AXSettings setVoiceOverTouchPreferredBrailleTableIdentifiers:](self, "setVoiceOverTouchPreferredBrailleTableIdentifiers:", v11);

}

- (BOOL)voiceOverTouchBrailleShowGeneralStatus
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverTouchBrailleShowGeneralStatus"), 0);
}

- (void)setVoiceOverTouchBrailleShowGeneralStatus:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverTouchBrailleShowGeneralStatus"));

}

- (BOOL)voiceOverShouldSpeakDiscoveredText
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverShouldSpeakDiscoveredTextPreference"), 1);
}

- (void)setVoiceOverShouldSpeakDiscoveredText:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverShouldSpeakDiscoveredTextPreference"));

}

- (int64_t)voiceOverNeuralElementFeedback
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverSpeakDiscoveredTextFeedbackPreference"), 1);
}

- (void)setVoiceOverNeuralElementFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverSpeakDiscoveredTextFeedbackPreference"));

}

- (int64_t)voiceOverNumberFeedback
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverNumberFeedback"), 1);
}

- (void)setVoiceOverNumberFeedback:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverNumberFeedback"));

}

- (BOOL)voiceOverAutomaticButtonLabels
{
  return 1;
}

- (void)setVoiceOverAutomaticButtonLabels:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverAutomaticButtonLabelsPreference"));

}

- (NSDictionary)voiceOverSoundAndHapticPreferences
{
  return (NSDictionary *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverSoundsAndHaptics"));
}

- (void)setVoiceOverSoundAndHapticPreferences:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("VoiceOverSoundsAndHaptics"));
}

- (id)_voiceOverSoundOrHapticValueForPreference:(id)a3 outputEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverSoundsAndHaptics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)_voiceOverSetSoundOrHapticValue:(id)a3 forPreference:(id)a4 outputEvent:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverSoundsAndHaptics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v8);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v9);
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v11, CFSTR("VoiceOverSoundsAndHaptics"));

}

- (id)voiceOverSoundEnabledForEvent:(id)a3
{
  return -[AXSettings _voiceOverSoundOrHapticValueForPreference:outputEvent:](self, "_voiceOverSoundOrHapticValueForPreference:outputEvent:", CFSTR("soundEnabled"), a3);
}

- (void)voiceOverSetSoundEnabled:(BOOL)a3 forEvent:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AXSettings _voiceOverSetSoundOrHapticValue:forPreference:outputEvent:](self, "_voiceOverSetSoundOrHapticValue:forPreference:outputEvent:", v8, CFSTR("soundEnabled"), v7);

}

- (BOOL)_defaultHapticValueForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (_defaultHapticValueForEvent__onceToken != -1)
    dispatch_once(&_defaultHapticValueForEvent__onceToken, &__block_literal_global_1356);
  objc_msgSend((id)_defaultHapticValueForEvent__DefaultOverrides, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 1;

  return v6;
}

void __42__AXSettings__defaultHapticValueForEvent___block_invoke()
{
  void *v0;

  v0 = (void *)_defaultHapticValueForEvent__DefaultOverrides;
  _defaultHapticValueForEvent__DefaultOverrides = (uint64_t)&unk_1E24F9070;

}

- (id)voiceOverHapticEnabledForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[AXSettings _voiceOverSoundOrHapticValueForPreference:outputEvent:](self, "_voiceOverSoundOrHapticValueForPreference:outputEvent:", CFSTR("hapticEnabled"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSettings _defaultHapticValueForEvent:](self, "_defaultHapticValueForEvent:", v4));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)voiceOverSetHapticEnabled:(BOOL)a3 forEvent:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AXSettings _voiceOverSetSoundOrHapticValue:forPreference:outputEvent:](self, "_voiceOverSetSoundOrHapticValue:forPreference:outputEvent:", v8, CFSTR("hapticEnabled"), v7);

}

- (void)voiceOverResetSoundAndHapticPreferences
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("VoiceOverSoundsAndHaptics"));
}

- (NSArray)voiceOverQuickSettingsItems
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("QuickSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

- (void)setVoiceOverQuickSettingsItems:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("QuickSettings"));
}

- (BOOL)independentHearingAidSettings
{
  return AXSettingsReturnBoolValue(CFSTR("HearingAidEarIndependencePreference"), 1);
}

- (void)setIndependentHearingAidSettings:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("HearingAidEarIndependencePreference"));

}

- (BOOL)allowHearingAidControlOnLockScreen
{
  return AXSettingsReturnBoolValue(CFSTR("HearingAidControlAvailableOnLockScreen"), 1);
}

- (void)setAllowHearingAidControlOnLockScreen:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("HearingAidControlAvailableOnLockScreen"));

}

- (BOOL)shouldStreamToLeftAid
{
  return AXSettingsReturnBoolValue(CFSTR("HearingAidStreamToLeft"), 1);
}

- (void)setShouldStreamToLeftAid:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("HearingAidStreamToLeft"));

}

- (BOOL)leftRightBalanceEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("LeftRightBalanceEnabled"), 0);
}

- (void)setLeftRightBalanceEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  float v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("LeftRightBalanceEnabled"));

  LODWORD(v6) = 0;
  if (v3)
  {
    -[AXSettings leftRightBalanceValue](self, "leftRightBalanceValue", v6);
    v8 = v7;
    _AXSLeftRightAudioBalance();
    if (v8 == v9)
      return;
    -[AXSettings leftRightBalanceValue](self, "leftRightBalanceValue");
  }
  _AXSSetLeftRightAudioBalance();
}

- (double)leftRightBalanceValue
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;

  v2 = objc_opt_class();
  AXSettingsReturnObjectValueWithClass(CFSTR("LeftRightBalanceValue"), &unk_1E24F7FA0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setLeftRightBalanceValue:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("LeftRightBalanceValue"));

}

- (BOOL)shouldStreamToRightAid
{
  return AXSettingsReturnBoolValue(CFSTR("HearingAidStreamToRight"), 1);
}

- (void)setShouldStreamToRightAid:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("HearingAidStreamToRight"));

}

- (void)_updateTouchAccommodationsTripleClickSetting
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  if (-[AXSettings touchAccommodationsEnabled](self, "touchAccommodationsEnabled")
    || (+[AXSettings sharedInstance](AXSettings, "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "touchAccommodationsTripleClickConfirmed"),
        v3,
        v4))
  {
    _AXSTripleClickAddOption();
  }
  else if (!-[AXSettings touchAccommodationsAreConfigured](self, "touchAccommodationsAreConfigured")
         || (+[AXSettings sharedInstance](AXSettings, "sharedInstance"),
             v5 = (void *)objc_claimAutoreleasedReturnValue(),
             v6 = objc_msgSend(v5, "touchAccommodationsTripleClickConfirmed"),
             v5,
             (v6 & 1) == 0))
  {
    _AXSTripleClickRemoveOption();
  }
}

- (BOOL)touchAccommodationsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("TouchAccommodationsEnabledPreference"), 0);
}

- (void)setTouchAccommodationsEnabled:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TouchAccommodationsEnabledPreference"));

  -[AXSettings _updateTouchAccommodationsTripleClickSetting](self, "_updateTouchAccommodationsTripleClickSetting");
}

- (BOOL)touchAccommodationsAreConfigured
{
  return -[AXSettings touchAccommodationsHoldDurationEnabled](self, "touchAccommodationsHoldDurationEnabled")
      || -[AXSettings touchAccommodationsIgnoreRepeatEnabled](self, "touchAccommodationsIgnoreRepeatEnabled")
      || -[AXSettings touchAccommodationsTapActivationMethod](self, "touchAccommodationsTapActivationMethod") != 0;
}

- (BOOL)touchAccommodationsTripleClickConfirmed
{
  return AXSettingsReturnBoolValue(CFSTR("AXSTouchAccommodationsTripleClickConfirmedPreference"), 0);
}

- (void)setTouchAccommodationsTripleClickConfirmed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSTouchAccommodationsTripleClickConfirmedPreference"));

}

- (BOOL)touchAccommodationsUsageConfirmed
{
  return AXSettingsReturnBoolValue(CFSTR("TouchAccommodationsUsageConfirmedPreference"), 0);
}

- (void)setTouchAccommodationsUsageConfirmed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TouchAccommodationsUsageConfirmedPreference"));

}

- (BOOL)touchAccommodationsHoldDurationEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("TouchAccommodationsHoldDurationEnabledPreference"), 0);
}

- (void)setTouchAccommodationsHoldDurationEnabled:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TouchAccommodationsHoldDurationEnabledPreference"));

  -[AXSettings _updateTouchAccommodationsTripleClickSetting](self, "_updateTouchAccommodationsTripleClickSetting");
}

- (double)touchAccommodationsHoldDuration
{
  return AXSettingsReturnDoubleValue(CFSTR("TouchAccommodationsHoldDurationPreference"), *MEMORY[0x1E0CF3C60]);
}

- (void)setTouchAccommodationsHoldDuration:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3C58] < a3)
    a3 = *MEMORY[0x1E0CF3C58];
  if (*MEMORY[0x1E0CF3C60] >= a3)
    a3 = *MEMORY[0x1E0CF3C60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TouchAccommodationsHoldDurationPreference"));

}

- (BOOL)touchAccommodationsAllowsSwipeGesturesToBypass
{
  return AXSettingsReturnBoolValue(CFSTR("TouchAccommodationsAllowsSwipeGesturesToBypassPreference"), 0);
}

- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TouchAccommodationsAllowsSwipeGesturesToBypassPreference"));

}

- (double)touchAccommodationsSwipeGestureMinimumDistance
{
  return AXSettingsReturnDoubleValue(CFSTR("TouchAccommodationsHoldDurationSwipeGestureMinimumDistancePreference"), 40.0);
}

- (void)setTouchAccommodationsSwipeGestureMinimumDistance:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3C78] < a3)
    a3 = *MEMORY[0x1E0CF3C78];
  if (*MEMORY[0x1E0CF3C80] >= a3)
    a3 = *MEMORY[0x1E0CF3C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TouchAccommodationsHoldDurationSwipeGestureMinimumDistancePreference"));

}

- (int64_t)touchAccommodationsHoldDurationSwipeGestureSensitivity
{
  return AXSettingsReturnIntegerValue(CFSTR("TouchAccommodationsHoldDurationSwipeGestureSensitivityPreference"), 1);
}

- (BOOL)touchAccommodationsHoldDurationAllowsSwipeGesturesToBypass
{
  int v3;
  BOOL result;

  v3 = AXSettingsReturnBoolValue(CFSTR("TouchAccommodationsHoldDurationAllowsSwipeGesturesToBypassPreference"), 0);
  result = 0;
  if (v3)
    return -[AXSettings touchAccommodationsTapActivationMethod](self, "touchAccommodationsTapActivationMethod") == 0;
  return result;
}

- (BOOL)touchAccommodationsIgnoreRepeatEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("TouchAccommodationsIgnoreRepeatEnabledPreference"), 0);
}

- (void)setTouchAccommodationsIgnoreRepeatEnabled:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TouchAccommodationsIgnoreRepeatEnabledPreference"));

  -[AXSettings _updateTouchAccommodationsTripleClickSetting](self, "_updateTouchAccommodationsTripleClickSetting");
}

- (double)touchAccommodationsIgnoreRepeatDuration
{
  return AXSettingsReturnDoubleValue(CFSTR("TouchAccommodationsIgnoreRepeatDurationPreference"), *MEMORY[0x1E0CF3C70]);
}

- (void)setTouchAccommodationsIgnoreRepeatDuration:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3C68] < a3)
    a3 = *MEMORY[0x1E0CF3C68];
  if (*MEMORY[0x1E0CF3C70] >= a3)
    a3 = *MEMORY[0x1E0CF3C70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TouchAccommodationsIgnoreRepeatDurationPreference"));

}

- (int64_t)touchAccommodationsTapActivationMethod
{
  void *v2;
  int64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("TouchAccommodationsTapActivationMethodPreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (void)setTouchAccommodationsTapActivationMethod:(int64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TouchAccommodationsTapActivationMethodPreference"));

  -[AXSettings _updateTouchAccommodationsTripleClickSetting](self, "_updateTouchAccommodationsTripleClickSetting");
}

- (double)touchAccommodationsTapActivationTimeout
{
  return AXSettingsReturnDoubleValue(CFSTR("TouchAccommodationsTapActivationTimeOutPreference"), *MEMORY[0x1E0CF3C90]);
}

- (void)setTouchAccommodationsTapActivationTimeout:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3C88] < a3)
    a3 = *MEMORY[0x1E0CF3C88];
  if (*MEMORY[0x1E0CF3C90] >= a3)
    a3 = *MEMORY[0x1E0CF3C90];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TouchAccommodationsTapActivationTimeOutPreference"));

}

- (BOOL)stickyKeysEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("StickyKeysEnabled"), 0);
}

- (void)setStickyKeysEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("StickyKeysEnabled"));

}

- (BOOL)stickyKeysShiftToggleEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("StickyKeysShiftToggleEnabled"), 0);
}

- (void)setStickyKeysShiftToggleEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("StickyKeysShiftToggleEnabled"));

}

- (BOOL)stickyKeysBeepEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("StickyKeysBeepEnabled"), 1);
}

- (void)setStickyKeysBeepEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("StickyKeysBeepEnabled"));

}

- (void)setMagnifierEnabled:(BOOL)a3 changeTripleClickMenu:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  const void *v6;
  CFStringRef *v7;
  const __CFString *v8;
  const __CFString *v9;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = a4;
  v5 = a3;
  -[AXSettings setMagnifierEnabled:](self, "setMagnifierEnabled:");
  if (v4)
  {
    if (v5)
      _AXSTripleClickAddOption();
    else
      _AXSTripleClickRemoveOption();
  }
  v6 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v7 = (CFStringRef *)MEMORY[0x1E0DDDF30];
  v8 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v9 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(CFSTR("SBIconVisibility"), v6, (CFStringRef)*MEMORY[0x1E0DDDF30], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSynchronize(*v7, v8, v9);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.appIconVisibilityPreferencesChanged"), 0, 0, 1u);
}

- (NSData)fullKeyboardAccessCommandMapData
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("CommandMapData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
LABEL_7:
    v3 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    FKALogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXSettings fullKeyboardAccessCommandMapData].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    goto LABEL_7;
  }
  v3 = v2;
LABEL_8:

  return (NSData *)v3;
}

- (void)setFullKeyboardAccessCommandMapData:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("CommandMapData"));
}

- (double)fullKeyboardAccessFocusRingTimeout
{
  return AXSettingsReturnDoubleValue(CFSTR("FocusRingTimeout"), *MEMORY[0x1E0CF3C10]);
}

- (void)setFullKeyboardAccessFocusRingTimeout:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3C20] >= a3)
    a3 = *MEMORY[0x1E0CF3C20];
  if (*MEMORY[0x1E0CF3C18] < a3)
    a3 = *MEMORY[0x1E0CF3C18];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("FocusRingTimeout"));

}

- (BOOL)fullKeyboardAccessFocusRingTimeoutEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("FocusRingTimeoutEnabled"), 1);
}

- (void)setFullKeyboardAccessFocusRingTimeoutEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("FocusRingTimeoutEnabled"));

}

- (BOOL)fullKeyboardAccessLargeFocusRingEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("FullKeyboardAccessLargeFocusRingEnabled"), 0);
}

- (void)setFullKeyboardAccessLargeFocusRingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("FullKeyboardAccessLargeFocusRingEnabled"));

}

- (BOOL)fullKeyboardAccessFocusRingHighContrastEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("FullKeyboardAccessFocusRingHighContrastEnabled"), 0);
}

- (void)setFullKeyboardAccessFocusRingHighContrastEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("FullKeyboardAccessFocusRingHighContrastEnabled"));

}

- (void)setFullKeyboardAccessFocusRingColor:(int64_t)a3
{
  id v4;

  if ((unint64_t)a3 > 7)
    a3 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("FullKeyboardAccessFocusRingColor"));

}

- (int64_t)fullKeyboardAccessFocusRingColor
{
  return AXSettingsReturnIntegerValue(CFSTR("FullKeyboardAccessFocusRingColor"), 0);
}

- (BOOL)fullKeyboardAccessShouldShowTextEditingModeInstructions
{
  return AXSettingsReturnBoolValue(CFSTR("ShouldShowTextEditingModeInstructions"), 1);
}

- (void)setFullKeyboardAccessShouldShowTextEditingModeInstructions:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ShouldShowTextEditingModeInstructions"));

}

- (BOOL)fullKeyboardAccessShouldShowDebugKeyCommandsView
{
  return AXSettingsReturnBoolValue(CFSTR("FullKeyboardAccessShouldShowDebugKeyCommandsViewPreference"), 0);
}

- (void)setFullKeyboardAccessShouldShowDebugKeyCommandsView:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("FullKeyboardAccessShouldShowDebugKeyCommandsViewPreference"));

}

- (void)setAppValidationTestingMode:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAppValidatingTestingPreference"));

}

- (BOOL)isAXValidationRunnerCollectingValidations
{
  return AXSettingsReturnBoolValue(CFSTR("IsAXValidationRunnerCollectingValidations"), 0);
}

- (void)setIsAXValidationRunnerCollectingValidations:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("IsAXValidationRunnerCollectingValidations"));

}

- (BOOL)gizmoApplicationAccessibilityEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("GizmoApplicationAccessibilityEnabled"), 1);
}

- (void)setGizmoApplicationAccessibilityEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("GizmoApplicationAccessibilityEnabled"));

}

- (void)gizmoSetAutoSpeakEnabledForComplication:(id)a3 slot:(id)a4 face:(id)a5 toggle:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  const __CFAllocator *v13;
  void *v14;
  void *DeepCopy;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v6 = a6;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  -[AXSettings gizmoGetWatchFaceAutoSpeakPreferences](self, "gizmoGetWatchFaceAutoSpeakPreferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(v13, v14, 1uLL);

  objc_msgSend(DeepCopy, "objectForKeyedSubscript:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(DeepCopy, "setObject:forKeyedSubscript:", v17, v10);

  }
  objc_msgSend(DeepCopy, "objectForKeyedSubscript:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(DeepCopy, "objectForKeyedSubscript:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v11);

  }
  objc_msgSend(DeepCopy, "objectForKeyedSubscript:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v23, "addObject:", v12);
  else
    objc_msgSend(v23, "removeObject:", v12);
  AXLogCommon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412802;
    v27 = v25;
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_18C62B000, v24, OS_LOG_TYPE_DEFAULT, "set auto speak value: %@, slot: %@, face: %@", (uint8_t *)&v26, 0x20u);

  }
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", DeepCopy, CFSTR("GizmoAutoSpeakComplicationsPreference"));

}

- (BOOL)gizmoGetAutoSpeakEnabledForComplication:(id)a3 slot:(id)a4 face:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AXSettings gizmoGetWatchFaceAutoSpeakPreferences](self, "gizmoGetWatchFaceAutoSpeakPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v13, "containsObject:", v8);
  return (char)v9;
}

- (id)gizmoGetWatchFaceAutoSpeakPreferences
{
  uint64_t v2;

  v2 = objc_opt_class();
  return AXSettingsReturnObjectValueWithClass(CFSTR("GizmoAutoSpeakComplicationsPreference"), MEMORY[0x1E0C9AA70], v2);
}

- (int64_t)voiceOverSpeakSecondsEncoding
{
  return AXSettingsReturnIntegerValue(CFSTR("VoiceOverSpeakSecondsEncoding"), 1);
}

- (void)setVoiceOverSpeakSecondsEncoding:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverSpeakSecondsEncoding"));

}

- (void)setVoiceOverDirectTouchEnabledApps:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSVoiceOverDirectTouchEnabledApps"));
}

- (NSDictionary)voiceOverDirectTouchEnabledApps
{
  uint64_t v2;

  v2 = objc_opt_class();
  return (NSDictionary *)AXSettingsReturnObjectValueWithClass(CFSTR("AXSVoiceOverDirectTouchEnabledApps"), 0, v2);
}

- (void)setImageCaptioningDisabledApps:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSImageCaptioningDisabledApps"));
}

- (NSArray)imageCaptioningDisabledApps
{
  uint64_t v2;

  v2 = objc_opt_class();
  return (NSArray *)AXSettingsReturnObjectValueWithClass(CFSTR("AXSImageCaptioningDisabledApps"), 0, v2);
}

- (void)setRemoteHandGestureCustomizedActions:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("RemoteHandGestureCustomizedActions"));
}

- (NSDictionary)remoteHandGestureCustomizedActions
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  AXSettingsReturnObjectValueWithClass(CFSTR("RemoteHandGestureCustomizedActions"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setImageCaptionGenderStrategy:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSImageCaptionGenderStrategy"));

}

- (unint64_t)imageCaptionGenderStrategy
{
  return 0;
}

- (int64_t)voiceOverNavigationStyle
{
  return AXSettingsReturnIntegerValue(CFSTR("AXSVoiceOverNavigationStyle"), 0);
}

- (void)setVoiceOverNavigationStyle:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverNavigationStyle"));

}

- (BOOL)voiceOverHandGesturesEnabled
{
  int v2;

  v2 = _os_feature_enabled_impl();
  if (v2)
    LOBYTE(v2) = AXSettingsReturnBoolValue(CFSTR("VoiceOverWatchHandGestures"), 0);
  return v2;
}

- (void)setVoiceOverHandGesturesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("VoiceOverWatchHandGestures"));

  }
}

- (NSDictionary)voiceOverHandGesturesActionCustomizations
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!_os_feature_enabled_impl())
    goto LABEL_11;
  if (!VoiceOverServicesLibraryCore_frameworkLibrary)
  {
    v14 = xmmword_1E24C89D0;
    v15 = 0;
    VoiceOverServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (VoiceOverServicesLibraryCore_frameworkLibrary)
  {
    -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("VoiceOverWatchHandGesturesActionCustomizations"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v4 = (void *)MEMORY[0x1E0CB3710],
          v5 = objc_opt_class(),
          objc_msgSend(v4, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v5, objc_opt_class(), v3, 0), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2050000000;
      v7 = (void *)getVOSVoiceOverGreyCommandInfoClass_softClass;
      v13 = getVOSVoiceOverGreyCommandInfoClass_softClass;
      if (!getVOSVoiceOverGreyCommandInfoClass_softClass)
      {
        *(_QWORD *)&v14 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v14 + 1) = 3221225472;
        v15 = __getVOSVoiceOverGreyCommandInfoClass_block_invoke;
        v16 = &unk_1E24C4AE0;
        v17 = &v10;
        __getVOSVoiceOverGreyCommandInfoClass_block_invoke((uint64_t)&v14);
        v7 = (void *)v11[3];
      }
      v8 = objc_retainAutorelease(v7);
      _Block_object_dispose(&v10, 8);
      objc_msgSend(v8, "defaultCustomizeGestures", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
LABEL_11:
    v6 = 0;
  }
  return (NSDictionary *)v6;
}

- (void)setVoiceOverHandGesturesActionCustomizations:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverWatchHandGesturesActionCustomizations"));

  }
}

- (BOOL)zoomHandGesturesEnabled
{
  int v2;

  v2 = _os_feature_enabled_impl();
  if (v2)
    LOBYTE(v2) = AXSettingsReturnBoolValue(CFSTR("ZoomWatchHandGestures"), 0);
  return v2;
}

- (void)setZoomHandGesturesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v5, CFSTR("ZoomWatchHandGestures"));

  }
}

- (NSDictionary)zoomHandGesturesActionCustomizations
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!_os_feature_enabled_impl())
    goto LABEL_11;
  if (!operator||)
  {
    v14 = xmmword_1E24C89E8;
    v15 = 0;
    operator|| = _sl_dlopen();
  }
  if (operator||)
  {
    -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("ZoomWatchHandGesturesActionCustomizations"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v4 = (void *)MEMORY[0x1E0CB3710],
          v5 = objc_opt_class(),
          objc_msgSend(v4, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v5, objc_opt_class(), v3, 0), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2050000000;
      v7 = (void *)getZoomServicesGreyCommandInfoClass_softClass;
      v13 = getZoomServicesGreyCommandInfoClass_softClass;
      if (!getZoomServicesGreyCommandInfoClass_softClass)
      {
        *(_QWORD *)&v14 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v14 + 1) = 3221225472;
        v15 = __getZoomServicesGreyCommandInfoClass_block_invoke;
        v16 = &unk_1E24C4AE0;
        v17 = &v10;
        __getZoomServicesGreyCommandInfoClass_block_invoke((uint64_t)&v14);
        v7 = (void *)v11[3];
      }
      v8 = objc_retainAutorelease(v7);
      _Block_object_dispose(&v10, 8);
      objc_msgSend(v8, "defaultCustomizeGestures", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
LABEL_11:
    v6 = 0;
  }
  return (NSDictionary *)v6;
}

- (void)setZoomHandGesturesActionCustomizations:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ZoomWatchHandGesturesActionCustomizations"));

  }
}

- (BOOL)voiceOverSoundCurtain
{
  return AXSettingsReturnBoolValue(CFSTR("AXSVoiceOverSoundCurtain"), 0);
}

- (void)setVoiceOverSoundCurtain:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSVoiceOverSoundCurtain"));

}

- (BOOL)voiceOverSceneDescriptionsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AXSSceneDescriptions"), 1);
}

- (void)setVoiceOverSceneDescriptionsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSSceneDescriptions"));

}

- (NSURL)alexLocalAssetURL
{
  void *v2;
  void *v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSAlexLocalAssetURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)setAlexLocalAssetURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "path");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAlexLocalAssetURL"));

}

- (BOOL)localizationQACaptionShowFilePath
{
  return AXSettingsReturnBoolValue(CFSTR("LocCaptionShowFilePath"), 1);
}

- (void)setLocalizationQACaptionShowFilePath:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("LocCaptionShowFilePath"));

}

- (BOOL)localizationQACaptionShowUSString
{
  return AXSettingsReturnBoolValue(CFSTR("LocCaptionShowUSString"), 1);
}

- (void)setLocalizationQACaptionShowUSString:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("LocCaptionShowUSString"));

}

- (BOOL)localizationQACaptionShowLocalizedString
{
  return AXSettingsReturnBoolValue(CFSTR("LocCaptionShowLocalizedString"), 1);
}

- (void)setLocalizationQACaptionShowLocalizedString:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("LocCaptionShowLocalizedString"));

}

- (BOOL)localizationQACaptionMode
{
  return _AXSLocalizationCaptionMode() != 0;
}

- (void)setLocalizationQACaptionMode:(BOOL)a3
{
  _AXSSetLocalizationCaptionModeEnabled();
}

- (BOOL)shouldFlashWhileUnlocked
{
  return AXSettingsReturnBoolValue(CFSTR("LEDFlashWhileUnlocked"), 0);
}

- (void)setShouldFlashWhileUnlocked:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("LEDFlashWhileUnlocked"));

}

- (BOOL)shouldFlashForAlertInSilentMode
{
  return AXSettingsReturnBoolValue(CFSTR("LEDFlashOnRingerSwitchSilent"), 1);
}

- (void)setShouldFlashForAlertInSilentMode:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("LEDFlashOnRingerSwitchSilent"));

}

- (BOOL)shouldSpeakMedicalPreamble
{
  return AXSettingsReturnBoolValue(CFSTR("SpeakMedicalPreamble"), 0);
}

- (void)setShouldSpeakMedicalPreamble:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SpeakMedicalPreamble"));

}

- (BOOL)shouldTTYMedicalPreamble
{
  return AXSettingsReturnBoolValue(CFSTR("TTYMedicalPreamble"), 0);
}

- (void)setShouldTTYMedicalPreamble:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TTYMedicalPreamble"));

}

- (NSString)medicalPreamble
{
  return (NSString *)-[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("SOSMedicalPreamble"));
}

- (void)setMedicalPreamble:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("SOSMedicalPreamble"));
}

- (BOOL)shouldLimitDisplayRefreshRate
{
  return AXSettingsReturnBoolValue(CFSTR("LimitDisplayRefreshRate"), 0);
}

- (void)setShouldLimitDisplayRefreshRate:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("LimitDisplayRefreshRate"));

}

- (double)lastMagnifierResetCount
{
  return AXSettingsReturnDoubleValue(CFSTR("lastMagnifierResetCount"), 0.0);
}

- (void)setLastMagnifierResetCount:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("lastMagnifierResetCount"));

}

- (double)lastSmartInvertColorsEnablement
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSLastSmartInvertColorsEnablement"), 0.0);
}

- (void)setLastSmartInvertColorsEnablement:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSLastSmartInvertColorsEnablement"));

}

- (double)lastHearingAidHandoffTimeResetCount
{
  return AXSettingsReturnDoubleValue(CFSTR("lastHearingAidHandoffTimeResetCount"), 0.0);
}

- (void)setlastHearingAidHandoffTimeResetCount:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("lastHearingAidHandoffTimeResetCount"));

}

- (double)lastHearingAidControlPanelTimeResetCount
{
  return AXSettingsReturnDoubleValue(CFSTR("lastHearingAidControlPanelTimeResetCount"), 0.0);
}

- (void)setlastHearingAidControlPanelTimeResetCount:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("lastHearingAidControlPanelTimeResetCount"));

}

- (double)lastBrailleScreenInputTimeResetCount
{
  return AXSettingsReturnDoubleValue(CFSTR("lastBrailleScreenInputTimeResetCount"), 0.0);
}

- (void)setLastBrailleScreenInputTimeResetCount:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("lastBrailleScreenInputTimeResetCount"));

}

- (double)lastTapticTimeResetCount
{
  return AXSettingsReturnDoubleValue(CFSTR("lastTapticTimeResetCount"), 0.0);
}

- (void)setLastTapticTimeResetCount:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("lastTapticTimeResetCount"));

}

- (double)lastGuidedAccessTimeResetCount
{
  return AXSettingsReturnDoubleValue(CFSTR("lastGuidedAccessTimeResetCount"), 0.0);
}

- (void)setlastGuidedAccessTimeResetCount:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("lastGuidedAccessTimeResetCount"));

}

- (double)lastGuidedAccessTimeLimitResetCount
{
  return AXSettingsReturnDoubleValue(CFSTR("lastGuidedAccessTimeLimitResetCount"), 0.0);
}

- (void)setlastGuidedAccessTimeLimitResetCount:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("lastGuidedAccessTimeLimitResetCount"));

}

- (double)lastPlatformSwitchTimeResetCount
{
  return AXSettingsReturnDoubleValue(CFSTR("lastPlatformSwitchTimeResetCount"), 0.0);
}

- (void)setlastPlatformSwitchTimeResetCount:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("lastPlatformSwitchTimeResetCount"));

}

- (double)lastCharacterVoiceTimeResetCount
{
  return AXSettingsReturnDoubleValue(CFSTR("lastCharacterVoiceTimeResetCount"), 0.0);
}

- (void)setLastCharacterVoiceTimeResetCount:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("lastCharacterVoiceTimeResetCount"));

}

- (double)lastAssistiveTouchTimeResetCount
{
  return AXSettingsReturnDoubleValue(CFSTR("lastAssistiveTouchTimeResetCount"), 0.0);
}

- (void)setLastAssistiveTouchTimeResetCount:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("lastAssistiveTouchTimeResetCount"));

}

- (NSDictionary)assistiveTouchUsageCount
{
  uint64_t v2;

  v2 = objc_opt_class();
  return (NSDictionary *)AXSettingsReturnObjectValueWithClass(CFSTR("assistiveTouchUsageCount"), 0, v2);
}

- (void)setAssistiveTouchUsageCount:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("assistiveTouchUsageCount"));
}

- (int64_t)magnifierUsageCount
{
  return AXSettingsReturnIntegerValue(CFSTR("magnifierUsageCount"), 0);
}

- (void)setMagnifierUsageCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("magnifierUsageCount"));

}

- (int64_t)tapticTimeUsageCount
{
  return AXSettingsReturnIntegerValue(CFSTR("tapticTimeUsageCount"), 0);
}

- (void)setTapticTimeUsageCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("tapticTimeUsageCount"));

}

- (int64_t)switchControlPlatformSwitchedCount
{
  return AXSettingsReturnIntegerValue(CFSTR("switchControlPlatformSwitchedCount"), 0);
}

- (void)setSwitchControlPlatformSwitchedCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("switchControlPlatformSwitchedCount"));

}

- (int64_t)hearingAidHandOffCount
{
  return AXSettingsReturnIntegerValue(CFSTR("hearingAidHandOffCount"), 0);
}

- (void)setHearingAidHandOffCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("hearingAidHandOffCount"));

}

- (int64_t)hearingAidControlPanelCount
{
  return AXSettingsReturnIntegerValue(CFSTR("hearingAidControlPanelCount"), 0);
}

- (void)setHearingAidControlPanelCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("hearingAidControlPanelCount"));

}

- (int64_t)characterVoicesUsageCount
{
  return AXSettingsReturnIntegerValue(CFSTR("characterVoicesUsageCount"), 0);
}

- (void)setCharacterVoicesUsageCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("characterVoicesUsageCount"));

}

- (int64_t)guidedAccessTimeLimitsUsageCount
{
  return AXSettingsReturnIntegerValue(CFSTR("guidedAccessTimeLimitsUsageCount"), 0);
}

- (void)setGuidedAccessTimeLimitsUsageCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("guidedAccessTimeLimitsUsageCount"));

}

- (int64_t)brokenHomeButtonCount
{
  return AXSettingsReturnIntegerValue(CFSTR("brokenHomeButtonCount"), 0);
}

- (void)setBrokenHomeButtonCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("brokenHomeButtonCount"));

}

- (int64_t)voiceOverBSIUsageCount
{
  return AXSettingsReturnIntegerValue(CFSTR("voiceOverBSIUsageCount"), 0);
}

- (void)setVoiceOverBSIUsageCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("voiceOverBSIUsageCount"));

}

- (void)setGuidedAccessUsageCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("GuidedAccessUsageCount"));

}

- (int64_t)guidedAccessUsageCount
{
  void *v2;
  int64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("GuidedAccessUsageCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)didResetD22Preferences
{
  return AXSettingsReturnBoolValue(CFSTR("AXSDidResetD22Preferences"), 0);
}

- (void)setDidResetD22Preferences:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSDidResetD22Preferences"));

}

- (BOOL)reachabilityEnabled
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getSBSIsReachabilityEnabledSymbolLoc_ptr;
  v9 = getSBSIsReachabilityEnabledSymbolLoc_ptr;
  if (!getSBSIsReachabilityEnabledSymbolLoc_ptr)
  {
    v3 = (void *)SpringBoardServicesLibrary();
    v2 = dlsym(v3, "SBSIsReachabilityEnabled");
    v7[3] = (uint64_t)v2;
    getSBSIsReachabilityEnabledSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
    -[AXSettings reachabilityEnabled].cold.1();
  return ((uint64_t (*)(uint64_t))v2)(v4);
}

- (void)setReachabilityEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v4 = getSBSSetReachabilityEnabledSymbolLoc_ptr;
  v9 = getSBSSetReachabilityEnabledSymbolLoc_ptr;
  if (!getSBSSetReachabilityEnabledSymbolLoc_ptr)
  {
    v5 = (void *)SpringBoardServicesLibrary();
    v4 = dlsym(v5, "SBSSetReachabilityEnabled");
    v7[3] = (uint64_t)v4;
    getSBSSetReachabilityEnabledSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v6, 8);
  if (!v4)
    -[AXSettings setReachabilityEnabled:].cold.1();
  ((void (*)(_BOOL8))v4)(v3);
}

- (void)setPerAppSettingsCustomizedAppIDs:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSPerAppSettingsCustomizedAppIDs"));
}

- (NSArray)perAppSettingsCustomizedAppIDs
{
  uint64_t v2;

  v2 = objc_opt_class();
  return (NSArray *)AXSettingsReturnObjectValueWithClass(CFSTR("AXSPerAppSettingsCustomizedAppIDs"), 0, v2);
}

- (void)setPerAppSettingsStats:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSPerAppSettingsStats"));
}

- (id)_customizedAppIDs
{
  void *v2;
  void *v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AXSettingsPerAppIDsArray"), (CFStringRef)*MEMORY[0x1E0CF38F8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (v3 = (void *)objc_msgSend(v2, "mutableCopy")) == 0)
    v3 = (void *)objc_opt_new();

  return v3;
}

- (void)addCustomizedAppID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    -[AXSettings _customizedAppIDs](self, "_customizedAppIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsObject:", v6) & 1) == 0)
      objc_msgSend(v5, "addObject:", v6);
    CFPreferencesSetValue(CFSTR("AXSettingsPerAppIDsArray"), v5, (CFStringRef)*MEMORY[0x1E0CF38F8], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);

    v4 = v6;
  }

}

- (void)removeCustomizedAppID:(id)a3
{
  id v4;
  BOOL v5;
  const void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = _AXSEnhanceTextLegibilityEnabledApp() == -1;
    v4 = v8;
    if (v5)
    {
      v5 = _AXSButtonShapesEnabledApp() == -1;
      v4 = v8;
      if (v5)
      {
        v5 = _AXSIncreaseButtonLegibilityApp() == -1;
        v4 = v8;
        if (v5)
        {
          v5 = _AXSEnhanceBackgroundContrastEnabledApp() == -1;
          v4 = v8;
          if (v5)
          {
            v5 = _AXDarkenSystemColorsApp() == -1;
            v4 = v8;
            if (v5)
            {
              v5 = _AXSDifferentiateWithoutColorEnabledApp() == -1;
              v4 = v8;
              if (v5)
              {
                v5 = _AXSInvertColorsEnabledApp() == -1;
                v4 = v8;
                if (v5)
                {
                  v5 = _AXSReduceMotionEnabledApp() == -1;
                  v4 = v8;
                  if (v5)
                  {
                    v5 = _AXSReduceMotionReduceSlideTransitionsEnabledApp() == -1;
                    v4 = v8;
                    if (v5)
                    {
                      v6 = (const void *)_AXSCopyPreferredContentSizeCategoryNameApp();
                      if (v6)
                      {
                        CFRelease(v6);
                      }
                      else
                      {
                        -[AXSettings _customizedAppIDs](self, "_customizedAppIDs");
                        v7 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v7, "removeObject:", v8);
                        CFPreferencesSetValue(CFSTR("AXSettingsPerAppIDsArray"), v7, (CFStringRef)*MEMORY[0x1E0CF38F8], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);

                      }
                      v4 = v8;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

}

- (void)aggregatePerAppSettingsStatistics
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;

  v2 = PerAppSettingsQueue;
  if (!PerAppSettingsQueue)
  {
    v3 = dispatch_queue_create("com.apple.accessibility.axsharedsettings.perappsettings", 0);
    v4 = (void *)PerAppSettingsQueue;
    PerAppSettingsQueue = (uint64_t)v3;

    v2 = PerAppSettingsQueue;
  }
  dispatch_async(v2, &__block_literal_global_1372);
}

void __47__AXSettings_aggregatePerAppSettingsStatistics__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _BOOL4 v8;
  const void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  AXInstalledAppIDs();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        v7 = _AXSEnhanceTextLegibilityEnabledApp();
        v8 = v7 != -1;
        if (v7 != -1)
          objc_msgSend(v1, "addObject:", CFSTR("com.apple.accessibility.perappsettings.bold.text"));
        if (_AXSButtonShapesEnabledApp() != -1)
        {
          objc_msgSend(v1, "addObject:", CFSTR("com.apple.accessibility.perappsettings.button.shapes"));
          v8 = 1;
        }
        if (_AXSIncreaseButtonLegibilityApp() != -1)
        {
          objc_msgSend(v1, "addObject:", CFSTR("com.apple.accessibility.perappsettings.onoff.labels"));
          v8 = 1;
        }
        if (_AXSEnhanceBackgroundContrastEnabledApp() != -1)
        {
          objc_msgSend(v1, "addObject:", CFSTR("com.apple.accessibility.perappsettings.reduce.transparency"));
          v8 = 1;
        }
        if (_AXDarkenSystemColorsApp() != -1)
        {
          objc_msgSend(v1, "addObject:", CFSTR("com.apple.accessibility.perappsettings.increase.contrast"));
          v8 = 1;
        }
        if (_AXSDifferentiateWithoutColorEnabledApp() != -1)
        {
          objc_msgSend(v1, "addObject:", CFSTR("com.apple.accessibility.perappsettings.differentiate.without.color"));
          v8 = 1;
        }
        if (_AXSInvertColorsEnabledApp() != -1)
        {
          objc_msgSend(v1, "addObject:", CFSTR("com.apple.accessibility.perappsettings.smart.invert"));
          v8 = 1;
        }
        if (_AXSReduceMotionEnabledApp() != -1)
        {
          objc_msgSend(v1, "addObject:", CFSTR("com.apple.accessibility.perappsettings.reduce.motion"));
          v8 = 1;
        }
        if (_AXSReduceMotionReduceSlideTransitionsEnabledApp() != -1)
        {
          objc_msgSend(v1, "addObject:", CFSTR("com.apple.accessibility.perappsettings.prefer.crossfade.transitions"));
          v9 = (const void *)_AXSCopyPreferredContentSizeCategoryNameApp();
          if (v9)
          {
LABEL_26:
            CFRelease(v9);
            objc_msgSend(v1, "addObject:", CFSTR("com.apple.accessibility.perappsettings.textsize"));
          }
LABEL_27:
          objc_msgSend(v1, "addObject:", CFSTR("com.apple.accessibility.perappsettings.customized"));
          goto LABEL_28;
        }
        v9 = (const void *)_AXSCopyPreferredContentSizeCategoryNameApp();
        if (v9)
          goto LABEL_26;
        if (v8)
          goto LABEL_27;
LABEL_28:
        ++v6;
      }
      while (v4 != v6);
      v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      v4 = v10;
    }
    while (v10);
  }

  v11 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v1;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "countForObject:", v17, (_QWORD)v20));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v18, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPerAppSettingsStats:", v11);

}

- (void)setCallAudioRoutingAutoAnswerDelay:(double)a3
{
  id v4;

  if (*MEMORY[0x1E0CF3BE8] < a3)
    a3 = *MEMORY[0x1E0CF3BE8];
  if (*MEMORY[0x1E0CF3BF0] >= a3)
    a3 = *MEMORY[0x1E0CF3BF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("CallAudioRoutingAutoAnswerPreference"));

}

- (double)callAudioRoutingAutoAnswerDelay
{
  double result;

  result = AXSettingsReturnDoubleValue(CFSTR("CallAudioRoutingAutoAnswerPreference"), 3.0);
  if (*MEMORY[0x1E0CF3BE8] < result)
    result = *MEMORY[0x1E0CF3BE8];
  if (*MEMORY[0x1E0CF3BF0] >= result)
    return *MEMORY[0x1E0CF3BF0];
  return result;
}

- (void)setCallAudioRoutingAutoAnswerEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("CallAudioRoutingAutoAnswerEnabledPreference"));

}

- (BOOL)callAudioRoutingAutoAnswerEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("CallAudioRoutingAutoAnswerEnabledPreference"), 0);
}

- (void)setVoiceOverSleepOnWristDownPreference:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VoiceOverSleepOnWristDownPreference"));

}

- (BOOL)voiceOverSleepOnWristDownPreference
{
  return AXSettingsReturnBoolValue(CFSTR("VoiceOverSleepOnWristDownPreference"), 1);
}

- (void)setAssistiveTouchSleepOnWristDownPreference:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AssistiveTouchSleepOnWristDownPreference"));

}

- (BOOL)assistiveTouchSleepOnWristDownPreference
{
  return AXSettingsReturnBoolValue(CFSTR("AssistiveTouchSleepOnWristDownPreference"), 1);
}

- (void)setBackTapEnabled:(BOOL)a3
{
  _AXSBackTapSetEnabled();
}

- (void)setBackTapUsageCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSBackTapUsageCount"));

}

- (int64_t)backTapUsageCount
{
  void *v2;
  int64_t v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSBackTapUsageCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setBackTapDoubleTapAction:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSBackTapDoubleTapAction"));
}

- (NSString)backTapDoubleTapAction
{
  void *v2;
  id v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSBackTapDoubleTapAction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("__NONE__")) & 1) != 0)
    v3 = 0;
  else
    v3 = v2;

  return (NSString *)v3;
}

- (void)setBackTapTripleTapAction:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSBackTapTripleTapAction"));
}

- (NSString)backTapTripleTapAction
{
  void *v2;
  id v3;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSBackTapTripleTapAction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("__NONE__")) & 1) != 0)
    v3 = 0;
  else
    v3 = v2;

  return (NSString *)v3;
}

- (BOOL)backTapFalsePositiveAlertsEnabled
{
  int v3;
  void *v4;
  char v5;

  v3 = AXIsInternalInstall();
  if (v3)
  {
    -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSBackTapFalsePositiveAlertsEnabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setBackTapFalsePositiveAlertsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSBackTapFalsePositiveAlertsEnabled"));

}

- (BOOL)backTapRNNModelEnabled
{
  void *v3;
  char v4;

  if (!AXIsInternalInstall() || !_os_feature_enabled_impl())
    return 0;
  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSBackTapRNNModelEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setBackTapRNNModelEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSBackTapRNNModelEnabled"));

}

- (NSDictionary)assistiveTouchActionsBySoundAction
{
  void *v2;
  void *v3;
  NSDictionary *v4;

  -[AXSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", CFSTR("AXSAssistiveTouchActionBySoundActionsPreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v4 = v2;

  return v4;
}

- (void)setAssistiveTouchActionsBySoundAction:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSAssistiveTouchActionBySoundActionsPreference"));
}

- (BOOL)isAdaptiveVoiceShortcutsEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("AdaptiveVoiceShortcuts"), 0);
}

- (void)setAdaptiveVoiceShortcutsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AdaptiveVoiceShortcuts"));

}

- (double)audiogramIngestionLastModelAccess
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSAudiogramIngestionLastModelAccess"), 0.0);
}

- (void)setAudiogramIngestionLastModelAccess:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSAudiogramIngestionLastModelAccess"));

}

- (double)soundActionsLastModelAccess
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSSoundActionsLastModelAccess"), 0.0);
}

- (void)setSoundActionsLastModelAccess:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSSoundActionsLastModelAccess"));

}

- (double)soundDetectionLastModelAccess
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSoundDetectionLastModelAccess"), 0.0);
}

- (void)setSoundDetectionLastModelAccess:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSoundDetectionLastModelAccess"));

}

- (double)cameraButtonSensitivity
{
  return AXSettingsReturnDoubleValue(CFSTR("CameraButtonSensitivity"), 0.0);
}

- (void)setCameraButtonSensitivity:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("CameraButtonSensitivity"));

}

- (BOOL)startupSoundEnabled
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((AXDeviceSupportsBootSound() & 1) != 0)
  {
    v2 = _AXSVoiceOverTouchEnabled();
    v3 = AXSettingsReturnBoolValue(CFSTR("StartupSoundEnabled"), v2 != 0);
    AXLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2 != 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_INFO, "Boot chime: value: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    AXLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_INFO, "Boot chime: Device does not support bootup sound", (uint8_t *)&v8, 2u);
    }
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)setStartupSoundEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("StartupSoundEnabled"));

}

- (BOOL)hapticMusicEnhancedPercussion
{
  return AXSettingsReturnBoolValue(CFSTR("AXSHapticMusicEnhancedPercussion"), 0);
}

- (void)setHapticMusicEnhancedPercussion:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSHapticMusicEnhancedPercussion"));

}

- (NSString)hapticMusicAlgorithmSelection
{
  uint64_t v2;

  v2 = objc_opt_class();
  return (NSString *)AXSettingsReturnObjectValueWithClass(CFSTR("AXSHapticMusicAlgorithmSelection"), 0, v2);
}

- (void)setHapticMusicAlgorithmSelection:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSHapticMusicAlgorithmSelection"));
}

- (BOOL)hapticMusicActive
{
  return AXSettingsReturnBoolValue(CFSTR("AXSHapticMusicActive"), 1);
}

- (void)setHapticMusicActive:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSHapticMusicActive"));

}

- (BOOL)hapticMusicToggledInPreferences
{
  return AXSettingsReturnBoolValue(CFSTR("AXSHapticMusicToggledInPreferences"), 0);
}

- (void)setHapticMusicToggledInPreferences:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSHapticMusicToggledInPreferences"));

}

- (double)hapticMusicUsagePerDay
{
  return AXSettingsReturnDoubleValue(CFSTR("AXSHapticMusicUsagePerDay"), 0.0);
}

- (void)setHapticMusicUsagePerDay:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSHapticMusicUsagePerDay"));

}

- (NSDate)hapticMusicUsageStartDate
{
  uint64_t v2;

  v2 = objc_opt_class();
  return (NSDate *)AXSettingsReturnObjectValueWithClass(CFSTR("AXSHapticMusicUsageStartDate"), 0, v2);
}

- (void)setHapticMusicUsageStartDate:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSHapticMusicUsageStartDate"));
}

- (BOOL)hapticMusicEnhancedVocals
{
  return AXSettingsReturnBoolValue(CFSTR("AXSHapticMusicEnhancedVocals"), 0);
}

- (void)setHapticMusicEnhancedVocals:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSHapticMusicEnhancedVocals"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXSettings;
  -[AXBaseSettings observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
}

- (BOOL)assistiveTouchOnDeviceEyeTrackingShouldOffsetBufferPoints
{
  return self->_assistiveTouchOnDeviceEyeTrackingShouldOffsetBufferPoints;
}

- (void)setAssistiveTouchOnDeviceEyeTrackingShouldOffsetBufferPoints:(BOOL)a3
{
  self->_assistiveTouchOnDeviceEyeTrackingShouldOffsetBufferPoints = a3;
}

- (void)setAssistiveTouchMotionTrackerShouldOffsetBufferPoints:(BOOL)a3
{
  self->_assistiveTouchMotionTrackerShouldOffsetBufferPoints = a3;
}

- (NSArray)switchControlCombinedTopLevelMenuItems
{
  return self->_switchControlCombinedTopLevelMenuItems;
}

- (void)setSwitchControlCombinedTopLevelMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_switchControlCombinedTopLevelMenuItems, a3);
}

- (int64_t)hoverTextScrollingSpeed
{
  return self->_hoverTextScrollingSpeed;
}

- (void)setHoverTextScrollingSpeed:(int64_t)a3
{
  self->_hoverTextScrollingSpeed = a3;
}

- (NSString)hoverTextContentSize
{
  return self->_hoverTextContentSize;
}

- (void)setHoverTextContentSize:(id)a3
{
  objc_storeStrong((id *)&self->_hoverTextContentSize, a3);
}

- (BOOL)hoverTextShowedBanner
{
  return self->_hoverTextShowedBanner;
}

- (void)setHoverTextShowedBanner:(BOOL)a3
{
  self->_hoverTextShowedBanner = a3;
}

- (BOOL)hoverTextTypingShowedBanner
{
  return self->_hoverTextTypingShowedBanner;
}

- (void)setHoverTextTypingShowedBanner:(BOOL)a3
{
  self->_hoverTextTypingShowedBanner = a3;
}

- (BOOL)magnifierEnabled
{
  return self->_magnifierEnabled;
}

- (void)setMagnifierEnabled:(BOOL)a3
{
  self->_magnifierEnabled = a3;
}

- (BOOL)magnifierShouldAdjustFiltersForAmbientLight
{
  return self->_magnifierShouldAdjustFiltersForAmbientLight;
}

- (void)setMagnifierShouldAdjustFiltersForAmbientLight:(BOOL)a3
{
  self->_magnifierShouldAdjustFiltersForAmbientLight = a3;
}

- (BOOL)magnifierShouldUseVideoStabilization
{
  return self->_magnifierShouldUseVideoStabilization;
}

- (void)setMagnifierShouldUseVideoStabilization:(BOOL)a3
{
  self->_magnifierShouldUseVideoStabilization = a3;
}

- (double)magnifierZoomLevel
{
  return self->_magnifierZoomLevel;
}

- (void)setMagnifierZoomLevel:(double)a3
{
  self->_magnifierZoomLevel = a3;
}

- (unint64_t)magnifierFilterSetIdentifier
{
  return self->_magnifierFilterSetIdentifier;
}

- (void)setMagnifierFilterSetIdentifier:(unint64_t)a3
{
  self->_magnifierFilterSetIdentifier = a3;
}

- (BOOL)magnifierFilterInverted
{
  return self->_magnifierFilterInverted;
}

- (void)setMagnifierFilterInverted:(BOOL)a3
{
  self->_magnifierFilterInverted = a3;
}

- (double)magnifierContrast
{
  return self->_magnifierContrast;
}

- (void)setMagnifierContrast:(double)a3
{
  self->_magnifierContrast = a3;
}

- (double)magnifierBrightness
{
  return self->_magnifierBrightness;
}

- (void)setMagnifierBrightness:(double)a3
{
  self->_magnifierBrightness = a3;
}

- (BOOL)assistiveTouchInternalOnlyHiddenNubbitModeEnabled
{
  return self->_assistiveTouchInternalOnlyHiddenNubbitModeEnabled;
}

- (BOOL)writeAXLogsToFile
{
  return self->_writeAXLogsToFile;
}

- (void)setWriteAXLogsToFile:(BOOL)a3
{
  self->_writeAXLogsToFile = a3;
}

- (void)setLiveSpeechMaxRecentsCount:(int64_t)a3
{
  self->_liveSpeechMaxRecentsCount = a3;
}

- (BOOL)voiceOverVerbositySpeakCustomActionsHint
{
  return self->_voiceOverVerbositySpeakCustomActionsHint;
}

- (void)setVoiceOverVerbositySpeakCustomActionsHint:(BOOL)a3
{
  self->_voiceOverVerbositySpeakCustomActionsHint = a3;
}

- (void)setTouchAccommodationsHoldDurationAllowsSwipeGesturesToBypass:(BOOL)a3
{
  self->_touchAccommodationsHoldDurationAllowsSwipeGesturesToBypass = a3;
}

- (float)reduceWhitePointLevel
{
  return self->_reduceWhitePointLevel;
}

- (void)setReduceWhitePointLevel:(float)a3
{
  self->_reduceWhitePointLevel = a3;
}

- (void)setLastPlatformSwitchTimeResetCount:(double)a3
{
  self->_lastPlatformSwitchTimeResetCount = a3;
}

- (void)setLastGuidedAccessTimeLimitResetCount:(double)a3
{
  self->_lastGuidedAccessTimeLimitResetCount = a3;
}

- (void)setLastGuidedAccessTimeResetCount:(double)a3
{
  self->_lastGuidedAccessTimeResetCount = a3;
}

- (void)setLastHearingAidControlPanelTimeResetCount:(double)a3
{
  self->_lastHearingAidControlPanelTimeResetCount = a3;
}

- (void)setLastHearingAidHandoffTimeResetCount:(double)a3
{
  self->_lastHearingAidHandoffTimeResetCount = a3;
}

- (void)setSwiftSettings:(id)a3
{
  objc_storeStrong((id *)&self->_swiftSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftSettings, 0);
  objc_storeStrong((id *)&self->_hoverTextContentSize, 0);
  objc_storeStrong((id *)&self->_switchControlCombinedTopLevelMenuItems, 0);
  objc_storeStrong((id *)&self->_unarchivedVoiceCache, 0);
  objc_storeStrong((id *)&self->_migratedSwitchControlMenuItemsPreferenceKeys, 0);
}

- (BOOL)accessibilityEnabled
{
  return _AXSAccessibilityEnabled() != 0;
}

- (BOOL)applicationAccessibilityEnabled
{
  return _AXSApplicationAccessibilityEnabled() != 0;
}

- (void)setApplicationAccessibilityEnabled:(BOOL)a3
{
  _AXSApplicationAccessibilitySetEnabled();
}

- (NSArray)tripleClickOptions
{
  return (NSArray *)(id)_AXSTripleClickCopyOptions();
}

- (void)setTripleClickOptions:(id)a3
{
  _AXSSetTripleClickOptions();
}

- (BOOL)appleTVRemoteClickpadTapsForDirectionalNavigationEnabled
{
  return _AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled() != 0;
}

- (void)setAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled:(BOOL)a3
{
  _AXSSetAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled();
}

- (BOOL)appleTVScaledUIEnabled
{
  return _AXSAppleTVScaledUIEnabled() != 0;
}

- (void)setAppleTVScaledUIEnabled:(BOOL)a3
{
  _AXSSetAppleTVScaledUIEnabled();
}

- (unint64_t)appleTVAppGridItemsPerLine
{
  if (_AXSAppleTVScaledUIEnabled())
    return 5;
  else
    return 6;
}

- (BOOL)assistiveTouchEnabled
{
  return _AXSAssistiveTouchEnabled() != 0;
}

- (void)setAssistiveTouchEnabled:(BOOL)a3
{
  void *v4;
  int v5;
  id v6;

  _AXSAssistiveTouchSetEnabled();
  if (!a3)
  {
    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "assistiveTouchEnabledByOnDeviceEyeTracking");

    if (v5)
    {
      +[AXSettings sharedInstance](AXSettings, "sharedInstance");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAssistiveTouchEnabledByOnDeviceEyeTracking:", 0);

    }
  }
}

- (BOOL)assistiveTouchHardwareEnabled
{
  return _AXSAssistiveTouchHardwareEnabled() != 0;
}

- (void)setAssistiveTouchHardwareEnabled:(BOOL)a3
{
  _AXSAssistiveTouchSetHardwareEnabled();
}

- (BOOL)assistiveTouchUIEnabled
{
  return _AXSAssistiveTouchUIEnabled() != 0;
}

- (void)setAssistiveTouchUIEnabled:(BOOL)a3
{
  _AXSAssistiveTouchSetUIEnabled();
}

- (BOOL)switchControlEnabled
{
  return _AXSAssistiveTouchScannerEnabled() != 0;
}

- (void)setSwitchControlEnabled:(BOOL)a3
{
  _AXSAssistiveTouchScannerSetEnabled();
}

- (BOOL)inspectorEnabled
{
  return _AXSAXInspectorEnabled() != 0;
}

- (void)setInspectorEnabled:(BOOL)a3
{
  _AXSAXInspectorSetEnabled();
}

- (BOOL)automationEnabled
{
  return _AXSAutomationEnabled() != 0;
}

- (void)setAutomationEnabled:(BOOL)a3
{
  _AXSSetAutomationEnabled();
}

- (BOOL)automationLocalizedStringLookupInfoEnabled
{
  return _AXSAutomationLocalizedStringLookupInfoEnabled() != 0;
}

- (void)setAutomationLocalizedStringLookupInfoEnabled:(BOOL)a3
{
  _AXSAutomationLocalizedStringLookupInfoSetEnabled();
}

- (BOOL)automationFauxCollectionViewCellsEnabled
{
  return _AXSAutomationFauxCollectionViewCellsEnabled() != 0;
}

- (BOOL)automationFauxTableViewCellsEnabled
{
  return _AXSAutomationFauxTableViewCellsEnabled() != 0;
}

- (void)setAutomationFauxCollectionViewCellsEnabled:(BOOL)a3
{
  _AXSAutomationSetFauxCollectionViewCellsEnabled();
}

- (void)setAutomationFauxTableViewCellsEnabled:(BOOL)a3
{
  _AXSAutomationSetFauxTableViewCellsEnabled();
}

- (BOOL)automationHitpointWarpingEnabled
{
  return _AXSAutomationHitpointWarpingEnabled() != 0;
}

- (void)setAutomationHitpointWarpingEnabled:(BOOL)a3
{
  _AXSAutomationSetHitpointWarpingEnabled();
}

- (BOOL)siriSemanticContextEnabled
{
  return _AXSSiriSemanticContextEnabled() != 0;
}

- (void)setSiriSemanticContextEnabled:(BOOL)a3
{
  _AXSSetSiriSemanticContextEnabled();
}

- (BOOL)voiceOverEnabled
{
  return _AXSVoiceOverTouchEnabled() != 0;
}

- (void)setVoiceOverEnabled:(BOOL)a3
{
  _AXSVoiceOverTouchSetEnabled();
}

- (float)voiceOverSpeakingRate
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  float v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  float *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = (float *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = dispatch_semaphore_create(0);
  -[AXSettings swiftSettings](self, "swiftSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceover");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__AXSettings_AccessibilitySupportFacade__voiceOverSpeakingRate__block_invoke;
  v9[3] = &unk_1E24C8920;
  v11 = &v12;
  v6 = v3;
  v10 = v6;
  objc_msgSend(v5, "effectiveSpeakingRateWithCurrentRotor:completionHandler:", 0, v9);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = v13[6];

  _Block_object_dispose(&v12, 8);
  return v7;
}

intptr_t __63__AXSettings_AccessibilitySupportFacade__voiceOverSpeakingRate__block_invoke(uint64_t a1, float a2)
{
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setVoiceOverSpeakingRate:(float)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  double v9;
  _QWORD v10[4];
  dispatch_semaphore_t v11;

  v5 = dispatch_semaphore_create(0);
  -[AXSettings swiftSettings](self, "swiftSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voiceover");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__AXSettings_AccessibilitySupportFacade__setVoiceOverSpeakingRate___block_invoke;
  v10[3] = &unk_1E24C4C38;
  v11 = v5;
  v8 = v5;
  *(float *)&v9 = a3;
  objc_msgSend(v7, "setEffectiveSpeakingRateWithCurrentRotor:value:completionHandler:", 0, v10, v9);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __67__AXSettings_AccessibilitySupportFacade__setVoiceOverSpeakingRate___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)voiceOverUsageConfirmed
{
  return _AXSVoiceOverTouchUsageConfirmed() != 0;
}

- (void)setVoiceOverUsageConfirmed:(BOOL)a3
{
  _AXSVoiceOverTouchSetUsageConfirmed();
}

- (BOOL)voiceOverEnabledThroughAccessory
{
  return _AXSVoiceOverTouchEnabledThroughAccessory() != 0;
}

- (void)setVoiceOverEnabledThroughAccessory:(BOOL)a3
{
  _AXSVoiceOverTouchSetEnabledThroughAccessory();
}

- (BOOL)voiceOverScreenCurtainEnabled
{
  return _AXSVoiceOverTouchScreenCurtainEnabled() != 0;
}

- (void)setVoiceOverScreenCurtainEnabled:(BOOL)a3
{
  _AXSVoiceOverTouchSetScreenCurtainEnabled();
}

- (BOOL)voiceOverUIEnabled
{
  return _AXSVoiceOverTouchUIEnabled() != 0;
}

- (void)setVoiceOverUIEnabled:(BOOL)a3
{
  _AXSVoiceOverTouchSetUIEnabled();
}

- (NSArray)voiceOverLanguageRotorItems
{
  return (NSArray *)(id)_AXSVoiceOverTouchCopyLanguageRotorItems();
}

- (void)setVoiceOverLanguageRotorItems:(id)a3
{
  _AXSVoiceOverTouchSetLanguageRotorItems();
}

- (BOOL)voiceOverLanguageRotorItemsExist
{
  return _AXSVoiceOverTouchLanguageRotorItemsExist() != 0;
}

- (void)setVoiceOverTypingMode:(int64_t)a3
{
  _AXSVoiceOverTouchSetTypingMode();
}

- (NSDictionary)voiceOverBrailleBluetoothDisplay
{
  return (NSDictionary *)(id)_AXSVoiceOverTouchCopyBrailleBluetoothDisplay();
}

- (void)setVoiceOverBrailleBluetoothDisplay:(id)a3
{
  _AXSVoiceOverTouchSetBrailleBluetoothDisplay();
}

- (NSString)voiceOverTouchBrailleTableIdentifier
{
  return (NSString *)(id)_AXSVoiceOverTouchCopyBrailleTableIdentifier();
}

- (void)setVoiceOverTouchBrailleTableIdentifier:(id)a3
{
  _AXSVoiceOverTouchSetBrailleTableIdentifier();
}

- (void)setVoiceOverBrailleVirtualStatusAlignment:(int64_t)a3
{
  _AXSVoiceOverTouchSetBrailleVirtualStatusAlignment();
}

- (void)setVoiceOverBrailleMasterStatusCellIndex:(int64_t)a3
{
  _AXSVoiceOverTouchSetBrailleMasterStatusCellIndex();
}

- (int64_t)voiceOverBrailleStatusCellPreference
{
  if (_AXSVoiceOverTouchBrailleMasterStatusCellIndex() < 0)
    return 0;
  if (_AXSVoiceOverTouchBrailleVirtualStatusAlignment() == 1)
    return 2;
  return 1;
}

- (void)setVoiceOverBrailleStatusCellPreference:(int64_t)a3
{
  if (!a3)
    goto LABEL_5;
  if (a3 == 1 || a3 == 2)
  {
    _AXSVoiceOverTouchSetBrailleVirtualStatusAlignment();
LABEL_5:
    _AXSVoiceOverTouchSetBrailleMasterStatusCellIndex();
  }
}

- (void)setVoiceOverBrailleContractionMode:(int64_t)a3
{
  _AXSVoiceOverTouchSetBrailleContractionMode();
}

- (BOOL)voiceOverBrailleEightDotMode
{
  return _AXSVoiceOverTouchBrailleEightDotMode() != 0;
}

- (void)setVoiceOverBrailleEightDotMode:(BOOL)a3
{
  _AXSVoiceOverTouchSetBrailleEightDotMode();
}

- (BOOL)hoverTextEnabled
{
  return _AXSHoverTextEnabled() != 0;
}

- (void)setHoverTextEnabled:(BOOL)a3
{
  _AXSHoverTextSetEnabled();
}

- (void)setHoverTextFontSize:(double)a3
{
  _AXSHoverTextSetFontSize();
}

- (double)hoverTextFontSize
{
  float v2;

  _AXSHoverTextFontSize();
  return v2;
}

- (void)setHoverTextFontName:(id)a3
{
  _AXSHoverTextSetFontName();
}

- (NSString)hoverTextFontName
{
  return (NSString *)(id)_AXSHoverTextCopyFontName();
}

- (void)setHoverTextTextColorData:(id)a3
{
  _AXSHoverTextSetTextColorData();
}

- (NSData)hoverTextTextColorData
{
  return (NSData *)(id)_AXSHoverTextCopyTextColorData();
}

- (void)setHoverTextInsertionPointColorData:(id)a3
{
  _AXSHoverTextSetInsertionPointColorData();
}

- (NSData)hoverTextInsertionPointColorData
{
  return (NSData *)(id)_AXSHoverTextCopyInsertionPointColorData();
}

- (void)setHoverTextBackgroundColorData:(id)a3
{
  _AXSHoverTextSetBackgroundColorData();
}

- (NSData)hoverTextBackgroundColorData
{
  return (NSData *)(id)_AXSHoverTextCopyBackgroundColorData();
}

- (void)setHoverTextBorderColorData:(id)a3
{
  _AXSHoverTextSetBorderColorData();
}

- (NSData)hoverTextBorderColorData
{
  return (NSData *)(id)_AXSHoverTextCopyBorderColorData();
}

- (double)hoverTextBackgroundOpacity
{
  float v2;

  _AXSHoverTextBackgroundOpacity();
  return v2;
}

- (void)setHoverTextBackgroundOpacity:(double)a3
{
  _AXSHoverTextSetBackgroundOpacity();
}

- (void)setHoverTextDisplayMode:(int64_t)a3
{
  _AXSHoverTextSetDisplayMode();
}

- (BOOL)hoverTextActivationLockEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("HoverTextActivationLock"), 0);
}

- (void)setHoverTextActivationLockEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("HoverTextActivationLock"));

}

- (int64_t)hoverTextPreferredActivatorKey
{
  return AXSettingsReturnIntegerValue(CFSTR("HoverTextActivatorKey"), 0);
}

- (void)setHoverTextPreferredActivatorKey:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("HoverTextActivatorKey"));

}

- (BOOL)hoverTextTypingEnabled
{
  return _AXSHoverTextTypingEnabled() != 0;
}

- (void)setHoverTextTypingEnabled:(BOOL)a3
{
  _AXSHoverTextTypingSetEnabled();
}

- (int64_t)hoverTextTypingDisplayMode
{
  int64_t v2;
  int IsHardwareKeyboardAttached;

  v2 = _AXSHoverTextTypingDisplayMode();
  IsHardwareKeyboardAttached = GSEventIsHardwareKeyboardAttached();
  if (v2 == 1 && IsHardwareKeyboardAttached == 0)
    return 0;
  else
    return v2;
}

- (void)setHoverTextTypingDisplayMode:(int64_t)a3
{
  _AXSHoverTextTypingSetDisplayMode();
}

- (void)setHoverTextTypingFontName:(id)a3
{
  _AXSHoverTextTypingSetFontName();
}

- (NSString)hoverTextTypingFontName
{
  return (NSString *)(id)_AXSHoverTextTypingCopyFontName();
}

- (void)setHoverTextTypingTextColorData:(id)a3
{
  _AXSHoverTextTypingSetTextColorData();
}

- (NSData)hoverTextTypingTextColorData
{
  return (NSData *)(id)_AXSHoverTextTypingCopyTextColorData();
}

- (void)setHoverTextTypingInsertionPointColorData:(id)a3
{
  _AXSHoverTextTypingSetInsertionPointColorData();
}

- (NSData)hoverTextTypingInsertionPointColorData
{
  return (NSData *)(id)_AXSHoverTextTypingCopyInsertionPointColorData();
}

- (void)setHoverTextTypingBackgroundColorData:(id)a3
{
  _AXSHoverTextTypingSetBackgroundColorData();
}

- (NSData)hoverTextTypingBackgroundColorData
{
  return (NSData *)(id)_AXSHoverTextTypingCopyBackgroundColorData();
}

- (void)setHoverTextTypingBorderColorData:(id)a3
{
  _AXSHoverTextTypingSetBorderColorData();
}

- (NSData)hoverTextTypingBorderColorData
{
  return (NSData *)(id)_AXSHoverTextTypingCopyBorderColorData();
}

- (void)setHoverTextTypingTextStyle:(id)a3
{
  _AXSHoverTextTypingSetTextStyle();
}

- (NSString)hoverTextTypingTextStyle
{
  return (NSString *)(id)_AXSHoverTextTypingCopyTextStyle();
}

- (void)setHoverTextTypingMisspelledTextColorData:(id)a3
{
  _AXSHoverTextTypingSetMisspelledTextColorData();
}

- (NSData)hoverTextTypingMisspelledTextColorData
{
  return (NSData *)(id)_AXSHoverTextTypingCopyMisspelledTextColorData();
}

- (void)setHoverTextTypingAutocorrectedTextColorData:(id)a3
{
  _AXSHoverTextTypingSetAutocorrectedTextColorData();
}

- (NSData)hoverTextTypingAutocorrectedTextColorData
{
  return (NSData *)(id)_AXSHoverTextTypingCopyAutocorrectedTextColorData();
}

- (void)setZoomEnabled:(BOOL)a3
{
  _AXSZoomTouchSetEnabled();
}

- (BOOL)zoomToggledByPreferenceSwitch
{
  return _AXSZoomTouchToggledByPreferenceSwitch() != 0;
}

- (void)setZoomToggledByPreferenceSwitch:(BOOL)a3
{
  _AXSZoomTouchSetToggledByPreferenceSwitch();
}

- (BOOL)zoomToggledByVoiceOver
{
  return _AXSZoomTouchToggledByVoiceOver() != 0;
}

- (void)setZoomToggledByVoiceOver:(BOOL)a3
{
  _AXSZoomTouchSetToggledByVoiceOver();
}

- (BOOL)zoomSmoothScalingEnabled
{
  return _AXSZoomTouchSmoothScalingDisabled() != 0;
}

- (void)setZoomSmoothScalingEnabled:(BOOL)a3
{
  _AXSZoomTouchSetSmoothScalingDisabled();
}

- (BOOL)enhanceTextLegibilityEnabled
{
  return _AXSEnhanceTextLegibilityEnabled() != 0;
}

- (void)setEnhanceTextLegibilityEnabled:(BOOL)a3
{
  _AXSSetEnhanceTextLegibilityEnabled();
}

- (BOOL)enhanceTextTrackingEnabled
{
  return _AXSEnhanceTextTrackingEnabled() != 0;
}

- (void)setEnhanceTextTrackingEnabled:(BOOL)a3
{
  _AXSSetEnhanceTextTrackingEnabled();
}

- (BOOL)enhanceBackgroundContrastEnabled
{
  return _AXSEnhanceBackgroundContrastEnabledGlobal() != 0;
}

- (void)setEnhanceBackgroundContrastEnabled:(BOOL)a3
{
  _AXSSetEnhanceBackgroundContrastEnabled();
}

- (BOOL)reduceMotionEnabled
{
  return _AXSReduceMotionEnabledGlobal() != 0;
}

- (void)setReduceMotionEnabled:(BOOL)a3
{
  _AXSSetReduceMotionEnabled();
}

- (BOOL)reduceMotionAutoplayVideoPreviewsEnabled
{
  return _AXSReduceMotionAutoplayVideoPreviewsEnabled() != 0;
}

- (void)setReduceMotionAutoplayVideoPreviewsEnabled:(BOOL)a3
{
  _AXSSetReduceMotionAutoplayVideoPreviewsEnabled();
}

- (BOOL)increaseButtonLegibilityEnabled
{
  return _AXSIncreaseButtonLegibility() != 0;
}

- (void)setIncreaseButtonLegibilityEnabled:(BOOL)a3
{
  _AXSSetIncreaseButtonLegibility();
}

- (BOOL)buttonShapesEnabled
{
  return _AXSButtonShapesEnabled() != 0;
}

- (void)setButtonShapesEnabled:(BOOL)a3
{
  _AXSSetButtonShapesEnabled();
}

- (BOOL)reduceWhitePointEnabled
{
  return _AXSReduceWhitePointEnabled() != 0;
}

- (void)setReduceWhitePointEnabled:(BOOL)a3
{
  _AXSSetReduceWhitePointEnabled();
}

- (BOOL)highContrastFocusIndicatorsEnabled
{
  return _AXSHighContrastFocusIndicatorsEnabled() != 0;
}

- (void)setHighContrastFocusIndicatorsEnabled:(BOOL)a3
{
  _AXSSetHighContrastFocusIndicatorsEnabled();
}

- (BOOL)monoAudioEnabled
{
  return _AXSMonoAudioEnabled() != 0;
}

- (void)setMonoAudioEnabled:(BOOL)a3
{
  _AXSMonoAudioSetEnabled();
}

- (double)audioLeftRightBalance
{
  float v2;

  _AXSLeftRightAudioBalance();
  return v2;
}

- (void)setAudioLeftRightBalance:(double)a3
{
  _AXSSetLeftRightAudioBalance();
}

- (BOOL)_hasSwitchWithUUID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXSettings assistiveTouchSwitches](self, "assistiveTouchSwitches");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "uuid", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_switchWithAction:(int64_t)a3 excludedUUIDs:(id)a4 needsToSupportLongPress:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[AXSettings assistiveTouchSwitches](self, "assistiveTouchSwitches");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
      objc_msgSend(v14, "uuid", (_QWORD)v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "containsObject:", v15) & 1) != 0)
      {

      }
      else
      {
        if (!a3)
        {

          if (!v5)
            goto LABEL_17;
LABEL_13:
          if (objc_msgSend(v14, "supportsLongPress"))
          {
LABEL_17:
            v17 = v14;
            goto LABEL_18;
          }
          goto LABEL_14;
        }
        v16 = objc_msgSend(v14, "action");

        if (v16 == a3)
        {
          if (!v5)
            goto LABEL_17;
          goto LABEL_13;
        }
      }
LABEL_14:
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }
  v17 = 0;
LABEL_18:

  return v17;
}

- (id)_switchWithAnyActionExcludingUUIDs:(id)a3 needsToSupportLongPress:(BOOL)a4
{
  return -[AXSettings _switchWithAction:excludedUUIDs:needsToSupportLongPress:](self, "_switchWithAction:excludedUUIDs:needsToSupportLongPress:", 0, a3, a4);
}

- (BOOL)validateAndUpdateRecipeIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  BOOL v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXSwitchRecipeMappingSwitchUUIDs(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = v4;
  objc_msgSend(v4, "mappings");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  v24 = v7 == 0;
  if (!v7)
  {
LABEL_16:

    v21 = v25;
    v22 = v24;
    goto LABEL_17;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v28 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v12, "switchUUID");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v12, "switchUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[AXSettings _hasSwitchWithUUID:](self, "_hasSwitchWithUUID:", v15);

        if (v16)
          continue;
      }
      objc_msgSend(v12, "longPressAction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[AXSettings _switchWithAction:excludedUUIDs:needsToSupportLongPress:](self, "_switchWithAction:excludedUUIDs:needsToSupportLongPress:", objc_msgSend(v12, "switchOriginalAction"), v6, v17 != 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        if ((objc_msgSend(v12, "isOptional") & 1) != 0)
          continue;
        -[AXSettings _switchWithAnyActionExcludingUUIDs:needsToSupportLongPress:](self, "_switchWithAnyActionExcludingUUIDs:needsToSupportLongPress:", v6, v17 != 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
          goto LABEL_16;
      }
      objc_msgSend(v18, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v19);

      objc_msgSend(v18, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSwitchUUID:", v20);

      v9 = 1;
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v8);

  if ((v9 & 1) != 0)
  {
    v21 = v25;
    -[AXSettings updateRecipe:](self, "updateRecipe:", v25);
    v22 = 1;
  }
  else
  {
    v22 = 1;
    v21 = v25;
  }
LABEL_17:

  return v22;
}

- (BOOL)_updateWithoutSavingExistingRecipe:(id)a3 allRecipes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 1;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v14)
        break;

      v10 = ++v9 < v8;
      if (v8 == v9)
        goto LABEL_5;
    }
    objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v9, v5);

  }
  else
  {
LABEL_5:
    v10 = 0;
  }

  return v10;
}

- (void)_assignDefaultTitleIfNeededToRecipe:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    AXLocalizedString(CFSTR("UNTITLED_RECIPE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", v7);

  }
}

- (BOOL)updateRecipe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;

  v4 = a3;
  -[AXSettings switchControlRecipes](self, "switchControlRecipes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = -[AXSettings _updateWithoutSavingExistingRecipe:allRecipes:](self, "_updateWithoutSavingExistingRecipe:allRecipes:", v4, v6);
  if (v7)
  {
    -[AXSettings _assignDefaultTitleIfNeededToRecipe:](self, "_assignDefaultTitleIfNeededToRecipe:", v4);
    -[AXSettings setSwitchControlRecipes:](self, "setSwitchControlRecipes:", v6);
  }

  return v7;
}

- (void)saveRecipe:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AXSettings switchControlRecipes](self, "switchControlRecipes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!-[AXSettings _updateWithoutSavingExistingRecipe:allRecipes:](self, "_updateWithoutSavingExistingRecipe:allRecipes:", v6, v5))objc_msgSend(v5, "addObject:", v6);
  -[AXSettings _assignDefaultTitleIfNeededToRecipe:](self, "_assignDefaultTitleIfNeededToRecipe:", v6);
  -[AXSettings setSwitchControlRecipes:](self, "setSwitchControlRecipes:", v5);

}

- (BOOL)isNewRecipe:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AXSettings switchControlRecipes](self, "switchControlRecipes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) != 0)
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (id)createAndSaveRecipeForInterfaceOrientedPoint:(CGPoint)a3
{
  return -[AXSettings _createAndSaveRecipeForInterfaceOrientedPoint:forHold:](self, "_createAndSaveRecipeForInterfaceOrientedPoint:forHold:", 0, a3.x, a3.y);
}

- (id)createAndSaveRecipeForInterfaceOrientedHoldPoint:(CGPoint)a3
{
  return -[AXSettings _createAndSaveRecipeForInterfaceOrientedPoint:forHold:](self, "_createAndSaveRecipeForInterfaceOrientedPoint:forHold:", 1, a3.x, a3.y);
}

- (id)_createAndSaveRecipeForInterfaceOrientedPoint:(CGPoint)a3 forHold:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  AXSwitchRecipe *v8;
  AXSwitchRecipe *v9;
  AXSwitchRecipeMapping *v10;
  void *v11;
  uint64_t v12;
  AXSwitchRecipeMapping *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(AXSwitchRecipe);
  v9 = v8;
  if (v4)
  {
    -[AXSwitchRecipe setUnlocalizedName:](v8, "setUnlocalizedName:", CFSTR("RECIPE_CREATED_FROM_HOLD_POINT"));
    -[AXSwitchRecipe setMenuIconIdentifier:](v9, "setMenuIconIdentifier:", CFSTR("HoldPoint"));
    v10 = objc_alloc_init(AXSwitchRecipeMapping);
    -[AXSwitchRecipeMapping setAction:](v10, "setAction:", CFSTR("HoldAtPoint"));
    -[AXSwitchRecipeMapping setHoldPoint:](v10, "setHoldPoint:", x, y);
  }
  else
  {
    -[AXSwitchRecipe setUnlocalizedName:](v8, "setUnlocalizedName:", CFSTR("RECIPE_CREATED_FROM_POINT"));
    -[AXSwitchRecipe setMenuIconIdentifier:](v9, "setMenuIconIdentifier:", CFSTR("TapPoint"));
    v10 = objc_alloc_init(AXSwitchRecipeMapping);
    -[AXSwitchRecipeMapping setAction:](v10, "setAction:", CFSTR("Gesture"));
    +[AXReplayableGesture tapGestureForInterfaceOrientedPoint:](AXReplayableGesture, "tapGestureForInterfaceOrientedPoint:", x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSwitchRecipeMapping setGesture:](v10, "setGesture:", v11);

  }
  if (-[AXSettings switchControlScanningStyle](self, "switchControlScanningStyle") == 2)
    v12 = 104;
  else
    v12 = 103;
  -[AXSwitchRecipeMapping setSwitchOriginalAction:](v10, "setSwitchOriginalAction:", v12);
  v13 = objc_alloc_init(AXSwitchRecipeMapping);
  -[AXSwitchRecipeMapping setAction:](v13, "setAction:", CFSTR("Exit"));
  -[AXSwitchRecipeMapping setSwitchOriginalAction:](v13, "setSwitchOriginalAction:", 0);
  -[AXSwitchRecipeMapping setOptional:](v13, "setOptional:", 1);
  v17[0] = v10;
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitchRecipe setMappings:](v9, "setMappings:", v14);

  -[AXSwitchRecipe setTimeout:](v9, "setTimeout:", 60.0);
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "saveRecipe:", v9);

  return v9;
}

- (id)switchForUUID:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXSettings assistiveTouchSwitches](self, "assistiveTouchSwitches");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uuid", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_gesturesForPreferenceKeyMigratingIfNecessary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)smoothingBufferSizeForEyeTracker:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_18C62B000, v0, v1, "%s: uniqueIdentifier and legacyIdentifier are invalid for eye tracker: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)updateSmoothingBufferSize:forEyeTracker:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_18C62B000, v0, v1, "%s: uniqueIdentifier is invalid for eye tracker: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)guidedAccessDefaultToneIdentifierForTimeRestrictionEvents
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getTLToneIdentifierNone(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettings.m"), 64, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __38__AXSettings_voiceOverBrailleDisplays__block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSCROBrailleDisplayDriverIdentifier(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettings.m"), 52, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __38__AXSettings_voiceOverBrailleDisplays__block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSCROBrailleDisplayMainSize(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettings.m"), 53, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)setVoiceOverSpeakingRate:(os_log_t)log forLanguage:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18C62B000, log, OS_LOG_TYPE_FAULT, "Tried to set a VoiceOver speaking rate instead of using rotor/selection hierarchy.", v1, 2u);
}

- (void)fullKeyboardAccessCommandMapData
{
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, a1, a3, "Unexpected object type for preference key: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)reachabilityEnabled
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL weak_SBSIsReachabilityEnabled(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettings.m"), 81, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)setReachabilityEnabled:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void weak_SBSSetReachabilityEnabled(BOOL)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettings.m"), 82, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

@end
