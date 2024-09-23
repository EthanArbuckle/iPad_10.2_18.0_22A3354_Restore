@implementation AURemoteMessageChannel

- (AURemoteMessageChannel)initWithMessageChannel:(id)a3
{
  id v5;
  AURemoteMessageChannel *v6;
  AURemoteMessageChannel *v7;
  uint64_t v8;
  NSXPCListener *listener;
  AURemoteMessageChannel *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AURemoteMessageChannel;
  v6 = -[AURemoteMessageChannel init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageChannel, a3);
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v8 = objc_claimAutoreleasedReturnValue();
    listener = v7->_listener;
    v7->_listener = (NSXPCListener *)v8;

    -[NSXPCListener setDelegate:](v7->_listener, "setDelegate:", v7);
    -[NSXPCListener resume](v7->_listener, "resume");
    v10 = v7;
  }

  return v7;
}

- (id)endpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  id from;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v6 = a4;
  objc_storeStrong((id *)&self->_xpcConnection, a4);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16A3D0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v7);

  -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE16A3D0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v8);

  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3321888768;
  v16[2] = __61__AURemoteMessageChannel_listener_shouldAcceptNewConnection___block_invoke;
  v16[3] = &__block_descriptor_40_ea8_32c47_ZTSN5caulk8weak_refI22AURemoteMessageChannelEE_e5_v8__0l;
  objc_copyWeak(&v17, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v16);
  v14[0] = v9;
  v14[1] = 3321888768;
  v14[2] = __61__AURemoteMessageChannel_listener_shouldAcceptNewConnection___block_invoke_221;
  v14[3] = &__block_descriptor_40_ea8_32c47_ZTSN5caulk8weak_refI22AURemoteMessageChannelEE_e5_v8__0l;
  objc_copyWeak(&v15, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v14);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");
  objc_initWeak(&from, self->_xpcConnection);
  v11[0] = v9;
  v11[1] = 3321888768;
  v11[2] = __61__AURemoteMessageChannel_listener_shouldAcceptNewConnection___block_invoke_2;
  v11[3] = &__block_descriptor_40_ea8_32c40_ZTSN5caulk8weak_refI15NSXPCConnectionEE_e36___NSDictionary_16__0__NSDictionary_8l;
  objc_copyWeak(&v12, &from);
  -[AUMessageChannel setCallHostBlock:](self->_messageChannel, "setCallHostBlock:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return 1;
}

- (void)onCallRemoteAU:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  AUMessageChannel *messageChannel;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  messageChannel = self->_messageChannel;
  if (messageChannel)
  {
    -[AUMessageChannel callAudioUnit:](messageChannel, "callAudioUnit:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v8);

  }
  else
  {
    v6[2](v6, 0, 0);
  }

}

- (void)retainSelfIfRequired
{
  if (self->_messageChannel)
  {
    if (self->_listener)
      objc_storeStrong((id *)&self->_selfRetained, self);
  }
}

- (void)releaseChannel
{
  AUMessageChannel *messageChannel;
  AURemoteMessageChannel *selfRetained;

  messageChannel = self->_messageChannel;
  self->_messageChannel = 0;

  selfRetained = self->_selfRetained;
  self->_selfRetained = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfRetained, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_messageChannel, 0);
}

void __61__AURemoteMessageChannel_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  NSLog(CFSTR("Client connection interrupted."));
  caulk::strong<AURemoteMessageChannel>((id *)(a1 + 32));
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2[3];
    v2[3] = 0;
    v7 = v2;

    v4 = (void *)v7[2];
    v7[2] = 0;

    v5 = (void *)v7[1];
    v7[1] = 0;

    v6 = (void *)v7[4];
    v7[4] = 0;

    v2 = v7;
  }

}

void __61__AURemoteMessageChannel_listener_shouldAcceptNewConnection___block_invoke_221(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  NSLog(CFSTR("Client connection invalidated."));
  caulk::strong<AURemoteMessageChannel>((id *)(a1 + 32));
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2[3];
    v2[3] = 0;
    v7 = v2;

    v4 = (void *)v7[2];
    v7[2] = 0;

    v5 = (void *)v7[1];
    v7[1] = 0;

    v6 = (void *)v7[4];
    v7[4] = 0;

    v2 = v7;
  }

}

id __61__AURemoteMessageChannel_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
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
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    caulk::xpc::sync_message<objc_object  {objcproto33AUAudioUnitMessageChannelProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(&v12, WeakRetained);
    caulk::xpc::message<objc_object  {objcproto33AUAudioUnitMessageChannelProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy(&v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto33AUAudioUnitMessageChannelProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)&v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "onCallRemoteAU:reply:", v3, v6);

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
    }
    else
    {
      if (!v14)
      {
LABEL_11:

        goto LABEL_12;
      }
      v10 = 5;
    }
    (*(void (**)(void))(*v9 + 8 * v10))();
    goto LABEL_11;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

@end
