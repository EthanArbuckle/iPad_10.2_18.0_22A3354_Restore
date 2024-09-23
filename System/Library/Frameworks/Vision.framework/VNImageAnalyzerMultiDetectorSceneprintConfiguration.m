@implementation VNImageAnalyzerMultiDetectorSceneprintConfiguration

- (unsigned)analysisTypes
{
  if (-[VNImageAnalyzerMultiDetectorSceneprintConfiguration includeLabelsAndConfidences](self, "includeLabelsAndConfidences"))
  {
    return 3;
  }
  else
  {
    return 1;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNImageAnalyzerMultiDetectorSceneprintConfiguration;
  result = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
    *((_BYTE *)result + 16) = self->_includeLabelsAndConfidences;
  return result;
}

- (BOOL)includeLabelsAndConfidences
{
  return self->_includeLabelsAndConfidences;
}

- (void)setIncludeLabelsAndConfidences:(BOOL)a3
{
  self->_includeLabelsAndConfidences = a3;
}

@end
