@implementation MusicKit_SoftLinking_MPCPlaybackEngine

- (MusicKit_SoftLinking_MPCPlaybackEngine)initWithPlayerID:(id)a3 options:(unint64_t)a4 fallbackPlaybackIntent:(id)a5
{
  char v6;
  id v8;
  id v9;
  MusicKit_SoftLinking_MPCPlaybackEngine *v10;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  MPCPlaybackEngine *underlyingPlaybackEngine;
  MPCPlaybackEngine *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MusicKit_SoftLinking_MPCPlaybackEngine;
  v10 = -[MusicKit_SoftLinking_MPCPlaybackEngine init](&v18, sel_init);
  if (v10)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v11 = (void *)getMPCPlaybackEngineClass_softClass;
    v23 = getMPCPlaybackEngineClass_softClass;
    if (!getMPCPlaybackEngineClass_softClass)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getMPCPlaybackEngineClass_block_invoke;
      v19[3] = &unk_1E9C05688;
      v19[4] = &v20;
      __getMPCPlaybackEngineClass_block_invoke((uint64_t)v19);
      v11 = (void *)v21[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v20, 8);
    v13 = objc_msgSend([v12 alloc], "initWithPlayerID:", v8);
    underlyingPlaybackEngine = v10->_underlyingPlaybackEngine;
    v10->_underlyingPlaybackEngine = (MPCPlaybackEngine *)v13;

    if ((v6 & 1) != 0)
    {
      -[MPCPlaybackEngine setSystemMusicApplication:](v10->_underlyingPlaybackEngine, "setSystemMusicApplication:", 1);
      if ((v6 & 2) == 0)
      {
LABEL_6:
        if ((v6 & 4) == 0)
          goto LABEL_7;
        goto LABEL_14;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_6;
    }
    -[MPCPlaybackEngine setAudioAnalyzerEnabled:](v10->_underlyingPlaybackEngine, "setAudioAnalyzerEnabled:", 1);
    if ((v6 & 4) == 0)
    {
LABEL_7:
      if ((v6 & 8) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
LABEL_14:
    -[MPCPlaybackEngine setPictureInPictureSupported:](v10->_underlyingPlaybackEngine, "setPictureInPictureSupported:", 1);
    if ((v6 & 8) == 0)
    {
LABEL_8:
      if ((v6 & 0x10) == 0)
      {
LABEL_10:
        v15 = v10->_underlyingPlaybackEngine;
        objc_msgSend(v9, "_underlyingPlaybackIntent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlaybackEngine setFallbackPlaybackIntent:](v15, "setFallbackPlaybackIntent:", v16);

        goto LABEL_11;
      }
LABEL_9:
      -[MPCPlaybackEngine setStateRestorationSupported:](v10->_underlyingPlaybackEngine, "setStateRestorationSupported:", 1);
      goto LABEL_10;
    }
LABEL_15:
    -[MPCPlaybackEngine setVideoSupported:](v10->_underlyingPlaybackEngine, "setVideoSupported:", 1);
    if ((v6 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_11:

  return v10;
}

- (NSString)playerID
{
  return (NSString *)-[MPCPlaybackEngine playerID](self->_underlyingPlaybackEngine, "playerID");
}

- (BOOL)isStarted
{
  return -[MPCPlaybackEngine isStarted](self->_underlyingPlaybackEngine, "isStarted");
}

- (BOOL)isSystemMusicApplication
{
  return -[MPCPlaybackEngine isSystemMusicApplication](self->_underlyingPlaybackEngine, "isSystemMusicApplication");
}

- (void)setSystemMusicApplication:(BOOL)a3
{
  -[MPCPlaybackEngine setSystemMusicApplication:](self->_underlyingPlaybackEngine, "setSystemMusicApplication:", a3);
}

- (BOOL)isAudioAnalyzerEnabled
{
  return -[MPCPlaybackEngine isAudioAnalyzerEnabled](self->_underlyingPlaybackEngine, "isAudioAnalyzerEnabled");
}

- (void)setAudioAnalyzerEnabled:(BOOL)a3
{
  -[MPCPlaybackEngine setAudioAnalyzerEnabled:](self->_underlyingPlaybackEngine, "setAudioAnalyzerEnabled:", a3);
}

- (BOOL)isPictureInPictureSupported
{
  return -[MPCPlaybackEngine isPictureInPictureSupported](self->_underlyingPlaybackEngine, "isPictureInPictureSupported");
}

- (void)setPictureInPictureSupported:(BOOL)a3
{
  -[MPCPlaybackEngine setPictureInPictureSupported:](self->_underlyingPlaybackEngine, "setPictureInPictureSupported:", a3);
}

- (BOOL)isVideoSupported
{
  return -[MPCPlaybackEngine isVideoSupported](self->_underlyingPlaybackEngine, "isVideoSupported");
}

- (void)setVideoSupported:(BOOL)a3
{
  -[MPCPlaybackEngine setVideoSupported:](self->_underlyingPlaybackEngine, "setVideoSupported:", a3);
}

- (BOOL)isStateRestorationSupported
{
  return -[MPCPlaybackEngine isStateRestorationSupported](self->_underlyingPlaybackEngine, "isStateRestorationSupported");
}

- (void)setStateRestorationSupported:(BOOL)a3
{
  -[MPCPlaybackEngine setStateRestorationSupported:](self->_underlyingPlaybackEngine, "setStateRestorationSupported:", a3);
}

- (void)start
{
  -[MPCPlaybackEngine start](self->_underlyingPlaybackEngine, "start");
}

- (void)becomeActive
{
  -[MPCPlaybackEngine becomeActive](self->_underlyingPlaybackEngine, "becomeActive");
}

- (void)restoreStateWithCompletion:(id)a3
{
  -[MPCPlaybackEngine restoreStateWithCompletion:](self->_underlyingPlaybackEngine, "restoreStateWithCompletion:", a3);
}

- (void)musicKit_setSystemMusicApplication:(BOOL)a3
{
  self->_systemMusicApplication = a3;
}

- (void)musicKit_setAudioAnalyzerEnabled:(BOOL)a3
{
  self->_audioAnalyzerEnabled = a3;
}

- (void)musicKit_setPictureInPictureSupported:(BOOL)a3
{
  self->_pictureInPictureSupported = a3;
}

- (void)musicKit_setVideoSupported:(BOOL)a3
{
  self->_videoSupported = a3;
}

- (void)musicKit_setStateRestorationSupported:(BOOL)a3
{
  self->_stateRestorationSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPlaybackEngine, 0);
}

@end
