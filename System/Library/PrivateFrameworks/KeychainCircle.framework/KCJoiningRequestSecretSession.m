@implementation KCJoiningRequestSecretSession

- (id)createUUID
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 0xAAAAAAAAAAAAAAAALL;
  v7[1] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningRequestSecretSession setPiggy_uuid:](self, "setPiggy_uuid:", v4);

  objc_msgSend(v3, "getUUIDBytes:", v7);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initialMessage:(id *)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = -[KCSRPClientContext copyStart:](self->_context, "copyStart:");
  if (v5)
  {
    secLogObjForScope("joining");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_20D7B6000, v6, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestSecretSession initialMessage called", (uint8_t *)&v17, 2u);
    }

    if (-[KCJoiningRequestSecretSession piggy_version](self, "piggy_version") == 2)
    {
      -[KCJoiningRequestSecretSession createUUID](self, "createUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("o"), "dataUsingEncoding:", 134217984);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", sizeof_initialmessage_version2(v5, 1, v7, v8));
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v9, "mutableBytes");
      v10 = objc_retainAutorelease(v9);
      objc_msgSend(v10, "mutableBytes");
      objc_msgSend(v10, "length");
      if (encode_initialmessage_version2(v5, v7, v8))
      {

LABEL_10:
LABEL_12:
        v11 = v10;
        v10 = v11;
LABEL_18:

        goto LABEL_19;
      }
      secLogObjForScope("SecError");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_20D7B6000, v14, OS_LOG_TYPE_DEFAULT, "failed to create version 2 message", (uint8_t *)&v17, 2u);
      }

    }
    else
    {
      if (-[KCJoiningRequestSecretSession piggy_version](self, "piggy_version") != 1)
      {
        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", sizeof_initialmessage(v5));
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v13, "mutableBytes");
        v10 = objc_retainAutorelease(v13);
        objc_msgSend(v10, "mutableBytes");
        objc_msgSend(v10, "length");
        if (encode_initialmessage(v5))
          goto LABEL_12;
LABEL_17:
        v11 = 0;
        goto LABEL_18;
      }
      -[KCJoiningRequestSecretSession createUUID](self, "createUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", sizeof_initialmessage_version1(v5, 1, v7));
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "mutableBytes");
      v10 = objc_retainAutorelease(v12);
      objc_msgSend(v10, "mutableBytes");
      objc_msgSend(v10, "length");
      if (encode_initialmessage_version1(v5, v7))
        goto LABEL_10;
      secLogObjForScope("SecError");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *a3;
        v17 = 138412290;
        v18 = v16;
        _os_log_impl(&dword_20D7B6000, v8, OS_LOG_TYPE_DEFAULT, "failed to create version 1 message: %@", (uint8_t *)&v17, 0xCu);
      }
    }

    goto LABEL_17;
  }
  v11 = 0;
LABEL_19:

  return v11;
}

- (BOOL)isDone
{
  return self->_state == 2;
}

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
  unint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  uint64_t v22;

  -[KCSRPContext getKey](self->_context, "getKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[KCAESGCMDuplexSession sessionAsSender:context:](KCAESGCMDuplexSession, "sessionAsSender:context:", v10, -[KCJoiningRequestSecretSession dsid](self, "dsid"));
    v11 = (KCAESGCMDuplexSession *)objc_claimAutoreleasedReturnValue();
    session = self->_session;
    self->_session = v11;

    -[KCJoiningRequestSecretSession sessionUUID](self, "sessionUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCJoiningRequestSecretSession session](self, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPairingUUID:", v13);

    -[KCJoiningRequestSecretSession altDSID](self, "altDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCJoiningRequestSecretSession session](self, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAltDSID:", v15);

    v17 = -[KCJoiningRequestSecretSession piggy_version](self, "piggy_version");
    -[KCJoiningRequestSecretSession session](self, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPiggybackingVersion:", v17);

    -[KCJoiningRequestSecretSession session](self, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 != 0;

  }
  else
  {
    KCJoiningErrorCreate(7, a3, CFSTR("No session key available"), v5, v6, v7, v8, v9, v22);
    v20 = 0;
  }

  return v20;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_altDSID, a3);
  v5 = a3;
  -[KCJoiningRequestSecretSession session](self, "session");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAltDSID:", v5);

}

- (id)copyResponseForChallenge:(id)a3 salt:(id)a4 secret:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  uint8_t v18[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  secLogObjForScope("joining");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestSecretSession copyResponseForChallenge called", v18, 2u);
  }

  v14 = -[KCSRPClientContext copyResposeToChallenge:password:salt:error:](self->_context, "copyResposeToChallenge:password:salt:error:", v10, v12, v11, a6);
  if (v14 && -[KCJoiningRequestSecretSession setupSession:](self, "setupSession:", a6))
  {
    -[KCJoiningRequestSecretSession setChallenge:](self, "setChallenge:", v10);
    -[KCJoiningRequestSecretSession setSalt:](self, "setSalt:", v11);
    self->_state = 1;
    +[KCJoiningMessage messageWithType:data:error:](KCJoiningMessage, "messageWithType:data:error:", 2, v14, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "der");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)copyResponseForSecret:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[KCJoiningRequestSecretSession challenge](self, "challenge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningRequestSecretSession salt](self, "salt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[KCJoiningRequestSecretSession copyResponseForChallenge:salt:secret:error:](self, "copyResponseForChallenge:salt:secret:error:", v7, v8, v6, a4);

  return v9;
}

- (id)handleChallengeData:(id)a3 secret:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  id v13;
  id v14;
  id v16;
  id v17;
  uint8_t buf[16];

  v8 = a4;
  v9 = a3;
  secLogObjForScope("joining");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v10, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestSecretSession handleChallengeData called", buf, 2u);
  }

  v16 = 0;
  v17 = 0;
  v11 = objc_msgSend(v9, "decodeSequenceData:data:error:", &v17, &v16, a5);

  v12 = v17;
  v13 = v16;
  v14 = 0;
  if (v11)
    v14 = -[KCJoiningRequestSecretSession copyResponseForChallenge:salt:secret:error:](self, "copyResponseForChallenge:salt:secret:error:", v13, v12, v8, a5);

  return v14;
}

- (id)handleChallenge:(id)a3 secret:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  OTPairingMessage *v22;
  void *v23;
  OTPairingMessage *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  _BYTE v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  secLogObjForScope("joining");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_20D7B6000, v10, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestSecretSession handleChallenge called", v33, 2u);
  }

  if (objc_msgSend(v8, "type") == 1)
  {
    objc_msgSend(v8, "secondData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = 2;
    else
      v17 = 1;
    -[KCJoiningRequestSecretSession setPiggy_version:](self, "setPiggy_version:", v17);

    v18 = -[KCJoiningRequestSecretSession piggy_version](self, "piggy_version");
    -[KCJoiningRequestSecretSession session](self, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPiggybackingVersion:", v18);

    -[KCJoiningRequestSecretSession altDSID](self, "altDSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCJoiningRequestSecretSession session](self, "session");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAltDSID:", v20);

    if (-[KCJoiningRequestSecretSession piggy_version](self, "piggy_version") == 2)
    {
      v22 = [OTPairingMessage alloc];
      objc_msgSend(v8, "secondData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[OTPairingMessage initWithData:](v22, "initWithData:", v23);

      if (-[OTPairingMessage hasEpoch](v24, "hasEpoch"))
      {
        secLogObjForScope("octagon");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          -[OTPairingMessage epoch](v24, "epoch");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v33 = 138412290;
          *(_QWORD *)&v33[4] = v27;
          _os_log_impl(&dword_20D7B6000, v25, OS_LOG_TYPE_DEFAULT, "received epoch message: %@", v33, 0xCu);

        }
        -[OTPairingMessage epoch](v24, "epoch");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCJoiningRequestSecretSession setEpoch:](self, "setEpoch:", objc_msgSend(v28, "epoch"));

      }
      else
      {
        secLogObjForScope("SecError");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v33 = 0;
          _os_log_impl(&dword_20D7B6000, v30, OS_LOG_TYPE_DEFAULT, "octagon: acceptor did not send its epoch. discontinuing octagon protocol. downgrading to verison 1", v33, 2u);
        }

        -[KCJoiningRequestSecretSession setPiggy_version:](self, "setPiggy_version:", 1);
      }

    }
    objc_msgSend(v8, "firstData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCJoiningRequestSecretSession handleChallengeData:secret:error:](self, "handleChallengeData:secret:error:", v31, v9, a5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    KCJoiningErrorCreate(6, a5, CFSTR("Expected challenge!"), v11, v12, v13, v14, v15, *(uint64_t *)v33);
    v29 = 0;
  }

  return v29;
}

- (id)handleChallenge:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[KCJoiningRequestSecretSession secretDelegate](self, "secretDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secret");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningRequestSecretSession handleChallenge:secret:error:](self, "handleChallenge:secret:error:", v6, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleVerification:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v33;
  uint8_t buf[4];
  KCJoiningRequestSecretSession *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  secLogObjForScope("joining");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v7, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestSecretSession handleVerification called", buf, 2u);
  }

  -[KCJoiningRequestSecretSession secretDelegate](self, "secretDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "type"))
  {
    if (objc_msgSend(v6, "type") == 3)
    {
      -[KCJoiningRequestSecretSession context](self, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "verifyConfirmation:error:", v15, a4);

      if ((v16 & 1) != 0)
      {
        -[KCJoiningRequestSecretSession session](self, "session");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "secondData");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "decryptAndVerify:error:", v23, a4);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "decodeFromDER:error:", v24, a4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25 && (objc_msgSend(v8, "processAccountCode:error:", v25, a4) & 1) != 0)
          {

            self->_state = 2;
            objc_msgSend(MEMORY[0x24BDBCE50], "data");
            v26 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }

        }
      }
      else
      {
        KCJoiningErrorCreate(7, a4, CFSTR("Got verification but  acceptor doesn't have matching secret: %@"), v17, v18, v19, v20, v21, (uint64_t)self);
        secLogObjForScope("request-session");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = self;
          _os_log_impl(&dword_20D7B6000, v31, OS_LOG_TYPE_DEFAULT, "Verification failed: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      KCJoiningErrorCreate(6, a4, CFSTR("Expected verification!"), v9, v10, v11, v12, v13, v33);
    }
    v26 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v6, "firstData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");

  objc_msgSend(v8, "verificationFailed:", v28 == 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (v28)
    {
      objc_msgSend(v6, "firstData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCJoiningRequestSecretSession handleChallengeData:secret:error:](self, "handleChallengeData:secret:error:", v30, v29, a4);
      v26 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = -[KCJoiningRequestSecretSession copyResponseForSecret:error:](self, "copyResponseForSecret:error:", v29, a4);
    }
  }
  else
  {
    v26 = 0;
  }

LABEL_22:
  return v26;
}

- (id)processMessage:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int state;
  uint64_t v15;
  void *v16;
  uint64_t v18;

  v6 = a3;
  secLogObjForScope("joining");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_20D7B6000, v7, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestSecretSession processMessage called", (uint8_t *)&v18, 2u);
  }

  +[KCJoiningMessage messageWithDER:error:](KCJoiningMessage, "messageWithDER:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    state = self->_state;
    switch(state)
    {
      case 2:
        KCJoiningErrorCreate(6, a4, CFSTR("Done, no messages expected."), v9, v10, v11, v12, v13, v18);
        break;
      case 1:
        -[KCJoiningRequestSecretSession handleVerification:error:](self, "handleVerification:error:", v8, a4);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 0:
        -[KCJoiningRequestSecretSession handleChallenge:error:](self, "handleChallenge:error:", v8, a4);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v16 = (void *)v15;
        goto LABEL_12;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (KCJoiningRequestSecretSession)initWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  KCJoiningRequestSecretSession *v15;
  uint64_t v17;

  v8 = a3;
  v9 = ccrng();
  if (v9)
  {
    self = -[KCJoiningRequestSecretSession initWithSecretDelegate:dsid:rng:error:](self, "initWithSecretDelegate:dsid:rng:error:", v8, a4, v9, a5);
    v15 = self;
  }
  else
  {
    CoreCryptoError(0, a5, CFSTR("RNG fetch failed"), v10, v11, v12, v13, v14, v17);
    v15 = 0;
  }

  return v15;
}

- (KCJoiningRequestSecretSession)initWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 rng:(ccrng_state *)a5 error:(id *)a6
{
  id v9;
  NSObject *v10;
  KCJoiningRequestSecretSession *v11;
  KCJoiningRequestSecretSession *v12;
  uint64_t v13;
  NSMutableDictionary *defaults;
  void *v15;
  uint64_t v16;
  NSString *sessionUUID;
  NSObject *v18;
  void *v19;
  void *v20;
  KCSRPClientContext *v21;
  uint64_t v22;
  uint64_t v23;
  KCSRPClientContext *context;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  secLogObjForScope("joining");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v10, OS_LOG_TYPE_DEFAULT, "joining: initWithSecretDelegate called", buf, 2u);
  }

  v26.receiver = self;
  v26.super_class = (Class)KCJoiningRequestSecretSession;
  v11 = -[KCJoiningRequestSecretSession init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_secretDelegate, v9);
    v12->_state = 0;
    v12->_dsid = a4;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    defaults = v12->_defaults;
    v12->_defaults = (NSMutableDictionary *)v13;

    v12->_piggy_version = 2;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v12->_sessionUUID;
    v12->_sessionUUID = (NSString *)v16;

    secLogObjForScope("joining");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[KCJoiningRequestSecretSession sessionUUID](v12, "sessionUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v19;
      _os_log_impl(&dword_20D7B6000, v18, OS_LOG_TYPE_DEFAULT, "joining: initWithSecretDelegate called, uuid=%@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = [KCSRPClientContext alloc];
    v22 = ccsha256_di();
    v23 = -[KCSRPContext initWithUser:digestInfo:group:randomSource:](v21, "initWithUser:digestInfo:group:randomSource:", v20, v22, ccsrp_gp_rfc5054_3072(), a5);
    context = v12->_context;
    v12->_context = (KCSRPClientContext *)v23;

  }
  return v12;
}

- (id)stateString
{
  unsigned int v3;
  __CFString *v4;

  v3 = -[KCJoiningRequestSecretSession state](self, "state");
  if (v3 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[KCJoiningRequestSecretSession state](self, "state"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_24C7B9100[v3];
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[KCJoiningRequestSecretSession dsid](self, "dsid");
  -[KCJoiningRequestSecretSession stateString](self, "stateString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningRequestSecretSession context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<KCJoiningAcceptSession@%p %lld %@ %@>"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (KCAESGCMDuplexSession)session
{
  return (KCAESGCMDuplexSession *)objc_getProperty(self, a2, 24, 1);
}

- (KCJoiningRequestSecretDelegate)secretDelegate
{
  return (KCJoiningRequestSecretDelegate *)objc_loadWeakRetained((id *)&self->_secretDelegate);
}

- (void)setSecretDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_secretDelegate, a3);
}

- (KCSRPClientContext)context
{
  return (KCSRPClientContext *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)dsid
{
  return self->_dsid;
}

- (int)state
{
  return self->_state;
}

- (NSString)piggy_uuid
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPiggy_uuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (unint64_t)piggy_version
{
  return self->_piggy_version;
}

- (void)setPiggy_version:(unint64_t)a3
{
  self->_piggy_version = a3;
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (NSData)challenge
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setChallenge:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSData)salt
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSalt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)sessionUUID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSessionUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
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
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_piggy_uuid, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_secretDelegate);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

+ (id)sessionWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 error:(id *)a5
{
  id v7;
  KCJoiningRequestSecretSession *v8;

  v7 = a3;
  v8 = -[KCJoiningRequestSecretSession initWithSecretDelegate:dsid:error:]([KCJoiningRequestSecretSession alloc], "initWithSecretDelegate:dsid:error:", v7, a4, a5);

  return v8;
}

@end
