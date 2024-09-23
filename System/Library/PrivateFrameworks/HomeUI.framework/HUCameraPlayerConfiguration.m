@implementation HUCameraPlayerConfiguration

- (HUCameraPlayerConfiguration)initWithHome:(id)a3 cameraProfile:(id)a4 notificationUUID:(id)a5 clipUUID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HUCameraPlayerConfiguration *v15;
  HUCameraPlayerConfiguration *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HUCameraPlayerConfiguration;
  v15 = -[HUCameraPlayerConfiguration init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_home, a3);
    objc_storeStrong((id *)&v16->_cameraProfile, a4);
    objc_storeStrong((id *)&v16->_notificationUUID, a5);
    objc_storeStrong((id *)&v16->_clipUUID, a6);
  }

  return v16;
}

- (BOOL)isConfiguredForLiveStream
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HUCameraPlayerConfiguration cameraProfile](self, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hf_supportsRecordingEvents"))
  {
    -[HUCameraPlayerConfiguration startingPlaybackDate](self, "startingPlaybackDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)description
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HUCameraPlayerConfiguration cameraProfile](self, "cameraProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerConfiguration cameraProfile](self, "cameraProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerConfiguration startingPlaybackDate](self, "startingPlaybackDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerConfiguration notificationUUID](self, "notificationUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerConfiguration clipUUID](self, "clipUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\nHUCameraPlayerConfiguration:\nCamera Profile:%@/%@\nStarting PlaybackDate:%@\nNotificationUUID:%@\nClipUUID:%@"), v5, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HMHome)home
{
  return self->_home;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (NSUUID)notificationUUID
{
  return self->_notificationUUID;
}

- (NSUUID)clipUUID
{
  return self->_clipUUID;
}

- (NSDate)startingPlaybackDate
{
  return self->_startingPlaybackDate;
}

- (void)setStartingPlaybackDate:(id)a3
{
  objc_storeStrong((id *)&self->_startingPlaybackDate, a3);
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewController, a3);
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return self->_playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeStrong((id *)&self->_playbackEngine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackEngine, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_startingPlaybackDate, 0);
  objc_storeStrong((id *)&self->_clipUUID, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
