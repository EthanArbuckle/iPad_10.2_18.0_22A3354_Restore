@implementation AccessoryDetection

- (AccessoryDetection)initWithAABC:(void *)a3
{
  os_log_t v3;
  uint64_t v4;
  objc_super v6;
  void *v7;
  SEL v8;
  AccessoryDetection *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AccessoryDetection;
  v9 = -[AccessoryDetection init](&v6, sel_init);
  v3 = os_log_create("com.apple.CoreBrightness.AccessoryDetection", "default");
  v9->_logHandle = (OS_os_log *)v3;
  v4 = objc_msgSend(MEMORY[0x1E0D153A0], "sharedInstance");
  v9->_connection = (ACCConnectionInfo *)v4;
  v9->_aabc = v7;
  return v9;
}

- (void)start
{
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v6[15];
  char v7;
  NSObject *v8;
  char v9;
  SEL v10;
  AccessoryDetection *v11;

  v11 = self;
  v10 = a2;
  v9 = 0;
  v9 = -[ACCConnectionInfo registerDelegate:](self->_connection, "registerDelegate:", self) & 1;
  if (!v9)
  {
    v8 = 0;
    if (v11->_logHandle)
    {
      logHandle = v11->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v8 = logHandle;
    v7 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v8;
      type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_error_impl(&dword_1B5291000, log, type, "ACCConnectionInfo delegate registration failed", v6, 2u);
    }
  }
}

- (void)stop
{
  -[ACCConnectionInfo registerDelegate:](self->_connection, "registerDelegate:", 0, a2);

}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  NSString *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v14[7];
  os_log_type_t v15;
  os_log_t oslog;
  int valuePtr;
  CFNumberRef v18;
  os_log_type_t v19;
  os_log_t v20;
  id v21;
  id v22;
  int v23;
  int v24;
  id v25;
  SEL v26;
  AccessoryDetection *v27;
  uint8_t v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = self;
  v26 = a2;
  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v20 = 0;
  if (self->_logHandle)
  {
    logHandle = v27->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v20 = logHandle;
  v19 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v28, objc_msgSend(v25, "UTF8String"), (uint64_t)v22);
    _os_log_debug_impl(&dword_1B5291000, v20, v19, "CoreAccessories endpoint %s attached with properties=%@", v28, 0x16u);
  }
  if (v24 == 13)
  {
    if (v22)
    {
      v18 = 0;
      v18 = (CFNumberRef)objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0D153F8]);
      if (v18)
      {
        valuePtr = 0;
        CFNumberGetValue(v18, kCFNumberIntType, &valuePtr);
        if (valuePtr == 86)
        {
          oslog = 0;
          if (v27->_logHandle)
          {
            v11 = v27->_logHandle;
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              v10 = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              v10 = init_default_corebrightness_log();
            v11 = v10;
          }
          oslog = v11;
          v15 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v8 = oslog;
            v9 = v15;
            __os_log_helper_16_0_0(v14);
            _os_log_debug_impl(&dword_1B5291000, v8, v9, "Sleeve attached", v14, 2u);
          }
          v7 = (NSString *)v25;
          v27->_sleeveUUID = v7;
          AABC::SetDeviceInSleeve((NSObject **)v27->_aabc, 1);
        }
      }
    }
  }
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v10[7];
  char v11;
  NSObject *v12;
  os_log_type_t v13;
  os_log_t v14;
  id v15;
  id v16;
  SEL v17;
  AccessoryDetection *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = a4;
  v14 = 0;
  if (self->_logHandle)
  {
    logHandle = v18->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v14 = logHandle;
  v13 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v19, objc_msgSend(v16, "UTF8String"));
    _os_log_debug_impl(&dword_1B5291000, v14, v13, "CoreAccessories endpoint %s detached", v19, 0xCu);
  }
  if (v18->_sleeveUUID && (objc_msgSend(v16, "isEqualToString:", v18->_sleeveUUID) & 1) != 0)
  {

    v18->_sleeveUUID = 0;
    AABC::SetDeviceInSleeve((NSObject **)v18->_aabc, 0);
    v12 = 0;
    if (v18->_logHandle)
    {
      v7 = v18->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v6 = init_default_corebrightness_log();
      v7 = v6;
    }
    v12 = v7;
    v11 = 2;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v4 = v12;
      v5 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_debug_impl(&dword_1B5291000, v4, v5, "Sleeve detached", v10, 2u);
    }
  }
}

@end
