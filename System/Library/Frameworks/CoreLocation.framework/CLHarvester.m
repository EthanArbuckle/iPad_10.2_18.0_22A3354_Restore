@implementation CLHarvester

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHarvester;
  -[CLHarvester dealloc](&v3, sel_dealloc);
}

- (void)connect
{
  id v3;
  const char *v4;
  NSXPCConnection *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  Class v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  NSXPCConnection *connection;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[5];

  v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v5 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v3, v4, (uint64_t)CFSTR("com.apple.locationd.harvester"), 4096);
  self->_connection = v5;
  if (v5)
  {
    v8 = (void *)objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v6, (uint64_t)&unk_1EE190CD8, v7);
    v9 = NSClassFromString(CFSTR("CLPPoiHarvest"));
    objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v8, v10, (uint64_t)v9, (uint64_t)sel_submitSample_, 0, 0);
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v18 = objc_msgSend_setWithObjects_(v11, v16, v12, v17, v13, v14, v15, 0);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v8, v19, v18, (uint64_t)sel_fetchStateWithReply_, 0, 1);
    objc_msgSend_setRemoteObjectInterface_(self->_connection, v20, (uint64_t)v8, v21);
    connection = self->_connection;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_18F6EDAB8;
    v30[3] = &unk_1E2990DE0;
    v30[4] = self;
    objc_msgSend_setInvalidationHandler_(connection, v23, (uint64_t)v30, v24);
    objc_msgSend_setInterruptionHandler_(self->_connection, v25, (uint64_t)&unk_1E2990A10, v26);
    objc_msgSend_resume(self->_connection, v27, v28, v29);
  }
}

- (void)submitSample:(id)a3
{
  uint64_t v3;
  NSXPCConnection *connection;
  uint64_t v7;
  uint64_t v8;

  connection = self->_connection;
  if (!connection)
  {
    objc_msgSend_connect(self, a2, (uint64_t)a3, v3);
    connection = self->_connection;
  }
  v7 = objc_msgSend_remoteObjectProxy(connection, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v7, sel_submitSample_, a3, v8);
}

- (id)currentStateDictionary
{
  uint64_t v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  connection = self->_connection;
  if (!connection)
  {
    objc_msgSend_connect(self, a2, v2, v3);
    connection = self->_connection;
  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F5CD84C;
  v16 = sub_18F5CD7BC;
  v17 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(connection, a2, (uint64_t)&unk_1E2992B50, v3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6EE080;
  v11[3] = &unk_1E2992940;
  v11[4] = &v12;
  objc_msgSend_fetchStateWithReply_(v6, v7, (uint64_t)v11, v8);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

@end
