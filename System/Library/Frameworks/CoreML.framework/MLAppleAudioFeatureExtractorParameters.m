@implementation MLAppleAudioFeatureExtractorParameters

- (MLAppleAudioFeatureExtractorParameters)initWithSoundPrintParameters:(id)a3
{
  id v5;
  MLAppleAudioFeatureExtractorParameters *v6;
  MLAppleAudioFeatureExtractorParameters *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLAppleAudioFeatureExtractorParameters;
  v6 = -[MLAppleAudioFeatureExtractorParameters init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_featureExtractorParameters, a3);

  return v7;
}

- (id)featureExtractorParameters
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_featureExtractorParameters, 0);
}

@end
