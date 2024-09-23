@implementation PHAssetSceneprintProperties

- (PHAssetSceneprintProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetSceneprintProperties *v10;
  PHAssetSceneprintProperties *v11;
  uint64_t v12;
  NSData *sceneprint;
  uint64_t v14;
  NSData *duplicateMatchingData;
  const __CFString *v16;
  uint64_t v17;
  NSData *v18;
  uint64_t v19;
  NSData *v20;
  uint64_t v21;
  NSData *duplicateMatchingAlternateData;
  objc_super v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PHAssetSceneprintProperties;
  v10 = -[PHAssetSceneprintProperties init](&v24, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("additionalAttributes.sceneprint.data"));
      v12 = objc_claimAutoreleasedReturnValue();
      sceneprint = v11->_sceneprint;
      v11->_sceneprint = (NSData *)v12;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("additionalAttributes.sceneprint.duplicateMatchingData"));
      v14 = objc_claimAutoreleasedReturnValue();
      duplicateMatchingData = v11->_duplicateMatchingData;
      v11->_duplicateMatchingData = (NSData *)v14;

      v16 = CFSTR("additionalAttributes.sceneprint.duplicateMatchingAlternateData");
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sceneprint.data"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v11->_sceneprint;
      v11->_sceneprint = (NSData *)v17;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sceneprint.duplicateMatchingData"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v11->_duplicateMatchingData;
      v11->_duplicateMatchingData = (NSData *)v19;

      v16 = CFSTR("sceneprint.duplicateMatchingAlternateData");
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", v16);
    v21 = objc_claimAutoreleasedReturnValue();
    duplicateMatchingAlternateData = v11->_duplicateMatchingAlternateData;
    v11->_duplicateMatchingAlternateData = (NSData *)v21;

  }
  return v11;
}

- (NSString)duplicateMatchingValue
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PHAssetSceneprintProperties duplicateMatchingData](self, "duplicateMatchingData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return (NSString *)v5;
}

- (NSString)duplicateMatchingAlternateValue
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PHAssetSceneprintProperties duplicateMatchingAlternateData](self, "duplicateMatchingAlternateData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return (NSString *)v5;
}

- (NSData)sceneprint
{
  return self->_sceneprint;
}

- (NSData)duplicateMatchingData
{
  return self->_duplicateMatchingData;
}

- (NSData)duplicateMatchingAlternateData
{
  return self->_duplicateMatchingAlternateData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateMatchingAlternateData, 0);
  objc_storeStrong((id *)&self->_duplicateMatchingData, 0);
  objc_storeStrong((id *)&self->_sceneprint, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetSceneprint");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_64;
}

void __48__PHAssetSceneprintProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("sceneprint.data");
  v3[1] = CFSTR("sceneprint.duplicateMatchingData");
  v3[2] = CFSTR("sceneprint.duplicateMatchingAlternateData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_64;
  propertiesToFetch_pl_once_object_64 = v1;

}

@end
