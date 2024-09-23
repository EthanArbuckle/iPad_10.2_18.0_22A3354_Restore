@implementation MLModelVisionFeaturePrintInfo

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (id)featureExtractorParameters
{
  return self->_featureExtractorParameters;
}

- (void)setFeatureExtractorParameters:(id)a3
{
  objc_storeStrong(&self->_featureExtractorParameters, a3);
}

- (MLModel)postVisionFeaturePrintModel
{
  return self->_postVisionFeaturePrintModel;
}

- (void)setPostVisionFeaturePrintModel:(id)a3
{
  objc_storeStrong((id *)&self->_postVisionFeaturePrintModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postVisionFeaturePrintModel, 0);
  objc_storeStrong(&self->_featureExtractorParameters, 0);
}

@end
