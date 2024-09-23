@implementation NRURLResolutionManager

- (NRURLResolutionManager)init
{
  NRURLResolutionManager *v2;
  uint64_t v3;
  NRBloomFilterInfoService *bloomFilterInfoService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NRURLResolutionManager;
  v2 = -[NRURLResolutionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    bloomFilterInfoService = v2->_bloomFilterInfoService;
    v2->_bloomFilterInfoService = (NRBloomFilterInfoService *)v3;

  }
  return v2;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__NRURLResolutionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_result;
}

void __39__NRURLResolutionManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_result;
  sharedManager_result = (uint64_t)v1;

}

- (id)createResolutionOperationForWebURL:(id)a3
{
  id v4;
  NRWebURLResolutionOperation *v5;
  void *v6;
  NRWebURLResolutionOperation *v7;

  v4 = a3;
  v5 = [NRWebURLResolutionOperation alloc];
  -[NRURLResolutionManager bloomFilterInfoService](self, "bloomFilterInfoService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NRWebURLResolutionOperation initWithWebURL:bloomFilterInfoService:](v5, "initWithWebURL:bloomFilterInfoService:", v4, v6);

  return v7;
}

- (id)createResolutionOperationForNewsURL:(id)a3
{
  id v3;
  NRNewsURLResolutionOperation *v4;

  v3 = a3;
  v4 = -[NRNewsURLResolutionOperation initWithNewsURL:]([NRNewsURLResolutionOperation alloc], "initWithNewsURL:", v3);

  return v4;
}

- (BOOL)userHasBundleSubscription
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.newscore"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("news_url_resolution_subscription_status"));

  return v3;
}

- (NRBloomFilterInfoService)bloomFilterInfoService
{
  return self->_bloomFilterInfoService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bloomFilterInfoService, 0);
}

@end
