@implementation AMSUIAssetQueue

- (AMSUIAssetQueue)init
{
  AMSUIAssetQueue *v2;
  NSOperationQueue *v3;
  NSOperationQueue *underlyingQueue;
  uint64_t v5;
  NSMutableDictionary *pendingOperations;
  uint64_t v7;
  NSCountedSet *priorityCounts;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AMSUIAssetQueue;
  v2 = -[AMSUIAssetQueue init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    underlyingQueue = v2->_underlyingQueue;
    v2->_underlyingQueue = v3;

    v2->_stateLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    pendingOperations = v2->_pendingOperations;
    v2->_pendingOperations = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDD14E0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    priorityCounts = v2->_priorityCounts;
    v2->_priorityCounts = (NSCountedSet *)v7;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[AMSUIAssetQueue underlyingQueue](self, "underlyingQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllOperations");

  v5.receiver = self;
  v5.super_class = (Class)AMSUIAssetQueue;
  -[AMSUIAssetQueue dealloc](&v5, sel_dealloc);
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[AMSUIAssetQueue underlyingQueue](self, "underlyingQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIAssetQueue underlyingQueue](self, "underlyingQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v4);

}

- (int64_t)qualityOfService
{
  void *v2;
  int64_t v3;

  -[AMSUIAssetQueue underlyingQueue](self, "underlyingQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "qualityOfService");

  return v3;
}

- (void)setQualityOfService:(int64_t)a3
{
  id v4;

  -[AMSUIAssetQueue underlyingQueue](self, "underlyingQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQualityOfService:", a3);

}

- (int64_t)maxConcurrentOperationCount
{
  void *v2;
  int64_t v3;

  -[AMSUIAssetQueue underlyingQueue](self, "underlyingQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxConcurrentOperationCount");

  return v3;
}

- (void)setMaxConcurrentOperationCount:(int64_t)a3
{
  id v4;

  -[AMSUIAssetQueue underlyingQueue](self, "underlyingQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxConcurrentOperationCount:", a3);

}

- (BOOL)isSuspended
{
  void *v2;
  char v3;

  -[AMSUIAssetQueue underlyingQueue](self, "underlyingQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuspended");

  return v3;
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AMSUIAssetQueue underlyingQueue](self, "underlyingQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuspended:", v3);

}

- (void)_incrementCountAt:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[AMSUIAssetQueue priorityCounts](self, "priorityCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIAssetQueue priorityCounts](self, "priorityCounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  if (!v6)
    -[AMSUIAssetQueue _didBeginFetchingAssets](self, "_didBeginFetchingAssets");

}

- (void)_decrementCountAt:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIAssetQueue priorityCounts](self, "priorityCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v10);

  -[AMSUIAssetQueue priorityCounts](self, "priorityCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countForObject:", v10);

  if (!v7)
  {
    -[AMSUIAssetQueue _didFetchAllAssetsAtPriority:](self, "_didFetchAllAssetsAtPriority:", a3);
    -[AMSUIAssetQueue priorityCounts](self, "priorityCounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
      -[AMSUIAssetQueue _didFinishFetchingAllAssets](self, "_didFinishFetchingAllAssets");
  }

}

- (void)_didBeginFetchingAssets
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning to fetch assets", (uint8_t *)&v7, 0x16u);

  }
}

- (void)_didFetchAllAssetsAtPriority:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    v13 = 2048;
    v14 = a3;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did fetch all assets at Priority %li", (uint8_t *)&v9, 0x20u);

  }
}

- (void)_didFinishFetchingAllAssets
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did fetch all assets in queue", (uint8_t *)&v7, 0x16u);

  }
}

- (void)_addObserverForOperation:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__operationDidChangePriority_, CFSTR("com.apple.AppleMediaServicesUI.AssetFetchOperation.didChangePriority"), v5);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__operationDidCancel_, CFSTR("com.apple.AppleMediaServicesUI.AssetFetchOperation.didCancel"), v5);

}

- (void)_removeObserverForOperation:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("com.apple.AppleMediaServicesUI.AssetFetchOperation.didChangePriority"), v5);
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("com.apple.AppleMediaServicesUI.AssetFetchOperation.didCancel"), v5);

}

- (void)_operationDidChangePriority:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("oldPriority"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("newPriority"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v7)
    {
      if (v8 && v9 != 0)
      {
        if (!v10)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "OSLogObject");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = (void *)objc_opt_class();
          v21 = v14;
          AMSLogKey();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v23 = v14;
          v24 = 2114;
          v25 = v15;
          v26 = 2112;
          v27 = v6;
          v28 = 2048;
          v29 = objc_msgSend(v9, "integerValue");
          _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Operation priority of %@ was changed to %li", buf, 0x2Au);

        }
        os_unfair_lock_lock(&self->_stateLock);
        -[AMSUIAssetQueue _decrementCountAt:](self, "_decrementCountAt:", -[NSObject integerValue](v8, "integerValue"));
        -[AMSUIAssetQueue _incrementCountAt:](self, "_incrementCountAt:", objc_msgSend(v9, "integerValue"));
        os_unfair_lock_unlock(&self->_stateLock);
        goto LABEL_25;
      }
    }
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_opt_class();
      v19 = v18;
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v18;
      v24 = 2114;
      v25 = v20;
      _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] called with notification without priority keys", buf, 0x16u);

    }
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_opt_class();
    v9 = v16;
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] called with notification without operation object", buf, 0x16u);
    goto LABEL_24;
  }
LABEL_26:

}

- (void)_operationDidCancel:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v9;
      v32 = 2114;
      v33 = v11;
      v34 = 2112;
      v35 = v5;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Operation %@ was cancelled", buf, 0x20u);

    }
    os_unfair_lock_lock(&self->_stateLock);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[AMSUIAssetQueue pendingOperations](self, "pendingOperations", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16);
          -[AMSUIAssetQueue pendingOperations](self, "pendingOperations");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", v17);
          v19 = (id)objc_claimAutoreleasedReturnValue();

          if (v19 == v5)
          {
            -[AMSUIAssetQueue pendingOperations](self, "pendingOperations");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "removeObjectForKey:", v17);

          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

    -[AMSUIAssetQueue _decrementCountAt:](self, "_decrementCountAt:", objc_msgSend(v5, "queuePriority"));
    os_unfair_lock_unlock(&self->_stateLock);
    -[AMSUIAssetQueue _removeObserverForOperation:](self, "_removeObserverForOperation:", v5);
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_opt_class();
      v23 = v22;
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v22;
      v32 = 2114;
      v33 = v24;
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] called with notification without operation object", buf, 0x16u);

    }
  }

}

- (void)_prepareToAddOperation:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  id v27;
  id v28;
  id location;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  -[AMSUIAssetQueue pendingOperations](self, "pendingOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIAssetQueue pendingOperations](self, "pendingOperations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v6, v12);

  os_unfair_lock_unlock(&self->_stateLock);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v16 = v15;
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v31 = v15;
      v32 = 2114;
      v33 = v17;
      v34 = 2117;
      v35 = v7;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cancelling old enqueued operation with key %{sensitive}@", buf, 0x20u);

    }
    objc_msgSend(v10, "operationPromise");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "operationPromise");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "finishWithPromise:", v19);

    objc_msgSend(v10, "cancel");
  }
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v6);
  objc_msgSend(v6, "operationPromise");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __50__AMSUIAssetQueue__prepareToAddOperation_withKey___block_invoke;
  v25 = &unk_24CB4F320;
  objc_copyWeak(&v27, (id *)buf);
  objc_copyWeak(&v28, &location);
  v21 = v7;
  v26 = v21;
  objc_msgSend(v20, "addFinishBlock:", &v22);

  os_unfair_lock_lock(&self->_stateLock);
  -[AMSUIAssetQueue _incrementCountAt:](self, "_incrementCountAt:", objc_msgSend(v6, "queuePriority", v22, v23, v24, v25));
  os_unfair_lock_unlock(&self->_stateLock);
  -[AMSUIAssetQueue _addObserverForOperation:](self, "_addObserverForOperation:", v6);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __50__AMSUIAssetQueue__prepareToAddOperation_withKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  char v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  if (v7)
  {
    v8 = v7;
    v9 = objc_loadWeakRetained((id *)(a1 + 48));
    v10 = objc_msgSend(v9, "isCancelled");

    if ((v10 & 1) == 0)
      objc_msgSend(WeakRetained, "_didFetchAssetWithKey:producingImage:orError:", *(_QWORD *)(a1 + 32), v11, v5);
  }

}

- (void)_didFetchAssetWithKey:(id)a3 producingImage:(id)a4 orError:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  -[AMSUIAssetQueue pendingOperations](self, "pendingOperations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSUIAssetQueue pendingOperations](self, "pendingOperations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

    -[AMSUIAssetQueue _decrementCountAt:](self, "_decrementCountAt:", objc_msgSend(v9, "queuePriority"));
    -[AMSUIAssetQueue _removeObserverForOperation:](self, "_removeObserverForOperation:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543875;
      v25 = v14;
      v26 = 2114;
      v27 = v16;
      v28 = 2117;
      v29 = v6;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Operation for key %{sensitive}@ completed with no record in queue. This is a serious bug.", (uint8_t *)&v24, 0x20u);

    }
  }
  os_unfair_lock_unlock(&self->_stateLock);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = (void *)objc_opt_class();
    v20 = v19;
    AMSLogKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIAssetQueue underlyingQueue](self, "underlyingQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "operationCount");
    v24 = 138544131;
    v25 = v19;
    v26 = 2114;
    v27 = v21;
    v28 = 2117;
    v29 = v6;
    v30 = 2048;
    v31 = v23;
    _os_log_impl(&dword_211102000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Completed operation for %{sensitive}@ %lu operations pending", (uint8_t *)&v24, 0x2Au);

  }
}

- (void)addOperation:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[AMSUIAssetQueue _prepareToAddOperation:withKey:](self, "_prepareToAddOperation:withKey:", v7, v6);
  -[AMSUIAssetQueue underlyingQueue](self, "underlyingQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v7);

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    AMSLogKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIAssetQueue underlyingQueue](self, "underlyingQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v11;
    v17 = 2114;
    v18 = v13;
    v19 = 2114;
    v20 = v6;
    v21 = 2048;
    v22 = objc_msgSend(v14, "operationCount");
    _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Began operation for %{public}@ %lu operations pending", (uint8_t *)&v15, 0x2Au);

  }
}

- (id)operationWithKey:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[AMSUIAssetQueue pendingOperations](self, "pendingOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_stateLock);
  return v8;
}

- (NSOperationQueue)underlyingQueue
{
  return self->_underlyingQueue;
}

- (void)setUnderlyingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingQueue, a3);
}

- (NSMutableDictionary)pendingOperations
{
  return self->_pendingOperations;
}

- (void)setPendingOperations:(id)a3
{
  objc_storeStrong((id *)&self->_pendingOperations, a3);
}

- (NSCountedSet)priorityCounts
{
  return self->_priorityCounts;
}

- (void)setPriorityCounts:(id)a3
{
  objc_storeStrong((id *)&self->_priorityCounts, a3);
}

- (os_unfair_lock_s)stateLock
{
  return self->_stateLock;
}

- (void)setStateLock:(os_unfair_lock_s)a3
{
  self->_stateLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityCounts, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_underlyingQueue, 0);
}

@end
