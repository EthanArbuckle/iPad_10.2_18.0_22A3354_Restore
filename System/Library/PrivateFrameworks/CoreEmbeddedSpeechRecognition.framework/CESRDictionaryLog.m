@implementation CESRDictionaryLog

- (CESRDictionaryLog)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CESRDictionaryLog)initWithFilename:(id)a3 directory:(id)a4 readOnly:(BOOL)a5 error:(id *)a6
{
  return -[CESRDictionaryLog initWithFilename:protectionClass:directory:readOnly:create:error:](self, "initWithFilename:protectionClass:directory:readOnly:create:error:", a3, 0xFFFFFFFFLL, a4, a5, 1, a6);
}

- (CESRDictionaryLog)initWithFilename:(id)a3 protectionClass:(int)a4 directory:(id)a5 readOnly:(BOOL)a6 create:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  CESRDictionaryLog *v16;
  uint64_t v17;
  NSURL *logFileURL;
  CESRDictionaryLog *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  uint64_t v27;
  _QWORD v28[2];

  v9 = a7;
  v10 = a6;
  v28[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CESRDictionaryLog;
  v16 = -[CESRDictionaryLog init](&v26, sel_init);
  if (!v16)
    goto LABEL_5;
  if (!v14 || !v15)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid {filename: %@, directory: %@}"), v14, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-dictionary-log"), 2, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a8 && v23)
      *a8 = objc_retainAutorelease(v23);

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", v14, v15);
  v17 = objc_claimAutoreleasedReturnValue();
  logFileURL = v16->_logFileURL;
  v16->_logFileURL = (NSURL *)v17;

  v16->_protectionClass = a4;
  if (!-[CESRDictionaryLog _loadLogOrCreate:readOnly:error:](v16, "_loadLogOrCreate:readOnly:error:", v9, v10, a8))
  {
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
LABEL_5:
  v19 = v16;
LABEL_11:

  return v19;
}

- (BOOL)_loadLogOrCreate:(BOOL)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  void *v9;
  NSDictionary *v10;
  id v11;
  NSDictionary *log;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  objc_class *v29;
  NSObject *v30;
  NSDictionary *v31;
  char v32;
  NSObject *v33;
  NSDictionary *v34;
  NSDictionary *v35;
  uint64_t v36;
  void *v38;
  id *v39;
  uint64_t v40;
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[3];

  v6 = a4;
  v53[1] = *MEMORY[0x1E0C80C00];
  -[NSURL path](self->_logFileURL, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SFReadPropertyList();
  v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  log = self->_log;
  self->_log = v10;

  if (!self->_log)
  {
    v21 = objc_msgSend(v11, "code");
    v22 = *MEMORY[0x1E0CFE6C0];
    if (v21 == 260)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[CESRDictionaryLog _loadLogOrCreate:readOnly:error:]";
        v44 = 2112;
        v45 = (uint64_t)v9;
        _os_log_debug_impl(&dword_1B3E5F000, v22, OS_LOG_TYPE_DEBUG, "%s No prior log found at path: %@", buf, 0x16u);
      }
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0CB3388];
      v49 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23;
      v26 = 6;
LABEL_26:
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-dictionary-log"), v26, v24);
      v36 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v36;
      if (a3)
        goto LABEL_14;
LABEL_27:
      v32 = 0;
      if (a5 && v11)
      {
        v11 = objc_retainAutorelease(v11);
        v32 = 0;
        *a5 = v11;
      }
      goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "-[CESRDictionaryLog _loadLogOrCreate:readOnly:error:]";
      v44 = 2112;
      v45 = (uint64_t)v9;
      v46 = 2112;
      v47 = v11;
      _os_log_error_impl(&dword_1B3E5F000, v22, OS_LOG_TYPE_ERROR, "%s Failed to read prior log file at path: %@ error: %@", buf, 0x20u);
      if (v11)
        goto LABEL_22;
    }
    else if (v11)
    {
LABEL_22:
      v40 = *MEMORY[0x1E0CB3388];
      v41 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = 7;
      goto LABEL_26;
    }
    v24 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v6)
      goto LABEL_16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_16;
    v39 = a5;
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v52 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Expected mutable plist class (%@) but received class (%@) for object: %@ at path: %@"), v15, v17, self->_log, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-dictionary-log"), 5, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v19;
  }
  else
  {
    v39 = a5;
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D50];
    v28 = (void *)MEMORY[0x1E0CB3940];
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("Unexpected plist class (%@) of object: %@ at path: %@"), v15, self->_log, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-dictionary-log"), 5, v18);
    v20 = objc_claimAutoreleasedReturnValue();
  }

  v30 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[CESRDictionaryLog _loadLogOrCreate:readOnly:error:]";
    v44 = 2112;
    v45 = v20;
    _os_log_error_impl(&dword_1B3E5F000, v30, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v11 = (id)v20;
  a5 = v39;
  if (!a3)
    goto LABEL_27;
LABEL_14:
  if (v6)
  {
    v31 = self->_log;
    self->_log = (NSDictionary *)MEMORY[0x1E0C9AA70];

LABEL_16:
    v32 = 1;
    goto LABEL_30;
  }
  v33 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[CESRDictionaryLog _loadLogOrCreate:readOnly:error:]";
    v44 = 2112;
    v45 = (uint64_t)v9;
    _os_log_impl(&dword_1B3E5F000, v33, OS_LOG_TYPE_INFO, "%s Initializing empty log file at path: %@", buf, 0x16u);
  }
  v34 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = self->_log;
  self->_log = v34;

  v32 = SFWritePropertyList();
LABEL_30:

  return v32;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CESRDictionaryLog;
  -[CESRDictionaryLog description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_logFileURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" logFile: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isReadOnly
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (unint64_t)count
{
  return -[NSDictionary count](self->_log, "count");
}

- (id)allKeys
{
  return -[NSDictionary allKeys](self->_log, "allKeys");
}

- (id)objectForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_log, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)mutableDictionaryForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CESRDictionaryLog objectForKey:](self, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_13:
    v17 = v8;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (id)objc_msgSend(v7, "mutableCopy");
    goto LABEL_13;
  }
  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    goto LABEL_13;
  }
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v23 = *MEMORY[0x1E0CB2D50];
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Unexpected object: %@ for key: %@ expected: %@"), v7, v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-dictionary-log"), 4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v15)
    *a4 = objc_retainAutorelease(v15);
  v16 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[CESRDictionaryLog mutableDictionaryForKey:error:]";
    v21 = 2112;
    v22 = v15;
    _os_log_error_impl(&dword_1B3E5F000, v16, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  v17 = 0;
LABEL_14:

  return v17;
}

- (BOOL)writeUpdatedObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v21 = a3;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = a4;
    v10 = a3;
    objc_msgSend(v8, "arrayWithObjects:count:", &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[CESRDictionaryLog writeUpdatedObjects:forKeys:error:](self, "writeUpdatedObjects:forKeys:error:", v11, v12, a5);
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = a4;
    v17 = a3;
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Invalid {object: %@ key: %@}"), v17, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-dictionary-log"), 1, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 && v18)
      *a5 = objc_retainAutorelease(v18);

    v13 = 0;
  }

  return v13;
}

- (BOOL)writeUpdatedObjects:(id)a3 forKeys:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t i;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  char v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  NSDictionary *log;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;
  void *v59;
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[CESRDictionaryLog isReadOnly](self, "isReadOnly"))
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v60 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("instance: %@ is read only."), self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    v14 = 3;
    goto LABEL_17;
  }
  v15 = objc_msgSend(v8, "count");
  if (v15 != objc_msgSend(v9, "count"))
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v58 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected number of objects: %@ for keys: %@"), v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    v14 = 1;
LABEL_17:
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-dictionary-log"), v14, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a5 && v23)
      *a5 = objc_retainAutorelease(v23);

    goto LABEL_21;
  }
  v43 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v16 = objc_msgSend(v8, "count");
  if (objc_msgSend(v8, "count"))
  {
    for (i = 0; i < objc_msgSend(v8, "count"); ++i)
    {
      objc_msgSend(v8, "objectAtIndex:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20
        || (-[NSDictionary objectForKey:](self->_log, "objectForKey:", v19),
            (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        if (objc_msgSend(v20, "isEqual:", v18))
        {
          v21 = *MEMORY[0x1E0CFE6C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v50 = "-[CESRDictionaryLog writeUpdatedObjects:forKeys:error:]";
            v51 = 2112;
            v52 = v18;
            v53 = 2112;
            v54 = v19;
            _os_log_debug_impl(&dword_1B3E5F000, v21, OS_LOG_TYPE_DEBUG, "%s object: %@ is already recorded for key: %@", buf, 0x20u);
          }
          --v16;
          goto LABEL_14;
        }
        objc_msgSend(v11, "setObject:forKey:", v20, v19);
      }
      -[NSDictionary setObject:forKey:](self->_log, "setObject:forKey:", v18, v19);
LABEL_14:

    }
  }
  if (!v16)
  {
    v25 = 1;
    goto LABEL_23;
  }
  v48 = 0;
  v27 = SFWritePropertyList();
  v28 = 0;
  v29 = v28;
  if ((v27 & 1) != 0)
  {
    v30 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v50 = "-[CESRDictionaryLog writeUpdatedObjects:forKeys:error:]";
      v51 = 2112;
      v52 = v8;
      v53 = 2112;
      v54 = v9;
      v55 = 2112;
      v56 = v11;
      _os_log_debug_impl(&dword_1B3E5F000, v30, OS_LOG_TYPE_DEBUG, "%s Updated object(s): %@ for key(s): %@ replacing prior object(s): %@", buf, 0x2Au);
    }
    v25 = 1;
    v12 = v29;
    goto LABEL_22;
  }
  v42 = v28;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v31 = v9;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v45 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v11, "objectForKey:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        log = self->_log;
        if (v37)
          -[NSDictionary setObject:forKey:](log, "setObject:forKey:", v37, v36);
        else
          -[NSDictionary removeObjectForKey:](log, "removeObjectForKey:", v36);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    }
    while (v33);
  }

  v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write updated object(s): %@ for key(s): %@ reverting to prior object(s): %@"), v8, v31, v11);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setObject:forKey:", v40, *MEMORY[0x1E0CB2D50]);

  if (v42)
    objc_msgSend(v39, "setObject:forKey:", v42, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-dictionary-log"), 8, v39);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43 && v12)
    *v43 = objc_retainAutorelease(v12);
  v41 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[CESRDictionaryLog writeUpdatedObjects:forKeys:error:]";
    v51 = 2112;
    v52 = v12;
    _os_log_error_impl(&dword_1B3E5F000, v41, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

LABEL_21:
  v25 = 0;
LABEL_22:

LABEL_23:
  return v25;
}

- (BOOL)clearObjectForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[CESRDictionaryLog isReadOnly](self, "isReadOnly"))
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("instance: %@ is read only."), self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v11 = 3;
    goto LABEL_10;
  }
  if (!v6)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid key: %@"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;
    v11 = 1;
LABEL_10:
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-dictionary-log"), v11, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a4 && v18)
      *a4 = objc_retainAutorelease(v18);

    v13 = 0;
    goto LABEL_26;
  }
  -[NSDictionary objectForKey:](self->_log, "objectForKey:", v6);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v8 = (void *)v12;
    -[NSDictionary removeObjectForKey:](self->_log, "removeObjectForKey:", v6);
    v13 = SFWritePropertyList();
    v14 = 0;
    if ((v13 & 1) != 0)
    {
      v15 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v26 = "-[CESRDictionaryLog clearObjectForKey:error:]";
        v27 = 2112;
        v28 = v8;
        v29 = 2112;
        v30 = v6;
        _os_log_debug_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_DEBUG, "%s Removed object: %@ for key: %@", buf, 0x20u);
      }
      v16 = v14;
    }
    else
    {
      -[NSDictionary setObject:forKey:](self->_log, "setObject:forKey:", v8, v6);
      v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write removal for key: %@ reverting to prior object: %@"), v6, v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v22, *MEMORY[0x1E0CB2D50]);

      if (v14)
        objc_msgSend(v21, "setObject:forKey:", v14, *MEMORY[0x1E0CB3388]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-dictionary-log"), 8, v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4 && v16)
        *a4 = objc_retainAutorelease(v16);
      v23 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[CESRDictionaryLog clearObjectForKey:error:]";
        v27 = 2112;
        v28 = v16;
        _os_log_error_impl(&dword_1B3E5F000, v23, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v20 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[CESRDictionaryLog clearObjectForKey:error:]";
      v27 = 2112;
      v28 = v6;
      _os_log_debug_impl(&dword_1B3E5F000, v20, OS_LOG_TYPE_DEBUG, "%s No object exists for key: %@", buf, 0x16u);
    }
    v8 = 0;
    v13 = 1;
  }
LABEL_26:

  return v13;
}

- (BOOL)clear:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  NSURL *logFileURL;
  char v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (-[CESRDictionaryLog isReadOnly](self, "isReadOnly"))
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("instance: %@ is read only."), self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-dictionary-log"), 3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
    if (a3 && v8)
    {
      v9 = objc_retainAutorelease(v8);
      v10 = 0;
      *a3 = v9;
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_logFileURL, "path");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9 || !objc_msgSend(v7, "fileExistsAtPath:", v9))
  {
    v13 = 0;
    goto LABEL_17;
  }
  logFileURL = self->_logFileURL;
  v18 = 0;
  v12 = objc_msgSend(v7, "removeItemAtURL:error:", logFileURL, &v18);
  v13 = v18;
  if ((v12 & 1) != 0)
  {
LABEL_17:
    -[NSDictionary removeAllObjects](self->_log, "removeAllObjects");
    v10 = 1;
    v6 = v13;
    goto LABEL_18;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to remove log file at path: %@"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v15, *MEMORY[0x1E0CB2D50]);

  if (v13)
    objc_msgSend(v14, "setObject:forKey:", v13, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-dictionary-log"), 8, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v6)
    *a3 = objc_retainAutorelease(v6);
  v16 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[CESRDictionaryLog clear:]";
    v21 = 2112;
    v22 = v6;
    _os_log_error_impl(&dword_1B3E5F000, v16, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[CESRDictionaryLog isEqualToDictionaryLog:](self, "isEqualToDictionaryLog:", v4);

  return v5;
}

- (BOOL)isEqualToDictionaryLog:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  if (-[NSURL isEqual:](self->_logFileURL, "isEqual:", v4[1])
    && self->_protectionClass == *((_DWORD *)v4 + 6))
  {
    v5 = -[NSDictionary isEqual:](self->_log, "isEqual:", v4[2]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSURL hash](self->_logFileURL, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_protectionClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[NSDictionary hash](self->_log, "hash");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_logFileURL, 0);
}

@end
