@implementation LPiTunesPlayButtonControl

- (LPiTunesPlayButtonControl)initWithPlaybackInformation:(id)a3 style:(id)a4 theme:(id)a5
{
  id v9;
  LPiTunesPlayButtonControl *v10;
  LPiTunesPlayButtonControl *v11;
  LPiTunesPlayButtonControl *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPiTunesPlayButtonControl;
  v10 = -[LPPlayButtonControl initWithStyle:theme:](&v14, sel_initWithStyle_theme_, a4, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_playbackInformation, a3);
    v12 = v11;
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_playbackDidEndNotificationToken);

  v4.receiver = self;
  v4.super_class = (Class)LPiTunesPlayButtonControl;
  -[LPiTunesPlayButtonControl dealloc](&v4, sel_dealloc);
}

- (void)updatePlayState
{
  void *v3;
  _BOOL4 v4;
  int v5;
  double v6;
  id v7;
  id v8;
  id v9;

  -[LPiTunesPlayButtonControl window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[LPiTunesPlayButtonControl matchesNowPlayingItem](self, "matchesNowPlayingItem");
    if (-[LPPlayButtonControl isIndeterminate](self, "isIndeterminate"))
    {
      if (v4)
      {
        +[LPMediaRemotePlaybackObserver shared](LPMediaRemotePlaybackObserver, "shared");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v7, "isPlaying");

        if (v5)
          -[LPPlayButtonControl endIndeterminateAnimation](self, "endIndeterminateAnimation");
      }
    }
    if (v4 || -[LPPlayButtonControl isIndeterminate](self, "isIndeterminate"))
    {
      -[LPPlayButtonControl setPlayButtonState:](self, "setPlayButtonState:", 1);
      if (!-[LPPlayButtonControl isIndeterminate](self, "isIndeterminate"))
      {
        if (v4)
        {
          +[LPMediaRemotePlaybackObserver shared](LPMediaRemotePlaybackObserver, "shared");
          v8 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "elapsedFractionForPlaybackInformation:", self->_playbackInformation);
          *(float *)&v6 = v6;
          -[LPPlayButtonControl setProgress:animated:](self, "setProgress:animated:", 1, v6);

          +[LPMediaRemotePlaybackObserver shared](LPMediaRemotePlaybackObserver, "shared");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          -[LPPlayButtonControl showPlayIndicator:](self, "showPlayIndicator:", objc_msgSend(v9, "isPlaying") ^ 1);

          return;
        }
        goto LABEL_13;
      }
    }
    else
    {
      -[LPPlayButtonControl setPlayButtonState:](self, "setPlayButtonState:", 0);
      if (!-[LPPlayButtonControl isIndeterminate](self, "isIndeterminate"))
      {
LABEL_13:
        -[LPPlayButtonControl hideProgressAnimated:](self, "hideProgressAnimated:", 0);
        -[LPPlayButtonControl showPlayIndicator:](self, "showPlayIndicator:", 1);
      }
    }
  }
}

- (double)desiredUpdateIntervalForMediaRemotePlaybackObserver:(id)a3
{
  void *v3;
  double v4;

  -[LPInlineMediaPlaybackInformation lyricExcerpt](self->_playbackInformation, "lyricExcerpt", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0.1;
  else
    v4 = 0.5;

  return v4;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPiTunesPlayButtonControl;
  -[LPiTunesPlayButtonControl didMoveToWindow](&v6, sel_didMoveToWindow);
  -[LPiTunesPlayButtonControl window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[LPMediaRemotePlaybackObserver shared](LPMediaRemotePlaybackObserver, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "addClient:", self);

    -[LPiTunesPlayButtonControl updatePlayState](self, "updatePlayState");
  }
  else
  {
    objc_msgSend(v4, "removeClient:", self);

  }
}

- (void)startPlaybackForLyricExcerpt
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void **v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *playbackDidEndNotificationToken;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(getMPMusicPlayerControllerClass(), "systemMusicPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getMPMusicPlayerControllerClass(), "applicationMusicPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wasPlayingMusicWhenLyricExcerptPlaybackStarted = objc_msgSend(v3, "playbackState") == 1;
  v5 = MEMORY[0x1E0C809B0];
  if (!self->_playbackDidEndNotificationToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v37 = (uint64_t)&v36;
    v38 = 0x2020000000;
    v7 = (void **)getMPMusicPlayerControllerItemPlaybackDidEndNotificationSymbolLoc_ptr;
    v39 = (void *)getMPMusicPlayerControllerItemPlaybackDidEndNotificationSymbolLoc_ptr;
    if (!getMPMusicPlayerControllerItemPlaybackDidEndNotificationSymbolLoc_ptr)
    {
      v8 = MediaPlayerLibrary_0();
      v7 = (void **)dlsym(v8, "MPMusicPlayerControllerItemPlaybackDidEndNotification");
      *(_QWORD *)(v37 + 24) = v7;
      getMPMusicPlayerControllerItemPlaybackDidEndNotificationSymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&v36, 8);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMusicPlayerControllerItemPlaybackDidEndNotification(void)");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("LPiTunesPlayButtonControl.m"), 29, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v9 = *v7;
    v34[0] = v5;
    v34[1] = 3221225472;
    v34[2] = __57__LPiTunesPlayButtonControl_startPlaybackForLyricExcerpt__block_invoke;
    v34[3] = &unk_1E44A9140;
    v34[4] = self;
    v35 = v3;
    v10 = v9;
    objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v10, 0, 0, v34);
    v11 = objc_claimAutoreleasedReturnValue();
    playbackDidEndNotificationToken = self->_playbackDidEndNotificationToken;
    self->_playbackDidEndNotificationToken = v11;

  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x2050000000;
  v13 = (void *)getMPMusicPlayerStoreQueueDescriptorClass_softClass;
  v44 = getMPMusicPlayerStoreQueueDescriptorClass_softClass;
  if (!getMPMusicPlayerStoreQueueDescriptorClass_softClass)
  {
    v36 = v5;
    v37 = 3221225472;
    v38 = (uint64_t)__getMPMusicPlayerStoreQueueDescriptorClass_block_invoke;
    v39 = &unk_1E44A7DB0;
    v40 = &v41;
    __getMPMusicPlayerStoreQueueDescriptorClass_block_invoke((uint64_t)&v36);
    v13 = (void *)v42[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v41, 8);
  v15 = [v14 alloc];
  -[LPInlineMediaPlaybackInformation storeIdentifier](self->_playbackInformation, "storeIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithStoreIDs:", v17);

  -[LPInlineMediaPlaybackInformation lyricExcerpt](self->_playbackInformation, "lyricExcerpt");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "startTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;
  -[LPInlineMediaPlaybackInformation storeIdentifier](self->_playbackInformation, "storeIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setStartTime:forItemWithStoreID:", v23, v22 + -1.0);

  -[LPInlineMediaPlaybackInformation lyricExcerpt](self->_playbackInformation, "lyricExcerpt");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "endTime");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v27 = v26;
  -[LPInlineMediaPlaybackInformation storeIdentifier](self->_playbackInformation, "storeIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEndTime:forItemWithStoreID:", v28, v27 + 1.0);

  objc_msgSend(v18, "setPlayActivityFeatureName:", CFSTR("iMessage_LyricsShare"));
  objc_msgSend(v4, "setQueueWithDescriptor:", v18);
  v32[0] = v5;
  v32[1] = 3221225472;
  v32[2] = __57__LPiTunesPlayButtonControl_startPlaybackForLyricExcerpt__block_invoke_2;
  v32[3] = &unk_1E44A9168;
  v29 = v4;
  v33 = v29;
  objc_msgSend(v29, "prepareToPlayWithCompletionHandler:", v32);

}

void __57__LPiTunesPlayButtonControl_startPlaybackForLyricExcerpt__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 568))
  {
    objc_msgSend(*(id *)(a1 + 40), "play");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 568) = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560));

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 560);
  *(_QWORD *)(v4 + 560) = 0;

}

uint64_t __57__LPiTunesPlayButtonControl_startPlaybackForLyricExcerpt__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "play");
}

- (_MRSystemAppPlaybackQueue)createPlaybackQueue
{
  uint64_t *p_playbackInformation;
  void *v3;
  _MRSystemAppPlaybackQueue *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  p_playbackInformation = (uint64_t *)&self->_playbackInformation;
  -[LPInlineMediaPlaybackInformation storeIdentifier](self->_playbackInformation, "storeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v14 = LPLogChannelFetching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[LPiTunesPlayButtonControl createPlaybackQueue].cold.1(p_playbackInformation, v14);
    abort();
  }
  switch(objc_msgSend((id)*p_playbackInformation, "type"))
  {
    case 0:
    case 1:
    case 5:
      v4 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
      objc_msgSend((id)*p_playbackInformation, "storeIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

      MRSystemAppPlaybackQueueSetFeatureName();
      break;
    case 2:
      v4 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
      MRSystemAppPlaybackQueueSetRadioStationIDType();
      objc_msgSend((id)*p_playbackInformation, "storeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      MRSystemAppPlaybackQueueSetRadioStationStringIdentifier();
      goto LABEL_8;
    case 3:
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)*p_playbackInformation, "storeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("podcasts://playPodcast?storeCollectionId=%@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
      v15 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

      break;
    case 4:
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)*p_playbackInformation, "storeIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("podcasts://playPodcast?storeTrackId=%@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
      v16 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

      break;
    case 6:
      v4 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
      objc_msgSend((id)*p_playbackInformation, "persistentIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "longLongValue");
      MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID();
LABEL_8:

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (id)mediaPlaybackApplicationID
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[LPInlineMediaPlaybackInformation type](self->_playbackInformation, "type");
  if (v2 > 6)
    return 0;
  if (((1 << v2) & 0x27) != 0)
  {
    v3 = (__CFString *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  }
  else
  {
    if (((1 << v2) & 0x18) != 0)
      return CFSTR("com.apple.podcasts");
    v3 = CFSTR("com.apple.iBooks");
  }
  return v3;
}

- (void)startPlaying
{
  void *v3;
  void *v4;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__LPiTunesPlayButtonControl_startPlaying__block_invoke;
  block[3] = &unk_1E44A7CE8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  -[LPInlineMediaPlaybackInformation lyricExcerpt](self->_playbackInformation, "lyricExcerpt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPiTunesPlayButtonControl startPlaybackForLyricExcerpt](self, "startPlaybackForLyricExcerpt");
  }
  else
  {
    -[LPiTunesPlayButtonControl createPlaybackQueue](self, "createPlaybackQueue");
    MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
    MRSystemAppPlaybackQueueSetShouldOverrideManuallyCuratedQueue();
    -[LPiTunesPlayButtonControl mediaPlaybackApplicationID](self, "mediaPlaybackApplicationID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemoteSetAppPlaybackQueue();

  }
}

uint64_t __41__LPiTunesPlayButtonControl_startPlaying__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "beginIndeterminateAnimation");
  return objc_msgSend(*(id *)(a1 + 32), "updatePlayState");
}

- (void)buttonPressed:(id)a3
{
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (-[LPiTunesPlayButtonControl matchesNowPlayingItem](self, "matchesNowPlayingItem", a3))
  {
    v4 = *MEMORY[0x1E0D4CCC0];
    v5[0] = CFSTR("com.apple.LinkPresentation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    MRMediaRemoteSendCommand();
  }
  else
  {
    -[LPiTunesPlayButtonControl startPlaying](self, "startPlaying");
  }
}

- (BOOL)matchesNowPlayingItem
{
  void *v3;

  +[LPMediaRemotePlaybackObserver shared](LPMediaRemotePlaybackObserver, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "playbackInformationMatchesPlayingItem:", self->_playbackInformation);

  return (char)self;
}

- (BOOL)isPlaying
{
  void *v2;
  char v3;

  if (!-[LPiTunesPlayButtonControl matchesNowPlayingItem](self, "matchesNowPlayingItem"))
    return 0;
  +[LPMediaRemotePlaybackObserver shared](LPMediaRemotePlaybackObserver, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaying");

  return v3;
}

- (BOOL)hasMuteControl
{
  return 0;
}

- (void)setPlaying:(BOOL)a3
{
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (-[LPiTunesPlayButtonControl matchesNowPlayingItem](self, "matchesNowPlayingItem"))
  {
    v4 = *MEMORY[0x1E0D4CCC0];
    v5[0] = CFSTR("com.apple.LinkPresentation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    MRMediaRemoteSendCommand();
  }
  else
  {
    -[LPiTunesPlayButtonControl startPlaying](self, "startPlaying");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackDidEndNotificationToken, 0);
  objc_storeStrong((id *)&self->_playbackInformation, 0);
}

- (void)createPlaybackQueue
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A0C41000, a2, OS_LOG_TYPE_ERROR, "store identifier for playback information %@ is nil", (uint8_t *)&v3, 0xCu);
}

@end
