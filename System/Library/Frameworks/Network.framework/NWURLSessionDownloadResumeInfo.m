@implementation NWURLSessionDownloadResumeInfo

- (void)encodeWithCoder:(id)a3
{
  double v4;
  NWURLSessionResponseConsumerResumeInfo *responseConsumerResumeInfo;
  double v6;
  id v7;

  v7 = a3;
  if (self)
  {
    objc_msgSend(v7, "encodeObject:forKey:", self->_originalRequest, CFSTR("originalRequest"));
    objc_msgSend(v7, "encodeObject:forKey:", self->_currentRequest, CFSTR("currentRequest"));
    objc_msgSend(v7, "encodeObject:forKey:", self->_response, CFSTR("response"));
    objc_msgSend(v7, "encodeObject:forKey:", self->_earliestBeginDate, CFSTR("earliestBeginDate"));
    objc_msgSend(v7, "encodeInt64:forKey:", self->_countOfBytesClientExpectsToSend, CFSTR("countOfBytesClientExpectsToSend"));
    objc_msgSend(v7, "encodeInt64:forKey:", self->_countOfBytesClientExpectsToReceive, CFSTR("countOfBytesClientExpectsToReceive"));
    objc_msgSend(v7, "encodeObject:forKey:", self->_taskDescription, CFSTR("taskDescription"));
    *(float *)&v4 = self->_priority;
    objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("priority"), v4);
    objc_msgSend(v7, "encodeBool:forKey:", self->_prefersIncrementalDelivery, CFSTR("prefersIncrementalDelivery"));
    objc_msgSend(v7, "encodeBool:forKey:", self->__keepDownloadTaskFile, CFSTR("_keepDownloadTaskFile"));
    responseConsumerResumeInfo = self->_responseConsumerResumeInfo;
  }
  else
  {
    objc_msgSend(v7, "encodeObject:forKey:", 0, CFSTR("originalRequest"));
    objc_msgSend(v7, "encodeObject:forKey:", 0, CFSTR("currentRequest"));
    objc_msgSend(v7, "encodeObject:forKey:", 0, CFSTR("response"));
    objc_msgSend(v7, "encodeObject:forKey:", 0, CFSTR("earliestBeginDate"));
    objc_msgSend(v7, "encodeInt64:forKey:", 0, CFSTR("countOfBytesClientExpectsToSend"));
    objc_msgSend(v7, "encodeInt64:forKey:", 0, CFSTR("countOfBytesClientExpectsToReceive"));
    objc_msgSend(v7, "encodeObject:forKey:", 0, CFSTR("taskDescription"));
    LODWORD(v6) = 0;
    objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("priority"), v6);
    objc_msgSend(v7, "encodeBool:forKey:", 0, CFSTR("prefersIncrementalDelivery"));
    objc_msgSend(v7, "encodeBool:forKey:", 0, CFSTR("_keepDownloadTaskFile"));
    responseConsumerResumeInfo = 0;
  }
  objc_msgSend(v7, "encodeObject:forKey:", responseConsumerResumeInfo, CFSTR("responseConsumerResumeInfo"));

}

- (NWURLSessionDownloadResumeInfo)initWithCoder:(id)a3
{
  id v4;
  NWURLSessionDownloadResumeInfo *v5;
  NSObject *v6;
  NSObject *v7;
  NSURLRequest *v8;
  NSURLRequest *currentRequest;
  NSURLRequest *v10;
  uint64_t v11;
  NSHTTPURLResponse *response;
  uint64_t v13;
  NSDate *earliestBeginDate;
  uint64_t v15;
  NSString *taskDescription;
  float v17;
  uint64_t v18;
  NWURLSessionResponseConsumerResumeInfo *responseConsumerResumeInfo;
  NWURLSessionDownloadResumeInfo *v20;
  NSObject *v21;
  uint8_t v23[16];
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NWURLSessionDownloadResumeInfo;
  v5 = -[NWURLSessionDownloadResumeInfo init](&v24, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalRequest"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v7 = (id)gurlLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_182FBE000, v7, OS_LOG_TYPE_ERROR, "Cannot init download resume info without original request", v23, 2u);
    }
    goto LABEL_15;
  }
  v7 = v6;
  objc_storeStrong((id *)&v5->_originalRequest, v6);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentRequest"));
  v8 = (NSURLRequest *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v21 = (id)gurlLogObj;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_182FBE000, v21, OS_LOG_TYPE_ERROR, "Cannot init download resume info without current request", v23, 2u);
    }

LABEL_15:
    v20 = 0;
    goto LABEL_16;
  }
  currentRequest = v5->_currentRequest;
  v5->_currentRequest = v8;
  v10 = v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("response"));
  v11 = objc_claimAutoreleasedReturnValue();
  response = v5->_response;
  v5->_response = (NSHTTPURLResponse *)v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("earliestBeginDate"));
  v13 = objc_claimAutoreleasedReturnValue();
  earliestBeginDate = v5->_earliestBeginDate;
  v5->_earliestBeginDate = (NSDate *)v13;

  v5->_countOfBytesClientExpectsToSend = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("countOfBytesClientExpectsToSend"));
  v5->_countOfBytesClientExpectsToReceive = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("countOfBytesClientExpectsToReceive"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("taskDescription"));
  v15 = objc_claimAutoreleasedReturnValue();
  taskDescription = v5->_taskDescription;
  v5->_taskDescription = (NSString *)v15;

  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("priority"));
  v5->_priority = v17;
  v5->_prefersIncrementalDelivery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prefersIncrementalDelivery"));
  v5->__keepDownloadTaskFile = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_keepDownloadTaskFile"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseConsumerResumeInfo"));
  v18 = objc_claimAutoreleasedReturnValue();
  responseConsumerResumeInfo = v5->_responseConsumerResumeInfo;
  v5->_responseConsumerResumeInfo = (NWURLSessionResponseConsumerResumeInfo *)v18;

LABEL_5:
  v20 = v5;
LABEL_16:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseConsumerResumeInfo, 0);
  objc_storeStrong((id *)&self->_taskDescription, 0);
  objc_storeStrong((id *)&self->_earliestBeginDate, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NWURLSessionDownloadResumeInfo)infoWithTask:(uint64_t)a1
{
  id *v2;
  NWURLSessionDownloadResumeInfo *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  NSDate *v9;
  NSDate *earliestBeginDate;
  uint64_t v11;
  NSString *taskDescription;
  float v13;
  id v14;
  void *v15;

  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc_init(NWURLSessionDownloadResumeInfo);
  objc_msgSend(v2, "originalRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_originalRequest, v4);

  objc_msgSend(v2, "currentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_currentRequest, v5);

  objc_msgSend(v2, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_storeStrong((id *)&v3->_response, v8);

  }
  objc_msgSend(v2, "earliestBeginDate");
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    earliestBeginDate = v3->_earliestBeginDate;
    v3->_earliestBeginDate = v9;

    v3->_countOfBytesClientExpectsToSend = objc_msgSend(v2, "countOfBytesClientExpectsToSend");
    v3->_countOfBytesClientExpectsToReceive = objc_msgSend(v2, "countOfBytesExpectedToReceive");
    objc_msgSend(v2, "taskDescription");
    v11 = objc_claimAutoreleasedReturnValue();
    taskDescription = v3->_taskDescription;
    v3->_taskDescription = (NSString *)v11;

    objc_msgSend(v2, "priority");
    v3->_priority = v13;
    v3->_prefersIncrementalDelivery = objc_msgSend(v2, "prefersIncrementalDelivery");
    v3->__keepDownloadTaskFile = objc_msgSend(v2, "_keepDownloadTaskFile");
  }
  else
  {

    objc_msgSend(v2, "countOfBytesClientExpectsToSend");
    objc_msgSend(v2, "countOfBytesExpectedToReceive");
    objc_msgSend(v2, "taskDescription");

    objc_msgSend(v2, "priority");
    objc_msgSend(v2, "prefersIncrementalDelivery");
    objc_msgSend(v2, "_keepDownloadTaskFile");
  }
  v14 = v2[52];
  objc_msgSend(v14, "createResumeInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_responseConsumerResumeInfo, v15);

  return v3;
}

+ (_QWORD)infoWithResumeData:(uint64_t)a1
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  _BYTE *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    if (isWebKitNetworking_onceToken != -1)
      dispatch_once(&isWebKitNetworking_onceToken, &__block_literal_global_174);
    if (isWebKitNetworking_result != 1)
    {
      v6 = 0;
      goto LABEL_15;
    }
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 0, 0, &v28);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v28;
    -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("$archiver"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("NSURLSessionResumeInfoLocalPath"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v4;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v2, &v27);
      v8 = v27;

      v9 = (void *)MEMORY[0x1E0C99E60];
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v12, CFSTR("NSKeyedArchiveRootObjectKey"));
      v13 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "finishDecoding");
      if (v13)
      {
        v3 = v13;
        if (v6)
          goto LABEL_41;
        goto LABEL_40;
      }
      v4 = v8;
    }
    else
    {
      if (v3)
      {
        v8 = v4;
LABEL_40:
        -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("NSURLSessionResumeInfoLocalPath"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
LABEL_42:
          -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("data"));
          v22 = objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (__nwlog_url_log::onceToken != -1)
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
            v24 = (id)gurlLogObj;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_182FBE000, v24, OS_LOG_TYPE_ERROR, "URLSessionDownloadTask: resume data has no data", buf, 2u);
            }

            v14 = 0;
            v2 = v22;
            goto LABEL_61;
          }

          v2 = v22;
LABEL_15:
          v8 = -[NSObject mutableCopy](v2, "mutableCopy");
          v15 = (_BYTE *)-[NSObject mutableBytes](v8, "mutableBytes");
          if (-[NSObject length](v8, "length"))
          {
            *v15 ^= 0x54u;
            if ((unint64_t)-[NSObject length](v8, "length") >= 2)
            {
              v15[1] ^= 0x65u;
              if ((unint64_t)-[NSObject length](v8, "length") >= 3)
              {
                v15[2] ^= 0x64u;
                if ((unint64_t)-[NSObject length](v8, "length") >= 4)
                {
                  v15[3] ^= 0x4Cu;
                  if ((unint64_t)-[NSObject length](v8, "length") >= 5)
                  {
                    v15[4] ^= 0x61u;
                    if ((unint64_t)-[NSObject length](v8, "length") >= 6)
                    {
                      v15[5] ^= 0x73u;
                      if ((unint64_t)-[NSObject length](v8, "length") >= 7)
                      {
                        v15[6] ^= 0x73u;
                        if ((unint64_t)-[NSObject length](v8, "length") >= 8)
                          v15[7] ^= 0x6Fu;
                      }
                    }
                  }
                }
              }
            }
          }
          v26 = 0;
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v26);
          v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v3 = v26;
          if (v14)
          {
            if (v6)
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v14[9];
              if (v17)
                objc_storeStrong((id *)(v17 + 8), v16);

              v18 = v14[9];
              if (v18)
              {
                v19 = *(void **)(v18 + 16);
                *(_QWORD *)(v18 + 16) = 0;

              }
            }
            v20 = v14;
          }
          else
          {
            if (__nwlog_url_log::onceToken != -1)
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
            v21 = (id)gurlLogObj;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v3;
              _os_log_impl(&dword_182FBE000, v21, OS_LOG_TYPE_ERROR, "URLSessionDownloadTask: resume data unarchiver returned nil, error: %@", buf, 0xCu);
            }

          }
LABEL_61:

          goto LABEL_62;
        }
LABEL_41:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (__nwlog_url_log::onceToken != -1)
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
          v23 = (id)gurlLogObj;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_182FBE000, v23, OS_LOG_TYPE_ERROR, "URLSessionDownloadTask: resume data local path is not string", buf, 2u);
          }

          v14 = 0;
          goto LABEL_61;
        }
        goto LABEL_42;
      }
      v6 = 0;
    }
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v3 = (id)gurlLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v4;
      _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_ERROR, "URLSessionDownloadTask: resume data deserialization returned nil, error: %@", buf, 0xCu);
    }
    v14 = 0;
    v8 = v4;
    goto LABEL_61;
  }
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v2 = (id)gurlLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182FBE000, v2, OS_LOG_TYPE_ERROR, "URLSessionDownloadTask: cannot init with nil resume data", buf, 2u);
  }
  v14 = 0;
LABEL_62:

  return v14;
}

- (id)serialize
{
  void *v2;
  id v3;
  void *v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v16);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v16;
    v4 = (void *)objc_msgSend(v2, "mutableCopy");

    if (v4)
    {
      v5 = (_BYTE *)objc_msgSend(v4, "mutableBytes");
      if (objc_msgSend(v4, "length"))
      {
        *v5 ^= 0x54u;
        if ((unint64_t)objc_msgSend(v4, "length") >= 2)
        {
          v5[1] ^= 0x65u;
          if ((unint64_t)objc_msgSend(v4, "length") >= 3)
          {
            v5[2] ^= 0x64u;
            if ((unint64_t)objc_msgSend(v4, "length") >= 4)
            {
              v5[3] ^= 0x4Cu;
              if ((unint64_t)objc_msgSend(v4, "length") >= 5)
              {
                v5[4] ^= 0x61u;
                if ((unint64_t)objc_msgSend(v4, "length") >= 6)
                {
                  v5[5] ^= 0x73u;
                  if ((unint64_t)objc_msgSend(v4, "length") >= 7)
                  {
                    v5[6] ^= 0x73u;
                    if ((unint64_t)objc_msgSend(v4, "length") >= 8)
                      v5[7] ^= 0x6Fu;
                  }
                }
              }
            }
          }
        }
      }
      v6 = (void *)objc_msgSend(v4, "copy");
      if (isWebKitNetworking_onceToken != -1)
        dispatch_once(&isWebKitNetworking_onceToken, &__block_literal_global_174);
      if ((isWebKitNetworking_result & 1) == 0)
        goto LABEL_24;
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = *(_QWORD **)(a1 + 72);
      if (v8)
        v9 = (void *)v8[1];
      else
        v9 = 0;
      v10 = v8;
      objc_msgSend(v9, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v6, CFSTR("data"), v11, CFSTR("NSURLSessionResumeInfoLocalPath"), 0);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
      objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("NSKeyedArchiveRootObjectKey"));
      objc_msgSend(v13, "encodedData");
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v14;
    }
    else
    {
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v12 = (id)gurlLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v3;
        _os_log_impl(&dword_182FBE000, v12, OS_LOG_TYPE_ERROR, "URLSessionDownloadTask: resume data archiver returned nil, error: %@", buf, 0xCu);
      }
      v6 = 0;
    }

LABEL_24:
    return v6;
  }
  return 0;
}

@end
