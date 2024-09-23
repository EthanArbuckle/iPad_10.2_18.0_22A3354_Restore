@implementation MKPlaceCollectionImageDownloadOperation

- (MKPlaceCollectionImageDownloadOperation)initWithUrl:(id)a3 downloadCache:(id)a4 cacheId:(id)a5
{
  id v9;
  id v10;
  id v11;
  MKPlaceCollectionImageDownloadOperation *v12;
  MKPlaceCollectionImageDownloadOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MKPlaceCollectionImageDownloadOperation;
  v12 = -[MKPlaceCollectionImageDownloadOperation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeWeak((id *)&v13->_downloadCache, v10);
    objc_storeStrong((id *)&v13->_cacheId, a5);
    -[MKPlaceCollectionImageDownloadOperation setName:](v13, "setName:", v11);
    v13->_executing = 0;
    v13->_finished = 0;
  }

  return v13;
}

- (void)start
{
  if (-[MKPlaceCollectionImageDownloadOperation isCancelled](self, "isCancelled"))
  {
    -[MKPlaceCollectionImageDownloadOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = 1;
    -[MKPlaceCollectionImageDownloadOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
  else
  {
    -[MKPlaceCollectionImageDownloadOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = 1;
    -[MKPlaceCollectionImageDownloadOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    -[MKPlaceCollectionImageDownloadOperation main](self, "main");
  }
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSURLSessionDataTask *v14;
  NSURLSessionDataTask *downloadTask;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[MKPlaceCollectionImageDownloadOperation downloadCache](self, "downloadCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionImageDownloadOperation cacheId](self, "cacheId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    MKGetCuratedCollectionsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[MKPlaceCollectionImageDownloadOperation name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_DEBUG, "[!]Download cache already has image: %@", buf, 0xCu);

    }
    -[MKPlaceCollectionImageDownloadOperation markOperationAsComplete](self, "markOperationAsComplete");
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CB39E0]);
    -[MKPlaceCollectionImageDownloadOperation url](self, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithURL:cachePolicy:timeoutInterval:", v9, 2, 15.0);

    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__MKPlaceCollectionImageDownloadOperation_main__block_invoke;
    v18[3] = &unk_1E20DB2D8;
    objc_copyWeak(&v20, &location);
    v13 = v11;
    v19 = v13;
    objc_msgSend(v12, "dataTaskWithRequest:completionHandler:", v10, v18);
    v14 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue();
    downloadTask = self->_downloadTask;
    self->_downloadTask = v14;

    if (-[MKPlaceCollectionImageDownloadOperation isCancelled](self, "isCancelled"))
    {
      MKGetCuratedCollectionsLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[MKPlaceCollectionImageDownloadOperation cacheId](self, "cacheId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v17;
        _os_log_impl(&dword_18B0B0000, v16, OS_LOG_TYPE_DEBUG, "Download Operation is cancelled for: %@", buf, 0xCu);

      }
    }
    else
    {
      -[NSURLSessionDataTask resume](self->_downloadTask, "resume");
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

void __47__MKPlaceCollectionImageDownloadOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9 || !-[NSObject length](v7, "length"))
  {
    MKGetCuratedCollectionsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    objc_msgSend(WeakRetained, "name");
    v12 = objc_claimAutoreleasedReturnValue();
    v23 = 138412546;
    v24 = v12;
    v25 = 2112;
    v26 = (uint64_t)v9;
    _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_ERROR, "[!!]Image download failed for: %@. Error: %@", (uint8_t *)&v23, 0x16u);
  }
  else
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v7);
    MKGetCuratedCollectionsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "name");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
        v23 = 138412802;
        v24 = v14;
        v25 = 2048;
        v26 = v16;
        v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_DEBUG, "[⌛]Completed image download for (%@) in: %f seconds. Image: %@. ", (uint8_t *)&v23, 0x20u);

      }
      objc_msgSend(WeakRetained, "downloadCache");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "cacheId");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v12, "setObject:forKey:", v11, v17);
      goto LABEL_11;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "cacheId");
      v17 = objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v7;
      v25 = 2112;
      v26 = (uint64_t)v8;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_ERROR, "[⌛] Failed to build UIImage from data: %@, \nResponse: %@. \nCache ID: %@", (uint8_t *)&v23, 0x20u);
LABEL_11:

    }
  }

LABEL_13:
  MKGetCuratedCollectionsLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "downloadCache");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "downloadCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");
    v23 = 138412546;
    v24 = v19;
    v25 = 2048;
    v26 = v22;
    _os_log_impl(&dword_18B0B0000, v18, OS_LOG_TYPE_DEBUG, "Download cache %@ has %ld items.", (uint8_t *)&v23, 0x16u);

  }
  objc_msgSend(WeakRetained, "markOperationAsComplete");

}

- (void)markOperationAsComplete
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MKGetCuratedCollectionsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[MKPlaceCollectionImageDownloadOperation name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_18B0B0000, v3, OS_LOG_TYPE_DEBUG, "Download operation finished %@", (uint8_t *)&v5, 0xCu);

  }
  -[MKPlaceCollectionImageDownloadOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[MKPlaceCollectionImageDownloadOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[MKPlaceCollectionImageDownloadOperation setExecuting:](self, "setExecuting:", 0);
  -[MKPlaceCollectionImageDownloadOperation setFinished:](self, "setFinished:", 1);
  -[MKPlaceCollectionImageDownloadOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[MKPlaceCollectionImageDownloadOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[MKPlaceCollectionImageDownloadOperation downloadTask](self, "downloadTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)MKPlaceCollectionImageDownloadOperation;
  -[MKPlaceCollectionImageDownloadOperation cancel](&v4, sel_cancel);
}

- (BOOL)executing
{
  return self->_executing;
}

- (void)setExecuting:(BOOL)a3
{
  self->_executing = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (UIImage)downloadedImage
{
  return self->_downloadedImage;
}

- (void)setDownloadedImage:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedImage, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)cacheId
{
  return self->_cacheId;
}

- (void)setCacheId:(id)a3
{
  objc_storeStrong((id *)&self->_cacheId, a3);
}

- (NSURLSessionDataTask)downloadTask
{
  return self->_downloadTask;
}

- (void)setDownloadTask:(id)a3
{
  objc_storeStrong((id *)&self->_downloadTask, a3);
}

- (NSCache)downloadCache
{
  return (NSCache *)objc_loadWeakRetained((id *)&self->_downloadCache);
}

- (void)setDownloadCache:(id)a3
{
  objc_storeWeak((id *)&self->_downloadCache, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_downloadCache);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_cacheId, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_downloadedImage, 0);
}

@end
