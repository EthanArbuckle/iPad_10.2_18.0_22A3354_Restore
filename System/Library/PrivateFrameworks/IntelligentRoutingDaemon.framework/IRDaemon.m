@implementation IRDaemon

- (IRDaemon)init
{
  IRDaemon *v2;
  IRDaemon *v3;
  IRDaemon *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IRDaemon;
  v2 = -[IRDaemon init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)run
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23FFBA000, v3, OS_LOG_TYPE_DEFAULT, "[IRDaemon] run", v4, 2u);
  }
  -[IRDaemon _startServices](self, "_startServices");
}

- (void)_startServices
{
  NSObject *v3;
  IRXPCServicesManager *v4;
  IRXPCServicesManager *xpcManager;
  uint8_t v6[16];

  v3 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_23FFBA000, v3, OS_LOG_TYPE_DEFAULT, "[IRDaemon] startServices", v6, 2u);
  }
  v4 = objc_alloc_init(IRXPCServicesManager);
  xpcManager = self->_xpcManager;
  self->_xpcManager = v4;

  -[IRXPCServicesManager startServices](self->_xpcManager, "startServices");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcManager, 0);
}

@end
