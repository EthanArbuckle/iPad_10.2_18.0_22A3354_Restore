@implementation FMDGenericAudioAccessory

+ (id)copyAccessory:(id)a3
{
  id v3;
  FMDGenericAudioAccessory *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(FMDGenericAudioAccessory);
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF9258A8))
  {
    objc_msgSend(v3, "accessoryIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDGenericAudioAccessory setAccessoryIdentifier:](v4, "setAccessoryIdentifier:", v5);

  }
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF925848))
  {
    v6 = v3;
    objc_msgSend(v6, "audioRoutingIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDGenericAudioAccessory setAudioRoutingIdentifier:](v4, "setAudioRoutingIdentifier:", v7);

    objc_msgSend(v6, "audioURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDGenericAudioAccessory setAudioURL:](v4, "setAudioURL:", v8);

    objc_msgSend(v6, "audioAccessoryInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[FMDGenericAudioAccessory setAudioAccessoryInfo:](v4, "setAudioAccessoryInfo:", v9);
  }
  -[FMDGenericAudioAccessory setSupportsChangingListeningMode:](v4, "setSupportsChangingListeningMode:", 1);

  return v4;
}

- (FMDGenericAudioAccessory)initWithCoder:(id)a3
{
  id v4;
  FMDGenericAudioAccessory *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FMDGenericAudioAccessory;
  v5 = -[FMDGenericAudioAccessory init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_accessoryIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDGenericAudioAccessory setAccessoryIdentifier:](v5, "setAccessoryIdentifier:", v8);

    v9 = objc_opt_class();
    NSStringFromSelector(sel_audioRoutingIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDGenericAudioAccessory setAudioRoutingIdentifier:](v5, "setAudioRoutingIdentifier:", v11);

    v12 = objc_opt_class();
    NSStringFromSelector(sel_audioURL);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDGenericAudioAccessory setAudioURL:](v5, "setAudioURL:", v14);

    v15 = objc_opt_class();
    NSStringFromSelector(sel_audioAccessoryInfo);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDGenericAudioAccessory setAudioAccessoryInfo:](v5, "setAudioAccessoryInfo:", v17);

    NSStringFromSelector(sel_supportsChangingListeningMode);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDGenericAudioAccessory setSupportsChangingListeningMode:](v5, "setSupportsChangingListeningMode:", objc_msgSend(v4, "decodeBoolForKey:", v18));

  }
  return v5;
}

- (FMDGenericAudioAccessory)initWithAccessoryId:(id)a3 audioRoutingIdentifier:(id)a4 audioURL:(id)a5 audioAccessoryInfo:(id)a6 supportsChangingListeningMode:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FMDGenericAudioAccessory *v17;
  FMDGenericAudioAccessory *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FMDGenericAudioAccessory;
  v17 = -[FMDGenericAudioAccessory init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_accessoryIdentifier, a3);
    objc_storeStrong((id *)&v18->_audioRoutingIdentifier, a4);
    objc_storeStrong((id *)&v18->_audioURL, a5);
    objc_storeStrong((id *)&v18->_audioAccessoryInfo, a6);
    v18->_supportsChangingListeningMode = a7;
  }

  return v18;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FMDGenericAudioAccessory accessoryIdentifier](self, "accessoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDGenericAudioAccessory audioRoutingIdentifier](self, "audioRoutingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDGenericAudioAccessory audioURL](self, "audioURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("FMDGenericAccessory(0x%lx), accessoryIdentifier - %@, audioRoutingIdentifier - %@, audioURL - %@"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  id v14;

  v4 = a3;
  -[FMDGenericAudioAccessory accessoryIdentifier](self, "accessoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accessoryIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[FMDGenericAudioAccessory audioRoutingIdentifier](self, "audioRoutingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_audioRoutingIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[FMDGenericAudioAccessory audioURL](self, "audioURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_audioURL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[FMDGenericAudioAccessory audioAccessoryInfo](self, "audioAccessoryInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_audioAccessoryInfo);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[FMDGenericAudioAccessory supportsChangingListeningMode](self, "supportsChangingListeningMode");
  NSStringFromSelector(sel_supportsChangingListeningMode);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

}

- (BOOL)playingSound
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)audioSafetyStatus
{
  return 0;
}

- (BOOL)updateAudioAsset:(id)a3
{
  return 0;
}

- (BOOL)updatePlaybackChannels:(id)a3
{
  return 0;
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (NSString)audioRoutingIdentifier
{
  return self->_audioRoutingIdentifier;
}

- (void)setAudioRoutingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_audioRoutingIdentifier, a3);
}

- (NSURL)audioURL
{
  return self->_audioURL;
}

- (void)setAudioURL:(id)a3
{
  objc_storeStrong((id *)&self->_audioURL, a3);
}

- (FMDAudioAccessoryInfo)audioAccessoryInfo
{
  return self->_audioAccessoryInfo;
}

- (void)setAudioAccessoryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_audioAccessoryInfo, a3);
}

- (BOOL)supportsChangingListeningMode
{
  return self->_supportsChangingListeningMode;
}

- (void)setSupportsChangingListeningMode:(BOOL)a3
{
  self->_supportsChangingListeningMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_audioURL, 0);
  objc_storeStrong((id *)&self->_audioRoutingIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end
