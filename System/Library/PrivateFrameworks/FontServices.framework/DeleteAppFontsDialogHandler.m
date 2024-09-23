@implementation DeleteAppFontsDialogHandler

- (DeleteAppFontsDialogHandler)initWithCompletionHandler:(id)a3
{
  id v4;
  DeleteAppFontsDialogHandler *v5;
  uint64_t v6;
  id completionHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DeleteAppFontsDialogHandler;
  v5 = -[DeleteAppFontsDialogHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1B5E0997C](v4);
    completionHandler = v5->_completionHandler;
    v5->_completionHandler = (id)v6;

  }
  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_1EEEB8C08);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

- (void)doneWithDeleteAppFonts:(BOOL)a3
{
  void (**completionHandler)(id, BOOL);
  NSXPCListener *listener;

  completionHandler = (void (**)(id, BOOL))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, a3);
  -[NSXPCListener invalidate](self->_listener, "invalidate", a3);
  listener = self->_listener;
  self->_listener = 0;

}

- (void)showDialogWithUserInfo:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0DAAF80];
  v5 = a3;
  v12 = (id)objc_msgSend([v4 alloc], "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.FontInstallViewService"), CFSTR("DeleteAppFontsMainController"));
  v6 = objc_alloc_init(MEMORY[0x1E0DAAF68]);
  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_endpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setXpcEndpoint:", v9);

  v10 = (void *)objc_msgSend(MEMORY[0x1E0DAAF90], "newHandleWithDefinition:configurationContext:", v12, v6);
  v11 = objc_alloc_init(MEMORY[0x1E0DAAF60]);
  objc_msgSend(v11, "setUserInfo:", v5);

  -[DeleteAppFontsDialogHandler setListener:](self, "setListener:", v7);
  objc_msgSend(v7, "resume");
  objc_msgSend(v10, "activateWithContext:", v11);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
