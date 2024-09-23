@implementation _MPStoreDownloadBlockObserver

- (_MPStoreDownloadBlockObserver)initWithDownload:(id)a3
{
  id v5;
  _MPStoreDownloadBlockObserver *v6;
  _MPStoreDownloadBlockObserver *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MPStoreDownloadBlockObserver;
  v6 = -[_MPStoreDownloadBlockObserver init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_download, a3);
    if (v5)
    {
      +[MPStoreDownloadManager sharedManager](MPStoreDownloadManager, "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:forDownloads:", v7, v9);

    }
  }

  return v7;
}

- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4
{
  id v6;
  MPStoreDownload *v7;
  void (**didFinishPurchaseHandler)(id, MPStoreDownload *);
  id v9;
  void (**didFinishDownloadHandler)(id, MPStoreDownload *);
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (MPStoreDownload *)a4;
  if (self->_download == v7)
  {
    didFinishPurchaseHandler = (void (**)(id, MPStoreDownload *))self->_didFinishPurchaseHandler;
    if (didFinishPurchaseHandler)
    {
      didFinishPurchaseHandler[2](didFinishPurchaseHandler, v7);
      v9 = self->_didFinishPurchaseHandler;
      self->_didFinishPurchaseHandler = 0;

    }
    didFinishDownloadHandler = (void (**)(id, MPStoreDownload *))self->_didFinishDownloadHandler;
    if (didFinishDownloadHandler)
    {
      didFinishDownloadHandler[2](didFinishDownloadHandler, v7);
      v11 = self->_didFinishDownloadHandler;
      self->_didFinishDownloadHandler = 0;

    }
    if (self->_download)
    {
      +[MPStoreDownloadManager sharedManager](MPStoreDownloadManager, "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = self->_download;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObserver:forDownloads:", self, v13);

    }
    +[MPStoreDownloadManager sharedManager](MPStoreDownloadManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_unregisterBlockObserver:", self);

  }
}

- (void)downloadManager:(id)a3 downloadPurchaseDidFinish:(id)a4
{
  id v6;
  id v7;
  void (**didFinishPurchaseHandler)(id, id);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  didFinishPurchaseHandler = (void (**)(id, id))self->_didFinishPurchaseHandler;
  if (didFinishPurchaseHandler)
  {
    didFinishPurchaseHandler[2](didFinishPurchaseHandler, v7);
    v9 = self->_didFinishPurchaseHandler;
    self->_didFinishPurchaseHandler = 0;

  }
  if (!self->_didFinishDownloadHandler)
  {
    if (self->_download)
    {
      +[MPStoreDownloadManager sharedManager](MPStoreDownloadManager, "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = self->_download;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:forDownloads:", self, v11);

    }
    +[MPStoreDownloadManager sharedManager](MPStoreDownloadManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_unregisterBlockObserver:", self);

  }
}

- (id)didFinishDownloadHandler
{
  return self->_didFinishDownloadHandler;
}

- (void)setDidFinishDownloadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)didFinishPurchaseHandler
{
  return self->_didFinishPurchaseHandler;
}

- (void)setDidFinishPurchaseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MPStoreDownload)download
{
  return self->_download;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_download, 0);
  objc_storeStrong(&self->_didFinishPurchaseHandler, 0);
  objc_storeStrong(&self->_didFinishDownloadHandler, 0);
}

@end
