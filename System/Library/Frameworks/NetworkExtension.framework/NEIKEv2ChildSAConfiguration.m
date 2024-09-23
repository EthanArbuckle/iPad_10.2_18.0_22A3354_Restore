@implementation NEIKEv2ChildSAConfiguration

- (NEIKEv2ChildSAConfiguration)init
{
  NEIKEv2ChildSAConfiguration *v2;
  NEIKEv2ChildSAConfiguration *v3;
  NEIKEv2ChildSAConfiguration *v4;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2ChildSAConfiguration;
  v2 = -[NEIKEv2ChildSAConfiguration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NEIKEv2ChildSAConfiguration setReplayWindowSize:](v2, "setReplayWindowSize:", 4);
    v4 = v3;
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }

  }
  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  __CFString *ChildSAModeString;
  void *v9;
  void *v10;
  void *v11;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  ChildSAModeString = NEIKEv2CreateChildSAModeString(-[NEIKEv2ChildSAConfiguration mode](self, "mode"));
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", ChildSAModeString, CFSTR("Mode"), v5, a4);

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEIKEv2ChildSAConfiguration replayWindowSize](self, "replayWindowSize"), CFSTR("Replay Window Size"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2ChildSAConfiguration sequencePerTrafficClass](self, "sequencePerTrafficClass"), CFSTR("Sequence Per Traffic Class"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2ChildSAConfiguration preferInitiatorProposalOrder](self, "preferInitiatorProposalOrder"), CFSTR("Prefer Initiator Proposal Order"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2ChildSAConfiguration opportunisticPFS](self, "opportunisticPFS"), CFSTR("Opportunistic PFS"), v5, a4);
  -[NEIKEv2ChildSAConfiguration proposals](self, "proposals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("Proposals"), v5, a4);

  -[NEIKEv2ChildSAConfiguration localTrafficSelectors](self, "localTrafficSelectors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("Local Traffic Selectors"), v5, a4);

  -[NEIKEv2ChildSAConfiguration remoteTrafficSelectors](self, "remoteTrafficSelectors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("Remote Traffic Selectors"), v5, a4);

  return v7;
}

- (id)description
{
  return -[NEIKEv2ChildSAConfiguration descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMode:", -[NEIKEv2ChildSAConfiguration mode](self, "mode"));
  objc_msgSend(v4, "setReplayWindowSize:", -[NEIKEv2ChildSAConfiguration replayWindowSize](self, "replayWindowSize"));
  objc_msgSend(v4, "setSequencePerTrafficClass:", -[NEIKEv2ChildSAConfiguration sequencePerTrafficClass](self, "sequencePerTrafficClass"));
  objc_msgSend(v4, "setPreferInitiatorProposalOrder:", -[NEIKEv2ChildSAConfiguration preferInitiatorProposalOrder](self, "preferInitiatorProposalOrder"));
  -[NEIKEv2ChildSAConfiguration proposals](self, "proposals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2ChildSAConfiguration proposals](self, "proposals");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);
    objc_msgSend(v4, "setProposals:", v8);

  }
  -[NEIKEv2ChildSAConfiguration localTrafficSelectors](self, "localTrafficSelectors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2ChildSAConfiguration localTrafficSelectors](self, "localTrafficSelectors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArray:copyItems:", v11, 1);
    objc_msgSend(v4, "setLocalTrafficSelectors:", v12);

  }
  -[NEIKEv2ChildSAConfiguration remoteTrafficSelectors](self, "remoteTrafficSelectors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2ChildSAConfiguration remoteTrafficSelectors](self, "remoteTrafficSelectors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithArray:copyItems:", v15, 1);
    objc_msgSend(v4, "setRemoteTrafficSelectors:", v16);

  }
  return v4;
}

- (NSArray)proposals
{
  return self->_proposals;
}

- (void)setProposals:(id)a3
{
  NSArray *v4;
  NSArray *proposals;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)objc_msgSend(a3, "copy");
  proposals = self->_proposals;
  self->_proposals = v4;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_proposals;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        ++v9;
        if (v12)
          *(_BYTE *)(v12 + 8) = v9;
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unsigned)replayWindowSize
{
  return self->_replayWindowSize;
}

- (void)setReplayWindowSize:(unsigned int)a3
{
  self->_replayWindowSize = a3;
}

- (BOOL)sequencePerTrafficClass
{
  return self->_sequencePerTrafficClass;
}

- (void)setSequencePerTrafficClass:(BOOL)a3
{
  self->_sequencePerTrafficClass = a3;
}

- (BOOL)preferInitiatorProposalOrder
{
  return self->_preferInitiatorProposalOrder;
}

- (void)setPreferInitiatorProposalOrder:(BOOL)a3
{
  self->_preferInitiatorProposalOrder = a3;
}

- (BOOL)opportunisticPFS
{
  return self->_opportunisticPFS;
}

- (void)setOpportunisticPFS:(BOOL)a3
{
  self->_opportunisticPFS = a3;
}

- (NSArray)localTrafficSelectors
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalTrafficSelectors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)remoteTrafficSelectors
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRemoteTrafficSelectors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteTrafficSelectors, 0);
  objc_storeStrong((id *)&self->_localTrafficSelectors, 0);
  objc_storeStrong((id *)&self->_proposals, 0);
}

@end
