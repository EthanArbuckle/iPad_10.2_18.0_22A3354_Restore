@implementation MDMRequestLogOutUserCommand

+ (id)requestType
{
  return CFSTR("LogOutUser");
}

+ (unint64_t)requiredAccessRights
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestLogOutUserCommand;
  return (unint64_t)objc_msgSendSuper2(&v3, sel_requiredAccessRights);
}

+ (id)request
{
  return (id)objc_opt_new();
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDMRequestLogOutUserCommand;
  return -[RMModelPayloadBase copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)shouldBlockUserSwitch
{
  return 0;
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(id, _QWORD);
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__8;
  v31 = __Block_byref_object_dispose__8;
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__8;
  v25 = __Block_byref_object_dispose__8;
  v26 = 0;
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isLoginUser");

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    DMCErrorArray();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", *MEMORY[0x24BE2A728], 12125, v12, 0, *MEMORY[0x24BE2A588], 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v22[5];
    v22[5] = v13;

    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v22[5]);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v28[5];
    v28[5] = v15;

    v7[2](v7, v28[5]);
  }
  else
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __73__MDMRequestLogOutUserCommand_Handler__processRequest_completionHandler___block_invoke;
    v17[3] = &unk_24EB692C8;
    v19 = &v21;
    v20 = &v27;
    v17[4] = self;
    v18 = v7;
    objc_msgSend(v8, "switchToLoginUserWithCompletionHandler:", v17);

  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

void __73__MDMRequestLogOutUserCommand_Handler__processRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if (v12)
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v4 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12124, v5, v12, *MEMORY[0x24BE2A588], 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didInitiateSwitchUser");
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
