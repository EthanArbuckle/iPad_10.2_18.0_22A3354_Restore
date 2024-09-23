@implementation ENUserStoreClient

- (ENUserStoreClient)initWithUserStoreUrl:(id)a3 authenticationToken:(id)a4
{
  id v6;
  id v7;
  ENUserStoreClient *v8;
  void *v9;
  ENTHTTPClient *v10;
  ENTBinaryProtocol *v11;
  EDAMUserStoreClient *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ENUserStoreClient;
  v8 = -[ENStoreClient init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ENTHTTPClient initWithURL:]([ENTHTTPClient alloc], "initWithURL:", v9);
    v11 = -[ENTBinaryProtocol initWithTransport:]([ENTBinaryProtocol alloc], "initWithTransport:", v10);
    v12 = -[EDAMUserStoreClient initWithProtocol:]([EDAMUserStoreClient alloc], "initWithProtocol:", v11);
    -[ENUserStoreClient setClient:](v8, "setClient:", v12);

    -[ENUserStoreClient setAuthenticationToken:](v8, "setAuthenticationToken:", v7);
  }

  return v8;
}

- (id)authenticateToBusiness
{
  void *v3;
  void *v4;
  void *v5;

  -[ENUserStoreClient client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENUserStoreClient authenticationToken](self, "authenticationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authenticateToBusiness:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)checkVersionWithClientName:(id)a3 edamVersionMajor:(signed __int16)a4 edamVersionMinor:(signed __int16)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  signed __int16 v14;
  signed __int16 v15;

  v10 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __93__ENUserStoreClient_checkVersionWithClientName_edamVersionMajor_edamVersionMinor_completion___block_invoke;
  v12[3] = &unk_24F8B1F30;
  v12[4] = self;
  v13 = v10;
  v14 = a4;
  v15 = a5;
  v11 = v10;
  -[ENStoreClient invokeAsyncBoolBlock:completion:](self, "invokeAsyncBoolBlock:completion:", v12, a6);

}

- (void)fetchBootstrapInfoWithLocale:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__ENUserStoreClient_fetchBootstrapInfoWithLocale_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchUserWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__ENUserStoreClient_fetchUserWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8478;
  v3[4] = self;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v3, a3);
}

- (void)fetchPublicUserInfoWithUsername:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__ENUserStoreClient_fetchPublicUserInfoWithUsername_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchPremiumInfoWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__ENUserStoreClient_fetchPremiumInfoWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8478;
  v3[4] = self;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v3, a3);
}

- (void)fetchNoteStoreURLWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__ENUserStoreClient_fetchNoteStoreURLWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8478;
  v3[4] = self;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v3, a3);
}

- (void)authenticateToBusinessWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__ENUserStoreClient_authenticateToBusinessWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8478;
  v3[4] = self;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v3, a3);
}

- (void)revokeLongSessionWithAuthenticationToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__ENUserStoreClient_revokeLongSessionWithAuthenticationToken_completion___block_invoke;
  v8[3] = &unk_24F8BA480;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncBlock:completion:](self, "invokeAsyncBlock:completion:", v8, a4);

}

- (void)checkVersionWithClientName:(id)a3 edamVersionMajor:(signed __int16)a4 edamVersionMinor:(signed __int16)a5 success:(id)a6 failure:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a5;
  v9 = a4;
  v12 = a6;
  v13 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __98__ENUserStoreClient_checkVersionWithClientName_edamVersionMajor_edamVersionMinor_success_failure___block_invoke;
  v16[3] = &unk_24F8B1F58;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  -[ENUserStoreClient checkVersionWithClientName:edamVersionMajor:edamVersionMinor:completion:](self, "checkVersionWithClientName:edamVersionMajor:edamVersionMinor:completion:", a3, v9, v8, v16);

}

- (void)getBootstrapInfoWithLocale:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__ENUserStoreClient_getBootstrapInfoWithLocale_success_failure___block_invoke;
  v12[3] = &unk_24F8B1F80;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENUserStoreClient fetchBootstrapInfoWithLocale:completion:](self, "fetchBootstrapInfoWithLocale:completion:", a3, v12);

}

- (void)getUserWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__ENUserStoreClient_getUserWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B1FA8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENUserStoreClient fetchUserWithCompletion:](self, "fetchUserWithCompletion:", v10);

}

- (void)getPublicUserInfoWithUsername:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__ENUserStoreClient_getPublicUserInfoWithUsername_success_failure___block_invoke;
  v12[3] = &unk_24F8B1FD0;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENUserStoreClient fetchPublicUserInfoWithUsername:completion:](self, "fetchPublicUserInfoWithUsername:completion:", a3, v12);

}

- (void)getPremiumInfoWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__ENUserStoreClient_getPremiumInfoWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B1FF8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENUserStoreClient fetchPremiumInfoWithCompletion:](self, "fetchPremiumInfoWithCompletion:", v10);

}

- (void)getNoteStoreUrlWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__ENUserStoreClient_getNoteStoreUrlWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B8978;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENUserStoreClient fetchNoteStoreURLWithCompletion:](self, "fetchNoteStoreURLWithCompletion:", v10);

}

- (void)authenticateToBusinessWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__ENUserStoreClient_authenticateToBusinessWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B8A68;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENUserStoreClient authenticateToBusinessWithCompletion:](self, "authenticateToBusinessWithCompletion:", v10);

}

- (void)revokeLongSessionWithAuthenticationToken:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__ENUserStoreClient_revokeLongSessionWithAuthenticationToken_success_failure___block_invoke;
  v12[3] = &unk_24F8B8838;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENUserStoreClient revokeLongSessionWithAuthenticationToken:completion:](self, "revokeLongSessionWithAuthenticationToken:completion:", a3, v12);

}

- (EDAMUserStoreClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

uint64_t __78__ENUserStoreClient_revokeLongSessionWithAuthenticationToken_success_failure___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__ENUserStoreClient_authenticateToBusinessWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__ENUserStoreClient_getNoteStoreUrlWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__ENUserStoreClient_getPremiumInfoWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__ENUserStoreClient_getPublicUserInfoWithUsername_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__ENUserStoreClient_getUserWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__ENUserStoreClient_getBootstrapInfoWithLocale_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__ENUserStoreClient_checkVersionWithClientName_edamVersionMajor_edamVersionMinor_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__ENUserStoreClient_revokeLongSessionWithAuthenticationToken_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "revokeLongSession:", *(_QWORD *)(a1 + 40));

}

id __58__ENUserStoreClient_authenticateToBusinessWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authenticateToBusiness:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __53__ENUserStoreClient_fetchNoteStoreURLWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNoteStoreUrl:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __52__ENUserStoreClient_fetchPremiumInfoWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPremiumInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __64__ENUserStoreClient_fetchPublicUserInfoWithUsername_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPublicUserInfo:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __45__ENUserStoreClient_fetchUserWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getUser:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __61__ENUserStoreClient_fetchBootstrapInfoWithLocale_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getBootstrapInfo:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __93__ENUserStoreClient_checkVersionWithClientName_edamVersionMajor_edamVersionMinor_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "checkVersion:edamVersionMajor:edamVersionMinor:", *(_QWORD *)(a1 + 40), *(__int16 *)(a1 + 48), *(__int16 *)(a1 + 50));

  return v3;
}

+ (id)userStoreClientWithUrl:(id)a3 authenticationToken:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUserStoreUrl:authenticationToken:", v7, v6);

  return v8;
}

@end
