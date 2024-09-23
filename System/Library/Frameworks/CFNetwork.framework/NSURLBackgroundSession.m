@implementation NSURLBackgroundSession

void __50____NSURLBackgroundSession_recreateExistingTasks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  void *v6;
  __objc2_class **v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "identifier"))))
  {
    v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "identifier")));
    objc_msgSend(v6, "setCountOfBytesReceived:", objc_msgSend(a3, "countOfBytesReceived"));
    objc_msgSend(v6, "setCountOfBytesExpectedToReceive:", objc_msgSend(a3, "countOfBytesExpectedToReceive"));
    objc_msgSend(v6, "setCountOfBytesSent:", objc_msgSend(a3, "countOfBytesSent"));
    objc_msgSend(v6, "setCountOfBytesExpectedToSend:", objc_msgSend(a3, "countOfBytesExpectedToSend"));
    if (objc_msgSend(a3, "taskKind") != 3 && objc_msgSend(a3, "taskKind") != 5)
    {
      objc_msgSend(v6, "setResponse:", objc_msgSend(a3, "response"));
      objc_msgSend(v6, "updateCurrentRequest:", objc_msgSend(a3, "currentRequest"));
    }
    return;
  }
  if (objc_msgSend(a3, "taskKind"))
  {
    if (objc_msgSend(a3, "taskKind") == 1)
    {
      v7 = off_1E14E18A8;
    }
    else if (objc_msgSend(a3, "taskKind") == 2)
    {
      v7 = off_1E14E1898;
    }
    else if (objc_msgSend(a3, "taskKind") == 3)
    {
      v7 = off_1E14E1890;
    }
    else if (objc_msgSend(a3, "taskKind") == 5)
    {
      v7 = off_1E14E1888;
    }
    else
    {
      if (objc_msgSend(a3, "taskKind") != 4)
      {
        v8 = 0;
        goto LABEL_18;
      }
      v7 = off_1E14E1880;
    }
  }
  else
  {
    v7 = off_1E14E18A0;
  }
  v8 = (void *)objc_msgSend(objc_alloc(*v7), "initWithTaskInfo:taskGroup:ident:", a3, objc_msgSend(*(id *)(a1 + 32), "defaultTaskGroup"), v5);
LABEL_18:
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "taskIdentifier"));
  if (v8)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setObject:forKeyedSubscript:", v8, v9);

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 160);
  if (v5 >= v11)
    v11 = v5 + 1;
  *(_QWORD *)(v10 + 160) = v11;
}

uint64_t __41____NSURLBackgroundSession_cleanupConfig__block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  void *v5;
  _QWORD v7[2];
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "HTTPAdditionalHeaders"))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "HTTPAdditionalHeaders"), "mutableCopy");
    v5 = v4;
    if (!a1[6])
      objc_msgSend(v4, "setObject:forKeyedSubscript:", a1[4], 0x1EDCFD8C8);
    if (!a1[7])
      objc_msgSend(v5, "setObject:forKeyedSubscript:", a1[5], 0x1EDCFCBE0);
    return objc_msgSend(a2, "setHTTPAdditionalHeaders:", v5);
  }
  else
  {
    v7[0] = 0x1EDCFD8C8;
    v7[1] = 0x1EDCFCBE0;
    v8 = *((_OWORD *)a1 + 2);
    return objc_msgSend(a2, "setHTTPAdditionalHeaders:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, v7, 2));
  }
}

uint64_t __56____NSURLBackgroundSession__uploadTaskWithTaskForClass___block_invoke(uint64_t result, const char *a2)
{
  uint64_t v2;
  __NSCFBackgroundUploadTask *v3;
  __NSCFResumableUploadState *v4;
  id Property;
  SEL v6;
  NSURL *v7;
  SEL v8;
  id v9;
  SEL v10;
  id v11;
  const char *v12;
  NSObject *v13;
  id v14;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  __NSCFResumableUploadState *v19;
  const char *v20;
  const char *v21;
  int bodyType;
  char v23;
  NSObject *v24;
  uint64_t v25;
  const char *v26;
  char v27;
  NSObject *v28;
  uint64_t v29;
  const char *v30;
  objc_class *v31;
  NSString *v32;
  __NSCFBackgroundUploadTask *v33;
  uint64_t originalRequest;
  __NSCFBackgroundUploadTask *v35;
  const char *v36;
  __NSCFBackgroundUploadTask *v37;
  CFMutableDictionaryRef Mutable;
  const void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  char v44;
  NSDictionary *v45;
  NSURLRequest *currentRequest;
  const char *v47;
  NSObject *v48;
  uint64_t v49;
  const char *v50;
  NSObject *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  NSObject *v58;
  uint64_t v59;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  int v71;
  const char *v72;
  const __CFDictionary *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t internalDelegateWrapper;
  const void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  int v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  int v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v95[6];
  char v96;
  char v97;
  uint32_t multiuser_mode;
  _QWORD v99[2];
  uint64_t (*v100)(uint64_t);
  void *v101;
  NSURL *v102;
  char v103;
  _BYTE v104[24];
  NSURL *v105;
  __NSCFBackgroundUploadTask *v106;
  __NSCFBackgroundUploadTask *v107;
  id v108;
  __int128 v109;
  void (*v110)(uint64_t, uint64_t);
  void *v111;
  __NSCFBackgroundUploadTask *v112;
  __NSCFBackgroundUploadTask *v113;
  id v114;
  __int128 buf;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  uint64_t v119;
  const void *v120;
  uint64_t v121;

  v2 = result;
  v121 = *MEMORY[0x1E0C80C00];
  v3 = *(__NSCFBackgroundUploadTask **)(result + 32);
  if (v3)
  {
    v4 = *(__NSCFResumableUploadState **)(result + 40);
    if (v4)
    {
      Property = objc_getProperty(*(id *)(result + 40), a2, 16, 1);
      v7 = (NSURL *)objc_getProperty(v4, v6, 32, 1);
      v9 = objc_getProperty(v4, v8, 40, 1);
      v11 = objc_getProperty(v4, v10, 48, 1);
    }
    else
    {
      v9 = 0;
      Property = 0;
      v7 = 0;
      v11 = 0;
    }
    if (!objc_msgSend(Property, "HTTPBody") && !objc_msgSend(Property, "HTTPBodyStream"))
      goto LABEL_17;
    if (__CFNIsRunningInXcode::envCheckOnce != -1)
      dispatch_once(&__CFNIsRunningInXcode::envCheckOnce, &__block_literal_global_29);
    if (__CFNIsRunningInXcode::runningInXcode == 1)
    {
      if (__CFNRuntimeIssuesLogHandle::onceToken != -1)
        dispatch_once(&__CFNRuntimeIssuesLogHandle::onceToken, &__block_literal_global_4_4760);
      v13 = __CFNRuntimeIssuesLogHandle::logger;
      if (os_log_type_enabled((os_log_t)__CFNRuntimeIssuesLogHandle::logger, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
      }
    }
    if (objc_msgSend(Property, "HTTPBody")
      && (unint64_t)objc_msgSend((id)objc_msgSend(Property, "HTTPBody"), "length") > 0x4000)
    {
      v14 = (id)objc_msgSend(Property, "mutableCopy");
      objc_msgSend(v14, "setHTTPBody:", 0);
      if (v7)
      {
        v15 = 0;
      }
      else
      {
        v16 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "temporaryDirectory");
        v7 = (NSURL *)objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), 0);
        objc_msgSend((id)objc_msgSend(Property, "HTTPBody"), "writeToURL:atomically:", v7, 0);
        v15 = 1;
      }
      Property = v14;
    }
    else
    {
LABEL_17:
      v15 = 0;
    }
    v17 = MEMORY[0x1E0C809B0];
    v99[0] = MEMORY[0x1E0C809B0];
    v99[1] = 3221225472;
    v100 = __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke;
    v101 = &unk_1E14FDF58;
    v103 = v15;
    v102 = v7;
    if (v4)
    {
      v18 = objc_getProperty(v4, v12, 64, 1);
      if (v18)
      {
        v19 = +[__NSCFResumableUploadState rusWithResumeData:]((uint64_t)__NSCFResumableUploadState, v18);
        v4 = v19;
        if (!v19)
        {
          if (objc_msgSend(*(id *)&v3->super.super.super._allowsConstrainedOverride, "_isProxySession"))
          {
            if (CFNLog::onceToken != -1)
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
            v24 = CFNLog::logger;
            if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
              goto LABEL_59;
            v25 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v25;
            v26 = "ProxySession <%{public}@> Cannot create upload task with corrupt resume data";
          }
          else
          {
            if (CFNLog::onceToken != -1)
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
            v24 = CFNLog::logger;
            if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
              goto LABEL_59;
            v63 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v63;
            v26 = "BackgroundSession <%{public}@> Cannot create upload task with corrupt resume data";
          }
          _os_log_error_impl(&dword_183ECA000, v24, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&buf, 0xCu);
LABEL_59:
          v3 = 0;
          goto LABEL_60;
        }
        Property = objc_getProperty(v19, v20, 32, 1);
        bodyType = v4->_bodyType;
        if (bodyType)
        {
          if (bodyType == 1)
            v7 = -[__NSCFResumableUploadState uploadFile](v4, "uploadFile");
        }
        else
        {
          v9 = objc_getProperty(v4, v21, 40, 1);
        }
        v23 = 0;
LABEL_35:
        -[__NSURLBackgroundSession validateSerializabilityForRequest:completion:]((uint64_t)Property, (uint64_t)v11);
        if (v7)
        {
          if (-[NSURL isFileURL](v7, "isFileURL"))
          {
            if (-[NSURL _isSafeFileForBackgroundUploadForMe](v7, "_isSafeFileForBackgroundUploadForMe"))
              goto LABEL_38;
            v87 = (void *)MEMORY[0x1E0C99DA0];
            v88 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot read file at %@"), v7);
          }
          else
          {
            v87 = (void *)MEMORY[0x1E0C99DA0];
            v88 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a valid file:// url"), v7);
          }
          v89 = (void *)objc_msgSend(v87, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v88, 0);
          goto LABEL_164;
        }
LABEL_38:
        v27 = v23 ^ 1;
        if (Property)
          v27 = 1;
        if ((v27 & 1) == 0)
        {
          if (dyld_program_sdk_at_least())
            __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(CFSTR("Cannot create upload task without request or resume data"));
          goto LABEL_59;
        }
        if (BYTE1(v3->super.super.super._resumableUploadState))
        {
          if (objc_msgSend(*(id *)&v3->super.super.super._allowsConstrainedOverride, "_isProxySession"))
          {
            if (CFNLog::onceToken != -1)
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
            v28 = CFNLog::logger;
            if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
              goto LABEL_54;
            v29 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v29;
            v30 = "ProxySession <%{public}@> attempted to create a NSURLSessionUploadTask in a session that has been invalidated";
          }
          else
          {
            if (CFNLog::onceToken != -1)
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
            v28 = CFNLog::logger;
            if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
              goto LABEL_54;
            v62 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v62;
            v30 = "BackgroundSession <%{public}@> attempted to create a NSURLSessionUploadTask in a session that has been invalidated";
          }
          _os_log_error_impl(&dword_183ECA000, v28, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&buf, 0xCu);
LABEL_54:
          v32 = (NSString *)dyld_program_sdk_at_least();
          if ((_DWORD)v32)
            __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v32);
          goto LABEL_59;
        }
        if (*(_QWORD *)&v3->super.super.super._startTime)
        {
          v31 = (objc_class *)objc_opt_class();
          v3 = (__NSCFBackgroundUploadTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:](v3, v31, *(void **)&v3->super.super.super._startTime);
LABEL_60:
          result = v100((uint64_t)v99);
          goto LABEL_61;
        }
        if (v7 || !v9)
        {
          v33 = [__NSCFBackgroundUploadTask alloc];
          originalRequest = (uint64_t)v3->super.super.super._originalRequest;
          v3->super.super.super._originalRequest = (NSURLRequest *)(originalRequest + 1);
          v35 = -[__NSCFBackgroundDataTask initWithOriginalRequest:ident:taskGroup:](v33, "initWithOriginalRequest:ident:taskGroup:", Property, originalRequest, -[__NSCFBackgroundUploadTask defaultTaskGroup](v3, "defaultTaskGroup"));
          v37 = v35;
          if (v35)
            objc_setProperty_atomic_copy(v35, v36, v7, 848);
          -[NSURLSessionTask updateCurrentRequest:](v37, "updateCurrentRequest:", Property);
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v116 = 0x3812000000;
          v117 = __Block_byref_object_copy__105;
          v118 = __Block_byref_object_dispose__106;
          v119 = 0;
          v120 = 0;
          multiuser_mode = 0;
          if (!host_check_multiuser_mode(0, &multiuser_mode) && multiuser_mode)
          {
            Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            v39 = *(const void **)(*((_QWORD *)&buf + 1) + 48);
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 48) = Mutable;
            if (v39)
              CFRelease(v39);
            v40 = objc_msgSend((id)objc_msgSend(Property, "URL"), "host");
            v41 = (void *)objc_msgSend((id)objc_msgSend(Property, "URL"), "scheme");
            if (v40)
            {
              v42 = v41;
              if (v41)
              {
                v91 = objc_msgSend(v41, "isEqualToString:", CFSTR("http"));
                v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("https"));
                v44 = v43;
                if ((v91 | v43) == 1)
                {
                  v45 = -[NSURLCredentialStorage allCredentials](+[NSURLCredentialStorage sharedCredentialStorage](NSURLCredentialStorage, "sharedCredentialStorage"), "allCredentials");
                  if (v45)
                  {
                    v95[0] = v17;
                    v95[1] = 3221225472;
                    v95[2] = __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_112;
                    v95[3] = &unk_1E14F8648;
                    v96 = v44;
                    v97 = v91;
                    v95[4] = v40;
                    v95[5] = &buf;
                    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v45, "enumerateKeysAndObjectsUsingBlock:", v95);
                  }
                }
              }
            }
          }
          currentRequest = v3->super.super.super._currentRequest;
          if (currentRequest)
          {
            *(_QWORD *)&v109 = v17;
            *((_QWORD *)&v109 + 1) = 3221225472;
            v110 = __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_2;
            v111 = &unk_1E14F85E8;
            v112 = v3;
            v113 = v37;
            v114 = Property;
            v92 = (void *)-[NSURLRequest synchronousRemoteObjectProxyWithErrorHandler:](currentRequest, "synchronousRemoteObjectProxyWithErrorHandler:", &v109);
            if (!v7)
            {
              v90 = 0;
LABEL_139:
              v73 = *(const __CFDictionary **)(*((_QWORD *)&buf + 1) + 48);
              if (v73 && CFDictionaryGetCount(v73) >= 1)
                v74 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 48);
              else
                v74 = 0;
              if ((v23 & 1) != 0)
              {
                v75 = -[NSURLSessionTask taskIdentifier](v37, "taskIdentifier");
                v76 = -[NSURLSessionTask _uniqueIdentifier](v37, "_uniqueIdentifier");
                *(_QWORD *)v104 = v17;
                *(_QWORD *)&v104[8] = 3221225472;
                *(_QWORD *)&v104[16] = __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_2_118;
                v105 = (NSURL *)&unk_1E14F8610;
                v106 = v37;
                v107 = v3;
                v108 = Property;
                objc_msgSend(v92, "uploadTaskWithRequest:originalRequest:fromFile:sandboxExtensionData:identifier:uniqueIdentifier:potentialCredentials:reply:", Property, Property, v7, v90, v75, v76, v74, v104);
              }
              else
              {
                v77 = -[NSURLSessionTask taskIdentifier](v37, "taskIdentifier");
                v78 = -[NSURLSessionTask _uniqueIdentifier](v37, "_uniqueIdentifier");
                *(_QWORD *)v104 = v17;
                *(_QWORD *)&v104[8] = 3221225472;
                *(_QWORD *)&v104[16] = __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_117;
                v105 = (NSURL *)&unk_1E14F8610;
                v106 = v37;
                v107 = v3;
                v108 = Property;
                objc_msgSend(v92, "uploadTaskWithResumableUploadState:request:originalRequest:fromFile:sandboxExtensionData:identifier:uniqueIdentifier:potentialCredentials:reply:", v4, Property, Property, v7, v90, v77, v78, v74, v104);
              }

              if (v37)
              {
LABEL_147:
                objc_msgSend((id)v3->super.super.super._countOfBytesClientExpectsToSend, "setObject:forKeyedSubscript:", v37, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](v37, "taskIdentifier")));
                internalDelegateWrapper = (uint64_t)v37->super.super.super._internalDelegateWrapper;
                if (!internalDelegateWrapper)
                  internalDelegateWrapper = (uint64_t)v37->super.super.super._publicDelegateWrapper;
                goto LABEL_150;
              }
              goto LABEL_149;
            }
            -[NSURL fileSystemRepresentation](v7, "fileSystemRepresentation");
            v47 = (const char *)sandbox_extension_issue_file();
            if (objc_msgSend(*(id *)&v3->super.super.super._allowsConstrainedOverride, "_isProxySession"))
            {
              if (CFNLog::onceToken != -1)
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
              v48 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
              {
                v49 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
                *(_DWORD *)v104 = 138544130;
                *(_QWORD *)&v104[4] = v49;
                *(_WORD *)&v104[12] = 2114;
                *(_QWORD *)&v104[14] = v37;
                *(_WORD *)&v104[22] = 2112;
                v105 = v7;
                LOWORD(v106) = 1024;
                *(_DWORD *)((char *)&v106 + 2) = v47 != 0;
                v50 = "ProxySession <%{public}@> %{public}@ issued sandbox extension for file %@, succeeded = %{BOOL}d";
LABEL_92:
                _os_log_impl(&dword_183ECA000, v48, OS_LOG_TYPE_DEFAULT, v50, v104, 0x26u);
              }
            }
            else
            {
              if (CFNLog::onceToken != -1)
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
              v48 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
              {
                v54 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
                *(_DWORD *)v104 = 138544130;
                *(_QWORD *)&v104[4] = v54;
                *(_WORD *)&v104[12] = 2114;
                *(_QWORD *)&v104[14] = v37;
                *(_WORD *)&v104[22] = 2112;
                v105 = v7;
                LOWORD(v106) = 1024;
                *(_DWORD *)((char *)&v106 + 2) = v47 != 0;
                v50 = "BackgroundSession <%{public}@> %{public}@ issued sandbox extension for file %@, succeeded = %{BOOL}d";
                goto LABEL_92;
              }
            }
            if (v47)
            {
              v90 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v47, strlen(v47) + 1);
              goto LABEL_113;
            }
            if (objc_msgSend(*(id *)&v3->super.super.super._allowsConstrainedOverride, "_isProxySession"))
            {
              if (CFNLog::onceToken != -1)
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
              v58 = CFNLog::logger;
              if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                goto LABEL_112;
              v59 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
              v60 = *__error();
              *(_DWORD *)v104 = 138543874;
              *(_QWORD *)&v104[4] = v59;
              *(_WORD *)&v104[12] = 2112;
              *(_QWORD *)&v104[14] = v7;
              *(_WORD *)&v104[22] = 1024;
              LODWORD(v105) = v60;
              v61 = "ProxySession <%{public}@> Failed to issue sandbox extension for file %@, errno = %{errno}d";
            }
            else
            {
              if (CFNLog::onceToken != -1)
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
              v58 = CFNLog::logger;
              if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                goto LABEL_112;
              v83 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
              v84 = *__error();
              *(_DWORD *)v104 = 138543874;
              *(_QWORD *)&v104[4] = v83;
              *(_WORD *)&v104[12] = 2112;
              *(_QWORD *)&v104[14] = v7;
              *(_WORD *)&v104[22] = 1024;
              LODWORD(v105) = v84;
              v61 = "BackgroundSession <%{public}@> Failed to issue sandbox extension for file %@, errno = %{errno}d";
            }
            _os_log_error_impl(&dword_183ECA000, v58, OS_LOG_TYPE_ERROR, v61, v104, 0x1Cu);
LABEL_112:
            v90 = 0;
LABEL_113:
            v93 = 0;
            v94 = 0;
            if (-[NSURL getResourceValue:forKey:error:](v7, "getResourceValue:forKey:error:", &v94, *MEMORY[0x1E0C99938], &v93))
            {
              if (v94 == *MEMORY[0x1E0C99918] || v94 == *MEMORY[0x1E0C99920])
              {
                if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
                  dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
                v64 = __CFNAPIMisuseFaultLogHandle::logger;
                if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v104 = 138412546;
                  *(_QWORD *)&v104[4] = v7;
                  *(_WORD *)&v104[12] = 2112;
                  *(_QWORD *)&v104[14] = v94;
                  _os_log_fault_impl(&dword_183ECA000, v64, OS_LOG_TYPE_FAULT, "API MISUSE: Background upload from a file %@ with %@ is not supported. Please reduce the file protection class.", v104, 0x16u);
                }
              }
              goto LABEL_128;
            }
            if (objc_msgSend(*(id *)&v3->super.super.super._allowsConstrainedOverride, "_isProxySession"))
            {
              if (CFNLog::onceToken != -1)
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
              v65 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
              {
                v66 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
                *(_DWORD *)v104 = 138543618;
                *(_QWORD *)&v104[4] = v66;
                *(_WORD *)&v104[12] = 2112;
                *(_QWORD *)&v104[14] = v93;
                v67 = "ProxySession <%{public}@> Failed to check file protection class %@";
LABEL_155:
                _os_log_debug_impl(&dword_183ECA000, v65, OS_LOG_TYPE_DEBUG, v67, v104, 0x16u);
              }
            }
            else
            {
              if (CFNLog::onceToken != -1)
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
              v65 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
              {
                v82 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
                *(_DWORD *)v104 = 138543618;
                *(_QWORD *)&v104[4] = v82;
                *(_WORD *)&v104[12] = 2112;
                *(_QWORD *)&v104[14] = v93;
                v67 = "BackgroundSession <%{public}@> Failed to check file protection class %@";
                goto LABEL_155;
              }
            }
LABEL_128:
            v68 = open(-[NSURL fileSystemRepresentation](v7, "fileSystemRepresentation"), 0);
            if ((_DWORD)v68 != -1)
            {
              v7 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v68, 1);
              goto LABEL_139;
            }
            if (objc_msgSend(*(id *)&v3->super.super.super._allowsConstrainedOverride, "_isProxySession"))
            {
              if (CFNLog::onceToken != -1)
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
              v69 = CFNLog::logger;
              if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                goto LABEL_138;
              v70 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
              v71 = *__error();
              *(_DWORD *)v104 = 138543618;
              *(_QWORD *)&v104[4] = v70;
              *(_WORD *)&v104[12] = 1024;
              *(_DWORD *)&v104[14] = v71;
              v72 = "ProxySession <%{public}@> Failed to open file to upload %{errno}d";
            }
            else
            {
              if (CFNLog::onceToken != -1)
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
              v69 = CFNLog::logger;
              if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
                goto LABEL_138;
              v85 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
              v86 = *__error();
              *(_DWORD *)v104 = 138543618;
              *(_QWORD *)&v104[4] = v85;
              *(_WORD *)&v104[12] = 1024;
              *(_DWORD *)&v104[14] = v86;
              v72 = "BackgroundSession <%{public}@> Failed to open file to upload %{errno}d";
            }
            _os_log_error_impl(&dword_183ECA000, v69, OS_LOG_TYPE_ERROR, v72, v104, 0x12u);
LABEL_138:
            v7 = 0;
            goto LABEL_139;
          }
          if (objc_msgSend(*(id *)&v3->super.super.super._allowsConstrainedOverride, "_isProxySession"))
          {
            if (CFNLog::onceToken != -1)
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
            v51 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              v52 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
              LODWORD(v109) = 138543362;
              *(_QWORD *)((char *)&v109 + 4) = v52;
              v53 = "ProxySession <%{public}@> failed to create a background NSURLSessionUploadTask, as remote session is unavailable";
LABEL_153:
              _os_log_error_impl(&dword_183ECA000, v51, OS_LOG_TYPE_ERROR, v53, (uint8_t *)&v109, 0xCu);
            }
          }
          else
          {
            if (CFNLog::onceToken != -1)
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
            v51 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              v81 = *(_QWORD *)&v3->super.super.super._requiresDNSSECValidation;
              LODWORD(v109) = 138543362;
              *(_QWORD *)((char *)&v109 + 4) = v81;
              v53 = "BackgroundSession <%{public}@> failed to create a background NSURLSessionUploadTask, as remote sessi"
                    "on is unavailable";
              goto LABEL_153;
            }
          }
          v55 = objc_msgSend(Property, "URL");
          v56 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v55);
          if (v37)
          {
            objc_setProperty_atomic(v37, v57, v56, 776);
            goto LABEL_147;
          }
LABEL_149:
          internalDelegateWrapper = 0;
LABEL_150:
          -[__NSCFURLSessionDelegateWrapper didCreateTask:](internalDelegateWrapper, v37);
          v3 = v37;
          _Block_object_dispose(&buf, 8);
          v80 = v120;
          v120 = 0;
          if (v80)
            CFRelease(v80);
          goto LABEL_60;
        }
        v89 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Upload tasks from NSData are not supported in background sessions."), 0);
LABEL_164:
        objc_exception_throw(v89);
      }
      v4 = 0;
    }
    v23 = 1;
    goto LABEL_35;
  }
LABEL_61:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40) = v3;
  return result;
}

void __67____NSURLBackgroundSession__onqueue_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __87____NSURLBackgroundSession_backgroundTask_didCompleteWithError_taskMetrics_info_reply___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  id Property;
  const char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id *v13;

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 72));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 112);
  else
    v4 = 0;
  if (objc_msgSend(v4, "_allowsRetryForBackgroundDataTasks")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "domain"),
        objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    && objc_msgSend(*(id *)(a1 + 40), "code") == -997)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    -[__NSURLBackgroundSession _onqueue_retryDataTaskWithIdentifier:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
  }
  else
  {
    objc_msgSend(v2, "set_metrics:", *(_QWORD *)(a1 + 48));
    v7 = *(void **)(a1 + 48);
    if (v7)
      Property = objc_getProperty(v7, v6, 96, 1);
    else
      Property = 0;
    objc_msgSend(v2, "set_backgroundTransactionMetrics:", Property);
    v10 = *(void **)(a1 + 48);
    if (v10)
      v11 = objc_getProperty(v10, v9, 96, 1);
    else
      v11 = 0;
    objc_msgSend(v2, "_logUnlistedTracker:", v11);
    objc_msgSend(v2, "set_trailers:", objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("trailers")));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      -[__NSURLBackgroundSession setCookiesFromResponse:forCurrentRequest:partitionIdentifier:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(v2, "response"), (void *)objc_msgSend(v2, "currentRequest"), (const void *)objc_msgSend(v2, "_storagePartitionIdentifier"));
    objc_msgSend(v2, "_finishProgressReporting");
    if (*(_QWORD *)(a1 + 48))
    {
      if (v2)
      {
        v12 = (uint64_t)v2[88];
        if (!v12)
          v12 = (uint64_t)v2[87];
      }
      else
      {
        v12 = 0;
      }
      v13 = -[NSURLSessionTaskMetrics initWithMetrics:]((id *)[NSURLSessionTaskMetrics alloc], *(void **)(a1 + 48));
      -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:](v12, v2, v13, &__block_literal_global_184);
    }
    objc_msgSend(v2, "_onqueue_didFinishWithError:", *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __68____NSURLBackgroundSession_performBlockOnQueueAndRethrowExceptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 168);
  if (v3)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68____NSURLBackgroundSession_performBlockOnQueueAndRethrowExceptions___block_invoke_2;
    v14[3] = &unk_1E14F8578;
    v14[4] = &v15;
    objc_msgSend((id)objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v14), "pingForXPCObjectValidityWithReply:", &__block_literal_global_4470);
    v2 = *(_QWORD *)(a1 + 32);
    if (*((_BYTE *)v16 + 24))
    {
      objc_msgSend(*(id *)(v2 + 176), "invalidate");

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_BYTE *)(v2 + 280) || *((_BYTE *)v16 + 24))
  {
    if (objc_msgSend(*(id *)(v2 + 112), "_isProxySession"))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v4 = CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
        v6 = *(_QWORD *)(v5 + 128);
      else
        v6 = 0;
      if (*(_BYTE *)(v5 + 280))
        v7 = 89;
      else
        v7 = 78;
      if (*((_BYTE *)v16 + 24))
        v8 = 89;
      else
        v8 = 78;
      *(_DWORD *)buf = 138543874;
      v20 = v6;
      v21 = 1024;
      v22 = v7;
      v23 = 1024;
      v24 = v8;
      v9 = "ProxySession <%{public}@> attempting to reconnect to background transfer daemon prior to NSURLSessionTask cre"
           "ation, reconnect=%c, invalid=%c";
    }
    else
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v4 = CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
        v11 = *(_QWORD *)(v10 + 128);
      else
        v11 = 0;
      if (*(_BYTE *)(v10 + 280))
        v12 = 89;
      else
        v12 = 78;
      if (*((_BYTE *)v16 + 24))
        v13 = 89;
      else
        v13 = 78;
      *(_DWORD *)buf = 138543874;
      v20 = v11;
      v21 = 1024;
      v22 = v12;
      v23 = 1024;
      v24 = v13;
      v9 = "BackgroundSession <%{public}@> attempting to reconnect to background transfer daemon prior to NSURLSessionTas"
           "k creation, reconnect=%c, invalid=%c";
    }
    _os_log_impl(&dword_183ECA000, v4, OS_LOG_TYPE_DEFAULT, v9, buf, 0x18u);
LABEL_32:
    -[__NSURLBackgroundSession setupXPCConnection](*(_QWORD *)(a1 + 32));
    -[__NSURLBackgroundSession setupBackgroundSession](*(_QWORD *)(a1 + 32));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_object_dispose(&v15, 8);
}

void __58____NSURLBackgroundSession__downloadTaskWithTaskForClass___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t Property;
  SEL v6;
  NSData *v7;
  SEL v8;
  id v9;
  _QWORD *p_isa;
  objc_class *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  const char *v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSString *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  __NSCFBackgroundDownloadTask *v32;
  uint64_t v33;
  __NSCFBackgroundDownloadTask *v34;
  void *v35;
  NSString *v36;
  __NSCFBackgroundDownloadTask *v37;
  uint64_t v38;
  __NSCFBackgroundDownloadTask *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  int v46;
  NSObject *v47;
  _BOOL4 v48;
  uint64_t v49;
  const char *v50;
  int v51;
  NSObject *v52;
  _BOOL4 v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  objc_class *v58;
  __NSCFBackgroundDownloadTask *v59;
  int v60;
  NSObject *v61;
  _BOOL4 v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  objc_class *v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  NSObject *v73;
  _BOOL4 v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  __NSCFBackgroundDownloadTask *v91;
  __NSCFBackgroundDownloadTask *v92;
  uint64_t v93;
  uint8_t buf[4];
  uint64_t v95;
  _BYTE __str[24];
  void *v97;
  __NSCFBackgroundDownloadTask *v98;
  __NSCFBackgroundDownloadTask *v99;
  uint64_t v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
  {
LABEL_6:
    p_isa = 0;
    goto LABEL_9;
  }
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    Property = (uint64_t)objc_getProperty(*(id *)(a1 + 40), a2, 16, 1);
    v7 = (NSData *)objc_getProperty(v4, v6, 64, 1);
    v9 = objc_getProperty(v4, v8, 72, 1);
  }
  else
  {
    v7 = 0;
    Property = 0;
    v9 = 0;
  }
  -[__NSURLBackgroundSession validateSerializabilityForRequest:completion:](Property, (uint64_t)v9);
  if (!(Property | (unint64_t)v7))
  {
    if (dyld_program_sdk_at_least())
      __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(CFSTR("Cannot create download task without request or resume data"));
    goto LABEL_6;
  }
  if (*(_QWORD *)(v3 + 272))
  {
    v11 = (objc_class *)objc_opt_class();
    p_isa = -[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]((_QWORD *)v3, v11, *(void **)(v3 + 272));
    goto LABEL_9;
  }
  if (*(_BYTE *)(v3 + 265))
  {
    v12 = objc_msgSend(*(id *)(v3 + 112), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v13 = CFNLog::logger;
    v14 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (!v14)
        goto LABEL_30;
      v15 = *(_QWORD *)(v3 + 128);
      *(_DWORD *)__str = 138543362;
      *(_QWORD *)&__str[4] = v15;
      v16 = "ProxySession <%{public}@> attempted to create a NSURLSessionDownloadTask in a session that has been invalidated";
    }
    else
    {
      if (!v14)
        goto LABEL_30;
      v80 = *(_QWORD *)(v3 + 128);
      *(_DWORD *)__str = 138543362;
      *(_QWORD *)&__str[4] = v80;
      v16 = "BackgroundSession <%{public}@> attempted to create a NSURLSessionDownloadTask in a session that has been invalidated";
    }
    _os_log_error_impl(&dword_183ECA000, v13, OS_LOG_TYPE_ERROR, v16, __str, 0xCu);
LABEL_30:
    v36 = (NSString *)dyld_program_sdk_at_least();
    if ((_DWORD)v36)
      __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v36);
    goto LABEL_6;
  }
  if (v7)
  {
    v17 = -[NSData _isSafeResumeDataForBackgroundDownload](v7, "_isSafeResumeDataForBackgroundDownload");
    v18 = copyDecodedResumeData(v7);
    if (objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("NSURLSessionResumeInfoVersion")), "intValue") == 1)
    {
      v19 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, 0);
      v20 = (void *)objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("NSURLSessionResumeInfoLocalPath"));
      v21 = (id)objc_msgSend(v19, "mutableCopy");
      objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E152A640, CFSTR("NSURLSessionResumeInfoVersion"));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", objc_msgSend(v20, "lastPathComponent"), CFSTR("NSURLSessionResumeInfoTempFileName"));
      v7 = (NSData *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v21, 200, 0, 0);
    }
    if (!objc_msgSend(*(id *)(v3 + 112), "_directoryForDownloadedFiles"))
    {
      v22 = -[__NSURLBackgroundSession backgroundDownloadsDirectory](v3);
      if (v22)
      {
        v23 = v22;
        v24 = NSTemporaryDirectory();
        -[__NSURLBackgroundSession moveFileForResumeData:fromDirectory:toDirectory:](v3, v7, v24, (void *)objc_msgSend(v23, "path"));
      }
    }

    v25 = copyDecodedResumeData(v7);
    v26 = objc_msgSend(v25, "objectForKey:", CFSTR("NSURLSessionResumeCurrentRequest"));
    v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v26, 0);
    objc_msgSend(v27, "setDecodingFailurePolicy:", 0);
    if (resumeDataClasses(void)::onceToken != -1)
      dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_392);
    v28 = (void *)objc_msgSend(v27, "decodeObjectOfClasses:forKey:", resumeDataClasses(void)::resumeDataClasses, CFSTR("NSKeyedArchiveRootObjectKey"));
    objc_msgSend(v27, "finishDecoding");
    v29 = objc_msgSend(v25, "objectForKey:", CFSTR("NSURLSessionResumeOriginalRequest"));
    v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v29, 0);
    objc_msgSend(v30, "setDecodingFailurePolicy:", 0);
    if (resumeDataClasses(void)::onceToken != -1)
      dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_392);
    v31 = objc_msgSend(v30, "decodeObjectOfClasses:forKey:", resumeDataClasses(void)::resumeDataClasses, CFSTR("NSKeyedArchiveRootObjectKey"));
    objc_msgSend(v30, "finishDecoding");

    if (v17)
    {
      v32 = [__NSCFBackgroundDownloadTask alloc];
      v33 = *(_QWORD *)(v3 + 160);
      *(_QWORD *)(v3 + 160) = v33 + 1;
      v34 = -[__NSCFBackgroundSessionTask initWithOriginalRequest:ident:taskGroup:](v32, "initWithOriginalRequest:ident:taskGroup:", v28, v33, objc_msgSend((id)v3, "defaultTaskGroup"));
      -[NSURLSessionTask setOriginalRequest:](v34, "setOriginalRequest:", v31);
      v35 = *(void **)(v3 + 168);
      if (v35)
      {
        *(_QWORD *)__str = MEMORY[0x1E0C809B0];
        *(_QWORD *)&__str[8] = 3221225472;
        *(_QWORD *)&__str[16] = __63____NSURLBackgroundSession__onqueue_downloadTaskForResumeData___block_invoke;
        v97 = &unk_1E14F85E8;
        v98 = (__NSCFBackgroundDownloadTask *)v3;
        v99 = v34;
        v100 = (uint64_t)v28;
        v87 = MEMORY[0x1E0C809B0];
        v88 = 3221225472;
        v89 = __63____NSURLBackgroundSession__onqueue_downloadTaskForResumeData___block_invoke_128;
        v90 = &unk_1E14F8610;
        v91 = v34;
        v92 = (__NSCFBackgroundDownloadTask *)v3;
        v93 = (uint64_t)v28;
        objc_msgSend((id)objc_msgSend(v35, "synchronousRemoteObjectProxyWithErrorHandler:", __str), "downloadTaskWithResumeData:identifier:uniqueIdentifier:reply:", v7, -[NSURLSessionTask taskIdentifier](v34, "taskIdentifier"), -[NSURLSessionTask _uniqueIdentifier](v34, "_uniqueIdentifier"), &v87);
LABEL_74:
        v59 = v34;
        goto LABEL_81;
      }
      v60 = objc_msgSend(*(id *)(v3 + 112), "_isProxySession");
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v61 = CFNLog::logger;
      v62 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v60)
      {
        if (!v62)
          goto LABEL_72;
        v63 = *(_QWORD *)(v3 + 128);
        *(_DWORD *)buf = 138543362;
        v95 = v63;
        v64 = "ProxySession <%{public}@> failed to create a background NSURLSessionDownloadTask, as remote session is unavailable";
      }
      else
      {
        if (!v62)
          goto LABEL_72;
        v85 = *(_QWORD *)(v3 + 128);
        *(_DWORD *)buf = 138543362;
        v95 = v85;
        v64 = "BackgroundSession <%{public}@> failed to create a background NSURLSessionDownloadTask, as remote session is unavailable";
      }
      _os_log_error_impl(&dword_183ECA000, v61, OS_LOG_TYPE_ERROR, v64, buf, 0xCu);
LABEL_72:
      v77 = objc_msgSend(v28, "URL");
      v78 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v77);
      if (v34)
        objc_setProperty_atomic(v34, v79, v78, 776);
      goto LABEL_74;
    }
    v46 = objc_msgSend(*(id *)(v3 + 112), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v47 = CFNLog::logger;
    v48 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v46)
    {
      if (v48)
      {
        v49 = *(_QWORD *)(v3 + 128);
        *(_DWORD *)buf = 138543362;
        v95 = v49;
        v50 = "ProxySession <%{public}@> Invalid resume data for background download. Background downloads must use http "
              "or https and must download to an accessible file.";
LABEL_53:
        _os_log_impl(&dword_183ECA000, v47, OS_LOG_TYPE_DEFAULT, v50, buf, 0xCu);
      }
    }
    else if (v48)
    {
      v56 = *(_QWORD *)(v3 + 128);
      *(_DWORD *)buf = 138543362;
      v95 = v56;
      v50 = "BackgroundSession <%{public}@> Invalid resume data for background download. Background downloads must use ht"
            "tp or https and must download to an accessible file.";
      goto LABEL_53;
    }
    v57 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -3003, 0);
    v58 = (objc_class *)objc_opt_class();
    v59 = (__NSCFBackgroundDownloadTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]((_QWORD *)v3, v58, v57);
    goto LABEL_81;
  }
  if ((objc_msgSend((id)Property, "_isSafeRequestForBackgroundDownload") & 1) == 0)
  {
    v51 = objc_msgSend(*(id *)(v3 + 112), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v52 = CFNLog::logger;
    v53 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v51)
    {
      if (v53)
      {
        v54 = *(_QWORD *)(v3 + 128);
        *(_DWORD *)__str = 138543618;
        *(_QWORD *)&__str[4] = v54;
        *(_WORD *)&__str[12] = 2112;
        *(_QWORD *)&__str[14] = objc_msgSend((id)objc_msgSend((id)Property, "URL"), "scheme");
        v55 = "ProxySession <%{public}@> Invalid URL scheme for background downloads: %@. Valid schemes are http or https";
LABEL_62:
        _os_log_impl(&dword_183ECA000, v52, OS_LOG_TYPE_DEFAULT, v55, __str, 0x16u);
      }
    }
    else if (v53)
    {
      v65 = *(_QWORD *)(v3 + 128);
      *(_DWORD *)__str = 138543618;
      *(_QWORD *)&__str[4] = v65;
      *(_WORD *)&__str[12] = 2112;
      *(_QWORD *)&__str[14] = objc_msgSend((id)objc_msgSend((id)Property, "URL"), "scheme");
      v55 = "BackgroundSession <%{public}@> Invalid URL scheme for background downloads: %@. Valid schemes are http or https";
      goto LABEL_62;
    }
    v66 = (void *)MEMORY[0x1E0CB35C8];
    v67 = objc_msgSend((id)Property, "URL");
    v68 = (void *)objc_msgSend(v66, "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1002, v67);
    v69 = (objc_class *)objc_opt_class();
    v59 = (__NSCFBackgroundDownloadTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]((_QWORD *)v3, v69, v68);
    goto LABEL_81;
  }
  v37 = [__NSCFBackgroundDownloadTask alloc];
  v38 = *(_QWORD *)(v3 + 160);
  *(_QWORD *)(v3 + 160) = v38 + 1;
  v39 = -[__NSCFBackgroundSessionTask initWithOriginalRequest:ident:taskGroup:](v37, "initWithOriginalRequest:ident:taskGroup:", Property, v38, objc_msgSend((id)v3, "defaultTaskGroup"));
  -[NSURLSessionTask updateCurrentRequest:](v39, "updateCurrentRequest:", Property);
  v40 = *(void **)(v3 + 168);
  if (!v40)
  {
    v72 = objc_msgSend(*(id *)(v3 + 112), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v73 = CFNLog::logger;
    v74 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v72)
    {
      if (!v74)
        goto LABEL_78;
      v75 = *(_QWORD *)(v3 + 128);
      *(_DWORD *)__str = 138543362;
      *(_QWORD *)&__str[4] = v75;
      v76 = "ProxySession <%{public}@> failed to create a background NSURLSessionDownloadTask, as remote session is unavailable";
    }
    else
    {
      if (!v74)
        goto LABEL_78;
      v86 = *(_QWORD *)(v3 + 128);
      *(_DWORD *)__str = 138543362;
      *(_QWORD *)&__str[4] = v86;
      v76 = "BackgroundSession <%{public}@> failed to create a background NSURLSessionDownloadTask, as remote session is unavailable";
    }
    _os_log_error_impl(&dword_183ECA000, v73, OS_LOG_TYPE_ERROR, v76, __str, 0xCu);
LABEL_78:
    v81 = objc_msgSend((id)Property, "URL");
    v82 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v81);
    if (v39)
      objc_setProperty_atomic(v39, v83, v82, 776);
    goto LABEL_80;
  }
  v41 = MEMORY[0x1E0C809B0];
  v87 = MEMORY[0x1E0C809B0];
  v88 = 3221225472;
  v89 = __60____NSURLBackgroundSession__onqueue_downloadTaskForRequest___block_invoke;
  v90 = &unk_1E14F85E8;
  v91 = (__NSCFBackgroundDownloadTask *)v3;
  v92 = v39;
  v93 = Property;
  v42 = (void *)objc_msgSend(v40, "synchronousRemoteObjectProxyWithErrorHandler:", &v87);
  if (!*(_BYTE *)(v3 + 264))
    goto LABEL_64;
  if (__CFNProcessIsMobileAssetDaemon::onceToken != -1)
    dispatch_once(&__CFNProcessIsMobileAssetDaemon::onceToken, &__block_literal_global_18);
  if ((!__CFNProcessIsMobileAssetDaemon::result || geteuid())
    && (v43 = -[__NSURLBackgroundSession backgroundDownloadsDirectory](v3)) != 0)
  {
    snprintf(__str, 0x400uLL, "%s", (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v43, "path"), "stringByAppendingPathComponent:", CFSTR("CFNetworkDownload_XXXXXX.tmp")), "UTF8String"));
    v44 = mkstemps(__str, 4);
    close(v44);
    v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", __str);
  }
  else
  {
LABEL_64:
    v45 = 0;
  }
  v70 = -[NSURLSessionTask taskIdentifier](v39, "taskIdentifier");
  v71 = -[NSURLSessionTask _uniqueIdentifier](v39, "_uniqueIdentifier");
  *(_QWORD *)__str = v41;
  *(_QWORD *)&__str[8] = 3221225472;
  *(_QWORD *)&__str[16] = __60____NSURLBackgroundSession__onqueue_downloadTaskForRequest___block_invoke_132;
  v97 = &unk_1E14F8610;
  v98 = v39;
  v99 = (__NSCFBackgroundDownloadTask *)v3;
  v100 = Property;
  objc_msgSend(v42, "downloadTaskWithRequest:originalRequest:downloadFilePath:identifier:uniqueIdentifier:reply:", Property, Property, v45, v70, v71, __str);
LABEL_80:
  v59 = v39;
LABEL_81:
  p_isa = &v59->super.super.super.isa;
  if (v59)
  {
    objc_msgSend(*(id *)(v3 + 184), "setObject:forKeyedSubscript:", v59, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](v59, "taskIdentifier")));
    v84 = p_isa[88];
    if (!v84)
      v84 = p_isa[87];
    -[__NSCFURLSessionDelegateWrapper didCreateTask:](v84, p_isa);
  }
LABEL_9:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = p_isa;
}

uint64_t __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", *(_QWORD *)(result + 32), 0);
  return result;
}

uint64_t __52____NSURLBackgroundSession_backgroundTaskDidResume___block_invoke(uint64_t a1)
{
  return objc_msgSend(-[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 40)), "setState:", 0);
}

uint64_t __49____NSURLBackgroundSession_failDisconnectedTasks__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    v6 = *MEMORY[0x1E0CB32E8];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v9 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), objc_msgSend(v8, "unsignedIntegerValue"));
        v10 = *(_QWORD *)(a1 + 32);
        if (v10)
          v11 = *(void **)(v10 + 112);
        else
          v11 = 0;
        if (objc_msgSend(v11, "_allowsRetryForBackgroundDataTasks")
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          -[__NSURLBackgroundSession _onqueue_retryDataTaskWithIdentifier:](*(_QWORD *)(a1 + 32), objc_msgSend(v8, "unsignedIntegerValue"));
        }
        else
        {
          v12 = *(_QWORD *)(a1 + 32);
          if ((objc_msgSend(v9, "_isAVAssetTask") & 1) != 0)
            v13 = 0;
          else
            v13 = objc_msgSend((id)objc_msgSend(v9, "currentRequest"), "URL");
          if (v12)
            v14 = objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", v6, -997, v13);
          else
            v14 = 0;
          objc_msgSend(v9, "_onqueue_didFinishWithError:", v14);
        }
        ++v7;
      }
      while (v4 != v7);
      v15 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v4 = v15;
    }
    while (v15);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "removeAllObjects");
}

void __58____NSURLBackgroundSession__onqueue_completeInvalidation___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    *(_BYTE *)(v3 + 265) = 1;
    -[NSURLSession finalizeDelegateWithError:](*(_QWORD *)(a1 + 32));
    return;
  }
  if (v3)
    v4 = *(void **)(v3 + 112);
  else
    v4 = 0;
  v5 = objc_msgSend(v4, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v6 = CFNLog::logger;
  v7 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7)
      return;
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      v9 = *(_QWORD *)(v8 + 128);
    else
      v9 = 0;
    v13 = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v8;
    v10 = "ProxySession <%{public}@> Already invalidating %@";
  }
  else
  {
    if (!v7)
      return;
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      v12 = *(_QWORD *)(v11 + 128);
    else
      v12 = 0;
    v13 = 138543618;
    v14 = v12;
    v15 = 2112;
    v16 = v11;
    v10 = "BackgroundSession <%{public}@> Already invalidating %@";
  }
  _os_log_impl(&dword_183ECA000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0x16u);
}

void __51____NSURLBackgroundSession_sendInvalidationRequest__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(NSObject **)(v1 + 120);
  else
    v2 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51____NSURLBackgroundSession_sendInvalidationRequest__block_invoke_2;
  block[3] = &unk_1E14FE118;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __61____NSURLBackgroundSession__onqueue_invokeInvalidateCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 284);
  if (v3)
  {
    notify_cancel(v3);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 284) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "invalidate");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 40));
}

void __51____NSURLBackgroundSession_sendInvalidationRequest__block_invoke_2(uint64_t a1)
{
  -[__NSURLBackgroundSession _onqueue_invokeInvalidateCallback](*(_QWORD *)(a1 + 32));
}

void __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 112);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v7 = CFNLog::logger;
  v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (v9)
        v9 = *(_QWORD *)(v9 + 128);
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = a2;
      v10 = "ProxySession <%{public}@> an error occurred on the xpc connection to setup the background session: %@";
LABEL_15:
      _os_log_error_impl(&dword_183ECA000, v7, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x16u);
    }
  }
  else if (v8)
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      v11 = *(_QWORD *)(v11 + 128);
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = a2;
    v10 = "BackgroundSession <%{public}@> an error occurred on the xpc connection to setup the background session: %@";
    goto LABEL_15;
  }
}

void __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_46(uint64_t a1, void *a2, void *a3, char a4)
{
  uint64_t v8;
  void *v9;
  int v10;
  __objc2_class **p_superclass;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  void *v38;
  int v39;
  NSObject *v40;
  _BOOL4 v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  int v47;
  NSObject *v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(void **)(v8 + 112);
  else
    v9 = 0;
  v10 = objc_msgSend(v9, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  p_superclass = &OBJC_METACLASS_____CFN_TransactionMetrics.superclass;
  v12 = CFNLog::logger;
  v13 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (!v13)
      goto LABEL_15;
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
    {
      v15 = *(_QWORD *)(v14 + 128);
      v16 = *(void **)(v14 + 112);
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
    *(_DWORD *)buf = 138543874;
    v65 = v15;
    v66 = 2112;
    v67 = v14;
    v68 = 2112;
    v69 = objc_msgSend(v16, "identifier");
    v17 = "ProxySession <%{public}@> background session setup reply received: session %@ with identifier %@";
  }
  else
  {
    if (!v13)
      goto LABEL_15;
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
    {
      v19 = *(_QWORD *)(v18 + 128);
      v20 = *(void **)(v18 + 112);
    }
    else
    {
      v19 = 0;
      v20 = 0;
    }
    *(_DWORD *)buf = 138543874;
    v65 = v19;
    v66 = 2112;
    v67 = v18;
    v68 = 2112;
    v69 = objc_msgSend(v20, "identifier");
    v17 = "BackgroundSession <%{public}@> background session setup reply received: session %@ with identifier %@";
  }
  _os_log_impl(&dword_183ECA000, v12, OS_LOG_TYPE_DEFAULT, v17, buf, 0x20u);
LABEL_15:
  if (!a2)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("kNSURLSessionThrowImmediateAVExceptionKey")), "BOOLValue"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      return;
    }
    if (objc_msgSend(a3, "objectForKey:", CFSTR("kNSURLSessionImmediateInvalidationErrorKey")))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = (id)objc_msgSend(a3, "objectForKey:", CFSTR("kNSURLSessionImmediateInvalidationErrorKey"));
      return;
    }
    v45 = *(_QWORD *)(a1 + 32);
    if (v45)
      v46 = *(void **)(v45 + 112);
    else
      v46 = 0;
    v47 = objc_msgSend(v46, "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v48 = CFNLog::logger;
    v49 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v47)
    {
      if (!v49)
        return;
      v50 = *(_QWORD *)(a1 + 32);
      if (v50)
      {
        v51 = *(_QWORD *)(v50 + 128);
        v52 = *(void **)(v50 + 112);
      }
      else
      {
        v51 = 0;
        v52 = 0;
      }
      v53 = objc_msgSend(v52, "identifier");
      *(_DWORD *)buf = 138543874;
      v65 = v51;
      v66 = 2112;
      v67 = v50;
      v68 = 2112;
      v69 = v53;
      v54 = "ProxySession <%{public}@> Failed to setup background NSURLSession for session %@ with identifier %@";
    }
    else
    {
      if (!v49)
        return;
      v55 = *(_QWORD *)(a1 + 32);
      if (v55)
      {
        v56 = *(_QWORD *)(v55 + 128);
        v57 = *(void **)(v55 + 112);
      }
      else
      {
        v56 = 0;
        v57 = 0;
      }
      v58 = objc_msgSend(v57, "identifier");
      *(_DWORD *)buf = 138543874;
      v65 = v56;
      v66 = 2112;
      v67 = v55;
      v68 = 2112;
      v69 = v58;
      v54 = "BackgroundSession <%{public}@> Failed to setup background NSURLSession for session %@ with identifier %@";
    }
    _os_log_error_impl(&dword_183ECA000, v48, OS_LOG_TYPE_ERROR, v54, buf, 0x20u);
    return;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 264) = a4;
  if (a3)
  {
    v21 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NDBackgroundSessionManagerKeySessionUUID"));
    if (v21)
    {
      v23 = (void *)v21;
      v24 = *(void **)(a1 + 32);
      if (v24)
        objc_setProperty_nonatomic_copy(v24, v22, v23, 128);
    }
    v25 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NDBackgroundSessionManagerRestoredStateKeyTLSSessionCachePrefix"));
    if (v25)
      objc_msgSend(*(id *)(a1 + 32), "set_tlsSessionCachePrefix:", v25);
    v26 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NDBackgroundSessionManagerRestoredStateKeyTasks"));
    v27 = *(_QWORD *)(a1 + 32);
    if (v27)
    {
      v28 = v26;
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __50____NSURLBackgroundSession_recreateExistingTasks___block_invoke;
      v63[3] = &unk_1E14F8550;
      v63[4] = v27;
      objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v63);
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v29 = *(void **)(v27 + 184);
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v59, buf, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v60 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
            if (!objc_msgSend(v28, "objectForKey:", v34))
              objc_msgSend(*(id *)(v27 + 192), "addObject:", v34);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v59, buf, 16);
        }
        while (v31);
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    p_superclass = (__objc2_class **)(&OBJC_METACLASS_____CFN_TransactionMetrics + 8);
  }
  else
  {
    v35 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count");
    v36 = *(id **)(a1 + 32);
    if (v35)
      objc_msgSend(v36[24], "addObjectsFromArray:", objc_msgSend(v36[23], "allKeys"));
    else
      objc_msgSend(v36[21], "setTLSSessionCachePrefix:", objc_msgSend(v36, "_tlsSessionCachePrefix"));
  }
  v37 = *(_QWORD *)(a1 + 32);
  if (v37)
    v38 = *(void **)(v37 + 112);
  else
    v38 = 0;
  v39 = objc_msgSend(v38, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v40 = p_superclass[435];
  v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
  if (v39)
  {
    if (!v41)
      return;
    v42 = *(_QWORD *)(a1 + 32);
    if (v42)
      v42 = *(_QWORD *)(v42 + 128);
    *(_DWORD *)buf = 138543362;
    v65 = v42;
    v43 = "ProxySession <%{public}@> background session setup complete";
  }
  else
  {
    if (!v41)
      return;
    v44 = *(_QWORD *)(a1 + 32);
    if (v44)
      v44 = *(_QWORD *)(v44 + 128);
    *(_DWORD *)buf = 138543362;
    v65 = v44;
    v43 = "BackgroundSession <%{public}@> background session setup complete";
  }
  _os_log_impl(&dword_183ECA000, v40, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);
}

void __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_59(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 112);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v7 = CFNLog::logger;
  v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (v9)
        v9 = *(_QWORD *)(v9 + 128);
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = a2;
      v10 = "ProxySession <%{public}@> An error occurred on the xpc connection requesting pending callbacks for the backg"
            "round session: %@";
LABEL_15:
      _os_log_error_impl(&dword_183ECA000, v7, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x16u);
    }
  }
  else if (v8)
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      v11 = *(_QWORD *)(v11 + 128);
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = a2;
    v10 = "BackgroundSession <%{public}@> An error occurred on the xpc connection requesting pending callbacks for the ba"
          "ckground session: %@";
    goto LABEL_15;
  }
}

void __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_60(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 112);
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v5 = CFNLog::logger;
  v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6)
      goto LABEL_15;
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v7 = *(_QWORD *)(v7 + 128);
    LODWORD(v12) = 138543362;
    *(_QWORD *)((char *)&v12 + 4) = v7;
    v8 = "ProxySession <%{public}@> Reconnection to existing session and state complete";
  }
  else
  {
    if (!v6)
      goto LABEL_15;
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v9 = *(_QWORD *)(v9 + 128);
    LODWORD(v12) = 138543362;
    *(_QWORD *)((char *)&v12 + 4) = v9;
    v8 = "BackgroundSession <%{public}@> Reconnection to existing session and state complete";
  }
  _os_log_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0xCu);
LABEL_15:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    v11 = *(NSObject **)(v10 + 120);
    *(_QWORD *)&v12 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v12 + 1) = 3221225472;
    v13 = __49____NSURLBackgroundSession_failDisconnectedTasks__block_invoke;
    v14 = &unk_1E14FE118;
    v15 = v10;
    dispatch_async(v11, &v12);
  }
}

void __65____NSURLBackgroundSession__onqueue_retryDataTaskWithIdentifier___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(void **)(v3 + 112);
    else
      v4 = 0;
    v5 = objc_msgSend(v4, "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v6 = CFNLog::logger;
    v7 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v7)
      {
        v8 = *(_QWORD *)(a1 + 32);
        if (v8)
          v8 = *(_QWORD *)(v8 + 128);
        v9 = *(_QWORD *)(a1 + 40);
        v13 = 138543618;
        v14 = v8;
        v15 = 2048;
        v16 = v9;
        v10 = "ProxySession <%{public}@> failed to retry background data task with identifier %lu";
LABEL_16:
        _os_log_error_impl(&dword_183ECA000, v6, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 0x16u);
      }
    }
    else if (v7)
    {
      v11 = *(_QWORD *)(a1 + 32);
      if (v11)
        v11 = *(_QWORD *)(v11 + 128);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v11;
      v15 = 2048;
      v16 = v12;
      v10 = "BackgroundSession <%{public}@> failed to retry background data task with identifier %lu";
      goto LABEL_16;
    }
  }
}

void __46____NSURLBackgroundSession_setupXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(NSObject **)(v1 + 120);
  else
    v2 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_2;
  block[3] = &unk_1E14FE118;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_2_18(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 112);
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v5 = CFNLog::logger;
  v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6)
      return;
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v7 = *(_QWORD *)(v7 + 128);
    v10 = 138543362;
    v11 = v7;
    v8 = "ProxySession <%{public}@> connection to background transfer daemon invalidated";
  }
  else
  {
    if (!v6)
      return;
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v9 = *(_QWORD *)(v9 + 128);
    v10 = 138543362;
    v11 = v9;
    v8 = "BackgroundSession <%{public}@> connection to background transfer daemon invalidated";
  }
  _os_log_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
}

void __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 112);
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v5 = CFNLog::logger;
  v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6)
      goto LABEL_15;
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v7 = *(_QWORD *)(v7 + 128);
    *(_DWORD *)buf = 138543362;
    v20 = v7;
    v8 = "ProxySession <%{public}@> connection to background transfer daemon interrupted";
  }
  else
  {
    if (!v6)
      goto LABEL_15;
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v9 = *(_QWORD *)(v9 + 128);
    *(_DWORD *)buf = 138543362;
    v20 = v9;
    v8 = "BackgroundSession <%{public}@> connection to background transfer daemon interrupted";
  }
  _os_log_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
LABEL_15:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "invalidate");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    v11 = *(void **)(v10 + 112);
  else
    v11 = 0;
  v12 = objc_msgSend(v11, "_isProxySession");
  v13 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    -[__NSURLBackgroundSession setupXPCConnection](v13);
    -[__NSURLBackgroundSession setupBackgroundSession](*(_QWORD *)(a1 + 32));
    v14 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v14 + 216))
      -[__NSURLBackgroundSession sendInvalidationRequest](v14);
  }
  else
  {
    *(_BYTE *)(v13 + 280) = 1;
    v15 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v15 + 281))
    {
      *(_BYTE *)(v15 + 281) = 0;
      v16 = *(_QWORD *)(a1 + 32);
      if (v16)
        v17 = *(NSObject **)(v16 + 120);
      else
        v17 = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_16;
      block[3] = &unk_1E14FE118;
      block[4] = v16;
      dispatch_async(v17, block);
    }
  }
}

uint64_t __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_16(uint64_t a1)
{
  return -[__NSURLBackgroundSession ensureRemoteSession](*(_QWORD *)(a1 + 32));
}

void __68____NSURLBackgroundSession_backgroundSessionDidFinishAppWake_reply___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  BOOL v41;
  char v42;
  int v43;
  NSObject *v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  _QWORD v70[2];
  uint64_t (*v71)(_QWORD *, int);
  void *v72;
  __int128 v73;
  uint64_t v74;
  uint8_t buf[4];
  _BYTE v76[18];
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)a1[4], "appWakeUUID")
    || !objc_msgSend((id)a1[5], "isEqualToString:", objc_msgSend((id)a1[4], "appWakeUUID")))
  {
    v14 = a1[4];
    if (v14)
      v15 = *(void **)(v14 + 112);
    else
      v15 = 0;
    v16 = objc_msgSend(v15, "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v17 = CFNLog::logger;
    v18 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v18)
      {
        v19 = (_QWORD *)a1[4];
        if (v19)
          v20 = v19[16];
        else
          v20 = 0;
        v21 = objc_msgSend(v19, "appWakeUUID");
        v22 = a1[4];
        v23 = a1[5];
        if (v22)
          v24 = *(void **)(v22 + 112);
        else
          v24 = 0;
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)v76 = v20;
        *(_WORD *)&v76[8] = 2112;
        *(_QWORD *)&v76[10] = v21;
        v77 = 2112;
        v78 = v23;
        v79 = 2112;
        v80 = v22;
        v81 = 2112;
        v82 = objc_msgSend(v24, "identifier");
        v25 = "ProxySession <%{public}@> appWakeUUID %@ does not match uuid %@ for session %@ with identifier %@";
LABEL_74:
        _os_log_debug_impl(&dword_183ECA000, v17, OS_LOG_TYPE_DEBUG, v25, buf, 0x34u);
      }
    }
    else if (v18)
    {
      v64 = (_QWORD *)a1[4];
      if (v64)
        v65 = v64[16];
      else
        v65 = 0;
      v66 = objc_msgSend(v64, "appWakeUUID");
      v67 = a1[4];
      v68 = a1[5];
      if (v67)
        v69 = *(void **)(v67 + 112);
      else
        v69 = 0;
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)v76 = v65;
      *(_WORD *)&v76[8] = 2112;
      *(_QWORD *)&v76[10] = v66;
      v77 = 2112;
      v78 = v68;
      v79 = 2112;
      v80 = v67;
      v81 = 2112;
      v82 = objc_msgSend(v69, "identifier");
      v25 = "BackgroundSession <%{public}@> appWakeUUID %@ does not match uuid %@ for session %@ with identifier %@";
      goto LABEL_74;
    }
    (*(void (**)(void))(a1[6] + 16))();
    return;
  }
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v71 = __68____NSURLBackgroundSession_backgroundSessionDidFinishAppWake_reply___block_invoke_2;
  v72 = &unk_1E14F89D8;
  v73 = *((_OWORD *)a1 + 2);
  v74 = a1[6];
  v2 = objc_msgSend(*(id *)(v73 + 200), "count");
  v3 = a1[4];
  if (v3)
    v4 = *(void **)(v3 + 112);
  else
    v4 = 0;
  v5 = objc_msgSend(v4, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v6 = CFNLog::logger;
  v7 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (v5)
    {
      if (v7)
      {
        v26 = a1[4];
        if (v26)
        {
          v27 = *(_QWORD *)(v26 + 128);
          v28 = *(void **)(v26 + 112);
        }
        else
        {
          v27 = 0;
          v28 = 0;
        }
        v29 = a1[5];
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)v76 = v27;
        *(_WORD *)&v76[8] = 2112;
        *(_QWORD *)&v76[10] = v29;
        v77 = 2112;
        v78 = v26;
        v79 = 2112;
        v80 = objc_msgSend(v28, "identifier");
        v30 = "ProxySession <%{public}@> no outstanding tasks getting auth headers, finishing wake up for uuid %@ for ses"
              "sion %@ with identifier %@";
LABEL_67:
        _os_log_impl(&dword_183ECA000, v6, OS_LOG_TYPE_DEFAULT, v30, buf, 0x2Au);
      }
    }
    else if (v7)
    {
      v60 = a1[4];
      if (v60)
      {
        v61 = *(_QWORD *)(v60 + 128);
        v62 = *(void **)(v60 + 112);
      }
      else
      {
        v61 = 0;
        v62 = 0;
      }
      v63 = a1[5];
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)v76 = v61;
      *(_WORD *)&v76[8] = 2112;
      *(_QWORD *)&v76[10] = v63;
      v77 = 2112;
      v78 = v60;
      v79 = 2112;
      v80 = objc_msgSend(v62, "identifier");
      v30 = "BackgroundSession <%{public}@> no outstanding tasks getting auth headers, finishing wake up for uuid %@ for "
            "session %@ with identifier %@";
      goto LABEL_67;
    }
    v71(v70, 1);
    return;
  }
  if (v5)
  {
    if (v7)
    {
      v8 = a1[4];
      if (v8)
      {
        v9 = *(_QWORD *)(v8 + 128);
        v10 = *(void **)(v8 + 112);
      }
      else
      {
        v9 = 0;
        v10 = 0;
      }
      v11 = objc_msgSend(v10, "identifier");
      v12 = *(_QWORD *)(a1[4] + 200);
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)v76 = v9;
      *(_WORD *)&v76[8] = 2112;
      *(_QWORD *)&v76[10] = v8;
      v77 = 2112;
      v78 = v11;
      v79 = 2112;
      v80 = v12;
      v13 = "ProxySession <%{public}@> Have outstanding tasks getting auth headers for session %@ with identifier %@ outs"
            "tanding auth tasks %@";
LABEL_36:
      _os_log_impl(&dword_183ECA000, v6, OS_LOG_TYPE_DEFAULT, v13, buf, 0x2Au);
    }
  }
  else if (v7)
  {
    v31 = a1[4];
    if (v31)
    {
      v32 = *(_QWORD *)(v31 + 128);
      v33 = *(void **)(v31 + 112);
    }
    else
    {
      v32 = 0;
      v33 = 0;
    }
    v34 = objc_msgSend(v33, "identifier");
    v35 = *(_QWORD *)(a1[4] + 200);
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)v76 = v32;
    *(_WORD *)&v76[8] = 2112;
    *(_QWORD *)&v76[10] = v31;
    v77 = 2112;
    v78 = v34;
    v79 = 2112;
    v80 = v35;
    v13 = "BackgroundSession <%{public}@> Have outstanding tasks getting auth headers for session %@ with identifier %@ o"
          "utstanding auth tasks %@";
    goto LABEL_36;
  }
  v36 = a1[4];
  v37 = *(_QWORD *)(v36 + 224);
  if (!v37
    || ((v39 = *(_QWORD *)(v37 + 8), v38 = *(_QWORD *)(v37 + 16), v41 = v38 == 0, v40 = v38 & 1 | v39, !v41)
      ? (v41 = v40 == 0)
      : (v41 = 1),
        v41 ? (v42 = 0) : (v42 = 1),
        (uint64_t (*)())v39 == BlockHolderVar<BOOL>::invoke_reseted && (v42 & 1) == 0))
  {
    v43 = objc_msgSend(*(id *)(v36 + 112), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v44 = CFNLog::logger;
    v45 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v43)
    {
      if (!v45)
        goto LABEL_58;
      v46 = a1[4];
      if (v46)
      {
        v47 = *(_QWORD *)(v46 + 128);
        v48 = *(void **)(v46 + 112);
      }
      else
      {
        v47 = 0;
        v48 = 0;
      }
      v49 = a1[5];
      v50 = objc_msgSend(v48, "identifier");
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)v76 = v47;
      *(_WORD *)&v76[8] = 2112;
      *(_QWORD *)&v76[10] = v49;
      v77 = 2112;
      v78 = v46;
      v79 = 2112;
      v80 = v50;
      v51 = "ProxySession <%{public}@> Storing work to do when ready to wake app for uuid %@ for session %@ with identifier %@";
    }
    else
    {
      if (!v45)
        goto LABEL_58;
      v52 = a1[4];
      if (v52)
      {
        v53 = *(_QWORD *)(v52 + 128);
        v54 = *(void **)(v52 + 112);
      }
      else
      {
        v53 = 0;
        v54 = 0;
      }
      v55 = a1[5];
      v56 = objc_msgSend(v54, "identifier");
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)v76 = v53;
      *(_WORD *)&v76[8] = 2112;
      *(_QWORD *)&v76[10] = v55;
      v77 = 2112;
      v78 = v52;
      v79 = 2112;
      v80 = v56;
      v51 = "BackgroundSession <%{public}@> Storing work to do when ready to wake app for uuid %@ for session %@ with identifier %@";
    }
    _os_log_impl(&dword_183ECA000, v44, OS_LOG_TYPE_DEFAULT, v51, buf, 0x2Au);
LABEL_58:
    SmartBlockWithArgs<BOOL>::SmartBlockWithArgs((uint64_t *)buf, v70);
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](a1[4] + 224, (__int128 *)buf);
    v57 = *(std::__shared_weak_count **)&v76[4];
    if (*(_QWORD *)&v76[4])
    {
      v58 = (unint64_t *)(*(_QWORD *)&v76[4] + 8);
      do
        v59 = __ldaxr(v58);
      while (__stlxr(v59 - 1, v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }
  }
}

uint64_t __68____NSURLBackgroundSession_backgroundSessionDidFinishAppWake_reply___block_invoke_2(_QWORD *a1, int a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[24];
  uint64_t v40;
  _BYTE v41[20];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  if (v4)
    v5 = *(void **)(v4 + 112);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v7 = CFNLog::logger;
  v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_15;
    v9 = a1[4];
    if (v9)
    {
      v10 = *(_QWORD *)(v9 + 128);
      v11 = *(void **)(v9 + 112);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    v12 = a1[5];
    *(_DWORD *)v39 = 138544386;
    *(_QWORD *)&v39[4] = v10;
    *(_WORD *)&v39[12] = 2112;
    *(_QWORD *)&v39[14] = v12;
    *(_WORD *)&v39[22] = 2112;
    v40 = v9;
    *(_WORD *)v41 = 2112;
    *(_QWORD *)&v41[2] = objc_msgSend(v11, "identifier");
    *(_WORD *)&v41[10] = 1024;
    *(_DWORD *)&v41[12] = a2;
    v13 = "ProxySession <%{public}@> Ready to wake app for uuid %@ for session %@ with identifier %@ invoked=%d";
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    v14 = a1[4];
    if (v14)
    {
      v15 = *(_QWORD *)(v14 + 128);
      v16 = *(void **)(v14 + 112);
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
    v17 = a1[5];
    *(_DWORD *)v39 = 138544386;
    *(_QWORD *)&v39[4] = v15;
    *(_WORD *)&v39[12] = 2112;
    *(_QWORD *)&v39[14] = v17;
    *(_WORD *)&v39[22] = 2112;
    v40 = v14;
    *(_WORD *)v41 = 2112;
    *(_QWORD *)&v41[2] = objc_msgSend(v16, "identifier");
    *(_WORD *)&v41[10] = 1024;
    *(_DWORD *)&v41[12] = a2;
    v13 = "BackgroundSession <%{public}@> Ready to wake app for uuid %@ for session %@ with identifier %@ invoked=%d";
  }
  _os_log_impl(&dword_183ECA000, v7, OS_LOG_TYPE_DEFAULT, v13, v39, 0x30u);
LABEL_15:
  v18 = (_QWORD *)a1[4];
  if (!a2)
  {
    if (v18)
      v18 = (_QWORD *)v18[14];
    v22 = objc_msgSend(v18, "_isProxySession", *(_OWORD *)v39, *(_QWORD *)&v39[16], v40, *(_OWORD *)v41);
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v23 = CFNLog::logger;
    v24 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (!v24)
        return (*(uint64_t (**)(void))(a1[6] + 16))();
      v25 = a1[4];
      if (v25)
      {
        v26 = *(_QWORD *)(v25 + 128);
        v27 = *(void **)(v25 + 112);
      }
      else
      {
        v26 = 0;
        v27 = 0;
      }
      v28 = a1[5];
      v29 = objc_msgSend(v27, "identifier");
      v30 = *(_QWORD *)(a1[4] + 200);
      *(_DWORD *)v39 = 138544386;
      *(_QWORD *)&v39[4] = v26;
      *(_WORD *)&v39[12] = 2112;
      *(_QWORD *)&v39[14] = v28;
      *(_WORD *)&v39[22] = 2112;
      v40 = v25;
      *(_WORD *)v41 = 2112;
      *(_QWORD *)&v41[2] = v29;
      *(_WORD *)&v41[10] = 2112;
      *(_QWORD *)&v41[12] = v30;
      v31 = "ProxySession <%{public}@> backgroundSessionDidFinishAppWake block not invoked for UUID %@ for session %@ wit"
            "h identifier %@ outstanding auth tasks %@";
    }
    else
    {
      if (!v24)
        return (*(uint64_t (**)(void))(a1[6] + 16))();
      v33 = a1[4];
      if (v33)
      {
        v34 = *(_QWORD *)(v33 + 128);
        v35 = *(void **)(v33 + 112);
      }
      else
      {
        v34 = 0;
        v35 = 0;
      }
      v36 = a1[5];
      v37 = objc_msgSend(v35, "identifier");
      v38 = *(_QWORD *)(a1[4] + 200);
      *(_DWORD *)v39 = 138544386;
      *(_QWORD *)&v39[4] = v34;
      *(_WORD *)&v39[12] = 2112;
      *(_QWORD *)&v39[14] = v36;
      *(_WORD *)&v39[22] = 2112;
      v40 = v33;
      *(_WORD *)v41 = 2112;
      *(_QWORD *)&v41[2] = v37;
      *(_WORD *)&v41[10] = 2112;
      *(_QWORD *)&v41[12] = v38;
      v31 = "BackgroundSession <%{public}@> backgroundSessionDidFinishAppWake block not invoked for UUID %@ for session %"
            "@ with identifier %@ outstanding auth tasks %@";
    }
    _os_log_error_impl(&dword_183ECA000, v23, OS_LOG_TYPE_ERROR, v31, v39, 0x34u);
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  objc_msgSend(v18, "setAppWakeUUID:", 0);
  v20 = a1[4];
  if (v20)
    v21 = *(_QWORD *)(v20 + 72);
  else
    v21 = 0;
  -[__NSCFURLSessionDelegateWrapper didFinishEventsForBackgroundURLSession](v21, v19);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __67____NSURLBackgroundSession_backgroundSessionDidStartAppWake_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "appWakeUUID"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      v3 = *(void **)(v2 + 112);
    else
      v3 = 0;
    v4 = objc_msgSend(v3, "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v5 = CFNLog::logger;
    v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6)
      {
        v10 = *(_QWORD **)(a1 + 32);
        if (v10)
          v11 = v10[16];
        else
          v11 = 0;
        v12 = *(_QWORD *)(a1 + 40);
        v18 = 138543874;
        v19 = v11;
        v20 = 2112;
        v21 = v12;
        v22 = 2112;
        v23 = objc_msgSend(v10, "appWakeUUID");
        v13 = "ProxySession <%{public}@> backgroundSessionDidStartAppWake: called with ID: %@, when we already had an app"
              " wake with ID: %@";
LABEL_17:
        _os_log_debug_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v18, 0x20u);
      }
    }
    else if (v6)
    {
      v15 = *(_QWORD **)(a1 + 32);
      if (v15)
        v16 = v15[16];
      else
        v16 = 0;
      v17 = *(_QWORD *)(a1 + 40);
      v18 = 138543874;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      v22 = 2112;
      v23 = objc_msgSend(v15, "appWakeUUID");
      v13 = "BackgroundSession <%{public}@> backgroundSessionDidStartAppWake: called with ID: %@, when we already had an "
            "app wake with ID: %@";
      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setAppWakeUUID:", *(_QWORD *)(a1 + 40));
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v7, v8, v9);
}

uint64_t __105____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didFinishDownloadForMediaSelectionPropertyList___block_invoke(uint64_t a1)
{
  return objc_msgSend(-[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 48)), "_onqueue_didFinishDownloadforMediaSelectionPropertyList:", *(_QWORD *)(a1 + 40));
}

uint64_t __85____NSURLBackgroundSession_backgroundAVAssetDownloadTask_willDownloadVariants_reply___block_invoke(uint64_t a1)
{
  objc_msgSend(-[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 56)), "_onqueue_willDownloadVariants:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __76____NSURLBackgroundSession_backgroundAVAssetDownloadTask_willDownloadToURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(-[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 48)), "_onqueue_willDownloadToURL:", *(_QWORD *)(a1 + 40));
}

uint64_t __100____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didResolveMediaSelectionProperyList_reply___block_invoke(uint64_t a1)
{
  objc_msgSend(-[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 56)), "_onqueue_didResolveMediaSelectionPropertyList:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __151____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList___block_invoke(uint64_t a1)
{
  return objc_msgSend(-[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 72)), "_onqueue_didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __82____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didReceiveDownloadToken___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[8];

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setAVAssetDownloadToken:", *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 32);
      if (v3)
      {
        v4 = *(_QWORD *)(a1 + 48);
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __69__NSURLSession_delegate_AVAssetDownloadTask_didReceiveDownloadToken___block_invoke;
        v6[3] = &unk_1E14FBE88;
        v5 = *(NSObject **)(v3 + 88);
        v6[4] = *(_QWORD *)(v3 + 96);
        v6[5] = v3;
        v6[6] = v2;
        v6[7] = v4;
        if (v5)
          dispatch_async(v5, v6);
        else
          objc_msgSend(*(id *)(v3 + 80), "addOperationWithBlock:", v6);
      }
    }
  }
}

uint64_t __119____NSURLBackgroundSession_backgroundAVAssetDownloadTaskDidUpdateProgress_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  return objc_msgSend(-[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 40)), "_onqueue_didReceiveProgressUpdateWithTotalBytesWritten:totalBytesExpectedToWrite:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __88____NSURLBackgroundSession_backgroundDownloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke(uint64_t a1)
{
  id *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "setCountOfBytesReceived:", v4);
    objc_msgSend(v3, "setCountOfBytesExpectedToReceive:", v5);
    v6 = (uint64_t)v3[88];
    if (!v6)
      v6 = (uint64_t)v3[87];
    -[__NSCFURLSessionDelegateWrapper downloadTask:didResumeAtOffset:expectedTotalBytes:](v6, v3, v4, v5);
  }
}

void __108____NSURLBackgroundSession_backgroundDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  id *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v2, "setCountOfBytesReceived:", v5);
    objc_msgSend(v3, "setCountOfBytesExpectedToReceive:", v6);
    v7 = (uint64_t)v3[88];
    if (!v7)
      v7 = (uint64_t)v3[87];
    -[__NSCFURLSessionDelegateWrapper downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:completionHandler:](v7, v3, v4, v5, v6, &__block_literal_global_6836);
  }
}

uint64_t __92____NSURLBackgroundSession_backgroundDownloadTask_didFinishDownloadingToURL_response_reply___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int *v14;
  char *v15;
  const char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int *v22;
  char *v23;
  _BYTE v24[24];
  __int128 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 64));
  objc_msgSend(v2, "setResponse:", *(_QWORD *)(a1 + 40));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v2)
    {
      v3 = *(void **)(a1 + 48);
      v4 = (uint64_t)v2[88];
      if (!v4)
        v4 = (uint64_t)v2[87];
      *(_QWORD *)v24 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v24[8] = 3221225472;
      *(_QWORD *)&v24[16] = __67____NSCFBackgroundDownloadTask__onqueue_didFinishDownloadingToURL___block_invoke;
      *(_QWORD *)&v25 = &unk_1E14FDE88;
      *((_QWORD *)&v25 + 1) = v2;
      v26 = v3;
      -[__NSCFURLSessionDelegateWrapper downloadTask:didFinishDownloadingToURL:completionHandler:](v4, v2, v3, v24);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "_onqueue_didFinishDownloadingToURL:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[__NSCFBackgroundDataTask _onqueue_didReceiveData:withCompletion:](v2, (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", objc_msgSend(*(id *)(a1 + 48), "path")), &__block_literal_global_188);
        if (unlink((const char *)objc_msgSend(*(id *)(a1 + 48), "fileSystemRepresentation")))
        {
          v5 = *(_QWORD *)(a1 + 32);
          if (v5)
            v6 = *(void **)(v5 + 112);
          else
            v6 = 0;
          v7 = objc_msgSend(v6, "_isProxySession");
          if (CFNLog::onceToken != -1)
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
          v8 = CFNLog::logger;
          v9 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
          if (v7)
          {
            if (!v9)
              return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
            v10 = *(_QWORD *)(a1 + 32);
            if (v10)
              v11 = *(_QWORD *)(v10 + 128);
            else
              v11 = 0;
            v12 = objc_msgSend(*(id *)(a1 + 48), "fileSystemRepresentation");
            v13 = *__error();
            v14 = __error();
            v15 = strerror(*v14);
            *(_DWORD *)v24 = 138544130;
            *(_QWORD *)&v24[4] = v11;
            *(_WORD *)&v24[12] = 2080;
            *(_QWORD *)&v24[14] = v12;
            *(_WORD *)&v24[22] = 1024;
            LODWORD(v25) = v13;
            WORD2(v25) = 2080;
            *(_QWORD *)((char *)&v25 + 6) = v15;
            v16 = "ProxySession <%{public}@> FAILED to UNLINK download file: %s, errno:%d, desc: %s";
          }
          else
          {
            if (!v9)
              return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
            v18 = *(_QWORD *)(a1 + 32);
            if (v18)
              v19 = *(_QWORD *)(v18 + 128);
            else
              v19 = 0;
            v20 = objc_msgSend(*(id *)(a1 + 48), "fileSystemRepresentation");
            v21 = *__error();
            v22 = __error();
            v23 = strerror(*v22);
            *(_DWORD *)v24 = 138544130;
            *(_QWORD *)&v24[4] = v19;
            *(_WORD *)&v24[12] = 2080;
            *(_QWORD *)&v24[14] = v20;
            *(_WORD *)&v24[22] = 1024;
            LODWORD(v25) = v21;
            WORD2(v25) = 2080;
            *(_QWORD *)((char *)&v25 + 6) = v23;
            v16 = "BackgroundSession <%{public}@> FAILED to UNLINK download file: %s, errno:%d, desc: %s";
          }
          _os_log_error_impl(&dword_183ECA000, v8, OS_LOG_TYPE_ERROR, v16, v24, 0x26u);
        }
      }
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __85____NSURLBackgroundSession_willRetryBackgroundDataTask_withError_transactionMetrics___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 56));
  objc_msgSend(v2, "set_backgroundTransactionMetrics:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "_logUnlistedTracker:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    -[__NSCFBackgroundDataTask _onqueue_finishStream:]((uint64_t)v2, 1u);
    v3 = (uint64_t)v2[88];
    if (!v3)
      v3 = (uint64_t)v2[87];
  }
  else
  {
    v3 = 0;
  }
  -[__NSCFURLSessionDelegateWrapper _willRetryBackgroundDataTask:withError:](v3, v2, *(void **)(a1 + 48));
}

void __68____NSURLBackgroundSession_backgroundDataTaskDidBecomeDownloadTask___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  __NSCFBackgroundDownloadTask *v4;
  uint64_t v5;

  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = -[__NSCFBackgroundSessionTask initWithBackgroundTask:]([__NSCFBackgroundDownloadTask alloc], "initWithBackgroundTask:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setObject:forKeyedSubscript:", v4, v2);
  if (v3)
  {
    v5 = (uint64_t)v3[88];
    if (!v5)
      v5 = (uint64_t)v3[87];
  }
  else
  {
    v5 = 0;
  }
  -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeDownloadTask:completionHandler:](v5, v3, v4, &__block_literal_global_187);
}

uint64_t __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 56));
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "addObject:", v3);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 112);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v7 = CFNLog::logger;
  v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (v9)
      {
        v10 = *(_QWORD *)(v9 + 128);
        v11 = *(void **)(v9 + 112);
      }
      else
      {
        v10 = 0;
        v11 = 0;
      }
      v12 = objc_msgSend(v11, "identifier");
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
      *(_DWORD *)buf = 138544386;
      v23 = v10;
      v24 = 2114;
      v25 = v2;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v12;
      v30 = 2112;
      v31 = v13;
      v14 = "ProxySession <%{public}@> %{public}@ getting auth headers for session %@ with identifier %@ outstanding auth tasks %@";
LABEL_14:
      _os_log_impl(&dword_183ECA000, v7, OS_LOG_TYPE_DEFAULT, v14, buf, 0x34u);
    }
  }
  else if (v8)
  {
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
    {
      v16 = *(_QWORD *)(v15 + 128);
      v17 = *(void **)(v15 + 112);
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
    v18 = objc_msgSend(v17, "identifier");
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
    *(_DWORD *)buf = 138544386;
    v23 = v16;
    v24 = 2114;
    v25 = v2;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    v14 = "BackgroundSession <%{public}@> %{public}@ getting auth headers for session %@ with identifier %@ outstanding auth tasks %@";
    goto LABEL_14;
  }
  v20 = (void *)objc_msgSend(v2, "authenticator");
  return objc_msgSend(v20, "getAuthenticationHeadersForTask:task:response:completionHandler:", MEMORY[0x1E0C809B0], 3221225472, __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke_185, &unk_1E14F8948, *(_QWORD *)(a1 + 32), v2, v3, *(_QWORD *)(a1 + 48));
}

void __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke_185(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  NSObject *isa;
  __int128 v5;
  _QWORD block[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  isa = *(NSObject **)(a1 + 32);
  if (isa)
    isa = isa[15].isa;
  block[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke_2;
  block[3] = &unk_1E14F8920;
  v11 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v5;
  dispatch_async(isa, block);
}

void __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  BOOL v34;
  _BOOL4 v35;
  int v37;
  NSObject *v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(_QWORD *, uint64_t);
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  _BYTE v59[24];
  uint64_t v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 112);
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v5 = CFNLog::logger;
  v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6)
      goto LABEL_15;
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v10 = *(_QWORD *)(v9 + 128);
      v11 = *(void **)(v9 + 112);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v59 = 138544130;
    *(_QWORD *)&v59[4] = v10;
    *(_WORD *)&v59[12] = 2114;
    *(_QWORD *)&v59[14] = v12;
    *(_WORD *)&v59[22] = 2112;
    v60 = v9;
    LOWORD(v61) = 2112;
    *(_QWORD *)((char *)&v61 + 2) = objc_msgSend(v11, "identifier");
    v13 = "ProxySession <%{public}@> %{public}@ finished getting auth headers for session %@ with identifier %@";
  }
  else
  {
    if (!v6)
      goto LABEL_15;
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
    {
      v15 = *(_QWORD *)(v14 + 128);
      v16 = *(void **)(v14 + 112);
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v59 = 138544130;
    *(_QWORD *)&v59[4] = v15;
    *(_WORD *)&v59[12] = 2114;
    *(_QWORD *)&v59[14] = v17;
    *(_WORD *)&v59[22] = 2112;
    v60 = v14;
    LOWORD(v61) = 2112;
    *(_QWORD *)((char *)&v61 + 2) = objc_msgSend(v16, "identifier");
    v13 = "BackgroundSession <%{public}@> %{public}@ finished getting auth headers for session %@ with identifier %@";
  }
  _os_log_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEFAULT, v13, v59, 0x2Au);
LABEL_15:
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v7, v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "removeObject:", *(_QWORD *)(a1 + 64));
  v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "count");
  v19 = *(_QWORD *)(a1 + 32);
  if (!v18)
  {
    v30 = *(_QWORD *)(v19 + 224);
    if (!v30)
      return;
    v32 = *(_QWORD *)(v30 + 8);
    v31 = *(_QWORD *)(v30 + 16);
    v34 = v31 == 0;
    v33 = v31 & 1 | v32;
    v34 = v34 || v33 == 0;
    v35 = !v34;
    if ((uint64_t (*)())v32 == BlockHolderVar<BOOL>::invoke_reseted && !v35)
      return;
    v37 = objc_msgSend(*(id *)(v19 + 112), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v38 = CFNLog::logger;
    v39 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      if (!v39)
        goto LABEL_54;
      v40 = *(_QWORD *)(a1 + 32);
      if (v40)
      {
        v41 = *(_QWORD *)(v40 + 128);
        v42 = *(void **)(v40 + 112);
      }
      else
      {
        v41 = 0;
        v42 = 0;
      }
      v43 = objc_msgSend(v42, "identifier", *(_QWORD *)v59, *(_OWORD *)&v59[8], v60, v61);
      *(_DWORD *)v59 = 138543874;
      *(_QWORD *)&v59[4] = v41;
      *(_WORD *)&v59[12] = 2112;
      *(_QWORD *)&v59[14] = v40;
      *(_WORD *)&v59[22] = 2112;
      v60 = v43;
      v44 = "ProxySession <%{public}@> All tasks completed getting auth headers, sending did finish app wake for session "
            "%@ with identifier %@";
    }
    else
    {
      if (!v39)
        goto LABEL_54;
      v50 = *(_QWORD *)(a1 + 32);
      if (v50)
      {
        v51 = *(_QWORD *)(v50 + 128);
        v52 = *(void **)(v50 + 112);
      }
      else
      {
        v51 = 0;
        v52 = 0;
      }
      v53 = objc_msgSend(v52, "identifier", *(_QWORD *)v59, *(_OWORD *)&v59[8], v60, v61);
      *(_DWORD *)v59 = 138543874;
      *(_QWORD *)&v59[4] = v51;
      *(_WORD *)&v59[12] = 2112;
      *(_QWORD *)&v59[14] = v50;
      *(_WORD *)&v59[22] = 2112;
      v60 = v53;
      v44 = "BackgroundSession <%{public}@> All tasks completed getting auth headers, sending did finish app wake for ses"
            "sion %@ with identifier %@";
    }
    _os_log_impl(&dword_183ECA000, v38, OS_LOG_TYPE_DEFAULT, v44, v59, 0x20u);
LABEL_54:
    v54 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
    if (v54)
    {
      v55 = *(void (**)(_QWORD *, uint64_t))(v54 + 8);
      v56 = *(_QWORD *)(v54 + 16);
      v57 = (_QWORD *)(v54 + (v56 >> 1));
      if ((v56 & 1) != 0)
        v55 = *(void (**)(_QWORD *, uint64_t))(*v57 + v55);
      v55(v57, 1);
      v58 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
      if (v58)
      {
        *(_QWORD *)(v58 + 8) = BlockHolderVar<BOOL>::invoke_reseted;
        *(_QWORD *)(v58 + 16) = 0;
      }
    }
    return;
  }
  if (v19)
    v20 = *(void **)(v19 + 112);
  else
    v20 = 0;
  v21 = objc_msgSend(v20, "_isProxySession", *(_OWORD *)v59, *(_QWORD *)&v59[16], v60, v61);
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v22 = CFNLog::logger;
  v23 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (!v23)
      return;
    v24 = *(_QWORD *)(a1 + 32);
    if (v24)
    {
      v25 = *(_QWORD *)(v24 + 128);
      v26 = *(void **)(v24 + 112);
    }
    else
    {
      v25 = 0;
      v26 = 0;
    }
    v27 = objc_msgSend(v26, "identifier");
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
    *(_DWORD *)v59 = 138544130;
    *(_QWORD *)&v59[4] = v25;
    *(_WORD *)&v59[12] = 2112;
    *(_QWORD *)&v59[14] = v24;
    *(_WORD *)&v59[22] = 2112;
    v60 = v27;
    LOWORD(v61) = 2112;
    *(_QWORD *)((char *)&v61 + 2) = v28;
    v29 = "ProxySession <%{public}@> Have outstanding tasks getting auth headers for session %@ with identifier %@ outsta"
          "nding auth tasks %@";
  }
  else
  {
    if (!v23)
      return;
    v45 = *(_QWORD *)(a1 + 32);
    if (v45)
    {
      v46 = *(_QWORD *)(v45 + 128);
      v47 = *(void **)(v45 + 112);
    }
    else
    {
      v46 = 0;
      v47 = 0;
    }
    v48 = objc_msgSend(v47, "identifier");
    v49 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
    *(_DWORD *)v59 = 138544130;
    *(_QWORD *)&v59[4] = v46;
    *(_WORD *)&v59[12] = 2112;
    *(_QWORD *)&v59[14] = v45;
    *(_WORD *)&v59[22] = 2112;
    v60 = v48;
    LOWORD(v61) = 2112;
    *(_QWORD *)((char *)&v61 + 2) = v49;
    v29 = "BackgroundSession <%{public}@> Have outstanding tasks getting auth headers for session %@ with identifier %@ o"
          "utstanding auth tasks %@";
  }
  _os_log_impl(&dword_183ECA000, v22, OS_LOG_TYPE_DEFAULT, v29, v59, 0x2Au);
}

void __72____NSURLBackgroundSession_backgroundDataTask_didReceiveData_withReply___block_invoke(uint64_t a1)
{
  id *v2;

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 56));
  -[__NSCFBackgroundDataTask _onqueue_didReceiveData:withCompletion:](v2, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __71____NSURLBackgroundSession_backgroundTask_needNewBodyStream_withReply___block_invoke(uint64_t a1)
{
  id *v2;

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 48));
  if (v2)
    -[__NSCFBackgroundDataTask _onqueue_needNewBodyStream:withCompletion:](v2, *(_BYTE *)(a1 + 56), *(_QWORD *)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __99____NSURLBackgroundSession_backgroundTask_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke(uint64_t a1)
{
  id *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v2, "setCountOfBytesSent:", v5);
    objc_msgSend(v3, "setCountOfBytesExpectedToSend:", v6);
    v7 = (uint64_t)v3[88];
    if (!v7)
      v7 = (uint64_t)v3[87];
    -[__NSCFURLSessionDelegateWrapper task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:](v7, v3, v4, v5, v6);
  }
}

void __87____NSURLBackgroundSession_backgroundTask_didReceiveResponse_transactionMetrics_reply___block_invoke(uint64_t a1)
{
  id *v2;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 64));
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "set_backgroundTransactionMetrics:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "_logUnlistedTracker:", *(_QWORD *)(a1 + 40));
    v4 = *(void **)(a1 + 48);
    v5 = *(void **)(a1 + 56);
    objc_msgSend(v3, "_onqueue_didReceiveResponse:", v4);
    v6 = (uint64_t)v3[88];
    if (!v6)
      v6 = (uint64_t)v3[87];
    -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveResponse:completionHandler:](v6, v3, v4, v5);
    -[__NSURLBackgroundSession setCookiesFromResponse:forCurrentRequest:partitionIdentifier:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(v3, "response"), (void *)objc_msgSend(v3, "currentRequest"), (const void *)objc_msgSend(v3, "_storagePartitionIdentifier"));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __81____NSURLBackgroundSession_backgroundTask_didReceiveResponse_transactionMetrics___block_invoke(uint64_t a1)
{
  id *v2;

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 56));
  objc_msgSend(v2, "set_backgroundTransactionMetrics:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "_logUnlistedTracker:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(v2, "_onqueue_didReceiveResponse:", *(_QWORD *)(a1 + 48));
}

uint64_t __75____NSURLBackgroundSession_backgroundTask_didReceiveInformationalResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(-[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 48)), "_onqueue_didReceiveInformationalResponse:", *(_QWORD *)(a1 + 40));
}

void __73____NSURLBackgroundSession_backgroundTask_hasConnectionWaitingWithError___block_invoke(uint64_t a1)
{
  id *v2;
  id *v3;
  uint64_t v4;

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 48));
  if (v2)
  {
    v3 = v2;
    v4 = (uint64_t)v2[88];
    if (!v4)
      v4 = (uint64_t)v3[87];
    -[__NSCFURLSessionDelegateWrapper task:_isWaitingForConnectionWithError:](v4, v3, *(void **)(a1 + 40));
  }
}

void __74____NSURLBackgroundSession_backgroundTask_hasConnectionWaitingWithReason___block_invoke(uint64_t a1)
{
  id *v2;

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 40));
  -[__NSCFBackgroundSessionTask _onqueue_connectionWaitingWithReason:](v2, *(_QWORD *)(a1 + 48));
}

void __63____NSURLBackgroundSession_backgroundTaskHasConnectionWaiting___block_invoke(uint64_t a1)
{
  id *v1;

  v1 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 40));
  -[__NSCFBackgroundSessionTask _onqueue_connectionWaitingWithReason:](v1, 0);
}

uint64_t __90____NSURLBackgroundSession_backgroundTask__willSendRequestForEstablishedConnection_reply___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (!v2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90____NSURLBackgroundSession_backgroundTask__willSendRequestForEstablishedConnection_reply___block_invoke_2;
  v6[3] = &unk_1E14F8888;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[4] = v2;
  v6[5] = v4;
  return objc_msgSend(v2, "_onqueue_willSendRequestForEstablishedConnection:withCompletion:", v3, v6);
}

uint64_t __90____NSURLBackgroundSession_backgroundTask__willSendRequestForEstablishedConnection_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "updateCurrentRequest:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __91____NSURLBackgroundSession_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id *v14;
  uint64_t v15;

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 64));
  -[__NSURLBackgroundSession setCookiesFromResponse:forCurrentRequest:partitionIdentifier:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), (void *)objc_msgSend(v2, "currentRequest"), (const void *)objc_msgSend(v2, "_storagePartitionIdentifier"));
  if (objc_msgSend((id)objc_msgSend(v2, "originalRequest"), "valueForHTTPHeaderField:", 0x1EDCFCF28)
    || !objc_msgSend(*(id *)(a1 + 48), "valueForHTTPHeaderField:", 0x1EDCFCF28))
  {
    v3 = *(id *)(a1 + 48);
  }
  else
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", 0, 0x1EDCFCF28);
    v3 = v4;
  }
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __91____NSURLBackgroundSession_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply___block_invoke_2;
  v13 = &unk_1E14F8860;
  v5 = *(_QWORD *)(a1 + 56);
  v14 = v2;
  v15 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 112);
  else
    v7 = 0;
  if (objc_msgSend(v7, "_overridesBackgroundSessionAutoRedirect", v10, v11, v12, v13, v14, v15))
  {
    if (v2)
    {
      v8 = (uint64_t)v2[88];
      if (!v8)
        v8 = (uint64_t)v2[87];
    }
    else
    {
      v8 = 0;
    }
    -[__NSCFURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:](v8, v2, *(void **)(a1 + 40), v3, &v10);
  }
  else
  {
    v9 = objc_msgSend(v2, "requestWithCookiesApplied:", v3);
    objc_msgSend(v2, "updateCurrentRequest:", v9);
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v9);
  }
}

uint64_t __91____NSURLBackgroundSession_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "updateCurrentRequest:", objc_msgSend(*(id *)(a1 + 32), "requestWithCookiesApplied:", a2));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __73____NSURLBackgroundSession_backgroundTask_willBeginDelayedRequest_reply___block_invoke(uint64_t a1)
{
  id *v2;
  id *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[6];

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (v2)
  {
    v3 = v2;
    v4 = (uint64_t)v2[88];
    if (!v4)
      v4 = (uint64_t)v3[87];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73____NSURLBackgroundSession_backgroundTask_willBeginDelayedRequest_reply___block_invoke_2;
    v7[3] = &unk_1E14F9AA0;
    v5 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7[4] = v3;
    v7[5] = v6;
    -[__NSCFURLSessionDelegateWrapper task:willBeginDelayedRequest:completionHandler:](v4, v3, v5, v7);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __73____NSURLBackgroundSession_backgroundTask_willBeginDelayedRequest_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v4)(void);

  if (a2 == 1 && a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateCurrentRequest:", objc_msgSend(*(id *)(a1 + 32), "requestWithCookiesApplied:"));
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v4();
}

void __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke(uint64_t a1)
{
  id *v2;
  id *v3;
  NSURLAuthenticationChallenge *v4;
  NSURLProtectionSpace *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[9];

  v2 = -[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (v2)
  {
    v3 = v2;
    v4 = *(NSURLAuthenticationChallenge **)(a1 + 40);
    v5 = -[NSURLAuthenticationChallenge protectionSpace](v4, "protectionSpace");
    if (-[NSString isEqualToString:](-[NSURLProtectionSpace authenticationMethod](v5, "authenticationMethod"), "isEqualToString:", CFSTR("NSURLAuthenticationMethodServerTrust")))
    {
      v6 = 0;
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 32);
      if (v13)
        v14 = *(void **)(v13 + 112);
      else
        v14 = 0;
      v6 = (void *)objc_msgSend((id)objc_msgSend(v14, "URLCredentialStorage"), "defaultCredentialForProtectionSpace:", v5);
      if (!objc_msgSend(*(id *)(a1 + 40), "proposedCredential") && v6 && objc_msgSend(v6, "hasPassword"))
        v4 = -[NSURLAuthenticationChallenge initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:]([NSURLAuthenticationChallenge alloc], "initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:", v5, v6, objc_msgSend(*(id *)(a1 + 40), "previousFailureCount"), objc_msgSend(*(id *)(a1 + 40), "failureResponse"), objc_msgSend(*(id *)(a1 + 40), "error"), objc_msgSend(*(id *)(a1 + 40), "sender"));
    }
    objc_msgSend(v3, "currentRequest");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke_2;
    v15[3] = &unk_1E14F8838;
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v15[4] = v4;
    v15[5] = v7;
    v15[6] = v6;
    v15[7] = v3;
    v15[8] = v8;
    if (!isSessionChallenge(v4))
      goto LABEL_11;
    v10 = (uint64_t)v3[88];
    if (!v10)
      v10 = (uint64_t)v3[87];
    if (-[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge](v10, v9))
    {
      v11 = (uint64_t)v3[88];
      if (!v11)
        v11 = (uint64_t)v3[87];
      -[__NSCFURLSessionDelegateWrapper didReceiveChallenge:completionHandler:](v11, v4, v15);
    }
    else
    {
LABEL_11:
      v12 = (uint64_t)v3[88];
      if (!v12)
        v12 = (uint64_t)v3[87];
      -[__NSCFURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:](v12, v3, v4, v15);
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  if (a2 == 1)
  {
    if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(a1 + 40))
    {
      v5 = 1;
    }
    else
    {
      v5 = 0;
      a3 = *(void **)(a1 + 48);
    }
  }
  else
  {
    v5 = a2;
  }
  if (objc_msgSend(a3, "hasPassword"))
    objc_msgSend(a3, "password");
  v6 = (void *)objc_msgSend(a3, "identity");
  if (v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C88]), "initWithIdentity:", v6);
    objc_initWeak(&location, *(id *)(a1 + 56));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke_3;
    v7[3] = &unk_1E14F8810;
    v7[4] = v6;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v6, "setClientDisconnectionHandler:", v7);
    objc_msgSend(*(id *)(a1 + 56), "addSecKeyProxy:", v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  (*(void (**)(_QWORD, uint64_t, void *, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v5, a3, objc_msgSend(v6, "endpoint"));

}

uint64_t __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "invalidate");
    objc_msgSend(*(id *)(v2 + 32), "setClientDisconnectionHandler:", 0);
    return objc_msgSend(objc_loadWeak((id *)(v2 + 40)), "removeSecKeyProxy:", *(_QWORD *)(v2 + 32));
  }
  return result;
}

uint64_t __53____NSURLBackgroundSession_backgroundTaskDidSuspend___block_invoke(uint64_t a1)
{
  return objc_msgSend(-[__NSURLBackgroundSession taskForIdentifier:](*(id **)(a1 + 32), *(_QWORD *)(a1 + 40)), "setState:", 1);
}

uint64_t __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E14F8730;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = a2;
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *global_queue;

  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, *(dispatch_block_t *)(a1 + 32));
}

void __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *global_queue;

  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, *(dispatch_block_t *)(a1 + 32));
}

uint64_t __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeCredential:forProtectionSpace:", a3, *(_QWORD *)(a1 + 40));
}

_QWORD *__120____NSURLBackgroundSession_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke(_QWORD *a1, double a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  objc_super *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  __NSCFBackgroundAVAggregateAssetDownloadTaskNoChildTask *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  _QWORD *result;
  __NSCFBackgroundAVAggregateAssetDownloadTask *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  void *v39;
  _QWORD *v40;
  SEL v41;
  SEL v42;
  SEL v43;
  void *v44;
  uint64_t v45;
  NSURLSessionConfiguration *v46;
  AVAssetDownloadURLSession *v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  int v74;
  NSObject *v75;
  _BOOL4 v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id receiver;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t j;
  void *v90;
  void *v91;
  __NSCFBackgroundAVAggregateAssetDownloadTask *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  NSObject *v99;
  _BOOL4 v100;
  void *v101;
  const char *v102;
  int v103;
  NSObject *v104;
  _BOOL4 v105;
  uint64_t v106;
  const char *v107;
  void *v108;
  const char *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  void *v115;
  _QWORD *v116;
  uint64_t v117;
  id newValue;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  __int128 v127;
  void (*v128)(_QWORD *, const char *);
  void *v129;
  _QWORD *v130;
  void *v131;
  void *v132;
  objc_super v133;
  void (*v134)(_QWORD *, uint64_t);
  void *v135;
  void *v136;
  _QWORD *v137;
  void *v138;
  objc_super v139;
  void (*v140)(uint64_t, uint64_t);
  void *v141;
  void *v142;
  _QWORD *v143;
  __int128 buf;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint64_t v148;

  v4 = a1;
  v148 = *MEMORY[0x1E0C80C00];
  v5 = (void *)a1[4];
  if (v5)
  {
    v6 = &v139;
    if (*((_BYTE *)v5 + 265))
    {
      v7 = objc_msgSend(*((id *)v5 + 14), "_isProxySession");
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v8 = CFNLog::logger;
      v9 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v7)
      {
        if (!v9)
          goto LABEL_15;
        v10 = (void *)*((_QWORD *)v5 + 16);
        LODWORD(v139.receiver) = 138543362;
        *(id *)((char *)&v139.receiver + 4) = v10;
        v11 = "ProxySession <%{public}@> attempted to create an AVAggregateAssetDownloadTask in a session that has been invalidated";
      }
      else
      {
        if (!v9)
          goto LABEL_15;
        v73 = (void *)*((_QWORD *)v5 + 16);
        LODWORD(v139.receiver) = 138543362;
        *(id *)((char *)&v139.receiver + 4) = v73;
        v11 = "BackgroundSession <%{public}@> attempted to create an AVAggregateAssetDownloadTask in a session that has been invalidated";
      }
      _os_log_error_impl(&dword_183ECA000, v8, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v139, 0xCu);
LABEL_15:
      v33 = (NSString *)dyld_program_sdk_at_least();
      if ((_DWORD)v33)
        __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v33);
      goto LABEL_16;
    }
    v12 = (void *)a1[5];
    newValue = (id)a1[6];
    v13 = (void *)a1[7];
    v121 = (id)a1[8];
    v125 = (void *)a1[9];
    v14 = -[__NSURLBackgroundSession doesAVAssetDownloadSessionSupportMultipleDownloads](a2);
    v15 = (void *)0x1EDCF5000;
    v16 = *((_QWORD *)v5 + 34);
    if (v14)
    {
      v17 = [__NSCFBackgroundAVAggregateAssetDownloadTaskNoChildTask alloc];
      v18 = objc_msgSend(v5, "defaultTaskGroup");
      v19 = *((_QWORD *)v5 + 20);
      *((_QWORD *)v5 + 20) = v19 + 1;
      if (!v17)
      {
        v2 = 0;
        if (v16)
          goto LABEL_111;
LABEL_11:
        v21 = objc_msgSend(v12, "downloadToken");
        if (*((_QWORD *)v5 + 21))
        {
          v22 = v21;
          v123 = v13;
          v23 = -[__NSURLBackgroundSession serializableAVAssetDownloadTaskOptionsFromOptions:mediaSelections:downloadConfiguration:](v125, newValue, 0);
          v24 = (void *)*((_QWORD *)v5 + 21);
          v25 = MEMORY[0x1E0C809B0];
          v139.receiver = (id)MEMORY[0x1E0C809B0];
          v139.super_class = (Class)3221225472;
          v140 = __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke;
          v141 = &unk_1E14F86E0;
          v142 = v5;
          v143 = v2;
          v26 = (void *)objc_msgSend(v24, "synchronousRemoteObjectProxyWithErrorHandler:", &v139);
          v27 = objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskDestinationURLKey"));
          v133.receiver = 0;
          v28 = objc_msgSend(v12, "propertyListForNSURLSessionAssetReturningError:", &v133);
          v29 = v2;
          if (v28)
          {
            v30 = v28;
            v31 = objc_msgSend(v29, "taskIdentifier");
            v32 = objc_msgSend(v29, "_uniqueIdentifier");
            *(_QWORD *)&buf = v25;
            *((_QWORD *)&buf + 1) = 3221225472;
            *(_QWORD *)&v145 = __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_169;
            *((_QWORD *)&v145 + 1) = &unk_1E14F8708;
            *(_QWORD *)&v146 = v29;
            *((_QWORD *)&v146 + 1) = v5;
            LOBYTE(v113) = 0;
            objc_msgSend(v26, "avAssetDownloadTaskWithDownloadToken:URL:destinationURL:temporaryDestinationURL:assetTitle:assetArtworkData:options:assetOptions:identifier:uniqueIdentifier:taskKind:enableSPIDelegateCallbacks:reply:", v22, 0, v27, 0, v123, v121, v23, v30, v31, v32, 5, v113, &buf);
            v2 = v29;
            goto LABEL_109;
          }
          v74 = objc_msgSend(*((id *)v5 + 14), "_isProxySession");
          if (CFNLog::onceToken != -1)
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
          v75 = CFNLog::logger;
          v76 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
          if (v74)
          {
            if (v76)
            {
              v78 = *((_QWORD *)v5 + 16);
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v78;
              v79 = "ProxySession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as the URLAsse"
                    "t PropertyList could not be serialized.";
              goto LABEL_72;
            }
          }
          else if (v76)
          {
            v85 = *((_QWORD *)v5 + 16);
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v85;
            v79 = "BackgroundSession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as the URLA"
                  "sset PropertyList could not be serialized.";
LABEL_72:
            _os_log_error_impl(&dword_183ECA000, v75, OS_LOG_TYPE_ERROR, v79, (uint8_t *)&buf, 0xCu);
            if (!v2)
              goto LABEL_109;
            goto LABEL_68;
          }
          if (!v2)
            goto LABEL_109;
LABEL_68:
          receiver = v133.receiver;
LABEL_108:
          objc_setProperty_atomic(v2, v77, receiver, 776);
          goto LABEL_109;
        }
        v51 = objc_msgSend(*((id *)v5 + 14), "_isProxySession");
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v52 = CFNLog::logger;
        v53 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
        if (v51)
        {
          if (v53)
          {
            v54 = (void *)*((_QWORD *)v5 + 16);
            LODWORD(v139.receiver) = 138543362;
            *(id *)((char *)&v139.receiver + 4) = v54;
            v55 = "ProxySession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as remote sessio"
                  "n is unavailable";
LABEL_70:
            _os_log_error_impl(&dword_183ECA000, v52, OS_LOG_TYPE_ERROR, v55, (uint8_t *)&v139, 0xCu);
          }
        }
        else if (v53)
        {
          v84 = (void *)*((_QWORD *)v5 + 16);
          LODWORD(v139.receiver) = 138543362;
          *(id *)((char *)&v139.receiver + 4) = v84;
          v55 = "BackgroundSession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as remote ses"
                "sion is unavailable";
          goto LABEL_70;
        }
        v80 = (void *)MEMORY[0x1E0CB35C8];
        v81 = *MEMORY[0x1E0CB32E8];
        v82 = 0;
        goto LABEL_103;
      }
      v139.receiver = v17;
      v139.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTaskNoChildTask;
      v2 = objc_msgSendSuper2(&v139, sel_initWithTaskGroup_URLAsset_URL_destinationURL_temporaryDestinationURL_assetTitle_assetArtworkData_ident_enableSPIDelegateCallbacks_, v18, v12, 0, 0, 0, v13, v121, v19, 0);
      if (!v16)
        goto LABEL_11;
LABEL_55:
      if (v2)
        objc_setProperty_atomic(v2, v20, *((id *)v5 + 34), 776);
      goto LABEL_111;
    }
    v117 = *((_QWORD *)v5 + 34);
    v35 = [__NSCFBackgroundAVAggregateAssetDownloadTask alloc];
    v36 = objc_msgSend(v5, "defaultTaskGroup");
    v38 = *((_QWORD *)v5 + 20);
    *((_QWORD *)v5 + 20) = v38 + 1;
    if (v35)
    {
      v39 = (void *)v36;
      gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadSession(v37);
      if (!objc_opt_class())
      {
        _os_crash();
        __break(1u);
        goto LABEL_119;
      }
      v133.receiver = v35;
      v133.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
      v40 = objc_msgSendSuper2(&v133, sel_initWithOriginalRequest_ident_taskGroup_, 0, v38, v39);
      v2 = v40;
      if (v40)
      {
        v124 = v12;
        objc_msgSend(v40, "setURLAsset:", v12);
        objc_setProperty_atomic(v2, v41, newValue, 808);
        objc_setProperty_atomic_copy(v2, v42, v13, 816);
        objc_setProperty_atomic_copy(v2, v43, v121, 824);
        v2[105] = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%lu.childAssetDownloadTasks"), objc_msgSend((id)objc_msgSend(v2, "_effectiveConfiguration"), "identifier"), v38);
        v44 = (void *)objc_msgSend(v39, "_groupConfiguration");
        v45 = v2[105];
        objc_opt_self();
        v46 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:](NSURLSessionConfiguration, "backgroundSessionConfigurationWithIdentifier:", v45);
        -[NSURLSessionConfiguration set_sourceApplicationBundleIdentifier:](v46, "set_sourceApplicationBundleIdentifier:", objc_msgSend(v44, "_sourceApplicationBundleIdentifier"));
        -[NSURLSessionConfiguration set_sourceApplicationSecondaryIdentifier:](v46, "set_sourceApplicationSecondaryIdentifier:", objc_msgSend(v44, "_sourceApplicationSecondaryIdentifier"));
        -[NSURLSessionConfiguration set_sourceApplicationAuditTokenData:](v46, "set_sourceApplicationAuditTokenData:", objc_msgSend(v44, "_sourceApplicationAuditTokenData"));
        -[NSURLSessionConfiguration setTLSMaximumSupportedProtocol:](v46, "setTLSMaximumSupportedProtocol:", objc_msgSend(v44, "TLSMaximumSupportedProtocol"));
        -[NSURLSessionConfiguration setTLSMinimumSupportedProtocol:](v46, "setTLSMinimumSupportedProtocol:", objc_msgSend(v44, "TLSMinimumSupportedProtocol"));
        objc_msgSend(v44, "timeoutIntervalForRequest");
        -[NSURLSessionConfiguration setTimeoutIntervalForRequest:](v46, "setTimeoutIntervalForRequest:");
        objc_msgSend(v44, "timeoutIntervalForResource");
        -[NSURLSessionConfiguration setTimeoutIntervalForResource:](v46, "setTimeoutIntervalForResource:");
        -[NSURLSessionConfiguration setConnectionProxyDictionary:](v46, "setConnectionProxyDictionary:", objc_msgSend(v44, "connectionProxyDictionary"));
        -[NSURLSessionConfiguration setHTTPAdditionalHeaders:](v46, "setHTTPAdditionalHeaders:", objc_msgSend(v44, "HTTPAdditionalHeaders"));
        -[NSURLSessionConfiguration setHTTPMaximumConnectionsPerHost:](v46, "setHTTPMaximumConnectionsPerHost:", objc_msgSend(v44, "HTTPMaximumConnectionsPerHost"));
        -[NSURLSessionConfiguration setHTTPCookieStorage:](v46, "setHTTPCookieStorage:", objc_msgSend(v44, "HTTPCookieStorage"));
        -[NSURLSessionConfiguration setURLCache:](v46, "setURLCache:", objc_msgSend(v44, "URLCache"));
        -[NSURLSessionConfiguration setURLCredentialStorage:](v46, "setURLCredentialStorage:", objc_msgSend(v44, "URLCredentialStorage"));
        -[NSURLSessionConfiguration setNetworkServiceType:](v46, "setNetworkServiceType:", objc_msgSend(v44, "networkServiceType"));
        -[NSURLSessionConfiguration setAllowsCellularAccess:](v46, "setAllowsCellularAccess:", objc_msgSend(v44, "allowsCellularAccess"));
        -[NSURLSessionConfiguration set_TCPAdaptiveReadTimeout:](v46, "set_TCPAdaptiveReadTimeout:", objc_msgSend(v44, "_TCPAdaptiveReadTimeout"));
        -[NSURLSessionConfiguration set_TCPAdaptiveWriteTimeout:](v46, "set_TCPAdaptiveWriteTimeout:", objc_msgSend(v44, "_TCPAdaptiveWriteTimeout"));
        -[NSURLSessionConfiguration setDiscretionary:](v46, "setDiscretionary:", objc_msgSend(v44, "isDiscretionary"));
        v47 = +[AVAssetDownloadURLSession sessionWithConfiguration:assetDownloadDelegate:delegateQueue:](AVAssetDownloadURLSession, "sessionWithConfiguration:assetDownloadDelegate:delegateQueue:", v46, v2, 0);
        v48 = v125;
        v49 = (void *)objc_msgSend(v125, "objectForKey:", CFSTR("AVAssetDownloadTaskMediaSelectionPrefersMultichannelKey"));
        v115 = v5;
        v116 = v4;
        v114 = objc_msgSend((id)objc_msgSend(v125, "objectForKey:", CFSTR("AVAssetDownloadTaskMediaSelectionPrefersMultichannelForMostPreferredLanguageOnlyKey")), "BOOLValue");
        if ((v114 & 1) != 0)
        {
          v50 = 0;
        }
        else if (v49)
        {
          v50 = objc_msgSend(v49, "BOOLValue");
        }
        else
        {
          v50 = 1;
        }
        v120 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        buf = 0u;
        v145 = 0u;
        v146 = 0u;
        v147 = 0u;
        v56 = objc_msgSend(newValue, "countByEnumeratingWithState:objects:count:", &buf, &v139, 16);
        v57 = v121;
        if (v56)
        {
          v58 = v56;
          v59 = *(_QWORD *)v145;
          do
          {
            for (i = 0; i != v58; ++i)
            {
              v61 = v13;
              if (*(_QWORD *)v145 != v59)
                objc_enumerationMutation(newValue);
              v62 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 8 * i);
              if (v48)
                v63 = (id)objc_msgSend(v48, "mutableCopy");
              else
                v63 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v64 = v63;
              objc_msgSend(v63, "setObject:forKeyedSubscript:", v62, CFSTR("AVAssetDownloadTaskMediaSelectionKey"));
              objc_msgSend(v64, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("AVAssetDownloadSessionMediaSelectionPrefersMultichannelKey"));
              objc_msgSend(v64, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "taskIdentifier")), CFSTR("AVAggregateAssetDownloadTaskIdentifierKey"));
              v13 = v61;
              v65 = v61;
              v57 = v121;
              v66 = -[AVAssetDownloadURLSession assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:](v47, "assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:", v124, v65, v121, v64);
              if (v66)
                objc_msgSend(v120, "addObject:", v66);
              if (v50)
              {
                v67 = v125
                    ? (id)objc_msgSend(v64, "mutableCopy")
                    : (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v68 = v67;
                objc_msgSend(v67, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("AVAssetDownloadSessionMediaSelectionPrefersMultichannelKey"));
                v69 = -[AVAssetDownloadURLSession assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:](v47, "assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:", v124, v13, v121, v68);
                if (v69)
                  objc_msgSend(v120, "addObject:", v69);
              }
              v48 = v125;
            }
            v58 = objc_msgSend(newValue, "countByEnumeratingWithState:objects:count:", &buf, &v139, 16);
          }
          while (v58);
        }
        v5 = v115;
        if (v114)
        {
          v70 = v48
              ? (id)objc_msgSend(v48, "mutableCopy")
              : (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v71 = v70;
          objc_msgSend(v70, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("AVAssetDownloadSessionMediaSelectionPrefersMultichannelKey"));
          objc_msgSend(v71, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "taskIdentifier")), CFSTR("AVAggregateAssetDownloadTaskIdentifierKey"));
          v72 = -[AVAssetDownloadURLSession assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:](v47, "assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:", v124, v13, v57, v71);
          if (v72)
            objc_msgSend(v120, "addObject:", v72);
        }
        v2[107] = objc_msgSend(v120, "copy");
        v2[106] = v47;
        v4 = v116;
        v12 = v124;
        if (v117)
          goto LABEL_55;
        goto LABEL_79;
      }
    }
    else
    {
      v2 = 0;
    }
    if (v117)
      goto LABEL_55;
LABEL_79:
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    buf = 0u;
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v86 = objc_msgSend(newValue, "countByEnumeratingWithState:objects:count:", &buf, &v139, 16);
    if (v86)
    {
      v87 = v86;
      v88 = *(_QWORD *)v145;
      do
      {
        for (j = 0; j != v87; ++j)
        {
          if (*(_QWORD *)v145 != v88)
            objc_enumerationMutation(newValue);
          objc_msgSend(v15, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 8 * j), "propertyList"));
        }
        v87 = objc_msgSend(newValue, "countByEnumeratingWithState:objects:count:", &buf, &v139, 16);
      }
      while (v87);
    }
    v90 = v12;
    v39 = (void *)objc_msgSend(v12, "URL");
    v91 = (void *)*((_QWORD *)v5 + 21);
    if (v91)
    {
      v92 = (__NSCFBackgroundAVAggregateAssetDownloadTask *)MEMORY[0x1E0C809B0];
      v133.receiver = (id)MEMORY[0x1E0C809B0];
      v3 = 3221225472;
      v133.super_class = (Class)3221225472;
      v134 = __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_170;
      v135 = &unk_1E14F85E8;
      v136 = v5;
      v137 = v2;
      v138 = v39;
      v93 = objc_msgSend(v91, "synchronousRemoteObjectProxyWithErrorHandler:", &v133);
      v125 = -[__NSURLBackgroundSession serializableAVAssetDownloadTaskOptionsFromOptions:mediaSelections:downloadConfiguration:](v125, newValue, 0);
      v126 = 0;
      v94 = objc_msgSend(v90, "propertyListForNSURLSessionAssetReturningError:", &v126);
      if (v94)
      {
        v6 = (objc_super *)v94;
        v119 = (void *)v93;
        v122 = v13;
        v13 = v5;
        v38 = objc_msgSend(v90, "downloadToken");
        v35 = v92;
        if (v2)
        {
          v95 = v2[105];
LABEL_90:
          v96 = objc_msgSend(v2, "taskIdentifier");
          v97 = objc_msgSend(v2, "_uniqueIdentifier");
          *(_QWORD *)&v127 = v35;
          *((_QWORD *)&v127 + 1) = v3;
          v128 = __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_171;
          v129 = &unk_1E14F8610;
          v130 = v2;
          v131 = v13;
          v132 = v39;
          v112 = v95;
          v5 = v13;
          objc_msgSend(v119, "avAggregateAssetDownloadTaskWithDownloadToken:serializedMediaSelections:assetTitle:assetArtworkData:options:assetOptions:childDownloadSessionIdentifier:identifier:uniqueIdentifier:reply:", v38, v15, v122, v121, v125, v6, v112, v96, v97, &v127);
          goto LABEL_109;
        }
LABEL_119:
        v95 = 0;
        goto LABEL_90;
      }
      v103 = objc_msgSend(*((id *)v5 + 14), "_isProxySession");
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v104 = CFNLog::logger;
      v105 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v103)
      {
        if (v105)
        {
          v106 = *((_QWORD *)v5 + 16);
          LODWORD(v127) = 138543362;
          *(_QWORD *)((char *)&v127 + 4) = v106;
          v107 = "ProxySession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as the URLAsset P"
                 "ropertyList could not be serialized.";
          goto LABEL_116;
        }
      }
      else if (v105)
      {
        v111 = *((_QWORD *)v5 + 16);
        LODWORD(v127) = 138543362;
        *(_QWORD *)((char *)&v127 + 4) = v111;
        v107 = "BackgroundSession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as the URLAsse"
               "t PropertyList could not be serialized.";
LABEL_116:
        _os_log_error_impl(&dword_183ECA000, v104, OS_LOG_TYPE_ERROR, v107, (uint8_t *)&v127, 0xCu);
        if (!v2)
        {
LABEL_109:
          if (v2)
            goto LABEL_110;
          goto LABEL_111;
        }
        goto LABEL_107;
      }
      if (!v2)
        goto LABEL_109;
LABEL_107:
      receiver = v126;
      goto LABEL_108;
    }
    v98 = objc_msgSend(*((id *)v5 + 14), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v99 = CFNLog::logger;
    v100 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v98)
    {
      if (v100)
      {
        v101 = (void *)*((_QWORD *)v5 + 16);
        LODWORD(v133.receiver) = 138543362;
        *(id *)((char *)&v133.receiver + 4) = v101;
        v102 = "ProxySession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as remote session is unavailable";
LABEL_114:
        _os_log_error_impl(&dword_183ECA000, v99, OS_LOG_TYPE_ERROR, v102, (uint8_t *)&v133, 0xCu);
      }
    }
    else if (v100)
    {
      v110 = (void *)*((_QWORD *)v5 + 16);
      LODWORD(v133.receiver) = 138543362;
      *(id *)((char *)&v133.receiver + 4) = v110;
      v102 = "BackgroundSession <%{public}@> failed to create a background AVAggregateAssetDownloadTask, as remote sessio"
             "n is unavailable";
      goto LABEL_114;
    }
    v80 = (void *)MEMORY[0x1E0CB35C8];
    v81 = *MEMORY[0x1E0CB32E8];
    v82 = v39;
LABEL_103:
    v108 = (void *)objc_msgSend(v80, "_web_errorWithDomain:code:URL:", v81, -1, v82);
    if (v2)
    {
      objc_setProperty_atomic(v2, v109, v108, 776);
LABEL_110:
      objc_msgSend(*((id *)v5 + 23), "setObject:forKeyedSubscript:", v2, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "taskIdentifier")));
    }
LABEL_111:
    result = v2;
    goto LABEL_112;
  }
LABEL_16:
  result = 0;
LABEL_112:
  *(_QWORD *)(*(_QWORD *)(v4[10] + 8) + 40) = result;
  return result;
}

uint64_t __68____NSURLBackgroundSession_performBlockOnQueueAndRethrowExceptions___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 112);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v7 = CFNLog::logger;
  v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8)
      goto LABEL_11;
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      v10 = *(_QWORD *)(v10 + 128);
    v14 = 138543618;
    v15 = v10;
    v16 = 2112;
    v17 = a2;
    v11 = "ProxySession <%{public}@> error requesting an AVAggregateAssetDownloadTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      v13 = *(_QWORD *)(v13 + 128);
    v14 = 138543618;
    v15 = v13;
    v16 = 2112;
    v17 = a2;
    v11 = "BackgroundSession <%{public}@> error requesting an AVAggregateAssetDownloadTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_183ECA000, v7, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v14, 0x16u);
LABEL_11:
  v12 = *(void **)(a1 + 40);
  if (v12)
    objc_setProperty_atomic(v12, v9, *(id *)(*(_QWORD *)(a1 + 32) + 272), 776);
}

void __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_169(uint64_t a1, const char *a2)
{
  void *v3;

  if ((a2 & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
      objc_setProperty_atomic(v3, a2, *(id *)(*(_QWORD *)(a1 + 40) + 272), 776);
  }
}

void __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_170(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  if (v4)
    v5 = *(void **)(v4 + 112);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v7 = CFNLog::logger;
  v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8)
      goto LABEL_11;
    v10 = a1[4];
    if (v10)
      v10 = *(_QWORD *)(v10 + 128);
    v15 = 138543618;
    v16 = v10;
    v17 = 2112;
    v18 = a2;
    v11 = "ProxySession <%{public}@> error requesting an AVAggregateAssetDownloadTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v14 = a1[4];
    if (v14)
      v14 = *(_QWORD *)(v14 + 128);
    v15 = 138543618;
    v16 = v14;
    v17 = 2112;
    v18 = a2;
    v11 = "BackgroundSession <%{public}@> error requesting an AVAggregateAssetDownloadTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_183ECA000, v7, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0x16u);
LABEL_11:
  v12 = (void *)a1[5];
  if (a1[4])
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, a1[6]);
    if (!v12)
      return;
  }
  else
  {
    v13 = 0;
    if (!v12)
      return;
  }
  objc_setProperty_atomic(v12, v9, v13, 776);
}

void __129____NSURLBackgroundSession__onqueue_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke_171(_QWORD *a1, const char *a2)
{
  void *v2;
  void *v3;

  if ((a2 & 1) == 0)
  {
    v2 = (void *)a1[4];
    if (a1[5])
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, a1[6]);
      if (!v2)
        return;
    }
    else
    {
      v3 = 0;
      if (!v2)
        return;
    }
    objc_setProperty_atomic(v2, a2, v3, 776);
  }
}

uint64_t __116____NSURLBackgroundSession_serializableAVAssetDownloadTaskOptionsFromOptions_mediaSelections_downloadConfiguration___block_invoke()
{
  double v0;
  char v1;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadConfiguration(v0),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    v1 = 0;
  }
  else
  {
    objc_opt_class();
    v1 = objc_opt_isKindOfClass() ^ 1;
  }
  return v1 & 1;
}

id *__117____NSURLBackgroundSession_AVAssetDownloadTaskForURLAsset_assetTitle_assetArtworkData_options_downloadConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(*(id *)(a1 + 32), "_destinationURL");
  else
    v2 = 0;
  result = -[__NSURLBackgroundSession _onqueue_AVAssetDownloadTaskForURLAsset:URL:destinationURL:assetTitle:assetArtworkData:options:downloadConfiguration:enableSPIDelegateCallbacks:](*(id **)(a1 + 40), *(void **)(a1 + 48), 0, v2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(void **)(a1 + 72), *(_QWORD *)(a1 + 32), 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = result;
  return result;
}

void __172____NSURLBackgroundSession__onqueue_AVAssetDownloadTaskForURLAsset_URL_destinationURL_assetTitle_assetArtworkData_options_downloadConfiguration_enableSPIDelegateCallbacks___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  if (v4)
    v5 = *(void **)(v4 + 112);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v7 = CFNLog::logger;
  v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8)
      goto LABEL_11;
    v10 = a1[4];
    if (v10)
      v10 = *(_QWORD *)(v10 + 128);
    v15 = 138543618;
    v16 = v10;
    v17 = 2112;
    v18 = a2;
    v11 = "ProxySession <%{public}@> error requesting an AVAssetDownloadTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v14 = a1[4];
    if (v14)
      v14 = *(_QWORD *)(v14 + 128);
    v15 = 138543618;
    v16 = v14;
    v17 = 2112;
    v18 = a2;
    v11 = "BackgroundSession <%{public}@> error requesting an AVAssetDownloadTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_183ECA000, v7, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0x16u);
LABEL_11:
  v12 = (void *)a1[5];
  if (a1[4])
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, a1[6]);
    if (!v12)
      return;
  }
  else
  {
    v13 = 0;
    if (!v12)
      return;
  }
  objc_setProperty_atomic(v12, v9, v13, 776);
}

void __172____NSURLBackgroundSession__onqueue_AVAssetDownloadTaskForURLAsset_URL_destinationURL_assetTitle_assetArtworkData_options_downloadConfiguration_enableSPIDelegateCallbacks___block_invoke_168(_QWORD *a1, const char *a2)
{
  void *v2;
  void *v3;

  if ((a2 & 1) == 0)
  {
    v2 = (void *)a1[4];
    if (a1[5])
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, a1[6]);
      if (!v2)
        return;
    }
    else
    {
      v3 = 0;
      if (!v2)
        return;
    }
    objc_setProperty_atomic(v2, a2, v3, 776);
  }
}

id *__82____NSURLBackgroundSession_AVAssetDownloadTaskForURLAsset_destinationURL_options___block_invoke(uint64_t a1)
{
  id *result;

  result = -[__NSURLBackgroundSession _onqueue_AVAssetDownloadTaskForURLAsset:URL:destinationURL:assetTitle:assetArtworkData:options:downloadConfiguration:enableSPIDelegateCallbacks:](*(id **)(a1 + 32), *(void **)(a1 + 40), 0, *(_QWORD *)(a1 + 48), 0, 0, *(void **)(a1 + 56), 0, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
  return result;
}

id *__78____NSURLBackgroundSession__AVAssetDownloadTaskForURL_destinationURL_options___block_invoke(uint64_t a1)
{
  id *result;

  result = -[__NSURLBackgroundSession _onqueue_AVAssetDownloadTaskForURLAsset:URL:destinationURL:assetTitle:assetArtworkData:options:downloadConfiguration:enableSPIDelegateCallbacks:](*(id **)(a1 + 32), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0, *(void **)(a1 + 56), 0, 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
  return result;
}

void __60____NSURLBackgroundSession__onqueue_downloadTaskForRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 112);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v7 = CFNLog::logger;
  v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8)
      goto LABEL_11;
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v9 = *(_QWORD *)(v9 + 128);
    *(_DWORD *)v17 = 138543618;
    *(_QWORD *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2112;
    *(_QWORD *)&v17[14] = a2;
    v10 = "ProxySession <%{public}@> error requesting a NSURLSessionDownloadTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      v16 = *(_QWORD *)(v16 + 128);
    *(_DWORD *)v17 = 138543618;
    *(_QWORD *)&v17[4] = v16;
    *(_WORD *)&v17[12] = 2112;
    *(_QWORD *)&v17[14] = a2;
    v10 = "BackgroundSession <%{public}@> error requesting a NSURLSessionDownloadTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_183ECA000, v7, OS_LOG_TYPE_ERROR, v10, v17, 0x16u);
LABEL_11:
  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v13 = objc_msgSend(*(id *)(a1 + 48), "URL", *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
  if (v12)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v13);
    if (!v11)
      return;
  }
  else
  {
    v15 = 0;
    if (!v11)
      return;
  }
  objc_setProperty_atomic(v11, v14, v15, 776);
}

void __60____NSURLBackgroundSession__onqueue_downloadTaskForRequest___block_invoke_132(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *v6;

  if ((a2 & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = objc_msgSend(*(id *)(a1 + 48), "URL");
    if (v3)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v4);
      if (!v2)
        return;
    }
    else
    {
      v6 = 0;
      if (!v2)
        return;
    }
    objc_setProperty_atomic(v2, v5, v6, 776);
  }
}

void __63____NSURLBackgroundSession__onqueue_downloadTaskForResumeData___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 112);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v7 = CFNLog::logger;
  v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8)
      goto LABEL_11;
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v9 = *(_QWORD *)(v9 + 128);
    *(_DWORD *)v17 = 138543618;
    *(_QWORD *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2112;
    *(_QWORD *)&v17[14] = a2;
    v10 = "ProxySession <%{public}@> error requesting a NSURLSessionDownloadTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      v16 = *(_QWORD *)(v16 + 128);
    *(_DWORD *)v17 = 138543618;
    *(_QWORD *)&v17[4] = v16;
    *(_WORD *)&v17[12] = 2112;
    *(_QWORD *)&v17[14] = a2;
    v10 = "BackgroundSession <%{public}@> error requesting a NSURLSessionDownloadTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_183ECA000, v7, OS_LOG_TYPE_ERROR, v10, v17, 0x16u);
LABEL_11:
  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v13 = objc_msgSend(*(id *)(a1 + 48), "URL", *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
  if (v12)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v13);
    if (!v11)
      return;
  }
  else
  {
    v15 = 0;
    if (!v11)
      return;
  }
  objc_setProperty_atomic(v11, v14, v15, 776);
}

void __63____NSURLBackgroundSession__onqueue_downloadTaskForResumeData___block_invoke_128(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *v6;

  if ((a2 & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = objc_msgSend(*(id *)(a1 + 48), "URL");
    if (v3)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v4);
      if (!v2)
        return;
    }
    else
    {
      v6 = 0;
      if (!v2)
        return;
    }
    objc_setProperty_atomic(v2, v5, v6, 776);
  }
}

void __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_112(uint64_t a1, void *a2)
{
  void *v4;
  BOOL v5;
  NSURLCredential *v6;

  v4 = (void *)objc_msgSend(a2, "protocol");
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(a2, "host")))
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5
    && (*(_BYTE *)(a1 + 48) && (objc_msgSend(v4, "isEqualToString:", CFSTR("https")) & 1) != 0
     || *(_BYTE *)(a1 + 49) && objc_msgSend(v4, "isEqualToString:", CFSTR("http"))))
  {
    v6 = -[NSURLCredentialStorage defaultCredentialForProtectionSpace:](+[NSURLCredentialStorage sharedCredentialStorage](NSURLCredentialStorage, "sharedCredentialStorage"), "defaultCredentialForProtectionSpace:", a2);
    if (v6)
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), a2, v6);
  }
}

void __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 112);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v7 = CFNLog::logger;
  v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8)
      goto LABEL_11;
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v9 = *(_QWORD *)(v9 + 128);
    *(_DWORD *)v17 = 138543618;
    *(_QWORD *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2112;
    *(_QWORD *)&v17[14] = a2;
    v10 = "ProxySession <%{public}@> error requesting a NSURLSessionUploadTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      v16 = *(_QWORD *)(v16 + 128);
    *(_DWORD *)v17 = 138543618;
    *(_QWORD *)&v17[4] = v16;
    *(_WORD *)&v17[12] = 2112;
    *(_QWORD *)&v17[14] = a2;
    v10 = "BackgroundSession <%{public}@> error requesting a NSURLSessionUploadTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_183ECA000, v7, OS_LOG_TYPE_ERROR, v10, v17, 0x16u);
LABEL_11:
  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v13 = objc_msgSend(*(id *)(a1 + 48), "URL", *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
  if (v12)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v13);
    if (!v11)
      return;
  }
  else
  {
    v15 = 0;
    if (!v11)
      return;
  }
  objc_setProperty_atomic(v11, v14, v15, 776);
}

void __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_117(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *v6;

  if ((a2 & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = objc_msgSend(*(id *)(a1 + 48), "URL");
    if (v3)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v4);
      if (!v2)
        return;
    }
    else
    {
      v6 = 0;
      if (!v2)
        return;
    }
    objc_setProperty_atomic(v2, v5, v6, 776);
  }
}

void __56____NSURLBackgroundSession__onqueue_uploadTaskForClass___block_invoke_2_118(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *v6;

  if ((a2 & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = objc_msgSend(*(id *)(a1 + 48), "URL");
    if (v3)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v4);
      if (!v2)
        return;
    }
    else
    {
      v6 = 0;
      if (!v2)
        return;
    }
    objc_setProperty_atomic(v2, v5, v6, 776);
  }
}

__NSCFBackgroundDataTask *__54____NSURLBackgroundSession__dataTaskWithTaskForClass___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  id Property;
  SEL v6;
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  const char *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  __NSCFBackgroundDataTask *result;
  objc_class *v24;
  NSString *v25;
  __NSCFBackgroundDataTask *v26;
  uint64_t v27;
  const char *v28;
  __NSCFBackgroundDataTask *v29;
  const char *v30;
  void *v31;
  int v32;
  NSObject *v33;
  _BOOL4 v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t internalDelegateWrapper;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[7];
  _BYTE buf[24];
  void *v45;
  uint64_t v46;
  __NSCFBackgroundDataTask *v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
  {
LABEL_27:
    result = 0;
    goto LABEL_28;
  }
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    Property = objc_getProperty(*(id *)(a1 + 40), a2, 16, 1);
    v7 = objc_getProperty(v4, v6, 48, 1);
  }
  else
  {
    Property = 0;
    v7 = 0;
  }
  -[__NSURLBackgroundSession validateSerializabilityForRequest:completion:]((uint64_t)Property, (uint64_t)v7);
  if ((objc_msgSend(Property, "_isSafeRequestForBackgroundDownload") & 1) != 0)
  {
    if (!Property)
    {
      if (dyld_program_sdk_at_least())
        __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(CFSTR("Cannot create task from nil request"));
      goto LABEL_27;
    }
    if (*(_BYTE *)(v3 + 265))
    {
      v8 = objc_msgSend(*(id *)(v3 + 112), "_isProxySession");
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v9 = CFNLog::logger;
      v10 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v8)
      {
        if (!v10)
          goto LABEL_26;
        v11 = *(_QWORD *)(v3 + 128);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v11;
        v12 = "ProxySession <%{public}@> attempted to create a NSURLSessionDataTask in a session that has been invalidated";
      }
      else
      {
        if (!v10)
          goto LABEL_26;
        v41 = *(_QWORD *)(v3 + 128);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v41;
        v12 = "BackgroundSession <%{public}@> attempted to create a NSURLSessionDataTask in a session that has been invalidated";
      }
      _os_log_error_impl(&dword_183ECA000, v9, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
LABEL_26:
      v25 = (NSString *)dyld_program_sdk_at_least();
      if ((_DWORD)v25)
        __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v25);
      goto LABEL_27;
    }
    if (*(_QWORD *)(v3 + 272))
    {
      v24 = (objc_class *)objc_opt_class();
      result = (__NSCFBackgroundDataTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]((_QWORD *)v3, v24, *(void **)(v3 + 272));
      goto LABEL_28;
    }
    v26 = [__NSCFBackgroundDataTask alloc];
    v27 = *(_QWORD *)(v3 + 160);
    *(_QWORD *)(v3 + 160) = v27 + 1;
    v29 = -[__NSCFBackgroundDataTask initWithOriginalRequest:ident:taskGroup:](v26, "initWithOriginalRequest:ident:taskGroup:", Property, v27, objc_msgSend((id)v3, "defaultTaskGroup"));
    if (v4 && objc_getProperty(v4, v28, 24, 1))
      -[NSURLSessionTask set_uniqueIdentifier:](v29, "set_uniqueIdentifier:", objc_getProperty(v4, v30, 24, 1));
    -[NSURLSessionTask updateCurrentRequest:](v29, "updateCurrentRequest:", Property);
    v31 = *(void **)(v3 + 168);
    if (v31)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __62____NSURLBackgroundSession__onqueue_dataTaskWithTaskForClass___block_invoke;
      v45 = &unk_1E14F85E8;
      v46 = v3;
      v47 = v29;
      v48 = Property;
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __62____NSURLBackgroundSession__onqueue_dataTaskWithTaskForClass___block_invoke_95;
      v43[3] = &unk_1E14F8610;
      v43[4] = v29;
      v43[5] = v3;
      v43[6] = Property;
      objc_msgSend((id)objc_msgSend(v31, "synchronousRemoteObjectProxyWithErrorHandler:", buf), "dataTaskWithRequest:originalRequest:identifier:uniqueIdentifier:reply:", Property, Property, -[NSURLSessionTask taskIdentifier](v29, "taskIdentifier"), -[NSURLSessionTask _uniqueIdentifier](v29, "_uniqueIdentifier"), v43);
      if (!v29)
      {
LABEL_46:
        result = v29;
        goto LABEL_28;
      }
LABEL_43:
      objc_msgSend(*(id *)(v3 + 184), "setObject:forKeyedSubscript:", v29, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](v29, "taskIdentifier")));
      internalDelegateWrapper = (uint64_t)v29->super.super._internalDelegateWrapper;
      if (!internalDelegateWrapper)
        internalDelegateWrapper = (uint64_t)v29->super.super._publicDelegateWrapper;
      -[__NSCFURLSessionDelegateWrapper didCreateTask:](internalDelegateWrapper, v29);
      goto LABEL_46;
    }
    v32 = objc_msgSend(*(id *)(v3 + 112), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v33 = CFNLog::logger;
    v34 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v34)
      {
        v35 = *(_QWORD *)(v3 + 128);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v35;
        v36 = "ProxySession <%{public}@> failed to create a background NSURLSessionDataTask, as remote session is unavailable";
LABEL_50:
        _os_log_error_impl(&dword_183ECA000, v33, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);
      }
    }
    else if (v34)
    {
      v42 = *(_QWORD *)(v3 + 128);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v42;
      v36 = "BackgroundSession <%{public}@> failed to create a background NSURLSessionDataTask, as remote session is unavailable";
      goto LABEL_50;
    }
    v37 = objc_msgSend(Property, "URL");
    v38 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v37);
    if (!v29)
      goto LABEL_46;
    objc_setProperty_atomic(v29, v39, v38, 776);
    goto LABEL_43;
  }
  v13 = objc_msgSend(*(id *)(v3 + 112), "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v14 = CFNLog::logger;
  v15 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      v16 = *(_QWORD *)(v3 + 128);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = objc_msgSend((id)objc_msgSend(Property, "URL"), "scheme");
      v17 = "ProxySession <%{public}@> Invalid URL scheme for background tasks: %@. Valid schemes are http or https";
LABEL_19:
      _os_log_impl(&dword_183ECA000, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);
    }
  }
  else if (v15)
  {
    v18 = *(_QWORD *)(v3 + 128);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = objc_msgSend((id)objc_msgSend(Property, "URL"), "scheme");
    v17 = "BackgroundSession <%{public}@> Invalid URL scheme for background tasks: %@. Valid schemes are http or https";
    goto LABEL_19;
  }
  v19 = (void *)MEMORY[0x1E0CB35C8];
  v20 = objc_msgSend(Property, "URL");
  v21 = (void *)objc_msgSend(v19, "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1002, v20);
  v22 = (objc_class *)objc_opt_class();
  result = (__NSCFBackgroundDataTask *)-[__NSURLBackgroundSession _onqueue_dummyTaskForClass:withRequest:error:]((_QWORD *)v3, v22, v21);
LABEL_28:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

void __62____NSURLBackgroundSession__onqueue_dataTaskWithTaskForClass___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 112);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v7 = CFNLog::logger;
  v8 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (!v8)
      goto LABEL_11;
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v9 = *(_QWORD *)(v9 + 128);
    *(_DWORD *)v17 = 138543618;
    *(_QWORD *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2112;
    *(_QWORD *)&v17[14] = a2;
    v10 = "ProxySession <%{public}@> error requesting a NSURLSessionDataTask from background transfer daemon: %@";
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      v16 = *(_QWORD *)(v16 + 128);
    *(_DWORD *)v17 = 138543618;
    *(_QWORD *)&v17[4] = v16;
    *(_WORD *)&v17[12] = 2112;
    *(_QWORD *)&v17[14] = a2;
    v10 = "BackgroundSession <%{public}@> error requesting a NSURLSessionDataTask from background transfer daemon: %@";
  }
  _os_log_error_impl(&dword_183ECA000, v7, OS_LOG_TYPE_ERROR, v10, v17, 0x16u);
LABEL_11:
  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v13 = objc_msgSend(*(id *)(a1 + 48), "URL", *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
  if (v12)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v13);
    if (!v11)
      return;
  }
  else
  {
    v15 = 0;
    if (!v11)
      return;
  }
  objc_setProperty_atomic(v11, v14, v15, 776);
}

void __62____NSURLBackgroundSession__onqueue_dataTaskWithTaskForClass___block_invoke_95(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *v6;

  if ((a2 & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = objc_msgSend(*(id *)(a1 + 48), "URL");
    if (v3)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, v4);
      if (!v2)
        return;
    }
    else
    {
      v6 = 0;
      if (!v2)
        return;
    }
    objc_setProperty_atomic(v2, v5, v6, 776);
  }
}

uint64_t __59____NSURLBackgroundSession__useTLSSessionCacheFromSession___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)-[__NSURLBackgroundSession ensureRemoteSession](*(_QWORD *)(a1 + 32)), "setTLSSessionCachePrefix:", objc_msgSend(*(id *)(a1 + 32), "_tlsSessionCachePrefix"));
}

uint64_t __63____NSURLBackgroundSession_appWasLaunchedForBackgroundSession___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 112);
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v5 = CFNLog::logger;
  v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        v7 = *(_QWORD *)(v7 + 128);
      v11 = 138543362;
      v12 = v7;
      v8 = "ProxySession <%{public}@> client was launched for background session";
LABEL_14:
      _os_log_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v6)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v9 = *(_QWORD *)(v9 + 128);
    v11 = 138543362;
    v12 = v9;
    v8 = "BackgroundSession <%{public}@> client was launched for background session";
    goto LABEL_14;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 281) = 1;
  return -[__NSURLBackgroundSession ensureRemoteSession](*(_QWORD *)(a1 + 32));
}

uint64_t __47____NSURLBackgroundSession_cameIntoForeground___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 112);
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v5 = CFNLog::logger;
  v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        v7 = *(_QWORD *)(v7 + 128);
      *(_DWORD *)v11 = 138543362;
      *(_QWORD *)&v11[4] = v7;
      v8 = "ProxySession <%{public}@> client transitioning to foreground";
LABEL_14:
      _os_log_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEFAULT, v8, v11, 0xCu);
    }
  }
  else if (v6)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v9 = *(_QWORD *)(v9 + 128);
    *(_DWORD *)v11 = 138543362;
    *(_QWORD *)&v11[4] = v9;
    v8 = "BackgroundSession <%{public}@> client transitioning to foreground";
    goto LABEL_14;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 281) = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "remoteObjectProxy", *(_OWORD *)v11), "boost");
  return -[__NSURLBackgroundSession ensureRemoteSession](*(_QWORD *)(a1 + 32));
}

uint64_t __45____NSURLBackgroundSession_wentToBackground___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 112);
  else
    v3 = 0;
  v4 = objc_msgSend(v3, "_isProxySession");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v5 = CFNLog::logger;
  v6 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        v7 = *(_QWORD *)(v7 + 128);
      v11 = 138543362;
      v12 = v7;
      v8 = "ProxySession <%{public}@> client transitioning to background";
LABEL_14:
      _os_log_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v6)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v9 = *(_QWORD *)(v9 + 128);
    v11 = 138543362;
    v12 = v9;
    v8 = "BackgroundSession <%{public}@> client transitioning to background";
    goto LABEL_14;
  }
  -[__NSURLBackgroundSession ensureRemoteSession](*(_QWORD *)(a1 + 32));
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "remoteObjectProxy"), "dropBoost");
}

void __95____NSURLBackgroundSession_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 168) && *(_DWORD *)(v2 + 284))
  {
    -[__NSURLBackgroundSession setupXPCConnection](v2);
    -[__NSURLBackgroundSession setupBackgroundSession](*(_QWORD *)(a1 + 32));
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v3 + 216))
      -[__NSURLBackgroundSession sendInvalidationRequest](v3);
  }
}

@end
