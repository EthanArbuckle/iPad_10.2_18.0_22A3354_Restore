@implementation CISIntegrationServerModule

- (CISIntegrationServerModule)init
{
  CISIntegrationServerModule *v2;
  NSObject *v3;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CISIntegrationServerModule;
  v2 = -[CISIntegrationServerModule init](&v6, sel_init);
  v3 = os_log_create("com.apple.calendar.integrations", "Server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2376B5000, v3, OS_LOG_TYPE_INFO, "Integration server module created", v5, 2u);
  }

  return v2;
}

- (void)activate
{
  NSObject *v3;
  _TtC26CalendarIntegrationSupport17IntegrationServer *v4;
  _TtC26CalendarIntegrationSupport17IntegrationServer *server;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = os_log_create("com.apple.calendar.integrations", "Server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2376B5000, v3, OS_LOG_TYPE_INFO, "Integration server module activated", v8, 2u);
  }

  v4 = objc_alloc_init(_TtC26CalendarIntegrationSupport17IntegrationServer);
  server = self->server;
  self->server = v4;

  -[IntegrationServer startServer](self->server, "startServer");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_regularSyncRequested, *MEMORY[0x24BE13E50], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_catchupSyncRequested, *MEMORY[0x24BE128C0], 0);

}

- (void)receivedNotificationNamed:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.reminderkit.storeChanged")))
    -[IntegrationServer requestRegularSync](self->server, "requestRegularSync");
}

- (void)catchupSyncRequested
{
  -[IntegrationServer requestCatchupSync](self->server, "requestCatchupSync");
}

- (void)regularSyncRequested
{
  -[IntegrationServer requestRegularSync](self->server, "requestRegularSync");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->server, 0);
}

@end
