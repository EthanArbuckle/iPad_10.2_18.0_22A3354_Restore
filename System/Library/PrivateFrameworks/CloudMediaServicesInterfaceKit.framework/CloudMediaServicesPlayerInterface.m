@implementation CloudMediaServicesPlayerInterface

- (CloudMediaServicesPlayerInterface)init
{
  CloudMediaServicesPlayerInterface *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CloudMediaServicesInterfaceProtocol *AgoraInterfaceProxy;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CloudMediaServicesPlayerInterface;
  v2 = -[CloudMediaServicesPlayerInterface init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.agora.server"), 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2553B1880);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection remoteObjectInterface](v2->_connection, "remoteObjectInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_getCloudExtensionConfigurationFor_homeUserID_endpointID_withCompletion_, 0, 1);

    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_0);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_73);
    -[NSXPCConnection resume](v2->_connection, "resume");
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v2->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_76);
    v15 = objc_claimAutoreleasedReturnValue();
    AgoraInterfaceProxy = v2->_AgoraInterfaceProxy;
    v2->_AgoraInterfaceProxy = (CloudMediaServicesInterfaceProtocol *)v15;

  }
  return v2;
}

void __41__CloudMediaServicesPlayerInterface_init__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _CMSILogingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21DE4E000, v0, OS_LOG_TYPE_DEFAULT, "Connection to CloudMediaServices server was interrupted!", v1, 2u);
  }

}

void __41__CloudMediaServicesPlayerInterface_init__block_invoke_72()
{
  NSObject *v0;
  uint8_t v1[16];

  _CMSILogingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21DE4E000, v0, OS_LOG_TYPE_DEFAULT, "Connection to CloudMediaServices server was invalidated!", v1, 2u);
  }

}

void __41__CloudMediaServicesPlayerInterface_init__block_invoke_74(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _CMSILogingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __41__CloudMediaServicesPlayerInterface_init__block_invoke_74_cold_1((uint64_t)v2, v3);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CloudMediaServicesPlayerInterface;
  -[CloudMediaServicesPlayerInterface dealloc](&v3, sel_dealloc);
}

- (void)playSample:(id)a3
{
  -[CloudMediaServicesInterfaceProtocol playSample:](self->_AgoraInterfaceProxy, "playSample:", a3);
}

- (void)pauseSample
{
  -[CloudMediaServicesInterfaceProtocol pauseSample](self->_AgoraInterfaceProxy, "pauseSample");
}

- (void)sendPlaybackQueueToRemoteDestination:(id)a3 withCompletion:(id)a4
{
  -[CloudMediaServicesInterfaceProtocol sendPlaybackQueueToRemoteDestination:withCompletion:](self->_AgoraInterfaceProxy, "sendPlaybackQueueToRemoteDestination:withCompletion:", a3, a4);
}

- (void)setServerEnvironment:(id)a3
{
  -[CloudMediaServicesInterfaceProtocol setServerEnvironment:](self->_AgoraInterfaceProxy, "setServerEnvironment:", a3);
}

- (void)setOverrideURL:(id)a3
{
  -[CloudMediaServicesInterfaceProtocol setOverrideURL:](self->_AgoraInterfaceProxy, "setOverrideURL:", a3);
}

- (void)sendPlaybackQueueWithUserActivityDictionary:(id)a3 forIntentID:(id)a4 toDestination:(id)a5 withIntentData:(id)a6 prepareQueue:(BOOL)a7 withCompletion:(id)a8
{
  -[CloudMediaServicesInterfaceProtocol sendPlaybackQueueWithUserActivityDictionary:forIntentID:toDestination:withIntentData:prepareQueue:withCompletion:](self->_AgoraInterfaceProxy, "sendPlaybackQueueWithUserActivityDictionary:forIntentID:toDestination:withIntentData:prepareQueue:withCompletion:", a3, a4, a5, a6, a7, a8);
}

- (void)getCloudExtensionConfigurationFor:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 withCompletion:(id)a6
{
  id v10;
  NSXPCConnection *connection;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  connection = self->_connection;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __108__CloudMediaServicesPlayerInterface_getCloudExtensionConfigurationFor_homeUserID_endpointID_withCompletion___block_invoke;
  v17[3] = &unk_24E1CCD88;
  v18 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "getCloudExtensionConfigurationFor:homeUserID:endpointID:withCompletion:", v15, v14, v13, v12);

}

uint64_t __108__CloudMediaServicesPlayerInterface_getCloudExtensionConfigurationFor_homeUserID_endpointID_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)submitAnalyticsForType:(id)a3 andIdentifier:(id)a4 eventType:(id)a5 atTime:(id)a6 withMetadata:(id)a7
{
  -[CloudMediaServicesInterfaceProtocol submitAnalyticsForType:andIdentifier:eventType:atTime:withMetadata:](self->_AgoraInterfaceProxy, "submitAnalyticsForType:andIdentifier:eventType:atTime:withMetadata:", a3, a4, a5, a6, a7);
}

- (void)stopAnalyticsWithIdentifier:(id)a3
{
  -[CloudMediaServicesInterfaceProtocol stopAnalyticsWithIdentifier:](self->_AgoraInterfaceProxy, "stopAnalyticsWithIdentifier:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AgoraInterfaceProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __41__CloudMediaServicesPlayerInterface_init__block_invoke_74_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21DE4E000, a2, OS_LOG_TYPE_ERROR, "Error associating NSXPCConnection to remoteobject proxy %@", (uint8_t *)&v2, 0xCu);
}

@end
