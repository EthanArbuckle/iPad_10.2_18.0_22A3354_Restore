@implementation MPStoreDownloadManager

- (NSArray)userDownloads
{
  NSObject *accessQueue;
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
  v9 = __Block_byref_object_copy__50201;
  v10 = __Block_byref_object_dispose__50202;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__MPStoreDownloadManager_userDownloads__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __52__MPStoreDownloadManager_hasFetchedInitialDownloads__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 104);
  return result;
}

void __39__MPStoreDownloadManager_userDownloads__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MPStoreDownloadManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_50320 != -1)
    dispatch_once(&sharedManager_onceToken_50320, block);
  return (id)sharedManager_sharedManager;
}

void __51__MPStoreDownloadManager_addObserver_forDownloads___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    if (!*(_QWORD *)(v3 + 72))
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 72);
      *(_QWORD *)(v5 + 72) = v4;

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "objectForKey:", v12, (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 1);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "setObject:forKey:", v13, v12);
          }
          if ((objc_msgSend(v13, "containsObject:", *(_QWORD *)(a1 + 48)) & 1) == 0)
            objc_msgSend(v13, "addObject:", *(_QWORD *)(a1 + 48));

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

  }
  else
  {
    v14 = *(void **)(v3 + 88);
    if (!v14)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 1);
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(void **)(v16 + 88);
      *(_QWORD *)(v16 + 88) = v15;

      v14 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
    }
    if ((objc_msgSend(v14, "containsObject:", *(_QWORD *)(a1 + 48)) & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "addObject:", *(_QWORD *)(a1 + 48));
  }
}

- (void)addObserver:(id)a3 forDownloads:(id)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[4];
  id v10;
  MPStoreDownloadManager *v11;
  id v12;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__MPStoreDownloadManager_addObserver_forDownloads___block_invoke;
    block[3] = &unk_1E3163698;
    v10 = v6;
    v11 = self;
    v12 = v8;
    dispatch_barrier_sync(accessQueue, block);

  }
}

void __39__MPStoreDownloadManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = v0;

}

- (id)_init
{
  MPStoreDownloadManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutSerialQueue;
  NSMutableArray *v7;
  NSMutableArray *downloads;
  NSMutableArray *v9;
  NSMutableArray *userDownloads;
  uint64_t v11;
  NSMapTable *storeIdentifiersToDownloads;
  uint64_t v13;
  NSMapTable *libraryIdentifiersToDownloads;
  uint64_t v15;
  NSMapTable *downloadIdentifiersToDownloads;
  void *v17;
  objc_class *v18;
  void *v19;
  id *v20;
  void *v21;
  id v22;
  id *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSDictionary *downloadKindToRequiredClientBundleIdentifiers;
  id *v33;
  void *v34;
  id v35;
  id *v36;
  void *v37;
  id v38;
  id *v39;
  void *v40;
  id v41;
  id *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id *v48;
  void *v49;
  id *v50;
  void *v51;
  id *v52;
  void *v53;
  id *v54;
  void *v55;
  id v56;
  id *v57;
  void *v58;
  id v59;
  void *v60;
  id *v61;
  void *v62;
  id v63;
  id *v64;
  void *v65;
  id v66;
  id *v67;
  void *v68;
  id v69;
  id *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  SSDownloadManager *downloadManager;
  SSDownloadManager *v77;
  id *v78;
  void *v79;
  objc_class *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  objc_class *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  id v89;
  id v90;
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
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  id v130;
  _QWORD v131[4];
  id *v132;
  _QWORD v133[4];
  id *v134;
  objc_super v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD v145[12];
  id v146;
  _QWORD v147[3];
  id v148;
  _QWORD v149[2];
  _QWORD v150[2];
  id v151;
  id v152;
  void *v153;
  void *v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v135.receiver = self;
  v135.super_class = (Class)MPStoreDownloadManager;
  v2 = -[MPStoreDownloadManager init](&v135, sel_init);
  if (!v2)
    return v2;
  v3 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreDownloadManager.accessQueue", MEMORY[0x1E0C80D50]);
  accessQueue = v2->_accessQueue;
  v2->_accessQueue = (OS_dispatch_queue *)v3;

  v5 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreDownloadManager.calloutQueue", 0);
  calloutSerialQueue = v2->_calloutSerialQueue;
  v2->_calloutSerialQueue = (OS_dispatch_queue *)v5;

  v130 = objc_alloc_init(MEMORY[0x1E0CB3870]);
  objc_msgSend(v130, "setAcquireFunction:", _MPStoreDownloadManagerInt64KeyPointerFunctionAcquire);
  objc_msgSend(v130, "setRelinquishFunction:", _MPStoreDownloadManagerInt64KeyPointerFunctionRelinquish);
  objc_msgSend(v130, "setHashFunction:", _MPStoreDownloadManagerInt64KeyPointerFunctionHash);
  objc_msgSend(v130, "setIsEqualFunction:", _MPStoreDownloadManagerInt64KeyPointerFunctionIsEqual);
  objc_msgSend(v130, "setSizeFunction:", _MPStoreDownloadManagerInt64KeyPointerFunctionSize);
  objc_msgSend(v130, "setDescriptionFunction:", _MPStoreDownloadManagerInt64KeyPointerFunctionDescription);
  v128 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3870]), "initWithOptions:", 5);
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  downloads = v2->_downloads;
  v2->_downloads = v7;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  userDownloads = v2->_userDownloads;
  v2->_userDownloads = v9;

  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v130, v128, 0);
  storeIdentifiersToDownloads = v2->_storeIdentifiersToDownloads;
  v2->_storeIdentifiersToDownloads = (NSMapTable *)v11;

  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v130, v128, 0);
  libraryIdentifiersToDownloads = v2->_libraryIdentifiersToDownloads;
  v2->_libraryIdentifiersToDownloads = (NSMapTable *)v13;

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v130, v128, 0);
  downloadIdentifiersToDownloads = v2->_downloadIdentifiersToDownloads;
  v2->_downloadIdentifiersToDownloads = (NSMapTable *)v15;

  v141 = 0;
  v142 = &v141;
  v143 = 0x2050000000;
  v17 = (void *)getSSDownloadManagerOptionsClass_softClass;
  v144 = getSSDownloadManagerOptionsClass_softClass;
  if (!getSSDownloadManagerOptionsClass_softClass)
  {
    v136 = MEMORY[0x1E0C809B0];
    v137 = 3221225472;
    v138 = (uint64_t)__getSSDownloadManagerOptionsClass_block_invoke;
    v139 = &unk_1E31639A0;
    v140 = &v141;
    __getSSDownloadManagerOptionsClass_block_invoke((uint64_t)&v136);
    v17 = (void *)v142[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v141, 8);
  v129 = objc_alloc_init(v18);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bundleIdentifier");
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v127, "isEqualToString:", CFSTR("com.apple.Music")))
  {
    v136 = 0;
    v137 = (uint64_t)&v136;
    v138 = 0x2020000000;
    v20 = (id *)getSSDownloadKindMusicSymbolLoc_ptr_50271;
    v139 = (void *)getSSDownloadKindMusicSymbolLoc_ptr_50271;
    if (!getSSDownloadKindMusicSymbolLoc_ptr_50271)
    {
      v21 = StoreServicesLibrary_50149();
      v20 = (id *)dlsym(v21, "SSDownloadKindMusic");
      *(_QWORD *)(v137 + 24) = v20;
      getSSDownloadKindMusicSymbolLoc_ptr_50271 = (uint64_t)v20;
    }
    _Block_object_dispose(&v136, 8);
    if (v20)
    {
      v22 = *v20;
      v151 = v22;
      v136 = 0;
      v137 = (uint64_t)&v136;
      v138 = 0x2020000000;
      v23 = (id *)getSSDownloadKindMusicVideoSymbolLoc_ptr;
      v139 = (void *)getSSDownloadKindMusicVideoSymbolLoc_ptr;
      if (!getSSDownloadKindMusicVideoSymbolLoc_ptr)
      {
        v24 = StoreServicesLibrary_50149();
        v23 = (id *)dlsym(v24, "SSDownloadKindMusicVideo");
        *(_QWORD *)(v137 + 24) = v23;
        getSSDownloadKindMusicVideoSymbolLoc_ptr = (uint64_t)v23;
      }
      _Block_object_dispose(&v136, 8);
      if (v23)
      {
        v152 = *v23;
        v25 = v152;
        getSSDownloadKindTelevisionEpisode();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = v26;
        getSSDownloadKindMovie();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v151, 4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "setDownloadKinds:", v28);

        getSSDownloadKindMovie();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v149[0] = v29;
        v150[0] = v127;
        getSSDownloadKindTelevisionEpisode();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v149[1] = v30;
        v150[1] = v127;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v150, v149, 2);
        v31 = objc_claimAutoreleasedReturnValue();
        downloadKindToRequiredClientBundleIdentifiers = v2->_downloadKindToRequiredClientBundleIdentifiers;
        v2->_downloadKindToRequiredClientBundleIdentifiers = (NSDictionary *)v31;

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadKindMusicVideo(void)");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "handleFailureInFunction:file:lineNumber:description:", v121, CFSTR("MPStoreDownloadManager.m"), 45, CFSTR("%s"), dlerror());

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadKindMusic(void)");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "handleFailureInFunction:file:lineNumber:description:", v119, CFSTR("MPStoreDownloadManager.m"), 44, CFSTR("%s"), dlerror());

    }
LABEL_71:
    __break(1u);
  }
  objc_msgSend(getSSDownloadManagerClass(), "IPodDownloadKinds");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "setDownloadKinds:", v29);
LABEL_13:

  objc_msgSend(v129, "setPersistenceIdentifier:", CFSTR("com.apple.MediaPlayer.MPStoreDownloadManager"));
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v33 = (id *)getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr;
  v139 = (void *)getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr;
  if (!getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr)
  {
    v34 = StoreServicesLibrary_50149();
    v33 = (id *)dlsym(v34, "SSDownloadExternalPropertyBytesDownloaded");
    *(_QWORD *)(v137 + 24) = v33;
    getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr = (uint64_t)v33;
  }
  _Block_object_dispose(&v136, 8);
  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadExternalPropertyBytesDownloaded(void)");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "handleFailureInFunction:file:lineNumber:description:", v93, CFSTR("MPStoreDownloadManager.m"), 61, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v35 = *v33;
  v147[0] = v35;
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v36 = (id *)getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr;
  v139 = (void *)getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr;
  if (!getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr)
  {
    v37 = StoreServicesLibrary_50149();
    v36 = (id *)dlsym(v37, "SSDownloadExternalPropertyPercentComplete");
    *(_QWORD *)(v137 + 24) = v36;
    getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr = (uint64_t)v36;
  }
  _Block_object_dispose(&v136, 8);
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadExternalPropertyPercentComplete(void)");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "handleFailureInFunction:file:lineNumber:description:", v95, CFSTR("MPStoreDownloadManager.m"), 62, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v38 = *v36;
  v147[1] = v38;
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v39 = (id *)getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr;
  v139 = (void *)getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr;
  if (!getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr)
  {
    v40 = StoreServicesLibrary_50149();
    v39 = (id *)dlsym(v40, "SSDownloadExternalPropertyPolicySizeLimit");
    *(_QWORD *)(v137 + 24) = v39;
    getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr = (uint64_t)v39;
  }
  _Block_object_dispose(&v136, 8);
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadExternalPropertyPolicySizeLimit(void)");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "handleFailureInFunction:file:lineNumber:description:", v97, CFSTR("MPStoreDownloadManager.m"), 63, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v41 = *v39;
  v147[2] = v41;
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v42 = (id *)getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr_50280;
  v139 = (void *)getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr_50280;
  if (!getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr_50280)
  {
    v43 = StoreServicesLibrary_50149();
    v42 = (id *)dlsym(v43, "SSDownloadExternalPropertyRentalInformation");
    *(_QWORD *)(v137 + 24) = v42;
    getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr_50280 = (uint64_t)v42;
  }
  _Block_object_dispose(&v136, 8);
  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadExternalPropertyRentalInformation(void)");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "handleFailureInFunction:file:lineNumber:description:", v99, CFSTR("MPStoreDownloadManager.m"), 64, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v148 = *v42;
  v44 = (void *)MEMORY[0x1E0C99D20];
  v45 = v148;
  objc_msgSend(v44, "arrayWithObjects:count:", v147, 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v129, "setPrefetchedDownloadExternalProperties:", v46);
  getSSDownloadPropertyClientBundleIdentifier();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = v47;
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v48 = (id *)getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr;
  v139 = (void *)getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr;
  if (!getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr)
  {
    v49 = StoreServicesLibrary_50149();
    v48 = (id *)dlsym(v49, "SSDownloadPropertyDownloadPhase");
    *(_QWORD *)(v137 + 24) = v48;
    getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr = (uint64_t)v48;
  }
  _Block_object_dispose(&v136, 8);
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyDownloadPhase(void)");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "handleFailureInFunction:file:lineNumber:description:", v101, CFSTR("MPStoreDownloadManager.m"), 49, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v124 = *v48;
  v145[1] = v124;
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v50 = (id *)getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr;
  v139 = (void *)getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr;
  if (!getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr)
  {
    v51 = StoreServicesLibrary_50149();
    v50 = (id *)dlsym(v51, "SSDownloadPropertyEncodedErrorData");
    *(_QWORD *)(v137 + 24) = v50;
    getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr = (uint64_t)v50;
  }
  _Block_object_dispose(&v136, 8);
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyEncodedErrorData(void)");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "handleFailureInFunction:file:lineNumber:description:", v103, CFSTR("MPStoreDownloadManager.m"), 50, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v123 = *v50;
  v145[2] = v123;
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v52 = (id *)getSSDownloadPropertyIsRestoreSymbolLoc_ptr_50285;
  v139 = (void *)getSSDownloadPropertyIsRestoreSymbolLoc_ptr_50285;
  if (!getSSDownloadPropertyIsRestoreSymbolLoc_ptr_50285)
  {
    v53 = StoreServicesLibrary_50149();
    v52 = (id *)dlsym(v53, "SSDownloadPropertyIsRestore");
    *(_QWORD *)(v137 + 24) = v52;
    getSSDownloadPropertyIsRestoreSymbolLoc_ptr_50285 = (uint64_t)v52;
  }
  _Block_object_dispose(&v136, 8);
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyIsRestore(void)");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "handleFailureInFunction:file:lineNumber:description:", v105, CFSTR("MPStoreDownloadManager.m"), 51, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v122 = *v52;
  v145[3] = v122;
  getSSDownloadPropertyKind();
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v145[4] = v126;
  getSSDownloadPropertyLibraryItemIdentifier_50156();
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v145[5] = v125;
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v54 = (id *)getSSDownloadPropertyPreferredAssetFlavorSymbolLoc_ptr;
  v139 = (void *)getSSDownloadPropertyPreferredAssetFlavorSymbolLoc_ptr;
  if (!getSSDownloadPropertyPreferredAssetFlavorSymbolLoc_ptr)
  {
    v55 = StoreServicesLibrary_50149();
    v54 = (id *)dlsym(v55, "SSDownloadPropertyPreferredAssetFlavor");
    *(_QWORD *)(v137 + 24) = v54;
    getSSDownloadPropertyPreferredAssetFlavorSymbolLoc_ptr = (uint64_t)v54;
  }
  _Block_object_dispose(&v136, 8);
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyPreferredAssetFlavor(void)");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "handleFailureInFunction:file:lineNumber:description:", v107, CFSTR("MPStoreDownloadManager.m"), 54, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v56 = *v54;
  v145[6] = v56;
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v57 = (id *)getSSDownloadPropertyReasonSymbolLoc_ptr_50289;
  v139 = (void *)getSSDownloadPropertyReasonSymbolLoc_ptr_50289;
  if (!getSSDownloadPropertyReasonSymbolLoc_ptr_50289)
  {
    v58 = StoreServicesLibrary_50149();
    v57 = (id *)dlsym(v58, "SSDownloadPropertyReason");
    *(_QWORD *)(v137 + 24) = v57;
    getSSDownloadPropertyReasonSymbolLoc_ptr_50289 = (uint64_t)v57;
  }
  _Block_object_dispose(&v136, 8);
  if (!v57)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyReason(void)");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "handleFailureInFunction:file:lineNumber:description:", v109, CFSTR("MPStoreDownloadManager.m"), 55, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v59 = *v57;
  v145[7] = v59;
  getSSDownloadPropertyStoreItemIdentifier_50197();
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v145[8] = v60;
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v61 = (id *)getSSDownloadPropertyThumbnailImageURLSymbolLoc_ptr;
  v139 = (void *)getSSDownloadPropertyThumbnailImageURLSymbolLoc_ptr;
  if (!getSSDownloadPropertyThumbnailImageURLSymbolLoc_ptr)
  {
    v62 = StoreServicesLibrary_50149();
    v61 = (id *)dlsym(v62, "SSDownloadPropertyThumbnailImageURL");
    *(_QWORD *)(v137 + 24) = v61;
    getSSDownloadPropertyThumbnailImageURLSymbolLoc_ptr = (uint64_t)v61;
  }
  _Block_object_dispose(&v136, 8);
  if (!v61)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyThumbnailImageURL(void)");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "handleFailureInFunction:file:lineNumber:description:", v111, CFSTR("MPStoreDownloadManager.m"), 57, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v63 = *v61;
  v145[9] = v63;
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v64 = (id *)getSSDownloadPropertyTitleSymbolLoc_ptr_50293;
  v139 = (void *)getSSDownloadPropertyTitleSymbolLoc_ptr_50293;
  if (!getSSDownloadPropertyTitleSymbolLoc_ptr_50293)
  {
    v65 = StoreServicesLibrary_50149();
    v64 = (id *)dlsym(v65, "SSDownloadPropertyTitle");
    *(_QWORD *)(v137 + 24) = v64;
    getSSDownloadPropertyTitleSymbolLoc_ptr_50293 = (uint64_t)v64;
  }
  _Block_object_dispose(&v136, 8);
  if (!v64)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyTitle(void)");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "handleFailureInFunction:file:lineNumber:description:", v113, CFSTR("MPStoreDownloadManager.m"), 58, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v66 = *v64;
  v145[10] = v66;
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v67 = (id *)getSSDownloadPropertyHandlerIDSymbolLoc_ptr_50296;
  v139 = (void *)getSSDownloadPropertyHandlerIDSymbolLoc_ptr_50296;
  if (!getSSDownloadPropertyHandlerIDSymbolLoc_ptr_50296)
  {
    v68 = StoreServicesLibrary_50149();
    v67 = (id *)dlsym(v68, "SSDownloadPropertyHandlerID");
    *(_QWORD *)(v137 + 24) = v67;
    getSSDownloadPropertyHandlerIDSymbolLoc_ptr_50296 = (uint64_t)v67;
  }
  _Block_object_dispose(&v136, 8);
  if (!v67)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyHandlerID(void)");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "handleFailureInFunction:file:lineNumber:description:", v115, CFSTR("MPStoreDownloadManager.m"), 59, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v69 = *v67;
  v145[11] = v69;
  v136 = 0;
  v137 = (uint64_t)&v136;
  v138 = 0x2020000000;
  v70 = (id *)getSSDownloadPropertyCollectionNameSymbolLoc_ptr;
  v139 = (void *)getSSDownloadPropertyCollectionNameSymbolLoc_ptr;
  if (!getSSDownloadPropertyCollectionNameSymbolLoc_ptr)
  {
    v71 = StoreServicesLibrary_50149();
    v70 = (id *)dlsym(v71, "SSDownloadPropertyCollectionName");
    *(_QWORD *)(v137 + 24) = v70;
    getSSDownloadPropertyCollectionNameSymbolLoc_ptr = (uint64_t)v70;
  }
  _Block_object_dispose(&v136, 8);
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyCollectionName(void)");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "handleFailureInFunction:file:lineNumber:description:", v117, CFSTR("MPStoreDownloadManager.m"), 60, CFSTR("%s"), dlerror());

    goto LABEL_71;
  }
  v146 = *v70;
  v72 = (void *)MEMORY[0x1E0C99D20];
  v73 = v146;
  objc_msgSend(v72, "arrayWithObjects:count:", v145, 13);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v129, "setPrefetchedDownloadProperties:", v74);
  objc_msgSend(v129, "setShouldFilterExternalOriginatedDownloads:", 0);
  v75 = objc_msgSend(objc_alloc((Class)getSSDownloadManagerClass()), "initWithManagerOptions:", v129);
  downloadManager = v2->_downloadManager;
  v2->_downloadManager = (SSDownloadManager *)v75;

  -[SSDownloadManager addObserver:](v2->_downloadManager, "addObserver:", v2);
  v77 = v2->_downloadManager;
  v133[0] = MEMORY[0x1E0C809B0];
  v133[1] = 3221225472;
  v133[2] = __31__MPStoreDownloadManager__init__block_invoke;
  v133[3] = &unk_1E3163530;
  v78 = v2;
  v134 = v78;
  -[SSDownloadManager getDownloadsUsingBlock:](v77, "getDownloadsUsingBlock:", v133);
  v141 = 0;
  v142 = &v141;
  v143 = 0x2050000000;
  v79 = (void *)getSSPurchaseManagerClass_softClass;
  v144 = getSSPurchaseManagerClass_softClass;
  if (!getSSPurchaseManagerClass_softClass)
  {
    v136 = MEMORY[0x1E0C809B0];
    v137 = 3221225472;
    v138 = (uint64_t)__getSSPurchaseManagerClass_block_invoke;
    v139 = &unk_1E31639A0;
    v140 = &v141;
    __getSSPurchaseManagerClass_block_invoke((uint64_t)&v136);
    v79 = (void *)v142[3];
  }
  v80 = objc_retainAutorelease(v79);
  _Block_object_dispose(&v141, 8);
  v81 = [v80 alloc];
  v82 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "bundleIdentifier");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (objc_class *)objc_opt_class();
  NSStringFromClass(v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "stringWithFormat:", CFSTR("%@.%@"), v84, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v81, "initWithManagerIdentifier:", v87);
  v89 = v78[15];
  v78[15] = (id)v88;

  objc_msgSend(v78[15], "setDelegate:", v78);
  v90 = v78[15];
  v131[0] = MEMORY[0x1E0C809B0];
  v131[1] = 3221225472;
  v131[2] = __31__MPStoreDownloadManager__init__block_invoke_4;
  v131[3] = &unk_1E3163558;
  v132 = v78;
  objc_msgSend(v90, "getPurchasesUsingBlock:", v131);

  return v2;
}

void __31__MPStoreDownloadManager__init__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPStoreDownloadManagerDidFetchInitialDownloadsNotification"), *(_QWORD *)(a1 + 32));

}

void __31__MPStoreDownloadManager__init__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v8 = v5;
    v7 = objc_msgSend(v5, "count");
    v6 = v8;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "_updateDownloadsWithAdditions:removals:", v8, 0);
      v6 = v8;
    }
  }

}

void __31__MPStoreDownloadManager__init__block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  _QWORD block[4];
  _QWORD *v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 1;
  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[3];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__MPStoreDownloadManager__init__block_invoke_3;
  block[3] = &unk_1E3163508;
  v4 = v1;
  dispatch_async(v2, block);

}

- (BOOL)hasFetchedInitialDownloads
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__MPStoreDownloadManager_hasFetchedInitialDownloads__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __31__MPStoreDownloadManager__init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  _QWORD *v16;
  NSObject *v17;
  void *v18;
  _QWORD block[4];
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "_shouldHideDownload:", v10, v18) & 1) == 0)
        {
          objc_msgSend(v10, "downloadPhaseIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          soft_SSDownloadPhaseIsFinishedPhase(v11);
          if ((v12 & 1) != 0
            || (getSSDownloadPhaseFailed(),
                v13 = (void *)objc_claimAutoreleasedReturnValue(),
                v14 = objc_msgSend(v11, "isEqual:", v13),
                v13,
                v14))
          {
            objc_msgSend(v4, "addObject:", v10);
            objc_msgSend(*(id *)(a1 + 32), "_updateMediaItemPropertiesForFinishedStoreDownload:SSDownload:", 0, v10);
          }
          else
          {
            objc_msgSend(v18, "addObject:", v10);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v15 = v18;
  if (objc_msgSend(v18, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_updateDownloadsWithAdditions:removals:", v18, 0);
  if (objc_msgSend(v4, "count", v18))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "finishDownloads:", v4);
  v16 = *(_QWORD **)(a1 + 32);
  v17 = v16[1];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__MPStoreDownloadManager__init__block_invoke_2;
  block[3] = &unk_1E3163508;
  v20 = v16;
  dispatch_barrier_async(v17, block);

}

- (MPStoreDownloadManager)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MPStoreDownloadManagerInitException"), CFSTR("-init is not supported. Use +sharedManager instead."));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[SSDownloadManager removeObserver:](self->_downloadManager, "removeObserver:", self);
  -[SSPurchaseManager setDelegate:](self->_purchaseManager, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MPStoreDownloadManager;
  -[MPStoreDownloadManager dealloc](&v3, sel_dealloc);
}

- (NSArray)activeDownloads
{
  NSObject *accessQueue;
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
  v9 = __Block_byref_object_copy__50201;
  v10 = __Block_byref_object_dispose__50202;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__MPStoreDownloadManager_activeDownloads__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)downloads
{
  NSObject *accessQueue;
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__50201;
  v11 = __Block_byref_object_dispose__50202;
  v12 = 0;
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__MPStoreDownloadManager_downloads__block_invoke;
  v6[3] = &unk_1E3163580;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  if (objc_msgSend((id)v8[5], "count"))
    v3 = (void *)v8[5];
  else
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (BOOL)isUsingNetwork
{
  return -[SSDownloadManager isUsingNetwork](self->_downloadManager, "isUsingNetwork");
}

- (id)activeDownloadForMediaItemPersistentID:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MPStoreDownloadManager activeDownloads](self, "activeDownloads");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "libraryItemIdentifier", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)activeDownloadForStoreID:(int64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MPStoreDownloadManager activeDownloads](self, "activeDownloads");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "storeItemIdentifier", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)addDownloads:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *accessQueue;
  void *v10;
  SSPurchaseManager *purchaseManager;
  NSObject *calloutSerialQueue;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD block[7];
  id location;
  id *p_location;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v35;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v7);
        location = 0;
        p_location = &location;
        v30 = 0x3032000000;
        v31 = __Block_byref_object_copy__50201;
        v32 = __Block_byref_object_dispose__50202;
        v33 = 0;
        accessQueue = self->_accessQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __39__MPStoreDownloadManager_addDownloads___block_invoke;
        block[3] = &unk_1E31635A8;
        block[5] = v8;
        block[6] = &location;
        block[4] = self;
        dispatch_sync(accessQueue, block);
        if (p_location[5])
        {
          objc_msgSend(v20, "addObject:");
        }
        else
        {
          objc_msgSend(v8, "_SSPurchase");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v16, "addObject:", v10);
            objc_msgSend(v18, "addObject:", v8);
            objc_msgSend(v20, "addObject:", v8);
          }

        }
        _Block_object_dispose(&location, 8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v18, "count"))
    -[MPStoreDownloadManager _updateDownloadsWithAdditions:removals:](self, "_updateDownloadsWithAdditions:removals:", v18, 0);
  if (objc_msgSend(v16, "count", v16))
  {
    if (self->_purchaseManager)
    {
      objc_initWeak(&location, self);
      purchaseManager = self->_purchaseManager;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __39__MPStoreDownloadManager_addDownloads___block_invoke_2;
      v24[3] = &unk_1E3163620;
      objc_copyWeak(&v26, &location);
      v25 = v18;
      -[SSPurchaseManager addPurchases:withCompletionBlock:](purchaseManager, "addPurchases:withCompletionBlock:", v17, v24);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_initWeak(&location, self);
      calloutSerialQueue = self->_calloutSerialQueue;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __39__MPStoreDownloadManager_addDownloads___block_invoke_5;
      v21[3] = &unk_1E3163670;
      v21[4] = self;
      v22 = v18;
      objc_copyWeak(&v23, &location);
      dispatch_async(calloutSerialQueue, v21);
      objc_destroyWeak(&v23);

      objc_destroyWeak(&location);
    }
  }
  if (objc_msgSend(v20, "count"))
    v13 = v20;
  else
    v13 = (void *)MEMORY[0x1E0C9AA60];
  v14 = v13;

  return v14;
}

- (void)addFinishHandler:(id)a3 forDownloads:(id)a4
{
  void (**v7)(id, void *);
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  _MPStoreDownloadBlockObserver *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *))a3;
  v8 = a4;
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPStoreDownloadManager.m"), 397, CFSTR("Downloads must not be empty."));

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "isFinished", (_QWORD)v17))
        {
          if (v7)
            v7[2](v7, v14);
        }
        else
        {
          v15 = -[_MPStoreDownloadBlockObserver initWithDownload:]([_MPStoreDownloadBlockObserver alloc], "initWithDownload:", v14);
          -[_MPStoreDownloadBlockObserver setDidFinishDownloadHandler:](v15, "setDidFinishDownloadHandler:", v7);
          -[MPStoreDownloadManager _registerBlockObserver:](self, "_registerBlockObserver:", v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)cancelDownloads:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  MPStoreDownloadManager *v18;
  SSDownloadManager *downloadManager;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  NSObject *calloutSerialQueue;
  id v35;
  MPStoreDownloadManager *v36;
  MPStoreDownloadManager *v37;
  SSPurchaseManager *purchaseManager;
  void *v39;
  _QWORD block[5];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  NSObject *v47;
  id v48;
  MPStoreDownloadManager *v49;
  NSObject *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  NSObject *v56;
  id v57;
  MPStoreDownloadManager *v58;
  NSObject *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v36 = self;
  v71 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v61 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v12, "_SSDownload", v36);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v5, "addObject:", v13);
          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          objc_msgSend(v12, "_SSPurchase");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v6, "addObject:", v14);
            objc_msgSend(v39, "addObject:", v12);
          }

        }
        objc_msgSend(v12, "_setCanceled:", 1);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v9);
  }

  v15 = dispatch_group_create();
  v16 = objc_msgSend(v5, "count");
  v17 = MEMORY[0x1E0C809B0];
  v18 = v36;
  if (v16)
  {
    if (v36->_downloadManager)
    {
      dispatch_group_enter(v15);
      -[MPStoreDownloadManager _updateActiveDownloadsWithCancelledDownloads:](v36, "_updateActiveDownloadsWithCancelledDownloads:", v4);
      downloadManager = v36->_downloadManager;
      v55[0] = v17;
      v55[1] = 3221225472;
      v55[2] = __42__MPStoreDownloadManager_cancelDownloads___block_invoke;
      v55[3] = &unk_1E31636C0;
      v56 = v5;
      v57 = v4;
      v58 = v36;
      v59 = v15;
      -[SSDownloadManager cancelDownloads:completionBlock:](downloadManager, "cancelDownloads:completionBlock:", v56, v55);

      v20 = v56;
    }
    else
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v21 = v4;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v52 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "_setCanceled:", 0, v36);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
        }
        while (v23);
      }

      v20 = os_log_create("com.apple.amp.mediaplayer", "Download");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreDownloadErrorDomain"), -5002, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v5;
        v67 = 2114;
        v68 = v26;
        _os_log_impl(&dword_193B9B000, v20, OS_LOG_TYPE_ERROR, "Failed to cancel downloads %{public}@ with error %{public}@", buf, 0x16u);

      }
      v18 = v36;
      v17 = MEMORY[0x1E0C809B0];
    }

  }
  if (objc_msgSend(v6, "count", v36))
  {
    if (v18->_purchaseManager)
    {
      dispatch_group_enter(v15);
      -[MPStoreDownloadManager _updateActiveDownloadsWithCancelledDownloads:](v18, "_updateActiveDownloadsWithCancelledDownloads:", v39);
      purchaseManager = v18->_purchaseManager;
      v46[0] = v17;
      v46[1] = 3221225472;
      v46[2] = __42__MPStoreDownloadManager_cancelDownloads___block_invoke_36;
      v46[3] = &unk_1E31636F0;
      v47 = v6;
      v48 = v39;
      v49 = v18;
      v50 = v15;
      -[SSPurchaseManager cancelPurchases:withCompletionBlock:](purchaseManager, "cancelPurchases:withCompletionBlock:", v47, v46);

      v27 = v47;
    }
    else
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v28 = v39;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v64, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v43;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v43 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * k), "_setCanceled:", 0);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v42, v64, 16);
        }
        while (v30);
      }

      v27 = os_log_create("com.apple.amp.mediaplayer", "Download");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreDownloadErrorDomain"), -5002, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v6;
        v67 = 2114;
        v68 = v33;
        _os_log_impl(&dword_193B9B000, v27, OS_LOG_TYPE_ERROR, "Failed to cancel purchases %{public}@ with error %{public}@", buf, 0x16u);

      }
      v18 = v37;
      v17 = MEMORY[0x1E0C809B0];
    }

  }
  calloutSerialQueue = v18->_calloutSerialQueue;
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __42__MPStoreDownloadManager_cancelDownloads___block_invoke_37;
  block[3] = &unk_1E31635F8;
  block[4] = v18;
  v41 = v7;
  v35 = v7;
  dispatch_group_notify(v15, calloutSerialQueue, block);

}

- (void)pauseDownloads:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  MPStoreDownloadManager *v17;
  SSDownloadManager *downloadManager;
  NSObject *v19;
  void *v20;
  SSPurchaseManager *purchaseManager;
  NSObject *v22;
  void *v23;
  NSObject *calloutSerialQueue;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  MPStoreDownloadManager *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD block[5];
  id v38;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  id v42;
  MPStoreDownloadManager *v43;
  NSObject *v44;
  _QWORD v45[4];
  NSObject *v46;
  id v47;
  NSObject *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v29 = self;
  v58 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v50 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v11, "_SSDownload", v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "_addOverridePhaseIdentifier:", CFSTR("MPStoreDownloadPhasePaused"));
          if (!v8)
            v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          objc_msgSend(v8, "addObject:", v11);
          objc_msgSend(v33, "addObject:", v12);
          objc_msgSend(v32, "addObject:", v11);
        }
        else
        {
          objc_msgSend(v11, "_SSPurchase");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v11, "_addOverridePhaseIdentifier:", CFSTR("MPStoreDownloadPhaseCanceled"));
            if (!v7)
              v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
            objc_msgSend(v7, "addObject:", v11);
            objc_msgSend(v31, "addObject:", v13);
            objc_msgSend(v30, "addObject:", v11);
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  v14 = dispatch_group_create();
  v15 = objc_msgSend(v33, "count");
  v16 = MEMORY[0x1E0C809B0];
  v17 = v29;
  if (v15)
  {
    if (v29->_downloadManager)
    {
      dispatch_group_enter(v14);
      downloadManager = v29->_downloadManager;
      v45[0] = v16;
      v45[1] = 3221225472;
      v45[2] = __41__MPStoreDownloadManager_pauseDownloads___block_invoke;
      v45[3] = &unk_1E3163728;
      v46 = v8;
      v47 = v33;
      v48 = v14;
      -[SSDownloadManager pauseDownloads:completionBlock:](downloadManager, "pauseDownloads:completionBlock:", v47, v45);

      v19 = v46;
    }
    else
    {
      v19 = os_log_create("com.apple.amp.mediaplayer", "Download");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreDownloadErrorDomain"), -5002, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v33;
        v55 = 2114;
        v56 = v20;
        _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_ERROR, "Failed to pause downloads %{public}@ with error %{public}@", buf, 0x16u);

      }
    }

  }
  if (objc_msgSend(v31, "count", v29))
  {
    if (v17->_purchaseManager)
    {
      dispatch_group_enter(v14);
      purchaseManager = v17->_purchaseManager;
      v39[0] = v16;
      v39[1] = 3221225472;
      v39[2] = __41__MPStoreDownloadManager_pauseDownloads___block_invoke_38;
      v39[3] = &unk_1E3163750;
      v40 = v7;
      v41 = v31;
      v42 = v30;
      v43 = v17;
      v44 = v14;
      -[SSPurchaseManager cancelPurchases:withCompletionBlock:](purchaseManager, "cancelPurchases:withCompletionBlock:", v41, v39);

      v22 = v40;
    }
    else
    {
      v22 = os_log_create("com.apple.amp.mediaplayer", "Download");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreDownloadErrorDomain"), -5002, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v33;
        v55 = 2114;
        v56 = v23;
        _os_log_impl(&dword_193B9B000, v22, OS_LOG_TYPE_ERROR, "Failed to pause downloads %{public}@ with error %{public}@", buf, 0x16u);

      }
    }

  }
  calloutSerialQueue = v17->_calloutSerialQueue;
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __41__MPStoreDownloadManager_pauseDownloads___block_invoke_39;
  block[3] = &unk_1E31635F8;
  block[4] = v17;
  v25 = v4;
  v38 = v25;
  dispatch_async(calloutSerialQueue, block);
  v26 = v17->_calloutSerialQueue;
  v34[0] = v16;
  v34[1] = 3221225472;
  v34[2] = __41__MPStoreDownloadManager_pauseDownloads___block_invoke_2;
  v34[3] = &unk_1E3163698;
  v34[4] = v17;
  v35 = v25;
  v36 = v7;
  v27 = v7;
  v28 = v25;
  dispatch_group_notify(v14, v26, v34);

}

- (void)resumeDownloads:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SSDownloadManager *downloadManager;
  NSObject *calloutSerialQueue;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t block;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  MPStoreDownloadManager *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v10), "_SSDownload");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v8);
  }

  v12 = dispatch_group_create();
  v13 = objc_msgSend(v5, "count");
  v14 = MEMORY[0x1E0C809B0];
  v15 = (_QWORD *)&unk_193F08000;
  if (v13)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v40;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v20++), "_addOverridePhaseIdentifier:", CFSTR("MPStoreDownloadPhaseWaiting"));
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v18);
    }

    dispatch_group_enter(v12);
    downloadManager = self->_downloadManager;
    v35[0] = v14;
    v15 = &unk_193F08000;
    v35[1] = 3221225472;
    v35[2] = __42__MPStoreDownloadManager_resumeDownloads___block_invoke;
    v35[3] = &unk_1E3163728;
    v36 = v16;
    v37 = v5;
    v38 = v12;
    -[SSDownloadManager resumeDownloads:completionBlock:](downloadManager, "resumeDownloads:completionBlock:", v37, v35);

  }
  calloutSerialQueue = self->_calloutSerialQueue;
  block = v14;
  v30 = v15[280];
  v23 = v30;
  v31 = __42__MPStoreDownloadManager_resumeDownloads___block_invoke_40;
  v32 = &unk_1E31635F8;
  v33 = self;
  v24 = v6;
  v34 = v24;
  dispatch_async(calloutSerialQueue, &block);
  v25 = self->_calloutSerialQueue;
  v27[0] = v14;
  v27[1] = v23;
  v27[2] = __42__MPStoreDownloadManager_resumeDownloads___block_invoke_2;
  v27[3] = &unk_1E31635F8;
  v27[4] = self;
  v28 = v24;
  v26 = v24;
  dispatch_group_notify(v12, v25, v27);

}

- (void)restartDownloads:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SSDownloadManager *downloadManager;
  NSObject *calloutSerialQueue;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t block;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  MPStoreDownloadManager *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  MPStoreDownloadManager *v37;
  id v38;
  NSObject *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v10), "_SSDownload");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v8);
  }

  -[MPStoreDownloadManager _updateDownloadsWithAdditions:removals:](self, "_updateDownloadsWithAdditions:removals:", v6, 0);
  v12 = dispatch_group_create();
  v13 = objc_msgSend(v5, "count");
  v14 = MEMORY[0x1E0C809B0];
  v15 = (_QWORD *)&unk_193F08000;
  if (v13)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v41;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v20++), "_addOverridePhaseIdentifier:", CFSTR("MPStoreDownloadPhaseWaiting"));
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v18);
    }

    dispatch_group_enter(v12);
    downloadManager = self->_downloadManager;
    v35[0] = v14;
    v15 = &unk_193F08000;
    v35[1] = 3221225472;
    v35[2] = __43__MPStoreDownloadManager_restartDownloads___block_invoke;
    v35[3] = &unk_1E31636C0;
    v36 = v16;
    v37 = self;
    v38 = v5;
    v39 = v12;
    -[SSDownloadManager restartDownloads:completionBlock:](downloadManager, "restartDownloads:completionBlock:", v38, v35);

  }
  calloutSerialQueue = self->_calloutSerialQueue;
  block = v14;
  v30 = v15[280];
  v23 = v30;
  v31 = __43__MPStoreDownloadManager_restartDownloads___block_invoke_41;
  v32 = &unk_1E31635F8;
  v33 = self;
  v24 = v6;
  v34 = v24;
  dispatch_async(calloutSerialQueue, &block);
  v25 = self->_calloutSerialQueue;
  v27[0] = v14;
  v27[1] = v23;
  v27[2] = __43__MPStoreDownloadManager_restartDownloads___block_invoke_2;
  v27[3] = &unk_1E31635F8;
  v27[4] = self;
  v28 = v24;
  v26 = v24;
  dispatch_group_notify(v12, v25, v27);

}

- (id)downloadForDownloadPersistentIdentifier:(int64_t)a3
{
  NSObject *accessQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__50201;
  v11 = __Block_byref_object_dispose__50202;
  v12 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MPStoreDownloadManager_downloadForDownloadPersistentIdentifier___block_invoke;
  block[3] = &unk_1E3163780;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)downloadForMediaItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "persistentID");
  if (!v5
    || (-[MPStoreDownloadManager downloadForMediaItemPersistentID:](self, "downloadForMediaItemPersistentID:", v5),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v4, "valueForProperty:", CFSTR("storeItemAdamID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "longLongValue");

    if (v6)
    {
      -[MPStoreDownloadManager downloadForStoreID:](self, "downloadForStoreID:", v6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

- (id)downloadForMediaItemPersistentID:(unint64_t)a3
{
  NSObject *accessQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!a3)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__50201;
  v11 = __Block_byref_object_dispose__50202;
  v12 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MPStoreDownloadManager_downloadForMediaItemPersistentID___block_invoke;
  block[3] = &unk_1E3163780;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)downloadForStoreID:(int64_t)a3
{
  NSObject *accessQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!a3)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__50201;
  v11 = __Block_byref_object_dispose__50202;
  v12 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MPStoreDownloadManager_downloadForStoreID___block_invoke;
  block[3] = &unk_1E3163780;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)prioritizeDownloads:(id)a3
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  SSDownloadManager *downloadManager;
  uint64_t v14;
  NSObject *v15;
  SSPurchaseManager *purchaseManager;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  __int128 v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  NSObject *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(a3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v25;
    *(_QWORD *)&v6 = 138543618;
    v20 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "_SSDownload", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          downloadManager = self->_downloadManager;
          if (downloadManager)
          {
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __46__MPStoreDownloadManager_prioritizeDownloads___block_invoke;
            v22[3] = &unk_1E31637A8;
            v22[4] = v10;
            v23 = v11;
            -[SSDownloadManager moveDownload:afterDownload:completionBlock:](downloadManager, "moveDownload:afterDownload:completionBlock:", v23, 0, v22);

            goto LABEL_18;
          }
          v15 = os_log_create("com.apple.amp.mediaplayer", "Download");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreDownloadErrorDomain"), -5002, 0);
            v18 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v30 = v10;
            v31 = 2114;
            v32 = v18;
            _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_ERROR, "Failed to move download: %{public}@ with error: %{public}@", buf, 0x16u);
LABEL_16:

          }
        }
        else
        {
          objc_msgSend(v10, "_SSPurchase");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            purchaseManager = self->_purchaseManager;
            if (!purchaseManager)
            {
              v18 = os_log_create("com.apple.amp.mediaplayer", "Download");
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPStoreDownloadErrorDomain"), -5002, 0);
                v19 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v20;
                v30 = v10;
                v31 = 2114;
                v32 = v19;
                _os_log_impl(&dword_193B9B000, v18, OS_LOG_TYPE_ERROR, "Failed to move purchase: %{public}@ with error: %{public}@", buf, 0x16u);

              }
              goto LABEL_16;
            }
            v28 = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v21[0] = MEMORY[0x1E0C809B0];
            v21[1] = 3221225472;
            v21[2] = __46__MPStoreDownloadManager_prioritizeDownloads___block_invoke_42;
            v21[3] = &unk_1E31637D0;
            v21[4] = v10;
            -[SSPurchaseManager movePurchases:afterPurchase:withCompletionBlock:](purchaseManager, "movePurchases:afterPurchase:withCompletionBlock:", v17, 0, v21);

          }
        }

LABEL_18:
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v7);
  }

}

- (void)removeObserver:(id)a3 forDownloads:(id)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[4];
  id v10;
  MPStoreDownloadManager *v11;
  id v12;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MPStoreDownloadManager_removeObserver_forDownloads___block_invoke;
    block[3] = &unk_1E3163698;
    v10 = v6;
    v11 = self;
    v12 = v8;
    dispatch_barrier_sync(accessQueue, block);

  }
}

- (void)reloadFromServer
{
  -[SSDownloadManager reloadFromServer](self->_downloadManager, "reloadFromServer");
}

- (void)requestPermissionToDownloadWithType:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *calloutSerialQueue;
  objc_class *v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD block[4];
  NSObject *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 == 1)
  {
    if (v6)
    {
      calloutSerialQueue = self->_calloutSerialQueue;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __80__MPStoreDownloadManager_requestPermissionToDownloadWithType_completionHandler___block_invoke_2;
      v13[3] = &unk_1E31637F8;
      v14 = v6;
      dispatch_async(calloutSerialQueue, v13);
      v9 = v14;
      goto LABEL_9;
    }
  }
  else
  {
    if (a3 != 2)
    {
      v9 = os_log_create("com.apple.amp.mediaplayer", "Download");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        v19 = 2048;
        v20 = a3;
        _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] UNKNOWN PURCHASE TYPE: %li", buf, 0x16u);

      }
      goto LABEL_9;
    }
    if (v6)
    {
      v8 = self->_calloutSerialQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__MPStoreDownloadManager_requestPermissionToDownloadWithType_completionHandler___block_invoke;
      block[3] = &unk_1E31637F8;
      v16 = v6;
      dispatch_async(v8, block);
      v9 = v16;
LABEL_9:

    }
  }

}

- (void)purchaseManager:(id)a3 didFinishPurchasesWithResponses:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  NSObject *calloutSerialQueue;
  id v19;
  MPStoreDownloadManager *v20;
  id obj;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD block[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v20 = self;
  -[MPStoreDownloadManager downloads](self, "downloads");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v24)
  {
    v22 = *(_QWORD *)v33;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v25 = v7;
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v7);
        objc_msgSend(v8, "purchase");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v10 = v23;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v29 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v15, "_SSPurchase");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqual:", v9);

              if (v17)
              {
                objc_msgSend(v15, "_setSSPurchase:SSPurchaseResponse:", 0, v8);
                if ((objc_msgSend(v15, "isFinished") & 1) == 0)
                  objc_msgSend(v6, "addObject:", v15);
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v12);
        }

        v7 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v24);
  }

  calloutSerialQueue = v20->_calloutSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MPStoreDownloadManager_purchaseManager_didFinishPurchasesWithResponses___block_invoke;
  block[3] = &unk_1E31635F8;
  block[4] = v20;
  v27 = v6;
  v19 = v6;
  dispatch_async(calloutSerialQueue, block);

}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *accessQueue;
  MPStoreDownload *v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  const char *v24;
  id v25;
  char v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *calloutSerialQueue;
  NSObject *v33;
  MPStoreDownload *v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  MPStoreDownload *v43;
  _QWORD block[5];
  MPStoreDownload *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  MPStoreDownload *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = (MPStoreDownload *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v7)
  {
    v8 = v7;
    v9 = "com.apple.amp.mediaplayer";
    v10 = *(_QWORD *)v47;
    do
    {
      v11 = 0;
      v37 = v8;
      do
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v11);
        if (!-[MPStoreDownloadManager _shouldHideDownload:](self, "_shouldHideDownload:", v12))
        {
          -[MPStoreDownloadManager _existingDownloadForSSDownload:](self, "_existingDownloadForSSDownload:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = v13;
            objc_msgSend(v13, "_setSSDownload:", v12);
            accessQueue = self->_accessQueue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke;
            block[3] = &unk_1E31635F8;
            block[4] = self;
            v16 = v14;
            v45 = v16;
            dispatch_barrier_sync(accessQueue, block);

          }
          else
          {
            v17 = os_log_create(v9, "Download");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v51 = v12;
              _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_ERROR, "Download did change %{public}@ with no existing download.", buf, 0xCu);
            }

            v16 = -[MPStoreDownload initWithType:attributes:]([MPStoreDownload alloc], "initWithType:attributes:", 0, 0);
            objc_msgSend(v36, "addObject:", v16);
            -[MPStoreDownload _setSSDownload:](v16, "_setSSDownload:", v12);
          }
          v18 = os_log_create(v9, "Download");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v51 = v12;
            v52 = 2114;
            v53 = v16;
            _os_log_impl(&dword_193B9B000, v18, OS_LOG_TYPE_DEFAULT, "Download did change: %{public}@. Download: %{public}@", buf, 0x16u);
          }

          v19 = -[MPStoreDownload _isCanceled](v16, "_isCanceled");
          objc_msgSend(v12, "downloadPhaseIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v19)
          {
            v22 = 0;
            if (!v16)
              goto LABEL_26;
            goto LABEL_22;
          }
          v23 = v10;
          v24 = v9;
          v25 = v6;
          soft_SSDownloadPhaseIsFinishedPhase(v20);
          if ((v26 & 1) != 0
            || (getSSDownloadPhaseFailed(),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                v28 = objc_msgSend(v21, "isEqual:", v27),
                v27,
                v28))
          {
            objc_msgSend(v35, "addObject:", v16);
            -[MPStoreDownloadManager _updateMediaItemPropertiesForFinishedStoreDownload:SSDownload:](self, "_updateMediaItemPropertiesForFinishedStoreDownload:SSDownload:", v16, v12);
            goto LABEL_20;
          }
          if (-[MPStoreDownload _isCanceled](v16, "_isCanceled"))
          {
LABEL_20:
            v22 = 0;
          }
          else
          {
            -[MPStoreDownload addObject:](v34, "addObject:", v16);
            v22 = -[MPStoreDownloadManager _isActiveDownload:](self, "_isActiveDownload:", v16);
          }
          v6 = v25;
          v9 = v24;
          v10 = v23;
          v8 = v37;
          if (!v16)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_22:
          if (v22)
            v29 = v39;
          else
            v29 = v38;
          objc_msgSend(v29, "addObject:", v16);
          goto LABEL_26;
        }
LABEL_27:
        ++v11;
      }
      while (v8 != v11);
      v30 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      v8 = v30;
    }
    while (v30);
  }

  v31 = os_log_create("com.apple.amp.mediaplayer", "Download_Oversize");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v51 = v6;
    v52 = 2114;
    v53 = v34;
    v54 = 2114;
    v55 = v36;
    v56 = 2114;
    v57 = v35;
    _os_log_impl(&dword_193B9B000, v31, OS_LOG_TYPE_DEFAULT, "Download states did change: %{public}@, progressed downloads: %{public}@, added downloads: %{public}@, finished: %{public}@", buf, 0x2Au);
  }

  if (-[MPStoreDownload count](v34, "count"))
  {
    calloutSerialQueue = self->_calloutSerialQueue;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke_44;
    v42[3] = &unk_1E31635F8;
    v42[4] = self;
    v43 = v34;
    dispatch_async(calloutSerialQueue, v42);

  }
  objc_msgSend(v36, "removeObjectsInArray:", v35);
  if (objc_msgSend(v35, "count"))
  {
    v33 = self->_calloutSerialQueue;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke_2;
    v40[3] = &unk_1E31635F8;
    v40[4] = self;
    v41 = v35;
    dispatch_async(v33, v40);

  }
  if (objc_msgSend(v36, "count"))
    -[MPStoreDownloadManager _updateDownloadsWithAdditions:removals:](self, "_updateDownloadsWithAdditions:removals:", v36, 0);
  -[MPStoreDownloadManager _updateActiveDownloadsWithChangedActiveDownloads:inactiveDownloads:](self, "_updateActiveDownloadsWithChangedActiveDownloads:inactiveDownloads:", v39, v38);

}

- (void)downloadManagerNetworkUsageDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MPStoreDownloadManager _observersForAllDownloads](self, "_observersForAllDownloads", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "downloadManagerNetworkUsageDidChange:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_addPurchaseFinishedHandler:(id)a3 forDownloads:(id)a4
{
  void (**v7)(id, void *);
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  _MPStoreDownloadBlockObserver *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *))a3;
  v8 = a4;
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPStoreDownloadManager.m"), 947, CFSTR("Downloads must not be empty."));

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "_SSPurchaseResponse", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          if (v7)
            v7[2](v7, v14);
        }
        else
        {
          v16 = -[_MPStoreDownloadBlockObserver initWithDownload:]([_MPStoreDownloadBlockObserver alloc], "initWithDownload:", v14);
          -[_MPStoreDownloadBlockObserver setDidFinishPurchaseHandler:](v16, "setDidFinishPurchaseHandler:", v7);
          -[MPStoreDownloadManager _registerBlockObserver:](self, "_registerBlockObserver:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (id)_existingDownloadForSSDownload:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__50201;
    v16 = __Block_byref_object_dispose__50202;
    v17 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MPStoreDownloadManager__existingDownloadForSSDownload___block_invoke;
    block[3] = &unk_1E31635A8;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(accessQueue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_observersForAllDownloads
{
  NSObject *accessQueue;
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
  v9 = __Block_byref_object_copy__50201;
  v10 = __Block_byref_object_dispose__50202;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__MPStoreDownloadManager__observersForAllDownloads__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_observersForDownload:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__50201;
    v16 = __Block_byref_object_dispose__50202;
    v17 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MPStoreDownloadManager__observersForDownload___block_invoke;
    block[3] = &unk_1E31635A8;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(accessQueue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_onQueue_addDownloadToMapTables:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t key;

  v4 = a3;
  key = objc_msgSend(v4, "storeItemIdentifier");
  if (key)
    NSMapInsert(self->_storeIdentifiersToDownloads, &key, v4);
  v6 = objc_msgSend(v4, "libraryItemIdentifier");
  if (v6)
    NSMapInsert(self->_libraryIdentifiersToDownloads, &v6, v4);
  v5 = objc_msgSend(v4, "downloadIdentifier");
  if (v5)
    NSMapInsert(self->_downloadIdentifiersToDownloads, &v5, v4);

}

- (id)_onQueue_findStoreDownloadWithSSDownload:(id)a3 SSPurchase:(id)a4
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
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t key;

  v6 = a3;
  v7 = a4;
  key = objc_msgSend(v6, "persistentIdentifier");
  if (!key
    || (NSMapGet(self->_downloadIdentifiersToDownloads, &key), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    getSSDownloadPropertyStoreItemIdentifier_50197();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForProperty:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v10, "longLongValue");

    if (!v20)
    {
      getSSDownloadPropertyStoreItemIdentifier_50197();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForDownloadProperty:", v11, 0, key);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v12, "longLongValue");

      if (!v20)
        goto LABEL_6;
    }
    NSMapGet(self->_storeIdentifiersToDownloads, &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_6:
      getSSDownloadPropertyLibraryItemIdentifier_50156();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForProperty:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "longLongValue");
      v20 = v15;

      if (v15)
        goto LABEL_8;
      getSSDownloadPropertyLibraryItemIdentifier_50156();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForDownloadProperty:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "longLongValue");
      v20 = v18;

      if (v18)
      {
LABEL_8:
        NSMapGet(self->_libraryIdentifiersToDownloads, &v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
    }
  }

  return v8;
}

- (BOOL)_onQueue_hasExistingDownloadForStoreDownload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  if (!a3)
    return 0;
  v4 = a3;
  objc_msgSend(v4, "_SSDownload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_SSPurchase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPStoreDownloadManager _onQueue_findStoreDownloadWithSSDownload:SSPurchase:](self, "_onQueue_findStoreDownloadWithSSDownload:SSPurchase:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

- (void)_onQueue_removeDownloadFromMapTables:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t key;

  v4 = a3;
  key = objc_msgSend(v4, "storeItemIdentifier");
  if (key)
    NSMapRemove(self->_storeIdentifiersToDownloads, &key);
  v6 = objc_msgSend(v4, "libraryItemIdentifier");
  if (v6)
    NSMapRemove(self->_libraryIdentifiersToDownloads, &v6);
  v5 = objc_msgSend(v4, "downloadIdentifier");
  if (v5)
    NSMapRemove(self->_downloadIdentifiersToDownloads, &v5);

}

- (void)_registerBlockObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__MPStoreDownloadManager__registerBlockObserver___block_invoke;
    v7[3] = &unk_1E31635F8;
    v7[4] = self;
    v8 = v4;
    dispatch_barrier_async(accessQueue, v7);

  }
}

- (void)_sendActiveDownloadsDidChangeToObserversWithAddedDownloads:(id)a3 removedDownloads:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MPStoreDownloadManager _observersForAllDownloads](self, "_observersForAllDownloads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "downloadManager:didAddActiveDownloads:removeActiveDownloads:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_sendDownloadsDidChangeToObserversWithAddedDownloads:(id)a3 removedDownloads:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MPStoreDownloadManager _observersForAllDownloads](self, "_observersForAllDownloads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "downloadManager:didAddDownloads:removeDownloads:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_sendDownloadsDidFinishPurchasesToObserversForDownloads:(id)a3
{
  uint64_t i;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  id obj;
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
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a3;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v14)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[MPStoreDownloadManager _observersForDownload:](self, "_observersForDownload:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v16;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v16 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * j);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v11, "downloadManager:downloadPurchaseDidFinish:", self, v5);
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v8);
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v14);
  }

}

- (void)_sendDownloadsDidFinishToObserversForDownloads:(id)a3 notifyDownloadManager:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  _BOOL4 v23;
  void (**v24)(id, id);
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v23 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = (void (**)(id, id))a5;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v7;
  v27 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[MPStoreDownloadManager _observersForDownload:](self, "_observersForDownload:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v33;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v33 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v15, "downloadManager:downloadDidFinish:", self, v9);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          }
          while (v12);
        }

      }
      v7 = obj;
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v27);
  }
  if (v23)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        for (k = 0; k != v19; ++k)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * k), "_SSDownload");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v16, "count"))
      -[SSDownloadManager finishDownloads:](self->_downloadManager, "finishDownloads:", v16);

    v7 = obj;
  }
  if (v24)
    v24[2](v24, v7);

}

- (void)_sendDownloadsDidProgressToObserversForDownloads:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t j;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MPStoreDownloadManager _observersForAllDownloads](self, "_observersForAllDownloads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "downloadManager:downloadsDidProgress:", self, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }
  v19 = v5;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        -[MPStoreDownloadManager _observersForDownload:](self, "_observersForDownload:", v12, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v24;
          do
          {
            for (k = 0; k != v15; ++k)
            {
              if (*(_QWORD *)v24 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * k);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v18, "downloadManager:downloadDidProgress:", self, v12);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
          }
          while (v15);
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v22);
  }

}

- (BOOL)_shouldHideDownload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;

  v4 = a3;
  if (self->_downloadKindToRequiredClientBundleIdentifiers)
  {
    getSSDownloadPropertyKind();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForProperty:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSDictionary objectForKey:](self->_downloadKindToRequiredClientBundleIdentifiers, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (_NSIsNSString())
      {
        getSSDownloadPropertyClientBundleIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "valueForProperty:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = objc_msgSend(v9, "isEqualToString:", v7);
LABEL_10:
          v11 = v10 ^ 1;
LABEL_13:

          goto LABEL_14;
        }
        goto LABEL_12;
      }
      if (_NSIsNSArray())
      {
        getSSDownloadPropertyClientBundleIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "valueForProperty:", v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = objc_msgSend(v7, "containsObject:", v9);
          goto LABEL_10;
        }
LABEL_12:
        v11 = 0;
        goto LABEL_13;
      }
    }
    v11 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (void)_unregisterBlockObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__MPStoreDownloadManager__unregisterBlockObserver___block_invoke;
    v7[3] = &unk_1E31635F8;
    v7[4] = self;
    v8 = v4;
    dispatch_barrier_async(accessQueue, v7);

  }
}

- (void)_updateActiveDownloadsWithChangedActiveDownloads:(id)a3 inactiveDownloads:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  _QWORD block[4];
  id v10;
  MPStoreDownloadManager *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__MPStoreDownloadManager__updateActiveDownloadsWithChangedActiveDownloads_inactiveDownloads___block_invoke;
    block[3] = &unk_1E3163698;
    v10 = v6;
    v11 = self;
    v12 = v7;
    dispatch_barrier_async(accessQueue, block);

  }
}

- (void)_updateDownloadsWithAdditions:(id)a3 removals:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  _QWORD block[4];
  id v10;
  id v11;
  MPStoreDownloadManager *v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MPStoreDownloadManager__updateDownloadsWithAdditions_removals___block_invoke;
    block[3] = &unk_1E3163698;
    v10 = v6;
    v11 = v7;
    v12 = self;
    dispatch_barrier_async(accessQueue, block);

  }
}

- (void)_updateMediaItemPropertiesForFinishedStoreDownload:(id)a3 SSDownload:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  MPMediaItem *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (!objc_msgSend(v5, "isFinished"))
      goto LABEL_15;
    objc_msgSend(v5, "failureError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_15;
    v9 = objc_msgSend(v5, "libraryItemIdentifier");
    if (!v9)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (!v6)
  {
LABEL_15:

    return;
  }
  objc_msgSend(v6, "downloadPhaseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v11 = (_QWORD *)getSSDownloadPhaseFinishedSymbolLoc_ptr_50148;
  v22 = getSSDownloadPhaseFinishedSymbolLoc_ptr_50148;
  if (!getSSDownloadPhaseFinishedSymbolLoc_ptr_50148)
  {
    v12 = StoreServicesLibrary_50149();
    v11 = dlsym(v12, "SSDownloadPhaseFinished");
    v20[3] = (uint64_t)v11;
    getSSDownloadPhaseFinishedSymbolLoc_ptr_50148 = (uint64_t)v11;
  }
  _Block_object_dispose(&v19, 8);
  if (v11)
  {
    if (objc_msgSend(v10, "isEqualToString:", *v11)
      && (objc_msgSend(v7, "failureError"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v13))
    {
      getSSDownloadPropertyLibraryItemIdentifier_50156();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForProperty:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v16, "longLongValue");

    }
    else
    {
      v9 = 0;
    }

    if (!v9)
      goto LABEL_15;
LABEL_14:
    v14 = -[MPMediaItem initWithPersistentID:]([MPMediaItem alloc], "initWithPersistentID:", v9);
    -[MPMediaEntity invalidateCachedProperties](v14, "invalidateCachedProperties");

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPhaseFinished(void)");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("MPStoreDownloadManager.m"), 66, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_addNonCancelledDownloadsToActiveList:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MPStoreDownloadManager *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__MPStoreDownloadManager__addNonCancelledDownloadsToActiveList___block_invoke;
  v7[3] = &unk_1E31635F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)_updateActiveDownloadsWithCancelledDownloads:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MPStoreDownloadManager__updateActiveDownloadsWithCancelledDownloads___block_invoke;
  block[3] = &unk_1E31635F8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(accessQueue, block);

}

- (BOOL)_isActiveDownload:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "phaseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3
    && ((objc_msgSend(v3, "isEqualToString:", CFSTR("MPStoreDownloadPhaseDownloading")) & 1) != 0
     || (objc_msgSend(v4, "isEqualToString:", CFSTR("MPStoreDownloadPhaseProcessing")) & 1) != 0
     || objc_msgSend(v4, "isEqualToString:", CFSTR("MPStoreDownloadPhaseInstalling")));

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseManager, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_storeIdentifiersToDownloads, 0);
  objc_storeStrong((id *)&self->_observersForAllDownloads, 0);
  objc_storeStrong((id *)&self->_libraryIdentifiersToDownloads, 0);
  objc_storeStrong((id *)&self->_downloadsToObservers, 0);
  objc_storeStrong((id *)&self->_downloadIdentifiersToDownloads, 0);
  objc_storeStrong((id *)&self->_userDownloads, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_downloadKindToRequiredClientBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_blockObservers, 0);
  objc_storeStrong((id *)&self->_calloutSerialQueue, 0);
  objc_storeStrong((id *)&self->_activeDownloads, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __71__MPStoreDownloadManager__updateActiveDownloadsWithCancelledDownloads___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "mutableCopy");
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
    objc_msgSend(v2, "removeObjectsInArray:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

void __64__MPStoreDownloadManager__addNonCancelledDownloadsToActiveList___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
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
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "downloadIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = *(id *)(a1 + 32);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
        if ((objc_msgSend(*(id *)(a1 + 40), "_isActiveDownload:", v16) & 1) == 0)
          objc_msgSend(v28, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v13);
  }
  v27 = a1;

  objc_msgSend(v2, "removeObjectsInArray:", v28);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v2;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v22, "downloadIdentifier", v27));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v4, "containsObject:", v23);

        if ((v24 & 1) == 0)
          objc_msgSend(v5, "addObject:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v19);
  }

  v25 = *(_QWORD *)(v27 + 40);
  v26 = *(void **)(v25 + 16);
  *(_QWORD *)(v25 + 16) = v5;

}

void __65__MPStoreDownloadManager__updateDownloadsWithAdditions_removals___block_invoke(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  MPStoreDownload *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  _QWORD block[5];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[5], "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = a1[4];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v31;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;
        }
        else
        {
          getSSPurchaseClass();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v8 = -[MPStoreDownload initWithType:attributes:]([MPStoreDownload alloc], "initWithType:attributes:", 0, 0);
            -[MPStoreDownload _setSSPurchase:SSPurchaseResponse:](v8, "_setSSPurchase:SSPurchaseResponse:", v7, 0);
          }
          else
          {
            v35 = 0;
            v36 = &v35;
            v37 = 0x2050000000;
            v9 = (void *)getSSDownloadClass_softClass_50168;
            v38 = getSSDownloadClass_softClass_50168;
            if (!getSSDownloadClass_softClass_50168)
            {
              v34[0] = MEMORY[0x1E0C809B0];
              v34[1] = 3221225472;
              v34[2] = __getSSDownloadClass_block_invoke_50169;
              v34[3] = &unk_1E31639A0;
              v34[4] = &v35;
              __getSSDownloadClass_block_invoke_50169((uint64_t)v34);
              v9 = (void *)v36[3];
            }
            v10 = objc_retainAutorelease(v9);
            _Block_object_dispose(&v35, 8);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v8 = 0;
              goto LABEL_21;
            }
            v8 = -[MPStoreDownload initWithType:attributes:]([MPStoreDownload alloc], "initWithType:attributes:", 0, 0);
            -[MPStoreDownload _setSSDownload:](v8, "_setSSDownload:", v7);
          }
        }
        if (v8 && (objc_msgSend(a1[6], "_onQueue_hasExistingDownloadForStoreDownload:", v8) & 1) == 0)
        {
          objc_msgSend(*((id *)a1[6] + 6), "addObject:", v8);
          if (-[MPStoreDownload reason](v8, "reason") != 1 && -[MPStoreDownload reason](v8, "reason") != 2)
            objc_msgSend(*((id *)a1[6] + 7), "addObject:", v8);
          objc_msgSend(v22, "addObject:", v8, v22);
          objc_msgSend(a1[6], "_onQueue_addDownloadToMapTables:", v8);
        }
LABEL_21:

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v4);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = a1[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = v15;
        }
        else
        {
          getSSPurchaseClass();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v17 = v15;
          else
            v17 = 0;
          v18 = v17;
          getSSPurchaseClass();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v19 = v15;
          else
            v19 = 0;
          objc_msgSend(a1[6], "_onQueue_findStoreDownloadWithSSDownload:SSPurchase:", v19, v18, v22);
          v16 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (v16)
        {
          objc_msgSend(*((id *)a1[6] + 6), "removeObject:", v16);
          if (objc_msgSend(v16, "reason") != 1 && objc_msgSend(v16, "reason") != 2)
            objc_msgSend(*((id *)a1[6] + 7), "removeObject:", v16);
          objc_msgSend(v2, "addObject:", v16, v22);
          objc_msgSend(a1[6], "_onQueue_removeDownloadFromMapTables:", v16);
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v22, "count") || objc_msgSend(v2, "count"))
  {
    v20 = a1[6];
    v21 = *((_QWORD *)v20 + 3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MPStoreDownloadManager__updateDownloadsWithAdditions_removals___block_invoke_2;
    block[3] = &unk_1E3163698;
    block[4] = v20;
    v24 = v22;
    v25 = v2;
    dispatch_async(v21, block);

  }
}

uint64_t __65__MPStoreDownloadManager__updateDownloadsWithAdditions_removals___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)a1[4];
  if (objc_msgSend((id)a1[5], "count"))
    v3 = a1[5];
  else
    v3 = 0;
  if (objc_msgSend((id)a1[6], "count"))
    v4 = a1[6];
  else
    v4 = 0;
  return objc_msgSend(v2, "_sendDownloadsDidChangeToObserversWithAddedDownloads:removedDownloads:", v3, v4);
}

void __93__MPStoreDownloadManager__updateActiveDownloadsWithChangedActiveDownloads_inactiveDownloads___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minusSet:", v3);

  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "mutableCopy");
  objc_msgSend(v2, "allObjects");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;

  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v8, "removeObjectsInArray:", v4);
  objc_msgSend(v4, "removeObjectsInArray:", *(_QWORD *)(a1 + 32));
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(NSObject **)(v9 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__MPStoreDownloadManager__updateActiveDownloadsWithChangedActiveDownloads_inactiveDownloads___block_invoke_2;
  block[3] = &unk_1E3163698;
  block[4] = v9;
  v14 = v8;
  v15 = v4;
  v11 = v4;
  v12 = v8;
  dispatch_async(v10, block);

}

uint64_t __93__MPStoreDownloadManager__updateActiveDownloadsWithChangedActiveDownloads_inactiveDownloads___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendActiveDownloadsDidChangeToObserversWithAddedDownloads:removedDownloads:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __51__MPStoreDownloadManager__unregisterBlockObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 32);
    *(_QWORD *)(v2 + 32) = 0;

  }
}

uint64_t __49__MPStoreDownloadManager__registerBlockObserver___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

void __48__MPStoreDownloadManager__observersForDownload___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = objc_msgSend(*(id *)(a1[4] + 88), "count");
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1[4] + 88), "allObjects");
    v1 = objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "initWithArray:", v1);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v5);
  if (v3)
  {

    v5 = (id)v1;
  }

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKey:", a1[5]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    objc_msgSend(v11, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

  }
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count");
  v9 = *(_QWORD *)(a1[6] + 8);
  if (v8)
    v10 = *(void **)(v9 + 40);
  else
    v10 = 0;
  objc_storeStrong((id *)(v9 + 40), v10);

}

void __51__MPStoreDownloadManager__observersForAllDownloads__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id obj;

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allObjects");
    v1 = objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "initWithArray:", v1);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  obj = v5;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
  v6 = obj;
  if (v3)
  {

    v6 = (void *)v1;
  }

}

void __57__MPStoreDownloadManager__existingDownloadForSSDownload___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_findStoreDownloadWithSSDownload:SSPurchase:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_addDownloadToMapTables:", *(_QWORD *)(a1 + 40));
}

uint64_t __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke_44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDownloadsDidProgressToObserversForDownloads:", *(_QWORD *)(a1 + 40));
}

void __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  id v4;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke_3;
  v3[3] = &unk_1E31635D0;
  v3[4] = v2;
  v4 = v1;
  objc_msgSend(v2, "_sendDownloadsDidFinishToObserversForDownloads:notifyDownloadManager:completionHandler:", v4, 1, v3);

}

uint64_t __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDownloadsWithAdditions:removals:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __74__MPStoreDownloadManager_purchaseManager_didFinishPurchasesWithResponses___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDownloadsDidFinishPurchasesToObserversForDownloads:", *(_QWORD *)(a1 + 40));
}

uint64_t __80__MPStoreDownloadManager_requestPermissionToDownloadWithType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__MPStoreDownloadManager_requestPermissionToDownloadWithType_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__MPStoreDownloadManager_removeObserver_forDownloads___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v26 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "objectForKey:", v7, (_QWORD)v25);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObject:", *(_QWORD *)(a1 + 48));
          if (!objc_msgSend(v8, "count"))
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeObjectForKey:", v7);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v4);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "removeObject:", *(_QWORD *)(a1 + 48));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "count"))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(void **)(v9 + 88);
      *(_QWORD *)(v9 + 88) = 0;

    }
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "keyEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "containsObject:", *(_QWORD *)(a1 + 48))
            && (!objc_msgSend(*(id *)(a1 + 32), "count")
             || objc_msgSend(*(id *)(a1 + 32), "containsObject:", v17)))
          {
            objc_msgSend(v18, "removeObject:", *(_QWORD *)(a1 + 48));
          }
          if (!objc_msgSend(v18, "count"))
            objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v14);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v2 = v11;
    v19 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
        }
        v20 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v20);
    }

  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "count"))
  {
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(void **)(v23 + 72);
    *(_QWORD *)(v23 + 72) = 0;

  }
}

void __46__MPStoreDownloadManager_prioritizeDownloads___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to move download: %{public}@ with error: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "prioritizeAboveDownload:completionBlock:", 0, 0);
  }

}

void __46__MPStoreDownloadManager_prioritizeDownloads___block_invoke_42(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "Failed to move purchase: %{public}@ with error: %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __45__MPStoreDownloadManager_downloadForStoreID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  NSMapGet(*(NSMapTable **)(a1[4] + 96), a1 + 6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __59__MPStoreDownloadManager_downloadForMediaItemPersistentID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  NSMapGet(*(NSMapTable **)(a1[4] + 80), a1 + 6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66__MPStoreDownloadManager_downloadForDownloadPersistentIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  NSMapGet(*(NSMapTable **)(a1[4] + 64), a1 + 6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43__MPStoreDownloadManager_restartDownloads___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "_removeOverridePhaseIdentifier:", CFSTR("MPStoreDownloadPhaseWaiting"));
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v9, "_SSDownload");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_existingDownloadForSSDownload:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          if (!v6)
            v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v6, "addObject:", v9);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  if (v16)
  {
    v13 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      v23 = 2114;
      v24 = v16;
      _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_ERROR, "Failed to restart downloads %{public}@ with error %{public}@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v6, "count"))
  {
    v15 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v6;
      _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_ERROR, "Finished attempted restart with removed downloads: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_updateDownloadsWithAdditions:removals:", 0, v6);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __43__MPStoreDownloadManager_restartDownloads___block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDownloadsDidProgressToObserversForDownloads:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__MPStoreDownloadManager_restartDownloads___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDownloadsDidProgressToObserversForDownloads:", *(_QWORD *)(a1 + 40));
}

void __42__MPStoreDownloadManager_resumeDownloads___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "_removeOverridePhaseIdentifier:", CFSTR("MPStoreDownloadPhaseWaiting"), (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v6);
  }

  if (v3)
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v3;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "Failed to resume downloads %{public}@ with error %{public}@", buf, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __42__MPStoreDownloadManager_resumeDownloads___block_invoke_40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDownloadsDidProgressToObserversForDownloads:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__MPStoreDownloadManager_resumeDownloads___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDownloadsDidProgressToObserversForDownloads:", *(_QWORD *)(a1 + 40));
}

void __41__MPStoreDownloadManager_pauseDownloads___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8++), "_removeOverridePhaseIdentifier:", CFSTR("MPStoreDownloadPhasePaused"), (_QWORD)v14);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v6);
  }

  v9 = os_log_create("com.apple.amp.mediaplayer", "Download");
  v10 = v9;
  if (v3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "msv_description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v11;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_ERROR, "Paused downloads %{public}@ error=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v19 = v13;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "Paused downloads %{public}@", buf, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __41__MPStoreDownloadManager_pauseDownloads___block_invoke_38(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10++), "_removeOverridePhaseIdentifier:", CFSTR("MPStoreDownloadPhaseCanceled"));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v8);
  }

  v11 = os_log_create("com.apple.amp.mediaplayer", "Download");
  v12 = v11;
  if (v5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "msv_description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v13;
      v32 = 2114;
      v33 = v14;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_ERROR, "Caneled purchases %{public}@ error=%{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "Caneled purchases %{public}@", buf, 0xCu);
    }

    if ((a2 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "_updateDownloadsWithAdditions:removals:", 0, *(_QWORD *)(a1 + 48));
      goto LABEL_24;
    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *(id *)(a1 + 48);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "_setCanceled:", 0, (_QWORD)v21);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v18);
  }

LABEL_24:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

uint64_t __41__MPStoreDownloadManager_pauseDownloads___block_invoke_39(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDownloadsDidProgressToObserversForDownloads:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__MPStoreDownloadManager_pauseDownloads___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_sendDownloadsDidProgressToObserversForDownloads:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_sendDownloadsDidFinishToObserversForDownloads:notifyDownloadManager:completionHandler:", *(_QWORD *)(a1 + 48), 1, 0);
}

void __42__MPStoreDownloadManager_cancelDownloads___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v6;
      v21 = 2114;
      v22 = v7;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "Cancelled downloads %{public}@ error=%{public}@", buf, 0x16u);

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "_setCanceled:", 0, (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 48), "_addNonCancelledDownloadsToActiveList:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v20 = v13;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "Cancelled downloads %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "_updateDownloadsWithAdditions:removals:", 0, *(_QWORD *)(a1 + 40));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __42__MPStoreDownloadManager_cancelDownloads___block_invoke_36(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.mediaplayer", "Download");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v8;
      v23 = 1024;
      v24 = a2;
      v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Cancelled purchases %{public}@, result %d error=%{public}@", buf, 0x1Cu);

    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      v23 = 1024;
      v24 = a2;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Cancelled purchases %{public}@, result %d", buf, 0x12u);
    }

    if ((a2 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "_updateDownloadsWithAdditions:removals:", 0, *(_QWORD *)(a1 + 40));
      goto LABEL_17;
    }
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *(id *)(a1 + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "_setCanceled:", 0, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  objc_msgSend(*(id *)(a1 + 48), "_addNonCancelledDownloadsToActiveList:", *(_QWORD *)(a1 + 40));
LABEL_17:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __42__MPStoreDownloadManager_cancelDownloads___block_invoke_37(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDownloadsDidFinishToObserversForDownloads:notifyDownloadManager:completionHandler:", *(_QWORD *)(a1 + 40), 1, 0);
}

void __39__MPStoreDownloadManager_addDownloads___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_SSDownload");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_SSPurchase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_onQueue_findStoreDownloadWithSSDownload:SSPurchase:", v7, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __39__MPStoreDownloadManager_addDownloads___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD *WeakRetained;
  void *v7;
  char v8;
  NSObject *v9;
  _QWORD v10[4];
  _QWORD *v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (a3)
    v8 = 0;
  else
    v8 = a2;
  if ((v8 & 1) == 0 && WeakRetained)
  {
    v9 = WeakRetained[3];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__MPStoreDownloadManager_addDownloads___block_invoke_3;
    v10[3] = &unk_1E31635F8;
    v11 = WeakRetained;
    v12 = *(id *)(a1 + 32);
    dispatch_async(v9, v10);

  }
}

void __39__MPStoreDownloadManager_addDownloads___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__MPStoreDownloadManager_addDownloads___block_invoke_6;
  v4[3] = &unk_1E3163648;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_sendDownloadsDidFinishToObserversForDownloads:notifyDownloadManager:completionHandler:", v3, 0, v4);

  objc_destroyWeak(&v6);
}

void __39__MPStoreDownloadManager_addDownloads___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateDownloadsWithAdditions:removals:", 0, *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __39__MPStoreDownloadManager_addDownloads___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__MPStoreDownloadManager_addDownloads___block_invoke_4;
  v4[3] = &unk_1E31635D0;
  v5 = v2;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v5, "_sendDownloadsDidFinishToObserversForDownloads:notifyDownloadManager:completionHandler:", v3, 0, v4);

}

uint64_t __39__MPStoreDownloadManager_addDownloads___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDownloadsWithAdditions:removals:", 0, *(_QWORD *)(a1 + 40));
}

void __35__MPStoreDownloadManager_downloads__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __41__MPStoreDownloadManager_activeDownloads__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
