@implementation DCBiometricStore

- (DCBiometricStore)init
{
  DCBiometricStore *v2;
  DCBiometricStoreClient *v3;
  DCBiometricStoreClient *client;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DCBiometricStore;
  v2 = -[DCBiometricStore init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(DCBiometricStoreClient);
    client = v2->_client;
    v2->_client = v3;

  }
  return v2;
}

- (void)nonceForAuthorizationTokenWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonceForAuthorizationTokenWithCompletion:", v4);

}

- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DCBiometricStore client](self, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prearmCredentialWithAuthorizationToken:completion:", v7, v6);

}

- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DCBiometricStore client](self, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "establishPrearmTrustV2:completion:", v7, v6);

}

- (void)revokeCredentialAuthorizationToken:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "revokeCredentialAuthorizationToken:", v4);

}

- (void)bioBindingUnboundACL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bioBindingUnboundACL:", v4);

}

- (void)passcodeBindingUnboundACL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passcodeBindingUnboundACL:", v4);

}

- (void)setGlobalAuthACL:(id)a3 ofType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[DCBiometricStore client](self, "client");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setGlobalAuthACL:ofType:completion:", v9, a4, v8);

}

- (void)setModifiedGlobalAuthACL:(id)a3 externalizedLAContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DCBiometricStore client](self, "client");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setModifiedGlobalAuthACL:externalizedLAContext:completion:", v10, v9, v8);

}

- (void)globalAuthACLWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalAuthACLWithCompletion:", v4);

}

- (void)deleteGlobalAuthACLWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__DCBiometricStore_deleteGlobalAuthACLWithCompletion___block_invoke;
  v6[3] = &unk_24C306000;
  v7 = v4;
  v5 = v4;
  -[DCBiometricStore deleteGlobalAuthACLWithOutcomeCompletion:](self, "deleteGlobalAuthACLWithOutcomeCompletion:", v6);

}

uint64_t __54__DCBiometricStore_deleteGlobalAuthACLWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteGlobalAuthACLWithOutcomeCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteGlobalAuthACLWithCompletion:", v4);

}

- (void)globalAuthACLTemplateUUIDsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__DCBiometricStore_globalAuthACLTemplateUUIDsWithCompletion___block_invoke;
  v7[3] = &unk_24C306028;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "globalAuthACLTemplateUUIDsWithCompletion:", v7);

}

uint64_t __61__DCBiometricStore_globalAuthACLTemplateUUIDsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)globalAuthACLTemplateUUIDsAndCredentialCountWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalAuthACLTemplateUUIDsWithCompletion:", v4);

}

- (void)generatePhoneTokenWithNonce:(id)a3 keyBlob:(id)a4 pairingID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[DCBiometricStore client](self, "client");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "generatePhoneTokenWithNonce:keyBlob:pairingID:completion:", v13, v12, v11, v10);

}

- (void)generatePrearmTrustCertificateWithNonce:(id)a3 pairingID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DCBiometricStore client](self, "client");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generatePrearmTrustCertificateWithNonce:pairingID:completion:", v10, v9, v8);

}

- (void)migratePrearmTrustBlob:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DCBiometricStore client](self, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "migratePrearmTrustBlob:completion:", v7, v6);

}

- (void)credentialAuthenticationTokenStatus:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialAuthenticationTokenStatus:", v4);

}

- (void)getCASDCertificate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getCASDCertificate:", v4);

}

- (void)getGlobalProgenitorKeyAttestation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getGlobalProgenitorKeyAttestation:", v4);

}

- (void)getGlobalThirdPartyProgenitorKeyAttestation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getGlobalThirdPartyProgenitorKeyAttestation:", v4);

}

- (void)boundAppletPresentmentACL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundAppletPresentmentACL:", v4);

}

- (void)refreshProgenitorKeyDesignationsWithSessionHandoffToken:(id)a3 onlyIfNeeded:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[DCBiometricStore client](self, "client");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "refreshProgenitorKeyDesignationsWithSessionHandoffToken:onlyIfNeeded:completion:", v9, v5, v8);

}

- (void)clearProgenitorKeyDesignationsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCBiometricStore client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearProgenitorKeyDesignationsWithCompletion:", v4);

}

- (DCBiometricStoreClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
