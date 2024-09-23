@implementation PHAsset

- (PHAsset)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHAsset *v9;
  PHAsset *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDate *modificationDate;
  void *v25;
  uint64_t v26;
  NSString *originalColorSpace;
  uint64_t v28;
  NSData *imageRequestHints;
  void *v30;
  uint64_t v31;
  NSData *locationData;
  PHAsset *v33;
  objc_super v35;

  v8 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PHAsset;
  v9 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v35, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    if ((a4 & 6) == 4)
    {
      -[PHAsset _setupLocationAndCreationDateAttributesFromFetchDictionary:](v9, "_setupLocationAndCreationDateAttributesFromFetchDictionary:", v8);
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("avalanchePickType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_avalanchePickType = objc_msgSend(v11, "intValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("avalancheKind"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_avalancheKind = objc_msgSend(v12, "intValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("thumbnailIndex"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      v15 = v14 > *MEMORY[0x1E0D71F48] || v14 < *MEMORY[0x1E0D71F40];
      v16 = v14;
      if (v15)
        v16 = 0x7FFFFFFFFFFFFFFFLL;
      v10->_thumbnailIndex = v16;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("duration"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v10->_duration = v18;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("videoCpDurationValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_videoCpDurationValue = objc_msgSend(v19, "integerValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("videoCpVisibilityState"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_videoCpVisibilityState = objc_msgSend(v20, "integerValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("playbackStyle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_playbackStyle = (int)objc_msgSend(v21, "shortValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("playbackVariation"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_playbackVariation = objc_msgSend(v22, "shortValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("modificationDate"));
      v23 = objc_claimAutoreleasedReturnValue();
      modificationDate = v10->_modificationDate;
      v10->_modificationDate = (NSDate *)v23;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudIsDeletable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_cloudIsDeletable = objc_msgSend(v25, "BOOLValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("originalColorSpace"));
      v26 = objc_claimAutoreleasedReturnValue();
      originalColorSpace = v10->_originalColorSpace;
      v10->_originalColorSpace = (NSString *)v26;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("imageRequestHints"));
      v28 = objc_claimAutoreleasedReturnValue();
      imageRequestHints = v10->_imageRequestHints;
      v10->_imageRequestHints = (NSData *)v28;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("generativeMemoryCreationEligibilityState"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_generativeMemoryCreationEligibilityState = objc_msgSend(v30, "intValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("locationData"));
      v31 = objc_claimAutoreleasedReturnValue();
      locationData = v10->_locationData;
      v10->_locationData = (NSData *)v31;

      -[PHAsset _setupLocationAndCreationDateAttributesFromFetchDictionary:](v10, "_setupLocationAndCreationDateAttributesFromFetchDictionary:", v8);
      -[PHAsset _setupAuxiliaryIdentifierAttributesFromFetchDictionary:](v10, "_setupAuxiliaryIdentifierAttributesFromFetchDictionary:", v8);
      -[PHAsset _setupFileSystemAttributesFromFetchDictionary:](v10, "_setupFileSystemAttributesFromFetchDictionary:", v8);
      -[PHAsset _setupUIStateAndTrashAttributesFromFetchDictionary:](v10, "_setupUIStateAndTrashAttributesFromFetchDictionary:", v8);
      -[PHAsset _setupAdjustmentAndDeferredProcessingAttributesFromFetchDictionary:](v10, "_setupAdjustmentAndDeferredProcessingAttributesFromFetchDictionary:", v8);
      -[PHAsset _setupTypeAndPersistenceStateAttributesFromFetchDictionary:](v10, "_setupTypeAndPersistenceStateAttributesFromFetchDictionary:", v8);
      -[PHAsset _setupGeometryAttributesFromFetchDictionary:](v10, "_setupGeometryAttributesFromFetchDictionary:", v8);
      -[PHAsset _setupFaceAttributesFromFetchDictionary:](v10, "_setupFaceAttributesFromFetchDictionary:", v8);
      -[PHAsset _setupKindSubtypeFromFetchDictionary:](v10, "_setupKindSubtypeFromFetchDictionary:", v8);
      -[PHAsset _setupSpatialTypeFromFetchDictionary:](v10, "_setupSpatialTypeFromFetchDictionary:", v8);
      -[PHAsset _setupHDRAndDepthMediaSubtypesFromFetchDictionary:](v10, "_setupHDRAndDepthMediaSubtypesFromFetchDictionary:", v8);
      -[PHAsset _setupAnalysisScoreAttributesFromFetchDictionary:](v10, "_setupAnalysisScoreAttributesFromFetchDictionary:", v8);
      -[PHAsset _setupBadgeAttributesFromFetchDictionary:](v10, "_setupBadgeAttributesFromFetchDictionary:", v8);
      -[PHAsset _setupSmartStyleFromFetchDictionary:](v10, "_setupSmartStyleFromFetchDictionary:", v8);
      -[PHAsset _createExtendedPropertySetsIfNeededWithPropertyHint:fetchDictionary:](v10, "_createExtendedPropertySetsIfNeededWithPropertyHint:fetchDictionary:", a4, v8);
      if (v10->_mediaType == 1 && !-[PHAsset isMediaSubtype:](v10, "isMediaSubtype:", 8) && v10->_playbackStyle == 3)
        v10->_playbackStyle = 1;
    }
    v33 = v10;
  }

  return v10;
}

- (BOOL)isMediaSubtype:(unint64_t)a3
{
  void *v5;
  int v6;
  unint64_t v7;
  unint64_t mediaSubtypes;

  if ((a3 & 0x400) != 0)
  {
    -[PHAsset spatialMediaProperties](self, "spatialMediaProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "spatialMediaType");

    if ((unsigned __int16)(v6 - 1) > 1u)
    {
      if (!v6)
      {
        mediaSubtypes = self->_mediaSubtypes;
        if ((mediaSubtypes & 0x400) != 0)
          self->_mediaSubtypes = mediaSubtypes & 0xFFFFFFFFFFFFFBFFLL;
      }
    }
    else
    {
      v7 = self->_mediaSubtypes;
      if ((v7 & 0x400) == 0)
        self->_mediaSubtypes = v7 | 0x400;
    }
  }
  return (a3 & ~self->_mediaSubtypes) == 0;
}

- (void)_setupUIStateAndTrashAttributesFromFetchDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSDate *v8;
  NSDate *trashedDate;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("favorite"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_favorite = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hidden"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hidden = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trashedState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_trashed = objc_msgSend(v7, "intValue") != 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trashedDate"));
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();

  trashedDate = self->_trashedDate;
  self->_trashedDate = v8;

}

- (void)_setupTypeAndPersistenceStateAttributesFromFetchDictionary:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  int64_t v7;
  NSString *v8;
  NSString *uniformTypeIdentifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shortValue");

  if (v6 < 3)
    v7 = v6 + 1;
  else
    v7 = 0;
  self->_mediaType = v7;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniformTypeIdentifier"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  uniformTypeIdentifier = self->_uniformTypeIdentifier;
  self->_uniformTypeIdentifier = v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("savedAssetType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_savedAssetType = objc_msgSend(v10, "shortValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleScope"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_bundleScope = objc_msgSend(v11, "shortValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cloudPlaceholderKind"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cloudPlaceholderKind = (int)objc_msgSend(v12, "shortValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("complete"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  self->_complete = objc_msgSend(v13, "BOOLValue");
  self->_persistenceState = 1;
  objc_msgSend(MEMORY[0x1E0D73310], "maskForCloudSharedAsset");
  if (PLValidatedSavedAssetTypeApplies())
  {
    v14 = self->_cloudPlaceholderKind - 3;
    if (v14 >= 5)
      return;
    v15 = self->_persistenceState | qword_19944AA28[v14];
  }
  else
  {
    if (!self->_complete)
      return;
    v15 = -1;
  }
  self->_persistenceState = v15;
}

- (void)_setupSpatialTypeFromFetchDictionary:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("spatialType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shortValue");

  if ((v5 - 1) <= 1)
    self->_mediaSubtypes |= 0x400uLL;
}

- (void)_setupHDRAndDepthMediaSubtypesFromFetchDictionary:(id)a3
{
  void *v4;
  int v5;
  int64_t mediaType;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  NSNumber *v16;
  NSNumber *hdrGain;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("hdrType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shortValue");

  mediaType = self->_mediaType;
  if (mediaType != 2)
  {
    v7 = v18;
    if (mediaType != 1)
      goto LABEL_19;
    if ((unsigned __int16)v5 - 2 < 2)
    {
      self->_mediaSubtypes |= 2uLL;
      if (v5 != 10)
        goto LABEL_5;
    }
    else if ((unsigned __int16)v5 != 10)
    {
LABEL_5:
      if ((unsigned __int16)v5 != 11)
        goto LABEL_14;
      v8 = 0x800000;
LABEL_13:
      self->_mediaSubtypes |= v8;
LABEL_14:
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("depthType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedShortValue");

      if (v13 == 1)
        self->_mediaSubtypes |= 0x10uLL;
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("playbackStyle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "shortValue");

      v7 = v18;
      if (v15 == 2)
      {
        v11 = 64;
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    v8 = 512;
    goto LABEL_13;
  }
  if (v5 == 5)
    self->_mediaSubtypes |= 0x100000uLL;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("depthType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedShortValue");

  v7 = v18;
  if (v10 == 2)
  {
    v11 = 0x200000;
LABEL_18:
    self->_mediaSubtypes |= v11;
  }
LABEL_19:
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hdrGain"));
  v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hdrGain = self->_hdrGain;
  self->_hdrGain = v16;

}

- (void)_setupFileSystemAttributesFromFetchDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *directory;
  NSString *v7;
  NSString *filename;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("directory"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  directory = self->_directory;
  self->_directory = v5;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("filename"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  filename = self->_filename;
  self->_filename = v7;

}

- (void)_setupBadgeAttributesFromFetchDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("packedBadgeAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_packedBadgeAttributes = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syndicationState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_syndicationState = objc_msgSend(v6, "unsignedShortValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeLibraryScopeParticipationState"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  self->_participatesInLibraryScope = objc_msgSend(v7, "integerValue") == 1;
}

- (void)_setupAnalysisScoreAttributesFromFetchDictionary:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("curationScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  self->_curationScore = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overallAestheticScore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  self->_overallAestheticScore = v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("highlightVisibilityScore"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  self->_highlightVisibilityScore = v9;

}

- (void)_setupAdjustmentAndDeferredProcessingAttributesFromFetchDictionary:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *adjustmentTimestamp;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adjustmentTimestamp"));
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  adjustmentTimestamp = self->_adjustmentTimestamp;
  self->_adjustmentTimestamp = v5;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adjustmentsState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_adjustmentsState = objc_msgSend(v7, "unsignedShortValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deferredProcessingNeeded"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_deferredProcessingNeeded = objc_msgSend(v8, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoDeferredProcessingNeeded"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  self->_videoDeferredProcessingNeeded = objc_msgSend(v9, "intValue");
}

- (void)_createExtendedPropertySetsIfNeededWithPropertyHint:(unint64_t)a3 fetchDictionary:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if ((a3 & 0xFFFFFFFFFFFFFD78) == 0)
    goto LABEL_37;
  v7 = v6;
  if ((a3 & 0x4000000) != 0)
  {
    -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v6);
    if ((a3 & 8) == 0)
    {
LABEL_4:
      if ((a3 & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_40;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_4;
  }
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x10) == 0)
  {
LABEL_5:
    if ((a3 & 0x200000) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x200000) == 0)
  {
LABEL_6:
    if ((a3 & 0x100000) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x100000) == 0)
  {
LABEL_7:
    if ((a3 & 0x1000000) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x1000000) == 0)
  {
LABEL_8:
    if ((a3 & 0x8000000000) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x8000000000) == 0)
  {
LABEL_9:
    if ((a3 & 0x10000000) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x10000000) == 0)
  {
LABEL_10:
    if ((a3 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x20) == 0)
  {
LABEL_11:
    if ((a3 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x40) == 0)
  {
LABEL_12:
    if ((a3 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x400) == 0)
  {
LABEL_13:
    if ((a3 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x100) == 0)
  {
LABEL_14:
    if ((a3 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_49:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x2000) == 0)
  {
LABEL_15:
    if ((a3 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_51;
  }
LABEL_50:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x4000) == 0)
  {
LABEL_16:
    if ((a3 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_52;
  }
LABEL_51:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x8000) == 0)
  {
LABEL_17:
    if ((a3 & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_53;
  }
LABEL_52:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x10000) == 0)
  {
LABEL_18:
    if ((a3 & 0x200000000) == 0)
      goto LABEL_19;
    goto LABEL_54;
  }
LABEL_53:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x200000000) == 0)
  {
LABEL_19:
    if ((a3 & 0x8000000) == 0)
      goto LABEL_20;
    goto LABEL_55;
  }
LABEL_54:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x8000000) == 0)
  {
LABEL_20:
    if ((a3 & 0x40000000) == 0)
      goto LABEL_21;
    goto LABEL_56;
  }
LABEL_55:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x40000000) == 0)
  {
LABEL_21:
    if ((a3 & 0x20000) == 0)
      goto LABEL_22;
    goto LABEL_57;
  }
LABEL_56:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x20000) == 0)
  {
LABEL_22:
    if ((a3 & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_58;
  }
LABEL_57:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x40000) == 0)
  {
LABEL_23:
    if ((a3 & 0x80000) == 0)
      goto LABEL_24;
    goto LABEL_59;
  }
LABEL_58:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x80000) == 0)
  {
LABEL_24:
    if ((a3 & 0x800000) == 0)
      goto LABEL_25;
    goto LABEL_60;
  }
LABEL_59:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x800000) == 0)
  {
LABEL_25:
    if ((a3 & 0x2000000) == 0)
      goto LABEL_26;
    goto LABEL_61;
  }
LABEL_60:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x2000000) == 0)
  {
LABEL_26:
    if ((a3 & 0x20000000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_61:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x20000000) != 0)
LABEL_27:
    -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
LABEL_28:
  if (a3 >= 0xFFFFFFFF80000000)
  {
    -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  }
  else if ((a3 & 0x100000000) == 0)
  {
    if ((a3 & 0x400000000) == 0)
      goto LABEL_31;
    goto LABEL_65;
  }
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x400000000) == 0)
  {
LABEL_31:
    if ((a3 & 0x2000000000) == 0)
      goto LABEL_32;
    goto LABEL_66;
  }
LABEL_65:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x2000000000) == 0)
  {
LABEL_32:
    if ((a3 & 0x800000000) == 0)
      goto LABEL_33;
    goto LABEL_67;
  }
LABEL_66:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x800000000) == 0)
  {
LABEL_33:
    if ((a3 & 0x4000000000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_67:
  -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
  if ((a3 & 0x4000000000) != 0)
LABEL_34:
    -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
LABEL_35:
  v6 = v7;
  if ((a3 & 0x10000000000) != 0)
  {
    -[PHAsset _attachPropertyObjectOfClass:preFetchedProperties:](self, "_attachPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v7);
    v6 = v7;
  }
LABEL_37:

}

- (PHAssetPlaybackStyle)playbackStyle
{
  return self->_playbackStyle;
}

- (unsigned)playbackVariation
{
  return self->_playbackVariation;
}

- (BOOL)participatesInLibraryScope
{
  return self->_participatesInLibraryScope;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

+ (id)managedEntityName
{
  return (id)objc_msgSend(MEMORY[0x1E0D71880], "entityName");
}

- (unsigned)bundleScope
{
  return self->_bundleScope;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)directory
{
  return self->_directory;
}

- (BOOL)isCloudPlaceholder
{
  return (-[PHAsset cloudPlaceholderKind](self, "cloudPlaceholderKind") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (int64_t)cloudPlaceholderKind
{
  return self->_cloudPlaceholderKind;
}

+ (unint64_t)_extendedPropertyFetchHintsForPropertySets:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(CFSTR("PHAssetPropertySetIdentifier"), "length"))
    v4 = objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetIdentifier"));
  else
    v4 = 0;
  if (objc_msgSend(CFSTR("PHAssetPropertySetCore"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetCore")))
  {
    v4 |= 2uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetLocalDate"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetLocalDate")))
  {
    v4 |= 0x200000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetPlacesCore"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetPlacesCore")))
  {
    v4 |= 4uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetOriginalMetadata"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetOriginalMetadata")))
  {
    v4 |= 8uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetPhotosOneUp"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetPhotosOneUp")))
  {
    v4 |= 0x10uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetPhotosInfoPanelExtended"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetPhotosInfoPanelExtended")))
  {
    v4 |= 0x100000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetPhotosSmartStyleExtended"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetPhotosSmartStyleExtended")))
  {
    v4 |= 0x8000000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetPhotosInfoPanelLocation"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetPhotosInfoPanelLocation")))
  {
    v4 |= 0x1000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetPhotoIris"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetPhotoIris")))
  {
    v4 |= 0x20uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetDescription"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetDescription")))
  {
    v4 |= 0x40uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetCloudShared"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetCloudShared")))
  {
    v4 |= 0x10000000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetComments"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetComments")))
  {
    v4 |= 0x80uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetSceneAnalysis"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetSceneAnalysis")))
  {
    v4 |= 0x100uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetAnalysisState"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetAnalysisState")))
  {
    v4 |= 0x200uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetUserActivity"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetUserActivity")))
  {
    v4 |= 0x400uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetFaceWorker"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetFaceWorker")))
  {
    v4 |= 0x800uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetImageManager"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetImageManager")))
  {
    v4 |= 0x1000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetAdjustment"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetAdjustment")))
  {
    v4 |= 0x2000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetCuration"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetCuration")))
  {
    v4 |= 0x4000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetAesthetic"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetAesthetic")))
  {
    v4 |= 0x8000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetMediaAnalysis"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetMediaAnalysis")))
  {
    v4 |= 0x10000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetPhotoAnalysisWallpaperProperties"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetPhotoAnalysisWallpaperProperties")))
  {
    v4 |= 0x200000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetCharacterRecognition"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetCharacterRecognition")))
  {
    v4 |= 0x8000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetVisualSearch"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetVisualSearch")))
  {
    v4 |= 0x40000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetImport"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetImport")))
  {
    v4 |= 0x20000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetSceneprint"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetSceneprint")))
  {
    v4 |= 0x40000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetDestinationAssetCopy"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetDestinationAssetCopy")))
  {
    v4 |= 0x80000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetKeywords"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetKeywords")))
  {
    v4 |= 0x400000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetGridMetadata"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetGridMetadata")))
  {
    v4 |= 0x800000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetCoarseLocation"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetCoarseLocation")))
  {
    v4 |= 0x2000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetLibraryScope"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetLibraryScope")))
  {
    v4 |= 0x4000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetCameraCaptureDevice"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetCameraCaptureDevice")))
  {
    v4 |= 0x10000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetCloudLocalState"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetCloudLocalState")))
  {
    v4 |= 0x20000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetMontage"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetMontage")))
  {
    v4 |= 0xFFFFFFFF80000000;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetSpatialMedia"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetSpatialMedia")))
  {
    v4 |= 0x100000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetLocationData"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetLocationData")))
  {
    v4 |= 0x400000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetPTP"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetPTP")))
  {
    v4 |= 0x2000000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetIconicScore"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetIconicScore")))
  {
    v4 |= 0x800000000uLL;
  }
  if (objc_msgSend(CFSTR("PHAssetPropertySetStoryPlayback"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHAssetPropertySetStoryPlayback")))
  {
    v4 |= 0x4000000000uLL;
  }

  return v4;
}

- (BOOL)isRAWPlusJPEG
{
  return (unint64_t)(-[PHAsset RAWBadgeAttributes](self, "RAWBadgeAttributes") - 1) < 2;
}

- (int64_t)RAWBadgeAttributes
{
  return ((unint64_t)self->_packedBadgeAttributes >> 1) & 3;
}

- (unsigned)deferredProcessingNeeded
{
  return self->_deferredProcessingNeeded;
}

- (PHAssetMediaSubtype)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (NSNumber)hdrGain
{
  return self->_hdrGain;
}

- (CGRect)normalizedFaceAreaRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat Height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  -[PHAsset originalFaceAreaRect](self, "originalFaceAreaRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PHAsset faceAreaMinY](self, "faceAreaMinY");
  v12 = v11;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  Height = CGRectGetHeight(v18);
  v14 = 1.0 - (v12 + Height * 0.5) - Height * 0.5;
  v15 = v4;
  v16 = v8;
  v17 = v10;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (CGRect)originalFaceAreaRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[PHAsset faceAreaMinX](self, "faceAreaMinX");
  v4 = v3;
  -[PHAsset faceAreaMinY](self, "faceAreaMinY");
  v6 = v5;
  -[PHAsset faceAreaMaxX](self, "faceAreaMaxX");
  v8 = v7;
  -[PHAsset faceAreaMaxY](self, "faceAreaMaxY");
  v9 = v8 - v4;
  v11 = v10 - v6;
  v12 = v4;
  v13 = v6;
  result.size.height = v11;
  result.size.width = v9;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)faceAreaMinY
{
  return self->_faceAreaMinY;
}

- (double)faceAreaMinX
{
  return self->_faceAreaMinX;
}

- (double)faceAreaMaxY
{
  return self->_faceAreaMaxY;
}

- (double)faceAreaMaxX
{
  return self->_faceAreaMaxX;
}

- (CGRect)preferredCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_preferredCropRect.origin.x;
  y = self->_preferredCropRect.origin.y;
  width = self->_preferredCropRect.size.width;
  height = self->_preferredCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)acceptableCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_acceptableCropRect.origin.x;
  y = self->_acceptableCropRect.origin.y;
  width = self->_acceptableCropRect.size.width;
  height = self->_acceptableCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (propertiesToFetchWithHint__onceToken_19476 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_19476, &__block_literal_global_295);
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__19039;
  v9 = __Block_byref_object_dispose__19040;
  v10 = 0;
  pl_dispatch_sync();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

+ (id)fetchKeyCuratedAssetInAssetCollection:(id)a3 referenceAsset:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v8, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v13;
  }
  objc_msgSend(v10, "setIncludeGuestAssets:", 1);
  if (objc_msgSend(v8, "assetCollectionType") != 4)
  {
    if (objc_msgSend(v8, "assetCollectionType") == 6)
    {
      objc_msgSend(v8, "photoLibrary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "librarySpecificFetchOptions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "mergeWithFetchOptions:", v10);
      +[PHQuery queryForKeyAssetInPhotosHighlight:options:](PHQuery, "queryForKeyAssetInPhotosHighlight:options:", v8, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "executeQuery");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(v8, "assetCollectionType") != 5
        || (objc_msgSend(v8, "highlightLocalIdentifier"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v22,
            !v22))
      {
        objc_msgSend((id)objc_opt_class(), "_requestCuratedAssetInAssetCollection:referenceAsset:referencePersons:fetchOptions:onlyKey:", v8, v9, 0, 0, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      objc_msgSend(v8, "highlightLocalIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v23, v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(a1, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", v25, v9, v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }

    }
    goto LABEL_18;
  }
  objc_msgSend(v8, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = CFSTR("PHAssetPropertySetOriginalMetadata");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addFetchPropertySets:", v16);

  objc_msgSend(v15, "mergeWithFetchOptions:", v10);
  if (objc_msgSend(v8, "isTransient"))
    objc_msgSend(v8, "queryForKeyAssetWithOptions:", v15);
  else
    +[PHQuery queryForKeyAssetInMemory:options:](PHQuery, "queryForKeyAssetInMemory:options:", v8, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "executeQuery");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v20;
}

+ (PHFetchResult)fetchAssetsInAssetCollection:(PHAssetCollection *)assetCollection options:(PHFetchOptions *)options
{
  PHAssetCollection *v5;
  PHFetchOptions *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PHManualFetchResult *v16;
  uint64_t v17;
  PHManualFetchResult *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  PHManualFetchResult *v29;
  void *v30;

  v5 = assetCollection;
  v6 = options;
  v7 = v6;
  if (v5)
  {
    -[PHFetchOptions photoLibrary](v6, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[PHObject photoLibrary](v5, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v7, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    if (!-[PHObject isTransient](v5, "isTransient"))
      goto LABEL_17;
    -[PHAssetCollection query](v5, "query");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      if (v7)
      {
        v13 = (void *)objc_msgSend(v11, "copy");

        objc_msgSend(v13, "fetchOptions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
          objc_msgSend(v14, "mergeWithFetchOptions:", v7);
        else
          objc_msgSend(v13, "setFetchOptions:", v7);

      }
      else
      {
        v13 = v11;
      }
      objc_msgSend(v13, "executeQuery");
      v16 = (PHManualFetchResult *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PHAssetCollection assetOids](v5, "assetOids");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v13 = (void *)v17;
        v18 = [PHManualFetchResult alloc];
        objc_msgSend(v7, "photoLibrary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fetchPropertySetsAsSet");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v18, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v13, v19, CFSTR("PHAsset"), v20, 0, 1);

      }
      else
      {
        -[PHAssetCollection assets](v5, "assets");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        v25 = (void *)MEMORY[0x1E0C9AA60];
        if (v23)
          v25 = (void *)v23;
        v26 = v25;

        v27 = (void *)objc_opt_class();
        objc_msgSend(v7, "fetchPropertySetsAsSet");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_batchFetchAdditionalPropertySetsIfNeeded:forAssets:", v28, v26);

        v29 = [PHManualFetchResult alloc];
        objc_msgSend(v7, "photoLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fetchPropertySetsAsSet");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v29, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v26, v13, CFSTR("PHAsset"), v30, 0, 1);

      }
    }

    if (!v16)
    {
LABEL_17:
      +[PHQuery queryForAssetsInAssetCollection:options:](PHQuery, "queryForAssetsInAssetCollection:options:", v5, v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "executeQuery");
      v16 = (PHManualFetchResult *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v16 = 0;
  }

  return (PHFetchResult *)v16;
}

- (double)highlightVisibilityScore
{
  return self->_highlightVisibilityScore;
}

- (unint64_t)effectiveThumbnailIndex
{
  return self->_thumbnailIndex;
}

- (BOOL)complete
{
  return self->_complete;
}

+ (BOOL)managedObjectSupportsSavedAssetType
{
  return 1;
}

+ (BOOL)managedObjectSupportsDuplicateVisibilityState
{
  return 1;
}

void __32__PHAsset_corePropertiesToFetch__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[55];

  v10[54] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("avalanchePickType");
  v10[1] = CFSTR("avalancheUUID");
  v10[2] = CFSTR("avalancheKind");
  v10[3] = CFSTR("cloudPlaceholderKind");
  v10[4] = CFSTR("complete");
  v10[5] = CFSTR("directory");
  v10[6] = CFSTR("filename");
  v10[7] = CFSTR("kind");
  v10[8] = CFSTR("kindSubtype");
  v10[9] = CFSTR("playbackStyle");
  v10[10] = CFSTR("playbackVariation");
  v10[11] = CFSTR("cameraProcessingAdjustmentState");
  v10[12] = CFSTR("depthType");
  v10[13] = CFSTR("savedAssetType");
  v10[14] = CFSTR("bundleScope");
  v10[15] = CFSTR("thumbnailIndex");
  v10[16] = CFSTR("width");
  v10[17] = CFSTR("height");
  v10[18] = CFSTR("duration");
  v10[19] = CFSTR("hdrType");
  v10[20] = CFSTR("favorite");
  v10[21] = CFSTR("hidden");
  v10[22] = CFSTR("adjustmentsState");
  v10[23] = CFSTR("trashedState");
  v10[24] = CFSTR("trashedDate");
  v10[25] = CFSTR("adjustmentTimestamp");
  v10[26] = CFSTR("curationScore");
  v10[27] = CFSTR("overallAestheticScore");
  v10[28] = CFSTR("highlightVisibilityScore");
  v10[29] = CFSTR("originalColorSpace");
  v10[30] = CFSTR("imageRequestHints");
  v10[31] = CFSTR("deferredProcessingNeeded");
  v10[32] = CFSTR("videoDeferredProcessingNeeded");
  v10[33] = CFSTR("dateCreated");
  v10[34] = CFSTR("locationData");
  v10[35] = CFSTR("modificationDate");
  v10[36] = CFSTR("orientation");
  v10[37] = CFSTR("uniformTypeIdentifier");
  v10[38] = CFSTR("hdrGain");
  v10[39] = CFSTR("highFrameRateState");
  v10[40] = CFSTR("cloudAssetGUID");
  v10[41] = CFSTR("videoCpDurationValue");
  v10[42] = CFSTR("videoCpVisibilityState");
  v10[43] = CFSTR("cloudIsDeletable");
  v10[44] = CFSTR("faceAdjustmentVersion");
  v10[45] = CFSTR("faceAreaPoints");
  v10[46] = CFSTR("packedPreferredCropRect");
  v10[47] = CFSTR("packedAcceptableCropRect");
  v10[48] = CFSTR("packedBadgeAttributes");
  v10[49] = CFSTR("syndicationState");
  v10[50] = CFSTR("activeLibraryScopeParticipationState");
  v10[51] = CFSTR("currentSleetCast");
  v10[52] = CFSTR("spatialType");
  v10[53] = CFSTR("generativeMemoryCreationEligibilityState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 54);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)corePropertiesToFetch_array_19482;
  corePropertiesToFetch_array_19482 = v2;

  v4 = (void *)corePropertiesToFetch_array_19482;
  objc_msgSend(*(id *)(a1 + 32), "locationPropertiesToFetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)corePropertiesToFetch_array_19482;
  corePropertiesToFetch_array_19482 = v6;

  if (PLPlatformEagerlyFetchFaceRegions())
  {
    objc_msgSend((id)corePropertiesToFetch_array_19482, "arrayByAddingObject:", CFSTR("additionalAttributes.faceRegions"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)corePropertiesToFetch_array_19482;
    corePropertiesToFetch_array_19482 = v8;

  }
}

+ (BOOL)managedObjectSupportsVisibilityState
{
  return 1;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 1;
}

+ (BOOL)managedObjectSupportsScreenshot
{
  return 1;
}

+ (BOOL)managedObjectSupportsMontage
{
  return 1;
}

+ (BOOL)managedObjectSupportsHiddenState
{
  return 1;
}

+ (BOOL)managedObjectSupportsContributor
{
  return 1;
}

+ (BOOL)managedObjectSupportsBursts
{
  return 1;
}

+ (BOOL)managedObjectSupportsAllowedForAnalysis
{
  return 1;
}

+ (id)locationPropertiesToFetch
{
  pl_dispatch_once();
  return (id)locationPropertiesToFetch_pl_once_object_15;
}

- (void)_setupLocationAndCreationDateAttributesFromFetchDictionary:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *creationDate;
  void *v7;
  double v8;
  CLLocationDegrees v9;
  CLLocationDegrees v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateCreated"));
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  creationDate = self->_creationDate;
  self->_creationDate = v5;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("latitude"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v7)
  {
    objc_msgSend(v11, "doubleValue");
    v9 = v8;
    objc_msgSend(v7, "doubleValue");
    self->_locationCoordinate = CLLocationCoordinate2DMake(v9, v10);
  }
  else
  {
    self->_locationCoordinate = (CLLocationCoordinate2D)*MEMORY[0x1E0C9E500];
  }
  -[PHAsset _initializeCachedLocation](self, "_initializeCachedLocation");

}

- (void)_initializeCachedLocation
{
  id v3;
  id v4;
  PLLazyObject *v5;
  PLLazyObject *lazyCachedLocation;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = objc_initWeak(&location, self);

  v4 = objc_alloc(MEMORY[0x1E0D73248]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__PHAsset__initializeCachedLocation__block_invoke;
  v7[3] = &unk_1E35DDF28;
  objc_copyWeak(&v8, &location);
  v5 = (PLLazyObject *)objc_msgSend(v4, "initWithRetriableBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  lazyCachedLocation = self->_lazyCachedLocation;
  self->_lazyCachedLocation = v5;

}

void __37__PHAsset_propertiesToFetchWithHint___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_19478;
  propertiesToFetchWithHint__propertiesToFetchByHint_19478 = v0;

  v2 = dispatch_queue_create("com.apple.photos.assetpropertyhints", 0);
  v3 = (void *)propertiesToFetchWithHint__propertyQueue_19477;
  propertiesToFetchWithHint__propertyQueue_19477 = (uint64_t)v2;

}

+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3
{
  id v4;
  unint64_t v5;
  int v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "_extendedPropertyFetchHintsForPropertySets:", v4);
  v6 = objc_msgSend(v4, "containsObject:", CFSTR("PHAssetPropertySetIdentifier"));

  if (v6)
    return v5;
  else
    return v5 | 2;
}

- (void)_setupKindSubtypeFromFetchDictionary:(id)a3
{
  void *v4;
  int v5;
  unint64_t v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kindSubtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shortValue");

  if (v5 > 9)
  {
    switch(v5)
    {
      case 'd':
        v6 = 0x10000;
        goto LABEL_18;
      case 'e':
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("highFrameRateState"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "integerValue");

        if ((v8 & 2) == 0)
          goto LABEL_19;
        v6 = 0x20000;
        break;
      case 'f':
        v6 = 0x40000;
        goto LABEL_18;
      case 'g':
        v6 = 0x80000;
        goto LABEL_18;
      case 'h':
        v6 = 0x400000;
        goto LABEL_18;
      default:
        if (v5 != 10)
          goto LABEL_19;
        v6 = 4;
        break;
    }
    goto LABEL_18;
  }
  switch(v5)
  {
    case 0:
      v6 = 0;
      goto LABEL_18;
    case 1:
      v6 = 1;
      goto LABEL_18;
    case 2:
      self->_isPhotoIris = 1;
      if ((objc_msgSend((id)objc_opt_class(), "_isLivePhotoWithPhotoIris:hasAdjustments:videoCpDuration:videoCPVisibility:sourceType:", self->_isPhotoIris, -[PHAsset hasAdjustments](self, "hasAdjustments"), self->_videoCpDurationValue, self->_videoCpVisibilityState, -[PHAsset sourceType](self, "sourceType")) & 1) != 0)
      {
        v6 = 8;
LABEL_18:
        self->_mediaSubtypes = v6;
      }
      break;
  }
LABEL_19:

}

+ (BOOL)_isLivePhotoWithPhotoIris:(BOOL)a3 hasAdjustments:(BOOL)a4 videoCpDuration:(int64_t)a5 videoCPVisibility:(unsigned __int16)a6 sourceType:(unint64_t)a7
{
  uint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v10;

  v7 = a6;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(MEMORY[0x1E0D71880], "isPhotoIrisPlaceholderWithPhotoIris:videoCpDuration:isCloudShared:videoCpFilePath:", a3, a5, a7 == 2, 0);
  return objc_msgSend(MEMORY[0x1E0D71880], "canPlayPhotoIrisWithPhotoIris:photoIrisPlaceholder:hasAdjustments:videoCpVisibilityState:", v9, v10, v8, v7);
}

- (BOOL)isVideo
{
  return -[PHAsset mediaType](self, "mediaType") == PHAssetMediaTypeVideo;
}

- (PHAssetMediaType)mediaType
{
  return self->_mediaType;
}

- (id)adjustmentVersion
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PHAsset adjustmentTimestamp](self, "adjustmentTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PHAsset creationDate](self, "creationDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)adjustmentTimestamp
{
  return self->_adjustmentTimestamp;
}

- (PHAssetSourceType)sourceType
{
  return objc_msgSend(MEMORY[0x1E0D73310], "mapSavedAssetType:unknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:unrecognized:", -[PHAsset savedAssetType](self, "savedAssetType"), 1, 1, 1, 1, 2, 1, 1, 1, 8, 1, 1, 16, 32, 64, 1,
           4,
           1);
}

- (BOOL)isCloudSharedAsset
{
  objc_msgSend(MEMORY[0x1E0D73310], "maskForCloudSharedAsset");
  -[PHAsset savedAssetType](self, "savedAssetType");
  return PLValidatedSavedAssetTypeApplies();
}

- (BOOL)isGuestAsset
{
  objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset");
  -[PHAsset savedAssetType](self, "savedAssetType");
  return PLValidatedSavedAssetTypeApplies();
}

- (signed)savedAssetType
{
  return self->_savedAssetType;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_18;
}

- (NSUInteger)pixelWidth
{
  return self->_pixelWidth;
}

- (NSUInteger)pixelHeight
{
  return self->_pixelHeight;
}

- (id)libraryID
{
  void *v2;
  void *v3;

  -[PHObject photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSData)imageRequestHints
{
  return self->_imageRequestHints;
}

- (BOOL)hasAdjustments
{
  return self->_adjustmentsState != 0;
}

- (void)_setupAuxiliaryIdentifierAttributesFromFetchDictionary:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[PHAsset isPartOfBurst](self, "isPartOfBurst");
  if (v4)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("avalancheUUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_storeStrong((id *)&self->_burstIdentifier, v5);
  if (v4)

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cloudAssetGUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_storeStrong((id *)&self->_cloudAssetGUID, v6);

}

- (BOOL)isPartOfBurst
{
  return -[PHAsset _isPartOfAvalancheWithKind:](self, "_isPartOfAvalancheWithKind:", 1);
}

- (int)avalanchePickType
{
  return self->_avalanchePickType;
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHAsset");
  return CFSTR("PHAsset");
}

- (void)_setupFaceAttributesFromFetchDictionary:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *faceRegions;
  void *v7;
  id faceAdjustmentVersion;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  if (PLPlatformEagerlyFetchFaceRegions())
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("additionalAttributes.faceRegions"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLManagedAssetDecodeFaceRegions();
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    faceRegions = self->_faceRegions;
    self->_faceRegions = v5;

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("faceAdjustmentVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  faceAdjustmentVersion = self->_faceAdjustmentVersion;
  self->_faceAdjustmentVersion = v7;

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("additionalAttributes.faceAnalysisVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_faceAnalysisVersion = objc_msgSend(v9, "intValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("faceAreaPoints"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longLongValue");

  if ((v11 & 0x8000000000000000) == 0)
    PLSplitToDoubleFromInt64();

}

- (void)_setupGeometryAttributesFromFetchDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CGSize v9;
  void *v10;
  uint64_t v11;
  CGSize v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("height"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_pixelHeight = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("width"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_pixelWidth = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("orientation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_exifOrientation = objc_msgSend(v6, "intValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("packedPreferredCropRect"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  if (v8)
  {
    PLSplitToCGRectFromInt64();
  }
  else
  {
    v9 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_preferredCropRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_preferredCropRect.size = v9;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("packedAcceptableCropRect"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longLongValue");

  if (v11)
  {
    PLSplitToCGRectFromInt64();
  }
  else
  {
    v12 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_acceptableCropRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_acceptableCropRect.size = v12;
  }

}

- (unint64_t)thumbnailIndex
{
  return self->_thumbnailIndex;
}

+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 1) != 0)
  {
    objc_msgSend(a1, "identifierPropertiesToFetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v8);

    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_46;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(a1, "corePropertiesToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v9);

  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(a1, "locationPropertiesToFetch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v10);

  if ((a3 & 0x1000) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(a1, "imageManagerPropertiesToFetch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v11);

  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x200000) == 0)
      goto LABEL_8;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x200000) == 0)
  {
LABEL_8:
    if ((a3 & 0x100000) == 0)
      goto LABEL_9;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x100000) == 0)
  {
LABEL_9:
    if ((a3 & 0x8000000000) == 0)
      goto LABEL_10;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x8000000000) == 0)
  {
LABEL_10:
    if ((a3 & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x1000000) == 0)
  {
LABEL_11:
    if ((a3 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x20) == 0)
  {
LABEL_12:
    if ((a3 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x40) == 0)
  {
LABEL_13:
    if ((a3 & 0x10000000000) == 0)
      goto LABEL_14;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x10000000000) == 0)
  {
LABEL_14:
    if ((a3 & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x80) == 0)
  {
LABEL_15:
    if ((a3 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x100) == 0)
  {
LABEL_16:
    if ((a3 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x200) == 0)
  {
LABEL_17:
    if ((a3 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x400) == 0)
  {
LABEL_18:
    if ((a3 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x2000) == 0)
  {
LABEL_19:
    if ((a3 & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x800) == 0)
  {
LABEL_20:
    if ((a3 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(a1, "faceWorkerPropertiesToFetch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v12);

  if ((a3 & 0x4000) == 0)
  {
LABEL_21:
    if ((a3 & 0x8000) == 0)
      goto LABEL_22;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x8000) == 0)
  {
LABEL_22:
    if ((a3 & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x10000) == 0)
  {
LABEL_23:
    if ((a3 & 0x200000000) == 0)
      goto LABEL_24;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x200000000) == 0)
  {
LABEL_24:
    if ((a3 & 0x8000000) == 0)
      goto LABEL_25;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x8000000) == 0)
  {
LABEL_25:
    if ((a3 & 0x40000000) == 0)
      goto LABEL_26;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x40000000) == 0)
  {
LABEL_26:
    if ((a3 & 0x20000) == 0)
      goto LABEL_27;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x20000) == 0)
  {
LABEL_27:
    if ((a3 & 0x40000) == 0)
      goto LABEL_28;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x40000) == 0)
  {
LABEL_28:
    if ((a3 & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x80000) == 0)
  {
LABEL_29:
    if ((a3 & 0x400000) == 0)
      goto LABEL_30;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x400000) == 0)
  {
LABEL_30:
    if ((a3 & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x800000) == 0)
  {
LABEL_31:
    if ((a3 & 0x2000000) == 0)
      goto LABEL_32;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x2000000) == 0)
  {
LABEL_32:
    if ((a3 & 0x4000000) == 0)
      goto LABEL_33;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x4000000) == 0)
  {
LABEL_33:
    if ((a3 & 0x10000000) == 0)
      goto LABEL_34;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x10000000) == 0)
  {
LABEL_34:
    if ((a3 & 0x20000000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_76:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x20000000) != 0)
LABEL_35:
    objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
LABEL_36:
  if (a3 >= 0xFFFFFFFF80000000)
  {
    objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  }
  else if ((a3 & 0x100000000) == 0)
  {
    if ((a3 & 0x400000000) == 0)
      goto LABEL_39;
    goto LABEL_80;
  }
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x400000000) == 0)
  {
LABEL_39:
    if ((a3 & 0x2000000000) == 0)
      goto LABEL_40;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x2000000000) == 0)
  {
LABEL_40:
    if ((a3 & 0x800000000) == 0)
      goto LABEL_41;
LABEL_82:
    objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
    if ((a3 & 0x4000000000) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
LABEL_81:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((a3 & 0x800000000) != 0)
    goto LABEL_82;
LABEL_41:
  if ((a3 & 0x4000000000) != 0)
LABEL_42:
    objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
LABEL_43:
  v6 = v5;

  return v6;
}

+ (id)corePropertiesToFetch
{
  pl_dispatch_once();
  return (id)corePropertiesToFetch_array_19482;
}

void __23__PHAsset_entityKeyMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PHEntityKeyMap *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  _QWORD v33[2];
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  _QWORD v54[25];
  _QWORD v55[27];

  v55[25] = *MEMORY[0x1E0C80C00];
  v22 = [PHEntityKeyMap alloc];
  v53 = CFSTR("uuid");
  v54[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v28;
  v54[1] = CFSTR("dateCreated");
  v52 = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v27;
  v54[2] = CFSTR("modificationDate");
  v51 = CFSTR("modificationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v26;
  v54[3] = CFSTR("kind");
  v50 = CFSTR("mediaType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v25;
  v54[4] = CFSTR("kindSubtype");
  v49 = CFSTR("mediaSubtypes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v24;
  v54[5] = CFSTR("duration");
  v48 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v23;
  v54[6] = CFSTR("width");
  v47 = CFSTR("pixelWidth");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v21;
  v54[7] = CFSTR("height");
  v46 = CFSTR("pixelHeight");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v20;
  v54[8] = CFSTR("favorite");
  v45[0] = CFSTR("favorite");
  v45[1] = CFSTR("isFavorite");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v19;
  v54[9] = CFSTR("hidden");
  v44[0] = CFSTR("hidden");
  v44[1] = CFSTR("isHidden");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v55[9] = v18;
  v54[10] = CFSTR("originalColorSpace");
  v43 = CFSTR("originalColorSpace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v55[10] = v17;
  v54[11] = CFSTR("curationScore");
  v42 = CFSTR("curationScore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v55[11] = v16;
  v54[12] = CFSTR("overallAestheticScore");
  v41 = CFSTR("overallAestheticScore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55[12] = v15;
  v54[13] = CFSTR("highlightVisibilityScore");
  v40 = CFSTR("highlightVisibilityScore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55[13] = v14;
  v54[14] = CFSTR("avalancheUUID");
  v39 = CFSTR("burstIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55[14] = v13;
  v54[15] = CFSTR("playbackStyle");
  v38 = CFSTR("playbackStyle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[15] = v12;
  v54[16] = CFSTR("playbackVariation");
  v37 = CFSTR("playbackVariation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v55[16] = v0;
  v54[17] = CFSTR("imageRequestHints");
  v36 = CFSTR("imageRequestHints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v55[17] = v1;
  v54[18] = CFSTR("hdrGain");
  v35 = CFSTR("hdrGain");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v55[18] = v2;
  v54[19] = CFSTR("analysisStateModificationDate");
  v34 = CFSTR("analysisStateModificationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v55[19] = v3;
  v54[20] = CFSTR("packedBadgeAttributes");
  v33[0] = CFSTR("RAWBadgeAttributes");
  v33[1] = CFSTR("hasKeywords");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v55[20] = v4;
  v54[21] = CFSTR("adjustmentTimestamp");
  v32 = CFSTR("adjustmentTimestamp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55[21] = v5;
  v54[22] = CFSTR("additionalAttributes.importedByBundleIdentifier");
  v31 = CFSTR("curationProperties.importedByBundleIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v55[22] = v6;
  v54[23] = CFSTR("syndicationState");
  v30 = CFSTR("syndicationState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v55[23] = v7;
  v54[24] = CFSTR("cloudLocalState");
  v29 = CFSTR("cloudLocalStateProperties.assetCloudLocalState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v55[24] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v22, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_18;
  entityKeyMap_pl_once_object_18 = v10;

}

void __36__PHAsset_locationPropertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("latitude");
  v3[1] = CFSTR("longitude");
  v3[2] = CFSTR("dateCreated");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)locationPropertiesToFetch_pl_once_object_15;
  locationPropertiesToFetch_pl_once_object_15 = v1;

}

+ (void)_computeFingerPrintsOfAsset:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pl_photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "assetsdClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PHAsset_FingerPrint___computeFingerPrintsOfAsset_completionHandler___block_invoke;
  v12[3] = &unk_1E35D5CF0;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v10, "computeFingerPrintsOfAsset:synchronously:completionHandler:", v7, 0, v12);

}

+ (id)fetchAssetsMatchingMasterFingerPrint:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  +[PHFetchOptions fetchOptionsWithInclusiveDefaultsForPhotoLibrary:](PHFetchOptions, "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncludeAssetSourceTypes:", 15);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("additionalAttributes.originalStableHash"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setInternalPredicate:", v7);
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, &__block_literal_global_231);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fetchAssetsMatchingAdjustedFingerPrint:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  +[PHFetchOptions fetchOptionsWithInclusiveDefaultsForPhotoLibrary:](PHFetchOptions, "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncludeAssetSourceTypes:", 15);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("additionalAttributes.adjustedStableHash"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setInternalPredicate:", v7);
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, &__block_literal_global_30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __76__PHAsset_FingerPrint__fetchAssetsMatchingAdjustedFingerPrint_photoLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsWithOptions:](PHQuery, "queryForAssetsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __74__PHAsset_FingerPrint__fetchAssetsMatchingMasterFingerPrint_photoLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsWithOptions:](PHQuery, "queryForAssetsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __70__PHAsset_FingerPrint___computeFingerPrintsOfAsset_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7)
  {
    v11 = v9;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    if (v9)
    {
      v14 = *MEMORY[0x1E0CB3388];
      v15[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)pl_managedAssetFromPhotoLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAdoptionUtilities.m"), 44, CFSTR("This is only callable on the main thread"));

  }
  -[PHAsset managedAssetForPhotoLibrary:](self, "managedAssetForPhotoLibrary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pl_managedAsset
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAdoptionUtilities.m"), 50, CFSTR("This is only callable on the main thread"));

  }
  -[PHObject photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainQueueConcurrencyPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset managedAssetForPhotoLibrary:](self, "managedAssetForPhotoLibrary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)pl_managedAssetsForAssets:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAdoptionUtilities.m"), 56, CFSTR("This is only callable on the main thread"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "pl_managedAsset", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PHAsset suggestedCropForTargetSize:withFocusRegion:](self, "suggestedCropForTargetSize:withFocusRegion:", a3.width, a3.height, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", 0, a3.width, a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withOcclusionRegion:(CGRect)a4 andOutputCropScore:(double *)a5
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.height;
  v11 = a3.width;
  if (!CGRectIsNull(a4) && ((v13 = x + width, v14 = y + height, v13 <= 1.0) ? (v15 = v14 <= 1.0) : (v15 = 0), v15))
  {
    v41 = (double)-[PHAsset pixelWidth](self, "pixelWidth");
    v20 = (double)-[PHAsset pixelHeight](self, "pixelHeight");
    v45 = 0.0;
    -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v45, v11, v10, 0.0, v14, 1.0, 1.0 - v14);
    if (v45 > 0.0)
    {
      v20 = v24;
    }
    else
    {
      v23 = v41;
      v21 = 0.0;
    }
    v40 = v21;
    v42 = v23;
    if (v45 <= 0.0)
      v25 = 0.0;
    else
      v25 = v22;
    v26 = fmax(v45, 0.0);
    -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v45, v11, v10, 0.0, 0.0, 1.0, y);
    if (v45 <= v26)
      v30 = v20;
    v44 = v30;
    if (v45 <= v26)
      v31 = v42;
    else
      v31 = v29;
    if (v45 <= v26)
    {
      v32 = v40;
    }
    else
    {
      v25 = v28;
      v32 = v27;
    }
    if (v45 > v26)
      v26 = v45;
    -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v45, v11, v10, 0.0, 0.0, x, 1.0);
    if (v45 <= v26)
      v33 = v32;
    v43 = v33;
    if (v45 <= v26)
    {
      v37 = v44;
    }
    else
    {
      v25 = v34;
      v31 = v35;
      v37 = v36;
    }
    if (v45 <= v26)
      v38 = v26;
    else
      v38 = v45;
    -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v45, v11, v10, v13, 0.0, 1.0 - v13, 1.0);
    v39 = v45;
    if (v45 <= v38)
    {
      v19 = v37;
      v18 = v31;
      v17 = v25;
      v16 = v43;
    }
    if (a5)
    {
      if (v45 <= v38)
        v39 = v38;
      *a5 = v39;
    }
  }
  else
  {
    -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", a5, v11, v10, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  }
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4 andOutputCropScore:(double *)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  if (a3.width <= 0.0 || a3.height <= 0.0)
  {
    v10 = (double)-[PHAsset pixelWidth](self, "pixelWidth", a5);
    v8 = (double)-[PHAsset pixelHeight](self, "pixelHeight");
    v6 = 0.0;
    v7 = 0.0;
  }
  else
  {
    -[PHAsset suggestedCropForAspectRatio:withFocusRegion:andOutputCropScore:](self, "suggestedCropForAspectRatio:withFocusRegion:andOutputCropScore:", a5, a3.width / a3.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    v10 = v9;
  }
  v11 = v10;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)suggestedCropForAspectRatio:(double)a3 withFocusRegion:(CGRect)a4 andOutputCropScore:(double *)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  unint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect result;

  -[PHAsset faceAreaMinX](self, "faceAreaMinX");
  v8 = v7;
  -[PHAsset faceAreaMinY](self, "faceAreaMinY");
  v10 = v9;
  -[PHAsset faceAreaMaxX](self, "faceAreaMaxX");
  v12 = v11;
  -[PHAsset faceAreaMaxY](self, "faceAreaMaxY");
  v13 = v12 - v8;
  v15 = v14 - v10;
  v16 = 1.0 - (v10 + v14 - v10);
  v17 = (void *)MEMORY[0x1E0D750F0];
  v18 = -[PHAsset pixelWidth](self, "pixelWidth");
  v19 = -[PHAsset pixelHeight](self, "pixelHeight");
  -[PHAsset preferredCropRect](self, "preferredCropRect");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[PHAsset acceptableCropRect](self, "acceptableCropRect");
  objc_msgSend(v17, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", v18, v19, a5, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v21, v23, v25, v27, v28, v29, v30, v31,
    *(_QWORD *)&v8,
    *(_QWORD *)&v16,
    *(_QWORD *)&v13,
    *(_QWORD *)&v15);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v40 = (double)-[PHAsset pixelWidth](self, "pixelWidth");
  v41 = -[PHAsset pixelHeight](self, "pixelHeight");
  v42 = v33 * v40 + 0.0;
  v43 = v35 * (double)v41 + 0.0;
  v44 = v37 * v40;
  v45 = v39 * (double)v41;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v43;
  result.origin.x = v42;
  return result;
}

+ (id)_requestCuratedAssetInAssetCollection:(id)a3 referenceAsset:(id)a4 referencePersons:(id)a5 fetchOptions:(id)a6 onlyKey:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  unint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  id v82;
  _BYTE v83[128];
  const __CFString *v84;
  _QWORD v85[2];
  _BYTE v86[128];
  void *v87;
  uint8_t buf[4];
  id v89;
  uint64_t v90;

  v7 = a7;
  v90 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v72 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "photoAnalysisClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_opt_new();
    v18 = objc_msgSend(v12, "count");
    if (v18)
    {
      objc_msgSend(v12, "_pl_map:", &__block_literal_global_15473);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v19, CFSTR("PHPhotosGraphOptionPersonLocalIdentifiersToFocus"));

    }
    if (objc_msgSend(v13, "curationType") == 2)
      -[NSObject setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PHPhotosGraphOptionCurationTypeDedupe"));
    if (objc_msgSend(v11, "assetCollectionType") == 5)
    {
      objc_msgSend(v11, "highlightLocalIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {

LABEL_13:
        v24 = v7;
        v25 = v11;
        v26 = v11;
        objc_msgSend(v26, "highlightLocalIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          v29 = v27;
        }
        else
        {
          objc_msgSend(v26, "momentLocalIdentifiers");
          v66 = v18;
          v33 = v17;
          v34 = v16;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "firstObject");
          v29 = (id)objc_claimAutoreleasedReturnValue();

          v16 = v34;
          v17 = v33;
          v18 = v66;
        }

        v30 = v29;
        v11 = v25;
        v7 = v24;
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend(v11, "momentLocalIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23 == 1)
        goto LABEL_13;
    }
    if (v13
      || (v31 = objc_msgSend(v11, "assetCollectionType"), v31 > 8)
      || ((1 << v31) & 0x1DA) == 0 && (v31 != 2 || objc_msgSend(v11, "assetCollectionSubtype") == 200))
    {
      if (v18 != 1)
      {
        if (objc_msgSend(v11, "isTransient") && objc_msgSend(v11, "assetCollectionType") == 1)
          objc_msgSend(v13, "setFetchLimit:", 0);
        +[PHAssetCollection graphOptionsForTransientAssetCollection:needsCompleteMomentsInfo:options:](PHAssetCollection, "graphOptionsForTransientAssetCollection:needsCompleteMomentsInfo:options:", v11, 1, v13);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        -[NSObject addEntriesFromDictionary:](v17, "addEntriesFromDictionary:", v26);
        v30 = 0;
        goto LABEL_30;
      }
      v30 = 0;
    }
    else
    {
      objc_msgSend(v11, "localIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        PLPhotoKitGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v89 = v11;
          _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_ERROR, "no collection identifier found for %@", buf, 0xCu);
        }
        v21 = 0;
        goto LABEL_63;
      }
    }
LABEL_31:
    v70 = v17;
    if (v7)
    {
      objc_msgSend(v72, "localIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0;
      objc_msgSend(v16, "requestCuratedAssetForAssetCollectionWithLocalIdentifier:referenceAssetLocalIdentifier:options:error:", v30, v36, v17, &v82);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v82;

      if (v37)
      {
        v87 = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = 0;
      }

      v40 = v38;
    }
    else
    {
      v81 = 0;
      objc_msgSend(v16, "requestCuratedAssetsForAssetCollectionWithLocalIdentifier:duration:options:error:", v30, 2, v17, &v81);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v81;
    }
    v71 = v13;
    if (v40)
    {
      PLPhotoKitGetLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v40;
        _os_log_impl(&dword_1991EC000, v41, OS_LOG_TYPE_ERROR, "_requestCuratedAssetInAssetCollection encountered error:%@", buf, 0xCu);
      }

    }
    v69 = v40;
    if (v39)
    {
      v64 = v30;
      v65 = v16;
      v67 = v18;
      v68 = v12;
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v39, "count"));
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v43 = v39;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v78 != v46)
              objc_enumerationMutation(v43);
            objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("PHRelatedAssetIdentifierKey"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addObject:", v48);

          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
        }
        while (v45);
      }

      v13 = v71;
      v49 = (void *)objc_msgSend(v71, "copy");
      if (!v49)
      {
        +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", 0, v11);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setIncludeHiddenAssets:", 0);
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v85[0] = v50;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v85[1] = v51;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setSortDescriptors:", v52);

        v84 = CFSTR("PHAssetPropertySetOriginalMetadata");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addFetchPropertySets:", v53);

      }
      if (v67)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v55 = v68;
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
        if (v56)
        {
          v57 = v56;
          v58 = *(_QWORD *)v74;
          do
          {
            for (j = 0; j != v57; ++j)
            {
              if (*(_QWORD *)v74 != v58)
                objc_enumerationMutation(v55);
              objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * j), "objectID");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "addObject:", v60);

            }
            v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
          }
          while (v57);
        }

        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K.%K IN %@"), CFSTR("detectedFaces"), CFSTR("personForFace"), v54);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setInternalPredicate:", v61);
        objc_msgSend(v49, "setPredicate:", 0);

        v13 = v71;
      }
      +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v42, v49);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v68;
      v30 = v64;
      v16 = v65;
    }
    else
    {
      v62 = 0;
    }
    v32 = v62;

    v21 = v32;
    v17 = v70;
LABEL_63:

    goto LABEL_64;
  }
  PLPhotoKitGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Photo Analysis Client is nil", buf, 2u);
  }
  v21 = 0;
LABEL_64:

  return v21;
}

+ (id)_fetchRepresentativeAssetInAssetCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  void *v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoAnalysisClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v3, "assetCollectionType") == 5)
    {
      objc_msgSend(v3, "highlightLocalIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {

LABEL_9:
        v12 = v3;
        objc_msgSend(v12, "highlightLocalIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(v12, "momentLocalIdentifiers");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "firstObject");
          v15 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_20;
      }
      objc_msgSend(v3, "momentLocalIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11 == 1)
        goto LABEL_9;
    }
    if ((objc_msgSend(v3, "isTransient") & 1) != 0
      || objc_msgSend(v3, "assetCollectionType") != 4
      && objc_msgSend(v3, "assetCollectionType") != 3
      && objc_msgSend(v3, "assetCollectionType") != 7
      && objc_msgSend(v3, "assetCollectionType") != 1
      && (objc_msgSend(v3, "assetCollectionType") != 2 || objc_msgSend(v3, "assetCollectionSubtype") == 200))
    {
      +[PHAssetCollection graphOptionsForTransientAssetCollection:needsCompleteMomentsInfo:options:](PHAssetCollection, "graphOptionsForTransientAssetCollection:needsCompleteMomentsInfo:options:", v3, 0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v15 = 0;
LABEL_21:
      v38 = 0;
      objc_msgSend(v6, "requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier:options:error:", v15, v8, &v38);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v38;
      if (v18)
      {
        PLPhotoKitGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v18;
          _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "_fetchRepresentativeAssetInAssetCollection encountered error:%@", buf, 0xCu);
        }

      }
      if (v17)
      {
        v31 = v18;
        v32 = v15;
        v33 = v6;
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v21 = v17;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v35 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("PHRelatedAssetIdentifierKey"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addObject:", v26);

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
          }
          while (v23);
        }

        +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", 0, v3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setIncludeHiddenAssets:", 1);
        objc_msgSend(v27, "setIncludeAllBurstAssets:", 1);
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setSortDescriptors:", v29);

        +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v20, v27);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v32;
        v6 = v33;
        v18 = v31;
      }
      else
      {
        v9 = 0;
      }

      goto LABEL_36;
    }
    objc_msgSend(v3, "localIdentifier");
    v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v8 = 0;
    goto LABEL_21;
  }
  PLPhotoKitGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Photo Analysis Client is nil", buf, 2u);
  }
  v9 = 0;
LABEL_36:

  return v9;
}

+ (id)_assetFetchResultFromAssets:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v5, "copy");
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPhotoLibrary:", v8);

  objc_msgSend(v7, "setIncludeHiddenAssets:", 0);
  objc_msgSend(v5, "fetchPropertySets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v9);

  objc_msgSend(v5, "customObjectIDSortOrder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setCustomObjectIDSortOrder:", v10);
  objc_msgSend(v6, "valueForKey:", CFSTR("localIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)fetchKeyCuratedAssetInAssetCollection:(id)a3 referenceAsset:(id)a4
{
  return (id)objc_msgSend(a1, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", a3, a4, 0);
}

+ (id)fetchKeyCuratedAssetInAssetCollection:(id)a3 referencePersons:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "assetCollectionType");
  v8 = (void *)objc_opt_class();
  if (v7 == 4)
    objc_msgSend(v8, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v6, 0);
  else
    objc_msgSend(v8, "_requestCuratedAssetInAssetCollection:referenceAsset:referencePersons:fetchOptions:onlyKey:", v6, 0, v5, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchCuratedAssetsInAssetCollection:(id)a3
{
  return (id)objc_msgSend(a1, "fetchCuratedAssetsInAssetCollection:options:", a3, 0);
}

+ (id)fetchCuratedAssetsInAssetCollection:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(v6, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v6, "assetCollectionType") == 4)
  {
    v19[0] = CFSTR("PHAssetPropertySetOriginalMetadata");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addFetchPropertySets:", v9);

    +[PHQuery queryForCuratedAssetsInMemory:options:](PHQuery, "queryForCuratedAssetsInMemory:options:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "assetCollectionType") == 6)
  {
    if (!objc_msgSend(v7, "highlightCurationType"))
      objc_msgSend(v7, "setHighlightCurationType:", objc_msgSend(v6, "preferredCurationType"));
    +[PHQuery queryForCuratedAssetsInPhotosHighlight:options:](PHQuery, "queryForCuratedAssetsInPhotosHighlight:options:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "assetCollectionType") == 5)
    {
      objc_msgSend(v6, "highlightLocalIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v6, "highlightLocalIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v13, v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(a1, "fetchCuratedAssetsInAssetCollection:options:", v15, v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }

        goto LABEL_16;
      }
    }
    if (objc_msgSend(v6, "assetCollectionType") != 7)
    {
      objc_msgSend(a1, "_requestCuratedAssetInAssetCollection:referenceAsset:referencePersons:fetchOptions:onlyKey:", v6, 0, 0, v7, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    +[PHQuery queryForCuratedAssetsInMomentShare:options:](PHQuery, "queryForCuratedAssetsInMomentShare:options:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v10;
  objc_msgSend(v10, "executeQuery");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_17:
  return v16;
}

+ (id)fetchExtendedCuratedAssetsInAssetCollection:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(v6, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v6, "assetCollectionType") == 4)
  {
    +[PHQuery queryForExtendedCuratedAssetsInMemory:options:](PHQuery, "queryForExtendedCuratedAssetsInMemory:options:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "assetCollectionType") != 6)
    {
      objc_msgSend(a1, "_requestCuratedAssetInAssetCollection:referenceAsset:referencePersons:fetchOptions:onlyKey:", v6, 0, 0, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_msgSend(v7, "setHighlightCurationType:", 2);
    +[PHQuery queryForCuratedAssetsInPhotosHighlight:options:](PHQuery, "queryForCuratedAssetsInPhotosHighlight:options:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v9, "executeQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v11;
}

+ (id)requestCuratedAssetsInAssetCollection:(id)a3 referencePersons:(id)a4 options:(id)a5
{
  return (id)objc_msgSend(a1, "_requestCuratedAssetInAssetCollection:referenceAsset:referencePersons:fetchOptions:onlyKey:", a3, 0, a4, a5, 0);
}

+ (id)fetchMovieCuratedAssetsInMemory:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "assetCollectionType") == 4)
  {
    objc_msgSend(v5, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = CFSTR("PHAssetPropertySetOriginalMetadata");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addFetchPropertySets:", v8);

    if (objc_msgSend(v5, "isTransient"))
      objc_msgSend(v5, "queryForCuratedAssetsWithOptions:", v7);
    else
      +[PHQuery queryForMovieCuratedAssetsInMemory:options:](PHQuery, "queryForMovieCuratedAssetsInMemory:options:", v5, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "executeQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset_Curated.m"), 358, CFSTR("fetchMovieCuratedAssetsInMemory only supports memory"));

    v10 = 0;
  }

  return v10;
}

+ (id)fetchUserCuratedAssetsInMemory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fetchUserCuratedAssetsInMemory:options:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchUserCuratedAssetsInMemory:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "assetCollectionType") == 4)
  {
    if (objc_msgSend(v7, "isTransient"))
      objc_msgSend(v7, "queryForCuratedAssetsWithOptions:", v8);
    else
      +[PHQuery queryForUserCuratedAssetsInMemory:options:](PHQuery, "queryForUserCuratedAssetsInMemory:options:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executeQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset_Curated.m"), 379, CFSTR("fetchUserCuratedAssetsInMemory only supports memory"));
    v10 = 0;
  }

  return v10;
}

+ (id)fetchCustomUserAssetsInMemory:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "assetCollectionType") == 4)
  {
    +[PHQuery queryForCustomUserAssetsInMemory:options:](PHQuery, "queryForCustomUserAssetsInMemory:options:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executeQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset_Curated.m"), 390, CFSTR("fetchCustomUserAssetsInMemory only supports memory"));
    v10 = 0;
  }

  return v10;
}

+ (id)fetchRepresentativeAssetsInAssetCollection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v5 = a3;
  if (objc_msgSend(v5, "assetCollectionType") == 4)
  {
    if (objc_msgSend(v5, "isTransient"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset_Curated.m"), 399, CFSTR("Transient memories aren't supported"));

    }
    objc_msgSend(v5, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setIncludeHiddenAssets:", 1);
    objc_msgSend(v7, "setIncludeAllBurstAssets:", 1);
    objc_msgSend(v7, "setIncludeGuestAssets:", 1);
    +[PHQuery queryForRepresentativeAssetsInMemory:options:](PHQuery, "queryForRepresentativeAssetsInMemory:options:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v5, "assetCollectionType") != 8)
    {
      objc_msgSend((id)objc_opt_class(), "_fetchRepresentativeAssetInAssetCollection:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (objc_msgSend(v5, "isTransient"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset_Curated.m"), 408, CFSTR("Transient suggestions aren't supported"));

    }
    objc_msgSend(v5, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setIncludeHiddenAssets:", 1);
    objc_msgSend(v7, "setIncludeAllBurstAssets:", 1);
    +[PHQuery queryForRepresentativeAssetsInSuggestion:options:](PHQuery, "queryForRepresentativeAssetsInSuggestion:options:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  objc_msgSend(v8, "executeQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v11;
}

+ (id)fetchExtendedCuratedAndRepresentativeAssetsAssociatedWithMemory:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(v5, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "setIncludeHiddenAssets:", 1);
  objc_msgSend(v6, "setIncludeAllBurstAssets:", 1);
  objc_msgSend(v6, "setIncludeGuestAssets:", 1);
  +[PHQuery queryForAllAssetsAssociatedWithMemory:options:](PHQuery, "queryForAllAssetsAssociatedWithMemory:options:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchAssetsAssociatedWithMomentsOfMemory:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(v5, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[PHQuery queryForAssetsAssociatedWithMomentsOfMemory:options:](PHQuery, "queryForAssetsAssociatedWithMomentsOfMemory:options:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchReducedCuratedAssetsInMemory:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "assetCollectionType") != 4 && objc_msgSend(v7, "assetCollectionType") != 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset_Curated.m"), 442, CFSTR("Only memories and suggestions are supported"));

  }
  if (objc_msgSend(v7, "assetCollectionType") == 8)
  {
    +[PHAsset fetchKeyAssetsInAssetCollection:options:](PHAsset, "fetchKeyAssetsInAssetCollection:options:", v7, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v8, "fetchLimit"))
      v10 = objc_msgSend(v8, "fetchLimit");
    else
      v10 = 15;
    objc_msgSend(v7, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v12, "mergeWithFetchOptions:", v8);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSortDescriptors:", v14);

    objc_msgSend(v12, "setFetchLimit:", 0);
    +[PHQuery queryForCuratedAssetsInMemory:options:](PHQuery, "queryForCuratedAssetsInMemory:options:", v7, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "executeQuery");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    if (v17 <= v10)
    {
      v9 = v16;
    }
    else
    {
      +[PHAsset fetchKeyCuratedAssetInAssetCollection:referenceAsset:](PHAsset, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v7, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__15451;
      v39 = __Block_byref_object_dispose__15452;
      objc_msgSend(v16, "firstObject");
      v40 = (id)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __62__PHAsset_Curated__fetchReducedCuratedAssetsInMemory_options___block_invoke;
      v29[3] = &unk_1E35D8F78;
      v33 = v10;
      v34 = v17;
      v22 = v21;
      v30 = v22;
      v32 = &v35;
      v23 = v20;
      v31 = v23;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v29);
      if (objc_msgSend(v22, "count") < v10)
      {
        objc_msgSend((id)v36[5], "localIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v24);

      }
      +[PHQuery queryForAssetsWithLocalIdentifiers:options:](PHQuery, "queryForAssetsWithLocalIdentifiers:options:", v22, v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "executeQuery");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v26;
      _Block_object_dispose(&v35, 8);

      v15 = v25;
    }

  }
  return v9;
}

+ (id)requestCuratedAssetsInAssetCollection:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(a1, "_requestCuratedAssetInAssetCollection:referenceAsset:referencePersons:fetchOptions:onlyKey:", a3, 0, 0, a4, 0);
}

+ (id)fetchKeyAssetForEachSuggestion:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(a1, "fetchKeyAssetForEachSuggestion:options:useSuggestionsSortOrder:", a3, a4, 1);
}

+ (id)fetchKeyAssetForEachSuggestion:(id)a3 options:(id)a4 useSuggestionsSortOrder:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  NSObject *v37;
  _BYTE v38[128];
  uint64_t v39;

  v5 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "photoLibrary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHManualFetchResult emptyFetchResultWithPhotoLibrary:](PHManualFetchResult, "emptyFetchResultWithPhotoLibrary:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  v29 = v5;
  v30 = v8;
  +[PHAsset fetchKeyAssetBySuggestionUUIDForSuggestions:options:](PHAsset, "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v31 = v7;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (!v13)
    goto LABEL_18;
  v14 = v13;
  v15 = *(_QWORD *)v33;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v33 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      objc_msgSend(v17, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        PLPhotoKitGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        objc_msgSend(v17, "uuid");
        v21 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v21;
        v22 = v20;
        v23 = "Suggestion UUID %@ not found in suggestionsKeyAssetBySuggestionUUID.";
LABEL_13:
        _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
LABEL_14:

        goto LABEL_16;
      }
      -[NSObject objectID](v19, "objectID");
      v20 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "containsObject:", v20))
      {
        PLPhotoKitGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v19;
          v22 = v21;
          v23 = "Duplicated suggestionKeyAsset: %@";
          goto LABEL_13;
        }
        goto LABEL_14;
      }
      objc_msgSend(v10, "addObject:", v20);
      objc_msgSend(v11, "addObject:", v19);
LABEL_16:

    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  }
  while (v14);
LABEL_18:

  v8 = v30;
  v24 = (void *)objc_msgSend(v30, "copy");
  if (v29)
  {
    objc_msgSend(v10, "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCustomObjectIDSortOrder:", v25);

  }
  +[PHAsset _assetFetchResultFromAssets:options:](PHAsset, "_assetFetchResultFromAssets:options:", v11, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v31;
LABEL_22:

  return v26;
}

+ (id)fetchAssetsForBehavioralCurationWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_64_15446);
}

+ (id)fetchKeyAssetByHighlightUUIDForHighlights:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v31;
  void *v32;
  id obj;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = v6;
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v15, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v17);

        objc_msgSend(v9, "addObject:", v16);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v16);
        if (!v7)
        {
          objc_msgSend(v15, "photoLibrary");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v12);
  }

  objc_msgSend(v7, "photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "fetchPropertySets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __70__PHAsset_Curated__fetchKeyAssetByHighlightUUIDForHighlights_options___block_invoke;
  v34[3] = &unk_1E35D9010;
  v35 = v18;
  v36 = v32;
  v37 = v8;
  v38 = v9;
  v39 = v10;
  v20 = v31;
  v40 = v20;
  v41 = v7;
  v42 = v19;
  v21 = v19;
  v22 = v7;
  v23 = v10;
  v24 = v9;
  v25 = v8;
  v26 = v32;
  v27 = v18;
  objc_msgSend(v27, "performBlockAndWait:", v34);
  v28 = v42;
  v29 = v20;

  return v29;
}

+ (id)fetchKeyAssetBySuggestionUUIDForSuggestions:(id)a3 options:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "fetchedObjectIDsSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchPropertySets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__PHAsset_Curated__fetchKeyAssetBySuggestionUUIDForSuggestions_options___block_invoke;
  v22[3] = &unk_1E35D9F08;
  v23 = v9;
  v24 = v5;
  v25 = v11;
  v26 = v10;
  v27 = v12;
  v13 = v8;
  v28 = v13;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  v17 = v5;
  v18 = v9;
  objc_msgSend(v16, "performBlockAndWait:", v22);
  v19 = v28;
  v20 = v13;

  return v20;
}

+ (id)fetchKeyAssetByMemoryUUIDForMemories:(id)a3 options:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchedObjectIDsSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fetchPropertySets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__PHAsset_Curated__fetchKeyAssetByMemoryUUIDForMemories_options___block_invoke;
  v21[3] = &unk_1E35DEB10;
  v22 = v11;
  v23 = v10;
  v24 = v9;
  v25 = v12;
  v13 = v8;
  v26 = v13;
  v14 = v12;
  v15 = v9;
  v16 = v10;
  v17 = v11;
  objc_msgSend(v16, "performBlockAndWait:", v21);
  v18 = v26;
  v19 = v13;

  return v19;
}

+ (id)fetchSummaryCurationForHighlight:(id)a3 fetchOptions:(id)a4 allowsOnDemand:(BOOL)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "enrichmentState") == 4)
  {
    v12 = objc_msgSend(v9, "enrichmentVersion");
    if (v12 == objc_msgSend(v9, "highlightVersion"))
    {
      v13 = (void *)objc_msgSend(v10, "copy");
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend(v11, "librarySpecificFetchOptions");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v18 = v15;

      objc_msgSend(v18, "setHighlightCurationType:", 1);
      +[PHAsset fetchCuratedAssetsInAssetCollection:options:](PHAsset, "fetchCuratedAssetsInAssetCollection:options:", v9, v18);
      v19 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  if (a5)
  {
    objc_msgSend(v11, "photoAnalysisClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "requestSummaryCurationForHighlightLocalIdentifier:options:error:", v17, MEMORY[0x1E0C9AA70], a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      a6 = 0;
LABEL_14:

      goto LABEL_15;
    }
    +[PHAsset fetchAssetsWithUUIDs:options:](PHAsset, "fetchAssetsWithUUIDs:options:", v18, v10);
    v19 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    a6 = v19;
    goto LABEL_14;
  }
  if (a6)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("No summary curation available for highlight %@, on-demand not allowed"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v24);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }
LABEL_15:

  return a6;
}

+ (id)fetchAssetsForStyleablePhotoSuggestionsWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "copy");
  v4 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0D71880], "predicateForStyleableAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %f"), CFSTR("highlightBeingExtendedAssets.promotionScore"), *MEMORY[0x1E0D72480]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %d"), CFSTR("highlightBeingExtendedAssets.enrichmentState"), 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInternalPredicate:", v9);

  objc_msgSend(v3, "setPredicate:", 0);
  objc_msgSend(v3, "sortDescriptors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSortDescriptors:", v13);

  }
  +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)internalSortDescriptorsWithCreationDateAscending:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("dateCreated"), a3);
  v7[0] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("objectID"), 0);
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __65__PHAsset_Curated__fetchKeyAssetByMemoryUUIDForMemories_options___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY memoriesBeingKeyAsset IN %@"), a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(a1[5], "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PHAsset_Curated__fetchKeyAssetByMemoryUUIDForMemories_options___block_invoke_2;
  v8[3] = &unk_1E35D9060;
  v9 = a1[4];
  v10 = a1[6];
  v11 = a1[7];
  v12 = a1[8];
  v7 = (id)objc_msgSend(v6, "enumerateObjectsFromFetchRequest:usingDefaultBatchSizeWithBlock:", v4, v8);

}

void __65__PHAsset_Curated__fetchKeyAssetByMemoryUUIDForMemories_options___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  PHAssetPLAdapter *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __int128 v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = a2;
  objc_msgSend(v21, "memoriesBeingKeyAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v23;
    *(_QWORD *)&v5 = 138543362;
    v20 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v10 = (void *)a1[4];
        objc_msgSend(v9, "objectID", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

        if ((_DWORD)v10)
        {
          v12 = -[PHObjectPLAdapter initWithPLManagedObject:photoLibrary:]([PHAssetPLAdapter alloc], "initWithPLManagedObject:photoLibrary:", v21, a1[5]);
          v13 = -[PHAssetPLAdapter newObjectWithPropertySets:](v12, "newObjectWithPropertySets:", a1[6]);
          v14 = (void *)a1[7];
          objc_msgSend(v9, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            PLPhotoKitGetLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v9, "uuid");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v20;
              v27 = v18;
              _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "fetchKeyAssetByMemoryUUIDForMemories encountered multiple key assets for memory %{public}@, only taking one", buf, 0xCu);

            }
          }
          else
          {
            v19 = (void *)a1[7];
            objc_msgSend(v9, "uuid");
            v17 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, v17);
          }

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v6);
  }

}

void __72__PHAsset_Curated__fetchKeyAssetBySuggestionUUIDForSuggestions_options___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY suggestionsBeingKeyAssets IN %@"), a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(a1[5], "internalPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(a1[5], "internalPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    objc_msgSend(v4, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "andPredicateWithSubpredicates:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicate:", v11);

  }
  objc_msgSend(a1[6], "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PHAsset_Curated__fetchKeyAssetBySuggestionUUIDForSuggestions_options___block_invoke_2;
  v14[3] = &unk_1E35D9038;
  v15 = a1[4];
  v16 = a1[7];
  v17 = a1[8];
  v18 = a1[9];
  v13 = (id)objc_msgSend(v12, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v4, 0, v14);

}

void __72__PHAsset_Curated__fetchKeyAssetBySuggestionUUIDForSuggestions_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PHAssetPLAdapter *v14;
  id v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "suggestionsBeingKeyAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 138412290;
    v18 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v10, "objectID", v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = objc_msgSend(v11, "containsObject:", v12);

        if ((_DWORD)v11)
        {
          objc_msgSend(v10, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[PHObjectPLAdapter initWithPLManagedObject:photoLibrary:]([PHAssetPLAdapter alloc], "initWithPLManagedObject:photoLibrary:", v3, *(_QWORD *)(a1 + 40));
          v15 = -[PHAssetPLAdapter newObjectWithPropertySets:](v14, "newObjectWithPropertySets:", *(_QWORD *)(a1 + 48));
          objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            PLPhotoKitGetLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v18;
              v24 = v13;
              _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "fetchKeyAssetBySuggestionUUIDForSuggestions encountered multiple key assets for suggestion, only taking one: %@", buf, 0xCu);
            }

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v15, v13);
          }

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

}

void __70__PHAsset_Curated__fetchKeyAssetByHighlightUUIDForHighlights_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  __int16 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  __int16 v20;
  _QWORD aBlock[4];
  id v22;
  id v23;
  id v24;
  __int16 v25;
  _QWORD v26[4];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 40);
  if (!v6 || (v7 = objc_msgSend(v6, "sharingFilter"), v7 == 2))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@ || %K IN %@ || %K IN %@ || %K IN %@"), CFSTR("highlightBeingKeyAssetPrivate"), *(_QWORD *)(a1 + 48), CFSTR("dayGroupHighlightBeingKeyAssetPrivate"), *(_QWORD *)(a1 + 48), CFSTR("highlightBeingKeyAssetShared"), *(_QWORD *)(a1 + 48), CFSTR("dayGroupHighlightBeingKeyAssetShared"), *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = CFSTR("highlightBeingKeyAssetPrivate");
    v26[1] = CFSTR("dayGroupHighlightBeingKeyAssetPrivate");
    v26[2] = CFSTR("highlightBeingKeyAssetShared");
    v26[3] = CFSTR("dayGroupHighlightBeingKeyAssetShared");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 2;
  }
  else
  {
    v8 = v7;
    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@ || %K IN %@"), CFSTR("highlightBeingKeyAssetShared"), *(_QWORD *)(a1 + 48), CFSTR("dayGroupHighlightBeingKeyAssetShared"), *(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = CFSTR("highlightBeingKeyAssetShared");
      v27[1] = CFSTR("dayGroupHighlightBeingKeyAssetShared");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
    }
    else
    {
      if (v7)
      {
        v9 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@ || %K IN %@"), CFSTR("highlightBeingKeyAssetPrivate"), *(_QWORD *)(a1 + 48), CFSTR("dayGroupHighlightBeingKeyAssetPrivate"), *(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = CFSTR("highlightBeingKeyAssetPrivate");
      v28[1] = CFSTR("dayGroupHighlightBeingKeyAssetPrivate");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
    }
  }
  objc_msgSend(v5, "setRelationshipKeyPathsForPrefetching:", v10);

LABEL_9:
  objc_msgSend(v5, "setPredicate:", v9);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PHAsset_Curated__fetchKeyAssetByHighlightUUIDForHighlights_options___block_invoke_2;
  aBlock[3] = &unk_1E35D8FC0;
  v22 = *(id *)(a1 + 56);
  v23 = *(id *)(a1 + 64);
  v25 = v8;
  v24 = *(id *)(a1 + 72);
  v12 = _Block_copy(aBlock);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __70__PHAsset_Curated__fetchKeyAssetByHighlightUUIDForHighlights_options___block_invoke_81;
  v16[3] = &unk_1E35D8FE8;
  v17 = *(id *)(a1 + 80);
  v13 = *(id *)(a1 + 88);
  v20 = v8;
  v18 = v13;
  v19 = v12;
  v14 = v12;
  v15 = (id)objc_msgSend(v2, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v5, 0, v16);

}

void __70__PHAsset_Curated__fetchKeyAssetByHighlightUUIDForHighlights_options___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7 && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "sharingComposition") == 2 && *(_WORD *)(a1 + 56) == 2)
    {
      v11 = objc_msgSend(v10, "mixedSharingCompositionKeyAssetRelationship");
      if (!v11)
      {
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v9, v7);
        PLPhotoKitGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = 138412290;
          v14 = v7;
        }

        goto LABEL_15;
      }
      if (v11 == 2)
      {
        if (!objc_msgSend(v8, "hasLibraryScope"))
        {
LABEL_15:

          goto LABEL_16;
        }
      }
      else if (v11 != 1 || (objc_msgSend(v8, "hasLibraryScope") & 1) != 0)
      {
        goto LABEL_15;
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v9, v7);
    goto LABEL_15;
  }
LABEL_16:

}

void __70__PHAsset_Curated__fetchKeyAssetByHighlightUUIDForHighlights_options___block_invoke_81(uint64_t a1, void *a2)
{
  PHAssetPLAdapter *v3;
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  v3 = -[PHObjectPLAdapter initWithPLManagedObject:photoLibrary:]([PHAssetPLAdapter alloc], "initWithPLManagedObject:photoLibrary:", v22, *(_QWORD *)(a1 + 32));
  v4 = -[PHAssetPLAdapter newObjectWithPropertySets:](v3, "newObjectWithPropertySets:", *(_QWORD *)(a1 + 40));
  v5 = *(unsigned __int16 *)(a1 + 56);
  if (v5 == 2)
  {
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v22, "highlightBeingKeyAssetPrivate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id, id))(v11 + 16))(v11, v13, v22, v4);

    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v22, "dayGroupHighlightBeingKeyAssetPrivate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id, id))(v14 + 16))(v14, v16, v22, v4);

    goto LABEL_6;
  }
  if (v5 == 1)
  {
LABEL_6:
    v17 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v22, "highlightBeingKeyAssetShared");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id, id))(v17 + 16))(v17, v19, v22, v4);

    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v22, "dayGroupHighlightBeingKeyAssetShared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!*(_WORD *)(a1 + 56))
  {
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v22, "highlightBeingKeyAssetPrivate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id, id))(v6 + 16))(v6, v8, v22, v4);

    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v22, "dayGroupHighlightBeingKeyAssetPrivate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v20 = v10;
    objc_msgSend(v10, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v21, v22, v4);

  }
}

id __64__PHAsset_Curated__fetchAssetsForBehavioralCurationWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsForBehavioralCurationWithOptions:](PHQuery, "queryForAssetsForBehavioralCurationWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __62__PHAsset_Curated__fetchReducedCuratedAssetsInMemory_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  BOOL v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  id v27;

  v27 = a2;
  v6 = (unint64_t)(*(_QWORD *)(a1 + 56) * a3) / *(_QWORD *)(a1 + 64) - 1;
  if (v6 == objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v8 = *(_QWORD *)(a1 + 48);
    v7 = a1 + 48;
    v9 = *(void **)(v7 - 16);
    objc_msgSend(*(id *)(*(_QWORD *)(v8 + 8) + 40), "localIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

LABEL_18:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 40), a2);
    goto LABEL_19;
  }
  v11 = *(_QWORD *)(a1 + 48);
  v7 = a1 + 48;
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(v11 + 8) + 40), "isFavorite");
  v26 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 40), "mediaType");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 40), "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(v7 - 8));

  v15 = objc_msgSend(v27, "isFavorite");
  v16 = objc_msgSend(v27, "mediaType");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 40), "curationScore");
  v18 = v17;
  objc_msgSend(v27, "curationScore");
  v20 = v19;
  objc_msgSend(v27, "localIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", *(_QWORD *)(v7 - 8));

  v23 = v12 == v15 && v18 < v20;
  if (v23 && (v26 == 2) == (v16 == 2) && !v14)
    goto LABEL_18;
  if ((v15 ^ 1 | v12 | v14 | (v26 == 2) ^ (v16 == 2)) != 1)
    goto LABEL_18;
  v24 = v26 != 2 || v16 == 2;
  v25 = v24 ? 1 : v14;
  if ((v25 ^ 1 | v22) == 1)
    goto LABEL_18;
LABEL_19:

}

uint64_t __111__PHAsset_Curated___requestCuratedAssetInAssetCollection_referenceAsset_referencePersons_fetchOptions_onlyKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

- (unint64_t)originalChoiceToFallbackForUnsupportRAW
{
  unint64_t v3;
  unint64_t v5;

  v3 = -[PHAsset originalResourceChoice](self, "originalResourceChoice");
  if (v3 == 1)
    return 0;
  v5 = v3;
  if (((v3 == 0) & -[PHAsset isOriginalRaw](self, "isOriginalRaw")) != 0)
    return 3;
  else
    return v5;
}

- (BOOL)shouldUseRAWResourceAsUnadjustedEditBase
{
  if (PHDeviceSupportsRAW_onceToken != -1)
    dispatch_once(&PHDeviceSupportsRAW_onceToken, &__block_literal_global_16549);
  return PHDeviceSupportsRAW_deviceSupportsRAW
      && -[PHAsset shouldUseRAWResourceWithOriginalResourceChoice:](self, "shouldUseRAWResourceWithOriginalResourceChoice:", -[PHAsset originalResourceChoice](self, "originalResourceChoice"));
}

- (BOOL)shouldUseRAWResourceWithOriginalResourceChoice:(unint64_t)a3
{
  _BOOL4 v3;
  int v6;

  if (a3 == 1)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[PHAsset isOriginalRaw](self, "isOriginalRaw");
    if (v3)
    {
      v6 = !-[PHAsset hasAdjustments](self, "hasAdjustments");
      if (a3 == 3)
        LOBYTE(v3) = v6;
      else
        LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)originalUTI
{
  void *v3;
  void *v4;
  void *v5;

  -[PHAsset pathForOriginalFile](self, "pathForOriginalFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71880], "uniformTypeIdentifierFromPathExtension:assetType:", v4, -[PHAsset kind](self, "kind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isOriginalRaw
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PHAsset originalUTI](self, "originalUTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC5B8]);

  return v5;
}

- (BOOL)_canHandleAdjustmentData:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t (**v8)(_QWORD, _QWORD);

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isOpaque") & 1) != 0 || !objc_msgSend(v5, "_hasAdjustments"))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    objc_msgSend(v6, "canHandleAdjustmentData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "canHandleAdjustmentData");
      v8 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = ((uint64_t (**)(_QWORD, id))v8)[2](v8, v5);

    }
  }

  return (char)v7;
}

- (int64_t)_baseVersionForAdjustmentData:(id)a3 canHandleAdjustmentData:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  int64_t v8;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "_hasAdjustments");
  if (v7)
    v8 = 2;
  else
    v8 = 0;
  if (v7 && v4)
  {
    if (objc_msgSend(v6, "baseVersion"))
    {
      if (-[PHAsset isVideo](self, "isVideo"))
        v8 = 2;
      else
        v8 = 1;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_videoRequestOptionsForBaseVersion:(int64_t)a3 options:(id)a4 progressEstimateForVideoProgress:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setDeliveryMode:", 1);
  objc_msgSend(v10, "setNetworkAccessAllowed:", objc_msgSend(v8, "isNetworkAccessAllowed"));
  objc_msgSend(v10, "setVideoComplementAllowed:", -[PHAsset isPhotoIris](self, "isPhotoIris"));
  objc_msgSend(v8, "progressHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __110__PHAsset_PHContentEditingInput___videoRequestOptionsForBaseVersion_options_progressEstimateForVideoProgress___block_invoke;
    v16 = &unk_1E35D9228;
    v18 = v9;
    v17 = v8;
    objc_msgSend(v10, "setProgressHandler:", &v13);

  }
  objc_msgSend(v10, "setVersion:", +[PHAdjustmentData videoRequestVersionFromAdjustmentBaseVersion:](PHAdjustmentData, "videoRequestVersionFromAdjustmentBaseVersion:", a3, v13, v14, v15, v16));

  return v10;
}

- (id)_imageRequestOptionsForBaseVersion:(int64_t)a3 options:(id)a4 progressEstimateForImageProgress:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setDeliveryMode:", 1);
  objc_msgSend(v10, "setLoadingMode:", 65537);
  objc_msgSend(v10, "setNetworkAccessAllowed:", objc_msgSend(v8, "isNetworkAccessAllowed"));
  objc_msgSend(v8, "progressHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __110__PHAsset_PHContentEditingInput___imageRequestOptionsForBaseVersion_options_progressEstimateForImageProgress___block_invoke;
    v17 = &unk_1E35D9228;
    v19 = v9;
    v18 = v8;
    objc_msgSend(v10, "setProgressHandler:", &v14);

  }
  v12 = +[PHAdjustmentData imageRequestVersionFromAdjustmentBaseVersion:](PHAdjustmentData, "imageRequestVersionFromAdjustmentBaseVersion:", a3, v14, v15, v16, v17);
  if ((objc_msgSend(v8, "dontAllowRAW") & 1) == 0 && v12 == 1)
  {
    if (-[PHAsset shouldUseRAWResourceAsUnadjustedEditBase](self, "shouldUseRAWResourceAsUnadjustedEditBase"))
      v12 = 2;
    else
      v12 = 1;
  }
  objc_msgSend(v10, "setVersion:", v12);

  return v10;
}

- (PHContentEditingInputRequestID)requestContentEditingInputWithOptions:(PHContentEditingInputRequestOptions *)options completionHandler:(void *)completionHandler
{
  PHContentEditingInputRequestOptions *v7;
  void *v8;
  void *v9;
  PHContentEditingInputRequestID v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = options;
  v8 = completionHandler;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ cannot be used on a non-existing asset"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v17);
  }
  +[PHImageManager defaultManager](PHImageManager, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (int)objc_msgSend(v9, "requestContentEditingInputForAsset:withOptions:completionHandler:", self, v7, v8);

  return v10;
}

- (void)cancelContentEditingInputRequest:(PHContentEditingInputRequestID)requestID
{
  id v4;

  +[PHImageManager defaultManager](PHImageManager, "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelImageRequest:", requestID);

}

- (void)_requestRenderedVideoForVideoURL:(id)a3 adjustmentData:(id)a4 canHandleAdjustmentData:(BOOL)a5 resultHandler:(id)a6
{
  id v10;
  void (**v11)(id, id, _QWORD);
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(id, id, _QWORD);

  v10 = a3;
  v11 = (void (**)(id, id, _QWORD))a6;
  v12 = (objc_class *)MEMORY[0x1E0D75308];
  v13 = a4;
  v14 = [v12 alloc];
  objc_msgSend(v13, "formatIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "formatVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v14, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v15, v16, v17, 0, 0, 0);
  if (-[PHAsset isPhotoIris](self, "isPhotoIris") || a5 || (objc_msgSend(v18, "isRecognizedFormat") & 1) == 0)
  {
    v11[2](v11, v10, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v19, v18);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __120__PHAsset_PHContentEditingInput___requestRenderedVideoForVideoURL_adjustmentData_canHandleAdjustmentData_resultHandler___block_invoke;
    v21[3] = &unk_1E35DD990;
    v22 = v11;
    -[PHAsset _renderTemporaryVideoForObjectBuilder:resultHandler:](self, "_renderTemporaryVideoForObjectBuilder:resultHandler:", v20, v21);

  }
}

- (void)_renderTemporaryVideoForObjectBuilder:(id)a3 resultHandler:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = *MEMORY[0x1E0C89E98];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__PHAsset_PHContentEditingInput___renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke;
  v8[3] = &unk_1E35DD9B8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a3, "requestExportSessionWithExportPreset:resultHandler:", v6, v8);

}

void __86__PHAsset_PHContentEditingInput___renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RenderedContent-%@.MOV"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOutputFileType:", *MEMORY[0x1E0C8A2E8]);
    objc_msgSend(v3, "setOutputURL:", v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __86__PHAsset_PHContentEditingInput___renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke_2;
    v12[3] = &unk_1E35DF3B8;
    v13 = v3;
    v10 = *(id *)(a1 + 32);
    v14 = v9;
    v15 = v10;
    v11 = v9;
    objc_msgSend(v13, "exportAsynchronouslyWithCompletionHandler:", v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __86__PHAsset_PHContentEditingInput___renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString **v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 4)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("Rendering video failed");
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = (const __CFString **)v11;
    v5 = &v10;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "status") != 5)
      goto LABEL_7;
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v9 = CFSTR("Rendering video cancelled");
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = &v9;
    v5 = &v8;
  }
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    return;
  }
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __120__PHAsset_PHContentEditingInput___requestRenderedVideoForVideoURL_adjustmentData_canHandleAdjustmentData_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __110__PHAsset_PHContentEditingInput___imageRequestOptionsForBaseVersion_options_progressEstimateForImageProgress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5;
  void (**v6)(id, _QWORD, double);

  v5 = (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "progressHandler");
  v6 = (void (**)(id, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v6[2](v6, a3, v5);

}

void __110__PHAsset_PHContentEditingInput___videoRequestOptionsForBaseVersion_options_progressEstimateForVideoProgress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5;
  void (**v6)(id, _QWORD, double);

  v5 = (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "progressHandler");
  v6 = (void (**)(id, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v6[2](v6, a3, v5);

}

- (void)_setupSmartStyleFromFetchDictionary:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("currentSleetCast"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shortValue");

  if (v5 >= 1 && (unsigned __int16)self->_currentSmartStyleCast != (unsigned __int16)v5)
    self->_currentSmartStyleCast = v5;
}

- (signed)assetSource
{
  signed __int16 v4;
  void *v5;

  v4 = -[PHAsset savedAssetType](self, "savedAssetType");
  if (assetSource_onceToken != -1)
    dispatch_once(&assetSource_onceToken, &__block_literal_global_381);
  if (!assetSource_linkedBefore11_0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAsset.m"), 1409, CFSTR("assetSource is not a supported property, use sourceType"));

  }
  return v4;
}

- (id)creationDateAdjustedForTimeZone
{
  void *v3;
  void *v4;
  void *v5;

  -[PHObject fetchPropertySetsIfNeeded](self, "fetchPropertySetsIfNeeded");
  -[PHAsset creationDate](self, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset originalMetadataProperties](self, "originalMetadataProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", (double)(int)objc_msgSend(v4, "timeZoneOffset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDate)localCreationDate
{
  NSDate *localCreationDate;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSDate *v9;
  NSDate *v10;

  localCreationDate = self->_localCreationDate;
  if (!localCreationDate)
  {
    -[PHObject fetchPropertySetsIfNeeded](self, "fetchPropertySetsIfNeeded");
    -[PHAsset creationDate](self, "creationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAsset localDateProperties](self, "localDateProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inferredTimeZoneOffset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v6, "integerValue");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "secondsFromGMTForDate:", v4);

    }
    objc_msgSend(v4, "dateByAddingTimeInterval:", (double)v7);
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v10 = self->_localCreationDate;
    self->_localCreationDate = v9;

    localCreationDate = self->_localCreationDate;
  }
  return localCreationDate;
}

- (BOOL)needsDeferredProcessing
{
  unsigned int v3;

  v3 = -[PHAsset deferredProcessingNeeded](self, "deferredProcessingNeeded") - 1;
  return v3 < 0xA && ((0x243u >> v3) & 1) != 0
      || -[PHAsset videoDeferredProcessingNeeded](self, "videoDeferredProcessingNeeded") == 1;
}

- (void)_attachPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  v6 = (void *)MEMORY[0x19AEBEADC]();
  v7 = -[PHAsset _createPropertyObjectOfClass:preFetchedProperties:](self, "_createPropertyObjectOfClass:preFetchedProperties:", a3, v8);
  objc_autoreleasePoolPop(v6);

}

- (id)_createPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  Class aClass;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  PHAsset *v52;
  uint64_t *v53;
  Class v54;
  char v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  PHAsset *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v45 = a4;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__19039;
  v64 = __Block_byref_object_dispose__19040;
  aClass = a3;
  ph_objc_getAssociatedObject(self, a3);
  v65 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v61[5];
  if (!v6)
  {
    if (v45)
    {
      v7 = objc_msgSend([a3 alloc], "initWithFetchDictionary:asset:prefetched:", v45, self, 1);
      v8 = (id)v61[5];
      v61[5] = v7;
LABEL_26:

      ph_objc_setAssociatedObjectIfNotSet(self, aClass, (void *)v61[5]);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v61[5];
      v61[5] = v31;

      v6 = (void *)v61[5];
      goto LABEL_27;
    }
    if ((-[objc_class inverseIsToMany](a3, "inverseIsToMany") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D71880], "entityName");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3880];
      -[PHObject objectID](self, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "predicateWithFormat:", CFSTR("self == %@"), v11);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)v9;
    }
    else
    {
      -[objc_class entityName](a3, "entityName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D71880], "entityName");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v44 = v14;

      -[objc_class keyPathToPrimaryObject](a3, "keyPathToPrimaryObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3880];
      -[PHObject objectID](self, "objectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K == %@"), v11, v16);
      else
        objc_msgSend(v15, "predicateWithFormat:", CFSTR("self == %@"), v16);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[objc_class propertiesToFetch](a3, "propertiesToFetch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      PLPhotoKitGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(a3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v68 = v20;
        v69 = 2112;
        v70 = self;
        _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Missing prefetched properties for %@ on %@. Fetching on demand on the main queue, which may degrade performance.", buf, 0x16u);

      }
    }
    else
    {
      PLPhotoKitGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromClass(a3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v68 = v21;
        v69 = 2112;
        v70 = self;
        _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEFAULT, "Missing prefetched properties for %@ on %@. Fetching on demand.", buf, 0x16u);

      }
    }

    if ((-[objc_class inverseIsToMany](a3, "inverseIsToMany") & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "extendPropertiesToFetch:withPropertySetClass:", v18, a3);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[objc_class keyPathToPrimaryObject](a3, "keyPathToPrimaryObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v22;
      if (v22)
      {
        objc_msgSend(v22, "stringByAppendingString:", CFSTR("."));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
      -[objc_class additionalPropertiesToFetchOnPrimaryObject](a3, "additionalPropertiesToFetchOnPrimaryObject");
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v35 = (id)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v57 != v37)
              objc_enumerationMutation(v35);
            v39 = *(id *)(*((_QWORD *)&v56 + 1) + 8 * i);
            if (v23)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trying to create a property path '%@' on '%@' with an unexpected property type: %@"), v39, self, objc_opt_class());
                objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
                v41 = (id)objc_claimAutoreleasedReturnValue();
                objc_exception_throw(v41);
              }
              objc_msgSend(v23, "stringByAppendingString:", v39);
              v40 = objc_claimAutoreleasedReturnValue();

              v39 = (id)v40;
            }
            if (objc_msgSend(v18, "indexOfObject:", v39) == 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v18, "addObject:", v39);

          }
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        }
        while (v36);
      }

      v24 = 1;
      goto LABEL_25;
    }
    v24 = 0;
LABEL_25:
    -[PHObject photoLibrary](self, "photoLibrary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class propertySetName](aClass, "propertySetName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectFetchingManagedObjectContextForObject:propertySet:", self, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __61__PHAsset__createPropertyObjectOfClass_preFetchedProperties___block_invoke;
    v47[3] = &unk_1E35D9E70;
    v8 = v44;
    v48 = v8;
    v28 = v43;
    v49 = v28;
    v29 = v18;
    v50 = v29;
    v30 = v27;
    v51 = v30;
    v52 = self;
    v55 = v24;
    v53 = &v60;
    v54 = aClass;
    objc_msgSend(v30, "performBlockAndWait:", v47);

    goto LABEL_26;
  }
LABEL_27:
  v33 = v6;
  _Block_object_dispose(&v60, 8);

  return v33;
}

- (id)_createPropertyObjectOfClass:(Class)a3
{
  return -[PHAsset _createPropertyObjectOfClass:preFetchedProperties:](self, "_createPropertyObjectOfClass:preFetchedProperties:", a3, 0);
}

- (id)_createCommentPropertyObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  __CFString *v21;
  id v22;
  id v23;
  id v24;
  PHAsset *v25;
  uint64_t *v26;
  void *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__19039;
  v32 = __Block_byref_object_dispose__19040;
  ph_objc_getAssociatedObject(self, v3);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v29[5];
  if (!v4)
  {
    v34[0] = CFSTR("commentDate");
    v34[1] = CFSTR("isLike");
    v34[2] = CFSTR("isMyComment");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3880];
    -[PHObject objectID](self, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHObject objectID](self, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("likedAsset == %@ OR commentedAsset == %@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHObject photoLibrary](self, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertySetName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectFetchingManagedObjectContextForObject:propertySet:", self, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __39__PHAsset__createCommentPropertyObject__block_invoke;
    v20[3] = &unk_1E35DC028;
    v21 = CFSTR("CloudSharedComment");
    v13 = v9;
    v22 = v13;
    v14 = v5;
    v23 = v14;
    v15 = v12;
    v26 = &v28;
    v27 = v3;
    v24 = v15;
    v25 = self;
    objc_msgSend(v15, "performBlockAndWait:", v20);
    ph_objc_setAssociatedObjectIfNotSet(self, v3, (void *)v29[5]);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v29[5];
    v29[5] = v16;

    v4 = (void *)v29[5];
  }
  v18 = v4;
  _Block_object_dispose(&v28, 8);

  return v18;
}

- (id)_createAnalysisStatePropertyObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  __CFString *v14;
  id v15;
  uint64_t *v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = (void *)objc_opt_class();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__19039;
  v22 = __Block_byref_object_dispose__19040;
  ph_objc_getAssociatedObject(self, v3);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v19[5];
  if (!v4)
  {
    -[PHObject photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertySetName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectFetchingManagedObjectContextForObject:propertySet:", self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__PHAsset__createAnalysisStatePropertyObject__block_invoke;
    v13[3] = &unk_1E35D9E98;
    v13[4] = self;
    v14 = CFSTR("AssetAnalysisState");
    v8 = v7;
    v15 = v8;
    v16 = &v18;
    v17 = v3;
    objc_msgSend(v8, "performBlockAndWait:", v13);
    ph_objc_setAssociatedObjectIfNotSet(self, v3, (void *)v19[5]);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v19[5];
    v19[5] = v9;

    v4 = (void *)v19[5];
  }
  v11 = v4;
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (id)_createKeywordPropertyObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = (void *)objc_opt_class();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__19039;
  v21 = __Block_byref_object_dispose__19040;
  ph_objc_getAssociatedObject(self, v3);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v18[5];
  if (!v4)
  {
    -[PHObject photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertySetName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectFetchingManagedObjectContextForObject:propertySet:", self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__PHAsset__createKeywordPropertyObject__block_invoke;
    v13[3] = &unk_1E35D9EE0;
    v13[4] = self;
    v8 = v7;
    v14 = v8;
    v15 = &v17;
    v16 = v3;
    objc_msgSend(v8, "performBlockAndWait:", v13);
    ph_objc_setAssociatedObjectIfNotSet(self, v3, (void *)v18[5]);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v18[5];
    v18[5] = v9;

    v4 = (void *)v18[5];
  }
  v11 = v4;
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)originalMetadataProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 8);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)photosOneUpProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 16);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)localDateProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x200000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)photosInfoPanelExtendedProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x100000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)photosInfoPanelLocationProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x1000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)photosSmartStyleExtendedProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x8000000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)cameraCaptureDeviceProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x10000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)photoIrisProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 32);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)descriptionProperties
{
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)cloudSharedProperties
{
  void *v3;

  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x10000000000);
  if (-[PHAsset isCloudSharedAsset](self, "isCloudSharedAsset"))
  {
    -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)commentProperties
{
  void *v3;

  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 128);
  if (-[PHAsset isCloudSharedAsset](self, "isCloudSharedAsset"))
  {
    -[PHAsset _createCommentPropertyObject](self, "_createCommentPropertyObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)sceneAnalysisProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 256);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)assetAnalysisStateProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 512);
  return -[PHAsset _createAnalysisStatePropertyObject](self, "_createAnalysisStatePropertyObject");
}

- (id)assetUserActivityProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 1024);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)adjustmentProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x2000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)curationProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x4000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)aestheticProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x8000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)mediaAnalysisProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x10000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)photoAnalysisWallpaperProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x200000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)characterRecognitionProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x8000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)visualSearchProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x40000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)importProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x20000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)sceneprintProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x40000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)destinationAssetCopyProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x80000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)keywordProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x400000);
  return -[PHAsset _createKeywordPropertyObject](self, "_createKeywordPropertyObject");
}

- (id)gridMetadataProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x800000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)coarseLocationProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x2000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)libraryScopeProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x4000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)cloudLocalStateProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x20000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)montageProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0xFFFFFFFF80000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)spatialMediaProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x100000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)StoryPlaybackProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x4000000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)locationDataProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x400000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)ptpProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x2000000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (id)iconicScoreProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 0x800000000);
  return -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (unint64_t)originalResourceChoice
{
  void *v3;
  unint64_t v4;

  -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 0x2000);
  -[PHAsset adjustmentProperties](self, "adjustmentProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "originalResourceChoice");

  return v4;
}

- (id)sceneClassificationsOfTypes:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v39;
  SEL v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (!v8)
  {
    v43 = 0;
    v10 = 0;
    goto LABEL_20;
  }
  v9 = v8;
  v40 = a2;
  v43 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v45;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v45 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v12);
      ph_objc_getAssociatedObject(self, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "allObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v16);
LABEL_8:

        goto LABEL_9;
      }
      v17 = objc_msgSend(v13, "integerValue");
      if (v17 > 7)
        goto LABEL_16;
      v39 = v10;
      if (((1 << v17) & 0xF1) != 0)
      {
        v18 = (void *)MEMORY[0x1E0CB3880];
        -[PHObject objectID](self, "objectID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("assetAttributes.asset"), v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "addObject:", v13);
      }
      else
      {
        if (((1 << v17) & 0xC) == 0)
        {
LABEL_16:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", v40, self, CFSTR("PHAsset.m"), 2241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("knownSceneIdentifier"));
          goto LABEL_8;
        }
        v20 = (void *)MEMORY[0x1E0CB3880];
        -[PHObject objectID](self, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("assetAttributesForTemporalSceneClassifications.asset"), v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v10 = v39;
        objc_msgSend(v41, "addObject:", v13);
        v43 = (void *)v22;
      }
LABEL_9:

      ++v12;
    }
    while (v9 != v12);
    v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    v9 = v23;
  }
  while (v23);
LABEL_20:

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v25 = (void *)MEMORY[0x1E0CB3528];
    v49[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("classificationType"), v42);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "andPredicateWithSubpredicates:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v28);

  }
  v29 = v43;
  if (v43)
  {
    v30 = (void *)MEMORY[0x1E0CB3528];
    v48[0] = v43;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("classificationType"), v41);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "andPredicateWithSubpredicates:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v33);

    v29 = v43;
  }
  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v24);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAsset _sceneClassificationsWithPredicate:](self, "_sceneClassificationsWithPredicate:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "allObjects");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v36);

    v29 = v43;
  }
  v37 = v6;

  return v37;
}

- (NSSet)sceneClassifications
{
  return (NSSet *)-[PHAsset sceneClassificationsOfTypes:](self, "sceneClassificationsOfTypes:", &unk_1E36572A0);
}

- (NSSet)allSceneClassifications
{
  return (NSSet *)-[PHAsset sceneClassificationsOfTypes:](self, "sceneClassificationsOfTypes:", &unk_1E36572B8);
}

- (NSSet)temporalSceneClassifications
{
  return (NSSet *)-[PHAsset sceneClassificationsOfTypes:](self, "sceneClassificationsOfTypes:", &unk_1E36572D0);
}

- (id)_sceneClassificationsWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _BYTE v41[128];
  _QWORD v42[8];

  v42[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42[0] = CFSTR("sceneIdentifier");
  v42[1] = CFSTR("confidence");
  v42[2] = CFSTR("packedBoundingBoxRect");
  v42[3] = CFSTR("startTime");
  v42[4] = CFSTR("duration");
  v42[5] = CFSTR("classificationType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71AB0], "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetSceneAnalysisProperties propertySetName](PHAssetSceneAnalysisProperties, "propertySetName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectFetchingManagedObjectContextForObject:propertySet:", self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __46__PHAsset__sceneClassificationsWithPredicate___block_invoke;
  v34[3] = &unk_1E35D9F08;
  v28 = v6;
  v35 = v28;
  v29 = v4;
  v36 = v29;
  v27 = v5;
  v37 = v27;
  v12 = v9;
  v38 = v12;
  v13 = v10;
  v39 = v13;
  v14 = v11;
  v40 = v14;
  objc_msgSend(v12, "performBlockAndWait:", v34);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v21, "copy");
        v23 = ph_objc_setAssociatedObjectIfNotSet(self, v20, v22);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    }
    while (v17);
  }

  v24 = v40;
  v25 = v13;

  return v25;
}

- (NSData)distanceIdentity
{
  void *v3;
  void *v4;

  -[PHObject fetchPropertySetsIfNeeded](self, "fetchPropertySetsIfNeeded");
  -[PHAsset sceneAnalysisProperties](self, "sceneAnalysisProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "distanceIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (int)analysisStateForWorkerType:(signed __int16)a3 outLastIgnoreDate:(id *)a4 outIgnoreUntilDate:(id *)a5
{
  uint64_t v7;
  void *v9;

  v7 = a3;
  -[PHObject fetchPropertySetsIfNeeded](self, "fetchPropertySetsIfNeeded");
  -[PHAsset assetAnalysisStateProperties](self, "assetAnalysisStateProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v9, "analysisStateForWorkerType:outLastIgnoreDate:outIgnoreUntilDate:", v7, a4, a5);

  return (int)a5;
}

- (unint64_t)variationSuggestionStatesForVariationType:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 16);
  -[PHAsset photosOneUpProperties](self, "photosOneUpProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "variationSuggestionStates");

  if (a3)
    return (v6 >> (6 * a3 - 6)) & 0x3F;
  else
    return 0;
}

- (BOOL)isVariationSuggestionStatesUnknown
{
  void *v3;
  uint64_t v4;

  -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 16);
  -[PHAsset photosOneUpProperties](self, "photosOneUpProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "variationSuggestionStates");

  return v4 == 0;
}

- (id)_unfetchedPropertySetsFromPropertySets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!-[PHObject hasLoadedPropertySet:](self, "hasLoadedPropertySet:", v11, (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (int)orientation
{
  PHAsset *v4;
  id v5;

  if (dyld_program_sdk_at_least())
  {
    v4 = self;
    PFMethodNotImplementedException();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  return self->_exifOrientation;
}

- (int64_t)imageOrientation
{
  return PLImageOrientationFromExifOrientation();
}

- (BOOL)isHDVideo
{
  _BOOL4 v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[PHAsset isVideo](self, "isVideo");
  if (v3)
  {
    v4 = -[PHAsset pixelWidth](self, "pixelWidth");
    v5 = -[PHAsset pixelHeight](self, "pixelHeight");
    LOBYTE(v3) = v4 >= 0x2D0 && v5 > 0x4FF || v4 > 0x4FF && v5 > 0x2CF;
  }
  return v3;
}

- (BOOL)isJPEG
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PHAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC530]);

  return v5;
}

- (BOOL)isJPEG2000
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PHAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "jpeg2000Type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "conformsToType:", v5);

  return v6;
}

- (BOOL)isHEIF
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PHAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC698]);

  return v5;
}

- (BOOL)isTIFF
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PHAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC600]);

  return v5;
}

- (BOOL)isPNG
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PHAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC580]);

  return v5;
}

- (BOOL)isPDF
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PHAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC570]);

  return v5;
}

- (BOOL)isPSD
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PHAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "adobePhotoshopType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "conformsToType:", v5);

  return v6;
}

- (BOOL)isRAW
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PHAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC5B8]);

  return v5;
}

- (BOOL)isAnimatedGIF
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PHAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CEC4F8]);

  return v5;
}

- (BOOL)isHEICSequence
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = (void *)MEMORY[0x1E0D752F0];
  -[PHAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "heicSequenceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "conformsToType:", v5);

  return v6;
}

- (BOOL)isPrimaryImageFormat
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0D71880];
  -[PHAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isPrimaryImageFormatForUTI:", v3);

  return (char)v2;
}

- (BOOL)isScreenRecording
{
  _BOOL4 v3;
  void *v4;
  char v5;

  if (-[PHAsset isMediaSubtype:](self, "isMediaSubtype:", 0x80000))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[PHAsset isVideo](self, "isVideo");
    if (v3)
    {
      -[PHAsset originalFilename](self, "originalFilename");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(MEMORY[0x1E0D71880], "isScreenRecordingFileName:", v4);

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (BOOL)isLocatedAtCoordinates:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  int v12;

  longitude = a3.longitude;
  latitude = a3.latitude;
  -[PHAsset location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "coordinate");
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9E500];
    v10 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  if ((objc_msgSend(MEMORY[0x1E0D71860], "canUseCoordinate:", latitude, longitude) & 1) != 0)
  {
    v11 = vabdd_f64(latitude, v8) < 2.22044605e-16;
    LOBYTE(v12) = vabdd_f64(longitude, v10) < 2.22044605e-16 && v11;
  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x1E0D71860], "canUseCoordinate:", v8, v10) ^ 1;
  }

  return v12;
}

- (id)originalImageProperties
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__19039;
  v14 = __Block_byref_object_dispose__19040;
  v15 = 0;
  -[PHAsset pl_photoLibrary](self, "pl_photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__PHAsset_originalImageProperties__block_invoke;
  v7[3] = &unk_1E35DEE50;
  v7[4] = self;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)originalAVAssetOrProxy
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__19039;
  v14 = __Block_byref_object_dispose__19040;
  v15 = 0;
  -[PHAsset pl_photoLibrary](self, "pl_photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__PHAsset_originalAVAssetOrProxy__block_invoke;
  v7[3] = &unk_1E35DEE50;
  v7[4] = self;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)originalAVAssetCommonMetadata
{
  void *v2;
  void *v3;

  -[PHAsset originalAVAssetOrProxy](self, "originalAVAssetOrProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)originalCreationDateWithTimeZone:(id *)a3
{
  void *v5;
  void *v6;
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
  void *v19;

  -[PHAsset photosInfoPanelExtendedProperties](self, "photosInfoPanelExtendedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(v5, "timezoneOffset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v5, "timezoneOffset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeZoneForSecondsFromGMT:", objc_msgSend(v9, "integerValue"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  if (!v6)
  {
    -[PHObject photoLibrary](self, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photoLibraryBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeZoneLookup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PHAsset isVideo](self, "isVideo"))
    {
      -[PHAsset originalAVAssetOrProxy](self, "originalAVAssetOrProxy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVAsset:timeZoneLookup:", v13, v12);
LABEL_11:

        objc_msgSend(v14, "utcCreationDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeZone");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (a3)
          *a3 = objc_retainAutorelease(v18);

        goto LABEL_14;
      }
    }
    else
    {
      -[PHAsset originalImageProperties](self, "originalImageProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v15 = (void *)MEMORY[0x1E0D752F0];
        -[PHAsset uniformTypeIdentifier](self, "uniformTypeIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "typeWithIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithImageProperties:contentType:timeZoneLookup:", v13, v17, v12);
        goto LABEL_11;
      }
    }
    v14 = 0;
    goto LABEL_11;
  }
LABEL_14:

  return v6;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (BOOL)faceAnalysisVersionWasFetched
{
  return (-[PHObject propertyHint](self, "propertyHint") >> 11) & 1;
}

- (id)pl_photoLibrary
{
  void *v2;
  void *v3;

  -[PHObject photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)aspectRatio
{
  double v3;

  if (!-[PHAsset pixelHeight](self, "pixelHeight"))
    return 1.0;
  v3 = (double)-[PHAsset pixelWidth](self, "pixelWidth");
  return v3 / (double)-[PHAsset pixelHeight](self, "pixelHeight");
}

- (NSURL)ALAssetURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D71880];
  -[PHObject uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset filename](self, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetsLibraryURLWithUUID:extension:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (int64_t)originalImageOrientation
{
  void *v3;
  int64_t v4;

  -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 8);
  -[PHAsset originalMetadataProperties](self, "originalMetadataProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalExifOrientation");
  v4 = PLImageOrientationFromExifOrientation();

  return v4;
}

- (CGSize)originalImageSize
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 8);
  -[PHAsset originalMetadataProperties](self, "originalMetadataProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)objc_msgSend(v3, "originalWidth");
  -[PHAsset originalMetadataProperties](self, "originalMetadataProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)objc_msgSend(v5, "originalHeight");

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)unorientedSize
{
  double v3;
  double v4;
  CGSize result;

  -[PHAsset pixelWidth](self, "pixelWidth");
  -[PHAsset pixelHeight](self, "pixelHeight");
  PLOrientationInverse();
  PLOrientationTransformImageSize();
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)originalUnorientedSize
{
  double v3;
  double v4;
  CGSize result;

  if (-[PHAsset hasAdjustments](self, "hasAdjustments"))
  {
    -[PHAsset originalImageSize](self, "originalImageSize");
    -[PHAsset originalImageOrientation](self, "originalImageOrientation");
    PLExifOrientationFromImageOrientation();
    PLOrientationInverse();
    PLOrientationTransformImageSize();
  }
  else
  {
    -[PHAsset unorientedSize](self, "unorientedSize");
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)isOriginalSRGB
{
  void *v2;
  char v3;

  -[PHAsset originalColorSpace](self, "originalColorSpace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C9DA10]);

  return v3;
}

- (signed)kind
{
  unint64_t mediaType;
  char v3;

  mediaType = self->_mediaType;
  if (mediaType >= 4)
    v3 = 3;
  else
    v3 = 0x2000100000003uLL >> (16 * mediaType);
  return v3 & 3;
}

- (signed)kindSubtype
{
  return _assetSubtypeForMediaSubtypes(self->_mediaSubtypes);
}

- (CGSize)imageSize
{
  double pixelWidth;
  double pixelHeight;
  CGSize result;

  pixelWidth = (double)self->_pixelWidth;
  pixelHeight = (double)self->_pixelHeight;
  result.height = pixelHeight;
  result.width = pixelWidth;
  return result;
}

- (NSString)originalFilename
{
  void *v3;
  void *v4;

  if ((-[PHObject propertyHint](self, "propertyHint") & 0x800000) != 0)
  {
    -[PHAsset gridMetadataProperties](self, "gridMetadataProperties");
  }
  else
  {
    -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 8);
    -[PHAsset originalMetadataProperties](self, "originalMetadataProperties");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)title
{
  void *v3;
  void *v4;

  if ((-[PHObject propertyHint](self, "propertyHint") & 0x800000) != 0)
  {
    -[PHAsset gridMetadataProperties](self, "gridMetadataProperties");
  }
  else
  {
    -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 64);
    -[PHAsset descriptionProperties](self, "descriptionProperties");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)pathForOriginalFile
{
  void *v2;
  void *v3;

  -[PHAsset mainFileURL](self, "mainFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pathForAdjustmentFile
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (-[PHAsset isCloudSharedAsset](self, "isCloudSharedAsset"))
  {
    v3 = 0;
  }
  else
  {
    -[PHAsset pl_photoLibrary](self, "pl_photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isUBF"))
    {
      v6 = objc_alloc(MEMORY[0x1E0D73278]);
      -[PHObject uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PHAsset bundleScope](self, "bundleScope");
      objc_msgSend((id)*MEMORY[0x1E0CEC5A8], "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v6, "initWithAssetUuid:bundleScope:uti:resourceVersion:recipeID:", v7, v8, v9, 2, 0);

      objc_msgSend(v5, "readOnlyUrlWithIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
    }
    else
    {
      -[PHAsset directory](self, "directory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAsset filename](self, "filename");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetPathForMutationsDirectoryWithDirectory:filename:", v12, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D71880], "pathForAdjustmentDirectoryWithMutationsDirectory:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("Adjustments.plist"));
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)pathForAdjustmentDataFile
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (-[PHAsset isCloudSharedAsset](self, "isCloudSharedAsset"))
  {
    v3 = 0;
  }
  else
  {
    -[PHAsset pl_photoLibrary](self, "pl_photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isUBF"))
    {
      v6 = objc_alloc(MEMORY[0x1E0D73278]);
      -[PHObject uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PHAsset bundleScope](self, "bundleScope");
      objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v6, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:", v7, v8, v9, 2, 6);

      objc_msgSend(v5, "readOnlyUrlWithIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
    }
    else
    {
      -[PHAsset directory](self, "directory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAsset filename](self, "filename");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetPathForMutationsDirectoryWithDirectory:filename:", v12, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D71880], "pathForAdjustmentDirectoryWithMutationsDirectory:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("Adjustments.data"));
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)isInFlight
{
  return 0;
}

- (id)managedAssetForPhotoLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D71880];
  v5 = a3;
  -[PHObject objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetWithObjectID:inLibrary:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)generateLargeThumbnailFileIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[PHObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PHAsset_generateLargeThumbnailFileIfNecessary__block_invoke;
  v6[3] = &unk_1E35DF9E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:completionHandler:", v6, 0);

}

- (NSString)thumbnailIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0D71B80];
  -[PHObject uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset directory](self, "directory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset filename](self, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PHAsset bundleScope](self, "bundleScope");
  -[PHAsset pl_photoLibrary](self, "pl_photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailIdentifierWithAssetUUID:directory:filename:bundleScope:pathManager:", v4, v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)canUseLocationCoordinateForLocation
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_canUseLocationCoordinateForLocation);
  return v2 & 1;
}

- (void)setCanUseLocationCoordinateForLocation:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_canUseLocationCoordinateForLocation);
  -[PHAsset _invalidateCachedLocation](self, "_invalidateCachedLocation");
}

- (CLLocation)location
{
  return (CLLocation *)-[PLLazyObject objectValue](self->_lazyCachedLocation, "objectValue");
}

- (void)_invalidateCachedLocation
{
  -[PLLazyObject resetObject](self->_lazyCachedLocation, "resetObject");
}

- (id)_uncachedLocation
{
  NSData *locationData;
  void *v3;
  unsigned __int8 v4;
  CLLocationCoordinate2D *p_locationCoordinate;

  locationData = self->_locationData;
  if (locationData)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0D71880], "newLocationFromLocationData:timestampIfMissing:", locationData, self->_creationDate);
  }
  else
  {
    v4 = atomic_load((unsigned __int8 *)&self->_canUseLocationCoordinateForLocation);
    if ((v4 & 1) != 0
      && (p_locationCoordinate = &self->_locationCoordinate, CLLocationCoordinate2DIsValid(self->_locationCoordinate)))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", p_locationCoordinate->latitude, p_locationCoordinate->longitude);
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)cloudAssetGUID
{
  return self->_cloudAssetGUID;
}

- (PHAssetBurstSelectionType)burstSelectionTypes
{
  unsigned int v3;

  v3 = -[PHAsset avalanchePickType](self, "avalanchePickType");
  return (-[PHAsset avalanchePickType](self, "avalanchePickType") >> 2) & 2 | (v3 >> 2) & 1;
}

- (BOOL)representsBurst
{
  return (-[PHAsset avalanchePickType](self, "avalanchePickType") & 0x10) != 0
      && -[PHAsset isPartOfBurst](self, "isPartOfBurst");
}

- (BOOL)_isPartOfAvalancheWithKind:(unsigned __int16)a3
{
  int v3;
  int v5;

  v3 = a3;
  v5 = -[PHAsset avalanchePickType](self, "avalanchePickType");
  if (v5)
    LOBYTE(v5) = -[PHAsset avalancheKind](self, "avalancheKind") == v3;
  return v5;
}

- (BOOL)isPhotoIrisPlaceholder
{
  _BOOL8 v3;
  int64_t v4;
  _BOOL8 v5;

  v3 = -[PHAsset isPhotoIris](self, "isPhotoIris");
  v4 = -[PHAsset videoCpDurationValue](self, "videoCpDurationValue");
  v5 = -[PHAsset isCloudSharedAsset](self, "isCloudSharedAsset");
  return objc_msgSend(MEMORY[0x1E0D71880], "isPhotoIrisPlaceholderWithPhotoIris:videoCpDuration:isCloudShared:videoCpFilePath:", v3, v4, v5, 0);
}

- (BOOL)canPlayPhotoIris
{
  return -[PHAsset isMediaSubtype:](self, "isMediaSubtype:", 8);
}

- (BOOL)canPlayAutoloop
{
  return -[PHAsset playbackVariation](self, "playbackVariation") == 1;
}

- (BOOL)canPlayLongExposure
{
  return -[PHAsset playbackVariation](self, "playbackVariation") == 3;
}

- (BOOL)canPlayMirror
{
  return -[PHAsset playbackVariation](self, "playbackVariation") == 2;
}

- (BOOL)canPlayLoopingVideo
{
  return -[PHAsset playbackStyle](self, "playbackStyle") == 5;
}

- (BOOL)hasPhotoColorAdjustments
{
  _BOOL4 v3;

  v3 = -[PHAsset isPhotoIris](self, "isPhotoIris");
  if (v3)
    LOBYTE(v3) = -[PHAsset isMediaSubtype:](self, "isMediaSubtype:", 2);
  return v3;
}

- (NSString)adjustmentFormatIdentifier
{
  void *v3;
  void *v4;

  -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 0x2000);
  -[PHAsset adjustmentProperties](self, "adjustmentProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isHDRVideo
{
  return -[PHAsset mediaType](self, "mediaType") == PHAssetMediaTypeVideo
      && -[PHAsset isMediaSubtype:](self, "isMediaSubtype:", 0x100000);
}

- (BOOL)isHDR
{
  return -[PHAsset isMediaSubtype:](self, "isMediaSubtype:", 2)
      || -[PHAsset isMediaSubtype:](self, "isMediaSubtype:", 0x100000);
}

- (BOOL)isLoopingVideo
{
  return -[PHAsset playbackStyle](self, "playbackStyle") == 5;
}

- (BOOL)isPhoto
{
  return -[PHAsset mediaType](self, "mediaType") == PHAssetMediaTypeImage;
}

- (BOOL)isAudio
{
  return -[PHAsset mediaType](self, "mediaType") == PHAssetMediaTypeAudio;
}

- (BOOL)isPhotoStreamPhoto
{
  objc_msgSend(MEMORY[0x1E0D73310], "maskForPhotoStreamAsset");
  -[PHAsset savedAssetType](self, "savedAssetType");
  return PLValidatedSavedAssetTypeApplies();
}

- (BOOL)isCinematicVideo
{
  return -[PHAsset mediaType](self, "mediaType") == PHAssetMediaTypeVideo
      && -[PHAsset isMediaSubtype:](self, "isMediaSubtype:", 0x200000);
}

- (BOOL)isSpatialMedia
{
  void *v3;
  BOOL v4;

  -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 0x100000000);
  -[PHAsset spatialMediaProperties](self, "spatialMediaProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "spatialMediaType") != 0;

  return v4;
}

- (BOOL)isSpatialPresentation
{
  void *v3;
  BOOL v4;

  -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 16);
  -[PHAsset photosOneUpProperties](self, "photosOneUpProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "viewPresentation"))
    v4 = 0;
  else
    v4 = -[PHAsset isSpatialMedia](self, "isSpatialMedia");

  return v4;
}

- (PHAssetPhotosSmartStyleExtendedProperties)fetchSmartStyleExtendedProperties
{
  -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 0x8000000000);
  return (PHAssetPhotosSmartStyleExtendedProperties *)-[PHAsset photosSmartStyleExtendedProperties](self, "photosSmartStyleExtendedProperties");
}

- (BOOL)hasPhotoStreamTagID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PHAsset pl_managedAsset](self, "pl_managedAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoStreamTagId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "length") != 0;
  else
    v6 = 0;

  return v6;
}

- (BOOL)isMomentSharedAsset
{
  objc_msgSend(MEMORY[0x1E0D73310], "maskForMomentSharedAsset");
  -[PHAsset savedAssetType](self, "savedAssetType");
  return PLValidatedSavedAssetTypeApplies();
}

- (BOOL)isReferencedAsset
{
  objc_msgSend(MEMORY[0x1E0D73310], "maskForReferencedAsset");
  -[PHAsset savedAssetType](self, "savedAssetType");
  return PLValidatedSavedAssetTypeApplies();
}

- (BOOL)isRecoveredAsset
{
  objc_msgSend(MEMORY[0x1E0D73310], "maskForRecoveredAlbum");
  -[PHAsset savedAssetType](self, "savedAssetType");
  return PLValidatedSavedAssetTypeApplies();
}

- (BOOL)isSyndicatedAssetSavedToUserLibrary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;

  -[PHAsset curationProperties](self, "curationProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syndicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PHObject photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "wellKnownPhotoLibraryIdentifier");

    if (v6 == 3)
    {
      return (-[PHAsset syndicationState](self, "syndicationState") >> 1) & 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D73310], "maskForUserLibrary");
      -[PHAsset savedAssetType](self, "savedAssetType");
      LOBYTE(v7) = PLValidatedSavedAssetTypeApplies();
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)isOffline
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  if (!-[PHAsset isReferencedAsset](self, "isReferencedAsset"))
    return 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  -[PHAsset mainFileURL](self, "mainFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset pl_photoLibrary](self, "pl_photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __20__PHAsset_isOffline__block_invoke;
  v9[3] = &unk_1E35DEE50;
  v5 = v3;
  v10 = v5;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  v7 = *((_BYTE *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (int64_t)cloudSharedAssetPlaceholderKind
{
  if (-[PHAsset isCloudSharedAsset](self, "isCloudSharedAsset"))
    return -[PHAsset cloudPlaceholderKind](self, "cloudPlaceholderKind");
  else
    return 0;
}

- (BOOL)isCloudPhotoLibraryAsset
{
  objc_msgSend(MEMORY[0x1E0D73310], "maskForCloudPhotoLibraryAsset");
  -[PHAsset savedAssetType](self, "savedAssetType");
  return PLValidatedSavedAssetTypeApplies();
}

- (NSString)cloudIdentifier
{
  NSString *cloudAssetGUID;
  void *v3;
  void *v4;
  void *v5;

  cloudAssetGUID = self->_cloudAssetGUID;
  if (cloudAssetGUID)
  {
    -[NSString stringByAppendingString:](cloudAssetGUID, "stringByAppendingString:", CFSTR("/G0/"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "identifierCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)isStreamedVideo
{
  _BOOL4 v3;

  v3 = -[PHAsset isVideo](self, "isVideo");
  if (v3)
    LOBYTE(v3) = -[PHAsset isMediaSubtype:](self, "isMediaSubtype:", 0x10000);
  return v3;
}

- (BOOL)isHighFrameRateVideo
{
  _BOOL4 v3;

  v3 = -[PHAsset isVideo](self, "isVideo");
  if (v3)
    LOBYTE(v3) = -[PHAsset isMediaSubtype:](self, "isMediaSubtype:", 0x20000);
  return v3;
}

- (BOOL)isIncludedInMoments
{
  return -[PHAsset sourceType](self, "sourceType") != 2;
}

- (BOOL)isIncludedInCloudFeeds
{
  return -[PHAsset sourceType](self, "sourceType") == 2;
}

- (BOOL)isTimelapsePlaceholder
{
  double v3;
  void *v4;
  void *v5;
  int v6;

  if (-[PHAsset isMediaSubtype:](self, "isMediaSubtype:", 0x40000)
    && (-[PHAsset duration](self, "duration"), v3 == 0.0))
  {
    -[PHAsset pathForOriginalFile](self, "pathForOriginalFile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isDeleted
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHAsset;
  return -[PHObject isDeleted](&v4, sel_isDeleted) || self->_trashed;
}

- (void)getMasterFingerPrintWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__19039;
  v12[4] = __Block_byref_object_dispose__19040;
  v13 = 0;
  -[PHAsset pl_photoLibrary](self, "pl_photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PHAsset_getMasterFingerPrintWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E35D9F30;
  v8[4] = self;
  v6 = v5;
  v9 = v6;
  v11 = v12;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "performBlock:", v8);

  _Block_object_dispose(v12, 8);
}

- (void)getFingerPrintForAssetType:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  int64_t v14;

  v6 = a4;
  -[PHObject photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCloudPhotoLibraryEnabled");

  if ((v8 & 1) != 0)
  {
    -[PHAsset pl_photoLibrary](self, "pl_photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PHAsset_getFingerPrintForAssetType_withCompletionHandler___block_invoke;
    v11[3] = &unk_1E35DF638;
    v11[4] = self;
    v12 = v9;
    v14 = a3;
    v13 = v6;
    v10 = v9;
    objc_msgSend(v10, "performBlock:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.pkphotosctl"), 200, &unk_1E36578B0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
      (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v10);
  }

}

- (BOOL)hasContentEqualTo:(id)a3
{
  return -[PHAsset contentChangeFromAsset:](self, "contentChangeFromAsset:", a3) == 0;
}

- (unint64_t)contentChangeFromAsset:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  PHAssetPlaybackStyle v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  int64_t v28;
  int v29;
  int v30;
  uint64_t v32;
  unint64_t v33;

  v4 = a3;
  v5 = !v4 || !-[PHObject isEqual:](self, "isEqual:", v4);
  objc_msgSend(v4, "adjustmentTimestamp");
  v6 = objc_claimAutoreleasedReturnValue();
  -[PHAsset adjustmentTimestamp](self, "adjustmentTimestamp");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7 | v6)
  {
    if (!v6 || !v7 || (objc_msgSend((id)v6, "timeIntervalSinceDate:", v7), fabs(v9) > 2.22044605e-16))
      v5 |= 0x10uLL;
  }
  v10 = objc_msgSend(v4, "thumbnailIndex");
  if (v10 == -[PHAsset thumbnailIndex](self, "thumbnailIndex"))
    v11 = v5;
  else
    v11 = v5 | 1;
  objc_msgSend(v4, "duration");
  v13 = v12;
  -[PHAsset duration](self, "duration");
  if (v13 == v14)
    v15 = v11;
  else
    v15 = v5 | 1;
  v16 = objc_msgSend(v4, "canPlayPhotoIris");
  if (v16 != -[PHAsset canPlayPhotoIris](self, "canPlayPhotoIris"))
    v15 |= 4uLL;
  v17 = -[PHAsset deferredProcessingNeeded](self, "deferredProcessingNeeded");
  v18 = objc_msgSend(v4, "deferredProcessingNeeded");
  v19 = v15 | 2;
  if (v18 == 11)
    v19 = v15;
  if ((v18 - 4) >= 6)
    v20 = v19;
  else
    v20 = v15;
  if (!v18)
    v20 = v15;
  if (!v17)
    v15 = v20;
  v21 = -[PHAsset videoDeferredProcessingNeeded](self, "videoDeferredProcessingNeeded");
  if (objc_msgSend(v4, "videoDeferredProcessingNeeded") == 1 && v21 == 0)
    v15 |= 8uLL;
  v23 = -[PHAsset playbackStyle](self, "playbackStyle");
  if (v23 == objc_msgSend(v4, "playbackStyle"))
    v24 = v15;
  else
    v24 = v15 | 0x20;
  v25 = -[PHAsset burstSelectionTypes](self, "burstSelectionTypes");
  v26 = ((unint64_t)(objc_msgSend(v4, "burstSelectionTypes") ^ v25) >> 1) & 1;
  v27 = objc_msgSend(v4, "RAWBadgeAttributes");
  v28 = -[PHAsset RAWBadgeAttributes](self, "RAWBadgeAttributes");
  v29 = objc_msgSend(v4, "syndicationState");
  v30 = -[PHAsset syndicationState](self, "syndicationState");
  if (v27 == v28 && v29 == v30)
    v32 = v26;
  else
    v32 = 1;
  v33 = v32 | v24;

  return v33;
}

- (BOOL)isIncompleteLivePhotoMissingVideoComplement
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[PHAsset isPhotoIris](self, "isPhotoIris"))
    return 0;
  +[PHAssetResource assetResourcesForAsset:includeDerivatives:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:", self, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_560);
  v5 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      -[PHObject uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_FAULT, "Live photo asset %{public}@ is missing its video complement", (uint8_t *)&v9, 0xCu);

    }
  }

  return v5;
}

- (BOOL)isWalrusEnabled
{
  void *v2;
  char v3;

  -[PHObject photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWalrusEnabled");

  return v3;
}

- (BOOL)isLocalVideoKeyFrameValid
{
  if (-[PHAsset hasAdjustments](self, "hasAdjustments") || -[PHAsset bundleScope](self, "bundleScope") == 3)
    return 0;
  objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset");
  -[PHAsset savedAssetType](self, "savedAssetType");
  return PLValidatedSavedAssetTypeApplies() ^ 1;
}

- (BOOL)hasKeywords
{
  return self->_packedBadgeAttributes & 1;
}

- (BOOL)isProRes
{
  return (LOBYTE(self->_packedBadgeAttributes) >> 3) & 1;
}

- (BOOL)hasEditableDepth
{
  return (LOBYTE(self->_packedBadgeAttributes) >> 4) & 1;
}

- (BOOL)is60PlusFPS
{
  return (LOBYTE(self->_packedBadgeAttributes) >> 5) & 1;
}

- (BOOL)hasSpatialAudio
{
  return (LOBYTE(self->_packedBadgeAttributes) >> 6) & 1;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  void *v3;
  char v4;

  -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 0x4000000000);
  -[PHAsset StoryPlaybackProperties](self, "StoryPlaybackProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPeopleSceneMidOrGreaterConfidence");

  return v4;
}

- (BOOL)canPerformEditOperation:(PHAssetEditOperation)editOperation
{
  char v4;
  char v5;
  void *v7;
  uint64_t v8;
  char v9;
  char v10;
  int v12;
  char v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  PHAssetEditOperation v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  PHAssetEditOperation v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  PHAssetEditOperation v37;
  _QWORD v38[7];
  _QWORD aBlock[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;

  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  if (editOperation != 100)
  {
    -[PHObject photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "wellKnownPhotoLibraryIdentifier");

    if (v8 == 3)
    {
      v5 = editOperation == PHAssetEditOperationDelete;
      goto LABEL_10;
    }
    if (editOperation == 102)
    {
      objc_msgSend(MEMORY[0x1E0D73310], "maskForAssetsEligibleForCloudKitTransportWithoutMomentSharesAndPlaceholders");
      -[PHAsset savedAssetType](self, "savedAssetType");
      v14 = PLValidatedSavedAssetTypeApplies();
      *((_BYTE *)v41 + 24) = v14;
      if (!v14)
        goto LABEL_11;
      -[PHObject fetchPropertySetsIfNeeded](self, "fetchPropertySetsIfNeeded");
      if (!-[PHAsset participatesInLibraryScope](self, "participatesInLibraryScope"))
      {
        v9 = objc_msgSend((id)objc_opt_class(), "_isLibraryScopeExiting:", self);
        goto LABEL_9;
      }
    }
    else
    {
      if (editOperation != 103)
      {
        v15 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __35__PHAsset_canPerformEditOperation___block_invoke;
        aBlock[3] = &unk_1E35D9F78;
        aBlock[4] = self;
        v16 = _Block_copy(aBlock);
        v38[0] = v15;
        v38[1] = 3221225472;
        v38[2] = __35__PHAsset_canPerformEditOperation___block_invoke_2;
        v38[3] = &unk_1E35DE840;
        v38[4] = self;
        v38[5] = &v40;
        v38[6] = editOperation;
        v17 = _Block_copy(v38);
        v34[0] = v15;
        v34[1] = 3221225472;
        v34[2] = __35__PHAsset_canPerformEditOperation___block_invoke_3;
        v34[3] = &unk_1E35D9FA0;
        v36 = &v40;
        v37 = editOperation;
        v18 = v16;
        v35 = v18;
        v19 = _Block_copy(v34);
        v30[0] = v15;
        v30[1] = 3221225472;
        v30[2] = __35__PHAsset_canPerformEditOperation___block_invoke_4;
        v30[3] = &unk_1E35D9FA0;
        v32 = &v40;
        v33 = editOperation;
        v20 = v18;
        v31 = v20;
        v21 = _Block_copy(v30);
        v26[0] = v15;
        v26[1] = 3221225472;
        v26[2] = __35__PHAsset_canPerformEditOperation___block_invoke_5;
        v26[3] = &unk_1E35D9FA0;
        v28 = &v40;
        v29 = editOperation;
        v22 = v20;
        v27 = v22;
        v23 = _Block_copy(v26);
        v25[0] = v15;
        v25[1] = 3221225472;
        v25[2] = __35__PHAsset_canPerformEditOperation___block_invoke_6;
        v25[3] = &unk_1E35DB860;
        v25[4] = &v40;
        v24 = _Block_copy(v25);
        objc_msgSend(MEMORY[0x1E0D73310], "executeBlockForSavedAssetType:unknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:unrecognized:", -[PHAsset savedAssetType](self, "savedAssetType"), v19, v19, v21, v19, v17, v19, v19, v24, v24, v24, v19, v19, v21, v19,
          v23,
          v24,
          v24);

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0D73310], "maskForAssetsEligibleForCloudKitTransportWithoutMomentSharesAndPlaceholders");
      -[PHAsset savedAssetType](self, "savedAssetType");
      v12 = PLValidatedSavedAssetTypeApplies();
      *((_BYTE *)v41 + 24) = v12;
      if (!v12)
        goto LABEL_11;
      -[PHObject fetchPropertySetsIfNeeded](self, "fetchPropertySetsIfNeeded");
      if (-[PHAsset participatesInLibraryScope](self, "participatesInLibraryScope"))
      {
        if ((objc_msgSend((id)objc_opt_class(), "_isLibraryScopeExiting:", self) & 1) != 0)
          v13 = 0;
        else
          v13 = objc_msgSend((id)objc_opt_class(), "_libraryScopeAssetContributedByCurrentUser:", self);
        *((_BYTE *)v41 + 24) = v13;
        goto LABEL_11;
      }
    }
    *((_BYTE *)v41 + 24) = 0;
    goto LABEL_11;
  }
  if (-[PHAsset isPhotoIris](self, "isPhotoIris"))
  {
    v4 = objc_msgSend((id)objc_opt_class(), "isOriginalKnownUnsupportedFormatForAsset:failureInfo:", self, 0);
    v5 = (v4 | objc_msgSend((id)objc_opt_class(), "isOriginalVideoComplementKnownUnsupportedFormatForAsset:failureInfo:", self, 0)) ^ 1;
LABEL_10:
    *((_BYTE *)v41 + 24) = v5;
    goto LABEL_11;
  }
  if (-[PHAsset isPhoto](self, "isPhoto") || -[PHAsset isVideo](self, "isVideo"))
  {
    v9 = objc_msgSend((id)objc_opt_class(), "isOriginalKnownUnsupportedFormatForAsset:failureInfo:", self, 0);
LABEL_9:
    v5 = v9 ^ 1;
    goto LABEL_10;
  }
LABEL_11:
  v10 = *((_BYTE *)v41 + 24);
  _Block_object_dispose(&v40, 8);
  return v10;
}

- (BOOL)canPerformSharingAction
{
  _BOOL4 v3;

  v3 = -[PHAsset complete](self, "complete");
  if (v3)
  {
    if (-[PHAsset isTimelapsePlaceholder](self, "isTimelapsePlaceholder"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[PHAsset isPhotoIrisPlaceholder](self, "isPhotoIrisPlaceholder");
  }
  return v3;
}

- (id)mainFileURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;

  -[PHAsset directory](self, "directory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PHAsset pl_photoLibrary](self, "pl_photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHAsset filename](self, "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetMainFilePathWithDirectory:filename:bundleScope:", v3, v6, -[PHAsset bundleScope](self, "bundleScope"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isUBF"))
    {
      if (-[PHAsset isStreamedVideo](self, "isStreamedVideo"))
      {
        objc_msgSend(v7, "pathExtension");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("medium.MP4"));

        if ((v9 & 1) == 0)
        {
          objc_msgSend(v7, "stringByDeletingPathExtension");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("medium.MP4"));
          v11 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v11;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)fileURLsForDiagnosticFiles
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  if (-[PHAsset isCloudSharedAsset](self, "isCloudSharedAsset"))
    return 0;
  v4 = (void *)objc_opt_new();
  -[PHAsset mainFileURL](self, "mainFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D71880];
  -[PHObject photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v9, v6, 0);
  v10 = objc_claimAutoreleasedReturnValue();

  v104 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v4;
  objc_msgSend(v4, "addObject:", v11);

  if (MEMORY[0x19AEBDEDC]())
  {
    -[PHAsset pl_managedAsset](self, "pl_managedAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathForSpatialOverCaptureDiagnosticFile");
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v14);

    }
    -[PHAsset pl_managedAsset](self, "pl_managedAsset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pathForReframeDiagnosticFile");
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v17);

    }
    v101 = (void *)v16;
    v18 = (void *)MEMORY[0x1E0D71880];
    -[PHObject photoLibrary](self, "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingPathComponent:", CFSTR("ReframeEvaluation"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v20, v22, 0);
    v23 = objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v23, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "addObject:", v24);

    }
    v25 = (void *)MEMORY[0x1E0D71880];
    -[PHObject photoLibrary](self, "photoLibrary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "photoLibrary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByAppendingPathComponent:", CFSTR("EditPerspectiveEvaluation-txt"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v27, v29, 0);
    v30 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v30;
    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v30, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "addObject:", v32);

    }
    v99 = v31;
    v33 = (void *)MEMORY[0x1E0D71880];
    -[PHObject photoLibrary](self, "photoLibrary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "photoLibrary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringByAppendingPathComponent:", CFSTR("EditPerspectiveLineDetection-png"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v35, v37, 0);
    v38 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v38;
    if (v38)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v38, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "addObject:", v40);

    }
    v98 = v39;
    v100 = (void *)v23;
    v41 = (void *)MEMORY[0x1E0D71880];
    -[PHObject photoLibrary](self, "photoLibrary");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "photoLibrary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringByAppendingPathComponent:", CFSTR("CapturePerspectiveEvaluation-txt"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v43, v45, 0);
    v46 = objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v46, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "addObject:", v47);

    }
    v97 = (void *)v46;
    v48 = (void *)MEMORY[0x1E0D71880];
    -[PHObject photoLibrary](self, "photoLibrary");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "photoLibrary");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "stringByAppendingPathComponent:", CFSTR("CapturePerspectiveLineDetection-png"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v50, v52, 0);
    v53 = objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v53, 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "addObject:", v54);

    }
    v96 = (void *)v53;
    v103 = (void *)v13;
    v55 = (void *)MEMORY[0x1E0D71880];
    -[PHObject photoLibrary](self, "photoLibrary");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "photoLibrary");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "stringByAppendingPathComponent:", CFSTR("CaptureAutoCropEvaluation-txt"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v57, v59, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v60, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "addObject:", v61);

    }
    v62 = (void *)MEMORY[0x1E0D71880];
    -[PHObject photoLibrary](self, "photoLibrary");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "photoLibrary");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v6;
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "stringByAppendingPathComponent:", CFSTR("ReframeSubjects"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v64, v67, 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v68, 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "addObject:", v69);

    }
    v70 = (void *)MEMORY[0x1E0D71880];
    -[PHObject photoLibrary](self, "photoLibrary");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "photoLibrary");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "stringByDeletingPathExtension");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "stringByAppendingPathComponent:", CFSTR("ReframeRects"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v72, v74, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v75)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v75, 0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "addObject:", v76);

    }
    -[PHAsset pl_managedAsset](self, "pl_managedAsset");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "pathForCameraMetadataDiagnosticFile");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (v78)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v78, 0);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "addObject:", v79);

    }
    -[PHAsset pl_managedAsset](self, "pl_managedAsset");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "pathForCameraSpatialOverCaptureMetadataDiagnosticFile");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v65;
    if (v81)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v81, 0);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "addObject:", v82);

    }
  }
  if (MEMORY[0x19AEBDEDC]())
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHObject uuid](self, "uuid");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v83;
    objc_msgSend(v83, "contentsOfDirectoryAtPath:error:", CFSTR("/var/mobile/Media/DCIM/"), 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
    if (v86)
    {
      v87 = v86;
      v88 = *(_QWORD *)v107;
      do
      {
        for (i = 0; i != v87; ++i)
        {
          if (*(_QWORD *)v107 != v88)
            objc_enumerationMutation(v85);
          v90 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
          if (objc_msgSend(v90, "containsString:", v84))
          {
            objc_msgSend(CFSTR("/var/mobile/Media/DCIM/"), "stringByAppendingPathComponent:", v90);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "stringByAppendingPathComponent:", CFSTR("Misc"));
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "stringByAppendingPathComponent:", CFSTR("CVSInput"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "stringByAppendingPathComponent:", CFSTR("dump.MOV"));
            v94 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v94, 0);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "addObject:", v95);

          }
        }
        v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v106, v110, 16);
      }
      while (v87);
    }

  }
  return v105;
}

- (id)fileURLForFullsizeRenderImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (-[PHAsset isCloudSharedAsset](self, "isCloudSharedAsset"))
  {
    v3 = 0;
  }
  else
  {
    -[PHAsset pl_photoLibrary](self, "pl_photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "shouldUseFileIdentifierForBundleScope:", -[PHAsset bundleScope](self, "bundleScope")))
    {
      v6 = objc_alloc(MEMORY[0x1E0D73278]);
      -[PHObject uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PHAsset bundleScope](self, "bundleScope");
      objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v6, "initWithAssetUuid:bundleScope:uti:resourceVersion:recipeID:", v7, v8, v9, 2, 65938);

      objc_msgSend(v5, "readOnlyUrlWithIdentifier:", v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PHAsset directory](self, "directory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAsset filename](self, "filename");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetPathForMutationsDirectoryWithDirectory:filename:", v11, v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D71880], "pathForAdjustmentDirectoryWithMutationsDirectory:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("FullSizeRender.jpg"), 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (id)fileURLForVideoComplementFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[PHAsset pl_photoLibrary](self, "pl_photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "shouldUseFileIdentifierForBundleScope:", -[PHAsset bundleScope](self, "bundleScope"))&& !-[PHAsset isCloudSharedAsset](self, "isCloudSharedAsset"))
  {
    v8 = objc_alloc(MEMORY[0x1E0D73278]);
    -[PHObject uuid](self, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PHAsset bundleScope](self, "bundleScope");
    objc_msgSend((id)*MEMORY[0x1E0CEC5B0], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v8, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:", v9, v10, v11, 0, 3);

    objc_msgSend(v4, "readOnlyUrlWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PHAsset mainFileURL](self, "mainFileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByDeletingPathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("MOV"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSString)description
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  PHAssetBurstSelectionType v7;
  _BOOL4 v8;
  const __CFString *v9;
  PHAssetSourceType v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  void *v14;
  void *v15;
  PHAssetMediaSubtype v17;
  PHAssetMediaType v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PHAsset;
  -[PHObject description](&v20, sel_description);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset burstIdentifier](self, "burstIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = &stru_1E35DFFF8;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[PHAsset burstIdentifier](self, "burstIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHAsset burstSelectionTypes](self, "burstSelectionTypes");
    v8 = -[PHAsset representsBurst](self, "representsBurst");
    v9 = CFSTR("(*)");
    if (!v8)
      v9 = &stru_1E35DFFF8;
    objc_msgSend(v5, "stringWithFormat:", CFSTR(" burst=%@/%lu%@"), v6, v7, v9);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v18 = -[PHAsset mediaType](self, "mediaType");
  v17 = -[PHAsset mediaSubtypes](self, "mediaSubtypes");
  v10 = -[PHAsset sourceType](self, "sourceType");
  v11 = -[PHAsset pixelWidth](self, "pixelWidth");
  v12 = -[PHAsset pixelHeight](self, "pixelHeight");
  -[PHAsset creationDate](self, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset location](self, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByAppendingFormat:", CFSTR(" mediaType=%ld/%ld, sourceType=%ld, (%lux%lu), creationDate=%@, location=%d, hidden=%d, favorite=%d, adjusted=%d %@"), v18, v17, v10, v11, v12, v13, v14 != 0, -[PHAsset isHidden](self, "isHidden"), -[PHAsset isFavorite](self, "isFavorite"), -[PHAsset hasAdjustments](self, "hasAdjustments"), v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (id)__dictionaryWithContentsOfData:(id)a3
{
  void *v3;

  v3 = (void *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDataRef)a3, 0, 0, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v3)
  {
    CFRelease(v3);
    v3 = 0;
  }
  return v3;
}

- (id)gatingDebugMetadata
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (!MEMORY[0x19AEBDEDC](self, a2))
    goto LABEL_6;
  -[PHAsset pl_managedAsset](self, "pl_managedAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForReframeDiagnosticFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v4), (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)evaluationDebugMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;

  if (MEMORY[0x19AEBDEDC](self, a2))
  {
    v3 = (void *)objc_opt_new();
    -[PHAsset mainFileURL](self, "mainFileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0D71880];
    -[PHObject photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByDeletingPathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("ReframeEvaluation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v8, v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ReframeEvaluation"));

    }
    v13 = (void *)MEMORY[0x1E0D71880];
    -[PHObject photoLibrary](self, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByDeletingPathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("ReframeSubjects"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v15, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("ReframeSubjects"));

    }
    v35 = (void *)v11;
    v20 = (void *)MEMORY[0x1E0D71880];
    -[PHObject photoLibrary](self, "photoLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "photoLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByDeletingPathExtension");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingPathComponent:", CFSTR("CapturePerspectiveEvaluation-txt"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v22, v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("CapturePerspectiveEvaluation-txt"));

    }
    v27 = (void *)MEMORY[0x1E0D71880];
    -[PHObject photoLibrary](self, "photoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "photoLibrary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByDeletingPathExtension");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringByAppendingPathComponent:", CFSTR("CaptureAutoCropEvaluation-txt"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v29, v31, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("CaptureAutoCropEvaluation-txt"));

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)adjustmentsDebugMetadata
{
  NSObject *v3;
  PHImageRequestOptions *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[5];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__19039;
  v21 = __Block_byref_object_dispose__19040;
  v22 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = objc_alloc_init(PHImageRequestOptions);
  -[PHImageRequestOptions setVersion:](v4, "setVersion:", 16);
  -[PHImageRequestOptions setSynchronous:](v4, "setSynchronous:", 1);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__PHAsset_adjustmentsDebugMetadata__block_invoke;
  aBlock[3] = &unk_1E35DA118;
  aBlock[4] = self;
  v16 = &v17;
  v6 = v3;
  v15 = v6;
  v7 = _Block_copy(aBlock);
  +[PHImageManager defaultManager](PHImageManager, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __35__PHAsset_adjustmentsDebugMetadata__block_invoke_2;
  v12[3] = &unk_1E35DB5C0;
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", self, 0, v4, v12, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (id)wallpaperCroppingDebugKeyValuePairs
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  void *v139;
  double v140;
  void *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  double v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  void *v150;
  double v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  double v162;
  double v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  double v168;
  void *v169;
  double v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  double v179;
  void *v180;
  double v181;
  void *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  _QWORD v192[34];
  _QWORD v193[36];

  v193[34] = *MEMORY[0x1E0C80C00];
  PFDeviceScreenSize();
  v4 = v3;
  v6 = v5;
  PFSizeWithAspectRatioFittingSize();
  v8 = v7;
  v10 = v9;
  PFSizeWithAspectRatioFittingSize();
  v179 = v12;
  v181 = v11;
  v116 = (double)-[PHAsset pixelWidth](self, "pixelWidth");
  v115 = (double)-[PHAsset pixelHeight](self, "pixelHeight");
  v191 = 0;
  v190 = 0;
  v189 = 0;
  v14 = *MEMORY[0x1E0C9D628];
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v191, v4, v6, *MEMORY[0x1E0C9D628], v13, v15, v16);
  v164 = v18;
  v166 = v17;
  v162 = v20;
  v163 = v19;
  PFDeviceLockScreenFocusAreaRectNormalized();
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v190, v4, v6, v21, v22, v23, v24);
  v160 = v25;
  v156 = v26;
  v151 = v27;
  v146 = v28;
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v189, v6, v4, v14, v13, v15, v16);
  v158 = v29;
  v152 = v31;
  v154 = v30;
  v147 = v32;
  v188 = 0;
  v187 = 0;
  v186 = 0;
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v188, v8, v10, v14, v13, v15, v16);
  v149 = v33;
  v142 = v35;
  v144 = v34;
  v138 = v36;
  PFDeviceLockScreenFocusAreaRectNormalized();
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v187, v8, v10, v37, v38, v39, v40);
  v136 = v41;
  v134 = v42;
  v132 = v43;
  v130 = v44;
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v186, v10, v8, v14, v13, v15, v16);
  v135 = v45;
  v133 = v46;
  v131 = v47;
  v128 = v48;
  v185 = 0;
  v183 = 0;
  v184 = 0;
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v185, v181, v179, v14, v13, v15, v16);
  v129 = v49;
  v126 = v51;
  v127 = v50;
  v125 = v52;
  PFDeviceLockScreenFocusAreaRectNormalized();
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v184, v181, v179, v53, v54, v55, v56);
  v124 = v57;
  v122 = v58;
  v120 = v59;
  v118 = v60;
  -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v183, v179, v181, v14, v13, v15, v16);
  v123 = v61;
  v121 = v62;
  v119 = v63;
  v117 = v64;
  v65 = (void *)MEMORY[0x1E0CB3940];
  -[PHAsset faceAreaMinX](self, "faceAreaMinX");
  v67 = v66;
  -[PHAsset faceAreaMaxX](self, "faceAreaMaxX");
  v69 = v68;
  -[PHAsset faceAreaMinY](self, "faceAreaMinY");
  v71 = v70;
  -[PHAsset faceAreaMaxY](self, "faceAreaMaxY");
  objc_msgSend(v65, "stringWithFormat:", CFSTR("(minX: %.2f, maxX: %.2f, minY: %.2f, maxY: %.2f)"), v67, v69, v71, v72);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset acceptableCropRect](self, "acceptableCropRect");
  v168 = v75 * v116 + 0.0;
  v140 = (1.0 - (v73 + v74)) * v115 + 0.0;
  v113 = v74 * v115;
  v114 = v76 * v116;
  -[PHAsset preferredCropRect](self, "preferredCropRect");
  v170 = v79 * v116 + 0.0;
  v111 = v80 * v116;
  v112 = (1.0 - (v77 + v78)) * v115 + 0.0;
  v110 = v78 * v115;
  -[PHAsset faceAreaMinX](self, "faceAreaMinX");
  v82 = v81;
  -[PHAsset faceAreaMinY](self, "faceAreaMinY");
  v84 = v83;
  -[PHAsset faceAreaMaxX](self, "faceAreaMaxX");
  v86 = v85;
  -[PHAsset faceAreaMaxY](self, "faceAreaMaxY");
  v87 = v86 - v82;
  v89 = v88 - v84;
  v90 = 1.0 - (v84 + v88 - v84);
  v192[0] = CFSTR("uuid");
  -[PHObject uuid](self, "uuid");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v193[0] = v182;
  v192[1] = CFSTR("width");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHAsset pixelWidth](self, "pixelWidth"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v193[1] = v180;
  v192[2] = CFSTR("height");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHAsset pixelHeight](self, "pixelHeight"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v193[2] = v178;
  v192[3] = CFSTR("screenWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v193[3] = v177;
  v192[4] = CFSTR("screenHeight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v193[4] = v176;
  v192[5] = CFSTR("preferredCrop");
  -[PHAsset preferredCropRect](self, "preferredCropRect");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), v91, v92, v93, v94);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v193[5] = v175;
  v192[6] = CFSTR("acceptableCrop");
  -[PHAsset acceptableCropRect](self, "acceptableCropRect");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), v95, v96, v97, v98);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v193[6] = v173;
  v193[7] = v174;
  v192[7] = CFSTR("faceAreaEdges");
  v192[8] = CFSTR("faceAreaRect");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), *(_QWORD *)&v82, *(_QWORD *)&v90, *(_QWORD *)&v87, *(_QWORD *)&v89);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v193[8] = v172;
  v192[9] = CFSTR("preferredCropPixels");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), *(_QWORD *)&v170, *(_QWORD *)&v112, *(_QWORD *)&v111, *(_QWORD *)&v110);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v193[9] = v171;
  v192[10] = CFSTR("acceptableCropPixels");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), *(_QWORD *)&v168, *(_QWORD *)&v140, *(_QWORD *)&v114, *(_QWORD *)&v113);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v193[10] = v169;
  v192[11] = CFSTR("faceAreaPixels");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), v82 * v116 + 0.0, v90 * v115 + 0.0, v87 * v116, v89 * v115);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v193[11] = v141;
  v192[12] = CFSTR("suggestedCrop");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), v166, v164, *(_QWORD *)&v163, *(_QWORD *)&v162);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v193[12] = v167;
  v192[13] = CFSTR("suggestedCropWithFocusArea");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), v160, v156, *(_QWORD *)&v151, *(_QWORD *)&v146);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v193[13] = v165;
  v192[14] = CFSTR("suggestedCropWithScreenTranspose");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), v158, v154, v152, v147);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v193[14] = v161;
  v192[15] = CFSTR("estimatedSuggestedCropPad");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), v149, v144, v142, v138);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v193[15] = v159;
  v192[16] = CFSTR("estimatedSuggestedCropPadWithFocusArea");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), v136, v134, v132, v130);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v193[16] = v157;
  v192[17] = CFSTR("estimatedSuggestedCropPadWithScreenTranspose");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), v135, v133, v131, v128);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v193[17] = v155;
  v192[18] = CFSTR("estimatedSuggestedCropPhone");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), v129, v127, v126, v125);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v193[18] = v153;
  v192[19] = CFSTR("estimatedSuggestedCropPhoneWithFocusArea");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), v124, v122, v120, v118);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v193[19] = v150;
  v192[20] = CFSTR("estimatedSuggestedCropPhoneWithScreenTranspose");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.3f, y:%.3f}, {width:%.3f, height:%.3f}}"), v123, v121, v119, v117);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v193[20] = v148;
  v192[21] = CFSTR("cropQualityScore");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v191);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v193[21] = v145;
  v192[22] = CFSTR("cropQualityScoreWithFocusArea");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v190);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v193[22] = v143;
  v192[23] = CFSTR("cropQualityScoreWithScreenTranspose");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v189);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v193[23] = v139;
  v192[24] = CFSTR("estimatedCropQualityScorePad");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v188);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v193[24] = v137;
  v192[25] = CFSTR("estimatedCropQualityScorePadWithFocusArea");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v187);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v193[25] = v99;
  v192[26] = CFSTR("estimatedCropQualityScorePadWithScreenTranspose");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v186);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v193[26] = v100;
  v192[27] = CFSTR("estimatedCropQualityScorePhone");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v185);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v193[27] = v101;
  v192[28] = CFSTR("estimatedCropQualityScorePhoneWithFocusArea");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v184);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v193[28] = v102;
  v192[29] = CFSTR("estimatedCropQualityScorePhoneWithScreenTranspose");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v183);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v193[29] = v103;
  v192[30] = CFSTR("imageAspectRatio");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v116 / v115);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v193[30] = v104;
  v192[31] = CFSTR("screenAspectRatio");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v4 / v6);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v193[31] = v105;
  v192[32] = CFSTR("cropAspectRatio");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v163 / v162);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v193[32] = v106;
  v192[33] = CFSTR("cropAspectRatioWithFocusArea");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v151 / v146);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v193[33] = v107;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, v192, 34);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  return v108;
}

- (id)detailedDebugDescriptionInLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  void *v29;
  __CFString *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  _QWORD *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  _QWORD v85[5];
  id v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAsset.m"), 4337, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  -[PHAsset description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v105 = 0;
  v106 = &v105;
  v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__19039;
  v109 = __Block_byref_object_dispose__19040;
  v110 = 0;
  v99 = 0;
  v100 = &v99;
  v101 = 0x3032000000;
  v102 = __Block_byref_object_copy__19039;
  v103 = __Block_byref_object_dispose__19040;
  v104 = 0;
  v93 = 0;
  v94 = &v93;
  v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__19039;
  v97 = __Block_byref_object_dispose__19040;
  v98 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__19039;
  v91 = __Block_byref_object_dispose__19040;
  v92 = 0;
  v84 = 0;
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x3032000000;
  v85[3] = __Block_byref_object_copy__19039;
  v85[4] = __Block_byref_object_dispose__19040;
  v86 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__19039;
  v83 = __Block_byref_object_dispose__19040;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__19039;
  v77 = __Block_byref_object_dispose__19040;
  v78 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__19039;
  v71 = __Block_byref_object_dispose__19040;
  v72 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__19039;
  v65 = __Block_byref_object_dispose__19040;
  v66 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__19039;
  v59 = __Block_byref_object_dispose__19040;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__19039;
  v53 = __Block_byref_object_dispose__19040;
  v54 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __45__PHAsset_detailedDebugDescriptionInLibrary___block_invoke;
  v35[3] = &unk_1E35DA140;
  v35[4] = self;
  v8 = v5;
  v36 = v8;
  v9 = v7;
  v37 = v9;
  v38 = &v93;
  v39 = &v105;
  v40 = &v99;
  v41 = v85;
  v42 = &v79;
  v43 = &v73;
  v44 = &v67;
  v45 = &v61;
  v46 = &v55;
  v47 = &v49;
  v48 = &v87;
  objc_msgSend(v8, "performBlockAndWait:completionHandler:", v35, 0);
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nDate Details: %@"), v94[5]);
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nAdjustments Details: %@"), v106[5]);
  -[PHAsset adjustmentsDebugMetadata](self, "adjustmentsDebugMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "description");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("<Unsupported Data>");
  }
  if ((unint64_t)-[__CFString length](v12, "length") >= 0x201)
  {
    -[__CFString substringToIndex:](v12, "substringToIndex:", 512);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("... [truncated from total length %lu]"), -[__CFString length](v12, "length"));
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (__CFString *)v14;
  }
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nAdjustments Data: %@"), v12);
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nAdditional Details: %@"), v100[5]);
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nAnalysis State Details:\n%@"), v80[5]);
  -[PHAsset variationSuggestionStatesDetails](self, "variationSuggestionStatesDetails");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nVariation Suggestion State Details:\n%@"), v15);
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nScene Analysis Details: %@"), v74[5]);
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nFace Analysis Details: %@"), v68[5]);
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nMedia Analysis Details: %@"), v62[5]);
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nAesthetics Details: %@"), v56[5]);
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nPhotoAnalysis Wallpaper Properties Details: %@"), v50[5]);
  -[PHAsset croppingDebugDescription](self, "croppingDebugDescription");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nCropping Details: %@"), v16);
  -[PHObject uuid](self, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHImageManagerRequestTracer recentMessagesSummaryForAssetUUID:](PHImageManagerRequestTracer, "recentMessagesSummaryForAssetUUID:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nRecent Image Manager Requests:\n%@"), v18);

  if (v88[5])
    objc_msgSend(v9, "appendFormat:", CFSTR("\n\nResources Details: %@"), v88[5]);
  objc_msgSend(v9, "appendFormat:", CFSTR("\n\nAsset resources: "));
  v30 = v12;
  v19 = (void *)v16;
  v20 = (void *)v15;
  v21 = v11;
  v22 = v8;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  +[PHAssetResource assetResourcesForAsset:includeDerivatives:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:", self, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v111, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v23);
        objc_msgSend(v9, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v111, 16);
    }
    while (v24);
  }

  v27 = v9;
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(v85, 8);

  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v93, 8);

  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v105, 8);

  return v27;
}

- (id)descriptionForMediaAnalysisWithManagedAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  Float64 Seconds;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  float v34;
  void *v35;
  void *v36;
  Float64 v38;
  uint64_t v39;
  Float64 v40;
  Float64 v41;
  CMTimeRange v42;
  CMTime v43;
  CMTimeRange v44;
  CMTime v45;
  CMTimeRange time;
  __int128 v47;
  CMTimeEpoch v48;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaAnalysisTimeStamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("mediaAnalysisTimeStamp = %@\n"), v7);

  objc_msgSend(v5, "appendFormat:", CFSTR("mediaAnalysisVersion = %llu\n"), objc_msgSend(v6, "mediaAnalysisVersion"));
  objc_msgSend(v5, "appendFormat:", CFSTR("mediaAnalysisImageVersion = %hd\n"), (int)objc_msgSend(v6, "mediaAnalysisImageVersion"));
  objc_msgSend(v5, "appendFormat:", CFSTR("imageCaptionVersion = %hd\n"), (int)objc_msgSend(v6, "imageCaptionVersion"));
  objc_msgSend(v5, "appendFormat:", CFSTR("videoCaptionVersion = %hd\n"), (int)objc_msgSend(v6, "videoCaptionVersion"));
  v47 = 0uLL;
  v48 = 0;
  if (v4 && (objc_msgSend(v4, "videoKeyFrameTime"), (BYTE12(v47) & 0x1D) == 1))
  {
    *(_OWORD *)&time.start.value = v47;
    time.start.epoch = v48;
    objc_msgSend(v5, "appendFormat:", CFSTR("bestKeyFrameTime = %0.3f sec\n"), CMTimeGetSeconds(&time.start));
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("bestKeyFrameTime not set\n"), v39);
  }
  memset(&time, 0, sizeof(time));
  if (v6)
  {
    objc_msgSend(v6, "bestVideoTimeRange");
    if ((time.start.flags & 1) == 0
      || (~time.duration.flags & 0x11) == 0
      || (time.start.flags & 0x11) == 0x11
      || (time.duration.flags & 1) == 0
      || time.duration.epoch
      || time.duration.value < 0)
    {
      v8 = CFSTR("bestVideoTimeRange not set\n");
    }
    else
    {
      *(_OWORD *)&v44.start.value = *(_OWORD *)&time.start.value;
      v44.start.epoch = time.start.epoch;
      Seconds = CMTimeGetSeconds(&v44.start);
      v44 = time;
      CMTimeRangeGetEnd(&v45, &v44);
      v40 = Seconds;
      v41 = CMTimeGetSeconds(&v45);
      v8 = CFSTR("bestVideoTimeRange = [ %0.3f .. %0.3f ] sec\n");
    }
    objc_msgSend(v5, "appendFormat:", v8, *(_QWORD *)&v40, *(_QWORD *)&v41);
    memset(&v44, 0, sizeof(v44));
    objc_msgSend(v6, "animatedStickerTimeRange");
    if ((v44.start.flags & 1) != 0
      && (~v44.duration.flags & 0x11) != 0
      && (v44.start.flags & 0x11) != 0x11
      && (v44.duration.flags & 1) != 0
      && !v44.duration.epoch
      && (v44.duration.value & 0x8000000000000000) == 0)
    {
      *(_OWORD *)&v42.start.value = *(_OWORD *)&v44.start.value;
      v42.start.epoch = v44.start.epoch;
      v38 = CMTimeGetSeconds(&v42.start);
      v42 = v44;
      CMTimeRangeGetEnd(&v43, &v42);
      objc_msgSend(v5, "appendFormat:", CFSTR("animatedStickerTimeRange = [ %0.3f .. %0.3f ] sec\n"), *(_QWORD *)&v38, CMTimeGetSeconds(&v43));
      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("bestVideoTimeRange not set\n"));
    memset(&v44, 0, sizeof(v44));
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("animatedStickerTimeRange not set\n"), *(_QWORD *)&v40, *(_QWORD *)&v41);
LABEL_17:
  objc_msgSend(v6, "bestPlaybackRect");
  DCIM_NSStringFromCGRect();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("bestPlaybackRect = %@\n"), v10);

  objc_msgSend(v6, "blurrinessScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("blurrinessScore = %0.3f\n"), v11);
  objc_msgSend(v6, "exposureScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("exposureScore = %0.3f\n"), v12);
  objc_msgSend(v6, "wallpaperScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("wallpaperScore = %0.3f\n"), v13);
  objc_msgSend(v6, "autoplaySuggestionScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("autoplaySuggestionScore = %0.3f\n"), v14);
  objc_msgSend(v6, "videoStickerSuggestionScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("videoStickerSuggestionScore = %0.3f\n"), v15);
  objc_msgSend(v6, "videoScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("videoScore = %0.3f\n"), v16);
  objc_msgSend(v6, "activityScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("activityScore = %0.3f\n"), v17);
  objc_msgSend(v6, "audioScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("audioScore = %0.3f\n"), v18);
  objc_msgSend(v6, "settlingEffectScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("settlingEffectScore = %0.3f\n"), v19);
  objc_msgSend(v5, "appendFormat:", CFSTR("faceCount = %llu\n"), objc_msgSend(v6, "faceCount"));
  PHAssetMediaAnalysisStringsWithMultipleAudioClassifications(objc_msgSend(v6, "audioClassification"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR(" | "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("audioClassification = %@\n"), v21);

  objc_msgSend(v5, "appendFormat:", CFSTR("probableRotationDirection = %hd\n"), (int)objc_msgSend(v6, "probableRotationDirection"));
  objc_msgSend(v6, "probableRotationDirectionConfidence");
  objc_msgSend(v5, "appendFormat:", CFSTR("probableRotationDirectionConfidence = %g\n"), v22);
  objc_msgSend(v6, "colorNormalizationData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("colorNormalizationData = %@\n"), v23);

  -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("characterRecognitionAlgorithmVersion = %ld\n"), objc_msgSend(v24, "algorithmVersion"));
  objc_msgSend(v24, "adjustmentVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("characterRecognitionAdjustmentVersion = %@\n"), v25);

  objc_msgSend(v24, "characterRecognitionData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "characterRecognitionData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("characterRecognitionData = %p(.characterRecognitionData.length = %lu)\n"), v26, objc_msgSend(v27, "length"));

  objc_msgSend(v24, "machineReadableCodeData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "machineReadableCodeData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("machineReadableCodeData = %p(.machineReadableCodeData.length = %lu)\n"), v28, objc_msgSend(v29, "length"));

  objc_msgSend(v5, "appendFormat:", CFSTR("screenTimeDeviceImageSensitivity = %hd\n"), (int)objc_msgSend(v6, "screenTimeDeviceImageSensitivity"));
  -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("visualSearchAlgorithmVersion = %ld\n"), objc_msgSend(v30, "algorithmVersion"));
  objc_msgSend(v30, "adjustmentVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("visualSearchAdjustmentVersion = %@\n"), v31);

  objc_msgSend(v30, "visualSearchData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "visualSearchData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("visualSearchData = %p(.visualSearchData.length = %lu)\n"), v32, objc_msgSend(v33, "length"));

  objc_msgSend(v30, "stickerConfidenceScore");
  objc_msgSend(v5, "appendFormat:", CFSTR("stickerConfidenceScore = %0.3f\n"), v34);
  objc_msgSend(v5, "appendFormat:", CFSTR("stickerAlgorithmVersion = %ld\n"), objc_msgSend(v30, "stickerAlgorithmVersion"));
  objc_msgSend(v5, "appendFormat:", CFSTR("syndicationProcessingValue = %hu\n"), objc_msgSend(v6, "syndicationProcessingValue"));
  PHAssetSyndicationProcessingVersionDescription(objc_msgSend(v6, "syndicationProcessingVersion"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("syndicationProcessingVersion = %@\n"), v35);

  objc_msgSend(v5, "appendFormat:", CFSTR("privateEncryptedComputeAnalysisVersion = %d"), (int)objc_msgSend(v6, "privateEncryptedComputeAnalysisVersion"));
  objc_msgSend(v6, "privateEncryptedComputeAnalysisTimestamp");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("privateEncryptedComputeAnalysisTimestamp = %@"), v36);

  return v5;
}

- (id)descriptionForAestheticsWithManagedAsset:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", CFSTR("\n"));
  objc_msgSend(v5, "wellFramedSubjectScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("wellFramedSubjectScore = %f\n"), v6);
  objc_msgSend(v5, "wellChosenSubjectScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("wellChosenSubjectScore = %f\n"), v7);
  objc_msgSend(v5, "tastefullyBlurredScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("tastefullyBlurredScore = %f\n"), v8);
  objc_msgSend(v5, "sharplyFocusedSubjectScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("sharplyFocusedSubjectScore = %f\n"), v9);
  objc_msgSend(v5, "wellTimedShotScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("wellTimedShotScore = %f\n"), v10);
  objc_msgSend(v5, "pleasantLightingScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("pleasantLightingScore = %f\n"), v11);
  objc_msgSend(v5, "pleasantReflectionsScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("pleasantReflectionsScore = %f\n"), v12);
  objc_msgSend(v5, "harmoniousColorScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("harmoniousColorScore = %f\n"), v13);
  objc_msgSend(v5, "livelyColorScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("livelyColorScore = %f\n"), v14);
  objc_msgSend(v5, "pleasantSymmetryScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("pleasantSymmetryScore = %f\n"), v15);
  objc_msgSend(v5, "pleasantPatternScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("pleasantPatternScore = %f\n"), v16);
  objc_msgSend(v5, "immersivenessScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("immersivenessScore = %f\n"), v17);
  objc_msgSend(v5, "pleasantPerspectiveScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("pleasantPerspectiveScore = %f\n"), v18);
  objc_msgSend(v5, "pleasantPostProcessingScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("pleasantPostProcessingScore = %f\n"), v19);
  objc_msgSend(v5, "noiseScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("noiseScore = %f\n"), v20);
  objc_msgSend(v5, "failureScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("failureScore = %f\n"), v21);
  objc_msgSend(v5, "pleasantCompositionScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("pleasantCompositionScore = %f\n"), v22);
  objc_msgSend(v5, "interestingSubjectScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("interestingSubjectScore = %f\n"), v23);
  objc_msgSend(v5, "intrusiveObjectPresenceScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("intrusiveObjectPresenceScore = %f\n"), v24);
  objc_msgSend(v5, "pleasantCameraTiltScore");
  objc_msgSend(v4, "appendFormat:", CFSTR("pleasantCameraTiltScore = %f\n"), v25);
  objc_msgSend(v5, "lowLight");
  objc_msgSend(v4, "appendFormat:", CFSTR("lowLight = %f\n"), v26);

  return v4;
}

- (id)descriptionForPhotoAnanlysisWallpaperProeprtiesWithManagedAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PHAsset _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "wallpaperPropertiesData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("wallpaperPropertiesData: %p (size: %lu)\n"), v7, objc_msgSend(v7, "length"));
    objc_msgSend(v6, "wallpaperPropertiesTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("wallpaperPropertiesTimestamp: %@\n"), v8);

    objc_msgSend(v4, "appendFormat:", CFSTR("wallpaperPropertiesVersion: %llu\n"), objc_msgSend(v6, "wallpaperPropertiesVersion"));
    if (v7)
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, &v12);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        objc_msgSend(v4, "appendFormat:", CFSTR("wallpaperProperties: %@\n"), v9);
      else
        objc_msgSend(v4, "appendFormat:", CFSTR("wallpaperProperties error: %@\n"), v12);

    }
  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR("nil"));
  }

  return v4;
}

- (NSString)resourcesDebugDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  PHAsset *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  -[PHAsset pl_photoLibrary](self, "pl_photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__19039;
  v19 = __Block_byref_object_dispose__19040;
  v20 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __36__PHAsset_resourcesDebugDescription__block_invoke;
  v11 = &unk_1E35DEE50;
  v12 = self;
  v6 = v3;
  v13 = v6;
  v14 = &v15;
  objc_msgSend(v6, "performBlockAndWait:completionHandler:", &v8, 0);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n'modern' resources: %@\n"), v16[5], v8, v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
  return (NSString *)v5;
}

- (NSString)metadataDebugDescription
{
  PHAssetMediaType v3;
  _BOOL4 v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  void *v18;
  dispatch_time_t v19;
  id v20;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t *v25;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  __CFString *v38;

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__19039;
  v37 = __Block_byref_object_dispose__19040;
  v38 = &stru_1E35DFFF8;
  v3 = -[PHAsset mediaType](self, "mediaType");
  v4 = -[PHAsset mediaType](self, "mediaType") == PHAssetMediaTypeVideo || -[PHAsset isPhotoIris](self, "isPhotoIris");
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v5 = dispatch_group_create();
  v6 = dispatch_queue_create("com.apple.photos.metadatadebugdescription", 0);
  if (v3 == PHAssetMediaTypeImage)
  {
    dispatch_group_enter(v5);
    v7 = (void *)v34[5];
    v34[5] = (uint64_t)CFSTR("==========================\nImage Metadata:\n\n");

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setDeliveryMode:", 1);
    objc_msgSend(v8, "setLoadingMode:", 1);
    if (-[PHAsset hasAdjustments](self, "hasAdjustments"))
      v9 = 0;
    else
      v9 = 2;
    objc_msgSend(v8, "setVersion:", v9);
    objc_msgSend(v8, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v8, "setSynchronous:", 0);
    objc_msgSend(v8, "setResultHandlerQueue:", v6);
    +[PHImageManager defaultManager](PHImageManager, "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __35__PHAsset_metadataDebugDescription__block_invoke;
    v26[3] = &unk_1E35DA168;
    v28 = &v33;
    v27 = v5;
    objc_msgSend(v10, "requestImageDataAndOrientationForAsset:options:resultHandler:", self, v8, v26);

  }
  if (v4)
  {
    dispatch_group_enter(v5);
    objc_msgSend((id)v34[5], "stringByAppendingString:", CFSTR("==========================\nVideo Metadata:\n\n"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v34[5];
    v34[5] = v11;

    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v13, "setDeliveryMode:", 1);
    objc_msgSend(v13, "setResultHandlerQueue:", v6);
    +[PHImageManager defaultManager](PHImageManager, "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __35__PHAsset_metadataDebugDescription__block_invoke_2;
    v22[3] = &unk_1E35DA190;
    v24 = &v33;
    v25 = &v29;
    v15 = v5;
    v23 = v15;
    objc_msgSend(v14, "requestURLForVideo:options:resultHandler:", self, v13, v22);

    v16 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v15, v16);
    if (!*((_BYTE *)v30 + 24))
    {
      objc_msgSend((id)v34[5], "stringByAppendingString:", CFSTR("Request Timed out."));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v34[5];
      v34[5] = v17;
LABEL_14:

    }
  }
  else
  {
    v19 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v5, v19);
    if (v3 != PHAssetMediaTypeImage)
    {
      v18 = (void *)v34[5];
      v34[5] = (uint64_t)CFSTR("Can only print metadata for photos and videos");
      goto LABEL_14;
    }
  }
  v20 = (id)v34[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return (NSString *)v20;
}

- (NSString)variationSuggestionStatesDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PHObject addFetchPropertyHint:](self, "addFetchPropertyHint:", 16);
  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[PHAsset photosOneUpProperties](self, "photosOneUpProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[variationSuggestionState = %llu] "), objc_msgSend(v4, "variationSuggestionStates"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHObject photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "variationCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(&unk_1E3657300, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(&unk_1E3657300);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "integerValue");
        v12 = -[PHAsset variationSuggestionStatesForVariationType:](self, "variationSuggestionStatesForVariationType:", v11);
        objc_msgSend((id)objc_opt_class(), "_descriptionForVariationSuggestionType:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_descriptionForVariationSuggestionStates:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("\n\t%@: [%llu] %@"), v13, v12, v14);
        if ((v12 & 2) != 0)
        {
          if ((unint64_t)(v11 - 1) >= 3)
            v15 = 0;
          else
            v15 = v11;
          -[PHObject uuid](self, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "gatingResultForVariationType:assetIdentifier:", v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v17);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(&unk_1E3657300, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  return (NSString *)v5;
}

- (NSString)croppingDebugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _QWORD v37[5];
  _QWORD v38[7];

  v38[5] = *MEMORY[0x1E0C80C00];
  if (-[PHAsset pixelWidth](self, "pixelWidth") && -[PHAsset pixelHeight](self, "pixelHeight"))
  {
    PFDeviceScreenSize();
    v37[0] = CFSTR("square");
    DCIM_NSValueFromCGSize();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v3;
    v37[1] = CFSTR("standard4x3");
    DCIM_NSValueFromCGSize();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v4;
    v37[2] = CFSTR("wide16x9");
    DCIM_NSValueFromCGSize();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v5;
    v37[3] = CFSTR("screenDefault");
    DCIM_NSValueFromCGSize();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v6;
    v37[4] = CFSTR("screenTranspose");
    DCIM_NSValueFromCGSize();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v38[4] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v30 = *MEMORY[0x1E0C9D628];
      v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v17);
          v31 = 0;
          objc_msgSend(v10, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = MEMORY[0x19AEBDA08]();
          v22 = v21;

          -[PHAsset suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:](self, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v31, v20, v22, v30, v14, v15, v16);
          v23 = v31;
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), v24, v25, v26, v27);
          objc_msgSend(v9, "appendFormat:", CFSTR("\n%@=%f,%@"), v18, v23, v28);

          ++v17;
        }
        while (v12 != v17);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v12);
    }

  }
  else
  {
    v9 = 0;
  }
  return (NSString *)v9;
}

- (NSManagedObjectContext)managedObjectContextForFetchingResources
{
  void *v3;
  void *v4;

  -[PHObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectFetchingManagedObjectContextForObject:propertySet:", self, CFSTR("PHAssetPropertySetCore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSManagedObjectContext *)v4;
}

- (NSValue)originalFaceAreaRectValue
{
  CGRect v3;
  CGRect v4;

  -[PHAsset originalFaceAreaRect](self, "originalFaceAreaRect");
  v3 = v4;
  if (CGRectIsEmpty(v4))
    return (NSValue *)0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v3, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  return (NSValue *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isSyncFailureHidden
{
  return self->_syncFailureHidden;
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (unsigned)avalancheKind
{
  return self->_avalancheKind;
}

- (NSData)locationData
{
  return self->_locationData;
}

- (BOOL)cloudIsDeletable
{
  return self->_cloudIsDeletable;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (unint64_t)persistenceState
{
  return self->_persistenceState;
}

- (NSDate)trashedDate
{
  return self->_trashedDate;
}

- (unsigned)adjustmentsState
{
  return self->_adjustmentsState;
}

- (int)exifOrientation
{
  return self->_exifOrientation;
}

- (NSString)originalColorSpace
{
  return self->_originalColorSpace;
}

- (double)curationScore
{
  return self->_curationScore;
}

- (float)overallAestheticScore
{
  return self->_overallAestheticScore;
}

- (int64_t)videoCpDurationValue
{
  return self->_videoCpDurationValue;
}

- (CLLocationCoordinate2D)locationCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_locationCoordinate.latitude;
  longitude = self->_locationCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (unsigned)syndicationState
{
  return self->_syndicationState;
}

- (signed)currentSmartStyleCast
{
  return self->_currentSmartStyleCast;
}

- (signed)generativeMemoryCreationEligibilityState
{
  return self->_generativeMemoryCreationEligibilityState;
}

- (int64_t)creationDateSource
{
  return self->_creationDateSource;
}

- (NSArray)faceRegions
{
  return self->_faceRegions;
}

- (id)faceAdjustmentVersion
{
  return self->_faceAdjustmentVersion;
}

- (signed)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- (BOOL)assetDescriptionWasSet
{
  return self->_assetDescriptionWasSet;
}

- (void)setAssetDescriptionWasSet:(BOOL)a3
{
  self->_assetDescriptionWasSet = a3;
}

- (NSDate)analysisStateModificationDate
{
  return self->_analysisStateModificationDate;
}

- (unsigned)videoDeferredProcessingNeeded
{
  return self->_videoDeferredProcessingNeeded;
}

- (BOOL)isStyleable
{
  return self->_isStyleable;
}

- (BOOL)isPhotoIris
{
  return self->_isPhotoIris;
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (double)highlightPromotionScore
{
  return self->_highlightPromotionScore;
}

- (unsigned)videoCpVisibilityState
{
  return self->_videoCpVisibilityState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisStateModificationDate, 0);
  objc_storeStrong(&self->_faceAdjustmentVersion, 0);
  objc_storeStrong((id *)&self->_faceRegions, 0);
  objc_storeStrong((id *)&self->_hdrGain, 0);
  objc_storeStrong((id *)&self->_imageRequestHints, 0);
  objc_storeStrong((id *)&self->_originalColorSpace, 0);
  objc_storeStrong((id *)&self->_adjustmentTimestamp, 0);
  objc_storeStrong((id *)&self->_trashedDate, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_locationData, 0);
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_localCreationDate, 0);
  objc_storeStrong((id *)&self->_cloudAssetGUID, 0);
  objc_storeStrong((id *)&self->_lazyCachedLocation, 0);
}

void __35__PHAsset_metadataDebugDescription__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  int v11;
  CGImageSource *v12;
  void *v13;
  int64_t Count;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFData *data;

  data = a2;
  v8 = a3;
  v9 = a5;
  if (v8
    && (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC520]),
        v10,
        data)
    && v11)
  {
    v12 = CGImageSourceCreateWithData(data, 0);
    v13 = CGImageSourceCopyProperties(v12, 0);
    Count = CGImageSourceGetCount(v12);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingFormat:", CFSTR("%@\nImage Count: %lu\n\n"), v13, Count);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        objc_msgSend(MEMORY[0x1E0D75130], "imagePropertiesFromImageSource:atIndex:", v12, i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingFormat:", CFSTR("==========================\nImage at index %lu:\n\n%@\n\n"), i, v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v20;

      }
    }
    CFRelease(v12);
  }
  else
  {
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v9, "objectForKey:", CFSTR("PHImageErrorKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("There was an error getting the maximum size image: %@\n\n"), v13);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __35__PHAsset_metadataDebugDescription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v3 = a1;
  v31 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", &stru_1E35DFFF8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v10, "commonKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "keySpace");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("%@ (%@, %@): \n"), v11, v12, v13);

          objc_msgSend(v10, "stringValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("\t%@\n\n"), v14);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v7);
    }

    v3 = a1;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingString:", v5);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  else
  {
    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("There was en error getting the video: %@"), v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(v3 + 40) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(v3 + 32));
}

void __36__PHAsset_resourcesDebugDescription__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "managedAssetForPhotoLibrary:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(v2, "descriptionForModernResources");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v6;
  }

}

void __45__PHAsset_detailedDebugDescriptionInLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;

  objc_msgSend(*(id *)(a1 + 32), "managedAssetForPhotoLibrary:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v73 = v2;
    objc_msgSend(v2, "willAccessValueForKey:", 0);
    objc_msgSend(v73, "additionalAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "willAccessValueForKey:", 0);

    objc_msgSend(v73, "additionalAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unmanagedAdjustment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willAccessValueForKey:", 0);

    v6 = *(void **)(a1 + 48);
    objc_msgSend(v73, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\nBacked by: %@"), v7);

    v8 = (void *)MEMORY[0x1E0CB37A0];
    PLMillisecondDateFormatter();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "dateCreated");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("\n\tdateCreated(+ms) = %@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    PLMillisecondDateFormatter();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "localDateCreated");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringFromDate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendFormat:", CFSTR("\n\tlocalDateCreated(+ms) = %@"), v18);

    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    PLMillisecondDateFormatter();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addedDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromDate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendFormat:", CFSTR("\n\taddedDate(+ms) = %@"), v22);

    objc_msgSend(v73, "additionalAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "unmanagedAdjustment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "description");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

    objc_msgSend(v73, "additionalAttributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "description");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "mutableCopy");
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

    objc_msgSend(v73, "location");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(v73, "location");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "appendFormat:", CFSTR("\nlocation = %@"), v35);

    }
    objc_msgSend(v73, "title");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(v73, "title");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "appendFormat:", CFSTR("\ntitle = %@"), v38);

    }
    objc_msgSend(v73, "longDescription");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(v73, "longDescription");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "appendFormat:", CFSTR("\nlongDescription = %@"), v41);

    }
    objc_msgSend(v73, "descriptionForSidecarFiles");
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v44 = *(void **)(v43 + 40);
    *(_QWORD *)(v43 + 40) = v42;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "appendFormat:", CFSTR("\n%@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    objc_msgSend(v73, "descriptionForAnalysisStates");
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v47 = *(void **)(v46 + 40);
    *(_QWORD *)(v46 + 40) = v45;

    objc_msgSend(v73, "descriptionForSceneAnalysis");
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v50 = *(void **)(v49 + 40);
    *(_QWORD *)(v49 + 40) = v48;

    objc_msgSend(v73, "faceDescription");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v53 = *(void **)(v52 + 40);
    *(_QWORD *)(v52 + 40) = v51;

    objc_msgSend(*(id *)(a1 + 32), "descriptionForMediaAnalysisWithManagedAsset:", v73);
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v56 = *(void **)(v55 + 40);
    *(_QWORD *)(v55 + 40) = v54;

    objc_msgSend(*(id *)(a1 + 32), "descriptionForAestheticsWithManagedAsset:", v73);
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
    v59 = *(void **)(v58 + 40);
    *(_QWORD *)(v58 + 40) = v57;

    objc_msgSend(*(id *)(a1 + 32), "descriptionForPhotoAnanlysisWallpaperProeprtiesWithManagedAsset:", v73);
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
    v62 = *(void **)(v61 + 40);
    *(_QWORD *)(v61 + 40) = v60;

    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "isCloudPhotoLibraryEnabled");

    v65 = (void *)MEMORY[0x1E0CB3940];
    if (v64)
      objc_msgSend(v73, "descriptionForResources");
    else
      objc_msgSend(v73, "descriptionForNonCloudResources");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "stringWithFormat:", CFSTR("\n%@"), v66);
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
    v69 = *(void **)(v68 + 40);
    *(_QWORD *)(v68 + 40) = v67;

    objc_msgSend(v73, "additionalAttributes");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "unmanagedAdjustment");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "didAccessValueForKey:", 0);

    objc_msgSend(v73, "additionalAttributes");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "didAccessValueForKey:", 0);

    objc_msgSend(v73, "didAccessValueForKey:", 0);
    v2 = v73;
  }

}

void __35__PHAsset_adjustmentsDebugMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHAdjustmentDataKey"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isPhoto"))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0D71988]);
      objc_msgSend(v22, "data");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "formatIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "formatVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "debugDescriptionForPhotoEditData:formatIdentifier:formatVersion:", v4, v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "isVideo"))
        goto LABEL_7;
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v22, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "__dictionaryWithContentsOfData:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        goto LABEL_7;
      v3 = objc_alloc_init(MEMORY[0x1E0D71988]);
      objc_msgSend(v22, "data");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "debugDescriptionForAdjustmentData:", v4);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;
    }

LABEL_7:
    v15 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "mutableCopy");
    objc_msgSend(v22, "formatVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("formatVersion"));

    objc_msgSend(v22, "formatIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("formatIdentifier"));

    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v15;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __35__PHAsset_adjustmentsDebugMetadata__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __35__PHAsset_canPerformEditOperation___block_invoke(uint64_t a1)
{
  if (!objc_msgSend(*(id *)(a1 + 32), "participatesInLibraryScope"))
    return 1;
  if ((objc_msgSend((id)objc_opt_class(), "_isLibraryScopeExiting:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    return 0;
  return objc_msgSend((id)objc_opt_class(), "_libraryScopeAssetContributedByCurrentUser:", *(_QWORD *)(a1 + 32));
}

uint64_t __35__PHAsset_canPerformEditOperation___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cloudIsDeletable");
  if ((_DWORD)result)
  {
    result = objc_msgSend(MEMORY[0x1E0D732D8], "isEntitledForPhotoKit");
    if ((_DWORD)result)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(a1 + 48) == 1;
  }
  return result;
}

_QWORD *__35__PHAsset_canPerformEditOperation___block_invoke_3(_QWORD *result)
{
  uint64_t v1;
  unint64_t v2;
  BOOL v3;
  char v4;
  _QWORD *v5;

  v1 = result[6];
  v2 = v1 - 1;
  v3 = v1 == 101;
  v4 = v2 < 3 || v3;
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = v4;
  if (*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    v5 = result;
    if (result[6] == 101)
    {
      result = (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
      *(_BYTE *)(*(_QWORD *)(v5[5] + 8) + 24) = (_BYTE)result;
    }
  }
  return result;
}

_QWORD *__35__PHAsset_canPerformEditOperation___block_invoke_4(_QWORD *result)
{
  uint64_t v1;
  BOOL v3;
  _QWORD *v4;

  v1 = result[6];
  v3 = v1 == 1 || v1 == 101;
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = v3;
  if (*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    v4 = result;
    if (result[6] == 101)
    {
      result = (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
      *(_BYTE *)(*(_QWORD *)(v4[5] + 8) + 24) = (_BYTE)result;
    }
  }
  return result;
}

_QWORD *__35__PHAsset_canPerformEditOperation___block_invoke_5(_QWORD *result)
{
  _QWORD *v1;

  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = result[6] == 101;
  if (*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    v1 = result;
    if (result[6] == 101)
    {
      result = (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
      *(_BYTE *)(*(_QWORD *)(v1[5] + 8) + 24) = (_BYTE)result;
    }
  }
  return result;
}

uint64_t __35__PHAsset_canPerformEditOperation___block_invoke_6(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

BOOL __54__PHAsset_isIncompleteLivePhotoMissingVideoComplement__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "backingResourceIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resourceType") == 3;

  return v3;
}

void __60__PHAsset_getFingerPrintForAssetType_withCompletionHandler___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "managedAssetForPhotoLibrary:", *(_QWORD *)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[PHExternalAssetResource probableCPLResourceTypeFromAssetResourceType:](PHExternalAssetResource, "probableCPLResourceTypeFromAssetResourceType:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v8, "master");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rm_cloudResourcesForResourceType:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fingerprint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v6, 0);

}

void __53__PHAsset_getMasterFingerPrintWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "managedAssetForPhotoLibrary:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "masterFingerPrintCacheIfNecessaryAndAdjustedFingerPrint:error:", 0, &v7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __20__PHAsset_isOffline__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0D71748];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volumeForURL:context:", v3, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "isOffline");
    v5 = v6;
  }

}

id __36__PHAsset__initializeCachedLocation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_uncachedLocation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __48__PHAsset_generateLargeThumbnailFileIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetWithObjectID:inLibrary:", v3, *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "generateLargeThumbnailFileIfNecessary");
}

void __33__PHAsset_originalAVAssetOrProxy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managedAssetForPhotoLibrary:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avAssetProxyForOriginalAllowReadFromFile:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __34__PHAsset_originalImageProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managedAssetForPhotoLibrary:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageProperties");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __46__PHAsset__sceneClassificationsWithPredicate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
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
  uint64_t v26;
  void *v27;
  PHSceneClassification *v28;
  PHSceneClassification *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  uint8_t buf[32];
  _BYTE v44[128];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setPropertiesToFetch:", *(_QWORD *)(a1 + 48));
  v45[0] = CFSTR("assetAttributes");
  v45[1] = CFSTR("assetAttributesForTemporalSceneClassifications");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v3);

  objc_msgSend(v2, "setResultType:", 2);
  v4 = *(void **)(a1 + 56);
  v42 = 0;
  v36 = v2;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v42);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v42;
  if (!v5)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Error fetching scene classifications, entity: %@, error: %@", buf, 0x16u);
    }

  }
  v35 = v6;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedLongLongValue");

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("confidence"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("startTime"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v21 = v20;

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("duration"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        v24 = v23;

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("classificationType"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "integerValue");

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("packedBoundingBoxRect"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "longLongValue");

        memset(buf, 0, sizeof(buf));
        PLSplitToCGRectFromInt64();
        v28 = [PHSceneClassification alloc];
        v29 = -[PHSceneClassification initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:](v28, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v15, v26, v18, *(double *)buf, *(double *)&buf[8], *(_OWORD *)&buf[16], v21, v24);
        objc_msgSend(*(id *)(a1 + 64), "addObject:", v29);
        v30 = *(void **)(a1 + 72);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = *(void **)(a1 + 72);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, v34);

        }
        objc_msgSend(v32, "addObject:", v29);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v10);
  }

}

void __39__PHAsset__createKeywordPropertyObject__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const __CFString *v20;
  NSObject *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D718A0], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("ANY assetAttributes.asset IN %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v8);

  objc_msgSend(v4, "setPropertiesToFetch:", &unk_1E3657288);
  objc_msgSend(v4, "setResultType:", 2);
  v9 = *(void **)(a1 + 40);
  v19 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v4, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (v10)
  {
    objc_msgSend(v10, "_pl_map:", &__block_literal_global_489);
    v12 = objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("keywordTitles");
    v21 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithFetchDictionary:asset:prefetched:", v13, *(_QWORD *)(a1 + 32), 0);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  else
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v17;
      v24 = 2112;
      v25 = v18;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch propert set %@ data for %@: %@", buf, 0x20u);

    }
  }

}

uint64_t __39__PHAsset__createKeywordPropertyObject__block_invoke_487(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("title"));
}

void __45__PHAsset__createAnalysisStatePropertyObject__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("asset == %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v4);
  objc_msgSend(v5, "setResultType:", 2);
  v6 = *(void **)(a1 + 48);
  v15 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v5, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v7)
  {
    v22 = CFSTR("assetAnalysisStates");
    v23[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(*(Class *)(a1 + 64)), "initWithFetchDictionary:asset:prefetched:", v9, *(_QWORD *)(a1 + 32), 0);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 64), "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch property set %@ data for %@: %@", buf, 0x20u);

    }
  }

}

void __39__PHAsset__createCommentPropertyObject__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setPropertiesToFetch:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setResultType:", 2);
  v3 = *(void **)(a1 + 56);
  v12 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v19 = CFSTR("comments");
    v20[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(*(Class *)(a1 + 80)), "initWithFetchDictionary:asset:prefetched:", v6, *(_QWORD *)(a1 + 64), 0);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 80), "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch property set %@ data for %@: %@", buf, 0x20u);

    }
  }

}

void __61__PHAsset__createPropertyObjectOfClass_preFetchedProperties___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  id v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setPropertiesToFetch:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setResultType:", 2);
  v3 = *(void **)(a1 + 56);
  v48 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v48);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v48;
  if (!v4)
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 80), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v51 = v7;
      v52 = 2112;
      v53 = v8;
      v54 = 2112;
      v55 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch property set %@ data for %@: %@", buf, 0x20u);

    }
  }
  objc_msgSend(v4, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_24;
  if (!*(_BYTE *)(a1 + 88))
  {
LABEL_23:
    v9 = (id)MEMORY[0x1E0C9AA70];
    goto LABEL_24;
  }
  objc_msgSend(*(id *)(a1 + 80), "additionalPropertiesToFetchOnPrimaryObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count")
    || (objc_msgSend(*(id *)(a1 + 80), "keyPathToPrimaryObject"),
        (v42 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_23;
  }
  v11 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 64), "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithFormat:", CFSTR("self == %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v16);

  objc_msgSend(v13, "setPropertiesToFetch:", v10);
  objc_msgSend(v13, "setResultType:", 2);
  v17 = *(void **)(a1 + 56);
  v47 = 0;
  objc_msgSend(v17, "executeFetchRequest:error:", v13, &v47);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v47;
  if (!v18)
  {
    PLPhotoKitGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 80), "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "uuid");
      v21 = v13;
      v22 = v4;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v51 = v20;
      v52 = 2112;
      v53 = v23;
      v54 = 2112;
      v55 = v41;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Failed to fetch primary object for property set %@ data for %@: %@", buf, 0x20u);

      v4 = v22;
      v13 = v21;

      v18 = 0;
    }

  }
  v40 = v5;
  objc_msgSend(v18, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v39 = v2;
    v36 = v13;
    v37 = v10;
    v38 = v4;
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v24, "allKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v44 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v24, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v42, v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v31, v32);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v27);
    }

    v2 = v39;
    v10 = v37;
    v4 = v38;
    v13 = v36;
  }
  else
  {
    v9 = 0;
  }

  v5 = v40;
  if (!v9)
    goto LABEL_23;
LABEL_24:
  v33 = objc_msgSend(objc_alloc(*(Class *)(a1 + 80)), "initWithFetchDictionary:asset:prefetched:", v9, *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 80), "inverseIsToMany"));
  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v35 = *(void **)(v34 + 40);
  *(_QWORD *)(v34 + 40) = v33;

}

uint64_t __22__PHAsset_assetSource__block_invoke()
{
  uint64_t result;

  result = dyld_get_program_sdk_version();
  assetSource_linkedBefore11_0 = result < 0xB0000;
  return result;
}

+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("PHAssetPropertySetIdentifier"), "length");
  if ((a3 & 1) != 0 && v5)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetIdentifier"));
  v6 = objc_msgSend(CFSTR("PHAssetPropertySetCore"), "length");
  if ((a3 & 2) != 0 && v6)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetCore"));
  v7 = objc_msgSend(CFSTR("PHAssetPropertySetLocalDate"), "length");
  if ((a3 & 0x200000) != 0 && v7)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetLocalDate"));
  v8 = objc_msgSend(CFSTR("PHAssetPropertySetPlacesCore"), "length");
  if ((a3 & 4) != 0 && v8)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetPlacesCore"));
  v9 = objc_msgSend(CFSTR("PHAssetPropertySetOriginalMetadata"), "length");
  if ((a3 & 8) != 0 && v9)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetOriginalMetadata"));
  v10 = objc_msgSend(CFSTR("PHAssetPropertySetPhotosOneUp"), "length");
  if ((a3 & 0x10) != 0 && v10)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetPhotosOneUp"));
  v11 = objc_msgSend(CFSTR("PHAssetPropertySetPhotosInfoPanelExtended"), "length");
  if ((a3 & 0x100000) != 0 && v11)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetPhotosInfoPanelExtended"));
  v12 = objc_msgSend(CFSTR("PHAssetPropertySetPhotosSmartStyleExtended"), "length");
  if ((a3 & 0x8000000000) != 0 && v12)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetPhotosSmartStyleExtended"));
  v13 = objc_msgSend(CFSTR("PHAssetPropertySetPhotosInfoPanelLocation"), "length");
  if ((a3 & 0x1000000) != 0 && v13)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetPhotosInfoPanelLocation"));
  v14 = objc_msgSend(CFSTR("PHAssetPropertySetPhotoIris"), "length");
  if ((a3 & 0x20) != 0 && v14)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetPhotoIris"));
  v15 = objc_msgSend(CFSTR("PHAssetPropertySetDescription"), "length");
  if ((a3 & 0x40) != 0 && v15)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetDescription"));
  v16 = objc_msgSend(CFSTR("PHAssetPropertySetCloudShared"), "length");
  if ((a3 & 0x10000000000) != 0 && v16)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetCloudShared"));
  v17 = objc_msgSend(CFSTR("PHAssetPropertySetComments"), "length");
  if ((a3 & 0x80) != 0 && v17)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetComments"));
  v18 = objc_msgSend(CFSTR("PHAssetPropertySetSceneAnalysis"), "length");
  if ((a3 & 0x100) != 0 && v18)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetSceneAnalysis"));
  v19 = objc_msgSend(CFSTR("PHAssetPropertySetAnalysisState"), "length");
  if ((a3 & 0x200) != 0 && v19)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetAnalysisState"));
  v20 = objc_msgSend(CFSTR("PHAssetPropertySetUserActivity"), "length");
  if ((a3 & 0x400) != 0 && v20)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetUserActivity"));
  v21 = objc_msgSend(CFSTR("PHAssetPropertySetFaceWorker"), "length");
  if ((a3 & 0x800) != 0 && v21)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetFaceWorker"));
  v22 = objc_msgSend(CFSTR("PHAssetPropertySetImageManager"), "length");
  if ((a3 & 0x1000) != 0 && v22)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetImageManager"));
  v23 = objc_msgSend(CFSTR("PHAssetPropertySetAdjustment"), "length");
  if ((a3 & 0x2000) != 0 && v23)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetAdjustment"));
  v24 = objc_msgSend(CFSTR("PHAssetPropertySetCuration"), "length");
  if ((a3 & 0x4000) != 0 && v24)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetCuration"));
  v25 = objc_msgSend(CFSTR("PHAssetPropertySetAesthetic"), "length");
  if ((a3 & 0x8000) != 0 && v25)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetAesthetic"));
  v26 = objc_msgSend(CFSTR("PHAssetPropertySetMediaAnalysis"), "length");
  if ((a3 & 0x10000) != 0 && v26)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetMediaAnalysis"));
  v27 = objc_msgSend(CFSTR("PHAssetPropertySetPhotoAnalysisWallpaperProperties"), "length");
  if ((a3 & 0x200000000) != 0 && v27)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetPhotoAnalysisWallpaperProperties"));
  v28 = objc_msgSend(CFSTR("PHAssetPropertySetCharacterRecognition"), "length");
  if ((a3 & 0x8000000) != 0 && v28)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetCharacterRecognition"));
  v29 = objc_msgSend(CFSTR("PHAssetPropertySetVisualSearch"), "length");
  if ((a3 & 0x40000000) != 0 && v29)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetVisualSearch"));
  v30 = objc_msgSend(CFSTR("PHAssetPropertySetImport"), "length");
  if ((a3 & 0x20000) != 0 && v30)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetImport"));
  v31 = objc_msgSend(CFSTR("PHAssetPropertySetSceneprint"), "length");
  if ((a3 & 0x40000) != 0 && v31)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetSceneprint"));
  v32 = objc_msgSend(CFSTR("PHAssetPropertySetDestinationAssetCopy"), "length");
  if ((a3 & 0x80000) != 0 && v32)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetDestinationAssetCopy"));
  v33 = objc_msgSend(CFSTR("PHAssetPropertySetKeywords"), "length");
  if ((a3 & 0x400000) != 0 && v33)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetKeywords"));
  v34 = objc_msgSend(CFSTR("PHAssetPropertySetGridMetadata"), "length");
  if ((a3 & 0x800000) != 0 && v34)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetGridMetadata"));
  v35 = objc_msgSend(CFSTR("PHAssetPropertySetCoarseLocation"), "length");
  if ((a3 & 0x2000000) != 0 && v35)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetCoarseLocation"));
  v36 = objc_msgSend(CFSTR("PHAssetPropertySetLibraryScope"), "length");
  if ((a3 & 0x4000000) != 0 && v36)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetLibraryScope"));
  v37 = objc_msgSend(CFSTR("PHAssetPropertySetCameraCaptureDevice"), "length");
  if ((a3 & 0x10000000) != 0 && v37)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetCameraCaptureDevice"));
  v38 = objc_msgSend(CFSTR("PHAssetPropertySetCloudLocalState"), "length");
  if ((a3 & 0x20000000) != 0 && v38)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetCloudLocalState"));
  v39 = objc_msgSend(CFSTR("PHAssetPropertySetMontage"), "length");
  if (a3 >= 0xFFFFFFFF80000000 && v39)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetMontage"));
  v40 = objc_msgSend(CFSTR("PHAssetPropertySetSpatialMedia"), "length");
  if ((a3 & 0x100000000) != 0 && v40)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetSpatialMedia"));
  v41 = objc_msgSend(CFSTR("PHAssetPropertySetLocationData"), "length");
  if ((a3 & 0x400000000) != 0 && v41)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetLocationData"));
  v42 = objc_msgSend(CFSTR("PHAssetPropertySetPTP"), "length");
  if ((a3 & 0x2000000000) != 0 && v42)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetPTP"));
  v43 = objc_msgSend(CFSTR("PHAssetPropertySetIconicScore"), "length");
  if ((a3 & 0x800000000) != 0 && v43)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetIconicScore"));
  v44 = objc_msgSend(CFSTR("PHAssetPropertySetStoryPlayback"), "length");
  if ((a3 & 0x4000000000) != 0 && v44)
    objc_msgSend(v4, "addObject:", CFSTR("PHAssetPropertySetStoryPlayback"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

+ (id)faceWorkerPropertiesToFetch
{
  pl_dispatch_once();
  return (id)faceWorkerPropertiesToFetch_pl_once_object_16;
}

+ (id)imageManagerPropertiesToFetch
{
  pl_dispatch_once();
  return (id)imageManagerPropertiesToFetch_pl_once_object_17;
}

+ (BOOL)managedObjectSupportsAssetStacks
{
  return 1;
}

+ (BOOL)managedObjectSupportsAdjustments
{
  return 1;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PHAsset_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_19447 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_19447, block);
  if ((objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_19448, "containsObject:", v7) & 1) != 0)
  {
    v8 = v6;
  }
  else if (objc_msgSend(v6, "expressionType"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "constantValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && objc_msgSend(v7, "isEqualToString:", CFSTR("mediaType")))
    {
      PHQueryTransformExpressionConstantValue(v9, &__block_literal_global_336);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v10);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (id)_transformMediaSubtypeReferences:(id)a3 inComparisonPredicate:(id)a4 options:(id)a5
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id obj;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[3];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v52 = a4;
  v49 = a5;
  if (_transformMediaSubtypeReferences_inComparisonPredicate_options__onceToken != -1)
    dispatch_once(&_transformMediaSubtypeReferences_inComparisonPredicate_options__onceToken, &__block_literal_global_355);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v7;
  v8 = 0x1E0CB3000;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v53)
  {
    v51 = *(_QWORD *)v63;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v63 != v51)
          objc_enumerationMutation(obj);
        v54 = v9;
        objc_msgSend((id)_transformMediaSubtypeReferences_inComparisonPredicate_options___allSubtypesByMediaSubtypeKey, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "filteredArrayUsingPredicate:", v52);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
        v8 = 0x1E0CB3000uLL;
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v59;
          v55 = v12;
          v56 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v59 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("mediaSubtypes"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v18)
              {
                objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("mediaSubtype"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v19 = objc_msgSend(v18, "integerValue");
              if (v19 >= 0x20000)
              {
                if (v19 < 0x200000)
                {
                  if (v19 < 0x80000)
                  {
                    if (v19 != 0x20000)
                    {
                      if (v19 != 0x40000)
                        goto LABEL_60;
                      v20 = *(void **)(v8 + 2176);
                      v21 = 102;
                      goto LABEL_51;
                    }
                    objc_msgSend(*(id *)(v8 + 2176), "predicateWithFormat:", CFSTR("%K = %d OR %K = %d"), CFSTR("highFrameRateState"), 2, CFSTR("highFrameRateState"), 3);
LABEL_56:
                    v25 = objc_claimAutoreleasedReturnValue();
LABEL_57:
                    v26 = (void *)v25;
                    v33 = v57;
LABEL_58:
                    objc_msgSend(v33, "addObject:", v26);
                    goto LABEL_59;
                  }
                  if (v19 == 0x80000)
                  {
                    v20 = *(void **)(v8 + 2176);
                    v21 = 103;
                    goto LABEL_51;
                  }
                  if (v19 != 0x100000)
                    goto LABEL_60;
                  v22 = *(void **)(v8 + 2176);
                  v23 = 5;
LABEL_53:
                  v46 = v23;
                  v42 = CFSTR("hdrType");
                  goto LABEL_54;
                }
                if (v19 >= 0x800000)
                {
                  if (v19 == 0x800000)
                  {
                    v22 = *(void **)(v8 + 2176);
                    v23 = 11;
                    goto LABEL_53;
                  }
                  if (v19 != 0x1000000)
                    goto LABEL_60;
                  v22 = *(void **)(v8 + 2176);
                  v24 = CFSTR("currentSleetCast > 0");
                }
                else
                {
                  if (v19 != 0x200000)
                  {
                    if (v19 != 0x400000)
                      goto LABEL_60;
                    v20 = *(void **)(v8 + 2176);
                    v21 = 104;
LABEL_51:
                    objc_msgSend(v20, "predicateWithFormat:", CFSTR("kindSubtype = %d"), v21, v46, v47, v48);
                    goto LABEL_56;
                  }
                  v22 = *(void **)(v8 + 2176);
                  v46 = 2;
                  v42 = CFSTR("depthType");
LABEL_54:
                  v45 = v42;
                  v24 = CFSTR("%K = %d");
                }
                objc_msgSend(v22, "predicateWithFormat:", v24, v45, v46, v47, v48);
                goto LABEL_56;
              }
              if (v19 <= 63)
              {
                switch(v19)
                {
                  case 1:
                    v20 = *(void **)(v8 + 2176);
                    v21 = 1;
                    goto LABEL_51;
                  case 2:
                    objc_msgSend(*(id *)(v8 + 2176), "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("hdrType"), 2);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "addObject:", v32);

                    v15 = v56;
                    objc_msgSend(*(id *)(v8 + 2176), "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("hdrType"), 3);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = v57;
                    v12 = v55;
                    goto LABEL_58;
                  case 3:
                  case 5:
                  case 6:
                  case 7:
                    goto LABEL_60;
                  case 4:
                    v20 = *(void **)(v8 + 2176);
                    v21 = 10;
                    goto LABEL_51;
                  case 8:
                    objc_msgSend(*(id *)(v8 + 2176), "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("kindSubtype"), 2);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v8 + 2176), "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("videoCpDurationValue"), 0);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0D71880], "videoComplementVisibilityStatePlayablePredicate");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = (void *)MEMORY[0x1E0CB3528];
                    v68[0] = v26;
                    v68[1] = v27;
                    v68[2] = v28;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "andPredicateWithSubpredicates:", v30);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();

                    v15 = v56;
                    objc_msgSend(v57, "addObject:", v31);

                    goto LABEL_59;
                  default:
                    if (v19 != 16)
                      goto LABEL_60;
                    objc_msgSend(MEMORY[0x1E0D71880], "predicateForDepthEffectPhotos");
                    v25 = objc_claimAutoreleasedReturnValue();
                    break;
                }
                goto LABEL_57;
              }
              if (v19 <= 1023)
              {
                if (v19 == 64)
                {
                  objc_msgSend(*(id *)(v8 + 2176), "predicateWithFormat:", CFSTR("playbackStyle = %d"), 2, v46, v47, v48);
                  goto LABEL_56;
                }
                if (v19 != 512)
                  goto LABEL_60;
                v22 = *(void **)(v8 + 2176);
                v23 = 10;
                goto LABEL_53;
              }
              if (v19 != 1024)
              {
                if (v19 != 0x10000)
                  goto LABEL_60;
                v20 = *(void **)(v8 + 2176);
                v21 = 100;
                goto LABEL_51;
              }
              objc_msgSend(*(id *)(v8 + 2176), "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("spatialType"), 0);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D71880], "predicateForUnadjustedAssetsWithKeyPathToAsset:", 0);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v8 + 2176), "predicateWithFormat:", CFSTR("(%K & %d) != 0"), CFSTR("additionalAttributes.unmanagedAdjustment.adjustmentRenderTypes"), 4096);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = (void *)MEMORY[0x1E0CB3528];
              v67[0] = v34;
              v67[1] = v35;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "orPredicateWithSubpredicates:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              v39 = (void *)MEMORY[0x1E0CB3528];
              v66[0] = v26;
              v66[1] = v38;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "andPredicateWithSubpredicates:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              v12 = v55;
              v8 = 0x1E0CB3000;
              objc_msgSend(v57, "addObject:", v41);

              v15 = v56;
LABEL_59:

LABEL_60:
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
          }
          while (v14);
        }

        v9 = v54 + 1;
      }
      while (v54 + 1 != v53);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v53);
  }

  if (objc_msgSend(v57, "count"))
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v57);
  else
    objc_msgSend(*(id *)(v8 + 2176), "predicateWithValue:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

+ (id)identifierCode
{
  return CFSTR("001");
}

+ (Class)propertySetClassForPropertySet:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  pl_dispatch_once();
  objc_msgSend((id)propertySetClassForPropertySet__pl_once_object_20, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

+ (id)propertySetAccessorsByPropertySet
{
  pl_dispatch_once();
  return (id)propertySetAccessorsByPropertySet_pl_once_object_21;
}

+ (id)_unfetchedPropertySetsForAssets:(id)a3 fromPropertySets:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "_unfetchedPropertySetsFromPropertySets:", v6, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "unionSet:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (void)_batchFetchAdditionalPropertySetsIfNeeded:(id)a3 forAssets:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id obj;
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
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_unfetchedPropertySetsForAssets:fromPropertySets:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v30 = v5;
    v8 = objc_msgSend((id)objc_opt_class(), "_extendedPropertyFetchHintsForPropertySets:", v5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v29 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    v28 = v7;
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v38;
      v15 = v31;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (!v13)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "photoLibrary");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v17, "objectID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v18);

          objc_msgSend(v17, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v19);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
      v15 = v31;
    }

    objc_msgSend(v13, "fetchDictionariesByPHClassForOIDs:propertyHint:includeTrash:overrideWithPHClass:", v15, v8, 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKey:", objc_opt_class());
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("uuid"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "_createExtendedPropertySetsIfNeededWithPropertyHint:fetchDictionary:", v8, v24);
          objc_msgSend(v26, "addFetchPropertyHint:", v8);

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v21);
    }

    v6 = v29;
    v5 = v30;
    v7 = v28;
  }

}

+ (id)quickClassificationFaceAdjustmentVersion
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
}

+ (int64_t)countOfAssetsWithLocationFromUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  if (!a3)
    return 0;
  v5 = a3;
  objc_msgSend(a4, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("locationData != nil && uuid in %@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setInternalPredicate:", v7);
  objc_msgSend(v6, "setInternalSortDescriptors:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v6, "setShouldPrefetchCount:", 1);
  objc_msgSend(v6, "setWantsIncrementalChangeDetails:", 0);
  +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return v9;
}

+ (id)fetchAssetsGroupedByFaceUUIDForFaces:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("PHAssetPropertySetCore");
  v9[1] = CFSTR("PHAssetPropertySetOriginalMetadata");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchAssetsGroupedByFaceUUIDForFaces:fetchPropertySets:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchAssetsGroupedByFaceUUIDForFaces:(id)a3 fetchPropertySets:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__19039;
  v34 = __Block_byref_object_dispose__19040;
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v5;
  v9 = 0;
  v10 = 0;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

        if (!v9)
        {
          objc_msgSend(v14, "photoLibrary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "photoLibrary");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v16;
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v11);
  }

  v17 = (void *)MEMORY[0x1E0D71880];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __66__PHAsset_fetchAssetsGroupedByFaceUUIDForFaces_fetchPropertySets___block_invoke;
  v22[3] = &unk_1E35DC078;
  v18 = v10;
  v23 = v18;
  v19 = v6;
  v24 = v19;
  v25 = &v30;
  if (MEMORY[0x19AEBEEFC](objc_msgSend(v17, "batchFetchAssetsByFaceUUIDWithFaceUUIDs:library:completion:", v7, v9, v22)))
    plslogGreenTeaReadingPhotosOrVideos();
  v20 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  return v20;
}

+ (id)fetchAssetsContainingAllPersons:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  PHFetchResult *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__PHAsset_fetchAssetsContainingAllPersons_options___block_invoke;
    v14[3] = &unk_1E35DECB8;
    v15 = v5;
    v16 = v9;
    v11 = v9;
    +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v10, v14);
    v12 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = objc_alloc_init(PHFetchResult);
  }

  return v12;
}

+ (id)fetchAssetsInBoundingBoxWithTopLeftLocation:(id)a3 bottomRightLocation:(id)a4 options:(id)a5
{
  void *v5;
  void *v6;

  +[PHQuery queryForAssetsInBoundingBoxWithTopLeftLocation:bottomRightLocation:options:](PHQuery, "queryForAssetsInBoundingBoxWithTopLeftLocation:bottomRightLocation:options:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchAssetsInImportSessions:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[PHQuery queryForAssetsInImportSessions:options:](PHQuery, "queryForAssetsInImportSessions:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchAssetsWithoutOriginalsInAssetCollection:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", 0, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("master != nil && (SUBQUERY(master.resources, $r, $r.type == %ul AND $r.isLocallyAvailable == NO).@count != 0)"), 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalPredicate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = v8;
  if (v9)
  {
    v12 = (void *)MEMORY[0x1E0CB3528];
    v16[0] = v9;
    v16[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "setInternalPredicate:", v11);
  objc_msgSend(a1, "fetchAssetsInAssetCollection:options:", v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (PHFetchResult)fetchAssetsWithMediaType:(PHAssetMediaType)mediaType options:(PHFetchOptions *)options
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PHAsset_fetchAssetsWithMediaType_options___block_invoke;
  v5[3] = &__block_descriptor_40_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v5[4] = mediaType;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", options, v5);
  return (PHFetchResult *)(id)objc_claimAutoreleasedReturnValue();
}

+ (PHFetchResult)fetchAssetsWithLocalIdentifiers:(NSArray *)identifiers options:(PHFetchOptions *)options
{
  NSArray *v5;
  NSArray *v6;
  void *v7;
  _QWORD v9[4];
  NSArray *v10;

  v5 = identifiers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PHAsset_fetchAssetsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", options, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHFetchResult *)v7;
}

+ (id)fetchAssetsWithUUIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__PHAsset_fetchAssetsWithUUIDs_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchAssetsWithCloudIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PHAsset_fetchAssetsWithCloudIdentifiers_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (PHFetchResult)fetchAssetsWithALAssetURLs:(NSArray *)assetURLs options:(PHFetchOptions *)options
{
  NSArray *v5;
  PHFetchOptions *v6;
  PHFetchResult *v7;
  _QWORD v9[4];
  NSArray *v10;

  v5 = assetURLs;
  v6 = options;
  if (!-[NSArray count](v5, "count"))
    goto LABEL_3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__PHAsset_fetchAssetsWithALAssetURLs_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, v9);
  v7 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  if (!v7)
LABEL_3:
    v7 = objc_alloc_init(PHFetchResult);

  return v7;
}

+ (PHFetchResult)fetchAssetsWithBurstIdentifier:(NSString *)burstIdentifier options:(PHFetchOptions *)options
{
  NSString *v5;
  NSString *v6;
  void *v7;
  _QWORD v9[4];
  NSString *v10;

  v5 = burstIdentifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PHAsset_fetchAssetsWithBurstIdentifier_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", options, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHFetchResult *)v7;
}

+ (PHFetchResult)fetchKeyAssetsInAssetCollection:(PHAssetCollection *)assetCollection options:(PHFetchOptions *)options
{
  PHAssetCollection *v5;
  PHFetchOptions *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;

  v5 = assetCollection;
  v6 = options;
  if (!v5
    || -[PHObject isTransient](v5, "isTransient")
    || -[PHAssetCollection isPrivacySensitiveAlbum](v5, "isPrivacySensitiveAlbum"))
  {
    v7 = 0;
  }
  else
  {
    +[PHQuery queryForKeyAssetsInAssetCollection:options:](PHQuery, "queryForKeyAssetsInAssetCollection:options:", v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executeQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v6, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAssetCollection transientAssetCollectionWithAssets:title:identifier:photoLibrary:](PHAssetCollection, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], CFSTR("keys"), CFSTR("transientkeyassets"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v11, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return (PHFetchResult *)v7;
}

+ (PHFetchResult)fetchAssetsWithOptions:(PHFetchOptions *)options
{
  return (PHFetchResult *)+[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", options, &__block_literal_global_583);
}

+ (id)fetchGuestAssetsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_584);
}

+ (id)fetchGuestAssetsInCollectionContainingAsset:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__PHAsset_fetchGuestAssetsInCollectionContainingAsset_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchAssetsForPerson:(id)a3 faceCount:(unint64_t)a4 options:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)MEMORY[0x1E0CB3880];
  v10 = a5;
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K.@count == %lu"), CFSTR("detectedFaces"), a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "internalPredicate");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
  {
    v16 = (void *)MEMORY[0x1E0CB3528];
    v21[0] = v14;
    v21[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInternalPredicate:", v18);

  }
  else
  {
    objc_msgSend(v13, "setInternalPredicate:", v11);
  }
  objc_msgSend(a1, "fetchAssetsForPerson:options:", v8, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)fetchKeyAssetForPerson:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHQuery queryForKeyAssetForPerson:options:](PHQuery, "queryForKeyAssetForPerson:options:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "executeQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)fetchAssetsForPerson:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fetchAssetsForPersons:options:", v9, v7, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)fetchAssetsForPersons:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__PHAsset_fetchAssetsForPersons_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchExclusiveAssetsForSocialGroup:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[PHGraphQuery graphQueryForExclusiveAssetsForSocialGroup:options:](PHGraphQuery, "graphQueryForExclusiveAssetsForSocialGroup:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchInclusiveAssetsForSocialGroup:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[PHGraphQuery graphQueryForInclusiveAssetsForSocialGroup:options:](PHGraphQuery, "graphQueryForInclusiveAssetsForSocialGroup:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchKeyAssetForSocialGroup:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(a1, "fetchKeyAssetForSocialGroup:createIfNeeded:options:", a3, 0, a4);
}

+ (id)fetchKeyAssetForSocialGroup:(id)a3 createIfNeeded:(BOOL)a4 options:(id)a5
{
  void *v5;
  void *v6;

  +[PHGraphQuery graphQueryForKeyAssetForSocialGroup:createIfNeeded:options:](PHGraphQuery, "graphQueryForKeyAssetForSocialGroup:createIfNeeded:options:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchCollageAssetsForDayHighlight:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PHAsset_fetchCollageAssetsForDayHighlight_options___block_invoke;
  v11[3] = &unk_1E35DECB8;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchAssetsForFaces:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__PHAsset_fetchAssetsForFaces_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchAssetsForFaceGroups:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__PHAsset_fetchAssetsForFaceGroups_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchAssetsForComment:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[PHQuery queryForAssetsForComment:options:](PHQuery, "queryForAssetsForComment:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchKeyAssetForSceneIdentifier:(unsigned int)a3 aboveConfidenceThreshold:(double)a4 minimumSceneAnalysisVersion:(signed __int16)a5 options:(id)a6
{
  return (id)objc_msgSend(a1, "fetchKeyAssetForExtendedSceneIdentifier:aboveConfidenceThreshold:minimumSceneAnalysisVersion:options:", a3, a5, a6, a4);
}

+ (id)fetchKeyAssetForExtendedSceneIdentifier:(unint64_t)a3 aboveConfidenceThreshold:(double)a4 minimumSceneAnalysisVersion:(signed __int16)a5 options:(id)a6
{
  int v6;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD *v31;
  uint64_t *v32;
  _QWORD v33[5];
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[2];

  v6 = a5;
  v41[1] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  objc_msgSend(v11, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset.m"), 3763, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71AB0], "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fetchRequestWithEntityName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSortDescriptors:", v19);

  objc_msgSend(v17, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sceneIdentifier == %lld && confidence > %f && assetAttributes.asset.additionalAttributes.sceneAnalysisVersion >= %i && assetAttributes.asset.hidden == NO && assetAttributes.asset.trashedState == %d"), a3, *(_QWORD *)&a4, v6, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPredicate:", v20);

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__19039;
  v39 = __Block_byref_object_dispose__19040;
  v40 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__19039;
  v33[4] = __Block_byref_object_dispose__19040;
  v34 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __112__PHAsset_fetchKeyAssetForExtendedSceneIdentifier_aboveConfidenceThreshold_minimumSceneAnalysisVersion_options___block_invoke;
  v28[3] = &unk_1E35DE5F8;
  v21 = v14;
  v29 = v21;
  v22 = v17;
  v30 = v22;
  v31 = v33;
  v32 = &v35;
  objc_msgSend(v21, "performBlockAndWait:", v28);
  v23 = (void *)v36[5];
  objc_msgSend(v11, "photoLibrary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pl_PHAssetFromPhotoLibrary:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);

  return v25;
}

+ (id)fetchAssetsWithObjectIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__PHAsset_fetchAssetsWithObjectIDs_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchVisibleAssetsWithObjectIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PHAsset_fetchVisibleAssetsWithObjectIDs_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchAssetsInAssetCollections:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (!v8 || objc_msgSend(v8, "count") != 1)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v5;
    v11 = (void *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v24 = v9;
      v25 = v5;
      v14 = 0;
      v15 = *(_QWORD *)v27;
      do
      {
        v16 = 0;
        v17 = v14;
        do
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v16);
          +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v18, v6, v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "fetchedObjectIDs");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObjectsFromArray:", v20);

          objc_msgSend(v18, "photoLibrary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = (char *)v16 + 1;
          v17 = v14;
        }
        while (v11 != v16);
        v11 = (void *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);

      if (!v14)
      {
        v11 = 0;
        v9 = v24;
        v5 = v25;
        goto LABEL_21;
      }
      objc_msgSend(v6, "photoLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v24;
      if (v21 != v14)
      {
        +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v14);
        v22 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v22;
      }
      v5 = v25;
      +[PHAsset fetchAssetsWithObjectIDs:options:](PHAsset, "fetchAssetsWithObjectIDs:options:", v12, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v13;
    }

LABEL_21:
    goto LABEL_22;
  }
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v11;
}

+ (id)fetchAssetsForKeywords:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__PHAsset_fetchAssetsForKeywords_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchReferencedAssetsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_595);
}

+ (id)fetchAllAssetsInYearRepresentedByYearHighlight:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PHAsset_fetchAllAssetsInYearRepresentedByYearHighlight_options___block_invoke;
  v11[3] = &unk_1E35DECB8;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchAssetsFromCameraSinceDate:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -300.0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__PHAsset_fetchAssetsFromCameraSinceDate_options___block_invoke;
  v11[3] = &unk_1E35DECB8;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchAssetsCapturedOrEdited:(BOOL)a3 onThisCameraSinceDate:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PHAsset_fetchAssetsCapturedOrEdited_onThisCameraSinceDate_options___block_invoke;
  v11[3] = &unk_1E35DA050;
  v13 = a3;
  v12 = v7;
  v8 = v7;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a5, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchAssetsInLibraryScope:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__PHAsset_fetchAssetsInLibraryScope_options___block_invoke;
  v11[3] = &unk_1E35DECB8;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchAssetsInLibraryScope:(id)a3 fromAssets:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __48__PHAsset_fetchAssetsInLibraryScope_fromAssets___block_invoke;
  v19 = &unk_1E35DA078;
  v20 = v8;
  v9 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v16);
  objc_msgSend(v6, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v9, v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInternalPredicate:", v13);

  +[PHAsset fetchAssetsInLibraryScope:options:](PHAsset, "fetchAssetsInLibraryScope:options:", v7, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)fetchAssetsWithCurrentUserAsLibraryScopeContributor:(BOOL)a3 inLibraryScope:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  v7 = a4;
  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__PHAsset_fetchAssetsWithCurrentUserAsLibraryScopeContributor_inLibraryScope_options___block_invoke;
  v13[3] = &unk_1E35DA0A0;
  v16 = a3;
  v14 = v7;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fetchAssetsInPreviewStateInLibraryScope:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__PHAsset_fetchAssetsInPreviewStateInLibraryScope_options___block_invoke;
  v11[3] = &unk_1E35DECB8;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchAssetsInPreviewStateWithSuggestedByClientType:(signed __int16)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  signed __int16 v11;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__PHAsset_fetchAssetsInPreviewStateWithSuggestedByClientType_options___block_invoke;
  v9[3] = &unk_1E35DA0C8;
  v11 = a3;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchAssetsInPreviewStateWithPhotosOrPhotosDeferredSuggestedByClientTypeWithOptions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__PHAsset_fetchAssetsInPreviewStateWithPhotosOrPhotosDeferredSuggestedByClientTypeWithOptions___block_invoke;
  v7[3] = &unk_1E35DFCC0;
  v8 = v3;
  v4 = v3;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchAssetsThroughGraphEdgesForPerson:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[PHGraphQuery graphQueryForAssetsForPerson:options:](PHGraphQuery, "graphQueryForAssetsForPerson:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchAssetsForSearchLookupIdentifier:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  os_signpost_id_t v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset.m"), 3920, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

    if (v7)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset.m"), 3921, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lookupIdentifier"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_8;
LABEL_3:
  PLPhotoKitGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, a1);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v7;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "UtilityCollectionFetch", "LookupIdentifier=%@", buf, 0xCu);
  }

  objc_msgSend(v8, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchIndex");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unverifiedPsiSearchIndex");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71AF0], "searchResultForLookupIdentifier:searchResultTypes:plPhotoLibrary:searchIndex:", v7, 1, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setIncludeHiddenAssets:", 0);
  objc_msgSend(v19, "setIncludeTrashedAssets:", 0);
  objc_msgSend(v19, "mergeWithFetchOptions:", v8);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__PHAsset_fetchAssetsForSearchLookupIdentifier_options___block_invoke;
  v26[3] = &unk_1E35DA0F0;
  v27 = v17;
  v28 = v12;
  v29 = v10;
  v20 = v12;
  v21 = v17;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v19, v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)fetchAssetsForPTPWithOptions:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset.m"), 3961, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__PHAsset_fetchAssetsForPTPWithOptions___block_invoke;
  v10[3] = &unk_1E35DFCC0;
  v11 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchAnyCinematicVideosNeedingDeferredProcessingWithOtions:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset.m"), 3969, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__PHAsset_fetchAnyCinematicVideosNeedingDeferredProcessingWithOtions___block_invoke;
  v10[3] = &unk_1E35DFCC0;
  v11 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v6, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_descriptionForVariationSuggestionType:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("unknown");
  else
    return off_1E35DA6B8[a3];
}

+ (id)_descriptionForVariationSuggestionStates:(unint64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("suggested"));
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("poor"));
  if ((v3 & 0x20) != 0)
LABEL_4:
    objc_msgSend(v5, "addObject:", CFSTR("seen"));
LABEL_5:
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("Unknown");
  }

  return v6;
}

+ (id)descriptionForPlaybackStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("unknown");
  else
    return off_1E35DA6D8[a3];
}

+ (id)descriptionForMediaType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E35DA708[a3 - 1];
}

+ (id)_descriptionForMediaSubtype:(unint64_t)a3
{
  id result;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;

  result = CFSTR("unknown");
  if ((uint64_t)a3 <= 1023)
  {
    if ((uint64_t)a3 > 15)
    {
      v14 = CFSTR("semantic enhance");
      v15 = CFSTR("HDR gain map");
      if (a3 != 512)
        v15 = CFSTR("unknown");
      if (a3 != 256)
        v14 = v15;
      v16 = CFSTR("deptheffect");
      v17 = CFSTR("animated");
      if (a3 != 64)
        v17 = CFSTR("unknown");
      if (a3 != 16)
        v16 = v17;
      if ((uint64_t)a3 <= 255)
        return (id)v16;
      else
        return (id)v14;
    }
    else
    {
      switch(a3)
      {
        case 0uLL:
          result = CFSTR("none");
          break;
        case 1uLL:
          result = CFSTR("panorama");
          break;
        case 2uLL:
          result = CFSTR("HDR");
          break;
        case 4uLL:
          result = CFSTR("screenshot");
          break;
        case 8uLL:
          result = CFSTR("livephoto");
          break;
        default:
          return result;
      }
    }
  }
  else
  {
    v4 = CFSTR("actioncam");
    v5 = CFSTR("high or extended dynamic range");
    v6 = CFSTR("smart style");
    if (a3 != 0x1000000)
      v6 = CFSTR("unknown");
    if (a3 != 0x800000)
      v5 = v6;
    if (a3 != 0x400000)
      v4 = v5;
    v7 = CFSTR("video HDR");
    v8 = CFSTR("cinematic video");
    if (a3 != 0x200000)
      v8 = CFSTR("unknown");
    if (a3 != 0x100000)
      v7 = v8;
    if ((uint64_t)a3 < 0x400000)
      v4 = v7;
    v9 = CFSTR("highframerate");
    v10 = CFSTR("timelapse");
    v11 = CFSTR("screenrecording");
    if (a3 != 0x80000)
      v11 = CFSTR("unknown");
    if (a3 != 0x40000)
      v10 = v11;
    if (a3 != 0x20000)
      v9 = v10;
    v12 = CFSTR("spatial media");
    v13 = CFSTR("streamedvideo");
    if (a3 != 0x10000)
      v13 = CFSTR("unknown");
    if (a3 != 1024)
      v12 = v13;
    if ((uint64_t)a3 < 0x20000)
      v9 = v12;
    if ((uint64_t)a3 < 0x100000)
      return (id)v9;
    else
      return (id)v4;
  }
  return result;
}

+ (id)descriptionForMediaSubtypes:(unint64_t)a3
{
  void *v4;
  uint64_t i;
  void *v7;
  __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 64; ++i)
  {
    if (((1 << i) & 0x1FF075F) != 0 && ((1 << i) & a3) != 0)
    {
      +[PHAsset _descriptionForMediaSubtype:](PHAsset, "_descriptionForMediaSubtype:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

    }
  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("none");
  }

  return v8;
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v21;
  void *v22;
  objc_super v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___PHAsset;
  objc_msgSendSuper2(&v23, sel_fetchPredicateFromComparisonPredicate_options_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_24;
  objc_msgSend(v6, "leftExpression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightExpression");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "expressionType") == 3)
  {
    objc_msgSend(v10, "keyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
LABEL_6:
    v14 = v13;
    goto LABEL_14;
  }
  if (objc_msgSend(v11, "expressionType") == 3)
  {
    objc_msgSend(v11, "keyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    goto LABEL_6;
  }
  if (objc_msgSend(v10, "expressionType") == 4 || objc_msgSend(v11, "expressionType") == 4)
  {
    objc_msgSend(v6, "predicateFormat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsString:", CFSTR("mediaSubtypes"));

    if (v16)
    {
      objc_msgSend(v9, "addObject:", CFSTR("mediaSubtypes"));
    }
    else
    {
      objc_msgSend(v6, "predicateFormat");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsString:", CFSTR("mediaSubtype"));

      if (v18)
        objc_msgSend(v9, "addObject:", CFSTR("mediaSubtype"));
    }
  }
  v14 = 0;
  v12 = 0;
LABEL_14:
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("mediaSubtypes")))
  {
    objc_msgSend(v9, "addObject:", CFSTR("mediaSubtypes"));
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("mediaSubtype")))
  {
    objc_msgSend(v9, "addObject:", CFSTR("mediaSubtype"));
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("adjustmentFormatIdentifier"))
         && !objc_msgSend(v14, "expressionType"))
  {
    v21 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v14, "constantValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("additionalAttributes.unmanagedAdjustment.adjustmentFormatIdentifier"), v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  v8 = 0;
LABEL_21:
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(a1, "_transformMediaSubtypeReferences:inComparisonPredicate:options:", v9, v6, v7);
    v19 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v19;
  }

LABEL_24:
  return v8;
}

+ (id)originalUniformTypeIdentifierForAsset:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__19039;
  v17 = __Block_byref_object_dispose__19040;
  v18 = 0;
  objc_msgSend(v3, "pl_photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PHAsset_originalUniformTypeIdentifierForAsset___block_invoke;
  v9[3] = &unk_1E35DEE50;
  v5 = v3;
  v10 = v5;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (BOOL)_isLibraryScopeExiting:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(v3, "pl_photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__PHAsset__isLibraryScopeExiting___block_invoke;
  v9[3] = &unk_1E35DEE50;
  v5 = v4;
  v10 = v5;
  v6 = v3;
  v11 = v6;
  v12 = &v13;
  objc_msgSend(v5, "performBlockAndWait:", v9);
  v7 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (BOOL)_libraryScopeAssetContributedByCurrentUser:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v3, "pl_photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PHAsset__libraryScopeAssetContributedByCurrentUser___block_invoke;
  v7[3] = &unk_1E35DF920;
  v5 = v3;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

+ (BOOL)isOriginalKnownUnsupportedFormatForAsset:(id)a3 failureInfo:(id *)a4
{
  return _IsOriginalKnownUnsupportedFormatForAsset(a3, 0, a4);
}

+ (BOOL)isOriginalVideoComplementKnownUnsupportedFormatForAsset:(id)a3 failureInfo:(id *)a4
{
  return _IsOriginalKnownUnsupportedFormatForAsset(a3, 1, a4);
}

void __54__PHAsset__libraryScopeAssetContributedByCurrentUser___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3528];
  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("self == %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeOnlyContentContributedByCurrentUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v11);

  objc_msgSend(v4, "setResultType:", 4);
  objc_msgSend(*(id *)(a1 + 32), "pl_photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v14 = objc_msgSend(v13, "countForFetchRequest:error:", v4, &v18);
  v15 = v18;

  if (v14 == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLPhotoKitGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v17;
      v21 = 2080;
      v22 = "+[PHAsset _libraryScopeAssetContributedByCurrentUser:]_block_invoke";
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "Failed to fetch asset %@ for %s: %@", buf, 0x20u);

    }
  }

}

void __34__PHAsset__isLibraryScopeExiting___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "libraryScope");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[NSObject exitState](v5, "exitState") != 0;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C97B48];
      objc_msgSend(MEMORY[0x1E0D71808], "entityName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("exitState"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPredicate:", v11);

      objc_msgSend(v10, "setResultType:", 4);
      objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v13 = objc_msgSend(v12, "countForFetchRequest:error:", v10, &v16);
      v14 = (char *)v16;

      if (v13 == 1)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      else if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        PLPhotoKitGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "+[PHAsset _isLibraryScopeExiting:]_block_invoke";
          v19 = 2112;
          v20 = v14;
          _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch exit library scope for %s: %@", buf, 0x16u);
        }

      }
      v6 = 0;
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      v19 = 2080;
      v20 = "+[PHAsset _isLibraryScopeExiting:]_block_invoke";
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch asset %@ for %s", buf, 0x16u);

    }
  }

}

void __49__PHAsset_originalUniformTypeIdentifierForAsset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "managedAssetForPhotoLibrary:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originalUniformTypeIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __70__PHAsset_fetchAnyCinematicVideosNeedingDeferredProcessingWithOtions___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForAnyCinematicVideosNeedingDeferredProcessingWithOtions:](PHQuery, "queryForAnyCinematicVideosNeedingDeferredProcessingWithOtions:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __40__PHAsset_fetchAssetsForPTPWithOptions___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForAssetsForPTPWithOptions:](PHQuery, "queryForAssetsForPTPWithOptions:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __56__PHAsset_fetchAssetsForSearchLookupIdentifier_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "assetUUIDs");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA60];
  +[PHAsset fetchAssetsWithUUIDs:options:](PHAsset, "fetchAssetsWithUUIDs:options:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(id *)(a1 + 40);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v13 = 134217984;
    v14 = objc_msgSend(v8, "count");
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v10, OS_SIGNPOST_INTERVAL_END, v11, "UtilityCollectionFetch", "Count=%lu", (uint8_t *)&v13, 0xCu);
  }

  return v8;
}

id __95__PHAsset_fetchAssetsInPreviewStateWithPhotosOrPhotosDeferredSuggestedByClientTypeWithOptions___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForAssetsInPreviewStateWithSuggestedByClientTypes:options:](PHQuery, "queryForAssetsInPreviewStateWithSuggestedByClientTypes:options:", &unk_1E36572E8, *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __70__PHAsset_fetchAssetsInPreviewStateWithSuggestedByClientType_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForAssetsInPreviewStateWithSuggestedByClientTypes:options:](PHQuery, "queryForAssetsInPreviewStateWithSuggestedByClientTypes:options:", v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __59__PHAsset_fetchAssetsInPreviewStateInLibraryScope_options___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForAssetsInPreviewStateInLibraryScope:options:](PHQuery, "queryForAssetsInPreviewStateInLibraryScope:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __86__PHAsset_fetchAssetsWithCurrentUserAsLibraryScopeContributor_inLibraryScope_options___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForAssetsWithCurrentUserAsLibraryScopeContributor:inLibraryScope:options:](PHQuery, "queryForAssetsWithCurrentUserAsLibraryScopeContributor:inLibraryScope:options:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __48__PHAsset_fetchAssetsInLibraryScope_fromAssets___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

id __45__PHAsset_fetchAssetsInLibraryScope_options___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForAssetsInLibraryScope:options:](PHQuery, "queryForAssetsInLibraryScope:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __69__PHAsset_fetchAssetsCapturedOrEdited_onThisCameraSinceDate_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    +[PHQuery queryForAssetsEditedOnThisCameraSinceDate:options:](PHQuery, "queryForAssetsEditedOnThisCameraSinceDate:options:", v2, a2);
  else
    +[PHQuery queryForAssetsCapturedOnThisCameraSinceDate:options:](PHQuery, "queryForAssetsCapturedOnThisCameraSinceDate:options:", v2, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __50__PHAsset_fetchAssetsFromCameraSinceDate_options___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForAssetsFromCameraSinceDate:options:](PHQuery, "queryForAssetsFromCameraSinceDate:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __66__PHAsset_fetchAllAssetsInYearRepresentedByYearHighlight_options___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForAllAssetsInYearRepresentedByYearHighlight:options:](PHQuery, "queryForAllAssetsInYearRepresentedByYearHighlight:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __44__PHAsset_fetchReferencedAssetsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForReferencedAssetsWithOptions:](PHQuery, "queryForReferencedAssetsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __42__PHAsset_fetchAssetsForKeywords_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsForKeywords:options:](PHQuery, "queryForAssetsForKeywords:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __51__PHAsset_fetchVisibleAssetsWithObjectIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForVisibleAssetsWithObjectIDs:options:](PHQuery, "queryForVisibleAssetsWithObjectIDs:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __44__PHAsset_fetchAssetsWithObjectIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsWithObjectIDs:options:](PHQuery, "queryForAssetsWithObjectIDs:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __112__PHAsset_fetchKeyAssetForExtendedSceneIdentifier_aboveConfidenceThreshold_minimumSceneAnalysisVersion_options___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "asset");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

id __44__PHAsset_fetchAssetsForFaceGroups_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsForFaceGroups:options:](PHQuery, "queryForAssetsForFaceGroups:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __39__PHAsset_fetchAssetsForFaces_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsForFaces:options:](PHQuery, "queryForAssetsForFaces:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __53__PHAsset_fetchCollageAssetsForDayHighlight_options___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PHQuery queryForCollageAssetsInDayHighlight:options:](PHQuery, "queryForCollageAssetsInDayHighlight:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "executeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __41__PHAsset_fetchAssetsForPersons_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsForPersons:options:](PHQuery, "queryForAssetsForPersons:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __63__PHAsset_fetchGuestAssetsInCollectionContainingAsset_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForGuestAssetsInCollectionContainingAsset:options:](PHQuery, "queryForGuestAssetsInCollectionContainingAsset:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __39__PHAsset_fetchGuestAssetsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForGuestAssetsWithOptions:](PHQuery, "queryForGuestAssetsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __34__PHAsset_fetchAssetsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsWithOptions:](PHQuery, "queryForAssetsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __50__PHAsset_fetchAssetsWithBurstIdentifier_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsWithBurstIdentifier:options:](PHQuery, "queryForAssetsWithBurstIdentifier:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __46__PHAsset_fetchAssetsWithALAssetURLs_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0D71880], "uuidFromAssetURL:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v4, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __51__PHAsset_fetchAssetsWithCloudIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsWithCloudIdentifiers:options:](PHQuery, "queryForAssetsWithCloudIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __40__PHAsset_fetchAssetsWithUUIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsWithUUIDs:options:](PHQuery, "queryForAssetsWithUUIDs:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __51__PHAsset_fetchAssetsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsWithLocalIdentifiers:options:](PHQuery, "queryForAssetsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __44__PHAsset_fetchAssetsWithMediaType_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsWithMediaType:options:](PHQuery, "queryForAssetsWithMediaType:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

PHFetchResult *__51__PHAsset_fetchAssetsContainingAllPersons_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  PHFetchResult *v13;
  PHFetchResult *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v8), "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__19039;
  v24 = __Block_byref_object_dispose__19040;
  v25 = 0;
  v10 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__PHAsset_fetchAssetsContainingAllPersons_options___block_invoke_2;
  v16[3] = &unk_1E35DEE50;
  v19 = &v20;
  v11 = v4;
  v17 = v11;
  v18 = *(id *)(a1 + 40);
  objc_msgSend(v10, "performBlockAndWait:", v16);
  v12 = v21[5];
  if (v12)
  {
    +[PHAsset fetchVisibleAssetsWithObjectIDs:options:](PHAsset, "fetchVisibleAssetsWithObjectIDs:options:", v12, v3);
    v13 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_alloc_init(PHFetchResult);
  }
  v14 = v13;

  _Block_object_dispose(&v20, 8);
  return v14;
}

void __51__PHAsset_fetchAssetsContainingAllPersons_options___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D716C8], "assetIDsWithAllPersonsFromPersonIDs:inContext:", a1[4], a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66__PHAsset_fetchAssetsGroupedByFaceUUIDForFaces_fetchPropertySets___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__PHAsset_fetchAssetsGroupedByFaceUUIDForFaces_fetchPropertySets___block_invoke_2;
  v10[3] = &unk_1E35D9FC8;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v9 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v9);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __66__PHAsset_fetchAssetsGroupedByFaceUUIDForFaces_fetchPropertySets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  PHAssetPLAdapter *v8;

  v5 = a3;
  v6 = a2;
  v8 = -[PHObjectPLAdapter initWithPLManagedObject:photoLibrary:]([PHAssetPLAdapter alloc], "initWithPLManagedObject:photoLibrary:", v5, *(_QWORD *)(a1 + 32));

  v7 = -[PHAssetPLAdapter newObjectWithPropertySets:](v8, "newObjectWithPropertySets:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, v6);

}

void __44__PHAsset_propertySetAccessorsByPropertySet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[32];
  _QWORD v4[33];

  v4[32] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PHAssetPropertySetIdentifier");
  v3[1] = CFSTR("PHAssetPropertySetCore");
  v4[0] = CFSTR("self");
  v4[1] = CFSTR("self");
  v3[2] = CFSTR("PHAssetPropertySetPlacesCore");
  v3[3] = CFSTR("PHAssetPropertySetOriginalMetadata");
  v4[2] = CFSTR("self");
  v4[3] = CFSTR("originalMetadataProperties");
  v3[4] = CFSTR("PHAssetPropertySetPhotosOneUp");
  v3[5] = CFSTR("PHAssetPropertySetLocalDate");
  v4[4] = CFSTR("photosOneUpProperties");
  v4[5] = CFSTR("localDateProperties");
  v3[6] = CFSTR("PHAssetPropertySetPhotosInfoPanelExtended");
  v3[7] = CFSTR("PHAssetPropertySetPhotosSmartStyleExtended");
  v4[6] = CFSTR("photosInfoPanelExtendedProperties");
  v4[7] = CFSTR("photosSmartStyleExtendedProperties");
  v3[8] = CFSTR("PHAssetPropertySetPhotoIris");
  v3[9] = CFSTR("PHAssetPropertySetDescription");
  v4[8] = CFSTR("photoIrisProperties");
  v4[9] = CFSTR("descriptionProperties");
  v3[10] = CFSTR("PHAssetPropertySetCloudShared");
  v3[11] = CFSTR("PHAssetPropertySetComments");
  v4[10] = CFSTR("cloudSharedProperties");
  v4[11] = CFSTR("commentProperties");
  v3[12] = CFSTR("PHAssetPropertySetSceneAnalysis");
  v3[13] = CFSTR("PHAssetPropertySetAnalysisState");
  v4[12] = CFSTR("sceneAnalysisProperties");
  v4[13] = CFSTR("assetAnalysisStateProperties");
  v3[14] = CFSTR("PHAssetPropertySetUserActivity");
  v3[15] = CFSTR("PHAssetPropertySetFaceWorker");
  v4[14] = CFSTR("assetUserActivityProperties");
  v4[15] = CFSTR("self");
  v3[16] = CFSTR("PHAssetPropertySetImageManager");
  v3[17] = CFSTR("PHAssetPropertySetCuration");
  v4[16] = CFSTR("self");
  v4[17] = CFSTR("curationProperties");
  v3[18] = CFSTR("PHAssetPropertySetAesthetic");
  v3[19] = CFSTR("PHAssetPropertySetMediaAnalysis");
  v4[18] = CFSTR("aestheticProperties");
  v4[19] = CFSTR("mediaAnalysisProperties");
  v3[20] = CFSTR("PHAssetPropertySetCharacterRecognition");
  v3[21] = CFSTR("PHAssetPropertySetVisualSearch");
  v4[20] = CFSTR("characterRecognitionProperties");
  v4[21] = CFSTR("visualSearchProperties");
  v3[22] = CFSTR("PHAssetPropertySetImport");
  v3[23] = CFSTR("PHAssetPropertySetSceneprint");
  v4[22] = CFSTR("importProperties");
  v4[23] = CFSTR("sceneprintProperties");
  v3[24] = CFSTR("PHAssetPropertySetDestinationAssetCopy");
  v3[25] = CFSTR("PHAssetPropertySetKeywords");
  v4[24] = CFSTR("destinationAssetCopyProperties");
  v4[25] = CFSTR("keywordProperties");
  v3[26] = CFSTR("PHAssetPropertySetGridMetadata");
  v3[27] = CFSTR("PHAssetPropertySetCoarseLocation");
  v4[26] = CFSTR("gridMetadataProperties");
  v4[27] = CFSTR("coarseLocationProperties");
  v3[28] = CFSTR("PHAssetPropertySetLibraryScope");
  v3[29] = CFSTR("PHAssetPropertySetCloudLocalState");
  v4[28] = CFSTR("libraryScopeProperties");
  v4[29] = CFSTR("cloudLocalStateProperties");
  v3[30] = CFSTR("PHAssetPropertySetStoryPlayback");
  v3[31] = CFSTR("PHAssetPropertySetIconicScore");
  v4[30] = CFSTR("StoryPlaybackProperties");
  v4[31] = CFSTR("iconicScoreProperties");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 32);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertySetAccessorsByPropertySet_pl_once_object_21;
  propertySetAccessorsByPropertySet_pl_once_object_21 = v1;

}

void __42__PHAsset_propertySetClassForPropertySet___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[38];
  _QWORD v4[39];

  v4[38] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PHAssetPropertySetIdentifier");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("PHAssetPropertySetCore");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("PHAssetPropertySetPlacesCore");
  v4[2] = objc_opt_class();
  v3[3] = CFSTR("PHAssetPropertySetOriginalMetadata");
  v4[3] = objc_opt_class();
  v3[4] = CFSTR("PHAssetPropertySetPhotosOneUp");
  v4[4] = objc_opt_class();
  v3[5] = CFSTR("PHAssetPropertySetLocalDate");
  v4[5] = objc_opt_class();
  v3[6] = CFSTR("PHAssetPropertySetPhotosInfoPanelExtended");
  v4[6] = objc_opt_class();
  v3[7] = CFSTR("PHAssetPropertySetPhotosSmartStyleExtended");
  v4[7] = objc_opt_class();
  v3[8] = CFSTR("PHAssetPropertySetPhotosInfoPanelLocation");
  v4[8] = objc_opt_class();
  v3[9] = CFSTR("PHAssetPropertySetPhotoIris");
  v4[9] = objc_opt_class();
  v3[10] = CFSTR("PHAssetPropertySetDescription");
  v4[10] = objc_opt_class();
  v3[11] = CFSTR("PHAssetPropertySetCloudShared");
  v4[11] = objc_opt_class();
  v3[12] = CFSTR("PHAssetPropertySetComments");
  v4[12] = objc_opt_class();
  v3[13] = CFSTR("PHAssetPropertySetSceneAnalysis");
  v4[13] = objc_opt_class();
  v3[14] = CFSTR("PHAssetPropertySetAnalysisState");
  v4[14] = objc_opt_class();
  v3[15] = CFSTR("PHAssetPropertySetUserActivity");
  v4[15] = objc_opt_class();
  v3[16] = CFSTR("PHAssetPropertySetFaceWorker");
  v4[16] = objc_opt_class();
  v3[17] = CFSTR("PHAssetPropertySetImageManager");
  v4[17] = objc_opt_class();
  v3[18] = CFSTR("PHAssetPropertySetCuration");
  v4[18] = objc_opt_class();
  v3[19] = CFSTR("PHAssetPropertySetAesthetic");
  v4[19] = objc_opt_class();
  v3[20] = CFSTR("PHAssetPropertySetMediaAnalysis");
  v4[20] = objc_opt_class();
  v3[21] = CFSTR("PHAssetPropertySetPhotoAnalysisWallpaperProperties");
  v4[21] = objc_opt_class();
  v3[22] = CFSTR("PHAssetPropertySetCharacterRecognition");
  v4[22] = objc_opt_class();
  v3[23] = CFSTR("PHAssetPropertySetVisualSearch");
  v4[23] = objc_opt_class();
  v3[24] = CFSTR("PHAssetPropertySetImport");
  v4[24] = objc_opt_class();
  v3[25] = CFSTR("PHAssetPropertySetSceneprint");
  v4[25] = objc_opt_class();
  v3[26] = CFSTR("PHAssetPropertySetDestinationAssetCopy");
  v4[26] = objc_opt_class();
  v3[27] = CFSTR("PHAssetPropertySetKeywords");
  v4[27] = objc_opt_class();
  v3[28] = CFSTR("PHAssetPropertySetGridMetadata");
  v4[28] = objc_opt_class();
  v3[29] = CFSTR("PHAssetPropertySetCoarseLocation");
  v4[29] = objc_opt_class();
  v3[30] = CFSTR("PHAssetPropertySetLibraryScope");
  v4[30] = objc_opt_class();
  v3[31] = CFSTR("PHAssetPropertySetCameraCaptureDevice");
  v4[31] = objc_opt_class();
  v3[32] = CFSTR("PHAssetPropertySetCloudLocalState");
  v4[32] = objc_opt_class();
  v3[33] = CFSTR("PHAssetPropertySetMontage");
  v4[33] = objc_opt_class();
  v3[34] = CFSTR("PHAssetPropertySetLocationData");
  v4[34] = objc_opt_class();
  v3[35] = CFSTR("PHAssetPropertySetPTP");
  v4[35] = objc_opt_class();
  v3[36] = CFSTR("PHAssetPropertySetIconicScore");
  v4[36] = objc_opt_class();
  v3[37] = CFSTR("PHAssetPropertySetStoryPlayback");
  v4[37] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 38);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertySetClassForPropertySet__pl_once_object_20;
  propertySetClassForPropertySet__pl_once_object_20 = v1;

}

void __74__PHAsset__transformMediaSubtypeReferences_inComparisonPredicate_options___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];
  _QWORD v19[2];
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _PHAllAssetMediaSubtypes();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v5);
        v22 = CFSTR("mediaSubtypes");
        v23 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "addObject:", v7);

        v20 = CFSTR("mediaSubtype");
        v21 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "addObject:", v8);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
    }
    while (v3);
  }
  v18[0] = CFSTR("mediaSubtype");
  v9 = (void *)objc_msgSend(v0, "copy");
  v18[1] = CFSTR("mediaSubtypes");
  v19[0] = v9;
  v10 = (void *)objc_msgSend(v1, "copy");
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_transformMediaSubtypeReferences_inComparisonPredicate_options___allSubtypesByMediaSubtypeKey;
  _transformMediaSubtypeReferences_inComparisonPredicate_options___allSubtypesByMediaSubtypeKey = v11;

}

void __47__PHAsset_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[16];

  v4[15] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("creationDate");
  v4[1] = CFSTR("modificationDate");
  v4[2] = CFSTR("pixelWidth");
  v4[3] = CFSTR("pixelHeight");
  v4[4] = CFSTR("duration");
  v4[5] = CFSTR("favorite");
  v4[6] = CFSTR("isFavorite");
  v4[7] = CFSTR("hidden");
  v4[8] = CFSTR("isHidden");
  v4[9] = CFSTR("burstIdentifier");
  v4[10] = CFSTR("playbackStyle");
  v4[11] = CFSTR("playbackVariation");
  v4[12] = CFSTR("hdrGain");
  v4[13] = CFSTR("analysisStateModificationDate");
  v4[14] = CFSTR("curationProperties.importedByBundleIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 15);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_19448;
  transformValueExpression_forKeyPath___passThroughSet_19448 = v2;

}

id __47__PHAsset_transformValueExpression_forKeyPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "integerValue");
    v4 = 0x2000100000003uLL >> (16 * v3);
    if (v3 >= 4)
      LOBYTE(v4) = 3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4 & 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __37__PHAsset_propertiesToFetchWithHint___block_invoke_298(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_19478;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "_composePropertiesToFetchWithHint:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_19478;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, v11);

  }
}

void __40__PHAsset_imageManagerPropertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[19];

  v3[18] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("savedAssetType");
  v3[1] = CFSTR("bundleScope");
  v3[2] = CFSTR("cloudPlaceholderKind");
  v3[3] = CFSTR("avalanchePickType");
  v3[4] = CFSTR("avalancheKind");
  v3[5] = CFSTR("filename");
  v3[6] = CFSTR("adjustmentsState");
  v3[7] = CFSTR("width");
  v3[8] = CFSTR("height");
  v3[9] = CFSTR("uniformTypeIdentifier");
  v3[10] = CFSTR("thumbnailIndex");
  v3[11] = CFSTR("kind");
  v3[12] = CFSTR("kindSubtype");
  v3[13] = CFSTR("directory");
  v3[14] = CFSTR("complete");
  v3[15] = CFSTR("dateCreated");
  v3[16] = CFSTR("originalColorSpace");
  v3[17] = CFSTR("imageRequestHints");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 18);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)imageManagerPropertiesToFetch_pl_once_object_17;
  imageManagerPropertiesToFetch_pl_once_object_17 = v1;

}

void __38__PHAsset_faceWorkerPropertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("width");
  v3[1] = CFSTR("height");
  v3[2] = CFSTR("adjustmentTimestamp");
  v3[3] = CFSTR("dateCreated");
  v3[4] = CFSTR("faceAdjustmentVersion");
  v3[5] = CFSTR("additionalAttributes.faceAnalysisVersion");
  v3[6] = CFSTR("kind");
  v3[7] = CFSTR("uniformTypeIdentifier");
  v3[8] = CFSTR("filename");
  v3[9] = CFSTR("directory");
  v3[10] = CFSTR("adjustmentsState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 11);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)faceWorkerPropertiesToFetch_pl_once_object_16;
  faceWorkerPropertiesToFetch_pl_once_object_16 = v1;

}

- (NSNumber)livePhotoSRLCompensationAmount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;

  if (-[PHAsset hasAdjustments](self, "hasAdjustments"))
  {
    v3 = 0;
  }
  else
  {
    -[PHAsset originalImageProperties](self, "originalImageProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("58"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "unsignedIntValue");
    if (v7 < 0x80000001)
    {
      v3 = 0;
    }
    else
    {
      *(float *)&v8 = (float)v7 * 0.0039062;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return (NSNumber *)v3;
}

- (id)objectReference
{
  return +[PHAssetReference referenceForAsset:](PHAssetReference, "referenceForAsset:", self);
}

+ (id)fetchAssetsForReferences:(id)a3 photoLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  PHLocalIdentifierForObjectReferencesAndLibrary((uint64_t)a3, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIsExclusivePredicate:", 1);
  objc_msgSend(a1, "fetchAssetsWithLocalIdentifiers:options:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)syndicationEligibility
{
  int v3;
  void *v5;
  int v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  PHAssetSourceType v18;
  int64_t v19;

  v3 = -[PHAsset syndicationState](self, "syndicationState");
  if (-[PHAsset thumbnailIndex](self, "thumbnailIndex") == 0x7FFFFFFFFFFFFFFFLL)
    return -6;
  if ((v3 & 0xFFFFFFFD) != 0)
    return -5;
  -[PHAsset sceneAnalysisProperties](self, "sceneAnalysisProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sceneAnalysisVersion");
  objc_msgSend(MEMORY[0x1E0D718C8], "currentSceneVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if (v8 > v6)
    return -4;
  -[PHAsset curationScore](self, "curationScore");
  if (v9 == 0.0)
    return -2;
  -[PHAsset curationScore](self, "curationScore");
  if (v10 < *MEMORY[0x1E0D71C58])
    return 0;
  -[PHAsset curationProperties](self, "curationProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "importedByBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0D71FC0]);

  if (!v13)
    return 0;
  -[PHAsset faceAdjustmentVersion](self, "faceAdjustmentVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAsset mediaAnalysisProperties](self, "mediaAnalysisProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "syndicationProcessingVersion");

  v17 = 65556;
  if (!v14)
    v17 = 20;
  if (v16 != v17)
    return -1;
  v18 = -[PHAsset sourceType](self, "sourceType");
  v19 = -3;
  if (v14)
    v19 = 1;
  if (v18 == 32)
    return 2;
  else
    return v19;
}

- (NSString)syndicatedAppDisplayName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PHAsset curationProperties](self, "curationProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importedByBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importedByDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (PLShouldConstructDisplayNameForAppBundle())
  {
    PLSyndicatedDisplayNameForAppBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

+ (id)fetchAssetsWithSyndicationIdentifiers:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(a1, "fetchAssetsWithSyndicationIdentifiers:options:includeRejected:", a3, a4, 0);
}

+ (id)fetchAssetsWithSyndicationIdentifiers:(id)a3 options:(id)a4 includeRejected:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;

  v5 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset+Syndicated.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchOptions.photoLibrary != nil"));

  }
  objc_msgSend(v9, "internalPredicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset+Syndicated.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchOptions.internalPredicate == nil"));

  }
  v13 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(a1, "predicateForSyndicatedAssetIdentifiers:includeRejected:", v10, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setInternalPredicate:", v14);
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v13, &__block_literal_global_34107);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)fetchSyndicatedAssetsWithOptions:(id)a3
{
  return (id)objc_msgSend(a1, "fetchSyndicatedAssetsWithOptions:includeRejected:", a3, 0);
}

+ (id)fetchSyndicatedAssetsWithOptions:(id)a3 includeRejected:(BOOL)a4
{
  return (id)objc_msgSend(a1, "fetchAssetsWithSyndicationIdentifiers:options:includeRejected:", 0, a3, a4);
}

+ (id)filterPredicateForUnsavedSyndicationAssets
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K < %d"), CFSTR("syndicationState"), 2);
}

+ (id)filterPredicateForSavedSyndicationAssetsOnly
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("syndicationState"), 2);
}

+ (id)filterPredicateToIncludeOnlyReceivedSyndicatedAssets
{
  return (id)objc_msgSend(MEMORY[0x1E0D71880], "filterPredicateToIncludeOnlyReceivedSyndicatedAssets");
}

+ (id)filterPredicateToExcludeNoSyndicationAssets
{
  return (id)objc_msgSend(MEMORY[0x1E0D71880], "filterPredicateToExcludeNoSyndicationAssets");
}

+ (id)predicateForSyndicatedAssetIdentifiers:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForSyndicatedAssetIdentifiers:includeRejected:", a3, 0);
}

+ (id)predicateForSyndicatedAssetIdentifiers:(id)a3 includeRejected:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D71880], "predicateForSyndicatedAssetIdentifiers:includeRejected:", a3, a4);
}

+ (id)senderIdentifierByAssetUUIDForAssets:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  __int128 v33;
  id v36;
  id obj;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  _QWORD v50[2];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v43;
    *(_QWORD *)&v6 = 138543362;
    v33 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(v11, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "curationProperties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset+Syndicated.m"), 303, CFSTR("Expecting PHAsset to have curationProperties pre-loaded"));

        }
        objc_msgSend(v14, "syndicationIdentifier", v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v14, "importedByBundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = v16;

            objc_msgSend(v36, "setObject:forKeyedSubscript:", v13, v15);
            objc_msgSend(v4, "addObject:", v15);
            v8 = v17;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHAsset+Syndicated.m"), 313, CFSTR("Expecting bundle identifier to be non-nil for a syndicated asset"));

            v17 = 0;
          }
        }
        else
        {
          PLPhotoKitGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v33;
            v47 = (uint64_t)v13;
            _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Returning nil CSSearchableItem due to nil syndication identifier for asset: %{public}@", buf, 0xCu);
          }
        }

        objc_autoreleasePoolPop(v12);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = objc_msgSend(v4, "count");
  if (v21)
    v22 = v8 == 0;
  else
    v22 = 1;
  if (v22)
    goto LABEL_24;
  v23 = v21;
  v24 = *MEMORY[0x1E0CA6018];
  v50[0] = *MEMORY[0x1E0CA5F30];
  v50[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  PLCoreSpotlightSearchableItemsFromSyndicationIdentifiers();
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "count");
  if (v23 == v27)
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __60__PHAsset_Syndicated__senderIdentifierByAssetUUIDForAssets___block_invoke;
    v38[3] = &unk_1E35DDC60;
    v39 = v36;
    v40 = v26;
    v41 = v20;
    v28 = v26;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v38);

LABEL_24:
    v29 = v20;
    goto LABEL_28;
  }
  v30 = v27;
  PLPhotoKitGetLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    v47 = v23;
    v48 = 2048;
    v49 = v30;
    _os_log_impl(&dword_1991EC000, v31, OS_LOG_TYPE_ERROR, "Returning empty senderIdentifierByAssetUUIDForAssets, got a mismatch of syndication identifiers (%tu) and searchable items (%tu)", buf, 0x16u);
  }

  v29 = (id)MEMORY[0x1E0C9AA70];
LABEL_28:

  return v29;
}

void __60__PHAsset_Syndicated__senderIdentifierByAssetUUIDForAssets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v7, "attributeSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "authorAddresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString length](v11, "length"))
    {
      objc_msgSend(v9, "accountIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (__CFString *)v12;
    }

  }
  if (-[__CFString length](v11, "length"))
  {
    v13 = *(void **)(a1 + 48);
    v14 = v11;
  }
  else
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v5;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEFAULT, "No sender identifier found for syndication identifier %{public}@", (uint8_t *)&v16, 0xCu);
    }

    v13 = *(void **)(a1 + 48);
    v14 = &stru_1E35DFFF8;
  }
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v6);

}

id __85__PHAsset_Syndicated__fetchAssetsWithSyndicationIdentifiers_options_includeRejected___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForAssetsWithOptions:](PHQuery, "queryForAssetsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)fetchCuratedAssetsForMomentShareCreationWithAssets:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[2];
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[3];
  uint8_t buf[4];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "fetchLimit"))
    v7 = objc_msgSend(v6, "fetchLimit");
  else
    v7 = 10;
  v8 = objc_msgSend(v5, "count");
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  objc_msgSend(v5, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v45 = v6;
    v46 = v11;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D717F8]), "initWithNumericValueKeypaths:", &unk_1E3657600);
    -[NSObject setK:](v12, "setK:", v9);
    v44 = v12;
    v47 = v5;
    -[NSObject performWithDataset:progressBlock:](v12, "performWithDataset:progressBlock:", v5, &__block_literal_global_277_38456);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("curationScore"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v14;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("overallAestheticScore"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v15;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v9);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v19 = v13;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v53 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "objects");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "sortedArrayUsingDescriptors:", v17);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "uuid");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
            objc_msgSend(v18, "addObject:", v27);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v21);
    }

    if (objc_msgSend(v18, "count") < v9)
    {
      PLBackendSharingGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_DEFAULT, "fetchCuratedAssetsForMomentShareCreationWithAssets: adding some random assets to clustering assets selection.", buf, 2u);
      }

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v29 = v47;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v49;
LABEL_22:
        v33 = 0;
        while (1)
        {
          if (*(_QWORD *)v49 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v33), "uuid");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v34);

          if (objc_msgSend(v18, "count") == v9)
            break;
          if (v31 == ++v33)
          {
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            if (v31)
              goto LABEL_22;
            break;
          }
        }
      }

    }
    v6 = v45;
    if (v45)
    {
      v35 = objc_msgSend(v45, "copy");
    }
    else
    {
      objc_msgSend(v46, "librarySpecificFetchOptions");
      v35 = objc_claimAutoreleasedReturnValue();
    }
    v38 = (void *)v35;
    v5 = v47;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v39;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setSortDescriptors:", v41);

    objc_msgSend(v38, "setFetchLimit:", v9);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v18);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setPredicate:", v42);

    objc_msgSend(v38, "setIncludeHiddenAssets:", 1);
    +[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v46;
    v36 = v44;
  }
  else
  {
    PLBackendSharingGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v5;
      _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_ERROR, "Failed to compute curated assets: No photo library with assets: %@.", buf, 0xCu);
    }
    v37 = 0;
  }

  return v37;
}

+ (id)fetchPreviewAssetsForMomentShareCreationWithAssets:(id)a3 options:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v10);

  objc_msgSend(v7, "setFetchLimit:", 10);
  objc_msgSend(v7, "setIncludeHiddenAssets:", 1);
  PFMap();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHAsset fetchAssetsWithObjectIDs:options:](PHAsset, "fetchAssetsWithObjectIDs:options:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __83__PHAsset_MomentShare__fetchPreviewAssetsForMomentShareCreationWithAssets_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

+ (id)composabilityScoresOfAssets:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (!v9)
    goto LABEL_19;
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v14, "photoLibrary");
        v15 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v15;
      }
    }
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  }
  while (v10);
  if (v11)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "localIdentifier", (_QWORD)v26);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v19);
    }

    objc_msgSend(v11, "photoAnalysisClient");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "requestComposabilityScoresOfAssetsForLocalIdentifiers:options:error:", v16, v8, a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_19:
    v24 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v24;
}

- (void)recordImageManagerMessageForRequestID:(int)a3 message:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  SEL v21;
  int v22;
  uint64_t *v23;
  uint64_t v24;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHAsset_ImageManager.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  v23 = &v24;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "_currentTimestampString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v7, &v24);
  objc_msgSend(v10, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHObject uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_imageManagerRequestLoggingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PHAsset_ImageManager__recordImageManagerMessageForRequestID_message___block_invoke;
  block[3] = &unk_1E35DEA00;
  block[4] = self;
  v19 = v13;
  v22 = a3;
  v20 = v12;
  v21 = a2;
  v15 = v12;
  v16 = v13;
  dispatch_async(v14, block);

}

- (id)messagesForRecentImageManagerRequests
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_imageManagerRequestLoggingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PHAsset_ImageManager__messagesForRecentImageManagerRequests__block_invoke;
  block[3] = &unk_1E35DFAF8;
  block[4] = self;
  v12 = v4;
  v6 = v3;
  v13 = v6;
  v7 = v4;
  dispatch_sync(v5, block);

  v8 = v13;
  v9 = v6;

  return v9;
}

void __62__PHAsset_ImageManager__messagesForRecentImageManagerRequests__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_inq_imageManagerRequestLogsByAssetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "appendFormat:", CFSTR("ID: %@\n"), v10);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(a1 + 48), "appendString:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
              objc_msgSend(*(id *)(a1 + 48), "appendString:", CFSTR("\n"));
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v13);
        }
        objc_msgSend(*(id *)(a1 + 48), "appendString:", CFSTR("\n"));

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

}

void __71__PHAsset_ImageManager__recordImageManagerMessageForRequestID_message___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "_inq_imageManagerRequestMessagesByRequestIDForAssetUUID:requestID:", *(_QWORD *)(a1 + 40), *(int *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PHAsset_ImageManager.m"), 132, CFSTR("cannot get messages array"));

    v2 = 0;
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend((id)objc_opt_class(), "_inq_recordRequestID:", *(int *)(a1 + 64));
  objc_msgSend((id)objc_opt_class(), "_inq_trimToMostRecentImageManagerMessages");

}

+ (id)_imageManagerRequestLoggingQueue
{
  if (_imageManagerRequestLoggingQueue_s_onceToken != -1)
    dispatch_once(&_imageManagerRequestLoggingQueue_s_onceToken, &__block_literal_global_18);
  return (id)_imageManagerRequestLoggingQueue_s_queue;
}

+ (id)_inq_imageManagerRequestLogsByAssetUUID
{
  if (_inq_imageManagerRequestLogsByAssetUUID_s_onceToken != -1)
    dispatch_once(&_inq_imageManagerRequestLogsByAssetUUID_s_onceToken, &__block_literal_global_20_39273);
  return (id)_inq_imageManagerRequestLogsByAssetUUID_s_logsByAssetUUID;
}

+ (id)_inq_highestImageManagerRequestIDsObserved
{
  if (_inq_highestImageManagerRequestIDsObserved_s_onceToken != -1)
    dispatch_once(&_inq_highestImageManagerRequestIDsObserved_s_onceToken, &__block_literal_global_21);
  return (id)_inq_highestImageManagerRequestIDsObserved_s_highest;
}

+ (id)_inq_imageManagerRequestMessagesByRequestIDForAssetUUID:(id)a3 requestID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "_inq_imageManagerRequestLogsByAssetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_inq_imageManagerRequestLogsByAssetUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v12);

  }
  return v11;
}

+ (void)_inq_recordRequestID:(int64_t)a3
{
  id v4;

  objc_msgSend(a1, "_inq_highestImageManagerRequestIDsObserved");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addIndex:", a3);
  if ((unint64_t)objc_msgSend(v4, "count") >= 0x65)
    objc_msgSend(v4, "removeIndex:", objc_msgSend(v4, "firstIndex"));

}

+ (id)_currentTimestampString
{
  void *v2;
  void *v3;
  void *v4;

  if (_currentTimestampString_s_onceToken_39268 != -1)
    dispatch_once(&_currentTimestampString_s_onceToken_39268, &__block_literal_global_25_39269);
  v2 = (void *)_currentTimestampString_s_formatter_39270;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_inq_trimToMostRecentImageManagerMessages
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_inq_imageManagerRequestLogsByAssetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_inq_highestImageManagerRequestIDsObserved");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "firstIndex");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__PHAsset_ImageManager___inq_trimToMostRecentImageManagerMessages__block_invoke;
  v17[3] = &unk_1E35DE9D8;
  v19 = v5;
  v7 = v6;
  v18 = v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v17);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    }
    while (v10);
  }

}

void __66__PHAsset_ImageManager___inq_trimToMostRecentImageManagerMessages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (!v10 || objc_msgSend(v10, "compare:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i)) == 1)
        {
          v14 = v13;

          v10 = v14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  if (objc_msgSend(v10, "integerValue") < *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

uint64_t __48__PHAsset_ImageManager___currentTimestampString__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_currentTimestampString_s_formatter_39270;
  _currentTimestampString_s_formatter_39270 = (uint64_t)v0;

  return objc_msgSend((id)_currentTimestampString_s_formatter_39270, "setDateFormat:", CFSTR("yyyy-MM-dd' 'HH:mm:ss.SS"));
}

void __67__PHAsset_ImageManager___inq_highestImageManagerRequestIDsObserved__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v1 = (void *)_inq_highestImageManagerRequestIDsObserved_s_highest;
  _inq_highestImageManagerRequestIDsObserved_s_highest = (uint64_t)v0;

}

void __64__PHAsset_ImageManager___inq_imageManagerRequestLogsByAssetUUID__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_inq_imageManagerRequestLogsByAssetUUID_s_logsByAssetUUID;
  _inq_imageManagerRequestLogsByAssetUUID_s_logsByAssetUUID = (uint64_t)v0;

}

void __57__PHAsset_ImageManager___imageManagerRequestLoggingQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.imagemanagerloggingqueue", attr);
  v2 = (void *)_imageManagerRequestLoggingQueue_s_queue;
  _imageManagerRequestLoggingQueue_s_queue = (uint64_t)v1;

}

@end
