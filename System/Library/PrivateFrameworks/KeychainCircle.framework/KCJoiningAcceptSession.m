@implementation KCJoiningAcceptSession

- (BOOL)setupSession:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  KCAESGCMDuplexSession *v11;
  KCAESGCMDuplexSession *session;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v24;

  -[KCSRPContext getKey](self->_context, "getKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[KCAESGCMDuplexSession sessionAsReceiver:context:](KCAESGCMDuplexSession, "sessionAsReceiver:context:", v10, -[KCJoiningAcceptSession dsid](self, "dsid"));
    v11 = (KCAESGCMDuplexSession *)objc_claimAutoreleasedReturnValue();
    session = self->_session;
    self->_session = v11;

    -[KCJoiningAcceptSession joiningConfiguration](self, "joiningConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pairingUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCJoiningAcceptSession session](self, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPairingUUID:", v14);

    -[KCJoiningAcceptSession controlArguments](self, "controlArguments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "altDSID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCJoiningAcceptSession session](self, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAltDSID:", v17);

    v19 = -[KCJoiningAcceptSession piggy_version](self, "piggy_version");
    -[KCJoiningAcceptSession session](self, "session");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPiggybackingVersion:", v19);

    -[KCJoiningAcceptSession session](self, "session");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 != 0;

  }
  else
  {
    KCJoiningErrorCreate(7, a3, CFSTR("No session key available"), v5, v6, v7, v8, v9, v24);
    v22 = 0;
  }

  return v22;
}

- (KCJoiningAcceptSession)initWithSecretDelegate:(id)a3 circleDelegate:(id)a4 dsid:(unint64_t)a5 rng:(ccrng_state *)a6 error:(id *)a7
{
  id v12;
  id v13;
  KCJoiningAcceptSession *v14;
  NSObject *v15;
  void *v16;
  KCSRPServerContext *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  KCSRPServerContext *context;
  NSString *piggy_uuid;
  uint64_t v23;
  NSMutableDictionary *defaults;
  uint64_t v25;
  OTControl *otControl;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  OTJoiningConfiguration *joiningConfiguration;
  OTControlArguments *v32;
  OTControlArguments *controlArguments;
  uint8_t buf[16];
  objc_super v36;

  v12 = a3;
  v13 = a4;
  v36.receiver = self;
  v36.super_class = (Class)KCJoiningAcceptSession;
  v14 = -[KCJoiningAcceptSession init](&v36, sel_init);
  if (v14)
  {
    secLogObjForScope("accepting");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7B6000, v15, OS_LOG_TYPE_DEFAULT, "initWithSecretDelegate", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [KCSRPServerContext alloc];
    objc_msgSend(v12, "secret");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = ccsha256_di();
    v20 = -[KCSRPServerContext initWithUser:password:digestInfo:group:randomSource:](v17, "initWithUser:password:digestInfo:group:randomSource:", v16, v18, v19, ccsrp_gp_rfc5054_3072(), a6);
    context = v14->_context;
    v14->_context = (KCSRPServerContext *)v20;

    -[KCJoiningAcceptSession setSecretDelegate:](v14, "setSecretDelegate:", v12);
    -[KCJoiningAcceptSession setCircleDelegate:](v14, "setCircleDelegate:", v13);
    v14->_state = 0;
    v14->_dsid = a5;
    piggy_uuid = v14->_piggy_uuid;
    v14->_piggy_uuid = 0;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    defaults = v14->_defaults;
    v14->_defaults = (NSMutableDictionary *)v23;

    objc_msgSend(MEMORY[0x24BDE84C0], "controlObject:error:", 1, a7);
    v25 = objc_claimAutoreleasedReturnValue();
    otControl = v14->_otControl;
    v14->_otControl = (OTControl *)v25;

    v14->_piggy_version = 2;
    v27 = objc_alloc(MEMORY[0x24BDE84D0]);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "initWithProtocolType:uniqueDeviceID:uniqueClientID:pairingUUID:epoch:isInitiator:", CFSTR("OctagonPiggybacking"), CFSTR("acceptor-deviceid"), CFSTR("requester-deviceid"), v29, 0, 0);
    joiningConfiguration = v14->_joiningConfiguration;
    v14->_joiningConfiguration = (OTJoiningConfiguration *)v30;

    v32 = (OTControlArguments *)objc_alloc_init(MEMORY[0x24BDE84C8]);
    controlArguments = v14->_controlArguments;
    v14->_controlArguments = v32;

  }
  return v14;
}

- (id)stateString
{
  unsigned int v3;
  __CFString *v4;

  v3 = -[KCJoiningAcceptSession state](self, "state");
  if (v3 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[KCJoiningAcceptSession state](self, "state"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_24C7B9688[v3];
  }
  return v4;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[KCJoiningAcceptSession dsid](self, "dsid");
  -[KCJoiningAcceptSession stateString](self, "stateString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningAcceptSession context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningAcceptSession piggy_uuid](self, "piggy_uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<KCJoiningAcceptSession: %lld %@ %@ uuid: %@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyChallengeMessage:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[KCJoiningAcceptSession context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningAcceptSession startMessage](self, "startMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "copyChallengeFor:error:", v6, a3);

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCE50];
    -[KCJoiningAcceptSession context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "salt");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataWithEncodedSequenceData:data:error:", v10, v7, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[KCJoiningAcceptSession setupSession:](self, "setupSession:", a3))
      v12 = v11;
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)shouldAcceptOctagonRequests
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v3 = objc_alloc_init(MEMORY[0x24BDE84D8]);
  objc_msgSend(v3, "setDiscretionaryNetwork:", 1);
  -[KCJoiningAcceptSession otControl](self, "otControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningAcceptSession controlArguments](self, "controlArguments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__KCJoiningAcceptSession_shouldAcceptOctagonRequests__block_invoke;
  v7[3] = &unk_24C7B9610;
  v7[4] = &v8;
  objc_msgSend(v4, "fetchTrustStatus:configuration:reply:", v5, v3, v7);

  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

- (id)processInitialMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  char v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v44;
  _QWORD v45[6];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  __int128 buf;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v53 = 0;
  v54 = 0;
  v52 = 0;
  extractStartFromInitialMessage(v6, &v54, &v53, &v52, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v53;
  v9 = v52;
  -[KCJoiningAcceptSession setStartMessage:](self, "setStartMessage:", v7);

  -[KCJoiningAcceptSession startMessage](self, "startMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    secLogObjForScope("SecError");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v13 = *a4;
      else
        v13 = 0;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_20D7B6000, v12, OS_LOG_TYPE_DEFAULT, "joining: failed to extract startMessage: %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_31;
  }
  v11 = v54;
  if (v54 == 2)
  {
    if (-[KCJoiningAcceptSession shouldAcceptOctagonRequests](self, "shouldAcceptOctagonRequests"))
    {
      -[KCJoiningAcceptSession setOctagon:](self, "setOctagon:", v9);
      v11 = 2;
      goto LABEL_15;
    }
    secLogObjForScope("SecError");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_20D7B6000, v14, OS_LOG_TYPE_DEFAULT, "joining: octagon refusing octagon acceptor since we don't have a selfEgo", (uint8_t *)&buf, 2u);
    }

    if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) != 0
      || (-[KCJoiningAcceptSession joiningConfiguration](self, "joiningConfiguration"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "testsEnabled"),
          v15,
          (v16 & 1) != 0))
    {
      secLogObjForScope("joining");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_20D7B6000, v17, OS_LOG_TYPE_DEFAULT, "device supports SOS, continuing flow with piggyV1", (uint8_t *)&buf, 2u);
      }

      v11 = 1;
      goto LABEL_15;
    }
    secLogObjForScope("SecError");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_20D7B6000, v36, OS_LOG_TYPE_DEFAULT, "joining: device does not support SOS, failing flow", (uint8_t *)&buf, 2u);
    }

    KCJoiningErrorCreate(20, a4, CFSTR("Unable to piggyback with device due to lack of trust system support"), v37, v38, v39, v40, v41, v44);
LABEL_31:
    v26 = 0;
    goto LABEL_43;
  }
LABEL_15:
  -[KCJoiningAcceptSession setPiggy_uuid:](self, "setPiggy_uuid:", v8);
  -[KCJoiningAcceptSession setPiggy_version:](self, "setPiggy_version:", v11);
  v18 = -[KCJoiningAcceptSession copyChallengeMessage:](self, "copyChallengeMessage:", a4);
  if (v18)
  {
    self->_state = 1;
    v19 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[KCJoiningAcceptSession octagon](self, "octagon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithData:encoding:", v20, 4);

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__817;
    v58 = __Block_byref_object_dispose__818;
    v59 = 0;
    if (v11 == 2 && v21 && -[NSObject isEqualToString:](v21, "isEqualToString:", CFSTR("o")))
    {
      v46 = 0;
      v47 = &v46;
      v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__817;
      v50 = __Block_byref_object_dispose__818;
      v51 = 0;
      -[KCJoiningAcceptSession otControl](self, "otControl");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCJoiningAcceptSession controlArguments](self, "controlArguments");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCJoiningAcceptSession joiningConfiguration](self, "joiningConfiguration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __54__KCJoiningAcceptSession_processInitialMessage_error___block_invoke;
      v45[3] = &unk_24C7B9638;
      v45[4] = &buf;
      v45[5] = &v46;
      objc_msgSend(v22, "rpcEpochWithArguments:configuration:reply:", v23, v24, v45);

      v25 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v25)
      {
        v26 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v25);
      }
      else
      {
        +[KCJoiningMessage messageWithType:data:payload:error:](KCJoiningMessage, "messageWithType:data:payload:error:", 1, v18, v47[5], a4);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "der");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      _Block_object_dispose(&v46, 8);

    }
    else if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) != 0
           || (-[KCJoiningAcceptSession joiningConfiguration](self, "joiningConfiguration"),
               v27 = (void *)objc_claimAutoreleasedReturnValue(),
               v28 = objc_msgSend(v27, "testsEnabled"),
               v27,
               v28))
    {
      +[KCJoiningMessage messageWithType:data:error:](KCJoiningMessage, "messageWithType:data:error:", 1, v18, a4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "der");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      KCJoiningErrorCreate(20, a4, CFSTR("Unable to piggyback with device due to lack of trust system support"), v29, v30, v31, v32, v33, v44);
      v26 = 0;
    }
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    secLogObjForScope("SecError");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v35 = *a4;
      else
        v35 = 0;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v35;
      _os_log_impl(&dword_20D7B6000, v21, OS_LOG_TYPE_DEFAULT, "joining: failed to copy srpMessage: %@", (uint8_t *)&buf, 0xCu);
    }
    v26 = 0;
  }

LABEL_43:
  return v26;
}

- (id)processResponse:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint8_t buf[4];
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "type") == 2)
  {
    -[KCJoiningAcceptSession secretDelegate](self, "secretDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCJoiningAcceptSession context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "copyConfirmationFor:error:", v14, 0);

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend(v12, "accountCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dataWithEncodedString:error:", v17, a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[KCJoiningAcceptSession session](self, "session");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "encrypt:error:", v18, a4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          self->_state = 2;
          +[KCJoiningMessage messageWithType:data:payload:error:](KCJoiningMessage, "messageWithType:data:payload:error:", 3, v15, v20, a4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "der");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        v22 = 0;
      }

      goto LABEL_23;
    }
    v23 = objc_msgSend(v12, "verificationFailed:", a4);
    secLogObjForScope("SecError");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v39 = v23;
      _os_log_impl(&dword_20D7B6000, v24, OS_LOG_TYPE_DEFAULT, "processResponse: handle error: %d", buf, 8u);
    }

    if (v23 == 2)
    {
      -[KCJoiningAcceptSession context](self, "context");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "secret");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "resetWithPassword:error:", v31, a4);

      if (!v32)
        goto LABEL_22;
      v33 = -[KCJoiningAcceptSession copyChallengeMessage:](self, "copyChallengeMessage:", a4);
    }
    else
    {
      if (v23 != 1)
      {
        if (!v23)
          KCJoiningErrorCreate(7, a4, CFSTR("Delegate returned error without filling in error: %@"), v25, v26, v27, v28, v29, (uint64_t)v12);
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    v34 = v33;
    if (v33)
    {
      +[KCJoiningMessage messageWithType:data:error:](KCJoiningMessage, "messageWithType:data:error:", 0, v33, a4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "der");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
      goto LABEL_24;
    }
LABEL_22:
    v22 = 0;
    goto LABEL_23;
  }
  KCJoiningErrorCreate(6, a4, CFSTR("Expected response!"), v7, v8, v9, v10, v11, v37);
  v22 = 0;
LABEL_24:

  return v22;
}

- (id)processSOSApplication:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[KCJoiningAcceptSession session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decryptAndVerify:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[KCJoiningAcceptSession circleDelegate](self, "circleDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v10 = SOSPeerInfoCreateFromData();
    if (v10)
    {
      v11 = (const void *)v10;
      objc_msgSend(v9, "circleJoinDataFor:error:", v10, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v11);
      if (v12)
      {
        v13 = -[KCJoiningAcceptSession piggy_version](self, "piggy_version");
        if (v13 == 2)
        {
          secLogObjForScope("acceptor");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v15 = 2;
            _os_log_impl(&dword_20D7B6000, v14, OS_LOG_TYPE_DEFAULT, "piggy version is 2", buf, 2u);
          }
          else
          {
            v15 = 2;
          }
        }
        else
        {
          if (v13 != 1)
          {
            v17 = v12;
LABEL_23:
            -[KCJoiningAcceptSession session](self, "session");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "encrypt:error:", v17, a4);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              v23 = v16;

            goto LABEL_26;
          }
          secLogObjForScope("acceptor");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D7B6000, v14, OS_LOG_TYPE_DEFAULT, "piggy version is 1", buf, 2u);
          }
          v15 = 3;
        }

        v25 = 0;
        objc_msgSend(v9, "circleGetInitialSyncViews:error:", v15, &v25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v25;
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithData:", v12);
        v17 = v20;
        if (v18)
        {
          objc_msgSend(v20, "appendData:", v18);
        }
        else
        {
          secLogObjForScope("piggy");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v19;
            _os_log_impl(&dword_20D7B6000, v21, OS_LOG_TYPE_DEFAULT, "PB threw an error: %@", buf, 0xCu);
          }

        }
        goto LABEL_23;
      }
    }
    else if (a4)
    {
      v16 = 0;
      *a4 = v26;
LABEL_26:

      goto LABEL_27;
    }
    v16 = 0;
    goto LABEL_26;
  }
  v16 = 0;
LABEL_27:

  return v16;
}

- (id)createPairingMessageFromJoiningMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  KCInitialMessageData *v10;
  void *v11;
  OTPairingMessage *v12;
  void *v13;
  OTPairingMessage *v14;
  NSObject *v15;
  OTPairingMessage *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v30;
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[KCJoiningAcceptSession session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decryptAndVerify:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[KCInitialMessageData initWithData:]([KCInitialMessageData alloc], "initWithData:", v9);
    if (v10)
    {
      v11 = v10;
      if (-[KCInitialMessageData hasPrepareMessage](v10, "hasPrepareMessage"))
      {
        v12 = [OTPairingMessage alloc];
        objc_msgSend(v11, "prepareMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[OTPairingMessage initWithData:](v12, "initWithData:", v13);

        goto LABEL_14;
      }
      secLogObjForScope("SecError");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_20D7B6000, v23, OS_LOG_TYPE_DEFAULT, "InitialMessageData does not contain prepare message", v31, 2u);
      }

      KCJoiningErrorCreate(6, a4, CFSTR("Expected prepare message inside InitialMessageData"), v24, v25, v26, v27, v28, *(uint64_t *)v31);
    }
    else
    {
      secLogObjForScope("SecError");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_20D7B6000, v17, OS_LOG_TYPE_DEFAULT, "Failed to parse InitialMessageData from decrypted message data", v31, 2u);
      }

      KCJoiningErrorCreate(6, a4, CFSTR("Failed to parse InitialMessageData from decrypted message data"), v18, v19, v20, v21, v22, *(uint64_t *)v31);
      v11 = 0;
    }
    v14 = 0;
    goto LABEL_14;
  }
  secLogObjForScope("KeychainCircle");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    if (a4)
      v30 = (const __CFString *)*a4;
    else
      v30 = &stru_24C7BB930;
    *(_DWORD *)v31 = 138412290;
    *(_QWORD *)&v31[4] = v30;
    _os_log_debug_impl(&dword_20D7B6000, v15, OS_LOG_TYPE_DEBUG, "Failed to decrypt message first data: %@. Trying legacy OTPairingMessage construction.", v31, 0xCu);
  }

  v16 = [OTPairingMessage alloc];
  objc_msgSend(v6, "firstData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[OTPairingMessage initWithData:](v16, "initWithData:", v11);
LABEL_14:

  return v14;
}

- (id)createTLKRequestResponse:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[KCJoiningAcceptSession circleDelegate](self, "circleDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v5, "circleGetInitialSyncViews:error:", 4, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;

  if (v6)
  {
    -[KCJoiningAcceptSession session](self, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v7;
    objc_msgSend(v8, "encrypt:error:", v6, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;

    if (v9)
    {
      self->_state = 3;
      secLogObjForScope("joining");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v11, OS_LOG_TYPE_DEFAULT, "TLKRequest done.", buf, 2u);
      }

      +[KCJoiningMessage messageWithType:data:error:](KCJoiningMessage, "messageWithType:data:error:", 6, v9, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "der");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      secLogObjForScope("joining");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v10;
        _os_log_impl(&dword_20D7B6000, v15, OS_LOG_TYPE_DEFAULT, "TLK request failed to encrypt: %@", buf, 0xCu);
      }

      v13 = 0;
      if (a3 && v10)
      {
        v13 = 0;
        *a3 = objc_retainAutorelease(v10);
      }
    }

  }
  else
  {
    secLogObjForScope("joining");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_20D7B6000, v14, OS_LOG_TYPE_DEFAULT, "Failed to get initial sync view: %@", buf, 0xCu);
    }

    v13 = 0;
    if (a3 && v7)
    {
      v10 = objc_retainAutorelease(v7);
      v13 = 0;
      *a3 = v10;
    }
    else
    {
      v10 = v7;
    }
  }

  return v13;
}

- (BOOL)shouldProcessSOSApplication:(id)a3 pairingMessage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  BOOL v13;
  __int16 v15;
  uint8_t buf[2];
  __int16 v17;

  v5 = a3;
  v6 = a4;
  if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) == 0)
  {
    secLogObjForScope("joining");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v11 = "platform does not support SOS";
      v12 = (uint8_t *)&v17;
      goto LABEL_12;
    }
LABEL_13:

    v13 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v5, "secondData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    secLogObjForScope("joining");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "message does not contain SOS data";
      v12 = buf;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "hasSupportsSOS"))
  {
    objc_msgSend(v6, "supportsSOS");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "supported");

    if (v9 == 2)
    {
      secLogObjForScope("joining");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 0;
        v11 = "requester explicitly does not support SOS";
        v12 = (uint8_t *)&v15;
LABEL_12:
        _os_log_impl(&dword_20D7B6000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  v13 = 1;
LABEL_14:

  return v13;
}

- (id)processApplication:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint8_t buf[4];
  id v61;
  __int128 v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "type") == 6)
  {
    -[KCJoiningAcceptSession createTLKRequestResponse:](self, "createTLKRequestResponse:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  if (objc_msgSend(v6, "type") != 4)
  {
    KCJoiningErrorCreate(6, a4, CFSTR("Expected peerInfo!"), v8, v9, v10, v11, v12, v48);
LABEL_16:
    v7 = 0;
    goto LABEL_44;
  }
  if (-[KCJoiningAcceptSession piggy_version](self, "piggy_version") == 2)
  {
    *(_QWORD *)&v62 = 0;
    *((_QWORD *)&v62 + 1) = &v62;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__817;
    v65 = __Block_byref_object_dispose__818;
    v66 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__817;
    v58 = __Block_byref_object_dispose__818;
    v59 = 0;
    -[KCJoiningAcceptSession createPairingMessageFromJoiningMessage:error:](self, "createPairingMessageFromJoiningMessage:error:", v6, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((objc_msgSend(v13, "hasPrepare") & 1) != 0)
      {
        objc_msgSend(v14, "prepare");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("full");
        -[KCJoiningAcceptSession otControl](self, "otControl");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCJoiningAcceptSession controlArguments](self, "controlArguments");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCJoiningAcceptSession joiningConfiguration](self, "joiningConfiguration");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "peerID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "permanentInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "permanentInfoSig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stableInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stableInfoSig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v14;
        v53 = v21;
        objc_msgSend(v51, "rpcVoucherWithArguments:configuration:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:maxCapability:reply:", v50, v49, v16, v17, v18, v19);

        if (*(_QWORD *)(*((_QWORD *)&v62 + 1) + 40))
        {
          if (-[KCJoiningAcceptSession shouldProcessSOSApplication:pairingMessage:](self, "shouldProcessSOSApplication:pairingMessage:", v6, v21))
          {
            secLogObjForScope("joining");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20D7B6000, v22, OS_LOG_TYPE_DEFAULT, "doing SOS processSOSApplication", buf, 2u);
            }

            objc_msgSend(v6, "secondData");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[KCJoiningAcceptSession processSOSApplication:error:](self, "processSOSApplication:error:", v23, a4);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v24)
            {
              secLogObjForScope("SecError");
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                if (a4)
                  v26 = *a4;
                else
                  v26 = 0;
                *(_DWORD *)buf = 138412290;
                v61 = v26;
                _os_log_impl(&dword_20D7B6000, v25, OS_LOG_TYPE_DEFAULT, "joining: failed to process SOS application: %@", buf, 0xCu);
              }

              KCJoiningErrorCreate(9, a4, CFSTR("message failed to process application"), v42, v43, v44, v45, v46, (uint64_t)v20);
              goto LABEL_41;
            }
          }
          else
          {
            v24 = 0;
          }
          self->_state = 3;
          +[KCJoiningMessage messageWithType:data:payload:error:](KCJoiningMessage, "messageWithType:data:payload:error:", 5, *(_QWORD *)(*((_QWORD *)&v62 + 1) + 40), v24, a4);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "der");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (!a4 || (v40 = (void *)v55[5]) == 0)
          {
LABEL_41:
            v7 = 0;
            goto LABEL_42;
          }
          v7 = 0;
          *a4 = objc_retainAutorelease(v40);
        }
LABEL_42:

        goto LABEL_43;
      }
      secLogObjForScope("SecError");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v33, OS_LOG_TYPE_DEFAULT, "octagon, message does not contain prepare message", buf, 2u);
      }
      v34 = CFSTR("Expected prepare message!");
    }
    else
    {
      secLogObjForScope("SecError");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v33, OS_LOG_TYPE_DEFAULT, "octagon, failed to create pairing message from JoiningMessage", buf, 2u);
      }
      v34 = CFSTR("Failed to create pairing message from JoiningMessage");
    }

    KCJoiningErrorCreate(6, a4, v34, v35, v36, v37, v38, v39, v48);
    v7 = 0;
LABEL_43:

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v62, 8);

    goto LABEL_44;
  }
  if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cannot join piggyback version %d with SOS disabled"), -[KCJoiningAcceptSession piggy_version](self, "piggy_version"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    secLogObjForScope("SecError");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v62) = 136315138;
      *(_QWORD *)((char *)&v62 + 4) = objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
      _os_log_impl(&dword_20D7B6000, v32, OS_LOG_TYPE_DEFAULT, "joining: %s", (uint8_t *)&v62, 0xCu);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithJoiningError:format:", 7, CFSTR("%@"), v31);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_16;
  }
  objc_msgSend(v6, "firstData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningAcceptSession processSOSApplication:error:](self, "processSOSApplication:error:", v27, a4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  self->_state = 3;
  secLogObjForScope("joining");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v62) = 0;
    _os_log_impl(&dword_20D7B6000, v29, OS_LOG_TYPE_DEFAULT, "posting kSOSCCCircleOctagonKeysChangedNotification", (uint8_t *)&v62, 2u);
  }

  notify_post((const char *)*MEMORY[0x24BDE8EE8]);
  +[KCJoiningMessage messageWithType:data:error:](KCJoiningMessage, "messageWithType:data:error:", 5, v28, a4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "der");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_44:
  return v7;
}

- (id)processMessage:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE v18[12];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  secLogObjForScope("acceptor");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[KCJoiningAcceptSession description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v18 = 138412290;
    *(_QWORD *)&v18[4] = v8;
    _os_log_impl(&dword_20D7B6000, v7, OS_LOG_TYPE_DEFAULT, "processMessages: %@", v18, 0xCu);

  }
  if (-[KCJoiningAcceptSession state](self, "state"))
  {
    +[KCJoiningMessage messageWithDER:error:](KCJoiningMessage, "messageWithDER:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  switch(-[KCJoiningAcceptSession state](self, "state"))
  {
    case 0:
      -[KCJoiningAcceptSession processInitialMessage:error:](self, "processInitialMessage:error:", v6, a4);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 1:
      if (!v9)
        goto LABEL_14;
      -[KCJoiningAcceptSession processResponse:error:](self, "processResponse:error:", v9, a4);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 2:
      if (!v9)
        goto LABEL_14;
      -[KCJoiningAcceptSession processApplication:error:](self, "processApplication:error:", v9, a4);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v16 = (void *)v15;
      break;
    case 3:
      KCJoiningErrorCreate(6, a4, CFSTR("Unexpected message while done"), v10, v11, v12, v13, v14, *(uint64_t *)v18);
      goto LABEL_14;
    default:
LABEL_14:
      v16 = 0;
      break;
  }

  return v16;
}

- (BOOL)isDone
{
  return -[KCJoiningAcceptSession state](self, "state") == 3;
}

- (unint64_t)dsid
{
  return self->_dsid;
}

- (KCJoiningAcceptSecretDelegate)secretDelegate
{
  return (KCJoiningAcceptSecretDelegate *)objc_loadWeakRetained((id *)&self->_secretDelegate);
}

- (void)setSecretDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_secretDelegate, a3);
}

- (KCJoiningAcceptCircleDelegate)circleDelegate
{
  return (KCJoiningAcceptCircleDelegate *)objc_loadWeakRetained((id *)&self->_circleDelegate);
}

- (void)setCircleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_circleDelegate, a3);
}

- (KCSRPServerContext)context
{
  return (KCSRPServerContext *)objc_getProperty(self, a2, 40, 1);
}

- (KCAESGCMDuplexSession)session
{
  return (KCAESGCMDuplexSession *)objc_getProperty(self, a2, 48, 1);
}

- (int)state
{
  return self->_state;
}

- (NSData)startMessage
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStartMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)piggy_uuid
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPiggy_uuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (int)piggy_version
{
  return self->_piggy_version;
}

- (void)setPiggy_version:(int)a3
{
  self->_piggy_version = a3;
}

- (NSData)octagon
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOctagon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OTJoiningConfiguration)joiningConfiguration
{
  return self->_joiningConfiguration;
}

- (void)setJoiningConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_joiningConfiguration, a3);
}

- (OTControlArguments)controlArguments
{
  return self->_controlArguments;
}

- (void)setControlArguments:(id)a3
{
  objc_storeStrong((id *)&self->_controlArguments, a3);
}

- (OTControl)otControl
{
  return self->_otControl;
}

- (void)setOtControl:(id)a3
{
  objc_storeStrong((id *)&self->_otControl, a3);
}

- (NSMutableDictionary)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_otControl, 0);
  objc_storeStrong((id *)&self->_controlArguments, 0);
  objc_storeStrong((id *)&self->_joiningConfiguration, 0);
  objc_storeStrong((id *)&self->_octagon, 0);
  objc_storeStrong((id *)&self->_piggy_uuid, 0);
  objc_storeStrong((id *)&self->_startMessage, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_circleDelegate);
  objc_destroyWeak((id *)&self->_secretDelegate);
}

void __51__KCJoiningAcceptSession_processApplication_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  OTPairingMessage *v11;
  OTSupportSOSMessage *v12;
  OTSupportOctagonMessage *v13;
  OTSponsorToApplicantRound2M2 *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    secLogObjForScope("SecError");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v9;
      _os_log_impl(&dword_20D7B6000, v10, OS_LOG_TYPE_DEFAULT, "error producing octagon voucher: %@", (uint8_t *)&v23, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }
  else
  {
    v11 = objc_alloc_init(OTPairingMessage);
    v12 = objc_alloc_init(OTSupportSOSMessage);
    -[OTPairingMessage setSupportsSOS:](v11, "setSupportsSOS:", v12);

    v13 = objc_alloc_init(OTSupportOctagonMessage);
    -[OTPairingMessage setSupportsOctagon:](v11, "setSupportsOctagon:", v13);

    v14 = objc_alloc_init(OTSponsorToApplicantRound2M2);
    -[OTPairingMessage setVoucher:](v11, "setVoucher:", v14);

    -[OTPairingMessage voucher](v11, "voucher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setVoucher:", v7);

    -[OTPairingMessage voucher](v11, "voucher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setVoucherSignature:", v8);

    if (SOSCCIsSOSTrustAndSyncingEnabled())
      v17 = 1;
    else
      v17 = 2;
    objc_msgSend(*(id *)(a1 + 32), "supportsSOS");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSupported:", v17);

    objc_msgSend(*(id *)(a1 + 32), "supportsOctagon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSupported:", 1);

    -[OTPairingMessage data](v11, "data");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
}

void __54__KCJoiningAcceptSession_processInitialMessage_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  OTPairingMessage *v8;
  OTSupportSOSMessage *v9;
  OTSupportOctagonMessage *v10;
  OTSponsorToApplicantRound1M2 *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v6;
      _os_log_impl(&dword_20D7B6000, v7, OS_LOG_TYPE_DEFAULT, "error retrieving next message! :%@", (uint8_t *)&v19, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    v8 = objc_alloc_init(OTPairingMessage);
    v9 = objc_alloc_init(OTSupportSOSMessage);
    -[OTPairingMessage setSupportsSOS:](v8, "setSupportsSOS:", v9);

    v10 = objc_alloc_init(OTSupportOctagonMessage);
    -[OTPairingMessage setSupportsOctagon:](v8, "setSupportsOctagon:", v10);

    v11 = objc_alloc_init(OTSponsorToApplicantRound1M2);
    -[OTPairingMessage setEpoch:](v8, "setEpoch:", v11);

    -[OTPairingMessage epoch](v8, "epoch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEpoch:", a2);

    if (SOSCCIsSOSTrustAndSyncingEnabled())
      v13 = 1;
    else
      v13 = 2;
    -[OTPairingMessage supportsSOS](v8, "supportsSOS");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSupported:", v13);

    -[OTPairingMessage supportsOctagon](v8, "supportsOctagon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSupported:", 1);

    -[OTPairingMessage data](v8, "data");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
}

void __53__KCJoiningAcceptSession_shouldAcceptOctagonRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _DWORD v15[2];
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  secLogObjForScope("SecError");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67110146;
    v15[1] = a2;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    v20 = 1024;
    v21 = a5;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_20D7B6000, v14, OS_LOG_TYPE_DEFAULT, "octagon haveSelfEgo: status %d: %@ %@ %d: %@", (uint8_t *)v15, 0x2Cu);
  }

  if (!a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

}

+ (id)sessionWithInitialMessage:(id)a3 secretDelegate:(id)a4 circleDelegate:(id)a5 dsid:(unint64_t)a6 error:(id *)a7
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  KCJoiningAcceptSession *v18;
  uint64_t v20;

  v10 = a4;
  v11 = a5;
  v12 = ccrng();
  if (v12)
  {
    v18 = -[KCJoiningAcceptSession initWithSecretDelegate:circleDelegate:dsid:rng:error:]([KCJoiningAcceptSession alloc], "initWithSecretDelegate:circleDelegate:dsid:rng:error:", v10, v11, a6, v12, a7);
  }
  else
  {
    CoreCryptoError(0, a7, CFSTR("RNG fetch failed"), v13, v14, v15, v16, v17, v20);
    v18 = 0;
  }

  return v18;
}

@end
