@implementation NPKSharedPeerPaymentWebServiceArchiver

- (NPKSharedPeerPaymentWebServiceArchiver)initWithCompanionAgentConnection:(id)a3
{
  id v5;
  NPKSharedPeerPaymentWebServiceArchiver *v6;
  NPKSharedPeerPaymentWebServiceArchiver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKSharedPeerPaymentWebServiceArchiver;
  v6 = -[NPKSharedPeerPaymentWebServiceArchiver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)archiveContext:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Telling daemon to archive peer payment web service context", v10, 2u);
    }

  }
  -[NPKSharedPeerPaymentWebServiceArchiver connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NPKPairedOrPairingDevice();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSharedPeerPaymentWebServiceContext:forDevice:", v4, v9);

}

- (NPKCompanionAgentConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
