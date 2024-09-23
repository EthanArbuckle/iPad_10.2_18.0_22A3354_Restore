@implementation DIIdentityProofingSession

- (DIIdentityProofingSession)init
{
  DIIdentityProofingSession *v2;
  _TtC7CoreIDV23IdentityProofingSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIIdentityProofingSession;
  v2 = -[DIIdentityProofingSession init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC7CoreIDV23IdentityProofingSession);
    -[DIIdentityProofingSession setProofingSession:](v2, "setProofingSession:", v3);

  }
  return v2;
}

- (void)cancelProofingWithState:(id)a3 country:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DIIdentityProofingSession proofingSession](self, "proofingSession");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancelProofingWithState:country:completionHandler:", v10, v9, v8);

}

- (_TtC7CoreIDV23IdentityProofingSession)proofingSession
{
  return self->_proofingSession;
}

- (void)setProofingSession:(id)a3
{
  objc_storeStrong((id *)&self->_proofingSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proofingSession, 0);
}

@end
