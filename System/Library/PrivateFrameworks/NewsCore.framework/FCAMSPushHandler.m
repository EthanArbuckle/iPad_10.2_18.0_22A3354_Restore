@implementation FCAMSPushHandler

- (FCAMSPushHandler)init
{
  FCAMSPushHandler *v2;
  uint64_t v3;
  NFLazy *lazyHandler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCAMSPushHandler;
  v2 = -[FCAMSPushHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60AD0]), "initWithConstructor:", &__block_literal_global_93);
    lazyHandler = v2->_lazyHandler;
    v2->_lazyHandler = (NFLazy *)v3;

  }
  return v2;
}

id __24__FCAMSPushHandler_init__block_invoke()
{
  id v0;
  id v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CFDC08]);
  objc_msgSend(v0, "setUserNotificationExtensionId:", CFSTR("extension-marketing"));
  v1 = objc_alloc(MEMORY[0x1E0CFDC10]);
  +[FCAMSBag bag](FCAMSBag, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithConfiguration:bag:", v0, v2);

  return v3;
}

- (BOOL)shouldHandleNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[FCAMSPushHandler lazyHandler](self, "lazyHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldHandleNotification:", v4);

  return v7;
}

- (void)handleNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCAMSPushHandler lazyHandler](self, "lazyHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleNotification:", v4);

}

- (BOOL)shouldHandleNotificationResponse:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0CFDCB0], "shouldHandleNotificationResponse:", a3);
}

- (void)handleNotificationResponse:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  v3 = (void *)MEMORY[0x1E0CFDCB0];
  +[FCAMSBag bag](FCAMSBag, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "handleNotificationResponse:bag:", v6, v4);

}

- (NFLazy)lazyHandler
{
  return self->_lazyHandler;
}

- (void)setLazyHandler:(id)a3
{
  objc_storeStrong((id *)&self->_lazyHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyHandler, 0);
}

@end
