@implementation ASTAuthInfoResult

- (id)generatePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  -[ASTAuthInfoResult attestation](self, "attestation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ASTAuthInfoResult attestation](self, "attestation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v5)
    {
      v3 = 0;
    }
    else
    {
      -[ASTAuthInfoResult attestation](self, "attestation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[ASTAuthInfoResult cert](self, "cert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ASTAuthInfoResult cert](self, "cert");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      v7 = 0;
    }
    else
    {
      -[ASTAuthInfoResult cert](self, "cert");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ASTAuthInfoResult type](self, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("type"));

  if (v3)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v3, CFSTR("attestation"));
  if (v7)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("certificate"));
  if (-[ASTAuthInfoResult error](self, "error"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ASTAuthInfoResult error](self, "error"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("error"));

  }
  v14 = (void *)objc_msgSend(v11, "copy");

  return v14;
}

+ (id)sealedAuthInfoResultWithPayload:(id)a3 signature:(id)a4
{
  id v5;
  id v6;
  ASTAuthInfoResult *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ASTSealablePayload initWithPayload:signature:]([ASTAuthInfoResult alloc], "initWithPayload:signature:", v6, v5);

  return v7;
}

+ (id)authInfoResultWithAttestation:(id)a3
{
  return +[ASTAuthInfoResult authInfoResultWithAttestation:certificate:type:error:](ASTAuthInfoResult, "authInfoResultWithAttestation:certificate:type:error:", a3, 0, 0, 0);
}

+ (id)authInfoResultWithAttestation:(id)a3 certificate:(id)a4 type:(int64_t)a5 error:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setAttestation:", v10);

  objc_msgSend(v11, "setCert:", v9);
  objc_msgSend(v11, "setType:", a5);
  objc_msgSend(v11, "setError:", a6);
  return v11;
}

- (void)setAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_attestation, a3);
}

- (NSData)attestation
{
  return self->_attestation;
}

- (void)setCert:(id)a3
{
  objc_storeStrong((id *)&self->_cert, a3);
}

- (NSData)cert
{
  return self->_cert;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setError:(int64_t)a3
{
  self->_error = a3;
}

- (int64_t)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cert, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
}

@end
