@implementation SpeakCorrections

+ (void)updateStatus
{
  CFStringRef *v2;

  v2 = (CFStringRef *)MEMORY[0x24BED26B8];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BED26B8]);
  if (CFPreferencesGetAppBooleanValue(CFSTR("SpeakCorrectionsEnabled"), *v2, 0))
    +[SpeakCorrections enable](SpeakCorrections, "enable");
  else
    +[SpeakCorrections disable](SpeakCorrections, "disable");
}

+ (void)disable
{
  void *v2;

  objc_msgSend((id)_SpeakCorrectionsLock, "lock");
  v2 = (void *)_Corrections;
  _Corrections = 0;

  objc_msgSend((id)_SpeakCorrectionsLock, "unlock");
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1648]), "init");
  v3 = (void *)_SpeakCorrectionsLock;
  _SpeakCorrectionsLock = v2;

}

+ (void)enable
{
  uint64_t v2;
  void *v3;

  objc_msgSend((id)_SpeakCorrectionsLock, "lock");
  if (!_Corrections)
  {
    v2 = objc_msgSend(objc_allocWithZone((Class)SpeakCorrections), "init");
    v3 = (void *)_Corrections;
    _Corrections = v2;

  }
  objc_msgSend((id)_SpeakCorrectionsLock, "unlock");
}

- (SpeakCorrections)init
{
  NSObject *v3;
  SpeakCorrections *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *speakingQueue;
  void *v7;
  id v8;
  uint64_t v9;
  NSArray *availableLanguageCodes;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *keyboardToLanguage;
  void *v16;
  SpeakCorrections *v17;
  objc_super v19;
  uint8_t buf[8];
  uint64_t v21;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  AXLogSpeakTyping();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230B0B000, v3, OS_LOG_TYPE_INFO, "********** Accessibility: Loading SpeakCorrections", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)SpeakCorrections;
  v4 = -[SpeakCorrections init](&v19, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create("speak-corrections-speaking-queue", 0);
    speakingQueue = v4->_speakingQueue;
    v4->_speakingQueue = (OS_dispatch_queue *)v5;

    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v7 = (void *)getTTSSpeechSynthesizerClass_softClass;
    v28 = getTTSSpeechSynthesizerClass_softClass;
    if (!getTTSSpeechSynthesizerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __getTTSSpeechSynthesizerClass_block_invoke;
      v23 = &unk_24FED6130;
      v24 = &v25;
      __getTTSSpeechSynthesizerClass_block_invoke((uint64_t)buf);
      v7 = (void *)v26[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v25, 8);
    objc_msgSend(v8, "availableLanguageCodes");
    v9 = objc_claimAutoreleasedReturnValue();
    availableLanguageCodes = v4->_availableLanguageCodes;
    v4->_availableLanguageCodes = (NSArray *)v9;

    v11 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySettingsLoader"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathForResource:ofType:", CFSTR("KeyboardToLanguage"), CFSTR("plist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithContentsOfFile:", v13);
    keyboardToLanguage = v4->_keyboardToLanguage;
    v4->_keyboardToLanguage = (NSDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v4, sel__correctionDisplayed_, *MEMORY[0x24BDF79D0], 0);

    v17 = v4;
  }

  return v4;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SpeakCorrections;
  -[SpeakCorrections dealloc](&v5, sel_dealloc);
}

- (void)_correctionDisplayed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("correction"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17F0], "cancelPreviousPerformRequestsWithTarget:", self);
  if (v9)
  {
    self->_correctionCanceled = 0;
    -[SpeakCorrections performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__speakCorrection_, 0.200000003);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForKey:", CFSTR("m_previousInputString"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "isEqualToString:", CFSTR(" ")) & 1) == 0)
      {
        self->_correctionCanceled = 1;
        objc_msgSend(getSpeakTypingServicesClass(), "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "notifySpeakServicesToStopSpeakingAutocorrections");

      }
    }
  }

}

- (void)loadUIAccessibilityIfNecessary
{
  void *v2;
  void *v3;
  id v4;

  if (!loadUIAccessibilityIfNecessary___UIAccessibilityHandle)
  {
    MEMORY[0x2348BF1B8](self, a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/System/Library/PrivateFrameworks/UIAccessibility.framework/UIAccessibility"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_retainAutorelease(v3);
    loadUIAccessibilityIfNecessary___UIAccessibilityHandle = (uint64_t)dlopen((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 1);
    if (!loadUIAccessibilityIfNecessary___UIAccessibilityHandle)
      NSLog(CFSTR("Unable to load UIAccessibility framework."));

  }
}

- (void)_speakCorrection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *speakingQueue;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;

  v4 = a3;
  if (!self->_correctionCanceled)
  {
    objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentInputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSArray containsObject:](self->_availableLanguageCodes, "containsObject:", v8))
    {
      -[NSDictionary objectForKey:](self->_keyboardToLanguage, "objectForKey:", v7);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    if (UIAccessibilityIsVoiceOverRunning())
    {
      -[SpeakCorrections loadUIAccessibilityIfNecessary](self, "loadUIAccessibilityIfNecessary");
      v10 = v4;
      if (v8)
      {
        v18 = 0;
        v19 = &v18;
        v20 = 0x2020000000;
        v11 = getAXSafeClassFromStringSymbolLoc_ptr_0;
        v21 = getAXSafeClassFromStringSymbolLoc_ptr_0;
        if (!getAXSafeClassFromStringSymbolLoc_ptr_0)
        {
          v12 = (void *)AccessibilityUtilitiesLibrary_0();
          v11 = dlsym(v12, "AXSafeClassFromString");
          v19[3] = (uint64_t)v11;
          getAXSafeClassFromStringSymbolLoc_ptr_0 = v11;
        }
        _Block_object_dispose(&v18, 8);
        if (!v11)
          -[SpeakCorrections _speakCorrection:].cold.1();
        ((void (*)(const __CFString *))v11)(CFSTR("AXAttributedString"));
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "axAttributedStringWithString:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setAttribute:forKey:", v8, CFSTR("UIAccessibilityTokenLanguage"));
        v10 = v13;
      }
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v10);
    }
    else
    {
      speakingQueue = self->_speakingQueue;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __37__SpeakCorrections__speakCorrection___block_invoke;
      v15[3] = &unk_24FED61A0;
      v16 = v4;
      v17 = v8;
      dispatch_async(speakingQueue, v15);

      v10 = v16;
    }

  }
}

void __37__SpeakCorrections__speakCorrection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(getSpeakTypingServicesClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v5 = getAXLanguageCanonicalFormToGeneralLanguageSymbolLoc_ptr;
  v11 = getAXLanguageCanonicalFormToGeneralLanguageSymbolLoc_ptr;
  if (!getAXLanguageCanonicalFormToGeneralLanguageSymbolLoc_ptr)
  {
    v6 = (void *)AccessibilityUtilitiesLibrary_0();
    v5 = dlsym(v6, "AXLanguageCanonicalFormToGeneralLanguage");
    v9[3] = (uint64_t)v5;
    getAXLanguageCanonicalFormToGeneralLanguageSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v8, 8);
  if (!v5)
    __37__SpeakCorrections__speakCorrection___block_invoke_cold_1();
  ((void (*)(id))v5)(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "notifySpeakServicesForSpeakAutoCorrections:forCurrentInputMode:", v3, v7, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakingQueue, 0);
  objc_storeStrong((id *)&self->_availableLanguageCodes, 0);
  objc_storeStrong((id *)&self->_keyboardToLanguage, 0);
  objc_storeStrong((id *)&self->_synthesizer, 0);
}

- (void)_speakCorrection:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class soft_AXSafeClassFromString(NSString *__strong)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 70, CFSTR("%s"), dlerror());

  __break(1u);
}

void __37__SpeakCorrections__speakCorrection___block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *soft_AXLanguageCanonicalFormToGeneralLanguage(NSString *__strong)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 84, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
