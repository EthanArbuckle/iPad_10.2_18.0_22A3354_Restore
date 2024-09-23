@implementation HMDCameraRecordingPreferredVideoConfiguration

- (HMDCameraRecordingPreferredVideoConfiguration)initWithResolution:(int64_t)a3 bitRateByFrameRate:(id)a4 keyFrameInterval:(id)a5 h264Level:(int64_t)a6
{
  id v11;
  id v12;
  HMDCameraRecordingPreferredVideoConfiguration *v13;
  HMDCameraRecordingPreferredVideoConfiguration *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraRecordingPreferredVideoConfiguration;
  v13 = -[HMDCameraRecordingPreferredVideoConfiguration init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_resolution = a3;
    objc_storeStrong((id *)&v13->_bitRateByFrameRate, a4);
    objc_storeStrong((id *)&v14->_keyFrameInterval, a5);
    v14->_h264Level = a6;
  }

  return v14;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HMDCameraRecordingPreferredVideoConfiguration resolution](self, "resolution");
  if (v4 >= 0x12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown HMDCameraRecordingVideoResolutionType %ld"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E89B6AE0[v4];
  }
  -[HMDCameraRecordingPreferredVideoConfiguration bitRateByFrameRate](self, "bitRateByFrameRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingPreferredVideoConfiguration keyFrameInterval](self, "keyFrameInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HMDCameraRecordingH264LevelTypeAsString(-[HMDCameraRecordingPreferredVideoConfiguration h264Level](self, "h264Level"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("resolution: %@px, bitRateByFrameRate: %@ key frame interval: %@ms h264 level: %@"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)bitRateByFrameRate
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)keyFrameInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (int64_t)h264Level
{
  return self->_h264Level;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyFrameInterval, 0);
  objc_storeStrong((id *)&self->_bitRateByFrameRate, 0);
}

@end
