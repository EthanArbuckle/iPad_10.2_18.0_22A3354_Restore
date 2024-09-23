@implementation DEDConfiguration

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_5);
  return (id)sharedInstance_shared_0;
}

void __34__DEDConfiguration_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_shared_0;
  sharedInstance_shared_0 = v0;

}

- (id)errorDomain
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[DEDConfiguration identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-error"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (const)loggingSubsystem
{
  id v2;
  const char *v3;

  -[DEDConfiguration identifier](self, "identifier");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "cStringUsingEncoding:", 4);

  return v3;
}

- (id)machServiceName
{
  return CFSTR("com.apple.diagnosticextensionsd.session");
}

- (unint64_t)connectionType
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DED_CONNECTION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4
    && (objc_msgSend(v4, "isEqualToString:", &stru_24D1E6AF0) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("privileged")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("anonymous")) & 1) != 0;

  return v5;
}

- (id)identifier
{
  return CFSTR("com.apple.diagnosticextensionsd");
}

- (id)dedDirectory
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE2C9A0], "userLibraryDirectoryForApp:", CFSTR("Logs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    +[DEDUtils sharedLog](DEDUtils, "sharedLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[DEDConfiguration dedDirectory].cold.1(v7);

    v8 = (void *)MEMORY[0x24BDBCF48];
    NSHomeDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)sharedAnonymousListener
{
  void *v3;
  NSObject *v4;
  void *v5;

  -[DEDConfiguration anonymousListener](self, "anonymousListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[DEDUtils sharedLog](DEDUtils, "sharedLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[DEDConfiguration sharedAnonymousListener].cold.1(v4);

    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDConfiguration setAnonymousListener:](self, "setAnonymousListener:", v5);

  }
  -[DEDConfiguration anonymousListener](self, "anonymousListener");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)invalidateTestListeners
{
  -[DEDConfiguration setAnonymousListener:](self, "setAnonymousListener:", 0);
}

- (NSXPCListener)anonymousListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAnonymousListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymousListener, 0);
}

- (void)dedDirectory
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21469E000, log, OS_LOG_TYPE_FAULT, "could not build working directory url", v1, 2u);
}

- (void)sharedAnonymousListener
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21469E000, log, OS_LOG_TYPE_DEBUG, "creating new sharedAnonymousListener", v1, 2u);
}

@end
