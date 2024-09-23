@implementation BRCStatInfo

- (BRMangledID)_aliasTargetMangledID
{
  NSString *aliasTarget;
  void *v3;
  void *v4;

  aliasTarget = self->_aliasTarget;
  if (aliasTarget)
  {
    -[NSString stringByDeletingLastPathComponent](aliasTarget, "stringByDeletingLastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithAliasTargetContainerString:", v3);

  }
  else
  {
    v4 = 0;
  }
  return (BRMangledID *)v4;
}

- (id)_aliasTargetItemID
{
  BRCItemID *v3;
  void *v4;
  BRCItemID *v5;
  void *v7;
  NSObject *v8;

  if (self->_type != 3)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCStatInfo _aliasTargetItemID].cold.1();

  }
  if (self->_aliasTarget)
  {
    v3 = [BRCItemID alloc];
    -[NSString lastPathComponent](self->_aliasTarget, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BRCItemID initWithUUIDString:](v3, "initWithUUIDString:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_updateAliasTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *aliasTarget;
  void *v12;
  NSObject *v13;

  v4 = a3;
  objc_msgSend(v4, "clientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mangledID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aliasTargetContainerString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCStatInfo _updateAliasTarget:].cold.1();

  }
  objc_msgSend(v4, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  aliasTarget = self->_aliasTarget;
  self->_aliasTarget = v10;

}

- (NSString)representableName
{
  unsigned int type;
  BOOL v4;
  int v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  type = self->_type;
  v4 = type > 0xA;
  v5 = (1 << type) & 0x611;
  v6 = v4 || v5 == 0;
  if (v6
    || (-[BRCStatInfo logicalName](self, "logicalName"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "br_isPackageRoot"),
        v7,
        !v8))
  {
    -[BRCStatInfo logicalName](self, "logicalName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCStatInfo logicalName](self, "logicalName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "br_representableDirectoryName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v10;
}

- (BOOL)iWorkShareable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  int v12;
  BOOL v14;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iworkShareableExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCStatInfo logicalName](self, "logicalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E8769030;
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  v11 = objc_msgSend(v4, "containsObject:", v10);
  if (v11)
  {
    v12 = -[BRCStatInfo type](self, "type");
    v14 = v12 == 8 || (v12 - 1) < 2;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)descriptionWithContext:(id)a3 origName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BRCItemID *parentID;
  void *v10;
  NSString *logicalName;
  void *v12;
  uint64_t v13;
  void *v14;
  NSString *aliasTarget;
  NSString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BRFieldCKInfo *ckInfo;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  int mode;
  char v29;
  char v30;
  NSData *xattrSignature;
  void *v32;
  NSString *trashPutBackPath;
  void *v34;
  _BYTE v36[5];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 64);
  parentID = self->_parentID;
  if (parentID)
  {
    +[BRCDumpContext stringFromItemID:context:](BRCDumpContext, "stringFromItemID:context:", parentID, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("p:%@ "), v10);

  }
  logicalName = self->_logicalName;
  if (logicalName)
  {
    -[NSString fp_obfuscatedFilename](logicalName, "fp_obfuscatedFilename");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v6, "highlightedString:type:", v12, 1);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    objc_msgSend(v8, "appendFormat:", CFSTR("n:\"%@\" "), v12);
    if (v7)
    {
      objc_msgSend(v7, "fp_obfuscatedFilename");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("(o:\"%@\") "), v14);

    }
  }
  aliasTarget = self->_aliasTarget;
  if (aliasTarget)
  {
    v16 = aliasTarget;
    if (v6)
    {
      objc_msgSend(v6, "highlightedString:type:", v16, 1);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (NSString *)v17;
    }
    objc_msgSend(v8, "appendFormat:", CFSTR("target:\"%@\" "), v16);

  }
  BRCPrettyPrintEnumWithContext(self->_type, (uint64_t)&brc_item_type_pretty_entries, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("%@ "), v18);

  if (self->_state)
  {
    BRCPrettyPrintEnumWithContext(self->_state, (uint64_t)&brc_item_state_pretty_entries, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@ "), v19);

  }
  ckInfo = self->_ckInfo;
  if (ckInfo)
  {
    -[BRFieldCKInfo etag](ckInfo, "etag");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("etag:%@ "), v21);

    -[BRFieldCKInfo etagBeforeCrossZoneMove](self->_ckInfo, "etagBeforeCrossZoneMove");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[BRFieldCKInfo etagBeforeCrossZoneMove](self->_ckInfo, "etagBeforeCrossZoneMove");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("prev-etag:%@ "), v23);

    }
    if (-[BRFieldCKInfo hasDeletionChangeToken](self->_ckInfo, "hasDeletionChangeToken"))
    {
      v24 = objc_alloc(MEMORY[0x1E0C95100]);
      -[BRFieldCKInfo deletionChangeToken](self->_ckInfo, "deletionChangeToken");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithData:", v25);

      objc_msgSend(v26, "descriptionWithContext:", v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("deletion-token:%@ "), v27);

    }
  }
  if (self->_birthtime)
    objc_msgSend(v8, "appendFormat:", CFSTR("bt:%lld "), self->_birthtime);
  if (self->_lastUsedTime)
    objc_msgSend(v8, "appendFormat:", CFSTR("lu:%lld "), self->_lastUsedTime);
  if (self->_favoriteRank)
    objc_msgSend(v8, "appendFormat:", CFSTR("fa:%lld "), self->_favoriteRank);
  v36[0] = 114;
  mode = self->_mode;
  if ((mode & 1) != 0)
    v29 = 119;
  else
    v29 = 45;
  v36[1] = v29;
  if ((mode & 2) != 0)
    v30 = 120;
  else
    v30 = 45;
  v36[2] = v30;
  v36[3] = (mode << 29 >> 31) & 0x4C;
  v36[4] = 0;
  objc_msgSend(v8, "appendFormat:", CFSTR("m:%s "), v36);
  if (self->_hiddenExt)
    objc_msgSend(v8, "appendString:", CFSTR("hidden-ext "));
  xattrSignature = self->_xattrSignature;
  if (xattrSignature)
  {
    -[NSData brc_hexadecimalString](xattrSignature, "brc_hexadecimalString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("ea:%@ "), v32);

  }
  if (self->_finderTags)
    objc_msgSend(v8, "appendString:", CFSTR("has-finder-tags "));
  trashPutBackPath = self->_trashPutBackPath;
  if (trashPutBackPath || self->_trashPutBackParentID)
  {
    -[NSString fp_obfuscatedPath](trashPutBackPath, "fp_obfuscatedPath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("trash-put-back{%@, %@} "), v34, self->_trashPutBackParentID);

  }
  if (self->_creatorRowID)
    objc_msgSend(v8, "appendFormat:", CFSTR("creator:%@ "), self->_creatorRowID);
  objc_msgSend(v8, "deleteCharactersInRange:", objc_msgSend(v8, "length") - 1, 1);

  return v8;
}

- (id)description
{
  return -[BRCStatInfo descriptionWithContext:origName:](self, "descriptionWithContext:origName:", 0, 0);
}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4;
  id v6;
  BRCStatInfo *v7;
  uint64_t v8;
  BRFieldCKInfo *ckInfo;
  char v10;
  unsigned int type;
  BOOL v12;
  int v13;
  uint64_t v15;
  BRCItemID *parentID;
  uint64_t v17;
  NSString *logicalName;
  NSString *v19;
  uint64_t v20;
  NSData *finderTags;
  uint64_t v22;
  NSData *xattrSignature;
  uint64_t v24;
  NSString *trashPutBackPath;
  uint64_t v26;
  BRCItemID *trashPutBackParentID;
  uint64_t v28;
  NSString *aliasTarget;
  uint64_t v30;
  BRCUserRowID *creatorRowID;
  objc_super v33;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BRCStatInfo;
  v7 = -[BRCStatInfo init](&v33, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "objectOfClass:atIndex:", objc_opt_class(), v4);
    v8 = objc_claimAutoreleasedReturnValue();
    ckInfo = v7->_ckInfo;
    v7->_ckInfo = (BRFieldCKInfo *)v8;

    v7->_state = objc_msgSend(v6, "intAtIndex:", (v4 + 1));
    v7->_type = objc_msgSend(v6, "intAtIndex:", (v4 + 2));
    v10 = objc_msgSend(v6, "intAtIndex:", (v4 + 3));
    v7->_mode = v10;
    type = v7->_type;
    v12 = type > 0xA;
    v13 = (1 << type) & 0x611;
    if (!v12 && v13 != 0)
      v7->_mode = v10 & 0xFD;
    v7->_birthtime = objc_msgSend(v6, "longLongAtIndex:", (v4 + 4));
    v7->_lastUsedTime = objc_msgSend(v6, "longLongAtIndex:", (v4 + 5));
    v7->_favoriteRank = objc_msgSend(v6, "longLongAtIndex:", (v4 + 6));
    objc_msgSend(v6, "objectOfClass:atIndex:", objc_opt_class(), (v4 + 7));
    v15 = objc_claimAutoreleasedReturnValue();
    parentID = v7->_parentID;
    v7->_parentID = (BRCItemID *)v15;

    objc_msgSend(v6, "stringAtIndex:", (v4 + 8));
    v17 = objc_claimAutoreleasedReturnValue();
    logicalName = v7->_logicalName;
    v7->_logicalName = (NSString *)v17;

    if (!-[NSString length](v7->_logicalName, "length"))
    {
      v19 = v7->_logicalName;
      v7->_logicalName = 0;

    }
    v7->_hiddenExt = objc_msgSend(v6, "BOOLAtIndex:", (v4 + 9));
    objc_msgSend(v6, "dataAtIndex:", (v4 + 10));
    v20 = objc_claimAutoreleasedReturnValue();
    finderTags = v7->_finderTags;
    v7->_finderTags = (NSData *)v20;

    objc_msgSend(v6, "dataAtIndex:", (v4 + 11));
    v22 = objc_claimAutoreleasedReturnValue();
    xattrSignature = v7->_xattrSignature;
    v7->_xattrSignature = (NSData *)v22;

    objc_msgSend(v6, "stringAtIndex:", (v4 + 12));
    v24 = objc_claimAutoreleasedReturnValue();
    trashPutBackPath = v7->_trashPutBackPath;
    v7->_trashPutBackPath = (NSString *)v24;

    objc_msgSend(v6, "objectOfClass:atIndex:", objc_opt_class(), (v4 + 13));
    v26 = objc_claimAutoreleasedReturnValue();
    trashPutBackParentID = v7->_trashPutBackParentID;
    v7->_trashPutBackParentID = (BRCItemID *)v26;

    objc_msgSend(v6, "stringAtIndex:", (v4 + 14));
    v28 = objc_claimAutoreleasedReturnValue();
    aliasTarget = v7->_aliasTarget;
    v7->_aliasTarget = (NSString *)v28;

    objc_msgSend(v6, "numberAtIndex:", (v4 + 15));
    v30 = objc_claimAutoreleasedReturnValue();
    creatorRowID = v7->_creatorRowID;
    v7->_creatorRowID = (BRCUserRowID *)v30;

  }
  return v7;
}

- (BRCStatInfo)initWithStatInfo:(id)a3
{
  id v4;
  BRCStatInfo *v5;
  uint64_t v6;
  BRFieldCKInfo *ckInfo;
  uint64_t v8;
  BRCItemID *parentID;
  uint64_t v10;
  NSString *logicalName;
  uint64_t v12;
  NSString *aliasTarget;
  uint64_t v14;
  NSData *finderTags;
  uint64_t v16;
  NSData *xattrSignature;
  uint64_t v18;
  NSString *trashPutBackPath;
  uint64_t v20;
  BRCItemID *trashPutBackParentID;
  uint64_t v22;
  BRCUserRowID *creatorRowID;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BRCStatInfo;
  v5 = -[BRCStatInfo init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(*((id *)v4 + 1), "copy");
    ckInfo = v5->_ckInfo;
    v5->_ckInfo = (BRFieldCKInfo *)v6;

    v5->_state = *((_BYTE *)v4 + 24);
    v5->_type = *((_BYTE *)v4 + 25);
    v5->_mode = *((_BYTE *)v4 + 26);
    v5->_birthtime = *((_QWORD *)v4 + 4);
    v5->_lastUsedTime = *((_QWORD *)v4 + 5);
    v5->_favoriteRank = *((_QWORD *)v4 + 6);
    v8 = objc_msgSend(*((id *)v4 + 2), "copy");
    parentID = v5->_parentID;
    v5->_parentID = (BRCItemID *)v8;

    v10 = objc_msgSend(*((id *)v4 + 7), "copy");
    logicalName = v5->_logicalName;
    v5->_logicalName = (NSString *)v10;

    v12 = objc_msgSend(*((id *)v4 + 8), "copy");
    aliasTarget = v5->_aliasTarget;
    v5->_aliasTarget = (NSString *)v12;

    v14 = objc_msgSend(*((id *)v4 + 12), "copy");
    finderTags = v5->_finderTags;
    v5->_finderTags = (NSData *)v14;

    v5->_hiddenExt = *((_BYTE *)v4 + 72);
    v16 = objc_msgSend(*((id *)v4 + 10), "copy");
    xattrSignature = v5->_xattrSignature;
    v5->_xattrSignature = (NSData *)v16;

    v18 = objc_msgSend(*((id *)v4 + 13), "copy");
    trashPutBackPath = v5->_trashPutBackPath;
    v5->_trashPutBackPath = (NSString *)v18;

    v20 = objc_msgSend(*((id *)v4 + 14), "copy");
    trashPutBackParentID = v5->_trashPutBackParentID;
    v5->_trashPutBackParentID = (BRCItemID *)v20;

    v22 = objc_msgSend(*((id *)v4 + 15), "copy");
    creatorRowID = v5->_creatorRowID;
    v5->_creatorRowID = (BRCUserRowID *)v22;

  }
  return v5;
}

- (BOOL)checkStateWithItemID:(id)a3 logToFile:(__sFILE *)a4
{
  unsigned int state;

  state = self->_state;
  if (state >= 2)
    fprintf(a4, "item %s has invalid state: %d\n", (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), self->_state);
  return state < 2;
}

- (BOOL)check:(id)a3 logToFile:(__sFILE *)a4
{
  id v6;
  BOOL v7;
  BOOL v8;

  v6 = a3;
  v7 = -[BRCStatInfo checkStateWithItemID:logToFile:](self, "checkStateWithItemID:logToFile:", v6, a4);
  if (self->_type >= 0xBu)
  {
    fprintf(a4, "item %s has invalid type: %d\n", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), self->_type);
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }
  if (self->_mode >= 4u)
  {
    fprintf(a4, "item %s has invalid mode: 0%0x\n", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), self->_mode);
    v8 = 0;
  }
  if (!self->_parentID)
  {
    fprintf(a4, "item %s has an invalid parent id\n", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithStatInfo:", self);
}

- (unint64_t)diffAgainst:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  BRFieldCKInfo *v7;
  BRFieldCKInfo *v8;
  BRFieldCKInfo *v9;
  uint64_t v10;
  void *v11;
  BRFieldCKInfo *v12;
  BRFieldCKInfo *v13;
  BOOL v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  BRCItemID *v18;
  BRCItemID *v19;
  BRCItemID *v20;
  BOOL v21;
  void *v22;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  char v26;
  void *v27;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  char v31;
  void *v32;
  NSData *v33;
  NSData *v34;
  NSData *v35;
  char v36;
  void *v37;
  BRCItemID *v38;
  BRCItemID *v39;
  BRCItemID *v40;
  BOOL v41;
  void *v42;
  NSString *v43;
  NSString *v44;
  NSString *v45;
  char v46;
  void *v47;
  NSData *v48;
  NSData *v49;
  NSData *v50;
  char v51;
  void *v53;
  NSObject *v54;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    brc_bread_crumbs();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
      -[BRCStatInfo diffAgainst:].cold.1();

    v16 = 0x7FFFLL;
    goto LABEL_89;
  }
  v6 = (void *)v4[1];
  v7 = self->_ckInfo;
  v8 = v6;
  if (v7 == v8)
  {

    v10 = 0;
  }
  else
  {
    v9 = v8;
    if (!v8)
      goto LABEL_11;
    v10 = -[BRFieldCKInfo isEqual:](v7, "isEqual:", v8) ^ 1;

    if ((v10 & 1) != 0)
      goto LABEL_14;
  }
  v11 = (void *)v5[15];
  v7 = self->_creatorRowID;
  v12 = v11;
  if (v7 == v12)
  {

    goto LABEL_14;
  }
  v13 = v12;
  if (v12)
  {
    v14 = -[BRFieldCKInfo isEqual:](v7, "isEqual:", v12);

    if (v14)
      goto LABEL_14;
    goto LABEL_12;
  }
LABEL_11:

LABEL_12:
  v10 = 1;
LABEL_14:
  if ((self->_state != 1) != (*((_BYTE *)v5 + 24) == 1))
    v15 = v10;
  else
    v15 = v10 | 0xA;
  if (self->_mode != *((unsigned __int8 *)v5 + 26))
    v15 |= 4uLL;
  if (self->_birthtime != v5[4])
    v15 |= 0x10uLL;
  if (self->_lastUsedTime != v5[5])
    v15 |= 0x800uLL;
  if (self->_favoriteRank == v5[6])
    v16 = v15;
  else
    v16 = v15 | 0x1000;
  if ((v16 & 0x20) != 0)
    goto LABEL_32;
  v17 = (void *)v5[2];
  v18 = self->_parentID;
  v19 = v17;
  if (v18 == v19)
  {

    goto LABEL_32;
  }
  v20 = v19;
  if (!v19)
  {

    goto LABEL_39;
  }
  v21 = -[BRCItemID isEqual:](v18, "isEqual:", v19);

  if (v21)
  {
LABEL_32:
    if ((v16 & 0x40) != 0)
      goto LABEL_43;
LABEL_33:
    v22 = (void *)v5[7];
    v23 = self->_logicalName;
    v24 = v22;
    if (v23 == v24)
    {

      goto LABEL_43;
    }
    v25 = v24;
    if (v24)
    {
      v26 = -[NSString isEqual:](v23, "isEqual:", v24);

      if ((v26 & 1) != 0)
        goto LABEL_43;
    }
    else
    {

    }
    v16 |= 0x40uLL;
    goto LABEL_43;
  }
LABEL_39:
  v16 |= 0x20uLL;
  if ((v16 & 0x40) == 0)
    goto LABEL_33;
LABEL_43:
  if ((v16 & 0x40) == 0)
  {
    v27 = (void *)v5[8];
    v28 = self->_aliasTarget;
    v29 = v27;
    if (v28 == v29)
    {

    }
    else
    {
      v30 = v29;
      if (!v29)
      {

        goto LABEL_65;
      }
      v31 = -[NSString isEqual:](v28, "isEqual:", v29);

      if ((v31 & 1) == 0)
      {
LABEL_65:
        v16 |= 0x40uLL;
        if ((v16 & 0x80) != 0)
          goto LABEL_52;
        goto LABEL_50;
      }
    }
  }
  if ((v16 & 0x80) != 0)
    goto LABEL_52;
LABEL_50:
  if (self->_hiddenExt != *((unsigned __int8 *)v5 + 72))
    v16 |= 0x80uLL;
LABEL_52:
  if ((v16 & 0x100) != 0)
    goto LABEL_58;
  v32 = (void *)v5[10];
  v33 = self->_xattrSignature;
  v34 = v32;
  if (v33 == v34)
  {

    goto LABEL_58;
  }
  v35 = v34;
  if (!v34)
  {

    goto LABEL_68;
  }
  v36 = -[NSData isEqual:](v33, "isEqual:", v34);

  if ((v36 & 1) != 0)
  {
LABEL_58:
    if ((v16 & 0x400) != 0)
      goto LABEL_72;
LABEL_59:
    v37 = (void *)v5[14];
    v38 = self->_trashPutBackParentID;
    v39 = v37;
    if (v38 == v39)
    {

      goto LABEL_72;
    }
    v40 = v39;
    if (v39)
    {
      v41 = -[BRCItemID isEqual:](v38, "isEqual:", v39);

      if (v41)
        goto LABEL_72;
    }
    else
    {

    }
    v16 |= 0x400uLL;
    goto LABEL_72;
  }
LABEL_68:
  v16 |= 0x100uLL;
  if ((v16 & 0x400) == 0)
    goto LABEL_59;
LABEL_72:
  if ((v16 & 0x400) != 0)
    goto LABEL_78;
  v42 = (void *)v5[13];
  v43 = self->_trashPutBackPath;
  v44 = v42;
  if (v43 == v44)
  {

    goto LABEL_78;
  }
  v45 = v44;
  if (!v44)
  {

    goto LABEL_85;
  }
  v46 = -[NSString isEqual:](v43, "isEqual:", v44);

  if ((v46 & 1) != 0)
  {
LABEL_78:
    if ((v16 & 0x200) != 0)
      goto LABEL_89;
    goto LABEL_79;
  }
LABEL_85:
  v16 |= 0x400uLL;
  if ((v16 & 0x200) != 0)
    goto LABEL_89;
LABEL_79:
  v47 = (void *)v5[12];
  v48 = self->_finderTags;
  v49 = v47;
  if (v48 == v49)
  {

  }
  else
  {
    v50 = v49;
    if (v49)
    {
      v51 = -[NSData isEqual:](v48, "isEqual:", v49);

      if ((v51 & 1) != 0)
        goto LABEL_89;
    }
    else
    {

    }
    v16 |= 0x200uLL;
  }
LABEL_89:

  return v16;
}

- (BOOL)isExecutable
{
  return (self->_mode >> 1) & 1;
}

- (BOOL)isWritable
{
  return self->_mode & 1;
}

- (id)displayName
{
  void *v3;
  void *v4;

  -[BRCStatInfo logicalName](self, "logicalName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_displayFilenameWithExtensionHidden:", -[BRCStatInfo isHiddenExt](self, "isHiddenExt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEtagEqual:(id)a3
{
  void *v4;
  int v5;
  char v6;
  void *v7;
  void *v8;

  if (self == a3)
    return 1;
  objc_msgSend(a3, "ckInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasEtag");
  if (v5 == -[BRFieldCKInfo hasEtag](self->_ckInfo, "hasEtag"))
  {
    objc_msgSend(v4, "etag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRFieldCKInfo etag](self->_ckInfo, "etag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setCreatorRowID:(id)a3
{
  id v4;
  BRCUserRowID *creatorRowID;
  void *v6;
  NSObject *v7;

  v4 = a3;
  if (objc_msgSend(v4, "longLongValue") < 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCStatInfo setCreatorRowID:].cold.1();

  }
  creatorRowID = self->_creatorRowID;
  self->_creatorRowID = (BRCUserRowID *)v4;

}

- (id)lazyXattrWithStageRegistry:(id)a3
{
  id v4;
  void *v5;
  NSData *lazyXattr;
  NSData *v7;
  NSData *v8;
  NSData *v9;
  NSData *v10;
  void *v11;
  NSObject *v12;
  NSData *xattrSignature;
  id v15;
  uint8_t buf[4];
  NSData *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_xattrSignature)
  {
    lazyXattr = self->_lazyXattr;
    if (lazyXattr)
    {
      v7 = lazyXattr;
    }
    else
    {
      v15 = 0;
      objc_msgSend(v4, "loadXattrBlobForSignature:error:");
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      v9 = self->_lazyXattr;
      self->_lazyXattr = v8;

      v10 = self->_lazyXattr;
      if (!v10)
      {
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          xattrSignature = self->_xattrSignature;
          *(_DWORD *)buf = 138412802;
          v17 = xattrSignature;
          v18 = 2112;
          v19 = v15;
          v20 = 2112;
          v21 = v11;
          _os_log_fault_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to load xattr with signature %@ - %@%@", buf, 0x20u);
        }

        v10 = self->_lazyXattr;
      }
      v7 = v10;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BRFieldCKInfo)ckInfo
{
  return self->_ckInfo;
}

- (void)setCkInfo:(id)a3
{
  objc_storeStrong((id *)&self->_ckInfo, a3);
}

- (char)state
{
  return self->_state;
}

- (void)setState:(char)a3
{
  self->_state = a3;
}

- (char)type
{
  return self->_type;
}

- (void)setType:(char)a3
{
  self->_type = a3;
}

- (char)mode
{
  return self->_mode;
}

- (void)setMode:(char)a3
{
  self->_mode = a3;
}

- (int64_t)birthtime
{
  return self->_birthtime;
}

- (void)setBirthtime:(int64_t)a3
{
  self->_birthtime = a3;
}

- (int64_t)lastUsedTime
{
  return self->_lastUsedTime;
}

- (void)setLastUsedTime:(int64_t)a3
{
  self->_lastUsedTime = a3;
}

- (int64_t)favoriteRank
{
  return self->_favoriteRank;
}

- (void)setFavoriteRank:(int64_t)a3
{
  self->_favoriteRank = a3;
}

- (BRCItemID)parentID
{
  return self->_parentID;
}

- (void)setParentID:(id)a3
{
  objc_storeStrong((id *)&self->_parentID, a3);
}

- (BOOL)isHiddenExt
{
  return self->_hiddenExt;
}

- (void)setHiddenExt:(BOOL)a3
{
  self->_hiddenExt = a3;
}

- (NSData)xattrSignature
{
  return self->_xattrSignature;
}

- (void)setXattrSignature:(id)a3
{
  objc_storeStrong((id *)&self->_xattrSignature, a3);
}

- (NSData)finderTags
{
  return self->_finderTags;
}

- (void)setFinderTags:(id)a3
{
  objc_storeStrong((id *)&self->_finderTags, a3);
}

- (NSString)logicalName
{
  return self->_logicalName;
}

- (void)setLogicalName:(id)a3
{
  objc_storeStrong((id *)&self->_logicalName, a3);
}

- (NSString)aliasTarget
{
  return self->_aliasTarget;
}

- (NSString)trashPutBackPath
{
  return self->_trashPutBackPath;
}

- (void)setTrashPutBackPath:(id)a3
{
  objc_storeStrong((id *)&self->_trashPutBackPath, a3);
}

- (BRCItemID)trashPutBackParentID
{
  return self->_trashPutBackParentID;
}

- (void)setTrashPutBackParentID:(id)a3
{
  objc_storeStrong((id *)&self->_trashPutBackParentID, a3);
}

- (BRCUserRowID)creatorRowID
{
  return self->_creatorRowID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creatorRowID, 0);
  objc_storeStrong((id *)&self->_trashPutBackParentID, 0);
  objc_storeStrong((id *)&self->_trashPutBackPath, 0);
  objc_storeStrong((id *)&self->_finderTags, 0);
  objc_storeStrong((id *)&self->_lazyXattr, 0);
  objc_storeStrong((id *)&self->_xattrSignature, 0);
  objc_storeStrong((id *)&self->_aliasTarget, 0);
  objc_storeStrong((id *)&self->_logicalName, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_ckInfo, 0);
}

- (void)_aliasTargetItemID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _type == BRC_ITEM_TYPE_ALIAS%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateAliasTarget:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: containerID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)diffAgainst:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Stat shouldn't be nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setCreatorRowID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: creatorRowIDLongLongValue >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
