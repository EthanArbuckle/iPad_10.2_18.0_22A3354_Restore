@implementation _VNImageAnalyzerMultiDetectorSceneOperationPointsCache

- (_VNImageAnalyzerMultiDetectorSceneOperationPointsCache)initWithInferenceNetworkDescriptor:(id)a3
{
  id v5;
  _VNImageAnalyzerMultiDetectorSceneOperationPointsCache *v6;
  _VNImageAnalyzerMultiDetectorSceneOperationPointsCache *v7;
  uint64_t v8;
  NSMutableDictionary *originatingRequestSpecifierToOperationPoints;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_VNImageAnalyzerMultiDetectorSceneOperationPointsCache;
  v6 = -[_VNImageAnalyzerMultiDetectorSceneOperationPointsCache init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inferenceNetworkDescriptor, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    originatingRequestSpecifierToOperationPoints = v7->_originatingRequestSpecifierToOperationPoints;
    v7->_originatingRequestSpecifierToOperationPoints = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (id)sceneLabelOperationPointsForOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  VisionCoreSceneNetInferenceNetworkDescriptor *inferenceNetworkDescriptor;
  void *v10;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_originatingRequestSpecifierToOperationPoints, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = objc_msgSend(v6, "specifiesRequestClass:revision:", objc_opt_class(), 3737841667);
    inferenceNetworkDescriptor = self->_inferenceNetworkDescriptor;
    if (v8)
      -[VisionCoreSceneNetInferenceNetworkDescriptor entityNetOperatingPointsFileURL](inferenceNetworkDescriptor, "entityNetOperatingPointsFileURL");
    else
      -[VisionCoreSceneNetInferenceNetworkDescriptor sceneOperatingPointsFileURL](inferenceNetworkDescriptor, "sceneOperatingPointsFileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      +[VNSceneTaxonomyOperationPoints loadFromURL:error:](VNSceneTaxonomyOperationPoints, "loadFromURL:error:", v10, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_10;
    }
    else
    {
      +[VNOperationPoints unspecifiedOperationPoints](VNOperationPoints, "unspecifiedOperationPoints");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_originatingRequestSpecifierToOperationPoints, "setObject:forKeyedSubscript:", v7, v6);
LABEL_10:

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifierToOperationPoints, 0);
  objc_storeStrong((id *)&self->_inferenceNetworkDescriptor, 0);
}

@end
