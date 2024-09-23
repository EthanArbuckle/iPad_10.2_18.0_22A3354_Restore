@implementation AXMMADSService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_31);
  return (id)sharedInstance__Shared_1;
}

void __32__AXMMADSService_sharedInstance__block_invoke()
{
  AXMMADSService *v0;
  void *v1;

  v0 = objc_alloc_init(AXMMADSService);
  v1 = (void *)sharedInstance__Shared_1;
  sharedInstance__Shared_1 = (uint64_t)v0;

}

- (AXMMADSService)init
{
  AXMMADSService *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;
  uint8_t buf[8];
  uint64_t v10;
  Class (*v11)(uint64_t);
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v8.receiver = self;
  v8.super_class = (Class)AXMMADSService;
  v2 = -[AXMMADSService init](&v8, sel_init);
  if (v2)
  {
    AXMediaLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0E3B000, v3, OS_LOG_TYPE_DEFAULT, "AXM Media Analysis: Initializing MediaAnalysisService", buf, 2u);
    }

    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v4 = (void *)getMADServiceClass_softClass;
    v17 = getMADServiceClass_softClass;
    if (!getMADServiceClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __getMADServiceClass_block_invoke;
      v12 = &unk_1E625C4E8;
      v13 = &v14;
      __getMADServiceClass_block_invoke((uint64_t)buf);
      v4 = (void *)v15[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v14, 8);
    objc_msgSend(v5, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMMADSService setService:](v2, "setService:", v6);

  }
  return v2;
}

- (MADService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
