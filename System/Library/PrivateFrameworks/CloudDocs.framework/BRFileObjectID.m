@implementation BRFileObjectID

+ (BRFileObjectID)fileObjectIDWithString:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  BRDbRowObjectID *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  int v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  unint64_t v18;
  BRDocObjectID *v19;
  BRDocObjectID *v20;
  void *v22;
  NSObject *v23;

  v3 = a3;
  v5 = BRIsFPFSEnabled(v3, v4);
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CAABA8]))
  {
    if (v5 && objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CAAB30]))
    {
      v6 = [BRDbRowObjectID alloc];
      goto LABEL_7;
    }
    if (!objc_msgSend(v3, "length"))
    {
      if (v3)
        v12 = 0;
      else
        v12 = v5;
      if ((v12 & 1) == 0)
      {
        brc_bread_crumbs((uint64_t)"+[BRFileObjectID fileObjectIDWithString:]", 344);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
          +[BRFileObjectID fileObjectIDWithString:].cold.1();

      }
      goto LABEL_39;
    }
    v9 = (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    v10 = v9;
    v11 = *v9;
    if (v11 <= 104)
    {
      if (v11 != 97)
      {
        if (v11 == 100)
        {
          v19 = -[BRDocObjectID initWithDocID:]([BRDocObjectID alloc], "initWithDocID:", strtoul(v9 + 1, 0, 16));
          goto LABEL_32;
        }
        if (v11 != 102)
        {
LABEL_36:
          brc_bread_crumbs((uint64_t)"+[BRFileObjectID fileObjectIDWithString:]", 333);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(0);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
            +[BRFileObjectID fileObjectIDWithString:].cold.1();

LABEL_39:
          v20 = 0;
          goto LABEL_33;
        }
      }
    }
    else if (v11 > 109)
    {
      if (v11 != 110)
      {
        if (v11 == 116)
        {
          brc_bread_crumbs((uint64_t)"+[BRFileObjectID fileObjectIDWithString:]", 330);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(0);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            +[BRFileObjectID fileObjectIDWithString:].cold.3();

          v6 = [BRDbRowObjectID alloc];
          goto LABEL_3;
        }
        goto LABEL_36;
      }
    }
    else
    {
      if (v11 == 105)
      {
        v19 = -[BRInodeObjectID initWithFileID:]([BRInodeObjectID alloc], "initWithFileID:", strtoull(v9 + 1, 0, 16));
        goto LABEL_32;
      }
      if (v11 != 108)
        goto LABEL_36;
    }
    v17 = +[BRFileObjectTypeConverter toBRFileObjectIDType:](BRFileObjectTypeConverter, "toBRFileObjectIDType:", (char)v11);
    v18 = strtoul(v10 + 1, 0, 16);
    v6 = [BRDbRowObjectID alloc];
    v7 = v18;
    v8 = v17;
    goto LABEL_31;
  }
  v6 = [BRDbRowObjectID alloc];
  if (!v5)
  {
LABEL_7:
    v7 = 1;
    v8 = 1;
    goto LABEL_31;
  }
LABEL_3:
  v7 = 0;
  v8 = 0;
LABEL_31:
  v19 = -[BRDbRowObjectID initWithRowID:type:](v6, "initWithRowID:type:", v7, v8);
LABEL_32:
  v20 = v19;
LABEL_33:

  return (BRFileObjectID *)v20;
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  -[BRFileObjectID asString](self, "asString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sqliteBind:index:", a3, v4);

}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "newFromSqliteValue:", a3);
  objc_msgSend((id)objc_opt_class(), "fileObjectIDWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "newFromSqliteStatement:atIndex:", a3, *(_QWORD *)&a4);
  objc_msgSend((id)objc_opt_class(), "fileObjectIDWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fileObjectIDForURL:(id)a3 allocateDocID:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  int v18;
  int v19;
  __int16 v20;
  int v21;
  int v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  void *v27;
  BRDocObjectID *v28;
  uint64_t v29;
  BRInodeObjectID *v30;
  __int128 v32;
  uint64_t v33;
  id v34;
  id v35;
  uint8_t v36[4];
  uint64_t v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint8_t buf[32];
  __int128 v43;
  uint64_t v44;
  uint64_t v45;

  v6 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v35 = 0;
  v8 = *MEMORY[0x1E0C99A00];
  v34 = 0;
  v9 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v35, v8, &v34);
  v10 = v35;
  v11 = v34;
  v12 = v11;
  if ((v9 & 1) == 0)
  {
    if (objc_msgSend(v11, "br_isCocoaErrorCode:", 260))
    {
      if (a5)
      {
        v13 = objc_retainAutorelease(v12);
LABEL_33:
        v27 = 0;
        *a5 = v13;
        goto LABEL_39;
      }
      goto LABEL_34;
    }
    brc_bread_crumbs((uint64_t)"+[BRFileObjectID fileObjectIDForURL:allocateDocID:error:]", 379);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v14;
      _os_log_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] can't get whether %@ is a package: %@%@", buf, 0x20u);

    }
  }
  v17 = objc_retainAutorelease(v7);
  v18 = open((const char *)objc_msgSend(v17, "fileSystemRepresentation"), 2129924);
  if (v18 < 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
LABEL_34:
    v27 = 0;
    goto LABEL_39;
  }
  v19 = v18;
  v33 = 0;
  v32 = xmmword_19CC7DAB4;
  v44 = 0;
  v43 = 0u;
  memset(buf, 0, sizeof(buf));
  if (fgetattrlist(v18, &v32, buf, 0x38uLL, 0x20u) < 0)
  {
LABEL_28:
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_30:
    close(v19);
    goto LABEL_34;
  }
  while (1)
  {
    v20 = WORD2(v43);
    v21 = WORD2(v43) & 0xF000;
    if (v21 != 0x4000)
      break;
    if ((objc_msgSend(v10, "BOOLValue") & 1) == 0)
    {
      v20 = WORD2(v43);
      goto LABEL_16;
    }
LABEL_24:
    if (HIDWORD(v43) || !v6 || fchflags(v19, WORD4(v43) | 0x40))
    {
      close(v19);
      v28 = [BRDocObjectID alloc];
      v29 = -[BRDocObjectID initWithDocID:](v28, "initWithDocID:", HIDWORD(v43));
      goto LABEL_38;
    }
    v32 = xmmword_19CC7DAB4;
    v33 = 0;
    v44 = 0;
    v43 = 0u;
    memset(buf, 0, sizeof(buf));
    if (fgetattrlist(v19, &v32, buf, 0x38uLL, 0x20u) < 0)
      goto LABEL_28;
  }
  if (v21 == 0x8000)
  {
    if ((char)buf[12] < 0)
    {
      if (fgetxattr(v19, "com.apple.clouddocs.security", 0, 0, 0, 0) != -1)
        goto LABEL_37;
      if (*__error() != 93)
      {
        brc_bread_crumbs((uint64_t)"+[BRFileObjectID fileObjectIDForURL:allocateDocID:error:]", 419);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = objc_msgSend(objc_retainAutorelease(v17), "fileSystemRepresentation");
          v26 = *__error();
          *(_DWORD *)v36 = 136315650;
          v37 = v25;
          v38 = 1024;
          v39 = v26;
          v40 = 2112;
          v41 = v23;
          _os_log_impl(&dword_19CBF0000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't read xattr at '%s' %{errno}d%@", v36, 0x1Cu);
        }

      }
    }
    goto LABEL_24;
  }
  if (v21 == 40960)
    goto LABEL_37;
LABEL_16:
  v22 = v20 & 0xF000;
  if (v22 == 0x8000)
    goto LABEL_24;
  if (v22 != 0x4000)
    goto LABEL_30;
LABEL_37:
  close(v19);
  v30 = [BRInodeObjectID alloc];
  v29 = -[BRInodeObjectID initWithFileID:](v30, "initWithFileID:", v44);
LABEL_38:
  v27 = (void *)v29;
LABEL_39:

  return v27;
}

- (BOOL)isFolderOrAliasID
{
  return 0;
}

- (BOOL)isDocumentID
{
  return 0;
}

- (NSNumber)folderID
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs((uint64_t)"-[BRFileObjectID folderID]", 480);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRFileObjectID folderID].cold.1();

  return 0;
}

- (NSNumber)documentID
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs((uint64_t)"-[BRFileObjectID documentID]", 486);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRFileObjectID documentID].cold.1();

  return 0;
}

- (NSNumber)itemDBRowID
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs((uint64_t)"-[BRFileObjectID itemDBRowID]", 492);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRFileObjectID itemDBRowID].cold.1();

  return 0;
}

- (NSString)asString
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs((uint64_t)"-[BRFileObjectID asString]", 499);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRFileObjectID asString].cold.1();

  return 0;
}

- (unint64_t)rawID
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs((uint64_t)"-[BRFileObjectID rawID]", 505);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRFileObjectID asString].cold.1();

  return 0;
}

- (unsigned)type
{
  return 5;
}

- (BOOL)isCloudDocsRoot
{
  return -[BRFileObjectID type](self, "type") == 1 && -[BRFileObjectID rawID](self, "rawID") == 1;
}

- (BOOL)isRootContainerItem
{
  return -[BRFileObjectID type](self, "type") == 0;
}

- (BOOL)isFpfsItem
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs((uint64_t)"-[BRFileObjectID isFpfsItem]", 526);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRFileObjectID asString].cold.1();

  return 0;
}

- (BOOL)isAppLibraryRoot
{
  void *v3;
  NSObject *v4;

  if ((BRIsFPFSEnabled(self, a2) & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRFileObjectID isAppLibraryRoot]", 533);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRFileObjectID isAppLibraryRoot].cold.1();

  }
  return -[BRFileObjectID type](self, "type") == 1;
}

- (BOOL)isAppLibraryDocumentsFolder
{
  void *v3;
  NSObject *v4;

  if ((BRIsFPFSEnabled(self, a2) & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRFileObjectID isAppLibraryDocumentsFolder]", 542);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRFileObjectID isAppLibraryDocumentsFolder].cold.1();

  }
  return -[BRFileObjectID type](self, "type") == 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs((uint64_t)"-[BRFileObjectID encodeWithCoder:]", 557);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_fault_impl(&dword_19CBF0000, v4, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: implemented in subclass%@", (uint8_t *)&v5, 0xCu);
  }

}

- (BRFileObjectID)initWithCoder:(id)a3
{
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs((uint64_t)"-[BRFileObjectID initWithCoder:]", 562);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_fault_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: implemented in subclass%@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (BOOL)isEqualToFileObjectID:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v4 = a3;
  if (v4 && (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    v7 = objc_msgSend(v4, "rawID");
    v6 = v7 == -[BRFileObjectID rawID](self, "rawID");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BRFileObjectID *v4;
  BOOL v5;

  v4 = (BRFileObjectID *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BRFileObjectID isEqualToFileObjectID:](self, "isEqualToFileObjectID:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL8 v4;
  unint64_t v5;

  v3 = objc_opt_class();
  v4 = v3 == objc_opt_class();
  v5 = -[BRFileObjectID rawID](self, "rawID");
  return v4 ^ HIDWORD(v5) ^ v5;
}

+ (void)fileObjectIDWithString:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] invalid string for fileObjectID: %@%@");
  OUTLINED_FUNCTION_1();
}

+ (void)fileObjectIDWithString:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: NSFileProviderRootContainerItemIdentifier should have special behavior while building fileObjectIDWithString%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)folderID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: asked the folderID of a document%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)documentID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: asked the documentID of a folder%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)itemDBRowID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: asked the item db rowid of an item which isn't in the client_items%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)asString
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: you should subclass%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isAppLibraryRoot
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: IsAppLibraryRoot called on non-fpfs code%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isAppLibraryDocumentsFolder
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: isAppLibraryDocumentsFolder called on non-fpfs code%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
