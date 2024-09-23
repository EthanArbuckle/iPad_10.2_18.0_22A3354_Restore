@implementation RSABSSATokenIssuer

- (RSABSSATokenIssuer)init
{
  return -[RSABSSATokenIssuer initWithKeyByteCount:](self, "initWithKeyByteCount:", 512);
}

- (RSABSSATokenIssuer)initWithKeyByteCount:(unint64_t)a3
{
  RSABSSATokenIssuer *v4;
  const ccrsabssa_ciphersuite *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSData *publicKey;
  void *v10;
  uint64_t v11;
  NSData *keyId;
  RSABSSATokenIssuer *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RSABSSATokenIssuer;
  v4 = -[RSABSSATokenIssuer init](&v15, sel_init);
  if (!v4)
    goto LABEL_10;
  ccrng();
  switch(a3)
  {
    case 0x100uLL:
      v5 = (const ccrsabssa_ciphersuite *)MEMORY[0x1E0C82398];
      break;
    case 0x200uLL:
      v5 = (const ccrsabssa_ciphersuite *)MEMORY[0x1E0C823A8];
      break;
    case 0x180uLL:
      v5 = (const ccrsabssa_ciphersuite *)MEMORY[0x1E0C823A0];
      break;
    default:
      v4->_ciphersuite = 0;
      goto LABEL_12;
  }
  v4->_ciphersuite = v5;
  v4->_ciphersuiteModulusByteCount = a3;
  if (ccrsa_generate_key())
  {
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  ccrsa_ctx_public();
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", ccder_encode_rsa_pub_size()));
  objc_msgSend(v6, "mutableBytes");
  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "mutableBytes");
  objc_msgSend(v7, "length");
  ccder_encode_rsa_pub();
  +[RSAPSSSPKI_Bridging serializeWithKeyBytes:error:](_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging, "serializeWithKeyBytes:error:", v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  publicKey = v4->_publicKey;
  v4->_publicKey = (NSData *)v8;

  -[RSABSSATokenIssuer publicKey](v4, "publicKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[RSABSSATokenBlinder keyIDFromSPKI:](RSABSSATokenBlinder, "keyIDFromSPKI:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  keyId = v4->_keyId;
  v4->_keyId = (NSData *)v11;

LABEL_10:
  v13 = v4;
LABEL_13:

  return v13;
}

- (id)blindSign:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  ccrng();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", self->_ciphersuiteModulusByteCount);
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "mutableBytes");
  objc_msgSend(v9, "length");
  v10 = ccrsabssa_sign_blinded_message();
  if (v10)
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("corecrypto_error");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.rsabssa"), 5, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    v9 = v9;
    a4 = (id *)v9;
  }

  return a4;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (NSData)keyId
{
  return self->_keyId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyId, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end
