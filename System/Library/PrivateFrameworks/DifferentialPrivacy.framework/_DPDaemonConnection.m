@implementation _DPDaemonConnection

- (_DPDaemonConnection)init
{
  _DPDaemonConnection *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSXPCConnection *daemonConnection;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_DPDaemonConnection;
  v2 = -[_DPDaemonConnection init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    +[_DPStrings machServiceName](_DPStrings, "machServiceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithMachServiceName:options:", v4, 4096);
    daemonConnection = v2->_daemonConnection;
    v2->_daemonConnection = (NSXPCConnection *)v5;

    _DPDaemonInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_daemonConnection, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](v2->_daemonConnection, "resume");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_daemonConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_DPDaemonConnection;
  -[_DPDaemonConnection dealloc](&v3, sel_dealloc);
}

+ (id)daemonConnection
{
  return (id)objc_opt_new();
}

- (void)recordNumbers:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8;
  NSXPCConnection *daemonConnection;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  daemonConnection = self->_daemonConnection;
  v10 = a4;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxy](daemonConnection, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54___DPDaemonConnection_recordNumbers_forKey_withReply___block_invoke;
  v14[3] = &unk_1E95D8FE8;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "recordNumbers:forKey:withReply:", v11, v10, v14);

}

- (void)recordNumbers:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v10;
  NSXPCConnection *daemonConnection;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  daemonConnection = self->_daemonConnection;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[NSXPCConnection remoteObjectProxy](daemonConnection, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63___DPDaemonConnection_recordNumbers_metadata_forKey_withReply___block_invoke;
  v17[3] = &unk_1E95D8FE8;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "recordNumbers:metadata:forKey:withReply:", v14, v13, v12, v17);

}

- (void)recordNumbersVectors:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8;
  NSXPCConnection *daemonConnection;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  daemonConnection = self->_daemonConnection;
  v10 = a4;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxy](daemonConnection, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61___DPDaemonConnection_recordNumbersVectors_forKey_withReply___block_invoke;
  v14[3] = &unk_1E95D8FE8;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "recordNumbersVectors:forKey:withReply:", v11, v10, v14);

}

- (void)recordNumbersVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v10;
  NSXPCConnection *daemonConnection;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  daemonConnection = self->_daemonConnection;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[NSXPCConnection remoteObjectProxy](daemonConnection, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70___DPDaemonConnection_recordNumbersVectors_metadata_forKey_withReply___block_invoke;
  v17[3] = &unk_1E95D8FE8;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "recordNumbersVectors:metadata:forKey:withReply:", v14, v13, v12, v17);

}

- (void)recordBitValues:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8;
  NSXPCConnection *daemonConnection;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  daemonConnection = self->_daemonConnection;
  v10 = a4;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxy](daemonConnection, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56___DPDaemonConnection_recordBitValues_forKey_withReply___block_invoke;
  v14[3] = &unk_1E95D8FE8;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "recordBitValues:forKey:withReply:", v11, v10, v14);

}

- (void)recordBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v10;
  NSXPCConnection *daemonConnection;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  daemonConnection = self->_daemonConnection;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[NSXPCConnection remoteObjectProxy](daemonConnection, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65___DPDaemonConnection_recordBitValues_metadata_forKey_withReply___block_invoke;
  v17[3] = &unk_1E95D8FE8;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "recordBitValues:metadata:forKey:withReply:", v14, v13, v12, v17);

}

- (void)recordBitVectors:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8;
  NSXPCConnection *daemonConnection;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  daemonConnection = self->_daemonConnection;
  v10 = a4;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxy](daemonConnection, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57___DPDaemonConnection_recordBitVectors_forKey_withReply___block_invoke;
  v14[3] = &unk_1E95D8FE8;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "recordBitVectors:forKey:withReply:", v11, v10, v14);

}

- (void)recordBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  +[_DPLog framework](_DPLog, "framework");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v10;
    _os_log_impl(&dword_1D3FAA000, v14, OS_LOG_TYPE_DEFAULT, "Begin: recordBitVectors:metadata: for key %@", buf, 0xCu);
  }

  -[NSXPCConnection remoteObjectProxy](self->_daemonConnection, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)os_transaction_create();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66___DPDaemonConnection_recordBitVectors_metadata_forKey_withReply___block_invoke;
  v20[3] = &unk_1E95D9010;
  v22 = v16;
  v23 = v11;
  v21 = v10;
  v17 = v16;
  v18 = v10;
  v19 = v11;
  objc_msgSend(v15, "recordBitVectors:metadata:forKey:withReply:", v13, v12, v18, v20);

}

- (void)recordFloatVectors:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8;
  NSXPCConnection *daemonConnection;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  daemonConnection = self->_daemonConnection;
  v10 = a4;
  v11 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59___DPDaemonConnection_recordFloatVectors_forKey_withReply___block_invoke_2;
  v14[3] = &unk_1E95D8FE8;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "recordFloatVectors:forKey:withReply:", v11, v10, v14);

}

- (void)recordFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v10;
  NSXPCConnection *daemonConnection;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  daemonConnection = self->_daemonConnection;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68___DPDaemonConnection_recordFloatVectors_metadata_forKey_withReply___block_invoke_2;
  v17[3] = &unk_1E95D8FE8;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "recordFloatVectors:metadata:forKey:withReply:", v14, v13, v12, v17);

}

- (void)recordStrings:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8;
  NSXPCConnection *daemonConnection;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  daemonConnection = self->_daemonConnection;
  v10 = a4;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxy](daemonConnection, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54___DPDaemonConnection_recordStrings_forKey_withReply___block_invoke;
  v14[3] = &unk_1E95D8FE8;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "recordStrings:forKey:withReply:", v11, v10, v14);

}

- (void)recordStrings:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  id v10;
  NSXPCConnection *daemonConnection;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  daemonConnection = self->_daemonConnection;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[NSXPCConnection remoteObjectProxy](daemonConnection, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63___DPDaemonConnection_recordStrings_metadata_forKey_withReply___block_invoke;
  v17[3] = &unk_1E95D8FE8;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "recordStrings:metadata:forKey:withReply:", v14, v13, v12, v17);

}

- (void)recordWords:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v8;
  NSXPCConnection *daemonConnection;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  daemonConnection = self->_daemonConnection;
  v10 = a4;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxy](daemonConnection, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52___DPDaemonConnection_recordWords_forKey_withReply___block_invoke;
  v14[3] = &unk_1E95D8FE8;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "recordWords:forKey:withReply:", v11, v10, v14);

}

- (void)reportsNotYetSubmittedWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_daemonConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55___DPDaemonConnection_reportsNotYetSubmittedWithReply___block_invoke_2;
  v7[3] = &unk_1E95D9078;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "reportsNotYetSubmittedWithReply:", v7);

}

- (void)retireReports:(id)a3 withReply:(id)a4
{
  id v6;
  NSXPCConnection *daemonConnection;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  daemonConnection = self->_daemonConnection;
  v8 = a3;
  -[NSXPCConnection remoteObjectProxy](daemonConnection, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47___DPDaemonConnection_retireReports_withReply___block_invoke;
  v11[3] = &unk_1E95D8FE8;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "retireReports:withReply:", v8, v11);

}

- (NSXPCConnection)daemonConnection
{
  return self->_daemonConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

@end
