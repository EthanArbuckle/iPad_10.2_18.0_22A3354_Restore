@implementation IMBrandManager

+ (id)sharedInstance
{
  if (qword_1ECFC74D0 != -1)
    dispatch_once(&qword_1ECFC74D0, &unk_1E3FB3C48);
  return (id)qword_1ECFC6F58;
}

- (id)_init
{
  IMBrandManager *v2;
  int v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BSUIBrandManager *mapKitBrandManager;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  BSUIBrandManager *chatBotBrandManager;
  NSOperationQueue *v14;
  NSOperationQueue *brandFetchQueue;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)IMBrandManager;
  v2 = -[IMBrandManager init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_msgSend((id)qword_1EE504460, "instancesRespondToSelector:", sel_initWithCachingEnabled_cacheURL_);
    v4 = objc_alloc((Class)qword_1EE504460);
    v5 = IMIsRunningInMessages();
    if (v3)
    {
      IMCachesDirectoryURL();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "initWithCachingEnabled:cacheURL:", v5, v6);
      mapKitBrandManager = v2->_mapKitBrandManager;
      v2->_mapKitBrandManager = (BSUIBrandManager *)v7;

    }
    else
    {
      v9 = objc_msgSend(v4, "initWithCachingEnabled:", v5);
      v6 = v2->_mapKitBrandManager;
      v2->_mapKitBrandManager = (BSUIBrandManager *)v9;
    }

    +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isLazuliEnabled");

    if (v11)
    {
      v12 = objc_msgSend(objc_alloc((Class)qword_1EE504460), "initWithBrandType:cachingEnabled:", 0, IMIsRunningInMessages());
      chatBotBrandManager = v2->_chatBotBrandManager;
      v2->_chatBotBrandManager = (BSUIBrandManager *)v12;

    }
    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    brandFetchQueue = v2->_brandFetchQueue;
    v2->_brandFetchQueue = v14;

    dispatch_get_global_queue(33, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setUnderlyingQueue:](v2->_brandFetchQueue, "setUnderlyingQueue:", v16);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_brandFetchQueue, "setMaxConcurrentOperationCount:", 1);
  }
  return v2;
}

- (id)brandManagerForType:(unint64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
  {
    v3 = 8;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v3 = 16;
LABEL_5:
    a2 = (SEL)*(id *)((char *)&self->super.isa + v3);
  }
  return (id)(id)a2;
}

- (void)brandWithURI:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a4;
  v8 = a3;
  if (MEMORY[0x1A1AE7CF8]())
    v7 = 1;
  else
    v7 = 2;
  -[IMBrandManager brandWithURI:forType:completion:](self, "brandWithURI:forType:completion:", v8, v7, v6);

}

- (void)brandWithURI:(id)a3 forType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSOperationQueue *brandFetchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  brandFetchQueue = self->_brandFetchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_19E2FB978;
  v13[3] = &unk_1E3FB8E58;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  -[NSOperationQueue addOperationWithBlock:](brandFetchQueue, "addOperationWithBlock:", v13);

}

- (BSUIBrandManager)mapKitBrandManager
{
  return self->_mapKitBrandManager;
}

- (void)setMapKitBrandManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapKitBrandManager, a3);
}

- (BSUIBrandManager)chatBotBrandManager
{
  return self->_chatBotBrandManager;
}

- (void)setChatBotBrandManager:(id)a3
{
  objc_storeStrong((id *)&self->_chatBotBrandManager, a3);
}

- (NSOperationQueue)brandFetchQueue
{
  return self->_brandFetchQueue;
}

- (void)setBrandFetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_brandFetchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandFetchQueue, 0);
  objc_storeStrong((id *)&self->_chatBotBrandManager, 0);
  objc_storeStrong((id *)&self->_mapKitBrandManager, 0);
}

@end
