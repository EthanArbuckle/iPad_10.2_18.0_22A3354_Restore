@implementation BRCSyncUpOperation

- (BOOL)prepareWithMaxCost:(float)a3 retryAfter:(unint64_t *)a4
{
  void *v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *stageID;
  void *v28;
  NSMutableArray *v29;
  NSMutableArray *recordsToSave;
  NSMutableArray *v31;
  NSMutableArray *packagesInFlight;
  NSMutableArray *v33;
  NSMutableArray *createdAppLibraryNames;
  NSMutableOrderedSet *v35;
  NSMutableOrderedSet *deletedRecordIDs;
  NSMutableArray *v37;
  NSMutableArray *iworkUnsharedShareIDs;
  NSMutableDictionary *v39;
  NSMutableDictionary *renamedShareIDsToNames;
  NSMutableArray *v41;
  NSMutableArray *recordsNeedingNewSharingProtectionInfo;
  NSMutableArray *v43;
  NSMutableArray *recordsNeedingUpdatedSharingProtectionInfo;
  NSMutableDictionary *v45;
  NSMutableDictionary *recordIDsToDeleteToEtags;
  NSMutableDictionary *v47;
  NSMutableDictionary *pluginFieldsForRecordDeletesByID;
  NSMutableDictionary *v49;
  NSMutableDictionary *conflictLosersToResolveByRecordID;
  void *v51;
  void *v52;
  float v53;
  uint64_t v54;
  void *v55;
  void *v56;
  float v57;
  float v58;
  int v59;
  BRCDirectoryItem *v60;
  BRCDirectoryItem *itemNeedingBasehashSalting;
  BRCLocalItem *v62;
  BRCLocalItem *itemNeedingPCSChaining;
  void *v64;
  char v65;
  void *v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  uint64_t j;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSMutableArray *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  void *v82;
  char v83;
  BRCSyncUpOperation *v84;
  id v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  BOOL v101;
  void *v102;
  NSObject *v103;
  void *v104;
  void *v105;
  char v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  NSObject *v116;
  void *v117;
  NSObject *v118;
  void *v119;
  NSObject *v120;
  uint64_t v121;
  void *v122;
  unint64_t requestID;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  BRCDirectoryItem *v130;
  const __CFString *v131;
  void *v132;
  NSObject *v133;
  void *v134;
  NSObject *v135;
  void *v136;
  void *v138;
  BRCSyncUpEnumerator *v139;
  BRCSyncUpOperationBuilder *v140;
  void *v141;
  id obj;
  id v143;
  uint64_t v144;
  uint64_t v145;
  _QWORD v147[6];
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint64_t v160[3];
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  uint8_t buf[4];
  uint64_t v166;
  __int16 v167;
  uint64_t v168;
  __int16 v169;
  _BYTE v170[18];
  __int16 v171;
  uint64_t v172;
  __int16 v173;
  uint64_t v174;
  __int16 v175;
  void *v176;
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  uint64_t v181;

  v181 = *MEMORY[0x1E0C80C00];
  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v141, "isSyncBlocked"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:].cold.1();

LABEL_5:
    v7 = 0;
    goto LABEL_112;
  }
  if ((objc_msgSend(v141, "isCloudDocsZone") & 1) == 0
    && objc_msgSend(v141, "isPrivateZone")
    && !-[BRCServerZone hasFetchedServerZoneState](self->_serverZone, "hasFetchedServerZoneState"))
  {
    v163 = 0u;
    v164 = 0u;
    v161 = 0u;
    v162 = 0u;
    objc_msgSend(v141, "asPrivateClientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appLibraries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v161, v180, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v162;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v162 != v11)
            objc_enumerationMutation(v9);
          if ((~objc_msgSend(*(id *)(*((_QWORD *)&v161 + 1) + 8 * i), "state") & 0x140000) != 0)
          {
            brc_bread_crumbs();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:].cold.7();

            goto LABEL_24;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v161, v180, 16);
        if (v10)
          continue;
        break;
      }
    }

    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:].cold.6();

    objc_msgSend(v141, "clearSyncUpError");
    if (a4)
    {
      v7 = 0;
      *a4 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_112;
    }
    goto LABEL_5;
  }
LABEL_24:
  v139 = -[BRCSyncUpEnumerator initWithClientZone:]([BRCSyncUpEnumerator alloc], "initWithClientZone:", v141);
  v17 = -[BRCSyncUpEnumerator batchSize](v139, "batchSize");
  objc_msgSend(v141, "db");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "assertOnQueue");

  memset(v160, 0, sizeof(v160));
  __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperation prepareWithMaxCost:retryAfter:]", 386, v160);
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v166 = v160[0];
    v167 = 2112;
    v168 = (uint64_t)v141;
    v169 = 1024;
    *(_DWORD *)v170 = v17;
    *(_WORD *)&v170[4] = 2112;
    *(_QWORD *)&v170[6] = v19;
    _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Sync: syncing up clientZone %@. batch size - %u%@", buf, 0x26u);
  }

  v21 = v17;
  v138 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v17);
  objc_msgSend(v141, "mangledID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v22);
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0CB3940];
  -[_BRCOperation operationID](self, "operationID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("sync-up-%@"), v25);
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  stageID = self->_stageID;
  self->_stageID = v26;

  -[BRCSessionContext syncUpStager](self->super._sessionContext, "syncUpStager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "associateSyncUpStageID:withOperation:", self->_stageID, self);

  v29 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v21);
  recordsToSave = self->_recordsToSave;
  self->_recordsToSave = v29;

  v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  packagesInFlight = self->_packagesInFlight;
  self->_packagesInFlight = v31;

  v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  createdAppLibraryNames = self->_createdAppLibraryNames;
  self->_createdAppLibraryNames = v33;

  v35 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  deletedRecordIDs = self->_deletedRecordIDs;
  self->_deletedRecordIDs = v35;

  v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  iworkUnsharedShareIDs = self->_iworkUnsharedShareIDs;
  self->_iworkUnsharedShareIDs = v37;

  v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  renamedShareIDsToNames = self->_renamedShareIDsToNames;
  self->_renamedShareIDsToNames = v39;

  v41 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  recordsNeedingNewSharingProtectionInfo = self->_recordsNeedingNewSharingProtectionInfo;
  self->_recordsNeedingNewSharingProtectionInfo = v41;

  v43 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  recordsNeedingUpdatedSharingProtectionInfo = self->_recordsNeedingUpdatedSharingProtectionInfo;
  self->_recordsNeedingUpdatedSharingProtectionInfo = v43;

  v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  recordIDsToDeleteToEtags = self->_recordIDsToDeleteToEtags;
  self->_recordIDsToDeleteToEtags = v45;

  v47 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  pluginFieldsForRecordDeletesByID = self->_pluginFieldsForRecordDeletesByID;
  self->_pluginFieldsForRecordDeletesByID = v47;

  v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  conflictLosersToResolveByRecordID = self->_conflictLosersToResolveByRecordID;
  self->_conflictLosersToResolveByRecordID = v49;

  v140 = objc_alloc_init(BRCSyncUpOperationBuilder);
  -[BRCSyncUpOperationBuilder setOp:](v140, "setOp:", self);
  -[BRCSyncUpOperationBuilder setDefaults:](v140, "setDefaults:", v136);
  objc_msgSend(v141, "session");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSyncUpOperationBuilder setSession:](v140, "setSession:", v51);

  v52 = 0;
  v53 = 0.0;
  while (1)
  {
    v54 = -[NSMutableArray count](self->_recordsToSave, "count");
    if (v54 + -[NSMutableOrderedSet count](self->_deletedRecordIDs, "count") + 2 > v21
      || -[NSMutableArray count](self->_iworkUnsharedShareIDs, "count") + 1 > v21)
    {
      break;
    }
    -[BRCSyncUpEnumerator nextObject](v139, "nextObject");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      v56 = (void *)MEMORY[0x1D17A6BE8]();
      -[BRCSyncUpOperationBuilder addItem:](v140, "addItem:", v55);
      v58 = v57;
      if (v57 <= 0.0)
      {
        -[BRCSyncUpOperationBuilder itemNeedingBasehashSalting](v140, "itemNeedingBasehashSalting");
        v60 = (BRCDirectoryItem *)objc_claimAutoreleasedReturnValue();
        itemNeedingBasehashSalting = self->_itemNeedingBasehashSalting;
        self->_itemNeedingBasehashSalting = v60;

        if (v60
          || (-[BRCSyncUpOperationBuilder itemNeedingPCSChaining](v140, "itemNeedingPCSChaining"),
              v62 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue(),
              itemNeedingPCSChaining = self->_itemNeedingPCSChaining,
              self->_itemNeedingPCSChaining = v62,
              itemNeedingPCSChaining,
              v62))
        {
          v59 = 15;
        }
        else
        {
          objc_msgSend(v55, "itemID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "isDocumentsFolder");

          if ((v65 & 1) == 0)
          {
            brc_bread_crumbs();
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v166 = (uint64_t)v55;
              v167 = 2112;
              v168 = (uint64_t)v66;
              _os_log_debug_impl(&dword_1CBD43000, v67, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring item with negative cost for now %@%@", buf, 0x16u);
            }

          }
          v59 = 14;
        }
      }
      else
      {
        objc_msgSend(v138, "addObject:", v55);
        v53 = v53 + v58;
        v59 = v53 >= a3 ? 15 : 0;
      }
      objc_autoreleasePoolPop(v56);
      v52 = v55;
      if (v59 != 15)
        continue;
    }
    goto LABEL_45;
  }
  v55 = v52;
LABEL_45:
  v143 = v55;
  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  -[BRCSyncUpEnumerator itemsNeedingUnshare](v139, "itemsNeedingUnshare");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v156, v179, 16);
  if (v69)
  {
    v144 = *(_QWORD *)v157;
    obj = v68;
    do
    {
      v145 = v69;
      for (j = 0; j != v145; ++j)
      {
        if (*(_QWORD *)v157 != v144)
          objc_enumerationMutation(obj);
        v71 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * j);
        v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initShareIDWithShareableItem:", v71);
        -[NSMutableOrderedSet addObject:](self->_deletedRecordIDs, "addObject:", v72);
        if (objc_msgSend(v71, "isDocument"))
        {
          objc_msgSend(v71, "asDocument");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "baseRecord");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "currentVersion");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "ckInfo");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "serializeSystemFields:", v76);

        }
        else
        {
          objc_msgSend(v71, "baseStructureRecord");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "st");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "ckInfo");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "serializeSystemFields:", v75);
        }

        v154 = 0u;
        v155 = 0u;
        v152 = 0u;
        v153 = 0u;
        v77 = self->_recordsToSave;
        v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v152, v178, 16);
        if (v78)
        {
          v79 = *(_QWORD *)v153;
          while (2)
          {
            for (k = 0; k != v78; ++k)
            {
              if (*(_QWORD *)v153 != v79)
                objc_enumerationMutation(v77);
              objc_msgSend(*(id *)(*((_QWORD *)&v152 + 1) + 8 * k), "recordID");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "recordID");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = objc_msgSend(v81, "isEqual:", v82);

              if ((v83 & 1) != 0)
              {

                goto LABEL_63;
              }
            }
            v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v152, v178, 16);
            if (v78)
              continue;
            break;
          }
        }

        -[NSMutableArray addObject:](self->_recordsToSave, "addObject:", v74);
LABEL_63:

      }
      v68 = obj;
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v179, 16);
    }
    while (v69);
  }

  v84 = self;
  v85 = v143;
  if (self->_itemNeedingBasehashSalting || self->_itemNeedingPCSChaining)
  {
    brc_bread_crumbs();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    {
      v130 = self->_itemNeedingBasehashSalting;
      v131 = CFSTR("salting");
      if (!v130)
      {
        v131 = CFSTR("pcs chaining");
        v130 = (BRCDirectoryItem *)self->_itemNeedingPCSChaining;
      }
      *(_DWORD *)buf = 138412802;
      v166 = (uint64_t)v131;
      v167 = 2112;
      v168 = (uint64_t)v130;
      v169 = 2112;
      *(_QWORD *)v170 = v86;
      _os_log_debug_impl(&dword_1CBD43000, v87, OS_LOG_TYPE_DEBUG, "[DEBUG] Dedicating this sync up operation to %@ %@%@", buf, 0x20u);
    }

    v84 = self;
    -[NSMutableArray removeAllObjects](self->_recordsToSave, "removeAllObjects");
    v85 = v143;
    -[NSMutableOrderedSet removeAllObjects](self->_deletedRecordIDs, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_iworkUnsharedShareIDs, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_renamedShareIDsToNames, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_recordIDsToDeleteToEtags, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_pluginFieldsForRecordDeletesByID, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_conflictLosersToResolveByRecordID, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_recordsNeedingUpdatedSharingProtectionInfo, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_recordsNeedingNewSharingProtectionInfo, "removeAllObjects");
    objc_msgSend(v138, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_createdAppLibraryNames, "removeAllObjects");
  }
  -[BRCSyncUpEnumerator invalidate](v139, "invalidate");
  if (-[NSMutableArray count](v84->_recordsToSave, "count")
    || -[NSMutableOrderedSet count](v84->_deletedRecordIDs, "count")
    || -[NSMutableArray count](v84->_iworkUnsharedShareIDs, "count")
    || -[NSMutableDictionary count](v84->_renamedShareIDsToNames, "count")
    || v84->_itemNeedingPCSChaining
    || v84->_itemNeedingBasehashSalting)
  {
    if (!v84->_itemNeedingPCSChaining && !v84->_itemNeedingBasehashSalting)
    {
      v84->_requestID = objc_msgSend(v141, "allocateSyncUpRequestID");
      v88 = objc_msgSend(v138, "count");
      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      v89 = v138;
      v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v148, v177, 16);
      if (v90)
      {
        v91 = *(_QWORD *)v149;
        do
        {
          v92 = 0;
          v93 = v143;
          do
          {
            if (*(_QWORD *)v149 != v91)
              objc_enumerationMutation(v89);
            v143 = *(id *)(*((_QWORD *)&v148 + 1) + 8 * v92);

            v94 = (void *)MEMORY[0x1D17A6BE8]();
            if (objc_msgSend(v143, "isDocument"))
            {
              objc_msgSend(v143, "asDocument");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v141, "session");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "analyticsReporter");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "itemID");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v147[0] = MEMORY[0x1E0C809B0];
              v147[1] = 3221225472;
              v147[2] = __52__BRCSyncUpOperation_prepareWithMaxCost_retryAfter___block_invoke;
              v147[3] = &unk_1E8761A90;
              v147[4] = self;
              v147[5] = v88;
              objc_msgSend(v97, "lookupFSEventToSyncUpEventByItemID:accessor:", v98, v147);

            }
            objc_msgSend(v143, "saveToDBAndValidateLocalDiffs");
            objc_autoreleasePoolPop(v94);
            ++v92;
            v93 = v143;
          }
          while (v90 != v92);
          v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v148, v177, 16);
        }
        while (v90);
      }

      v85 = 0;
      v84 = self;
    }
    -[BRCServerZone mangledID](v84->_serverZone, "mangledID");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = v85;
    if (objc_msgSend(v100, "destroyiWorkShares"))
    {
      v101 = -[NSMutableArray count](v84->_iworkUnsharedShareIDs, "count") == 0;

      if (!v101)
      {
        brc_bread_crumbs();
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v103 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
          -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:].cold.5();

        -[NSMutableOrderedSet addObjectsFromArray:](self->_deletedRecordIDs, "addObjectsFromArray:", self->_iworkUnsharedShareIDs);
        -[NSMutableArray removeAllObjects](self->_iworkUnsharedShareIDs, "removeAllObjects");
      }
    }
    else
    {

    }
    if (objc_msgSend(v141, "isPrivateZone"))
    {
      objc_msgSend(v141, "asPrivateClientZone");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "defaultAppLibrary");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v105, "rootRecordCreated");

      if ((v106 & 1) == 0)
      {
        v107 = (void *)MEMORY[0x1E0C95048];
        -[BRCServerZone zoneID](self->_serverZone, "zoneID");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "rootDirectoryRecordForZoneID:", v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();

        -[BRCSyncUpOperationBuilder rootChildBasehashSalt](v140, "rootChildBasehashSalt");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        if (v110)
        {
          objc_msgSend(v109, "brc_fillWithChildBasehashSalt:", v110);
          objc_msgSend(v141, "asPrivateClientZone");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "defaultAppLibrary");
          v112 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v112, "state") & 0x200000) != 0 || objc_msgSend(v112, "saltingState") < 2)
            v113 = 3;
          else
            v113 = objc_msgSend(v112, "saltingState");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v113);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "setObject:forKeyedSubscript:", v114, CFSTR("saltingState"));

        }
        -[NSMutableArray insertObject:atIndex:](self->_recordsToSave, "insertObject:atIndex:", v109, 0);
        brc_bread_crumbs();
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v116 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
          -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:].cold.4();

      }
    }
    brc_bread_crumbs();
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v118 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
    {
      requestID = self->_requestID;
      v125 = -[NSMutableArray count](self->_recordsToSave, "count");
      v126 = -[NSMutableOrderedSet count](self->_deletedRecordIDs, "count");
      v127 = -[NSMutableArray count](self->_iworkUnsharedShareIDs, "count");
      v128 = -[NSMutableDictionary count](self->_renamedShareIDsToNames, "count");
      v129 = objc_msgSend(v138, "count");
      *(_DWORD *)buf = 134219522;
      v166 = requestID;
      v167 = 2048;
      v168 = v125;
      v169 = 2048;
      *(_QWORD *)v170 = v126;
      *(_WORD *)&v170[8] = 2048;
      *(_QWORD *)&v170[10] = v127;
      v171 = 2048;
      v172 = v128;
      v173 = 2048;
      v174 = v129;
      v175 = 2112;
      v176 = v117;
      _os_log_debug_impl(&dword_1CBD43000, v118, OS_LOG_TYPE_DEBUG, "[DEBUG] preparing to send in requestID:%lld: %lu records, delete %lu recordIDs, unshare %lu iwork shares, rename %lu shares, about %lu items%@", buf, 0x48u);
    }

    brc_bread_crumbs();
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v120 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      v121 = objc_msgSend(v138, "count");
      objc_msgSend(v141, "mangledID");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v166 = v121;
      v167 = 2112;
      v168 = (uint64_t)v122;
      v169 = 2112;
      *(_QWORD *)v170 = v119;
      _os_log_impl(&dword_1CBD43000, v120, OS_LOG_TYPE_DEFAULT, "[NOTICE] sending %lu items to the cloud for %@\n%@", buf, 0x20u);

    }
    if (a4)
      *a4 = 0;
    self->_cost = v53;
    v7 = 1;
  }
  else
  {
    brc_bread_crumbs();
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v133 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:].cold.3();

    if (objc_msgSend(v138, "count"))
    {
      brc_bread_crumbs();
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v135 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_FAULT))
        -[BRCSyncUpOperation prepareWithMaxCost:retryAfter:].cold.2();

    }
    objc_msgSend(v141, "clearSyncUpError");
    v7 = 0;
    if (a4)
      *a4 = -[BRCSyncUpEnumerator retryAfter](v139, "retryAfter");
  }

  __brc_leave_section(v160);
LABEL_112:

  return v7;
}

void __52__BRCSyncUpOperation_prepareWithMaxCost_retryAfter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setSyncUpBatchSize:", v3);
  objc_msgSend(*(id *)(a1 + 32), "associateCKOperationsToEventMetric:", v4);

}

- (BRCSyncUpOperation)initWithZone:(id)a3 sessionContext:(id)a4 syncUpCallback:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BRCSyncUpOperation *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_super v25;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "zoneName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sync-up/"), "stringByAppendingString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "ownerName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C94730]);

  if ((v15 & 1) == 0)
  {
    objc_msgSend(v9, "ownerName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(":%@"), v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v17;
  }
  objc_msgSend(v9, "metadataSyncContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)BRCSyncUpOperation;
  v19 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v25, sel_initWithName_syncContext_sessionContext_, v13, v18, v11);

  if (v19)
  {
    -[BRCSyncUpOperation setQueuePriority:](v19, "setQueuePriority:", 4);
    -[_BRCOperation callbackQueue](v19, "callbackQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "session");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "clientTruthWorkloop");
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v20, v23);

    objc_storeStrong((id *)&v19->_serverZone, a3);
    objc_storeStrong((id *)&v19->_syncUpCallback, a5);
  }

  return v19;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sync-up", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (id)syncUpOperationForZone:(id)a3 sessionContext:(id)a4 syncUpCallback:(id)a5 maxCost:(float)a6 retryAfter:(unint64_t *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  id v17;
  uint64_t v18;
  void *v19;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithZone:sessionContext:syncUpCallback:", v14, v13, v12);

  *(float *)&v16 = a6;
  if ((objc_msgSend(v15, "prepareWithMaxCost:retryAfter:", a7, v16) & 1) != 0)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(v15, "completionBlock");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      (*(void (**)(uint64_t))(v18 + 16))(v18);

    v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_packagesInFlight;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeDB");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)BRCSyncUpOperation;
  -[_BRCOperation dealloc](&v8, sel_dealloc);
}

- (BOOL)_performMetadataSaltingOperationIfNecessaryWithCompletion:(id)a3
{
  id v4;
  id v5;
  int v6;
  BRCDirectoryItem *itemNeedingBasehashSalting;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v4 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsEnhancedDrivePrivacy");
  if (!v6)
  {
LABEL_8:

    goto LABEL_9;
  }
  itemNeedingBasehashSalting = self->_itemNeedingBasehashSalting;

  if (itemNeedingBasehashSalting)
  {
    -[BRCLocalItem appLibrary](self->_itemNeedingBasehashSalting, "appLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation callbackQueue](self, "callbackQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v8, "db");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serialQueue");
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "db");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serialQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke;
    v17[3] = &unk_1E875DDA0;
    v17[4] = self;
    v18 = v8;
    v19 = v11;
    v20 = v4;
    v15 = v11;
    v5 = v8;
    dispatch_sync(v14, v17);

    goto LABEL_8;
  }
  LOBYTE(v6) = 0;
LABEL_9:

  return v6;
}

void __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  BRCSaltingBatchOperation *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, int, int, void *);
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v2 = -[BRCSaltingBatchOperation initWithParentItem:sessionContext:]([BRCSaltingBatchOperation alloc], "initWithParentItem:sessionContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 616), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_2;
  v7 = &unk_1E8761AB8;
  v3 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  -[BRCSaltingBatchOperation setMetadataCompletionBlock:](v2, "setMetadataCompletionBlock:", &v4);
  objc_msgSend(*(id *)(a1 + 32), "addSubOperation:", v2, v4, v5, v6, v7, v8);

}

void __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 616);
    *(_DWORD *)buf = 138413314;
    v21 = v14;
    v22 = 1024;
    v23 = a2;
    v24 = 1024;
    v25 = a3;
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished metadata salting a batch for item %@ when completed: %d validation: %d error: %@%@", buf, 0x2Cu);
  }

  if (v7 || a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "db");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serialQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_22;
    v15[3] = &unk_1E875DDA0;
    v12 = *(id *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 32);
    v16 = v12;
    v17 = v13;
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 56);
    dispatch_async(v11, v15);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_22(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(v2 + 8) + 616), "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemByItemID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_22_cold_2();

  if (v5)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 512);
    objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dbRowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postponeSyncUpCallback:inZone:", v5, v10);

  }
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_22_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scheduleSyncDown");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_23;
  block[3] = &unk_1E875FD48;
  v14 = *(NSObject **)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  dispatch_async(v14, block);

}

uint64_t __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_performPCSChainOperationIfNecessaryWithCompletion:(id)a3
{
  id v4;
  BRCLocalItem *itemNeedingPCSChaining;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v4 = a3;
  itemNeedingPCSChaining = self->_itemNeedingPCSChaining;
  if (itemNeedingPCSChaining)
  {
    -[BRCLocalItem appLibrary](self->_itemNeedingPCSChaining, "appLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation callbackQueue](self, "callbackQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v6, "db");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serialQueue");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "db");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serialQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke;
    v16[3] = &unk_1E875DDA0;
    v16[4] = self;
    v17 = v6;
    v18 = v9;
    v19 = v4;
    v13 = v9;
    v14 = v6;
    dispatch_sync(v12, v16);

  }
  return itemNeedingPCSChaining != 0;
}

void __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  BRCPCSChainingOperation *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(*((id *)a1[4] + 76), "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "defaultClientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverItemByItemID:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[BRCPCSChainingOperation initWithRootItem:appLibrary:sessionContext:syncUpCallback:]([BRCPCSChainingOperation alloc], "initWithRootItem:appLibrary:sessionContext:syncUpCallback:", v4, a1[5], *((_QWORD *)a1[4] + 32), *((_QWORD *)a1[4] + 64));
  -[BRCPCSChainingOperation setShouldFillBatch:](v5, "setShouldFillBatch:", 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_2;
  v7[3] = &unk_1E8761B30;
  v8 = a1[5];
  v9 = v2;
  v10 = a1[4];
  v11 = a1[6];
  v12 = a1[7];
  v6 = v2;
  -[BRCPCSChainingOperation setPcsChainCompletionBlock:](v5, "setPcsChainCompletionBlock:", v7);
  objc_msgSend(a1[4], "addSubOperation:", v5);

}

void __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109890;
    v27 = a2;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished PCS chaining a batch when completed: %d listOp: %@ error: %@%@", buf, 0x26u);
  }

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "db");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serialQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_27;
    block[3] = &unk_1E8761AE0;
    v21 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(void **)(a1 + 56);
    v22 = v14;
    v23 = v15;
    v24 = v16;
    v25 = *(id *)(a1 + 64);
    dispatch_async(v13, block);

    v17 = v21;
  }
  else
  {
    if (!v8)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      goto LABEL_8;
    }
    objc_msgSend(v8, "beginObservingChangesWithDelegate:", 0);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_3;
    v18[3] = &unk_1E8761B08;
    v19 = *(id *)(a1 + 64);
    objc_msgSend(v8, "addPreFlushDirectoryListCompletionBlock:", v18);
    v17 = v19;
  }

LABEL_8:
}

void __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_27(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemByItemID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 48) + 512);
    objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dbRowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postponeSyncUpCallback:inZone:", v3, v6);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_2_28;
  block[3] = &unk_1E875FD48;
  v7 = *(NSObject **)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  dispatch_async(v7, block);

}

uint64_t __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_2_28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__BRCSyncUpOperation__performPCSChainOperationIfNecessaryWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performModifyRecordsOrBatchOperationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BRCServerZone *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  BRCSyncUpOperation *v24;
  id v25;
  id v26;
  BRCServerZone *v27;
  char v28;

  v4 = a3;
  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSyncContext session](self->super._syncContext, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_serverZone;
  if (!-[BRCSyncUpOperation _performMetadataSaltingOperationIfNecessaryWithCompletion:](self, "_performMetadataSaltingOperationIfNecessaryWithCompletion:", v4)&& !-[BRCSyncUpOperation _performPCSChainOperationIfNecessaryWithCompletion:](self, "_performPCSChainOperationIfNecessaryWithCompletion:", v4))
  {
    v8 = -[NSMutableArray count](self->_recordsToSave, "count");
    if (v8 + -[NSMutableOrderedSet count](self->_deletedRecordIDs, "count"))
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C94F10]);
      objc_msgSend(v9, "setRecordsToSave:", self->_recordsToSave);
      -[NSMutableOrderedSet array](self->_deletedRecordIDs, "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRecordIDsToDelete:", v10);

      objc_msgSend(v9, "setRecordIDsToDeleteToEtags:", self->_recordIDsToDeleteToEtags);
      if (-[NSMutableDictionary count](self->_pluginFieldsForRecordDeletesByID, "count"))
        objc_msgSend(v9, "setPluginFieldsForRecordDeletesByID:", self->_pluginFieldsForRecordDeletesByID);
      if (-[NSMutableDictionary count](self->_conflictLosersToResolveByRecordID, "count"))
        objc_msgSend(v9, "setConflictLosersToResolveByRecordID:", self->_conflictLosersToResolveByRecordID);
      objc_msgSend(v9, "setSavePolicy:", 0);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_requestID, 8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setClientChangeTokenData:", v11);

      objc_msgSend(v9, "setAtomic:", 1);
      objc_msgSend(v5, "db");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serialQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCallbackQueue:", v13);

      v14 = (void *)objc_opt_new();
      objc_msgSend(v5, "mangledID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "skipPerItemSyncUpThrottling");

      v18 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke;
      v22[3] = &unk_1E8761B80;
      v23 = v5;
      v24 = self;
      v25 = v14;
      v26 = v6;
      v27 = v7;
      v28 = v17;
      v19 = v14;
      objc_msgSend(v9, "setPerRecordCompletionBlock:", v22);
      v20[0] = v18;
      v20[1] = 3221225472;
      v20[2] = __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_40;
      v20[3] = &unk_1E8761BA8;
      v21 = v4;
      objc_msgSend(v9, "setModifyRecordsCompletionBlock:", v20);
      -[_BRCOperation addSubOperation:](self, "addSubOperation:", v9);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }
  }

}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  char v44;
  uint64_t v45[3];
  _BYTE buf[12];
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    memset(v45, 0, sizeof(v45));
    __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperation _performModifyRecordsOrBatchOperationWithCompletion:]_block_invoke", 740, v45);
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v31 = v45[0];
      objc_msgSend(v5, "recordID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "recordName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v31;
      v47 = 2112;
      v48 = v33;
      v49 = 2112;
      v50 = v7;
      v51 = 2112;
      v52 = v8;
      _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx sync-up error for record %@: %@%@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "db");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_33;
    v36[3] = &unk_1E8761B58;
    v37 = v7;
    v38 = v5;
    v11 = *(id *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(a1 + 48);
    v39 = v11;
    v40 = v12;
    v41 = v13;
    v42 = *(id *)(a1 + 56);
    v43 = *(id *)(a1 + 64);
    v44 = *(_BYTE *)(a1 + 72);
    objc_msgSend(v10, "groupInBatch:", v36);

    __brc_leave_section(v45);
  }
  else if (v5)
  {
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v5, "recordID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("documentContent/"));

    if (v17)
    {
      objc_msgSend(v5, "recordID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "session");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "brc_itemIDWithSession:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "itemByItemID:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isDocumentBeingCopiedToNewZone") & 1) == 0)
      {
        objc_msgSend(v21, "st");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "filename");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "br_pathExtension");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v24, "isEqualToString:", CFSTR("key")) & 1) != 0
          || (objc_msgSend(v24, "isEqualToString:", CFSTR("numbers")) & 1) != 0
          || objc_msgSend(v24, "isEqualToString:", CFSTR("pages")))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pkgContent"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            *(_QWORD *)buf = 0;
            v27 = objc_msgSend(v25, "openWithError:", buf);
            v28 = *(id *)buf;
            if ((v27 & 1) != 0)
            {
              if (!objc_msgSend(v26, "itemCount"))
              {
                brc_bread_crumbs();
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                  __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_cold_1();

              }
              objc_msgSend(v26, "close");
            }
            else
            {
              brc_bread_crumbs();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
                __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_cold_2();

            }
          }

        }
      }

    }
  }

}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_33(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
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
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  void *v46;
  NSObject *v47;
  char v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  id v100;
  _QWORD block[4];
  id v102;
  id v103;
  _QWORD v104[4];
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  uint8_t buf[4];
  void *v111;
  __int16 v112;
  id v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  void *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitUnknownItemError") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitErrorMissingContentRecordForNewStructureRecord"))
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(id *)(a1 + 48);
    objc_msgSend(v2, "recordID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "brc_itemIDWithSession:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "itemByItemID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "handleUnknownItemError");
    objc_msgSend(v7, "saveToDB");

LABEL_19:
    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_20;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "brc_isStaleRecordUpdateError") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "brc_isReferenceValidationError"))
  {
    v8 = *(void **)(a1 + 48);
    v9 = *(id *)(a1 + 40);
    v10 = v8;
    objc_msgSend(v9, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "brc_itemIDWithSession:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "itemByItemID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parentItemIDInZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && (objc_msgSend(v15, "isNonDesktopRoot") & 1) == 0)
    {
      objc_msgSend(v14, "clientZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "itemByItemID:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "isDeadOrMissingInServerTruth"))
      {
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_33_cold_2();

        objc_msgSend(v18, "markForceNeedsSyncUp");
        objc_msgSend(v18, "saveToDB");
      }

    }
    if (objc_msgSend(v14, "isDeadOrMissingInServerTruth"))
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_33_cold_1();

      objc_msgSend(v14, "markForceRejected");
      objc_msgSend(v14, "markNeedsUploadOrSyncingUp");
      objc_msgSend(v14, "saveToDB");
    }
    else
    {
      objc_msgSend(v9, "recordID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (id)objc_msgSend(v10, "locateRecordIfNecessaryForRecordID:isUserWaiting:", v23, 0);

    }
    goto LABEL_19;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "brc_containsCloudKitErrorCode:", 10))
  {
    v28 = *(void **)(a1 + 40);
    v29 = *(id *)(a1 + 48);
    objc_msgSend(v28, "recordID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "session");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "brc_itemIDWithSession:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "itemByItemID:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "mangledID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v33, "isSharedToMeChildItem")
      || !objc_msgSend(v35, "changeItemIDOnUnknownItem"))
    {
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v33);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "brc_shareItemID");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "maxSyncPathDepth");
    objc_msgSend(v33, "db");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "itemID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dbRowID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dbRowID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v37, "itemIDWithSQL:", CFSTR(" WITH RECURSIVE item_parents (item_id, item_sharing_options, item_parent_id) AS(         SELECT item_id, item_sharing_options, item_parent_id FROM server_items           WHERE item_id = %@ AND zone_rowid = %@       UNION ALL          SELECT li.item_id, li.item_sharing_options, li.item_parent_id FROM server_items AS li     INNER JOIN item_parents AS p WHERE li.zone_rowid = %@ AND p.item_parent_id = li.item_id          LIMIT %u)        SELECT item_id FROM item_parents WHERE (item_sharing_options & 4) != 0"), v38, v39, v40, v36);

    if (v98 && objc_msgSend(v41, "isEqualToItemID:", v98))
    {

LABEL_27:
      goto LABEL_28;
    }
    brc_bread_crumbs();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v111 = v98;
      v112 = 2112;
      v113 = v41;
      v114 = 2112;
      v115 = v32;
      v116 = 2112;
      v117 = v46;
      _os_log_impl(&dword_1CBD43000, v47, OS_LOG_TYPE_DEFAULT, "[WARNING] We changed share roots from %@ to %@ on %@ and got a permission error so behaving like an unknown item%@", buf, 0x2Au);
    }

    objc_msgSend(v33, "handleUnknownItemError");
    v48 = objc_msgSend(v33, "saveToDB");

    if ((v48 & 1) != 0)
      goto LABEL_19;
  }
LABEL_28:
  if (objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitErrorRequiringAssetRescan")
    || objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitErrorRequiringAssetReupload"))
  {
    reuploadItemInContainer(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 56));
    goto LABEL_19;
  }
  v42 = *(void **)(a1 + 32);
  v109 = 0;
  v43 = objc_msgSend(v42, "brc_isCloudKitErrorUnsupportedOSForItemAndGetMinimumSupported:", &v109);
  v27 = v109;
  if (v43)
  {
    markRecordBacklistedFromSyncWithMinimumSupportedOS(*(void **)(a1 + 40), v27, *(void **)(a1 + 48));
    v25 = 0;
    v26 = 0;
    goto LABEL_20;
  }
  v44 = *(void **)(a1 + 32);
  v108 = 0;
  v45 = objc_msgSend(v44, "brc_isCloudKitErrorReparentedToNewParent:", &v108);
  v26 = v108;
  if (v45)
  {
    markRecordNeedingRemapToNewParent(*(void **)(a1 + 40), v26, *(void **)(a1 + 48), *(void **)(a1 + 64));
    v25 = 0;
    goto LABEL_20;
  }
  v49 = *(void **)(a1 + 32);
  v107 = 0;
  v50 = objc_msgSend(v49, "brc_isCloudKitErrorRemappedToNewRecordName:", &v107);
  v25 = v107;
  if (v50)
  {
    markRecordNeedingRemapToNewRecordName(*(void **)(a1 + 40), v25, *(void **)(a1 + 48), *(void **)(a1 + 64));
    goto LABEL_20;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "brc_isIndividualItemBlacklistError"))
  {
    objc_msgSend(*(id *)(a1 + 40), "recordID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "session");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "brc_itemIDWithSession:", v52);
    v53 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "itemByItemID:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, (os_log_type_t)0x90u))
      __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_33_cold_3();

    v57 = *(void **)(a1 + 48);
    v58 = *(void **)(*(_QWORD *)(a1 + 56) + 512);
    objc_msgSend(v57, "dbRowID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "blockSyncUpCallback:inZone:", v54, v59);
    goto LABEL_45;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "brc_containsCloudKitErrorCode:", 15)
    || !objc_msgSend(*(id *)(a1 + 32), "brc_containsCloudKitInternalErrorCode:", 2040))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitPCSChainingError")
      || (objc_msgSend(*(id *)(a1 + 40), "parent"),
          v64 = (void *)objc_claimAutoreleasedReturnValue(),
          v64,
          v64))
    {
      v65 = *(void **)(a1 + 32);
      v100 = 0;
      v66 = objc_msgSend(v65, "brc_isCloudKitShouldBeUsingEnhancedDrivePrivacyWithFieldName:", &v100);
      v53 = v100;
      if (!v66)
      {
        if (objc_msgSend(*(id *)(a1 + 48), "handleSaltingErrorIfNeeded:record:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)))
        {
          handleErrorForRecord(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 56));
        }
        else if (objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitAtomicFailure"))
        {
          brc_bread_crumbs();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_33_cold_4();

        }
        else
        {
          if (*(_BYTE *)(a1 + 88))
          {
            brc_bread_crumbs();
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
              __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_33_cold_5();

          }
          else
          {
            handleErrorForRecord(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 56));
          }
          objc_msgSend(*(id *)(a1 + 40), "parent");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(*(_QWORD *)(a1 + 56) + 520) = v93 != 0;

        }
        goto LABEL_84;
      }
      brc_bread_crumbs();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        v94 = *(void **)(a1 + 80);
        *(_DWORD *)buf = 138412802;
        v111 = v94;
        v112 = 2112;
        v113 = v53;
        v114 = 2112;
        v115 = v67;
        _os_log_debug_impl(&dword_1CBD43000, v68, OS_LOG_TYPE_DEBUG, "[DEBUG] Enabling server zone %@ to use enhanced drive privacy (fieldName %@)%@", buf, 0x20u);
      }

      v69 = *(void **)(a1 + 48);
      v70 = 0x400000;
      goto LABEL_57;
    }
    objc_msgSend(*(id *)(a1 + 40), "recordID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "session");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "brc_itemIDWithSession:", v74);
    v53 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "itemByItemID:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "serverItemByItemID:", v53);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v54, "isZoneRoot") & 1) != 0)
    {
      v75 = 0;
    }
    else
    {
      v83 = *(void **)(a1 + 48);
      objc_msgSend(v54, "st");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "parentID");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "serverItemByItemID:", v85);
      v75 = (id)objc_claimAutoreleasedReturnValue();

      if (v75 && !objc_msgSend(v75, "pcsChainState"))
      {
        brc_bread_crumbs();
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v111 = v95;
          _os_log_impl(&dword_1CBD43000, v96, OS_LOG_TYPE_DEFAULT, "[WARNING] Updating parent item to be chained because it is unknown and we encountered a PCS error%@", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 72), "serverTruthWorkloop");
        v97 = objc_claimAutoreleasedReturnValue();
        v104[0] = MEMORY[0x1E0C809B0];
        v104[1] = 3221225472;
        v104[2] = __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_34;
        v104[3] = &unk_1E875D470;
        v105 = *(id *)(a1 + 72);
        v75 = v75;
        v106 = v75;
        dispatch_async(v97, v104);

        v92 = v105;
        goto LABEL_88;
      }
    }
    if (!v59 || objc_msgSend(v59, "pcsChainState"))
    {
      brc_bread_crumbs();
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        v88 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v111 = v88;
        v112 = 2112;
        v113 = v86;
        _os_log_impl(&dword_1CBD43000, v87, OS_LOG_TYPE_DEFAULT, "[WARNING] Encountered an unknown pcs error for %@%@", buf, 0x16u);
      }

      handleErrorForRecord(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 56));
      *(_BYTE *)(*(_QWORD *)(a1 + 56) + 520) = 1;
      goto LABEL_89;
    }
    brc_bread_crumbs();
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v111 = v89;
      _os_log_impl(&dword_1CBD43000, v90, OS_LOG_TYPE_DEFAULT, "[WARNING] Updating local item to be chained because it is unknown and we encountered a PCS error%@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 72), "serverTruthWorkloop");
    v91 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37;
    block[3] = &unk_1E875D470;
    v102 = *(id *)(a1 + 72);
    v103 = v59;
    dispatch_async(v91, block);

    v92 = v102;
LABEL_88:

LABEL_89:
LABEL_45:

LABEL_84:
    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 40), "recordID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "brc_isZoneRootRecordID");

  if (!v61)
  {
    objc_msgSend(*(id *)(a1 + 40), "recordID");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "brc_isAppLibraryRootRecordID");

    if (!v77)
      goto LABEL_20;
    v78 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 40), "recordID");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "brc_appLibraryRootZoneName");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "appLibraryByID:", v80);
    v53 = (id)objc_claimAutoreleasedReturnValue();

    v69 = v53;
    v70 = 2;
LABEL_57:
    objc_msgSend(v69, "setStateBits:", v70);
    goto LABEL_84;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "isPrivateZone"))
  {
    objc_msgSend(*(id *)(a1 + 48), "asPrivateClientZone");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "defaultAppLibrary");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setStateBits:", 2);

  }
LABEL_20:

}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_34(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "serverDB");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "serverZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("UPDATE server_items SET pcs_state = 3 WHERE item_id = %@ AND zone_rowid = %@ AND pcs_state = 0"), v2, v4);

}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_37(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "serverDB");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "serverZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("UPDATE server_items SET pcs_state = 3 WHERE item_id = %@ AND zone_rowid = %@ AND pcs_state = 0"), v2, v4);

}

uint64_t __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (**syncUpCompletionBlock)(id, void *, id, id);
  void *v9;
  id v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  syncUpCompletionBlock = (void (**)(id, void *, id, id))self->_syncUpCompletionBlock;
  if (syncUpCompletionBlock)
  {
    -[BRCServerZone clientZone](self->_serverZone, "clientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    syncUpCompletionBlock[2](syncUpCompletionBlock, v9, v6, v7);

    v10 = self->_syncUpCompletionBlock;
    self->_syncUpCompletionBlock = 0;

  }
  -[BRCSyncUpOperation hash](self, "hash");
  kdebug_trace();
  v11.receiver = self;
  v11.super_class = (Class)BRCSyncUpOperation;
  -[_BRCOperation finishWithResult:error:](&v11, sel_finishWithResult_error_, v6, v7);

}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)performShareUpdate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSMutableDictionary *renamedShareIDsToNames;
  NSMutableArray *iworkUnsharedShareIDs;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  BRCSyncUpOperation *v23;
  id v24;
  uint8_t buf[4];
  NSMutableDictionary *v26;
  __int16 v27;
  NSMutableArray *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_iworkUnsharedShareIDs, "count")
    || -[NSMutableDictionary count](self->_renamedShareIDsToNames, "count"))
  {
    -[BRCSyncUpOperation serverZone](self, "serverZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPrivateZone");

    if ((v6 & 1) == 0)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[BRCSyncUpOperation performShareUpdate:].cold.1();

    }
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      renamedShareIDsToNames = self->_renamedShareIDsToNames;
      iworkUnsharedShareIDs = self->_iworkUnsharedShareIDs;
      *(_DWORD *)buf = 138412802;
      v26 = renamedShareIDsToNames;
      v27 = 2112;
      v28 = iworkUnsharedShareIDs;
      v29 = 2112;
      v30 = v7;
      _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetching share IDs shared by us for renames: %@ and unshare: %@%@", buf, 0x20u);
    }

    v9 = (void *)MEMORY[0x1E0C99E20];
    -[NSMutableDictionary allKeys](self->_renamedShareIDsToNames, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObjectsFromArray:", self->_iworkUnsharedShareIDs);
    v12 = objc_alloc(MEMORY[0x1E0C94E18]);
    objc_msgSend(v11, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithRecordIDs:", v13);

    objc_msgSend(v14, "setShouldFetchAssetContent:", 0);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __41__BRCSyncUpOperation_performShareUpdate___block_invoke;
    v22 = &unk_1E8761C20;
    v23 = self;
    v24 = v4;
    objc_msgSend(v14, "setFetchRecordsCompletionBlock:", &v19);
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v14, v19, v20, v21, v22);

  }
  else
  {
    (*((void (**)(id, BRCSyncUpOperation *, _QWORD))v4 + 2))(v4, self, 0);
  }

}

void __41__BRCSyncUpOperation_performShareUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  uint64_t v45;
  _QWORD v46[5];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  id v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __41__BRCSyncUpOperation_performShareUpdate___block_invoke_2;
    v56[3] = &unk_1E8761BD0;
    v8 = v6;
    v57 = v8;
    if (objc_msgSend(v8, "brc_checkErrorsFromCloudKit:", v56))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v61 = v8;
        v62 = 2112;
        v63 = v9;
        _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] got an error while fetching the records and shares %@, but ignoring it%@", buf, 0x16u);
      }

    }
  }
  v37 = v7;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v5, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (v45)
  {
    v12 = *(_QWORD *)v53;
    v13 = *MEMORY[0x1E0C94A20];
    v39 = *MEMORY[0x1E0C94A88];
    v38 = *MEMORY[0x1E0D10D48];
    v40 = v5;
    v41 = a1;
    v42 = *MEMORY[0x1E0C94A20];
    v43 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v53 != v12)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "recordType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v13);

        if (v18)
        {
          v19 = v11;
          v20 = v16;
          v21 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "containsObject:", v15);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "objectForKeyedSubscript:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v20, "setPublicPermission:", 1);
            objc_msgSend(v20, "participants");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v49;
              do
              {
                for (j = 0; j != v25; ++j)
                {
                  if (*(_QWORD *)v49 != v26)
                    objc_enumerationMutation(v23);
                  v28 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                  if (objc_msgSend(v28, "type") != 1)
                    objc_msgSend(v20, "removeParticipant:", v28);
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
              }
              while (v25);
              v5 = v40;
              a1 = v41;
            }
            v11 = v19;
            v12 = v43;
LABEL_28:

          }
          else
          {
            v11 = v19;
            v12 = v43;
            if (v22)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "objectForKeyedSubscript:", v15);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", v39);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "brc_updateWithLogicalName:isFolder:", v23, objc_msgSend(v29, "isEqualToString:", v38));

              goto LABEL_28;
            }
          }
          objc_msgSend(v11, "addObject:", v20);

          v13 = v42;
        }

      }
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    }
    while (v45);
  }

  if (objc_msgSend(v11, "count"))
  {
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v37;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      __41__BRCSyncUpOperation_performShareUpdate___block_invoke_cold_2();

    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v11, 0);
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __41__BRCSyncUpOperation_performShareUpdate___block_invoke_47;
    v46[3] = &unk_1E8761BF8;
    v34 = *(id *)(a1 + 40);
    v46[4] = *(_QWORD *)(a1 + 32);
    v47 = v34;
    objc_msgSend(v33, "setModifyRecordsCompletionBlock:", v46);
    objc_msgSend(*(id *)(a1 + 32), "addSubOperation:", v33);

  }
  else
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    v32 = v37;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      __41__BRCSyncUpOperation_performShareUpdate___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __41__BRCSyncUpOperation_performShareUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    if (objc_msgSend(v3, "code") == 11)
    {

LABEL_6:
      v6 = 0;
      goto LABEL_10;
    }
    v5 = objc_msgSend(v3, "code");

    if (v5 == 2)
      goto LABEL_6;
  }
  else
  {

  }
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Got a permanent error %@ when fetching records and shares%@", (uint8_t *)&v11, 0x16u);
  }

  v6 = 1;
LABEL_10:

  return v6;
}

uint64_t __41__BRCSyncUpOperation_performShareUpdate___block_invoke_47(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a4);
}

- (void)_performShareUpdateAndModifyRecordsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__BRCSyncUpOperation__performShareUpdateAndModifyRecordsWithCompletion___block_invoke;
  v6[3] = &unk_1E8761C70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BRCSyncUpOperation performShareUpdate:](self, "performShareUpdate:", v6);

}

void __72__BRCSyncUpOperation__performShareUpdateAndModifyRecordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __72__BRCSyncUpOperation__performShareUpdateAndModifyRecordsWithCompletion___block_invoke_2;
    v4[3] = &unk_1E8761C48;
    v3 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_performModifyRecordsOrBatchOperationWithCompletion:", v4);

  }
}

uint64_t __72__BRCSyncUpOperation__performShareUpdateAndModifyRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __82__BRCSyncUpOperation__scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation__block_invoke;
  v2[3] = &unk_1E8761040;
  v2[4] = self;
  -[BRCSyncUpOperation _performShareUpdateAndModifyRecordsWithCompletion:](self, "_performShareUpdateAndModifyRecordsWithCompletion:", v2);
}

void __82__BRCSyncUpOperation__scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v5, v6);
    goto LABEL_8;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "shouldRecreateServerZoneAfterError:", v6))
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      __82__BRCSyncUpOperation__scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation__block_invoke_cold_1();

    goto LABEL_7;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "clientZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asPrivateClientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__BRCSyncUpOperation__scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation__block_invoke_2;
  v12[3] = &unk_1E875D738;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "createCloudKitZoneWithGroup:completion:", v9, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
LABEL_8:

}

void __82__BRCSyncUpOperation__scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "completedWithResult:error:", 0, v5);
  else
    objc_msgSend(WeakRetained, "_scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation");

}

- (void)_setSharingFieldsOnContentRecord:(id)a3 withProtectionData:(id)a4 baseToken:(id)a5 routingKey:(id)a6 forceOverwrite:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  int v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v7 = a7;
  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "recordType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("content"));

  if ((v16 & 1) != 0)
  {
    if (v12)
      goto LABEL_3;
LABEL_19:
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpOperation _setSharingFieldsOnContentRecord:withProtectionData:baseToken:routingKey:forceOverwrite:].cold.1();

    if (v13)
      goto LABEL_10;
    goto LABEL_11;
  }
  brc_bread_crumbs();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    -[BRCSyncUpOperation _setSharingFieldsOnContentRecord:withProtectionData:baseToken:routingKey:forceOverwrite:].cold.2();

  if (!v12)
    goto LABEL_19;
LABEL_3:
  objc_msgSend(v11, "mutableEncryptedPublicSharingKeyData");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(v11, "mutableEncryptedPublicSharingKeyData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToData:", v12);

    if ((v20 & 1) == 0)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v11, "mutableEncryptedPublicSharingKeyData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412802;
        v31 = v12;
        v32 = 2112;
        v33 = v25;
        v34 = 2112;
        v35 = v21;
        _os_log_fault_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Protection data mismatch between share and record being shared! (%@ vs %@)%@", (uint8_t *)&v30, 0x20u);

      }
      if (v7)
        objc_msgSend(v11, "setMutableEncryptedPublicSharingKeyData:", v12);
    }
  }
  if (v13)
LABEL_10:
    objc_msgSend(v11, "setBaseToken:", v13);
LABEL_11:
  if (v14)
    objc_msgSend(v11, "setRoutingKey:", v14);
  brc_bread_crumbs();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v30 = 138413314;
    v31 = v11;
    v32 = 2112;
    v33 = v12;
    v34 = 2112;
    v35 = v13;
    v36 = 2112;
    v37 = v14;
    v38 = 2112;
    v39 = v23;
    _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] updated content record %@ with protectionData %@ baseToken %@ routingKey %@%@", (uint8_t *)&v30, 0x34u);
  }

}

- (BOOL)_recordIsIWorkShareable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D10F00], "iWorkShareableExtensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extension"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "containsObject:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_performUpdateSharingProtectionDataIfNecessary:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD v32[6];
  _QWORD v33[5];
  id v34;
  _QWORD v35[6];

  v35[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_recordsNeedingUpdatedSharingProtectionInfo, "count"))
  {
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = v4;
    if (-[NSMutableArray count](self->_recordsNeedingUpdatedSharingProtectionInfo, "count"))
    {
      v5 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_recordsNeedingUpdatedSharingProtectionInfo, "objectAtIndexedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_alloc(MEMORY[0x1E0C95070]);
        objc_msgSend(v6, "recordID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v7, "initShareIDWithRecordID:serverZone:", v8, self->_serverZone);

        objc_msgSend(v27, "addObject:", v9);
        objc_msgSend(v6, "recordType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("content"));

        if (v11)
        {
          objc_msgSend(v6, "recordID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v12);
          goto LABEL_6;
        }
        while (++v5 < -[NSMutableArray count](self->_recordsNeedingUpdatedSharingProtectionInfo, "count"))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_recordsNeedingUpdatedSharingProtectionInfo, "objectAtIndexedSubscript:", v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_alloc(MEMORY[0x1E0C95070]);
          objc_msgSend(v6, "recordID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "initShareIDWithRecordID:serverZone:", v14, self->_serverZone);

          if ((objc_msgSend(v15, "isEqual:", v9) & 1) == 0)
          {

            break;
          }
          objc_msgSend(v12, "recordType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("content"));

          if (v17)
          {
            objc_msgSend(v12, "recordID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v18);

          }
LABEL_6:

        }
      }
      while (v5 < -[NSMutableArray count](self->_recordsNeedingUpdatedSharingProtectionInfo, "count"));
    }
    -[BRCSyncContext ckContainer](self->super._syncContext, "ckContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__23;
    v33[4] = __Block_byref_object_dispose__23;
    v34 = 0;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E18]), "initWithRecordIDs:", v27);
    objc_msgSend(v20, "setShouldFetchAssetContent:", 0);
    v21 = *MEMORY[0x1E0C94B60];
    v35[0] = *MEMORY[0x1E0C94B48];
    v35[1] = v21;
    v22 = *MEMORY[0x1E0C94B50];
    v35[2] = *MEMORY[0x1E0C94B58];
    v35[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDesiredKeys:", v23);

    v24 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke;
    v32[3] = &unk_1E8761C98;
    v32[4] = self;
    v32[5] = v33;
    objc_msgSend(v20, "setPerRecordCompletionBlock:", v32);
    v28[0] = v24;
    v28[1] = 3221225472;
    v28[2] = __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_54;
    v28[3] = &unk_1E8761CE8;
    v31 = v33;
    v30 = v26;
    v28[4] = self;
    v25 = v19;
    v29 = v25;
    objc_msgSend(v20, "setFetchRecordsCompletionBlock:", v28);
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v20);

    v4 = v26;
    _Block_object_dispose(v33, 8);

  }
  else
  {
    (*((void (**)(id, BRCSyncUpOperation *, _QWORD))v4 + 2))(v4, self, 0);
  }

}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  __int128 v34;
  int v35;
  uint64_t v36;
  uint64_t i;
  char v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  int v49;
  void *v50;
  NSObject *v51;
  __int128 v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  _BOOL4 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id obj;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  id v75;
  __int16 v76;
  id v77;
  __int16 v78;
  id v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "brc_isCloudKitUnknownItemError") & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  objc_msgSend(v7, "recordType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C94A20]);

  if (v12)
  {
    v13 = v7;
    objc_msgSend(v13, "publicSharingIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      brc_bread_crumbs();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_cold_1();

    }
    objc_msgSend(v13, "publicSharingIdentity");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "routingKey");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "baseToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "brc_shareItemID");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v64 = 0;
    v17 = 0;
    if (!v15)
      goto LABEL_57;
LABEL_27:
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = *(id *)(*(_QWORD *)(a1 + 32) + 584);
    v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    if (!v67)
      goto LABEL_56;
    v62 = v17;
    v53 = v10;
    v54 = v8;
    v55 = v7;
    LOBYTE(v35) = 0;
    v66 = *(_QWORD *)v70;
    v36 = *MEMORY[0x1E0C94B60];
    v60 = *MEMORY[0x1E0C94B48];
    v59 = *MEMORY[0x1E0C94B58];
    v58 = *MEMORY[0x1E0C94B50];
    *(_QWORD *)&v34 = 138412802;
    v52 = v34;
    v65 = *MEMORY[0x1E0C94B60];
    v56 = v16;
    while (1)
    {
      for (i = 0; i != v67; ++i)
      {
        v38 = v35;
        if (*(_QWORD *)v70 != v66)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(v39, "recordID", v52);
        v40 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject brc_itemIDWithSession:](v40, "brc_itemIDWithSession:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = objc_msgSend(v68, "isEqualToItemID:", v42);
        if (v35)
        {
          if (objc_msgSend(*(id *)(a1 + 32), "_recordIsIWorkShareable:", v39))
          {
            v43 = a1;
            objc_msgSend(v39, "encryptedValues");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", v36);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v45)
            {
              objc_msgSend(v39, "encryptedValues");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "setObject:forKeyedSubscript:", v15, v36);
              goto LABEL_42;
            }
            if ((objc_msgSend(v15, "isEqualToData:", v45) & 1) == 0)
            {
              brc_bread_crumbs();
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = v52;
                v75 = v45;
                v76 = 2112;
                v77 = v15;
                v78 = 2112;
                v79 = v46;
                _os_log_fault_impl(&dword_1CBD43000, v47, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: protection data mismatch! ignoring content records version (%@ to %@)%@", buf, 0x20u);
              }

LABEL_42:
            }

            a1 = v43;
            v16 = v56;
          }
          if (v16)
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v16, v60);
          if (v62)
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v62, v59);
          if (v64)
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v64, v58);
          objc_msgSend(v39, "recordType");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("content"));

          if (v49)
            objc_msgSend(*(id *)(a1 + 32), "_setSharingFieldsOnContentRecord:withProtectionData:baseToken:routingKey:forceOverwrite:", v39, v15, v16, v61, v57);
          goto LABEL_52;
        }
        if ((v38 & 1) != 0)
        {

          v8 = v54;
          v7 = v55;
          v10 = v53;
          v17 = v62;
          goto LABEL_55;
        }
LABEL_52:

        v36 = v65;
      }
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
      if (!v67)
      {
        v8 = v54;
        v7 = v55;
        v10 = v53;
        v17 = v62;
        goto LABEL_56;
      }
    }
  }
  objc_msgSend(v7, "recordType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("content"));

  if (v19)
  {
    objc_msgSend(v7, "mutableEncryptedPublicSharingKeyData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = (uint64_t *)MEMORY[0x1E0C94B60];
    if (v20)
    {
      v15 = v20;
      v23 = *v22;
    }
    else
    {
      objc_msgSend(v7, "encryptedValues");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *v22;
      objc_msgSend(v24, "objectForKeyedSubscript:", v23);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "mutableEncryptedPublicSharingKeyData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v25 != 0;

    objc_msgSend(v7, "encryptedValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      if (objc_msgSend(v27, "isEqualToData:", v15))
      {
        objc_msgSend(*(id *)(a1 + 32), "_recordIsIWorkShareable:", v7);
        goto LABEL_23;
      }
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138413058;
        v75 = v15;
        v76 = 2112;
        v77 = v27;
        v78 = 2112;
        v79 = v7;
        v80 = 2112;
        v81 = v28;
        _os_log_fault_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: protection data mismatch between content public sharing identity and web sharing data (%@ vs %@) for %@%@", buf, 0x2Au);
      }
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "_recordIsIWorkShareable:", v7))
        goto LABEL_23;
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_cold_2();
    }

LABEL_23:
    objc_msgSend(v7, "routingKey");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "baseToken");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v32 = v30;
    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C94B48]);
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v32;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "brc_itemIDWithSession:", v33);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C94B58]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C94B50]);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
LABEL_57:

      goto LABEL_58;
    }
    goto LABEL_27;
  }
  if (v7)
  {
    brc_bread_crumbs();
    obj = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_cold_3();
    v15 = 0;
    v61 = 0;
    v16 = 0;
    v68 = 0;
    v17 = 0;
    v64 = 0;
LABEL_55:

LABEL_56:
    goto LABEL_57;
  }
  v15 = 0;
  v61 = 0;
  v16 = 0;
  v68 = 0;
  v17 = 0;

LABEL_58:
}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  dispatch_group_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  dispatch_time_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v28 = a2;
  v5 = a3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v6 = dispatch_group_create();
    v7 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v8 = *MEMORY[0x1E0C94B60];
    v9 = *MEMORY[0x1E0D10C90];
    *(_QWORD *)&v10 = 138412290;
    v27 = v10;
    while (1)
    {
      if (v7 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "count", v27))
      {
        _Block_object_dispose(&v35, 8);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        goto LABEL_18;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "objectAtIndexedSubscript:", v36[3]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "encryptedValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {

      }
      else
      {
        v14 = objc_msgSend(*(id *)(a1 + 32), "_recordIsIWorkShareable:", v11);

        if (!v14)
          goto LABEL_16;
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v11;
          v41 = 2112;
          v42 = v15;
          _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] record %@ still needs web sharing protection data%@", buf, 0x16u);
        }

        dispatch_group_enter(v6);
        v17 = *(void **)(a1 + 40);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_55;
        v29[3] = &unk_1E8761CC0;
        v33 = *(_QWORD *)(a1 + 56);
        v18 = v11;
        v19 = *(_QWORD *)(a1 + 32);
        v30 = v18;
        v31 = v19;
        v34 = &v35;
        v20 = v6;
        v32 = v20;
        objc_msgSend(v17, "getNewWebSharingIdentityDataWithCompletionHandler:", v29);
        v21 = dispatch_time(0, 10000000000);
        if (dispatch_group_wait(v20, v21))
        {
          brc_bread_crumbs();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v27;
            v40 = v22;
            _os_log_fault_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Timed out while waiting for new web-sharing identity%@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", v9, 15, CFSTR("unreachable: Timed out while waiting for new web-sharing identity"));
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v26 = *(void **)(v25 + 40);
          *(_QWORD *)(v25 + 40) = v24;

        }
        v12 = v30;
      }

LABEL_16:
      v7 = v36[3] + 1;
      v36[3] = v7;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_18:

}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_55_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  objc_msgSend(*(id *)(a1 + 32), "encryptedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C94B60];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C94B60]);

  v11 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initShareIDWithRecordID:serverZone:", v12, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 648));

  for (i = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) + 1;
        i < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 584), "count");
        ++i)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 584), "objectAtIndexedSubscript:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(v15, "recordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initShareIDWithRecordID:serverZone:", v17, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 648));

    if (!objc_msgSend(v18, "isEqual:", v13))
    {

      break;
    }
    objc_msgSend(v15, "encryptedValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v5, v10);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = i;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (void)main
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[BRCSyncUpOperation hash](self, "hash");
  kdebug_trace();
  -[BRCSyncContext ckContainer](self->super._syncContext, "ckContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__BRCSyncUpOperation_main__block_invoke;
  v5[3] = &unk_1E8761D38;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  -[BRCSyncUpOperation _performUpdateSharingProtectionDataIfNecessary:](self, "_performUpdateSharingProtectionDataIfNecessary:", v5);

}

void __26__BRCSyncUpOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v4;
  id *v5;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  NSObject *v18;
  unint64_t v19;

  v5 = (id *)(a1 + 32);
  v4 = *(id **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v4, "completedWithResult:error:", 0, a3);
    return;
  }
  if ((objc_msgSend(v4[72], "count") & 1) == 0 && objc_msgSend(*((id *)*v5 + 72), "count"))
  {
    v6 = dispatch_group_create();
    if (objc_msgSend(*((id *)*v5 + 72), "count"))
    {
      v7 = 0;
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        dispatch_group_enter(v6);
        v17[0] = v8;
        v17[1] = 3221225472;
        v17[2] = __26__BRCSyncUpOperation_main__block_invoke_2;
        v17[3] = &unk_1E8761D10;
        v9 = *(void **)(a1 + 40);
        v17[4] = *(_QWORD *)(a1 + 32);
        v19 = v7;
        v18 = v6;
        objc_msgSend(v9, "getNewWebSharingIdentityDataWithCompletionHandler:", v17);

        v7 += 2;
      }
      while (v7 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "count"));
    }
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(*((id *)*v5 + 72), "count"))
  {
    brc_bread_crumbs();
    v6 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __26__BRCSyncUpOperation_main__block_invoke_cold_2();

    goto LABEL_13;
  }
LABEL_14:
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __26__BRCSyncUpOperation_main__block_invoke_cold_1();

  if (objc_msgSend(*((id *)*v5 + 81), "isPrivateZone")
    && (objc_msgSend(*((id *)*v5 + 81), "hasFetchedServerZoneState") & 1) == 0)
  {
    objc_msgSend(*((id *)*v5 + 81), "clientZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "asPrivateClientZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v5, "group");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __26__BRCSyncUpOperation_main__block_invoke_61;
    v16[3] = &unk_1E875D850;
    v16[4] = *v5;
    objc_msgSend(v14, "createCloudKitZoneWithGroup:completion:", v15, v16);

  }
  else
  {
    objc_msgSend(*v5, "_scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation");
  }
}

void __26__BRCSyncUpOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48) + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "brc_itemIDWithSession:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "recordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "brc_itemIDWithSession:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !v6 && (objc_msgSend(v11, "isEqualToItemID:", v14) & 1) != 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __26__BRCSyncUpOperation_main__block_invoke_2_cold_1();

    objc_msgSend(v7, "encryptedValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0C94B60];
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C94B60]);

    objc_msgSend(v8, "encryptedValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v5, v18);
    goto LABEL_12;
  }
  if ((objc_msgSend(v11, "isEqual:", v14) & 1) == 0)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      __26__BRCSyncUpOperation_main__block_invoke_2_cold_3();

    if (v6)
      goto LABEL_9;
    goto LABEL_16;
  }
  if (!v6)
  {
LABEL_16:
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      __26__BRCSyncUpOperation_main__block_invoke_2_cold_2();

  }
LABEL_9:
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
  {
    objc_msgSend(v7, "recordID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412802;
    v27 = v21;
    v28 = 2112;
    v29 = v6;
    v30 = 2112;
    v31 = v19;
    _os_log_error_impl(&dword_1CBD43000, v20, (os_log_type_t)0x90u, "[ERROR] Failed getting web sharing identity for %@ - %@%@", (uint8_t *)&v26, 0x20u);

  }
LABEL_12:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __26__BRCSyncUpOperation_main__block_invoke_61(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "completedWithResult:error:", 0, a2);
  else
    return objc_msgSend(v2, "_scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation");
}

- (NSMutableArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
  objc_storeStrong((id *)&self->_recordsToSave, a3);
}

- (NSMutableArray)packagesInFlight
{
  return self->_packagesInFlight;
}

- (void)setPackagesInFlight:(id)a3
{
  objc_storeStrong((id *)&self->_packagesInFlight, a3);
}

- (NSMutableArray)createdAppLibraryNames
{
  return self->_createdAppLibraryNames;
}

- (NSMutableOrderedSet)deletedRecordIDs
{
  return self->_deletedRecordIDs;
}

- (void)setDeletedRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deletedRecordIDs, a3);
}

- (NSMutableArray)iworkUnsharedShareIDs
{
  return self->_iworkUnsharedShareIDs;
}

- (void)setIworkUnsharedShareIDs:(id)a3
{
  objc_storeStrong((id *)&self->_iworkUnsharedShareIDs, a3);
}

- (NSMutableDictionary)renamedShareIDsToNames
{
  return self->_renamedShareIDsToNames;
}

- (void)setRenamedShareIDsToNames:(id)a3
{
  objc_storeStrong((id *)&self->_renamedShareIDsToNames, a3);
}

- (NSMutableArray)recordsNeedingNewSharingProtectionInfo
{
  return self->_recordsNeedingNewSharingProtectionInfo;
}

- (void)setRecordsNeedingNewSharingProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_recordsNeedingNewSharingProtectionInfo, a3);
}

- (NSMutableArray)recordsNeedingUpdatedSharingProtectionInfo
{
  return self->_recordsNeedingUpdatedSharingProtectionInfo;
}

- (void)setRecordsNeedingUpdatedSharingProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_recordsNeedingUpdatedSharingProtectionInfo, a3);
}

- (NSMutableDictionary)recordIDsToDeleteToEtags
{
  return self->_recordIDsToDeleteToEtags;
}

- (void)setRecordIDsToDeleteToEtags:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, a3);
}

- (NSMutableDictionary)pluginFieldsForRecordDeletesByID
{
  return self->_pluginFieldsForRecordDeletesByID;
}

- (void)setPluginFieldsForRecordDeletesByID:(id)a3
{
  objc_storeStrong((id *)&self->_pluginFieldsForRecordDeletesByID, a3);
}

- (BRCLocalItem)itemNeedingPCSChaining
{
  return self->_itemNeedingPCSChaining;
}

- (void)setItemNeedingPCSChaining:(id)a3
{
  objc_storeStrong((id *)&self->_itemNeedingPCSChaining, a3);
}

- (BRCDirectoryItem)itemNeedingBasehashSalting
{
  return self->_itemNeedingBasehashSalting;
}

- (void)setItemNeedingBasehashSalting:(id)a3
{
  objc_storeStrong((id *)&self->_itemNeedingBasehashSalting, a3);
}

- (NSMutableDictionary)conflictLosersToResolveByRecordID
{
  return self->_conflictLosersToResolveByRecordID;
}

- (void)setConflictLosersToResolveByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, a3);
}

- (NSString)stageID
{
  return self->_stageID;
}

- (void)setStageID:(id)a3
{
  objc_storeStrong((id *)&self->_stageID, a3);
}

- (id)syncUpCompletionBlock
{
  return self->_syncUpCompletionBlock;
}

- (void)setSyncUpCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (float)cost
{
  return self->_cost;
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (void)setServerZone:(id)a3
{
  objc_storeStrong((id *)&self->_serverZone, a3);
}

- (BOOL)encounteredErrorOnPCSChainedItem
{
  return self->_encounteredErrorOnPCSChainedItem;
}

- (BOOL)throttledItemInBatch
{
  return self->_throttledItemInBatch;
}

- (void)setThrottledItemInBatch:(BOOL)a3
{
  self->_throttledItemInBatch = a3;
}

- (BRCSyncUpCallbackProtocol)syncUpCallback
{
  return self->_syncUpCallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong(&self->_syncUpCompletionBlock, 0);
  objc_storeStrong((id *)&self->_stageID, 0);
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, 0);
  objc_storeStrong((id *)&self->_itemNeedingBasehashSalting, 0);
  objc_storeStrong((id *)&self->_itemNeedingPCSChaining, 0);
  objc_storeStrong((id *)&self->_pluginFieldsForRecordDeletesByID, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, 0);
  objc_storeStrong((id *)&self->_recordsNeedingUpdatedSharingProtectionInfo, 0);
  objc_storeStrong((id *)&self->_recordsNeedingNewSharingProtectionInfo, 0);
  objc_storeStrong((id *)&self->_renamedShareIDsToNames, 0);
  objc_storeStrong((id *)&self->_iworkUnsharedShareIDs, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_createdAppLibraryNames, 0);
  objc_storeStrong((id *)&self->_packagesInFlight, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong((id *)&self->_syncUpCallback, 0);
}

- (void)prepareWithMaxCost:retryAfter:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Can't prepare sync for a zone that is blocked%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)prepareWithMaxCost:retryAfter:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: items.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)prepareWithMaxCost:retryAfter:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] no record needs syncing at the moment.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)prepareWithMaxCost:retryAfter:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Because this is our first time syncing up, adding %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)prepareWithMaxCost:retryAfter:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] destroying shares instead of unsharing%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)prepareWithMaxCost:retryAfter:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Avoid syncing up a pristine zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)prepareWithMaxCost:retryAfter:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] %@ is not pristine and needs sync%@");
  OUTLINED_FUNCTION_2();
}

void __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_22_cold_1()
{
  NSObject *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*v1, "defaultClientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] Scheduling sync down for zone %@%@", v4);

  OUTLINED_FUNCTION_6();
}

void __80__BRCSyncUpOperation__performMetadataSaltingOperationIfNecessaryWithCompletion___block_invoke_22_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Postponing sync up for item %@%@");
  OUTLINED_FUNCTION_2();
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Uploaded an iWork package of size 0 (itemID: %@)%@");
  OUTLINED_FUNCTION_2();
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Unable to open iwork package %@%@");
  OUTLINED_FUNCTION_2();
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_33_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Forcing item dead in the server truth to re-upload as a rejected item - %@%@");
  OUTLINED_FUNCTION_2();
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_33_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Forcing sync up of dead parent %@%@");
  OUTLINED_FUNCTION_2();
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_33_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Blocking %@ from sync up until it is next modified because the server failed with a permanent error%@");
  OUTLINED_FUNCTION_2();
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_33_cold_4()
{
  NSObject *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*v1, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] ignoring error for %@ because an other item in the batch failed%@", v4);

  OUTLINED_FUNCTION_6();
}

void __74__BRCSyncUpOperation__performModifyRecordsOrBatchOperationWithCompletion___block_invoke_33_cold_5()
{
  NSObject *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*v1, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] skipping throttling item %@ even though it caused the failure%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)performShareUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.serverZone.isPrivateZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __41__BRCSyncUpOperation_performShareUpdate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] No shares need saving%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __41__BRCSyncUpOperation_performShareUpdate___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Saving shares %@ shared by us for unshare and rename%@");
  OUTLINED_FUNCTION_2();
}

void __82__BRCSyncUpOperation__scheduleShareUpdateAndModifyRecordsAndZoneCreationOperation__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] send metadata error: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_setSharingFieldsOnContentRecord:withProtectionData:baseToken:routingKey:forceOverwrite:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: protectionData%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setSharingFieldsOnContentRecord:withProtectionData:baseToken:routingKey:forceOverwrite:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [contentRecord.recordType isEqualToString:kBRRecordTypeContent]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: share.publicSharingIdentity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: content record is missing protection data %@%@");
  OUTLINED_FUNCTION_2();
}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !fetchedRecord%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __69__BRCSyncUpOperation__performUpdateSharingProtectionDataIfNecessary___block_invoke_55_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Failed to get new web sharing identity: %@%@");
  OUTLINED_FUNCTION_2();
}

void __26__BRCSyncUpOperation_main__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_9_0();
  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)v2 + 504);
  objc_msgSend(*(id *)(*(_QWORD *)v2 + 648), "clientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134218498;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = v1;
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: sending requestID:%lld for container %@%@", (uint8_t *)&v5, 0x20u);

}

void __26__BRCSyncUpOperation_main__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: invalid sharing records count%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __26__BRCSyncUpOperation_main__block_invoke_2_cold_1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "recordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, v3, "[DEBUG] got web sharing identity for %@%@", v4);

  OUTLINED_FUNCTION_6();
}

void __26__BRCSyncUpOperation_main__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __26__BRCSyncUpOperation_main__block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [firstItemID isEqual:secondItemID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
