@implementation BRCLocalStatInfo

- (void)_clearFileID
{
  NSNumber *fileID;
  BRCGenerationID *generationID;

  fileID = self->_fileID;
  self->_fileID = 0;

  generationID = self->_generationID;
  self->_generationID = 0;

}

- (void)_clearGenerationID
{
  BRCGenerationID *generationID;

  generationID = self->_generationID;
  self->_generationID = 0;

}

- (void)_markAlmostDead
{
  NSNumber *fileID;
  BRCGenerationID *generationID;
  void *v5;
  NSObject *v6;

  if ((~self->super._state & 0xFD) != 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo(LegacyAdditions) _markAlmostDead].cold.1();

  }
  self->super._state = -3;
  fileID = self->_fileID;
  self->_fileID = 0;

  generationID = self->_generationID;
  self->_generationID = 0;

}

- (void)_markFound
{
  unsigned int type;
  BOOL v4;
  int v5;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;

  type = self->super._type;
  v4 = type > 0xA;
  v5 = (1 << type) & 0x611;
  if (v4 || v5 == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo(LegacyAdditions) _markFound].cold.2();

  }
  if (self->super._state != 255)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo(LegacyAdditions) _markFound].cold.1();

  }
  self->super._state = 0;
}

- (NSNumber)lostStamp
{
  if ((self->super._state | 2) == 0xFF)
    return self->_processingStamp;
  else
    return (NSNumber *)0;
}

- (void)_markLostAddingBackoffWithMode:(unsigned __int8)a3 appLibrary:(id)a4
{
  int v4;
  id v6;
  int state;
  void *v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  NSNumber *v13;
  NSNumber *processingStamp;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  BRCLocalStatInfo *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  state = self->super._state;
  if (self->super._state && state != 253 && state != 255)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      BRCPrettyPrintEnumWithContext(self->super._state, (uint64_t)&brc_item_state_pretty_entries, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v15;
      v20 = 2112;
      v21 = self;
      v22 = 2112;
      v23 = v8;
      _os_log_fault_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unexpected state %@ for item %@%@", (uint8_t *)&v18, 0x20u);

    }
  }
  if (v4 == 1)
    v10 = self->super._state == 0;
  else
    v10 = v4 == 2;
  v11 = v10;
  v12 = objc_msgSend(v6, "allocateLostStampAddingBackoff:", v11);
  if (!v12)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo(LegacyAdditions) _markLostAddingBackoffWithMode:appLibrary:].cold.1();

  }
  if (self->super._state != 253)
    self->super._state = -1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  processingStamp = self->_processingStamp;
  self->_processingStamp = v13;

}

+ (id)_finderTagsFromRelativePath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BRFieldFinderTags *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "hasFinderTags"))
  {
    objc_msgSend(v3, "physicalURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = 0;
    v5 = objc_msgSend(v4, "br_getTagNames:error:", &v24, &v23);
    v6 = v24;
    v7 = v23;

    if ((v5 & 1) == 0)
    {
      brc_bread_crumbs();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
        +[BRCLocalStatInfo(LegacyAdditions) _finderTagsFromRelativePath:].cold.2();

      v10 = 0;
      goto LABEL_19;
    }
    if (objc_msgSend(v6, "count"))
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[BRCLocalStatInfo(LegacyAdditions) _finderTagsFromRelativePath:].cold.1();

      v10 = objc_alloc_init(BRFieldFinderTags);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            -[BRFieldFinderTags addTags:](v10, "addTags:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        }
        while (v13);
      }
LABEL_19:

      goto LABEL_20;
    }
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v10 = 0;
LABEL_20:
  -[BRFieldFinderTags data](v10, "data", (_QWORD)v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (char)_modeFromRelativePath:(id)a3 isPackageFault:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  char v6;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "isWritable");
  if (objc_msgSend(v5, "isExecutable")
    && objc_msgSend(v5, "isFile")
    && (objc_msgSend(v5, "isFault") & v4) == 0)
  {
    v6 |= 2u;
  }

  return v6;
}

- (void)_updateMetadataFromFSAtPath:(id)a3 itemID:(id)a4 parentGlobalID:(id)a5 isPackageFault:(BOOL)a6 readonlyShareChild:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v11;
  id v12;
  unsigned int type;
  BOOL v14;
  int v15;
  char *p_state;
  NSNumber *processingStamp;
  BRCItemID *v19;
  BRCItemID *parentID;
  unsigned int v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *v31;
  NSString *aliasTarget;
  uint64_t v33;
  NSData *v34;
  BOOL v35;
  void *v36;
  NSObject *v37;
  NSData *finderTags;
  NSData *v39;
  char v40;
  void *v41;
  void *v42;

  v7 = a7;
  v8 = a6;
  v11 = a3;
  v12 = a5;
  type = self->super._type;
  v14 = type > 0xA;
  v15 = (1 << type) & 0x611;
  if (v14 || v15 == 0)
  {
    p_state = &self->super._state;
    goto LABEL_8;
  }
  p_state = &self->super._state;
  if (self->super._state != 255)
LABEL_8:
    *p_state = 0;
  processingStamp = self->_processingStamp;
  self->_processingStamp = 0;

  if (v12)
  {
    objc_msgSend(v12, "itemID");
    v19 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
    parentID = self->super._parentID;
    self->super._parentID = v19;

  }
  if (!self->super._birthtime || (objc_msgSend(v11, "isFault") & 1) == 0)
    self->super._birthtime = objc_msgSend(v11, "birthTime");
  self->_itemScope = objc_msgSend(v11, "itemScope");
  v21 = self->super._type;
  if (v21 > 8 || ((1 << v21) & 0x184) == 0)
  {
    objc_msgSend(v11, "filename");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo setFilename:](self, "setFilename:", v23);

    self->super._hiddenExt = objc_msgSend(v11, "isHiddenExtension");
    v21 = self->super._type;
  }
  if (v21 == 3)
  {
    if (!self->super._aliasTarget)
    {
      objc_msgSend(v11, "bookmark");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "target");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "clientZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "mangledID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "aliasTargetContainerString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "itemID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "itemIDString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "stringByAppendingPathComponent:", v30);
      v31 = (NSString *)objc_claimAutoreleasedReturnValue();
      aliasTarget = self->super._aliasTarget;
      self->super._aliasTarget = v31;

    }
  }
  else
  {
    +[BRCLocalStatInfo _finderTagsFromRelativePath:](BRCLocalStatInfo, "_finderTagsFromRelativePath:", v11);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (NSData *)v33;
    if (self->super._finderTags)
      v35 = v33 == 0;
    else
      v35 = 0;
    if (v35)
    {
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[BRCLocalStatInfo(LegacyAdditions) _updateMetadataFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.1();

    }
    finderTags = self->super._finderTags;
    self->super._finderTags = v34;
    v39 = v34;

    v40 = +[BRCLocalStatInfo _modeFromRelativePath:isPackageFault:](BRCLocalStatInfo, "_modeFromRelativePath:isPackageFault:", v11, v8);
    if (v7)
      v40 |= self->super._mode & 1;
    self->super._mode = v40;
    -[BRFieldCKInfo etag](self->super._ckInfo, "etag");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
      -[BRCStatInfo creatorRowID](self, "creatorRowID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v42)
        -[BRCStatInfo setCreatorRowID:](self, "setCreatorRowID:", &unk_1E87D70A0);
    }
  }

}

- (void)updateFromFSAtPath:(id)a3 itemID:(id)a4 parentGlobalID:(id)a5 isPackageFault:(BOOL)a6 readonlyShareChild:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSNumber *v17;
  NSNumber *fileID;
  BRCGenerationID *v19;
  BRCGenerationID *generationID;
  unsigned int type;
  BOOL v22;
  int v23;
  NSNumber *v25;
  NSNumber *documentID;
  void *v27;
  NSObject *v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v7 = a7;
  v8 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (objc_msgSend(v12, "isUnixDir") && (objc_msgSend(v12, "isExecutable") & 1) == 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138412546;
      v30 = v12;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Inaccessible folder %@%@", (uint8_t *)&v29, 0x16u);
    }

  }
  -[BRCLocalStatInfo _updateMetadataFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:](self, "_updateMetadataFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:", v12, v13, v14, v8, v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "fileID"));
  v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fileID = self->_fileID;
  self->_fileID = v17;

  objc_msgSend(v12, "generationID");
  v19 = (BRCGenerationID *)objc_claimAutoreleasedReturnValue();
  generationID = self->_generationID;
  self->_generationID = v19;

  type = self->super._type;
  v22 = type > 8;
  v23 = (1 << type) & 0x1C6;
  if (v22 || v23 == 0)
  {
    documentID = self->_documentID;
    self->_documentID = 0;
  }
  else
  {
    if ((objc_msgSend(v12, "isDocument") & 1) == 0)
    {
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        -[BRCLocalStatInfo(LegacyAdditions) updateFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.1();

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v12, "documentID"));
    v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    documentID = self->_documentID;
    self->_documentID = v25;
  }

}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BRCLocalStatInfo;
  v7 = -[BRCStatInfo initFromResultSet:pos:](&v26, sel_initFromResultSet_pos_, v6, v4);
  if (v7)
  {
    objc_msgSend(v6, "numberAtIndex:", (v4 + 16));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v7 + 18);
    *((_QWORD *)v7 + 18) = v8;

    objc_msgSend(v6, "numberAtIndex:", (v4 + 17));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v7 + 16);
    *((_QWORD *)v7 + 16) = v10;

    objc_msgSend(v6, "objectOfClass:atIndex:", objc_opt_class(), (v4 + 18));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v7 + 17);
    *((_QWORD *)v7 + 17) = v12;

    objc_msgSend(v6, "stringAtIndex:", (v4 + 19));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v7 + 20);
    *((_QWORD *)v7 + 20) = v14;

    objc_msgSend(v6, "numberAtIndex:", (v4 + 20));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v7 + 25);
    *((_QWORD *)v7 + 25) = v16;

    objc_msgSend(v6, "numberAtIndex:", (v4 + 21));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v7 + 21);
    *((_QWORD *)v7 + 21) = v18;

    if (*((_QWORD *)v7 + 16) && objc_msgSend(*((id *)v7 + 21), "br_isEqualToNumber:"))
    {
      v20 = (void *)*((_QWORD *)v7 + 21);
      *((_QWORD *)v7 + 21) = &unk_1E87D70A0;

    }
    *((_DWORD *)v7 + 44) = objc_msgSend(v6, "unsignedIntAtIndex:", (v4 + 22));
    objc_msgSend(v6, "stringAtIndex:", (v4 + 23));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v7 + 23);
    *((_QWORD *)v7 + 23) = v21;

    *((_BYTE *)v7 + 192) = objc_msgSend(v6, "intAtIndex:", (v4 + 24));
    objc_msgSend(v6, "numberAtIndex:", (v4 + 25));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v7 + 19);
    *((_QWORD *)v7 + 19) = v23;

  }
  return v7;
}

- (BRCLocalStatInfo)initWithLocalStatInfo:(id)a3
{
  id v4;
  BRCLocalStatInfo *v5;
  BRCLocalStatInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCLocalStatInfo;
  v5 = -[BRCStatInfo initWithStatInfo:](&v8, sel_initWithStatInfo_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_documentID, *((id *)v4 + 18));
    objc_storeStrong((id *)&v6->_fileID, *((id *)v4 + 16));
    objc_storeStrong((id *)&v6->_generationID, *((id *)v4 + 17));
    objc_storeStrong((id *)&v6->_stagedFileID, *((id *)v4 + 21));
    v6->_stagedGenerationID = *((_DWORD *)v4 + 44);
    objc_storeStrong((id *)&v6->_physicalName, *((id *)v4 + 20));
    objc_storeStrong((id *)&v6->_processingStamp, *((id *)v4 + 25));
    objc_storeStrong((id *)&v6->_tmpBouncedNo, *((id *)v4 + 19));
    v6->_itemScope = *((_BYTE *)v4 + 192);
    objc_storeStrong((id *)&v6->_bouncedLogicalName, *((id *)v4 + 23));
  }

  return v6;
}

- (BRCLocalStatInfo)initWithRelativePath:(id)a3 itemID:(id)a4 parentGlobalID:(id)a5
{
  id v8;
  id v9;
  id v10;
  BRCLocalStatInfo *v11;
  BRCLocalStatInfo *v12;
  void *v13;
  NSObject *v14;
  BRCLocalStatInfo *v15;
  char v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BRCLocalStatInfo;
  v11 = -[BRCLocalStatInfo init](&v18, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_18;
  v11->super._state = 0;
  if (!objc_msgSend(v8, "isFault"))
  {
    if ((objc_msgSend(v8, "isSymLink") & 1) != 0)
    {
      v16 = 5;
    }
    else if ((objc_msgSend(v8, "isBRAlias") & 1) != 0)
    {
      v16 = 3;
    }
    else if ((objc_msgSend(v8, "isFinderAlias") & 1) != 0)
    {
      v16 = 6;
    }
    else if ((objc_msgSend(v8, "isDocument") & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      if (objc_msgSend(v8, "type") != 3)
      {
LABEL_17:
        -[BRCLocalStatInfo updateFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:](v12, "updateFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:", v8, v9, v10, 0, 0);
LABEL_18:
        v15 = v12;
        goto LABEL_19;
      }
      v16 = 4;
    }
    v12->super._type = v16;
    goto LABEL_17;
  }
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    -[BRCLocalStatInfo(LegacyAdditions) initWithRelativePath:itemID:parentGlobalID:].cold.1();

  v15 = 0;
LABEL_19:

  return v15;
}

- (void)updateLocationAndMetaFromFSAtPath:(id)a3 itemID:(id)a4 parentGlobalID:(id)a5 isPackageFault:(BOOL)a6 readonlyShareChild:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  NSNumber *documentID;
  uint64_t v16;
  int v17;
  unsigned int type;
  BOOL v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  int v25;
  int v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  unint64_t v31;
  NSNumber *v32;
  NSNumber *v33;
  BRCGenerationID *v34;
  void *v35;
  NSObject *v36;
  NSString *v37;
  NSString *physicalName;
  unint64_t v39;
  void *v40;
  NSNumber *v41;
  NSNumber *fileID;
  void *v43;
  char v44;
  void *v45;
  NSObject *v46;
  NSString *bouncedLogicalName;
  NSNumber *tmpBouncedNo;
  BRCGenerationID *v49;
  BRCGenerationID *generationID;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  NSString *logicalName;
  int v60;
  BRCLocalStatInfo *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v7 = a7;
  v8 = a6;
  v66 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  documentID = self->_documentID;
  if (documentID)
  {
    v16 = -[NSNumber unsignedLongLongValue](documentID, "unsignedLongLongValue");
    if (v16 != objc_msgSend(v12, "documentID"))
    {
      brc_bread_crumbs();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
        -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.7();

    }
  }
  -[BRCLocalStatInfo _updateMetadataFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:](self, "_updateMetadataFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:", v12, v13, v14, v8, v7);
  v17 = objc_msgSend(v12, "isFault");
  type = self->super._type;
  v19 = type > 8;
  v20 = (1 << type) & 0x184;
  v21 = v19 || v20 == 0;
  if (v17)
  {
    if (v21)
    {
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.1();

    }
    objc_msgSend(v12, "filename");
    v37 = (NSString *)objc_claimAutoreleasedReturnValue();
    physicalName = self->_physicalName;
    self->_physicalName = v37;

    v39 = -[NSNumber unsignedLongLongValue](self->_fileID, "unsignedLongLongValue");
    if (v39 != objc_msgSend(v12, "fileID"))
    {
      objc_msgSend(v12, "logicalName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "fileID"));
      v41 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      fileID = self->_fileID;
      self->_fileID = v41;

      if (v40)
      {
        -[BRCLocalStatInfo logicalName](self, "logicalName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v40, "isEqualToString:", v43);

        if ((v44 & 1) == 0)
        {
          brc_bread_crumbs();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            logicalName = self->super._logicalName;
            v60 = 138412802;
            v61 = (BRCLocalStatInfo *)logicalName;
            v62 = 2112;
            v63 = v40;
            v64 = 2112;
            v65 = v45;
            _os_log_debug_impl(&dword_1CBD43000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Fault was renamed from %@ to %@%@", (uint8_t *)&v60, 0x20u);
          }

          objc_storeStrong((id *)&self->super._logicalName, v40);
          bouncedLogicalName = self->_bouncedLogicalName;
          self->_bouncedLogicalName = 0;

          tmpBouncedNo = self->_tmpBouncedNo;
          self->_tmpBouncedNo = 0;

        }
      }

    }
    objc_msgSend(v12, "generationID");
    v49 = (BRCGenerationID *)objc_claimAutoreleasedReturnValue();
    generationID = self->_generationID;
    self->_generationID = v49;

  }
  else if (!v21)
  {
    if ((objc_msgSend(v12, "isDocument") & 1) == 0 && (objc_msgSend(v12, "isFinderAlias") & 1) == 0)
    {
      brc_bread_crumbs();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
        -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.6();

    }
    v22 = objc_msgSend(v12, "fileID");
    if (v22 == -[NSNumber unsignedLongLongValue](self->_fileID, "unsignedLongLongValue"))
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v60 = 138412802;
        v61 = self;
        v62 = 2112;
        v63 = v12;
        v64 = 2112;
        v65 = v23;
        _os_log_fault_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We think we are no longer a fault, but we have the same fileID for\n%@\n%@%@", (uint8_t *)&v60, 0x20u);
      }

    }
    else
    {
      v25 = objc_msgSend(v12, "isFinderAlias");
      v26 = self->super._type;
      if (v25)
      {
        if (v26 != 7)
        {
          brc_bread_crumbs();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
            -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.3();

        }
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.2();

        self->super._type = 6;
      }
      else
      {
        if (v26 != 2)
        {
          brc_bread_crumbs();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
            -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.5();

        }
        brc_bread_crumbs();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[BRCLocalStatInfo(LegacyAdditions) updateLocationAndMetaFromFSAtPath:itemID:parentGlobalID:isPackageFault:readonlyShareChild:].cold.4();

        self->super._type = 1;
      }
    }
  }
  v31 = -[NSNumber unsignedLongLongValue](self->_fileID, "unsignedLongLongValue");
  if (v31 != objc_msgSend(v12, "fileID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "fileID"));
    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v33 = self->_fileID;
    self->_fileID = v32;

    v34 = self->_generationID;
    self->_generationID = 0;

  }
}

- (void)updateFilenameFromPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  NSString *bouncedLogicalName;
  NSNumber *tmpBouncedNo;
  unsigned int type;
  BOOL v13;
  int v14;
  NSString *v16;
  NSString *physicalName;
  NSNumber *v18;
  NSNumber *fileID;
  BRCGenerationID *v20;
  void *generationID;
  NSObject *v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isFault") & 1) != 0)
    objc_msgSend(v4, "logicalName");
  else
    objc_msgSend(v4, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    brc_bread_crumbs();
    generationID = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412546;
      v24 = v4;
      v25 = 2112;
      v26 = generationID;
      _os_log_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] No logical name for %@%@", (uint8_t *)&v23, 0x16u);
    }

    goto LABEL_17;
  }
  -[BRCLocalStatInfo logicalName](self, "logicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412546;
      v24 = v5;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Updating filename during CZM processing to %@%@", (uint8_t *)&v23, 0x16u);
    }

    bouncedLogicalName = self->_bouncedLogicalName;
    self->_bouncedLogicalName = 0;

    tmpBouncedNo = self->_tmpBouncedNo;
    self->_tmpBouncedNo = 0;

    objc_storeStrong((id *)&self->super._logicalName, v5);
    if (objc_msgSend(v4, "isFault"))
    {
      type = self->super._type;
      v13 = type > 8;
      v14 = (1 << type) & 0x184;
      if (!v13 && v14 != 0)
      {
        objc_msgSend(v4, "filename");
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        physicalName = self->_physicalName;
        self->_physicalName = v16;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "fileID"));
        v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        fileID = self->_fileID;
        self->_fileID = v18;

        objc_msgSend(v4, "generationID");
        v20 = (BRCGenerationID *)objc_claimAutoreleasedReturnValue();
        generationID = self->_generationID;
        self->_generationID = v20;
LABEL_17:

      }
    }
  }

}

- (void)_markReserved
{
  NSNumber *fileID;
  BRCGenerationID *generationID;
  NSNumber *documentID;

  fileID = self->_fileID;
  self->_fileID = 0;

  generationID = self->_generationID;
  self->_generationID = 0;

  objc_storeStrong((id *)&self->_physicalName, self->_bouncedLogicalName);
  if (!self->_stagedFileID)
  {
    documentID = self->_documentID;
    self->_documentID = 0;

  }
  self->super._state = -2;
}

- (void)_markLiveFromStageAsType:(char)a3
{
  unsigned int v3;
  unsigned int state;
  void *v6;
  NSObject *v7;
  BRCGenerationID *v8;
  BRCGenerationID *generationID;
  NSNumber *stagedFileID;
  NSNumber *processingStamp;
  unsigned int type;
  void *v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  NSString *physicalName;
  void *v18;
  NSObject *v19;
  unsigned int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;

  v3 = a3;
  if (!self->_stagedFileID)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsType:].cold.6();

  }
  if (self->super._type != 5 && !self->_stagedGenerationID)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsType:].cold.5();

  }
  state = self->super._state;
  if (state > 0xFD)
  {
    if (state != 255)
    {
      if (state == 254 && !self->_fileID && !self->_generationID)
        goto LABEL_18;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (!self->super._state || state == 253)
  {
LABEL_13:
    if (self->_fileID && self->_generationID)
      goto LABEL_18;
  }
LABEL_15:
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsType:].cold.4();

LABEL_18:
  objc_storeStrong((id *)&self->_fileID, self->_stagedFileID);
  v8 = -[BRCGenerationID initWithFSGenerationID:]([BRCGenerationID alloc], "initWithFSGenerationID:", self->_stagedGenerationID);
  generationID = self->_generationID;
  self->_generationID = v8;

  stagedFileID = self->_stagedFileID;
  self->_stagedFileID = 0;

  self->_stagedGenerationID = 0;
  self->super._state = 0;
  processingStamp = self->_processingStamp;
  self->_processingStamp = 0;

  if (v3 <= 8 && ((1 << v3) & 0x184) != 0)
  {
    type = self->super._type;
    if (type <= 0xA && ((1 << type) & 0x611) != 0)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsType:].cold.3();

      type = self->super._type;
    }
    if (type > 8 || ((1 << type) & 0x184) == 0)
    {
      -[BRCLocalStatInfo logicalName](self, "logicalName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "br_sideFaultName");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      physicalName = self->_physicalName;
      self->_physicalName = v16;

    }
    if ((-[NSString br_isSideFaultName](self->_physicalName, "br_isSideFaultName") & 1) == 0)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsType:].cold.2();
LABEL_44:

    }
  }
  else
  {
    v20 = self->super._type;
    if (v20 <= 8 && ((1 << v20) & 0x184) != 0)
      objc_storeStrong((id *)&self->_physicalName, self->_bouncedLogicalName);
    if (-[NSString br_isSideFaultName](self->_physicalName, "br_isSideFaultName"))
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsType:].cold.1();
      goto LABEL_44;
    }
  }
  self->super._type = v3;
}

- (void)_markLiveFromStageAsFault:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  char v7;
  _BYTE *v8;

  LODWORD(v4) = self->super._type;
  if (!a3)
  {
    v7 = v4 - 2;
    if ((v4 - 2) >= 9 || ((0x161u >> v7) & 1) == 0)
      goto LABEL_12;
    v4 = v7;
    v8 = &unk_1CC066ACA;
LABEL_11:
    LOBYTE(v4) = v8[v4];
    goto LABEL_12;
  }
  LODWORD(v4) = v4 - 1;
  if (v4 < 0xA && ((0x2E3u >> v4) & 1) != 0)
  {
    v4 = (char)v4;
    v8 = &unk_1CC066AC0;
    goto LABEL_11;
  }
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    -[BRCLocalStatInfo(LegacyAdditions) _markLiveFromStageAsFault:].cold.1();

  LOBYTE(v4) = 2;
LABEL_12:
  -[BRCLocalStatInfo _markLiveFromStageAsType:](self, "_markLiveFromStageAsType:", (char)v4);
}

- (void)_setParentID:(id)a3
{
  objc_storeStrong((id *)&self->super._parentID, a3);
}

- (void)_generatedBouncedLogicalFilenameWithBounceNumber:(unint64_t)a3
{
  NSNumber *v5;
  NSNumber *tmpBouncedNo;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;

  if (self->super._type == 3)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo(LegacyAdditions) _generatedBouncedLogicalFilenameWithBounceNumber:].cold.2();

  }
  if (a3 <= 1)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo(LegacyAdditions) _generatedBouncedLogicalFilenameWithBounceNumber:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  tmpBouncedNo = self->_tmpBouncedNo;
  self->_tmpBouncedNo = v5;

}

- (void)_migrateTmpBouncedNameToLocalName
{
  NSString *v3;
  NSString *bouncedLogicalName;
  unsigned int type;
  BOOL v6;
  int v7;
  void *v9;
  int v10;
  NSNumber *tmpBouncedNo;

  -[BRCStatInfo representableName](self, "representableName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  bouncedLogicalName = self->_bouncedLogicalName;
  self->_bouncedLogicalName = v3;

  type = self->super._type;
  v6 = type > 8;
  v7 = (1 << type) & 0x184;
  if (v6 || v7 == 0)
  {
    v10 = 0;
    v9 = self->_bouncedLogicalName;
  }
  else
  {
    -[NSString br_sideFaultName](self->_bouncedLogicalName, "br_sideFaultName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
  }
  objc_storeStrong((id *)&self->_physicalName, v9);
  if (v10)

  tmpBouncedNo = self->_tmpBouncedNo;
  self->_tmpBouncedNo = 0;

}

- (void)_bouncePhysicalNameToRepresentableName
{
  NSString *v3;
  NSString *bouncedLogicalName;
  unsigned int type;
  BOOL v6;
  int v7;
  void *v9;
  int v10;
  id v11;

  -[BRCStatInfo representableName](self, "representableName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  bouncedLogicalName = self->_bouncedLogicalName;
  self->_bouncedLogicalName = v3;

  type = self->super._type;
  v6 = type > 8;
  v7 = (1 << type) & 0x184;
  if (v6 || v7 == 0)
  {
    v10 = 0;
    v9 = self->_bouncedLogicalName;
  }
  else
  {
    -[NSString br_sideFaultName](self->_bouncedLogicalName, "br_sideFaultName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
  }
  v11 = v9;
  objc_storeStrong((id *)&self->_physicalName, v9);
  if (v10)

}

- (void)_clearTmpBouncedNumber
{
  NSNumber *tmpBouncedNo;

  tmpBouncedNo = self->_tmpBouncedNo;
  self->_tmpBouncedNo = 0;

}

- (void)_markClearedFromStage
{
  NSNumber *stagedFileID;

  stagedFileID = self->_stagedFileID;
  self->_stagedFileID = 0;

  self->_stagedGenerationID = 0;
}

- (void)_markStagedWithFileID:(id)a3 generationID:(unsigned int)a4 documentID:(id)a5
{
  id v9;
  id v10;

  v10 = a3;
  v9 = a5;
  objc_storeStrong((id *)&self->_stagedFileID, a3);
  self->_stagedGenerationID = a4;
  if (self->super._state == 254)
    objc_storeStrong((id *)&self->_documentID, a5);

}

- (id)logicalName
{
  NSNumber *tmpBouncedNo;
  NSString *bouncedLogicalName;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  tmpBouncedNo = self->_tmpBouncedNo;
  bouncedLogicalName = self->_bouncedLogicalName;
  if (tmpBouncedNo)
  {
    if (!bouncedLogicalName)
      bouncedLogicalName = self->super._logicalName;
    v11 = 0;
    -[NSString br_stringByDeletingPathBounceNo:andPathExtension:](bouncedLogicalName, "br_stringByDeletingPathBounceNo:andPathExtension:", 0, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[NSNumber stringValue](self->_tmpBouncedNo, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v5, v8, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    if (!bouncedLogicalName)
      bouncedLogicalName = self->super._logicalName;
    return bouncedLogicalName;
  }
}

- (NSString)logicalNameWithoutLocalBounce
{
  return self->super._logicalName;
}

- (NSNumber)stagedFileIDForDB
{
  NSNumber **p_stagedFileID;

  p_stagedFileID = &self->_stagedFileID;
  if (-[NSNumber br_isEqualToNumber:](self->_stagedFileID, "br_isEqualToNumber:", &unk_1E87D71F0))
    p_stagedFileID = &self->_fileID;
  return *p_stagedFileID;
}

- (unsigned)itemScope
{
  int itemScope;
  int state;
  void *v5;
  NSObject *v6;

  itemScope = self->_itemScope;
  if (!itemScope)
  {
    state = self->super._state;
    if (state != 1 && state != 254)
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[BRCLocalStatInfo itemScope].cold.1();

      LOBYTE(itemScope) = self->_itemScope;
    }
  }
  return itemScope;
}

- (id)descriptionWithContext:(id)a3 origName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *physicalName;
  void *v11;
  NSString *bouncedLogicalName;
  void *v13;
  int itemScope;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v19;
  NSObject *v20;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCLocalStatInfo;
  -[BRCStatInfo descriptionWithContext:origName:](&v21, sel_descriptionWithContext_origName_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo descriptionWithContext:origName:].cold.1();

  }
  if (self->_documentID)
    objc_msgSend(v7, "appendFormat:", CFSTR(" doc:%@"), self->_documentID);
  -[BRCLocalStatInfo lostStamp](self, "lostStamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    brc_current_date_nsec();
    objc_msgSend(v8, "unsignedLongLongValue");
    brc_interval_from_nsec();
    +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(" lost-stamp:%@ ago"), v9);

  }
  if (self->_fileID)
    objc_msgSend(v7, "appendFormat:", CFSTR(" ino:%@"), self->_fileID);
  if (self->_generationID)
    objc_msgSend(v7, "appendFormat:", CFSTR(" gen:%@"), self->_generationID);
  if (self->_stagedFileID)
    objc_msgSend(v7, "appendFormat:", CFSTR(" s_ino:%@"), self->_stagedFileID);
  if (self->_stagedGenerationID)
    objc_msgSend(v7, "appendFormat:", CFSTR(" s_gen:%u"), self->_stagedGenerationID);
  physicalName = self->_physicalName;
  if (physicalName)
  {
    -[NSString fp_obfuscatedFilename](physicalName, "fp_obfuscatedFilename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(" pn:\"%@\"), v11);

  }
  if (self->_tmpBouncedNo)
    objc_msgSend(v7, "appendFormat:", CFSTR(" tbn:\"%@\"), self->_tmpBouncedNo);
  bouncedLogicalName = self->_bouncedLogicalName;
  if (bouncedLogicalName)
  {
    -[NSString fp_obfuscatedFilename](bouncedLogicalName, "fp_obfuscatedFilename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(" bln:\"%@\"), v13);

  }
  if (self->super._state != 254)
  {
    itemScope = self->_itemScope;
    v15 = CFSTR("docs");
    v16 = CFSTR("unknown");
    if (itemScope == 3)
      v16 = CFSTR("trash");
    if (itemScope != 2)
      v15 = v16;
    if (itemScope == 1)
      v17 = CFSTR("data");
    else
      v17 = v15;
    objc_msgSend(v7, "appendFormat:", CFSTR(" sc:%@"), v17);
  }

  return v7;
}

- (id)description
{
  return -[BRCLocalStatInfo descriptionWithContext:origName:](self, "descriptionWithContext:origName:", 0, 0);
}

- (id)initAsShareAcceptFaultWithName:(id)a3 mode:(char)a4 isDirectory:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  BRCLocalStatInfo *v9;
  BRCLocalStatInfo *v10;
  char v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCLocalStatInfo;
  v9 = -[BRCLocalStatInfo init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->super._state = 0;
    if (v5)
      v11 = 10;
    else
      v11 = 8;
    v9->super._type = v11;
    v9->super._mode = a4;
    -[BRCLocalStatInfo setFilename:](v9, "setFilename:", v8);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLocalStatInfo:", self);
}

- (NSString)filename
{
  void *v3;
  void *v4;
  unsigned int type;
  BOOL v6;
  int v7;
  NSString *v9;
  NSString *physicalName;
  NSString *v11;

  if (self->_tmpBouncedNo)
  {
    -[BRCLocalStatInfo logicalName](self, "logicalName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    type = self->super._type;
    v6 = type > 8;
    v7 = (1 << type) & 0x184;
    if (v6 || v7 == 0)
    {
      v9 = v3;
    }
    else
    {
      objc_msgSend(v3, "br_sideFaultName");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;

  }
  else
  {
    physicalName = self->_physicalName;
    if (!physicalName)
      physicalName = self->super._logicalName;
    v11 = physicalName;
  }
  return v11;
}

- (void)setFilename:(id)a3
{
  -[BRCLocalStatInfo setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:](self, "setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:", a3, 0, 0, 0);
}

- (void)setFilename:(id)a3 forcePhysicalName:(id)a4 forceBouncedLogicalName:(id)a5 serverName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *physicalName;
  NSObject *v20;
  NSString **p_bouncedLogicalName;
  int type;
  NSString *v24;
  uint64_t v25;
  void *v26;
  objc_class *v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (self->_tmpBouncedNo)
  {
    -[BRCLocalStatInfo logicalName](self, "logicalName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v11);

    if (v16)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[BRCLocalStatInfo setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:].cold.3();

    }
  }
  if ((objc_msgSend(v11, "br_isSideFaultName") & 1) != 0 || objc_msgSend(v13, "br_isSideFaultName"))
  {
    brc_bread_crumbs();
    physicalName = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:].cold.1();
LABEL_10:

    goto LABEL_11;
  }
  p_bouncedLogicalName = &self->_bouncedLogicalName;
  if (-[NSString isEqualToString:](self->_bouncedLogicalName, "isEqualToString:", v11)
    && (objc_msgSend(v14, "isEqualToString:", *p_bouncedLogicalName) & 1) == 0)
  {
    brc_bread_crumbs();
    physicalName = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[BRCLocalStatInfo setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:].cold.2(p_bouncedLogicalName);
    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_bouncedLogicalName, a5);
  type = self->super._type;
  if ((type - 7) < 2 || type == 2)
  {
    objc_storeStrong((id *)&self->super._logicalName, a3);
    objc_msgSend(v11, "br_sideFaultName");
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    physicalName = self->_physicalName;
    self->_physicalName = v24;
    goto LABEL_11;
  }
  if (type == 3)
  {
    v25 = 160;
LABEL_30:
    v27 = (objc_class *)v11;
    physicalName = *(Class *)((char *)&self->super.super.isa + v25);
    *(Class *)((char *)&self->super.super.isa + v25) = v27;
    goto LABEL_11;
  }
  if (v12)
  {
    if (objc_msgSend(v12, "isEqualToString:", v11))
      v26 = 0;
    else
      v26 = v12;
    objc_storeStrong((id *)&self->_physicalName, v26);
    v25 = 56;
    goto LABEL_30;
  }
  if (-[NSString isEqualToString:](self->_physicalName, "isEqualToString:", v11))
    goto LABEL_12;
  objc_storeStrong((id *)&self->super._logicalName, a3);
  physicalName = self->_physicalName;
  self->_physicalName = 0;
LABEL_11:

LABEL_12:
}

- (void)_setItemScope:(unsigned __int8)a3
{
  self->_itemScope = a3;
}

- (void)_setCKInfo:(id)a3
{
  objc_storeStrong((id *)&self->super._ckInfo, a3);
}

- (void)_moveItemAsideWithUUIDString
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: can't move aside a root item!%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (unint64_t)diffAgainstLocalInfo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  NSNumber *v8;
  NSNumber *v9;
  NSNumber *v10;
  char v11;
  void *v12;
  NSNumber *v13;
  NSNumber *v14;
  NSNumber *v15;
  char v16;
  void *v17;
  BRCGenerationID *v18;
  BRCGenerationID *v19;
  BRCGenerationID *v20;
  BOOL v21;
  void *v22;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  char v26;
  void *v27;
  NSNumber *v28;
  NSNumber *v29;
  NSNumber *v30;
  char v31;
  void *v32;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  char v36;

  v4 = a3;
  v5 = -[BRCStatInfo diffAgainst:](self, "diffAgainst:", v4);
  v6 = v5;
  if ((v5 & 0x100000000) == 0 && self->super._state != *((unsigned __int8 *)v4 + 24))
    v6 = v5 | 0x100000000;
  if ((v6 & 0x200000000) != 0)
    goto LABEL_10;
  v7 = (void *)v4[18];
  v8 = self->_documentID;
  v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_10;
  }
  v10 = v9;
  if (!v9)
  {

    goto LABEL_17;
  }
  v11 = -[NSNumber isEqual:](v8, "isEqual:", v9);

  if ((v11 & 1) != 0)
  {
LABEL_10:
    if ((v6 & 0x400000000) != 0)
      goto LABEL_21;
LABEL_11:
    v12 = (void *)v4[16];
    v13 = self->_fileID;
    v14 = v12;
    if (v13 == v14)
    {

      goto LABEL_21;
    }
    v15 = v14;
    if (v14)
    {
      v16 = -[NSNumber isEqual:](v13, "isEqual:", v14);

      if ((v16 & 1) != 0)
        goto LABEL_21;
    }
    else
    {

    }
    v6 |= 0x400000000uLL;
    goto LABEL_21;
  }
LABEL_17:
  v6 |= 0x200000000uLL;
  if ((v6 & 0x400000000) == 0)
    goto LABEL_11;
LABEL_21:
  if ((v6 & 0x800000000) != 0)
    goto LABEL_27;
  v17 = (void *)v4[17];
  v18 = self->_generationID;
  v19 = v17;
  if (v18 == v19)
  {

    goto LABEL_27;
  }
  v20 = v19;
  if (!v19)
  {

    goto LABEL_34;
  }
  v21 = -[BRCGenerationID isEqual:](v18, "isEqual:", v19);

  if (v21)
  {
LABEL_27:
    if ((v6 & 0x1000000000) != 0)
      goto LABEL_38;
LABEL_28:
    v22 = (void *)v4[20];
    v23 = self->_physicalName;
    v24 = v22;
    if (v23 == v24)
    {

      goto LABEL_38;
    }
    v25 = v24;
    if (v24)
    {
      v26 = -[NSString isEqual:](v23, "isEqual:", v24);

      if ((v26 & 1) != 0)
        goto LABEL_38;
    }
    else
    {

    }
    v6 |= 0x1000000000uLL;
    goto LABEL_38;
  }
LABEL_34:
  v6 |= 0x800000000uLL;
  if ((v6 & 0x1000000000) == 0)
    goto LABEL_28;
LABEL_38:
  if ((v6 & 0x4000000000) == 0)
  {
    v27 = (void *)v4[21];
    v28 = self->_stagedFileID;
    v29 = v27;
    if (v28 == v29)
    {

    }
    else
    {
      v30 = v29;
      if (!v29)
      {

        goto LABEL_58;
      }
      v31 = -[NSNumber isEqual:](v28, "isEqual:", v29);

      if ((v31 & 1) == 0)
      {
LABEL_58:
        v6 |= 0x4000000000uLL;
        if ((v6 & 0x4000000000) != 0)
          goto LABEL_47;
        goto LABEL_45;
      }
    }
  }
  if ((v6 & 0x4000000000) != 0)
    goto LABEL_47;
LABEL_45:
  if (self->_stagedGenerationID != *((_DWORD *)v4 + 44))
    v6 |= 0x4000000000uLL;
LABEL_47:
  if ((v6 & 0x1000000000) != 0)
    goto LABEL_53;
  v32 = (void *)v4[23];
  v33 = self->_bouncedLogicalName;
  v34 = v32;
  if (v33 == v34)
  {

    goto LABEL_53;
  }
  v35 = v34;
  if (!v34)
  {

    goto LABEL_61;
  }
  v36 = -[NSString isEqual:](v33, "isEqual:", v34);

  if ((v36 & 1) != 0)
  {
LABEL_53:
    if ((v6 & 0x2000000000) != 0)
      goto LABEL_56;
    goto LABEL_54;
  }
LABEL_61:
  v6 |= 0x1000000000uLL;
  if ((v6 & 0x2000000000) != 0)
    goto LABEL_56;
LABEL_54:
  if (self->_itemScope != *((unsigned __int8 *)v4 + 192))
    v6 |= 0x2000000000uLL;
LABEL_56:

  return v6;
}

- (void)_markDead
{
  NSNumber *documentID;
  NSNumber *fileID;
  BRCGenerationID *generationID;
  NSNumber *stagedFileID;
  NSNumber *processingStamp;

  if (self->super._state != 1)
  {
    self->super._state = 1;
    documentID = self->_documentID;
    self->_documentID = 0;

    fileID = self->_fileID;
    self->_fileID = 0;

    generationID = self->_generationID;
    self->_generationID = 0;

    stagedFileID = self->_stagedFileID;
    self->_stagedFileID = 0;

    self->_stagedGenerationID = 0;
    processingStamp = self->_processingStamp;
    self->_processingStamp = 0;

  }
}

- (void)_markDeadAsSharedTopLevelItemWithDocumentsItemID:(id)a3
{
  BRCItemID *v4;
  BRCItemID *parentID;

  v4 = (BRCItemID *)a3;
  -[BRCLocalStatInfo _markDead](self, "_markDead");
  parentID = self->super._parentID;
  self->super._parentID = v4;

}

- (void)_updateStatMeta:(id)a3
{
  id v4;
  NSData *v5;
  NSData *xattrSignature;
  NSData *lazyXattr;
  NSData *v8;
  NSData *finderTags;
  NSString *v10;
  NSString *trashPutBackPath;
  BRCItemID *v12;
  BRCItemID *trashPutBackParentID;

  v4 = a3;
  self->super._mode = objc_msgSend(v4, "mode");
  self->super._birthtime = objc_msgSend(v4, "birthtime");
  self->super._hiddenExt = objc_msgSend(v4, "isHiddenExt");
  objc_msgSend(v4, "xattrSignature");
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  xattrSignature = self->super._xattrSignature;
  self->super._xattrSignature = v5;

  lazyXattr = self->super._lazyXattr;
  self->super._lazyXattr = 0;

  objc_msgSend(v4, "finderTags");
  v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  finderTags = self->super._finderTags;
  self->super._finderTags = v8;

  self->super._favoriteRank = objc_msgSend(v4, "favoriteRank");
  self->super._lastUsedTime = objc_msgSend(v4, "lastUsedTime");
  objc_msgSend(v4, "trashPutBackPath");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  trashPutBackPath = self->super._trashPutBackPath;
  self->super._trashPutBackPath = v10;

  objc_msgSend(v4, "trashPutBackParentID");
  v12 = (BRCItemID *)objc_claimAutoreleasedReturnValue();

  trashPutBackParentID = self->super._trashPutBackParentID;
  self->super._trashPutBackParentID = v12;

}

- (BOOL)checkStateWithItemID:(id)a3 logToFile:(__sFILE *)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a3;
  if (self->super._state >= 0xFDu && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BRCLocalStatInfo;
    v7 = -[BRCStatInfo checkStateWithItemID:logToFile:](&v9, sel_checkStateWithItemID_logToFile_, v6, a4);
  }

  return v7;
}

- (NSNumber)processingStamp
{
  return self->_processingStamp;
}

- (void)setItemScope:(unsigned __int8)a3
{
  self->_itemScope = a3;
}

- (NSString)rawBouncedLogicalName
{
  return self->_bouncedLogicalName;
}

- (void)setRawBouncedLogicalName:(id)a3
{
  objc_storeStrong((id *)&self->_bouncedLogicalName, a3);
}

- (NSNumber)documentID
{
  return self->_documentID;
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (BRCGenerationID)generationID
{
  return self->_generationID;
}

- (NSString)physicalName
{
  return self->_physicalName;
}

- (NSNumber)tmpBouncedNo
{
  return self->_tmpBouncedNo;
}

- (NSNumber)stagedFileID
{
  return self->_stagedFileID;
}

- (unsigned)stagedGenerationID
{
  return self->_stagedGenerationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingStamp, 0);
  objc_storeStrong((id *)&self->_bouncedLogicalName, 0);
  objc_storeStrong((id *)&self->_stagedFileID, 0);
  objc_storeStrong((id *)&self->_physicalName, 0);
  objc_storeStrong((id *)&self->_tmpBouncedNo, 0);
  objc_storeStrong((id *)&self->_documentID, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
}

- (void)itemScope
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _itemScope != BRC_ITEM_SCOPE_UNKNOWN || _state == BRC_ITEM_STATE_TOMBSTONE || _state == BRC_ITEM_STATE_RESERVED%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)descriptionWithContext:origName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [s isKindOfClass:[NSMutableString class]]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: got a fault name%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setFilename:(_QWORD *)a1 forcePhysicalName:forceBouncedLogicalName:serverName:.cold.2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Not overriding name equal to bounced name %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)setFilename:forcePhysicalName:forceBouncedLogicalName:serverName:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_tmpBouncedNo || ![self.logicalName isEqualToString:name]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
