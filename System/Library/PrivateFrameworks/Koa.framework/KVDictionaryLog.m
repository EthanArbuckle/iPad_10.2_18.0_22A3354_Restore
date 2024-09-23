@implementation KVDictionaryLog

- (KVDictionaryLog)initWithFilename:(id)a3 directory:(id)a4 readOnly:(BOOL)a5 error:(id *)a6
{
  return (KVDictionaryLog *)MEMORY[0x1E0DE7D20](self, sel_initWithFilename_protectionClass_directory_readOnly_create_error_, a3, 0xFFFFFFFFLL);
}

- (KVDictionaryLog)initWithFilename:(id)a3 protectionClass:(int)a4 directory:(id)a5 readOnly:(BOOL)a6 create:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  KVDictionaryLog *v18;
  uint64_t v19;
  NSURL *logFileURL;
  const char *v21;
  KVDictionaryLog *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  objc_super v31;
  uint64_t v32;
  _QWORD v33[2];

  v9 = a7;
  v10 = a6;
  v33[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v31.receiver = self;
  v31.super_class = (Class)KVDictionaryLog;
  v18 = -[KVDictionaryLog init](&v31, sel_init);
  if (!v18)
    goto LABEL_5;
  if (!v14 || !v15)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("Invalid {filename: %@, directory: %@}"), v17, v14, v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v24;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)v33, (uint64_t)&v32, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v23, v27, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 2, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a8 && v28)
      *a8 = objc_retainAutorelease(v28);

    goto LABEL_10;
  }
  objc_msgSend_fileURLWithPath_relativeToURL_(MEMORY[0x1E0C99E98], v16, (uint64_t)v14, (uint64_t)v15);
  v19 = objc_claimAutoreleasedReturnValue();
  logFileURL = v18->_logFileURL;
  v18->_logFileURL = (NSURL *)v19;

  v18->_protectionClass = a4;
  if (!objc_msgSend__loadLogOrCreate_readOnly_error_(v18, v21, v9, v10, a8))
  {
LABEL_10:
    v22 = 0;
    goto LABEL_11;
  }
LABEL_5:
  v22 = v18;
LABEL_11:

  return v22;
}

- (KVDictionaryLog)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)_loadLogOrCreate:(BOOL)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  void *v9;
  NSURL *logFileURL;
  NSDictionary *v11;
  id v12;
  NSDictionary *log;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  NSObject *v42;
  NSDictionary *v43;
  char v44;
  NSObject *v45;
  NSDictionary *v46;
  NSDictionary *v47;
  const char *v48;
  uint64_t v49;
  void *v51;
  id *v52;
  id v53;
  uint64_t v54;
  id v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  _QWORD v67[3];

  v6 = a4;
  v67[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_path(self->_logFileURL, a2, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  logFileURL = self->_logFileURL;
  v53 = 0;
  KVReadPropertyList((uint64_t)logFileURL, (const char *)!v6, (uint64_t)&v53);
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v12 = v53;
  log = self->_log;
  self->_log = v11;

  if (!self->_log)
  {
    v29 = objc_msgSend_code(v12, v14, v15, v16);
    v30 = qword_1ED114588;
    if (v29 == 260)
    {
      if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v57 = "-[KVDictionaryLog _loadLogOrCreate:readOnly:error:]";
        v58 = 2112;
        v59 = (uint64_t)v9;
        _os_log_debug_impl(&dword_1B70E7000, v30, OS_LOG_TYPE_DEBUG, "%s No prior log found at path: %@", buf, 0x16u);
      }
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v62 = *MEMORY[0x1E0CB3388];
      v63 = v12;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v31, (uint64_t)&v63, (uint64_t)&v62, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v32, v34, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 6, v33);
LABEL_26:
      v49 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v49;
      if (a3)
        goto LABEL_14;
LABEL_27:
      v44 = 0;
      if (a5 && v12)
      {
        v12 = objc_retainAutorelease(v12);
        v44 = 0;
        *a5 = v12;
      }
      goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v57 = "-[KVDictionaryLog _loadLogOrCreate:readOnly:error:]";
      v58 = 2112;
      v59 = (uint64_t)v9;
      v60 = 2112;
      v61 = v12;
      _os_log_error_impl(&dword_1B70E7000, v30, OS_LOG_TYPE_ERROR, "%s Failed to read prior log file at path: %@ error: %@", buf, 0x20u);
      if (v12)
        goto LABEL_22;
    }
    else if (v12)
    {
LABEL_22:
      v54 = *MEMORY[0x1E0CB3388];
      v55 = v12;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v48, (uint64_t)&v55, (uint64_t)&v54, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v48, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 7, v33);
      goto LABEL_26;
    }
    v33 = 0;
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
    v52 = a5;
    v51 = (void *)MEMORY[0x1E0CB35C8];
    v66 = *MEMORY[0x1E0CB2D50];
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v17, v22, (uint64_t)CFSTR("Expected mutable plist class (%@) but received class (%@) for object: %@ at path: %@"), v23, v19, v21, self->_log, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v24;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)v67, (uint64_t)&v66, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v51, v27, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 5, v26);
    v28 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v26;
  }
  else
  {
    v52 = a5;
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v64 = *MEMORY[0x1E0CB2D50];
    v36 = (void *)MEMORY[0x1E0CB3940];
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v36, v38, (uint64_t)CFSTR("Unexpected plist class (%@) of object: %@ at path: %@"), v39, v19, self->_log, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v21;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v40, (uint64_t)&v65, (uint64_t)&v64, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v35, v41, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 5, v24);
    v28 = objc_claimAutoreleasedReturnValue();
  }

  v42 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[KVDictionaryLog _loadLogOrCreate:readOnly:error:]";
    v58 = 2112;
    v59 = v28;
    _os_log_error_impl(&dword_1B70E7000, v42, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v12 = (id)v28;
  a5 = v52;
  if (!a3)
    goto LABEL_27;
LABEL_14:
  if (v6)
  {
    v43 = self->_log;
    self->_log = (NSDictionary *)MEMORY[0x1E0C9AA70];

LABEL_16:
    v44 = 1;
    goto LABEL_30;
  }
  v45 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[KVDictionaryLog _loadLogOrCreate:readOnly:error:]";
    v58 = 2112;
    v59 = (uint64_t)v9;
    _os_log_impl(&dword_1B70E7000, v45, OS_LOG_TYPE_INFO, "%s Initializing empty log file at path: %@", buf, 0x16u);
  }
  v46 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = self->_log;
  self->_log = v46;

  v44 = KVWritePropertyList((uint64_t)self->_log, self->_logFileURL, self->_protectionClass, (uint64_t)a5);
LABEL_30:

  return v44;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)KVDictionaryLog;
  -[KVDictionaryLog description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(self->_logFileURL, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v8, (uint64_t)CFSTR(" logFile: %@"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isReadOnly
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (unint64_t)count
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_log, a2, v2, v3);
}

- (id)allKeys
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_allKeys(self->_log, a2, v2, v3);
}

- (id)objectForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_objectForKey_(self->_log, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_copy(v4, v5, v6, v7);

  return v8;
}

- (id)mutableDictionaryForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_objectForKey_(self, v7, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
LABEL_13:
    v26 = v10;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (id)objc_msgSend_mutableCopy(v9, v11, v12, v13);
    goto LABEL_13;
  }
  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    goto LABEL_13;
  }
  v14 = (void *)MEMORY[0x1E0CB35C8];
  v32 = *MEMORY[0x1E0CB2D50];
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v15, v18, (uint64_t)CFSTR("Unexpected object: %@ for key: %@ expected: %@"), v19, v9, v6, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v20;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v33, (uint64_t)&v32, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v14, v23, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 4, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v24)
    *a4 = objc_retainAutorelease(v24);
  v25 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[KVDictionaryLog mutableDictionaryForKey:error:]";
    v30 = 2112;
    v31 = v24;
    _os_log_error_impl(&dword_1B70E7000, v25, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  v26 = 0;
LABEL_14:

  return v26;
}

- (BOOL)writeUpdatedObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  void *v25;
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v28 = a3;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = a4;
    v10 = a3;
    objc_msgSend_arrayWithObjects_count_(v8, v11, (uint64_t)&v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v9;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v13, (uint64_t)&v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend_writeUpdatedObjects_forKeys_error_(self, v15, (uint64_t)v12, (uint64_t)v14, a5);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = a4;
    v20 = a3;
    objc_msgSend_stringWithFormat_(v18, v21, (uint64_t)CFSTR("Invalid {object: %@ key: %@}"), v22, v20, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v12;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v30, (uint64_t)&v29, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v24, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 1, v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 && v25)
      *a5 = objc_retainAutorelease(v25);

    v16 = 0;
  }

  return v16;
}

- (BOOL)writeUpdatedObjects:(id)a3 forKeys:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  unint64_t i;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  void *v61;
  void *v62;
  BOOL v63;
  NSDictionary *log;
  NSURL *logFileURL;
  int protectionClass;
  char v68;
  id v69;
  id v70;
  NSObject *v71;
  id v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  NSDictionary *v84;
  id v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  NSObject *v91;
  void *v92;
  id *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  uint8_t buf[4];
  const char *v100;
  __int16 v101;
  id v102;
  __int16 v103;
  id v104;
  __int16 v105;
  void *v106;
  _BYTE v107[128];
  uint64_t v108;
  void *v109;
  uint64_t v110;
  _QWORD v111[3];

  v111[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend_isReadOnly(self, v10, v11, v12))
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v110 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v13, (uint64_t)CFSTR("instance: %@ is read only."), v15, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v111[0] = v17;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v111, (uint64_t)&v110, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v20, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 3, v19);
    goto LABEL_17;
  }
  v21 = objc_msgSend_count(v8, v13, v14, v15);
  if (v21 != objc_msgSend_count(v9, v22, v23, v24))
  {
    v58 = (void *)MEMORY[0x1E0CB35C8];
    v108 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v25, (uint64_t)CFSTR("Unexpected number of objects: %@ for keys: %@"), v26, v8, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v17;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v59, (uint64_t)&v109, (uint64_t)&v108, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v58, v60, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 1, v19);
LABEL_17:
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (a5 && v61)
      *a5 = objc_retainAutorelease(v61);

    goto LABEL_21;
  }
  v93 = a5;
  v27 = objc_alloc(MEMORY[0x1E0C99E08]);
  v31 = objc_msgSend_count(v9, v28, v29, v30);
  v17 = (void *)objc_msgSend_initWithCapacity_(v27, v32, v31, v33);
  v37 = objc_msgSend_count(v8, v34, v35, v36);
  if (objc_msgSend_count(v8, v38, v39, v40))
  {
    for (i = 0; i < objc_msgSend_count(v8, v55, v56, v57); ++i)
    {
      objc_msgSend_objectAtIndex_(v8, v41, i, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v9, v45, i, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v17, v48, (uint64_t)v47, v49);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52
        || (objc_msgSend_objectForKey_(self->_log, v50, (uint64_t)v47, v51),
            (v52 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        if (objc_msgSend_isEqual_(v52, v50, (uint64_t)v44, v51))
        {
          v54 = qword_1ED114588;
          if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v100 = "-[KVDictionaryLog writeUpdatedObjects:forKeys:error:]";
            v101 = 2112;
            v102 = v44;
            v103 = 2112;
            v104 = v47;
            _os_log_debug_impl(&dword_1B70E7000, v54, OS_LOG_TYPE_DEBUG, "%s object: %@ is already recorded for key: %@", buf, 0x20u);
          }
          --v37;
          goto LABEL_14;
        }
        objc_msgSend_setObject_forKey_(v17, v53, (uint64_t)v52, (uint64_t)v47);
      }
      objc_msgSend_setObject_forKey_(self->_log, v50, (uint64_t)v44, (uint64_t)v47);
LABEL_14:

    }
  }
  if (!v37)
  {
    v63 = 1;
    goto LABEL_23;
  }
  logFileURL = self->_logFileURL;
  log = self->_log;
  protectionClass = self->_protectionClass;
  v98 = 0;
  v68 = KVWritePropertyList((uint64_t)log, logFileURL, protectionClass, (uint64_t)&v98);
  v69 = v98;
  v70 = v69;
  if ((v68 & 1) != 0)
  {
    v71 = qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v100 = "-[KVDictionaryLog writeUpdatedObjects:forKeys:error:]";
      v101 = 2112;
      v102 = v8;
      v103 = 2112;
      v104 = v9;
      v105 = 2112;
      v106 = v17;
      _os_log_debug_impl(&dword_1B70E7000, v71, OS_LOG_TYPE_DEBUG, "%s Updated object(s): %@ for key(s): %@ replacing prior object(s): %@", buf, 0x2Au);
    }
    v63 = 1;
    v19 = v70;
    goto LABEL_22;
  }
  v92 = v69;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v72 = v9;
  v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v94, (uint64_t)v107, 16);
  if (v74)
  {
    v77 = v74;
    v78 = *(_QWORD *)v95;
    do
    {
      for (j = 0; j != v77; ++j)
      {
        if (*(_QWORD *)v95 != v78)
          objc_enumerationMutation(v72);
        v80 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * j);
        objc_msgSend_objectForKey_(v17, v75, v80, v76);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = self->_log;
        if (v83)
          objc_msgSend_setObject_forKey_(v84, v81, (uint64_t)v83, v80);
        else
          objc_msgSend_removeObjectForKey_(v84, v81, v80, v82);

      }
      v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v94, (uint64_t)v107, 16);
    }
    while (v77);
  }

  v85 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v86, (uint64_t)CFSTR("Failed to write updated object(s): %@ for key(s): %@ reverting to prior object(s): %@"), v87, v8, v72, v17);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v85, v89, (uint64_t)v88, *MEMORY[0x1E0CB2D50]);

  if (v92)
    objc_msgSend_setObject_forKey_(v85, v90, (uint64_t)v92, *MEMORY[0x1E0CB3388]);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v90, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 8, v85);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v93 && v19)
    *v93 = objc_retainAutorelease(v19);
  v91 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v100 = "-[KVDictionaryLog writeUpdatedObjects:forKeys:error:]";
    v101 = 2112;
    v102 = v19;
    _os_log_error_impl(&dword_1B70E7000, v91, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

LABEL_21:
  v63 = 0;
LABEL_22:

LABEL_23:
  return v63;
}

- (BOOL)clearObjectForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  NSDictionary *log;
  NSURL *logFileURL;
  int protectionClass;
  char v23;
  const char *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  const char *v29;
  const char *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  NSObject *v40;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend_isReadOnly(self, v7, v8, v9))
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("instance: %@ is read only."), v11, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v13;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v52, (uint64_t)&v51, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v16, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 3, v15);
    goto LABEL_10;
  }
  if (!v6)
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("Invalid key: %@"), v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v13;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v29, (uint64_t)&v50, (uint64_t)&v49, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 1, v15);
LABEL_10:
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (a4 && v31)
      *a4 = objc_retainAutorelease(v31);

    v23 = 0;
    goto LABEL_26;
  }
  objc_msgSend_objectForKey_(self->_log, v10, (uint64_t)v6, v11);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v13 = (void *)v17;
    objc_msgSend_removeObjectForKey_(self->_log, v18, (uint64_t)v6, v19);
    logFileURL = self->_logFileURL;
    log = self->_log;
    protectionClass = self->_protectionClass;
    v42 = 0;
    v23 = KVWritePropertyList((uint64_t)log, logFileURL, protectionClass, (uint64_t)&v42);
    v25 = v42;
    if ((v23 & 1) != 0)
    {
      v26 = qword_1ED114588;
      if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v44 = "-[KVDictionaryLog clearObjectForKey:error:]";
        v45 = 2112;
        v46 = v13;
        v47 = 2112;
        v48 = v6;
        _os_log_debug_impl(&dword_1B70E7000, v26, OS_LOG_TYPE_DEBUG, "%s Removed object: %@ for key: %@", buf, 0x20u);
      }
      v27 = v25;
    }
    else
    {
      objc_msgSend_setObject_forKey_(self->_log, v24, (uint64_t)v13, (uint64_t)v6);
      v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v35, (uint64_t)CFSTR("Failed to write removal for key: %@ reverting to prior object: %@"), v36, v6, v13);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v34, v38, (uint64_t)v37, *MEMORY[0x1E0CB2D50]);

      if (v25)
        objc_msgSend_setObject_forKey_(v34, v39, (uint64_t)v25, *MEMORY[0x1E0CB3388]);
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v39, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 8, v34);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4 && v27)
        *a4 = objc_retainAutorelease(v27);
      v40 = qword_1ED114588;
      if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[KVDictionaryLog clearObjectForKey:error:]";
        v45 = 2112;
        v46 = v27;
        _os_log_error_impl(&dword_1B70E7000, v40, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v33 = qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[KVDictionaryLog clearObjectForKey:error:]";
      v45 = 2112;
      v46 = v6;
      _os_log_debug_impl(&dword_1B70E7000, v33, OS_LOG_TYPE_DEBUG, "%s No object exists for key: %@", buf, 0x16u);
    }
    v13 = 0;
    v23 = 1;
  }
LABEL_26:

  return v23;
}

- (BOOL)clear:(id *)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  BOOL v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSURL *logFileURL;
  char v24;
  id v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  NSObject *v32;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isReadOnly(self, a2, (uint64_t)a3, v3))
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("instance: %@ is read only."), v8, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v10;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v40, (uint64_t)&v39, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v9, v13, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 3, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = 0;
    if (a3 && v14)
    {
      v15 = objc_retainAutorelease(v14);
      v16 = 0;
      *a3 = v15;
    }
    goto LABEL_18;
  }
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v6, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(self->_logFileURL, v17, v18, v19);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15 || !objc_msgSend_fileExistsAtPath_(v12, v20, (uint64_t)v15, v22))
  {
    v25 = 0;
    goto LABEL_17;
  }
  logFileURL = self->_logFileURL;
  v34 = 0;
  v24 = objc_msgSend_removeItemAtURL_error_(v12, v20, (uint64_t)logFileURL, (uint64_t)&v34);
  v25 = v34;
  if ((v24 & 1) != 0)
  {
LABEL_17:
    objc_msgSend_removeAllObjects(self->_log, v20, v21, v22);
    v16 = 1;
    v10 = v25;
    goto LABEL_18;
  }
  v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v27, (uint64_t)CFSTR("Failed to remove log file at path: %@"), v28, v15);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v26, v30, (uint64_t)v29, *MEMORY[0x1E0CB2D50]);

  if (v25)
    objc_msgSend_setObject_forKey_(v26, v31, (uint64_t)v25, *MEMORY[0x1E0CB3388]);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v31, (uint64_t)CFSTR("com.apple.koa.dictionary.log"), 8, v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v10)
    *a3 = objc_retainAutorelease(v10);
  v32 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[KVDictionaryLog clear:]";
    v37 = 2112;
    v38 = v10;
    _os_log_error_impl(&dword_1B70E7000, v32, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  v16 = 0;
LABEL_18:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char isEqualToDictionaryLog;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    isEqualToDictionaryLog = objc_msgSend_isEqualToDictionaryLog_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToDictionaryLog = 0;

  return isEqualToDictionaryLog;
}

- (BOOL)isEqualToDictionaryLog:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  char isEqual;

  v4 = a3;
  if (objc_msgSend_isEqual_(self->_logFileURL, v5, v4[1], v6)
    && self->_protectionClass == *((_DWORD *)v4 + 6))
  {
    isEqual = objc_msgSend_isEqual_(self->_log, v7, v4[2], v8);
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v5 = objc_msgSend_hash(self->_logFileURL, a2, v2, v3);
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v6, self->_protectionClass, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_hash(v8, v9, v10, v11);
  v16 = v12 ^ v5 ^ objc_msgSend_hash(self->_log, v13, v14, v15);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_logFileURL, 0);
}

+ (void)initialize
{
  if (qword_1ED114580 != -1)
    dispatch_once(&qword_1ED114580, &unk_1E6B7B4A0);
}

@end
