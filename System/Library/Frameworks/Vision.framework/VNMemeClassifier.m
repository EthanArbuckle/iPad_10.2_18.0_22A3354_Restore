@implementation VNMemeClassifier

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VNMemeClassifier_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNMemeClassifier configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNMemeClassifier configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNMemeClassifier configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4
{
  const __CFString *v5;
  int v7;

  v7 = 0;
  _getModelDropForConfigurationOptions(a3, &v7, 0);
  if (v7 == 1)
    v5 = CFSTR("SCL_v0.3.1_9c7zcipfrc_558001.espresso");
  else
    v5 = 0;
  +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:error:](VNEspressoHelpers, "pathForEspressoNetworkModelFileWithName:error:", v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)inputImageBlobNameForConfiguration:(id)a3
{
  __CFString *v3;
  int v5;

  v5 = 0;
  _getModelDropForConfigurationOptions(a3, &v5, 0);
  if (v5 == 1)
    v3 = CFSTR("image");
  else
    v3 = 0;
  return v3;
}

+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3
{
  return 1111970369;
}

+ (BOOL)providesSceneLabelsForConfiguration:(id)a3
{
  BOOL result;
  int v4;

  v4 = 0;
  result = _getModelDropForConfigurationOptions(a3, &v4, 0);
  if (v4 != 1)
    return 0;
  return result;
}

+ (id)sceneLabelsFilePathForConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  int v11;

  v6 = a3;
  v11 = 0;
  if ((_getModelDropForConfigurationOptions(v6, &v11, a4) & 1) != 0)
  {
    if (v11 == 1)
    {
      +[VNEspressoHelpers pathForEspressoResourceWithFilename:error:](VNEspressoHelpers, "pathForEspressoResourceWithFilename:error:", CFSTR("SCL_v0.3.1_9c7zcipfrc_558001-labels-v3.txt"), a4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10.receiver = a1;
      v10.super_class = (Class)&OBJC_METACLASS___VNMemeClassifier;
      objc_msgSendSuper2(&v10, sel_sceneLabelsFilePathForConfiguration_error_, v6, a4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __57__VNMemeClassifier_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNMemeClassifier;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNMemeClassifier configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNMemeClassifier configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (id)supportedIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  -[VNImageAnalyzerBasedDetector supportedClassificationIdentifiersAcceptedByBlock:error:](self, "supportedClassificationIdentifiersAcceptedByBlock:error:", 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  -[VNDetector configurationOptions](self, "configurationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_getModelDropForConfigurationOptions(v7, &self->_modelDrop, a4) & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)VNMemeClassifier;
    v8 = -[VNImageAnalyzerBasedDetector completeInitializationForSession:error:](&v10, sel_completeInitializationForSession_error_, v6, a4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4
{
  _BOOL4 v6;
  char *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNMemeClassifier;
  v6 = -[VNImageAnalyzerBasedDetector configureImageAnalyzerOptions:error:](&v9, sel_configureImageAnalyzerOptions_error_, a3, a4);
  if (v6 && self->_modelDrop == 1)
  {
    if (*((char *)a3 + 143) < 0)
    {
      *((_QWORD *)a3 + 16) = 20;
      v7 = (char *)*((_QWORD *)a3 + 15);
    }
    else
    {
      v7 = (char *)a3 + 120;
      *((_BYTE *)a3 + 143) = 20;
    }
    strcpy(v7, "merged/probabilities");
  }
  return v6;
}

- (unsigned)analysisTypesForProcessOptions:(id)a3
{
  return 2;
}

- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7
{
  -[VNImageAnalyzerBasedDetector observationsForSceneLabelsFromLastAnalysisOfImageAnalyzer:identifierAcceptingBlock:operationPointsProvider:originatingRequestSpecifier:qosClass:error:](self, "observationsForSceneLabelsFromLastAnalysisOfImageAnalyzer:identifierAcceptingBlock:operationPointsProvider:originatingRequestSpecifier:qosClass:error:", a3, 0, 0, a5, *(_QWORD *)&a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
