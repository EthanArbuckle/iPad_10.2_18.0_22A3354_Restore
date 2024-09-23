@implementation MDMConfiguration

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken_0 != -1)
    dispatch_once(&sharedConfiguration_onceToken_0, &__block_literal_global_2);
  return (id)sharedConfiguration_config_0;
}

uint64_t __39__MDMConfiguration_sharedConfiguration__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedConfiguration_config_0;
  sharedConfiguration_config_0 = v0;

  return objc_msgSend((id)sharedConfiguration_config_0, "refreshDetailsFromDisk");
}

- (MDMConfiguration)init
{
  MDMConfiguration *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *memberQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MDMConfiguration;
  v2 = -[MDMConfiguration init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MDMConfiguration member queue", v3);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)refreshDetailsFromDisk
{
  NSObject *v3;
  uint64_t v4;
  uint8_t buf[16];

  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v3, OS_LOG_TYPE_DEFAULT, "Refreshing MDM details.", buf, 2u);
  }
  v4 = 0;
  -[MDMConfiguration readConfigurationOutError:](self, "readConfigurationOutError:", &v4);
}

+ (BOOL)isUserEnrollmentDisregardingIdentityPresence
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v2 = (void *)MEMORY[0x1E0C99D50];
  MDMFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38B0], "DMCSafePropertyListWithData:options:format:error:", v4, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("UserEnrollment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0D1C150];
      DMCErrorArray();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:errorType:", v8, 12011, v9, *MEMORY[0x1E0D1C030], CFSTR("UserEnrollment"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v11 = objc_msgSend(v6, "BOOLValue");

  return v11;
}

- (BOOL)readConfigurationOutError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  NSObject *v16;
  uint64_t v17;
  BOOL v18;
  _QWORD block[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v5, OS_LOG_TYPE_DEBUG, "MDMConfiguration: readConfigurationOutError:", buf, 2u);
  }
  -[MDMConfiguration memberQueue](self, "memberQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MDMConfiguration_readConfigurationOutError___block_invoke;
  block[3] = &unk_1E98529F0;
  block[4] = self;
  block[5] = &v21;
  block[6] = &v27;
  dispatch_async_and_wait(v6, block);

  if (*((_BYTE *)v28 + 24))
  {
    v7 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4BF7000, v7, OS_LOG_TYPE_DEFAULT, "MDMConfiguration: readConfigurationOutError: Valid MDM installation found.", buf, 2u);
    }
    goto LABEL_17;
  }
  v8 = (void *)v22[5];
  if (v8)
  {
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D1C150]) & 1) != 0)
    {
      v10 = objc_msgSend((id)v22[5], "code") == 12079;

      if (v10)
      {
        v11 = *(NSObject **)(DMCLogObjects() + 8);
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_WORD *)buf = 0;
        v12 = "MDMConfiguration: readConfigurationOutError: No MDM installation found!";
        v13 = v11;
        v14 = OS_LOG_TYPE_DEFAULT;
        v15 = 2;
        goto LABEL_14;
      }
    }
    else
    {

    }
  }
  v16 = *(NSObject **)(DMCLogObjects() + 8);
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  v17 = v22[5];
  *(_DWORD *)buf = 138543362;
  v32 = v17;
  v12 = "MDMConfiguration: readConfigurationOutError: Invalid MDM installation found. Error: %{public}@";
  v13 = v16;
  v14 = OS_LOG_TYPE_ERROR;
  v15 = 12;
LABEL_14:
  _os_log_impl(&dword_1D4BF7000, v13, v14, v12, buf, v15);
LABEL_15:
  if (a3)
    *a3 = objc_retainAutorelease((id)v22[5]);
LABEL_17:
  v18 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v18;
}

void __46__MDMConfiguration_readConfigurationOutError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const __CFString *v83;
  const __CFString *v84;
  uint8_t v85[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "memberQueueForgetCurrentConfiguration");
  v2 = (void *)MEMORY[0x1E0C99D50];
  MDMFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38B0], "DMCSafePropertyListWithData:options:format:error:", v4, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0D1C150];
    DMCErrorArray();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x1E0D1C030];
    v38 = v34;
    v39 = v35;
    v40 = 12079;
LABEL_35:
    objc_msgSend(v38, "DMCErrorWithDomain:code:descriptionArray:errorType:", v39, v40, v36, v37, 0);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v45 = *(void **)(v44 + 40);
    *(_QWORD *)(v44 + 40) = v43;

    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0D1C150];
    DMCErrorArray();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x1E0D1C030];
    v38 = v41;
    v39 = v42;
    v40 = 12011;
    goto LABEL_35;
  }
  v6 = CFSTR("UserEnrollment");
  objc_msgSend(v5, "objectForKey:", CFSTR("UserEnrollment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsUserEnrollment:", objc_msgSend(v7, "BOOLValue"));

  v6 = CFSTR("PersonaID");
  objc_msgSend(v5, "objectForKey:", CFSTR("PersonaID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
  }
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setPersonaID:", v8);

  v6 = CFSTR("EnrollmentID");
  objc_msgSend(v5, "objectForKey:", CFSTR("EnrollmentID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
  }
  v9 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setEnrollmentID:", v9);

  v6 = CFSTR("EASEnrollmentID");
  objc_msgSend(v5, "objectForKey:", CFSTR("EASEnrollmentID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
  }
  v10 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setEasEnrollmentID:", v10);

  v6 = CFSTR("RMAccountIdentifier");
  objc_msgSend(v5, "objectForKey:", CFSTR("RMAccountIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
  }
  v11 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setRmAccountID:", v11);

  v6 = CFSTR("EnrollmentMode");
  objc_msgSend(v5, "objectForKey:", CFSTR("EnrollmentMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
  }
  v12 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setEnrollmentMode:", v12);

  v6 = CFSTR("ServerCapabilities");
  objc_msgSend(v5, "objectForKey:", CFSTR("ServerCapabilities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
  }
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueServerCapabilities:", v7);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.mdm.user-channel"));

  v6 = CFSTR("IdentityPersistentRef");
  objc_msgSend(v5, "objectForKey:", CFSTR("IdentityPersistentRef"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_53;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_53;
  v13 = objc_msgSend(v7, "copy");
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 112);
  *(_QWORD *)(v14 + 112) = v13;

  v6 = CFSTR("CheckInURLPinningCertificatePersistentRefs");
  objc_msgSend(v5, "objectForKey:", CFSTR("CheckInURLPinningCertificatePersistentRefs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
  }
  v16 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "personaID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "copyCertificatesWithPersistentIDs:useSystemKeychain:enforcePersonalPersona:", v7, 1, v17 != 0);
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueCheckInPinnedSecCertificateRefs:", v18);

  v6 = CFSTR("PinningRevocationCheckRequired");
  objc_msgSend(v5, "objectForKey:", CFSTR("PinningRevocationCheckRequired"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
  }
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueuePinningRevocationCheckRequired:", objc_msgSend(v7, "BOOLValue"));

  v19 = CFSTR("ManagingProfileIdentifier");
  objc_msgSend(v5, "objectForKey:", CFSTR("ManagingProfileIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueManagingProfileIdentifier:", v20);

  objc_msgSend(*(id *)(a1 + 32), "memberQueueManagingProfileIdentifier");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_64;
  v22 = (void *)v21;
  objc_msgSend(*(id *)(a1 + 32), "memberQueueManagingProfileIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_64;
  objc_msgSend(MEMORY[0x1E0D1C198], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hrnMode");

  if (v26 != 2)
  {
    v19 = CFSTR("Topic");
    objc_msgSend(v5, "objectForKey:", CFSTR("Topic"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMemberQueueTopic:", v27);

    objc_msgSend(*(id *)(a1 + 32), "memberQueueTopic");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      objc_msgSend(*(id *)(a1 + 32), "memberQueueTopic");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) == 0)
      {
LABEL_64:
        v78 = (void *)MEMORY[0x1E0CB35C8];
        v79 = *MEMORY[0x1E0D1C150];
        v84 = v19;
        DMCErrorArray();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "DMCErrorWithDomain:code:descriptionArray:errorType:", v79, 12011, v7, *MEMORY[0x1E0D1C030], v84, 0);
        v80 = objc_claimAutoreleasedReturnValue();
        v81 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v82 = *(void **)(v81 + 40);
        *(_QWORD *)(v81 + 40) = v80;

        goto LABEL_54;
      }
    }
  }
  v6 = CFSTR("ServerURL");
  objc_msgSend(v5, "objectForKey:", CFSTR("ServerURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_53;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_53;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueServerURL:", v32);

  v6 = CFSTR("CheckInURL");
  objc_msgSend(v5, "objectForKey:", CFSTR("CheckInURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v7);
      objc_msgSend(*(id *)(a1 + 32), "setMemberQueueCheckInURL:", v33);
      goto LABEL_37;
    }
LABEL_53:
    v62 = (void *)MEMORY[0x1E0CB35C8];
    v63 = *MEMORY[0x1E0D1C150];
    v83 = v6;
    DMCErrorArray();
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "DMCErrorWithDomain:code:descriptionArray:errorType:", v63, 12011, v64, *MEMORY[0x1E0D1C030], v83, 0);
    v65 = objc_claimAutoreleasedReturnValue();
    v66 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v67 = *(void **)(v66 + 40);
    *(_QWORD *)(v66 + 40) = v65;

LABEL_54:
    goto LABEL_55;
  }
  objc_msgSend(*(id *)(a1 + 32), "memberQueueServerURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueCheckInURL:", v46);

LABEL_37:
  v6 = CFSTR("AccessRights");
  objc_msgSend(v5, "objectForKey:", CFSTR("AccessRights"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_53;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_53;
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueAccessRights:", objc_msgSend(v7, "unsignedIntValue"));

  v6 = CFSTR("UseDevelopmentAPNS");
  objc_msgSend(v5, "objectForKey:", CFSTR("UseDevelopmentAPNS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
  }
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueUseDevelopmentAPNS:", objc_msgSend(v7, "BOOLValue"));

  v6 = CFSTR("SignMessage");
  objc_msgSend(v5, "objectForKey:", CFSTR("SignMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
  }
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueSignMessage:", objc_msgSend(v7, "BOOLValue"));

  v6 = CFSTR("IsProfileLocked");
  objc_msgSend(v5, "objectForKey:", CFSTR("IsProfileLocked"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_53;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = objc_msgSend(v7, "BOOLValue");

  v19 = CFSTR("PushMagic");
  objc_msgSend(v5, "objectForKey:", CFSTR("PushMagic"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueuePushMagic:", v47);

  objc_msgSend(*(id *)(a1 + 32), "memberQueuePushMagic");
  v48 = objc_claimAutoreleasedReturnValue();
  if (!v48)
    goto LABEL_64;
  v49 = (void *)v48;
  objc_msgSend(*(id *)(a1 + 32), "memberQueuePushMagic");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v51 = objc_opt_isKindOfClass();

  if ((v51 & 1) == 0)
    goto LABEL_64;
  v19 = CFSTR("OrganizationInfo");
  objc_msgSend(v5, "objectForKey:", CFSTR("OrganizationInfo"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueOrganizationInfo:", v52);

  objc_msgSend(*(id *)(a1 + 32), "memberQueueOrganizationInfo");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    objc_msgSend(*(id *)(a1 + 32), "memberQueueOrganizationInfo");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v56 = objc_opt_isKindOfClass();

    if ((v56 & 1) == 0)
      goto LABEL_64;
  }
  v19 = CFSTR("MDMOptions");
  objc_msgSend(v5, "objectForKey:", CFSTR("MDMOptions"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueMDMOptions:", v57);

  objc_msgSend(*(id *)(a1 + 32), "memberQueueMDMOptions");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    objc_msgSend(*(id *)(a1 + 32), "memberQueueMDMOptions");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = objc_opt_isKindOfClass();

    if ((v61 & 1) == 0)
      goto LABEL_64;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_55:
  v68 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v68, OS_LOG_TYPE_DEBUG, "MDMConfiguration: readConfigurationOutError: doneblock", buf, 2u);
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v69 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v85 = 0;
      _os_log_impl(&dword_1D4BF7000, v69, OS_LOG_TYPE_DEFAULT, "MDMConfiguration: readConfigurationOutError: doneblock: Configuration not valid!", v85, 2u);
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v70 = (void *)MEMORY[0x1E0CB35C8];
      v71 = *MEMORY[0x1E0D1C150];
      DMCErrorArray();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      DMCLocalizedString();
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      DMCUSEnglishString();
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "DMCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", v71, 12011, v72, v73, v74, 0, *MEMORY[0x1E0D1C030]);
      v75 = objc_claimAutoreleasedReturnValue();
      v76 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v77 = *(void **)(v76 + 40);
      *(_QWORD *)(v76 + 40) = v75;

    }
    objc_msgSend(*(id *)(a1 + 32), "memberQueueForgetCurrentConfiguration");
  }

}

- (void)memberQueueForgetCurrentConfiguration
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D4BF7000, v3, OS_LOG_TYPE_DEBUG, "MDMConfiguration: Forgetting Current APNS Config, clearing push topics!", v4, 2u);
  }
  -[MDMConfiguration setIsUserEnrollment:](self, "setIsUserEnrollment:", 0);
  -[MDMConfiguration setEnrollmentID:](self, "setEnrollmentID:", 0);
  -[MDMConfiguration setPersonaID:](self, "setPersonaID:", 0);
  -[MDMConfiguration setEasEnrollmentID:](self, "setEasEnrollmentID:", 0);
  -[MDMConfiguration setRmAccountID:](self, "setRmAccountID:", 0);
  -[MDMConfiguration setEnrollmentMode:](self, "setEnrollmentMode:", 0);
  -[MDMConfiguration setSupportUserChannel:](self, "setSupportUserChannel:", 0);
  -[MDMConfiguration setIdentityPersistentID:](self, "setIdentityPersistentID:", 0);
  -[MDMConfiguration setMemberQueueManagingProfileIdentifier:](self, "setMemberQueueManagingProfileIdentifier:", 0);
  if (-[MDMConfiguration memberQueueIdentity](self, "memberQueueIdentity"))
  {
    CFRelease(-[MDMConfiguration memberQueueIdentity](self, "memberQueueIdentity"));
    -[MDMConfiguration setMemberQueueIdentity:](self, "setMemberQueueIdentity:", 0);
  }
  -[MDMConfiguration setMemberQueueCheckInPinnedSecCertificateRefs:](self, "setMemberQueueCheckInPinnedSecCertificateRefs:", 0);
  -[MDMConfiguration setMemberQueuePinningRevocationCheckRequired:](self, "setMemberQueuePinningRevocationCheckRequired:", 0);
  -[MDMConfiguration setMemberQueueSignMessage:](self, "setMemberQueueSignMessage:", 0);
  -[MDMConfiguration setMemberQueueTopic:](self, "setMemberQueueTopic:", 0);
  -[MDMConfiguration setMemberQueueOrganizationInfo:](self, "setMemberQueueOrganizationInfo:", 0);
  -[MDMConfiguration setMemberQueueServerURL:](self, "setMemberQueueServerURL:", 0);
  -[MDMConfiguration setMemberQueueCheckInURL:](self, "setMemberQueueCheckInURL:", 0);
  -[MDMConfiguration setMemberQueueMDMOptions:](self, "setMemberQueueMDMOptions:", 0);
  -[MDMConfiguration setMemberQueueAccessRights:](self, "setMemberQueueAccessRights:", 0);
  -[MDMConfiguration setMemberQueueUseDevelopmentAPNS:](self, "setMemberQueueUseDevelopmentAPNS:", 0);
  -[MDMConfiguration setMemberQueuePushMagic:](self, "setMemberQueuePushMagic:", 0);
  -[MDMConfiguration setMemberQueueServerCapabilities:](self, "setMemberQueueServerCapabilities:", 0);
}

- (__SecIdentity)copyMemberQueueIdentity
{
  NSObject *v3;
  __SecIdentity *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MDMConfiguration memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__MDMConfiguration_copyMemberQueueIdentity__block_invoke;
  v6[3] = &unk_1E98528C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (__SecIdentity *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __43__MDMConfiguration_copyMemberQueueIdentity__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const void *v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "identityPersistentID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "memberQueueIdentity"))
      goto LABEL_4;
    v3 = (void *)MEMORY[0x1E0D1C1D8];
    objc_msgSend(*(id *)(a1 + 32), "identityPersistentID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "personaID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMemberQueueIdentity:", objc_msgSend(v3, "copyIdentityWithPersistentID:useSystemKeychain:enforcePersonalPersona:", v4, 1, v5 != 0));

    if (objc_msgSend(*(id *)(a1 + 32), "memberQueueIdentity"))
    {
LABEL_4:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "memberQueueIdentity");
      v6 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v6)
        CFRetain(v6);
    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0D1C1F0], "isCurrentPersonaEnterprise"))
      {
        v7 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_1D4BF7000, v7, OS_LOG_TYPE_ERROR, "Failed to get MDM identity. This is likely due to the user initiating MDMConfiguration under enterprise persona, but don't have the entitlement to adopt personal persona.", v8, 2u);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "setIdentityPersistentID:", 0);
    }
  }
}

+ (unint64_t)getManagementStateForMAID
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;
  void *v8;

  +[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshDetailsFromDisk");
  +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshDetailsFromDisk");
  v4 = objc_msgSend(v3, "isSupervised");
  objc_msgSend(v2, "memberQueueManagingProfileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v5)
    {
      v6 = 3;
    }
    else if ((DMCIsSetupBuddyDone() & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v3, "enrollmentServerURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v6 = 6;
      else
        v6 = 0;
    }
  }
  else
  {
    v6 = v5 != 0;
  }

  return v6;
}

+ (BOOL)isDataSeparated
{
  void *v2;
  void *v3;
  BOOL v4;

  +[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)isGetTokenSupportedByServer
{
  void *v2;
  NSObject *v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  uint8_t v8[16];
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  +[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshDetailsFromDisk");
  objc_msgSend(v2, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MDMConfiguration_isGetTokenSupportedByServer__block_invoke;
  block[3] = &unk_1E98529A0;
  v11 = &v12;
  v4 = v2;
  v10 = v4;
  dispatch_async_and_wait(v3, block);

  if (*((_BYTE *)v13 + 24))
  {
    v5 = 1;
  }
  else
  {
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D4BF7000, v6, OS_LOG_TYPE_ERROR, "MDMConfiguration: GetToken request not supported by MDM server", v8, 2u);
    }
    v5 = *((_BYTE *)v13 + 24) != 0;
  }

  _Block_object_dispose(&v12, 8);
  return v5;
}

void __47__MDMConfiguration_isGetTokenSupportedByServer__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueServerCapabilities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "containsObject:", CFSTR("com.apple.mdm.token"));

}

+ (id)getOrgTokenForMAID:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v11;
  uint8_t v12[8];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isGetTokenSupportedByServer") & 1) != 0)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__3;
    v24 = __Block_byref_object_dispose__3;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__3;
    v18 = __Block_byref_object_dispose__3;
    v19 = 0;
    v26 = CFSTR("TokenServiceType");
    v27[0] = CFSTR("com.apple.maid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__MDMConfiguration_getOrgTokenForMAID___block_invoke;
    v13[3] = &unk_1E9852A18;
    v13[4] = &v14;
    v13[5] = &v20;
    +[MDMCheckInRequest executeRequestForMessageType:channelType:requestDict:completionHandler:](MDMCheckInRequest, "executeRequestForMessageType:channelType:requestDict:completionHandler:", CFSTR("GetToken"), 0, v5, v13);
    if (v21[5])
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      v7 = (void *)objc_msgSend(v6, "initWithData:encoding:", v21[5], 4);
      if (v7)
        goto LABEL_17;
      v8 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1D4BF7000, v8, OS_LOG_TYPE_ERROR, "MDMConfiguration: Failed to covert TokenData to a string. The data might not be properly encoded.", v12, 2u);
      }
      if (!a3)
        goto LABEL_17;
      +[MDMConfiguration _emptyTokenErrorWithUnderlayingError:](MDMConfiguration, "_emptyTokenErrorWithUnderlayingError:", 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v15[5]
        || (v11 = (void *)objc_opt_new(),
            objc_msgSend(v11, "logErrorEventForTopic:reason:error:details:", *MEMORY[0x1E0D1C040], CFSTR("Failed to get org token"), v15[5], 0), v11, !a3))
      {
        v7 = 0;
        goto LABEL_17;
      }
      v9 = objc_retainAutorelease((id)v15[5]);
      v7 = 0;
    }
    *a3 = v9;
LABEL_17:

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);

    return v7;
  }
  if (a3)
  {
    objc_msgSend(a1, "getTokenUnsupportedError");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

void __39__MDMConfiguration_getOrgTokenForMAID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ResponseStatusCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == 200)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ResponseBody"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "DMCSafePropertyListWithData:options:format:error:", v9, 0, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TokenData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
      if (v6)
      {
        v17 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v24 = 138543362;
          v25 = (uint64_t)v6;
          _os_log_impl(&dword_1D4BF7000, v17, OS_LOG_TYPE_ERROR, "MDMConfiguration: TokenData was received with accompanying error: %{public}@", (uint8_t *)&v24, 0xCu);
        }
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = v16;
      v20 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v19;
    }
    else
    {
      v21 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v24 = 138543362;
        v25 = (uint64_t)v6;
        _os_log_impl(&dword_1D4BF7000, v21, OS_LOG_TYPE_ERROR, "MDMConfiguration: TokenData is empty in response dict from request, with error: %{public}@", (uint8_t *)&v24, 0xCu);
      }
      +[MDMConfiguration _emptyTokenErrorWithUnderlayingError:](MDMConfiguration, "_emptyTokenErrorWithUnderlayingError:", v6);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;
    }

  }
  else
  {
    v11 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ResponseStatusCode"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 134218242;
      v25 = objc_msgSend(v13, "integerValue");
      v26 = 2114;
      v27 = v6;
      _os_log_impl(&dword_1D4BF7000, v12, OS_LOG_TYPE_ERROR, "MDMConfiguration: Org Token request failed with Non 200 response from the server. Response code: %ld Error: %{public}@", (uint8_t *)&v24, 0x16u);

    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v15 = v6;
    v10 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v15;
  }

}

+ (id)getWatchPairingTokenForPhoneID:(id)a3 watchID:(id)a4 securityToken:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(a1, "isGetTokenSupportedByServer") & 1) != 0)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__3;
    v30 = __Block_byref_object_dispose__3;
    v31 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__3;
    v24 = __Block_byref_object_dispose__3;
    v25 = 0;
    v34[0] = CFSTR("SecurityToken");
    v34[1] = CFSTR("PhoneUDID");
    v35[0] = v12;
    v35[1] = v10;
    v34[2] = CFSTR("WatchUDID");
    v35[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = CFSTR("TokenServiceType");
    v32[1] = CFSTR("TokenParameters");
    v33[0] = CFSTR("com.apple.watch.pairing");
    v33[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __82__MDMConfiguration_getWatchPairingTokenForPhoneID_watchID_securityToken_outError___block_invoke;
    v19[3] = &unk_1E9852A18;
    v19[4] = &v20;
    v19[5] = &v26;
    +[MDMCheckInRequest executeRequestForMessageType:channelType:requestDict:completionHandler:](MDMCheckInRequest, "executeRequestForMessageType:channelType:requestDict:completionHandler:", CFSTR("GetToken"), 0, v14, v19);
    v15 = (void *)v27[5];
    if (v15)
    {
      v16 = v15;
    }
    else if (a6)
    {
      v17 = (void *)v21[5];
      if (v17)
        *a6 = objc_retainAutorelease(v17);
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);

  }
  else if (a6)
  {
    objc_msgSend(a1, "getTokenUnsupportedError");
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __82__MDMConfiguration_getWatchPairingTokenForPhoneID_watchID_securityToken_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  void **v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ResponseStatusCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == 200)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ResponseBody"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "DMCSafePropertyListWithData:options:format:error:", v9, 0, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TokenData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (v6)
      {
        v17 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v23 = 138543362;
          v24 = (uint64_t)v6;
          _os_log_impl(&dword_1D4BF7000, v17, OS_LOG_TYPE_ERROR, "MDMConfiguration: TokenData for pairing was received with accompanying error: %{public}@", (uint8_t *)&v23, 0xCu);
        }
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
      v18 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v19 = v16;
    }
    else
    {
      v20 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v23 = 138543362;
        v24 = (uint64_t)v6;
        _os_log_impl(&dword_1D4BF7000, v20, OS_LOG_TYPE_ERROR, "MDMConfiguration: TokenData for pairing is empty in response dict from request, with error: %{public}@", (uint8_t *)&v23, 0xCu);
      }
      v18 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v19 = v6;
    }
    v21 = v19;
    v22 = *v18;
    *v18 = v21;

  }
  else
  {
    v11 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ResponseStatusCode"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 134218242;
      v24 = objc_msgSend(v13, "integerValue");
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_1D4BF7000, v12, OS_LOG_TYPE_ERROR, "MDMConfiguration: Pairing Token request failed with Non 200 response from the server. Response code: %ld Error: %{public}@", (uint8_t *)&v23, 0x16u);

    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v15 = v6;
    v10 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v15;
  }

}

+ (id)getUnhidableAndUnlockableApps
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)getUnhidableApps
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)getUnlockableApps
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)fetchUnhidableAndUnlockableApps
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)setPropertyForKey:(id)a3 value:(id)a4 channelType:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  -[MDMConfiguration memberQueue](self, "memberQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MDMConfiguration_setPropertyForKey_value_channelType___block_invoke;
  block[3] = &unk_1E9852A40;
  v18 = &v20;
  v19 = a5;
  block[4] = self;
  v16 = v9;
  v17 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async_and_wait(v10, block);

  v13 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v13;
}

void __56__MDMConfiguration_setPropertyForKey_value_channelType___block_invoke(_QWORD *a1)
{
  void *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint32_t v20;
  id v21;
  id obj;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5] != 0;
  v4 = a1[8];
  v5 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_readPropertiesForChannelType:createIfMissingFile:error:", v4, v3, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", a1[5], a1[6]);
    v7 = (void *)a1[4];
    v8 = a1[8];
    v9 = *(_QWORD *)(a1[7] + 8);
    v21 = *(id *)(v9 + 40);
    v10 = objc_msgSend(v7, "_writeProperties:channelType:error:", v6, v8, &v21);
    objc_storeStrong((id *)(v9 + 40), v21);
    v11 = *(NSObject **)(DMCLogObjects() + 8);
    if ((v10 & 1) != 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v13 = a1[5];
        v12 = a1[6];
        *(_DWORD *)buf = 138543618;
        v24 = v12;
        v25 = 2114;
        v26 = v13;
        v14 = "MDMConfiguration: setPropertyForKey: %{public}@ value: %{public}@";
        v15 = v11;
        v16 = OS_LOG_TYPE_DEBUG;
LABEL_7:
        v20 = 22;
LABEL_10:
        _os_log_impl(&dword_1D4BF7000, v15, v16, v14, buf, v20);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "MDMConfiguration: setPropertyForKey: failed to write plist";
      v15 = v11;
      v16 = OS_LOG_TYPE_ERROR;
      v20 = 2;
      goto LABEL_10;
    }
  }
  else
  {
    v17 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = a1[6];
      v19 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v24 = v18;
      v25 = 2114;
      v26 = v19;
      v14 = "MDMConfiguration: setPropertyForKey: cannot set property for key %{public}@. Error: %{public}@";
      v15 = v17;
      v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
  }

}

- (id)getPropertyForKey:(id)a3 channelType:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  -[MDMConfiguration memberQueue](self, "memberQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__MDMConfiguration_getPropertyForKey_channelType___block_invoke;
  v11[3] = &unk_1E9852A68;
  v13 = &v15;
  v14 = a4;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  dispatch_async_and_wait(v7, v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __50__MDMConfiguration_getPropertyForKey_channelType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(*(id *)(a1 + 32), "_mdmPropertiesFilePathForChannelType:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38B0], "DMCSafePropertyListWithData:options:format:error:", v4, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v17 = 138543618;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      v12 = "MDMConfiguration: getPropertyForKey: %{public}@ value: %{public}@";
      v13 = v9;
      v14 = OS_LOG_TYPE_DEBUG;
      v15 = 22;
LABEL_7:
      _os_log_impl(&dword_1D4BF7000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else
  {
    v16 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      v12 = "MDMConfiguration: getPropertyForKey: cannot get property without plist";
      v13 = v16;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 2;
      goto LABEL_7;
    }
  }

}

- (id)_mdmPropertiesFilePathForChannelType:(unint64_t)a3
{
  if (a3 == 1)
  {
    MDMPropertiesUserFilePath();
    self = (MDMConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    MDMPropertiesFilePath();
    self = (MDMConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_readPropertiesForChannelType:(unint64_t)a3 createIfMissingFile:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;

  v6 = a4;
  -[MDMConfiguration memberQueueManagingProfileIdentifier](self, "memberQueueManagingProfileIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99D50];
    -[MDMConfiguration _mdmPropertiesFilePathForChannelType:](self, "_mdmPropertiesFilePathForChannelType:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataWithContentsOfFile:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "DMCSafePropertyListWithData:options:format:error:", v12, 2, 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (a5)
        {
          v14 = (void *)MEMORY[0x1E0CB35C8];
          v15 = *MEMORY[0x1E0D1C150];
          DMCErrorArray();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "DMCErrorWithDomain:code:descriptionArray:errorType:", v15, 12113, v16, *MEMORY[0x1E0D1C030], 0);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v17 = 0;
        goto LABEL_15;
      }
    }
    else if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v17 = v13;
    v13 = v17;
LABEL_15:

    goto LABEL_16;
  }
  if (a5)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D1C150];
    DMCErrorArray();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "DMCErrorWithDomain:code:descriptionArray:errorType:", v19, 12113, v12, *MEMORY[0x1E0D1C030], 0);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

    return v17;
  }
  v17 = 0;
  return v17;
}

- (BOOL)_writeProperties:(id)a3 channelType:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a3;
  -[MDMConfiguration _mdmPropertiesFilePathForChannelType:](self, "_mdmPropertiesFilePathForChannelType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "DMCWriteToBinaryFile:", v9);

  if (a5 && (v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D1C150];
    DMCErrorArray();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:errorType:", v12, 12114, v13, *MEMORY[0x1E0D1C030], 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)getTokenUnsupportedError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C020];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15008, v4, *MEMORY[0x1E0D1C030], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_emptyTokenErrorWithUnderlayingError:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0D1C020];
  v5 = a3;
  DMCErrorArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 15033, v6, v5, *MEMORY[0x1E0D1C030], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)memberQueueManagingProfileIdentifier
{
  return self->_memberQueueManagingProfileIdentifier;
}

- (void)setMemberQueueManagingProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueManagingProfileIdentifier, a3);
}

- (NSArray)memberQueueCheckInPinnedSecCertificateRefs
{
  return self->_memberQueueCheckInPinnedSecCertificateRefs;
}

- (void)setMemberQueueCheckInPinnedSecCertificateRefs:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueCheckInPinnedSecCertificateRefs, a3);
}

- (BOOL)memberQueuePinningRevocationCheckRequired
{
  return self->_memberQueuePinningRevocationCheckRequired;
}

- (void)setMemberQueuePinningRevocationCheckRequired:(BOOL)a3
{
  self->_memberQueuePinningRevocationCheckRequired = a3;
}

- (BOOL)memberQueueSignMessage
{
  return self->_memberQueueSignMessage;
}

- (void)setMemberQueueSignMessage:(BOOL)a3
{
  self->_memberQueueSignMessage = a3;
}

- (NSString)memberQueueTopic
{
  return self->_memberQueueTopic;
}

- (void)setMemberQueueTopic:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueTopic, a3);
}

- (NSDictionary)memberQueueOrganizationInfo
{
  return self->_memberQueueOrganizationInfo;
}

- (void)setMemberQueueOrganizationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueOrganizationInfo, a3);
}

- (NSURL)memberQueueServerURL
{
  return self->_memberQueueServerURL;
}

- (void)setMemberQueueServerURL:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueServerURL, a3);
}

- (NSURL)memberQueueCheckInURL
{
  return self->_memberQueueCheckInURL;
}

- (void)setMemberQueueCheckInURL:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueCheckInURL, a3);
}

- (NSArray)memberQueueServerCapabilities
{
  return self->_memberQueueServerCapabilities;
}

- (void)setMemberQueueServerCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isUserEnrollment
{
  return self->_isUserEnrollment;
}

- (void)setIsUserEnrollment:(BOOL)a3
{
  self->_isUserEnrollment = a3;
}

- (BOOL)supportUserChannel
{
  return self->_supportUserChannel;
}

- (void)setSupportUserChannel:(BOOL)a3
{
  self->_supportUserChannel = a3;
}

- (NSString)enrollmentID
{
  return self->_enrollmentID;
}

- (void)setEnrollmentID:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentID, a3);
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
  objc_storeStrong((id *)&self->_personaID, a3);
}

- (NSString)easEnrollmentID
{
  return self->_easEnrollmentID;
}

- (void)setEasEnrollmentID:(id)a3
{
  objc_storeStrong((id *)&self->_easEnrollmentID, a3);
}

- (NSString)rmAccountID
{
  return self->_rmAccountID;
}

- (void)setRmAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_rmAccountID, a3);
}

- (NSString)enrollmentMode
{
  return self->_enrollmentMode;
}

- (void)setEnrollmentMode:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentMode, a3);
}

- (BOOL)isProfileLocked
{
  return self->_isProfileLocked;
}

- (NSData)identityPersistentID
{
  return self->_identityPersistentID;
}

- (void)setIdentityPersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_identityPersistentID, a3);
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (__SecIdentity)memberQueueIdentity
{
  return self->_memberQueueIdentity;
}

- (void)setMemberQueueIdentity:(__SecIdentity *)a3
{
  self->_memberQueueIdentity = a3;
}

- (NSNumber)memberQueuePollingInterval
{
  return self->_memberQueuePollingInterval;
}

- (void)setMemberQueuePollingInterval:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueuePollingInterval, a3);
}

- (NSDictionary)memberQueueMDMOptions
{
  return self->_memberQueueMDMOptions;
}

- (void)setMemberQueueMDMOptions:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueMDMOptions, a3);
}

- (unint64_t)memberQueueAccessRights
{
  return self->_memberQueueAccessRights;
}

- (void)setMemberQueueAccessRights:(unint64_t)a3
{
  self->_memberQueueAccessRights = a3;
}

- (BOOL)memberQueueUseDevelopmentAPNS
{
  return self->_memberQueueUseDevelopmentAPNS;
}

- (void)setMemberQueueUseDevelopmentAPNS:(BOOL)a3
{
  self->_memberQueueUseDevelopmentAPNS = a3;
}

- (NSString)memberQueuePushMagic
{
  return self->_memberQueuePushMagic;
}

- (void)setMemberQueuePushMagic:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueuePushMagic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueuePushMagic, 0);
  objc_storeStrong((id *)&self->_memberQueueMDMOptions, 0);
  objc_storeStrong((id *)&self->_memberQueuePollingInterval, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_identityPersistentID, 0);
  objc_storeStrong((id *)&self->_enrollmentMode, 0);
  objc_storeStrong((id *)&self->_rmAccountID, 0);
  objc_storeStrong((id *)&self->_easEnrollmentID, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_enrollmentID, 0);
  objc_storeStrong((id *)&self->_memberQueueServerCapabilities, 0);
  objc_storeStrong((id *)&self->_memberQueueCheckInURL, 0);
  objc_storeStrong((id *)&self->_memberQueueServerURL, 0);
  objc_storeStrong((id *)&self->_memberQueueOrganizationInfo, 0);
  objc_storeStrong((id *)&self->_memberQueueTopic, 0);
  objc_storeStrong((id *)&self->_memberQueueCheckInPinnedSecCertificateRefs, 0);
  objc_storeStrong((id *)&self->_memberQueueManagingProfileIdentifier, 0);
}

- (NSUUID)wallpaperConfigurationUUID
{
  void *v2;
  void *v3;

  -[MDMConfiguration getPropertyForKey:channelType:](self, "getPropertyForKey:channelType:", CFSTR("wallpaperConfigUUID"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);

  return (NSUUID *)v3;
}

- (void)setWallpaperConfigurationUUID:(id)a3
{
  id v4;
  id v5;

  objc_msgSend(a3, "UUIDString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[MDMConfiguration setPropertyForKey:value:channelType:](self, "setPropertyForKey:value:channelType:", CFSTR("wallpaperConfigUUID"), v5, 0);

}

@end
