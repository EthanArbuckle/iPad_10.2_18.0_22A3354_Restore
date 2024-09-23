@implementation _VNImageAnalyzerMultiDetectorClassificationCustomHierarchy

- (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)newHierarchicalModelAndReturnError:(id *)a3
{
  ImageClassifier_HierarchicalModel *v3;
  __shared_weak_count *v4;
  shared_ptr<vision::mod::ImageClassifier_HierarchicalModel> result;

  v3 = (ImageClassifier_HierarchicalModel *)+[VNImageAnalyzerMultiDetector createHierarchicalModelForMultiDetectorModel:error:](VNImageAnalyzerMultiDetector, "createHierarchicalModelForMultiDetectorModel:error:", 1, a3);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

@end
