@implementation _VNImageAnalyzerMultiDetectorTilingObservationsRecipient

- (_VNImageAnalyzerMultiDetectorTilingObservationsRecipient)initWithObservationsRecipient:(id)a3
{
  id v5;
  _VNImageAnalyzerMultiDetectorTilingObservationsRecipient *v6;
  _VNImageAnalyzerMultiDetectorTilingObservationsRecipient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VNImageAnalyzerMultiDetectorTilingObservationsRecipient;
  v6 = -[_VNImageAnalyzerMultiDetectorTilingObservationsRecipient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_observationsRecipient, a3);

  return v7;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return (VNRequestSpecifier *)-[VNObservationsRecipient originatingRequestSpecifier](self->_observationsRecipient, "originatingRequestSpecifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationsRecipient, 0);
}

@end
