@implementation MKGETSRPRouter

- (MKGETSRPRouter)initWithSRP:(id)a3
{
  id v5;
  MKGETSRPRouter *v6;
  MKGETSRPRouter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKGETSRPRouter;
  v6 = -[MKGETSRPRouter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_srp, a3);

  return v7;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  id v6;
  MKSRPServer *srp;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id WeakRetained;
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  srp = self->_srp;
  v13 = 0;
  v14 = 0;
  -[MKSRPServer generateSalt:pubkey:](srp, "generateSalt:pubkey:", &v14, &v13);
  v8 = v14;
  v9 = v13;
  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
  {
    v15[0] = CFSTR("salt");
    v15[1] = CFSTR("pubkey");
    v16[0] = v8;
    v16[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBody:", v11);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "routerDidRevokeEncryptionKey:", self);

  }
  else
  {
    +[MKLog log](MKLog, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MKPOSTSRPRouter server:didReceiveRequest:response:].cold.1((uint64_t)self, v10);
  }

}

- (MKGETSRPRouterDelegate)delegate
{
  return (MKGETSRPRouterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

@end
