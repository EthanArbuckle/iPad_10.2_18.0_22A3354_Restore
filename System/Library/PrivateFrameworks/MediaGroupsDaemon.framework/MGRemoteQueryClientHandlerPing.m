@implementation MGRemoteQueryClientHandlerPing

+ (id)handler
{
  return objc_alloc_init((Class)a1);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)prepareURL:(id)a3
{
  objc_msgSend(a3, "setPath:", 0x24E0ABF40);
}

- (void)prepareRequest:(id)a3
{
  objc_msgSend(a3, "setTimeoutInterval:", 30.0);
}

- (id)handleCompleteResponse:(id)a3 jsonPayload:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  MGRemoteQueryClientHandlerPing *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  if (!v5)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  v6 = v5;
  if (!objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v6 = v5;
    goto LABEL_10;
  }
LABEL_7:
  MGLogForCategory(6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v10 = 134217984;
    v11 = self;
    _os_log_error_impl(&dword_21CBD2000, v8, OS_LOG_TYPE_ERROR, "%p client handler received malformed ping payload content", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 94, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v7;
}

@end
