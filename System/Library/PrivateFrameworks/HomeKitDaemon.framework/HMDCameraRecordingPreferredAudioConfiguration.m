@implementation HMDCameraRecordingPreferredAudioConfiguration

- (HMDCameraRecordingPreferredAudioConfiguration)initWithSampleRate:(int64_t)a3 bitRate:(id)a4
{
  id v7;
  HMDCameraRecordingPreferredAudioConfiguration *v8;
  HMDCameraRecordingPreferredAudioConfiguration *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraRecordingPreferredAudioConfiguration;
  v8 = -[HMDCameraRecordingPreferredAudioConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_sampleRate = a3;
    objc_storeStrong((id *)&v8->_bitRate, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  HMDCameraRecordingAudioSampleRateTypeAsString(-[HMDCameraRecordingPreferredAudioConfiguration sampleRate](self, "sampleRate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingPreferredAudioConfiguration bitRate](self, "bitRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sample rate: %@kHz bit rate: %@kbps"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)bitRate
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitRate, 0);
}

@end
