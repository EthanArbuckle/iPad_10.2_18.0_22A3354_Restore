@implementation BLTSettingsGateway

- (BLTSettingsGateway)initWithQueue:(id)a3
{
  id v4;
  BLTSettingsGateway *v5;
  NSLock *v6;
  NSLock *actualSettingsGatewayLock;
  uint64_t v8;
  BBSettingsGateway *actualSettingsGateway;
  _QWORD v11[4];
  NSObject *v12;
  _QWORD *v13;
  id v14;
  id location;
  _QWORD v16[3];
  char v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BLTSettingsGateway;
  v5 = -[BLTSettingsGateway init](&v18, sel_init);
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    actualSettingsGatewayLock = v5->_actualSettingsGatewayLock;
    v5->_actualSettingsGatewayLock = v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE0FE98]), "initWithQueue:", v4);
    actualSettingsGateway = v5->_actualSettingsGateway;
    v5->_actualSettingsGateway = (BBSettingsGateway *)v8;

    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v17 = 0;
    v17 = BBServerListeningForConnections();
    objc_initWeak(&location, v5);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __36__BLTSettingsGateway_initWithQueue___block_invoke;
    v11[3] = &unk_24D762688;
    v13 = v16;
    objc_copyWeak(&v14, &location);
    v12 = v4;
    notify_register_dispatch("com.apple.bulletinboard.listeningForConnections", &v5->_token, v12, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    _Block_object_dispose(v16, 8);
  }

  return v5;
}

void __36__BLTSettingsGateway_initWithQueue___block_invoke(uint64_t a1, int token)
{
  uint64_t v2;
  id *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint8_t v9[8];
  uint64_t state64;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    state64 = 0;
    notify_get_state(token, &state64);
    if (state64 == 1)
    {
      WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
      if (WeakRetained)
      {
        blt_general_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_INFO, "Re-creating settings gateway", v9, 2u);
        }

        objc_msgSend(WeakRetained[2], "lock");
        objc_msgSend(WeakRetained[1], "invalidate");
        v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE0FE98]), "initWithQueue:", *(_QWORD *)(a1 + 32));
        v7 = WeakRetained[1];
        WeakRetained[1] = (id)v6;

        objc_msgSend(WeakRetained[2], "unlock");
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "postNotificationName:object:", CFSTR("BLTSettingsGatewayReconnected"), WeakRetained);

      }
    }
  }
  else
  {
    *(_BYTE *)(v2 + 24) = 1;
  }
}

+ (id)surrogateWithQueue:(id)a3
{
  id v3;
  BLTSettingsGateway *v4;

  v3 = a3;
  v4 = -[BLTSettingsGateway initWithQueue:]([BLTSettingsGateway alloc], "initWithQueue:", v3);

  return v4;
}

- (void)dealloc
{
  BBSettingsGateway *actualSettingsGateway;
  objc_super v4;

  notify_cancel(self->_token);
  -[BBSettingsGateway invalidate](self->_actualSettingsGateway, "invalidate");
  actualSettingsGateway = self->_actualSettingsGateway;
  self->_actualSettingsGateway = 0;

  v4.receiver = self;
  v4.super_class = (Class)BLTSettingsGateway;
  -[BLTSettingsGateway dealloc](&v4, sel_dealloc);
}

- (void)forwardInvocation:(id)a3
{
  NSLock *actualSettingsGatewayLock;
  id v5;
  NSLock *v6;
  BBSettingsGateway *v7;
  objc_super v8;

  actualSettingsGatewayLock = self->_actualSettingsGatewayLock;
  v5 = a3;
  -[NSLock lock](actualSettingsGatewayLock, "lock");
  v6 = self->_actualSettingsGatewayLock;
  v7 = self->_actualSettingsGateway;
  -[NSLock unlock](v6, "unlock");
  objc_msgSend(v5, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "invokeWithTarget:", v7);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BLTSettingsGateway;
    -[BLTSettingsGateway forwardInvocation:](&v8, sel_forwardInvocation_, v5);
  }

}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  BBSettingsGateway *actualSettingsGateway;
  NSLock *actualSettingsGatewayLock;
  BBSettingsGateway *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BLTSettingsGateway;
  if (-[BLTSettingsGateway respondsToSelector:](&v9, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[NSLock lock](self->_actualSettingsGatewayLock, "lock");
    actualSettingsGateway = self->_actualSettingsGateway;
    actualSettingsGatewayLock = self->_actualSettingsGatewayLock;
    v7 = actualSettingsGateway;
    -[NSLock unlock](actualSettingsGatewayLock, "unlock");
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (BOOL)isKindOfClass:(Class)a3
{
  BBSettingsGateway *actualSettingsGateway;
  NSLock *actualSettingsGatewayLock;
  BBSettingsGateway *v6;
  char isKindOfClass;

  if ((Class)objc_opt_class() == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[NSLock lock](self->_actualSettingsGatewayLock, "lock");
    actualSettingsGateway = self->_actualSettingsGateway;
    actualSettingsGatewayLock = self->_actualSettingsGatewayLock;
    v6 = actualSettingsGateway;
    -[NSLock unlock](actualSettingsGatewayLock, "unlock");
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___BLTSettingsGateway;
  if ((objc_msgSendSuper2(&v5, sel_instancesRespondToSelector_) & 1) != 0)
    return 1;
  else
    return objc_msgSend(MEMORY[0x24BE0FE98], "instancesRespondToSelector:", a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  BBSettingsGateway *actualSettingsGateway;
  NSLock *actualSettingsGatewayLock;
  BBSettingsGateway *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BLTSettingsGateway;
  -[BLTSettingsGateway methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSLock lock](self->_actualSettingsGatewayLock, "lock");
    actualSettingsGateway = self->_actualSettingsGateway;
    actualSettingsGatewayLock = self->_actualSettingsGatewayLock;
    v8 = actualSettingsGateway;
    -[NSLock unlock](actualSettingsGatewayLock, "unlock");
    -[BBSettingsGateway methodSignatureForSelector:](v8, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualSettingsGatewayLock, 0);
  objc_storeStrong((id *)&self->_actualSettingsGateway, 0);
}

@end
