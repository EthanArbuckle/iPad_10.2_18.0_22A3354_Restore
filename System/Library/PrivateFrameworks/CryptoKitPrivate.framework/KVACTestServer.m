@implementation KVACTestServer

- (KVACTestServer)init
{
  KVACTestServer *v2;
  _TtC16CryptoKitPrivate10KVACServer *v3;
  _TtC16CryptoKitPrivate10KVACServer *server;
  uint64_t v5;
  NSData *keyId;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KVACTestServer;
  v2 = -[KVACTestServer init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC16CryptoKitPrivate10KVACServer);
    server = v2->_server;
    v2->_server = v3;

    -[KVACServer keyId](v2->_server, "keyId");
    v5 = objc_claimAutoreleasedReturnValue();
    keyId = v2->_keyId;
    v2->_keyId = (NSData *)v5;

  }
  return v2;
}

- (id)issueWithRequestData:(id)a3 error:(id *)a4
{
  void *v5;
  KVACIssuance *v6;

  -[KVACServer issueWithRequestData:error:](self->_server, "issueWithRequestData:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[KVACIssuance initWithIssuance:]([KVACIssuance alloc], "initWithIssuance:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.KVAC.error"), 1, 0);
    v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)verifyWithPresentationData:(id)a3 tokenChallenge:(id)a4
{
  return -[KVACServer verifyWithPresentationData:tokenChallenge:](self->_server, "verifyWithPresentationData:tokenChallenge:", a3, a4);
}

- (NSData)keyId
{
  return self->_keyId;
}

- (_TtC16CryptoKitPrivate10KVACServer)server
{
  return self->_server;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_keyId, 0);
}

@end
