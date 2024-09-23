@implementation DIIdentityProvisioningSession

- (DIIdentityProvisioningSession)init
{
  DIIdentityProvisioningSession *v2;
  _TtC7CoreIDV27IdentityProvisioningSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIIdentityProvisioningSession;
  v2 = -[DIIdentityProvisioningSession init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC7CoreIDV27IdentityProvisioningSession);
    -[DIIdentityProvisioningSession setProvisioningSession:](v2, "setProvisioningSession:", v3);

  }
  return v2;
}

- (void)generateIdentityProvisioningAttestationsWithCredential:(id)a3 pairingID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DIIdentityProvisioningSession provisioningSession](self, "provisioningSession");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generateIdentityProvisioningAttestationsWithCredentialIdentifier:pairingID:completionHandler:", v10, v9, v8);

}

- (_TtC7CoreIDV27IdentityProvisioningSession)provisioningSession
{
  return self->_provisioningSession;
}

- (void)setProvisioningSession:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningSession, 0);
}

@end
