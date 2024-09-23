@implementation PHAssetVisualSearchProperties

- (PHAssetVisualSearchProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetVisualSearchProperties *v10;
  PHAssetVisualSearchProperties *v11;
  uint64_t v12;
  NSData *visualSearchData;
  void *v14;
  uint64_t v15;
  NSDate *adjustmentVersion;
  void *v17;
  void *v18;
  float v19;
  const __CFString *v20;
  uint64_t v21;
  NSData *v22;
  void *v23;
  uint64_t v24;
  NSDate *v25;
  void *v26;
  void *v27;
  float v28;
  void *v29;
  float v30;
  objc_super v32;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PHAssetVisualSearchProperties;
  v10 = -[PHAssetVisualSearchProperties init](&v32, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaAnalysisAttributes.visualSearchAttributes.visualSearchData"));
      v12 = objc_claimAutoreleasedReturnValue();
      visualSearchData = v11->_visualSearchData;
      v11->_visualSearchData = (NSData *)v12;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaAnalysisAttributes.visualSearchAttributes.algorithmVersion"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_algorithmVersion = objc_msgSend(v14, "integerValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaAnalysisAttributes.visualSearchAttributes.adjustmentVersion"));
      v15 = objc_claimAutoreleasedReturnValue();
      adjustmentVersion = v11->_adjustmentVersion;
      v11->_adjustmentVersion = (NSDate *)v15;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaAnalysisAttributes.asset.stickerConfidenceScore"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaAnalysisAttributes.asset.stickerConfidenceScore"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        v11->_stickerConfidenceScore = v19;

        v20 = CFSTR("mediaAnalysisAttributes.visualSearchAttributes.stickerConfidenceAlgorithmVersion");
LABEL_7:
        objc_msgSend(v8, "objectForKeyedSubscript:", v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "floatValue");
        v11->_stickerAlgorithmVersion = (uint64_t)v30;

        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("visualSearchAttributes.visualSearchData"));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v11->_visualSearchData;
      v11->_visualSearchData = (NSData *)v21;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("visualSearchAttributes.algorithmVersion"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_algorithmVersion = objc_msgSend(v23, "integerValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("visualSearchAttributes.adjustmentVersion"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v11->_adjustmentVersion;
      v11->_adjustmentVersion = (NSDate *)v24;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("asset.stickerConfidenceScore"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("asset.stickerConfidenceScore"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        v11->_stickerConfidenceScore = v28;

        v20 = CFSTR("visualSearchAttributes.stickerConfidenceAlgorithmVersion");
        goto LABEL_7;
      }
    }
    v11->_stickerConfidenceScore = *(float *)MEMORY[0x1E0D71F70];
    v11->_stickerAlgorithmVersion = 0;
  }
LABEL_9:

  return v11;
}

- (NSData)visualSearchData
{
  return self->_visualSearchData;
}

- (float)stickerConfidenceScore
{
  return self->_stickerConfidenceScore;
}

- (int64_t)stickerAlgorithmVersion
{
  return self->_stickerAlgorithmVersion;
}

- (int64_t)algorithmVersion
{
  return self->_algorithmVersion;
}

- (NSDate)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentVersion, 0);
  objc_storeStrong((id *)&self->_visualSearchData, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetVisualSearchProperties");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_62;
}

+ (id)entityName
{
  return CFSTR("MediaAnalysisAssetAttributes");
}

+ (id)keyPathFromPrimaryObject
{
  return CFSTR("mediaAnalysisAttributes");
}

void __50__PHAssetVisualSearchProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("visualSearchAttributes.visualSearchData");
  v3[1] = CFSTR("visualSearchAttributes.stickerConfidenceAlgorithmVersion");
  v3[2] = CFSTR("asset.stickerConfidenceScore");
  v3[3] = CFSTR("visualSearchAttributes.algorithmVersion");
  v3[4] = CFSTR("visualSearchAttributes.adjustmentVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_62;
  propertiesToFetch_pl_once_object_62 = v1;

}

@end
