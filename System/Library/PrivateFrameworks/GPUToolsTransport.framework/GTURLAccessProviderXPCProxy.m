@implementation GTURLAccessProviderXPCProxy

- (GTURLAccessProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  GTURLAccessProviderXPCProxy *v12;
  GTServiceConnection *v13;
  void *v14;
  uint64_t v15;
  GTXPCConnection *connection;
  void *v17;
  void *v18;
  uint64_t v19;
  NSSet *ignoreMethods;
  GTURLAccessProviderXPCProxy *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v8 = &unk_255D647A0;
  objc_msgSend(v7, "protocolName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol((Protocol *)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    v23.receiver = self;
    v23.super_class = (Class)GTURLAccessProviderXPCProxy;
    v12 = -[GTURLAccessProviderXPCProxy init](&v23, sel_init);
    if (v12)
    {
      v13 = [GTServiceConnection alloc];
      objc_msgSend(v7, "deviceUDID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[GTServiceConnection initWithConnection:device:port:](v13, "initWithConnection:device:port:", v6, v14, objc_msgSend(v7, "servicePort"));
      connection = v12->_connection;
      v12->_connection = (GTXPCConnection *)v15;

      +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "protocolMethods");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      newSetWithArrayMinusArray(v17, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      ignoreMethods = v12->_ignoreMethods;
      v12->_ignoreMethods = (NSSet *)v19;

    }
    self = v12;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  NSSet *ignoreMethods;
  void *v6;
  BOOL v7;
  objc_super v9;

  ignoreMethods = self->_ignoreMethods;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet containsObject:](ignoreMethods, "containsObject:", v6))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GTURLAccessProviderXPCProxy;
    v7 = -[GTURLAccessProviderXPCProxy respondsToSelector:](&v9, sel_respondsToSelector_, a3);
  }

  return v7;
}

- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  xpc_object_t empty;
  const char *Name;
  GTXPCConnection *connection;
  id v12;
  _QWORD v13[4];
  id v14;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v17;

  v7 = a4;
  v8 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v8);

  *(_OWORD *)task_info_out = 0u;
  v17 = 0u;
  task_info_outCnt = 8;
  if (!task_info(*MEMORY[0x24BDAEC58], 0xFu, task_info_out, &task_info_outCnt))
    xpc_dictionary_set_data(empty, "auditToken", task_info_out, 0x20uLL);
  connection = self->_connection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__GTURLAccessProviderXPCProxy_securityScopedURLFromSandboxID_completionHandler___block_invoke;
  v13[3] = &unk_24F827B78;
  v14 = v7;
  v12 = v7;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v13);

}

void __80__GTURLAccessProviderXPCProxy_securityScopedURLFromSandboxID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *nsobject;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *string;
  void *v9;
  void (*v10)(void);
  xpc_object_t xdict;

  xdict = a2;
  if (xdict)
  {
    v3 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(xdict, "url", v3);
    v5 = nsobject;
    if (nsobject
      && (objc_msgSend(nsobject, "path"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "length"),
          v6,
          v7))
    {
      string = xpc_dictionary_get_string(xdict, "sandboxExtension");
      if (string)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", string, strlen(string) + 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x22E30C77C](v5, v9);

      }
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v10();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)makeURL:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  void *v8;
  id v9;
  const char *v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *nsobject;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "url", (uint64_t)v5);
  -[GTXPCConnection connection](self->_connection, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_connection_get_audit_token();

  v9 = objc_retainAutorelease(v5);
  objc_msgSend(v9, "fileSystemRepresentation");

  v10 = (const char *)sandbox_extension_issue_file_to_process();
  if (v10)
  {
    v11 = (char *)v10;
    xpc_dictionary_set_string(empty, "sandboxExtension", v10);
    free(v11);
  }
  -[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0, 0, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v12, "identifier", v13);
  }
  else
  {
    nsobject = 0;
  }

  return nsobject;
}

- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  xpc_object_t empty;
  const char *Name;
  id v14;
  const char *v15;
  GTXPCConnection *connection;
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v11);

  v14 = objc_retainAutorelease(v10);
  v15 = (const char *)objc_msgSend(v14, "UTF8String");

  xpc_dictionary_set_string(empty, "deviceUDID", v15);
  connection = self->_connection;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __77__GTURLAccessProviderXPCProxy_transferIdentifier_toDevice_completionHandler___block_invoke;
  v18[3] = &unk_24F827B78;
  v19 = v9;
  v17 = v9;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v18);

}

void __77__GTURLAccessProviderXPCProxy_transferIdentifier_toDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *nsobject;
  id v5;

  v5 = a2;
  if (v5)
  {
    v3 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v5, "url", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  xpc_object_t empty;
  const char *Name;
  id v14;
  const char *v15;
  GTXPCConnection *connection;
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v11);

  v14 = objc_retainAutorelease(v10);
  v15 = (const char *)objc_msgSend(v14, "UTF8String");

  xpc_dictionary_set_string(empty, "deviceUDID", v15);
  connection = self->_connection;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __73__GTURLAccessProviderXPCProxy_copyIdentifier_toDevice_completionHandler___block_invoke;
  v18[3] = &unk_24F827B78;
  v19 = v9;
  v17 = v9;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v18);

}

void __73__GTURLAccessProviderXPCProxy_copyIdentifier_toDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *nsobject;
  void *nserror;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v6, "url", v3);
    nserror = (void *)xpc_dictionary_get_nserror(v6, "error");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)urlForPath:(id)a3
{
  id v5;
  xpc_object_t empty;
  const char *Name;
  id v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *nsobject;
  const char *string;
  void *v14;

  v5 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v8 = objc_retainAutorelease(v5);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  xpc_dictionary_set_string(empty, "path", v9);
  -[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v10, "result", v11);
    string = xpc_dictionary_get_string(v10, "sandboxExtension");
    if (string)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", string, strlen(string) + 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x22E30C77C](nsobject, v14);

    }
  }
  else
  {
    nsobject = 0;
  }

  return nsobject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
