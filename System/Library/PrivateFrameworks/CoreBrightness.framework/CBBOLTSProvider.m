@implementation CBBOLTSProvider

- (CBBOLTSProvider)initWithQueue:(id)a3
{
  os_log_t v3;
  CBAgregateSettingsProvider *v4;
  NSObject *log;
  os_log_type_t v7;
  NSObject *inited;
  uint8_t v9[7];
  os_log_type_t type;
  os_log_t oslog;
  objc_super v12;
  id v13;
  SEL v14;
  CBBOLTSProvider *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CBBOLTSProvider;
  v15 = -[CBModule initWithQueue:](&v12, sel_initWithQueue_, a3);
  if (!v15)
    return v15;
  v3 = os_log_create("com.apple.CoreBrightness.CBBOLTSProvider", "default");
  v15->super._logHandle = (OS_os_log *)v3;
  if (v15->super._logHandle)
  {
    v4 = +[CBAgregateSettingsProvider sharedInstance](CBAgregateSettingsProvider, "sharedInstance");
    v15->_settingsProvider = (CBAdaptiveAutoBrightnessSettingsProvider *)v4;
    return v15;
  }
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
    v7 = type;
    __os_log_helper_16_0_0(v9);
    _os_log_error_impl(&dword_1B5291000, log, v7, "failed to create log handle", v9, 2u);
  }

  return 0;
}

- (void)dealloc
{
  void *boltsModule;
  objc_super v3;
  SEL v4;
  CBBOLTSProvider *v5;

  v5 = self;
  v4 = a2;
  if (self->_boltsModule)
  {
    boltsModule = v5->_boltsModule;
    if (boltsModule)
      (*(void (**)(void *))(*(_QWORD *)boltsModule + 8))(boltsModule);
    v5->_boltsModule = 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)CBBOLTSProvider;
  -[CBModule dealloc](&v3, sel_dealloc);
}

- (void)newBOLTSModule
{
  CBBOLTS *v2;
  NSString *v3;
  CBBOLTS *v4;
  NSURL *v5;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[15];
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  os_log_t v19;
  os_log_type_t v20;
  os_log_t v21;
  NSObject **UsingModelURL;
  SEL v23;
  CBBOLTSProvider *v24;
  uint8_t v25[16];
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24 = self;
  v23 = a2;
  UsingModelURL = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[CBAdaptiveAutoBrightnessSettingsProvider getMLABModelPath](v24->_settingsProvider, "getMLABModelPath"))
  {
    v2 = (CBBOLTS *)-[CBAdaptiveAutoBrightnessSettingsProvider getMLABModelPath](v24->_settingsProvider, "getMLABModelPath");
    UsingModelURL = (NSObject **)CBBOLTS::createFromUncompiledModelPath(v2, v3);
    if (UsingModelURL)
    {
      v19 = 0;
      if (v24->super._logHandle)
      {
        logHandle = v24->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v19 = logHandle;
      v18 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v25, -[CBAdaptiveAutoBrightnessSettingsProvider getMLABModelPath](v24->_settingsProvider, "getMLABModelPath"));
        _os_log_debug_impl(&dword_1B5291000, v19, v18, "Created Aether from module on path: %@", v25, 0xCu);
      }
    }
    else
    {
      v21 = 0;
      if (v24->super._logHandle)
      {
        v14 = v24->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v13 = init_default_corebrightness_log();
        v14 = v13;
      }
      v21 = v14;
      v20 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v26, -[CBAdaptiveAutoBrightnessSettingsProvider getMLABModelPath](v24->_settingsProvider, "getMLABModelPath"));
        _os_log_error_impl(&dword_1B5291000, v21, v20, "Failed to create Aether module from uncompiled model: %@", v26, 0xCu);
      }
    }
  }
  if (!UsingModelURL)
  {
    v4 = +[MLAB URLOfModelInThisBundle](MLAB, "URLOfModelInThisBundle");
    UsingModelURL = (NSObject **)CBBOLTS::createUsingModelURL(v4, v5);
  }
  if (UsingModelURL)
  {
    CBBOLTS::loadBufferFromPreferences(UsingModelURL);
    v17 = 0;
    if (v24->super._logHandle)
    {
      v10 = v24->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v9 = init_default_corebrightness_log();
      v10 = v9;
    }
    v17 = v10;
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v17;
      v8 = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_impl(&dword_1B5291000, v7, v8, "Aether on", v15, 2u);
    }
  }
  return UsingModelURL;
}

- (void)loadBOLTSModule
{
  NSString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v11[15];
  char v12;
  NSObject *v13;
  NSURL *v14;
  CBBOLTS *v15;
  NSURL *v16;
  SEL v17;
  CBBOLTSProvider *v18;
  uint8_t v19[16];
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = self;
  v17 = a2;
  if (self->_boltsModule)
  {
    v16 = +[MLAB URLOfModelInThisBundle](MLAB, "URLOfModelInThisBundle");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = 0;
      v15 = (CBBOLTS *)-[CBAdaptiveAutoBrightnessSettingsProvider getMLABModelPath](v18->_settingsProvider, "getMLABModelPath");
      if (v15)
      {
        v14 = (NSURL *)CBBOLTS::compileModel(v15, v2);
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          v13 = 0;
          if (v18->super._logHandle)
          {
            logHandle = v18->super._logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              inited = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              inited = init_default_corebrightness_log();
            logHandle = inited;
          }
          v13 = logHandle;
          v12 = 16;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
          {
            log = v13;
            type = v12;
            __os_log_helper_16_0_0(v11);
            _os_log_error_impl(&dword_1B5291000, log, type, "Failed to compile supplied model, falling back to using bundled model", v11, 2u);
          }
        }
      }
    }
    if ((CBBOLTS::switchModel((NSObject **)v18->_boltsModule, v16) & 1) != 0)
    {
      if (v18->super._logHandle)
      {
        v4 = v18->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v3 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v3 = init_default_corebrightness_log();
        v4 = v3;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)v16);
        _os_log_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEFAULT, "BOLTS switched to a new model: %@", v19, 0xCu);
      }
    }
    else
    {
      if (v18->super._logHandle)
      {
        v6 = v18->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v5 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v5 = init_default_corebrightness_log();
        v6 = v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v20, (uint64_t)v16);
        _os_log_error_impl(&dword_1B5291000, v6, OS_LOG_TYPE_ERROR, "Failed to switch to a new model: %@", v20, 0xCu);
      }
    }
  }
  else
  {
    v18->_boltsModule = -[CBBOLTSProvider newBOLTSModule](v18, "newBOLTSModule");
  }
}

- (void)getBOLTSModule
{
  -[CBBOLTSProvider loadBOLTSModule](self, "loadBOLTSModule", a2);
  return self->_boltsModule;
}

@end
