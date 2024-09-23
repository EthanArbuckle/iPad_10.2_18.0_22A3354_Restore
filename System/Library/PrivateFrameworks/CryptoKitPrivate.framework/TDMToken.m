@implementation TDMToken

- (TDMToken)initWithTID:(id)a3
{
  id v4;
  TDMToken *v5;
  _TtC16CryptoKitPrivate9TDMClient *v6;
  _TtC16CryptoKitPrivate9TDMClient *tdmClient;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TDMToken;
  v5 = -[TDMToken init](&v9, sel_init);
  if (v5)
  {
    v6 = -[TDMClient initWithTID:]([_TtC16CryptoKitPrivate9TDMClient alloc], "initWithTID:", v4);
    tdmClient = v5->_tdmClient;
    v5->_tdmClient = v6;

  }
  return v5;
}

- (id)blindedElement
{
  return -[TDMClient blindedElement](self->_tdmClient, "blindedElement");
}

- (id)finalizeWithEvaluatedElement:(id)a3 proof:(id)a4 publicKey:(id)a5 fsr:(id)a6 error:(id *)a7
{
  return -[TDMClient finalizeWithFSR:evaluatedElement:proof:publicKey:error:](self->_tdmClient, "finalizeWithFSR:evaluatedElement:proof:publicKey:error:", a6, a3, a4, a5, a7);
}

- (_TtC16CryptoKitPrivate9TDMClient)tdmClient
{
  return self->_tdmClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tdmClient, 0);
}

@end
