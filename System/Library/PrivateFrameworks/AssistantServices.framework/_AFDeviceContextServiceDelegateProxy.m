@implementation _AFDeviceContextServiceDelegateProxy

- (_AFDeviceContextServiceDelegateProxy)initWithConnection:(id)a3
{
  id v4;
  _AFDeviceContextServiceDelegateProxy *v5;
  _AFDeviceContextServiceDelegateProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_AFDeviceContextServiceDelegateProxy;
  v5 = -[_AFDeviceContextServiceDelegateProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_connection, v4);

  return v6;
}

- (void)updateLocalDeviceContext:(id)a3
{
  AFDeviceContextConnection **p_connection;
  id v4;
  id WeakRetained;

  p_connection = &self->_connection;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(WeakRetained, "_updateLocalDeviceContext:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
}

@end
