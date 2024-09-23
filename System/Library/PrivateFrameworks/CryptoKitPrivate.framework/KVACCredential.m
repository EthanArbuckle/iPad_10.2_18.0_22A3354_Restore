@implementation KVACCredential

- (KVACCredential)initWithIssuanceData:(id)a3 client:(id)a4 request:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  KVACCredential *v13;
  _TtC16CryptoKitPrivate19KVACIssuanceWrapper *v14;
  uint64_t v15;
  _TtC16CryptoKitPrivate21KVACCredentialWrapper *credential;
  uint64_t v17;
  NSData *serverKeyId;
  uint64_t v19;
  NSData *credentialData;
  KVACCredential *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)KVACCredential;
  v13 = -[KVACCredential init](&v23, sel_init);
  if (v13)
  {
    v14 = -[KVACIssuanceWrapper initWithIssuanceData:error:]([_TtC16CryptoKitPrivate19KVACIssuanceWrapper alloc], "initWithIssuanceData:error:", v10, a6);
    objc_msgSend(v11, "makeCredentialWithIssuance:request:error:", v14, v12, a6);
    v15 = objc_claimAutoreleasedReturnValue();
    credential = v13->_credential;
    v13->_credential = (_TtC16CryptoKitPrivate21KVACCredentialWrapper *)v15;

    if (!v14 || !v13->_credential)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.KVAC.error"), 2, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      goto LABEL_7;
    }
    -[KVACIssuanceWrapper keyId](v14, "keyId");
    v17 = objc_claimAutoreleasedReturnValue();
    serverKeyId = v13->_serverKeyId;
    v13->_serverKeyId = (NSData *)v17;

    -[KVACCredentialWrapper credentialData](v13->_credential, "credentialData");
    v19 = objc_claimAutoreleasedReturnValue();
    credentialData = v13->_credentialData;
    v13->_credentialData = (NSData *)v19;

  }
  v21 = v13;
LABEL_7:

  return v21;
}

- (KVACCredential)initWithCredentialData:(id)a3 error:(id *)a4
{
  id v7;
  KVACCredential *v8;
  KVACCredential *v9;
  _TtC16CryptoKitPrivate21KVACCredentialWrapper *v10;
  _TtC16CryptoKitPrivate21KVACCredentialWrapper *credential;
  uint64_t v12;
  NSData *serverKeyId;
  KVACCredential *v14;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)KVACCredential;
  v8 = -[KVACCredential init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_credentialData, a3);
    v10 = -[KVACCredentialWrapper initWithCredentialData:error:]([_TtC16CryptoKitPrivate21KVACCredentialWrapper alloc], "initWithCredentialData:error:", v7, a4);
    credential = v9->_credential;
    v9->_credential = v10;

    -[KVACCredentialWrapper serverKeyId](v9->_credential, "serverKeyId");
    v12 = objc_claimAutoreleasedReturnValue();
    serverKeyId = v9->_serverKeyId;
    v9->_serverKeyId = (NSData *)v12;

    v14 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.KVAC.error"), 2, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)presentWithTagPrefix:(id)a3 error:(id *)a4
{
  id v6;
  KVACPresentation *v7;

  v6 = a3;
  v7 = -[KVACPresentation initWithCredential:tagPrefix:error:]([KVACPresentation alloc], "initWithCredential:tagPrefix:error:", self, v6, a4);

  return v7;
}

- (NSData)serverKeyId
{
  return self->_serverKeyId;
}

- (NSData)credentialData
{
  return self->_credentialData;
}

- (_TtC16CryptoKitPrivate21KVACCredentialWrapper)credential
{
  return self->_credential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_credentialData, 0);
  objc_storeStrong((id *)&self->_serverKeyId, 0);
}

@end
