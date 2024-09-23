@implementation MDMRequestPlayLostModeSoundCommand

+ (id)requestType
{
  return CFSTR("PlayLostModeSound");
}

+ (unint64_t)requiredAccessRights
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestPlayLostModeSoundCommand;
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
  v4.super_class = (Class)MDMRequestPlayLostModeSoundCommand;
  return -[RMModelPayloadBase copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint8_t buf[16];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a3;
  v6 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__9;
  v32 = __Block_byref_object_dispose__9;
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  v27 = 0;
  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isManagedLostModeActive");

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __80__MDMRequestPlayLostModeSoundCommand_Handler__processRequest_completionHandler___block_invoke;
    v17[3] = &unk_24EB69210;
    v19 = &v22;
    v20 = &v28;
    v18 = v6;
    objc_msgSend(v9, "playSoundWithOptions:completion:", 0, v17);

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    DMCErrorArray();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A728], 12067, v11, *MEMORY[0x24BE2A588], 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v23[5];
    v23[5] = v12;

    v14 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v14, OS_LOG_TYPE_ERROR, "Could not play sound in MDM Lost Mode: Device is not in lost mode.", buf, 2u);
    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v23[5]);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v29[5];
    v29[5] = v15;

    (*((void (**)(id, uint64_t))v6 + 2))(v6, v29[5]);
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

uint64_t __80__MDMRequestPlayLostModeSoundCommand_Handler__processRequest_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v4 = *MEMORY[0x24BE2A728];
    v5 = a2;
    DMCErrorArray();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12080, v6, v5, *MEMORY[0x24BE2A588], 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1[5] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      v12 = v10;
      objc_msgSend(v11, "DMCVerboseDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_ERROR, "Could not to enable MDM Lost Mode: %{public}@", buf, 0xCu);

    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1[6] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

@end
