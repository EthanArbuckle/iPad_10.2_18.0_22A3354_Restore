@implementation MKGETSRPPrecheckRouter

- (MKGETSRPPrecheckRouter)initWithPrecheck:(id)a3
{
  id v5;
  MKGETSRPPrecheckRouter *v6;
  MKGETSRPPrecheckRouter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKGETSRPPrecheckRouter;
  v6 = -[MKGETSRPPrecheckRouter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_precheck, a3);

  return v7;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "hostname");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[MKSRPPrecheck serverForKey:](self->_precheck, "serverForKey:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      +[MKLog log](MKLog, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "hostname");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v23 = v14;
        _os_log_impl(&dword_21EC08000, v13, OS_LOG_TYPE_INFO, "srp for hostname is currently being used. hostname=%{private}@", buf, 0xCu);

      }
      v15 = 0;
    }
    else
    {
      -[MKSRPPrecheck setServerForKey:](self->_precheck, "setServerForKey:", v9);
      -[MKSRPPrecheck serverForKey:](self->_precheck, "serverForKey:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v21 = 0;
      objc_msgSend(v12, "generateSalt:pubkey:", &v21, &v20);
      v13 = v21;
      v16 = v20;
      if (-[NSObject length](v13, "length") && objc_msgSend(v16, "length"))
      {
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("salt"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("pubkey"));
        v15 = 1;
      }
      else
      {
        +[MKLog log](MKLog, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[MKPOSTSRPRouter server:didReceiveRequest:response:].cold.1((uint64_t)self, v17);

        -[MKSRPPrecheck removeServerForKey:](self->_precheck, "removeServerForKey:", v9);
        v15 = 0;
      }

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("success"));

    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v10, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBody:", v19);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precheck, 0);
}

@end
