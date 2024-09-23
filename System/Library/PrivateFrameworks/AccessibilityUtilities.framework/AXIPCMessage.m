@implementation AXIPCMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

- (int)key
{
  return self->_key;
}

- (void)setProcessedMessage:(BOOL)a3
{
  self->_processedMessage = a3;
}

- (void)setClientPort:(unsigned int)a3
{
  _BOOL4 v5;
  mach_port_name_t clientPort;

  v5 = AXIncrefSendRight(a3);
  clientPort = self->_clientPort;
  if (clientPort)
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], clientPort);
  if (v5)
    self->_clientPort = a3;
}

- (void)setAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = v3;
}

- (BOOL)processedMessage
{
  return self->_processedMessage;
}

- (AXIPCMessage)initWithKey:(int)a3 payload:(id)a4
{
  uint64_t v4;
  id v6;
  AXIPCMessage *v7;
  AXIPCMessage *v8;
  void *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXIPCMessage;
  v7 = -[AXIPCMessage init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[AXIPCMessage setKey:](v7, "setKey:", v4);
    if (v6)
    {
      v9 = (void *)objc_msgSend(v6, "copy");
      -[AXIPCMessage setPayload:](v8, "setPayload:", v9);

    }
    else
    {
      -[AXIPCMessage setPayload:](v8, "setPayload:", MEMORY[0x1E0C9AA70]);
    }
    v8->_clientPort = 0;
    ++AXIPCMessageUniqueID;
    -[AXIPCMessage setUniqueID:](v8, "setUniqueID:");
  }

  return v8;
}

- (AXIPCMessage)initWithCoder:(id)a3
{
  id v4;
  AXIPCMessage *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  Class v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AXIPCMessage;
  v5 = -[AXIPCMessage init](&v22, sel_init);
  if (v5)
  {
    -[AXIPCMessage setKey:](v5, "setKey:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("key")));
    if (!AllowedClasses)
    {
      v21 = (void *)MEMORY[0x1E0C99E20];
      v20 = objc_opt_class();
      v19 = objc_opt_class();
      v6 = objc_opt_class();
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      objc_msgSend(v21, "setWithObjects:", v20, v19, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)AllowedClasses;
      AllowedClasses = v13;

    }
    v15 = NSClassFromString(CFSTR("AXHearingAidMode"));
    if (v15)
      objc_msgSend((id)AllowedClasses, "addObject:", v15);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", AllowedClasses, CFSTR("payload"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = (void *)v16;
    else
      v17 = (void *)MEMORY[0x1E0C9AA70];
    -[AXIPCMessage setPayload:](v5, "setPayload:", v17);
    ++AXIPCMessageUniqueID;
    -[AXIPCMessage setUniqueID:](v5, "setUniqueID:");

  }
  return v5;
}

- (void)setKey:(int)a3
{
  self->_key = a3;
}

- (void)setUniqueID:(unint64_t)a3
{
  self->_uniqueID = a3;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (id)archivedMessageFromData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v18 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v18);
    v5 = v18;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CF39F8], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "ignoreLogging");

      if ((v7 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CF39F8], "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v9 = objc_claimAutoreleasedReturnValue();

        v10 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v9, v10))
        {
          AXColorizeFormatLog();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, v10))
          {
            *(_DWORD *)buf = 138543362;
            v20 = v12;
            _os_log_impl(&dword_18C62B000, v9, v10, "%{public}@", buf, 0xCu);
          }

        }
      }
    }
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, *MEMORY[0x1E0CB2CD0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AXIPCMessage payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !objc_msgSend((id)objc_opt_class(), "supportsSecureCoding"))
  {
    _AXLogWithFacility();
  }
  else
  {
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("payload"));
    objc_msgSend(v5, "encodeInt32:forKey:", -[AXIPCMessage key](self, "key"), CFSTR("key"));
  }

}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)dealloc
{
  mach_port_name_t clientPort;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  clientPort = self->_clientPort;
  if (clientPort)
  {
    v4 = mach_port_deallocate(*MEMORY[0x1E0C83DA0], clientPort);
    if ((_DWORD)v4)
    {
      v6 = self->_clientPort;
      v7 = v4;
      v5 = "-[AXIPCMessage dealloc]";
      _AXAssert();
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)AXIPCMessage;
  -[AXIPCMessage dealloc](&v8, sel_dealloc, v5, v6, v7);
}

- (AXIPCMessage)initWithKey:(int)a3
{
  return -[AXIPCMessage initWithKey:payload:](self, "initWithKey:payload:", *(_QWORD *)&a3, 0);
}

- (NSString)senderBundleId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int pid[6];
  _BYTE buffer[4096];
  uint64_t v13;

  v2 = (void *)MEMORY[0x1E0C80A78](self, a2);
  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "auditToken", 0, 0, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, proc_pidpath(pid[1], buffer, 0x1000u), 4);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB34D0]);
      objc_msgSend(v5, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithPath:", v7);

      if (v8)
      {
        objc_msgSend(v8, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return (NSString *)v9;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)AXIPCMessage;
  -[AXIPCMessage description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXIPCMessage clientPort](self, "clientPort");
  v6 = -[AXIPCMessage key](self, "key");
  -[AXIPCMessage payload](self, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AXIPCMessage uniqueID](self, "uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@. Client port: %ld. Key: %d. Payload: %@ (%@)"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unsigned)clientPort
{
  return self->_clientPort;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

@end
