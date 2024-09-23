@implementation CKReusableVideoPlayer

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKReusableVideoPlayer removeRateObserverIfNecessary](self, "removeRateObserverIfNecessary");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKReusableVideoPlayer;
  -[CKReusableVideoPlayer dealloc](&v4, sel_dealloc);
}

- (CKReusableVideoPlayer)init
{
  CKReusableVideoPlayer *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKReusableVideoPlayer;
  v2 = -[CKReusableVideoPlayer init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_selectedConversationChanged, CFSTR("CKConversationListSelectionDidChangeNotification"), 0);

  }
  return v2;
}

- (void)configureWithPlayerItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (-[CKReusableVideoPlayer isObservingPlayer](self, "isObservingPlayer"))
    -[CKReusableVideoPlayer removeRateObserverIfNecessary](self, "removeRateObserverIfNecessary");
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B2E8]), "initWithPlayerItem:", v4);

  -[CKReusableVideoPlayer playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlayer:", v6);

  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("rate"), 3, CKReusableVideoPlayerObservationContext);
  -[CKReusableVideoPlayer setObservingPlayer:](self, "setObservingPlayer:", 1);

}

- (void)removeCurrentPlayerItem
{
  id v3;

  -[CKReusableVideoPlayer removeRateObserverIfNecessary](self, "removeRateObserverIfNecessary");
  -[CKReusableVideoPlayer playerViewController](self, "playerViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlayer:", 0);

}

- (void)willDisappear
{
  -[CKReusableVideoPlayer setWasPlayingBeforeDisappearing:](self, "setWasPlayingBeforeDisappearing:", -[CKReusableVideoPlayer isPlaying](self, "isPlaying"));
}

- (void)windowDidClose
{
  if (!-[CKReusableVideoPlayer isPictureInPictureActive](self, "isPictureInPictureActive"))
    -[CKReusableVideoPlayer pause](self, "pause");
}

- (BOOL)isReadyForReuse
{
  if (-[CKReusableVideoPlayer isPictureInPictureActive](self, "isPictureInPictureActive"))
    return 0;
  else
    return !-[CKReusableVideoPlayer wasPlayingBeforeDisappearing](self, "wasPlayingBeforeDisappearing");
}

- (void)pause
{
  void *v2;
  id v3;

  -[CKReusableVideoPlayer playerViewController](self, "playerViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (BOOL)isPictureInPictureActive
{
  void *v2;
  char v3;

  -[CKReusableVideoPlayer playerViewController](self, "playerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPictureInPictureActive");

  return v3;
}

- (void)selectedConversationChanged
{
  if (!-[CKReusableVideoPlayer isPictureInPictureActive](self, "isPictureInPictureActive"))
  {
    -[CKReusableVideoPlayer pause](self, "pause");
    -[CKReusableVideoPlayer setWasPlayingBeforeDisappearing:](self, "setWasPlayingBeforeDisappearing:", 0);
  }
}

- (AVPlayerViewController)playerViewController
{
  AVPlayerViewController *playerViewController;
  AVPlayerViewController *v4;
  AVPlayerViewController *v5;

  playerViewController = self->_playerViewController;
  if (!playerViewController)
  {
    v4 = (AVPlayerViewController *)objc_alloc_init(MEMORY[0x1E0C8B448]);
    v5 = self->_playerViewController;
    self->_playerViewController = v4;

    if ((objc_msgSend(MEMORY[0x1E0CEA508], "__ck_currentDeviceIsPadOrMac") & 1) == 0)
      -[AVPlayerViewController setShowsMinimalPlaybackControlsWhenEmbeddedInline:](self->_playerViewController, "setShowsMinimalPlaybackControlsWhenEmbeddedInline:", 1);
    playerViewController = self->_playerViewController;
  }
  return playerViewController;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  float v9;
  float v10;
  id v11;
  objc_super v12;

  if ((void *)CKReusableVideoPlayerObservationContext == a6)
  {
    -[CKReusableVideoPlayer playerViewController](self, "playerViewController", a3, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rate");
    v10 = v9;

    if (v10 == 0.0)
    {
      -[CKReusableVideoPlayer setPlaying:](self, "setPlaying:", 0);
      -[CKReusableVideoPlayer delegate](self, "delegate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reusablePlayerDidStop");
    }
    else
    {
      -[CKReusableVideoPlayer setPlaying:](self, "setPlaying:", 1);
      -[CKReusableVideoPlayer delegate](self, "delegate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reusablePlayerDidStart");
    }

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKReusableVideoPlayer;
    -[CKReusableVideoPlayer observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)removeRateObserverIfNecessary
{
  void *v3;
  void *v4;

  if (-[CKReusableVideoPlayer isObservingPlayer](self, "isObservingPlayer"))
  {
    -[CKReusableVideoPlayer playerViewController](self, "playerViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("rate"), CKReusableVideoPlayerObservationContext);

    -[CKReusableVideoPlayer setObservingPlayer:](self, "setObservingPlayer:", 0);
  }
}

- (NSString)videoTransferGUID
{
  return self->_videoTransferGUID;
}

- (void)setVideoTransferGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CKReusableVideoPlayerDelegate)delegate
{
  return (CKReusableVideoPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewController, a3);
}

- (BOOL)isObservingPlayer
{
  return self->_observingPlayer;
}

- (void)setObservingPlayer:(BOOL)a3
{
  self->_observingPlayer = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (BOOL)wasPlayingBeforeDisappearing
{
  return self->_wasPlayingBeforeDisappearing;
}

- (void)setWasPlayingBeforeDisappearing:(BOOL)a3
{
  self->_wasPlayingBeforeDisappearing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_videoTransferGUID, 0);
}

@end
