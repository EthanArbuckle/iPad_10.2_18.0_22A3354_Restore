@implementation IMBalloonPluginManagerModel

- (IMThreadSafeBalloonPluginMap)pluginsMap
{
  return self->_pluginsMap;
}

- (BOOL)hasDeferredInstalledAppsChangedNotification
{
  IMBalloonPluginManagerModel *v2;
  BOOL hasDeferredInstalledAppsChangedNotification;

  v2 = self;
  objc_sync_enter(v2);
  hasDeferredInstalledAppsChangedNotification = v2->_hasDeferredInstalledAppsChangedNotification;
  objc_sync_exit(v2);

  return hasDeferredInstalledAppsChangedNotification;
}

- (void)setPluginsToRemoveAfterExtensionsUpdate:(id)a3
{
  NSSet *v4;
  NSSet *pluginsToRemoveAfterExtensionsUpdate;
  IMBalloonPluginManagerModel *obj;

  v4 = (NSSet *)a3;
  obj = self;
  objc_sync_enter(obj);
  pluginsToRemoveAfterExtensionsUpdate = obj->_pluginsToRemoveAfterExtensionsUpdate;
  obj->_pluginsToRemoveAfterExtensionsUpdate = v4;

  objc_sync_exit(obj);
}

- (void)setPluginMetaDataFolder:(id)a3
{
  NSString *v4;
  NSString *pluginMetaDataFolder;
  IMBalloonPluginManagerModel *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  pluginMetaDataFolder = obj->_pluginMetaDataFolder;
  obj->_pluginMetaDataFolder = v4;

  objc_sync_exit(obj);
}

- (void)setPluginIDToMetadataCache:(id)a3
{
  NSDictionary *v4;
  NSDictionary *pluginIDToMetadataCache;
  IMBalloonPluginManagerModel *obj;

  v4 = (NSDictionary *)a3;
  obj = self;
  objc_sync_enter(obj);
  pluginIDToMetadataCache = obj->_pluginIDToMetadataCache;
  obj->_pluginIDToMetadataCache = v4;

  objc_sync_exit(obj);
}

- (void)setHighMemoryExtensionMatchingContext:(id)a3
{
  id v4;
  id highMemoryExtensionMatchingContext;
  IMBalloonPluginManagerModel *obj;

  v4 = a3;
  obj = self;
  objc_sync_enter(obj);
  highMemoryExtensionMatchingContext = obj->_highMemoryExtensionMatchingContext;
  obj->_highMemoryExtensionMatchingContext = v4;

  objc_sync_exit(obj);
}

- (void)setHasDeferredInstalledAppsChangedNotification:(BOOL)a3
{
  IMBalloonPluginManagerModel *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_hasDeferredInstalledAppsChangedNotification = a3;
  objc_sync_exit(obj);

}

- (void)setHasCompletedInitialization:(BOOL)a3
{
  IMBalloonPluginManagerModel *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_hasCompletedInitialization = a3;
  objc_sync_exit(obj);

}

- (void)setExtensionMatchingContext:(id)a3
{
  id v4;
  id extensionMatchingContext;
  IMBalloonPluginManagerModel *obj;

  v4 = a3;
  obj = self;
  objc_sync_enter(obj);
  extensionMatchingContext = obj->_extensionMatchingContext;
  obj->_extensionMatchingContext = v4;

  objc_sync_exit(obj);
}

- (NSSet)pluginsToRemoveAfterExtensionsUpdate
{
  return self->_pluginsToRemoveAfterExtensionsUpdate;
}

- (IMBalloonPluginManagerModel)init
{
  IMBalloonPluginManagerModel *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *dataQueue;
  IMThreadSafeBalloonPluginMap *v7;
  IMThreadSafeBalloonPluginMap *pluginsMap;
  uint64_t v9;
  NSDictionary *pluginIDToMetadataCache;
  uint64_t v11;
  NSSet *pluginsToRemoveAfterExtensionsUpdate;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IMBalloonPluginManagerModel;
  v2 = -[IMBalloonPluginManagerModel init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.IMCore.IMBalloonPluginManagerModel", v4);
    dataQueue = v2->_dataQueue;
    v2->_dataQueue = (OS_dispatch_queue *)v5;

    v7 = -[IMThreadSafeBalloonPluginMap initWithConcurrentDataQueue:]([IMThreadSafeBalloonPluginMap alloc], "initWithConcurrentDataQueue:", v2->_dataQueue);
    pluginsMap = v2->_pluginsMap;
    v2->_pluginsMap = v7;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    pluginIDToMetadataCache = v2->_pluginIDToMetadataCache;
    v2->_pluginIDToMetadataCache = (NSDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    pluginsToRemoveAfterExtensionsUpdate = v2->_pluginsToRemoveAfterExtensionsUpdate;
    v2->_pluginsToRemoveAfterExtensionsUpdate = (NSSet *)v11;

  }
  return v2;
}

- (BOOL)hasCompletedInitialization
{
  IMBalloonPluginManagerModel *v2;
  BOOL hasCompletedInitialization;

  v2 = self;
  objc_sync_enter(v2);
  hasCompletedInitialization = v2->_hasCompletedInitialization;
  objc_sync_exit(v2);

  return hasCompletedInitialization;
}

- (id)extensionMatchingContext
{
  IMBalloonPluginManagerModel *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_extensionMatchingContext;
  objc_sync_exit(v2);

  return v3;
}

- (id)highMemoryExtensionMatchingContext
{
  IMBalloonPluginManagerModel *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_highMemoryExtensionMatchingContext;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)pluginMetaDataFolder
{
  IMBalloonPluginManagerModel *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_pluginMetaDataFolder;
  objc_sync_exit(v2);

  return v3;
}

- (Class)richLinksDataSourceClass
{
  IMBalloonPluginManagerModel *v2;
  objc_class *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_richLinksDataSourceClass;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRichLinksDataSourceClass:(Class)a3
{
  IMBalloonPluginManagerModel *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_storeStrong((id *)&obj->_richLinksDataSourceClass, a3);
  objc_sync_exit(obj);

}

- (NSDictionary)pluginIDToMetadataCache
{
  return self->_pluginIDToMetadataCache;
}

- (OS_dispatch_queue)dataQueue
{
  return self->_dataQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_pluginsToRemoveAfterExtensionsUpdate, 0);
  objc_storeStrong((id *)&self->_pluginsMap, 0);
  objc_storeStrong((id *)&self->_richLinksDataSourceClass, 0);
  objc_storeStrong((id *)&self->_pluginIDToMetadataCache, 0);
  objc_storeStrong((id *)&self->_pluginMetaDataFolder, 0);
  objc_storeStrong(&self->_highMemoryExtensionMatchingContext, 0);
  objc_storeStrong(&self->_extensionMatchingContext, 0);
}

@end
