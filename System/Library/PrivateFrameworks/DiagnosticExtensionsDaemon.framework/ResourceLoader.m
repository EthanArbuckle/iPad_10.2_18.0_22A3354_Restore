@implementation ResourceLoader

+ (id)_rfc1123DateFormatter
{
  if (_rfc1123DateFormatter_onceToken != -1)
    dispatch_once(&_rfc1123DateFormatter_onceToken, &__block_literal_global_29);
  return (id)_rfc1123DateFormatter_formatter;
}

void __39__ResourceLoader__rfc1123DateFormatter__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_rfc1123DateFormatter_formatter;
  _rfc1123DateFormatter_formatter = (uint64_t)v0;

  objc_msgSend((id)_rfc1123DateFormatter_formatter, "setDateFormat:", CFSTR("EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"));
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("GMT"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_rfc1123DateFormatter_formatter, "setTimeZone:", v2);

}

+ (id)_localDateFormatter
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)_localDateFormatter_formatter;
  if (!_localDateFormatter_formatter)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v4 = (void *)_localDateFormatter_formatter;
    _localDateFormatter_formatter = (uint64_t)v3;

    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_localDateFormatter_formatter, "setTimeZone:", v5);

    objc_msgSend((id)_localDateFormatter_formatter, "setDateStyle:", 1);
    objc_msgSend((id)_localDateFormatter_formatter, "setTimeStyle:", 2);
    v2 = (void *)_localDateFormatter_formatter;
  }
  return v2;
}

- (ResourceLoader)init
{
  ResourceLoader *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ResourceLoader;
  v2 = -[ResourceLoader init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&stru_24D1E6AF0, "stringByAppendingPathComponent:", CFSTR("DeviceImages"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1800]), "initWithMemoryCapacity:diskCapacity:diskPath:", 0x400000, 52428800, v4);
    -[ResourceLoader setUrlCache:](v2, "setUrlCache:", v5);

    v6 = objc_alloc_init(MEMORY[0x24BDD1710]);
    -[ResourceLoader setQueue:](v2, "setQueue:", v6);

    -[ResourceLoader queue](v2, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQualityOfService:", 25);

    -[ResourceLoader urlCache](v2, "urlCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setURLCache:", v8);

    v9 = (void *)MEMORY[0x24BDD1850];
    -[ResourceLoader queue](v2, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionWithConfiguration:delegate:delegateQueue:", v3, v2, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ResourceLoader setSession:](v2, "setSession:", v11);

  }
  return v2;
}

- (void)refreshCacheForRequest:(id)a3 usingCachedResponse:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDBCF50];
  v11 = a4;
  objc_msgSend(v10, "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("verboseNetworking"));

  objc_msgSend(v11, "response");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "allHeaderFields");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(v8, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeoutInterval");
  objc_msgSend(v16, "requestWithURL:cachePolicy:timeoutInterval:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Last-Modified"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Etag"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v11 && v19 && v20)
  {
    objc_msgSend(v18, "setValue:forHTTPHeaderField:", v19, CFSTR("If-Modified-Since"));
    objc_msgSend(v18, "setValue:forHTTPHeaderField:", v21, CFSTR("If-None-Match"));
  }
  if (v13)
  {
    v22 = (void *)MEMORY[0x24BDD16A8];
    objc_msgSend(v18, "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ GET %@\n"), self, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "allHTTPHeaderFields");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v8, "allHTTPHeaderFields");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appendString:", v27);

    }
  }
  -[ResourceLoader session](self, "session");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __77__ResourceLoader_refreshCacheForRequest_usingCachedResponse_completionBlock___block_invoke;
  v32[3] = &unk_24D1E63C8;
  v32[4] = self;
  v33 = v18;
  v34 = v9;
  v29 = v9;
  v30 = v18;
  objc_msgSend(v28, "dataTaskWithRequest:completionHandler:", v30, v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "resume");
}

void __77__ResourceLoader_refreshCacheForRequest_usingCachedResponse_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  dispatch_time_t v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_simulatedLatency");
  v11 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v8;
    v13 = objc_msgSend(v12, "statusCode");
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("request"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v8)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, ResourceLoaderPayloadResponseKey);
  if (v9)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, ResourceLoaderPayloadErrorKey);
  v16 = objc_msgSend(v12, "statusCode");
  if (v7 && v16 == 200)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v7, ResourceLoaderPayloadDataKey);
  if (v13 != 200 && v13 != 304)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", ResourceLoaderErrorDomain, v13, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, ResourceLoaderPayloadErrorKey);

  }
  if (v11 <= 0.0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v18 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __77__ResourceLoader_refreshCacheForRequest_usingCachedResponse_completionBlock___block_invoke_2;
    v20[3] = &unk_24D1E4628;
    v22 = *(id *)(a1 + 48);
    v21 = v15;
    dispatch_after(v18, v19, v20);

  }
}

uint64_t __77__ResourceLoader_refreshCacheForRequest_usingCachedResponse_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)asynchronousDataFromURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ResourceLoader *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  void (**v37)(id, void *, uint64_t);
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  if (!objc_msgSend(v6, "isFileURL"))
  {
    -[ResourceLoader urlCache](self, "urlCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:cachePolicy:timeoutInterval:", v6, 0, 120.0);
    objc_msgSend(v10, "cachedResponseForRequest:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "response");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "allHeaderFields");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Expires"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      +[ResourceLoader _rfc1123DateFormatter](ResourceLoader, "_rfc1123DateFormatter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dateFromString:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v16;
      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        v19 = v18;
        objc_msgSend(v16, "timeIntervalSinceReferenceDate");
        v21 = v19 > v20;
        if (!v7)
          goto LABEL_13;
        goto LABEL_9;
      }
    }
    else
    {
      v17 = 0;
    }
    v21 = 1;
    if (!v7)
    {
LABEL_13:

      goto LABEL_14;
    }
LABEL_9:
    v32 = v17;
    objc_msgSend(v12, "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v38 = ResourceLoaderPayloadDataKey;
      objc_msgSend(v12, "data");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v31 = v10;
      v24 = v12;
      v25 = v13;
      v26 = v14;
      v27 = self;
      v28 = v21;
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, v29, 1);
      v21 = v28;
      self = v27;
      v14 = v26;
      v13 = v25;
      v12 = v24;
      v10 = v31;
    }
    v17 = v32;
    if (v21)
    {
      -[ResourceLoader queue](self, "queue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __58__ResourceLoader_asynchronousDataFromURL_completionBlock___block_invoke;
      v34[3] = &unk_24D1E4E98;
      v34[4] = self;
      v35 = v11;
      v36 = v12;
      v37 = v7;
      objc_msgSend(v30, "addOperationWithBlock:", v34);

      v17 = v32;
    }
    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataWithContentsOfFile:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = ResourceLoaderPayloadDataKey;
  v41[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v11, 1);
LABEL_14:

}

void __58__ResourceLoader_asynchronousDataFromURL_completionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__ResourceLoader_asynchronousDataFromURL_completionBlock___block_invoke_2;
  v4[3] = &unk_24D1E63F0;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "refreshCacheForRequest:usingCachedResponse:completionBlock:", v2, v3, v4);

}

uint64_t __58__ResourceLoader_asynchronousDataFromURL_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)flushCache
{
  id v2;

  -[ResourceLoader urlCache](self, "urlCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllCachedResponses");

}

- (double)_simulatedLatency
{
  if (_simulatedLatency_onceToken != -1)
    dispatch_once(&_simulatedLatency_onceToken, &__block_literal_global_49_1);
  return *(double *)&_simulatedLatency_retValue;
}

void __35__ResourceLoader__simulatedLatency__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("ISSimulateLatency"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v1 = v3;
    _simulatedLatency_retValue = v2;
  }

}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSURLCache)urlCache
{
  return self->_urlCache;
}

- (void)setUrlCache:(id)a3
{
  objc_storeStrong((id *)&self->_urlCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlCache, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
