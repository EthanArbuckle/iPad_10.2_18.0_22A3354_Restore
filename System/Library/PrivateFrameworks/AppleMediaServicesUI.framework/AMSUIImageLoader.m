@implementation AMSUIImageLoader

- (AMSUIImageLoader)init
{
  AMSUIImageLoader *v2;
  AMSUIAssetQueue *v3;
  AMSUIAssetQueue *fetchQueue;
  NSCache *v5;
  NSCache *imageCache;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURLSession *urlSession;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AMSUIImageLoader;
  v2 = -[AMSUIImageLoader init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AMSUIAssetQueue);
    fetchQueue = v2->_fetchQueue;
    v2->_fetchQueue = v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v5;

    v7 = (void *)MEMORY[0x24BDD1850];
    objc_msgSend(MEMORY[0x24BDD1858], "ams_imageConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionWithConfiguration:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v9;

    v11 = dispatch_queue_create("com.apple.AppleMediaServicesUI.ImageLoader.workQueue", MEMORY[0x24BDAC9C0]);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v11;

    -[AMSUIImageLoader fetchQueue](v2, "fetchQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", CFSTR("com.apple.AppleMediaServicesUI.ImageLoader.fetchQueue"));

    -[AMSUIImageLoader fetchQueue](v2, "fetchQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMaxConcurrentOperationCount:", 4);

    -[AMSUIImageLoader fetchQueue](v2, "fetchQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setQualityOfService:", 9);

  }
  return v2;
}

+ (id)defaultLoader
{
  if (defaultLoader_ams_once_token___COUNTER__ != -1)
    dispatch_once(&defaultLoader_ams_once_token___COUNTER__, &__block_literal_global_7);
  return (id)defaultLoader_ams_once_object___COUNTER__;
}

void __33__AMSUIImageLoader_defaultLoader__block_invoke()
{
  AMSUIImageLoader *v0;
  void *v1;

  v0 = objc_alloc_init(AMSUIImageLoader);
  v1 = (void *)defaultLoader_ams_once_object___COUNTER__;
  defaultLoader_ams_once_object___COUNTER__ = (uint64_t)v0;

}

- (id)fetchImageWithURL:(id)a3
{
  return -[AMSUIImageLoader fetchImageWithURL:searchBundles:](self, "fetchImageWithURL:searchBundles:", a3, 0);
}

- (id)fetchImageWithURL:(id)a3 searchBundles:(id)a4
{
  id v6;
  void *v7;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v6 = a3;
    -[AMSUIImageLoader _fetchImageWithURL:searchBundles:atPriority:](self, "_fetchImageWithURL:searchBundles:atPriority:", v6, a4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1488];
    v10 = a3;
    objc_msgSend(v9, "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIImageLoader _fetchImageWithURL:searchBundles:atPriority:](self, "_fetchImageWithURL:searchBundles:atPriority:", v10, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
}

- (id)_fetchImageWithURL:(id)a3 searchBundles:(id)a4 atPriority:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  int64_t v22;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BE08340]);
  -[AMSUIImageLoader workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__AMSUIImageLoader__fetchImageWithURL_searchBundles_atPriority___block_invoke;
  block[3] = &unk_24CB4FD48;
  block[4] = self;
  v19 = v8;
  v12 = v10;
  v21 = v9;
  v22 = a5;
  v20 = v12;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  v15 = v21;
  v16 = v12;

  return v16;
}

void __64__AMSUIImageLoader__fetchImageWithURL_searchBundles_atPriority___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_fetchImageFromCacheWithURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "operationWithKey:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "OSLogObject");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = objc_opt_class();
        AMSLogKey();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v7;
        v24 = 2114;
        v25 = v8;
        v26 = 2114;
        v27 = v4;
        _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Reprioritizing operation key %{public}@", buf, 0x20u);

      }
      if (objc_msgSend(v4, "queuePriority") < *(_QWORD *)(a1 + 64))
        objc_msgSend(v4, "setQueuePriority:");
      v9 = *(void **)(a1 + 48);
      objc_msgSend(v4, "operationPromise");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "finishWithPromise:", v10);
    }
    else
    {
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 56);
      v21 = 0;
      objc_msgSend(v11, "_makeOperationForImageWithURL:searchBundles:error:", v12, v13, &v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v21;
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v10);
      }
      else
      {
        objc_msgSend(v14, "setOperationPromise:", *(_QWORD *)(a1 + 48));
        if (objc_msgSend(v14, "isLowLatency"))
        {
          v15 = *(void **)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 32), "_performLowLatencyOperation:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "finishWithPromise:", v16);
        }
        else
        {
          objc_msgSend(v14, "setQueuePriority:", *(_QWORD *)(a1 + 64));
          objc_msgSend(*(id *)(a1 + 32), "fetchQueue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addOperation:withKey:", v14, *(_QWORD *)(a1 + 40));
        }

        objc_initWeak((id *)buf, *(id *)(a1 + 32));
        v17 = *(void **)(a1 + 48);
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __64__AMSUIImageLoader__fetchImageWithURL_searchBundles_atPriority___block_invoke_17;
        v18[3] = &unk_24CB4FD20;
        v18[4] = *(_QWORD *)(a1 + 32);
        objc_copyWeak(&v20, (id *)buf);
        v19 = *(id *)(a1 + 40);
        objc_msgSend(v17, "addSuccessBlock:", v18);

        objc_destroyWeak(&v20);
        objc_destroyWeak((id *)buf);
      }

    }
  }

}

void __64__AMSUIImageLoader__fetchImageWithURL_searchBundles_atPriority___block_invoke_17(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__AMSUIImageLoader__fetchImageWithURL_searchBundles_atPriority___block_invoke_2;
  block[3] = &unk_24CB4FCF8;
  objc_copyWeak(&v9, a1 + 6);
  v7 = v3;
  v8 = a1[5];
  v5 = v3;
  dispatch_barrier_async(v4, block);

  objc_destroyWeak(&v9);
}

void __64__AMSUIImageLoader__fetchImageWithURL_searchBundles_atPriority___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_cacheImage:withURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_performLowLatencyOperation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[AMSUIImageLoader workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init(MEMORY[0x24BE08340]);
  objc_msgSend(v4, "setOperationPromise:", v6);
  objc_msgSend(v4, "main");

  return v6;
}

- (BOOL)_isURLBundleResource:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("resource"));

  return v4;
}

- (BOOL)_isURLEngagementContent:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("amsc"));

  return v4;
}

- (id)_makeSystemImageFetchOperationForSystemURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  AMSUISystemImageFetchOperation *v20;
  id v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[AMSUIImageLoader _isURLSystemImage:](self, "_isURLSystemImage:", v6))
  {
    objc_msgSend(v6, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByRemovingPercentEncoding");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v6, 0);
      v10 = v9;
      if (v9)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v9, "queryItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v12)
        {
          v13 = v12;
          v24 = v10;
          v14 = *(_QWORD *)v26;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(v16, "name");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("variableValue"));

              if (v18)
              {
                v21 = objc_alloc(MEMORY[0x24BDD16E0]);
                objc_msgSend(v16, "value");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "doubleValue");
                v19 = (void *)objc_msgSend(v21, "initWithDouble:");

                goto LABEL_17;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
            if (v13)
              continue;
            break;
          }
          v19 = 0;
LABEL_17:
          v10 = v24;
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }
      v20 = -[AMSUISystemImageFetchOperation initWithSystemImageName:variableValue:compatibleWithTraitCollection:]([AMSUISystemImageFetchOperation alloc], "initWithSystemImageName:variableValue:compatibleWithTraitCollection:", v8, v19, 0);

    }
    else if (a4)
    {
      AMSError();
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_makeOperationForImageWithURL:(id)a3 searchBundles:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  AMSUIContentImageFetchOperation *v10;
  void *v11;
  void *v12;
  AMSUIBundleImageFetchOperation *v13;
  void *v14;
  void *v15;
  char v16;
  AMSUINetworkImageFetchOperation *v17;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  if (-[AMSUIImageLoader _isURLEngagementContent:](self, "_isURLEngagementContent:", v8))
  {
    v10 = -[AMSUIContentImageFetchOperation initWithURL:]([AMSUIContentImageFetchOperation alloc], "initWithURL:", v8);
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __70__AMSUIImageLoader__makeOperationForImageWithURL_searchBundles_error___block_invoke;
    v22[3] = &unk_24CB4FD70;
    objc_copyWeak(&v24, &location);
    v23 = v9;
    -[AMSUIContentImageFetchOperation setFallbackBlock:](v10, "setFallbackBlock:", v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  if (-[AMSUIImageLoader _isURLSystemImage:](self, "_isURLSystemImage:", v8))
  {
    -[AMSUIImageLoader _makeSystemImageFetchOperationForSystemURL:error:](self, "_makeSystemImageFetchOperationForSystemURL:error:", v8, a5);
    v10 = (AMSUIContentImageFetchOperation *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (-[AMSUIImageLoader _isURLBundleResource:](self, "_isURLBundleResource:", v8))
  {
    objc_msgSend(v8, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByRemovingPercentEncoding");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (a5)
      {
        AMSError();
        v10 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      goto LABEL_13;
    }
    v13 = -[AMSUIBundleImageFetchOperation initWithImageName:searchBundles:compatibleWithTraitCollection:]([AMSUIBundleImageFetchOperation alloc], "initWithImageName:searchBundles:compatibleWithTraitCollection:", v12, v9, 0);
LABEL_12:
    v10 = (AMSUIContentImageFetchOperation *)v13;
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v8, "scheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("http")))
  {

LABEL_11:
    v17 = [AMSUINetworkImageFetchOperation alloc];
    -[AMSUIImageLoader urlSession](self, "urlSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AMSUINetworkImageFetchOperation initWithURL:URLSession:](v17, "initWithURL:URLSession:", v8, v12);
    goto LABEL_12;
  }
  objc_msgSend(v8, "scheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("https"));

  if ((v16 & 1) != 0)
    goto LABEL_11;
  if (a5)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "scheme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ scheme is unsupported"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AMSError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = 0;
LABEL_14:

  return v10;
}

id __70__AMSUIImageLoader__makeOperationForImageWithURL_searchBundles_error___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_fetchImageWithURL:searchBundles:atPriority:", v4, *(_QWORD *)(a1 + 32), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_cacheImage:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AMSUIImageLoader imageCache](self, "imageCache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (id)_fetchImageFromCacheWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AMSUIImageLoader workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[AMSUIImageLoader imageCache](self, "imageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (BOOL)_isURLSystemImage:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("systemimage"));

  return v4;
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (AMSUIAssetQueue)fetchQueue
{
  return self->_fetchQueue;
}

- (void)setFetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fetchQueue, a3);
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
