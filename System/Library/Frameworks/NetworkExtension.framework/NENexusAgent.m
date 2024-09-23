@implementation NENexusAgent

- (id)copyAgentData
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _DWORD v14[7];

  v13 = 0u;
  memset(v14, 0, sizeof(v14));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v3 = 0u;
  v4 = 0u;
  if (!self)
  {
    DWORD1(v3) = 1;
    goto LABEL_5;
  }
  LODWORD(v3) = self->_frameType;
  DWORD1(v3) = 1;
  if ((_DWORD)v3 != 2)
  {
LABEL_5:
    *((_QWORD *)&v3 + 1) = 0x100000002;
    LODWORD(v4) = 3;
    goto LABEL_6;
  }
  DWORD2(v3) = 1;
  *((_QWORD *)&v7 + 1) = 0x100000002;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v3, 204);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isVoluntary
{
  return 0;
}

- (BOOL)isKernelActivated
{
  return 0;
}

- (BOOL)isUserActivated
{
  return 1;
}

- (BOOL)isSpecificUseOnly
{
  return 0;
}

- (BOOL)isNetworkProvider
{
  return 1;
}

- (BOOL)requestNexusWithOptions:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CCEC20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  v5 = -[NENexusAgent handleRequestNexusFromClient:](self, "handleRequestNexusFromClient:", v4);

  return v5;
}

- (void)closeNexusWithOptions:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CCEC20]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NENexusAgent closeFlowWithClientIdentifier:](self, "closeFlowWithClientIdentifier:", v4);

}

- (BOOL)startAgentWithOptions:(id)a3
{
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CCEC20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NENexusAgent handleStartFromClient:](self, "handleStartFromClient:", v4);

  return 1;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CCEC20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NENexusAgent handleAssertFromClient:](self, "handleAssertFromClient:", v4);

  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CCEC20]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (NENexusAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  -[NENexusAgent handleUnassertFromClient:](self, "handleUnassertFromClient:", v4);

}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)supportsBrowseRequests
{
  return self->supportsBrowseRequests;
}

- (void)setSupportsBrowseRequests:(BOOL)a3
{
  self->supportsBrowseRequests = a3;
}

- (BOOL)isNexusProvider
{
  return self->nexusProvider;
}

- (void)setNexusProvider:(BOOL)a3
{
  self->nexusProvider = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

+ (id)agentDomain
{
  return CFSTR("NENexus");
}

+ (id)agentType
{
  return CFSTR("Nexus");
}

+ (id)agentFromData:(id)a3
{
  id v3;
  NENexusAgent *v4;
  unsigned int *v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(NENexusAgent);
  if ((unint64_t)objc_msgSend(v3, "length") < 0xCC)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 134217984;
      v9 = objc_msgSend(v3, "length");
      _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "data.length is invalid (%lu)", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    v5 = (unsigned int *)objc_msgSend(v3, "bytes");
    if (v5 && v4)
      v4->_frameType = *v5;
  }

  return v4;
}

@end
