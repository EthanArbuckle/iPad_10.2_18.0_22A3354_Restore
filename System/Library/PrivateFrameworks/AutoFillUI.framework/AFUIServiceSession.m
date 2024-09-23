@implementation AFUIServiceSession

- (AFUIServiceSession)initWithSessionQueue:(id)a3 connection:(id)a4 remoteProcess:(id)a5
{
  id v9;
  id v10;
  id v11;
  AFUIServiceSession *v12;
  AFUIServiceSession *v13;
  AFUIPanel *v14;
  AFUIPanel *panel;
  void *v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)AFUIServiceSession;
  v12 = -[AFUIServiceSession init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionQueue, a3);
    objc_storeStrong((id *)&v13->_connection, a4);
    objc_storeStrong((id *)&v13->_remoteProcess, a5);
    v14 = objc_alloc_init(AFUIPanel);
    panel = v13->_panel;
    v13->_panel = v14;

    -[AFUIPanel setDelegate:](v13->_panel, "setDelegate:", v13);
    objc_msgSend(v10, "setExportedObject:", v13);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25645D828);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExportedInterface:", v16);

    objc_initWeak(&location, v13);
    v17 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __68__AFUIServiceSession_initWithSessionQueue_connection_remoteProcess___block_invoke;
    v21[3] = &unk_250856D60;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v10, "setInterruptionHandler:", v21);
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __68__AFUIServiceSession_initWithSessionQueue_connection_remoteProcess___block_invoke_2;
    v19[3] = &unk_250856D60;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v10, "setInvalidationHandler:", v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __68__AFUIServiceSession_initWithSessionQueue_connection_remoteProcess___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "hide");
    WeakRetained = v2;
  }

}

void __68__AFUIServiceSession_initWithSessionQueue_connection_remoteProcess___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "hide");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AFUIServiceSession panel](self, "panel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hide");

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)AFUIServiceSession;
  -[AFUIServiceSession dealloc](&v4, sel_dealloc);
}

- (void)displayForDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD1988];
  v11 = a3;
  objc_msgSend(v10, "currentConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIServiceSession _documentTraitsByAddingClientPropertiesFromConnection:toDocumentTraits:](self, "_documentTraitsByAddingClientPropertiesFromConnection:toDocumentTraits:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUIServiceSession sessionQueue](self, "sessionQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __83__AFUIServiceSession_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke;
  v18[3] = &unk_250856D88;
  v18[4] = self;
  v19 = v13;
  v20 = v8;
  v21 = v9;
  v15 = v9;
  v16 = v8;
  v17 = v13;
  dispatch_async(v14, v18);

}

void __83__AFUIServiceSession_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __83__AFUIServiceSession_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke_2;
  v3[3] = &unk_250856D88;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

void __83__AFUIServiceSession_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "panel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayForDocumentTraits:documentState:textOperationsHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)documentStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AFUIServiceSession sessionQueue](self, "sessionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__AFUIServiceSession_documentStateChanged___block_invoke;
  v7[3] = &unk_250856DB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __43__AFUIServiceSession_documentStateChanged___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __43__AFUIServiceSession_documentStateChanged___block_invoke_2;
  v2[3] = &unk_250856DB0;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

void __43__AFUIServiceSession_documentStateChanged___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "panel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentStateChanged:", *(_QWORD *)(a1 + 40));

}

- (void)hide
{
  NSObject *v3;
  _QWORD block[5];

  -[AFUIServiceSession sessionQueue](self, "sessionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__AFUIServiceSession_hide__block_invoke;
  block[3] = &unk_250856B30;
  block[4] = self;
  dispatch_async(v3, block);

}

void __26__AFUIServiceSession_hide__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__AFUIServiceSession_hide__block_invoke_2;
  block[3] = &unk_250856B30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __26__AFUIServiceSession_hide__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "panel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hide");

}

- (id)_documentTraitsByAddingClientPropertiesFromConnection:(id)a3 toDocumentTraits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  -[AFUIServiceSession _applicationIdentifierFromConnection:](self, "_applicationIdentifierFromConnection:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDC1540], "bundleRecordWithApplicationIdentifier:error:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "infoDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x24BDBD1D0];
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDBD1D0], 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectsForKeys:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (id)objc_msgSend(v6, "copy");
      objc_msgSend(v9, "applicationIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAppId:", v15);

      objc_msgSend(v9, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBundleId:", v16);

      objc_msgSend(v9, "localizedName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLocalizedAppName:", v17);

      objc_msgSend(v13, "objectForKey:ofClass:", v11, objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAppName:", v18);

    }
    else
    {
      v14 = v6;
    }

  }
  else
  {
    v14 = v6;
  }

  return v14;
}

- (id)_applicationIdentifierFromConnection:(id)a3
{
  id v3;
  void *v4;
  const __CFAllocator *v5;
  __SecTask *v6;
  __SecTask *v7;
  void *v8;
  audit_token_t v10;

  v3 = a3;
  v4 = v3;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (v3)
    objc_msgSend(v3, "auditToken");
  else
    memset(&v10, 0, sizeof(v10));
  v6 = SecTaskCreateWithAuditToken(v5, &v10);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)SecTaskCopyValueForEntitlement(v6, CFSTR("application-identifier"), 0);
    CFRelease(v7);
    objc_opt_class();
    v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v8;

  }
  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BSProcessHandle)remoteProcess
{
  return self->_remoteProcess;
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (AFUIPanel)panel
{
  return self->_panel;
}

- (void)setPanel:(id)a3
{
  objc_storeStrong((id *)&self->_panel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panel, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_remoteProcess, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
