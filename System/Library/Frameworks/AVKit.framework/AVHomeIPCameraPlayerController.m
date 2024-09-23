@implementation AVHomeIPCameraPlayerController

- (BOOL)hasContent
{
  return 1;
}

- (BOOL)isPictureInPicturePossible
{
  return 1;
}

- (BOOL)hasEnabledAudio
{
  return 1;
}

- (BOOL)hasEnabledVideo
{
  return 1;
}

- (BOOL)hasLiveStreamingContent
{
  return 1;
}

- (BOOL)hasSeekableLiveStreamingContent
{
  return 0;
}

- (int64_t)status
{
  return 2;
}

- (int64_t)timeControlStatus
{
  return 2;
}

- (void)togglePlaybackEvenWhenInBackground:(id)a3
{
  id v3;

  -[AVHomeIPCameraPlayerController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pictureInPictureActionButtonTapped");

}

- (double)volume
{
  return *(double *)&self->super._seekToTimeInternal.epoch;
}

- (void)setVolume:(double)a3
{
  void *v5;
  double v6;
  objc_super v7;

  if (*(double *)&self->super._seekToTimeInternal.epoch != a3)
  {
    *(double *)&self->super._seekToTimeInternal.epoch = a3;
    v7.receiver = self;
    v7.super_class = (Class)AVHomeIPCameraPlayerController;
    -[AVPlayerController setVolume:](&v7, sel_setVolume_, a3);
    -[AVHomeIPCameraPlayerController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v6 = a3;
    objc_msgSend(v5, "playbackControlsDidChangePlayerVolume:", v6);

  }
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (LOBYTE(self->_volume) != a3)
  {
    v3 = a3;
    LOBYTE(self->_volume) = a3;
    -[AVHomeIPCameraPlayerController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playbackControlsDidToggleMuted:", v3);

  }
}

- (BOOL)isPlaying
{
  return 1;
}

- (AVHomeIPCameraActionButtonHandling)delegate
{
  return (AVHomeIPCameraActionButtonHandling *)objc_loadWeakRetained((id *)&self->_muted);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_muted, a3);
}

- (CGSize)presentationSize
{
  AVHomeIPCameraActionButtonHandling *delegate;
  double width;
  CGSize result;

  delegate = self->_delegate;
  width = self->_presentationSize.width;
  result.height = width;
  result.width = *(double *)&delegate;
  return result;
}

- (void)setPresentationSize:(CGSize)a3
{
  *(CGSize *)&self->_delegate = a3;
}

- (BOOL)isMuted
{
  return LOBYTE(self->_volume);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_muted);
}

@end
