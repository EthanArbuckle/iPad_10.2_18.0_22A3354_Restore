@implementation CLIntersiloProxyToInitiator

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_peer);
}

- (CLIntersiloProxyToInitiator)initWithDelegateObject:(id)a3 delegateSilo:(id)a4 uninitializedPeer:(id)a5
{
  id v8;
  CLIntersiloProxyToInitiator *v9;
  CLIntersiloProxyToInitiator *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CLIntersiloProxyToInitiator;
  v9 = -[CLIntersiloProxy initWithDelegateObject:delegateSilo:](&v12, sel_initWithDelegateObject_delegateSilo_, a3, a4);
  v10 = v9;
  if (v9)
    objc_storeWeak((id *)&v9->_peer, v8);

  return v10;
}

- (CLIntersiloProxy)peer
{
  return (CLIntersiloProxy *)objc_loadWeakRetained((id *)&self->_peer);
}

@end
