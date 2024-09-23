@implementation VNImageAnalyzerMultiDetectorAnalysisConfiguration

- (VNImageAnalyzerMultiDetectorAnalysisConfiguration)initWithObservationsRecipient:(id)a3
{
  id v5;
  VNImageAnalyzerMultiDetectorAnalysisConfiguration *v6;
  VNImageAnalyzerMultiDetectorAnalysisConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNImageAnalyzerMultiDetectorAnalysisConfiguration;
  v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_observationsRecipient, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationsRecipient, 0);
}

- (unsigned)analysisTypes
{
  return 0;
}

- (unsigned)labelsListType
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObservationsRecipient:", self->_observationsRecipient);
}

- (VNObservationsRecipient)observationsRecipient
{
  return self->_observationsRecipient;
}

@end
