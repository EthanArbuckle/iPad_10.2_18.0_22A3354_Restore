@implementation BRCSyncUpOperationBuilder

- (BRCSyncUpOperationBuilder)init
{
  BRCSyncUpOperationBuilder *v2;
  uint64_t v3;
  NSMutableSet *fullyChainedParentIDWhitelist;
  uint64_t v5;
  NSMutableSet *halfChainedParentIDWhitelist;
  uint64_t v7;
  NSMutableDictionary *parentItemIDToChildBasehashSalt;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRCSyncUpOperationBuilder;
  v2 = -[BRCSyncUpOperationBuilder init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    fullyChainedParentIDWhitelist = v2->_fullyChainedParentIDWhitelist;
    v2->_fullyChainedParentIDWhitelist = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    halfChainedParentIDWhitelist = v2->_halfChainedParentIDWhitelist;
    v2->_halfChainedParentIDWhitelist = (NSMutableSet *)v5;

    v7 = objc_opt_new();
    parentItemIDToChildBasehashSalt = v2->_parentItemIDToChildBasehashSalt;
    v2->_parentItemIDToChildBasehashSalt = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (unsigned)shouldPCSChainStatusForItem:(id)a3
{
  id v4;
  unsigned __int8 v5;
  int v6;
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
  void *v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  unsigned int v23;
  unsigned int v24;
  int v25;
  int v26;
  char v27;
  int v28;
  char v29;
  unsigned int v30;
  int v31;
  char v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isSharedToMeChildItem"))
  {
    v32 = 0;
    v6 = objc_msgSend(v4, "isNewToServer:", &v32);
    if ((objc_msgSend(v4, "isSharedToMeTopLevelItem") & 1) != 0)
    {
      objc_msgSend(v4, "asSharedToMeTopLevelItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sharedAliasItemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v4, "itemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "st");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parentID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "appLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mangledID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCSyncUpOperationBuilder op](self, "op");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serverZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clientZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v16, "isPrivateZone")
      || (objc_msgSend(v8, "isDocumentsFolder") & 1) != 0
      || (objc_msgSend(v4, "parentClientZone"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "isEqualToClientZone:", v16),
          v17,
          !v18))
    {
      v5 = 1;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v16, "asPrivateClientZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "optimisticallyPCSChainWithSession:", self->_session))
    {
      v20 = objc_msgSend(v13, "optimisticallyPCSChainDuringResetWithSession:", self->_session);
      if (v32)
        v21 = v20;
      else
        v21 = 1;
    }
    else
    {
      v21 = 0;
    }
    v31 = objc_msgSend(v13, "should2PhasePCSChain");
    v23 = objc_msgSend(v19, "pcsChainStateForItem:", v8);
    if ((v23 & 0xFFFFFFFE) == 2)
    {
      if (objc_msgSend(v4, "isDirectory"))
        -[NSMutableSet addObject:](self->_fullyChainedParentIDWhitelist, "addObject:", v8);
      if (v6)
        v5 = 8;
      else
        v5 = 16;
      goto LABEL_56;
    }
    v24 = v23;
    if ((-[NSMutableSet containsObject:](self->_fullyChainedParentIDWhitelist, "containsObject:", v10) & 1) != 0)
    {
LABEL_26:
      -[NSMutableSet addObject:](self->_fullyChainedParentIDWhitelist, "addObject:", v10);
      if (objc_msgSend(v4, "isDirectory"))
        -[NSMutableSet addObject:](self->_fullyChainedParentIDWhitelist, "addObject:", v8);
      v5 = 8;
      goto LABEL_56;
    }
    if ((-[NSMutableSet containsObject:](self->_halfChainedParentIDWhitelist, "containsObject:", v10) & 1) != 0)
    {
      v25 = 4;
    }
    else
    {
      v25 = objc_msgSend(v19, "pcsChainStateForItem:", v10);
      if ((v25 & 0xFFFFFFFE) == 2)
        goto LABEL_26;
    }
    v30 = v25;
    if (v21 && objc_msgSend(v4, "isInDocumentOrTrashScope"))
    {
      if (objc_msgSend(v4, "isDirectory"))
      {
        if (v30 < 2 || (objc_msgSend(v19, "parentIDHasLiveUnchainedChildren:", v8) & 1) != 0)
        {
          if (v24 < 2)
            v26 = 1;
          else
            v26 = v6;
          if (v26 != 1)
            goto LABEL_55;
          goto LABEL_46;
        }
        -[NSMutableSet addObject:](self->_fullyChainedParentIDWhitelist, "addObject:", v8);
LABEL_58:
        v5 = 4;
        goto LABEL_56;
      }
      if (v24 < 2)
        v28 = v31;
      else
        v28 = 0;
      if (v30 >= 2 && !v28)
        goto LABEL_58;
      v29 = objc_msgSend(v4, "isDocument");
      if (v24 > 1 || (v29 & 1) == 0)
      {
LABEL_55:
        v5 = 1;
        goto LABEL_56;
      }
    }
    else
    {
      v27 = v6 ^ 1;
      if (v24 < 2)
        v27 = 1;
      if ((v27 & 1) != 0)
        goto LABEL_55;
      if (objc_msgSend(v4, "isDirectory"))
LABEL_46:
        -[NSMutableSet addObject:](self->_halfChainedParentIDWhitelist, "addObject:", v8);
    }
    v5 = 2;
LABEL_56:

    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isKnownByServer"))
    v5 = 32;
  else
    v5 = 8;
LABEL_17:

  return v5;
}

- (BOOL)_checkIfShouldDedicateOpToSaltingBasehashItem:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  BRCDirectoryItem *v11;
  BRCDirectoryItem *itemNeedingBasehashSalting;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSData *v18;
  NSData *rootChildBasehashSalt;
  NSData *v20;
  NSData *v21;
  NSData *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *parentItemIDToChildBasehashSalt;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSMutableDictionary *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  int v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isDead") & 1) == 0)
  {
    v5 = 0;
    if (!objc_msgSend(v4, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", 0))
      goto LABEL_27;
    objc_msgSend(v4, "st");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "parentClientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "saltingStateForItemID:", v7);
    if (v9 > 2)
    {
      if (v9 == -1 && !self->_rootChildBasehashSalt && objc_msgSend(v7, "isNonDesktopRoot"))
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_parentItemIDToChildBasehashSalt, "objectForKeyedSubscript:", v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          brc_bread_crumbs();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
            -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:].cold.3();

        }
        objc_msgSend(v4, "parentClientZone");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "asPrivateClientZone");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "childBaseSaltForItemID:", v7);
        v18 = (NSData *)objc_claimAutoreleasedReturnValue();
        rootChildBasehashSalt = self->_rootChildBasehashSalt;
        self->_rootChildBasehashSalt = v18;

        v20 = self->_rootChildBasehashSalt;
        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "brc_generateSaltingKey");
          v21 = (NSData *)objc_claimAutoreleasedReturnValue();
          v22 = self->_rootChildBasehashSalt;
          self->_rootChildBasehashSalt = v21;

          brc_bread_crumbs();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            -[NSData brc_truncatedSHA256](self->_rootChildBasehashSalt, "brc_truncatedSHA256");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "brc_hexadecimalString");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "debugDescription");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = 138412802;
            v44 = v37;
            v45 = 2112;
            v46 = v38;
            v47 = 2112;
            v48 = v23;
            _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated root child basehash salt %@ for %@%@", (uint8_t *)&v43, 0x20u);

          }
          v20 = self->_rootChildBasehashSalt;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parentItemIDToChildBasehashSalt, "setObject:forKeyedSubscript:", v20, v7);
      }
    }
    else if ((objc_msgSend(v4, "localDiffs") & 0x1000000060) != 0)
    {
      objc_msgSend(v8, "itemByItemID:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "asDirectory");
      v11 = (BRCDirectoryItem *)objc_claimAutoreleasedReturnValue();
      itemNeedingBasehashSalting = self->_itemNeedingBasehashSalting;
      self->_itemNeedingBasehashSalting = v11;

      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 1;
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:].cold.2(v7, (uint64_t)v13, v14);
      goto LABEL_24;
    }
    if (!objc_msgSend(v4, "isDirectory"))
    {
      v5 = 0;
      goto LABEL_26;
    }
    objc_msgSend(v4, "clientZone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "childBaseSaltForItemID:", v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      parentItemIDToChildBasehashSalt = self->_parentItemIDToChildBasehashSalt;
      objc_msgSend(v4, "itemID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](parentItemIDToChildBasehashSalt, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        brc_bread_crumbs();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
          -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:].cold.1();

      }
      objc_msgSend(MEMORY[0x1E0C99D50], "brc_generateSaltingKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "itemID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "debugDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138412802;
        v44 = v13;
        v45 = 2112;
        v46 = v35;
        v47 = 2112;
        v48 = v30;
        _os_log_debug_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated child basehash salt %@ for %@%@", (uint8_t *)&v43, 0x20u);

      }
    }
    v32 = self->_parentItemIDToChildBasehashSalt;
    objc_msgSend(v4, "itemID");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v13, v14);
    v5 = 0;
LABEL_24:

LABEL_26:
    goto LABEL_27;
  }
  v5 = 0;
LABEL_27:

  return v5;
}

- (BOOL)_checkIfShouldDedicateOpToPCSChainingItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSMutableSet *fullyChainedParentIDWhitelist;
  void *v15;
  void *v16;
  BOOL v17;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  unsigned int v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  NSObject *v28;

  v5 = a3;
  if ((objc_msgSend(v5, "isDead") & 1) != 0)
    goto LABEL_11;
  objc_msgSend(v5, "appLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mangledID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "should2PhasePCSChain");

  if ((objc_msgSend(v5, "isDeadOrMissingInServerTruth") & 1) != 0
    || (objc_msgSend(v5, "localDiffs") & 0x20) == 0
    || (objc_msgSend(v5, "isDirectory") & 1) == 0 && (objc_msgSend(v5, "isDocument") & v9) != 1)
  {
    goto LABEL_11;
  }
  objc_msgSend(v5, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isDocumentsFolder"))
    goto LABEL_7;
  objc_msgSend(v5, "clientZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isPrivateZone");

  if (!v12)
    goto LABEL_11;
  objc_msgSend(v5, "clientZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "asPrivateClientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  fullyChainedParentIDWhitelist = self->_fullyChainedParentIDWhitelist;
  objc_msgSend(v5, "st");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "parentID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](fullyChainedParentIDWhitelist, "containsObject:", v16))
  {

  }
  else
  {
    objc_msgSend(v5, "st");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "parentID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v10, "pcsChainStateForItem:", v20) & 0xFFFFFFFE;

    if (v21 != 2)
    {
LABEL_7:

LABEL_11:
      v17 = 0;
      goto LABEL_12;
    }
  }
  objc_msgSend(v5, "itemID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v10, "pcsChainStateForItem:", v22);

  if (v23 < 2)
    v24 = v9;
  else
    v24 = 0;
  if ((v24 & 1) == 0)
  {
    if ((v23 & 0xFFFFFFFE) == 2)
      goto LABEL_7;
    objc_msgSend(v5, "itemID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v10, "parentIDHasLiveUnchainedChildren:", v25);

    if (!v26)
      goto LABEL_7;
  }
  brc_bread_crumbs();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToPCSChainingItem:].cold.1(v5, (uint64_t)v27, v28);

  objc_storeStrong((id *)&self->_itemNeedingPCSChaining, a3);
  v17 = 1;
LABEL_12:

  return v17;
}

- (BOOL)checkIfSyncAllowedInSharedZoneForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;

  v4 = a3;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "isSharedZone")
    || objc_msgSend(v4, "isSharedToMeTopLevelItem") && (objc_msgSend(v4, "isDead") & 1) != 0)
  {
    v7 = 1;
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isDeadOrMissingInServerTruth")
    && objc_msgSend(v4, "isSharedToMeTopLevelItem"))
  {
    objc_msgSend(v4, "serverZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "state") & 4) != 0)
    {

    }
    else
    {
      v9 = objc_msgSend(v4, "localDiffs");

      if ((v9 & 0x400000000000000) != 0)
      {
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:].cold.2();

LABEL_24:
        v7 = 0;
        goto LABEL_25;
      }
    }
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:].cold.1();

    -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v6);
    goto LABEL_24;
  }
  objc_msgSend(v4, "clientZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serverItemByItemID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = v14;
  else
    v15 = v4;
  v16 = objc_msgSend(v15, "sharingOptions");
  v7 = (v16 & 0x20) == 0;
  if ((v16 & 0x20) != 0)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:].cold.3();

    -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, v14, v6);
  }

LABEL_25:
  return v7;
}

- (float)addDeletionOfItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v11;
  NSObject *v12;

  v4 = a3;
  if (objc_msgSend(v4, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpOperationBuilder addDeletionOfItem:].cold.1();

  }
  objc_msgSend(v4, "structureRecordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "st");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ckInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCSyncUpOperationBuilder addDeletionOfRecordID:ckInfo:](self, "addDeletionOfRecordID:ckInfo:", v5, v7);
  v9 = v8;

  return v9;
}

- (float)addDeletionOfRecordID:(id)a3 ckInfo:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  int v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deletedRecordIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v6);

  if (objc_msgSend(v7, "hasEtag"))
  {
    objc_msgSend(v7, "etag");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordIDsToDeleteToEtags");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v10;
    v14 = v6;
LABEL_7:
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, v14);
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "hasEtagBeforeCrossZoneMove"))
  {
    objc_msgSend(v8, "pluginFieldsForRecordDeletesByID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v10 = objc_opt_new();
      objc_msgSend(v8, "pluginFieldsForRecordDeletesByID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, v6);

    }
    objc_msgSend(v7, "etagBeforeCrossZoneMove");
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("br_etagInPreviousZone");
    v11 = v10;
    v13 = v12;
    goto LABEL_7;
  }
  brc_bread_crumbs();
  v10 = objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = v10;
    _os_log_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] item should really have an etag%@", (uint8_t *)&v27, 0xCu);
  }
LABEL_8:

  if (objc_msgSend(v7, "hasDeletionChangeToken"))
  {
    -[__CFString recordName](v6, "recordName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("shareAlias/"));

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v8, "pluginFieldsForRecordDeletesByID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v20 = (void *)objc_opt_new();
        objc_msgSend(v8, "pluginFieldsForRecordDeletesByID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v6);

      }
      objc_msgSend(v7, "deletionChangeToken");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("br_deleteChangeToken"));

    }
  }
  -[BRCSyncUpOperationBuilder defaults](self, "defaults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "syncUpStructureDeleteCost");
  v25 = v24;

  return v25;
}

- (id)_getChildBasehashSaltForItemID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_parentItemIDToChildBasehashSalt, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[BRCSyncUpOperation serverZone](self->_op, "serverZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "childBaseSaltForItemID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parentItemIDToChildBasehashSalt, "setObject:forKeyedSubscript:", v12, v4);

      v8 = 0;
      v6 = 0;
      goto LABEL_7;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parentItemIDToChildBasehashSalt, "setObject:forKeyedSubscript:", v6, v4);
    goto LABEL_6;
  }
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
LABEL_6:
    v8 = v6;
    v6 = v8;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (id)_getChildBasehashSaltForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", 1)
    && objc_msgSend(v4, "isDirectory"))
  {
    objc_msgSend(v4, "itemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder _getChildBasehashSaltForItemID:](self, "_getChildBasehashSaltForItemID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_getSaltForItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  NSObject *v12;

  v4 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsEnhancedDrivePrivacy");

  v7 = 0;
  if (v6)
  {
    if ((objc_msgSend(v4, "isSharedToMeTopLevelItem") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v4, "st");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "parentID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          -[BRCSyncUpOperationBuilder _getSaltForItem:].cold.1();

      }
      -[BRCSyncUpOperationBuilder _getChildBasehashSaltForItemID:](self, "_getChildBasehashSaltForItemID:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (id)_generateSaltGetterBlock
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__BRCSyncUpOperationBuilder__generateSaltGetterBlock__block_invoke;
  v5[3] = &unk_1E87632B0;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1D17A6DB0](v5, a2);
  v3 = (void *)MEMORY[0x1D17A6DB0]();

  return v3;
}

uint64_t __53__BRCSyncUpOperationBuilder__generateSaltGetterBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSaltForItem:", a2);
}

- (id)_generateChildBasehashSaltGetterBlock
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__BRCSyncUpOperationBuilder__generateChildBasehashSaltGetterBlock__block_invoke;
  v5[3] = &unk_1E87632B0;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1D17A6DB0](v5, a2);
  v3 = (void *)MEMORY[0x1D17A6DB0]();

  return v3;
}

uint64_t __66__BRCSyncUpOperationBuilder__generateChildBasehashSaltGetterBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getChildBasehashSaltForItem:", a2);
}

- (float)addEditOfSharedTopLevelItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  float v9;
  __int16 v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  float v24;
  void *v25;
  NSObject *v26;
  float v27;
  void *v29;
  NSObject *v30;
  int v31;
  void *v32;
  const char *v33;
  void *v34;
  int v35;
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSharedZone");

  if (!v7)
  {
    v10 = objc_msgSend(v4, "localDiffs");
    objc_msgSend(v4, "parentClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqualToClientZone:", v13);

    if ((v14 & 1) == 0)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v35 = 138412546;
        v36 = (const char *)v4;
        v37 = 2112;
        v38 = v25;
        _os_log_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] Fake syncing up share alias in the wrong zone! %@%@", (uint8_t *)&v35, 0x16u);
      }
      goto LABEL_15;
    }
    if ((v10 & 0x1A69) == 0)
    {
LABEL_16:
      objc_msgSend(v5, "serverZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v8);
      goto LABEL_17;
    }
    objc_msgSend(v4, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serverAliasItemForSharedItem:inZone:", v4, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[BRCSyncUpOperationBuilder shouldPCSChainStatusForItem:](self, "shouldPCSChainStatusForItem:", v4);
    objc_msgSend(v5, "serverZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:", v17 == 0, v18, v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      if ((v18 & 0x2C) != 0)
        v33 = "pcs chained ";
      else
        v33 = "";
      objc_msgSend(v8, "description");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 136315650;
      v36 = v33;
      v37 = 2112;
      v38 = v34;
      v39 = 2112;
      v40 = v20;
      _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sshared document alias record %@%@", (uint8_t *)&v35, 0x20u);

    }
    if (v8)
    {
      objc_msgSend(v5, "recordsToSave");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v8);

      if (objc_msgSend(v4, "isFromInitialScan"))
      {
        -[BRCSyncUpOperationBuilder defaults](self, "defaults");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "syncUpInitialItemCost");
      }
      else
      {
        v31 = objc_msgSend(v4, "isKnownByServer");
        -[BRCSyncUpOperationBuilder defaults](self, "defaults");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v32;
        if (v31)
          objc_msgSend(v32, "syncUpStructureEditCost");
        else
          objc_msgSend(v32, "syncUpStructureCreateCost");
      }
      v27 = v24;

      goto LABEL_18;
    }
LABEL_23:
    v27 = -1.0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v4, "isDocument"))
  {
    if (objc_msgSend(v4, "isDirectory"))
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[BRCSyncUpOperationBuilder addEditOfSharedTopLevelItem:].cold.1((uint64_t)v25, v26);
LABEL_15:

      goto LABEL_16;
    }
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpOperationBuilder addEditOfSharedTopLevelItem:].cold.2();

    goto LABEL_23;
  }
  objc_msgSend(v4, "asDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSyncUpOperationBuilder addEditOfDocument:](self, "addEditOfDocument:", v8);
LABEL_17:
  v27 = v9;
LABEL_18:

LABEL_19:
  return v27;
}

- (float)addDeletionOfSharedTopLevelItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  float v22;
  void *v23;
  NSObject *v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSharedZone");

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(v4, "asShareableItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initShareIDWithShareableItem:", v9);

    -[BRCSyncUpOperationBuilder op](self, "op");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deletedRecordIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v10);

    -[BRCSyncUpOperationBuilder defaults](self, "defaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "syncUpDocumentDeleteCost");
    v15 = v14;

  }
  else
  {
    -[BRCSyncUpOperationBuilder op](self, "op");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "serverZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "structureRecordIDInZone:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCSyncUpOperationBuilder addDeletionOfSharedTopLevelItem:].cold.1();

      objc_msgSend(v4, "st");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ckInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder addDeletionOfRecordID:ckInfo:](self, "addDeletionOfRecordID:ckInfo:", v10, v21);
    }
    else
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138412290;
        v27 = v23;
        _os_log_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] syncing the structure of an item without an alias item%@", (uint8_t *)&v26, 0xCu);
      }

      -[BRCSyncUpOperationBuilder op](self, "op");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "serverZone");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v21);
    }
    v15 = v22;

  }
  return v15;
}

- (void)prepareAppLibraryRootSyncUpForItem:(id)a3
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;

  v4 = a3;
  objc_msgSend(v4, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mangledID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "clientZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isPrivateZone") & 1) == 0)
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v4, "appLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "state") & 0x300002) != 0x200000)
    {
LABEL_9:

      goto LABEL_10;
    }
    -[BRCSyncUpOperationBuilder op](self, "op");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createdAppLibraryNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appLibraryOrZoneName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "containsObject:", v11) & 1) != 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v4, "clientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "zoneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D10DB0])
      || (objc_msgSend(v6, "isCloudDocsMangledID") & 1) != 0)
    {

      goto LABEL_8;
    }
    objc_msgSend(v4, "appLibrary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isiCloudDesktopAppLibrary");

    if ((v40 & 1) == 0)
    {
      v14 = objc_alloc(MEMORY[0x1E0C95098]);
      objc_msgSend(v4, "clientZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "zoneName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithZoneName:ownerName:", v16, *MEMORY[0x1E0C94730]);

      objc_msgSend(v4, "appLibrary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "childBasehashSalt");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C95048], "rootAppLibraryRecordForAppLibraryID:zoneID:", v6, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v19)
      {
        objc_msgSend(v20, "brc_fillWithChildBasehashSalt:", v19);
        objc_msgSend(v4, "appLibrary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "saltingState");

        if (v23 <= 1)
          v24 = 3;
        else
          v24 = v23;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("saltingState"));

      }
      objc_msgSend(v4, "appLibrary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "includesDataScope"))
      {

      }
      else
      {
        objc_msgSend(v4, "appLibrary");
        v41 = v19;
        v27 = v17;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "mangledID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "optimisticallyPCSChainWithSession:", self->_session);

        v17 = v27;
        v19 = v41;

        if (v31)
          objc_msgSend(v21, "setWantsChainPCS:", 1);
      }
      if (v21)
      {
        brc_bread_crumbs();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[BRCSyncUpOperationBuilder prepareAppLibraryRootSyncUpForItem:].cold.1();

        -[BRCSyncUpOperationBuilder op](self, "op");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "recordsToSave");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addObject:", v21);

        -[BRCSyncUpOperationBuilder op](self, "op");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "createdAppLibraryNames");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appLibraryOrZoneName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v38);

      }
    }
  }
LABEL_11:

}

- (float)fakeSyncForItem:(id)a3 serverItem:(id)a4 inZone:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  int v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
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
  id v68;
  uint64_t v69[3];
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  id v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v68 = a4;
  v8 = a5;
  objc_msgSend(v7, "st");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ckInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "etag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || !objc_msgSend(v7, "isSharedToMeChildItem"))
  {

  }
  else
  {
    v12 = objc_msgSend(v8, "isSharedZone");

    if (v12)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:].cold.2();

      objc_msgSend(v7, "prepareForSyncUpSideCarZone");
      objc_msgSend(v7, "markLatestSyncRequestAcknowledgedInZone:", &unk_1E87D72E0);
    }
  }
  v15 = objc_msgSend(v7, "localDiffs");
  -[BRCSyncUpOperationBuilder session](self, "session");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "syncUpScheduler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dbRowID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "inFlightDiffsForItem:zoneRowID:", v7, v18);

  if (objc_msgSend(v7, "isSharedToMeChildItem"))
  {
    objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "brc_shareItemID");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientZone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "serverItemByItemID:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isLive");

    v25 = v24 ^ 1;
    if ((v24 & 1) == 0)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v71 = (uint64_t)v7;
        v72 = 2112;
        v73 = v26;
        _os_log_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as rejected because the root share is dead%@", buf, 0x16u);
      }

    }
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend(v7, "isSharedToMeTopLevelItem"))
  {
    objc_msgSend(v7, "clientZone");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "serverItemByItemID:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isLive");

    if ((v31 & 1) == 0)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v71 = (uint64_t)v7;
        v72 = 2112;
        v73 = v20;
        _os_log_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as rejected because the server item is dead%@", buf, 0x16u);
      }
      v25 = 1;
      goto LABEL_19;
    }
  }
  v25 = 0;
LABEL_20:
  v32 = v19 | v15;
  if (objc_msgSend(v7, "isDocumentBeingCopiedToNewZone"))
  {
    objc_msgSend(v7, "asDocument");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isFault");

    if (v34)
    {
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v71 = (uint64_t)v7;
        v72 = 2112;
        v73 = v35;
        _os_log_impl(&dword_1CBD43000, v36, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as rejected because it's being copied to a new zone%@", buf, 0x16u);
      }

LABEL_30:
      objc_msgSend(v7, "markForceRejected");
      goto LABEL_31;
    }
  }
  if (objc_msgSend(v7, "isDocumentBeingCopiedToNewZone"))
  {
    brc_bread_crumbs();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:].cold.1();

  }
  if (v25)
    goto LABEL_30;
  if ((objc_msgSend(v7, "isKnownByServer") & 1) != 0 || !objc_msgSend(v7, "isSharedToMeChildItem"))
  {
    objc_msgSend(v7, "prepareForSyncUpInZone:", v8);
    objc_msgSend(v8, "dbRowID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markLatestSyncRequestAcknowledgedInZone:", v57);

    if ((objc_msgSend(v68, "sharingOptions") & 0x20) != 0 && objc_msgSend(v7, "isDocument"))
    {
      objc_msgSend(v7, "asDocument");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "currentVersion");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "ckInfo");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
      {

        if ((v32 & 0x180000) != 0)
        {
          objc_msgSend(v7, "asDocument");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "currentVersion");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v7, "asDocument");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "fileIDForUpload");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "brc_errorItemIneligibleFromSyncForInode:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setUploadError:", v66);

        }
      }
      else
      {

      }
    }
LABEL_31:
    v39 = 0;
    if ((v32 & 0x1000000000000000) != 0)
      goto LABEL_43;
    goto LABEL_32;
  }
  if (objc_msgSend(v7, "isDocument"))
  {
    objc_msgSend(v7, "asDocument");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "currentVersion");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorItemIneligibleFromSyncForInode:", 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setUploadError:", v56);

  }
  v39 = 1;
  if ((v32 & 0x1000000000000000) == 0)
  {
LABEL_32:
    if (v68)
      goto LABEL_34;
    objc_msgSend(v8, "clientZone");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "serverItemByItemID:", v41);
    v68 = (id)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
LABEL_34:
      memset(v69, 0, sizeof(v69));
      __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:]", 555, v69);
      brc_bread_crumbs();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v71 = v69[0];
        v72 = 2112;
        v73 = v68;
        v74 = 2112;
        v75 = v42;
        _os_log_debug_impl(&dword_1CBD43000, v43, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx re-scheduling apply jobs for %@ because it finished sync-up%@", buf, 0x20u);
      }

      v44 = objc_msgSend(v7, "isDead");
      if (v44)
        v45 = 0;
      else
        v45 = v7;
      v46 = v45;
      -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v44)
        v49 = 1;
      else
        v49 = 2;
      objc_msgSend(v47, "createApplyJobFromServerItem:localItem:state:kind:", v68, v46, 1, v49);

      __brc_leave_section(v69);
    }
    else
    {
      v68 = 0;
    }
  }
LABEL_43:
  objc_msgSend(v7, "saveToDB");
  if (v39)
  {
    objc_msgSend(v8, "session");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "syncUpScheduler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dbRowID");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setState:forItem:zone:", 52, v7, v52);

  }
  return -1.0;
}

- (void)handleDeletionOfSharedItem:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0C95070];
  v5 = a3;
  v8 = (id)objc_msgSend([v4 alloc], "initShareIDWithShareableItem:", v5);

  -[BRCSyncUpOperationBuilder op](self, "op");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deletedRecordIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

- (void)handleEditOfSharedItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;

  v4 = a3;
  if (objc_msgSend(v4, "itemScope") == 3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initShareIDWithShareableItem:", v4);
    objc_msgSend(v4, "st");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "iWorkShareable");

    -[BRCSyncUpOperationBuilder op](self, "op");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      objc_msgSend(v8, "iworkUnsharedShareIDs");
    else
      objc_msgSend(v8, "deletedRecordIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v5);

    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperationBuilder handleEditOfSharedItem:].cold.1();
LABEL_10:

    goto LABEL_11;
  }
  if ((objc_msgSend(v4, "localDiffs") & 0x40) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initShareIDWithShareableItem:", v4);
    objc_msgSend(v4, "st");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logicalName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder op](self, "op");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "renamedShareIDsToNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v5);

    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperationBuilder handleEditOfSharedItem:].cold.2();
    goto LABEL_10;
  }
LABEL_11:

}

- (float)addEditOfDirectory:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 v6;
  int v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  float v28;
  int v29;
  void *v30;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  NSObject *v38;
  int v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isDeadOrMissingInServerTruth");
  v6 = (v5 & 1) != 0 || (objc_msgSend(v4, "localDiffs") & 0x3FFE) != 0;
  v7 = objc_msgSend(v4, "isKnownByServer");
  objc_msgSend(v4, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isDocumentsFolder") & 1) == 0)
  {

LABEL_10:
    if (objc_msgSend(v4, "hasShareIDAndIsOwnedByMe"))
    {
      objc_msgSend(v4, "asShareableItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder handleEditOfSharedItem:](self, "handleEditOfSharedItem:", v11);

    }
    if (v6)
    {
      v12 = -[BRCSyncUpOperationBuilder shouldPCSChainStatusForItem:](self, "shouldPCSChainStatusForItem:", v4);
      -[BRCSyncUpOperationBuilder op](self, "op");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stageID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder _generateSaltGetterBlock](self, "_generateSaltGetterBlock");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder _generateChildBasehashSaltGetterBlock](self, "_generateChildBasehashSaltGetterBlock");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "structureRecordBeingDeadInServerTruth:stageID:shouldPCSChainStatus:saltGetter:childBasehashSaltGetter:", v5, v14, v12, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        if (objc_msgSend(v4, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", 0)
          && objc_msgSend(v4, "isNewToServer:", 0))
        {
          objc_msgSend(v17, "encryptedValues");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("childBasehashSalt"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            brc_bread_crumbs();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
              -[BRCSyncUpOperationBuilder addEditOfDirectory:].cold.1();

          }
          objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_1E87D72F8, CFSTR("saltingState"));
        }
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v32 = "half chained ";
          if ((_DWORD)v12 != 2)
            v32 = "";
          if ((v12 & 0x2C) != 0)
            v33 = "pcs chained ";
          else
            v33 = v32;
          objc_msgSend(v17, "description");
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = (void *)v34;
          v36 = "\n(dead in server truth)";
          v39 = 136315906;
          v40 = v33;
          if (!(_DWORD)v5)
            v36 = "";
          v41 = 2112;
          v42 = v34;
          v43 = 2080;
          v44 = v36;
          v45 = 2112;
          v46 = v20;
          _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sdirectory record %@%s%@", (uint8_t *)&v39, 0x2Au);

        }
        -[BRCSyncUpOperationBuilder op](self, "op");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "recordsToSave");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v17);

        if (objc_msgSend(v4, "isFromInitialScan"))
        {
          -[BRCSyncUpOperationBuilder defaults](self, "defaults");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "syncUpInitialItemCost");
        }
        else
        {
          v29 = objc_msgSend(v4, "isKnownByServer");
          -[BRCSyncUpOperationBuilder defaults](self, "defaults");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v30;
          if (v29)
            objc_msgSend(v30, "syncUpStructureEditCost");
          else
            objc_msgSend(v30, "syncUpStructureCreateCost");
        }
        v10 = v25;

      }
      else
      {
        v10 = -1.0;
      }

    }
    else
    {
      -[BRCSyncUpOperationBuilder op](self, "op");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "serverZone");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v27);
      v10 = v28;

    }
    goto LABEL_28;
  }
  objc_msgSend(v4, "appLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "state") & 0x40000) == 0)
    v7 = 1;

  v10 = -1.0;
  if (v7 == 1)
    goto LABEL_10;
LABEL_28:

  return v10;
}

- (float)addDeletionOfDirectory:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  void *v9;
  NSObject *v10;

  v4 = a3;
  if (objc_msgSend(v4, "hasShareIDAndIsOwnedByMe"))
  {
    objc_msgSend(v4, "asShareableItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder handleDeletionOfSharedItem:](self, "handleDeletionOfSharedItem:", v5);

  }
  if (objc_msgSend(v4, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpOperationBuilder addDeletionOfItem:].cold.1();

  }
  -[BRCSyncUpOperationBuilder addDeletionOfItem:](self, "addDeletionOfItem:", v4);
  v7 = v6;

  return v7;
}

- (float)addDeletionOfAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  void *v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "targetClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSharedZone"))
  {
    objc_msgSend(v4, "targetItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemByItemID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asSharedToMeTopLevelItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "parentClientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToClientZone:", v10);

    if (v11)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412546;
        v22 = v4;
        v23 = 2112;
        v24 = v12;
        _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Faking sync for alias item alive in the same zone as the target %@%@", (uint8_t *)&v21, 0x16u);
      }

      objc_msgSend(v4, "serverZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v14);
      v16 = v15;

      goto LABEL_9;
    }

  }
  if (objc_msgSend(v4, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpOperationBuilder addDeletionOfItem:].cold.1();

  }
  -[BRCSyncUpOperationBuilder addDeletionOfItem:](self, "addDeletionOfItem:", v4);
  v16 = v17;
LABEL_9:

  return v16;
}

- (float)addDeletionOfDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  int v24;
  BRCSyncUpOperationBuilder *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasShareIDAndIsOwnedByMe"))
  {
    objc_msgSend(v4, "asShareableItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder handleDeletionOfSharedItem:](self, "handleDeletionOfSharedItem:", v6);

  }
  objc_msgSend(v4, "currentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ckInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "hasEtag") & 1) != 0 || objc_msgSend(v8, "hasEtagBeforeCrossZoneMove"))
  {
    objc_msgSend(v4, "documentRecordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder addDeletionOfRecordID:ckInfo:](self, "addDeletionOfRecordID:ckInfo:", v9, v8);
    -[BRCSyncUpOperationBuilder addDeletionOfItem:](self, "addDeletionOfItem:", v4);
    v10 = objc_msgSend(v4, "isInDocumentScope");
    -[BRCSyncUpOperationBuilder defaults](self, "defaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      objc_msgSend(v11, "syncUpDocumentDeleteCost");
    else
      objc_msgSend(v11, "syncUpDataDeleteCost");
    v14 = v13;

  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412546;
      v25 = self;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Not syncing deletion of ETag-less version: %@%@", (uint8_t *)&v24, 0x16u);
    }

    objc_msgSend(v4, "clientZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serverItemByItemID:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isLive"))
    {
      objc_msgSend(v4, "session");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "applyScheduler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createApplyJobFromServerItem:localItem:state:kind:", v9, 0, 1, 1);

    }
    objc_msgSend(v5, "serverZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, v9, v21);
    v14 = v22;

  }
  return v14;
}

- (BOOL)_recoverItemIDChangedWhileUploadingIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uploadedAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "brc_itemIDWithSession:", self->_session);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && (objc_msgSend(v4, "itemID"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "isEqualToItemID:", v9),
          v9,
          (v10 & 1) == 0))
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "itemID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412802;
        v18 = v8;
        v19 = 2112;
        v20 = v16;
        v21 = 2112;
        v22 = v12;
        _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ItemID changed while uploading (%@ -> %@), starting over%@", (uint8_t *)&v17, 0x20u);

      }
      objc_msgSend(v4, "currentVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clearUploadedAssets");

      objc_msgSend(v4, "markNeedsUploadOrSyncingUp");
      objc_msgSend(v4, "saveToDB");
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_validateSharedDocumentFieldsForRecord:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[BRCSyncUpOperationBuilder _recoverItemIDChangedWhileUploadingIfNecessary:](self, "_recoverItemIDChangedWhileUploadingIfNecessary:", v7))
  {
    goto LABEL_5;
  }
  objc_msgSend(v7, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "validateEnhancedDrivePrivacyFieldsWithSession:error:", v8, 0);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v7, "currentVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clearUploadedAssets");

    objc_msgSend(v7, "markNeedsUploadOrSyncingUp");
    objc_msgSend(v7, "saveToDB");
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v10 = 1;
LABEL_6:

  return v10;
}

- (float)addEditOfDocument:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  float v51;
  void *v52;
  char isKindOfClass;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  float v68;
  void *v69;
  char v70;
  void *v71;
  float v72;
  int v73;
  void *v74;
  void *v75;
  float v76;
  void *v77;
  char v78;
  void *v79;
  int v80;
  uint64_t v81;
  void *v82;
  __CFString *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  double Current;
  double v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  uint64_t v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  NSObject *v107;
  void *v108;
  float v109;
  double v110;
  int v111;
  void *v112;
  void *v113;
  float v114;
  void *v115;
  NSObject *v116;
  void *v117;
  NSObject *v118;
  char *v119;
  NSObject *v120;
  double v121;
  _BOOL4 v122;
  double v123;
  const char *v124;
  const char *v125;
  char *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  int v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  NSObject *v141;
  void *v142;
  NSObject *v143;
  void *v144;
  void *v145;
  void *v146;
  NSObject *v147;
  void *v148;
  char *v149;
  NSObject *v150;
  const char *v152;
  char *v153;
  const char *v154;
  void *v155;
  void *v156;
  void *v157;
  int v158;
  id v159;
  void *v160;
  void *v161;
  unsigned int v162;
  unint64_t v163;
  void *v164;
  id v165;
  id v166;
  uint8_t buf[4];
  const char *v168;
  __int16 v169;
  const char *v170;
  __int16 v171;
  void *v172;
  uint64_t v173;

  v173 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v5 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPausedFromSync"))
    v6 = 0x40000;
  else
    v6 = 33423360;
  v7 = objc_msgSend(v4, "isDeadOrMissingInServerTruth");
  v8 = objc_msgSend(v4, "localDiffs");
  objc_msgSend(v4, "st");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ckInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10 || (v7 & 1) != 0)
  {
    objc_msgSend(v4, "st");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "iWorkShareable");

    if ((v13 & v7) == 1)
    {
      v14 = objc_msgSend(v4, "sharingOptions");
      v15 = (v14 & 4) == 0;
      v163 = (unint64_t)(v14 & 4) >> 2;
      goto LABEL_11;
    }
    LOBYTE(v163) = v13;
  }
  else
  {

    LOBYTE(v163) = 0;
  }
  v15 = 0;
LABEL_11:
  v16 = v8 & 0x3FFE;
  v17 = v8 & v6;
  if (!objc_msgSend(v4, "sharingOptions"))
    goto LABEL_20;
  objc_msgSend(v4, "currentVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ckInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

    goto LABEL_20;
  }
  objc_msgSend(v4, "clientZone");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isPrivateZone"))
  {

  }
  else
  {
    v21 = objc_msgSend(v4, "isSharedToMeTopLevelItem");

    if (!v21)
      goto LABEL_20;
  }
  brc_bread_crumbs();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.9();

  LOBYTE(v163) = 1;
LABEL_20:
  v164 = (void *)v5;
  v24 = objc_msgSend(v4, "localDiffs");
  v25 = v17 == 0;
  v26 = (v24 >> 59) & 1;
  if (v25)
    v27 = v26 | v7;
  else
    v27 = 1;
  if (v16)
    v28 = 1;
  else
    v28 = v26 | v7;
  objc_msgSend(v4, "serverZone");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isSharedZone");

  if (v30)
  {
    v28 = objc_msgSend(v4, "isSharedToMeChildItem");
    objc_msgSend(v4, "clientZone");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "serverItemByItemID:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v7 && (objc_msgSend(v4, "isSharedToMeTopLevelItem") & 1) != 0
      || (v33 ? (v34 = v33) : (v34 = v4), (objc_msgSend(v34, "sharingOptions") & 0x20) != 0))
    {
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.8();

      v27 = 0;
    }

  }
  v37 = v26 | v15;
  v38 = -[BRCSyncUpOperationBuilder shouldPCSChainStatusForItem:](self, "shouldPCSChainStatusForItem:", v4);
  if ((v38 & 6) != 0)
    v39 = v28;
  else
    v39 = 1;
  if ((v38 & 4) != 0)
    v40 = v27;
  else
    v40 = 1;
  if (v40)
    v41 = v38;
  else
    v41 = 2;
  if (v39)
    v42 = v41;
  else
    v42 = 1;
  v162 = v42;
  if ((v42 & 0xC) != 0)
  {
    brc_bread_crumbs();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.7();

    v28 = 1;
  }
  else if (!v27)
  {
    v158 = v37;
    v159 = 0;
    v47 = 0;
    v55 = 0;
    v45 = v164;
    goto LABEL_65;
  }
  v45 = v164;
  objc_msgSend(v4, "currentVersion");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "uploadedAssets");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v47, "brc_isfakeRecordWithErrorMarkerFor20716676"))
  {
    brc_bread_crumbs();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, (os_log_type_t)0x90u))
      -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.1();

    objc_msgSend(v4, "markForceUpload");
    objc_msgSend(v4, "saveToDB");
    v50 = 0;
LABEL_58:
    v51 = -1.0;
    goto LABEL_190;
  }
  if (v47)
  {
    v51 = -1.0;
    if (!-[BRCSyncUpOperationBuilder _validateSharedDocumentFieldsForRecord:item:](self, "_validateSharedDocumentFieldsForRecord:item:", v47, v4))
    {
      v50 = 0;
      goto LABEL_190;
    }
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("thumb1024"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v158 = v37;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("thumb1024"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v54, "isRereferencedAssetUpload") & 1) != 0)
      {
        v50 = 0;
      }
      else
      {
        objc_msgSend(v54, "fileURL");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v166 = 0;
        v78 = objc_msgSend(v77, "checkResourceIsReachableAndReturnError:", &v166);
        v159 = v166;

        if ((v78 & 1) == 0)
        {
          brc_bread_crumbs();
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v116 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v116, (os_log_type_t)0x90u))
            -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.6();

          objc_msgSend(v4, "markForceUpload");
          objc_msgSend(v4, "saveToDB");
LABEL_130:

          goto LABEL_174;
        }
        v50 = v159;
      }

    }
    else
    {
      v50 = 0;
    }
    objc_msgSend(v4, "currentVersion");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "isPackage");

    if (v80)
    {
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("pkgContent"));
      v81 = objc_claimAutoreleasedReturnValue();
      if (v81)
      {
        v82 = (void *)v81;
        v160 = v50;
        v83 = CFSTR("pkgManifest");
        objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("pkgManifest"));
        v84 = objc_claimAutoreleasedReturnValue();
        if (v84)
        {
          v85 = (void *)v84;
          objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("pkgSignature"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = v160;
          if (v86)
          {
            objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("pkgContent"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("pkgManifest"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("thumb1024"));
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v155 = v87;
            objc_msgSend(v87, "earliestUploadReceiptExpiration");
            v91 = v90;
            Current = CFAbsoluteTimeGetCurrent();
            v93 = Current;
            v156 = v89;
            if (v91 == 0.0)
              goto LABEL_146;
            if (v91 >= Current)
            {
              objc_msgSend(v88, "deviceID");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = objc_msgSend(v87, "longLongValue");
              -[BRCAccountSession volume](self->_session, "volume");
              v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v94 == (int)-[__CFString deviceID](v83, "deviceID"))
              {
                v89 = v156;
LABEL_146:
                if (objc_msgSend(v88, "size") && (objc_msgSend(v88, "uploadReceiptExpiration"), v121 < v93))
                {
                  v122 = 1;
                }
                else if (objc_msgSend(v89, "size"))
                {
                  objc_msgSend(v89, "uploadReceiptExpiration");
                  v122 = v123 < v93;
                }
                else
                {
                  v122 = 0;
                }
                if (v91 == 0.0)
                {
                  if (v122)
                    goto LABEL_186;
                }
                else
                {

                  if (v122)
                    goto LABEL_186;
                }

                goto LABEL_162;
              }

            }
LABEL_186:
            brc_bread_crumbs();
            v149 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v150 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v168 = (const char *)v4;
              v169 = 2112;
              v170 = v149;
              _os_log_impl(&dword_1CBD43000, v150, OS_LOG_TYPE_DEFAULT, "[WARNING] Forcing re-upload of an item which has an expired put receipt - %@%@", buf, 0x16u);
            }

            objc_msgSend(v4, "markForceUpload");
            objc_msgSend(v4, "saveToDB");

            goto LABEL_189;
          }
        }
        else
        {

        }
      }
      brc_bread_crumbs();
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v118 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_FAULT))
        -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.4();
LABEL_134:

      objc_msgSend(v4, "markForceUpload");
      objc_msgSend(v4, "saveToDB");
LABEL_189:
      v45 = v164;
      goto LABEL_190;
    }
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("fileContent"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
    {

    }
    else
    {
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("bookmarkContent"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v96)
      {
        brc_bread_crumbs();
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v118 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_FAULT))
          -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.5();
        goto LABEL_134;
      }
    }
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("fileContent"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("thumb1024"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = CFAbsoluteTimeGetCurrent();
    if (objc_msgSend(v97, "size"))
    {
      objc_msgSend(v97, "uploadReceiptExpiration");
      if (v100 >= v99)
      {
        v161 = v50;
        objc_msgSend(v97, "deviceID");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = objc_msgSend(v101, "longLongValue");
        -[BRCAccountSession volume](self->_session, "volume");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if (v102 == (int)objc_msgSend(v103, "deviceID"))
        {
          if (!objc_msgSend(v98, "size"))
          {

            v50 = v161;
LABEL_161:

LABEL_162:
            v45 = v164;
            goto LABEL_163;
          }
          objc_msgSend(v98, "uploadReceiptExpiration");
          v105 = v104;

          v50 = v161;
          if (v105 >= v99)
            goto LABEL_161;
        }
        else
        {

          v50 = v161;
        }
      }
    }
    else
    {
      if (!objc_msgSend(v98, "size"))
        goto LABEL_161;
      objc_msgSend(v98, "uploadReceiptExpiration");
      if (v110 >= v99)
        goto LABEL_161;
    }
    brc_bread_crumbs();
    v119 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v120 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v168 = (const char *)v4;
      v169 = 2112;
      v170 = v119;
      _os_log_impl(&dword_1CBD43000, v120, OS_LOG_TYPE_DEFAULT, "[WARNING] Forcing re-upload of an item which has an expired put receipt - %@%@", buf, 0x16u);
    }

    objc_msgSend(v4, "markForceUpload");
    objc_msgSend(v4, "saveToDB");

    goto LABEL_189;
  }
  if (objc_msgSend(v4, "contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:", v7))
  {
    if (!objc_msgSend(v4, "isFault") || (objc_msgSend(v4, "isDocumentBeingCopiedToNewZone") & 1) != 0)
    {
      brc_bread_crumbs();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.2();

      objc_msgSend(v4, "markForceUpload");
      objc_msgSend(v4, "saveToDB");
      v50 = 0;
      v47 = 0;
      goto LABEL_58;
    }
    brc_bread_crumbs();
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.3();

    objc_msgSend(v164, "serverZone");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v108);
    v51 = v109;

    v50 = 0;
    v47 = 0;
    goto LABEL_190;
  }
  v158 = v37;
  objc_msgSend(v4, "baseRecord");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
LABEL_163:
  v128 = objc_msgSend(v4, "localDiffs");
  -[BRCSyncUpOperationBuilder _getSaltForItem:](self, "_getSaltForItem:", v4);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = v50;
  LOBYTE(v128) = objc_msgSend(v47, "serializeVersion:diffs:deadInServerTruth:basehashSalt:error:", v4, v128, v7, v129, &v165);
  v159 = v165;

  if ((v128 & 1) == 0)
  {
    brc_bread_crumbs();
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v147 = objc_claimAutoreleasedReturnValue();
    v50 = v159;
    if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v168 = (const char *)v159;
      v169 = 2112;
      v170 = (const char *)v4;
      v171 = 2112;
      v172 = v146;
      _os_log_debug_impl(&dword_1CBD43000, v147, OS_LOG_TYPE_DEBUG, "[DEBUG] Error creating record %@ for item %@%@", buf, 0x20u);
    }

    goto LABEL_58;
  }
  objc_msgSend(v4, "session");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v47, "validateEnhancedDrivePrivacyFieldsWithSession:error:", v130, 0);

  v51 = -1.0;
  if (!v131)
  {
LABEL_174:
    v50 = v159;
    goto LABEL_190;
  }
  objc_msgSend(v4, "resolvedConflictLoserEtags");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v132;
  if (objc_msgSend(v132, "count"))
  {
    objc_msgSend(v132, "allObjects");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "conflictLosersToResolveByRecordID");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "recordID");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "setObject:forKeyedSubscript:", v133, v135);

    v132 = v157;
  }
  v55 = v47 != 0;
  if (!v47)
    goto LABEL_181;
  if ((v162 & 0x2C) != 0)
  {
    objc_msgSend(v4, "itemID");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverZone");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "zoneID");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "pcsChainDocumentStructureReferenceInZoneID:", v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setParent:", v139);

    v132 = v157;
  }
  brc_bread_crumbs();
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v141 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
  {
    if ((v162 & 0x2C) != 0)
      v152 = "pcs chained ";
    else
      v152 = "";
    objc_msgSend(v47, "description");
    v153 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v168 = v152;
    v169 = 2112;
    v170 = v153;
    v171 = 2112;
    v172 = v140;
    _os_log_debug_impl(&dword_1CBD43000, v141, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sversion record %@%@", buf, 0x20u);

    v132 = v157;
  }

  brc_bread_crumbs();
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v143 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
  {
    v154 = "";
    *(_DWORD *)buf = 138412802;
    v168 = (const char *)v4;
    if ((_DWORD)v7)
      v154 = "\n(dead in server truth)";
    v169 = 2080;
    v170 = v154;
    v171 = 2112;
    v172 = v142;
    _os_log_debug_impl(&dword_1CBD43000, v143, OS_LOG_TYPE_DEBUG, "[DEBUG] for %@%s%@", buf, 0x20u);
  }

  v45 = v164;
  objc_msgSend(v164, "recordsToSave");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "addObject:", v47);

  if ((v163 & 1) != 0)
  {
    objc_msgSend(v164, "recordsNeedingUpdatedSharingProtectionInfo");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_180:
    v148 = v145;
    objc_msgSend(v145, "addObject:", v47);

    goto LABEL_181;
  }
  if (v158)
  {
    objc_msgSend(v164, "recordsNeedingNewSharingProtectionInfo");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_180;
  }
LABEL_181:

LABEL_65:
  if (objc_msgSend(v4, "hasShareIDAndIsOwnedByMe"))
  {
    objc_msgSend(v4, "asShareableItem");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder handleEditOfSharedItem:](self, "handleEditOfSharedItem:", v56);

  }
  if (!v28)
  {
    if (v55)
    {
LABEL_90:
      v70 = objc_msgSend(v4, "isInDocumentScope");
      v50 = v159;
      if (objc_msgSend(v4, "isFromInitialScan"))
      {
        -[BRCSyncUpOperationBuilder defaults](self, "defaults");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "syncUpInitialItemCost");
      }
      else
      {
        v73 = objc_msgSend(v4, "isKnownByServer");
        -[BRCSyncUpOperationBuilder defaults](self, "defaults");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v74;
        if (v73)
        {
          if ((v70 & 1) != 0)
            objc_msgSend(v74, "syncUpDocumentEditCost");
          else
            objc_msgSend(v74, "syncUpDataEditCost");
        }
        else if ((v70 & 1) != 0)
        {
          objc_msgSend(v74, "syncUpDocumentCreateCost");
        }
        else
        {
          objc_msgSend(v74, "syncUpDataCreateCost");
        }
      }
      v51 = v72;

      goto LABEL_190;
    }
    objc_msgSend(v45, "serverZone");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v54);
    v51 = v68;
    goto LABEL_130;
  }
  objc_msgSend(v45, "stageID");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSyncUpOperationBuilder _generateSaltGetterBlock](self, "_generateSaltGetterBlock");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "structureRecordBeingDeadInServerTruth:stageID:shouldPCSChainStatus:saltGetter:childBasehashSaltGetter:", v7, v57, v162, v58, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v59)
  {
    v47 = 0;
    v51 = -1.0;
    goto LABEL_174;
  }
  brc_bread_crumbs();
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    v124 = "";
    if (v162 == 2)
      v124 = "half chained ";
    if ((v162 & 0x2C) != 0)
      v125 = "pcs chained ";
    else
      v125 = v124;
    objc_msgSend(v59, "description");
    v126 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v168 = v125;
    v169 = 2112;
    v170 = v126;
    v171 = 2112;
    v172 = v60;
    _os_log_debug_impl(&dword_1CBD43000, v61, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sdocument structure record %@%@", buf, 0x20u);

  }
  brc_bread_crumbs();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    v127 = "";
    *(_DWORD *)buf = 138412802;
    v168 = (const char *)v4;
    if ((_DWORD)v7)
      v127 = "\n(dead in server truth)";
    v169 = 2080;
    v170 = v127;
    v171 = 2112;
    v172 = v62;
    _os_log_debug_impl(&dword_1CBD43000, v63, OS_LOG_TYPE_DEBUG, "[DEBUG] for %@%s%@", buf, 0x20u);
  }

  objc_msgSend(v45, "recordsToSave");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addObject:", v59);

  if ((v163 & 1) != 0)
  {
    objc_msgSend(v45, "recordsNeedingUpdatedSharingProtectionInfo");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_87:
    v69 = v65;
    objc_msgSend(v65, "addObject:", v59);

    goto LABEL_88;
  }
  if (v158)
  {
    objc_msgSend(v45, "recordsNeedingNewSharingProtectionInfo");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_87;
  }
LABEL_88:
  if (v55)
  {
    v47 = v59;
    goto LABEL_90;
  }
  if (objc_msgSend(v4, "isFromInitialScan"))
  {
    -[BRCSyncUpOperationBuilder defaults](self, "defaults");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "syncUpInitialItemCost");
    v51 = v76;

    v47 = v59;
    goto LABEL_174;
  }
  v111 = objc_msgSend(v4, "isKnownByServer");
  -[BRCSyncUpOperationBuilder defaults](self, "defaults");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v112;
  v50 = v159;
  if (v111)
    objc_msgSend(v112, "syncUpStructureEditCost");
  else
    objc_msgSend(v112, "syncUpStructureCreateCost");
  v51 = v114;

  v47 = v59;
LABEL_190:

  return v51;
}

- (float)addEditOfFinderBookmark:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  char v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  float v15;
  void *v16;
  char v17;
  char *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  float v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  float v34;
  void *v35;
  NSObject *v36;
  int v37;
  void *v38;
  const char *v40;
  char *v41;
  const char *v42;
  char v43;
  char *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isDeadOrMissingInServerTruth");
  if ((v5 & 1) != 0)
  {
    v6 = 1;
    v7 = 1;
  }
  else
  {
    v6 = (objc_msgSend(v4, "localDiffs") & 0x3FFE) != 0;
    v7 = (objc_msgSend(v4, "localDiffs") & 0x1FE0000) != 0;
  }
  v8 = -[BRCSyncUpOperationBuilder shouldPCSChainStatusForItem:](self, "shouldPCSChainStatusForItem:", v4);
  v9 = v8 & 0x2C;
  v10 = (v8 & 0x2C) != 0 || v6;
  objc_msgSend(v4, "currentVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uploadedAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
LABEL_13:
    if (((v7 | v10) & 1) == 0)
    {
      -[BRCSyncUpOperationBuilder op](self, "op");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "serverZone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v22);
      v15 = v23;

LABEL_38:
      goto LABEL_39;
    }
    -[BRCSyncUpOperationBuilder _getSaltForItem:](self, "_getSaltForItem:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v46 = 0;
      v17 = objc_msgSend(v12, "serializeVersion:diffs:deadInServerTruth:basehashSalt:error:", v4, objc_msgSend(v4, "localDiffs"), v5, v16, &v46);
      v18 = (char *)v46;
      if ((v17 & 1) == 0)
      {
        brc_bread_crumbs();
        v19 = (id)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v48 = v18;
          v49 = 2112;
          v50 = (const char *)v4;
          v51 = 2112;
          v52 = v19;
          _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Error creating record %@ for item %@%@", buf, 0x20u);
        }

        v15 = -1.0;
        goto LABEL_36;
      }
    }
    else
    {
      v18 = 0;
    }
    if (v10)
    {
      v43 = v8 & 0x2C;
      v44 = v18;
      v24 = objc_msgSend(v4, "localDiffs");
      -[BRCSyncUpOperationBuilder op](self, "op");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stageID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder _generateSaltGetterBlock](self, "_generateSaltGetterBlock");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      LOBYTE(v24) = objc_msgSend(v12, "serializeStatInfo:diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:", v4, v24, v26, v5, v8, v27, 0, &v45);
      v19 = v45;

      if ((v24 & 1) == 0)
      {
        brc_bread_crumbs();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v48 = (const char *)v19;
          v49 = 2112;
          v50 = (const char *)v4;
          v51 = 2112;
          v52 = v35;
          _os_log_debug_impl(&dword_1CBD43000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] Error creating record %@ for item %@%@", buf, 0x20u);
        }

        v15 = -1.0;
        v18 = v44;
        goto LABEL_36;
      }

      v18 = v44;
      v9 = v43;
    }
    v15 = -1.0;
    if (!-[BRCSyncUpOperationBuilder _validateSharedDocumentFieldsForRecord:item:](self, "_validateSharedDocumentFieldsForRecord:item:", v12, v4))
    {
LABEL_37:

      goto LABEL_38;
    }
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      if (v9)
        v40 = "pcs chained ";
      else
        v40 = "";
      objc_msgSend(v12, "description");
      v41 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v48 = v40;
      v49 = 2112;
      v50 = v41;
      v51 = 2112;
      v52 = v28;
      _os_log_debug_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sfinder alias record %@%@", buf, 0x20u);

    }
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v42 = "";
      *(_DWORD *)buf = 138412802;
      v48 = (const char *)v4;
      if ((_DWORD)v5)
        v42 = "\n(dead in server truth)";
      v49 = 2080;
      v50 = v42;
      v51 = 2112;
      v52 = v30;
      _os_log_debug_impl(&dword_1CBD43000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] for %@%s%@", buf, 0x20u);
    }

    -[BRCSyncUpOperationBuilder op](self, "op");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "recordsToSave");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v12);

    if (objc_msgSend(v4, "isFromInitialScan"))
    {
      -[BRCSyncUpOperationBuilder defaults](self, "defaults");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "syncUpInitialItemCost");
    }
    else
    {
      v37 = objc_msgSend(v4, "isKnownByServer");
      -[BRCSyncUpOperationBuilder defaults](self, "defaults");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v38;
      if (v37)
        objc_msgSend(v38, "syncUpStructureEditCost");
      else
        objc_msgSend(v38, "syncUpStructureCreateCost");
    }
    v15 = v34;
LABEL_36:

    goto LABEL_37;
  }
  if (!objc_msgSend(v4, "contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:", v5))
  {
    objc_msgSend(v4, "baseRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.2();

  objc_msgSend(v4, "markForceUpload");
  objc_msgSend(v4, "saveToDB");
  v15 = -1.0;
LABEL_39:

  return v15;
}

- (float)addDeletionOfFinderBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;

  v4 = a3;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deletedRecordIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentRecordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
  -[BRCSyncUpOperationBuilder defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncUpDocumentDeleteCost");
  v10 = v9;

  return v10;
}

- (float)addEditOfSymlink:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  int v18;
  void *v19;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isDeadOrMissingInServerTruth");
  v6 = -[BRCSyncUpOperationBuilder shouldPCSChainStatusForItem:](self, "shouldPCSChainStatusForItem:", v4);
  -[BRCSyncUpOperationBuilder op](self, "op");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stageID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSyncUpOperationBuilder _generateSaltGetterBlock](self, "_generateSaltGetterBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "structureRecordBeingDeadInServerTruth:stageID:shouldPCSChainStatus:saltGetter:childBasehashSaltGetter:", v5, v8, v6, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if ((v6 & 0x2C) != 0)
        v21 = "pcs chained ";
      else
        v21 = "";
      objc_msgSend(v10, "description");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      v24 = "\n(dead in server truth)";
      v25 = 136315906;
      v26 = v21;
      if (!(_DWORD)v5)
        v24 = "";
      v27 = 2112;
      v28 = v22;
      v29 = 2080;
      v30 = v24;
      v31 = 2112;
      v32 = v11;
      _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %ssymlink record %@%s%@", (uint8_t *)&v25, 0x2Au);

    }
    -[BRCSyncUpOperationBuilder op](self, "op");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordsToSave");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v10);

    if (objc_msgSend(v4, "isFromInitialScan"))
    {
      -[BRCSyncUpOperationBuilder defaults](self, "defaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "syncUpInitialItemCost");
    }
    else
    {
      v18 = objc_msgSend(v4, "isKnownByServer");
      -[BRCSyncUpOperationBuilder defaults](self, "defaults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;
      if (v18)
        objc_msgSend(v19, "syncUpStructureEditCost");
      else
        objc_msgSend(v19, "syncUpStructureCreateCost");
    }
    v17 = v16;

  }
  else
  {
    v17 = -1.0;
  }

  return v17;
}

- (float)addItem:(id)a3
{
  id v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  NSObject *v24;
  void *v25;
  float v26;
  void *v27;
  NSObject *v28;
  void *v29;
  float v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  float v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  float v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "captureLogsForOperationType:ofSubtype:withContext:", CFSTR("SyncHealth"), CFSTR("SyncUp"), CFSTR("AppLibrary is nil"));

    -[BRCSyncUpOperationBuilder session](self, "session");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "analyticsReporter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "aggregateReportForAppTelemetryIdentifier:error:", 216, 0);

    v6 = -1.0;
    goto LABEL_18;
  }
  -[BRCSyncUpOperationBuilder prepareAppLibraryRootSyncUpForItem:](self, "prepareAppLibraryRootSyncUpForItem:", v4);
  v6 = -1.0;
  if (-[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:](self, "checkIfSyncAllowedInSharedZoneForItem:", v4)&& !-[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:](self, "_checkIfShouldDedicateOpToSaltingBasehashItem:", v4)&& !-[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToPCSChainingItem:](self, "_checkIfShouldDedicateOpToPCSChainingItem:", v4))
  {
    -[BRCSyncUpOperationBuilder op](self, "op");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mangledID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "preventRecordSyncWithoutDiffs");

    if (!v11)
      goto LABEL_10;
    objc_msgSend(v4, "clientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serverItemByItemID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14
      || (v15 = objc_msgSend(v4, "diffAgainstServerItem:", v14),
          (objc_msgSend(v4, "metadataSyncUpMask:", 1) & v15) != 0)
      || (objc_msgSend(v4, "forceNeedsSyncUpWithoutDiffs") & 1) != 0)
    {

LABEL_10:
      if (objc_msgSend(v4, "isDead"))
      {
        if (objc_msgSend(v4, "isDeadOrMissingInServerTruth"))
        {
          if (objc_msgSend(v4, "isSharedToMeTopLevelItem"))
          {
            objc_msgSend(v4, "asSharedToMeTopLevelItem");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "insertTombstoneAliasRecordInZone:", 0);

          }
          brc_bread_crumbs();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[BRCSyncUpOperationBuilder addItem:].cold.1();

          objc_msgSend(v4, "markNeedsDeleteWhenAlreadyDeadInServerTruth");
          objc_msgSend(v4, "saveToDB");
          goto LABEL_18;
        }
        v46 = 0;
        v47 = 0;
        v48 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperationBuilder addItem:]", 1156, &v46);
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v42 = v46;
          objc_msgSend(v4, "st");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          BRCPrettyPrintEnumWithContext((int)objc_msgSend(v43, "type"), (uint64_t)&brc_item_type_pretty_entries, 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v50 = v42;
          v51 = 2112;
          v52 = v44;
          v53 = 2112;
          v54 = v4;
          v55 = 2112;
          v56 = v27;
          _os_log_debug_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Deleting %@ record for %@%@", buf, 0x2Au);

        }
        if (objc_msgSend(v4, "isSharedToMeTopLevelItem"))
        {
          objc_msgSend(v4, "asSharedToMeTopLevelItem");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpOperationBuilder addDeletionOfSharedTopLevelItem:](self, "addDeletionOfSharedTopLevelItem:", v29);
        }
        else if (objc_msgSend(v4, "isFinderBookmark"))
        {
          objc_msgSend(v4, "asFinderBookmark");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpOperationBuilder addDeletionOfFinderBookmark:](self, "addDeletionOfFinderBookmark:", v29);
        }
        else if (objc_msgSend(v4, "isDocument"))
        {
          objc_msgSend(v4, "asDocument");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpOperationBuilder addDeletionOfDocument:](self, "addDeletionOfDocument:", v29);
        }
        else if (objc_msgSend(v4, "isDirectory"))
        {
          objc_msgSend(v4, "asDirectory");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpOperationBuilder addDeletionOfDirectory:](self, "addDeletionOfDirectory:", v29);
        }
        else
        {
          if (!objc_msgSend(v4, "isBRAlias"))
          {
            -[BRCSyncUpOperationBuilder addDeletionOfItem:](self, "addDeletionOfItem:", v4);
            v6 = v45;
            goto LABEL_49;
          }
          objc_msgSend(v4, "asBRAlias");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpOperationBuilder addDeletionOfAlias:](self, "addDeletionOfAlias:", v29);
        }
        v6 = v30;

LABEL_49:
        __brc_leave_section(&v46);
LABEL_50:
        if (v6 >= 0.0)
        {
          -[BRCSyncUpOperationBuilder op](self, "op");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "serverZone");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "prepareForSyncUpInZone:", v40);

        }
        goto LABEL_18;
      }
      v46 = 0;
      v47 = 0;
      v48 = 0;
      __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperationBuilder addItem:]", 1172, &v46);
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v36 = v46;
        objc_msgSend(v4, "itemID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "debugItemIDString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v50 = v36;
        v51 = 2112;
        v52 = v38;
        v53 = 2112;
        v54 = v23;
        _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx preparing sync-up of %@%@", buf, 0x20u);

      }
      if (objc_msgSend(v4, "isSharedToMeTopLevelItem"))
      {
        objc_msgSend(v4, "asSharedToMeTopLevelItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSyncUpOperationBuilder addEditOfSharedTopLevelItem:](self, "addEditOfSharedTopLevelItem:", v25);
      }
      else if (objc_msgSend(v4, "isFinderBookmark"))
      {
        objc_msgSend(v4, "asFinderBookmark");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSyncUpOperationBuilder addEditOfFinderBookmark:](self, "addEditOfFinderBookmark:", v25);
      }
      else if (objc_msgSend(v4, "isSymLink"))
      {
        objc_msgSend(v4, "asSymlink");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSyncUpOperationBuilder addEditOfSymlink:](self, "addEditOfSymlink:", v25);
      }
      else if (objc_msgSend(v4, "isDocument"))
      {
        objc_msgSend(v4, "asDocument");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSyncUpOperationBuilder addEditOfDocument:](self, "addEditOfDocument:", v25);
      }
      else
      {
        if (!objc_msgSend(v4, "isDirectory"))
        {
          brc_bread_crumbs();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            -[BRCSyncUpOperationBuilder addItem:].cold.2();

          v6 = 0.0;
          goto LABEL_45;
        }
        objc_msgSend(v4, "asDirectory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSyncUpOperationBuilder addEditOfDirectory:](self, "addEditOfDirectory:", v25);
      }
      v6 = v26;
LABEL_45:

      __brc_leave_section(&v46);
      goto LABEL_50;
    }
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v50 = (uint64_t)v4;
      v51 = 2112;
      v52 = v14;
      v53 = 2112;
      v54 = v31;
      _os_log_impl(&dword_1CBD43000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Faking sync for item because it doesn't have field differences with the server item %@ vs %@%@", buf, 0x20u);
    }

    -[BRCSyncUpOperationBuilder op](self, "op");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "serverZone");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, v14, v34);
    v6 = v35;

  }
LABEL_18:

  return v6;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (BRCSyncUpOperation)op
{
  return self->_op;
}

- (void)setOp:(id)a3
{
  objc_storeStrong((id *)&self->_op, a3);
}

- (BRCUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (BRCLocalItem)itemNeedingPCSChaining
{
  return self->_itemNeedingPCSChaining;
}

- (BRCDirectoryItem)itemNeedingBasehashSalting
{
  return self->_itemNeedingBasehashSalting;
}

- (NSData)rootChildBasehashSalt
{
  return self->_rootChildBasehashSalt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemNeedingBasehashSalting, 0);
  objc_storeStrong((id *)&self->_itemNeedingPCSChaining, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_op, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_rootChildBasehashSalt, 0);
  objc_storeStrong((id *)&self->_parentItemIDToChildBasehashSalt, 0);
  objc_storeStrong((id *)&self->_halfChainedParentIDWhitelist, 0);
  objc_storeStrong((id *)&self->_fullyChainedParentIDWhitelist, 0);
}

- (void)_checkIfShouldDedicateOpToSaltingBasehashItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _parentItemIDToChildBasehashSalt[item.itemID] == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_checkIfShouldDedicateOpToSaltingBasehashItem:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugItemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] Sync: Dedicating sync op to metadata salting %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_checkIfShouldDedicateOpToSaltingBasehashItem:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _parentItemIDToChildBasehashSalt[parentItemID] == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_checkIfShouldDedicateOpToPCSChainingItem:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] Sync: Dedicating sync op to pcs chaining %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)checkIfSyncAllowedInSharedZoneForItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Not allowing re-creation of shared to me top level item when the item is dead in the server truth%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)checkIfSyncAllowedInSharedZoneForItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Waiting on server full sync before we fake sync shared to me top level item which is missing in the server truth%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)checkIfSyncAllowedInSharedZoneForItem:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] shared document is read-only, do not sync%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addDeletionOfItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !item.isSharedToMeTopLevelItem%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_getSaltForItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: parentItemID != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addEditOfSharedTopLevelItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(0, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a2, v4, "[DEBUG] Fake syncing up shared folder record %@%@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)addEditOfSharedTopLevelItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: unsupported top level item kind%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addDeletionOfSharedTopLevelItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Deleting alias in private zone %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)prepareAppLibraryRootSyncUpForItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Syncing up root app library record %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)fakeSyncForItem:serverItem:inZone:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: We should never fake sync for an item being copied to a new zone that isn't a fault: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)fakeSyncForItem:serverItem:inZone:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Also faking sync in side car for child item not known to the server %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)handleEditOfSharedItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Unsharing %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)handleEditOfSharedItem:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Editing name on shareID %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)addEditOfDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: record.encryptedValues[kBRRecordKeyChildBasehashSalt]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addEditOfDocument:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] re-uploading uploaded record: %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)addEditOfDocument:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] forcing upload of %@\n(dead in server truth)%@");
  OUTLINED_FUNCTION_2();
}

- (void)addEditOfDocument:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] reverting to server item because we can't reupload a fault for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)addEditOfDocument:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: package with no uploaded content - %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)addEditOfDocument:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: File with no content signature - %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)addEditOfDocument:.cold.6()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] thumbnail not found.  Force upload again%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)addEditOfDocument:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] will pcs chain records%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addEditOfDocument:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] shared document is read-only, do not sync its version%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addEditOfDocument:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] We need to update sharing info for this reset item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Deleting dead record already dead in the server truth %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)addItem:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: asked to syncup an unkown item type: %@%@");
  OUTLINED_FUNCTION_2();
}

@end
