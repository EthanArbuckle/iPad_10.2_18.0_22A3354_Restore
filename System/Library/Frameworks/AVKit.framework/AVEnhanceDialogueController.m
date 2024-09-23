@implementation AVEnhanceDialogueController

- (AVEnhanceDialogueController)init
{
  AVEnhanceDialogueController *v2;
  AVObservationController *v3;
  AVObservationController *observationController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVEnhanceDialogueController;
  v2 = -[AVEnhanceDialogueController init](&v6, sel_init);
  if (v2)
  {
    v3 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v2);
    observationController = v2->_observationController;
    v2->_observationController = v3;

    -[AVEnhanceDialogueController setCurrentAudioRouteSupported:](v2, "setCurrentAudioRouteSupported:", 0);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v7;

  -[AVEnhanceDialogueController observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  +[AVEnhanceDialogueOptInManager sharedInstance](AVEnhanceDialogueOptInManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnhanceDialogueControllerOptedIn:", self);

  if (v5)
  {
    +[AVEnhanceDialogueOptInManager sharedInstance](AVEnhanceDialogueOptInManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "optOutEnhanceDialogueController:", self);

  }
  v7.receiver = self;
  v7.super_class = (Class)AVEnhanceDialogueController;
  -[AVEnhanceDialogueController dealloc](&v7, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[AVEnhanceDialogueController _updateActuallyEnabledStateIfNeeded](self);
    -[AVEnhanceDialogueController _updateCurrentAudioRouteSupported](self);
  }
}

- (void)setPlayerController:(id)a3
{
  AVPlayerController *v5;
  void *v6;
  void *v7;
  id v8;
  AVPlayerController *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v5 = (AVPlayerController *)a3;
  if (self->_playerController != v5)
  {
    v9 = v5;
    -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
    objc_storeStrong((id *)&self->_playerController, a3);
    v10[0] = CFSTR("playerController.currentAssetIfReady");
    v10[1] = CFSTR("playerController.rate");
    v10[2] = CFSTR("mode");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVEnhanceDialogueController observationController](self, "observationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v6, 1, &__block_literal_global_24);
    objc_msgSend(v7, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AB28], 0, 0, &__block_literal_global_26);
    objc_msgSend(v7, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AB38], 0, 0, &__block_literal_global_27_18015);

    -[AVEnhanceDialogueController _updateActuallyEnabledStateIfNeeded](self);
    -[AVEnhanceDialogueController _updateCurrentAudioRouteSupported](self);
    v5 = v9;
  }

}

- (BOOL)currentContentSupported
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enhanceDialogueEnabled");

  if (!v4)
    return 0;
  -[AVEnhanceDialogueController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasEnabledAudio");

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0C89760];

  if (v8 == v9)
    return v6;
  else
    return 0;
}

- (int64_t)currentLevel
{
  void *v3;
  _BOOL4 v4;
  char v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  id v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  uint8_t buf[4];
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "enhanceDialogueEnabled")
    || !-[AVEnhanceDialogueController isCurrentAudioRouteSupported](self, "isCurrentAudioRouteSupported"))
  {

    goto LABEL_18;
  }
  v4 = -[AVEnhanceDialogueController currentContentSupported](self, "currentContentSupported");

  if (!v4)
  {
LABEL_18:
    objc_opt_self();
    return 0;
  }
  v14 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0C89A50], "getEnhanceDialogueLevel:error:", &v15, &v14);
  v6 = v14;
  if ((v5 & 1) == 0)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = objc_msgSend(v12, "cStringUsingEncoding:", 4);
      *(_DWORD *)buf = 136315138;
      v17 = v13;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Unable to get Enhance Dialogue level: %s", buf, 0xCu);

    }
  }
  if (v15 == 3 && !_AXSExtendedVoiceIsolationMediaModesEnabled())
  {
    _AVLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "Enhance Dialogue level was reported to be FullyIsolate but Extended Voice Isolation is disabled.", buf, 2u);
    }

  }
  v9 = v15;
  objc_opt_self();
  if (v9 >= 4)
  {
    _AVLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v9;
      _os_log_error_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_ERROR, "Unknown AVAudioApplicationEnhanceDialogueLevel: %ld", buf, 0xCu);
    }

    return 0;
  }
  return v9;
}

- (void)setCurrentLevel:(int64_t)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enhanceDialogueEnabled");

  if (v5)
  {
    if (a3 == 3)
    {
      if (!_AXSExtendedVoiceIsolationMediaModesEnabled())
      {
        _AVLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_ERROR, "Attempting to set Enhance Dialogue to FullIsolation when Extended Voice Isolation is disabled.", buf, 2u);
        }

      }
      objc_opt_self();
      a3 = 3;
    }
    else
    {
      objc_opt_self();
      if ((unint64_t)a3 >= 4)
      {
        _AVLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v15 = a3;
          _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Unknown AVEnhanceDialogueLevel: %ld", buf, 0xCu);
        }

        a3 = 0;
      }
    }
    v13 = 0;
    v8 = objc_msgSend(MEMORY[0x1E0C89A50], "setEnhanceDialogueLevel:error:", a3, &v13);
    v9 = v13;
    if ((v8 & 1) == 0)
    {
      _AVLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "localizedDescription");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v12 = objc_msgSend(v11, "cStringUsingEncoding:", 4);
        *(_DWORD *)buf = 136315138;
        v15 = v12;
        _os_log_error_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_ERROR, "Unable to set Enhance Dialogue level: %s", buf, 0xCu);

      }
    }

  }
}

- (NSArray)availableLevels
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "enhanceDialogueEnabled"))
  {
    v5 = -[AVEnhanceDialogueController isCurrentAudioRouteSupported](self, "isCurrentAudioRouteSupported");

    if (v5)
    {
      if (_AXSExtendedVoiceIsolationMediaModesEnabled())
        objc_msgSend(v3, "addObject:", &unk_1E5BF38D0);
      objc_msgSend(v3, "addObject:", &unk_1E5BF38E8);
      objc_msgSend(v3, "addObject:", &unk_1E5BF3900);
      objc_msgSend(v3, "addObject:", &unk_1E5BF3918);
    }
  }
  else
  {

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v6;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setObservationController:(id)a3
{
  objc_storeStrong((id *)&self->_observationController, a3);
}

- (BOOL)isCurrentAudioRouteSupported
{
  return self->_currentAudioRouteSupported;
}

- (void)setCurrentAudioRouteSupported:(BOOL)a3
{
  self->_currentAudioRouteSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
}

- (void)_updateActuallyEnabledStateIfNeeded
{
  int v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _BOOL4 v10;
  void *v12;
  int v13;
  id v14;

  if (a1)
  {
    v2 = objc_msgSend(a1, "enabled");
    objc_msgSend(a1, "playerController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasEnabledAudio");

    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rate");
    v9 = v8;

    v10 = 0;
    if (v2 && v4)
      v10 = v9 > 0.0 && v6 == (void *)*MEMORY[0x1E0C89760];
    +[AVEnhanceDialogueOptInManager sharedInstance](AVEnhanceDialogueOptInManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEnhanceDialogueControllerOptedIn:", a1);

    if (v10 && (v13 & 1) == 0)
    {
      +[AVEnhanceDialogueOptInManager sharedInstance](AVEnhanceDialogueOptInManager, "sharedInstance");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "optInEnhanceDialogueController:", a1);
LABEL_16:

      return;
    }
    if (((v10 | v13 ^ 1) & 1) == 0)
    {
      +[AVEnhanceDialogueOptInManager sharedInstance](AVEnhanceDialogueOptInManager, "sharedInstance");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "optOutEnhanceDialogueController:", a1);
      goto LABEL_16;
    }
  }
}

- (void)_updateCurrentAudioRouteSupported
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id buf[2];

  if (a1)
  {
    _AVLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AC4B1000, v2, OS_LOG_TYPE_DEFAULT, "Checking Enhance Dialogue support for current audio route.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, a1);
    +[AVEnhanceDialogueController queue](AVEnhanceDialogueController, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__AVEnhanceDialogueController__updateCurrentAudioRouteSupported__block_invoke;
    block[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v5, buf);
    dispatch_async(v3, block);

    objc_destroyWeak(&v5);
    objc_destroyWeak(buf);
  }
}

void __64__AVEnhanceDialogueController__updateCurrentAudioRouteSupported__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  int v4;
  int v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD block[4];
  id v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "enhanceDialogueEnabled");

    if (v4)
    {
      v30 = 0;
      v5 = objc_msgSend(MEMORY[0x1E0C89A50], "currentRouteSupportsEnhanceDialogue:", &v30);
      v6 = v30;
      if (v6)
      {
        _AVLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "localizedDescription");
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v19 = objc_msgSend(v18, "cStringUsingEncoding:", 4);
          *(_DWORD *)buf = 136315138;
          v33 = v19;
          _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Unable to check audio route for Enhance Dialogue support: %s", buf, 0xCu);

        }
      }
      if (v5)
      {
        objc_msgSend(WeakRetained, "playerController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "player");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "audioSession");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "routingContextUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C8B2A8], "outputContextForID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v22 = v10;
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v12, "outputDevices");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v15)
          {
            v20 = v9;
            v21 = v8;
            v16 = *(_QWORD *)v27;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v14);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "deviceType"))
                {
                  LODWORD(v15) = 1;
                  goto LABEL_20;
                }
              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
              if (v15)
                continue;
              break;
            }
LABEL_20:
            v9 = v20;
            v8 = v21;
          }

          v10 = v22;
        }
        else
        {
          LODWORD(v15) = 0;
        }

      }
      else
      {
        LODWORD(v15) = 0;
      }

      if ((_DWORD)v15)
        LOBYTE(v4) = v5;
      else
        LOBYTE(v4) = 0;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__AVEnhanceDialogueController__updateCurrentAudioRouteSupported__block_invoke_29;
    block[3] = &unk_1E5BB4CC8;
    objc_copyWeak(&v24, v1);
    v25 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v24);
  }

}

void __64__AVEnhanceDialogueController__updateCurrentAudioRouteSupported__block_invoke_29(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 40))
        v4 = CFSTR("YES");
      else
        v4 = CFSTR("NO");
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "Enhance Dialogue support for current audio route: %@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(WeakRetained, "setCurrentAudioRouteSupported:", *(unsigned __int8 *)(a1 + 40));
  }

}

void __49__AVEnhanceDialogueController__startObservations__block_invoke_3(uint64_t a1, void *a2)
{
  -[AVEnhanceDialogueController _updateCurrentAudioRouteSupported](a2);
}

void __49__AVEnhanceDialogueController__startObservations__block_invoke_2(uint64_t a1, void *a2)
{
  -[AVEnhanceDialogueController _updateCurrentAudioRouteSupported](a2);
}

void __49__AVEnhanceDialogueController__startObservations__block_invoke(uint64_t a1, void *a2)
{
  -[AVEnhanceDialogueController _updateActuallyEnabledStateIfNeeded](a2);
}

+ (id)queue
{
  if (queue_onceToken != -1)
    dispatch_once(&queue_onceToken, &__block_literal_global_18026);
  return (id)queue_queue;
}

void __36__AVEnhanceDialogueController_queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AVKit.EnhanceDialogue", 0);
  v1 = (void *)queue_queue;
  queue_queue = (uint64_t)v0;

}

@end
