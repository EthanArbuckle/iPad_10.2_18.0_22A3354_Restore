@implementation _MDExtensionLoader

- (_MDExtensionLoader)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MDExtensionLoader;
  return -[_MDExtensionLoader init](&v3, sel_init);
}

- (void)findExtensionsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (!v4)
    -[_MDExtensionLoader findExtensionsWithCompletionBlock:].cold.1();
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB35D8];
  objc_msgSend((id)objc_opt_class(), "_matchDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56___MDExtensionLoader_findExtensionsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E2404CB8;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "extensionsWithMatchingAttributes:completion:", v7, v9);

}

- (void)startLookingForExtensionsWithMatchUpdateHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
    -[_MDExtensionLoader startLookingForExtensionsWithMatchUpdateHandler:].cold.1();
  v5 = v4;
  logForCSLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C42F000, v6, OS_LOG_TYPE_DEFAULT, "startLookingForExtensionsWithMatchUpdateHandler", buf, 2u);
  }

  -[_MDExtensionLoader queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70___MDExtensionLoader_startLookingForExtensionsWithMatchUpdateHandler___block_invoke;
  v9[3] = &unk_1E2404CE0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, v9);

}

- (void)stopLookingForExtensions
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18C42F000, log, OS_LOG_TYPE_DEBUG, "Done looking for indexing extensions", v1, 2u);
}

- (id)matchingContext
{
  return self->_matchingContext;
}

- (void)setMatchingContext:(id)a3
{
  objc_storeStrong(&self->_matchingContext, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDictionary)extensionsByBundleId
{
  return self->_extensionsByBundleId;
}

- (void)setExtensionsByBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_extensionsByBundleId, a3);
}

- (NSDictionary)fileProviderBundleMap
{
  return self->_fileProviderBundleMap;
}

- (void)setFileProviderBundleMap:(id)a3
{
  objc_storeStrong((id *)&self->_fileProviderBundleMap, a3);
}

- (NSSet)fileProviderBundleIDs
{
  return self->_fileProviderBundleIDs;
}

- (void)setFileProviderBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_fileProviderBundleIDs, a3);
}

- (NSMutableArray)containerPaths
{
  return self->_containerPaths;
}

- (void)setContainerPaths:(id)a3
{
  objc_storeStrong((id *)&self->_containerPaths, a3);
}

- (NSMutableArray)queueLabels
{
  return self->_queueLabels;
}

- (void)setQueueLabels:(id)a3
{
  objc_storeStrong((id *)&self->_queueLabels, a3);
}

- (NSMutableArray)containerIDs
{
  return self->_containerIDs;
}

- (void)setContainerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_containerIDs, a3);
}

- (NSMutableArray)extensionIdentifiers
{
  return self->_extensionIdentifiers;
}

- (void)setExtensionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_extensionIdentifiers, a3);
}

- (BOOL)extensionsCacheNeedsLoad
{
  return self->_extensionsCacheNeedsLoad;
}

- (void)setExtensionsCacheNeedsLoad:(BOOL)a3
{
  self->_extensionsCacheNeedsLoad = a3;
}

- (int64_t)notificationCount
{
  return self->_notificationCount;
}

- (void)setNotificationCount:(int64_t)a3
{
  self->_notificationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerIDs, 0);
  objc_storeStrong((id *)&self->_queueLabels, 0);
  objc_storeStrong((id *)&self->_containerPaths, 0);
  objc_storeStrong((id *)&self->_fileProviderBundleIDs, 0);
  objc_storeStrong((id *)&self->_fileProviderBundleMap, 0);
  objc_storeStrong((id *)&self->_extensionsByBundleId, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_matchingContext, 0);
}

- (void)findExtensionsWithCompletionBlock:.cold.1()
{
  __assert_rtn("-[_MDExtensionLoader findExtensionsWithCompletionBlock:]", "_MDIndexExtensionLoader.m", 391, "completionBlock");
}

- (void)startLookingForExtensionsWithMatchUpdateHandler:.cold.1()
{
  __assert_rtn("-[_MDExtensionLoader startLookingForExtensionsWithMatchUpdateHandler:]", "_MDIndexExtensionLoader.m", 412, "updateHandler");
}

@end
