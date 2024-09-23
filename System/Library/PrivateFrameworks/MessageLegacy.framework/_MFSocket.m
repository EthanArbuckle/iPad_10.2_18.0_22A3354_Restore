@implementation _MFSocket

- (BOOL)_certificateIsTrustedForAccount:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a3, "valueInAccountPropertiesForKey:", CFSTR("MFServerSSLCertificateIsTrusted")), "BOOLValue");
}

- (void)_setCertificateIsTrusted:(BOOL)a3 forAccount:(id)a4
{
  objc_msgSend(a4, "setValueInAccountProperties:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("MFServerSSLCertificateIsTrusted"));
  objc_msgSend(a4, "savePersistentAccount");
}

- (BOOL)_evaluateTrust:(__SecTrust *)a3 errorPtr:(id *)a4
{
  uint64_t v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  MFError *v15;
  NSObject *v16;
  MFError *v17;
  NSObject *v18;
  NSObject *v19;
  char v20;
  _QWORD v22[11];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  _MFSocket *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_opt_class(), "existingAccountForUniqueID:", self->_accountIdentifier);
  v8 = -[_MFSocket _certificateIsTrustedForAccount:](self, "_certificateIsTrustedForAccount:", v7);
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D0D588], "defaultTrustManager"), "rawTrustResultForSSLTrust:hostname:service:", a3, self->_host, self->_service);
  v10 = MFLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    v30 = objc_opt_class();
    v31 = 2048;
    v32 = self;
    v33 = 1024;
    v34 = v9;
    v35 = 2112;
    v36 = v7;
    _os_log_impl(&dword_1C8839000, v10, OS_LOG_TYPE_INFO, "#Network <%{public}@:%p> Got SecTrustResultType %u for %@", buf, 0x26u);
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  switch(v9)
  {
    case 1:
      v26 = 1;
      break;
    case 5:
      if (-[_MFSocket allowsTrustPrompt](self, "allowsTrustPrompt"))
      {
        v12 = objc_alloc_init(MEMORY[0x1E0D0D580]);
        objc_msgSend(v12, "setHost:", self->_host);
        objc_msgSend(v12, "setService:", self->_service);
        objc_msgSend(v12, "setTrust:", a3);
        if (v8)
        {
          v13 = *MEMORY[0x1E0D0D5A8];
          v27[0] = *MEMORY[0x1E0D0D5B0];
          v27[1] = v13;
          v28[0] = MEMORY[0x1E0C9AAA0];
          v28[1] = MEMORY[0x1E0C9AAA0];
          v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
        }
        else
        {
          v14 = 0;
        }
        v19 = dispatch_semaphore_create(0);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __37___MFSocket__evaluateTrust_errorPtr___block_invoke;
        v22[3] = &unk_1E81C9BE8;
        v22[8] = &v23;
        v22[9] = a4;
        v22[4] = self;
        v22[5] = v7;
        v22[10] = a3;
        v22[6] = v12;
        v22[7] = v19;
        objc_msgSend(v12, "showPromptWithOptions:responseBlock:", v14, v22);
        dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v19);
      }
      else
      {
        v17 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, 0);
        if (!v17)
          v17 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
        *a4 = v17;
        v18 = MFLogGeneral();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[_MFSocket _evaluateTrust:errorPtr:].cold.2((uint64_t)self, -[MFError domain](v17, "domain"), buf);
      }
      break;
    case 4:
      if (v8)
      {
        v11 = &v26;
      }
      else
      {
        -[_MFSocket _setCertificateIsTrusted:forAccount:](self, "_setCertificateIsTrusted:forAccount:", 1, v7);
        v11 = (char *)(v24 + 3);
      }
      *v11 = 1;
      break;
    default:
      v15 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", *MEMORY[0x1E0CB31B0], -9825, 0);
      if (!v15)
        v15 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
      *a4 = v15;
      v16 = MFLogGeneral();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[_MFSocket _evaluateTrust:errorPtr:].cold.1((uint64_t)self, -[MFError domain](v15, "domain"), buf);
      break;
  }
  v20 = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);
  return v20;
}

- (id)_negotiatedProtocolVersion
{
  MFStream *v2;
  SSLProtocol protocol;

  protocol = kSSLProtocolUnknown;
  v2 = -[_MFSocket stream](self, "stream");
  if (SSLGetNegotiatedProtocolVersion((SSLContextRef)-[MFStream propertyForKey:](v2, "propertyForKey:", *MEMORY[0x1E0C93260]), &protocol))
  {
    return CFSTR("kSSLProtocolUnknown");
  }
  if (protocol >= kTLSProtocol13)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown-protocol-version(%d)"), protocol);
  return off_1E81C9C98[protocol];
}

- (BOOL)_startSSLHandshakeWithProtocol:(id)a3 errorPtr:(id *)a4
{
  MFStream *v7;
  MFStream *v8;
  __CFDictionary *Mutable;
  id v10;
  NSArray *v11;
  uint64_t v12;
  _BOOL4 v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  BOOL v17;
  MFError *v18;
  NSObject *v19;
  MFError *v20;
  NSObject *v21;
  NSError *v22;
  NSString *v23;
  uint64_t v24;
  MFError *v25;
  NSObject *v26;
  MFError *v27;
  NSObject *v28;
  MFError *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  MFError *v33;
  NSObject *v34;
  int v36;
  const char *v37;
  __int16 v38;
  _MFSocket *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = -[_MFSocket stream](self, "stream");
  if (!v7)
  {
    v18 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", *MEMORY[0x1E0CB2FE0], 54, 0);
    if (!v18)
      v18 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
    *a4 = v18;
    v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_MFSocket _startSSLHandshakeWithProtocol:errorPtr:].cold.1();
    return 0;
  }
  v8 = v7;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0C9B320]))
    v10 = (id)*MEMORY[0x1E0C932A8];
  else
    v10 = a3;
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C93290], v10);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C93060], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disableEphemeralDiffieHellmanCiphers));
  v11 = -[_MFSocket clientCertificates](self, "clientCertificates");
  if (v11)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C93288], v11);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C932A0], (const void *)*MEMORY[0x1E0C9AE40]);
  *(_WORD *)&self->_socketCanRead = 0;
  v12 = *MEMORY[0x1E0C93270];
  v13 = -[MFStream setProperty:forKey:](v8, "setProperty:forKey:", Mutable, *MEMORY[0x1E0C93270]);
  CFRelease(Mutable);
  if (!v13)
  {
    v20 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", *MEMORY[0x1E0CB31B0], 1029, 0);
    if (!v20)
      v20 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
    *a4 = v20;
    v21 = MFLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[_MFSocket _startSSLHandshakeWithProtocol:errorPtr:].cold.4();
    v22 = 0;
    goto LABEL_35;
  }
  v14 = -[_MFSocket _waitForSocketOpenAndFlag:](self, "_waitForSocketOpenAndFlag:", &self->_socketCanWrite);
  if (!self->_socketCanWrite || !-[MFStream isOpen](v8, "isOpen"))
  {
    v22 = -[MFStream streamError](v8, "streamError");
    v23 = -[NSError domain](v22, "domain");
    v24 = *MEMORY[0x1E0CB31B0];
    if (-[NSString isEqualToString:](v23, "isEqualToString:", *MEMORY[0x1E0CB31B0]))
    {
      v25 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", v24, -[NSError code](v22, "code"), 0);
      if (!v25)
        v25 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
      *a4 = v25;
      v26 = MFLogGeneral();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v36 = 136315906;
        v37 = "SSL negotiation failed";
        v38 = 2048;
        v39 = self;
        v40 = 2112;
        v41 = (id)-[MFError domain](v25, "domain");
        v42 = 2048;
        v43 = -[NSError code](v22, "code");
        _os_log_error_impl(&dword_1C8839000, v26, OS_LOG_TYPE_ERROR, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
          (uint8_t *)&v36,
          0x2Au);
      }
      goto LABEL_35;
    }
    if (!v14)
    {
      v27 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", *MEMORY[0x1E0CB2FE0], 60, 0);
      if (!v27)
        v27 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
      *a4 = v27;
      v28 = MFLogGeneral();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[_MFSocket _startSSLHandshakeWithProtocol:errorPtr:].cold.3();
      goto LABEL_35;
    }
LABEL_34:
    if (!a4)
      return 0;
LABEL_35:
    if (!*a4)
    {
      if (v22)
      {
        v29 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", -[NSError domain](v22, "domain"), -[NSError code](v22, "code"), 0);
        if (!v29)
          v29 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
        *a4 = v29;
        v30 = MFLogGeneral();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = -[MFError domain](v29, "domain");
          v32 = -[NSError code](v22, "code");
          v36 = 136315906;
          v37 = "CFReadStreamSetProperty()";
          v38 = 2048;
          v39 = self;
          v40 = 2112;
          v41 = (id)v31;
          v42 = 2048;
          v43 = (id)v32;
          _os_log_error_impl(&dword_1C8839000, v30, OS_LOG_TYPE_ERROR, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
            (uint8_t *)&v36,
            0x2Au);
        }
      }
      else
      {
        v33 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
        if (!v33)
          v33 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
        *a4 = v33;
        v34 = MFLogGeneral();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[_MFSocket _startSSLHandshakeWithProtocol:errorPtr:].cold.2();
      }
    }
    return 0;
  }
  v15 = -[MFStream propertyForKey:](v8, "propertyForKey:", *MEMORY[0x1E0C93268]);
  if (!v15 || !-[_MFSocket _evaluateTrust:errorPtr:](self, "_evaluateTrust:errorPtr:", v15, a4))
  {
    v22 = 0;
    goto LABEL_34;
  }
  v16 = MFLogGeneral();
  v17 = 1;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v36 = 138544386;
    v37 = (const char *)objc_opt_class();
    v38 = 2048;
    v39 = self;
    v40 = 2114;
    v41 = -[_MFSocket securityProtocol](self, "securityProtocol");
    v42 = 2114;
    v43 = -[_MFSocket _negotiatedProtocolVersion](self, "_negotiatedProtocolVersion");
    v44 = 2112;
    v45 = -[MFStream propertyForKey:](v8, "propertyForKey:", v12);
    v17 = 1;
    _os_log_impl(&dword_1C8839000, v16, OS_LOG_TYPE_INFO, "#Network <%{public}@:%p> SSL handshake completed successfully: %{public}@ %{public}@, %@", (uint8_t *)&v36, 0x34u);
  }
  return v17;
}

- (BOOL)_waitForSocketOpenAndFlag:(BOOL *)a3
{
  BOOL v5;

  -[NSCondition lock](self->_condition, "lock");
  while (!*a3 && -[MFStream isOpen](-[_MFSocket stream](self, "stream"), "isOpen"))
  {
    if (!-[NSCondition waitUntilDate:](self->_condition, "waitUntilDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 30.0)))
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = 1;
LABEL_7:
  -[NSCondition unlock](self->_condition, "unlock");
  return v5;
}

- (id)securityProtocol
{
  MFStream *v2;
  uint64_t v3;
  void *v4;

  v2 = -[_MFSocket stream](self, "stream");
  v3 = -[MFStream propertyForKey:](v2, "propertyForKey:", *MEMORY[0x1E0C9B308]);
  if (!v3)
    return (id)*MEMORY[0x1E0C9B328];
  v4 = (void *)v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return (id)*MEMORY[0x1E0C9B328];
  return v4;
}

- (BOOL)setSecurityProtocol:(id)a3
{
  NSString *protocol;
  BOOL v6;
  MFError *v7;
  NSObject *v8;
  id v9;
  MFError *v11;

  _MFLockGlobalLock();
  if (-[NSString isEqualToString:](self->_protocol, "isEqualToString:", a3))
  {
    protocol = 0;
  }
  else
  {
    protocol = self->_protocol;
    self->_protocol = (NSString *)a3;
  }
  _MFUnlockGlobalLock();
  v6 = 1;
  if (-[_MFSocket stream](self, "stream")
    && a3
    && protocol != a3
    && (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0C9B328]) & 1) == 0)
  {
    v11 = 0;
    v6 = -[_MFSocket _startSSLHandshakeWithProtocol:errorPtr:](self, "_startSSLHandshakeWithProtocol:errorPtr:", a3, &v11);
    if (!v6)
    {
      if (!v11)
      {
        v7 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
        if (!v7)
          v7 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
        v11 = v7;
        v8 = MFLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[_MFSocket setSecurityProtocol:].cold.1();
      }
      v9 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      objc_msgSend(v9, "setError:", v11);
    }

  }
  return v6;
}

- (NSArray)serverCertificates
{
  MFStream *v2;
  __SecTrust *v3;
  __SecTrust *v4;
  CFIndex CertificateCount;
  NSArray *v6;
  CFIndex i;

  v2 = -[_MFSocket stream](self, "stream");
  v3 = -[MFStream propertyForKey:](v2, "propertyForKey:", *MEMORY[0x1E0C93268]);
  if (!v3)
    return 0;
  v4 = v3;
  CertificateCount = SecTrustGetCertificateCount(v3);
  v6 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", CertificateCount);
  if (CertificateCount >= 1)
  {
    for (i = 0; i != CertificateCount; ++i)
      -[NSArray addObject:](v6, "addObject:", SecTrustGetCertificateAtIndex(v4, i));
  }
  return v6;
}

- (void)setConnectionServiceType:(__CFString *)a3
{
  __CFString *connectionServiceType;
  __CFString *v6;

  -[_MFSocket mf_lock](self, "mf_lock");
  connectionServiceType = self->_connectionServiceType;
  if (connectionServiceType != a3)
  {
    if (connectionServiceType)
      CFRelease(connectionServiceType);
    if (a3)
      v6 = (__CFString *)CFRetain(a3);
    else
      v6 = 0;
    self->_connectionServiceType = v6;
  }
  -[_MFSocket mf_unlock](self, "mf_unlock");
}

- (_MFSocket)init
{
  _MFSocket *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MFSocket;
  v2 = -[_MFSocket init](&v4, sel_init);
  if (v2)
  {
    if (init_once != -1)
      dispatch_once(&init_once, &__block_literal_global_214);
    v2->_numTimeoutSecs = _DefaultTimeout;
    v2->_condition = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
  }
  return v2;
}

- (void)dealloc
{
  __CFString *connectionServiceType;
  objc_super v4;

  connectionServiceType = self->_connectionServiceType;
  if (connectionServiceType)
    CFRelease(connectionServiceType);
  -[_MFSocket abort](self, "abort");

  v4.receiver = self;
  v4.super_class = (Class)_MFSocket;
  -[_MFSocket dealloc](&v4, sel_dealloc);
}

- (void)abort
{
  MFStream *v3;

  v3 = -[_MFSocket stream](self, "stream");
  -[_MFSocket setStream:](self, "setStream:", 0);
  -[MFStream close](v3, "close");
  -[NSCondition lock](self->_condition, "lock");
  *(_WORD *)&self->_socketCanRead = 0;
  -[NSCondition broadcast](self->_condition, "broadcast");
  -[NSCondition unlock](self->_condition, "unlock");
  objc_msgSend((id)MFUserAgent(), "networkActivityEnded:", self);
}

- (BOOL)isReadable
{
  return self->_socketCanRead;
}

- (BOOL)isWritable
{
  return self->_socketCanWrite;
}

- (BOOL)isValid
{
  return -[MFStream isOpen](-[_MFSocket stream](self, "stream"), "isOpen");
}

- (BOOL)connectToHost:(id)a3 withPort:(unsigned int)a4 service:(id)a5
{
  BOOL v9;
  MFStream *v10;
  uint64_t v11;
  id v12;
  __CFString *connectionServiceType;
  _QWORD *v14;
  id v15;
  id v16;
  NSString *sourceApplicationBundleIdentifier;
  NSString *networkAccountIdentifier;
  NSObject *v19;
  NSString *v20;
  NSString *v21;
  MFError *v22;
  NSObject *v23;
  _QWORD v25[5];
  id v26;
  id location;
  _QWORD v28[5];
  MFError *v29;
  uint8_t buf[4];
  _MFSocket *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  NSString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (-[MFNetworkController inAirplaneMode](+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance"), "inAirplaneMode"))
  {
    return 0;
  }
  objc_msgSend((id)MFUserAgent(), "networkActivityStarted:", self);
  if (!-[NSString isEqualToString:](self->_host, "isEqualToString:", a3))
  {

    self->_host = (NSString *)objc_msgSend(a3, "copy");
  }
  if (!-[NSString isEqualToString:](self->_service, "isEqualToString:", a5))
  {

    self->_service = (NSString *)objc_msgSend(a5, "copy");
  }
  v29 = 0;
  MFAssertNetworkActivityAllowed();
  v10 = [MFStream alloc];
  v11 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __44___MFSocket_connectToHost_withPort_service___block_invoke;
  v28[3] = &unk_1E81C9C50;
  v28[4] = self;
  v12 = -[MFStream initCallBack:onDispatchQueue:](v10, "initCallBack:onDispatchQueue:", v28, +[MFStream _networkDispatchQueue](MFStream, "_networkDispatchQueue"));
  -[_MFSocket setStream:](self, "setStream:", v12);

  connectionServiceType = self->_connectionServiceType;
  v14 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (connectionServiceType)
  {
    objc_msgSend(v12, "setProperty:forKey:", connectionServiceType, *MEMORY[0x1E0C93210]);
    objc_msgSend(v12, "setProperty:forKey:", *v14, *MEMORY[0x1E0C93218]);
  }
  if (self->_usesOpportunisticSockets)
    objc_msgSend(v12, "setProperty:forKey:", *v14, *MEMORY[0x1E0C93258]);
  v15 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  objc_initWeak(&location, self);
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __44___MFSocket_connectToHost_withPort_service___block_invoke_2;
  v25[3] = &unk_1E81C9C78;
  objc_copyWeak(&v26, &location);
  v25[4] = v15;
  v16 = (id)objc_msgSend(v25, "copy");
  objc_msgSend(v12, "setProperty:forKey:", v16, *MEMORY[0x1E0C93038]);
  sourceApplicationBundleIdentifier = self->_sourceApplicationBundleIdentifier;
  if (sourceApplicationBundleIdentifier)
    objc_msgSend(v12, "setProperty:forKey:", sourceApplicationBundleIdentifier, *MEMORY[0x1E0C93280]);
  networkAccountIdentifier = self->_networkAccountIdentifier;
  if (networkAccountIdentifier)
    objc_msgSend(v12, "setProperty:forKey:", networkAccountIdentifier, *MEMORY[0x1E0C931C8]);
  v19 = MFLogGeneral();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = self->_networkAccountIdentifier;
    *(_DWORD *)buf = 134218754;
    v31 = self;
    v32 = 2048;
    v33 = v12;
    v34 = 2112;
    v35 = a3;
    v36 = 2112;
    v37 = v20;
    _os_log_impl(&dword_1C8839000, v19, OS_LOG_TYPE_INFO, "#Streams socket %p (stream %p) opening connection to %@ (network account id: %@)", buf, 0x2Au);
  }
  objc_msgSend(v12, "openToHostName:port:", objc_msgSend(MEMORY[0x1E0D1E710], "stringByEncodingDomainName:", a3), a4);
  _MFLockGlobalLock();
  v21 = self->_protocol;
  _MFUnlockGlobalLock();
  v9 = !v21
    || -[NSString isEqualToString:](v21, "isEqualToString:", *MEMORY[0x1E0C9B328])
    || -[_MFSocket _startSSLHandshakeWithProtocol:errorPtr:](self, "_startSSLHandshakeWithProtocol:errorPtr:", v21, &v29);

  if (!v9 && !objc_msgSend(v15, "error"))
  {
    if (!v29)
    {
      v22 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
      if (!v22)
        v22 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
      v29 = v22;
      v23 = MFLogGeneral();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[_MFSocket connectToHost:withPort:service:].cold.1((uint64_t)self, -[MFError domain](v22, "domain"), buf);
    }
    objc_msgSend(v15, "setError:", v29);
  }

  objc_msgSend((id)MFUserAgent(), "networkActivityEnded:", self);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  return v9;
}

- (unsigned)_bufferedByteCount
{
  MFStream *v2;
  uint64_t v3;
  void *v4;
  int v5;
  socklen_t v7;
  int v8;

  v8 = 0;
  v2 = -[_MFSocket stream](self, "stream");
  v3 = -[MFStream propertyForKey:](v2, "propertyForKey:", *MEMORY[0x1E0C9B2F0]);
  if (v3)
  {
    v4 = (void *)v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v4, "length") == 4
      && (v5 = *(_DWORD *)objc_msgSend(v4, "bytes"), v5 != -1))
    {
      v7 = 4;
      getsockopt(v5, 0xFFFF, 4132, &v8, &v7);
      LODWORD(v3) = v8;
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }
  return v3;
}

- (int64_t)writeBytes:(const char *)a3 length:(unint64_t)a4
{
  unsigned int v7;
  MFStream *v8;
  int numTimeoutSecs;
  double v10;
  unsigned int v11;
  BOOL v12;
  int64_t v13;
  NSError *v14;
  MFError *v15;
  MFError *v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  _MFSocket *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)MFUserAgent(), "networkActivityStarted:", self);
  MFAssertNetworkActivityAllowed();
  v7 = -[_MFSocket _bufferedByteCount](self, "_bufferedByteCount");
  -[NSCondition lock](self->_condition, "lock");
  v8 = -[_MFSocket stream](self, "stream");
  while (!self->_socketCanWrite && -[MFStream isOpen](v8, "isOpen"))
  {
    numTimeoutSecs = self->_numTimeoutSecs;
    v10 = (double)numTimeoutSecs;
    if (!numTimeoutSecs)
      v10 = 1.79769313e308;
    if (!-[NSCondition waitUntilDate:](self->_condition, "waitUntilDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v10)))
    {
      v11 = -[_MFSocket _bufferedByteCount](self, "_bufferedByteCount");
      v12 = v7 == v11;
      v7 = v11;
      if (v12)
        break;
    }
  }
  -[NSCondition unlock](self->_condition, "unlock");
  if (self->_socketCanWrite && -[MFStream isOpen](v8, "isOpen"))
  {
    self->_socketCanWrite = 0;
    v13 = -[MFStream write:maxLength:](v8, "write:maxLength:", a3, a4);
    if ((v13 & 0x8000000000000000) == 0)
      goto LABEL_21;
  }
  else
  {
    v13 = -1;
  }
  v14 = -[MFStream streamError](v8, "streamError");
  if (!v14)
    v14 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 60, 0);
  v15 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", -[NSError domain](v14, "domain"), -[NSError code](v14, "code"), 0);
  if (!v15)
    v15 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
  v16 = v15;
  v17 = MFLogGeneral();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v19 = 136315906;
    v20 = "";
    v21 = 2048;
    v22 = self;
    v23 = 2112;
    v24 = -[MFError domain](v15, "domain");
    v25 = 2048;
    v26 = -[NSError code](v14, "code");
    _os_log_error_impl(&dword_1C8839000, v17, OS_LOG_TYPE_ERROR, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
      (uint8_t *)&v19,
      0x2Au);
  }
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", v16);

LABEL_21:
  objc_msgSend((id)MFUserAgent(), "networkActivityEnded:", self);
  return v13;
}

- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4
{
  id v7;
  MFError *v8;
  MFError *v9;
  NSObject *v10;
  int64_t v11;
  unsigned int v12;
  MFStream *v13;
  int numTimeoutSecs;
  double v15;
  unsigned int v16;
  BOOL v17;
  NSError *v18;
  MFError *v19;
  MFError *v20;
  NSObject *v21;
  int v23;
  const char *v24;
  __int16 v25;
  _MFSocket *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  if (objc_msgSend(v7, "shouldCancel"))
  {
    v8 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1028, 0);
    if (!v8)
      v8 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
    v9 = v8;
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_MFSocket readBytes:length:].cold.1();
    objc_msgSend(v7, "setError:", v9);

    return -1;
  }
  else
  {
    objc_msgSend((id)MFUserAgent(), "networkActivityStarted:", self);
    MFAssertNetworkActivityAllowed();
    v12 = -[_MFSocket _bufferedByteCount](self, "_bufferedByteCount");
    -[NSCondition lock](self->_condition, "lock");
    v13 = -[_MFSocket stream](self, "stream");
    while (!self->_socketCanRead && -[MFStream isOpen](v13, "isOpen"))
    {
      numTimeoutSecs = self->_numTimeoutSecs;
      v15 = (double)numTimeoutSecs;
      if (!numTimeoutSecs)
        v15 = 1.79769313e308;
      if (!-[NSCondition waitUntilDate:](self->_condition, "waitUntilDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v15)))
      {
        v16 = -[_MFSocket _bufferedByteCount](self, "_bufferedByteCount");
        v17 = v12 == v16;
        v12 = v16;
        if (v17)
          break;
      }
    }
    -[NSCondition unlock](self->_condition, "unlock");
    if (!self->_socketCanRead
      || !-[MFStream isOpen](v13, "isOpen")
      || (self->_socketCanRead = 0, v11 = -[MFStream read:maxLength:](v13, "read:maxLength:", a3, a4), v11 == -1))
    {
      v18 = -[MFStream streamError](v13, "streamError");
      if (!v18)
        v18 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 60, 0);
      v19 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", -[NSError domain](v18, "domain"), -[NSError code](v18, "code"), 0);
      if (!v19)
        v19 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, 0);
      v20 = v19;
      v21 = MFLogGeneral();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = 136315906;
        v24 = "";
        v25 = 2048;
        v26 = self;
        v27 = 2112;
        v28 = -[MFError domain](v19, "domain");
        v29 = 2048;
        v30 = -[NSError code](v18, "code");
        _os_log_error_impl(&dword_1C8839000, v21, OS_LOG_TYPE_ERROR, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
          (uint8_t *)&v23,
          0x2Au);
      }
      objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", v20);

      v11 = -1;
    }
    objc_msgSend((id)MFUserAgent(), "networkActivityEnded:", self);
  }
  return v11;
}

- (void)setEventHandler:(id)a3
{
  NSInvocation *eventHandler;

  -[_MFSocket mf_lock](self, "mf_lock");
  eventHandler = self->_eventHandler;
  if (eventHandler != a3)
  {

    self->_eventHandler = (NSInvocation *)a3;
  }
  -[_MFSocket mf_unlock](self, "mf_unlock");
}

- (NSString)remoteHostname
{
  MFStream *v2;

  v2 = -[_MFSocket stream](self, "stream");
  return (NSString *)-[MFStream propertyForKey:](v2, "propertyForKey:", *MEMORY[0x1E0C9B2F8]);
}

- (unsigned)remotePortNumber
{
  MFStream *v2;
  id v3;

  v2 = -[_MFSocket stream](self, "stream");
  v3 = -[MFStream propertyForKey:](v2, "propertyForKey:", *MEMORY[0x1E0C9B300]);
  if (v3)
    LODWORD(v3) = objc_msgSend(v3, "unsignedIntValue");
  return v3;
}

- (NSData)sourceIPAddress
{
  MFStream *v2;
  uint64_t v3;
  void *v4;
  int v5;
  BOOL v6;
  socklen_t v8;
  sockaddr v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = -[_MFSocket stream](self, "stream");
  v3 = -[MFStream propertyForKey:](v2, "propertyForKey:", *MEMORY[0x1E0C9B2F0]);
  if (v3
    && (v4 = (void *)v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v4, "length") == 4
    && (v5 = *(_DWORD *)objc_msgSend(v4, "bytes"), v8 = 255, (v5 & 0x80000000) == 0)
    && (!getsockname(v5, &v9, &v8) ? (v6 = v8 == 0) : (v6 = 1), !v6))
  {
    return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v9);
  }
  else
  {
    return 0;
  }
}

- (BOOL)isCellularConnection
{
  void *v2;
  MFStream *v3;

  v2 = (void *)*MEMORY[0x1E0C9AE50];
  v3 = -[_MFSocket stream](self, "stream");
  return v2 == -[MFStream propertyForKey:](v3, "propertyForKey:", *MEMORY[0x1E0C93208]);
}

- (void)enableThroughputMonitoring:(BOOL)a3
{
  _BOOL4 v3;
  MFStream *v5;
  MFStream *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  int v11;
  MFStream *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((_LowThroughputThreshold & 1) == 0)
  {
    v3 = a3;
    v5 = -[_MFSocket stream](self, "stream");
    v6 = v5;
    if (!v3)
    {
      -[MFStream setProperty:forKey:](v5, "setProperty:forKey:", &unk_1E81EA140, *MEMORY[0x1E0C93040]);
      self->_lowThroughputCounter = 0;
      v9 = MFLogGeneral();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        return;
      v11 = 138412290;
      v12 = v6;
      v10 = "#Streams throughput monitoring OFF for stream %@";
      goto LABEL_10;
    }
    if (_LowThroughputThreshold)
      v7 = 0;
    else
      v7 = 512;
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    -[MFStream setProperty:forKey:](v6, "setProperty:forKey:", v8, *MEMORY[0x1E0C93040]);
    v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v6;
      v10 = "#Streams throughput monitoring ON for stream %@";
LABEL_10:
      _os_log_impl(&dword_1C8839000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0xCu);
    }
  }
}

- (int)timeout
{
  return self->_numTimeoutSecs;
}

- (void)setTimeout:(int)a3
{
  self->_numTimeoutSecs = a3;
}

- (BOOL)allowsTrustPrompt
{
  return self->_allowsTrustPrompt;
}

- (void)setAllowsTrustPrompt:(BOOL)a3
{
  self->_allowsTrustPrompt = a3;
}

- (BOOL)usesOpportunisticSockets
{
  return self->_usesOpportunisticSockets;
}

- (void)setUsesOpportunisticSockets:(BOOL)a3
{
  self->_usesOpportunisticSockets = a3;
}

- (BOOL)disableEphemeralDiffieHellmanCiphers
{
  return self->_disableEphemeralDiffieHellmanCiphers;
}

- (void)setDisableEphemeralDiffieHellmanCiphers:(BOOL)a3
{
  self->_disableEphemeralDiffieHellmanCiphers = a3;
}

- (NSArray)clientCertificates
{
  return self->_clientCertificates;
}

- (void)setClientCertificates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)networkAccountIdentifier
{
  return self->_networkAccountIdentifier;
}

- (void)setNetworkAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (MFStream)stream
{
  return (MFStream *)objc_getProperty(self, a2, 104, 1);
}

- (void)setStream:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)_evaluateTrust:(_DWORD *)a3 errorPtr:.cold.1(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  *a3 = 136315906;
  OUTLINED_FUNCTION_5(a1, a2, (uint64_t)a3);
  *(_QWORD *)(v3 + 34) = -9825;
  OUTLINED_FUNCTION_2(&dword_1C8839000, v5, v3, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)", v4);
}

- (void)_evaluateTrust:(_DWORD *)a3 errorPtr:.cold.2(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  *a3 = 136315906;
  OUTLINED_FUNCTION_5(a1, a2, (uint64_t)a3);
  *(_QWORD *)(v3 + 34) = 1030;
  OUTLINED_FUNCTION_2(&dword_1C8839000, v5, v3, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)", v4);
}

- (void)_startSSLHandshakeWithProtocol:errorPtr:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C8839000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
  OUTLINED_FUNCTION_4();
}

- (void)_startSSLHandshakeWithProtocol:errorPtr:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C8839000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
  OUTLINED_FUNCTION_4();
}

- (void)_startSSLHandshakeWithProtocol:errorPtr:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1C8839000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
  OUTLINED_FUNCTION_4();
}

- (void)_startSSLHandshakeWithProtocol:errorPtr:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C8839000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
  OUTLINED_FUNCTION_4();
}

- (void)setSecurityProtocol:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C8839000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
  OUTLINED_FUNCTION_4();
}

- (void)connectToHost:(uint64_t)a1 withPort:(uint64_t)a2 service:(_DWORD *)a3 .cold.1(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  *a3 = 136315906;
  OUTLINED_FUNCTION_5(a1, a2, (uint64_t)a3);
  *(_QWORD *)(v3 + 34) = 1029;
  OUTLINED_FUNCTION_2(&dword_1C8839000, v5, v3, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)", v4);
}

- (void)readBytes:length:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_7(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1C8839000, v1, v2, "*** _NSSocket.m:%s failed; socket=%p error=(%@,%ld)",
    v3,
    v4,
    v5,
    v6,
    2u);
  OUTLINED_FUNCTION_4();
}

@end
