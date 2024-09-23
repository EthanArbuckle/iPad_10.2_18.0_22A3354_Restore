@implementation AMSUIAssetFetchOperation

- (BOOL)isLowLatency
{
  return 0;
}

- (void)setQueuePriority:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)AMSUIAssetFetchOperation;
  v5 = -[AMSUIAssetFetchOperation queuePriority](&v11, sel_queuePriority);
  v10.receiver = self;
  v10.super_class = (Class)AMSUIAssetFetchOperation;
  -[AMSUIAssetFetchOperation setQueuePriority:](&v10, sel_setQueuePriority_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("oldPriority");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("newPriority");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesUI.AssetFetchOperation.didChangePriority"), self, v9);

}

- (void)main
{
  id v3;

  AMSError();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIAssetFetchOperation _finishWithImage:error:](self, "_finishWithImage:error:", 0, v3);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[AMSUIAssetFetchOperation setOperationPromise:](self, "setOperationPromise:", 0);
  v4.receiver = self;
  v4.super_class = (Class)AMSUIAssetFetchOperation;
  -[AMSUIAssetFetchOperation cancel](&v4, sel_cancel);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.AppleMediaServicesUI.AssetFetchOperation.didCancel"), self);

}

- (void)_finishWithImage:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if ((-[AMSUIAssetFetchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[AMSUIAssetFetchOperation operationPromise](self, "operationPromise");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AMSUIAssetFetchOperation operationPromise](self, "operationPromise");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishWithResult:error:", v9, v6);

    }
    -[AMSUIAssetFetchOperation setOperationPromise:](self, "setOperationPromise:", 0);
  }

}

- (void)setLowLatency:(BOOL)a3
{
  self->_lowLatency = a3;
}

- (AMSPromise)operationPromise
{
  return self->_operationPromise;
}

- (void)setOperationPromise:(id)a3
{
  objc_storeStrong((id *)&self->_operationPromise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationPromise, 0);
}

@end
