@implementation MKPOSTSRPRouter

- (MKPOSTSRPRouter)initWithSRP:(id)a3
{
  id v5;
  MKPOSTSRPRouter *v6;
  MKPOSTSRPRouter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKPOSTSRPRouter;
  v6 = -[MKPOSTSRPRouter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_srp, a3);

  return v7;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a4, "body", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    +[MKLog log](MKLog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MKPOSTSRPRouter server:didReceiveRequest:response:].cold.1((uint64_t)self, v9);
    goto LABEL_8;
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v8)
  {
    v9 = v8;
    +[MKLog log](MKLog, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MKPOSTSRPRouter server:didReceiveRequest:response:].cold.2((uint64_t)self, v9, v10);

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("pubkey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("proof"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKSRPServer generateSharedKey:proofOfMatch:](self->_srp, "generateSharedKey:proofOfMatch:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "routerDidAuthenticateClient:", self);
    goto LABEL_10;
  }
LABEL_9:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "routerDidRejectClient:", self);
LABEL_10:

}

- (MKPOSTSRPRouterDelegate)delegate
{
  return (MKPOSTSRPRouterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_srp, 0);
}

- (void)server:(uint64_t)a1 didReceiveRequest:(NSObject *)a2 response:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "%@ could not continue to authenticate the client because the client sent invalid parameters.", (uint8_t *)&v2, 0xCu);
}

- (void)server:(uint64_t)a1 didReceiveRequest:(void *)a2 response:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_21EC08000, a3, OS_LOG_TYPE_ERROR, "%@ could not continue to authenticate the client because there was an underlying issue occurred unexpectedly. error=%@", (uint8_t *)&v6, 0x16u);

}

@end
