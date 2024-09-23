@implementation MediaServiceConfigurationMediator

- (MediaServiceConfigurationMediator)initWithServiceDelegate:(id)a3
{
  id v4;
  MediaServiceConfigurationMediator *v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MediaServiceConfigurationMediator;
  v5 = -[MediaServiceConfigurationMediator init](&v8, sel_init);
  if (v5)
  {
    _MSLogingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[MediaServiceConfigurationMediator initWithServiceDelegate:]";
      _os_log_impl(&dword_219CD8000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)serviceSettingDidUpdate:(id)a3 homeUserID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MediaServiceConfigurationMediator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MediaServiceConfigurationMediator delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceSettingDidUpdate:homeUserID:", v9, v6);

  }
}

- (void)userDidRemoveService:(id)a3 homeUserID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MediaServiceConfigurationMediator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MediaServiceConfigurationMediator delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userDidRemoveService:homeUserID:", v9, v6);

  }
}

- (void)userDidUpdateDefaultService:(id)a3 homeUserID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MediaServiceConfigurationMediator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MediaServiceConfigurationMediator delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userDidUpdateDefaultService:homeUserID:", v9, v6);

  }
}

- (MediaServiceUpdatedServiceInterfaceDelegate)delegate
{
  return (MediaServiceUpdatedServiceInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
