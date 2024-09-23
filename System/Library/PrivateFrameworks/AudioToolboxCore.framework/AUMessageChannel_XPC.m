@implementation AUMessageChannel_XPC

- (AUMessageChannel_XPC)initWithListenerEndpoint:(id)a3
{
  id v4;
  AUMessageChannel_XPC *v5;
  uint64_t v6;
  NSXPCConnection *xpcConnection;
  void *v8;
  void *v9;
  ExportedMessageChannel *v10;
  AUMessageChannel_XPC *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AUMessageChannel_XPC;
  v5 = -[AUMessageChannel_XPC init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
    xpcConnection = v5->_xpcConnection;
    v5->_xpcConnection = (NSXPCConnection *)v6;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16A3D0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_xpcConnection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection setInterruptionHandler:](v5->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_92);
    -[NSXPCConnection setInvalidationHandler:](v5->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_95);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16A3D0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5->_xpcConnection, "setExportedInterface:", v9);

    v10 = -[ExportedMessageChannel initWithMessageChannel:]([ExportedMessageChannel alloc], "initWithMessageChannel:", v5);
    -[NSXPCConnection setExportedObject:](v5->_xpcConnection, "setExportedObject:", v10);

    -[NSXPCConnection resume](v5->_xpcConnection, "resume");
    v11 = v5;
  }

  return v5;
}

- (id)callAudioUnit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v12;
  _BYTE v13[24];
  _BYTE *v14;
  id v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  caulk::xpc::sync_message<objc_object  {objcproto33AUAudioUnitMessageChannelProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(&v12, self->_xpcConnection);
  caulk::xpc::message<objc_object  {objcproto33AUAudioUnitMessageChannelProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy(&v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto33AUAudioUnitMessageChannelProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)&v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "onCallRemoteAU:reply:", v4, v6);

  v7 = v16;
  if (v15)
    v8 = 0;
  else
    v8 = v16;

  v9 = v14;
  if (v14 == v13)
  {
    v10 = 4;
    v9 = v13;
    goto LABEL_8;
  }
  if (v14)
  {
    v10 = 5;
LABEL_8:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }

  return v8;
}

- (void)dealloc
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  NSXPCConnection *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  NSXPCConnection *v16;
  uint64_t v17;
  objc_super v18;
  _QWORD v19[3];
  _QWORD *v20;
  NSXPCConnection *v21;
  _QWORD v22[3];
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  _BYTE v28[24];
  _BYTE *v29;
  _QWORD v30[3];
  _QWORD *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  xpcConnection = self->_xpcConnection;
  v19[0] = &off_1E29135F0;
  v19[1] = &__block_literal_global_100;
  v20 = v19;
  v4 = xpcConnection;
  v21 = v4;
  v5 = v22;
  v6 = (uint64_t)v20;
  if (!v20)
    goto LABEL_4;
  if (v20 != v19)
  {
    v6 = (*(uint64_t (**)(void))(*v20 + 16))();
LABEL_4:
    v23 = (_QWORD *)v6;
    goto LABEL_6;
  }
  v23 = v22;
  (*(void (**)(_QWORD *, _QWORD *))(v19[0] + 24))(v19, v22);
LABEL_6:

  v7 = v20;
  if (v20 == v19)
  {
    v8 = 4;
    v7 = v19;
  }
  else
  {
    if (!v20)
      goto LABEL_11;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_11:
  v9 = v23;
  if (!v23)
  {
    v31 = 0;
    v10 = v21;
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3321888768;
    v26 = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33AUAudioUnitMessageChannelProtocol11objc_objectJEE11async_proxyEv_block_invoke;
    v27 = &__block_descriptor_64_ea8_32c50_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJEEEEEE_e17_v16__0__NSError_8l;
    v11 = v28;
LABEL_19:
    v29 = v9;
    goto LABEL_20;
  }
  if (v23 == v22)
  {
    v31 = v30;
    (*(void (**)(_QWORD *, _QWORD *))(v22[0] + 24))(v22, v30);
    v9 = v31;
  }
  else
  {
    v9 = (_QWORD *)(*(uint64_t (**)(void))(*v23 + 16))();
    v31 = v9;
  }
  v10 = v21;
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3321888768;
  v26 = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33AUAudioUnitMessageChannelProtocol11objc_objectJEE11async_proxyEv_block_invoke;
  v27 = &__block_descriptor_64_ea8_32c50_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJEEEEEE_e17_v16__0__NSError_8l;
  v11 = v28;
  if (!v9)
    goto LABEL_19;
  if (v9 != v30)
  {
    v9 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v9 + 16))(v9);
    goto LABEL_19;
  }
  v29 = v28;
  (*(void (**)(_QWORD *, _BYTE *))(v30[0] + 24))(v30, v28);
LABEL_20:
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v10, "remoteObjectProxyWithErrorHandler:", &v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 == v28)
  {
    v13 = 4;
  }
  else
  {
    if (!v29)
      goto LABEL_25;
    v13 = 5;
    v11 = v29;
  }
  (*(void (**)(_QWORD *))(*v11 + 8 * v13))(v11);
LABEL_25:
  v14 = v31;
  if (v31 == v30)
  {
    v15 = 4;
    v14 = v30;
  }
  else
  {
    if (!v31)
      goto LABEL_30;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_30:
  objc_msgSend(v12, "releaseChannel");

  v16 = self->_xpcConnection;
  self->_xpcConnection = 0;

  if (v23 == v22)
  {
    v17 = 4;
    goto LABEL_34;
  }
  if (v23)
  {
    v17 = 5;
    v5 = v23;
LABEL_34:
    (*(void (**)(_QWORD *))(*v5 + 8 * v17))(v5);
  }

  v18.receiver = self;
  v18.super_class = (Class)AUMessageChannel_XPC;
  -[AUMessageChannel_XPC dealloc](&v18, sel_dealloc);
}

- (id)callHostBlock
{
  return self->_callHostBlock;
}

- (void)setCallHostBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callHostBlock, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
