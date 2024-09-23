@implementation KCSRPServerContext

- (BOOL)resetWithPassword:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t salt_and_verification;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  ccsrp_ctx *v21;

  v5 = (void *)MEMORY[0x24BDBCEC8];
  v6 = a3;
  objc_msgSend(v5, "dataWithLength:", 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 8 * MEMORY[0x212BA8BA8]((_QWORD)-[KCSRPContext context](self, "context")[8]));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSRPContext dataForPassword:](self, "dataForPassword:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[KCSRPContext context](self, "context");
  -[KCSRPContext rng](self, "rng");
  -[KCSRPContext userNameString](self, "userNameString");
  objc_msgSend(v9, "length");
  v10 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "bytes");
  objc_msgSend(v7, "length");
  v11 = objc_retainAutorelease(v7);
  objc_msgSend(v11, "mutableBytes");
  v12 = objc_retainAutorelease(v8);
  objc_msgSend(v12, "mutableBytes");
  salt_and_verification = ccsrp_generate_salt_and_verification();
  v19 = CoreCryptoError(salt_and_verification, a4, CFSTR("Error generating SRP salt/verifier"), v14, v15, v16, v17, v18, (uint64_t)v21);
  if (v19)
  {
    -[KCSRPServerContext setVerifier:](self, "setVerifier:", v12);
    objc_storeStrong((id *)&self->_salt, v11);
  }

  return v19;
}

- (KCSRPServerContext)initWithUser:(id)a3 password:(id)a4 digestInfo:(const ccdigest_info *)a5 group:(ccdh_gp *)a6 randomSource:(ccrng_state *)a7
{
  id v12;
  KCSRPServerContext *v13;
  KCSRPServerContext *v14;
  KCSRPServerContext *v15;
  objc_super v17;

  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)KCSRPServerContext;
  v13 = -[KCSRPContext initWithUser:digestInfo:group:randomSource:](&v17, sel_initWithUser_digestInfo_group_randomSource_, a3, a5, a6, a7);
  v14 = v13;
  if (!v13 || (v15 = 0, -[KCSRPServerContext resetWithPassword:error:](v13, "resetWithPassword:error:", v12, 0)))
    v15 = v14;

  return v15;
}

- (KCSRPServerContext)initWithUser:(id)a3 salt:(id)a4 verifier:(id)a5 digestInfo:(const ccdigest_info *)a6 group:(ccdh_gp *)a7 randomSource:(ccrng_state *)a8
{
  id v15;
  id v16;
  KCSRPServerContext *v17;
  KCSRPServerContext *v18;
  objc_super v20;

  v15 = a4;
  v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)KCSRPServerContext;
  v17 = -[KCSRPContext initWithUser:digestInfo:group:randomSource:](&v20, sel_initWithUser_digestInfo_group_randomSource_, a3, a6, a7, a8);
  v18 = v17;
  if (v17)
  {
    -[KCSRPServerContext setVerifier:](v17, "setVerifier:", v16);
    objc_storeStrong((id *)&v18->_salt, a4);
  }

  return v18;
}

- (id)copyChallengeFor:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t started;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  v6 = a3;
  -[KCSRPContext context](self, "context");
  v7 = ccsrp_exchange_size();
  if (!ExactDataSizeRequirement(v6, v7, a4, CFSTR("start data")))
    goto LABEL_4;
  v8 = (void *)MEMORY[0x24BDBCEC8];
  -[KCSRPContext context](self, "context");
  objc_msgSend(v8, "dataWithLength:", ccsrp_exchange_size());
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[KCSRPContext context](self, "context");
  -[KCSRPContext rng](self, "rng");
  -[KCSRPContext userNameString](self, "userNameString");
  -[KCSRPServerContext salt](self, "salt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "length");
  -[KCSRPServerContext salt](self, "salt");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "bytes");
  -[KCSRPServerContext verifier](self, "verifier");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "bytes");
  objc_msgSend(objc_retainAutorelease(v6), "bytes");
  v12 = objc_retainAutorelease(v20);
  objc_msgSend(v12, "mutableBytes");
  started = ccsrp_server_start_authentication();

  if (!CoreCryptoError(started, a4, CFSTR("Server start authentication failed: %d"), v14, v15, v16, v17, v18, started))
  {

LABEL_4:
    v12 = 0;
  }

  return v12;
}

- (id)copyConfirmationFor:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v6 = a3;
  -[KCSRPContext context](self, "context");
  v7 = ccsrp_session_size();
  if (!ExactDataSizeRequirement(v6, v7, a4, CFSTR("response data")))
    goto LABEL_4;
  v8 = (void *)MEMORY[0x24BDBCEC8];
  -[KCSRPContext context](self, "context");
  objc_msgSend(v8, "dataWithLength:", ccsrp_session_size());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSRPContext context](self, "context");
  objc_msgSend(objc_retainAutorelease(v6), "bytes");
  v10 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "mutableBytes");
  v11 = ccsrp_server_verify_session();
  if (!CoreCryptoError(v11 ^ 1u, a4, CFSTR("SRP verification failed"), v12, v13, v14, v15, v16, v18))
  {

LABEL_4:
    v10 = 0;
  }

  return v10;
}

- (NSData)salt
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)verifier
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVerifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_salt, 0);
}

@end
