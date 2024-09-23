@implementation _VNImageAnalyzerMultiDetectorTilingSceneConfiguration

- (_VNImageAnalyzerMultiDetectorTilingSceneConfiguration)initWithObservationsRecipient:(id)a3
{
  id v4;
  _VNImageAnalyzerMultiDetectorTilingObservationsRecipient *v5;
  _VNImageAnalyzerMultiDetectorTilingSceneConfiguration *v6;
  _VNImageAnalyzerMultiDetectorTilingSceneConfiguration *v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v5 = -[_VNImageAnalyzerMultiDetectorTilingObservationsRecipient initWithObservationsRecipient:]([_VNImageAnalyzerMultiDetectorTilingObservationsRecipient alloc], "initWithObservationsRecipient:", v4);
  v10.receiver = self;
  v10.super_class = (Class)_VNImageAnalyzerMultiDetectorTilingSceneConfiguration;
  v6 = -[VNImageAnalyzerMultiDetectorSceneClassificationConfiguration initWithObservationsRecipient:](&v10, sel_initWithObservationsRecipient_, v5);
  v7 = v6;
  if (v6)
  {
    -[VNImageAnalyzerMultiDetectorSceneClassificationConfiguration setDisallowedList:](v6, "setDisallowedList:", 0);
    LODWORD(v8) = 0;
    -[VNImageAnalyzerMultiDetectorSceneClassificationConfiguration setMinimumConfidence:](v7, "setMinimumConfidence:", v8);
    -[VNImageAnalyzerMultiDetectorSceneClassificationConfiguration setMaximumLeafLabels:](v7, "setMaximumLeafLabels:", 0x7FFFFFFFFFFFFFFFLL);
    -[VNImageAnalyzerMultiDetectorSceneClassificationConfiguration setMaximumHierarchicalLabels:](v7, "setMaximumHierarchicalLabels:", 0x7FFFFFFFFFFFFFFFLL);
  }

  return v7;
}

@end
