@implementation HMDCameraSupportedConfigurationCache

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[HMDCameraSupportedConfigurationCache supportedVideoStreamConfiguration](self, "supportedVideoStreamConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDCameraSupportedConfigurationCache supportedAudioStreamConfiguration](self, "supportedAudioStreamConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HMDCameraSupportedConfigurationCache supportedRTPConfiguration](self, "supportedRTPConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HMDSupportedVideoStreamConfiguration)supportedVideoStreamConfiguration
{
  return (HMDSupportedVideoStreamConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSupportedVideoStreamConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HMDSupportedAudioStreamConfiguration)supportedAudioStreamConfiguration
{
  return (HMDSupportedAudioStreamConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSupportedAudioStreamConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HMDSupportedRTPConfiguration)supportedRTPConfiguration
{
  return (HMDSupportedRTPConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSupportedRTPConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedRTPConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedAudioStreamConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedVideoStreamConfiguration, 0);
}

@end
