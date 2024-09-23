@implementation CSAssetAvailabilityNotifierAssistant

- (CSAssetAvailabilityNotifierAssistant)init
{
  CSAssetAvailabilityNotifierAssistant *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSAssetAvailabilityNotifierAssistant;
  v2 = -[CSAssetAvailabilityNotifierAssistant init](&v6, sel_init);
  if (v2)
  {
    CSLogInitIfNeededWithSubsystemType(0);
    +[CSUtils getSerialQueue:qualityOfService:](CSUtils, "getSerialQueue:qualityOfService:", CFSTR("com.apple.corespeech.CSAssetAvailabilityNotifierAssistant.q"), 21);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_updateContext.state = 1;
    objc_storeStrong((id *)&v2->_updateContext.bundleIndentifier, 0);
    objc_storeStrong((id *)&v2->_updateContext.locale, 0);
    objc_storeStrong((id *)&v2->_updateContext.version, 0);
  }
  return v2;
}

- (void)checkInForUpdate:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__CSAssetAvailabilityNotifierAssistant_checkInForUpdate___block_invoke;
  v4[3] = &unk_1E687F440;
  v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)checkedInAssetForUpdate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSAssetAvailabilityNotifierAssistant *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CSAssetAvailabilityNotifierAssistant_checkedInAssetForUpdate___block_invoke;
  v7[3] = &unk_1E6880E88;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_getSettingsConnection
{
  return 0;
}

- (CSAssetAvailabilityNotifierAssistantUpdateContext)updateContext
{
  NSString *bundleIndentifier;
  CSAssetAvailabilityNotifierAssistantUpdateContext *result;

  bundleIndentifier = self->_updateContext.bundleIndentifier;
  retstr->state = self->_updateContext.state;
  retstr->bundleIndentifier = bundleIndentifier;
  retstr->locale = self->_updateContext.locale;
  result = self->_updateContext.version;
  retstr->version = (NSString *)result;
  return result;
}

- (void)setUpdateContext:(CSAssetAvailabilityNotifierAssistantUpdateContext *)a3
{
  NSString *bundleIndentifier;
  NSString *v6;
  NSString *locale;
  NSString *v8;
  NSString *version;
  NSString *v10;

  self->_updateContext.state = a3->state;
  bundleIndentifier = a3->bundleIndentifier;
  a3->bundleIndentifier = 0;
  v6 = self->_updateContext.bundleIndentifier;
  self->_updateContext.bundleIndentifier = bundleIndentifier;

  locale = a3->locale;
  a3->locale = 0;
  v8 = self->_updateContext.locale;
  self->_updateContext.locale = locale;

  version = a3->version;
  a3->version = 0;
  v10 = self->_updateContext.version;
  self->_updateContext.version = version;

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __64__CSAssetAvailabilityNotifierAssistant_checkedInAssetForUpdate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_cleanup");
  v2 = CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[CSAssetAvailabilityNotifierAssistant checkedInAssetForUpdate:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Checked In asset for update", (uint8_t *)&v13, 0xCu);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) |= 4uLL;
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  objc_msgSend(*(id *)(a1 + 32), "assistantLanguageCode");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v6;

  objc_msgSend(*(id *)(a1 + 32), "configVersion");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return objc_msgSend(*(id *)(a1 + 40), "_notifyAssetUpdateToLAIfRequired");
}

uint64_t __57__CSAssetAvailabilityNotifierAssistant_checkInForUpdate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
  v2 = CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSAssetAvailabilityNotifierAssistant checkInForUpdate:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Recieved update check-in to notify asset download completion to LA", (uint8_t *)&v4, 0xCu);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= 2uLL;
  return objc_msgSend(*(id *)(a1 + 32), "_notifyAssetUpdateToLAIfRequired");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1864 != -1)
    dispatch_once(&sharedInstance_onceToken_1864, &__block_literal_global_1865);
  return (id)sharedInstance_notifier;
}

void __54__CSAssetAvailabilityNotifierAssistant_sharedInstance__block_invoke()
{
  CSAssetAvailabilityNotifierAssistant *v0;
  void *v1;

  v0 = objc_alloc_init(CSAssetAvailabilityNotifierAssistant);
  v1 = (void *)sharedInstance_notifier;
  sharedInstance_notifier = (uint64_t)v0;

}

@end
