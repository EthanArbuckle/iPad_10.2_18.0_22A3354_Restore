@implementation AVSecondScreenDebugAssistant

- (AVSecondScreenDebugAssistant)init
{
  AVSecondScreenDebugAssistant *v2;
  NSObject *v3;
  AVObservationController *v4;
  AVObservationController *observationController;
  AVObservationController *v6;
  void *v7;
  id v8;
  uint8_t v10[8];
  objc_super v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)AVSecondScreenDebugAssistant;
  v2 = -[AVSecondScreenDebugAssistant init](&v11, sel_init);
  if (AVSecondScreenDebugHUDEnabled_onceToken != -1)
    dispatch_once(&AVSecondScreenDebugHUDEnabled_onceToken, &__block_literal_global_104);
  if (!AVSecondScreenDebugHUDEnabled__Enabled)
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "Don't initialize this unless AVSecondScreenDebugHUDEnabled()!", v10, 2u);
    }

  }
  if (v2)
  {
    v4 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v2);
    observationController = v2->_observationController;
    v2->_observationController = v4;

    v6 = v2->_observationController;
    v12[0] = CFSTR("debugInfoDisplay.currentMode");
    v12[1] = CFSTR("debugInfoDisplay.preferences");
    v12[2] = CFSTR("player.currentItem");
    v12[3] = CFSTR("player.currentItem.tracks");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AVObservationController startObserving:keyPaths:observationHandler:](v6, "startObserving:keyPaths:observationHandler:", v2, v7, &__block_literal_global_9329);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVSecondScreenDebugAssistant observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  v4.receiver = self;
  v4.super_class = (Class)AVSecondScreenDebugAssistant;
  -[AVSecondScreenDebugAssistant dealloc](&v4, sel_dealloc);
}

- (void)setScene:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_scene, obj);
    -[AVSecondScreenDebugAssistant _currentDisplay](self, "_currentDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenDebugAssistant setDebugInfoDisplay:](self, "setDebugInfoDisplay:", v6);

    v5 = obj;
  }

}

- (void)setDebugText:(id)a3
{
  NSString *v4;
  NSString *debugText;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", self->_debugText) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    debugText = self->_debugText;
    self->_debugText = v4;

    -[AVSecondScreenDebugAssistant secondScreenViewController](self, "secondScreenViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDebugText:", self->_debugText);

  }
}

- (void)setSecondScreenViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_secondScreenViewController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_secondScreenViewController, obj);
    -[AVSecondScreenDebugAssistant debugText](self, "debugText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setDebugText:", v5);

  }
}

- (id)_currentEnabledVideoTrack
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AVSecondScreenDebugAssistant player](self, "player", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tracks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = *MEMORY[0x1E0C8A808];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEnabled"))
        {
          objc_msgSend(v10, "assetTrack");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "mediaType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v8);

          if (v13)
          {
            v14 = v10;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (id)_currentDisplay
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(MEMORY[0x1E0CD2728], "displays");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v18 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "uniqueId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVSecondScreenDebugAssistant scene](self, "scene");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "avkit_asWindowScene");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "screen");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_displayID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v7, "isEqual:", v11);

        if (v12)
        {
          v13 = v6;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v3)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)_currentVideoDynamicRange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int VideoDynamicRange;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AVSecondScreenDebugAssistant _currentEnabledVideoTrack](self, "_currentEnabledVideoTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetTrack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "statusOfValueForKey:error:", CFSTR("formatDescriptions"), 0);

  if (v5 == 2)
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
    -[AVSecondScreenDebugAssistant _currentEnabledVideoTrack](self, "_currentEnabledVideoTrack", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetTrack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formatDescriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      VideoDynamicRange = 0;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v8);
          if (VideoDynamicRange <= (int)CMVideoFormatDescriptionGetVideoDynamicRange())
            VideoDynamicRange = CMVideoFormatDescriptionGetVideoDynamicRange();
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);

      if ((VideoDynamicRange - 1) <= 7)
        return off_1E5BB22E8[VideoDynamicRange - 1];
    }
    else
    {

    }
  }
  return CFSTR("Unknown");
}

- (void)_updateDebugLabelText
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  AVSecondScreenDebugAssistant *v15;

  -[AVSecondScreenDebugAssistant _currentEnabledVideoTrack](self, "_currentEnabledVideoTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetTrack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "statusOfValueForKey:error:", CFSTR("formatDescriptions"), 0) == 2)
  {
    objc_msgSend(v3, "assetTrack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "statusOfValueForKey:error:", CFSTR("naturalSize"), 0);

    if (v6 == 2)
    {
      objc_msgSend(v3, "assetTrack");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "naturalSize");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fx%0.f"), v8, v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[AVSecondScreenDebugAssistant _currentVideoDynamicRange](self, "_currentVideoDynamicRange");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {

  }
  if (v3)
  {
    objc_msgSend(v3, "assetTrack");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__AVSecondScreenDebugAssistant__updateDebugLabelText__block_invoke;
    v13[3] = &unk_1E5BB3D20;
    v14 = v3;
    v15 = self;
    objc_msgSend(v12, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E5BF3FC0, v13);

  }
  v11 = CFSTR("Unknown");
  v10 = CFSTR("Unknown");
LABEL_8:
  -[AVSecondScreenDebugAssistant _actuallyUpdateDebugLabelTextWithCurrentResolution:currentVideoDynamicRange:](self, "_actuallyUpdateDebugLabelTextWithCurrentResolution:currentVideoDynamicRange:", v10, v11);

}

- (void)_actuallyUpdateDebugLabelTextWithCurrentResolution:(id)a3 currentVideoDynamicRange:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  float v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  const __CFString *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  __CFString *v70;
  _QWORD v71[11];

  v71[9] = *MEMORY[0x1E0C80C00];
  v67 = a4;
  v65 = a3;
  -[AVSecondScreenDebugAssistant player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredDisplayCriteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "videoDynamicRange") - 1;
  if (v10 > 7)
    v11 = CFSTR("Unknown");
  else
    v11 = off_1E5BB22E8[v10];
  v64 = v11;
  -[AVSecondScreenDebugAssistant player](self, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "asset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "maximumVideoResolution");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fx%0.f"), v15, v16);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "refreshRate");
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%.0f"), v19);
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

    v20 = CFSTR("Unknown");
    v17 = CFSTR("Unknown");
  }
  v69 = v9;
  v70 = v20;
  if (-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("0x0")))
  {

    v17 = CFSTR("Unknown");
  }
  v58 = v17;
  -[AVSecondScreenDebugAssistant debugInfoDisplay](self, "debugInfoDisplay");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "currentMode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hdrMode");
  v23 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)v23;

  -[AVSecondScreenDebugAssistant debugInfoDisplay](self, "debugInfoDisplay");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "currentMode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (double)(unint64_t)objc_msgSend(v25, "width");
  -[AVSecondScreenDebugAssistant _currentDisplay](self, "_currentDisplay");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "currentMode");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "height");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fx%0.f"), *(_QWORD *)&v26, (double)v29);
  v30 = objc_claimAutoreleasedReturnValue();
  v62 = (void *)v30;

  v31 = (void *)MEMORY[0x1E0CB3940];
  -[AVSecondScreenDebugAssistant debugInfoDisplay](self, "debugInfoDisplay");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "currentMode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "refreshRate");
  objc_msgSend(v31, "stringWithFormat:", CFSTR("%0.f"), v34);
  v35 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v35;

  -[AVSecondScreenDebugAssistant debugInfoDisplay](self, "debugInfoDisplay");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "preferences");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "preferredHdrMode");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  v40 = CFSTR("Dolby");
  if (v38)
    v40 = (__CFString *)v38;
  v41 = v40;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Current Display Mode: %@ %@ @ %@Hz"), v30, v23, v35);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v60;
  v71[1] = CFSTR("--------");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Current Variant: %@ %@"), v65, v67);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v71[2] = v59;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Best Variant: %@ %@"), v17, v64);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v68;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Preferred Refresh Rate: %@Hz"), v70);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v66;
  v71[5] = CFSTR("--------");
  v42 = (void *)MEMORY[0x1E0CB3940];
  -[AVSecondScreenDebugAssistant debugInfoDisplay](self, "debugInfoDisplay");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "preferences");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "matchContent");
  v46 = CFSTR("Disabled");
  if (v45)
    v46 = CFSTR("Enabled");
  objc_msgSend(v42, "stringWithFormat:", CFSTR("Content Match: %@\nPreferred Color Mode: %@"), v46, v41);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v71[6] = v47;
  v71[7] = CFSTR("--------");
  v48 = (void *)MEMORY[0x1E0CB3940];
  -[AVSecondScreenDebugAssistant scene](self, "scene");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "avkit_asWindowScene");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "screen");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "nativeBounds");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fx%0.f"), v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stringWithFormat:", CFSTR("UIScreen.nativeBounds.size: %@"), v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v71[8] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 9);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSecondScreenDebugAssistant setDebugText:](self, "setDebugText:", v57);

}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (UIScene)scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (NSString)debugText
{
  return self->_debugText;
}

- (AVSecondScreenViewController)secondScreenViewController
{
  return (AVSecondScreenViewController *)objc_loadWeakRetained((id *)&self->_secondScreenViewController);
}

- (CADisplay)debugInfoDisplay
{
  return self->_debugInfoDisplay;
}

- (void)setDebugInfoDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfoDisplay, a3);
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setObservationController:(id)a3
{
  objc_storeStrong((id *)&self->_observationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_debugInfoDisplay, 0);
  objc_destroyWeak((id *)&self->_secondScreenViewController);
  objc_storeStrong((id *)&self->_debugText, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_player, 0);
}

void __53__AVSecondScreenDebugAssistant__updateDebugLabelText__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__AVSecondScreenDebugAssistant__updateDebugLabelText__block_invoke_2;
  v4[3] = &unk_1E5BB3D20;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __53__AVSecondScreenDebugAssistant__updateDebugLabelText__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_currentEnabledVideoTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetTrack");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "naturalSize");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0fx%0.f"), v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_currentVideoDynamicRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_actuallyUpdateDebugLabelTextWithCurrentResolution:currentVideoDynamicRange:", v8, v7);

  }
}

uint64_t __36__AVSecondScreenDebugAssistant_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateDebugLabelText");
}

@end
