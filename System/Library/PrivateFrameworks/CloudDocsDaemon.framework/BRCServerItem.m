@implementation BRCServerItem

- (id)sideCarInfo
{
  BRCSideCarInfo *v3;
  void *v4;

  v3 = objc_alloc_init(BRCSideCarInfo);
  -[BRCSideCarInfo setFavoriteRank:](v3, "setFavoriteRank:", -[BRCStatInfo favoriteRank](self->_st, "favoriteRank"));
  -[BRCSideCarInfo setLastUsedTime:](v3, "setLastUsedTime:", -[BRCStatInfo lastUsedTime](self->_st, "lastUsedTime"));
  -[BRCStatInfo finderTags](self->_st, "finderTags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSideCarInfo setFinderTags:](v3, "setFinderTags:", v4);

  -[BRCSideCarInfo setCkInfo:](v3, "setCkInfo:", self->_sideCarCKInfo);
  return v3;
}

- (BOOL)isLive
{
  return -[BRCStatInfo state](self->_st, "state") == 0;
}

- (BOOL)isDead
{
  return -[BRCStatInfo state](self->_st, "state") == 1;
}

- (BOOL)isBRAlias
{
  return -[BRCStatInfo type](self->_st, "type") == 3;
}

- (BOOL)isDirectory
{
  unsigned int v2;

  v2 = -[BRCStatInfo type](self->_st, "type");
  return (v2 < 0xB) & (0x611u >> v2);
}

- (BOOL)isDirectoryFault
{
  return -[BRCStatInfo type](self->_st, "type") == 9;
}

- (BOOL)isDocument
{
  int v3;

  v3 = -[BRCStatInfo type](self->_st, "type");
  if (v3 != 1)
    LOBYTE(v3) = -[BRCStatInfo type](self->_st, "type") == 6;
  return v3;
}

- (BOOL)isFSRoot
{
  return -[BRCStatInfo type](self->_st, "type") == 4;
}

- (BOOL)isZoneRoot
{
  return 0;
}

- (BOOL)isSymLink
{
  return -[BRCStatInfo type](self->_st, "type") == 5;
}

- (BOOL)isFinderBookmark
{
  return -[BRCStatInfo type](self->_st, "type") == 6;
}

- (BOOL)isPackage
{
  return -[BRCVersion isPackage](self->_latestVersion, "isPackage");
}

- (BOOL)isOwnedByMe
{
  return !-[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone");
}

- (BOOL)isShared
{
  return (self->_sharingOptions & 0x48) != 0;
}

- (BOOL)isSharedToMe
{
  return -[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone");
}

- (BOOL)isSharedByMe
{
  _BOOL4 v3;

  v3 = -[BRCServerItem isShared](self, "isShared");
  if (v3)
    LOBYTE(v3) = !-[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone");
  return v3;
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  _BOOL4 v3;

  v3 = -[BRCServerItem isOwnedByMe](self, "isOwnedByMe");
  if (v3)
    return (LOBYTE(self->_sharingOptions) >> 2) & 1;
  return v3;
}

- (BOOL)isSharedToMeTopLevelItem
{
  void *v2;
  char v3;

  -[BRCServerItem parentItemIDOnServer](self, "parentItemIDOnServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSharedZoneRoot");

  return v3;
}

- (BOOL)isSharedToMeChildItem
{
  _BOOL4 v3;

  v3 = -[BRCServerItem isSharedToMe](self, "isSharedToMe");
  if (v3)
    LOBYTE(v3) = !-[BRCServerItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem");
  return v3;
}

- (BOOL)isTopLevelSharedItem
{
  return (self->_sharingOptions & 4) != 0 && -[BRCServerItem isShared](self, "isShared");
}

- (BOOL)isChildSharedItem
{
  return (self->_sharingOptions & 4) == 0 && -[BRCServerItem isShared](self, "isShared");
}

- (BRCItemGlobalID)itemGlobalID
{
  BRCItemGlobalID *v3;
  void *v4;
  BRCItemGlobalID *v5;

  v3 = [BRCItemGlobalID alloc];
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v3, "initWithZoneRowID:itemID:", v4, self->_itemID);

  return v5;
}

- (BRCSharedServerItem)asSharedItem
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCServerItem asSharedItem].cold.1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (BRCServerItem)initWithServerItem:(id)a3
{
  id v4;
  BRCServerItem *v5;
  BRCServerItem *v6;
  uint64_t v7;
  BRCServerStatInfo *st;
  uint64_t v9;
  BRCVersion *latestVersion;
  uint64_t v11;
  BRServerMetrics *serverMetrics;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCServerItem;
  v5 = -[BRCServerItem init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_itemID, *((id *)v4 + 9));
    objc_storeStrong((id *)&v6->_ownerKey, *((id *)v4 + 8));
    objc_storeStrong((id *)&v6->_sideCarCKInfo, *((id *)v4 + 5));
    v7 = objc_msgSend(*((id *)v4 + 12), "copy");
    st = v6->_st;
    v6->_st = (BRCServerStatInfo *)v7;

    v9 = objc_msgSend(*((id *)v4 + 13), "copy");
    latestVersion = v6->_latestVersion;
    v6->_latestVersion = (BRCVersion *)v9;

    v11 = objc_msgSend(*((id *)v4 + 14), "copy");
    serverMetrics = v6->_serverMetrics;
    v6->_serverMetrics = (BRServerMetrics *)v11;

    objc_storeStrong((id *)&v6->_serverZone, *((id *)v4 + 15));
    objc_storeStrong((id *)&v6->_clientZone, *((id *)v4 + 16));
    v6->_session = (BRCAccountSession *)*((_QWORD *)v4 + 1);
    v6->_sharingOptions = *((_QWORD *)v4 + 3);
    v6->_pcsChainState = *((_DWORD *)v4 + 13);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithServerItem:", self);
}

- (id)initFromPQLResultSet:(id)a3 serverZone:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  BRCServerItem *v9;
  uint64_t v10;
  BRCPQLConnection *db;
  uint64_t v12;
  BRCClientZone *clientZone;
  uint64_t v14;
  NSString *originalName;
  uint64_t v16;
  BRCItemID *itemID;
  uint64_t v18;
  BRCUserRowID *ownerKey;
  uint64_t v20;
  BRFieldCKInfo *sideCarCKInfo;
  BRCServerStatInfo *v22;
  BRCServerStatInfo *st;
  BRCVersion *v24;
  BRCVersion *latestVersion;
  uint64_t v26;
  NSString *symlinkTarget;
  uint64_t v28;
  BRServerMetrics *serverMetrics;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v39;

  v7 = a3;
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)BRCServerItem;
  v9 = -[BRCServerItem init](&v39, sel_init);
  if (v9)
  {
    v9->_session = (BRCAccountSession *)(id)objc_msgSend(v8, "session");
    objc_msgSend(v7, "db");
    v10 = objc_claimAutoreleasedReturnValue();
    db = v9->_db;
    v9->_db = (BRCPQLConnection *)v10;

    objc_storeStrong((id *)&v9->_serverZone, a4);
    -[BRCServerZone clientZone](v9->_serverZone, "clientZone");
    v12 = objc_claimAutoreleasedReturnValue();
    clientZone = v9->_clientZone;
    v9->_clientZone = (BRCClientZone *)v12;

    v9->_rank = objc_msgSend(v7, "longLongAtIndex:", 1);
    objc_msgSend(v7, "stringAtIndex:", 2);
    v14 = objc_claimAutoreleasedReturnValue();
    originalName = v9->_originalName;
    v9->_originalName = (NSString *)v14;

    v9->_pcsChainState = objc_msgSend(v7, "intAtIndex:", 3);
    objc_msgSend(v7, "objectOfClass:atIndex:", objc_opt_class(), 4);
    v16 = objc_claimAutoreleasedReturnValue();
    itemID = v9->_itemID;
    v9->_itemID = (BRCItemID *)v16;

    objc_msgSend(v7, "numberAtIndex:", 5);
    v18 = objc_claimAutoreleasedReturnValue();
    ownerKey = v9->_ownerKey;
    v9->_ownerKey = (BRCUserRowID *)v18;

    v9->_sharingOptions = objc_msgSend(v7, "integerAtIndex:", 6);
    objc_msgSend(v7, "objectOfClass:atIndex:", objc_opt_class(), 7);
    v20 = objc_claimAutoreleasedReturnValue();
    sideCarCKInfo = v9->_sideCarCKInfo;
    v9->_sideCarCKInfo = (BRFieldCKInfo *)v20;

    v22 = -[BRCStatInfo initFromResultSet:pos:]([BRCServerStatInfo alloc], "initFromResultSet:pos:", v7, 8);
    st = v9->_st;
    v9->_st = v22;

    if (-[BRCServerZone isSharedZone](v9->_serverZone, "isSharedZone")
      && (v9->_sharingOptions & 0x48) == 0
      && -[BRCStatInfo state](v9->_st, "state") != 1)
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        -[BRCServerItem initFromPQLResultSet:serverZone:error:].cold.1((uint64_t)v31, v32, v33, v34, v35, v36, v37, v38);

    }
    if (-[BRCServerItem isDocument](v9, "isDocument"))
    {
      v24 = -[BRCVersion initFromResultSet:pos:]([BRCVersion alloc], "initFromResultSet:pos:", v7, 24);
      latestVersion = v9->_latestVersion;
      v9->_latestVersion = v24;

      if (-[BRCStatInfo isExecutable](v9->_st, "isExecutable")
        && -[BRCVersion isPackage](v9->_latestVersion, "isPackage"))
      {
        v9->_st->super._mode &= ~2u;
      }
    }
    else if (-[BRCServerItem isDirectory](v9, "isDirectory"))
    {
      v9->_directoryMtime = objc_msgSend(v7, "longLongAtIndex:", 26);
    }
    else if (-[BRCServerItem isSymLink](v9, "isSymLink"))
    {
      objc_msgSend(v7, "objectOfClass:atIndex:", objc_opt_class(), 24);
      v26 = objc_claimAutoreleasedReturnValue();
      symlinkTarget = v9->_symlinkTarget;
      v9->_symlinkTarget = (NSString *)v26;

    }
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D10EE0]), "initFromResultSet:pos:", v7, 36);
    serverMetrics = v9->_serverMetrics;
    v9->_serverMetrics = (BRServerMetrics *)v28;

  }
  return v9;
}

- (BOOL)validateLoggingToFile:(__sFILE *)a3
{
  const char *v5;
  BRCVersion *latestVersion;

  LODWORD(v5) = -[BRCStatInfo check:logToFile:](self->_st, "check:logToFile:", self->_itemID, a3);
  latestVersion = self->_latestVersion;
  if (latestVersion)
  {
    if ((_DWORD)v5)
      LOBYTE(v5) = -[BRCVersion check:logToFile:](latestVersion, "check:logToFile:", self->_itemID, a3);
    if (-[BRCServerItem isDirectory](self, "isDirectory"))
    {
      v5 = "item %s is a directory with a version\n";
LABEL_9:
      fprintf(a3, v5, -[BRCItemID UTF8String](self->_itemID, "UTF8String"));
      LOBYTE(v5) = 0;
    }
  }
  else if (-[BRCServerItem isDocument](self, "isDocument") && !-[BRCServerItem isDead](self, "isDead"))
  {
    v5 = "item %s is a live document without a version\n";
    goto LABEL_9;
  }
  return (char)v5;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  _QWORD *v4;
  void *v5;
  BRCItemID *v6;
  BRCItemID *v7;
  BRCItemID *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  BRCUserRowID *v12;
  BRCUserRowID *v13;
  BRCUserRowID *v14;
  char v15;
  void *v16;
  BRFieldCKInfo *v17;
  BRFieldCKInfo *v18;
  BRFieldCKInfo *v19;
  BOOL v20;
  unint64_t v21;

  v4 = a3;
  v5 = (void *)v4[9];
  v6 = self->_itemID;
  v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_6;
  }
  v8 = v7;
  if (v7)
  {
    v9 = -[BRCItemID isEqual:](v6, "isEqual:", v7);

    if (!v9)
      goto LABEL_8;
LABEL_6:
    v10 = 0;
    goto LABEL_9;
  }

LABEL_8:
  v10 = 0x80000000;
LABEL_9:
  v11 = (void *)v4[8];
  v12 = self->_ownerKey;
  v13 = v11;
  if (v12 == v13)
  {

    goto LABEL_16;
  }
  v14 = v13;
  if (!v13)
  {

    goto LABEL_15;
  }
  v15 = -[BRCUserRowID isEqual:](v12, "isEqual:", v13);

  if ((v15 & 1) == 0)
LABEL_15:
    v10 |= 0x20000000uLL;
LABEL_16:
  if (self->_sharingOptions != v4[3])
    v10 |= 0x40000000uLL;
  v16 = (void *)v4[5];
  v17 = self->_sideCarCKInfo;
  v18 = v16;
  if (v17 == v18)
  {

  }
  else
  {
    v19 = v18;
    if (v18)
    {
      v20 = -[BRFieldCKInfo isEqual:](v17, "isEqual:", v18);

      if (v20)
        goto LABEL_25;
    }
    else
    {

    }
    v10 |= 0x100000000000000uLL;
  }
LABEL_25:
  v21 = -[BRCStatInfo diffAgainst:](self->_st, "diffAgainst:", v4[12]) | v10;
  if (-[BRCServerItem isDocument](self, "isDocument") && objc_msgSend(v4, "isDocument"))
    v21 |= -[BRCVersion diffAgainst:](self->_latestVersion, "diffAgainst:", v4[13]);

  return v21;
}

- (id)descriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  BRFieldCKInfo *sideCarCKInfo;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BRCVersion *latestVersion;
  void *v16;
  BRServerMetrics *serverMetrics;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  unsigned int v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  char v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 128);
  if (v4)
  {
    +[BRCDumpContext stringFromItemID:context:](BRCDumpContext, "stringFromItemID:context:", self->_itemID, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("i:%@ "), v6);
  }
  else
  {
    -[BRCClientZone mangledID](self->_clientZone, "mangledID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCItemID debugItemIDString](self->_itemID, "debugItemIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("i:%@:%@ "), v6, v7);

  }
  if (-[BRCUserRowID BOOLValue](self->_ownerKey, "BOOLValue"))
    objc_msgSend(v5, "appendFormat:", CFSTR("o:%@ "), self->_ownerKey);
  objc_msgSend(v5, "appendFormat:", CFSTR("rk:%lld "), self->_rank);
  v8 = self->_pcsChainState - 1;
  if (v8 <= 3)
    objc_msgSend(v5, "appendString:", off_1E87632D0[v8]);
  if (self->_directoryMtime)
    objc_msgSend(v5, "appendFormat:", CFSTR("mt:%lld "), self->_directoryMtime);
  sideCarCKInfo = self->_sideCarCKInfo;
  if (sideCarCKInfo)
  {
    -[BRFieldCKInfo etag](sideCarCKInfo, "etag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("ppm:%@ "), v10);

  }
  -[BRCStatInfo descriptionWithContext:origName:](self->_st, "descriptionWithContext:origName:", v4, self->_originalName);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("st{%@}"), v11);

  if (-[BRCServerItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    -[BRCServerItem asSharedItem](self, "asSharedItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aliasDerivedStructureForDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "descriptionWithContext:origName:", v4, self->_originalName);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" alias-st{%@}"), v14);

  }
  latestVersion = self->_latestVersion;
  if (latestVersion)
  {
    -[BRCVersion descriptionWithContext:](latestVersion, "descriptionWithContext:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" ct{%@}"), v16);

  }
  serverMetrics = self->_serverMetrics;
  if (serverMetrics)
  {
    -[BRServerMetrics description](serverMetrics, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" sm{%@}"), v18);

  }
  if (self->_sharingOptions)
  {
    BRCPrettyPrintBitmap();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" sharing-options:{%@}"), v19);

  }
  if (-[BRCServerItem isSymLink](self, "isSymLink"))
  {
    -[NSString fp_obfuscatedPath](self->_symlinkTarget, "fp_obfuscatedPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" target:%@"), v20);

  }
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "supportsEnhancedDrivePrivacy");

  if (v22)
  {
    if (-[BRCServerItem isDirectory](self, "isDirectory"))
    {
      v23 = -[BRCBasehashSaltInfo saltingState](self->_basehashSaltInfo, "saltingState");
      if (v23 > 3)
        v24 = CFSTR("no server item");
      else
        v24 = off_1E87632F0[v23];
      objc_msgSend(v5, "appendFormat:", CFSTR(" salt-st{%@}"), v24);
      -[BRCBasehashSaltInfo childBasehashSalt](self->_basehashSaltInfo, "childBasehashSalt");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "brc_generateBogusKey");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqualToData:", v26);

        if ((v27 & 1) != 0)
        {
          v28 = CFSTR("bogus-salt");
        }
        else
        {
          objc_msgSend(v25, "brc_truncatedSHA256");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "brc_hexadecimalString");
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v5, "appendFormat:", CFSTR(" child-valid{%@}"), v28);

      }
    }
    -[BRCBasehashSaltInfo basehashSaltValidation](self->_basehashSaltInfo, "basehashSaltValidation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "brc_hexadecimalString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR(" base-valid{%@}"), v32);

    }
  }

  return v5;
}

- (id)description
{
  return -[BRCServerItem descriptionWithContext:](self, "descriptionWithContext:", 0);
}

- (id)appLibraryForRootItem
{
  uint64_t *p_itemID;
  BRCAccountSession *session;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!-[BRCServerItem isFSRoot](self, "isFSRoot"))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCServerItem appLibraryForRootItem].cold.2((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

  }
  p_itemID = (uint64_t *)&self->_itemID;
  if (-[BRCItemID isNonDesktopRoot](self->_itemID, "isNonDesktopRoot")
    || objc_msgSend((id)*p_itemID, "isDocumentsFolder"))
  {
    session = self->_session;
    -[BRCItemID appLibraryRowID](self->_itemID, "appLibraryRowID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession appLibraryByRowID:](session, "appLibraryByRowID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCServerItem appLibraryForRootItem].cold.1(p_itemID, (uint64_t)v5, v7);

    v6 = 0;
  }

  return v6;
}

- (id)newLocalItemWithDBRowID:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id result;
  __objc2_class *v9;

  switch(self->_st->super._type)
  {
    case 0xFF:
    case 2:
    case 4:
    case 7:
    case 8:
    case 0xA:
      brc_bread_crumbs();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BRCServerItem newLocalItemWithDBRowID:].cold.2();

      goto LABEL_5;
    case 0:
    case 9:
      v9 = BRCDirectoryItem;
      goto LABEL_13;
    case 1:
      v9 = BRCDocumentItem;
      goto LABEL_13;
    case 3:
      v9 = BRCAliasItem;
      goto LABEL_13;
    case 5:
      v9 = BRCSymlinkItem;
      goto LABEL_13;
    case 6:
      v9 = BRCFinderBookmarkItem;
LABEL_13:
      result = (id)objc_msgSend([v9 alloc], "_initWithServerItem:dbRowID:", self, a3);
      break;
    default:
LABEL_5:
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BRCServerItem newLocalItemWithDBRowID:].cold.1();

      result = 0;
      break;
  }
  return result;
}

- (id)newLocalItemWithServerZone:(id)a3 dbRowID:(unint64_t)a4
{
  return -[BRCServerItem newLocalItemWithDBRowID:](self, "newLocalItemWithDBRowID:", a4);
}

- (unsigned)pcsChainState
{
  return self->_pcsChainState;
}

- (id)parentItemOnFS
{
  BRCServerZone *serverZone;
  void *v4;
  void *v5;

  serverZone = self->_serverZone;
  -[BRCStatInfo parentID](self->_st, "parentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCServerZone itemByItemID:db:](serverZone, "itemByItemID:db:", v4, self->_db);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)parentLocalItemOnFS
{
  void *v3;
  void *v4;
  void *v5;

  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo parentID](self->_st, "parentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemByItemID:db:", v4, self->_db);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)parentZoneOnFS
{
  return self->_serverZone;
}

- (id)parentItemIDOnFS
{
  return -[BRCStatInfo parentID](self->_st, "parentID");
}

- (id)parentItemIDOnServer
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  -[BRCServerItem itemID](self, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isDocumentsFolder") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[BRCServerItem clientZone](self, "clientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCloudDocsZone");

  if (!v5)
  {
LABEL_5:
    -[BRCStatInfo parentID](self->_st, "parentID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    return v8;
  }
  -[BRCServerItem clientZone](self, "clientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asPrivateClientZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)aliasTargetIsShared
{
  void *v2;
  char v3;

  -[BRCStatInfo _aliasTargetMangledID](self->_st, "_aliasTargetMangledID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShared");

  return v3;
}

- (id)aliasTargetClientZone
{
  BRCAccountSession *session;
  void *v3;
  void *v4;

  session = self->_session;
  -[BRCStatInfo _aliasTargetMangledID](self->_st, "_aliasTargetMangledID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession clientZoneByMangledID:](session, "clientZoneByMangledID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)aliasTargetAppLibrary
{
  BRCAccountSession *session;
  void *v3;
  void *v4;

  session = self->_session;
  -[BRCStatInfo _aliasTargetMangledID](self->_st, "_aliasTargetMangledID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession appLibraryByMangledID:](session, "appLibraryByMangledID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)aliasTargetItemID
{
  return -[BRCStatInfo _aliasTargetItemID](self->_st, "_aliasTargetItemID");
}

- (BOOL)canPathMatchMergeWithLocalItem:(id)a3
{
  BRCServerStatInfo *st;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  st = self->_st;
  v4 = a3;
  +[BRCItemID structureRecordPrefixForItemType:targetZoneShared:](BRCItemID, "structureRecordPrefixForItemType:targetZoneShared:", -[BRCStatInfo type](st, "type"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "st");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRCItemID structureRecordPrefixForItemType:targetZoneShared:](BRCItemID, "structureRecordPrefixForItemType:targetZoneShared:", objc_msgSend(v6, "type"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v7);
  return (char)v4;
}

- (BOOL)shouldBeGreedyForApply
{
  return 1;
}

- (void)overrideCKInfoIfNecessaryForOutOfBandSyncOpWithLocalItem:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "localDiffs") & 0x1000000000000000) != 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[BRCItemID debugItemIDString](self->_itemID, "debugItemIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "st");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ckInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCStatInfo ckInfo](self->_st, "ckInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413058;
      v17 = v12;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v5;
      _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ has an out of band sync ack -- using client truth ckinfo %@ rather than server info %@%@", (uint8_t *)&v16, 0x2Au);

    }
    objc_msgSend(v4, "st");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ckInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo setCkInfo:](self->_st, "setCkInfo:", v8);

    if (objc_msgSend(v4, "isDocument"))
    {
      objc_msgSend(v4, "asDocument");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ckInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCVersion setCkInfo:](self->_latestVersion, "setCkInfo:", v11);

    }
  }

}

- (BRCUserRowID)ownerKey
{
  return self->_ownerKey;
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (NSString)originalName
{
  return self->_originalName;
}

- (int64_t)rank
{
  return self->_rank;
}

- (BRCServerStatInfo)st
{
  return self->_st;
}

- (BRCVersion)latestVersion
{
  return self->_latestVersion;
}

- (BRServerMetrics)serverMetrics
{
  return self->_serverMetrics;
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (unint64_t)sharingOptions
{
  return self->_sharingOptions;
}

- (void)setSharingOptions:(unint64_t)a3
{
  self->_sharingOptions = a3;
}

- (NSString)symlinkTarget
{
  return self->_symlinkTarget;
}

- (int64_t)directoryMtime
{
  return self->_directoryMtime;
}

- (BRCBasehashSaltInfo)basehashSaltInfo
{
  return self->_basehashSaltInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basehashSaltInfo, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_serverMetrics, 0);
  objc_storeStrong((id *)&self->_latestVersion, 0);
  objc_storeStrong((id *)&self->_st, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_ownerKey, 0);
  objc_storeStrong((id *)&self->_symlinkTarget, 0);
  objc_storeStrong((id *)&self->_sideCarCKInfo, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)asSharedItem
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] UNREACHABLE: Called -asSharedItem on a private item%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initFromPQLResultSet:(uint64_t)a3 serverZone:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: !_serverZone.isSharedZone || (_sharingOptions & BRCSharingItemHasCKShareMask) != 0 || _st.state == BRC_ITEM_STATE_TOMBSTONE%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)appLibraryForRootItem
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: self.isFSRoot%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)newLocalItemWithDBRowID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_0(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: unknown item type: %d%@");
  OUTLINED_FUNCTION_2();
}

- (void)newLocalItemWithDBRowID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_0(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: unsupporter server item type: %d%@");
  OUTLINED_FUNCTION_2();
}

@end
