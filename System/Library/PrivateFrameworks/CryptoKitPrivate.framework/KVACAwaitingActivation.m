@implementation KVACAwaitingActivation

- (KVACAwaitingActivation)initWithTokenChallenge:(id)a3 error:(id *)a4
{
  id v6;
  KVACAwaitingActivation *v7;
  _TtC16CryptoKitPrivate10KVACClient *v8;
  _TtC16CryptoKitPrivate10KVACClient *client;
  _TtC16CryptoKitPrivate18KVACRequestWrapper *v10;
  _TtC16CryptoKitPrivate18KVACRequestWrapper *request;
  _TtC16CryptoKitPrivate18KVACRequestWrapper *v12;
  uint64_t v13;
  NSData *requestData;
  KVACAwaitingActivation *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)KVACAwaitingActivation;
  v7 = -[KVACAwaitingActivation init](&v17, sel_init);
  if (v7)
  {
    v8 = -[KVACClient initWithTokenChallenge:error:]([_TtC16CryptoKitPrivate10KVACClient alloc], "initWithTokenChallenge:error:", v6, a4);
    client = v7->_client;
    v7->_client = v8;

    -[KVACClient makeRequestAndReturnError:](v7->_client, "makeRequestAndReturnError:", a4);
    v10 = (_TtC16CryptoKitPrivate18KVACRequestWrapper *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.KVAC.error"), 0, 0);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    request = v7->_request;
    v7->_request = v10;
    v12 = v10;

    -[KVACRequestWrapper requestData](v12, "requestData");
    v13 = objc_claimAutoreleasedReturnValue();
    requestData = v7->_requestData;
    v7->_requestData = (NSData *)v13;

  }
  v15 = v7;
LABEL_6:

  return v15;
}

- (id)activateWithIssuanceData:(id)a3 error:(id *)a4
{
  id v6;
  KVACCredential *v7;
  void *v8;
  KVACPresentation *v9;
  KVACCredential *v10;

  v6 = a3;
  v7 = -[KVACCredential initWithIssuanceData:client:request:error:]([KVACCredential alloc], "initWithIssuanceData:client:request:error:", v6, self->_client, self->_request, a4);

  if (v7)
  {
    objc_msgSend(CFSTR("Test tag prefix"), "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[KVACPresentation initWithCredential:tagPrefix:error:]([KVACPresentation alloc], "initWithCredential:tagPrefix:error:", v7, v8, a4);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.KVAC.error"), 2, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v10 = 0;
      goto LABEL_7;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.KVAC.error"), 2, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v7;
LABEL_7:

  return v10;
}

- (NSData)requestData
{
  return self->_requestData;
}

- (_TtC16CryptoKitPrivate10KVACClient)client
{
  return self->_client;
}

- (_TtC16CryptoKitPrivate18KVACRequestWrapper)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
}

@end
