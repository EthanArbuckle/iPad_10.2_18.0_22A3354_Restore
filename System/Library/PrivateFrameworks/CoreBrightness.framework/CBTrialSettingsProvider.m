@implementation CBTrialSettingsProvider

- (CBTrialSettingsProvider)init
{
  TRIClient *v2;
  TRIExperimentIdentifiers *v3;
  objc_super v5;
  SEL v6;
  CBTrialSettingsProvider *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)CBTrialSettingsProvider;
  v7 = -[CBTrialSettingsProvider init](&v5, sel_init);
  if (!v7)
    return 0;
  v2 = (TRIClient *)(id)objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 226);
  v7->_client = v2;
  v3 = (TRIExperimentIdentifiers *)(id)-[TRIClient experimentIdentifiersWithNamespaceName:](v7->_client, "experimentIdentifiersWithNamespaceName:", CFSTR("COREOS_BRIGHTNESS_AUTO_BRIGHTNESS"));
  v7->_experimentIdentifiers = v3;
  v7->_notificationToken = 0;
  return v7;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBTrialSettingsProvider *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBTrialSettingsProvider;
  -[CBTrialSettingsProvider dealloc](&v2, sel_dealloc);
}

+ (CBTrialSettingsProvider)sharedInstance
{
  CBTrialSettingsProvider *v3;

  objc_sync_enter(a1);
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_15);
  v3 = (CBTrialSettingsProvider *)sharedInstance__sharedObject_5;
  objc_sync_exit(a1);
  return v3;
}

CBTrialSettingsProvider *__41__CBTrialSettingsProvider_sharedInstance__block_invoke()
{
  CBTrialSettingsProvider *result;

  result = objc_alloc_init(CBTrialSettingsProvider);
  sharedInstance__sharedObject_5 = (uint64_t)result;
  return result;
}

- (id)copyExperimentIdentifiers
{
  return self->_experimentIdentifiers;
}

- (id)getMLABModelPath
{
  void *v3;

  v3 = (void *)objc_msgSend((id)-[TRIClient levelForFactor:withNamespaceName:](self->_client, "levelForFactor:withNamespaceName:", CFSTR("Aether"), CFSTR("COREOS_BRIGHTNESS_AUTO_BRIGHTNESS")), "fileValue");
  if ((objc_msgSend(v3, "hasPath") & 1) != 0)
    return (id)objc_msgSend(v3, "path");
  else
    return 0;
}

- (void)registerAutoBrightnessSettingsUpdateHandler:(id)a3
{
  TRIClient *client;
  TRINotificationToken *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  CBTrialSettingsProvider *v10;
  id v11;
  id v12;
  SEL v13;
  CBTrialSettingsProvider *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  -[CBTrialSettingsProvider unregisterAutoBrightnessSettingsUpdateHandler](self, "unregisterAutoBrightnessSettingsUpdateHandler");
  client = v14->_client;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __71__CBTrialSettingsProvider_registerAutoBrightnessSettingsUpdateHandler___block_invoke;
  v9 = &unk_1E68EBC50;
  v10 = v14;
  v11 = v12;
  v4 = (TRINotificationToken *)(id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](client, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("COREOS_BRIGHTNESS_AUTO_BRIGHTNESS"), &v5);
  v14->_notificationToken = v4;
}

uint64_t __71__CBTrialSettingsProvider_registerAutoBrightnessSettingsUpdateHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "refresh");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "experimentIdentifiersWithNamespaceName:", CFSTR("COREOS_BRIGHTNESS_AUTO_BRIGHTNESS"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)unregisterAutoBrightnessSettingsUpdateHandler
{
  if (self->_notificationToken)
  {
    -[TRIClient removeUpdateHandlerForToken:](self->_client, "removeUpdateHandlerForToken:", self->_notificationToken);

  }
}

- (unint64_t)aabUpdateStrategyType
{
  uint64_t updated;
  uint64_t v3;
  NSObject *v5;
  NSObject *inited;
  void *v7;
  uint8_t v9[16];
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = (void *)-[TRIClient levelForFactor:withNamespaceName:](self->_client, "levelForFactor:withNamespaceName:", CFSTR("CBAABCurveUpdateStrategyType"), CFSTR("COREOS_BRIGHTNESS_AUTO_BRIGHTNESS"));
  if (v7)
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      updated = aabUpdateStrategyTypeToString_0(objc_msgSend(v7, "longValue"));
      __os_log_helper_16_2_1_8_64((uint64_t)v10, updated);
      _os_log_impl(&dword_1B5291000, inited, OS_LOG_TYPE_DEFAULT, "Trial settings: %@", v10, 0xCu);
    }
    return objc_msgSend(v7, "longValue");
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v5 = init_default_corebrightness_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v3 = aabUpdateStrategyTypeToString_0(2uLL);
      __os_log_helper_16_2_1_8_64((uint64_t)v9, v3);
      _os_log_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEFAULT, "Trial is not set => use default: %@", v9, 0xCu);
    }
    return 2;
  }
}

@end
