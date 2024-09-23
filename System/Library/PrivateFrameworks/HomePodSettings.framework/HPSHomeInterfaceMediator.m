@implementation HPSHomeInterfaceMediator

- (HPSHomeInterfaceMediator)initWithInterface:(id)a3
{
  id v4;
  HPSHomeInterfaceMediator *v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HPSHomeInterfaceMediator;
  v5 = -[HPSHomeInterfaceMediator init](&v8, sel_init);
  if (v5)
  {
    _HPSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[HPSHomeInterfaceMediator initWithInterface:]";
      _os_log_impl(&dword_22DF16000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_settingsInterface, v4);
  }

  return v5;
}

- (void)accessoryDidUpdateAttribute:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HPSLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "-[HPSHomeInterfaceMediator accessoryDidUpdateAttribute:withContext:]";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_22DF16000, v8, OS_LOG_TYPE_INFO, "%s attribute %@ context %@", (uint8_t *)&v10, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsInterface);
  objc_msgSend(WeakRetained, "_accessoryDidUpdateAttribute:withContext:", v6, v7);

}

- (HPSHomeInterface)settingsInterface
{
  return (HPSHomeInterface *)objc_loadWeakRetained((id *)&self->_settingsInterface);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsInterface);
}

@end
