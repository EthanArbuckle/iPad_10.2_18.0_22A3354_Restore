@implementation MKGETCertificateRouter

- (MKGETCertificateRouter)initWithSRP:(id)a3 certificate:(id)a4
{
  id v6;
  id v7;
  MKGETCertificateRouter *v8;
  MKGETCertificateRouter *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MKGETCertificateRouter;
  v8 = -[MKGETCertificateRouter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MKGETCertificateRouter setSrp:](v8, "setSrp:", v6);
    -[MKGETCertificateRouter setCertificate:](v9, "setCertificate:", v7);
  }

  return v9;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  MKCrypto *v9;
  void *v10;
  NSObject *v11;

  v6 = a5;
  -[MKSRPServer sharedKey](self->_srp, "sharedKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MKCertificate encodedCertificate](self->_certificate, "encodedCertificate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MKCrypto initWithKey:]([MKCrypto alloc], "initWithKey:", v7);
    -[MKCrypto encryptData:](v9, "encryptData:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBody:", v10);

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MKGETCertificateRouter server:didReceiveRequest:response:].cold.1((uint64_t)self, v11);

  }
}

- (MKGETCertificateRouterDelegate)delegate
{
  return (MKGETCertificateRouterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKSRPServer)srp
{
  return self->_srp;
}

- (void)setSrp:(id)a3
{
  objc_storeStrong((id *)&self->_srp, a3);
}

- (MKCertificate)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_certificate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_srp, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)server:(uint64_t)a1 didReceiveRequest:(NSObject *)a2 response:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "%@ could not continue to send the certificate because shared key is missing. The client didn't call POST /srp before.", (uint8_t *)&v2, 0xCu);
}

@end
