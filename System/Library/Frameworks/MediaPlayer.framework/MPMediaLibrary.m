@implementation MPMediaLibrary

- (id)uniqueIdentifier
{
  return (id)-[MPMediaLibraryDataProviderPrivate uniqueIdentifier](self->_libraryDataProvider, "uniqueIdentifier");
}

void __37__MPMediaLibrary_defaultMediaLibrary__block_invoke(uint64_t a1)
{
  if (__defaultMediaLibraryOverride)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)__defaultMediaLibraryOverride);
}

- (void)_setLibraryFilterPredicates
{
  int64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[16];

  if (+[MPMediaLibrary authorizationStatus](MPMediaLibrary, "authorizationStatus") == MPMediaLibraryAuthorizationStatusAuthorized)
  {
    -[MPMediaLibrary additionalLibraryFilterPredicates](self, "additionalLibraryFilterPredicates");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[MPMediaLibrary cloudFilteringType](self, "cloudFilteringType");
    -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLibraryEntityFilterPredicatesWithCloudFilteringType:additionalFilterPredicates:", v3, v17);

    }
    -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLibraryContainerFilterPredicatesWithCloudFilteringType:additionalFilterPredicates:", v3, v17);

    }
    -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLibraryPublicEntityFilterPredicatesWithCloudFilteringType:additionalFilterPredicates:", v3, v17);

    }
    -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLibraryPublicContainerFilterPredicatesWithCloudFilteringType:additionalFilterPredicates:", v3, v17);

    }
  }
  else
  {
    v16 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_ERROR, "Not authorized, skipping filter predicate application", buf, 2u);
    }

  }
}

- (id)libraryDataProvider
{
  return self->_libraryDataProvider;
}

+ (MPMediaLibraryAuthorizationStatus)authorizationStatus
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "_sharedCloudServiceStatusMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "authorizationStatusForScopes:", 2);

  return objc_msgSend(a1, "_mediaLibraryAuthorizationStatusFromCloudServiceAuthorizationStatus:", v4);
}

+ (id)_sharedCloudServiceStatusMonitor
{
  if (_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitorOnceToken != -1)
    dispatch_once(&_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitorOnceToken, &__block_literal_global_148);
  return (id)_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitor;
}

+ (int64_t)_mediaLibraryAuthorizationStatusFromCloudServiceAuthorizationStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (int64_t)cloudFilteringType
{
  int64_t v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MPMediaLibrary_cloudFilteringType__block_invoke;
  block[3] = &unk_1E31639A0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)__serialAccessQueue, block);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)additionalLibraryFilterPredicates
{
  NSObject *additionalLibraryFilterPredicatesAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__13969;
  v10 = __Block_byref_object_dispose__13970;
  v11 = 0;
  additionalLibraryFilterPredicatesAccessQueue = self->_additionalLibraryFilterPredicatesAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__MPMediaLibrary_additionalLibraryFilterPredicates__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(additionalLibraryFilterPredicatesAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (ICUserIdentity)userIdentity
{
  ICUserIdentity *userIdentity;

  userIdentity = self->_userIdentity;
  if (userIdentity)
    return userIdentity;
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  return (ICUserIdentity *)(id)objc_claimAutoreleasedReturnValue();
}

void __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__13969;
  v22 = __Block_byref_object_dispose__13970;
  v23 = 0;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[2] = __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_4;
  block[3] = &unk_1E3156FB8;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v13 = v4;
  v7 = v3;
  v14 = v7;
  v15 = *(id *)(a1 + 48);
  v17 = &v18;
  v16 = *(id *)(a1 + 56);
  dispatch_sync(v5, block);
  v8 = (void *)v19[5];
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_5;
  v10[3] = &unk_1E31560C8;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  _Block_object_dispose(&v18, 8);
}

void __52__MPMediaLibrary_connectionAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160))
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 160);
    *(_QWORD *)(v3 + 160) = v2;

  }
  v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v13 = 134218242;
    v14 = v6;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%p Taking connection assertion: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "addPointer:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count") == 1
    && (objc_msgSend(*(id *)(a1 + 32), "isDeviceLibrary") & 1) == 0)
  {
    v8 = SBSSpringBoardServerPort();
    MEMORY[0x194038AD0](v8, *(_QWORD *)(a1 + 32) + 231, *(_QWORD *)(a1 + 32) + 232);
    v9 = SBSSpringBoardServerPort();
    MEMORY[0x194038AF4](v9, 1, 1);
  }
  v10 = os_log_create("com.apple.amp.mediaplayer", "Library_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v11 + 160), "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218242;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "%p Active assertions: %{public}@", (uint8_t *)&v13, 0x16u);

  }
}

- (BOOL)isDeviceLibrary
{
  void *v3;
  BOOL v4;
  BOOL v5;
  void *v6;
  int v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MPMediaLibrary isEqual:](self, "isEqual:", v3);

  if (v4)
    return 1;
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsMultipleITunesAccounts");

  if (!v7)
    return 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__MPMediaLibrary_isDeviceLibrary__block_invoke;
  v9[3] = &unk_1E3163580;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync((dispatch_queue_t)__defaultMediaLibraryQueue, v9);
  v5 = *((_BYTE *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[MPMediaLibrary uniqueIdentifier](self, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)itemExistsWithPersistentID:(unint64_t)a3
{
  MPMediaQuery *v6;
  void *v7;
  void *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[MPMediaLibraryDataProviderPrivate itemExistsWithPersistentID:](self->_libraryDataProvider, "itemExistsWithPersistentID:", a3);
  v6 = objc_alloc_init(MPMediaQuery);
  -[MPMediaQuery setMediaLibrary:](v6, "setMediaLibrary:", self);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v7, CFSTR("persistentID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaQuery addFilterPredicate:](v6, "addFilterPredicate:", v8);

  LOBYTE(v7) = -[MPMediaQuery _hasItems](v6, "_hasItems");
  return (char)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)deviceMediaLibraryWithUserIdentity:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  __objc2_class *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsMultipleITunesAccounts");

  if ((v6 & 1) == 0)
  {
    v8 = MPMediaLibrary;
LABEL_6:
    -[__objc2_class deviceMediaLibrary](v8, "deviceMediaLibrary");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v4)
  {
    v8 = (__objc2_class *)a1;
    goto LABEL_6;
  }
  +[MPMediaLibrary _deviceMediaLibraryWithUserIdentity:createIfRequired:](MPMediaLibrary, "_deviceMediaLibraryWithUserIdentity:createIfRequired:", v4, 1);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)v7;

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MPMediaLibrary uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibrary userIdentity](self, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MPMediaLibrary: %p> uniqueID=%@ [%@] dataProvider: %p"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)_syncValidity
{
  return (NSString *)-[MPMediaLibraryDataProviderPrivate syncValidity](self->_libraryDataProvider, "syncValidity");
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MPMediaLibrary uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isHomeSharingLibrary
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)artworkDataSource
{
  void *v2;
  void *v3;

  -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itemWithPersistentID:(unint64_t)a3 verifyExistence:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;

  v4 = a4;
  +[MPConcreteMediaItem concreteMediaItemWithPersistentID:library:](MPConcreteMediaItem, "concreteMediaItemWithPersistentID:library:", a3, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && (objc_msgSend(v5, "existsInLibrary") & 1) == 0)
  {

    v6 = 0;
  }
  return v6;
}

- (shared_ptr<mlcore::DeviceLibrary>)_MediaLibrary_coreLibrary
{
  _QWORD *v2;
  MPMediaLibrary *v3;
  _MPMediaLibraryMLCoreStorage *v4;
  char *v5;
  dispatch_semaphore_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  std::string *v29;
  std::string *v30;
  std::string *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  std::__split_buffer<std::string>::pointer begin;
  __int128 v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  __int128 v49;
  std::string *v50;
  char *v51;
  void *v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  std::vector<std::string>::pointer end;
  __int128 v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  std::string *v74;
  __int128 v75;
  std::string *v76;
  char *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t k;
  void **v83;
  __int128 v84;
  void **v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  char *v89;
  char *v90;
  char *v91;
  __int128 v92;
  void **v93;
  id v94;
  unint64_t *p_shared_owners;
  unint64_t v96;
  std::__shared_weak_count *v97;
  unint64_t *v98;
  unint64_t v99;
  std::__shared_weak_count *v100;
  unint64_t *v101;
  unint64_t v102;
  id v103;
  uint64_t v104;
  id v105;
  MPMediaLibrary *v106;
  uint64_t v107;
  uint64_t v108;
  std::__shared_weak_count *v109;
  unint64_t *v110;
  unint64_t v111;
  uint64_t v112;
  id v113;
  MPMediaLibrary *v114;
  uint64_t v115;
  uint64_t v116;
  std::__shared_weak_count *v117;
  unint64_t *v118;
  unint64_t v119;
  uint64_t v120;
  id v121;
  MPMediaLibrary *v122;
  uint64_t v123;
  uint64_t v124;
  std::__shared_weak_count *v125;
  unint64_t *v126;
  unint64_t v127;
  uint64_t v128;
  id v129;
  MPMediaLibrary *v130;
  uint64_t v131;
  std::__shared_weak_count *v132;
  unint64_t *v133;
  unint64_t v134;
  uint64_t v135;
  DeviceLibrary *v136;
  __shared_weak_count *v137;
  void *v138;
  void *v139;
  void *v140;
  __CFString *v141;
  id v142;
  id v143;
  id v144;
  id v145;
  void *v146;
  void *v147;
  __CFString *v148;
  void *v149;
  _QWORD *v150;
  MPMediaLibrary *v151;
  id obj;
  uint64_t v153;
  uint64_t v154;
  unsigned int v155;
  unsigned int v156;
  id v157;
  void *v158;
  id v159;
  id v160;
  id v161;
  id v162;
  uint64_t v163;
  std::__shared_weak_count *v164;
  uint64_t v165;
  std::__shared_weak_count *v166;
  uint64_t v167;
  std::__shared_weak_count *v168;
  uint64_t v169;
  std::__shared_weak_count *v170;
  std::string v171;
  void **v172;
  std::__shared_weak_count *v173;
  std::string *v174;
  std::string *v175;
  std::string *v176;
  uint64_t v177;
  void *v178;
  char v179;
  uint64_t v180;
  void *v181;
  char v182;
  uint64_t v183;
  _QWORD v184[4];
  _QWORD v185[4];
  uint64_t v186;
  uint64_t v187;
  void *v188[2];
  char v189;
  void *v190[2];
  char v191;
  void *v192[2];
  char v193;
  std::string __s;
  _QWORD v195[4];
  NSObject *v196;
  void *v197[2];
  char v198;
  void *v199[2];
  std::string::size_type v200;
  uint64_t v201;
  void *v202;
  char v203;
  void *v204[2];
  char v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  void *v210;
  char *v211;
  char *v212;
  void *v213[2];
  char v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  std::vector<std::string> v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  char *v228;
  void *v229;
  unint64_t v230;
  _QWORD v231[5];
  std::string **v232;
  std::string ***v233;
  uint64_t v234;
  uint64_t (*v235)(uint64_t, _QWORD *);
  uint64_t (*v236)(uint64_t);
  _BYTE v237[32];
  uint64_t v238;
  int v239;
  _QWORD v240[5];
  _QWORD v241[5];
  _QWORD v242[4];
  _QWORD v243[4];
  void *v244;
  std::__split_buffer<std::string> v245[3];
  void *__p;
  __int128 v247;
  unint64_t v248;
  __int128 v249;
  uint64_t v250;
  void *v251;
  uint64_t v252;
  std::__split_buffer<std::string>::pointer *p_begin;
  std::__shared_weak_count *v254;
  void **v255;
  char v256;
  __int128 v257;
  uint64_t v258;
  uint64_t (*v259)(uint64_t, _QWORD *);
  uint64_t (*v260)(uint64_t);
  _BYTE v261[32];
  uint64_t v262;
  int v263;
  uint64_t v264;
  shared_ptr<mlcore::DeviceLibrary> result;

  v150 = v2;
  v264 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(self);
  os_unfair_lock_lock(-[MPMediaLibrary _MLCoreStorageLockPointer](v3, "_MLCoreStorageLockPointer"));
  v151 = v3;
  -[MPMediaLibrary _MLCoreStorage](v3, "_MLCoreStorage");
  v4 = (_MPMediaLibraryMLCoreStorage *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[MPMediaLibrary databasePath](v3, "databasePath");
    v148 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString lastPathComponent](v148, "lastPathComponent");
    v141 = (__CFString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (char *)-[__CFString UTF8String](v141, "UTF8String");
    if (!v5)
    {
      v6 = dispatch_semaphore_create(0);
      -[MPMediaLibrary _dataProviderDescription](v3, "_dataProviderDescription");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = (void *)MEMORY[0x1E0D4D030];
      v242[0] = CFSTR("MPMediaLibrary");
      v242[1] = CFSTR("databasePath");
      v10 = CFSTR("nil");
      v11 = v148;
      if (!v148)
        v11 = CFSTR("nil");
      v243[0] = v151;
      v243[1] = v11;
      v242[2] = CFSTR("databaseNameString");
      v242[3] = CFSTR("dataProviderDescription");
      if (v141)
        v12 = v141;
      else
        v12 = CFSTR("nil");
      if (v7)
        v10 = (const __CFString *)v7;
      v243[2] = v12;
      v243[3] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v243, v242, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v244 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v244, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x1E0D4CE38];
      v195[0] = MEMORY[0x1E0C809B0];
      v195[1] = 3221225472;
      v195[2] = __61__MPMediaLibrary_MediaLibraryCore___MediaLibrary_coreLibrary__block_invoke;
      v195[3] = &unk_1E3163508;
      v16 = v6;
      v196 = v16;
      objc_msgSend(v9, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v15, CFSTR("Bug"), CFSTR("Invalid Database Path"), CFSTR("databaseNameStringPtr is null"), 0, v14, v195);

      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    }
    std::string::basic_string[abi:ne180100]<0>(&__s, v5);
    -[__CFString stringByDeletingLastPathComponent](v148, "stringByDeletingLastPathComponent");
    v143 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v143, "fileSystemRepresentation");
    if (v17)
      v18 = (char *)v17;
    else
      v18 = "";
    std::string::basic_string[abi:ne180100]<0>(v192, v18);
    v19 = (void *)MEMORY[0x1E0CB3940];
    MSVSystemRootDirectory();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = CFSTR("/");
    if (v20)
      v22 = (const __CFString *)v20;
    v241[0] = v22;
    v241[1] = CFSTR("System");
    v241[2] = CFSTR("Library");
    v241[3] = CFSTR("PrivateFrameworks");
    v241[4] = CFSTR("MediaLibraryCore.framework");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v241, 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pathWithComponents:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v144 = objc_retainAutorelease(v24);
    v25 = objc_msgSend(v144, "fileSystemRepresentation");
    if (v25)
      v26 = (char *)v25;
    else
      v26 = "";
    std::string::basic_string[abi:ne180100]<0>(v190, v26);
    NSTemporaryDirectory();
    v145 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = objc_msgSend(v145, "fileSystemRepresentation");
    if (v27)
      v28 = (char *)v27;
    else
      v28 = "";
    std::string::basic_string[abi:ne180100]<0>(v188, v28);
    MEMORY[0x194038D1C](&v251, v192);
    MEMORY[0x194038D1C](&__p, v188);
    MEMORY[0x194038D1C](v245, v190);
    std::string::basic_string[abi:ne180100]<0>(&v257, "en");
    v174 = 0;
    v175 = 0;
    v176 = 0;
    v232 = &v174;
    LOBYTE(v233) = 0;
    v29 = (std::string *)operator new(0x18uLL);
    v30 = v29;
    v174 = v29;
    v175 = v29;
    v176 = v29 + 1;
    v199[0] = v29;
    *(_QWORD *)&v224 = v29;
    p_begin = &v176;
    v254 = (std::__shared_weak_count *)&v224;
    v255 = v199;
    v256 = 0;
    if (SHIBYTE(v258) < 0)
    {
      std::string::__init_copy_ctor_external(v29, (const std::string::value_type *)v257, *((std::string::size_type *)&v257 + 1));
      v30 = (std::string *)v199[0];
    }
    else
    {
      *(_OWORD *)&v29->__r_.__value_.__l.__data_ = v257;
      v29->__r_.__value_.__r.__words[2] = v258;
    }
    v31 = v30 + 1;
    v199[0] = v31;
    v256 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&p_begin);
    v175 = v31;
    MEMORY[0x194038CA4](&v183, &v251, &__p, v245, &v174);
    p_begin = &v174;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    if (SHIBYTE(v258) < 0)
      operator delete((void *)v257);
    v32 = (void *)(MEMORY[0x1E0D4AF30] + 16);
    v245[0].__first_ = (std::__split_buffer<std::string>::pointer)(MEMORY[0x1E0D4AF30] + 16);
    p_begin = &v245[0].__begin_;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    __p = v32;
    p_begin = (std::__split_buffer<std::string>::pointer *)&v247;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    v251 = v32;
    p_begin = (std::__split_buffer<std::string>::pointer *)&v252;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    objc_msgSend(MEMORY[0x1E0D51268], "sharedResourceManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "resources");
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v149, "sectionsInfo");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "objectForKey:", CFSTR("SectionHeaders"));
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "objectForKey:", CFSTR("LocalizedSectionHeaders"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "objectForKey:", CFSTR("SectionIndices"));
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "objectForKey:", CFSTR("LocalizedSectionIndices"));
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "objectForKey:", CFSTR("NameTransform"));
    v34 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v257 = 0;
    *((_QWORD *)&v257 + 1) = &v257;
    v258 = 0x5812000000;
    v259 = __Block_byref_object_copy__9313;
    v260 = __Block_byref_object_dispose__9314;
    memset(v261, 0, sizeof(v261));
    v262 = 0;
    v263 = 1065353216;
    v35 = MEMORY[0x1E0C809B0];
    v240[0] = MEMORY[0x1E0C809B0];
    v240[1] = 3221225472;
    v240[2] = ___ZL26_MPMLCopyLanguageResourcesv_block_invoke;
    v240[3] = &unk_1E3154998;
    v240[4] = &v257;
    objc_msgSend(v146, "enumerateKeysAndObjectsUsingBlock:", v240);
    v232 = 0;
    v233 = &v232;
    v234 = 0x5812000000;
    v235 = __Block_byref_object_copy__9313;
    v236 = __Block_byref_object_dispose__9314;
    memset(v237, 0, sizeof(v237));
    v238 = 0;
    v239 = 1065353216;
    v231[0] = v35;
    v231[1] = 3221225472;
    v231[2] = ___ZL26_MPMLCopyLanguageResourcesv_block_invoke_2;
    v231[3] = &unk_1E3154998;
    v231[4] = &v232;
    objc_msgSend(v147, "enumerateKeysAndObjectsUsingBlock:", v231);
    v142 = (id)v34;
    v229 = 0;
    v228 = 0;
    v230 = 0;
    v224 = 0u;
    v225 = 0u;
    v226 = 0u;
    v227 = 0u;
    obj = v138;
    v154 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v224, &p_begin, 16);
    if (v154)
    {
      v153 = *(_QWORD *)v225;
      do
      {
        v161 = 0;
        do
        {
          if (*(_QWORD *)v225 != v153)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * (_QWORD)v161);
          objc_msgSend(v36, "objectForKey:", CFSTR("FirstCharacterAfterLanguage"));
          v157 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::basic_string[abi:ne180100]<0>(v245, (char *)objc_msgSend(v157, "UTF8String"));
          mediaplatform::UTF8ToUTF16String();
          if (SHIBYTE(v247) < 0)
          {
            v156 = *(_DWORD *)__p;
            operator delete(__p);
          }
          else
          {
            v156 = __p;
          }
          if (SHIBYTE(v245[0].__end_) < 0)
            operator delete(v245[0].__first_);
          objc_msgSend(v36, "objectForKey:", CFSTR("LastCharacter"));
          v159 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::basic_string[abi:ne180100]<0>(v245, (char *)objc_msgSend(v159, "UTF8String"));
          mediaplatform::UTF8ToUTF16String();
          if (SHIBYTE(v247) < 0)
          {
            v155 = *(_DWORD *)__p;
            operator delete(__p);
          }
          else
          {
            v155 = __p;
          }
          if (SHIBYTE(v245[0].__end_) < 0)
            operator delete(v245[0].__first_);
          objc_msgSend(v36, "objectForKey:", CFSTR("Headers"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          memset(v245, 0, 24);
          v220 = 0u;
          v221 = 0u;
          v222 = 0u;
          v223 = 0u;
          v38 = v37;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v220, &v251, 16);
          if (v39)
          {
            v40 = *(_QWORD *)v221;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v221 != v40)
                  objc_enumerationMutation(v38);
                std::string::basic_string[abi:ne180100]<0>(v199, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v220 + 1) + 8 * i)), "UTF8String"));
                begin = v245[0].__begin_;
                if (v245[0].__begin_ >= v245[0].__end_)
                {
                  v44 = 0xAAAAAAAAAAAAAAABLL * (((char *)v245[0].__begin_ - (char *)v245[0].__first_) >> 3);
                  v45 = v44 + 1;
                  if (v44 + 1 > 0xAAAAAAAAAAAAAAALL)
                    std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
                  if (0x5555555555555556 * (((char *)v245[0].__end_ - (char *)v245[0].__first_) >> 3) > v45)
                    v45 = 0x5555555555555556 * (((char *)v245[0].__end_ - (char *)v245[0].__first_) >> 3);
                  if (0xAAAAAAAAAAAAAAABLL * (((char *)v245[0].__end_ - (char *)v245[0].__first_) >> 3) >= 0x555555555555555)
                    v46 = 0xAAAAAAAAAAAAAAALL;
                  else
                    v46 = v45;
                  *(_QWORD *)&v249 = &v245[0].__end_;
                  if (v46)
                    v46 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v46);
                  else
                    v47 = 0;
                  v48 = v46 + 24 * v44;
                  __p = (void *)v46;
                  *(_QWORD *)&v247 = v48;
                  v248 = v46 + 24 * v47;
                  v49 = *(_OWORD *)v199;
                  *(_QWORD *)(v48 + 16) = v200;
                  *(_OWORD *)v48 = v49;
                  v200 = 0;
                  v199[1] = 0;
                  v199[0] = 0;
                  *((_QWORD *)&v247 + 1) = v48 + 24;
                  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)v245, (std::__split_buffer<std::string> *)&__p);
                  v50 = v245[0].__begin_;
                  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&__p);
                  v245[0].__begin_ = v50;
                  if (SHIBYTE(v200) < 0)
                    operator delete(v199[0]);
                }
                else
                {
                  v43 = *(_OWORD *)v199;
                  v245[0].__begin_->__r_.__value_.__r.__words[2] = v200;
                  *(_OWORD *)&begin->__r_.__value_.__l.__data_ = v43;
                  v245[0].__begin_ = begin + 1;
                }
              }
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v220, &v251, 16);
            }
            while (v39);
          }

          MEMORY[0x1940393A0](&__p, v156, v155, v245, *((_QWORD *)&v257 + 1) + 48);
          v51 = (char *)v229;
          if ((unint64_t)v229 < v230)
          {
            *(_QWORD *)v229 = __p;
            *((_QWORD *)v51 + 1) = 0;
            *((_QWORD *)v51 + 3) = 0;
            *((_QWORD *)v51 + 4) = 0;
            *((_QWORD *)v51 + 2) = 0;
            *(_OWORD *)(v51 + 8) = v247;
            *((_QWORD *)v51 + 3) = v248;
            v247 = 0uLL;
            v248 = 0;
            *((_QWORD *)v51 + 5) = 0;
            *((_QWORD *)v51 + 6) = 0;
            *((_OWORD *)v51 + 2) = v249;
            *((_QWORD *)v51 + 6) = v250;
            v249 = 0uLL;
            v250 = 0;
            v52 = v51 + 56;
            goto LABEL_79;
          }
          v53 = v228;
          v54 = 0x6DB6DB6DB6DB6DB7 * (((_BYTE *)v229 - v228) >> 3);
          v55 = v54 + 1;
          if ((unint64_t)(v54 + 1) > 0x492492492492492)
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v230 - (_QWORD)v228) >> 3) > v55)
            v55 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v230 - (_QWORD)v228) >> 3);
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v230 - (_QWORD)v228) >> 3)) >= 0x249249249249249)
            v56 = 0x492492492492492;
          else
            v56 = v55;
          if (v56 > 0x492492492492492)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v57 = (char *)operator new(56 * v56);
          v58 = v248;
          v59 = &v57[56 * v54];
          *(_QWORD *)v59 = __p;
          *(_OWORD *)(v59 + 8) = v247;
          *((_QWORD *)v59 + 3) = v58;
          v248 = 0;
          v247 = 0uLL;
          *((_OWORD *)v59 + 2) = v249;
          *((_QWORD *)v59 + 6) = v250;
          v250 = 0;
          v52 = v59 + 56;
          v249 = 0uLL;
          if (v51 == v53)
          {
            v228 = v59;
            v229 = v59 + 56;
            v230 = (unint64_t)&v57[56 * v56];
            if (v51)
              goto LABEL_78;
          }
          else
          {
            v60 = 0;
            do
            {
              v61 = &v59[v60];
              v62 = &v51[v60];
              *((_QWORD *)v61 - 7) = *(_QWORD *)&v51[v60 - 56];
              *((_QWORD *)v61 - 6) = 0;
              *((_QWORD *)v61 - 5) = 0;
              *((_QWORD *)v61 - 4) = 0;
              *((_OWORD *)v61 - 3) = *(_OWORD *)&v51[v60 - 48];
              *((_QWORD *)v61 - 4) = *(_QWORD *)&v51[v60 - 32];
              *((_QWORD *)v62 - 6) = 0;
              *((_QWORD *)v62 - 5) = 0;
              *((_QWORD *)v62 - 4) = 0;
              *((_QWORD *)v61 - 3) = 0;
              *((_QWORD *)v61 - 2) = 0;
              *((_QWORD *)v61 - 1) = 0;
              *(_OWORD *)(v61 - 24) = *(_OWORD *)&v51[v60 - 24];
              *((_QWORD *)v61 - 1) = *(_QWORD *)&v51[v60 - 8];
              *((_QWORD *)v62 - 3) = 0;
              *((_QWORD *)v62 - 2) = 0;
              *((_QWORD *)v62 - 1) = 0;
              v60 -= 56;
            }
            while (&v51[v60] != v53);
            v63 = v228;
            v51 = (char *)v229;
            v228 = &v59[v60];
            v229 = v59 + 56;
            v230 = (unint64_t)&v57[56 * v56];
            if (v51 != v63)
            {
              do
              {
                v199[0] = v51 - 24;
                std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v199);
                v199[0] = v51 - 48;
                std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v199);
                v51 -= 56;
              }
              while (v51 != v63);
              v51 = v63;
            }
            if (v51)
LABEL_78:
              operator delete(v51);
          }
LABEL_79:
          v229 = v52;
          v199[0] = &v249;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v199);
          v199[0] = &v247;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v199);
          __p = v245;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

          v161 = (char *)v161 + 1;
        }
        while (v161 != (id)v154);
        v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v224, &p_begin, 16);
        v154 = v64;
      }
      while (v64);
    }

    memset(&v219, 0, sizeof(v219));
    v215 = 0u;
    v216 = 0u;
    v217 = 0u;
    v218 = 0u;
    v162 = v140;
    v65 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v215, &__p, 16);
    if (v65)
    {
      v66 = *(_QWORD *)v216;
      do
      {
        for (j = 0; j != v65; ++j)
        {
          if (*(_QWORD *)v216 != v66)
            objc_enumerationMutation(v162);
          std::string::basic_string[abi:ne180100]<0>(v199, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v215 + 1) + 8 * j)), "UTF8String"));
          end = v219.__end_;
          if (v219.__end_ >= v219.__end_cap_.__value_)
          {
            v70 = 0xAAAAAAAAAAAAAAABLL * (((char *)v219.__end_ - (char *)v219.__begin_) >> 3);
            v71 = v70 + 1;
            if (v70 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * (((char *)v219.__end_cap_.__value_ - (char *)v219.__begin_) >> 3) > v71)
              v71 = 0x5555555555555556 * (((char *)v219.__end_cap_.__value_ - (char *)v219.__begin_) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v219.__end_cap_.__value_ - (char *)v219.__begin_) >> 3) >= 0x555555555555555)
              v72 = 0xAAAAAAAAAAAAAAALL;
            else
              v72 = v71;
            v245[0].__end_cap_.__value_ = (std::allocator<std::string> *)&v219.__end_cap_;
            if (v72)
              v72 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v72);
            else
              v73 = 0;
            v74 = (std::string *)(v72 + 24 * v70);
            v245[0].__first_ = (std::__split_buffer<std::string>::pointer)v72;
            v245[0].__begin_ = v74;
            v245[0].__end_cap_.__value_ = (std::string *)(v72 + 24 * v73);
            v75 = *(_OWORD *)v199;
            v74->__r_.__value_.__r.__words[2] = v200;
            *(_OWORD *)&v74->__r_.__value_.__l.__data_ = v75;
            v200 = 0;
            v199[1] = 0;
            v199[0] = 0;
            v245[0].__end_ = v74 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v219, v245);
            v76 = v219.__end_;
            std::__split_buffer<std::string>::~__split_buffer(v245);
            v219.__end_ = v76;
            if (SHIBYTE(v200) < 0)
              operator delete(v199[0]);
          }
          else
          {
            v69 = *(_OWORD *)v199;
            v219.__end_->__r_.__value_.__r.__words[2] = v200;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v69;
            v219.__end_ = end + 1;
          }
        }
        v65 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v215, &__p, 16);
      }
      while (v65);
    }

    if (v142)
      v77 = (char *)objc_msgSend(objc_retainAutorelease(v142), "UTF8String");
    else
      v77 = "";
    std::string::basic_string[abi:ne180100]<0>(v213, v77);
    objc_msgSend(v149, "sortingDetails");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "objectForKey:", CFSTR("InsignificantSortPrefixes"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v211 = 0;
    v210 = 0;
    v212 = 0;
    v206 = 0u;
    v207 = 0u;
    v208 = 0u;
    v209 = 0u;
    v160 = v79;
    v80 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v206, v245, 16);
    v158 = v78;
    if (v80)
    {
      v81 = *(_QWORD *)v207;
      do
      {
        for (k = 0; k != v80; ++k)
        {
          if (*(_QWORD *)v207 != v81)
            objc_enumerationMutation(v160);
          std::string::basic_string[abi:ne180100]<0>(v204, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v206 + 1) + 8 * k)), "UTF8String"));
          mediaplatform::StringToUCharString();
          v83 = (void **)v211;
          if (v211 >= v212)
          {
            v85 = (void **)v210;
            v86 = 0xAAAAAAAAAAAAAAABLL * ((v211 - (_BYTE *)v210) >> 3);
            v87 = v86 + 1;
            if (v86 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((v212 - (_BYTE *)v210) >> 3) > v87)
              v87 = 0x5555555555555556 * ((v212 - (_BYTE *)v210) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((v212 - (_BYTE *)v210) >> 3) >= 0x555555555555555)
              v88 = 0xAAAAAAAAAAAAAAALL;
            else
              v88 = v87;
            if (v88)
            {
              if (v88 > 0xAAAAAAAAAAAAAAALL)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v89 = (char *)operator new(24 * v88);
            }
            else
            {
              v89 = 0;
            }
            v90 = &v89[24 * v86];
            *(_OWORD *)v90 = *(_OWORD *)v199;
            *((_QWORD *)v90 + 2) = v200;
            v200 = 0;
            v199[0] = 0;
            v199[1] = 0;
            v91 = v90 + 24;
            if (v83 == v85)
            {
              v210 = v90;
              v211 = v90 + 24;
              v212 = &v89[24 * v88];
            }
            else
            {
              do
              {
                v92 = *(_OWORD *)(v83 - 3);
                *((_QWORD *)v90 - 1) = *(v83 - 1);
                *(_OWORD *)(v90 - 24) = v92;
                v90 -= 24;
                *(v83 - 2) = 0;
                *(v83 - 1) = 0;
                *(v83 - 3) = 0;
                v83 -= 3;
              }
              while (v83 != v85);
              v83 = (void **)v210;
              v93 = (void **)v211;
              v210 = v90;
              v211 = v91;
              v212 = &v89[24 * v88];
              while (v93 != v83)
              {
                if (*((char *)v93 - 1) < 0)
                  operator delete(*(v93 - 3));
                v93 -= 3;
              }
            }
            if (v83)
              operator delete(v83);
            v211 = v91;
            v78 = v158;
            if (SHIBYTE(v200) < 0)
              operator delete(v199[0]);
          }
          else
          {
            v84 = *(_OWORD *)v199;
            *((_QWORD *)v211 + 2) = v200;
            *(_OWORD *)v83 = v84;
            v200 = 0;
            v199[1] = 0;
            v199[0] = 0;
            v211 = (char *)(v83 + 3);
          }
          if (v205 < 0)
            operator delete(v204[0]);
        }
        v80 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v206, v245, 16);
      }
      while (v80);
    }

    MEMORY[0x1940392EC](v199, &v228, &v219, v233 + 6, v213);
    mlcore::LocalizedSortingDetails::LocalizedSortingDetails();
    objc_msgSend(v149, "canonicalLanguageIdentifier");
    v94 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v197, (char *)objc_msgSend(v94, "UTF8String"));

    MEMORY[0x194039070](&v174, v199, v204, v197);
    if (v198 < 0)
      operator delete(v197[0]);
    v197[0] = v204;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v197);
    if (v203 < 0)
      operator delete(v202);
    v204[0] = &v201;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v204);
    v204[0] = v199;
    std::vector<mlcore::LocalizedSectionHeader>::__destroy_vector::operator()[abi:ne180100]((void ***)v204);
    v199[0] = &v210;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v199);

    if (v214 < 0)
      operator delete(v213[0]);
    v199[0] = &v219;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v199);
    v199[0] = &v228;
    std::vector<mlcore::LocalizedSectionHeader>::__destroy_vector::operator()[abi:ne180100]((void ***)v199);
    _Block_object_dispose(&v232, 8);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v237[8]);
    _Block_object_dispose(&v257, 8);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v261[8]);

    v4 = objc_alloc_init(_MPMediaLibraryMLCoreStorage);
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v171, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
    else
      v171 = __s;
    mlcore::Library::createLibrary();
    v172 = (void **)p_begin;
    v173 = v254;
    if (v254)
    {
      p_shared_owners = (unint64_t *)&v254->__shared_owners_;
      do
        v96 = __ldxr(p_shared_owners);
      while (__stxr(v96 + 1, p_shared_owners));
    }
    -[_MPMediaLibraryMLCoreStorage set_MediaLibrary_coreLibrary:](v4, "set_MediaLibrary_coreLibrary:", &v172);
    v97 = v173;
    if (v173)
    {
      v98 = (unint64_t *)&v173->__shared_owners_;
      do
        v99 = __ldaxr(v98);
      while (__stlxr(v99 - 1, v98));
      if (!v99)
      {
        ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
        std::__shared_weak_count::__release_weak(v97);
      }
    }
    v100 = v254;
    if (v254)
    {
      v101 = (unint64_t *)&v254->__shared_owners_;
      do
        v102 = __ldaxr(v101);
      while (__stlxr(v102 - 1, v101));
      if (!v102)
      {
        ((void (*)(std::__shared_weak_count *))v100->__on_zero_shared)(v100);
        std::__shared_weak_count::__release_weak(v100);
      }
    }
    if (SHIBYTE(v171.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v171.__r_.__value_.__l.__data_);
    v103 = -[MPMediaLibrary uniqueIdentifier](v151, "uniqueIdentifier");
    if (v4)
    {
      v103 = (id)-[_MPMediaLibraryMLCoreStorage _MediaLibrary_coreLibrary](v4, "_MediaLibrary_coreLibrary");
    }
    else
    {
      v169 = 0;
      v170 = 0;
    }
    v104 = MEMORY[0x194039EC8](v103);
    +[MPMediaQuery songsQuery](MPMediaQuery, "songsQuery");
    v105 = (id)objc_claimAutoreleasedReturnValue();
    v106 = v151;
    objc_msgSend(v105, "setMediaLibrary:", v106);
    v107 = objc_msgSend(v105, "_countOfItems");

    -[MPMediaLibrary _updateDeviceLibrary:expectedEntityCountForEntityClass:count:](v106, "_updateDeviceLibrary:expectedEntityCountForEntityClass:count:", &v169, v104, v107);
    v109 = v170;
    if (v170)
    {
      v110 = (unint64_t *)&v170->__shared_owners_;
      do
        v111 = __ldaxr(v110);
      while (__stlxr(v111 - 1, v110));
      if (!v111)
      {
        ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
        std::__shared_weak_count::__release_weak(v109);
      }
    }
    if (v4)
    {
      v108 = -[_MPMediaLibraryMLCoreStorage _MediaLibrary_coreLibrary](v4, "_MediaLibrary_coreLibrary");
    }
    else
    {
      v167 = 0;
      v168 = 0;
    }
    v112 = MEMORY[0x194039F1C](v108);
    +[MPMediaQuery albumsQuery](MPMediaQuery, "albumsQuery");
    v113 = (id)objc_claimAutoreleasedReturnValue();
    v114 = v106;
    objc_msgSend(v113, "setMediaLibrary:", v114);
    v115 = objc_msgSend(v113, "_countOfCollections");

    -[MPMediaLibrary _updateDeviceLibrary:expectedEntityCountForEntityClass:count:](v114, "_updateDeviceLibrary:expectedEntityCountForEntityClass:count:", &v167, v112, v115);
    v117 = v168;
    if (v168)
    {
      v118 = (unint64_t *)&v168->__shared_owners_;
      do
        v119 = __ldaxr(v118);
      while (__stlxr(v119 - 1, v118));
      if (!v119)
      {
        ((void (*)(std::__shared_weak_count *))v117->__on_zero_shared)(v117);
        std::__shared_weak_count::__release_weak(v117);
      }
    }
    if (v4)
    {
      v116 = -[_MPMediaLibraryMLCoreStorage _MediaLibrary_coreLibrary](v4, "_MediaLibrary_coreLibrary");
    }
    else
    {
      v165 = 0;
      v166 = 0;
    }
    v120 = MEMORY[0x194039F64](v116);
    +[MPMediaQuery albumArtistsQuery](MPMediaQuery, "albumArtistsQuery");
    v121 = (id)objc_claimAutoreleasedReturnValue();
    v122 = v114;
    objc_msgSend(v121, "setMediaLibrary:", v122);
    v123 = objc_msgSend(v121, "_countOfCollections");

    -[MPMediaLibrary _updateDeviceLibrary:expectedEntityCountForEntityClass:count:](v122, "_updateDeviceLibrary:expectedEntityCountForEntityClass:count:", &v165, v120, v123);
    v125 = v166;
    if (v166)
    {
      v126 = (unint64_t *)&v166->__shared_owners_;
      do
        v127 = __ldaxr(v126);
      while (__stlxr(v127 - 1, v126));
      if (!v127)
      {
        ((void (*)(std::__shared_weak_count *))v125->__on_zero_shared)(v125);
        std::__shared_weak_count::__release_weak(v125);
      }
    }
    if (v4)
    {
      v124 = -[_MPMediaLibraryMLCoreStorage _MediaLibrary_coreLibrary](v4, "_MediaLibrary_coreLibrary");
    }
    else
    {
      v163 = 0;
      v164 = 0;
    }
    v128 = MEMORY[0x194039FE8](v124);
    +[MPMediaQuery playlistsQuery](MPMediaQuery, "playlistsQuery");
    v129 = (id)objc_claimAutoreleasedReturnValue();
    v130 = v122;
    objc_msgSend(v129, "setMediaLibrary:", v130);
    v131 = objc_msgSend(v129, "_countOfCollections");

    -[MPMediaLibrary _updateDeviceLibrary:expectedEntityCountForEntityClass:count:](v130, "_updateDeviceLibrary:expectedEntityCountForEntityClass:count:", &v163, v128, v131);
    v132 = v164;
    if (v164)
    {
      v133 = (unint64_t *)&v164->__shared_owners_;
      do
        v134 = __ldaxr(v133);
      while (__stlxr(v134 - 1, v133));
      if (!v134)
      {
        ((void (*)(std::__shared_weak_count *))v132->__on_zero_shared)(v132);
        std::__shared_weak_count::__release_weak(v132);
      }
    }
    -[MPMediaLibrary _setMLCoreStorage:](v130, "_setMLCoreStorage:", v4);
    if (v182 < 0)
      operator delete(v181);
    p_begin = (std::__split_buffer<std::string>::pointer *)&v180;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    if (v179 < 0)
      operator delete(v178);
    p_begin = (std::__split_buffer<std::string>::pointer *)&v177;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    p_begin = &v174;
    std::vector<mlcore::LocalizedSectionHeader>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    p_begin = (std::__split_buffer<std::string>::pointer *)&v187;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    v135 = MEMORY[0x1E0D4AF30] + 16;
    v185[3] = MEMORY[0x1E0D4AF30] + 16;
    p_begin = (std::__split_buffer<std::string>::pointer *)&v186;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    v184[3] = v135;
    p_begin = (std::__split_buffer<std::string>::pointer *)v185;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    v183 = v135;
    p_begin = (std::__split_buffer<std::string>::pointer *)v184;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    if (v189 < 0)
      operator delete(v188[0]);

    if (v191 < 0)
      operator delete(v190[0]);

    if (v193 < 0)
      operator delete(v192[0]);

    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__s.__r_.__value_.__l.__data_);

  }
  os_unfair_lock_unlock(-[MPMediaLibrary _MLCoreStorageLockPointer](objc_retainAutorelease(v151), "_MLCoreStorageLockPointer"));
  if (v4)
  {
    -[_MPMediaLibraryMLCoreStorage _MediaLibrary_coreLibrary](v4, "_MediaLibrary_coreLibrary");
  }
  else
  {
    *v150 = 0;
    v150[1] = 0;
  }

  result.__cntrl_ = v137;
  result.__ptr_ = v136;
  return result;
}

- (os_unfair_lock_s)_MLCoreStorageLockPointer
{
  return self->__MLCoreStorageLockPointer;
}

- (id)_MLCoreStorage
{
  return self->__MLCoreStorage;
}

- (void)_updateDeviceLibrary:(shared_ptr<mlcore:(void *)a4 :(unint64_t)a5 DeviceLibrary>)a3 expectedEntityCountForEntityClass:count:
{
  __shared_weak_count *cntrl;
  double v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void **v13;
  void *v14;
  void *__p[2];
  char v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  cntrl = a3.__cntrl_;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = log2((double)(unint64_t)a4);
  v9 = (unint64_t)exp2(ceil(v8));
  v10 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[MPMediaLibrary uniqueIdentifier](self, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    (*(void (**)(void **__return_ptr, __shared_weak_count *))(*(_QWORD *)cntrl + 56))(__p, cntrl);
    if (v16 >= 0)
      v13 = __p;
    else
      v13 = (void **)__p[0];
    objc_msgSend(v12, "stringWithUTF8String:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v18 = v11;
    v19 = 2112;
    v20 = v14;
    v21 = 2048;
    v22 = a4;
    v23 = 2048;
    v24 = v9;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "[MPMLC:%{public}@] _MediaLibrary_coreLibrary | setting expected count [init] entity=%@ count=%ld roundedCount=%ld", buf, 0x2Au);

    if (v16 < 0)
      operator delete(__p[0]);

  }
  mlcore::DeviceLibrary::setExpectedEntityQuerySize();
}

- (id)databasePath
{
  return (id)-[MPMediaLibraryDataProviderPrivate databasePath](self->_libraryDataProvider, "databasePath");
}

- (void)_setMLCoreStorage:(id)a3
{
  objc_storeStrong(&self->__MLCoreStorage, a3);
}

- (void)enumerateEntityChangesAfterSyncAnchor:(id)a3 usingBlock:(id)a4
{
  -[MPMediaLibrary enumerateEntityChangesAfterSyncAnchor:maximumRevisionType:usingBlock:](self, "enumerateEntityChangesAfterSyncAnchor:maximumRevisionType:usingBlock:", a3, 3, a4);
}

- (void)enumerateEntityChangesAfterSyncAnchor:(id)a3 maximumRevisionType:(int64_t)a4 usingBlock:(id)a5
{
  -[MPMediaLibrary enumerateEntityChangesAfterSyncAnchor:maximumRevisionType:inUsersLibrary:usingBlock:](self, "enumerateEntityChangesAfterSyncAnchor:maximumRevisionType:inUsersLibrary:usingBlock:", a3, a4, 0, a5);
}

uint64_t __36__MPMediaLibrary_cloudFilteringType__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = __cloudFilteringType;
  return result;
}

void __33__MPMediaLibrary__mediaLibraries__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(a1 + 32), "deviceMediaLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithObject:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_mediaLibraries____mediaLibraries;
  _mediaLibraries____mediaLibraries = v2;

}

- (void)endGeneratingLibraryChangeNotifications
{
  MPMediaLibrary *v3;
  int64_t libraryChangeObservers;
  BOOL v5;
  int64_t v6;

  +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
  v3 = (MPMediaLibrary *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    libraryChangeObservers = self->_libraryChangeObservers;
    v5 = libraryChangeObservers < 1;
    v6 = libraryChangeObservers - 1;
    if (!v5)
      self->_libraryChangeObservers = v6;
  }
}

- (BOOL)_hasCollectionsForQueryCriteria:(id)a3
{
  id v4;
  void *v5;
  NSObject *entityCacheQueue;
  uint64_t v7;
  id v8;
  void *v9;
  char v10;
  QueryCriteriaResultsCache *hasCollectionsForCriteriaCache;
  QueryCriteriaResultsCache *collectionsForCriteriaCache;
  NSMutableDictionary *hasCollectionsDidLoadForCriteria;
  void *v14;
  _QWORD v16[5];
  _QWORD block[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v5 = v4;
  if (self->_libraryDataProvider)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__13969;
    v24 = __Block_byref_object_dispose__13970;
    v25 = 0;
    entityCacheQueue = self->_entityCacheQueue;
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke;
    block[3] = &unk_1E31635A8;
    v19 = &v20;
    block[4] = self;
    v8 = v4;
    v18 = v8;
    dispatch_sync(entityCacheQueue, block);
    v9 = (void *)v21[5];
    if (v9)
    {
      v10 = objc_msgSend(v9, "count") != 0;
    }
    else
    {
      collectionsForCriteriaCache = self->_collectionsForCriteriaCache;
      hasCollectionsForCriteriaCache = self->_hasCollectionsForCriteriaCache;
      hasCollectionsDidLoadForCriteria = self->_hasCollectionsDidLoadForCriteria;
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke_3;
      v16[3] = &unk_1E31561B0;
      v16[4] = self;
      -[MPMediaLibrary _getCachedValueForQueryCritiera:valueCriteriaCache:entitiesForCriteriaCache:didLoadBlocksByQueryCriteria:valueLoadedFromEntitiesArrayBlock:loadValueFromDataProviderBlock:](self, "_getCachedValueForQueryCritiera:valueCriteriaCache:entitiesForCriteriaCache:didLoadBlocksByQueryCriteria:valueLoadedFromEntitiesArrayBlock:loadValueFromDataProviderBlock:", v8, hasCollectionsForCriteriaCache, collectionsForCriteriaCache, hasCollectionsDidLoadForCriteria, &__block_literal_global_296, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v14, "BOOLValue");

    }
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_hasItemsForQueryCriteria:(id)a3
{
  id v4;
  void *v5;
  NSObject *entityCacheQueue;
  uint64_t v7;
  id v8;
  void *v9;
  char v10;
  QueryCriteriaResultsCache *hasItemsForCriteriaCache;
  QueryCriteriaResultsCache *itemsForCriteriaCache;
  NSMutableDictionary *hasItemsDidLoadForCriteria;
  void *v14;
  _QWORD v16[5];
  _QWORD block[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v5 = v4;
  if (self->_libraryDataProvider)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__13969;
    v24 = __Block_byref_object_dispose__13970;
    v25 = 0;
    entityCacheQueue = self->_entityCacheQueue;
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke;
    block[3] = &unk_1E31635A8;
    v19 = &v20;
    block[4] = self;
    v8 = v4;
    v18 = v8;
    dispatch_sync(entityCacheQueue, block);
    v9 = (void *)v21[5];
    if (v9)
    {
      v10 = objc_msgSend(v9, "count") != 0;
    }
    else
    {
      itemsForCriteriaCache = self->_itemsForCriteriaCache;
      hasItemsForCriteriaCache = self->_hasItemsForCriteriaCache;
      hasItemsDidLoadForCriteria = self->_hasItemsDidLoadForCriteria;
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke_3;
      v16[3] = &unk_1E31561B0;
      v16[4] = self;
      -[MPMediaLibrary _getCachedValueForQueryCritiera:valueCriteriaCache:entitiesForCriteriaCache:didLoadBlocksByQueryCriteria:valueLoadedFromEntitiesArrayBlock:loadValueFromDataProviderBlock:](self, "_getCachedValueForQueryCritiera:valueCriteriaCache:entitiesForCriteriaCache:didLoadBlocksByQueryCriteria:valueLoadedFromEntitiesArrayBlock:loadValueFromDataProviderBlock:", v8, hasItemsForCriteriaCache, itemsForCriteriaCache, hasItemsDidLoadForCriteria, &__block_literal_global_294, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v14, "BOOLValue");

    }
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)_countOfItemsForQueryCriteria:(id)a3
{
  id v4;
  void *v5;
  NSObject *entityCacheQueue;
  uint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  QueryCriteriaResultsCache *countOfItemsForCriteriaCache;
  QueryCriteriaResultsCache *itemsForCriteriaCache;
  NSMutableDictionary *countOfItemsDidLoadForCriteria;
  void *v14;
  _QWORD v16[5];
  _QWORD block[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v5 = v4;
  if (self->_libraryDataProvider)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__13969;
    v24 = __Block_byref_object_dispose__13970;
    v25 = 0;
    entityCacheQueue = self->_entityCacheQueue;
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke;
    block[3] = &unk_1E31635A8;
    v19 = &v20;
    block[4] = self;
    v8 = v4;
    v18 = v8;
    dispatch_sync(entityCacheQueue, block);
    v9 = (void *)v21[5];
    if (v9)
    {
      v10 = objc_msgSend(v9, "count");
    }
    else
    {
      countOfItemsForCriteriaCache = self->_countOfItemsForCriteriaCache;
      itemsForCriteriaCache = self->_itemsForCriteriaCache;
      countOfItemsDidLoadForCriteria = self->_countOfItemsDidLoadForCriteria;
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke_3;
      v16[3] = &unk_1E31561B0;
      v16[4] = self;
      -[MPMediaLibrary _getCachedValueForQueryCritiera:valueCriteriaCache:entitiesForCriteriaCache:didLoadBlocksByQueryCriteria:valueLoadedFromEntitiesArrayBlock:loadValueFromDataProviderBlock:](self, "_getCachedValueForQueryCritiera:valueCriteriaCache:entitiesForCriteriaCache:didLoadBlocksByQueryCriteria:valueLoadedFromEntitiesArrayBlock:loadValueFromDataProviderBlock:", v8, countOfItemsForCriteriaCache, itemsForCriteriaCache, countOfItemsDidLoadForCriteria, &__block_literal_global_297, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v14, "integerValue");

    }
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)_countOfCollectionsForQueryCriteria:(id)a3
{
  id v4;
  void *v5;
  NSObject *entityCacheQueue;
  uint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  QueryCriteriaResultsCache *countOfCollectionsForCriteriaCache;
  QueryCriteriaResultsCache *collectionsForCriteriaCache;
  NSMutableDictionary *countOfCollectionsDidLoadForCriteria;
  void *v14;
  _QWORD v16[5];
  _QWORD block[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v5 = v4;
  if (self->_libraryDataProvider)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__13969;
    v24 = __Block_byref_object_dispose__13970;
    v25 = 0;
    entityCacheQueue = self->_entityCacheQueue;
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke;
    block[3] = &unk_1E31635A8;
    v19 = &v20;
    block[4] = self;
    v8 = v4;
    v18 = v8;
    dispatch_sync(entityCacheQueue, block);
    v9 = (void *)v21[5];
    if (v9)
    {
      v10 = objc_msgSend(v9, "count");
    }
    else
    {
      countOfCollectionsForCriteriaCache = self->_countOfCollectionsForCriteriaCache;
      collectionsForCriteriaCache = self->_collectionsForCriteriaCache;
      countOfCollectionsDidLoadForCriteria = self->_countOfCollectionsDidLoadForCriteria;
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke_3;
      v16[3] = &unk_1E31561B0;
      v16[4] = self;
      -[MPMediaLibrary _getCachedValueForQueryCritiera:valueCriteriaCache:entitiesForCriteriaCache:didLoadBlocksByQueryCriteria:valueLoadedFromEntitiesArrayBlock:loadValueFromDataProviderBlock:](self, "_getCachedValueForQueryCritiera:valueCriteriaCache:entitiesForCriteriaCache:didLoadBlocksByQueryCriteria:valueLoadedFromEntitiesArrayBlock:loadValueFromDataProviderBlock:", v8, countOfCollectionsForCriteriaCache, collectionsForCriteriaCache, countOfCollectionsDidLoadForCriteria, &__block_literal_global_299_13978, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v14, "integerValue");

    }
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_getCachedValueForQueryCritiera:(id)a3 valueCriteriaCache:(id)a4 entitiesForCriteriaCache:(id)a5 didLoadBlocksByQueryCriteria:(id)a6 valueLoadedFromEntitiesArrayBlock:(id)a7 loadValueFromDataProviderBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *entityCacheQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  qos_class_t v27;
  dispatch_block_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id v37;
  MPMediaLibrary *v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__13969;
  v60 = __Block_byref_object_dispose__13970;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__13969;
  v54 = __Block_byref_object_dispose__13970;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__289;
  v48 = __Block_byref_object_dispose__290;
  v49 = 0;
  entityCacheQueue = self->_entityCacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke;
  block[3] = &unk_1E3156140;
  v41 = &v56;
  v21 = v15;
  v34 = v21;
  v22 = v14;
  v35 = v22;
  v23 = v16;
  v36 = v23;
  v24 = v18;
  v39 = v24;
  v25 = v17;
  v37 = v25;
  v42 = &v44;
  v26 = v19;
  v40 = v26;
  v38 = self;
  v43 = &v50;
  dispatch_sync(entityCacheQueue, block);
  if (v45[5])
  {
    v27 = qos_class_self();
    v28 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v27, 0, (dispatch_block_t)v45[5]);
    v29 = (void *)v45[5];
    v45[5] = (uint64_t)v28;

    dispatch_async((dispatch_queue_t)self->_fixedQueue, (dispatch_block_t)v45[5]);
  }
  v30 = v51[5];
  if (v30)
    dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
  v31 = (id)v57[5];

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  return v31;
}

+ (MPMediaLibrary)defaultMediaLibrary
{
  void *v3;
  id v4;
  void *v5;
  _QWORD block[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__13969;
  v12 = __Block_byref_object_dispose__13970;
  v13 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MPMediaLibrary_defaultMediaLibrary__block_invoke;
  block[3] = &unk_1E31639A0;
  block[4] = &v8;
  dispatch_sync((dispatch_queue_t)__defaultMediaLibraryQueue, block);
  v3 = (void *)v9[5];
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "deviceMediaLibrary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (MPMediaLibrary *)v5;
}

+ (id)deviceMediaLibrary
{
  if (deviceMediaLibrary_onceToken != -1)
    dispatch_once(&deviceMediaLibrary_onceToken, &__block_literal_global_47);
  return (id)deviceMediaLibrary___mediaLibrary;
}

uint64_t __47__MPMediaLibrary__collectionsForQueryCriteria___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
}

uint64_t __44__MPMediaLibrary_addLibraryFilterPredicate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadLibraryForRestrictionsChange");
}

- (id)connectionAssertionWithIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *connectionAssertionsQueue;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = -[MPMediaLibraryConnectionAssertion _initWithMediaLibrary:identifier:]([MPMediaLibraryConnectionAssertion alloc], "_initWithMediaLibrary:identifier:", self, v4);

  connectionAssertionsQueue = self->_connectionAssertionsQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__MPMediaLibrary_connectionAssertionWithIdentifier___block_invoke;
  v11[3] = &unk_1E31635F8;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  dispatch_sync(connectionAssertionsQueue, v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

+ (void)logDatabaseAccess
{
  id v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)&__privacyContextLock);
  if (__privacyContextOverride)
  {
    v2 = (id)__privacyContextOverride;
  }
  else
  {
    +[MPMediaLibraryPrivacyContext sharedContextForCurrentProcess](MPMediaLibraryPrivacyContext, "sharedContextForCurrentProcess");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&__privacyContextLock);
  objc_msgSend(v3, "logPrivacyAccess");

}

uint64_t __58__MPMediaLibrary__clearCachedEntitiesIncludingResultSets___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
  }
  return result;
}

void __51__MPMediaLibrary_additionalLibraryFilterPredicates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (void)beginDiscoveringMediaLibraries
{
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (!__numberOfHomeSharingObservers++)
      +[MPHomeSharingML3DataProvider beginScanningForLibraries](MPHomeSharingML3DataProvider, "beginScanningForLibraries");
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_146);
  }
}

- (void)setCloudFilteringType:(int64_t)a3
{
  MPMediaLibrary *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
  v5 = (MPMediaLibrary *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__MPMediaLibrary_setCloudFilteringType___block_invoke;
    block[3] = &unk_1E3156240;
    block[4] = &v18;
    block[5] = a3;
    dispatch_sync((dispatch_queue_t)__serialAccessQueue, block);
    if (*((_BYTE *)v19 + 24))
    {
      +[MPMediaLibrary _mediaLibraries](MPMediaLibrary, "_mediaLibraries");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "copy");

      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "_reloadLibraryForRestrictionsChange");
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
        }
        while (v9);
      }

    }
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCloudFilteringType:", a3);

  }
}

void __36__MPMediaLibrary_deviceMediaLibrary__block_invoke()
{
  id v0;
  void *v1;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  _MPActiveUserChangeMonitor *v6;
  _MPActiveUserChangeMonitor *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v0 = -[MPMediaLibrary _initWithUserIdentity:]([MPMediaLibrary alloc], "_initWithUserIdentity:", 0);
  v1 = (void *)deviceMediaLibrary___mediaLibrary;
  deviceMediaLibrary___mediaLibrary = (uint64_t)v0;

  v2 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = deviceMediaLibrary___mediaLibrary;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Singleton", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleTV");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", deviceMediaLibrary___mediaLibrary, sel__activeUserDidChangeNotification_, *MEMORY[0x1E0DDBC38], 0);

    v6 = [_MPActiveUserChangeMonitor alloc];
    v7 = -[_MPActiveUserChangeMonitor initWithDelegate:](v6, "initWithDelegate:", deviceMediaLibrary___mediaLibrary);
    objc_msgSend((id)deviceMediaLibrary___mediaLibrary, "setActiveUserChangeMonitor:", v7);

  }
}

- (MPMediaLibrary)initWithClientIdentity:(id)a3 userIdentity:(id)a4
{
  id v6;
  id v7;
  MPMediaLibrary *v8;
  MPMediaLibraryAuthorizationStatus v9;
  uint64_t v10;
  MPMediaLibrary *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *entityCacheQueue;
  dispatch_queue_t v20;
  OS_dispatch_queue *connectionAssertionsQueue;
  dispatch_queue_t v22;
  OS_dispatch_queue *additionalLibraryFilterPredicatesAccessQueue;
  QueryCriteriaResultsCache *v24;
  QueryCriteriaResultsCache *itemsForCriteriaCache;
  QueryCriteriaResultsCache *v26;
  QueryCriteriaResultsCache *itemResultSetsForCriteriaCache;
  QueryCriteriaResultsCache *v28;
  QueryCriteriaResultsCache *collectionsForCriteriaCache;
  QueryCriteriaResultsCache *v30;
  QueryCriteriaResultsCache *collectionsResultSetsForCriteriaCache;
  QueryCriteriaResultsCache *v32;
  QueryCriteriaResultsCache *hasItemsForCriteriaCache;
  QueryCriteriaResultsCache *v34;
  QueryCriteriaResultsCache *hasCollectionsForCriteriaCache;
  NSMutableDictionary *v36;
  NSMutableDictionary *hasItemsDidLoadForCriteria;
  NSMutableDictionary *v38;
  NSMutableDictionary *hasCollectionsDidLoadForCriteria;
  NSMutableDictionary *v40;
  NSMutableDictionary *countOfCollectionsDidLoadForCriteria;
  NSMutableDictionary *v42;
  NSMutableDictionary *countOfItemsDidLoadForCriteria;
  uint64_t v44;
  OS_dispatch_queue *fixedQueue;
  _QWORD v47[4];
  MPMediaLibrary *v48;
  id v49;
  _QWORD v50[4];
  MPMediaLibrary *v51;
  id v52;
  id v53;
  objc_super v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)MPMediaLibrary;
  v8 = -[MPMediaLibrary init](&v54, sel_init);
  if (v8)
  {
    v9 = +[MPMediaLibrary authorizationStatus](MPMediaLibrary, "authorizationStatus");
    v10 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __54__MPMediaLibrary_initWithClientIdentity_userIdentity___block_invoke;
    v50[3] = &unk_1E3163698;
    v11 = v8;
    v51 = v11;
    v52 = v6;
    v53 = v7;
    v12 = MEMORY[0x19403A810](v50);
    v13 = (void *)v12;
    if (v9)
    {
      if (v9 == MPMediaLibraryAuthorizationStatusAuthorized)
      {
        (*(void (**)(uint64_t))(v12 + 16))(v12);
      }
      else
      {
        v16 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MPMediaLibrary initWithClientIdentity:userIdentity:]");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v56 = v17;
          _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_ERROR, "%{public}@: app not authorized for access", buf, 0xCu);

        }
      }
    }
    else
    {
      v14 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary_Oversize");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v56 = v15;
        _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "MPMediaLibraryAuthorizationStatus has not been determined, %{public}@", buf, 0xCu);

      }
      v47[0] = v10;
      v47[1] = 3221225472;
      v47[2] = __54__MPMediaLibrary_initWithClientIdentity_userIdentity___block_invoke_117;
      v47[3] = &unk_1E3155F68;
      v49 = v13;
      v48 = v11;
      +[MPMediaLibrary requestAuthorization:](MPMediaLibrary, "requestAuthorization:", v47);

    }
    v18 = dispatch_queue_create("com.apple.mediaplayer.MPMediaLibrary", 0);
    entityCacheQueue = v11->_entityCacheQueue;
    v11->_entityCacheQueue = (OS_dispatch_queue *)v18;

    v20 = dispatch_queue_create("com.apple.mediaplayer.MPMediaLibrary.connectionAssertions", 0);
    connectionAssertionsQueue = v11->_connectionAssertionsQueue;
    v11->_connectionAssertionsQueue = (OS_dispatch_queue *)v20;

    v22 = dispatch_queue_create("com.apple.mediaplayer.MPMediaLibrary.additionalLibraryFilterPredicatesAccessQueue", 0);
    additionalLibraryFilterPredicatesAccessQueue = v11->_additionalLibraryFilterPredicatesAccessQueue;
    v11->_additionalLibraryFilterPredicatesAccessQueue = (OS_dispatch_queue *)v22;

    v24 = objc_alloc_init(QueryCriteriaResultsCache);
    itemsForCriteriaCache = v11->_itemsForCriteriaCache;
    v11->_itemsForCriteriaCache = v24;

    v26 = objc_alloc_init(QueryCriteriaResultsCache);
    itemResultSetsForCriteriaCache = v11->_itemResultSetsForCriteriaCache;
    v11->_itemResultSetsForCriteriaCache = v26;

    v28 = objc_alloc_init(QueryCriteriaResultsCache);
    collectionsForCriteriaCache = v11->_collectionsForCriteriaCache;
    v11->_collectionsForCriteriaCache = v28;

    v30 = objc_alloc_init(QueryCriteriaResultsCache);
    collectionsResultSetsForCriteriaCache = v11->_collectionsResultSetsForCriteriaCache;
    v11->_collectionsResultSetsForCriteriaCache = v30;

    v32 = objc_alloc_init(QueryCriteriaResultsCache);
    hasItemsForCriteriaCache = v11->_hasItemsForCriteriaCache;
    v11->_hasItemsForCriteriaCache = v32;

    v34 = objc_alloc_init(QueryCriteriaResultsCache);
    hasCollectionsForCriteriaCache = v11->_hasCollectionsForCriteriaCache;
    v11->_hasCollectionsForCriteriaCache = v34;

    v36 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    hasItemsDidLoadForCriteria = v11->_hasItemsDidLoadForCriteria;
    v11->_hasItemsDidLoadForCriteria = v36;

    v38 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    hasCollectionsDidLoadForCriteria = v11->_hasCollectionsDidLoadForCriteria;
    v11->_hasCollectionsDidLoadForCriteria = v38;

    v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    countOfCollectionsDidLoadForCriteria = v11->_countOfCollectionsDidLoadForCriteria;
    v11->_countOfCollectionsDidLoadForCriteria = v40;

    v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    countOfItemsDidLoadForCriteria = v11->_countOfItemsDidLoadForCriteria;
    v11->_countOfItemsDidLoadForCriteria = v42;

    v11->_connectionProgress = -1.0;
    dispatch_get_global_queue(2, 0);
    v44 = objc_claimAutoreleasedReturnValue();
    fixedQueue = v11->_fixedQueue;
    v11->_fixedQueue = (OS_dispatch_queue *)v44;

    v11->__MLCoreStorageLock._os_unfair_lock_opaque = 0;
    v11->__MLCoreStorageLockPointer = &v11->__MLCoreStorageLock;
    -[MPMediaLibrary _setupNotifications](v11, "_setupNotifications");
    -[MPMediaLibrary _setLibraryFilterPredicates](v11, "_setLibraryFilterPredicates");

  }
  return v8;
}

void __54__MPMediaLibrary_initWithClientIdentity_userIdentity___block_invoke(uint64_t a1)
{
  MPMediaLibraryPrivacyContext *v2;
  MPMediaLibraryPrivacyContext *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  MPMediaLibraryDataProviderSystemML3 *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = -[MPMediaLibraryPrivacyContext initWithClientIdentity:]([MPMediaLibraryPrivacyContext alloc], "initWithClientIdentity:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    +[MPMediaLibraryPrivacyContext contextForDefaultClient](MPMediaLibraryPrivacyContext, "contextForDefaultClient");
    v2 = (MPMediaLibraryPrivacyContext *)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), v2);

  v4 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v4;

  objc_msgSend(MEMORY[0x1E0D51270], "musicLibraryForUserAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPMediaLibraryDataProviderSystemML3 initWithLibrary:]([MPMediaLibraryDataProviderSystemML3 alloc], "initWithLibrary:", v7);
  -[MPMediaLibraryDataProviderML3 setMediaLibrary:](v8, "setMediaLibrary:", *(_QWORD *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v8);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "conformsToProtocol:", &unk_1EE2D5530))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setUserIdentity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248));
  v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v10 + 248);
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - New library created for user identity: %@", (uint8_t *)&v12, 0x16u);
  }

}

- (void)_setupNotifications
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSArray *notificationObservers;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location[2];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(location, self);
  v5 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __37__MPMediaLibrary__setupNotifications__block_invoke;
  v31[3] = &unk_1E3156268;
  objc_copyWeak(&v32, location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MPCloudControllerCanShowCloudTracksDidChangeNotification"), 0, 0, v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v4, "addObject:", v6);

  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __37__MPMediaLibrary__setupNotifications__block_invoke_2;
  v29[3] = &unk_1E3156268;
  objc_copyWeak(&v30, location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MPMediaLibraryDisplayValuesDidChangeNotification"), self, 0, v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v4, "addObject:", v7);

  MPUIApplication();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC4778];
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __37__MPMediaLibrary__setupNotifications__block_invoke_3;
  v27[3] = &unk_1E3156268;
  objc_copyWeak(&v28, location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v9, v8, 0, v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v4, "addObject:", v10);

  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __37__MPMediaLibrary__setupNotifications__block_invoke_4;
  v25[3] = &unk_1E3156268;
  objc_copyWeak(&v26, location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MPMediaLibraryFilteringDidChangeNotification"), 0, 0, v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v4, "addObject:", v11);

  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __37__MPMediaLibrary__setupNotifications__block_invoke_5;
  v23[3] = &unk_1E3156268;
  objc_copyWeak(&v24, location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("MPMediaLibraryCloudLibraryAvailabilityDidChangeNotification"), 0, 0, v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v4, "addObject:", v12);

  v13 = *MEMORY[0x1E0D46EC8];
  v14 = v5;
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __37__MPMediaLibrary__setupNotifications__block_invoke_6;
  v21[3] = &unk_1E3156268;
  objc_copyWeak(&v22, location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v13, 0, 0, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v4, "addObject:", v15);

  v16 = *MEMORY[0x1E0D50B28];
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __37__MPMediaLibrary__setupNotifications__block_invoke_7;
  v19[3] = &unk_1E3156268;
  objc_copyWeak(&v20, location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v16, 0, 0, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v4, "addObject:", v17);

  notificationObservers = self->_notificationObservers;
  self->_notificationObservers = v4;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(location);

}

- (id)_initWithUserIdentity:(id)a3
{
  return -[MPMediaLibrary initWithClientIdentity:userIdentity:](self, "initWithClientIdentity:userIdentity:", 0, a3);
}

- (void)addLibraryFilterPredicate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *additionalLibraryFilterPredicatesAccessQueue;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD block[5];
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    additionalLibraryFilterPredicatesAccessQueue = self->_additionalLibraryFilterPredicatesAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__MPMediaLibrary_addLibraryFilterPredicate___block_invoke;
    block[3] = &unk_1E31635F8;
    block[4] = self;
    v11 = v4;
    dispatch_sync(additionalLibraryFilterPredicatesAccessQueue, block);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[MPMediaLibrary _reloadLibraryForRestrictionsChange](self, "_reloadLibraryForRestrictionsChange");
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __44__MPMediaLibrary_addLibraryFilterPredicate___block_invoke_2;
      v9[3] = &unk_1E3163508;
      v9[4] = self;
      dispatch_async(v8, v9);

    }
  }

}

- (void)_reloadLibraryForRestrictionsChange
{
  _QWORD v3[5];

  -[MPMediaLibrary _setLibraryFilterPredicates](self, "_setLibraryFilterPredicates");
  -[MPMediaLibrary _clearCachedContentDataAndResultSets:](self, "_clearCachedContentDataAndResultSets:", 1);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__MPMediaLibrary__reloadLibraryForRestrictionsChange__block_invoke;
  v3[3] = &unk_1E3163508;
  v3[4] = self;
  -[MPMediaLibrary _scheduleLibraryChangeNotificationPostingBlock:](self, "_scheduleLibraryChangeNotificationPostingBlock:", v3);
}

- (void)_scheduleLibraryChangeNotificationPostingBlock:(id)a3
{
  void (**v4)(_QWORD);
  _QWORD v5[5];
  void (**v6)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (-[MPMediaLibrary libraryChangeObservers](self, "libraryChangeObservers") >= 1)
      v4[2](v4);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__MPMediaLibrary__scheduleLibraryChangeNotificationPostingBlock___block_invoke;
    v5[3] = &unk_1E3162560;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

- (void)_clearCachedEntitiesIncludingResultSets:(BOOL)a3
{
  NSObject *entityCacheQueue;
  _QWORD v4[5];
  BOOL v5;

  entityCacheQueue = self->_entityCacheQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__MPMediaLibrary__clearCachedEntitiesIncludingResultSets___block_invoke;
  v4[3] = &unk_1E3163468;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(entityCacheQueue, v4);
}

- (void)_clearCachedContentDataAndResultSets:(BOOL)a3
{
  *((_BYTE *)self + 192) &= 0xAAu;
  *((_BYTE *)self + 193) &= 0xAAu;
  self->_determinedHasVideos = 0;
  self->_determinedHasMusicVideos = 0;
  self->_determinedHasAudibleAudioBooks = 0;
  self->_determinedHasMovies = 0;
  self->_determinedHasCompilations = 0;
  self->_determinedHasITunesU = 0;
  self->_determinedHasVideoITunesU = 0;
  self->_determinedHasMovieRentals = 0;
  self->_determinedHasTVShows = 0;
  self->_determinedHasHomeVideos = 0;
  self->_determinedHasVideoPodcasts = 0;
  -[MPMediaLibrary _clearCachedEntitiesIncludingResultSets:](self, "_clearCachedEntitiesIncludingResultSets:", a3);
}

uint64_t __53__MPMediaLibrary__reloadLibraryForRestrictionsChange__block_invoke(uint64_t a1)
{
  +[MPMediaLibrary _postNotificationName:library:userInfo:](MPMediaLibrary, "_postNotificationName:library:userInfo:", CFSTR("MPMediaLibraryDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
  return +[MPMediaLibrary _postNotificationName:library:userInfo:](MPMediaLibrary, "_postNotificationName:library:userInfo:", CFSTR("MPMediaLibraryRestrictionsDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
}

+ (void)_postNotificationName:(id)a3 library:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Posting notification [%@]", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", v7, v8, v9);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__MPMediaLibrary__postNotificationName_library_userInfo___block_invoke;
    v13[3] = &unk_1E3155F90;
    v14 = v7;
    v15 = v9;
    objc_msgSend(v8, "_performBlockOnLibraryHandlingTheSameAccount:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", v7, 0, v9);

  }
}

- (void)_performBlockOnLibraryHandlingTheSameAccount:(id)a3
{
  void *v4;
  int v5;
  MPMediaLibrary *v6;
  MPMediaLibrary *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  MPMediaLibrary *v11;
  void *v12;
  void *v13;
  void (**v14)(id, void *);

  v14 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsMultipleITunesAccounts");

  if (v5)
  {
    +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
    v6 = (MPMediaLibrary *)objc_claimAutoreleasedReturnValue();
    if (v6 == self)
    {

    }
    else
    {
      v7 = v6;
      +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MPMediaLibrary _handlesSameAccountAs:](self, "_handlesSameAccountAs:", v8);

      if (v9)
      {
        +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_10;
        goto LABEL_9;
      }
    }
    +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
    v11 = (MPMediaLibrary *)objc_claimAutoreleasedReturnValue();

    if (v11 == self)
    {
      +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPMediaLibrary _deviceMediaLibraryWithUserIdentity:createIfRequired:](MPMediaLibrary, "_deviceMediaLibraryWithUserIdentity:createIfRequired:", v13, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
LABEL_9:
        v14[2](v14, v10);

      }
    }
  }
LABEL_10:

}

uint64_t __65__MPMediaLibrary__scheduleLibraryChangeNotificationPostingBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "libraryChangeObservers");
  if (result >= 1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (int64_t)libraryChangeObservers
{
  MPMediaLibrary *v3;
  NSObject *v4;
  void *v5;
  int64_t v6;
  int v8;
  MPMediaLibrary *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
  v3 = (MPMediaLibrary *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    return self->_libraryChangeObservers;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Notifications - Reading libraryChangeObservers from deviceMediaLibrary", (uint8_t *)&v8, 0xCu);
  }

  +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "libraryChangeObservers");

  return v6;
}

void __37__MPMediaLibrary__setupNotifications__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadLibraryForRestrictionsChange");

}

- (MPMediaLibrary)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  MPMediaLibrary *v8;
  void *v10;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibrary.m"), 530, CFSTR("only keyed coding is supported"));

  }
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPLibraryDataProviderUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPUserDSID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_mediaLibraryWithUniqueIdentifier:userDSID:", v6, v7);
  v8 = (MPMediaLibrary *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if ((objc_msgSend(v11, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibrary.m"), 520, CFSTR("only keyed coding is supported"));

  }
  -[MPMediaLibraryDataProviderPrivate uniqueIdentifier](self->_libraryDataProvider, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("MPLibraryDataProviderUID"));

  -[MPMediaLibrary userIdentity](self, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MPMediaLibrary userIdentity](self, "userIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("MPUserDSID"));

  }
}

- (void)dealloc
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
  QueryCriteriaResultsCache *countOfItemsForCriteriaCache;
  QueryCriteriaResultsCache *countOfCollectionsForCriteriaCache;
  QueryCriteriaResultsCache *itemsForCriteriaCache;
  QueryCriteriaResultsCache *itemResultSetsForCriteriaCache;
  QueryCriteriaResultsCache *collectionsForCriteriaCache;
  QueryCriteriaResultsCache *collectionsResultSetsForCriteriaCache;
  QueryCriteriaResultsCache *hasItemsForCriteriaCache;
  QueryCriteriaResultsCache *hasCollectionsForCriteriaCache;
  NSObject *v21;
  id v22;
  objc_super v23;
  _QWORD block[4];
  id v25;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[MPMediaLibrary _tearDownNotifications](self, "_tearDownNotifications");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_countOfItemsForCriteriaCache)
  {
    objc_msgSend(v3, "addObject:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  if (self->_countOfCollectionsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  if (self->_itemsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  if (self->_itemResultSetsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  if (self->_collectionsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

  }
  if (self->_collectionsResultSetsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  if (self->_hasItemsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  if (self->_hasCollectionsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

  }
  countOfItemsForCriteriaCache = self->_countOfItemsForCriteriaCache;
  self->_countOfItemsForCriteriaCache = 0;

  countOfCollectionsForCriteriaCache = self->_countOfCollectionsForCriteriaCache;
  self->_countOfCollectionsForCriteriaCache = 0;

  itemsForCriteriaCache = self->_itemsForCriteriaCache;
  self->_itemsForCriteriaCache = 0;

  itemResultSetsForCriteriaCache = self->_itemResultSetsForCriteriaCache;
  self->_itemResultSetsForCriteriaCache = 0;

  collectionsForCriteriaCache = self->_collectionsForCriteriaCache;
  self->_collectionsForCriteriaCache = 0;

  collectionsResultSetsForCriteriaCache = self->_collectionsResultSetsForCriteriaCache;
  self->_collectionsResultSetsForCriteriaCache = 0;

  hasItemsForCriteriaCache = self->_hasItemsForCriteriaCache;
  self->_hasItemsForCriteriaCache = 0;

  hasCollectionsForCriteriaCache = self->_hasCollectionsForCriteriaCache;
  self->_hasCollectionsForCriteriaCache = 0;

  dispatch_get_global_queue(0, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__MPMediaLibrary_dealloc__block_invoke;
  block[3] = &unk_1E3163508;
  v25 = v4;
  v22 = v4;
  dispatch_async(v21, block);

  v23.receiver = self;
  v23.super_class = (Class)MPMediaLibrary;
  -[MPMediaLibrary dealloc](&v23, sel_dealloc);
}

- (void)_tearDownNotifications
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *notificationObservers;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_notificationObservers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  notificationObservers = self->_notificationObservers;
  self->_notificationObservers = 0;

}

+ (id)_mediaLibraryWithUniqueIdentifier:(id)a3 userDSID:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  NSObject *v33;
  os_log_t v34;
  int v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  char v65;
  NSObject *v66;
  NSObject *v67;
  _QWORD *v68;
  NSObject *v69;
  NSObject *v70;
  _QWORD *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  char v79;
  NSObject *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  _QWORD *v88;
  NSObject *v89;
  id v90;
  NSObject *v91;
  NSObject *obj;
  NSObject *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t buf[4];
  _QWORD *v114;
  __int16 v115;
  NSObject *v116;
  __int16 v117;
  _QWORD *v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v90 = v5;
  if (objc_msgSend(v5, "length") || -[NSObject length](v6, "length"))
  {
    ICCreateLoggableValueForDSIDString();
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_mediaLibraries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v10 = v9;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
    v12 = v5;
    obj = v10;
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v107;
LABEL_5:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v107 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD **)(*((_QWORD *)&v106 + 1) + 8 * v15);
        objc_msgSend(v16, "uniqueIdentifier");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v17 == v90)
          break;
        v18 = v17;
        v19 = objc_msgSend(v17, "isEqual:", v90);

        if (v19)
          goto LABEL_45;
        objc_msgSend(v16, "userIdentity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "accountDSID");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        if (v21 == v6)
        {

LABEL_52:
          v69 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v114 = v16;
            _os_log_impl(&dword_193B9B000, v69, OS_LOG_TYPE_INFO, "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | found in-memory library [DSID match] library=%{public}@", buf, 0xCu);
          }

          v16 = v16;
          v62 = obj;
LABEL_60:
          v72 = v62;
          goto LABEL_86;
        }
        v22 = v21;
        v23 = -[NSObject isEqual:](v21, "isEqual:", v6);

        if ((v23 & 1) != 0)
          goto LABEL_52;
        if (v13 == ++v15)
        {
          v10 = obj;
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
          if (v13)
            goto LABEL_5;
          goto LABEL_14;
        }
      }

LABEL_45:
      objc_msgSend(v16, "userIdentity");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "accountDSID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = obj;
      if (v6)
      {
        v63 = v61;
        if (v63 == v6)
        {

        }
        else
        {
          v64 = v63;
          v65 = -[NSObject isEqual:](v63, "isEqual:", v6);

          if ((v65 & 1) == 0)
          {
            ICCreateLoggableValueForDSIDString();
            v66 = objc_claimAutoreleasedReturnValue();
            v67 = os_log_create("com.apple.amp.mediaplayer", "Library");
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v114 = v7;
              v115 = 2114;
              v116 = v66;
              v117 = 2114;
              v118 = v16;
              _os_log_impl(&dword_193B9B000, v67, OS_LOG_TYPE_DEFAULT, "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | found in-memory library [databaseID match, DSID mismatch] dsid=%{public}@ libraryDSID=%{public}@ library=%{public}@", buf, 0x20u);
            }

            v68 = v16;
LABEL_59:

            goto LABEL_60;
          }
        }
      }
      v70 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v114 = v16;
        _os_log_impl(&dword_193B9B000, v70, OS_LOG_TYPE_INFO, "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | found in-memory library [databaseID match] library=%{public}@", buf, 0xCu);
      }

      v71 = v16;
      goto LABEL_59;
    }
LABEL_14:
    v88 = v7;

    +[MPMediaLibraryDataProviderML3 onDiskProviders](MPMediaLibraryDataProviderML3, "onDiskProviders");
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v89 = (id)objc_claimAutoreleasedReturnValue();
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
    v91 = v6;
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v103;
LABEL_16:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v103 != v26)
          objc_enumerationMutation(v89);
        v28 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v27);
        objc_msgSend(v28, "accountDSID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "uniqueIdentifier");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        if (v30 == v90)
          break;
        v31 = v30;
        v32 = objc_msgSend(v30, "isEqual:", v90);

        if (v32)
          goto LABEL_64;
        v33 = v29;
        if (v33 == v91)
        {

          v34 = v91;
LABEL_74:
          v16 = -[MPMediaLibrary _initWithLibraryDataProvider:]([MPMediaLibrary alloc], "_initWithLibraryDataProvider:", v28);
          v82 = (void *)MEMORY[0x1E0DDC100];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NSObject longLongValue](v91, "longLongValue"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "specificAccountWithDSID:", v83);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          v84 = objc_msgSend(v75, "copy");
          v85 = (void *)v16[31];
          v16[31] = v84;

          v62 = obj;
          v72 = v89;
          if (objc_msgSend(v28, "conformsToProtocol:", &unk_1EE2D5530))
            objc_msgSend(v28, "setUserIdentity:", v75);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v28, "setMediaLibrary:", v16);
          v80 = os_log_create("com.apple.amp.mediaplayer", "Library");
          v6 = v91;
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v114 = v16;
            v86 = "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | found on-disk library [DSID match] library=%{public}@";
            goto LABEL_83;
          }
          goto LABEL_84;
        }
        v34 = v33;
        v35 = -[NSObject isEqual:](v33, "isEqual:", v91);

        if (v35)
          goto LABEL_74;

        if (v25 == ++v27)
        {
          v25 = -[NSObject countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
          v10 = obj;
          if (v25)
            goto LABEL_16;
          goto LABEL_25;
        }
      }

LABEL_64:
      v16 = -[MPMediaLibrary _initWithLibraryDataProvider:]([MPMediaLibrary alloc], "_initWithLibraryDataProvider:", v28);
      v73 = (void *)MEMORY[0x1E0DDC100];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NSObject longLongValue](v91, "longLongValue"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "specificAccountWithDSID:", v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      v76 = objc_msgSend(v75, "copy");
      v77 = (void *)v16[31];
      v16[31] = v76;

      v62 = obj;
      v72 = v89;
      if (objc_msgSend(v28, "conformsToProtocol:", &unk_1EE2D5530))
        objc_msgSend(v28, "setUserIdentity:", v75);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v28, "setMediaLibrary:", v16);
      v78 = v29;
      v34 = v78;
      v6 = v91;
      if (v78 == v91)
      {

      }
      else
      {
        v79 = -[NSObject isEqual:](v78, "isEqual:", v91);

        if ((v79 & 1) == 0)
        {
          ICCreateLoggableValueForDSIDString();
          v80 = objc_claimAutoreleasedReturnValue();
          v81 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v114 = v7;
            v115 = 2114;
            v116 = v80;
            v117 = 2114;
            v118 = v16;
            _os_log_impl(&dword_193B9B000, v81, OS_LOG_TYPE_DEFAULT, "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | found on-disk library [databaseID match, DSID mismatch] dsid=%{public}@ libraryDSID=%{public}@ library=%{public}@", buf, 0x20u);
          }

          v6 = v91;
          goto LABEL_84;
        }
      }
      v80 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v114 = v16;
        v86 = "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | found on-disk library [databaseID match] library=%{public}@";
LABEL_83:
        _os_log_impl(&dword_193B9B000, v80, OS_LOG_TYPE_INFO, v86, buf, 0xCu);
      }
LABEL_84:

      v36 = v72;
      goto LABEL_85;
    }
LABEL_25:

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = objc_claimAutoreleasedReturnValue();
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v93 = v10;
    v37 = -[NSObject countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v99 != v39)
            objc_enumerationMutation(v93);
          v41 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
          objc_msgSend(v41, "userIdentity");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "accountDSID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          ICCreateLoggableValueForDSIDString();
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v41, "uniqueIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "stringWithFormat:", CFSTR("<MPMediaLibrary [memory] uid=%@ dsid=%@>"), v46, v44);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject addObject:](v36, "addObject:", v47);
        }
        v38 = -[NSObject countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
      }
      while (v38);
    }

    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v48 = v89;
    v49 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v94, v110, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v95;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v95 != v51)
            objc_enumerationMutation(v48);
          v53 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
          objc_msgSend(v53, "accountDSID");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          ICCreateLoggableValueForDSIDString();
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v53, "uniqueIdentifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "stringWithFormat:", CFSTR("<MPMediaLibrary [disk] uid=%@ dsid=%@>"), v57, v55);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject addObject:](v36, "addObject:", v58);
        }
        v50 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v94, v110, 16);
      }
      while (v50);
    }

    v34 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v7 = v88;
      v114 = v88;
      v115 = 2114;
      v116 = v36;
      _os_log_impl(&dword_193B9B000, v34, OS_LOG_TYPE_ERROR, "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | returning nil [failed to find match] dsid=%{public}@ considerations=%{public}@", buf, 0x16u);
      v16 = 0;
      v12 = v90;
      v6 = v91;
    }
    else
    {
      v16 = 0;
      v12 = v90;
      v6 = v91;
      v7 = v88;
    }
    v62 = obj;
    v72 = v89;
LABEL_85:

LABEL_86:
  }
  else
  {
    v59 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v59, OS_LOG_TYPE_INFO, "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | returning defaultMediaLibrary [UID/DSID both nil]", buf, 2u);
    }

    +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
    v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
  }

  return v16;
}

+ (MPMediaLibrary)mediaLibraryWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_mediaLibraries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "uniqueIdentifier", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return (MPMediaLibrary *)v8;
}

+ (id)mediaLibraries
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_mediaLibraries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (id)_mediaLibraries
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MPMediaLibrary__mediaLibraries__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_mediaLibraries_onceToken != -1)
    dispatch_once(&_mediaLibraries_onceToken, block);
  return (id)_mediaLibraries____mediaLibraries;
}

- (id)valueForDatabaseProperty:(id)a3
{
  return (id)-[MPMediaLibraryDataProviderPrivate valueForDatabaseProperty:](self->_libraryDataProvider, "valueForDatabaseProperty:", a3);
}

- (void)beginGeneratingLibraryChangeNotifications
{
  MPMediaLibrary *v3;

  +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
  v3 = (MPMediaLibrary *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    ++self->_libraryChangeObservers;
}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_14130);
}

uint64_t __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)enumerateEntityChangesAfterSyncAnchor:(id)a3 maximumRevisionType:(int64_t)a4 inUsersLibrary:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL8 v6;
  id v10;
  uint64_t v11;
  MPMediaLibraryDataProviderPrivate *libraryDataProvider;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a5;
  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  libraryDataProvider = self->_libraryDataProvider;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __135__MPMediaLibrary_MPMediaLibrarySyncAnchorSupport__enumerateEntityChangesAfterSyncAnchor_maximumRevisionType_inUsersLibrary_usingBlock___block_invoke;
  v16[3] = &unk_1E3156398;
  v16[4] = self;
  v17 = v10;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __135__MPMediaLibrary_MPMediaLibrarySyncAnchorSupport__enumerateEntityChangesAfterSyncAnchor_maximumRevisionType_inUsersLibrary_usingBlock___block_invoke_2;
  v14[3] = &unk_1E31563C0;
  v14[4] = self;
  v15 = v17;
  v13 = v17;
  -[MPMediaLibraryDataProviderPrivate enumerateEntityChangesAfterSyncAnchor:maximumRevisionType:inUsersLibrary:itemBlock:collectionBlock:](libraryDataProvider, "enumerateEntityChangesAfterSyncAnchor:maximumRevisionType:inUsersLibrary:itemBlock:collectionBlock:", a3, a4, v6, v16, v14);

}

void __50__MPMediaLibrary__sharedCloudServiceStatusMonitor__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DDBF30]);
  v1 = (void *)_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitor;
  _sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitor = (uint64_t)v0;

}

uint64_t __41__MPMediaLibrary__itemsForQueryCriteria___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 48), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
}

- (unint64_t)filterAvailableContentGroups:(unint64_t)a3 withOptions:(unint64_t)a4
{
  __int16 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  MPMediaLibraryView *v13;
  MPMediaLibraryView *v14;
  void *v15;
  _BOOL4 v16;
  MPMediaLibraryView *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  MPMediaLibraryView *v21;
  MPMediaLibraryView *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  MPMediaLibraryView *v28;
  void *v29;
  _BOOL4 v30;
  MPMediaLibraryView *v31;
  void *v32;
  _BOOL4 v33;
  MPMediaLibraryView *v34;
  void *v35;
  _BOOL4 v36;
  MPMediaLibraryView *v37;
  void *v38;
  _BOOL4 v39;
  MPMediaLibraryView *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  MPMediaLibraryView *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];

  v5 = a3;
  v49[3] = *MEMORY[0x1E0C80C00];
  +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPModelAlbum kindWithSongKind:](MPModelAlbum, "kindWithSongKind:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (CFPreferencesGetAppBooleanValue(CFSTR("showAllTVShows"), CFSTR("com.apple.Music"), 0))
    v9 = 3;
  else
    v9 = 2;
  +[MPModelTVEpisode kindWithVariants:](MPModelTVEpisode, "kindWithVariants:", v9);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (CFPreferencesGetAppBooleanValue(CFSTR("showAllTVShows"), CFSTR("com.apple.Music"), 0))
    v10 = 3;
  else
    v10 = 2;
  +[MPModelMovie kindWithVariants:](MPModelMovie, "kindWithVariants:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if ((v5 & 1) != 0)
  {
    v13 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", self, a4);
    v12 = -[MPMediaLibraryView hasEntitiesForModelKind:](v13, "hasEntitiesForModelKind:", v8);

  }
  v46 = (void *)v11;
  if ((v5 & 2) != 0)
  {
    v28 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", self, a4);
    +[MPModelArtist kindWithAlbumKind:](MPModelArtist, "kindWithAlbumKind:", v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MPMediaLibraryView hasEntitiesForModelKind:](v28, "hasEntitiesForModelKind:", v29);

    if (v30)
      v12 |= 2uLL;

    if ((v5 & 4) == 0)
    {
LABEL_11:
      if ((v5 & 8) == 0)
        goto LABEL_12;
      goto LABEL_38;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_11;
  }
  v31 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", self, a4);
  +[MPModelAlbum kindWithVariants:songKind:](MPModelAlbum, "kindWithVariants:songKind:", 2, v7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[MPMediaLibraryView hasEntitiesForModelKind:](v31, "hasEntitiesForModelKind:", v32);

  if (v33)
    v12 |= 4uLL;

  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_38:
  v34 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", self, a4);
  +[MPModelComposer kindWithAlbumKind:](MPModelComposer, "kindWithAlbumKind:", v8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[MPMediaLibraryView hasEntitiesForModelKind:](v34, "hasEntitiesForModelKind:", v35);

  if (v36)
    v12 |= 8uLL;

  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_14;
  }
LABEL_41:
  v37 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", self, a4);
  +[MPModelGenre kindWithAlbumKind:](MPModelGenre, "kindWithAlbumKind:", v8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[MPMediaLibraryView hasEntitiesForModelKind:](v37, "hasEntitiesForModelKind:", v38);

  if (v39)
    v12 |= 0x10uLL;

  if ((v5 & 0x20) != 0)
  {
LABEL_14:
    v14 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", self, a4);
    +[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MPMediaLibraryView hasEntitiesForModelKind:](v14, "hasEntitiesForModelKind:", v15);

    if (v16)
      v12 |= 0x20uLL;

  }
LABEL_17:
  if ((v5 & 0x40) != 0)
  {
    v40 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", self, a4);
    v49[0] = v7;
    v49[1] = v47;
    +[MPModelMovie kindWithVariants:](MPModelMovie, "kindWithVariants:", 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    +[MPModelPlaylist kindWithPlaylistEntryKind:options:](MPModelPlaylist, "kindWithPlaylistEntryKind:options:", v43, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = -[MPMediaLibraryView hasEntitiesForModelKind:](v40, "hasEntitiesForModelKind:", v44);

    if ((_DWORD)v41)
      v12 |= 0x40uLL;

    if ((v5 & 0x80) == 0)
    {
LABEL_19:
      if ((v5 & 0x100) == 0)
        goto LABEL_23;
      goto LABEL_20;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_19;
  }
  v45 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", self, a4);
  if (-[MPMediaLibraryView hasEntitiesForModelKind:](v45, "hasEntitiesForModelKind:", v7))
    v12 |= 0x80uLL;

  if ((v5 & 0x100) != 0)
  {
LABEL_20:
    v17 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", self, a4);
    +[MPModelTVSeason kindWithEpisodeKind:](MPModelTVSeason, "kindWithEpisodeKind:", v47);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelTVShow kindWithSeasonKind:](MPModelTVShow, "kindWithSeasonKind:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MPMediaLibraryView hasEntitiesForModelKind:](v17, "hasEntitiesForModelKind:", v19);

    if (v20)
      v12 |= 0x100uLL;

  }
LABEL_23:
  if ((v5 & 0x200) != 0)
  {
    v21 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", self, a4);
    if (-[MPMediaLibraryView hasEntitiesForModelKind:](v21, "hasEntitiesForModelKind:", v46))
      v12 |= 0x200uLL;

  }
  if ((v5 & 0x400) != 0)
  {
    v22 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", self, a4);
    v48 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:](MPModelPlaylist, "kindWithVariants:playlistEntryKind:options:", 64, v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[MPMediaLibraryView hasEntitiesForModelKind:](v22, "hasEntitiesForModelKind:", v25);

    if (v26)
      v12 |= 0x400uLL;

  }
  return v12;
}

void __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 64);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_3;
  v4[3] = &unk_1E31560F0;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v3, v4);

}

void __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke_4;
  v8[3] = &unk_1E31561F8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "loadQueryCriteria:countOfCollectionsWithCompletionBlock:", a2, v8);

}

void __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke_4;
  v8[3] = &unk_1E31561F8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "loadQueryCriteria:countOfItemsWithCompletionBlock:", a2, v8);

}

void __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke_4;
  v8[3] = &unk_1E3156188;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "loadQueryCriteria:hasCollectionsWithCompletionBlock:", a2, v8);

}

void __41__MPMediaLibrary__itemsForQueryCriteria___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 72), "objectForKey:", a1[5]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    {
      objc_msgSend(*(id *)(a1[4] + 16), "itemResultSetForQueryCriteria:", a1[5]);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[7] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v11 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
      if (v11)
        objc_msgSend(*(id *)(a1[4] + 72), "setObject:forKey:", v11, a1[5]);
    }
  }
}

void __47__MPMediaLibrary__collectionsForQueryCriteria___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    {
      objc_msgSend(*(id *)(a1[4] + 16), "collectionResultSetForQueryCriteria:", a1[5]);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[7] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v11 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
      if (v11)
        objc_msgSend(*(id *)(a1[4] + 104), "setObject:forKey:", v11, a1[5]);
    }
  }
}

uint64_t __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
}

void __28__MPMediaLibrary_initialize__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v0 = dispatch_queue_create("default_media_library", 0);
  v1 = (void *)__defaultMediaLibraryQueue;
  __defaultMediaLibraryQueue = (uint64_t)v0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.MPMediaLibrary.global.serial.queue", v2);
  v4 = (void *)__serialAccessQueue;
  __serialAccessQueue = (uint64_t)v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)__userMediaLibraries;
  __userMediaLibraries = v5;

}

void __45__MPMediaLibrary__removeConnectionAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count"))
  {
    v2 = 0;
    while (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "pointerAtIndex:", v2) != *(_QWORD *)(a1 + 40))
    {
      if (++v2 >= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "count"))
        goto LABEL_8;
    }
    if (v2 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removePointerAtIndex:", v2);
  }
LABEL_8:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "compact");
  v3 = os_log_create("com.apple.amp.mediaplayer", "Library_Oversize");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v4 + 160), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218242;
    v13 = v4;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "%p Active assertions: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isDeviceLibrary") & 1) == 0)
    {
      v8 = SBSSpringBoardServerPort();
      MEMORY[0x194038AF4](v8, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 231), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 232));
    }
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 160);
    *(_QWORD *)(v9 + 160) = 0;

  }
  v11 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v11 + 160))
  {
    if (*(_BYTE *)(v11 + 176))
    {
      objc_msgSend((id)v11, "_disconnect");
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_310);
    }
  }
}

void __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_6(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (int64_t)sagaOnDiskDatabaseRevision
{
  void *v2;
  int64_t v3;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sagaOnDiskDatabaseRevision");

  return v3;
}

- (ML3MusicLibrary)ml3Library
{
  void *v3;
  uint64_t v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPMediaLibraryDataProviderPrivate library](self->_libraryDataProvider, "library");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPMediaLibraryDataProviderPrivate library](self->_libraryDataProvider, "library");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return (ML3MusicLibrary *)v3;
}

void __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __44__MPMediaLibrary_addLibraryFilterPredicate___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
    if (!v3)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 144);
      *(_QWORD *)(v5 + 144) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
    }
    return objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

uint64_t __40__MPMediaLibrary_setCloudFilteringType___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 40) != __cloudFilteringType)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    __cloudFilteringType = *(_QWORD *)(result + 40);
  }
  return result;
}

- (NSURL)protectedContentSupportStorageURL
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "protectedContentSupportStorageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSURL *)v6;
}

- (id)_itemsForQueryCriteria:(id)a3
{
  id v5;
  NSObject *entityCacheQueue;
  uint64_t v7;
  id v8;
  uint64_t *v9;
  void *v10;
  MPMediaEntityResultSetArray *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v5 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__13969;
  v35 = __Block_byref_object_dispose__13970;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__13969;
  v29 = __Block_byref_object_dispose__13970;
  v30 = 0;
  entityCacheQueue = self->_entityCacheQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MPMediaLibrary__itemsForQueryCriteria___block_invoke;
  block[3] = &unk_1E3158C68;
  v23 = &v31;
  block[4] = self;
  v8 = v5;
  v22 = v8;
  v24 = &v25;
  dispatch_sync(entityCacheQueue, block);
  v9 = v26;
  if (v32[5] && v26[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibrary.m"), 2070, CFSTR("only one of item/itemsResultSet should be set"));

    v9 = v26;
  }
  v10 = (void *)v9[5];
  if (v10)
  {
    objc_msgSend(v10, "updateToLibraryCurrentRevision");
    v11 = [MPMediaEntityResultSetArray alloc];
    v12 = -[MPMediaEntityResultSetArray initWithResultSet:queryCriteria:entityType:library:](v11, "initWithResultSet:queryCriteria:entityType:library:", v26[5], v8, 0, self);
    v13 = (void *)v32[5];
    v32[5] = v12;

    v14 = self->_entityCacheQueue;
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __41__MPMediaLibrary__itemsForQueryCriteria___block_invoke_2;
    v18[3] = &unk_1E31635A8;
    v18[4] = self;
    v20 = &v31;
    v19 = v8;
    dispatch_sync(v14, v18);

  }
  v15 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

- (id)_collectionsForQueryCriteria:(id)a3
{
  id v4;
  NSObject *entityCacheQueue;
  uint64_t v6;
  id v7;
  void *v8;
  MPMediaEntityResultSetArray *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  _QWORD block[5];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__13969;
  v32 = __Block_byref_object_dispose__13970;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__13969;
  v26 = __Block_byref_object_dispose__13970;
  v27 = 0;
  entityCacheQueue = self->_entityCacheQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MPMediaLibrary__collectionsForQueryCriteria___block_invoke;
  block[3] = &unk_1E3158C68;
  v20 = &v28;
  block[4] = self;
  v7 = v4;
  v19 = v7;
  v21 = &v22;
  dispatch_sync(entityCacheQueue, block);
  v8 = (void *)v23[5];
  if (v8)
  {
    objc_msgSend(v8, "updateToLibraryCurrentRevision");
    v9 = [MPMediaEntityResultSetArray alloc];
    v10 = -[MPMediaEntityResultSetArray initWithResultSet:queryCriteria:entityType:library:](v9, "initWithResultSet:queryCriteria:entityType:library:", v23[5], v7, 1, self);
    v11 = (void *)v29[5];
    v29[5] = v10;

    v12 = self->_entityCacheQueue;
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __47__MPMediaLibrary__collectionsForQueryCriteria___block_invoke_2;
    v15[3] = &unk_1E31635A8;
    v15[4] = self;
    v17 = &v28;
    v16 = v7;
    dispatch_sync(v12, v15);

  }
  v13 = (id)v29[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (id)favoriteSongsPlaylist
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)-[MPMediaLibraryDataProviderPrivate favoriteSongsPlaylistPersistentID](self->_libraryDataProvider, "favoriteSongsPlaylistPersistentID");
    if (v3)
    {
      -[MPMediaLibrary playlistWithPersistentID:](self, "playlistWithPersistentID:", v3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)currentEntityRevision
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[MPMediaLibraryDataProviderPrivate currentEntityRevision](self->_libraryDataProvider, "currentEntityRevision");
  else
    return 0xFFFFFFFFLL;
}

- (void)_removeConnectionAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *connectionAssertionsQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  MPMediaLibrary *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%p Releasing connection assertion: %{public}@", buf, 0x16u);
  }

  connectionAssertionsQueue = self->_connectionAssertionsQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__MPMediaLibrary__removeConnectionAssertion___block_invoke;
  v8[3] = &unk_1E31635F8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(connectionAssertionsQueue, v8);

}

void __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  dispatch_semaphore_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      if (!v10)
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 0);
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      }
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      v16 = MEMORY[0x1E0C809B0];
      if (!v15)
      {
        if (!v14)
          v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v14, *(_QWORD *)(a1 + 40));
        v28[0] = v16;
        v28[1] = 3221225472;
        v28[2] = __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_2;
        v28[3] = &unk_1E31618C8;
        v33 = *(id *)(a1 + 80);
        v17 = *(id *)(a1 + 40);
        v18 = *(_QWORD *)(a1 + 64);
        v29 = v17;
        v30 = v18;
        v31 = *(id *)(a1 + 32);
        v14 = v14;
        v32 = v14;
        v19 = objc_msgSend(v28, "copy");
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

      }
      v22 = dispatch_semaphore_create(0);
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      v27[0] = v16;
      v27[1] = 3221225472;
      v27[2] = __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_6;
      v27[3] = &unk_1E3156118;
      v25 = *(_QWORD *)(a1 + 104);
      v27[4] = *(_QWORD *)(a1 + 88);
      v27[5] = v25;
      v26 = (void *)objc_msgSend(v27, "copy");
      objc_msgSend(v14, "addObject:", v26);

    }
  }
}

void __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)sharedMediaLibraries
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mediaLibraries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_318);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_msgSend(v4, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isDeviceLibrary"))
          objc_msgSend(v4, "removeObjectIdenticalTo:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (int64_t)status
{
  float connectionProgress;

  if (-[MPMediaLibrary isDeviceLibrary](self, "isDeviceLibrary"))
    return 2;
  connectionProgress = self->_connectionProgress;
  if (connectionProgress < 0.0)
    return 0;
  if (connectionProgress < 1.0)
    return 1;
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUserChangeMonitor, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong(&self->__MLCoreStorage, 0);
  objc_storeStrong((id *)&self->_connectionAssertionsQueue, 0);
  objc_storeStrong((id *)&self->_connectionAssertions, 0);
  objc_storeStrong((id *)&self->_additionalLibraryFilterPredicatesAccessQueue, 0);
  objc_storeStrong((id *)&self->_additionalLibraryFilterPredicates, 0);
  objc_storeStrong((id *)&self->_countOfItemsDidLoadForCriteria, 0);
  objc_storeStrong((id *)&self->_countOfCollectionsDidLoadForCriteria, 0);
  objc_storeStrong((id *)&self->_hasCollectionsDidLoadForCriteria, 0);
  objc_storeStrong((id *)&self->_hasItemsDidLoadForCriteria, 0);
  objc_storeStrong((id *)&self->_collectionsResultSetsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_countOfCollectionsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_hasCollectionsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_collectionsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_itemResultSetsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_countOfItemsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_hasItemsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_itemsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_fixedQueue, 0);
  objc_storeStrong((id *)&self->_entityCacheQueue, 0);
  objc_storeStrong((id *)&self->_libraryDataProvider, 0);
  objc_storeStrong((id *)&self->_privacyContext, 0);
}

void __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke_4;
  v8[3] = &unk_1E3156188;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "loadQueryCriteria:hasItemsWithCompletionBlock:", a2, v8);

}

- (id)name
{
  return (id)-[MPMediaLibraryDataProviderPrivate name](self->_libraryDataProvider, "name");
}

intptr_t __61__MPMediaLibrary_MediaLibraryCore___MediaLibrary_coreLibrary__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)itLibrary
{
  void *v2;
  void *v3;

  -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MPMediaLibrary)init
{
  NSObject *v3;
  int v5;
  MPMediaLibrary *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - New library init called", (uint8_t *)&v5, 0xCu);
  }

  return (MPMediaLibrary *)-[MPMediaLibrary _initWithUserIdentity:](self, "_initWithUserIdentity:", 0);
}

- (MPMediaLibrary)initWithDatabasePath:(id)a3
{
  id v5;
  void *v6;
  MPMediaLibraryDataProviderML3 *v7;
  MPMediaLibrary *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51270]), "initWithPath:isUnitTesting:", v5, 1);
  if (objc_msgSend(v6, "validateDatabase"))
  {
    v7 = -[MPMediaLibraryDataProviderML3 initWithLibrary:]([MPMediaLibraryDataProviderML3 alloc], "initWithLibrary:", v6);
    -[MPMediaLibraryDataProviderML3 setMediaLibrary:](v7, "setMediaLibrary:", self);
    v8 = (MPMediaLibrary *)-[MPMediaLibrary _initWithLibraryDataProvider:](self, "_initWithLibraryDataProvider:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibrary.m"), 369, CFSTR("Failed to validate database at path %@"), v5);

    v8 = -[MPMediaLibrary init](self, "init");
  }

  return v8;
}

- (void)_clearCountCriteriaCaches
{
  NSObject *entityCacheQueue;
  _QWORD block[5];

  entityCacheQueue = self->_entityCacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MPMediaLibrary__clearCountCriteriaCaches__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(entityCacheQueue, block);
}

- (id)_dataProviderDescription
{
  return (id)-[MPMediaLibraryDataProviderPrivate description](self->_libraryDataProvider, "description");
}

- (void)_reloadLibraryForContentsChangeWithNotificationInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  objc_opt_class();
  -[MPMediaLibrary _clearCachedContentDataAndResultSets:](self, "_clearCachedContentDataAndResultSets:", objc_opt_isKindOfClass() & 1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__MPMediaLibrary__reloadLibraryForContentsChangeWithNotificationInfo___block_invoke;
  v6[3] = &unk_1E31635F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MPMediaLibrary _scheduleLibraryChangeNotificationPostingBlock:](self, "_scheduleLibraryChangeNotificationPostingBlock:", v6);

}

- (void)_reloadLibraryForDynamicPropertyChangeWithNotificationInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[MPMediaLibrary _clearCachedEntitiesIncludingResultSets:](self, "_clearCachedEntitiesIncludingResultSets:", 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__MPMediaLibrary__reloadLibraryForDynamicPropertyChangeWithNotificationInfo___block_invoke;
  v6[3] = &unk_1E31635F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MPMediaLibrary _scheduleLibraryChangeNotificationPostingBlock:](self, "_scheduleLibraryChangeNotificationPostingBlock:", v6);

}

- (void)_reloadLibraryForInvisiblePropertyChangeWithNotificationInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__MPMediaLibrary__reloadLibraryForInvisiblePropertyChangeWithNotificationInfo___block_invoke;
  v6[3] = &unk_1E31635F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MPMediaLibrary _scheduleLibraryChangeNotificationPostingBlock:](self, "_scheduleLibraryChangeNotificationPostingBlock:", v6);

}

- (void)_reloadLibraryForPathChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__MPMediaLibrary__reloadLibraryForPathChange__block_invoke;
  v2[3] = &unk_1E3163508;
  v2[4] = self;
  -[MPMediaLibrary _scheduleLibraryChangeNotificationPostingBlock:](self, "_scheduleLibraryChangeNotificationPostingBlock:", v2);
}

- (void)_activeUserDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MPMediaLibrary activeUserChangeMonitor](self, "activeUserChangeMonitor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ingestNotificationName:", v5);
}

- (void)_didReceiveMemoryWarning:(id)a3
{
  -[MPMediaLibrary _clearCachedEntitiesIncludingResultSets:](self, "_clearCachedEntitiesIncludingResultSets:", 1);
}

- (void)_displayValuesDidChangeNotification:(id)a3
{
  if (!+[MPMediaQuery isFilteringDisabled](MPMediaQuery, "isFilteringDisabled", a3))
    +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryDidChangeNotification"), self);
}

- (void)connectWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  float connectionProgress;
  uint64_t v7;
  MPMediaLibraryDataProviderPrivate *libraryDataProvider;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  void (**v14)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (connectionProgress = self->_connectionProgress, connectionProgress < 1.0))
  {
    if (connectionProgress >= 0.0 && connectionProgress < 1.0)
    {
      if (v4)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Connection already in progress"), *MEMORY[0x1E0CB2D50]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("MPMediaLibraryErrorDomain"), 0, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v11);

      }
    }
    else
    {
      self->_disconnectAfterReleasingAssertions = 0;
      v7 = MEMORY[0x1E0C809B0];
      libraryDataProvider = self->_libraryDataProvider;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __47__MPMediaLibrary_connectWithCompletionHandler___block_invoke;
      v13[3] = &unk_1E315C198;
      v13[4] = self;
      v14 = v4;
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __47__MPMediaLibrary_connectWithCompletionHandler___block_invoke_2;
      v12[3] = &unk_1E3163188;
      v12[4] = self;
      -[MPMediaLibraryDataProviderPrivate connectWithAuthenticationData:completionBlock:progressHandler:](libraryDataProvider, "connectWithAuthenticationData:completionBlock:progressHandler:", 0, v13, v12);
      self->_connectionProgress = 0.0;
      +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryStatusDidChangeNotification"), self);

    }
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }

}

- (void)disconnect
{
  NSObject *connectionAssertionsQueue;
  _QWORD block[5];

  connectionAssertionsQueue = self->_connectionAssertionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MPMediaLibrary_disconnect__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(connectionAssertionsQueue, block);
}

- (NSDate)lastModifiedDate
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPMediaLibraryDataProviderPrivate lastModifiedDate](self->_libraryDataProvider, "lastModifiedDate");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addItemWithProductID:(NSString *)productID completionHandler:(void *)completionHandler
{
  NSString *v6;
  void *v7;
  MPMediaLibraryDataProviderPrivate *libraryDataProvider;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = productID;
  v7 = completionHandler;
  if (+[MPMediaLibrary authorizationStatus](MPMediaLibrary, "authorizationStatus") == MPMediaLibraryAuthorizationStatusAuthorized)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      libraryDataProvider = self->_libraryDataProvider;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __57__MPMediaLibrary_addItemWithProductID_completionHandler___block_invoke;
      v17[3] = &unk_1E315D450;
      v18 = v7;
      -[MPMediaLibraryDataProviderPrivate sdk_addItemWithOpaqueID:withCompletion:](libraryDataProvider, "sdk_addItemWithOpaqueID:withCompletion:", v6, v17);
      v9 = v18;
LABEL_9:

      goto LABEL_10;
    }
    if (v7)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR"), &stru_1E3163D10, CFSTR("MediaPlayer"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16;
      v15 = 0;
      goto LABEL_8;
    }
  }
  else if (v7)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PERMISSION_DENIED"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    v15 = 1;
LABEL_8:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), v15, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void *, _QWORD, void *))v7 + 2))(v7, 0, v9);
    goto LABEL_9;
  }
LABEL_10:

}

- (unint64_t)syncGenerationID
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[MPMediaLibraryDataProviderPrivate syncGenerationID](self->_libraryDataProvider, "syncGenerationID");
  else
    return 0xFFFFFFFFLL;
}

- (int64_t)playlistGeneration
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[MPMediaLibraryDataProviderPrivate playlistGeneration](self->_libraryDataProvider, "playlistGeneration");
  else
    return -1;
}

- (BOOL)writable
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[MPMediaLibraryDataProviderPrivate writable](self->_libraryDataProvider, "writable");
  else
    return 1;
}

- (void)logDatabaseAccess
{
  MPMediaLibraryPrivacyContext *privacyContext;
  MPMediaLibraryPrivacyContext *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&__privacyContextLock);
  privacyContext = (MPMediaLibraryPrivacyContext *)__privacyContextOverride;
  if (!__privacyContextOverride)
    privacyContext = self->_privacyContext;
  v4 = privacyContext;
  os_unfair_lock_unlock((os_unfair_lock_t)&__privacyContextLock);
  -[MPMediaLibraryPrivacyContext logPrivacyAccess](v4, "logPrivacyAccess");

}

- (void)setClientIdentity:(id)a3
{
  id v4;
  MPMediaLibraryPrivacyContext *v5;
  MPMediaLibraryPrivacyContext *privacyContext;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__privacyContextLock);
  v5 = -[MPMediaLibraryPrivacyContext initWithClientIdentity:]([MPMediaLibraryPrivacyContext alloc], "initWithClientIdentity:", v4);
  privacyContext = self->_privacyContext;
  self->_privacyContext = v5;

  os_unfair_lock_unlock((os_unfair_lock_t)&__privacyContextLock);
  v7 = (void *)MEMORY[0x1E0D51270];
  -[MPMediaLibrary userIdentity](self, "userIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "musicLibraryForUserAccount:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setClientIdentity:", v4);
}

- (void)removeLibraryFilterPredicate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *additionalLibraryFilterPredicatesAccessQueue;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD block[5];
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    additionalLibraryFilterPredicatesAccessQueue = self->_additionalLibraryFilterPredicatesAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__MPMediaLibrary_removeLibraryFilterPredicate___block_invoke;
    block[3] = &unk_1E31635F8;
    block[4] = self;
    v11 = v4;
    dispatch_sync(additionalLibraryFilterPredicatesAccessQueue, block);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[MPMediaLibrary _reloadLibraryForRestrictionsChange](self, "_reloadLibraryForRestrictionsChange");
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __47__MPMediaLibrary_removeLibraryFilterPredicate___block_invoke_2;
      v9[3] = &unk_1E3163508;
      v9[4] = self;
      dispatch_async(v8, v9);

    }
  }

}

- (int64_t)removalReason
{
  return self->_removalReason;
}

- (void)setRemovalReason:(int64_t)a3
{
  self->_removalReason = a3;
}

- (unint64_t)usageForSyncedMediaOfType:(unint64_t)a3
{
  unsigned int v4;
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
  unint64_t v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = MLMediaTypeForMPMediaType(a3);
  v5 = (void *)MEMORY[0x1E0D51280];
  objc_msgSend(MEMORY[0x1E0D51208], "predicateWithProperty:mask:value:", *MEMORY[0x1E0D50F30], v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:value:comparison:", *MEMORY[0x1E0D50C08], &unk_1E31E4990, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D511D8];
  v17[0] = v7;
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateMatchingPredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D512C8], "queryWithLibrary:predicate:", v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForAggregateFunction:onEntitiesForProperty:", *MEMORY[0x1E0D50B40], *MEMORY[0x1E0D51178]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongLongValue");

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)hasMediaOfType:(unint64_t)a3
{
  int v5;
  char v6;
  char v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = -[MPMediaLibraryDataProviderPrivate hasMediaOfType:](self->_libraryDataProvider, "hasMediaOfType:", a3);
    v6 = *((_BYTE *)self + 192);
    if (v5 | ((v6 & 2) >> 1))
      v7 = 2;
    else
      v7 = 0;
    *((_BYTE *)self + 192) = v7 | v6 & 0xFD;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)hasMedia
{
  unsigned int v2;
  int v4;
  int v5;
  MPMediaQuery *v6;
  char v7;

  v2 = *((unsigned __int8 *)self + 192);
  if ((v2 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (-[MPMediaLibraryDataProviderPrivate hasMediaOfType:](self->_libraryDataProvider, "hasMediaOfType:", -1))v4 = 2;
      else
        v4 = 0;
      v5 = *((_BYTE *)self + 192) & 0xFD | v4;
    }
    else
    {
      v6 = objc_alloc_init(MPMediaQuery);
      if (-[MPMediaQuery _hasItems](v6, "_hasItems"))
        v7 = 2;
      else
        v7 = 0;
      *((_BYTE *)self + 192) = *((_BYTE *)self + 192) & 0xFD | v7;

      v5 = *((unsigned __int8 *)self + 192);
    }
    v2 = v5 | 1;
    *((_BYTE *)self + 192) = v2;
  }
  return (v2 >> 1) & 1;
}

- (BOOL)hasGeniusMixes
{
  unsigned int v2;
  int v4;
  int v5;

  v2 = *((unsigned __int8 *)self + 192);
  if ((v2 & 0x10) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (-[MPMediaLibraryDataProviderPrivate hasGeniusMixes](self->_libraryDataProvider, "hasGeniusMixes"))v4 = 32;
      else
        v4 = 0;
      v5 = *((_BYTE *)self + 192) & 0xDF | v4;
    }
    else
    {
      v5 = *((_BYTE *)self + 192) & 0xDF;
    }
    v2 = v5 | 0x10;
    *((_BYTE *)self + 192) = v2;
  }
  return (v2 >> 5) & 1;
}

- (BOOL)hasPlaylists
{
  unsigned int v2;
  void *v4;
  char v5;

  v2 = *((unsigned __int8 *)self + 192);
  if ((v2 & 0x40) == 0)
  {
    +[MPMediaQuery playlistsQuery](MPMediaQuery, "playlistsQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_hasCollections"))
      v5 = 0x80;
    else
      v5 = 0;
    *((_BYTE *)self + 192) = v5 & 0x80 | *((_BYTE *)self + 192) & 0x7F;

    v2 = *((unsigned __int8 *)self + 192) | 0x40;
    *((_BYTE *)self + 192) |= 0x40u;
  }
  return v2 >> 7;
}

- (BOOL)hasSongs
{
  unsigned int v2;
  int v4;
  int v5;
  void *v6;
  char v7;

  v2 = *((unsigned __int8 *)self + 192);
  if ((v2 & 4) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (-[MPMediaLibraryDataProviderPrivate hasMediaOfType:](self->_libraryDataProvider, "hasMediaOfType:", 1))v4 = 8;
      else
        v4 = 0;
      v5 = *((_BYTE *)self + 192) & 0xF7 | v4;
    }
    else
    {
      +[MPMediaQuery songsQuery](MPMediaQuery, "songsQuery");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "_hasItems"))
        v7 = 8;
      else
        v7 = 0;
      *((_BYTE *)self + 192) = *((_BYTE *)self + 192) & 0xF7 | v7;

      v5 = *((unsigned __int8 *)self + 192);
    }
    v2 = v5 | 4;
    *((_BYTE *)self + 192) = v2;
  }
  return (v2 >> 3) & 1;
}

- (BOOL)hasPodcasts
{
  unsigned int v2;
  int v4;
  int v5;
  void *v6;
  char v7;

  v2 = *((unsigned __int8 *)self + 193);
  if ((v2 & 4) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (-[MPMediaLibraryDataProviderPrivate hasMediaOfType:](self->_libraryDataProvider, "hasMediaOfType:", 1026))v4 = 8;
      else
        v4 = 0;
      v5 = *((_BYTE *)self + 193) & 0xF7 | v4;
    }
    else
    {
      +[MPMediaQuery podcastsQuery](MPMediaQuery, "podcastsQuery");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "_hasCollections"))
        v7 = 8;
      else
        v7 = 0;
      *((_BYTE *)self + 193) = *((_BYTE *)self + 193) & 0xF7 | v7;

      v5 = *((unsigned __int8 *)self + 193);
    }
    v2 = v5 | 4;
    *((_BYTE *)self + 193) = v2;
  }
  return (v2 >> 3) & 1;
}

- (BOOL)hasUbiquitousBookmarkableItems
{
  unsigned int v2;
  int v4;
  int v5;

  v2 = *((unsigned __int8 *)self + 193);
  if ((v2 & 0x10) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (-[MPMediaLibraryDataProviderPrivate hasUbiquitousBookmarkableItems](self->_libraryDataProvider, "hasUbiquitousBookmarkableItems"))v4 = 32;
      else
        v4 = 0;
      v5 = *((_BYTE *)self + 193) & 0xDF | v4;
    }
    else
    {
      v5 = *((_BYTE *)self + 193) & 0xDF;
    }
    v2 = v5 | 0x10;
    *((_BYTE *)self + 193) = v2;
  }
  return (v2 >> 5) & 1;
}

- (BOOL)hasComposers
{
  unsigned int v2;
  void *v4;
  char v5;

  v2 = *((unsigned __int8 *)self + 193);
  if ((v2 & 1) == 0)
  {
    +[MPMediaQuery composersQuery](MPMediaQuery, "composersQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_hasCollections"))
      v5 = 2;
    else
      v5 = 0;
    *((_BYTE *)self + 193) = *((_BYTE *)self + 193) & 0xFD | v5;

    v2 = *((unsigned __int8 *)self + 193) | 1;
    *((_BYTE *)self + 193) |= 1u;
  }
  return (v2 >> 1) & 1;
}

- (BOOL)hasAudiobooks
{
  unsigned int v2;
  int v4;
  unsigned int v5;
  void *v6;
  char v7;

  v2 = *((unsigned __int8 *)self + 193);
  if ((v2 & 0x40) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (-[MPMediaLibraryDataProviderPrivate hasMediaOfType:](self->_libraryDataProvider, "hasMediaOfType:", 4))v4 = -128;
      else
        v4 = 0;
      v5 = v4 & 0xFFFFFF80 | *((_BYTE *)self + 193) & 0x7F;
    }
    else
    {
      +[MPMediaQuery audiobooksQuery](MPMediaQuery, "audiobooksQuery");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "_hasCollections"))
        v7 = 0x80;
      else
        v7 = 0;
      *((_BYTE *)self + 193) = v7 & 0x80 | *((_BYTE *)self + 193) & 0x7F;

      v5 = *((unsigned __int8 *)self + 193);
    }
    v2 = v5 | 0x40;
    *((_BYTE *)self + 193) = v2;
  }
  return (v2 >> 7) & 1;
}

- (BOOL)_checkHasContent:(BOOL *)a3 determined:(BOOL *)a4 queryHasEntitiesBlock:(id)a5
{
  BOOL result;

  result = *a3;
  if (!*a4)
  {
    result = (*((uint64_t (**)(id, SEL))a5 + 2))(a5, a2);
    *a3 = result;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_checkHasContent:(BOOL *)a3 determined:(BOOL *)a4 mediaType:(unint64_t)a5 queryHasEntitiesBlock:(id)a6
{
  BOOL result;

  result = *a3;
  if (!*a4)
  {
    result = (*((uint64_t (**)(id, SEL))a6 + 2))(a6, a2);
    *a3 = result;
    *a4 = 1;
  }
  return result;
}

- (BOOL)hasVideos
{
  return -[MPMediaLibrary _checkHasContent:determined:mediaType:queryHasEntitiesBlock:](self, "_checkHasContent:determined:mediaType:queryHasEntitiesBlock:", &self->_hasVideos, &self->_determinedHasVideos, 65280, &__block_literal_global_204);
}

- (BOOL)hasMusicVideos
{
  return -[MPMediaLibrary _checkHasContent:determined:mediaType:queryHasEntitiesBlock:](self, "_checkHasContent:determined:mediaType:queryHasEntitiesBlock:", &self->_hasMusicVideos, &self->_determinedHasMusicVideos, 2048, &__block_literal_global_205);
}

- (BOOL)hasAudibleAudioBooks
{
  return -[MPMediaLibrary _checkHasContent:determined:queryHasEntitiesBlock:](self, "_checkHasContent:determined:queryHasEntitiesBlock:", &self->_hasAudibleAudioBooks, &self->_determinedHasAudibleAudioBooks, &__block_literal_global_206);
}

- (BOOL)hasMovies
{
  return -[MPMediaLibrary _checkHasContent:determined:mediaType:queryHasEntitiesBlock:](self, "_checkHasContent:determined:mediaType:queryHasEntitiesBlock:", &self->_hasMovies, &self->_determinedHasMovies, 256, &__block_literal_global_207);
}

- (BOOL)hasCompilations
{
  return -[MPMediaLibrary _checkHasContent:determined:queryHasEntitiesBlock:](self, "_checkHasContent:determined:queryHasEntitiesBlock:", &self->_hasCompilations, &self->_determinedHasCompilations, &__block_literal_global_208);
}

- (BOOL)hasITunesUContent
{
  return -[MPMediaLibrary _checkHasContent:determined:mediaType:queryHasEntitiesBlock:](self, "_checkHasContent:determined:mediaType:queryHasEntitiesBlock:", &self->_hasITunesU, &self->_determinedHasITunesU, 4104, &__block_literal_global_209);
}

- (BOOL)hasAudioITunesUContent
{
  return -[MPMediaLibrary _checkHasContent:determined:mediaType:queryHasEntitiesBlock:](self, "_checkHasContent:determined:mediaType:queryHasEntitiesBlock:", &self->_hasITunesU, &self->_determinedHasITunesU, 8, &__block_literal_global_210);
}

- (BOOL)hasVideoITunesUContent
{
  return -[MPMediaLibrary _checkHasContent:determined:mediaType:queryHasEntitiesBlock:](self, "_checkHasContent:determined:mediaType:queryHasEntitiesBlock:", &self->_hasVideoITunesU, &self->_determinedHasVideoITunesU, 4096, &__block_literal_global_211);
}

- (BOOL)hasMovieRentals
{
  return -[MPMediaLibrary _checkHasContent:determined:queryHasEntitiesBlock:](self, "_checkHasContent:determined:queryHasEntitiesBlock:", &self->_hasMovieRentals, &self->_determinedHasMovieRentals, &__block_literal_global_212);
}

- (BOOL)hasTVShows
{
  return -[MPMediaLibrary _checkHasContent:determined:mediaType:queryHasEntitiesBlock:](self, "_checkHasContent:determined:mediaType:queryHasEntitiesBlock:", &self->_hasTVShows, &self->_determinedHasTVShows, 512, &__block_literal_global_213);
}

- (BOOL)hasHomeVideos
{
  return -[MPMediaLibrary _checkHasContent:determined:mediaType:queryHasEntitiesBlock:](self, "_checkHasContent:determined:mediaType:queryHasEntitiesBlock:", &self->_hasHomeVideos, &self->_determinedHasHomeVideos, 0x2000, &__block_literal_global_214);
}

- (BOOL)hasVideoPodcasts
{
  return -[MPMediaLibrary _checkHasContent:determined:mediaType:queryHasEntitiesBlock:](self, "_checkHasContent:determined:mediaType:queryHasEntitiesBlock:", &self->_hasVideoPodcasts, &self->_determinedHasVideoPodcasts, 1024, &__block_literal_global_215);
}

- (BOOL)hasUserPlaylists
{
  void *v2;
  void *v3;
  char v4;

  -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "library");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasUserPlaylists");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAddedToLibraryAppleMusicContent
{
  void *v2;
  void *v3;
  char v4;

  -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "library");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasAddedToLibraryAppleMusicContent");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasUserPlaylistsContainingAppleMusicContent
{
  void *v2;
  void *v3;
  char v4;

  -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "library");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasUserPlaylistsContainingAppleMusicContent");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)itemExistsInDatabaseWithPersistentID:(unint64_t)a3
{
  MPMediaQuery *v6;
  void *v7;
  void *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[MPMediaLibraryDataProviderPrivate itemExistsWithPersistentID:](self->_libraryDataProvider, "itemExistsWithPersistentID:", a3) & 1) != 0)
  {
    return 1;
  }
  v6 = objc_alloc_init(MPMediaQuery);
  -[MPMediaQuery setMediaLibrary:](v6, "setMediaLibrary:", self);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v7, CFSTR("persistentID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaQuery addFilterPredicate:](v6, "addFilterPredicate:", v8);

  -[MPMediaQuery setShouldIncludeNonLibraryEntities:](v6, "setShouldIncludeNonLibraryEntities:", 1);
  LOBYTE(v7) = -[MPMediaQuery _hasItems](v6, "_hasItems");

  return (char)v7;
}

- (BOOL)playlistExistsWithPersistentID:(unint64_t)a3
{
  MPMediaQuery *v6;
  void *v7;
  void *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[MPMediaLibraryDataProviderPrivate playlistExistsWithPersistentID:](self->_libraryDataProvider, "playlistExistsWithPersistentID:", a3);
  v6 = objc_alloc_init(MPMediaQuery);
  -[MPMediaQuery setMediaLibrary:](v6, "setMediaLibrary:", self);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v7, CFSTR("playlistPersistentID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaQuery addFilterPredicate:](v6, "addFilterPredicate:", v8);

  LOBYTE(v7) = -[MPMediaQuery _hasCollections](v6, "_hasCollections");
  return (char)v7;
}

- (BOOL)collectionExistsWithPersistentID:(unint64_t)a3 groupingType:(int64_t)a4
{
  return -[MPMediaLibraryDataProviderPrivate collectionExistsWithPersistentID:groupingType:](self->_libraryDataProvider, "collectionExistsWithPersistentID:groupingType:", a3, a4);
}

- (id)collectionWithPersistentID:(unint64_t)a3 groupingType:(int64_t)a4
{
  return -[MPMediaLibrary collectionWithPersistentID:groupingType:verifyExistence:](self, "collectionWithPersistentID:groupingType:verifyExistence:", a3, a4, 1);
}

- (id)collectionWithPersistentID:(unint64_t)a3 groupingType:(int64_t)a4 verifyExistence:(BOOL)a5
{
  _BOOL4 v5;
  MPMediaQuery *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MPMediaQuery *v15;
  MPConcreteMediaItemCollection *v16;

  v5 = a5;
  v9 = [MPMediaQuery alloc];
  v10 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaItem persistentIDPropertyForGroupingType:](MPMediaItem, "persistentIDPropertyForGroupingType:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MPMediaQuery initWithFilterPredicates:](v9, "initWithFilterPredicates:", v14);

  -[MPMediaQuery setMediaLibrary:](v15, "setMediaLibrary:", self);
  v16 = -[MPConcreteMediaItemCollection initWithIdentifier:itemsQuery:grouping:]([MPConcreteMediaItemCollection alloc], "initWithIdentifier:itemsQuery:grouping:", a3, v15, a4);
  if (v5
    && !-[MPMediaLibrary collectionExistsWithPersistentID:groupingType:](self, "collectionExistsWithPersistentID:groupingType:", a3, a4))
  {

    v16 = 0;
  }

  return v16;
}

- (id)itemWithPersistentID:(unint64_t)a3
{
  return -[MPMediaLibrary itemWithPersistentID:verifyExistence:](self, "itemWithPersistentID:verifyExistence:", a3, 1);
}

- (id)itemWithStoreID:(unint64_t)a3
{
  void *v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)-[MPMediaLibraryDataProviderPrivate itemPersistentIDForStoreID:](self->_libraryDataProvider, "itemPersistentIDForStoreID:", a3);
    if (v5)
    {
      -[MPMediaLibrary itemWithPersistentID:verifyExistence:](self, "itemWithPersistentID:verifyExistence:", v5, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)decodeItemWithCoder:(id)a3
{
  id v3;
  MPConcreteMediaItem *v4;

  v3 = a3;
  v4 = -[MPConcreteMediaItem initWithCoder:]([MPConcreteMediaItem alloc], "initWithCoder:", v3);

  return v4;
}

- (id)newPlaylistWithPersistentID:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  MPMediaQueryCriteria *v9;
  MPMediaQuery *v10;
  MPConcreteMediaPlaylist *v11;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", a3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v4, CFSTR("playlistPersistentID"), 0);
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v4, CFSTR("playlistPersistentID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, 0);

  v9 = objc_alloc_init(MPMediaQueryCriteria);
  -[MPMediaQueryCriteria setFilterPredicates:](v9, "setFilterPredicates:", v8);
  v10 = -[MPMediaQuery initWithCriteria:library:]([MPMediaQuery alloc], "initWithCriteria:library:", v9, self);
  v11 = -[MPConcreteMediaPlaylist initWithProperties:itemsQuery:]([MPConcreteMediaPlaylist alloc], "initWithProperties:itemsQuery:", v5, v10);

  return v11;
}

- (id)localizedSectionHeaderForSectionIndex:(unint64_t)a3
{
  return (id)-[MPMediaLibraryDataProviderPrivate localizedSectionHeaderForSectionIndex:](self->_libraryDataProvider, "localizedSectionHeaderForSectionIndex:", a3);
}

- (id)localizedSectionIndexTitles
{
  return (id)-[MPMediaLibraryDataProviderPrivate localizedSectionIndexTitles](self->_libraryDataProvider, "localizedSectionIndexTitles");
}

- (id)playbackHistoryPlaylist
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)-[MPMediaLibraryDataProviderPrivate playbackHistoryPlaylistPersistentID](self->_libraryDataProvider, "playbackHistoryPlaylistPersistentID");
    if (v3)
    {
      -[MPMediaLibrary playlistWithPersistentID:](self, "playlistWithPersistentID:", v3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)photosMemoriesPlaylist
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)-[MPMediaLibraryDataProviderPrivate photosMemoriesPlaylistPersistentID](self->_libraryDataProvider, "photosMemoriesPlaylistPersistentID");
    if (v3)
    {
      -[MPMediaLibrary playlistWithPersistentID:](self, "playlistWithPersistentID:", v3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)playlistWithPersistentID:(unint64_t)a3
{
  return -[MPMediaLibrary newPlaylistWithPersistentID:](self, "newPlaylistWithPersistentID:", a3);
}

- (id)addPlaylistWithName:(id)a3
{
  return -[MPMediaLibrary _addPlaylistWithName:activeGeniusPlaylist:externalVendorIdentifier:properties:trackList:playlistEntryProperties:](self, "_addPlaylistWithName:activeGeniusPlaylist:externalVendorIdentifier:properties:trackList:playlistEntryProperties:", a3, 0, 0, 0, 0, 0);
}

- (id)addPlaylistWithName:(id)a3 activeGeniusPlaylist:(BOOL)a4
{
  return -[MPMediaLibrary _addPlaylistWithName:activeGeniusPlaylist:externalVendorIdentifier:properties:trackList:playlistEntryProperties:](self, "_addPlaylistWithName:activeGeniusPlaylist:externalVendorIdentifier:properties:trackList:playlistEntryProperties:", a3, a4, 0, 0, 0, 0);
}

- (id)addPlaylistWithName:(id)a3 properties:(id)a4 trackList:(id)a5 playlistEntryProperties:(id)a6
{
  return -[MPMediaLibrary _addPlaylistWithName:activeGeniusPlaylist:externalVendorIdentifier:properties:trackList:playlistEntryProperties:](self, "_addPlaylistWithName:activeGeniusPlaylist:externalVendorIdentifier:properties:trackList:playlistEntryProperties:", a3, 0, 0, a4, a5, a6);
}

- (id)_addPlaylistWithName:(id)a3 externalVendorIdentifier:(id)a4
{
  return -[MPMediaLibrary _addPlaylistWithName:activeGeniusPlaylist:externalVendorIdentifier:properties:trackList:playlistEntryProperties:](self, "_addPlaylistWithName:activeGeniusPlaylist:externalVendorIdentifier:properties:trackList:playlistEntryProperties:", a3, 0, a4, 0, 0, 0);
}

- (id)_addPlaylistWithName:(id)a3 activeGeniusPlaylist:(BOOL)a4 externalVendorIdentifier:(id)a5 properties:(id)a6 trackList:(id)a7 playlistEntryProperties:(id)a8
{
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  dispatch_semaphore_t v23;
  NSObject *v24;
  _QWORD v26[4];
  dispatch_semaphore_t v27;

  v12 = a4;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v16)
    v19 = (id)objc_msgSend(v16, "mutableCopy");
  else
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = v19;
  if (v14)
    objc_msgSend(v19, "setObject:forKey:", v14, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("isActiveGeniusPlaylist"));

  if (v15)
    objc_msgSend(v20, "setObject:forKey:", v15, CFSTR("externalVendorIdentifier"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPMediaLibrary playlistWithPersistentID:](self, "playlistWithPersistentID:", -[MPMediaLibraryDataProviderPrivate addPlaylistWithValuesForProperties:trackList:playlistEntryProperties:](self->_libraryDataProvider, "addPlaylistWithValuesForProperties:trackList:playlistEntryProperties:", v20, v17, v18));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPMediaLibrary playlistWithPersistentID:](self, "playlistWithPersistentID:", -[MPMediaLibraryDataProviderPrivate addPlaylistWithValuesForProperties:](self->_libraryDataProvider, "addPlaylistWithValuesForProperties:", v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 && objc_msgSend(v17, "count"))
    {
      v23 = dispatch_semaphore_create(0);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __130__MPMediaLibrary__addPlaylistWithName_activeGeniusPlaylist_externalVendorIdentifier_properties_trackList_playlistEntryProperties___block_invoke;
      v26[3] = &unk_1E31631D8;
      v27 = v23;
      v24 = v23;
      objc_msgSend(v22, "replaceItemsWithPersistentIDs:completion:", v17, v26);
      dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)setSyncPlaylistId:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibrary setValue:forDatabaseProperty:](self, "setValue:forDatabaseProperty:", v4, CFSTR("MLSyncPlaylistId"));

}

- (unint64_t)syncPlaylistId
{
  void *v2;
  unint64_t v3;

  -[MPMediaLibrary valueForDatabaseProperty:](self, "valueForDatabaseProperty:", CFSTR("MLSyncPlaylistId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (unsigned)homeSharingDatabaseID
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[MPMediaLibraryDataProviderPrivate databaseID](self->_libraryDataProvider, "databaseID");
  else
    return 0;
}

- (id)URLForHomeSharingRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPMediaLibraryDataProviderPrivate URLForItemDataRequest:](self->_libraryDataProvider, "URLForItemDataRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)deleteItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t i;
  void *v9;
  char v10;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      v6 = v5;
      v7 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(v4, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7[i] = objc_msgSend(v9, "persistentID");

      }
      v10 = -[MPMediaLibraryDataProviderPrivate deleteItemsWithIdentifiers:count:](self->_libraryDataProvider, "deleteItemsWithIdentifiers:count:", v7, v6);
      free(v7);
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)removeItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t i;
  void *v9;
  char v10;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      v6 = v5;
      v7 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(v4, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7[i] = objc_msgSend(v9, "persistentID");

      }
      v10 = -[MPMediaLibraryDataProviderPrivate removeItemsWithIdentifiers:count:](self->_libraryDataProvider, "removeItemsWithIdentifiers:count:", v7, v6);
      free(v7);
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)removePlaylist:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[MPMediaLibraryDataProviderPrivate removePlaylistWithIdentifier:](self->_libraryDataProvider, "removePlaylistWithIdentifier:", objc_msgSend(v4, "persistentID"));
  else
    v5 = 0;

  return v5;
}

- (void)populateLocationPropertiesOfItem:(id)a3 withPath:(id)a4 assetProtectionType:(int64_t)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPMediaLibraryDataProviderPrivate populateLocationPropertiesOfItemWithIdentifier:withPath:assetProtectionType:](self->_libraryDataProvider, "populateLocationPropertiesOfItemWithIdentifier:withPath:assetProtectionType:", objc_msgSend(v9, "persistentID"), v8, a5);

}

- (void)populateLocationPropertiesOfItem:(id)a3 withPath:(id)a4 assetProtectionType:(int64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v10 = a4;
  v11 = a6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPMediaLibraryDataProviderPrivate populateLocationPropertiesOfItemWithIdentifier:withPath:assetProtectionType:completionBlock:](self->_libraryDataProvider, "populateLocationPropertiesOfItemWithIdentifier:withPath:assetProtectionType:completionBlock:", objc_msgSend(v12, "persistentID"), v10, a5, v11);
  }
  else if (v11)
  {
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
  }

}

- (void)clearLocationPropertiesOfItem:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPMediaLibraryDataProviderPrivate clearLocationPropertiesOfItemWithIdentifier:](self->_libraryDataProvider, "clearLocationPropertiesOfItemWithIdentifier:", objc_msgSend(v4, "persistentID"));

}

- (void)setValues:(id)a3 forProperties:(id)a4 forItemPersistentIDs:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(v13, "count");
    if (v11 != objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibrary.m"), 1699, CFSTR("values/properties must have the same count (%lu != %lu)"), objc_msgSend(v13, "count"), objc_msgSend(v9, "count"));

    }
    -[MPMediaLibraryDataProviderPrivate setValues:forProperties:forItemPersistentIDs:](self->_libraryDataProvider, "setValues:forProperties:forItemPersistentIDs:", v13, v9, v10);
  }

}

- (void)geniusItemsForSeedItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPMediaLibraryDataProviderPrivate geniusItemsForSeedItem:completion:](self->_libraryDataProvider, "geniusItemsForSeedItem:completion:", v7, v6);

}

- (BOOL)isGeniusEnabled
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[MPMediaLibraryDataProviderPrivate isGeniusEnabled](self->_libraryDataProvider, "isGeniusEnabled");
  else
    return 0;
}

- (id)preferredAudioLanguages
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPMediaLibraryDataProviderPrivate preferredAudioLanguages](self->_libraryDataProvider, "preferredAudioLanguages");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)preferredSubtitleLanguages
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPMediaLibraryDataProviderPrivate preferredSubtitleLanguages](self->_libraryDataProvider, "preferredSubtitleLanguages");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)requiresAuthentication
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[MPMediaLibraryDataProviderPrivate requiresAuthentication](self->_libraryDataProvider, "requiresAuthentication");
  else
    return 0;
}

- (void)connectWithAuthenticationData:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__MPMediaLibrary_connectWithAuthenticationData_completionBlock___block_invoke;
  v7[3] = &unk_1E31624C0;
  v8 = v5;
  v6 = v5;
  -[MPMediaLibrary connectWithCompletionHandler:](self, "connectWithCompletionHandler:", v7);

}

- (BOOL)performTransactionWithBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  char v5;
  BOOL v6;

  v4 = (uint64_t (**)(_QWORD))a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[MPMediaLibraryDataProviderPrivate performTransactionWithBlock:](self->_libraryDataProvider, "performTransactionWithBlock:", v4);
  else
    v5 = v4[2](v4);
  v6 = v5;

  return v6;
}

- (void)performReadTransactionWithBlock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPMediaLibraryDataProviderPrivate performReadTransactionWithBlock:](self->_libraryDataProvider, "performReadTransactionWithBlock:", v4);
  else
    v4[2]();

}

- (BOOL)isCurrentThreadInTransaction
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[MPMediaLibraryDataProviderPrivate isCurrentThreadInTransaction](self->_libraryDataProvider, "isCurrentThreadInTransaction");
  else
    return 0;
}

- (float)connectionProgress
{
  return self->_connectionProgress;
}

- (id)syncValidity
{
  return (id)-[MPMediaLibraryDataProviderPrivate syncValidity](self->_libraryDataProvider, "syncValidity");
}

- (id)entityCache
{
  return (id)-[MPMediaLibraryDataProviderPrivate entityCache](self->_libraryDataProvider, "entityCache");
}

- (BOOL)setValue:(id)a3 forDatabaseProperty:(id)a4
{
  return -[MPMediaLibraryDataProviderPrivate setValue:forDatabaseProperty:](self->_libraryDataProvider, "setValue:forDatabaseProperty:", a3, a4);
}

- (BOOL)deleteDatabaseProperty:(id)a3
{
  return -[MPMediaLibraryDataProviderPrivate deleteDatabaseProperty:](self->_libraryDataProvider, "deleteDatabaseProperty:", a3);
}

- (id)multiverseIdentifierForTrackWithPersistentID:(int64_t)a3
{
  return (id)-[MPMediaLibraryDataProviderPrivate multiverseIdentifierForTrackWithPersistentID:](self->_libraryDataProvider, "multiverseIdentifierForTrackWithPersistentID:", a3);
}

- (id)multiverseIdentifierForCollectionWithPersistentID:(int64_t)a3 groupingType:(int64_t)a4
{
  return (id)-[MPMediaLibraryDataProviderPrivate multiverseIdentifierForCollectionWithPersistentID:groupingType:](self->_libraryDataProvider, "multiverseIdentifierForCollectionWithPersistentID:groupingType:", a3, a4);
}

- (id)entityWithMultiverseIdentifier:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "mediaObjectType");
  v5 = (objc_class *)objc_opt_class();
  if (v5)
    v6 = (void *)objc_msgSend([v5 alloc], "initWithMultiverseIdentifier:library:", v4, self);
  else
    v6 = 0;

  return v6;
}

- (id)entityWithLibraryURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  MPMediaLibrary *v12;
  uint64_t v13;

  v4 = a3;
  -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0D51250];
    objc_msgSend(v5, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entityFromURL:inLibrary:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MPMediaLibrary itemWithPersistentID:verifyExistence:](self, "itemWithPersistentID:verifyExistence:", objc_msgSend(v8, "persistentID"), 0);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v10 = (void *)v9;
LABEL_21:

        goto LABEL_22;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MPMediaLibrary playlistWithPersistentID:](self, "playlistWithPersistentID:", objc_msgSend(v8, "persistentID"));
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v8, "persistentID");
        v12 = self;
        v13 = 1;
LABEL_18:
        -[MPMediaLibrary collectionWithPersistentID:groupingType:verifyExistence:](v12, "collectionWithPersistentID:groupingType:verifyExistence:", v11, v13, 0);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v8, "persistentID");
        v12 = self;
        v13 = 2;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v8, "persistentID");
        v12 = self;
        v13 = 3;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v8, "persistentID");
        v12 = self;
        v13 = 4;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v8, "persistentID");
        v12 = self;
        v13 = 5;
        goto LABEL_18;
      }
    }
    v10 = 0;
    goto LABEL_21;
  }
  v10 = 0;
LABEL_22:

  return v10;
}

- (id)entityWithSpotlightIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibrary entityWithLibraryURL:](self, "entityWithLibraryURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)entityWithPersistentID:(int64_t)a3 entityType:(int64_t)a4
{
  void *v4;
  uint64_t v5;

  v4 = 0;
  if (a3)
  {
    switch(a4)
    {
      case 0:
        -[MPMediaLibrary itemWithPersistentID:verifyExistence:](self, "itemWithPersistentID:verifyExistence:");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      case 1:
        -[MPMediaLibrary playlistWithPersistentID:](self, "playlistWithPersistentID:");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      case 2:
      case 3:
      case 4:
      case 5:
      case 7:
        -[MPMediaLibrary collectionWithPersistentID:groupingType:verifyExistence:](self, "collectionWithPersistentID:groupingType:verifyExistence:");
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
        v4 = (void *)v5;
        break;
      default:
        return v4;
    }
  }
  return v4;
}

- (void)downloadAsset:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;

  if (a4)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = a4;
    objc_msgSend(v5, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPErrorDomain"), -10101, CFSTR("downloadAsset is not available"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a4 + 2))(v6, v7);

  }
}

- (BOOL)isValidAssetURL:(id)a3
{
  return objc_msgSend(a3, "msv_isValidMediaAssetURL");
}

- (id)pathForAssetURL:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(a3, "msv_mediaAssetPersistentID");
  if (v4)
  {
    -[MPMediaLibrary itemWithPersistentID:](self, "itemWithPersistentID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForProperty:", CFSTR("filePath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)securityScopedFileURLForAssetURL:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  MPMediaLibrary *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "msv_mediaAssetPersistentID");
  if (v5)
  {
    v6 = v5;
    v7 = objc_alloc(MEMORY[0x1E0D51270]);
    -[MPMediaLibrary databasePath](self, "databasePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithPath:", v8);

    objc_msgSend(v9, "securityScopedFileURLForItemPID:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138478083;
      v14 = self;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_ERROR, "%{private}@ sandboxedFileURLForAssetURL - Invalid assetURL %{public}@", (uint8_t *)&v13, 0x16u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)activeUserChangeDidFinish
{
  NSObject *v3;
  int v4;
  MPMediaLibrary *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Active user change completed - Firing notifications for path change", (uint8_t *)&v4, 0xCu);
  }

  -[MPMediaLibrary _reloadLibraryForPathChange](self, "_reloadLibraryForPathChange");
}

- (BOOL)_handlesSameAccountAs:(id)a3
{
  MPMediaLibrary *v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (MPMediaLibrary *)a3;
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsMultipleITunesAccounts");

  v7 = 0;
  if (self != v4 && v6)
  {
    -[MPMediaLibrary userIdentity](self, "userIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibrary userIdentity](v4, "userIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v11)
      v7 = 1;
    else
      v7 = objc_msgSend(v9, "isEqual:", v11);

  }
  return v7;
}

- (BOOL)collectionExistsContainedWithinPersistentIDs:(const unint64_t *)a3 count:(unint64_t)a4 groupingType:(int64_t)a5 existentPID:(unint64_t *)a6
{
  return -[MPMediaLibraryDataProviderPrivate collectionExistsContainedWithinPersistentIDs:count:groupingType:existentPID:](self->_libraryDataProvider, "collectionExistsContainedWithinPersistentIDs:count:groupingType:existentPID:", a3, a4, a5, a6);
}

- (BOOL)collectionExistsWithName:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  return -[MPMediaLibraryDataProviderPrivate collectionExistsWithName:groupingType:existentPID:](self->_libraryDataProvider, "collectionExistsWithName:groupingType:existentPID:", a3, a4, a5);
}

- (BOOL)collectionExistsWithStoreID:(int64_t)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  return -[MPMediaLibraryDataProviderPrivate collectionExistsWithStoreID:groupingType:existentPID:](self->_libraryDataProvider, "collectionExistsWithStoreID:groupingType:existentPID:", a3, a4, a5);
}

- (BOOL)collectionExistsWithSagaID:(int64_t)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  return -[MPMediaLibraryDataProviderPrivate collectionExistsWithSagaID:groupingType:existentPID:](self->_libraryDataProvider, "collectionExistsWithSagaID:groupingType:existentPID:", a3, a4, a5);
}

- (BOOL)collectionExistsWithCloudLibraryID:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  return -[MPMediaLibraryDataProviderPrivate collectionExistsWithCloudLibraryID:groupingType:existentPID:](self->_libraryDataProvider, "collectionExistsWithCloudLibraryID:groupingType:existentPID:", a3, a4, a5);
}

- (BOOL)collectionExistsWithCloudUniversalLibraryID:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  return -[MPMediaLibraryDataProviderPrivate collectionExistsWithCloudUniversalLibraryID:groupingType:existentPID:](self->_libraryDataProvider, "collectionExistsWithCloudUniversalLibraryID:groupingType:existentPID:", a3, a4, a5);
}

- (BOOL)collectionExistsContainedWithinSyncIDs:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  return -[MPMediaLibraryDataProviderPrivate collectionExistsContainedWithinSyncIDs:groupingType:existentPID:](self->_libraryDataProvider, "collectionExistsContainedWithinSyncIDs:groupingType:existentPID:", a3, a4, a5);
}

- (id)_itemPersistentIdentifiersForQueryCriteria:(id)a3
{
  id v4;
  NSObject *entityCacheQueue;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__13969;
  v26 = __Block_byref_object_dispose__13970;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  entityCacheQueue = self->_entityCacheQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MPMediaLibrary__itemPersistentIdentifiersForQueryCriteria___block_invoke;
  block[3] = &unk_1E3158C68;
  v16 = &v18;
  block[4] = self;
  v7 = v4;
  v15 = v7;
  v17 = &v22;
  dispatch_sync(entityCacheQueue, block);
  if (*((_BYTE *)v19 + 24))
    objc_msgSend((id)v23[5], "updateToLibraryCurrentRevision");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v23[5], "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v23[5];
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __61__MPMediaLibrary__itemPersistentIdentifiersForQueryCriteria___block_invoke_2;
  v12[3] = &unk_1E3157C90;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v9, "enumeratePersistentIDsUsingBlock:", v12);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (id)_collectionPersistentIdentifiersForQueryCriteria:(id)a3
{
  id v4;
  NSObject *entityCacheQueue;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__13969;
  v26 = __Block_byref_object_dispose__13970;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  entityCacheQueue = self->_entityCacheQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MPMediaLibrary__collectionPersistentIdentifiersForQueryCriteria___block_invoke;
  block[3] = &unk_1E3158C68;
  v16 = &v18;
  block[4] = self;
  v7 = v4;
  v15 = v7;
  v17 = &v22;
  dispatch_sync(entityCacheQueue, block);
  if (*((_BYTE *)v19 + 24))
    objc_msgSend((id)v23[5], "updateToLibraryCurrentRevision");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v23[5], "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v23[5];
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __67__MPMediaLibrary__collectionPersistentIdentifiersForQueryCriteria___block_invoke_2;
  v12[3] = &unk_1E3157C90;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v9, "enumeratePersistentIDsUsingBlock:", v12);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)_clearPendingDisconnection
{
  NSObject *connectionAssertionsQueue;
  _QWORD block[5];

  connectionAssertionsQueue = self->_connectionAssertionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MPMediaLibrary__clearPendingDisconnection__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(connectionAssertionsQueue, block);
}

- (void)_disconnect
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  MPMediaLibrary *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NSPointerArray compact](self->_connectionAssertions, "compact");
  -[NSPointerArray allObjects](self->_connectionAssertions, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Library_Oversize");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NSPointerArray allObjects](self->_connectionAssertions, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = self;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%@ Deferring disconnect due to active assertions: %{public}@", (uint8_t *)&v7, 0x16u);

    }
    self->_disconnectAfterReleasingAssertions = 1;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MPMediaLibraryDataProviderPrivate disconnect](self->_libraryDataProvider, "disconnect");
    -[MPMediaLibrary _clearCachedEntitiesIncludingResultSets:](self, "_clearCachedEntitiesIncludingResultSets:", 0);
    self->_connectionProgress = -1.0;
  }
}

- (MSVSQLDatabase)msvDatabase
{
  void *v2;
  void *v3;
  void *v4;

  -[MPMediaLibrary databasePath](self, "databasePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0D0]), "initWithURL:error:", v3, 0);

  }
  else
  {
    v4 = 0;
  }

  return (MSVSQLDatabase *)v4;
}

- (id)_initWithLibraryDataProvider:(id)a3
{
  id v5;
  MPMediaLibrary *v6;
  MPMediaLibrary *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *entityCacheQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *connectionAssertionsQueue;
  uint64_t v12;
  OS_dispatch_queue *fixedQueue;
  dispatch_queue_t v14;
  OS_dispatch_queue *additionalLibraryFilterPredicatesAccessQueue;
  QueryCriteriaResultsCache *v16;
  QueryCriteriaResultsCache *itemsForCriteriaCache;
  QueryCriteriaResultsCache *v18;
  QueryCriteriaResultsCache *collectionsForCriteriaCache;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MPMediaLibrary;
  v6 = -[MPMediaLibrary init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryDataProvider, a3);
    v8 = dispatch_queue_create("com.apple.mediaplayer.MPMediaLibraryRemote", 0);
    entityCacheQueue = v7->_entityCacheQueue;
    v7->_entityCacheQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.mediaplayer.MPMediaLibrary.connectionAssertions", 0);
    connectionAssertionsQueue = v7->_connectionAssertionsQueue;
    v7->_connectionAssertionsQueue = (OS_dispatch_queue *)v10;

    dispatch_get_global_queue(2, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    fixedQueue = v7->_fixedQueue;
    v7->_fixedQueue = (OS_dispatch_queue *)v12;

    v7->__MLCoreStorageLock._os_unfair_lock_opaque = 0;
    v7->__MLCoreStorageLockPointer = &v7->__MLCoreStorageLock;
    v14 = dispatch_queue_create("com.apple.mediaplayer.MPMediaLibrary.additionalLibraryFilterPredicatesAccessQueue", 0);
    additionalLibraryFilterPredicatesAccessQueue = v7->_additionalLibraryFilterPredicatesAccessQueue;
    v7->_additionalLibraryFilterPredicatesAccessQueue = (OS_dispatch_queue *)v14;

    v16 = objc_alloc_init(QueryCriteriaResultsCache);
    itemsForCriteriaCache = v7->_itemsForCriteriaCache;
    v7->_itemsForCriteriaCache = v16;

    v18 = objc_alloc_init(QueryCriteriaResultsCache);
    collectionsForCriteriaCache = v7->_collectionsForCriteriaCache;
    v7->_collectionsForCriteriaCache = v18;

    v7->_connectionProgress = -1.0;
  }

  return v7;
}

- (void)addStoreItem:(int64_t)a3 andAddTracksToCloudLibrary:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v5 = a4;
  v12[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  objc_msgSend(v8, "numberWithLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibrary addStoreItemIDs:andAddTracksToCloudLibrary:withCompletion:](self, "addStoreItemIDs:andAddTracksToCloudLibrary:withCompletion:", v11, v5, v9);

}

- (void)addStoreItemIDs:(id)a3 andAddTracksToCloudLibrary:(BOOL)a4 withCompletion:(id)a5
{
  -[MPMediaLibrary addStoreItemIDs:referralObject:andAddTracksToCloudLibrary:withCompletion:](self, "addStoreItemIDs:referralObject:andAddTracksToCloudLibrary:withCompletion:", a3, 0, a4, a5);
}

- (void)addStoreItemIDs:(id)a3 referralObject:(id)a4 andAddTracksToCloudLibrary:(BOOL)a5 withCompletion:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MPStoreItemLibraryImportElement *v17;
  MPStoreItemLibraryImport *v18;
  _BOOL4 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v19 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = -[MPStoreItemLibraryImportElement initWithStoreItemID:additionalTrackMetadata:]([MPStoreItemLibraryImportElement alloc], "initWithStoreItemID:additionalTrackMetadata:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "longLongValue"), 0);
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  v18 = -[MPStoreItemLibraryImport initWithImportElements:referralObject:usingCloudLibraryDestination:]([MPStoreItemLibraryImport alloc], "initWithImportElements:referralObject:usingCloudLibraryDestination:", v11, v9, v19);
  -[MPMediaLibrary performStoreItemLibraryImport:withCompletion:](self, "performStoreItemLibraryImport:withCompletion:", v18, v10);

}

- (void)performStoreItemLibraryImport:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  MPMediaLibraryDataProviderPrivate *libraryDataProvider;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    libraryDataProvider = self->_libraryDataProvider;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__MPMediaLibrary_performStoreItemLibraryImport_withCompletion___block_invoke;
    v12[3] = &unk_1E31562D0;
    objc_copyWeak(&v14, &location);
    v13 = v7;
    -[MPMediaLibraryDataProviderPrivate performStoreItemLibraryImport:withCompletion:](libraryDataProvider, "performStoreItemLibraryImport:withCompletion:", v6, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("unimplemented");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("MPMediaLibraryErrorDomain"), -1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
  }

}

- (void)performStoreAlbumArtistLibraryImport:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  MPMediaLibraryDataProviderPrivate *libraryDataProvider;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    libraryDataProvider = self->_libraryDataProvider;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__MPMediaLibrary_performStoreAlbumArtistLibraryImport_withCompletion___block_invoke;
    v12[3] = &unk_1E31562D0;
    objc_copyWeak(&v14, &location);
    v13 = v7;
    -[MPMediaLibraryDataProviderPrivate performStoreAlbumArtistLibraryImport:withCompletion:](libraryDataProvider, "performStoreAlbumArtistLibraryImport:withCompletion:", v6, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("unimplemented");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("MPMediaLibraryErrorDomain"), -1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
  }

}

- (void)getPlaylistWithUUID:(NSUUID *)uuid creationMetadata:(MPMediaPlaylistCreationMetadata *)creationMetadata completionHandler:(void *)completionHandler
{
  NSUUID *v8;
  MPMediaPlaylistCreationMetadata *v9;
  void (**v10)(void *, id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MPMediaPlaylist *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  MPMediaPlaylist *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  _QWORD v49[4];
  MPMediaPlaylist *v50;
  MPMediaLibrary *v51;
  id v52;
  void (**v53)(void *, id, _QWORD);
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  __int128 buf;
  Class (*v68)(uint64_t);
  void *v69;
  uint64_t *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = uuid;
  v9 = creationMetadata;
  v10 = completionHandler;
  -[NSUUID UUIDString](v8, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v11, CFSTR("externalVendorContainerTag"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaQuery playlistsQuery](MPMediaQuery, "playlistsQuery");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMediaLibrary:", self);
    objc_msgSend(v13, "addFilterPredicate:", v12);
    objc_msgSend(v13, "collections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (MPMediaPlaylist *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (v10)
        v10[2](v10, v15, 0);
      goto LABEL_46;
    }
    v22 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    v23 = v22;
    if (v9)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_DEFAULT, "Creating playlist for %{public}@", (uint8_t *)&buf, 0xCu);
      }

      if (+[MPMediaLibrary authorizationStatus](MPMediaLibrary, "authorizationStatus") == MPMediaLibraryAuthorizationStatusAuthorized)
      {
        -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          -[MPMediaPlaylistCreationMetadata name](v9, "name");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
            objc_msgSend(v47, "setObject:forKey:", v45, CFSTR("name"));
          -[MPMediaPlaylistCreationMetadata authorDisplayName](v9, "authorDisplayName");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
            objc_msgSend(v47, "setObject:forKey:", v44, CFSTR("externalVendorDisplayName"));
          -[MPMediaPlaylistCreationMetadata descriptionText](v9, "descriptionText");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
            objc_msgSend(v47, "setObject:forKey:", v43, CFSTR("descriptionInfo"));
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "bundleIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
            objc_msgSend(v47, "setObject:forKey:", v42, CFSTR("externalVendorIdentifier"));
          objc_msgSend(v47, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isExternalVendorPlaylist"));
          objc_msgSend(v47, "setObject:forKey:", v11, CFSTR("externalVendorContainerTag"));
          v24 = objc_msgSend(v46, "sdk_addPlaylistWithValuesForProperties:", v47);
          if (v24
            && (v40 = -[MPMediaPlaylist initWithPersistentID:]([MPMediaPlaylist alloc], "initWithPersistentID:", v24)) != 0)
          {
            v55 = 0;
            v56 = &v55;
            v57 = 0x2050000000;
            v25 = (void *)getSKCloudServiceControllerClass_softClass;
            v58 = getSKCloudServiceControllerClass_softClass;
            if (!getSKCloudServiceControllerClass_softClass)
            {
              *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
              *((_QWORD *)&buf + 1) = 3221225472;
              v68 = __getSKCloudServiceControllerClass_block_invoke;
              v69 = &unk_1E31639A0;
              v70 = &v55;
              __getSKCloudServiceControllerClass_block_invoke((uint64_t)&buf);
              v25 = (void *)v56[3];
            }
            v26 = objc_retainAutorelease(v25);
            _Block_object_dispose(&v55, 8);
            v39 = objc_alloc_init(v26);
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __73__MPMediaLibrary_getPlaylistWithUUID_creationMetadata_completionHandler___block_invoke;
            v49[3] = &unk_1E31562F8;
            v15 = v40;
            v50 = v15;
            v51 = self;
            v54 = v24;
            v52 = v11;
            v53 = v10;
            objc_msgSend(v39, "requestCapabilitiesWithCompletionHandler:", v49);

          }
          else
          {
            if (v10)
              v10[2](v10, 0, 0);
            v15 = 0;
          }

        }
        else
        {
          v36 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v46;
            _os_log_impl(&dword_193B9B000, v36, OS_LOG_TYPE_ERROR, "dataProvider: %{public}@ does not allow creating a playlist using the SDK", (uint8_t *)&buf, 0xCu);
          }

          if (!v10)
          {
            v15 = 0;
            goto LABEL_45;
          }
          v59 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR"), &stru_1E3163D10, CFSTR("MediaPlayer"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v38;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
          v47 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 0, v47);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(void *, id, void *))v10)[2](v10, 0, v45);
          v15 = 0;
        }

LABEL_45:
        goto LABEL_46;
      }
      v31 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_193B9B000, v31, OS_LOG_TYPE_ERROR, "Create playlist failed, not authorized", (uint8_t *)&buf, 2u);
      }

      if (v10)
      {
        v61 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("PERMISSION_DENIED"), &stru_1E3163D10, CFSTR("MediaPlayer"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 1, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(void *, id, void *))v10)[2](v10, 0, v35);

      }
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_ERROR, "Could not find playlist for %{public}@ and no creation metadata was provided", (uint8_t *)&buf, 0xCu);
      }

      if (v10)
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v63 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("NOT_FOUND"), &stru_1E3163D10, CFSTR("MediaPlayer"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 4, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(void *, id, void *))v10)[2](v10, 0, v30);
      }
    }
    v15 = 0;
LABEL_46:

    goto LABEL_47;
  }
  v16 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MPMediaLibrary getPlaylistWithUUID:creationMetadata:completionHandler:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Could not determine UUID string", (uint8_t *)&buf, 0xCu);

  }
  if (v10)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v65 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("NOT_FOUND"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 4, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(void *, id, void *))v10)[2](v10, 0, v12);
LABEL_47:

  }
}

- (void)addPlaylistStoreItemsWithMetadata:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(void);
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MPMediaLibraryDataProviderPrivate *libraryDataProvider;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  MPMediaLibrary *val;
  void (**v33)(void);
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  void (**v41)(void);
  id v42;
  id location;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void))a4;
  v34 = v6;
  if (objc_msgSend(v6, "count"))
  {
    v33 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      val = self;
      v8 = objc_msgSend(v6, "count");
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v45;
        v36 = *MEMORY[0x1E0C99778];
        v13 = *MEMORY[0x1E0CB2D50];
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v45 != v12)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v15, "storeID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = objc_msgSend(v9, "indexOfObject:", v16);
              if (v17 == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v15, "effectiveStorePlatformDictionary");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC090]), "initWithMetadataDictionary:", v18);
                if (v19)
                {
                  objc_msgSend(v9, "addObject:", v16);
                  objc_msgSend(v35, "addObject:", v19);
                  v20 = objc_msgSend(v9, "count");

                  v17 = v20 - 1;
                }
                else
                {
                  v24 = (void *)MEMORY[0x1E0CB35C8];
                  v50 = v13;
                  v51 = CFSTR("One or more store item metadata instances failed to be converted into SSLookupItems.");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "errorWithDomain:code:userInfo:", v36, -1, v25);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v23)
                  {

LABEL_28:
                    if (v33)
                      v33[2]();
                    goto LABEL_30;
                  }
                  v17 = 0x7FFFFFFFFFFFFFFFLL;
                }
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v26);

            }
            else
            {
              v21 = (void *)MEMORY[0x1E0CB35C8];
              v52 = v13;
              v53 = CFSTR("One or more store item metadata instances didn't have a valid storeID.");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "errorWithDomain:code:userInfo:", v36, -1, v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
                goto LABEL_28;
            }
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
          if (v11)
            continue;
          break;
        }
      }

      objc_initWeak(&location, val);
      libraryDataProvider = val->_libraryDataProvider;
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __63__MPMediaLibrary_addPlaylistStoreItemsWithMetadata_completion___block_invoke;
      v38[3] = &unk_1E3156320;
      v41 = v33;
      objc_copyWeak(&v42, &location);
      v39 = v37;
      v40 = v35;
      -[MPMediaLibraryDataProviderPrivate addPlaylistStoreItemsForLookupItems:withCompletion:](libraryDataProvider, "addPlaylistStoreItemsForLookupItems:withCompletion:", v40, v38);

      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
      v23 = 0;
LABEL_30:

      goto LABEL_31;
    }
    if (v7)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0CB2D50];
      v49 = CFSTR("unimplemented");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("MPMediaLibraryErrorDomain"), -1, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (*)(void (**)(void), _QWORD, void *))v33[2])(v33, 0, v31);
LABEL_31:
      v7 = v33;
    }
  }
  else if (v7)
  {
    if (v6)
      v28 = MEMORY[0x1E0C9AA60];
    else
      v28 = 0;
    ((void (*)(void (**)(void), uint64_t, _QWORD))v7[2])(v7, v28, 0);
  }

}

- (void)addTracksToMyLibrary:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPMediaLibraryDataProviderPrivate addTracksToMyLibrary:](self->_libraryDataProvider, "addTracksToMyLibrary:", v4);

}

- (void)importArtworkTokenForEntityPersistentID:(unint64_t)a3 entityType:(int64_t)a4 artworkToken:(id)a5 artworkType:(int64_t)a6 sourceType:(int64_t)a7
{
  id v12;

  v12 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPMediaLibraryDataProviderPrivate importArtworkTokenForEntityPersistentID:entityType:artworkToken:artworkType:sourceType:](self->_libraryDataProvider, "importArtworkTokenForEntityPersistentID:entityType:artworkToken:artworkType:sourceType:", a3, a4, v12, a6, a7);

}

- (BOOL)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unint64_t)a7
{
  id v12;
  id v13;
  char v14;

  v12 = a3;
  v13 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = -[MPMediaLibraryDataProviderPrivate importOriginalArtworkFromImageData:withArtworkToken:artworkType:sourceType:mediaType:](self->_libraryDataProvider, "importOriginalArtworkFromImageData:withArtworkToken:artworkType:sourceType:mediaType:", v12, v13, a5, a6, a7);
  else
    v14 = 0;

  return v14;
}

- (void)removeArtworkForEntityPersistentID:(unint64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPMediaLibraryDataProviderPrivate removeArtworkForEntityPersistentID:entityType:artworkType:sourceType:](self->_libraryDataProvider, "removeArtworkForEntityPersistentID:entityType:artworkType:sourceType:", a3, a4, a5, a6);
}

- (void)addGlobalPlaylistWithID:(id)a3 andAddToCloudLibrary:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  MPMediaLibraryDataProviderPrivate *libraryDataProvider;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  uint64_t v18;
  _QWORD v19[2];

  v6 = a4;
  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    libraryDataProvider = self->_libraryDataProvider;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__MPMediaLibrary_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke;
    v14[3] = &unk_1E31617A8;
    objc_copyWeak(&v16, &location);
    v15 = v9;
    -[MPMediaLibraryDataProviderPrivate addGlobalPlaylistWithID:andAddToCloudLibrary:completion:](libraryDataProvider, "addGlobalPlaylistWithID:andAddToCloudLibrary:completion:", v8, v6, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("unimplemented");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("MPMediaLibraryErrorDomain"), -1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v9 + 2))(v9, v13);
  }

}

- (void)addToLocalDeviceLibraryGlobalPlaylistWithID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MPMediaLibraryDataProviderPrivate *libraryDataProvider;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    libraryDataProvider = self->_libraryDataProvider;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__MPMediaLibrary_addToLocalDeviceLibraryGlobalPlaylistWithID_completion___block_invoke;
    v12[3] = &unk_1E3156348;
    objc_copyWeak(&v14, &location);
    v13 = v7;
    -[MPMediaLibraryDataProviderPrivate addToLocalDeviceLibraryGlobalPlaylistWithID:completion:](libraryDataProvider, "addToLocalDeviceLibraryGlobalPlaylistWithID:completion:", v6, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("unimplemented");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("MPMediaLibraryErrorDomain"), -1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
  }

}

- (void)addNonLibraryOwnedPlaylistWithGlobalID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  MPMediaLibraryDataProviderPrivate *libraryDataProvider;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __68__MPMediaLibrary_addNonLibraryOwnedPlaylistWithGlobalID_completion___block_invoke;
    v18 = &unk_1E3156370;
    objc_copyWeak(&v21, &location);
    v20 = v7;
    v8 = v6;
    v19 = v8;
    v9 = (void *)MEMORY[0x19403A810](&v15);
    libraryDataProvider = self->_libraryDataProvider;
    v25[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1, v15, v16, v17, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryDataProviderPrivate addNonLibraryOwnedPlaylistsWithGlobalIDs:completion:](libraryDataProvider, "addNonLibraryOwnedPlaylistsWithGlobalIDs:completion:", v11, v9);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("unimplemented");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("MPMediaLibraryErrorDomain"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);
  }

}

- (void)addNonLibraryOwnedPlaylistsWithGlobalIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__MPMediaLibrary_addNonLibraryOwnedPlaylistsWithGlobalIDs_completion___block_invoke;
    v13[3] = &unk_1E3156370;
    objc_copyWeak(&v16, &location);
    v8 = v6;
    v14 = v8;
    v15 = v7;
    v9 = (void *)MEMORY[0x19403A810](v13);
    -[MPMediaLibraryDataProviderPrivate addNonLibraryOwnedPlaylistsWithGlobalIDs:completion:](self->_libraryDataProvider, "addNonLibraryOwnedPlaylistsWithGlobalIDs:completion:", v8, v9);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = CFSTR("unimplemented");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("MPMediaLibraryErrorDomain"), -1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);
  }

}

- (os_unfair_lock_s)_MLCoreStorageLock
{
  return self->__MLCoreStorageLock;
}

- (_MPActiveUserChangeMonitor)activeUserChangeMonitor
{
  return self->_activeUserChangeMonitor;
}

- (void)setActiveUserChangeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_activeUserChangeMonitor, a3);
}

void __70__MPMediaLibrary_addNonLibraryOwnedPlaylistsWithGlobalIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
  v9 = v8;
  if (v6)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v10 = *(_QWORD *)(a1 + 32);
    v17 = 138543362;
    v18 = v10;
    v11 = "Imported %{public}@ playlists";
    v12 = v9;
    v13 = OS_LOG_TYPE_DEFAULT;
    v14 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v15 = *(_QWORD *)(a1 + 32);
    v17 = 138543618;
    v18 = v15;
    v19 = 2114;
    v20 = 0;
    v11 = "Failed to import %{public}@ playlists with error: %{public}@";
    v12 = v9;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 22;
  }
  _os_log_impl(&dword_193B9B000, v12, v13, v11, (uint8_t *)&v17, v14);
LABEL_7:

  objc_msgSend(WeakRetained, "_clearCachedEntitiesIncludingResultSets:", 1);
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);

}

void __68__MPMediaLibrary_addNonLibraryOwnedPlaylistWithGlobalID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_clearCachedEntitiesIncludingResultSets:", 1);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    if (v5)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v11, "objectForKey:", *(_QWORD *)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "longLongValue");

      objc_msgSend(WeakRetained, "playlistWithPersistentID:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
    }
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);

  }
}

void __73__MPMediaLibrary_addToLocalDeviceLibraryGlobalPlaylistWithID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_clearCachedEntitiesIncludingResultSets:", 1);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

void __74__MPMediaLibrary_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_clearCachedEntitiesIncludingResultSets:", 1);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

void __63__MPMediaLibrary_addPlaylistStoreItemsWithMetadata_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  const __CFString *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      v10 = WeakRetained;
      if (WeakRetained)
      {
        v11 = WeakRetained;
      }
      else
      {
        +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v13 = v5;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v38;
LABEL_9:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v12, "itemWithPersistentID:verifyExistence:", objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v17), "unsignedLongLongValue"), 0);
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
            break;
          v19 = (void *)v18;
          objc_msgSend(v8, "addObject:", v18);

          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
            if (v15)
              goto LABEL_9;
            goto LABEL_15;
          }
        }

        v20 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0C99778];
        v42 = *MEMORY[0x1E0CB2D50];
        v43 = CFSTR("One or more persistentID failed to be converted into MPMediaItem.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, -1, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = 0;
        v24 = 0;
        if (v23)
          goto LABEL_29;
      }
      else
      {
LABEL_15:

      }
      v25 = objc_msgSend(*(id *)(a1 + 32), "count");
      if (v25 <= objc_msgSend(*(id *)(a1 + 40), "count"))
      {
        v23 = 0;
        v24 = v8;
      }
      else
      {
        v32 = v5;
        v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v26 = *(id *)(a1 + 32);
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v34 != v29)
                objc_enumerationMutation(v26);
              objc_msgSend(v8, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "unsignedIntegerValue"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
                objc_msgSend(v24, "addObject:", v31);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v28);
        }

        v23 = 0;
        v5 = v32;
      }
LABEL_29:
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }

}

void __73__MPMediaLibrary_getPlaylistWithUUID_creationMetadata_completionHandler___block_invoke(uint64_t a1, __int16 a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 0x100) != 0)
  {
    v16[0] = CFSTR("name");
    v16[1] = CFSTR("dateCreated");
    v16[2] = CFSTR("descriptionInfo");
    v16[3] = CFSTR("externalVendorDisplayName");
    v16[4] = CFSTR("externalVendorContainerTag");
    v16[5] = CFSTR("externalVendorIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valuesForProperties:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "userIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 64);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__MPMediaLibrary_getPlaylistWithUUID_creationMetadata_completionHandler___block_invoke_2;
    v14[3] = &unk_1E315B1C0;
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v11, "sdk_createPlaylistWithPersistenID:properties:tracklist:completionHandler:", v12, v9, 0, v14);

  }
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v13 + 16))(v13, *(_QWORD *)(a1 + 32), 0);

}

void __73__MPMediaLibrary_getPlaylistWithUUID_creationMetadata_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v6;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "Cloud createPlaylist for %{public}@ failed: %{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
}

void __70__MPMediaLibrary_performStoreAlbumArtistLibraryImport_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_clearCachedEntitiesIncludingResultSets:", 1);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

void __63__MPMediaLibrary_performStoreItemLibraryImport_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_clearCachedEntitiesIncludingResultSets:", 1);
  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(WeakRetained, "itemWithPersistentID:verifyExistence:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "unsignedLongLongValue", (_QWORD)v15), 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __37__MPMediaLibrary__setupNotifications__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_canShowCloudTracksDidChangeNotification:", v3);

}

void __37__MPMediaLibrary__setupNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_displayValuesDidChangeNotification:", v3);

}

void __37__MPMediaLibrary__setupNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didReceiveMemoryWarning:", v3);

}

void __37__MPMediaLibrary__setupNotifications__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadLibraryForRestrictionsChange");

}

void __37__MPMediaLibrary__setupNotifications__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadLibraryForRestrictionsChange");

}

void __37__MPMediaLibrary__setupNotifications__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  id v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_retainAutorelease(WeakRetained);
    os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(v2, "_MLCoreStorageLockPointer"));
    objc_msgSend(v2, "_setMLCoreStorage:", 0);
    os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(objc_retainAutorelease(v2), "_MLCoreStorageLockPointer"));
    WeakRetained = v3;
  }

}

uint64_t __45__MPMediaLibrary__removeConnectionAssertion___block_invoke_309()
{
  return +[MPMediaLibrary _endDiscoveringMediaLibrariesIfAllowed](MPMediaLibrary, "_endDiscoveringMediaLibrariesIfAllowed");
}

uint64_t __44__MPMediaLibrary__clearPendingDisconnection__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 176) = 0;
  return result;
}

void __67__MPMediaLibrary__collectionPersistentIdentifiersForQueryCriteria___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 == 0;

  objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 16), "collectionResultSetForQueryCriteria:", a1[5]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[7] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    if (v9)
      objc_msgSend(*(id *)(a1[4] + 104), "setObject:forKey:", v9, a1[5]);
  }
}

void __67__MPMediaLibrary__collectionPersistentIdentifiersForQueryCriteria___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __61__MPMediaLibrary__itemPersistentIdentifiersForQueryCriteria___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 == 0;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKey:", a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[7] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 16), "itemResultSetForQueryCriteria:", a1[5]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[7] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    if (v9)
      objc_msgSend(*(id *)(a1[4] + 72), "setObject:forKey:", v9, a1[5]);
  }
}

void __61__MPMediaLibrary__itemPersistentIdentifiersForQueryCriteria___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
}

uint64_t __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
}

uint64_t __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "MPIsEmpty") ^ 1);
}

uint64_t __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "MPIsEmpty") ^ 1);
}

uint64_t __64__MPMediaLibrary_connectWithAuthenticationData_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  return result;
}

intptr_t __130__MPMediaLibrary__addPlaylistWithName_activeGeniusPlaylist_externalVendorIdentifier_properties_trackList_playlistEntryProperties___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __34__MPMediaLibrary_hasVideoPodcasts__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[MPMediaQuery videoPodcastsQuery](MPMediaQuery, "videoPodcastsQuery");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_hasCollections");

  return v1;
}

uint64_t __31__MPMediaLibrary_hasHomeVideos__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[MPMediaQuery homeVideosQuery](MPMediaQuery, "homeVideosQuery");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_hasCollections");

  return v1;
}

uint64_t __28__MPMediaLibrary_hasTVShows__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[MPMediaQuery tvShowsQuery](MPMediaQuery, "tvShowsQuery");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_hasCollections");

  return v1;
}

uint64_t __33__MPMediaLibrary_hasMovieRentals__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[MPMediaQuery movieRentalsQuery](MPMediaQuery, "movieRentalsQuery");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_hasItems");

  return v1;
}

uint64_t __40__MPMediaLibrary_hasVideoITunesUContent__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[MPMediaQuery videoITunesUQuery](MPMediaQuery, "videoITunesUQuery");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_hasCollections");

  return v1;
}

uint64_t __40__MPMediaLibrary_hasAudioITunesUContent__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[MPMediaQuery ITunesUAudioQuery](MPMediaQuery, "ITunesUAudioQuery");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_hasCollections");

  return v1;
}

uint64_t __35__MPMediaLibrary_hasITunesUContent__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[MPMediaQuery ITunesUQuery](MPMediaQuery, "ITunesUQuery");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_hasCollections");

  return v1;
}

uint64_t __33__MPMediaLibrary_hasCompilations__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[MPMediaQuery compilationsQuery](MPMediaQuery, "compilationsQuery");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_hasCollections");

  return v1;
}

uint64_t __27__MPMediaLibrary_hasMovies__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[MPMediaQuery moviesQuery](MPMediaQuery, "moviesQuery");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_hasItems");

  return v1;
}

uint64_t __38__MPMediaLibrary_hasAudibleAudioBooks__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[MPMediaQuery audibleAudiobooksQuery](MPMediaQuery, "audibleAudiobooksQuery");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_hasCollections");

  return v1;
}

uint64_t __32__MPMediaLibrary_hasMusicVideos__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[MPMediaQuery musicVideosQuery](MPMediaQuery, "musicVideosQuery");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_hasItems");

  return v1;
}

uint64_t __27__MPMediaLibrary_hasVideos__block_invoke()
{
  void *v0;
  uint64_t v1;

  +[MPMediaQuery videosQuery](MPMediaQuery, "videosQuery");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_hasItems");

  return v1;
}

void __47__MPMediaLibrary_removeLibraryFilterPredicate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "removeObject:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "count"))
    {
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(v2 + 144);
      *(_QWORD *)(v2 + 144) = 0;

    }
  }
}

uint64_t __47__MPMediaLibrary_removeLibraryFilterPredicate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadLibraryForRestrictionsChange");
}

uint64_t __33__MPMediaLibrary_isDeviceLibrary__block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__MPMediaLibrary_isDeviceLibrary__block_invoke_2;
  v2[3] = &unk_1E3155FE0;
  v3 = *(_OWORD *)(a1 + 32);
  return objc_msgSend((id)__userMediaLibraries, "enumerateKeysAndObjectsUsingBlock:", v2);
}

uint64_t __33__MPMediaLibrary_isDeviceLibrary__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void __57__MPMediaLibrary_addItemWithProductID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (!v7)
      goto LABEL_17;
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DDBD38]))
    {
      v9 = objc_msgSend(v6, "code");

      if (v9 == -7602)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v23[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CAPABILITY_MISSING"), &stru_1E3163D10, CFSTR("MediaPlayer"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = *MEMORY[0x1E0CB3388];
        v24[0] = v12;
        v24[1] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v10;
        v15 = 2;
        goto LABEL_12;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("MPErrorDomain"));

    if ((v17 & 1) != 0)
    {
      v18 = 0;
LABEL_13:
      if (v18)
        v20 = v18;
      else
        v20 = v6;
      (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v20);

      goto LABEL_17;
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v21[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = *MEMORY[0x1E0CB3388];
    v22[0] = v12;
    v22[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    v15 = 0;
LABEL_12:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), v15, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  if (v7)
    (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v5, 0);
LABEL_17:

}

uint64_t __28__MPMediaLibrary_disconnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disconnect");
}

void __47__MPMediaLibrary_connectWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  float v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;

  v10 = a3;
  v5 = -1.0;
  if (a2)
    v5 = 1.0;
  *(float *)(*(_QWORD *)(a1 + 32) + 180) = v5;
  +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryStatusDidChangeNotification"), *(_QWORD *)(a1 + 32));
  v6 = v10;
  if (!v10 && (a2 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Unable to connect"), *MEMORY[0x1E0CB2D50]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("MPMediaLibraryErrorDomain"), 0, v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    v12 = v6;
    (*(void (**)(void))(v9 + 16))();
    v6 = v12;
  }

}

void __47__MPMediaLibrary_connectWithCompletionHandler___block_invoke_2(uint64_t a1, float a2)
{
  _QWORD v2[5];
  float v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__MPMediaLibrary_connectWithCompletionHandler___block_invoke_3;
  v2[3] = &unk_1E31632A0;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __47__MPMediaLibrary_connectWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  float v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(float *)(v1 + 180);
  if (v2 < *(float *)(a1 + 40))
    v2 = *(float *)(a1 + 40);
  *(float *)(v1 + 180) = v2;
  return +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryConnectionProgressDidChange"), *(_QWORD *)(a1 + 32));
}

uint64_t __45__MPMediaLibrary__reloadLibraryForPathChange__block_invoke(uint64_t a1)
{
  +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryPathDidChangeNotification"), *(_QWORD *)(a1 + 32));
  return +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

uint64_t __79__MPMediaLibrary__reloadLibraryForInvisiblePropertyChangeWithNotificationInfo___block_invoke(uint64_t a1)
{
  return +[MPMediaLibrary _postNotificationName:library:userInfo:](MPMediaLibrary, "_postNotificationName:library:userInfo:", CFSTR("MPMediaLibraryInvisiblePropertiesDidChangeNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __77__MPMediaLibrary__reloadLibraryForDynamicPropertyChangeWithNotificationInfo___block_invoke(uint64_t a1)
{
  return +[MPMediaLibrary _postNotificationName:library:userInfo:](MPMediaLibrary, "_postNotificationName:library:userInfo:", CFSTR("MPMediaLibraryDynamicPropertiesDidChangeNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __70__MPMediaLibrary__reloadLibraryForContentsChangeWithNotificationInfo___block_invoke(uint64_t a1)
{
  return +[MPMediaLibrary _postNotificationName:library:userInfo:](MPMediaLibrary, "_postNotificationName:library:userInfo:", CFSTR("MPMediaLibraryDidChangeNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __43__MPMediaLibrary__clearCountCriteriaCaches__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAllObjects");
}

void __54__MPMediaLibrary_initWithClientIdentity_userIdentity___block_invoke_117(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  NSObject *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2 == 3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__MPMediaLibrary_initWithClientIdentity_userIdentity___block_invoke_2;
    v6[3] = &unk_1E3163508;
    v7 = v3;
    -[NSObject _scheduleLibraryChangeNotificationPostingBlock:](v7, "_scheduleLibraryChangeNotificationPostingBlock:", v6);
    v4 = v7;
  }
  else
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MPMediaLibrary initWithClientIdentity:userIdentity:]_block_invoke");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "%{public}@: app not authorized for access", buf, 0xCu);

    }
  }

}

uint64_t __54__MPMediaLibrary_initWithClientIdentity_userIdentity___block_invoke_2(uint64_t a1)
{
  return +[MPMediaLibrary _postNotificationName:library:userInfo:](MPMediaLibrary, "_postNotificationName:library:userInfo:", CFSTR("MPMediaLibraryDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
}

+ (void)setDefaultMediaLibrary:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;

  v8 = a3;
  +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "isEqual:", v3);

  if (v4)
  {

    v5 = 0;
  }
  else
  {
    v5 = v8;
  }
  if ((void *)__defaultMediaLibraryOverride != v5)
  {
    v9 = v5;
    objc_msgSend((id)__defaultMediaLibraryOverride, "_clearCachedEntitiesIncludingResultSets:", 1);
    objc_msgSend((id)__defaultMediaLibraryOverride, "_clearCountCriteriaCaches");
    objc_msgSend((id)__defaultMediaLibraryOverride, "endGeneratingLibraryChangeNotifications");
    objc_msgSend((id)__defaultMediaLibraryOverride, "disconnect");
    v6 = __defaultMediaLibraryQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__MPMediaLibrary_setDefaultMediaLibrary___block_invoke;
    block[3] = &unk_1E3163508;
    v7 = v9;
    v11 = v7;
    dispatch_sync(v6, block);
    objc_msgSend((id)__defaultMediaLibraryOverride, "beginGeneratingLibraryChangeNotifications");
    objc_msgSend((id)__defaultMediaLibraryOverride, "_clearPendingDisconnection");
    +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryDefaultMediaLibraryDidChangeNotification"), 0);
    objc_msgSend(v7, "_reloadLibraryForContentsChangeWithNotificationInfo:", 0);

    v5 = v9;
  }

}

+ (id)_deviceMediaLibraryWithUserIdentity:(id)a3 createIfRequired:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  __CFString *v11;
  NSObject *v12;
  __CFString *v13;
  id v14;
  uint64_t *v15;
  void *v16;
  id v17;
  void *v19;
  _QWORD block[4];
  __CFString *v21;
  id v22;
  uint64_t *v23;
  id v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsMultipleITunesAccounts");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPMediaLibrary.m"), 326, CFSTR("Attempting to access a method only available for tv and audio accessory device"));

  }
  objc_msgSend(v7, "accountDSID");
  v10 = objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v11 = CFSTR("NoDSID");
  if (v10)
    v11 = (__CFString *)v10;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__13969;
  v30 = __Block_byref_object_dispose__13970;
  v31 = 0;
  v12 = __defaultMediaLibraryQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MPMediaLibrary__deviceMediaLibraryWithUserIdentity_createIfRequired___block_invoke;
  block[3] = &unk_1E315D218;
  v25 = v4;
  v13 = v11;
  v21 = v13;
  v24 = a1;
  v14 = v7;
  v22 = v14;
  v23 = &v26;
  dispatch_sync(v12, block);
  v15 = v27;
  if (v4 && v27[5])
  {
    objc_msgSend(a1, "_mediaLibraries");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v27[5]);

    v15 = v27;
  }
  v17 = (id)v15[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

+ (void)_postNotificationName:(id)a3 library:(id)a4
{
  +[MPMediaLibrary _postNotificationName:library:userInfo:](MPMediaLibrary, "_postNotificationName:library:userInfo:", a3, a4, 0);
}

+ (void)endDiscoveringMediaLibraries
{
  void (**v2)(_QWORD);
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__MPMediaLibrary_endDiscoveringMediaLibraries__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  v2 = (void (**)(_QWORD))MEMORY[0x19403A810](v3, a2);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v2[2](v2);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v2);

}

+ (void)requestAuthorization:(void *)completionHandler
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = completionHandler;
  objc_msgSend(a1, "_sharedCloudServiceStatusMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__MPMediaLibrary_requestAuthorization___block_invoke;
  v7[3] = &unk_1E3155FB8;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "requestAuthorizationForScopes:completionHandler:", 2, v7);

}

+ (void)setGlobalPrivacyClientWithAuditToken:(id *)a3
{
  MPMediaLibraryPrivacyContext *v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  os_unfair_lock_lock((os_unfair_lock_t)&__privacyContextLock);
  v4 = [MPMediaLibraryPrivacyContext alloc];
  v5 = *(_OWORD *)&a3->var0[4];
  v10 = *(_OWORD *)a3->var0;
  v11 = v5;
  v6 = -[MPMediaLibraryPrivacyContext initWithAuditToken:](v4, "initWithAuditToken:", &v10);
  v7 = (void *)__privacyContextOverride;
  __privacyContextOverride = v6;

  os_unfair_lock_unlock((os_unfair_lock_t)&__privacyContextLock);
  v8 = *(_OWORD *)&a3->var0[4];
  v10 = *(_OWORD *)a3->var0;
  v11 = v8;
  +[MPMediaLibraryPrivacyContext setDefaultClientWithAuditToken:](MPMediaLibraryPrivacyContext, "setDefaultClientWithAuditToken:", &v10);
  v9 = *(_OWORD *)&a3->var0[4];
  v10 = *(_OWORD *)a3->var0;
  v11 = v9;
  objc_msgSend(MEMORY[0x1E0D51270], "setGlobalPrivacyContextWithAuditToken:", &v10);
}

+ (BOOL)isLibraryServerDisabled
{
  return 1;
}

+ (void)_endDiscoveringMediaLibrariesIfAllowed
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[6];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!__numberOfHomeSharingObservers)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    objc_msgSend(a1, "mediaLibraries");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v11;
      v5 = MEMORY[0x1E0C809B0];
LABEL_4:
      v6 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if ((objc_msgSend(v7, "isDeviceLibrary") & 1) == 0)
        {
          v8 = v7[21];
          v9[0] = v5;
          v9[1] = 3221225472;
          v9[2] = __56__MPMediaLibrary__endDiscoveringMediaLibrariesIfAllowed__block_invoke;
          v9[3] = &unk_1E3163580;
          v9[4] = v7;
          v9[5] = &v14;
          dispatch_sync(v8, v9);
          if (!*((_BYTE *)v15 + 24))
            break;
        }
        if (v3 == ++v6)
        {
          v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
          if (v3)
            goto LABEL_4;
          break;
        }
      }
    }

    if (*((_BYTE *)v15 + 24))
      +[MPHomeSharingML3DataProvider endScanningForLibraries](MPHomeSharingML3DataProvider, "endScanningForLibraries");

    _Block_object_dispose(&v14, 8);
  }
}

+ (MPMediaLibrary)mediaLibraryWithUniqueIdentifier:(id)a3 allowsLoadingFromDisk:(BOOL)a4
{
  if (a4)
    objc_msgSend(a1, "_mediaLibraryWithUniqueIdentifier:userDSID:", a3, 0);
  else
    objc_msgSend(a1, "mediaLibraryWithUniqueIdentifier:", a3);
  return (MPMediaLibrary *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)_libraryForDataProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_mediaLibraries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "libraryDataProvider", (_QWORD)v14);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (id)_libraryDataProviders
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_libraryDataProviders___libraryDataProviders;
  if (!_libraryDataProviders___libraryDataProviders)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = (void *)_libraryDataProviders___libraryDataProviders;
    _libraryDataProviders___libraryDataProviders = (uint64_t)v3;

    v2 = (void *)_libraryDataProviders___libraryDataProviders;
  }
  return v2;
}

+ (id)libraryDataProviders
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_libraryDataProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (void)addLibraryDataProvider:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "Adding data provider %@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(a1, "_libraryDataProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  v8 = -[MPMediaLibrary _initWithLibraryDataProvider:]([MPMediaLibrary alloc], "_initWithLibraryDataProvider:", v4);
  objc_msgSend(v8, "beginGeneratingLibraryChangeNotifications");
  objc_msgSend(a1, "_mediaLibraries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("_MPMediaLibraryAvailableMediaLibrariesDidChangePrivateNotification"), 0);
  +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryAvailableMediaLibrariesDidChangeNotification"), 0);

}

+ (void)removeLibraryDataProvider:(id)a3 removalReason:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v8;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Removing data provider %@", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend(a1, "_libraryForDataProvider:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setRemovalReason:", a4);
    objc_msgSend(v10, "endGeneratingLibraryChangeNotifications");
    objc_msgSend(v10, "_clearCachedEntitiesIncludingResultSets:", 1);
    objc_msgSend(v10, "_clearCountCriteriaCaches");
    objc_msgSend(a1, "_mediaLibraries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v10);

    objc_msgSend(a1, "_libraryDataProviders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v6);

    +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("_MPMediaLibraryAvailableMediaLibrariesDidChangePrivateNotification"), 0);
    +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryAvailableMediaLibrariesDidChangeNotification"), 0);
  }

}

+ (void)reloadLibraryDataProvider:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "Reloading data provider %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(a1, "_libraryForDataProvider:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_reloadLibraryForContentsChangeWithNotificationInfo:", 0);

}

+ (void)postEntitiesAddedOrRemovedNotificationForLibraryDataProvider:(id)a3
{
  id v3;

  objc_msgSend(a1, "_libraryForDataProvider:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryEntitiesAddedOrRemovedNotification"), v3);

}

+ (void)reloadDynamicPropertiesForLibraryDataProvider:(id)a3
{
  id v3;

  objc_msgSend(a1, "_libraryForDataProvider:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_reloadLibraryForDynamicPropertyChangeWithNotificationInfo:", 0);

}

+ (void)reloadInvisiblePropertiesForLibraryDataProvider:(id)a3
{
  id v3;

  objc_msgSend(a1, "_libraryForDataProvider:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_reloadLibraryForInvisiblePropertyChangeWithNotificationInfo:", 0);

}

+ (void)reloadDisplayValuesForLibraryDataProvider:(id)a3
{
  id v3;

  objc_msgSend(a1, "_libraryForDataProvider:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryDisplayValuesWillChangeNotification"), v3);
  +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryDisplayValuesDidChangeNotification"), v3);

}

+ (void)syncGenerationDidChangeForLibraryDataProvider:(id)a3
{
  id v3;

  objc_msgSend(a1, "_libraryForDataProvider:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibrarySyncGenerationDidChangeNotification"), v3);

}

+ (void)uniqueIdentifierDidChangeForLibraryDataProvider:(id)a3
{
  id v3;

  objc_msgSend(a1, "_libraryForDataProvider:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("_MPMediaLibraryAvailableMediaLibrariesDidChangePrivateNotification"), v3);
  +[MPMediaLibrary _postNotificationName:library:](MPMediaLibrary, "_postNotificationName:library:", CFSTR("MPMediaLibraryAvailableMediaLibrariesDidChangeNotification"), v3);

}

+ (void)libraryPathDidChangeForDataProvider:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "Reloading data provider for significant change %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(a1, "_libraryForDataProvider:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeUserChangeMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "activeUserChangeMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ingestNotificationName:", CFSTR("MPMediaLibraryPathDidChangeNotification"));

    objc_msgSend(v7, "activeUserChangeMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ingestNotificationName:", CFSTR("MPMediaLibraryDidChangeNotification"));

  }
  else
  {
    objc_msgSend(v7, "_reloadLibraryForPathChange");
  }

}

uint64_t __38__MPMediaLibrary_sharedMediaLibraries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int isKindOfClass;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "libraryDataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v5, "libraryDataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if (((isKindOfClass ^ v9) & 1) != 0)
  {
    if ((isKindOfClass & 1) != 0)
      v10 = -1;
    else
      v10 = 1;
  }
  else
  {
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "localizedCaseInsensitiveCompare:", v12);

  }
  return v10;
}

void __56__MPMediaLibrary__endDiscoveringMediaLibrariesIfAllowed__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

uint64_t __39__MPMediaLibrary_requestAuthorization___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (*(_QWORD *)(result + 32))
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 40), "_mediaLibraryAuthorizationStatusFromCloudServiceAuthorizationStatus:", a2);
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

uint64_t __46__MPMediaLibrary_endDiscoveringMediaLibraries__block_invoke(uint64_t a1)
{
  if (__numberOfHomeSharingObservers >= 1)
    --__numberOfHomeSharingObservers;
  return objc_msgSend(*(id *)(a1 + 32), "_endDiscoveringMediaLibrariesIfAllowed");
}

uint64_t __48__MPMediaLibrary_beginDiscoveringMediaLibraries__block_invoke()
{
  uint64_t result;

  if (!__numberOfHomeSharingObservers++)
    return +[MPHomeSharingML3DataProvider beginScanningForLibraries](MPHomeSharingML3DataProvider, "beginScanningForLibraries");
  return result;
}

void __57__MPMediaLibrary__postNotificationName_library_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Related library posting notification [%@]", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 40));

}

void __71__MPMediaLibrary__deviceMediaLibraryWithUserIdentity_createIfRequired___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend((id)__userMediaLibraries, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      v3 = (void *)MEMORY[0x19403A624]();
      v4 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 56);
        v6 = *(_QWORD *)(a1 + 40);
        v11 = 138543618;
        v12 = v5;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - No pre-existing library for user identity: %@", (uint8_t *)&v11, 0x16u);
      }

      v7 = -[MPMediaLibrary _initWithUserIdentity:]([MPMediaLibrary alloc], "_initWithUserIdentity:", *(_QWORD *)(a1 + 40));
      objc_msgSend((id)__userMediaLibraries, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 32));

      objc_autoreleasePoolPop(v3);
    }
  }
  objc_msgSend((id)__userMediaLibraries, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __41__MPMediaLibrary_setDefaultMediaLibrary___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)&__defaultMediaLibraryOverride, *(id *)(a1 + 32));
}

void __135__MPMediaLibrary_MPMediaLibrarySyncAnchorSupport__enumerateEntityChangesAfterSyncAnchor_maximumRevisionType_inUsersLibrary_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  _MPMediaLibraryEntityChange *v10;
  id v11;

  v11 = a3;
  v7 = (void *)MEMORY[0x19403A624]();
  v8 = *(_QWORD *)(a1 + 32);
  if (a4)
    +[MPConcreteMediaItem createUncachedConcreteMediaItemWithPersistentID:library:](MPConcreteMediaItem, "createUncachedConcreteMediaItemWithPersistentID:library:", a2, v8);
  else
    +[MPConcreteMediaItem concreteMediaItemWithPersistentID:library:](MPConcreteMediaItem, "concreteMediaItemWithPersistentID:library:", a2, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_MPMediaLibraryEntityChange initWithEntity:anchor:deletionType:]([_MPMediaLibraryEntityChange alloc], "initWithEntity:anchor:deletionType:", v9, v11, a4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v7);
}

void __135__MPMediaLibrary_MPMediaLibrarySyncAnchorSupport__enumerateEntityChangesAfterSyncAnchor_maximumRevisionType_inUsersLibrary_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  void *v9;
  MPConcreteMediaItemCollection *v10;
  void *v11;
  void *v12;
  void *v13;
  MPMediaQueryCriteria *v14;
  MPMediaQuery *v15;
  MPConcreteMediaItemCollection *v16;
  _MPMediaLibraryEntityChange *v17;
  id v18;

  v18 = a4;
  v9 = (void *)MEMORY[0x19403A624]();
  if (a3 == 6)
  {
    v10 = (MPConcreteMediaItemCollection *)objc_msgSend(*(id *)(a1 + 32), "newPlaylistWithPersistentID:", a2);
  }
  else
  {
    +[MPMediaItem persistentIDPropertyForGroupingType:](MPMediaItem, "persistentIDPropertyForGroupingType:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(MPMediaQueryCriteria);
    -[MPMediaQueryCriteria addFilterPredicate:](v14, "addFilterPredicate:", v13);
    v15 = -[MPMediaQuery initWithCriteria:library:]([MPMediaQuery alloc], "initWithCriteria:library:", v14, *(_QWORD *)(a1 + 32));
    if (a5)
    {
      +[MPConcreteMediaItemCollection createUncachedMediaItemCollectionWithIdentifier:valuesForProperties:itemsQuery:grouping:representativeItemIdentifier:](MPConcreteMediaItemCollection, "createUncachedMediaItemCollectionWithIdentifier:valuesForProperties:itemsQuery:grouping:representativeItemIdentifier:", a2, 0, v15, a3, 0);
      v16 = (MPConcreteMediaItemCollection *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = -[MPConcreteMediaItemCollection initWithIdentifier:valuesForProperties:itemsQuery:grouping:representativeItemIdentifier:]([MPConcreteMediaItemCollection alloc], "initWithIdentifier:valuesForProperties:itemsQuery:grouping:representativeItemIdentifier:", a2, 0, v15, a3, 0);
    }
    v10 = v16;

  }
  v17 = -[_MPMediaLibraryEntityChange initWithEntity:anchor:deletionType:]([_MPMediaLibraryEntityChange alloc], "initWithEntity:anchor:deletionType:", v10, v18, a5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_autoreleasePoolPop(v9);
}

- (id)errorResolverForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MPMediaLibrary libraryDataProvider](self, "libraryDataProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorResolverForItem:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSNumber)sagaAccountID
{
  void *v2;
  void *v3;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sagaAccountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setSagaAccountID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSagaAccountID:", v4);

}

- (NSDate)sagaLastItemPlayDataUploadDate
{
  void *v2;
  void *v3;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sagaLastItemPlayDataUploadDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setSagaLastItemPlayDataUploadDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSagaLastItemPlayDataUploadDate:", v4);

}

- (NSDate)sagaLastPlaylistPlayDataUploadDate
{
  void *v2;
  void *v3;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sagaLastPlaylistPlayDataUploadDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setSagaLastPlaylistPlayDataUploadDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSagaLastPlaylistPlayDataUploadDate:", v4);

}

- (int64_t)sagaDatabaseUserVersion
{
  void *v2;
  int64_t v3;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sagaDatabaseUserVersion");

  return v3;
}

- (void)setSagaDatabaseUserVersion:(int64_t)a3
{
  id v4;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSagaDatabaseUserVersion:", a3);

}

- (NSString)storefrontIdentifier
{
  void *v2;
  void *v3;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storefrontIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setStorefrontIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStorefrontIdentifier:", v4);

}

- (void)setSagaOnDiskDatabaseRevision:(int64_t)a3
{
  id v4;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSagaOnDiskDatabaseRevision:", a3);

}

- (NSDate)sagaLastLibraryUpdateTime
{
  void *v2;
  void *v3;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sagaLastLibraryUpdateTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setSagaLastLibraryUpdateTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSagaLastLibraryUpdateTime:", v4);

}

- (NSDate)sagaLastSubscribedContainersUpdateTime
{
  void *v2;
  void *v3;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sagaLastSubscribedContainersUpdateTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setSagaLastSubscribedContainersUpdateTime:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSagaLastSubscribedContainersUpdateTime:", v4);

}

- (void)clearSagaCloudAccountID
{
  id v2;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSagaCloudAccountID");

}

- (void)clearSagaLastItemPlayDataUploadDate
{
  id v2;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSagaLastItemPlayDataUploadDate");

}

- (void)clearSagaLastPlaylistPlayDataUploadDate
{
  id v2;

  -[MPMediaLibrary ml3Library](self, "ml3Library");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSagaLastPlaylistPlayDataUploadDate");

}

@end
