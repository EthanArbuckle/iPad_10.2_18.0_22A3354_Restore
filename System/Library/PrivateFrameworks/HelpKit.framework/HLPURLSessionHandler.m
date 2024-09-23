@implementation HLPURLSessionHandler

+ (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&gHLPRootViewController, a3);
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_1 != -1)
    dispatch_once(&sharedInstance_predicate_1, &__block_literal_global_5);
  return (id)sharedInstance_gHLPURLSessionHandler;
}

void __38__HLPURLSessionHandler_sharedInstance__block_invoke()
{
  HLPURLSessionHandler *v0;
  void *v1;

  v0 = objc_alloc_init(HLPURLSessionHandler);
  v1 = (void *)sharedInstance_gHLPURLSessionHandler;
  sharedInstance_gHLPURLSessionHandler = (uint64_t)v0;

}

- (HLPURLSessionHandler)init
{
  HLPURLSessionHandler *v2;
  uint64_t v3;
  NSIndexSet *excludeCachingDataTypes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HLPURLSessionHandler;
  v2 = -[HLPURLSessionHandler init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 1);
    v3 = objc_claimAutoreleasedReturnValue();
    excludeCachingDataTypes = v2->_excludeCachingDataTypes;
    v2->_excludeCachingDataTypes = (NSIndexSet *)v3;

  }
  return v2;
}

- (id)cacheControllerForDataType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  -[__objc2_class sharedInstance](*off_24D32F218[a3 - 1], "sharedInstance", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)URLSessionManagerSessionOperationQueue:(id)a3
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDD1710]);
  objc_msgSend(v3, "setMaxConcurrentOperationCount:", 4);
  return v3;
}

- (id)URLSessionManagerSessionConfiguration:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1800]), "initWithMemoryCapacity:diskCapacity:diskPath:", 0, 26214400, CFSTR("com.apple.helpkit"));
  objc_msgSend(MEMORY[0x24BDD1800], "setSharedURLCache:", v3);
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setURLCache:", v3);

  return v4;
}

- (BOOL)URLSessionManagerShouldCoalesceRequest:(id)a3
{
  return 0;
}

- (void)URLSessionManagerRequestResumed:(id)a3 sessionTask:(id)a4
{
  ++gNetworkActivityIndicatorCount;
}

- (void)URLSessionManagerRequestCompleted:(id)a3 sessionTask:(id)a4
{
  if (gNetworkActivityIndicatorCount >= 1)
    --gNetworkActivityIndicatorCount;
}

- (void)sessionTask:(id)a3 willCacheResponse:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, _QWORD);
  id v9;
  id v10;

  v10 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  if (-[NSIndexSet containsIndex:](self->_excludeCachingDataTypes, "containsIndex:", objc_msgSend(a3, "dataType")))
    v9 = v10;
  else
    v9 = 0;
  ((void (**)(id, id))v8)[2](v8, v9);

}

- (void)sessionTask:(id)a3 willPerformHTTPRedirection:(id)a4 newRequest:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (self->_shouldDisallowOffsiteRedirects
    && (objc_msgSend(v12, "URL"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "host"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "hasSuffix:", CFSTR(".apple.com")),
        v15,
        v14,
        (v16 & 1) == 0))
  {
    HLPLogForCategory(1uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "absoluteString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v20;
      _os_log_impl(&dword_2153AA000, v18, OS_LOG_TYPE_DEFAULT, "Rejecting off-site redirect: %@", (uint8_t *)&v23, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("about:blank"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v22);

  }
  else
  {
    HLPLogForCategory(1uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[HLPURLSessionHandler sessionTask:willPerformHTTPRedirection:newRequest:completionHandler:].cold.1(v11, v12, v17);

    v13[2](v13, v12);
  }

}

- (BOOL)shouldCacheToDiskForSessionTask:(id)a3
{
  return !-[NSIndexSet containsIndex:](self->_excludeCachingDataTypes, "containsIndex:", objc_msgSend(a3, "dataType"));
}

- (id)processJSONFormattedDataForCDSError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("errorDetail"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("errorCode"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "integerValue");

      objc_msgSend(v4, "objectForKey:", CFSTR("errorMessage"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = 0;
      if (v6 >= 1 && v7)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v7, v6, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)sessionTask:(id)a3 didFinishDownloadingToURL:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "dataType");
  -[HLPURLSessionHandler cacheControllerForDataType:](self, "cacheControllerForDataType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataCacheForIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "downloadTaskTotalBytes");
  if (!v9)
  {
    v19 = (void *)MEMORY[0x24BDBCE50];
    objc_msgSend(v7, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dataWithContentsOfFile:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  v13 = v12;
  v30 = v11;
  objc_msgSend(v6, "response");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "statusCode");

  v16 = v7;
  v29 = v7;
  if (v8 != 1)
  {
    v17 = 0;
    v18 = 0;
LABEL_7:
    if (v15 != 200)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Unknown error"), v15, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_9;
  }
  objc_msgSend(v9, "formattedDataWithFileURL:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPURLSessionHandler processJSONFormattedDataForCDSError:](self, "processJSONFormattedDataForCDSError:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_7;
LABEL_9:
  if (v18)
  {
    objc_msgSend(v6, "setDataError:", v18);
    v21 = v17;
    v22 = v16;
    v11 = v30;
  }
  else
  {
    v28 = v13;
    if (-[HLPURLSessionHandler shouldCacheToDiskForSessionTask:](self, "shouldCacheToDiskForSessionTask:", v6))
    {
      objc_msgSend(v6, "lastModified");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v13;
      v25 = (void *)v23;
      objc_msgSend(v9, "saveFileURL:identifier:fileSize:lastModified:dataCache:", v16, v10, v24, v23, v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      HLPLogForCategory(1uLL);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[HLPURLSessionHandler sessionTask:didFinishDownloadingToURL:].cold.1((uint64_t)v22, v26, v27);

    }
    else
    {
      v22 = v16;
    }
    v11 = v30;
    if (v8 == 1)
    {
      v21 = v17;
    }
    else
    {
      objc_msgSend(v9, "formattedDataWithFileURL:", v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == 4 && !self->_shouldIgnoreInMemoryCaching)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "addInMemoryCacheForImage:identifier:cost:", v21, v10, v28);
      }
    }
  }

  v7 = v29;
LABEL_23:
  objc_msgSend(v6, "setFormattedData:", v21);

}

- (void)sessionTask:(id)a3 didReceiveResponse:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, uint64_t);
  uint64_t v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, uint64_t))a5;
  v11 = objc_msgSend(v8, "dataType");
  v12 = -[HLPURLSessionHandler shouldCacheToDiskForSessionTask:](self, "shouldCacheToDiskForSessionTask:", v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
    objc_msgSend(v8, "setResponse:", v13);
    objc_msgSend(v8, "task");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HLPURLSessionHandler respectCachingForRequest:](self, "respectCachingForRequest:", v15);

    if (v12 && v16)
    {
      objc_msgSend(v13, "allHeaderFields");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Last-Modified"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setLastModified:", v18);
      if (v18 && !-[NSIndexSet containsIndex:](self->_excludeCachingDataTypes, "containsIndex:", v11))
      {
        -[HLPURLSessionHandler cacheControllerForDataType:](self, "cacheControllerForDataType:", v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dataCacheForIdentifier:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v21, "lastModified");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", v18);

          if (v23)
          {
            HLPLogForCategory(2uLL);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              -[HLPURLSessionHandler sessionTask:didReceiveResponse:completionHandler:].cold.1(v21, v24);

            objc_msgSend(v19, "cacheFileURLForDataCache:", v21);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "formattedDataWithFileURL:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setFormattedData:", v26);

            v27 = 1;
            objc_msgSend(v8, "setIsCacheData:", 1);
            v33[0] = MEMORY[0x24BDAC760];
            v33[1] = 3221225472;
            v33[2] = __73__HLPURLSessionHandler_sessionTask_didReceiveResponse_completionHandler___block_invoke;
            v33[3] = &unk_24D32EA90;
            v34 = v21;
            v35 = v19;
            v28 = v19;
            v29 = v21;
            dispatch_async(MEMORY[0x24BDAC9B8], v33);

LABEL_19:
            v30 = 0;
            goto LABEL_14;
          }
        }

      }
      if ((v11 & 0xFFFFFFFFFFFFFFFELL) != 4
        || (objc_msgSend(v13, "allHeaderFields"),
            v31 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend((id)v31, "objectForKeyedSubscript:", CFSTR("Content-Type")),
            v32 = (void *)objc_claimAutoreleasedReturnValue(),
            (id)v31,
            LOBYTE(v31) = objc_msgSend(v32, "containsString:", CFSTR("text/html")),
            v32,
            (v31 & 1) == 0))
      {

        v27 = 0;
        v30 = 2;
        goto LABEL_14;
      }
      v27 = 0;
      goto LABEL_19;
    }

  }
  v27 = 0;
  if (v12)
    v30 = 2;
  else
    v30 = 1;
LABEL_14:
  v10[2](v10, v30, v27);

}

uint64_t __73__HLPURLSessionHandler_sessionTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUpdatedDate:", v2);

  return objc_msgSend(*(id *)(a1 + 40), "updateCache");
}

- (BOOL)respectCachingForRequest:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "cachePolicy");
  return v3 != 1 && v3 != 4;
}

- (void)sessionTask:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  HLPURLSessionHandler *v43;
  void *v44;
  _QWORD block[4];
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "task");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "statusCode");

    objc_msgSend(v8, "response");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v8, "response");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allHeaderFields");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Last-Modified"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLastModified:", v15);

    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v6, "dataTaskData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "task");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "originalRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[HLPURLSessionHandler respectCachingForRequest:](self, "respectCachingForRequest:", v18);
    if (v6 && v19 && objc_msgSend(v13, "statusCode") != 404)
    {
      v20 = objc_msgSend(v13, "statusCode") == 200 && v7 == 0;
      if (!v20 && v18)
      {
        v43 = self;
        v21 = v16;
        objc_msgSend(MEMORY[0x24BDD1800], "sharedURLCache");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cachedResponseForRequest:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "response");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v25 = objc_opt_isKindOfClass();

        if ((v25 & 1) != 0)
        {
          objc_msgSend(v23, "response");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v26, "statusCode") == 200)
          {
            objc_msgSend(v23, "data");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              v10 = objc_msgSend(v26, "statusCode");
              HLPLogForCategory(1uLL);
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v18, "URL");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v49 = v29;
                _os_log_impl(&dword_2153AA000, v28, OS_LOG_TYPE_DEFAULT, "Using cache data for request: %@", buf, 0xCu);

              }
              v30 = (void *)MEMORY[0x24BDBCEC8];
              objc_msgSend(v23, "data");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "dataWithData:", v31);
              v32 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v6, "setDataTaskData:", v32);
              objc_msgSend(v6, "setIsCacheData:", v32 != 0);
              v21 = (void *)v32;
            }
          }
        }
        else
        {
          v26 = v13;
        }

        v13 = v26;
        v16 = v21;
        self = v43;
      }
    }
    if (v10 == 200)
    {
      v33 = 0;
      if (!v6)
        goto LABEL_37;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Unknown error"), v10, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
LABEL_37:
        objc_msgSend(v6, "setDataError:", v33);

        goto LABEL_38;
      }
    }
    if (objc_msgSend(v16, "length"))
    {
      v44 = v16;
      v34 = objc_msgSend(v6, "dataType");
      objc_msgSend(v6, "dataError");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35 || v34 == 1)
      {
        v36 = objc_msgSend(v6, "dataType");
        -[HLPURLSessionHandler cacheControllerForDataType:](self, "cacheControllerForDataType:", v36);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "formattedDataWithData:", v44);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34 == 1)
        {
          -[HLPURLSessionHandler processJSONFormattedDataForCDSError:](self, "processJSONFormattedDataForCDSError:", v37);
          v38 = objc_claimAutoreleasedReturnValue();

          v33 = (void *)v38;
        }
        if (v36 == 4 && !self->_shouldIgnoreInMemoryCaching)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v6, "identifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addInMemoryCacheForImage:identifier:cost:", v37, v39, objc_msgSend(v44, "length"));

          }
        }

        if (v37)
        {
          objc_msgSend(v6, "setFormattedData:", v37);

        }
      }
      v16 = v44;
    }
    goto LABEL_37;
  }
LABEL_38:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__HLPURLSessionHandler_sessionTask_didCompleteWithError___block_invoke;
  block[3] = &unk_24D32EA90;
  v46 = v7;
  v47 = v8;
  v40 = v8;
  v41 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __57__HLPURLSessionHandler_sessionTask_didCompleteWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (objc_msgSend(v2, "code") != -999)
    {
      HLPLogForCategory(1uLL);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "currentRequest");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "URL");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v10 = v5;
        v11 = 2112;
        v12 = v6;
        _os_log_impl(&dword_2153AA000, v3, OS_LOG_TYPE_DEFAULT, "URLSession %@ failed with error, %@", buf, 0x16u);

      }
      +[HLPReachabilityManager defaultManager](HLPReachabilityManager, "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startNotifier");

    }
  }
  else
  {
    +[HLPReachabilityManager defaultManager](HLPReachabilityManager, "defaultManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopNotifier");

  }
}

- (void)URLSessionManagerDidReceiveChallenge:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  if (+[HLPCommonDefines isInternalBuild](HLPCommonDefines, "isInternalBuild")
    && objc_msgSend(v9, "previousFailureCount") < 4)
  {
    objc_msgSend(v9, "proposedCredential");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = 0;
      v8 = v6;
    }
    else
    {
      v7 = 1;
      v8 = 0;
    }
    ((void (**)(id, uint64_t, void *))v5)[2](v5, v7, v8);

  }
  else
  {
    v5[2](v5, 3, 0);
  }

}

- (void)sessionTask:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke;
  block[3] = &unk_24D32F1F8;
  v15 = v7;
  v16 = v9;
  v14 = v8;
  v10 = v7;
  v11 = v8;
  v12 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;

  if (!+[HLPCommonDefines isInternalBuild](HLPCommonDefines, "isInternalBuild"))
  {
    (*((void (**)(void))a1[6] + 2))();
    return;
  }
  objc_msgSend(a1[4], "protectionSpace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authenticationMethod");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD12D8]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD12E8]))
  {
    if (objc_msgSend(a1[4], "previousFailureCount") > 3)
    {
      objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Authentication Failed"), CFSTR("Please try again later."), 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDF67E8];
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_6;
      v25 = &unk_24D32F1A8;
      v26 = a1[6];
      objc_msgSend(v10, "actionWithTitle:style:handler:", CFSTR("OK"), 1, &v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAction:", v11, v22, v23, v24, v25);

      v12 = v26;
    }
    else
    {
      objc_msgSend(a1[4], "proposedCredential");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        v6 = objc_msgSend(a1[4], "previousFailureCount");

        if (v6 <= 1)
        {
          v7 = (void (**)(id, _QWORD, void *))a1[6];
          objc_msgSend(a1[4], "proposedCredential");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, 0, v8);

          goto LABEL_13;
        }
      }
      objc_msgSend(a1[5], "task");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "host");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Authentication Required"), v12, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addTextFieldWithConfigurationHandler:", &__block_literal_global_49);
      objc_msgSend(v16, "addTextFieldWithConfigurationHandler:", &__block_literal_global_52);
      v17 = MEMORY[0x24BDAC760];
      v18 = (void *)MEMORY[0x24BDF67E8];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_4;
      v30[3] = &unk_24D32F1A8;
      v31 = a1[6];
      objc_msgSend(v18, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAction:", v19);

      v20 = (void *)MEMORY[0x24BDF67E8];
      v27[0] = v17;
      v27[1] = 3221225472;
      v27[2] = __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_5;
      v27[3] = &unk_24D32F1D0;
      v9 = v16;
      v28 = v9;
      v29 = a1[6];
      objc_msgSend(v20, "actionWithTitle:style:handler:", CFSTR("Login In"), 0, v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAction:", v21);

    }
    if (v9)
    {
      objc_msgSend((id)gHLPRootViewController, "presentViewController:animated:completion:", v9, 1, 0);

    }
  }
LABEL_13:

}

uint64_t __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPlaceholder:", CFSTR("Name"));
}

void __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPlaceholder:", CFSTR("Password"));
  objc_msgSend(v2, "setSecureTextEntry:", 1);

}

uint64_t __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x24BDD1818]);
  objc_msgSend(v9, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithUser:password:persistence:", v6, v7, 2);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldIgnoreInMemoryCaching
{
  return self->_shouldIgnoreInMemoryCaching;
}

- (void)setShouldIgnoreInMemoryCaching:(BOOL)a3
{
  self->_shouldIgnoreInMemoryCaching = a3;
}

- (BOOL)shouldDisallowOffsiteRedirects
{
  return self->_shouldDisallowOffsiteRedirects;
}

- (void)setShouldDisallowOffsiteRedirects:(BOOL)a3
{
  self->_shouldDisallowOffsiteRedirects = a3;
}

- (NSIndexSet)excludeCachingDataTypes
{
  return self->_excludeCachingDataTypes;
}

- (void)setExcludeCachingDataTypes:(id)a3
{
  objc_storeStrong((id *)&self->_excludeCachingDataTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludeCachingDataTypes, 0);
}

- (void)sessionTask:(NSObject *)a3 willPerformHTTPRedirection:newRequest:completionHandler:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412546;
  v11 = v6;
  v12 = 2112;
  v13 = v8;
  OUTLINED_FUNCTION_0_0(&dword_2153AA000, a3, v9, "willPerform HTTP Redirect. Original: %@. Redirected: %@", (uint8_t *)&v10);

}

- (void)sessionTask:(uint64_t)a3 didFinishDownloadingToURL:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("Fail to save ");
  if (a1)
    v3 = CFSTR("Saved");
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a1;
  OUTLINED_FUNCTION_0_0(&dword_2153AA000, a2, a3, "%@ %@. ", (uint8_t *)&v4);
}

- (void)sessionTask:(void *)a1 didReceiveResponse:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_2153AA000, a2, OS_LOG_TYPE_DEBUG, "Data cache Last-Modified did not change, cancel request and use cache %@", (uint8_t *)&v4, 0xCu);

}

@end
