@implementation FBKRequestsLog

- (FBKRequestsLog)init
{
  FBKRequestsLog *v2;
  uint64_t v3;
  NSMutableArray *requests;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FBKRequestsLog;
  v2 = -[FBKRequestsLog init](&v14, sel_init);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v3 = objc_claimAutoreleasedReturnValue();
  requests = v2->_requests;
  v2->_requests = (NSMutableArray *)v3;

  if (FBKIsInternalInstall(v5, v6))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FBK_RECORD_FIXTURES"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("1"));

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("showDebugRequests"));

  v2->_isActive = v10 | v12;
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_11);
  return (id)sharedInstance_sharedInstance_0;
}

void __32__FBKRequestsLog_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = v0;

  if (FBKIsInternalInstall(v2, v3))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FBK_RECORD_FIXTURES"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));

    if (v7)
    {
      +[FBKFileManager applicationSupportDirectory](FBKFileManager, "applicationSupportDirectory");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(sharedInstance_sharedInstance_0 + 24);
      *(_QWORD *)(sharedInstance_sharedInstance_0 + 24) = v8;

      +[FBKLog appHandle](FBKLog, "appHandle");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(sharedInstance_sharedInstance_0 + 24);
        v18 = 138412290;
        v19 = v11;
        _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_INFO, "will record fixtures at [%@]", (uint8_t *)&v18, 0xCu);
      }

      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -1);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_queue_create("FeedbackAssistant.RequestSaveQueue.Internal", v12);
      v14 = *(void **)(sharedInstance_sharedInstance_0 + 32);
      *(_QWORD *)(sharedInstance_sharedInstance_0 + 32) = v13;

    }
    if (objc_msgSend((id)sharedInstance_sharedInstance_0, "isActive"))
    {
      objc_msgSend(MEMORY[0x24BE2CA60], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHostIdentifier:", CFSTR("FBK"));

      objc_msgSend(MEMORY[0x24BE2CA60], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setOnPeerJoin:", &__block_literal_global_15);

      objc_msgSend(MEMORY[0x24BE2CA60], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "start");

    }
  }
}

void __32__FBKRequestsLog_sharedInstance__block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[FBKRequestsLog sharedInstance](FBKRequestsLog, "sharedInstance", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x24BE2CA60], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sendRecord:toPeer:", v9, v2);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (BOOL)active
{
  return self->_isActive;
}

- (id)mutableArrayValueForKey:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBKRequestsLog;
  -[FBKRequestsLog mutableArrayValueForKey:](&v4, sel_mutableArrayValueForKey_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addRequest:(id)a3
{
  id v4;

  objc_msgSend(a3, "wrappedObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKRequestsLog _addRequest:](self, "_addRequest:", v4);

}

- (void)_addRequest:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  FBKRequestsLog *v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __30__FBKRequestsLog__addRequest___block_invoke;
  v18 = &unk_24E157020;
  v19 = self;
  v6 = v4;
  v20 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], &v15);
  -[FBKRequestsLog requestDirectoryURL](self, "requestDirectoryURL", v15, v16, v17, v18, v19);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = (void *)v7;
    v10 = FBKIsInternalInstall(v7, v8);

    if (v10)
    {
      -[FBKRequestsLog requestDirectoryURL](self, "requestDirectoryURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKRequestsLog requestSaveQueue](self, "requestSaveQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v6;
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __saveRequest_block_invoke;
      block[3] = &unk_24E157020;
      v22 = v13;
      v23 = v11;
      v14 = v11;
      dispatch_async(v12, block);

    }
  }

}

void __30__FBKRequestsLog__addRequest___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "requests");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertObject:inRequestsAtIndex:", v2, objc_msgSend(v3, "count"));

}

- (void)insertObject:(id)a3 inRequestsAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[FBKRequestsLog requests](self, "requests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v6, a4);

  objc_msgSend(MEMORY[0x24BE2CA60], "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "broadcastRecord:", v6);

}

- (void)removeObjectFromRequestsAtIndex:(unint64_t)a3
{
  id v4;

  -[FBKRequestsLog requests](self, "requests");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectAtIndex:", a3);

}

- (void)replaceObjectInRequestsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[FBKRequestsLog requests](self, "requests");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", a3, v6);

}

- (NSMutableArray)requests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (NSURL)requestDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequestDirectoryURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)requestSaveQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRequestSaveQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSaveQueue, 0);
  objc_storeStrong((id *)&self->_requestDirectoryURL, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
