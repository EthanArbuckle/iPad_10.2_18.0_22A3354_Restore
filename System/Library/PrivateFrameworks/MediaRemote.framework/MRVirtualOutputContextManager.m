@implementation MRVirtualOutputContextManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_85);
  return (id)sharedManager___sharedService;
}

void __46__MRVirtualOutputContextManager_sharedManager__block_invoke()
{
  MRVirtualOutputContextManager *v0;
  void *v1;

  v0 = objc_alloc_init(MRVirtualOutputContextManager);
  v1 = (void *)sharedManager___sharedService;
  sharedManager___sharedService = (uint64_t)v0;

}

- (id)fetchForUID:(id)a3
{
  id v4;
  MRVirtualOutputContextManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_ouputContextMap, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)addOutputContext:(id)a3
{
  MRVirtualOutputContextManager *v4;
  NSMutableDictionary *ouputContextMap;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  ouputContextMap = v4->_ouputContextMap;
  objc_msgSend(v7, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](ouputContextMap, "setObject:forKeyedSubscript:", v7, v6);

  objc_sync_exit(v4);
}

- (void)removeOutputContext:(id)a3
{
  MRVirtualOutputContextManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_ouputContextMap, "setObject:forKeyedSubscript:", 0, v5);
  objc_sync_exit(v4);

}

- (NSArray)outputContext
{
  return self->_outputContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->_ouputContextMap, 0);
}

@end
