@implementation BMAccessDaemon

- (BMAccessDaemon)initWithQueue:(id)a3 delegate:(id)a4
{
  NSObject *v7;
  id v8;
  BMAccessDaemon *v9;
  BMAccessDaemon *v10;
  BMAccessServiceListener *v11;
  BMAccessServiceListener *legacyAccessService;
  BMAccessServiceListener *v13;
  BMAccessServiceListener *userAccessService;
  BMAccessServiceListener *v15;
  BMAccessServiceListener *systemAccessService;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2(v7);
  v18.receiver = self;
  v18.super_class = (Class)BMAccessDaemon;
  v9 = -[BMAccessDaemon init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = -[BMAccessServiceListener initLegacyWithQueue:]([BMAccessServiceListener alloc], "initLegacyWithQueue:", v7);
    legacyAccessService = v10->_legacyAccessService;
    v10->_legacyAccessService = v11;

    v13 = -[BMAccessServiceListener initWithDomain:queue:delegate:]([BMAccessServiceListener alloc], "initWithDomain:queue:delegate:", 0, v7, v8);
    userAccessService = v10->_userAccessService;
    v10->_userAccessService = v13;

    v15 = -[BMAccessServiceListener initWithDomain:queue:delegate:]([BMAccessServiceListener alloc], "initWithDomain:queue:delegate:", 1, v7, v8);
    systemAccessService = v10->_systemAccessService;
    v10->_systemAccessService = v15;

    -[BMAccessServiceListener activate](v10->_legacyAccessService, "activate");
    -[BMAccessServiceListener activate](v10->_userAccessService, "activate");
    -[BMAccessServiceListener activate](v10->_systemAccessService, "activate");
  }

  return v10;
}

+ (BOOL)isAgent
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BMAccessServiceListener)legacyAccessService
{
  return self->_legacyAccessService;
}

- (BMAccessServiceListener)userAccessService
{
  return self->_userAccessService;
}

- (BMAccessServiceListener)systemAccessService
{
  return self->_systemAccessService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAccessService, 0);
  objc_storeStrong((id *)&self->_userAccessService, 0);
  objc_storeStrong((id *)&self->_legacyAccessService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
