@implementation ML3StoreItemPlaylistData

- (ML3StoreItemPlaylistData)initWithLookupItems:(id)a3
{
  id v4;
  ML3StoreItemPlaylistData *v5;
  uint64_t v6;
  NSArray *lookupItems;
  NSArray *parsedPlaylistsImportProperties;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ML3StoreItemPlaylistData;
  v5 = -[ML3StoreItemPlaylistData init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    lookupItems = v5->_lookupItems;
    v5->_lookupItems = (NSArray *)v6;

    parsedPlaylistsImportProperties = v5->_parsedPlaylistsImportProperties;
    v5->_parsedPlaylistsImportProperties = 0;

  }
  return v5;
}

- (ML3StoreItemPlaylistData)initWithPlaylistsData:(id)a3
{
  id v4;
  ML3StoreItemPlaylistData *v5;
  uint64_t v6;
  NSData *playlistData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemPlaylistData;
  v5 = -[ML3StoreItemPlaylistData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    playlistData = v5->_playlistData;
    v5->_playlistData = (NSData *)v6;

  }
  return v5;
}

- (NSData)playlistsData
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[ML3StoreItemPlaylistData parsedStorePlaylistsImportProperties](self, "parsedStorePlaylistsImportProperties");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v7 = CFSTR("playlist");
    v8[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

- (NSArray)parsedStorePlaylistsImportProperties
{
  NSArray *parsedPlaylistsImportProperties;
  NSArray *v4;
  NSArray *v5;

  parsedPlaylistsImportProperties = self->_parsedPlaylistsImportProperties;
  if (!parsedPlaylistsImportProperties)
  {
    if (self->_lookupItems)
    {
      -[ML3StoreItemPlaylistData _playlistPropertiesForLookupItems:](self, "_playlistPropertiesForLookupItems:");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!self->_playlistData)
      {
        parsedPlaylistsImportProperties = 0;
        return parsedPlaylistsImportProperties;
      }
      -[ML3StoreItemPlaylistData _playlistPropertiesFromPlaylistData:](self, "_playlistPropertiesFromPlaylistData:");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    v5 = self->_parsedPlaylistsImportProperties;
    self->_parsedPlaylistsImportProperties = v4;

    parsedPlaylistsImportProperties = self->_parsedPlaylistsImportProperties;
  }
  return parsedPlaylistsImportProperties;
}

- (unint64_t)playlistCount
{
  void *v2;
  unint64_t v3;

  -[ML3StoreItemPlaylistData parsedStorePlaylistsImportProperties](self, "parsedStorePlaylistsImportProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)_playlistPropertiesForLookupItems:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  int v9;
  id v10;
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
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  id v39;
  id obj;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v3;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v44)
  {
    v43 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v47 != v43)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v5, "kind");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0;
        v51 = &v50;
        v52 = 0x2020000000;
        v7 = (_QWORD *)getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr;
        v53 = getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr;
        if (!getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr)
        {
          v8 = iTunesCloudLibrary();
          v7 = dlsym(v8, "ICStorePlatformMetadataKindPlaylist");
          v51[3] = (uint64_t)v7;
          getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr = (uint64_t)v7;
        }
        _Block_object_dispose(&v50, 8);
        if (!v7)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformMetadataKindPlaylist(void)");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("ML3StoreItemPlaylistData.m"), 21, CFSTR("%s"), dlerror());

          __break(1u);
        }
        v9 = objc_msgSend(v6, "isEqualToString:", *v7);

        if (v9)
        {
          v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v5, "metadataDictionary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, &unk_1E5BAB7F0);

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("playlistId"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("playlistId"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, &unk_1E5BAB808);

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("curatorName"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("curatorName"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, &unk_1E5BAB820);

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("versionHash"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("versionHash"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, &unk_1E5BAB838);

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isChart"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isChart"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, &unk_1E5BAB850);

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("description"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = v45;
            if (!v22)
              goto LABEL_26;
LABEL_25:
            v42 = v22;
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, &unk_1E5BAB868);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v45, "allValues");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "firstObject");
              v24 = objc_claimAutoreleasedReturnValue();

              v22 = (id)v24;
              if (v24)
                goto LABEL_25;
            }
LABEL_26:
            v42 = 0;
          }
          objc_msgSend(v5, "artworkInfos");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[ML3StoreItemPlaylistData _bestPlaylistArtworkImageURLFromStoreArtworkVariants:](self, "_bestPlaylistArtworkImageURLFromStoreArtworkVariants:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, &unk_1E5BAB880);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], &unk_1E5BAB898);
          v27 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          objc_msgSend(v27, "numberWithDouble:");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v28, &unk_1E5BAB8B0);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v28, &unk_1E5BAB8C8);
          objc_msgSend(v11, "objectForKey:", CFSTR("lastModifiedDate"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = objc_alloc_init(MEMORY[0x1E0CB3578]);
            objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setLocale:", v31);

            objc_msgSend(v30, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
            objc_msgSend(v30, "dateFromString:", v29);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v32, "timeIntervalSinceReferenceDate");
            objc_msgSend(v33, "numberWithDouble:");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v34, &unk_1E5BAB8C8);

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("childrenIds"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v35, CFSTR("childrenIds"));

          if (v10)
          {
            objc_msgSend(v39, "addObject:", v10);

          }
          continue;
        }
      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v44);
  }

  return v39;
}

- (id)_playlistPropertiesFromPlaylistData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = a3;
  MSVPropertyListDataClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v5, v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v11;
  if (!v6)
  {
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "Failed to decode playlist data. err=%{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playlist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_bestPlaylistArtworkImageURLFromStoreArtworkVariants:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id result;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v5 = (_QWORD *)getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr;
  v14 = getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr;
  if (!getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr)
  {
    v6 = iTunesCloudLibrary();
    v5 = dlsym(v6, "ICStoreArtworkInfoCropStyleSquareCenterCrop");
    v12[3] = (uint64_t)v5;
    getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    -[ML3StoreItemPlaylistData _bestArtworkImageURLFromStoreArtworkVariants:cropStyle:](self, "_bestArtworkImageURLFromStoreArtworkVariants:cropStyle:", v4, *v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStoreArtworkInfoCropStyleSquareCenterCrop(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("ML3StoreItemPlaylistData.m"), 22, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (id)_bestArtworkImageURLFromStoreArtworkVariants:(id)a3 cropStyle:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v34;
  double v35;
  id *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v11 = 0;
  if (v8)
  {
    v12 = *(_QWORD *)v45;
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v14 = *MEMORY[0x1E0C9D820];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v7);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v16, "sizeInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "maxSupportedSize");
        v19 = v18;
        v21 = v20;

        if (v19 > v14 || v21 > v13)
        {
          v23 = v16;

          v13 = v21;
          v14 = v19;
          v11 = v23;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v8);
  }

  MSVGetMaximumScreenSize();
  v25 = v24;
  v27 = v26;
  objc_msgSend(v11, "sizeInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "maxSupportedSize");
  v30 = v29;
  v32 = v31;

  if (v30 != v9 || v32 != v10)
  {
    MSVImageUtilitiesMakeBoundingBoxSize();
    v25 = v34;
    v27 = v35;
  }
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v36 = (id *)getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr;
  v51 = getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr;
  if (!getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr)
  {
    v37 = iTunesCloudLibrary();
    v36 = (id *)dlsym(v37, "ICStoreArtworkInfoImageFormatJPEG");
    v49[3] = (uint64_t)v36;
    getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr = (uint64_t)v36;
  }
  _Block_object_dispose(&v48, 8);
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStoreArtworkInfoImageFormatJPEG(void)");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("ML3StoreItemPlaylistData.m"), 23, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v38 = *v36;
  objc_msgSend(v11, "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:", v6, v38, MSVDeviceSupportsExtendedColorDisplay(), v25, v27);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "absoluteString");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedPlaylistsImportProperties, 0);
  objc_storeStrong((id *)&self->_playlistData, 0);
  objc_storeStrong((id *)&self->_lookupItems, 0);
}

@end
