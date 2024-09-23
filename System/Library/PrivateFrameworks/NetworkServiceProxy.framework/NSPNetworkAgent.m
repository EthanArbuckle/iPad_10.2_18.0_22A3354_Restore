@implementation NSPNetworkAgent

- (NSPNetworkAgent)init
{
  NSPNetworkAgent *v2;
  NSPNetworkAgent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSPNetworkAgent;
  v2 = -[NSPNetworkAgent init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NSPNetworkAgent setActive:](v2, "setActive:", 1);
    -[NSPNetworkAgent setKernelActivated:](v3, "setKernelActivated:", 1);
    -[NSPNetworkAgent setUserActivated:](v3, "setUserActivated:", 1);
    -[NSPNetworkAgent setVoluntary:](v3, "setVoluntary:", 0);
    *(_OWORD *)&v3->_dataDigest[16] = 0u;
    *(_OWORD *)v3->_dataDigest = 0u;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  v8 = (objc_opt_isKindOfClass() & 1) != 0
    && *(_QWORD *)self->_dataDigest == v4[1]
    && *(_QWORD *)&self->_dataDigest[8] == v4[2]
    && *(_QWORD *)&self->_dataDigest[16] == v4[3]
    && *(_QWORD *)&self->_dataDigest[24] == v4[4];

  return v8;
}

+ (id)agentDomain
{
  return CFSTR("com.apple.NetworkServiceProxy");
}

+ (id)agentType
{
  return CFSTR("com.apple.NetworkServiceProxy");
}

- (NSString)agentDescription
{
  NSString *agentDescription;

  agentDescription = self->agentDescription;
  self->agentDescription = (NSString *)CFSTR("com.apple.NetworkServiceProxy");

  return self->agentDescription;
}

- (id)copyAgentData
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  unsigned __int16 v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int16 v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unsigned __int16 v26;
  id v27;
  unsigned __int16 v29;
  char v30;

  -[NSPNetworkAgent appRule](self, "appRule");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_11;
  v4 = (id)v3;
  -[NSPNetworkAgent appRule](self, "appRule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "BOOLValue") & 1) == 0)
  {

    v9 = 0;
    v10 = 1;
LABEL_10:

    goto LABEL_12;
  }
  -[NSPNetworkAgent appRule](self, "appRule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "useCustomProtocol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {
    -[NSPNetworkAgent appRule](self, "appRule");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "useLocalFlowDivert");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if ((v13 & 1) != 0)
      goto LABEL_7;
LABEL_11:
    v9 = 0;
    v10 = 1;
    goto LABEL_12;
  }

LABEL_7:
  -[NSPNetworkAgent appRule](self, "appRule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyTLVData");

  v9 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v16 = objc_msgSend(v15, "length");
  v17 = objc_retainAutorelease(v15);
  v10 = 1;
  -[NSMutableData appendType:length:value:](v9, 1, v16, objc_msgSend(v17, "bytes"));

  if (!v9)
    goto LABEL_12;
  -[NSPNetworkAgent configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[NSPNetworkAgent configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copyTLVData");

    v21 = objc_msgSend(v20, "length");
    v4 = objc_retainAutorelease(v20);
    v22 = objc_msgSend(v4, "bytes");
    v30 = 2;
    v29 = v21;
    objc_msgSend(v9, "appendBytes:length:", &v30, 1);
    objc_msgSend(v9, "appendBytes:length:", &v29, 2);
    objc_msgSend(v9, "appendBytes:length:", v22, v29);
    v10 = 0;
    goto LABEL_10;
  }
  v10 = 0;
LABEL_12:
  -[NSPNetworkAgent keybag](self, "keybag");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    if (v10)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    -[NSPNetworkAgent keybag](self, "keybag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");
    -[NSPNetworkAgent keybag](self, "keybag");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[NSMutableData appendType:length:value:](v9, 3, v26, objc_msgSend(v27, "bytes"));

  }
  return v9;
}

+ (id)agentFromData:(id)a3
{
  id v3;
  NSPNetworkAgent *v4;
  unsigned __int8 *v5;
  id v6;

  v3 = a3;
  v4 = objc_alloc_init(NSPNetworkAgent);
  v5 = (unsigned __int8 *)v4;
  if (v4)
  {
    -[NSPNetworkAgent setAgentData:](v4, "setAgentData:", v3);
    v6 = objc_retainAutorelease(v3);
    CC_SHA256((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), v5 + 8);
  }

  return v5;
}

- (void)parseAgentData
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[NSPNetworkAgent agentData](self, "agentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSPNetworkAgent agentData](self, "agentData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__NSPNetworkAgent_parseAgentData__block_invoke;
    v6[3] = &unk_1E4137CC8;
    v6[4] = self;
    -[NSMutableData enumerateTLVsUsingBlock:](v5, v6);

  }
  -[NSPNetworkAgent setAgentData:](self, "setAgentData:", 0);
}

uint64_t __33__NSPNetworkAgent_parseAgentData__block_invoke(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  void *v5;
  id v6;

  switch(a2)
  {
    case 3:
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a4, a3);
      if (v5)
        objc_msgSend(*(id *)(a1 + 32), "setKeybag:", v5);
      goto LABEL_11;
    case 2:
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a4, a3, 0);
      v6 = -[NSPConfiguration initFromTLVs:]([NSPConfiguration alloc], "initFromTLVs:", v5);
      if (v6)
        objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", v6);
      goto LABEL_10;
    case 1:
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a4, a3, 0);
      v6 = -[NSPAppRule initFromTLVs:]([NSPAppRule alloc], "initFromTLVs:", v5);
      if (v6)
        objc_msgSend(*(id *)(a1 + 32), "setAppRule:", v6);
LABEL_10:

LABEL_11:
      break;
  }
  return 1;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAgentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (NSPConfiguration)configuration
{
  return (NSPConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSPAppRule)appRule
{
  return (NSPAppRule *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAppRule:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSData)keybag
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setKeybag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSData)agentData
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAgentData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agentData, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_appRule, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

@end
