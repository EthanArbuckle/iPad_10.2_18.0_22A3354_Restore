@implementation HMDCameraAudioParameterCombination

- (HMDCameraAudioParameterCombination)initWithCodecGroup:(id)a3 bitrateSetting:(id)a4 sampleRate:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCameraAudioParameterCombination *v12;
  HMDCameraAudioParameterCombination *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraAudioParameterCombination;
  v12 = -[HMDCameraAudioParameterCombination init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_codecGroupType, a3);
    objc_storeStrong((id *)&v13->_bitrateSetting, a4);
    objc_storeStrong((id *)&v13->_sampleRate, a5);
  }

  return v13;
}

- (HMDCameraAudioParameterCombination)initWithCodecGroup:(id)a3 bitrateSetting:(id)a4 sampleRate:(id)a5 maximumBitrate:(id)a6 minimumBitrate:(id)a7 rtcpInterval:(id)a8 rtpPtime:(id)a9
{
  id v16;
  id v17;
  HMDCameraAudioParameterCombination *v18;
  HMDCameraAudioParameterCombination *v19;
  id v21;
  id v22;

  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v18 = -[HMDCameraAudioParameterCombination initWithCodecGroup:bitrateSetting:sampleRate:](self, "initWithCodecGroup:bitrateSetting:sampleRate:", a3, a4, a5);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_maximumBitrate, a6);
    objc_storeStrong((id *)&v19->_minimumBitrate, a7);
    objc_storeStrong((id *)&v19->_rtcpInterval, a8);
    objc_storeStrong((id *)&v19->_rtpPTime, a9);
  }

  return v19;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCameraAudioParameterCombination codecGroupType](self, "codecGroupType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterCombination bitrateSetting](self, "bitrateSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterCombination sampleRate](self, "sampleRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterCombination maximumBitrate](self, "maximumBitrate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterCombination minimumBitrate](self, "minimumBitrate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterCombination rtcpInterval](self, "rtcpInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraAudioParameterCombination rtpPTime](self, "rtpPTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<codecType = %@, bitrateSetting = %@, sampleAudioRate = %@, maxBitrate = %@, minBitrate = %@, rtcpInterval = %@, rtpPtime = %@>"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HMDCameraAudioParameterCombination *v4;
  HMDCameraAudioParameterCombination *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDCameraAudioParameterCombination *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMDCameraAudioParameterCombination codecGroupType](self, "codecGroupType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraAudioParameterCombination codecGroupType](v5, "codecGroupType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[HMDCameraAudioParameterCombination bitrateSetting](self, "bitrateSetting");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraAudioParameterCombination bitrateSetting](v5, "bitrateSetting");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (HMDAudioCodecGroup)codecGroupType
{
  return self->_codecGroupType;
}

- (HMDBitRateSetting)bitrateSetting
{
  return self->_bitrateSetting;
}

- (HMDAudioSampleRate)sampleRate
{
  return self->_sampleRate;
}

- (NSNumber)maximumBitrate
{
  return self->_maximumBitrate;
}

- (NSNumber)minimumBitrate
{
  return self->_minimumBitrate;
}

- (NSNumber)rtcpInterval
{
  return self->_rtcpInterval;
}

- (NSNumber)rtpPTime
{
  return self->_rtpPTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtpPTime, 0);
  objc_storeStrong((id *)&self->_rtcpInterval, 0);
  objc_storeStrong((id *)&self->_minimumBitrate, 0);
  objc_storeStrong((id *)&self->_maximumBitrate, 0);
  objc_storeStrong((id *)&self->_sampleRate, 0);
  objc_storeStrong((id *)&self->_bitrateSetting, 0);
  objc_storeStrong((id *)&self->_codecGroupType, 0);
}

@end
