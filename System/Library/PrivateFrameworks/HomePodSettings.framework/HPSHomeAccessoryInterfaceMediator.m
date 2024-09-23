@implementation HPSHomeAccessoryInterfaceMediator

- (HPSHomeAccessoryInterfaceMediator)initWithInterface:(id)a3
{
  id v4;
  HPSHomeAccessoryInterfaceMediator *v5;
  HPSHomeAccessoryInterfaceMediator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HPSHomeAccessoryInterfaceMediator;
  v5 = -[HPSHomeAccessoryInterfaceMediator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_settingsInterface, v4);

  return v6;
}

- (void)homekitaccessoryDidUpdateValueForEndpointIdentifier:(id)a3 keyPath:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsInterface);
  if (WeakRetained)
  {
    _HPSLoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 136315906;
      v14 = "-[HPSHomeAccessoryInterfaceMediator homekitaccessoryDidUpdateValueForEndpointIdentifier:keyPath:value:]";
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_22DF16000, v12, OS_LOG_TYPE_INFO, "%s endpointID %@ keyPath %@ settingValue %@", (uint8_t *)&v13, 0x2Au);
    }

    objc_msgSend(WeakRetained, "accessoryDidUpdateValueForEndpointIdentifier:keyPath:value:", v8, v9, v10);
  }

}

- (HPSHomeAccessorySettingsInterface)settingsInterface
{
  return (HPSHomeAccessorySettingsInterface *)objc_loadWeakRetained((id *)&self->_settingsInterface);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsInterface);
}

@end
