@implementation NPKAddPaymentPassController

+ (BOOL)canAddPaymentPass
{
  return PKSecureElementIsAvailable() != 0;
}

- (NPKAddPaymentPassController)initWithRequestConfiguration:(id)a3 delegate:(id)a4
{
  id v7;
  NPKAddPaymentPassController *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PKXPCService *remoteService;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NPKAddPaymentPassController;
  v8 = -[PKAddPaymentPassController initWithRequestConfiguration:delegate:](&v15, sel_initWithRequestConfiguration_delegate_, v7, a4);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BE6EF78]);
    NPKAddPaymentPassControllerServerExportedInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NPKAddPaymentPassControllerClientExportedInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.NanoPassKit.AddPaymentPass"), v10, v11, v8);
    remoteService = v8->_remoteService;
    v8->_remoteService = (PKXPCService *)v12;

    objc_storeStrong((id *)&v8->_configuration, a3);
    -[PKXPCService setDelegate:](v8->_remoteService, "setDelegate:", v8);
  }

  return v8;
}

- (void)presentWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  PKAddPaymentPassRequestConfiguration *configuration;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke;
  v12[3] = &unk_24CFE7B80;
  v6 = v4;
  v13 = v6;
  -[NPKAddPaymentPassController _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  configuration = self->_configuration;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke_32;
  v10[3] = &unk_24CFE7E90;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "setConfiguration:completionHandler:", configuration, v10);

}

void __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for set configuration invoked: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);

}

void __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke_32(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke_2;
  v7[3] = &unk_24CFE7B80;
  v3 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_remoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke_33;
  v5[3] = &unk_24CFE9328;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "presentWithCompletion:", v5);

}

void __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for present add payment pass invoked: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);

}

uint64_t __53__NPKAddPaymentPassController_presentWithCompletion___block_invoke_33(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dismissWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__NPKAddPaymentPassController_dismissWithCompletion___block_invoke;
  v11[3] = &unk_24CFE7B80;
  v6 = v4;
  v12 = v6;
  -[NPKAddPaymentPassController _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __53__NPKAddPaymentPassController_dismissWithCompletion___block_invoke_36;
  v9[3] = &unk_24CFE7B00;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "dismissWithCompletion:", v9);

}

void __53__NPKAddPaymentPassController_dismissWithCompletion___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_ERROR, "Error: Remote object proxy error handler for dismiss add payment pass invoked: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

uint64_t __53__NPKAddPaymentPassController_dismissWithCompletion___block_invoke_36(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  PKDisplayableErrorForCommonType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKAddPaymentPassController _sendDidFinishWithPass:error:](self, "_sendDidFinishWithPass:error:", 0, v5);

  objc_msgSend(v6, "invalidate");
}

- (void)generateRequestWithCertificateChain:(id)a3 nonce:(id)a4 nonceSignature:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  pk_Payment_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Forwarding generate request to delegate", buf, 2u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __106__NPKAddPaymentPassController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke;
  block[3] = &unk_24CFE9350;
  block[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __106__NPKAddPaymentPassController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPaymentPassController:generateRequestWithCertificateChain:nonce:nonceSignature:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)didFinishWithPass:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Forwarding did finish to delegate", v11, 2u);
    }

  }
  -[NPKAddPaymentPassController _sendDidFinishWithPass:error:](self, "_sendDidFinishWithPass:error:", v6, v7);

}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return (id)-[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", a3);
}

- (void)_sendDidFinishWithPass:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__NPKAddPaymentPassController__sendDidFinishWithPass_error___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__NPKAddPaymentPassController__sendDidFinishWithPass_error___block_invoke(_QWORD *a1)
{
  _BYTE *v2;
  id v3;

  v2 = (_BYTE *)a1[4];
  if (!v2[24])
  {
    objc_msgSend(v2, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addPaymentPassController:didFinishAddingPaymentPass:error:", a1[4], a1[5], a1[6]);

  }
}

- (PKAddPaymentPassRequestConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (PKXPCService)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
  objc_storeStrong((id *)&self->_remoteService, a3);
}

- (BOOL)didFinishCallbackSent
{
  return self->_didFinishCallbackSent;
}

- (void)setDidFinishCallbackSent:(BOOL)a3
{
  self->_didFinishCallbackSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
