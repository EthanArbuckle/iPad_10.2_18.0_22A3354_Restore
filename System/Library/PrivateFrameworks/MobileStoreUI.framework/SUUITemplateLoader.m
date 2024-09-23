@implementation SUUITemplateLoader

- (SUUITemplateLoader)initWithURLs:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  SUUITemplateLoader *v8;
  uint64_t v9;
  NSArray *URLs;
  uint64_t v11;
  id completionBlock;
  NSOperationQueue *v13;
  NSOperationQueue *operationQueue;
  uint64_t v15;
  NSRegularExpression *templateParsingRegularExpression;
  NSMutableArray *v17;
  NSMutableArray *errors;
  NSMutableDictionary *v19;
  NSMutableDictionary *templateStrings;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SUUITemplateLoader;
  v8 = -[SUUITemplateLoader init](&v22, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    URLs = v8->_URLs;
    v8->_URLs = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    completionBlock = v8->_completionBlock;
    v8->_completionBlock = (id)v11;

    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v8->_operationQueue;
    v8->_operationQueue = v13;

    -[NSOperationQueue setName:](v8->_operationQueue, "setName:", CFSTR("com.apple.StoreKit.SUUITemplateLoader"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_operationQueue, "setMaxConcurrentOperationCount:", 4);
    +[SUUITemplateParsingDataProvider templateParsingRegularExpression](SUUITemplateParsingDataProvider, "templateParsingRegularExpression");
    v15 = objc_claimAutoreleasedReturnValue();
    templateParsingRegularExpression = v8->_templateParsingRegularExpression;
    v8->_templateParsingRegularExpression = (NSRegularExpression *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    errors = v8->_errors;
    v8->_errors = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    templateStrings = v8->_templateStrings;
    v8->_templateStrings = v19;

  }
  return v8;
}

- (id)_operationWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SUUITemplateParsingDataProvider *v7;
  void *v8;
  SUUITemplateParsingDataProvider *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id from;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", v4);
  objc_msgSend(v5, "setAllowedRetryCount:", 1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURLRequestProperties:", v5);
  objc_msgSend(v6, "setRecordsMetrics:", 1);
  objc_msgSend(v6, "setITunesStoreRequest:", 1);
  v7 = [SUUITemplateParsingDataProvider alloc];
  -[SUUITemplateLoader templateParsingRegularExpression](self, "templateParsingRegularExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SUUITemplateParsingDataProvider initWithRegularExpression:](v7, "initWithRegularExpression:", v8);
  objc_msgSend(v6, "setDataConsumer:", v9);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__SUUITemplateLoader__operationWithURL___block_invoke;
  v11[3] = &unk_2511FDAD8;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  objc_msgSend(v6, "setOutputBlock:", v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v6;
}

void __40__SUUITemplateLoader__operationWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__SUUITemplateLoader__operationWithURL___block_invoke_2;
  v12[3] = &unk_2511F5D20;
  v13 = v6;
  v14 = v5;
  v15 = WeakRetained;
  v16 = v8;
  v9 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

uint64_t __40__SUUITemplateLoader__operationWithURL___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 48), "_operation:didFailWithError:", *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
    return objc_msgSend(*(id *)(a1 + 48), "_operation:didFailWithError:", *(_QWORD *)(a1 + 56));
  else
    return objc_msgSend(*(id *)(a1 + 48), "_operation:didCompleteWithOutput:", *(_QWORD *)(a1 + 56), v2);
}

- (void)_operation:(id)a3 didCompleteWithOutput:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__SUUITemplateLoader__operation_didCompleteWithOutput___block_invoke;
  v10[3] = &unk_2511FDB00;
  v11 = v6;
  v9 = v6;
  v7 = a4;
  +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:](SUUIMetricsAppLaunchEvent, "withPendingLaunchEvent:", v10);
  -[SUUITemplateLoader templateStrings](self, "templateStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v7);

  -[SUUITemplateLoader _operationDidFinish:](self, "_operationDidFinish:", v9);
}

void __55__SUUITemplateLoader__operation_didCompleteWithOutput___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SUUIMetricsTemplateLoad *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "metricsPageEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(SUUIMetricsTemplateLoad);
    objc_msgSend(v3, "requestStartTime");
    -[SUUIMetricsTemplateLoad setRequestStartTime:](v4, "setRequestStartTime:");
    objc_msgSend(v3, "responseStartTime");
    -[SUUIMetricsTemplateLoad setResponseStartTime:](v4, "setResponseStartTime:");
    objc_msgSend(v3, "responseEndTime");
    -[SUUIMetricsTemplateLoad setResponseEndTime:](v4, "setResponseEndTime:");
    -[SUUIMetricsTemplateLoad setResponseWasCached:](v4, "setResponseWasCached:", objc_msgSend(v3, "isCachedResponse"));
    objc_msgSend(*(id *)(a1 + 32), "URLRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTemplateLoadTimingMetric:forURL:", v4, v6);

  }
}

- (void)_operation:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[SUUITemplateLoader errors](self, "errors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  -[SUUITemplateLoader _operationDidFinish:](self, "_operationDidFinish:", v8);
}

- (void)_operationDidFinish:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  SUUITemplateLoader *retainSelf;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  -[SUUITemplateLoader setPendingOperationCount:](self, "setPendingOperationCount:", -[SUUITemplateLoader pendingOperationCount](self, "pendingOperationCount", a3) - 1);
  if (!-[SUUITemplateLoader pendingOperationCount](self, "pendingOperationCount"))
  {
    -[SUUITemplateLoader errors](self, "errors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    -[SUUITemplateLoader errors](self, "errors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == 1)
    {
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = objc_msgSend(v6, "count");

      if (v9 < 2)
      {
        v8 = 0;
        goto LABEL_8;
      }
      v10 = (void *)MEMORY[0x24BDD1540];
      v15 = CFSTR("SUUITemplateLoaderErrorUnderlyingErrorsKey");
      -[SUUITemplateLoader errors](self, "errors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("SUUITemplateLoaderErrorDomain"), 561278320, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_8:
    -[SUUITemplateLoader completionBlock](self, "completionBlock");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[SUUITemplateLoader templateStrings](self, "templateStrings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v12)[2](v12, v13, v8);

    retainSelf = self->_retainSelf;
    self->_retainSelf = 0;

  }
}

- (void)load
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (-[SUUITemplateLoader pendingOperationCount](self, "pendingOperationCount"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUITemplateLoader.m"), 193, CFSTR("load called more than once"));

  }
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[SUUITemplateLoader URLs](self, "URLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SUUITemplateLoader URLs](self, "URLs", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[SUUITemplateLoader _operationWithURL:](self, "_operationWithURL:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[SUUITemplateLoader setPendingOperationCount:](self, "setPendingOperationCount:", objc_msgSend(v6, "count"));
  -[SUUITemplateLoader operationQueue](self, "operationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperations:waitUntilFinished:", v6, 0);

  objc_storeStrong((id *)&self->_retainSelf, self);
}

- (NSArray)URLs
{
  return self->_URLs;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSRegularExpression)templateParsingRegularExpression
{
  return self->_templateParsingRegularExpression;
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (NSMutableDictionary)templateStrings
{
  return self->_templateStrings;
}

- (int64_t)pendingOperationCount
{
  return self->_pendingOperationCount;
}

- (void)setPendingOperationCount:(int64_t)a3
{
  self->_pendingOperationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateStrings, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_templateParsingRegularExpression, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_URLs, 0);
  objc_storeStrong((id *)&self->_retainSelf, 0);
}

@end
