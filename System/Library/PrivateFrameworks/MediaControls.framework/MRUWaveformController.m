@implementation MRUWaveformController

- (MRUWaveformController)init
{
  MRUWaveformController *v2;
  uint64_t v3;
  MRUWaveformData *waveform;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MRNowPlayingController *mrNowPlayingController;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MRUWaveformController;
  v2 = -[MRUWaveformController init](&v19, sel_init);
  if (v2)
  {
    +[MRUWaveformData zero](MRUWaveformData, "zero");
    v3 = objc_claimAutoreleasedReturnValue();
    waveform = v2->_waveform;
    v2->_waveform = (MRUWaveformData *)v3;

    __asm { FMOV            V0.2D, #30.0 }
    v2->_artworkFittingSize = _Q0;
    v10 = objc_alloc(MEMORY[0x1E0D4C5A8]);
    objc_msgSend(MEMORY[0x1E0D4C548], "proactiveDestination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithDestination:", v11);

    -[MRNowPlayingController configuration](v2->_mrNowPlayingController, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRequestPlaybackQueue:", 0);

    -[MRNowPlayingController configuration](v2->_mrNowPlayingController, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRequestPlaybackState:", 0);

    -[MRNowPlayingController configuration](v2->_mrNowPlayingController, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRequestSupportedCommands:", 0);

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4C5A0]), "initWithConfiguration:", v12);
    mrNowPlayingController = v2->_mrNowPlayingController;
    v2->_mrNowPlayingController = (MRNowPlayingController *)v16;

    -[MRNowPlayingController setDelegate:](v2->_mrNowPlayingController, "setDelegate:", v2);
    -[MRNowPlayingController beginLoadingUpdates](v2->_mrNowPlayingController, "beginLoadingUpdates");

  }
  return v2;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p - analyzingAudio=%u playing=%u, visible=%u, routeSupportsWaveform=%u, pid=%u>"), objc_opt_class(), self, self->_isAnalyzingAudio, self->_playing, self->_visible, self->_routeSupportsWaveform, self->_nowPlayingPID);
}

- (void)dealloc
{
  objc_super v3;

  -[MRUAudioAnalyzer removeObserver:](self->_audioAnalyzer, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)MRUWaveformController;
  -[MRUWaveformController dealloc](&v3, sel_dealloc);
}

- (void)updateAnalyzer
{
  NSObject *v3;
  int nowPlayingPID;
  MRUAudioAnalyzer *v5;
  MRUAudioAnalyzer *audioAnalyzer;
  void *v7;
  NSObject *v8;
  MRUAudioAnalyzer *v9;
  NSObject *v10;
  MRUAudioAnalyzer *v11;
  void *v12;
  int v13;
  MRUWaveformController *v14;
  __int16 v15;
  MRUAudioAnalyzer *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_playing && self->_visible && self->_routeSupportsWaveform && self->_nowPlayingPID)
  {
    if (-[MRUAudioAnalyzer pid](self->_audioAnalyzer, "pid") != self->_nowPlayingPID)
    {
      MCLogCategoryDefault();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        nowPlayingPID = self->_nowPlayingPID;
        v13 = 138412546;
        v14 = self;
        v15 = 1024;
        LODWORD(v16) = nowPlayingPID;
        _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "%@ Creating new audio analyzer for PID: %u", (uint8_t *)&v13, 0x12u);
      }

      -[MRUAudioAnalyzer removeObserver:](self->_audioAnalyzer, "removeObserver:", self);
      self->_isAnalyzingAudio = 0;
      +[MRUAudioAnalyzer audioAnalyzerForPID:](MRUAudioAnalyzer, "audioAnalyzerForPID:", self->_nowPlayingPID);
      v5 = (MRUAudioAnalyzer *)objc_claimAutoreleasedReturnValue();
      audioAnalyzer = self->_audioAnalyzer;
      self->_audioAnalyzer = v5;

    }
    if (!self->_isAnalyzingAudio)
    {
      +[MRUWaveformData zero](MRUWaveformData, "zero");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUWaveformController setWaveform:](self, "setWaveform:", v7);

      MCLogCategoryDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_audioAnalyzer;
        v13 = 138412546;
        v14 = self;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "%@ Starting audio analyzer: %@", (uint8_t *)&v13, 0x16u);
      }

      -[MRUAudioAnalyzer addObserver:](self->_audioAnalyzer, "addObserver:", self);
      self->_isAnalyzingAudio = 1;
    }
  }
  else if (self->_audioAnalyzer && self->_isAnalyzingAudio)
  {
    MCLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_audioAnalyzer;
      v13 = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_DEFAULT, "%@ Stopping audio analyzer: %@", (uint8_t *)&v13, 0x16u);
    }

    -[MRUAudioAnalyzer removeObserver:](self->_audioAnalyzer, "removeObserver:", self);
    self->_isAnalyzingAudio = 0;
    +[MRUWaveformData zero](MRUWaveformData, "zero");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUWaveformController setWaveform:](self, "setWaveform:", v12);

  }
}

- (void)setNowPlayingController:(id)a3
{
  MRUNowPlayingController *v5;
  MRUNowPlayingController *nowPlayingController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MRUNowPlayingController *v11;

  v5 = (MRUNowPlayingController *)a3;
  nowPlayingController = self->_nowPlayingController;
  v11 = v5;
  if (nowPlayingController != v5)
  {
    -[MRUNowPlayingController removeObserver:](nowPlayingController, "removeObserver:", self);
    objc_storeStrong((id *)&self->_nowPlayingController, a3);
    -[MRUNowPlayingController metadataController](v11, "metadataController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nowPlayingInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUWaveformController setPlaying:](self, "setPlaying:", objc_msgSend(v8, "isPlaying"));

    -[MRUNowPlayingController endpointController](v11, "endpointController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "route");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUWaveformController setEndpointRoute:](self, "setEndpointRoute:", v10);

    -[MRUNowPlayingController addObserver:](v11, "addObserver:", self);
  }

}

- (void)setNowPlayingPID:(int)a3
{
  NSObject *v5;
  int nowPlayingPID;
  int v7;
  MRUWaveformController *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_nowPlayingPID != a3)
  {
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      nowPlayingPID = self->_nowPlayingPID;
      v7 = 138412802;
      v8 = self;
      v9 = 1024;
      v10 = nowPlayingPID;
      v11 = 1024;
      v12 = a3;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%@ nowPlaying PID changing from: %u to: %u", (uint8_t *)&v7, 0x18u);
    }

    self->_nowPlayingPID = a3;
    -[MRUWaveformController updateAnalyzer](self, "updateAnalyzer");
  }
}

- (void)setVisible:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  int v7;
  MRUWaveformController *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_visible != a3)
  {
    v3 = a3;
    self->_visible = a3;
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = self;
      v9 = 1024;
      v10 = v3;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%@ isVisible changed to: %u", (uint8_t *)&v7, 0x12u);
    }

    -[MRUWaveformController updateRoute:](self, "updateRoute:", self->_endpointRoute);
    -[MRUWaveformController updateAnalyzer](self, "updateAnalyzer");
    -[MRUWaveformController nowPlayingController](self, "nowPlayingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateAutomaticResponseLoading");

  }
}

- (void)setPlaying:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  MRUWaveformController *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_playing != a3)
  {
    v3 = a3;
    self->_playing = a3;
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%@ isPlaying changed to: %u", (uint8_t *)&v6, 0x12u);
    }

    -[MRUWaveformController updateAnalyzer](self, "updateAnalyzer");
  }
}

- (void)setWaveform:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_waveform, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "waveformController:waveformDidChange:", self, v5);

}

- (void)setRouteSupportsWaveform:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  MRUWaveformController *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_routeSupportsWaveform != a3)
  {
    v3 = a3;
    self->_routeSupportsWaveform = a3;
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%@ routeSupportsWaveform changed to: %{BOOL}u", (uint8_t *)&v6, 0x12u);
    }

    -[MRUWaveformController updateAnalyzer](self, "updateAnalyzer");
  }
}

- (void)setArtworkImage:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_artworkImage, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "waveformController:artworkImageDidChange:", self, v5);

}

- (void)setEndpointRoute:(id)a3
{
  MPAVEndpointRoute *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  MRUWaveformController *v11;
  __int16 v12;
  MPAVEndpointRoute *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (MPAVEndpointRoute *)a3;
  if (self->_endpointRoute != v5)
  {
    objc_storeStrong((id *)&self->_endpointRoute, a3);
    MCLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "%@ endpointRoute changed to: %@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0CC1CD0];
    objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0CC1CD0], 0);

    -[MRUWaveformController updateRoute:](self, "updateRoute:", v5);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_routeDidUpdateNotification_, v8, v5);

    }
  }

}

- (void)routeDidUpdateNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MRUWaveformController_routeDidUpdateNotification___block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __52__MRUWaveformController_routeDidUpdateNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRoute:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)updateRoute:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  MRUWaveformController *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  MCLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_INFO, "%@ updating info from route: %@", buf, 0x16u);
  }

  objc_msgSend(v4, "endpointObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v14, "isLocalDevice"))
        {
          if (objc_msgSend(v14, "deviceSubtype") == 19
            || objc_msgSend(v14, "deviceType") == 3)
          {
            v11 = 1;
          }
        }
        else
        {
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  -[MRUWaveformController setRouteSupportsWaveform:](self, "setRouteSupportsWaveform:", ((v10 | v11) & 1) == 0);

}

- (void)updateImage:(id)a3
{
  id v4;

  +[MRUImageUtilities formatImage:forDisplayAtSize:](MRUImageUtilities, "formatImage:forDisplayAtSize:", a3, self->_artworkFittingSize.width, self->_artworkFittingSize.height);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUWaveformController setArtworkImage:](self, "setArtworkImage:", v4);

}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  -[MRUWaveformController updateImage:](self, "updateImage:", a4);
}

- (void)audioAnalyzer:(id)a3 didUpdateWaveform:(id)a4
{
  -[MRUWaveformController setWaveform:](self, "setWaveform:", a4);
}

- (void)controller:(id)a3 playerPathDidChange:(id)a4
{
  void *v5;
  int v6;
  _QWORD v7[5];
  int v8;

  objc_msgSend(a4, "client", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "processIdentifier");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MRUWaveformController_controller_playerPathDidChange___block_invoke;
  v7[3] = &unk_1E581A1B0;
  v7[4] = self;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v7);
}

uint64_t __56__MRUWaveformController_controller_playerPathDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNowPlayingPID:", *(unsigned int *)(a1 + 40));
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_visible;
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__MRUWaveformController_nowPlayingController_metadataController_didChangeNowPlayingInfo___block_invoke;
  v8[3] = &unk_1E5818CB0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __89__MRUWaveformController_nowPlayingController_metadataController_didChangeNowPlayingInfo___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setPlaying:", objc_msgSend(*(id *)(a1 + 40), "isPlaying"));
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v4;

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(WeakRetained, "waveformControllerTrackDidChange:", *(_QWORD *)(a1 + 32));

  }
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__MRUWaveformController_nowPlayingController_endpointController_didChangeRoute___block_invoke;
  v8[3] = &unk_1E5818CB0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __80__MRUWaveformController_nowPlayingController_endpointController_didChangeRoute___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEndpointRoute:", *(_QWORD *)(a1 + 40));
}

- (MRUWaveformData)waveform
{
  return self->_waveform;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)routeSupportsWaveform
{
  return self->_routeSupportsWaveform;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (MRUNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (MRUWaveformControllerDelegate)delegate
{
  return (MRUWaveformControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRUAudioAnalyzer)audioAnalyzer
{
  return self->_audioAnalyzer;
}

- (void)setAudioAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_audioAnalyzer, a3);
}

- (MRNowPlayingController)mrNowPlayingController
{
  return self->_mrNowPlayingController;
}

- (void)setMrNowPlayingController:(id)a3
{
  objc_storeStrong((id *)&self->_mrNowPlayingController, a3);
}

- (MPAVEndpointRoute)endpointRoute
{
  return self->_endpointRoute;
}

- (BOOL)isAnalyzingAudio
{
  return self->_isAnalyzingAudio;
}

- (void)setIsAnalyzingAudio:(BOOL)a3
{
  self->_isAnalyzingAudio = a3;
}

- (CGSize)artworkFittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_artworkFittingSize.width;
  height = self->_artworkFittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setArtworkFittingSize:(CGSize)a3
{
  self->_artworkFittingSize = a3;
}

- (NSString)trackIdentifier
{
  return self->_trackIdentifier;
}

- (void)setTrackIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_trackIdentifier, a3);
}

- (int)nowPlayingPID
{
  return self->_nowPlayingPID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointRoute, 0);
  objc_storeStrong((id *)&self->_mrNowPlayingController, 0);
  objc_storeStrong((id *)&self->_audioAnalyzer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_waveform, 0);
}

@end
