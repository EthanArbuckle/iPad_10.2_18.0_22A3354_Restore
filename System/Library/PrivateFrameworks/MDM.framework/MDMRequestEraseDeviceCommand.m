@implementation MDMRequestEraseDeviceCommand

+ (id)requestType
{
  return CFSTR("EraseDevice");
}

+ (unint64_t)requiredAccessRights
{
  return 8;
}

+ (id)requestWithPreserveDataPlan:(id)a3 disallowProximitySetup:(id)a4 PIN:(id)a5 obliterationBehavior:(id)a6 returnToService:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  v17 = v16;
  v18 = (void *)MEMORY[0x24BDBD1C0];
  if (v15)
    v19 = v15;
  else
    v19 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v16, "setCommandPreserveDataPlan:", v19);

  if (v14)
    v20 = v14;
  else
    v20 = v18;
  objc_msgSend(v17, "setCommandDisallowProximitySetup:", v20);

  objc_msgSend(v17, "setCommandPIN:", v13);
  objc_msgSend(v17, "setCommandObliterationBehavior:", v12);

  objc_msgSend(v17, "setCommandReturnToService:", v11);
  return v17;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  uint64_t v11;

  v8 = a3;
  v9 = 0;
  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("PreserveDataPlan"), CFSTR("commandPreserveDataPlan"), 0, MEMORY[0x24BDBD1C0], a5))
  {
    v9 = 0;
    if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("DisallowProximitySetup"), CFSTR("commandDisallowProximitySetup"), 0, MEMORY[0x24BDBD1C0], a5))
    {
      v9 = 0;
      if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("PIN"), CFSTR("commandPIN"), 0, 0, a5))
      {
        v9 = 0;
        if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("ObliterationBehavior"), CFSTR("commandObliterationBehavior"), 0, 0, a5))
        {
          LOWORD(v11) = a4;
          v9 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("ReturnToService"), CFSTR("commandReturnToService"), objc_opt_class(), 0, 0, v11, a5);
        }
      }
    }
  }

  return v9;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  signed __int16 v15;

  v5 = (void *)objc_opt_new();
  -[MDMRequestEraseDeviceCommand commandPreserveDataPlan](self, "commandPreserveDataPlan");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDBD1C0];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("PreserveDataPlan"), v6, 0, MEMORY[0x24BDBD1C0]);

  -[MDMRequestEraseDeviceCommand commandDisallowProximitySetup](self, "commandDisallowProximitySetup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("DisallowProximitySetup"), v8, 0, v7);

  -[MDMRequestEraseDeviceCommand commandPIN](self, "commandPIN");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("PIN"), v9, 0, 0);

  -[MDMRequestEraseDeviceCommand commandObliterationBehavior](self, "commandObliterationBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ObliterationBehavior"), v10, 0, 0);

  -[MDMRequestEraseDeviceCommand commandReturnToService](self, "commandReturnToService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__MDMRequestEraseDeviceCommand_serializeWithType___block_invoke;
  v14[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v15 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("ReturnToService"), v11, v14, 0, 0);

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

uint64_t __50__MDMRequestEraseDeviceCommand_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MDMRequestEraseDeviceCommand;
  v4 = -[RMModelPayloadBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_commandPreserveDataPlan, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSNumber copy](self->_commandDisallowProximitySetup, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_commandPIN, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[NSString copy](self->_commandObliterationBehavior, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  v13 = -[MDMRequestEraseDeviceCommand_ReturnToService copy](self->_commandReturnToService, "copy");
  v14 = (void *)v4[10];
  v4[10] = v13;

  return v4;
}

- (NSNumber)commandPreserveDataPlan
{
  return self->_commandPreserveDataPlan;
}

- (void)setCommandPreserveDataPlan:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)commandDisallowProximitySetup
{
  return self->_commandDisallowProximitySetup;
}

- (void)setCommandDisallowProximitySetup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)commandPIN
{
  return self->_commandPIN;
}

- (void)setCommandPIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)commandObliterationBehavior
{
  return self->_commandObliterationBehavior;
}

- (void)setCommandObliterationBehavior:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (MDMRequestEraseDeviceCommand_ReturnToService)commandReturnToService
{
  return self->_commandReturnToService;
}

- (void)setCommandReturnToService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandReturnToService, 0);
  objc_storeStrong((id *)&self->_commandObliterationBehavior, 0);
  objc_storeStrong((id *)&self->_commandPIN, 0);
  objc_storeStrong((id *)&self->_commandDisallowProximitySetup, 0);
  objc_storeStrong((id *)&self->_commandPreserveDataPlan, 0);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  dispatch_semaphore_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  void *v35;
  _BOOL4 v36;
  NSObject *v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  BOOL v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  id v75;
  _QWORD v76[5];
  NSObject *v77;
  __int128 *p_buf;
  id v79;
  id v80;
  id v81;
  __int128 buf;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v75 = a3;
  v6 = (void (**)(id, void *))a4;
  -[MDMRequestEraseDeviceCommand commandPreserveDataPlan](self, "commandPreserveDataPlan");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  -[MDMRequestEraseDeviceCommand commandDisallowProximitySetup](self, "commandDisallowProximitySetup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  -[MDMRequestEraseDeviceCommand commandReturnToService](self, "commandReturnToService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commandEnabled");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (!v13)
  {
    v21 = 0;
LABEL_10:
    -[MDMRequestBase delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "willTerminateProcess:", v23);

    v24 = dispatch_semaphore_create(0);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v83 = 0x3032000000;
    v84 = __Block_byref_object_copy__7;
    v85 = __Block_byref_object_dispose__7;
    v86 = 0;
    v25 = objc_alloc_init(MEMORY[0x24BE2E758]);
    objc_msgSend(v25, "setHideProgress:", 1);
    objc_msgSend(v25, "setEraseDataPlan:", v8 ^ 1u);
    objc_msgSend(v25, "setDisallowProximitySetup:", v10);
    if (v13)
    {
      objc_msgSend(v21, "generateExclusionPaths");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setExclusionPaths:", v26);

    }
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2E760]), "initWithMode:options:reason:", 4, v25, CFSTR("mdmd erase device command"));
    objc_msgSend(MEMORY[0x24BE2E768], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x24BDAC760];
    v76[1] = 3221225472;
    v76[2] = __74__MDMRequestEraseDeviceCommand_Handler__processRequest_completionHandler___block_invoke;
    v76[3] = &unk_24EB692A0;
    p_buf = &buf;
    v76[4] = self;
    v29 = v24;
    v77 = v29;
    objc_msgSend(v28, "resetWithRequest:completion:", v27, v76);

    dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v30);

    _Block_object_dispose(&buf, 8);
    goto LABEL_18;
  }
  v14 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_222CB9000, v14, OS_LOG_TYPE_DEFAULT, "ReturnToService option is selected", (uint8_t *)&buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "enrollmentServerInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dmc_visibleRemoteManagementAccounts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count") == 0;

    if (!v19)
    {
      v20 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_222CB9000, v20, OS_LOG_TYPE_ERROR, "Device is enrolled with Apple Bussiness Essentials.", (uint8_t *)&buf, 2u);
      }
LABEL_17:
      -[MDMRequestEraseDeviceCommand _eraseDeviceNotSupporttedError](self, "_eraseDeviceNotSupporttedError");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v21);
      v29 = objc_claimAutoreleasedReturnValue();
      v6[2](v6, v29);
      goto LABEL_18;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "personaID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32 == 0;

  if (!v33)
  {
    v34 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_222CB9000, v34, OS_LOG_TYPE_ERROR, "Device has enterprise persona.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v35, "isSupervised") & 1) != 0)
  {

  }
  else
  {
    v36 = +[MDMFindMyUtilities isActivationLockOn](MDMFindMyUtilities, "isActivationLockOn");

    if (v36)
    {
      v37 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_222CB9000, v37, OS_LOG_TYPE_ERROR, "Failed to trigger return to service since activation lock is on", (uint8_t *)&buf, 2u);
      }
      -[MDMRequestEraseDeviceCommand _eraseDeviceActivationLockIsOnError](self, "_eraseDeviceActivationLockIsOnError");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v21);
      v29 = objc_claimAutoreleasedReturnValue();
      v6[2](v6, v29);
      goto LABEL_18;
    }
  }
  -[MDMRequestEraseDeviceCommand commandReturnToService](self, "commandReturnToService");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commandWiFiProfileData");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39 == 0;

  if (!v40)
  {
    v41 = (void *)MEMORY[0x24BE63CA8];
    -[MDMRequestEraseDeviceCommand commandReturnToService](self, "commandReturnToService");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "commandWiFiProfileData");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0;
    objc_msgSend(v41, "profileWithData:outError:", v43, &v81);
    v29 = objc_claimAutoreleasedReturnValue();
    v21 = v81;

    if (v21 || (-[NSObject containsPayloadOfClass:](v29, "containsPayloadOfClass:", objc_opt_class()) & 1) != 0)
    {
      v44 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_222CB9000, v44, OS_LOG_TYPE_ERROR, "Invalid WiFi profile: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      if (!v21)
      {
        -[MDMRequestEraseDeviceCommand _eraseDeviceContainsMDMPayloadError](self, "_eraseDeviceContainsMDMPayloadError");
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[MDMRequestEraseDeviceCommand _eraseDeviceInvalidWiFiProfileErrorWithUnderlayingError:](self, "_eraseDeviceInvalidWiFiProfileErrorWithUnderlayingError:", v21);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v46);

      goto LABEL_18;
    }

  }
  -[MDMRequestEraseDeviceCommand commandReturnToService](self, "commandReturnToService");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commandMDMProfileData");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48 == 0;

  if (v49)
  {
    objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "isSupervised");

    if (v54)
    {
      objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "isTeslaEnrolled");

      if ((v56 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "details");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x24BE2A480]);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v59 == 0;

        if (v60)
        {
LABEL_47:
          v63 = (void *)MEMORY[0x24BE2A4E0];
          -[MDMRequestEraseDeviceCommand commandReturnToService](self, "commandReturnToService");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "commandMDMProfileData");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[MDMRequestEraseDeviceCommand commandReturnToService](self, "commandReturnToService");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "commandWiFiProfileData");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = 0;
          objc_msgSend(v63, "preseveReturnToServiceDataWithMDMProfileData:wifiProfileData:error:", v74, v66, &v79);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v29 = v79;

          if (v29)
          {
            v67 = *(NSObject **)DMCLogObjects();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v29;
              _os_log_impl(&dword_222CB9000, v67, OS_LOG_TYPE_ERROR, "Failed to preserve data with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }
            objc_msgSend(v21, "clear");
            -[MDMRequestEraseDeviceCommand _eraseDeviceFailedToEraseErrorWithUnderlayingError:](self, "_eraseDeviceFailedToEraseErrorWithUnderlayingError:", v29);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, v69);

            goto LABEL_18;
          }
          goto LABEL_10;
        }
        v61 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_222CB9000, v61, OS_LOG_TYPE_ERROR, "MDM profile is required for cloud configuration with ConfigurationWebURL.", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        v73 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_222CB9000, v73, OS_LOG_TYPE_ERROR, "MDM profile is required for non-ADE enrolled supervised device.", (uint8_t *)&buf, 2u);
        }
      }
    }
    else
    {
      v62 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_222CB9000, v62, OS_LOG_TYPE_ERROR, "MDM profile is required for unsupervised device.", (uint8_t *)&buf, 2u);
      }
    }
    -[MDMRequestEraseDeviceCommand _eraseDeviceMissingMDMProfileError](self, "_eraseDeviceMissingMDMProfileError");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v21);
    v29 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, v29);
    goto LABEL_18;
  }
  v50 = (void *)MEMORY[0x24BE63CA8];
  -[MDMRequestEraseDeviceCommand commandReturnToService](self, "commandReturnToService");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commandMDMProfileData");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  objc_msgSend(v50, "profileWithData:outError:", v52, &v80);
  v29 = objc_claimAutoreleasedReturnValue();
  v21 = v80;

  if (!v21)
  {
    if (-[NSObject containsPayloadOfClass:](v29, "containsPayloadOfClass:", objc_opt_class()))
    {

      goto LABEL_47;
    }
    -[MDMRequestEraseDeviceCommand _eraseDeviceMissingMDMProfileError](self, "_eraseDeviceMissingMDMProfileError");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v70 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v21;
    _os_log_impl(&dword_222CB9000, v70, OS_LOG_TYPE_ERROR, "Invalid MDM profile: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  -[MDMRequestEraseDeviceCommand _eraseDeviceInvalidMDMProfileErrorWithUnderlayingError:](self, "_eraseDeviceInvalidMDMProfileErrorWithUnderlayingError:", v21);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v72);

LABEL_18:
}

intptr_t __74__MDMRequestEraseDeviceCommand_Handler__processRequest_completionHandler___block_invoke(intptr_t result, uint64_t a2)
{
  intptr_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "_eraseDeviceFailedToEraseErrorWithUnderlayingError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40);
      v8 = v6;
      objc_msgSend(v7, "DMCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_222CB9000, v8, OS_LOG_TYPE_ERROR, "Could not erase device: %{public}@", (uint8_t *)&v10, 0xCu);

    }
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 40));
  }
  return result;
}

- (id)_eraseDeviceActivationLockIsOnError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_eraseDeviceInvalidWiFiProfileErrorWithUnderlayingError:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  v5 = a3;
  objc_msgSend(CFSTR("MDM_ERROR_COULD_NOT_RETURN_TO_SERVICE_INVAID_WIFI_PROFILE"), "DMCAppendGreenteaSuffix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DMCUnformattedErrorArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12089, v7, v5, *MEMORY[0x24BE2A588], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_eraseDeviceInvalidMDMProfileErrorWithUnderlayingError:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  v5 = a3;
  DMCErrorArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12089, v6, v5, *MEMORY[0x24BE2A588], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_eraseDeviceContainsMDMPayloadError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_eraseDeviceMissingMDMProfileError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_eraseDeviceProvisionallyEnrolledError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_eraseDeviceNotSupporttedError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_eraseDeviceNotSupporttedOnSharedIPadError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_eraseDeviceNotTeslaEnrolledError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12089, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_eraseDeviceFailedToEraseErrorWithUnderlayingError:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  v5 = a3;
  DMCErrorArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12089, v6, v5, *MEMORY[0x24BE2A588], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
