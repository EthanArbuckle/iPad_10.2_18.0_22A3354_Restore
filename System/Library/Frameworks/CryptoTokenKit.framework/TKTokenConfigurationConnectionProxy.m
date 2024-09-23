@implementation TKTokenConfigurationConnectionProxy

- (TKTokenConfigurationConnectionProxy)initWithConnection:(id)a3
{
  id v4;
  TKTokenConfigurationConnectionProxy *v5;
  TKTokenConfigurationConnectionProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TKTokenConfigurationConnectionProxy;
  v5 = -[TKTokenConfigurationConnectionProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_weakConfigurationConnection, v4);

  return v6;
}

- (void)tokenConfigurationChanged:(id)a3
{
  TKTokenConfigurationConnection **p_weakConfigurationConnection;
  id v4;
  id WeakRetained;

  p_weakConfigurationConnection = &self->_weakConfigurationConnection;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_weakConfigurationConnection);
  objc_msgSend(WeakRetained, "tokenConfigurationChanged:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakConfigurationConnection);
}

@end
