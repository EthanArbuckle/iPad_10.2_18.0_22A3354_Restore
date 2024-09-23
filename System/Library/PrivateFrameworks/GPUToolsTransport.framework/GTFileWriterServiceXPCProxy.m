@implementation GTFileWriterServiceXPCProxy

- (GTFileWriterServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTFileWriterServiceXPCProxy *v8;
  void *v9;
  GTServiceConnection *v10;
  void *v11;
  uint64_t v12;
  GTXPCConnection *connection;
  void *v14;
  void *v15;
  uint64_t v16;
  NSSet *ignoreMethods;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GTFileWriterServiceXPCProxy;
  v8 = -[GTFileWriterServiceXPCProxy init](&v19, sel_init);
  if (v8)
  {
    v9 = &unk_255D64E18;
    v10 = [GTServiceConnection alloc];
    objc_msgSend(v7, "deviceUDID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[GTServiceConnection initWithConnection:device:port:](v10, "initWithConnection:device:port:", v6, v11, objc_msgSend(v7, "servicePort"));
    connection = v8->_connection;
    v8->_connection = (GTXPCConnection *)v12;

    +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protocolMethods");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    newSetWithArrayMinusArray(v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v16;

  }
  return v8;
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
    v9.super_class = (Class)GTFileWriterServiceXPCProxy;
    v7 = -[GTFileWriterServiceXPCProxy respondsToSelector:](&v9, sel_respondsToSelector_, a3);
  }

  return v7;
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  xpc_object_t empty;
  const char *Name;
  id v20;
  const char *v21;
  id v22;
  const char *v23;
  GTXPCConnection *connection;
  id v25;
  _QWORD v26[4];
  id v27;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "fileEntries", (uint64_t)v17);

  v20 = objc_retainAutorelease(v16);
  v21 = (const char *)objc_msgSend(v20, "UTF8String");

  xpc_dictionary_set_string(empty, "path", v21);
  v22 = objc_retainAutorelease(v15);
  v23 = (const char *)objc_msgSend(v22, "UTF8String");

  xpc_dictionary_set_string(empty, "deviceUDID", v23);
  xpc_dictionary_set_nsobject(empty, "options", (uint64_t)v14);

  connection = self->_connection;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __94__GTFileWriterServiceXPCProxy_initiateTransfer_basePath_fromDevice_options_completionHandler___block_invoke;
  v26[3] = &unk_24F827B78;
  v27 = v13;
  v25 = v13;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v26);

}

void __94__GTFileWriterServiceXPCProxy_initiateTransfer_basePath_fromDevice_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t nserror;
  void *v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    nserror = xpc_dictionary_get_nserror(a2, "error");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = (void *)nserror;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = v7;
  }

}

- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  xpc_object_t empty;
  const char *Name;
  id v20;
  const char *v21;
  id v22;
  const char *v23;
  GTXPCConnection *connection;
  id v25;
  _QWORD v26[4];
  id v27;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "fileEntries", (uint64_t)v17);

  v20 = objc_retainAutorelease(v16);
  v21 = (const char *)objc_msgSend(v20, "UTF8String");

  xpc_dictionary_set_string(empty, "path", v21);
  v22 = objc_retainAutorelease(v15);
  v23 = (const char *)objc_msgSend(v22, "UTF8String");

  xpc_dictionary_set_string(empty, "deviceUDID", v23);
  xpc_dictionary_set_nsobject(empty, "options", (uint64_t)v14);

  connection = self->_connection;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __91__GTFileWriterServiceXPCProxy_startTransfer_basePath_fromDevice_options_completionHandler___block_invoke;
  v26[3] = &unk_24F827B78;
  v27 = v13;
  v25 = v13;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v26);

}

void __91__GTFileWriterServiceXPCProxy_startTransfer_basePath_fromDevice_options_completionHandler___block_invoke(uint64_t a1, void *a2)
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

- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  xpc_object_t empty;
  const char *Name;
  id v22;
  const char *v23;
  id v24;
  const char *v25;
  GTXPCConnection *connection;
  id v27;
  _QWORD v28[4];
  id v29;

  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "fileEntries", (uint64_t)v19);

  v22 = objc_retainAutorelease(v18);
  v23 = (const char *)objc_msgSend(v22, "UTF8String");

  xpc_dictionary_set_string(empty, "path", v23);
  v24 = objc_retainAutorelease(v17);
  v25 = (const char *)objc_msgSend(v24, "UTF8String");

  xpc_dictionary_set_string(empty, "deviceUDID", v25);
  xpc_dictionary_set_nsobject(empty, "options", (uint64_t)v16);

  xpc_dictionary_set_uint64(empty, "sessionID", a7);
  connection = self->_connection;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __121__GTFileWriterServiceXPCProxy_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke;
  v28[3] = &unk_24F827B78;
  v29 = v15;
  v27 = v15;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v28);

}

void __121__GTFileWriterServiceXPCProxy_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id nserror;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 32), a3);
  }
}

- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  xpc_object_t empty;
  const char *Name;
  GTXPCConnection *connection;
  id v14;
  _QWORD v15[4];
  id v16;

  v9 = a5;
  v10 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsdata(empty, "data", v10);

  xpc_dictionary_set_uint64(empty, "sessionID", a4);
  connection = self->_connection;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __73__GTFileWriterServiceXPCProxy_writeFileData_sessionID_completionHandler___block_invoke;
  v15[3] = &unk_24F827B78;
  v16 = v9;
  v14 = v9;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v15);

}

void __73__GTFileWriterServiceXPCProxy_writeFileData_sessionID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id nserror;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 32), a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
