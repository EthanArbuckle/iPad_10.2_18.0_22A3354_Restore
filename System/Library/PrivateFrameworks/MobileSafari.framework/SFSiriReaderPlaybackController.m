@implementation SFSiriReaderPlaybackController

+ (SFSiriReaderPlaybackController)sharedPlaybackController
{
  if (sharedPlaybackController_onceToken != -1)
    dispatch_once(&sharedPlaybackController_onceToken, &__block_literal_global_0);
  return (SFSiriReaderPlaybackController *)(id)sharedPlaybackController_sharedPlaybackController;
}

void __58__SFSiriReaderPlaybackController_sharedPlaybackController__block_invoke()
{
  SFSiriReaderPlaybackController *v0;
  void *v1;

  v0 = objc_alloc_init(SFSiriReaderPlaybackController);
  v1 = (void *)sharedPlaybackController_sharedPlaybackController;
  sharedPlaybackController_sharedPlaybackController = (uint64_t)v0;

}

- (void)setupNowPlayingListenerIfNeeded
{
  MRDestination *v3;
  MRDestination *destination;
  MRNowPlayingController *v5;
  MRNowPlayingController *playbackController;

  if (!self->_playbackController)
  {
    objc_msgSend(MEMORY[0x1E0D4C548], "localDestination");
    v3 = (MRDestination *)objc_claimAutoreleasedReturnValue();
    destination = self->_destination;
    self->_destination = v3;

    v5 = (MRNowPlayingController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C5A0]), "initWithDestination:", self->_destination);
    playbackController = self->_playbackController;
    self->_playbackController = v5;

    -[MRNowPlayingController setDelegate:](self->_playbackController, "setDelegate:", self);
    -[MRNowPlayingController beginLoadingUpdates](self->_playbackController, "beginLoadingUpdates");
  }
}

- (void)play
{
  NSObject *This;
  uint8_t v4[16];

  This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B7B2000, This, OS_LOG_TYPE_DEFAULT, "Safari requested unpausing playback", v4, 2u);
  }
  -[MRNowPlayingController sendCommand:options:completion:](self->_playbackController, "sendCommand:options:completion:", 0, 0, &__block_literal_global_4);
}

void __38__SFSiriReaderPlaybackController_play__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *This;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_ERROR))
      __38__SFSiriReaderPlaybackController_play__block_invoke_cold_1(This);
  }

}

- (void)pause
{
  NSObject *This;
  uint8_t v4[16];

  This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B7B2000, This, OS_LOG_TYPE_DEFAULT, "Safari requested pausing playback", v4, 2u);
  }
  -[MRNowPlayingController sendCommand:options:completion:](self->_playbackController, "sendCommand:options:completion:", 1, 0, &__block_literal_global_5);
}

void __39__SFSiriReaderPlaybackController_pause__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *This;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_ERROR))
      __39__SFSiriReaderPlaybackController_pause__block_invoke_cold_1(This);
  }

}

- (void)skipForward
{
  NSObject *This;
  uint8_t v4[16];

  This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B7B2000, This, OS_LOG_TYPE_DEFAULT, "Safari requested skipping forward playback", v4, 2u);
  }
  -[MRNowPlayingController sendCommand:options:completion:](self->_playbackController, "sendCommand:options:completion:", 17, 0, &__block_literal_global_6);
}

void __45__SFSiriReaderPlaybackController_skipForward__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *This;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_ERROR))
      __45__SFSiriReaderPlaybackController_skipForward__block_invoke_cold_1(This);
  }

}

- (void)skipBackward
{
  NSObject *This;
  uint8_t v4[16];

  This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B7B2000, This, OS_LOG_TYPE_DEFAULT, "Safari requested skipping backward playback", v4, 2u);
  }
  -[MRNowPlayingController sendCommand:options:completion:](self->_playbackController, "sendCommand:options:completion:", 18, 0, &__block_literal_global_7);
}

void __46__SFSiriReaderPlaybackController_skipBackward__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *This;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_ERROR))
      __46__SFSiriReaderPlaybackController_skipBackward__block_invoke_cold_1(This);
  }

}

+ (BOOL)playerResponseIsForSiriReadThis:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v3 = a3;
  objc_msgSend(v3, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsString:", CFSTR("sirireaderd"));

  if (v7)
  {
    objc_msgSend(v3, "playerPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parentApplicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D8A010]);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setPlaybackRate:(double)a3
{
  NSObject *This;
  MRNowPlayingController *playbackController;
  void *v7;
  void *v8;
  float v9;
  _QWORD v10[5];
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = a3;
    _os_log_impl(&dword_18B7B2000, This, OS_LOG_TYPE_DEFAULT, "Safari requested changing playback rate to %f", buf, 0xCu);
  }
  playbackController = self->_playbackController;
  v11 = *MEMORY[0x1E0D4CC48];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__SFSiriReaderPlaybackController_setPlaybackRate___block_invoke;
  v10[3] = &__block_descriptor_40_e25_v16__0__MRCommandResult_8l;
  *(double *)&v10[4] = a3;
  -[MRNowPlayingController sendCommand:options:completion:](playbackController, "sendCommand:options:completion:", 19, v8, v10);

  v9 = a3;
  self->_currentPlaybackRate = v9;
}

void __50__SFSiriReaderPlaybackController_setPlaybackRate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *This;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_ERROR))
      __50__SFSiriReaderPlaybackController_setPlaybackRate___block_invoke_cold_1(a1, This);
  }

}

- (void)updateContentIdentifierOnQueue:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  if (v6)
  {
    v7 = (objc_class *)MEMORY[0x1E0D4C5B0];
    v8 = a3;
    v9 = (void *)objc_msgSend([v7 alloc], "initWithDestination:", self->_destination);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__SFSiriReaderPlaybackController_updateContentIdentifierOnQueue_completion___block_invoke;
    v10[3] = &unk_1E21E2460;
    v11 = v6;
    objc_msgSend(v9, "requestNowPlayingItemMetadataOnQueue:completion:", v8, v10);

  }
}

void __76__SFSiriReaderPlaybackController_updateContentIdentifierOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *This;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_ERROR))
      __76__SFSiriReaderPlaybackController_updateContentIdentifierOnQueue_completion___block_invoke_cold_1(This);
  }
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "contentIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

- (BOOL)_tearDownListenerIfNowPlayControllerIsTakenOverByResponse:(id)a3
{
  NSString *nowPlayingContentIdentifier;
  void *v5;
  void *v6;
  MRNowPlayingController *playbackController;
  id WeakRetained;
  NSString *v10;

  if (+[SFSiriReaderPlaybackController playerResponseIsForSiriReadThis:](SFSiriReaderPlaybackController, "playerResponseIsForSiriReadThis:", a3))
  {
    return 0;
  }
  nowPlayingContentIdentifier = self->_nowPlayingContentIdentifier;
  +[SFSiriVoiceUtilities sharedVoiceUtilities](SFSiriVoiceUtilities, "sharedVoiceUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeSiriReaderSessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(nowPlayingContentIdentifier) = -[NSString isEqualToString:](nowPlayingContentIdentifier, "isEqualToString:", v6);

  if ((nowPlayingContentIdentifier & 1) != 0)
    return 0;
  -[MRNowPlayingController endLoadingUpdates](self->_playbackController, "endLoadingUpdates");
  playbackController = self->_playbackController;
  self->_playbackController = 0;

  self->_currentPlaybackState = 3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "playbackStateDidChangeForSiriReaderPlaybackController:", self);
  v10 = self->_nowPlayingContentIdentifier;
  self->_nowPlayingContentIdentifier = 0;

  objc_msgSend(WeakRetained, "playbackContentIdentifierDidChangeForSiriReaderPlaybackController:", self);
  return 1;
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  void *v7;
  BOOL v8;
  int64_t v9;
  id WeakRetained;

  objc_msgSend(a3, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SFSiriReaderPlaybackController _tearDownListenerIfNowPlayControllerIsTakenOverByResponse:](self, "_tearDownListenerIfNowPlayControllerIsTakenOverByResponse:", v7);

  if (!v8)
  {
    if (a5 == 2)
    {
      if (self->_currentPlaybackState == 3)
      {
LABEL_9:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "playbackStateDidChangeForSiriReaderPlaybackController:", self);

        return;
      }
      v9 = 2;
    }
    else
    {
      v9 = 0;
    }
    if (a5 == 1)
      v9 = 1;
    self->_currentPlaybackState = v9;
    goto LABEL_9;
  }
}

- (void)controller:(id)a3 playbackRateDidChangeFrom:(float)a4 to:(float)a5
{
  id v7;
  void *v8;
  BOOL v9;
  id v10;

  v7 = a3;
  if (self->_currentPlaybackRate != a5)
  {
    v10 = v7;
    objc_msgSend(v7, "response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SFSiriReaderPlaybackController _tearDownListenerIfNowPlayControllerIsTakenOverByResponse:](self, "_tearDownListenerIfNowPlayControllerIsTakenOverByResponse:", v8);

    v7 = v10;
    if (!v9)
      self->_currentPlaybackRate = a5;
  }

}

- (void)controller:(id)a3 contentItemsDidUpdate:(id)a4
{
  id v6;
  NSString *nowPlayingContentIdentifier;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  id WeakRetained;
  id v13;

  v13 = a3;
  v6 = a4;
  nowPlayingContentIdentifier = self->_nowPlayingContentIdentifier;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(nowPlayingContentIdentifier) = -[NSString isEqualToString:](nowPlayingContentIdentifier, "isEqualToString:", v8);

  if ((nowPlayingContentIdentifier & 1) == 0)
  {
    objc_msgSend(v13, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSiriReaderPlaybackController _tearDownListenerIfNowPlayControllerIsTakenOverByResponse:](self, "_tearDownListenerIfNowPlayControllerIsTakenOverByResponse:", v9);

    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_nowPlayingContentIdentifier;
    self->_nowPlayingContentIdentifier = v10;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "playbackContentIdentifierDidChangeForSiriReaderPlaybackController:", self);

  }
}

- (SFSiriReaderPlaybackControllerDelegate)delegate
{
  return (SFSiriReaderPlaybackControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)currentPlaybackState
{
  return self->_currentPlaybackState;
}

- (void)setCurrentPlaybackState:(int64_t)a3
{
  self->_currentPlaybackState = a3;
}

- (float)currentPlaybackRate
{
  return self->_currentPlaybackRate;
}

- (NSString)nowPlayingContentIdentifier
{
  return self->_nowPlayingContentIdentifier;
}

- (void)setNowPlayingContentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingContentIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingContentIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_playbackController, 0);
}

void __38__SFSiriReaderPlaybackController_play__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18B7B2000, v4, v5, "Failed to start playing media for listening to page with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __39__SFSiriReaderPlaybackController_pause__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18B7B2000, v4, v5, "Failed to pause playing media for listening to page with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __45__SFSiriReaderPlaybackController_skipForward__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18B7B2000, v4, v5, "Failed to skip forward while listening to page with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __46__SFSiriReaderPlaybackController_skipBackward__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18B7B2000, v4, v5, "Failed to skip backward while listening to page with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __50__SFSiriReaderPlaybackController_setPlaybackRate___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = v3;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_18B7B2000, v2, OS_LOG_TYPE_ERROR, "Failed to set the playback speed to %f while listening to page with error: %{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_1();
}

void __76__SFSiriReaderPlaybackController_updateContentIdentifierOnQueue_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18B7B2000, v3, v4, "Failed to request the now playing info while listening to page with error: %{public}@", v5, v6, v7, v8, v9);

}

@end
