@implementation _MPCURLAssetDownloadCompletionObserver

- (_MPCURLAssetDownloadCompletionObserver)initWithAsset:(id)a3
{
  id v4;
  _MPCURLAssetDownloadCompletionObserver *v5;
  _MPCURLAssetDownloadCompletionObserver *v6;
  void *v7;

  v4 = a3;
  v5 = -[_MPCURLAssetDownloadCompletionObserver init](self, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_asset, v4);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__downloadCompleteSuccessNotification_, *MEMORY[0x24BDB2160], v4);
      objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__downloadCompleteFailedNotification_, *MEMORY[0x24BDB2150], v4);

    }
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_asset);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDB2160], WeakRetained);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDB2150], WeakRetained);
  -[_MPCURLAssetDownloadCompletionObserver _notifyCompletionHandlerWithSuccess:error:](self, "_notifyCompletionHandlerWithSuccess:error:", 0, 0);

  v5.receiver = self;
  v5.super_class = (Class)_MPCURLAssetDownloadCompletionObserver;
  -[_MPCURLAssetDownloadCompletionObserver dealloc](&v5, sel_dealloc);
}

- (void)_downloadCompleteSuccessNotification:(id)a3
{
  -[_MPCURLAssetDownloadCompletionObserver _notifyCompletionHandlerWithSuccess:error:](self, "_notifyCompletionHandlerWithSuccess:error:", 1, 0);
}

- (void)_downloadCompleteFailedNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDB2158]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCURLAssetDownloadCompletionObserver _notifyCompletionHandlerWithSuccess:error:](self, "_notifyCompletionHandlerWithSuccess:error:", 0, v4);

}

- (void)_notifyCompletionHandlerWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;

  v4 = a3;
  v7 = a4;
  -[_MPCURLAssetDownloadCompletionObserver completionHandler](self, "completionHandler");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[_MPCURLAssetDownloadCompletionObserver setCompletionHandler:](self, "setCompletionHandler:", 0);
  if (v6)
    ((void (**)(_QWORD, _BOOL8, id))v6)[2](v6, v4, v7);

}

- (AVURLAsset)asset
{
  return (AVURLAsset *)objc_loadWeakRetained((id *)&self->_asset);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_asset);
}

@end
