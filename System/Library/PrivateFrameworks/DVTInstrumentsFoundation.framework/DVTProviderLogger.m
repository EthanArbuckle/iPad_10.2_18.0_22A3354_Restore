@implementation DVTProviderLogger

- (DVTProviderLogger)initWithProviderName:(id)a3
{
  id v5;
  DVTProviderLogger *v6;
  uint64_t v7;
  NSMutableArray *errors;
  uint64_t v9;
  NSMutableArray *warnings;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DVTProviderLogger;
  v6 = -[DVTProviderLogger init](&v12, sel_init);
  if (v6)
  {
    if (qword_25576F940 != -1)
      dispatch_once(&qword_25576F940, &unk_24EB28298);
    objc_storeStrong((id *)&v6->_log, (id)qword_25576F938);
    objc_storeStrong((id *)&v6->_providerName, a3);
    v7 = objc_opt_new();
    errors = v6->_errors;
    v6->_errors = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    warnings = v6->_warnings;
    v6->_warnings = (NSMutableArray *)v9;

  }
  return v6;
}

- (NSArray)errors
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_errors, "copy");
}

- (NSArray)warnings
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_warnings, "copy");
}

- (void)failWithReason:(id)a3
{
  id v4;
  void *v5;
  NSString *providerName;
  void *v7;
  void *v8;
  NSObject *log;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1540];
  v16[0] = *MEMORY[0x24BDD0FC8];
  v16[1] = CFSTR("DVTKtraceSessionProviderName");
  providerName = self->_providerName;
  v17[0] = v4;
  v17[1] = providerName;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.ktrace_recording.provider"), 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_errors, "addObject:", v8);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    sub_222BC58E0((uint64_t)v4, log, v10, v11, v12, v13, v14, v15);

}

- (void)warnWithMessage:(id)a3
{
  id v4;
  void *v5;
  NSString *providerName;
  void *v7;
  void *v8;
  NSObject *log;
  int v10;
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1540];
  v12[0] = *MEMORY[0x24BDD0FC8];
  v12[1] = CFSTR("DVTKtraceSessionProviderName");
  providerName = self->_providerName;
  v13[0] = v4;
  v13[1] = providerName;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.ktrace_recording.provider"), 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_warnings, "addObject:", v8);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_222B17000, log, OS_LOG_TYPE_DEFAULT, "Provider warning: %@", (uint8_t *)&v10, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warnings, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
