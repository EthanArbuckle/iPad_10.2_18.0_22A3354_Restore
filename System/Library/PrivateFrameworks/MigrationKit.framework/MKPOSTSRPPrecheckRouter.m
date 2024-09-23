@implementation MKPOSTSRPPrecheckRouter

- (MKPOSTSRPPrecheckRouter)initWithPrecheck:(id)a3
{
  id v5;
  MKPOSTSRPPrecheckRouter *v6;
  MKPOSTSRPPrecheckRouter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKPOSTSRPPrecheckRouter;
  v6 = -[MKPOSTSRPPrecheckRouter init](&v9, sel_init);
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
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL8 v15;
  void *v16;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "hostname");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    -[MKSRPPrecheck serverForKey:](self->_precheck, "serverForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v7, "body");
      v11 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject length](v11, "length"))
      {
        v36 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v11, 0, &v36);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v36;
        v35 = v10;
        if (v13)
        {
          v34 = v12;
          +[MKLog log](MKLog, "log");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[MKPOSTSRPRouter server:didReceiveRequest:response:].cold.2((uint64_t)self, v13, v14);
          v15 = 0;
          v16 = v34;
        }
        else
        {
          objc_msgSend(v12, "objectForKey:", CFSTR("pubkey"));
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("proof"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "generateSharedKey:proofOfMatch:", v14, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v12;
          v15 = v30 != 0;

        }
        v10 = v35;
      }
      else
      {
        +[MKLog log](MKLog, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[MKPOSTSRPPrecheckRouter server:didReceiveRequest:response:].cold.2((uint64_t)self, v13, v23, v24, v25, v26, v27, v28);
        v15 = 0;
      }

    }
    else
    {
      +[MKLog log](MKLog, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MKPOSTSRPPrecheckRouter server:didReceiveRequest:response:].cold.1((uint64_t)self, v11, v17, v18, v19, v20, v21, v22);
      v15 = 0;
    }

    v37 = CFSTR("success");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v31;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v32, 0, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBody:", v33);
    -[MKSRPPrecheck removeServerForKey:](self->_precheck, "removeServerForKey:", v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precheck, 0);
}

- (void)server:(uint64_t)a3 didReceiveRequest:(uint64_t)a4 response:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "%@ srp server was not initialized in GET /srp/precheck.", a5, a6, a7, a8, 2u);
}

- (void)server:(uint64_t)a3 didReceiveRequest:(uint64_t)a4 response:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "%@ could not continue to authenticate the client because the client sent invalid parameters.", a5, a6, a7, a8, 2u);
}

@end
