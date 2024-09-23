@implementation ML3StoreItemTrackData

- (ML3StoreItemTrackData)initWithLookupItems:(id)a3
{
  id v4;
  ML3StoreItemTrackData *v5;
  uint64_t v6;
  NSArray *lookupItems;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemTrackData;
  v5 = -[ML3StoreItemTrackData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    lookupItems = v5->_lookupItems;
    v5->_lookupItems = (NSArray *)v6;

  }
  return v5;
}

- (ML3StoreItemTrackData)initWithTrackData:(id)a3
{
  id v4;
  ML3StoreItemTrackData *v5;
  uint64_t v6;
  NSData *trackData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemTrackData;
  v5 = -[ML3StoreItemTrackData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    trackData = v5->_trackData;
    v5->_trackData = (NSData *)v6;

  }
  return v5;
}

- (NSData)trackData
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[ML3StoreItemTrackData parsedStoreItemsImportProperties](self, "parsedStoreItemsImportProperties");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v7 = CFSTR("track_items");
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

- (NSArray)parsedStoreItemsImportProperties
{
  NSArray *parsedStoreItemsImportProperties;
  NSArray *v4;
  NSArray *v5;

  parsedStoreItemsImportProperties = self->_parsedStoreItemsImportProperties;
  if (!parsedStoreItemsImportProperties)
  {
    if (self->_lookupItems)
    {
      -[ML3StoreItemTrackData _storeItemsImportPropertiesFromLookupItems:](self, "_storeItemsImportPropertiesFromLookupItems:");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!self->_trackData)
      {
        parsedStoreItemsImportProperties = 0;
        return parsedStoreItemsImportProperties;
      }
      -[ML3StoreItemTrackData _storeItemsImportPropertiesFromTrackData:](self, "_storeItemsImportPropertiesFromTrackData:");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    v5 = self->_parsedStoreItemsImportProperties;
    self->_parsedStoreItemsImportProperties = v4;

    parsedStoreItemsImportProperties = self->_parsedStoreItemsImportProperties;
  }
  return parsedStoreItemsImportProperties;
}

- (unint64_t)trackCount
{
  void *v2;
  unint64_t v3;

  -[ML3StoreItemTrackData parsedStoreItemsImportProperties](self, "parsedStoreItemsImportProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)_storePlatformDateFormatter
{
  NSDateFormatter *storePlatformDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  storePlatformDateFormatter = self->_storePlatformDateFormatter;
  if (!storePlatformDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_storePlatformDateFormatter;
    self->_storePlatformDateFormatter = v4;

    -[NSDateFormatter setDateFormat:](self->_storePlatformDateFormatter, "setDateFormat:", CFSTR("YYYY-MM-dd"));
    storePlatformDateFormatter = self->_storePlatformDateFormatter;
  }
  return storePlatformDateFormatter;
}

- (id)_storeItemsImportPropertiesFromLookupItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v19 = v4;
  -[ML3StoreItemTrackData _allSongItemsFromLookupItems:](self, "_allSongItemsFromLookupItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "storeAdamID");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "containsObject:", v14);

        if (v15)
        {
          v16 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v27 = v13;
            _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_DEFAULT, "[ML3StoreItemTrackData] not including item with store identifier:%lld", buf, 0xCu);
          }
        }
        else
        {
          -[ML3StoreItemTrackData _importDictionaryForLookupItem:parentCollectionCache:](self, "_importDictionaryForLookupItem:parentCollectionCache:", v12, v20);
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v16);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v17);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }

  return v21;
}

- (id)_storeItemsImportPropertiesFromTrackData:(id)a3
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "[ML3StoreItemTrackData] Failed to decode track data. err=%{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("track_items"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_parentDictForItemAlbumId:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__14753;
  v29 = __Block_byref_object_dispose__14754;
  v30 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "stringValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v6 = (void *)getICStorePlatformRequestClass_softClass;
  v39 = getICStorePlatformRequestClass_softClass;
  v7 = MEMORY[0x1E0C809B0];
  if (!getICStorePlatformRequestClass_softClass)
  {
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __getICStorePlatformRequestClass_block_invoke;
    v34 = &unk_1E5B64C48;
    v35 = &v36;
    __getICStorePlatformRequestClass_block_invoke((uint64_t)&v31);
    v6 = (void *)v37[3];
  }
  v8 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v36, 8);
  v9 = objc_alloc_init(v8);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v10 = (void *)getICStoreRequestContextClass_softClass;
  v39 = getICStoreRequestContextClass_softClass;
  if (!getICStoreRequestContextClass_softClass)
  {
    v31 = v7;
    v32 = 3221225472;
    v33 = __getICStoreRequestContextClass_block_invoke;
    v34 = &unk_1E5B64C48;
    v35 = &v36;
    __getICStoreRequestContextClass_block_invoke((uint64_t)&v31);
    v10 = (void *)v37[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v36, 8);
  v12 = [v11 alloc];
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v13 = (void *)getICUserIdentityClass_softClass;
  v39 = getICUserIdentityClass_softClass;
  if (!getICUserIdentityClass_softClass)
  {
    v31 = v7;
    v32 = 3221225472;
    v33 = __getICUserIdentityClass_block_invoke;
    v34 = &unk_1E5B64C48;
    v35 = &v36;
    __getICUserIdentityClass_block_invoke((uint64_t)&v31);
    v13 = (void *)v37[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v36, 8);
  objc_msgSend(v14, "activeAccount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithIdentity:", v15);

  objc_msgSend(v9, "setRequestContext:", v16);
  objc_msgSend(v9, "setKeyProfile:", CFSTR("album-parent"));
  v40[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItemIdentifiers:", v17);

  objc_msgSend(v9, "setPersonalizationStyle:", 0);
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __51__ML3StoreItemTrackData__parentDictForItemAlbumId___block_invoke;
  v22[3] = &unk_1E5B638E0;
  v24 = &v25;
  v18 = dispatch_semaphore_create(0);
  v23 = v18;
  v19 = (id)objc_msgSend(v9, "performWithResponseHandler:", v22);
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  v20 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v20;
}

- (id)_importDictionaryForLookupItem:(id)a3 parentCollectionCache:(id)a4
{
  id v6;
  uint64_t v7;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
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
  void *v86;
  double v87;
  void *v88;
  id v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t i;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  __CFString *v108;
  __CFString *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  __CFString *v114;
  __CFString *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t j;
  void *v127;
  id *v128;
  void *v129;
  id v130;
  int v131;
  id *v132;
  void *v133;
  id v134;
  int v135;
  id *v136;
  void *v137;
  id v138;
  int v139;
  id *v140;
  void *v141;
  id v142;
  int v143;
  id *v144;
  void *v145;
  id v146;
  int v147;
  id *v148;
  void *v149;
  id v150;
  int v151;
  NSObject *v152;
  void *v153;
  id v154;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  id v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  NSObject *log;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _BYTE v188[128];
  uint8_t v189[128];
  __int128 buf;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;

  v193 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v169 = a4;
  v177 = v6;
  if (!-[ML3StoreItemTrackData _platformMetadataItemIsMusicKind:](self, "_platformMetadataItemIsMusicKind:", v6)
    && !-[ML3StoreItemTrackData _platformMetadataItemIsAUCKind:](self, "_platformMetadataItemIsAUCKind:", v6)
    && !-[ML3StoreItemTrackData _platformMetadataItemIsVideoKind:](self, "_platformMetadataItemIsVideoKind:", v6))
  {
    log = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "kind");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v117;
      _os_log_impl(&dword_1AC149000, log, OS_LOG_TYPE_ERROR, "[ML3StoreItemTrackData] unsupported item kind %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v178 = 0;
    goto LABEL_176;
  }
  v178 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[ML3StoreItemTrackData _platformMetadataItemIsMusicVideoKind:](self, "_platformMetadataItemIsMusicVideoKind:", v6)|| -[ML3StoreItemTrackData _platformMetadataItemIsAUCVideoKind:](self, "_platformMetadataItemIsAUCVideoKind:", v6))
  {
    v7 = 1032;
  }
  else if (-[ML3StoreItemTrackData _platformMetadataItemIsTVShowKind:](self, "_platformMetadataItemIsTVShowKind:", v6))
  {
    v7 = 512;
  }
  else if (-[ML3StoreItemTrackData _platformMetadataItemIsMovieKind:](self, "_platformMetadataItemIsMovieKind:", v6))
  {
    v7 = 2048;
  }
  else
  {
    v7 = 8;
  }
  objc_msgSend(v6, "metadataDictionary");
  log = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "storeAdamID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setObject:forKeyedSubscript:", v8, &unk_1E5BAB940);

  objc_msgSend(v6, "artistName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "artistName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v10, &unk_1E5BAB958);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("artistId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("artistId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v12, &unk_1E5BAB970);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("collectionId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("collectionId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v14, &unk_1E5BAB988);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("collectionName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("collectionName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v16, &unk_1E5BAB9A0);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("name"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("name"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v18, &unk_1E5BAB9B8);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("trackNumber"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("trackNumber"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v20, &unk_1E5BAB9D0);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("discNumber"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("discNumber"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v22, &unk_1E5BAB9E8);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("copyright"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("copyright"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v24, &unk_1E5BABA00);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("isCompilation"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("isCompilation"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v26, &unk_1E5BABA18);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("isMasteredForItunes"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("isMasteredForItunes"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v28, &unk_1E5BABA30);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("ml3td_radio_station_id"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("ml3td_radio_station_id"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v30, &unk_1E5BABA48);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("ml3td_advertisement_unique_id"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("ml3td_advertisement_unique_id"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v32, &unk_1E5BABA60);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("ml3td_advertisement_type"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("ml3td_advertisement_type"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v34, &unk_1E5BABA78);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("showComposer"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("showComposer"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v36, &unk_1E5BABA90);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("work"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("work"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v38, &unk_1E5BABAA8);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("shouldBookmarkPlayPosition"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("shouldBookmarkPlayPosition"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v40, &unk_1E5BABAC0);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("episodeSeasonNumber"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("episodeSeasonNumber"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v42, &unk_1E5BABAD8);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("excludeFromShuffle"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("excludeFromShuffle"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v44, &unk_1E5BABAF0);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("wasAvailableForSubs"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("wasAvailableForSubs"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v46, &unk_1E5BABB08);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("episodeDisplayLabel"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("episodeDisplayLabel"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v48, &unk_1E5BABB20);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("hasLyrics"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("hasLyrics"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v50, &unk_1E5BABB38);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("hasTimeSyncedLyrics"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("hasTimeSyncedLyrics"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v52, &unk_1E5BABB50);

  }
  objc_msgSend(v6, "formerStoreAdamIDs");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "count");

  if (v54)
  {
    objc_msgSend(v177, "formerStoreAdamIDs");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v55, &unk_1E5BABB68);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("albumArtistId"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("albumArtistName"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("albumArtistId"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("albumArtistId"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "setObject:forKeyedSubscript:", v59, &unk_1E5BABB80);

      }
      -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("albumArtistName"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v60)
        goto LABEL_69;
      -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("albumArtistName"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "setObject:forKeyedSubscript:", v61, &unk_1E5BABB98);
      goto LABEL_68;
    }
  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("collectionId"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v62)
    goto LABEL_69;
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("collectionId"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "objectForKeyedSubscript:", v61);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
    goto LABEL_63;
  -[ML3StoreItemTrackData _parentDictForItemAlbumId:](self, "_parentDictForItemAlbumId:", v61);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    objc_msgSend(v169, "setObject:forKeyedSubscript:", v63, v61);
LABEL_63:
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("albumArtistId"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("albumArtistId"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "setObject:forKeyedSubscript:", v65, &unk_1E5BABB80);

    }
    objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("albumArtistName"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("albumArtistName"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "setObject:forKeyedSubscript:", v67, &unk_1E5BABB98);

    }
  }

LABEL_68:
LABEL_69:
  if (-[ML3StoreItemTrackData _platformMetadataItemIsAUCKind:](self, "_platformMetadataItemIsAUCKind:", v177))
  {
    objc_msgSend(v178, "objectForKeyedSubscript:", &unk_1E5BAB9B8);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v68)
    {
      -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("title"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (v69)
      {
        -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("title"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "setObject:forKeyedSubscript:", v70, &unk_1E5BAB9B8);

      }
    }
  }
  if ((v7 & 0x200) != 0)
  {
    objc_msgSend(v177, "artistName");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v71)
    {
      objc_msgSend(v177, "artistName");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "setObject:forKeyedSubscript:", v72, &unk_1E5BABBB0);

    }
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("trackNumber"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("trackNumber"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "setObject:forKeyedSubscript:", v74, &unk_1E5BABBC8);

    }
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("videoSubType"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ML3StoreItemTrackData _episodeTypeFromVideoSubTypeString:](self, "_episodeTypeFromVideoSubTypeString:", v75));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v76, &unk_1E5BABBE0);

    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("screenshots"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3StoreItemTrackData _lookupItemArtworksForArtworkDictionaries:](self, "_lookupItemArtworksForArtworkDictionaries:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3StoreItemTrackData _bestAlbumArtworkImageURLFromStoreArtworkVariants:](self, "_bestAlbumArtworkImageURLFromStoreArtworkVariants:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (v79)
      objc_msgSend(v178, "setObject:forKeyedSubscript:", v79, &unk_1E5BABBF8);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setObject:forKeyedSubscript:", v80, &unk_1E5BABC10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setObject:forKeyedSubscript:", v81, &unk_1E5BABC28);

  v82 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v82, "numberWithDouble:");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setObject:forKeyedSubscript:", v170, &unk_1E5BABC40);
  objc_msgSend(v178, "setObject:forKeyedSubscript:", v170, &unk_1E5BABC58);
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("releaseDate"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  if (v174)
  {
    -[ML3StoreItemTrackData _storePlatformDateFormatter](self, "_storePlatformDateFormatter");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "dateFromString:", v174);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v84, "timeIntervalSinceReferenceDate");
    objc_msgSend(v85, "numberWithDouble:");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v86, &unk_1E5BABC70);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("offers"));
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  if (v176)
  {
    -[ML3StoreItemTrackData _songDurationFromOffersArray:](self, "_songDurationFromOffersArray:", v176);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87 * 1000.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v88, &unk_1E5BABC88);

    v186 = 0u;
    v187 = 0u;
    v184 = 0u;
    v185 = 0u;
    v89 = v176;
    v90 = 0;
    v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v184, v189, 16);
    if (v91)
    {
      v92 = *(_QWORD *)v185;
      do
      {
        for (i = 0; i != v91; ++i)
        {
          if (*(_QWORD *)v185 != v92)
            objc_enumerationMutation(v89);
          objc_msgSend(*(id *)(*((_QWORD *)&v184 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("type"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend(v94, "isEqualToString:", CFSTR("subscription"));

          v90 |= v95;
        }
        v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v184, v189, 16);
      }
      while (v91);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v90 & 1);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v96, &unk_1E5BABCA0);

  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("genreNames"));
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v173, "count"))
  {
    objc_msgSend(v173, "firstObject");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v97, &unk_1E5BABCB8);

  }
  objc_msgSend(v177, "artworkInfos");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v98, "count"))
  {
    v99 = v98;
  }
  else
  {
    -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("albumArtwork"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3StoreItemTrackData _lookupItemArtworksForArtworkDictionaries:](self, "_lookupItemArtworksForArtworkDictionaries:", v100);
    v101 = objc_claimAutoreleasedReturnValue();

    v99 = (void *)v101;
  }
  v168 = v99;
  -[ML3StoreItemTrackData _bestAlbumArtworkImageURLFromStoreArtworkVariants:](self, "_bestAlbumArtworkImageURLFromStoreArtworkVariants:");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  if (v172)
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v172, &unk_1E5BABCD0);
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("contentRatingsBySystem"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  if (v175)
  {
    objc_msgSend(v175, "allKeys");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "firstObject");
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v175, "objectForKey:", v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v104;
    if (v104)
    {
      objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("name"));
      v106 = objc_claimAutoreleasedReturnValue();
      v107 = (void *)v106;
      if (v106)
        v108 = (__CFString *)v106;
      else
        v108 = &stru_1E5B66908;
      v109 = v108;

      objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("value"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v103, "isEqualToString:", CFSTR("riaa")))
      {
        if ((-[__CFString isEqualToString:](v109, "isEqualToString:", CFSTR("Explicit")) & 1) != 0)
        {
          v111 = 1;
        }
        else if (-[__CFString isEqualToString:](v109, "isEqualToString:", CFSTR("Clean")))
        {
          v111 = 2;
        }
        else
        {
          v111 = 0;
        }
      }
      else
      {
        objc_msgSend(v105, "objectForKey:", CFSTR("advisories"));
        v112 = objc_claimAutoreleasedReturnValue();
        v113 = (void *)v112;
        if (v112)
          v114 = (__CFString *)v112;
        else
          v114 = &stru_1E5B66908;
        v115 = v114;

        if ((objc_opt_respondsToSelector() & 1) != 0)
          v116 = objc_msgSend(v110, "integerValue");
        else
          v116 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@|%@|%ld|%@"), v103, v109, v116, v115);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "setObject:forKeyedSubscript:", v118, &unk_1E5BABCE8);

        v111 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v111);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "setObject:forKeyedSubscript:", v119, &unk_1E5BABD00);

      if (v110)
        v120 = v110;
      else
        v120 = &unk_1E5BABD18;
      objc_msgSend(v178, "setObject:forKeyedSubscript:", v120, &unk_1E5BABD30);

    }
  }
  -[NSObject objectForKeyedSubscript:](log, "objectForKeyedSubscript:", CFSTR("composer"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  if (v171)
  {
    objc_msgSend(v171, "objectForKeyedSubscript:", CFSTR("name"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v121, "length"))
      objc_msgSend(v178, "setObject:forKeyedSubscript:", v121, &unk_1E5BABD48);

  }
  objc_msgSend(v177, "audioTraits");
  v182 = 0u;
  v183 = 0u;
  v180 = 0u;
  v181 = 0u;
  v122 = (id)objc_claimAutoreleasedReturnValue();
  v123 = 0;
  v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v180, v188, 16);
  if (v124)
  {
    v125 = *(_QWORD *)v181;
    do
    {
      for (j = 0; j != v124; ++j)
      {
        if (*(_QWORD *)v181 != v125)
          objc_enumerationMutation(v122);
        v127 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * j);
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v191 = 0x2020000000;
        v128 = (id *)getICStorePlatformAudioTraitSpatialSymbolLoc_ptr;
        v192 = getICStorePlatformAudioTraitSpatialSymbolLoc_ptr;
        if (!getICStorePlatformAudioTraitSpatialSymbolLoc_ptr)
        {
          v129 = iTunesCloudLibrary_14584();
          v128 = (id *)dlsym(v129, "ICStorePlatformAudioTraitSpatial");
          *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v128;
          getICStorePlatformAudioTraitSpatialSymbolLoc_ptr = (uint64_t)v128;
        }
        _Block_object_dispose(&buf, 8);
        if (!v128)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformAudioTraitSpatial(void)");
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "handleFailureInFunction:file:lineNumber:description:", v157, CFSTR("ML3StoreItemTrackData.m"), 44, CFSTR("%s"), dlerror());

          goto LABEL_183;
        }
        v130 = *v128;
        v131 = objc_msgSend(v127, "isEqualToString:", v130);

        if (v131)
        {
          v123 |= 0x20uLL;
        }
        else
        {
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v191 = 0x2020000000;
          v132 = (id *)getICStorePlatformAudioTraitLosslessSymbolLoc_ptr;
          v192 = getICStorePlatformAudioTraitLosslessSymbolLoc_ptr;
          if (!getICStorePlatformAudioTraitLosslessSymbolLoc_ptr)
          {
            v133 = iTunesCloudLibrary_14584();
            v132 = (id *)dlsym(v133, "ICStorePlatformAudioTraitLossless");
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v132;
            getICStorePlatformAudioTraitLosslessSymbolLoc_ptr = (uint64_t)v132;
          }
          _Block_object_dispose(&buf, 8);
          if (!v132)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformAudioTraitLossless(void)");
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "handleFailureInFunction:file:lineNumber:description:", v159, CFSTR("ML3StoreItemTrackData.m"), 45, CFSTR("%s"), dlerror());

            goto LABEL_183;
          }
          v134 = *v132;
          v135 = objc_msgSend(v127, "isEqualToString:", v134);

          if (v135)
          {
            v123 |= 4uLL;
          }
          else
          {
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v191 = 0x2020000000;
            v136 = (id *)getICStorePlatformAudioTraitHiResLosslessSymbolLoc_ptr;
            v192 = getICStorePlatformAudioTraitHiResLosslessSymbolLoc_ptr;
            if (!getICStorePlatformAudioTraitHiResLosslessSymbolLoc_ptr)
            {
              v137 = iTunesCloudLibrary_14584();
              v136 = (id *)dlsym(v137, "ICStorePlatformAudioTraitHiResLossless");
              *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v136;
              getICStorePlatformAudioTraitHiResLosslessSymbolLoc_ptr = (uint64_t)v136;
            }
            _Block_object_dispose(&buf, 8);
            if (!v136)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformAudioTraitHiResLossless(void)");
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v160, "handleFailureInFunction:file:lineNumber:description:", v161, CFSTR("ML3StoreItemTrackData.m"), 46, CFSTR("%s"), dlerror());

              goto LABEL_183;
            }
            v138 = *v136;
            v139 = objc_msgSend(v127, "isEqualToString:", v138);

            if (v139)
            {
              v123 |= 0x10uLL;
            }
            else
            {
              *(_QWORD *)&buf = 0;
              *((_QWORD *)&buf + 1) = &buf;
              v191 = 0x2020000000;
              v140 = (id *)getICStorePlatformAudioTraitLossyStereoSymbolLoc_ptr;
              v192 = getICStorePlatformAudioTraitLossyStereoSymbolLoc_ptr;
              if (!getICStorePlatformAudioTraitLossyStereoSymbolLoc_ptr)
              {
                v141 = iTunesCloudLibrary_14584();
                v140 = (id *)dlsym(v141, "ICStorePlatformAudioTraitLossyStereo");
                *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v140;
                getICStorePlatformAudioTraitLossyStereoSymbolLoc_ptr = (uint64_t)v140;
              }
              _Block_object_dispose(&buf, 8);
              if (!v140)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformAudioTraitLossyStereo(void)");
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "handleFailureInFunction:file:lineNumber:description:", v163, CFSTR("ML3StoreItemTrackData.m"), 49, CFSTR("%s"), dlerror());

                goto LABEL_183;
              }
              v142 = *v140;
              v143 = objc_msgSend(v127, "isEqualToString:", v142);

              if (v143)
              {
                v123 |= 8uLL;
              }
              else
              {
                *(_QWORD *)&buf = 0;
                *((_QWORD *)&buf + 1) = &buf;
                v191 = 0x2020000000;
                v144 = (id *)getICStorePlatformAudioTraitAtmosSymbolLoc_ptr;
                v192 = getICStorePlatformAudioTraitAtmosSymbolLoc_ptr;
                if (!getICStorePlatformAudioTraitAtmosSymbolLoc_ptr)
                {
                  v145 = iTunesCloudLibrary_14584();
                  v144 = (id *)dlsym(v145, "ICStorePlatformAudioTraitAtmos");
                  *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v144;
                  getICStorePlatformAudioTraitAtmosSymbolLoc_ptr = (uint64_t)v144;
                }
                _Block_object_dispose(&buf, 8);
                if (!v144)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v164 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformAudioTraitAtmos(void)");
                  v165 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v164, "handleFailureInFunction:file:lineNumber:description:", v165, CFSTR("ML3StoreItemTrackData.m"), 47, CFSTR("%s"), dlerror());

                  goto LABEL_183;
                }
                v146 = *v144;
                v147 = objc_msgSend(v127, "isEqualToString:", v146);

                if (v147)
                {
                  v123 |= 1uLL;
                }
                else
                {
                  *(_QWORD *)&buf = 0;
                  *((_QWORD *)&buf + 1) = &buf;
                  v191 = 0x2020000000;
                  v148 = (id *)getICStorePlatformAudioTraitSurroundSymbolLoc_ptr;
                  v192 = getICStorePlatformAudioTraitSurroundSymbolLoc_ptr;
                  if (!getICStorePlatformAudioTraitSurroundSymbolLoc_ptr)
                  {
                    v149 = iTunesCloudLibrary_14584();
                    v148 = (id *)dlsym(v149, "ICStorePlatformAudioTraitSurround");
                    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v148;
                    getICStorePlatformAudioTraitSurroundSymbolLoc_ptr = (uint64_t)v148;
                  }
                  _Block_object_dispose(&buf, 8);
                  if (!v148)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v166 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformAudioTraitSurround(void)");
                    v167 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v166, "handleFailureInFunction:file:lineNumber:description:", v167, CFSTR("ML3StoreItemTrackData.m"), 48, CFSTR("%s"), dlerror());

LABEL_183:
                    __break(1u);
                  }
                  v150 = *v148;
                  v151 = objc_msgSend(v127, "isEqualToString:", v150);

                  if (v151)
                  {
                    v123 |= 2uLL;
                  }
                  else
                  {
                    v152 = os_log_create("com.apple.amp.medialibrary", "Default");
                    if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
                    {
                      LODWORD(buf) = 138543362;
                      *(_QWORD *)((char *)&buf + 4) = v127;
                      _os_log_impl(&dword_1AC149000, v152, OS_LOG_TYPE_ERROR, "[ML3StoreItemTrackData] unsupported audio trait %{public}@", (uint8_t *)&buf, 0xCu);
                    }

                  }
                }
              }
            }
          }
        }
      }
      v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v180, v188, 16);
    }
    while (v124);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v123);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "setObject:forKeyedSubscript:", v153, &unk_1E5BABD60);

LABEL_176:
  v154 = v178;

  return v154;
}

- (id)_artworkTokenFromLookupItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "collectionStoreAdamID");
  v6 = objc_msgSend(v4, "storeAdamID");

  return -[ML3StoreItemTrackData _artworkTokenForItemWithCollectionID:itemID:](self, "_artworkTokenForItemWithCollectionID:itemID:", v5, v6);
}

- (id)_artworkTokenForItemWithCollectionID:(int64_t)a3 itemID:(int64_t)a4
{
  void *v4;
  void *v6;

  if (a3 < 1)
  {
    if (a4 < 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("store_item_id=%lld"), a4, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("store_collection_id=%lld"), a4, a3);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (int64_t)_episodeTypeFromVideoSubTypeString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("episode")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("episodebonus")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("seasonbonus")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tvtrailer")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tvextra")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("tvinterview")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_lookupItemArtworksForArtworkDictionaries:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v14;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = 0;
            v21 = &v20;
            v22 = 0x2050000000;
            v10 = (void *)getICStoreArtworkInfoClass_softClass;
            v23 = getICStoreArtworkInfoClass_softClass;
            if (!getICStoreArtworkInfoClass_softClass)
            {
              v19[0] = MEMORY[0x1E0C809B0];
              v19[1] = 3221225472;
              v19[2] = __getICStoreArtworkInfoClass_block_invoke;
              v19[3] = &unk_1E5B64C48;
              v19[4] = &v20;
              __getICStoreArtworkInfoClass_block_invoke((uint64_t)v19);
              v10 = (void *)v21[3];
            }
            v11 = objc_retainAutorelease(v10);
            _Block_object_dispose(&v20, 8);
            v12 = (void *)objc_msgSend([v11 alloc], "initWithArtworkResponseDictionary:", v9);
            if (v12)
              objc_msgSend(v3, "addObject:", v12);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
      }
      while (v6);
    }

  }
  return v3;
}

- (double)_songDurationFromOffersArray:(id)a3
{
  unint64_t v3;
  double v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  double v12;
  id obj;
  uint64_t v15;
  uint64_t v16;
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
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  v3 = 0;
  if (v16)
  {
    v15 = *(_QWORD *)v22;
    v4 = 0.0;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("assets"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v18 != v9)
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("duration"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v11, "doubleValue");
                v4 = v4 + v12;
                ++v3;
              }

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v8);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
  }
  else
  {
    v4 = 0.0;
  }

  return v4 / (double)v3;
}

- (id)_allSongItemsFromLookupItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
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
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[ML3StoreItemTrackData _allSongItemsFromCollectionLookupItem:](self, "_allSongItemsFromCollectionLookupItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_allSongItemsFromCollectionLookupItem:(id)a3
{
  void *v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE v70[128];
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v61 = 0;
  v62 = (uint64_t)&v61;
  v63 = 0x2020000000;
  v4 = (id *)getICStorePlatformMetadataKindAlbumSymbolLoc_ptr;
  v64 = (void *)getICStorePlatformMetadataKindAlbumSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindAlbumSymbolLoc_ptr)
  {
    v5 = iTunesCloudLibrary_14584();
    v4 = (id *)dlsym(v5, "ICStorePlatformMetadataKindAlbum");
    *(_QWORD *)(v62 + 24) = v4;
    getICStorePlatformMetadataKindAlbumSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v61, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformMetadataKindAlbum(void)");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, CFSTR("ML3StoreItemTrackData.m"), 39, CFSTR("%s"), dlerror());

    goto LABEL_48;
  }
  v6 = *v4;
  getICStorePlatformMetadataKindArtist();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v62 = (uint64_t)&v61;
  v63 = 0x2020000000;
  v8 = (id *)getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr_14607;
  v64 = (void *)getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr_14607;
  if (!getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr_14607)
  {
    v9 = iTunesCloudLibrary_14584();
    v8 = (id *)dlsym(v9, "ICStorePlatformMetadataKindPlaylist");
    *(_QWORD *)(v62 + 24) = v8;
    getICStorePlatformMetadataKindPlaylistSymbolLoc_ptr_14607 = (uint64_t)v8;
  }
  _Block_object_dispose(&v61, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformMetadataKindPlaylist(void)");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("ML3StoreItemTrackData.m"), 30, CFSTR("%s"), dlerror());

    goto LABEL_48;
  }
  v10 = *v8;
  v61 = 0;
  v62 = (uint64_t)&v61;
  v63 = 0x2020000000;
  v11 = (_QWORD *)getICStorePlatformMetadataKindTVSeasonSymbolLoc_ptr;
  v64 = (void *)getICStorePlatformMetadataKindTVSeasonSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindTVSeasonSymbolLoc_ptr)
  {
    v12 = iTunesCloudLibrary_14584();
    v11 = dlsym(v12, "ICStorePlatformMetadataKindTVSeason");
    *(_QWORD *)(v62 + 24) = v11;
    getICStorePlatformMetadataKindTVSeasonSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v61, 8);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformMetadataKindTVSeason(void)");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("ML3StoreItemTrackData.m"), 38, CFSTR("%s"), dlerror());

LABEL_48:
    __break(1u);
  }
  objc_msgSend(v3, "setWithObjects:", v6, v7, v10, *v11, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "kind");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ML3StoreItemTrackData _platformMetadataItemIsMusicKind:](self, "_platformMetadataItemIsMusicKind:", v56)
    || -[ML3StoreItemTrackData _platformMetadataItemIsAUCKind:](self, "_platformMetadataItemIsAUCKind:", v56)
    || -[ML3StoreItemTrackData _platformMetadataItemIsVideoKind:](self, "_platformMetadataItemIsVideoKind:", v56))
  {
    v71[0] = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v53, "containsObject:", v52))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v56, "metadataDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("children"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("childrenIds"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("children"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allKeys");
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v19;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v58 != v22)
            objc_enumerationMutation(obj);
          objc_msgSend(v16, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i));
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend((id)v24, "mutableCopy");

          objc_msgSend(v56, "kind");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          getICStorePlatformMetadataKindArtist();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v24) = objc_msgSend(v26, "isEqualToString:", v27);

          if ((v24 & 1) == 0)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("artwork"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("artwork"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, CFSTR("albumArtwork"));

            }
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("artistId"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("artistId"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v31, CFSTR("albumArtistId"));

            }
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("artistName"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("artistName"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v33, CFSTR("albumArtistName"));

            }
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("copyright"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("copyright"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, CFSTR("copyright"));

            }
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isMasteredForItunes"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isMasteredForItunes"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v37, CFSTR("isMasteredForItunes"));

            }
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isCompilation"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isCompilation"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v39, CFSTR("isCompilation"));

            }
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("seasonNumber"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (v40)
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("seasonNumber"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v41, CFSTR("episodeSeasonNumber"));

            }
          }
          v66 = 0;
          v67 = &v66;
          v68 = 0x2050000000;
          v42 = (void *)getICStorePlatformMetadataClass_softClass;
          v69 = getICStorePlatformMetadataClass_softClass;
          if (!getICStorePlatformMetadataClass_softClass)
          {
            v61 = MEMORY[0x1E0C809B0];
            v62 = 3221225472;
            v63 = (uint64_t)__getICStorePlatformMetadataClass_block_invoke;
            v64 = &unk_1E5B64C48;
            v65 = &v66;
            __getICStorePlatformMetadataClass_block_invoke((uint64_t)&v61);
            v42 = (void *)v67[3];
          }
          v43 = objc_retainAutorelease(v42);
          _Block_object_dispose(&v66, 8);
          v44 = (void *)objc_msgSend([v43 alloc], "initWithMetadataDictionary:", v25);
          -[ML3StoreItemTrackData _allSongItemsFromCollectionLookupItem:](self, "_allSongItemsFromCollectionLookupItem:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObjectsFromArray:", v45);

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      }
      while (v21);
    }

  }
  else
  {
    v13 = (id)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (BOOL)_platformMetadataItem:(id)a3 matchesKind:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "compare:options:", v6, 1) == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_platformMetadataItemIsMusicKind:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[ML3StoreItemTrackData _platformMetadataItemIsSongKind:](self, "_platformMetadataItemIsSongKind:", v4)
    || -[ML3StoreItemTrackData _platformMetadataItemIsMusicVideoKind:](self, "_platformMetadataItemIsMusicVideoKind:", v4);

  return v5;
}

- (BOOL)_platformMetadataItemIsSongKind:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  BOOL v7;
  BOOL result;
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
  v5 = (_QWORD *)getICStorePlatformMetadataKindSongSymbolLoc_ptr;
  v14 = getICStorePlatformMetadataKindSongSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindSongSymbolLoc_ptr)
  {
    v6 = iTunesCloudLibrary_14584();
    v5 = dlsym(v6, "ICStorePlatformMetadataKindSong");
    v12[3] = (uint64_t)v5;
    getICStorePlatformMetadataKindSongSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    v7 = -[ML3StoreItemTrackData _platformMetadataItem:matchesKind:](self, "_platformMetadataItem:matchesKind:", v4, *v5);

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformMetadataKindSong(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("ML3StoreItemTrackData.m"), 32, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)_platformMetadataItemIsMusicVideoKind:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  BOOL v7;
  BOOL result;
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
  v5 = (_QWORD *)getICStorePlatformMetadataKindMusicVideoSymbolLoc_ptr;
  v14 = getICStorePlatformMetadataKindMusicVideoSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindMusicVideoSymbolLoc_ptr)
  {
    v6 = iTunesCloudLibrary_14584();
    v5 = dlsym(v6, "ICStorePlatformMetadataKindMusicVideo");
    v12[3] = (uint64_t)v5;
    getICStorePlatformMetadataKindMusicVideoSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    v7 = -[ML3StoreItemTrackData _platformMetadataItem:matchesKind:](self, "_platformMetadataItem:matchesKind:", v4, *v5);

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformMetadataKindMusicVideo(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("ML3StoreItemTrackData.m"), 33, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)_platformMetadataItemIsAUCKind:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[ML3StoreItemTrackData _platformMetadataItemIsAUCAudioKind:](self, "_platformMetadataItemIsAUCAudioKind:", v4)
    || -[ML3StoreItemTrackData _platformMetadataItemIsAUCVideoKind:](self, "_platformMetadataItemIsAUCVideoKind:", v4);

  return v5;
}

- (BOOL)_platformMetadataItemIsAUCAudioKind:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  BOOL v7;
  BOOL result;
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
  v5 = (_QWORD *)getICStorePlatformMetadataKindUploadedAudioSymbolLoc_ptr;
  v14 = getICStorePlatformMetadataKindUploadedAudioSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindUploadedAudioSymbolLoc_ptr)
  {
    v6 = iTunesCloudLibrary_14584();
    v5 = dlsym(v6, "ICStorePlatformMetadataKindUploadedAudio");
    v12[3] = (uint64_t)v5;
    getICStorePlatformMetadataKindUploadedAudioSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    v7 = -[ML3StoreItemTrackData _platformMetadataItem:matchesKind:](self, "_platformMetadataItem:matchesKind:", v4, *v5);

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformMetadataKindUploadedAudio(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("ML3StoreItemTrackData.m"), 34, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)_platformMetadataItemIsAUCVideoKind:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  BOOL v7;
  BOOL result;
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
  v5 = (_QWORD *)getICStorePlatformMetadataKindUploadedVideoSymbolLoc_ptr;
  v14 = getICStorePlatformMetadataKindUploadedVideoSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindUploadedVideoSymbolLoc_ptr)
  {
    v6 = iTunesCloudLibrary_14584();
    v5 = dlsym(v6, "ICStorePlatformMetadataKindUploadedVideo");
    v12[3] = (uint64_t)v5;
    getICStorePlatformMetadataKindUploadedVideoSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    v7 = -[ML3StoreItemTrackData _platformMetadataItem:matchesKind:](self, "_platformMetadataItem:matchesKind:", v4, *v5);

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformMetadataKindUploadedVideo(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("ML3StoreItemTrackData.m"), 35, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)_platformMetadataItemIsVideoKind:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[ML3StoreItemTrackData _platformMetadataItemIsTVShowKind:](self, "_platformMetadataItemIsTVShowKind:", v4)
    || -[ML3StoreItemTrackData _platformMetadataItemIsMovieKind:](self, "_platformMetadataItemIsMovieKind:", v4);

  return v5;
}

- (BOOL)_platformMetadataItemIsTVShowKind:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  BOOL v7;
  BOOL result;
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
  v5 = (_QWORD *)getICStorePlatformMetadataKindTVEpisodeSymbolLoc_ptr;
  v14 = getICStorePlatformMetadataKindTVEpisodeSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindTVEpisodeSymbolLoc_ptr)
  {
    v6 = iTunesCloudLibrary_14584();
    v5 = dlsym(v6, "ICStorePlatformMetadataKindTVEpisode");
    v12[3] = (uint64_t)v5;
    getICStorePlatformMetadataKindTVEpisodeSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    v7 = -[ML3StoreItemTrackData _platformMetadataItem:matchesKind:](self, "_platformMetadataItem:matchesKind:", v4, *v5);

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformMetadataKindTVEpisode(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("ML3StoreItemTrackData.m"), 36, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)_platformMetadataItemIsMovieKind:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  BOOL v7;
  BOOL result;
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
  v5 = (_QWORD *)getICStorePlatformMetadataKindMovieSymbolLoc_ptr;
  v14 = getICStorePlatformMetadataKindMovieSymbolLoc_ptr;
  if (!getICStorePlatformMetadataKindMovieSymbolLoc_ptr)
  {
    v6 = iTunesCloudLibrary_14584();
    v5 = dlsym(v6, "ICStorePlatformMetadataKindMovie");
    v12[3] = (uint64_t)v5;
    getICStorePlatformMetadataKindMovieSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    v7 = -[ML3StoreItemTrackData _platformMetadataItem:matchesKind:](self, "_platformMetadataItem:matchesKind:", v4, *v5);

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStorePlatformMetadataKindMovie(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("ML3StoreItemTrackData.m"), 37, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (id)_bestAlbumArtworkImageURLFromStoreArtworkVariants:(id)a3
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
  v5 = (_QWORD *)getICStoreArtworkInfoCropStyleBoundedBoxSymbolLoc_ptr;
  v14 = getICStoreArtworkInfoCropStyleBoundedBoxSymbolLoc_ptr;
  if (!getICStoreArtworkInfoCropStyleBoundedBoxSymbolLoc_ptr)
  {
    v6 = iTunesCloudLibrary_14584();
    v5 = dlsym(v6, "ICStoreArtworkInfoCropStyleBoundedBox");
    v12[3] = (uint64_t)v5;
    getICStoreArtworkInfoCropStyleBoundedBoxSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    -[ML3StoreItemTrackData _bestArtworkImageURLFromStoreArtworkVariants:cropStyle:](self, "_bestArtworkImageURLFromStoreArtworkVariants:cropStyle:", v4, *v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStoreArtworkInfoCropStyleBoundedBox(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("ML3StoreItemTrackData.m"), 41, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
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
  v5 = (_QWORD *)getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr_14596;
  v14 = getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr_14596;
  if (!getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr_14596)
  {
    v6 = iTunesCloudLibrary_14584();
    v5 = dlsym(v6, "ICStoreArtworkInfoCropStyleSquareCenterCrop");
    v12[3] = (uint64_t)v5;
    getICStoreArtworkInfoCropStyleSquareCenterCropSymbolLoc_ptr_14596 = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    -[ML3StoreItemTrackData _bestArtworkImageURLFromStoreArtworkVariants:cropStyle:](self, "_bestArtworkImageURLFromStoreArtworkVariants:cropStyle:", v4, *v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStoreArtworkInfoCropStyleSquareCenterCrop(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("ML3StoreItemTrackData.m"), 42, CFSTR("%s"), dlerror());

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
  v36 = (id *)getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr_14583;
  v51 = getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr_14583;
  if (!getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr_14583)
  {
    v37 = iTunesCloudLibrary_14584();
    v36 = (id *)dlsym(v37, "ICStoreArtworkInfoImageFormatJPEG");
    v49[3] = (uint64_t)v36;
    getICStoreArtworkInfoImageFormatJPEGSymbolLoc_ptr_14583 = (uint64_t)v36;
  }
  _Block_object_dispose(&v48, 8);
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICStoreArtworkInfoImageFormatJPEG(void)");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("ML3StoreItemTrackData.m"), 43, CFSTR("%s"), dlerror());

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
  objc_storeStrong((id *)&self->_storePlatformDateFormatter, 0);
  objc_storeStrong((id *)&self->_parsedStoreItemsImportProperties, 0);
  objc_storeStrong((id *)&self->_trackData, 0);
  objc_storeStrong((id *)&self->_lookupItems, 0);
}

void __51__ML3StoreItemTrackData__parentDictForItemAlbumId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "allItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      if (-[NSObject artistStoreAdamID](v7, "artistStoreAdamID"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NSObject artistStoreAdamID](v7, "artistStoreAdamID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v11, CFSTR("albumArtistId"));

      }
      -[NSObject artistName](v7, "artistName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[NSObject artistName](v7, "artistName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v13, CFSTR("albumArtistName"));

      }
    }
  }
  else
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v5;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "[ML3StoreItemTrackData] Error fetching album parent store content for item add. %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
