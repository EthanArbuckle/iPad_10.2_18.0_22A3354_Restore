@implementation SKPrivacyController

+ (id)_sharedCloudServiceStatusMonitor
{
  if (_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitorOnceToken != -1)
    dispatch_once(&_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitorOnceToken, &__block_literal_global_2);
  return (id)_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitor;
}

void __55__SKPrivacyController__sharedCloudServiceStatusMonitor__block_invoke()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getICCloudServiceStatusMonitorClass_softClass;
  v8 = getICCloudServiceStatusMonitorClass_softClass;
  if (!getICCloudServiceStatusMonitorClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getICCloudServiceStatusMonitorClass_block_invoke;
    v4[3] = &unk_1E5B26828;
    v4[4] = &v5;
    __getICCloudServiceStatusMonitorClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_alloc_init(v1);
  v3 = (void *)_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitor;
  _sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitor = (uint64_t)v2;

}

+ (int64_t)_authorizationStatusFromUnderlyingAuthorizationStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (int64_t)authorizationStatus
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "_sharedCloudServiceStatusMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "authorizationStatusForScopes:", 1);

  return objc_msgSend(a1, "_authorizationStatusFromUnderlyingAuthorizationStatus:", v4);
}

+ (void)requestAuthorization:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_sharedCloudServiceStatusMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SKPrivacyController_requestAuthorization___block_invoke;
  v7[3] = &unk_1E5B26BA0;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "requestAuthorizationForScopes:completionHandler:", 1, v7);

}

uint64_t __44__SKPrivacyController_requestAuthorization___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (*(_QWORD *)(result + 32))
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 40), "_authorizationStatusFromUnderlyingAuthorizationStatus:", a2);
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

@end
