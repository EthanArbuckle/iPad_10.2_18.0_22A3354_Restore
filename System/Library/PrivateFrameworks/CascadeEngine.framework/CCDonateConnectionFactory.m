@implementation CCDonateConnectionFactory

- (id)makeXPCConnection:(id)a3 accessAssertion:(id)a4
{
  id v6;
  id v7;
  CCDonateConnection *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[CCDonateConnection initWithRequestManager:xpcConnection:accessAssertion:]([CCDonateConnection alloc], "initWithRequestManager:xpcConnection:accessAssertion:", self->_requestManager, v7, v6);

  return v8;
}

- (CCDonateConnectionFactory)initWithRequestManager:(id)a3
{
  id v5;
  CCDonateConnectionFactory *v6;
  CCDonateConnectionFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCDonateConnectionFactory;
  v6 = -[CCDonateConnectionFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requestManager, a3);

  return v7;
}

- (id)makeXPCConnection:(id)a3
{
  id v4;
  CCDonateConnection *v5;

  v4 = a3;
  v5 = -[CCDonateConnection initWithRequestManager:xpcConnection:accessAssertion:]([CCDonateConnection alloc], "initWithRequestManager:xpcConnection:accessAssertion:", self->_requestManager, v4, 0);

  return v5;
}

- (id)makeConnection:(id)a3
{
  return -[CCDonateConnection initWithRequestManager:xpcConnection:accessAssertion:]([CCDonateConnection alloc], "initWithRequestManager:xpcConnection:accessAssertion:", self->_requestManager, 0, 0);
}

- (void)terminateConnection:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "abortSetDonation");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestManager, 0);
}

@end
