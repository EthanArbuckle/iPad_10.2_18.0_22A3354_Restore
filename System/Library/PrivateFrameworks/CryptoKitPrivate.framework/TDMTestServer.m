@implementation TDMTestServer

- (id)publicKey
{
  return -[TDMServer publicKey](self->_tdmServer, "publicKey");
}

- (TDMTestServer)init
{
  TDMTestServer *v2;
  _TtC16CryptoKitPrivate9TDMServer *v3;
  _TtC16CryptoKitPrivate9TDMServer *tdmServer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TDMTestServer;
  v2 = -[TDMTestServer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC16CryptoKitPrivate9TDMServer);
    tdmServer = v2->_tdmServer;
    v2->_tdmServer = v3;

  }
  return v2;
}

- (id)evaluate:(id)a3 error:(id *)a4
{
  void *v4;
  TDMEvaluation *v5;
  void *v6;
  void *v7;
  TDMEvaluation *v8;

  -[TDMServer evaluateWithBlindedElement:error:](self->_tdmServer, "evaluateWithBlindedElement:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [TDMEvaluation alloc];
    objc_msgSend(v4, "evaluatedElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proof");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TDMEvaluation initWithEvaluatedElement:proof:](v5, "initWithEvaluatedElement:proof:", v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)FSR
{
  return -[TDMServer info](self->_tdmServer, "info");
}

- (BOOL)validateOutput:(id)a3 TID:(id)a4
{
  _TtC16CryptoKitPrivate9TDMServer *tdmServer;
  id v7;
  id v8;
  void *v9;

  tdmServer = self->_tdmServer;
  v7 = a4;
  v8 = a3;
  -[TDMTestServer FSR](self, "FSR");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(tdmServer) = -[TDMServer verifyTokenWithOutput:TID:FSR:](tdmServer, "verifyTokenWithOutput:TID:FSR:", v8, v7, v9);

  return (char)tdmServer;
}

- (_TtC16CryptoKitPrivate9TDMServer)tdmServer
{
  return self->_tdmServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tdmServer, 0);
}

@end
