@implementation PHAssetSceneAnalysisProperties

- (PHAssetSceneAnalysisProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHAssetSceneAnalysisProperties *v9;
  PHAssetSceneAnalysisProperties *v10;
  void *v11;
  uint64_t v12;
  NSDate *sceneAnalysisTimestamp;
  uint64_t v14;
  NSData *distanceIdentity;
  void *v16;
  uint64_t v17;
  NSDate *privateEncryptedComputeAnalysisTimestamp;
  void *v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PHAssetSceneAnalysisProperties;
  v9 = -[PHAssetSceneAnalysisProperties init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.sceneAnalysisVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_sceneAnalysisVersion = objc_msgSend(v11, "shortValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.sceneAnalysisTimestamp"));
    v12 = objc_claimAutoreleasedReturnValue();
    sceneAnalysisTimestamp = v10->_sceneAnalysisTimestamp;
    v10->_sceneAnalysisTimestamp = (NSDate *)v12;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.distanceIdentity"));
    v14 = objc_claimAutoreleasedReturnValue();
    distanceIdentity = v10->_distanceIdentity;
    v10->_distanceIdentity = (NSData *)v14;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mediaAnalysisAttributes.vaAnalysisVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_privateEncryptedComputeAnalysisVersion = objc_msgSend(v16, "shortValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mediaAnalysisAttributes.vaAnalysisTimestamp"));
    v17 = objc_claimAutoreleasedReturnValue();
    privateEncryptedComputeAnalysisTimestamp = v10->_privateEncryptedComputeAnalysisTimestamp;
    v10->_privateEncryptedComputeAnalysisTimestamp = (NSDate *)v17;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mediaAnalysisAttributes.vaLocationAnalysisVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_privateEncryptedComputeLocationAnalysisVersion = objc_msgSend(v19, "shortValue");

  }
  return v10;
}

- (signed)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (NSDate)sceneAnalysisTimestamp
{
  return self->_sceneAnalysisTimestamp;
}

- (NSData)distanceIdentity
{
  return self->_distanceIdentity;
}

- (signed)privateEncryptedComputeAnalysisVersion
{
  return self->_privateEncryptedComputeAnalysisVersion;
}

- (NSDate)privateEncryptedComputeAnalysisTimestamp
{
  return self->_privateEncryptedComputeAnalysisTimestamp;
}

- (signed)privateEncryptedComputeLocationAnalysisVersion
{
  return self->_privateEncryptedComputeLocationAnalysisVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateEncryptedComputeAnalysisTimestamp, 0);
  objc_storeStrong((id *)&self->_distanceIdentity, 0);
  objc_storeStrong((id *)&self->_sceneAnalysisTimestamp, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetSceneAnalysis");
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)entityName
{
  return 0;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_51;
}

void __51__PHAssetSceneAnalysisProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("additionalAttributes.sceneAnalysisVersion");
  v3[1] = CFSTR("additionalAttributes.sceneAnalysisTimestamp");
  v3[2] = CFSTR("additionalAttributes.distanceIdentity");
  v3[3] = CFSTR("mediaAnalysisAttributes.imageEmbeddingVersion");
  v3[4] = CFSTR("mediaAnalysisAttributes.vaAnalysisVersion");
  v3[5] = CFSTR("mediaAnalysisAttributes.vaAnalysisTimestamp");
  v3[6] = CFSTR("mediaAnalysisAttributes.vaLocationAnalysisVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_51;
  propertiesToFetch_pl_once_object_51 = v1;

}

@end
