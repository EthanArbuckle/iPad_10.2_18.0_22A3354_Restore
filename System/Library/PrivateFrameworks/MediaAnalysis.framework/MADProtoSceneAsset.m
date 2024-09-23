@implementation MADProtoSceneAsset

- (void)clearSceneClassifications
{
  -[NSMutableArray removeAllObjects](self->_sceneClassifications, "removeAllObjects");
}

- (void)addSceneClassifications:(id)a3
{
  id v4;
  NSMutableArray *sceneClassifications;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sceneClassifications = self->_sceneClassifications;
  v8 = v4;
  if (!sceneClassifications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sceneClassifications;
    self->_sceneClassifications = v6;

    v4 = v8;
    sceneClassifications = self->_sceneClassifications;
  }
  -[NSMutableArray addObject:](sceneClassifications, "addObject:", v4);

}

- (unint64_t)sceneClassificationsCount
{
  return -[NSMutableArray count](self->_sceneClassifications, "count");
}

- (id)sceneClassificationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sceneClassifications, "objectAtIndex:", a3);
}

+ (Class)sceneClassificationsType
{
  return (Class)objc_opt_class();
}

- (void)clearObjectSaliencyRects
{
  -[NSMutableArray removeAllObjects](self->_objectSaliencyRects, "removeAllObjects");
}

- (void)addObjectSaliencyRects:(id)a3
{
  id v4;
  NSMutableArray *objectSaliencyRects;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  objectSaliencyRects = self->_objectSaliencyRects;
  v8 = v4;
  if (!objectSaliencyRects)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_objectSaliencyRects;
    self->_objectSaliencyRects = v6;

    v4 = v8;
    objectSaliencyRects = self->_objectSaliencyRects;
  }
  -[NSMutableArray addObject:](objectSaliencyRects, "addObject:", v4);

}

- (unint64_t)objectSaliencyRectsCount
{
  return -[NSMutableArray count](self->_objectSaliencyRects, "count");
}

- (id)objectSaliencyRectsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_objectSaliencyRects, "objectAtIndex:", a3);
}

+ (Class)objectSaliencyRectsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDuplicateMatchingData
{
  return self->_duplicateMatchingData != 0;
}

- (BOOL)hasDuplicateMatchingAlternateData
{
  return self->_duplicateMatchingAlternateData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MADProtoSceneAsset;
  -[MADProtoSceneAsset description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoSceneAsset dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *assetCloudIdentifier;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  VCPProtoBounds *preferredCropRect;
  void *v61;
  VCPProtoBounds *acceptableCropRect;
  void *v63;
  double v64;
  void *v65;
  NSMutableArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  void *v71;
  NSData *sceneprintData;
  void *v73;
  double v74;
  NSData *colorNormalizationData;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  double v82;
  NSData *duplicateMatchingData;
  NSData *duplicateMatchingAlternateData;
  void *v85;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if (assetCloudIdentifier)
    objc_msgSend(v3, "setObject:forKey:", assetCloudIdentifier, CFSTR("assetCloudIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_assetAdjustmentTimestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("assetAdjustmentTimestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_algorithmVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("algorithmVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_adjustmentVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("adjustmentVersion"));

  if (-[NSMutableArray count](self->_sceneClassifications, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_sceneClassifications, "count"));
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v11 = self->_sceneClassifications;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v92 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("sceneClassifications"));
  }
  *(float *)&v9 = self->_overallAestheticScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("overallAestheticScore"));

  *(float *)&v18 = self->_wellFramedSubjectScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("wellFramedSubjectScore"));

  *(float *)&v20 = self->_wellChosenSubjectScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("wellChosenSubjectScore"));

  *(float *)&v22 = self->_tastefullyBlurredScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("tastefullyBlurredScore"));

  *(float *)&v24 = self->_sharplyFocusedSubjectScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("sharplyFocusedSubjectScore"));

  *(float *)&v26 = self->_wellTimedShotScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("wellTimedShotScore"));

  *(float *)&v28 = self->_pleasantLightingScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("pleasantLightingScore"));

  *(float *)&v30 = self->_pleasantReflectionsScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("pleasantReflectionsScore"));

  *(float *)&v32 = self->_harmoniousColorScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("harmoniousColorScore"));

  *(float *)&v34 = self->_livelyColorScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("livelyColorScore"));

  *(float *)&v36 = self->_pleasantSymmetryScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("pleasantSymmetryScore"));

  *(float *)&v38 = self->_pleasantPatternScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("pleasantPatternScore"));

  *(float *)&v40 = self->_immersivenessScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("immersivenessScore"));

  *(float *)&v42 = self->_pleasantPerspectiveScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("pleasantPerspectiveScore"));

  *(float *)&v44 = self->_pleasantPostProcessingScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("pleasantPostProcessingScore"));

  *(float *)&v46 = self->_noiseScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("noiseScore"));

  *(float *)&v48 = self->_failureScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("failureScore"));

  *(float *)&v50 = self->_pleasantCompositionScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("pleasantCompositionScore"));

  *(float *)&v52 = self->_interestingSubjectScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("interestingSubjectScore"));

  *(float *)&v54 = self->_intrusiveObjectPresenceScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("intrusiveObjectPresenceScore"));

  *(float *)&v56 = self->_pleasantCameraTiltScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("pleasantCameraTiltScore"));

  *(float *)&v58 = self->_lowLight;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("lowLight"));

  preferredCropRect = self->_preferredCropRect;
  if (preferredCropRect)
  {
    -[VCPProtoBounds dictionaryRepresentation](preferredCropRect, "dictionaryRepresentation");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v61, CFSTR("preferredCropRect"));

  }
  acceptableCropRect = self->_acceptableCropRect;
  if (acceptableCropRect)
  {
    -[VCPProtoBounds dictionaryRepresentation](acceptableCropRect, "dictionaryRepresentation");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v63, CFSTR("acceptableCropRect"));

  }
  if (-[NSMutableArray count](self->_objectSaliencyRects, "count"))
  {
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_objectSaliencyRects, "count"));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v66 = self->_objectSaliencyRects;
    v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v68; ++j)
        {
          if (*(_QWORD *)v88 != v69)
            objc_enumerationMutation(v66);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v87);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObject:", v71);

        }
        v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
      }
      while (v68);
    }

    objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("objectSaliencyRects"));
  }
  sceneprintData = self->_sceneprintData;
  if (sceneprintData)
    objc_msgSend(v4, "setObject:forKey:", sceneprintData, CFSTR("sceneprintData"));
  *(float *)&v64 = self->_wallpaperScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v64, (_QWORD)v87);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("wallpaperScore"));

  colorNormalizationData = self->_colorNormalizationData;
  if (colorNormalizationData)
    objc_msgSend(v4, "setObject:forKey:", colorNormalizationData, CFSTR("colorNormalizationData"));
  *(float *)&v74 = self->_blurrinessScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v74);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v76, CFSTR("blurrinessScore"));

  *(float *)&v77 = self->_exposureScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("exposureScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_probableRotationDirection);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v79, CFSTR("probableRotationDirection"));

  *(float *)&v80 = self->_probableRotationDirectionConfidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("probableRotationDirectionConfidence"));

  duplicateMatchingData = self->_duplicateMatchingData;
  if (duplicateMatchingData)
    objc_msgSend(v4, "setObject:forKey:", duplicateMatchingData, CFSTR("duplicateMatchingData"));
  duplicateMatchingAlternateData = self->_duplicateMatchingAlternateData;
  if (duplicateMatchingAlternateData)
    objc_msgSend(v4, "setObject:forKey:", duplicateMatchingAlternateData, CFSTR("duplicateMatchingAlternateData"));
  *(float *)&v82 = self->_iconicScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v82);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v85, CFSTR("iconicScore"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MADProtoSceneAssetReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_sceneClassifications;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_objectSaliencyRects;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  PBDataWriterWriteDataField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteDataField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteFloatField();
  if (self->_duplicateMatchingData)
    PBDataWriterWriteDataField();
  if (self->_duplicateMatchingAlternateData)
    PBDataWriterWriteDataField();
  PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  float *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "setAssetCloudIdentifier:", self->_assetCloudIdentifier);
  *((_QWORD *)v13 + 2) = *(_QWORD *)&self->_assetAdjustmentTimestamp;
  *((_DWORD *)v13 + 8) = self->_algorithmVersion;
  *((_QWORD *)v13 + 1) = *(_QWORD *)&self->_adjustmentVersion;
  if (-[MADProtoSceneAsset sceneClassificationsCount](self, "sceneClassificationsCount"))
  {
    objc_msgSend(v13, "clearSceneClassifications");
    v4 = -[MADProtoSceneAsset sceneClassificationsCount](self, "sceneClassificationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[MADProtoSceneAsset sceneClassificationsAtIndex:](self, "sceneClassificationsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSceneClassifications:", v7);

      }
    }
  }
  *((_DWORD *)v13 + 32) = LODWORD(self->_overallAestheticScore);
  *((_DWORD *)v13 + 54) = LODWORD(self->_wellFramedSubjectScore);
  *((_DWORD *)v13 + 53) = LODWORD(self->_wellChosenSubjectScore);
  *((_DWORD *)v13 + 51) = LODWORD(self->_tastefullyBlurredScore);
  *((_DWORD *)v13 + 50) = LODWORD(self->_sharplyFocusedSubjectScore);
  *((_DWORD *)v13 + 55) = LODWORD(self->_wellTimedShotScore);
  *((_DWORD *)v13 + 35) = LODWORD(self->_pleasantLightingScore);
  *((_DWORD *)v13 + 39) = LODWORD(self->_pleasantReflectionsScore);
  *((_DWORD *)v13 + 22) = LODWORD(self->_harmoniousColorScore);
  *((_DWORD *)v13 + 27) = LODWORD(self->_livelyColorScore);
  *((_DWORD *)v13 + 40) = LODWORD(self->_pleasantSymmetryScore);
  *((_DWORD *)v13 + 36) = LODWORD(self->_pleasantPatternScore);
  *((_DWORD *)v13 + 24) = LODWORD(self->_immersivenessScore);
  *((_DWORD *)v13 + 37) = LODWORD(self->_pleasantPerspectiveScore);
  *((_DWORD *)v13 + 38) = LODWORD(self->_pleasantPostProcessingScore);
  *((_DWORD *)v13 + 29) = LODWORD(self->_noiseScore);
  *((_DWORD *)v13 + 21) = LODWORD(self->_failureScore);
  *((_DWORD *)v13 + 34) = LODWORD(self->_pleasantCompositionScore);
  *((_DWORD *)v13 + 25) = LODWORD(self->_interestingSubjectScore);
  *((_DWORD *)v13 + 26) = LODWORD(self->_intrusiveObjectPresenceScore);
  *((_DWORD *)v13 + 33) = LODWORD(self->_pleasantCameraTiltScore);
  *((_DWORD *)v13 + 28) = LODWORD(self->_lowLight);
  objc_msgSend(v13, "setPreferredCropRect:", self->_preferredCropRect);
  objc_msgSend(v13, "setAcceptableCropRect:", self->_acceptableCropRect);
  if (-[MADProtoSceneAsset objectSaliencyRectsCount](self, "objectSaliencyRectsCount"))
  {
    objc_msgSend(v13, "clearObjectSaliencyRects");
    v8 = -[MADProtoSceneAsset objectSaliencyRectsCount](self, "objectSaliencyRectsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[MADProtoSceneAsset objectSaliencyRectsAtIndex:](self, "objectSaliencyRectsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObjectSaliencyRects:", v11);

      }
    }
  }
  objc_msgSend(v13, "setSceneprintData:", self->_sceneprintData);
  *((_DWORD *)v13 + 52) = LODWORD(self->_wallpaperScore);
  objc_msgSend(v13, "setColorNormalizationData:", self->_colorNormalizationData);
  v12 = (float *)v13;
  *((_DWORD *)v13 + 12) = LODWORD(self->_blurrinessScore);
  *((_DWORD *)v13 + 20) = LODWORD(self->_exposureScore);
  *((_DWORD *)v13 + 44) = self->_probableRotationDirection;
  *((_DWORD *)v13 + 45) = LODWORD(self->_probableRotationDirectionConfidence);
  if (self->_duplicateMatchingData)
  {
    objc_msgSend(v13, "setDuplicateMatchingData:");
    v12 = (float *)v13;
  }
  if (self->_duplicateMatchingAlternateData)
  {
    objc_msgSend(v13, "setDuplicateMatchingAlternateData:");
    v12 = (float *)v13;
  }
  v12[23] = self->_iconicScore;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_assetCloudIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  *(double *)(v5 + 16) = self->_assetAdjustmentTimestamp;
  *(_DWORD *)(v5 + 32) = self->_algorithmVersion;
  *(double *)(v5 + 8) = self->_adjustmentVersion;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = self->_sceneClassifications;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSceneClassifications:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v10);
  }

  *(float *)(v5 + 128) = self->_overallAestheticScore;
  *(float *)(v5 + 216) = self->_wellFramedSubjectScore;
  *(float *)(v5 + 212) = self->_wellChosenSubjectScore;
  *(float *)(v5 + 204) = self->_tastefullyBlurredScore;
  *(float *)(v5 + 200) = self->_sharplyFocusedSubjectScore;
  *(float *)(v5 + 220) = self->_wellTimedShotScore;
  *(float *)(v5 + 140) = self->_pleasantLightingScore;
  *(float *)(v5 + 156) = self->_pleasantReflectionsScore;
  *(float *)(v5 + 88) = self->_harmoniousColorScore;
  *(float *)(v5 + 108) = self->_livelyColorScore;
  *(float *)(v5 + 160) = self->_pleasantSymmetryScore;
  *(float *)(v5 + 144) = self->_pleasantPatternScore;
  *(float *)(v5 + 96) = self->_immersivenessScore;
  *(float *)(v5 + 148) = self->_pleasantPerspectiveScore;
  *(float *)(v5 + 152) = self->_pleasantPostProcessingScore;
  *(float *)(v5 + 116) = self->_noiseScore;
  *(float *)(v5 + 84) = self->_failureScore;
  *(float *)(v5 + 136) = self->_pleasantCompositionScore;
  *(float *)(v5 + 100) = self->_interestingSubjectScore;
  *(float *)(v5 + 104) = self->_intrusiveObjectPresenceScore;
  *(float *)(v5 + 132) = self->_pleasantCameraTiltScore;
  *(float *)(v5 + 112) = self->_lowLight;
  v14 = -[VCPProtoBounds copyWithZone:](self->_preferredCropRect, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v14;

  v16 = -[VCPProtoBounds copyWithZone:](self->_acceptableCropRect, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = self->_objectSaliencyRects;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend((id)v5, "addObjectSaliencyRects:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v20);
  }

  v24 = -[NSData copyWithZone:](self->_sceneprintData, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v24;

  *(float *)(v5 + 208) = self->_wallpaperScore;
  v26 = -[NSData copyWithZone:](self->_colorNormalizationData, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v26;

  *(float *)(v5 + 48) = self->_blurrinessScore;
  *(float *)(v5 + 80) = self->_exposureScore;
  *(_DWORD *)(v5 + 176) = self->_probableRotationDirection;
  *(float *)(v5 + 180) = self->_probableRotationDirectionConfidence;
  v28 = -[NSData copyWithZone:](self->_duplicateMatchingData, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v28;

  v30 = -[NSData copyWithZone:](self->_duplicateMatchingAlternateData, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v30;

  *(float *)(v5 + 92) = self->_iconicScore;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *assetCloudIdentifier;
  NSMutableArray *sceneClassifications;
  VCPProtoBounds *preferredCropRect;
  VCPProtoBounds *acceptableCropRect;
  NSMutableArray *objectSaliencyRects;
  NSData *sceneprintData;
  NSData *colorNormalizationData;
  NSData *duplicateMatchingData;
  NSData *duplicateMatchingAlternateData;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_51;
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if ((unint64_t)assetCloudIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](assetCloudIdentifier, "isEqual:"))
      goto LABEL_51;
  }
  if (self->_assetAdjustmentTimestamp != *((double *)v4 + 2))
    goto LABEL_51;
  if (self->_algorithmVersion != *((_DWORD *)v4 + 8))
    goto LABEL_51;
  if (self->_adjustmentVersion != *((double *)v4 + 1))
    goto LABEL_51;
  sceneClassifications = self->_sceneClassifications;
  if ((unint64_t)sceneClassifications | *((_QWORD *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](sceneClassifications, "isEqual:"))
      goto LABEL_51;
  }
  if (self->_overallAestheticScore == *((float *)v4 + 32)
    && self->_wellFramedSubjectScore == *((float *)v4 + 54)
    && self->_wellChosenSubjectScore == *((float *)v4 + 53)
    && self->_tastefullyBlurredScore == *((float *)v4 + 51)
    && self->_sharplyFocusedSubjectScore == *((float *)v4 + 50)
    && self->_wellTimedShotScore == *((float *)v4 + 55)
    && self->_pleasantLightingScore == *((float *)v4 + 35)
    && self->_pleasantReflectionsScore == *((float *)v4 + 39)
    && self->_harmoniousColorScore == *((float *)v4 + 22)
    && self->_livelyColorScore == *((float *)v4 + 27)
    && self->_pleasantSymmetryScore == *((float *)v4 + 40)
    && self->_pleasantPatternScore == *((float *)v4 + 36)
    && self->_immersivenessScore == *((float *)v4 + 24)
    && self->_pleasantPerspectiveScore == *((float *)v4 + 37)
    && self->_pleasantPostProcessingScore == *((float *)v4 + 38)
    && self->_noiseScore == *((float *)v4 + 29)
    && self->_failureScore == *((float *)v4 + 21)
    && self->_pleasantCompositionScore == *((float *)v4 + 34)
    && self->_interestingSubjectScore == *((float *)v4 + 25)
    && self->_intrusiveObjectPresenceScore == *((float *)v4 + 26)
    && self->_pleasantCameraTiltScore == *((float *)v4 + 33)
    && self->_lowLight == *((float *)v4 + 28)
    && ((preferredCropRect = self->_preferredCropRect, !((unint64_t)preferredCropRect | *((_QWORD *)v4 + 21)))
     || -[VCPProtoBounds isEqual:](preferredCropRect, "isEqual:"))
    && ((acceptableCropRect = self->_acceptableCropRect, !((unint64_t)acceptableCropRect | *((_QWORD *)v4 + 3)))
     || -[VCPProtoBounds isEqual:](acceptableCropRect, "isEqual:"))
    && ((objectSaliencyRects = self->_objectSaliencyRects,
         !((unint64_t)objectSaliencyRects | *((_QWORD *)v4 + 15)))
     || -[NSMutableArray isEqual:](objectSaliencyRects, "isEqual:"))
    && ((sceneprintData = self->_sceneprintData, !((unint64_t)sceneprintData | *((_QWORD *)v4 + 24)))
     || -[NSData isEqual:](sceneprintData, "isEqual:"))
    && self->_wallpaperScore == *((float *)v4 + 52)
    && ((colorNormalizationData = self->_colorNormalizationData,
         !((unint64_t)colorNormalizationData | *((_QWORD *)v4 + 7)))
     || -[NSData isEqual:](colorNormalizationData, "isEqual:"))
    && self->_blurrinessScore == *((float *)v4 + 12)
    && self->_exposureScore == *((float *)v4 + 20)
    && self->_probableRotationDirection == *((_DWORD *)v4 + 44)
    && self->_probableRotationDirectionConfidence == *((float *)v4 + 45)
    && ((duplicateMatchingData = self->_duplicateMatchingData,
         !((unint64_t)duplicateMatchingData | *((_QWORD *)v4 + 9)))
     || -[NSData isEqual:](duplicateMatchingData, "isEqual:"))
    && ((duplicateMatchingAlternateData = self->_duplicateMatchingAlternateData,
         !((unint64_t)duplicateMatchingAlternateData | *((_QWORD *)v4 + 8)))
     || -[NSData isEqual:](duplicateMatchingAlternateData, "isEqual:")))
  {
    v14 = self->_iconicScore == *((float *)v4 + 23);
  }
  else
  {
LABEL_51:
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  double assetAdjustmentTimestamp;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  double adjustmentVersion;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  float overallAestheticScore;
  float v14;
  float v15;
  float v16;
  unint64_t v17;
  float wellFramedSubjectScore;
  float v19;
  float v20;
  float v21;
  unint64_t v22;
  float wellChosenSubjectScore;
  float v24;
  float v25;
  float v26;
  unint64_t v27;
  float tastefullyBlurredScore;
  float v29;
  float v30;
  float v31;
  unint64_t v32;
  float sharplyFocusedSubjectScore;
  float v34;
  float v35;
  float v36;
  unint64_t v37;
  float wellTimedShotScore;
  float v39;
  float v40;
  float v41;
  unint64_t v42;
  float pleasantLightingScore;
  float v44;
  float v45;
  float v46;
  unint64_t v47;
  float pleasantReflectionsScore;
  float v49;
  float v50;
  float v51;
  unint64_t v52;
  float harmoniousColorScore;
  float v54;
  float v55;
  float v56;
  unint64_t v57;
  float livelyColorScore;
  float v59;
  float v60;
  float v61;
  unint64_t v62;
  float pleasantSymmetryScore;
  float v64;
  float v65;
  float v66;
  unint64_t v67;
  float pleasantPatternScore;
  float v69;
  float v70;
  float v71;
  unint64_t v72;
  float immersivenessScore;
  float v74;
  float v75;
  float v76;
  unint64_t v77;
  float pleasantPerspectiveScore;
  float v79;
  float v80;
  float v81;
  unint64_t v82;
  float pleasantPostProcessingScore;
  float v84;
  float v85;
  float v86;
  unint64_t v87;
  float noiseScore;
  float v89;
  float v90;
  float v91;
  unint64_t v92;
  float failureScore;
  float v94;
  float v95;
  float v96;
  unint64_t v97;
  float pleasantCompositionScore;
  float v99;
  float v100;
  float v101;
  unint64_t v102;
  float interestingSubjectScore;
  float v104;
  float v105;
  float v106;
  unint64_t v107;
  float intrusiveObjectPresenceScore;
  float v109;
  float v110;
  float v111;
  unint64_t v112;
  float pleasantCameraTiltScore;
  float v114;
  float v115;
  float v116;
  unint64_t v117;
  float lowLight;
  float v119;
  float v120;
  float v121;
  unint64_t v122;
  float wallpaperScore;
  float v124;
  float v125;
  float v126;
  unint64_t v127;
  float blurrinessScore;
  float v129;
  float v130;
  float v131;
  unint64_t v132;
  float exposureScore;
  float v134;
  float v135;
  float v136;
  unint64_t v137;
  uint64_t probableRotationDirection;
  float probableRotationDirectionConfidence;
  float v140;
  float v141;
  float v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  float iconicScore;
  float v147;
  float v148;
  float v149;
  unint64_t v150;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  unint64_t v157;
  unint64_t v158;
  unint64_t v159;
  unint64_t v160;
  unint64_t v161;
  unint64_t v162;
  unint64_t v163;
  unint64_t v164;
  unint64_t v165;
  unint64_t v166;
  unint64_t v167;
  unint64_t v168;
  unint64_t v169;
  unint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  unint64_t v175;
  unint64_t v176;
  unint64_t v177;
  unint64_t v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t algorithmVersion;
  unint64_t v182;
  NSUInteger v183;

  v183 = -[NSString hash](self->_assetCloudIdentifier, "hash");
  assetAdjustmentTimestamp = self->_assetAdjustmentTimestamp;
  v4 = -assetAdjustmentTimestamp;
  if (assetAdjustmentTimestamp >= 0.0)
    v4 = self->_assetAdjustmentTimestamp;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      v7 += (unint64_t)v6;
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  algorithmVersion = self->_algorithmVersion;
  v182 = v7;
  adjustmentVersion = self->_adjustmentVersion;
  v9 = -adjustmentVersion;
  if (adjustmentVersion >= 0.0)
    v9 = self->_adjustmentVersion;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  v180 = v12;
  v179 = -[NSMutableArray hash](self->_sceneClassifications, "hash");
  overallAestheticScore = self->_overallAestheticScore;
  v14 = -overallAestheticScore;
  if (overallAestheticScore >= 0.0)
    v14 = self->_overallAestheticScore;
  v15 = floorf(v14 + 0.5);
  v16 = (float)(v14 - v15) * 1.8447e19;
  v17 = 2654435761u * (unint64_t)fmodf(v15, 1.8447e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0)
      v17 += (unint64_t)v16;
  }
  else
  {
    v17 -= (unint64_t)fabsf(v16);
  }
  v178 = v17;
  wellFramedSubjectScore = self->_wellFramedSubjectScore;
  v19 = -wellFramedSubjectScore;
  if (wellFramedSubjectScore >= 0.0)
    v19 = self->_wellFramedSubjectScore;
  v20 = floorf(v19 + 0.5);
  v21 = (float)(v19 - v20) * 1.8447e19;
  v22 = 2654435761u * (unint64_t)fmodf(v20, 1.8447e19);
  if (v21 >= 0.0)
  {
    if (v21 > 0.0)
      v22 += (unint64_t)v21;
  }
  else
  {
    v22 -= (unint64_t)fabsf(v21);
  }
  v177 = v22;
  wellChosenSubjectScore = self->_wellChosenSubjectScore;
  v24 = -wellChosenSubjectScore;
  if (wellChosenSubjectScore >= 0.0)
    v24 = self->_wellChosenSubjectScore;
  v25 = floorf(v24 + 0.5);
  v26 = (float)(v24 - v25) * 1.8447e19;
  v27 = 2654435761u * (unint64_t)fmodf(v25, 1.8447e19);
  if (v26 >= 0.0)
  {
    if (v26 > 0.0)
      v27 += (unint64_t)v26;
  }
  else
  {
    v27 -= (unint64_t)fabsf(v26);
  }
  v176 = v27;
  tastefullyBlurredScore = self->_tastefullyBlurredScore;
  v29 = -tastefullyBlurredScore;
  if (tastefullyBlurredScore >= 0.0)
    v29 = self->_tastefullyBlurredScore;
  v30 = floorf(v29 + 0.5);
  v31 = (float)(v29 - v30) * 1.8447e19;
  v32 = 2654435761u * (unint64_t)fmodf(v30, 1.8447e19);
  if (v31 >= 0.0)
  {
    if (v31 > 0.0)
      v32 += (unint64_t)v31;
  }
  else
  {
    v32 -= (unint64_t)fabsf(v31);
  }
  v175 = v32;
  sharplyFocusedSubjectScore = self->_sharplyFocusedSubjectScore;
  v34 = -sharplyFocusedSubjectScore;
  if (sharplyFocusedSubjectScore >= 0.0)
    v34 = self->_sharplyFocusedSubjectScore;
  v35 = floorf(v34 + 0.5);
  v36 = (float)(v34 - v35) * 1.8447e19;
  v37 = 2654435761u * (unint64_t)fmodf(v35, 1.8447e19);
  if (v36 >= 0.0)
  {
    if (v36 > 0.0)
      v37 += (unint64_t)v36;
  }
  else
  {
    v37 -= (unint64_t)fabsf(v36);
  }
  v174 = v37;
  wellTimedShotScore = self->_wellTimedShotScore;
  v39 = -wellTimedShotScore;
  if (wellTimedShotScore >= 0.0)
    v39 = self->_wellTimedShotScore;
  v40 = floorf(v39 + 0.5);
  v41 = (float)(v39 - v40) * 1.8447e19;
  v42 = 2654435761u * (unint64_t)fmodf(v40, 1.8447e19);
  if (v41 >= 0.0)
  {
    if (v41 > 0.0)
      v42 += (unint64_t)v41;
  }
  else
  {
    v42 -= (unint64_t)fabsf(v41);
  }
  v173 = v42;
  pleasantLightingScore = self->_pleasantLightingScore;
  v44 = -pleasantLightingScore;
  if (pleasantLightingScore >= 0.0)
    v44 = self->_pleasantLightingScore;
  v45 = floorf(v44 + 0.5);
  v46 = (float)(v44 - v45) * 1.8447e19;
  v47 = 2654435761u * (unint64_t)fmodf(v45, 1.8447e19);
  if (v46 >= 0.0)
  {
    if (v46 > 0.0)
      v47 += (unint64_t)v46;
  }
  else
  {
    v47 -= (unint64_t)fabsf(v46);
  }
  v172 = v47;
  pleasantReflectionsScore = self->_pleasantReflectionsScore;
  v49 = -pleasantReflectionsScore;
  if (pleasantReflectionsScore >= 0.0)
    v49 = self->_pleasantReflectionsScore;
  v50 = floorf(v49 + 0.5);
  v51 = (float)(v49 - v50) * 1.8447e19;
  v52 = 2654435761u * (unint64_t)fmodf(v50, 1.8447e19);
  if (v51 >= 0.0)
  {
    if (v51 > 0.0)
      v52 += (unint64_t)v51;
  }
  else
  {
    v52 -= (unint64_t)fabsf(v51);
  }
  v171 = v52;
  harmoniousColorScore = self->_harmoniousColorScore;
  v54 = -harmoniousColorScore;
  if (harmoniousColorScore >= 0.0)
    v54 = self->_harmoniousColorScore;
  v55 = floorf(v54 + 0.5);
  v56 = (float)(v54 - v55) * 1.8447e19;
  v57 = 2654435761u * (unint64_t)fmodf(v55, 1.8447e19);
  if (v56 >= 0.0)
  {
    if (v56 > 0.0)
      v57 += (unint64_t)v56;
  }
  else
  {
    v57 -= (unint64_t)fabsf(v56);
  }
  v170 = v57;
  livelyColorScore = self->_livelyColorScore;
  v59 = -livelyColorScore;
  if (livelyColorScore >= 0.0)
    v59 = self->_livelyColorScore;
  v60 = floorf(v59 + 0.5);
  v61 = (float)(v59 - v60) * 1.8447e19;
  v62 = 2654435761u * (unint64_t)fmodf(v60, 1.8447e19);
  if (v61 >= 0.0)
  {
    if (v61 > 0.0)
      v62 += (unint64_t)v61;
  }
  else
  {
    v62 -= (unint64_t)fabsf(v61);
  }
  v169 = v62;
  pleasantSymmetryScore = self->_pleasantSymmetryScore;
  v64 = -pleasantSymmetryScore;
  if (pleasantSymmetryScore >= 0.0)
    v64 = self->_pleasantSymmetryScore;
  v65 = floorf(v64 + 0.5);
  v66 = (float)(v64 - v65) * 1.8447e19;
  v67 = 2654435761u * (unint64_t)fmodf(v65, 1.8447e19);
  if (v66 >= 0.0)
  {
    if (v66 > 0.0)
      v67 += (unint64_t)v66;
  }
  else
  {
    v67 -= (unint64_t)fabsf(v66);
  }
  v168 = v67;
  pleasantPatternScore = self->_pleasantPatternScore;
  v69 = -pleasantPatternScore;
  if (pleasantPatternScore >= 0.0)
    v69 = self->_pleasantPatternScore;
  v70 = floorf(v69 + 0.5);
  v71 = (float)(v69 - v70) * 1.8447e19;
  v72 = 2654435761u * (unint64_t)fmodf(v70, 1.8447e19);
  if (v71 >= 0.0)
  {
    if (v71 > 0.0)
      v72 += (unint64_t)v71;
  }
  else
  {
    v72 -= (unint64_t)fabsf(v71);
  }
  v167 = v72;
  immersivenessScore = self->_immersivenessScore;
  v74 = -immersivenessScore;
  if (immersivenessScore >= 0.0)
    v74 = self->_immersivenessScore;
  v75 = floorf(v74 + 0.5);
  v76 = (float)(v74 - v75) * 1.8447e19;
  v77 = 2654435761u * (unint64_t)fmodf(v75, 1.8447e19);
  if (v76 >= 0.0)
  {
    if (v76 > 0.0)
      v77 += (unint64_t)v76;
  }
  else
  {
    v77 -= (unint64_t)fabsf(v76);
  }
  v166 = v77;
  pleasantPerspectiveScore = self->_pleasantPerspectiveScore;
  v79 = -pleasantPerspectiveScore;
  if (pleasantPerspectiveScore >= 0.0)
    v79 = self->_pleasantPerspectiveScore;
  v80 = floorf(v79 + 0.5);
  v81 = (float)(v79 - v80) * 1.8447e19;
  v82 = 2654435761u * (unint64_t)fmodf(v80, 1.8447e19);
  if (v81 >= 0.0)
  {
    if (v81 > 0.0)
      v82 += (unint64_t)v81;
  }
  else
  {
    v82 -= (unint64_t)fabsf(v81);
  }
  v165 = v82;
  pleasantPostProcessingScore = self->_pleasantPostProcessingScore;
  v84 = -pleasantPostProcessingScore;
  if (pleasantPostProcessingScore >= 0.0)
    v84 = self->_pleasantPostProcessingScore;
  v85 = floorf(v84 + 0.5);
  v86 = (float)(v84 - v85) * 1.8447e19;
  v87 = 2654435761u * (unint64_t)fmodf(v85, 1.8447e19);
  if (v86 >= 0.0)
  {
    if (v86 > 0.0)
      v87 += (unint64_t)v86;
  }
  else
  {
    v87 -= (unint64_t)fabsf(v86);
  }
  v164 = v87;
  noiseScore = self->_noiseScore;
  v89 = -noiseScore;
  if (noiseScore >= 0.0)
    v89 = self->_noiseScore;
  v90 = floorf(v89 + 0.5);
  v91 = (float)(v89 - v90) * 1.8447e19;
  v92 = 2654435761u * (unint64_t)fmodf(v90, 1.8447e19);
  if (v91 >= 0.0)
  {
    if (v91 > 0.0)
      v92 += (unint64_t)v91;
  }
  else
  {
    v92 -= (unint64_t)fabsf(v91);
  }
  v163 = v92;
  failureScore = self->_failureScore;
  v94 = -failureScore;
  if (failureScore >= 0.0)
    v94 = self->_failureScore;
  v95 = floorf(v94 + 0.5);
  v96 = (float)(v94 - v95) * 1.8447e19;
  v97 = 2654435761u * (unint64_t)fmodf(v95, 1.8447e19);
  if (v96 >= 0.0)
  {
    if (v96 > 0.0)
      v97 += (unint64_t)v96;
  }
  else
  {
    v97 -= (unint64_t)fabsf(v96);
  }
  v162 = v97;
  pleasantCompositionScore = self->_pleasantCompositionScore;
  v99 = -pleasantCompositionScore;
  if (pleasantCompositionScore >= 0.0)
    v99 = self->_pleasantCompositionScore;
  v100 = floorf(v99 + 0.5);
  v101 = (float)(v99 - v100) * 1.8447e19;
  v102 = 2654435761u * (unint64_t)fmodf(v100, 1.8447e19);
  if (v101 >= 0.0)
  {
    if (v101 > 0.0)
      v102 += (unint64_t)v101;
  }
  else
  {
    v102 -= (unint64_t)fabsf(v101);
  }
  v161 = v102;
  interestingSubjectScore = self->_interestingSubjectScore;
  v104 = -interestingSubjectScore;
  if (interestingSubjectScore >= 0.0)
    v104 = self->_interestingSubjectScore;
  v105 = floorf(v104 + 0.5);
  v106 = (float)(v104 - v105) * 1.8447e19;
  v107 = 2654435761u * (unint64_t)fmodf(v105, 1.8447e19);
  if (v106 >= 0.0)
  {
    if (v106 > 0.0)
      v107 += (unint64_t)v106;
  }
  else
  {
    v107 -= (unint64_t)fabsf(v106);
  }
  v160 = v107;
  intrusiveObjectPresenceScore = self->_intrusiveObjectPresenceScore;
  v109 = -intrusiveObjectPresenceScore;
  if (intrusiveObjectPresenceScore >= 0.0)
    v109 = self->_intrusiveObjectPresenceScore;
  v110 = floorf(v109 + 0.5);
  v111 = (float)(v109 - v110) * 1.8447e19;
  v112 = 2654435761u * (unint64_t)fmodf(v110, 1.8447e19);
  if (v111 >= 0.0)
  {
    if (v111 > 0.0)
      v112 += (unint64_t)v111;
  }
  else
  {
    v112 -= (unint64_t)fabsf(v111);
  }
  v159 = v112;
  pleasantCameraTiltScore = self->_pleasantCameraTiltScore;
  v114 = -pleasantCameraTiltScore;
  if (pleasantCameraTiltScore >= 0.0)
    v114 = self->_pleasantCameraTiltScore;
  v115 = floorf(v114 + 0.5);
  v116 = (float)(v114 - v115) * 1.8447e19;
  v117 = 2654435761u * (unint64_t)fmodf(v115, 1.8447e19);
  if (v116 >= 0.0)
  {
    if (v116 > 0.0)
      v117 += (unint64_t)v116;
  }
  else
  {
    v117 -= (unint64_t)fabsf(v116);
  }
  v158 = v117;
  lowLight = self->_lowLight;
  v119 = -lowLight;
  if (lowLight >= 0.0)
    v119 = self->_lowLight;
  v120 = floorf(v119 + 0.5);
  v121 = (float)(v119 - v120) * 1.8447e19;
  v122 = 2654435761u * (unint64_t)fmodf(v120, 1.8447e19);
  if (v121 >= 0.0)
  {
    if (v121 > 0.0)
      v122 += (unint64_t)v121;
  }
  else
  {
    v122 -= (unint64_t)fabsf(v121);
  }
  v157 = -[VCPProtoBounds hash](self->_preferredCropRect, "hash");
  v156 = -[VCPProtoBounds hash](self->_acceptableCropRect, "hash");
  v155 = -[NSMutableArray hash](self->_objectSaliencyRects, "hash");
  v154 = -[NSData hash](self->_sceneprintData, "hash");
  wallpaperScore = self->_wallpaperScore;
  v124 = -wallpaperScore;
  if (wallpaperScore >= 0.0)
    v124 = self->_wallpaperScore;
  v125 = floorf(v124 + 0.5);
  v126 = (float)(v124 - v125) * 1.8447e19;
  v127 = 2654435761u * (unint64_t)fmodf(v125, 1.8447e19);
  if (v126 >= 0.0)
  {
    if (v126 > 0.0)
      v127 += (unint64_t)v126;
  }
  else
  {
    v127 -= (unint64_t)fabsf(v126);
  }
  v152 = -[NSData hash](self->_colorNormalizationData, "hash");
  blurrinessScore = self->_blurrinessScore;
  v129 = -blurrinessScore;
  if (blurrinessScore >= 0.0)
    v129 = self->_blurrinessScore;
  v130 = floorf(v129 + 0.5);
  v131 = (float)(v129 - v130) * 1.8447e19;
  v132 = 2654435761u * (unint64_t)fmodf(v130, 1.8447e19);
  if (v131 >= 0.0)
  {
    if (v131 > 0.0)
      v132 += (unint64_t)v131;
  }
  else
  {
    v132 -= (unint64_t)fabsf(v131);
  }
  exposureScore = self->_exposureScore;
  v134 = -exposureScore;
  if (exposureScore >= 0.0)
    v134 = self->_exposureScore;
  v135 = floorf(v134 + 0.5);
  v136 = (float)(v134 - v135) * 1.8447e19;
  v137 = 2654435761u * (unint64_t)fmodf(v135, 1.8447e19);
  if (v136 >= 0.0)
  {
    if (v136 > 0.0)
      v137 += (unint64_t)v136;
  }
  else
  {
    v137 -= (unint64_t)fabsf(v136);
  }
  probableRotationDirection = self->_probableRotationDirection;
  probableRotationDirectionConfidence = self->_probableRotationDirectionConfidence;
  v140 = -probableRotationDirectionConfidence;
  if (probableRotationDirectionConfidence >= 0.0)
    v140 = self->_probableRotationDirectionConfidence;
  v141 = floorf(v140 + 0.5);
  v142 = (float)(v140 - v141) * 1.8447e19;
  v143 = 2654435761u * (unint64_t)fmodf(v141, 1.8447e19);
  if (v142 >= 0.0)
  {
    if (v142 > 0.0)
      v143 += (unint64_t)v142;
  }
  else
  {
    v143 -= (unint64_t)fabsf(v142);
  }
  v144 = -[NSData hash](self->_duplicateMatchingData, "hash", v152);
  v145 = -[NSData hash](self->_duplicateMatchingAlternateData, "hash");
  iconicScore = self->_iconicScore;
  v147 = -iconicScore;
  if (iconicScore >= 0.0)
    v147 = self->_iconicScore;
  v148 = floorf(v147 + 0.5);
  v149 = (float)(v147 - v148) * 1.8447e19;
  v150 = 2654435761u * (unint64_t)fmodf(v148, 1.8447e19);
  if (v149 >= 0.0)
  {
    if (v149 > 0.0)
      v150 += (unint64_t)v149;
  }
  else
  {
    v150 -= (unint64_t)fabsf(v149);
  }
  return v182 ^ v183 ^ (2654435761 * algorithmVersion) ^ v180 ^ v179 ^ v178 ^ v177 ^ v176 ^ v175 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v122 ^ v157 ^ v156 ^ v155 ^ v154 ^ v127 ^ v153 ^ v132 ^ v137 ^ (2654435761 * probableRotationDirection) ^ v143 ^ v144 ^ v145 ^ v150;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  VCPProtoBounds *preferredCropRect;
  uint64_t v11;
  VCPProtoBounds *acceptableCropRect;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[MADProtoSceneAsset setAssetCloudIdentifier:](self, "setAssetCloudIdentifier:");
  self->_assetAdjustmentTimestamp = *((double *)v4 + 2);
  self->_algorithmVersion = *((_DWORD *)v4 + 8);
  self->_adjustmentVersion = *((double *)v4 + 1);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = *((id *)v4 + 23);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        -[MADProtoSceneAsset addSceneClassifications:](self, "addSceneClassifications:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  self->_overallAestheticScore = *((float *)v4 + 32);
  self->_wellFramedSubjectScore = *((float *)v4 + 54);
  self->_wellChosenSubjectScore = *((float *)v4 + 53);
  self->_tastefullyBlurredScore = *((float *)v4 + 51);
  self->_sharplyFocusedSubjectScore = *((float *)v4 + 50);
  self->_wellTimedShotScore = *((float *)v4 + 55);
  self->_pleasantLightingScore = *((float *)v4 + 35);
  self->_pleasantReflectionsScore = *((float *)v4 + 39);
  self->_harmoniousColorScore = *((float *)v4 + 22);
  self->_livelyColorScore = *((float *)v4 + 27);
  self->_pleasantSymmetryScore = *((float *)v4 + 40);
  self->_pleasantPatternScore = *((float *)v4 + 36);
  self->_immersivenessScore = *((float *)v4 + 24);
  self->_pleasantPerspectiveScore = *((float *)v4 + 37);
  self->_pleasantPostProcessingScore = *((float *)v4 + 38);
  self->_noiseScore = *((float *)v4 + 29);
  self->_failureScore = *((float *)v4 + 21);
  self->_pleasantCompositionScore = *((float *)v4 + 34);
  self->_interestingSubjectScore = *((float *)v4 + 25);
  self->_intrusiveObjectPresenceScore = *((float *)v4 + 26);
  self->_pleasantCameraTiltScore = *((float *)v4 + 33);
  self->_lowLight = *((float *)v4 + 28);
  preferredCropRect = self->_preferredCropRect;
  v11 = *((_QWORD *)v4 + 21);
  if (preferredCropRect)
  {
    if (v11)
      -[VCPProtoBounds mergeFrom:](preferredCropRect, "mergeFrom:");
  }
  else if (v11)
  {
    -[MADProtoSceneAsset setPreferredCropRect:](self, "setPreferredCropRect:");
  }
  acceptableCropRect = self->_acceptableCropRect;
  v13 = *((_QWORD *)v4 + 3);
  if (acceptableCropRect)
  {
    if (v13)
      -[VCPProtoBounds mergeFrom:](acceptableCropRect, "mergeFrom:");
  }
  else if (v13)
  {
    -[MADProtoSceneAsset setAcceptableCropRect:](self, "setAcceptableCropRect:");
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = *((id *)v4 + 15);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[MADProtoSceneAsset addObjectSaliencyRects:](self, "addObjectSaliencyRects:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

  if (*((_QWORD *)v4 + 24))
    -[MADProtoSceneAsset setSceneprintData:](self, "setSceneprintData:");
  self->_wallpaperScore = *((float *)v4 + 52);
  if (*((_QWORD *)v4 + 7))
    -[MADProtoSceneAsset setColorNormalizationData:](self, "setColorNormalizationData:");
  self->_blurrinessScore = *((float *)v4 + 12);
  self->_exposureScore = *((float *)v4 + 20);
  self->_probableRotationDirection = *((_DWORD *)v4 + 44);
  self->_probableRotationDirectionConfidence = *((float *)v4 + 45);
  if (*((_QWORD *)v4 + 9))
    -[MADProtoSceneAsset setDuplicateMatchingData:](self, "setDuplicateMatchingData:");
  if (*((_QWORD *)v4 + 8))
    -[MADProtoSceneAsset setDuplicateMatchingAlternateData:](self, "setDuplicateMatchingAlternateData:");
  self->_iconicScore = *((float *)v4 + 23);

}

- (NSString)assetCloudIdentifier
{
  return self->_assetCloudIdentifier;
}

- (void)setAssetCloudIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetCloudIdentifier, a3);
}

- (double)assetAdjustmentTimestamp
{
  return self->_assetAdjustmentTimestamp;
}

- (void)setAssetAdjustmentTimestamp:(double)a3
{
  self->_assetAdjustmentTimestamp = a3;
}

- (int)algorithmVersion
{
  return self->_algorithmVersion;
}

- (void)setAlgorithmVersion:(int)a3
{
  self->_algorithmVersion = a3;
}

- (double)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (void)setAdjustmentVersion:(double)a3
{
  self->_adjustmentVersion = a3;
}

- (NSMutableArray)sceneClassifications
{
  return self->_sceneClassifications;
}

- (void)setSceneClassifications:(id)a3
{
  objc_storeStrong((id *)&self->_sceneClassifications, a3);
}

- (float)overallAestheticScore
{
  return self->_overallAestheticScore;
}

- (void)setOverallAestheticScore:(float)a3
{
  self->_overallAestheticScore = a3;
}

- (float)wellFramedSubjectScore
{
  return self->_wellFramedSubjectScore;
}

- (void)setWellFramedSubjectScore:(float)a3
{
  self->_wellFramedSubjectScore = a3;
}

- (float)wellChosenSubjectScore
{
  return self->_wellChosenSubjectScore;
}

- (void)setWellChosenSubjectScore:(float)a3
{
  self->_wellChosenSubjectScore = a3;
}

- (float)tastefullyBlurredScore
{
  return self->_tastefullyBlurredScore;
}

- (void)setTastefullyBlurredScore:(float)a3
{
  self->_tastefullyBlurredScore = a3;
}

- (float)sharplyFocusedSubjectScore
{
  return self->_sharplyFocusedSubjectScore;
}

- (void)setSharplyFocusedSubjectScore:(float)a3
{
  self->_sharplyFocusedSubjectScore = a3;
}

- (float)wellTimedShotScore
{
  return self->_wellTimedShotScore;
}

- (void)setWellTimedShotScore:(float)a3
{
  self->_wellTimedShotScore = a3;
}

- (float)pleasantLightingScore
{
  return self->_pleasantLightingScore;
}

- (void)setPleasantLightingScore:(float)a3
{
  self->_pleasantLightingScore = a3;
}

- (float)pleasantReflectionsScore
{
  return self->_pleasantReflectionsScore;
}

- (void)setPleasantReflectionsScore:(float)a3
{
  self->_pleasantReflectionsScore = a3;
}

- (float)harmoniousColorScore
{
  return self->_harmoniousColorScore;
}

- (void)setHarmoniousColorScore:(float)a3
{
  self->_harmoniousColorScore = a3;
}

- (float)livelyColorScore
{
  return self->_livelyColorScore;
}

- (void)setLivelyColorScore:(float)a3
{
  self->_livelyColorScore = a3;
}

- (float)pleasantSymmetryScore
{
  return self->_pleasantSymmetryScore;
}

- (void)setPleasantSymmetryScore:(float)a3
{
  self->_pleasantSymmetryScore = a3;
}

- (float)pleasantPatternScore
{
  return self->_pleasantPatternScore;
}

- (void)setPleasantPatternScore:(float)a3
{
  self->_pleasantPatternScore = a3;
}

- (float)immersivenessScore
{
  return self->_immersivenessScore;
}

- (void)setImmersivenessScore:(float)a3
{
  self->_immersivenessScore = a3;
}

- (float)pleasantPerspectiveScore
{
  return self->_pleasantPerspectiveScore;
}

- (void)setPleasantPerspectiveScore:(float)a3
{
  self->_pleasantPerspectiveScore = a3;
}

- (float)pleasantPostProcessingScore
{
  return self->_pleasantPostProcessingScore;
}

- (void)setPleasantPostProcessingScore:(float)a3
{
  self->_pleasantPostProcessingScore = a3;
}

- (float)noiseScore
{
  return self->_noiseScore;
}

- (void)setNoiseScore:(float)a3
{
  self->_noiseScore = a3;
}

- (float)failureScore
{
  return self->_failureScore;
}

- (void)setFailureScore:(float)a3
{
  self->_failureScore = a3;
}

- (float)pleasantCompositionScore
{
  return self->_pleasantCompositionScore;
}

- (void)setPleasantCompositionScore:(float)a3
{
  self->_pleasantCompositionScore = a3;
}

- (float)interestingSubjectScore
{
  return self->_interestingSubjectScore;
}

- (void)setInterestingSubjectScore:(float)a3
{
  self->_interestingSubjectScore = a3;
}

- (float)intrusiveObjectPresenceScore
{
  return self->_intrusiveObjectPresenceScore;
}

- (void)setIntrusiveObjectPresenceScore:(float)a3
{
  self->_intrusiveObjectPresenceScore = a3;
}

- (float)pleasantCameraTiltScore
{
  return self->_pleasantCameraTiltScore;
}

- (void)setPleasantCameraTiltScore:(float)a3
{
  self->_pleasantCameraTiltScore = a3;
}

- (float)lowLight
{
  return self->_lowLight;
}

- (void)setLowLight:(float)a3
{
  self->_lowLight = a3;
}

- (VCPProtoBounds)preferredCropRect
{
  return self->_preferredCropRect;
}

- (void)setPreferredCropRect:(id)a3
{
  objc_storeStrong((id *)&self->_preferredCropRect, a3);
}

- (VCPProtoBounds)acceptableCropRect
{
  return self->_acceptableCropRect;
}

- (void)setAcceptableCropRect:(id)a3
{
  objc_storeStrong((id *)&self->_acceptableCropRect, a3);
}

- (NSMutableArray)objectSaliencyRects
{
  return self->_objectSaliencyRects;
}

- (void)setObjectSaliencyRects:(id)a3
{
  objc_storeStrong((id *)&self->_objectSaliencyRects, a3);
}

- (NSData)sceneprintData
{
  return self->_sceneprintData;
}

- (void)setSceneprintData:(id)a3
{
  objc_storeStrong((id *)&self->_sceneprintData, a3);
}

- (float)wallpaperScore
{
  return self->_wallpaperScore;
}

- (void)setWallpaperScore:(float)a3
{
  self->_wallpaperScore = a3;
}

- (NSData)colorNormalizationData
{
  return self->_colorNormalizationData;
}

- (void)setColorNormalizationData:(id)a3
{
  objc_storeStrong((id *)&self->_colorNormalizationData, a3);
}

- (float)blurrinessScore
{
  return self->_blurrinessScore;
}

- (void)setBlurrinessScore:(float)a3
{
  self->_blurrinessScore = a3;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (void)setExposureScore:(float)a3
{
  self->_exposureScore = a3;
}

- (int)probableRotationDirection
{
  return self->_probableRotationDirection;
}

- (void)setProbableRotationDirection:(int)a3
{
  self->_probableRotationDirection = a3;
}

- (float)probableRotationDirectionConfidence
{
  return self->_probableRotationDirectionConfidence;
}

- (void)setProbableRotationDirectionConfidence:(float)a3
{
  self->_probableRotationDirectionConfidence = a3;
}

- (NSData)duplicateMatchingData
{
  return self->_duplicateMatchingData;
}

- (void)setDuplicateMatchingData:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateMatchingData, a3);
}

- (NSData)duplicateMatchingAlternateData
{
  return self->_duplicateMatchingAlternateData;
}

- (void)setDuplicateMatchingAlternateData:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateMatchingAlternateData, a3);
}

- (float)iconicScore
{
  return self->_iconicScore;
}

- (void)setIconicScore:(float)a3
{
  self->_iconicScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneprintData, 0);
  objc_storeStrong((id *)&self->_sceneClassifications, 0);
  objc_storeStrong((id *)&self->_preferredCropRect, 0);
  objc_storeStrong((id *)&self->_objectSaliencyRects, 0);
  objc_storeStrong((id *)&self->_duplicateMatchingData, 0);
  objc_storeStrong((id *)&self->_duplicateMatchingAlternateData, 0);
  objc_storeStrong((id *)&self->_colorNormalizationData, 0);
  objc_storeStrong((id *)&self->_assetCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_acceptableCropRect, 0);
}

+ (id)protoFromPhotosAsset:(id)a3
{
  id v3;
  MADProtoSceneAsset *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  MADProtoSceneAsset *v37;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MADProtoSceneAsset);
  objc_msgSend(v3, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v5, "mad_cloudIdentifierForLocalIdentifier:error:", v6, &v49);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v49;
  -[MADProtoSceneAsset setAssetCloudIdentifier:](v4, "setAssetCloudIdentifier:", v7);

  -[MADProtoSceneAsset assetCloudIdentifier](v4, "assetCloudIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v40 = v8;
    objc_msgSend(v3, "adjustmentTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    -[MADProtoSceneAsset setAssetAdjustmentTimestamp:](v4, "setAssetAdjustmentTimestamp:");

    objc_msgSend(v3, "sceneAnalysisProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADProtoSceneAsset setAlgorithmVersion:](v4, "setAlgorithmVersion:", objc_msgSend(v11, "sceneAnalysisVersion"));
    v39 = v11;
    objc_msgSend(v11, "sceneAnalysisTimestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    -[MADProtoSceneAsset setAdjustmentVersion:](v4, "setAdjustmentVersion:");

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v3, "sceneClassifications");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v46;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v46 != v16)
            objc_enumerationMutation(v13);
          +[MADProtoSceneClassification protoFromPhotosSceneClassification:](MADProtoSceneClassification, "protoFromPhotosSceneClassification:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v17));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[MADProtoSceneAsset addSceneClassifications:](v4, "addSceneClassifications:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "overallAestheticScore");
    -[MADProtoSceneAsset setOverallAestheticScore:](v4, "setOverallAestheticScore:");
    objc_msgSend(v3, "aestheticProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "wellFramedSubjectScore");
    -[MADProtoSceneAsset setWellFramedSubjectScore:](v4, "setWellFramedSubjectScore:");
    objc_msgSend(v19, "wellChosenSubjectScore");
    -[MADProtoSceneAsset setWellChosenSubjectScore:](v4, "setWellChosenSubjectScore:");
    objc_msgSend(v19, "tastefullyBlurredScore");
    -[MADProtoSceneAsset setTastefullyBlurredScore:](v4, "setTastefullyBlurredScore:");
    objc_msgSend(v19, "sharplyFocusedSubjectScore");
    -[MADProtoSceneAsset setSharplyFocusedSubjectScore:](v4, "setSharplyFocusedSubjectScore:");
    objc_msgSend(v19, "wellTimedShotScore");
    -[MADProtoSceneAsset setWellTimedShotScore:](v4, "setWellTimedShotScore:");
    objc_msgSend(v19, "pleasantLightingScore");
    -[MADProtoSceneAsset setPleasantLightingScore:](v4, "setPleasantLightingScore:");
    objc_msgSend(v19, "pleasantReflectionsScore");
    -[MADProtoSceneAsset setPleasantReflectionsScore:](v4, "setPleasantReflectionsScore:");
    objc_msgSend(v19, "harmoniousColorScore");
    -[MADProtoSceneAsset setHarmoniousColorScore:](v4, "setHarmoniousColorScore:");
    objc_msgSend(v19, "livelyColorScore");
    -[MADProtoSceneAsset setLivelyColorScore:](v4, "setLivelyColorScore:");
    objc_msgSend(v19, "pleasantSymmetryScore");
    -[MADProtoSceneAsset setPleasantSymmetryScore:](v4, "setPleasantSymmetryScore:");
    objc_msgSend(v19, "pleasantPatternScore");
    -[MADProtoSceneAsset setPleasantPatternScore:](v4, "setPleasantPatternScore:");
    objc_msgSend(v19, "immersivenessScore");
    -[MADProtoSceneAsset setImmersivenessScore:](v4, "setImmersivenessScore:");
    objc_msgSend(v19, "pleasantPerspectiveScore");
    -[MADProtoSceneAsset setPleasantPerspectiveScore:](v4, "setPleasantPerspectiveScore:");
    objc_msgSend(v19, "pleasantPostProcessingScore");
    -[MADProtoSceneAsset setPleasantPostProcessingScore:](v4, "setPleasantPostProcessingScore:");
    objc_msgSend(v19, "noiseScore");
    -[MADProtoSceneAsset setNoiseScore:](v4, "setNoiseScore:");
    objc_msgSend(v19, "failureScore");
    -[MADProtoSceneAsset setFailureScore:](v4, "setFailureScore:");
    objc_msgSend(v19, "pleasantCompositionScore");
    -[MADProtoSceneAsset setPleasantCompositionScore:](v4, "setPleasantCompositionScore:");
    objc_msgSend(v19, "interestingSubjectScore");
    -[MADProtoSceneAsset setInterestingSubjectScore:](v4, "setInterestingSubjectScore:");
    objc_msgSend(v19, "intrusiveObjectPresenceScore");
    -[MADProtoSceneAsset setIntrusiveObjectPresenceScore:](v4, "setIntrusiveObjectPresenceScore:");
    objc_msgSend(v19, "pleasantCameraTiltScore");
    -[MADProtoSceneAsset setPleasantCameraTiltScore:](v4, "setPleasantCameraTiltScore:");
    objc_msgSend(v19, "lowLight");
    -[MADProtoSceneAsset setLowLight:](v4, "setLowLight:");
    objc_msgSend(v3, "preferredCropRect");
    +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADProtoSceneAsset setPreferredCropRect:](v4, "setPreferredCropRect:", v20);

    objc_msgSend(v3, "acceptableCropRect");
    +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADProtoSceneAsset setAcceptableCropRect:](v4, "setAcceptableCropRect:", v21);

    objc_msgSend(v3, "curationProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v22, "objectSaliencyRects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v27), "rectValue");
          +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[MADProtoSceneAsset addObjectSaliencyRects:](v4, "addObjectSaliencyRects:", v28);

          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "mediaAnalysisProperties");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "wallpaperScore");
    -[MADProtoSceneAsset setWallpaperScore:](v4, "setWallpaperScore:");
    objc_msgSend(v29, "colorNormalizationData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADProtoSceneAsset setColorNormalizationData:](v4, "setColorNormalizationData:", v30);

    objc_msgSend(v29, "blurrinessScore");
    -[MADProtoSceneAsset setBlurrinessScore:](v4, "setBlurrinessScore:");
    objc_msgSend(v29, "exposureScore");
    -[MADProtoSceneAsset setExposureScore:](v4, "setExposureScore:");
    -[MADProtoSceneAsset setProbableRotationDirection:](v4, "setProbableRotationDirection:", objc_msgSend(v29, "probableRotationDirection"));
    objc_msgSend(v29, "probableRotationDirectionConfidence");
    -[MADProtoSceneAsset setProbableRotationDirectionConfidence:](v4, "setProbableRotationDirectionConfidence:");
    objc_msgSend(v3, "sceneprintProperties");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sceneprint");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADProtoSceneAsset setSceneprintData:](v4, "setSceneprintData:", v32);

    objc_msgSend(v31, "duplicateMatchingData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADProtoSceneAsset setDuplicateMatchingData:](v4, "setDuplicateMatchingData:", v33);

    objc_msgSend(v31, "duplicateMatchingAlternateData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADProtoSceneAsset setDuplicateMatchingAlternateData:](v4, "setDuplicateMatchingAlternateData:", v34);

    objc_msgSend(v3, "iconicScoreProperties");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "iconicScore");
    *(float *)&v36 = v36;
    -[MADProtoSceneAsset setIconicScore:](v4, "setIconicScore:", v36);
    v37 = v4;

    v8 = v40;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[MADProtoAssetOCRAnalysis(Photos) protoFromPhotosAsset:].cold.1(v3, (uint64_t)v8);
    v37 = 0;
  }

  return v37;
}

- (void)persistToPhotosAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int16 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  float v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  objc_msgSend(MEMORY[0x1E0CD13A8], "changeRequestForAsset:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[MADProtoSceneAsset sceneClassifications](self, "sceneClassifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "photosSceneClassification");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v8);
  }

  v12 = -[MADProtoSceneAsset algorithmVersion](self, "algorithmVersion");
  v13 = (void *)MEMORY[0x1E0C99D68];
  -[MADProtoSceneAsset adjustmentVersion](self, "adjustmentVersion");
  objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSceneClassifications:ofType:version:timestamp:", v5, 0, v12, v14);

  -[MADProtoSceneAsset overallAestheticScore](self, "overallAestheticScore");
  objc_msgSend(v4, "setOverallAestheticScore:");
  -[MADProtoSceneAsset wellFramedSubjectScore](self, "wellFramedSubjectScore");
  objc_msgSend(v4, "setWellFramedSubjectScore:");
  -[MADProtoSceneAsset wellChosenSubjectScore](self, "wellChosenSubjectScore");
  objc_msgSend(v4, "setWellChosenSubjectScore:");
  -[MADProtoSceneAsset tastefullyBlurredScore](self, "tastefullyBlurredScore");
  objc_msgSend(v4, "setTastefullyBlurredScore:");
  -[MADProtoSceneAsset sharplyFocusedSubjectScore](self, "sharplyFocusedSubjectScore");
  objc_msgSend(v4, "setSharplyFocusedSubjectScore:");
  -[MADProtoSceneAsset wellTimedShotScore](self, "wellTimedShotScore");
  objc_msgSend(v4, "setWellTimedShotScore:");
  -[MADProtoSceneAsset pleasantLightingScore](self, "pleasantLightingScore");
  objc_msgSend(v4, "setPleasantLightingScore:");
  -[MADProtoSceneAsset pleasantReflectionsScore](self, "pleasantReflectionsScore");
  objc_msgSend(v4, "setPleasantReflectionsScore:");
  -[MADProtoSceneAsset harmoniousColorScore](self, "harmoniousColorScore");
  objc_msgSend(v4, "setHarmoniousColorScore:");
  -[MADProtoSceneAsset livelyColorScore](self, "livelyColorScore");
  objc_msgSend(v4, "setLivelyColorScore:");
  -[MADProtoSceneAsset pleasantSymmetryScore](self, "pleasantSymmetryScore");
  objc_msgSend(v4, "setPleasantSymmetryScore:");
  -[MADProtoSceneAsset pleasantPatternScore](self, "pleasantPatternScore");
  objc_msgSend(v4, "setPleasantPatternScore:");
  -[MADProtoSceneAsset immersivenessScore](self, "immersivenessScore");
  objc_msgSend(v4, "setImmersivenessScore:");
  -[MADProtoSceneAsset pleasantPerspectiveScore](self, "pleasantPerspectiveScore");
  objc_msgSend(v4, "setPleasantPerspectiveScore:");
  -[MADProtoSceneAsset pleasantPostProcessingScore](self, "pleasantPostProcessingScore");
  objc_msgSend(v4, "setPleasantPostProcessingScore:");
  -[MADProtoSceneAsset noiseScore](self, "noiseScore");
  objc_msgSend(v4, "setNoiseScore:");
  -[MADProtoSceneAsset failureScore](self, "failureScore");
  objc_msgSend(v4, "setFailureScore:");
  -[MADProtoSceneAsset pleasantCompositionScore](self, "pleasantCompositionScore");
  objc_msgSend(v4, "setPleasantCompositionScore:");
  -[MADProtoSceneAsset interestingSubjectScore](self, "interestingSubjectScore");
  objc_msgSend(v4, "setInterestingSubjectScore:");
  -[MADProtoSceneAsset intrusiveObjectPresenceScore](self, "intrusiveObjectPresenceScore");
  objc_msgSend(v4, "setIntrusiveObjectPresenceScore:");
  -[MADProtoSceneAsset pleasantCameraTiltScore](self, "pleasantCameraTiltScore");
  objc_msgSend(v4, "setPleasantCameraTiltScore:");
  -[MADProtoSceneAsset lowLight](self, "lowLight");
  objc_msgSend(v4, "setLowLight:");
  -[MADProtoSceneAsset preferredCropRect](self, "preferredCropRect");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rectValue");
  objc_msgSend(v4, "setPreferredCropRectWithNormalizedRect:");

  -[MADProtoSceneAsset acceptableCropRect](self, "acceptableCropRect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rectValue");
  objc_msgSend(v4, "setAcceptableCropRectWithNormalizedRect:");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[MADProtoSceneAsset objectSaliencyRects](self, "objectSaliencyRects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "rectValue");
        objc_msgSend(v23, "valueWithRect:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v20);
  }

  objc_msgSend(v4, "setObjectSaliencyRects:", v17);
  -[MADProtoSceneAsset sceneprintData](self, "sceneprintData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSceneprintData:", v25);

  -[MADProtoSceneAsset wallpaperScore](self, "wallpaperScore");
  objc_msgSend(v4, "setWallpaperScore:");
  -[MADProtoSceneAsset colorNormalizationData](self, "colorNormalizationData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColorNormalizationData:", v26);

  -[MADProtoSceneAsset blurrinessScore](self, "blurrinessScore");
  objc_msgSend(v4, "setBlurrinessScore:");
  -[MADProtoSceneAsset exposureScore](self, "exposureScore");
  objc_msgSend(v4, "setExposureScore:");
  objc_msgSend(v4, "setProbableRotationDirection:", (__int16)-[MADProtoSceneAsset probableRotationDirection](self, "probableRotationDirection"));
  -[MADProtoSceneAsset probableRotationDirectionConfidence](self, "probableRotationDirectionConfidence");
  objc_msgSend(v4, "setProbableRotationDirectionConfidence:");
  -[MADProtoSceneAsset duplicateMatchingData](self, "duplicateMatchingData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[MADProtoSceneAsset duplicateMatchingAlternateData](self, "duplicateMatchingAlternateData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 != 0;

  }
  else
  {
    v29 = 0;
  }

  -[MADProtoSceneAsset duplicateMatchingData](self, "duplicateMatchingData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoSceneAsset duplicateMatchingAlternateData](self, "duplicateMatchingAlternateData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuplicateMatchingData:duplicateMatchingAlternateData:processingSucceeded:", v30, v31, v29);

  -[MADProtoSceneAsset iconicScore](self, "iconicScore");
  objc_msgSend(v4, "setIconicScore:", v32);
  if (objc_msgSend(v33, "mad_isEligibleForComputeSync"))
    objc_msgSend(v4, "setAssetAnalysisStage:", objc_msgSend(v33, "mad_analysisStageAfterCompletingAnalysis:", 2));

}

@end
