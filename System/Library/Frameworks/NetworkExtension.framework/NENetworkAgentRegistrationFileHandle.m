@implementation NENetworkAgentRegistrationFileHandle

- (NENetworkAgentRegistrationFileHandle)initWithNetworkAgentRegistration:(id)a3 sessionType:(id)a4 configurationIdentifier:(id)a5 agentUUID:(id)a6 name:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  NENetworkAgentRegistrationFileHandle *v19;
  id *p_isa;
  NENetworkAgentRegistrationFileHandle *v21;
  objc_super v23;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(a3, "dupRegistrationFileDescriptor");
  if ((v17 & 0x80000000) != 0)
  {
    v21 = 0;
  }
  else
  {
    v18 = v17;
    v23.receiver = self;
    v23.super_class = (Class)NENetworkAgentRegistrationFileHandle;
    v19 = -[NEFileHandle initWithFileDescriptor:launchOwnerWhenReadable:](&v23, sel_initWithFileDescriptor_launchOwnerWhenReadable_, v17, 1);
    p_isa = (id *)&v19->super.super.isa;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_sessionType, a4);
      objc_storeStrong(p_isa + 4, a5);
      objc_storeStrong(p_isa + 5, a6);
      objc_storeStrong(p_isa + 6, a7);
    }
    else
    {
      close(v18);
    }
    self = p_isa;
    v21 = self;
  }

  return v21;
}

- (NENetworkAgentRegistrationFileHandle)initWithNetworkAgentRegistration:(id)a3 sessionType:(id)a4 configurationIdentifier:(id)a5 agentUUID:(id)a6
{
  return -[NENetworkAgentRegistrationFileHandle initWithNetworkAgentRegistration:sessionType:configurationIdentifier:agentUUID:name:](self, "initWithNetworkAgentRegistration:sessionType:configurationIdentifier:agentUUID:name:", a3, a4, a5, a6, 0);
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t uint64;
  const uint8_t *uuid;
  const uint8_t *v8;
  const char *string;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NENetworkAgentRegistrationFileHandle;
  v5 = -[NEFileHandle initFromDictionary:](&v19, sel_initFromDictionary_, v4);
  if (v5)
  {
    uint64 = xpc_dictionary_get_uint64(v4, "session-type");
    uuid = xpc_dictionary_get_uuid(v4, "configuration-identifier");
    v8 = xpc_dictionary_get_uuid(v4, "agent-uuid");
    string = xpc_dictionary_get_string(v4, "agent-name");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", uint64);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v5[3];
    v5[3] = v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
    v13 = (void *)v5[4];
    v5[4] = v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v8);
    v15 = (void *)v5[5];
    v5[5] = v14;

    v5[7] = xpc_dictionary_get_uint64(v4, "agent-flags");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v5[6];
      v5[6] = v16;

    }
  }

  return v5;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;
  unsigned __int8 v11[8];
  uint64_t v12;
  unsigned __int8 uuid[8];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)uuid = 0;
  v14 = 0;
  *(_QWORD *)v11 = 0;
  v12 = 0;
  v10.receiver = self;
  v10.super_class = (Class)NENetworkAgentRegistrationFileHandle;
  -[NEFileHandle dictionary](&v10, sel_dictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NENetworkAgentRegistrationFileHandle sessionType](self, "sessionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v3, "session-type", objc_msgSend(v4, "unsignedLongLongValue"));

  -[NENetworkAgentRegistrationFileHandle configurationIdentifier](self, "configurationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getUUIDBytes:", uuid);

  xpc_dictionary_set_uuid(v3, "configuration-identifier", uuid);
  -[NENetworkAgentRegistrationFileHandle agentUUID](self, "agentUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getUUIDBytes:", v11);

  xpc_dictionary_set_uuid(v3, "agent-uuid", v11);
  xpc_dictionary_set_uint64(v3, "agent-flags", -[NENetworkAgentRegistrationFileHandle agentFlags](self, "agentFlags"));
  -[NENetworkAgentRegistrationFileHandle name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NENetworkAgentRegistrationFileHandle name](self, "name");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v3, "agent-name", (const char *)objc_msgSend(v8, "UTF8String"));

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NEFileHandle handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileDescriptor");
  -[NENetworkAgentRegistrationFileHandle configurationIdentifier](self, "configurationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NENetworkAgentRegistrationFileHandle agentUUID](self, "agentUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NENetworkAgentRegistrationFileHandle sessionType](self, "sessionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NENetworkAgentRegistrationFileHandle name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Network Agent Registration socket (%d) %@ %@ %@ %@ agent flags %#llx"), v5, v7, v9, v10, v11, -[NENetworkAgentRegistrationFileHandle agentFlags](self, "agentFlags"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)type
{
  return 2;
}

- (NSNumber)sessionType
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)configurationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)agentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)agentFlags
{
  return self->_agentFlags;
}

- (void)setAgentFlags:(unint64_t)a3
{
  self->_agentFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_agentUUID, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionType, 0);
}

@end
