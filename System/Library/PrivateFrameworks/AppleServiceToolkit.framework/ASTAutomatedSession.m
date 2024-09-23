@implementation ASTAutomatedSession

+ (id)sessionWithSerialNumber:(id)a3 profile:(id)a4 tests:(id)a5 authInfoHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  +[ASTIdentity identityWithSerialNumber:](ASTIdentity, "identityWithSerialNumber:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentity:profile:tests:authInfoHandler:", v13, v12, v11, v10);

  return v14;
}

- (ASTAutomatedSession)initWithIdentity:(id)a3 profile:(id)a4 tests:(id)a5 authInfoHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ASTAutomatedSession *v15;
  ASTAutomatedSession *v16;
  uint64_t v17;
  id authInfoHandler;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ASTAutomatedSession;
  v15 = -[ASTAutomatedSession init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identity, a3);
    v17 = MEMORY[0x22E31C3E0](v14);
    authInfoHandler = v16->_authInfoHandler;
    v16->_authInfoHandler = (id)v17;

    objc_storeStrong((id *)&v16->_profile, a4);
    objc_storeStrong((id *)&v16->_tests, a5);
  }

  return v16;
}

+ (id)sessionWithIdentity:(id)a3 profile:(id)a4 tests:(id)a5 authInfoHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentity:profile:tests:authInfoHandler:", v13, v12, v11, v10);

  return v14;
}

+ (void)sessionExistsForSerialNumbers:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        +[ASTIdentity identityWithSerialNumber:](ASTIdentity, "identityWithSerialNumber:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16), (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  objc_msgSend(a1, "sessionExistsForIdentities:ticketNumber:completionHandler:", v11, v9, v10);
}

+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__ASTAutomatedSession_sessionExistsForIdentities_ticketNumber_completionHandler___block_invoke;
  v9[3] = &unk_24F969B98;
  v10 = v7;
  v8 = v7;
  +[ASTSession sessionStatusForIdentities:ticketNumber:completionHandler:](ASTRemoteServerSession, "sessionStatusForIdentities:ticketNumber:completionHandler:", a3, a4, v9);

}

uint64_t __81__ASTAutomatedSession_sessionExistsForIdentities_ticketNumber_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)executeWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  intptr_t (*v16)(uint64_t, char);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  -[ASTAutomatedSession setCompletion:](self, "setCompletion:", v4);
  v5 = dispatch_semaphore_create(0);
  v6 = (void *)objc_opt_class();
  -[ASTAutomatedSession identity](self, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __45__ASTAutomatedSession_executeWithCompletion___block_invoke;
  v17 = &unk_24F96A160;
  v19 = &v20;
  v9 = v5;
  v18 = v9;
  objc_msgSend(v6, "sessionExistsForIdentities:ticketNumber:completionHandler:", v8, 0, &v14);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (v21[5])
  {
    v4[2](v4);
  }
  else
  {
    -[ASTAutomatedSession identity](self, "identity", v14, v15, v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASTRemoteServerSession sessionWithIdentity:](ASTRemoteServerSession, "sessionWithIdentity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTAutomatedSession setSession:](self, "setSession:", v11);

    -[ASTAutomatedSession session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    -[ASTAutomatedSession session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "start");

  }
  _Block_object_dispose(&v20, 8);

}

intptr_t __45__ASTAutomatedSession_executeWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -1006, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)end
{
  void *v3;
  id v4;

  -[ASTAutomatedSession session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASTAutomatedSession session](self, "session");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "end");

  }
}

- (void)session:(id)a3 startTest:(id)a4 parameters:(id)a5 testResult:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;

  v8 = a4;
  v9 = a6;
  -[ASTAutomatedSession tests](self, "tests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "files");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12
      && (v13 = (void *)v12,
          objc_msgSend(v11, "files"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "count"),
          v14,
          v13,
          v15))
    {
      objc_msgSend(v11, "files");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sealWithSealableFiles:", v16);
    }
    else
    {
      objc_msgSend(v11, "payload");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "signature");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sealWithPayload:signature:", v16, v17);

    }
  }
  else
  {
    ASTLogHandleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ASTAutomatedSession session:startTest:parameters:testResult:].cold.1((uint64_t)v8, v16);
  }

  -[ASTAutomatedSession session](self, "session");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendTestResult:error:", v9, 0);

}

- (void)session:(id)a3 profile:(id)a4 filteredByComponents:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  -[ASTAutomatedSession profile](self, "profile");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendProfileResult:error:", v7, 0);

}

- (void)session:(id)a3 didEndWithError:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD);

  v5 = a4;
  -[ASTAutomatedSession completion](self, "completion");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v6)[2](v6, v5);

  -[ASTAutomatedSession setSession:](self, "setSession:", 0);
  -[ASTAutomatedSession setCompletion:](self, "setCompletion:", 0);
}

- (void)session:(id)a3 generateAuthInfoWithNonce:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ASTAutomatedSession_session_generateAuthInfoWithNonce___block_invoke;
  block[3] = &unk_24F969B70;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __57__ASTAutomatedSession_session_generateAuthInfoWithNonce___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "authInfoHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "authInfoHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "sendAuthInfoResult:error:", v4, 0);

}

- (ASTIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ASTRemoteServerSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSDictionary)tests
{
  return self->_tests;
}

- (void)setTests:(id)a3
{
  objc_storeStrong((id *)&self->_tests, a3);
}

- (ASTProfileResult)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (ASTAuthInfoResult)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(id)a3
{
  objc_storeStrong((id *)&self->_authInfo, a3);
}

- (id)authInfoHandler
{
  return self->_authInfoHandler;
}

- (void)setAuthInfoHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authInfoHandler, 0);
  objc_storeStrong((id *)&self->_authInfo, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_tests, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)session:(uint64_t)a1 startTest:(NSObject *)a2 parameters:testResult:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22D91B000, a2, OS_LOG_TYPE_ERROR, "No result available for requested testId [%@]", (uint8_t *)&v2, 0xCu);
}

@end
