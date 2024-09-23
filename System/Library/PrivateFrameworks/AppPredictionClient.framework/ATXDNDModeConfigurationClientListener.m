@implementation ATXDNDModeConfigurationClientListener

- (ATXDNDModeConfigurationClientListener)initWithDelegate:(id)a3
{
  id v4;
  ATXDNDModeConfigurationClientListener *v5;
  ATXDNDModeConfigurationClientListener *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXDNDModeConfigurationClientListener;
  v5 = -[ATXDNDModeConfigurationClientListener init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ATXDNDModeConfigurationClientListener setDelegate:](v5, "setDelegate:", v4);

  return v6;
}

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXDNDModeConfigurationClientListener: mode configuration did change", v7, 2u);
  }

  -[ATXDNDModeConfigurationClientListener delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuredModesDidChange");

}

- (ATXDNDModeConfigurationClientListenerDelegate)delegate
{
  return (ATXDNDModeConfigurationClientListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
