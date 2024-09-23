@implementation GTLaunchServiceXPCProxy

- (GTLaunchServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTLaunchServiceXPCProxy *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  GTServiceConnection *v13;
  void *v14;
  uint64_t v15;
  GTXPCConnection *connection;
  void *v17;
  void *v18;
  uint64_t v19;
  NSSet *ignoreMethods;
  GTLaunchServiceXPCProxy *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)GTLaunchServiceXPCProxy;
  v8 = -[GTLaunchServiceXPCProxy init](&v23, sel_init);
  if (v8)
  {
    v9 = &unk_255D65210;
    objc_msgSend(v7, "protocolName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v12)
    {

      v21 = 0;
      goto LABEL_6;
    }
    v13 = [GTServiceConnection alloc];
    objc_msgSend(v7, "deviceUDID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[GTServiceConnection initWithConnection:device:port:](v13, "initWithConnection:device:port:", v6, v14, objc_msgSend(v7, "servicePort"));
    connection = v8->_connection;
    v8->_connection = (GTXPCConnection *)v15;

    +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protocolMethods");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    newSetWithArrayMinusArray(v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v19;

  }
  v21 = v8;
LABEL_6:

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
    v9.super_class = (Class)GTLaunchServiceXPCProxy;
    v7 = -[GTLaunchServiceXPCProxy respondsToSelector:](&v9, sel_respondsToSelector_, a3);
  }

  return v7;
}

- (BOOL)launchReplayService:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  xpc_object_t empty;
  const char *Name;
  uint64_t v15;
  void *v16;
  void *nserror;
  void *v18;
  BOOL v19;

  v7 = a3;
  objc_msgSend(v7, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v7, "sessionUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("GT_LAUNCH_UUID"));

  v12 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "setEnvironment:", v12);

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "request", (uint64_t)v7);

  -[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a4);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v15, "error");
    v18 = nserror;
    v19 = nserror == 0;
    if (a4 && nserror)
      *a4 = objc_retainAutorelease(nserror);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)foregroundService:(unint64_t)a3 error:(id *)a4
{
  xpc_object_t empty;
  const char *Name;
  uint64_t v10;
  void *v11;
  void *nserror;
  void *v13;
  BOOL v14;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  -[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v10, "error");
    v13 = nserror;
    v14 = nserror == 0;
    if (a4 && nserror)
      *a4 = objc_retainAutorelease(nserror);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)resumeService:(unint64_t)a3 error:(id *)a4
{
  xpc_object_t empty;
  const char *Name;
  uint64_t v10;
  void *v11;
  void *nserror;
  void *v13;
  BOOL v14;

  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  -[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v10, "error");
    v13 = nserror;
    v14 = nserror == 0;
    if (a4 && nserror)
      *a4 = objc_retainAutorelease(nserror);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)symbolicatorForService:(unint64_t)a3 completionHandler:(id)a4
{
  id v7;
  xpc_object_t empty;
  const char *Name;
  GTXPCConnection *connection;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  connection = self->_connection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__GTLaunchServiceXPCProxy_symbolicatorForService_completionHandler___block_invoke;
  v12[3] = &unk_24F827B78;
  v13 = v7;
  v11 = v7;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v12);

}

void __68__GTLaunchServiceXPCProxy_symbolicatorForService_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id nsdata;

  if (a2)
  {
    nsdata = (id)xpc_dictionary_get_nsdata(a2, "signature");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)processStateForService:(unint64_t)a3 completionHandler:(id)a4
{
  id v7;
  xpc_object_t empty;
  const char *Name;
  GTXPCConnection *connection;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  connection = self->_connection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__GTLaunchServiceXPCProxy_processStateForService_completionHandler___block_invoke;
  v12[3] = &unk_24F827B78;
  v13 = v7;
  v11 = v7;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v12);

}

void __68__GTLaunchServiceXPCProxy_processStateForService_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *nserror;
  void *v6;
  GTProcessState *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v3, "error");
    if (nserror)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      xpc_dictionary_get_dictionary(v4, "processState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = objc_alloc_init(GTProcessState);
        -[GTProcessState setIsSuspended:](v7, "setIsSuspended:", xpc_dictionary_get_BOOL(v6, "isSuspended"));
      }
      else
      {
        v8 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Deserialization failed for %@"), CFSTR("processState"), *MEMORY[0x24BDD0FC8]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 10, v10);
        v7 = (GTProcessState *)objc_claimAutoreleasedReturnValue();

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
