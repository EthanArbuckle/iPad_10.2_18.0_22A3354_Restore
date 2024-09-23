@implementation DIBaseAgentXPCHandler

- (void)createConnection
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = -[DIBaseXPCHandler isPrivileged](self, "isPrivileged");
  -[DIBaseXPCHandler serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".xpc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    v15 = 41;
    v16 = 2080;
    v17 = "-[DIBaseAgentXPCHandler createConnection]";
    v18 = 2114;
    v19 = v5;
    v8 = (char *)_os_log_send_and_compose_impl();

    if (v8)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v8);
      free(v8);
    }
  }
  else
  {
    getDIOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      v15 = 41;
      v16 = 2080;
      v17 = "-[DIBaseAgentXPCHandler createConnection]";
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_212EB0000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Creating connection to %{public}@", buf, 0x1Cu);
    }

  }
  if (v3)
    v10 = 4096;
  else
    v10 = 0;
  *__error() = v6;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", v5, v10);
  -[DIBaseXPCHandler setConnection:](self, "setConnection:", v11);

  -[DIBaseAgentXPCHandler setConnectionMode](self, "setConnectionMode");
  -[DIBaseXPCHandler remoteObjectInterface](self, "remoteObjectInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseXPCHandler connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRemoteObjectInterface:", v12);

}

@end
