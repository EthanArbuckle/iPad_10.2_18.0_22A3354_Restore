@implementation RSABSSATokenBlinder

+ (id)keyIDFromSPKI:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  const void *v7;
  CC_LONG v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99DF0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithLength:", 32);
  v6 = objc_retainAutorelease(v4);
  v7 = (const void *)objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  v9 = objc_retainAutorelease(v5);
  CC_SHA256(v7, v8, (unsigned __int8 *)objc_msgSend(v9, "mutableBytes"));
  return v9;
}

- (ccrsa_pub_ctx)publicKey
{
  return self->_publicKey;
}

- (BOOL)verifyFullyParsedASN1:(const char *)a3 end:(const char *)a4 error:(id *)a5
{
  if (a3 != a4 && a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.rsabssa"), 2, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 == a4;
}

- (BOOL)setParamsForSize:(unint64_t)a3 params:(id)a4 error:(id *)a5
{
  id v8;
  unint64_t v9;
  const ccrsabssa_ciphersuite *v10;
  BOOL v11;

  v8 = a4;
  v9 = 8 * a3;
  self->_ciphersuiteModulusByteCount = 8 * a3;
  self->_publicKey[0].pb_n = a3;
  if (8 * a3 == 256)
  {
    v10 = (const ccrsabssa_ciphersuite *)MEMORY[0x1E0C82398];
    goto LABEL_7;
  }
  if (v9 == 512)
  {
    v10 = (const ccrsabssa_ciphersuite *)MEMORY[0x1E0C823A8];
    goto LABEL_7;
  }
  if (v9 == 384)
  {
    v10 = (const ccrsabssa_ciphersuite *)MEMORY[0x1E0C823A0];
LABEL_7:
    self->_ciphersuite = v10;
    v11 = 1;
    goto LABEL_8;
  }
  self->_ciphersuite = 0;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.rsabssa"), 1, 0);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_8:

  return v11;
}

- (RSABSSATokenBlinder)initWithPublicKey:(id)a3 error:(id *)a4
{
  id v6;
  RSABSSATokenBlinder *v7;
  uint64_t v8;
  NSData *keyId;
  _TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging *v10;
  _TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  RSABSSATokenBlinder *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RSABSSATokenBlinder;
  v7 = -[RSABSSATokenBlinder init](&v19, sel_init);
  if (!v7)
    goto LABEL_6;
  +[RSABSSATokenBlinder keyIDFromSPKI:](RSABSSATokenBlinder, "keyIDFromSPKI:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  keyId = v7->_keyId;
  v7->_keyId = (NSData *)v8;

  v10 = -[RSAPSSSPKI_Bridging initWithData:error:]([_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging alloc], "initWithData:error:", v6, a4);
  if (!v10)
  {
LABEL_8:
    v17 = 0;
    goto LABEL_9;
  }
  v11 = v10;
  -[RSAPSSSPKI_Bridging publicKeyBytes](v10, "publicKeyBytes");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "bytes");
  v14 = v13 + objc_msgSend(v12, "length");
  v15 = objc_retainAutorelease(v12);
  objc_msgSend(v15, "bytes");
  if (!-[RSABSSATokenBlinder setParamsForSize:params:error:](v7, "setParamsForSize:params:error:", ccder_decode_rsa_pub_n(), v11, a4)|| (v16 = objc_retainAutorelease(v15), objc_msgSend(v16, "bytes"), !-[RSABSSATokenBlinder verifyFullyParsedASN1:end:error:](v7, "verifyFullyParsedASN1:end:error:", ccder_decode_rsa_pub(), v14, a4)))
  {

    goto LABEL_8;
  }

LABEL_6:
  v17 = v7;
LABEL_9:

  return v17;
}

- (id)tokenWaitingActivationWithContent:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  const __SecRandom *v10;
  size_t v11;
  id v12;
  RSABSSATokenWaitingActivation *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  id *v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
LABEL_8:
    v14 = ccrng();
    v24 = a4;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", self->_ciphersuiteModulusByteCount);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", self->_ciphersuiteModulusByteCount);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutorelease(v8);
    objc_msgSend(v12, "bytes");
    objc_msgSend(v12, "length");
    v17 = objc_retainAutorelease(v15);
    objc_msgSend(v17, "mutableBytes");
    objc_msgSend(v17, "length");
    v18 = objc_retainAutorelease(v16);
    objc_msgSend(v18, "mutableBytes");
    objc_msgSend(v18, "length");
    v19 = ccrsabssa_blind_message();
    if (v19)
    {
      if (v24)
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v25 = CFSTR("corecrypto_error");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19, v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.rsabssa"), 3, v22);
        *v24 = (id)objc_claimAutoreleasedReturnValue();

      }
      v13 = 0;
    }
    else
    {
      v13 = -[RSABSSATokenWaitingActivation initWithBlindingInverse:blindedMessage:tokenContent:tokenBlinder:ciphersuite:]([RSABSSATokenWaitingActivation alloc], "initWithBlindingInverse:blindedMessage:tokenContent:tokenBlinder:ciphersuite:", v17, v18, v12, self, self->_ciphersuite, v14);
    }

    goto LABEL_14;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
  v10 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v11 = objc_msgSend(v9, "length");
  v8 = objc_retainAutorelease(v9);
  if (!SecRandomCopyBytes(v10, v11, (void *)objc_msgSend(v8, "mutableBytes")))
    goto LABEL_8;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.rsabssa"), 0, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v12 = 0;
  v13 = 0;
LABEL_14:

  return v13;
}

- (NSData)keyId
{
  return self->_keyId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyId, 0);
}

@end
