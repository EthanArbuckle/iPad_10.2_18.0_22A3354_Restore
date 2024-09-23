@implementation BRCPCSChainBatchInfo

- (BRCPCSChainBatchInfo)initWithAppLibrary:(id)a3
{
  id v5;
  BRCPCSChainBatchInfo *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *fullyChainRecordBatch;
  uint64_t v11;
  NSMutableDictionary *fullyChainRecordInfoMap;
  uint64_t v13;
  NSMutableDictionary *halfChainedRecordMap;
  uint64_t v15;
  NSMutableSet *alreadyHalfChainedRecords;
  uint64_t v17;
  NSMutableArray *recordsForFirstPhase;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BRCPCSChainBatchInfo;
  v6 = -[BRCPCSChainBatchInfo init](&v20, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "mangledID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_should2PhasePCSChain = objc_msgSend(v8, "should2PhasePCSChain");

    v9 = objc_opt_new();
    fullyChainRecordBatch = v6->_fullyChainRecordBatch;
    v6->_fullyChainRecordBatch = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    fullyChainRecordInfoMap = v6->_fullyChainRecordInfoMap;
    v6->_fullyChainRecordInfoMap = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    halfChainedRecordMap = v6->_halfChainedRecordMap;
    v6->_halfChainedRecordMap = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    alreadyHalfChainedRecords = v6->_alreadyHalfChainedRecords;
    v6->_alreadyHalfChainedRecords = (NSMutableSet *)v15;

    if (v6->_should2PhasePCSChain)
    {
      v17 = objc_opt_new();
      recordsForFirstPhase = v6->_recordsForFirstPhase;
      v6->_recordsForFirstPhase = (NSMutableArray *)v17;

    }
    objc_storeStrong((id *)&v6->_appLibrary, a3);
  }

  return v6;
}

- (BOOL)containsRecordInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "itemType");
  -[BRCAppLibrary defaultClientZone](self->_appLibrary, "defaultClientZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "aliasTargetZoneIsShared");

  objc_msgSend(v5, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_fullyChainRecordInfoMap, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = 1;
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_halfChainedRecordMap, "objectForKeyedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v13 != 0;

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)prepareFirstPhaseRecordBatch
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSMutableArray *recordsForFirstPhase;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_should2PhasePCSChain)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_halfChainedRecordMap, "objectEnumerator", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          recordsForFirstPhase = self->_recordsForFirstPhase;
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "record");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](recordsForFirstPhase, "addObject:", v9);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
}

- (void)addFullyChainedRecordInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *recordsForFirstPhase;
  void *v27;
  unsigned int v28;
  unsigned int v29;
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
  unsigned int v47;
  void *v48;
  NSObject *v49;
  void *v50;
  BRCHalfChainInfo *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  BRCPCSChainBatchInfo *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCAppLibrary defaultClientZone](self->_appLibrary, "defaultClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "itemType");
  v9 = 0x1E0C95000uLL;
  if (v8 <= 8 && ((1 << v8) & 0x106) != 0)
  {
    objc_msgSend(v4, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentsRecordIDInZoneID:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("content"), v11);
    objc_msgSend(v4, "contentCKInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serializeSystemFields:", v13);

    -[NSMutableArray addObject:](self->_fullyChainRecordBatch, "addObject:", v12);
    -[NSMutableDictionary setObject:forKey:](self->_fullyChainRecordInfoMap, "setObject:forKey:", v4, v11);

  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "itemID");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "debugItemIDString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "structuralCKInfo");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "etag");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentCKInfo");
    v60 = v7;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "etag");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "debugItemIDString");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v62 = v41;
    v63 = 2112;
    v64 = v42;
    v65 = 2112;
    v66 = v44;
    v67 = 2112;
    v68 = v46;
    v69 = 2112;
    v70 = self;
    v71 = 2112;
    v72 = v14;
    _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] PCS chaining %@ (st:%@, ct:%@) to %@ for op %@%@", buf, 0x3Eu);

    v7 = v60;
    v9 = 0x1E0C95000;

  }
  objc_msgSend(v4, "itemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v4, "itemType");
  -[BRCAppLibrary defaultClientZone](self->_appLibrary, "defaultClientZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "serverZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", v17, v19, objc_msgSend(v4, "aliasTargetZoneIsShared"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v4, "itemType");
  if (v21 > 0xA
    || ((1 << v21) & 0x611) == 0
    || (-[NSMutableDictionary objectForKeyedSubscript:](self->_halfChainedRecordMap, "objectForKeyedSubscript:", v20),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v22, "record"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        !v23))
  {
    v23 = (void *)objc_msgSend(objc_alloc(*(Class *)(v9 + 72)), "initWithRecordType:recordID:", CFSTR("structure"), v20);
    objc_msgSend(v4, "structuralCKInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "serializeSystemFields:", v24);

    if (objc_msgSend(v4, "chainState") != 4
      && ((v28 = objc_msgSend(v4, "itemType"), v28 <= 0xA) && ((1 << v28) & 0x611) != 0
       || (v47 = objc_msgSend(v4, "itemType"), v47 <= 8) && ((1 << v47) & 0x106) != 0))
    {
      objc_msgSend(v23, "setWantsChainPCS:", 1);
      v29 = objc_msgSend(v4, "itemType");
      if (v29 > 8 || ((1 << v29) & 0x106) == 0 || !self->_should2PhasePCSChain)
        goto LABEL_23;
      recordsForFirstPhase = self->_recordsForFirstPhase;
      v27 = v23;
    }
    else
    {
      v25 = objc_msgSend(v4, "itemType");
      if (v25 > 0xA || ((1 << v25) & 0x611) == 0)
        goto LABEL_23;
      recordsForFirstPhase = self->_alreadyHalfChainedRecords;
      v27 = v20;
    }
    objc_msgSend(recordsForFirstPhase, "addObject:", v27);
    goto LABEL_23;
  }
  if (self->_should2PhasePCSChain)
    -[NSMutableArray addObject:](self->_recordsForFirstPhase, "addObject:", v23);
  -[NSMutableDictionary removeObjectForKey:](self->_halfChainedRecordMap, "removeObjectForKey:", v20);
LABEL_23:
  -[NSMutableArray addObject:](self->_fullyChainRecordBatch, "addObject:", v23);
  -[NSMutableDictionary setObject:forKey:](self->_fullyChainRecordInfoMap, "setObject:forKey:", v4, v20);
  objc_msgSend(v4, "parentID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary defaultClientZone](self->_appLibrary, "defaultClientZone");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "serverZone");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", 0, v32, objc_msgSend(v4, "aliasTargetZoneIsShared"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_halfChainedRecordMap, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34 || (objc_msgSend(v33, "brc_isZoneRootRecordID") & 1) != 0)
    goto LABEL_40;
  if ((-[NSMutableSet containsObject:](self->_alreadyHalfChainedRecords, "containsObject:", v33) & 1) == 0)
  {
    v59 = v7;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_fullyChainRecordInfoMap, "objectForKeyedSubscript:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      brc_bread_crumbs();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
        -[BRCPCSChainBatchInfo addFullyChainedRecordInfo:].cold.3();

    }
    v34 = (void *)objc_msgSend(objc_alloc(*(Class *)(v9 + 72)), "initWithRecordType:recordID:", CFSTR("structure"), v33);
    -[BRCAppLibrary db](self->_appLibrary, "db");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAppLibrary defaultClientZone](self->_appLibrary, "defaultClientZone");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dbRowID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v57, "fetch:", CFSTR("SELECT pcs_state, item_stat_ckinfo FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), v36, v38);

    v40 = v39;
    if (objc_msgSend(v39, "next"))
    {
      if (objc_msgSend(v39, "intAtIndex:", 0) < 2)
      {
        objc_msgSend(v39, "objectOfClass:atIndex:", objc_opt_class(), 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v59;
        if (!v50)
        {
          brc_bread_crumbs();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
            -[BRCPCSChainBatchInfo addFullyChainedRecordInfo:].cold.1();

          v7 = v59;
        }
        objc_msgSend(v34, "serializeSystemFields:", v50);
        objc_msgSend(v34, "setWantsChainPCS:", 1);
        v51 = -[BRCHalfChainInfo initWithRecord:ckInfo:]([BRCHalfChainInfo alloc], "initWithRecord:ckInfo:", v34, v50);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_halfChainedRecordMap, "setObject:forKeyedSubscript:", v51, v33);

        goto LABEL_39;
      }
      -[NSMutableSet addObject:](self->_alreadyHalfChainedRecords, "addObject:", v33);
    }
    else
    {
      brc_bread_crumbs();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
        -[BRCPCSChainBatchInfo addFullyChainedRecordInfo:].cold.2();

    }
    v7 = v59;
LABEL_39:

LABEL_40:
  }

}

- (void)_chainPreppedRecordToParent:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v4 = a3;
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_fullyChainRecordInfoMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("content")))
  {
    objc_msgSend(v6, "itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pcsChainDocumentStructureReferenceInZoneID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setParent:", v10);
  }
  else
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("structure")))
    {
      -[BRCAppLibrary defaultClientZone](self->_appLibrary, "defaultClientZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serverZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "parentID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pcsChainParentReferenceInZone:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "parentID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "validatingDirectoryReferenceInZone:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setParent:", v14);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("parent"));

    }
    else
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[BRCPCSChainBatchInfo _chainPreppedRecordToParent:].cold.1();

    }
  }

}

- (void)chainPreparedRecordBatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  NSMutableArray *fullyChainRecordBatch;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  NSMutableDictionary *halfChainedRecordMap;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_should2PhasePCSChain)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCPCSChainBatchInfo chainPreparedRecordBatch:].cold.3();

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 1;
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    objc_msgSend(v8, "recordID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableArray count](self->_fullyChainRecordBatch, "count"))
    {
      v23 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_fullyChainRecordBatch, "objectAtIndexedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "recordID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v22 && objc_msgSend(v25, "isEqual:", v22))
        {
          -[NSMutableArray setObject:atIndexedSubscript:](self->_fullyChainRecordBatch, "setObject:atIndexedSubscript:", v8, v23);
          v27 = v8;

          objc_msgSend(v27, "sanitizeShortTokenFields");
          objc_msgSend(v27, "protectionData");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
          {
            brc_bread_crumbs();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v53 = v30;
              _os_log_fault_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: preppedRecord.protectionData%@", buf, 0xCu);
            }

          }
          if (v9 >= objc_msgSend(v5, "count"))
          {

            v29 = 0;
            v8 = 0;
          }
          else
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "recordID");
            v29 = objc_claimAutoreleasedReturnValue();
            ++v9;
          }

          v22 = (void *)v29;
        }
        else
        {
          v27 = v24;
        }
        -[BRCPCSChainBatchInfo _chainPreppedRecordToParent:](self, "_chainPreppedRecordToParent:", v27);

        ++v23;
      }
      while (v23 < -[NSMutableArray count](self->_fullyChainRecordBatch, "count"));
    }
    v32 = v9 - (v8 != 0);
    v33 = -[NSMutableDictionary count](self->_halfChainedRecordMap, "count") + v32;
    if (v33 != objc_msgSend(v5, "count"))
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        -[BRCPCSChainBatchInfo chainPreparedRecordBatch:].cold.2();

    }
    for (; v32 < objc_msgSend(v5, "count"); ++v32)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      halfChainedRecordMap = self->_halfChainedRecordMap;
      objc_msgSend(v34, "recordID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](halfChainedRecordMap, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
        brc_bread_crumbs();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v43;
          _os_log_fault_impl(&dword_1CBD43000, v38, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: halfChainInfo != nil%@", buf, 0xCu);
        }

      }
      objc_msgSend(v37, "setRecord:", v34);

    }
  }
  else
  {
    if (objc_msgSend(v4, "count"))
    {
      brc_bread_crumbs();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        -[BRCPCSChainBatchInfo chainPreparedRecordBatch:].cold.1();

    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v10 = self->_fullyChainRecordBatch;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v49 != v13)
            objc_enumerationMutation(v10);
          -[BRCPCSChainBatchInfo _chainPreppedRecordToParent:](self, "_chainPreppedRecordToParent:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      }
      while (v12);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_halfChainedRecordMap, "objectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v45 != v18)
            objc_enumerationMutation(v8);
          fullyChainRecordBatch = self->_fullyChainRecordBatch;
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "record");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray insertObject:atIndex:](fullyChainRecordBatch, "insertObject:atIndex:", v21, v17 + j);

        }
        v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        v17 += j;
      }
      while (v16);
    }
  }

}

- (unint64_t)batchCount
{
  uint64_t v3;

  v3 = -[NSMutableDictionary count](self->_halfChainedRecordMap, "count");
  return -[NSMutableArray count](self->_fullyChainRecordBatch, "count") + v3;
}

- (unint64_t)chainedRecordsCount
{
  return -[NSMutableArray count](self->_fullyChainRecordBatch, "count");
}

- (NSArray)recordsForFirstPhase
{
  return (NSArray *)self->_recordsForFirstPhase;
}

- (NSArray)recordsForSecondPhase
{
  return (NSArray *)self->_fullyChainRecordBatch;
}

- (BOOL)should2PhasePCSChain
{
  return self->_should2PhasePCSChain;
}

- (NSDictionary)halfChainedRecordMap
{
  return &self->_halfChainedRecordMap->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_recordsForFirstPhase, 0);
  objc_storeStrong((id *)&self->_alreadyHalfChainedRecords, 0);
  objc_storeStrong((id *)&self->_halfChainedRecordMap, 0);
  objc_storeStrong((id *)&self->_fullyChainRecordInfoMap, 0);
  objc_storeStrong((id *)&self->_fullyChainRecordBatch, 0);
}

- (void)addFullyChainedRecordInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: parentCKInfo%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addFullyChainedRecordInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: No parent item?!?!%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addFullyChainedRecordInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_fullyChainRecordInfoMap[parentRecordID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_chainPreppedRecordToParent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: unkown record type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)chainPreparedRecordBatch:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: preppedRecords.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)chainPreparedRecordBatch:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: j + _halfChainedRecordMap.count == preppedRecords.count%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)chainPreparedRecordBatch:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Received records from first PCS step: %@%@");
  OUTLINED_FUNCTION_2();
}

@end
