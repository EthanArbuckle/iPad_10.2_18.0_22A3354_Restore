@implementation HMAccessoryInfoMediaState

- (HMAccessoryInfoMediaState)initWithMediaIdentifier:(id)a3 volume:(double)a4 playbackState:(int64_t)a5 shuffleState:(int64_t)a6 repeatState:(int64_t)a7
{
  id v12;
  HMAccessoryInfoMediaState *v13;
  uint64_t v14;
  NSString *mediaIdentifier;
  objc_super v17;

  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMAccessoryInfoMediaState;
  v13 = -[HMAccessoryInfoMediaState init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    mediaIdentifier = v13->_mediaIdentifier;
    v13->_mediaIdentifier = (NSString *)v14;

    v13->_volume = a4;
    v13->_playbackState = a5;
    v13->_shuffleState = a6;
    v13->_repeatState = a7;
  }

  return v13;
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
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)HMAccessoryInfoMediaState;
  -[HMAccessoryInfoMediaState description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoMediaState mediaIdentifier](self, "mediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMAccessoryInfoMediaState playbackState](self, "playbackState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HMAccessoryInfoMediaState volume](self, "volume");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMAccessoryInfoMediaState shuffleState](self, "shuffleState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMAccessoryInfoMediaState repeatState](self, "repeatState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, mID: %@, ps: %@, v: %@, sh: %@, rs: %@"), v4, v5, v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)protoPayload
{
  HMAccessoryInfoProtoMediaStateEvent *v3;
  void *v4;

  v3 = objc_alloc_init(HMAccessoryInfoProtoMediaStateEvent);
  -[HMAccessoryInfoMediaState mediaIdentifier](self, "mediaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoMediaStateEvent setMediaIdentifier:](v3, "setMediaIdentifier:", v4);

  -[HMAccessoryInfoMediaState volume](self, "volume");
  -[HMAccessoryInfoProtoMediaStateEvent setVolume:](v3, "setVolume:");
  -[HMAccessoryInfoProtoMediaStateEvent setRepeatState:](v3, "setRepeatState:", -[HMAccessoryInfoMediaState repeatState](self, "repeatState"));
  -[HMAccessoryInfoProtoMediaStateEvent setShuffleState:](v3, "setShuffleState:", -[HMAccessoryInfoMediaState shuffleState](self, "shuffleState"));
  -[HMAccessoryInfoProtoMediaStateEvent setPlaybackState:](v3, "setPlaybackState:", -[HMAccessoryInfoMediaState playbackState](self, "playbackState"));
  return v3;
}

- (id)protoData
{
  void *v2;
  void *v3;

  -[HMAccessoryInfoMediaState protoPayload](self, "protoPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMAccessoryInfoMediaState)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  HMAccessoryInfoMediaState *v11;

  v4 = a3;
  objc_msgSend(v4, "mediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volume");
  v7 = v6;
  v8 = objc_msgSend(v4, "playbackState");
  v9 = objc_msgSend(v4, "shuffleState");
  v10 = objc_msgSend(v4, "repeatState");

  v11 = -[HMAccessoryInfoMediaState initWithMediaIdentifier:volume:playbackState:shuffleState:repeatState:](self, "initWithMediaIdentifier:volume:playbackState:shuffleState:repeatState:", v5, v8, v9, v10, v7);
  return v11;
}

- (HMAccessoryInfoMediaState)initWithProtoData:(id)a3
{
  id v4;
  HMAccessoryInfoProtoMediaStateEvent *v5;
  HMAccessoryInfoMediaState *v6;

  v4 = a3;
  v5 = -[HMAccessoryInfoProtoMediaStateEvent initWithData:]([HMAccessoryInfoProtoMediaStateEvent alloc], "initWithData:", v4);

  v6 = -[HMAccessoryInfoMediaState initWithProtoPayload:](self, "initWithProtoPayload:", v5);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessoryInfoMediaState *v4;
  HMAccessoryInfoMediaState *v5;
  HMAccessoryInfoMediaState *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  BOOL v15;

  v4 = (HMAccessoryInfoMediaState *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMAccessoryInfoMediaState mediaIdentifier](self, "mediaIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessoryInfoMediaState mediaIdentifier](v6, "mediaIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (HMFEqualObjects()
        && (-[HMAccessoryInfoMediaState volume](self, "volume"),
            v10 = v9,
            -[HMAccessoryInfoMediaState volume](v6, "volume"),
            vabdd_f64(v10, v11) < 2.22044605e-16)
        && (v12 = -[HMAccessoryInfoMediaState playbackState](self, "playbackState"),
            v12 == -[HMAccessoryInfoMediaState playbackState](v6, "playbackState"))
        && (v13 = -[HMAccessoryInfoMediaState shuffleState](self, "shuffleState"),
            v13 == -[HMAccessoryInfoMediaState shuffleState](v6, "shuffleState")))
      {
        v14 = -[HMAccessoryInfoMediaState repeatState](self, "repeatState");
        v15 = v14 == -[HMAccessoryInfoMediaState repeatState](v6, "repeatState");
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[HMAccessoryInfoMediaState mediaIdentifier](self, "mediaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return -[HMAccessoryInfoMediaState playbackState](self, "playbackState") ^ v4;
}

- (NSString)mediaIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (double)volume
{
  return self->_volume;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (int64_t)shuffleState
{
  return self->_shuffleState;
}

- (int64_t)repeatState
{
  return self->_repeatState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
}

@end
