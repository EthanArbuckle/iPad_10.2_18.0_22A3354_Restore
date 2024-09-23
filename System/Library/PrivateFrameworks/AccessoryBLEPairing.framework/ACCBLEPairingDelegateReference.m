@implementation ACCBLEPairingDelegateReference

- (ACCBLEPairingDelegateReference)initWithDelegate:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  ACCBLEPairingDelegateReference *v8;
  ACCBLEPairingDelegateReference *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ACCBLEPairingDelegateReference;
  v8 = -[ACCBLEPairingDelegateReference init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_provider, v7);
  }

  return v9;
}

- (ACCBLEPairingProviderProtocol)delegate
{
  return (ACCBLEPairingProviderProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ACCBLEPairingProvider)provider
{
  return (ACCBLEPairingProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
