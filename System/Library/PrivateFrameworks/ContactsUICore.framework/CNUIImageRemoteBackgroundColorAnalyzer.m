@implementation CNUIImageRemoteBackgroundColorAnalyzer

- (void)dealloc
{
  objc_super v3;

  -[CNUIImageRemoteBackgroundColorAnalyzer _closeConnection](self, "_closeConnection");
  v3.receiver = self;
  v3.super_class = (Class)CNUIImageRemoteBackgroundColorAnalyzer;
  -[CNUIImageRemoteBackgroundColorAnalyzer dealloc](&v3, sel_dealloc);
}

- (void)_openConnectionIfNeeded
{
  NSXPCConnection *v3;
  NSXPCConnection *serviceConnection;
  void *v5;

  if (!self->_serviceConnection)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.ContactsBackgroundColorService"));
    serviceConnection = self->_serviceConnection;
    self->_serviceConnection = v3;

    contactsBackgroundColorServiceInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_serviceConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](self->_serviceConnection, "resume");
  }
}

- (void)_closeConnection
{
  NSXPCConnection *serviceConnection;

  -[NSXPCConnection invalidate](self->_serviceConnection, "invalidate");
  serviceConnection = self->_serviceConnection;
  self->_serviceConnection = 0;

}

- (void)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNUIImageRemoteBackgroundColorAnalyzer _openConnectionIfNeeded](self, "_openConnectionIfNeeded");
  if (v8)
  {
    -[CNUIImageRemoteBackgroundColorAnalyzer serviceConnection](self, "serviceConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __91__CNUIImageRemoteBackgroundColorAnalyzer_getBackgroundColorOnImageData_bitmapFormat_reply___block_invoke;
    v17[3] = &unk_1EA6054F0;
    v13 = v10;
    v18 = v13;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __91__CNUIImageRemoteBackgroundColorAnalyzer_getBackgroundColorOnImageData_bitmapFormat_reply___block_invoke_2;
    v15[3] = &unk_1EA605518;
    v16 = v13;
    objc_msgSend(v14, "getBackgroundColorOnImageData:bitmapFormat:withReply:", v8, v9, v15);

  }
}

uint64_t __91__CNUIImageRemoteBackgroundColorAnalyzer_getBackgroundColorOnImageData_bitmapFormat_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__CNUIImageRemoteBackgroundColorAnalyzer_getBackgroundColorOnImageData_bitmapFormat_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSXPCConnection)serviceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

@end
