@implementation KCSRPClientContext

- (id)copyStart:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t started;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (void *)MEMORY[0x24BDBCEC8];
  -[KCSRPContext context](self, "context");
  objc_msgSend(v5, "dataWithLength:", ccsrp_exchange_size());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSRPContext context](self, "context");
  -[KCSRPContext rng](self, "rng");
  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "mutableBytes");
  started = ccsrp_client_start_authentication();
  if (!CoreCryptoError(started, a3, CFSTR("Start packet copy failed: %d"), v9, v10, v11, v12, v13, started))
  {

    return 0;
  }
  return v7;
}

- (id)copyResposeToChallenge:(id)a3 password:(id)a4 salt:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[KCSRPContext context](self, "context");
  v13 = ccsrp_exchange_size();
  if (ExactDataSizeRequirement(v10, v13, a6, CFSTR("challenge data")))
  {
    v14 = (void *)MEMORY[0x24BDBCEC8];
    -[KCSRPContext context](self, "context");
    objc_msgSend(v14, "dataWithLength:", ccsrp_session_size());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCSRPContext dataForPassword:](self, "dataForPassword:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCSRPContext context](self, "context");
    -[KCSRPContext userNameString](self, "userNameString");
    objc_msgSend(v16, "length");
    v17 = objc_retainAutorelease(v16);
    objc_msgSend(v17, "bytes");
    objc_msgSend(v12, "length");
    objc_msgSend(objc_retainAutorelease(v12), "bytes");
    objc_msgSend(objc_retainAutorelease(v10), "bytes");
    v18 = objc_retainAutorelease(v15);
    objc_msgSend(v18, "mutableBytes");
    v19 = ccsrp_client_process_challenge();
    if (!CoreCryptoError(v19, a6, CFSTR("Challenge processing failed: %d"), v20, v21, v22, v23, v24, v19))
    {

      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)verifyConfirmation:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  char v8;

  v6 = a3;
  -[KCSRPContext context](self, "context");
  v7 = ccsrp_session_size();
  if (ExactDataSizeRequirement(v6, v7, a4, CFSTR("confirmation data")))
  {
    -[KCSRPContext context](self, "context");
    objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v8 = ccsrp_client_verify_session();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
