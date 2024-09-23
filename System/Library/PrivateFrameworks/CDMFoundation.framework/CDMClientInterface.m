@implementation CDMClientInterface

- (BOOL)successFromSetup
{
  return self->successFromSetup;
}

- (NSError)errorFromSetup
{
  return self->errorFromSetup;
}

- (BOOL)daemonKilled
{
  return self->daemonKilled;
}

- (CDMClientInterface)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (CDMClientInterface)initWithDelegate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (CDMClientInterface)initWithCallingBundleId:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (BOOL)areAssetsAvailable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (BOOL)registerWithAssetsDelegate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (BOOL)registerWithAssetsDelegate:(id)a3 withType:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (void)setup:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("You must override %@ in a subclass"), v5);

}

- (void)setup:(id)a3 completionHandler:(id)a4
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("You must override %@ in a subclass"), v6);

}

- (void)warmupWithCompletionHandler:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("You must override %@ in a subclass"), v5);

}

- (void)processCDMNluRequest:(id)a3 completionHandler:(id)a4
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("You must override %@ in a subclass"), v6);

}

- (void)processCDMNluRequest:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("You must override %@ in a subclass"), v5);

}

- (void)doServiceCenterInitWithConfig:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("You must override %@ in a subclass"), v5);

}

- (void)doHandleCommand:(id)a3 forCallback:(id)a4
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("You must override %@ in a subclass"), v6);

}

- (BOOL)isLighthouseAPIEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)createNSError:(id)a3 errorCode:(int64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[CDMClientInterface createNSError:errorCode:]";
    v15 = 2112;
    v16 = v5;
    _os_log_error_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
  }

  v7 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0FC8];
  v12 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("CDMClientErrorDomain"), a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CDMDataDispatcherContext)dataDispatcherContext
{
  return self->_dataDispatcherContext;
}

- (void)setDataDispatcherContext:(id)a3
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
  objc_storeStrong((id *)&self->errorFromSetup, 0);
}

@end
