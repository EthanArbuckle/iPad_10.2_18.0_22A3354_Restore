@implementation GTURLAccessProviderXPCDispatcher

- (GTURLAccessProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  GTURLAccessProviderXPCDispatcher *v9;
  objc_super v11;

  v7 = a3;
  objc_msgSend(a4, "protocolMethods");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)GTURLAccessProviderXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, sel_initWithProtocolMethods_, v8);

  if (v9)
    objc_storeStrong((id *)&v9->_service, a3);

  return v9;
}

- (void)securityScopedURLFromSandboxID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *nsobject;
  __int128 *data;
  __int128 v11;
  void *v12;
  void *v13;
  GTURLAccessProvider *service;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  size_t length;
  __int128 v23;
  __int128 v24;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v6, "identifier", v8);
  v23 = 0u;
  v24 = 0u;
  length = 0;
  data = (__int128 *)xpc_dictionary_get_data(v6, "auditToken", &length);
  if (data && length == 32)
  {
    v11 = data[1];
    v23 = *data;
    v24 = v11;
  }
  else
  {
    objc_msgSend(v7, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_get_audit_token();

  }
  gt_xpc_dictionary_create_reply(v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  service = self->_service;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __102__GTURLAccessProviderXPCDispatcher_securityScopedURLFromSandboxID_completionHandler__replyConnection___block_invoke;
  v17[3] = &unk_24F827BA0;
  v18 = v7;
  v19 = v13;
  v20 = v23;
  v21 = v24;
  v15 = v13;
  v16 = v7;
  -[GTURLAccessProvider securityScopedURLFromSandboxID:completionHandler:](service, "securityScopedURLFromSandboxID:completionHandler:", nsobject, v17);

}

void __102__GTURLAccessProviderXPCDispatcher_securityScopedURLFromSandboxID_completionHandler__replyConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  const char *v7;
  char *v8;
  __int128 v9;
  __int128 v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "startAccessingSecurityScopedResource");
    xpc_dictionary_set_nsobject(*(void **)(a1 + 40), "url", (uint64_t)v4);
    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v6, "fileSystemRepresentation");
    v9 = *(_OWORD *)(a1 + 48);
    v10 = *(_OWORD *)(a1 + 64);
    v7 = (const char *)sandbox_extension_issue_file_to_process();
    if (v7)
    {
      v8 = (char *)v7;
      xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 40), "sandboxExtension", v7);
      free(v8);
    }
    if (v5)
      objc_msgSend(v6, "stopAccessingSecurityScopedResource", v9, v10);
  }
  objc_msgSend(*(id *)(a1 + 32), "sendMessage:", *(_QWORD *)(a1 + 40), v9, v10);

}

- (void)makeURL_:(id)a3 replyConnection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *nsobject;
  const char *string;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  xpc_object_t xdict;

  xdict = a3;
  v6 = a4;
  gt_xpc_dictionary_create_reply(xdict);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(xdict, "url", v8);
  if (nsobject)
  {
    string = xpc_dictionary_get_string(xdict, "sandboxExtension");
    if (string)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", string, strlen(string) + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x22E30C77C](nsobject, v11);

    }
    -[GTURLAccessProvider makeURL:](self->_service, "makeURL:", nsobject);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isTrusted") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHost:", CFSTR("localhost"));
      objc_msgSend(v13, "URL");
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    xpc_dictionary_set_nsobject(v7, "identifier", (uint64_t)v12);

  }
  objc_msgSend(v6, "sendMessage:", v7);

}

- (void)transferIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *nsobject;
  const char *string;
  uint64_t v12;
  void *v13;
  GTURLAccessProvider *service;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a4;
  v7 = a3;
  gt_xpc_dictionary_create_reply(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v7, "identifier", v9);
  string = xpc_dictionary_get_string(v7, "deviceUDID");

  if (string
    && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string),
        (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    service = self->_service;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __99__GTURLAccessProviderXPCDispatcher_transferIdentifier_toDevice_completionHandler__replyConnection___block_invoke;
    v15[3] = &unk_24F827BC8;
    v16 = v8;
    v17 = v6;
    -[GTURLAccessProvider transferIdentifier:toDevice:completionHandler:](service, "transferIdentifier:toDevice:completionHandler:", nsobject, v13, v15);

  }
  else
  {
    objc_msgSend(v6, "sendMessage:", v8);
  }

}

uint64_t __99__GTURLAccessProviderXPCDispatcher_transferIdentifier_toDevice_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "url", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

- (void)copyIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *nsobject;
  const char *string;
  uint64_t v12;
  void *v13;
  GTURLAccessProvider *service;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  gt_xpc_dictionary_create_reply(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v7, "identifier", v9);
  string = xpc_dictionary_get_string(v7, "deviceUDID");

  if (string
    && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string),
        (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    service = self->_service;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __95__GTURLAccessProviderXPCDispatcher_copyIdentifier_toDevice_completionHandler__replyConnection___block_invoke;
    v18[3] = &unk_24F827BF0;
    v19 = v8;
    v20 = v6;
    -[GTURLAccessProvider copyIdentifier:toDevice:completionHandler:](service, "copyIdentifier:toDevice:completionHandler:", nsobject, v13, v18);

  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTURLAccessProviderXPCDispatcher"), CFSTR("Invalid device UDID passed to copyIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    xpc_dictionary_set_nserror(v8, "error", v13);
    objc_msgSend(v6, "sendMessage:", v8);
  }

}

uint64_t __95__GTURLAccessProviderXPCDispatcher_copyIdentifier_toDevice_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  xpc_dictionary_set_nsobject(v5, "url", a2);
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", v6);

  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

- (void)urlForPath_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *string;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  const char *v16;
  char *v17;
  __int128 v18;
  __int128 v19;

  v6 = a4;
  v7 = a3;
  gt_xpc_dictionary_create_reply(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  string = xpc_dictionary_get_string(v7, "path");

  if (string
    && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string),
        (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    -[GTURLAccessProvider urlForPath:](self->_service, "urlForPath:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "startAccessingSecurityScopedResource");
    xpc_dictionary_set_nsobject(v8, "result", (uint64_t)v12);
    objc_msgSend(v6, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_get_audit_token();

    v15 = objc_retainAutorelease(v12);
    objc_msgSend(v15, "fileSystemRepresentation");
    v18 = 0u;
    v19 = 0u;
    v16 = (const char *)sandbox_extension_issue_file_to_process();
    if (v16)
    {
      v17 = (char *)v16;
      xpc_dictionary_set_string(v8, "sandboxExtension", v16);
      free(v17);
    }
    if (v13)
      objc_msgSend(v15, "stopAccessingSecurityScopedResource", 0, 0, 0, 0);
    objc_msgSend(v6, "sendMessage:", v8, v18, v19);

  }
  else
  {
    objc_msgSend(v6, "sendMessage:", v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
