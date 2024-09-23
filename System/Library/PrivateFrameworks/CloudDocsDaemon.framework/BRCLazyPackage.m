@implementation BRCLazyPackage

- (BRCLazyPackage)initWithRegistry:(id)a3 stageID:(id)a4 name:(id)a5 boundaryKey:(id)a6
{
  BRCStageRegistry *v10;
  NSString *v11;
  NSString *v12;
  NSData *v13;
  BRCLazyPackage *v14;
  BRCStageRegistry *registry;
  BRCStageRegistry *v16;
  NSString *stageID;
  NSString *v18;
  NSString *name;
  NSString *v20;
  NSData *boundaryKey;
  objc_super v23;

  v10 = (BRCStageRegistry *)a3;
  v11 = (NSString *)a4;
  v12 = (NSString *)a5;
  v13 = (NSData *)a6;
  v23.receiver = self;
  v23.super_class = (Class)BRCLazyPackage;
  v14 = -[BRCLazyPackage init](&v23, sel_init);
  registry = v14->_registry;
  v14->_registry = v10;
  v16 = v10;

  stageID = v14->_stageID;
  v14->_stageID = v11;
  v18 = v11;

  name = v14->_name;
  v14->_name = v12;
  v20 = v12;

  boundaryKey = v14->_boundaryKey;
  v14->_boundaryKey = v13;

  return v14;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  id v6;
  CKPackage *package;
  char v8;
  void *v9;
  NSData *boundaryKey;
  CKPackage *v11;
  id v12;
  CKPackage *v13;
  CKPackage *v14;
  BOOL v15;
  id v16;
  CKPackage *v17;
  char v18;
  void *v19;
  NSObject *v20;
  void *v22;
  NSObject *v23;
  CKPackage *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  CKPackage *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  CKPackage *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  package = self->_package;
  if (package)
    goto LABEL_2;
  -[BRCStageRegistry createURLForUploadWithStageID:name:](self->_registry, "createURLForUploadWithStageID:name:", self->_stageID, self->_name);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  boundaryKey = self->_boundaryKey;
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0C94FC8], "br_packageWithBoundaryKey:error:", boundaryKey, &v32);
  v11 = (CKPackage *)objc_claimAutoreleasedReturnValue();
  v12 = v32;
  v13 = self->_package;
  self->_package = v11;

  v14 = self->_package;
  if (!v14)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      -[BRCLazyPackage addItem:error:].cold.1((uint64_t)v12, (uint64_t)v19, v20);

    if (!a4)
      goto LABEL_11;
LABEL_10:
    v12 = objc_retainAutorelease(v12);
    *a4 = v12;
LABEL_11:

    v8 = 0;
    goto LABEL_12;
  }
  v31 = v12;
  v15 = -[CKPackage anchorAtURL:error:](v14, "anchorAtURL:error:", v9, &v31);
  v16 = v31;

  if (!v15)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_package;
      objc_msgSend(v9, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v34 = v24;
      v35 = 2112;
      v36 = v25;
      v37 = 2112;
      v38 = v16;
      v39 = 2112;
      v40 = v22;
      _os_log_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to anchor package %@ at %@: %@%@", buf, 0x2Au);

    }
    v12 = v16;
    if (!a4)
      goto LABEL_11;
    goto LABEL_10;
  }
  v17 = self->_package;
  v30 = v16;
  v18 = -[CKPackage openWithError:](v17, "openWithError:", &v30);
  v12 = v30;

  if ((v18 & 1) == 0)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = self->_package;
      objc_msgSend(v9, "path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v34 = v28;
      v35 = 2112;
      v36 = v29;
      v37 = 2112;
      v38 = v12;
      v39 = 2112;
      v40 = v26;
      _os_log_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to open package %@ at %@: %@%@", buf, 0x2Au);

    }
    if (!a4)
      goto LABEL_11;
    goto LABEL_10;
  }

  package = self->_package;
LABEL_2:
  v8 = -[CKPackage addItem:](package, "addItem:", v6);
LABEL_12:

  return v8;
}

- (id)closeAndReturn
{
  CKPackage *package;

  package = self->_package;
  if (package)
  {
    -[CKPackage close](package, "close");
    package = self->_package;
  }
  return package;
}

- (unint64_t)itemCount
{
  unint64_t result;

  result = (unint64_t)self->_package;
  if (result)
    return objc_msgSend((id)result, "itemCount");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundaryKey, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_stageID, 0);
  objc_storeStrong((id *)&self->_registry, 0);
}

- (void)addItem:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1CBD43000, log, (os_log_type_t)0x90u, "[ERROR] Failed to create package: %@%@", (uint8_t *)&v3, 0x16u);
}

@end
