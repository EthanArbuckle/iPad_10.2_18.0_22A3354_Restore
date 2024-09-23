@implementation VCConnectionSelector

- (VCConnectionSelector)initWithMultiwayEnabled:(BOOL)a3
{
  VCConnectionSelector *v4;
  VCConnectionSelector *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCConnectionSelector;
  v4 = -[VCConnectionSelector init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isMultiwaySession = a3;
    v4->_linkPreferenceOrder = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v5->_canUseP2PLinks = 1;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCConnectionSelector;
  -[VCConnectionSelector dealloc](&v3, sel_dealloc);
}

- (void)updatePrimaryWithConnection:(id)a3
{
  VCConnectionProtocol *primaryConnection;
  void *v6;
  int IsEndToEndLink;

  if (self && (primaryConnection = self->_primaryConnection) != 0)
    v6 = (void *)CFRetain(primaryConnection);
  else
    v6 = 0;
  if ((VCConnection_IsOnSameInterfacesWithConnection((uint64_t)v6) & 1) == 0
    && objc_msgSend(v6, "compare:isPrimary:selectionPolicy:", -[VCConnectionSelector secondaryConnection](self, "secondaryConnection"), 0, &self->_connectionSelectionPolicy) == 1)
  {
    VCConnection_SetPriority((uint64_t)-[VCConnectionSelector secondaryConnection](self, "secondaryConnection"), -1);
    VCConnection_SetPriority((uint64_t)v6, 0);
    -[VCConnectionSelector setSecondaryConnection:](self, "setSecondaryConnection:", v6);
    if (!v6)
      goto LABEL_11;
    goto LABEL_10;
  }
  VCConnection_SetPriority((uint64_t)v6, -1);
  if (v6)
LABEL_10:
    CFRelease(v6);
LABEL_11:
  if (self->_isMultiwaySession)
  {
    if (-[VCConnectionSelector secondaryConnection](self, "secondaryConnection"))
    {
      IsEndToEndLink = VCConnection_IsEndToEndLink((uint64_t)a3);
      if (IsEndToEndLink != VCConnection_IsEndToEndLink((uint64_t)-[VCConnectionSelector secondaryConnection](self, "secondaryConnection")))-[VCConnectionSelector setSecondaryConnection:](self, "setSecondaryConnection:", 0);
    }
  }
  VCConnection_SetPriority((uint64_t)a3, 2);
  -[VCConnectionSelector useConnectionAsPrimary:](self, "useConnectionAsPrimary:", a3);
}

- (void)updateSecondaryWithConnection:(id)a3
{
  VCConnection_SetPriority((uint64_t)-[VCConnectionSelector secondaryConnection](self, "secondaryConnection"), -1);
  VCConnection_SetPriority((uint64_t)a3, 0);
  -[VCConnectionSelector setSecondaryConnection:](self, "setSecondaryConnection:", a3);
}

- (BOOL)selectPrimaryAndSecondaryWithConnection:(id)a3 isEndToEnd:(BOOL)a4
{
  VCConnectionProtocol *primaryConnection;
  CFTypeRef v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  const char *v12;
  uint64_t v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self && (primaryConnection = self->_primaryConnection) != 0)
  {
    v8 = CFRetain(primaryConnection);
    if (a4)
      goto LABEL_10;
  }
  else
  {
    v8 = 0;
    if (a4)
      goto LABEL_10;
  }
  if (-[VCConnectionSelector isPrimaryConnectionSameAsConnection:](self, "isPrimaryConnectionSameAsConnection:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v11 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v15 = 136315650;
      v16 = v9;
      v17 = 2080;
      v18 = "-[VCConnectionSelector selectPrimaryAndSecondaryWithConnection:isEndToEnd:]";
      v19 = 1024;
      v20 = 209;
      v12 = " [%s] %s:%d HandoverReport: Get the same connection for multiway. Keep using the old connection";
LABEL_16:
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 0x1Cu);
    }
LABEL_17:
    v11 = 0;
    goto LABEL_21;
  }
LABEL_10:
  if (objc_msgSend(a3, "compare:isPrimary:selectionPolicy:", v8, 1, &self->_connectionSelectionPolicy) == 1)
  {
    -[VCConnectionSelector updatePrimaryWithConnection:](self, "updatePrimaryWithConnection:", a3);
    goto LABEL_20;
  }
  if (VCConnection_IsOnSameInterfacesWithConnection((uint64_t)v8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v11 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v15 = 136315650;
      v16 = v13;
      v17 = 2080;
      v18 = "-[VCConnectionSelector selectPrimaryAndSecondaryWithConnection:isEndToEnd:]";
      v19 = 1024;
      v20 = 215;
      v12 = " [%s] %s:%d HandoverReport: a new connection is added with the same interface combo as the primary connectio"
            "n. Prevent selecting it as secondary connection.";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v11 = 0;
  if (objc_msgSend(a3, "compare:isPrimary:selectionPolicy:", -[VCConnectionSelector secondaryConnection](self, "secondaryConnection"), 0, &self->_connectionSelectionPolicy) != 1)goto LABEL_21;
  -[VCConnectionSelector updateSecondaryWithConnection:](self, "updateSecondaryWithConnection:", a3);
LABEL_20:
  v11 = 1;
LABEL_21:
  if (v8)
    CFRelease(v8);
  return v11;
}

- (void)useConnectionAsPrimary:(id)a3
{
  VCConnectionSelector_SetPrimaryConnection((uint64_t)self, a3);
  -[VCConnectionSelector setLastPrimaryConnectionInUse:](self, "setLastPrimaryConnectionInUse:", a3);
}

- ($85B13D066EE34EC5DDC86B20300AB7FA)getConnectionSelectionPolicy
{
  return ($85B13D066EE34EC5DDC86B20300AB7FA *)&self->_connectionSelectionPolicy;
}

- (void)updateConnectionSelectionPolicyWithPreferRelayOverP2P:(BOOL)a3 preferNonVPN:(BOOL)a4 preferE2E:(BOOL)a5
{
  uint64_t v6;
  NSObject *v7;
  _BOOL4 preferRelayOverP2P;
  _BOOL4 preferIPv6OverIPv4;
  _BOOL4 preferNonVPN;
  _BOOL4 e2eCriteriaEnabled;
  _BOOL4 preferE2E;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  self->_connectionSelectionPolicy.preferRelayOverP2P = a3;
  self->_connectionSelectionPolicy.preferIPv6OverIPv4 = 0;
  self->_connectionSelectionPolicy.preferNonVPN = a4;
  self->_connectionSelectionPolicy.e2eCriteriaEnabled = self->_isMultiwaySession;
  self->_connectionSelectionPolicy.preferE2E = a5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      preferRelayOverP2P = self->_connectionSelectionPolicy.preferRelayOverP2P;
      preferIPv6OverIPv4 = self->_connectionSelectionPolicy.preferIPv6OverIPv4;
      preferNonVPN = self->_connectionSelectionPolicy.preferNonVPN;
      e2eCriteriaEnabled = self->_connectionSelectionPolicy.e2eCriteriaEnabled;
      preferE2E = self->_connectionSelectionPolicy.preferE2E;
      v13 = 136316930;
      v14 = v6;
      v15 = 2080;
      v16 = "-[VCConnectionSelector updateConnectionSelectionPolicyWithPreferRelayOverP2P:preferNonVPN:preferE2E:]";
      v17 = 1024;
      v18 = 243;
      v19 = 1024;
      v20 = preferRelayOverP2P;
      v21 = 1024;
      v22 = preferIPv6OverIPv4;
      v23 = 1024;
      v24 = preferNonVPN;
      v25 = 1024;
      v26 = e2eCriteriaEnabled;
      v27 = 1024;
      v28 = preferE2E;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ConnectionSelectionPolicy updated: preferRelayOverP2P[%d] preferIPv6OverIPv4[%d] preferNonVPN[%d] e2eCriteriaEnabled[%d] preferE2E[%d]", (uint8_t *)&v13, 0x3Au);
    }
  }
}

- (void)updateConnectionSelectionPolicy:(id *)a3
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 preferRelayOverP2P;
  _BOOL4 preferIPv6OverIPv4;
  _BOOL4 preferNonVPN;
  _BOOL4 e2eCriteriaEnabled;
  _BOOL4 preferE2E;
  _BOOL4 preferWired;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    self->_connectionSelectionPolicy = ($8E6C8695571AE95F6D1A2FB9CBF78DE5)*a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        preferRelayOverP2P = self->_connectionSelectionPolicy.preferRelayOverP2P;
        preferIPv6OverIPv4 = self->_connectionSelectionPolicy.preferIPv6OverIPv4;
        preferNonVPN = self->_connectionSelectionPolicy.preferNonVPN;
        e2eCriteriaEnabled = self->_connectionSelectionPolicy.e2eCriteriaEnabled;
        preferE2E = self->_connectionSelectionPolicy.preferE2E;
        preferWired = self->_connectionSelectionPolicy.preferWired;
        v18 = 136317186;
        v19 = v4;
        v20 = 2080;
        v21 = "-[VCConnectionSelector updateConnectionSelectionPolicy:]";
        v22 = 1024;
        v23 = 256;
        v24 = 1024;
        v25 = preferRelayOverP2P;
        v26 = 1024;
        v27 = preferIPv6OverIPv4;
        v28 = 1024;
        v29 = preferNonVPN;
        v30 = 1024;
        v31 = e2eCriteriaEnabled;
        v32 = 1024;
        v33 = preferE2E;
        v34 = 1024;
        v35 = preferWired;
        v12 = " [%s] %s:%d ConnectionSelectionPolicy updated: preferRelayOverP2P=%d preferIPv6OverIPv4=%d preferNonVPN=%d"
              " e2eCriteriaEnabled=%d preferE2E=%d preferWired=%d";
        v13 = v5;
        v14 = 64;
LABEL_5:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, v14);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    v17 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315650;
        v19 = v15;
        v20 = 2080;
        v21 = "-[VCConnectionSelector updateConnectionSelectionPolicy:]";
        v22 = 1024;
        v23 = 247;
        v12 = " [%s] %s:%d new connection selection policy is nil";
        v13 = v16;
        v14 = 28;
        goto LABEL_5;
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[VCConnectionSelector updateConnectionSelectionPolicy:].cold.1();
    }
  }
}

- (void)updateSelectedConnectionsForGroupType:(unsigned __int8)a3 connectionAdded:(id)a4
{
  int v5;
  uint64_t v6;
  id *v7;
  $8E6C8695571AE95F6D1A2FB9CBF78DE5 *p_connectionSelectionPolicy;
  uint64_t v9;
  NSObject *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v5 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = 48;
  if (!a3)
    v6 = 32;
  v7 = (id *)((char *)&self->super.isa + v6);
  p_connectionSelectionPolicy = &self->_connectionSelectionPolicy;
  if (objc_msgSend(a4, "compare:isPrimary:selectionPolicy:", *(Class *)((char *)&self->super.isa + v6), 1, &self->_connectionSelectionPolicy) == 1)
  {
    if (objc_msgSend(*v7, "compare:isPrimary:selectionPolicy:", v7[1], 0, p_connectionSelectionPolicy) == 1)
    {

      v7[1] = *v7;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v11 = v7[1];
          if (v11)
            v12 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
          else
            v12 = "<nil>";
          v20 = 136316162;
          v21 = v9;
          v22 = 2080;
          v23 = "-[VCConnectionSelector updateSelectedConnectionsForGroupType:connectionAdded:]";
          v24 = 1024;
          v25 = 272;
          v26 = 2080;
          v27 = v12;
          v28 = 1024;
          v29 = v5;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Updated secondary connection to: %s for group: %d", (uint8_t *)&v20, 0x2Cu);
        }
      }
    }

    *v7 = a4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (*v7)
          v18 = (const char *)objc_msgSend((id)objc_msgSend(*v7, "description"), "UTF8String");
        else
          v18 = "<nil>";
        v20 = 136316162;
        v21 = v17;
        v22 = 2080;
        v23 = "-[VCConnectionSelector updateSelectedConnectionsForGroupType:connectionAdded:]";
        v24 = 1024;
        v25 = 276;
        v26 = 2080;
        v27 = v18;
        v28 = 1024;
        v29 = v5;
        v19 = " [%s] %s:%d HandoverReport: Updated primary connection to: %s for group: %d";
LABEL_24:
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v20, 0x2Cu);
      }
    }
  }
  else if (objc_msgSend(a4, "compare:isPrimary:selectionPolicy:", v7[1], 0, p_connectionSelectionPolicy) == 1)
  {

    v7[1] = a4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = v7[1];
        if (v15)
          v16 = (const char *)objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String");
        else
          v16 = "<nil>";
        v20 = 136316162;
        v21 = v13;
        v22 = 2080;
        v23 = "-[VCConnectionSelector updateSelectedConnectionsForGroupType:connectionAdded:]";
        v24 = 1024;
        v25 = 281;
        v26 = 2080;
        v27 = v16;
        v28 = 1024;
        v29 = v5;
        v19 = " [%s] %s:%d HandoverReport: Updated secondary connection to: %s for group: %d";
        goto LABEL_24;
      }
    }
  }
}

- (void)updateSelectedConnectionsForGroupType:(unsigned __int8)a3 connectionRemoved:(id)a4 connectionArray:(id)a5
{
  uint64_t v7;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  const char *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v7 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = 48;
  if (!a3)
    v9 = 32;
  v10 = (id *)((char *)&self->super.isa + v9);
  if (VCConnection_Equal((uint64_t)a4, *(uint64_t *)((char *)&self->super.isa + v9)))
  {

    *v10 = 0;
    -[VCConnectionSelector selectConnectionForGroupType:fromConnectionArray:asPrimary:](self, "selectConnectionForGroupType:fromConnectionArray:asPrimary:", v7, a5, 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (*v10)
          v13 = (const char *)objc_msgSend((id)objc_msgSend(*v10, "description"), "UTF8String");
        else
          v13 = "<nil>";
        v18 = 136316162;
        v19 = v11;
        v20 = 2080;
        v21 = "-[VCConnectionSelector updateSelectedConnectionsForGroupType:connectionRemoved:connectionArray:]";
        v22 = 1024;
        v23 = 292;
        v24 = 2080;
        v25 = v13;
        v26 = 1024;
        v27 = v7;
        v17 = " [%s] %s:%d HandoverReport: Updated primary connection to: %s for group: %d";
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v18, 0x2Cu);
      }
    }
  }
  else if (VCConnection_Equal((uint64_t)a4, (uint64_t)v10[1]))
  {

    v10[1] = 0;
    -[VCConnectionSelector selectConnectionForGroupType:fromConnectionArray:asPrimary:](self, "selectConnectionForGroupType:fromConnectionArray:asPrimary:", v7, a5, 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = v10[1];
        if (v15)
          v16 = (const char *)objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String");
        else
          v16 = "<nil>";
        v18 = 136316162;
        v19 = v14;
        v20 = 2080;
        v21 = "-[VCConnectionSelector updateSelectedConnectionsForGroupType:connectionRemoved:connectionArray:]";
        v22 = 1024;
        v23 = 297;
        v24 = 2080;
        v25 = v16;
        v26 = 1024;
        v27 = v7;
        v17 = " [%s] %s:%d HandoverReport: Updated secondary connection to: %s for group: %d";
        goto LABEL_17;
      }
    }
  }
}

- (void)selectConnectionForGroupType:(unsigned __int8)a3 fromConnectionArray:(id)a4 asPrimary:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  void **v9;
  void **v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  $8E6C8695571AE95F6D1A2FB9CBF78DE5 *p_connectionSelectionPolicy;
  uint64_t i;
  void *v17;
  void *v18;
  void **v19;
  void **v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = 48;
  if (!a3)
    v8 = 32;
  v9 = (void **)((char *)&self->super.isa + v8);
  v10 = (void **)((char *)&self->_primaryConnection + v8);
  v20 = v10;
  if (a5)
    v10 = v9;
  v11 = *v10;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    p_connectionSelectionPolicy = &self->_connectionSelectionPolicy;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(a4);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((VCConnection_IsEndToEndLink((uint64_t)v17) & 1) == 0
          && objc_msgSend(v17, "compare:isPrimary:selectionPolicy:", v11, v5, p_connectionSelectionPolicy) == 1)
        {
          v18 = *v9;
          if (v5)
          {
            v19 = v9;
          }
          else
          {
            if ((VCConnection_IsOnSameInterfacesWithConnection((uint64_t)v17) & 1) != 0)
              continue;
            v19 = v20;
            v18 = *v20;
          }

          *v19 = v17;
        }
      }
      v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v13);
  }
}

- (id)connectionForGroupType:(unsigned __int8)a3 isPrimary:(BOOL)a4
{
  uint64_t v4;
  id *v5;

  v4 = 48;
  if (!a3)
    v4 = 32;
  v5 = (id *)((char *)&self->super.isa + v4);
  if (!a4)
    ++v5;
  return *v5;
}

- (BOOL)isPrimaryConnectionSameAsConnection:(id)a3
{
  VCConnectionProtocol *primaryConnection;
  CFTypeRef v5;
  const void *v6;
  int IsEndToEndLink;
  int IsLocalOnWiFiOrWired;
  int IsRemoteOnWiFiOrWired;
  int IsLocalOnWired;
  int IsRemoteOnWired;
  int IsRelay;
  int IsIPv6;
  int v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_20;
    v20 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    v21 = *MEMORY[0x1E0CF2758];
    if (!*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[VCConnectionSelector isPrimaryConnectionSameAsConnection:].cold.1();
      goto LABEL_20;
    }
    LOBYTE(v14) = 0;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      return v14;
    v22 = 136315650;
    v23 = v20;
    v24 = 2080;
    v25 = "-[VCConnectionSelector isPrimaryConnectionSameAsConnection:]";
    v26 = 1024;
    v27 = 332;
    v18 = " [%s] %s:%d new connection is nil";
    goto LABEL_17;
  }
  if (!self || (primaryConnection = self->_primaryConnection) == 0 || (v5 = CFRetain(primaryConnection)) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
    {
LABEL_20:
      LOBYTE(v14) = 0;
      return v14;
    }
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    v17 = *MEMORY[0x1E0CF2758];
    if (!*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[VCConnectionSelector isPrimaryConnectionSameAsConnection:].cold.2();
      goto LABEL_20;
    }
    LOBYTE(v14) = 0;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      return v14;
    v22 = 136315650;
    v23 = v15;
    v24 = 2080;
    v25 = "-[VCConnectionSelector isPrimaryConnectionSameAsConnection:]";
    v26 = 1024;
    v27 = 334;
    v18 = " [%s] %s:%d current connection is nil";
LABEL_17:
    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 0x1Cu);
    goto LABEL_20;
  }
  v6 = v5;
  IsEndToEndLink = VCConnection_IsEndToEndLink((uint64_t)v5);
  if (IsEndToEndLink == VCConnection_IsEndToEndLink((uint64_t)a3)
    && (IsLocalOnWiFiOrWired = VCConnection_IsLocalOnWiFiOrWired((uint64_t)v6),
        IsLocalOnWiFiOrWired == VCConnection_IsLocalOnWiFiOrWired((uint64_t)a3))
    && (IsRemoteOnWiFiOrWired = VCConnection_IsRemoteOnWiFiOrWired((uint64_t)v6),
        IsRemoteOnWiFiOrWired == VCConnection_IsRemoteOnWiFiOrWired((uint64_t)a3))
    && (IsLocalOnWired = VCConnection_IsLocalOnWired((uint64_t)v6),
        IsLocalOnWired == VCConnection_IsLocalOnWired((uint64_t)a3))
    && (IsRemoteOnWired = VCConnection_IsRemoteOnWired((uint64_t)v6),
        IsRemoteOnWired == VCConnection_IsRemoteOnWired((uint64_t)a3))
    && (IsRelay = VCConnection_IsRelay((uint64_t)v6), IsRelay == VCConnection_IsRelay((uint64_t)a3)))
  {
    IsIPv6 = VCConnection_IsIPv6((uint64_t)v6);
    v14 = IsIPv6 ^ VCConnection_IsIPv6((uint64_t)a3) ^ 1;
  }
  else
  {
    LOBYTE(v14) = 0;
  }
  CFRelease(v6);
  return v14;
}

- (VCConnectionProtocol)secondaryConnection
{
  return self->_secondaryConnection;
}

- (void)setSecondaryConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (VCConnectionProtocol)connectionForDuplication
{
  return self->_connectionForDuplication;
}

- (void)setConnectionForDuplication:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (VCConnectionProtocol)connectionForDuplicationNonProbingVersion
{
  return self->_connectionForDuplicationNonProbingVersion;
}

- (void)setConnectionForDuplicationNonProbingVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (VCConnectionProtocol)lastPrimaryConnectionInUse
{
  return self->_lastPrimaryConnectionInUse;
}

- (void)setLastPrimaryConnectionInUse:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSArray)linkPreferenceOrder
{
  return self->_linkPreferenceOrder;
}

- (void)setLinkPreferenceOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- ($B1DFBE6DA67F006F3F56FF26010DA9BB)serverLinks
{
  void *v2;
  void *v3;
  _QWORD dest[3];
  $B1DFBE6DA67F006F3F56FF26010DA9BB result;

  dest[2] = *MEMORY[0x1E0C80C00];
  objc_copyStruct(dest, &self->_serverLinks, 16, 1, 0);
  v2 = (void *)dest[0];
  v3 = (void *)dest[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)canUseP2PLinks
{
  return self->_canUseP2PLinks;
}

- (void)setCanUseP2PLinks:(BOOL)a3
{
  self->_canUseP2PLinks = a3;
}

- (void)updateConnectionSelectionPolicy:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d new connection selection policy is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isPrimaryConnectionSameAsConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d new connection is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isPrimaryConnectionSameAsConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d current connection is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
