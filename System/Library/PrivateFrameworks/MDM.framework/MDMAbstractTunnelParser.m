@implementation MDMAbstractTunnelParser

- (id)_commandDisconnect:(id)a3
{
  NSObject *v3;

  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[MDMAbstractTunnelParser(Commands) _commandDisconnect:].cold.1(v3);
  +[MDMAbstractTunnelParser responseWithStatus:](MDMAbstractTunnelParser, "responseWithStatus:", CFSTR("Acknowledged"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)responseWithStatus:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("Status");
  v9[0] = a3;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  return v6;
}

+ (id)responseWithError:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("Status");
  v8[1] = CFSTR("ErrorObject");
  v9[0] = CFSTR("Error");
  v9[1] = a3;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  return v6;
}

- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a5;
  if (!objc_msgSend(v7, "count"))
  {
    v12 = 0;
    if (!v8)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("RequestType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "isEqualToString:", CFSTR("Disconnect")))
  {
    -[MDMAbstractTunnelParser _commandDisconnect:](self, "_commandDisconnect:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MDMAbstractTunnelParser responseWithStatus:](MDMAbstractTunnelParser, "responseWithStatus:", CFSTR("CommandFormatError"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  if (v8)
  {
LABEL_7:
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __68__MDMAbstractTunnelParser_processRequest_assertion_completionBlock___block_invoke;
    v14[3] = &unk_24EB67F18;
    v16 = v8;
    v15 = v12;
    dispatch_async(v13, v14);

  }
LABEL_8:

}

uint64_t __68__MDMAbstractTunnelParser_processRequest_assertion_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
