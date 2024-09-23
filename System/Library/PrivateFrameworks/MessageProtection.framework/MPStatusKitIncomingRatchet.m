@implementation MPStatusKitIncomingRatchet

- (MPStatusKitIncomingRatchet)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  MPStatusKitIncomingRatchet *v7;
  _TtC17MessageProtection17SKIncomingRatchet *v8;
  MPStatusKitIncomingRatchet *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPStatusKitIncomingRatchet;
  v7 = -[MPStatusKitIncomingRatchet init](&v11, sel_init);
  if (!v7
    || (v8 = -[SKIncomingRatchet initWithData:error:]([_TtC17MessageProtection17SKIncomingRatchet alloc], "initWithData:error:", v6, a4), -[MPStatusKitIncomingRatchet setRatchet:](v7, "setRatchet:", v8), v8, -[MPStatusKitIncomingRatchet ratchet](v7, "ratchet"), v9 = (MPStatusKitIncomingRatchet *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    v9 = v7;
  }

  return v9;
}

- (MPStatusKitIncomingRatchet)initWithIndex:(unsigned __int16)a3 chainKey:(id)a4 signingKey:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  MPStatusKitIncomingRatchet *v12;
  _TtC17MessageProtection17SKIncomingRatchet *v13;
  MPStatusKitIncomingRatchet *v14;
  objc_super v16;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPStatusKitIncomingRatchet;
  v12 = -[MPStatusKitIncomingRatchet init](&v16, sel_init);
  if (!v12
    || (v13 = -[SKIncomingRatchet initWithKey:index:signingKey:error:]([_TtC17MessageProtection17SKIncomingRatchet alloc], "initWithKey:index:signingKey:error:", v10, v8, v11, a6), -[MPStatusKitIncomingRatchet setRatchet:](v12, "setRatchet:", v13), v13, -[MPStatusKitIncomingRatchet ratchet](v12, "ratchet"), v14 = (MPStatusKitIncomingRatchet *)objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    v14 = v12;
  }

  return v14;
}

- (id)unsealStatusWithIndex:(unsigned __int16)a3 encryptedMessage:(id)a4 authenticating:(id)a5 signature:(id)a6 error:(id *)a7
{
  unsigned int v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v10 = a3;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  -[MPStatusKitIncomingRatchet ratchet](self, "ratchet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "openStatusWithIndex:encryptedMessage:authenticating:signature:error:", v10, v14, v13, v12, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)serializedData
{
  void *v2;
  void *v3;

  -[MPStatusKitIncomingRatchet ratchet](self, "ratchet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)signingKeyIdentifier
{
  void *v2;
  void *v3;

  -[MPStatusKitIncomingRatchet ratchet](self, "ratchet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signingKeyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)maxForwardRatchetDelta
{
  return +[SKIncomingRatchet maxForwardRatchetDelta](_TtC17MessageProtection17SKIncomingRatchet, "maxForwardRatchetDelta");
}

- (_TtC17MessageProtection17SKIncomingRatchet)ratchet
{
  return self->_ratchet;
}

- (void)setRatchet:(id)a3
{
  objc_storeStrong((id *)&self->_ratchet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratchet, 0);
}

@end
