@implementation NEIKEv2Listener

- (void)requestConfigurationForSession:(id)a3 sessionConfig:(id)a4 childConfig:(id)a5 validateAuthBlock:(id)a6 responseBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  NSObject *delegateQueue;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  _QWORD block[4];
  id v28;
  NEIKEv2Listener *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  ne_log_obj();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v12;
    _os_log_impl(&dword_19BD16000, v17, OS_LOG_TYPE_DEFAULT, "Session %@ requesting configuration", buf, 0xCu);
  }

  if (self)
  {
    -[NSMutableSet removeObject:](self->_sessionsBeforeAuth, "removeObject:", v12);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v19 = WeakRetained;
      v20 = (void *)objc_msgSend(v13, "copy");
      v21 = (void *)objc_msgSend(v14, "copy");
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __108__NEIKEv2Listener_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock___block_invoke;
      block[3] = &unk_1E3CC12C0;
      v28 = v19;
      v29 = self;
      v30 = v12;
      v31 = v20;
      v32 = v21;
      v33 = v15;
      v34 = v16;
      v23 = v21;
      v24 = v20;
      v25 = v19;
      dispatch_async(delegateQueue, block);

      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(0, "removeObject:", v12);
  }
  ne_log_obj();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19BD16000, v26, OS_LOG_TYPE_ERROR, "Listener delegate is nil, returning failure", buf, 2u);
  }

  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v16 + 2))(v16, 0, 0, 0);
LABEL_6:

}

- (void)sessionFailedBeforeRequestingConfiguration:(id)a3
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  NSMutableSet *sessionsBeforeAuth;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEFAULT, "Session %@ failed before requesting configuration", (uint8_t *)&v8, 0xCu);
    }

    if (self)
      sessionsBeforeAuth = self->_sessionsBeforeAuth;
    else
      sessionsBeforeAuth = 0;
    -[NSMutableSet removeObject:](sessionsBeforeAuth, "removeObject:", v4);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315138;
      v9 = "-[NEIKEv2Listener sessionFailedBeforeRequestingConfiguration:]";
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "%s called with null session", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)receivePacket:(id)a3 transport:(id)a4
{
  _BYTE *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  id v12;
  uint64_t v13;
  NSObject *WeakRetained;
  NEIKEv2IKESAConfiguration *v15;
  NEIKEv2IKESAConfiguration *ikeConfig;
  NEIKEv2IKESAConfiguration *v17;
  NEIKEv2IKESAConfiguration *v18;
  const char *v19;
  id Property;
  id v21;
  void *v22;
  NEIPSecSASession *v23;
  BOOL v24;
  NEIKEv2Session *v25;
  void *v26;
  NEIPSecSASession *saSession;
  NSObject *v28;
  NEIKEv2IKESAConfiguration *v29;
  NEIKEv2Listener *v30;
  void *v31;
  NSObject *v32;
  NSString *kernelSASessionName;
  NSObject *p_super;
  NEIKEv2IKESAConfiguration *v35;
  NEIKEv2Listener *v36;
  void *v37;
  NSObject *v38;
  NSMutableSet *sessionsBeforeAuth;
  NSObject *v40;
  id v41;
  OS_dispatch_queue *delegateQueue;
  NSObject *v43;
  NSObject *v44;
  _QWORD block[5];
  NSObject *v46;
  id v47;
  _BYTE buf[12];
  __int16 v49;
  _BYTE *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NEIKEv2Listener listenerQueue](self, "listenerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!self || !self->_cancelled)
  {
    if (!v6 || (v6[11] & 1) == 0)
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v6;
        v11 = "Listener received responder packet %@";
LABEL_41:
        _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if ((v6[10] & 1) != 0)
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v6;
        v11 = "Listener received response packet %@";
        goto LABEL_41;
      }
      goto LABEL_12;
    }
    v12 = objc_getProperty(v6, v9, 40, 1);
    v13 = objc_msgSend(v12, "value");

    if (v13)
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v6;
        v11 = "Listener received packet with non-zero responder SPI %@";
        goto LABEL_41;
      }
LABEL_12:

      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v6;
        v11 = "Listener received non SA_INIT packet %@";
        goto LABEL_41;
      }
      goto LABEL_12;
    }
    if (self)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_packetDelegate);
      v15 = self->_ikeConfig;
      if (WeakRetained)
        goto LABEL_21;
      ikeConfig = self->_ikeConfig;
    }
    else
    {
      v15 = 0;
      ikeConfig = 0;
    }
    v17 = v15;
    v18 = ikeConfig;
    v15 = (NEIKEv2IKESAConfiguration *)-[NEIKEv2IKESAConfiguration copy](v18, "copy");

    if (v7)
      Property = objc_getProperty(v7, v19, 24, 1);
    else
      Property = 0;
    v21 = Property;
    v22 = (void *)objc_msgSend(v21, "copy");
    -[NEIKEv2IKESAConfiguration setRemoteEndpoint:](v15, "setRemoteEndpoint:", v22);

    WeakRetained = 0;
    v10 = 0;
    v23 = 0;
    if (!self)
    {
LABEL_22:
      v24 = v23 == 0;
      v25 = [NEIKEv2Session alloc];
      -[NEIKEv2Listener listenerQueue](self, "listenerQueue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        if (self)
        {
          kernelSASessionName = self->_kernelSASessionName;
          p_super = &v25->super;
          v35 = v15;
          v36 = self;
          v37 = v26;
        }
        else
        {
          p_super = &v25->super;
          v35 = v15;
          v36 = 0;
          v37 = v26;
          kernelSASessionName = 0;
        }
        v32 = -[NEIKEv2Session initWithIKEConfig:configurationDelegate:queue:kernelSASessionName:transport:packetDelegate:](p_super, v35, v36, v37, kernelSASessionName, v7, v10);
      }
      else
      {
        if (self)
        {
          saSession = self->_saSession;
          v28 = &v25->super;
          v29 = v15;
          v30 = self;
          v31 = v26;
        }
        else
        {
          v28 = &v25->super;
          v29 = v15;
          v30 = 0;
          v31 = v26;
          saSession = 0;
        }
        v32 = -[NEIKEv2Session initWithIKEConfig:configurationDelegate:queue:saSession:shouldCopySASession:transport:packetDelegate:](v28, v29, v30, v31, saSession, v7, v10);
      }
      v38 = v32;

      if (v38)
      {
        if (self)
          sessionsBeforeAuth = self->_sessionsBeforeAuth;
        else
          sessionsBeforeAuth = 0;
        -[NSMutableSet addObject:](sessionsBeforeAuth, "addObject:", v38);
        ne_log_large_obj();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v38;
          v49 = 2112;
          v50 = v6;
          _os_log_impl(&dword_19BD16000, v40, OS_LOG_TYPE_DEFAULT, "Created new session %@ to handle %@", buf, 0x16u);
        }

        -[NSObject receivePacket:](v38, "receivePacket:", v6);
        if (self)
        {
          v41 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_initWeak((id *)buf, v41);

          delegateQueue = self->_delegateQueue;
        }
        else
        {
          delegateQueue = 0;
          *(_QWORD *)buf = 0;
        }
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __43__NEIKEv2Listener_receivePacket_transport___block_invoke;
        block[3] = &unk_1E3CC1360;
        v43 = delegateQueue;
        objc_copyWeak(&v47, (id *)buf);
        block[4] = self;
        v46 = v38;
        dispatch_async(v43, block);

        objc_destroyWeak(&v47);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        ne_log_obj();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[NEIKEv2Listener receivePacket:transport:]";
          _os_log_fault_impl(&dword_19BD16000, v44, OS_LOG_TYPE_FAULT, "%s called with null newSession", buf, 0xCu);
        }

      }
      goto LABEL_12;
    }
LABEL_21:
    v23 = self->_saSession;
    v10 = WeakRetained;
    goto LABEL_22;
  }
LABEL_13:

}

- (void)invalidatingTransport:(id)a3
{
  if (self)
    self = (NEIKEv2Listener *)self->_connectionTransports;
  -[NEIKEv2Listener removeObject:](self, "removeObject:", a3);
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 listenerUDPPort:(id)a5 listenerInterface:(id)a6 listenerQueue:(id)a7 delegate:(id)a8 delegateQueue:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NEIKEv2Listener *v23;
  NSObject *v25;
  const char *v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = v21;
  if (!v15)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136315138;
    v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delegate"
          ":delegateQueue:]";
    v26 = "%s called with null ikeConfig";
LABEL_18:
    _os_log_fault_impl(&dword_19BD16000, v25, OS_LOG_TYPE_FAULT, v26, buf, 0xCu);
    goto LABEL_19;
  }
  if (!v17)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136315138;
    v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delegate"
          ":delegateQueue:]";
    v26 = "%s called with null listenerUDPPort";
    goto LABEL_18;
  }
  if (!v20)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136315138;
    v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delegate"
          ":delegateQueue:]";
    v26 = "%s called with null delegate";
    goto LABEL_18;
  }
  if (!v21)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136315138;
    v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delegate"
          ":delegateQueue:]";
    v26 = "%s called with null delegateQueue";
    goto LABEL_18;
  }
  if (!v18)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delega"
            "te:delegateQueue:]";
      v26 = "%s called with null listenerInterface";
      goto LABEL_18;
    }
LABEL_19:

    v23 = 0;
    goto LABEL_7;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueue:delegate:delegateQueue:includeP2P:](&self->super, v15, v16, 0, v17, v18, v19, v20, v21, 0);
  v23 = self;
LABEL_7:

  return v23;
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NEIKEv2Listener *v21;
  NSObject *v23;
  const char *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (!v14)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    v24 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_19BD16000, v23, OS_LOG_TYPE_FAULT, v24, buf, 0xCu);
    goto LABEL_16;
  }
  if (!v16)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    v24 = "%s called with null listenerUDPPort";
    goto LABEL_15;
  }
  if (!v18)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    v24 = "%s called with null delegate";
    goto LABEL_15;
  }
  if (!v19)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
      v24 = "%s called with null delegateQueue";
      goto LABEL_15;
    }
LABEL_16:

    v21 = 0;
    goto LABEL_6;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueue:delegate:delegateQueue:includeP2P:](&self->super, v14, v15, 0, v16, 0, v17, v18, v19, 0);
  v21 = self;
LABEL_6:

  return v21;
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 packetDelegate:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NEIKEv2Listener *v21;
  NSObject *v23;
  const char *v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (!v14)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    v24 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_19BD16000, v23, OS_LOG_TYPE_FAULT, v24, (uint8_t *)&v25, 0xCu);
    goto LABEL_16;
  }
  if (!v16)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    v24 = "%s called with null packetDelegate";
    goto LABEL_15;
  }
  if (!v18)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    v24 = "%s called with null delegate";
    goto LABEL_15;
  }
  if (!v19)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v25 = 136315138;
      v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:packetDelegate:listenerQueue:delegate:delegateQueue:]";
      v24 = "%s called with null delegateQueue";
      goto LABEL_15;
    }
LABEL_16:

    v21 = 0;
    goto LABEL_6;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:](self, v14, v15, 0, v16, v17, v18, v19);
  v21 = self;
LABEL_6:

  return v21;
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerInterface:(id)a6 listenerQueue:(id)a7 delegate:(id)a8 delegateQueue:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NEIKEv2Listener *v23;
  NSObject *v25;
  const char *v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = v21;
  if (!v15)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136315138;
    v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueu"
          "e:delegate:delegateQueue:]";
    v26 = "%s called with null ikeConfig";
LABEL_18:
    _os_log_fault_impl(&dword_19BD16000, v25, OS_LOG_TYPE_FAULT, v26, buf, 0xCu);
    goto LABEL_19;
  }
  if (!v17)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136315138;
    v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueu"
          "e:delegate:delegateQueue:]";
    v26 = "%s called with null listenerUDPPort";
    goto LABEL_18;
  }
  if (!v20)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136315138;
    v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueu"
          "e:delegate:delegateQueue:]";
    v26 = "%s called with null delegate";
    goto LABEL_18;
  }
  if (!v21)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136315138;
    v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueu"
          "e:delegate:delegateQueue:]";
    v26 = "%s called with null delegateQueue";
    goto LABEL_18;
  }
  if (!v18)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQu"
            "eue:delegate:delegateQueue:]";
      v26 = "%s called with null listenerInterface";
      goto LABEL_18;
    }
LABEL_19:

    v23 = 0;
    goto LABEL_7;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueue:delegate:delegateQueue:includeP2P:](&self->super, v15, 0, v16, v17, v18, v19, v20, v21, 0);
  v23 = self;
LABEL_7:

  return v23;
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NEIKEv2Listener *v21;
  NSObject *v23;
  const char *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (!v14)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    v24 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_19BD16000, v23, OS_LOG_TYPE_FAULT, v24, buf, 0xCu);
    goto LABEL_16;
  }
  if (!v16)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    v24 = "%s called with null listenerUDPPort";
    goto LABEL_15;
  }
  if (!v18)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    v24 = "%s called with null delegate";
    goto LABEL_15;
  }
  if (!v19)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
      v24 = "%s called with null delegateQueue";
      goto LABEL_15;
    }
LABEL_16:

    v21 = 0;
    goto LABEL_6;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueue:delegate:delegateQueue:includeP2P:](&self->super, v14, 0, v15, v16, 0, v17, v18, v19, 0);
  v21 = self;
LABEL_6:

  return v21;
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 includeP2P:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NEIKEv2Listener *v22;
  NSObject *v24;
  const char *v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = v20;
  if (!v15)
  {
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    v27 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegat"
          "eQueue:includeP2P:]";
    v25 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_19BD16000, v24, OS_LOG_TYPE_FAULT, v25, buf, 0xCu);
    goto LABEL_16;
  }
  if (!v17)
  {
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    v27 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegat"
          "eQueue:includeP2P:]";
    v25 = "%s called with null listenerUDPPort";
    goto LABEL_15;
  }
  if (!v19)
  {
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    v27 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegat"
          "eQueue:includeP2P:]";
    v25 = "%s called with null delegate";
    goto LABEL_15;
  }
  if (!v20)
  {
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:deleg"
            "ateQueue:includeP2P:]";
      v25 = "%s called with null delegateQueue";
      goto LABEL_15;
    }
LABEL_16:

    v22 = 0;
    goto LABEL_6;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueue:delegate:delegateQueue:includeP2P:](&self->super, v15, 0, v16, v17, 0, v18, v19, v20, a9);
  v22 = self;
LABEL_6:

  return v22;
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 packetDelegate:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NEIKEv2Listener *v21;
  NSObject *v23;
  const char *v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (!v14)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    v24 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_19BD16000, v23, OS_LOG_TYPE_FAULT, v24, (uint8_t *)&v25, 0xCu);
    goto LABEL_16;
  }
  if (!v16)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    v24 = "%s called with null packetDelegate";
    goto LABEL_15;
  }
  if (!v18)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    v24 = "%s called with null delegate";
    goto LABEL_15;
  }
  if (!v19)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v25 = 136315138;
      v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]";
      v24 = "%s called with null delegateQueue";
      goto LABEL_15;
    }
LABEL_16:

    v21 = 0;
    goto LABEL_6;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:](self, v14, 0, v15, v16, v17, v18, v19);
  v21 = self;
LABEL_6:

  return v21;
}

- (void)dealloc
{
  objc_super v3;

  -[NEIKEv2Listener cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2Listener;
  -[NEIKEv2Listener dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  NSObject *v3;
  NSObject *listener;
  NSMutableSet *sessionsBeforeAuth;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableSet *connectionTransports;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[8];
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling IKE listener", buf, 2u);
  }

  if (self)
  {
    self->_cancelled = 1;
    listener = self->_listener;
    if (listener)
    {
      nw_listener_cancel(listener);
      objc_storeStrong((id *)&self->_listener, 0);
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    sessionsBeforeAuth = self->_sessionsBeforeAuth;
  }
  else
  {
    sessionsBeforeAuth = 0;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
  }
  v6 = sessionsBeforeAuth;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10++), "invalidate");
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

  if (self)
  {
    -[NSMutableSet removeAllObjects](self->_sessionsBeforeAuth, "removeAllObjects");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    connectionTransports = self->_connectionTransports;
  }
  else
  {
    objc_msgSend(0, "removeAllObjects");
    connectionTransports = 0;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
  }
  v12 = connectionTransports;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:](*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), 0, 0);
      }
      while (v14 != v16);
      v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v14);
  }

  if (self)
  {
    -[NSMutableSet removeAllObjects](self->_connectionTransports, "removeAllObjects", (_QWORD)v17);
    -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:]((uint64_t)self->_packetDelegateTransport, 0, 0);
    objc_storeStrong((id *)&self->_packetDelegateTransport, 0);
  }
  else
  {
    objc_msgSend(0, "removeAllObjects", (_QWORD)v17);
    -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:](0, 0, 0);
  }
}

- (OS_dispatch_queue)listenerQueue
{
  return self->_listenerQueue;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_packetDelegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_packetDelegateTransport, 0);
  objc_storeStrong((id *)&self->_connectionTransports, 0);
  objc_storeStrong((id *)&self->_sessionsBeforeAuth, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_kernelSASessionName, 0);
  objc_storeStrong((id *)&self->_saSession, 0);
  objc_storeStrong((id *)&self->_ikeConfig, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
}

- (NSObject)initWithListenerIKEConfig:(void *)a3 saSession:(void *)a4 kernelSASessionName:(void *)a5 packetDelegate:(void *)a6 listenerQueue:(void *)a7 delegate:(void *)a8 delegateQueue:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  objc_class *v24;
  Class isa;
  objc_class *v26;
  Class v27;
  uint64_t v28;
  Class v29;
  objc_class *v30;
  NSObject *v31;
  dispatch_queue_t v32;
  Class v33;
  void *v34;
  char isKindOfClass;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  NEIKEv2Transport *v41;
  Class v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  id v48;
  id v49;
  uint8_t buf[16];
  objc_super v51;

  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v49 = a8;
  if (a1)
  {
    v51.receiver = a1;
    v51.super_class = (Class)NEIKEv2Listener;
    v21 = objc_msgSendSuper2(&v51, sel_init);
    if (v21)
    {
      v22 = v21;
      v48 = v17;
      v23 = v16;
      v24 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      isa = v22[7].isa;
      v22[7].isa = v24;

      v26 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v27 = v22[8].isa;
      v22[8].isa = v26;

      v28 = objc_msgSend(v15, "copy");
      v29 = v22[3].isa;
      v22[3].isa = (Class)v28;

      -[objc_class setServerMode:](v22[3].isa, "setServerMode:", 1);
      objc_storeStrong((id *)&v22[4].isa, a3);
      objc_storeStrong((id *)&v22[5].isa, a4);
      if (v19)
      {
        v30 = (objc_class *)v19;
        v31 = v22[2].isa;
        v22[2].isa = v30;
      }
      else
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = dispatch_queue_create("com.apple.networkextension.ikev2.listener", v31);
        v33 = v22[2].isa;
        v22[2].isa = (Class)v32;

      }
      objc_storeWeak((id *)&v22[10].isa, v20);
      objc_storeStrong((id *)&v22[11].isa, a8);
      objc_storeWeak((id *)&v22[12].isa, v18);
      objc_msgSend(v15, "localEndpoint");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v15, "localEndpoint");
      else
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithHostname:port:", CFSTR("::"), CFSTR("500"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "remoteEndpoint");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v38 = objc_opt_isKindOfClass();

      if ((v38 & 1) != 0)
        objc_msgSend(v15, "remoteEndpoint");
      else
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithHostname:port:", CFSTR("::1"), CFSTR("500"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject listenerQueue](v22, "listenerQueue");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]((uint64_t)NEIKEv2Transport, 0, v39, v36, 0, 0, v40, 0, v18);
      v42 = v22[9].isa;
      v22[9].isa = (Class)v41;

      v43 = (uint64_t)v22[9].isa;
      if (v43)
      {
        -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:](v43, v22, 1);
        v44 = v22;
        v16 = v23;
      }
      else
      {
        ne_log_obj();
        v45 = objc_claimAutoreleasedReturnValue();
        v16 = v23;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19BD16000, v45, OS_LOG_TYPE_FAULT, "[NEIKEv2Transport createTransport] failed", buf, 2u);
        }

        v44 = 0;
      }
      v17 = v48;

    }
    else
    {
      ne_log_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19BD16000, v22, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
      }
      v44 = 0;
    }
    v46 = v49;

  }
  else
  {
    v44 = 0;
    v46 = v49;
  }

  return v44;
}

- (NSObject)initWithListenerIKEConfig:(void *)a3 saSession:(void *)a4 kernelSASessionName:(void *)a5 listenerUDPPort:(void *)a6 listenerInterface:(void *)a7 listenerQueue:(void *)a8 delegate:(void *)a9 delegateQueue:(char)a10 includeP2P:
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  NSObject *v33;
  dispatch_queue_t v34;
  void *v35;
  NSObject *legacy_tcp_socket;
  NSObject *v37;
  NSObject *options;
  NSObject *host;
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  id v50;
  id obj;
  id v52;
  id v53;
  objc_super v54;
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v18 = a3;
  v53 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v52 = a9;
  if (!a1)
  {
    v24 = 0;
    v48 = v52;
    v25 = v53;
    goto LABEL_22;
  }
  if ((unint64_t)(objc_msgSend(v19, "longLongValue") - 0x10000) > 0xFFFFFFFFFFFF0000)
  {
    v54.receiver = a1;
    v54.super_class = (Class)NEIKEv2Listener;
    v26 = -[NSObject init](&v54, sel_init);
    if (v26)
    {
      v27 = (uint64_t)v26;
      obj = v22;
      v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v29 = *(void **)(v27 + 56);
      *(_QWORD *)(v27 + 56) = v28;

      v30 = objc_msgSend(v17, "copy");
      v31 = *(void **)(v27 + 24);
      *(_QWORD *)(v27 + 24) = v30;

      objc_msgSend(*(id *)(v27 + 24), "setServerMode:", 1);
      objc_storeStrong((id *)(v27 + 32), a3);
      objc_storeStrong((id *)(v27 + 40), a4);
      if (v21)
      {
        v32 = v21;
        v33 = *(NSObject **)(v27 + 16);
        *(_QWORD *)(v27 + 16) = v32;
      }
      else
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = dispatch_queue_create("com.apple.networkextension.ikev2.listener", v33);
        v35 = *(void **)(v27 + 16);
        *(_QWORD *)(v27 + 16) = v34;

      }
      objc_storeWeak((id *)(v27 + 80), v22);
      objc_storeStrong((id *)(v27 + 88), a9);
      legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
      v37 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
      options = nw_udp_create_options();
      nw_protocol_stack_set_transport_protocol(v37, options);

      nw_parameters_set_data_mode();
      host = nw_endpoint_create_host("::", (const char *)objc_msgSend(v19, "UTF8String"));
      nw_parameters_set_local_endpoint(legacy_tcp_socket, host);
      if (a10)
        nw_parameters_set_use_awdl();
      if (v20)
      {
        v40 = v18;
        objc_msgSend(v20, "UTF8String");
        v41 = nw_interface_create_with_name();
        if (v41)
          nw_parameters_require_interface(legacy_tcp_socket, v41);

        v18 = v40;
      }
      if (objc_msgSend(v17, "forceUDPEncapsulation") && v37)
      {
        v50 = v19;
        v42 = v21;
        v43 = v20;
        v44 = v17;
        v45 = v18;
        v46 = NEIKEv2TransportCopyNATTFramerDefinition();
        v47 = nw_framer_create_options(v46);
        nw_protocol_stack_prepend_application_protocol(v37, v47);

        v18 = v45;
        v17 = v44;
        v20 = v43;
        v21 = v42;
        v19 = v50;
      }
      -[NEIKEv2Listener createListenerWithParameters:attempt:](v27, legacy_tcp_socket, 0);
      a1 = (id)v27;

      v24 = a1;
      v25 = v53;
      v22 = obj;
      goto LABEL_21;
    }
    ne_log_obj();
    a1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(a1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }
  else
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v19;
      _os_log_fault_impl(&dword_19BD16000, v23, OS_LOG_TYPE_FAULT, "Invalid listenerUDPPort \"%@\", buf, 0xCu);
    }

  }
  v24 = 0;
  v25 = v53;
LABEL_21:
  v48 = v52;

LABEL_22:
  return v24;
}

- (void)createListenerWithParameters:(unsigned int)a3 attempt:
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  nw_listener_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  uint8_t v21[16];
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD handler[4];
  id v26;
  NSObject *v27;
  id v28;
  char v29;
  id location;
  __int16 v31;
  NSObject *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    if (a3 >= 5)
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        LODWORD(location) = 67109378;
        HIDWORD(location) = a3;
        v31 = 2112;
        v32 = v5;
        _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "failed to create a listener after %u retries (parameters %@)", (uint8_t *)&location, 0x12u);
      }
LABEL_14:

      goto LABEL_15;
    }
    v7 = *(NSObject **)(a1 + 48);
    if (v7)
      nw_listener_cancel(v7);
    v8 = nw_listener_create(v5);
    v9 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v8;

    v10 = *(void **)(a1 + 48);
    if (!v10)
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location) = 0;
        _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "nw_listener_create failed", (uint8_t *)&location, 2u);
      }
      goto LABEL_14;
    }
    v11 = v10;
    objc_msgSend((id)a1, "listenerQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    nw_listener_set_queue(v11, v12);

    objc_initWeak(&location, (id)a1);
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 48);
    v15 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke;
    handler[3] = &unk_1E3CC1310;
    objc_copyWeak(&v28, &location);
    v16 = v13;
    v26 = v16;
    v29 = a3;
    v27 = v5;
    nw_listener_set_state_changed_handler(v14, handler);

    v17 = *(id *)(a1 + 48);
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke_4;
    v22[3] = &unk_1E3CC1338;
    objc_copyWeak(&v24, &location);
    v18 = v16;
    v23 = v18;
    nw_listener_set_new_connection_handler(v17, v22);

    v19 = *(id *)(a1 + 48);
    nw_listener_start(v19);

    ne_log_large_obj();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_19BD16000, v20, OS_LOG_TYPE_DEFAULT, "Created IKE listener", v21, 2u);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&location);
  }
LABEL_15:

}

void __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  _QWORD *WeakRetained;
  _QWORD *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD block[4];
  id v15;
  id v16;
  char v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[6] != *(_QWORD *)(a1 + 32) || (WeakRetained[1] & 1) != 0)
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = v7[6];
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218240;
        v19 = v12;
        v20 = 2048;
        v21 = v13;
        _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "ignoring update for a stale listener %p != %p", buf, 0x16u);
      }

      nw_listener_cancel(*(nw_listener_t *)(a1 + 32));
    }
    else if (a2 == 3 && nw_error_get_error_code(v5) == 48)
    {
      v8 = dispatch_time(0x8000000000000000, 200000000 * *(unsigned __int8 *)(a1 + 56) + 200000000);
      objc_msgSend(v7, "listenerQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke_2;
      block[3] = &unk_1E3CC12E8;
      objc_copyWeak(&v16, (id *)(a1 + 48));
      v15 = *(id *)(a1 + 40);
      v17 = *(_BYTE *)(a1 + 56);
      dispatch_after(v8, v9, block);

      objc_destroyWeak(&v16);
    }
  }
  else
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = a2;
      _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "IKE listener released, ignoring state change to %d", buf, 8u);
    }

  }
}

void __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke_4(uint64_t a1, void *a2)
{
  NSObject *v3;
  _QWORD *WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  nw_endpoint_type_t type;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NEIKEv2Transport *v24;
  NSObject *v25;
  int ip_protocol;
  nw_protocol_stack_t v27;
  id v28;
  char v29;
  _BOOL8 v30;
  uint64_t v31;
  void *v32;
  nw_endpoint_t v33;
  void *v34;
  SEL v35;
  void *v36;
  void *v37;
  void *v38;
  SEL v39;
  SEL v40;
  SEL v41;
  SEL v42;
  NSObject *Property;
  SEL v44;
  id v45;
  NEIKEv2Transport *v46;
  SEL v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  NEIKEv2Transport *v52;
  NSObject *v53;
  NSObject *v54;
  const char *v55;
  NSObject *v56;
  uint32_t v57;
  nw_endpoint_type_t v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  _BYTE buf[24];
  void *v63;
  NEIKEv2Transport *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v3;
    v12 = "IKE listener released, cancelling connection %@";
LABEL_51:
    v13 = v9;
    v14 = 12;
    goto LABEL_52;
  }
  v6 = WeakRetained[6];
  v7 = *(_QWORD *)(a1 + 32);
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 != v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *((_QWORD *)v5 + 6);
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v11;
      v12 = "ignoring new connection for a stale listener %p != %p";
      v13 = v9;
      v14 = 22;
LABEL_52:
      _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    }
LABEL_53:

    nw_connection_cancel(v3);
    goto LABEL_54;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "Received incoming IKE connection %@", buf, 0xCu);
  }

  v15 = v3;
  v16 = v15;
  v17 = v15;
  if ((*((_BYTE *)v5 + 8) & 1) != 0)
  {
LABEL_49:

    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v16;
    v12 = "IKE listener failed to handle new connection, cancelling %@";
    goto LABEL_51;
  }
  if (!v15)
  {
    ne_log_obj();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[NEIKEv2Listener handleNewConnection:]";
      _os_log_fault_impl(&dword_19BD16000, v53, OS_LOG_TYPE_FAULT, "%s called with null connection", buf, 0xCu);
    }
    v17 = 0;
    goto LABEL_48;
  }
  v18 = nw_connection_copy_endpoint(v15);
  v19 = v18;
  if (!v18)
  {
    ne_log_obj();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[NEIKEv2Listener handleNewConnection:]";
      v55 = "%s called with null remoteEndpoint";
      v56 = v54;
      v57 = 12;
LABEL_36:
      _os_log_fault_impl(&dword_19BD16000, v56, OS_LOG_TYPE_FAULT, v55, buf, v57);
    }
LABEL_47:
    v53 = v19;

    v17 = v16;
LABEL_48:

    goto LABEL_49;
  }
  type = nw_endpoint_get_type(v18);
  if (type != nw_endpoint_type_address)
  {
    v58 = type;
    ne_log_obj();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v58;
      v55 = "Unexpected endpoint type %d";
      v56 = v54;
      v57 = 8;
      goto LABEL_36;
    }
    goto LABEL_47;
  }
  objc_msgSend(v5, "listenerQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v16;
  v23 = v21;
  objc_opt_self();
  if (!v23)
  {
    ne_log_obj();
    v24 = (NEIKEv2Transport *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[NEIKEv2Transport createTransportWithConnection:queue:]";
      _os_log_fault_impl(&dword_19BD16000, &v24->super, OS_LOG_TYPE_FAULT, "%s called with null queue", buf, 0xCu);
    }
    goto LABEL_39;
  }
  v24 = objc_alloc_init(NEIKEv2Transport);
  if (!v24)
  {
LABEL_39:
    v52 = 0;
    goto LABEL_40;
  }
  v25 = nw_connection_copy_parameters(v22);
  ip_protocol = nw_parameters_get_ip_protocol();
  v61 = v19;
  if (ip_protocol == 6)
  {
    if (nw_parameters_get_tls())
      v31 = 3;
    else
      v31 = 2;
    v24->_transportType = v31;
  }
  else if (ip_protocol == 17)
  {
    v27 = nw_parameters_copy_default_protocol_stack(v25);
    v30 = 0;
    if (v27)
    {
      v28 = NEIKEv2TransportCopyNATTFramerDefinition();
      v29 = nw_protocol_stack_includes_protocol();

      if ((v29 & 1) != 0)
        v30 = 1;
    }
    v24->_transportType = v30;

  }
  v32 = (void *)MEMORY[0x1E0CCEC78];
  v33 = nw_connection_copy_endpoint(v22);
  objc_msgSend(v32, "endpointWithCEndpoint:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(v24, v35, v34, 24);

  v36 = (void *)MEMORY[0x1E0CCEC78];
  v37 = (void *)MEMORY[0x1A1ACF078](v25);
  objc_msgSend(v36, "endpointWithCEndpoint:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(v24, v39, v38, 16);

  objc_setProperty_atomic(v24, v40, v23, 72);
  objc_setProperty_atomic(v24, v41, v22, 56);
  Property = objc_getProperty(v24, v42, 56, 1);
  nw_connection_set_queue(Property, v23);
  v45 = objc_getProperty(v24, v44, 56, 1);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __56__NEIKEv2Transport_createTransportWithConnection_queue___block_invoke;
  v63 = &unk_1E3CC1B00;
  v46 = v24;
  v64 = v46;
  MEMORY[0x1A1ACED54](v45, buf);
  v48 = objc_getProperty(v46, v47, 56, 1);
  nw_connection_start(v48);
  os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
  v49 = (void *)g_transports;
  if (!g_transports)
  {
    v50 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v51 = (void *)g_transports;
    g_transports = (uint64_t)v50;

    v49 = (void *)g_transports;
  }
  objc_msgSend(v49, "addObject:", v46);
  os_unfair_lock_unlock((os_unfair_lock_t)&g_transport_lock);
  v24 = v46;

  v52 = v24;
  v19 = v61;
LABEL_40:

  ne_log_obj();
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (!v52)
  {
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[NEIKEv2Listener handleNewConnection:]";
      _os_log_fault_impl(&dword_19BD16000, v60, OS_LOG_TYPE_FAULT, "%s called with null transport", buf, 0xCu);
    }

    v54 = 0;
    goto LABEL_47;
  }
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v52;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v22;
    _os_log_impl(&dword_19BD16000, v60, OS_LOG_TYPE_DEFAULT, "Created %@ with connection %@", buf, 0x16u);
  }

  objc_msgSend(*((id *)v5 + 8), "addObject:", v52);
  -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:]((uint64_t)v52, v5, 0);

LABEL_54:
}

void __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[NEIKEv2Listener createListenerWithParameters:attempt:](WeakRetained, *(_QWORD *)(a1 + 32), (*(_BYTE *)(a1 + 48) + 1));
  }
  else
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "IKE listener released, not setting up listener", v5, 2u);
    }

  }
}

void __43__NEIKEv2Listener_receivePacket_transport___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "listener:receivedNewSession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v3 = v5;
    }
  }

}

void __108__NEIKEv2Listener_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __108__NEIKEv2Listener_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock___block_invoke_2;
  v8[3] = &unk_1E3CC1298;
  v8[4] = v3;
  v10 = *(id *)(a1 + 80);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:", v3, v4, v5, v6, v7, v8);

}

void __108__NEIKEv2Listener_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "listenerQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = *(_QWORD *)(a1 + 48);
  v13 = (id)objc_msgSend(v9, "copy");

  v12 = (void *)objc_msgSend(v8, "copy");
  (*(void (**)(uint64_t, id, void *, uint64_t))(v11 + 16))(v11, v13, v12, a4);

}

@end
