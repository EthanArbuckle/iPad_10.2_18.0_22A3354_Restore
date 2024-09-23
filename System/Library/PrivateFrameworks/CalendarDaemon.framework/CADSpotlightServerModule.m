@implementation CADSpotlightServerModule

- (void)receivedNotificationNamed:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D0BE60]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D0BE68]))
  {
    v5 = CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEFAULT, "Received db change notification, starting to index unconsumed changes", v6, 2u);
    }
    -[CADSpotlightIndexer indexUnconsumedChanges](self->_indexer, "indexUnconsumedChanges");
  }

}

- (CADSpotlightServerModule)initWithSpotlightEntityAnnotator:(id)a3
{
  id v5;
  CADSpotlightServerModule *v6;
  CADSpotlightServerModule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADSpotlightServerModule;
  v6 = -[CADSpotlightServerModule init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_spotlightEntityAnnotator, a3);

  return v7;
}

- (void)activate
{
  NSObject *v3;
  CADSpotlightIndexer *v4;
  CADSpotlightIndexer *indexer;
  uint8_t v6[16];

  v3 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEFAULT, "activate", v6, 2u);
  }
  +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("activate"));
  v4 = -[CADSpotlightIndexer initWithSpotlightEntityAnnotator:]([CADSpotlightIndexer alloc], "initWithSpotlightEntityAnnotator:", self->_spotlightEntityAnnotator);
  indexer = self->_indexer;
  self->_indexer = v4;

  if (MEMORY[0x1E0DA9C78])
    SpotlightDaemonClientRegister();
}

- (void)deactivate
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEFAULT, "deactivate", v4, 2u);
  }
  +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("deactivate"));
  -[CADSpotlightIndexer cancelOngoingWorkAndShutdown](self->_indexer, "cancelOngoingWorkAndShutdown");
}

- (void)protectedDataDidBecomeAvailable
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEFAULT, "protectedDataDidBecomeAvailable, checking if we should do a full reindex", v4, 2u);
  }
  +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("protectedDataDidBecomeAvailable"));
  -[CADSpotlightIndexer checkForAndReportPastSpotlightMigrationErrorsAndReindexIfNeeded](self->_indexer, "checkForAndReportPastSpotlightMigrationErrorsAndReindexIfNeeded");
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  -[CADSpotlightIndexer provideDataForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:](self->_indexer, "provideDataForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:", a3, a4, a5, a6, a7, a8);
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  -[CADSpotlightIndexer provideFileURLForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:](self->_indexer, "provideFileURLForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:", a3, a4, a5, a6, a7, a8);
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  -[CADSpotlightIndexer reindexAllItemsForBundleID:protectionClass:acknowledgementHandler:](self->_indexer, "reindexAllItemsForBundleID:protectionClass:acknowledgementHandler:", a3, a4, a5);
}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  -[CADSpotlightIndexer reindexItemsWithIdentifiers:bundleID:protectionClass:acknowledgementHandler:](self->_indexer, "reindexItemsWithIdentifiers:bundleID:protectionClass:acknowledgementHandler:", a3, a4, a5, a6);
}

- (CalSpotlightEntityAnnotator)spotlightEntityAnnotator
{
  return self->_spotlightEntityAnnotator;
}

- (CADSpotlightIndexer)indexer
{
  return self->_indexer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexer, 0);
  objc_storeStrong((id *)&self->_spotlightEntityAnnotator, 0);
}

@end
