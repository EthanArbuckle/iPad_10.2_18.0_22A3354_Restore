@implementation IAXPCClient

- (IAXPCClient)initWithServiceName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  IAXPCClient *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSXPCConnection *connection;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  IAXPCProtocolObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  IAXPCClient *v40;
  _QWORD v42[7];
  _QWORD v43[7];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  IAXPCProtocolObject *server;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  NSXPCConnection *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  IAXPCClient *v55;
  objc_super v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)IAXPCClient;
  v8 = -[IAXPCClient init](&v56, sel_init);
  if (v8)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v5, (uint64_t)&unk_256DFF7A8, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x24BDD1988]);
    v13 = objc_msgSend_initWithMachServiceName_options_(v10, v11, (uint64_t)v4, 0, v12);
    connection = v8->_connection;
    v8->_connection = (NSXPCConnection *)v13;

    objc_msgSend_setRemoteObjectInterface_(v8->_connection, v15, (uint64_t)v9, v16, v17);
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = v8;
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = v8->_connection;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    server = v8->_server;
    sub_23F09755C();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = v53[3];
      *(_DWORD *)buf = 134217984;
      v58 = v19;
      _os_log_impl(&dword_23F08C000, v18, OS_LOG_TYPE_INFO, "Initialized 0x%lx", buf, 0xCu);
    }

    v20 = MEMORY[0x24BDAC760];
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = sub_23F0980A8;
    v43[3] = &unk_250F8FB68;
    v43[4] = &v52;
    v43[5] = &v48;
    v43[6] = &v44;
    objc_msgSend_setInterruptionHandler_(v8->_connection, v21, (uint64_t)v43, v22, v23);
    v42[0] = v20;
    v42[1] = 3221225472;
    v42[2] = sub_23F0980F0;
    v42[3] = &unk_250F8FB68;
    v42[4] = &v52;
    v42[5] = &v48;
    v42[6] = &v44;
    objc_msgSend_setInvalidationHandler_(v8->_connection, v24, (uint64_t)v42, v25, v26);
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v8->_connection, v27, (uint64_t)&unk_250F8F2F8, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v8->_server;
    v8->_server = (IAXPCProtocolObject *)v30;

    objc_msgSend_resume(v8->_connection, v32, v33, v34, v35);
    sub_23F09755C();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = v53[3];
      v38 = v49[3];
      v39 = v45[3];
      *(_DWORD *)buf = 134218496;
      v58 = v37;
      v59 = 2048;
      v60 = v38;
      v61 = 2048;
      v62 = v39;
      _os_log_impl(&dword_23F08C000, v36, OS_LOG_TYPE_INFO, "IAXPCclient 0x%lx init created _connection 0x%lx _server 0x%lx", buf, 0x20u);
    }

    v40 = v8;
    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);

  }
  return v8;
}

- (IAXPCClient)init
{
  uint64_t v2;
  uint64_t v3;

  return (IAXPCClient *)objc_msgSend_initWithServiceName_(self, a2, (uint64_t)CFSTR("com.apple.inputanalyticsd"), v2, v3);
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint8_t buf[4];
  IAXPCClient *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  sub_23F09755C();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v10 = self;
    _os_log_impl(&dword_23F08C000, v3, OS_LOG_TYPE_INFO, "dealloc 0x%lx", buf, 0xCu);
  }

  objc_msgSend_invalidateConnection(self, v4, v5, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)IAXPCClient;
  -[IAXPCClient dealloc](&v8, sel_dealloc);
}

- (void)invalidateConnection
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IAXPCProtocolObject *server;
  NSXPCConnection *connection;
  _QWORD v13[5];
  __int128 buf;
  uint64_t v15;
  IAXPCClient *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  sub_23F09755C();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_23F08C000, v3, OS_LOG_TYPE_INFO, "invalidateConnection called 0x%lx", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x2020000000;
  v16 = self;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_23F098398;
  v13[3] = &unk_250F8FBB0;
  v13[4] = &buf;
  objc_msgSend_setInvalidationHandler_(self->_connection, v4, (uint64_t)v13, v5, v6);
  objc_msgSend_invalidate(self->_connection, v7, v8, v9, v10);
  server = self->_server;
  self->_server = 0;

  connection = self->_connection;
  self->_connection = 0;

  _Block_object_dispose(&buf, 8);
}

- (void)logMessage:(id)a3
{
  ((void (*)(IAXPCProtocolObject *, char *, id))MEMORY[0x24BEDD108])(self->_server, sel_logMessage_, a3);
}

- (IAXPCProtocolObject)server
{
  return (IAXPCProtocolObject *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
