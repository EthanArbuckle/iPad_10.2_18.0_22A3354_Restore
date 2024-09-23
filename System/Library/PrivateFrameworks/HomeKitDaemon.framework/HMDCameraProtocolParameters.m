@implementation HMDCameraProtocolParameters

- (HMDCameraProtocolParameters)initWithCoder:(id)a3
{
  id v4;
  HMDCameraProtocolParameters *v5;
  uint64_t v6;
  HMDSetupEndPointRead *setupEndPointRead;
  uint64_t v8;
  HMDSetupEndPointWrite *setupEndPointWrite;
  uint64_t v10;
  HMDSelectedStreamConfigurationWrite *selectedStreamConfigurationWrite;
  uint64_t v12;
  HMDReselectedStreamConfigurationWrite *reselectedStreamConfigurationWrite;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraProtocolParameters;
  v5 = -[HMDCameraProtocolParameters init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kHMDSetupEndPointReadKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    setupEndPointRead = v5->_setupEndPointRead;
    v5->_setupEndPointRead = (HMDSetupEndPointRead *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kHMDSetupEndPointWriteKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    setupEndPointWrite = v5->_setupEndPointWrite;
    v5->_setupEndPointWrite = (HMDSetupEndPointWrite *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kHMDSelectedStreamConfigurationWriteKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    selectedStreamConfigurationWrite = v5->_selectedStreamConfigurationWrite;
    v5->_selectedStreamConfigurationWrite = (HMDSelectedStreamConfigurationWrite *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kHMDReselectedStreamConfigurationWriteKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    reselectedStreamConfigurationWrite = v5->_reselectedStreamConfigurationWrite;
    v5->_reselectedStreamConfigurationWrite = (HMDReselectedStreamConfigurationWrite *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMDCameraProtocolParameters setupEndPointRead](self, "setupEndPointRead");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kHMDSetupEndPointReadKey"));

  -[HMDCameraProtocolParameters setupEndPointWrite](self, "setupEndPointWrite");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kHMDSetupEndPointWriteKey"));

  -[HMDCameraProtocolParameters selectedStreamConfigurationWrite](self, "selectedStreamConfigurationWrite");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kHMDSelectedStreamConfigurationWriteKey"));

  -[HMDCameraProtocolParameters reselectedStreamConfigurationWrite](self, "reselectedStreamConfigurationWrite");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kHMDReselectedStreamConfigurationWriteKey"));

}

- (HMDSupportedVideoStreamConfiguration)supportedVideoStreamConfiguration
{
  return self->_supportedVideoStreamConfiguration;
}

- (void)setSupportedVideoStreamConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_supportedVideoStreamConfiguration, a3);
}

- (HMDSupportedAudioStreamConfiguration)supportedAudioStreamConfiguration
{
  return self->_supportedAudioStreamConfiguration;
}

- (void)setSupportedAudioStreamConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_supportedAudioStreamConfiguration, a3);
}

- (HMDSupportedRTPConfiguration)supportedRTPConfiguration
{
  return self->_supportedRTPConfiguration;
}

- (void)setSupportedRTPConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_supportedRTPConfiguration, a3);
}

- (HMDSetupEndPointRead)setupEndPointRead
{
  return self->_setupEndPointRead;
}

- (void)setSetupEndPointRead:(id)a3
{
  objc_storeStrong((id *)&self->_setupEndPointRead, a3);
}

- (HMDSetupEndPointWrite)setupEndPointWrite
{
  return self->_setupEndPointWrite;
}

- (void)setSetupEndPointWrite:(id)a3
{
  objc_storeStrong((id *)&self->_setupEndPointWrite, a3);
}

- (HMDSelectedStreamConfigurationWrite)selectedStreamConfigurationWrite
{
  return self->_selectedStreamConfigurationWrite;
}

- (void)setSelectedStreamConfigurationWrite:(id)a3
{
  objc_storeStrong((id *)&self->_selectedStreamConfigurationWrite, a3);
}

- (HMDReselectedStreamConfigurationWrite)reselectedStreamConfigurationWrite
{
  return self->_reselectedStreamConfigurationWrite;
}

- (void)setReselectedStreamConfigurationWrite:(id)a3
{
  objc_storeStrong((id *)&self->_reselectedStreamConfigurationWrite, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reselectedStreamConfigurationWrite, 0);
  objc_storeStrong((id *)&self->_selectedStreamConfigurationWrite, 0);
  objc_storeStrong((id *)&self->_setupEndPointWrite, 0);
  objc_storeStrong((id *)&self->_setupEndPointRead, 0);
  objc_storeStrong((id *)&self->_supportedRTPConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedAudioStreamConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedVideoStreamConfiguration, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
