@implementation PHSceneClassification

- (BOOL)_validateStartTime:(double)a3 duration:(double)a4 classificationType:(int64_t)a5
{
  BOOL v5;
  BOOL v6;
  BOOL v7;

  v5 = a3 == 0.0;
  if (a4 != 0.0)
    v5 = 0;
  v6 = ((1 << a5) & 0xC) != 0 && a4 > 0.0;
  if (((1 << a5) & 0xF1) != 0)
    v7 = v5;
  else
    v7 = v6;
  return (unint64_t)a5 <= 7 && v7;
}

- (PHSceneClassification)initWithExtendedSceneIdentifier:(unint64_t)a3 confidence:(double)a4 classificationType:(int64_t)a5
{
  return -[PHSceneClassification initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:](self, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", a3, a5, a4, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), 0.0, 0.0);
}

- (PHSceneClassification)initWithExtendedSceneIdentifier:(unint64_t)a3 confidence:(double)a4 boundingBox:(CGRect)a5 startTime:(double)a6 duration:(double)a7 classificationType:(int64_t)a8
{
  double height;
  double width;
  double y;
  double x;
  PHSceneClassification *v19;
  PHSceneClassification *v20;
  _OWORD *p_x;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  if (!-[PHSceneClassification _validateStartTime:duration:classificationType:](self, "_validateStartTime:duration:classificationType:", a8, a6, a7)|| (v38.receiver = self, v38.super_class = (Class)PHSceneClassification, (v19 = -[PHSceneClassification init](&v38, sel_init)) == 0))
  {
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid combination of parameters for PHSceneClassification (id: %llu) - startTime: %g, duration: %g, classificationType: %ld"), a3, *(_QWORD *)&a6, *(_QWORD *)&a7, a8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v30, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v31);
  }
  v20 = v19;
  v19->_boundingBox.origin.x = x;
  p_x = (_OWORD *)&v19->_boundingBox.origin.x;
  v19->_extendedSceneIdentifier = a3;
  v19->_confidence = a4;
  v19->_boundingBox.origin.y = y;
  v19->_boundingBox.size.width = width;
  v19->_boundingBox.size.height = height;
  v19->_startTime = a6;
  v19->_duration = a7;
  v19->_classificationType = a8;
  v22 = *MEMORY[0x1E0C9D648];
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  v41.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v41.origin.y = v23;
  v41.size.width = v24;
  v41.size.height = v25;
  if (CGRectEqualToRect(v39, v41))
  {
    v26 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *p_x = *MEMORY[0x1E0C9D628];
    p_x[1] = v26;
  }
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  if (CGRectIsNull(v40))
  {
    height = v25;
    width = v24;
    y = v23;
    x = v22;
  }
  if (!PLCGRectIsNormalized())
  {
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v34 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("Invalid CGRect for PHSceneClassification (id: %llu) passed to %@, rect must be non-zero normalized or CGRectNull"), a3, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "exceptionWithName:reason:userInfo:", v33, v36, 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v37);
  }
  v20->_packedBoundingBoxRect = MEMORY[0x19AEBE1A0](x, y, width, height);
  return v20;
}

- (unsigned)sceneIdentifier
{
  unint64_t extendedSceneIdentifier;
  NSObject *v4;
  unint64_t v5;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  extendedSceneIdentifier = self->_extendedSceneIdentifier;
  if (HIDWORD(extendedSceneIdentifier))
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = self->_extendedSceneIdentifier;
      v7 = 134217984;
      v8 = v5;
      _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_FAULT, "Using 32 bit SPI to return 64 bit value (value: %lld)", (uint8_t *)&v7, 0xCu);
    }

    LODWORD(extendedSceneIdentifier) = 0;
  }
  return extendedSceneIdentifier;
}

- (void)setSceneIdentifier:(unsigned int)a3
{
  self->_extendedSceneIdentifier = a3;
}

- (BOOL)isEqualToSceneClassification:(id)a3
{
  id v4;
  int64_t classificationType;
  unint64_t extendedSceneIdentifier;
  double confidence;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  BOOL v13;
  CGRect v15;

  v4 = a3;
  classificationType = self->_classificationType;
  if (classificationType == objc_msgSend(v4, "classificationType")
    && (extendedSceneIdentifier = self->_extendedSceneIdentifier,
        extendedSceneIdentifier == objc_msgSend(v4, "extendedSceneIdentifier"))
    && (confidence = self->_confidence, objc_msgSend(v4, "confidence"), confidence == v8))
  {
    objc_msgSend(v4, "boundingBox");
    v15.origin.x = v9;
    v15.origin.y = v10;
    v15.size.width = v11;
    v15.size.height = v12;
    v13 = CGRectEqualToRect(self->_boundingBox, v15);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PHSceneClassification *v4;
  BOOL v5;

  v4 = (PHSceneClassification *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PHSceneClassification isEqualToSceneClassification:](self, "isEqualToSceneClassification:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_extendedSceneIdentifier;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  _QWORD v16[6];
  _QWORD v17[6];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB36F8];
  DCIM_NSValueFromCGRect();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v3, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;

  if (v6)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Failed to archive boundingBoxData, error: %@", buf, 0xCu);
    }

  }
  v16[0] = CFSTR("sceneIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_extendedSceneIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v16[1] = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  v17[2] = v5;
  v16[2] = CFSTR("packedBoundingBoxRect");
  v16[3] = CFSTR("startTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v10;
  v16[4] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v11;
  v16[5] = CFSTR("classificationType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_classificationType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (PHSceneClassification)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  PHSceneClassification *v30;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("packedBoundingBoxRect"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v7, &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v32;

  if (v9)
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v9;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "Failed to archive boundingBoxData, error: %@", buf, 0xCu);
    }

  }
  v11 = MEMORY[0x19AEBD9FC](v8);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTime"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  v28 = v27;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("classificationType"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PHSceneClassification initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:](self, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v19, objc_msgSend(v29, "integerValue"), v22, v11, v13, v15, v17, v25, v28);

  return v30;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PHSceneClassification;
  -[PHSceneClassification description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ id: %llu, classificationType: %ld, confidence %.4f"), v4, self->_extendedSceneIdentifier, self->_classificationType, *(_QWORD *)&self->_confidence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)extendedSceneIdentifier
{
  return self->_extendedSceneIdentifier;
}

- (double)confidence
{
  return self->_confidence;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)packedBoundingBoxRect
{
  return self->_packedBoundingBoxRect;
}

- (void)setPackedBoundingBoxRect:(int64_t)a3
{
  self->_packedBoundingBoxRect = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)classificationType
{
  return self->_classificationType;
}

+ (id)fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3
{
  return (id)objc_msgSend(a1, "_fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:includeTemporalClassifications:sceneClassificationTypePredicate:", a3, 0, 0);
}

+ (id)fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3 includeTemporalClassifications:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:includeTemporalClassifications:sceneClassificationTypePredicate:", a3, a4, 0);
}

+ (id)fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3 sceneClassificationType:(int64_t)a4
{
  return (id)objc_msgSend(a1, "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:sceneClassificationType:includeTemporalClassifications:", a3, a4, 1);
}

+ (id)fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3 sceneClassificationType:(int64_t)a4 includeTemporalClassifications:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0CB3880];
  v9 = a3;
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K = %ld"), CFSTR("classificationType"), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:includeTemporalClassifications:sceneClassificationTypePredicate:", v9, v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:(id)a3 includeTemporalClassifications:(BOOL)a4 sceneClassificationTypePredicate:(id)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _BOOL4 v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__18807;
  v36 = __Block_byref_object_dispose__18808;
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  v23 = v6;
  v12 = 0;
  if (v11)
  {
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);
        objc_msgSend(v15, "localIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v17, v16);

        if (!v12)
        {
          objc_msgSend(v15, "photoLibrary");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "photoLibrary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v11);
  }

  v19 = (void *)MEMORY[0x1E0D71AB0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __154__PHSceneClassification__fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets_includeTemporalClassifications_sceneClassificationTypePredicate___block_invoke;
  v25[3] = &unk_1E35D9C78;
  v27 = &v32;
  v20 = v9;
  v26 = v20;
  objc_msgSend(v19, "batchFetchScenesByAssetObjectIDWithAssetObjectIDs:library:includeTemporalClassifications:sceneClassificationTypePredicate:completion:", v8, v12, v23, v24, v25);
  v21 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v21;
}

void __154__PHSceneClassification__fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets_includeTemporalClassifications_sceneClassificationTypePredicate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __154__PHSceneClassification__fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets_includeTemporalClassifications_sceneClassificationTypePredicate___block_invoke_2;
  v10[3] = &unk_1E35D9C50;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __154__PHSceneClassification__fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets_includeTemporalClassifications_sceneClassificationTypePredicate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  PHSceneClassification *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  PHSceneClassification *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = a1;
  v29 = v5;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("packedBoundingBoxRect"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "longLongValue");
        PLSplitToCGRectFromInt64();

        v13 = [PHSceneClassification alloc];
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedLongLongValue");
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("confidence"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("startTime"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v21 = v20;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("duration"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        v24 = v23;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("classificationType"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[PHSceneClassification initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:](v13, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v15, objc_msgSend(v25, "integerValue"), v18, 0.0, 0.0, 0.0, 0.0, v21, v24);

        objc_msgSend(v31, "addObject:", v26);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v28 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v31, v27);
}

@end
