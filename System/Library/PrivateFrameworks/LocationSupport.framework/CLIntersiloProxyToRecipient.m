@implementation CLIntersiloProxyToRecipient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peer, 0);
}

- (CLIntersiloProxyToRecipient)initWithUninitializedPeer:(id)a3
{
  id v5;
  CLIntersiloProxyToRecipient *v6;
  CLIntersiloProxyToRecipient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLIntersiloProxyToRecipient;
  v6 = -[CLIntersiloProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_peer, a3);

  return v7;
}

- (CLIntersiloProxy)peer
{
  return self->_peer;
}

@end
