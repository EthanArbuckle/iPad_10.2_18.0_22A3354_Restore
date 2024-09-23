@implementation CBAgregateSettingsProvider

+ (id)sharedInstance
{
  void *v3;

  objc_sync_enter(a1);
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_12);
  v3 = (void *)sharedInstance__sharedObject_4;
  objc_sync_exit(a1);
  return v3;
}

CBAgregateSettingsProvider *__44__CBAgregateSettingsProvider_sharedInstance__block_invoke()
{
  CBAgregateSettingsProvider *result;

  result = -[CBAgregateSettingsProvider initWithPreferences:andTrial:]([CBAgregateSettingsProvider alloc], "initWithPreferences:andTrial:", +[CBPreferencesSettingsProvider sharedInstance](CBPreferencesSettingsProvider, "sharedInstance"), +[CBTrialSettingsProvider sharedInstance](CBTrialSettingsProvider, "sharedInstance"));
  sharedInstance__sharedObject_4 = (uint64_t)result;
  return result;
}

- (CBAgregateSettingsProvider)initWithPreferences:(id)a3 andTrial:(id)a4
{
  os_log_t v4;
  CBPreferencesSettingsProvider *v5;
  CBTrialSettingsProvider *v6;
  NSObject *log;
  os_log_type_t v9;
  NSObject *inited;
  uint8_t v11[15];
  os_log_type_t type;
  os_log_t oslog;
  objc_super v14;
  id v15;
  id v16;
  SEL v17;
  CBAgregateSettingsProvider *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CBAgregateSettingsProvider;
  v18 = -[CBAgregateSettingsProvider init](&v14, sel_init);
  if (!v18)
    return 0;
  v4 = os_log_create("com.apple.CoreBrightness.CBAgregateSettingsProvider", "default");
  v18->_logHandle = (OS_os_log *)v4;
  if (!v18->_logHandle)
  {
    oslog = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    oslog = inited;
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v9 = type;
      __os_log_helper_16_0_0(v11);
      _os_log_error_impl(&dword_1B5291000, log, v9, "Failed to create log handle for agregate settings provider", v11, 2u);
    }
  }
  v5 = (CBPreferencesSettingsProvider *)v16;
  v18->_preferencesSettingsProvider = v5;
  v6 = (CBTrialSettingsProvider *)v15;
  v18->_trialSettingsProvider = v6;
  return v18;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBAgregateSettingsProvider *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBAgregateSettingsProvider;
  -[CBAgregateSettingsProvider dealloc](&v2, sel_dealloc);
}

- (id)getMLABModelPath
{
  return -[CBTrialSettingsProvider getMLABModelPath](self->_trialSettingsProvider, "getMLABModelPath", a2, self);
}

- (void)registerAutoBrightnessSettingsUpdateHandler:(id)a3
{
  -[CBTrialSettingsProvider registerAutoBrightnessSettingsUpdateHandler:](self->_trialSettingsProvider, "registerAutoBrightnessSettingsUpdateHandler:", a3);
}

- (void)unregisterAutoBrightnessSettingsUpdateHandler
{
  -[CBTrialSettingsProvider unregisterAutoBrightnessSettingsUpdateHandler](self->_trialSettingsProvider, "unregisterAutoBrightnessSettingsUpdateHandler", a2, self);
}

- (unint64_t)aabUpdateStrategyType
{
  uint64_t updated;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (CBU_IsPad())
    return 0;
  if (!-[CBPreferencesSettingsProvider specifiesAABCurveUpdateStrategy](self->_preferencesSettingsProvider, "specifiesAABCurveUpdateStrategy"))return -[CBTrialSettingsProvider aabUpdateStrategyType](self->_trialSettingsProvider, "aabUpdateStrategyType");
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    updated = aabUpdateStrategyTypeToString(-[CBPreferencesSettingsProvider aabUpdateStrategyType](self->_preferencesSettingsProvider, "aabUpdateStrategyType"));
    __os_log_helper_16_2_1_8_66((uint64_t)v8, updated);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "AAB curve update strategy overriden by preferences. Use %{public}@", v8, 0xCu);
  }
  return -[CBPreferencesSettingsProvider aabUpdateStrategyType](self->_preferencesSettingsProvider, "aabUpdateStrategyType");
}

@end
