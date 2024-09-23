@implementation VNImageAnalyzerCompoundRequestGroupingConfiguration

- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_detectorConfigurationOptions, "setObject:forKeyedSubscript:", a4, a3);
}

- (void)addOriginalRequest:(id)a3 forKind:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_kindToOriginalRequestsMapping, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    -[NSMutableDictionary setObject:forKey:](self->_kindToOriginalRequestsMapping, "setObject:forKey:");
  }
  objc_msgSend(v7, "addObject:", v8);
  -[NSMutableArray addObject:](self->_originalRequests, "addObject:", v8);

}

- (id)computeStageDeviceAssignments
{
  return (id)-[NSMutableDictionary copy](self->_computeStageDeviceAssignments, "copy");
}

- (id)originalRequests
{
  return self->_originalRequests;
}

- (id)detectorConfigurationOptions
{
  return self->_detectorConfigurationOptions;
}

- (id)addSceneConfigurationForOriginalRequest:(id)a3
{
  id v4;
  id v5;
  VNImageAnalyzerMultiDetectorSceneClassificationConfiguration *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SceneConfigurations"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_detectorConfigurationOptions, "setObject:forKeyedSubscript:", v5, CFSTR("VNImageAnalyzerMultiDetectorOption_SceneConfigurations"));
  }
  v6 = -[VNImageAnalyzerMultiDetectorSceneClassificationConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorSceneClassificationConfiguration alloc], "initWithObservationsRecipient:", v4);
  objc_msgSend(v5, "addObject:", v6);

  return v6;
}

- (id)addSceneprintConfigurationForOriginalRequest:(id)a3
{
  id v4;
  id v5;
  VNImageAnalyzerMultiDetectorSceneprintConfiguration *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorOption_SceneprintConfigurations"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_detectorConfigurationOptions, "setObject:forKeyedSubscript:", v5, CFSTR("VNImageAnalyzerMultiDetectorOption_SceneprintConfigurations"));
  }
  v6 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorSceneprintConfiguration alloc], "initWithObservationsRecipient:", v4);
  objc_msgSend(v5, "addObject:", v6);

  return v6;
}

- (void)addTilingWarningRecorder:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNImageAnalyzerMultiDetectorProcessingOption_TilingWarningRecorders"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_detectorConfigurationOptions, "setObject:forKeyedSubscript:");
  }
  if (objc_msgSend(v4, "indexOfObjectIdenticalTo:", v5) == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "addObject:", v5);

}

- (void)enumerateOriginalRequestsByKindUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *kindToOriginalRequestsMapping;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  kindToOriginalRequestsMapping = self->_kindToOriginalRequestsMapping;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__VNImageAnalyzerCompoundRequestGroupingConfiguration_enumerateOriginalRequestsByKindUsingBlock___block_invoke;
  v7[3] = &unk_1E4543880;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](kindToOriginalRequestsMapping, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeStageDeviceAssignments, 0);
  objc_storeStrong((id *)&self->_detectorConfigurationOptions, 0);
  objc_storeStrong((id *)&self->_kindToOriginalRequestsMapping, 0);
  objc_storeStrong((id *)&self->_originalRequests, 0);
}

void __97__VNImageAnalyzerCompoundRequestGroupingConfiguration_enumerateOriginalRequestsByKindUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = objc_msgSend(v11, "unsignedIntegerValue");
  v10 = (void *)objc_msgSend(v7, "copy");
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t))(v8 + 16))(v8, v9, v10, a4);

}

@end
