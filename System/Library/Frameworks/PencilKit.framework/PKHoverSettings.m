@implementation PKHoverSettings

uint64_t __43__PKHoverSettings_checkIfHoverIsSupported___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __43__PKHoverSettings_checkIfHoverIsSupported___block_invoke(uint64_t a1)
{
  BOOL v2;
  _QWORD v3[4];
  id v4;
  BOOL v5;

  v2 = PKMaxHoverHeight() > 0.0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__PKHoverSettings_checkIfHoverIsSupported___block_invoke_2;
  v3[3] = &unk_1E7778AC8;
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

+ (void)prewarmIfNecessary
{
  if (+[PKHoverSettings isHoverActive](PKHoverSettings, "isHoverActive"))
    +[PKSettingsDaemon prewarmServiceConnectionIfNeeded](PKSettingsDaemon, "prewarmServiceConnectionIfNeeded");
}

+ (BOOL)isHoverActive
{
  return (sForceHoverSupportedForTesting & 1) != 0 || PKMaxHoverHeight() > 0.0;
}

+ (void)checkIfHoverIsSupported:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PKHoverSettings_checkIfHoverIsSupported___block_invoke;
  block[3] = &unk_1E7777F58;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

+ (id)sharedSettings
{
  if (qword_1ECEE6520 != -1)
    dispatch_once(&qword_1ECEE6520, &__block_literal_global_82);
  return (id)_MergedGlobals_153;
}

void __33__PKHoverSettings_sharedSettings__block_invoke()
{
  PKHoverSettings *v0;
  void *v1;

  v0 = objc_alloc_init(PKHoverSettings);
  v1 = (void *)_MergedGlobals_153;
  _MergedGlobals_153 = (uint64_t)v0;

}

- (PKHoverSettings)init
{
  PKHoverSettings *v2;
  uint64_t v3;
  NSUserDefaults *pencilDefaults;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKHoverSettings;
  v2 = -[PKHoverSettings init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.PencilKit"));
    pencilDefaults = v2->_pencilDefaults;
    v2->_pencilDefaults = (NSUserDefaults *)v3;

    -[PKHoverSettings _loadDefaultValues](v2, "_loadDefaultValues");
    -[PKHoverSettings loadSettingsFromUserDefaults](v2, "loadSettingsFromUserDefaults");
    if (!-[PKHoverSettings _shouldSaveSettings](v2, "_shouldSaveSettings"))
    {
      -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_pencilDefaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("HoverDefaultsV14"), 1, &kKVOContext);
      v2->_didAddObserver = 1;
    }
    v2->_increasedContrastEnabled = UIAccessibilityDarkerSystemColorsEnabled();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__darkerSystemColorsStatusDidChange_, *MEMORY[0x1E0DC4508], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_didAddObserver)
    -[NSUserDefaults removeObserver:forKeyPath:context:](self->_pencilDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("HoverDefaultsV14"), kKVOContext);
  v4.receiver = self;
  v4.super_class = (Class)PKHoverSettings;
  -[PKHoverSettings dealloc](&v4, sel_dealloc);
}

+ (void)forceHoverSupported
{
  sForceHoverSupportedForTesting = 1;
}

- (void)_darkerSystemColorsStatusDidChange:(id)a3
{
  -[PKHoverSettings setIncreasedContrastEnabled:](self, "setIncreasedContrastEnabled:", UIAccessibilityDarkerSystemColorsEnabled());
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)kKVOContext == a6 && objc_msgSend(v10, "isEqualToString:", CFSTR("HoverDefaultsV14")))
  {
    -[PKHoverSettings loadSettingsFromUserDefaults](self, "loadSettingsFromUserDefaults");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PKHoverSettings;
    -[PKHoverSettings observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

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
  v5.super_class = (Class)PKHoverSettings;
  -[PKHoverSettings setValue:forKey:](&v5, sel_setValue_forKey_, a3, a4);
  if (-[PKHoverSettings _shouldSaveSettings](self, "_shouldSaveSettings"))
    -[PKHoverSettings _scheduleSavingSettingsSoon](self, "_scheduleSavingSettingsSoon");
}

+ (BOOL)isHoverEnabled
{
  uint64_t v2;
  __IOHIDEventSystemClient *v3;
  void *v4;
  const __CFArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isHoverActive") && (v2 = IOHIDEventSystemClientCreateWithType()) != 0)
  {
    v3 = (__IOHIDEventSystemClient *)v2;
    v18[0] = CFSTR("PrimaryUsagePage");
    v18[1] = CFSTR("PrimaryUsage");
    v19[0] = &unk_1E77EBF58;
    v19[1] = &unk_1E77EBF70;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDEventSystemClientSetMatching();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = IOHIDEventSystemClientCopyServices(v3);
    v6 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          v10 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((_QWORD *)&v13 + 1) + 8 * i), CFSTR("HoverDisabled"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = objc_msgSend(v10, "BOOLValue", (_QWORD)v13) ^ 1;

            goto LABEL_14;
          }

        }
        v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
    LOBYTE(v11) = 0;
LABEL_14:

    CFRelease(v3);
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

+ (BOOL)allowDoubleTapOnlyWithPencilHover
{
  int v2;
  uint64_t v3;
  __IOHIDEventSystemClient *v4;
  void *v5;
  const __CFArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "isHoverActive");
  if (v2)
  {
    v3 = IOHIDEventSystemClientCreateWithType();
    if (v3)
    {
      v4 = (__IOHIDEventSystemClient *)v3;
      v20[0] = CFSTR("PrimaryUsagePage");
      v20[1] = CFSTR("PrimaryUsage");
      v21[0] = &unk_1E77EBF88;
      v21[1] = &unk_1E77EBFA0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDEventSystemClientSetMatching();
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v6 = IOHIDEventSystemClientCopyServices(v4);
      v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v16;
        while (2)
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v16 != v9)
              objc_enumerationMutation(v6);
            v11 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((_QWORD *)&v15 + 1) + 8 * v10), CFSTR("GesturesOnlyWhileHoveringEnabled"));
            if (v11)
            {
              v13 = v11;
              v12 = objc_msgSend(v11, "BOOLValue", (_QWORD)v15);

              goto LABEL_13;
            }
            ++v10;
          }
          while (v8 != v10);
          v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v8)
            continue;
          break;
        }
      }
      v12 = 0;
LABEL_13:

      CFRelease(v4);
    }
    else
    {
      v12 = 0;
    }
    LOBYTE(v2) = v12 != 0;
  }
  return v2;
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
  _QWORD v86[54];
  _QWORD v87[56];

  v87[54] = *MEMORY[0x1E0C80C00];
  v86[0] = CFSTR("showDebugLayer");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings showDebugLayer](self, "showDebugLayer"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v85;
  v86[1] = CFSTR("supportTouchPad");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings supportTouchPad](self, "supportTouchPad"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v84;
  v86[2] = CFSTR("debugCursorType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKHoverSettings debugCursorType](self, "debugCursorType"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v83;
  v86[3] = CFSTR("tooltipsActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings tooltipsActive](self, "tooltipsActive"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v82;
  v86[4] = CFSTR("snapToShapeActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings snapToShapeActive](self, "snapToShapeActive"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v81;
  v86[5] = CFSTR("toolIndicatorActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings toolIndicatorActive](self, "toolIndicatorActive"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v87[5] = v80;
  v86[6] = CFSTR("toolShadowActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_toolShadowActive);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v87[6] = v79;
  v86[7] = CFSTR("toolShadowActiveOutsideNotes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings toolShadowActiveOutsideNotes](self, "toolShadowActiveOutsideNotes"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v87[7] = v78;
  v86[8] = CFSTR("toolShadowLocationWorkaround");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings toolShadowLocationWorkaround](self, "toolShadowLocationWorkaround"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v87[8] = v77;
  v86[9] = CFSTR("toolShadowActiveOnOldPencils");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings toolShadowActiveOnOldPencils](self, "toolShadowActiveOnOldPencils"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v87[9] = v76;
  v86[10] = CFSTR("toolShadowMaxOpacityNormal");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings toolShadowMaxOpacityNormal](self, "toolShadowMaxOpacityNormal");
  objc_msgSend(v3, "numberWithDouble:");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v87[10] = v75;
  v86[11] = CFSTR("toolShadowMaxOpacityForIncreasedContrast");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings toolShadowMaxOpacityForIncreasedContrast](self, "toolShadowMaxOpacityForIncreasedContrast");
  objc_msgSend(v4, "numberWithDouble:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v87[11] = v74;
  v86[12] = CFSTR("toolShadowMaxOpacityInDrawingCanvasNormal");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings toolShadowMaxOpacityInDrawingCanvasNormal](self, "toolShadowMaxOpacityInDrawingCanvasNormal");
  objc_msgSend(v5, "numberWithDouble:");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v87[12] = v73;
  v86[13] = CFSTR("toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast](self, "toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast");
  objc_msgSend(v6, "numberWithDouble:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v87[13] = v72;
  v86[14] = CFSTR("toolShadowMaxBlurRadius");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings toolShadowMaxBlurRadius](self, "toolShadowMaxBlurRadius");
  objc_msgSend(v7, "numberWithDouble:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v87[14] = v71;
  v86[15] = CFSTR("toolShadowFadeInDistance");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings toolShadowFadeInDistance](self, "toolShadowFadeInDistance");
  objc_msgSend(v8, "numberWithDouble:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v87[15] = v70;
  v86[16] = CFSTR("toolShadowMovementSpeedHideThreshold");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings toolShadowMovementSpeedHideThreshold](self, "toolShadowMovementSpeedHideThreshold");
  objc_msgSend(v9, "numberWithDouble:");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v87[16] = v69;
  v86[17] = CFSTR("toolPreviewShouldWaitForHoverAndHold");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings toolPreviewShouldWaitForHoverAndHold](self, "toolPreviewShouldWaitForHoverAndHold"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v87[17] = v68;
  v86[18] = CFSTR("toolSwitchIndicatorActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings toolSwitchIndicatorActive](self, "toolSwitchIndicatorActive"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v87[18] = v67;
  v86[19] = CFSTR("avoidSwitchingToolsOutsideHoverRange");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings avoidSwitchingToolsOutsideHoverRange](self, "avoidSwitchingToolsOutsideHoverRange"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v87[19] = v66;
  v86[20] = CFSTR("screenEdgeSizeInMillimeters");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings screenEdgeSizeInMillimeters](self, "screenEdgeSizeInMillimeters");
  objc_msgSend(v10, "numberWithDouble:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v87[20] = v65;
  v86[21] = CFSTR("maxZDistance");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings maxZDistance](self, "maxZDistance");
  objc_msgSend(v11, "numberWithDouble:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v87[21] = v64;
  v86[22] = CFSTR("erasePreviewAlphaFactor");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings erasePreviewAlphaFactor](self, "erasePreviewAlphaFactor");
  objc_msgSend(v12, "numberWithDouble:");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v87[22] = v63;
  v86[23] = CFSTR("toolPreviewMaxZDistance");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings toolPreviewMaxZDistance](self, "toolPreviewMaxZDistance");
  objc_msgSend(v13, "numberWithDouble:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v87[23] = v62;
  v86[24] = CFSTR("toolPreviewFadeOutDistance");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings toolPreviewFadeOutDistance](self, "toolPreviewFadeOutDistance");
  objc_msgSend(v14, "numberWithDouble:");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v87[24] = v61;
  v86[25] = CFSTR("toolPreviewAzimuthTiltMaxZDistance");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings toolPreviewAzimuthTiltMaxZDistance](self, "toolPreviewAzimuthTiltMaxZDistance");
  objc_msgSend(v15, "numberWithDouble:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v87[25] = v60;
  v86[26] = CFSTR("deactivateExtraDistance");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings deactivateExtraDistance](self, "deactivateExtraDistance");
  objc_msgSend(v16, "numberWithDouble:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v87[26] = v59;
  v86[27] = CFSTR("predictionTimeInterval");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings predictionTimeInterval](self, "predictionTimeInterval");
  objc_msgSend(v17, "numberWithDouble:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v87[27] = v58;
  v86[28] = CFSTR("extraHoverPreviewDelay");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings extraHoverPreviewDelay](self, "extraHoverPreviewDelay");
  objc_msgSend(v18, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v87[28] = v57;
  v86[29] = CFSTR("inactivityTimeInterval");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings inactivityTimeInterval](self, "inactivityTimeInterval");
  objc_msgSend(v19, "numberWithDouble:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v87[29] = v56;
  v86[30] = CFSTR("hoverAndHoldTriggerTimeInterval");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings hoverAndHoldTriggerTimeInterval](self, "hoverAndHoldTriggerTimeInterval");
  objc_msgSend(v20, "numberWithDouble:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v87[30] = v55;
  v86[31] = CFSTR("hoverAndHoldActionTimeInterval");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings hoverAndHoldActionTimeInterval](self, "hoverAndHoldActionTimeInterval");
  objc_msgSend(v21, "numberWithDouble:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v87[31] = v54;
  v86[32] = CFSTR("numFramesExtraLatency");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKHoverSettings numFramesExtraLatency](self, "numFramesExtraLatency"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v87[32] = v53;
  v86[33] = CFSTR("numFramesReduceFramerate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PKHoverSettings numFramesReduceFramerate](self, "numFramesReduceFramerate"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v87[33] = v52;
  v86[34] = CFSTR("weightedAverageAltitudeFactor");
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings weightedAverageAltitudeFactor](self, "weightedAverageAltitudeFactor");
  objc_msgSend(v22, "numberWithDouble:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v87[34] = v51;
  v86[35] = CFSTR("weightedAverageAzimuthFactor");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings weightedAverageAzimuthFactor](self, "weightedAverageAzimuthFactor");
  objc_msgSend(v23, "numberWithDouble:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v87[35] = v50;
  v86[36] = CFSTR("weightedAverageLocationFactor");
  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings weightedAverageLocationFactor](self, "weightedAverageLocationFactor");
  objc_msgSend(v24, "numberWithDouble:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v87[36] = v49;
  v86[37] = CFSTR("scribbleFocusActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings scribbleFocusActive](self, "scribbleFocusActive"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v87[37] = v48;
  v86[38] = CFSTR("scribbleFlashCursorActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings scribbleFlashCursorActive](self, "scribbleFlashCursorActive"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v87[38] = v47;
  v86[39] = CFSTR("scribbleShowWritableElementsActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings scribbleShowWritableElementsActive](self, "scribbleShowWritableElementsActive"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v87[39] = v46;
  v86[40] = CFSTR("scribbleHoverStrongActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings scribbleHoverStrongActive](self, "scribbleHoverStrongActive"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v87[40] = v45;
  v86[41] = CFSTR("scribbleCommitOnLift");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings scribbleCommitOnLift](self, "scribbleCommitOnLift"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v87[41] = v44;
  v86[42] = CFSTR("scribbleLineBreakHandling");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings scribbleLineBreakHandling](self, "scribbleLineBreakHandling"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v87[42] = v43;
  v86[43] = CFSTR("scribbleLineBreakMultiLineDelay");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings scribbleLineBreakMultiLineDelay](self, "scribbleLineBreakMultiLineDelay");
  objc_msgSend(v25, "numberWithDouble:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v87[43] = v42;
  v86[44] = CFSTR("scribbleLineBreakMultiLineEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings scribbleLineBreakMultiLineEnabled](self, "scribbleLineBreakMultiLineEnabled"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v87[44] = v41;
  v86[45] = CFSTR("scribbleLineBreakMultiLineMaxLines");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PKHoverSettings scribbleLineBreakMultiLineMaxLines](self, "scribbleLineBreakMultiLineMaxLines"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v87[45] = v26;
  v86[46] = CFSTR("scribbleIBeamActive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings scribbleIBeamActive](self, "scribbleIBeamActive"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v87[46] = v27;
  v86[47] = CFSTR("noiseIsHeightBased");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKHoverSettings noiseIsHeightBased](self, "noiseIsHeightBased"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v87[47] = v28;
  v86[48] = CFSTR("azimuthJitterNoise");
  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings azimuthJitterNoise](self, "azimuthJitterNoise");
  objc_msgSend(v29, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v87[48] = v30;
  v86[49] = CFSTR("altitudeJitterNoise");
  v31 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings altitudeJitterNoise](self, "altitudeJitterNoise");
  objc_msgSend(v31, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v87[49] = v32;
  v86[50] = CFSTR("azimuthOffsetNoise");
  v33 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings azimuthOffsetNoise](self, "azimuthOffsetNoise");
  objc_msgSend(v33, "numberWithDouble:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v87[50] = v34;
  v86[51] = CFSTR("altitudeOffsetNoise");
  v35 = (void *)MEMORY[0x1E0CB37E8];
  -[PKHoverSettings altitudeOffsetNoise](self, "altitudeOffsetNoise");
  objc_msgSend(v35, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v87[51] = v36;
  v86[52] = CFSTR("azimuthBuckets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PKHoverSettings azimuthBuckets](self, "azimuthBuckets"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v87[52] = v37;
  v86[53] = CFSTR("altitudeBuckets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PKHoverSettings altitudeBuckets](self, "altitudeBuckets"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v87[53] = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 54);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
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
  void *v46;
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
  id v112;

  v112 = a3;
  if (v112)
  {
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("showDebugLayer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("showDebugLayer"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setShowDebugLayer:](self, "setShowDebugLayer:", objc_msgSend(v5, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("supportTouchPad"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("supportTouchPad"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setSupportTouchPad:](self, "setSupportTouchPad:", objc_msgSend(v7, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("debugCursorType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("debugCursorType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setDebugCursorType:](self, "setDebugCursorType:", objc_msgSend(v9, "integerValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("tooltipsActive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("tooltipsActive"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setTooltipsActive:](self, "setTooltipsActive:", objc_msgSend(v11, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("snapToShapeActive"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("snapToShapeActive"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setSnapToShapeActive:](self, "setSnapToShapeActive:", objc_msgSend(v13, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolIndicatorActive"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolIndicatorActive"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setToolIndicatorActive:](self, "setToolIndicatorActive:", objc_msgSend(v15, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowActive"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowActive"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setToolShadowActive:](self, "setToolShadowActive:", objc_msgSend(v17, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowActiveOutsideNotes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowActiveOutsideNotes"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setToolShadowActiveOutsideNotes:](self, "setToolShadowActiveOutsideNotes:", objc_msgSend(v19, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowLocationWorkaround"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowLocationWorkaround"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setToolShadowLocationWorkaround:](self, "setToolShadowLocationWorkaround:", objc_msgSend(v21, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowActiveOnOldPencils"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowActiveOnOldPencils"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setToolShadowActiveOnOldPencils:](self, "setToolShadowActiveOnOldPencils:", objc_msgSend(v23, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowMaxOpacityNormal"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowMaxOpacityNormal"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      -[PKHoverSettings setToolShadowMaxOpacityNormal:](self, "setToolShadowMaxOpacityNormal:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowMaxOpacityForIncreasedContrast"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowMaxOpacityForIncreasedContrast"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      -[PKHoverSettings setToolShadowMaxOpacityForIncreasedContrast:](self, "setToolShadowMaxOpacityForIncreasedContrast:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowMaxOpacityInDrawingCanvasNormal"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowMaxOpacityInDrawingCanvasNormal"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      -[PKHoverSettings setToolShadowMaxOpacityInDrawingCanvasNormal:](self, "setToolShadowMaxOpacityInDrawingCanvasNormal:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      -[PKHoverSettings setToolShadowMaxOpacityInDrawingCanvasForIncreasedContrast:](self, "setToolShadowMaxOpacityInDrawingCanvasForIncreasedContrast:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowFadeInDistance"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowFadeInDistance"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "doubleValue");
      -[PKHoverSettings setToolShadowFadeInDistance:](self, "setToolShadowFadeInDistance:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowMaxBlurRadius"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowMaxBlurRadius"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "doubleValue");
      -[PKHoverSettings setToolShadowMaxBlurRadius:](self, "setToolShadowMaxBlurRadius:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowMovementSpeedHideThreshold"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolShadowMovementSpeedHideThreshold"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      -[PKHoverSettings setToolShadowMovementSpeedHideThreshold:](self, "setToolShadowMovementSpeedHideThreshold:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolPreviewShouldWaitForHoverAndHold"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolPreviewShouldWaitForHoverAndHold"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setToolPreviewShouldWaitForHoverAndHold:](self, "setToolPreviewShouldWaitForHoverAndHold:", objc_msgSend(v39, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolSwitchIndicatorActive"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolSwitchIndicatorActive"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setToolSwitchIndicatorActive:](self, "setToolSwitchIndicatorActive:", objc_msgSend(v41, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("avoidSwitchingToolsOutsideHoverRange"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("avoidSwitchingToolsOutsideHoverRange"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setAvoidSwitchingToolsOutsideHoverRange:](self, "setAvoidSwitchingToolsOutsideHoverRange:", objc_msgSend(v43, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("screenEdgeSizeInMillimeters"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("screenEdgeSizeInMillimeters"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "doubleValue");
      -[PKHoverSettings setScreenEdgeSizeInMillimeters:](self, "setScreenEdgeSizeInMillimeters:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("maxZDistance"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("maxZDistance"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "doubleValue");
      -[PKHoverSettings setMaxZDistance:](self, "setMaxZDistance:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("erasePreviewAlphaFactor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("erasePreviewAlphaFactor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "doubleValue");
      -[PKHoverSettings setErasePreviewAlphaFactor:](self, "setErasePreviewAlphaFactor:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolPreviewMaxZDistance"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolPreviewMaxZDistance"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "doubleValue");
      -[PKHoverSettings setToolPreviewMaxZDistance:](self, "setToolPreviewMaxZDistance:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolPreviewFadeOutDistance"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolPreviewFadeOutDistance"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "doubleValue");
      -[PKHoverSettings setToolPreviewFadeOutDistance:](self, "setToolPreviewFadeOutDistance:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolPreviewAzimuthTiltMaxZDistance"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("toolPreviewAzimuthTiltMaxZDistance"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "doubleValue");
      -[PKHoverSettings setToolPreviewAzimuthTiltMaxZDistance:](self, "setToolPreviewAzimuthTiltMaxZDistance:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("deactivateExtraDistance"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("deactivateExtraDistance"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "doubleValue");
      -[PKHoverSettings setDeactivateExtraDistance:](self, "setDeactivateExtraDistance:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("predictionTimeInterval"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("predictionTimeInterval"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "doubleValue");
      -[PKHoverSettings setPredictionTimeInterval:](self, "setPredictionTimeInterval:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("extraHoverPreviewDelay"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("extraHoverPreviewDelay"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "doubleValue");
      -[PKHoverSettings setExtraHoverPreviewDelay:](self, "setExtraHoverPreviewDelay:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("inactivityTimeInterval"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("inactivityTimeInterval"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "doubleValue");
      -[PKHoverSettings setInactivityTimeInterval:](self, "setInactivityTimeInterval:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("hoverAndHoldTriggerTimeInterval"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("hoverAndHoldTriggerTimeInterval"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "doubleValue");
      -[PKHoverSettings setHoverAndHoldTriggerTimeInterval:](self, "setHoverAndHoldTriggerTimeInterval:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("hoverAndHoldActionTimeInterval"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("hoverAndHoldActionTimeInterval"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "doubleValue");
      -[PKHoverSettings setHoverAndHoldActionTimeInterval:](self, "setHoverAndHoldActionTimeInterval:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("numFramesExtraLatency"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("numFramesExtraLatency"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setNumFramesExtraLatency:](self, "setNumFramesExtraLatency:", objc_msgSend(v69, "integerValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("numFramesReduceFramerate"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("numFramesReduceFramerate"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setNumFramesReduceFramerate:](self, "setNumFramesReduceFramerate:", objc_msgSend(v71, "integerValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("weightedAverageLocationFactor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("weightedAverageLocationFactor"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "doubleValue");
      -[PKHoverSettings setWeightedAverageLocationFactor:](self, "setWeightedAverageLocationFactor:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("weightedAverageAzimuthFactor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("weightedAverageAzimuthFactor"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "doubleValue");
      -[PKHoverSettings setWeightedAverageAzimuthFactor:](self, "setWeightedAverageAzimuthFactor:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("weightedAverageAltitudeFactor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (v76)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("weightedAverageAltitudeFactor"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "doubleValue");
      -[PKHoverSettings setWeightedAverageAltitudeFactor:](self, "setWeightedAverageAltitudeFactor:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleFocusActive"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (v78)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleFocusActive"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setScribbleFocusActive:](self, "setScribbleFocusActive:", objc_msgSend(v79, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleFlashCursorActive"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleFlashCursorActive"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setScribbleFlashCursorActive:](self, "setScribbleFlashCursorActive:", objc_msgSend(v81, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleShowWritableElementsActive"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleShowWritableElementsActive"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setScribbleShowWritableElementsActive:](self, "setScribbleShowWritableElementsActive:", objc_msgSend(v83, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleHoverStrongActive"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleHoverStrongActive"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setScribbleHoverStrongActive:](self, "setScribbleHoverStrongActive:", objc_msgSend(v85, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleCommitOnLift"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (v86)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleCommitOnLift"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setScribbleCommitOnLift:](self, "setScribbleCommitOnLift:", objc_msgSend(v87, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleLineBreakHandling"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    if (v88)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleLineBreakHandling"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setScribbleLineBreakHandling:](self, "setScribbleLineBreakHandling:", objc_msgSend(v89, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleLineBreakMultiLineDelay"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleLineBreakMultiLineDelay"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "doubleValue");
      -[PKHoverSettings setScribbleLineBreakMultiLineDelay:](self, "setScribbleLineBreakMultiLineDelay:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleLineBreakMultiLineEnabled"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    if (v92)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleLineBreakMultiLineEnabled"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setScribbleLineBreakMultiLineEnabled:](self, "setScribbleLineBreakMultiLineEnabled:", objc_msgSend(v93, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleLineBreakMultiLineMaxLines"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (v94)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleLineBreakMultiLineMaxLines"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setScribbleLineBreakMultiLineMaxLines:](self, "setScribbleLineBreakMultiLineMaxLines:", objc_msgSend(v95, "intValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleIBeamActive"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (v96)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("scribbleIBeamActive"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setScribbleIBeamActive:](self, "setScribbleIBeamActive:", objc_msgSend(v97, "BOOLValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("azimuthJitterNoise"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    if (v98)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("azimuthJitterNoise"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "doubleValue");
      -[PKHoverSettings setAzimuthJitterNoise:](self, "setAzimuthJitterNoise:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("altitudeJitterNoise"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("altitudeJitterNoise"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "doubleValue");
      -[PKHoverSettings setAltitudeJitterNoise:](self, "setAltitudeJitterNoise:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("azimuthOffsetNoise"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (v102)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("azimuthOffsetNoise"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "doubleValue");
      -[PKHoverSettings setAzimuthOffsetNoise:](self, "setAzimuthOffsetNoise:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("altitudeOffsetNoise"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    if (v104)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("altitudeOffsetNoise"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "doubleValue");
      -[PKHoverSettings setAltitudeOffsetNoise:](self, "setAltitudeOffsetNoise:");

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("azimuthBuckets"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("azimuthBuckets"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setAzimuthBuckets:](self, "setAzimuthBuckets:", objc_msgSend(v107, "intValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("altitudeBuckets"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    if (v108)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("altitudeBuckets"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setAltitudeBuckets:](self, "setAltitudeBuckets:", objc_msgSend(v109, "intValue"));

    }
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("noiseIsHeightBased"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    if (v110)
    {
      objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("noiseIsHeightBased"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHoverSettings setNoiseIsHeightBased:](self, "setNoiseIsHeightBased:", objc_msgSend(v111, "BOOLValue"));

    }
  }

}

- (void)loadSettingsFromUserDefaults
{
  id v3;

  -[NSUserDefaults dictionaryForKey:](self->_pencilDefaults, "dictionaryForKey:", CFSTR("HoverDefaultsV14"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKHoverSettings loadSettingsFromDictionary:](self, "loadSettingsFromDictionary:", v3);

}

- (void)saveSettingsToUserDefaults
{
  id v3;

  if (-[PKHoverSettings _shouldSaveSettings](self, "_shouldSaveSettings"))
  {
    -[PKHoverSettings settingsDictionaryRepresentation](self, "settingsDictionaryRepresentation");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setObject:forKey:](self->_pencilDefaults, "setObject:forKey:", v3, CFSTR("HoverDefaultsV14"));

  }
}

- (void)resetToDefaultValues
{
  -[PKHoverSettings _loadDefaultValues](self, "_loadDefaultValues");
  -[PKHoverSettings saveSettingsToUserDefaults](self, "saveSettingsToUserDefaults");
}

- (void)_loadDefaultValues
{
  -[PKHoverSettings setShowDebugLayer:](self, "setShowDebugLayer:", 0);
  -[PKHoverSettings setSupportTouchPad:](self, "setSupportTouchPad:", 0);
  -[PKHoverSettings setDebugCursorType:](self, "setDebugCursorType:", 1);
  -[PKHoverSettings setTooltipsActive:](self, "setTooltipsActive:", 0);
  -[PKHoverSettings setSnapToShapeActive:](self, "setSnapToShapeActive:", 0);
  -[PKHoverSettings setToolIndicatorActive:](self, "setToolIndicatorActive:", 0);
  -[PKHoverSettings setToolShadowActive:](self, "setToolShadowActive:", 1);
  -[PKHoverSettings setToolShadowLocationWorkaround:](self, "setToolShadowLocationWorkaround:", 1);
  -[PKHoverSettings setToolShadowActiveOutsideNotes:](self, "setToolShadowActiveOutsideNotes:", 1);
  -[PKHoverSettings setToolShadowActiveOnOldPencils:](self, "setToolShadowActiveOnOldPencils:", 0);
  -[PKHoverSettings setToolShadowMovementSpeedHideThreshold:](self, "setToolShadowMovementSpeedHideThreshold:", -1.0);
  -[PKHoverSettings setToolPreviewShouldWaitForHoverAndHold:](self, "setToolPreviewShouldWaitForHoverAndHold:", 0);
  -[PKHoverSettings setToolShadowMaxOpacityNormal:](self, "setToolShadowMaxOpacityNormal:", 0.05);
  -[PKHoverSettings setToolShadowMaxOpacityForIncreasedContrast:](self, "setToolShadowMaxOpacityForIncreasedContrast:", 0.1);
  -[PKHoverSettings setToolShadowMaxOpacityInDrawingCanvasNormal:](self, "setToolShadowMaxOpacityInDrawingCanvasNormal:", 0.05);
  -[PKHoverSettings setToolShadowMaxOpacityInDrawingCanvasForIncreasedContrast:](self, "setToolShadowMaxOpacityInDrawingCanvasForIncreasedContrast:", 0.1);
  -[PKHoverSettings setToolShadowMaxBlurRadius:](self, "setToolShadowMaxBlurRadius:", 25.0);
  -[PKHoverSettings setToolShadowFadeInDistance:](self, "setToolShadowFadeInDistance:", 10.0);
  -[PKHoverSettings setToolSwitchIndicatorActive:](self, "setToolSwitchIndicatorActive:", 1);
  -[PKHoverSettings setAvoidSwitchingToolsOutsideHoverRange:](self, "setAvoidSwitchingToolsOutsideHoverRange:", 1);
  -[PKHoverSettings setMaxZDistance:](self, "setMaxZDistance:", 20.0);
  -[PKHoverSettings setErasePreviewAlphaFactor:](self, "setErasePreviewAlphaFactor:", 0.2);
  -[PKHoverSettings setScreenEdgeSizeInMillimeters:](self, "setScreenEdgeSizeInMillimeters:", 0.0);
  -[PKHoverSettings setToolPreviewMaxZDistance:](self, "setToolPreviewMaxZDistance:", 12.0);
  -[PKHoverSettings setToolPreviewFadeOutDistance:](self, "setToolPreviewFadeOutDistance:", 2.5);
  -[PKHoverSettings setToolPreviewAzimuthTiltMaxZDistance:](self, "setToolPreviewAzimuthTiltMaxZDistance:", 25.0);
  -[PKHoverSettings setDeactivateExtraDistance:](self, "setDeactivateExtraDistance:", 5.0);
  -[PKHoverSettings setPredictionTimeInterval:](self, "setPredictionTimeInterval:", 0.0166666667);
  -[PKHoverSettings setExtraHoverPreviewDelay:](self, "setExtraHoverPreviewDelay:", 0.0);
  -[PKHoverSettings setInactivityTimeInterval:](self, "setInactivityTimeInterval:", 5.0);
  -[PKHoverSettings setScribbleFocusActive:](self, "setScribbleFocusActive:", 0);
  -[PKHoverSettings setScribbleFlashCursorActive:](self, "setScribbleFlashCursorActive:", 0);
  -[PKHoverSettings setScribbleShowWritableElementsActive:](self, "setScribbleShowWritableElementsActive:", 0);
  -[PKHoverSettings setScribbleHoverStrongActive:](self, "setScribbleHoverStrongActive:", 0);
  -[PKHoverSettings setScribbleCommitOnLift:](self, "setScribbleCommitOnLift:", 1);
  -[PKHoverSettings setScribbleLineBreakHandling:](self, "setScribbleLineBreakHandling:", 1);
  -[PKHoverSettings setScribbleLineBreakMultiLineDelay:](self, "setScribbleLineBreakMultiLineDelay:", 1.0);
  -[PKHoverSettings setScribbleLineBreakMultiLineEnabled:](self, "setScribbleLineBreakMultiLineEnabled:", 1);
  -[PKHoverSettings setScribbleLineBreakMultiLineMaxLines:](self, "setScribbleLineBreakMultiLineMaxLines:", 80);
  -[PKHoverSettings setScribbleIBeamActive:](self, "setScribbleIBeamActive:", 1);
  -[PKHoverSettings setHoverAndHoldTriggerTimeInterval:](self, "setHoverAndHoldTriggerTimeInterval:", 0.2);
  -[PKHoverSettings setHoverAndHoldActionTimeInterval:](self, "setHoverAndHoldActionTimeInterval:", 0.5);
  -[PKHoverSettings setWeightedAverageAltitudeFactor:](self, "setWeightedAverageAltitudeFactor:", 4.0);
  -[PKHoverSettings setWeightedAverageAzimuthFactor:](self, "setWeightedAverageAzimuthFactor:", 0.0);
  -[PKHoverSettings setWeightedAverageLocationFactor:](self, "setWeightedAverageLocationFactor:", 0.0);
  -[PKHoverSettings setNumFramesExtraLatency:](self, "setNumFramesExtraLatency:", 0);
  -[PKHoverSettings setNoiseIsHeightBased:](self, "setNoiseIsHeightBased:", 1);
  -[PKHoverSettings setAltitudeJitterNoise:](self, "setAltitudeJitterNoise:", 0.0);
  -[PKHoverSettings setAzimuthJitterNoise:](self, "setAzimuthJitterNoise:", 0.0);
  -[PKHoverSettings setAltitudeOffsetNoise:](self, "setAltitudeOffsetNoise:", 0.0);
  -[PKHoverSettings setAzimuthOffsetNoise:](self, "setAzimuthOffsetNoise:", 0.0);
  -[PKHoverSettings setNumFramesReduceFramerate:](self, "setNumFramesReduceFramerate:", 0);
  -[PKHoverSettings setAzimuthBuckets:](self, "setAzimuthBuckets:", 0);
  -[PKHoverSettings setAltitudeBuckets:](self, "setAltitudeBuckets:", 0);
  -[PKHoverSettings setToolPreviewActiveForTesting:](self, "setToolPreviewActiveForTesting:", 1);
}

- (void)_scheduleSavingSettingsSoon
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__scheduledSaveSettingsTriggered, 0);
  -[PKHoverSettings performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__scheduledSaveSettingsTriggered, 0, 0.1);
}

- (BOOL)toolShadowActive
{
  return ((sForceHoverSupportedForTesting & 1) != 0 || _os_feature_enabled_impl())
      && self->_toolShadowActive
      && -[PKHoverSettings toolPreviewActive](self, "toolPreviewActive");
}

- (BOOL)toolShadowActiveOnOldPencils
{
  if (self->_toolShadowActiveOnOldPencils && -[PKHoverSettings toolPreviewActive](self, "toolPreviewActive"))
    return _os_feature_enabled_impl();
  else
    return 0;
}

- (double)toolShadowMaxOpacity
{
  double result;

  if (-[PKHoverSettings increasedContrastEnabled](self, "increasedContrastEnabled"))
    -[PKHoverSettings toolShadowMaxOpacityForIncreasedContrast](self, "toolShadowMaxOpacityForIncreasedContrast");
  else
    -[PKHoverSettings toolShadowMaxOpacityNormal](self, "toolShadowMaxOpacityNormal");
  return result;
}

- (double)toolShadowMaxOpacityInDrawingCanvas
{
  double result;

  if (-[PKHoverSettings increasedContrastEnabled](self, "increasedContrastEnabled"))
    -[PKHoverSettings toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast](self, "toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast");
  else
    -[PKHoverSettings toolShadowMaxOpacityInDrawingCanvasNormal](self, "toolShadowMaxOpacityInDrawingCanvasNormal");
  return result;
}

+ (id)keyPathsForValuesAffectingToolShadowMaxOpacity
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("increasedContrastEnabled"), CFSTR("toolShadowMaxOpacityNormal"), CFSTR("toolShadowMaxOpacityForIncreasedContrast"), 0);
}

+ (id)keyPathsForValuesAffectingToolShadowMaxOpacityInDrawingCanvas
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("increasedContrastEnabled"), CFSTR("toolShadowMaxOpacityInDrawingCanvasNormal"), CFSTR("toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast"), 0);
}

- (BOOL)toolPreviewActive
{
  if (sForceHoverSupportedForTesting == 1)
    return -[PKHoverSettings toolPreviewActiveForTesting](self, "toolPreviewActiveForTesting");
  else
    return objc_msgSend(MEMORY[0x1E0DC3AC8], "prefersHoverToolPreview");
}

- (void)setToolPreviewActive:(BOOL)a3
{
  if (sForceHoverSupportedForTesting == 1)
    -[PKHoverSettings setToolPreviewActiveForTesting:](self, "setToolPreviewActiveForTesting:", a3);
  else
    +[PKSettingsDaemon setPrefersPencilHoverPreviewEnabled:withCompletion:](PKSettingsDaemon, "setPrefersPencilHoverPreviewEnabled:withCompletion:", a3, 0);
}

- (BOOL)showDebugLayer
{
  return self->_showDebugLayer;
}

- (void)setShowDebugLayer:(BOOL)a3
{
  self->_showDebugLayer = a3;
}

- (BOOL)supportTouchPad
{
  return self->_supportTouchPad;
}

- (void)setSupportTouchPad:(BOOL)a3
{
  self->_supportTouchPad = a3;
}

- (int64_t)debugCursorType
{
  return self->_debugCursorType;
}

- (void)setDebugCursorType:(int64_t)a3
{
  self->_debugCursorType = a3;
}

- (BOOL)tooltipsActive
{
  return self->_tooltipsActive;
}

- (void)setTooltipsActive:(BOOL)a3
{
  self->_tooltipsActive = a3;
}

- (BOOL)snapToShapeActive
{
  return self->_snapToShapeActive;
}

- (void)setSnapToShapeActive:(BOOL)a3
{
  self->_snapToShapeActive = a3;
}

- (double)erasePreviewAlphaFactor
{
  return self->_erasePreviewAlphaFactor;
}

- (void)setErasePreviewAlphaFactor:(double)a3
{
  self->_erasePreviewAlphaFactor = a3;
}

- (BOOL)toolIndicatorActive
{
  return self->_toolIndicatorActive;
}

- (void)setToolIndicatorActive:(BOOL)a3
{
  self->_toolIndicatorActive = a3;
}

- (BOOL)avoidSwitchingToolsOutsideHoverRange
{
  return self->_avoidSwitchingToolsOutsideHoverRange;
}

- (void)setAvoidSwitchingToolsOutsideHoverRange:(BOOL)a3
{
  self->_avoidSwitchingToolsOutsideHoverRange = a3;
}

- (void)setToolShadowActive:(BOOL)a3
{
  self->_toolShadowActive = a3;
}

- (void)setToolShadowActiveOnOldPencils:(BOOL)a3
{
  self->_toolShadowActiveOnOldPencils = a3;
}

- (BOOL)toolShadowActiveOutsideNotes
{
  return self->_toolShadowActiveOutsideNotes;
}

- (void)setToolShadowActiveOutsideNotes:(BOOL)a3
{
  self->_toolShadowActiveOutsideNotes = a3;
}

- (BOOL)toolShadowLocationWorkaround
{
  return self->_toolShadowLocationWorkaround;
}

- (void)setToolShadowLocationWorkaround:(BOOL)a3
{
  self->_toolShadowLocationWorkaround = a3;
}

- (double)toolShadowMaxOpacityNormal
{
  return self->_toolShadowMaxOpacityNormal;
}

- (void)setToolShadowMaxOpacityNormal:(double)a3
{
  self->_toolShadowMaxOpacityNormal = a3;
}

- (double)toolShadowMaxOpacityForIncreasedContrast
{
  return self->_toolShadowMaxOpacityForIncreasedContrast;
}

- (void)setToolShadowMaxOpacityForIncreasedContrast:(double)a3
{
  self->_toolShadowMaxOpacityForIncreasedContrast = a3;
}

- (double)toolShadowMaxOpacityInDrawingCanvasNormal
{
  return self->_toolShadowMaxOpacityInDrawingCanvasNormal;
}

- (void)setToolShadowMaxOpacityInDrawingCanvasNormal:(double)a3
{
  self->_toolShadowMaxOpacityInDrawingCanvasNormal = a3;
}

- (double)toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast
{
  return self->_toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast;
}

- (void)setToolShadowMaxOpacityInDrawingCanvasForIncreasedContrast:(double)a3
{
  self->_toolShadowMaxOpacityInDrawingCanvasForIncreasedContrast = a3;
}

- (double)toolShadowMaxBlurRadius
{
  return self->_toolShadowMaxBlurRadius;
}

- (void)setToolShadowMaxBlurRadius:(double)a3
{
  self->_toolShadowMaxBlurRadius = a3;
}

- (double)toolShadowMovementSpeedHideThreshold
{
  return self->_toolShadowMovementSpeedHideThreshold;
}

- (void)setToolShadowMovementSpeedHideThreshold:(double)a3
{
  self->_toolShadowMovementSpeedHideThreshold = a3;
}

- (double)toolShadowFadeInDistance
{
  return self->_toolShadowFadeInDistance;
}

- (void)setToolShadowFadeInDistance:(double)a3
{
  self->_toolShadowFadeInDistance = a3;
}

- (BOOL)toolPreviewShouldWaitForHoverAndHold
{
  return self->_toolPreviewShouldWaitForHoverAndHold;
}

- (void)setToolPreviewShouldWaitForHoverAndHold:(BOOL)a3
{
  self->_toolPreviewShouldWaitForHoverAndHold = a3;
}

- (BOOL)toolSwitchIndicatorActive
{
  return self->_toolSwitchIndicatorActive;
}

- (void)setToolSwitchIndicatorActive:(BOOL)a3
{
  self->_toolSwitchIndicatorActive = a3;
}

- (double)screenEdgeSizeInMillimeters
{
  return self->_screenEdgeSizeInMillimeters;
}

- (void)setScreenEdgeSizeInMillimeters:(double)a3
{
  self->_screenEdgeSizeInMillimeters = a3;
}

- (double)maxZDistance
{
  return self->_maxZDistance;
}

- (void)setMaxZDistance:(double)a3
{
  self->_maxZDistance = a3;
}

- (double)toolPreviewMaxZDistance
{
  return self->_toolPreviewMaxZDistance;
}

- (void)setToolPreviewMaxZDistance:(double)a3
{
  self->_toolPreviewMaxZDistance = a3;
}

- (double)toolPreviewFadeOutDistance
{
  return self->_toolPreviewFadeOutDistance;
}

- (void)setToolPreviewFadeOutDistance:(double)a3
{
  self->_toolPreviewFadeOutDistance = a3;
}

- (double)toolPreviewAzimuthTiltMaxZDistance
{
  return self->_toolPreviewAzimuthTiltMaxZDistance;
}

- (void)setToolPreviewAzimuthTiltMaxZDistance:(double)a3
{
  self->_toolPreviewAzimuthTiltMaxZDistance = a3;
}

- (double)deactivateExtraDistance
{
  return self->_deactivateExtraDistance;
}

- (void)setDeactivateExtraDistance:(double)a3
{
  self->_deactivateExtraDistance = a3;
}

- (double)predictionTimeInterval
{
  return self->_predictionTimeInterval;
}

- (void)setPredictionTimeInterval:(double)a3
{
  self->_predictionTimeInterval = a3;
}

- (double)extraHoverPreviewDelay
{
  return self->_extraHoverPreviewDelay;
}

- (void)setExtraHoverPreviewDelay:(double)a3
{
  self->_extraHoverPreviewDelay = a3;
}

- (double)inactivityTimeInterval
{
  return self->_inactivityTimeInterval;
}

- (void)setInactivityTimeInterval:(double)a3
{
  self->_inactivityTimeInterval = a3;
}

- (double)hoverAndHoldTriggerTimeInterval
{
  return self->_hoverAndHoldTriggerTimeInterval;
}

- (void)setHoverAndHoldTriggerTimeInterval:(double)a3
{
  self->_hoverAndHoldTriggerTimeInterval = a3;
}

- (double)hoverAndHoldActionTimeInterval
{
  return self->_hoverAndHoldActionTimeInterval;
}

- (void)setHoverAndHoldActionTimeInterval:(double)a3
{
  self->_hoverAndHoldActionTimeInterval = a3;
}

- (unint64_t)numFramesExtraLatency
{
  return self->_numFramesExtraLatency;
}

- (void)setNumFramesExtraLatency:(unint64_t)a3
{
  self->_numFramesExtraLatency = a3;
}

- (unint64_t)numFramesReduceFramerate
{
  return self->_numFramesReduceFramerate;
}

- (void)setNumFramesReduceFramerate:(unint64_t)a3
{
  self->_numFramesReduceFramerate = a3;
}

- (double)weightedAverageAltitudeFactor
{
  return self->_weightedAverageAltitudeFactor;
}

- (void)setWeightedAverageAltitudeFactor:(double)a3
{
  self->_weightedAverageAltitudeFactor = a3;
}

- (double)weightedAverageAzimuthFactor
{
  return self->_weightedAverageAzimuthFactor;
}

- (void)setWeightedAverageAzimuthFactor:(double)a3
{
  self->_weightedAverageAzimuthFactor = a3;
}

- (double)weightedAverageLocationFactor
{
  return self->_weightedAverageLocationFactor;
}

- (void)setWeightedAverageLocationFactor:(double)a3
{
  self->_weightedAverageLocationFactor = a3;
}

- (BOOL)scribbleFocusActive
{
  return self->_scribbleFocusActive;
}

- (void)setScribbleFocusActive:(BOOL)a3
{
  self->_scribbleFocusActive = a3;
}

- (BOOL)scribbleFlashCursorActive
{
  return self->_scribbleFlashCursorActive;
}

- (void)setScribbleFlashCursorActive:(BOOL)a3
{
  self->_scribbleFlashCursorActive = a3;
}

- (BOOL)scribbleShowWritableElementsActive
{
  return self->_scribbleShowWritableElementsActive;
}

- (void)setScribbleShowWritableElementsActive:(BOOL)a3
{
  self->_scribbleShowWritableElementsActive = a3;
}

- (BOOL)scribbleHoverStrongActive
{
  return self->_scribbleHoverStrongActive;
}

- (void)setScribbleHoverStrongActive:(BOOL)a3
{
  self->_scribbleHoverStrongActive = a3;
}

- (BOOL)scribbleCommitOnLift
{
  return self->_scribbleCommitOnLift;
}

- (void)setScribbleCommitOnLift:(BOOL)a3
{
  self->_scribbleCommitOnLift = a3;
}

- (BOOL)scribbleLineBreakHandling
{
  return self->_scribbleLineBreakHandling;
}

- (void)setScribbleLineBreakHandling:(BOOL)a3
{
  self->_scribbleLineBreakHandling = a3;
}

- (BOOL)scribbleLineBreakMultiLineEnabled
{
  return self->_scribbleLineBreakMultiLineEnabled;
}

- (void)setScribbleLineBreakMultiLineEnabled:(BOOL)a3
{
  self->_scribbleLineBreakMultiLineEnabled = a3;
}

- (int)scribbleLineBreakMultiLineMaxLines
{
  return self->_scribbleLineBreakMultiLineMaxLines;
}

- (void)setScribbleLineBreakMultiLineMaxLines:(int)a3
{
  self->_scribbleLineBreakMultiLineMaxLines = a3;
}

- (double)scribbleLineBreakMultiLineDelay
{
  return self->_scribbleLineBreakMultiLineDelay;
}

- (void)setScribbleLineBreakMultiLineDelay:(double)a3
{
  self->_scribbleLineBreakMultiLineDelay = a3;
}

- (BOOL)scribbleIBeamActive
{
  return self->_scribbleIBeamActive;
}

- (void)setScribbleIBeamActive:(BOOL)a3
{
  self->_scribbleIBeamActive = a3;
}

- (double)azimuthJitterNoise
{
  return self->_azimuthJitterNoise;
}

- (void)setAzimuthJitterNoise:(double)a3
{
  self->_azimuthJitterNoise = a3;
}

- (double)altitudeJitterNoise
{
  return self->_altitudeJitterNoise;
}

- (void)setAltitudeJitterNoise:(double)a3
{
  self->_altitudeJitterNoise = a3;
}

- (double)azimuthOffsetNoise
{
  return self->_azimuthOffsetNoise;
}

- (void)setAzimuthOffsetNoise:(double)a3
{
  self->_azimuthOffsetNoise = a3;
}

- (double)altitudeOffsetNoise
{
  return self->_altitudeOffsetNoise;
}

- (void)setAltitudeOffsetNoise:(double)a3
{
  self->_altitudeOffsetNoise = a3;
}

- (BOOL)noiseIsHeightBased
{
  return self->_noiseIsHeightBased;
}

- (void)setNoiseIsHeightBased:(BOOL)a3
{
  self->_noiseIsHeightBased = a3;
}

- (int)azimuthBuckets
{
  return self->_azimuthBuckets;
}

- (void)setAzimuthBuckets:(int)a3
{
  self->_azimuthBuckets = a3;
}

- (int)altitudeBuckets
{
  return self->_altitudeBuckets;
}

- (void)setAltitudeBuckets:(int)a3
{
  self->_altitudeBuckets = a3;
}

- (BOOL)increasedContrastEnabled
{
  return self->_increasedContrastEnabled;
}

- (void)setIncreasedContrastEnabled:(BOOL)a3
{
  self->_increasedContrastEnabled = a3;
}

- (BOOL)toolPreviewActiveForTesting
{
  return self->_toolPreviewActiveForTesting;
}

- (void)setToolPreviewActiveForTesting:(BOOL)a3
{
  self->_toolPreviewActiveForTesting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilDefaults, 0);
}

@end
