@implementation __NSCFLocalDownloadTask

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__NSCFLocalDownloadTask;
  if (-[__NSCFLocalDownloadTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (__CFDictionary)_copySocketStreamProperties
{
  __CFDictionary *v3;
  __CFDictionary *MutableCopy;
  const __CFAllocator *v5;
  CFIndex Count;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)__NSCFLocalDownloadTask;
  v3 = -[NSURLSessionTask _copySocketStreamProperties](&v8, sel__copySocketStreamProperties);
  if (CFDictionaryContainsKey(v3, &unk_1EDCFA5D0))
    return v3;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Count = CFDictionaryGetCount(v3);
  MutableCopy = CFDictionaryCreateMutableCopy(v5, Count + 1, v3);
  if (v3)
    CFRelease(v3);
  CFDictionarySetValue(MutableCopy, &unk_1EDCFA5D0, (const void *)*MEMORY[0x1E0C9AE50]);
  -[NSURLSessionTask set_cachedSocketStreamProperties:](self, "set_cachedSocketStreamProperties:", MutableCopy);
  return MutableCopy;
}

- (void)_private_completionAfterMetrics
{
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  id v12;
  void (**v13)(void *, _QWORD *, uint64_t, uint64_t, uint64_t);
  SEL v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id Property;
  void *v28;
  SEL v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  SEL v35;
  const char *v36;
  id v37;
  void *v38;
  SEL v39;
  const char *v40;
  uint64_t v41;
  int v42;
  const char *v43;
  char v44;
  uint64_t v45;
  char v46;
  const char *v47;
  char v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  id v52;
  void *v53;
  SEL v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[5];
  uint64_t newValue;
  uint64_t v60;
  void (*v61)(uint64_t);
  void *v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD v65[5];
  _QWORD v66[7];
  _QWORD v67[6];
  _QWORD v68[6];
  _QWORD v69[10];

  v69[9] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (!objc_msgSend(a1, "error") || objc_getProperty(a1, v2, 976, 1))
  {
    if (objc_getProperty(a1, v2, 976, 1))
    {
      v3 = objc_msgSend(a1, "createResumeInformation:", 0);
      if (v3)
      {
        v5 = v3;
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
        objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("NSKeyedArchiveRootObjectKey"));
        v7 = objc_msgSend(v6, "encodedData");

      }
      else
      {
        v7 = 0;
      }
      Property = objc_getProperty(a1, v4, 976, 1);
      v28 = _Block_copy(Property);
      objc_setProperty_atomic_copy(a1, v29, 0, 976);
      v30 = (void *)objc_msgSend(a1, "error:code:", *MEMORY[0x1E0CB32E8], -999);
      v31 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
      objc_msgSend(v31, "addEntriesFromDictionary:", objc_msgSend(v30, "userInfo"));
      if (v7)
        objc_msgSend(v31, "setObject:forKey:", v7, CFSTR("NSURLSessionDownloadTaskResumeData"));
      v32 = objc_msgSend(MEMORY[0x1E0CB39B8], "errorWithDomain:code:userInfo:", objc_msgSend(v30, "domain"), objc_msgSend(v30, "code"), v31);
      v33 = objc_msgSend(a1, "session");
      v34 = MEMORY[0x1E0C809B0];
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke;
      v68[3] = &unk_1E14FDF00;
      v68[4] = v7;
      v68[5] = v28;
      -[NSURLSession runDelegateBlock:](v33, v68);
      objc_msgSend(a1, "setError:", v32);
      if (objc_getProperty(a1, v35, 936, 1))
      {
        v37 = objc_getProperty(a1, v36, 936, 1);
        v38 = _Block_copy(v37);
        objc_setProperty_atomic_copy(a1, v39, 0, 936);
        if (objc_msgSend(a1, "_callCompletionHandlerInline"))
        {
          (*((void (**)(void *, _QWORD *, _QWORD, uint64_t, uint64_t))v38 + 2))(v38, a1, 0, objc_msgSend(a1, "response"), objc_msgSend(a1, "error"));
          _Block_release(v38);
          objc_msgSend(a1, "setState:", 3);
          -[NSURLSessionTask _resetTaskDelegate]((uint64_t)a1, v40);
        }
        else
        {
          v67[0] = v34;
          v67[1] = 3221225472;
          v67[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_2;
          v67[3] = &unk_1E14FDF00;
          v67[4] = a1;
          v67[5] = v38;
          -[NSURLSession runDelegateBlock:](objc_msgSend(a1, "session"), v67);
        }
      }
      else
      {
        -[NSURLSession _onqueue_didCompleteTask:withError:](objc_msgSend(a1, "session"), a1, (void *)objc_msgSend(a1, "error"));
      }
      goto LABEL_53;
    }
    if (a1[119])
      __assert_rtn("-[__NSCFLocalDownloadTask _private_completionAfterMetrics]", "LocalDownloadTask.mm", 940, "_writeBuffer == NULL");
    v8 = (void *)objc_msgSend(a1, "downloadFile");
    if (v8)
      v10 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", objc_msgSend((id)objc_msgSend(v8, "path"), "UTF8String"), 0, 0);
    else
      v10 = 0;
    if (objc_getProperty(a1, v9, 936, 1))
    {
      v12 = objc_getProperty(a1, v11, 936, 1);
      v13 = (void (**)(void *, _QWORD *, uint64_t, uint64_t, uint64_t))_Block_copy(v12);
      objc_setProperty_atomic_copy(a1, v14, 0, 936);
      if (objc_msgSend(a1, "_callCompletionHandlerInline"))
      {
        v13[2](v13, a1, v10, objc_msgSend(a1, "response"), objc_msgSend(a1, "error"));
        _Block_release(v13);
        objc_msgSend(a1, "setState:", 3);
        -[NSURLSessionTask _resetTaskDelegate]((uint64_t)a1, v15);
      }
      else
      {
        v49 = objc_msgSend(a1, "session");
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_3;
        v66[3] = &unk_1E14FE070;
        v66[5] = v10;
        v66[6] = v13;
        v66[4] = a1;
        -[NSURLSession runDelegateBlock:](v49, v66);
      }
      goto LABEL_53;
    }
    v41 = a1[88];
    if (!v41)
      v41 = a1[87];
    v42 = -[__NSCFURLSessionDelegateWrapper didFinishDownloadingToURL](v41, v11);
    v44 = v42;
    if (a1[125])
    {
      v45 = a1[88];
      if (!v45)
        v45 = a1[87];
      v46 = -[__NSCFURLSessionDelegateWrapper didWriteData](v45, v43);
      v48 = v46;
      if ((v44 & 1) != 0)
      {
        newValue = MEMORY[0x1E0C809B0];
        v60 = 3221225472;
        v61 = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_5;
        v62 = &unk_1E14FDE88;
        v63 = a1;
        v64 = v10;
        if ((v46 & 1) != 0)
        {
          objc_setProperty_atomic_copy(a1, v47, &newValue, 1008);
          -[__NSCFLocalDownloadTask reportProgress:](a1, 0);
          goto LABEL_53;
        }
LABEL_41:
        __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_5((uint64_t)&newValue);
        goto LABEL_53;
      }
      objc_msgSend(a1, "setDownloadFile:", 0);
      if ((v48 & 1) != 0)
      {
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_4;
        v65[3] = &unk_1E14FE118;
        v65[4] = a1;
        objc_setProperty_atomic_copy(a1, v50, v65, 1008);
        -[__NSCFLocalDownloadTask reportProgress:](a1, 0);
        goto LABEL_53;
      }
    }
    else
    {
      if (v42)
      {
        newValue = MEMORY[0x1E0C809B0];
        v60 = 3221225472;
        v61 = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_5;
        v62 = &unk_1E14FDE88;
        v63 = a1;
        v64 = v10;
        goto LABEL_41;
      }
      objc_msgSend(a1, "setDownloadFile:", 0);
    }
LABEL_45:
    -[NSURLSession _onqueue_didCompleteTask:withError:](objc_msgSend(a1, "session"), a1, (void *)objc_msgSend(a1, "error"));
    goto LABEL_53;
  }
  v16 = (void *)objc_msgSend(a1, "error");
  if (v16)
  {
    v18 = v16;
    v19 = (void *)objc_msgSend(v16, "domain");
    if (((objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB32E8]) & 1) != 0
       || objc_msgSend(v19, "isEqualToString:", CFSTR("_nsurlsessiondErrorDomain")))
      && objc_msgSend(v18, "code") != -999)
    {
      v20 = (void *)objc_msgSend(v18, "userInfo");
      if (!v20 || !objc_msgSend(v20, "objectForKey:", CFSTR("NSURLSessionDownloadTaskResumeData")))
      {
        v21 = objc_msgSend(a1, "createResumeInformation:", 0);
        if (v21)
        {
          v22 = v21;
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
          objc_msgSend(v23, "encodeObject:forKey:", v22, CFSTR("NSKeyedArchiveRootObjectKey"));
          v24 = objc_msgSend(v23, "encodedData");
          v25 = (void *)objc_msgSend((id)objc_msgSend(a1, "error"), "userInfo");
          if (v25)
          {
            v26 = (id)objc_msgSend(v25, "mutableCopy");
            objc_msgSend(v26, "setObject:forKey:", v24, CFSTR("NSURLSessionDownloadTaskResumeData"));
          }
          else
          {
            v26 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v24, CFSTR("NSURLSessionDownloadTaskResumeData"));
          }

          objc_msgSend(a1, "setError:", objc_msgSend(MEMORY[0x1E0CB39B8], "errorWithDomain:code:userInfo:", objc_msgSend((id)objc_msgSend(a1, "error"), "domain"), objc_msgSend((id)objc_msgSend(a1, "error"), "code"), v26));
        }
      }
    }
  }
  if (!objc_getProperty(a1, v17, 936, 1))
    goto LABEL_45;
  v52 = objc_getProperty(a1, v51, 936, 1);
  v53 = _Block_copy(v52);
  objc_setProperty_atomic_copy(a1, v54, 0, 936);
  if (objc_msgSend(a1, "_callCompletionHandlerInline"))
  {
    (*((void (**)(void *, _QWORD *, _QWORD, uint64_t, uint64_t))v53 + 2))(v53, a1, 0, objc_msgSend(a1, "response"), objc_msgSend(a1, "error"));
    _Block_release(v53);
    -[NSURLSessionTask _resetTaskDelegate]((uint64_t)a1, v55);
  }
  else
  {
    v56 = objc_msgSend(a1, "session");
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __63____NSCFLocalDownloadTask__private_errorCompletionAfterMetrics__block_invoke;
    v69[3] = &unk_1E14FDF00;
    v69[4] = a1;
    v69[5] = v53;
    -[NSURLSession runDelegateBlock:](v56, v69);
  }
LABEL_53:
  if (objc_msgSend(a1, "_callCompletionHandlerInline"))
  {
    objc_msgSend(a1, "setState:", 3);
  }
  else
  {
    v57 = objc_msgSend(a1, "session");
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_7;
    v58[3] = &unk_1E14FE118;
    v58[4] = a1;
    -[NSURLSession runDelegateBlock:](v57, v58);
  }
  -[__NSURLSessionLocal removeUnresumedTask:](objc_msgSend(a1, "session"), (uint64_t)a1);
}

- (id)createResumeInformation:(id)a3
{
  NSURLRequest *v5;
  NSString *v6;
  void *v7;
  NSURLResponse *v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  STExtractor *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  __NSCFLocalDownloadFile *v19;
  NSDictionary *originalResumeInfo;
  __NSCFLocalDownloadFile *v21;
  __NSCFLocalDownloadFile *v22;
  off_t st_size;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSString *v30;
  NSString *v31;
  uint64_t v32;
  uint8_t buf[4];
  NSString *v34;
  __int16 v35;
  NSString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = -[NSURLSessionTask currentRequest](self, "currentRequest");
  v6 = -[NSURL scheme](-[NSURLRequest URL](v5, "URL"), "scheme");
  if (-[NSString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("http"))
    && -[NSString caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", CFSTR("https"))
    || -[NSString caseInsensitiveCompare:](-[NSURLRequest HTTPMethod](v5, "HTTPMethod"), "caseInsensitiveCompare:", CFSTR("GET")))
  {
    return 0;
  }
  -[NSURLSessionTask response](self, "response");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = -[NSURLSessionTask response](self, "response");
    v10 = -[NSURLResponse allHeaderFields](v9, "allHeaderFields");
    v11 = -[NSDictionary objectForKey:](v10, "objectForKey:", 0x1EDCFD008);
    v12 = -[NSDictionary objectForKey:](v10, "objectForKey:", 0x1EDCFD1C8);
    if (!(v12 | v11))
      return 0;
    v13 = v12;
    v32 = 0;
    if (a3)
    {
      v14 = (NSString *)objc_msgSend(a3, "copy");
      v15 = -[NSURLSessionTask _extractor](self, "_extractor");
      v16 = v15 == 0;
      if (v14)
      {
        if (!v15)
        {
          v31 = 0;
          v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
          if ((objc_msgSend(v17, "getResourceValue:forKey:error:", &v32, *MEMORY[0x1E0C99998], &v31) & 1) == 0)
          {
            if (CFNLog::onceToken != -1)
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
            v18 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v31;
              _os_log_error_impl(&dword_183ECA000, v18, OS_LOG_TYPE_ERROR, "Failed to size file %@", buf, 0xCu);
            }
          }
        }
        goto LABEL_27;
      }
    }
    else
    {
      v16 = -[NSURLSessionTask _extractor](self, "_extractor") == 0;
    }
    v21 = -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile");
    if (v21)
    {
      v22 = v21;
      if (!v21->_finished)
        __assert_rtn("-[__NSCFLocalDownloadFile captureFile:outStat:]", "LocalDownloadFile.mm", 315, "_finished");
      v21->_skipUnlink = 1;
      v14 = -[__NSCFLocalDownloadFile path](v21, "path");
      st_size = v22->_stat.st_size;
    }
    else
    {
      v14 = 0;
      st_size = 0;
    }
    v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", st_size);
    if (!v14)
      return 0;
LABEL_27:
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    objc_msgSend(v7, "setObject:forKey:", &unk_1E152A5F8, CFSTR("NSURLSessionResumeInfoVersion"));
    objc_msgSend(v7, "setObject:forKey:", -[NSString lastPathComponent](v14, "lastPathComponent"), CFSTR("NSURLSessionResumeInfoTempFileName"));
    if (v16 && v32)
      objc_msgSend(v7, "setObject:forKey:", v32, CFSTR("NSURLSessionResumeBytesReceived"));
    if (-[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"))
      objc_msgSend(v7, "setObject:forKey:", -[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"), CFSTR("NSURLSessionResumeInfoLocalPath"));

    objc_msgSend(v7, "setObject:forKey:", CFURLGetString((CFURLRef)-[NSURLRequest URL](v5, "URL")), CFSTR("NSURLSessionDownloadURL"));
    v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v24, "encodeObject:forKey:", -[NSURLSessionTask currentRequest](self, "currentRequest"), CFSTR("NSKeyedArchiveRootObjectKey"));
    v26 = objc_msgSend(v24, "encodedData");
    objc_msgSend(v25, "encodeObject:forKey:", -[NSURLSessionTask originalRequest](self, "originalRequest"), CFSTR("NSKeyedArchiveRootObjectKey"));
    v27 = objc_msgSend(v25, "encodedData");
    objc_msgSend(v7, "setObject:forKey:", v26, CFSTR("NSURLSessionResumeCurrentRequest"));
    objc_msgSend(v7, "setObject:forKey:", v27, CFSTR("NSURLSessionResumeOriginalRequest"));
    v31 = 0;
    v28 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v31);
    if (v28)
    {
      objc_msgSend(v7, "setObject:forKey:", v28, CFSTR("NSURLSessionResumeResponse"));
      if (!v13)
        goto LABEL_40;
    }
    else
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v29 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        v30 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
        *(_DWORD *)buf = 138543618;
        v34 = v30;
        v35 = 2112;
        v36 = v31;
        _os_log_error_impl(&dword_183ECA000, v29, OS_LOG_TYPE_ERROR, "%{public}@ failed to archive response: %@", buf, 0x16u);
        if (!v13)
          goto LABEL_40;
      }
      else if (!v13)
      {
LABEL_40:
        if (v11)
          objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("NSURLSessionResumeEntityTag"));
        if (-[NSURLSessionTask _extractor](self, "_extractor"))
          objc_msgSend(v7, "setObject:forKey:", -[NSURLSessionTask _extractor](self, "_extractor"), CFSTR("NSURLSessionResumeExtractor"));
        if (-[NSURLSessionTask _backgroundPublishingURL](self, "_backgroundPublishingURL"))
          objc_msgSend(v7, "setObject:forKey:", -[NSURLSessionTask _backgroundPublishingURL](self, "_backgroundPublishingURL"), CFSTR("PublishingURL"));
        return v7;
      }
    }
    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("NSURLSessionResumeServerDownloadDate"));
    goto LABEL_40;
  }
  if (self->_originalResumeInfo)
  {
    v19 = -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile");
    if (v19)
      v19->_skipUnlink = 1;
    originalResumeInfo = self->_originalResumeInfo;
  }
  else
  {
    originalResumeInfo = 0;
  }
  return (id)-[NSDictionary copy](originalResumeInfo, "copy");
}

- (void)_onqueue_completeInitialization
{
  void *v3;
  NSObject *v4;
  __NSCFLocalDownloadFile *v5;
  __NSCFLocalDownloadFile *v6;
  __NSCFLocalDownloadFile *v7;
  id v8;
  int v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  off_t st_size;
  int v14;
  objc_super v15;
  uint8_t v16[4];
  int v17;
  stat buf;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration");
  if (-[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile")
    && !-[NSString isEqualToString:](-[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"), "isEqualToString:", -[__NSCFLocalDownloadFile path](-[__NSCFLocalDownloadTask downloadFile](self, "downloadFile"), "path")))
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      buf.st_dev = 138543874;
      *(_QWORD *)&buf.st_mode = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
      WORD2(buf.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)-[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile");
      HIWORD(buf.st_gid) = 2112;
      *(_QWORD *)&buf.st_rdev = -[__NSCFLocalDownloadFile path](-[__NSCFLocalDownloadTask downloadFile](self, "downloadFile"), "path");
      _os_log_impl(&dword_183ECA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ _pathToDownloadTaskFile set to %@ and current path was %@- reconstructing downloadfile object", (uint8_t *)&buf, 0x20u);
    }
    v5 = [__NSCFLocalDownloadFile alloc];
    -[__NSCFLocalDownloadTask setDownloadFile:](self, "setDownloadFile:", -[__NSCFLocalDownloadFile initWithFullPath:protectionType:](v5, (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", -[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"), 0), (void *)objc_msgSend(v3, "_downloadFileProtectionType")));
    v6 = -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile");
    if (v6 && v6->_error == 17 && -[NSURLSessionTask _extractor](self, "_extractor"))
      -[__NSCFLocalDownloadFile setPath:](-[__NSCFLocalDownloadTask downloadFile](self, "downloadFile"), "setPath:", -[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"));
    v7 = -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile");
    if (v7)
      v7->_skipUnlink = 1;
  }
  if (objc_msgSend(v3, "_requiresClientToOpenFiles")
    && self->_originalResumeInfo
    && !-[NSURLSessionTask _extractor](self, "_extractor"))
  {
    v8 = (id)-[NSURLRequest mutableCopy](-[NSURLSessionTask currentRequest](self, "currentRequest"), "mutableCopy");
    v9 = -[__NSCFLocalDownloadTask openItemForPath:mode:](self, "openItemForPath:mode:", -[__NSCFLocalDownloadFile path](-[__NSCFLocalDownloadTask downloadFile](self, "downloadFile"), "path"), 0);
    if (v9 >= 1)
    {
      v10 = v9;
      memset(&buf, 0, sizeof(buf));
      if (fstat(v9, &buf))
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v11 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          v14 = *__error();
          *(_DWORD *)v16 = 67109120;
          v17 = v14;
          _os_log_error_impl(&dword_183ECA000, v11, OS_LOG_TYPE_ERROR, "Download task fstat resulted in error %d", v16, 8u);
        }
        close(v10);
      }
      else
      {
        st_size = buf.st_size;
        close(v10);
        if (st_size >= 1)
        {
          self->_initialResumeSize = st_size;
          self->_totalWrote = st_size;
          v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=%lld-"), st_size);
          goto LABEL_24;
        }
      }
    }
    v12 = 0;
    self->_initialResumeSize = 0;
    self->_totalWrote = 0;
LABEL_24:
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", v12, 0x1EDCFD4A0);
    -[NSURLSessionTask updateCurrentRequest:](self, "updateCurrentRequest:", v8);
  }
  v15.receiver = self;
  v15.super_class = (Class)__NSCFLocalDownloadTask;
  -[__NSCFLocalSessionTask _onqueue_completeInitialization](&v15, sel__onqueue_completeInitialization);
}

- (void)_private_fileCompletion
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  _BYTE buf[24];
  void *v9;
  _BYTE *v10;
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend(a1, "_extractor")
      && objc_msgSend(a1, "_extractorPreparedForExtraction")
      && (objc_msgSend(a1, "_extractorFinishedDecoding") & 1) == 0)
    {
      if (objc_msgSend(a1, "error"))
      {
        if (objc_msgSend(a1, "_extractor"))
        {
          v2 = dispatch_semaphore_create(0);
          v3 = (void *)objc_msgSend(a1, "_extractor");
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __43____NSCFLocalDownloadTask_suspendExtractor__block_invoke;
          v9 = &unk_1E14F69F0;
          v10 = a1;
          v11 = v2;
          objc_msgSend(v3, "suspendStreamWithCompletionBlock:", buf);
          dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
          dispatch_release(v2);
        }
      }
      else
      {
        objc_msgSend(a1, "setError:", objc_msgSend(a1, "error:code:", *MEMORY[0x1E0CB32E8], -3007));
        objc_msgSend(a1, "terminateExtractorWithError:completion:", objc_msgSend(a1, "error"), &__block_literal_global_568);
      }
    }
    if (a1[1032] && objc_msgSend(a1, "error"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v4 = objc_msgSend(a1, "_loggableDescription");
        v5 = objc_msgSend((id)objc_msgSend(a1, "error"), "code");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v5;
        _os_log_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ extractor finished successfully, discarding previous error [%ld]", buf, 0x16u);
      }
      objc_msgSend(a1, "setError:", 0);
    }
    -[__CFN_TaskMetrics completeWithError:](objc_msgSend(a1, "_metrics"), (void *)objc_msgSend(a1, "error"));
    if (objc_msgSend(a1, "_needSendingMetrics"))
    {
      objc_msgSend(a1, "_didSendMetrics");
      v6 = -[NSURLSessionTaskMetrics initWithMetrics:]((id *)[NSURLSessionTaskMetrics alloc], (void *)objc_msgSend(a1, "_metrics"));
      -[NSURLSessionTaskMetrics collectWithCompletionHandler:queue:]((uint64_t)v6, &v7, (void *)objc_msgSend(a1, "workQueue", MEMORY[0x1E0C809B0], 3221225472, __50____NSCFLocalDownloadTask__private_fileCompletion__block_invoke_48, &unk_1E14FDE88, a1, v6));
    }
    else
    {
      -[__NSCFLocalDownloadTask _private_completionAfterMetrics](a1);
    }
  }
}

- (void)checkWrite
{
  NSObject *v3;
  size_t size;
  int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  id Property;
  void (**v14)(_QWORD);
  SEL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _BYTE *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[5];
  _QWORD v23[6];
  int v24;
  int v25;
  uint64_t io_handler;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  _QWORD *v32;

  if (self && self[1028])
  {
    v3 = *((_QWORD *)self + 119);
    if (!v3)
      goto LABEL_34;
    self[1028] = 0;
    size = dispatch_data_get_size(v3);
    v5 = *((_DWORD *)self + 256);
    *((_DWORD *)self + 256) = v5 + 1;
    v6 = objc_msgSend(self, "downloadFile");
    v7 = objc_msgSend(self, "session");
    if (v7)
      v8 = *(NSObject **)(v7 + 120);
    else
      v8 = 0;
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __41____NSCFLocalDownloadTask_writeAndResume__block_invoke;
    v23[3] = &unk_1E14F69C8;
    v24 = v5;
    v25 = 0;
    v23[4] = self;
    v23[5] = size;
    if (v6)
    {
      if (-[__NSCFLocalDownloadFile ioChannel](v6))
      {
        v10 = *(NSObject **)(v6 + 152);
        v11 = *(NSObject **)(v6 + 160);
        io_handler = v9;
        v27 = 3221225472;
        v28 = __65____NSCFLocalDownloadFile_writeBytes_completionQueue_completion___block_invoke_2;
        v29 = &unk_1E14FA238;
        v30 = v6;
        v31 = v8;
        v32 = v23;
        dispatch_io_write(v10, 0, v3, v11, &io_handler);
      }
      else
      {
        io_handler = v9;
        v27 = 3221225472;
        v28 = __65____NSCFLocalDownloadFile_writeBytes_completionQueue_completion___block_invoke;
        v29 = &unk_1E14FDF00;
        v30 = v6;
        v31 = v23;
        dispatch_async(v8, &io_handler);
      }
    }
    dispatch_release(*((dispatch_object_t *)self + 119));
    *((_QWORD *)self + 119) = 0;
    if (self[1028])
    {
LABEL_34:
      if (!*((_QWORD *)self + 120))
        goto LABEL_35;
      *((_QWORD *)self + 120) = 0;
      if (objc_getProperty(self, a2, 1016, 1))
      {
        Property = objc_getProperty(self, v12, 1016, 1);
        v14 = (void (**)(_QWORD))_Block_copy(Property);
        objc_setProperty_atomic_copy(self, v15, 0, 1016);
        v14[2](v14);
        _Block_release(v14);
      }
      objc_msgSend(self, "_onqueue_resume");
      if (self[1028])
      {
LABEL_35:
        if (self[1030])
        {
          if (!self[1031])
          {
            objc_msgSend(self, "_finishProgressReporting");
            self[1031] = 1;
            if (objc_msgSend(self, "session"))
            {
              v16 = objc_msgSend(self, "session");
              if (v16)
              {
                if (*(_QWORD *)(v16 + 120))
                {
                  if (objc_msgSend(self, "_extractor"))
                  {
                    v17 = objc_msgSend(self, "downloadFile");
                    if (v17)
                      *(_BYTE *)(v17 + 168) = 1;
                    v18 = (void *)MEMORY[0x186DB8C8C]();
                    -[__NSCFLocalDownloadTask _private_fileCompletion](self);
                    objc_autoreleasePoolPop(v18);
                  }
                  else
                  {
                    if (objc_msgSend(self, "error"))
                      -[__NSCFLocalDownloadFile markPurgeable](objc_msgSend(self, "downloadFile"));
                    v19 = (_BYTE *)objc_msgSend(self, "downloadFile");
                    v20 = objc_msgSend(self, "session");
                    if (v20)
                      v21 = *(NSObject **)(v20 + 120);
                    else
                      v21 = 0;
                    v22[0] = MEMORY[0x1E0C809B0];
                    v22[1] = 3221225472;
                    v22[2] = __37____NSCFLocalDownloadTask_checkWrite__block_invoke;
                    v22[3] = &unk_1E14FE118;
                    v22[4] = self;
                    -[__NSCFLocalDownloadFile finishOnQueue:completion:](v19, v21, v22);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (uint64_t)setupForNewDownload:(_BYTE *)a1
{
  void *v4;
  int v5;
  __NSCFLocalDownloadFile *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  __NSCFLocalDownloadFile *v10;
  _QWORD *p_isa;
  id v12;
  uint64_t v13;
  void *v14;
  __NSCFLocalDownloadFile *v15;
  const char *v16;
  NSString *v17;
  int v18;
  int v19;
  const char *v20;
  NSObject *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  int error;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  char *v30;
  char __str[1024];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_msgSend(a1, "_taskGroup"), "_groupConfiguration");
  v5 = objc_msgSend(v4, "_requiresClientToOpenFiles");
  if (a2 && v5)
  {
    v6 = [__NSCFLocalDownloadFile alloc];
    if (v6)
    {
      v7 = -[__NSCFLocalDownloadFile initQueues](v6);
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "setPath:", a2);
        v8[24] = a1;
      }
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(a1, "setDownloadFile:", v8);
    -[__NSCFLocalDownloadFile truncate](objc_msgSend(a1, "downloadFile"));
  }
  else
  {
    v9 = objc_msgSend(a1, "_pathToDownloadTaskFile");
    v10 = [__NSCFLocalDownloadFile alloc];
    if (v9)
    {
      p_isa = -[__NSCFLocalDownloadFile initWithFullPath:protectionType:](v10, (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", objc_msgSend(a1, "_pathToDownloadTaskFile"), 0), (void *)objc_msgSend(v4, "_downloadFileProtectionType"));
    }
    else
    {
      v12 = -[__NSCFLocalDownloadTask explicitDownloadDirectory](a1);
      v13 = objc_msgSend(v4, "_downloadFileProtectionType");
      if (v10)
      {
        v14 = (void *)v13;
        v15 = (__NSCFLocalDownloadFile *)-[__NSCFLocalDownloadFile initQueues](v10);
        v10 = v15;
        if (v15)
        {
          objc_setProperty_atomic_copy(v15, v16, v14, 208);
          if (v12)
            v17 = (NSString *)objc_msgSend(v12, "path");
          else
            v17 = NSTemporaryDirectory();
          snprintf(__str, 0x400uLL, "%s", -[NSString UTF8String](-[NSString stringByAppendingPathComponent:](v17, "stringByAppendingPathComponent:", CFSTR("CFNetworkDownload_XXXXXX.tmp")), "UTF8String"));
          v18 = mkstemps(__str, 4);
          if (v18 < 0)
          {
            v10->_error = *__error();
            if (CFNLog::onceToken != -1)
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
            v21 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              error = v10->_error;
              *(_DWORD *)buf = 67109378;
              v28 = error;
              v29 = 2080;
              v30 = __str;
              _os_log_error_impl(&dword_183ECA000, v21, OS_LOG_TYPE_ERROR, "__NSCFLocalDownloadFile: error %d creating temp file: %s", buf, 0x12u);
            }
          }
          else
          {
            v19 = v18;
            -[__NSCFLocalDownloadFile setPath:](v10, "setPath:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", __str));
            -[__NSCFLocalDownloadFile setFileDataProtection](v10, v20);
            close(v19);
            v10->_createdPlaceholder = 1;
          }
        }
      }
      p_isa = &v10->super.isa;
    }
    objc_msgSend(a1, "setDownloadFile:", p_isa);
  }
  v22 = objc_msgSend(v4, "skip_download_unlink");
  v23 = objc_msgSend(a1, "downloadFile");
  if (v23)
    *(_BYTE *)(v23 + 185) = v22;
  if (objc_msgSend(a1, "_pathToDownloadTaskFile"))
  {
    v24 = objc_msgSend(a1, "downloadFile");
    if (v24)
      *(_BYTE *)(v24 + 185) = 1;
  }
  a1[1028] = objc_msgSend(a1, "downloadFile") != 0;
  return a1[1028];
}

- (__NSCFLocalDownloadFile)downloadFile
{
  return (__NSCFLocalDownloadFile *)objc_getProperty(self, a2, 944, 1);
}

- (id)explicitDownloadDirectory
{
  id result;
  uint64_t v3;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_taskGroup"), "_groupConfiguration"), "_directoryForDownloadedFiles");
  if (!result)
  {
    if (a1)
    {
      v3 = a1[88];
      if (!v3)
        v3 = a1[87];
    }
    else
    {
      v3 = 0;
    }
    return -[__NSCFURLSessionDelegateWrapper _downloadTaskNeedsDownloadDirectory:](v3, a1);
  }
  return result;
}

- (void)dealloc
{
  NSObject *writeBuffer;
  SEL v4;
  SEL v5;
  SEL v6;
  objc_super v7;

  if (self)
    objc_setProperty_atomic_copy(self, a2, 0, 936);
  -[__NSCFLocalDownloadTask setDownloadFile:](self, "setDownloadFile:", 0);
  writeBuffer = self->_writeBuffer;
  if (writeBuffer)
    dispatch_release(writeBuffer);

  objc_setProperty_atomic_copy(self, v4, 0, 976);
  objc_setProperty_atomic_copy(self, v5, 0, 1016);
  objc_setProperty_atomic_copy(self, v6, 0, 1008);
  v7.receiver = self;
  v7.super_class = (Class)__NSCFLocalDownloadTask;
  -[__NSCFLocalSessionTask dealloc](&v7, sel_dealloc);
}

- (void)setDownloadFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 944);
}

- (_BYTE)initWithTaskGroup:(uint64_t)a3 request:(uint64_t)a4 filePath:(uint64_t)a5 ident:
{
  _BYTE *v6;
  _BYTE *v7;
  objc_super v9;

  if (!a1)
    return 0;
  a1[123] = -1;
  v9.receiver = a1;
  v9.super_class = (Class)__NSCFLocalDownloadTask;
  v6 = objc_msgSendSuper2(&v9, sel_initWithOriginalRequest_ident_taskGroup_, a3, a5, a2);
  v7 = v6;
  if (v6)
  {
    if ((-[__NSCFLocalDownloadTask setupForNewDownload:](v6, a4) & 1) != 0)
    {
      objc_msgSend(v7, "set_suspensionThreshhold:", 0x80000);
      v7[69] = 0;
      return v7;
    }

    return 0;
  }
  return v7;
}

- (void)_task_onqueue_didFinish
{
  int v3;
  NSString *v4;
  __int16 v5;
  NSInteger v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_extractorFinishedSuccessfully && -[NSURLSessionTask error](self, "error"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v3 = 138543618;
      v4 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
      v5 = 2048;
      v6 = -[NSError code](-[NSURLSessionTask error](self, "error"), "code");
      _os_log_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ extractor finished successfully, discarding previous error [%ld]", (uint8_t *)&v3, 0x16u);
    }
    -[NSURLSessionTask setError:](self, "setError:", 0);
  }
  if (!self->_needFinish)
  {
    self->_needFinish = 1;
    -[__NSCFLocalDownloadTask checkWrite](self, a2);
  }
}

- (void)_onqueue_willCacheResponse:(id)a3 withCompletion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (BOOL)_keepDownloadTaskFile
{
  __NSCFLocalDownloadFile *v2;

  v2 = -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile");
  if (v2)
    LOBYTE(v2) = v2->_skipUnlink;
  return (char)v2;
}

- (void)set_keepDownloadTaskFile:(BOOL)a3
{
  __NSCFLocalDownloadFile *v4;

  v4 = -[__NSCFLocalDownloadTask downloadFile](self, "downloadFile");
  if (v4)
    v4->_skipUnlink = a3;
}

- (int)openItemForPath:(id)a3 mode:(int)a4
{
  uint64_t v4;
  NSObject *v7;
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  int v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v4 = *(_QWORD *)&a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -1;
  v7 = dispatch_semaphore_create(0);
  if (self)
  {
    internalDelegateWrapper = self->super.super._internalDelegateWrapper;
    if (!internalDelegateWrapper)
      internalDelegateWrapper = self->super.super._publicDelegateWrapper;
  }
  else
  {
    internalDelegateWrapper = 0;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48____NSCFLocalDownloadTask_openItemForPath_mode___block_invoke;
  v11[3] = &unk_1E14FB348;
  v11[4] = v7;
  v11[5] = &v12;
  -[__NSCFURLSessionDelegateWrapper _openFileAtPath:mode:completionHandler:]((uint64_t)internalDelegateWrapper, a3, v4, v11);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
  v9 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)_onqueue_cancelByProducingResumeData:(id)a3
{
  const char *v5;
  const char *v6;
  id Property;
  void *v8;
  SEL v9;
  SEL v10;
  NSURLSession *v11;
  const char *v12;
  NSObject *global_queue;
  _QWORD v14[5];
  _QWORD newValue[6];
  _QWORD block[5];
  objc_super v17;

  if (-[NSURLSessionTask state](self, "state") > NSURLSessionTaskStateCanceling)
  {
    v11 = -[NSURLSessionTask session](self, "session");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_3;
    v14[3] = &unk_1E14FDEB0;
    v14[4] = a3;
    -[NSURLSession runDelegateBlock:]((uint64_t)v11, v14);
  }
  else if (self->_needFinish)
  {
    if (objc_getProperty(self, v5, 976, 1))
    {
      Property = objc_getProperty(self, v6, 976, 1);
      v8 = _Block_copy(Property);
      objc_setProperty_atomic_copy(self, v9, 0, 976);
      newValue[0] = MEMORY[0x1E0C809B0];
      newValue[1] = 3221225472;
      newValue[2] = __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_2;
      newValue[3] = &unk_1E14F69A0;
      newValue[4] = v8;
      newValue[5] = a3;
      objc_setProperty_atomic_copy(self, v10, newValue, 976);
    }
    else
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke;
      block[3] = &unk_1E14FDEB0;
      block[4] = a3;
      dispatch_async(global_queue, block);
    }
  }
  else
  {
    objc_setProperty_atomic_copy(self, v5, a3, 976);
    self->_needFinish = 1;
    v17.receiver = self;
    v17.super_class = (Class)__NSCFLocalDownloadTask;
    -[__NSCFLocalSessionTask _onqueue_cancel](&v17, sel__onqueue_cancel);
    -[__NSCFLocalDownloadTask checkWrite](self, v12);
  }
}

- (void)cancelByProducingResumeData:(id)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[6];

  v5 = -[NSURLSessionTask workQueue](self, "workQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55____NSCFLocalDownloadTask_cancelByProducingResumeData___block_invoke;
  v6[3] = &unk_1E14FDF00;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

- (void)terminateExtractorWithError:(id)a3 completion:(id)a4
{
  NSObject *v7;
  STExtractor *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  __NSCFLocalDownloadTask *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[NSURLSessionTask _extractor](self, "_extractor")
    && !-[NSURLSessionTask _extractorFinishedDecoding](self, "_extractorFinishedDecoding"))
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v7 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v11 = self;
      v12 = 2112;
      v13 = a3;
      v14 = 2048;
      v15 = objc_msgSend(a3, "code");
      _os_log_error_impl(&dword_183ECA000, v7, OS_LOG_TYPE_ERROR, "StreamingZip Error: attempting to terminate extractor for task: %@ because of error: %@ [%ld]", buf, 0x20u);
    }
    v8 = -[NSURLSessionTask _extractor](self, "_extractor");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66____NSCFLocalDownloadTask_terminateExtractorWithError_completion___block_invoke;
    v9[3] = &unk_1E14F9B68;
    v9[4] = self;
    -[STExtractor terminateStreamWithError:completionBlock:](v8, "terminateStreamWithError:completionBlock:", a3, v9);
    -[NSURLSessionTask set_extractorFinishedDecoding:](self, "set_extractorFinishedDecoding:", 1);
    (*((void (**)(id))a4 + 2))(a4);
  }
  else
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4
{
  __NSCFLocalDownloadTask *v6;
  __NSCFLocalDownloadFile *v7;
  __NSCFLocalDownloadFile *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t initialResumeSize;
  uint64_t internalDelegateWrapper;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  int error;
  uint64_t v23;
  char v24;
  _BYTE v25[23];
  uint8_t buf[4];
  _DWORD v27[7];

  v6 = self;
  *(_QWORD *)&v27[5] = *MEMORY[0x1E0C80C00];
  if (self)
  {
    -[NSURLSessionTask setResponse:](self, "setResponse:", a3);
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:](v6, "setCountOfBytesExpectedToReceive:", objc_msgSend(a3, "expectedContentLength"));
    self = (__NSCFLocalDownloadTask *)v6->super.super._internalDelegateWrapper;
    if (!self)
      self = (__NSCFLocalDownloadTask *)v6->super.super._publicDelegateWrapper;
  }
  -[__NSCFURLSessionDelegateWrapper downloadTask:_didReceiveResponse:]((uint64_t)self, v6, a3);
  v7 = -[__NSCFLocalDownloadTask downloadFile](v6, "downloadFile");
  if (v7)
  {
    v8 = v7;
    if (v7->_createdPlaceholder
      && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", -[__NSCFLocalDownloadFile path](v7, "path")) & 1) == 0)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v9 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v27 = -[__NSCFLocalDownloadFile path](v8, "path");
        _os_log_impl(&dword_183ECA000, v9, OS_LOG_TYPE_DEFAULT, "LocalDownloadFile placeholder %@ does not exist, recreating.", buf, 0xCu);
      }
      v10 = open(-[NSString UTF8String](-[__NSCFLocalDownloadFile path](v8, "path"), "UTF8String"), 2561, 438);
      if (v10 < 0)
      {
        v8->_error = *__error();
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v13 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          error = v8->_error;
          v23 = -[__NSCFLocalDownloadFile path](v8, "path");
          *(_DWORD *)buf = 67109378;
          v27[0] = error;
          LOWORD(v27[1]) = 2112;
          *(_QWORD *)((char *)&v27[1] + 2) = v23;
          _os_log_error_impl(&dword_183ECA000, v13, OS_LOG_TYPE_ERROR, "LocalDownloadFile: error %d recreating placeholder %@", buf, 0x12u);
        }
      }
      else
      {
        v12 = v10;
        -[__NSCFLocalDownloadFile setFileDataProtection](v8, v11);
        close(v12);
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = objc_msgSend(a3, "statusCode");
    if ((unint64_t)(v14 - 400) <= 0xFFFFFFFFFFFFFED3 && (dyld_program_sdk_at_least() & 1) == 0)
    {
      if ((unint64_t)(v14 - 401) > 6)
        v15 = -1100;
      else
        v15 = qword_18411DB50[v14 - 401];
      if (v6)
        v21 = -[__NSCFLocalSessionTask error:code:](v6, "error:code:", *MEMORY[0x1E0CB32E8], v15);
      else
        v21 = 0;
      -[__NSCFLocalSessionTask _onqueue_cancel_with_error:](v6, "_onqueue_cancel_with_error:", v21);
      goto LABEL_32;
    }
  }
  else
  {
    v14 = 200;
  }
  initialResumeSize = v6->_initialResumeSize;
  if (v14 != 206 && initialResumeSize != -1)
  {
    v6->_initialResumeSize = 0;
    v6->_totalWrote = 0;
    -[__NSCFLocalDownloadFile truncate]((uint64_t)-[__NSCFLocalDownloadTask downloadFile](v6, "downloadFile"));
    initialResumeSize = v6->_initialResumeSize;
  }
  if ((initialResumeSize & 0x8000000000000000) == 0)
  {
    -[NSURLSessionTask setCountOfBytesReceived:](v6, "setCountOfBytesReceived:", v6->_initialResumeSize + -[NSURLSessionTask countOfBytesReceived](v6, "countOfBytesReceived"));
    if ((-[NSURLSessionTask countOfBytesExpectedToReceive](v6, "countOfBytesExpectedToReceive") & 0x8000000000000000) == 0)
      -[NSURLSessionTask setCountOfBytesExpectedToReceive:](v6, "setCountOfBytesExpectedToReceive:", v6->_initialResumeSize + -[NSURLSessionTask countOfBytesExpectedToReceive](v6, "countOfBytesExpectedToReceive"));
    internalDelegateWrapper = (uint64_t)v6->super.super._internalDelegateWrapper;
    if (!internalDelegateWrapper)
      internalDelegateWrapper = (uint64_t)v6->super.super._publicDelegateWrapper;
    -[__NSCFURLSessionDelegateWrapper downloadTask:didResumeAtOffset:expectedTotalBytes:](internalDelegateWrapper, v6, -[NSURLSessionTask countOfBytesReceived](v6, "countOfBytesReceived"), -[NSURLSessionTask countOfBytesExpectedToReceive](v6, "countOfBytesExpectedToReceive"));
  }
LABEL_32:
  v18 = -[NSURLSessionTask _extractor](v6, "_extractor");
  v19 = 0;
  if (v14 >= 500 && v18)
  {
    if (objc_msgSend(a3, "valueForHTTPHeaderField:", CFSTR("X-Apple-Cache-Session")))
    {
      v19 = 0;
    }
    else
    {
      if (v6)
        v20 = -[__NSCFLocalSessionTask error:code:](v6, "error:code:", *MEMORY[0x1E0CB32E8], -1011);
      else
        v20 = 0;
      -[__NSCFLocalSessionTask _onqueue_cancel_with_error:](v6, "_onqueue_cancel_with_error:", v20);
      v19 = 1;
    }
  }
  v24 = v19;
  *(_QWORD *)&v25[15] = 10;
  *(_OWORD *)v25 = xmmword_18411DB39;
  (*((void (**)(id, char *))a4 + 2))(a4, &v24);
}

- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4
{
  NSObject *v7;
  NSObject *writeBuffer;
  const char *v9;
  NSURLSession *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  STExtractor *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t ioSuspend;
  uint64_t v18;
  _QWORD v19[8];
  _BYTE buf[24];
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  NSString *v23;
  _BYTE v24[24];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[NSURLSessionTask _extractor](self, "_extractor")
    && !-[NSURLSessionTask _extractorFinishedDecoding](self, "_extractorFinishedDecoding"))
  {
    v10 = -[NSURLSessionTask session](self, "session");
    if (v10
      && CFEqual(-[NSURLSessionConfiguration disposition](v10->_local_immutable_configuration_ivar, "disposition"), &unk_1EDD00610)|| -[NSURLSessionTask _extractorPreparedForExtraction](self, "_extractorPreparedForExtraction"))
    {
      -[__NSCFLocalDownloadTask _supplyExtractorWithData:completion:](self, a3, (uint64_t)a4);
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3052000000;
      v21 = __Block_byref_object_copy__582;
      v22 = __Block_byref_object_dispose__583;
      v23 = 0;
      v23 = -[__NSCFLocalDownloadFile path](-[__NSCFLocalDownloadTask downloadFile](self, "downloadFile"), "path");
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v13 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        v18 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v24 = 138412546;
        *(_QWORD *)&v24[4] = v18;
        *(_WORD *)&v24[12] = 2112;
        *(_QWORD *)&v24[14] = self;
        _os_log_debug_impl(&dword_183ECA000, v13, OS_LOG_TYPE_DEBUG, "StreamingZip - preparing for extraction to %@ for task %@", v24, 0x16u);
      }
      v14 = -[NSURLSessionTask _extractor](self, "_extractor");
      v15 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __82____NSCFLocalDownloadTask__task_onqueue_didReceiveDispatchData_completionHandler___block_invoke;
      v19[3] = &unk_1E14F6A38;
      v19[6] = a4;
      v19[7] = buf;
      v19[4] = self;
      v19[5] = a3;
      -[STExtractor prepareForExtractionToPath:completionBlock:](v14, "prepareForExtractionToPath:completionBlock:", v15, v19);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    if (-[NSURLSessionTask _extractor](self, "_extractor")
      && -[NSURLSessionTask _extractorFinishedDecoding](self, "_extractorFinishedDecoding"))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v7 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = dispatch_data_get_size((dispatch_data_t)a3);
        _os_log_impl(&dword_183ECA000, v7, OS_LOG_TYPE_INFO, "StreamingZip Info - using SZExtractor which finished decoding for task %@, but we received more bytes.  Dropping %lu bytes.", buf, 0x16u);
      }
      goto LABEL_9;
    }
    writeBuffer = self->_writeBuffer;
    if (writeBuffer)
    {
      self->_writeBuffer = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_writeBuffer, (dispatch_data_t)a3);
      dispatch_release(writeBuffer);
    }
    else
    {
      dispatch_retain((dispatch_object_t)a3);
      self->_writeBuffer = (OS_dispatch_data *)a3;
    }
    if (self->_canWrite)
    {
      -[__NSCFLocalDownloadTask checkWrite](self, v9);
LABEL_9:
      (*((void (**)(id))a4 + 2))(a4);
      return;
    }
    if (self->_ioSuspend)
      goto LABEL_9;
    v11 = self->_writeBuffer;
    if (dispatch_data_get_size(v11) <= 0x80000)
    {
      *(_QWORD *)v24 = 0;
      *(_QWORD *)&v24[8] = v24;
      *(_QWORD *)&v24[16] = 0x2020000000;
      v25 = 0;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___ZL13countSegmentsPU27objcproto16OS_dispatch_data8NSObject_block_invoke;
      v21 = (void (*)(uint64_t, uint64_t))&unk_1E14FD188;
      v22 = (void (*)(uint64_t))v24;
      dispatch_data_apply(v11, buf);
      v16 = *(_QWORD *)(*(_QWORD *)&v24[8] + 24);
      _Block_object_dispose(v24, 8);
      if (v16 < 0x1F)
        goto LABEL_9;
      ioSuspend = self->_ioSuspend;
      self->_ioSuspend = ioSuspend + 1;
      if (ioSuspend)
        goto LABEL_9;
    }
    else
    {
      self->_ioSuspend = 1;
    }
    objc_setProperty_atomic_copy(self, v12, a4, 1016);
    -[__NSCFLocalSessionTask _onqueue_suspend](self, "_onqueue_suspend");
  }
}

- (void)reportProgress:(_QWORD *)self
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  if (self)
  {
    self[121] += a2;
    self[125] += a2;
    if (!*((_BYTE *)self + 1029))
    {
      *((_BYTE *)self + 1029) = 1;
      if (!objc_getProperty(self, a2, 936, 1))
      {
        v4 = self[88];
        if (!v4)
          v4 = self[87];
        if (-[__NSCFURLSessionDelegateWrapper didWriteData](v4, v3))
        {
          v5 = self[125];
          self[125] = 0;
          if (v5)
          {
            v6 = self[88];
            if (!v6)
              v6 = self[87];
            v7 = self[121];
            v8 = objc_msgSend(self, "countOfBytesExpectedToReceive");
            v9[0] = MEMORY[0x1E0C809B0];
            v9[1] = 3221225472;
            v9[2] = __42____NSCFLocalDownloadTask_reportProgress___block_invoke;
            v9[3] = &unk_1E14FE118;
            v9[4] = self;
            -[__NSCFURLSessionDelegateWrapper downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:completionHandler:](v6, self, v5, v7, v8, v9);
          }
          else
          {
            *((_BYTE *)self + 1029) = 0;
          }
        }
      }
    }
  }
}

- (void)_supplyExtractorWithData:(uint64_t)a3 completion:
{
  void *v5;
  NSObject *v6;
  size_t size;
  void *v8;
  _QWORD v9[7];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    if (objc_msgSend(result, "_extractorPreparedForExtraction"))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v6 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v11 = -[NSObject length](a2, "length");
        v12 = 2112;
        v13 = v5;
        _os_log_debug_impl(&dword_183ECA000, v6, OS_LOG_TYPE_DEBUG, "StreamingZip(LocalDownloadTask) - supplied %lu bytes to extractor for decoding in task %@.", buf, 0x16u);
      }
      size = dispatch_data_get_size(a2);
      v8 = (void *)objc_msgSend(v5, "_extractor");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __63____NSCFLocalDownloadTask__supplyExtractorWithData_completion___block_invoke;
      v9[3] = &unk_1E14F6A60;
      v9[4] = v5;
      v9[5] = a3;
      v9[6] = size;
      return (void *)objc_msgSend(v8, "supplyBytes:withCompletionBlock:", a2, v9);
    }
    else
    {
      return (void *)(*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
    }
  }
  return result;
}

+ (id)_expandResumeData:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v5 = v4;
  if (v4 && objc_msgSend(v4, "objectForKey:", CFSTR("$archiver")))
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a3, 0);
    objc_msgSend(v6, "setDecodingFailurePolicy:", 0);
    if (resumeDataClasses(void)::onceToken != -1)
      dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_161);
    v7 = (void *)objc_msgSend(v6, "decodeObjectOfClasses:forKey:", resumeDataClasses(void)::resumeDataClasses, CFSTR("NSKeyedArchiveRootObjectKey"));
    objc_msgSend(v6, "finishDecoding");
    if (v7)
      return v7;
  }
  return v5;
}

+ (id)_requestFromResumeDataDictionary:(uint64_t)a3 key:
{
  uint64_t v5;
  id v6;
  void *v7;

  objc_opt_self();
  v5 = objc_msgSend(a2, "objectForKey:", a3);
  if (v5)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, 0);
    objc_msgSend(v6, "setDecodingFailurePolicy:", 0);
    if (resumeDataClasses(void)::onceToken != -1)
      dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_161);
    v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "decodeObjectOfClasses:forKey:", resumeDataClasses(void)::resumeDataClasses, CFSTR("NSKeyedArchiveRootObjectKey")), "mutableCopy");
    objc_msgSend(v6, "finishDecoding");
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (NSMutableURLRequest)_requestFromResumeDataDictionary:(uint64_t)a1
{
  NSMutableURLRequest *result;

  objc_opt_self();
  result = (NSMutableURLRequest *)+[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:key:]((uint64_t)__NSCFLocalDownloadTask, a2, (uint64_t)CFSTR("NSURLSessionResumeCurrentRequest"));
  if (!result)
  {
    result = (NSMutableURLRequest *)+[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:key:]((uint64_t)__NSCFLocalDownloadTask, a2, (uint64_t)CFSTR("NSURLSessionResumeOriginalRequest"));
    if (!result)
      return -[NSURLRequest initWithURL:cachePolicy:timeoutInterval:]([NSMutableURLRequest alloc], "initWithURL:cachePolicy:timeoutInterval:", objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(a2, "objectForKey:", CFSTR("NSURLSessionDownloadURL"))), 1, 120.0);
  }
  return result;
}

@end
