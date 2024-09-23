@implementation MPStatusKitOutgoingRatchet

- (MPStatusKitOutgoingRatchet)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  MPStatusKitOutgoingRatchet *v7;
  _TtC17MessageProtection17SKOutgoingRatchet *v8;
  MPStatusKitOutgoingRatchet *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPStatusKitOutgoingRatchet;
  v7 = -[MPStatusKitOutgoingRatchet init](&v11, sel_init);
  if (!v7
    || (v8 = -[SKOutgoingRatchet initWithData:error:]([_TtC17MessageProtection17SKOutgoingRatchet alloc], "initWithData:error:", v6, a4), -[MPStatusKitOutgoingRatchet setRatchet:](v7, "setRatchet:", v8), v8, -[MPStatusKitOutgoingRatchet ratchet](v7, "ratchet"), v9 = (MPStatusKitOutgoingRatchet *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    v9 = v7;
  }

  return v9;
}

- (MPStatusKitOutgoingRatchet)init
{
  MPStatusKitOutgoingRatchet *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPStatusKitOutgoingRatchet;
  v2 = -[MPStatusKitOutgoingRatchet init](&v5, sel_init);
  if (v2)
  {
    +[SKOutgoingRatchet generate](_TtC17MessageProtection17SKOutgoingRatchet, "generate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStatusKitOutgoingRatchet setRatchet:](v2, "setRatchet:", v3);

  }
  return v2;
}

- (id)currentSubscriptionKeys
{
  void *v2;
  void *v3;

  -[MPStatusKitOutgoingRatchet ratchet](self, "ratchet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentSubscriptionKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)ratchetForward
{
  void *v2;
  char v3;

  -[MPStatusKitOutgoingRatchet ratchet](self, "ratchet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ratchetForward");

  return v3;
}

- (id)sealStatus:(id)a3 authenticating:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[MPStatusKitOutgoingRatchet ratchet](self, "ratchet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sealMessage:authenticating:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)serializedData
{
  void *v2;
  void *v3;

  -[MPStatusKitOutgoingRatchet ratchet](self, "ratchet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)signingKeyIdentifier
{
  void *v2;
  void *v3;

  -[MPStatusKitOutgoingRatchet ratchet](self, "ratchet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signingKeyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_TtC17MessageProtection17SKOutgoingRatchet)ratchet
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
