@implementation _LTTextSessionRequest

- (_LTTextSessionRequest)initWithBatch:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 itemHandler:(id)a6 completionHandler:(id)a7
{
  return (_LTTextSessionRequest *)-[_LTTextSessionRequest _initWithBatch:sourceLocale:targetLocale:isForDownloadRequest:itemHandler:completionHandler:](self, "_initWithBatch:sourceLocale:targetLocale:isForDownloadRequest:itemHandler:completionHandler:", a3, a4, a5, 0, a6, a7);
}

- (id)initForDownloadRequestWithSourceLocale:(id)a3 targetLocale:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __95___LTTextSessionRequest_initForDownloadRequestWithSourceLocale_targetLocale_completionHandler___block_invoke;
  v12[3] = &unk_250694000;
  v13 = v8;
  v9 = v8;
  v10 = -[_LTTextSessionRequest _initWithBatch:sourceLocale:targetLocale:isForDownloadRequest:itemHandler:completionHandler:](self, "_initWithBatch:sourceLocale:targetLocale:isForDownloadRequest:itemHandler:completionHandler:", MEMORY[0x24BDBD1A8], a3, a4, 1, 0, v12);

  return v10;
}

- (id)_initWithBatch:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 isForDownloadRequest:(BOOL)a6 itemHandler:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _LTTextSessionRequest *v19;
  uint64_t v20;
  OS_dispatch_queue *queue;
  uint64_t v22;
  NSArray *batch;
  uint64_t v24;
  NSLocale *resolvedSourceLocale;
  uint64_t v26;
  NSLocale *resolvedTargetLocale;
  uint64_t v28;
  id itemHandler;
  uint64_t v30;
  id completionHandler;
  uint64_t v32;
  NSMutableDictionary *resultMap;
  uint64_t v34;
  NSUUID *logIdentifier;
  _LTTextSessionRequest *v36;
  objc_super v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v38.receiver = self;
  v38.super_class = (Class)_LTTextSessionRequest;
  v19 = -[_LTTextSessionRequest init](&v38, sel_init);
  if (v19)
  {
    +[_LTTextSession synchronizationQueue](_LTTextSession, "synchronizationQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    v22 = objc_msgSend(v14, "copy");
    batch = v19->_batch;
    v19->_batch = (NSArray *)v22;

    v24 = objc_msgSend(v15, "copy");
    resolvedSourceLocale = v19->_resolvedSourceLocale;
    v19->_resolvedSourceLocale = (NSLocale *)v24;

    v26 = objc_msgSend(v16, "copy");
    resolvedTargetLocale = v19->_resolvedTargetLocale;
    v19->_resolvedTargetLocale = (NSLocale *)v26;

    v19->_isForDownloadRequest = a6;
    v28 = objc_msgSend(v17, "copy");
    itemHandler = v19->_itemHandler;
    v19->_itemHandler = (id)v28;

    v30 = objc_msgSend(v18, "copy");
    completionHandler = v19->_completionHandler;
    v19->_completionHandler = (id)v30;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
    v32 = objc_claimAutoreleasedReturnValue();
    resultMap = v19->_resultMap;
    v19->_resultMap = (NSMutableDictionary *)v32;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v34 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v19->_logIdentifier;
    v19->_logIdentifier = (NSUUID *)v34;

    v36 = v19;
  }

  return v19;
}

- (void)didReceiveError:(id)a3 forInput:(id)a4
{
  id v5;
  void (**completionHandler)(id, _QWORD, id);
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  completionHandler = (void (**)(id, _QWORD, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, v5);
    -[_LTTextSessionRequest _cleanUp](self, "_cleanUp");
  }
  else
  {
    v7 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_235438000, v7, OS_LOG_TYPE_INFO, "Text request received error, but already called completion handler so ignoring new error: %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)didTranslateInput:(id)a3 withResult:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  NSUInteger v9;
  NSObject *v10;
  NSMutableDictionary *resultMap;
  void *v12;
  void (**itemHandler)(id, id, _QWORD);
  NSObject *v14;
  int v15;
  NSUInteger v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  queue = self->_queue;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  v9 = -[NSArray indexOfObject:](self->_batch, "indexOfObject:", v8);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_LTTextSessionRequest didTranslateInput:withResult:].cold.1(v10);
  }
  else if (self->_completionHandler)
  {
    resultMap = self->_resultMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](resultMap, "setObject:forKeyedSubscript:", v6, v12);

    itemHandler = (void (**)(id, id, _QWORD))self->_itemHandler;
    if (itemHandler)
      itemHandler[2](itemHandler, v6, 0);
  }
  else
  {
    v14 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = 134217984;
      v16 = v9;
      _os_log_impl(&dword_235438000, v14, OS_LOG_TYPE_INFO, "Received result for input item %zu after completion handler was already called, likely because an error previously ocurred; early returning",
        (uint8_t *)&v15,
        0xCu);
    }
  }

}

- (void)didComplete
{
  NSUInteger v3;
  uint64_t i;
  NSMutableDictionary *resultMap;
  void *v6;
  void *v7;
  void (**completionHandler)(id, void *, _QWORD);
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_completionHandler)
  {
    v3 = -[NSArray count](self->_batch, "count");
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      for (i = 0; i != v3; ++i)
      {
        resultMap = self->_resultMap;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](resultMap, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          objc_msgSend(v11, "addObject:", v7);

      }
    }
    completionHandler = (void (**)(id, void *, _QWORD))self->_completionHandler;
    v9 = (void *)objc_msgSend(v11, "copy");
    completionHandler[2](completionHandler, v9, 0);

    -[_LTTextSessionRequest _cleanUp](self, "_cleanUp");
  }
  else
  {
    v10 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235438000, v10, OS_LOG_TYPE_INFO, "Request was reported as being finished, but completion handler was already called so ignoring update", buf, 2u);
    }
  }
}

- (NSLocale)resolvedSourceLocale
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_resolvedSourceLocale;
}

- (NSLocale)resolvedTargetLocale
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_resolvedTargetLocale;
}

- (void)setResolvedSourceLocale:(id)a3
{
  NSObject *queue;
  id v5;
  NSLocale *v6;
  NSLocale *resolvedSourceLocale;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  v6 = (NSLocale *)objc_msgSend(v5, "copy");

  resolvedSourceLocale = self->_resolvedSourceLocale;
  self->_resolvedSourceLocale = v6;

}

- (void)setResolvedTargetLocale:(id)a3
{
  NSObject *queue;
  id v5;
  NSLocale *v6;
  NSLocale *resolvedTargetLocale;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  v6 = (NSLocale *)objc_msgSend(v5, "copy");

  resolvedTargetLocale = self->_resolvedTargetLocale;
  self->_resolvedTargetLocale = v6;

}

- (void)_setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)_cleanUp
{
  id completionHandler;
  id itemHandler;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  itemHandler = self->_itemHandler;
  self->_itemHandler = 0;

  -[NSMutableDictionary removeAllObjects](self->_resultMap, "removeAllObjects");
}

- (void)didReceiveInterruptionFromHandler:(id)a3
{
  NSObject *queue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59___LTTextSessionRequest_didReceiveInterruptionFromHandler___block_invoke;
  v5[3] = &unk_250693730;
  objc_copyWeak(&v6, &location);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (NSArray)batch
{
  return self->_batch;
}

- (BOOL)isForDownloadRequest
{
  return self->_isForDownloadRequest;
}

- (NSUUID)logIdentifier
{
  return self->_logIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_batch, 0);
  objc_storeStrong((id *)&self->_resolvedTargetLocale, 0);
  objc_storeStrong((id *)&self->_resolvedSourceLocale, 0);
  objc_storeStrong((id *)&self->_resultMap, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_itemHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)didTranslateInput:(os_log_t)log withResult:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_235438000, log, OS_LOG_TYPE_ERROR, "Unable to find input item in original inputs, ignoring result", v1, 2u);
}

@end
