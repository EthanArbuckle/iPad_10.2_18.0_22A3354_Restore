@implementation AXRemoteReceiver

- (AXRemoteReceiver)initWithEventID:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  AXRemoteReceiver *v8;
  AXRemoteReceiver *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  id v14;
  void *v15;
  OS_dispatch_queue *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)AXRemoteReceiver;
  v8 = -[AXRemoteReceiver init](&v33, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AXRemoteReceiver setDelegate:](v8, "setDelegate:", v7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INTERACTIVE, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = dispatch_queue_create("com.apple.AXRemoteServices.ReceiverQueue", v11);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    objc_initWeak(&location, v9);
    v14 = objc_alloc_init(MEMORY[0x24BE7CBF0]);
    -[AXRemoteReceiver setCompanionLinkClient:](v9, "setCompanionLinkClient:", v14);

    -[AXRemoteReceiver companionLinkClient](v9, "companionLinkClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAppID:", CFSTR("com.apple.AXRemoteServices.Receiver"));

    v16 = v9->_queue;
    -[AXRemoteReceiver companionLinkClient](v9, "companionLinkClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDispatchQueue:", v16);

    v18 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke;
    v30[3] = &unk_24D99AE78;
    objc_copyWeak(&v31, &location);
    -[AXRemoteReceiver companionLinkClient](v9, "companionLinkClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDisconnectHandler:", v30);

    -[AXRemoteReceiver companionLinkClient](v9, "companionLinkClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v18;
    v28[1] = 3221225472;
    v28[2] = __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_3;
    v28[3] = &unk_24D99B1D0;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v20, "activateWithCompletion:", v28);

    -[AXRemoteReceiver companionLinkClient](v9, "companionLinkClient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_5;
    v26[3] = &unk_24D99B1F8;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v21, "registerEventID:options:handler:", v6, 0, v26);

    -[AXRemoteReceiver companionLinkClient](v9, "companionLinkClient");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_7;
    v24[3] = &unk_24D99B220;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v22, "registerRequestID:options:handler:", CFSTR("com.apple.AXRemoteServices.ConnectionSetup"), 0, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
  return v9;
}

void __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint8_t v7[16];

  ax_remote_connection_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_218A93000, v2, OS_LOG_TYPE_INFO, "link client disconnected", v7, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "remoteReceiverDidDisconnect:", v6);

}

void __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ax_remote_connection_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_218A93000, v4, OS_LOG_TYPE_INFO, "Activating companion link client with error: %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v5);
  objc_msgSend(v7, "remoteReceiver:didActivateWithError:", v8, v3);

}

void __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *v8;
  id WeakRetained;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  ax_remote_connection_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_5_cold_1();

  v8 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained(v8);
  objc_msgSend(v10, "remoteReceiver:didReceivePayload:withOptions:", v11, v5, v6);

}

void __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *v15;
  id WeakRetained;
  void *v17;
  id v18;
  void *v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  ax_remote_connection_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_7_cold_1();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isConnecting"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("connectingDeviceName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("connectingDeviceOptions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v15);
  objc_msgSend(WeakRetained, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_loadWeakRetained(v15);
  objc_msgSend(v17, "remoteReceiver:connectingDevice:setupConnection:withOptions:", v18, v13, v12, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v19, 0, 0);
}

- (AXRemoteReceiverDelegate)delegate
{
  return (AXRemoteReceiverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
  objc_storeStrong((id *)&self->_companionLinkClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_5_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_218A93000, v0, v1, "Handling inEvent: %@, inOptions: %@");
}

void __45__AXRemoteReceiver_initWithEventID_delegate___block_invoke_7_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_218A93000, v0, v1, "Handling request: %@, inOptions: %@");
}

@end
