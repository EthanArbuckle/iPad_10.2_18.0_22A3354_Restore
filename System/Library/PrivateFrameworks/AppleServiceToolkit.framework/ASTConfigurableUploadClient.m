@implementation ASTConfigurableUploadClient

- (NSArray)uploadStatus
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ASTConfigurableUploadClient taskMap](self, "taskMap", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "metaInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v11;
}

- (ASTConfigurableUploadClient)initWithASTSession:(id)a3 withURLSession:(id)a4 withURLRequestFactory:(id)a5 withDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ASTConfigurableUploadClient *v14;
  ASTConfigurableUploadClient *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *taskMap;
  NSURLSession *v18;
  void *urlSession;
  void *v20;
  uint64_t v21;
  NSURLSession *v22;
  NSObject *v23;
  uint8_t v25[16];
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ASTConfigurableUploadClient;
  v14 = -[ASTConfigurableUploadClient init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_session, v10);
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    taskMap = v15->_taskMap;
    v15->_taskMap = v16;

    objc_storeStrong((id *)&v15->_urlFactory, a5);
    if (v11)
    {
      v18 = (NSURLSession *)v11;
      urlSession = v15->_urlSession;
      v15->_urlSession = v18;
    }
    else
    {
      v20 = (void *)MEMORY[0x24BDD1850];
      objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
      urlSession = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sessionWithConfiguration:delegate:delegateQueue:", urlSession, v15, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v15->_urlSession;
      v15->_urlSession = (NSURLSession *)v21;

    }
    objc_storeWeak((id *)&v15->_delegate, v13);
    ASTLogHandleForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_22D91B000, v23, OS_LOG_TYPE_DEFAULT, "[Uploader] Started a new upload session on AST Session", v25, 2u);
    }

  }
  return v15;
}

- (ASTConfigurableUploadClient)initWithASTSession:(id)a3 withDelegate:(id)a4
{
  id v6;
  id v7;
  ASTConfigurableUploadClient *v8;
  ASTConfigurableUploadClient *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *taskMap;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURLSession *urlSession;
  NSObject *v16;
  uint8_t v18[16];
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ASTConfigurableUploadClient;
  v8 = -[ASTConfigurableUploadClient init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_session, v6);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    taskMap = v9->_taskMap;
    v9->_taskMap = v10;

    v12 = (void *)MEMORY[0x24BDD1850];
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessionWithConfiguration:delegate:delegateQueue:", v13, v9, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    urlSession = v9->_urlSession;
    v9->_urlSession = (NSURLSession *)v14;

    objc_storeWeak((id *)&v9->_delegate, v7);
    ASTLogHandleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_22D91B000, v16, OS_LOG_TYPE_DEFAULT, "[Uploader] Started a new upload session on AST Session", v18, 2u);
    }

  }
  return v9;
}

- (ASTConfigurableUploadClient)initWithURLSession:(id)a3 withURLRequestFactory:(id)a4 withDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASTConfigurableUploadClient *v11;
  ASTConfigurableUploadClient *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *taskMap;
  NSURLSession *v15;
  void *urlSession;
  void *v17;
  uint64_t v18;
  NSURLSession *v19;
  NSObject *v20;
  uint8_t v22[16];
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ASTConfigurableUploadClient;
  v11 = -[ASTConfigurableUploadClient init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_session, 0);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    taskMap = v12->_taskMap;
    v12->_taskMap = v13;

    objc_storeStrong((id *)&v12->_urlFactory, a4);
    if (v8)
    {
      v15 = (NSURLSession *)v8;
      urlSession = v12->_urlSession;
      v12->_urlSession = v15;
    }
    else
    {
      v17 = (void *)MEMORY[0x24BDD1850];
      objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
      urlSession = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sessionWithConfiguration:delegate:delegateQueue:", urlSession, v12, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v12->_urlSession;
      v12->_urlSession = (NSURLSession *)v18;

    }
    objc_storeWeak((id *)&v12->_delegate, v10);
    ASTLogHandleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_22D91B000, v20, OS_LOG_TYPE_DEFAULT, "[Uploader] Started a new upload session on AST Session", v22, 2u);
    }

  }
  return v12;
}

- (unint64_t)uploadWithObject:(id)a3 andExtra:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  ASTUploadItem *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  ASTUploadItem *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  NSObject *v54;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  uint8_t buf[8];
  uint64_t v64;
  id v65;
  _QWORD v66[6];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;

  v6 = a3;
  v7 = a4;
  -[ASTConfigurableUploadClient urlFactory](self, "urlFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "urlRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__4;
  v71 = __Block_byref_object_dispose__4;
  v72 = 0;
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __57__ASTConfigurableUploadClient_uploadWithObject_andExtra___block_invoke;
  v66[3] = &unk_24F96A378;
  v66[4] = self;
  v66[5] = &v67;
  v10 = (void *)MEMORY[0x22E31C3E0](v66);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v6;
    -[ASTConfigurableUploadClient urlSession](self, "urlSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uploadTaskWithRequest:fromFile:completionHandler:", v9, v11, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = [ASTUploadItem alloc];
    objc_msgSend(v9, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ASTUploadItem initWithDestinationUrl:andSourceUrl:andTask:](v14, "initWithDestinationUrl:andSourceUrl:andTask:", v15, v11, v13);
    v17 = (void *)v68[5];
    v68[5] = v16;

    v65 = 0;
    v18 = *MEMORY[0x24BDBCC48];
    v64 = 0;
    objc_msgSend(v11, "getResourceValue:forKey:error:", &v65, v18, &v64);
    v19 = v65;
LABEL_5:
    v26 = v19;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "taskIdentifier"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "containsObject:", CFSTR("name")))
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v26;
    if (objc_msgSend(v28, "containsObject:", CFSTR("id")))
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("id"));
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "allKeys");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v10;
    if (objc_msgSend(v29, "containsObject:", CFSTR("sig")))
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sig"));
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "allKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "containsObject:", CFSTR("pubKeyDigest")))
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pubKeyDigest"));
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v9;

    objc_msgSend(v7, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "containsObject:", CFSTR("cert")))
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cert"));
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v68[5], "metaInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v61, CFSTR("id"));

    objc_msgSend((id)v68[5], "metaInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v62, CFSTR("name"));

    objc_msgSend((id)v68[5], "metaInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v60, CFSTR("sig"));

    objc_msgSend((id)v68[5], "metaInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v31, CFSTR("pubKeyDigest"));

    objc_msgSend((id)v68[5], "metaInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v34, CFSTR("cert"));

    objc_msgSend((id)v68[5], "metaInfo");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", CFSTR("QUEUED"), CFSTR("status"));

    objc_msgSend((id)v68[5], "metaInfo");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v59, CFSTR("size"));

    objc_msgSend(v32, "URL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "absoluteString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v68[5], "metaInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, CFSTR("uploadUrl"));

    -[ASTConfigurableUploadClient taskMap](self, "taskMap");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKey:", v68[5], v58);

    objc_msgSend(v13, "resume");
    objc_msgSend((id)v68[5], "metaInfo");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKeyedSubscript:", CFSTR("UPLOADING"), CFSTR("status"));

    -[ASTConfigurableUploadClient delegate](self, "delegate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      -[ASTConfigurableUploadClient delegate](self, "delegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_opt_respondsToSelector();

      if ((v49 & 1) != 0)
      {
        -[ASTConfigurableUploadClient delegate](self, "delegate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v13, "taskIdentifier");
        objc_msgSend(v32, "URL");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "ASTUploadClient:didStartFileUploadWithId:andUrl:", self, v51, v52);

      }
    }
    v53 = objc_msgSend(v13, "taskIdentifier", v56);

    v9 = v32;
    v10 = v57;
    v54 = v59;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v6;
    -[ASTConfigurableUploadClient urlSession](self, "urlSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uploadTaskWithRequest:fromData:completionHandler:", v9, v20, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = [ASTUploadItem alloc];
    objc_msgSend(v9, "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[ASTUploadItem initWithDestinationUrl:andSourceData:andTask:](v22, "initWithDestinationUrl:andSourceData:andTask:", v23, v20, v13);
    v25 = (void *)v68[5];
    v68[5] = v24;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v20, "length"));
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  ASTLogHandleForCategory(1);
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D91B000, v54, OS_LOG_TYPE_DEFAULT, "[Uploader] Failed to create task for upload file", buf, 2u);
  }
  v13 = 0;
  v53 = -1;
LABEL_27:

  _Block_object_dispose(&v67, 8);
  return v53;
}

void __57__ASTConfigurableUploadClient_uploadWithObject_andExtra___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ASTLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "task");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "taskIdentifier");
    objc_msgSend(v6, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218754;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[Uploader] Completed upload task for upload file [%li - %@] with response: %@ and error: %@.", (uint8_t *)&v14, 0x2Au);

  }
  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "task");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uploadTaskDidComplete:withResponse:andError:", objc_msgSend(v13, "taskIdentifier"), v6, v7);

}

- (void)cancelUploadWithId:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  unint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTConfigurableUploadClient taskMap](self, "taskMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "task");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancel");

    ASTLogHandleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "task");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "originalRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134218242;
      v15 = a3;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_22D91B000, v9, OS_LOG_TYPE_DEFAULT, "[Uploader] Canceled task for upload file [%li - %@]", (uint8_t *)&v14, 0x16u);

    }
    -[ASTConfigurableUploadClient taskMap](self, "taskMap");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v13, "removeObjectForKey:", v5);
  }
  else
  {
    ASTLogHandleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = a3;
      _os_log_impl(&dword_22D91B000, v13, OS_LOG_TYPE_DEFAULT, "[Uploader] No task exist for upload file (%li), failed to cancel", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (void)uploadTaskDidComplete:(unint64_t)a3 withResponse:(id)a4 andError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  unint64_t v51;
  __CFString *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _QWORD v58[2];
  _QWORD v59[2];
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[ASTConfigurableUploadClient taskMap](self, "taskMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "destinationUrl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("FAILED");
  v15 = v8;
  v16 = v15;
  if (!v15)
  {
    v52 = v14;
    if (v9)
      goto LABEL_30;
LABEL_8:
    if (v12)
      objc_msgSend(v12, "setIsComplete:", 1);
    objc_msgSend(v12, "metaInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v52, CFSTR("status"));
    goto LABEL_35;
  }
  v17 = objc_msgSend(v15, "statusCode");
  if (v17 > 399)
  {
    v18 = CFSTR("Upload failed with status: %ld. Bad request made.");
    v52 = v14;
    switch(v17)
    {
      case 400:
        break;
      case 401:
        v18 = CFSTR("Upload failed with status: %ld. Unauthorized access.");
        goto LABEL_24;
      case 402:
      case 405:
      case 406:
      case 407:
      case 408:
      case 409:
        goto LABEL_17;
      case 403:
        v18 = CFSTR("Upload failed with status: %ld. Action is forbidden.");
        goto LABEL_24;
      case 404:
        v18 = CFSTR("Upload failed with status: %ld. Item not found.");
        goto LABEL_24;
      case 410:
        v18 = CFSTR("Upload failed with status: %ld. Version mismatch.");
        goto LABEL_24;
      default:
        switch(v17)
        {
          case 499:
            v18 = CFSTR("Upload failed with status: %ld. Client timed out.");
            break;
          case 500:
            v18 = CFSTR("Upload failed with status: %ld. Remote server error.");
            break;
          case 502:
            v18 = CFSTR("Upload failed with status: %ld. Bad gateway.");
            break;
          case 503:
            v18 = CFSTR("Upload failed with status: %ld. Remote server unavailable.");
            break;
          default:
            goto LABEL_17;
        }
        goto LABEL_24;
    }
  }
  else
  {
    switch(v17)
    {
      case 200:
        v52 = CFSTR("SUCCESSFUL");

        v18 = CFSTR("Upload complete with status: %ld");
        break;
      case 202:
        v52 = CFSTR("SUCCESSFUL");

        v18 = CFSTR("Upload complete with status: %ld. Item was added to an async scan queue.");
        break;
      case 204:
        v52 = CFSTR("SUCCESSFUL");

        v18 = CFSTR("Upload complete with status: %ld. Item was previously added to an async scan queue.");
        break;
      default:
LABEL_17:
        v18 = CFSTR("Upload failed with status: %ld. Unhandled response from server.");
LABEL_24:
        v52 = v14;
        break;
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v18, objc_msgSend(v16, "statusCode"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  ASTLogHandleForCategory(1);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v20;
    _os_log_impl(&dword_22D91B000, v21, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  if ((-[__CFString isEqualToString:](v52, "isEqualToString:", CFSTR("SUCCESSFUL")) & 1) == 0)
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v58[0] = CFSTR("httpResponseCode");
    v50 = v12;
    v23 = v14;
    v24 = v13;
    v25 = v9;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v16, "statusCode"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = CFSTR("errorDetails");
    v59[0] = v26;
    v59[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -5000, v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v13 = v24;
    v14 = v23;
    v12 = v50;

    v9 = (id)v28;
  }

  if (!v9)
    goto LABEL_8;
LABEL_30:
  if (v12)
    objc_msgSend(v12, "setIsFailed:", 1);
  objc_msgSend(v12, "metaInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v14, CFSTR("status"));

  -[ASTConfigurableUploadClient delegate](self, "delegate");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    -[ASTConfigurableUploadClient delegate](self, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_opt_respondsToSelector();

    if ((v33 & 1) != 0)
    {
      -[ASTConfigurableUploadClient delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ASTUploadClient:fileUploadWasInterrupted:andUrl:withError:", self, v51, v13, v9);
LABEL_35:

    }
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[ASTConfigurableUploadClient taskMap](self, "taskMap");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "allValues");
  v35 = objc_claimAutoreleasedReturnValue();

  v36 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v54 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        if ((objc_msgSend(v40, "isComplete") & 1) == 0 && !objc_msgSend(v40, "isFailed"))
        {
          v41 = v9;
          v42 = 0;
          goto LABEL_48;
        }
      }
      v37 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      if (v37)
        continue;
      break;
    }
  }
  v41 = v9;

  v42 = 1;
  ASTLogHandleForCategory(1);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D91B000, v35, OS_LOG_TYPE_DEFAULT, "[Uploader] All upload tasks completed", buf, 2u);
    v42 = 1;
  }
LABEL_48:

  -[ASTConfigurableUploadClient delegate](self, "delegate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[ASTConfigurableUploadClient delegate](self, "delegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_opt_respondsToSelector();

    if ((v45 & 1) != 0)
    {
      -[ASTConfigurableUploadClient delegate](self, "delegate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "ASTUploadClient:didCompleteFileUploadWithId:andUrl:", self, v51, v13);

    }
    if (v42)
    {
      -[ASTConfigurableUploadClient delegate](self, "delegate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_opt_respondsToSelector();

      if ((v48 & 1) != 0)
      {
        -[ASTConfigurableUploadClient delegate](self, "delegate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "ASTUploadClientDidCompleteFileUpload:", self);

      }
    }
  }

}

- (void)cancelAll
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ASTConfigurableUploadClient taskMap](self, "taskMap", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isComplete") & 1) == 0)
        {
          objc_msgSend(v8, "task");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "cancel");

          objc_msgSend(v8, "setIsComplete:", 1);
          objc_msgSend(v8, "metaInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("UPLOADING"), CFSTR("status"));

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  __CFString **v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a4;
  -[ASTConfigurableUploadClient taskMap](self, "taskMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v21, "taskIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = ASTUploadStatusSuccessful;
  if (a5)
    v10 = ASTUploadStatusUploading;
  v11 = *v10;
  objc_msgSend(v9, "metaInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("status"));

  if (!a5)
  {
    -[ASTConfigurableUploadClient delegate](self, "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[ASTConfigurableUploadClient delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[ASTConfigurableUploadClient delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v21, "taskIdentifier");
        objc_msgSend(v21, "originalRequest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "ASTUploadClient:fileUploadWasInterrupted:andUrl:withError:", self, v18, v20, 0);

      }
    }
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  -[ASTConfigurableUploadClient delegate](self, "delegate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[ASTConfigurableUploadClient delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[ASTConfigurableUploadClient delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v19, "taskIdentifier");
      objc_msgSend(v19, "originalRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ASTUploadClient:fileUploadStatusForId:andUrl:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:", self, v16, v18, a5, a6, a7);

    }
  }

}

- (ASTSession)session
{
  return (ASTSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (ASTUploadClientDelegate)delegate
{
  return (ASTUploadClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)taskMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTaskMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (NSURLRequestFactory)urlFactory
{
  return self->_urlFactory;
}

- (void)setUrlFactory:(id)a3
{
  objc_storeStrong((id *)&self->_urlFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlFactory, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_taskMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_session);
}

@end
