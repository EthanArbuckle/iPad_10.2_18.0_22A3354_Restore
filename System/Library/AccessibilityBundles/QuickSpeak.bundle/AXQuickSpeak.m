@implementation AXQuickSpeak

- (AXOrator)orator
{
  AXOrator *orator;
  AXOrator *v4;
  AXOrator *v5;

  orator = self->_orator;
  if (!orator)
  {
    v4 = (AXOrator *)objc_alloc_init(MEMORY[0x24BE00690]);
    v5 = self->_orator;
    self->_orator = v4;

    -[AXOrator setDelegate:](self->_orator, "setDelegate:", self);
    orator = self->_orator;
  }
  return orator;
}

- (NSString)content
{
  void *v2;
  void *v3;

  -[AXQuickSpeak orator](self, "orator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setContent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXQuickSpeak setPaused:](self, "setPaused:", 0);
  -[AXQuickSpeak orator](self, "orator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContent:", v4);

}

- (AXLanguageTaggedContent)selectedContent
{
  void *v2;
  void *v3;

  -[AXQuickSpeak orator](self, "orator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXLanguageTaggedContent *)v3;
}

- (void)setSpellOutContent:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AXQuickSpeak orator](self, "orator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpellOutContent:", v3);

}

- (BOOL)spellOutContent
{
  void *v2;
  char v3;

  -[AXQuickSpeak orator](self, "orator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "spellOutContent");

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance__shared;
}

void __30__AXQuickSpeak_sharedInstance__block_invoke()
{
  AXQuickSpeak *v0;
  void *v1;

  v0 = objc_alloc_init(AXQuickSpeak);
  v1 = (void *)sharedInstance__shared;
  sharedInstance__shared = (uint64_t)v0;

}

+ (BOOL)quickSpeakClassIsDenied:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  Class v11;
  id v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)quickSpeakClassIsDenied__Denylist;
  if (!quickSpeakClassIsDenied__Denylist)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 5);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)quickSpeakClassIsDenied__Denylist;
    quickSpeakClassIsDenied__Denylist = v5;

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("PLStackView"), CFSTR("WAllPhotosAlbumViewController"), CFSTR("WInteractiveNavigationControllerView"), CFSTR("WInteractiveNavigationController"), CFSTR("PKTextAttachmentDrawingView"), CFSTR("Files.DOCItemCollectionViewController"), CFSTR("com_apple_DocumentManager_Service.DOCItemCollectionViewController"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v7);
          v11 = NSClassFromString(*(NSString **)(*((_QWORD *)&v22 + 1) + 8 * i));
          if (v11)
            objc_msgSend((id)quickSpeakClassIsDenied__Denylist, "addObject:", v11);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    v4 = (void *)quickSpeakClassIsDenied__Denylist;
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __40__AXQuickSpeak_quickSpeakClassIsDenied___block_invoke;
  v15[3] = &unk_24FF24878;
  v12 = v3;
  v16 = v12;
  v17 = &v18;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v15);
  v13 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __40__AXQuickSpeak_quickSpeakClassIsDenied___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

+ (BOOL)isQuickSpeakSelector:(SEL)a3
{
  if (isQuickSpeakSelector__onceToken != -1)
    dispatch_once(&isQuickSpeakSelector__onceToken, &__block_literal_global_196);
  return (SEL)isQuickSpeakSelector___axQSSpeakSentence == a3
      || isQuickSpeakSelector___axQSSpeakSpellOut == (_QWORD)a3
      || isQuickSpeakSelector___axQSPauseMethod == (_QWORD)a3
      || isQuickSpeakSelector___axQSSpeakMethod == (_QWORD)a3
      || isQuickSpeakSelector___axQSSpeakLangsMethod == (_QWORD)a3
      || isQuickSpeakSelector___axQSSpeakLangs2Method == (_QWORD)a3;
}

void __37__AXQuickSpeak_isQuickSpeakSelector___block_invoke()
{
  isQuickSpeakSelector___axQSPauseMethod = (uint64_t)sel__accessibilityPauseSpeaking_;
  isQuickSpeakSelector___axQSSpeakMethod = (uint64_t)sel__accessibilitySpeak_;
  isQuickSpeakSelector___axQSSpeakLangsMethod = (uint64_t)sel__accessibilitySpeakLanguageSelection_;
  isQuickSpeakSelector___axQSSpeakLangs2Method = (uint64_t)sel__accessibilitySpeakWithLanguage_;
  isQuickSpeakSelector___axQSSpeakSentence = (uint64_t)sel__accessibilitySpeakSentence_;
  isQuickSpeakSelector___axQSSpeakSpellOut = (uint64_t)sel__accessibilitySpeakSpellOut_;
}

+ (void)initialize
{
  id v2;

  if ((id)objc_opt_class() == a1 && (MEMORY[0x2348C22B0]() & 1) == 0)
    v2 = +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
}

- (AXQuickSpeak)init
{
  AXQuickSpeak *v2;
  void *v3;
  AXQuickSpeak *v4;
  void *v5;
  void *v6;
  void *v7;
  AXQuickSpeak *v8;
  _QWORD v10[4];
  AXQuickSpeak *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXQuickSpeak;
  v2 = -[AXQuickSpeak init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __20__AXQuickSpeak_init__block_invoke_3;
    v10[3] = &unk_24FF24920;
    v4 = v2;
    v11 = v4;
    objc_msgSend(v3, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_215, &__block_literal_global_261, 0, v10);

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addHandler:forFramework:", &__block_literal_global_290, CFSTR("PDFKit"));

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addHandler:forFramework:", &__block_literal_global_300, CFSTR("WebKit"));

    QSInstallSharedSafeCategoriesIfNeeded();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__handleAppDidEnterBackground_, *MEMORY[0x24BDF7528], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__handleAppWillResignActive_, *MEMORY[0x24BDF75D8], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__stopSpeakingQuickSpeak_, *MEMORY[0x24BED26A0], 0);
    v8 = v4;

  }
  return v2;
}

uint64_t __20__AXQuickSpeak_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("UIColor"), CFSTR("selectionHighlightColor"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICalloutBar"), CFSTR("buttonPressed:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICalloutBar"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICalloutBar"), CFSTR("fade"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICalloutBar"), CFSTR("hide"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICalloutBar"), CFSTR("_targetForAction:"), "@", ":", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICalloutBar"), CFSTR("updateAvailableButtons"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICalloutBarButton"), CFSTR("setPage:"), "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextSelectionView"), CFSTR("setVisible:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextSelectionView"), CFSTR("showSelectionCommands"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("UICalloutBar"), CFSTR("m_extraItems"), "NSArray");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("UICalloutBar"), CFSTR("m_currentSystemButtons"), "NSMutableArray");
  objc_msgSend(v2, "validateClass:", CFSTR("UITextInteraction"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextInteraction"), CFSTR("_textInput"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextInteraction"), CFSTR("_updatedAccessibilityTextMenuWithMenuElements:"), "@", "@", 0);

  return 1;
}

uint64_t __20__AXQuickSpeak_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("QuickSpeak"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("QuickSpeak"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __20__AXQuickSpeak_init__block_invoke_3(uint64_t a1, void *a2)
{
  Class v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NSObject_QSExtras"), 1);
  objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIResponder_QSExtras"), 1);
  objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITextField_QSExtrasAccessibility"), 1);
  if (NSClassFromString(CFSTR("CKTextBalloonView")))
  {
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKBalloonTextView_QSExtras"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKFullScreenBalloonViewController_QSExtras"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKFullScreenBalloonViewControllerPhone_QSExtras"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKChatController_ClickyOrb_QSExtras"), 1);
  }
  if (NSClassFromString(CFSTR("EKDayOccurrenceView")))
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKDayOccurrenceView_QSExtras"), 1);
  v3 = NSClassFromString(CFSTR("PUOneUpViewController"));
  v4 = v5;
  if (v3)
  {
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUOneUpViewController_QSExtras"), 1);
    v4 = v5;
  }
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITextInteraction_QSExtras"), 1);
  objc_msgSend(*(id *)(a1 + 32), "_installWebKitLegacySafeCategoriesIfNeeded");

}

void __20__AXQuickSpeak_init__block_invoke_4()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_291, &__block_literal_global_292, 0, &__block_literal_global_295);

}

uint64_t __20__AXQuickSpeak_init__block_invoke_5()
{
  return 1;
}

uint64_t __20__AXQuickSpeak_init__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("QuickSpeak PDF"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("QuickSpeak PDF"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

uint64_t __20__AXQuickSpeak_init__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PDFView_QSExtras"), 1);
}

void __20__AXQuickSpeak_init__block_invoke_8()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_301, &__block_literal_global_302, 0, &__block_literal_global_305);

}

uint64_t __20__AXQuickSpeak_init__block_invoke_9()
{
  return 1;
}

uint64_t __20__AXQuickSpeak_init__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("QuickSpeak WebKit2"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("QuickSpeak WebKit2"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __20__AXQuickSpeak_init__block_invoke_11(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WKContentView_QSExtras"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WKWebViewAccessibility_QSExtras"), 1);

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[AXQuickSpeak sentenceHighlightView](self, "sentenceHighlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[AXQuickSpeak highlightView](self, "highlightView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  v7 = (void *)CachedSentenceRects;
  CachedSentenceRects = 0;

  v8 = (void *)CachedSentenceHighlightOverlapHeights;
  CachedSentenceHighlightOverlapHeights = 0;

  v9.receiver = self;
  v9.super_class = (Class)AXQuickSpeak;
  -[AXQuickSpeak dealloc](&v9, sel_dealloc);
}

- (void)resetQuickSpeakForUnitTests
{
  self->_lastWholeCharacterLocation = 0;
  self->_lastUnicharLocation = 0;
}

- (void)_installWebKitLegacySafeCategories
{
  if (_installWebKitLegacySafeCategories_onceToken != -1)
    dispatch_once(&_installWebKitLegacySafeCategories_onceToken, &__block_literal_global_321);
}

void __50__AXQuickSpeak__installWebKitLegacySafeCategories__block_invoke()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_322);
}

void __50__AXQuickSpeak__installWebKitLegacySafeCategories__block_invoke_2()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  AXLogSpeakSelection();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_230C05000, v0, OS_LOG_TYPE_INFO, "Will load QS safe categories for WebKit legacy now", v2, 2u);
  }

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_324, &__block_literal_global_336, 0, &__block_literal_global_339);

}

uint64_t __50__AXQuickSpeak__installWebKitLegacySafeCategories__block_invoke_323(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("UIWebView"), CFSTR("_internal"), "UIWebViewInternal");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("UIWebViewInternal"), CFSTR("browserView"), "UIWebBrowserView");

  return 1;
}

uint64_t __50__AXQuickSpeak__installWebKitLegacySafeCategories__block_invoke_2_335(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("QuickSpeak WebKit Legacy"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("QuickSpeak WebKit Legacy"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __50__AXQuickSpeak__installWebKitLegacySafeCategories__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIWebView_QSExtras"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIWebBrowserView_QSExtras"), 1);

}

- (void)_installWebKitLegacySafeCategoriesIfNeeded
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (_UIApplicationIsWebKitLoaded())
  {
    -[AXQuickSpeak _installWebKitLegacySafeCategories](self, "_installWebKitLegacySafeCategories");
  }
  else
  {
    AXLogSpeakSelection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_230C05000, v3, OS_LOG_TYPE_INFO, "WebKit legacy not loaded. Will load QS safe categories on demand", v5, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleWebkitLegacyWasLoaded_, CFSTR("UIApplicationLoadedWebKit"), 0);

  }
}

- (void)_handleAppDidEnterBackground:(id)a3
{
  void *v4;

  -[AXQuickSpeak orator](self, "orator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearSelectedContent");

  -[AXQuickSpeak stopAction:](self, "stopAction:", 0);
}

- (void)_stopSpeakingQuickSpeak:(id)a3
{
  -[AXQuickSpeak stopAction:](self, "stopAction:", 0);
}

- (void)_handleAppWillResignActive:(id)a3
{
  -[AXQuickSpeak stopAction:](self, "stopAction:", 0);
}

- (void)speakAction:(id)a3 withPreferredLanguage:(id)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  char v22;
  void *v23;
  os_log_type_t v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (id)objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
  if (!-[AXQuickSpeak isPaused](self, "isPaused"))
  {
    v9 = _AXSAutomationEnabled();
    v10 = (id *)MEMORY[0x24BDF74F8];
    if (v9)
    {
      v11 = (void *)*MEMORY[0x24BDF74F8];
      -[AXQuickSpeak orator](self, "orator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "content");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_accessibilitySetRetainedValue:forKey:", v13, CFSTR("AXSpeakSelectionLastSpokenString"));

    }
    -[AXQuickSpeak orator](self, "orator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSpeakingContext:", 2);

    -[AXQuickSpeak orator](self, "orator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v16 = objc_msgSend(v15, "startSpeakingWithPreferredLanguage:error:", v7, &v27);
    v17 = v27;

    if (v16)
    {
      self->_lastWholeCharacterLocation = 0;
      self->_lastUnicharLocation = 0;
      -[AXQuickSpeak setQuickSpeakInitiator:](self, "setQuickSpeakInitiator:", v6);
      -[AXQuickSpeak quickSpeakInitiator](self, "quickSpeakInitiator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v18, &QSSelectedTextRangeKey, 0, (void *)1);

      -[AXQuickSpeak quickSpeakInitiator](self, "quickSpeakInitiator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_accessibilitySpeakSelectionTextInputResponder");
      v20 = objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSObject _accessibilityStoreSelection](v20, "_accessibilityStoreSelection");
      -[AXQuickSpeak setCachedIdleTimerPref:](self, "setCachedIdleTimerPref:", objc_msgSend(*v10, "isIdleTimerDisabled"));
      objc_msgSend(*v10, "setIdleTimerDisabled:", 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFE4D0], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "ignoreLogging");

      if ((v22 & 1) != 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDFE4D0], "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v20 = objc_claimAutoreleasedReturnValue();

      v24 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v20, v24))
      {
        AXColorizeFormatLog();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, v24))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v26;
          _os_log_impl(&dword_230C05000, v20, v24, "%{public}@", buf, 0xCu);
        }

      }
    }

    goto LABEL_15;
  }
  -[AXQuickSpeak resumeAction:](self, "resumeAction:", 0);
LABEL_16:

}

- (void)pauseAction:(id)a3
{
  void *v4;
  char v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[AXQuickSpeak setPaused:](self, "setPaused:", 1);
  -[AXQuickSpeak orator](self, "orator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v5 = objc_msgSend(v4, "pauseSpeaking:", &v14);
  v6 = v14;

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4D0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ignoreLogging");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4D0], "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v10, v11))
      {
        AXColorizeFormatLog();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, v11))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v13;
          _os_log_impl(&dword_230C05000, v10, v11, "%{public}@", buf, 0xCu);
        }

      }
    }
  }

}

- (void)resumeAction:(id)a3
{
  void *v4;
  char v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[AXQuickSpeak setPaused:](self, "setPaused:", 0);
  -[AXQuickSpeak orator](self, "orator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v5 = objc_msgSend(v4, "resumeSpeaking:", &v14);
  v6 = v14;

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4D0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ignoreLogging");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4D0], "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v10, v11))
      {
        AXColorizeFormatLog();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, v11))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v13;
          _os_log_impl(&dword_230C05000, v10, v11, "%{public}@", buf, 0xCu);
        }

      }
    }
  }

}

- (void)stopAction:(id)a3
{
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[AXQuickSpeak orator](self, "orator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopSpeaking:", 0);

  v5[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__AXQuickSpeak_stopAction___block_invoke;
  v6[3] = &unk_24FF24B08;
  v6[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__AXQuickSpeak_stopAction___block_invoke_2;
  v5[3] = &unk_24FF24B30;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v6, v5, 0.2);
}

uint64_t __27__AXQuickSpeak_stopAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "highlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "sentenceHighlightView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_manipulateOtherTextViews:", 1);
}

void __27__AXQuickSpeak_stopAction___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "quickSpeakInitiator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v2, &QSSelectedTextRangeKey, 0, (void *)1);

  objc_msgSend(*(id *)(a1 + 32), "quickSpeakInitiator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySpeakSelectionTextInputResponder");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "_accessibilityClearSelection");
  objc_msgSend(*(id *)(a1 + 32), "setContentOwner:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setQuickSpeakInitiator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "speakingSentenceRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setContent:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSpeakingSentenceRange:", 0);
  objc_msgSend(*(id *)(a1 + 32), "highlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "sentenceHighlightView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setHighlightView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSentenceHighlightView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSpellOutContent:", 0);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = 0;

}

- (void)_manipulateOtherTextViews:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  BOOL v25;
  _BYTE v26[128];
  uint64_t v27;

  v5 = MEMORY[0x24BDAC760];
  v27 = *MEMORY[0x24BDAC8D0];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __42__AXQuickSpeak__manipulateOtherTextViews___block_invoke;
  v24[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  v25 = a3;
  v6 = (void *)MEMORY[0x2348C261C](v24, a2);
  if (!a3)
  {
    -[AXQuickSpeak _textSelectionViews](self, "_textSelectionViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXQuickSpeak setHiddenTextSelectionViews:](self, "setHiddenTextSelectionViews:", v7);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[AXQuickSpeak hiddenTextSelectionViews](self, "hiddenTextSelectionViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "delegate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v8, "addObject:", v15);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v11);
    }

    -[AXQuickSpeak setHiddenTextSelectionViewDelegates:](self, "setHiddenTextSelectionViewDelegates:", v8);
  }
  -[AXQuickSpeak hiddenTextSelectionViews](self, "hiddenTextSelectionViews");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __42__AXQuickSpeak__manipulateOtherTextViews___block_invoke_3;
  v18[3] = &unk_24FF24BA0;
  v19 = v6;
  v17 = v6;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v18);

}

void __42__AXQuickSpeak__manipulateOtherTextViews___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  id v5;

  v3 = a2;
  NSClassFromString(CFSTR("UITextSelectionView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v3;
    AXPerformSafeBlock();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      LOBYTE(v4) = *(_BYTE *)(a1 + 32);
      objc_msgSend(v3, "setAlpha:", (double)v4);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v3, "setHidden:", *(_BYTE *)(a1 + 32) == 0);
    }
  }

}

uint64_t __42__AXQuickSpeak__manipulateOtherTextViews___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisible:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __42__AXQuickSpeak__manipulateOtherTextViews___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_viewsWithBlock:(id)a3
{
  unsigned int (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = (unsigned int (**)(id, void *))a3;
  -[AXQuickSpeak highlightView](self, "highlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    _AXAssert();
  -[AXQuickSpeak highlightView](self, "highlightView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v7, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  v11 = (void *)MEMORY[0x24BDF6EA0];
  objc_msgSend(v7, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeTextEffectsWindowForWindowScene:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "subviews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v14);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeLastObject");
    if (v4[2](v4, v16))
      objc_msgSend(v15, "addObject:", v16);
    objc_msgSend(v16, "subviews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v17);

  }
  return v15;
}

- (id)_textSelectionViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;

  -[AXQuickSpeak highlightView](self, "highlightView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("interactionAssistant"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("selectionView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXQuickSpeak _viewsWithBlock:](self, "_viewsWithBlock:", &__block_literal_global_380);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "addObjectsFromArray:", v8);
  objc_msgSend(v6, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v7, "addObject:", v6);
  -[AXQuickSpeak _viewsWithBlock:](self, "_viewsWithBlock:", &__block_literal_global_383);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    if (v10)
LABEL_10:
      objc_msgSend(v7, "addObjectsFromArray:", v10);
  }
  else
  {
    -[AXQuickSpeak _quickSpeakInputInitiator](self, "_quickSpeakInputInitiator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "safeValueForKey:", CFSTR("_accessibilitySpeakTextSelectionViews"));
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
    }

    if (v10)
      goto LABEL_10;
  }

  return v7;
}

uint64_t __35__AXQuickSpeak__textSelectionViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("UISelectionGrabberDot"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __35__AXQuickSpeak__textSelectionViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("UITextSelectionView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_cleanupTextSelectionViews
{
  AXPerformBlockOnMainThreadAfterDelay();
  self->_lastQuickSpeakOffset = (CGPoint)*MEMORY[0x24BDBEFB0];
}

uint64_t __42__AXQuickSpeak__cleanupTextSelectionViews__block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__AXQuickSpeak__cleanupTextSelectionViews__block_invoke_2;
  v3[3] = &unk_24FF24B08;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __42__AXQuickSpeak__cleanupTextSelectionViews__block_invoke_3;
  v2[3] = &unk_24FF24B30;
  v2[4] = v4;
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v3, v2, 0.25);
}

uint64_t __42__AXQuickSpeak__cleanupTextSelectionViews__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "highlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "sentenceHighlightView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  return objc_msgSend(*(id *)(a1 + 32), "_manipulateOtherTextViews:", 1);
}

uint64_t __42__AXQuickSpeak__cleanupTextSelectionViews__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "highlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setHighlightView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "sentenceHighlightView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setSentenceHighlightView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHiddenTextSelectionViews:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setHiddenTextSelectionViewDelegates:", 0);
}

- (void)_handlePauseCallback
{
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "setIdleTimerDisabled:", -[AXQuickSpeak cachedIdleTimerPref](self, "cachedIdleTimerPref"));
  -[AXQuickSpeak _cleanupTextSelectionViews](self, "_cleanupTextSelectionViews");
}

- (void)_scrollToTextRect:(CGRect)a3 withScrollView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  BOOL v9;
  UIView *v10;
  uint64_t v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  BOOL v19;
  BOOL v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  BOOL v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  UIView *v57;
  CGFloat rect;
  UIView *rect_8;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  rect_8 = (UIView *)a4;
  v9 = -[UIView isHidden](rect_8, "isHidden");
  v10 = rect_8;
  if (!v9)
  {
    -[UIView window](rect_8, "window");
    v11 = objc_claimAutoreleasedReturnValue();
    v10 = rect_8;
    if (v11)
    {
      v12 = (void *)v11;
      v13 = -[UIView isScrollEnabled](rect_8, "isScrollEnabled");

      v10 = rect_8;
      if (v13)
      {
        -[UIView contentOffset](rect_8, "contentOffset");
        v15 = self->_lastQuickSpeakOffset.x;
        if (vabdd_f64(v15, v16) >= 5.0)
        {
          v18 = 0;
          v17 = self->_lastQuickSpeakOffset.y;
        }
        else
        {
          v17 = self->_lastQuickSpeakOffset.y;
          v18 = vabdd_f64(v17, v14) < 5.0;
        }
        v19 = v17 == *(double *)(MEMORY[0x24BDBEFB0] + 8) && v15 == *MEMORY[0x24BDBEFB0];
        v20 = !v19 && !v18;
        v10 = rect_8;
        if (!v20)
        {
          v60.origin.x = x;
          v60.origin.y = y;
          v60.size.width = width;
          v60.size.height = height;
          UIAccessibilityZoomFocusChanged((UIAccessibilityZoomType)4, v60, rect_8);
          -[UIView bounds](rect_8, "bounds");
          rect = v21;
          v23 = v22;
          v25 = v24;
          v27 = v26;
          -[UIView adjustedContentInset](rect_8, "adjustedContentInset");
          v32 = -v31;
          v33 = v31 < -0.0;
          v34 = 0.0;
          if (v33)
            v32 = 0.0;
          if (v28 >= -0.0)
            v35 = -v28;
          else
            v35 = 0.0;
          if (v29 >= -0.0)
            v36 = -v29;
          else
            v36 = 0.0;
          if (v30 >= -0.0)
            v34 = -v30;
          v37 = x + v35;
          v38 = y + v32;
          v39 = width - (v35 + v34);
          v40 = height - (v32 + v36);
          v61.origin.x = rect;
          v61.origin.y = v23;
          v61.size.width = v25;
          v61.size.height = v27;
          v62 = CGRectInset(v61, 0.0, 20.0);
          v41 = v62.origin.x;
          v42 = v62.origin.y;
          v43 = v62.size.width;
          v44 = v62.size.height;
          v63.origin.x = v37;
          v63.origin.y = v38;
          v63.size.width = v39;
          v63.size.height = v40;
          v45 = CGRectContainsRect(v62, v63);
          v10 = rect_8;
          if (!v45 && v44 >= v40)
          {
            -[UIView contentOffset](rect_8, "contentOffset");
            v48 = v37 + v39;
            if (v37 < v41)
              v46 = v37;
            if (v48 >= v41 + v43)
              v49 = v48 - v43;
            else
              v49 = v46;
            v50 = v38 + v40;
            if (v38 + v40 >= v42 + v44)
            {
              v50 = -25.0;
              v51 = v38 + -25.0;
            }
            else if (v38 < v42)
            {
              v51 = v38;
            }
            else
            {
              v51 = v47;
            }
            -[UIView bounds](rect_8, "bounds", v50);
            v53 = v52;
            -[UIView contentSize](rect_8, "contentSize");
            v55 = v51 + v53 - v54;
            if (v55 <= 0.0)
            {
              v57 = rect_8;
            }
            else
            {
              v56 = v51 - v55;
              v57 = rect_8;
              if (v56 > 0.0)
                v51 = v56;
            }
            -[UIView setContentOffset:animated:](v57, "setContentOffset:animated:", 1, v49, v51);
            v10 = rect_8;
            self->_lastQuickSpeakOffset.x = v49;
            self->_lastQuickSpeakOffset.y = v51;
          }
        }
      }
    }
  }

}

- (_NSRange)_updatedRangeForComposedCharacters:(_NSRange)a3 string:(id)a4 lastKnownWholeCharacterLocation:(unint64_t)a5 lastKnownUnicharLocation:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  id i;
  uint64_t v11;
  unint64_t v12;
  NSUInteger v13;
  unint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  for (i = a4; a6 < location; a6 += v11)
  {
    ++a5;
    objc_msgSend(i, "rangeOfComposedCharacterSequenceAtIndex:", a6);
  }
  v12 = location + length;
  if (a5 >= location + length)
  {
    v13 = 0;
  }
  else
  {
    v13 = 0;
    v14 = a5;
    do
    {
      objc_msgSend(i, "rangeOfComposedCharacterSequenceAtIndex:", v14);
      ++v13;
      v14 += v15;
    }
    while (v14 < v12);
  }

  v16 = a5;
  v17 = v13;
  result.length = v17;
  result.location = v16;
  return result;
}

- (id)_quickSpeakInputInitiator
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[AXQuickSpeak quickSpeakInitiator](self, "quickSpeakInitiator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_255EAC270) & 1) != 0)
  {
    if (!v3)
LABEL_3:
      AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    -[AXQuickSpeak quickSpeakInitiator](self, "quickSpeakInitiator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilitySpeakSelectionTextInputResponder");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
    if (!v5)
    {
      -[AXQuickSpeak contentOwner](self, "contentOwner");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_accessibilitySpeakSelectionTextInputResponder");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        -[AXQuickSpeak quickSpeakInitiator](self, "quickSpeakInitiator");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
          goto LABEL_3;
      }
    }
  }
  return v3;
}

uint64_t __41__AXQuickSpeak__quickSpeakInputInitiator__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "orator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSelectedContent");

  return objc_msgSend(*(id *)(a1 + 32), "stopAction:", 0);
}

- (id)_rectsByUnionSamelineRects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "CGRectValue", (_QWORD)v11);
          QSUnionRectsWithRect();
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_sentenceRects:(id)a3 speakingRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UITextRange **p_currentSentenceRange;
  UITextRange *currentSentenceRange;
  void *v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_accessibilityQuickSpeakTokenizer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AXUISentenceTextRangeForInput();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  currentSentenceRange = self->_currentSentenceRange;
  p_currentSentenceRange = &self->_currentSentenceRange;
  if ((objc_msgSend(v10, "isEqual:", currentSentenceRange) & 1) == 0)
  {
    objc_storeStrong((id *)p_currentSentenceRange, v10);
    objc_msgSend(v6, "_accessibilitySentenceRectsForRange:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");

    v8 = (void *)v14;
  }

  return v8;
}

- (id)_sentenceHighlightOverlapHeightArray
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (CachedSentenceRects && objc_msgSend((id)CachedSentenceRects, "count"))
  {
    objc_msgSend((id)CachedSentenceRects, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rectValue");
    v5 = v4;

    objc_msgSend((id)CachedSentenceRects, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rectValue");
    v8 = v7;

    if ((unint64_t)objc_msgSend((id)CachedSentenceRects, "count") >= 2)
    {
      v10 = 1;
      do
      {
        objc_msgSend((id)CachedSentenceRects, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "rectValue");
        v13 = v12;

        v14 = v8 + v5 - v13;
        objc_msgSend((id)CachedSentenceRects, "objectAtIndex:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "rectValue");
        v5 = v16;

        *(float *)&v17 = v14;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v18);

        ++v10;
        v8 = v13;
      }
      while (objc_msgSend((id)CachedSentenceRects, "count") > v10);
    }
    LODWORD(v9) = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v19);

  }
  return v2;
}

- (void)_willSpeakRange:(_NSRange)a3 string:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CGRect *v11;
  CGSize v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CGRect v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  length = a3.length;
  location = a3.location;
  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[AXQuickSpeak _quickSpeakInputInitiator](self, "_quickSpeakInputInitiator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (CGRect *)MEMORY[0x24BDBF090];
  v12 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v28.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v28.size = v12;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AXQuickSpeak _quickSpeakTextRects:withRange:string:highlightRects:sentenceRects:singleTextRect:](self, "_quickSpeakTextRects:withRange:string:highlightRects:sentenceRects:singleTextRect:", v8, location, length, v7, v9, v10, &v28);
  }
  else if (objc_msgSend(v8, "conformsToProtocol:", &unk_255EAC270))
  {
    -[AXQuickSpeak _quickSpeakUITextInputTextRects:withRange:string:highlightRects:sentenceRects:singleTextRect:](self, "_quickSpeakUITextInputTextRects:withRange:string:highlightRects:sentenceRects:singleTextRect:", v8, location, length, v7, v9, v10, &v28);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFE4D0], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "ignoreLogging");

    if ((v14 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4D0], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v16 = objc_claimAutoreleasedReturnValue();

      v17 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v16, v17))
      {
        AXColorizeFormatLog();
        v25 = v8;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v27;
          _os_log_impl(&dword_230C05000, v16, v17, "%{public}@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v8, "_accessibilityQuickSpeakTextRectsWithRange:string:highlightRects:sentenceRects:singleTextRect:", location, length, v7, v9, v10, &v28, v25);
  }
  if (objc_msgSend(v9, "count") || !CGRectEqualToRect(*v11, v28))
  {
    -[AXQuickSpeak _handleQuickSpeakHighlight:sentenceRects:textRect:initiator:](self, "_handleQuickSpeakHighlight:sentenceRects:textRect:initiator:", v9, v10, v8, *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFE4D0], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "ignoreLogging");

    if ((v19 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4D0], "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v21 = objc_claimAutoreleasedReturnValue();

      v22 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v21, v22))
      {
        AXColorizeFormatLog();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, v22))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v24;
          _os_log_impl(&dword_230C05000, v21, v22, "%{public}@", buf, 0xCu);
        }

      }
    }
  }

}

- (_NSRange)modifiedRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v7 = -[AXQuickSpeak _updatedRangeForComposedCharacters:string:lastKnownWholeCharacterLocation:lastKnownUnicharLocation:](self, "_updatedRangeForComposedCharacters:string:lastKnownWholeCharacterLocation:lastKnownUnicharLocation:", a3.location, a3.length, a4, self->_lastWholeCharacterLocation, self->_lastUnicharLocation);
  self->_lastWholeCharacterLocation = v7 + v8;
  self->_lastUnicharLocation = location + length;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)_quickSpeakTextRects:(id)a3 withRange:(_NSRange)a4 string:(id)a5 highlightRects:(id)a6 sentenceRects:(id)a7 singleTextRect:(CGRect *)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  void *v32;
  id v33;

  length = a4.length;
  location = a4.location;
  v33 = a3;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = -[AXQuickSpeak modifiedRange:withString:](self, "modifiedRange:withString:", location, length, v16);
  objc_msgSend(v16, "substringWithRange:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "_accessibilityRetrieveRectsForGuanularity:atSelectionOffset:wordText:", 1, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXQuickSpeak _rectsByUnionSamelineRects:](self, "_rectsByUnionSamelineRects:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "axSafelyAddObjectsFromArray:", v21);

  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v20, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "CGRectValue");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

  }
  else
  {
    v24 = *MEMORY[0x24BDBF090];
    v26 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v28 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v30 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  objc_msgSend(v33, "_accessibilityRetrieveRectsForGuanularity:atSelectionOffset:wordText:", 2, v17, v19);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXQuickSpeak _rectsByUnionSamelineRects:](self, "_rectsByUnionSamelineRects:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "axSafelyAddObjectsFromArray:", v32);

  a8->origin.x = v24;
  a8->origin.y = v26;
  a8->size.width = v28;
  a8->size.height = v30;

}

- (void)_quickSpeakUITextInputTextRects:(id)a3 withRange:(_NSRange)a4 string:(id)a5 highlightRects:(id)a6 sentenceRects:(id)a7 singleTextRect:(CGRect *)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  CGSize v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  os_log_type_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CGSize v40;
  void *v41;
  os_log_type_t type;
  void *v43;
  id v44;
  id v45;
  uint8_t buf[16];
  CGSize v47;
  uint64_t v48;

  length = a4.length;
  location = a4.location;
  v48 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v45 = a6;
  v44 = a7;
  v16 = -[AXQuickSpeak modifiedRange:withString:](self, "modifiedRange:withString:", location, length, v15);
  v18 = v17;
  -[AXQuickSpeak quickSpeakInitiator](self, "quickSpeakInitiator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v19, &QSSelectedTextRangeKey);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    -[AXQuickSpeak speakingSentenceRange](self, "speakingSentenceRange");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      -[AXQuickSpeak speakingSentenceRange](self, "speakingSentenceRange");
    else
      objc_msgSend(v14, "selectedTextRange");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXQuickSpeak quickSpeakInitiator](self, "quickSpeakInitiator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v22, &QSSelectedTextRangeKey, v20, (void *)1);

  }
  objc_msgSend(v20, "start");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "positionFromPosition:offset:", v23, v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "positionFromPosition:offset:", v24, v18);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v24 && v25)
  {
    objc_msgSend(v14, "textRangeFromPosition:toPosition:", v24, v25);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    *(_OWORD *)buf = *MEMORY[0x24BDBF090];
    v47 = v28;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "substringWithRange:", v16, v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_accessibilityTextRectsForRange:singleTextRect:selectedRange:string:", v27, buf, v20, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v14, "_accessibilityTextRectsForRange:singleTextRect:", v27, buf);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v45, "axSafelyAddObjectsFromArray:", v30);
    -[AXQuickSpeak _sentenceRects:speakingRange:](self, "_sentenceRects:speakingRange:", v14, v27);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "axSafelyAddObjectsFromArray:", v39);
    v40 = v47;
    a8->origin = *(CGPoint *)buf;
    a8->size = v40;

LABEL_17:
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDFE4D0], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "ignoreLogging");

  if ((v32 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4D0], "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v27 = objc_claimAutoreleasedReturnValue();

    v34 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v27, v34))
    {
      AXColorizeFormatLog();
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "start");
      type = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)v35;
      _AXStringForArgs();
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v27, type))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v38;
        _os_log_impl(&dword_230C05000, v27, type, "%{public}@", buf, 0xCu);
      }

    }
    goto LABEL_17;
  }
LABEL_18:

}

- (id)_sliceRects:(id)a3 withSentenceRects:(id)a4 wordRects:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  float v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  uint64_t j;
  void *v27;
  double v28;
  double v29;
  double Width;
  float Height;
  double v32;
  float v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  id v45;
  id obj;
  uint64_t v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v59 = *MEMORY[0x24BDAC8D0];
  v48 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (!v7)
  {
    v45 = v8;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v44 = v7;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (!v10)
    goto LABEL_30;
  v11 = v10;
  v47 = *(_QWORD *)v54;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v54 != v47)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
      objc_msgSend(v13, "rectValue");
      v15 = v14;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v16 = v9;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (!v17)
      {

LABEL_27:
        objc_msgSend(v48, "addObject:", v13);
        continue;
      }
      v18 = v17;
      v19 = v9;
      v20 = 0;
      v21 = v15;
      v22 = *(_QWORD *)v50;
      v23 = v21;
      v24 = 1.17549435e-38;
      v25 = 3.40282347e38;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(v16);
          v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          objc_msgSend(v27, "rectValue");
          if (vabdd_f64(v23, v28) <= 1.0)
          {
            if ((v20 & 1) == 0)
              v20 = 1;
            objc_msgSend(v27, "rectValue");
            if (v25 >= v29)
              v25 = v29;
            objc_msgSend(v27, "rectValue");
            Width = CGRectGetWidth(v60);
            if (v24 < Width)
              v24 = Width;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v18);

      v9 = v19;
      if ((v20 & 1) == 0)
        goto LABEL_27;
      objc_msgSend(v13, "rectValue");
      Height = CGRectGetHeight(v61);
      objc_msgSend(v13, "rectValue");
      v33 = v32;
      v34 = v33;
      if (v25 >= v33)
        v35 = v25;
      else
        v35 = v33;
      v36 = vabdd_f64(v34, v35);
      v37 = Height;
      objc_msgSend(v13, "rectValue");
      v38 = CGRectGetWidth(v62);
      v63.origin.x = v34;
      v63.origin.y = v23;
      v63.size.width = v36;
      v63.size.height = v37;
      v39 = vabdd_f64(v38 - CGRectGetWidth(v63), v24);
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v34, v23, v36, v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addObject:", v40);

      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v24 + v35, v23, v39, v37);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addObject:", v41);

      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v35, v23, v24, v37);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addObject:", v42);

    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  }
  while (v11);
LABEL_30:

  v7 = v44;
LABEL_32:

  return v45;
}

- (void)_handleQuickSpeakHighlight:(id)a3 sentenceRects:(id)a4 textRect:(CGRect)a5 initiator:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  float v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  BOOL v47;
  AXQuickSpeak *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  unint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  objc_class *v90;
  unint64_t v91;
  void *v92;
  int v93;
  int isKindOfClass;
  int v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  AXQuickSpeak *v112;
  void *v113;
  void *v114;
  _QWORD v115[5];
  uint64_t v116;
  double v117;
  double v118;
  double v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  uint64_t v125;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v125 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  objc_msgSend(v15, "textInputView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[AXQuickSpeak quickSpeakInitiator](self, "quickSpeakInitiator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v17;
    }
    else
    {
      v16 = v15;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v16 = 0;
      }
    }
  }
  objc_msgSend(v16, "_accessibilitySpeakSelectionAssociatedScrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v18, "superview");
      v19 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v19;
    }
    while (v19);
  }
  v110 = v13;
  v20 = v18;
  v113 = v16;
  objc_msgSend(v16, "convertRect:toView:", v20, x, y, width, height);
  v107 = v20;
  -[AXQuickSpeak _scrollToTextRect:withScrollView:](self, "_scrollToTextRect:withScrollView:", v20);
  if (v14 && objc_msgSend(v14, "count"))
  {
    objc_storeStrong((id *)&CachedSentenceRects, a4);
    -[AXQuickSpeak _sentenceHighlightOverlapHeightArray](self, "_sentenceHighlightOverlapHeightArray");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)CachedSentenceHighlightOverlapHeights;
    CachedSentenceHighlightOverlapHeights = v21;

  }
  v112 = self;
  v109 = v14;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v23 = (id)CachedSentenceRects;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v121 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
        objc_msgSend(v28, "rectValue");
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;
        objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "quickSpeakSentenceHighlightOption");

        if (v38 == 2 && objc_msgSend((id)CachedSentenceRects, "indexOfObject:", v28) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v39 = objc_msgSend((id)CachedSentenceRects, "indexOfObject:", v28);
          if (CachedSentenceHighlightOverlapHeights)
          {
            if (objc_msgSend((id)CachedSentenceHighlightOverlapHeights, "count") > v39)
            {
              objc_msgSend((id)CachedSentenceHighlightOverlapHeights, "objectAtIndex:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "floatValue");
              v36 = v36 - v41;

            }
          }
        }
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v30, v32, v34, v36);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "addObject:", v42);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
    }
    while (v25);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "quickSpeakHighlightOption") == 3)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "quickSpeakSentenceHighlightOption");

    v47 = v46 == 2;
    v49 = v110;
    v48 = v112;
    v50 = v113;
    if (v47)
    {
      -[AXQuickSpeak _sliceRects:withSentenceRects:wordRects:](v112, "_sliceRects:withSentenceRects:wordRects:", v43, v114, v110);
      v51 = objc_claimAutoreleasedReturnValue();

      v49 = (void *)v51;
      goto LABEL_30;
    }
  }
  else
  {

    v49 = v13;
    v48 = v112;
    v50 = v113;
  }
  objc_msgSend(v43, "addObjectsFromArray:", v114);
LABEL_30:
  if (!_AXSQuickSpeakHighlightTextEnabled())
    goto LABEL_85;
  -[AXQuickSpeak highlightView](v48, "highlightView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v52)
  {
    v53 = objc_alloc(MEMORY[0x24BDFFAB8]);
    v54 = *MEMORY[0x24BDBF090];
    v55 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v56 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v57 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v58 = (void *)objc_msgSend(v53, "initWithFrame:", *MEMORY[0x24BDBF090], v55, v56, v57);
    objc_msgSend(v58, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "quickSpeakWordHighlightColor");

    v111 = v58;
    if (!v60)
    {
      v67 = 0x24BDF6000uLL;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v15, "selectionHighlightColor");
      else
        objc_msgSend(MEMORY[0x24BDF6950], "safeValueForKey:", CFSTR("selectionHighlightColor"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = 0.0;
      v119 = 0.0;
      v116 = 0;
      v117 = 0.0;
      objc_msgSend(v74, "getRed:green:blue:alpha:", &v119, &v118, &v117, &v116);
      v75 = v119 * 0.9;
      if (v119 * 0.9 < 0.0)
        v75 = 0.0;
      v76 = v118 * 0.9;
      if (v118 * 0.9 < 0.0)
        v76 = 0.0;
      v77 = v117 * 0.9;
      if (v117 * 0.9 < 0.0)
        v77 = 0.0;
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v75, v76, v77, 0.5);
      v70 = objc_claimAutoreleasedReturnValue();
      goto LABEL_49;
    }
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "quickSpeakWordHighlightColor");
    v62 = AXSpeakHighlightColor();

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "quickSpeakSentenceHighlightColor");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0x24BDF6000;
    if (v65 == objc_msgSend(v66, "quickSpeakWordHighlightColor"))
    {
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "quickSpeakHighlightOption");

      if (v69 != 3)
      {
LABEL_40:
        objc_msgSend(v63, "colorWithAlphaComponent:", 0.5);
        v70 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "quickSpeakSentenceHighlightColor");
        v72 = AXSpeakHighlightColor();

        objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "colorWithAlphaComponent:", 0.5);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = v111;
LABEL_49:
        v106 = (void *)v70;
        objc_msgSend(v58, "setSelectionColor:", v70);
        v108 = v74;
        if (objc_msgSend(v43, "count"))
        {
          v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFFAB8]), "initWithFrame:", v54, v55, v56, v57);
          objc_msgSend(v78, "setSentenceHighlight:", 1);
          objc_msgSend(v78, "setAlpha:", 0.0);
          objc_msgSend(v78, "setSelectionColor:", v74);
        }
        else
        {
          v78 = 0;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "bundleIdentifier");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v80, "isEqualToString:", *MEMORY[0x24BDFE438]);

        objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v82, "quickSpeakSentenceHighlightColor");

        if (v83)
        {
          objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "quickSpeakSentenceHighlightColor");
          v85 = AXSpeakHighlightColor();

          objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (v81)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v113, "backgroundColor");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              if (v87)
              {
                AXInvertColorForColor();
                v88 = objc_claimAutoreleasedReturnValue();

                v86 = (void *)v88;
              }

            }
          }
        }
        objc_msgSend(v78, "setUnderlineColor:", v86);

        v89 = objc_opt_class();
        if (v89)
        {
          v90 = (objc_class *)v89;
          v91 = v67;
          while (1)
          {
            NSStringFromClass(v90);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v92, "isEqualToString:", CFSTR("WKContentView")) & 1) != 0
              || objc_msgSend(v92, "isEqualToString:", CFSTR("UIWebBrowserView")))
            {
              break;
            }
            v90 = (objc_class *)-[objc_class superclass](v90, "superclass");

            if (!v90)
            {
              v93 = 0;
              goto LABEL_67;
            }
          }

          v93 = 1;
        }
        else
        {
          v91 = v67;
          v93 = 0;
        }
LABEL_67:
        NSClassFromString(CFSTR("SXCanvasView"));
        v50 = v113;
        isKindOfClass = objc_opt_isKindOfClass();
        NSClassFromString(CFSTR("TSDCanvasView"));
        v95 = (v93 | objc_opt_isKindOfClass()) & v81;
        v48 = v112;
        if (v95 == 1)
        {
          objc_msgSend(v113, "superview");
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          if (v96)
          {
            if (v78)
            {
              objc_msgSend(v113, "superview");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "addSubview:", v78);

            }
            objc_msgSend(v113, "superview");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "addSubview:", v111);

          }
        }
        else if (((v93 | isKindOfClass) & 1) != 0)
        {
          if (v78)
            objc_msgSend(v113, "addSubview:", v78);
          objc_msgSend(v113, "addSubview:", v111);
        }
        else
        {
          objc_msgSend(v113, "insertSubview:atIndex:", v111, 0);
          if (v78)
            objc_msgSend(v113, "insertSubview:atIndex:", v78, 0);
        }
        objc_msgSend(v113, "bounds");
        objc_msgSend(v111, "setFrame:");
        objc_msgSend(v113, "bounds");
        objc_msgSend(v78, "setFrame:");
        -[AXQuickSpeak setHighlightView:](v112, "setHighlightView:", v111);
        -[AXQuickSpeak highlightView](v112, "highlightView");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "superview");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "setAutoresizesSubviews:", 1);

        if (v78 && !-[AXQuickSpeak spellOutContent](v112, "spellOutContent"))
        {
          -[AXQuickSpeak setSentenceHighlightView:](v112, "setSentenceHighlightView:", v78);
          -[AXQuickSpeak sentenceHighlightView](v112, "sentenceHighlightView");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "superview");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "setAutoresizesSubviews:", 1);

        }
        v103 = *(void **)(v91 + 3984);
        v115[0] = MEMORY[0x24BDAC760];
        v115[1] = 3221225472;
        v115[2] = __76__AXQuickSpeak__handleQuickSpeakHighlight_sentenceRects_textRect_initiator___block_invoke;
        v115[3] = &unk_24FF24B08;
        v115[4] = v112;
        objc_msgSend(v103, "animateWithDuration:animations:", v115, 0.25);

        goto LABEL_82;
      }
      AXSlightlyDarkerColorForColor();
      v64 = v63;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

    }
    goto LABEL_40;
  }
LABEL_82:
  -[AXQuickSpeak highlightView](v48, "highlightView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setHighlightSelectionRects:", v49);

  if (objc_msgSend(v43, "count") && !-[AXQuickSpeak spellOutContent](v48, "spellOutContent"))
  {
    -[AXQuickSpeak sentenceHighlightView](v48, "sentenceHighlightView");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "setHighlightSelectionRects:", v43);

  }
LABEL_85:

}

void __76__AXQuickSpeak__handleQuickSpeakHighlight_sentenceRects_textRect_initiator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_manipulateOtherTextViews:", 0);
  objc_msgSend(*(id *)(a1 + 32), "highlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "sentenceHighlightView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (BOOL)isSpeaking
{
  void *v2;
  char v3;

  -[AXQuickSpeak orator](self, "orator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSpeaking");

  return v3;
}

- (void)speakStatusWithLanguage:(id)a3 rate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AXQuickSpeak orator](self, "orator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "speakStatusWithLanguage:rate:", v7, v6);

}

- (BOOL)selectedContentIsSpeakable
{
  void *v2;
  char v3;

  -[AXQuickSpeak orator](self, "orator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentIsSpeakable");

  return v3;
}

- (BOOL)selectedContentRequiresUserChoice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  void *v23;
  void *v24;
  int v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[AXQuickSpeak selectedContent](self, "selectedContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLanguageID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "predictedSecondaryLangMaps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v2, "unpredictedAmbiguousLangMaps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 >= 2)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v2, "ambiguousLangMaps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v32 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v14, "generalLanguageID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v4);

            if (v16)
            {
              v11 = v14;
              goto LABEL_15;
            }
          }
          v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_15:

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v2, "ambiguousLangMaps", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v28;
        while (2)
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(v17);
            v22 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * j);
            if (v11 != v22)
            {
              objc_msgSend(v11, "associatedAmbiguousLanguages");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "generalLanguageID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v23, "containsObject:", v24);

              if (!v25)
              {
                v7 = 1;
                goto LABEL_26;
              }
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v19)
            continue;
          break;
        }
      }

      objc_msgSend(v2, "unpredictedAmbiguousLangMaps");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (unint64_t)objc_msgSend(v17, "count") > 1;
LABEL_26:

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)oratorDidFinishSpeaking:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "setIdleTimerDisabled:", -[AXQuickSpeak cachedIdleTimerPref](self, "cachedIdleTimerPref", a3));
  -[AXQuickSpeak stopAction:](self, "stopAction:", 0);
  -[AXQuickSpeak orator](self, "orator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearSelectedContent");

  -[AXQuickSpeak quickSpeakInitiator](self, "quickSpeakInitiator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityHandleFinishSpeaking");

  -[AXQuickSpeak _cleanupTextSelectionViews](self, "_cleanupTextSelectionViews");
}

- (void)oratorDidResumeSpeaking:(id)a3
{
  id *v3;

  v3 = (id *)MEMORY[0x24BDF74F8];
  -[AXQuickSpeak setCachedIdleTimerPref:](self, "setCachedIdleTimerPref:", objc_msgSend((id)*MEMORY[0x24BDF74F8], "isIdleTimerDisabled", a3));
  objc_msgSend(*v3, "setIdleTimerDisabled:", 1);
}

- (void)orator:(id)a3 willSpeakRange:(_NSRange)a4 ofContent:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v6 = a5;
  -[AXQuickSpeak highlightViewDispatcher](self, "highlightViewDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDFE490]);
    v9 = (void *)objc_msgSend(v8, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    -[AXQuickSpeak setHighlightViewDispatcher:](self, "setHighlightViewDispatcher:", v9);

  }
  v11 = MEMORY[0x24BDAC760];
  v10 = v6;
  AXPerformSafeBlock();
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "setIdleTimerDisabled:", 1, v11, 3221225472, __48__AXQuickSpeak_orator_willSpeakRange_ofContent___block_invoke, &unk_24FF24C28, self);

}

uint64_t __48__AXQuickSpeak_orator_willSpeakRange_ofContent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_willSpeakRange:string:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (UITextRange)speakingSentenceRange
{
  return self->speakingSentenceRange;
}

- (void)setSpeakingSentenceRange:(id)a3
{
  objc_storeStrong((id *)&self->speakingSentenceRange, a3);
}

- (BOOL)cachedIdleTimerPref
{
  return self->_cachedIdleTimerPref;
}

- (void)setCachedIdleTimerPref:(BOOL)a3
{
  self->_cachedIdleTimerPref = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (id)quickSpeakInitiator
{
  return self->_quickSpeakInitiator;
}

- (void)setQuickSpeakInitiator:(id)a3
{
  objc_storeStrong(&self->_quickSpeakInitiator, a3);
}

- (QSSelectionHighlightView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (NSArray)hiddenTextSelectionViews
{
  return self->_hiddenTextSelectionViews;
}

- (void)setHiddenTextSelectionViews:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenTextSelectionViews, a3);
}

- (QSSelectionHighlightView)sentenceHighlightView
{
  return self->_sentenceHighlightView;
}

- (void)setSentenceHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_sentenceHighlightView, a3);
}

- (NSArray)hiddenTextSelectionViewDelegates
{
  return self->_hiddenTextSelectionDelegates;
}

- (void)setHiddenTextSelectionViewDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenTextSelectionDelegates, a3);
}

- (AXDispatchTimer)highlightViewDispatcher
{
  return self->_highlightViewDispatcher;
}

- (void)setHighlightViewDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_highlightViewDispatcher, a3);
}

- (id)contentOwner
{
  return self->_contentOwner;
}

- (void)setContentOwner:(id)a3
{
  objc_storeStrong(&self->_contentOwner, a3);
}

- (BOOL)hasTextBalloonView
{
  return self->_hasTextBalloonView;
}

- (void)setHasTextBalloonView:(BOOL)a3
{
  self->_hasTextBalloonView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contentOwner, 0);
  objc_storeStrong((id *)&self->_highlightViewDispatcher, 0);
  objc_storeStrong((id *)&self->_hiddenTextSelectionDelegates, 0);
  objc_storeStrong((id *)&self->_sentenceHighlightView, 0);
  objc_storeStrong((id *)&self->_hiddenTextSelectionViews, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong(&self->_quickSpeakInitiator, 0);
  objc_storeStrong((id *)&self->speakingSentenceRange, 0);
  objc_storeStrong((id *)&self->_currentSentenceRange, 0);
  objc_storeStrong((id *)&self->_orator, 0);
}

@end
