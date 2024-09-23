@implementation VCConnectionManagerLegacy

- (void)setUpVTable
{
  self->super._vTable.copyConnection = _VCConnectionManagerLegacy_CopyConnection;
  self->super._vTable.updateConnectionForDuplication = _VCConnectionManagerLegacy_UpdateConnectionForDuplication;
  self->super._vTable.synchronizeParticipantGenerationCounter = _VCConnectionManagerLegacy_SynchronizeParticipantGenerationCounter;
  self->super._vTable.isSourceOnCellularIPv6 = _VCConnectionManagerLegacy_IsSourceOnCellularIPv6;
  self->super._vTable.copyPrimaryConnection = _VCConnectionManagerLegacy_CopyPrimaryConnection;
  self->super._vTable.setPrimaryConnection = _VCConnectionManagerLegacy_SetPrimaryConnection;
  self->super._vTable.updatePacketAndByteCount = _VCConnectionManagerLegacy_UpdatePacketAndByteCount;
  self->super._vTable.updatePersistentPacketCounts = _VCConnectionManagerLegacy_UpdatePersistentPacketCounts;
  self->super._vTable.addLinkProbingTelemetry = _VCConnectionManagerIDS_AddLinkProbingTelemetry;
}

- (VCConnectionManagerLegacy)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCConnectionManagerLegacy;
  return -[VCConnectionManager init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCConnectionManagerLegacy;
  -[VCConnectionManager dealloc](&v3, sel_dealloc);
}

- (int)shouldNominateCandidatePair:(tagCANDIDATEPAIR *)a3 interfaceMask:(int)a4 nominated:(int *)a5 demote:(int *)a6 connectionPriority:(int *)a7 replaceOnly:(int *)a8
{
  uint64_t v12;
  _opaque_pthread_rwlock_t *p_stateRWlock;

  v12 = *(_QWORD *)&a4;
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  LODWORD(a8) = -[VCConnectionManagerLegacy shouldNominateCandidatePairInternal:interfaceMask:nominated:demote:connectionPriority:replaceOnly:](self, "shouldNominateCandidatePairInternal:interfaceMask:nominated:demote:connectionPriority:replaceOnly:", a3, v12, a5, a6, a7, a8);
  pthread_rwlock_unlock(p_stateRWlock);
  return (int)a8;
}

- (int)shouldNominateCandidatePairInternal:(tagCANDIDATEPAIR *)a3 interfaceMask:(int)a4 nominated:(int *)a5 demote:(int *)a6 connectionPriority:(int *)a7 replaceOnly:(int *)a8
{
  uint64_t v12;
  VCConnectionLegacy *v14;
  int v15;
  _BOOL8 v16;
  int v17;
  int ErrorLogLevelForModule;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  int v25;
  int v26;
  const char *v27;
  int v28;
  const char *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  _BYTE v41[24];
  __int128 v42;
  const char *v43;
  _BYTE v44[24];
  uint64_t v45;

  v12 = *(_QWORD *)&a4;
  v45 = *MEMORY[0x1E0C80C00];
  *a5 = 0;
  v14 = -[VCConnectionLegacy initWithCandidatePair:]([VCConnectionLegacy alloc], "initWithCandidatePair:", a3);
  v15 = 0;
  if (-[VCConnectionManagerLegacy shouldNominateConnection:](self, "shouldNominateConnection:", v14))
  {
    v16 = -[VCConnectionManager isBetterConnection:asPrimary:](self, "isBetterConnection:asPrimary:", v14, 1);
    if (v16)
      goto LABEL_6;
    -[VCConnectionManagerLegacy getPrimaryConnectionToBeCompared](self, "getPrimaryConnectionToBeCompared");
    if ((VCConnection_IsOnSameInterfacesWithConnection((uint64_t)v14) & 1) != 0)
    {
      v15 = 0;
      goto LABEL_7;
    }
    v15 = 0;
    if (-[VCConnectionManager isBetterConnection:asPrimary:](self, "isBetterConnection:asPrimary:", v14, 0))
    {
LABEL_6:
      *a5 = 1;
      v15 = -[VCConnectionManagerLegacy nominateConnection:asPrimary:interfaceMask:demote:connectionPriority:replaceOnly:](self, "nominateConnection:asPrimary:interfaceMask:demote:connectionPriority:replaceOnly:", v14, v16, v12, a6, a7, a8);
      if (v15 < 0)
        goto LABEL_44;
    }
  }
LABEL_7:
  v17 = *a5;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v17)
  {
    if (ErrorLogLevelForModule < 7)
      goto LABEL_27;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    if (v14)
      v21 = -[NSString UTF8String](-[VCConnectionLegacy description](v14, "description"), "UTF8String");
    else
      v21 = "<nil>";
    v25 = *a7;
    v26 = *a6;
    if ((*a7 & 0xFFFFFFFD) == 1)
      v27 = "OPTIMAL";
    else
      v27 = "";
    v28 = *a8;
    *(_DWORD *)v41 = 136316930;
    *(_QWORD *)&v41[4] = v19;
    if (v25 <= 1)
      v29 = "SECONDARY";
    else
      v29 = "PRIMARY";
    *(_WORD *)&v41[12] = 2080;
    *(_QWORD *)&v41[14] = "-[VCConnectionManagerLegacy shouldNominateCandidatePairInternal:interfaceMask:nominated:demote"
                          ":connectionPriority:replaceOnly:]";
    *(_WORD *)&v41[22] = 1024;
    LODWORD(v42) = 112;
    WORD2(v42) = 2080;
    *(_QWORD *)((char *)&v42 + 6) = v21;
    HIWORD(v42) = 2080;
    v43 = v27;
    *(_WORD *)v44 = 2080;
    *(_QWORD *)&v44[2] = v29;
    *(_WORD *)&v44[10] = 1024;
    *(_DWORD *)&v44[12] = v26;
    *(_WORD *)&v44[16] = 1024;
    *(_DWORD *)&v44[18] = v28;
    v30 = " [%s] %s:%d HandoverReport: DID nominate connection %s as %s %s connection. Demote current: %d, replace current: %d";
    v31 = v20;
    v32 = 70;
  }
  else
  {
    if (ErrorLogLevelForModule < 7)
      goto LABEL_27;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    if (v14)
      v24 = -[NSString UTF8String](-[VCConnectionLegacy description](v14, "description"), "UTF8String");
    else
      v24 = "<nil>";
    *(_DWORD *)v41 = 136315906;
    *(_QWORD *)&v41[4] = v22;
    *(_WORD *)&v41[12] = 2080;
    *(_QWORD *)&v41[14] = "-[VCConnectionManagerLegacy shouldNominateCandidatePairInternal:interfaceMask:nominated:demote"
                          ":connectionPriority:replaceOnly:]";
    *(_WORD *)&v41[22] = 1024;
    LODWORD(v42) = 114;
    WORD2(v42) = 2080;
    *(_QWORD *)((char *)&v42 + 6) = v24;
    v30 = " [%s] %s:%d HandoverReport: DID NOT nominate connection %s";
    v31 = v23;
    v32 = 38;
  }
  _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, v30, v41, v32);
LABEL_27:
  v33 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v33)
        v36 = (const char *)objc_msgSend((id)objc_msgSend(v33, "description"), "UTF8String");
      else
        v36 = "<nil>";
      if (-[VCConnectionManager secondaryConnection](self, "secondaryConnection", *(_OWORD *)v41, *(_QWORD *)&v41[16], v42, v43, *(_OWORD *)v44, *(_QWORD *)&v44[16], v45))
      {
        v37 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](-[VCConnectionManager secondaryConnection](self, "secondaryConnection"), "description"), "UTF8String");
      }
      else
      {
        v37 = "<nil>";
      }
      if (-[VCConnectionManagerLegacy pendingPrimaryConnection](self, "pendingPrimaryConnection"))
        v38 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](-[VCConnectionManagerLegacy pendingPrimaryConnection](self, "pendingPrimaryConnection"), "description"), "UTF8String");
      else
        v38 = "<nil>";
      if (-[VCConnectionManagerLegacy pendingSecondaryConnection](self, "pendingSecondaryConnection"))
        v39 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](-[VCConnectionManagerLegacy pendingSecondaryConnection](self, "pendingSecondaryConnection"), "description"), "UTF8String");
      else
        v39 = "<nil>";
      *(_DWORD *)v41 = 136316674;
      *(_QWORD *)&v41[4] = v34;
      *(_WORD *)&v41[12] = 2080;
      *(_QWORD *)&v41[14] = "-[VCConnectionManagerLegacy shouldNominateCandidatePairInternal:interfaceMask:nominated:demo"
                            "te:connectionPriority:replaceOnly:]";
      *(_WORD *)&v41[22] = 1024;
      LODWORD(v42) = 122;
      WORD2(v42) = 2080;
      *(_QWORD *)((char *)&v42 + 6) = v36;
      HIWORD(v42) = 2080;
      v43 = v37;
      *(_WORD *)v44 = 2080;
      *(_QWORD *)&v44[2] = v38;
      *(_WORD *)&v44[10] = 2080;
      *(_QWORD *)&v44[12] = v39;
      _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Finished nominating a candidate pair. Primary %s; Secondary: %s; Pending primary: %s"
        "; Pending secondary %s",
        v41,
        0x44u);
    }
  }
  if (v33)
    CFRelease(v33);
LABEL_44:

  return v15;
}

- (int)addConnection:(id)a3
{
  id v3;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  _BOOL4 isInitialConnectionEstablished;
  VCConnectionProtocol *v7;
  VCConnectionProtocol *v8;
  int v9;
  int v10;
  VCConnectionProtocol *v11;
  uint64_t v12;
  const void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  VCConnectionProtocol *v17;
  uint64_t v18;
  NSObject *v19;
  VCConnectionProtocol *v20;
  VCConnectionProtocol *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  int v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  int NumberOfConnectionsInternal;
  const void *v40;
  int IsLocalOnCellular;
  NSObject *delegateQueue;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  _BOOL4 v48;
  uint64_t v49;
  _QWORD block[6];
  BOOL v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  const char *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    p_stateRWlock = &self->super._stateRWlock;
    pthread_rwlock_wrlock(&self->super._stateRWlock);
    isInitialConnectionEstablished = self->super._isInitialConnectionEstablished;
    if (*(_DWORD *)(objc_msgSend(v3, "connectionResult") + 296))
    {
      v7 = -[VCConnectionManagerLegacy pendingPrimaryConnection](self, "pendingPrimaryConnection");
      if (!v7)
      {
        v9 = 3;
LABEL_16:
        VCConnection_SetPriority((uint64_t)v3, v9);
        -[VCConnectionManagerLegacy setPendingPrimaryConnection:](self, "setPendingPrimaryConnection:", 0);
        v17 = -[VCConnectionManager lastPrimaryConnectionInUse](self, "lastPrimaryConnectionInUse");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v53 = v18;
            v54 = 2080;
            v55 = "-[VCConnectionManagerLegacy addConnection:]";
            v56 = 1024;
            v57 = 160;
            v58 = 2080;
            v59 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
            _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: set a PRIMARY connection %s", buf, 0x26u);
          }
        }
        -[VCConnectionManager useConnectionAsPrimary:](self, "useConnectionAsPrimary:", v3);
        -[NSMutableArray addObject:](self->super._connectionArray, "addObject:", v3);
        if (v17)
        {
          v20 = -[VCConnectionManagerLegacy pendingSecondaryConnection](self, "pendingSecondaryConnection");
          if (v20)
          {
            v21 = v20;
            if ((-[VCConnectionProtocol waitToBeNominated](v20, "waitToBeNominated") & 1) == 0)
            {
              -[VCConnectionManager setSecondaryConnection:](self, "setSecondaryConnection:", v21);
              -[VCConnectionManagerLegacy setPendingSecondaryConnection:](self, "setPendingSecondaryConnection:", 0);
            }
          }
        }
        goto LABEL_42;
      }
      v8 = v7;
      if (VCConnection_Equal((uint64_t)v3, (uint64_t)v7))
      {
        v9 = VCConnection_Priority((uint64_t)v8);
        goto LABEL_16;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v53 = v22;
          v54 = 2080;
          v55 = "-[VCConnectionManagerLegacy addConnection:]";
          v56 = 1024;
          v57 = 174;
          v58 = 2080;
          v59 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
          v60 = 2080;
          v61 = objc_msgSend((id)-[VCConnectionProtocol description](v8, "description"), "UTF8String");
          v24 = " [%s] %s:%d HandoverReport: new connection %s is not the pending primary %s";
LABEL_36:
          _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x30u);
        }
      }
    }
    else
    {
      v11 = -[VCConnectionManagerLegacy pendingSecondaryConnection](self, "pendingSecondaryConnection");
      if (VCConnection_Equal((uint64_t)v3, (uint64_t)v11))
      {
        v12 = VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
        if (v12)
        {
          v13 = (const void *)v12;
          v14 = VCConnection_Priority((uint64_t)v11);
          VCConnection_SetPriority((uint64_t)v3, v14);
          -[VCConnectionManagerLegacy setPendingSecondaryConnection:](self, "setPendingSecondaryConnection:", 0);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v53 = v15;
              v54 = 2080;
              v55 = "-[VCConnectionManagerLegacy addConnection:]";
              v56 = 1024;
              v57 = 204;
              v58 = 2080;
              v59 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
              _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: set a SECONDARY connection %s", buf, 0x26u);
            }
          }
          -[VCConnectionManager setSecondaryConnection:](self, "setSecondaryConnection:", v3);
          CFRelease(v13);
        }
        else
        {
          objc_msgSend(v3, "setWaitToBeNominated:", 0);
          -[VCConnectionManagerLegacy setPendingSecondaryConnection:](self, "setPendingSecondaryConnection:", v3);
          v3 = (id)objc_msgSend(v3, "copy");
          VCConnection_SetPriority((uint64_t)v3, 2);
          *(_DWORD *)(objc_msgSend(v3, "connectionResult") + 296) = 0;
          -[VCConnectionManager useConnectionAsPrimary:](self, "useConnectionAsPrimary:", v3);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v28 = VRTraceErrorLogLevelToCSTR();
            v29 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              if (v3)
                v30 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
              else
                v30 = "<nil>";
              *(_DWORD *)buf = 136315906;
              v53 = v28;
              v54 = 2080;
              v55 = "-[VCConnectionManagerLegacy addConnection:]";
              v56 = 1024;
              v57 = 196;
              v58 = 2080;
              v59 = (uint64_t)v30;
              _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Secondary nomination response comes back first. Use connection %s as a temporary primary", buf, 0x26u);
            }
          }

        }
        -[NSMutableArray addObject:](self->super._connectionArray, "addObject:", v3);
        v17 = 0;
LABEL_42:
        v31 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
        v32 = VCConnection_Priority((uint64_t)v3);
        if ((int)VRTraceGetErrorLogLevelForModule() < 6
          || (v49 = VRTraceErrorLogLevelToCSTR(),
              v33 = *MEMORY[0x1E0CF2758],
              !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
        {
LABEL_64:
          if (v31)
            CFRelease(v31);
          NumberOfConnectionsInternal = VCConnectionManager_GetNumberOfConnectionsInternal((uint64_t (**)(void))self);
          VTP_SetAFRCConnectionNumber(NumberOfConnectionsInternal);
          v40 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
          -[VCConnectionManager checkpointPrimaryConnection:](self, "checkpointPrimaryConnection:", v40);
          if (v17)
          {
            -[VCConnectionManager primaryConnectionChanged:oldPrimaryConnection:](self, "primaryConnectionChanged:oldPrimaryConnection:", v40, v17);
          }
          else if (v32 == 2)
          {
            IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)v3);
            VCConnectionManager_UseCellPrimaryInterface((uint64_t)self, IsLocalOnCellular);
          }
          if (v40)
            CFRelease(v40);
          delegateQueue = self->super._delegateQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __43__VCConnectionManagerLegacy_addConnection___block_invoke;
          block[3] = &unk_1E9E52210;
          block[4] = self;
          block[5] = v3;
          v51 = !isInitialConnectionEstablished;
          dispatch_async(delegateQueue, block);
          if (!self->super._isInitialConnectionEstablished)
            self->super._isInitialConnectionEstablished = 1;
          if (self->super._duplicationPending
            && (int)VCConnectionManager_GetNumberOfConnectionsInternal((uint64_t (**)(void))self) >= 2)
          {
            VCConnectionManager_SetDuplicationEnabledInternal((uint64_t)self, 1);
          }

          -[VCConnectionManagerLegacy reportConnection:isInitialConnection:](self, "reportConnection:isInitialConnection:", v3, !isInitialConnectionEstablished);
          -[VCConnectionManager reportConnectionUpdateWithRespCode:](self, "reportConnectionUpdateWithRespCode:", 0);
          pthread_rwlock_unlock(p_stateRWlock);
          return 0;
        }
        if ((v32 & 0xFFFFFFFD) == 1)
          v34 = "OPTIMAL";
        else
          v34 = "";
        v35 = "SECONDARY";
        if (v32 > 1)
          v35 = "PRIMARY";
        v46 = v35;
        v47 = v34;
        if (v3)
        {
          v45 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
          if (v31)
          {
LABEL_51:
            v44 = (const char *)objc_msgSend((id)objc_msgSend(v31, "description"), "UTF8String");
LABEL_54:
            if (-[VCConnectionManager secondaryConnection](self, "secondaryConnection"))
              v36 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](-[VCConnectionManager secondaryConnection](self, "secondaryConnection"), "description"), "UTF8String");
            else
              v36 = "<nil>";
            v48 = isInitialConnectionEstablished;
            if (-[VCConnectionManagerLegacy pendingPrimaryConnection](self, "pendingPrimaryConnection"))
              v37 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](-[VCConnectionManagerLegacy pendingPrimaryConnection](self, "pendingPrimaryConnection"), "description"), "UTF8String");
            else
              v37 = "<nil>";
            if (-[VCConnectionManagerLegacy pendingSecondaryConnection](self, "pendingSecondaryConnection"))
              v38 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](-[VCConnectionManagerLegacy pendingSecondaryConnection](self, "pendingSecondaryConnection"), "description"), "UTF8String");
            else
              v38 = "<nil>";
            *(_DWORD *)buf = 136317442;
            v53 = v49;
            v54 = 2080;
            v55 = "-[VCConnectionManagerLegacy addConnection:]";
            v56 = 1024;
            v57 = 226;
            v58 = 2080;
            v59 = (uint64_t)v47;
            v60 = 2080;
            v61 = (uint64_t)v46;
            v62 = 2080;
            v63 = v45;
            v64 = 2080;
            v65 = v44;
            v66 = 2080;
            v67 = v36;
            v68 = 2080;
            v69 = v37;
            v70 = 2080;
            v71 = v38;
            _os_log_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Add result %s %s connection %s. Primary %s; Secondary: %s; Pending primary: %s"
              "; Pending secondary: %s",
              buf,
              0x62u);
            isInitialConnectionEstablished = v48;
            goto LABEL_64;
          }
        }
        else
        {
          v45 = "<nil>";
          if (v31)
            goto LABEL_51;
        }
        v44 = "<nil>";
        goto LABEL_54;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
          if (v11)
            v27 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](v11, "description"), "UTF8String");
          else
            v27 = "<nil>";
          *(_DWORD *)buf = 136316162;
          v53 = v25;
          v54 = 2080;
          v55 = "-[VCConnectionManagerLegacy addConnection:]";
          v56 = 1024;
          v57 = 211;
          v58 = 2080;
          v59 = v26;
          v60 = 2080;
          v61 = (uint64_t)v27;
          v24 = " [%s] %s:%d HandoverReport: new connection %s is not the pending secondary %s";
          goto LABEL_36;
        }
      }
    }
    v10 = -2144796671;
    pthread_rwlock_unlock(p_stateRWlock);
    return v10;
  }
  v10 = -2144796671;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCConnectionManagerLegacy addConnection:].cold.1();
  }
  return v10;
}

uint64_t __43__VCConnectionManagerLegacy_addConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "connectionCallback:isInitialConnection:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (int)removeConnection:(id)a3
{
  if (a3)
    return -[VCConnectionManagerLegacy removeConnectionWithIPPort:isLocalInterface:](self, "removeConnectionWithIPPort:isLocalInterface:", objc_msgSend(a3, "connectionResult") + 28, 1);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCConnectionManagerLegacy removeConnection:].cold.1();
  }
  return -2144796671;
}

- (int)removeConnectionWithIPPort:(tagIPPORT *)a3 isLocalInterface:(BOOL)a4
{
  uint64_t v4;
  _opaque_pthread_rwlock_t *p_stateRWlock;

  v4 = a4;
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  LODWORD(v4) = -[VCConnectionManagerLegacy removeConnectionWithIPPortInternal:isLocalInterface:](self, "removeConnectionWithIPPortInternal:isLocalInterface:", a3, v4);
  pthread_rwlock_unlock(p_stateRWlock);
  return v4;
}

- (int)removeConnectionWithIPPortInternal:(tagIPPORT *)a3 isLocalInterface:(BOOL)a4
{
  _BOOL4 v4;
  VCConnectionProtocol *v7;
  VCConnectionProtocol *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  VCConnectionProtocol *v13;
  VCConnectionProtocol *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  int NumberOfConnectionsInternal;
  _BYTE v28[24];
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  _BYTE *v35;
  _BYTE v36[54];
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  memset(v36, 0, sizeof(v36));
  IPPORTToStringWithSize();
  v7 = -[VCConnectionManager secondaryConnection](self, "secondaryConnection");
  v8 = v7;
  if (v7)
  {
    if (v4)
    {
      if ((-[VCConnectionProtocol isLocalIPPort:](v7, "isLocalIPPort:", a3) & 1) == 0)
        goto LABEL_12;
    }
    else if (!VCConnectionLegacy_IsRemoteIPPort((uint64_t)v7, (uint64_t)a3))
    {
      goto LABEL_12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend((id)-[VCConnectionProtocol description](v8, "description"), "UTF8String");
        *(_DWORD *)v28 = 136316418;
        v12 = "REMOTE";
        *(_QWORD *)&v28[4] = v9;
        *(_QWORD *)&v28[14] = "-[VCConnectionManagerLegacy removeConnectionWithIPPortInternal:isLocalInterface:]";
        *(_WORD *)&v28[22] = 1024;
        *(_WORD *)&v28[12] = 2080;
        if (v4)
          v12 = "LOCAL";
        v29 = 304;
        v30 = 2080;
        v31 = v11;
        v32 = 2080;
        v33 = (uint64_t)v12;
        v34 = 2080;
        v35 = v36;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: removed SECONDARY connection %s due to %s IPPort %s change", v28, 0x3Au);
      }
    }
    -[VCConnectionManager setSecondaryConnection:](self, "setSecondaryConnection:", 0, *(_OWORD *)v28, *(_QWORD *)&v28[16]);
    v8 = 0;
  }
LABEL_12:
  v13 = -[VCConnectionManager lastPrimaryConnectionInUse](self, "lastPrimaryConnectionInUse");
  v14 = v13;
  if (v4)
  {
    if ((-[VCConnectionProtocol isLocalIPPort:](v13, "isLocalIPPort:", a3) & 1) == 0)
      goto LABEL_32;
  }
  else if (!VCConnectionLegacy_IsRemoteIPPort((uint64_t)v13, (uint64_t)a3))
  {
LABEL_32:
    v24 = 0;
    v8 = 0;
    goto LABEL_36;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v14)
        v17 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](v14, "description"), "UTF8String");
      else
        v17 = "<nil>";
      v18 = "REMOTE";
      *(_DWORD *)v28 = 136316418;
      *(_QWORD *)&v28[4] = v15;
      *(_WORD *)&v28[12] = 2080;
      *(_QWORD *)&v28[14] = "-[VCConnectionManagerLegacy removeConnectionWithIPPortInternal:isLocalInterface:]";
      if (v4)
        v18 = "LOCAL";
      *(_WORD *)&v28[22] = 1024;
      v29 = 314;
      v30 = 2080;
      v31 = (uint64_t)v17;
      v32 = 2080;
      v33 = (uint64_t)v18;
      v34 = 2080;
      v35 = v36;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: removed PRIMARY connection %s due to %s IPPort %s change", v28, 0x3Au);
    }
  }
  VCConnectionManager_SetPrimaryConnection((uint64_t)self);
  if (!v8)
  {
    VCConnectionManager_UseCellPrimaryInterface((uint64_t)self, 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCConnectionManagerLegacy removeConnectionWithIPPortInternal:isLocalInterface:].cold.1(v22, v23);
    }
    goto LABEL_32;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v14)
        v21 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](v14, "description"), "UTF8String");
      else
        v21 = "<nil>";
      v25 = objc_msgSend((id)-[VCConnectionProtocol description](v8, "description", *(_QWORD *)v28, *(_OWORD *)&v28[8]), "UTF8String");
      *(_DWORD *)v28 = 136316418;
      *(_QWORD *)&v28[4] = v19;
      *(_WORD *)&v28[12] = 2080;
      *(_QWORD *)&v28[14] = "-[VCConnectionManagerLegacy removeConnectionWithIPPortInternal:isLocalInterface:]";
      *(_WORD *)&v28[22] = 1024;
      v29 = 322;
      v30 = 2080;
      v31 = (uint64_t)v21;
      v32 = 2080;
      v33 = v25;
      v34 = 2080;
      v35 = v36;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: replace primary connection %s with new primary %s due to removed IPPort %s", v28, 0x3Au);
    }
  }
  -[VCConnectionManager promoteSecondaryConnectionToPrimary:](self, "promoteSecondaryConnectionToPrimary:", v8, *(_QWORD *)v28, *(_OWORD *)&v28[8]);
  v24 = 1;
  *(_DWORD *)(-[VCConnectionProtocol connectionResult](v8, "connectionResult") + 296) = 1;
LABEL_36:
  NumberOfConnectionsInternal = VCConnectionManager_GetNumberOfConnectionsInternal((uint64_t (**)(void))self);
  VTP_SetAFRCConnectionNumber(NumberOfConnectionsInternal);
  if (v24)
  {
    -[VCConnectionManager checkpointPrimaryConnection:](self, "checkpointPrimaryConnection:", v8);
    -[VCConnectionManager primaryConnectionChanged:oldPrimaryConnection:](self, "primaryConnectionChanged:oldPrimaryConnection:", v8, v14);
    -[VCConnectionManagerLegacy reportConnection:isInitialConnection:](self, "reportConnection:isInitialConnection:", v8, 0);
  }

  return 0;
}

- (void)reportConnection:(id)a3 isInitialConnection:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  uint64_t v14;
  unsigned int IsRelay;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *relayConnectionID;
  _BOOL8 EyeContactEnabledBoolValue;
  int v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  _BOOL4 v32;
  objc_super v33;
  char __dst[9];
  _BYTE buf[22];
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  _QWORD v40[11];
  _QWORD v41[11];
  _OWORD v42[2];
  _OWORD v43[2];
  _OWORD v44[2];
  _OWORD v45[2];
  _OWORD v46[2];
  _BYTE v47[22];
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  VCConnection_Priority((uint64_t)a3);
  v7 = VCConnection_LocalCellTech((uint64_t)a3);
  v8 = VCConnection_RemoteCellTech((uint64_t)a3);
  *(_QWORD *)&v47[14] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v46[1] = v9;
  *(_OWORD *)v47 = v9;
  v46[0] = v9;
  *(_QWORD *)((char *)v45 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v44[1] = v9;
  v45[0] = v9;
  v44[0] = v9;
  *(_QWORD *)((char *)v43 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v42[1] = v9;
  v43[0] = v9;
  v42[0] = v9;
  if (self->super._reportingAgent)
  {
    v10 = v8;
    v32 = v4;
    v11 = objc_msgSend(a3, "connectionResult");
    LODWORD(v12) = *(_DWORD *)(v11 + 268);
    v13 = (double)v12 * 0.0000152587891;
    IPPORTToStringWithSize();
    IPPORTToStringWithSize();
    IPPORTToStringWithSize();
    v14 = *(unsigned int *)(v11 + 268);
    IsRelay = VCConnection_IsRelay((uint64_t)a3);
    v31 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("connectionResultCallback %s/%s (rtt: %f cell: %d/%d v6/rel: %d/%d)  RTT=%d/%d"), v46, v44, *(_QWORD *)&v13, v7, v10, VCConnection_IsIPv6((uint64_t)a3), IsRelay, v14, (v13 * 1000.0));
    if (IsRelay)
      v16 = "relay";
    else
      v16 = "p2p";
    VCConnection_IsLocalOnCellular((uint64_t)a3);
    v17 = CelltechToStr();
    VCConnection_IsRemoteOnCellular((uint64_t)a3);
    v18 = CelltechToStr();
    relayConnectionID = self->_relayConnectionID;
    EyeContactEnabledBoolValue = VCDefaults_GetEyeContactEnabledBoolValue(1);
    v40[0] = CFSTR("ConnectionType");
    v41[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
    v40[1] = CFSTR("LocalCandidate");
    v41[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v46);
    v40[2] = CFSTR("RemoteCandidate");
    v41[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v42);
    v40[3] = CFSTR("LocalInterfaceType");
    v41[3] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    v40[4] = CFSTR("RemoteInterfaceType");
    v41[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
    v40[5] = CFSTR("relayServer");
    v41[5] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v44);
    v40[6] = CFSTR("relayType");
    v41[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "type"));
    v40[7] = CFSTR("VPN");
    v21 = objc_msgSend(a3, "isVPN");
    v22 = &unk_1E9EF4D48;
    if (v21)
      v22 = &unk_1E9EF4D30;
    v23 = CFSTR("Unknown");
    if (relayConnectionID)
      v23 = (const __CFString *)relayConnectionID;
    v41[7] = v22;
    v41[8] = v23;
    v40[8] = CFSTR("IDSToken");
    v40[9] = CFSTR("VPCENABLED");
    v41[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", EyeContactEnabledBoolValue);
    v40[10] = CFSTR("EndToEnd");
    v24 = (void *)MEMORY[0x1E0CB3940];
    if (VCConnection_IsEndToEndLink((uint64_t)a3))
      v25 = "1";
    else
      v25 = "0";
    v41[10] = objc_msgSend(v24, "stringWithUTF8String:", v25);
    v26 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 11), "mutableCopy");
    VCConnectionManager_AddTelemetryForConnection((uint64_t)self, (uint64_t)a3, v26);
    reportingGenericEvent();

    if (v31)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v27;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCConnectionManagerLegacy reportConnection:isInitialConnection:]";
          v36 = 1024;
          v37 = 406;
          v38 = 2080;
          v39 = objc_msgSend((id)objc_msgSend(v31, "description"), "UTF8String");
          _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d reportConnection: %s", buf, 0x26u);
        }
      }
    }
    if (v32)
    {
      memset(buf, 170, 18);
      if (!Get80211BSSID())
      {
        strncpy(__dst, buf, 8uLL);
        __dst[8] = 0;
        reportingLog();
      }
    }
    v33.receiver = self;
    v33.super_class = (Class)VCConnectionManagerLegacy;
    -[VCConnectionManager reportConnection:isInitialConnection:](&v33, sel_reportConnection_isInitialConnection_, a3, v32);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCConnectionManagerLegacy reportConnection:isInitialConnection:]";
      v36 = 1024;
      v37 = 363;
      _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d reportConnection: reportingAgent is nil, can not report connections", buf, 0x1Cu);
    }
  }
}

- (int)nominateConnection:(id)a3 asPrimary:(BOOL)a4 interfaceMask:(int)a5 demote:(int *)a6 connectionPriority:(int *)a7 replaceOnly:(int *)a8
{
  uint64_t v11;
  _BOOL8 v12;
  int v15;

  v11 = *(_QWORD *)&a5;
  v12 = a4;
  if (a4)
  {
    if (-[VCConnectionManager isOptimalConnection:asPrimary:interfaceMask:](self, "isOptimalConnection:asPrimary:interfaceMask:", a3, 1, *(_QWORD *)&a5))
    {
      v15 = 3;
    }
    else
    {
      v15 = 2;
    }
  }
  else
  {
    v15 = -[VCConnectionManager isOptimalConnection:asPrimary:interfaceMask:](self, "isOptimalConnection:asPrimary:interfaceMask:", a3, a4, *(_QWORD *)&a5);
  }
  *a7 = v15;
  VCConnection_SetPriority((uint64_t)a3, v15);
  return -[VCConnectionManagerLegacy updateStateWithCurrentConnection:asPrimary:interfaceMask:demote:replaceOnly:](self, "updateStateWithCurrentConnection:asPrimary:interfaceMask:demote:replaceOnly:", a3, v12, v11, a6, a8);
}

- (BOOL)shouldNominateConnection:(id)a3
{
  id v5;
  id v6;
  id v7;

  v5 = -[VCConnectionManagerLegacy getPrimaryConnectionToBeCompared](self, "getPrimaryConnectionToBeCompared");
  v6 = -[VCConnectionManagerLegacy getSecondaryConnectionToBeCompared](self, "getSecondaryConnectionToBeCompared");
  if (!v5)
    return 1;
  v7 = v6;
  if ((objc_msgSend(a3, "isOnSameIPPortWithConnection:", v5) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isOnSameIPPortWithConnection:", v7) ^ 1;
}

- (int)updateStateWithCurrentConnection:(id)a3 asPrimary:(BOOL)a4 interfaceMask:(int)a5 demote:(int *)a6 replaceOnly:(int *)a7
{
  uint64_t v9;
  _BOOL4 v10;
  id v13;
  id v14;
  _BOOL4 v15;
  int v16;
  int v17;
  _BOOL4 v18;

  v9 = *(_QWORD *)&a5;
  v10 = a4;
  v13 = -[VCConnectionManagerLegacy getPrimaryConnectionToBeCompared](self, "getPrimaryConnectionToBeCompared");
  v14 = -[VCConnectionManagerLegacy getSecondaryConnectionToBeCompared](self, "getSecondaryConnectionToBeCompared");
  if (v10)
  {
    if (v13)
    {
      if (v14)
      {
        v15 = -[VCConnectionManager isBetterConnection:asPrimary:](self, "isBetterConnection:asPrimary:", v13, 0);
        if (v15)
          v16 = 3;
        else
          v16 = 0;
        v17 = !v15;
      }
      else
      {
        v17 = VCConnection_IsOnSameInterfacesWithConnection((uint64_t)a3);
        if (v17)
          v16 = 0;
        else
          v16 = 2;
      }
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
    *a6 = v16;
    *a7 = v17;
    if ((*a6 & 0xFFFFFFFE) == 2)
    {
      VCConnection_SetPriority((uint64_t)v13, -[VCConnectionManager isOptimalConnection:asPrimary:interfaceMask:](self, "isOptimalConnection:asPrimary:interfaceMask:", v13, 0, v9));
      -[VCConnectionManagerLegacy setPendingSecondaryConnection:](self, "setPendingSecondaryConnection:", v13);
    }
    objc_msgSend(a3, "setWaitToBeNominated:", 1);
    -[VCConnectionManagerLegacy setPendingPrimaryConnection:](self, "setPendingPrimaryConnection:", a3);
  }
  else
  {
    v18 = v14 != 0;
    *a6 = v18;
    *a7 = v18;
    objc_msgSend(a3, "setWaitToBeNominated:", 1);
    -[VCConnectionManagerLegacy setPendingSecondaryConnection:](self, "setPendingSecondaryConnection:", a3);
  }
  return 0;
}

- (id)getPrimaryConnectionToBeCompared
{
  id result;

  result = -[VCConnectionManagerLegacy pendingPrimaryConnection](self, "pendingPrimaryConnection");
  if (!result)
    return (id)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  return result;
}

- (id)getSecondaryConnectionToBeCompared
{
  id result;

  result = -[VCConnectionManagerLegacy pendingSecondaryConnection](self, "pendingSecondaryConnection");
  if (!result)
    return -[VCConnectionManager secondaryConnection](self, "secondaryConnection");
  return result;
}

- (void)updateCellularMTU:(int)a3
{
  uint64_t v3;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  void *v6;

  v3 = *(_QWORD *)&a3;
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  v6 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  objc_msgSend(v6, "setConnectionMTU:", v3);
  if (v6)
    CFRelease(v6);
  -[VCConnectionProtocol setConnectionMTU:](-[VCConnectionManager secondaryConnection](self, "secondaryConnection"), "setConnectionMTU:", v3);
  -[VCConnectionProtocol setConnectionMTU:](-[VCConnectionManagerLegacy pendingPrimaryConnection](self, "pendingPrimaryConnection"), "setConnectionMTU:", v3);
  -[VCConnectionProtocol setConnectionMTU:](-[VCConnectionManagerLegacy pendingSecondaryConnection](self, "pendingSecondaryConnection"), "setConnectionMTU:", v3);
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)updateCellularTech:(int)a3 forLocalInterface:(BOOL)a4
{
  _BOOL4 v4;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  uint64_t v7;
  const void *v8;

  v4 = a4;
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  v7 = VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  v8 = (const void *)v7;
  if (v4)
  {
    VCConnection_SetLocalCellTech(v7);
    VCConnection_SetLocalCellTech((uint64_t)-[VCConnectionManager secondaryConnection](self, "secondaryConnection"));
    VCConnection_SetLocalCellTech((uint64_t)-[VCConnectionManagerLegacy pendingPrimaryConnection](self, "pendingPrimaryConnection"));
    VCConnection_SetLocalCellTech((uint64_t)-[VCConnectionManagerLegacy pendingSecondaryConnection](self, "pendingSecondaryConnection"));
    if (!v8)
      goto LABEL_6;
    goto LABEL_5;
  }
  VCConnection_SetRemoteCellTech(v7);
  VCConnection_SetRemoteCellTech((uint64_t)-[VCConnectionManager secondaryConnection](self, "secondaryConnection"));
  VCConnection_SetRemoteCellTech((uint64_t)-[VCConnectionManagerLegacy pendingPrimaryConnection](self, "pendingPrimaryConnection"));
  VCConnection_SetRemoteCellTech((uint64_t)-[VCConnectionManagerLegacy pendingSecondaryConnection](self, "pendingSecondaryConnection"));
  if (v8)
LABEL_5:
    CFRelease(v8);
LABEL_6:
  pthread_rwlock_unlock(p_stateRWlock);
}

- (BOOL)shouldAcceptDataFromSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3
{
  _opaque_pthread_rwlock_t *p_stateRWlock;
  NSMutableArray *connectionArray;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  connectionArray = self->super._connectionArray;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(connectionArray);
        if ((VCConnection_MatchesSourceDestinationInfo(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (uint64_t)a3) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:
  pthread_rwlock_unlock(p_stateRWlock);
  return v11;
}

- (unsigned)getPacketCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4
{
  return 0;
}

- (unsigned)getByteCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4
{
  return 0;
}

- (VCConnectionProtocol)pendingPrimaryConnection
{
  return self->_pendingPrimaryConnection;
}

- (void)setPendingPrimaryConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 3536);
}

- (VCConnectionProtocol)pendingSecondaryConnection
{
  return self->_pendingSecondaryConnection;
}

- (void)setPendingSecondaryConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 3544);
}

- (NSString)relayConnectionID
{
  return self->_relayConnectionID;
}

- (void)setRelayConnectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 3552);
}

- (void)addConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d HandoverReport: %s received a nil VCConnection!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)removeConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d HandoverReport: %s received a nil VCConnection!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)removeConnectionWithIPPortInternal:(uint64_t)a1 isLocalInterface:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCConnectionManagerLegacy removeConnectionWithIPPortInternal:isLocalInterface:]";
  v6 = 1024;
  v7 = 331;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d HandoverReport: no available connection after interface change", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

@end
