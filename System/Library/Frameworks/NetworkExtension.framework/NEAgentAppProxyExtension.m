@implementation NEAgentAppProxyExtension

- (id)managerInterface
{
  if (managerInterface_onceToken_19419 != -1)
    dispatch_once(&managerInterface_onceToken_19419, &__block_literal_global_19420);
  return (id)managerInterface_managerInterface_19421;
}

- (id)driverInterface
{
  if (driverInterface_onceToken_19415 != -1)
    dispatch_once(&driverInterface_onceToken_19415, &__block_literal_global_13_19416);
  return (id)driverInterface_driverInterface_19417;
}

- (void)connectWithParameters:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  -[NEAgentExtension managerObjectFactory](self, "managerObjectFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke;
  v11[3] = &unk_1E3CC45C8;
  v11[4] = self;
  objc_msgSend(v5, "managerObjectWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke_35;
  v9[3] = &unk_1E3CC36C8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "createFlowDivertControlSocketWithCompletionHandler:", v9);

}

- (void)setDelegateInterface:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegateInterface:", v3);

}

- (void)extension:(id)a3 didRequestFlowDivertControlSocketWithCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v5 = a4;
  -[NEAgentExtension managerObjectFactory](self, "managerObjectFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93__NEAgentAppProxyExtension_extension_didRequestFlowDivertControlSocketWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E3CC45C8;
  v12[4] = self;
  objc_msgSend(v6, "managerObjectWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __93__NEAgentAppProxyExtension_extension_didRequestFlowDivertControlSocketWithCompletionHandler___block_invoke_37;
  v10[3] = &unk_1E3CC36F0;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "createFlowDivertControlSocketWithCompletionHandler:", v10);

}

void __93__NEAgentAppProxyExtension_extension_didRequestFlowDivertControlSocketWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Got an error on the XPC connection while creating a flow divert control socket: %@", (uint8_t *)&v5, 0xCu);
  }

  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 0, 0);
}

uint64_t __93__NEAgentAppProxyExtension_extension_didRequestFlowDivertControlSocketWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Got an error on the XPC connection while creating a flow divert control socket: %@", (uint8_t *)&v5, 0xCu);
  }

  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 0, 0);
}

void __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke_2;
  block[3] = &unk_1E3CC36A0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "sessionContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setInitialFlowDivertControlSocket:", *(_QWORD *)(a1 + 32));
    v3 = *(_QWORD *)(a1 + 48);
    v6.receiver = *(id *)(a1 + 40);
    v6.super_class = (Class)NEAgentAppProxyExtension;
    objc_msgSendSuper2(&v6, sel_connectWithParameters_, v3);

  }
  else
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Failed to get a flow divert control socket", v5, 2u);
    }

    -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 40), 0, 0);
  }
}

void __43__NEAgentAppProxyExtension_driverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4196C0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)driverInterface_driverInterface_19417;
  driverInterface_driverInterface_19417 = v0;

}

void __44__NEAgentAppProxyExtension_managerInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE42B530);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)managerInterface_managerInterface_19421;
  managerInterface_managerInterface_19421 = v0;

}

@end
