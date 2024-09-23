@implementation RSABSSATokenWaitingActivation

- (RSABSSATokenWaitingActivation)initWithBlindingInverse:(id)a3 blindedMessage:(id)a4 tokenContent:(id)a5 tokenBlinder:(id)a6 ciphersuite:(const ccrsabssa_ciphersuite *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  RSABSSATokenWaitingActivation *v17;
  RSABSSATokenWaitingActivation *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)RSABSSATokenWaitingActivation;
  v17 = -[RSABSSATokenWaitingActivation init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_tokenBlinder, a6);
    objc_storeStrong((id *)&v18->_blindedMessage, a4);
    objc_storeStrong((id *)&v18->_blindingInverse, a3);
    objc_storeStrong((id *)&v18->_tokenContent, a5);
    v18->_ciphersuite = a7;
  }

  return v18;
}

- (id)activateTokenWithServerResponse:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  RSABSSATokenReady *v19;
  RSABSSATokenReady *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99DF0];
  v6 = a3;
  -[RSABSSATokenWaitingActivation blindingInverse](self, "blindingInverse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithLength:", objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[RSABSSATokenWaitingActivation tokenBlinder](self, "tokenBlinder");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "publicKey");
  v9 = objc_retainAutorelease(v6);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");

  -[RSABSSATokenWaitingActivation blindingInverse](self, "blindingInverse");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "bytes");
  -[RSABSSATokenWaitingActivation blindingInverse](self, "blindingInverse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "length");
  -[RSABSSATokenWaitingActivation tokenContent](self, "tokenContent");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "bytes");
  -[RSABSSATokenWaitingActivation tokenContent](self, "tokenContent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "length");
  v14 = objc_retainAutorelease(v8);
  v25 = objc_msgSend(v14, "mutableBytes");
  v26 = objc_msgSend(v14, "length");
  v15 = ccrsabssa_unblind_signature();

  if (v15)
  {
    if (a4)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v29 = CFSTR("corecrypto_error");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15, v25, v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.rsabssa"), 4, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v19 = 0;
  }
  else
  {
    v20 = [RSABSSATokenReady alloc];
    -[RSABSSATokenWaitingActivation tokenContent](self, "tokenContent", v25, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RSABSSATokenWaitingActivation tokenBlinder](self, "tokenBlinder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "keyId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[RSABSSATokenReady initWithTokenContent:tokenSignature:keyId:](v20, "initWithTokenContent:tokenSignature:keyId:", v21, v14, v23);

  }
  return v19;
}

- (NSData)blindedMessage
{
  return self->_blindedMessage;
}

- (NSData)blindingInverse
{
  return self->_blindingInverse;
}

- (RSABSSATokenBlinder)tokenBlinder
{
  return self->_tokenBlinder;
}

- (NSData)tokenContent
{
  return self->_tokenContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenContent, 0);
  objc_storeStrong((id *)&self->_tokenBlinder, 0);
  objc_storeStrong((id *)&self->_blindingInverse, 0);
  objc_storeStrong((id *)&self->_blindedMessage, 0);
}

@end
