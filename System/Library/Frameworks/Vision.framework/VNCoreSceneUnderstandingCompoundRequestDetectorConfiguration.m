@implementation VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration

- (VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration)initWithMainStageComputeDevice:(id)a3
{
  id v5;
  VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration *v6;
  VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration *v7;
  NSMutableArray *v8;
  NSMutableArray *originalRequests;
  NSMutableDictionary *v10;
  NSMutableDictionary *detectorConfigurationOptions;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration;
  v6 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mainStageComputeDevice, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    originalRequests = v7->_originalRequests;
    v7->_originalRequests = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    detectorConfigurationOptions = v7->_detectorConfigurationOptions;
    v7->_detectorConfigurationOptions = v10;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_detectorConfigurationOptions, "setObject:forKeyedSubscript:", &unk_1E459CF88, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));
  }

  return v7;
}

- (id)addSceneprintConfigurationForOriginalRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_SceneprintConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addImageClassificationConfigurationForOriginalRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addEntityNetClassificationConfigurationForOriginalRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addImageAestheticsConfigurationForOriginalRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageAestheticsConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addImageSaliencyAConfigurationForOriginalRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addImageSaliencyOConfigurationForOriginalRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addRecognizeObjectsConfigurationForOriginalRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addImageFingerprintsConfigurationForOriginalRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageFingerprintsConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addJunkConfigurationForOriginalRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addVN5kJNH3eYuyaLxNpZr5Z7ziConfigurationForOriginalRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addSignificantEventConfigurationForOriginalRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_SignificantEventConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addCityNatureConfigurationForOriginalRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration _addFeatureConfigurationOfClass:forOriginalRequest:storedInOptionsKey:]((id *)&self->super.isa, v5, v4, CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDetectorConfigurationOption:(id)a3 value:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_detectorConfigurationOptions, "setObject:forKeyedSubscript:", a4, a3);
}

- (void)addOriginalRequest:(id)a3
{
  -[NSMutableArray addObject:](self->_originalRequests, "addObject:", a3);
}

- (id)mainStageComputeDevice
{
  return self->_mainStageComputeDevice;
}

- (id)detectorConfigurationOptions
{
  return self->_detectorConfigurationOptions;
}

- (id)originalRequests
{
  return self->_originalRequests;
}

- (void)cacheResultsInRequestPerformingContext:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD aBlock[4];
  id v20;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration_cacheResultsInRequestPerformingContext___block_invoke;
  aBlock[3] = &unk_1E4548040;
  v5 = v4;
  v20 = v5;
  v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_SceneprintConfigurations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v9);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageAestheticsConfigurations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v10);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v11);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v12);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v13);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_ImageFingerprintsConfigurations"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v14);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v15);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v16);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_SignificantEventConfigurations"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v17);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_detectorConfigurationOptions, "objectForKeyedSubscript:", CFSTR("VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v18);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorConfigurationOptions, 0);
  objc_storeStrong((id *)&self->_originalRequests, 0);
  objc_storeStrong((id *)&self->_mainStageComputeDevice, 0);
}

void __103__VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration_cacheResultsInRequestPerformingContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "observationsRecipient", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "cacheObservationsOfRequest:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)_addFeatureConfigurationOfClass:(void *)a3 forOriginalRequest:(void *)a4 storedInOptionsKey:
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(a1[3], "objectForKey:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(a1[3], "setObject:forKey:", v9, v8);
    }
    a1 = (id *)objc_msgSend([a2 alloc], "initWithObservationsRecipient:", v7);
    objc_msgSend(v9, "addObject:", a1);

  }
  return a1;
}

@end
