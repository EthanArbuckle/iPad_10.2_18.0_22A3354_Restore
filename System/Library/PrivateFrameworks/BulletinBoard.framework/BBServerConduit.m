@implementation BBServerConduit

+ (id)serverInterface
{
  if (serverInterface_onceToken_0 != -1)
    dispatch_once(&serverInterface_onceToken_0, &__block_literal_global_20);
  return (id)serverInterface___interface_0;
}

void __34__BBServerConduit_serverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254998078);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serverInterface___interface_0;
  serverInterface___interface_0 = v0;

  v2 = (void *)serverInterface___interface_0;
  BBAllowedClasses();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_sendMessageToDataProviderSectionID_name_userInfo_, 2, 0);

}

+ (id)clientInterface
{
  if (clientInterface_onceToken_1 != -1)
    dispatch_once(&clientInterface_onceToken_1, &__block_literal_global_51);
  return (id)clientInterface___interface_1;
}

void __34__BBServerConduit_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549A3828);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface___interface_1;
  clientInterface___interface_1 = v0;

}

+ (id)sharedConduit
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__BBServerConduit_sharedConduit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConduit_onceToken != -1)
    dispatch_once(&sharedConduit_onceToken, block);
  return (id)sharedConduit___SharedConduit;
}

void __32__BBServerConduit_sharedConduit__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedConduit___SharedConduit;
  sharedConduit___SharedConduit = (uint64_t)v1;

}

- (BBServerConduit)init
{
  BBServerConduit *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BBServerConduit;
  v2 = -[BBServerConduit init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.bulletinboard.serverconduitconnection"), 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    objc_msgSend((id)objc_opt_class(), "clientInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:", v6);

    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
    v7 = v2->_connection;
    objc_msgSend((id)objc_opt_class(), "serverInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_57);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_59);
    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

void __23__BBServerConduit_init__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20CCB9000, v0, OS_LOG_TYPE_DEFAULT, "BBServerConduit connection interrupted.", v1, 2u);
  }
}

void __23__BBServerConduit_init__block_invoke_58()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20CCB9000, v0, OS_LOG_TYPE_DEFAULT, "BBServerConduit connection invalidated.", v1, 2u);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BBServerConduit;
  -[BBServerConduit dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSXPCConnection *connection;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void)sendMessageToDataProviderSectionID:(id)a3 name:(id)a4 userInfo:(id)a5
{
  NSXPCConnection *connection;
  id v8;
  id v9;
  id v10;
  id v11;

  connection = self->_connection;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendMessageToDataProviderSectionID:name:userInfo:", v10, v9, v8);

}

- (void)weeAppWithBundleID:(id)a3 setHiddenFromUser:(BOOL)a4
{
  _BOOL8 v4;
  NSXPCConnection *connection;
  id v6;
  id v7;

  v4 = a4;
  connection = self->_connection;
  v6 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "weeAppWithBundleID:setHiddenFromUser:", v6, v4);

}

- (void)weeAppWithBundleID:(id)a3 getHiddenFromUser:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->_connection;
  v8 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__BBServerConduit_weeAppWithBundleID_getHiddenFromUser___block_invoke;
  v11[3] = &unk_24C564D08;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "weeAppWithBundleID:getHiddenFromUser:", v8, v11);

}

void __56__BBServerConduit_weeAppWithBundleID_getHiddenFromUser___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "BOOLValue"));
  else
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
