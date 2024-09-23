@implementation __NSCFResumableUploadState

- (BOOL)isResumable
{
  if (self)
    LOBYTE(self) = (self->_state - 1) <= 2 && self->_bodyType != -1 && self->_retryCounter < 4;
  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadFile, 0);
  objc_storeStrong((id *)&self->_draftVersion, 0);
  objc_storeStrong((id *)&self->_resumeURL, 0);
  objc_storeStrong((id *)&self->_uploadData, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
}

- (void)setUploadFile:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (id)createResumeDataForTaskInfo
{
  NSObject *v3;
  uint8_t v5[16];

  if (self && self->_bodyType && !objc_getProperty(self, a2, 40, 1))
  {
    -[__NSCFResumableUploadState createResumeDataForTaskInfo:error:]((uint64_t)self, 1, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v3 = (id)CFNLog::logger;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_183ECA000, v3, OS_LOG_TYPE_ERROR, "ResumableUploadState: cannot create resume data for task info with body data type", v5, 2u);
    }

    return 0;
  }
}

- (id)createResumeDataForTaskInfo:(_QWORD *)a3 error:
{
  NSObject *v6;
  SEL v7;
  SEL v8;
  const char *v9;
  void *v10;
  SEL v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t i;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)a1, "isResumable") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", objc_getProperty((id)a1, v7, 56, 1), CFSTR("draftVersion"));
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", objc_getProperty((id)a1, v8, 48, 1), CFSTR("resumeURL"));
    if ((a2 & 1) == 0)
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", objc_getProperty((id)a1, v9, 32, 1), CFSTR("originalRequest"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, CFSTR("bodyType"));

    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", objc_getProperty((id)a1, v11, 40, 1), CFSTR("uploadData"));
    objc_msgSend((id)a1, "uploadFile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, CFSTR("uploadFile"));

    if ((*(_QWORD *)(a1 + 64) & 0x8000000000000000) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v13, CFSTR("streamLength"));

    }
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v24;
    v16 = (void *)objc_msgSend(v14, "mutableCopy");

    if (v16)
    {
      v17 = objc_retainAutorelease(v16);
      v18 = objc_msgSend(v17, "mutableBytes");
      for (i = 0; i != 8; ++i)
      {
        if (i >= objc_msgSend(v17, "length"))
          break;
        *(_BYTE *)(v18 + i) ^= kResumeDataMagicBytes[i];
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v21 = (id)CFNLog::logger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_183ECA000, v21, OS_LOG_TYPE_ERROR, "ResumableUploadState: createResumeData archiver returned nil", buf, 2u);
      }

      if (!v15)
        goto LABEL_27;
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v22 = (id)CFNLog::logger;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v15;
        _os_log_error_impl(&dword_183ECA000, v22, OS_LOG_TYPE_ERROR, "ResumableUploadState: createResumeData archiver error: %@", buf, 0xCu);
      }

      if (a3)
      {
        v20 = 0;
        *a3 = objc_retainAutorelease(v15);
      }
      else
      {
LABEL_27:
        v20 = 0;
      }
    }

  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v6 = (id)CFNLog::logger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_183ECA000, v6, OS_LOG_TYPE_DEBUG, "ResumableUploadState: createResumeData returning nil because we are not resumable", buf, 2u);
    }
    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t state;
  const char *v5;
  id Property;
  const char *v7;
  id v8;
  const char *v9;
  id v10;
  uint64_t bodyType;
  const char *v12;
  id v13;
  void *v14;
  int64_t offset;
  int64_t streamLength;
  _BOOL8 userOverride;
  id v18;

  v18 = a3;
  if (self)
    state = self->_state;
  else
    state = 0;
  objc_msgSend(v18, "encodeInt:forKey:", state, CFSTR("state"));
  if (self)
    Property = objc_getProperty(self, v5, 56, 1);
  else
    Property = 0;
  objc_msgSend(v18, "encodeObject:forKey:", Property, CFSTR("draftVersion"));
  if (self)
    v8 = objc_getProperty(self, v7, 32, 1);
  else
    v8 = 0;
  objc_msgSend(v18, "encodeObject:forKey:", v8, CFSTR("originalRequest"));
  if (self)
    v10 = objc_getProperty(self, v9, 48, 1);
  else
    v10 = 0;
  objc_msgSend(v18, "encodeObject:forKey:", v10, CFSTR("resumeURL"));
  if (self)
    bodyType = self->_bodyType;
  else
    bodyType = 0;
  objc_msgSend(v18, "encodeInt:forKey:", bodyType, CFSTR("bodyType"));
  if (self)
    v13 = objc_getProperty(self, v12, 40, 1);
  else
    v13 = 0;
  objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("uploadData"));
  -[__NSCFResumableUploadState uploadFile](self, "uploadFile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v14, CFSTR("uploadFile"));

  if (self)
    offset = self->_offset;
  else
    offset = 0;
  objc_msgSend(v18, "encodeInt64:forKey:", offset, CFSTR("offset"));
  if (self)
    streamLength = self->_streamLength;
  else
    streamLength = 0;
  objc_msgSend(v18, "encodeInt64:forKey:", streamLength, CFSTR("streamLength"));
  if (self)
    userOverride = self->_userOverride;
  else
    userOverride = 0;
  objc_msgSend(v18, "encodeBool:forKey:", userOverride, CFSTR("userOverride"));

}

- (__NSCFResumableUploadState)initWithCoder:(id)a3
{
  id v4;
  __NSCFResumableUploadState *v5;
  void *v6;
  SEL v7;
  void *v8;
  SEL v9;
  void *v10;
  SEL v11;
  void *v12;
  SEL v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)__NSCFResumableUploadState;
  v5 = -[__NSCFResumableUploadState init](&v16, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeIntForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("draftVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v5, v7, v6, 56);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic_copy(v5, v9, v8, 32);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resumeURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v5, v11, v10, 48);

    v5->_bodyType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("bodyType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uploadData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v5, v13, v12, 40);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uploadFile"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[__NSCFResumableUploadState setUploadFile:](v5, "setUploadFile:", v14);

    v5->_offset = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("offset"));
    v5->_streamLength = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamLength"));
    v5->_userOverride = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userOverride"));
  }

  return v5;
}

- (NSURL)uploadFile
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

+ (id)rusWithResumeData:(id)a3 originalRequest:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = -[__NSCFResumableUploadState initWithResumeData:originalRequest:]([__NSCFResumableUploadState alloc], v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initWithResumeData:(void *)a3 originalRequest:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  SEL v17;
  id v18;
  SEL v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  SEL v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  const char *v32;
  id Property;
  int v34;
  void *v35;
  char v36;
  void *v37;
  SEL v38;
  void *v39;
  char v40;
  int v41;
  NSObject *v42;
  const char *v43;
  id v44;
  void *v46;
  char v47;
  void *v48;
  char v49;
  void *v50;
  char v51;
  SEL v52;
  id v53;
  objc_super v54;
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_65;
  if (!v5)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v26 = (id)CFNLog::logger;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v26, OS_LOG_TYPE_ERROR, "ResumableUploadState: cannot initWithResumeData with nil resume data", buf, 2u);
    }

    goto LABEL_65;
  }
  v54.receiver = a1;
  v54.super_class = (Class)__NSCFResumableUploadState;
  a1 = objc_msgSendSuper2(&v54, sel_init);
  if (!a1)
  {
LABEL_66:
    a1 = a1;
    v44 = a1;
    goto LABEL_67;
  }
  v7 = objc_retainAutorelease((id)objc_msgSend(v5, "mutableCopy"));
  v8 = objc_msgSend(v7, "mutableBytes");
  for (i = 0; i != 8; ++i)
  {
    if (i >= objc_msgSend(v7, "length"))
      break;
    *(_BYTE *)(v8 + i) ^= kResumeDataMagicBytes[i];
  }
  v10 = (void *)MEMORY[0x1E0CB3710];
  if (resumeDataClasses(void)::onceToken != -1)
    dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_1509);
  v11 = (id)resumeDataClasses(void)::resumeDataClasses;
  v53 = 0;
  objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v11, v7, &v53);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v53;

  if (!v12)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v27 = (id)CFNLog::logger;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v27, OS_LOG_TYPE_ERROR, "ResumableUploadState: initWithResumeData unarchiver returned nil", buf, 2u);
    }

    if (!v13)
    {
      v34 = 1;
      goto LABEL_64;
    }
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v28 = (id)CFNLog::logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_62;
    *(_DWORD *)buf = 138412290;
    v56 = v13;
    v29 = "ResumableUploadState: initWithResumeData unarchiver error: %@";
LABEL_40:
    v30 = v28;
    v31 = 12;
    goto LABEL_41;
  }
  *((_DWORD *)a1 + 3) = 2;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("draftVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v28 = (id)CFNLog::logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_62;
    *(_WORD *)buf = 0;
    v29 = "ResumableUploadState: cannot initWithResumeData with nil draft version";
    goto LABEL_35;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("draftVersion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(a1, v17, v16, 56);

  if (supportedDraftVersions(void)::onceToken != -1)
    dispatch_once(&supportedDraftVersions(void)::onceToken, &__block_literal_global_91);
  v18 = (id)supportedDraftVersions(void)::supportedDraftVersions;
  v20 = objc_msgSend(v18, "containsObject:", objc_getProperty(a1, v19, 56, 1));

  if ((v20 & 1) == 0)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v28 = (id)CFNLog::logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_62;
    Property = objc_getProperty(a1, v32, 56, 1);
    *(_DWORD *)buf = 138412290;
    v56 = Property;
    v29 = "ResumableUploadState: cannot initWithResumeData with unsupported draft version: %@";
    goto LABEL_40;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("resumeURL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) == 0)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v28 = (id)CFNLog::logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_62;
    *(_WORD *)buf = 0;
    v29 = "ResumableUploadState: cannot initWithResumeData with nil resume URL";
    goto LABEL_35;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("resumeURL"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(a1, v24, v23, 48);

  if (v6)
  {
    objc_setProperty_atomic_copy(a1, v25, v6, 32);
  }
  else
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("originalRequest"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = objc_opt_isKindOfClass();

    if ((v36 & 1) == 0)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v28 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_62;
      *(_WORD *)buf = 0;
      v29 = "ResumableUploadState: cannot initWithResumeData with nil request";
      goto LABEL_35;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("originalRequest"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic_copy(a1, v38, v37, 32);

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bodyType"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v40 = objc_opt_isKindOfClass();

  if ((v40 & 1) != 0)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bodyType"));
    v28 = objc_claimAutoreleasedReturnValue();
    v41 = -[NSObject intValue](v28, "intValue");
    *((_DWORD *)a1 + 4) = v41;
    switch(v41)
    {
      case -1:
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v42 = (id)CFNLog::logger;
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          goto LABEL_89;
        *(_WORD *)buf = 0;
        v43 = "ResumableUploadState: cannot initWithResumeData with unknown body type";
        goto LABEL_88;
      case 0:
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("uploadData"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v51 = objc_opt_isKindOfClass();

        if ((v51 & 1) != 0)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("uploadData"));
          v42 = objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic(a1, v52, v42, 40);
          goto LABEL_78;
        }
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v42 = (id)CFNLog::logger;
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          goto LABEL_89;
        *(_WORD *)buf = 0;
        v43 = "ResumableUploadState: cannot initWithResumeData with nil upload data";
        goto LABEL_88;
      case 1:
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("uploadFile"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v47 = objc_opt_isKindOfClass();

        if ((v47 & 1) != 0)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("uploadFile"));
          v42 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setUploadFile:", v42);
LABEL_78:
          v34 = 0;
        }
        else
        {
          if (CFNLog::onceToken != -1)
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
          v42 = (id)CFNLog::logger;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v43 = "ResumableUploadState: cannot initWithResumeData with nil upload file";
LABEL_88:
            _os_log_error_impl(&dword_183ECA000, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
          }
LABEL_89:
          v34 = 1;
        }
        goto LABEL_90;
      case 2:
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("streamLength"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v49 = objc_opt_isKindOfClass();

        if ((v49 & 1) != 0)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("streamLength"));
          v42 = objc_claimAutoreleasedReturnValue();
          v34 = 0;
          *((_QWORD *)a1 + 8) = -[NSObject integerValue](v42, "integerValue");
LABEL_90:

        }
        else
        {
          v34 = 0;
        }
        break;
      default:
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v42 = (id)CFNLog::logger;
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          goto LABEL_89;
        *(_WORD *)buf = 0;
        v43 = "ResumableUploadState: cannot initWithResumeData with unrecognized body type";
        goto LABEL_88;
    }
    goto LABEL_63;
  }
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v28 = (id)CFNLog::logger;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v29 = "ResumableUploadState: cannot initWithResumeData with nil body type";
LABEL_35:
    v30 = v28;
    v31 = 2;
LABEL_41:
    _os_log_error_impl(&dword_183ECA000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
  }
LABEL_62:
  v34 = 1;
LABEL_63:

LABEL_64:
  if (!v34)
    goto LABEL_66;
LABEL_65:
  v44 = 0;
LABEL_67:

  return v44;
}

+ (__NSCFResumableUploadState)rusWithResumeData:(uint64_t)a1
{
  id v2;
  __NSCFResumableUploadState *v3;
  id v4;

  v2 = a2;
  objc_opt_self();
  v3 = [__NSCFResumableUploadState alloc];
  v4 = v2;
  if (v3)
    v3 = (__NSCFResumableUploadState *)-[__NSCFResumableUploadState initWithResumeData:originalRequest:](v3, v4, 0);

  return v3;
}

- (id)createResumeData:(void *)a1
{
  if (a1)
  {
    -[__NSCFResumableUploadState createResumeDataForTaskInfo:error:]((uint64_t)a1, 0, a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)uploadOffsetFromResponse:(uint64_t)a1
{
  uint64_t v1;
  CFDictionaryRef *v2;
  __CFString *v3;
  uint64_t v4;
  void (**v6)(StringSerializable *__hidden);
  CFTypeRef cf;

  v1 = a1;
  if (a1)
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
    if (*(_BYTE *)(v1 + 40))
      v1 += 16;
    else
      v1 = 0;
  }
  HTTPHeaderKeyMixedValue::HTTPHeaderKeyMixedValue(&v6, 0x14B1B40Eu);
  v2 = (CFDictionaryRef *)HTTPMessage::headers((os_unfair_lock_s *)v1);
  v3 = (__CFString *)HTTPHeaderDict::copyStringValue(v2, (const __CFAllocator *)*MEMORY[0x1E0C9AE00], (const HTTPHeaderKeyMixedValue *)&v6);
  v6 = &off_1E14E9A00;
  if (cf)
    CFRelease(cf);
  v4 = -[__CFString longLongValue](v3, "longLongValue", v6);

  return v4;
}

- (CFURLRef)resumeURLFromResponse:(void *)a1
{
  HTTPMessage *v4;
  const __CFString *HeaderFieldValue;
  const __CFString *v6;
  const __CFAllocator *v7;
  const __CFString *v8;
  const char *v9;
  const __CFURL *v10;
  const __CFURL *v11;
  CFURLRef v12;
  const __CFString *v13;
  const __CFString *v14;

  if (a2)
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
    if (*(_BYTE *)(a2 + 40))
      v4 = (HTTPMessage *)(a2 + 16);
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  HeaderFieldValue = HTTPMessage::copyLastHeaderFieldValue(v4, 0x12E1132Au);
  if (!HeaderFieldValue)
    goto LABEL_18;
  v6 = HeaderFieldValue;
  if (!CFStringGetLength(HeaderFieldValue))
    goto LABEL_18;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v8 = CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, CFSTR("%#?:;/@=&[]"),
         0,
         0x201u);
  CFRelease(v6);
  if (!v8)
    goto LABEL_18;
  objc_msgSend(objc_getProperty(a1, v9, 32, 1), "URL");
  v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v11 = CFURLCreateWithString(v7, v8, v10);

  if (!v11)
  {
    CFRelease(v8);
LABEL_18:
    v12 = 0;
    return v12;
  }
  v12 = CFURLCopyAbsoluteURL(v11);
  CFRelease(v11);
  CFRelease(v8);
  if (v12)
  {
    v13 = CFURLCopyScheme(v12);
    if (v13)
    {
      v14 = v13;
      if (CFStringCompare(v13, (CFStringRef)&unk_1EDD00A00, 1uLL) == kCFCompareEqualTo)
      {
        CFRelease(v12);
        v12 = 0;
      }
      CFRelease(v14);
    }
  }
  return v12;
}

- (uint64_t)processResponse:(uint64_t)a1
{
  CFIndex ResponseStatusCode;
  NSObject *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  os_unfair_lock_s *v11;
  __CFString *v12;
  __CFString *v13;
  char v14;
  char v15;
  int v16;
  unsigned int v17;
  const __CFString *v18;
  uint64_t v19;
  CFDictionaryRef *v20;
  const char *v21;
  __CFString *v22;
  id Property;
  int v24;
  void *v25;
  SEL v26;
  SEL v27;
  _BYTE v28[22];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if ((*(_BYTE *)(a1 + 10) & 1) != 0)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v7 = (id)CFNLog::logger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v28 = 0;
      _os_log_debug_impl(&dword_183ECA000, v7, OS_LOG_TYPE_DEBUG, "ResumableUploadState: userOverride is true, not processing response", v28, 2u);
    }

    return 1;
  }
  ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(response);
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v5 = (id)CFNLog::logger;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v17 = *(_DWORD *)(a1 + 12) + 1;
    if (v17 > 5)
      v18 = CFSTR("unknown");
    else
      v18 = off_1E14F6E70[v17];
    *(_DWORD *)v28 = 138412546;
    *(_QWORD *)&v28[4] = v18;
    *(_WORD *)&v28[12] = 2048;
    *(_QWORD *)&v28[14] = ResponseStatusCode;
    _os_log_debug_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEBUG, "ResumableUploadState: processResponse with state: %@, statusCode: %ld", v28, 0x16u);
  }

  if ((unint64_t)(ResponseStatusCode - 400) <= 0xC7)
  {
    v6 = -1;
    goto LABEL_8;
  }
  *(_WORD *)(a1 + 8) = 0;
  v10 = *(_DWORD *)(a1 + 12);
  if (v10 == 3)
  {
    v12 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(response, (CFStringRef)&unk_1EDCFD7E8);
    v13 = v12;
    if (v12)
    {
      v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("?1"));
      if ((ResponseStatusCode & 0xFFFFFFFFFFFFFFFBLL) == 0xC8)
        v15 = v14;
      else
        v15 = 1;
      if ((v15 & 1) != 0)
      {
        if ((unint64_t)(ResponseStatusCode - 200) >= 0x64)
          v16 = -1;
        else
          v16 = 4;
        v8 = 1;
      }
      else
      {
        v19 = -[__NSCFResumableUploadState uploadOffsetFromResponse:]((uint64_t)response);
        v8 = 0;
        *(_QWORD *)(a1 + 24) = v19;
        v16 = 1;
      }
    }
    else
    {
      v8 = 1;
      v16 = -1;
    }
    *(_DWORD *)(a1 + 12) = v16;

  }
  else
  {
    if (v10 == 1)
    {
      if ((unint64_t)(ResponseStatusCode - 200) > 0x63)
        return 1;
      v6 = 4;
LABEL_8:
      *(_DWORD *)(a1 + 12) = v6;
      return 1;
    }
    if (v10 || ResponseStatusCode != 104)
      return 1;
    if (response)
    {
      if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
        dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
      v11 = *((_BYTE *)response + 40) ? (os_unfair_lock_s *)((char *)response + 16) : 0;
    }
    else
    {
      v11 = 0;
    }
    HTTPHeaderKeyMixedValue::HTTPHeaderKeyMixedValue(v28, 0x149393F6u);
    v20 = (CFDictionaryRef *)HTTPMessage::headers(v11);
    v22 = (__CFString *)HTTPHeaderDict::copyStringValue(v20, (const __CFAllocator *)*MEMORY[0x1E0C9AE00], (const HTTPHeaderKeyMixedValue *)v28);
    *(_QWORD *)v28 = &off_1E14E9A00;
    if (*(_QWORD *)&v28[8])
      CFRelease(*(CFTypeRef *)&v28[8]);
    if (!v22)
      return 1;
    Property = objc_getProperty((id)a1, v21, 56, 1);
    v24 = -[__CFString isEqualToString:](v22, "isEqualToString:", Property, *(_QWORD *)v28);

    if (!v24)
      return 1;
    -[__NSCFResumableUploadState resumeURLFromResponse:]((void *)a1, (uint64_t)response);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic((id)a1, v26, v25, 48);

    v8 = 1;
    if (objc_getProperty((id)a1, v27, 48, 1))
      *(_DWORD *)(a1 + 12) = 1;
  }
  return v8;
}

@end
