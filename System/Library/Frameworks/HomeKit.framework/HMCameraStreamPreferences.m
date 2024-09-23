@implementation HMCameraStreamPreferences

- (HMCameraStreamPreferences)initWithAudioPreferences:(id)a3 videoPreferences:(id)a4
{
  id v5;
  id v6;
  HMCameraStreamPreferences *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMCameraStreamPreferences;
  v5 = a4;
  v6 = a3;
  v7 = -[HMCameraStreamPreferences init](&v9, sel_init);
  -[HMCameraStreamPreferences setAudioPreferences:](v7, "setAudioPreferences:", v6, v9.receiver, v9.super_class);

  -[HMCameraStreamPreferences setVideoPreferences:](v7, "setVideoPreferences:", v5);
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMCameraStreamPreferences videoPreferences](self, "videoPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraStreamPreferences audioPreferences](self, "audioPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMCameraStreamPreferences minimumRequiredAvailableOrInUseStreams](self, "minimumRequiredAvailableOrInUseStreams");
  -[HMCameraStreamPreferences shouldTakeOwnershipOfExistingStream](self, "shouldTakeOwnershipOfExistingStream");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMCameraStreamPreferences Video Preferences: %@, Audio Preferences: %@, Minimum Required Available Or In-Use Streams: %ld, Should Take Ownership: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMCameraStreamPreferences)initWithCoder:(id)a3
{
  id v3;
  HMCameraStreamPreferences *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMCameraStreamPreferences;
  v3 = a3;
  v4 = -[HMCameraStreamPreferences init](&v9, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.CameraStreamAudioPreferences"), v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraStreamPreferences setAudioPreferences:](v4, "setAudioPreferences:", v5);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.CameraStreamVideoPreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraStreamPreferences setVideoPreferences:](v4, "setVideoPreferences:", v6);

  -[HMCameraStreamPreferences setMinimumRequiredAvailableOrInUseStreams:](v4, "setMinimumRequiredAvailableOrInUseStreams:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("HMCameraStreamMinimumRequiredAvailableOrInUseStreams")));
  v7 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HM.CameraStreamShouldTakeOwnershipOfExistingStream"));

  -[HMCameraStreamPreferences setShouldTakeOwnershipOfExistingStream:](v4, "setShouldTakeOwnershipOfExistingStream:", v7);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMCameraStreamPreferences audioPreferences](self, "audioPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("HM.CameraStreamAudioPreferences"));

  -[HMCameraStreamPreferences videoPreferences](self, "videoPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("HM.CameraStreamVideoPreferences"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[HMCameraStreamPreferences minimumRequiredAvailableOrInUseStreams](self, "minimumRequiredAvailableOrInUseStreams"), CFSTR("HMCameraStreamMinimumRequiredAvailableOrInUseStreams"));
  objc_msgSend(v6, "encodeBool:forKey:", -[HMCameraStreamPreferences shouldTakeOwnershipOfExistingStream](self, "shouldTakeOwnershipOfExistingStream"), CFSTR("HM.CameraStreamShouldTakeOwnershipOfExistingStream"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  int64_t v13;
  _BOOL4 v14;
  int v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_9;
  -[HMCameraStreamPreferences audioPreferences](self, "audioPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "audioPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (!v9)
    goto LABEL_9;
  -[HMCameraStreamPreferences videoPreferences](self, "videoPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (!v12)
    goto LABEL_9;
  v13 = -[HMCameraStreamPreferences minimumRequiredAvailableOrInUseStreams](self, "minimumRequiredAvailableOrInUseStreams");
  if (v13 == objc_msgSend(v6, "minimumRequiredAvailableOrInUseStreams"))
  {
    v14 = -[HMCameraStreamPreferences shouldTakeOwnershipOfExistingStream](self, "shouldTakeOwnershipOfExistingStream");
    v15 = v14 ^ objc_msgSend(v6, "shouldTakeOwnershipOfExistingStream") ^ 1;
  }
  else
  {
LABEL_9:
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  -[HMCameraStreamPreferences audioPreferences](self, "audioPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMCameraStreamPreferences videoPreferences](self, "videoPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  v7 = v6 ^ -[HMCameraStreamPreferences minimumRequiredAvailableOrInUseStreams](self, "minimumRequiredAvailableOrInUseStreams");
  return v7 ^ -[HMCameraStreamPreferences shouldTakeOwnershipOfExistingStream](self, "shouldTakeOwnershipOfExistingStream");
}

- (HMCameraStreamAudioPreferences)audioPreferences
{
  return (HMCameraStreamAudioPreferences *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAudioPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HMCameraStreamVideoPreferences)videoPreferences
{
  return (HMCameraStreamVideoPreferences *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVideoPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)minimumRequiredAvailableOrInUseStreams
{
  return self->_minimumRequiredAvailableOrInUseStreams;
}

- (void)setMinimumRequiredAvailableOrInUseStreams:(int64_t)a3
{
  self->_minimumRequiredAvailableOrInUseStreams = a3;
}

- (BOOL)shouldTakeOwnershipOfExistingStream
{
  return self->_shouldTakeOwnershipOfExistingStream;
}

- (void)setShouldTakeOwnershipOfExistingStream:(BOOL)a3
{
  self->_shouldTakeOwnershipOfExistingStream = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPreferences, 0);
  objc_storeStrong((id *)&self->_audioPreferences, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
