@implementation VNRecognizeDocumentsRequestConfiguration

- (VNRecognizeDocumentsRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNRecognizeDocumentsRequestConfiguration *v3;
  VNRecognizeDocumentsRequestConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNRecognizeDocumentsRequestConfiguration;
  v3 = -[VNRecognizeTextRequestConfiguration initWithRequestClass:](&v6, sel_initWithRequestClass_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_detectionOnly = 0;
    v3->_usesAlternateLineGrouping = 0;
    v3->_usesFormFieldDetection = 0;
    v3->_maximumCandidateCount = 3;
    -[VNRecognizeTextRequestConfiguration setAutomaticallyDetectsLanguage:](v3, "setAutomaticallyDetectsLanguage:", 1);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNRecognizeDocumentsRequestConfiguration;
  v4 = -[VNRecognizeTextRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setDetectionOnly:", self->_detectionOnly);
    objc_msgSend(v5, "setUsesAlternateLineGrouping:", self->_usesAlternateLineGrouping);
    objc_msgSend(v5, "setUsesFormFieldDetection:", self->_usesFormFieldDetection);
    objc_msgSend(v5, "setMaximumCandidateCount:", self->_maximumCandidateCount);
  }
  return v5;
}

- (BOOL)detectionOnly
{
  return self->_detectionOnly;
}

- (void)setDetectionOnly:(BOOL)a3
{
  self->_detectionOnly = a3;
}

- (BOOL)usesAlternateLineGrouping
{
  return self->_usesAlternateLineGrouping;
}

- (void)setUsesAlternateLineGrouping:(BOOL)a3
{
  self->_usesAlternateLineGrouping = a3;
}

- (BOOL)usesFormFieldDetection
{
  return self->_usesFormFieldDetection;
}

- (void)setUsesFormFieldDetection:(BOOL)a3
{
  self->_usesFormFieldDetection = a3;
}

- (unint64_t)maximumCandidateCount
{
  return self->_maximumCandidateCount;
}

- (void)setMaximumCandidateCount:(unint64_t)a3
{
  self->_maximumCandidateCount = a3;
}

@end
