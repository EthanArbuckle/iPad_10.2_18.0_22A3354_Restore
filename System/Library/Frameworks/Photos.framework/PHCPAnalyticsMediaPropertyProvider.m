@implementation PHCPAnalyticsMediaPropertyProvider

- (PHCPAnalyticsMediaPropertyProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCPAnalyticsMediaPropertyProvider.m"), 127, CFSTR("%s is not available as initializer"), "-[PHCPAnalyticsMediaPropertyProvider init]");

  abort();
}

- (PHCPAnalyticsMediaPropertyProvider)initWithPhotoLibrary:(id)a3
{
  id v4;
  PHCPAnalyticsMediaPropertyProvider *v5;
  PHCPAnalyticsMediaPropertyProvider *v6;
  void *v7;
  uint64_t v8;
  id v9;
  PFSceneTaxonomy *sceneTaxonomy84;
  uint64_t v11;
  PFSceneTaxonomy *v12;
  void *v13;
  uint64_t v14;
  id v15;
  PFSceneTaxonomy *sceneTaxonomy99;
  uint64_t v17;
  PFSceneTaxonomy *v18;
  id v20;
  id v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PHCPAnalyticsMediaPropertyProvider;
  v5 = -[PHCPAnalyticsMediaPropertyProvider init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_photoLibrary, v4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), 84);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75250]), "initWithIdentifier:error:", v7, &v21);
    v9 = v21;
    sceneTaxonomy84 = v6->_sceneTaxonomy84;
    v6->_sceneTaxonomy84 = (PFSceneTaxonomy *)v8;

    if (!v6->_sceneTaxonomy84)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v7;
        v25 = 2112;
        v26 = v9;
        _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error instantiating scene taxonomy for version %@. %@", buf, 0x16u);
      }
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75250]), "initWithLatestTaxonomy");
      v12 = v6->_sceneTaxonomy84;
      v6->_sceneTaxonomy84 = (PFSceneTaxonomy *)v11;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), 99);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75250]), "initWithIdentifier:error:", v13, &v20);
    v15 = v20;

    sceneTaxonomy99 = v6->_sceneTaxonomy99;
    v6->_sceneTaxonomy99 = (PFSceneTaxonomy *)v14;

    if (!v6->_sceneTaxonomy99)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v13;
        v25 = 2112;
        v26 = v15;
        _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error instantiating scene taxonomy for version %@. %@", buf, 0x16u);
      }
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75250]), "initWithLatestTaxonomy");
      v18 = v6->_sceneTaxonomy99;
      v6->_sceneTaxonomy99 = (PFSceneTaxonomy *)v17;

    }
  }

  return v6;
}

- (void)registerSystemProperties:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D09760];
  v5 = a3;
  objc_msgSend(v5, "addDynamicProperty:withProvider:", v4, self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D09768], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D09778], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D09788], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D09798], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D097C8], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D097C0], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D097A0], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D097B0], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D097B8], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D097A8], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D097D0], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D097D8], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D097E8], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D09808], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D09790], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D09800], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D09780], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D097F0], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D097F8], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D09770], self);
  objc_msgSend(v5, "addDynamicProperty:withProvider:", *MEMORY[0x1E0D097E0], self);

}

- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v14;

  v7 = a3;
  v8 = a5;
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D09798])
    || (objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D09820]),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D09808]))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D09820]);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v10);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D097B0]))
    {
      -[PHCPAnalyticsMediaPropertyProvider _PHAssetFromPayload:](self, "_PHAssetFromPayload:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        -[PHCPAnalyticsMediaPropertyProvider _PHAssetCollectionFromPayload:](self, "_PHAssetCollectionFromPayload:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[PHCPAnalyticsMediaPropertyProvider _mediaProperty:forAssetCollection:](self, "_mediaProperty:forAssetCollection:", v7, v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }

        goto LABEL_11;
      }
      -[PHCPAnalyticsMediaPropertyProvider _mediaProperty:forAsset:](self, "_mediaProperty:forAsset:", v7, v11);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v9 = (void *)v12;
LABEL_11:

      goto LABEL_12;
    }
    -[PHCPAnalyticsMediaPropertyProvider _mediaCountFromPayload:](self, "_mediaCountFromPayload:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v9;
}

- (id)_PHAssetFromPayload:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D09828]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v3;
      goto LABEL_11;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_11;
  }
  v4 = v3;
  if (objc_msgSend(v4, "count") == 1
    && (objc_msgSend(v4, "firstObject"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v4, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

LABEL_11:
  return v7;
}

- (id)_mediaCountFromPayload:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D09828]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = &unk_1E36562D8;
      else
        v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_mediaProperty:(id)a3 forAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  unint64_t v16;
  __CFString *v17;
  void *v18;
  double v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  int v30;
  __CFString *v31;

  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_62;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09760]))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = objc_msgSend(v7, "hasAdjustments");
LABEL_10:
    v13 = v9;
    v14 = v8;
LABEL_11:
    objc_msgSend(v14, "numberWithBool:", v13);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v12 = v15;
    goto LABEL_63;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09768]))
  {
    objc_msgSend(v7, "fetchPropertySetsIfNeeded");
    objc_msgSend(v7, "importProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHCPAnalyticsMediaPropertyProvider _cameraTypeFromImportSource:](self, "_cameraTypeFromImportSource:", objc_msgSend(v10, "importedBy"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09778]))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = objc_msgSend(v7, "isFavorite");
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09788]))
  {
    objc_msgSend(v7, "fetchPropertySetsIfNeeded");
    objc_msgSend(v7, "importProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "importedBy");
    if (v16 > 0xC)
      v17 = CFSTR("Unknown Import Source Value");
    else
      v17 = off_1E35DA720[v16];
    v11 = v17;
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097C8]))
  {
    +[PHAsset descriptionForMediaType:](PHAsset, "descriptionForMediaType:", objc_msgSend(v7, "mediaType"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097C0]))
  {
    +[PHAsset descriptionForMediaSubtypes:](PHAsset, "descriptionForMediaSubtypes:", objc_msgSend(v7, "mediaSubtypes"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097A0]))
  {
    objc_msgSend(v7, "creationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHCPAnalyticsMediaPropertyProvider _ageDescriptionForMediaDate:](self, "_ageDescriptionForMediaDate:", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097B8]))
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "duration");
LABEL_26:
    objc_msgSend(v18, "numberWithDouble:");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09798]))
  {
    objc_msgSend(v7, "localIdentifier");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097A8]))
  {
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097D0]))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "exifOrientation"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097D8]))
    {
      -[PHCPAnalyticsMediaPropertyProvider _sceneForAsset:](self, "_sceneForAsset:", v7);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097E8]))
    {
      -[PHCPAnalyticsMediaPropertyProvider _sceneSubjectForAsset:](self, "_sceneSubjectForAsset:", v7);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09808]))
    {
      objc_msgSend(v7, "uuid");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09790]))
    {
      objc_msgSend(v7, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v10, "isSystemPhotoLibrary");
      v21 = (void *)objc_opt_class();
      if ((v20 & 1) != 0)
        v22 = 1;
      else
        v22 = objc_msgSend(v10, "wellKnownPhotoLibraryIdentifier");
      objc_msgSend(v21, "_wellKnownPhotoLibraryIdentifierDescription:", v22);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09800]))
    {
      objc_msgSend((id)objc_opt_class(), "_syndicationStateDescriptionForSyndicationState:", objc_msgSend(v7, "syndicationState"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09780]))
    {
      objc_msgSend(v7, "curationProperties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "syndicationIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 != 0;

      v14 = (void *)MEMORY[0x1E0CB37E8];
      v13 = v25;
      goto LABEL_11;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097F0]))
    {
      objc_msgSend(v7, "fetchPropertySetsIfNeeded");
      objc_msgSend(v7, "mediaAnalysisProperties");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "syndicationProcessingValue");

      objc_msgSend((id)objc_opt_class(), "_syndicationValueDescriptionForAssetProcessingValue:", v27);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097F8]))
    {
      objc_msgSend(v7, "fetchPropertySetsIfNeeded");
      objc_msgSend(v7, "mediaAnalysisProperties");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "syndicationProcessingVersion");

      if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        PHAssetSyndicationProcessingVersionDescription(v29);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    else
    {
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09770]))
      {
        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "curationScore");
        goto LABEL_26;
      }
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097E0])
        && CFPreferencesGetAppBooleanValue(CFSTR("PhotosSharedLibrarySyncingIsActive"), CFSTR("com.apple.mobileslideshow"), 0))
      {
        v30 = objc_msgSend(v7, "participatesInLibraryScope");
        v31 = CFSTR("Personal");
        if (v30)
          v31 = CFSTR("Shared");
        v15 = v31;
        goto LABEL_12;
      }
    }
LABEL_62:
    v12 = 0;
    goto LABEL_63;
  }
  objc_msgSend(v7, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceNow");
  v12 = 0;
  if (!v10 || v19 > 0.0)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 / -60.0);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = v11;
LABEL_7:

LABEL_63:
  return v12;
}

- (id)_PHAssetCollectionFromPayload:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D09818]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = v6;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D09820]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PHCPAnalyticsMediaPropertyProvider photoLibrary](self, "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "librarySpecificFetchOptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v13[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)_mediaProperty:(id)a3 forAssetCollection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_30;
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097C8]))
  {
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097C0]))
    {
      if (objc_msgSend(v7, "assetCollectionType") != 4)
      {
        if (objc_msgSend(v7, "assetCollectionType") == 10)
          objc_msgSend(v7, "projectDocumentType");
        else
          +[PHAssetCollection descriptionForSubtype:](PHAssetCollection, "descriptionForSubtype:", objc_msgSend(v7, "assetCollectionSubtype"));
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
      v10 = v7;
      v11 = objc_msgSend(v10, "category");
      if (objc_msgSend(v10, "subcategory"))
        +[PHMemory stringForSubcategory:](PHMemory, "stringForSubcategory:");
      else
        +[PHMemory stringForCategory:](PHMemory, "stringForCategory:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[PHMemory isTriggeredMemoryCategory:](PHMemory, "isTriggeredMemoryCategory:", v11))
      {
        objc_msgSend(v9, "stringByAppendingString:", CFSTR(", Triggered"));
        v16 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v16;
      }
LABEL_33:

      goto LABEL_34;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097A0]))
    {
      objc_msgSend(v7, "creationDate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[PHCPAnalyticsMediaPropertyProvider _ageDescriptionForMediaDate:](self, "_ageDescriptionForMediaDate:", v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      objc_msgSend(v7, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(v7, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHCPAnalyticsMediaPropertyProvider _ageDescriptionForMediaDate:](self, "_ageDescriptionForMediaDate:", v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_32;
      }
      -[PHCPAnalyticsMediaPropertyProvider _ageDescriptionForMediaDate:](self, "_ageDescriptionForMediaDate:", v13);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_27:
      v9 = (void *)v15;
LABEL_32:

      goto LABEL_33;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D097B8]))
    {
      objc_msgSend(v7, "startDate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v9 = 0;
      if (!v10 || !v12)
        goto LABEL_32;
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v12, "timeIntervalSinceDate:", v10);
      objc_msgSend(v14, "numberWithDouble:");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09798]))
    {
      objc_msgSend(v7, "localIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09808]))
    {
      objc_msgSend(v7, "uuid");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_30:
    v9 = 0;
    goto LABEL_34;
  }
  +[PHAssetCollection descriptionForType:](PHAssetCollection, "descriptionForType:", objc_msgSend(v7, "assetCollectionType"));
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v9 = (void *)v8;
LABEL_34:

  return v9;
}

- (id)_ageDescriptionForMediaDate:(id)a3
{
  id v3;
  void *v4;
  double v5;
  const __CFString *v6;
  double v7;
  double v8;
  double v9;
  double v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    if (v5 <= 60.0)
    {
      v7 = v5 / -60.0;
      if (v7 >= 3.0)
      {
        if (v7 >= 10.0)
        {
          v8 = v7 / 60.0;
          if (v8 >= 3.0)
          {
            if (v8 < 24.0)
            {
              v6 = CFSTR("MediaAgeToday");
            }
            else if (v8 < 48.0)
            {
              v6 = CFSTR("MediaAgeYesterday");
            }
            else
            {
              v9 = v8 / 24.0;
              if (v9 >= 7.0)
              {
                if (v9 < 30.0)
                {
                  v6 = CFSTR("MediaAgeLast30Days");
                }
                else if (v9 < 60.0)
                {
                  v6 = CFSTR("MediaAgeLast60Days");
                }
                else if (v9 >= 90.0)
                {
                  if (v9 >= 180.0)
                  {
                    v11 = v9 / 365.0;
                    if (v11 >= 1.0)
                    {
                      if (v11 < 2.0)
                      {
                        v6 = CFSTR("MediaAge1Year");
                      }
                      else if (v11 < 3.0)
                      {
                        v6 = CFSTR("MediaAge2Years");
                      }
                      else if (v11 < 4.0)
                      {
                        v6 = CFSTR("MediaAge3Years");
                      }
                      else if (v11 < 5.0)
                      {
                        v6 = CFSTR("MediaAge4Years");
                      }
                      else if (v11 < 6.0)
                      {
                        v6 = CFSTR("MediaAge5Years");
                      }
                      else if (v11 < 10.0)
                      {
                        v6 = CFSTR("MediaAge10Years");
                      }
                      else if (v11 < 20.0)
                      {
                        v6 = CFSTR("MediaAge20Years");
                      }
                      else if (v11 < 30.0)
                      {
                        v6 = CFSTR("MediaAge30Years");
                      }
                      else if (v11 < 40.0)
                      {
                        v6 = CFSTR("MediaAge40Years");
                      }
                      else
                      {
                        v6 = CFSTR("MediaAge40PlusYears");
                      }
                    }
                    else
                    {
                      v6 = CFSTR("MediaAgeLastYear");
                    }
                  }
                  else
                  {
                    v6 = CFSTR("MediaAgeLast180Days");
                  }
                }
                else
                {
                  v6 = CFSTR("MediaAgeLast90Days");
                }
              }
              else
              {
                v6 = CFSTR("MediaAgeThisWeek");
              }
            }
          }
          else
          {
            v6 = CFSTR("MediaAgeNew");
          }
        }
        else
        {
          v6 = CFSTR("MediaAgeVeryNew");
        }
      }
      else
      {
        v6 = CFSTR("MediaAgeJustNow");
      }
    }
    else
    {
      v6 = CFSTR("MediaAgeFuture");
    }
  }
  else
  {
    v6 = CFSTR("MediaAgeUnknown");
  }

  return (id)v6;
}

- (id)_cameraTypeFromImportSource:(int64_t)a3
{
  if ((unint64_t)a3 > 0xC)
    return CFSTR("Unknown Or Legacy");
  else
    return off_1E35DDDA8[a3];
}

- (id)_sceneForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  __CFString *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "sceneClassifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneAnalysisProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sceneAnalysisVersion");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v26;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "extendedSceneIdentifier", (_QWORD)v25);
        if (-[PHCPAnalyticsMediaPropertyProvider _isSceneConfidenceAboveThresholdForSceneClassification:sceneAnalysisVersion:](self, "_isSceneConfidenceAboveThresholdForSceneClassification:sceneAnalysisVersion:", v15, v7))
        {
          -[PHCPAnalyticsMediaPropertyProvider _sceneConfidenceThresholdByClassificationIdentifier:sceneAnalysisVersion:](self, "_sceneConfidenceThresholdByClassificationIdentifier:sceneAnalysisVersion:", v16, v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          v19 = v18;

          if (v19 > 0.0)
          {
            objc_msgSend(v15, "confidence");
            v21 = v20 / v19;
            if (v21 > v13)
            {
              v22 = v15;

              v13 = v21;
              v11 = v22;
            }
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);

    if (!v11)
    {
      v23 = CFSTR("Other");
      goto LABEL_17;
    }
    -[PHCPAnalyticsMediaPropertyProvider _sceneLabelByClassificationIdentifier:](self, "_sceneLabelByClassificationIdentifier:", objc_msgSend(v11, "sceneIdentifier"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("Other");
    v11 = v8;
  }

LABEL_17:
  return v23;
}

- (BOOL)_isSceneConfidenceAboveThresholdForSceneClassification:(id)a3 sceneAnalysisVersion:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = a4;
  v6 = a3;
  -[PHCPAnalyticsMediaPropertyProvider _sceneConfidenceThresholdByClassificationIdentifier:sceneAnalysisVersion:](self, "_sceneConfidenceThresholdByClassificationIdentifier:sceneAnalysisVersion:", objc_msgSend(v6, "extendedSceneIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "confidence");
    v9 = v8;
    objc_msgSend(v7, "doubleValue");
    v11 = v9 >= v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_sceneConfidenceThresholdByClassificationIdentifier:(unint64_t)a3 sceneAnalysisVersion:(signed __int16)a4
{
  void *v5;
  char v6;

  v5 = 0;
  if ((uint64_t)a3 > 1735)
  {
    v6 = a3 + 10;
    if (a3 - 2147483638 > 0x11)
      goto LABEL_4;
    if (((1 << v6) & 0x1D) != 0)
    {
      -[PHCPAnalyticsMediaPropertyProvider _junkConfidenceThresholdForIdentifier:sceneAnalysisVersion:](self, "_junkConfidenceThresholdForIdentifier:sceneAnalysisVersion:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    if (((1 << v6) & 0x28000) == 0)
    {
LABEL_4:
      if (a3 - 1736 > 0x18 || ((1 << (a3 + 56)) & 0x1C00001) == 0)
      {
        if (a3 - 2147482622 < 2)
        {
          -[PHCPAnalyticsMediaPropertyProvider _sdConfidenceThresholdForIdentifier:sceneAnalysisVersion:](self, "_sdConfidenceThresholdForIdentifier:sceneAnalysisVersion:");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        return v5;
      }
    }
LABEL_25:
    -[PHCPAnalyticsMediaPropertyProvider _sceneNetLabelConfidenceForIdentifier:sceneAnalysisVersion:](self, "_sceneNetLabelConfidenceForIdentifier:sceneAnalysisVersion:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if ((uint64_t)a3 > 978)
  {
    if ((uint64_t)a3 > 1446)
    {
      if (a3 != 1447 && a3 != 1600 && a3 != 1665)
        return v5;
    }
    else if (a3 != 979 && a3 != 1088 && a3 != 1269)
    {
      return v5;
    }
    goto LABEL_25;
  }
  if (a3 - 114 <= 0x21 && ((1 << (a3 - 114)) & 0x200000009) != 0 || a3 == 5 || a3 == 493)
    goto LABEL_25;
  return v5;
}

- (id)_sceneNetLabelConfidenceForIdentifier:(unint64_t)a3 sceneAnalysisVersion:(signed __int16)a4
{
  PFSceneTaxonomy *sceneTaxonomy84;
  void *v5;
  void *v6;

  if (a4 < 0x63)
  {
    if (a4 < 0x54)
    {
      v5 = 0;
      return v5;
    }
    sceneTaxonomy84 = self->_sceneTaxonomy84;
  }
  else
  {
    sceneTaxonomy84 = self->_sceneTaxonomy99;
  }
  v5 = (void *)-[PFSceneTaxonomy nodeRefForExtendedSceneClassId:](sceneTaxonomy84, "nodeRefForExtendedSceneClassId:", a3);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    PFSceneTaxonomyNodeSearchThreshold();
    objc_msgSend(v6, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_junkConfidenceThresholdForIdentifier:(unint64_t)a3 sceneAnalysisVersion:(signed __int16)a4
{
  void *v4;

  if (a4 < 0x56)
  {
    if (a4 < 0x51)
    {
      if (a4 < 0x28)
      {
        v4 = 0;
      }
      else
      {
        -[PHCPAnalyticsMediaPropertyProvider _junkConfidenceThresholdVersion40ForIdentifier:](self, "_junkConfidenceThresholdVersion40ForIdentifier:", a3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      -[PHCPAnalyticsMediaPropertyProvider _junkConfidenceThresholdVersion81ForIdentifier:](self, "_junkConfidenceThresholdVersion81ForIdentifier:", a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[PHCPAnalyticsMediaPropertyProvider _junkConfidenceThresholdVersion86ForIdentifier:](self, "_junkConfidenceThresholdVersion86ForIdentifier:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_junkConfidenceThresholdVersion40ForIdentifier:(unint64_t)a3
{
  if (a3 - 2147483638 > 4)
    return 0;
  else
    return (id)*((_QWORD *)&unk_1E35DDE10 + a3 - 2147483638);
}

- (id)_junkConfidenceThresholdVersion81ForIdentifier:(unint64_t)a3
{
  if (a3 - 2147483638 > 4)
    return 0;
  else
    return (id)*((_QWORD *)&unk_1E35DDE38 + a3 - 2147483638);
}

- (id)_junkConfidenceThresholdVersion86ForIdentifier:(unint64_t)a3
{
  if (a3 == 2147483640)
    return &unk_1E3657780;
  else
    return 0;
}

- (id)_sdConfidenceThresholdForIdentifier:(unint64_t)a3 sceneAnalysisVersion:(signed __int16)a4
{
  void *v4;

  if (a4 < 0x55)
  {
    if (a4 < 0x33)
    {
      if (a4 < 0x21)
      {
        v4 = 0;
      }
      else
      {
        -[PHCPAnalyticsMediaPropertyProvider _sdConfidenceThresholdVersion33ForIdentifier:](self, "_sdConfidenceThresholdVersion33ForIdentifier:", a3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      -[PHCPAnalyticsMediaPropertyProvider _sdConfidenceThresholdVersion51ForIdentifier:](self, "_sdConfidenceThresholdVersion51ForIdentifier:", a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[PHCPAnalyticsMediaPropertyProvider _sdConfidenceThresholdVersion85ForIdentifier:](self, "_sdConfidenceThresholdVersion85ForIdentifier:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_sdConfidenceThresholdVersion33ForIdentifier:(unint64_t)a3
{
  void *v3;

  if (a3 == 2147482623)
    v3 = &unk_1E36577A0;
  else
    v3 = 0;
  if (a3 == 2147482622)
    return &unk_1E3657790;
  else
    return v3;
}

- (id)_sdConfidenceThresholdVersion51ForIdentifier:(unint64_t)a3
{
  void *v3;

  if (a3 == 2147482623)
    v3 = &unk_1E36577A0;
  else
    v3 = 0;
  if (a3 == 2147482622)
    return &unk_1E36577B0;
  else
    return v3;
}

- (id)_sdConfidenceThresholdVersion85ForIdentifier:(unint64_t)a3
{
  void *v3;

  if (a3 == 2147482623)
    v3 = &unk_1E36577D0;
  else
    v3 = 0;
  if (a3 == 2147482622)
    return &unk_1E36577C0;
  else
    return v3;
}

- (id)_sceneLabelByClassificationIdentifier:(unint64_t)a3
{
  if ((uint64_t)a3 <= 1759)
  {
    if ((uint64_t)a3 > 978)
    {
      if ((uint64_t)a3 <= 1268)
      {
        if (a3 == 979)
          return CFSTR("performance");
        if (a3 == 1088)
          return CFSTR("recreation");
      }
      else
      {
        switch(a3)
        {
          case 0x4F5uLL:
            return CFSTR("sport");
          case 0x5A7uLL:
            return CFSTR("vehicle");
          case 0x681uLL:
            return CFSTR("screenshot");
        }
      }
      return CFSTR("Other");
    }
    if ((uint64_t)a3 > 116)
    {
      if (a3 != 117 && a3 != 493)
        return CFSTR("Other");
      return CFSTR("animal");
    }
    if (a3 != 5)
    {
      if (a3 != 114)
        return CFSTR("Other");
      return CFSTR("animal");
    }
    return CFSTR("outdoor");
  }
  if ((uint64_t)a3 > 2147483640)
  {
    if (a3 - 2147483641 >= 2)
    {
      if (a3 != 2147483655)
      {
        if (a3 == 2147483653)
          return CFSTR("interior_room");
        return CFSTR("Other");
      }
      return CFSTR("outdoor");
    }
    return CFSTR("references");
  }
  if ((uint64_t)a3 > 2147482622)
  {
    if (a3 == 2147482623)
      return CFSTR("landscape_cityscape");
    if (a3 != 2147483638)
    {
      if (a3 == 2147483640)
        return CFSTR("receipt_or_document");
      return CFSTR("Other");
    }
    return CFSTR("references");
  }
  if (a3 == 1760)
    return CFSTR("crowd");
  if (a3 == 2147482622)
    return CFSTR("food");
  return CFSTR("Other");
}

- (id)_sceneSubjectForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  int v23;
  uint64_t v24;
  double v25;
  const __CFString *v26;
  void *v27;
  unsigned int v29;
  PHCPAnalyticsMediaPropertyProvider *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHCPAnalyticsMediaPropertyProvider photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = CFSTR("PHFacePropertySetIdentifier");
  v38[1] = CFSTR("PHFacePropertySetAnalytics");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v7);

  v31 = v6;
  +[PHFace fetchFacesInAsset:options:](PHFace, "fetchFacesInAsset:options:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneClassifications");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneAnalysisProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "sceneAnalysisVersion");

  v30 = self;
  v32 = (void *)v9;
  v29 = v11;
  v12 = -[PHCPAnalyticsMediaPropertyProvider _hasPetsForSceneClassifications:sceneAnalysisVersion:](self, "_hasPetsForSceneClassifications:sceneAnalysisVersion:", v9, v11);
  v13 = objc_msgSend(v8, "count");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = 0;
    v19 = *(_QWORD *)v34;
    v20 = 0.0;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v23 = objc_msgSend(v22, "ageType");
        if (v23 == 1)
          v24 = v17 + 1;
        else
          v24 = v17;
        if (v23 == 2)
          ++v18;
        else
          v17 = v24;
        objc_msgSend(v22, "size");
        v20 = v20 + v25;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v20 = 0.0;
  }

  if (v12)
  {
    if (v13)
      v26 = CFSTR("People and pets");
    else
      v26 = CFSTR("Pets");
    goto LABEL_29;
  }
  if (v17 && v17 == v13)
  {
    v26 = CFSTR("Baby");
LABEL_29:
    v27 = v32;
    goto LABEL_30;
  }
  if (v18 && v18 == v13)
  {
    v26 = CFSTR("Children");
    goto LABEL_29;
  }
  if (v18 + v17 && v13 > v18 + v17)
  {
    v26 = CFSTR("People with children");
    goto LABEL_29;
  }
  v27 = v32;
  if (v13 == 1)
  {
    if (v20 >= 0.2)
      v26 = CFSTR("Portrait");
    else
      v26 = CFSTR("Single Person");
  }
  else if (v13 - 1 >= 4)
  {
    if (v13 <= 4)
    {
      if (-[PHCPAnalyticsMediaPropertyProvider _hasPeopleForSceneClassifications:sceneAnalysisVersion:](v30, "_hasPeopleForSceneClassifications:sceneAnalysisVersion:", v32, v29))
      {
        v26 = CFSTR("People (no face info)");
      }
      else
      {
        v26 = CFSTR("None");
      }
    }
    else
    {
      v26 = CFSTR("Group Shot");
    }
  }
  else
  {
    v26 = CFSTR("2-4 People");
  }
LABEL_30:

  return (id)v26;
}

- (BOOL)_isPeopleSceneIdentifier:(unint64_t)a3
{
  BOOL result;

  result = 1;
  if (a3 - 1736 > 0x17 || ((1 << (a3 + 56)) & 0xC00001) == 0)
    return a3 == 147 || a3 == 1600;
  return result;
}

- (BOOL)_hasPetsForSceneClassifications:(id)a3 sceneAnalysisVersion:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "extendedSceneIdentifier", (_QWORD)v15);
        if ((v12 == 493 || v12 == 114)
          && -[PHCPAnalyticsMediaPropertyProvider _isSceneConfidenceAboveThresholdForSceneClassification:sceneAnalysisVersion:](self, "_isSceneConfidenceAboveThresholdForSceneClassification:sceneAnalysisVersion:", v11, v4))
        {
          v13 = 1;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)_hasPeopleForSceneClassifications:(id)a3 sceneAnalysisVersion:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[PHCPAnalyticsMediaPropertyProvider _isPeopleSceneIdentifier:](self, "_isPeopleSceneIdentifier:", objc_msgSend(v11, "extendedSceneIdentifier", (_QWORD)v14))&& -[PHCPAnalyticsMediaPropertyProvider _isSceneConfidenceAboveThresholdForSceneClassification:sceneAnalysisVersion:](self, "_isSceneConfidenceAboveThresholdForSceneClassification:sceneAnalysisVersion:", v11, v4))
        {
          v12 = 1;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (PFSceneTaxonomy)sceneTaxonomy84
{
  return self->_sceneTaxonomy84;
}

- (void)setSceneTaxonomy84:(id)a3
{
  objc_storeStrong((id *)&self->_sceneTaxonomy84, a3);
}

- (PFSceneTaxonomy)sceneTaxonomy99
{
  return self->_sceneTaxonomy99;
}

- (void)setSceneTaxonomy99:(id)a3
{
  objc_storeStrong((id *)&self->_sceneTaxonomy99, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneTaxonomy99, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy84, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
}

+ (id)assetPropertySetsToFetch
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PHAssetPropertySetCore");
  v3[1] = CFSTR("PHAssetPropertySetSceneAnalysis");
  v3[2] = CFSTR("PHAssetPropertySetImport");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_syndicationStateDescriptionForSyndicationState:(unsigned __int16)a3
{
  if (a3 > 8u)
    return CFSTR("Unknown");
  else
    return off_1E35DDE60[a3];
}

+ (id)_syndicationValueDescriptionForAssetProcessingValue:(unsigned __int16)a3
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    v6 = CFSTR("none");
LABEL_34:
    objc_msgSend(v5, "addObject:", v6);
    goto LABEL_35;
  }
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("no moment"));
    v3 ^= 1u;
    if ((v3 & 2) == 0)
    {
LABEL_4:
      if ((v3 & 4) == 0)
        goto LABEL_5;
      goto LABEL_21;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v5, "addObject:", CFSTR("time"));
  v3 ^= 2u;
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v5, "addObject:", CFSTR("no location"));
  v3 ^= 4u;
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v5, "addObject:", CFSTR("far location"));
  v3 ^= 8u;
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v5, "addObject:", CFSTR("location"));
  v3 ^= 0x10u;
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v5, "addObject:", CFSTR("owner face"));
  v3 ^= 0x20u;
  if ((v3 & 0x40) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v5, "addObject:", CFSTR("face"));
  v3 ^= 0x40u;
  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v5, "addObject:", CFSTR("previous moment"));
  v3 ^= 0x80u;
  if ((v3 & 0x100) == 0)
  {
LABEL_11:
    if ((v3 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v5, "addObject:", CFSTR("duplicate"));
  v3 ^= 0x100u;
  if ((v3 & 0x200) == 0)
  {
LABEL_12:
    if ((v3 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v5, "addObject:", CFSTR("pet"));
  v3 ^= 0x200u;
  if ((v3 & 0x400) == 0)
  {
LABEL_13:
    if ((v3 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v5, "addObject:", CFSTR("coreroutine"));
  v3 ^= 0x400u;
  if ((v3 & 0x800) == 0)
  {
LABEL_14:
    if ((v3 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v5, "addObject:", CFSTR("significant location"));
  v3 ^= 0x800u;
  if ((v3 & 0x1000) == 0)
  {
LABEL_15:
    if ((v3 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v5, "addObject:", CFSTR("saved guest"));
  v3 ^= 0x1000u;
  if ((v3 & 0x2000) == 0)
  {
LABEL_16:
    if ((v3 & 0x4000) == 0)
      goto LABEL_35;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v5, "addObject:", CFSTR("sceneprint"));
  if (((v3 ^ 0x2000) & 0x4000) != 0)
  {
LABEL_33:
    v6 = CFSTR("child");
    goto LABEL_34;
  }
LABEL_35:
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_wellKnownPhotoLibraryIdentifierDescription:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E35DDEA8[a3];
}

@end
