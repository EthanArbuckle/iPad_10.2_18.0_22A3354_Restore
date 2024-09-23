@implementation ASDArcadeService

- (void)allBadgeMetricsWithReplyHandler:(id)a3
{
  -[ASDAppStoreService allBadgeMetricsWithReplyHandler:](self->_appstoreService, "allBadgeMetricsWithReplyHandler:", a3);
}

- (void)addBadgeIDs:(id)a3 replyHandler:(id)a4
{
  -[ASDAppStoreService addBadgeIDs:replyHandler:](self->_appstoreService, "addBadgeIDs:replyHandler:", a3, a4);
}

+ (id)defaultService
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ASDArcadeService_defaultService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAB48 != -1)
    dispatch_once(&qword_1ECFFAB48, block);
  return (id)_MergedGlobals_48;
}

void __34__ASDArcadeService_defaultService__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_48;
  _MergedGlobals_48 = (uint64_t)v1;

}

- (ASDArcadeService)init
{
  ASDAppStoreService *v3;
  ASDAppStoreService *appstoreService;

  +[ASDAppStoreService defaultService](ASDAppStoreService, "defaultService");
  v3 = (ASDAppStoreService *)objc_claimAutoreleasedReturnValue();
  appstoreService = self->_appstoreService;
  self->_appstoreService = v3;

  return self;
}

- (void)allBadgeIDsWithReplyHandler:(id)a3
{
  -[ASDAppStoreService allBadgeIDsWithReplyHandler:](self->_appstoreService, "allBadgeIDsWithReplyHandler:", a3);
}

- (void)removeAllBadgeIDsWithReplyHandler:(id)a3
{
  -[ASDAppStoreService removeAllBadgeIDsWithReplyHandler:](self->_appstoreService, "removeAllBadgeIDsWithReplyHandler:", a3);
}

- (void)removeBadgeIDs:(id)a3 replyHandler:(id)a4
{
  -[ASDAppStoreService removeBadgeIDs:replyHandler:](self->_appstoreService, "removeBadgeIDs:replyHandler:", a3, a4);
}

- (void)removeMetricsForBadgeIDs:(id)a3 replyHandler:(id)a4
{
  -[ASDAppStoreService removeMetricsForBadgeIDs:replyHandler:](self->_appstoreService, "removeMetricsForBadgeIDs:replyHandler:", a3, a4);
}

- (void)badgeCountWithReplyHandler:(id)a3
{
  -[ASDAppStoreService badgeCountWithReplyHandler:](self->_appstoreService, "badgeCountWithReplyHandler:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appstoreService, 0);
}

@end
