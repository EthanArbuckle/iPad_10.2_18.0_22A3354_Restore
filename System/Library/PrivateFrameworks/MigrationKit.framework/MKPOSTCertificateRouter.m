@implementation MKPOSTCertificateRouter

- (MKPOSTCertificateRouter)initWithSRP:(id)a3
{
  id v4;
  MKPOSTCertificateRouter *v5;
  MKPOSTCertificateRouter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKPOSTCertificateRouter;
  v5 = -[MKPOSTCertificateRouter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MKPOSTCertificateRouter setSrp:](v5, "setSrp:", v4);

  return v6;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  void *v6;
  NSObject *v7;
  MKCrypto *v8;
  void *v9;
  MKCertificate *v10;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  objc_msgSend(a4, "body", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    -[MKSRPServer sharedKey](self->_srp, "sharedKey");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = -[MKCrypto initWithKey:]([MKCrypto alloc], "initWithKey:", v7);
      -[MKCrypto decryptData:](v8, "decryptData:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = -[MKCertificate initWithPEM:]([MKCertificate alloc], "initWithPEM:", v9);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "router:didReceiveCertifciate:", self, v10);

      }
      else
      {
        +[MKLog log](MKLog, "log");
        v10 = (MKCertificate *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
          -[MKPOSTCertificateRouter server:didReceiveRequest:response:].cold.3((uint64_t)self, &v10->super, v24, v25, v26, v27, v28, v29);
      }

    }
    else
    {
      +[MKLog log](MKLog, "log");
      v8 = (MKCrypto *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
        -[MKPOSTCertificateRouter server:didReceiveRequest:response:].cold.2((uint64_t)self, &v8->super, v18, v19, v20, v21, v22, v23);
    }

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MKPOSTCertificateRouter server:didReceiveRequest:response:].cold.1((uint64_t)self, v7, v12, v13, v14, v15, v16, v17);
  }

}

- (MKPOSTCertificateRouterDelegate)delegate
{
  return (MKPOSTCertificateRouterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srp, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)server:(uint64_t)a3 didReceiveRequest:(uint64_t)a4 response:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "%@ could not continue to establish the secured connection because the client sent an invalid certificate.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)server:(uint64_t)a3 didReceiveRequest:(uint64_t)a4 response:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "%@ could not continue to establish the secured connection because shared key is missing. The client didn't call POST /srp before.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)server:(uint64_t)a3 didReceiveRequest:(uint64_t)a4 response:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "%@ could not continue to establish the secured connection because we couldn't decrypt the certificate.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
