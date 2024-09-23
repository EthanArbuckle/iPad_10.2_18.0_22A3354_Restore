@implementation HMDSupportedSiriAudioConfigurations

- (int64_t)siriInputType
{
  return self->_siriInputType;
}

- (void)setSiriInputType:(int64_t)a3
{
  self->_siriInputType = a3;
}

- (NSArray)supportedConfigurations
{
  return self->_supportedConfigurations;
}

- (void)setSupportedConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_supportedConfigurations, a3);
}

- (HAPAudioStreamCodecConfiguration)selectedConfiguration
{
  return self->_selectedConfiguration;
}

- (void)setSelectedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_selectedConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedConfigurations, 0);
}

@end
