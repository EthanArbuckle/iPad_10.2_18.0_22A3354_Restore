@implementation IMCommSafetyRequestsManager

+ (void)initialize
{
  objc_opt_class();
}

+ (id)sharedManager
{
  if (qword_1ECFC7130 != -1)
    dispatch_once(&qword_1ECFC7130, &unk_1E3FB36A8);
  return (id)qword_1ECFC7158;
}

- (IMCommSafetyRequestsManager)init
{
  IMCommSafetyRequestsManager *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  void *v5;
  id v6;
  id userSafetyClient;
  NSObject *v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *cachedResults;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)IMCommSafetyRequestsManager;
  v2 = -[IMCommSafetyRequestsManager init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->operationQueue;
    v2->operationQueue = v3;

    dispatch_get_global_queue(2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setUnderlyingQueue:](v2->operationQueue, "setUnderlyingQueue:", v5);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->operationQueue, "setMaxConcurrentOperationCount:", 5);
    v6 = objc_alloc_init((Class)MEMORY[0x1A1AE7D4C](CFSTR("USSensitivityAnalyzer"), CFSTR("UserSafety")));
    userSafetyClient = v2->_userSafetyClient;
    v2->_userSafetyClient = v6;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = v2->_userSafetyClient;
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Initialized USSensitivityAnalyzer %@", buf, 0xCu);
      }

    }
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedResults = v2->_cachedResults;
    v2->_cachedResults = v10;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_service)
  {
    -[IMCommSafetyRequestsManager service](self, "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAllRequests");

  }
  v4.receiver = self;
  v4.super_class = (Class)IMCommSafetyRequestsManager;
  -[IMCommSafetyRequestsManager dealloc](&v4, sel_dealloc);
}

- (MADService)service
{
  MADService *service;
  void *v4;
  id v5;
  MADService *v6;
  MADService *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  service = self->_service;
  if (!service)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)qword_1EE503EE8;
    v13 = qword_1EE503EE8;
    if (!qword_1EE503EE8)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = sub_19E2AA2AC;
      v9[3] = &unk_1E3FB4F80;
      v9[4] = &v10;
      sub_19E2AA2AC((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v5, "service");
    v6 = (MADService *)objc_claimAutoreleasedReturnValue();
    v7 = self->_service;
    self->_service = v6;

    service = self->_service;
  }
  return service;
}

- (id)_identifierForURL:(id)a3 withChatID:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;

  v5 = a3;
  v6 = (__CFString *)a4;
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMSharedHelperMD5HashOfFileAtPath((uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v6)
    v11 = v6;
  else
    v11 = CFSTR("<unknown>");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_setSensitiveValue:(BOOL)a3 forIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  -[IMCommSafetyRequestsManager cachedResults](self, "cachedResults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (void)isSensitiveImage:(id)a3 withChatID:(id)a4 completionHandler:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_isSensitiveContent_withChatID_completionHandler_);
}

- (void)isSensitiveContent:(id)a3 withChatID:(id)a4 completionHandler:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_isSensitiveContent_contentAttachmentType_withChatID_completionHandler_);
}

- (void)isSensitiveContent:(id)a3 contentAttachmentType:(int64_t)a4 withChatID:(id)a5 completionHandler:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel_isSensitiveContent_contentAttachmentType_useBlastDoor_withChatID_completionHandler_);
}

- (void)isSensitiveContent:(id)a3 contentAttachmentType:(int64_t)a4 useBlastDoor:(BOOL)a5 withChatID:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSOperationQueue *operationQueue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  IMCommSafetyRequestsManager *v21;
  id v22;
  id v23;
  int64_t v24;
  BOOL v25;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  operationQueue = self->operationQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_19E2A940C;
  v19[3] = &unk_1E3FB6FA8;
  v20 = v12;
  v21 = self;
  v22 = v13;
  v23 = v14;
  v24 = a4;
  v25 = a5;
  v16 = v13;
  v17 = v14;
  v18 = v12;
  -[NSOperationQueue addOperationWithBlock:](operationQueue, "addOperationWithBlock:", v19);

}

- (id)cachedResultForContentAttachment:(id)a3 withChatID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[IMCommSafetyRequestsManager _identifierForURL:withChatID:](self, "_identifierForURL:withChatID:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMCommSafetyRequestsManager cachedResults](self, "cachedResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && !v10)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "absoluteString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412546;
          v17 = v12;
          v18 = 2112;
          v19 = v7;
          _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Failed to retrieve cached result for fileURL '%@' and chatID '%@", (uint8_t *)&v16, 0x16u);

        }
      }
      -[IMCommSafetyRequestsManager cachedResults](self, "cachedResults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMCommSafetyRequestsManager _identifierForURL:withChatID:](self, "_identifierForURL:withChatID:", v6, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)isSensitiveCGImage:(CGImage *)a3 withOrientation:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  -[IMCommSafetyRequestsManager userSafetyClient](self, "userSafetyClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19E2AA174;
  v11[3] = &unk_1E3FB6FD0;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "analyzeCGImage:withOrientation:completionHandler:", a3, v5, v11);

}

- (BOOL)_shouldForceSensitivityResult
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  +[IMDefaults sharedInstance](IMDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueFromDomain:forKey:", CFSTR("com.apple.messages"), CFSTR("kMarkSensitiveKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  if (v4 == 1)
  {
    +[IMDefaults sharedInstance](IMDefaults, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forDomain:forKey:", &unk_1E3FFE558, CFSTR("com.apple.messages"), CFSTR("kMarkSensitiveKey"));

  }
  return v4 != 0;
}

- (id)userSafetyClient
{
  return self->_userSafetyClient;
}

- (void)setUserSafetyClient:(id)a3
{
  objc_storeStrong(&self->_userSafetyClient, a3);
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSMutableDictionary)cachedResults
{
  return self->_cachedResults;
}

- (void)setCachedResults:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong(&self->_userSafetyClient, 0);
  objc_storeStrong((id *)&self->operationQueue, 0);
}

@end
