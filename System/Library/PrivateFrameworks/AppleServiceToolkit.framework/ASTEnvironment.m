@implementation ASTEnvironment

- (ASTEnvironment)init
{
  NSObject *v3;
  int v5;
  ASTEnvironment *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412546;
    v6 = self;
    v7 = 2080;
    v8 = "-[ASTEnvironment init]";
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v5, 0x16u);
  }

  return -[ASTEnvironment initWithEnvironmentType:](self, "initWithEnvironmentType:", 0);
}

- (ASTEnvironment)initWithEnvironmentType:(unint64_t)a3
{
  NSObject *v5;
  ASTEnvironment *v6;
  ASTEnvironment *v7;
  uint64_t v8;
  NSURL *serverURL;
  objc_super v11;
  uint8_t buf[4];
  ASTEnvironment *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2080;
    v15 = "-[ASTEnvironment initWithEnvironmentType:]";
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[%@] %s", buf, 0x16u);
  }

  v11.receiver = self;
  v11.super_class = (Class)ASTEnvironment;
  v6 = -[ASTEnvironment init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_environmentType = a3;
    v6->_server = -[ASTEnvironment _defaultServerSelection](v6, "_defaultServerSelection");
    -[ASTEnvironment _generateServerURL](v7, "_generateServerURL");
    v8 = objc_claimAutoreleasedReturnValue();
    serverURL = v7->_serverURL;
    v7->_serverURL = (NSURL *)v8;

  }
  return v7;
}

+ (id)environmentWithEnvironmentType:(unint64_t)a3
{
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = a1;
    v9 = 2080;
    v10 = "+[ASTEnvironment environmentWithEnvironmentType:]";
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v7, 0x16u);
  }

  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEnvironmentType:", a3);
}

+ (id)currentEnvironment
{
  NSObject *v3;
  int v5;
  id v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412546;
    v6 = a1;
    v7 = 2080;
    v8 = "+[ASTEnvironment currentEnvironment]";
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v5, 0x16u);
  }

  if (currentEnvironment_onceToken != -1)
    dispatch_once(&currentEnvironment_onceToken, &__block_literal_global_6);
  dispatch_sync((dispatch_queue_t)ASTEnvironmentSyncQueue, &__block_literal_global_42);
  return (id)ASTCurrentEnvironment;
}

void __36__ASTEnvironment_currentEnvironment__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.ASTEnvironmentSyncQueue", 0);
  v1 = (void *)ASTEnvironmentSyncQueue;
  ASTEnvironmentSyncQueue = (uint64_t)v0;

}

void __36__ASTEnvironment_currentEnvironment__block_invoke_2()
{
  ASTEnvironment *v0;
  void *v1;

  if (!ASTCurrentEnvironment)
  {
    v0 = -[ASTEnvironment initWithEnvironmentType:]([ASTEnvironment alloc], "initWithEnvironmentType:", 3);
    v1 = (void *)ASTCurrentEnvironment;
    ASTCurrentEnvironment = (uint64_t)v0;

  }
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_43);
  return isInternalBuild_isInternal;
}

uint64_t __33__ASTEnvironment_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  if ((_DWORD)result)
    isInternalBuild_isInternal = 1;
  return result;
}

+ (void)resetEnvironment
{
  dispatch_async((dispatch_queue_t)ASTEnvironmentSyncQueue, &__block_literal_global_45);
}

void __34__ASTEnvironment_resetEnvironment__block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend((id)ASTCurrentEnvironment, "setEnvironmentType:", 3);
  v0 = objc_msgSend((id)ASTCurrentEnvironment, "_defaultServerSelection");
  objc_msgSend((id)ASTCurrentEnvironment, "setServer:", v0);
  objc_msgSend((id)ASTCurrentEnvironment, "_generateServerURL");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)ASTCurrentEnvironment, "setServerURL:", v1);

}

- (void)setServerURL:(id)a3
{
  id v5;

  v5 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isInternalBuild"))
  {
    self->_server = 5;
    objc_storeStrong((id *)&self->_serverURL, a3);
  }

}

- (void)setServer:(unint64_t)a3
{
  NSObject *v5;
  NSURL *v6;
  NSURL *serverURL;
  int v8;
  ASTEnvironment *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2080;
    v11 = "-[ASTEnvironment setServer:]";
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v8, 0x16u);
  }

  self->_server = a3;
  -[ASTEnvironment _generateServerURL](self, "_generateServerURL");
  v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  serverURL = self->_serverURL;
  self->_serverURL = v6;

}

- (void)setEnvironmentType:(unint64_t)a3
{
  NSObject *v5;
  NSURL *v6;
  NSURL *serverURL;
  int v8;
  ASTEnvironment *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2080;
    v11 = "-[ASTEnvironment setEnvironmentType:]";
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v8, 0x16u);
  }

  self->_environmentType = a3;
  -[ASTEnvironment _generateServerURL](self, "_generateServerURL");
  v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  serverURL = self->_serverURL;
  self->_serverURL = v6;

}

- (NSString)diagsChannel
{
  return (NSString *)(id)ASTCurrentDiagsChannel;
}

- (void)setDiagsChannel:(id)a3
{
  char *v5;
  NSObject *v6;
  NSObject *v7;
  NSURL *v8;
  NSURL *serverURL;
  int v10;
  ASTEnvironment *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)a3;
  ASTLogHandleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2080;
    v13 = "-[ASTEnvironment setDiagsChannel:]";
    _os_log_impl(&dword_22D91B000, v6, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v10, 0x16u);
  }

  if ((objc_msgSend((id)ASTCurrentDiagsChannel, "isEqualToString:", v5) & 1) == 0)
  {
    ASTLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Updating diags channel to: %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)&ASTCurrentDiagsChannel, a3);
    -[ASTEnvironment _generateServerURL](self, "_generateServerURL");
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    serverURL = self->_serverURL;
    self->_serverURL = v8;

  }
}

- (NSString)configCode
{
  return (NSString *)(id)ASTConfigCode;
}

- (void)setConfigCode:(id)a3
{
  char *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  ASTEnvironment *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)a3;
  ASTLogHandleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2080;
    v11 = "-[ASTEnvironment setConfigCode:]";
    _os_log_impl(&dword_22D91B000, v6, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v8, 0x16u);
  }

  if ((objc_msgSend((id)ASTConfigCode, "isEqualToString:", v5) & 1) == 0)
  {
    ASTLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Updating config code to: %@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)&ASTConfigCode, a3);
  }

}

- (NSURL)assetURL
{
  return (NSURL *)(id)ASTAssetURL;
}

- (void)setAssetURL:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  char *v11;
  int v12;
  ASTEnvironment *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ASTLogHandleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2080;
    v15 = "-[ASTEnvironment setAssetURL:]";
    _os_log_impl(&dword_22D91B000, v6, OS_LOG_TYPE_DEFAULT, "[%@] %s", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend((id)ASTAssetURL, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    ASTLogHandleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "absoluteString");
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_22D91B000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Updating asset URL to: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_storeStrong((id *)&ASTAssetURL, a3);
  }

}

- (id)environmentServerString
{
  unint64_t v2;

  v2 = -[ASTEnvironment environmentType](self, "environmentType");
  if (v2 - 8 > 2)
    return CFSTR("ios");
  else
    return *(&off_24F96A728 + v2 - 8);
}

- (id)_generateServerURL
{
  NSObject *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  char *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  ASTEnvironment *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = self;
    v23 = 2080;
    v24 = "-[ASTEnvironment _generateServerURL]";
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[%@] %s", buf, 0x16u);
  }

  switch(-[ASTEnvironment server](self, "server"))
  {
    case 1uLL:
      v4 = CFSTR("https://idiagnostics-uat.apple.com/%@/v1.6/");
      break;
    case 2uLL:
      v4 = CFSTR("https://idiagnostics-it.apple.com/%@/v1.6/");
      break;
    case 3uLL:
      v4 = CFSTR("https://idiagnostics-qa.apple.com/%@/v1.6/");
      break;
    case 4uLL:
      v4 = CFSTR("https://diagnostics-dev.swe.apple.com");
      break;
    case 5uLL:
      v4 = CFSTR("https://idiagnostics.apple.com/%@/v1.6/");
      if ((objc_msgSend((id)objc_opt_class(), "isInternalBuild") & 1) != 0)
      {
        -[ASTEnvironment _defaultServerURL](self, "_defaultServerURL");
        v5 = objc_claimAutoreleasedReturnValue();
        if (v5)
          v4 = (__CFString *)v5;
      }
      break;
    case 6uLL:
      v4 = CFSTR("https://idiagnostics-reno.apple.com/%@/v1.6/");
      break;
    case 7uLL:
      v4 = CFSTR("https://idiagnostics-mdn1.apple.com/%@/v1.6/");
      break;
    case 8uLL:
      v4 = CFSTR("https://idiagnostics-nwk1.apple.com/%@/v1.6/");
      break;
    case 9uLL:
      v4 = CFSTR("https://idiagnostics-it1.apple.com/%@/v1.6/");
      break;
    case 10uLL:
      v4 = CFSTR("https://idiagnostics-it2.apple.com/%@/v1.6/");
      break;
    case 11uLL:
      v4 = CFSTR("https://idiagnostics-staging.apple.com/%@/v1.6/");
      break;
    case 12uLL:
      v4 = CFSTR("https://idiagnostics-uat1.apple.com/%@/v1.6/");
      break;
    case 13uLL:
      v4 = CFSTR("https://idiagnostics-acstage-ause1.apple.com/%@/v1.6/");
      break;
    case 14uLL:
      v4 = CFSTR("https://idiagnostics-stage1.apple.com/%@/v1.6/");
      break;
    case 15uLL:
      v4 = CFSTR("https://idiagnostics-prod2.apple.com/%@/v1.6/");
      break;
    case 16uLL:
      v4 = CFSTR("https://idiagnostics-prod2-mdn.apple.com/%@/v1.6/");
      break;
    case 17uLL:
      v4 = CFSTR("https://idiagnostics-prod2-rno.apple.com/%@/v1.6/");
      break;
    case 18uLL:
      v4 = CFSTR("https://idiagnostics-it4-ause1.apple.com/%@/v1.6/");
      break;
    default:
      v4 = CFSTR("https://idiagnostics.apple.com/%@/v1.6/");
      break;
  }
  -[ASTEnvironment diagsChannel](self, "diagsChannel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[ASTEnvironment diagsChannel](self, "diagsChannel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v11;
  }
  v12 = (void *)MEMORY[0x24BDD17C8];
  v20 = 0;
  -[ASTEnvironment environmentServerString](self, "environmentServerString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), &v20, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v20;

  if (v15)
  {
    ASTLogHandleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[ASTEnvironment _generateServerURL].cold.1((uint64_t)v15, v16);

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
  v17 = (char *)objc_claimAutoreleasedReturnValue();
  ASTLogHandleForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v17;
    _os_log_impl(&dword_22D91B000, v18, OS_LOG_TYPE_DEFAULT, "[%@] New server URL: %@", buf, 0x16u);
  }

  return v17;
}

- (unint64_t)_defaultServerSelection
{
  if (_defaultServerSelection_onceToken != -1)
    dispatch_once(&_defaultServerSelection_onceToken, &__block_literal_global_52);
  return _defaultServerSelection_server;
}

void __41__ASTEnvironment__defaultServerSelection__block_invoke()
{
  CFPropertyListRef v0;
  CFTypeID v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *cf;

  CFPreferencesAppSynchronize(CFSTR("com.apple.AppleServiceToolkit"));
  v0 = CFPreferencesCopyAppValue(CFSTR("Server"), CFSTR("com.apple.AppleServiceToolkit"));
  if (v0)
  {
    cf = (void *)v0;
    v1 = CFGetTypeID(v0);
    if (v1 == CFNumberGetTypeID())
    {
      _defaultServerSelection_server = objc_msgSend(cf, "unsignedIntegerValue");

    }
    else
    {
      ASTLogHandleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __41__ASTEnvironment__defaultServerSelection__block_invoke_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);

      CFRelease(cf);
    }
  }
  else
  {
    ASTLogHandleForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __41__ASTEnvironment__defaultServerSelection__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (id)_defaultServerURL
{
  if (_defaultServerURL_onceToken != -1)
    dispatch_once(&_defaultServerURL_onceToken, &__block_literal_global_53);
  return (id)_defaultServerURL_server;
}

void __35__ASTEnvironment__defaultServerURL__block_invoke()
{
  CFPropertyListRef v0;
  void *v1;

  CFPreferencesAppSynchronize(CFSTR("com.apple.AppleServiceToolkit"));
  v0 = CFPreferencesCopyAppValue(CFSTR("CustomServerURL"), CFSTR("com.apple.AppleServiceToolkit"));
  v1 = (void *)_defaultServerURL_server;
  _defaultServerURL_server = (uint64_t)v0;

}

- (unint64_t)environmentType
{
  return self->_environmentType;
}

- (unint64_t)server
{
  return self->_server;
}

- (NSURL)serverURL
{
  return self->_serverURL;
}

- (NSString)SOCKSProxyServer
{
  return self->_SOCKSProxyServer;
}

- (void)setSOCKSProxyServer:(id)a3
{
  objc_storeStrong((id *)&self->_SOCKSProxyServer, a3);
}

- (NSNumber)SOCKSProxyPort
{
  return self->_SOCKSProxyPort;
}

- (void)setSOCKSProxyPort:(id)a3
{
  objc_storeStrong((id *)&self->_SOCKSProxyPort, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SOCKSProxyPort, 0);
  objc_storeStrong((id *)&self->_SOCKSProxyServer, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
}

- (void)_generateServerURL
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_22D91B000, a2, OS_LOG_TYPE_FAULT, "Invalid server format string: %@", (uint8_t *)&v2, 0xCu);
}

void __41__ASTEnvironment__defaultServerSelection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_22D91B000, a1, a3, "Service Selection is not available", a5, a6, a7, a8, 0);
}

void __41__ASTEnvironment__defaultServerSelection__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_22D91B000, a1, a3, "Service Selection is not in valid type", a5, a6, a7, a8, 0);
}

@end
