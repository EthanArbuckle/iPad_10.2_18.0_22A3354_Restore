@implementation ASDRestoreTotalDownloadSizeEstimateRequest

- (ASDRestoreTotalDownloadSizeEstimateRequest)init
{
  void *v3;
  id v4;
  ASDRestoreTotalDownloadSizeEstimateRequest *v5;
  objc_super v7;

  +[ASDRestoreService sharedInstance](ASDRestoreService, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDRestoreTotalDownloadSizeEstimateRequest;
    v5 = -[ASDRestoreTotalDownloadSizeEstimateRequest init](&v7, sel_init);
    self = v5;
    if (v5)
      objc_storeStrong((id *)&v5->_restoreService, v3);
  }

  return self;
}

- (void)startWithCompletionHandler:(id)a3
{
  -[ASDRestoreService estimateTotalDownloadSizeWithCompletionHandler:](self->_restoreService, "estimateTotalDownloadSizeWithCompletionHandler:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreService, 0);
}

@end
