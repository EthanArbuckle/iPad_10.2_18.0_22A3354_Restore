@implementation MDMRequestDisableLostModeCommand

+ (id)requestType
{
  return CFSTR("DisableLostMode");
}

+ (unint64_t)requiredAccessRights
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestDisableLostModeCommand;
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
  v4.super_class = (Class)MDMRequestDisableLostModeCommand;
  return -[RMModelPayloadBase copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  MDMLostDeviceLocationManager *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__6;
  v19[4] = __Block_byref_object_dispose__6;
  v20 = 0;
  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isManagedLostModeActive");

  if ((v8 & 1) != 0)
  {
    v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_DEFAULT, "Disabling lost mode...", buf, 2u);
    }
    v10 = objc_alloc_init(MDMLostDeviceLocationManager);
    -[MDMLostDeviceLocationManager lastLocationRequestedDateMessage](v10, "lastLocationRequestedDateMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v11;
        _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_DEFAULT, "Device was located while in lost mode. Alerting user with message “%{public}@”", buf, 0xCu);
      }
    }
    objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __78__MDMRequestDisableLostModeCommand_Handler__processRequest_completionHandler___block_invoke;
    v15[3] = &unk_24EB69210;
    v17 = v19;
    v18 = &v21;
    v16 = v6;
    objc_msgSend(v13, "disableManagedLostModeWithLocatedMessage:completion:", v11, v15);

  }
  else
  {
    v14 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v14, OS_LOG_TYPE_DEFAULT, "Device is not in lost mode. Reporting success regardless.", buf, 2u);
    }
    (*((void (**)(id, uint64_t))v6 + 2))(v6, v22[5]);
  }
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(&v21, 8);
}

uint64_t __78__MDMRequestDisableLostModeCommand_Handler__processRequest_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v4 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12069, v5, *MEMORY[0x24BE2A588], 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_ERROR, "Could not disable lost mode: %{public}@", buf, 0xCu);
    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

@end
