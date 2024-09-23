@implementation ASTSealablePayload

- (ASTSealablePayload)initWithPayload:(id)a3 signature:(id)a4
{
  id v7;
  id v8;
  ASTSealablePayload *v9;
  ASTSealablePayload *v10;
  uint64_t v11;
  NSString *base64Signature;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASTSealablePayload;
  v9 = -[ASTSealablePayload init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payload, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_signature, a4);
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      base64Signature = v10->_base64Signature;
      v10->_base64Signature = (NSString *)v11;

    }
    v10->_sealed = 1;
  }

  return v10;
}

- (BOOL)sealWithPayloadSigner:(id)a3 error:(id *)a4
{
  void (**v6)(id, void *, id *);
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = (void (**)(id, void *, id *))a3;
  if (-[ASTSealablePayload isSealed](self, "isSealed"))
  {
    v7 = 1;
  }
  else
  {
    -[ASTSealablePayload generatePayload](self, "generatePayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASTEncodingUtilities jsonSerializeObject:error:](ASTEncodingUtilities, "jsonSerializeObject:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTSealablePayload setPayload:](self, "setPayload:", v9);

    -[ASTSealablePayload payload](self, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v10 != 0;
    if (v10)
    {
      if (v6)
      {
        -[ASTSealablePayload payload](self, "payload");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v11, a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASTSealablePayload setSignature:](self, "setSignature:", v12);

      }
      -[ASTSealablePayload setSealed:](self, "setSealed:", 1);
    }
    -[ASTSealablePayload signature](self, "signature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[ASTSealablePayload signature](self, "signature");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTSealablePayload setBase64Signature:](self, "setBase64Signature:", v15);

    }
  }

  return v7;
}

- (id)sealedDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ASTSealablePayload signature](self, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTSealablePayload payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@[Sealed], signature=%@, payload=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;

  if (-[ASTSealablePayload isSealed](self, "isSealed"))
  {
    -[ASTSealablePayload sealedDescription](self, "sealedDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ASTSealablePayload generatePayload](self, "generatePayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)generatePayload
{
  return 0;
}

- (BOOL)isSealed
{
  return self->_sealed;
}

- (void)setSealed:(BOOL)a3
{
  self->_sealed = a3;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (NSString)base64Signature
{
  return self->_base64Signature;
}

- (void)setBase64Signature:(id)a3
{
  objc_storeStrong((id *)&self->_base64Signature, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_base64Signature, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
