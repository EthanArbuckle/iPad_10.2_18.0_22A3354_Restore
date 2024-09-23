@implementation GEOTileServerLocalProxy

void __105__GEOTileServerLocalProxy_tileRequester_receivedData_tileEdition_tileSetDB_tileSet_etag_forKey_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "userInfoForRequesterUserInfo:tileEdition:tileSet:eTag:bundleIdentifier:reason:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 72), *(unsigned int *)(a1 + 76), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "proxy:loadedTile:forKey:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), a1 + 81, v3);

}

- (id)userInfoForRequesterUserInfo:(id)a3 tileEdition:(unsigned int)a4 tileSet:(id)a5 eTag:(id)a6 bundleIdentifier:(id)a7 reason:(unsigned __int8)a8
{
  uint64_t v8;
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v8 = a8;
  v11 = *(_QWORD *)&a4;
  v13 = a6;
  v14 = a7;
  v15 = (id)objc_msgSend(a3, "mutableCopy");
  if (!v15)
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v15, "objectForKey:", CFSTR("GEOTileLoadResultSource"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("GEOTileLoadResultSource"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("OriginalLoadReason"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v19, CFSTR("GEOTileLoadResultIsPreliminary"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v20, CFSTR("tileEdition"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v21, CFSTR("tileSet"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v22, CFSTR("ProcessID"));

  if (objc_msgSend(v14, "length"))
    objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("GEOTileLoadResultRequestingAppBundleIdentifier"));
  if (objc_msgSend(v13, "length"))
    objc_msgSend(v15, "setObject:forKey:", v13, CFSTR("ETag"));

  return v15;
}

- (void)generateRequestedFromTileLoaderBeginSignpost:(os_signpost_id_t)a3 tileKey:(uint64_t)a4 options:(char)a5
{
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  uint8_t buf[2];

  GEOGetTileLoadingLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((a5 & 0x40) != 0)
  {
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      v9 = "PreliminaryOnly=1";
      v10 = buf;
      goto LABEL_8;
    }
  }
  else if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v11 = 0;
    v9 = (const char *)&unk_189D97683;
    v10 = (uint8_t *)&v11;
LABEL_8:
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, a3, "TileLoaderRequest.geod", v9, v10, 2u);
  }

}

- (void)generateRequestedFromTileLoaderEndSignpost:(unint64_t)a3
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  GEOGetTileLoadingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v5, OS_SIGNPOST_INTERVAL_END, a3, "TileLoaderRequest.geod", (const char *)&unk_189D97683, v6, 2u);
  }

}

- (void)loadTiles:(id)a3 batchID:(int)a4 priorities:(const unsigned int *)a5 hasAdditionalInfos:(const BOOL *)a6 additionalInfos:(const GEOTileLoaderAdditionalInfo *)a7 signpostIDs:(const unint64_t *)a8 createTimes:(const double *)a9 reason:(unsigned __int8)a10 options:(unint64_t)a11 auditToken:(id)a12
{
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  NSMapTable *providers;
  void *v20;
  id v21;
  void *v22;
  NSObject *delegateQueue;
  id v24;
  GEOTileServerLocalProxyBatchContext *v25;
  GEOTileKeyList *v26;
  NSObject *v27;
  GEOTileKeyList *v28;
  GEOTileKeyList *v29;
  GEOTileKeyList *v30;
  GEOTileKeyList *v31;
  GEOTileKeyMap *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  GEOTileKeyMap *v41;
  GEOTileKeyMap *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  void *v50;
  char v51;
  GEOTileKeyMap *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const unsigned int *v59;
  uint64_t v60;
  void *v61;
  _QWORD *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const GEOTileLoaderAdditionalInfo *v69;
  const BOOL *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  GEOTileKeyList *v74;
  id v75;
  GEOTileServerLocalProxyBatchContext *v76;
  GEOTileKeyMap *v77;
  GEOTileKeyMap *v78;
  GEOTileKeyMap *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t k;
  char *v88;
  void *v89;
  void *v90;
  os_signpost_id_t v91;
  NSObject *v92;
  NSObject *v93;
  __CFString *v94;
  void *v95;
  NSObject *v96;
  GEOTileDB *tileCache;
  OS_dispatch_queue *workQueue;
  uint64_t v99;
  NSObject *v100;
  GEOTileKeyMap *v101;
  GEOTileKeyMap *v102;
  GEOTileKeyList *v103;
  void *v104;
  unint64_t v105;
  SEL v106;
  void (**v107)(_QWORD);
  void *v108;
  void *v109;
  GEOTileKeyMap *v110;
  id v111;
  GEOTileServerLocalProxyBatchContext *v112;
  GEOTileKeyMap *v113;
  GEOTileServerLocalProxy *v114;
  void *v115;
  GEOTileServerLocalProxyBatchContext *v117;
  GEOTileKeyMap *v119;
  uint64_t v121;
  GEOTileKeyMap *v122;
  uint64_t v123;
  GEOTileKeyMap *v124;
  GEOTileKeyMap *v125;
  GEOTileKeyMap *v126;
  _QWORD v127[4];
  void (**v128)(_QWORD);
  _QWORD v129[5];
  GEOTileServerLocalProxyBatchContext *v130;
  id v131;
  GEOTileKeyMap *v132;
  GEOTileKeyMap *v133;
  GEOTileKeyMap *v134;
  GEOTileKeyList *v135;
  unsigned int v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[5];
  GEOTileKeyList *v142;
  id v143;
  GEOTileServerLocalProxyBatchContext *v144;
  GEOTileKeyMap *v145;
  GEOTileKeyMap *v146;
  GEOTileKeyMap *v147;
  GEOTileKeyMap *v148;
  GEOTileKeyMap *v149;
  GEOTileKeyMap *v150;
  id v151;
  unint64_t v152;
  void *v153;
  SEL v154;
  unsigned __int8 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  _QWORD block[5];
  id v173;
  id v174;
  _QWORD v175[5];
  id v176;
  __CFString *v177;
  _BYTE v178[128];
  GEOTileLoaderAdditionalInfo buf;
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  uint64_t v184;

  v184 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a12;
  if (objc_msgSend(v15, "count"))
  {
    v106 = a2;
    v111 = v16;
    v17 = a11 & (self->_tileCache == 0) ^ a11;
    v18 = *(_BYTE *)objc_msgSend(v15, "firstKey") & 0x7F;
    providers = self->_providers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[NSMapTable objectForKey:](providers, "objectForKey:", v20);

    v109 = v21;
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No provider registered can handle keys with provider %lu"), v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      delegateQueue = self->super._delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_2;
      block[3] = &unk_1E1C01790;
      block[4] = self;
      v173 = v15;
      v174 = v22;
      v24 = v22;
      dispatch_async(delegateQueue, block);

    }
    v25 = objc_alloc_init(GEOTileServerLocalProxyBatchContext);
    -[GEOTileServerLocalProxyBatchContext setFullList:](v25, "setFullList:", v15);
    v104 = (void *)objc_msgSend(v15, "copy");
    -[GEOTileServerLocalProxyBatchContext setInterestList:](v25, "setInterestList:");
    v105 = v17;
    if ((v17 & 1) != 0)
    {
      v28 = objc_alloc_init(GEOTileKeyList);
      v29 = objc_alloc_init(GEOTileKeyList);
      -[GEOTileServerLocalProxyBatchContext setCacheMissNoDataList:](v25, "setCacheMissNoDataList:", v29);

      v30 = objc_alloc_init(GEOTileKeyList);
      -[GEOTileServerLocalProxyBatchContext setCacheMissStaleDataList:](v25, "setCacheMissStaleDataList:", v30);

      v31 = objc_alloc_init(GEOTileKeyList);
      -[GEOTileServerLocalProxyBatchContext setCacheMissStaleUnusableDataList:](v25, "setCacheMissStaleUnusableDataList:", v31);

      v26 = v28;
    }
    else
    {
      v26 = (GEOTileKeyList *)v15;
    }
    v103 = v26;
    -[GEOTileServerLocalProxyBatchContext setRequesterList:](v25, "setRequesterList:");
    -[GEOTileServerLocalProxyBatchContext setLoadReason:](v25, "setLoadReason:", a10);
    -[GEOTileServerLocalProxyBatchContext setProactivelyLoadOnFailure:](v25, "setProactivelyLoadOnFailure:", (a11 >> 8) & 1);
    os_unfair_lock_lock_with_options();
    -[NSMutableArray addObject:](self->_inProgress, "addObject:", v25);
    os_unfair_lock_unlock(&self->_inProgressLock);
    v102 = -[GEOTileKeyMap initWithMapType:]([GEOTileKeyMap alloc], "initWithMapType:", 0);
    v101 = -[GEOTileKeyMap initWithMapType:]([GEOTileKeyMap alloc], "initWithMapType:", 0);
    v32 = [GEOTileKeyMap alloc];
    v114 = self;
    v115 = v15;
    v112 = v25;
    if (a8)
    {
      v126 = -[GEOTileKeyMap initWithMapType:capacity:](v32, "initWithMapType:capacity:", 0, objc_msgSend(v15, "count"));
      v168 = 0u;
      v169 = 0u;
      v170 = 0u;
      v171 = 0u;
      v33 = v15;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v168, v183, 16);
      if (v34)
      {
        v35 = v34;
        v36 = 0;
        v37 = *(_QWORD *)v169;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v169 != v37)
              objc_enumerationMutation(v33);
            v39 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a8[v36 + i]);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOTileKeyMap setObject:forKey:](v126, "setObject:forKey:", v40, v39);

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v168, v183, 16);
          v36 += i;
        }
        while (v35);
      }

      self = v114;
      v15 = v115;
      v25 = v112;
    }
    else
    {
      v126 = -[GEOTileKeyMap initWithMapType:capacity:](v32, "initWithMapType:capacity:", 0, 0);
    }
    v41 = [GEOTileKeyMap alloc];
    if (a9)
    {
      v42 = -[GEOTileKeyMap initWithMapType:capacity:](v41, "initWithMapType:capacity:", 0, objc_msgSend(v15, "count"));
      v164 = 0u;
      v165 = 0u;
      v166 = 0u;
      v167 = 0u;
      v43 = v15;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v164, v182, 16);
      if (v44)
      {
        v45 = v44;
        v46 = 0;
        v47 = *(_QWORD *)v165;
        do
        {
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v165 != v47)
              objc_enumerationMutation(v43);
            v49 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a9[v46 + j]);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOTileKeyMap setObject:forKey:](v42, "setObject:forKey:", v50, v49);

          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v164, v182, 16);
          v46 += j;
        }
        while (v45);
      }

      self = v114;
      v15 = v115;
      v25 = v112;
    }
    else
    {
      v42 = -[GEOTileKeyMap initWithMapType:capacity:](v41, "initWithMapType:capacity:", 0, 0);
    }
    v51 = a11;
    if (a5 && ((a11 & 2) != 0 || (objc_msgSend(v21, "requiresNetwork") & 1) == 0))
    {
      v52 = -[GEOTileKeyMap initWithMapType:capacity:]([GEOTileKeyMap alloc], "initWithMapType:capacity:", 0, objc_msgSend(v15, "count"));
      v160 = 0u;
      v161 = 0u;
      v162 = 0u;
      v163 = 0u;
      v53 = v15;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v160, v181, 16);
      if (v54)
      {
        v55 = v54;
        v56 = 0;
        v57 = *(_QWORD *)v161;
        do
        {
          v58 = 0;
          v123 = v56;
          v59 = &a5[v56];
          do
          {
            if (*(_QWORD *)v161 != v57)
              objc_enumerationMutation(v53);
            v60 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * v58);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v59[v58]);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOTileKeyMap setObject:forKey:](v52, "setObject:forKey:", v61, v60);

            ++v58;
          }
          while (v55 != v58);
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v160, v181, 16);
          v56 = v123 + v58;
        }
        while (v55);
      }

      self = v114;
      v15 = v115;
      v25 = v112;
      v51 = a11;
    }
    else
    {
      v52 = 0;
    }
    v124 = 0;
    v16 = v111;
    v62 = (_QWORD *)&unk_189CC1000;
    if (a6 && a7)
    {
      if ((v51 & 2) != 0 || (objc_msgSend(v109, "requiresNetwork") & 1) == 0)
      {
        v124 = -[GEOTileKeyMap initWithMapType:]([GEOTileKeyMap alloc], "initWithMapType:", 0);
        v156 = 0u;
        v157 = 0u;
        v158 = 0u;
        v159 = 0u;
        v63 = v15;
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v156, v180, 16);
        if (v64)
        {
          v65 = v64;
          v66 = 0;
          v67 = *(_QWORD *)v157;
          do
          {
            v68 = 0;
            v69 = &a7[v66];
            v121 = v66;
            v70 = &a6[v66];
            do
            {
              if (*(_QWORD *)v157 != v67)
                objc_enumerationMutation(v63);
              if (v70[v68])
              {
                v71 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * v68);
                buf = *v69;
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &buf, 16);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                -[GEOTileKeyMap setObject:forKey:](v124, "setObject:forKey:", v72, v71);

              }
              ++v68;
              ++v69;
            }
            while (v65 != v68);
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v156, v180, 16);
            v66 = v121 + v68;
          }
          while (v65);
        }

        v16 = v111;
        v25 = v112;
        self = v114;
        v62 = &unk_189CC1000;
      }
      else
      {
        v124 = 0;
      }
    }
    v141[0] = MEMORY[0x1E0C809B0];
    v73 = v62[96];
    v141[1] = v73;
    v141[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_3;
    v141[3] = &unk_1E1C026C0;
    v141[4] = self;
    v74 = v103;
    v142 = v74;
    v75 = v104;
    v143 = v75;
    v152 = v105;
    v153 = v109;
    v76 = v25;
    v144 = v76;
    v77 = v102;
    v145 = v77;
    v78 = v101;
    v146 = v78;
    v122 = v52;
    v147 = v122;
    v79 = v126;
    v148 = v79;
    v119 = v42;
    v149 = v119;
    v125 = v124;
    v150 = v125;
    v155 = a10;
    v151 = v16;
    v154 = v106;
    v80 = MEMORY[0x18D765024](v141);
    v81 = (void *)v80;
    if ((v105 & 1) != 0)
    {
      v107 = (void (**)(_QWORD))v80;
      v108 = v75;
      v110 = v78;
      v113 = v77;
      v117 = v76;
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v83 = v115;
      v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v137, v178, 16);
      if (v84)
      {
        v85 = v84;
        v86 = *(_QWORD *)v138;
        do
        {
          for (k = 0; k != v85; ++k)
          {
            if (*(_QWORD *)v138 != v86)
              objc_enumerationMutation(v83);
            v88 = *(char **)(*((_QWORD *)&v137 + 1) + 8 * k);
            if (*v88 < 0)
            {
              -[GEOTileKeyList _addKeyToBack:](v74, "_addKeyToBack:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * k));
            }
            else
            {
              -[GEOTileKeyMap objectForKey:](v79, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * k));
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = v89;
              if (v89)
              {
                v91 = objc_msgSend(v89, "unsignedLongLongValue");
                v136 = 1;
                GEOTileKeyStyle((uint64_t)v88, &v136);
                GEOGetTileLoadingLog();
                v92 = objc_claimAutoreleasedReturnValue();
                v93 = v92;
                if (v91 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v92))
                {
                  v94 = CFSTR("RASTER_STANDARD");
                  switch(v136)
                  {
                    case 0u:
                      break;
                    case 1u:
                      v94 = CFSTR("VECTOR_STANDARD");
                      break;
                    case 2u:
                      v94 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
                      break;
                    case 3u:
                      v94 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
                      break;
                    case 4u:
                      v94 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
                      break;
                    case 5u:
                      v94 = CFSTR("RASTER_STANDARD_BACKGROUND");
                      break;
                    case 6u:
                      v94 = CFSTR("RASTER_HYBRID");
                      break;
                    case 7u:
                      v94 = CFSTR("RASTER_SATELLITE");
                      break;
                    case 8u:
                      v94 = CFSTR("RASTER_TERRAIN");
                      break;
                    case 0xBu:
                      v94 = CFSTR("VECTOR_BUILDINGS");
                      break;
                    case 0xCu:
                      v94 = CFSTR("VECTOR_TRAFFIC");
                      break;
                    case 0xDu:
                      v94 = CFSTR("VECTOR_POI");
                      break;
                    case 0xEu:
                      v94 = CFSTR("SPUTNIK_METADATA");
                      break;
                    case 0xFu:
                      v94 = CFSTR("SPUTNIK_C3M");
                      break;
                    case 0x10u:
                      v94 = CFSTR("SPUTNIK_DSM");
                      break;
                    case 0x11u:
                      v94 = CFSTR("SPUTNIK_DSM_GLOBAL");
                      break;
                    case 0x12u:
                      v94 = CFSTR("VECTOR_REALISTIC");
                      break;
                    case 0x13u:
                      v94 = CFSTR("VECTOR_LEGACY_REALISTIC");
                      break;
                    case 0x14u:
                      v94 = CFSTR("VECTOR_ROADS");
                      break;
                    case 0x15u:
                      v94 = CFSTR("RASTER_VEGETATION");
                      break;
                    case 0x16u:
                      v94 = CFSTR("VECTOR_TRAFFIC_SKELETON");
                      break;
                    case 0x17u:
                      v94 = CFSTR("RASTER_COASTLINE_MASK");
                      break;
                    case 0x18u:
                      v94 = CFSTR("RASTER_HILLSHADE");
                      break;
                    case 0x19u:
                      v94 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
                      break;
                    case 0x1Au:
                      v94 = CFSTR("VECTOR_TRAFFIC_STATIC");
                      break;
                    case 0x1Bu:
                      v94 = CFSTR("RASTER_COASTLINE_DROP_MASK");
                      break;
                    case 0x1Cu:
                      v94 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
                      break;
                    case 0x1Du:
                      v94 = CFSTR("VECTOR_SPEED_PROFILES");
                      break;
                    case 0x1Eu:
                      v94 = CFSTR("VECTOR_VENUES");
                      break;
                    case 0x1Fu:
                      v94 = CFSTR("RASTER_DOWN_SAMPLED");
                      break;
                    case 0x20u:
                      v94 = CFSTR("RASTER_COLOR_BALANCED");
                      break;
                    case 0x21u:
                      v94 = CFSTR("RASTER_SATELLITE_NIGHT");
                      break;
                    case 0x22u:
                      v94 = CFSTR("SPUTNIK_VECTOR_BORDER");
                      break;
                    case 0x23u:
                      v94 = CFSTR("RASTER_SATELLITE_DIGITIZE");
                      break;
                    case 0x24u:
                      v94 = CFSTR("RASTER_HILLSHADE_PARKS");
                      break;
                    case 0x25u:
                      v94 = CFSTR("VECTOR_TRANSIT");
                      break;
                    case 0x26u:
                      v94 = CFSTR("RASTER_STANDARD_BASE");
                      break;
                    case 0x27u:
                      v94 = CFSTR("RASTER_STANDARD_LABELS");
                      break;
                    case 0x28u:
                      v94 = CFSTR("RASTER_HYBRID_ROADS");
                      break;
                    case 0x29u:
                      v94 = CFSTR("RASTER_HYBRID_LABELS");
                      break;
                    case 0x2Au:
                      v94 = CFSTR("FLYOVER_C3M_MESH");
                      break;
                    case 0x2Bu:
                      v94 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
                      break;
                    case 0x2Cu:
                      v94 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
                      break;
                    case 0x2Du:
                      v94 = CFSTR("RASTER_SATELLITE_ASTC");
                      break;
                    case 0x2Eu:
                      v94 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
                      break;
                    case 0x2Fu:
                      v94 = CFSTR("VECTOR_TRANSIT_SELECTION");
                      break;
                    case 0x30u:
                      v94 = CFSTR("VECTOR_COVERAGE");
                      break;
                    case 0x34u:
                      v94 = CFSTR("FLYOVER_METADATA");
                      break;
                    case 0x35u:
                      v94 = CFSTR("VECTOR_ROAD_NETWORK");
                      break;
                    case 0x36u:
                      v94 = CFSTR("VECTOR_LAND_COVER");
                      break;
                    case 0x37u:
                      v94 = CFSTR("VECTOR_DEBUG");
                      break;
                    case 0x38u:
                      v94 = CFSTR("VECTOR_STREET_POI");
                      break;
                    case 0x39u:
                      v94 = CFSTR("MUNIN_METADATA");
                      break;
                    case 0x3Au:
                      v94 = CFSTR("VECTOR_SPR_MERCATOR");
                      break;
                    case 0x3Bu:
                      v94 = CFSTR("VECTOR_SPR_MODELS");
                      break;
                    case 0x3Cu:
                      v94 = CFSTR("VECTOR_SPR_MATERIALS");
                      break;
                    case 0x3Du:
                      v94 = CFSTR("VECTOR_SPR_METADATA");
                      break;
                    case 0x3Eu:
                      v94 = CFSTR("VECTOR_TRACKS");
                      break;
                    case 0x3Fu:
                      v94 = CFSTR("VECTOR_RESERVED_2");
                      break;
                    case 0x40u:
                      v94 = CFSTR("VECTOR_STREET_LANDMARKS");
                      break;
                    case 0x41u:
                      v94 = CFSTR("COARSE_LOCATION_POLYGONS");
                      break;
                    case 0x42u:
                      v94 = CFSTR("VECTOR_SPR_ROADS");
                      break;
                    case 0x43u:
                      v94 = CFSTR("VECTOR_SPR_STANDARD");
                      break;
                    case 0x44u:
                      v94 = CFSTR("VECTOR_POI_V2");
                      break;
                    case 0x45u:
                      v94 = CFSTR("VECTOR_POLYGON_SELECTION");
                      break;
                    case 0x46u:
                      v94 = CFSTR("VL_METADATA");
                      break;
                    case 0x47u:
                      v94 = CFSTR("VL_DATA");
                      break;
                    case 0x48u:
                      v94 = CFSTR("PROACTIVE_APP_CLIP");
                      break;
                    case 0x49u:
                      v94 = CFSTR("VECTOR_BUILDINGS_V2");
                      break;
                    case 0x4Au:
                      v94 = CFSTR("POI_BUSYNESS");
                      break;
                    case 0x4Bu:
                      v94 = CFSTR("POI_DP_BUSYNESS");
                      break;
                    case 0x4Cu:
                      v94 = CFSTR("SMART_INTERFACE_SELECTION");
                      break;
                    case 0x4Du:
                      v94 = CFSTR("VECTOR_ASSETS");
                      break;
                    case 0x4Eu:
                      v94 = CFSTR("SPR_ASSET_METADATA");
                      break;
                    case 0x4Fu:
                      v94 = CFSTR("VECTOR_SPR_POLAR");
                      break;
                    case 0x50u:
                      v94 = CFSTR("SMART_DATA_MODE");
                      break;
                    case 0x51u:
                      v94 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
                      break;
                    case 0x52u:
                      v94 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
                      break;
                    case 0x53u:
                      v94 = CFSTR("VECTOR_TOPOGRAPHIC");
                      break;
                    case 0x54u:
                      v94 = CFSTR("VECTOR_POI_V2_UPDATE");
                      break;
                    case 0x55u:
                      v94 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
                      break;
                    case 0x56u:
                      v94 = CFSTR("VECTOR_TRAFFIC_V2");
                      break;
                    case 0x57u:
                      v94 = CFSTR("VECTOR_ROAD_SELECTION");
                      break;
                    case 0x58u:
                      v94 = CFSTR("VECTOR_REGION_METADATA");
                      break;
                    case 0x59u:
                      v94 = CFSTR("RAY_TRACING");
                      break;
                    case 0x5Au:
                      v94 = CFSTR("VECTOR_CONTOURS");
                      break;
                    case 0x5Bu:
                      v94 = CFSTR("RASTER_SATELLITE_POLAR");
                      break;
                    case 0x5Cu:
                      v94 = CFSTR("VMAP4_ELEVATION");
                      break;
                    case 0x5Du:
                      v94 = CFSTR("VMAP4_ELEVATION_POLAR");
                      break;
                    case 0x5Eu:
                      v94 = CFSTR("CELLULAR_COVERAGE_PLMN");
                      break;
                    case 0x5Fu:
                      v94 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
                      break;
                    case 0x60u:
                      v94 = CFSTR("UNUSED_96");
                      break;
                    case 0x61u:
                      v94 = CFSTR("UNUSED_97");
                      break;
                    case 0x62u:
                      v94 = CFSTR("UNUSED_98");
                      break;
                    case 0x63u:
                      v94 = CFSTR("UNUSED_99");
                      break;
                    case 0x64u:
                      v94 = CFSTR("UNUSED_100");
                      break;
                    case 0x65u:
                      v94 = CFSTR("UNUSED_101");
                      break;
                    case 0x66u:
                      v94 = CFSTR("UNUSED_102");
                      break;
                    case 0x67u:
                      v94 = CFSTR("UNUSED_103");
                      break;
                    case 0x68u:
                      v94 = CFSTR("UNUSED_104");
                      break;
                    case 0x69u:
                      v94 = CFSTR("UNUSED_105");
                      break;
                    case 0x6Au:
                      v94 = CFSTR("UNUSED_106");
                      break;
                    case 0x6Bu:
                      v94 = CFSTR("UNUSED_107");
                      break;
                    case 0x6Cu:
                      v94 = CFSTR("UNUSED_108");
                      break;
                    case 0x6Du:
                      v94 = CFSTR("UNUSED_109");
                      break;
                    case 0x6Eu:
                      v94 = CFSTR("UNUSED_110");
                      break;
                    case 0x6Fu:
                      v94 = CFSTR("UNUSED_111");
                      break;
                    case 0x70u:
                      v94 = CFSTR("UNUSED_112");
                      break;
                    case 0x71u:
                      v94 = CFSTR("UNUSED_113");
                      break;
                    case 0x72u:
                      v94 = CFSTR("UNUSED_114");
                      break;
                    case 0x73u:
                      v94 = CFSTR("UNUSED_115");
                      break;
                    case 0x74u:
                      v94 = CFSTR("UNUSED_116");
                      break;
                    case 0x75u:
                      v94 = CFSTR("UNUSED_117");
                      break;
                    case 0x76u:
                      v94 = CFSTR("UNUSED_118");
                      break;
                    case 0x77u:
                      v94 = CFSTR("UNUSED_119");
                      break;
                    default:
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v136);
                      v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      break;
                  }
                  buf.var0[0] = 138543362;
                  *(_QWORD *)&buf.var0[1] = v94;
                  _os_signpost_emit_with_name_impl(&dword_1885A9000, v93, OS_SIGNPOST_INTERVAL_BEGIN, v91, "CheckDiskCache", "Type=%{public}@", (uint8_t *)&buf, 0xCu);

                }
              }

            }
          }
          v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v137, v178, 16);
        }
        while (v85);
      }

      v95 = (void *)objc_msgSend(v83, "copy");
      objc_msgSend(v95, "removeKeysMatchingPredicate:", &__block_literal_global_17);
      if (objc_msgSend(v95, "count"))
      {
        v96 = dispatch_group_create();
        tileCache = v114->_tileCache;
        workQueue = v114->_workQueue;
        v99 = MEMORY[0x1E0C809B0];
        v129[0] = MEMORY[0x1E0C809B0];
        v129[1] = v73;
        v129[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_2_58;
        v129[3] = &unk_1E1C02730;
        v129[4] = v114;
        v130 = v117;
        v75 = v108;
        v131 = v108;
        v132 = v79;
        v133 = v113;
        v134 = v110;
        v135 = v74;
        -[GEOTileDB dataForKeys:reason:group:callbackQueue:dataHandler:](tileCache, "dataForKeys:reason:group:callbackQueue:dataHandler:", v95, a10, v96, workQueue, v129);
        v100 = v114->_workQueue;
        v127[0] = v99;
        v127[1] = v73;
        v127[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_2_61;
        v127[3] = &unk_1E1C01F48;
        v82 = v107;
        v128 = v107;
        dispatch_group_notify(v96, v100, v127);

      }
      else
      {
        v82 = v107;
        v107[2](v107);
        v75 = v108;
      }

      v16 = v111;
      v77 = v113;
      v76 = v117;
      v78 = v110;
    }
    else
    {
      (*(void (**)(uint64_t))(v80 + 16))(v80);
      v82 = v81;
    }

    v15 = v115;
  }
  else
  {
    v27 = self->super._delegateQueue;
    v175[0] = MEMORY[0x1E0C809B0];
    v175[1] = 3221225472;
    v175[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke;
    v175[3] = &unk_1E1C01790;
    v175[4] = self;
    v176 = v15;
    v177 = CFSTR("Must have at least one tile in list");
    dispatch_async(v27, v175);

  }
}

- (void)cancel:(__int128 *)a3 batchID:
{
  os_unfair_lock_s *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  id *v23;
  id v24;
  _QWORD *v25;
  id v26;
  os_unfair_lock_t lock;
  _QWORD block[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = (os_unfair_lock_s *)(a1 + 80);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = *(id *)(a1 + 72);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (!v7)
  {
    v9 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v8 = v7;
  lock = v5;
  v9 = 0;
  v10 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v31 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      objc_msgSend(v12, "interestList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsKey:", a3);

      if (v14)
      {
        v15 = v12;

        v9 = v15;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  }
  while (v8);

  if (v9)
  {
    objc_msgSend(v9, "interestList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeKey:", a3);

    objc_msgSend(v9, "tileRequester");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = lock;
    if (v17)
    {
      objc_msgSend(v9, "tileRequester");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "interestList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pendingRequesterList");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "intersectsList:", v19);

      if ((v20 & 1) != 0)
      {
        objc_msgSend(v9, "pendingRequesterList");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeKey:", a3);

        v36 = *a3;
        v22 = *(NSObject **)(a1 + 88);
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __42__GEOTileServerLocalProxy_cancel_batchID___block_invoke_2;
        v34[3] = &unk_1E1BFFD08;
        v23 = &v35;
        v35 = v6;
        v24 = v6;
        v25 = v34;
      }
      else
      {
        objc_msgSend(v6, "setContext:", 0);
        objc_msgSend(v9, "setTileRequester:", 0);
        objc_msgSend(*(id *)(a1 + 72), "removeObjectIdenticalTo:", v9);
        v22 = *(NSObject **)(a1 + 88);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __42__GEOTileServerLocalProxy_cancel_batchID___block_invoke;
        block[3] = &unk_1E1BFF6F8;
        v23 = &v29;
        v29 = v6;
        v26 = v6;
        v25 = block;
      }
      dispatch_async(v22, v25);

      goto LABEL_18;
    }
  }
  else
  {
    v5 = lock;
  }
LABEL_19:
  os_unfair_lock_unlock(v5);

}

- (void)tileRequester:(void *)a3 receivedData:(void *)a4 tileEdition:(int)a5 tileSetDB:(unsigned int)a6 tileSet:(void *)a7 etag:(void *)a8 forKey:(__int128)a9 userInfo:(void *)a10
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int IsCacheable;
  os_unfair_lock_s *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  id v41;
  _BOOL4 IsAllowable;
  id v43;
  _QWORD block[5];
  id v45;
  id v46;
  id v47;
  id v48;
  int v49;
  unsigned int v50;
  char v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  HIDWORD(v39) = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v53 = a9;
  v14 = a3;
  v41 = a4;
  v43 = a8;
  v15 = a10;
  v16 = a7;
  objc_msgSend(v14, "deviceCountry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deviceRegion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "devicePostureCountry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "devicePostureRegion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  IsAllowable = _GEOTileResponseIsAllowable(v16, v17, v18, v19, v20);

  v21 = v15;
  IsCacheable = _GEOTileResponseIsCacheable((unsigned __int8 *)&v53, v15);
  v23 = (os_unfair_lock_s *)(a1 + 80);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  objc_msgSend(v14, "context");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
    v26 = objc_msgSend(v24, "loadReason");
  else
    v26 = 0;
  if ((IsCacheable & IsAllowable) == 1)
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("CachedDataWasCurrent"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = objc_msgSend(v27, "BOOLValue");
    else
      v28 = 0;
    BYTE1(v39) = v28;
    LOBYTE(v39) = v26;
    objc_msgSend(*(id *)(a1 + 48), "addData:forKey:edition:set:provider:etag:reason:isIdenticalToExistingStaleData:", v41, &v53, HIDWORD(v39), a6, v53 & 0x7F, v43, v39);

  }
  if (v25)
  {
    objc_msgSend(v25, "pendingRequesterList");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeKey:", &v53);

    objc_msgSend(v25, "interestList");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "containsKey:", &v53);

    os_unfair_lock_unlock(v23);
    if ((v31 & IsAllowable) == 1)
    {
      objc_msgSend(v14, "tileRequest");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "auditToken");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bundleId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v26;
      v36 = (void *)objc_msgSend(v34, "copy");

      v37 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __105__GEOTileServerLocalProxy_tileRequester_receivedData_tileEdition_tileSetDB_tileSet_etag_forKey_userInfo___block_invoke;
      block[3] = &unk_1E1C02758;
      block[4] = a1;
      v45 = v21;
      v49 = HIDWORD(v39);
      v50 = a6;
      v46 = v43;
      v47 = v36;
      v51 = v35;
      v48 = v41;
      v52 = v53;
      v38 = v36;
      dispatch_async(v37, block);

    }
  }
  else
  {
    os_unfair_lock_unlock(v23);
  }

}

- (GEOTileServerLocalProxy)initWithCacheDBLocation:(id)a3 cacheFilesLocation:(id)a4 manifestConfiguration:(id)a5 locale:(id)a6 delegateQueue:(id)a7 delegate:(id)a8
{
  id v14;
  id v15;
  GEOTileServerLocalProxy *v16;
  NSMutableArray *v17;
  NSMutableArray *inProgress;
  uint64_t v19;
  OS_dispatch_queue *workQueue;
  uint64_t v21;
  NSMapTable *providers;
  GEOTileDB *v23;
  GEOTileDB *tileCache;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  GEOResourceManifestConfiguration *manifestConfiguration;
  void *v33;
  void *v34;
  objc_super v36;

  v14 = a3;
  v15 = a4;
  v36.receiver = self;
  v36.super_class = (Class)GEOTileServerLocalProxy;
  v16 = -[GEOTileServerProxy initWithCacheDBLocation:cacheFilesLocation:manifestConfiguration:locale:delegateQueue:delegate:](&v36, sel_initWithCacheDBLocation_cacheFilesLocation_manifestConfiguration_locale_delegateQueue_delegate_, v14, v15, a5, a6, a7, a8);
  if (!v16)
    goto LABEL_12;
  v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  inProgress = v16->_inProgress;
  v16->_inProgress = v17;

  v16->_inProgressLock._os_unfair_lock_opaque = 0;
  v19 = geo_dispatch_queue_create();
  workQueue = v16->_workQueue;
  v16->_workQueue = (OS_dispatch_queue *)v19;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v21 = objc_claimAutoreleasedReturnValue();
  providers = v16->_providers;
  v16->_providers = (NSMapTable *)v21;

  if (v14)
  {
    v23 = -[GEOTileDB initWithDBDirectory:externalFilesDirectory:]([GEOTileDB alloc], "initWithDBDirectory:externalFilesDirectory:", v14, v15);
    tileCache = v16->_tileCache;
    v16->_tileCache = v23;

    -[GEOTileDB registerObserver:queue:](v16->_tileCache, "registerObserver:queue:", v16, v16->_workQueue);
    +[GEOMapDataSubscriptionExpirationHelper sharedHelper](GEOMapDataSubscriptionExpirationHelper, "sharedHelper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "configureWithDB:", v16->_tileCache);

  }
  -[GEOTileServerLocalProxy _registerBuiltInProviders](v16, "_registerBuiltInProviders");
  +[GEOResourceManifestManager modernManagerForConfiguration:](GEOResourceManifestManager, "modernManagerForConfiguration:", v16->super._manifestConfiguration);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addTileGroupObserver:queue:", v16, v16->_workQueue);

  -[GEOTileServerLocalProxy _updateExpiringTilesets](v16, "_updateExpiringTilesets");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", v16, sel__deleteLocationSensitiveInformation_, CFSTR("GEOLocationServicesDisabledNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", v16, sel__deleteLocationSensitiveInformation_, kGEOResetPrivacyWarningsNotification, 0);

  +[GEOPrivacyManager sharedManager](GEOPrivacyManager, "sharedManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "hasFiredResetPrivacyWarningsNotification"))
  {

LABEL_7:
    -[GEOTileServerLocalProxy _deleteLocationSensitiveInformation:](v16, "_deleteLocationSensitiveInformation:", 0);
    goto LABEL_8;
  }
  +[GEOPrivacyManager sharedManager](GEOPrivacyManager, "sharedManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "hasFiredLocationServicesDisabledNotification");

  if (v31)
    goto LABEL_7;
LABEL_8:
  if (_cdsObserversEnabled == 1)
  {
    manifestConfiguration = v16->super._manifestConfiguration;
    if (!manifestConfiguration
      || -[GEOResourceManifestConfiguration isDefaultConfiguration](manifestConfiguration, "isDefaultConfiguration"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObserver:selector:name:object:", v16, sel__forceDataSaverPreload_, CFSTR("GEOTileServerLocalProxyForceExplicitProactiveTileDownloadRun"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObserver:selector:name:object:", v16, sel__didAddSubscription_, 0x1E1CA61B0, 0);

    }
  }
LABEL_12:

  return v16;
}

- (void)_updateExpiringTilesets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double *v12;
  unint64_t v13;
  double *v14;
  void *v15;
  __int16 v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[GEOResourceManifestManager modernManagerForConfiguration:](GEOResourceManifestManager, "modernManagerForConfiguration:", self->super._manifestConfiguration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeTileGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "tileSets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasTimeToLiveSeconds")
          && objc_msgSend(v11, "timeToLiveSeconds"))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v12 = (double *)malloc_type_malloc(16 * objc_msgSend(v5, "count"), 0x1000040F7F8B94BuLL);
    if (objc_msgSend(v5, "count"))
    {
      v13 = 0;
      v14 = v12 + 1;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "style");
        v17 = objc_msgSend(v15, "scale");
        *((_DWORD *)v14 - 2) = ((v16 & 0x3FFF | ((objc_msgSend(v15, "size") & 0xF) << 14) & 0xFFC3FFFF | ((v17 & 0xF) << 18)) << 8) | 1;
        *v14 = (double)objc_msgSend(v15, "timeToLiveSeconds");
        v14 += 2;

        ++v13;
      }
      while (v13 < objc_msgSend(v5, "count"));
    }
    -[GEOTileDB setExpirationRecords:count:](self->_tileCache, "setExpirationRecords:count:", v12, objc_msgSend(v5, "count"));
    free(v12);
  }
  else
  {
    -[GEOTileDB setExpirationRecords:count:](self->_tileCache, "setExpirationRecords:count:", 0, 0);
  }

}

- (void)_registerBuiltInProviders
{
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
  -[GEOTileServerLocalProxy registerProvider:](self, "registerProvider:", objc_opt_class());
}

- (void)registerProvider:(Class)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[objc_class tileProviderIdentifier](a3, "tileProviderIdentifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](self->_providers, "setObject:forKey:", a3, v5);

}

uint64_t __42__GEOTileServerLocalProxy_cancel_batchID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelKey:", a1 + 40);
}

void __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  GEOTileRequest *v18;
  GEOTileRequest *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD block[5];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  v2 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_4;
  v29[3] = &unk_1E1C02698;
  v3 = *(void **)(a1 + 40);
  v30 = *(id *)(a1 + 48);
  objc_msgSend(v3, "removeKeysMatchingPredicate:", v29);
  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
    goto LABEL_5;
  if ((*(_BYTE *)(a1 + 120) & 2) == 0 && (objc_msgSend(*(id *)(a1 + 128), "requiresNetwork") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(*(SEL *)(a1 + 136));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is not allowed to use the network, but needs it in order to continue"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "GEOErrorWithCode:reason:", -6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v11 = *(NSObject **)(v9 + 16);
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_6;
    block[3] = &unk_1E1C01790;
    block[4] = v9;
    v25 = v10;
    v26 = v8;
    v12 = v8;
    dispatch_async(v11, block);

LABEL_5:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 56));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
    goto LABEL_10;
  }
  if (objc_msgSend(*(id *)(a1 + 128), "requiresNetwork"))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v15 = *(NSObject **)(v13 + 16);
    v27[0] = v2;
    v27[1] = 3221225472;
    v27[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_5;
    v27[3] = &unk_1E1C00738;
    v27[4] = v13;
    v28 = v14;
    dispatch_async(v15, v27);

  }
  v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 56), "setPendingRequesterList:", v16);
  v17 = (2 * *(_DWORD *)(a1 + 120)) & 0x10;
  v18 = [GEOTileRequest alloc];
  BYTE1(v23) = *(_BYTE *)(a1 + 144);
  LOBYTE(v23) = 1;
  v19 = -[GEOTileRequest initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:](v18, "initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), v17, 0, v23);
  v20 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 128)), "initWithTileRequest:delegateQueue:delegate:", v19, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(v20, "setContext:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 56), "setTileRequester:", v20);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "devicePostureCountry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDeviceCountry:", v21);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "devicePostureRegion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDeviceRegion:", v22);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  if (v20)
  {
    objc_msgSend(v20, "start");

  }
LABEL_10:

}

uint64_t __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsKey:", a2) ^ 1;
}

- (void)tileRequesterFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *delegateQueue;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;

  v4 = a3;
  os_unfair_lock_lock(&self->_inProgressLock);
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "pendingRequesterList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(v6, "requesterList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      objc_msgSend(v6, "pendingRequesterList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      v13 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ loaded %ld of %ld needed tiles and then claimed it was finished"), v4, v10 - v12, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "GEOErrorWithCode:reason:", -7, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "pendingRequesterList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      delegateQueue = self->super._delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__GEOTileServerLocalProxy_tileRequesterFinished___block_invoke;
      block[3] = &unk_1E1C01790;
      block[4] = self;
      v21 = v16;
      v22 = v15;
      v18 = v15;
      v19 = v16;
      dispatch_async(delegateQueue, block);

    }
    -[NSMutableArray removeObjectIdenticalTo:](self->_inProgress, "removeObjectIdenticalTo:", v6);
    objc_msgSend(v4, "setContext:", 0);
    objc_msgSend(v4, "tearDown");
    objc_msgSend(v6, "setTileRequester:", 0);
  }
  os_unfair_lock_unlock(&self->_inProgressLock);

}

void __52__GEOTileServerLocalProxy_calculateFreeableSizeSync__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "proxy:canShrinkDiskCacheByAmount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "proxy:willGoToNetworkForTiles:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (unint64_t)calculateFreeableSizeSync
{
  unint64_t v3;
  NSObject *delegateQueue;
  _QWORD v6[6];

  v3 = -[GEOTileDB calculateFreeableSizeSync](self->_tileCache, "calculateFreeableSizeSync");
  delegateQueue = self->super._delegateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__GEOTileServerLocalProxy_calculateFreeableSizeSync__block_invoke;
  v6[3] = &unk_1E1BFF6D0;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(delegateQueue, v6);
  return v3;
}

uint64_t __42__GEOTileServerLocalProxy_cancel_batchID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

+ (void)enableCDSObserversIfNecessary
{
  _cdsObserversEnabled = 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[GEOResourceManifestManager modernManagerForConfiguration:](GEOResourceManifestManager, "modernManagerForConfiguration:", self->super._manifestConfiguration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTileGroupObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)GEOTileServerLocalProxy;
  -[GEOTileServerProxy dealloc](&v5, sel_dealloc);
}

- (void)runOpportunisticTileDownloader:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *workQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  GEOGetProactiveTileDownloadLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Starting proactive downloader", buf, 2u);
  }

  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__GEOTileServerLocalProxy_runOpportunisticTileDownloader___block_invoke;
  v8[3] = &unk_1E1C00738;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(workQueue, v8);

}

uint64_t __58__GEOTileServerLocalProxy_runOpportunisticTileDownloader___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initiateDataSaverPreloadIfPossible:", *(_QWORD *)(a1 + 40));
}

- (void)close
{
  -[GEOTileDB flushPendingWritesWithGroup:](self->_tileCache, "flushPendingWritesWithGroup:", 0);
}

- (void)reprioritizeKey:(__int128 *)a3 newPriority:(int)a4 batchID:
{
  os_unfair_lock_s *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  os_unfair_lock_t lock;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD block[4];
  id v28;
  int v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = (os_unfair_lock_s *)(a1 + 80);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = *(id *)(a1 + 72);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (!v9)
  {
    v11 = 0;
    goto LABEL_14;
  }
  v10 = v9;
  v21 = a4;
  lock = v7;
  v11 = 0;
  v12 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v24 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(v14, "interestList");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsKey:", a3);

      if (v16)
      {
        v17 = v14;

        v11 = v17;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  }
  while (v10);

  if (!v11)
  {
    v7 = lock;
    goto LABEL_16;
  }
  objc_msgSend(v11, "tileRequester");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = lock;
  if (v18)
  {
    objc_msgSend(v11, "tileRequester");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *a3;
    v20 = *(NSObject **)(a1 + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__GEOTileServerLocalProxy_reprioritizeKey_newPriority_batchID___block_invoke;
    block[3] = &unk_1E1BFFC18;
    v28 = v19;
    v29 = v21;
    v8 = v19;
    dispatch_async(v20, block);

LABEL_14:
  }
LABEL_16:
  os_unfair_lock_unlock(v7);

}

uint64_t __63__GEOTileServerLocalProxy_reprioritizeKey_newPriority_batchID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reprioritizeKey:newPriority:", a1 + 44, *(unsigned int *)(a1 + 40));
}

void __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  v2 = a1[4];
  v3 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "proxy:failedToLoadTiles:error:", v2, v3, v4);

}

void __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  v2 = a1[4];
  v3 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "proxy:failedToLoadTiles:error:", v2, v3, v4);

}

void __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_6(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "proxy:failedToLoadTiles:error:", a1[4], a1[5], a1[6]);

}

uint64_t __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_57(uint64_t a1, unsigned __int8 *a2)
{
  return *a2 >> 7;
}

BOOL __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_2_58(uint64_t a1, _OWORD *a2, void *a3, char a4, void *a5, char a6, double a7)
{
  id v12;
  id v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD block[4];
  id v31;
  uint64_t v32;
  id v33;
  char v34;
  char v35;
  __int128 v36;
  uint8_t buf[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  os_unfair_lock_lock_with_options();
  v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "indexOfObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
  v15 = objc_msgSend(*(id *)(a1 + 48), "containsKey:", a2);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(*(id *)(a1 + 56), "objectForKey:", a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = objc_msgSend(v16, "unsignedLongLongValue");
    GEOGetTileLoadingLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1885A9000, v20, OS_SIGNPOST_INTERVAL_END, v18, "CheckDiskCache", (const char *)&unk_189D97683, buf, 2u);
    }

  }
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_24;
  if (!v12)
  {
    objc_msgSend(*(id *)(a1 + 80), "_addKeyToBack:", a2);
    objc_msgSend(*(id *)(a1 + 40), "cacheMissNoDataList");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
    v27 = v22;
    objc_msgSend(v22, "addKey:", a2);

    goto LABEL_24;
  }
  if (!v15 || (a4 & 1) != 0)
  {
    if (!v15)
      goto LABEL_16;
  }
  else if (GEOConfigGetDouble(GeoServicesConfig_StaleTileDisplayAgeThreshold, (uint64_t)off_1EDF4D5B8) <= a7)
  {
    v21 = 1;
    if ((a4 & 1) != 0)
      goto LABEL_24;
    goto LABEL_17;
  }
  *(_OWORD *)buf = *a2;
  v23 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_59;
  block[3] = &unk_1E1C02708;
  v34 = a4;
  v24 = v13;
  v35 = a6;
  v25 = *(_QWORD *)(a1 + 32);
  v31 = v24;
  v32 = v25;
  v33 = v12;
  v36 = *(_OWORD *)buf;
  dispatch_async(v23, block);

LABEL_16:
  v21 = 0;
  if ((a4 & 1) == 0)
  {
LABEL_17:
    if (objc_msgSend(v13, "length"))
      objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v13, a2);
    objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v12, a2);
    objc_msgSend(*(id *)(a1 + 80), "_addKeyToBack:", a2);
    v26 = *(void **)(a1 + 40);
    if (v21)
      objc_msgSend(v26, "cacheMissStaleUnusableDataList");
    else
      objc_msgSend(v26, "cacheMissStaleDataList");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_24:

  return v14 != 0x7FFFFFFFFFFFFFFFLL;
}

void __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_59(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;

  v2 = *(_BYTE *)(a1 + 56) == 0;
  v3 = *(unsigned __int8 *)(a1 + 57);
  v4 = *(id *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, CFSTR("GEOTileLoadResultSource"), v7, CFSTR("GEOTileLoadResultIsPreliminary"), v8, CFSTR("OriginalLoadReason"), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    objc_msgSend(v10, "setObject:forKey:", v4, CFSTR("ETag"));

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "proxy:loadedTile:forKey:info:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1 + 58, v10);

}

uint64_t __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_2_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)tileRequester:(void *)a3 receivedError:(void *)a4 forKey:(uint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v17 = a5;
  *((_QWORD *)&v17 + 1) = a6;
  v8 = a3;
  v9 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  objc_msgSend(v8, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "pendingRequesterList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeKey:", &v17);

    v13 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__GEOTileServerLocalProxy_tileRequester_receivedError_forKey___block_invoke;
    block[3] = &unk_1E1BFFCE0;
    v16 = v17;
    block[4] = a1;
    v15 = v9;
    dispatch_async(v13, block);
    if (((char)v17 & 0x80000000) == 0)
    {
      if (objc_msgSend(v11, "proactivelyLoadOnFailure"))
      {
        objc_msgSend(*(id *)(a1 + 48), "trackFailureForKey:tileSet:shouldProactivelyLoad:", &v17, objc_msgSend(v8, "tileSetForKey:", &v17), 1);
        if (!*(_QWORD *)(a1 + 96))
          objc_msgSend((id)a1, "_initiateDataSaverPreloadIfPossible:", 0);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));

  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }

}

void __62__GEOTileServerLocalProxy_tileRequester_receivedError_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  GEOTileKeyList *v3;

  v3 = -[GEOTileKeyList initWithCapacity:]([GEOTileKeyList alloc], "initWithCapacity:", 1);
  -[GEOTileKeyList addKey:](v3, "addKey:", a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "proxy:failedToLoadTiles:error:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 40));

}

void __49__GEOTileServerLocalProxy_tileRequesterFinished___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "proxy:failedToLoadTiles:error:", a1[4], a1[5], a1[6]);

}

- (uint64_t)reportCorruptTile:(char *)a3
{
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOGetTileLoadingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    GEOStringFromTileKey(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Deleting corrupt tile %@", (uint8_t *)&v8, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 48), "deleteDataForKey:", a3);
}

- (void)calculateFreeableSize
{
  GEOTileDB *tileCache;
  OS_dispatch_queue *delegateQueue;
  _QWORD v4[5];

  tileCache = self->_tileCache;
  delegateQueue = self->super._delegateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__GEOTileServerLocalProxy_calculateFreeableSize__block_invoke;
  v4[3] = &unk_1E1C02780;
  v4[4] = self;
  -[GEOTileDB calculateFreeableSizeWithQueue:handler:](tileCache, "calculateFreeableSizeWithQueue:handler:", delegateQueue, v4);
}

void __48__GEOTileServerLocalProxy_calculateFreeableSize__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "proxy:canShrinkDiskCacheByAmount:", *(_QWORD *)(a1 + 32), a2);

}

- (void)shrinkDiskCacheToSize:(unint64_t)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  -[GEOTileDB shrinkToSize:queue:finished:](self->_tileCache, "shrinkToSize:queue:finished:", a3, a4, a5);
}

- (unint64_t)shrinkDiskCacheToSizeSync:(unint64_t)a3
{
  return -[GEOTileDB shrinkToSizeSync:](self->_tileCache, "shrinkToSizeSync:", a3);
}

- (void)beginPreloadSessionOfSize:(unint64_t)a3
{
  -[GEOTileDB beginPreloadSessionOfSize:](self->_tileCache, "beginPreloadSessionOfSize:", a3);
}

- (void)endPreloadSession
{
  -[GEOTileDB endPreloadSession](self->_tileCache, "endPreloadSession");
}

- (void)flushPendingWrites
{
  -[GEOTileDB flushPendingWritesWithGroup:](self->_tileCache, "flushPendingWritesWithGroup:", 0);
}

- (void)_deleteLocationSensitiveInformation:(id)a3
{
  void *v3;
  uint64_t i;
  int v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 10; ++i)
  {
    v5 = 0;
    v6 = (GEOTileSetStyleMetadata[4 * i] & 0x3FFF) << 8;
    do
    {
      v7 = 0;
      v8 = 3;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6 | (v5 << 22) | v7 | 1u);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        v7 += 0x4000000;
        --v8;
      }
      while (v8);
      ++v5;
    }
    while (v5 != 3);
  }
  if (objc_msgSend(v3, "count"))
  {
    GEOGetTileLoadingLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v13 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_INFO, "Location services are now disabled. Deleting %llu tilesets", buf, 0xCu);
    }

    -[GEOTileDB deleteDataForTilesets:](self->_tileCache, "deleteDataForTilesets:", v3);
  }

}

- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6
{
  -[GEOTileDB enumerateAllKeysIncludingData:onQueue:group:dataHandler:](self->_tileCache, "enumerateAllKeysIncludingData:onQueue:group:dataHandler:", a3, a4, a5, a6);
}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  _BOOL4 updatingManifestForProactiveTileDownload;
  id v11;

  v11 = a4;
  v7 = a5;
  -[GEOTileServerLocalProxy _updateExpiringTilesets](self, "_updateExpiringTilesets");
  -[GEOTileDB evaluateDevicePostureAgainstCurrentManifest:](self->_tileCache, "evaluateDevicePostureAgainstCurrentManifest:", 0);
  if (!v7)
  {
    if (self->_updatingManifestForProactiveTileDownload)
      goto LABEL_6;
LABEL_5:
    -[GEOTileServerLocalProxy _initiateDataSaverPreloadIfPossible:](self, "_initiateDataSaverPreloadIfPossible:", 0);
    goto LABEL_6;
  }
  objc_msgSend(v11, "tileSets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tileSets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToArray:", v9))
  {
    updatingManifestForProactiveTileDownload = self->_updatingManifestForProactiveTileDownload;

    if (updatingManifestForProactiveTileDownload)
      goto LABEL_6;
    goto LABEL_5;
  }

LABEL_6:
}

- (void)_didAddSubscription:(id)a3
{
  void *v4;
  void *v5;
  NSObject *workQueue;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E1CA61F0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !objc_msgSend(v5, "policy"))
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__GEOTileServerLocalProxy__didAddSubscription___block_invoke;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_async(workQueue, block);
  }

}

uint64_t __47__GEOTileServerLocalProxy__didAddSubscription___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initiateDataSaverPreloadIfPossible:", 0);
}

- (void)_forceDataSaverPreload:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__GEOTileServerLocalProxy__forceDataSaverPreload___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __50__GEOTileServerLocalProxy__forceDataSaverPreload___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 1;
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__GEOTileServerLocalProxy__forceDataSaverPreload___block_invoke_2;
  v3[3] = &unk_1E1C00E10;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "updateManifest:completionHandler:", 0, v3);

}

void __50__GEOTileServerLocalProxy__forceDataSaverPreload___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 88);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__GEOTileServerLocalProxy__forceDataSaverPreload___block_invoke_3;
  block[3] = &unk_1E1BFF6F8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __50__GEOTileServerLocalProxy__forceDataSaverPreload___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_initiateDataSaverPreloadIfPossible:", 0);
}

- (void)_initiateDataSaverPreloadIfPossible:(id)a3
{
  id v4;
  GEOProactiveTileDownloader *proactiveTileDownloader;
  GEOProactiveTileDownloader *v6;
  GEOProactiveTileDownloader *v7;
  OS_dispatch_queue *workQueue;
  GEOTileDB *tileCache;
  NSMapTable *providers;
  GEOTileServerLocalProxy *v11;
  id v12;
  NSObject *v13;
  GEOProactiveTileDownloader *v14;
  GEOProactiveTileDownloader *v15;
  uint8_t v16[16];

  v4 = a3;
  proactiveTileDownloader = self->_proactiveTileDownloader;
  if (!v4)
  {
    -[GEOProactiveTileDownloader cancel](proactiveTileDownloader, "cancel");
    v6 = self->_proactiveTileDownloader;
    self->_proactiveTileDownloader = 0;

    if (_cdsObserversEnabled != 1)
      goto LABEL_10;
    v7 = [GEOProactiveTileDownloader alloc];
    workQueue = self->_workQueue;
    tileCache = self->_tileCache;
    providers = self->_providers;
    v11 = self;
    v12 = 0;
LABEL_9:
    v14 = -[GEOProactiveTileDownloader initWithDelegate:delegateQueue:diskCache:tileRequesterClasses:backgroundTask:](v7, "initWithDelegate:delegateQueue:diskCache:tileRequesterClasses:backgroundTask:", v11, workQueue, tileCache, providers, v12);
    v15 = self->_proactiveTileDownloader;
    self->_proactiveTileDownloader = v14;

    -[GEOProactiveTileDownloader start](self->_proactiveTileDownloader, "start");
    goto LABEL_10;
  }
  if (!proactiveTileDownloader)
  {
    GEOGetTileLoadingLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_INFO, "No valid tile downloader. Create one and start it.", v16, 2u);
    }

    v7 = [GEOProactiveTileDownloader alloc];
    workQueue = self->_workQueue;
    tileCache = self->_tileCache;
    providers = self->_providers;
    v11 = self;
    v12 = v4;
    goto LABEL_9;
  }
  -[GEOProactiveTileDownloader taskFired:](proactiveTileDownloader, "taskFired:", v4);
LABEL_10:

}

- (void)proactiveTileDownloaderDidFinish:(id)a3
{
  GEOProactiveTileDownloader *v4;
  GEOProactiveTileDownloader *v5;

  v4 = (GEOProactiveTileDownloader *)a3;
  if (self->_proactiveTileDownloader == v4)
  {
    self->_proactiveTileDownloader = 0;
    v5 = v4;

    v4 = v5;
  }

}

- (void)tileDBDidDeleteExternalResource:(id)a3
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->super._delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__GEOTileServerLocalProxy_tileDBDidDeleteExternalResource___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __59__GEOTileServerLocalProxy_tileDBDidDeleteExternalResource___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "proxyDidDeleteExternalTileData:", *(_QWORD *)(a1 + 32));

}

- (GEOTileDB)tileCache
{
  return self->_tileCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveTileDownloader, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_inProgress, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_cacheLocation, 0);
  objc_storeStrong((id *)&self->_tileCache, 0);
}

@end
