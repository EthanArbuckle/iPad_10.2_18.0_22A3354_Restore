@implementation AUHostingServiceInstanceMap

- (AUHostingServiceInstanceMap)init
{
  AUHostingServiceInstanceMap *v2;
  uint64_t v3;
  NSMutableDictionary *instances;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AUHostingServiceInstanceMap;
  v2 = -[AUHostingServiceInstanceMap init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    instances = v2->_instances;
    v2->_instances = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)registerInstance:(id)a3 instance:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  int v10;
  NSMutableDictionary *instances;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = self->_instances;
  objc_sync_enter(v7);
  -[NSMutableDictionary allKeys](self->_instances, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
    std::terminate();
  instances = self->_instances;
  objc_msgSend(v13, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](instances, "setObject:forKeyedSubscript:", v6, v12);

  objc_sync_exit(v7);
}

- (void)unregisterInstance:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *instances;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self->_instances;
  objc_sync_enter(v4);
  if (v7)
  {
    instances = self->_instances;
    objc_msgSend(v7, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](instances, "removeObjectForKey:", v6);

  }
  objc_sync_exit(v4);

}

- (id)retrieveInstance:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *instances;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self->_instances;
  objc_sync_enter(v5);
  instances = self->_instances;
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](instances, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instances, 0);
}

+ (id)sharedInstance
{
  if (+[AUHostingServiceInstanceMap sharedInstance]::onceToken != -1)
    dispatch_once(&+[AUHostingServiceInstanceMap sharedInstance]::onceToken, &__block_literal_global_6899);
  return (id)+[AUHostingServiceInstanceMap sharedInstance]::sSharedInstance;
}

void __45__AUHostingServiceInstanceMap_sharedInstance__block_invoke()
{
  AUHostingServiceInstanceMap *v0;
  void *v1;

  v0 = objc_alloc_init(AUHostingServiceInstanceMap);
  v1 = (void *)+[AUHostingServiceInstanceMap sharedInstance]::sSharedInstance;
  +[AUHostingServiceInstanceMap sharedInstance]::sSharedInstance = (uint64_t)v0;

}

@end
