@implementation SIMStatusIndicator

- (SIMStatusIndicator)init
{
  SIMStatusIndicator *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SIMStatusIndicator;
  v2 = -[SIMStatusIndicator init](&v7, sel_init);
  if (v2)
  {
    EAPLogGetLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_206440000, v3, v4, "SIMStatusIndicator initialized.", v6, 2u);
    }

  }
  return v2;
}

- (void)createConnection
{
  dispatch_queue_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = dispatch_queue_create("SIM status indicator queue", 0);
  -[SIMStatusIndicator setQueue:](self, "setQueue:", v3);

  v4 = objc_alloc(MEMORY[0x24BDC2810]);
  -[SIMStatusIndicator queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithQueue:", v5);
  -[SIMStatusIndicator setCoreTelephonyClient:](self, "setCoreTelephonyClient:", v6);

  -[SIMStatusIndicator coreTelephonyClient](self, "coreTelephonyClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    objc_msgSend(v11, "userDataPreferred");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v11, "userDataPreferred");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      if (v10)
      {
        if ((objc_msgSend(v6, "isEqualToString:", simStatusDidChange_status__lastStatus) & 1) == 0)
        {
          objc_storeStrong((id *)&simStatusDidChange_status__lastStatus, a4);
          ((void (*)(SIMStatusIndicator *, id, void *))-[SIMStatusIndicator callback](self, "callback"))(self, v6, -[SIMStatusIndicator applicationContext](self, "applicationContext"));
        }
      }
    }
  }

}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (void)applicationContext
{
  return self->_applicationContext;
}

- (void)setApplicationContext:(void *)a3
{
  self->_applicationContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end
