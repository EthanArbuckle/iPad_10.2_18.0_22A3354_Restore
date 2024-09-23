@implementation HMDMediaSessionState

- (HMDMediaSessionState)initWithSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaSessionState *v6;
  HMDMediaSessionState *v7;
  uint64_t v8;
  NSString *sessionIdentifier;
  double v10;
  uint64_t v11;
  NSNumber *volume;
  NSNumber *muted;
  HMDMediaSessionState *v15;
  SEL v16;
  objc_super v17;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)HMDMediaSessionState;
    v6 = -[HMDMediaSessionState init](&v17, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      v8 = objc_msgSend(v5, "copy");
      sessionIdentifier = v7->_sessionIdentifier;
      v7->_sessionIdentifier = (NSString *)v8;

      v7->_playbackState = 0;
      v7->_shuffleState = 0;
      v7->_repeatState = 0;
      LODWORD(v10) = 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      volume = v7->_volume;
      v7->_volume = (NSNumber *)v11;

      muted = v7->_muted;
      v7->_muted = (NSNumber *)MEMORY[0x1E0C9AAA0];

    }
    return v7;
  }
  else
  {
    v15 = (HMDMediaSessionState *)_HMFPreconditionFailure();
    return (HMDMediaSessionState *)-[HMDMediaSessionState playbackState](v15, v16);
  }
}

- (int64_t)playbackState
{
  os_unfair_lock_s *p_lock;
  int64_t playbackState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  playbackState = self->_playbackState;
  os_unfair_lock_unlock(p_lock);
  return playbackState;
}

- (void)setPlaybackState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_playbackState != a3)
    self->_playbackState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)shuffleState
{
  os_unfair_lock_s *p_lock;
  int64_t shuffleState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  shuffleState = self->_shuffleState;
  os_unfair_lock_unlock(p_lock);
  return shuffleState;
}

- (void)setShuffleState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_shuffleState != a3)
    self->_shuffleState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)repeatState
{
  os_unfair_lock_s *p_lock;
  int64_t repeatState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  repeatState = self->_repeatState;
  os_unfair_lock_unlock(p_lock);
  return repeatState;
}

- (void)setRepeatState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_repeatState != a3)
    self->_repeatState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSNumber)volume
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_volume;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setVolume:(id)a3
{
  NSNumber *v5;

  v5 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  if (self->_volume != v5)
    objc_storeStrong((id *)&self->_volume, a3);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSNumber)muted
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_muted;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMuted:(id)a3
{
  NSNumber *v5;

  v5 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  if (self->_muted != v5)
    objc_storeStrong((id *)&self->_muted, a3);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)mediaUniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_mediaUniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMediaUniqueIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSString **p_mediaUniqueIdentifier;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_mediaUniqueIdentifier = &self->_mediaUniqueIdentifier;
  if ((objc_msgSend(v7, "isEqualToString:", *p_mediaUniqueIdentifier) & 1) == 0)
    objc_storeStrong((id *)p_mediaUniqueIdentifier, a3);
  os_unfair_lock_unlock(p_lock);

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDMediaSessionState sessionIdentifier](self, "sessionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDMediaSessionState *v4;
  HMDMediaSessionState *v5;
  HMDMediaSessionState *v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (HMDMediaSessionState *)a3;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_12;
    -[HMDMediaSessionState sessionIdentifier](self, "sessionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaSessionState sessionIdentifier](v6, "sessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if (!v9)
      goto LABEL_12;
    v10 = -[HMDMediaSessionState playbackState](self, "playbackState");
    if (v10 == -[HMDMediaSessionState playbackState](v6, "playbackState")
      && (v11 = -[HMDMediaSessionState shuffleState](self, "shuffleState"),
          v11 == -[HMDMediaSessionState shuffleState](v6, "shuffleState"))
      && (v12 = -[HMDMediaSessionState repeatState](self, "repeatState"),
          v12 == -[HMDMediaSessionState repeatState](v6, "repeatState")))
    {
      -[HMDMediaSessionState volume](self, "volume");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;
      -[HMDMediaSessionState volume](v6, "volume");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      if (vabds_f32(v15, v17) >= *MEMORY[0x1E0CBA9A8])
      {
        v20 = 0;
      }
      else
      {
        -[HMDMediaSessionState mediaUniqueIdentifier](self, "mediaUniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMediaSessionState mediaUniqueIdentifier](v6, "mediaUniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

      }
    }
    else
    {
LABEL_12:
      v20 = 0;
    }

  }
  return v20;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDMediaSessionState sessionIdentifier](self, "sessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSessionState playbackState](self, "playbackState");
  playbackStateAsString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDMediaSessionState shuffleState](self, "shuffleState") - 1;
  if (v6 > 2)
    v7 = CFSTR("Unknown");
  else
    v7 = off_1E89B1CC8[v6];
  v8 = -[HMDMediaSessionState repeatState](self, "repeatState") - 1;
  if (v8 > 2)
    v9 = CFSTR("Unknown");
  else
    v9 = off_1E89B1CE0[v8];
  -[HMDMediaSessionState volume](self, "volume");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSessionState mediaUniqueIdentifier](self, "mediaUniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[HMDMediaSessionState sessionIdentifier: %@, Playback state: %@, Shuffle state: %@, Repeat state: %@, Volume: %@, Media identifier: %@]"), v4, v5, v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDMediaSessionState sessionIdentifier](self, "sessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSessionState playbackState](self, "playbackState");
  playbackStateAsString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDMediaSessionState shuffleState](self, "shuffleState") - 1;
  if (v6 > 2)
    v7 = CFSTR("Unknown");
  else
    v7 = off_1E89B1CC8[v6];
  v8 = -[HMDMediaSessionState repeatState](self, "repeatState") - 1;
  if (v8 > 2)
    v9 = CFSTR("Unknown");
  else
    v9 = off_1E89B1CE0[v8];
  -[HMDMediaSessionState volume](self, "volume");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSessionState mediaUniqueIdentifier](self, "mediaUniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MediaSession state sessionIdentifier: %@, Playback state: %@, Shuffle state: %@, Repeat state: %@, Volume: %@, Media identifier: %@"), v4, v5, v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v12, *MEMORY[0x1E0D27F80]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_muted, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
