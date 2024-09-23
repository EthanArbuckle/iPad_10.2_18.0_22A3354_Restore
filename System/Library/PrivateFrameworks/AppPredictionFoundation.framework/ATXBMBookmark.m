@implementation ATXBMBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_urlPath, 0);
}

+ (id)bookmarkFromURLPath:(id)a3 maxFileSize:(unint64_t)a4 versionNumber:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "_fileExistsAtPath:", v10) & 1) == 0)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ATXBMBookmark bookmarkFromURLPath:maxFileSize:versionNumber:].cold.3();
    goto LABEL_12;
  }
  if ((objc_msgSend(a1, "_fileSizeWithinLimitsForPath:maxFileSize:", v10, a4) & 1) == 0)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      +[ATXBMBookmark bookmarkFromURLPath:maxFileSize:versionNumber:].cold.2();
    goto LABEL_12;
  }
  v11 = (void *)MEMORY[0x1CAA46674]();
  objc_msgSend(a1, "_dataFromPath:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v11);
  if (!v12)
  {
    __atxlog_handle_default();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[ATXBMBookmark bookmarkFromURLPath:maxFileSize:versionNumber:].cold.1();

LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  objc_msgSend(a1, "bookmarkFromData:bookmarkLocation:versionNumber:", v12, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v13;
}

+ (id)bookmarkFromData:(id)a3 bookmarkLocation:(id)a4 versionNumber:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1CAA46674]();
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;
  objc_autoreleasePoolPop(v11);
  if (v13 || !v12)
  {
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (!v9)
    {
      if (v18)
        +[ATXBMBookmark bookmarkFromData:bookmarkLocation:versionNumber:].cold.1();
      goto LABEL_17;
    }
    if (v18)
    {
      NSStringFromClass((Class)a1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v19;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v13;
      _os_log_error_impl(&dword_1C99CA000, v17, OS_LOG_TYPE_ERROR, "%@ - failed to unarchive bookmark at %@ with error: %@", buf, 0x20u);
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  objc_msgSend(v12, "versionNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToNumber:", v10);

  if ((v15 & 1) == 0)
  {
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v20)
      {
        NSStringFromClass((Class)a1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v19;
        v28 = 2112;
        v29 = v9;
        v21 = "%@ - version number changed for bookmark at %@";
        v22 = v17;
        v23 = 22;
LABEL_15:
        _os_log_impl(&dword_1C99CA000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        goto LABEL_16;
      }
    }
    else if (v20)
    {
      NSStringFromClass((Class)a1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      v21 = "%@ - version number changed for bookmark";
      v22 = v17;
      v23 = 12;
      goto LABEL_15;
    }
LABEL_17:

    v16 = 0;
    goto LABEL_18;
  }
  v16 = v12;
LABEL_18:

  return v16;
}

- (NSNumber)versionNumber
{
  return self->_versionNumber;
}

+ (BOOL)_fileSizeWithinLimitsForPath:(id)a3 maxFileSize:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v6, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;

  if (!v8)
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[ATXBMBookmark _fileSizeWithinLimitsForPath:maxFileSize:].cold.1();
    goto LABEL_7;
  }
  if (v9)
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass((Class)a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = (unint64_t)v9;
      _os_log_error_impl(&dword_1C99CA000, v10, OS_LOG_TYPE_ERROR, "%@ - file manager error for path %@, err: %@", buf, 0x20u);

    }
LABEL_7:

    v12 = 0;
    goto LABEL_11;
  }
  v13 = objc_msgSend(v8, "fileSize");
  __atxlog_handle_default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromClass((Class)a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v15;
    v20 = 2112;
    v21 = v6;
    v22 = 2048;
    v23 = v13;
    _os_log_impl(&dword_1C99CA000, v14, OS_LOG_TYPE_DEFAULT, "%@ - file size on disk for path %@ is %llu", buf, 0x20u);

  }
  v12 = v13 <= a4;
LABEL_11:

  return v12;
}

+ (BOOL)_fileExistsAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  return v6;
}

- (BOOL)saveBookmarkWithError:(id *)a3
{
  NSURL *urlPath;
  NSObject *v6;
  NSURL *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  objc_class *v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  NSURL *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  urlPath = self->_urlPath;
  if (urlPath)
  {
    -[NSURL URLByDeletingLastPathComponent](urlPath, "URLByDeletingLastPathComponent");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = self->_urlPath;
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v10;
      v30 = 2112;
      v31 = (NSURL *)v6;
      _os_log_impl(&dword_1C99CA000, v8, OS_LOG_TYPE_DEFAULT, "%@ - attempting to save bookmark with directoryURL: %@", buf, 0x16u);

    }
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v13;
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_1C99CA000, v11, OS_LOG_TYPE_DEFAULT, "%@ - attempting to save bookmark with fileURL: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v15 = objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v27);
    v16 = v27;

    if (!v15 || v16)
    {
      __atxlog_handle_default();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v29 = v25;
        v30 = 2112;
        v31 = (NSURL *)v6;
        v32 = 2112;
        v33 = v16;
        _os_log_error_impl(&dword_1C99CA000, v22, OS_LOG_TYPE_ERROR, "%@ - could not create directory at path: %@ with err: %@", buf, 0x20u);

      }
      v19 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v16);
    }
    else
    {
      -[ATXBMBookmark serializeBookmark:](self, "serializeBookmark:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v26 = 0;
        v19 = objc_msgSend(v17, "writeToURL:options:error:", v7, 1073741825, &v26);
        v20 = v26;
        if ((v19 & 1) == 0)
        {
          __atxlog_handle_default();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[ATXBMBookmark saveBookmarkWithError:].cold.2();

          if (a3)
            *a3 = objc_retainAutorelease(v20);
        }

      }
      else
      {
        v19 = 0;
      }

    }
  }
  else
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXBMBookmark saveBookmarkWithError:].cold.1((uint64_t)self, v6);
    v19 = 0;
  }

  return v19;
}

- (id)serializeBookmark:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  id v12;

  v5 = (void *)MEMORY[0x1CAA46674](self, a2);
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 0, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  objc_autoreleasePoolPop(v5);
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    v10 = v6;
  }
  else
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXBMBookmark serializeBookmark:].cold.1();

    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }

  return v10;
}

- (ATXBMBookmark)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXBMBookmark *v10;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  void *context;
  void *v35;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_default();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("urlPath"), v4, 0, CFSTR("com.apple.duetexpertd.ATXBMBookmark"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_default();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("versionNumber"), v4, 0, CFSTR("com.apple.duetexpertd.ATXBMBookmark"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    if (!v15 && v14)
    {
      v16 = (void *)MEMORY[0x1E0D81610];
      -[ATXBMBookmark allowedClassesForBookmarkSecureCoding](self, "allowedClassesForBookmarkSecureCoding");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_default();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("bookmark"), v4, 0, CFSTR("com.apple.duetexpertd.ATXBMBookmark"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        __atxlog_handle_default();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[ATXBMBookmark initWithCoder:].cold.1();

        v10 = 0;
      }
      else
      {
        v35 = v19;
        context = (void *)MEMORY[0x1CAA46674]();
        v33 = objc_alloc(MEMORY[0x1E0C99E60]);
        v22 = objc_opt_class();
        v23 = objc_opt_class();
        v24 = objc_opt_class();
        v25 = objc_opt_class();
        v26 = objc_opt_class();
        v27 = (void *)objc_msgSend(v33, "initWithObjects:", v22, v23, v24, v25, v26, objc_opt_class(), 0);
        objc_autoreleasePoolPop(context);
        v28 = (void *)MEMORY[0x1E0D81610];
        __atxlog_handle_default();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v27, CFSTR("metadata"), v4, 0, CFSTR("com.apple.duetexpertd.ATXBMBookmark"), -1, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "error");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v10 = 0;
          v19 = v35;
        }
        else
        {
          v19 = v35;
          self = -[ATXBMBookmark initWithURLPath:versionNumber:bookmark:metadata:](self, "initWithURLPath:versionNumber:bookmark:metadata:", v8, v14, v35, v30);
          v10 = self;
        }

      }
    }

  }
  return v10;
}

- (ATXBMBookmark)initWithURLPath:(id)a3 versionNumber:(id)a4 bookmark:(id)a5 metadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ATXBMBookmark *v14;
  uint64_t v15;
  NSURL *urlPath;
  uint64_t v17;
  NSDictionary *metadata;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXBMBookmark;
  v14 = -[ATXBMBookmark init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    urlPath = v14->_urlPath;
    v14->_urlPath = (NSURL *)v15;

    objc_storeStrong((id *)&v14->_versionNumber, a4);
    objc_storeStrong((id *)&v14->_bookmark, a5);
    v17 = objc_msgSend(v13, "copy");
    metadata = v14->_metadata;
    v14->_metadata = (NSDictionary *)v17;

  }
  return v14;
}

- (id)allowedClassesForBookmarkSecureCoding
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0CB3510], "bm_allowedClassesForSecureCodingBMBookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSet:", v3);

  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v5, v4, CFSTR("ATXFakeBookmark"));
  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v6, v4, CFSTR("BMStoreBookmark"));
  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v7, v4, CFSTR("ATXBlendingBiomeStreamLoggerContextWrapper"));
  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v8, v4, CFSTR("ATXUIFeedbackPriorContext"));
  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v9, v4, CFSTR("ATXSecureCodedTuple"));
  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v10, v4, CFSTR("ATXProactiveSuggestionUIFeedbackResult"));
  __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(v11, v4, CFSTR("ATXProactiveSuggestionUIFeedbackSession"));
  v12 = (void *)MEMORY[0x1E0CB3510];
  objc_msgSend(v4, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bm_allowClassesForSecureCodingBMBookmark:", v13);

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

void __54__ATXBMBookmark_allowedClassesForBookmarkSecureCoding__block_invoke(uint64_t a1, void *a2, NSString *a3)
{
  Class v4;
  id v5;

  v5 = a2;
  v4 = NSClassFromString(a3);
  if (v4)
    objc_msgSend(v5, "addObject:", v4);

}

+ (id)_dataFromPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  id v12;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v12 = 0;
    objc_msgSend(v3, "readDataToEndOfFileAndReturnError:", &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 0;
    if (v8)
    {
      v10 = v5;
    }
    else
    {
      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[ATXBMBookmark _dataFromPath:].cold.1((uint64_t)v4, (uint64_t)v7, v9);

      v10 = 0;
    }

  }
  else
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99CA000, v7, OS_LOG_TYPE_DEFAULT, "Unable to acquire readonly handle to cache file.", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (BMBookmark)bookmark
{
  return self->_bookmark;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *urlPath;
  id v5;

  urlPath = self->_urlPath;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", urlPath, CFSTR("urlPath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_versionNumber, CFSTR("versionNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bookmark, CFSTR("bookmark"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));

}

- (BOOL)isEqual:(id)a3
{
  ATXBMBookmark *v4;
  ATXBMBookmark *v5;
  BOOL v6;

  v4 = (ATXBMBookmark *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXBMBookmark isEqualToATXBMBookmark:](self, "isEqualToATXBMBookmark:", v5);

  return v6;
}

- (BOOL)isEqualToATXBMBookmark:(id)a3
{
  id *v4;
  NSURL *urlPath;
  NSURL *v6;
  NSURL *v7;
  NSURL *v8;
  char v9;
  NSNumber *versionNumber;
  NSNumber *v11;
  NSNumber *v12;
  NSNumber *v13;
  char v14;
  char v15;
  NSDictionary *v16;
  NSDictionary *v17;

  v4 = (id *)a3;
  urlPath = self->_urlPath;
  v6 = (NSURL *)v4[1];
  if (urlPath == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = urlPath;
    v9 = -[NSURL isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_7;
  }
  versionNumber = self->_versionNumber;
  v11 = (NSNumber *)v4[2];
  if (versionNumber == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = versionNumber;
    v14 = -[NSNumber isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
    {
LABEL_7:
      v15 = 0;
      goto LABEL_13;
    }
  }
  v16 = self->_metadata;
  v17 = v16;
  if (v16 == v4[4])
    v15 = 1;
  else
    v15 = -[NSDictionary isEqual:](v16, "isEqual:");

LABEL_13:
  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSURL hash](self->_urlPath, "hash");
  v4 = -[NSNumber hash](self->_versionNumber, "hash") - v3 + 32 * v3;
  return -[NSDictionary hash](self->_metadata, "hash") - v4 + 32 * v4;
}

- (NSURL)urlPath
{
  return self->_urlPath;
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

+ (void)bookmarkFromData:bookmarkLocation:versionNumber:.cold.1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_3(&dword_1C99CA000, v2, v3, "%@ - failed to unarchive bookmark with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_3();
}

+ (void)bookmarkFromURLPath:maxFileSize:versionNumber:.cold.1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_3(&dword_1C99CA000, v2, v3, "%@ - could not read serialized data for bookmark at path %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_3();
}

+ (void)bookmarkFromURLPath:maxFileSize:versionNumber:.cold.2()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_3(&dword_1C99CA000, v2, v3, "%@ - bookmark larger than maxFileSize at path %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_3();
}

+ (void)bookmarkFromURLPath:maxFileSize:versionNumber:.cold.3()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_3(&dword_1C99CA000, v2, v3, "%@ - bookmark file doesn't exist at path %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_3();
}

- (void)serializeBookmark:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_3(&dword_1C99CA000, v2, v3, "%@ - could not archive self with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_3();
}

- (void)saveBookmarkWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1C99CA000, a2, OS_LOG_TYPE_FAULT, "%@ – Attempting to save a bookmark without a path is forbidden.", (uint8_t *)&v5, 0xCu);

}

- (void)saveBookmarkWithError:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_3(&dword_1C99CA000, v2, v3, "%@ - could not write bookmark file with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_3();
}

+ (void)_fileSizeWithinLimitsForPath:maxFileSize:.cold.1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_3(&dword_1C99CA000, v2, v3, "%@ - failed to retrieve attributes for path %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_3();
}

+ (void)_dataFromPath:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1C99CA000, log, OS_LOG_TYPE_ERROR, "Unable to read data from file handle %@ - %@", (uint8_t *)&v3, 0x16u);
}

- (void)initWithCoder:.cold.1()
{
  void *v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_3_2();
  v1 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3(&dword_1C99CA000, v3, v4, "%@ - failed to decode id<BMBookmark> with error: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_3();
}

@end
