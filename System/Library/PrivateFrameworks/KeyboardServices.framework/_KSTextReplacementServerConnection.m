@implementation _KSTextReplacementServerConnection

- (_KSTextReplacementServerConnection)init
{
  _KSTextReplacementServerConnection *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSXPCConnection *serviceConnection;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_KSTextReplacementServerConnection;
  v2 = -[_KSTextReplacementServerConnection init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD1988]);
    +[_KSUtilities machServiceNameTextReplacement](_KSUtilities, "machServiceNameTextReplacement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithMachServiceName:options:", v4, 4096);
    serviceConnection = v2->_serviceConnection;
    v2->_serviceConnection = (NSXPCConnection *)v5;

    _KSTextReplacementServerInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_serviceConnection, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](v2->_serviceConnection, "resume");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_serviceConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_KSTextReplacementServerConnection;
  -[_KSTextReplacementServerConnection dealloc](&v3, sel_dealloc);
}

+ (id)serviceConnection
{
  return objc_alloc_init(_KSTextReplacementServerConnection);
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withReply:(id)a5
{
  id v8;
  NSXPCConnection *serviceConnection;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  serviceConnection = self->_serviceConnection;
  v10 = a4;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxy](serviceConnection, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73___KSTextReplacementServerConnection_addEntries_removeEntries_withReply___block_invoke;
  v14[3] = &unk_24E205600;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "addEntries:removeEntries:withReply:", v11, v10, v14);

}

- (void)removeAllEntries
{
  id v2;

  -[NSXPCConnection remoteObjectProxy](self->_serviceConnection, "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllEntries");

}

- (void)requestSyncWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_serviceConnection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59___KSTextReplacementServerConnection_requestSyncWithReply___block_invoke;
  v7[3] = &unk_24E205628;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "requestSyncWithReply:", v7);

}

- (void)cancelPendingUpdatesWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_serviceConnection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68___KSTextReplacementServerConnection_cancelPendingUpdatesWithReply___block_invoke;
  v7[3] = &unk_24E205600;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "cancelPendingUpdatesWithReply:", v7);

}

- (void)queryTextReplacementEntriesWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](self->_serviceConnection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75___KSTextReplacementServerConnection_queryTextReplacementEntriesWithReply___block_invoke;
  v7[3] = &unk_24E2056B8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "queryTextReplacementEntriesWithReply:", v7);

}

- (void)queryTextReplacementsWithPredicate:(id)a3 reply:(id)a4
{
  id v6;
  NSXPCConnection *serviceConnection;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  serviceConnection = self->_serviceConnection;
  v8 = a3;
  -[NSXPCConnection remoteObjectProxy](serviceConnection, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79___KSTextReplacementServerConnection_queryTextReplacementsWithPredicate_reply___block_invoke;
  v11[3] = &unk_24E2056B8;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "queryTextReplacementsWithPredicate:reply:", v8, v11);

}

- (id)textReplacementEntries
{
  uint64_t v3;
  NSXPCConnection *serviceConnection;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  serviceConnection = self->_serviceConnection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60___KSTextReplacementServerConnection_textReplacementEntries__block_invoke;
  v13[3] = &unk_24E2059F8;
  v13[4] = &v20;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](serviceConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  while (*((_BYTE *)v10 + 24) && !v21[5])
  {
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __60___KSTextReplacementServerConnection_textReplacementEntries__block_invoke_2;
    v8[3] = &unk_24E205A20;
    v8[4] = &v14;
    v8[5] = &v9;
    objc_msgSend(v5, "queryTextReplacementEntriesWithReply:", v8);
  }
  v6 = (id)v15[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

@end
