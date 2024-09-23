@implementation _VNImageAnalyzerMultiDetectorSceneOperationPointsProvider

- (_VNImageAnalyzerMultiDetectorSceneOperationPointsProvider)initWithOperationPointsCache:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v7;
  id v8;
  _VNImageAnalyzerMultiDetectorSceneOperationPointsProvider *v9;
  _VNImageAnalyzerMultiDetectorSceneOperationPointsProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_VNImageAnalyzerMultiDetectorSceneOperationPointsProvider;
  v9 = -[_VNImageAnalyzerMultiDetectorSceneOperationPointsProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_operationPointsCache, a3);
    objc_storeStrong((id *)&v10->_originatingRequestSpecifier, a4);
  }

  return v10;
}

- (id)operationPointsAndReturnError:(id *)a3
{
  return -[_VNImageAnalyzerMultiDetectorSceneOperationPointsCache sceneLabelOperationPointsForOriginatingRequestSpecifier:error:](self->_operationPointsCache, "sceneLabelOperationPointsForOriginatingRequestSpecifier:error:", self->_originatingRequestSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_operationPointsCache, 0);
}

@end
