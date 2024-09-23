@implementation NMSSHSession

- (NMSSHSession)initWithHost:(id)a3 port:(int64_t)a4 andUsername:(id)a5
{
  id v8;
  id v9;
  NMSSHSession *v10;
  NMSSHSession *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NMSSHSession;
  v10 = -[NMSSHSession init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[NMSSHSession setHost:](v10, "setHost:", v8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSSHSession setPort:](v11, "setPort:", v12);

    -[NMSSHSession setUsername:](v11, "setUsername:", v9);
    -[NMSSHSession setConnected:](v11, "setConnected:", 0);
    -[NMSSHSession setFingerprintHash:](v11, "setFingerprintHash:", 0);
  }

  return v11;
}

- (NMSSHSession)initWithHost:(id)a3 configs:(id)a4 withDefaultPort:(int64_t)a5 defaultUsername:(id)a6
{
  id v9;
  id v10;
  id v11;
  NMSSHHostConfig *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NMSSHHostConfig *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NMSSHSession *v25;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_alloc_init(NMSSHHostConfig);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v17), "hostConfigForHost:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          -[NMSSHHostConfig mergeFrom:](v12, "mergeFrom:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v15);
  }

  v19 = objc_alloc_init(NMSSHHostConfig);
  -[NMSSHHostConfig setHostname:](v19, "setHostname:", v9);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSSHHostConfig setPort:](v19, "setPort:", v20);

  -[NMSSHHostConfig setUser:](v19, "setUser:", v11);
  -[NMSSHHostConfig mergeFrom:](v12, "mergeFrom:", v19);
  -[NMSSHHostConfig hostname](v12, "hostname");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSSHHostConfig port](v12, "port");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "integerValue");
  -[NMSSHHostConfig user](v12, "user");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[NMSSHSession initWithHost:port:andUsername:](self, "initWithHost:port:andUsername:", v21, v23, v24);

  if (v25)
    -[NMSSHSession setHostConfig:](v25, "setHostConfig:", v12);

  return v25;
}

- (NMSSHSession)initWithHost:(id)a3 andUsername:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NMSSHSession *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "URLForHost:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "port");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &unk_24F93A520;
  v12 = -[NMSSHSession initWithHost:port:andUsername:](self, "initWithHost:port:andUsername:", v9, (int)objc_msgSend(v10, "intValue"), v6);

  return v12;
}

- (id)hostIPAddresses
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  NSString *v9;
  __CFString *v10;
  __CFHost *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CFStreamError error;

  -[NSString componentsSeparatedByString:](self->_host, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4 >= 4)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("[")) & 1) != 0)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4 - 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hasSuffix:", CFSTR("]"));

      if (v8)
      {
        -[NSString substringWithRange:](self->_host, "substringWithRange:", 1, -[NSString rangeOfString:options:](self->_host, "rangeOfString:options:", CFSTR("]"), 4) - 1);
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v10 = (__CFString *)v9;

        v5 = v10;
        goto LABEL_10;
      }
    }
    else
    {

    }
LABEL_8:
    v9 = self->_host;
    goto LABEL_9;
  }
  if (v4 == 3)
    goto LABEL_8;
LABEL_10:
  v11 = CFHostCreateWithName((CFAllocatorRef)*MEMORY[0x24BDBD240], v5);
  error.domain = 0;
  *(_QWORD *)&error.error = 0;
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Start %@ resolution"), v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logVerbose:", v13);

    if (CFHostStartInfoResolution(v11, kCFHostAddresses, &error))
    {
      CFHostGetAddressing(v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to resolve host %@"), v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logError:", v17);

      v14 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error allocating CFHost for %@"), v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logError:", v15);

    v14 = 0;
  }

  return v14;
}

- (NSNumber)timeout
{
  void *v3;

  if (-[NMSSHSession rawSession](self, "rawSession"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", libssh2_session_get_timeout((uint64_t)-[NMSSHSession rawSession](self, "rawSession")) / 1000);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &unk_24F93A538;
  }
  return (NSNumber *)v3;
}

- (void)setTimeout:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NMSSHSession rawSession](self, "rawSession"))
    libssh2_session_set_timeout((uint64_t)-[NMSSHSession rawSession](self, "rawSession"), 1000 * objc_msgSend(v4, "longValue"));

}

- (NSError)lastError
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (-[NMSSHSession rawSession](self, "rawSession"))
  {
    v13 = 0;
    v3 = libssh2_session_last_error((uint64_t)-[NMSSHSession rawSession](self, "rawSession"), &v13, 0, 0);
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = v3;
    v14 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("libssh2"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSError *)v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0FC8];
    v17[0] = CFSTR("Error retrieving last session error due to absence of an active session.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("libssh2"), 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSError *)v12;
  }
}

- (NSString)remoteBanner
{
  void *v2;

  v2 = (void *)libssh2_session_banner_get((uint64_t)-[NMSSHSession rawSession](self, "rawSession"));
  if (v2)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v2, 4);
  return (NSString *)v2;
}

- (BOOL)connect
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[NMSSHSession connectWithTimeout:](self, "connectWithTimeout:", v3);

  return (char)self;
}

- (BOOL)connectWithTimeout:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  const __CFAllocator *v8;
  CFSocketError v9;
  void *v10;
  void *v11;
  CFDataRef v12;
  SInt32 v13;
  __CFSocket *v14;
  CFSocketNativeHandle Native;
  __CFSocket *socket;
  CFTimeInterval v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  _LIBSSH2_SESSION *v30;
  id v31;
  void *v32;
  void *v33;
  _LIBSSH2_SESSION *v34;
  CFSocketNativeHandle v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  id v53;
  _QWORD block[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  UInt8 bytes[8];
  uint64_t v60;
  UInt8 v61[8];
  _QWORD v62[2];
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v53 = a3;
  if (-[NMSSHSession isConnected](self, "isConnected"))
    -[NMSSHSession disconnect](self, "disconnect");
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__NMSSHSession_connectWithTimeout___block_invoke;
  block[3] = &unk_24F8BB430;
  block[4] = &v55;
  if (connectWithTimeout__onceToken != -1)
    dispatch_once(&connectWithTimeout__onceToken, block);
  if (!*((_BYTE *)v56 + 24))
  {
    v21 = 0;
    goto LABEL_32;
  }
  -[NMSSHSession port](self, "port");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  -[NMSSHSession hostIPAddresses](self, "hostIPAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_24:
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failure establishing socket connection"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "logError:", v23);

    -[NMSSHSession disconnect](self, "disconnect");
    goto LABEL_25;
  }
  v7 = 0;
  v52 = bswap32(v5) >> 16;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v9 = 1;
  while (v7 < objc_msgSend(v6, "count") && v9)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length") == 16)
    {
      *(_QWORD *)bytes = 0;
      v60 = 0;
      objc_msgSend(v10, "getBytes:length:", bytes, 16);
      *(_WORD *)&bytes[2] = v52;
      inet_ntop(2, &bytes[4], (char *)v61, 0x10u);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v61, 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFDataCreate(v8, bytes, 16);
      v13 = 2;
    }
    else
    {
      if (objc_msgSend(v10, "length") != 28)
      {
        +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown address, it's not IPv4 or IPv6!"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logVerbose:", v20);

        goto LABEL_21;
      }
      *(_QWORD *)v61 = 0;
      v62[0] = 0;
      v63 = 0;
      v62[1] = 0;
      objc_msgSend(v10, "getBytes:length:", v61, 28);
      *(_WORD *)&v61[2] = v52;
      inet_ntop(30, v62, (char *)bytes, 0x2Eu);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", bytes, 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFDataCreate(v8, v61, 28);
      v13 = 30;
    }
    v14 = CFSocketCreate(v8, v13, 1, 0, 0, 0, 0);
    self->_socket = v14;
    if (!v14)
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error creating the socket"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logError:", v25);

      CFRelease(v12);
      goto LABEL_28;
    }
    *(_DWORD *)bytes = 1;
    Native = CFSocketGetNative(v14);
    if (setsockopt(Native, 0xFFFF, 4130, bytes, 4u))
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error setting socket option"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "logError:", v27);

      CFRelease(v12);
      -[NMSSHSession disconnect](self, "disconnect");
LABEL_28:

LABEL_29:
      v21 = 0;
      goto LABEL_30;
    }
    socket = self->_socket;
    objc_msgSend(v53, "doubleValue");
    v9 = CFSocketConnectToAddress(socket, v12, v17);
    CFRelease(v12);
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Socket connection to %@ on port %ld failed with reason %li, trying next address..."), v11, v5, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logVerbose:", v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Socket connection to %@ on port %ld succesful"), v11, v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logInfo:", v19);
    }

LABEL_21:
    ++v7;
  }
  if (v9)
    goto LABEL_24;
  -[NMSSHSession setSession:](self, "setSession:", libssh2_session_init_ex(0, 0, 0, (uint64_t)self));
  libssh2_session_callback_set((uint64_t *)-[NMSSHSession rawSession](self, "rawSession"), 2, (uint64_t)disconnect_callback);
  libssh2_session_set_blocking((uint64_t)-[NMSSHSession rawSession](self, "rawSession"), 1);
  -[NMSSHSession banner](self, "banner");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = -[NMSSHSession rawSession](self, "rawSession");
    -[NMSSHSession banner](self, "banner");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LOBYTE(v30) = libssh2_session_banner_set((uint64_t)v30, (char *)objc_msgSend(v31, "UTF8String")) == 0;

    if ((v30 & 1) == 0)
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failure setting the banner"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logError:", v33);

    }
  }
  v34 = -[NMSSHSession rawSession](self, "rawSession");
  v35 = CFSocketGetNative(self->_socket);
  if (!libssh2_session_handshake((uint64_t)v34, v35))
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x24BDD17C8];
    -[NMSSHSession remoteBanner](self, "remoteBanner");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("Remote host banner is %@"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "logVerbose:", v41);

    -[NMSSHSession fingerprint:](self, "fingerprint:", -[NMSSHSession fingerprintHash](self, "fingerprintHash"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The host's fingerprint is %@"), v10);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "logInfo:", v43);

    -[NMSSHSession delegate](self, "delegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      -[NMSSHSession delegate](self, "delegate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[NMSSHSession delegate](self, "delegate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "session:shouldConnectToHostWithFingerprint:", self, v10);

        if ((v47 & 1) == 0)
        {
          +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fingerprint refused, aborting connection..."));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "logWarn:", v49);

          -[NMSSHSession disconnect](self, "disconnect");
          goto LABEL_29;
        }
      }
      else
      {

      }
    }
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SSH session started"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "logVerbose:", v51);

    -[NMSSHSession setConnected:](self, "setConnected:", 1);
    v21 = -[NMSSHSession isConnected](self, "isConnected");
LABEL_30:

    goto LABEL_31;
  }
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failure establishing SSH session"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "logError:", v37);

  -[NMSSHSession disconnect](self, "disconnect");
LABEL_25:
  v21 = 0;
LABEL_31:

LABEL_32:
  _Block_object_dispose(&v55, 8);

  return v21;
}

- (void)disconnect
{
  NMSSHChannel *channel;
  NMSFTP *sftp;
  __CFSocket *socket;
  void *v6;
  void *v7;

  channel = self->_channel;
  if (channel)
  {
    -[NMSSHChannel closeShell](channel, "closeShell");
    -[NMSSHSession setChannel:](self, "setChannel:", 0);
  }
  sftp = self->_sftp;
  if (sftp)
  {
    if (-[NMSFTP isConnected](sftp, "isConnected"))
      -[NMSFTP disconnect](self->_sftp, "disconnect");
    -[NMSSHSession setSftp:](self, "setSftp:", 0);
  }
  if (-[NMSSHSession agent](self, "agent"))
  {
    libssh2_agent_disconnect((uint64_t)-[NMSSHSession agent](self, "agent"));
    libssh2_agent_free((_QWORD *)-[NMSSHSession agent](self, "agent"));
    -[NMSSHSession setAgent:](self, "setAgent:", 0);
  }
  if (-[NMSSHSession rawSession](self, "rawSession"))
  {
    libssh2_session_disconnect_ex((_DWORD *)-[NMSSHSession rawSession](self, "rawSession"), 0xBu, "NMSSH: Disconnect", ");
    libssh2_session_free((uint64_t)-[NMSSHSession rawSession](self, "rawSession"));
    -[NMSSHSession setSession:](self, "setSession:", 0);
  }
  socket = self->_socket;
  if (socket)
  {
    CFSocketInvalidate(socket);
    CFRelease(self->_socket);
    self->_socket = 0;
  }
  libssh2_exit();
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Disconnected"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logVerbose:", v7);

  -[NMSSHSession setConnected:](self, "setConnected:", 0);
}

- (BOOL)isAuthorized
{
  _LIBSSH2_SESSION *v3;

  v3 = -[NMSSHSession rawSession](self, "rawSession");
  if (v3)
    LOBYTE(v3) = libssh2_userauth_authenticated((uint64_t)-[NMSSHSession rawSession](self, "rawSession")) == 1;
  return (char)v3;
}

- (BOOL)authenticateByPassword:(id)a3
{
  id v4;
  _LIBSSH2_SESSION *v5;
  id v6;
  const void *v7;
  id v8;
  unsigned int v9;
  id v10;
  const void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;

  v4 = a3;
  if (v4 && -[NMSSHSession supportsAuthenticationMethod:](self, "supportsAuthenticationMethod:", CFSTR("password")))
  {
    v5 = -[NMSSHSession rawSession](self, "rawSession");
    -[NMSSHSession username](self, "username");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const void *)objc_msgSend(v6, "UTF8String");
    -[NMSSHSession username](self, "username");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = strlen((const char *)objc_msgSend(v8, "UTF8String"));
    v10 = objc_retainAutorelease(v4);
    v11 = (const void *)objc_msgSend(v10, "UTF8String");
    v12 = strlen((const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    v13 = libssh2_userauth_password_ex((uint64_t)v5, v7, v9, v11, v12, 0);

    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(_DWORD)v13)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Password authentication succeeded."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logVerbose:", v18);

      v16 = -[NMSSHSession isAuthorized](self, "isAuthorized");
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Password authentication failed with reason %i"), v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logError:", v15);

  }
  v16 = 0;
LABEL_6:

  return v16;
}

- (BOOL)authenticateByPublicKey:(id)a3 privateKey:(id)a4 andPassword:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  id v11;
  id v12;
  char *v13;
  _LIBSSH2_SESSION *v14;
  id v15;
  const void *v16;
  id v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  char *v25;

  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  if (-[NMSSHSession supportsAuthenticationMethod:](self, "supportsAuthenticationMethod:", CFSTR("publickey")))
  {
    if (!v10)
      v10 = &stru_24F8BBA48;
    objc_msgSend(v8, "stringByExpandingTildeInPath");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = (char *)objc_msgSend(v11, "UTF8String");

    objc_msgSend(v9, "stringByExpandingTildeInPath");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (char *)objc_msgSend(v12, "UTF8String");

    v14 = -[NMSSHSession rawSession](self, "rawSession");
    -[NMSSHSession username](self, "username");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const void *)objc_msgSend(v15, "UTF8String");
    -[NMSSHSession username](self, "username");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = strlen((const char *)objc_msgSend(v17, "UTF8String"));
    v10 = objc_retainAutorelease(v10);
    v19 = libssh2_userauth_publickey_fromfile_ex((uint64_t)v14, v16, v18, v25, v13, (char *)-[__CFString UTF8String](v10, "UTF8String"));

    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(_DWORD)v19)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Public key authentication succeeded."));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logVerbose:", v23);

      v22 = -[NMSSHSession isAuthorized](self, "isAuthorized");
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Public key authentication failed with reason %i"), v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logError:", v21);

  }
  v22 = 0;
LABEL_8:

  return v22;
}

- (BOOL)authenticateByInMemoryPublicKey:(id)a3 privateKey:(id)a4 andPassword:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  id v11;
  const void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  const void *v16;
  size_t v17;
  id v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  _LIBSSH2_SESSION *v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  if (-[NMSSHSession supportsAuthenticationMethod:](self, "supportsAuthenticationMethod:", CFSTR("publickey")))
  {
    if (!v10)
      v10 = &stru_24F8BBA48;
    v27 = -[NMSSHSession rawSession](self, "rawSession");
    -[NMSSHSession username](self, "username");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const void *)objc_msgSend(v11, "UTF8String");
    -[NMSSHSession username](self, "username");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");
    v29 = v8;
    v15 = objc_retainAutorelease(v8);
    v16 = (const void *)objc_msgSend(v15, "UTF8String");
    v17 = objc_msgSend(v15, "length");
    v28 = v9;
    v18 = objc_retainAutorelease(v9);
    v19 = (void *)objc_msgSend(v18, "UTF8String");
    v20 = objc_msgSend(v18, "length");
    v10 = objc_retainAutorelease(v10);
    v21 = libssh2_userauth_publickey_frommemory((uint64_t)v27, v12, v14, v16, v17, v19, v20, (char *)-[__CFString UTF8String](v10, "UTF8String"));

    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v21)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Public key authentication failed with reason %i"), v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logError:", v23);

      v24 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Public key authentication succeeded."));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logVerbose:", v25);

      v24 = -[NMSSHSession isAuthorized](self, "isAuthorized");
    }
    v9 = v28;
    v8 = v29;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)authenticateByKeyboardInteractive
{
  return -[NMSSHSession authenticateByKeyboardInteractiveUsingBlock:](self, "authenticateByKeyboardInteractiveUsingBlock:", 0);
}

- (BOOL)authenticateByKeyboardInteractiveUsingBlock:(id)a3
{
  id v4;
  _LIBSSH2_SESSION *v5;
  id v6;
  const void *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;

  v4 = a3;
  if (-[NMSSHSession supportsAuthenticationMethod:](self, "supportsAuthenticationMethod:", CFSTR("keyboard-interactive")))
  {
    -[NMSSHSession setKbAuthenticationBlock:](self, "setKbAuthenticationBlock:", v4);
    v5 = -[NMSSHSession rawSession](self, "rawSession");
    -[NMSSHSession username](self, "username");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const void *)objc_msgSend(v6, "UTF8String");
    -[NMSSHSession username](self, "username");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = strlen((const char *)objc_msgSend(v8, "UTF8String"));
    v10 = libssh2_userauth_keyboard_interactive_ex((uint64_t)v5, v7, v9, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))kb_callback);

    -[NMSSHSession setKbAuthenticationBlock:](self, "setKbAuthenticationBlock:", 0);
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(_DWORD)v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Keyboard-interactive authentication succeeded."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logVerbose:", v14);

      v13 = -[NMSSHSession isAuthorized](self, "isAuthorized");
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Keyboard-interactive authentication failed with reason %i"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logError:", v12);

  }
  v13 = 0;
LABEL_6:

  return v13;
}

- (BOOL)connectToAgent
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  _LIBSSH2_AGENT *v8;
  id v9;
  const char *v10;
  void *v11;
  uint64_t i;

  v3 = -[NMSSHSession supportsAuthenticationMethod:](self, "supportsAuthenticationMethod:", CFSTR("publickey"));
  if (v3)
  {
    -[NMSSHSession setAgent:](self, "setAgent:", libssh2_agent_init((uint64_t)-[NMSSHSession rawSession](self, "rawSession")));
    if (!-[NMSSHSession agent](self, "agent"))
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BDD17C8];
      v6 = CFSTR("Could not start a new agent");
      goto LABEL_13;
    }
    if (libssh2_agent_connect((uint64_t)-[NMSSHSession agent](self, "agent")))
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BDD17C8];
      v6 = CFSTR("Failed connection to agent");
LABEL_13:
      objc_msgSend(v5, "stringWithFormat:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logError:", v11);

      LOBYTE(v3) = 0;
      return v3;
    }
    if (libssh2_agent_list_identities((uint64_t *)-[NMSSHSession agent](self, "agent")))
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BDD17C8];
      v6 = CFSTR("Failed to request agent identities");
      goto LABEL_13;
    }
    v7 = 0;
    for (i = 0; ; v7 = i)
    {
      if (libssh2_agent_get_identity((uint64_t)-[NMSSHSession agent](self, "agent"), &i, v7))
      {
        +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)MEMORY[0x24BDD17C8];
        v6 = CFSTR("Failed to find a valid identity for the agent");
        goto LABEL_13;
      }
      v8 = -[NMSSHSession agent](self, "agent");
      -[NMSSHSession username](self, "username");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = (const char *)objc_msgSend(v9, "UTF8String");
      LODWORD(v8) = libssh2_agent_userauth((uint64_t *)v8, v10, i);

      if (!(_DWORD)v8)
        break;
    }
    LOBYTE(v3) = -[NMSSHSession isAuthorized](self, "isAuthorized");
  }
  return v3;
}

- (id)supportedAuthenticationMethods
{
  _LIBSSH2_SESSION *v3;
  id v4;
  const void *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = -[NMSSHSession rawSession](self, "rawSession");
  -[NMSSHSession username](self, "username");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const void *)objc_msgSend(v4, "UTF8String");
  -[NMSSHSession username](self, "username");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = strlen((const char *)objc_msgSend(v6, "UTF8String"));
  v8 = libssh2_userauth_list((uint64_t)v3, v5, v7);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("User auth list: %@"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logVerbose:", v11);

    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD17C8];
    -[NMSSHSession host](self, "host");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSSHSession port](self, "port");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Failed to get authentication method for host %@:%@"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logInfo:", v16);

    v12 = 0;
  }

  return v12;
}

- (BOOL)supportsAuthenticationMethod:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NMSSHSession supportedAuthenticationMethods](self, "supportedAuthenticationMethods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)fingerprint:(int64_t)a3
{
  _BOOL4 v5;
  int v6;
  BOOL v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  void *v18;
  void *v20;

  if (!-[NMSSHSession rawSession](self, "rawSession"))
    return 0;
  v5 = a3 == 0;
  if (a3)
    v6 = 0;
  else
    v6 = 16;
  v7 = a3 == 1;
  if (a3 == 1)
    v8 = 2;
  else
    v8 = a3 == 0;
  v9 = v7 || v5;
  if (v7)
    v10 = 20;
  else
    v10 = v6;
  v11 = (unsigned __int8 *)libssh2_hostkey_hash((_DWORD *)-[NMSSHSession rawSession](self, "rawSession"), v8);
  if (v11)
  {
    v12 = v11;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("%02X"), *v11);
    if (v9)
    {
      if (v10 <= 2)
        v14 = 2;
      else
        v14 = v10;
      v15 = v14 - 1;
      v16 = v12 + 1;
      do
      {
        v17 = *v16++;
        objc_msgSend(v13, "appendFormat:", CFSTR(":%02X"), v17);
        --v15;
      }
      while (v15);
    }
    v18 = (void *)objc_msgSend(v13, "copy");
  }
  else
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to retrive host's fingerprint"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logWarn:", v20);

    v18 = 0;
  }

  return v18;
}

- (id)applicationSupportDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("NMSSH"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

  }
  return v4;
}

- (id)userKnownHostsFileName
{
  void *v2;
  void *v3;

  -[NMSSHSession applicationSupportDirectory](self, "applicationSupportDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("known_hosts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)knownHostStatusInFiles:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    -[NMSSHSession userKnownHostsFileName](self, "userKnownHostsFileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = -[NMSSHSession knownHostStatusWithFile:](self, "knownHostStatusWithFile:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
      if ((unint64_t)(v11 - 4) < 0xFFFFFFFFFFFFFFFELL)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }
  else
  {
    v11 = 3;
  }

  return v11;
}

- (int64_t)knownHostStatusWithFile:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t *v6;
  id v7;
  int v8;
  _QWORD *v9;
  _QWORD *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  int64_t v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  int v35;

  v4 = a3;
  v5 = libssh2_knownhost_init((uint64_t)-[NMSSHSession rawSession](self, "rawSession"));
  if (!v5)
    goto LABEL_15;
  v6 = v5;
  v7 = objc_retainAutorelease(v4);
  objc_msgSend(v7, "UTF8String");
  v8 = libssh2_knownhost_readfile((uint64_t)v6);
  if (v8 < 0)
  {
    v26 = v8;
    libssh2_knownhost_free(v6);
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26 == -16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No known hosts file %@."), v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "logInfo:", v28);

      v25 = 2;
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to read known hosts file %@."), v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "logError:", v31);

LABEL_15:
    v25 = 3;
    goto LABEL_20;
  }
  v35 = 0;
  v34 = 0;
  v9 = libssh2_session_hostkey((uint64_t)-[NMSSHSession rawSession](self, "rawSession"), &v34, &v35);
  if (!v9)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get host key."));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logError:", v30);

    libssh2_knownhost_free(v6);
    goto LABEL_15;
  }
  v10 = v9;
  v11 = v35;
  v33 = 0;
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  -[NMSSHSession host](self, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSSHSession port](self, "port");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Check for host %@, port %@ in file %@"), v14, v15, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logInfo:", v16);

  -[NMSSHSession host](self, "host");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "UTF8String");
  -[NMSSHSession port](self, "port");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "intValue");
  if (v11 == 1)
    v21 = 589825;
  else
    v21 = 851969;
  v22 = libssh2_knownhost_checkp(v6, v18, v20, v10, v34, v21, &v33);

  libssh2_knownhost_free(v6);
  if (v22 == 2)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not found"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logInfo:", v24);
    v25 = 2;
  }
  else if (v22 == 1)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Mismatch"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logInfo:", v24);
    v25 = 1;
  }
  else
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failure"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logInfo:", v24);
      v25 = 3;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Match"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logInfo:", v24);
      v25 = 0;
    }
  }

LABEL_20:
  return v25;
}

- (BOOL)addKnownHostName:(id)a3 port:(int64_t)a4 toFile:(id)a5 withSalt:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char *v15;
  char *v16;
  uint64_t *v17;
  uint64_t *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  BOOL v27;
  int v29;
  int v30;
  int v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  int v48[2];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4 == 22)
  {
    v13 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]:%d"), v10, a4);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  if (!v11)
  {
    -[NMSSHSession userKnownHostsFileName](self, "userKnownHostsFileName");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  *(_QWORD *)v48 = 0;
  v47 = 0;
  v15 = (char *)libssh2_session_hostkey((uint64_t)-[NMSSHSession rawSession](self, "rawSession"), v48, &v47);
  if (!v15)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD17C8];
    v25 = CFSTR("Failed to get host key.");
LABEL_13:
    objc_msgSend(v24, "stringWithFormat:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logError:", v26);

    goto LABEL_14;
  }
  v16 = v15;
  v17 = libssh2_knownhost_init((uint64_t)-[NMSSHSession rawSession](self, "rawSession"));
  if (!v17)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD17C8];
    v25 = CFSTR("Failed to initialize knownhosts.");
    goto LABEL_13;
  }
  v18 = v17;
  v19 = objc_retainAutorelease(v11);
  objc_msgSend(v19, "UTF8String");
  v20 = libssh2_knownhost_readfile((uint64_t)v18);
  if ((v20 & 0x80000000) == 0 || v20 == -16)
  {
    if (v47 == 1)
      v29 = 589824;
    else
      v29 = 851968;
    if (v12)
      v30 = 2;
    else
      v30 = 1;
    v31 = v29 | v30;
    v32 = (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    v33 = (char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    v34 = libssh2_knownhost_addc((uint64_t)v18, v32, v33, v16, *(size_t *)v48, 0, 0, v31, 0);
    if ((_DWORD)v34)
    {
      v35 = v34;
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x24BDD17C8];
      -[NMSSHSession lastError](self, "lastError");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("Failed to add host to known hosts: error %d (%@)"), v35, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logError:", v39);

    }
    else
    {
      objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
      v40 = libssh2_knownhost_writefile((uint64_t)v18);
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x24BDD17C8];
      if ((v40 & 0x80000000) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Host added to known hosts."));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "logInfo:", v43);

        v27 = v40 == 0;
        goto LABEL_27;
      }
      -[NMSSHSession userKnownHostsFileName](self, "userKnownHostsFileName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NMSSHSession lastError](self, "lastError");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", CFSTR("Couldn't write to %@: %@"), v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "logError:", v46);

    }
    v27 = 0;
LABEL_27:
    libssh2_knownhost_free(v18);
    goto LABEL_15;
  }
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to read known hosts file."));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logError:", v22);

  libssh2_knownhost_free(v18);
LABEL_14:
  v27 = 0;
LABEL_15:

  return v27;
}

- (id)keyboardInteractiveRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;

  v4 = a3;
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Server request '%@'"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logVerbose:", v6);

  -[NMSSHSession kbAuthenticationBlock](self, "kbAuthenticationBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NMSSHSession kbAuthenticationBlock](self, "kbAuthenticationBlock");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NMSSHSession delegate](self, "delegate");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11
      || (v12 = (void *)v11,
          -[NMSSHSession delegate](self, "delegate"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_opt_respondsToSelector(),
          v13,
          v12,
          (v14 & 1) == 0))
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Keyboard interactive requires a delegate that responds to session:keyboardInteractiveRequest: or a block!"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logWarn:", v15);

      v10 = &stru_24F8BBA48;
      goto LABEL_8;
    }
    -[NMSSHSession delegate](self, "delegate");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "session:keyboardInteractiveRequest:", self, v4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (__CFString *)v9;
LABEL_8:

  return v10;
}

- (NMSSHChannel)channel
{
  NMSSHChannel *channel;
  NMSSHChannel *v4;
  NMSSHChannel *v5;

  channel = self->_channel;
  if (!channel)
  {
    v4 = -[NMSSHChannel initWithSession:]([NMSSHChannel alloc], "initWithSession:", self);
    v5 = self->_channel;
    self->_channel = v4;

    channel = self->_channel;
  }
  return channel;
}

- (NMSFTP)sftp
{
  NMSFTP *sftp;
  NMSFTP *v4;
  NMSFTP *v5;

  sftp = self->_sftp;
  if (!sftp)
  {
    v4 = -[NMSFTP initWithSession:]([NMSFTP alloc], "initWithSession:", self);
    v5 = self->_sftp;
    self->_sftp = v4;

    sftp = self->_sftp;
  }
  return sftp;
}

- (NMSSHSessionDelegate)delegate
{
  return (NMSSHSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NMSSHHostConfig)hostConfig
{
  return self->_hostConfig;
}

- (void)setHostConfig:(id)a3
{
  objc_storeStrong((id *)&self->_hostConfig, a3);
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_storeStrong((id *)&self->_port, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (int64_t)fingerprintHash
{
  return self->_fingerprintHash;
}

- (void)setFingerprintHash:(int64_t)a3
{
  self->_fingerprintHash = a3;
}

- (NSString)banner
{
  return self->_banner;
}

- (void)setBanner:(id)a3
{
  objc_storeStrong((id *)&self->_banner, a3);
}

- (_LIBSSH2_SESSION)rawSession
{
  return self->_session;
}

- (void)setSession:(_LIBSSH2_SESSION *)a3
{
  self->_session = a3;
}

- (__CFSocket)socket
{
  return self->_socket;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (void)setSftp:(id)a3
{
  objc_storeStrong((id *)&self->_sftp, a3);
}

- (_LIBSSH2_AGENT)agent
{
  return self->_agent;
}

- (void)setAgent:(_LIBSSH2_AGENT *)a3
{
  self->_agent = a3;
}

- (id)kbAuthenticationBlock
{
  return self->_kbAuthenticationBlock;
}

- (void)setKbAuthenticationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_kbAuthenticationBlock, 0);
  objc_storeStrong((id *)&self->_sftp, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_hostConfig, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __35__NMSSHSession_connectWithTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (libssh2_init(0))
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("libssh2 initialization failed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logError:", v3);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("libssh2 (v%s) initialized"), libssh2_version(0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logVerbose:", v4);

}

+ (id)connectToHost:(id)a3 port:(int64_t)a4 withUsername:(id)a5
{
  id v7;
  id v8;
  NMSSHSession *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[NMSSHSession initWithHost:port:andUsername:]([NMSSHSession alloc], "initWithHost:port:andUsername:", v8, a4, v7);

  -[NMSSHSession connect](v9, "connect");
  return v9;
}

+ (id)connectToHost:(id)a3 withUsername:(id)a4
{
  id v5;
  id v6;
  NMSSHSession *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NMSSHSession initWithHost:andUsername:]([NMSSHSession alloc], "initWithHost:andUsername:", v6, v5);

  -[NMSSHSession connect](v7, "connect");
  return v7;
}

+ (id)URLForHost:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 3)
    goto LABEL_4;
  v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("["));

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]"), v3);
    v4 = v3;
    v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:

  }
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(CFSTR("ssh://"), "stringByAppendingString:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
