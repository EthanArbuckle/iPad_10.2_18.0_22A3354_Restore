@implementation VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration

- (VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration)initWithObservationsRecipient:(id)a3
{
  VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration;
  result = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:](&v4, sel_initWithObservationsRecipient_, a3);
  if (result)
  {
    result->_minimumConfidence = 0.00000011921;
    result->_maximumLabels = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (unsigned)analysisTypes
{
  return 4096;
}

- (unsigned)labelsListType
{
  return 4096;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration;
  v4 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_disallowedList);
    *((_DWORD *)v5 + 4) = LODWORD(self->_minimumConfidence);
    v5[4] = (id)self->_maximumLabels;
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

- (float)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(float)a3
{
  self->_minimumConfidence = a3;
}

- (unint64_t)maximumLabels
{
  return self->_maximumLabels;
}

- (void)setMaximumLabels:(unint64_t)a3
{
  self->_maximumLabels = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disallowedList, 0);
}

@end
