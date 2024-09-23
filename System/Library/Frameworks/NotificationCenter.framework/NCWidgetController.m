@implementation NCWidgetController

+ (NCWidgetController)widgetController
{
  return (NCWidgetController *)objc_alloc_init((Class)a1);
}

- (void)setHasContent:(BOOL)flag forWidgetWithBundleIdentifier:(NSString *)bundleID
{
  _BOOL8 v4;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  _QWORD v10[4];
  NSString *v11;
  id v12;
  id location;

  v4 = flag;
  v6 = bundleID;
  objc_initWeak(&location, self);
  -[NCWidgetController _connectionForRequest](self, "_connectionForRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__NCWidgetController_setHasContent_forWidgetWithBundleIdentifier___block_invoke;
  v10[3] = &unk_24DB74100;
  v8 = v6;
  v11 = v8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__setHasContent:forWidgetWithBundleIdentifier:", v4, v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __43__NCWidgetController__connectionForRequest__block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__NCWidgetController__connectionForRequest__block_invoke_4;
  block[3] = &unk_24DB73F40;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

- (void)__didReceiveHasContentRequest
{
  void *v2;
  id v3;
  _QWORD block[4];
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__NCWidgetController___didReceiveHasContentRequest__block_invoke;
  block[3] = &unk_24DB74128;
  objc_copyWeak(&v6, &location);
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)_connectionForRequest
{
  void *v3;
  int v4;
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  void *v11;
  NSXPCConnection *v12;
  uint64_t v13;
  NSXPCConnection *v14;
  NSXPCConnection *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  +[_NCWidgetControllerRequestLimiter sharedInstance](_NCWidgetControllerRequestLimiter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRequestPermitted");

  if (v4)
  {
    connection = self->_connection;
    if (!connection)
    {
      -[NCWidgetController _setStrongReference:](self, "_setStrongReference:", self);
      v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.notificationcenter.widgetcontrollerconnection"), 0);
      v7 = self->_connection;
      self->_connection = v6;

      v8 = self->_connection;
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550B7780);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

      v10 = self->_connection;
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550BB118);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v10, "setRemoteObjectInterface:", v11);

      -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
      objc_initWeak(&location, self);
      v12 = self->_connection;
      v13 = MEMORY[0x24BDAC760];
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __43__NCWidgetController__connectionForRequest__block_invoke;
      v19[3] = &unk_24DB73F40;
      objc_copyWeak(&v20, &location);
      -[NSXPCConnection setInterruptionHandler:](v12, "setInterruptionHandler:", v19);
      v14 = self->_connection;
      v17[0] = v13;
      v17[1] = 3221225472;
      v17[2] = __43__NCWidgetController__connectionForRequest__block_invoke_3;
      v17[3] = &unk_24DB73F40;
      objc_copyWeak(&v18, &location);
      -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", v17);
      -[NSXPCConnection resume](self->_connection, "resume");
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      connection = self->_connection;
    }
    v15 = connection;
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

void __43__NCWidgetController__connectionForRequest__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");
  objc_msgSend(WeakRetained, "_setStrongReference:", 0);

}

- (void)_setStrongReference:(id)a3
{
  objc_storeStrong((id *)&self->_strongReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_strongReference, 0);
}

void __51__NCWidgetController___didReceiveHasContentRequest__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v5 = WeakRetained;
  objc_msgSend(WeakRetained, "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isEqual:", v4);

  if ((_DWORD)v3)
    objc_msgSend(v5, "_invalidateConnection");

}

- (void)dealloc
{
  objc_super v3;

  -[NCWidgetController _invalidateConnection](self, "_invalidateConnection");
  v3.receiver = self;
  v3.super_class = (Class)NCWidgetController;
  -[NCWidgetController dealloc](&v3, sel_dealloc);
}

- (void)_invalidateConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection invalidate](connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

  }
}

- (NSXPCConnection)_connection
{
  return self->_connection;
}

+ (id)widgetContentUnavailableViewWithTitle:(id)a3
{
  id v3;
  _NCContentUnavailableView *v4;
  _NCContentUnavailableView *v5;

  v3 = a3;
  v4 = [_NCContentUnavailableView alloc];
  v5 = -[_UIContentUnavailableView initWithFrame:title:style:includeBackdrop:](v4, "initWithFrame:title:style:includeBackdrop:", v3, 0, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  return v5;
}

+ (id)widgetContentUnavailableViewWithButtonTitle:(id)a3 buttonAction:(id)a4
{
  id v5;
  id v6;
  _NCContentUnavailableViewWithButton *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_NCContentUnavailableViewWithButton initWithTitle:buttonAction:]([_NCContentUnavailableViewWithButton alloc], "initWithTitle:buttonAction:", v6, v5);

  return v7;
}

void __43__NCWidgetController__connectionForRequest__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__NCWidgetController__connectionForRequest__block_invoke_2;
  block[3] = &unk_24DB73F40;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void __43__NCWidgetController__connectionForRequest__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");
  objc_msgSend(WeakRetained, "_setStrongReference:", 0);

}

void __66__NCWidgetController_setHasContent_forWidgetWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__NCWidgetController_setHasContent_forWidgetWithBundleIdentifier___block_invoke_2;
    block[3] = &unk_24DB740D8;
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v7);

  }
}

void __66__NCWidgetController_setHasContent_forWidgetWithBundleIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  NSLog(CFSTR("Encountered error attempting to set content availability for widget with bundle ID \"%@\": %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

- (void)requestRefreshAfterDate:(id)a3 forWidgetWithBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[NCWidgetController _connectionForRequest](self, "_connectionForRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__NCWidgetController_requestRefreshAfterDate_forWidgetWithBundleIdentifier___block_invoke;
  v11[3] = &unk_24DB74100;
  v9 = v7;
  v12 = v9;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__requestRefreshAfterDate:forWidgetWithBundleIdentifier:", v6, v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __76__NCWidgetController_requestRefreshAfterDate_forWidgetWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__NCWidgetController_requestRefreshAfterDate_forWidgetWithBundleIdentifier___block_invoke_2;
    block[3] = &unk_24DB740D8;
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v7);

  }
}

void __76__NCWidgetController_requestRefreshAfterDate_forWidgetWithBundleIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  NSLog(CFSTR("Encountered error attempting to request refresh for widget with bundle ID \"%@\": %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

- (NCWidgetController)_strongReference
{
  return self->_strongReference;
}

- (void)_setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

@end
