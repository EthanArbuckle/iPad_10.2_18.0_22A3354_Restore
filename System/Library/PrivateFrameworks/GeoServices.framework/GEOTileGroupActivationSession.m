@implementation GEOTileGroupActivationSession

- (GEOTileGroupActivationSession)initWithIdentifier:(id)a3 configuration:(id)a4 tileGroup:(id)a5 inResourceManifest:(id)a6 environmentName:(id)a7 oldTileGroup:(id)a8 activeScales:(id)a9 activeScenarios:(id)a10 activeNames:(id)a11 dataSet:(id)a12 migrators:(id)a13 updateType:(int64_t)a14 delegate:(id)a15 delegateQueue:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  GEOTileGroupActivationSession *v26;
  uint64_t v27;
  OS_dispatch_queue *workQueue;
  uint64_t v29;
  NSProgress *progress;
  uint64_t v31;
  NSString *uniqueIdentifier;
  uint64_t v33;
  GEOResources *resourceManifest;
  uint64_t v35;
  NSString *environmentName;
  uint64_t v37;
  NSArray *migrators;
  GEOTileGroupActivationSession *v39;
  id obj;
  id v42;
  id v43;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  objc_super v52;

  v43 = a3;
  obj = a4;
  v51 = a4;
  v42 = a5;
  v50 = a5;
  v21 = a6;
  v22 = a7;
  v49 = a8;
  v48 = a9;
  v47 = a10;
  v46 = a11;
  v45 = a12;
  v23 = a13;
  v24 = a15;
  v25 = a16;
  v52.receiver = self;
  v52.super_class = (Class)GEOTileGroupActivationSession;
  v26 = -[GEOTileGroupActivationSession init](&v52, sel_init);
  if (v26)
  {
    v27 = geo_dispatch_queue_create();
    workQueue = v26->_workQueue;
    v26->_workQueue = (OS_dispatch_queue *)v27;

    v26->_started.lock._os_unfair_lock_opaque = 0;
    v26->_started.didRun = 0;
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
    v29 = objc_claimAutoreleasedReturnValue();
    progress = v26->_progress;
    v26->_progress = (NSProgress *)v29;

    v26->_finished[0].lock._os_unfair_lock_opaque = 0;
    v26->_finished[0].didRun = 0;
    v26->_finished[1].lock._os_unfair_lock_opaque = 0;
    v26->_finished[1].didRun = 0;
    objc_storeWeak((id *)&v26->_delegate, v24);
    objc_storeStrong((id *)&v26->_delegateQueue, a16);
    v31 = objc_msgSend(v43, "copy");
    uniqueIdentifier = v26->_uniqueIdentifier;
    v26->_uniqueIdentifier = (NSString *)v31;

    objc_storeStrong((id *)&v26->_configuration, obj);
    objc_storeStrong((id *)&v26->_newTileGroup, v42);
    v33 = objc_msgSend(v21, "copy");
    resourceManifest = v26->_resourceManifest;
    v26->_resourceManifest = (GEOResources *)v33;

    v35 = objc_msgSend(v22, "copy");
    environmentName = v26->_environmentName;
    v26->_environmentName = (NSString *)v35;

    objc_storeStrong((id *)&v26->_activeTileGroup, a8);
    objc_storeStrong((id *)&v26->_activeScales, a9);
    objc_storeStrong((id *)&v26->_activeScenarios, a10);
    objc_storeStrong((id *)&v26->_activeNames, a11);
    objc_storeStrong((id *)&v26->_dataSet, a12);
    v37 = objc_msgSend(v23, "copy");
    migrators = v26->_migrators;
    v26->_migrators = (NSArray *)v37;

    v26->_updateType = a14;
    GEORegisterPListStateCaptureLegacy();
    v39 = v26;
  }

  return v26;
}

- (void)dealloc
{
  objc_super v3;

  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)GEOTileGroupActivationSession;
  -[GEOTileGroupActivationSession dealloc](&v3, sel_dealloc);
}

- (void)start
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__GEOTileGroupActivationSession_start__block_invoke;
  v2[3] = &unk_1E1BFF6F8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_started, v2);
}

void __38__GEOTileGroupActivationSession_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__GEOTileGroupActivationSession_start__block_invoke_2;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __38__GEOTileGroupActivationSession_start__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  id obj;
  char *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD block[5];
  id v42;
  _QWORD v43[6];
  id v44;
  NSObject *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
    v2 = &GeoServicesConfig_TransactionsForMigration;
    if ((GEOConfigGetBOOL(GeoServicesConfig_TransactionsForMigration, (uint64_t)off_1EDF4D128) & 1) != 0)
    {
      _GEOCreateTransaction();
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(v1 + 168);
      *(_QWORD *)(v1 + 168) = v3;
    }
    else
    {
      v4 = *(void **)(v1 + 168);
      *(_QWORD *)(v1 + 168) = 0;
    }

    *(_QWORD *)(v1 + 48) = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(v1 + 152), "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = *(id *)(v1 + 152);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v38 != v9)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "taskForNewTileGroup:inResourceManifest:oldTileGroup:activeScales:activeScenarios:dataSet:updateType:", *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120), *(_QWORD *)(v1 + 128), *(_QWORD *)(v1 + 144), *(_QWORD *)(v1 + 160));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = objc_msgSend(v11, "estimatedWeight");
            objc_msgSend(v5, "addObject:", v12);
            if ((GEOConfigGetBOOL(*v2, v2[1]) & 1) != 0)
            {
              v14 = (objc_class *)objc_opt_class();
              NSStringFromClass(v14);
              v35 = v8;
              v15 = v7;
              v16 = v9;
              v17 = v2;
              v18 = v5;
              v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v33 = objc_msgSend(v19, "UTF8String");
              _GEOCreateTransaction();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setTransaction:", v20, v33);

              v5 = v18;
              v2 = v17;
              v9 = v16;
              v7 = v15;
              v8 = v35;
            }
            else
            {
              objc_msgSend(v12, "setTransaction:", 0);
            }
            v8 += v13;
            objc_msgSend(v12, "setOptions:", 0);
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

    objc_msgSend(*(id *)(v1 + 184), "setTotalUnitCount:", v8);
    GEOGetResourceManifestLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v52 = v5;
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEBUG, "Changing to new tile group requires the following mandatory migration tasks: %{public}@", buf, 0xCu);
    }

    v22 = *(void **)(v1 + 192);
    *(_QWORD *)(v1 + 192) = v5;

    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = dispatch_group_create();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v36 = *(id *)(v1 + 192);
    v25 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, buf, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v47 != v27)
            objc_enumerationMutation(v36);
          v29 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_msgSend(v29, "progress");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend(*(id *)(v1 + 184), "addChild:withPendingUnitCount:", v30, objc_msgSend(v29, "estimatedWeight"));
          dispatch_group_enter(v24);
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __60__GEOTileGroupActivationSession__runMandatoryMigrationTasks__block_invoke;
          v43[3] = &unk_1E1C02018;
          v43[4] = v1;
          v43[5] = v29;
          v44 = v23;
          v45 = v24;
          objc_msgSend(v29, "startWithCompletionHandler:callbackQueue:", v43, *(_QWORD *)(v1 + 8));

        }
        v26 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, buf, 16);
      }
      while (v26);
    }

    v31 = *(NSObject **)(v1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__GEOTileGroupActivationSession__runMandatoryMigrationTasks__block_invoke_9;
    block[3] = &unk_1E1C00738;
    block[4] = v1;
    v42 = v23;
    v32 = v23;
    dispatch_group_notify(v24, v31, block);

  }
}

void __60__GEOTileGroupActivationSession__runMandatoryMigrationTasks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOGetResourceManifestLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2114;
      v11 = v3;
      v6 = v9;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Tile group migration task '%{public}@' encountered error: %{public}@", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138543362;
      v9 = (id)objc_opt_class();
      v7 = v9;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Tile group migration task '%{public}@' finished successfully", (uint8_t *)&v8, 0xCu);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __60__GEOTileGroupActivationSession__runMandatoryMigrationTasks__block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  GEOActiveTileGroup *v10;
  void *v11;
  GEOActiveTileGroupReserved *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int *v22;
  unsigned int *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unsigned int v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  int v50;
  int v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  GEOActiveTileSet *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t m;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t n;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t ii;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  GEOAltitudeManifestVersionParser *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  unsigned int v110;
  unint64_t v111;
  id v112;
  void *v113;
  void *v114;
  NSObject *v115;
  void *v116;
  void *v117;
  GEOActiveTileGroupReserved *v118;
  void *v119;
  id v120;
  void **v121;
  id obj;
  uint64_t v123;
  GEOActiveTileGroup *v124;
  uint64_t v125;
  uint64_t v126;
  unsigned int v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _BYTE v157[12];
  __int16 v158;
  void *v159;
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE buf[12];
  __int16 v167;
  const __CFString *v168;
  uint64_t v169;

  v169 = *MEMORY[0x1E0C80C00];
  GEOGetResourceManifestLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    v5 = CFSTR("YES");
    if (!v4)
      v5 = CFSTR("NO");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v3;
    v167 = 2114;
    v168 = v5;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "All tile group migration tasks for '%{public}@' are complete (encountered errors: %{public}@)", buf, 0x16u);
  }

  v6 = objc_msgSend(*(id *)(a1 + 40), "count");
  v7 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:](*(_QWORD *)(a1 + 32), 0, *(void **)(a1 + 40));
    return;
  }
  if (!*(_BYTE *)(v7 + 40))
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 8));
    v9 = *(id *)(v7 + 72);
    v10 = objc_alloc_init(GEOActiveTileGroup);
    -[GEOActiveTileGroup setModelVersion:](v10, "setModelVersion:", 13);
    -[GEOActiveTileGroup setIdentifier:](v10, "setIdentifier:", objc_msgSend(*(id *)(v7 + 88), "identifier"));
    -[GEOActiveTileGroup setEnvironment:](v10, "setEnvironment:", *(_QWORD *)(v7 + 104));
    objc_msgSend(*(id *)(v7 + 96), "displayStrings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setDisplayStrings:](v10, "setDisplayStrings:", v11);

    if (*(_QWORD *)(v7 + 144))
      -[GEOActiveTileGroup setDataSet:](v10, "setDataSet:");
    v12 = objc_alloc_init(GEOActiveTileGroupReserved);
    if (objc_msgSend(*(id *)(v7 + 96), "hasAuthToken"))
    {
      objc_msgSend(*(id *)(v7 + 96), "authToken");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOActiveTileGroupReserved setAuthToken:](v12, "setAuthToken:", v13);

    }
    -[GEOActiveTileGroupReserved data](v12, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setReserved:](v10, "setReserved:", v14);

    if (objc_msgSend(*(id *)(v7 + 88), "attributionIndexsCount"))
    {
      v15 = 0;
      while (1)
      {
        v16 = objc_msgSend(*(id *)(v7 + 88), "attributionIndexAtIndex:", v15);
        if (objc_msgSend(*(id *)(v7 + 96), "attributionsCount") <= v16)
          break;
        objc_msgSend(*(id *)(v7 + 96), "attributionAtIndex:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "resourcesCount")
          || (objc_msgSend(v17, "hasLogo") & 1) == 0 && (objc_msgSend(v17, "hasBadge") & 1) == 0)
        {
          if (!*(_QWORD *)(v7 + 144)
            || !objc_msgSend(v17, "hasDataSet")
            || (v18 = objc_msgSend(v17, "dataSet"), v18 == objc_msgSend(*(id *)(v7 + 144), "identifier")))
          {
            -[GEOActiveTileGroup addAttribution:](v10, "addAttribution:", v17);
          }
        }

        if (++v15 >= (unint64_t)objc_msgSend(*(id *)(v7 + 88), "attributionIndexsCount"))
          goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attribution index %i outside of list length %lu"), v16, objc_msgSend(*(id *)(v7 + 96), "attributionsCount"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      GEOGetResourceManifestLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        goto LABEL_43;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v34;
      goto LABEL_42;
    }
LABEL_26:
    v19 = objc_msgSend(*(id *)(v7 + 88), "tileSets");
    v20 = objc_msgSend(*(id *)(v7 + 88), "tileSetsCount");
    if (v20)
    {
      v21 = v20;
      v22 = (unsigned int *)(v19 + 4);
      v23 = (unsigned int *)(v19 + 4);
      while (1)
      {
        v24 = *v22;
        v25 = objc_msgSend(*(id *)(v7 + 96), "tileSetsCount");
        v27 = *v23;
        v23 += 2;
        v26 = v27;
        if (v25 <= v24)
          break;
        objc_msgSend(*(id *)(v7 + 96), "tileSetAtIndex:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (!*(_QWORD *)(v7 + 144)
          || !objc_msgSend(v28, "hasDataSet")
          || (v30 = objc_msgSend(v29, "dataSet"), v30 == objc_msgSend(*(id *)(v7 + 144), "identifier")))
        {
          v31 = -[GEOActiveTileSet initWithTileSet:version:resourceManifest:]([GEOActiveTileSet alloc], v29, *(v22 - 1), *(void **)(v7 + 96));
          if (v31)
            -[GEOActiveTileGroup addTileSet:](v10, "addTileSet:", v31);

        }
        v22 = v23;
        if (!--v21)
          goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tile set index %i outside of list length %lu"), v26, objc_msgSend(*(id *)(v7 + 96), "tileSetsCount"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      GEOGetResourceManifestLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        goto LABEL_43;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v34;
LABEL_42:
      _os_log_impl(&dword_1885A9000, v35, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
LABEL_43:

      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, v34);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:](v7, 0, v37);

LABEL_137:
      return;
    }
LABEL_36:
    objc_msgSend(*(id *)(v7 + 80), "tileSetOverrides");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v9;
    v121 = (void **)v7;
    v118 = v12;
    if (v32)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v32);
      v33 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v33 = 0;
    }
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    obj = v32;
    v124 = v10;
    v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, buf, 16);
    if (v125)
    {
      v123 = *(_QWORD *)v154;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v154 != v123)
            objc_enumerationMutation(obj);
          v126 = v38;
          v39 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * v38);
          objc_msgSend(v39, "version");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "version");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v127 = objc_msgSend(v41, "unsignedIntValue");

          v151 = 0u;
          v152 = 0u;
          v149 = 0u;
          v150 = 0u;
          v42 = (void *)MEMORY[0x1E0C99D20];
          -[GEOActiveTileGroup tileSets](v10, "tileSets");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "arrayWithArray:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v149, v165, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v150;
            do
            {
              for (i = 0; i != v46; ++i)
              {
                if (*(_QWORD *)v150 != v47)
                  objc_enumerationMutation(v44);
                v49 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
                v50 = objc_msgSend(v49, "style");
                if (v50 == objc_msgSend(v39, "style"))
                {
                  v51 = objc_msgSend(v49, "size");
                  if (v51 == objc_msgSend(v39, "size"))
                  {
                    v52 = objc_msgSend(v49, "scale");
                    if (v52 == objc_msgSend(v39, "scale"))
                    {
                      if (v40)
                        objc_msgSend(v49, "setVersion:", v127);
                      objc_msgSend(v39, "baseURL");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v53)
                      {
                        objc_msgSend(v39, "baseURL");
                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v54, "absoluteString");
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v49, "setBaseURL:", v55);

                      }
                      objc_msgSend(v39, "localizationURL");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v56)
                      {
                        objc_msgSend(v39, "localizationURL");
                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v57, "absoluteString");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v49, "setLocalizationURL:", v58);

                      }
                      objc_msgSend(v33, "removeObject:", v39);
                    }
                  }
                }
              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v149, v165, 16);
            }
            while (v46);
          }

          v38 = v126 + 1;
          v10 = v124;
        }
        while (v126 + 1 != v125);
        v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, buf, 16);
      }
      while (v125);
    }

    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    v36 = v33;
    v59 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v145, v164, 16);
    v9 = v119;
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v146;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v146 != v61)
            objc_enumerationMutation(v36);
          v63 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * j);
          v64 = objc_alloc_init(GEOActiveTileSet);
          objc_msgSend(v63, "baseURL");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "absoluteString");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOActiveTileSet setBaseURL:](v64, "setBaseURL:", v66);

          objc_msgSend(v63, "localizationURL");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "absoluteString");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOActiveTileSet setLocalizationURL:](v64, "setLocalizationURL:", v68);

          -[GEOActiveTileSet setStyle:](v64, "setStyle:", objc_msgSend(v63, "style"));
          -[GEOActiveTileSet setSize:](v64, "setSize:", objc_msgSend(v63, "size"));
          -[GEOActiveTileSet setScale:](v64, "setScale:", objc_msgSend(v63, "scale"));
          objc_msgSend(v63, "version");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOActiveTileSet setVersion:](v64, "setVersion:", objc_msgSend(v69, "unsignedIntValue"));

          -[GEOActiveTileGroup addTileSet:](v10, "addTileSet:", v64);
        }
        v60 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v145, v164, 16);
      }
      while (v60);
    }

    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v70 = v121;
    v71 = v121[24];
    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v141, v163, 16);
    if (v72)
    {
      v73 = v72;
      v74 = *(_QWORD *)v142;
      do
      {
        for (k = 0; k != v73; ++k)
        {
          if (*(_QWORD *)v142 != v74)
            objc_enumerationMutation(v71);
          objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * k), "populateTileGroup:", v10);
        }
        v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v141, v163, 16);
      }
      while (v73);
    }

    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v76 = v121[15];
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v137, v162, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v138;
      do
      {
        for (m = 0; m != v78; ++m)
        {
          if (*(_QWORD *)v138 != v79)
            objc_enumerationMutation(v76);
          -[GEOActiveTileGroup addActiveScale:](v10, "addActiveScale:", objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * m), "intValue"));
        }
        v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v137, v162, 16);
      }
      while (v78);
    }

    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    v81 = v121[16];
    v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v133, v161, 16);
    v12 = v118;
    if (v82)
    {
      v83 = v82;
      v84 = *(_QWORD *)v134;
      do
      {
        for (n = 0; n != v83; ++n)
        {
          if (*(_QWORD *)v134 != v84)
            objc_enumerationMutation(v81);
          -[GEOActiveTileGroup addActiveScenario:](v10, "addActiveScenario:", objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * n), "intValue"));
        }
        v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v133, v161, 16);
      }
      while (v83);
    }

    if (-[GEOActiveTileGroup staleResourcesCount](v10, "staleResourcesCount"))
    {
      objc_msgSend(v119, "stringByAppendingFormat:", CFSTR(":stale=%lu"), -[GEOActiveTileGroup staleResourcesCount](v10, "staleResourcesCount"));
      v86 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v86;
    }
    -[GEOActiveTileGroup setUniqueIdentifier:](v10, "setUniqueIdentifier:", v9);
    if (objc_msgSend(v121[12], "announcementsSupportedLanguagesCount"))
    {
      objc_msgSend(v121[12], "announcementsSupportedLanguages");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOActiveTileGroup setAnnouncementsSupportedLanguages:](v10, "setAnnouncementsSupportedLanguages:", v87);

    }
    if (objc_msgSend(v121[12], "hasReleaseInfo"))
    {
      objc_msgSend(v121[12], "releaseInfo");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOActiveTileGroup setReleaseInfo:](v10, "setReleaseInfo:", v88);

    }
    objc_msgSend(v121[12], "locationShiftEnabledRegions");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setLocationShiftEnabledRegions:](v10, "setLocationShiftEnabledRegions:", v89);

    if (objc_msgSend(v121[12], "hasLocationShiftVersion"))
      -[GEOActiveTileGroup setLocationShiftVersion:](v10, "setLocationShiftVersion:", objc_msgSend(v121[12], "locationShiftVersion"));
    if (objc_msgSend(v121[11], "hybridUnavailableRegionsCount"))
      -[GEOActiveTileGroup setHybridUnavailableRegions:count:](v10, "setHybridUnavailableRegions:count:", objc_msgSend(v121[11], "hybridUnavailableRegions"), objc_msgSend(v121[11], "hybridUnavailableRegionsCount"));
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    -[GEOActiveTileGroup activeResources](v10, "activeResources");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v129, v160, 16);
    if (v91)
    {
      v92 = v91;
      v120 = v9;
      v93 = *(_QWORD *)v130;
      while (2)
      {
        for (ii = 0; ii != v92; ++ii)
        {
          if (*(_QWORD *)v130 != v93)
            objc_enumerationMutation(v90);
          v95 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * ii);
          if (objc_msgSend(v95, "resourceType") == 4)
          {
            objc_msgSend(v95, "filename");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = objc_msgSend(v96, "rangeOfString:", CFSTR("altitude"));

            if (v97 != 0x7FFFFFFFFFFFFFFFLL)
            {
              GEOResourcesPath(v121[10]);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "filename");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "stringByAppendingPathComponent:", v99);
              v100 = (void *)objc_claimAutoreleasedReturnValue();

              if (v100)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v100);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                v102 = -[GEOAltitudeManifestVersionParser initWithFileURL:]([GEOAltitudeManifestVersionParser alloc], "initWithFileURL:", v101);
                v128 = 0;
                -[GEOAltitudeManifestVersionParser parse:](v102, "parse:", &v128);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                v104 = v128;
                v105 = v104;
                if (v103)
                {

                  objc_msgSend(v103, "data");
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  v10 = v124;
                  -[GEOActiveTileGroup setFlyoverRegionVersions:](v124, "setFlyoverRegionVersions:", v106);

                  -[GEOActiveTileGroup _setDecodedFlyoverRegionVersions:](v124, "_setDecodedFlyoverRegionVersions:", v103);
                  v90 = v103;
                }
                else
                {
                  GEOGetResourceManifestLog();
                  v107 = objc_claimAutoreleasedReturnValue();
                  v10 = v124;
                  if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v157 = 138543618;
                    *(_QWORD *)&v157[4] = v100;
                    v158 = 2114;
                    v159 = v105;
                    _os_log_impl(&dword_1885A9000, v107, OS_LOG_TYPE_ERROR, "Failed to parse new altitude.xml file: %{public}@ -- %{public}@", v157, 0x16u);
                  }

                }
                v9 = v120;
                goto LABEL_124;
              }
            }
          }
        }
        v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v129, v160, 16);
        if (v92)
          continue;
        break;
      }
      v10 = v124;
LABEL_124:
      v70 = v121;
      v12 = v118;
    }

    objc_msgSend(v70[12], "muninBuckets");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setMuninBuckets:](v10, "setMuninBuckets:", v108);

    if (objc_msgSend(v70[12], "hasVersionManifest"))
    {
      objc_msgSend(v70[12], "versionManifest");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOActiveTileGroup setVersionManifest:](v10, "setVersionManifest:", v109);

    }
    if (objc_msgSend(v70[11], "hasOfflineMetadataIndex"))
    {
      v110 = objc_msgSend(v70[11], "offlineMetadataIndex");
      v111 = objc_msgSend(v70[12], "offlineMetadatasCount");
      v112 = v70[11];
      if (v111 <= v110)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Offline metadata index %i outside of list length %lu"), objc_msgSend(v112, "offlineMetadataIndex"), objc_msgSend(v70[12], "offlineMetadatasCount"));
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        GEOGetResourceManifestLog();
        v115 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v157 = 138543362;
          *(_QWORD *)&v157[4] = v114;
          _os_log_impl(&dword_1885A9000, v115, OS_LOG_TYPE_ERROR, "%{public}@", v157, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, v114);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v157 = v116;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v157, 1);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:]((uint64_t)v70, 0, v117);

        goto LABEL_136;
      }
      objc_msgSend(v70[12], "offlineMetadataAtIndex:", objc_msgSend(v112, "offlineMetadataIndex"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOActiveTileGroup setOfflineMetadata:](v10, "setOfflineMetadata:", v113);

    }
    if (objc_msgSend(v70[10], "requiresLegacyFormat"))
      -[GEOActiveTileGroup populateLegacyFormat](v10, "populateLegacyFormat");
    -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:]((uint64_t)v70, v10, 0);
LABEL_136:
    v34 = obj;
    goto LABEL_137;
  }
  GEOGetResourceManifestLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Tile group activation was previously canceled.", buf, 2u);
  }

}

- (void)_finishPhaseWithResult:(void *)a3 errors:
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (v5 || objc_msgSend(v6, "count") || *(_QWORD *)(a1 + 48))
    {
      v7 = a1 + 8 * *(_QWORD *)(a1 + 48) + 24;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke;
      v8[3] = &unk_1E1C01790;
      v8[4] = a1;
      v9 = v5;
      v10 = v6;
      GEOOnce(v7, v8);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: (activeTileGroup != ((void *)0) || errors.count > 0) || _phase != GEOTileGroupActivationSessionPhaseMandatory", buf, 2u);
    }
  }

}

void __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    GEOGetResourceManifestLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = (id)objc_opt_class();
      v18 = 2114;
      v19 = v3;
      v5 = v17;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "Opportunistic tile group migration task '%{public}@' encountered error: %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    GEOGetResourceManifestLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v17 = v7;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Opportunistic tile group migration task '%{public}@' succeeded. Allowing it to update the active tile group.", buf, 0xCu);
    }

    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "copy");
    objc_msgSend(*(id *)(a1 + 40), "populateTileGroup:", v8);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), v8);
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_34;
    block[3] = &unk_1E1C01790;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(NSObject **)(v9 + 64);
    block[1] = 3221225472;
    block[4] = v9;
    v14 = v8;
    v15 = v10;
    v12 = v8;
    dispatch_async(v11, block);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_34(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(int8x16_t *);
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_2;
  v7 = &unk_1E1C00738;
  objc_msgSend(WeakRetained, "activationSession:didChangeActiveTileGroup:completionHandler:", MEMORY[0x1E0C809B0], 3221225472, __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_2, &unk_1E1C00738, v3, *(_QWORD *)(a1 + 48));

}

void __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_2(int8x16_t *a1)
{
  int8x16_t v1;
  NSObject *v2;
  _QWORD v3[4];
  int8x16_t v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v1 = vextq_s8(a1[2], a1[2], 8uLL);
  v2 = *(NSObject **)(a1[2].i64[0] + 8);
  v3[1] = 3221225472;
  v3[2] = __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_3;
  v3[3] = &unk_1E1C00738;
  v4 = v1;
  dispatch_async(v2, v3);
}

void __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D764E2C]();
  objc_msgSend(*(id *)(a1 + 32), "removeOldData:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
  objc_autoreleasePoolPop(v2);
}

uint64_t __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "count");
    GEOGetResourceManifestLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v2)
    {
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        goto LABEL_11;
      v5 = objc_msgSend(*(id *)(a1 + 40), "count");
      v6 = v5 - objc_msgSend(*(id *)(a1 + 32), "count");
      v7 = objc_msgSend(*(id *)(a1 + 40), "count");
      v15 = 134349312;
      v16 = v6;
      v17 = 2050;
      v18 = v7;
      v8 = "%{public}lu (of %{public}lu) opportunistic tile group migrators succeeded. Will try again later.";
      v9 = v4;
      v10 = OS_LOG_TYPE_INFO;
      v11 = 22;
      goto LABEL_10;
    }
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
    LOWORD(v15) = 0;
    v8 = "All opportunistic tile group migrators succeeded. Done.";
    v9 = v4;
    v10 = OS_LOG_TYPE_DEBUG;
  }
  else
  {
    GEOGetResourceManifestLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    LOWORD(v15) = 0;
    v8 = "No opportunistic tile group migrators succeeded. Will try again later.";
    v9 = v4;
    v10 = OS_LOG_TYPE_ERROR;
  }
  v11 = 2;
LABEL_10:
  _os_log_impl(&dword_1885A9000, v9, v10, v8, (uint8_t *)&v15, v11);
LABEL_11:

  v12 = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    v13 = *(_QWORD *)(a1 + 32);
  else
    v13 = 0;
  return -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:](v12, 0, v13);
}

void __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[5];
  id v21;
  id v22;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 48);
  if (v3 == 1)
  {
    v10 = *(NSObject **)(v2 + 64);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_6;
    v16[3] = &unk_1E1C00738;
    v16[4] = v2;
    v17 = *(id *)(a1 + 48);
    dispatch_async(v10, v16);

  }
  else if (!v3)
  {
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      objc_storeStrong((id *)(v2 + 112), v4);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 1;
      v5 = *(id *)(*(_QWORD *)(a1 + 32) + 192);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      v8 = *(NSObject **)(v6 + 64);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_2;
      block[3] = &unk_1E1C01790;
      block[4] = v6;
      v21 = v7;
      v22 = v5;
      v9 = v5;
      dispatch_async(v8, block);

    }
    else
    {
      v11 = *(NSObject **)(v2 + 64);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_5;
      v18[3] = &unk_1E1C00738;
      v18[4] = v2;
      v19 = *(id *)(a1 + 48);
      dispatch_async(v11, v18);

    }
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 192);
    *(_QWORD *)(v12 + 192) = 0;

    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 168);
    *(_QWORD *)(v14 + 168) = 0;

  }
}

void __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_3;
  v5[3] = &unk_1E1C00738;
  v5[4] = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(WeakRetained, "activationSession:didChangeActiveTileGroup:completionHandler:", v3, v4, v5);

}

void __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_4;
  v4[3] = &unk_1E1C00738;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  NSObject *v22;
  id v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[4];
  id v31;
  id v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD v35[6];
  id v36;
  NSObject *v37;
  _QWORD *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[3];
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  uint8_t v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v49, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v27 != v4)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "removeOldData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v49, 16);
      }
      while (v3);
    }

    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 8));
      if (*(_QWORD *)(v6 + 48) != 1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _phase == GEOTileGroupActivationSessionPhaseOpportunistic", v52, 2u);
      }
      if (!*(_BYTE *)(v6 + 40))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(v6 + 152), "count"));
        obj = (id)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v7 = *(id *)(v6 + 152);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v46;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v46 != v9)
                objc_enumerationMutation(v7);
              v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v11, "opportunisticTaskForNewTileGroup:inResourceManifest:oldTileGroup:activeScales:activeScenarios:activeNames:dataSet:", *(_QWORD *)(v6 + 88), *(_QWORD *)(v6 + 96), *(_QWORD *)(v6 + 112), *(_QWORD *)(v6 + 120), *(_QWORD *)(v6 + 128), *(_QWORD *)(v6 + 136), *(_QWORD *)(v6 + 144));
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                if (v12)
                  objc_msgSend(obj, "addObject:", v12);

              }
            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
          }
          while (v8);
        }

        v13 = objc_msgSend(obj, "count") == 0;
        GEOGetResourceManifestLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "New tile group requests no opportunistic tasks. Done.", buf, 2u);
          }

          -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:](v6, 0, 0);
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v51 = obj;
            _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "New tile group requests the following opportunistic migration tasks: %{public}@", buf, 0xCu);
          }

          objc_storeStrong((id *)(v6 + 200), obj);
          v43[0] = 0;
          v43[1] = v43;
          v43[2] = 0x2020000000;
          v44 = 0;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = dispatch_group_create();
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v25 = obj;
          v18 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v40;
            do
            {
              for (k = 0; k != v18; ++k)
              {
                if (*(_QWORD *)v40 != v19)
                  objc_enumerationMutation(v25);
                v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
                dispatch_group_enter(v17);
                v35[0] = MEMORY[0x1E0C809B0];
                v35[1] = 3221225472;
                v35[2] = __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke;
                v35[3] = &unk_1E1C02040;
                v35[4] = v6;
                v35[5] = v21;
                v36 = v16;
                v38 = v43;
                v37 = v17;
                objc_msgSend(v21, "startWithCompletionHandler:callbackQueue:", v35, *(_QWORD *)(v6 + 8));

              }
              v18 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
            }
            while (v18);
          }

          v22 = *(NSObject **)(v6 + 8);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_4;
          block[3] = &unk_1E1C02068;
          v34 = v43;
          v31 = v16;
          v32 = v25;
          v33 = v6;
          v23 = v16;
          dispatch_group_notify(v17, v22, block);

          _Block_object_dispose(v43, 8);
        }

      }
    }
  }
}

void __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "activationSession:didCompleteWithErrors:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "activationSession:didCompleteWithErrors:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)cancel
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__GEOTileGroupActivationSession_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __39__GEOTileGroupActivationSession_cancel__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 192);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v6++), "cancel");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v4);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 200);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "cancel", (_QWORD)v15);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
    }
    while (v9);
  }

  v12 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", -2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:](v12, 0, v14);

}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[NSProgress fractionCompleted](self->_progress, "fractionCompleted");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("progress"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_phase);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("phase"));

  if (-[NSArray count](self->_mandatoryMigrationTasks, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_mandatoryMigrationTasks, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = self->_mandatoryMigrationTasks;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          _stateDescriptionForTask(*(void **)(*((_QWORD *)&v28 + 1) + 8 * v14), (uint64_t)a3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("mandatoryTasks"));
  }
  if (-[NSArray count](self->_opportunisticMigrationTasks, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_opportunisticMigrationTasks, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = self->_opportunisticMigrationTasks;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          _stateDescriptionForTask(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v21), (uint64_t)a3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22, (_QWORD)v24);

          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v19);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("opportunisticTasks"));
  }
  return v5;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opportunisticMigrationTasks, 0);
  objc_storeStrong((id *)&self->_mandatoryMigrationTasks, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_transaction, 0);
  objc_storeStrong((id *)&self->_migrators, 0);
  objc_storeStrong((id *)&self->_dataSet, 0);
  objc_storeStrong((id *)&self->_activeNames, 0);
  objc_storeStrong((id *)&self->_activeScenarios, 0);
  objc_storeStrong((id *)&self->_activeScales, 0);
  objc_storeStrong((id *)&self->_activeTileGroup, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_storeStrong((id *)&self->_newTileGroup, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
