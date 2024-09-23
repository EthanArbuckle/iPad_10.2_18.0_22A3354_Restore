@implementation AKGlobalConfig

+ (id)sharedInstance
{
  if (sharedInstance_pred_0 != -1)
    dispatch_once(&sharedInstance_pred_0, &__block_literal_global_45);
  return (id)sharedInstance_sharedInstance_4;
}

void __32__AKGlobalConfig_sharedInstance__block_invoke()
{
  AKGlobalConfig *v0;
  void *v1;

  v0 = objc_alloc_init(AKGlobalConfig);
  v1 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = (uint64_t)v0;

}

- (void)fetchGlobalConfigUsingCachePolicy:(unint64_t)a3 completion:(id)a4
{
  id v5;
  AKAppleIDAuthenticationController *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = objc_alloc_init(AKAppleIDAuthenticationController);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__AKGlobalConfig_fetchGlobalConfigUsingCachePolicy_completion___block_invoke;
  v8[3] = &unk_1E2E5E248;
  v9 = v5;
  v7 = v5;
  -[AKAppleIDAuthenticationController fetchGlobalConfigurationUsingPolicy:completion:](v6, "fetchGlobalConfigurationUsingPolicy:completion:", a3, v8);

}

uint64_t __63__AKGlobalConfig_fetchGlobalConfigUsingCachePolicy_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
