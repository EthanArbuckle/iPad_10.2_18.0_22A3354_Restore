@implementation BRCItemID

- (id)contentsRecordIDInZoneID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[BRCItemID itemIDString](self, "itemIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("documentContent/"), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v6, v4);
  return v7;
}

- (id)directoryStructureRecordIDInZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemID _directoryRecordNameWithSession:](self, "_directoryRecordNameWithSession:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(v4, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithRecordName:zoneID:", v6, v8);
  return v9;
}

- (id)documentStructureRecordIDInZoneID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[BRCItemID itemIDString](self, "itemIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("documentStructure/"), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v6, v4);
  return v7;
}

- (id)validatingDirectoryReferenceInZone:(id)a3
{
  return -[BRCItemID directoryReferenceInZone:action:](self, "directoryReferenceInZone:action:", a3, *MEMORY[0x1E0C94A40]);
}

- (id)pcsChainParentReferenceInZone:(id)a3
{
  return -[BRCItemID directoryReferenceInZone:action:](self, "directoryReferenceInZone:action:", a3, 0);
}

- (id)pcsChainDocumentStructureReferenceInZoneID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[BRCItemID itemIDString](self, "itemIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("documentStructure/"), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v6, v4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v7, 0);

  return v8;
}

+ (id)structureRecordPrefixForItemType:(char)a3 targetZoneShared:(BOOL)a4
{
  id result;
  int v5;
  void *v6;
  NSObject *v7;

  result = 0;
  switch(a3)
  {
    case -1:
      return result;
    case 0:
    case 4:
    case 9:
    case 10:
      result = CFSTR("directory/");
      break;
    case 1:
    case 2:
    case 8:
      result = CFSTR("documentStructure/");
      break;
    case 3:
      if (a4)
        result = CFSTR("shareAlias/");
      else
        result = CFSTR("alias/");
      break;
    case 5:
      result = CFSTR("symlink/");
      break;
    case 6:
    case 7:
      result = CFSTR("finderBookmark/");
      break;
    default:
      v5 = a3;
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        +[BRCItemID(CKConversions) structureRecordPrefixForItemType:targetZoneShared:].cold.1((uint64_t)v6, v5, v7);

      result = 0;
      break;
  }
  return result;
}

+ (id)shareAliasRecordIDFromTargetItemID:(id)a3 zone:(id)a4 hasDerivedShareAlias:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneRowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverZoneByRowID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a5)
  {
    objc_msgSend(v7, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ownerName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "derivedAliasItemIDWithOwnerName:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v15;
  }
  objc_msgSend(v9, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", 3, v8, objc_msgSend(v12, "isSharedZone"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)structureRecordIDForItemType:(char)a3 zone:(id)a4 aliasTargetZoneIsShared:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  if (!-[BRCItemID isDocumentsFolder](self, "isDocumentsFolder")
    && !-[BRCItemID isNonDesktopRoot](self, "isNonDesktopRoot")
    || !objc_msgSend(v8, "isPrivateZone"))
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemID appLibraryRowID](self, "appLibraryRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appLibraryByRowID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCItemID(CKConversions) structureRecordIDForItemType:zone:aliasTargetZoneIsShared:].cold.2();

    goto LABEL_8;
  }
LABEL_9:
  if (objc_msgSend(v11, "wasMovedToCloudDocs")
    && objc_msgSend(v8, "isPrivateZone")
    && (objc_msgSend(v11, "isCloudDocsAppLibrary") & 1) == 0)
  {
    if (-[BRCItemID isNonDesktopRoot](self, "isNonDesktopRoot"))
    {
      objc_msgSend(v11, "appLibraryID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("directory/appData_");
LABEL_16:
      -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (-[BRCItemID isDocumentsFolder](self, "isDocumentsFolder"))
    {
      objc_msgSend(v11, "appLibraryID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("directory/appDocuments_");
      goto LABEL_16;
    }
  }
  +[BRCItemID structureRecordPrefixForItemType:targetZoneShared:](BRCItemID, "structureRecordPrefixForItemType:targetZoneShared:", v6, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCItemID(CKConversions) structureRecordIDForItemType:zone:aliasTargetZoneIsShared:].cold.1();

  }
  -[BRCItemID itemIDString](self, "itemIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingString:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  v20 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(v8, "zoneID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithRecordName:zoneID:", v16, v21);

  return v22;
}

- (id)sideCarRecordNameWithZone:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "ownerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringFromIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringToIndex:", 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCItemID itemIDString](self, "itemIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("ppm_"), "stringByAppendingFormat:", CFSTR("%@/%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)sideCarRecordIDWithZone:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C95098];
  v5 = a3;
  objc_msgSend(v4, "brc_sideCarZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemID sideCarRecordNameWithZone:](self, "sideCarRecordNameWithZone:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v7, v6);
  return v8;
}

- (id)_directoryRecordNameWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;

  v4 = a3;
  if (!-[BRCItemID isDocumentsFolder](self, "isDocumentsFolder")
    && (!-[BRCItemID isNonDesktopRoot](self, "isNonDesktopRoot")
     || -[BRCItemID isSharedZoneRoot](self, "isSharedZoneRoot")))
  {
    goto LABEL_13;
  }
  -[BRCItemID appLibraryRowID](self, "appLibraryRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLibraryByRowID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "wasMovedToCloudDocs") || (objc_msgSend(v6, "isCloudDocsAppLibrary") & 1) != 0)
    goto LABEL_12;
  if (!-[BRCItemID isDocumentsFolder](self, "isDocumentsFolder"))
  {
    if (-[BRCItemID isNonDesktopRoot](self, "isNonDesktopRoot"))
    {
      objc_msgSend(v6, "appLibraryID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("directory/appData_");
      goto LABEL_11;
    }
LABEL_12:

LABEL_13:
    -[BRCItemID itemIDString](self, "itemIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("directory/"), "stringByAppendingString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v6, "appLibraryID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("directory/appDocuments_");
LABEL_11:
  -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v9;
}

- (id)directoryReferenceInZone:(id)a3 action:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemID _directoryRecordNameWithSession:](self, "_directoryRecordNameWithSession:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(v6, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithRecordName:zoneID:", v8, v10);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v11, a4);

  return v12;
}

- (BOOL)isNonDesktopRoot
{
  return (self->_kind & 0xFB) == 1;
}

- (BOOL)isDocumentsFolder
{
  return self->_kind == 2;
}

- (BOOL)isSharedZoneRoot
{
  return self->_kind == 5;
}

- (BRCALRowID)appLibraryRowID
{
  void *v4;
  NSObject *v5;

  if (!-[BRCItemID isNonDesktopRoot](self, "isNonDesktopRoot")
    && !-[BRCItemID isDocumentsFolder](self, "isDocumentsFolder"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCItemID appLibraryRowID].cold.1();

  }
  return self->_appLibraryRowID;
}

- (BRCZoneRowID)sharedZoneRowID
{
  void *v4;
  NSObject *v5;

  if (!-[BRCItemID isSharedZoneRoot](self, "isSharedZoneRoot"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCItemID sharedZoneRowID].cold.1();

  }
  return self->_zoneRowID;
}

- (id)itemUUIDString
{
  _BYTE v3[37];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_kind)
    return 0;
  memset(v3, 0, sizeof(v3));
  uuid_unparse_upper(self->_uuid, v3);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v3, 36, 1);
}

- (id)zoneUniqueItemIDStringWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _BYTE v22[40];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_appLibraryRowID)
  {
    objc_msgSend(v4, "appLibraryByRowID:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (self->_zoneRowID)
  {
    objc_msgSend(v5, "serverZoneByRowID:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  memset(v22, 0, 37);
  switch(self->_kind)
  {
    case 0u:
      uuid_unparse_upper(self->_uuid, v22);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v22, 36, 4);
      break;
    case 1u:
      if (!v6)
      {
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          -[BRCItemID(CKConversions) structureRecordIDForItemType:zone:aliasTargetZoneIsShared:].cold.2();

      }
      objc_msgSend(v6, "appLibraryID", *(_OWORD *)v22, *(_QWORD *)&v22[16], *(_OWORD *)&v22[24], v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = BRCItemIDZoneRoot;
      goto LABEL_12;
    case 2u:
      objc_msgSend(v6, "appLibraryID", *(_OWORD *)v22, *(_QWORD *)&v22[16], *(_OWORD *)&v22[24], v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = BRCItemIDDocuments;
LABEL_12:
      objc_msgSend(v10, "stringByAppendingPathComponent:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 3u:
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCItemID_v9 itemIDString].cold.2();

      goto LABEL_19;
    case 5u:
      if (!v8)
      {
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          -[BRCItemID zoneUniqueItemIDStringWithSession:].cold.3();

      }
      objc_msgSend(v8, "mangledID", *(_OWORD *)v22, *(_QWORD *)&v22[16], *(_OWORD *)&v22[24], v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mangledIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingPathComponent:", BRCItemIDZoneRoot);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
      break;
    default:
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BRCItemID zoneUniqueItemIDStringWithSession:].cold.1();

LABEL_19:
      v9 = 0;
      break;
  }

  return v9;
}

- (NSString)itemIDString
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BYTE v9[37];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, sizeof(v9));
  switch(self->_kind)
  {
    case 0u:
      uuid_unparse_upper(self->_uuid, v9);
      v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v9, 36, 4);
      return (NSString *)v3;
    case 1u:
    case 5u:
      v2 = BRCItemIDZoneRoot;
      goto LABEL_5;
    case 2u:
      v2 = BRCItemIDDocuments;
LABEL_5:
      v3 = v2;
      return (NSString *)v3;
    case 3u:
      brc_bread_crumbs();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BRCItemID_v9 itemIDString].cold.2();

      goto LABEL_12;
    default:
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BRCItemID zoneUniqueItemIDStringWithSession:].cold.1();

LABEL_12:
      v3 = 0;
      return (NSString *)v3;
  }
}

- (id)debugItemIDString
{
  return -[BRCItemID debugItemIDStringWithVerbose:](self, "debugItemIDStringWithVerbose:", 0);
}

- (id)debugItemIDStringWithVerbose:(BOOL)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id result;
  unsigned __int8 *uuid;
  char *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  char out[40];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(out, 0, 37);
  switch(self->_kind)
  {
    case 0u:
      uuid = self->_uuid;
      v10 = out;
      uuid_unparse_upper(self->_uuid, out);
      if (a3)
      {
        v11 = 36;
      }
      else
      {
        if (*(_QWORD *)uuid == 0x30000000000000)
          v11 = 17;
        else
          v11 = 8;
        v14 = 19;
        if (*(_QWORD *)uuid != 0x30000000000000)
          v14 = 0;
        v10 = &out[v14];
      }
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v10, v11, 4);
      goto LABEL_23;
    case 1u:
      v12 = BRCItemIDZoneRoot;
      goto LABEL_13;
    case 2u:
      v12 = BRCItemIDDocuments;
LABEL_13:
      -[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR("[%llu]"), -[BRCALRowID unsignedLongLongValue](self->_appLibraryRowID, "unsignedLongLongValue", a3));
      goto LABEL_15;
    case 3u:
    case 4u:
      brc_bread_crumbs();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        -[BRCItemID debugItemIDStringWithVerbose:].cold.2();

      goto LABEL_8;
    case 5u:
      objc_msgSend(BRCItemIDZoneRoot, "stringByAppendingFormat:", CFSTR("{%llu}"), -[BRCZoneRowID unsignedLongLongValue](self->_zoneRowID, "unsignedLongLongValue", a3));
LABEL_15:
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
      result = v13;
      break;
    default:
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[BRCItemID zoneUniqueItemIDStringWithSession:].cold.1();

LABEL_8:
      result = 0;
      break;
  }
  return result;
}

- (const)UTF8String
{
  id v2;
  const char *v3;

  -[BRCItemID itemIDString](self, "itemIDString");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "UTF8String");

  return v3;
}

+ (id)documentsItemIDWithAppLibraryRowID:(id)a3
{
  id v3;
  void *v4;
  BRCItemID *v5;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  char v11;
  int v12;

  v3 = a3;
  if (!v3 || (v4 = v3, !objc_msgSend(v3, "unsignedLongLongValue")))
  {
    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid library rowid"));
    v7 = objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[BRCItemID documentsItemIDWithAppLibraryRowID:].cold.1(v7, (uint64_t)v8, v9);

    brc_append_system_info_to_message();
    v10 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("+[BRCItemID documentsItemIDWithAppLibraryRowID:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/items/BRCItemID.m", 232, v10);
  }
  v12 = objc_msgSend(v4, "intValue");
  v11 = 2;
  v5 = -[BRCItemID initWithRootObject:]([BRCItemID alloc], "initWithRootObject:", &v11);

  return v5;
}

+ (id)defaultDesktopItemID
{
  BRCItemID *v2;

  v2 = [BRCItemID alloc];
  return -[BRCItemID initWithUUIDString:](v2, "initWithUUIDString:", *MEMORY[0x1E0D10DC0]);
}

+ (id)defaultDocumentsItemID
{
  BRCItemID *v2;

  v2 = [BRCItemID alloc];
  return -[BRCItemID initWithUUIDString:](v2, "initWithUUIDString:", *MEMORY[0x1E0D10DD0]);
}

- (BOOL)isEqualToItemID:(id)a3
{
  BRCItemID *v4;
  BRCItemID *v5;
  void *appLibraryRowID;
  void *zoneRowID;
  void *v8;
  NSObject *v9;

  v4 = (BRCItemID *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && self->_kind == v4->_kind)
  {
    switch(self->_kind)
    {
      case 0u:
        LOBYTE(self) = *(_QWORD *)self->_uuid == *(_QWORD *)v4->_uuid
                    && *(_QWORD *)&self->_uuid[8] == *(_QWORD *)&v4->_uuid[8];
        break;
      case 1u:
      case 2u:
        appLibraryRowID = self->_appLibraryRowID;
        zoneRowID = v5->_appLibraryRowID;
        goto LABEL_19;
      case 3u:
      case 4u:
        brc_bread_crumbs();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[BRCItemID isEqualToItemID:].cold.1();

        goto LABEL_10;
      case 5u:
        appLibraryRowID = self->_zoneRowID;
        zoneRowID = v5->_zoneRowID;
LABEL_19:
        LOBYTE(self) = objc_msgSend(appLibraryRowID, "br_isEqualToNumber:", zoneRowID);
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_10:
    LOBYTE(self) = 0;
  }

  return self & 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[BRCItemID isEqualToItemID:](self, "isEqualToItemID:", v4);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  void *appLibraryRowID;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  unint64_t v7;

  v2 = self->_kind ^ 0x6C885475B6449F5DLL;
  switch(self->_kind)
  {
    case 0u:
      v6 = 0;
      v7 = 0xC53A6F2A5ADB4AA5;
      do
        v7 = (33 * v7 + (v7 >> 59)) ^ self->_uuid[v6++];
      while (v6 != 16);
      v2 = v7 ^ (33 * v2 + 13);
      break;
    case 1u:
    case 2u:
      appLibraryRowID = self->_appLibraryRowID;
      goto LABEL_10;
    case 3u:
    case 4u:
      brc_bread_crumbs();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BRCItemID isEqualToItemID:].cold.1();

      v2 = 0;
      break;
    case 5u:
      appLibraryRowID = self->_zoneRowID;
LABEL_10:
      v2 = objc_msgSend(appLibraryRowID, "hash") ^ (33 * v2 + 13);
      break;
    default:
      return v2;
  }
  return v2;
}

- (BRCItemID)init
{
  BRCItemID *v2;
  BRCItemID *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCItemID;
  v2 = -[BRCItemID init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_kind = 0;
    uuid_generate_random(v2->_uuid);
  }
  return v3;
}

- (BRCItemID)initWithString:(id)a3 libraryRowID:(id)a4 sharedZoneRowID:(id)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  BRCItemID *v11;
  void *v12;
  NSObject *v13;
  BRCItemID *v14;
  void *v16;
  NSObject *v17;

  v8 = a3;
  v9 = (unint64_t)a4;
  v10 = (unint64_t)a5;
  if (objc_msgSend(v8, "isEqualToString:", BRCItemIDZoneRoot))
  {
    if (v9 | v10)
    {
      if (v9)
      {
        v11 = -[BRCItemID _initAsLibraryRootWithAppLibraryRowID:](self, "_initAsLibraryRootWithAppLibraryRowID:", v9);
        goto LABEL_13;
      }
    }
    else
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BRCItemID initWithString:libraryRowID:sharedZoneRowID:].cold.1();

    }
    v11 = -[BRCItemID _initAsZoneRootWithZoneRowID:](self, "_initAsZoneRootWithZoneRowID:", v10);
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "isEqualToString:", BRCItemIDDocuments))
  {
    if (!v9)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[CKRecordID(BRCItemAdditions) _itemIDWithLibraryRowID:session:].cold.1();

    }
    v11 = -[BRCItemID initAsDocumentsWithAppLibraryRowID:](self, "initAsDocumentsWithAppLibraryRowID:", v9);
  }
  else
  {
    v11 = -[BRCItemID initWithUUIDString:](self, "initWithUUIDString:", v8);
  }
LABEL_13:
  v14 = v11;

  return v14;
}

- (BRCItemID)initWithUUIDString:(id)a3
{
  id v4;
  BRCItemID *v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9[0] = 0;
  v9[1] = 0;
  if (_br_parseUUIDString())
  {
    self = -[BRCItemID initWithUUID:](self, "initWithUUID:", v9);
    v5 = self;
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCItemID initWithUUIDString:].cold.1(v4, (uint64_t)v6, v7);

    v5 = 0;
  }

  return v5;
}

- (id)_initAsLibraryRootWithAppLibraryRowID:(id)a3
{
  id v5;
  BRCItemID *v6;
  BRCItemID *v7;
  BRCItemID *v8;
  void *v9;
  NSObject *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCItemID;
  v6 = -[BRCItemID init](&v12, sel_init);
  v7 = v6;
  if (!v6
    || (v6->_kind = 1, objc_storeStrong((id *)&v6->_appLibraryRowID, a3), v5)
    && objc_msgSend(v5, "unsignedLongLongValue"))
  {
    v8 = v7;
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCItemID _initAsLibraryRootWithAppLibraryRowID:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (id)_initAsZoneRootWithZoneRowID:(id)a3
{
  id v5;
  BRCItemID *v6;
  BRCItemID *v7;
  BRCItemID *v8;
  void *v9;
  NSObject *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCItemID;
  v6 = -[BRCItemID init](&v12, sel_init);
  v7 = v6;
  if (!v6
    || (v6->_kind = 5, objc_storeStrong((id *)&v6->_zoneRowID, a3), v5) && objc_msgSend(v5, "unsignedLongLongValue"))
  {
    v8 = v7;
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCItemID _initAsZoneRootWithZoneRowID:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (id)initAsDocumentsWithAppLibraryRowID:(id)a3
{
  id v5;
  BRCItemID *v6;
  BRCItemID *v7;
  BRCItemID *v8;
  void *v9;
  NSObject *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCItemID;
  v6 = -[BRCItemID init](&v12, sel_init);
  v7 = v6;
  if (!v6
    || (v6->_kind = 2, objc_storeStrong((id *)&v6->_appLibraryRowID, a3), v5)
    && objc_msgSend(v5, "unsignedLongLongValue"))
  {
    v8 = v7;
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCItemID initAsDocumentsWithAppLibraryRowID:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (BRCItemID)initWithUUID:(const char *)a3
{
  BRCItemID *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCItemID;
  result = -[BRCItemID init](&v5, sel_init);
  if (result)
  {
    result->_kind = 0;
    *(_OWORD *)result->_uuid = *(_OWORD *)a3;
  }
  return result;
}

- (BRCItemID)initWithRootObject:(RootItemObject *)a3
{
  BRCItemID *v4;
  BRCItemID *v5;
  int var0;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  NSObject *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BRCItemID;
  v4 = -[BRCItemID init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_kind = a3->var0;
    var0 = a3->var0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(&a3->var0 + 1));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = 8;
    if (var0 == 5)
      v8 = 16;
    v9 = *(Class *)((char *)&v5->super.isa + v8);
    *(Class *)((char *)&v5->super.isa + v8) = (Class)v7;

    v10 = a3->var0;
    if (v10 > 5 || ((1 << v10) & 0x26) == 0)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCItemID initWithRootObject:].cold.1();

    }
  }
  return v5;
}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  int v4;
  int v5;
  const void *v6;
  int v7;
  const unsigned __int8 *v9;
  int v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  _WORD v21[17];

  *(_QWORD *)&v21[13] = *MEMORY[0x1E0C80C00];
  v4 = sqlite3_value_type(a3);
  if (v4 == 5)
    return 0;
  v5 = v4;
  if (v4 != 4)
  {
    v9 = sqlite3_value_text(a3);
    v10 = sqlite3_value_bytes(a3);
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v16;
      v20 = 1024;
      *(_DWORD *)v21 = v5;
      v21[2] = 2112;
      *(_QWORD *)&v21[3] = v11;
      _os_log_fault_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unmigrated? invalid BRCItemID (%@) - %d%@", (uint8_t *)&v18, 0x1Cu);

    }
    return 0;
  }
  v6 = sqlite3_value_blob(a3);
  v7 = sqlite3_value_bytes(a3);
  if (v7 == 16)
    return -[BRCItemID initWithUUID:]([BRCItemID alloc], "initWithUUID:", v6);
  v13 = v7;
  if (v7 != 5)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v17;
      v20 = 2112;
      *(_QWORD *)v21 = v14;
      _os_log_fault_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid BRCItemID (%@)%@", (uint8_t *)&v18, 0x16u);

    }
    return 0;
  }
  return -[BRCItemID initWithRootObject:]([BRCItemID alloc], "initWithRootObject:", v6);
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  int v6;
  int v7;
  const void *v8;
  int v9;
  const unsigned __int8 *v11;
  int v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  _WORD v21[17];

  *(_QWORD *)&v21[13] = *MEMORY[0x1E0C80C00];
  v6 = sqlite3_column_type(a3, a4);
  if (v6 == 5)
    return 0;
  v7 = v6;
  if (v6 != 4)
  {
    v11 = sqlite3_column_text(a3, a4);
    v12 = sqlite3_column_bytes(a3, a4);
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v11, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v17;
      v20 = 1024;
      *(_DWORD *)v21 = v7;
      v21[2] = 2112;
      *(_QWORD *)&v21[3] = v13;
      _os_log_fault_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unmigrated? invalid BRCItemID (%@) - %d%@", (uint8_t *)&v18, 0x1Cu);

    }
    goto LABEL_7;
  }
  v8 = sqlite3_column_blob(a3, a4);
  v9 = sqlite3_column_bytes(a3, a4);
  if (v9 == 16)
    return -[BRCItemID initWithUUID:]([BRCItemID alloc], "initWithUUID:", v8);
  v15 = v9;
  if (v9 != 5)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v16;
      v20 = 2112;
      *(_QWORD *)v21 = v13;
      _os_log_fault_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid BRCItemID (%@)%@", (uint8_t *)&v18, 0x16u);

    }
LABEL_7:

    return 0;
  }
  return -[BRCItemID initWithRootObject:]([BRCItemID alloc], "initWithRootObject:", v8);
}

+ (BOOL)isRootItemIDWithSQLiteValue:(sqlite3_value *)a3
{
  return sqlite3_value_type(a3) == 4 && sqlite3_value_bytes(a3) == 5 && (*(_BYTE *)sqlite3_value_blob(a3) & 0xFB) == 1;
}

+ (BOOL)isAppLibraryRootItemIDWithSQLiteValue:(sqlite3_value *)a3
{
  return sqlite3_value_type(a3) == 4 && sqlite3_value_bytes(a3) == 5 && *(_BYTE *)sqlite3_value_blob(a3) == 1;
}

+ (BOOL)isDocumentsItemIDWithSQLiteValue:(sqlite3_value *)a3
{
  return sqlite3_value_type(a3) == 4 && sqlite3_value_bytes(a3) == 5 && *(_BYTE *)sqlite3_value_blob(a3) == 2;
}

+ (BOOL)isSharedZoneRootItemIDWithSQLiteValue:(sqlite3_value *)a3
{
  return sqlite3_value_type(a3) == 4 && sqlite3_value_bytes(a3) == 5 && *(_BYTE *)sqlite3_value_blob(a3) == 5;
}

+ (id)appLibraryRowIDFromRootOrDocumentsSQLiteValue:(sqlite3_value *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;

  if (sqlite3_value_type(a3) != 4
    || sqlite3_value_bytes(a3) != 5
    || !*(_DWORD *)((char *)sqlite3_value_blob(a3) + 1)
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[BRCItemID appLibraryRowIDFromRootOrDocumentsSQLiteValue:].cold.1();

    v4 = 0;
  }
  return v4;
}

- (BRCItemID)initWithItemID:(id)a3
{
  char *v4;
  BRCItemID *v5;
  BRCItemID *v6;
  objc_super v8;

  v4 = (char *)a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCItemID;
  v5 = -[BRCItemID init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_kind = v4[24];
    objc_storeStrong((id *)&v5->_appLibraryRowID, *((id *)v4 + 1));
    *(_OWORD *)v6->_uuid = *(_OWORD *)(v4 + 25);
  }

  return v6;
}

- (BRCItemID)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  BRCItemID *v6;
  uint64_t v7;
  BRCItemID *v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;

  v12 = 0;
  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "decodeBytesForKey:returnedLength:", CFSTR("bytes"), &v12);
  if (v12 == 16)
  {
    v6 = -[BRCItemID initWithUUID:](self, "initWithUUID:", v5);
LABEL_5:
    self = v6;
    v8 = self;
    goto LABEL_9;
  }
  v7 = objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("root_object"), &v12);
  if (v12 == 5)
  {
    v6 = -[BRCItemID initWithRootObject:](self, "initWithRootObject:", v7);
    goto LABEL_5;
  }
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[BRCItemID initWithCoder:].cold.1();

  v8 = 0;
LABEL_9:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *appLibraryRowID;
  void *v7;
  NSObject *v8;
  unsigned __int8 *uuid;
  const __CFString *v10;
  uint64_t v11;
  _DWORD v12[2];

  v4 = a3;
  v5 = v4;
  memset(v12, 0, 5);
  switch(self->_kind)
  {
    case 0u:
      uuid = self->_uuid;
      v10 = CFSTR("bytes");
      v11 = 16;
      goto LABEL_11;
    case 1u:
    case 2u:
      LOBYTE(v12[0]) = self->_kind;
      appLibraryRowID = self->_appLibraryRowID;
      goto LABEL_10;
    case 3u:
    case 4u:
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BRCItemID isEqualToItemID:].cold.1();
      goto LABEL_7;
    case 5u:
      LOBYTE(v12[0]) = 5;
      appLibraryRowID = self->_zoneRowID;
LABEL_10:
      *(_DWORD *)((char *)v12 + 1) = objc_msgSend(appLibraryRowID, "intValue");
      v10 = CFSTR("root_object");
      uuid = (unsigned __int8 *)v12;
      v4 = v5;
      v11 = 5;
LABEL_11:
      objc_msgSend(v4, "encodeBytes:length:forKey:", uuid, v11, v10);
      break;
    default:
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BRCItemID encodeWithCoder:].cold.1();
LABEL_7:

      break;
  }

}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _DWORD v10[2];

  memset(v10, 0, 5);
  switch(self->_kind)
  {
    case 0u:
      sqlite3_bind_blob(a3, a4, self->_uuid, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      return;
    case 1u:
      LOBYTE(v10[0]) = 1;
      *(_DWORD *)((char *)v10 + 1) = -[BRCALRowID intValue](self->_appLibraryRowID, "intValue");
      if (*(_DWORD *)((char *)v10 + 1))
        goto LABEL_15;
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        goto LABEL_18;
      goto LABEL_10;
    case 2u:
      LOBYTE(v10[0]) = 2;
      *(_DWORD *)((char *)v10 + 1) = -[BRCALRowID intValue](self->_appLibraryRowID, "intValue");
      if (*(_DWORD *)((char *)v10 + 1))
        goto LABEL_15;
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
LABEL_10:
        -[BRCItemID_v9 sqliteBind:index:].cold.2();
      goto LABEL_18;
    case 3u:
    case 4u:
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BRCItemID isEqualToItemID:].cold.1();
      goto LABEL_6;
    case 5u:
      LOBYTE(v10[0]) = 5;
      *(_DWORD *)((char *)v10 + 1) = -[BRCZoneRowID intValue](self->_zoneRowID, "intValue");
      if (*(_DWORD *)((char *)v10 + 1))
        goto LABEL_15;
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BRCItemID sqliteBind:index:].cold.4();
LABEL_18:

LABEL_15:
      sqlite3_bind_blob(a3, a4, v10, 5, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      break;
    default:
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BRCItemID sqliteBind:index:].cold.1();
LABEL_6:

      sqlite3_bind_null(a3, a4);
      break;
  }
}

- (id)derivedAliasItemIDWithOwnerName:(id)a3
{
  BRCItemID *v4;
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  CC_LONG v9;
  CC_LONG v10;
  BRCItemID *v11;
  __int128 v13;
  _BYTE v14[20];
  unsigned __int8 md[16];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)v14 = 0u;
  v4 = objc_retainAutorelease(self);
  v5 = a3;
  v6 = -[BRCItemID UTF8String](v4, "UTF8String", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0, __PAIR128__(((unsigned __int128)0 * 0x100000000) >> 64, 0), *(_QWORD *)&v14[12]);
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");

  CC_MD5_Init((CC_MD5_CTX *)&v13);
  v9 = strlen(v8);
  CC_MD5_Update((CC_MD5_CTX *)&v13, v8, v9);
  v10 = strlen(v6);
  CC_MD5_Update((CC_MD5_CTX *)&v13, v6, v10);
  CC_MD5_Final(md, (CC_MD5_CTX *)&v13);
  md[6] = md[6] & 0xF | 0x30;
  md[8] = md[8] & 0x3F | 0x80;
  v11 = objc_alloc_init(BRCItemID);
  if (v11)
  {
    v11->_kind = 0;
    *(_OWORD *)v11->_uuid = *(_OWORD *)md;
  }
  return v11;
}

+ (id)parseMangledItemIDString:(id)a3 mangledID:(id *)a4 etag:(id *)a5 session:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BRCItemID *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v24;

  v9 = a3;
  v10 = a6;
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("_"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverDB");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "serialQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v13);

  if (objc_msgSend(v11, "count") == 3)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[BRCItemID initWithUUIDString:]([BRCItemID alloc], "initWithUUIDString:", v15);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithMangledString:", v14);
    if (a4)
      objc_storeStrong(a4, v18);
    if (a5)
      objc_storeStrong(a5, v16);
LABEL_14:

    goto LABEL_15;
  }
  if (objc_msgSend(v11, "count") == 4)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("_"), "stringByAppendingString:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v9;
    if (-[NSObject hasSuffix:](v14, "hasSuffix:", CFSTR(":")))
    {
      -[NSObject substringToIndex:](v14, "substringToIndex:", -[NSObject length](v14, "length") - 1);
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = v20;
    }
    -[NSObject stringByReplacingOccurrencesOfString:withString:](v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("~"), CFSTR("."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithZoneName:ownerName:", v21, v18);
    v17 = -[BRCItemID initWithUUIDString:]([BRCItemID alloc], "initWithUUIDString:", v15);
    if (a4)
      objc_storeStrong(a4, v22);
    if (a5)
      objc_storeStrong(a5, v16);

    v9 = v24;
    goto LABEL_14;
  }
  if (objc_msgSend(v11, "count") == 1)
  {
    v17 = 0;
    goto LABEL_16;
  }
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    +[BRCItemID parseMangledItemIDString:mangledID:etag:session:].cold.1(v9, (uint64_t)v15, v14);
  v17 = 0;
LABEL_15:

LABEL_16:
  return v17;
}

+ (BOOL)migrateItemIDsToVersion5WithDB:(id)a3 serverTruth:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  BRCItemID *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  char v19;
  BOOL v21;
  _QWORD v22[4];
  id v23;
  char v24;
  int v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v4)
    v6 = CFSTR("server_items");
  else
    v6 = CFSTR("client_items");
  if (v4)
    v7 = CFSTR("server_zones");
  else
    v7 = CFSTR("client_zones");
  objc_msgSend(MEMORY[0x1E0DE81D8], "nameWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DE81D8], "nameWithString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "fetch:", CFSTR("SELECT rowid FROM %@ WHERE zone_owner != %@"), v9, *MEMORY[0x1E0C94730]);
  if (objc_msgSend(v10, "next"))
  {
    v21 = v4;
    v11 = 1;
    do
    {
      objc_msgSend(v10, "numberAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v24 = 1;
      v25 = objc_msgSend(v12, "intValue");
      if (!v25)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v16;
          _os_log_fault_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: rio.app_lib_rowid%@", buf, 0xCu);
        }

      }
      v13 = -[BRCItemID initWithRootObject:]([BRCItemID alloc], "initWithRootObject:", &v24);
      if ((v11 & 1) != 0)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke;
        v22[3] = &unk_1E875E1A8;
        v14 = v12;
        v23 = v14;
        v15 = (void *)MEMORY[0x1D17A6DB0](v22);
        v11 = objc_msgSend(v5, "execute:", CFSTR("UPDATE %@ SET item_id = call_block(%@, item_id), item_parent_id = %@ WHERE zone_rowid = %@"), v8, v15, v13, v14);

      }
      else
      {
        v11 = 0;
      }

    }
    while ((objc_msgSend(v10, "next") & 1) != 0);
    objc_msgSend(v10, "close");
    LOBYTE(v4) = v21;
    if ((v11 & 1) == 0)
      goto LABEL_26;
  }
  else
  {
    objc_msgSend(v10, "close");
  }
  if (!objc_msgSend(v5, "execute:", CFSTR("UPDATE %@ SET item_id = call_block(%@, item_id, zone_rowid) WHERE item_type = 3"), v8, &__block_literal_global_31)|| !objc_msgSend(v5, "execute:", CFSTR("UPDATE %@ SET item_parent_id = call_block(%@, zone_rowid) WHERE item_parent_id = \"root\"), v8, &__block_literal_global_46)|| !objc_msgSend(v5, "execute:", CFSTR("UPDATE %@ SET item_parent_id = call_block(%@, zone_rowid) WHERE item_parent_id = \"documents\"), v8, &__block_literal_global_48_0))
  {
LABEL_26:
    v19 = 0;
    goto LABEL_27;
  }
  v18 = objc_msgSend(v5, "execute:", CFSTR("UPDATE %@ SET item_id = call_block(%@, zone_rowid) WHERE item_id = \"documents\"), v8, &__block_literal_global_48_0);
  v19 = v4 & v18;
  if (!v4 && v18)
    v19 = objc_msgSend(v5, "execute:", CFSTR("UPDATE client_unapplied_table SET item_id = call_block(%@, zone_rowid) WHERE item_id = \"documents\"), &__block_literal_global_48_0);
LABEL_27:

  return v19;
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  __int128 *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  char v14;
  int v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 != 1)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  v7 = (__int128 *)sqlite3_value_blob(*a4);
  if (sqlite3_value_bytes(*a4) == 16)
  {
    v14 = 4;
    v15 = objc_msgSend(*(id *)(a1 + 32), "intValue");
    v16 = *v7;
    sqlite3_result_blob(a2, &v14, 21, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_2();

    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_1();

    sqlite3_result_null(a2);
  }
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_42(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  __int128 *v6;
  int v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  char v15;
  int v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3 != 2)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_42_cold_3();

  }
  v6 = (__int128 *)sqlite3_value_blob(*a4);
  v7 = sqlite3_value_bytes(*a4);
  v8 = sqlite3_value_int(a4[1]);
  if (v7 == 16)
  {
    v15 = 3;
    v16 = v8;
    v17 = *v6;
    sqlite3_result_blob(a2, &v15, 21, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_2();

    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_1();

    sqlite3_result_null(a2);
  }
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_45(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  int v6;
  void *v7;
  NSObject *v8;
  char v9;
  int v10;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  v6 = sqlite3_value_int(*a4);
  v9 = 1;
  v10 = v6;
  sqlite3_result_blob(a2, &v9, 5, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_47(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  int v6;
  void *v7;
  NSObject *v8;
  char v9;
  int v10;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  v6 = sqlite3_value_int(*a4);
  v9 = 2;
  v10 = v6;
  sqlite3_result_blob(a2, &v9, 5, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (BOOL)migrateItemIDsToVersion8WithDB:(id)a3 serverTruth:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  char v9;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0DE81D8];
  v6 = a3;
  if (v4)
    v7 = CFSTR("server_items");
  else
    v7 = CFSTR("client_items");
  objc_msgSend(v5, "nameWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "execute:", CFSTR("UPDATE %@ SET item_id = call_block(%@, item_id) WHERE item_type = 3"), v8, &__block_literal_global_57);

  return v9;
}

void __56__BRCItemID_migrateItemIDsToVersion8WithDB_serverTruth___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  char *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  v6 = (char *)sqlite3_value_blob(*a4);
  if (sqlite3_value_bytes(*a4) == 21)
  {
    sqlite3_result_blob(a2, v6 + 5, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __56__BRCItemID_migrateItemIDsToVersion8WithDB_serverTruth___block_invoke_cold_2();

    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __56__BRCItemID_migrateItemIDsToVersion8WithDB_serverTruth___block_invoke_cold_1();

    sqlite3_result_null(a2);
  }
}

+ (BOOL)migrateItemIDsToVersion11WithDB:(id)a3 serverTruth:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  BOOL v20;

  v4 = a4;
  v5 = a3;
  if (v4)
    v6 = CFSTR("server_items");
  else
    v6 = CFSTR("client_items");
  if (v4)
    v7 = CFSTR("server_zones");
  else
    v7 = CFSTR("client_zones");
  objc_msgSend(MEMORY[0x1E0DE81D8], "nameWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DE81D8], "nameWithString:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "fetch:", CFSTR("SELECT rowid FROM %@ WHERE zone_owner != %@"), v17, *MEMORY[0x1E0C94730]);
  if (objc_msgSend(v9, "next"))
  {
    v10 = 1;
    do
    {
      objc_msgSend(v9, "numberAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = 0;
      if ((v10 & 1) != 0)
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke_61;
        v18[3] = &unk_1E87633B8;
        v20 = v4;
        v14 = v11;
        v19 = v14;
        v15 = (void *)MEMORY[0x1D17A6DB0](v18);
        v13 = objc_msgSend(v5, "execute:", CFSTR("UPDATE %@ SET item_id = call_block(%@, item_id), item_parent_id = call_block(%@, item_parent_id) WHERE zone_rowid = %@"), v8, &__block_literal_global_60_0, v15, v14);

      }
      v10 = v13;
    }
    while ((objc_msgSend(v9, "next") & 1) != 0);
  }
  else
  {
    v13 = 1;
  }
  objc_msgSend(v9, "close");

  return v13;
}

void __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  char *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 != 1)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  v6 = (char *)sqlite3_value_blob(*a4);
  if (sqlite3_value_bytes(*a4) == 21)
  {
    if (*v6 != 4)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke_cold_1();

    }
    v15 = *(_OWORD *)(v6 + 5);
    sqlite3_result_blob(a2, &v15, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __56__BRCItemID_migrateItemIDsToVersion8WithDB_serverTruth___block_invoke_cold_2();

    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_1();

    sqlite3_result_null(a2);
  }
}

void __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke_61(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  int v7;
  char *v8;
  char *v9;
  sqlite3_context *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  char v16;
  int v17;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  v7 = sqlite3_value_bytes(*a4);
  v8 = (char *)sqlite3_value_blob(*a4);
  v9 = v8;
  if (*(_BYTE *)(a1 + 40))
  {
    if (v7 != 21 || *v8 != 5)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke_61_cold_1();

    }
    v16 = 5;
    v17 = objc_msgSend(*(id *)(a1 + 32), "intValue");
    v9 = &v16;
    v10 = a2;
    v11 = 5;
  }
  else
  {
    v10 = a2;
    v11 = v7;
  }
  sqlite3_result_blob(v10, v9, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneRowID, 0);
  objc_storeStrong((id *)&self->_appLibraryRowID, 0);
}

- (void)appLibraryRowID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isNonDesktopRoot || self.isDocumentsFolder%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sharedZoneRowID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isSharedZoneRoot%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)zoneUniqueItemIDStringWithSession:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_0(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: unknown itemID type %d%@");
  OUTLINED_FUNCTION_2();
}

- (void)zoneUniqueItemIDStringWithSession:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: sharedZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)debugItemIDStringWithVerbose:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: we should not have alias or share uuid types anymores%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)documentsItemIDWithAppLibraryRowID:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  brc_append_system_info_to_message();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, a3, v5, "[CRIT] %@%@", v6);

}

- (void)isEqualToItemID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: we should not have alias or shared uuid types anymores%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithString:libraryRowID:sharedZoneRowID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: libraryRowID || sharedZoneRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithUUIDString:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, a3, v4, "[CRIT] UNREACHABLE: invalid UUID: %s%@", v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)_initAsLibraryRootWithAppLibraryRowID:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: can't initialize library root with invalid library rowid %@%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_initAsZoneRootWithZoneRowID:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: can't initialize shared zone root with invalid zone rowid %@%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)initAsDocumentsWithAppLibraryRowID:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: can't initialize document with invalid library rowid %@%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)initWithRootObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: object->item_code == BRCItemIDCodeDocuments || object->item_code == BRCItemIDCodeZoneRoot || object->item_code == BRCItemIDCodeSharedZoneRoot%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)appLibraryRowIDFromRootOrDocumentsSQLiteValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: appLibraryRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: decoding an unknown kind of itemid%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)encodeWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: encoding an item id with an unknown kind%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sqliteBind:index:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: unknown itemID kind%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sqliteBind:index:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: rio.zone_rowid%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)parseMangledItemIDString:(NSObject *)a3 mangledID:etag:session:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, a3, v4, "[CRIT] UNREACHABLE: unparsable mangled itemID: %s%@", v5);
  OUTLINED_FUNCTION_3_0();
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Invalid Shared ItemID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: len == sizeof(uuid_t)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BRCItemID_migrateItemIDsToVersion5WithDB_serverTruth___block_invoke_42_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: argc == 2%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BRCItemID_migrateItemIDsToVersion8WithDB_serverTruth___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Invalid Alias ItemID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BRCItemID_migrateItemIDsToVersion8WithDB_serverTruth___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: len == sizeof(_UUIDItemObject_OLD)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: p->item_code == _UNUSED_BRCItemIDCodeSharedUUID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__BRCItemID_migrateItemIDsToVersion11WithDB_serverTruth___block_invoke_61_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: len == sizeof(_UUIDItemObject_OLD) && ((_UUIDItemObject_OLD*)blob)->item_code == BRCItemIDCodeSharedZoneRoot%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
