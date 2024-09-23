@implementation CESRAssistantOnDeviceSampling

- (CESRAssistantOnDeviceSampling)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CESRAssistantOnDeviceSampling;
  return -[CESRAssistantOnDeviceSampling init](&v3, sel_init);
}

- (BOOL)isRequestSelectedForSamplingForTask:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "siriDataSharingOptInStatus");

  if (v5 == 1)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SearchOrMessaging")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("SiriDictation")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("Beto")) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("BetoDictation"));
    }
  }
  else
  {
    v7 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = "-[CESRAssistantOnDeviceSampling isRequestSelectedForSamplingForTask:]";
      _os_log_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_INFO, "%s Assistant Sampling: User is NOT opted in.", (uint8_t *)&v9, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_261);
  return (id)sharedManager_sharedMyManager;
}

void __46__CESRAssistantOnDeviceSampling_sharedManager__block_invoke()
{
  CESRAssistantOnDeviceSampling *v0;
  void *v1;

  v0 = objc_alloc_init(CESRAssistantOnDeviceSampling);
  v1 = (void *)sharedManager_sharedMyManager;
  sharedManager_sharedMyManager = (uint64_t)v0;

}

@end
