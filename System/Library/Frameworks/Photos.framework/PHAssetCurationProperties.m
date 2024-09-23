@implementation PHAssetCurationProperties

- (PHAssetCurationProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetCurationProperties *v10;
  PHAssetCurationProperties *v11;
  uint64_t v12;
  NSString *importedByBundleIdentifier;
  uint64_t v14;
  NSString *importedByDisplayName;
  uint64_t v16;
  NSDate *addedDate;
  void *v18;
  void *v19;
  float v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  float v24;
  void *v25;
  float v26;
  uint64_t v27;
  NSDate *lastSharedDate;
  float v29;
  uint64_t v30;
  NSData *objectSaliencyRectsData;
  uint64_t v32;
  NSString *syndicationIdentifier;
  void *v34;
  objc_super v36;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PHAssetCurationProperties;
  v10 = -[PHAssetCurationProperties init](&v36, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("additionalAttributes.importedByBundleIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    importedByBundleIdentifier = v11->_importedByBundleIdentifier;
    v11->_importedByBundleIdentifier = (NSString *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("additionalAttributes.importedByDisplayName"));
    v14 = objc_claimAutoreleasedReturnValue();
    importedByDisplayName = v11->_importedByDisplayName;
    v11->_importedByDisplayName = (NSString *)v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("addedDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    addedDate = v11->_addedDate;
    v11->_addedDate = (NSDate *)v16;

    objc_msgSend(v8, "objectForKey:", CFSTR("computedAttributes.interestingSubjectScore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "floatValue");
    else
      v20 = 0.5;
    v11->_interestingSubjectScore = v20;
    if (v5)
      v21 = CFSTR("computedAttributes.behavioralScore");
    else
      v21 = CFSTR("behavioralScore");
    if (v5)
      v22 = CFSTR("computedAttributes.interactionScore");
    else
      v22 = CFSTR("interactionScore");
    objc_msgSend(v8, "objectForKeyedSubscript:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    v11->_behavioralScore = v24;

    objc_msgSend(v8, "objectForKeyedSubscript:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    v11->_interactionScore = v26;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lastSharedDate"));
    v27 = objc_claimAutoreleasedReturnValue();
    lastSharedDate = v11->_lastSharedDate;
    v11->_lastSharedDate = (NSDate *)v27;

    -[PHAssetCurationProperties _semanticScoreFromBehavioralScore:](v11, "_semanticScoreFromBehavioralScore:", v11->_behavioralScore);
    v11->_semanticScore = v29;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("additionalAttributes.objectSaliencyRectsData"));
    v30 = objc_claimAutoreleasedReturnValue();
    objectSaliencyRectsData = v11->_objectSaliencyRectsData;
    v11->_objectSaliencyRectsData = (NSData *)v30;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("additionalAttributes.syndicationIdentifier"));
    v32 = objc_claimAutoreleasedReturnValue();
    syndicationIdentifier = v11->_syndicationIdentifier;
    v11->_syndicationIdentifier = (NSString *)v32;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isDetectedScreenshot"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_isDetectedScreenshot = objc_msgSend(v34, "BOOLValue");

  }
  return v11;
}

- (NSArray)objectSaliencyRects
{
  NSArray *cachedObjectSaliencyRects;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSData *objectSaliencyRectsData;
  NSArray *v9;
  id v10;
  NSArray *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  cachedObjectSaliencyRects = self->_cachedObjectSaliencyRects;
  if (cachedObjectSaliencyRects)
    return cachedObjectSaliencyRects;
  if (!self->_objectSaliencyRectsData)
  {
    cachedObjectSaliencyRects = 0;
    return cachedObjectSaliencyRects;
  }
  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objectSaliencyRectsData = self->_objectSaliencyRectsData;
  v14 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, objectSaliencyRectsData, &v14);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  v11 = self->_cachedObjectSaliencyRects;
  self->_cachedObjectSaliencyRects = v9;

  if (!self->_cachedObjectSaliencyRects)
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Failed to unarchive objectSaliencyRectsData: %@", buf, 0xCu);
    }

  }
  return self->_cachedObjectSaliencyRects;
}

- (float)_semanticScoreFromBehavioralScore:(double)a3
{
  return fmod(a3, 0.1) * 100.0;
}

- (NSString)importedByBundleIdentifier
{
  return self->_importedByBundleIdentifier;
}

- (NSString)importedByDisplayName
{
  return self->_importedByDisplayName;
}

- (NSDate)addedDate
{
  return self->_addedDate;
}

- (float)interestingSubjectScore
{
  return self->_interestingSubjectScore;
}

- (float)behavioralScore
{
  return self->_behavioralScore;
}

- (float)semanticScore
{
  return self->_semanticScore;
}

- (float)interactionScore
{
  return self->_interactionScore;
}

- (NSDate)lastSharedDate
{
  return self->_lastSharedDate;
}

- (NSString)syndicationIdentifier
{
  return self->_syndicationIdentifier;
}

- (BOOL)isDetectedScreenshot
{
  return self->_isDetectedScreenshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSharedDate, 0);
  objc_storeStrong((id *)&self->_addedDate, 0);
  objc_storeStrong((id *)&self->_importedByDisplayName, 0);
  objc_storeStrong((id *)&self->_importedByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedObjectSaliencyRects, 0);
  objc_storeStrong((id *)&self->_objectSaliencyRectsData, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetCuration");
}

+ (id)entityName
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_55;
}

void __46__PHAssetCurationProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("addedDate");
  v3[1] = CFSTR("computedAttributes.interestingSubjectScore");
  v3[2] = CFSTR("computedAttributes.behavioralScore");
  v3[3] = CFSTR("computedAttributes.interactionScore");
  v3[4] = CFSTR("lastSharedDate");
  v3[5] = CFSTR("additionalAttributes.objectSaliencyRectsData");
  v3[6] = CFSTR("additionalAttributes.importedByBundleIdentifier");
  v3[7] = CFSTR("additionalAttributes.importedByDisplayName");
  v3[8] = CFSTR("additionalAttributes.syndicationIdentifier");
  v3[9] = CFSTR("isDetectedScreenshot");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 10);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_55;
  propertiesToFetch_pl_once_object_55 = v1;

}

@end
