@implementation PHImportException

- (PHImportException)initWithType:(int64_t)a3 path:(id)a4 underlyingError:(id)a5 file:(char *)a6 line:(unint64_t)a7
{
  id v13;
  id v14;
  PHImportException *v15;
  uint64_t v16;
  NSDate *createDate;
  void *v18;
  uint64_t v19;
  NSString *sourceCodeFile;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  unint64_t type;
  __CFString *v26;
  NSString *v27;
  unint64_t lineNumber;
  objc_super v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  NSString *v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v30.receiver = self;
  v30.super_class = (Class)PHImportException;
  v15 = -[PHImportException init](&v30, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = objc_claimAutoreleasedReturnValue();
    createDate = v15->_createDate;
    v15->_createDate = (NSDate *)v16;

    v15->_type = a3;
    objc_storeStrong((id *)&v15->_path, a4);
    objc_storeStrong((id *)&v15->_underlyingError, a5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastPathComponent");
    v19 = objc_claimAutoreleasedReturnValue();
    sourceCodeFile = v15->_sourceCodeFile;
    v15->_sourceCodeFile = (NSString *)v19;

    v15->_lineNumber = a7;
    PLImportGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "localizedDescription");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      v24 = &stru_1E35DFFF8;
      if (v22)
        v24 = (const __CFString *)v22;
      type = v15->_type;
      if (type > 8)
        v26 = 0;
      else
        v26 = off_1E35DF098[type];
      v27 = v15->_sourceCodeFile;
      lineNumber = v15->_lineNumber;
      *(_DWORD *)buf = 138413314;
      v32 = v24;
      v33 = 2112;
      v34 = v26;
      v35 = 2112;
      v36 = v13;
      v37 = 2112;
      v38 = v27;
      v39 = 2048;
      v40 = lineNumber;
      _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_ERROR, "ERROR: %@ (type: %@, path: %@), file: %@, line: %lu", buf, 0x34u);

    }
  }

  return v15;
}

- (id)description
{
  void *v3;
  unint64_t type;
  __CFString *v5;
  NSError *underlyingError;
  __CFString *v7;
  NSString *path;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  type = self->_type;
  if (type > 8)
    v5 = 0;
  else
    v5 = off_1E35DF098[type];
  underlyingError = self->_underlyingError;
  if (underlyingError)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (NSError: %@)"), self->_underlyingError);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E35DFFF8;
  }
  path = self->_path;
  if (path)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", path: %@"), self->_path);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1E35DFFF8;
  }
  if (self->_sourceCodeFile)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", source: %@"), self->_sourceCodeFile);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (self->_sourceCodeFile)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", line: %lu"), self->_lineNumber);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@%@%@%@"), v5, v7, v9, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@%@%@%@"), v5, v7, v9, v10, &stru_1E35DFFF8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!path)
      goto LABEL_18;
    goto LABEL_17;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@%@%@%@"), v5, v7, v9, &stru_1E35DFFF8, &stru_1E35DFFF8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (path)
LABEL_17:

LABEL_18:
  if (underlyingError)

  return v13;
}

- (NSDate)createDate
{
  return self->_createDate;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)sourceCodeFile
{
  return self->_sourceCodeFile;
}

- (unint64_t)lineNumber
{
  return self->_lineNumber;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_sourceCodeFile, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_createDate, 0);
}

+ (id)logForAllExceptions:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "exceptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = &stru_1E35DFFF8;
    do
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v9, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = &stru_1E35DFFF8;
  }

  return v7;
}

@end
