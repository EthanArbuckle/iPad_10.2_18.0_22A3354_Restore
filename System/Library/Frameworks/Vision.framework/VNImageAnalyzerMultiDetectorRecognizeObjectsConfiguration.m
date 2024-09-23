@implementation VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration

- (VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration)initWithObservationsRecipient:(id)a3
{
  VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration;
  result = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:](&v4, sel_initWithObservationsRecipient_, a3);
  if (result)
  {
    result->_minimumDetectionConfidence = 0.1;
    result->_nonMaximumSuppressionThreshold = 0.3;
  }
  return result;
}

- (unsigned)analysisTypes
{
  return 64;
}

- (unsigned)labelsListType
{
  return 64;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  float *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration;
  v4 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = (float *)v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_disallowedList);
    v5[4] = self->_minimumDetectionConfidence;
    v5[5] = self->_nonMaximumSuppressionThreshold;
  }
  return v5;
}

- (VNDisallowedList)disallowedList
{
  return self->_disallowedList;
}

- (void)setDisallowedList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (float)minimumDetectionConfidence
{
  return self->_minimumDetectionConfidence;
}

- (void)setMinimumDetectionConfidence:(float)a3
{
  self->_minimumDetectionConfidence = a3;
}

- (float)nonMaximumSuppressionThreshold
{
  return self->_nonMaximumSuppressionThreshold;
}

- (void)setNonMaximumSuppressionThreshold:(float)a3
{
  self->_nonMaximumSuppressionThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disallowedList, 0);
}

@end
