@implementation MPStoreLibraryPersonalizationRequestOperation

- (void)execute
{
  char *v2;
  MPStoreLibraryPersonalizationRequestOperation *v3;
  void (**responseHandler)(id, _QWORD, id);
  NSOperationQueue *v5;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MPAsyncBlockOperation *v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  int v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  MPStoreLibraryMappingRequestOperation *v45;
  void *v46;
  char v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  BOOL v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  char *v66;
  void *v67;
  char *v68;
  void *v69;
  MPModelLibraryRequest *v70;
  MPStoreLibraryPersonalizationCollectionDataSource *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  MPModelLibraryRequest *v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  MPStoreLibraryPersonalizationCollectionDataSource *v82;
  MPAsyncBlockOperation *val;
  id obj;
  void *v85;
  void *v86;
  MPStoreLibraryMappingRequestOperation *v87;
  uint64_t v89;
  id v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  id v97;
  void *v98;
  uint64_t v99;
  id v100;
  void *v101;
  uint64_t v102;
  void *v103;
  id v104;
  int v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _QWORD v115[4];
  id v116;
  id v117;
  id v118;
  id v119;
  MPStoreLibraryPersonalizationRequestOperation *v120;
  _QWORD *v121;
  _QWORD *v122;
  id v123[2];
  char v124;
  id location;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[6];
  int v135;
  _QWORD v136[4];
  MPStoreLibraryPersonalizationCollectionDataSource *v137;
  id v138;
  id v139;
  id v140;
  MPModelLibraryRequest *v141;
  MPStoreLibraryPersonalizationRequestOperation *v142;
  _QWORD *v143;
  _QWORD v144[5];
  id v145;
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v3 = self;
  v150 = *MEMORY[0x1E0C80C00];
  if (!-[MPAsyncOperation isCancelled](self, "isCancelled"))
  {
    if (!v3->_operationQueue)
    {
      v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
      operationQueue = v3->_operationQueue;
      v3->_operationQueue = v5;

      -[NSOperationQueue setName:](v3->_operationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPStoreLibraryPersonalizationRequestOperation.operationQueue"));
      -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_operationQueue, "setMaxConcurrentOperationCount:", 1);
      v7 = v3->_operationQueue;
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSOperationQueue setQualityOfService:](v7, "setQualityOfService:", objc_msgSend(v8, "qualityOfService"));

      v3 = self;
    }
    -[MPStoreLibraryPersonalizationRequestOperation request](v3, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaLibraryOverrideForTestingOnly");
    v10 = objc_claimAutoreleasedReturnValue();

    v73 = (void *)v10;
    if (v10)
    {
      +[MPStoreLibraryPersonalizationRequest libraryViewWithMediaLibraryOverrideForTestingOnly:](MPStoreLibraryPersonalizationRequest, "libraryViewWithMediaLibraryOverrideForTestingOnly:", v10);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MPAsyncOperation userIdentity](self, "userIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:](MPStoreLibraryPersonalizationRequest, "libraryViewWithUserIdentity:", v11);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v78 = objc_alloc_init(MPModelLibraryRequest);
    objc_msgSend(v86, "library");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryRequest setMediaLibrary:](v78, "setMediaLibrary:", v12);

    -[MPModelLibraryRequest setFilteringOptions:](v78, "setFilteringOptions:", objc_msgSend(v86, "filteringOptions"));
    v82 = objc_alloc_init(MPStoreLibraryPersonalizationCollectionDataSource);
    -[MPModelRequest itemProperties](self->_request, "itemProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreLibraryPersonalizationCollectionDataSource setItemProperties:](v82, "setItemProperties:", v13);

    -[MPStoreLibraryPersonalizationRequest itemIndexPathToOverridePropertySet](self->_request, "itemIndexPathToOverridePropertySet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreLibraryPersonalizationCollectionDataSource setItemIndexPathToOverridePropertySet:](v82, "setItemIndexPathToOverridePropertySet:", v14);

    -[MPModelRequest sectionProperties](self->_request, "sectionProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreLibraryPersonalizationCollectionDataSource setSectionProperties:](v82, "setSectionProperties:", v15);

    -[MPStoreLibraryPersonalizationCollectionDataSource setLibraryView:](v82, "setLibraryView:", v86);
    -[MPStoreLibraryPersonalizationRequest representedObjects](self->_request, "representedObjects");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreLibraryPersonalizationRequest unpersonalizedContentDescriptors](self->_request, "unpersonalizedContentDescriptors");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v144[0] = 0;
    v144[1] = v144;
    v144[2] = 0x3032000000;
    v144[3] = __Block_byref_object_copy__26598;
    v144[4] = __Block_byref_object_dispose__26599;
    v145 = 0;
    v16 = [MPAsyncBlockOperation alloc];
    v136[0] = MEMORY[0x1E0C809B0];
    v136[1] = 3221225472;
    v136[2] = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke;
    v136[3] = &unk_1E315A990;
    v71 = v82;
    v137 = v71;
    v77 = v74;
    v138 = v77;
    v143 = v144;
    v72 = v76;
    v139 = v72;
    v97 = v75;
    v140 = v97;
    v70 = v78;
    v141 = v70;
    v142 = self;
    val = -[MPAsyncBlockOperation initWithStartHandler:](v16, "initWithStartHandler:", v136);
    v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 514, 0, 1);
    v17 = objc_msgSend(v97, "numberOfSections");
    if (v17 < 1)
    {
      v18 = 0;
    }
    else
    {
      v102 = v17;
      v18 = 0;
      for (i = 0; i != v102; ++i)
      {
        v91 = v18;
        v20 = objc_msgSend(v97, "numberOfItemsInSection:", i);
        if (v20 < 1)
        {
          LOBYTE(v105) = 0;
        }
        else
        {
          v2 = 0;
          v105 = 1;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v2, i);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "itemAtIndexPath:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_opt_class();
            if (v23 == objc_opt_class())
            {
              objc_msgSend(v22, "model");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "relativeModelObjectForStoreLibraryPersonalization");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
              {
                objc_msgSend(v25, "identifiers");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (v26)
                {
                  v27 = (void *)objc_opt_class();
                  if ((objc_msgSend(v27, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
                    v105 &= objc_msgSend(v27, "isSubclassOfClass:", objc_opt_class());
                  objc_msgSend(v95, "objectForKey:", v27);
                  v28 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v28)
                  {
                    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    objc_msgSend(v95, "setObject:forKey:", v28, v27);
                  }
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v26, v25);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "addObject:", v29);

                }
              }

            }
            ++v2;
          }
          while ((char *)v20 != v2);
        }
        objc_msgSend(v97, "sectionAtIndex:", i);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_opt_class();
        if (v31 == objc_opt_class() && objc_msgSend(v30, "personalizationStyle"))
        {
          objc_msgSend(v30, "model");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "relativeModelObjectForStoreLibraryPersonalization");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            objc_msgSend(v33, "identifiers");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              v35 = (void *)objc_opt_class();
              if ((v105 & 1) != 0
                && ((objc_msgSend(v35, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
                 || (objc_msgSend(v35, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
                 || objc_msgSend(v35, "isSubclassOfClass:", objc_opt_class())))
              {
                v36 = v91;
                if (!v91)
                  v36 = objc_alloc_init(MEMORY[0x1E0CB3788]);
                v91 = v36;
                objc_msgSend(v36, "addIndex:", i);
              }
              objc_msgSend(v95, "objectForKey:", v35);
              v37 = (id)objc_claimAutoreleasedReturnValue();
              if (!v37)
              {
                v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v95, "setObject:forKey:", v37, v35);
              }
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v34, v33);
              v2 = (char *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v2);

            }
          }

        }
        v18 = v91;
      }
    }
    v92 = v18;
    v134[0] = 0;
    v134[1] = v134;
    v134[2] = 0x3812000000;
    v134[3] = __Block_byref_object_copy__28;
    v134[4] = __Block_byref_object_dispose__29;
    v134[5] = &unk_193F4554F;
    v135 = 0;
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    obj = v95;
    v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v149, 16);
    if (!v79)
    {
LABEL_110:

      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", val);
      _Block_object_dispose(v134, 8);

      _Block_object_dispose(v144, 8);
      return;
    }
    v80 = 0;
    v81 = *(_QWORD *)v131;
    v99 = *MEMORY[0x1E0D4CE38];
LABEL_48:
    v89 = 0;
    while (1)
    {
      if (*(_QWORD *)v131 != v81)
        objc_enumerationMutation(obj);
      v38 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v89);
      if (+[MPStoreLibraryMappingRequestOperation supportsModelClass:](MPStoreLibraryMappingRequestOperation, "supportsModelClass:", v38))
      {
        break;
      }
LABEL_108:
      if (++v89 == v79)
      {
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v149, 16);
        if (!v79)
          goto LABEL_110;
        goto LABEL_48;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "objectForKey:", v38);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "isSubclassOfClass:", objc_opt_class())
      && -[MPStoreLibraryPersonalizationRequest matchAlbumArtistsOnNameAndStoreID](self->_request, "matchAlbumArtistsOnNameAndStoreID"))
    {
      v39 = 0;
    }
    else
    {
      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      v40 = v85;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v126, v148, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v127;
        do
        {
          for (j = 0; j != v41; ++j)
          {
            if (*(_QWORD *)v127 != v42)
              objc_enumerationMutation(v40);
            objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * j), "allValues");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "addObjectsFromArray:", v44);

          }
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v126, v148, 16);
        }
        while (v41);
      }

      v39 = 1;
    }
    v45 = objc_alloc_init(MPStoreLibraryMappingRequestOperation);
    -[MPStoreLibraryMappingRequestOperation setLibraryView:](v45, "setLibraryView:", v86);
    -[MPStoreLibraryMappingRequestOperation setModelClass:](v45, "setModelClass:", v38);
    if (v39)
      v46 = v98;
    else
      v46 = 0;
    -[MPStoreLibraryMappingRequestOperation setIdentifierSets:](v45, "setIdentifierSets:", v46);
    v87 = v45;
    if ((v80 & 1) != 0)
    {
      v47 = 0;
      v80 = 1;
    }
    else if (objc_msgSend(v92, "count")
           && ((objc_msgSend(v38, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
            || objc_msgSend(v38, "isSubclassOfClass:", objc_opt_class())))
    {
      v80 = 1;
      v47 = 1;
    }
    else
    {
      v80 = 0;
      v47 = 0;
    }
    objc_initWeak(&location, val);
    v115[0] = MEMORY[0x1E0C809B0];
    v115[1] = 3221225472;
    v115[2] = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_46;
    v115[3] = &unk_1E315AA30;
    v121 = v134;
    v122 = v144;
    v123[1] = v38;
    v124 = v47;
    v116 = v92;
    v117 = v97;
    v118 = v77;
    v119 = v86;
    objc_copyWeak(v123, &location);
    v120 = self;
    -[MPStoreLibraryMappingRequestOperation setResponseHandler:](v87, "setResponseHandler:", v115);
    if (v39)
    {
      -[MPAsyncBlockOperation addDependency:](val, "addDependency:", v87);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v87);
LABEL_107:
      objc_destroyWeak(v123);

      objc_destroyWeak(&location);
      goto LABEL_108;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v106 = (id)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(MEMORY[0x1E0DDC108], "canAccessAccountStore");
    v49 = (void *)MEMORY[0x1E0D51270];
    if (v48)
    {
      objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "musicLibraryForUserAccount:", v50);
      v103 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D51270], "autoupdatingSharedLibrary");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v90 = v85;
    v94 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v111, v147, 16);
    if (!v94)
    {
LABEL_106:

      -[MPStoreLibraryMappingRequestOperation setAlbumArtistNamesToIdentifierSets:](v87, "setAlbumArtistNamesToIdentifierSets:", v106);
      -[MPAsyncBlockOperation addDependency:](val, "addDependency:", v87);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v87);

      goto LABEL_107;
    }
    v93 = *(_QWORD *)v112;
LABEL_80:
    v96 = 0;
    while (1)
    {
      if (*(_QWORD *)v112 != v93)
        objc_enumerationMutation(v90);
      v51 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v96);
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      objc_msgSend(v51, "allKeys");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v107, v146, 16);
      if (v53)
        break;
LABEL_104:

      if (++v96 == v94)
      {
        v94 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v111, v147, 16);
        if (!v94)
          goto LABEL_106;
        goto LABEL_80;
      }
    }
    v54 = *(_QWORD *)v108;
    v100 = v52;
LABEL_85:
    v55 = 0;
    while (1)
    {
      if (*(_QWORD *)v108 != v54)
        objc_enumerationMutation(v100);
      v56 = *(id *)(*((_QWORD *)&v107 + 1) + 8 * v55);
      objc_msgSend(v51, "objectForKey:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "universalStore");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "adamID");

      objc_msgSend(v56, "name");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v60;
      if (v60)
      {
        if (objc_msgSend(v60, "length"))
          v62 = 1;
        else
          v62 = v59 == 0;
        if (!v62)
        {
LABEL_96:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v59);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "objectForKey:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v64 == 0;

          if (v65)
            objc_msgSend(MEMORY[0x1E0D4D030], "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v99, CFSTR("Bug"), CFSTR("Album Artist With No Name"), CFSTR("Request to personalize album artist with missing name"), 0, &unk_1E31E61C0, 0);
        }
      }
      else if (v59)
      {
        goto LABEL_96;
      }
      objc_msgSend(v103, "groupingKeyForString:", v61);
      v66 = (char *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)MEMORY[0x1E0C99D80];
      v68 = v66;
      if (!v66)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v2 = (char *)objc_claimAutoreleasedReturnValue();
        v68 = v2;
      }
      objc_msgSend(v67, "dictionaryWithObject:forKey:", v68, v57);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v66)

      objc_msgSend(v106, "addObject:", v69);
      if (v53 == ++v55)
      {
        v52 = v100;
        v53 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v107, v146, 16);
        if (!v53)
          goto LABEL_104;
        goto LABEL_85;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 6, 0);
  v104 = (id)objc_claimAutoreleasedReturnValue();
  responseHandler = (void (**)(id, _QWORD, id))self->_responseHandler;
  if (responseHandler)
    responseHandler[2](responseHandler, 0, v104);
  -[MPAsyncOperation finishWithError:](self, "finishWithError:", v104);

}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appendItem:", v8);
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "itemAtIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItem:", v7);

  }
}

BOOL __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    v6 = v3;
    if (objc_msgSend(v6, "personalizationStyle") == 4)
    {
      objc_msgSend(v6, "model");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "relativeModelObjectForStoreLibraryPersonalization");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "libraryIdentifierSetForIdentifierSet:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v11 != 0;

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 1;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (MPStoreLibraryPersonalizationRequest)request
{
  return self->_request;
}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  MPMutableSectionedCollection *v8;
  MPMutableSectionedCollection *v9;
  void *v10;
  id v11;
  MPMutableSectionedCollection *v12;
  MPMutableSectionedCollection *v13;
  MPModelLibraryResponse *v14;
  MPStoreLibraryPersonalizationResponse *v15;
  MPLazySectionedCollection *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t);
  void *v22;
  MPMutableSectionedCollection *v23;
  MPMutableSectionedCollection *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
    v5 = *(_QWORD *)(a1 + 40);
  else
    v5 = 0;
  objc_msgSend(v4, "setSectionToLibraryAddedOverride:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setRelativeModelClassToMappingResponse:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v6 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_2;
  v28[3] = &unk_1E315A918;
  v28[4] = *(_QWORD *)(a1 + 80);
  v7 = (void *)MEMORY[0x19403A810](v28);
  if (*(_QWORD *)(a1 + 48))
    v8 = objc_alloc_init(MPMutableSectionedCollection);
  else
    v8 = 0;
  v9 = objc_alloc_init(MPMutableSectionedCollection);
  v10 = *(void **)(a1 + 56);
  v19 = v6;
  v20 = 3221225472;
  v21 = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_3;
  v22 = &unk_1E315A968;
  v11 = v7;
  v27 = v11;
  v12 = v9;
  v23 = v12;
  v13 = v8;
  v24 = v13;
  v25 = *(id *)(a1 + 48);
  v26 = *(id *)(a1 + 56);
  objc_msgSend(v10, "enumerateSectionsUsingBlock:", &v19);
  objc_msgSend(*(id *)(a1 + 32), "setUnpersonalizedContentDescriptors:", v12, v19, v20, v21, v22);
  v14 = -[MPModelLibraryResponse initWithRequest:]([MPModelLibraryResponse alloc], "initWithRequest:", *(_QWORD *)(a1 + 64));
  v15 = -[MPModelResponse initWithRequest:]([MPStoreLibraryPersonalizationResponse alloc], "initWithRequest:", *(_QWORD *)(*(_QWORD *)(a1 + 72) + 280));
  -[MPStoreLibraryPersonalizationResponse setLibraryResponse:](v15, "setLibraryResponse:", v14);
  -[MPStoreLibraryPersonalizationResponse setRepresentedObjectResults:](v15, "setRepresentedObjectResults:", v13);
  v16 = -[MPLazySectionedCollection initWithDataSource:]([MPLazySectionedCollection alloc], "initWithDataSource:", *(_QWORD *)(a1 + 32));
  -[MPModelResponse setResults:](v15, "setResults:", v16);

  v17 = *(_QWORD **)(a1 + 72);
  v18 = v17[36];
  if (v18)
  {
    (*(void (**)(_QWORD, MPStoreLibraryPersonalizationResponse *, _QWORD))(v18 + 16))(v17[36], v15, 0);
    v17 = *(_QWORD **)(a1 + 72);
  }
  objc_msgSend(v17, "finishWithError:", 0);
  objc_msgSend(v3, "finish");

}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v8 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 64) + 16))())
  {
    objc_msgSend(*(id *)(a1 + 32), "appendSection:", v8);
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "sectionAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendSection:", v6);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_4;
    v9[3] = &unk_1E315A940;
    v7 = *(void **)(a1 + 56);
    v13 = *(id *)(a1 + 64);
    v14 = a3;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPStoreLibraryPersonalizationRequestOperation;
  -[MPAsyncOperation cancel](&v3, sel_cancel);
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
}

- (id)responseHandler
{
  return self->_responseHandler;
}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48));
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (!v4)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 514, 0, 1);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    }
    objc_msgSend(v4, "setObject:forKey:", v3, *(_QWORD *)(a1 + 96));
  }
  if (*(_BYTE *)(a1 + 104))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_2_47;
    v11[3] = &unk_1E315AA08;
    v8 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v13 = v3;
    v14 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 72);
    v15 = v9;
    v17 = v10;
    objc_copyWeak(&v18, (id *)(a1 + 88));
    v16 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v8, "enumerateIndexesUsingBlock:", v11);
    objc_destroyWeak(&v18);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48));

}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_2_47(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _MPStoreLibraryPersonalizationAggregateLibraryAddedOperation *v13;
  id WeakRetained;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *, uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *__p;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  __n128 (*v38)(__n128 *, __n128 *);
  void (*v39)(uint64_t);
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;

  v35 = 0;
  v36 = &v35;
  v37 = 0x4812000000;
  v38 = __Block_byref_object_copy__48;
  v39 = __Block_byref_object_dispose__49;
  v40 = &unk_193F4554F;
  v41 = 0;
  v42 = 0;
  v43 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__26598;
  v33 = __Block_byref_object_dispose__26599;
  v34 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_51;
  v25[3] = &unk_1E315A9B8;
  v5 = *(void **)(a1 + 32);
  v26 = *(id *)(a1 + 40);
  v27 = &v29;
  v28 = &v35;
  objc_msgSend(v5, "enumerateItemsInSectionAtIndex:usingBlock:", a2, v25);
  v6 = v30;
  if (!v30[5])
  {
    v8 = v36[6];
    v7 = v36[7];
    v9 = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a2);
    v6 = v30;
    if (v9 > (v7 - v8) >> 3)
    {
      v10 = (void *)v30[5];
      v30[5] = MEMORY[0x1E0C9AAA0];

      v6 = v30;
    }
  }
  v11 = v6[5];
  if (v11)
  {
    v12 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v13 = (_MPStoreLibraryPersonalizationAggregateLibraryAddedOperation *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);
  }
  else
  {
    v13 = objc_alloc_init(_MPStoreLibraryPersonalizationAggregateLibraryAddedOperation);
    v23 = 0;
    v24 = 0;
    __p = 0;
    std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, (const void *)v36[6], v36[7], (v36[7] - v36[6]) >> 3);
    -[_MPStoreLibraryPersonalizationAggregateLibraryAddedOperation setPersistentIDs:](v13, "setPersistentIDs:", &__p);
    if (__p)
    {
      v23 = __p;
      operator delete(__p);
    }
    -[_MPStoreLibraryPersonalizationAggregateLibraryAddedOperation setLibraryView:](v13, "setLibraryView:", *(_QWORD *)(a1 + 56));
    v15 = v4;
    v16 = 3221225472;
    v17 = __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_2_54;
    v18 = &unk_1E315A9E0;
    v20 = *(_QWORD *)(a1 + 72);
    v19 = *(id *)(a1 + 48);
    v21 = a2;
    -[_MPStoreLibraryPersonalizationAggregateLibraryAddedOperation setResponseHandler:](v13, "setResponseHandler:", &v15);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(WeakRetained, "addDependency:", v13, v15, v16, v17, v18);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 272), "addOperation:", v13);
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  if (v41)
  {
    v42 = v41;
    operator delete(v41);
  }
}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_51(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  BOOL v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  id v30;

  v30 = a2;
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v7 = v30;
    objc_msgSend(v7, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "relativeModelObjectForStoreLibraryPersonalization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "identifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "libraryIdentifierSetForIdentifierSet:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "library");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "persistentID");

      if (v13)
      {
        v14 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
        v16 = (uint64_t *)v14[7];
        v15 = v14[8];
        if ((unint64_t)v16 >= v15)
        {
          v20 = (uint64_t *)v14[6];
          v21 = v16 - v20;
          v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 61)
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          v23 = v15 - (_QWORD)v20;
          if (v23 >> 2 > v22)
            v22 = v23 >> 2;
          v24 = (unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8;
          v25 = 0x1FFFFFFFFFFFFFFFLL;
          if (!v24)
            v25 = v22;
          if (v25)
          {
            v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v25);
            v20 = (uint64_t *)v14[6];
            v16 = (uint64_t *)v14[7];
          }
          else
          {
            v26 = 0;
          }
          v27 = (uint64_t *)(v25 + 8 * v21);
          v28 = v25 + 8 * v26;
          *v27 = v13;
          v17 = v27 + 1;
          while (v16 != v20)
          {
            v29 = *--v16;
            *--v27 = v29;
          }
          v14[6] = v27;
          v14[7] = v17;
          v14[8] = v28;
          if (v20)
            operator delete(v20);
        }
        else
        {
          *v16 = v13;
          v17 = v16 + 1;
        }
        v14[7] = v17;
      }
      else
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = MEMORY[0x1E0C9AAA0];

      }
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      *a4 = 1;

  }
}

void __56__MPStoreLibraryPersonalizationRequestOperation_execute__block_invoke_2_54(_QWORD *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1[5] + 8) + 48));
  v4 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[5] + 8) + 48));
}

+ (id)personalizedResponseForContentDescriptor:(id)a3 requestedProperties:(id)a4
{
  +[MPStoreLibraryPersonalizationRequestOperation personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:](MPStoreLibraryPersonalizationRequestOperation, "personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)personalizedResponseForContentDescriptor:(id)a3 requestedProperties:(id)a4 matchAlbumArtistOnStoreIdAndName:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  MPModelLibraryResponse *v18;
  MPMutableSectionedCollection *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  BOOL v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  MPModelRequest *v31;
  MPMutableSectionedCollection *v32;
  void *v33;
  void *v34;
  MPMutableSectionedCollection *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  char *v39;
  void *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  unint64_t v51;
  uint64_t v52;
  mlcore *v53;
  _OWORD *v54;
  char v55;
  uint64_t v56;
  char v57;
  __int128 v58;
  unint64_t *v59;
  unint64_t v60;
  __int128 v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  uint64_t i;
  uint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  mlcore *v76;
  uint64_t v77;
  _QWORD *v78;
  _QWORD *v79;
  __int128 v80;
  std::__shared_weak_count *v81;
  unint64_t *p_shared_owners;
  unint64_t v83;
  uint64_t v84;
  mlcore *v85;
  mlcore *v86;
  mlcore *v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  char *v96;
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t j;
  mlcore *v101;
  _QWORD *v102;
  uint64_t v103;
  MPMediaLibraryView *v104;
  void *v105;
  MPMediaLibraryView *v106;
  unint64_t *v107;
  unint64_t v108;
  id v109;
  std::__shared_weak_count *v110;
  unint64_t *v111;
  unint64_t v112;
  unint64_t *v113;
  unint64_t v114;
  _QWORD *v115;
  __int128 *v116;
  uint64_t v117;
  std::__shared_weak_count *v118;
  unint64_t *v119;
  unint64_t v120;
  id v121;
  void *v122;
  id v123;
  std::__shared_weak_count *v124;
  unint64_t *v125;
  unint64_t v126;
  std::__shared_weak_count *v127;
  unint64_t *v128;
  unint64_t v129;
  std::__shared_weak_count *v130;
  unint64_t *v131;
  unint64_t v132;
  MPModelLibraryResponse *v133;
  void *v135;
  void *v136;
  MPModelLibraryRequest *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  int v141;
  void *v142;
  void *v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t v148;
  MPModelResponse *v149;
  MPModelRequest *v150;
  uint64_t *v151;
  void *v152;
  uint64_t v153;
  char *v154;
  char *v155;
  char *v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;
  uint64_t *v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  mlcore *v167;
  mlcore *v168;
  uint64_t v169;
  _QWORD *v170;
  mlcore *v171;
  _QWORD *v172;
  uint64_t v173;
  MPMediaLibraryView *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  unint64_t *v179;
  unint64_t v180;
  id v181;
  std::__shared_weak_count *v182;
  unint64_t *v183;
  unint64_t v184;
  unint64_t *v185;
  unint64_t v186;
  _QWORD *v187;
  __int128 *v188;
  uint64_t v189;
  std::__shared_weak_count *v190;
  unint64_t *v191;
  unint64_t v192;
  id v193;
  void *v194;
  id v195;
  std::__shared_weak_count *v196;
  unint64_t *v197;
  unint64_t v198;
  std::__shared_weak_count *v199;
  unint64_t *v200;
  unint64_t v201;
  std::__shared_weak_count *v202;
  unint64_t *v203;
  unint64_t v204;
  MPModelLibraryResponse *v205;
  MPMutableSectionedCollection *v206;
  void *v207;
  void *v208;
  const __CFString *v209;
  void *v210;
  void *v211;
  MPModelResponse *v212;
  MPModelRequest *v213;
  MPMutableSectionedCollection *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  __CFString *v220;
  id v221;
  id v222;
  id v223;
  __int128 v224;
  void *v225;
  void *v226;
  uint64_t v227;
  id v228;
  id v229;
  __int128 v230;
  void *v231;
  void *v232;
  uint64_t v233;
  __int128 v234;
  _OWORD *v235;
  _OWORD *v236;
  _OWORD *v237;
  __int128 v238;
  uint64_t v239;
  id v240;
  void *__p;
  char *v242;
  unint64_t v243;
  MPModelLibraryRequest *v244;
  id v245;
  id v246;
  id v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  const __CFString *v251;
  const __CFString *v252;
  void *v253;
  __int128 v254;
  int v255;
  __int128 v256;
  uint64_t v257;
  uint64_t v258;

  v5 = a5;
  v258 = *MEMORY[0x1E0C80C00];
  v221 = a3;
  v222 = a4;
  objc_msgSend(v221, "model");
  v247 = (id)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_opt_class());
  v246 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v221, "personalizationStyle");
  v8 = v7;
  v245 = 0;
  v9 = v7 - 1;
  if ((unint64_t)(v7 - 1) < 2)
  {
    +[MPStoreLibraryPersonalizationContentDescriptor lightweightPersonalizationPropertiesForModelClass:](MPStoreLibraryPersonalizationContentDescriptor, "lightweightPersonalizationPropertiesForModelClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v222, "propertySetByIntersectingWithPropertySet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPStoreLibraryPersonalizationContentDescriptor requiredLightweightPersonalizationPropertiesForModelClass:requestedProperties:](MPStoreLibraryPersonalizationContentDescriptor, "requiredLightweightPersonalizationPropertiesForModelClass:requestedProperties:", objc_opt_class(), v222);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "propertySetByCombiningWithPropertySet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if ((unint64_t)(v7 - 3) < 2)
  {
    +[MPStoreLibraryPersonalizationContentDescriptor lightweightPersonalizationPropertiesForModelClass:](MPStoreLibraryPersonalizationContentDescriptor, "lightweightPersonalizationPropertiesForModelClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v222, "propertySetByCombiningWithPropertySet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPStoreLibraryPersonalizationContentDescriptor requiredLightweightPersonalizationPropertiesForModelClass:requestedProperties:](MPStoreLibraryPersonalizationContentDescriptor, "requiredLightweightPersonalizationPropertiesForModelClass:requestedProperties:", objc_opt_class(), v222);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "propertySetByCombiningWithPropertySet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = v245;
    v245 = v13;

    goto LABEL_6;
  }
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v245;
  v245 = v29;

  if (!v8)
  {
    v31 = objc_alloc_init(MPModelRequest);
    v18 = -[MPModelResponse initWithRequest:]([MPModelResponse alloc], "initWithRequest:", v31);
    v32 = objc_alloc_init(MPMutableSectionedCollection);
    -[MPMutableSectionedCollection appendSection:](v32, "appendSection:", &stru_1E3163D10);
    -[MPMutableSectionedCollection appendItem:](v32, "appendItem:", v247);
    -[MPModelResponse setResults:](v18, "setResults:", v32);

    goto LABEL_19;
  }
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:](MPStoreLibraryPersonalizationRequest, "libraryViewWithUserIdentity:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v244 = objc_alloc_init(MPModelLibraryRequest);
    objc_msgSend(v16, "library");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryRequest setMediaLibrary:](v244, "setMediaLibrary:", v17);

    -[MPModelLibraryRequest setFilteringOptions:](v244, "setFilteringOptions:", objc_msgSend(v16, "filteringOptions"));
    v18 = -[MPModelLibraryResponse initWithRequest:]([MPModelLibraryResponse alloc], "initWithRequest:", v244);
    v19 = objc_alloc_init(MPMutableSectionedCollection);
    __p = 0;
    v242 = 0;
    v243 = 0;
    objc_msgSend(v247, "identifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "universalStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "adamID");

    v240 = v22;
    if (v22)
    {
      v23 = (v242 - (_BYTE *)__p) >> 3;
      v24 = v23 + 1;
      if ((unint64_t)(v23 + 1) >> 61)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v25 = v243 - (_QWORD)__p;
      if ((uint64_t)(v243 - (_QWORD)__p) >> 2 > v24)
        v24 = v25 >> 2;
      v26 = (unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8;
      v27 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v26)
        v27 = v24;
      if (v27)
      {
        v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v27);
        v22 = v240;
      }
      else
      {
        v28 = 0;
      }
      v39 = (char *)(v27 + 8 * v23);
      *(_QWORD *)v39 = v22;
      __p = v39;
      v243 = v27 + 8 * v28;
      v242 = v39 + 8;
    }
    objc_msgSend(v20, "universalStore");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "subscriptionAdamID");

    v239 = v41;
    v43 = v242;
    if (v41)
    {
      if ((unint64_t)v242 >= v243)
      {
        v42 = (char *)__p;
        v45 = (v242 - (_BYTE *)__p) >> 3;
        v46 = v45 + 1;
        if ((unint64_t)(v45 + 1) >> 61)
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        v47 = v243 - (_QWORD)__p;
        if ((uint64_t)(v243 - (_QWORD)__p) >> 2 > v46)
          v46 = v47 >> 2;
        v26 = (unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8;
        v48 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v26)
          v48 = v46;
        if (v48)
        {
          v48 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v48);
          v42 = (char *)__p;
          v43 = v242;
          v41 = v239;
        }
        else
        {
          v49 = 0;
        }
        v50 = (uint64_t *)(v48 + 8 * v45);
        v51 = v48 + 8 * v49;
        *v50 = v41;
        v44 = (char *)(v50 + 1);
        while (v43 != v42)
        {
          v52 = *((_QWORD *)v43 - 1);
          v43 -= 8;
          *--v50 = v52;
        }
        __p = v50;
        v243 = v51;
        if (v42)
          operator delete(v42);
      }
      else
      {
        *(_QWORD *)v242 = v41;
        v44 = v43 + 8;
      }
      v242 = v44;
      v43 = v44;
    }
    if (v43 == __p)
      goto LABEL_150;
    v238 = 0uLL;
    if ((unint64_t)(v43 - (_BYTE *)__p) < 9)
    {
      v76 = (mlcore *)mlcore::ItemPropertyStoreID((mlcore *)v42);
      v77 = mlcore::ItemPropertySubscriptionStoreItemID(v76);
      v78 = operator new(0x10uLL);
      *((_QWORD *)&v249 + 1) = v78 + 2;
      *(_QWORD *)&v250 = v78 + 2;
      *v78 = v76;
      v78[1] = v77;
      *(_QWORD *)&v249 = v78;
      v79 = operator new(0x50uLL);
      v79[1] = 0;
      v79[2] = 0;
      *v79 = &off_1E314A720;
      *(_QWORD *)&v80 = mlcore::AnyInPredicate<long long>::AnyInPredicate();
      *((_QWORD *)&v80 + 1) = v79;
      v81 = (std::__shared_weak_count *)*((_QWORD *)&v238 + 1);
      v238 = v80;
      if (v81)
      {
        p_shared_owners = (unint64_t *)&v81->__shared_owners_;
        do
          v83 = __ldaxr(p_shared_owners);
        while (__stlxr(v83 - 1, p_shared_owners));
        if (!v83)
        {
          ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
          std::__shared_weak_count::__release_weak(v81);
        }
      }
      v69 = v249;
      if ((_QWORD)v249)
      {
        *((_QWORD *)&v249 + 1) = v249;
        operator delete((void *)v249);
      }
    }
    else
    {
      mlcore::ItemPropertyStoreID((mlcore *)v42);
      v53 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>((uint64_t *)&v248);
      v249 = v248;
      v248 = 0uLL;
      mlcore::ItemPropertySubscriptionStoreItemID(v53);
      std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>((uint64_t *)&v234);
      v250 = v234;
      v234 = 0uLL;
      v236 = 0;
      v237 = 0;
      v235 = 0;
      *(_QWORD *)&v256 = &v235;
      BYTE8(v256) = 0;
      v54 = operator new(0x20uLL);
      v55 = 0;
      v56 = 0;
      v235 = v54;
      v236 = v54;
      v237 = v54 + 2;
      do
      {
        v57 = v55;
        v58 = *(&v249 + v56);
        *v54 = v58;
        if (*((_QWORD *)&v58 + 1))
        {
          v59 = (unint64_t *)(*((_QWORD *)&v58 + 1) + 8);
          do
            v60 = __ldxr(v59);
          while (__stxr(v60 + 1, v59));
        }
        ++v54;
        v55 = 1;
        v56 = 1;
      }
      while ((v57 & 1) == 0);
      v236 = v54;
      mlcore::CreateOrPredicate();
      v61 = v254;
      v254 = 0uLL;
      v62 = (std::__shared_weak_count *)*((_QWORD *)&v238 + 1);
      v238 = v61;
      if (v62)
      {
        v63 = (unint64_t *)&v62->__shared_owners_;
        do
          v64 = __ldaxr(v63);
        while (__stlxr(v64 - 1, v63));
        if (!v64)
        {
          ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
          std::__shared_weak_count::__release_weak(v62);
        }
      }
      v65 = (std::__shared_weak_count *)*((_QWORD *)&v254 + 1);
      if (*((_QWORD *)&v254 + 1))
      {
        v66 = (unint64_t *)(*((_QWORD *)&v254 + 1) + 8);
        do
          v67 = __ldaxr(v66);
        while (__stlxr(v67 - 1, v66));
        if (!v67)
        {
          ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
          std::__shared_weak_count::__release_weak(v65);
        }
      }
      *(_QWORD *)&v256 = &v235;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v256);
      for (i = 16; i != -16; i -= 16)
        v69 = std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v249 + i);
      v70 = (std::__shared_weak_count *)*((_QWORD *)&v234 + 1);
      if (*((_QWORD *)&v234 + 1))
      {
        v71 = (unint64_t *)(*((_QWORD *)&v234 + 1) + 8);
        do
          v72 = __ldaxr(v71);
        while (__stlxr(v72 - 1, v71));
        if (!v72)
        {
          ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
          std::__shared_weak_count::__release_weak(v70);
        }
      }
      v73 = (std::__shared_weak_count *)*((_QWORD *)&v248 + 1);
      if (*((_QWORD *)&v248 + 1))
      {
        v74 = (unint64_t *)(*((_QWORD *)&v248 + 1) + 8);
        do
          v75 = __ldaxr(v74);
        while (__stlxr(v75 - 1, v74));
        if (!v75)
        {
          ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
          std::__shared_weak_count::__release_weak(v73);
        }
      }
    }
    v84 = MEMORY[0x194039EC8](v69);
    std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate> &,void>(&v234, v84, v238, *((std::__shared_weak_count **)&v238 + 1));
    v86 = (mlcore *)mlcore::ItemPropertyPersistentID(v85);
    v87 = (mlcore *)mlcore::ItemPropertySubscriptionStoreItemID(v86);
    v88 = mlcore::ItemPropertyStoreID(v87);
    v89 = operator new(0x18uLL);
    *v89 = v86;
    v89[1] = v87;
    v89[2] = v88;
    if (v246)
    {
      objc_msgSend(v246, "MLCorePropertiesForPropertySet:", v245);
      v90 = *((_QWORD *)&v256 + 1);
      v91 = v256;
    }
    else
    {
      v90 = 0;
      v91 = 0;
      v256 = 0uLL;
      v257 = 0;
    }
    v92 = v90 - v91;
    if (v92 < 1)
    {
      v99 = (uint64_t)(v89 + 3);
    }
    else
    {
      v93 = v92 >> 3;
      v94 = (v92 >> 3) + 3;
      if (v94 >> 61)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      if (v94 <= 6)
        v95 = 6;
      else
        v95 = v94;
      v96 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v95);
      v97 = v96;
      v98 = 0;
      v99 = (uint64_t)&v96[8 * v93 + 24];
      do
      {
        *(_QWORD *)&v96[v98 + 24] = *(_QWORD *)(v91 + v98);
        v98 += 8;
      }
      while (8 * v93 != v98);
      for (j = 2; j != -1; --j)
        *(_QWORD *)&v96[j * 8] = v89[j];
      operator delete(v89);
      v89 = v97;
    }
    v232 = 0;
    v233 = 0;
    v231 = 0;
    std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v231, v89, v99, (v99 - (uint64_t)v89) >> 3);
    mlcore::PropertiesQuery::setPropertiesToFetch();
    v101 = (mlcore *)v231;
    if (v231)
    {
      v232 = v231;
      operator delete(v231);
    }
    mlcore::ItemPropertyInMyLibrary(v101);
    mlcore::SortDescriptor::SortDescriptor();
    v249 = 0uLL;
    *(_QWORD *)&v250 = 0;
    *(_QWORD *)&v248 = &v249;
    BYTE8(v248) = 0;
    v102 = operator new(0x18uLL);
    *(_QWORD *)&v250 = v102 + 3;
    v103 = *((_QWORD *)&v254 + 1);
    *v102 = MEMORY[0x1E0D4AF48] + 16;
    v102[1] = v103;
    *((_DWORD *)v102 + 4) = v255;
    *(_QWORD *)&v249 = v102;
    *((_QWORD *)&v249 + 1) = v102 + 3;
    mlcore::PropertiesQuery::setSortDescriptors();
    *(_QWORD *)&v248 = &v249;
    std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&v248);
    v104 = [MPMediaLibraryView alloc];
    -[MPModelLibraryRequest mediaLibrary](v244, "mediaLibrary");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = -[MPMediaLibraryView initWithLibrary:filteringOptions:](v104, "initWithLibrary:filteringOptions:", v105, -[MPModelLibraryRequest filteringOptions](v244, "filteringOptions"));

    v16 = v106;
    v230 = v234;
    if (*((_QWORD *)&v234 + 1))
    {
      v107 = (unint64_t *)(*((_QWORD *)&v234 + 1) + 8);
      do
        v108 = __ldxr(v107);
      while (__stxr(v108 + 1, v107));
    }
    v229 = 0;
    if (v106)
    {
      -[MPMediaLibraryView resultsForCoreQuery:error:](v106, "resultsForCoreQuery:error:", &v230, &v229);
      v109 = v229;
    }
    else
    {
      v109 = 0;
      v254 = 0uLL;
    }
    v110 = (std::__shared_weak_count *)*((_QWORD *)&v230 + 1);
    if (*((_QWORD *)&v230 + 1))
    {
      v111 = (unint64_t *)(*((_QWORD *)&v230 + 1) + 8);
      do
        v112 = __ldaxr(v111);
      while (__stlxr(v112 - 1, v111));
      if (!v112)
      {
        ((void (*)(std::__shared_weak_count *))v110->__on_zero_shared)(v110);
        std::__shared_weak_count::__release_weak(v110);
      }
    }
    v228 = 0;
    if (!(_QWORD)v254)
    {
LABEL_120:
      switch(v9)
      {
        case 0:
        case 1:
          if (!v228)
            goto LABEL_123;
          +[MPStoreLibraryPersonalizationCollectionDataSource _lightweightPersonalizedObjectWithUnpersonalizedObject:libraryObject:personalizationProperties:overrideLibraryAddedStatus:](MPStoreLibraryPersonalizationCollectionDataSource, "_lightweightPersonalizedObjectWithUnpersonalizedObject:libraryObject:personalizationProperties:overrideLibraryAddedStatus:", v247, v228, v245, 0);
          v121 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_129;
        case 2:
          v123 = v228;
          if (!v228)
            v123 = v247;
          goto LABEL_128;
        case 3:
          v123 = v228;
LABEL_128:
          v121 = v123;
LABEL_129:
          v122 = v121;
          if (v121)
          {
            -[MPMutableSectionedCollection appendSection:](v19, "appendSection:", &stru_1E3163D10);
            -[MPMutableSectionedCollection appendItem:](v19, "appendItem:", v122);
          }
          break;
        default:
LABEL_123:
          v122 = 0;
          break;
      }

      v124 = (std::__shared_weak_count *)*((_QWORD *)&v254 + 1);
      if (*((_QWORD *)&v254 + 1))
      {
        v125 = (unint64_t *)(*((_QWORD *)&v254 + 1) + 8);
        do
          v126 = __ldaxr(v125);
        while (__stlxr(v126 - 1, v125));
        if (!v126)
        {
          ((void (*)(std::__shared_weak_count *))v124->__on_zero_shared)(v124);
          std::__shared_weak_count::__release_weak(v124);
        }
      }

      if ((_QWORD)v256)
      {
        *((_QWORD *)&v256 + 1) = v256;
        operator delete((void *)v256);
      }
      if (v89)
        operator delete(v89);
      v127 = (std::__shared_weak_count *)*((_QWORD *)&v234 + 1);
      if (*((_QWORD *)&v234 + 1))
      {
        v128 = (unint64_t *)(*((_QWORD *)&v234 + 1) + 8);
        do
          v129 = __ldaxr(v128);
        while (__stlxr(v129 - 1, v128));
        if (!v129)
        {
          ((void (*)(std::__shared_weak_count *))v127->__on_zero_shared)(v127);
          std::__shared_weak_count::__release_weak(v127);
        }
      }
      v130 = (std::__shared_weak_count *)*((_QWORD *)&v238 + 1);
      if (*((_QWORD *)&v238 + 1))
      {
        v131 = (unint64_t *)(*((_QWORD *)&v238 + 1) + 8);
        do
          v132 = __ldaxr(v131);
        while (__stlxr(v132 - 1, v131));
        if (!v132)
        {
          ((void (*)(std::__shared_weak_count *))v130->__on_zero_shared)(v130);
          std::__shared_weak_count::__release_weak(v130);
        }
      }
LABEL_150:
      -[MPModelResponse setResults:](v18, "setResults:", v19);

      if (__p)
      {
        v242 = (char *)__p;
        operator delete(__p);
      }

      goto LABEL_153;
    }
    v248 = v254;
    if (*((_QWORD *)&v254 + 1))
    {
      v113 = (unint64_t *)(*((_QWORD *)&v254 + 1) + 8);
      do
        v114 = __ldxr(v113);
      while (__stxr(v114 + 1, v113));
    }
    v115 = operator new(0x38uLL);
    *v115 = &off_1E3149C60;
    v115[1] = &v240;
    v115[2] = &v239;
    v115[3] = &v246;
    v115[4] = &v228;
    v115[5] = &v245;
    v115[6] = &v244;
    *((_QWORD *)&v250 + 1) = v115;
    mlcore::PropertiesQueryResult::enumerateResults();
    v116 = (__int128 *)*((_QWORD *)&v250 + 1);
    if (*((__int128 **)&v250 + 1) == &v249)
    {
      v117 = 4;
      v116 = &v249;
    }
    else
    {
      if (!*((_QWORD *)&v250 + 1))
      {
LABEL_115:
        v118 = (std::__shared_weak_count *)*((_QWORD *)&v248 + 1);
        if (*((_QWORD *)&v248 + 1))
        {
          v119 = (unint64_t *)(*((_QWORD *)&v248 + 1) + 8);
          do
            v120 = __ldaxr(v119);
          while (__stlxr(v120 - 1, v119));
          if (!v120)
          {
            ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
            std::__shared_weak_count::__release_weak(v118);
          }
        }
        goto LABEL_120;
      }
      v117 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v116 + 8 * v117))();
    goto LABEL_115;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:](MPStoreLibraryPersonalizationRequest, "libraryViewWithUserIdentity:", v135);
        v136 = (void *)objc_claimAutoreleasedReturnValue();

        v137 = objc_alloc_init(MPModelLibraryRequest);
        objc_msgSend(v136, "library");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPModelLibraryRequest setMediaLibrary:](v137, "setMediaLibrary:", v138);

        -[MPModelLibraryRequest setFilteringOptions:](v137, "setFilteringOptions:", objc_msgSend(v136, "filteringOptions"));
        v220 = (__CFString *)v247;
        -[__CFString identifiers](v220, "identifiers");
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v217, "universalStore");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = objc_msgSend(v139, "adamID");

        -[__CFString name](v220, "name");
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = objc_msgSend(MEMORY[0x1E0DDC108], "canAccessAccountStore");
        v142 = (void *)MEMORY[0x1E0D51270];
        if (v141)
        {
          objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "musicLibraryForUserAccount:", v143);
          v218 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D51270], "autoupdatingSharedLibrary");
          v218 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v205 = -[MPModelLibraryResponse initWithRequest:]([MPModelLibraryResponse alloc], "initWithRequest:", v137);
        v206 = objc_alloc_init(MPMutableSectionedCollection);
        -[MPModelResponse setResults:](v205, "setResults:", v206);
        if (v140)
        {
          if (!v5)
            goto LABEL_252;
          if (v219 && objc_msgSend(v219, "length"))
          {
            objc_msgSend(v218, "groupingKeyForString:", v219);
            v207 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_253:
            LOBYTE(v215) = v5;
            +[MPStoreLibraryPersonalizationRequestOperation _personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:](MPStoreLibraryPersonalizationRequestOperation, "_personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:", v140, v247, v207, v8, v245, v136, v137, v215);
            v18 = (MPModelLibraryResponse *)objc_claimAutoreleasedReturnValue();

            v208 = 0;
            goto LABEL_254;
          }
          v216 = (void *)MEMORY[0x1E0D4D030];
          v209 = v220;
          if (!v220)
            v209 = CFSTR("<nil>");
          v251 = CFSTR("modelObject");
          v252 = v209;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v252, &v251, 1);
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          v253 = v210;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v253, 1);
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x1E0D4CE38], CFSTR("Bug"), CFSTR("Album Artist With No Name"), CFSTR("Request to personalize album artist with missing name"), 0, v211, 0);

          objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPStoreLibraryPersonalizationRequestOperationErrorDomain"), 1, CFSTR("No album artist name to favorite."));
          v208 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v208)
          {
LABEL_252:
            v207 = 0;
            goto LABEL_253;
          }
          v212 = [MPModelResponse alloc];
          v213 = objc_alloc_init(MPModelRequest);
          v18 = -[MPModelResponse initWithRequest:](v212, "initWithRequest:", v213);

          v214 = objc_alloc_init(MPMutableSectionedCollection);
          v207 = 0;
          v206 = v214;
          -[MPModelResponse setResults:](v18, "setResults:", v214);
        }
        else
        {
          v207 = 0;
          v208 = 0;
          v18 = v205;
        }
LABEL_254:

        goto LABEL_153;
      }
      v149 = [MPModelResponse alloc];
      v150 = objc_alloc_init(MPModelRequest);
      v18 = -[MPModelResponse initWithRequest:](v149, "initWithRequest:", v150);

      v31 = objc_alloc_init(MPMutableSectionedCollection);
      -[MPModelResponse setResults:](v18, "setResults:", v31);
LABEL_19:

      goto LABEL_153;
    }
  }
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPStoreLibraryPersonalizationRequest libraryViewWithUserIdentity:](MPStoreLibraryPersonalizationRequest, "libraryViewWithUserIdentity:", v33);
  *(_QWORD *)&v234 = objc_claimAutoreleasedReturnValue();

  v244 = objc_alloc_init(MPModelLibraryRequest);
  objc_msgSend((id)v234, "library");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryRequest setMediaLibrary:](v244, "setMediaLibrary:", v34);

  -[MPModelLibraryRequest setFilteringOptions:](v244, "setFilteringOptions:", objc_msgSend((id)v234, "filteringOptions"));
  v18 = -[MPModelLibraryResponse initWithRequest:]([MPModelLibraryResponse alloc], "initWithRequest:", v244);
  v35 = objc_alloc_init(MPMutableSectionedCollection);
  __p = 0;
  v242 = 0;
  v243 = 0;
  objc_msgSend(v247, "identifiers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "universalStore");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "adamID");

  if (v38)
  {
    v144 = (v242 - (_BYTE *)__p) >> 3;
    v145 = v144 + 1;
    if ((unint64_t)(v144 + 1) >> 61)
      std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
    v146 = v243 - (_QWORD)__p;
    if ((uint64_t)(v243 - (_QWORD)__p) >> 2 > v145)
      v145 = v146 >> 2;
    v26 = (unint64_t)v146 >= 0x7FFFFFFFFFFFFFF8;
    v147 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v26)
      v147 = v145;
    if (v147)
      v147 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v147);
    else
      v148 = 0;
    v151 = (uint64_t *)(v147 + 8 * v144);
    *v151 = v38;
    __p = v151;
    v243 = v147 + 8 * v148;
    v242 = (char *)(v151 + 1);
  }
  objc_msgSend(v36, "universalStore");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = objc_msgSend(v152, "subscriptionAdamID");

  v155 = v242;
  if (v153)
  {
    if ((unint64_t)v242 >= v243)
    {
      v154 = (char *)__p;
      v157 = (v242 - (_BYTE *)__p) >> 3;
      v158 = v157 + 1;
      if ((unint64_t)(v157 + 1) >> 61)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v159 = v243 - (_QWORD)__p;
      if ((uint64_t)(v243 - (_QWORD)__p) >> 2 > v158)
        v158 = v159 >> 2;
      v26 = (unint64_t)v159 >= 0x7FFFFFFFFFFFFFF8;
      v160 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v26)
        v160 = v158;
      if (v160)
      {
        v160 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::ModelPropertyBase *>>(v160);
        v154 = (char *)__p;
        v155 = v242;
      }
      else
      {
        v161 = 0;
      }
      v162 = (uint64_t *)(v160 + 8 * v157);
      v163 = v160 + 8 * v161;
      *v162 = v153;
      v156 = (char *)(v162 + 1);
      while (v155 != v154)
      {
        v164 = *((_QWORD *)v155 - 1);
        v155 -= 8;
        *--v162 = v164;
      }
      __p = v162;
      v243 = v163;
      if (v154)
        operator delete(v154);
    }
    else
    {
      *(_QWORD *)v242 = v153;
      v156 = v155 + 8;
    }
    v242 = v156;
    v155 = v156;
  }
  if (v155 == __p)
    goto LABEL_238;
  mlcore::ItemPropertyStorePlaylistID((mlcore *)v154);
  v165 = std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>((uint64_t *)&v249);
  v248 = v249;
  v166 = MEMORY[0x194039EC8](v165);
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate> &,void>(&v238, v166, v248, *((std::__shared_weak_count **)&v248 + 1));
  v168 = (mlcore *)mlcore::ItemPropertyPersistentID(v167);
  v169 = mlcore::ItemPropertyAlbumPersistentID(v168);
  v170 = operator new(0x10uLL);
  *v170 = v168;
  v170[1] = v169;
  v226 = 0;
  v227 = 0;
  v225 = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&v225, v170, (uint64_t)(v170 + 2), 2uLL);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  v171 = (mlcore *)v225;
  if (v225)
  {
    v226 = v225;
    operator delete(v225);
  }
  mlcore::ItemPropertyInMyLibrary(v171);
  mlcore::SortDescriptor::SortDescriptor();
  v249 = 0uLL;
  *(_QWORD *)&v250 = 0;
  *(_QWORD *)&v254 = &v249;
  BYTE8(v254) = 0;
  v172 = operator new(0x18uLL);
  *(_QWORD *)&v250 = v172 + 3;
  v173 = *((_QWORD *)&v256 + 1);
  *v172 = MEMORY[0x1E0D4AF48] + 16;
  v172[1] = v173;
  *((_DWORD *)v172 + 4) = v257;
  *(_QWORD *)&v249 = v172;
  *((_QWORD *)&v249 + 1) = v172 + 3;
  mlcore::PropertiesQuery::setSortDescriptors();
  *(_QWORD *)&v254 = &v249;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100]((void ***)&v254);
  v249 = xmmword_193F0CA70;
  mlcore::RangeQuery::setRange();
  v174 = [MPMediaLibraryView alloc];
  -[MPModelLibraryRequest mediaLibrary](v244, "mediaLibrary");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = -[MPMediaLibraryView initWithLibrary:filteringOptions:](v174, "initWithLibrary:filteringOptions:", v175, -[MPModelLibraryRequest filteringOptions](v244, "filteringOptions"));
  v177 = (void *)v234;
  *(_QWORD *)&v234 = v176;

  v178 = (void *)v234;
  v224 = v238;
  if (*((_QWORD *)&v238 + 1))
  {
    v179 = (unint64_t *)(*((_QWORD *)&v238 + 1) + 8);
    do
      v180 = __ldxr(v179);
    while (__stxr(v180 + 1, v179));
  }
  v223 = 0;
  if (v178)
  {
    objc_msgSend(v178, "resultsForCoreQuery:error:", &v224, &v223);
    v181 = v223;
  }
  else
  {
    v181 = 0;
    v256 = 0uLL;
  }
  v182 = (std::__shared_weak_count *)*((_QWORD *)&v224 + 1);
  if (*((_QWORD *)&v224 + 1))
  {
    v183 = (unint64_t *)(*((_QWORD *)&v224 + 1) + 8);
    do
      v184 = __ldaxr(v183);
    while (__stlxr(v184 - 1, v183));
    if (!v184)
    {
      ((void (*)(std::__shared_weak_count *))v182->__on_zero_shared)(v182);
      std::__shared_weak_count::__release_weak(v182);
    }
  }
  v240 = 0;
  if ((_QWORD)v256)
  {
    v254 = v256;
    if (*((_QWORD *)&v256 + 1))
    {
      v185 = (unint64_t *)(*((_QWORD *)&v256 + 1) + 8);
      do
        v186 = __ldxr(v185);
      while (__stxr(v186 + 1, v185));
    }
    v187 = operator new(0x38uLL);
    *v187 = &off_1E3149CB8;
    v187[1] = &v234;
    v187[2] = &v247;
    v187[3] = &v245;
    v187[4] = &v240;
    v187[5] = &v246;
    v187[6] = &v244;
    *((_QWORD *)&v250 + 1) = v187;
    mlcore::PropertiesQueryResult::enumerateResults();
    v188 = (__int128 *)*((_QWORD *)&v250 + 1);
    if (*((__int128 **)&v250 + 1) == &v249)
    {
      v189 = 4;
      v188 = &v249;
    }
    else
    {
      if (!*((_QWORD *)&v250 + 1))
      {
LABEL_207:
        v190 = (std::__shared_weak_count *)*((_QWORD *)&v254 + 1);
        if (*((_QWORD *)&v254 + 1))
        {
          v191 = (unint64_t *)(*((_QWORD *)&v254 + 1) + 8);
          do
            v192 = __ldaxr(v191);
          while (__stlxr(v192 - 1, v191));
          if (!v192)
          {
            ((void (*)(std::__shared_weak_count *))v190->__on_zero_shared)(v190);
            std::__shared_weak_count::__release_weak(v190);
          }
        }
        goto LABEL_212;
      }
      v189 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v188 + 8 * v189))();
    goto LABEL_207;
  }
LABEL_212:
  switch(v9)
  {
    case 0:
    case 1:
      if (!v240)
        goto LABEL_215;
      +[MPStoreLibraryPersonalizationCollectionDataSource _lightweightPersonalizedObjectWithUnpersonalizedObject:libraryObject:personalizationProperties:overrideLibraryAddedStatus:](MPStoreLibraryPersonalizationCollectionDataSource, "_lightweightPersonalizedObjectWithUnpersonalizedObject:libraryObject:personalizationProperties:overrideLibraryAddedStatus:", v247, v240, v245, 0);
      v193 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_221;
    case 2:
      v195 = v240;
      if (!v240)
        v195 = v247;
      goto LABEL_220;
    case 3:
      v195 = v240;
LABEL_220:
      v193 = v195;
LABEL_221:
      v194 = v193;
      if (v193)
      {
        -[MPMutableSectionedCollection appendSection:](v35, "appendSection:", &stru_1E3163D10);
        -[MPMutableSectionedCollection appendItem:](v35, "appendItem:", v194);
      }
      break;
    default:
LABEL_215:
      v194 = 0;
      break;
  }

  v196 = (std::__shared_weak_count *)*((_QWORD *)&v256 + 1);
  if (*((_QWORD *)&v256 + 1))
  {
    v197 = (unint64_t *)(*((_QWORD *)&v256 + 1) + 8);
    do
      v198 = __ldaxr(v197);
    while (__stlxr(v198 - 1, v197));
    if (!v198)
    {
      ((void (*)(std::__shared_weak_count *))v196->__on_zero_shared)(v196);
      std::__shared_weak_count::__release_weak(v196);
    }
  }

  operator delete(v170);
  v199 = (std::__shared_weak_count *)*((_QWORD *)&v238 + 1);
  if (*((_QWORD *)&v238 + 1))
  {
    v200 = (unint64_t *)(*((_QWORD *)&v238 + 1) + 8);
    do
      v201 = __ldaxr(v200);
    while (__stlxr(v201 - 1, v200));
    if (!v201)
    {
      ((void (*)(std::__shared_weak_count *))v199->__on_zero_shared)(v199);
      std::__shared_weak_count::__release_weak(v199);
    }
  }
  v202 = (std::__shared_weak_count *)*((_QWORD *)&v248 + 1);
  if (*((_QWORD *)&v248 + 1))
  {
    v203 = (unint64_t *)(*((_QWORD *)&v248 + 1) + 8);
    do
      v204 = __ldaxr(v203);
    while (__stlxr(v204 - 1, v203));
    if (!v204)
    {
      ((void (*)(std::__shared_weak_count *))v202->__on_zero_shared)(v202);
      std::__shared_weak_count::__release_weak(v202);
    }
  }
LABEL_238:
  -[MPModelResponse setResults:](v18, "setResults:", v35);

  if (__p)
  {
    v242 = (char *)__p;
    operator delete(__p);
  }

LABEL_153:
  v133 = v18;

  return v133;
}

+ (id)_personalizedArtistResponseForStoreID:(int64_t)a3 modelObject:(id)a4 groupingKey:(id)a5 personalizationStyle:(int64_t)a6 personalizationProperties:(id)a7 libraryView:(id)a8 libraryRequest:(id)a9 matchingStoreIDAndName:(BOOL)a10
{
  MPModelLibraryResponse *v14;
  MPMutableSectionedCollection *v15;
  uint64_t v16;
  uint64_t v17;
  mlcore *v18;
  mlcore *v19;
  uint64_t v20;
  mlcore *v21;
  uint64_t v22;
  _QWORD *v23;
  std::__shared_weak_count *v24;
  id v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  id v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  __int128 *v35;
  __int128 *v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  id v40;
  void *v41;
  id v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  __int128 v53;
  id v54;
  id v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  void *__p;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  __int128 v63;
  BOOL v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69[2];
  void **v70;
  std::__shared_weak_count *v71;
  __int128 v72;
  char *v73;
  __int128 *v74;
  void **v75;
  std::__shared_weak_count *v76;
  int v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v69[1] = (id)a3;
  v69[0] = a4;
  v68 = a5;
  v67 = a7;
  v66 = a8;
  v65 = a9;
  v64 = a10;
  v14 = -[MPModelLibraryResponse initWithRequest:]([MPModelLibraryResponse alloc], "initWithRequest:", v65);
  v15 = objc_alloc_init(MPMutableSectionedCollection);
  mlcore::ArtistPropertyStoreID((mlcore *)v15);
  v16 = std::allocate_shared[abi:ne180100]<mlcore::ComparisonPredicate<long long>,std::allocator<mlcore::ComparisonPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::ComparisonOperator,long long const&,void>((uint64_t *)&v72);
  v53 = v72;
  v63 = v72;
  v17 = MEMORY[0x194039F64](v16);
  std::allocate_shared[abi:ne180100]<mlcore::PropertiesQuery,std::allocator<mlcore::PropertiesQuery>,mlcore::EntityClass *,std::shared_ptr<mlcore::Predicate> &,void>(&v61, v17, v53, *((std::__shared_weak_count **)&v53 + 1));
  v19 = (mlcore *)mlcore::ArtistPropertyPersistentID(v18);
  v20 = mlcore::ArtistPropertyGroupingKey(v19);
  v21 = (mlcore *)operator new(0x10uLL);
  *(_QWORD *)v21 = v19;
  *((_QWORD *)v21 + 1) = v20;
  v22 = v61;
  mlcore::ArtistPropertyCloudUniversalLibraryID(v21);
  mlcore::SortDescriptor::SortDescriptor();
  v72 = 0uLL;
  v73 = 0;
  v70 = (void **)&v72;
  LOBYTE(v71) = 0;
  v23 = operator new(0x18uLL);
  v73 = (char *)(v23 + 3);
  v24 = v76;
  *v23 = MEMORY[0x1E0D4AF48] + 16;
  v23[1] = v24;
  *((_DWORD *)v23 + 4) = v77;
  *(_QWORD *)&v72 = v23;
  *((_QWORD *)&v72 + 1) = v23 + 3;
  mlcore::PropertiesQuery::setSortDescriptors();
  v70 = (void **)&v72;
  std::vector<mlcore::SortDescriptor>::__destroy_vector::operator()[abi:ne180100](&v70);
  v59 = 0;
  v60 = 0;
  __p = 0;
  std::vector<mlcore::ModelPropertyBase *>::__init_with_size[abi:ne180100]<mlcore::ModelPropertyBase **,mlcore::ModelPropertyBase **>(&__p, v21, (uint64_t)v21 + 16, 2uLL);
  mlcore::PropertiesQuery::setPropertiesToFetch();
  if (__p)
  {
    v59 = __p;
    operator delete(__p);
  }
  v25 = v66;
  v56 = v22;
  v57 = v62;
  if (v62)
  {
    p_shared_owners = (unint64_t *)&v62->__shared_owners_;
    do
      v27 = __ldxr(p_shared_owners);
    while (__stxr(v27 + 1, p_shared_owners));
  }
  v55 = 0;
  if (v25)
  {
    objc_msgSend(v25, "resultsForCoreQuery:error:", &v56, &v55);
    v28 = v55;
  }
  else
  {
    v28 = 0;
    v75 = 0;
    v76 = 0;
  }
  v29 = v57;
  if (v57)
  {
    v30 = (unint64_t *)&v57->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v54 = 0;
  if (v75)
  {
    v32 = v76;
    v70 = v75;
    v71 = v76;
    if (v76)
    {
      v33 = (unint64_t *)&v76->__shared_owners_;
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }
    v35 = (__int128 *)operator new(0x40uLL);
    *(_QWORD *)v35 = &off_1E3149D10;
    *((_QWORD *)v35 + 1) = &v64;
    *((_QWORD *)v35 + 2) = &v68;
    *((_QWORD *)v35 + 3) = &v66;
    *((_QWORD *)v35 + 4) = v69;
    *((_QWORD *)v35 + 5) = &v67;
    *((_QWORD *)v35 + 6) = &v54;
    *((_QWORD *)v35 + 7) = &v65;
    v74 = v35;
    mlcore::PropertiesQueryResult::enumerateResults();
    v36 = v74;
    if (v74 == &v72)
    {
      v37 = 4;
      v36 = &v72;
    }
    else
    {
      if (!v74)
      {
LABEL_23:
        if (v32)
        {
          v38 = (unint64_t *)&v32->__shared_owners_;
          do
            v39 = __ldaxr(v38);
          while (__stlxr(v39 - 1, v38));
          if (!v39)
          {
            ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
            std::__shared_weak_count::__release_weak(v32);
          }
        }
        goto LABEL_28;
      }
      v37 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v36 + 8 * v37))();
    goto LABEL_23;
  }
LABEL_28:
  switch(a6)
  {
    case 1:
    case 2:
      if (!v54)
        goto LABEL_31;
      +[MPStoreLibraryPersonalizationCollectionDataSource _lightweightPersonalizedObjectWithUnpersonalizedObject:libraryObject:personalizationProperties:overrideLibraryAddedStatus:](MPStoreLibraryPersonalizationCollectionDataSource, "_lightweightPersonalizedObjectWithUnpersonalizedObject:libraryObject:personalizationProperties:overrideLibraryAddedStatus:", v69[0], v54, v67, 0);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    case 3:
      v42 = v54;
      if (!v54)
        v42 = v69[0];
      goto LABEL_36;
    case 4:
      v42 = v54;
LABEL_36:
      v40 = v42;
LABEL_37:
      v41 = v40;
      if (v40)
      {
        -[MPMutableSectionedCollection appendSection:](v15, "appendSection:", &stru_1E3163D10);
        -[MPMutableSectionedCollection appendItem:](v15, "appendItem:", v41);
      }
      break;
    default:
LABEL_31:
      v41 = 0;
      break;
  }
  -[MPModelResponse setResults:](v14, "setResults:", v15);

  v43 = v76;
  if (v76)
  {
    v44 = (unint64_t *)&v76->__shared_owners_;
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }

  operator delete(v21);
  v46 = v62;
  if (v62)
  {
    v47 = (unint64_t *)&v62->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  v49 = (std::__shared_weak_count *)*((_QWORD *)&v63 + 1);
  if (*((_QWORD *)&v63 + 1))
  {
    v50 = (unint64_t *)(*((_QWORD *)&v63 + 1) + 8);
    do
      v51 = __ldaxr(v50);
    while (__stlxr(v51 - 1, v50));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }

  return v14;
}

+ (void)_personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:
{
}

+ (__n128)_personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_QWORD *)a2 = &off_1E3149D10;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  v4 = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(a2 + 56) = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v4;
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

+ (uint64_t)_personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z208+[MPStoreLibraryPersonalizationRequestOperation _personalizedArtistResponseForStoreID:modelObject:groupingKey:personalizationStyle:personalizationProperties:libraryView:libraryRequest:matchingStoreIDAndName:]E3$_2"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

+ (void)personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:
{
}

+ (__n128)personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_1E3149C60;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

+ (uint64_t)personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z143+[MPStoreLibraryPersonalizationRequestOperation personalizedResponseForContentDescriptor:requestedProperties:matchAlbumArtistOnStoreIdAndName:]E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end
