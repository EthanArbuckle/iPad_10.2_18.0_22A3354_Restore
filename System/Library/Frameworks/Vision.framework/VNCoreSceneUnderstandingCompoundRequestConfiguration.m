@implementation VNCoreSceneUnderstandingCompoundRequestConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNCoreSceneUnderstandingCompoundRequestConfiguration;
  v4 = -[VNRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setDetectorType:", self->_detectorType);
    objc_msgSend(v5, "setDetectorConfigurationOptions:", self->_detectorConfigurationOptions);
    objc_msgSend(v5, "setOriginalRequestConfigurations:", self->_originalRequestConfigurations);
  }
  return v5;
}

- (NSString)detectorType
{
  return self->_detectorType;
}

- (void)setDetectorType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDictionary)detectorConfigurationOptions
{
  return self->_detectorConfigurationOptions;
}

- (void)setDetectorConfigurationOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)originalRequestConfigurations
{
  return self->_originalRequestConfigurations;
}

- (void)setOriginalRequestConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequestConfigurations, 0);
  objc_storeStrong((id *)&self->_detectorConfigurationOptions, 0);
  objc_storeStrong((id *)&self->_detectorType, 0);
}

@end
