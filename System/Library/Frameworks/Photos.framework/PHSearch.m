@implementation PHSearch

+ (id)spotlightTextLinesFromDocumentObservation:(id)a3 algorithmVersion:(int64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D71AE0], "spotlightTextLinesFromDocumentObservation:", a3, a4);
}

+ (id)spotlightSceneClassificationsFromPhotosSceneClassifications:(id)a3 algorithmVersion:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = objc_alloc_init(MEMORY[0x1E0D71AD8]);
  objc_msgSend(v7, "searchIndexSceneTaxonomyForSceneAnalysisVersion:", (__int16)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D71B50], "spotlightScenesFromScenes:sceneTaxonomy:", v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v9);
    objc_msgSend(MEMORY[0x1E0D71B50], "spotlightAudioClassificationsFromScenes:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v10);
    v11 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    PLSearchBackendSceneTaxonomyGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 134217984;
      v15 = a4;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Failed to load Scene Taxonomy for analysis version: %ld. Unable to translate scenes.", (uint8_t *)&v14, 0xCu);
    }

    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

+ (id)spotlightContentRatingFromPhotosSceneClassifications:(id)a3 algorithmVersion:(int64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D71B50], "contentRatingFromScenes:algorithmVersion:", a3, (__int16)a4);
}

+ (id)spotlightSceneClassificationsFromDetectionTraits:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D71B50], "spotlightScenesFromDetectionTraits:", a3);
}

@end
