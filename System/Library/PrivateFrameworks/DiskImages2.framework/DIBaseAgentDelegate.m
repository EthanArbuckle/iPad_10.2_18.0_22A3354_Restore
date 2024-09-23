@implementation DIBaseAgentDelegate

- (void)createListener
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[DIBaseServiceDelegate serviceName](self, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".xpc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    -[DIBaseServiceDelegate serviceName](self, "serviceName");
    *(_DWORD *)buf = 68158210;
    v12 = 37;
    v13 = 2080;
    v14 = "-[DIBaseAgentDelegate createListener]";
    v15 = 2114;
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    getDIOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[DIBaseServiceDelegate serviceName](self, "serviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158210;
      v12 = 37;
      v13 = 2080;
      v14 = "-[DIBaseAgentDelegate createListener]";
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_212EB0000, v8, OS_LOG_TYPE_DEFAULT, "%.*s: Creating NSXPC listener on %{public}@", buf, 0x1Cu);

    }
  }
  *__error() = v5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v4);
  -[DIBaseServiceDelegate setListener:](self, "setListener:", v10);

}

@end
