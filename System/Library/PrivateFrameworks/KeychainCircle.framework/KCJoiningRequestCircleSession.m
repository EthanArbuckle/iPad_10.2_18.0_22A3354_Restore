@implementation KCJoiningRequestCircleSession

- (void)setContextIDForSession:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x24BDE84C8];
  v5 = a3;
  v6 = [v4 alloc];
  -[KCJoiningRequestCircleSession controlArguments](self, "controlArguments");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningRequestCircleSession controlArguments](self, "controlArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithContainerName:contextID:altDSID:", v7, v5, v9);

  -[KCJoiningRequestCircleSession setControlArguments:](self, "setControlArguments:", v10);
}

- (id)encryptedPeerInfo:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;
  const void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  if (!self->_session)
  {
    KCJoiningErrorCreate(7, a3, CFSTR("Attempt to encrypt with no session"), v3, v4, v5, v6, v7, v15);
    return 0;
  }
  -[KCJoiningRequestCircleSession circleDelegate](self, "circleDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (const void *)objc_msgSend(v10, "copyPeerInfoError:", a3);

  if (!v11)
    return 0;
  v12 = (void *)SOSPeerInfoCopyEncodedData();
  CFRelease(v11);
  if (v12)
  {
    -[KCAESGCMDuplexSession encrypt:error:](self->_session, "encrypt:error:", v12, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    if (a3)
      *a3 = 0;
  }

  return v13;
}

- (id)encryptedInitialMessage:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  KCInitialMessageData *v12;
  KCAESGCMDuplexSession *session;
  void *v14;
  void *v15;
  uint64_t v17;

  v11 = a3;
  if (self->_session)
  {
    v12 = objc_alloc_init(KCInitialMessageData);
    -[KCInitialMessageData setPrepareMessage:](v12, "setPrepareMessage:", v11);
    session = self->_session;
    -[KCInitialMessageData data](v12, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCAESGCMDuplexSession encrypt:error:](session, "encrypt:error:", v14, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    KCJoiningErrorCreate(7, a4, CFSTR("Attempt to encrypt with no session"), v6, v7, v8, v9, v10, v17);
    v15 = 0;
  }

  return v15;
}

- (id)encryptPeerInfo:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  secLogObjForScope("joining");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v5, OS_LOG_TYPE_DEFAULT, "doing SOS encryptedPeerInfo", buf, 2u);
  }

  v18 = 0;
  -[KCJoiningRequestCircleSession encryptedPeerInfo:](self, "encryptedPeerInfo:", &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  v8 = v7;
  if (!v6 || v7)
  {
    secLogObjForScope("SecError");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_20D7B6000, v10, OS_LOG_TYPE_DEFAULT, "joining: failed to create encrypted peerInfo: %@", buf, 0xCu);
    }

    if (v8)
    {
      if (a3)
      {
        v9 = 0;
        *a3 = objc_retainAutorelease(v8);
        goto LABEL_13;
      }
    }
    else
    {
      KCJoiningErrorCreate(13, a3, CFSTR("failed to encrypt the SOS peer info"), v11, v12, v13, v14, v15, v17);
    }
    v9 = 0;
    goto LABEL_13;
  }
  v9 = v6;
LABEL_13:

  return v9;
}

- (id)initialMessage:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32[6];
  uint8_t v33[16];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[8];
  uint8_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  secLogObjForScope("joining");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v5, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestCircleSession initialMessage called", buf, 2u);
  }

  if (-[KCJoiningRequestCircleSession piggy_version](self, "piggy_version") == 2)
  {
    *(_QWORD *)buf = 0;
    v41 = buf;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__386;
    v44 = __Block_byref_object_dispose__387;
    v45 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__386;
    v38 = __Block_byref_object_dispose__387;
    v39 = 0;
    -[KCJoiningRequestCircleSession joiningConfiguration](self, "joiningConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "epoch");

    if (!v7)
    {
      secLogObjForScope("SecError");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_20D7B6000, v22, OS_LOG_TYPE_DEFAULT, "joining: expected acceptor epoch! returning nil.", v33, 2u);
      }

      KCJoiningErrorCreate(11, a3, CFSTR("expected acceptor epoch"), v23, v24, v25, v26, v27, v32[0]);
      goto LABEL_17;
    }
    -[KCJoiningRequestCircleSession otControl](self, "otControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCJoiningRequestCircleSession controlArguments](self, "controlArguments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCJoiningRequestCircleSession joiningConfiguration](self, "joiningConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = (uint64_t)__48__KCJoiningRequestCircleSession_initialMessage___block_invoke;
    v32[3] = (uint64_t)&unk_24C7B9180;
    v32[4] = (uint64_t)&v34;
    v32[5] = (uint64_t)buf;
    objc_msgSend(v8, "rpcPrepareIdentityAsApplicantWithArguments:configuration:reply:", v9, v10, v32);

    v11 = (void *)v35[5];
    if (v11)
    {
      if (a3)
      {
        v12 = 0;
        *a3 = objc_retainAutorelease(v11);
LABEL_27:
        _Block_object_dispose(&v34, 8);

        _Block_object_dispose(buf, 8);
        return v12;
      }
LABEL_17:
      v12 = 0;
      goto LABEL_27;
    }
    if (SOSCCIsSOSTrustAndSyncingEnabled())
    {
      -[KCJoiningRequestCircleSession encryptPeerInfo:](self, "encryptPeerInfo:", a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_17;
    }
    else
    {
      secLogObjForScope("joining");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_20D7B6000, v29, OS_LOG_TYPE_DEFAULT, "SOS not enabled, skipping peer info encryption", v33, 2u);
      }

      v28 = 0;
    }
    self->_state = 0;
    -[KCJoiningRequestCircleSession encryptedInitialMessage:error:](self, "encryptedInitialMessage:error:", *((_QWORD *)v41 + 5), a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[KCJoiningMessage messageWithType:data:payload:error:](KCJoiningMessage, "messageWithType:data:payload:error:", 4, v30, v28, a3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "der");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    -[KCJoiningRequestCircleSession encryptPeerInfo:](self, "encryptPeerInfo:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      self->_state = 0;
      +[KCJoiningMessage messageWithType:data:error:](KCJoiningMessage, "messageWithType:data:error:", 4, v13, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "der");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

    return v12;
  }
  secLogObjForScope("SecError");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v15, OS_LOG_TYPE_DEFAULT, "joining: device does not support SOS nor piggybacking version 2", buf, 2u);
  }

  KCJoiningErrorCreate(14, a3, CFSTR("device does not support SOS nor piggybacking version 2"), v16, v17, v18, v19, v20, v32[0]);
  return 0;
}

- (void)waitForOctagonUpgrade
{
  void *v3;
  id v4;

  -[KCJoiningRequestCircleSession otControl](self, "otControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[KCJoiningRequestCircleSession controlArguments](self, "controlArguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waitForOctagonUpgrade:reply:", v3, &__block_literal_global_413);

}

- (BOOL)shouldJoinSOS:(id)a3 pairingMessage:(id)a4
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
        v11 = "acceptor explicitly does not support SOS";
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

- (id)handleCircleBlob:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  OTPairingMessage *v15;
  void *v16;
  OTPairingMessage *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  char v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  id v57;
  id v58;
  const char *v59;
  uint64_t v61;
  _QWORD v62[5];
  uint8_t buf[8];
  uint8_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint8_t v69[4];
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  secLogObjForScope("joining");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v7, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestCircleSession handleCircleBlob called", buf, 2u);
  }

  if (objc_msgSend(v6, "type") == 5)
  {
    if (-[KCJoiningRequestCircleSession piggy_version](self, "piggy_version") == 2)
    {
      objc_msgSend(v6, "firstData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 == 0;

      if (!v14)
      {
        *(_QWORD *)buf = 0;
        v64 = buf;
        v65 = 0x3032000000;
        v66 = __Block_byref_object_copy__386;
        v67 = __Block_byref_object_dispose__387;
        v68 = 0;
        v15 = [OTPairingMessage alloc];
        objc_msgSend(v6, "firstData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[OTPairingMessage initWithData:](v15, "initWithData:", v16);

        if (!-[OTPairingMessage hasVoucher](v17, "hasVoucher"))
        {
          secLogObjForScope("SecError");
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v69 = 0;
            _os_log_impl(&dword_20D7B6000, v38, OS_LOG_TYPE_DEFAULT, "octagon: expected voucher! returning from piggybacking.", v69, 2u);
          }

          KCJoiningErrorCreate(15, a4, CFSTR("Missing voucher from acceptor"), v39, v40, v41, v42, v43, v61);
          v30 = 0;
          goto LABEL_50;
        }
        -[OTPairingMessage voucher](v17, "voucher");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCJoiningRequestCircleSession otControl](self, "otControl");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCJoiningRequestCircleSession controlArguments](self, "controlArguments");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCJoiningRequestCircleSession joiningConfiguration](self, "joiningConfiguration");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "voucher");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "voucherSignature");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x24BDAC760];
        v62[1] = 3221225472;
        v62[2] = __56__KCJoiningRequestCircleSession_handleCircleBlob_error___block_invoke;
        v62[3] = &unk_24C7B91E8;
        v62[4] = buf;
        objc_msgSend(v19, "rpcJoinWithArguments:configuration:vouchData:vouchSig:reply:", v20, v21, v22, v23, v62);

        if (!-[KCJoiningRequestCircleSession shouldJoinSOS:pairingMessage:](self, "shouldJoinSOS:pairingMessage:", v6, v17))goto LABEL_13;
        secLogObjForScope("joining");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v69 = 0;
          _os_log_impl(&dword_20D7B6000, v24, OS_LOG_TYPE_DEFAULT, "doing SOS processCircleJoinData", v69, 2u);
        }

        -[KCJoiningRequestCircleSession session](self, "session");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "secondData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "decryptAndVerify:error:", v26, a4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          -[KCJoiningRequestCircleSession circleDelegate](self, "circleDelegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "processCircleJoinData:version:error:", v27, 1, a4);

          if ((v29 & 1) != 0)
          {

LABEL_13:
            self->_state = 1;
            objc_msgSend(MEMORY[0x24BDBCE50], "data");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            self->_state = 1;
LABEL_49:

LABEL_50:
            _Block_object_dispose(buf, 8);

            goto LABEL_51;
          }
          secLogObjForScope("SecError");
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            if (a4)
              v58 = *a4;
            else
              v58 = 0;
            *(_DWORD *)v69 = 138412290;
            v70 = v58;
            v59 = "joining: processCircleJoinData failed %@";
LABEL_47:
            _os_log_impl(&dword_20D7B6000, v56, OS_LOG_TYPE_DEFAULT, v59, v69, 0xCu);
          }
        }
        else
        {
          secLogObjForScope("joining");
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            if (a4)
              v57 = *a4;
            else
              v57 = 0;
            *(_DWORD *)v69 = 138412290;
            v70 = v57;
            v59 = "decryptAndVerify failed: %@";
            goto LABEL_47;
          }
        }

        v30 = 0;
        goto LABEL_49;
      }
    }
    if (!SOSCCIsSOSTrustAndSyncingEnabled())
    {
      secLogObjForScope("joining");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v33, OS_LOG_TYPE_DEFAULT, "SOS not enabled for this platform", buf, 2u);
      }
      goto LABEL_26;
    }
    -[KCJoiningRequestCircleSession session](self, "session");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "decryptAndVerify:error:", v32, a4);
    v33 = objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      -[KCJoiningRequestCircleSession circleDelegate](self, "circleDelegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "processCircleJoinData:version:error:", v33, 1, a4);

      if ((v35 & 1) != 0)
      {
        secLogObjForScope("joining");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D7B6000, v36, OS_LOG_TYPE_DEFAULT, "joined the SOS circle!", buf, 2u);
        }

        secLogObjForScope("joining");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D7B6000, v37, OS_LOG_TYPE_DEFAULT, "kicking off SOS Upgrade into Octagon!", buf, 2u);
        }

        -[KCJoiningRequestCircleSession waitForOctagonUpgrade](self, "waitForOctagonUpgrade");
LABEL_26:

        self->_state = 1;
        objc_msgSend(MEMORY[0x24BDBCE50], "data");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_51;
      }
      secLogObjForScope("SecError");
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v50, OS_LOG_TYPE_DEFAULT, "joining: failed to process SOS circle", buf, 2u);
      }

      KCJoiningErrorCreate(18, a4, CFSTR("Failed to process circleBlob"), v51, v52, v53, v54, v55, v61);
    }
    else
    {
      secLogObjForScope("SecError");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v44, OS_LOG_TYPE_DEFAULT, "joining: circleBlob is nil", buf, 2u);
      }

      KCJoiningErrorCreate(17, a4, CFSTR("Failed to decrypt circleBlob"), v45, v46, v47, v48, v49, v61);
    }

  }
  else
  {
    KCJoiningErrorCreate(6, a4, CFSTR("Expected CircleBlob!"), v8, v9, v10, v11, v12, v61);
  }
  v30 = 0;
LABEL_51:

  return v30;
}

- (id)processMessage:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v6 = a3;
  secLogObjForScope("joining");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_20D7B6000, v7, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestCircleSession processMessage called", (uint8_t *)&v17, 2u);
  }

  +[KCJoiningMessage messageWithDER:error:](KCJoiningMessage, "messageWithDER:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_8;
  v9 = -[KCJoiningRequestCircleSession state](self, "state");
  if (v9 == 1)
  {
    KCJoiningErrorCreate(6, a4, CFSTR("Done, no messages expected."), v10, v11, v12, v13, v14, v17);
    goto LABEL_8;
  }
  if (v9)
  {
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  -[KCJoiningRequestCircleSession handleCircleBlob:error:](self, "handleCircleBlob:error:", v8, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v15;
}

- (BOOL)isDone
{
  -[KCJoiningRequestCircleSession setState:](self, "setState:", 1);
  return 1;
}

- (KCJoiningRequestCircleSession)initWithCircleDelegate:(id)a3 session:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  KCJoiningRequestCircleSession *v12;

  v8 = (void *)MEMORY[0x24BDE84C0];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "controlObject:error:", 1, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[KCJoiningRequestCircleSession initWithCircleDelegate:session:otcontrol:error:](self, "initWithCircleDelegate:session:otcontrol:error:", v10, v9, v11, a5);

  return v12;
}

- (KCJoiningRequestCircleSession)initWithCircleDelegate:(id)a3 session:(id)a4 otcontrol:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  KCJoiningRequestCircleSession *v15;
  KCJoiningRequestCircleSession *v16;
  id v17;
  void *v18;
  uint64_t v19;
  OTJoiningConfiguration *joiningConfiguration;
  id v21;
  void *v22;
  uint64_t v23;
  OTControlArguments *controlArguments;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  secLogObjForScope("joining");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "pairingUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v14;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "joining: KCJoiningRequestCircleSession initWithCircleDelegate called, uuid=%@", buf, 0xCu);

  }
  v26.receiver = self;
  v26.super_class = (Class)KCJoiningRequestCircleSession;
  v15 = -[KCJoiningRequestCircleSession init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_circleDelegate, a3);
    objc_storeStrong((id *)&v16->_session, a4);
    -[KCJoiningRequestCircleSession setState:](v16, "setState:", 0);
    objc_storeStrong((id *)&v16->_otControl, a5);
    v17 = objc_alloc(MEMORY[0x24BDE84D0]);
    objc_msgSend(v11, "pairingUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithProtocolType:uniqueDeviceID:uniqueClientID:pairingUUID:epoch:isInitiator:", CFSTR("OctagonPiggybacking"), CFSTR("requester-id"), CFSTR("requester-id"), v18, objc_msgSend(v11, "epoch"), 1);
    joiningConfiguration = v16->_joiningConfiguration;
    v16->_joiningConfiguration = (OTJoiningConfiguration *)v19;

    v21 = objc_alloc(MEMORY[0x24BDE84C8]);
    objc_msgSend(v11, "altDSID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithAltDSID:", v22);
    controlArguments = v16->_controlArguments;
    v16->_controlArguments = (OTControlArguments *)v23;

    v16->_piggy_version = objc_msgSend(v11, "piggybackingVersion");
  }

  return v16;
}

- (KCJoiningRequestCircleDelegate)circleDelegate
{
  return (KCJoiningRequestCircleDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (KCAESGCMDuplexSession)session
{
  return (KCAESGCMDuplexSession *)objc_getProperty(self, a2, 24, 1);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (unint64_t)piggy_version
{
  return self->_piggy_version;
}

- (void)setPiggy_version:(unint64_t)a3
{
  self->_piggy_version = a3;
}

- (OTControl)otControl
{
  return self->_otControl;
}

- (void)setOtControl:(id)a3
{
  objc_storeStrong((id *)&self->_otControl, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlArguments, 0);
  objc_storeStrong((id *)&self->_joiningConfiguration, 0);
  objc_storeStrong((id *)&self->_otControl, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_circleDelegate, 0);
}

void __56__KCJoiningRequestCircleSession_handleCircleBlob_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_20D7B6000, v4, OS_LOG_TYPE_DEFAULT, "octagon: error joining octagon: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = v3;
    v7 = *(NSObject **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6;
  }
  else
  {
    secLogObjForScope("octagon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_20D7B6000, v7, OS_LOG_TYPE_DEFAULT, "successfully joined octagon", (uint8_t *)&v8, 2u);
    }
  }

}

void __54__KCJoiningRequestCircleSession_waitForOctagonUpgrade__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    secLogObjForScope("SecError");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_20D7B6000, v3, OS_LOG_TYPE_DEFAULT, "pairing: failed to upgrade initiator into Octagon: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __48__KCJoiningRequestCircleSession_initialMessage___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  OTPairingMessage *v20;
  OTSupportSOSMessage *v21;
  OTSupportOctagonMessage *v22;
  OTApplicantToSponsorRound2M1 *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v18)
  {
    secLogObjForScope("SecError");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v18;
      _os_log_impl(&dword_20D7B6000, v19, OS_LOG_TYPE_DEFAULT, "octagon: error preparing identity: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a7);
  }
  else
  {
    v20 = objc_alloc_init(OTPairingMessage);
    v21 = objc_alloc_init(OTSupportSOSMessage);
    -[OTPairingMessage setSupportsSOS:](v20, "setSupportsSOS:", v21);

    v22 = objc_alloc_init(OTSupportOctagonMessage);
    -[OTPairingMessage setSupportsOctagon:](v20, "setSupportsOctagon:", v22);

    v23 = objc_alloc_init(OTApplicantToSponsorRound2M1);
    -[OTApplicantToSponsorRound2M1 setPeerID:](v23, "setPeerID:", v13);
    -[OTApplicantToSponsorRound2M1 setPermanentInfo:](v23, "setPermanentInfo:", v14);
    -[OTApplicantToSponsorRound2M1 setPermanentInfoSig:](v23, "setPermanentInfoSig:", v15);
    -[OTApplicantToSponsorRound2M1 setStableInfo:](v23, "setStableInfo:", v16);
    -[OTApplicantToSponsorRound2M1 setStableInfoSig:](v23, "setStableInfoSig:", v17);
    -[OTPairingMessage setPrepare:](v20, "setPrepare:", v23);
    if (SOSCCIsSOSTrustAndSyncingEnabled())
      v24 = 1;
    else
      v24 = 2;
    -[OTPairingMessage supportsSOS](v20, "supportsSOS");
    v36 = v17;
    v25 = v16;
    v26 = v15;
    v27 = v14;
    v28 = v13;
    v29 = a1;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSupported:", v24);

    -[OTPairingMessage supportsOctagon](v20, "supportsOctagon");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setSupported:", 1);

    -[OTPairingMessage data](v20, "data");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(v29 + 40);
    v13 = v28;
    v14 = v27;
    v15 = v26;
    v16 = v25;
    v17 = v36;
    v34 = *(_QWORD *)(v33 + 8);
    v35 = *(void **)(v34 + 40);
    *(_QWORD *)(v34 + 40) = v32;

  }
}

+ (id)sessionWithCircleDelegate:(id)a3 session:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  KCJoiningRequestCircleSession *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[KCJoiningRequestCircleSession initWithCircleDelegate:session:error:]([KCJoiningRequestCircleSession alloc], "initWithCircleDelegate:session:error:", v8, v7, a5);

  return v9;
}

@end
