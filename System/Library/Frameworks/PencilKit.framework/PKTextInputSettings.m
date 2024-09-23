@implementation PKTextInputSettings

+ (id)sharedSettings
{
  if (qword_1ECEE60D0 != -1)
    dispatch_once(&qword_1ECEE60D0, &__block_literal_global_8);
  return (id)qword_1ECEE60C8;
}

void __37__PKTextInputSettings_sharedSettings__block_invoke()
{
  PKTextInputSettings *v0;
  void *v1;

  v0 = objc_alloc_init(PKTextInputSettings);
  v1 = (void *)qword_1ECEE60C8;
  qword_1ECEE60C8 = (uint64_t)v0;

}

- (PKTextInputSettings)init
{
  PKTextInputSettings *v2;
  PKTextInputSettings *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKTextInputSettings;
  v2 = -[PKTextInputSettings init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PKTextInputSettings _loadDefaultValues](v2, "_loadDefaultValues");
    -[PKTextInputSettings loadSettingsFromUserDefaults](v3, "loadSettingsFromUserDefaults");
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v3, CFSTR("ApplePencilTextInputEnabled"), 0, &PKTextInputEnabledDidChangeContext);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("ApplePencilTextInputEnabled"), &PKTextInputEnabledDidChangeContext);

  v4.receiver = self;
  v4.super_class = (Class)PKTextInputSettings;
  -[PKTextInputSettings dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == &PKTextInputEnabledDidChangeContext)
  {
    -[PKTextInputSettings _notifyRecognitionLocaleIdentifierDidChange](self, "_notifyRecognitionLocaleIdentifierDidChange", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)PKTextInputSettings;
    -[PKTextInputSettings observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_notifyRecognitionLocaleIdentifierDidChange
{
  void (**v2)(_QWORD);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKTextInputSettings__notifyRecognitionLocaleIdentifierDidChange__block_invoke;
  aBlock[3] = &unk_1E7778020;
  aBlock[4] = self;
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v2[2](v2);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __66__PKTextInputSettings__notifyRecognitionLocaleIdentifierDidChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PKTextInputSettingsRecognitionLocaleIdentifierDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (BOOL)_shouldSaveSettings
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Preferences"));

  return v4;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTextInputSettings;
  -[PKTextInputSettings setValue:forKey:](&v5, sel_setValue_forKey_, a3, a4);
  if (-[PKTextInputSettings _shouldSaveSettings](self, "_shouldSaveSettings"))
    -[PKTextInputSettings _scheduleSavingSettingsSoon](self, "_scheduleSavingSettingsSoon");
}

+ (int64_t)featureLevel
{
  if (qword_1ECEE60E0 != -1)
    dispatch_once(&qword_1ECEE60E0, &__block_literal_global_18);
  return qword_1ECEE60D8;
}

void __35__PKTextInputSettings_featureLevel__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  int v8;

  if (!MGGetBoolAnswer())
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.PreBoard")) & 1) != 0)
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.AskPermissionUI")) & 1) != 0)
  {

    goto LABEL_5;
  }
  if (qword_1ECEE60E8 != -1)
    dispatch_once(&qword_1ECEE60E8, &__block_literal_global_541);
  v5 = _MergedGlobals_113;

  if (!v5)
  {
LABEL_12:
    v4 = 0;
    goto LABEL_13;
  }
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v4 = 1;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E77EB8B0, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v1, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v0, "containsObject:", v7);

  v4 = v8 ^ 1u;
LABEL_6:

LABEL_13:
  qword_1ECEE60D8 = v4;
}

- (BOOL)isScribbleActive
{
  void *v2;
  void *v3;
  BOOL v4;

  if (!-[PKTextInputSettings _isFeatureAvailableAndEnabled](self, "_isFeatureAvailableAndEnabled"))
    return 0;
  if (*MEMORY[0x1E0DC4730])
  {
    +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentLanguageIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count") != 0;

    return v4;
  }
  return +[PKTextInputLanguageSelectionController hasSomeSupportedAndEnabledLocale](PKTextInputLanguageSelectionController, "hasSomeSupportedAndEnabledLocale");
}

- (NSString)currentLanguageIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  if (-[PKTextInputSettings _isFeatureAvailableAndEnabled](self, "_isFeatureAvailableAndEnabled"))
  {
    +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentLanguageIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (BOOL)_isFeatureAvailableAndEnabled
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!+[PKTextInputSettings featureLevel](PKTextInputSettings, "featureLevel"))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ApplePencilTextInputEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PKTextInputSettings forceUserTextInputSettingEnabled](self, "forceUserTextInputSettingEnabled")
    || !v4
    || objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)settingsDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
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
  _QWORD v109[66];
  _QWORD v110[68];

  v110[66] = *MEMORY[0x1E0C80C00];
  v109[0] = CFSTR("interactionDisablingDelay");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings interactionDisablingDelay](self, "interactionDisablingDelay");
  objc_msgSend(v3, "numberWithDouble:");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v108;
  v109[1] = CFSTR("textInputStrokeFadeOutDelay");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings textInputStrokeFadeOutDelay](self, "textInputStrokeFadeOutDelay");
  objc_msgSend(v4, "numberWithDouble:");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v107;
  v109[2] = CFSTR("textInputStrokeFadeOutDuration");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings textInputStrokeFadeOutDuration](self, "textInputStrokeFadeOutDuration");
  objc_msgSend(v5, "numberWithDouble:");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v110[2] = v106;
  v109[3] = CFSTR("continuousRecognitionWritingInterval");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings continuousRecognitionWritingInterval](self, "continuousRecognitionWritingInterval");
  objc_msgSend(v6, "numberWithDouble:");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v110[3] = v105;
  v109[4] = CFSTR("continuousRecognition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings continuousRecognition](self, "continuousRecognition"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v110[4] = v104;
  v109[5] = CFSTR("recognitionCoalescingDelay");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings recognitionCoalescingDelay](self, "recognitionCoalescingDelay");
  objc_msgSend(v7, "numberWithDouble:");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v110[5] = v103;
  v109[6] = CFSTR("outOfProcessRecognition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings outOfProcessRecognition](self, "outOfProcessRecognition"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v110[6] = v102;
  v109[7] = CFSTR("textInputViewHitTestSlackHorizontal");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings textInputViewHitTestSlackHorizontal](self, "textInputViewHitTestSlackHorizontal");
  objc_msgSend(v8, "numberWithDouble:");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v110[7] = v101;
  v109[8] = CFSTR("textInputViewHitTestSlackVertical");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings textInputViewHitTestSlackVertical](self, "textInputViewHitTestSlackVertical");
  objc_msgSend(v9, "numberWithDouble:");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v110[8] = v100;
  v109[9] = CFSTR("firstResponderAttractionHorizontal");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings firstResponderAttractionHorizontal](self, "firstResponderAttractionHorizontal");
  objc_msgSend(v10, "numberWithDouble:");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v110[9] = v99;
  v109[10] = CFSTR("firstResponderAttractionVertical");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings firstResponderAttractionVertical](self, "firstResponderAttractionVertical");
  objc_msgSend(v11, "numberWithDouble:");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v110[10] = v98;
  v109[11] = CFSTR("minimumWritingSpaceWidth");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings minimumWritingSpaceWidth](self, "minimumWritingSpaceWidth");
  objc_msgSend(v12, "numberWithDouble:");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v110[11] = v97;
  v109[12] = CFSTR("subwordGestureEndingSpeedRange");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings subwordGestureEndingSpeedRange](self, "subwordGestureEndingSpeedRange");
  objc_msgSend(v13, "numberWithDouble:");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v110[12] = v96;
  v109[13] = CFSTR("subwordGestureSpeedThreshold");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings subwordGestureSpeedThreshold](self, "subwordGestureSpeedThreshold");
  objc_msgSend(v14, "numberWithDouble:");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v110[13] = v95;
  v109[14] = CFSTR("preventLeftoverCharsInSubwordGestures");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings preventLeftoverCharsInSubwordGestures](self, "preventLeftoverCharsInSubwordGestures"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v110[14] = v94;
  v109[15] = CFSTR("activePreviewEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings activePreviewEnabled](self, "activePreviewEnabled"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v110[15] = v93;
  v109[16] = CFSTR("styledActivePreview");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings styledActivePreview](self, "styledActivePreview"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v110[16] = v92;
  v109[17] = CFSTR("floatingBackgroundEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings floatingBackgroundEnabled](self, "floatingBackgroundEnabled"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v110[17] = v91;
  v109[18] = CFSTR("textInputStandardCommitDelay");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings textInputStandardCommitDelay](self, "textInputStandardCommitDelay");
  objc_msgSend(v15, "numberWithDouble:");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v110[18] = v90;
  v109[19] = CFSTR("singleCharacterCommitDelay");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings singleCharacterCommitDelay](self, "singleCharacterCommitDelay");
  objc_msgSend(v16, "numberWithDouble:");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v110[19] = v89;
  v109[20] = CFSTR("incrementalCommitWordsBack");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKTextInputSettings incrementalCommitWordsBack](self, "incrementalCommitWordsBack"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v110[20] = v88;
  v109[21] = CFSTR("debugRecognitionRequestArtificialDelay");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings debugRecognitionRequestArtificialDelay](self, "debugRecognitionRequestArtificialDelay");
  objc_msgSend(v17, "numberWithDouble:");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v110[21] = v87;
  v109[22] = CFSTR("debugElementFinderArtificialDelay");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings debugElementFinderArtificialDelay](self, "debugElementFinderArtificialDelay");
  objc_msgSend(v18, "numberWithDouble:");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v110[22] = v86;
  v109[23] = CFSTR("debugFirstResponderArtificialDelay");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings debugFirstResponderArtificialDelay](self, "debugFirstResponderArtificialDelay");
  objc_msgSend(v19, "numberWithDouble:");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v110[23] = v85;
  v109[24] = CFSTR("enableOnNonEditableViews");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings enableOnNonEditableViews](self, "enableOnNonEditableViews"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v110[24] = v84;
  v109[25] = CFSTR("enableOnRemoteViews");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings enableOnRemoteViews](self, "enableOnRemoteViews"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v110[25] = v83;
  v109[26] = CFSTR("enableViewControllerSupport");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings enableViewControllerSupport](self, "enableViewControllerSupport"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v110[26] = v82;
  v109[27] = CFSTR("UCBPaletteEnabledNewKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings UCBPaletteEnabled](self, "UCBPaletteEnabled"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v110[27] = v81;
  v109[28] = CFSTR("alwaysIncludeReturnKeyAndInputAssistantItems");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings alwaysIncludeReturnKeyAndInputAssistantItems](self, "alwaysIncludeReturnKeyAndInputAssistantItems"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v110[28] = v80;
  v109[29] = CFSTR("hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent](self, "hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v110[29] = v79;
  v109[30] = CFSTR("enableReserveSpace");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings enableReserveSpace](self, "enableReserveSpace"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v110[30] = v78;
  v109[31] = CFSTR("enableReserveSpaceTapForNewlines");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings enableReserveSpaceTapForNewlines](self, "enableReserveSpaceTapForNewlines"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v110[31] = v77;
  v109[32] = CFSTR("asyncElementRequestTimeout");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings asyncElementRequestTimeout](self, "asyncElementRequestTimeout");
  objc_msgSend(v20, "numberWithDouble:");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v110[32] = v76;
  v109[33] = CFSTR("drawingGestureMinimumPanDistanceThreshold");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings drawingGestureMinimumPanDistanceThreshold](self, "drawingGestureMinimumPanDistanceThreshold");
  objc_msgSend(v21, "numberWithDouble:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v110[33] = v75;
  v109[34] = CFSTR("drawingGestureMinimumScrollDistanceThreshold");
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings drawingGestureMinimumScrollDistanceThreshold](self, "drawingGestureMinimumScrollDistanceThreshold");
  objc_msgSend(v22, "numberWithDouble:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v110[34] = v74;
  v109[35] = CFSTR("drawingGestureTapDetectionTimeInterval2");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings drawingGestureTapDetectionTimeInterval](self, "drawingGestureTapDetectionTimeInterval");
  objc_msgSend(v23, "numberWithDouble:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v110[35] = v73;
  v109[36] = CFSTR("drawingGestureTapDetectionDistanceThreshold3");
  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings drawingGestureTapDetectionDistanceThreshold](self, "drawingGestureTapDetectionDistanceThreshold");
  objc_msgSend(v24, "numberWithDouble:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v110[36] = v72;
  v109[37] = CFSTR("drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance](self, "drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance");
  objc_msgSend(v25, "numberWithDouble:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v110[37] = v71;
  v109[38] = CFSTR("drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance](self, "drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance");
  objc_msgSend(v26, "numberWithDouble:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v110[38] = v70;
  v109[39] = CFSTR("drawingGestureLongPressMaxDistance");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings drawingGestureLongPressMaxDistance](self, "drawingGestureLongPressMaxDistance");
  objc_msgSend(v27, "numberWithDouble:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v110[39] = v69;
  v109[40] = CFSTR("drawingGestureLongPressDetectionTimeInterval");
  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings drawingGestureLongPressDetectionTimeInterval](self, "drawingGestureLongPressDetectionTimeInterval");
  objc_msgSend(v28, "numberWithDouble:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v110[40] = v68;
  v109[41] = CFSTR("inkWeight");
  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings inkWeight](self, "inkWeight");
  objc_msgSend(v29, "numberWithDouble:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v110[41] = v67;
  v109[42] = CFSTR("lineBreakOnTapEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings lineBreakOnTapEnabled](self, "lineBreakOnTapEnabled"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v110[42] = v66;
  v109[43] = CFSTR("inkWeightForIncreasedContrast");
  v30 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings inkWeightForIncreasedContrast](self, "inkWeightForIncreasedContrast");
  objc_msgSend(v30, "numberWithDouble:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v110[43] = v65;
  v109[44] = CFSTR("lineBreakVerticalBarGestureEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings lineBreakVerticalBarGestureEnabled](self, "lineBreakVerticalBarGestureEnabled"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v110[44] = v64;
  v109[45] = CFSTR("lineBreakVerticalBarUpToDelete");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings lineBreakVerticalBarUpToDelete](self, "lineBreakVerticalBarUpToDelete"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v110[45] = v63;
  v109[46] = CFSTR("autoLineBreakEnabled2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings autoLineBreakEnabled](self, "autoLineBreakEnabled"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v110[46] = v62;
  v109[47] = CFSTR("autoLineBreakRequireWeakCursor2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings autoLineBreakRequireWeakCursor](self, "autoLineBreakRequireWeakCursor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v110[47] = v61;
  v109[48] = CFSTR("autoLineBreakVerticalDistance2");
  v31 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings autoLineBreakVerticalDistance](self, "autoLineBreakVerticalDistance");
  objc_msgSend(v31, "numberWithDouble:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v110[48] = v60;
  v109[49] = CFSTR("autoLineBreakDualVerticalDistance2");
  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings autoLineBreakDualVerticalDistance](self, "autoLineBreakDualVerticalDistance");
  objc_msgSend(v32, "numberWithDouble:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v110[49] = v59;
  v109[50] = CFSTR("autoLineBreakAreaWidthFactor3");
  v33 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings autoLineBreakAreaWidthFactor](self, "autoLineBreakAreaWidthFactor");
  objc_msgSend(v33, "numberWithDouble:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v110[50] = v58;
  v109[51] = CFSTR("tapToLineBreakVerticalDistance2");
  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings tapToLineBreakVerticalDistance](self, "tapToLineBreakVerticalDistance");
  objc_msgSend(v34, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v110[51] = v57;
  v109[52] = CFSTR("enableWeakCursor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings enableWeakCursor](self, "enableWeakCursor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v110[52] = v56;
  v109[53] = CFSTR("weakCursorVisibilityTimeout");
  v35 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings weakCursorVisibilityTimeout](self, "weakCursorVisibilityTimeout");
  objc_msgSend(v35, "numberWithDouble:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v110[53] = v55;
  v109[54] = CFSTR("strongCursorRestoreDelay");
  v36 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings strongCursorRestoreDelay](self, "strongCursorRestoreDelay");
  objc_msgSend(v36, "numberWithDouble:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v110[54] = v54;
  v109[55] = CFSTR("scratchOutMakesTheCursorStrong");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings scratchOutMakesTheCursorStrong](self, "scratchOutMakesTheCursorStrong"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v110[55] = v53;
  v109[56] = CFSTR("enableTargetedAppWorkarounds");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings enableTargetedAppWorkarounds](self, "enableTargetedAppWorkarounds"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v110[56] = v52;
  v109[57] = CFSTR("useSlidingCanvas");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings useSlidingCanvas](self, "useSlidingCanvas"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v110[57] = v37;
  v109[58] = CFSTR("slidingCanvasDebugBorder");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings slidingCanvasDebugBorder](self, "slidingCanvasDebugBorder"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v110[58] = v38;
  v109[59] = CFSTR("slidingCanvasWidth2");
  v39 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings slidingCanvasWidth](self, "slidingCanvasWidth");
  objc_msgSend(v39, "numberWithDouble:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v110[59] = v40;
  v109[60] = CFSTR("slidingCanvasHeight2");
  v41 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings slidingCanvasHeight](self, "slidingCanvasHeight");
  objc_msgSend(v41, "numberWithDouble:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v110[60] = v42;
  v109[61] = CFSTR("useSingleComponentCanvas");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings useSingleComponentCanvas](self, "useSingleComponentCanvas"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v110[61] = v43;
  v109[62] = CFSTR("useLargeHitTestArea");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings useLargeHitTestArea](self, "useLargeHitTestArea"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v110[62] = v44;
  v109[63] = CFSTR("strongCursorMaximumYDistance");
  v45 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings strongCursorMaximumYDistance](self, "strongCursorMaximumYDistance");
  objc_msgSend(v45, "numberWithDouble:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v110[63] = v46;
  v109[64] = CFSTR("useTransformStrokesAnimation2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKTextInputSettings useTransformStrokesAnimation](self, "useTransformStrokesAnimation"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v110[64] = v47;
  v109[65] = CFSTR("emojiConversionDelay");
  v48 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputSettings emojiConversionDelay](self, "emojiConversionDelay");
  objc_msgSend(v48, "numberWithDouble:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v110[65] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 66);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

- (void)loadSettingsFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
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
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;

  v137 = a3;
  if (v137)
  {
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("textInputViewHitTestSlackHorizontal"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("textInputViewHitTestSlackHorizontal"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doubleValue");
      -[PKTextInputSettings setTextInputViewHitTestSlackHorizontal:](self, "setTextInputViewHitTestSlackHorizontal:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("textInputViewHitTestSlackVertical"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("textInputViewHitTestSlackVertical"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      -[PKTextInputSettings setTextInputViewHitTestSlackVertical:](self, "setTextInputViewHitTestSlackVertical:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("firstResponderAttractionHorizontal"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("firstResponderAttractionHorizontal"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      -[PKTextInputSettings setFirstResponderAttractionHorizontal:](self, "setFirstResponderAttractionHorizontal:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("firstResponderAttractionVertical"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("firstResponderAttractionVertical"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      -[PKTextInputSettings setFirstResponderAttractionVertical:](self, "setFirstResponderAttractionVertical:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("minimumWritingSpaceWidth"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("minimumWritingSpaceWidth"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      -[PKTextInputSettings setMinimumWritingSpaceWidth:](self, "setMinimumWritingSpaceWidth:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("subwordGestureEndingSpeedRange"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("subwordGestureEndingSpeedRange"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      -[PKTextInputSettings setSubwordGestureEndingSpeedRange:](self, "setSubwordGestureEndingSpeedRange:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("subwordGestureSpeedThreshold"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("subwordGestureSpeedThreshold"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      -[PKTextInputSettings setSubwordGestureSpeedThreshold:](self, "setSubwordGestureSpeedThreshold:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("preventLeftoverCharsInSubwordGestures"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("preventLeftoverCharsInSubwordGestures"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setPreventLeftoverCharsInSubwordGestures:](self, "setPreventLeftoverCharsInSubwordGestures:", objc_msgSend(v19, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("interactionDisablingDelay"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("interactionDisablingDelay"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      -[PKTextInputSettings setInteractionDisablingDelay:](self, "setInteractionDisablingDelay:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("textInputStrokeFadeOutDelay"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("textInputStrokeFadeOutDelay"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      -[PKTextInputSettings setTextInputStrokeFadeOutDelay:](self, "setTextInputStrokeFadeOutDelay:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("textInputStrokeFadeOutDuration"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("textInputStrokeFadeOutDuration"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      -[PKTextInputSettings setTextInputStrokeFadeOutDuration:](self, "setTextInputStrokeFadeOutDuration:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("continuousRecognitionWritingInterval"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("continuousRecognitionWritingInterval"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      -[PKTextInputSettings setContinuousRecognitionWritingInterval:](self, "setContinuousRecognitionWritingInterval:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("continuousRecognition"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("continuousRecognition"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setContinuousRecognition:](self, "setContinuousRecognition:", objc_msgSend(v29, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("recognitionCoalescingDelay"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("recognitionCoalescingDelay"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      -[PKTextInputSettings setRecognitionCoalescingDelay:](self, "setRecognitionCoalescingDelay:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("outOfProcessRecognition"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("outOfProcessRecognition"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setOutOfProcessRecognition:](self, "setOutOfProcessRecognition:", objc_msgSend(v33, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("activePreviewEnabled"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("activePreviewEnabled"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setActivePreviewEnabled:](self, "setActivePreviewEnabled:", objc_msgSend(v35, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("styledActivePreview"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("styledActivePreview"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setStyledActivePreview:](self, "setStyledActivePreview:", objc_msgSend(v37, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("floatingBackgroundEnabled"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("floatingBackgroundEnabled"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setFloatingBackgroundEnabled:](self, "setFloatingBackgroundEnabled:", objc_msgSend(v39, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("textInputStandardCommitDelay"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("textInputStandardCommitDelay"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "doubleValue");
      -[PKTextInputSettings setTextInputStandardCommitDelay:](self, "setTextInputStandardCommitDelay:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("singleCharacterCommitDelay"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("singleCharacterCommitDelay"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "doubleValue");
      -[PKTextInputSettings setSingleCharacterCommitDelay:](self, "setSingleCharacterCommitDelay:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("incrementalCommitWordsBack"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("incrementalCommitWordsBack"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "doubleValue");
      -[PKTextInputSettings setIncrementalCommitWordsBack:](self, "setIncrementalCommitWordsBack:", (uint64_t)v46);

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("debugRecognitionRequestArtificialDelay"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("debugRecognitionRequestArtificialDelay"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "doubleValue");
      -[PKTextInputSettings setDebugRecognitionRequestArtificialDelay:](self, "setDebugRecognitionRequestArtificialDelay:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("debugElementFinderArtificialDelay"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("debugElementFinderArtificialDelay"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "doubleValue");
      -[PKTextInputSettings setDebugElementFinderArtificialDelay:](self, "setDebugElementFinderArtificialDelay:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("debugFirstResponderArtificialDelay"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("debugFirstResponderArtificialDelay"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "doubleValue");
      -[PKTextInputSettings setDebugFirstResponderArtificialDelay:](self, "setDebugFirstResponderArtificialDelay:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableOnNonEditableViews"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableOnNonEditableViews"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setEnableOnNonEditableViews:](self, "setEnableOnNonEditableViews:", objc_msgSend(v54, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableOnRemoteViews"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableOnRemoteViews"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setEnableOnRemoteViews:](self, "setEnableOnRemoteViews:", objc_msgSend(v56, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableViewControllerSupport"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableViewControllerSupport"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setEnableViewControllerSupport:](self, "setEnableViewControllerSupport:", objc_msgSend(v58, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("UCBPaletteEnabledNewKey"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("UCBPaletteEnabledNewKey"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setUCBPaletteEnabled:](self, "setUCBPaletteEnabled:", objc_msgSend(v60, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("alwaysIncludeReturnKeyAndInputAssistantItems"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("alwaysIncludeReturnKeyAndInputAssistantItems"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setAlwaysIncludeReturnKeyAndInputAssistantItems:](self, "setAlwaysIncludeReturnKeyAndInputAssistantItems:", objc_msgSend(v62, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent2"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent2"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setHideDefaultReturnKeyWhenSpecialReturnKeyIsPresent:](self, "setHideDefaultReturnKeyWhenSpecialReturnKeyIsPresent:", objc_msgSend(v64, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableReserveSpace"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableReserveSpace"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setEnableReserveSpace:](self, "setEnableReserveSpace:", objc_msgSend(v66, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableReserveSpaceTapForNewlines"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableReserveSpaceTapForNewlines"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setEnableReserveSpaceTapForNewlines:](self, "setEnableReserveSpaceTapForNewlines:", objc_msgSend(v68, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("asyncElementRequestTimeout"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("asyncElementRequestTimeout"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "doubleValue");
      -[PKTextInputSettings setAsyncElementRequestTimeout:](self, "setAsyncElementRequestTimeout:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureMinimumPanDistanceThreshold"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v71)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureMinimumPanDistanceThreshold"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "doubleValue");
      -[PKTextInputSettings setDrawingGestureMinimumPanDistanceThreshold:](self, "setDrawingGestureMinimumPanDistanceThreshold:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureMinimumScrollDistanceThreshold"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureMinimumScrollDistanceThreshold"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "doubleValue");
      -[PKTextInputSettings setDrawingGestureMinimumScrollDistanceThreshold:](self, "setDrawingGestureMinimumScrollDistanceThreshold:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureTapDetectionTimeInterval2"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v75)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureTapDetectionTimeInterval2"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "doubleValue");
      -[PKTextInputSettings setDrawingGestureTapDetectionTimeInterval:](self, "setDrawingGestureTapDetectionTimeInterval:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureTapDetectionDistanceThreshold3"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureTapDetectionDistanceThreshold3"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "doubleValue");
      -[PKTextInputSettings setDrawingGestureTapDetectionDistanceThreshold:](self, "setDrawingGestureTapDetectionDistanceThreshold:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (v79)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "doubleValue");
      -[PKTextInputSettings setDrawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance:](self, "setDrawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v81)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "doubleValue");
      -[PKTextInputSettings setDrawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance:](self, "setDrawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureLongPressMaxDistance"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (v83)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureLongPressMaxDistance"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "doubleValue");
      -[PKTextInputSettings setDrawingGestureLongPressMaxDistance:](self, "setDrawingGestureLongPressMaxDistance:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureLongPressDetectionTimeInterval"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("drawingGestureLongPressDetectionTimeInterval"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "doubleValue");
      -[PKTextInputSettings setDrawingGestureLongPressDetectionTimeInterval:](self, "setDrawingGestureLongPressDetectionTimeInterval:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("inkWeight"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    if (v87)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("inkWeight"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "doubleValue");
      -[PKTextInputSettings setInkWeight:](self, "setInkWeight:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("inkWeightForIncreasedContrast"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (v89)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("inkWeightForIncreasedContrast"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "doubleValue");
      -[PKTextInputSettings setInkWeightForIncreasedContrast:](self, "setInkWeightForIncreasedContrast:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("lineBreakOnTapEnabled"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    if (v91)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("lineBreakOnTapEnabled"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setLineBreakOnTapEnabled:](self, "setLineBreakOnTapEnabled:", objc_msgSend(v92, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("lineBreakVerticalBarGestureEnabled"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v93)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("lineBreakVerticalBarGestureEnabled"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setLineBreakVerticalBarGestureEnabled:](self, "setLineBreakVerticalBarGestureEnabled:", objc_msgSend(v94, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("lineBreakVerticalBarUpToDelete"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    if (v95)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("lineBreakVerticalBarUpToDelete"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setLineBreakVerticalBarUpToDelete:](self, "setLineBreakVerticalBarUpToDelete:", objc_msgSend(v96, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("autoLineBreakEnabled2"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (v97)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("autoLineBreakEnabled2"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setAutoLineBreakEnabled:](self, "setAutoLineBreakEnabled:", objc_msgSend(v98, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("autoLineBreakRequireWeakCursor2"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (v99)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("autoLineBreakRequireWeakCursor2"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setAutoLineBreakRequireWeakCursor:](self, "setAutoLineBreakRequireWeakCursor:", objc_msgSend(v100, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("autoLineBreakVerticalDistance2"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (v101)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("autoLineBreakVerticalDistance2"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "doubleValue");
      -[PKTextInputSettings setAutoLineBreakVerticalDistance:](self, "setAutoLineBreakVerticalDistance:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("autoLineBreakDualVerticalDistance2"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (v103)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("autoLineBreakDualVerticalDistance2"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "doubleValue");
      -[PKTextInputSettings setAutoLineBreakDualVerticalDistance:](self, "setAutoLineBreakDualVerticalDistance:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("autoLineBreakAreaWidthFactor3"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    if (v105)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("autoLineBreakAreaWidthFactor3"));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "doubleValue");
      -[PKTextInputSettings setAutoLineBreakAreaWidthFactor:](self, "setAutoLineBreakAreaWidthFactor:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("tapToLineBreakVerticalDistance2"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    if (v107)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("tapToLineBreakVerticalDistance2"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "doubleValue");
      -[PKTextInputSettings setTapToLineBreakVerticalDistance:](self, "setTapToLineBreakVerticalDistance:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableWeakCursor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    if (v109)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableWeakCursor"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setEnableWeakCursor:](self, "setEnableWeakCursor:", objc_msgSend(v110, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("weakCursorVisibilityTimeout"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    if (v111)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("weakCursorVisibilityTimeout"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "doubleValue");
      -[PKTextInputSettings setWeakCursorVisibilityTimeout:](self, "setWeakCursorVisibilityTimeout:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("strongCursorRestoreDelay"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    if (v113)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("strongCursorRestoreDelay"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "doubleValue");
      -[PKTextInputSettings setStrongCursorRestoreDelay:](self, "setStrongCursorRestoreDelay:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("scratchOutMakesTheCursorStrong"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    if (v115)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("scratchOutMakesTheCursorStrong"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setScratchOutMakesTheCursorStrong:](self, "setScratchOutMakesTheCursorStrong:", objc_msgSend(v116, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableTargetedAppWorkarounds"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    if (v117)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("enableTargetedAppWorkarounds"));
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setEnableTargetedAppWorkarounds:](self, "setEnableTargetedAppWorkarounds:", objc_msgSend(v118, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("useSlidingCanvas"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    if (v119)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("useSlidingCanvas"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setUseSlidingCanvas:](self, "setUseSlidingCanvas:", objc_msgSend(v120, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("slidingCanvasDebugBorder"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    if (v121)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("slidingCanvasDebugBorder"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setSlidingCanvasDebugBorder:](self, "setSlidingCanvasDebugBorder:", objc_msgSend(v122, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("slidingCanvasWidth2"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    if (v123)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("slidingCanvasWidth2"));
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "doubleValue");
      -[PKTextInputSettings setSlidingCanvasWidth:](self, "setSlidingCanvasWidth:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("slidingCanvasHeight2"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();

    if (v125)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("slidingCanvasHeight2"));
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "doubleValue");
      -[PKTextInputSettings setSlidingCanvasHeight:](self, "setSlidingCanvasHeight:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("useSingleComponentCanvas"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    if (v127)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("useSingleComponentCanvas"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setUseSingleComponentCanvas:](self, "setUseSingleComponentCanvas:", objc_msgSend(v128, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("useLargeHitTestArea"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    if (v129)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("useLargeHitTestArea"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setUseLargeHitTestArea:](self, "setUseLargeHitTestArea:", objc_msgSend(v130, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("strongCursorMaximumYDistance"));
    v131 = (void *)objc_claimAutoreleasedReturnValue();

    if (v131)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("strongCursorMaximumYDistance"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "doubleValue");
      -[PKTextInputSettings setStrongCursorMaximumYDistance:](self, "setStrongCursorMaximumYDistance:");

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("useTransformStrokesAnimation2"));
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    if (v133)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("useTransformStrokesAnimation2"));
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputSettings setUseTransformStrokesAnimation:](self, "setUseTransformStrokesAnimation:", objc_msgSend(v134, "BOOLValue"));

    }
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("emojiConversionDelay"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    if (v135)
    {
      objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("emojiConversionDelay"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "doubleValue");
      -[PKTextInputSettings setEmojiConversionDelay:](self, "setEmojiConversionDelay:");

    }
  }

}

- (void)loadSettingsFromUserDefaults
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryForKey:", CFSTR("com.apple.PencilKit.TextInputDefaults"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[PKTextInputSettings loadSettingsFromDictionary:](self, "loadSettingsFromDictionary:", v4);
}

- (void)saveSettingsToUserDefaults
{
  void *v3;
  id v4;

  if (-[PKTextInputSettings _shouldSaveSettings](self, "_shouldSaveSettings"))
  {
    -[PKTextInputSettings settingsDictionaryRepresentation](self, "settingsDictionaryRepresentation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:inDomain:", v4, CFSTR("com.apple.PencilKit.TextInputDefaults"), *MEMORY[0x1E0CB2B58]);

  }
}

- (void)resetToDefaultValues
{
  id v3;

  -[PKTextInputSettings _loadDefaultValues](self, "_loadDefaultValues");
  if (-[PKTextInputSettings _shouldSaveSettings](self, "_shouldSaveSettings"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:inDomain:", 0, CFSTR("com.apple.PencilKit.TextInputDefaults"), *MEMORY[0x1E0CB2B58]);

  }
}

- (id)availableRecognitionLocaleIdentifiers
{
  return +[PKTextInputLanguageSelectionController supportedAndEnabledLocaleIdentifiers](PKTextInputLanguageSelectionController, "supportedAndEnabledLocaleIdentifiers");
}

- (BOOL)supportedKeyboardLocaleExists
{
  return +[PKTextInputLanguageSelectionController hasSomeSupportedAndEnabledLocale](PKTextInputLanguageSelectionController, "hasSomeSupportedAndEnabledLocale");
}

- (NSString)recognitionLocaleIdentifier
{
  void *v2;
  void *v3;

  -[PKTextInputSettings recognitionLocaleIdentifiers](self, "recognitionLocaleIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)recognitionLocaleIdentifiers
{
  void *v2;
  void *v3;

  if (-[PKTextInputSettings _isFeatureAvailableAndEnabled](self, "_isFeatureAvailableAndEnabled"))
  {
    +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentLanguageIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)_loadDefaultValues
{
  -[PKTextInputSettings setTextInputViewHitTestSlackHorizontal:](self, "setTextInputViewHitTestSlackHorizontal:", 10.0);
  -[PKTextInputSettings setTextInputViewHitTestSlackVertical:](self, "setTextInputViewHitTestSlackVertical:", 30.0);
  -[PKTextInputSettings setFirstResponderAttractionHorizontal:](self, "setFirstResponderAttractionHorizontal:", 30.0);
  -[PKTextInputSettings setFirstResponderAttractionVertical:](self, "setFirstResponderAttractionVertical:", 60.0);
  -[PKTextInputSettings setMinimumWritingSpaceWidth:](self, "setMinimumWritingSpaceWidth:", 60.0);
  -[PKTextInputSettings setSubwordGestureEndingSpeedRange:](self, "setSubwordGestureEndingSpeedRange:", 0.8);
  -[PKTextInputSettings setSubwordGestureSpeedThreshold:](self, "setSubwordGestureSpeedThreshold:", 50.0);
  -[PKTextInputSettings setPreventLeftoverCharsInSubwordGestures:](self, "setPreventLeftoverCharsInSubwordGestures:", 0);
  -[PKTextInputSettings setInteractionDisablingDelay:](self, "setInteractionDisablingDelay:", 15.0);
  -[PKTextInputSettings setOutOfProcessRecognition:](self, "setOutOfProcessRecognition:", 1);
  -[PKTextInputSettings setTextInputStrokeFadeOutDuration:](self, "setTextInputStrokeFadeOutDuration:", 0.3);
  -[PKTextInputSettings setTextInputStrokeFadeOutDelay:](self, "setTextInputStrokeFadeOutDelay:", 0.0);
  -[PKTextInputSettings setContinuousRecognition:](self, "setContinuousRecognition:", 1);
  -[PKTextInputSettings setContinuousRecognitionWritingInterval:](self, "setContinuousRecognitionWritingInterval:", 1.0);
  -[PKTextInputSettings setRecognitionCoalescingDelay:](self, "setRecognitionCoalescingDelay:", 0.3);
  -[PKTextInputSettings setActivePreviewEnabled:](self, "setActivePreviewEnabled:", 0);
  -[PKTextInputSettings setStyledActivePreview:](self, "setStyledActivePreview:", 0);
  -[PKTextInputSettings setFloatingBackgroundEnabled:](self, "setFloatingBackgroundEnabled:", 0);
  -[PKTextInputSettings setTextInputStandardCommitDelay:](self, "setTextInputStandardCommitDelay:", 0.7);
  -[PKTextInputSettings setSingleCharacterCommitDelay:](self, "setSingleCharacterCommitDelay:", 0.5);
  -[PKTextInputSettings setIncrementalCommitWordsBack:](self, "setIncrementalCommitWordsBack:", 1);
  -[PKTextInputSettings setDebugRecognitionRequestArtificialDelay:](self, "setDebugRecognitionRequestArtificialDelay:", 0.0);
  -[PKTextInputSettings setDebugElementFinderArtificialDelay:](self, "setDebugElementFinderArtificialDelay:", 0.0);
  -[PKTextInputSettings setDebugFirstResponderArtificialDelay:](self, "setDebugFirstResponderArtificialDelay:", 0.0);
  -[PKTextInputSettings setEnableOnNonEditableViews:](self, "setEnableOnNonEditableViews:", 0);
  -[PKTextInputSettings setEnableOnRemoteViews:](self, "setEnableOnRemoteViews:", 1);
  -[PKTextInputSettings setEnableViewControllerSupport:](self, "setEnableViewControllerSupport:", 0);
  -[PKTextInputSettings setEnableReserveSpace:](self, "setEnableReserveSpace:", 1);
  -[PKTextInputSettings setEnableReserveSpaceTapForNewlines:](self, "setEnableReserveSpaceTapForNewlines:", 0);
  -[PKTextInputSettings setUCBPaletteEnabled:](self, "setUCBPaletteEnabled:", 1);
  -[PKTextInputSettings setAlwaysIncludeReturnKeyAndInputAssistantItems:](self, "setAlwaysIncludeReturnKeyAndInputAssistantItems:", 0);
  -[PKTextInputSettings setHideDefaultReturnKeyWhenSpecialReturnKeyIsPresent:](self, "setHideDefaultReturnKeyWhenSpecialReturnKeyIsPresent:", 1);
  -[PKTextInputSettings setAsyncElementRequestTimeout:](self, "setAsyncElementRequestTimeout:", 0.5);
  -[PKTextInputSettings setDrawingGestureMinimumPanDistanceThreshold:](self, "setDrawingGestureMinimumPanDistanceThreshold:", 16.0);
  -[PKTextInputSettings setDrawingGestureMinimumScrollDistanceThreshold:](self, "setDrawingGestureMinimumScrollDistanceThreshold:", 80.0);
  -[PKTextInputSettings setDrawingGestureTapDetectionTimeInterval:](self, "setDrawingGestureTapDetectionTimeInterval:", 0.15);
  -[PKTextInputSettings setDrawingGestureTapDetectionDistanceThreshold:](self, "setDrawingGestureTapDetectionDistanceThreshold:", 5.25);
  -[PKTextInputSettings setDrawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance:](self, "setDrawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance:", 60.0);
  -[PKTextInputSettings setDrawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance:](self, "setDrawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance:", 20.0);
  -[PKTextInputSettings setDrawingGestureLongPressMaxDistance:](self, "setDrawingGestureLongPressMaxDistance:", 4.0);
  -[PKTextInputSettings setDrawingGestureLongPressDetectionTimeInterval:](self, "setDrawingGestureLongPressDetectionTimeInterval:", 0.5);
  -[PKTextInputSettings setInkWeight:](self, "setInkWeight:", -0.6);
  -[PKTextInputSettings setInkWeightForIncreasedContrast:](self, "setInkWeightForIncreasedContrast:", -0.4);
  -[PKTextInputSettings setLineBreakOnTapEnabled:](self, "setLineBreakOnTapEnabled:", 1);
  -[PKTextInputSettings setLineBreakVerticalBarGestureEnabled:](self, "setLineBreakVerticalBarGestureEnabled:", 0);
  -[PKTextInputSettings setLineBreakVerticalBarUpToDelete:](self, "setLineBreakVerticalBarUpToDelete:", 1);
  -[PKTextInputSettings setAutoLineBreakEnabled:](self, "setAutoLineBreakEnabled:", 1);
  -[PKTextInputSettings setAutoLineBreakRequireWeakCursor:](self, "setAutoLineBreakRequireWeakCursor:", 0);
  -[PKTextInputSettings setAutoLineBreakVerticalDistance:](self, "setAutoLineBreakVerticalDistance:", 120.0);
  -[PKTextInputSettings setAutoLineBreakDualVerticalDistance:](self, "setAutoLineBreakDualVerticalDistance:", 120.0);
  -[PKTextInputSettings setAutoLineBreakAreaWidthFactor:](self, "setAutoLineBreakAreaWidthFactor:", 0.1);
  -[PKTextInputSettings setTapToLineBreakVerticalDistance:](self, "setTapToLineBreakVerticalDistance:", 2.0);
  -[PKTextInputSettings setEnableWeakCursor:](self, "setEnableWeakCursor:", 1);
  -[PKTextInputSettings setWeakCursorVisibilityTimeout:](self, "setWeakCursorVisibilityTimeout:", 1.0);
  -[PKTextInputSettings setStrongCursorRestoreDelay:](self, "setStrongCursorRestoreDelay:", 1.0);
  -[PKTextInputSettings setScratchOutMakesTheCursorStrong:](self, "setScratchOutMakesTheCursorStrong:", 1);
  -[PKTextInputSettings setEnableTargetedAppWorkarounds:](self, "setEnableTargetedAppWorkarounds:", 1);
  -[PKTextInputSettings setUseSlidingCanvas:](self, "setUseSlidingCanvas:", 1);
  -[PKTextInputSettings setSlidingCanvasDebugBorder:](self, "setSlidingCanvasDebugBorder:", 0);
  -[PKTextInputSettings setSlidingCanvasWidth:](self, "setSlidingCanvasWidth:", 640.0);
  -[PKTextInputSettings setSlidingCanvasHeight:](self, "setSlidingCanvasHeight:", 400.0);
  -[PKTextInputSettings setUseSingleComponentCanvas:](self, "setUseSingleComponentCanvas:", 1);
  -[PKTextInputSettings setUseLargeHitTestArea:](self, "setUseLargeHitTestArea:", 0);
  -[PKTextInputSettings setStrongCursorMaximumYDistance:](self, "setStrongCursorMaximumYDistance:", 120.0);
  -[PKTextInputSettings setUseTransformStrokesAnimation:](self, "setUseTransformStrokesAnimation:", 1);
  -[PKTextInputSettings setEmojiConversionDelay:](self, "setEmojiConversionDelay:", 1.0);
}

- (void)_scheduleSavingSettingsSoon
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__scheduledSaveSettingsTriggered, 0);
  -[PKTextInputSettings performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__scheduledSaveSettingsTriggered, 0, 0.1);
}

- (double)textInputViewHitTestSlackHorizontal
{
  return self->_textInputViewHitTestSlackHorizontal;
}

- (void)setTextInputViewHitTestSlackHorizontal:(double)a3
{
  self->_textInputViewHitTestSlackHorizontal = a3;
}

- (double)textInputViewHitTestSlackVertical
{
  return self->_textInputViewHitTestSlackVertical;
}

- (void)setTextInputViewHitTestSlackVertical:(double)a3
{
  self->_textInputViewHitTestSlackVertical = a3;
}

- (double)firstResponderAttractionHorizontal
{
  return self->_firstResponderAttractionHorizontal;
}

- (void)setFirstResponderAttractionHorizontal:(double)a3
{
  self->_firstResponderAttractionHorizontal = a3;
}

- (double)firstResponderAttractionVertical
{
  return self->_firstResponderAttractionVertical;
}

- (void)setFirstResponderAttractionVertical:(double)a3
{
  self->_firstResponderAttractionVertical = a3;
}

- (double)subwordGestureEndingSpeedRange
{
  return self->_subwordGestureEndingSpeedRange;
}

- (void)setSubwordGestureEndingSpeedRange:(double)a3
{
  self->_subwordGestureEndingSpeedRange = a3;
}

- (double)subwordGestureSpeedThreshold
{
  return self->_subwordGestureSpeedThreshold;
}

- (void)setSubwordGestureSpeedThreshold:(double)a3
{
  self->_subwordGestureSpeedThreshold = a3;
}

- (BOOL)preventLeftoverCharsInSubwordGestures
{
  return self->_preventLeftoverCharsInSubwordGestures;
}

- (void)setPreventLeftoverCharsInSubwordGestures:(BOOL)a3
{
  self->_preventLeftoverCharsInSubwordGestures = a3;
}

- (double)minimumWritingSpaceWidth
{
  return self->_minimumWritingSpaceWidth;
}

- (void)setMinimumWritingSpaceWidth:(double)a3
{
  self->_minimumWritingSpaceWidth = a3;
}

- (double)interactionDisablingDelay
{
  return self->_interactionDisablingDelay;
}

- (void)setInteractionDisablingDelay:(double)a3
{
  self->_interactionDisablingDelay = a3;
}

- (double)textInputStrokeFadeOutDelay
{
  return self->_textInputStrokeFadeOutDelay;
}

- (void)setTextInputStrokeFadeOutDelay:(double)a3
{
  self->_textInputStrokeFadeOutDelay = a3;
}

- (double)textInputStrokeFadeOutDuration
{
  return self->_textInputStrokeFadeOutDuration;
}

- (void)setTextInputStrokeFadeOutDuration:(double)a3
{
  self->_textInputStrokeFadeOutDuration = a3;
}

- (BOOL)activePreviewEnabled
{
  return self->_activePreviewEnabled;
}

- (void)setActivePreviewEnabled:(BOOL)a3
{
  self->_activePreviewEnabled = a3;
}

- (BOOL)styledActivePreview
{
  return self->_styledActivePreview;
}

- (void)setStyledActivePreview:(BOOL)a3
{
  self->_styledActivePreview = a3;
}

- (BOOL)floatingBackgroundEnabled
{
  return self->_floatingBackgroundEnabled;
}

- (void)setFloatingBackgroundEnabled:(BOOL)a3
{
  self->_floatingBackgroundEnabled = a3;
}

- (double)textInputStandardCommitDelay
{
  return self->_textInputStandardCommitDelay;
}

- (void)setTextInputStandardCommitDelay:(double)a3
{
  self->_textInputStandardCommitDelay = a3;
}

- (double)singleCharacterCommitDelay
{
  return self->_singleCharacterCommitDelay;
}

- (void)setSingleCharacterCommitDelay:(double)a3
{
  self->_singleCharacterCommitDelay = a3;
}

- (int64_t)incrementalCommitWordsBack
{
  return self->_incrementalCommitWordsBack;
}

- (void)setIncrementalCommitWordsBack:(int64_t)a3
{
  self->_incrementalCommitWordsBack = a3;
}

- (BOOL)continuousRecognition
{
  return self->_continuousRecognition;
}

- (void)setContinuousRecognition:(BOOL)a3
{
  self->_continuousRecognition = a3;
}

- (double)continuousRecognitionWritingInterval
{
  return self->_continuousRecognitionWritingInterval;
}

- (void)setContinuousRecognitionWritingInterval:(double)a3
{
  self->_continuousRecognitionWritingInterval = a3;
}

- (double)recognitionCoalescingDelay
{
  return self->_recognitionCoalescingDelay;
}

- (void)setRecognitionCoalescingDelay:(double)a3
{
  self->_recognitionCoalescingDelay = a3;
}

- (BOOL)outOfProcessRecognition
{
  return self->_outOfProcessRecognition;
}

- (void)setOutOfProcessRecognition:(BOOL)a3
{
  self->_outOfProcessRecognition = a3;
}

- (double)debugRecognitionRequestArtificialDelay
{
  return self->_debugRecognitionRequestArtificialDelay;
}

- (void)setDebugRecognitionRequestArtificialDelay:(double)a3
{
  self->_debugRecognitionRequestArtificialDelay = a3;
}

- (double)debugElementFinderArtificialDelay
{
  return self->_debugElementFinderArtificialDelay;
}

- (void)setDebugElementFinderArtificialDelay:(double)a3
{
  self->_debugElementFinderArtificialDelay = a3;
}

- (double)debugFirstResponderArtificialDelay
{
  return self->_debugFirstResponderArtificialDelay;
}

- (void)setDebugFirstResponderArtificialDelay:(double)a3
{
  self->_debugFirstResponderArtificialDelay = a3;
}

- (BOOL)enableOnNonEditableViews
{
  return self->_enableOnNonEditableViews;
}

- (void)setEnableOnNonEditableViews:(BOOL)a3
{
  self->_enableOnNonEditableViews = a3;
}

- (BOOL)enableOnRemoteViews
{
  return self->_enableOnRemoteViews;
}

- (void)setEnableOnRemoteViews:(BOOL)a3
{
  self->_enableOnRemoteViews = a3;
}

- (BOOL)enableViewControllerSupport
{
  return self->_enableViewControllerSupport;
}

- (void)setEnableViewControllerSupport:(BOOL)a3
{
  self->_enableViewControllerSupport = a3;
}

- (BOOL)enableReserveSpace
{
  return self->_enableReserveSpace;
}

- (void)setEnableReserveSpace:(BOOL)a3
{
  self->_enableReserveSpace = a3;
}

- (BOOL)enableReserveSpaceTapForNewlines
{
  return self->_enableReserveSpaceTapForNewlines;
}

- (void)setEnableReserveSpaceTapForNewlines:(BOOL)a3
{
  self->_enableReserveSpaceTapForNewlines = a3;
}

- (BOOL)UCBPaletteEnabled
{
  return self->_UCBPaletteEnabled;
}

- (void)setUCBPaletteEnabled:(BOOL)a3
{
  self->_UCBPaletteEnabled = a3;
}

- (BOOL)alwaysIncludeReturnKeyAndInputAssistantItems
{
  return self->_alwaysIncludeReturnKeyAndInputAssistantItems;
}

- (void)setAlwaysIncludeReturnKeyAndInputAssistantItems:(BOOL)a3
{
  self->_alwaysIncludeReturnKeyAndInputAssistantItems = a3;
}

- (BOOL)hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent
{
  return self->_hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent;
}

- (void)setHideDefaultReturnKeyWhenSpecialReturnKeyIsPresent:(BOOL)a3
{
  self->_hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent = a3;
}

- (double)drawingGestureMinimumPanDistanceThreshold
{
  return self->_drawingGestureMinimumPanDistanceThreshold;
}

- (void)setDrawingGestureMinimumPanDistanceThreshold:(double)a3
{
  self->_drawingGestureMinimumPanDistanceThreshold = a3;
}

- (double)drawingGestureMinimumScrollDistanceThreshold
{
  return self->_drawingGestureMinimumScrollDistanceThreshold;
}

- (void)setDrawingGestureMinimumScrollDistanceThreshold:(double)a3
{
  self->_drawingGestureMinimumScrollDistanceThreshold = a3;
}

- (double)drawingGestureTapDetectionDistanceThreshold
{
  return self->_drawingGestureTapDetectionDistanceThreshold;
}

- (void)setDrawingGestureTapDetectionDistanceThreshold:(double)a3
{
  self->_drawingGestureTapDetectionDistanceThreshold = a3;
}

- (double)drawingGestureTapDetectionTimeInterval
{
  return self->_drawingGestureTapDetectionTimeInterval;
}

- (void)setDrawingGestureTapDetectionTimeInterval:(double)a3
{
  self->_drawingGestureTapDetectionTimeInterval = a3;
}

- (double)drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance
{
  return self->_drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance;
}

- (void)setDrawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance:(double)a3
{
  self->_drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance = a3;
}

- (double)drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance
{
  return self->_drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance;
}

- (void)setDrawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance:(double)a3
{
  self->_drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance = a3;
}

- (double)drawingGestureLongPressMaxDistance
{
  return self->_drawingGestureLongPressMaxDistance;
}

- (void)setDrawingGestureLongPressMaxDistance:(double)a3
{
  self->_drawingGestureLongPressMaxDistance = a3;
}

- (double)drawingGestureLongPressDetectionTimeInterval
{
  return self->_drawingGestureLongPressDetectionTimeInterval;
}

- (void)setDrawingGestureLongPressDetectionTimeInterval:(double)a3
{
  self->_drawingGestureLongPressDetectionTimeInterval = a3;
}

- (double)asyncElementRequestTimeout
{
  return self->_asyncElementRequestTimeout;
}

- (void)setAsyncElementRequestTimeout:(double)a3
{
  self->_asyncElementRequestTimeout = a3;
}

- (double)inkWeight
{
  return self->_inkWeight;
}

- (void)setInkWeight:(double)a3
{
  self->_inkWeight = a3;
}

- (double)inkWeightForIncreasedContrast
{
  return self->_inkWeightForIncreasedContrast;
}

- (void)setInkWeightForIncreasedContrast:(double)a3
{
  self->_inkWeightForIncreasedContrast = a3;
}

- (BOOL)lineBreakVerticalBarGestureEnabled
{
  return self->_lineBreakVerticalBarGestureEnabled;
}

- (void)setLineBreakVerticalBarGestureEnabled:(BOOL)a3
{
  self->_lineBreakVerticalBarGestureEnabled = a3;
}

- (BOOL)lineBreakVerticalBarUpToDelete
{
  return self->_lineBreakVerticalBarUpToDelete;
}

- (void)setLineBreakVerticalBarUpToDelete:(BOOL)a3
{
  self->_lineBreakVerticalBarUpToDelete = a3;
}

- (BOOL)autoLineBreakEnabled
{
  return self->_autoLineBreakEnabled;
}

- (void)setAutoLineBreakEnabled:(BOOL)a3
{
  self->_autoLineBreakEnabled = a3;
}

- (BOOL)autoLineBreakRequireWeakCursor
{
  return self->_autoLineBreakRequireWeakCursor;
}

- (void)setAutoLineBreakRequireWeakCursor:(BOOL)a3
{
  self->_autoLineBreakRequireWeakCursor = a3;
}

- (BOOL)lineBreakOnTapEnabled
{
  return self->_lineBreakOnTapEnabled;
}

- (void)setLineBreakOnTapEnabled:(BOOL)a3
{
  self->_lineBreakOnTapEnabled = a3;
}

- (double)autoLineBreakVerticalDistance
{
  return self->_autoLineBreakVerticalDistance;
}

- (void)setAutoLineBreakVerticalDistance:(double)a3
{
  self->_autoLineBreakVerticalDistance = a3;
}

- (double)autoLineBreakDualVerticalDistance
{
  return self->_autoLineBreakDualVerticalDistance;
}

- (void)setAutoLineBreakDualVerticalDistance:(double)a3
{
  self->_autoLineBreakDualVerticalDistance = a3;
}

- (double)autoLineBreakAreaWidthFactor
{
  return self->_autoLineBreakAreaWidthFactor;
}

- (void)setAutoLineBreakAreaWidthFactor:(double)a3
{
  self->_autoLineBreakAreaWidthFactor = a3;
}

- (double)tapToLineBreakVerticalDistance
{
  return self->_tapToLineBreakVerticalDistance;
}

- (void)setTapToLineBreakVerticalDistance:(double)a3
{
  self->_tapToLineBreakVerticalDistance = a3;
}

- (BOOL)enableWeakCursor
{
  return self->_enableWeakCursor;
}

- (void)setEnableWeakCursor:(BOOL)a3
{
  self->_enableWeakCursor = a3;
}

- (double)weakCursorVisibilityTimeout
{
  return self->_weakCursorVisibilityTimeout;
}

- (void)setWeakCursorVisibilityTimeout:(double)a3
{
  self->_weakCursorVisibilityTimeout = a3;
}

- (double)strongCursorRestoreDelay
{
  return self->_strongCursorRestoreDelay;
}

- (void)setStrongCursorRestoreDelay:(double)a3
{
  self->_strongCursorRestoreDelay = a3;
}

- (BOOL)scratchOutMakesTheCursorStrong
{
  return self->_scratchOutMakesTheCursorStrong;
}

- (void)setScratchOutMakesTheCursorStrong:(BOOL)a3
{
  self->_scratchOutMakesTheCursorStrong = a3;
}

- (BOOL)enableTargetedAppWorkarounds
{
  return self->_enableTargetedAppWorkarounds;
}

- (void)setEnableTargetedAppWorkarounds:(BOOL)a3
{
  self->_enableTargetedAppWorkarounds = a3;
}

- (BOOL)useLargeHitTestArea
{
  return self->_useLargeHitTestArea;
}

- (void)setUseLargeHitTestArea:(BOOL)a3
{
  self->_useLargeHitTestArea = a3;
}

- (double)strongCursorMaximumYDistance
{
  return self->_strongCursorMaximumYDistance;
}

- (void)setStrongCursorMaximumYDistance:(double)a3
{
  self->_strongCursorMaximumYDistance = a3;
}

- (BOOL)useSlidingCanvas
{
  return self->_useSlidingCanvas;
}

- (void)setUseSlidingCanvas:(BOOL)a3
{
  self->_useSlidingCanvas = a3;
}

- (BOOL)slidingCanvasDebugBorder
{
  return self->_slidingCanvasDebugBorder;
}

- (void)setSlidingCanvasDebugBorder:(BOOL)a3
{
  self->_slidingCanvasDebugBorder = a3;
}

- (double)slidingCanvasWidth
{
  return self->_slidingCanvasWidth;
}

- (void)setSlidingCanvasWidth:(double)a3
{
  self->_slidingCanvasWidth = a3;
}

- (double)slidingCanvasHeight
{
  return self->_slidingCanvasHeight;
}

- (void)setSlidingCanvasHeight:(double)a3
{
  self->_slidingCanvasHeight = a3;
}

- (BOOL)useSingleComponentCanvas
{
  return self->_useSingleComponentCanvas;
}

- (void)setUseSingleComponentCanvas:(BOOL)a3
{
  self->_useSingleComponentCanvas = a3;
}

- (BOOL)useTransformStrokesAnimation
{
  return self->_useTransformStrokesAnimation;
}

- (void)setUseTransformStrokesAnimation:(BOOL)a3
{
  self->_useTransformStrokesAnimation = a3;
}

- (BOOL)forceUserTextInputSettingEnabled
{
  return self->_forceUserTextInputSettingEnabled;
}

- (void)setForceUserTextInputSettingEnabled:(BOOL)a3
{
  self->_forceUserTextInputSettingEnabled = a3;
}

- (double)emojiConversionDelay
{
  return self->_emojiConversionDelay;
}

- (void)setEmojiConversionDelay:(double)a3
{
  self->_emojiConversionDelay = a3;
}

@end
