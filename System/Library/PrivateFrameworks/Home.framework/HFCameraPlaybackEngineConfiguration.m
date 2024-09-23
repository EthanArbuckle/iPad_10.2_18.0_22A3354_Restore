@implementation HFCameraPlaybackEngineConfiguration

- (HFCameraPlaybackEngineConfiguration)initWithHome:(id)a3 cameraProfile:(id)a4
{
  id v7;
  id v8;
  HFCameraPlaybackEngineConfiguration *v9;
  HFCameraPlaybackEngineConfiguration *v10;
  uint64_t v11;
  HFCameraPlaybackPosition *playbackPosition;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFCameraPlaybackEngineConfiguration;
  v9 = -[HFCameraPlaybackEngineConfiguration init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    -[HFCameraPlaybackEngineConfiguration assertIsValid:cameraProfile:](v9, "assertIsValid:cameraProfile:", v7, v8);
    objc_storeStrong((id *)&v10->_home, a3);
    objc_storeStrong((id *)&v10->_cameraProfile, a4);
    +[HFCameraPlaybackPosition livePosition](HFCameraPlaybackPosition, "livePosition");
    v11 = objc_claimAutoreleasedReturnValue();
    playbackPosition = v10->_playbackPosition;
    v10->_playbackPosition = (HFCameraPlaybackPosition *)v11;

  }
  return v10;
}

- (void)assertConfigurationIsValid
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraPlaybackEngineConfiguration cameraProfile](self, "cameraProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraPlaybackEngineConfiguration.m"), 36, CFSTR("Missing camera profile"));

    }
    -[HFCameraPlaybackEngineConfiguration home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraPlaybackEngineConfiguration.m"), 37, CFSTR("Missing home"));

    }
    -[HFCameraPlaybackEngineConfiguration playbackPosition](self, "playbackPosition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraPlaybackEngineConfiguration.m"), 38, CFSTR("Missing playback position"));

    }
  }
}

- (void)assertIsValid:(id)a3 cameraProfile:(id)a4
{
  void *v8;
  id v9;

  if (!+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    if (a4)
    {
      if (a3)
        return;
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraPlaybackEngineConfiguration.m"), 48, CFSTR("Missing home"));

      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraPlaybackEngineConfiguration.m"), 47, CFSTR("Missing camera profile"));

    if (!a3)
      goto LABEL_6;
  }
}

- (HMHome)home
{
  return self->_home;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (HFCameraPlaybackPosition)playbackPosition
{
  return self->_playbackPosition;
}

- (void)setPlaybackPosition:(id)a3
{
  objc_storeStrong((id *)&self->_playbackPosition, a3);
}

- (HFCameraClipScrubbing)clipScrubber
{
  return (HFCameraClipScrubbing *)objc_loadWeakRetained((id *)&self->_clipScrubber);
}

- (void)setClipScrubber:(id)a3
{
  objc_storeWeak((id *)&self->_clipScrubber, a3);
}

- (NSUUID)notificationUUID
{
  return self->_notificationUUID;
}

- (void)setNotificationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUUID, a3);
}

- (NSUUID)notificationClipUUID
{
  return self->_notificationClipUUID;
}

- (void)setNotificationClipUUID:(id)a3
{
  objc_storeStrong((id *)&self->_notificationClipUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationClipUUID, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
  objc_destroyWeak((id *)&self->_clipScrubber);
  objc_storeStrong((id *)&self->_playbackPosition, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
