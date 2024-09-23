@implementation BRCLocalVersion

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BRCItemGlobalID *v18;
  void *v19;
  NSObject *v20;
  objc_super v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRCLocalVersion;
  v7 = -[BRCVersion initFromResultSet:pos:](&v22, sel_initFromResultSet_pos_, v6, v4);
  if (v7)
  {
    v8 = (v4 + 12);
    v9 = (v4 + 13);
    objc_msgSend(v6, "unarchivedObjectOfClass:atIndex:", objc_opt_class(), v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v7[15];
    v7[15] = v10;

    if (_allowedClassesForErrors_once != -1)
      dispatch_once(&_allowedClassesForErrors_once, &__block_literal_global_19);
    v12 = (id)_allowedClassesForErrors_allowedClasses;
    objc_msgSend(v6, "unarchivedObjectOfClasses:atIndex:", v12, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v7[16];
    v7[16] = v13;

    objc_msgSend(v6, "objectOfClass:atIndex:", objc_opt_class(), (v9 + 1));
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberAtIndex:", (v9 + 2));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v15 && v16)
    {
      v18 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v16, v15);
      v19 = (void *)v7[17];
      v7[17] = v18;
    }
    else
    {
      if (!(v15 | v16))
      {
LABEL_12:

        goto LABEL_13;
      }
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v24 = v15;
        v25 = 2112;
        v26 = v17;
        v27 = 2112;
        v28 = v19;
        _os_log_fault_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Item has only one of the itemID %@ and zoneRowID %@ fields%@", buf, 0x20u);
      }

    }
    goto LABEL_12;
  }
LABEL_13:

  return v7;
}

- (void)updateFromFSAtPath:(id)a3 filenameOverride:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isFile"))
  {
    self->super._size = objc_msgSend(v6, "size");
  }
  else
  {
    if ((objc_msgSend(v6, "isPackageRoot") & 1) == 0)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCLocalVersion(LegacyAdditions) updateFromFSAtPath:filenameOverride:].cold.1();

    }
    v8 = objc_msgSend(v6, "documentID");
    objc_msgSend(v6, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientDB");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->super._size = +[BRCPackageItem aggregatePackageSizeForPackageID:db:](BRCPackageItem, "aggregatePackageSizeForPackageID:db:", v8, v10);

  }
  -[BRCLocalVersion updateLocationAndMetaFromFSAtPath:updateFilename:filenameOverride:](self, "updateLocationAndMetaFromFSAtPath:updateFilename:filenameOverride:", v6, 1, v7);

}

- (void)updateLocationAndMetaFromFSAtPath:(id)a3 updateFilename:(BOOL)a4 filenameOverride:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = a5;
  v9 = v8;
  if (v6)
  {
    v10 = v8;
    if (!v8)
    {
      objc_msgSend(v11, "filename");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&self->super._originalPOSIXName, v10);
    if (!v9)

  }
  self->super._mtime = objc_msgSend(v11, "modificationTime");

}

- (id)isPackageObj
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BRCVersion isPackage](self, "isPackage"));
}

- (id)sizeObj
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->super._size);
}

- (id)descriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSError *uploadError;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCLocalVersion;
  -[BRCVersion descriptionWithContext:](&v10, sel_descriptionWithContext_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  uploadError = self->_uploadError;
  if (uploadError)
  {
    +[BRCDumpContext stringFromError:context:](BRCDumpContext, "stringFromError:context:", uploadError, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" ul-error:%@"), v8);

  }
  if (self->_uploadedAssets)
    objc_msgSend(v6, "appendString:", CFSTR(" uploaded-assets"));
  if (self->_previousItemGlobalID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" prev-item:%@"), self->_previousItemGlobalID);

  return v6;
}

- (unint64_t)diffAgainstLocalVersion:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  void *v6;
  CKRecord *v7;
  CKRecord *v8;
  CKRecord *v9;
  char v10;
  void *v11;
  NSError *v12;
  NSError *v13;
  NSError *v14;
  char v15;
  void *v16;
  BRCItemGlobalID *v17;
  BRCItemGlobalID *v18;
  BRCItemGlobalID *v19;
  BOOL v20;

  v4 = a3;
  v5 = -[BRCVersion diffAgainst:](self, "diffAgainst:", v4);
  if ((v5 & 0x1000000000000) != 0)
    goto LABEL_7;
  v6 = (void *)v4[15];
  v7 = self->_uploadedAssets;
  v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {

    goto LABEL_14;
  }
  v10 = -[CKRecord isEqual:](v7, "isEqual:", v8);

  if ((v10 & 1) != 0)
  {
LABEL_7:
    if ((v5 & 0x2000000000000) != 0)
      goto LABEL_18;
LABEL_8:
    v11 = (void *)v4[16];
    v12 = self->_uploadError;
    v13 = v11;
    if (v12 == v13)
    {

      goto LABEL_18;
    }
    v14 = v13;
    if (v13)
    {
      v15 = -[NSError isEqual:](v12, "isEqual:", v13);

      if ((v15 & 1) != 0)
        goto LABEL_18;
    }
    else
    {

    }
    v5 |= 0x2000000000000uLL;
    goto LABEL_18;
  }
LABEL_14:
  v5 |= 0x1000000000000uLL;
  if ((v5 & 0x2000000000000) == 0)
    goto LABEL_8;
LABEL_18:
  if ((v5 & 0x4000000000000) == 0)
  {
    v16 = (void *)v4[17];
    v17 = self->_previousItemGlobalID;
    v18 = v16;
    if (v17 == v18)
    {

    }
    else
    {
      v19 = v18;
      if (v18)
      {
        v20 = -[BRCItemGlobalID isEqual:](v17, "isEqual:", v18);

        if (v20)
          goto LABEL_26;
      }
      else
      {

      }
      v5 |= 0x4000000000000uLL;
    }
  }
LABEL_26:

  return v5;
}

- (id)initForPackage:(BOOL)a3
{
  _BOOL8 v3;
  BRCLocalVersion *v4;
  BRCLocalVersion *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRCLocalVersion;
  v4 = -[BRCLocalVersion init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[BRCLocalVersion _clearSignatures:isPackage:](v4, "_clearSignatures:isPackage:", 3, v3);
  return v5;
}

- (BRCLocalVersion)initWithVersion:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRCLocalVersion;
  return -[BRCVersion initWithVersion:](&v4, sel_initWithVersion_, a3);
}

- (BRCLocalVersion)initWithLocalVersion:(id)a3
{
  id *v4;
  BRCLocalVersion *v5;
  uint64_t v6;
  CKRecord *uploadedAssets;
  uint64_t v8;
  NSError *uploadError;
  uint64_t v10;
  BRCItemGlobalID *previousItemGlobalID;

  v4 = (id *)a3;
  v5 = -[BRCLocalVersion initWithVersion:](self, "initWithVersion:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4[15], "copy");
    uploadedAssets = v5->_uploadedAssets;
    v5->_uploadedAssets = (CKRecord *)v6;

    v8 = objc_msgSend(v4[16], "copy");
    uploadError = v5->_uploadError;
    v5->_uploadError = (NSError *)v8;

    v10 = objc_msgSend(v4[17], "copy");
    previousItemGlobalID = v5->_previousItemGlobalID;
    v5->_previousItemGlobalID = (BRCItemGlobalID *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLocalVersion:", self);
}

- (BOOL)shouldRecreateUploadJobGivenDiffs:(unint64_t)a3
{
  return (a3 & 0x4000C007A0000) != 0;
}

- (BOOL)isMissingUploadsWithDiffs:(unint64_t)a3 isDocumentSyncPaused:(BOOL)a4 isDocumentResumingSync:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v22;
  NSObject *v23;

  v5 = a5;
  if (-[NSData brc_signatureIsPendingPlaceHolder](self->super._contentSignature, "brc_signatureIsPendingPlaceHolder"))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.8();

    if (!a4 && !v5)
      return 1;
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.7();

  }
  if (-[NSData brc_signatureIsPendingPlaceHolder](self->super._thumbnailSignature, "brc_signatureIsPendingPlaceHolder"))
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.6();

    if (!a4 && !v5)
      return 1;
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.5();

  }
  if ((a3 & 0x200000) != 0 && self->super._xattrSignature)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.4();

    if (!a4 && !v5)
      return 1;
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.3();

  }
  if ((a3 & 0x1000000000000) != 0 && !self->_uploadedAssets)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.2();
  }
  else
  {
    if ((a3 & 0x2000000000000) == 0 || self->_uploadError)
      return 0;
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[BRCLocalVersion isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:].cold.1();
  }

  return 1;
}

- (void)_clearSignatures:(unint64_t)a3 isPackage:(BOOL)a4
{
  NSData *v6;
  NSData *contentSignature;
  NSData *v8;
  NSData *thumbnailSignature;
  CKRecord *uploadedAssets;
  NSError *uploadError;

  if ((a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "brc_pendingPlaceholderForPackage:", a4);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    contentSignature = self->super._contentSignature;
    self->super._contentSignature = v6;

  }
  if ((a3 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "brc_pendingPlaceholderForPackage:", 0, a4);
    v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    thumbnailSignature = self->super._thumbnailSignature;
    self->super._thumbnailSignature = v8;

LABEL_9:
    uploadedAssets = self->_uploadedAssets;
    self->_uploadedAssets = 0;

    uploadError = self->_uploadError;
    self->_uploadError = 0;

    return;
  }
  if (a3 || self->_uploadedAssets || self->_uploadError)
    goto LABEL_9;
}

- (void)clearUploadedAssets
{
  CKRecord *uploadedAssets;
  NSError *uploadError;

  uploadedAssets = self->_uploadedAssets;
  self->_uploadedAssets = 0;

  uploadError = self->_uploadError;
  self->_uploadError = 0;

}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob(a3, a4, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

- (void)updateServerFieldsFromVersion:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *conflictLoserEtags;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "conflictLoserEtags");
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  conflictLoserEtags = self->super._conflictLoserEtags;
  self->super._conflictLoserEtags = v5;

  objc_msgSend(v4, "lastEditorDeviceOrUserRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion setLastEditorDeviceOrUserRowID:](self, "setLastEditorDeviceOrUserRowID:", v7);

  objc_msgSend(v4, "lastEditorDeviceName");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[BRCVersion setLastEditorDeviceName:](self, "setLastEditorDeviceName:", v8);
}

- (CKRecord)uploadedAssets
{
  return self->_uploadedAssets;
}

- (void)setUploadedAssets:(id)a3
{
  objc_storeStrong((id *)&self->_uploadedAssets, a3);
}

- (NSError)uploadError
{
  return self->_uploadError;
}

- (void)setUploadError:(id)a3
{
  objc_storeStrong((id *)&self->_uploadError, a3);
}

- (BRCItemGlobalID)previousItemGlobalID
{
  return self->_previousItemGlobalID;
}

- (void)setPreviousItemGlobalID:(id)a3
{
  objc_storeStrong((id *)&self->_previousItemGlobalID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousItemGlobalID, 0);
  objc_storeStrong((id *)&self->_uploadError, 0);
  objc_storeStrong((id *)&self->_uploadedAssets, 0);
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] we're a document with an upload error change%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] we're a document with an uploaded asset change%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Document is sync paused or resuming sync -> ignore xattr change%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] we're a document with an xattr change%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Document is sync paused or resuming sync -> ignore the missing thumbnail signature%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] we're a document missing a thumbnail signature%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Document is sync paused or resuming sync -> ignore the missing content signature%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isMissingUploadsWithDiffs:isDocumentSyncPaused:isDocumentResumingSync:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] we're a document missing a content signature%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
