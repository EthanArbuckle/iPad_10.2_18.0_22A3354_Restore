@implementation IMIDSServiceController

+ (id)sharedInstance
{
  if (qword_1ECFC7680 != -1)
    dispatch_once(&qword_1ECFC7680, &unk_1E3FB3C28);
  return (id)qword_1ECFC75E0;
}

- (IMIDSServiceController)init
{
  IMIDSServiceController *v2;
  void *v3;
  uint64_t v4;
  NSString *debuggingService;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMIDSServiceController;
  v2 = -[IMIDSServiceController init](&v7, sel_init);
  if (v2)
  {
    +[IMDefaults sharedInstance](IMDefaults, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getValueFromDomain:forKey:", CFSTR("com.apple.MobileSMS"), CFSTR("debuggingIDSService"));
    v4 = objc_claimAutoreleasedReturnValue();
    debuggingService = v2->_debuggingService;
    v2->_debuggingService = (NSString *)v4;

  }
  return v2;
}

- (void)logIfDebuggingService:(id)a3 method:(const char *)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMIDSServiceController debuggingService](self, "debuggingService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    IMLogHandleForCategory("IMIDSServiceController");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v6;
      v13 = 2080;
      v14 = a4;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Call IDS service [%@], method: [%s], callstack: [%@]", (uint8_t *)&v11, 0x20u);

    }
  }

}

- (NSString)debuggingService
{
  return self->_debuggingService;
}

- (void)setDebuggingService:(id)a3
{
  objc_storeStrong((id *)&self->_debuggingService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debuggingService, 0);
}

@end
