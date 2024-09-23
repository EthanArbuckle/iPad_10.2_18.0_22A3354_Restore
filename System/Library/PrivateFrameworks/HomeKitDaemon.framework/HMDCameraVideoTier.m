@implementation HMDCameraVideoTier

- (HMDCameraVideoTier)initWithVideoResolution:(id)a3 framerate:(id)a4 minBitRate:(id)a5 maxBitRate:(id)a6 rtcpInterval:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDCameraVideoTier *v17;
  HMDCameraVideoTier *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDCameraVideoTier;
  v17 = -[HMDCameraVideoTier init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_videoResolution, a3);
    objc_storeStrong((id *)&v18->_maxBitRate, a6);
    objc_storeStrong((id *)&v18->_minBitRate, a5);
    objc_storeStrong((id *)&v18->_rtcpInterval, a7);
    objc_storeStrong((id *)&v18->_framerate, a4);
  }

  return v18;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCameraVideoTier videoResolution](self, "videoResolution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoTier maxBitRate](self, "maxBitRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoTier minBitRate](self, "minBitRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoTier rtcpInterval](self, "rtcpInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraVideoTier framerate](self, "framerate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Resolution %@, Max bitrate %@, Min bitrate %@, RTCP interval %@, Framerate %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HMDCameraVideoTier *v4;
  HMDCameraVideoTier *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HMDCameraVideoTier *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMDCameraVideoTier videoResolution](self, "videoResolution");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraVideoTier videoResolution](v5, "videoResolution");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDCameraVideoTier videoResolution](self, "videoResolution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HMDCameraVideoTier)initWithCoder:(id)a3
{
  id v4;
  HMDCameraVideoTier *v5;
  uint64_t v6;
  HMDVideoResolution *videoResolution;
  uint64_t v8;
  NSNumber *maxBitRate;
  uint64_t v10;
  NSNumber *minBitRate;
  uint64_t v12;
  NSNumber *rtcpInterval;
  uint64_t v14;
  NSNumber *framerate;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraVideoTier;
  v5 = -[HMDCameraVideoTier init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVideoTierResolution"));
    v6 = objc_claimAutoreleasedReturnValue();
    videoResolution = v5->_videoResolution;
    v5->_videoResolution = (HMDVideoResolution *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVideoTierMaxBitRate"));
    v8 = objc_claimAutoreleasedReturnValue();
    maxBitRate = v5->_maxBitRate;
    v5->_maxBitRate = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVideoTierMinBitRate"));
    v10 = objc_claimAutoreleasedReturnValue();
    minBitRate = v5->_minBitRate;
    v5->_minBitRate = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVideoTierRTCPInterval"));
    v12 = objc_claimAutoreleasedReturnValue();
    rtcpInterval = v5->_rtcpInterval;
    v5->_rtcpInterval = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVideoTierFramerate"));
    v14 = objc_claimAutoreleasedReturnValue();
    framerate = v5->_framerate;
    v5->_framerate = (NSNumber *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMDCameraVideoTier videoResolution](self, "videoResolution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kVideoTierResolution"));

  -[HMDCameraVideoTier maxBitRate](self, "maxBitRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kVideoTierMaxBitRate"));

  -[HMDCameraVideoTier minBitRate](self, "minBitRate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kVideoTierMinBitRate"));

  -[HMDCameraVideoTier rtcpInterval](self, "rtcpInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kVideoTierRTCPInterval"));

  -[HMDCameraVideoTier framerate](self, "framerate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kVideoTierFramerate"));

}

- (HMDVideoResolution)videoResolution
{
  return self->_videoResolution;
}

- (NSNumber)maxBitRate
{
  return self->_maxBitRate;
}

- (NSNumber)minBitRate
{
  return self->_minBitRate;
}

- (NSNumber)rtcpInterval
{
  return self->_rtcpInterval;
}

- (NSNumber)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(id)a3
{
  objc_storeStrong((id *)&self->_framerate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framerate, 0);
  objc_storeStrong((id *)&self->_rtcpInterval, 0);
  objc_storeStrong((id *)&self->_minBitRate, 0);
  objc_storeStrong((id *)&self->_maxBitRate, 0);
  objc_storeStrong((id *)&self->_videoResolution, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
