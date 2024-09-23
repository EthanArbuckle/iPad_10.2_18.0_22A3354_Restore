@implementation CacheManagementAsset

- (CacheManagementAsset)initWithRelativePath:(id)a3 identifier:(id)a4 expirationDate:(id)a5 contentType:(id)a6 metadata:(id)a7 priority:(int)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  CacheManagementAsset *v19;
  CacheManagementAsset *v20;
  double v21;
  NSObject *v22;
  CacheManagementAsset *v23;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v25 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v15 && objc_msgSend(v15, "length"))
  {
    v26.receiver = self;
    v26.super_class = (Class)CacheManagementAsset;
    v19 = -[CacheManagementAsset init](&v26, sel_init);
    v20 = v19;
    if (v19)
    {
      v19->_assetVersion = 2;
      if (v16)
        objc_msgSend(v16, "timeIntervalSinceReferenceDate");
      else
        v21 = nan("");
      v20->_expiration_date = v21;
      objc_storeStrong((id *)&v20->_contentType, a6);
      objc_storeStrong((id *)&v20->_metadata, a7);
      v20->_priority = a8;
      objc_storeStrong((id *)&v20->_relativePath, a3);
      objc_storeStrong((id *)&v20->_identifier, a4);
      v20->_consumed_date = nan("");
      v20->_download_start_date = nan("");
      v20->_download_completion_date = nan("");
      v20->_last_viewed_date = nan("");
    }
    self = v20;
    v23 = self;
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_error_impl(&dword_1A3662000, v22, OS_LOG_TYPE_ERROR, "parameter error relativePath: %@", buf, 0xCu);
    }

    v23 = 0;
  }

  return v23;
}

- (CacheManagementAsset)initWithFlattenedAsset:(id *)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  CacheManagementAsset *v13;
  char *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  int *v40;
  char *v41;
  NSObject *v42;
  char *v43;
  const char *v44;
  char *v46;
  char *v47;
  objc_super v48;
  uint8_t buf[4];
  char *v50;
  __int16 v51;
  char *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)CacheManagementAsset;
  v4 = -[CacheManagementAsset init](&v48, sel_init);
  if (!v4)
    goto LABEL_52;
  if (!a3)
  {
    CDGetLogHandle((uint64_t)"client");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v37 = "Parameter error, asset is NULL";
LABEL_37:
      v38 = v12;
      v39 = 2;
      goto LABEL_38;
    }
    goto LABEL_15;
  }
  if ((*(int64_t *)((_BYTE *)&a3->var10 + 1) & 0x8000000000000000) == 0
    && (*(int64_t *)((_BYTE *)&a3->var9 + 1) & 0x8000000000000000) == 0
    && (*(int64_t *)((_BYTE *)&a3->var8 + 1) & 0x8000000000000000) == 0
    && (*(_QWORD *)((_BYTE *)&a3->var6 + 1) & 0x8000000000000000) == 0)
  {
    CDGetLogHandle((uint64_t)"client");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      flattenedAssetDescription(&a3->var0);
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v6;
      _os_log_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEFAULT, "initWithFlattenedAsset: %@", buf, 0xCu);

    }
    *((_DWORD *)v4 + 3) = a3->var0;
    *((_QWORD *)v4 + 7) = *(_QWORD *)(&a3->var0 + 1);
    *((_QWORD *)v4 + 8) = *(_QWORD *)((char *)&a3->var1 + 4);
    *((_QWORD *)v4 + 9) = *(_QWORD *)((char *)&a3->var2 + 4);
    *((_QWORD *)v4 + 10) = *(_QWORD *)((char *)&a3->var3 + 4);
    *((_QWORD *)v4 + 11) = *(_QWORD *)((char *)&a3->var4 + 4);
    *((_DWORD *)v4 + 2) = HIDWORD(a3->var5);
    if (*(uint64_t *)((char *)&a3->var6 + 1) < 1)
    {
      v10 = 0;
    }
    else
    {
      v7 = (char *)&a3->var12 + 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", (char *)&a3->var12 + 1, 4);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)*((_QWORD *)v4 + 3);
      *((_QWORD *)v4 + 3) = v8;

      if (!*((_QWORD *)v4 + 3))
      {
        CDGetLogHandle((uint64_t)"client");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v50 = v7;
          v37 = "stringWithCString failed for %s";
          v38 = v12;
          v39 = 12;
LABEL_38:
          _os_log_error_impl(&dword_1A3662000, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      v10 = *(int *)((char *)&a3->var6 + 1);
    }
    if (*(uint64_t *)((char *)&a3->var8 + 1) >= 1)
    {
      v14 = (char *)&a3->var12 + v10 + 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)*((_QWORD *)v4 + 4);
      *((_QWORD *)v4 + 4) = v15;

      if (!*((_QWORD *)v4 + 4))
      {
        CDGetLogHandle((uint64_t)"client");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        v40 = __error();
        v41 = strerror(*v40);
        *(_DWORD *)buf = 136315394;
        v50 = v14;
        v51 = 2080;
        v52 = v41;
        v37 = "stringWithCString failed for %s : %s";
        v38 = v12;
        v39 = 22;
        goto LABEL_38;
      }
      v10 += *(_DWORD *)((char *)&a3->var8 + 1);
    }
    if (*(uint64_t *)((char *)&a3->var9 + 1) >= 1)
    {
      v17 = (char *)&a3->var12 + v10 + 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)*((_QWORD *)v4 + 5);
      *((_QWORD *)v4 + 5) = v18;

      if (!*((_QWORD *)v4 + 5))
      {
        CDGetLogHandle((uint64_t)"client");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v46 = *(char **)((char *)&a3->var9 + 1);
          *(_DWORD *)buf = 134218242;
          v50 = v46;
          v51 = 2080;
          v52 = v17;
          _os_log_error_impl(&dword_1A3662000, v42, OS_LOG_TYPE_ERROR, "stringWithCString failed for content type: [len: %zd] %s", buf, 0x16u);
        }

        goto LABEL_16;
      }
      v10 += *(_DWORD *)((char *)&a3->var9 + 1);
    }
    if (*(uint64_t *)((char *)&a3->var10 + 1) < 1)
      goto LABEL_27;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (char *)&a3->var12 + v10 + 1);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v4 + 6);
    *((_QWORD *)v4 + 6) = v20;

    if (*((_QWORD *)v4 + 6))
    {
      v10 += *(_DWORD *)((char *)&a3->var10 + 1);
LABEL_27:
      if (*(uint64_t *)((char *)&a3->var11 + 1) < 1
        || (v22 = (char *)&a3->var12 + v10 + 1,
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4),
            v23 = objc_claimAutoreleasedReturnValue(),
            v24 = (void *)*((_QWORD *)v4 + 2),
            *((_QWORD *)v4 + 2) = v23,
            v24,
            *((_QWORD *)v4 + 2)))
      {
        objc_msgSend(v4, "fullPath");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          v27 = objc_retainAutorelease(v25);
          if (objc_msgSend(v27, "fileSystemRepresentation"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v27), "fileSystemRepresentation"));
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = *((_QWORD *)v4 + 12);
            *((_QWORD *)v4 + 12) = v28;
LABEL_51:

LABEL_52:
            v13 = (CacheManagementAsset *)v4;
            goto LABEL_53;
          }
          CDGetLogHandle((uint64_t)"client");
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            goto LABEL_51;
          v47 = (char *)*((_QWORD *)v4 + 4);
          *(_DWORD *)buf = 138412290;
          v50 = v47;
          v44 = "Unable to get absolute path (fileSystemRepresentation) for %@";
        }
        else
        {
          CDGetLogHandle((uint64_t)"client");
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            goto LABEL_51;
          v43 = (char *)*((_QWORD *)v4 + 4);
          *(_DWORD *)buf = 138412290;
          v50 = v43;
          v44 = "Unable to get absolute path (NSURL) for %@";
        }
        _os_log_error_impl(&dword_1A3662000, v29, OS_LOG_TYPE_ERROR, v44, buf, 0xCu);
        goto LABEL_51;
      }
      CDGetLogHandle((uint64_t)"client");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_DWORD *)buf = 136315138;
      v50 = v22;
      v34 = "stringWithCString failed for display name: %s";
      v35 = v11;
      v36 = 12;
      goto LABEL_33;
    }
    CDGetLogHandle((uint64_t)"client");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v37 = "dataWithBytes failed for metadata";
      goto LABEL_37;
    }
LABEL_15:

    goto LABEL_16;
  }
  CDGetLogHandle((uint64_t)"client");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v30 = *(char **)((char *)&a3->var10 + 1);
    v31 = *(char **)((char *)&a3->var9 + 1);
    v32 = *(int64_t *)((char *)&a3->var8 + 1);
    v33 = *(_QWORD *)((char *)&a3->var6 + 1);
    *(_DWORD *)buf = 134218752;
    v50 = v30;
    v51 = 2048;
    v52 = v31;
    v53 = 2048;
    v54 = v32;
    v55 = 2048;
    v56 = v33;
    v34 = "Parameter error: asset values are invalid: metadata_len: %ld, content_type_len: %ld, relative_path_len: %ld, i"
          "dentifier_len: %ld";
    v35 = v11;
    v36 = 42;
LABEL_33:
    _os_log_error_impl(&dword_1A3662000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
  }
LABEL_13:

LABEL_16:
  v13 = 0;
LABEL_53:

  return v13;
}

- ($62504CD8620D4E4BE208444870B73508)createFlattenedAsset:(int64_t *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  size_t v12;
  void *v13;
  id v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char v35;
  NSObject *v36;
  id v37;
  int64_t v38;
  NSObject *v39;
  void *v40;
  char v41;
  NSObject *v42;
  id v43;
  void *v44;
  char v45;
  NSObject *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[CacheManagementAsset description](self, "description");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 138412290;
    v54 = (uint64_t)v48;
    _os_log_debug_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEBUG, "flattening %@", (uint8_t *)&v53, 0xCu);

  }
  -[CacheManagementAsset identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CacheManagementAsset identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "maximumLengthOfBytesUsingEncoding:", 4);

    if (v8 <= -2)
    {
      CDGetLogHandle((uint64_t)"client");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v53 = 134217984;
        v54 = 0;
        v10 = "identifier is too long: %ld";
LABEL_61:
        _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v53, 0xCu);
        goto LABEL_62;
      }
      goto LABEL_62;
    }
    v11 = v8 + 1;
    v12 = v8 + 90;
  }
  else
  {
    v11 = 0;
    v12 = 89;
  }
  -[CacheManagementAsset relativePath](self, "relativePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CacheManagementAsset relativePath](self, "relativePath");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = strlen((const char *)objc_msgSend(v14, "fileSystemRepresentation"));
    v16 = v15 + 1;

    if (v15 <= -2)
    {
      CDGetLogHandle((uint64_t)"client");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v53 = 134217984;
        v54 = v15 + 1;
        v10 = "relative_path_len too long: %ld";
        goto LABEL_61;
      }
LABEL_62:

      return 0;
    }
    v12 += v16;
  }
  else
  {
    v16 = 0;
  }
  -[CacheManagementAsset contentType](self, "contentType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CacheManagementAsset contentType](self, "contentType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "maximumLengthOfBytesUsingEncoding:", 4);
    v20 = v19 + 1;

    if (v19 <= -2)
    {
      CDGetLogHandle((uint64_t)"client");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v53 = 134217984;
        v54 = v19 + 1;
        v10 = "content type too long: %ld";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    v12 += v20;
  }
  else
  {
    v20 = 0;
  }
  -[CacheManagementAsset metadata](self, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[CacheManagementAsset metadata](self, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (v23 < 0)
    {
      CDGetLogHandle((uint64_t)"client");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v53 = 134217984;
        v54 = v23;
        v10 = "metadata too long: %ld";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    v12 += v23;
  }
  else
  {
    v23 = 0;
  }
  -[CacheManagementAsset displayName](self, "displayName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[CacheManagementAsset displayName](self, "displayName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "maximumLengthOfBytesUsingEncoding:", 4);
    v27 = v26 + 1;

    if (v26 <= -2)
    {
      CDGetLogHandle((uint64_t)"client");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v53 = 134217984;
        v54 = v26 + 1;
        v10 = "display name too long: %ld";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    v12 += v27;
  }
  else
  {
    v27 = 0;
  }
  v28 = (char *)malloc_type_malloc(v12, 0x3F5E4A8EuLL);
  if (v28)
  {
    *(_DWORD *)v28 = -[CacheManagementAsset assetVersion](self, "assetVersion");
    -[CacheManagementAsset expiration_date](self, "expiration_date");
    *(_QWORD *)(v28 + 4) = v29;
    -[CacheManagementAsset consumed_date](self, "consumed_date");
    *(_QWORD *)(v28 + 12) = v30;
    -[CacheManagementAsset download_start_date](self, "download_start_date");
    *(_QWORD *)(v28 + 20) = v31;
    -[CacheManagementAsset download_completion_date](self, "download_completion_date");
    *(_QWORD *)(v28 + 28) = v32;
    -[CacheManagementAsset last_viewed_date](self, "last_viewed_date");
    *(_QWORD *)(v28 + 36) = v33;
    *((_DWORD *)v28 + 11) = -[CacheManagementAsset priority](self, "priority");
    *(_QWORD *)(v28 + 49) = v11;
    *(_QWORD *)(v28 + 57) = v16;
    *(_QWORD *)(v28 + 65) = v20;
    *(_QWORD *)(v28 + 73) = v23;
    *(_QWORD *)(v28 + 81) = v27;
    if (v11)
    {
      -[CacheManagementAsset identifier](self, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "getCString:maxLength:encoding:", v28 + 89, *(_QWORD *)(v28 + 49), 4);

      if ((v35 & 1) == 0)
      {
        CDGetLogHandle((uint64_t)"client");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          -[CacheManagementAsset identifier](self, "identifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 138412290;
          v54 = (uint64_t)v49;
          _os_log_error_impl(&dword_1A3662000, v36, OS_LOG_TYPE_ERROR, "unable to copy identifier: %@", (uint8_t *)&v53, 0xCu);

        }
      }
      LODWORD(v11) = *(_DWORD *)(v28 + 49);
      v16 = *(_QWORD *)(v28 + 57);
    }
    if (v16 >= 1)
    {
      -[CacheManagementAsset relativePath](self, "relativePath");
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v38 = strlcpy(&v28[(int)v11 + 89], (const char *)objc_msgSend(v37, "fileSystemRepresentation"), *(_QWORD *)(v28 + 57));

      if (v16 <= v38)
      {
        CDGetLogHandle((uint64_t)"client");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          -[CacheManagementAsset relativePath](self, "relativePath");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 138412290;
          v54 = (uint64_t)v50;
          _os_log_error_impl(&dword_1A3662000, v39, OS_LOG_TYPE_ERROR, "unable to copy relative path: %@", (uint8_t *)&v53, 0xCu);

        }
      }
      LODWORD(v11) = v11 + *(_DWORD *)(v28 + 57);
    }
    if (*(uint64_t *)(v28 + 65) >= 1)
    {
      -[CacheManagementAsset contentType](self, "contentType");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "getCString:maxLength:encoding:", &v28[(int)v11 + 89], *(_QWORD *)(v28 + 65), 4);

      if ((v41 & 1) == 0)
      {
        CDGetLogHandle((uint64_t)"client");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          -[CacheManagementAsset contentType](self, "contentType");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 138412290;
          v54 = (uint64_t)v51;
          _os_log_error_impl(&dword_1A3662000, v42, OS_LOG_TYPE_ERROR, "unable to copy contentType: %@", (uint8_t *)&v53, 0xCu);

        }
      }
      LODWORD(v11) = v11 + *(_DWORD *)(v28 + 65);
    }
    if (*(uint64_t *)(v28 + 73) >= 1)
    {
      -[CacheManagementAsset metadata](self, "metadata");
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      memcpy(&v28[(int)v11 + 89], (const void *)objc_msgSend(v43, "bytes"), *(_QWORD *)(v28 + 73));

      LODWORD(v11) = v11 + *(_DWORD *)(v28 + 73);
    }
    if (*(uint64_t *)(v28 + 81) >= 1)
    {
      -[CacheManagementAsset displayName](self, "displayName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "getCString:maxLength:encoding:", &v28[(int)v11 + 89], *(_QWORD *)(v28 + 81), 4);

      if ((v45 & 1) == 0)
      {
        CDGetLogHandle((uint64_t)"client");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          -[CacheManagementAsset displayName](self, "displayName");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 138412290;
          v54 = (uint64_t)v52;
          _os_log_error_impl(&dword_1A3662000, v46, OS_LOG_TYPE_ERROR, "unable to copy displayName: %@", (uint8_t *)&v53, 0xCu);

        }
      }
    }
    if (a3)
      *a3 = v12;
  }
  return ($62504CD8620D4E4BE208444870B73508 *)v28;
}

+ (id)assetWithRelativePath:(id)a3 identifier:(id)a4 expirationDate:(id)a5 contentType:(id)a6 metadata:(id)a7 priority:(int)a8
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  CacheManagementAsset *v19;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  int *v26;
  char *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  char *v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v8 = *(_QWORD *)&a8;
  v34 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13 || !objc_msgSend(v13, "length"))
  {
    CDGetLogHandle((uint64_t)"client");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v13;
      _os_log_error_impl(&dword_1A3662000, v18, OS_LOG_TYPE_ERROR, "parameter error relativePath: %@", buf, 0xCu);
    }
    goto LABEL_7;
  }
  stripScheme(v13);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    fullPathToAsset(v13, v14);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      bzero(buf, 0x400uLL);
      v23 = objc_retainAutorelease(v22);
      if (realpath_DARWIN_EXTSN((const char *)objc_msgSend(v23, "fileSystemRepresentation"), (char *)buf))
      {

        goto LABEL_4;
      }
      CDGetLogHandle((uint64_t)"client");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_msgSend(objc_retainAutorelease(v23), "fileSystemRepresentation");
        v26 = __error();
        v27 = strerror(*v26);
        v28 = 136446466;
        v29 = v25;
        v30 = 2082;
        v31 = v27;
        _os_log_error_impl(&dword_1A3662000, v24, OS_LOG_TYPE_ERROR, "realpath failed for %{public}s : %{public}s", (uint8_t *)&v28, 0x16u);
      }

    }
    v18 = 0;
LABEL_7:
    v19 = 0;
    goto LABEL_8;
  }
LABEL_4:
  v19 = -[CacheManagementAsset initWithRelativePath:identifier:expirationDate:contentType:metadata:priority:]([CacheManagementAsset alloc], "initWithRelativePath:identifier:expirationDate:contentType:metadata:priority:", v13, v14, v15, v16, v17, v8);
LABEL_8:

  return v19;
}

+ (id)assetFromData:(id)a3
{
  return -[CacheManagementAsset initWithFlattenedAsset:]([CacheManagementAsset alloc], "initWithFlattenedAsset:", objc_msgSend(objc_retainAutorelease(a3), "bytes"));
}

+ (id)assetFromFile:(id)a3 withIdentifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  CDGetLogHandle((uint64_t)"client");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412802;
    v18 = objc_opt_class();
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    _os_log_debug_impl(&dword_1A3662000, v7, OS_LOG_TYPE_DEBUG, "assetFromFile: (%@) %@ withIdentifier: %@", (uint8_t *)&v17, 0x20u);
  }

  if (!v5 || !objc_msgSend(v5, "length"))
  {
    CDGetLogHandle((uint64_t)"client");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543362;
      v18 = (uint64_t)v5;
      _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "parameter error relativePath: %{public}@", (uint8_t *)&v17, 0xCu);
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  stripScheme(v5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    fullPathToAsset(v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_retainAutorelease(v12);
      objc_msgSend(v13, "stringWithUTF8String:", objc_msgSend(v14, "fileSystemRepresentation"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[CacheManagementAsset assetFromPath:withIdentifier:](CacheManagementAsset, "assetFromPath:withIdentifier:", v15, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = 0;
      goto LABEL_10;
    }
    CDGetLogHandle((uint64_t)"client");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543618;
      v18 = (uint64_t)v5;
      v19 = 2114;
      v20 = v6;
      _os_log_error_impl(&dword_1A3662000, v16, OS_LOG_TYPE_ERROR, "unable to create full path for relativePath: %{public}@, and identifier: %{public}@", (uint8_t *)&v17, 0x16u);
    }

    v9 = 0;
    goto LABEL_9;
  }
  v9 = v8;
  +[CacheManagementAsset assetFromPath:withIdentifier:](CacheManagementAsset, "assetFromPath:withIdentifier:", v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v10;
}

+ (id)assetFromPath:(id)a3 withIdentifier:(id)a4 createIfAbsent:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _DWORD *XAttr;
  _DWORD *v23;
  void *v24;
  CacheManagementAsset *v25;
  void *v26;
  _DWORD *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  NSObject *v50;
  _BOOL4 v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  uint64_t v74;
  int *v75;
  char *v76;
  id v77;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t v84[128];
  _BYTE buf[14];
  _BYTE v86[10];
  uint8_t v87[4];
  id v88;
  uint64_t v89;

  v5 = a5;
  v89 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7 && objc_msgSend(v7, "length"))
  {
    stripScheme(v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    nonContainerForID((uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    bzero(v87, 0x400uLL);
    if (!v9)
      v9 = v7;
    v11 = objc_retainAutorelease(v9);
    if (!realpath_DARWIN_EXTSN((const char *)-[NSObject fileSystemRepresentation](v11, "fileSystemRepresentation"), (char *)v87))
    {
      CDGetLogHandle((uint64_t)"client");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v74 = -[NSObject fileSystemRepresentation](objc_retainAutorelease(v11), "fileSystemRepresentation");
        v75 = __error();
        v76 = strerror(*v75);
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v74;
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)v86 = v76;
        _os_log_error_impl(&dword_1A3662000, v21, OS_LOG_TYPE_ERROR, "realpath failed for %{public}s : %{public}s", buf, 0x16u);
      }
      v20 = 0;
      goto LABEL_85;
    }
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v87);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      v79 = v10;
      v14 = objc_retainAutorelease(v10);
      objc_msgSend(v13, "stringWithUTF8String:", objc_msgSend(v14, "fileSystemRepresentation"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rangeOfString:", v15);
      v17 = v16;

      if (!v17)
      {
        CDGetLogHandle((uint64_t)"client");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = objc_msgSend(objc_retainAutorelease(v14), "fileSystemRepresentation");
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)v86 = v87;
          _os_log_error_impl(&dword_1A3662000, v21, OS_LOG_TYPE_ERROR, "Asset is not in expected location: %{public}s asset: %{public}s", buf, 0x16u);
        }
        v20 = 0;
        v10 = v79;
        goto LABEL_85;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v87);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "substringFromIndex:", v17);
      v19 = objc_claimAutoreleasedReturnValue();

      v10 = v79;
    }
    else
    {
      v19 = 0;
    }
    XAttr = getXAttr((const char *)v87, "com.apple.CacheManagementAsset", 0);
    v23 = XAttr;
    if (XAttr)
    {
      if (*XAttr == 2)
      {
        v24 = v10;
        v25 = -[CacheManagementAsset initWithFlattenedAsset:]([CacheManagementAsset alloc], "initWithFlattenedAsset:", XAttr);
        if (v25)
        {
          v26 = v25;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v87);
          v27 = v23;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setAbsolutePath:", v28);

          v29 = v27;
          v30 = 0;
          v31 = 0;
LABEL_83:
          free(v29);
          goto LABEL_84;
        }
        CDGetLogHandle((uint64_t)"client");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v87;
          _os_log_error_impl(&dword_1A3662000, v32, OS_LOG_TYPE_ERROR, "unable to create asset from file: %{public}s", buf, 0xCu);
        }
LABEL_32:
        v78 = v23;

        if (v19)
        {
          v24 = v10;
          v31 = 0;
          v30 = 0;
        }
        else
        {
          v77 = v8;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v87);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "componentsSeparatedByString:", CFSTR("/"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          v31 = v38;
          v39 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
          if (v39)
          {
            v40 = v39;
            v41 = 0;
            v42 = *(_QWORD *)v81;
            do
            {
              for (i = 0; i != v40; ++i)
              {
                if (*(_QWORD *)v81 != v42)
                  objc_enumerationMutation(v31);
                v44 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
                if (v41)
                {
                  objc_msgSend(v30, "addObject:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i));
                  v41 = 1;
                }
                else
                {
                  v45 = objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "rangeOfString:", CFSTR("com.apple.UserManagedAssets."));
                  if (v46 == 28)
                  {
                    v47 = v45;
                    v41 = objc_msgSend(v44, "length") == 34 && v47 == 0;
                  }
                  else
                  {
                    v41 = 0;
                  }
                }
              }
              v40 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
            }
            while (v40);
          }

          objc_msgSend(v30, "componentsJoinedByString:", CFSTR("/"));
          v19 = objc_claimAutoreleasedReturnValue();
          v8 = v77;
          v24 = v10;
        }
        v49 = -[NSObject length](v19, "length");
        CDGetLogHandle((uint64_t)"client");
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
        if (v49)
        {
          if (v51)
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v19;
            _os_log_impl(&dword_1A3662000, v50, OS_LOG_TYPE_DEFAULT, "got relative path: %{public}@", buf, 0xCu);
          }
          v52 = 0x1E0CB3000;
        }
        else
        {
          if (v51)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v87);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v53;
            _os_log_impl(&dword_1A3662000, v50, OS_LOG_TYPE_DEFAULT, "relative path is zero length, using path: %{public}@", buf, 0xCu);

          }
          v52 = 0x1E0CB3000uLL;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v87);
          v50 = v19;
          v19 = objc_claimAutoreleasedReturnValue();
        }

        +[CacheManagementAsset assetWithRelativePath:identifier:expirationDate:contentType:metadata:priority:](CacheManagementAsset, "assetWithRelativePath:identifier:expirationDate:contentType:metadata:priority:", v19, v8, 0, 0, 0, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v52 + 2368), "stringWithUTF8String:", v87);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setAbsolutePath:", v54);

        if (v26)
        {
          objc_msgSend(v26, "displayName");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v55)
          {
            CDGetLogHandle((uint64_t)"client");
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v26, "relativePath");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v57;
              _os_log_impl(&dword_1A3662000, v56, OS_LOG_TYPE_DEFAULT, "looking for legacy display name in %{public}@", buf, 0xCu);

            }
            v58 = getXAttr((const char *)v87, "com.apple.coremedia.asset.name", 0);
            if (v58)
            {
              v59 = v58;
              CDGetLogHandle((uint64_t)"client");
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446210;
                *(_QWORD *)&buf[4] = v59;
                _os_log_impl(&dword_1A3662000, v60, OS_LOG_TYPE_DEFAULT, "legacy display name: %{public}s", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v59);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              free(v59);
            }
            else
            {
              v61 = 0;
            }
            objc_msgSend(v26, "setDisplayName:", v61);

            objc_msgSend(v26, "displayName");
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (v62)
            {
              CDGetLogHandle((uint64_t)"client");
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v26, "displayName");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v64;
                _os_log_impl(&dword_1A3662000, v63, OS_LOG_TYPE_DEFAULT, "using legacy display name: %{public}@", buf, 0xCu);

              }
            }
          }
          objc_msgSend(v26, "metadata");
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v65)
          {
            CDGetLogHandle((uint64_t)"client");
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v26, "relativePath");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v67;
              _os_log_impl(&dword_1A3662000, v66, OS_LOG_TYPE_DEFAULT, "looking for legacy metadata in %{public}@", buf, 0xCu);

            }
            *(_QWORD *)buf = 0;
            v68 = getXAttr((const char *)v87, "com.apple.coremedia.asset.image", (ssize_t *)buf);
            if (v68)
            {
              v69 = v68;
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v68, *(_QWORD *)buf);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              free(v69);
            }
            else
            {
              v70 = 0;
            }
            objc_msgSend(v26, "setMetadata:", v70);

            objc_msgSend(v26, "metadata");
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71)
            {
              CDGetLogHandle((uint64_t)"client");
              v72 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A3662000, v72, OS_LOG_TYPE_DEFAULT, "using legacy metadata", buf, 2u);
              }

            }
          }
        }
        v29 = v78;
        if (!v78)
          goto LABEL_84;
        goto LABEL_83;
      }
      CDGetLogHandle((uint64_t)"client");
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      v36 = *v23;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v36;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 2;
      *(_WORD *)v86 = 2082;
      *(_QWORD *)&v86[2] = v87;
      v33 = "asset version (%u) is not compatible with this version of CacheManagementAsset(%u). file: %{public}s. Will c"
            "reate a new asset.";
      v34 = v32;
      v35 = 24;
    }
    else
    {
      if (!v5)
      {
        v24 = v10;
        v26 = 0;
        v30 = 0;
        v31 = 0;
LABEL_84:
        v21 = v26;

        v20 = v21;
        v10 = v24;
LABEL_85:

        goto LABEL_86;
      }
      CDGetLogHandle((uint64_t)"client");
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      *(_WORD *)buf = 0;
      v33 = "no asset on the file, will try to create one";
      v34 = v32;
      v35 = 2;
    }
    _os_log_impl(&dword_1A3662000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
    goto LABEL_32;
  }
  CDGetLogHandle((uint64_t)"client");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v87 = 138412290;
    v88 = v7;
    _os_log_error_impl(&dword_1A3662000, v11, OS_LOG_TYPE_ERROR, "parameter error absolutePath: %@", v87, 0xCu);
  }
  v20 = 0;
LABEL_86:

  return v20;
}

+ (id)assetFromPath:(id)a3 withIdentifier:(id)a4
{
  return (id)objc_msgSend(a1, "assetFromPath:withIdentifier:createIfAbsent:", a3, a4, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CacheManagementAsset initWithFlattenedAsset:](+[CacheManagementAsset allocWithZone:](CacheManagementAsset, "allocWithZone:", a3), "initWithFlattenedAsset:", -[CacheManagementAsset createFlattenedAsset:](self, "createFlattenedAsset:", 0));
}

- (CacheManagementAsset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  CacheManagementAsset *v7;

  v4 = a3;
  if (self)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CACHE_MANAGEMENT_ASSET_DATA"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v6 = objc_retainAutorelease(v5);
    self = -[CacheManagementAsset initWithFlattenedAsset:](self, "initWithFlattenedAsset:", objc_msgSend(v6, "bytes"));

  }
  self = self;
  v7 = self;
LABEL_6:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  $62504CD8620D4E4BE208444870B73508 *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v7 = 0;
  v5 = -[CacheManagementAsset createFlattenedAsset:](self, "createFlattenedAsset:", &v7);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CACHE_MANAGEMENT_ASSET_DATA"));

  }
}

- (void)setExpirationDate:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CDGetLogHandle((uint64_t)"client");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_debug_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEBUG, "setExpirationDate: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  else
    v6 = nan("");
  -[CacheManagementAsset setExpiration_date:](self, "setExpiration_date:", v6);

}

- (id)expirationDate
{
  void *v3;

  -[CacheManagementAsset expiration_date](self, "expiration_date");
  v3 = (void *)MEMORY[0x1E0C99D68];
  -[CacheManagementAsset expiration_date](self, "expiration_date");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setConsumedDate:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CDGetLogHandle((uint64_t)"client");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_debug_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEBUG, "setConsumedDate: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  else
    v6 = nan("");
  -[CacheManagementAsset setConsumed_date:](self, "setConsumed_date:", v6);

}

- (id)consumedDate
{
  void *v3;

  -[CacheManagementAsset consumed_date](self, "consumed_date");
  v3 = (void *)MEMORY[0x1E0C99D68];
  -[CacheManagementAsset consumed_date](self, "consumed_date");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDownloadStartDate:(id)a3
{
  double v4;

  if (a3)
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  else
    v4 = nan("");
  -[CacheManagementAsset setDownload_start_date:](self, "setDownload_start_date:", v4);
}

- (id)downloadStartDate
{
  void *v3;

  -[CacheManagementAsset download_start_date](self, "download_start_date");
  v3 = (void *)MEMORY[0x1E0C99D68];
  -[CacheManagementAsset download_start_date](self, "download_start_date");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDownloadCompletionDate:(id)a3
{
  double v4;

  if (a3)
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  else
    v4 = nan("");
  -[CacheManagementAsset setDownload_completion_date:](self, "setDownload_completion_date:", v4);
}

- (id)downloadCompletionDate
{
  void *v3;

  -[CacheManagementAsset download_completion_date](self, "download_completion_date");
  v3 = (void *)MEMORY[0x1E0C99D68];
  -[CacheManagementAsset download_completion_date](self, "download_completion_date");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastViewedDate:(id)a3
{
  double v4;

  if (a3)
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  else
    v4 = nan("");
  -[CacheManagementAsset setLast_viewed_date:](self, "setLast_viewed_date:", v4);
}

- (id)lastViewedDate
{
  void *v3;

  -[CacheManagementAsset last_viewed_date](self, "last_viewed_date");
  v3 = (void *)MEMORY[0x1E0C99D68];
  -[CacheManagementAsset last_viewed_date](self, "last_viewed_date");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSData)metadata
{
  return self->_metadata;
}

- (id)fullPath
{
  void *v3;
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  stat v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CacheManagementAsset absolutePath](self, "absolutePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CacheManagementAsset absolutePath](self, "absolutePath", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = stat((const char *)objc_msgSend(v4, "fileSystemRepresentation"), &v17);

    if (!v5)
    {
      v14 = (void *)MEMORY[0x1E0C99E98];
      -[CacheManagementAsset absolutePath](self, "absolutePath");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = objc_msgSend(v13, "fileSystemRepresentation");
      objc_msgSend(v14, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v15, (v17.st_mode & 0xF000) == 0x4000, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    -[CacheManagementAsset setAbsolutePath:](self, "setAbsolutePath:", 0);
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[CacheManagementAsset identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CacheManagementAsset relativePath](self, "relativePath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17.st_dev = 138412546;
      *(_QWORD *)&v17.st_mode = v7;
      WORD2(v17.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v17.st_ino + 6) = (__darwin_ino64_t)v8;
      _os_log_impl(&dword_1A3662000, v6, OS_LOG_TYPE_DEFAULT, "[%@] No AbsolutePath, calculating for relativePath: \"%@\", (uint8_t *)&v17, 0x16u);

    }
  }
  -[CacheManagementAsset relativePath](self, "relativePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fullPathToAsset(v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v11 = objc_retainAutorelease(v11);
    objc_msgSend(v12, "stringWithUTF8String:", objc_msgSend(v11, "fileSystemRepresentation"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[CacheManagementAsset setAbsolutePath:](self, "setAbsolutePath:", v13);
LABEL_10:

  }
  return v11;
}

- (void)commit
{
  $62504CD8620D4E4BE208444870B73508 *v3;
  unsigned int *p_var0;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  size_t v12;
  const char *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  int *v28;
  char *v29;
  uint64_t v30;
  uint8_t buf[4];
  size_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v3 = -[CacheManagementAsset createFlattenedAsset:](self, "createFlattenedAsset:", &v30);
  if (!v3)
    return;
  p_var0 = &v3->var0;
  CDGetLogHandle((uint64_t)"client");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    flattenedAssetDescription(p_var0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = (size_t)v6;
    _os_log_impl(&dword_1A3662000, v5, OS_LOG_TYPE_DEFAULT, "attempting to commit flattenedAsset: %@", buf, 0xCu);

  }
  v7 = -[CacheManagementAsset fullPath](self, "fullPath");
  -[CacheManagementAsset absolutePath](self, "absolutePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    CDGetLogHandle((uint64_t)"client");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[CacheManagementAsset description](self, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = (size_t)v17;
      _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "Unable to get absolute path for: %@", buf, 0xCu);

    }
    goto LABEL_23;
  }
  flattenedAssetDescription(p_var0);
  v9 = objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset absolutePath](self, "absolutePath");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");
  v12 = v30;
  if (v30 < 1)
  {
    CDGetLogHandle((uint64_t)"client");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v32 = v12;
      _os_log_error_impl(&dword_1A3662000, v18, OS_LOG_TYPE_ERROR, "parameter error: buflen is less than zero (%ld)", buf, 0xCu);
    }

    goto LABEL_16;
  }
  v13 = v11;
  v14 = openFile(v11);
  if (v14 != -1)
  {
    v15 = v14;
    if (fsetxattr(v14, "com.apple.CacheManagementAsset", p_var0, v12, 0, 0))
    {
      CDGetLogHandle((uint64_t)"client");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v28 = __error();
        v29 = strerror(*v28);
        *(_DWORD *)buf = 136315394;
        v32 = (size_t)v13;
        v33 = 2080;
        v34 = (uint64_t)v29;
        _os_log_error_impl(&dword_1A3662000, v16, OS_LOG_TYPE_ERROR, "fsetxattr(%s) failed: %s", buf, 0x16u);
      }

      close(v15);
      goto LABEL_16;
    }
    close(v15);

    -[CacheManagementAsset absolutePath](self, "absolutePath");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    removexattr((const char *)objc_msgSend(v20, "fileSystemRepresentation"), "com.apple.coremedia.asset.name", 1);

    -[CacheManagementAsset absolutePath](self, "absolutePath");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    removexattr((const char *)objc_msgSend(v21, "fileSystemRepresentation"), "com.apple.coremedia.asset.image", 1);

    CDGetLogHandle((uint64_t)"client");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v30;
      -[CacheManagementAsset absolutePath](self, "absolutePath");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v25 = objc_msgSend(v24, "fileSystemRepresentation");
      v26 = CFSTR("no asset description available");
      *(_DWORD *)buf = 134218498;
      v32 = v23;
      if (v9)
        v26 = (const __CFString *)v9;
      v33 = 2080;
      v34 = v25;
      v35 = 2112;
      v36 = v26;
      _os_log_impl(&dword_1A3662000, v22, OS_LOG_TYPE_DEFAULT, "wrote asset (%ld bytes) to file: %s %@", buf, 0x20u);

    }
LABEL_23:

    free(p_var0);
    return;
  }
LABEL_16:

  CDGetLogHandle((uint64_t)"client");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v27 = CFSTR("no asset description available");
    if (v9)
      v27 = (const __CFString *)v9;
    *(_DWORD *)buf = 138412290;
    v32 = (size_t)v27;
    _os_log_error_impl(&dword_1A3662000, v19, OS_LOG_TYPE_ERROR, "setXAttr failed, unable to commit the asset to disk. %@", buf, 0xCu);
  }

  free(p_var0);
}

- (int)purgeabilityScoreAtUrgency:(int)a3
{
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  int v38;
  int v40;
  void *v41;
  __int16 v42;
  _BYTE v43[10];
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  -[CacheManagementAsset expirationDate](self, "expirationDate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CacheManagementAsset expirationDate](self, "expirationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v12 = v11;

    if (v7 > v12)
      goto LABEL_8;
  }
  CDGetLogHandle((uint64_t)"client");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[CacheManagementAsset relativePath](self, "relativePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CacheManagementAsset expirationDate](self, "expirationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v40 = 138412802;
    v41 = v14;
    v42 = 2048;
    *(_QWORD *)v43 = v16;
    *(_WORD *)&v43[8] = 2048;
    v44 = v7;
    _os_log_impl(&dword_1A3662000, v13, OS_LOG_TYPE_DEFAULT, "%@ CacheManagementAssetPurgeabilityScore expirationDate: %f, now: %f", (uint8_t *)&v40, 0x20u);

  }
  if (-[CacheManagementAsset priority](self, "priority") > a3 || !-[CacheManagementAsset priority](self, "priority"))
    goto LABEL_22;
  if (-[CacheManagementAsset priority](self, "priority") == 1
    || a3 >= 2 && -[CacheManagementAsset priority](self, "priority") <= a3)
  {
LABEL_8:
    v17 = 1;
    goto LABEL_23;
  }
  -[CacheManagementAsset consumedDate](self, "consumedDate");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[CacheManagementAsset consumedDate](self, "consumedDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v22 = v21;

    if (v7 > v22)
    {
      v17 = 2;
      goto LABEL_23;
    }
  }
  CDGetLogHandle((uint64_t)"client");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[CacheManagementAsset relativePath](self, "relativePath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CacheManagementAsset downloadStartDate](self, "downloadStartDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSinceReferenceDate");
    v40 = 138412802;
    v41 = v24;
    v42 = 2048;
    *(_QWORD *)v43 = v26;
    *(_WORD *)&v43[8] = 2048;
    v44 = v7;
    _os_log_impl(&dword_1A3662000, v23, OS_LOG_TYPE_DEFAULT, "%@ CacheManagementAssetPurgeabilityScore downloadStartDate: %f, now: %f", (uint8_t *)&v40, 0x20u);

  }
  -[CacheManagementAsset downloadStartDate](self, "downloadStartDate");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[CacheManagementAsset downloadStartDate](self, "downloadStartDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSinceReferenceDate");
    v31 = v7 - v30;

    if (v31 > 129600.0)
    {
      v17 = 4;
      goto LABEL_23;
    }
  }
  CDGetLogHandle((uint64_t)"client");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    -[CacheManagementAsset relativePath](self, "relativePath");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CacheManagementAsset downloadStartDate](self, "downloadStartDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "timeIntervalSinceReferenceDate");
    v40 = 138412802;
    v41 = v33;
    v42 = 2048;
    *(_QWORD *)v43 = v35;
    *(_WORD *)&v43[8] = 2048;
    v44 = v7;
    _os_log_impl(&dword_1A3662000, v32, OS_LOG_TYPE_DEFAULT, "%@ CacheManagementAssetPurgeabilityScore downloadStartDate: %f, now: %f", (uint8_t *)&v40, 0x20u);

  }
LABEL_22:
  v17 = 0;
LABEL_23:
  CDGetLogHandle((uint64_t)"client");
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    -[CacheManagementAsset relativePath](self, "relativePath");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[CacheManagementAsset priority](self, "priority");
    v40 = 138413058;
    v41 = v37;
    v42 = 1024;
    *(_DWORD *)v43 = v17;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v38;
    LOWORD(v44) = 1024;
    *(_DWORD *)((char *)&v44 + 2) = a3;
    _os_log_impl(&dword_1A3662000, v36, OS_LOG_TYPE_DEFAULT, "%@ CacheManagementAssetPurgeabilityScore assigning score %d, priority: %d, urgency: %d", (uint8_t *)&v40, 0x1Eu);

  }
  return v17;
}

- (int64_t)size
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = -[CacheManagementAsset fullPath](self, "fullPath");
  -[CacheManagementAsset absolutePath](self, "absolutePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return -1;
  -[CacheManagementAsset absolutePath](self, "absolutePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = diskUsageList(v5, 0);

  return v6;
}

- (int64_t)sizeCached:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  uint64_t v7;
  int64_t result;

  v3 = a3;
  if (qword_1ECE241E0 != -1)
    dispatch_once(&qword_1ECE241E0, &__block_literal_global);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date", *(double *)&_MergedGlobals_0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    if (v6 - *(double *)&_MergedGlobals_0 <= 300.0)
    {
      v7 = sizeCached__result;

      if (v7 != -1)
        return sizeCached__result;
    }
    else
    {

    }
  }
  result = -[CacheManagementAsset size](self, "size");
  sizeCached__result = result;
  return result;
}

void __35__CacheManagementAsset_sizeCached___block_invoke()
{
  _MergedGlobals_0 = nan("");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[CacheManagementAsset displayName](self, "displayName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset relativePath](self, "relativePath");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v21, "fileSystemRepresentation");
  -[CacheManagementAsset identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset contentType](self, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CacheManagementAsset priority](self, "priority");
  v4 = -[CacheManagementAsset purgeabilityScoreAtUrgency:](self, "purgeabilityScoreAtUrgency:", 2);
  -[CacheManagementAsset thumbnailData](self, "thumbnailData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v5 = "YES";
  else
    v5 = "NO";
  v6 = -[CacheManagementAsset size](self, "size");
  -[CacheManagementAsset expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset downloadStartDate](self, "downloadStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset downloadCompletionDate](self, "downloadCompletionDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset consumedDate](self, "consumedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset lastViewedDate](self, "lastViewedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset absolutePath](self, "absolutePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("CacheManagementAsset displayName: %@, relativePath: %s, identifier: %@, contentType: %@\npriority: %d, purgeabilityScore [u:2]: %d, has thumbnail: %s, size: %lld\nexpirationDate: %@\ndownloadStartDate: %@\ndownloadCompletionDate: %@\nconsumedDate: %@\nlastViewedDate: %@\nabsolutePath: %@"), v19, v17, v16, v3, v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
  objc_storeStrong((id *)&self->_relativePath, a3);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (unsigned)assetVersion
{
  return self->_assetVersion;
}

- (double)expiration_date
{
  return self->_expiration_date;
}

- (void)setExpiration_date:(double)a3
{
  self->_expiration_date = a3;
}

- (double)consumed_date
{
  return self->_consumed_date;
}

- (void)setConsumed_date:(double)a3
{
  self->_consumed_date = a3;
}

- (double)download_start_date
{
  return self->_download_start_date;
}

- (void)setDownload_start_date:(double)a3
{
  self->_download_start_date = a3;
}

- (double)download_completion_date
{
  return self->_download_completion_date;
}

- (void)setDownload_completion_date:(double)a3
{
  self->_download_completion_date = a3;
}

- (double)last_viewed_date
{
  return self->_last_viewed_date;
}

- (void)setLast_viewed_date:(double)a3
{
  self->_last_viewed_date = a3;
}

- (NSString)absolutePath
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAbsolutePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absolutePath, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
