@implementation NPKRemoteInterfacePresenter

- (NPKRemoteInterfacePresenter)init
{
  NPKRemoteInterfacePresenter *v2;
  NSXPCConnection *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  NSXPCConnection *xpcConnection;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NPKRemoteInterfacePresenter;
  v2 = -[NPKRemoteInterfacePresenter init](&v15, sel_init);
  if (v2)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.NPKInAppPaymentServer"), 4096);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D61038);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v3, "setRemoteObjectInterface:", v4);
    objc_initWeak(&location, v2);
    v5 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __35__NPKRemoteInterfacePresenter_init__block_invoke;
    v12[3] = &unk_24CFE7970;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInterruptionHandler:](v3, "setInterruptionHandler:", v12);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __35__NPKRemoteInterfacePresenter_init__block_invoke_78;
    v10[3] = &unk_24CFE7970;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInvalidationHandler:](v3, "setInvalidationHandler:", v10);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("NPKRemoteInterfacePresenterQueue", v6);
    -[NSXPCConnection _setQueue:](v3, "_setQueue:", v7);
    -[NSXPCConnection resume](v3, "resume");
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = v3;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __35__NPKRemoteInterfacePresenter_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  id *WeakRetained;
  id *v6;
  id v7;
  __int16 v8[8];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Remote interface presenter connection interrupted", (uint8_t *)v8, 2u);
    }

  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v7, "remoteInterfacePresenterConnectionInterrupted:", v6);

  }
}

void __35__NPKRemoteInterfacePresenter_init__block_invoke_78(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Remote interface presenter connection invalidated", buf, 2u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__NPKRemoteInterfacePresenter_init__block_invoke_79;
  block[3] = &unk_24CFE7970;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v6);
}

void __35__NPKRemoteInterfacePresenter_init__block_invoke_79(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setXpcConnection:", 0);

}

- (void)presentInAppPaymentInterfaceWithPaymentRequest:(id)a3 forHostApplicationName:(id)a4 hostBundleIdentifier:(id)a5 hostProcessIdentifier:(int)a6 hostIdentifier:(id)a7 orientation:(id)a8 completion:(id)a9
{
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSXPCConnection *xpcConnection;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v11 = *(_QWORD *)&a6;
  v36 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a4;
  pk_General_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    pk_General_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v16;
      v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Request to present in-app payment interface for host application: %@ payment request: %@", buf, 0x16u);
    }

  }
  xpcConnection = self->_xpcConnection;
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __182__NPKRemoteInterfacePresenter_presentInAppPaymentInterfaceWithPaymentRequest_forHostApplicationName_hostBundleIdentifier_hostProcessIdentifier_hostIdentifier_orientation_completion___block_invoke;
  v30 = &unk_24CFE7B80;
  v31 = v17;
  v25 = v17;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "showInAppInterfaceWithPaymentRequest:forHostApplicationName:hostBundleIdentifier:hostProcessIdentifier:hostIdentifier:orientation:activationHandler:", v15, v20, v16, v11, v19, v18, v25, v27, v28, v29, v30);

}

void __182__NPKRemoteInterfacePresenter_presentInAppPaymentInterfaceWithPaymentRequest_forHostApplicationName_hostBundleIdentifier_hostProcessIdentifier_hostIdentifier_orientation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present in-app payment interface invoked: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v3);

}

- (void)presentContinuityPaymentInterfaceWithRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSXPCConnection *xpcConnection;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Request to present continuity payment interface for remote payment request: %@", buf, 0xCu);
    }

  }
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __100__NPKRemoteInterfacePresenter_presentContinuityPaymentInterfaceWithRemotePaymentRequest_completion___block_invoke;
  v14[3] = &unk_24CFE7B80;
  v15 = v7;
  v12 = v7;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "showInAppInterfaceWithRemotePaymentRequest:activationHandler:", v6, v12);

}

void __100__NPKRemoteInterfacePresenter_presentContinuityPaymentInterfaceWithRemotePaymentRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present continuity payment interface invoked: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);

}

- (void)showInAppInterfaceWithSkeletonPeerPaymentQuote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSXPCConnection *xpcConnection;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Request to present in-app interface for skeleton peer payment quote: %@", buf, 0xCu);
    }

  }
  xpcConnection = self->_xpcConnection;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __89__NPKRemoteInterfacePresenter_showInAppInterfaceWithSkeletonPeerPaymentQuote_completion___block_invoke;
  v14[3] = &unk_24CFE7B80;
  v15 = v7;
  v12 = v7;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "showInAppInterfaceWithSkeletonPeerPaymentQuote:activationHandler:", v6, v12);

}

void __89__NPKRemoteInterfacePresenter_showInAppInterfaceWithSkeletonPeerPaymentQuote_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present in-app interface for skeleton peer payment quote invoked: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);

}

- (void)clearInAppInterfaceForSkeletonPeerPaymentQuote:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Request to clear skeleton peer payment quote: %@ error: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clearInAppInterfaceForSkeletonPeerPaymentQuote:withError:", v6, v7);

}

void __88__NPKRemoteInterfacePresenter_clearInAppInterfaceForSkeletonPeerPaymentQuote_withError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for clear peer payment quote invoked: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)presentSetupApplePayAlert:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("AppName"));
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Request to present set up Apple Pay alert for %@", (uint8_t *)&v10, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("com.apple.NanoPassKit.PresentApplePaySetupAlert"), 0, v5);

}

- (void)presentPasscodeUpgradeRequestWithChangeType:(unint64_t)a3 completion:(id)a4
{
  NSXPCConnection *xpcConnection;
  id v6;
  id v7;

  xpcConnection = self->_xpcConnection;
  v6 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_84);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentPasscodeUpgradeRequestWithChangeType:completion:", a3, v6);

}

void __86__NPKRemoteInterfacePresenter_presentPasscodeUpgradeRequestWithChangeType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present passcode upgrade request invoked: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)tearDownPasscodeUpgradeRequestWithPasscodeChanged:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  NSXPCConnection *xpcConnection;
  id v6;
  id v7;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v6 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_85);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tearDownPasscodeUpgradeRequestWithPasscodeChanged:error:", v4, v6);

}

void __87__NPKRemoteInterfacePresenter_tearDownPasscodeUpgradeRequestWithPasscodeChanged_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for tear down passcode upgrade request invoked: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)presentContactlessInterfaceForPassWithUniqueIdentifier:(id)a3 fromSource:(int64_t)a4 completion:(id)a5
{
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  id v10;

  xpcConnection = self->_xpcConnection;
  v8 = a5;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_86);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentContactlessInterfaceForPassWithUniqueIdentifier:fromSource:completion:", v9, a4, v8);

}

void __108__NPKRemoteInterfacePresenter_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present contactless interface upgrade request invoked: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)presentProvisioningContinuityInterfaceForPassWithUniqueIdentifier:(id)a3 continuityType:(id)a4 transferToken:(id)a5 completion:(id)a6
{
  NSXPCConnection *xpcConnection;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  xpcConnection = self->_xpcConnection;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_87);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentProvisioningContinuityInterfaceForPassWithUniqueIdentifier:continuityType:transferToken:completion:", v13, v12, v11, v10);

}

void __137__NPKRemoteInterfacePresenter_presentProvisioningContinuityInterfaceForPassWithUniqueIdentifier_continuityType_transferToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present provisioning continuity car key interface invoked: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)presentTransitTopUpValueSelectionForPassWithUniqueIdentifier:(id)a3 balanceField:(id)a4 completion:(id)a5
{
  NSXPCConnection *xpcConnection;
  id v8;
  id v9;
  id v10;
  id v11;

  xpcConnection = self->_xpcConnection;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_88);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentTransitTopUpValueSelectionForPassWithUniqueIdentifier:balanceField:completion:", v10, v9, v8);

}

void __116__NPKRemoteInterfacePresenter_presentTransitTopUpValueSelectionForPassWithUniqueIdentifier_balanceField_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present top up value selection interface invoked: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (NPKRemoteInterfacePresenterDelegate)delegate
{
  return (NPKRemoteInterfacePresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
