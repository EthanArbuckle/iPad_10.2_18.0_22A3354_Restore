@implementation PKTextInputDebugSharpenerLog

- (PKTextInputDebugSharpenerLog)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  PKTextInputDebugSharpenerLog *v7;
  PKTextInputDebugSharpenerLog *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKTextInputDebugSharpenerLog;
  v7 = -[PKTextInputDebugSharpenerLog init](&v10, sel_init);
  v8 = v7;
  if (v7 && !-[PKTextInputDebugSharpenerLog _loadFromFileURL:error:](v7, "_loadFromFileURL:error:", v6, a4))
  {

    v8 = 0;
  }

  return v8;
}

- (PKTextInputDebugSharpenerLog)initWithLogEntries:(id)a3
{
  id v4;
  PKTextInputDebugSharpenerLog *v5;
  uint64_t v6;
  NSArray *logEntries;
  uint64_t v8;
  NSDictionary *metadataDictionary;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTextInputDebugSharpenerLog;
  v5 = -[PKTextInputDebugSharpenerLog init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    logEntries = v5->_logEntries;
    v5->_logEntries = (NSArray *)v6;

    objc_msgSend((id)objc_opt_class(), "_environmentMetadataDictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    metadataDictionary = v5->_metadataDictionary;
    v5->_metadataDictionary = (NSDictionary *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTextInputDebugSharpenerLog;
  -[PKTextInputDebugSharpenerLog description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugSharpenerLog metadataDictionary](self, "metadataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugSharpenerLog logEntries](self, "logEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" metadata: %@, entries: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasContent
{
  void *v2;
  BOOL v3;

  -[PKTextInputDebugSharpenerLog logEntries](self, "logEntries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)_dictionaryRepresentationWithContentLevel:(int64_t)a3 excludeEntyIndexes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  -[PKTextInputDebugSharpenerLog logEntries](self, "logEntries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PKTextInputDebugSharpenerLog logEntries](self, "logEntries", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
        if ((objc_msgSend(v6, "containsIndex:", v13 + v15) & 1) == 0)
        {
          objc_msgSend(v16, "dictionaryRepresentationWithTargetContentLevel:", a3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

        }
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      v13 += v15;
    }
    while (v12);
  }

  v25[0] = CFSTR("metadata");
  -[PKTextInputDebugSharpenerLog metadataDictionary](self, "metadataDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = CFSTR("entries");
  v26[0] = v18;
  v26[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_environmentMetadataDictionary
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E777DEE8;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  v7 = (void *)MGCopyAnswer();
  v8 = (void *)_CFCopySystemVersionDictionaryValue();
  v11[0] = CFSTR("formatVersion");
  v11[1] = CFSTR("build");
  v12[0] = CFSTR("2.0");
  v12[1] = v8;
  v11[2] = CFSTR("device");
  v11[3] = CFSTR("appIdentifier");
  v12[2] = v7;
  v12[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)canLoadFromFileAtURL:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("plist")) == 0;

  return v4;
}

- (id)writeLogToTemporaryDirectoryWithContentLevel:(int64_t)a3 excludeEntyIndexes:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v8 = a4;
  -[PKTextInputDebugSharpenerLog logEntries](self, "logEntries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entryDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[PKTextInputDebugSharpenerLog _recommendedFileNameForLogWithDate:](PKTextInputDebugSharpenerLog, "_recommendedFileNameForLogWithDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:isDirectory:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[PKTextInputDebugSharpenerLog writeToURL:withContentLevel:excludeEntyIndexes:error:](self, "writeToURL:withContentLevel:excludeEntyIndexes:error:", v16, a3, v8, a5);
  if (!v17)
  {

    v16 = 0;
  }

  return v16;
}

- (BOOL)writeToURL:(id)a3 withContentLevel:(int64_t)a4 excludeEntyIndexes:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[PKTextInputDebugSharpenerLog _dictionaryRepresentationWithContentLevel:excludeEntyIndexes:](self, "_dictionaryRepresentationWithContentLevel:excludeEntyIndexes:", a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 100, 0, &v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v21;
  v14 = v13;
  if (v12)
  {
    v20 = v13;
    v15 = objc_msgSend(v12, "writeToURL:options:error:", v10, 0, &v20);
    v16 = v20;

    if ((v15 & 1) != 0)
    {
      v17 = 1;
      if (!a6)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else
  {
    v16 = v13;
  }
  v18 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v10;
    v24 = 2112;
    v25 = v16;
    _os_log_error_impl(&dword_1BE213000, v18, OS_LOG_TYPE_ERROR, "Couldn't write PencilSharpener log to %@; Error: %@",
      buf,
      0x16u);
  }

  v17 = 0;
  if (a6)
LABEL_9:
    *a6 = objc_retainAutorelease(v16);
LABEL_10:

  return v17;
}

- (BOOL)_loadFromFileURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *metadataDictionary;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  PKTextInputDebugArchivedLogEntry *v23;
  PKTextInputDebugArchivedLogEntry *v24;
  NSObject *v25;
  NSArray *v26;
  NSArray *logEntries;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id *v33;
  id v34;
  void *v35;
  void *v36;
  id obj;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v43 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v6, &v43);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v43;
  if (!v7)
  {
    v12 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v45 = v6;
      v46 = 2112;
      v47 = v8;
      _os_log_error_impl(&dword_1BE213000, v12, OS_LOG_TYPE_ERROR, "Error reading PencilSharpener log from %@; error: %@",
        buf,
        0x16u);
    }

    v11 = 0;
    if (a4)
      goto LABEL_31;
    goto LABEL_32;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("metadata"));
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  metadataDictionary = self->_metadataDictionary;
  self->_metadataDictionary = v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v13 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v45 = v29;
      v30 = v29;
      _os_log_error_impl(&dword_1BE213000, v13, OS_LOG_TYPE_ERROR, "Error loading metadata dictionary with object of class: %@", buf, 0xCu);

    }
    v14 = self->_metadataDictionary;
    self->_metadataDictionary = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("entries"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_30;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v16;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (!v17)
    goto LABEL_29;
  v18 = v17;
  v35 = v16;
  v36 = v7;
  v33 = a4;
  v34 = v6;
  v19 = *(_QWORD *)v40;
  while (2)
  {
    v20 = 0;
    v21 = v8;
    do
    {
      if (*(_QWORD *)v40 != v19)
        objc_enumerationMutation(obj);
      v22 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v20);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v25 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v45 = v31;
          v32 = v31;
          _os_log_error_impl(&dword_1BE213000, v25, OS_LOG_TYPE_ERROR, "Error loading log entry with object of class: %@", buf, 0xCu);

        }
        goto LABEL_28;
      }
      v23 = [PKTextInputDebugArchivedLogEntry alloc];
      v38 = v21;
      v24 = -[PKTextInputDebugArchivedLogEntry initWithDictionary:error:](v23, "initWithDictionary:error:", v22, &v38);
      v8 = v38;

      if (!v24)
      {
        v25 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v8;
          _os_log_error_impl(&dword_1BE213000, v25, OS_LOG_TYPE_ERROR, "Error loading log entry: %@", buf, 0xCu);
        }
        v21 = v8;
LABEL_28:
        a4 = v33;
        v6 = v34;

        v11 = 0;
        v8 = v21;
        v16 = v35;
        v7 = v36;
        goto LABEL_29;
      }
      objc_msgSend(v15, "addObject:", v24);

      ++v20;
      v21 = v8;
    }
    while (v18 != v20);
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v18)
      continue;
    break;
  }
  a4 = v33;
  v6 = v34;
  v16 = v35;
  v7 = v36;
LABEL_29:

LABEL_30:
  v26 = (NSArray *)objc_msgSend(v15, "copy");
  logEntries = self->_logEntries;
  self->_logEntries = v26;

  if (a4)
LABEL_31:
    *a4 = objc_retainAutorelease(v8);
LABEL_32:

  return v11;
}

+ (id)_recommendedFileNameForLogWithDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocale:", v6);

  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "stringFromDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", CFSTR("PencilSharpener-%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("plist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)logEntries
{
  return self->_logEntries;
}

- (NSDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
  objc_storeStrong((id *)&self->_logEntries, 0);
}

@end
