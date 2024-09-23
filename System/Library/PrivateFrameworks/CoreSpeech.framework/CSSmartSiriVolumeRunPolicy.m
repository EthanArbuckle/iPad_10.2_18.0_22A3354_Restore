@implementation CSSmartSiriVolumeRunPolicy

- (CSSmartSiriVolumeRunPolicy)init
{
  CSSmartSiriVolumeRunPolicy *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSSmartSiriVolumeRunPolicy;
  v2 = -[CSPolicy init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSSmartSiriVolumeRunPolicy queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    -[CSSmartSiriVolumeRunPolicy _addSmartSiriVolumeEnabledConditions](v2, "_addSmartSiriVolumeEnabledConditions");
    -[CSSmartSiriVolumeRunPolicy _subscribeEventMonitors](v2, "_subscribeEventMonitors");
  }
  return v2;
}

- (void)_subscribeEventMonitors
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

}

- (void)_addSmartSiriVolumeEnabledConditions
{
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_26100);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __66__CSSmartSiriVolumeRunPolicy__addSmartSiriVolumeEnabledConditions__block_invoke()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEnabled");

  if ((v1 & 1) == 0)
  {
    v2 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSSmartSiriVolumeRunPolicy _addSmartSiriVolumeEnabledConditions]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume cannot be resumed because Siri is not enabled", (uint8_t *)&v4, 0xCu);
    }
  }
  return v1;
}

@end
