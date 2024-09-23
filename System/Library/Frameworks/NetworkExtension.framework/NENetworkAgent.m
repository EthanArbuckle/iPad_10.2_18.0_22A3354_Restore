@implementation NENetworkAgent

- (NENetworkAgent)initWithConfigUUID:(id)a3 sessionType:(int)a4 name:(id)a5
{
  id v9;
  id v10;
  NENetworkAgent *v11;
  NENetworkAgent *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NENetworkAgent;
  v11 = -[NENetworkAgent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_internalUUID, a3);
    v12->_internalSessionType = a4;
    objc_storeStrong((id *)&v12->_name, a5);
  }

  return v12;
}

- (NENetworkAgent)initWithDelegate:(id)a3 configUUID:(id)a4 sessionType:(int)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  NENetworkAgent *v13;
  NENetworkAgent *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NENetworkAgent;
  v13 = -[NENetworkAgent init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_internalUUID, a4);
    v14->_internalSessionType = a5;
    objc_storeStrong((id *)&v14->_name, a6);
    objc_storeWeak((id *)&v14->_delegate, v10);
  }

  return v14;
}

- (BOOL)reportError:(int)a3 withOptions:(id)a4
{
  uint64_t v4;
  id v6;
  id WeakRetained;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "reportError:withOptions:", v4, v6);

  return 1;
}

- (BOOL)matchesFileHandle:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  id v12;
  const char *v13;
  int v14;
  char v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  id v22;
  void *v23;

  v5 = a3;
  objc_msgSend(v5, "sessionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");
  if (v7 != -[NENetworkAgent sessionType](self, "sessionType"))
  {
    v15 = 0;
    goto LABEL_21;
  }
  -[NENetworkAgent configurationUUID](self, "configurationUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    if (self && (v12 = objc_getProperty(self, v11, 48, 1)) != 0)
    {
      v6 = v12;
      v14 = 0;
    }
    else
    {
      objc_msgSend(v5, "name");
      v16 = objc_claimAutoreleasedReturnValue();
      v6 = 0;
      if (v16)
        v3 = (void *)v16;
      else
        v3 = 0;
      if (v16)
        v15 = 0;
      else
        v15 = -1;
      if (!v16 || !self)
        goto LABEL_20;
      v14 = 1;
      v3 = (void *)v16;
    }
    v17 = objc_getProperty(self, v13, 48, 1);
    if (!v17)
    {
      v15 = 0;
      if (!v14)
        goto LABEL_21;
      goto LABEL_20;
    }
    v18 = v17;
    objc_msgSend(v5, "name");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

      v15 = 0;
      if ((v14 & 1) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
    v21 = (void *)v19;
    v22 = objc_getProperty(self, v20, 48, 1);
    objc_msgSend(v5, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v22, "isEqualToString:", v23);

    if ((v14 & 1) != 0)
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  v15 = 0;
LABEL_22:

  return v15 & 1;
}

- (NSString)agentDescription
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  __CFString *v7;
  char v8;
  const char *v9;
  id v10;
  const __CFString *v11;
  id v12;
  const char *v13;
  void *v14;
  NSString *v15;
  NSString *agentDescription;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "agentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NENetworkAgent configurationName](self, "configurationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &stru_1E3CC53C8;
  if (self)
  {
    v8 = 1;
    v10 = objc_getProperty(self, v5, 48, 1);
    if (v10)
      v11 = CFSTR(" ");
    else
      v11 = &stru_1E3CC53C8;
    v12 = objc_getProperty(self, v9, 48, 1);
    if (v12)
    {
      v14 = v12;
      v7 = (__CFString *)objc_getProperty(self, v13, 48, 1);

      v8 = 0;
    }
  }
  else
  {
    v10 = 0;
    v8 = 1;
    v11 = &stru_1E3CC53C8;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@%@%@"), v4, v6, v11, v7);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  agentDescription = self->agentDescription;
  self->agentDescription = v15;

  if ((v8 & 1) == 0)
  return self->agentDescription;
}

- (id)copyAgentData
{
  SEL v3;
  const char *v4;
  id v5;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  if (self)
  {
    objc_msgSend(objc_getProperty(self, a2, 40, 1), "getUUIDBytes:", &v7);
    LODWORD(v8) = self->_internalSessionType;
    if (objc_getProperty(self, v3, 48, 1))
    {
      v5 = objc_retainAutorelease(objc_getProperty(self, v4, 48, 1));
      objc_msgSend(v5, "UTF8String", v7);
      __strlcpy_chk();
    }
  }
  else
  {
    objc_msgSend(0, "getUUIDBytes:", &v7);
    LODWORD(v8) = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v7, 40);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSUUID)configurationUUID
{
  if (self)
    self = (NENetworkAgent *)objc_getProperty(self, a2, 40, 1);
  return (NSUUID *)self;
}

- (int)sessionType
{
  if (self)
    LODWORD(self) = self->_internalSessionType;
  return (int)self;
}

- (void)setStartHandler:(id)a3
{
  if (self)
    objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)startAgentWithOptions:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  const char *v27;
  id Property;
  id v29;
  id v30;
  void *v32;
  int v33;
  void *v34;
  uuid_t uu;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self && objc_getProperty(self, v4, 56, 1))
  {
    memset(uu, 0, sizeof(uu));
    uuid_clear(uu);
    v6 = *MEMORY[0x1E0CCEC20];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CCEC20]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = isa_nsuuid(v7);

    if (!v8)
    {
      v20 = *MEMORY[0x1E0CCEC28];
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CCEC28]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = isa_nsnumber(v21);

      if (v22)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v23, "intValue");

      }
      else
      {
        v13 = 0;
      }
      v24 = *MEMORY[0x1E0CCEC30];
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CCEC30]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = isa_nsuuid(v25);

      if (!v26)
      {
        v18 = 0;
LABEL_21:
        v19 = 1;
        Property = objc_getProperty(self, v27, 56, 1);
        v29 = objc_retainAutorelease(v18);
        v30 = Property;
        (*((void (**)(id, uint64_t, unsigned __int8 *, uint64_t))Property + 2))(v30, v13, uu, objc_msgSend(v29, "UTF8String"));

        goto LABEL_22;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getUUIDBytes:", uu);
      v18 = 0;
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CCECA8], "pathForClientID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "parameters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "pid");

      objc_msgSend(v11, "parameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "effectiveProcessUUID");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v15, "getUUIDBytes:", uu);

      objc_msgSend(v11, "endpoint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      LOBYTE(v15) = objc_opt_isKindOfClass();

      if ((v15 & 1) == 0)
      {
        v18 = 0;
        goto LABEL_19;
      }
      objc_msgSend(v11, "endpoint");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject hostname](v17, "hostname");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      ne_log_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "UUIDString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412290;
        v34 = v32;
        _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "Could not fetch path for unassert message (client %@)", (uint8_t *)&v33, 0xCu);

      }
      v18 = 0;
      v13 = 0;
    }

LABEL_19:
    goto LABEL_20;
  }
  v19 = 0;
LABEL_22:

  return v19;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setAgentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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

- (NSString)configurationName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConfigurationName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (int)lastStatus
{
  return self->_lastStatus;
}

- (void)setLastStatus:(int)a3
{
  self->_lastStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_internalStartHandler, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_internalUUID, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

+ (id)agentDomain
{
  return CFSTR("NetworkExtension");
}

+ (id)agentType
{
  return CFSTR("Generic");
}

+ (id)agentFromData:(id)a3
{
  id v3;
  uint64_t v4;
  NENetworkAgent *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NENetworkAgent *v9;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 40)
  {
    v4 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v5 = [NENetworkAgent alloc];
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v4);
    v7 = *(unsigned int *)(v4 + 16);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4 + 20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NENetworkAgent initWithConfigUUID:sessionType:name:](v5, "initWithConfigUUID:sessionType:name:", v6, v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
