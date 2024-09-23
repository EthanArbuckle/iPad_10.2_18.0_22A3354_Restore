@implementation BRCPackageItem

- (BOOL)isFile
{
  return self->_type == 2;
}

- (BOOL)isSymLink
{
  return self->_type == 3;
}

- (BOOL)isDirectory
{
  return self->_type == 1;
}

- (NSString)symlinkContent
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!-[BRCPackageItem isSymLink](self, "isSymLink"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCPackageItem symlinkContent].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return self->_symlinkContent;
}

- (NSData)contentSignature
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!-[BRCPackageItem isFile](self, "isFile"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCPackageItem contentSignature].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return self->_contentSignature;
}

- (NSString)description
{
  void *v3;
  unint64_t packageID;
  const char *v5;
  void *v6;
  BRCGenerationID *generationID;
  int64_t size;
  int64_t mtime;
  int mode;
  char v11;
  char v12;
  NSData *contentSignature;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSData *quarantineInfo;
  NSData *xattrSignature;
  void *v24;
  _BYTE v26[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 32);
  packageID = self->_packageID;
  if (self->_isDirty)
    v5 = " (dirty)";
  else
    v5 = "";
  -[NSString fp_obfuscatedPath](self->_pathInPackage, "fp_obfuscatedPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("pkg:%lld%s p:'%@' rank:%lld ino:%lld"), packageID, v5, v6, self->_assetRank, self->_fileID);

  switch(self->_type)
  {
    case 1:
      objc_msgSend(v3, "appendString:", CFSTR(" dir"));
      break;
    case 2:
      generationID = self->_generationID;
      mtime = self->_mtime;
      size = self->_size;
      v26[0] = 114;
      mode = self->_mode;
      if ((mode & 1) != 0)
        v11 = 119;
      else
        v11 = 45;
      v26[1] = v11;
      if ((mode & 2) != 0)
        v12 = 120;
      else
        v12 = 45;
      v26[2] = v12;
      v26[3] = (mode << 29 >> 31) & 0x4C;
      v26[4] = 0;
      objc_msgSend(v3, "appendFormat:", CFSTR(" file gen:%@ size:%llu mtime:%llu mode:%s"), generationID, size, mtime, v26);
      contentSignature = self->_contentSignature;
      if (contentSignature)
      {
        -[NSData brc_hexadecimalString](contentSignature, "brc_hexadecimalString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" sig:%@"), v14);
        goto LABEL_18;
      }
      break;
    case 3:
      -[NSString fp_obfuscatedPath](self->_symlinkContent, "fp_obfuscatedPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR(" link to:'%@'"), v14);
      goto LABEL_18;
    case 4:
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BRCPackageItem description].cold.1((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);

LABEL_18:
      break;
    default:
      break;
  }
  quarantineInfo = self->_quarantineInfo;
  if (quarantineInfo)
    objc_msgSend(v3, "appendFormat:", CFSTR(" quarantine:%u "), -[NSData br_qtnFlags](quarantineInfo, "br_qtnFlags"));
  xattrSignature = self->_xattrSignature;
  if (xattrSignature)
  {
    -[NSData brc_hexadecimalString](xattrSignature, "brc_hexadecimalString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" xattrSig:%@"), v24);

  }
  return (NSString *)v3;
}

- (void)_setXattrs:(id)a3 stageRegistry:(id)a4
{
  id v6;
  NSData *v7;
  NSData *xattrSignature;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "brc_signature");
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  xattrSignature = self->_xattrSignature;
  self->_xattrSignature = v7;

  if (v9 && v6)
    objc_msgSend(v6, "saveXattrBlob:forSignature:error:", v9, self->_xattrSignature, 0);

}

- (BRCPackageItem)initWithPBItem:(id)a3 forLocalItem:(id)a4
{
  id v6;
  id v7;
  BRCPackageItem *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *pathInPackage;
  void *v14;
  uint64_t v15;
  NSData *quarantineInfo;
  void *v17;
  int type;
  void *v19;
  uint64_t v20;
  NSString *symlinkContent;
  void *v22;
  int v23;
  void *v24;
  int v25;
  BRCGenerationID *v26;
  BRCGenerationID *generationID;
  void *v28;
  void *v29;
  uint64_t v30;
  NSData *contentSignature;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)BRCPackageItem;
  v8 = -[BRCPackageItem init](&v36, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "st");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "documentID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_packageID = objc_msgSend(v10, "unsignedLongLongValue");

    objc_msgSend(v6, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = objc_claimAutoreleasedReturnValue();
    pathInPackage = v8->_pathInPackage;
    v8->_pathInPackage = (NSString *)v12;

    v8->_fileID = objc_msgSend(v6, "fileID");
    objc_msgSend(v6, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "quarantineInfo");
    v15 = objc_claimAutoreleasedReturnValue();
    quarantineInfo = v8->_quarantineInfo;
    v8->_quarantineInfo = (NSData *)v15;

    objc_msgSend(v6, "item");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_type = objc_msgSend(v17, "type");

    type = v8->_type;
    if (type == 4)
    {
      v32 = v8;
      v8 = 0;
      goto LABEL_14;
    }
    if (type == 3)
    {
      objc_msgSend(v6, "item");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "symlinkContent");
      v20 = objc_claimAutoreleasedReturnValue();
      symlinkContent = v8->_symlinkContent;
      v8->_symlinkContent = (NSString *)v20;

      type = v8->_type;
    }
    if (type == 2)
    {
      v8->_mode = 0;
      objc_msgSend(v6, "item");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isWritable");

      if (v23)
        v8->_mode |= 1u;
      objc_msgSend(v6, "item");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isExecutable");

      if (v25)
        v8->_mode |= 2u;
      v26 = -[BRCGenerationID initWithFSGenerationID:]([BRCGenerationID alloc], "initWithFSGenerationID:", objc_msgSend(v6, "generationID"));
      generationID = v8->_generationID;
      v8->_generationID = v26;

      v8->_size = objc_msgSend(v6, "size");
      objc_msgSend(v6, "item");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_mtime = objc_msgSend(v28, "mtime");

      objc_msgSend(v6, "item");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "signature");
      v30 = objc_claimAutoreleasedReturnValue();
      contentSignature = v8->_contentSignature;
      v8->_contentSignature = (NSData *)v30;

    }
    if (objc_msgSend(v6, "hasXattrs"))
    {
      objc_msgSend(v6, "xattrs");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "session");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stageRegistry");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPackageItem _setXattrs:stageRegistry:](v8, "_setXattrs:stageRegistry:", v32, v34);

LABEL_14:
    }
  }

  return v8;
}

+ (id)packageItemsForItem:(id)a3 order:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v15 = 138412802;
    v16 = v6;
    v17 = 2048;
    v18 = objc_msgSend(v6, "dbRowID");
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_INFO, "[INFO] calling packageItemsForItem %@ item_rowid %llu%@", (uint8_t *)&v15, 0x20u);
  }

  objc_msgSend(v6, "st");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");
  objc_msgSend(v6, "db");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "packageItemsForDocumentID:order:db:", v11, a4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)packageItemsForFileObjectID:(id)a3 order:(unint64_t)a4 db:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  objc_msgSend(a1, "packageItemsForDocumentID:order:db:", objc_msgSend(a3, "rawID"), a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int)type
{
  return self->_type;
}

- (int64_t)assetRank
{
  return self->_assetRank;
}

- (unint64_t)packageDocumentID
{
  return self->_packageID;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (BRCGenerationID)generationID
{
  return self->_generationID;
}

- (NSString)pathInPackage
{
  return self->_pathInPackage;
}

- (int64_t)mtime
{
  return self->_mtime;
}

- (char)mode
{
  return self->_mode;
}

- (int64_t)size
{
  return self->_size;
}

- (NSData)quarantineInfo
{
  return self->_quarantineInfo;
}

- (NSData)xattrSignature
{
  return self->_xattrSignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xattrSignature, 0);
  objc_storeStrong((id *)&self->_quarantineInfo, 0);
  objc_storeStrong((id *)&self->_contentSignature, 0);
  objc_storeStrong((id *)&self->_symlinkContent, 0);
  objc_storeStrong((id *)&self->_pathInPackage, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
}

- (BRCPackageItem)initWithRelativePath:(id)a3 markDirty:(BOOL)a4
{
  id v6;
  BRCPackageItem *v7;
  void *v8;
  uint64_t v9;
  NSString *pathInPackage;
  BRCPackageItem *v11;
  uint64_t v12;
  void *symlinkContent;
  uint64_t v14;
  BRCGenerationID *generationID;
  void *v16;
  void *v17;
  _QWORD v19[4];
  BRCPackageItem *v20;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCPackageItem;
  v7 = -[BRCPackageItem init](&v21, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "pathOfPackageRoot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_packageID = objc_msgSend(v8, "documentID");

    objc_msgSend(v6, "pathRelativeToPackageRoot");
    v9 = objc_claimAutoreleasedReturnValue();
    pathInPackage = v7->_pathInPackage;
    v7->_pathInPackage = (NSString *)v9;

    v7->_fileID = objc_msgSend(v6, "fileID");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __66__BRCPackageItem_LegacyAdditions__initWithRelativePath_markDirty___block_invoke;
    v19[3] = &unk_1E875EF40;
    v11 = v7;
    v20 = v11;
    objc_msgSend(v6, "performOnOpenFileDescriptor:error:", v19, 0);
    if (objc_msgSend(v6, "isUnixDir"))
    {
      v11->_type = 1;
    }
    else
    {
      if (objc_msgSend(v6, "isSymLink"))
      {
        v11->_type = 3;
        objc_msgSend(v6, "symlinkContent");
        v12 = objc_claimAutoreleasedReturnValue();
        symlinkContent = v11->_symlinkContent;
        v11->_symlinkContent = (NSString *)v12;
LABEL_13:

        goto LABEL_14;
      }
      v11->_type = 2;
      v11->_mode = 0;
      if (objc_msgSend(v6, "isWritable"))
        v11->_mode |= 1u;
      if (objc_msgSend(v6, "isExecutable") && objc_msgSend(v6, "isFile"))
        v11->_mode |= 2u;
      objc_msgSend(v6, "generationID");
      v14 = objc_claimAutoreleasedReturnValue();
      generationID = v11->_generationID;
      v11->_generationID = (BRCGenerationID *)v14;

      v11->_size = objc_msgSend(v6, "size");
      v11->_mtime = objc_msgSend(v6, "modificationTime");
      v11->_isDirty = a4;
    }
    objc_msgSend(v6, "xattrs");
    symlinkContent = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stageRegistry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCPackageItem _setXattrs:stageRegistry:](v11, "_setXattrs:stageRegistry:", symlinkContent, v17);

    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

uint64_t __66__BRCPackageItem_LegacyAdditions__initWithRelativePath_markDirty___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  BRCCopyFakeQuarantineInfo(a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v3;

  return 0;
}

+ (BOOL)_rescanDirectoryInPackage:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  BRCPackageItem *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  BOOL v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  id *v38;
  void *v39;
  NSObject *v40;
  const char *v42;
  char *v43;
  const char *v44;
  void *v45;
  NSObject *v46;
  char *v47;
  void *v48;
  void *v50;
  id v51;
  int __errnum;
  unsigned int v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isPackageRoot") & 1) == 0 && (objc_msgSend(v4, "isInPackage") & 1) == 0)
  {
    brc_bread_crumbs();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      +[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:].cold.4();

  }
  v53 = 0;
  v5 = -[BRCDirectoryEnumerator initForEnumeratingBelow:recursive:error:]([BRCDirectoryEnumerator alloc], "initForEnumeratingBelow:recursive:error:", v4, 1, &v53);
  if (!v5)
  {
    if (v53 == 45)
    {
      brc_bread_crumbs();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        +[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:].cold.1();

      v29 = 1;
    }
    else
    {
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        +[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:].cold.2();

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v53);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        brc_bread_crumbs();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
        {
          v44 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v55 = "+[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:]";
          v56 = 2080;
          if (!a4)
            v44 = "(ignored by caller)";
          v57 = (id)v44;
          v58 = 2112;
          v59 = v8;
          v60 = 2112;
          v61 = v32;
          _os_log_error_impl(&dword_1CBD43000, v33, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
      {
        v8 = objc_retainAutorelease(v8);
        v29 = 0;
        *a4 = v8;
      }
      else
      {
        v29 = 0;
      }
    }
    goto LABEL_48;
  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:].cold.3();

  v48 = v4;
  objc_msgSend(v4, "session");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v50 = 0;
  v10 = 0;
  v11 = "+[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:]";
  do
  {
    v12 = v10;
    objc_msgSend(v5, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      break;
    v13 = (void *)MEMORY[0x1D17A6BE8]();
    __errnum = 0;
    if ((objc_msgSend(v10, "resolveAndKeepOpenMustExist:error:", 1, &__errnum) & 1) != 0)
    {
      v14 = -[BRCPackageItem initWithRelativePath:markDirty:]([BRCPackageItem alloc], "initWithRelativePath:markDirty:", v10, 0);
      if (objc_msgSend(v10, "documentID"))
      {
        v15 = v11;
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v55 = (const char *)v10;
          v56 = 2112;
          v57 = v16;
          _os_log_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Package items are not supposed to have documentID, but %@ does, cleaning up!%@", buf, 0x16u);
        }
        v18 = v8;

        v19 = v50;
        if (!v50)
        {
          objc_msgSend(MEMORY[0x1E0D25D48], "manager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v10, "physicalURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v19;
        v51 = v9;
        v21 = objc_msgSend(v19, "deallocateDocumentIDOfItemAtURL:error:", v20, &v51);
        v22 = v51;

        if ((v21 & 1) == 0)
        {
          brc_bread_crumbs();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v48, "physicalURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "path");
            v47 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v55 = v47;
            v56 = 2112;
            v57 = v22;
            v58 = 2112;
            v59 = v25;
            _os_log_fault_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to deallocate documentID at %@: %@%@", buf, 0x20u);

          }
          v24 = 1;
          v9 = v22;
          v8 = v18;
          v11 = v15;
          goto LABEL_22;
        }
        v9 = v22;
        v8 = v18;
        v11 = v15;
      }
      -[BRCPackageItem saveToDBWithSession:](v14, "saveToDBWithSession:", v8);
      objc_msgSend(v10, "close");
    }
    else
    {
      if (__errnum != 45)
      {
        brc_bread_crumbs();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
        {
          v43 = strerror(__errnum);
          *(_DWORD *)buf = 138412802;
          v55 = (const char *)v10;
          v56 = 2080;
          v57 = v43;
          v58 = 2112;
          v59 = v34;
          _os_log_error_impl(&dword_1CBD43000, v35, (os_log_type_t)0x90u, "[ERROR] can't snapshot package item at %@: %s%@", buf, 0x20u);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 16);
        v36 = objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v13);
        v9 = (void *)v36;
        break;
      }
      brc_bread_crumbs();
      v14 = (BRCPackageItem *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v55 = (const char *)v10;
        v56 = 2112;
        v57 = v14;
        _os_log_debug_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring excluded package item at %@%@", buf, 0x16u);
      }

    }
    v24 = 0;
LABEL_22:

    objc_autoreleasePoolPop(v13);
  }
  while (!v24);
  if (v9)
  {
    v37 = v9;
    v38 = a4;
    goto LABEL_43;
  }
  v37 = 0;
  v29 = 1;
  v38 = a4;
  if (v53)
  {
    if (v53 != 45)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
LABEL_43:
        brc_bread_crumbs();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, (os_log_type_t)0x90u))
        {
          v42 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v55 = "+[BRCPackageItem(LegacyAdditions) _rescanDirectoryInPackage:error:]";
          v56 = 2080;
          if (!v38)
            v42 = "(ignored by caller)";
          v57 = (id)v42;
          v58 = 2112;
          v59 = v37;
          v60 = 2112;
          v61 = v39;
          _os_log_error_impl(&dword_1CBD43000, v40, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

        v29 = 0;
      }
    }
  }
  if (v38)
    *v38 = objc_retainAutorelease(v37);

  v4 = v48;
LABEL_48:

  return v29;
}

+ (BOOL)_deleteSnapshotAtPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  uint8_t buf[4];
  _BYTE v22[28];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "appLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "execute:", CFSTR("DELETE FROM client_pkg_sizes WHERE item_doc_id = %u"), objc_msgSend(v5, "documentID")) & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      v16 = objc_msgSend(v5, "documentID");
      objc_msgSend(v7, "lastError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v22 = v16;
      *(_WORD *)&v22[4] = 2112;
      *(_QWORD *)&v22[6] = v17;
      *(_WORD *)&v22[14] = 2112;
      *(_QWORD *)&v22[16] = v8;
      _os_log_error_impl(&dword_1CBD43000, v9, (os_log_type_t)0x90u, "[ERROR] Could not delete package size aggregate entry for document %u: %@%@", buf, 0x1Cu);

    }
  }
  v10 = objc_msgSend(v7, "execute:", CFSTR("DELETE FROM client_pkg_items WHERE item_doc_id = %u"), objc_msgSend(v5, "documentID"));
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v7, "lastError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v18 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)v22 = "+[BRCPackageItem(LegacyAdditions) _deleteSnapshotAtPath:error:]";
        *(_WORD *)&v22[8] = 2080;
        if (!a4)
          v18 = "(ignored by caller)";
        *(_QWORD *)&v22[10] = v18;
        *(_WORD *)&v22[18] = 2112;
        *(_QWORD *)&v22[20] = v11;
        v23 = 2112;
        v24 = v13;
        _os_log_error_impl(&dword_1CBD43000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
    {
      v11 = objc_retainAutorelease(v11);
      *a4 = v11;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG) && objc_msgSend(v7, "changes") >= 1)
  {
    brc_bread_crumbs();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v19 = objc_msgSend(v7, "changes");
      v20 = objc_msgSend(v5, "documentID");
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)v22 = v19;
      *(_WORD *)&v22[8] = 1024;
      *(_DWORD *)&v22[10] = v20;
      *(_WORD *)&v22[14] = 2112;
      *(_QWORD *)&v22[16] = v11;
      _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %lld items in pkg:%u%@", buf, 0x1Cu);
    }

LABEL_16:
  }

  return v10;
}

+ (BOOL)updateSnapshotAtPath:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;
  BOOL v7;
  void *v9;
  NSObject *v10;

  v5 = a3;
  if ((objc_msgSend(v5, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[BRCPackageItem(LegacyAdditions) updateSnapshotAtPath:error:].cold.1();

  }
  if (objc_msgSend(v5, "exists") && (objc_msgSend(v5, "isPackageRoot") & 1) != 0)
  {
    if (!+[BRCPackageItem _deleteSnapshotAtPath:error:](BRCPackageItem, "_deleteSnapshotAtPath:error:", v5, a4))
    {
      v7 = 0;
      goto LABEL_8;
    }
    v6 = +[BRCPackageItem _rescanDirectoryInPackage:error:](BRCPackageItem, "_rescanDirectoryInPackage:error:", v5, a4);
  }
  else
  {
    v6 = +[BRCPackageItem _deleteSnapshotAtPath:error:](BRCPackageItem, "_deleteSnapshotAtPath:error:", v5, a4);
  }
  v7 = v6;
LABEL_8:

  return v7;
}

- (BOOL)changedAtRelpath:(id)a3
{
  id v4;
  int64_t size;
  int v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;

  v4 = a3;
  if (objc_msgSend(v4, "exists") && objc_msgSend(v4, "fileID") == self->_fileID)
  {
    switch(self->_type)
    {
      case 1:
        LODWORD(self) = objc_msgSend(v4, "isUnixDir") ^ 1;
        goto LABEL_20;
      case 2:
        if (!objc_msgSend(v4, "isFile"))
          break;
        size = self->_size;
        if (size != objc_msgSend(v4, "size"))
          break;
        v6 = objc_msgSend(v4, "isWritable");
        v7 = objc_msgSend(v4, "isExecutable");
        objc_msgSend(v4, "generationID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToGenerationID:orSignature:", self->_generationID, self->_contentSignature);

        if (!v9)
          break;
        v10 = v6 | 2;
        if (!v7)
          v10 = v6;
        LOBYTE(self) = self->_mode != v10;
        goto LABEL_20;
      case 3:
        if (!objc_msgSend(v4, "isSymLink"))
          break;
        self = (BRCPackageItem *)self->_symlinkContent;
        objc_msgSend(v4, "symlinkContent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(self) = -[BRCPackageItem isEqualToString:](self, "isEqualToString:", v11) ^ 1;

        goto LABEL_20;
      case 4:
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[BRCPackageItem(LegacyAdditions) changedAtRelpath:].cold.2();

        goto LABEL_16;
      default:
LABEL_16:
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          -[BRCPackageItem(LegacyAdditions) changedAtRelpath:].cold.1();

        break;
    }
  }
  LOBYTE(self) = 1;
LABEL_20:

  return (char)self;
}

- (BOOL)setDirty:(BOOL)a3 session:(id)a4
{
  char v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const __CFString *v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  BRCPackageItem *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_isDirty == a3)
    return 1;
  v5 = a3;
  v7 = a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    if (v5)
      v12 = CFSTR("YES");
    v14 = v12;
    v15 = 2112;
    v16 = self;
    v17 = 2112;
    v18 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Updating dirty status to %@ for %@%@", buf, 0x20u);
  }

  self->_isDirty = v5;
  objc_msgSend(v7, "clientDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v10, "execute:", CFSTR("UPDATE client_pkg_items SET is_dirty = %d WHERE item_doc_id = %llu AND rel_path = %@"), self->_isDirty, self->_packageID, self->_pathInPackage);
  return v4;
}

+ (BOOL)packageChangedAtRelativePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE *i;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  BOOL v12;
  BRCPackageItem *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _BYTE *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  char *v27;
  int v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  int v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  int v55;
  uint64_t v56[3];
  int __errnum;
  uint8_t buf[4];
  _BYTE v59[44];
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isInPackage") & 1) != 0)
  {
    objc_msgSend(v3, "pathOfPackageRoot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v4, "documentID");

  }
  else
  {
    v55 = objc_msgSend(v3, "documentID");
  }
  __errnum = 0;
  memset(v56, 0, sizeof(v56));
  __brc_create_section(0, (uint64_t)"+[BRCPackageItem(LegacyAdditions) packageChangedAtRelativePath:]", 287, v56);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)v59 = v56[0];
    *(_WORD *)&v59[8] = 1024;
    *(_DWORD *)&v59[10] = v55;
    *(_WORD *)&v59[14] = 2112;
    *(_QWORD *)&v59[16] = v3;
    *(_WORD *)&v59[24] = 2112;
    *(_QWORD *)&v59[26] = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx diffing package documentID:%u at %@%@", buf, 0x26u);
  }

  if ((objc_msgSend(v3, "isInPackage") & 1) == 0 && (objc_msgSend(v3, "isPackageRoot") & 1) == 0)
  {
    brc_bread_crumbs();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      +[BRCPackageItem(LegacyAdditions) packageChangedAtRelativePath:].cold.3();

  }
  if (!objc_msgSend(v3, "isInPackage"))
  {
    v13 = -[BRCDirectoryEnumerator initForEnumeratingBelow:recursive:error:]([BRCDirectoryEnumerator alloc], "initForEnumeratingBelow:recursive:error:", v3, 1, &__errnum);
    v14 = 0;
    v15 = 0;
    for (i = 0; ; i = v18)
    {
      if ((v14 & 1) != 0)
        goto LABEL_74;
      -[BRCPackageItem nextObject](v13, "nextObject");
      v16 = objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v12 = __errnum != 0;
        if (__errnum)
        {
          brc_bread_crumbs();
          v15 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", __errnum);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v59 = v3;
            *(_WORD *)&v59[8] = 2112;
            *(_QWORD *)&v59[10] = v37;
            *(_WORD *)&v59[18] = 2112;
            *(_QWORD *)&v59[20] = v15;
            _os_log_error_impl(&dword_1CBD43000, v36, (os_log_type_t)0x90u, "[ERROR] Failed iterating with directory enumerator at path %@: (%@)%@", buf, 0x20u);

          }
        }
        else
        {
          brc_bread_crumbs();
          v15 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            +[BRCPackageItem(LegacyAdditions) packageChangedAtRelativePath:].cold.2();
        }

        goto LABEL_75;
      }
      v15 = v16;
      v17 = (void *)MEMORY[0x1D17A6BE8]();
      if ((-[NSObject resolveAndKeepOpenMustExist:error:](v16, "resolveAndKeepOpenMustExist:error:", 0, &__errnum) & 1) != 0)
        break;
      if (__errnum == 45)
      {
        brc_bread_crumbs();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v59 = v16;
          *(_WORD *)&v59[8] = 2112;
          *(_QWORD *)&v59[10] = v23;
          _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring excluded package item at %@%@", buf, 0x16u);
        }

        v14 = 0;
        __errnum = 0;
      }
      else
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v27 = strerror(__errnum);
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)v59 = v16;
          *(_WORD *)&v59[8] = 2080;
          *(_QWORD *)&v59[10] = v27;
          *(_WORD *)&v59[18] = 2112;
          *(_QWORD *)&v59[20] = a1;
          *(_WORD *)&v59[28] = 2112;
          *(_QWORD *)&v59[30] = v25;
          _os_log_debug_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] can't read package item at %@: %s - not matching %@%@", buf, 0x2Au);
        }

        v14 = 1;
      }
      v18 = i;
LABEL_46:
      objc_autoreleasePoolPop(v17);
    }
    +[BRCPackageItem packageItemForRelpath:](BRCPackageItem, "packageItemForRelpath:", v16);
    v18 = (_BYTE *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      if (!objc_msgSend(v18, "changedAtRelpath:", v16))
      {
        v14 = 0;
LABEL_45:
        -[NSObject close](v15, "close");
        goto LABEL_46;
      }
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v21 = "dead";
        if (-[NSObject exists](v16, "exists"))
        {
          if (-[NSObject isFile](v16, "isFile"))
            v21 = "file";
          else
            v21 = "directory";
        }
        -[NSObject pathRelativeToPackageRoot](v16, "pathRelativeToPackageRoot");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)v59 = v21;
        *(_WORD *)&v59[8] = 2112;
        *(_QWORD *)&v59[10] = v22;
        *(_WORD *)&v59[18] = 1024;
        *(_DWORD *)&v59[20] = v55;
        *(_WORD *)&v59[24] = 2112;
        *(_QWORD *)&v59[26] = v15;
        *(_WORD *)&v59[34] = 2112;
        *(_QWORD *)&v59[36] = v18;
        v60 = 2112;
        v61 = v19;
        _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] %s at '%@' in package with documentID:%u doesn't match\n    %@\n    %@%@", buf, 0x3Au);

      }
    }
    else
    {
      if (!-[NSObject exists](v16, "exists"))
      {
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v32 = -[NSObject isFile](v16, "isFile");
          -[NSObject pathRelativeToPackageRoot](v16, "pathRelativeToPackageRoot");
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = (void *)v33;
          *(_DWORD *)buf = 136316162;
          v35 = "directory";
          if (v32)
            v35 = "file";
          *(_QWORD *)v59 = v35;
          *(_WORD *)&v59[8] = 2112;
          *(_QWORD *)&v59[10] = v33;
          *(_WORD *)&v59[18] = 1024;
          *(_DWORD *)&v59[20] = v55;
          *(_WORD *)&v59[24] = 2112;
          *(_QWORD *)&v59[26] = v15;
          *(_WORD *)&v59[34] = 2112;
          *(_QWORD *)&v59[36] = v19;
          _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] %s at '%@' in package with documentID:%u is missing in snapshot and on disk\n    %@%@", buf, 0x30u);

        }
        v14 = 0;
        goto LABEL_44;
      }
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v28 = -[NSObject isFile](v16, "isFile");
        -[NSObject pathRelativeToPackageRoot](v16, "pathRelativeToPackageRoot");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        *(_DWORD *)buf = 136316162;
        v31 = "directory";
        if (v28)
          v31 = "file";
        *(_QWORD *)v59 = v31;
        *(_WORD *)&v59[8] = 2112;
        *(_QWORD *)&v59[10] = v29;
        *(_WORD *)&v59[18] = 1024;
        *(_DWORD *)&v59[20] = v55;
        *(_WORD *)&v59[24] = 2112;
        *(_QWORD *)&v59[26] = v15;
        *(_WORD *)&v59[34] = 2112;
        *(_QWORD *)&v59[36] = v19;
        _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] %s at '%@' in package with documentID:%u is missing in snapshot\n    %@%@", buf, 0x30u);

      }
    }
    v14 = 1;
LABEL_44:

    goto LABEL_45;
  }
  +[BRCPackageItem packageItemForRelpath:](BRCPackageItem, "packageItemForRelpath:", v3);
  i = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (!i)
  {
    if ((objc_msgSend(v3, "exists") & 1) == 0)
    {
      brc_bread_crumbs();
      v13 = (BRCPackageItem *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v3, "pathRelativeToPackageRoot");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v59 = v55;
        *(_WORD *)&v59[4] = 2112;
        *(_QWORD *)&v59[6] = v48;
        *(_WORD *)&v59[14] = 2112;
        *(_QWORD *)&v59[16] = v13;
        _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] no package item for documentID:%u at '%@' already gone from disk%@", buf, 0x1Cu);

      }
      i = 0;
      goto LABEL_70;
    }
    v38 = v3;
    if ((objc_msgSend(v38, "isInPackage") & 1) == 0)
    {
      brc_bread_crumbs();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
        +[BRCPackageItem(LegacyAdditions) packageChangedAtRelativePath:].cold.1();

    }
    objc_msgSend(v38, "appLibrary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "db");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "pathOfPackageRoot");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "documentID");
    objc_msgSend(v38, "pathRelativeToPackageRoot");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "stringByDeletingLastPathComponent");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v40, "fetch:", CFSTR("SELECT file_id FROM client_pkg_items WHERE item_doc_id = %u AND rel_path = %@ AND is_dirty IS NULL"), v42, v44);

    if (objc_msgSend(v45, "next"))
    {
      objc_msgSend(v45, "close");

      v13 = -[BRCPackageItem initWithRelativePath:markDirty:]([BRCPackageItem alloc], "initWithRelativePath:markDirty:", v38, 1);
      objc_msgSend(v38, "session");
      v15 = objc_claimAutoreleasedReturnValue();
      -[BRCPackageItem saveToDBWithSession:](v13, "saveToDBWithSession:", v15);
    }
    else
    {

      brc_bread_crumbs();
      v13 = (BRCPackageItem *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v38, "pathRelativeToPackageRoot");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v59 = v55;
        *(_WORD *)&v59[4] = 2112;
        *(_QWORD *)&v59[6] = v49;
        *(_WORD *)&v59[14] = 2112;
        *(_QWORD *)&v59[16] = v13;
        _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] no package item for documentID:%u at '%@', will be scanned%@", buf, 0x1Cu);

      }
    }
    i = 0;
LABEL_74:
    v12 = 1;
    goto LABEL_75;
  }
  if ((objc_msgSend(v3, "resolveAndKeepOpenMustExist:error:", 1, &__errnum) & 1) == 0)
  {
    brc_bread_crumbs();
    v13 = (BRCPackageItem *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "pathRelativeToPackageRoot");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v59 = v55;
      *(_WORD *)&v59[4] = 2112;
      *(_QWORD *)&v59[6] = v46;
      *(_WORD *)&v59[14] = 2112;
      *(_QWORD *)&v59[16] = v13;
      _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] unable to reopen path for documentID:%u at '%@'%@", buf, 0x1Cu);

    }
    goto LABEL_74;
  }
  if (i[104] || objc_msgSend(i, "changedAtRelpath:", v3))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v59 = i;
      *(_WORD *)&v59[8] = 2112;
      *(_QWORD *)&v59[10] = v3;
      *(_WORD *)&v59[18] = 2112;
      *(_QWORD *)&v59[20] = v8;
      _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ doesn't match path %@%@", buf, 0x20u);
    }

    objc_msgSend(v3, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "setDirty:session:", 1, v10);

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v3, "close");
  if ((v11 & 1) == 0)
  {
    brc_bread_crumbs();
    v13 = (BRCPackageItem *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v59 = i;
      *(_WORD *)&v59[8] = 2112;
      *(_QWORD *)&v59[10] = v3;
      *(_WORD *)&v59[18] = 2112;
      *(_QWORD *)&v59[20] = v13;
      _os_log_debug_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ matches path %@%@", buf, 0x20u);
    }
LABEL_70:
    v12 = 0;
LABEL_75:

    goto LABEL_76;
  }
  v12 = 1;
LABEL_76:
  __brc_leave_section(v56);

  return v12;
}

+ (BRCPackageItem)packageItemWithDocumentID:(unsigned int)a3 relativePath:(id)a4 db:(id)a5
{
  return (BRCPackageItem *)(id)objc_msgSend(a5, "fetchObject:sql:", &__block_literal_global_63, CFSTR("SELECT item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs, signature_or_link, generation, size, mode, mtime FROM client_pkg_items WHERE item_doc_id = %u AND rel_path = %@"), *(_QWORD *)&a3, a4);
}

id __77__BRCPackageItem_LegacyAdditions__packageItemWithDocumentID_relativePath_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = -[BRCPackageItem initFromPQLResultSet:error:]([BRCPackageItem alloc], "initFromPQLResultSet:error:", v4, a3);

  return v5;
}

+ (id)packageItemForRelpath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "isPackageRoot"))
  {
    v5 = objc_msgSend(v4, "documentID");
  }
  else
  {
    objc_msgSend(v4, "pathOfPackageRoot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "documentID");

  }
  objc_msgSend(v4, "pathRelativeToPackageRoot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "packageItemWithDocumentID:relativePath:db:", v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (int64_t)largestPackageItemSizeInDocumentID:(unsigned int)a3 session:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = *(_QWORD *)&a3;
  objc_msgSend(a4, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT largest_file_size FROM client_pkg_sizes WHERE item_doc_id = %u"), v4);

  v7 = objc_msgSend(v6, "unsignedLongLongValue");
  return v7;
}

+ (id)packageItemsForDocumentID:(unsigned int)a3 order:(unint64_t)a4 db:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = v7;
  if (a4 == 1)
  {
    v9 = CFSTR("SELECT item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs, signature_or_link, generation, size, mode, mtime FROM client_pkg_items WHERE item_doc_id = %u ORDER BY asset_rank");
  }
  else
  {
    if (a4 != 2)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v9 = CFSTR("SELECT item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs, signature_or_link, generation, size, mode, mtime FROM client_pkg_items WHERE item_doc_id = %u ORDER BY rel_path");
  }
  v10 = (void *)objc_msgSend(v7, "fetch:", v9, v6);
LABEL_7:
  objc_msgSend(v10, "enumerateObjects:", &__block_literal_global_28_1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __70__BRCPackageItem_LegacyAdditions__packageItemsForDocumentID_order_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = -[BRCPackageItem initFromPQLResultSet:error:]([BRCPackageItem alloc], "initFromPQLResultSet:error:", v4, a3);

  return v5;
}

+ (int64_t)aggregatePackageSizeForPackageID:(unsigned int)a3 db:(id)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  int64_t v8;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a4, "numberWithSQL:", CFSTR("SELECT aggregate_size FROM client_pkg_sizes WHERE item_doc_id = %u"), *(_QWORD *)&a3);
  if (v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v11 = v5;
      v12 = 1024;
      v13 = a3;
      v14 = 2112;
      v15 = v6;
      _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] aggregate size is %@ for documentID:%u%@", buf, 0x1Cu);
    }

    v8 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5;
  BRCPackageItem *v6;
  uint64_t v7;
  NSString *pathInPackage;
  uint64_t v9;
  NSData *quarantineInfo;
  uint64_t v11;
  NSData *xattrSignature;
  int type;
  uint64_t v14;
  NSString *symlinkContent;
  uint64_t v16;
  NSData *contentSignature;
  uint64_t v18;
  BRCGenerationID *generationID;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCPackageItem;
  v6 = -[BRCPackageItem init](&v21, sel_init);
  if (v6)
  {
    v6->_packageID = objc_msgSend(v5, "longLongAtIndex:", 0);
    objc_msgSend(v5, "stringAtIndex:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
    pathInPackage = v6->_pathInPackage;
    v6->_pathInPackage = (NSString *)v7;

    v6->_type = objc_msgSend(v5, "intAtIndex:", 2);
    v6->_assetRank = objc_msgSend(v5, "longLongAtIndex:", 3);
    v6->_fileID = objc_msgSend(v5, "longLongAtIndex:", 4);
    v6->_isDirty = objc_msgSend(v5, "BOOLAtIndex:", 5);
    objc_msgSend(v5, "dataAtIndex:", 6);
    v9 = objc_claimAutoreleasedReturnValue();
    quarantineInfo = v6->_quarantineInfo;
    v6->_quarantineInfo = (NSData *)v9;

    objc_msgSend(v5, "dataAtIndex:", 7);
    v11 = objc_claimAutoreleasedReturnValue();
    xattrSignature = v6->_xattrSignature;
    v6->_xattrSignature = (NSData *)v11;

    type = v6->_type;
    if (type == 2)
    {
      objc_msgSend(v5, "dataAtIndex:", 8);
      v16 = objc_claimAutoreleasedReturnValue();
      contentSignature = v6->_contentSignature;
      v6->_contentSignature = (NSData *)v16;

      objc_msgSend(v5, "objectOfClass:atIndex:", objc_opt_class(), 9);
      v18 = objc_claimAutoreleasedReturnValue();
      generationID = v6->_generationID;
      v6->_generationID = (BRCGenerationID *)v18;

      v6->_size = objc_msgSend(v5, "unsignedLongLongAtIndex:", 10);
      v6->_mode = objc_msgSend(v5, "intAtIndex:", 11);
      v6->_mtime = objc_msgSend(v5, "longLongAtIndex:", 12);
    }
    else if (type == 3)
    {
      objc_msgSend(v5, "stringAtIndex:", 8);
      v14 = objc_claimAutoreleasedReturnValue();
      symlinkContent = v6->_symlinkContent;
      v6->_symlinkContent = (NSString *)v14;

    }
  }

  return v6;
}

+ (BOOL)updateSignaturesForFilesInItem:(id)a3 fromCKPackage:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[4];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = a4;
  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "st");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "documentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 1;
  objc_msgSend(v7, "clientDB");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "fetch:", CFSTR("SELECT asset_rank, generation  FROM client_pkg_items WHERE item_doc_id = %@ AND item_type = %d"), v11, 2);
  while (1)
  {

    if (!objc_msgSend(v13, "next"))
      break;
    objc_msgSend(v13, "numberAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectOfClass:atIndex:", objc_opt_class(), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "signature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v12);
    objc_msgSend(v8, "addIndex:", objc_msgSend(v12, "unsignedIntegerValue"));

  }
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__51;
  v41 = __Block_byref_object_dispose__51;
  v42 = 0;
  v16 = objc_msgSend(v27, "itemCount");
  if (v16 == objc_msgSend(v8, "count"))
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke;
    v28[3] = &unk_1E87677F8;
    v29 = v27;
    v34 = v43;
    v30 = v9;
    v31 = v6;
    v35 = &v44;
    v36 = &v37;
    v32 = v7;
    v33 = v11;
    objc_msgSend(v8, "enumerateIndexesUsingBlock:", v28);

    v17 = v29;
  }
  else
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v24 = objc_msgSend(v27, "itemCount");
      v25 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134218498;
      v49 = v24;
      v50 = 2048;
      v51 = v25;
      v52 = 2112;
      v53 = v18;
      _os_log_fault_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: wrong number of items in package. pkg [%lu] assetRanks [%lu]%@", buf, 0x20u);
    }

    *((_BYTE *)v45 + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], 17, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v38[5];
    v38[5] = v20;
  }

  v21 = *((unsigned __int8 *)v45 + 24);
  if (a5 && !*((_BYTE *)v45 + 24))
  {
    *a5 = objc_retainAutorelease((id)v38[5]);
    v21 = *((unsigned __int8 *)v45 + 24);
  }
  v22 = v21 != 0;
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v44, 8);

  return v22;
}

void __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1D17A6BE8]();
  v7 = *(void **)(a1 + 32);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  objc_msgSend(v7, "itemAtIndex:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "signature");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v34 = a2;
    v35 = 2112;
    v36 = v29;
    v37 = 2112;
    v38 = v8;
    v39 = 2112;
    v40 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning signature for rank %ld, signature:%@, asset %@%@", buf, 0x2Au);

  }
  objc_msgSend(v8, "signature");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (!v11)
      goto LABEL_6;
  }
  else
  {
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_2();

    if (!v11)
      goto LABEL_6;
  }
  objc_msgSend(v8, "signature");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "isEqualToData:", v15);

  if ((v16 & 1) == 0)
  {
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 48), "itemID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v30;
      v35 = 2048;
      v36 = a2;
      v37 = 2112;
      v38 = v25;
      _os_log_debug_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] Failing updates of signatures for item %@ because pkg item with rank %lu changed%@", buf, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    *a3 = 1;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], 17, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v23 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;
    goto LABEL_13;
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 56), "clientDB");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signature");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v17, "execute:", CFSTR("UPDATE client_pkg_items SET signature_or_link = %@ WHERE item_doc_id = %@ AND asset_rank = %ld"), v18, *(_QWORD *)(a1 + 64), a2);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    *a3 = 1;
    objc_msgSend(*(id *)(a1 + 56), "clientDB");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastError");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_1();

LABEL_13:
  }

  objc_autoreleasePoolPop(v6);
}

- (BOOL)saveToDBWithSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t (*v6)(uint64_t, void *, uint64_t);
  uint64_t *v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  NSObject *v27;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  uint64_t (**v34)(_QWORD, _QWORD, _QWORD);
  _QWORD v35[4];
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  BRCPackageItem *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_assetRank)
  {
    +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_assetRank = objc_msgSend(v5, "allocatePackageItemRank");

  }
  switch(self->_type)
  {
    case 1:
      v38 = MEMORY[0x1E0C809B0];
      v6 = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_2;
      v7 = &v38;
      goto LABEL_7;
    case 2:
      v39 = MEMORY[0x1E0C809B0];
      v6 = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke;
      v7 = &v39;
      goto LABEL_7;
    case 3:
      v37 = MEMORY[0x1E0C809B0];
      v6 = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_3;
      v7 = &v37;
LABEL_7:
      v7[1] = 3221225472;
      v7[2] = (uint64_t)v6;
      v7[3] = (uint64_t)&unk_1E8767820;
      v7[4] = (uint64_t)self;
      v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17A6DB0]();
      if (!v8)
        goto LABEL_8;
      goto LABEL_11;
    case 4:
      brc_bread_crumbs();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v41 = self;
        v42 = 2112;
        v43 = v29;
        _os_log_impl(&dword_1CBD43000, v30, OS_LOG_TYPE_DEFAULT, "[NOTICE] Ignoring tombstone pkg item %@%@", buf, 0x16u);
      }

      brc_bread_crumbs();
      v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:].cold.4();
      v17 = 1;
      goto LABEL_24;
    default:
LABEL_8:
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:].cold.3();

      v8 = 0;
LABEL_11:
      objc_msgSend(v4, "clientDB");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sqliteErrorHandler");
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "clientDB");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_66;
      v35[3] = &unk_1E875E3F0;
      v15 = (id)v12;
      v36 = v15;
      LOBYTE(v12) = ((uint64_t (**)(_QWORD, void *, _QWORD *))v8)[2](v8, v13, v35);

      if ((v12 & 1) != 0)
        goto LABEL_12;
      objc_msgSend(v4, "clientDB");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isSqliteErrorCode:", 19);

      if (!v21)
        goto LABEL_18;
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v41 = self;
        v42 = 2112;
        v43 = v22;
        _os_log_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEFAULT, "[NOTICE] Overriding an already declared item %@%@", buf, 0x16u);
      }

      objc_msgSend(v4, "clientDB");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v14;
      v33[1] = 3221225472;
      v33[2] = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_68;
      v33[3] = &unk_1E8765938;
      v33[4] = self;
      v34 = v8;
      v25 = objc_msgSend(v24, "groupInTransaction:", v33);

      if (v25)
      {
LABEL_12:
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 1;
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:].cold.1();
      }
      else
      {
LABEL_18:
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
        {
          objc_msgSend(v4, "clientDB");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "lastError");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v41 = self;
          v42 = 2112;
          v43 = v32;
          v44 = 2112;
          v45 = v26;
          _os_log_error_impl(&dword_1CBD43000, v27, (os_log_type_t)0x90u, "[ERROR] failed to save item %@ to DB: %@%@", buf, 0x20u);

        }
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:].cold.2();
        v17 = 0;
      }

LABEL_24:
      return v17;
  }
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x1E0C9AAB0];
  if (!*(_BYTE *)(v3 + 104))
    v4 = 0;
  return objc_msgSend(a2, "executeWithErrorHandler:sql:", a3, CFSTR("INSERT INTO client_pkg_items (item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs, signature_or_link, generation, size, mode, mtime) VALUES (%llu, %@, %u, %llu, %llu, %@, %@, %@, %@, %@, %llu, %u, %llu)"), *(_QWORD *)(v3 + 8), *(_QWORD *)(v3 + 32), *(unsigned int *)(v3 + 56), *(_QWORD *)(v3 + 64), *(_QWORD *)(v3 + 16), v4, *(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 96), *(_QWORD *)(v3 + 80), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 48), *(char *)(v3 + 60), *(_QWORD *)(v3 + 40));
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x1E0C9AAB0];
  if (!*(_BYTE *)(v3 + 104))
    v4 = 0;
  return objc_msgSend(a2, "executeWithErrorHandler:sql:", a3, CFSTR("INSERT INTO client_pkg_items (item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs) VALUES (%llu, %@, %u, %llu, %llu, %@, %@, %@)"), *(_QWORD *)(v3 + 8), *(_QWORD *)(v3 + 32), *(unsigned int *)(v3 + 56), *(_QWORD *)(v3 + 64), *(_QWORD *)(v3 + 16), v4, *(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 96));
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x1E0C9AAB0];
  if (!*(_BYTE *)(v3 + 104))
    v4 = 0;
  return objc_msgSend(a2, "executeWithErrorHandler:sql:", a3, CFSTR("INSERT INTO client_pkg_items (item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs, signature_or_link) VALUES (%llu, %@, %u, %llu, %llu, %@, %@, %@, %@)"), *(_QWORD *)(v3 + 8), *(_QWORD *)(v3 + 32), *(unsigned int *)(v3 + 56), *(_QWORD *)(v3 + 64), *(_QWORD *)(v3 + 16), v4, *(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 96), *(_QWORD *)(v3 + 72));
}

void __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_66(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isSqliteErrorCode:", 19) & 1) == 0)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);
  }

}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "execute:", CFSTR("DELETE FROM client_pkg_items WHERE item_doc_id = %llu AND rel_path = %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)))v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    v4 = 0;

  return v4;
}

+ (BOOL)dumpSession:(id)a3 toContext:(id)a4 db:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(v11, "fetch:", CFSTR("SELECT item_doc_id, rel_path, item_type, asset_rank, file_id, is_dirty, quarantine_info, xattrs, signature_or_link, generation, size, mode, mtime  FROM client_pkg_items  ORDER BY item_doc_id, rel_path"));
  objc_msgSend(v10, "writeLineWithFormat:", CFSTR("client_pkg_items"));
  objc_msgSend(v10, "writeLineWithFormat:", CFSTR("================"));
  if (objc_msgSend(v12, "next"))
  {
    do
    {
      v13 = (void *)MEMORY[0x1D17A6BE8]();
      v14 = -[BRCPackageItem initFromPQLResultSet:error:]([BRCPackageItem alloc], "initFromPQLResultSet:error:", v12, 0);
      objc_msgSend(v10, "writeLineWithFormat:", CFSTR("%@"), v14);

      objc_autoreleasePoolPop(v13);
    }
    while ((objc_msgSend(v12, "next") & 1) != 0);
  }
  objc_msgSend(v10, "writeLineWithFormat:", &stru_1E8769030);
  objc_msgSend(v12, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v12, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v22 = "+[BRCPackageItem(DatabaseMethods) dumpSession:toContext:db:error:]";
        v23 = 2080;
        if (!a6)
          v20 = "(ignored by caller)";
        v24 = v20;
        v25 = 2112;
        v26 = v16;
        v27 = 2112;
        v28 = v17;
        _os_log_error_impl(&dword_1CBD43000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a6)
      *a6 = objc_retainAutorelease(v16);

  }
  return v15 == 0;
}

- (void)symlinkContent
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: self.isSymLink%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)contentSignature
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: self.isFile%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)description
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] UNREACHABLE: no BRCPackageItem should be a Tombstone%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: updating asset signature should work%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: cpi.signature%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
