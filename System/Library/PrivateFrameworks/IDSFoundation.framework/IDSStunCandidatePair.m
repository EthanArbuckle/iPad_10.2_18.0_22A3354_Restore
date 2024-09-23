@implementation IDSStunCandidatePair

+ (id)candidatePairWithLocalCandidate:(id)a3 remoteCandidate:(id)a4 sessionID:(id)a5 delegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  IDSStunCandidatePair *v13;
  const char *v14;
  double v15;
  void *v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [IDSStunCandidatePair alloc];
  v16 = (void *)objc_msgSend_initWithLocalCandidate_remoteCandidate_sessionID_delegate_(v13, v14, (uint64_t)v12, v15, v11, v10, v9);

  return v16;
}

- (IDSStunCandidatePair)initWithLocalCandidate:(id)a3 remoteCandidate:(id)a4 sessionID:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  IDSStunCandidatePair *v16;
  double v17;
  uint64_t v18;
  NSMutableDictionary *connections;
  const char *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  IDSStunCandidate *local;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  IDSStunCandidate *remote;
  const char *v30;
  double v31;
  uint64_t v32;
  IDSGFTMetricsLink *linkMetrics;
  objc_super v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)IDSStunCandidatePair;
  v16 = -[IDSStunCandidatePair init](&v35, sel_init);
  if (v16)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v14, v15, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    connections = v16->_connections;
    v16->_connections = (NSMutableDictionary *)v18;

    v16->_state = 0;
    v23 = objc_msgSend_copy(v10, v20, v21, v22);
    local = v16->_local;
    v16->_local = (IDSStunCandidate *)v23;

    v28 = objc_msgSend_copy(v11, v25, v26, v27);
    remote = v16->_remote;
    v16->_remote = (IDSStunCandidate *)v28;

    objc_storeStrong((id *)&v16->_sessionID, a5);
    objc_storeWeak((id *)&v16->_delegate, v13);
    v16->_statsIntervalInSeconds = 12;
    v16->_triggeredCheckTime = 0.0;
    if (v13)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_createLinkCycleForCandidatePair_(v13, v30, (uint64_t)v16, v31);
        v32 = objc_claimAutoreleasedReturnValue();
        linkMetrics = v16->_linkMetrics;
        v16->_linkMetrics = (IDSGFTMetricsLink *)v32;

      }
    }
  }

  return v16;
}

- (void)dealloc
{
  uint64_t v2;
  double v3;
  objc_super v5;

  objc_msgSend__stopReallocTimer(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IDSStunCandidatePair;
  -[IDSStunCandidatePair dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  NSMutableArray *pendingStunRequests;
  NSMutableArray *repliedStunRequests;
  NSMutableDictionary *requestIDToQueryLinkIDs;
  id sessionConnectedTimeoutBlock;
  id sessionConvergenceBlock;
  NSMutableDictionary *requestIDToStatsIDs;
  NSMutableDictionary *stunSentBytesToRequestID;
  NSMutableDictionary *pluginNameToStunReqID;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  NSData *hbhEncKey;
  NSData *hbhDecKey;

  self->_state = 6;
  pendingStunRequests = self->_pendingStunRequests;
  self->_pendingStunRequests = 0;

  repliedStunRequests = self->_repliedStunRequests;
  self->_repliedStunRequests = 0;

  requestIDToQueryLinkIDs = self->_requestIDToQueryLinkIDs;
  self->_requestIDToQueryLinkIDs = 0;

  sessionConnectedTimeoutBlock = self->_sessionConnectedTimeoutBlock;
  self->_sessionConnectedTimeoutBlock = 0;

  sessionConvergenceBlock = self->_sessionConvergenceBlock;
  self->_sessionConvergenceBlock = 0;

  requestIDToStatsIDs = self->_requestIDToStatsIDs;
  self->_requestIDToStatsIDs = 0;

  stunSentBytesToRequestID = self->_stunSentBytesToRequestID;
  self->_stunSentBytesToRequestID = 0;

  pluginNameToStunReqID = self->_pluginNameToStunReqID;
  self->_pluginNameToStunReqID = 0;

  objc_msgSend_setAllocbindFailoverTimer_(self, v11, 0, v12);
  objc_msgSend_setIsRealloc_(self, v13, 0, v14);
  objc_msgSend_stopLinkProbingTimer(self, v15, v16, v17);
  hbhEncKey = self->_hbhEncKey;
  self->_hbhEncKey = 0;

  hbhDecKey = self->_hbhDecKey;
  self->_hbhDecKey = 0;

}

- (id)description
{
  uint64_t v2;
  __int128 v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  unsigned int v20;
  const char *v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  IDSStunCandidate *remote;
  char *v37;
  const char *v38;
  char *v39;
  const char *v40;
  uint64_t v41;
  char *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  void *v49;
  IDSStunCandidate *local;
  void *v52;
  uint64_t v53;
  char v54[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  char v62[16];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  char __str[16];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v76 = v4;
  v77 = v4;
  v74 = v4;
  v75 = v4;
  v72 = v4;
  v73 = v4;
  *(_OWORD *)__str = v4;
  v71 = v4;
  v68 = v4;
  v69 = v4;
  v66 = v4;
  v67 = v4;
  v64 = v4;
  v65 = v4;
  *(_OWORD *)v62 = v4;
  v63 = v4;
  v60 = v4;
  v61 = v4;
  v58 = v4;
  v59 = v4;
  v56 = v4;
  v57 = v4;
  *(_OWORD *)v54 = v4;
  v55 = v4;
  v5 = objc_msgSend_address(self->_local, a2, v2, -3.72066208e-103);
  v9 = objc_msgSend_external(self->_local, v6, v7, v8);
  v13 = objc_msgSend_external(self->_remote, v10, v11, v12);
  SAToIPPortString(__str, 0x80uLL, v5);
  SAToIPPortString(v62, 0x80uLL, v9);
  SAToIPPortString(v54, 0x80uLL, v13);
  LODWORD(v13) = objc_msgSend_radioAccessTechnology(self->_local, v14, v15, v16);
  v20 = objc_msgSend_radioAccessTechnology(self->_remote, v17, v18, v19);
  v53 = objc_msgSend_mtu(self->_local, v21, v22, v23);
  v27 = objc_msgSend_type(self->_local, v24, v25, v26);
  v31 = objc_msgSend_type(self->_remote, v28, v29, v30);
  v35 = objc_msgSend_mtu(self->_remote, v32, v33, v34);
  remote = self->_remote;
  local = self->_local;
  v52 = (void *)MEMORY[0x1E0CB3940];
  v37 = (&_IDSStunCandidateTypeStrings)[v27];
  v38 = IDSRadioAccessTechnologyToString(v13);
  v39 = (&_IDSStunCandidateTypeStrings)[v31];
  v40 = IDSRadioAccessTechnologyToString(v20);
  v41 = bswap32(self->_channelNumber) >> 16;
  v42 = (&_IDSStunCandidatePairStateStrings)[self->_state];
  objc_msgSend_UUIDString(self->_linkUUID, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v52, v47, (uint64_t)CFSTR("[%s(%s,%p)-%s(%p)/%s/%s/%u/%s/%s/%u/(%04x)/%s/%@/%d|%d/%04x/%04x/%@/%@]"), v48, __str, v62, local, v54, remote, v37, v38, v53, v39, v40, v35, v41, v42, v46, self->_linkID,
    self->_delegatedLinkID,
    self->_relayLinkID,
    self->_remoteRelayLinkID,
    self->_sessionID,
    self->_connections);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

- (id)candidatePairToken
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;

  v5 = objc_msgSend_address(self->_local, a2, v2, v3);
  v9 = objc_msgSend_external(self->_remote, v6, v7, v8);
  return tokenForStunCandidatePair(v5, v9, self->_sessionID);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  _BOOL4 v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  _BOOL4 v30;
  const char *v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  int v41;
  const char *v42;
  uint64_t v43;
  double v44;
  int relayLinkID;
  const char *v46;
  uint64_t v47;
  double v48;
  int remoteRelayLinkID;
  _BOOL4 v50;
  BOOL v51;
  BOOL v52;

  v4 = a3;
  v8 = objc_msgSend_address(self->_local, v5, v6, v7);
  objc_msgSend_local(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_address(v12, v13, v14, v15);
  v17 = IsSameSA(v8, v16);

  v21 = objc_msgSend_external(self->_remote, v18, v19, v20);
  objc_msgSend_remote(v4, v22, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_external((void *)v25, v26, v27, v28);
  v30 = IsSameSA(v21, v29);

  LODWORD(v25) = objc_msgSend_isRelayStunCandidate(self->_local, v31, v32, v33);
  objc_msgSend_local(v4, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v25 ^ objc_msgSend_isRelayStunCandidate(v37, v38, v39, v40);

  if (self->_remoteRelayLinkID)
  {
    relayLinkID = self->_relayLinkID;
    if (relayLinkID == objc_msgSend_relayLinkID(v4, v42, v43, v44))
    {
      remoteRelayLinkID = self->_remoteRelayLinkID;
      v50 = remoteRelayLinkID == objc_msgSend_remoteRelayLinkID(v4, v46, v47, v48);
    }
    else
    {
      v50 = 0;
    }
  }
  else
  {
    v50 = 1;
  }
  v51 = v50 & ~(_BYTE)v41;
  v52 = v17 && v30 && v51;

  return v52;
}

- (BOOL)isRelayStunCandidatePair
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;

  if ((objc_msgSend_isRelayStunCandidate(self->_local, a2, v2, v3) & 1) != 0)
    return 1;
  else
    return objc_msgSend_isRelayStunCandidate(self->_remote, v5, v6, v7);
}

- (BOOL)isValidRelayStunCandidatePair
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;

  v5 = objc_msgSend_length(self->_relaySessionToken, a2, v2, v3);
  if (v5)
    LOBYTE(v5) = objc_msgSend_length(self->_relaySessionKey, v6, v7, v8) != 0;
  return v5;
}

- (BOOL)isSharedQRSession
{
  return self->_allocateType == 3;
}

- (BOOL)isSelfQRSession
{
  return self->_allocateType == 2;
}

- (BOOL)isVirtualRelayStunCandidatePair
{
  return self->_remoteRelayLinkID != 0;
}

- (BOOL)isActualRelayStunCandidatePair
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;

  if ((objc_msgSend_isVirtualRelayStunCandidatePair(self, a2, v2, v3) & 1) != 0)
    return 0;
  else
    return objc_msgSend_isRelayStunCandidatePair(self, v5, v6, v7);
}

- (BOOL)isP2P
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;

  if ((objc_msgSend_isVirtualRelayStunCandidatePair(self, a2, v2, v3) & 1) != 0)
    return 0;
  else
    return objc_msgSend_isRelayStunCandidatePair(self, v5, v6, v7) ^ 1;
}

- (void)setPropertiesWithRelaySessionInfo:(id)a3 sessionInfoDict:(id)a4 enableSKE:(BOOL)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  double v13;
  NSData *v14;
  NSData *relaySessionToken;
  const char *v16;
  uint64_t v17;
  double v18;
  NSData *v19;
  NSData *relaySessionKey;
  const char *v21;
  uint64_t v22;
  double v23;
  NSString *v24;
  NSString *pskTransportParameters;
  const char *v26;
  uint64_t v27;
  double v28;
  NSString *v29;
  NSString *pskH3Settings;
  const char *v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  const char *v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  uint64_t v50;
  double v51;
  const char *v52;
  uint64_t v53;
  double v54;
  int v55;
  const char *v56;
  uint64_t v57;
  double v58;
  NSUUID *v59;
  NSUUID *defaultLocalDeviceCBUUID;
  const char *v61;
  uint64_t v62;
  double v63;
  NSUUID *v64;
  NSUUID *defaultRemoteDeviceCBUUID;
  const char *v66;
  uint64_t v67;
  double v68;
  NSString *v69;
  NSString *groupID;
  const char *v71;
  uint64_t v72;
  double v73;
  const char *v74;
  uint64_t v75;
  double v76;
  const char *v77;
  uint64_t v78;
  double v79;
  NSData *v80;
  NSData *softwareData;
  const char *v82;
  uint64_t v83;
  double v84;
  id v85;
  const char *v86;
  double v87;
  void *v88;
  const char *v89;
  double v90;
  const char *v91;
  double v92;
  void *v93;
  NSObject *v94;
  NSData *v95;
  NSString *sessionID;
  const char *v97;
  uint64_t v98;
  double v99;
  NSUUID *v100;
  NSUUID *linkUUID;
  int64_t allocateType;
  unint64_t v103;
  NSObject *v104;
  unint64_t capabilityFlags;
  unint64_t callType;
  unsigned int stateFlags;
  NSObject *v108;
  unsigned int v109;
  NSData *v110;
  void *v111;
  NSString *v112;
  uint8_t buf[4];
  _BYTE v114[18];
  __int16 v115;
  NSString *v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend_relaySessionToken(v9, v11, v12, v13);
  v14 = (NSData *)objc_claimAutoreleasedReturnValue();
  relaySessionToken = self->_relaySessionToken;
  self->_relaySessionToken = v14;

  objc_msgSend_relaySessionKey(v9, v16, v17, v18);
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();
  relaySessionKey = self->_relaySessionKey;
  self->_relaySessionKey = v19;

  objc_msgSend_pskTransportParameters(v9, v21, v22, v23);
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  pskTransportParameters = self->_pskTransportParameters;
  self->_pskTransportParameters = v24;

  objc_msgSend_pskH3Settings(v9, v26, v27, v28);
  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
  pskH3Settings = self->_pskH3Settings;
  self->_pskH3Settings = v29;

  self->_relayProviderType = objc_msgSend_relayServerProviderType(v9, v31, v32, v33);
  self->_allocateType = objc_msgSend_allocateType(v9, v34, v35, v36);
  objc_msgSend_allocateTime(v9, v37, v38, v39);
  self->_allocateTime = v40;
  self->_participantID = objc_msgSend_participantID(v9, v41, v42, v40);
  self->_isPseudoParticipant = objc_msgSend_isPseudoParticipant(v9, v43, v44, v45);
  self->_callType = objc_msgSend_callType(v9, v46, v47, v48);
  self->_sessionIsNonUserParticipantInitiated = objc_msgSend_sessionIsUserParticipantInitiated(v9, v49, v50, v51);
  v55 = objc_msgSend_handOffOverQREnabled(v9, v52, v53, v54);
  objc_msgSend_defaultDeviceLocalCBUUID(v9, v56, v57, v58);
  v59 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  defaultLocalDeviceCBUUID = self->_defaultLocalDeviceCBUUID;
  self->_defaultLocalDeviceCBUUID = v59;

  objc_msgSend_defaultDeviceRemoteCBUUID(v9, v61, v62, v63);
  v64 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  defaultRemoteDeviceCBUUID = self->_defaultRemoteDeviceCBUUID;
  self->_defaultRemoteDeviceCBUUID = v64;

  objc_msgSend_groupID(v9, v66, v67, v68);
  v69 = (NSString *)objc_claimAutoreleasedReturnValue();
  groupID = self->_groupID;
  self->_groupID = v69;

  self->_protocolVersion = objc_msgSend_protocolVersion(v9, v71, v72, v73);
  self->_isInitiator = objc_msgSend_isInitiator(v9, v74, v75, v76);
  objc_msgSend_softwareData(v9, v77, v78, v79);
  v80 = (NSData *)objc_claimAutoreleasedReturnValue();
  softwareData = self->_softwareData;
  self->_softwareData = v80;

  if (self->_softwareData)
  {
    v85 = objc_alloc(MEMORY[0x1E0CB3940]);
    v88 = (void *)objc_msgSend_initWithData_encoding_(v85, v86, (uint64_t)self->_softwareData, v87, 4);
    if ((objc_msgSend_isEqualToString_(self->_appName, v89, (uint64_t)v88, v90) & 1) == 0)
    {
      objc_msgSend_base64EncodedStringWithOptions_(self->_softwareData, v91, 0, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      OSLogHandleForTransportCategory();
      v94 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        v95 = self->_softwareData;
        sessionID = self->_sessionID;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v114 = v95;
        *(_WORD *)&v114[8] = 2112;
        *(_QWORD *)&v114[10] = v93;
        v115 = 2112;
        v116 = sessionID;
        _os_log_impl(&dword_19B949000, v94, OS_LOG_TYPE_DEFAULT, "update app name to (%@, %@) for %@.", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v111 = v93;
          v112 = self->_sessionID;
          v110 = self->_softwareData;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update app name to (%@, %@) for %@."));
          if (_IDSShouldLog())
          {
            v111 = v93;
            v112 = self->_sessionID;
            v110 = self->_softwareData;
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update app name to (%@, %@) for %@."));
          }
        }
      }
      objc_storeStrong((id *)&self->_appName, v88);

    }
  }
  if (objc_msgSend_isInitiator(v9, v82, v83, v84, v110, v111, v112))
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v97, v98, v99);
    v100 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    linkUUID = self->_linkUUID;
    self->_linkUUID = v100;

  }
  objc_storeStrong((id *)&self->_relaySessionInfo, a3);
  objc_storeStrong((id *)&self->_sessionInfoDict, a4);
  self->_enableSKE = a5;
  allocateType = self->_allocateType;
  if (allocateType == 3)
  {
    v103 = 293359;
    goto LABEL_18;
  }
  if (allocateType == 1 && self->_relayProviderType == 2)
  {
    v103 = 8197;
LABEL_18:
    self->_capabilityFlags = v103;
  }
  if (v55)
    self->_capabilityFlags |= 0x1000000uLL;
  OSLogHandleForTransportCategory();
  v104 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    capabilityFlags = self->_capabilityFlags;
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v114 = capabilityFlags;
    *(_WORD *)&v114[8] = 2112;
    *(_QWORD *)&v114[10] = self;
    _os_log_impl(&dword_19B949000, v104, OS_LOG_TYPE_DEFAULT, "_capabilityFlags: 0x%llx for %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_capabilityFlags: 0x%llx for %@"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_capabilityFlags: 0x%llx for %@"));
    }
  }
  if (self->_sessionIsNonUserParticipantInitiated)
    self->_stateFlags = 1;
  callType = self->_callType;
  if (callType)
  {
    stateFlags = self->_stateFlags;
    self->_stateFlags = stateFlags | 2;
    if (callType == 1)
      self->_stateFlags = stateFlags | 6;
  }
  OSLogHandleForTransportCategory();
  v108 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    v109 = self->_stateFlags;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v114 = v109;
    *(_WORD *)&v114[4] = 2112;
    *(_QWORD *)&v114[6] = self;
    _os_log_impl(&dword_19B949000, v108, OS_LOG_TYPE_DEFAULT, "_stateFlags: 0x%x for %@", buf, 0x12u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_stateFlags: 0x%x for %@"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_stateFlags: 0x%x for %@"));
    }
  }

}

- (void)setIsQUIC:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  unint64_t capabilityFlags;
  uint8_t buf[4];
  const __CFString *v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  IDSStunCandidatePair *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  self->_isQUIC = a3;
  OSLogHandleForTransportCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    capabilityFlags = self->_capabilityFlags;
    *(_DWORD *)buf = 138412802;
    if (v3)
      v6 = CFSTR("YES");
    v9 = v6;
    v10 = 2048;
    v11 = capabilityFlags;
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "QUICForQREnabled = %@ _capabilityFlags: 0x%llx for %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("QUICForQREnabled = %@ _capabilityFlags: 0x%llx for %@"));
    if (_IDSShouldLog())
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("QUICForQREnabled = %@ _capabilityFlags: 0x%llx for %@"));
  }
}

- (void)setPropertiesWithReallocCandidatePair:(id)a3 reallocToken:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  IDSQuickRelaySessionInfo *v11;
  IDSQuickRelaySessionInfo *relaySessionInfo;
  const char *v13;
  uint64_t v14;
  double v15;
  NSDictionary *v16;
  NSDictionary *sessionInfoDict;
  const char *v18;
  uint64_t v19;
  double v20;
  const char *v21;
  uint64_t v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  NSData *v30;
  NSData *relaySessionKey;
  const char *v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  NSString *v38;
  NSString *pskTransportParameters;
  const char *v40;
  uint64_t v41;
  double v42;
  NSString *v43;
  NSString *pskH3Settings;
  const char *v45;
  uint64_t v46;
  double v47;
  const char *v48;
  uint64_t v49;
  double v50;
  IDSStunCandidate *v51;
  IDSStunCandidate *relayRemote;
  const char *v53;
  uint64_t v54;
  double v55;
  const char *v56;
  uint64_t v57;
  double v58;
  const char *v59;
  uint64_t v60;
  double v61;
  NSData *v62;
  NSData *skeData;
  const char *v64;
  uint64_t v65;
  double v66;
  NSUUID *v67;
  NSUUID *defaultLocalDeviceCBUUID;
  const char *v69;
  uint64_t v70;
  double v71;
  NSUUID *v72;
  NSUUID *defaultRemoteDeviceCBUUID;
  const char *v74;
  uint64_t v75;
  double v76;
  NSString *v77;
  NSString *groupID;
  const char *v79;
  uint64_t v80;
  double v81;
  NSUUID *v82;
  NSUUID *linkUUID;
  const char *v84;
  uint64_t v85;
  double v86;
  const char *v87;
  uint64_t v88;
  double v89;
  const char *v90;
  uint64_t v91;
  double v92;
  const char *v93;
  uint64_t v94;
  double v95;
  const char *v96;
  uint64_t v97;
  double v98;
  NSData *v99;
  NSData *softwareData;
  const char *v101;
  uint64_t v102;
  double v103;
  NSString *v104;
  NSString *appName;
  id v106;

  objc_storeStrong((id *)&self->_relaySessionToken, a4);
  v106 = a4;
  v7 = a3;
  self->_pendingRealloc = 1;
  objc_msgSend_relaySessionInfo(v7, v8, v9, v10);
  v11 = (IDSQuickRelaySessionInfo *)objc_claimAutoreleasedReturnValue();
  relaySessionInfo = self->_relaySessionInfo;
  self->_relaySessionInfo = v11;

  objc_msgSend_sessionInfoDict(v7, v13, v14, v15);
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  sessionInfoDict = self->_sessionInfoDict;
  self->_sessionInfoDict = v16;

  self->_allocateType = objc_msgSend_allocateType(v7, v18, v19, v20);
  objc_msgSend_allocateTime(v7, v21, v22, v23);
  self->_allocateTime = v24;
  self->_participantID = objc_msgSend_participantID(v7, v25, v26, v24);
  objc_msgSend_relaySessionKey(v7, v27, v28, v29);
  v30 = (NSData *)objc_claimAutoreleasedReturnValue();
  relaySessionKey = self->_relaySessionKey;
  self->_relaySessionKey = v30;

  self->_relayProviderType = objc_msgSend_relayProviderType(v7, v32, v33, v34);
  objc_msgSend_pskTransportParameters(v7, v35, v36, v37);
  v38 = (NSString *)objc_claimAutoreleasedReturnValue();
  pskTransportParameters = self->_pskTransportParameters;
  self->_pskTransportParameters = v38;

  objc_msgSend_pskH3Settings(v7, v40, v41, v42);
  v43 = (NSString *)objc_claimAutoreleasedReturnValue();
  pskH3Settings = self->_pskH3Settings;
  self->_pskH3Settings = v43;

  self->_isAcceptedRelaySession = objc_msgSend_isAcceptedRelaySession(v7, v45, v46, v47);
  objc_msgSend_relayRemote(v7, v48, v49, v50);
  v51 = (IDSStunCandidate *)objc_claimAutoreleasedReturnValue();
  relayRemote = self->_relayRemote;
  self->_relayRemote = v51;

  self->_recvSKEData = objc_msgSend_recvSKEData(v7, v53, v54, v55);
  self->_sentSKEData = objc_msgSend_sentSKEData(v7, v56, v57, v58);
  objc_msgSend_skeData(v7, v59, v60, v61);
  v62 = (NSData *)objc_claimAutoreleasedReturnValue();
  skeData = self->_skeData;
  self->_skeData = v62;

  objc_msgSend_defaultLocalDeviceCBUUID(v7, v64, v65, v66);
  v67 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  defaultLocalDeviceCBUUID = self->_defaultLocalDeviceCBUUID;
  self->_defaultLocalDeviceCBUUID = v67;

  objc_msgSend_defaultRemoteDeviceCBUUID(v7, v69, v70, v71);
  v72 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  defaultRemoteDeviceCBUUID = self->_defaultRemoteDeviceCBUUID;
  self->_defaultRemoteDeviceCBUUID = v72;

  objc_msgSend_groupID(v7, v74, v75, v76);
  v77 = (NSString *)objc_claimAutoreleasedReturnValue();
  groupID = self->_groupID;
  self->_groupID = v77;

  objc_msgSend_linkUUID(v7, v79, v80, v81);
  v82 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  linkUUID = self->_linkUUID;
  self->_linkUUID = v82;

  self->_capabilityFlags = objc_msgSend_capabilityFlags(v7, v84, v85, v86);
  self->_protocolVersion = objc_msgSend_protocolVersion(v7, v87, v88, v89);
  self->_isInitiator = objc_msgSend_isInitiator(v7, v90, v91, v92);
  self->_enableSKE = objc_msgSend_enableSKE(v7, v93, v94, v95);
  objc_msgSend_softwareData(v7, v96, v97, v98);
  v99 = (NSData *)objc_claimAutoreleasedReturnValue();
  softwareData = self->_softwareData;
  self->_softwareData = v99;

  objc_msgSend_appName(v7, v101, v102, v103);
  v104 = (NSString *)objc_claimAutoreleasedReturnValue();

  appName = self->_appName;
  self->_appName = v104;

}

- (unsigned)nextSessionInfoReqID
{
  unsigned int v2;

  v2 = self->_sessionInfoReqCount + 1;
  self->_sessionInfoReqCount = v2;
  return v2;
}

- (void)setLinkUUIDWithRelayLinkIDs
{
  unsigned int relayLinkID;
  unsigned int remoteRelayLinkID;
  __int16 v5;
  __int16 v6;
  BOOL v7;
  __int16 v8;
  __int16 v9;
  id v10;
  const char *v11;
  double v12;
  NSUUID *v13;
  NSUUID *linkUUID;
  _WORD v15[2];
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v16 = 0;
  relayLinkID = self->_relayLinkID;
  remoteRelayLinkID = self->_remoteRelayLinkID;
  v5 = __rev16(relayLinkID);
  v6 = __rev16(remoteRelayLinkID);
  v7 = relayLinkID >= remoteRelayLinkID;
  if (relayLinkID >= remoteRelayLinkID)
    v8 = v6;
  else
    v8 = v5;
  if (v7)
    v9 = v5;
  else
    v9 = v6;
  v15[0] = v8;
  v15[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v13 = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v10, v11, (uint64_t)v15, v12);
  linkUUID = self->_linkUUID;
  self->_linkUUID = v13;

}

- (void)synthesizeNat64WithPrefix
{
  uint64_t v2;
  __int128 v4;
  const char *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  char *v21;
  uint8_t v22[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char v30[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char __str[16];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v44 = v4;
  v45 = v4;
  v42 = v4;
  v43 = v4;
  v40 = v4;
  v41 = v4;
  *(_OWORD *)__str = v4;
  v39 = v4;
  v36 = v4;
  v37 = v4;
  v34 = v4;
  v35 = v4;
  v32 = v4;
  v33 = v4;
  *(_OWORD *)v30 = v4;
  v31 = v4;
  if (objc_msgSend_prefix(self->_local, a2, v2, -3.72066208e-103))
  {
    *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v28 = v7;
    v29 = v7;
    v26 = v7;
    v27 = v7;
    v24 = v7;
    v25 = v7;
    *(_OWORD *)v22 = v7;
    v23 = v7;
    v8 = objc_msgSend_address(self->_local, v5, v6, -3.72066208e-103);
    v12 = objc_msgSend_external(self->_remote, v9, v10, v11);
    if (*(_BYTE *)(v8 + 1) == 30)
    {
      v13 = v12;
      if (*(_BYTE *)(v12 + 1) == 2)
      {
        if (nw_nat64_synthesize_v6())
        {
          *(_WORD *)v22 = 7708;
          *(_WORD *)&v22[2] = *(_WORD *)(v13 + 2);
          SAToIPPortString(__str, 0x80uLL, v13);
          SAToIPPortString(v30, 0x80uLL, (uint64_t)v22);
          objc_msgSend_setExternal_(self->_remote, v14, (uint64_t)v22, v15);
          OSLogHandleForTransportCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v19 = __str;
            v20 = 2080;
            v21 = v30;
            _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "nat64 translation: %s -> %s.", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("nat64 translation: %s -> %s."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("nat64 translation: %s -> %s."));
          }
        }
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "nat64 translation failed due to invalid prefix.", v22, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("nat64 translation failed due to invalid prefix."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("nat64 translation failed due to invalid prefix."));
      }
    }
  }
}

- (void)setPendingNoSessionState:(BOOL)a3
{
  double v3;

  self->_pendingNoSessionStateAllocbind = a3;
  if (a3)
    ((void (*)(IDSStunCandidatePair *, char *, BOOL))MEMORY[0x1E0DE7D20])(self, sel__startNoSessionStateTimer, a3);
  else
    objc_msgSend__stopNoSessionStateTimer(self, a2, a3, v3);
}

- (void)_handleNoSessionStateTimer
{
  NSObject *v3;
  OS_dispatch_source *noSessionStateTimer;
  const char *v5;
  uint64_t v6;
  double v7;
  OS_dispatch_source *v8;
  uint8_t buf[4];
  OS_dispatch_source *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  self->_pendingNoSessionStateAllocbind = 0;
  OSLogHandleForTransportCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    noSessionStateTimer = self->_noSessionStateTimer;
    *(_DWORD *)buf = 134217984;
    v10 = noSessionStateTimer;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "noSessionStateTimer %p fires, _noSessionStateTimer timed out.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v8 = self->_noSessionStateTimer;
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("noSessionStateTimer %p fires, _noSessionStateTimer timed out."));
      if (_IDSShouldLog())
      {
        v8 = self->_noSessionStateTimer;
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("noSessionStateTimer %p fires, _noSessionStateTimer timed out."));
      }
    }
  }
  objc_msgSend__stopNoSessionStateTimer(self, v5, v6, v7, v8);
}

- (void)_startNoSessionStateTimer
{
  NSObject *noSessionStateTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  OS_dispatch_source *v11;
  _QWORD handler[5];
  uint8_t buf[4];
  OS_dispatch_source *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  noSessionStateTimer = self->_noSessionStateTimer;
  if (noSessionStateTimer)
    dispatch_source_cancel(noSessionStateTimer);
  im_primary_queue();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  v6 = self->_noSessionStateTimer;
  self->_noSessionStateTimer = v5;

  v7 = self->_noSessionStateTimer;
  v8 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v7, v8, 0x12A05F200uLL, 0x5F5E100uLL);
  v9 = self->_noSessionStateTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_19BAA4394;
  handler[3] = &unk_1E3C1F898;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_noSessionStateTimer);
  OSLogHandleForTransportCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_noSessionStateTimer;
    *(_DWORD *)buf = 134217984;
    v14 = v11;
    _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "start noSessionStateTimer %p.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("start noSessionStateTimer %p."));
    if (_IDSShouldLog())
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("start noSessionStateTimer %p."));
  }
}

- (void)_stopNoSessionStateTimer
{
  NSObject *noSessionStateTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  uint8_t buf[4];
  OS_dispatch_source *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  noSessionStateTimer = self->_noSessionStateTimer;
  if (noSessionStateTimer)
  {
    dispatch_source_cancel(noSessionStateTimer);
    OSLogHandleForTransportCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_noSessionStateTimer;
      *(_DWORD *)buf = 134217984;
      v8 = v5;
      _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "stop noSessionStateTimer %p.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("stop noSessionStateTimer %p."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("stop noSessionStateTimer %p."));
    }
    v6 = self->_noSessionStateTimer;
    self->_noSessionStateTimer = 0;

  }
}

- (void)setPendingRealloc:(BOOL)a3
{
  double v3;

  self->_pendingRealloc = a3;
  if (a3)
    ((void (*)(IDSStunCandidatePair *, char *, BOOL))MEMORY[0x1E0DE7D20])(self, sel__startReallocTimer, a3);
  else
    objc_msgSend__stopReallocTimer(self, a2, a3, v3);
}

- (void)_handleReallocTimer
{
  NSObject *v3;
  OS_dispatch_source *reallocTimer;
  _QWORD v5[5];
  uint8_t buf[4];
  OS_dispatch_source *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_pendingRealloc = 0;
  OSLogHandleForTransportCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    reallocTimer = self->_reallocTimer;
    *(_DWORD *)buf = 134217984;
    v7 = reallocTimer;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "realloc timer %p fires, realloc timed out.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("realloc timer %p fires, realloc timed out."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("realloc timer %p fires, realloc timed out."));
    }
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_19BAA46BC;
  v5[3] = &unk_1E3C1F258;
  v5[4] = self;
  IDSTransportThreadAddBlock(v5);
}

- (void)_startReallocTimer
{
  NSObject *reallocTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  OS_dispatch_source *v11;
  _QWORD handler[5];
  uint8_t buf[4];
  OS_dispatch_source *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  reallocTimer = self->_reallocTimer;
  if (reallocTimer)
    dispatch_source_cancel(reallocTimer);
  im_primary_queue();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  v6 = self->_reallocTimer;
  self->_reallocTimer = v5;

  v7 = self->_reallocTimer;
  v8 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v7, v8, 0x12A05F200uLL, 0x5F5E100uLL);
  v9 = self->_reallocTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_19BAA48B4;
  handler[3] = &unk_1E3C1F898;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_reallocTimer);
  OSLogHandleForTransportCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_reallocTimer;
    *(_DWORD *)buf = 134217984;
    v14 = v11;
    _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "start realloc timer %p.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("start realloc timer %p."));
    if (_IDSShouldLog())
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("start realloc timer %p."));
  }
}

- (void)_stopReallocTimer
{
  NSObject *reallocTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  uint8_t buf[4];
  OS_dispatch_source *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  reallocTimer = self->_reallocTimer;
  if (reallocTimer)
  {
    dispatch_source_cancel(reallocTimer);
    OSLogHandleForTransportCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_reallocTimer;
      *(_DWORD *)buf = 134217984;
      v8 = v5;
      _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "stop realloc timer %p.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("stop realloc timer %p."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("stop realloc timer %p."));
    }
    v6 = self->_reallocTimer;
    self->_reallocTimer = 0;

  }
}

- (void)_handleSessionConnectedTimer
{
  NSObject *v3;
  OS_dispatch_source *sessionConnectedTimer;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void (**sessionConnectedTimeoutBlock)(id, const char *);
  OS_dispatch_source *v10;
  void *v11;
  uint8_t buf[4];
  OS_dispatch_source *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  OSLogHandleForTransportCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    sessionConnectedTimer = self->_sessionConnectedTimer;
    v5 = _Block_copy(self->_sessionConnectedTimeoutBlock);
    *(_DWORD *)buf = 134218240;
    v13 = sessionConnectedTimer;
    v14 = 2048;
    v15 = v5;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "session connected timer %p fired, block %p.", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v10 = self->_sessionConnectedTimer;
      v11 = _Block_copy(self->_sessionConnectedTimeoutBlock);
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("session connected timer %p fired, block %p."));

      if (_IDSShouldLog())
      {
        v10 = self->_sessionConnectedTimer;
        v11 = _Block_copy(self->_sessionConnectedTimeoutBlock);
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("session connected timer %p fired, block %p."));

      }
    }
  }
  sessionConnectedTimeoutBlock = (void (**)(id, const char *))self->_sessionConnectedTimeoutBlock;
  if (sessionConnectedTimeoutBlock)
    sessionConnectedTimeoutBlock[2](sessionConnectedTimeoutBlock, v6);
  objc_msgSend_stopSessionConnectedTimer(self, v6, v7, v8, v10, v11);
}

- (void)startSessionConnectedTimer:(int)a3 block:(id)a4
{
  id v6;
  NSObject *sessionConnectedTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  void *v14;
  id sessionConnectedTimeoutBlock;
  NSObject *v16;
  OS_dispatch_source *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD handler[5];
  uint8_t buf[4];
  OS_dispatch_source *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  sessionConnectedTimer = self->_sessionConnectedTimer;
  if (sessionConnectedTimer)
    dispatch_source_cancel(sessionConnectedTimer);
  im_primary_queue();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);
  v10 = self->_sessionConnectedTimer;
  self->_sessionConnectedTimer = v9;

  v11 = self->_sessionConnectedTimer;
  v12 = dispatch_time(0, 1000000000 * a3);
  dispatch_source_set_timer(v11, v12, 1000000000 * a3, 0x5F5E100uLL);
  v13 = self->_sessionConnectedTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_19BAA4E48;
  handler[3] = &unk_1E3C1F898;
  handler[4] = self;
  dispatch_source_set_event_handler(v13, handler);
  v14 = _Block_copy(v6);
  sessionConnectedTimeoutBlock = self->_sessionConnectedTimeoutBlock;
  self->_sessionConnectedTimeoutBlock = v14;

  dispatch_resume((dispatch_object_t)self->_sessionConnectedTimer);
  OSLogHandleForTransportCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_sessionConnectedTimer;
    v18 = _Block_copy(self->_sessionConnectedTimeoutBlock);
    *(_DWORD *)buf = 134218496;
    v23 = v17;
    v24 = 1024;
    v25 = a3;
    v26 = 2048;
    v27 = v18;
    _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "start session connected timer %p, timeout %d sec, block %p.", buf, 0x1Cu);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v19 = _Block_copy(self->_sessionConnectedTimeoutBlock);
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("start session connected timer %p, timeout %d sec, block %p."));

      if (_IDSShouldLog())
      {
        v20 = _Block_copy(self->_sessionConnectedTimeoutBlock);
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("start session connected timer %p, timeout %d sec, block %p."));

      }
    }
  }

}

- (void)stopSessionConnectedTimer
{
  NSObject *sessionConnectedTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  void *v6;
  OS_dispatch_source *v7;
  id sessionConnectedTimeoutBlock;
  void *v9;
  void *v10;
  uint8_t buf[4];
  OS_dispatch_source *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  sessionConnectedTimer = self->_sessionConnectedTimer;
  if (sessionConnectedTimer)
  {
    dispatch_source_cancel(sessionConnectedTimer);
    OSLogHandleForTransportCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_sessionConnectedTimer;
      v6 = _Block_copy(self->_sessionConnectedTimeoutBlock);
      *(_DWORD *)buf = 134218240;
      v12 = v5;
      v13 = 2048;
      v14 = v6;
      _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "stop session connected timer %p, block %p.", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v9 = _Block_copy(self->_sessionConnectedTimeoutBlock);
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("stop session connected timer %p, block %p."));

      if (_IDSShouldLog())
      {
        v10 = _Block_copy(self->_sessionConnectedTimeoutBlock);
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("stop session connected timer %p, block %p."));

      }
    }
    v7 = self->_sessionConnectedTimer;
    self->_sessionConnectedTimer = 0;

    sessionConnectedTimeoutBlock = self->_sessionConnectedTimeoutBlock;
    self->_sessionConnectedTimeoutBlock = 0;

  }
}

- (void)_handleSessionConvergenceTimer
{
  NSObject *v3;
  OS_dispatch_source *sessionConvergenceTimer;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void (**sessionConvergenceBlock)(id, const char *);
  OS_dispatch_source *v10;
  void *v11;
  uint8_t buf[4];
  OS_dispatch_source *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  OSLogHandleForTransportCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    sessionConvergenceTimer = self->_sessionConvergenceTimer;
    v5 = _Block_copy(self->_sessionConvergenceBlock);
    *(_DWORD *)buf = 134218240;
    v13 = sessionConvergenceTimer;
    v14 = 2048;
    v15 = v5;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "session convergence timer %p fired, block %p.", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v10 = self->_sessionConvergenceTimer;
      v11 = _Block_copy(self->_sessionConvergenceBlock);
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("session convergence timer %p fired, block %p."));

      if (_IDSShouldLog())
      {
        v10 = self->_sessionConvergenceTimer;
        v11 = _Block_copy(self->_sessionConvergenceBlock);
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("session convergence timer %p fired, block %p."));

      }
    }
  }
  sessionConvergenceBlock = (void (**)(id, const char *))self->_sessionConvergenceBlock;
  if (sessionConvergenceBlock)
    sessionConvergenceBlock[2](sessionConvergenceBlock, v6);
  objc_msgSend_stopSessionConvergenceTimer(self, v6, v7, v8, v10, v11);
}

- (void)startSessionConvergenceTimer:(int)a3 block:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  OS_dispatch_source *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  OS_dispatch_source *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  NSObject *v23;
  OS_dispatch_source *v24;
  OS_dispatch_source *sessionConvergenceTimer;
  NSObject *v26;
  dispatch_time_t v27;
  NSObject *v28;
  void *v29;
  id sessionConvergenceBlock;
  NSObject *v31;
  OS_dispatch_source *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  OS_dispatch_source *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD handler[5];
  uint8_t buf[4];
  OS_dispatch_source *v55;
  __int16 v56;
  _BYTE v57[24];
  uint64_t v58;

  v4 = *(_QWORD *)&a3;
  v58 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (*(_OWORD *)&self->_sessionConvergenceTimer == 0)
  {
    im_primary_queue();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v23);
    sessionConvergenceTimer = self->_sessionConvergenceTimer;
    self->_sessionConvergenceTimer = v24;

    v26 = self->_sessionConvergenceTimer;
    v27 = dispatch_time(0, 1000000000 * (int)v4);
    dispatch_source_set_timer(v26, v27, 1000000000 * (int)v4, 0x5F5E100uLL);
    v28 = self->_sessionConvergenceTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_19BAA55E0;
    handler[3] = &unk_1E3C1F898;
    handler[4] = self;
    dispatch_source_set_event_handler(v28, handler);
    v29 = _Block_copy(v6);
    sessionConvergenceBlock = self->_sessionConvergenceBlock;
    self->_sessionConvergenceBlock = v29;

    dispatch_resume((dispatch_object_t)self->_sessionConvergenceTimer);
    OSLogHandleForTransportCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = self->_sessionConvergenceTimer;
      v33 = _Block_copy(self->_sessionConvergenceBlock);
      objc_msgSend_candidatePairToken(self, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v55 = v32;
      v56 = 1024;
      *(_DWORD *)v57 = v4;
      *(_WORD *)&v57[4] = 2048;
      *(_QWORD *)&v57[6] = v33;
      *(_WORD *)&v57[14] = 2112;
      *(_QWORD *)&v57[16] = v37;
      _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_DEFAULT, "start session convergence timer %p, timeout %d sec, block %p for %@.", buf, 0x26u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v38 = self->_sessionConvergenceTimer;
        v39 = _Block_copy(self->_sessionConvergenceBlock);
        objc_msgSend_candidatePairToken(self, v40, v41, v42);
        v50 = v39;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("start session convergence timer %p, timeout %d sec, block %p for %@."));

        if (_IDSShouldLog())
        {
          v43 = _Block_copy(self->_sessionConvergenceBlock);
          objc_msgSend_candidatePairToken(self, v44, v45, v46, v38, v4, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("start session convergence timer %p, timeout %d sec, block %p for %@."));

        }
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_sessionConvergenceTimer;
      v9 = _Block_copy(self->_sessionConvergenceBlock);
      objc_msgSend_candidatePairToken(self, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v55 = v8;
      v56 = 2048;
      *(_QWORD *)v57 = v9;
      *(_WORD *)&v57[8] = 2112;
      *(_QWORD *)&v57[10] = v13;
      _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "session convergence timer %p and block %p for %@ are already scheduled.", buf, 0x20u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v14 = self->_sessionConvergenceTimer;
        v15 = _Block_copy(self->_sessionConvergenceBlock);
        objc_msgSend_candidatePairToken(self, v16, v17, v18);
        v47 = v15;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("session convergence timer %p and block %p for %@ are already scheduled."));

        if (_IDSShouldLog())
        {
          v19 = _Block_copy(self->_sessionConvergenceBlock);
          objc_msgSend_candidatePairToken(self, v20, v21, v22, v14, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("session convergence timer %p and block %p for %@ are already scheduled."));

        }
      }
    }
  }

}

- (void)stopSessionConvergenceTimer
{
  NSObject *sessionConvergenceTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  void *v6;
  OS_dispatch_source *v7;
  id sessionConvergenceBlock;
  void *v9;
  void *v10;
  uint8_t buf[4];
  OS_dispatch_source *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  sessionConvergenceTimer = self->_sessionConvergenceTimer;
  if (sessionConvergenceTimer)
  {
    dispatch_source_cancel(sessionConvergenceTimer);
    OSLogHandleForTransportCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_sessionConvergenceTimer;
      v6 = _Block_copy(self->_sessionConvergenceBlock);
      *(_DWORD *)buf = 134218240;
      v12 = v5;
      v13 = 2048;
      v14 = v6;
      _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "stop session convergence timer %p, block %p.", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v9 = _Block_copy(self->_sessionConvergenceBlock);
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("stop session convergence timer %p, block %p."));

      if (_IDSShouldLog())
      {
        v10 = _Block_copy(self->_sessionConvergenceBlock);
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("stop session convergence timer %p, block %p."));

      }
    }
    v7 = self->_sessionConvergenceTimer;
    self->_sessionConvergenceTimer = 0;

    sessionConvergenceBlock = self->_sessionConvergenceBlock;
    self->_sessionConvergenceBlock = 0;

  }
}

- (void)_handleSessionGoAwayTimer
{
  NSObject *v3;
  OS_dispatch_source *sessionConvergenceTimer;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void (**sessionGoAwayBlock)(id, const char *);
  OS_dispatch_source *v10;
  void *v11;
  uint8_t buf[4];
  OS_dispatch_source *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  OSLogHandleForTransportCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    sessionConvergenceTimer = self->_sessionConvergenceTimer;
    v5 = _Block_copy(self->_sessionConvergenceBlock);
    *(_DWORD *)buf = 134218240;
    v13 = sessionConvergenceTimer;
    v14 = 2048;
    v15 = v5;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "session goaway timer %p fired, block %p.", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v10 = self->_sessionConvergenceTimer;
      v11 = _Block_copy(self->_sessionConvergenceBlock);
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("session goaway timer %p fired, block %p."));

      if (_IDSShouldLog())
      {
        v10 = self->_sessionConvergenceTimer;
        v11 = _Block_copy(self->_sessionConvergenceBlock);
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("session goaway timer %p fired, block %p."));

      }
    }
  }
  sessionGoAwayBlock = (void (**)(id, const char *))self->_sessionGoAwayBlock;
  if (sessionGoAwayBlock)
    sessionGoAwayBlock[2](sessionGoAwayBlock, v6);
  objc_msgSend_stopSessionGoAwayTimer(self, v6, v7, v8, v10, v11);
}

- (void)startSessionGoAwayTimer:(int)a3 block:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  OS_dispatch_source *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  OS_dispatch_source *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  NSObject *v23;
  OS_dispatch_source *v24;
  OS_dispatch_source *sessionGoAwayTimer;
  NSObject *v26;
  dispatch_time_t v27;
  NSObject *v28;
  void *v29;
  id sessionGoAwayBlock;
  NSObject *v31;
  OS_dispatch_source *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  OS_dispatch_source *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD handler[5];
  uint8_t buf[4];
  OS_dispatch_source *v55;
  __int16 v56;
  _BYTE v57[24];
  uint64_t v58;

  v4 = *(_QWORD *)&a3;
  v58 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (*(_OWORD *)&self->_sessionGoAwayTimer == 0)
  {
    im_primary_queue();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v23);
    sessionGoAwayTimer = self->_sessionGoAwayTimer;
    self->_sessionGoAwayTimer = v24;

    v26 = self->_sessionGoAwayTimer;
    v27 = dispatch_time(0, 1000000000 * (int)v4);
    dispatch_source_set_timer(v26, v27, 1000000000 * (int)v4, 0x5F5E100uLL);
    v28 = self->_sessionGoAwayTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_19BAA5D78;
    handler[3] = &unk_1E3C1F898;
    handler[4] = self;
    dispatch_source_set_event_handler(v28, handler);
    v29 = _Block_copy(v6);
    sessionGoAwayBlock = self->_sessionGoAwayBlock;
    self->_sessionGoAwayBlock = v29;

    dispatch_resume((dispatch_object_t)self->_sessionGoAwayTimer);
    OSLogHandleForTransportCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = self->_sessionGoAwayTimer;
      v33 = _Block_copy(self->_sessionGoAwayBlock);
      objc_msgSend_candidatePairToken(self, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v55 = v32;
      v56 = 1024;
      *(_DWORD *)v57 = v4;
      *(_WORD *)&v57[4] = 2048;
      *(_QWORD *)&v57[6] = v33;
      *(_WORD *)&v57[14] = 2112;
      *(_QWORD *)&v57[16] = v37;
      _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_DEFAULT, "start session goaway timer %p, timeout %d sec, block %p for %@.", buf, 0x26u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v38 = self->_sessionGoAwayTimer;
        v39 = _Block_copy(self->_sessionGoAwayBlock);
        objc_msgSend_candidatePairToken(self, v40, v41, v42);
        v50 = v39;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("start session goaway timer %p, timeout %d sec, block %p for %@."));

        if (_IDSShouldLog())
        {
          v43 = _Block_copy(self->_sessionGoAwayBlock);
          objc_msgSend_candidatePairToken(self, v44, v45, v46, v38, v4, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("start session goaway timer %p, timeout %d sec, block %p for %@."));

        }
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_sessionGoAwayTimer;
      v9 = _Block_copy(self->_sessionGoAwayBlock);
      objc_msgSend_candidatePairToken(self, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v55 = v8;
      v56 = 2048;
      *(_QWORD *)v57 = v9;
      *(_WORD *)&v57[8] = 2112;
      *(_QWORD *)&v57[10] = v13;
      _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "session goaway timer %p and block %p for %@ are already scheduled.", buf, 0x20u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v14 = self->_sessionGoAwayTimer;
        v15 = _Block_copy(self->_sessionGoAwayBlock);
        objc_msgSend_candidatePairToken(self, v16, v17, v18);
        v47 = v15;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("session goaway timer %p and block %p for %@ are already scheduled."));

        if (_IDSShouldLog())
        {
          v19 = _Block_copy(self->_sessionGoAwayBlock);
          objc_msgSend_candidatePairToken(self, v20, v21, v22, v14, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("session goaway timer %p and block %p for %@ are already scheduled."));

        }
      }
    }
  }

}

- (void)stopSessionGoAwayTimer
{
  NSObject *sessionGoAwayTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  void *v6;
  OS_dispatch_source *v7;
  id sessionGoAwayBlock;
  void *v9;
  void *v10;
  uint8_t buf[4];
  OS_dispatch_source *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  sessionGoAwayTimer = self->_sessionGoAwayTimer;
  if (sessionGoAwayTimer)
  {
    dispatch_source_cancel(sessionGoAwayTimer);
    OSLogHandleForTransportCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_sessionGoAwayTimer;
      v6 = _Block_copy(self->_sessionGoAwayBlock);
      *(_DWORD *)buf = 134218240;
      v12 = v5;
      v13 = 2048;
      v14 = v6;
      _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "stop session GoAway timer %p, block %p.", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v9 = _Block_copy(self->_sessionGoAwayBlock);
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("stop session GoAway timer %p, block %p."));

      if (_IDSShouldLog())
      {
        v10 = _Block_copy(self->_sessionGoAwayBlock);
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("stop session GoAway timer %p, block %p."));

      }
    }
    v7 = self->_sessionGoAwayTimer;
    self->_sessionGoAwayTimer = 0;

    sessionGoAwayBlock = self->_sessionGoAwayBlock;
    self->_sessionGoAwayBlock = 0;

  }
}

- (unsigned)hbCounter
{
  unsigned __int16 v2;

  v2 = self->_hbCounter + 1;
  self->_hbCounter = v2;
  return v2;
}

- (void)setChannelSettings:(unsigned int)a3
{
  __int16 v3;
  int v5;
  NSObject *v6;
  int statsIntervalInSeconds;
  unsigned int v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint8_t buf[4];
  _BYTE v13[10];
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (self->_statsIntervalInSeconds != a3)
  {
    v5 = a3;
    OSLogHandleForTransportCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      statsIntervalInSeconds = self->_statsIntervalInSeconds;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v13 = statsIntervalInSeconds;
      *(_WORD *)&v13[4] = 1024;
      *(_DWORD *)&v13[6] = v5;
      _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "update stats interval (%u->%u).", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update stats interval (%u->%u)."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update stats interval (%u->%u)."));
      }
    }
    self->_statsIntervalInSeconds = v3;
  }
  v8 = v3 & 0x100;
  if (self->_serverIsDegraded != v8 >> 8)
  {
    OSLogHandleForTransportCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("YES");
      if (self->_serverIsDegraded)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      if (!v8)
        v10 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v13 = v11;
      *(_WORD *)&v13[8] = 2112;
      v14 = v10;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "update server degraded status (%@->%@).", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update server degraded status (%@->%@)."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update server degraded status (%@->%@)."));
    }
    self->_serverIsDegraded = BYTE1(v8);
  }
}

- (void)setTestOptionsFromUserDefaults
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  char *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  unint64_t v23;
  const char *v24;
  double v25;
  unint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  double v39;
  NSString *v40;
  void *testSubOperation;
  NSObject *v42;
  NSObject *v43;
  unsigned int testOptions;
  void *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  double v50;
  const char *v51;
  uint64_t v52;
  double v53;
  NSObject *v54;
  double testStartTime;
  void *v56;
  char *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  double v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    MEMORY[0x1A1AC71DC](CFSTR("com.apple.ids"), CFSTR("QuickRelayTestOptions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16;
    if (!v16)
    {
LABEL_32:
      OSLogHandleForTransportCategory();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        testStartTime = self->_testStartTime;
        *(_DWORD *)buf = 138412546;
        v59 = v15;
        v60 = 2048;
        v61 = testStartTime;
        _os_log_impl(&dword_19B949000, v54, OS_LOG_TYPE_DEFAULT, "test(%@) start time = %f", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("test(%@) start time = %f"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("test(%@) start time = %f"));
        }
      }
      goto LABEL_38;
    }
    objc_msgSend_componentsSeparatedByString_(v16, v17, (uint64_t)CFSTR(","), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_count(v19, v20, v21, v22);
    if (v23 < 2)
    {
      OSLogHandleForTransportCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v42, OS_LOG_TYPE_DEFAULT, "invalid test configs", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid test configs"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid test configs"));
        }
      }
    }
    else
    {
      v26 = v23;
      objc_msgSend_objectAtIndex_(v19, v24, 0, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      self->_testOptions = objc_msgSend_hexValue(v27, v28, v29, v30);

      if (self->_testOptions)
      {
        objc_msgSend_objectAtIndex_(v19, v31, v26 - 1, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v33, v34, v35, v36);
        self->_testStartTime = v37;

        if (self->_testStartTime < 0.0)
          self->_testStartTime = 0.0;
        v39 = ids_monotonic_time() + self->_testStartTime;
        self->_testStartTime = v39;
        if (v26 == 4)
        {
          objc_msgSend_objectAtIndex_(v19, v38, 1, v39);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          self->_testRequestedMessageType = objc_msgSend_unsignedIntValue(v45, v46, v47, v48);

          objc_msgSend_objectAtIndex_(v19, v49, 2, v50);
          testSubOperation = (void *)objc_claimAutoreleasedReturnValue();
          self->_testRequestedErrorCode = objc_msgSend_unsignedIntValue(testSubOperation, v51, v52, v53);
        }
        else
        {
          if (v26 != 3)
          {
LABEL_31:

            goto LABEL_32;
          }
          objc_msgSend_objectAtIndex_(v19, v38, 1, v39);
          v40 = (NSString *)objc_claimAutoreleasedReturnValue();
          testSubOperation = self->_testSubOperation;
          self->_testSubOperation = v40;
        }

        goto LABEL_31;
      }
      OSLogHandleForTransportCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        testOptions = self->_testOptions;
        *(_DWORD *)buf = 67109120;
        LODWORD(v59) = testOptions;
        _os_log_impl(&dword_19B949000, v43, OS_LOG_TYPE_DEFAULT, "Invalid testOptions = %d", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Invalid testOptions = %d"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Invalid testOptions = %d"));
        }
      }
    }

    goto LABEL_38;
  }
  OSLogHandleForTransportCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v59 = v7;
    v60 = 2080;
    v61 = *(double *)&v8;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "skip setting test options for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v9, v10, v11);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip setting test options for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v12, v13, v14, v56, v57);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip setting test options for %@, state [%s]."));
LABEL_38:

      }
    }
  }
}

- (BOOL)hasNoSessionStateTestOptions
{
  return (self->_testOptions & 8) != 0 && self->_testRequestedErrorCode == 601;
}

- (BOOL)hasValidCapabilityFlags
{
  return self->_capabilityFlags != 0;
}

- (void)setRelayLinkID:(unsigned __int16)a3
{
  int v3;
  NSObject *v5;
  int relayLinkID;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  IDSStunCandidatePair *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_relayLinkID != a3)
  {
    v3 = a3;
    OSLogHandleForTransportCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      relayLinkID = self->_relayLinkID;
      *(_DWORD *)buf = 67109634;
      v8 = relayLinkID;
      v9 = 1024;
      v10 = v3;
      v11 = 2112;
      v12 = self;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "update relay-link-id (%04x->%04x) for %@.", buf, 0x18u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update relay-link-id (%04x->%04x) for %@."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update relay-link-id (%04x->%04x) for %@."));
    }
    self->_relayLinkID = v3;
  }
}

- (void)setRemoteRelayLinkID:(unsigned __int16)a3
{
  int v3;
  NSObject *v5;
  int remoteRelayLinkID;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  IDSStunCandidatePair *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_remoteRelayLinkID != a3)
  {
    v3 = a3;
    OSLogHandleForTransportCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      remoteRelayLinkID = self->_remoteRelayLinkID;
      *(_DWORD *)buf = 67109634;
      v8 = remoteRelayLinkID;
      v9 = 1024;
      v10 = v3;
      v11 = 2112;
      v12 = self;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "update remote relay-link-id (%04x->%04x) for %@.", buf, 0x18u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update remote relay-link-id (%04x->%04x) for %@."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update remote relay-link-id (%04x->%04x) for %@."));
    }
    self->_remoteRelayLinkID = v3;
  }
}

- (void)setDelegatedLinkID:(char)a3
{
  int v3;
  NSObject *v5;
  int delegatedLinkID;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  IDSStunCandidatePair *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_delegatedLinkID != a3)
  {
    v3 = a3;
    OSLogHandleForTransportCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      delegatedLinkID = self->_delegatedLinkID;
      *(_DWORD *)buf = 67109634;
      v8 = delegatedLinkID;
      v9 = 1024;
      v10 = v3;
      v11 = 2112;
      v12 = self;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "update delegated linkID (%d->%d) for %@.", buf, 0x18u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update delegated linkID (%d->%d) for %@."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update delegated linkID (%d->%d) for %@."));
    }
    self->_delegatedLinkID = v3;
  }
}

- (void)setServerIsDegraded:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint8_t buf[4];
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  IDSStunCandidatePair *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_serverIsDegraded != a3)
  {
    v3 = a3;
    OSLogHandleForTransportCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("YES");
      if (self->_serverIsDegraded)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v9 = v7;
      v10 = 2112;
      if (!v3)
        v6 = CFSTR("NO");
      v11 = v6;
      v12 = 2112;
      v13 = self;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "update server degraded (%@->%@) for %@.", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update server degraded (%@->%@) for %@."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update server degraded (%@->%@) for %@."));
    }
    self->_serverIsDegraded = v3;
  }
}

- (void)setProtocolVersion:(unsigned __int8)a3 isInitiator:(BOOL)a4 enableSKE:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  NSObject *v9;
  int protocolVersion;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  NSString *sessionID;
  const __CFString *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  NSString *v29;
  uint64_t v30;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  OSLogHandleForTransportCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    protocolVersion = self->_protocolVersion;
    v11 = CFSTR("YES");
    if (self->_isInitiator)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    if (v6)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    sessionID = self->_sessionID;
    if (self->_enableSKE)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    *(_DWORD *)buf = 67110658;
    if (!v5)
      v11 = CFSTR("NO");
    v17 = protocolVersion;
    v18 = 1024;
    v19 = v7;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v15;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = sessionID;
    _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "update protocol version (%u->%u), isInitiator (%@->%@), enableSKE (%@->%@) for %@.", buf, 0x40u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update protocol version (%u->%u), isInitiator (%@->%@), enableSKE (%@->%@) for %@."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update protocol version (%u->%u), isInitiator (%@->%@), enableSKE (%@->%@) for %@."));
    }
  }
  self->_protocolVersion = v7;
  self->_isInitiator = v6;
  self->_enableSKE = v5;
}

- (void)deriveAES128CTRKeys:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  NSData *v8;
  NSData *hbhSalt;
  const char *v10;
  double v11;
  NSData *v12;
  NSData *encKey;
  const char *v14;
  double v15;
  NSData *v16;
  NSData *decKey;
  const char *v18;
  double v19;
  NSData *v20;
  NSData *hmacKey;
  NSObject *v22;
  NSData *v23;
  NSData *v24;
  NSData *v25;
  NSData *relaySessionKey;
  NSData *v27;
  NSObject *v28;
  uint8_t buf[4];
  NSData *v30;
  __int16 v31;
  NSData *v32;
  __int16 v33;
  NSData *v34;
  __int16 v35;
  NSData *v36;
  __int16 v37;
  NSData *v38;
  __int16 v39;
  IDSStunCandidatePair *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  if ((StunUtilDeriveHKDFSha256Keys(self->_relaySessionKey, self->_sessionID, self->_participantID, v4, (uint64_t)&v41) & 1) != 0)
  {
    v8 = (NSData *)objc_msgSend_copy(v4, v5, v6, v7);
    hbhSalt = self->_hbhSalt;
    self->_hbhSalt = v8;

    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v10, (uint64_t)&v41, v11, 16);
    v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    encKey = self->_encKey;
    self->_encKey = v12;

    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v14, (uint64_t)&v42, v15, 16);
    v16 = (NSData *)objc_claimAutoreleasedReturnValue();
    decKey = self->_decKey;
    self->_decKey = v16;

    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v18, (uint64_t)&v43, v19, 16);
    v20 = (NSData *)objc_claimAutoreleasedReturnValue();
    hmacKey = self->_hmacKey;
    self->_hmacKey = v20;

    OSLogHandleForTransportCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_encKey;
      v24 = self->_decKey;
      v25 = self->_hmacKey;
      relaySessionKey = self->_relaySessionKey;
      v27 = self->_hbhSalt;
      *(_DWORD *)buf = 138413570;
      v30 = v23;
      v31 = 2112;
      v32 = v24;
      v33 = 2112;
      v34 = v25;
      v35 = 2112;
      v36 = relaySessionKey;
      v37 = 2112;
      v38 = v27;
      v39 = 2112;
      v40 = self;
      _os_log_impl(&dword_19B949000, v22, OS_LOG_TYPE_DEFAULT, "derived AES128-CTR keys: %@, %@, %@ relaySessionKey = %@, salt = %@ for %@", buf, 0x3Eu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("derived AES128-CTR keys: %@, %@, %@ relaySessionKey = %@, salt = %@ for %@"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("derived AES128-CTR keys: %@, %@, %@ relaySessionKey = %@, salt = %@ for %@"));
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v28, OS_LOG_TYPE_DEFAULT, "StunUtilDeriveHKDFSha256Keys failed.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("StunUtilDeriveHKDFSha256Keys failed."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("StunUtilDeriveHKDFSha256Keys failed."));
      }
    }
  }

}

- (unint64_t)getParticipantIDHash:(id)a3
{
  __int128 v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  size_t v12;
  unint64_t data;
  _OWORD macOut[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  macOut[0] = v4;
  macOut[1] = v4;
  data = bswap64(objc_msgSend_unsignedLongLongValue(a3, a2, (uint64_t)a3, -3.72066208e-103));
  v8 = (const void *)objc_msgSend_bytes(self->_hmacKey, v5, v6, v7);
  v12 = objc_msgSend_length(self->_hmacKey, v9, v10, v11);
  CCHmac(2u, v8, v12, &data, 8uLL, macOut);
  return bswap64(*(unint64_t *)&macOut[0]);
}

- (void)_addParticipantIDs:(id)a3 toParticipantIDMap:(id)a4
{
  id v5;
  NSDictionary *Mutable;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  id v11;
  const char *v12;
  double v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  uint64_t ParticipantIDHash;
  const char *v31;
  id v32;
  double v33;
  const void *v34;
  const char *v35;
  double v36;
  void *v37;
  NSDictionary *participantIDMap;
  NSDictionary *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  Mutable = (NSDictionary *)a4;
  objc_msgSend_allKeys(Mutable, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = v5;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v41, v13, v45, 16);
  if (v14)
  {
    v18 = v14;
    v19 = *(_QWORD *)v42;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v42 != v19)
          objc_enumerationMutation(v11);
        v21 = (void *)MEMORY[0x1E0CB37E8];
        v22 = objc_msgSend_unsignedLongLongValue(*(void **)(*((_QWORD *)&v41 + 1) + 8 * v20), v15, v16, v17);
        objc_msgSend_numberWithUnsignedLongLong_(v21, v23, v22, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_containsObject_(v10, v26, (uint64_t)v25, v27) & 1) == 0)
        {
          ParticipantIDHash = objc_msgSend_getParticipantIDHash_(self, v28, (uint64_t)v25, v29);
          if (!Mutable)
            Mutable = (NSDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          v32 = v25;
          if (v32)
          {
            v34 = (const void *)objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v31, ParticipantIDHash, v33);
            CFDictionarySetValue((CFMutableDictionaryRef)Mutable, v34, v32);
          }

          objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v35, ParticipantIDHash, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
            CFDictionarySetValue((CFMutableDictionaryRef)Mutable, v32, v37);

        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v15, (uint64_t)&v41, v17, v45, 16);
    }
    while (v18);
  }

  participantIDMap = self->_participantIDMap;
  self->_participantIDMap = Mutable;
  v39 = Mutable;

}

- (void)initParticipantIDMap:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  NSObject *v15;
  uint8_t v16[16];

  v6 = a3;
  if (self->_hmacKey)
  {
    objc_msgSend_allParticipantIDs(self->_relaySessionInfo, v4, v5, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v12 = (void *)objc_msgSend_mutableCopy(v6, v8, v9, v11);
      objc_msgSend__addParticipantIDs_toParticipantIDMap_(self, v13, (uint64_t)v10, v14, v12);
    }
    else
    {
      v12 = 0;
      objc_msgSend__addParticipantIDs_toParticipantIDMap_(self, v8, (uint64_t)v10, v11, 0);
    }

  }
  else
  {
    OSLogHandleForTransportCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "initParticipantIDMap failed due to invalid hmac key.", v16, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("initParticipantIDMap failed due to invalid hmac key."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("initParticipantIDMap failed due to invalid hmac key."));
      }
    }
  }

}

- (void)updateParticipantIDMap:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  char linkID;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  id v16;
  id WeakRetained;
  char v18;
  id v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  char v29;
  uint8_t buf[16];

  v6 = a3;
  if (self->_hmacKey)
  {
    v8 = (void *)objc_msgSend_mutableCopy(self->_participantIDMap, v4, v5, v7);
    objc_msgSend__addParticipantIDs_toParticipantIDMap_(self, v9, (uint64_t)v6, v10, v8);
    linkID = self->_linkID;
    objc_msgSend_description(v8, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v29 = linkID;
    v16 = v15;
    v28 = v16;
    cut_dispatch_log_queue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      v19 = objc_loadWeakRetained((id *)&self->_delegate);
      v23 = (void *)objc_msgSend_copy(self->_participantIDMap, v20, v21, v22, v27, 3221225472, sub_19BAA7934, &unk_1E3C21F08, v16, v29);
      objc_msgSend_candidatePair_didReceiveMappedParticipantsDict_forLinkID_(v19, v24, (uint64_t)self, v25, v23, self->_linkID);

    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "updateParticipantIDMap failed due to invalid hmac key.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("updateParticipantIDMap failed due to invalid hmac key."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("updateParticipantIDMap failed due to invalid hmac key."));
      }
    }
  }

}

- (void)removeFromParticipantIDMap:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  __CFDictionary *v9;
  id v10;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  const void *v18;
  const char *v19;
  uint64_t ParticipantIDHash;
  double v21;
  _BOOL4 v22;
  _BOOL4 v23;
  const void *v24;
  NSObject *v25;
  int linkID;
  NSDictionary *participantIDMap;
  NSObject *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  int v37;
  __int16 v38;
  NSDictionary *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = v4;
  if (self->_hmacKey)
  {
    v8 = v4;
    v9 = (__CFDictionary *)objc_msgSend_mutableCopy(self->_participantIDMap, v5, v6, v7);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = v8;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v30, v12, v40, 16);
    if (v14)
    {
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v10);
          v18 = *(const void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          ParticipantIDHash = objc_msgSend_getParticipantIDHash_(self, v13, (uint64_t)v18, v15);
          if (v18)
            v22 = v9 != 0;
          else
            v22 = 0;
          if (v22)
            CFDictionaryRemoveValue(v9, v18);
          if (objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v19, ParticipantIDHash, v21))
            v23 = v9 != 0;
          else
            v23 = 0;
          if (v23)
          {
            v24 = (const void *)objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v13, ParticipantIDHash, v15);
            CFDictionaryRemoveValue(v9, v24);
          }
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v30, v15, v40, 16);
      }
      while (v14);
    }

    objc_storeStrong((id *)&self->_participantIDMap, v9);
    OSLogHandleForTransportCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      linkID = self->_linkID;
      participantIDMap = self->_participantIDMap;
      *(_DWORD *)buf = 138412802;
      v35 = v10;
      v36 = 1024;
      v37 = linkID;
      v38 = 2112;
      v39 = participantIDMap;
      _os_log_impl(&dword_19B949000, v25, OS_LOG_TYPE_DEFAULT, "removed %@ from participantID map for link %d:%@", buf, 0x1Cu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("removed %@ from participantID map for link %d:%@"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("removed %@ from participantID map for link %d:%@"));
      }
    }

  }
  else
  {
    OSLogHandleForTransportCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v28, OS_LOG_TYPE_DEFAULT, "removeFromParticipantIDMap failed due to invalid hmac key.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("removeFromParticipantIDMap failed due to invalid hmac key."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("removeFromParticipantIDMap failed due to invalid hmac key."));
      }
    }
  }

}

- (void)updateURIToParticipantIDMapping:(id)a3
{
  const __CFDictionary *v3;
  void *Value;
  id v5;
  id v6;
  const char *v7;
  double v8;
  NSDictionary *Mutable;
  NSDictionary *URIToParticipantIDs;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const __CFDictionary *v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  double v25;
  void *v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  id v37;
  const char *v38;
  double v39;
  id v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  double v55;
  const char *v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  void *v60;
  const __CFDictionary *theDict;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  const char *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFDictionary *)a3;
  Value = 0;
  theDict = v3;
  if (v3 && CFSTR("qal"))
    Value = (void *)CFDictionaryGetValue(v3, CFSTR("qal"));
  v5 = Value;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = v5;
  objc_msgSend_addObjectsFromArray_(v6, v7, (uint64_t)v5, v8);
  if (!self->_URIToParticipantIDs)
  {
    Mutable = (NSDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    URIToParticipantIDs = self->_URIToParticipantIDs;
    self->_URIToParticipantIDs = Mutable;

  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v6;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v64, v12, v72, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v65;
    v17 = 138412546;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v65 != v16)
          objc_enumerationMutation(obj);
        v19 = *(const __CFDictionary **)(*((_QWORD *)&v64 + 1) + 8 * i);
        if (v19)
          v20 = CFSTR("qri") == 0;
        else
          v20 = 1;
        if (v20)
          v21 = 0;
        else
          v21 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(*((_QWORD *)&v64 + 1) + 8 * i), CFSTR("qri"));
        v22 = (void *)MEMORY[0x1E0CB37E8];
        v23 = objc_msgSend_unsignedLongLongValue(v21, v13, v14, *(double *)&v17);
        objc_msgSend_numberWithUnsignedLongLong_(v22, v24, v23, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19 != 0 && CFSTR("tP") != 0)
        {
          v27 = (id)CFDictionaryGetValue(v19, CFSTR("tP"));
          if (v27)
          {
            v30 = v27;
            objc_msgSend_objectForKeyedSubscript_(self->_URIToParticipantIDs, v28, (uint64_t)v27, v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v31;
            if (v31)
            {
              if ((objc_msgSend_containsObject_(v31, v32, (uint64_t)v26, v33) & 1) == 0)
              {
                objc_msgSend_addObject_(v34, v35, (uint64_t)v26, v36);
                CFDictionarySetValue((CFMutableDictionaryRef)self->_URIToParticipantIDs, v30, v34);
              }
            }
            else
            {
              v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend_addObject_(v37, v38, (uint64_t)v26, v39);
              v40 = v37;
              if (v40)
              {
                CFDictionarySetValue((CFMutableDictionaryRef)self->_URIToParticipantIDs, v30, v40);
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v69 = (uint64_t)v30;
                v70 = 2080;
                v71 = "_URIToParticipantIDs";
                _os_log_error_impl(&dword_19B949000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
              }

            }
          }
        }

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v64, *(double *)&v17, v72, 16);
    }
    while (v15);
  }

  objc_msgSend_description(self->_URIToParticipantIDs, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (CFSTR("qai"))
    v45 = theDict != 0;
  else
    v45 = 0;
  if (v45)
  {
    v46 = (id)CFDictionaryGetValue(theDict, CFSTR("qai"));
    if (v46)
    {
      IDSLoggableDescriptionForObjectOnService(v44, v46);
      v47 = objc_claimAutoreleasedReturnValue();

      v44 = (void *)v47;
    }
  }
  else
  {
    v46 = 0;
  }
  OSLogHandleForTransportCategory();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v52 = objc_msgSend_count(self->_URIToParticipantIDs, v49, v50, v51);
    *(_DWORD *)buf = 134218242;
    v69 = v52;
    v70 = 2112;
    v71 = (const char *)v44;
    _os_log_impl(&dword_19B949000, v48, OS_LOG_TYPE_DEFAULT, "URIToParticipantIDs count %lu: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v59 = objc_msgSend_count(self->_URIToParticipantIDs, v53, v54, v55);
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("URIToParticipantIDs count %lu: %@"));
      if (_IDSShouldLog())
      {
        objc_msgSend_count(self->_URIToParticipantIDs, v56, v57, v58, v59, v44);
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("URIToParticipantIDs count %lu: %@"));
      }
    }
  }

}

- (unint64_t)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4
{
  id v6;
  NSDictionary *participantIDMap;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  participantIDMap = self->_participantIDMap;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v8, a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(participantIDMap, v11, (uint64_t)v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v17 = objc_msgSend_unsignedLongLongValue(v13, v14, v15, v16);
    v18 = IDSIDAliasHashUInt64(v17, v6);
    OSLogHandleForTransportCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218755;
      v32 = objc_msgSend_unsignedLongLongValue(v13, v20, v21, v22);
      v33 = 2048;
      v34 = a3;
      v35 = 2112;
      v36 = v6;
      v37 = 2049;
      v38 = v18;
      _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "createAliasForParticipantID real participantID %llu translated %llu salt %@ to alias %{private}llu", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v30 = objc_msgSend_unsignedLongLongValue(v13, v23, v24, v25);
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("createAliasForParticipantID real participantID %llu translated %llu salt %@ to alias %{private}llu"));
        if (_IDSShouldLog())
        {
          objc_msgSend_unsignedLongLongValue(v13, v26, v27, v28, v30, a3, v6, v18);
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("createAliasForParticipantID real participantID %llu translated %llu salt %@ to alias %{private}llu"));
        }
      }
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  id v6;
  NSDictionary *v7;
  const char *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_participantIDMap;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, v9, v27, 16);
  if (v12)
  {
    v14 = *(_QWORD *)v20;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v7);
        v16 = objc_msgSend_unsignedLongLongValue(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v15), v10, v11, v13);
        if (IDSIDAliasHashUInt64(v16, v6) == a3)
        {

          goto LABEL_17;
        }
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v19, v13, v27, 16);
      if (v12)
        continue;
      break;
    }
  }

  OSLogHandleForTransportCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v24 = a3;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "participantIDForAlias: No match found for alias %llu salt %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("participantIDForAlias: No match found for alias %llu salt %@"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("participantIDForAlias: No match found for alias %llu salt %@"));
    }
  }
  v16 = 0;
LABEL_17:

  return v16;
}

- (BOOL)_didLocalExternalAddressChange:(const sockaddr *)a3
{
  __int128 v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[4];
  char *v9;
  __int16 v10;
  char *v11;
  char v12[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char __str[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v26 = v4;
  v27 = v4;
  v24 = v4;
  v25 = v4;
  v22 = v4;
  v23 = v4;
  *(_OWORD *)__str = v4;
  v21 = v4;
  v18 = v4;
  v19 = v4;
  v16 = v4;
  v17 = v4;
  v14 = v4;
  v15 = v4;
  *(_OWORD *)v12 = v4;
  v13 = v4;
  v5 = objc_msgSend_external(self->_local, a2, (uint64_t)a3, -3.72066208e-103);
  OSLogHandleForTransportCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = SAToIPPortString(__str, 0x80uLL, v5);
    v10 = 2080;
    v11 = SAToIPPortString(v12, 0x80uLL, (uint64_t)a3);
    _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "original external address = %s, new external address = %s", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      SAToIPPortString(__str, 0x80uLL, v5);
      SAToIPPortString(v12, 0x80uLL, (uint64_t)a3);
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("original external address = %s, new external address = %s"));
      if (_IDSShouldLog())
      {
        SAToIPPortString(__str, 0x80uLL, v5);
        SAToIPPortString(v12, 0x80uLL, (uint64_t)a3);
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("original external address = %s, new external address = %s"));
      }
    }
  }
  return !IsSameSA((uint64_t)a3, v5) && a3->sa_family != 0;
}

- (void)addStunRequest:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  NSMutableArray *pendingStunRequests;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSObject *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  IDSStunCandidatePair *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend_containsObject_(self->_pendingStunRequests, v5, (uint64_t)v4, v6) & 1) == 0)
  {
    pendingStunRequests = self->_pendingStunRequests;
    if (!pendingStunRequests)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = self->_pendingStunRequests;
      self->_pendingStunRequests = v8;

      pendingStunRequests = self->_pendingStunRequests;
    }
    if (v4 && pendingStunRequests)
      CFArrayAppendValue((CFMutableArrayRef)pendingStunRequests, v4);
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = self;
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "add pending stun request: %@ for %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("add pending stun request: %@ for %@"));
  }

}

- (void)removeStunRequest:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  NSObject *v9;
  const char *v10;
  double v11;
  NSObject *v12;
  id v13;
  IDSStunCandidatePair *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  IDSStunCandidatePair *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_containsObject_(self->_pendingStunRequests, v5, (uint64_t)v4, v6))
  {
    objc_msgSend_removeObject_(self->_pendingStunRequests, v7, (uint64_t)v4, v8);
    OSLogHandleForTransportCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "remove pending stun request: %@ for %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v13 = v4;
        v14 = self;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("remove pending stun request: %@ for %@"));
        if (_IDSShouldLog())
        {
          v13 = v4;
          v14 = self;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("remove pending stun request: %@ for %@"));
        }
      }
    }
  }
  if (objc_msgSend_containsObject_(self->_repliedStunRequests, v7, (uint64_t)v4, v8, v13, v14))
  {
    objc_msgSend_removeObject_(self->_repliedStunRequests, v10, (uint64_t)v4, v11);
    OSLogHandleForTransportCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "remove replied stun request: %@ for %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("remove replied stun request: %@ for %@"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("remove replied stun request: %@ for %@"));
      }
    }
  }

}

- (BOOL)shouldRexmitStunRequest:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  char v9;

  v4 = a3;
  if ((objc_msgSend_containsObject_(self->_repliedStunRequests, v5, (uint64_t)v4, v6) & 1) != 0)
    v9 = 0;
  else
    v9 = objc_msgSend_containsObject_(self->_pendingStunRequests, v7, (uint64_t)v4, v8);

  return v9;
}

- (BOOL)shouldProcessStunResponse:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  int v8;
  double v9;
  NSMutableArray *repliedStunRequests;
  NSMutableArray *v11;
  NSMutableArray *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  IDSStunCandidatePair *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = objc_msgSend_containsObject_(self->_pendingStunRequests, v5, (uint64_t)v4, v6);
  if (v8)
  {
    repliedStunRequests = self->_repliedStunRequests;
    if (!repliedStunRequests)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = self->_repliedStunRequests;
      self->_repliedStunRequests = v11;

      repliedStunRequests = self->_repliedStunRequests;
    }
    if (v4 && repliedStunRequests)
      CFArrayAppendValue((CFMutableArrayRef)repliedStunRequests, v4);
    objc_msgSend_removeObject_(self->_pendingStunRequests, v7, (uint64_t)v4, v9);
  }
  else
  {
    OSLogHandleForTransportCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "stun request %@ is no longer pending for %@, ignore response.", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("stun request %@ is no longer pending for %@, ignore response."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("stun request %@ is no longer pending for %@, ignore response."));
      }
    }
  }

  return v8;
}

- (void)_savePluginNameForRequest:(id)a3 pluginName:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *pluginNameToStunReqID;
  id key;

  key = a3;
  v6 = a4;
  if (objc_msgSend_containsObject_(self->_pendingStunRequests, v7, (uint64_t)key, v8))
  {
    if (!self->_pluginNameToStunReqID)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      pluginNameToStunReqID = self->_pluginNameToStunReqID;
      self->_pluginNameToStunReqID = Mutable;

      if (!v6)
        goto LABEL_5;
      goto LABEL_4;
    }
    if (v6)
LABEL_4:
      CFDictionarySetValue((CFMutableDictionaryRef)self->_pluginNameToStunReqID, key, v6);
  }
LABEL_5:

}

- (id)_pluginNameForStunRequest:(id)a3
{
  void *Value;
  NSMutableDictionary *pluginNameToStunReqID;

  Value = 0;
  if (a3)
  {
    pluginNameToStunReqID = self->_pluginNameToStunReqID;
    if (pluginNameToStunReqID)
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)pluginNameToStunReqID, a3);
  }
  return Value;
}

- (void)_removeStunPluginRegistrationRequest:(id)a3
{
  double v3;

  objc_msgSend_removeObjectForKey_(self->_pluginNameToStunReqID, a2, (uint64_t)a3, v3);
}

- (void)updateStunSentBytes:(int64_t)a3 requestID:(id)a4
{
  id v6;
  uint64_t v7;
  double v8;
  void *Value;
  const char *v10;
  uint64_t v11;
  double v12;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *stunSentBytesToRequestID;
  void *v15;
  void *key;

  v6 = a4;
  if ((a3 & 0x8000000000000000) == 0)
  {
    Value = 0;
    key = v6;
    if (v6 && self->_stunSentBytesToRequestID)
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_stunSentBytesToRequestID, v6);
    v11 = a3 + objc_msgSend_unsignedIntValue(Value, (const char *)v6, v7, v8);
    if (!self->_stunSentBytesToRequestID)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      stunSentBytesToRequestID = self->_stunSentBytesToRequestID;
      self->_stunSentBytesToRequestID = Mutable;

    }
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v10, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      CFDictionarySetValue((CFMutableDictionaryRef)self->_stunSentBytesToRequestID, key, v15);

    v6 = key;
  }

}

- (unint64_t)getStunSentBytes:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  NSMutableDictionary *stunSentBytesToRequestID;
  void *Value;
  const char *v10;
  uint64_t v11;
  double v12;
  unsigned int v13;
  NSMutableDictionary *v14;

  v6 = a3;
  if (v6 && (stunSentBytesToRequestID = self->_stunSentBytesToRequestID) != 0)
  {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)stunSentBytesToRequestID, v6);
    v13 = objc_msgSend_unsignedIntValue(Value, v10, v11, v12);
  }
  else
  {
    v13 = objc_msgSend_unsignedIntValue(0, v4, v5, v7);
    if (!v6)
      goto LABEL_7;
  }
  v14 = self->_stunSentBytesToRequestID;
  if (v14)
    CFDictionaryRemoveValue((CFMutableDictionaryRef)v14, v6);
LABEL_7:

  return v13;
}

- (void)sendStatsRequest:(id)a3 options:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  double v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  char *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  BOOL v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  const void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  double v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *Value;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  void *v51;
  uint64_t v52;
  const char *v53;
  double v54;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *requestIDToStatsIDs;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  int linkID;
  id WeakRetained;
  const char *v62;
  double v63;
  const char *v64;
  uint64_t v65;
  double v66;
  NSObject *v67;
  NSObject *v68;
  const char *v70;
  double v71;
  NSMutableDictionary *v72;
  void *v73;
  const char *v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  char *v80;
  _QWORD v81[5];
  id v82;
  id v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  _WORD v87[17];

  *(_QWORD *)&v87[13] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v9 = a4;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend_requestID(v6, v7, v8, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = ids_monotonic_time();
    objc_msgSend_startTime(v6, v25, v26, v24);
    if (v29 == 0.0
      || (v31 = self->_statsIntervalInSeconds >> 1,
          v30 = v24 - v29,
          v32 = v24 - v29 < (double)v31,
          v24 = v29,
          v32))
    {
      if (v23 && (objc_msgSend_shouldRexmitStunRequest_(self, v27, (uint64_t)v23, v29, v30) & 1) == 0)
      {
        objc_msgSend_removeStunRequest_(self, v27, (uint64_t)v23, v29);
      }
      else
      {
        objc_msgSend_transactionID(v6, v27, v28, v29, v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        StunUtilCreateMessage(3811, v33, self, v9);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend_requestID(v34, v35, v36, v37);
          v38 = (const void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_setStartTime_(v34, v39, v40, v24);
          objc_msgSend_addStunRequest_(self, v41, (uint64_t)v38, v42);
          Value = 0;
          if (v9)
          {
            v43 = CFSTR("ids-extchannel-stat-identifier-key");
            if (CFSTR("ids-extchannel-stat-identifier-key"))
              Value = (void *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("ids-extchannel-stat-identifier-key"));
          }
          v49 = objc_msgSend_unsignedLongLongValue(Value, v43, v44, v45);
          v51 = 0;
          if (self->_requestIDToStatsIDs && v38)
            v51 = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_requestIDToStatsIDs, v38);
          v52 = objc_msgSend_unsignedLongLongValue(v51, v47, v48, v50);
          if (v49 && v49 != v52)
          {
            if (!self->_requestIDToStatsIDs)
            {
              Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
              requestIDToStatsIDs = self->_requestIDToStatsIDs;
              self->_requestIDToStatsIDs = Mutable;

            }
            objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v53, v49, v54);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            if (v57)
              CFDictionarySetValue((CFMutableDictionaryRef)self->_requestIDToStatsIDs, v38, v57);

            OSLogHandleForTransportCategory();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v85 = v49;
              v86 = 2112;
              *(_QWORD *)v87 = v38;
              _os_log_impl(&dword_19B949000, v58, OS_LOG_TYPE_DEFAULT, "add stats identifier %llu for %@.", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("add stats identifier %llu for %@."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("add stats identifier %llu for %@."));
              }
            }
          }
          OSLogHandleForTransportCategory();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            linkID = self->_linkID;
            *(_DWORD *)buf = 138412802;
            v85 = (uint64_t)v38;
            v86 = 1024;
            *(_DWORD *)v87 = linkID;
            v87[2] = 2048;
            *(_QWORD *)&v87[3] = v49;
            _os_log_impl(&dword_19B949000, v59, OS_LOG_TYPE_DEFAULT, "send stats req %@ for link %d, statsIdentifier: %llu.", buf, 0x1Cu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send stats req %@ for link %d, statsIdentifier: %llu."));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send stats req %@ for link %d, statsIdentifier: %llu."));
            }
          }
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend_sendStunMessage_candidatePair_(WeakRetained, v62, (uint64_t)v34, v63, self);

          if ((unint64_t)(objc_msgSend_transport(self->_local, v64, v65, v66) - 1) > 1)
          {
            v23 = (void *)v38;
            v6 = v34;
          }
          else
          {
            v81[0] = MEMORY[0x1E0C809B0];
            v81[1] = 3221225472;
            v81[2] = sub_19BAA97D8;
            v81[3] = &unk_1E3C20090;
            v81[4] = self;
            v6 = v34;
            v82 = v6;
            v83 = v9;
            IDSTransportThreadAddBlockAfter(v81, 1.0);

            v23 = (void *)v38;
          }
        }
        else
        {
          OSLogHandleForTransportCategory();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B949000, v67, OS_LOG_TYPE_DEFAULT, "failed to create stats request.", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create stats request."));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create stats request."));
            }
          }
          v6 = 0;
        }
      }
    }
    else
    {
      OSLogHandleForTransportCategory();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v85 = (uint64_t)v23;
        v86 = 1024;
        *(_DWORD *)v87 = v31;
        _os_log_impl(&dword_19B949000, v68, OS_LOG_TYPE_DEFAULT, "stats request %@ timed out after %u seconds.", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v77 = v23;
          v79 = v31;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("stats request %@ timed out after %u seconds."));
          if (_IDSShouldLog())
          {
            v77 = v23;
            v79 = v31;
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("stats request %@ timed out after %u seconds."));
          }
        }
      }
      objc_msgSend_removeStunRequest_(self, v70, (uint64_t)v23, v71, v77, v79);
      v72 = self->_requestIDToStatsIDs;
      if (v72)
      {
        if (v23)
        {
          v73 = (id)CFDictionaryGetValue((CFDictionaryRef)v72, v23);
          if (v73)
          {
            v76 = v73;
            objc_msgSend_removeObjectForKey_(self->_requestIDToStatsIDs, v74, (uint64_t)v23, v75);

          }
        }
      }
    }
    goto LABEL_59;
  }
  OSLogHandleForTransportCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v85 = (uint64_t)v15;
    v86 = 2080;
    *(_QWORD *)v87 = v16;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "skip stats request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v17, v18, v19);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip stats request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v20, v21, v22, v78, v80);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip stats request for %@, state [%s]."));
LABEL_59:

      }
    }
  }

}

- (void)sendInfoRequest:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  char *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  double v26;
  double v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  double v38;
  const char *v39;
  void *v40;
  double v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  const char *v49;
  double v50;
  const char *v51;
  double v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  double v56;
  char *v57;
  const char *v58;
  uint64_t v59;
  double v60;
  const char *v61;
  uint64_t v62;
  double v63;
  id WeakRetained;
  const char *v65;
  double v66;
  uint64_t v67;
  const char *v68;
  double v69;
  const char *v70;
  uint64_t v71;
  double v72;
  NSObject *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  char *v77;
  void *v78;
  void *v79;
  _QWORD v80[5];
  id v81;
  uint8_t buf[4];
  id v83;
  __int16 v84;
  char *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = v4;
  if (self->_state < 5)
  {
    objc_msgSend_requestID(v4, v5, v6, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v22 = ids_monotonic_time();
      objc_msgSend_startTime(v8, v23, v24, v22);
      v27 = v22 - v26;
      if (v27 >= 10.0)
      {
        OSLogHandleForTransportCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_transactionID(v8, v29, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v83 = v32;
          v84 = 1024;
          LODWORD(v85) = 10;
          _os_log_impl(&dword_19B949000, v28, OS_LOG_TYPE_DEFAULT, "info request %@ timed out after %d seconds.", buf, 0x12u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_transactionID(v8, v33, v34, v35);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = 10;
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("info request %@ timed out after %d seconds."));

            if (_IDSShouldLog())
            {
              objc_msgSend_transactionID(v8, v36, v37, v38, v74, 10);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = 10;
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("info request %@ timed out after %d seconds."));

            }
          }
        }
        GLUtilReportAWDStunMessageEvent(v8, 26, self, 0.0);
        GLUCreateQRStunMessageEvent(v8, 26, self, 0, 0.0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
          objc_msgSend__notifyQREventAdded_(self, v39, (uint64_t)v40, v41);
        objc_msgSend_removeStunRequest_(self, v39, (uint64_t)v21, v41, v74, v76);
        objc_msgSend_processSessionInfoRequestTimeout_(self, v42, (uint64_t)v21, v43);

        goto LABEL_38;
      }
    }
    else
    {
      StunUtilCreateMessage(3812, 0, self, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v44;
      if (!v44)
      {
        OSLogHandleForTransportCategory();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v73, OS_LOG_TYPE_DEFAULT, "failed to create info request.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create info request."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create info request."));
          }
        }
        v8 = 0;
        goto LABEL_38;
      }
      objc_msgSend_requestID(v44, v45, v46, v47);
      v48 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_addStunRequest_(self, v49, v48, v50);
      v21 = (void *)v48;
    }
    if ((objc_msgSend_shouldRexmitStunRequest_(self, v25, (uint64_t)v21, v27) & 1) != 0)
    {
      OSLogHandleForTransportCategory();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v54, v55, v56);
        v57 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v83 = v8;
        v84 = 2112;
        v85 = v57;
        _os_log_impl(&dword_19B949000, v53, OS_LOG_TYPE_DEFAULT, "send info request %@ for %@.", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v58, v59, v60);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send info request %@ for %@."));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v61, v62, v63, v8, v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send info request %@ for %@."));

          }
        }
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v67 = objc_msgSend_sendStunMessage_candidatePair_(WeakRetained, v65, (uint64_t)v8, v66, self);

      objc_msgSend_updateStunSentBytes_requestID_(self, v68, v67, v69, v21);
      if ((unint64_t)(objc_msgSend_transport(self->_local, v70, v71, v72) - 1) <= 1)
      {
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = sub_19BAA9E64;
        v80[3] = &unk_1E3C1FA08;
        v80[4] = self;
        v8 = v8;
        v81 = v8;
        IDSTransportThreadAddBlockAfter(v80, 1.0);

      }
    }
    else
    {
      objc_msgSend_removeStunRequest_(self, v51, (uint64_t)v21, v52);
    }
    goto LABEL_38;
  }
  OSLogHandleForTransportCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v83 = v13;
    v84 = 2080;
    v85 = v14;
    _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "skip info request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v15, v16, v17);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip info request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v18, v19, v20, v75, v77);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip info request for %@, state [%s]."));
LABEL_38:

      }
    }
  }

}

- (void)sendQRPluginRegistrationRequest:(id)a3 options:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  double v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  char *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  double v28;
  double v29;
  uint64_t v30;
  char shouldRexmitStunRequest;
  const char *v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  const char *v40;
  uint64_t v41;
  double v42;
  const char *v43;
  double v44;
  const char *v45;
  double v46;
  void *Value;
  int isEqualToNumber;
  __CFString *v49;
  const char *v50;
  __CFString *v51;
  double v52;
  const void *v53;
  void *v54;
  void *v55;
  const char *v56;
  double v57;
  const char *v58;
  double v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  double v63;
  char *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  const char *v68;
  uint64_t v69;
  double v70;
  id WeakRetained;
  const char *v72;
  double v73;
  uint64_t v74;
  const char *v75;
  double v76;
  const char *v77;
  uint64_t v78;
  double v79;
  NSObject *v80;
  const char *v81;
  uint64_t v82;
  double v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  double v87;
  const char *v88;
  uint64_t v89;
  double v90;
  const char *v91;
  void *v92;
  double v93;
  const char *v94;
  double v95;
  const char *v96;
  double v97;
  NSObject *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  char *v102;
  void *v103;
  void *v104;
  _QWORD v105[5];
  id v106;
  id v107;
  uint8_t buf[4];
  id v109;
  __int16 v110;
  char *v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v9 = a4;
  if (self->_state < 5)
  {
    objc_msgSend_requestID(v6, v7, v8, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v24 = ids_monotonic_time();
      objc_msgSend_startTime(v6, v25, v26, v24);
      v29 = v24 - v28;
      if (v29 >= 10.0)
      {
        OSLogHandleForTransportCategory();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_transactionID(v6, v81, v82, v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v109 = v84;
          v110 = 1024;
          LODWORD(v111) = 10;
          _os_log_impl(&dword_19B949000, v80, OS_LOG_TYPE_DEFAULT, "plugin registration request %@ timed out after %d seconds.", buf, 0x12u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_transactionID(v6, v85, v86, v87);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = 10;
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("plugin registration request %@ timed out after %d seconds."));

            if (_IDSShouldLog())
            {
              objc_msgSend_transactionID(v6, v88, v89, v90, v99, 10);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = 10;
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("plugin registration request %@ timed out after %d seconds."));

            }
          }
        }
        GLUtilReportAWDStunMessageEvent(v6, 26, self, 0.0);
        GLUCreateQRStunMessageEvent(v6, 33, self, 0, 0.0);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        if (v92)
          objc_msgSend__notifyQREventAdded_(self, v91, (uint64_t)v92, v93);
        objc_msgSend_removeStunRequest_(self, v91, (uint64_t)v23, v93, v99, v101);
        objc_msgSend__removeStunPluginRegistrationRequest_(self, v94, (uint64_t)v23, v95);

        goto LABEL_48;
      }
      v30 = (uint64_t)v23;
      shouldRexmitStunRequest = objc_msgSend_shouldRexmitStunRequest_(self, v27, (uint64_t)v23, v29);
    }
    else
    {
      StunUtilCreateMessage(3816, 0, self, v9);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encKey(self, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_initAES128CTR_(v6, v38, (uint64_t)v37, v39);

      if (!v6)
      {
        OSLogHandleForTransportCategory();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v98, OS_LOG_TYPE_DEFAULT, "failed to create QR plugin registration request.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create QR plugin registration request."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create QR plugin registration request."));
          }
        }
        v6 = 0;
        goto LABEL_48;
      }
      objc_msgSend_requestID(v6, v40, v41, v42);
      v30 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_addStunRequest_(self, v43, v30, v44);
      Value = 0;
      if (v9)
      {
        v45 = CFSTR("gl-option-plugin-operation");
        if (CFSTR("gl-option-plugin-operation"))
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("gl-option-plugin-operation"));
      }
      isEqualToNumber = objc_msgSend_isEqualToNumber_(Value, v45, (uint64_t)&unk_1E3C86B38, v46);
      v49 = CFSTR("Unregister");
      if (isEqualToNumber)
        v49 = CFSTR("Register");
      v51 = v49;
      v53 = 0;
      v54 = (void *)MEMORY[0x1E0CB3940];
      if (v9)
      {
        v50 = CFSTR("gl-option-plugin-name");
        if (CFSTR("gl-option-plugin-name"))
          v53 = CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("gl-option-plugin-name"));
      }
      objc_msgSend_stringWithFormat_(v54, v50, (uint64_t)CFSTR("%@.%@"), v52, v53, v51);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__savePluginNameForRequest_pluginName_(self, v56, v30, v57, v55);

      shouldRexmitStunRequest = objc_msgSend_shouldRexmitStunRequest_(self, v58, v30, v59);
    }
    if ((shouldRexmitStunRequest & 1) != 0)
    {
      OSLogHandleForTransportCategory();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v61, v62, v63);
        v64 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v109 = v6;
        v110 = 2112;
        v111 = v64;
        _os_log_impl(&dword_19B949000, v60, OS_LOG_TYPE_DEFAULT, "send QR plugin registration request %@ for %@.", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v65, v66, v67);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send QR plugin registration request %@ for %@."));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v68, v69, v70, v6, v103);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send QR plugin registration request %@ for %@."));

          }
        }
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v74 = objc_msgSend_sendStunMessage_candidatePair_(WeakRetained, v72, (uint64_t)v6, v73, self);

      objc_msgSend_updateStunSentBytes_requestID_(self, v75, v74, v76, v30);
      if ((unint64_t)(objc_msgSend_transport(self->_local, v77, v78, v79) - 1) <= 1)
      {
        v105[0] = MEMORY[0x1E0C809B0];
        v105[1] = 3221225472;
        v105[2] = sub_19BAAA5EC;
        v105[3] = &unk_1E3C20090;
        v105[4] = self;
        v6 = v6;
        v106 = v6;
        v107 = v9;
        IDSTransportThreadAddBlockAfter(v105, 1.0);

      }
    }
    else
    {
      objc_msgSend_removeStunRequest_(self, v32, v30, v33);
      objc_msgSend__removeStunPluginRegistrationRequest_(self, v96, v30, v97);
    }
    v23 = (void *)v30;
LABEL_48:

    goto LABEL_49;
  }
  OSLogHandleForTransportCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v109 = v15;
    v110 = 2080;
    v111 = v16;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "skip plugin registration request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v17, v18, v19);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip plugin registration request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v20, v21, v22, v100, v102);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip plugin registration request for %@, state [%s]."));
        goto LABEL_48;
      }
    }
  }
LABEL_49:

}

- (void)sendSessionInfoRequest:(id)a3 options:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  double v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  char *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  double v28;
  double v29;
  const void *v30;
  const char *v31;
  double v32;
  id WeakRetained;
  const char *v34;
  double v35;
  uint64_t v36;
  const char *v37;
  double v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  char *v43;
  const char *v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  const char *v49;
  double v50;
  const char *v51;
  void *v52;
  double v53;
  void *v54;
  const char *v55;
  double v56;
  const char *v57;
  uint64_t v58;
  double v59;
  const char *v60;
  double v61;
  const char *v62;
  uint64_t v63;
  double v64;
  void *Value;
  const char *v66;
  char v67;
  double v68;
  NSMutableDictionary *requestIDToQueryLinkIDs;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v71;
  void *v72;
  const char *v73;
  double v74;
  NSMutableDictionary *v75;
  NSMutableDictionary *requestIDToSessionInfoReqType;
  void *v77;
  void *v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  double v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  double v86;
  const char *v87;
  uint64_t v88;
  double v89;
  const char *v90;
  void *v91;
  double v92;
  const char *v93;
  double v94;
  const char *v95;
  double v96;
  const char *v97;
  double v98;
  NSObject *v99;
  NSObject *v100;
  const char *v101;
  uint64_t v102;
  double v103;
  char *v104;
  const char *v105;
  uint64_t v106;
  double v107;
  void *v108;
  void *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  _QWORD v113[5];
  id v114;
  id v115;
  uint8_t buf[4];
  id v117;
  __int16 v118;
  char *v119;
  __int16 v120;
  uint64_t v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v9 = a4;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend_requestID(v6, v7, v8, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v24 = ids_monotonic_time();
      objc_msgSend_startTime(v6, v25, v26, v24);
      v29 = v24 - v28;
      if (v29 >= 10.0)
      {
        OSLogHandleForTransportCategory();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_transactionID(v6, v80, v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v117 = v83;
          v118 = 1024;
          LODWORD(v119) = 10;
          _os_log_impl(&dword_19B949000, v79, OS_LOG_TYPE_DEFAULT, "session-info request %@ timed out after %d seconds.", buf, 0x12u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_transactionID(v6, v84, v85, v86);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = 10;
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("session-info request %@ timed out after %d seconds."));

            if (_IDSShouldLog())
            {
              objc_msgSend_transactionID(v6, v87, v88, v89, v108, 10);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = 10;
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("session-info request %@ timed out after %d seconds."));

            }
          }
        }
        GLUtilReportAWDStunMessageEvent(v6, 30, self, 0.0);
        GLUCreateQRStunMessageEvent(v6, 30, self, 0, 0.0);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        if (v91)
          objc_msgSend__notifyQREventAdded_(self, v90, (uint64_t)v91, v92);
        objc_msgSend_removeStunRequest_(self, v90, (uint64_t)v23, v92, v108, v110);
        objc_msgSend_processSessionInfoRequestTimeout_(self, v93, (uint64_t)v23, v94);

        goto LABEL_52;
      }
      v30 = v23;
    }
    else
    {
      StunUtilCreateMessage(3813, 0, self, v9);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v54;
      if (!v54)
      {
        OSLogHandleForTransportCategory();
        v99 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v99, OS_LOG_TYPE_DEFAULT, "failed to create session-info request.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create session-info request."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create session-info request."));
          }
        }
        v6 = 0;
        goto LABEL_52;
      }
      objc_msgSend_initAES128CTR_(v54, v55, (uint64_t)self->_encKey, v56);
      objc_msgSend_requestID(v6, v57, v58, v59);
      v30 = (const void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addStunRequest_(self, v60, (uint64_t)v30, v61);
      Value = 0;
      if (v9)
      {
        v62 = CFSTR("gl-option-sessioninfo-link-id-to-query");
        if (CFSTR("gl-option-sessioninfo-link-id-to-query"))
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("gl-option-sessioninfo-link-id-to-query"));
      }
      v67 = objc_msgSend_intValue(Value, v62, v63, v64);
      requestIDToQueryLinkIDs = self->_requestIDToQueryLinkIDs;
      if (!requestIDToQueryLinkIDs)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v71 = self->_requestIDToQueryLinkIDs;
        self->_requestIDToQueryLinkIDs = Mutable;

        requestIDToQueryLinkIDs = self->_requestIDToQueryLinkIDs;
      }
      objc_msgSend_numberWithChar_(MEMORY[0x1E0CB37E8], v66, v67, v68);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(requestIDToQueryLinkIDs, v73, (uint64_t)v72, v74, v30);

      if (!self->_requestIDToSessionInfoReqType)
      {
        v75 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        requestIDToSessionInfoReqType = self->_requestIDToSessionInfoReqType;
        self->_requestIDToSessionInfoReqType = v75;

      }
      if (v9)
      {
        v27 = CFSTR("gl-option-sessioninfo-request-type");
        if (CFSTR("gl-option-sessioninfo-request-type"))
        {
          v77 = (id)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("gl-option-sessioninfo-request-type"));
          if (v77)
          {
            v78 = v77;
            CFDictionarySetValue((CFMutableDictionaryRef)self->_requestIDToSessionInfoReqType, v30, v77);

          }
        }
      }
    }
    if ((objc_msgSend_shouldRexmitStunRequest_(self, v27, (uint64_t)v30, v29) & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v36 = objc_msgSend_sendStunMessage_candidatePair_(WeakRetained, v34, (uint64_t)v6, v35, self);

      if (v36 == -2)
      {
        OSLogHandleForTransportCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v40, v41, v42);
          v43 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v117 = v6;
          v118 = 2112;
          v119 = v43;
          _os_log_impl(&dword_19B949000, v39, OS_LOG_TYPE_DEFAULT, "error: failed to send session-info request %@ for %@ because it exceeds MTU size", buf, 0x16u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_candidatePairToken(self, v44, v46, v45);
            v108 = v6;
            v110 = objc_claimAutoreleasedReturnValue();
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("error: failed to send session-info request %@ for %@ because it exceeds MTU size"));

            if (_IDSShouldLog())
            {
              objc_msgSend_candidatePairToken(self, v44, v47, v45, v6, v110);
              v108 = v6;
              v110 = objc_claimAutoreleasedReturnValue();
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("error: failed to send session-info request %@ for %@ because it exceeds MTU size"));

            }
          }
        }
        objc_msgSend_removeStunRequest_(self, v44, (uint64_t)v30, v45, v108, v110);
        v48 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend_candidatePair_didReceiveSessionInfo_status_(v48, v49, (uint64_t)self, v50, 0, 1);

        GLUCreateQRStunMessageEvent(v6, 36, self, 0, 0.0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52)
          objc_msgSend__notifyQREventAdded_(self, v51, (uint64_t)v52, v53);

      }
      else
      {
        objc_msgSend_updateStunSentBytes_requestID_(self, v37, v36, v38, v30);
        OSLogHandleForTransportCategory();
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v101, v102, v103);
          v104 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v117 = v6;
          v118 = 2112;
          v119 = v104;
          v120 = 2048;
          v121 = v36;
          _os_log_impl(&dword_19B949000, v100, OS_LOG_TYPE_DEFAULT, "send session-info request %@ for %@, sentBytes: %lu", buf, 0x20u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_candidatePairToken(self, v105, v106, v107);
            v110 = objc_claimAutoreleasedReturnValue();
            v112 = v36;
            v108 = v6;
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send session-info request %@ for %@, sentBytes: %lu"));

            if (_IDSShouldLog())
            {
              objc_msgSend_candidatePairToken(self, v105, v106, v107, v6, v110, v36);
              v110 = objc_claimAutoreleasedReturnValue();
              v112 = v36;
              v108 = v6;
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send session-info request %@ for %@, sentBytes: %lu"));

            }
          }
        }
        if ((unint64_t)(objc_msgSend_transport(self->_local, v105, v106, v107, v108, v110, v112) - 1) <= 1)
        {
          v113[0] = MEMORY[0x1E0C809B0];
          v113[1] = 3221225472;
          v113[2] = sub_19BAAAF70;
          v113[3] = &unk_1E3C20090;
          v113[4] = self;
          v6 = v6;
          v114 = v6;
          v115 = v9;
          IDSTransportThreadAddBlockAfter(v113, 1.0);

        }
      }
    }
    else
    {
      objc_msgSend_removeStunRequest_(self, v31, (uint64_t)v30, v32);
      objc_msgSend_removeObjectForKey_(self->_requestIDToQueryLinkIDs, v95, (uint64_t)v30, v96);
      objc_msgSend_removeObjectForKey_(self->_requestIDToSessionInfoReqType, v97, (uint64_t)v30, v98);
    }
    v23 = (void *)v30;
LABEL_52:

    goto LABEL_53;
  }
  OSLogHandleForTransportCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v117 = v15;
    v118 = 2080;
    v119 = v16;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "skip session-info request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v17, v18, v19);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip session-info request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v20, v21, v22, v109, v111);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip session-info request for %@, state [%s]."));
        goto LABEL_52;
      }
    }
  }
LABEL_53:

}

- (void)sendPutMaterialRequest:(id)a3 options:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  double v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  char *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  const char *v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  char *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  double v52;
  BOOL v53;
  id WeakRetained;
  const char *v55;
  double v56;
  uint64_t v57;
  const char *v58;
  double v59;
  char v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  double v64;
  char *v65;
  const char *v66;
  uint64_t v67;
  double v68;
  const char *v69;
  uint64_t v70;
  double v71;
  const char *v72;
  void *v73;
  double v74;
  const char *v75;
  uint64_t v76;
  double v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  double v81;
  void *v82;
  const char *v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  void *v88;
  double v89;
  NSObject *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  char *v94;
  _QWORD v95[5];
  id v96;
  id v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  char *v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v9 = a4;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend_requestID(v6, v7, v8, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v24 = ids_monotonic_time();
      objc_msgSend_startTime(v6, v25, v26, v24);
      v29 = v24 - v28;
      if (v29 >= 10.0)
      {
        OSLogHandleForTransportCategory();
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_transactionID(v6, v79, v80, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v99 = v82;
          v100 = 1024;
          LODWORD(v101) = 10;
          _os_log_impl(&dword_19B949000, v78, OS_LOG_TYPE_DEFAULT, "PutMaterial request %@ timed out after %d seconds.", buf, 0x12u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_transactionID(v6, v83, v85, v84);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = 10;
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("PutMaterial request %@ timed out after %d seconds."));

            if (_IDSShouldLog())
            {
              objc_msgSend_transactionID(v6, v83, v86, v84, v91, 10);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = 10;
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("PutMaterial request %@ timed out after %d seconds."));

            }
          }
        }
        objc_msgSend_removeStunRequest_(self, v83, (uint64_t)v23, v84, v91, v93);
        GLUCreateQRStunMessageEventWithEventSubType(244, 40, self, 0, 10.0);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (v88)
          objc_msgSend__notifyQREventAdded_(self, v87, (uint64_t)v88, v89);

        goto LABEL_53;
      }
      v30 = v6;
    }
    else
    {
      StunUtilCreateMessage(3817, 0, self, v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v31;
      if (!v31)
      {
        OSLogHandleForTransportCategory();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v90, OS_LOG_TYPE_DEFAULT, "failed to create PutMaterial request.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create PutMaterial request."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create PutMaterial request."));
          }
        }
        v6 = 0;
        goto LABEL_53;
      }
      objc_msgSend_initAES128CTR_(v31, v32, (uint64_t)self->_encKey, v33);
      objc_msgSend_requestID(v30, v34, v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_addStunRequest_(self, v38, v37, v39);
      v23 = (void *)v37;
    }
    if ((objc_msgSend_shouldRexmitStunRequest_(self, v27, (uint64_t)v23, v29) & 1) != 0)
    {
      OSLogHandleForTransportCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v43, v44, v45);
        v46 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v99 = v30;
        v100 = 2112;
        v101 = v46;
        _os_log_impl(&dword_19B949000, v42, OS_LOG_TYPE_DEFAULT, "send PutMaterial request %@ for %@.", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v47, v48, v49);
          v91 = v30;
          v93 = objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send PutMaterial request %@ for %@."));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v50, v51, v52, v30, v93);
            v91 = v30;
            v93 = objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send PutMaterial request %@ for %@."));

          }
        }
      }
      v53 = v6 != 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v57 = objc_msgSend_sendStunMessage_candidatePair_(WeakRetained, v55, (uint64_t)v30, v56, self);

      v60 = v57 != -2 || v53;
      if ((v60 & 1) == 0)
      {
        OSLogHandleForTransportCategory();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v62, v63, v64);
          v65 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v99 = v30;
          v100 = 2112;
          v101 = v65;
          _os_log_impl(&dword_19B949000, v61, OS_LOG_TYPE_DEFAULT, "warning: send PutMaterial request %@ for %@ exceeds MTU size", buf, 0x16u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_candidatePairToken(self, v66, v67, v68);
            v91 = v30;
            v93 = objc_claimAutoreleasedReturnValue();
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("warning: send PutMaterial request %@ for %@ exceeds MTU size"));

            if (_IDSShouldLog())
            {
              objc_msgSend_candidatePairToken(self, v69, v70, v71, v30, v93);
              v91 = v30;
              v93 = objc_claimAutoreleasedReturnValue();
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("warning: send PutMaterial request %@ for %@ exceeds MTU size"));

            }
          }
        }
        GLUCreateQRStunMessageEvent(v30, 36, self, 0, 0.0);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (v73)
          objc_msgSend__notifyQREventAdded_(self, v72, (uint64_t)v73, v74);

      }
      objc_msgSend_updateStunSentBytes_requestID_(self, v58, v57, v59, v23, v91, v93);
      if ((unint64_t)(objc_msgSend_transport(self->_local, v75, v76, v77) - 1) <= 1)
      {
        v95[0] = MEMORY[0x1E0C809B0];
        v95[1] = 3221225472;
        v95[2] = sub_19BAAB78C;
        v95[3] = &unk_1E3C20090;
        v95[4] = self;
        v6 = v30;
        v96 = v6;
        v97 = v9;
        IDSTransportThreadAddBlockAfter(v95, 1.0);

        goto LABEL_53;
      }
    }
    else
    {
      objc_msgSend_removeStunRequest_(self, v40, (uint64_t)v23, v41);
    }
    v6 = v30;
    goto LABEL_53;
  }
  OSLogHandleForTransportCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v99 = v15;
    v100 = 2080;
    v101 = v16;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "skip PutMaterial request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v17, v18, v19);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip PutMaterial request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v20, v21, v22, v92, v94);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip PutMaterial request for %@, state [%s]."));
LABEL_53:

      }
    }
  }

}

- (void)sendParticipantUpdateRequest:(id)a3 options:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const __CFDictionary *v9;
  double v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  char *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  char *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  const char *v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  char *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  double v52;
  BOOL v53;
  id v54;
  const char *v55;
  double v56;
  uint64_t v57;
  const char *v58;
  double v59;
  char v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  double v64;
  char *v65;
  const char *v66;
  uint64_t v67;
  double v68;
  const char *v69;
  uint64_t v70;
  double v71;
  const char *v72;
  void *v73;
  double v74;
  const char *v75;
  uint64_t v76;
  double v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  double v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  double v85;
  const char *v86;
  uint64_t v87;
  double v88;
  const char *v89;
  void *v90;
  double v91;
  const char *v92;
  uint64_t v93;
  __CFDictionary *v94;
  double v95;
  void *Value;
  unsigned __int16 v97;
  const char *v98;
  double v99;
  void *v100;
  const char *v101;
  double v102;
  void *v103;
  NSObject *v104;
  id WeakRetained;
  const char *v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  char *v111;
  uint64_t v112;
  _QWORD v113[5];
  id v114;
  const __CFDictionary *v115;
  uint8_t buf[4];
  void *v117;
  __int16 v118;
  char *v119;
  __int16 v120;
  int v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v9 = (const __CFDictionary *)a4;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend_requestID(v6, v7, v8, v10);
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v24 = ids_monotonic_time();
      objc_msgSend_startTime(v6, v25, v26, v24);
      v29 = v24 - v28;
      if (v29 >= 10.0)
      {
        OSLogHandleForTransportCategory();
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_transactionID(v6, v79, v80, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v117 = v82;
          v118 = 2112;
          v119 = v23;
          v120 = 1024;
          v121 = 10;
          _os_log_impl(&dword_19B949000, v78, OS_LOG_TYPE_DEFAULT, "participant update request %@ requestID: %@ timed out after %d seconds.", buf, 0x1Cu);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_transactionID(v6, v83, v84, v85);
            v110 = v23;
            v112 = 10;
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("participant update request %@ requestID: %@ timed out after %d seconds."));

            if (_IDSShouldLog())
            {
              objc_msgSend_transactionID(v6, v86, v87, v88, v108, v23, 10);
              v110 = v23;
              v112 = 10;
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("participant update request %@ requestID: %@ timed out after %d seconds."));

            }
          }
        }
        GLUtilReportAWDStunMessageEvent(v6, 32, self, 0.0);
        GLUCreateQRStunMessageEvent(v6, 32, self, 0, 0.0);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        if (v90)
          objc_msgSend__notifyQREventAdded_(self, v89, (uint64_t)v90, v91);
        objc_msgSend_removeStunRequest_(self, v89, (uint64_t)v23, v91, v108, v110, v112);
        v94 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        Value = 0;
        if (v9)
        {
          v92 = CFSTR("gl-option-participant-update-request-type");
          if (CFSTR("gl-option-participant-update-request-type"))
            Value = (void *)CFDictionaryGetValue(v9, CFSTR("gl-option-participant-update-request-type"));
        }
        v97 = objc_msgSend_intValue(Value, v92, v93, v95);
        objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v98, v97, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        if (v100)
          CFDictionarySetValue(v94, CFSTR("ids-stun-attribute-session-state-type"), v100);

        objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v101, 2, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if (v103)
        {
          CFDictionarySetValue(v94, CFSTR("ids-stun-message-type"), v103);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_19BAF6528();
        }

        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v106, (uint64_t)self, v107, v94, 2);

        goto LABEL_62;
      }
      v30 = v6;
    }
    else
    {
      StunUtilCreateMessage(3815, 0, self, v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v31;
      if (!v31)
      {
        OSLogHandleForTransportCategory();
        v104 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v104, OS_LOG_TYPE_DEFAULT, "failed to create participant update request.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create participant update request."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create participant update request."));
          }
        }
        v6 = 0;
        goto LABEL_62;
      }
      objc_msgSend_initAES128CTR_(v31, v32, (uint64_t)self->_encKey, v33);
      objc_msgSend_requestID(v30, v34, v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_addStunRequest_(self, v38, v37, v39);
      v23 = (char *)v37;
    }
    if ((objc_msgSend_shouldRexmitStunRequest_(self, v27, (uint64_t)v23, v29) & 1) != 0)
    {
      OSLogHandleForTransportCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v43, v44, v45);
        v46 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v117 = v30;
        v118 = 2112;
        v119 = v46;
        _os_log_impl(&dword_19B949000, v42, OS_LOG_TYPE_DEFAULT, "send participant update request %@ for %@.", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v47, v48, v49);
          v108 = v30;
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send participant update request %@ for %@."));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v50, v51, v52, v30, v110);
            v108 = v30;
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send participant update request %@ for %@."));

          }
        }
      }
      v53 = v6 != 0;
      v54 = objc_loadWeakRetained((id *)&self->_delegate);
      v57 = objc_msgSend_sendStunMessage_candidatePair_(v54, v55, (uint64_t)v30, v56, self);

      v60 = v57 != -2 || v53;
      if ((v60 & 1) == 0)
      {
        OSLogHandleForTransportCategory();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v62, v63, v64);
          v65 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v117 = v30;
          v118 = 2112;
          v119 = v65;
          _os_log_impl(&dword_19B949000, v61, OS_LOG_TYPE_DEFAULT, "warning: send participant update request %@ for %@ exceeds MTU size", buf, 0x16u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_candidatePairToken(self, v66, v67, v68);
            v108 = v30;
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("warning: send participant update request %@ for %@ exceeds MTU size"));

            if (_IDSShouldLog())
            {
              objc_msgSend_candidatePairToken(self, v69, v70, v71, v30, v110);
              v108 = v30;
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("warning: send participant update request %@ for %@ exceeds MTU size"));

            }
          }
        }
        GLUCreateQRStunMessageEvent(v30, 36, self, 0, 0.0);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (v73)
          objc_msgSend__notifyQREventAdded_(self, v72, (uint64_t)v73, v74);

      }
      objc_msgSend_updateStunSentBytes_requestID_(self, v58, v57, v59, v23, v108, v110);
      if ((unint64_t)(objc_msgSend_transport(self->_local, v75, v76, v77) - 1) <= 1)
      {
        v113[0] = MEMORY[0x1E0C809B0];
        v113[1] = 3221225472;
        v113[2] = sub_19BAAC0B4;
        v113[3] = &unk_1E3C20090;
        v113[4] = self;
        v6 = v30;
        v114 = v6;
        v115 = v9;
        IDSTransportThreadAddBlockAfter(v113, 1.0);

        goto LABEL_62;
      }
    }
    else
    {
      objc_msgSend_removeStunRequest_(self, v40, (uint64_t)v23, v41);
    }
    v6 = v30;
    goto LABEL_62;
  }
  OSLogHandleForTransportCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v117 = v15;
    v118 = 2080;
    v119 = v16;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "skip participant update request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v17, v18, v19);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip participant update request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v20, v21, v22, v109, v111);
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip participant update request for %@, state [%s]."));
LABEL_62:

      }
    }
  }

}

- (BOOL)sendQUICGetMaterialRequest:(id)a3
{
  id v4;
  unint64_t v5;
  id WeakRetained;
  const char *v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  char *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  char *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v45;
  void *v46;
  void *v47;
  char *v48;
  _QWORD v49[6];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  char *v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_state - 3;
  if (v5 < 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v7, (uint64_t)v4, v8, self);

    v13 = objc_msgSend_transactionID(v4, v10, v11, v12);
    objc_msgSend_addProtoRequest_(self, v14, v13, v15);
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("%llu"), v17, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateStunSentBytes_requestID_(self, v19, v9, v20, v18);
    OSLogHandleForTransportCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_candidatePairToken(self, v22, v23, v24);
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v51 = v4;
      v52 = 2112;
      v53 = v25;
      v54 = 2048;
      v55 = v9;
      _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "send get material request %@ for %@, sentBytes: %lu", buf, 0x20u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        objc_msgSend_candidatePairToken(self, v26, v27, v28);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send get material request %@ for %@, sentBytes: %lu"));

        if (_IDSShouldLog())
        {
          objc_msgSend_candidatePairToken(self, v29, v30, v31, v4, v46, v9);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send get material request %@ for %@, sentBytes: %lu"));

        }
      }
    }
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = sub_19BAAC480;
    v49[3] = &unk_1E3C21F30;
    v49[4] = self;
    v49[5] = v13;
    IDSTransportThreadAddBlockAfter(v49, 10.0);
    goto LABEL_9;
  }
  OSLogHandleForTransportCategory();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v51 = v36;
    v52 = 2080;
    v53 = v37;
    _os_log_impl(&dword_19B949000, v32, OS_LOG_TYPE_DEFAULT, "skip get material request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v38, v39, v40);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip get material request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v41, v42, v43, v45, v48);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip get material request for %@, state [%s]."));
LABEL_9:

      }
    }
  }

  return v5 < 2;
}

- (BOOL)sendQUICPutMaterialRequest:(id)a3
{
  id v4;
  unint64_t v5;
  id WeakRetained;
  const char *v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  char *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  char *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v45;
  void *v46;
  void *v47;
  char *v48;
  _QWORD v49[6];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  char *v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_state - 3;
  if (v5 < 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v7, (uint64_t)v4, v8, self);

    v13 = objc_msgSend_transactionID(v4, v10, v11, v12);
    objc_msgSend_addProtoRequest_(self, v14, v13, v15);
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("%llu"), v17, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateStunSentBytes_requestID_(self, v19, v9, v20, v18);
    OSLogHandleForTransportCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_candidatePairToken(self, v22, v23, v24);
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v51 = v4;
      v52 = 2112;
      v53 = v25;
      v54 = 2048;
      v55 = v9;
      _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "send put material request %@ for %@, sentBytes: %lu", buf, 0x20u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        objc_msgSend_candidatePairToken(self, v26, v27, v28);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send put material request %@ for %@, sentBytes: %lu"));

        if (_IDSShouldLog())
        {
          objc_msgSend_candidatePairToken(self, v29, v30, v31, v4, v46, v9);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send put material request %@ for %@, sentBytes: %lu"));

        }
      }
    }
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = sub_19BAAC9F8;
    v49[3] = &unk_1E3C21F30;
    v49[4] = self;
    v49[5] = v13;
    IDSTransportThreadAddBlockAfter(v49, 10.0);
    goto LABEL_9;
  }
  OSLogHandleForTransportCategory();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v51 = v36;
    v52 = 2080;
    v53 = v37;
    _os_log_impl(&dword_19B949000, v32, OS_LOG_TYPE_DEFAULT, "skip put material request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v38, v39, v40);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip put material request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v41, v42, v43, v45, v48);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip put material request for %@, state [%s]."));
LABEL_9:

      }
    }
  }

  return v5 < 2;
}

- (void)sendTestRequest:(id)a3
{
  const char *v4;
  id v5;
  double v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  char *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  BOOL v20;
  void *v21;
  const char *v22;
  void *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  double v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  double v33;
  double v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  const char *v49;
  double v50;
  const char *v51;
  double v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  double v56;
  unsigned int testOptions;
  NSString *testSubOperation;
  void *v59;
  int linkID;
  const char *v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  NSString *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  double v69;
  void *v70;
  id WeakRetained;
  const char *v72;
  double v73;
  uint64_t v74;
  const char *v75;
  double v76;
  const char *v77;
  uint64_t v78;
  double v79;
  NSObject *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  _QWORD v86[5];
  id v87;
  uint8_t buf[4];
  _BYTE v89[24];
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  int v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    self->_testStartTime = 0.0;
    v20 = self->_testSubOperation == 0;
    v21 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v4, self->_testOptions, v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend_dictionaryWithObject_forKey_(v21, v22, (uint64_t)v23, v24, CFSTR("gl-option-test-options-flags"));
    else
      objc_msgSend_dictionaryWithObjectsAndKeys_(v21, v22, (uint64_t)v23, v24, CFSTR("gl-option-test-options-flags"), self->_testSubOperation, CFSTR("gl-option-test-sub-operation"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_requestID(v5, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v29 = ids_monotonic_time();
      objc_msgSend_startTime(v5, v30, v31, v29);
      v34 = v29 - v33;
      if (v34 >= 10.0)
      {
        OSLogHandleForTransportCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_transactionID(v5, v36, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v89 = v39;
          *(_WORD *)&v89[8] = 1024;
          *(_DWORD *)&v89[10] = 10;
          _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "test request %@ timed out after %d seconds.", buf, 0x12u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_transactionID(v5, v40, v42, v41);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = 10;
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("test request %@ timed out after %d seconds."));

            if (_IDSShouldLog())
            {
              objc_msgSend_transactionID(v5, v40, v43, v41, v81, 10);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = 10;
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("test request %@ timed out after %d seconds."));

            }
          }
        }
        objc_msgSend_removeStunRequest_(self, v40, (uint64_t)v28, v41, v81, v83);
LABEL_39:

        goto LABEL_40;
      }
    }
    else
    {
      StunUtilCreateMessage(2049, 0, self, v19);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v44;
      if (!v44)
      {
        OSLogHandleForTransportCategory();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v80, OS_LOG_TYPE_DEFAULT, "failed to create test request.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create test request."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create test request."));
          }
        }
        v5 = 0;
        goto LABEL_39;
      }
      objc_msgSend_requestID(v44, v45, v46, v47);
      v48 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_addStunRequest_(self, v49, v48, v50);
      v28 = (void *)v48;
    }
    if ((objc_msgSend_shouldRexmitStunRequest_(self, v32, (uint64_t)v28, v34) & 1) != 0)
    {
      OSLogHandleForTransportCategory();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        testOptions = self->_testOptions;
        testSubOperation = self->_testSubOperation;
        objc_msgSend_candidatePairToken(self, v54, v55, v56);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        linkID = self->_linkID;
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v89 = testOptions;
        *(_WORD *)&v89[4] = 2112;
        *(_QWORD *)&v89[6] = testSubOperation;
        *(_WORD *)&v89[14] = 2112;
        *(_QWORD *)&v89[16] = v5;
        v90 = 2112;
        v91 = v59;
        v92 = 2112;
        v93 = v28;
        v94 = 1024;
        v95 = linkID;
        _os_log_impl(&dword_19B949000, v53, OS_LOG_TYPE_DEFAULT, "send test(0x%x,%@) request %@ for %@, %@ link: %d", buf, 0x36u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v64 = self->_testOptions;
          v65 = self->_testSubOperation;
          objc_msgSend_candidatePairToken(self, v61, v62, v63);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = self->_linkID;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send test(0x%x,%@) request %@ for %@, %@ link: %d"));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v67, v68, v69, v64, v65, v5, v66, v28, v85);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send test(0x%x,%@) request %@ for %@, %@ link: %d"));

          }
        }
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v74 = objc_msgSend_sendStunMessage_candidatePair_(WeakRetained, v72, (uint64_t)v5, v73, self);

      objc_msgSend_updateStunSentBytes_requestID_(self, v75, v74, v76, v28);
      if ((unint64_t)(objc_msgSend_transport(self->_local, v77, v78, v79) - 1) <= 1)
      {
        v86[0] = MEMORY[0x1E0C809B0];
        v86[1] = 3221225472;
        v86[2] = sub_19BAAD2D0;
        v86[3] = &unk_1E3C1FA08;
        v86[4] = self;
        v5 = v5;
        v87 = v5;
        IDSTransportThreadAddBlockAfter(v86, 1.0);

      }
    }
    else
    {
      objc_msgSend_removeStunRequest_(self, v51, (uint64_t)v28, v52);
    }
    goto LABEL_39;
  }
  OSLogHandleForTransportCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v89 = v11;
    *(_WORD *)&v89[8] = 2080;
    *(_QWORD *)&v89[10] = v12;
    _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "skip test request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v13, v14, v15);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip test request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v16, v17, v18, v82, v84);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip test request for %@, state [%s]."));
LABEL_40:

      }
    }
  }

}

- (void)_handleLinkProbingTimer
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  id WeakRetained;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  uint8_t buf[4];
  IDSStunCandidatePair *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v29 = CFSTR("gl-attr-active-probing-link-id");
  objc_msgSend_numberWithChar_(MEMORY[0x1E0CB37E8], a2, self->_linkID, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v4;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v30, v6, &v29, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_remoteRelayLinkID)
  {
    v27[0] = CFSTR("gl-attr-active-probing-link-id");
    objc_msgSend_numberWithChar_(MEMORY[0x1E0CB37E8], v8, self->_linkID, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    v27[1] = CFSTR("gl-attr-remote-relay-link-id");
    objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v11, self->_remoteRelayLinkID, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v13;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v28, v15, v27, 2);
    v16 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v16;
  }
  OSLogHandleForTransportCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = self;
    _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "_handleLinkProbingTimer for %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_handleLinkProbingTimer for %@"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_handleLinkProbingTimer for %@"));
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_candidatePairToken(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendProbingRequestWithoptions_candidatePairToken_(WeakRetained, v23, (uint64_t)v7, v24, v22);

}

- (void)startLinkProbingTimer:(unsigned int)a3
{
  NSObject *probingTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  NSObject *v10;
  OS_dispatch_source *v11;
  _QWORD handler[5];
  uint8_t buf[4];
  OS_dispatch_source *v14;
  __int16 v15;
  IDSStunCandidatePair *v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  probingTimer = self->_probingTimer;
  if (probingTimer)
    dispatch_source_cancel(probingTimer);
  im_primary_queue();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);
  v8 = self->_probingTimer;
  self->_probingTimer = v7;

  dispatch_source_set_timer((dispatch_source_t)self->_probingTimer, 0, (unint64_t)((double)a3 / 1000.0 * 1000000000.0), 0xF4240uLL);
  v9 = self->_probingTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_19BAAD730;
  handler[3] = &unk_1E3C1F898;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_probingTimer);
  OSLogHandleForTransportCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_probingTimer;
    *(_DWORD *)buf = 134218498;
    v14 = v11;
    v15 = 2112;
    v16 = self;
    v17 = 1024;
    v18 = a3;
    _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "start link probing timer %p for %@, interval: %u", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("start link probing timer %p for %@, interval: %u"));
    if (_IDSShouldLog())
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("start link probing timer %p for %@, interval: %u"));
  }
}

- (void)stopLinkProbingTimer
{
  NSObject *probingTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  uint8_t buf[4];
  OS_dispatch_source *v8;
  __int16 v9;
  IDSStunCandidatePair *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  probingTimer = self->_probingTimer;
  if (probingTimer)
  {
    dispatch_source_cancel(probingTimer);
    OSLogHandleForTransportCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_probingTimer;
      *(_DWORD *)buf = 134218242;
      v8 = v5;
      v9 = 2112;
      v10 = self;
      _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "stop link probing timer %p for %@.", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("stop link probing timer %p for %@."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("stop link probing timer %p for %@."));
    }
    v6 = self->_probingTimer;
    self->_probingTimer = 0;

  }
}

- (BOOL)processStatsResponse:(id)a3 arrivalTime:(double)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  int shouldProcessStunResponse;
  char HasValidUInt32Attr;
  int v15;
  unsigned int v16;
  double v17;
  double serverLatency;
  double v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  int v26;
  int linkID;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *Value;
  id v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  NSMutableDictionary *requestIDToStatsIDs;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  double v47;
  __CFDictionary *v48;
  const char *v49;
  double v50;
  void *v51;
  NSObject *v52;
  const char *v53;
  double v54;
  void *v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  int v61;
  const char *v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  double v68;
  id WeakRetained;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSMutableDictionary *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  _BYTE v87[10];
  __int16 v88;
  int v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_requestID(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v11, (uint64_t)v10, v12);

  if (shouldProcessStunResponse)
  {
    v83 = 0;
    HasValidUInt32Attr = StunUtilHasValidUInt32Attr((uint64_t)v6, 65523, &v83);
    if ((HasValidUInt32Attr & 1) != 0)
    {
      v15 = ntpTime32(a4);
      v16 = (v15 - v83) >> 16;
      v17 = (double)(unsigned __int16)(v15 - v83) * 0.0000152587891 + (double)v16;
      serverLatency = self->_serverLatency;
      if (serverLatency == 0.0)
        v19 = (double)(unsigned __int16)(v15 - v83) * 0.0000152587891 + (double)v16;
      else
        v19 = v17 * 0.1 + serverLatency * 0.9;
      self->_serverLatency = v19;
      v20 = (int)(v17 * 1000.0);
      OSLogHandleForTransportCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_requestID(v6, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (int)(self->_serverLatency * 1000.0);
        linkID = self->_linkID;
        *(_DWORD *)buf = 138413058;
        v85 = (uint64_t)v25;
        v86 = 1024;
        *(_DWORD *)v87 = linkID;
        *(_WORD *)&v87[4] = 1024;
        *(_DWORD *)&v87[6] = v20;
        v88 = 1024;
        v89 = v26;
        _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "recv stats resp %@ (link: %2d rtt: %5d ms mean: %5d ms).", buf, 0x1Eu);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_requestID(v6, v28, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v20;
          v82 = (int)(self->_serverLatency * 1000.0);
          v75 = v31;
          v78 = self->_linkID;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("recv stats resp %@ (link: %2d rtt: %5d ms mean: %5d ms)."));

          if (_IDSShouldLog())
          {
            objc_msgSend_requestID(v6, v28, v29, v30, v31, v78, v20, v82);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = v20;
            v82 = (int)(self->_serverLatency * 1000.0);
            v75 = v32;
            v78 = self->_linkID;
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("recv stats resp %@ (link: %2d rtt: %5d ms mean: %5d ms)."));

          }
        }
      }
      objc_msgSend_requestID(v6, v28, v29, v30, v75, v78, v81, v82);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      Value = 0;
      if (self->_requestIDToStatsIDs && v33)
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_requestIDToStatsIDs, v33);
      v35 = Value;
      OSLogHandleForTransportCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v40 = objc_msgSend_unsignedLongLongValue(v35, v37, v38, v39);
        requestIDToStatsIDs = self->_requestIDToStatsIDs;
        *(_DWORD *)buf = 134218242;
        v85 = v40;
        v86 = 2112;
        *(_QWORD *)v87 = requestIDToStatsIDs;
        _os_log_impl(&dword_19B949000, v36, OS_LOG_TYPE_DEFAULT, "statsIdentifier: %llu, requestIDToStatsIDs: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v76 = objc_msgSend_unsignedLongLongValue(v35, v42, v43, v44);
          v79 = self->_requestIDToStatsIDs;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("statsIdentifier: %llu, requestIDToStatsIDs: %@"));
          if (_IDSShouldLog())
          {
            objc_msgSend_unsignedLongLongValue(v35, v45, v46, v47, v76, v79);
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("statsIdentifier: %llu, requestIDToStatsIDs: %@"));
          }
        }
      }
      if (v35)
      {
        v48 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        CFDictionarySetValue(v48, CFSTR("gl-option-stats-identifier"), v35);
        objc_msgSend_numberWithChar_(MEMORY[0x1E0CB37E8], v49, self->_linkID, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          CFDictionarySetValue(v48, CFSTR("gl-option-linkid"), v51);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_19BAF9810();
        }

        objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v53, v20, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          CFDictionarySetValue(v48, CFSTR("gl-option-stats-server-timestamp"), v55);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_19BAF9790();
        }

        OSLogHandleForTransportCategory();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v60 = objc_msgSend_unsignedLongLongValue(v35, v57, v58, v59);
          v61 = self->_linkID;
          *(_DWORD *)buf = 134218496;
          v85 = v60;
          v86 = 1024;
          *(_DWORD *)v87 = v61;
          *(_WORD *)&v87[4] = 1024;
          *(_DWORD *)&v87[6] = v20;
          _os_log_impl(&dword_19B949000, v56, OS_LOG_TYPE_DEFAULT, "processStatsResponse: statsIdentifier: %llu, linkID: %d, rtt: %d ms", buf, 0x18u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v65 = objc_msgSend_unsignedLongLongValue(v35, v62, v63, v64);
            v80 = self->_linkID;
            v77 = v65;
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processStatsResponse: statsIdentifier: %llu, linkID: %d, rtt: %d ms"));
            if (_IDSShouldLog())
            {
              objc_msgSend_unsignedLongLongValue(v35, v66, v67, v68, v77, v80, v20);
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processStatsResponse: statsIdentifier: %llu, linkID: %d, rtt: %d ms"));
            }
          }
        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend_candidatePair_didReceiveSessionStats_success_(WeakRetained, v70, (uint64_t)self, v71, v48, 1);

        objc_msgSend_removeObjectForKey_(self->_requestIDToStatsIDs, v72, (uint64_t)v33, v73);
      }

    }
    else
    {
      OSLogHandleForTransportCategory();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v52, OS_LOG_TYPE_DEFAULT, "receive invalid stats response, missing client-timestamp.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive invalid stats response, missing client-timestamp."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive invalid stats response, missing client-timestamp."));
        }
      }
    }
  }
  else
  {
    HasValidUInt32Attr = 1;
  }

  return HasValidUInt32Attr;
}

- (BOOL)_optionallyCheckEncMarker:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;
  unsigned int v6;
  NSObject *v7;
  int v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  int v13;
  unsigned int __b[368];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  memset(__b, 170, sizeof(__b));
  v9 = 0;
  if (!StunUtilHasValidBinaryDataAttr(v3, 60934, __b, &v9))
    goto LABEL_4;
  if (v9 != 4)
  {
    OSLogHandleForTransportCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v9;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "optionallyCheckEncMarker failed due to invalid marker length (%d)", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("optionallyCheckEncMarker failed due to invalid marker length (%d)"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("optionallyCheckEncMarker failed due to invalid marker length (%d)"));
      }
    }
    goto LABEL_17;
  }
  if (__b[0] != 1414938954)
  {
    v6 = bswap32(__b[0]);
    OSLogHandleForTransportCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v11 = v6;
      v12 = 1024;
      v13 = 1245795924;
      _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "optionallyCheckEncMarker failed due to marker mismatch (%08X != %08X).", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("optionallyCheckEncMarker failed due to marker mismatch (%08X != %08X)."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("optionallyCheckEncMarker failed due to marker mismatch (%08X != %08X)."));
      }
    }
LABEL_17:
    v4 = 0;
    goto LABEL_18;
  }
LABEL_4:
  v4 = 1;
LABEL_18:

  return v4;
}

- (BOOL)processInfoResponse:(id)a3 packetBuffer:(id *)a4 headerOverhead:(unint64_t)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  int shouldProcessStunResponse;
  NSObject *v16;
  int HasValidXorMappedAddress;
  __int128 v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  char *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  void *v32;
  const char *v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  int64_t var2;
  void *v39;
  const char *v40;
  double v41;
  uint64_t StunSentBytes;
  unint64_t v43;
  NSObject *v44;
  void *v46;
  void *v47;
  uint64_t v48;
  uint8_t v49[4];
  char *v50;
  _OWORD v51[8];
  uint8_t buf[16];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend_requestID(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v13, (uint64_t)v12, v14);

  if (shouldProcessStunResponse)
  {
    if ((StunUtilHasValidChannelNumber(v8, self->_channelNumber, 0) & 1) != 0 || self->_state < 3)
    {
      *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v58 = v18;
      v59 = v18;
      v56 = v18;
      v57 = v18;
      v54 = v18;
      v55 = v18;
      *(_OWORD *)buf = v18;
      v53 = v18;
      v51[6] = v18;
      v51[7] = v18;
      v51[4] = v18;
      v51[5] = v18;
      v51[2] = v18;
      v51[3] = v18;
      v51[0] = v18;
      v51[1] = v18;
      HasValidXorMappedAddress = StunUtilHasValidXorMappedAddress((uint64_t)v8, v51);
      if (HasValidXorMappedAddress)
      {
        OSLogHandleForTransportCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v49 = 136315138;
          v50 = SAToIPPortString((char *)buf, 0x80uLL, (uint64_t)v51);
          _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "Got info response with xor-mapped-address [%s]", v49, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            SAToIPPortString((char *)buf, 0x80uLL, (uint64_t)v51);
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Got info response with xor-mapped-address [%s]"));
            if (_IDSShouldLog())
            {
              SAToIPPortString((char *)buf, 0x80uLL, (uint64_t)v51);
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Got info response with xor-mapped-address [%s]"));
            }
          }
        }
        OSLogHandleForTransportCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v21, v22, v23);
          v24 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v49 = 138412290;
          v50 = v24;
          _os_log_impl(&dword_19B949000, v20, OS_LOG_TYPE_DEFAULT, "receive info-response for %@.", v49, 0xCu);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_candidatePairToken(self, v25, v26, v27);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive info-response for %@."));

            if (_IDSShouldLog())
            {
              objc_msgSend_candidatePairToken(self, v28, v29, v30, v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive info-response for %@."));

            }
          }
        }
        StunUtilProcessActiveParticipants(v8);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        StunUtilProcessLightweightParticipants(v8);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend__optionallyCheckEncMarker_(self, v33, (uint64_t)v8, v34))
        {
          var2 = a4->var2;
          objc_msgSend_requestID(v8, v35, v36, v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          StunSentBytes = objc_msgSend_getStunSentBytes_(self, v40, (uint64_t)v39, v41);

          v43 = var2 + a5;
        }
        else
        {
          v43 = 0;
          StunSentBytes = 0;
        }
        BYTE4(v48) = 0;
        LODWORD(v48) = 0;
        objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v35, 0, v37, v31, v32, 0, 0, StunSentBytes, v43, 1, v48);

      }
      else
      {
        OSLogHandleForTransportCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v49 = 0;
          _os_log_impl(&dword_19B949000, v44, OS_LOG_TYPE_DEFAULT, "processInfoResponse failed due to invalid xor-mapped-address.", v49, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processInfoResponse failed due to invalid xor-mapped-address."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processInfoResponse failed due to invalid xor-mapped-address."));
          }
        }
      }
    }
    else
    {
      OSLogHandleForTransportCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "processInfoResponse failed due to invalid channel-number.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processInfoResponse failed due to invalid channel-number."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processInfoResponse failed due to invalid channel-number."));
        }
      }
      LOBYTE(HasValidXorMappedAddress) = 0;
    }
  }
  else
  {
    LOBYTE(HasValidXorMappedAddress) = 1;
  }

  return HasValidXorMappedAddress;
}

- (BOOL)processSessionInfoResponse:(id)a3 packetBuffer:(id *)a4 headerOverhead:(unint64_t)a5 isLightweightParticipant:(BOOL)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  int shouldProcessStunResponse;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  id v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  const char *v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  double v45;
  NSMutableDictionary *requestIDToQueryLinkIDs;
  void *v47;
  void *Value;
  const char *v49;
  uint64_t v50;
  double v51;
  char v52;
  NSObject *v53;
  BOOL v54;
  const __CFDictionary *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  int v59;
  void *v60;
  int64_t var2;
  const char *v62;
  uint64_t v63;
  double v64;
  void *v65;
  const char *v66;
  double v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  double v71;
  NSMutableDictionary *requestIDToSessionInfoReqType;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  double v77;
  int v78;
  const char *v79;
  double v80;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t StunSentBytes;
  uint8_t buf[4];
  id v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend_requestID(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v15, (uint64_t)v14, v16);

  if (!shouldProcessStunResponse)
  {
LABEL_35:
    v54 = 1;
    goto LABEL_36;
  }
  if ((StunUtilHasValidChannelNumber(v10, self->_channelNumber, 0) & 1) != 0)
  {
    OSLogHandleForTransportCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_requestID(v10, v19, v20, v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_candidatePairToken(self, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v88 = v22;
      v89 = 2112;
      v90 = v26;
      _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "receive session-info response %@ for %@.", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        objc_msgSend_requestID(v10, v27, v29, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_candidatePairToken(self, v31, v32, v33);
        v82 = v30;
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive session-info response %@ for %@."));

        if (_IDSShouldLog())
        {
          objc_msgSend_requestID(v10, v27, v34, v28, v30, v83);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_candidatePairToken(self, v36, v37, v38);
          v82 = v35;
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive session-info response %@ for %@."));

        }
      }
    }
    if (objc_msgSend__optionallyCheckEncMarker_(self, v27, (uint64_t)v10, v28, v82, v83))
    {
      if (self->_requestIDToQueryLinkIDs)
      {
        objc_msgSend_requestID(v10, v39, v40, v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          requestIDToQueryLinkIDs = self->_requestIDToQueryLinkIDs;
          objc_msgSend_requestID(v10, v42, v43, v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)requestIDToQueryLinkIDs, v47);
          v52 = objc_msgSend_intValue(Value, v49, v50, v51);

        }
        else
        {
          v52 = objc_msgSend_intValue(0, v42, v43, v45);
        }

      }
      else
      {
        v52 = objc_msgSend_intValue(0, v39, v40, v41);
      }
      StunUtilProcessStreamInfo(v10, self->_linkID, v52);
      v55 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v60 = 0;
      if (v55 && CFSTR("stream-info-peer-published-streams"))
        v60 = (void *)CFDictionaryGetValue(v55, CFSTR("stream-info-peer-published-streams"));
      StunUtilProcessParticipants(v60, self->_participantID, a6);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      StunUtilProcessLightweightParticipants(v10);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      var2 = a4->var2;
      objc_msgSend_requestID(v10, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      StunSentBytes = objc_msgSend_getStunSentBytes_(self, v66, (uint64_t)v65, v67);

      v59 = 0;
      v57 = var2 + a5;
    }
    else
    {
      v55 = 0;
      v56 = 0;
      v57 = 0;
      StunSentBytes = 0;
      v58 = 0;
      v59 = 4;
    }
    if (self->_requestIDToSessionInfoReqType)
    {
      objc_msgSend_requestID(v10, v39, v40, v41);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70)
      {
        requestIDToSessionInfoReqType = self->_requestIDToSessionInfoReqType;
        objc_msgSend_requestID(v10, v68, v69, v71);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)CFDictionaryGetValue((CFDictionaryRef)requestIDToSessionInfoReqType, v73);
        v78 = objc_msgSend_intValue(v74, v75, v76, v77);

      }
      else
      {
        v78 = objc_msgSend_intValue(0, v68, v69, v71);
      }

    }
    else
    {
      v78 = objc_msgSend_intValue(0, v39, v40, v41);
    }
    BYTE4(v85) = 0;
    HIDWORD(v84) = v59;
    LODWORD(v85) = 0;
    BYTE1(v84) = v78 == 2;
    LOBYTE(v84) = 0;
    objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v79, (uint64_t)v55, v80, v56, v58, 0, 0, StunSentBytes, v57, v84, v85);

    goto LABEL_35;
  }
  OSLogHandleForTransportCategory();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v53, OS_LOG_TYPE_DEFAULT, "processSessionInfoResponse failed due to invalid channel-number.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processSessionInfoResponse failed due to invalid channel-number."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processSessionInfoResponse failed due to invalid channel-number."));
    }
  }
  v54 = 0;
LABEL_36:

  return v54;
}

- (BOOL)processTestResponse:(id)a3 arrivalTime:(double)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  int shouldProcessStunResponse;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  const char *v21;
  uint64_t v22;
  double v23;
  BOOL v24;
  NSObject *v25;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_requestID(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v10, (uint64_t)v9, v11);

  if (!shouldProcessStunResponse)
  {
LABEL_9:
    v24 = 1;
    goto LABEL_17;
  }
  if ((StunUtilHasValidChannelNumber(v5, self->_channelNumber, 0) & 1) != 0)
  {
    OSLogHandleForTransportCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_candidatePairToken(self, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v17;
      _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "receive test response for %@.", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        objc_msgSend_candidatePairToken(self, v18, v19, v20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive test response for %@."));

        if (_IDSShouldLog())
        {
          objc_msgSend_candidatePairToken(self, v21, v22, v23, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive test response for %@."));

        }
      }
    }
    goto LABEL_9;
  }
  OSLogHandleForTransportCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v25, OS_LOG_TYPE_DEFAULT, "processTestResponse failed due to invalid channel-number.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processTestResponse failed due to invalid channel-number."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processTestResponse failed due to invalid channel-number."));
    }
  }
  v24 = 0;
LABEL_17:

  return v24;
}

- (BOOL)processParticipantUpdateResponse:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  int shouldProcessStunResponse;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  id v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  double v35;
  uint64_t v36;
  id WeakRetained;
  const char *v38;
  double v39;
  BOOL v40;
  NSObject *v41;
  void *v43;
  void *v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_requestID(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v9, (uint64_t)v8, v10);

  if (!shouldProcessStunResponse)
  {
LABEL_13:
    v40 = 1;
    goto LABEL_21;
  }
  if ((StunUtilHasValidChannelNumber(v4, self->_channelNumber, 0) & 1) != 0)
  {
    OSLogHandleForTransportCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_requestID(v4, v13, v14, v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_candidatePairToken(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v46 = v16;
      v47 = 2112;
      v48 = v20;
      _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "receive participant update response %@ for %@.", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        objc_msgSend_requestID(v4, v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_candidatePairToken(self, v25, v26, v27);
        v43 = v24;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive participant update response %@ for %@."));

        if (_IDSShouldLog())
        {
          objc_msgSend_requestID(v4, v21, v22, v23, v24, v44);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_candidatePairToken(self, v29, v30, v31);
          v43 = v28;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive participant update response %@ for %@."));

        }
      }
    }
    v32 = objc_msgSend_type(v4, v21, v22, v23, v43, v44);
    StunUtilProcessParticipantUpdate(v4, 0, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend__optionallyCheckEncMarker_(self, v34, (uint64_t)v4, v35))
      v36 = 0;
    else
      v36 = 4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v38, (uint64_t)self, v39, v33, v36);

    goto LABEL_13;
  }
  OSLogHandleForTransportCategory();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v41, OS_LOG_TYPE_DEFAULT, "processParticipantUpdateResponse failed due to invalid channel-number.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processParticipantUpdateResponse failed due to invalid channel-number."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processParticipantUpdateResponse failed due to invalid channel-number."));
    }
  }
  v40 = 0;
LABEL_21:

  return v40;
}

- (BOOL)processPutMaterialResponse:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  int shouldProcessStunResponse;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  id v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  BOOL v35;
  NSObject *v36;
  void *v38;
  void *v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_requestID(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v9, (uint64_t)v8, v10);

  if (!shouldProcessStunResponse)
  {
LABEL_9:
    v35 = 1;
    goto LABEL_17;
  }
  if ((StunUtilHasValidChannelNumber(v4, self->_channelNumber, 0) & 1) != 0)
  {
    OSLogHandleForTransportCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_requestID(v4, v13, v14, v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_candidatePairToken(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = v16;
      v42 = 2112;
      v43 = v20;
      _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "receive PutMaterial response %@ for %@.", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        objc_msgSend_requestID(v4, v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_candidatePairToken(self, v25, v26, v27);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive PutMaterial response %@ for %@."));

        if (_IDSShouldLog())
        {
          objc_msgSend_requestID(v4, v28, v29, v30, v24, v38);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_candidatePairToken(self, v32, v33, v34);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive PutMaterial response %@ for %@."));

        }
      }
    }
    goto LABEL_9;
  }
  OSLogHandleForTransportCategory();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v36, OS_LOG_TYPE_DEFAULT, "processPutMaterialResponse failed due to invalid channel-number.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processPutMaterialResponse failed due to invalid channel-number."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processPutMaterialResponse failed due to invalid channel-number."));
    }
  }
  v35 = 0;
LABEL_17:

  return v35;
}

- (BOOL)processInfoIndication:(id)a3 arrivalTime:(double)a4
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  OSLogHandleForTransportCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v10;
    _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "receive info indication for %@.", buf, 0xCu);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v11, v12, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive info indication for %@."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v14, v15, v16, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive info indication for %@."));

      }
    }
  }

  return 1;
}

- (BOOL)processSessionInfoIndication:(id)a3 arrivalTime:(double)a4 isLightweightParticipant:(BOOL)a5
{
  id v7;
  char HasValidChannelNumber;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const __CFDictionary *v20;
  void *Value;
  void *v22;
  void *v23;
  const char *v24;
  double v25;
  NSObject *v26;
  void *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  HasValidChannelNumber = StunUtilHasValidChannelNumber(v7, self->_channelNumber, 0);
  if ((HasValidChannelNumber & 1) != 0)
  {
    OSLogHandleForTransportCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_candidatePairToken(self, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v13;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "receive session-info indication for %@.", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        objc_msgSend_candidatePairToken(self, v14, v15, v16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive session-info indication for %@."));

        if (_IDSShouldLog())
        {
          objc_msgSend_candidatePairToken(self, v17, v18, v19, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive session-info indication for %@."));

        }
      }
    }
    StunUtilProcessStreamInfo(v7, self->_linkID, self->_linkID);
    v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    Value = 0;
    if (v20 && CFSTR("stream-info-peer-published-streams"))
      Value = (void *)CFDictionaryGetValue(v20, CFSTR("stream-info-peer-published-streams"));
    StunUtilProcessParticipants(Value, self->_participantID, a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    StunUtilProcessLightweightParticipants(v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE4(v31) = 1;
    LODWORD(v31) = 0;
    LOWORD(v30) = 0;
    objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v24, (uint64_t)v20, v25, v22, v23, 0, 0, 0, 0, v30, v31);

  }
  else
  {
    OSLogHandleForTransportCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "processSessionInfoIndication failed due to invalid channel-number.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processSessionInfoIndication failed due to invalid channel-number."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processSessionInfoIndication failed due to invalid channel-number."));
      }
    }
  }

  return HasValidChannelNumber;
}

- (BOOL)processDataMessageErrorIndication:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  unsigned __int16 v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  __int128 v19;
  NSObject *v20;
  id WeakRetained;
  char v22;
  const char *v23;
  double v24;
  uint64_t v25;
  id v26;
  const char *v27;
  double v28;
  char v29;
  NSObject *v30;
  IDSStunCandidatePairDelegate **p_delegate;
  id v32;
  char v33;
  id v34;
  const char *v35;
  double v36;
  NSObject *v37;
  IDSStunCandidatePairDelegate **v38;
  id v39;
  char v40;
  id v41;
  const char *v42;
  double v43;
  id v44;
  char v45;
  id v46;
  const char *v47;
  double v48;
  IDSStunCandidatePairDelegate **v49;
  id v50;
  char v51;
  id v52;
  const char *v53;
  double v54;
  IDSStunCandidatePairDelegate **v55;
  id v56;
  char v57;
  id v58;
  const char *v59;
  double v60;
  void *v62;
  void *v63;
  uint8_t v64[4];
  char *v65;
  _OWORD v66[8];
  _BYTE buf[32];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[8];
  int v75;
  int v76;
  _QWORD v77[185];

  v77[184] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  bzero(v74, 0x5D0uLL);
  if ((objc_msgSend_getAttribute_attribute_(v4, v5, 9, v6, v74) & 1) != 0)
  {
    v7 = v76 + 100 * v75;
    OSLogHandleForTransportCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_candidatePairToken(self, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v7;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v77;
      _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "receive data message error indication for %@, error_code(%u) reason(%s)", buf, 0x1Cu);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        objc_msgSend_candidatePairToken(self, v13, v14, v15);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive data message error indication for %@, error_code(%u) reason(%s)"));

        if (_IDSShouldLog())
        {
          objc_msgSend_candidatePairToken(self, v16, v17, v18, v62, v7, v77);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive data message error indication for %@, error_code(%u) reason(%s)"));

        }
      }
    }
    *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v72 = v19;
    v73 = v19;
    v70 = v19;
    v71 = v19;
    v68 = v19;
    v69 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&buf[16] = v19;
    v66[6] = v19;
    v66[7] = v19;
    v66[4] = v19;
    v66[5] = v19;
    v66[2] = v19;
    v66[3] = v19;
    v66[0] = v19;
    v66[1] = v19;
    if (StunUtilHasValidXorMappedAddress((uint64_t)v4, v66))
    {
      OSLogHandleForTransportCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v64 = 136315138;
        v65 = SAToIPPortString(buf, 0x80uLL, (uint64_t)v66);
        _os_log_impl(&dword_19B949000, v20, OS_LOG_TYPE_DEFAULT, "Got error indication with xor-mapped-address [%s]", v64, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          SAToIPPortString(buf, 0x80uLL, (uint64_t)v66);
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Got error indication with xor-mapped-address [%s]"));
          if (_IDSShouldLog())
          {
            SAToIPPortString(buf, 0x80uLL, (uint64_t)v66);
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Got error indication with xor-mapped-address [%s]"));
          }
        }
      }
    }
    switch(v7)
    {
      case 0x259u:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v22 = objc_opt_respondsToSelector();

        if ((v22 & 1) == 0)
          goto LABEL_39;
        v25 = objc_msgSend__didLocalExternalAddressChange_(self, v23, (uint64_t)v66, v24);
        v26 = objc_loadWeakRetained((id *)&self->_delegate);
        v29 = objc_msgSend_receiveNoSessionStateForCandidatePair_didLocalExternalAddressChange_(v26, v27, (uint64_t)self, v28, v25);

        break;
      case 0x25Au:
        v44 = objc_loadWeakRetained((id *)&self->_delegate);
        v45 = objc_opt_respondsToSelector();

        if ((v45 & 1) != 0)
        {
          v46 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend_receiveIdleClientErrorForCandidatePair_(v46, v47, (uint64_t)self, v48);

        }
        goto LABEL_39;
      case 0x25Bu:
        p_delegate = &self->_delegate;
        v32 = objc_loadWeakRetained((id *)p_delegate);
        v33 = objc_opt_respondsToSelector();

        if ((v33 & 1) != 0)
        {
          v34 = objc_loadWeakRetained((id *)p_delegate);
          objc_msgSend_receiveBlockedIndicationWithReason_(v34, v35, 44, v36);

        }
        goto LABEL_39;
      case 0x260u:
        v49 = &self->_delegate;
        v50 = objc_loadWeakRetained((id *)v49);
        v51 = objc_opt_respondsToSelector();

        if ((v51 & 1) != 0)
        {
          v52 = objc_loadWeakRetained((id *)v49);
          objc_msgSend_receiveBlockedIndicationWithReason_(v52, v53, 49, v54);

        }
        goto LABEL_39;
      case 0x262u:
        v55 = &self->_delegate;
        v56 = objc_loadWeakRetained((id *)v55);
        v57 = objc_opt_respondsToSelector();

        if ((v57 & 1) != 0)
        {
          v58 = objc_loadWeakRetained((id *)v55);
          objc_msgSend_receiveErrorIndicationWithCode_(v58, v59, 1, v60);

        }
        goto LABEL_39;
      case 0x263u:
        v38 = &self->_delegate;
        v39 = objc_loadWeakRetained((id *)v38);
        v40 = objc_opt_respondsToSelector();

        if ((v40 & 1) != 0)
        {
          v41 = objc_loadWeakRetained((id *)v38);
          objc_msgSend_receiveBlockedIndicationWithReason_(v41, v42, 46, v43);

        }
LABEL_39:
        v29 = 1;
        break;
      default:
        OSLogHandleForTransportCategory();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v64 = 67109120;
          LODWORD(v65) = v7;
          _os_log_impl(&dword_19B949000, v37, OS_LOG_TYPE_DEFAULT, "invalid case: %hu", v64, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid case: %hu"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid case: %hu"));
          }
        }
        goto LABEL_22;
    }
  }
  else
  {
    OSLogHandleForIDSCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v30, OS_LOG_TYPE_ERROR, "receive invalid data message error indication.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("Warning"), CFSTR("receive invalid data message error indication."));
      _IDSLogTransport(CFSTR("Warning"), CFSTR("IDS"), CFSTR("receive invalid data message error indication."));
    }
LABEL_22:
    v29 = 0;
  }

  return v29;
}

- (BOOL)processParticipantUpdateIndication:(id)a3 arrivalTime:(double)a4
{
  id v5;
  char HasValidChannelNumber;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  id WeakRetained;
  const char *v21;
  double v22;
  NSObject *v23;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HasValidChannelNumber = StunUtilHasValidChannelNumber(v5, self->_channelNumber, 0);
  if ((HasValidChannelNumber & 1) != 0)
  {
    OSLogHandleForTransportCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_candidatePairToken(self, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v11;
      _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "receive participant update indication for %@.", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        objc_msgSend_candidatePairToken(self, v12, v13, v14);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive participant update indication for %@."));

        if (_IDSShouldLog())
        {
          objc_msgSend_candidatePairToken(self, v12, v13, v14, v25);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive participant update indication for %@."));

        }
      }
    }
    v15 = objc_msgSend_type(v5, v12, v13, v14, v25);
    StunUtilProcessParticipantUpdate(v5, 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend__optionallyCheckEncMarker_(self, v17, (uint64_t)v5, v18))
      v19 = 0;
    else
      v19 = 4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v21, (uint64_t)self, v22, v16, v19);

  }
  else
  {
    OSLogHandleForTransportCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "processParticipantUpdateIndication failed due to invalid channel number.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processParticipantUpdateIndication failed due to invalid channel number."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processParticipantUpdateIndication failed due to invalid channel number."));
      }
    }
  }

  return HasValidChannelNumber;
}

- (BOOL)processPluginRegistrationResponse:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  int shouldProcessStunResponse;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  const char *v28;
  int isEqualToString;
  double v30;
  int v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  id WeakRetained;
  const char *v44;
  double v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((StunUtilHasValidChannelNumber(v4, self->_channelNumber, 0) & 1) != 0)
  {
    objc_msgSend_requestID(v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v9, (uint64_t)v8, v10);

    if (shouldProcessStunResponse)
    {
      objc_msgSend_requestID(v4, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__pluginNameForStunRequest_(self, v16, (uint64_t)v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend_requestID(v4, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__removeStunPluginRegistrationRequest_(self, v23, (uint64_t)v22, v24);

      }
      objc_msgSend_pathExtension(v18, v19, v20, v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v25, v26, (uint64_t)CFSTR("Register"), v27);
      if ((isEqualToString & 1) != 0
        || (objc_msgSend_isEqualToString_(v25, v28, (uint64_t)CFSTR("Unregister"), v30) & 1) != 0)
      {
        v54 = 0;
        v31 = StunUtilHasValidUInt64Attr((uint64_t)v4, 65493, &v54) | isEqualToString ^ 1;
        if ((v31 & 1) != 0)
        {
          OSLogHandleForTransportCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_candidatePairToken(self, v33, v34, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v56 = v36;
            v57 = 2048;
            v58 = v54;
            v59 = 2112;
            v60 = v18;
            _os_log_impl(&dword_19B949000, v32, OS_LOG_TYPE_DEFAULT, "receive plugin update for %@, with participant id: %llu, and name %@", buf, 0x20u);

          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              objc_msgSend_candidatePairToken(self, v37, v38, v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v54;
              v53 = v18;
              v51 = v40;
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive plugin update for %@, with participant id: %llu, and name %@"));

              if (_IDSShouldLog())
              {
                objc_msgSend_candidatePairToken(self, v37, v38, v39, v40, v52, v18);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = v54;
                v53 = v18;
                v51 = v41;
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive plugin update for %@, with participant id: %llu, and name %@"));

              }
            }
          }
          objc_msgSend_stringByDeletingPathExtension(v18, v37, v38, v39, v51, v52, v53);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v46 = WeakRetained;
          if (isEqualToString)
            objc_msgSend_candidatePair_didReceivePluginRegistration_pluginName_(WeakRetained, v44, (uint64_t)self, v45, v54, v42);
          else
            objc_msgSend_candidatePair_didReceivePluginUnregistration_pluginName_(WeakRetained, v44, (uint64_t)self, v45, v54, v42);

        }
        else
        {
          OSLogHandleForTransportCategory();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B949000, v48, OS_LOG_TYPE_DEFAULT, "received update plugin needs valid participant id when registering.", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("received update plugin needs valid participant id when registering."));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("received update plugin needs valid participant id when registering."));
            }
          }
        }
      }
      else
      {
        OSLogHandleForTransportCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v49, OS_LOG_TYPE_DEFAULT, "invalid plugin operation - ignoring this response", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid plugin operation - ignoring this response"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid plugin operation - ignoring this response"));
          }
        }
        LOBYTE(v31) = 0;
      }

    }
    else
    {
      LOBYTE(v31) = 1;
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v47, OS_LOG_TYPE_DEFAULT, "processPluginRegistrationResponse failed due to invalid channel number.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processPluginRegistrationResponse failed due to invalid channel number."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processPluginRegistrationResponse failed due to invalid channel number."));
      }
    }
    LOBYTE(v31) = 0;
  }

  return v31;
}

- (BOOL)processPluginControlIndication:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char HasValidUInt8Attr;
  double v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  id WeakRetained;
  const char *v24;
  double v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((StunUtilHasValidChannelNumber(v4, self->_channelNumber, 0) & 1) == 0)
  {
    OSLogHandleForTransportCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "processPluginControlIndication failed due to invalid channel number.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processPluginControlIndication failed due to invalid channel number."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processPluginControlIndication failed due to invalid channel number."));
      }
    }
    goto LABEL_23;
  }
  v33 = 0;
  if ((StunUtilHasValidUInt64Attr((uint64_t)v4, 65493, &v33) & 1) == 0)
  {
    OSLogHandleForTransportCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v27, OS_LOG_TYPE_DEFAULT, "received plugin event needs valid participant id.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("received plugin event needs valid participant id."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("received plugin event needs valid participant id."));
      }
    }
LABEL_23:
    HasValidUInt8Attr = 0;
    goto LABEL_24;
  }
  v32 = 0;
  HasValidUInt8Attr = StunUtilHasValidUInt8Attr((uint64_t)v4, 65491, &v32);
  if ((HasValidUInt8Attr & 1) != 0)
  {
    objc_msgSend_transactionID(v4, v5, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    OSLogHandleForTransportCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_candidatePairToken(self, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v35 = v14;
      v36 = 2048;
      v37 = v33;
      v38 = 1024;
      v39 = v32;
      v40 = 2112;
      v41 = v9;
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "receive plugin event for %@, with participant id: %llu, operation %u, transactionID %@", buf, 0x26u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        objc_msgSend_candidatePairToken(self, v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v32;
        v30 = v33;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive plugin event for %@, with participant id: %llu, operation %u, transactionID %@"));

        if (_IDSShouldLog())
        {
          objc_msgSend_candidatePairToken(self, v19, v20, v21, v18, v30, v31, v9);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive plugin event for %@, with participant id: %llu, operation %u, transactionID %@"));

        }
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceivePluginControlEvent_operation_transactionID_(WeakRetained, v24, (uint64_t)self, v25, v33, v32, v9);

  }
  else
  {
    OSLogHandleForTransportCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "received plugin event needs valid operation.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("received plugin event needs valid operation."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("received plugin event needs valid operation."));
      }
    }
  }
LABEL_24:

  return HasValidUInt8Attr;
}

- (BOOL)processStunErrorResponse:(id)a3 packetBuffer:(id *)a4 headerOverhead:(unint64_t)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  int shouldProcessStunResponse;
  const char *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  BOOL v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  double v35;
  const char *v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  double v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  const char *v53;
  uint64_t v54;
  double v55;
  double v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  NSObject *v61;
  char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  double v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  double v71;
  char *v72;
  char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  double v77;
  char *v78;
  char *v79;
  const char *v80;
  uint64_t v81;
  double v82;
  char *v83;
  char *v84;
  NSObject *v85;
  const char *v86;
  double v87;
  unint64_t participantID;
  char *v89;
  unint64_t v90;
  unint64_t v91;
  int64_t var2;
  void *v93;
  const char *v94;
  double v95;
  uint64_t StunSentBytes;
  NSObject *v97;
  const char *v98;
  uint64_t v99;
  double v100;
  void *v101;
  const char *v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  uint64_t v107;
  id v108;
  const char *v109;
  double v110;
  NSObject *v112;
  const char *v113;
  uint64_t v114;
  double v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  double v119;
  const char *v120;
  uint64_t v121;
  double v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  double v126;
  unsigned int v127;
  const char *v128;
  double v129;
  uint64_t v130;
  id WeakRetained;
  const char *v132;
  double v133;
  NSObject *v134;
  unint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  __int128 v142;
  double v143;
  uint64_t v144;
  int v145;
  unsigned __int16 v146;
  uint8_t v147[4];
  unint64_t v148;
  __int16 v149;
  char *v150;
  __int16 v151;
  void *v152;
  _OWORD v153[8];
  _BYTE buf[48];
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _OWORD v160[8];
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend_requestID(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  shouldProcessStunResponse = objc_msgSend_shouldProcessStunResponse_(self, v13, (uint64_t)v12, v14);

  if (!shouldProcessStunResponse)
  {
LABEL_10:
    v31 = 1;
    goto LABEL_65;
  }
  v146 = -21846;
  *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v160[6] = v18;
  v160[7] = v18;
  v160[4] = v18;
  v160[5] = v18;
  v160[2] = v18;
  v160[3] = v18;
  v160[0] = v18;
  v160[1] = v18;
  v145 = 0;
  v19 = objc_msgSend_type(v8, v16, v17, -3.72066208e-103);
  if ((StunUtilHasValidErrorCodeAttr(v8, &v146, (char *)v160, &v145) & 1) != 0)
  {
    if (self->_state == 2)
    {
      OSLogHandleForTransportCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = (unsigned __int16)v19;
        _os_log_impl(&dword_19B949000, v20, OS_LOG_TYPE_DEFAULT, "%@ is already in error state, ignore error response %04x.", buf, 0x12u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v25, v26, v27);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("%@ is already in error state, ignore error response %04x."));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v28, v29, v30, v136, (unsigned __int16)v19);
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("%@ is already in error state, ignore error response %04x."));

          }
        }
      }
      goto LABEL_10;
    }
    OSLogHandleForTransportCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v146;
      v35 = ids_monotonic_time();
      objc_msgSend_startTime(v8, v36, v37, v35);
      v39 = v38;
      v42 = *(unsigned __int8 *)(objc_msgSend_address(self->_local, v40, v41, v38) + 1);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = (unsigned __int16)v19;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v34;
      *(_WORD *)&buf[14] = 2080;
      *(_QWORD *)&buf[16] = v160;
      *(_WORD *)&buf[24] = 2048;
      *(double *)&buf[26] = (v35 - v39) * 1000.0;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v42;
      _os_log_impl(&dword_19B949000, v33, OS_LOG_TYPE_DEFAULT, "receive stun error response - type(%04x) error_code(%u) reason(%s) after %0.3lf ms family: %d.", buf, 0x28u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v43 = v146;
        v44 = ids_monotonic_time();
        objc_msgSend_startTime(v8, v45, v46, v44);
        v48 = v47;
        v144 = *(unsigned __int8 *)(objc_msgSend_address(self->_local, v49, v50, v47) + 1);
        v143 = (v44 - v48) * 1000.0;
        *(_QWORD *)&v142 = v43;
        *((_QWORD *)&v142 + 1) = v160;
        v135 = (unsigned __int16)v19;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive stun error response - type(%04x) error_code(%u) reason(%s) after %0.3lf ms family: %d."));
        if (_IDSShouldLog())
        {
          v51 = v146;
          v52 = ids_monotonic_time();
          objc_msgSend_startTime(v8, v53, v54, v52, (unsigned __int16)v19, (_QWORD)v142, v160, *(_QWORD *)&v143, v144);
          v56 = v55;
          v144 = *(unsigned __int8 *)(objc_msgSend_address(self->_local, v57, v58, v55) + 1);
          v143 = (v52 - v56) * 1000.0;
          *(_QWORD *)&v142 = v51;
          *((_QWORD *)&v142 + 1) = v160;
          v135 = (unsigned __int16)v19;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive stun error response - type(%04x) error_code(%u) reason(%s) after %0.3lf ms family: %d."));
        }
      }
    }
    v59 = GLUtilStunErrorToGlobalLinkError(v146);
    GLUtilReportAWDStunMessageEvent(v8, v59, self, 0.0);
    *(_QWORD *)&v60 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v60 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v158 = v60;
    v159 = v60;
    v156 = v60;
    v157 = v60;
    *(_OWORD *)&buf[32] = v60;
    v155 = v60;
    *(_OWORD *)buf = v60;
    *(_OWORD *)&buf[16] = v60;
    v153[6] = v60;
    v153[7] = v60;
    v153[4] = v60;
    v153[5] = v60;
    v153[2] = v60;
    v153[3] = v60;
    v153[0] = v60;
    v153[1] = v60;
    if (StunUtilHasValidXorMappedAddress((uint64_t)v8, v153))
    {
      OSLogHandleForTransportCategory();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = SAToIPPortString(buf, 0x80uLL, (uint64_t)v153);
        *(_DWORD *)v147 = 136315138;
        v148 = (unint64_t)v62;
        _os_log_impl(&dword_19B949000, v61, OS_LOG_TYPE_DEFAULT, "Got error response with xor-mapped-address [%s]", v147, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v135 = (unint64_t)SAToIPPortString(buf, 0x80uLL, (uint64_t)v153);
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Got error response with xor-mapped-address [%s]"));
          if (_IDSShouldLog())
          {
            v135 = (unint64_t)SAToIPPortString(buf, 0x80uLL, (uint64_t)v153);
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Got error response with xor-mapped-address [%s]"));
          }
        }
      }
    }
    v63 = GLUtilStunErrorToGlobalLinkError(v146);
    GLUCreateQRStunMessageEvent(v8, v63, self, 0, 0.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66)
      objc_msgSend__notifyQREventAdded_(self, v64, (uint64_t)v66, v67);
    if ((v19 & 0xFFFFFFFFFFFFFFFELL) == 0xFF0)
    {
      OSLogHandleForTransportCategory();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        v72 = (&_IDSStunCandidatePairStateStrings)[self->_state];
        v73 = off_1EE40A668;
        objc_msgSend_candidatePairToken(self, v69, v70, v71);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v147 = 136315650;
        v148 = (unint64_t)v72;
        v149 = 2080;
        v150 = v73;
        v151 = 2112;
        v152 = v74;
        _os_log_impl(&dword_19B949000, v68, OS_LOG_TYPE_DEFAULT, "update state (%s->%s) for %@.", v147, 0x20u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v78 = (&_IDSStunCandidatePairStateStrings)[self->_state];
          v79 = off_1EE40A668;
          objc_msgSend_candidatePairToken(self, v75, v76, v77);
          *(_QWORD *)&v142 = v79;
          *((_QWORD *)&v142 + 1) = objc_claimAutoreleasedReturnValue();
          v135 = (unint64_t)v78;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update state (%s->%s) for %@."));

          if (_IDSShouldLog())
          {
            v83 = (&_IDSStunCandidatePairStateStrings)[self->_state];
            v84 = off_1EE40A668;
            objc_msgSend_candidatePairToken(self, v80, v81, v82, v135, v79, *((_QWORD *)&v142 + 1));
            *(_QWORD *)&v142 = v84;
            *((_QWORD *)&v142 + 1) = objc_claimAutoreleasedReturnValue();
            v135 = (unint64_t)v83;
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update state (%s->%s) for %@."));

          }
        }
      }
      self->_state = 2;
      OSLogHandleForTransportCategory();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        participantID = self->_participantID;
        objc_msgSend_base64EncodedStringWithOptions_(self->_relaySessionToken, v86, 0, v87);
        v89 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v147 = 134218242;
        v148 = participantID;
        v149 = 2112;
        v150 = v89;
        _os_log_impl(&dword_19B949000, v85, OS_LOG_TYPE_DEFAULT, "failed participant:[%16llX], token:[%@]", v147, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v90 = self->_participantID;
          objc_msgSend_base64EncodedStringWithOptions_(self->_relaySessionToken, v64, 0, v67);
          v135 = v90;
          *(_QWORD *)&v142 = objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed participant:[%16llX], token:[%@]"));

          if (_IDSShouldLog())
          {
            v91 = self->_participantID;
            objc_msgSend_base64EncodedStringWithOptions_(self->_relaySessionToken, v64, 0, v67, v135, (_QWORD)v142);
            v135 = v91;
            *(_QWORD *)&v142 = objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed participant:[%16llX], token:[%@]"));

          }
        }
      }
    }
    else
    {
      switch(v19)
      {
        case 4088:
          OSLogHandleForTransportCategory();
          v106 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v147 = 0;
            _os_log_impl(&dword_19B949000, v106, OS_LOG_TYPE_DEFAULT, "receive plugin registrion error response", v147, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive plugin registrion error response"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive plugin registrion error response"));
            }
          }
          break;
        case 4087:
          OSLogHandleForTransportCategory();
          v112 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_candidatePairToken(self, v113, v114, v115);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v147 = 138412290;
            v148 = (unint64_t)v116;
            _os_log_impl(&dword_19B949000, v112, OS_LOG_TYPE_DEFAULT, "receive participant update error response for %@.", v147, 0xCu);

          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              objc_msgSend_candidatePairToken(self, v117, v118, v119);
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive participant update error response for %@."));

              if (_IDSShouldLog())
              {
                objc_msgSend_candidatePairToken(self, v120, v121, v122, v140);
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive participant update error response for %@."));

              }
            }
          }
          StunUtilProcessParticipantUpdate(v8, v146, 4087);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = v123;
          if (!v123 || !objc_msgSend_count(v123, v124, v125, v126))
          {
            OSLogHandleForTransportCategory();
            v134 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v147 = 0;
              _os_log_impl(&dword_19B949000, v134, OS_LOG_TYPE_DEFAULT, "receive participant update error response: invalid participantUpdateInfo", v147, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive participant update error response: invalid participantUpdateInfo"));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive participant update error response: invalid participantUpdateInfo"));
              }
            }
            v31 = 0;
            goto LABEL_64;
          }
          v127 = sub_19BAA3C70(v146);
          if (objc_msgSend__optionallyCheckEncMarker_(self, v128, (uint64_t)v8, v129))
            v130 = v127;
          else
            v130 = 4;
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v132, (uint64_t)self, v133, v108, v130);

LABEL_63:
          v31 = 1;
LABEL_64:

          goto LABEL_65;
        case 4085:
          var2 = a4->var2;
          objc_msgSend_requestID(v8, v64, v65, v67);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          StunSentBytes = objc_msgSend_getStunSentBytes_(self, v94, (uint64_t)v93, v95);

          OSLogHandleForTransportCategory();
          v97 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_candidatePairToken(self, v98, v99, v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v147 = 138412290;
            v148 = (unint64_t)v101;
            _os_log_impl(&dword_19B949000, v97, OS_LOG_TYPE_DEFAULT, "receive session-info error response for %@.", v147, 0xCu);

          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              objc_msgSend_candidatePairToken(self, v102, v104, v103);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive session-info error response for %@."));

              if (_IDSShouldLog())
              {
                objc_msgSend_candidatePairToken(self, v102, v105, v103, v138);
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive session-info error response for %@."));

              }
            }
          }
          BYTE12(v142) = 0;
          *(_QWORD *)((char *)&v142 + 4) = 2;
          LOWORD(v142) = 0;
          objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v102, 0, v103, 0, 0, 0, 0, StunSentBytes, var2 + a5, v142, *(_QWORD *)&v143, v144);
          break;
      }
    }
    v107 = objc_msgSend__didLocalExternalAddressChange_(self, v64, (uint64_t)v153, v67, v135, v142);
    v108 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceiveStunErrorResponse_errorCode_didLocalExternalAddressChange_(v108, v109, (uint64_t)self, v110, v19, v146, v107);
    goto LABEL_63;
  }
  OSLogHandleForTransportCategory();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = (unsigned __int16)v19;
    _os_log_impl(&dword_19B949000, v32, OS_LOG_TYPE_DEFAULT, "receive invalid stun error code attr, ignore error response %04x.", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive invalid stun error code attr, ignore error response %04x."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive invalid stun error code attr, ignore error response %04x."));
    }
  }
  v31 = 0;
LABEL_65:

  return v31;
}

- (void)processSessionInfoRequestTimeout:(id)a3
{
  double v3;
  uint64_t StunSentBytes;
  const char *v6;
  double v7;
  __int16 v8;
  _BYTE v9[12];

  StunSentBytes = objc_msgSend_getStunSentBytes_(self, a2, (uint64_t)a3, v3);
  v9[8] = 0;
  *(_QWORD *)v9 = 3;
  v8 = 0;
  objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v6, 0, v7, 0, 0, 0, 0, StunSentBytes, 0, v8, *(_QWORD *)&v9[4]);
}

- (void)_notifySessionStreamInfoReceived:(id)a3 withParticipants:(id)a4 lightweightParticipants:(id)a5 joinedParticipantInfo:(id)a6 leftParticipantInfo:(id)a7 sentBytes:(unint64_t)a8 receivedBytes:(unint64_t)a9 offlineRequest:(BOOL)a10 streamInfoRequest:(BOOL)a11 status:(unsigned int)a12 commandFlag:(unsigned int)a13 isIndication:(BOOL)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  __CFDictionary *v23;
  const char *v24;
  double v25;
  __CFDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id WeakRetained;
  const char *v33;
  double v34;
  id value;

  value = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = v23;
  if (v21)
    CFDictionarySetValue(v23, CFSTR("gl-option-sessioninfo-response-joined-participant-info-key"), v21);
  if (v22)
    CFDictionarySetValue(v26, CFSTR("gl-option-sessioninfo-response-left-participant-info-key"), v22);
  if (value)
    CFDictionarySetValue(v26, CFSTR("gl-option-sessioninfo-response-streaminfo-key"), value);
  if (v19)
    CFDictionarySetValue(v26, CFSTR("gl-option-sessioninfo-response-participants-key"), v19);
  if (v20)
    CFDictionarySetValue(v26, CFSTR("gl-option-sessioninfo-response-lightweight-participants-key"), v20);
  if (a8)
  {
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v24, a8, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      CFDictionarySetValue(v26, CFSTR("gl-option-sessioninfo-request-bytes-sent-key"), v27);

  }
  if (a9)
  {
    objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v24, a9, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      CFDictionarySetValue(v26, CFSTR("gl-option-sessioninfo-response-bytes-received-key"), v28);

  }
  if (a10)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v24, 1, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      CFDictionarySetValue(v26, CFSTR("gl-option-sessioninfo-response-offline-request-key"), v29);

  }
  if (a11)
    CFDictionarySetValue(v26, CFSTR("gl-option-sessioninfo-request-type"), &unk_1E3C86B50);
  if (a13)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v24, a13, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      CFDictionarySetValue(v26, CFSTR("gl-option-sessioninfo-command-flag"), v30);

  }
  if (a14)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v24, 1, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      CFDictionarySetValue(v26, CFSTR("gl-option-sessioninfo-Indication"), v31);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_candidatePair_didReceiveSessionInfo_status_(WeakRetained, v33, (uint64_t)self, v34, v26, a12);

}

- (void)_notifyQREventAdded:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  const char *v7;
  double v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didAddQREvent_(v6, v7, (uint64_t)self, v8, v9);

  }
}

- (void)addProtoRequest:(unint64_t)a3
{
  double v3;
  NSMutableSet *pendingProtoRequests;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  const char *v10;
  double v11;
  char v12;
  const char *v13;
  double v14;
  NSMutableSet *v15;
  void *v16;
  const char *v17;
  double v18;
  NSObject *v19;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  IDSStunCandidatePair *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  pendingProtoRequests = self->_pendingProtoRequests;
  if (!pendingProtoRequests)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = self->_pendingProtoRequests;
    self->_pendingProtoRequests = v7;

    pendingProtoRequests = self->_pendingProtoRequests;
  }
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_containsObject_(pendingProtoRequests, v10, (uint64_t)v9, v11);

  if ((v12 & 1) == 0)
  {
    v15 = self->_pendingProtoRequests;
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v13, a3, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v15, v17, (uint64_t)v16, v18);

    OSLogHandleForIDSCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v21 = a3;
      v22 = 2112;
      v23 = self;
      _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "add pending proto request: %llu for %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("add pending proto request: %llu for %@"));
    }
  }
}

- (BOOL)removeProtoRequest:(unint64_t)a3
{
  double v3;
  NSMutableSet *pendingProtoRequests;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  const char *v10;
  double v11;
  int v12;
  const char *v13;
  double v14;
  NSMutableSet *v15;
  void *v16;
  const char *v17;
  double v18;
  NSObject *v19;
  uint8_t buf[4];
  unint64_t v22;
  __int16 v23;
  IDSStunCandidatePair *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  pendingProtoRequests = self->_pendingProtoRequests;
  if (!pendingProtoRequests)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = self->_pendingProtoRequests;
    self->_pendingProtoRequests = v7;

    pendingProtoRequests = self->_pendingProtoRequests;
  }
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_containsObject_(pendingProtoRequests, v10, (uint64_t)v9, v11);

  if (v12)
  {
    v15 = self->_pendingProtoRequests;
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v13, a3, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(v15, v17, (uint64_t)v16, v18);

    OSLogHandleForTransportCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v22 = a3;
      v23 = 2112;
      v24 = self;
      _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "remove pending proto request: %llu for %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("remove pending proto request: %llu for %@"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("remove pending proto request: %llu for %@"));
      }
    }
  }
  return v12;
}

- (void)_savePluginNameForProtoRequest:(unint64_t)a3 pluginName:(id)a4
{
  NSMutableSet *pendingProtoRequests;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *pluginNameToStunReqID;
  const char *v14;
  id v15;
  double v16;
  NSMutableDictionary *v17;
  const void *v18;
  id v19;

  v19 = a4;
  pendingProtoRequests = self->_pendingProtoRequests;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v7, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(pendingProtoRequests) = objc_msgSend_containsObject_(pendingProtoRequests, v10, (uint64_t)v9, v11);

  if ((_DWORD)pendingProtoRequests)
  {
    if (!self->_pluginNameToStunReqID)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      pluginNameToStunReqID = self->_pluginNameToStunReqID;
      self->_pluginNameToStunReqID = Mutable;

    }
    v15 = v19;
    if (v15)
    {
      v17 = self->_pluginNameToStunReqID;
      v18 = (const void *)objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v14, a3, v16);
      CFDictionarySetValue((CFMutableDictionaryRef)v17, v18, v15);
    }

  }
}

- (id)_pluginNameForProtoRequest:(unint64_t)a3
{
  double v3;
  const char *v6;
  void *v7;
  double v8;
  NSMutableDictionary *pluginNameToStunReqID;
  void *v10;
  void *v11;

  if (self->_pluginNameToStunReqID)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], a2, a3, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      pluginNameToStunReqID = self->_pluginNameToStunReqID;
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v6, a3, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)CFDictionaryGetValue((CFDictionaryRef)pluginNameToStunReqID, v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)_removeProtoPluginRegistrationRequest:(unint64_t)a3
{
  double v3;
  NSMutableDictionary *pluginNameToStunReqID;
  const char *v5;
  double v6;
  id v7;

  pluginNameToStunReqID = self->_pluginNameToStunReqID;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(pluginNameToStunReqID, v5, (uint64_t)v7, v6);

}

- (void)sendQUICInfoRequest
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  char *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  IDSQRProtoMessage *v16;
  const char *v17;
  double v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  char *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  id WeakRetained;
  const char *v31;
  double v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  id v45;
  NSObject *v46;
  void *v47;
  char *v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  id v52;
  uint64_t v53;
  int v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (self->_state < 5)
  {
    v16 = [IDSQRProtoMessage alloc];
    v15 = (void *)objc_msgSend_initWithType_candidatePair_options_(v16, v17, 5, v18, self, 0);
    if (v15)
    {
      OSLogHandleForTransportCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v20, v21, v22);
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v56 = v15;
        v57 = 2112;
        v58 = v23;
        _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "send info request %@ for %@.", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v24, v25, v26);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send info request %@ for %@."));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v27, v28, v29, v15, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send info request %@ for %@."));

          }
        }
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v33 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v31, (uint64_t)v15, v32, self);

      v37 = objc_msgSend_transactionID(v15, v34, v35, v36);
      objc_msgSend_addProtoRequest_(self, v38, v37, v39);
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v40, (uint64_t)CFSTR("%llu"), v41, v37);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateStunSentBytes_requestID_(self, v43, v33, v44, v42);
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = sub_19BAB2910;
      v51[3] = &unk_1E3C21F58;
      v52 = v42;
      v53 = v37;
      v54 = 5;
      v51[4] = self;
      v45 = v42;
      IDSTransportThreadAddBlockAfter(v51, 10.0);

    }
    else
    {
      OSLogHandleForTransportCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v46, OS_LOG_TYPE_DEFAULT, "failed to create info request.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create info request."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create info request."));
        }
      }
    }
    goto LABEL_22;
  }
  OSLogHandleForTransportCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v56 = v7;
    v57 = 2080;
    v58 = v8;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "skip info request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v9, v10, v11);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip info request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v12, v13, v14, v47, v48);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip info request for %@, state [%s]."));
LABEL_22:

      }
    }
  }
}

- (void)sendQUICParticipantUpdateRequestWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  char *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  IDSQRProtoMessage *v18;
  const char *v19;
  double v20;
  id WeakRetained;
  const char *v22;
  double v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  char *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  const char *v44;
  uint64_t v45;
  double v46;
  NSObject *v47;
  void *v48;
  char *v49;
  void *v50;
  void *v51;
  _QWORD v52[5];
  id v53;
  uint64_t v54;
  int v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  char *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    v18 = [IDSQRProtoMessage alloc];
    v17 = (void *)objc_msgSend_initWithType_candidatePair_options_(v18, v19, 7, v20, self, v4);
    if (v17)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v24 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v22, (uint64_t)v17, v23, self);

      v28 = objc_msgSend_transactionID(v17, v25, v26, v27);
      objc_msgSend_addProtoRequest_(self, v29, v28, v30);
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v31, (uint64_t)CFSTR("%llu"), v32, v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateStunSentBytes_requestID_(self, v34, v24, v35, v33);
      OSLogHandleForTransportCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v37, v38, v39);
        v40 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v57 = v17;
        v58 = 2112;
        v59 = v40;
        v60 = 2048;
        v61 = v24;
        _os_log_impl(&dword_19B949000, v36, OS_LOG_TYPE_DEFAULT, "send participant update request %@ for %@, sentBytes: %lu", buf, 0x20u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v41, v42, v43);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send participant update request %@ for %@, sentBytes: %lu"));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v44, v45, v46, v17, v50, v24);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send participant update request %@ for %@, sentBytes: %lu"));

          }
        }
      }
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = sub_19BAB2FD0;
      v52[3] = &unk_1E3C21F58;
      v52[4] = self;
      v54 = v28;
      v55 = 7;
      v53 = v4;
      IDSTransportThreadAddBlockAfter(v52, 10.0);

    }
    else
    {
      OSLogHandleForTransportCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v47, OS_LOG_TYPE_DEFAULT, "failed to create participant update request.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create participant update request."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create participant update request."));
        }
      }
    }
    goto LABEL_22;
  }
  OSLogHandleForTransportCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v57 = v9;
    v58 = 2080;
    v59 = v10;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "skip participant update request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v11, v12, v13);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip participant update request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v14, v15, v16, v48, v49);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip participant update request for %@, state [%s]."));
LABEL_22:

      }
    }
  }

}

- (void)sendQUICPluginRegistrationRequestWithOptions:(id)a3
{
  const __CFDictionary *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  char *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  IDSQRProtoMessage *v18;
  const char *v19;
  double v20;
  id WeakRetained;
  const char *v22;
  double v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  void *Value;
  id v37;
  const char *v38;
  double v39;
  int isEqualToNumber;
  __CFString *v41;
  const char *v42;
  __CFString *v43;
  double v44;
  const void *v45;
  void *v46;
  void *v47;
  const char *v48;
  double v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  char *v54;
  const char *v55;
  uint64_t v56;
  double v57;
  const char *v58;
  uint64_t v59;
  double v60;
  NSObject *v61;
  void *v62;
  char *v63;
  void *v64;
  void *v65;
  _QWORD v66[6];
  int v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  char *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFDictionary *)a3;
  if (self->_state < 5)
  {
    v18 = [IDSQRProtoMessage alloc];
    v17 = (void *)objc_msgSend_initWithType_candidatePair_options_(v18, v19, 10, v20, self, v4);
    if (v17)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v24 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v22, (uint64_t)v17, v23, self);

      v28 = objc_msgSend_transactionID(v17, v25, v26, v27);
      objc_msgSend_addProtoRequest_(self, v29, v28, v30);
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v31, (uint64_t)CFSTR("%llu"), v32, v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateStunSentBytes_requestID_(self, v34, v24, v35, v33);
      Value = 0;
      if (v4 && CFSTR("gl-option-plugin-operation"))
        Value = (void *)CFDictionaryGetValue(v4, CFSTR("gl-option-plugin-operation"));
      v37 = Value;
      isEqualToNumber = objc_msgSend_isEqualToNumber_(v37, v38, (uint64_t)&unk_1E3C86B38, v39);
      v41 = CFSTR("Unregister");
      if (isEqualToNumber)
        v41 = CFSTR("Register");
      v43 = v41;
      v45 = 0;
      v46 = (void *)MEMORY[0x1E0CB3940];
      if (v4)
      {
        v42 = CFSTR("gl-option-plugin-name");
        if (CFSTR("gl-option-plugin-name"))
          v45 = CFDictionaryGetValue(v4, CFSTR("gl-option-plugin-name"));
      }
      objc_msgSend_stringWithFormat_(v46, v42, (uint64_t)CFSTR("%@.%@"), v44, v45, v43);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__savePluginNameForProtoRequest_pluginName_(self, v48, v28, v49, v47);
      OSLogHandleForTransportCategory();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v51, v52, v53);
        v54 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v69 = v17;
        v70 = 2112;
        v71 = v54;
        _os_log_impl(&dword_19B949000, v50, OS_LOG_TYPE_DEFAULT, "send QR plugin registration request %@ for %@.", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v55, v56, v57);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send QR plugin registration request %@ for %@."));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v58, v59, v60, v17, v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send QR plugin registration request %@ for %@."));

          }
        }
      }
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = sub_19BAB37A8;
      v66[3] = &unk_1E3C21F80;
      v66[4] = self;
      v66[5] = v28;
      v67 = 10;
      IDSTransportThreadAddBlockAfter(v66, 10.0);

    }
    else
    {
      OSLogHandleForTransportCategory();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v61, OS_LOG_TYPE_DEFAULT, "failed to create QR plugin registration request.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create QR plugin registration request."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create QR plugin registration request."));
        }
      }
    }
    goto LABEL_30;
  }
  OSLogHandleForTransportCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v69 = v9;
    v70 = 2080;
    v71 = v10;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "skip plugin registration request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v11, v12, v13);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip plugin registration request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v14, v15, v16, v62, v63);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip plugin registration request for %@, state [%s]."));
LABEL_30:

      }
    }
  }

}

- (void)sendQUICSessionInfoRequestWithOptions:(id)a3
{
  const __CFDictionary *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  char *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  IDSQRProtoMessage *v18;
  const char *v19;
  double v20;
  id WeakRetained;
  const char *v22;
  double v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  double v36;
  void *Value;
  const char *v38;
  char v39;
  double v40;
  NSMutableDictionary *requestIDToQueryLinkIDs;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v43;
  void *v44;
  const char *v45;
  double v46;
  const char *v47;
  double v48;
  NSMutableDictionary *v49;
  NSMutableDictionary *requestIDToSessionInfoReqType;
  void *v51;
  void *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  double v56;
  char *v57;
  const char *v58;
  uint64_t v59;
  double v60;
  const char *v61;
  uint64_t v62;
  double v63;
  id v64;
  NSObject *v65;
  void *v66;
  char *v67;
  void *v68;
  void *v69;
  _QWORD v70[5];
  id v71;
  uint64_t v72;
  int v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  char *v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFDictionary *)a3;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    v18 = [IDSQRProtoMessage alloc];
    v17 = (void *)objc_msgSend_initWithType_candidatePair_options_(v18, v19, 15, v20, self, v4);
    if (v17)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v24 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v22, (uint64_t)v17, v23, self);

      v28 = objc_msgSend_transactionID(v17, v25, v26, v27);
      objc_msgSend_addProtoRequest_(self, v29, v28, v30);
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v31, (uint64_t)CFSTR("%llu"), v32, v28);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      Value = 0;
      if (v4)
      {
        v33 = CFSTR("gl-option-sessioninfo-link-id-to-query");
        if (CFSTR("gl-option-sessioninfo-link-id-to-query"))
          Value = (void *)CFDictionaryGetValue(v4, CFSTR("gl-option-sessioninfo-link-id-to-query"));
      }
      v39 = objc_msgSend_intValue(Value, v33, v34, v36);
      requestIDToQueryLinkIDs = self->_requestIDToQueryLinkIDs;
      if (!requestIDToQueryLinkIDs)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v43 = self->_requestIDToQueryLinkIDs;
        self->_requestIDToQueryLinkIDs = Mutable;

        requestIDToQueryLinkIDs = self->_requestIDToQueryLinkIDs;
      }
      objc_msgSend_numberWithChar_(MEMORY[0x1E0CB37E8], v38, v39, v40);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(requestIDToQueryLinkIDs, v45, (uint64_t)v44, v46, v35);

      if (!self->_requestIDToSessionInfoReqType)
      {
        v49 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        requestIDToSessionInfoReqType = self->_requestIDToSessionInfoReqType;
        self->_requestIDToSessionInfoReqType = v49;

      }
      if (v4)
      {
        v47 = CFSTR("gl-option-sessioninfo-request-type");
        if (CFSTR("gl-option-sessioninfo-request-type"))
        {
          v51 = (id)CFDictionaryGetValue(v4, CFSTR("gl-option-sessioninfo-request-type"));
          if (v51)
          {
            v52 = v51;
            CFDictionarySetValue((CFMutableDictionaryRef)self->_requestIDToSessionInfoReqType, v35, v51);

          }
        }
      }
      objc_msgSend_updateStunSentBytes_requestID_(self, v47, v24, v48, v35);
      OSLogHandleForTransportCategory();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v54, v55, v56);
        v57 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v75 = v17;
        v76 = 2112;
        v77 = v57;
        v78 = 2048;
        v79 = v24;
        _os_log_impl(&dword_19B949000, v53, OS_LOG_TYPE_DEFAULT, "send session-info request %@ for %@, sentBytes: %lu", buf, 0x20u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v58, v59, v60);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send session-info request %@ for %@, sentBytes: %lu"));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v61, v62, v63, v17, v68, v24);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send session-info request %@ for %@, sentBytes: %lu"));

          }
        }
      }
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = sub_19BAB3F44;
      v70[3] = &unk_1E3C21F58;
      v71 = v35;
      v72 = v28;
      v73 = 15;
      v70[4] = self;
      v64 = v35;
      IDSTransportThreadAddBlockAfter(v70, 10.0);

    }
    else
    {
      OSLogHandleForTransportCategory();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v65, OS_LOG_TYPE_DEFAULT, "failed to create session-info request.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create session-info request."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create session-info request."));
        }
      }
    }
    goto LABEL_33;
  }
  OSLogHandleForTransportCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v75 = v9;
    v76 = 2080;
    v77 = v10;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "skip session-info request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v11, v12, v13);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip session-info request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v14, v15, v16, v66, v67);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip session-info request for %@, state [%s]."));
LABEL_33:

      }
    }
  }

}

- (void)sendQUICStatsRequestWithOptions:(id)a3
{
  const __CFDictionary *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  char *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  IDSQRProtoMessage *v18;
  const char *v19;
  double v20;
  id WeakRetained;
  const char *v22;
  double v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  NSObject *v29;
  int linkID;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  double v38;
  void *Value;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  double v47;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *requestIDToStatsIDs;
  void *v50;
  NSObject *v51;
  unsigned int v52;
  double v53;
  id v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  void *v61;
  _QWORD v62[5];
  id v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  char v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  char *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFDictionary *)a3;
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    v18 = [IDSQRProtoMessage alloc];
    v17 = (void *)objc_msgSend_initWithType_candidatePair_options_(v18, v19, 18, v20, self, v4);
    if (v17)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v24 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v22, (uint64_t)v17, v23, self);

      v28 = objc_msgSend_transactionID(v17, v25, v26, v27);
      OSLogHandleForTransportCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        linkID = self->_linkID;
        *(_DWORD *)buf = 134218240;
        v69 = v28;
        v70 = 1024;
        LODWORD(v71) = linkID;
        _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "send stats req %llx for link %d.", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v56 = v28;
          v59 = self->_linkID;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send stats req %llx for link %d."));
          if (_IDSShouldLog())
          {
            v56 = v28;
            v59 = self->_linkID;
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send stats req %llx for link %d."));
          }
        }
      }
      objc_msgSend_addProtoRequest_(self, v31, v28, v32, v56, v59);
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v33, (uint64_t)CFSTR("%llu"), v34, v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      Value = 0;
      if (v4)
      {
        v35 = CFSTR("ids-extchannel-stat-identifier-key");
        if (CFSTR("ids-extchannel-stat-identifier-key"))
          Value = (void *)CFDictionaryGetValue(v4, CFSTR("ids-extchannel-stat-identifier-key"));
      }
      v42 = objc_msgSend_unsignedLongLongValue(Value, v35, v36, v38);
      v44 = 0;
      if (self->_requestIDToStatsIDs && v37)
        v44 = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_requestIDToStatsIDs, v37);
      v45 = objc_msgSend_unsignedLongLongValue(v44, v40, v41, v43);
      if (v42 && v42 != v45)
      {
        if (!self->_requestIDToStatsIDs)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          requestIDToStatsIDs = self->_requestIDToStatsIDs;
          self->_requestIDToStatsIDs = Mutable;

        }
        objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v46, v42, v47);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
          CFDictionarySetValue((CFMutableDictionaryRef)self->_requestIDToStatsIDs, v37, v50);

        OSLogHandleForTransportCategory();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v69 = v42;
          v70 = 2112;
          v71 = (char *)v37;
          _os_log_impl(&dword_19B949000, v51, OS_LOG_TYPE_DEFAULT, "sendQUICStatsRequestWithOptions: add stats identifier %llu for %@.", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v58 = v42;
            v61 = v37;
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("sendQUICStatsRequestWithOptions: add stats identifier %llu for %@."));
            if (_IDSShouldLog())
            {
              v58 = v42;
              v61 = v37;
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("sendQUICStatsRequestWithOptions: add stats identifier %llu for %@."));
            }
          }
        }
      }
      objc_msgSend_updateStunSentBytes_requestID_(self, v46, v24, v47, v37, v58, v61);
      v52 = self->_statsIntervalInSeconds >> 1;
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = sub_19BAB474C;
      v62[3] = &unk_1E3C21FA8;
      v64 = v28;
      v65 = v42;
      v62[4] = self;
      v63 = v37;
      v67 = v52;
      v66 = 18;
      v53 = (double)v52;
      v54 = v37;
      IDSTransportThreadAddBlockAfter(v62, v53);

    }
    else
    {
      OSLogHandleForTransportCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v55, OS_LOG_TYPE_DEFAULT, "failed to create stats request.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create stats request."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create stats request."));
        }
      }
    }
    goto LABEL_40;
  }
  OSLogHandleForTransportCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_candidatePairToken(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (&_IDSStunCandidatePairStateStrings)[self->_state];
    *(_DWORD *)buf = 138412546;
    v69 = (uint64_t)v9;
    v70 = 2080;
    v71 = v10;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "skip stats request for %@, state [%s].", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v11, v12, v13);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip stats request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v14, v15, v16, v57, v60);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip stats request for %@, state [%s]."));
LABEL_40:

      }
    }
  }

}

- (void)sendQUICTestRequest
{
  double v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  char *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  BOOL v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  IDSQRProtoMessage *v30;
  const char *v31;
  double v32;
  void *v33;
  id WeakRetained;
  const char *v35;
  double v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  const char *v42;
  double v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  double v52;
  unsigned int testOptions;
  int testRequestedMessageType;
  int testRequestedErrorCode;
  NSString *testSubOperation;
  void *v57;
  int linkID;
  const char *v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSString *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  double v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  char *v74;
  uint64_t v75;
  void *v76;
  _QWORD v77[6];
  uint8_t buf[4];
  _BYTE v79[10];
  char *v80;
  NSString *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  int v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  if (self->_state - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    self->_testStartTime = 0.0;
    if (self->_testSubOperation)
    {
      v16 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, self->_testOptions, v2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionaryWithObjectsAndKeys_(v16, v18, (uint64_t)v17, v19, CFSTR("gl-option-test-options-flags"), self->_testSubOperation, CFSTR("gl-option-test-sub-operation"), 0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = self->_testRequestedErrorCode == 0;
      v21 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, self->_testOptions, v2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend_dictionaryWithObject_forKey_(v21, v22, (uint64_t)v17, v23, CFSTR("gl-option-test-options-flags"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v22, self->_testRequestedMessageType, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v25, self->_testRequestedErrorCode, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionaryWithObjectsAndKeys_(v21, v28, (uint64_t)v17, v29, CFSTR("gl-option-test-options-flags"), v24, CFSTR("gl-option-test-requested-message-type"), v27, CFSTR("gl-option-test-requested-error-code-type"), 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

    v30 = [IDSQRProtoMessage alloc];
    v33 = (void *)objc_msgSend_initWithType_candidatePair_options_(v30, v31, 20, v32, self, v76);
    if (v33)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v37 = objc_msgSend_sendProtoMessage_candidatePair_(WeakRetained, v35, (uint64_t)v33, v36, self);

      v41 = objc_msgSend_transactionID(v33, v38, v39, v40);
      objc_msgSend_addProtoRequest_(self, v42, v41, v43);
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v44, (uint64_t)CFSTR("%llu"), v45, v41);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateStunSentBytes_requestID_(self, v47, v37, v48, v46);
      OSLogHandleForTransportCategory();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        testOptions = self->_testOptions;
        testRequestedMessageType = self->_testRequestedMessageType;
        testRequestedErrorCode = self->_testRequestedErrorCode;
        testSubOperation = self->_testSubOperation;
        objc_msgSend_candidatePairToken(self, v50, v51, v52);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        linkID = self->_linkID;
        *(_DWORD *)buf = 67110914;
        *(_DWORD *)v79 = testOptions;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = testRequestedMessageType;
        LOWORD(v80) = 1024;
        *(_DWORD *)((char *)&v80 + 2) = testRequestedErrorCode;
        HIWORD(v80) = 2112;
        v81 = testSubOperation;
        v82 = 2112;
        v83 = v33;
        v84 = 2112;
        v85 = v57;
        v86 = 2112;
        v87 = v46;
        v88 = 1024;
        v89 = linkID;
        _os_log_impl(&dword_19B949000, v49, OS_LOG_TYPE_DEFAULT, "send test(0x%x,%u,%u,%@) request %@ for %@, %@ link: %d", buf, 0x42u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v62 = self->_testOptions;
          v63 = self->_testRequestedMessageType;
          v64 = self->_testRequestedErrorCode;
          v65 = self->_testSubOperation;
          objc_msgSend_candidatePairToken(self, v59, v60, v61);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = self->_linkID;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send test(0x%x,%u,%u,%@) request %@ for %@, %@ link: %d"));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v67, v68, v69, v62, v63, v64, v65, v33, v66, v46, v75);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send test(0x%x,%u,%u,%@) request %@ for %@, %@ link: %d"));

          }
        }
      }
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = sub_19BAB4F64;
      v77[3] = &unk_1E3C21F30;
      v77[4] = self;
      v77[5] = v41;
      IDSTransportThreadAddBlockAfter(v77, 10.0);

    }
    else
    {
      OSLogHandleForTransportCategory();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v71, OS_LOG_TYPE_DEFAULT, "failed to create test request.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create test request."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create test request."));
        }
      }
    }

  }
  else
  {
    OSLogHandleForTransportCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_candidatePairToken(self, v5, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v79 = v8;
      *(_WORD *)&v79[8] = 2080;
      v80 = v9;
      _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "skip test request for %@, state [%s].", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      objc_msgSend_candidatePairToken(self, v10, v11, v12);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (&_IDSStunCandidatePairStateStrings)[self->_state];
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("skip test request for %@, state [%s]."));

      if (_IDSShouldLog())
      {
        objc_msgSend_candidatePairToken(self, v13, v14, v15, v72, v74);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("skip test request for %@, state [%s]."));

      }
    }
  }
}

- (BOOL)processQUICInfoResponse:(id)a3 receivedBytes:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  void *v39;
  const char *v40;
  double v41;
  uint64_t StunSentBytes;
  const char *v43;
  double v44;
  id WeakRetained;
  const char *v46;
  double v47;
  NSObject *v48;
  NSObject *v49;
  void *v51;
  void *v52;
  unsigned int v53;
  uint64_t v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v10 = objc_msgSend_transactionID(v6, v7, v8, v9);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("%llu"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_removeProtoRequest_(self, v14, v10, v15))
  {
    objc_msgSend_infoResponse(v6, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v19;
    if (v19)
    {
      objc_msgSend_clientAddress(v19, v20, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 != 0;
      if (v24)
      {
        OSLogHandleForTransportCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v24;
          _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "Got info response with client address [%@]", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Got info response with client address [%@]"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Got info response with client address [%@]"));
          }
        }
        OSLogHandleForTransportCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v28, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v31;
          _os_log_impl(&dword_19B949000, v27, OS_LOG_TYPE_DEFAULT, "receive info-response for %@.", buf, 0xCu);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_candidatePairToken(self, v32, v33, v34);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive info-response for %@."));

            if (_IDSShouldLog())
            {
              objc_msgSend_candidatePairToken(self, v35, v36, v37, v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive info-response for %@."));

            }
          }
        }
        ProtoUtilProcessActiveParticipantsFromInfo(v23);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        ProtoUtilProcessActiveLightweightParticipantsFromInfo(v23);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        StunSentBytes = objc_msgSend_getStunSentBytes_(self, v40, (uint64_t)v13, v41);
        BYTE4(v54) = 0;
        LODWORD(v54) = 0;
        LOWORD(v53) = 1;
        objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v43, 0, v44, v38, v39, 0, 0, StunSentBytes, a4, v53, v54);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend_disconnectIdleQUICConnectionForCandidatePair_(WeakRetained, v46, (uint64_t)self, v47);

      }
      else
      {
        OSLogHandleForTransportCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v49, OS_LOG_TYPE_DEFAULT, "processQUICInfoResponse failed due to invalid client address.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICInfoResponse failed due to invalid client address."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICInfoResponse failed due to invalid client address."));
          }
        }
      }

    }
    else
    {
      OSLogHandleForTransportCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v48, OS_LOG_TYPE_DEFAULT, "processQUICInfoResponse failed due to invalid infoResponse.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICInfoResponse failed due to invalid infoResponse."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICInfoResponse failed due to invalid infoResponse."));
        }
      }
      v25 = 0;
    }

  }
  else
  {
    v25 = 1;
  }

  return v25;
}

- (BOOL)processQUICParticipantUpdateResponse:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  int v24;
  void *v25;
  id WeakRetained;
  const char *v27;
  double v28;
  NSObject *v29;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = objc_msgSend_transactionID(v4, v5, v6, v7);
  if (objc_msgSend_removeProtoRequest_(self, v9, v8, v10))
  {
    objc_msgSend_participantUpdateResponse(v4, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;
    if (v14)
    {
      OSLogHandleForTransportCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v34 = v8;
        v35 = 2112;
        v36 = v20;
        _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "receive participant update response %llu for %@.", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v21, v22, v23);
          v31 = v8;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive participant update response %llu for %@."));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v21, v22, v23, v8, v32);
            v31 = v8;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive participant update response %llu for %@."));

          }
        }
      }
      v24 = objc_msgSend_messageType(v4, v21, v22, v23, v31, v32);
      ProtoUtilProcessParticipantUpdate(v14, 0, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v27, (uint64_t)self, v28, v25, 0);

    }
    else
    {
      OSLogHandleForTransportCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "processQUICParticipantUpdateResponse failed due to invalid participantUpdateResponse.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICParticipantUpdateResponse failed due to invalid participantUpdateResponse."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICParticipantUpdateResponse failed due to invalid participantUpdateResponse."));
        }
      }
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)processQUICGetMaterialResponse:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  BOOL v15;
  id WeakRetained;
  const char *v17;
  double v18;
  NSObject *v19;
  uint8_t v21[16];

  v4 = a3;
  v8 = objc_msgSend_transactionID(v4, v5, v6, v7);
  if (objc_msgSend_removeProtoRequest_(self, v9, v8, v10))
  {
    objc_msgSend_getMaterialResponse(v4, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;
    if (v14)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend_candidatePair_didReceiveGetMaterialResponse_(WeakRetained, v17, (uint64_t)self, v18, v14);

    }
    else
    {
      OSLogHandleForTransportCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "processQUICGetMaterialResponse failed due to invalid getMaterialResponse", v21, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICGetMaterialResponse failed due to invalid getMaterialResponse"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICGetMaterialResponse failed due to invalid getMaterialResponse"));
        }
      }
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)processQUICPutMaterialResponse:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  BOOL v15;
  id WeakRetained;
  const char *v17;
  double v18;
  NSObject *v19;
  uint8_t v21[16];

  v4 = a3;
  v8 = objc_msgSend_transactionID(v4, v5, v6, v7);
  if (objc_msgSend_removeProtoRequest_(self, v9, v8, v10))
  {
    objc_msgSend_putMaterialResponse(v4, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;
    if (v14)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend_candidatePair_didReceivePutMaterialResponse_(WeakRetained, v17, (uint64_t)self, v18, v14);

    }
    else
    {
      OSLogHandleForTransportCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "processQUICPutMaterialResponse failed due to invalid putMaterialResponse", v21, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICPutMaterialResponse failed due to invalid putMaterialResponse"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICPutMaterialResponse failed due to invalid putMaterialResponse"));
        }
      }
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)processQUICPluginRegistrationResponse:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  void *v15;
  double v16;
  BOOL v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  int isEqualToString;
  double v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  id WeakRetained;
  const char *v40;
  double v41;
  void *v42;
  NSObject *v43;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = objc_msgSend_transactionID(v4, v5, v6, v7);
  if (objc_msgSend_removeProtoRequest_(self, v9, v8, v10))
  {
    objc_msgSend_pluginControlResponse(v4, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15 != 0;
    if (v15)
    {
      objc_msgSend__pluginNameForProtoRequest_(self, v14, v8, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend__removeProtoPluginRegistrationRequest_(self, v18, v8, v21);
      objc_msgSend_pathExtension(v20, v18, v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)CFSTR("Register"), v24);
      if ((isEqualToString & 1) != 0
        || (objc_msgSend_isEqualToString_(v22, v25, (uint64_t)CFSTR("Unregister"), v28) & 1) != 0)
      {
        v29 = objc_msgSend_pluginParticipantId(v15, v25, v26, v28);
        OSLogHandleForTransportCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v31, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v50 = v34;
          v51 = 2048;
          v52 = v29;
          v53 = 2112;
          v54 = v20;
          _os_log_impl(&dword_19B949000, v30, OS_LOG_TYPE_DEFAULT, "receive plugin update for %@, with participant id: %llu, and name %@", buf, 0x20u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_candidatePairToken(self, v35, v36, v37);
            v47 = v29;
            v48 = v20;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive plugin update for %@, with participant id: %llu, and name %@"));

            if (_IDSShouldLog())
            {
              objc_msgSend_candidatePairToken(self, v35, v36, v37, v46, v29, v20);
              v47 = v29;
              v48 = v20;
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive plugin update for %@, with participant id: %llu, and name %@"));

            }
          }
        }
        objc_msgSend_stringByDeletingPathExtension(v20, v35, v36, v37, v46, v47, v48);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v42 = WeakRetained;
        if (isEqualToString)
          objc_msgSend_candidatePair_didReceivePluginRegistration_pluginName_(WeakRetained, v40, (uint64_t)self, v41, v29, v38);
        else
          objc_msgSend_candidatePair_didReceivePluginUnregistration_pluginName_(WeakRetained, v40, (uint64_t)self, v41, v29, v38);

      }
      else
      {
        OSLogHandleForTransportCategory();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v45, OS_LOG_TYPE_DEFAULT, "invalid plugin operation - ignoring this response", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid plugin operation - ignoring this response"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid plugin operation - ignoring this response"));
          }
        }
      }

    }
    else
    {
      OSLogHandleForTransportCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v43, OS_LOG_TYPE_DEFAULT, "processQUICPluginRegistrationResponse failed due to invalid pluginControlResponse.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICPluginRegistrationResponse failed due to invalid pluginControlResponse."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICPluginRegistrationResponse failed due to invalid pluginControlResponse."));
        }
      }
    }

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (BOOL)processQUICSessionInfoResponse:(id)a3 receivedBytes:(unint64_t)a4 isLightweightParticipant:(BOOL)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *Value;
  char v31;
  const __CFDictionary *v32;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t StunSentBytes;
  double v41;
  NSMutableDictionary *requestIDToSessionInfoReqType;
  _BOOL4 v43;
  void *v44;
  NSObject *v45;
  int v46;
  const char *v47;
  uint64_t v48;
  double v49;
  int hasCommandFlags;
  const char *v51;
  uint64_t v52;
  double v53;
  uint64_t v55;
  void *v56;
  unsigned int v57;
  uint64_t v58;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v11 = objc_msgSend_transactionID(v7, v8, v9, v10);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("%llu"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_removeProtoRequest_(self, v15, v11, v16))
  {
    objc_msgSend_sessionInfoResponse(v7, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 != 0;
    if (v20)
    {
      OSLogHandleForTransportCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(self, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v61 = v11;
        v62 = 2112;
        v63 = v26;
        _os_log_impl(&dword_19B949000, v22, OS_LOG_TYPE_DEFAULT, "receive session-info response %llu for %@.", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(self, v27, v28, v29);
          v55 = v11;
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive session-info response %llu for %@."));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(self, v27, v28, v29, v11, v56);
            v55 = v11;
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive session-info response %llu for %@."));

          }
        }
      }
      Value = 0;
      if (self->_requestIDToQueryLinkIDs && v14)
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_requestIDToQueryLinkIDs, v14);
      v31 = objc_msgSend_intValue(Value, v27, v28, v29, v55, v56);
      ProtoUtilProcessStreamInfo(v20, self->_linkID, v31);
      v32 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      if (v32 && CFSTR("stream-info-peer-published-streams"))
        v33 = (void *)CFDictionaryGetValue(v32, CFSTR("stream-info-peer-published-streams"));
      StunUtilProcessParticipants(v33, self->_participantID, a5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      ProtoUtilProcessLightweightParticipants(v20);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      StunSentBytes = objc_msgSend_getStunSentBytes_(self, v36, (uint64_t)v14, v37);
      requestIDToSessionInfoReqType = self->_requestIDToSessionInfoReqType;
      if (requestIDToSessionInfoReqType)
        v43 = v14 != 0;
      else
        v43 = 0;
      if (v43)
        v44 = (void *)CFDictionaryGetValue((CFDictionaryRef)requestIDToSessionInfoReqType, v14);
      else
        v44 = 0;
      v46 = objc_msgSend_intValue(v44, v38, v39, v41);
      hasCommandFlags = objc_msgSend_hasCommandFlags(v20, v47, v48, v49);
      if (hasCommandFlags)
        hasCommandFlags = objc_msgSend_commandFlags(v20, v51, v52, v53);
      BYTE4(v58) = 0;
      LODWORD(v58) = hasCommandFlags;
      BYTE1(v57) = v46 == 2;
      LOBYTE(v57) = 0;
      objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v51, (uint64_t)v32, v53, v34, v35, 0, 0, StunSentBytes, a4, v57, v58);

    }
    else
    {
      OSLogHandleForTransportCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v45, OS_LOG_TYPE_DEFAULT, "processQUICSessionInfoResponse failed due to invalid sessionInfoResponse.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICSessionInfoResponse failed due to invalid sessionInfoResponse."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICSessionInfoResponse failed due to invalid sessionInfoResponse."));
        }
      }
    }

  }
  else
  {
    v21 = 1;
  }

  return v21;
}

- (BOOL)processQUICStatsResponse:(id)a3 arrivalTime:(double)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  BOOL v21;
  int v22;
  int v23;
  unsigned int v24;
  double v25;
  double serverLatency;
  double v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  int linkID;
  const char *v32;
  double v33;
  void *v34;
  NSMutableDictionary *requestIDToStatsIDs;
  void *v36;
  void *v37;
  __CFDictionary *v38;
  const char *v39;
  double v40;
  void *v41;
  NSObject *v42;
  const char *v43;
  double v44;
  void *v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  int v51;
  const char *v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  double v58;
  id WeakRetained;
  const char *v60;
  double v61;
  const char *v62;
  double v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  int v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v10 = objc_msgSend_transactionID(v6, v7, v8, v9);
  if (objc_msgSend_removeProtoRequest_(self, v11, v10, v12))
  {
    objc_msgSend_statsResponse(v6, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    v21 = v16 != 0;
    if (v16)
    {
      v22 = objc_msgSend_clientTimestampNtp(v16, v17, v18, v19);
      v23 = ntpTime32(a4);
      v24 = (v23 - v22) >> 16;
      v25 = (double)(unsigned __int16)(v23 - v22) * 0.0000152587891 + (double)v24;
      serverLatency = self->_serverLatency;
      if (serverLatency == 0.0)
        v27 = (double)(unsigned __int16)(v23 - v22) * 0.0000152587891 + (double)v24;
      else
        v27 = v25 * 0.1 + serverLatency * 0.9;
      self->_serverLatency = v27;
      v28 = (int)(v25 * 1000.0);
      OSLogHandleForTransportCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (int)(self->_serverLatency * 1000.0);
        linkID = self->_linkID;
        *(_DWORD *)buf = 134218752;
        v71 = v10;
        v72 = 1024;
        v73 = linkID;
        v74 = 1024;
        v75 = v28;
        v76 = 1024;
        v77 = v30;
        _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "processQUICStatsResponse: recv stats resp %llu (link: %2d rtt: %5d ms mean: %5d ms).", buf, 0x1Eu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v68 = v28;
          v69 = (int)(self->_serverLatency * 1000.0);
          v66 = self->_linkID;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICStatsResponse: recv stats resp %llu (link: %2d rtt: %5d ms mean: %5d ms)."));
          if (_IDSShouldLog())
          {
            v68 = v28;
            v69 = (int)(self->_serverLatency * 1000.0);
            v66 = self->_linkID;
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICStatsResponse: recv stats resp %llu (link: %2d rtt: %5d ms mean: %5d ms)."));
          }
        }
      }
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v32, (uint64_t)CFSTR("%llu"), v33, v10, v66, v68, v69);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      requestIDToStatsIDs = self->_requestIDToStatsIDs;
      if (requestIDToStatsIDs)
      {
        if (v34)
        {
          v36 = (id)CFDictionaryGetValue((CFDictionaryRef)requestIDToStatsIDs, v34);
          if (v36)
          {
            v37 = v36;
            v38 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            CFDictionarySetValue(v38, CFSTR("gl-option-stats-identifier"), v37);
            objc_msgSend_numberWithChar_(MEMORY[0x1E0CB37E8], v39, self->_linkID, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (v41)
            {
              CFDictionarySetValue(v38, CFSTR("gl-option-linkid"), v41);
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              sub_19BAF9810();
            }

            objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v43, v28, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v45)
            {
              CFDictionarySetValue(v38, CFSTR("gl-option-stats-server-timestamp"), v45);
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              sub_19BAF9790();
            }

            OSLogHandleForTransportCategory();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              v50 = objc_msgSend_unsignedLongLongValue(v37, v47, v48, v49);
              v51 = self->_linkID;
              *(_DWORD *)buf = 134218496;
              v71 = v50;
              v72 = 1024;
              v73 = v51;
              v74 = 1024;
              v75 = v28;
              _os_log_impl(&dword_19B949000, v46, OS_LOG_TYPE_DEFAULT, "processQUICStatsResponse: statsIdentifier: %llu, linkID: %d, rtt: %d ms", buf, 0x18u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                v55 = objc_msgSend_unsignedLongLongValue(v37, v52, v53, v54);
                v67 = self->_linkID;
                v65 = v55;
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICStatsResponse: statsIdentifier: %llu, linkID: %d, rtt: %d ms"));
                if (_IDSShouldLog())
                {
                  objc_msgSend_unsignedLongLongValue(v37, v56, v57, v58, v65, v67, v28);
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICStatsResponse: statsIdentifier: %llu, linkID: %d, rtt: %d ms"));
                }
              }
            }
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend_candidatePair_didReceiveSessionStats_success_(WeakRetained, v60, (uint64_t)self, v61, v38, 1);

            objc_msgSend_removeObjectForKey_(self->_requestIDToStatsIDs, v62, (uint64_t)v34, v63);
          }
        }
      }

    }
    else
    {
      OSLogHandleForTransportCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v42, OS_LOG_TYPE_DEFAULT, "invalid stats resp received", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid stats resp received"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid stats resp received"));
        }
      }
    }

  }
  else
  {
    v21 = 1;
  }

  return v21;
}

- (BOOL)processQUICTestResponse:(id)a3 arrivalTime:(double)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  double v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9 = objc_msgSend_transactionID(v5, v6, v7, v8);
  if (objc_msgSend_removeProtoRequest_(self, v10, v9, v11))
  {
    OSLogHandleForTransportCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_candidatePairToken(self, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v16;
      _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "receive test response for %@.", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        objc_msgSend_candidatePairToken(self, v17, v18, v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive test response for %@."));

        if (_IDSShouldLog())
        {
          objc_msgSend_candidatePairToken(self, v20, v21, v22, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive test response for %@."));

        }
      }
    }
  }

  return 1;
}

- (BOOL)processQUICParticipantUpdateIndication:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  double v27;
  int v28;
  void *v29;
  id WeakRetained;
  const char *v31;
  double v32;
  NSObject *v33;
  void *v35;
  void *v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_participantUpdateIndication(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForTransportCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend_txnId(v8, v10, v11, v12);
    objc_msgSend_candidatePairToken(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v38 = v13;
    v39 = 2112;
    v40 = v17;
    _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "receive participant update indication(%llu) for %@.", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v21 = objc_msgSend_txnId(v8, v18, v19, v20);
      objc_msgSend_candidatePairToken(self, v22, v23, v24);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive participant update indication(%llu) for %@."));

      if (_IDSShouldLog())
      {
        objc_msgSend_txnId(v8, v18, v19, v20, v21, v35);
        objc_msgSend_candidatePairToken(self, v25, v26, v27);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive participant update indication(%llu) for %@."));

      }
    }
  }
  if (v8)
  {
    v28 = objc_msgSend_messageType(v4, v18, v19, v20);
    ProtoUtilProcessParticipantUpdate(v8, 0, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v31, (uint64_t)self, v32, v29, 0);

  }
  else
  {
    OSLogHandleForTransportCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v33, OS_LOG_TYPE_DEFAULT, "processQUICParticipantUpdateIndication failed due to invalid participantUpdateIndication.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICParticipantUpdateIndication failed due to invalid participantUpdateIndication."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICParticipantUpdateIndication failed due to invalid participantUpdateIndication."));
      }
    }
  }

  return v8 != 0;
}

- (BOOL)processQUICPluginControlIndication:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  unsigned __int8 v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  const char *v37;
  uint64_t v38;
  double v39;
  id WeakRetained;
  const char *v41;
  double v42;
  NSObject *v43;
  void *v45;
  void *v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_pluginControlIndication(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  if (v8)
  {
    v13 = objc_msgSend_pluginParticipantId(v8, v9, v10, v11);
    v17 = objc_msgSend_pluginOperation(v12, v14, v15, v16);
    OSLogHandleForTransportCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend_txnId(v12, v19, v20, v21);
      objc_msgSend_candidatePairToken(self, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v48 = v22;
      v49 = 2112;
      v50 = v26;
      v51 = 2048;
      v52 = v13;
      v53 = 1024;
      v54 = v17;
      _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "receive plugin event(%llu) for %@, with participant id: %llu, operation %u", buf, 0x26u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v30 = objc_msgSend_txnId(v12, v27, v28, v29);
        objc_msgSend_candidatePairToken(self, v31, v32, v33);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive plugin event(%llu) for %@, with participant id: %llu, operation %u"));

        if (_IDSShouldLog())
        {
          objc_msgSend_txnId(v12, v34, v35, v36, v30, v45, v13, v17);
          objc_msgSend_candidatePairToken(self, v37, v38, v39);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive plugin event(%llu) for %@, with participant id: %llu, operation %u"));

        }
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceivePluginControlEvent_operation_transactionID_(WeakRetained, v41, (uint64_t)self, v42, v13, v17, 0);

  }
  else
  {
    OSLogHandleForTransportCategory();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v43, OS_LOG_TYPE_DEFAULT, "processQUICPluginControlIndication failed due to invalid pluginControlIndication.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICPluginControlIndication failed due to invalid pluginControlIndication."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICPluginControlIndication failed due to invalid pluginControlIndication."));
      }
    }
  }

  return v12 != 0;
}

- (BOOL)processQUICSessionInfoIndication:(id)a3 arrivalTime:(double)a4 isLightweightParticipant:(BOOL)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  const __CFDictionary *v34;
  void *Value;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *v46;
  void *v47;
  const char *v48;
  double v49;
  NSObject *v50;
  void *v52;
  uint64_t v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend_sessionInfoIndication(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForTransportCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend_txnId(v11, v13, v14, v15);
    objc_msgSend_candidatePairToken(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v55 = v16;
    v56 = 2112;
    v57 = v20;
    _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "receive session-info indication(%llu) for %@.", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v24 = objc_msgSend_txnId(v11, v21, v22, v23);
      objc_msgSend_candidatePairToken(self, v25, v26, v27);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive session-info indication(%llu) for %@."));

      if (_IDSShouldLog())
      {
        objc_msgSend_txnId(v11, v28, v29, v30, v24, v52);
        objc_msgSend_candidatePairToken(self, v31, v32, v33);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive session-info indication(%llu) for %@."));

      }
    }
  }
  if (v11)
  {
    ProtoUtilProcessStreamInfo(v11, self->_linkID, self->_linkID);
    v34 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    Value = 0;
    if (v34 && CFSTR("stream-info-peer-published-streams"))
      Value = (void *)CFDictionaryGetValue(v34, CFSTR("stream-info-peer-published-streams"));
    StunUtilProcessParticipants(Value, self->_participantID, a5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    ProtoUtilProcessLightweightParticipants(v11);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_leftParticipants(v11, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    ProtoUtilProcessLeftParticipants(v41, v36, v37);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_joinedParticipants(v11, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    ProtoUtilProcessjoinedParticipants(v46, v36, v37);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    BYTE4(v53) = 1;
    LODWORD(v53) = 0;
    LOWORD(v52) = 0;
    objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v48, (uint64_t)v34, v49, v36, v37, v47, v42, 0, 0, v52, v53);

  }
  else
  {
    OSLogHandleForTransportCategory();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v50, OS_LOG_TYPE_DEFAULT, "processQUICSessionInfoIndication failed due to invalid sessionInfoIndication.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICSessionInfoIndication failed due to invalid sessionInfoIndication."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICSessionInfoIndication failed due to invalid sessionInfoIndication."));
      }
    }
  }

  return v11 != 0;
}

- (BOOL)processQUICPutMaterialIndication:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  id WeakRetained;
  const char *v32;
  double v33;
  NSObject *v34;
  void *v36;
  void *v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_putMaterialIndication(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForTransportCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend_txnId(v8, v10, v11, v12);
    objc_msgSend_candidatePairToken(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v39 = v13;
    v40 = 2112;
    v41 = v17;
    _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "receive put material indication(%llu) for %@.", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v21 = objc_msgSend_txnId(v8, v18, v19, v20);
      objc_msgSend_candidatePairToken(self, v22, v23, v24);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive put material indication(%llu) for %@."));

      if (_IDSShouldLog())
      {
        objc_msgSend_txnId(v8, v25, v26, v27, v21, v36);
        objc_msgSend_candidatePairToken(self, v28, v29, v30);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive put material indication(%llu) for %@."));

      }
    }
  }
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_candidatePair_didReceivePutMaterialIndication_(WeakRetained, v32, (uint64_t)self, v33, v8);

  }
  else
  {
    OSLogHandleForTransportCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "processQUICPutMaterialIndication failed due to invalid putMaterialIndication.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICPutMaterialIndication failed due to invalid putMaterialIndication."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICPutMaterialIndication failed due to invalid putMaterialIndication."));
      }
    }
  }

  return v8 != 0;
}

- (BOOL)processQUICErrorIndication:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  unsigned __int16 v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  id v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  int v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  double v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  double v53;
  const char *v54;
  uint64_t v55;
  double v56;
  const char *v57;
  uint64_t v58;
  double v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  double v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  const char *v68;
  uint64_t v69;
  double v70;
  IDSStunCandidatePairDelegate **p_delegate;
  id WeakRetained;
  char v73;
  id v74;
  const char *v75;
  double v76;
  NSObject *v77;
  NSObject *v78;
  BOOL v79;
  NSObject *v80;
  char *v81;
  IDSStunCandidatePairDelegate **v82;
  id v83;
  char v84;
  id v85;
  const char *v86;
  double v87;
  IDSStunCandidatePairDelegate **v88;
  id v89;
  char v90;
  id v91;
  const char *v92;
  double v93;
  NSObject *v94;
  char *v95;
  IDSStunCandidatePairDelegate **v96;
  id v97;
  char v98;
  id v99;
  const char *v100;
  double v101;
  IDSStunCandidatePairDelegate **v102;
  id v103;
  char v104;
  id v105;
  const char *v106;
  double v107;
  void *v109;
  void *v110;
  uint8_t buf[4];
  uint64_t v112;
  __int16 v113;
  id v114;
  __int16 v115;
  int v116;
  __int16 v117;
  void *v118;
  __int16 v119;
  int v120;
  __int16 v121;
  void *v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_errorIndication(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  if (v8)
  {
    v13 = objc_msgSend_errorCode(v8, v9, v10, v11);
    OSLogHandleForTransportCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend_txnId(v12, v15, v16, v17);
      objc_msgSend_candidatePairToken(self, v19, v20, v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorReason(v12, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend_channelId(v12, v27, v28, v29);
      objc_msgSend_clientAddress(v12, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v112 = v18;
      v113 = 2112;
      v114 = v22;
      v115 = 1024;
      v116 = v13;
      v117 = 2112;
      v118 = v26;
      v119 = 1024;
      v120 = v30;
      v121 = 2112;
      v122 = v34;
      _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_DEFAULT, "receive QUIC error indication(%llu) for %@, error_code(%u) reason(%@) channel_id(%u) client address(%@)", buf, 0x36u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v38 = objc_msgSend_txnId(v12, v35, v36, v37);
        objc_msgSend_candidatePairToken(self, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorReason(v12, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend_channelId(v12, v47, v48, v49);
        objc_msgSend_clientAddress(v12, v51, v52, v53);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive QUIC error indication(%llu) for %@, error_code(%u) reason(%@) channel_id(%u) client address(%@)"));

        if (_IDSShouldLog())
        {
          objc_msgSend_txnId(v12, v54, v55, v56, v38, v42, v13, v46, v50, v109);
          objc_msgSend_candidatePairToken(self, v57, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorReason(v12, v61, v62, v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_channelId(v12, v65, v66, v67);
          objc_msgSend_clientAddress(v12, v68, v69, v70);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive QUIC error indication(%llu) for %@, error_code(%u) reason(%@) channel_id(%u) client address(%@)"));

        }
      }
    }
    switch(v13)
    {
      case 0x25Bu:
        p_delegate = &self->_delegate;
        WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        v73 = objc_opt_respondsToSelector();

        if ((v73 & 1) != 0)
        {
          v74 = objc_loadWeakRetained((id *)p_delegate);
          objc_msgSend_receiveBlockedIndicationWithReason_(v74, v75, 44, v76);

        }
        break;
      case 0x260u:
        if (self->_state > 2)
        {
          v96 = &self->_delegate;
          v97 = objc_loadWeakRetained((id *)v96);
          v98 = objc_opt_respondsToSelector();

          if ((v98 & 1) != 0)
          {
            v99 = objc_loadWeakRetained((id *)v96);
            objc_msgSend_receiveBlockedIndicationWithReason_(v99, v100, 49, v101);

          }
        }
        else
        {
          OSLogHandleForTransportCategory();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            v81 = (&_IDSStunCandidatePairStateStrings)[self->_state];
            *(_DWORD *)buf = 136315138;
            v112 = (uint64_t)v81;
            _os_log_impl(&dword_19B949000, v80, OS_LOG_TYPE_DEFAULT, "processQUICErrorIndication: Ignoring PARTICIPANT_MISSKEY_REMOVE, state: %s", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICErrorIndication: Ignoring PARTICIPANT_MISSKEY_REMOVE, state: %s"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICErrorIndication: Ignoring PARTICIPANT_MISSKEY_REMOVE, state: %s"));
            }
          }
        }
        break;
      case 0x262u:
        v82 = &self->_delegate;
        v83 = objc_loadWeakRetained((id *)v82);
        v84 = objc_opt_respondsToSelector();

        if ((v84 & 1) != 0)
        {
          v85 = objc_loadWeakRetained((id *)v82);
          objc_msgSend_receiveErrorIndicationWithCode_(v85, v86, 1, v87);

        }
        break;
      case 0x263u:
        v88 = &self->_delegate;
        v89 = objc_loadWeakRetained((id *)v88);
        v90 = objc_opt_respondsToSelector();

        if ((v90 & 1) != 0)
        {
          v91 = objc_loadWeakRetained((id *)v88);
          objc_msgSend_receiveBlockedIndicationWithReason_(v91, v92, 46, v93);

        }
        break;
      case 0x266u:
        if (self->_state > 2)
        {
          v102 = &self->_delegate;
          v103 = objc_loadWeakRetained((id *)v102);
          v104 = objc_opt_respondsToSelector();

          if ((v104 & 1) != 0)
          {
            v105 = objc_loadWeakRetained((id *)v102);
            objc_msgSend_receiveErrorIndicationWithCode_(v105, v106, 2, v107);

          }
        }
        else
        {
          OSLogHandleForTransportCategory();
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            v95 = (&_IDSStunCandidatePairStateStrings)[self->_state];
            *(_DWORD *)buf = 136315138;
            v112 = (uint64_t)v95;
            _os_log_impl(&dword_19B949000, v94, OS_LOG_TYPE_DEFAULT, "processQUICErrorIndication: Ignoring STUN_ERROR_SHORT_MKI_CACHE_MISS, state: %s", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICErrorIndication: Ignoring STUN_ERROR_SHORT_MKI_CACHE_MISS, state: %s"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICErrorIndication: Ignoring STUN_ERROR_SHORT_MKI_CACHE_MISS, state: %s"));
            }
          }
        }
        break;
      default:
        OSLogHandleForTransportCategory();
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v112) = v13;
          _os_log_impl(&dword_19B949000, v78, OS_LOG_TYPE_DEFAULT, "invalid case: %hu", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid case: %hu"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid case: %hu"));
          }
        }
        goto LABEL_23;
    }
    v79 = 1;
  }
  else
  {
    OSLogHandleForTransportCategory();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v77, OS_LOG_TYPE_DEFAULT, "processQUICErrorIndication failed due to invalid errorIndication.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICErrorIndication failed due to invalid errorIndication."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICErrorIndication failed due to invalid errorIndication."));
      }
    }
LABEL_23:
    v79 = 0;
  }

  return v79;
}

- (BOOL)processQUICErrorResponse:(id)a3 packetBuffer:(id *)a4 startTime:(double)a5 headerOverhead:(unint64_t)a6
{
  id v10;
  unint64_t var30;
  const char *v12;
  double v13;
  void *v14;
  uint64_t var33_low;
  int var32;
  const char *v17;
  uint64_t v18;
  double v19;
  int isRealloc;
  const char *v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  double v34;
  BOOL v35;
  NSObject *v36;
  double v37;
  const char *v38;
  uint64_t v39;
  int v40;
  double v41;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  double v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  double v64;
  void *v65;
  uint64_t v66;
  id WeakRetained;
  const char *v68;
  double v69;
  uint64_t StunSentBytes;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  double v74;
  void *v75;
  const char *v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  const char *v81;
  uint64_t v82;
  double v83;
  char *v84;
  char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  double v89;
  char *v90;
  char *v91;
  const char *v92;
  uint64_t v93;
  double v94;
  char *v95;
  char *v96;
  NSObject *v97;
  const char *v98;
  double v99;
  unint64_t participantID;
  void *v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  id v105;
  const char *v106;
  double v107;
  NSObject *v109;
  NSObject *v110;
  NSObject *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  __int128 v116;
  uint64_t v117;
  int64_t var2;
  void *v119;
  uint8_t buf[4];
  _BYTE v121[10];
  _BYTE v122[10];
  void *v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  var30 = a4->var30;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("%llu"), v13, var30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  var33_low = LOWORD(a4->var33);
  var32 = a4->var32;
  isRealloc = objc_msgSend_isRealloc(self, v17, v18, v19);
  v23 = 4084;
  switch(var32)
  {
    case 1:
      if (isRealloc)
        v23 = 4081;
      else
        v23 = 4080;
      break;
    case 2:
    case 3:
    case 4:
    case 6:
    case 8:
    case 9:
LABEL_10:
      v23 = 0;
      break;
    case 5:
      break;
    case 7:
      v23 = 4087;
      break;
    case 10:
      v23 = 4088;
      break;
    default:
      switch(var32)
      {
        case 15:
          v23 = 4085;
          break;
        case 18:
          v23 = 4083;
          break;
        case 20:
          v23 = 2321;
          break;
        case 22:
          v23 = 4082;
          break;
        default:
          goto LABEL_10;
      }
      break;
  }
  if (objc_msgSend_removeProtoRequest_(self, v21, var30, v22))
  {
    if (self->_state != 2)
    {
      OSLogHandleForTransportCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = ids_monotonic_time();
        v40 = *(unsigned __int8 *)(objc_msgSend_address(self->_local, v38, v39, v37) + 1);
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v121 = (unsigned __int16)var32;
        *(_WORD *)&v121[4] = 1024;
        *(_DWORD *)&v121[6] = var33_low;
        *(_WORD *)v122 = 2048;
        *(double *)&v122[2] = (v37 - a5) * 1000.0;
        LOWORD(v123) = 1024;
        *(_DWORD *)((char *)&v123 + 2) = v40;
        _os_log_impl(&dword_19B949000, v36, OS_LOG_TYPE_DEFAULT, "receive error response - type(%04x) error_code(%u) after %0.3lf ms family: %d.", buf, 0x1Eu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v41 = ids_monotonic_time();
          v117 = *(unsigned __int8 *)(objc_msgSend_address(self->_local, v42, v43, v41) + 1);
          *((double *)&v116 + 1) = (v41 - a5) * 1000.0;
          v112 = (unsigned __int16)var32;
          *(_QWORD *)&v116 = var33_low;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive error response - type(%04x) error_code(%u) after %0.3lf ms family: %d."));
          if (_IDSShouldLog())
          {
            v44 = ids_monotonic_time();
            v117 = *(unsigned __int8 *)(objc_msgSend_address(self->_local, v45, v46, v44, (unsigned __int16)var32, var33_low, *((_QWORD *)&v116 + 1), v117)+ 1);
            *((double *)&v116 + 1) = (v44 - a5) * 1000.0;
            v112 = (unsigned __int16)var32;
            *(_QWORD *)&v116 = var33_low;
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive error response - type(%04x) error_code(%u) after %0.3lf ms family: %d."));
          }
        }
      }
      v47 = GLUtilStunErrorToGlobalLinkError(var33_low);
      GLUtilReportAWDStunMessageEventWithType((unsigned __int16)v23, v47, self, 0.0);
      v48 = GLUtilStunErrorToGlobalLinkError(var33_low);
      GLUCreateQRStunMessageEventWithType((unsigned __int16)v23, v48, self, 0, 0.0);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      if (v119)
        objc_msgSend__notifyQREventAdded_(self, v49, (uint64_t)v119, v50);
      if (var32 > 9)
      {
        if (var32 == 10)
        {
          OSLogHandleForTransportCategory();
          v109 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B949000, v109, OS_LOG_TYPE_DEFAULT, "receive plugin registrion error response", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive plugin registrion error response"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive plugin registrion error response"));
            }
          }
          goto LABEL_66;
        }
        if (var32 == 15)
        {
          var2 = a4->var2;
          StunSentBytes = objc_msgSend_getStunSentBytes_(self, v49, (uint64_t)v14, v50);
          OSLogHandleForTransportCategory();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_candidatePairToken(self, v72, v73, v74);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v121 = v75;
            _os_log_impl(&dword_19B949000, v71, OS_LOG_TYPE_DEFAULT, "receive session-info error response for %@.", buf, 0xCu);

          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              objc_msgSend_candidatePairToken(self, v76, v78, v77);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive session-info error response for %@."));

              if (_IDSShouldLog())
              {
                objc_msgSend_candidatePairToken(self, v76, v79, v77, v114);
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive session-info error response for %@."));

              }
            }
          }
          BYTE12(v116) = 0;
          *(_QWORD *)((char *)&v116 + 4) = 2;
          LOWORD(v116) = 0;
          objc_msgSend__notifySessionStreamInfoReceived_withParticipants_lightweightParticipants_joinedParticipantInfo_leftParticipantInfo_sentBytes_receivedBytes_offlineRequest_streamInfoRequest_status_commandFlag_isIndication_(self, v76, 0, v77, 0, 0, 0, 0, StunSentBytes, var2 + a6, v116, v117);
        }
      }
      else if (var32 == 1)
      {
        OSLogHandleForTransportCategory();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          v84 = (&_IDSStunCandidatePairStateStrings)[self->_state];
          v85 = off_1EE40A668;
          objc_msgSend_candidatePairToken(self, v81, v82, v83);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)v121 = v84;
          *(_WORD *)&v121[8] = 2080;
          *(_QWORD *)v122 = v85;
          *(_WORD *)&v122[8] = 2112;
          v123 = v86;
          _os_log_impl(&dword_19B949000, v80, OS_LOG_TYPE_DEFAULT, "update state (%s->%s) for %@.", buf, 0x20u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v90 = (&_IDSStunCandidatePairStateStrings)[self->_state];
            v91 = off_1EE40A668;
            objc_msgSend_candidatePairToken(self, v87, v88, v89);
            *(_QWORD *)&v116 = v91;
            *((_QWORD *)&v116 + 1) = objc_claimAutoreleasedReturnValue();
            v112 = (uint64_t)v90;
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update state (%s->%s) for %@."));

            if (_IDSShouldLog())
            {
              v95 = (&_IDSStunCandidatePairStateStrings)[self->_state];
              v96 = off_1EE40A668;
              objc_msgSend_candidatePairToken(self, v92, v93, v94, v90, v116);
              *(_QWORD *)&v116 = v96;
              *((_QWORD *)&v116 + 1) = objc_claimAutoreleasedReturnValue();
              v112 = (uint64_t)v95;
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update state (%s->%s) for %@."));

            }
          }
        }
        self->_state = 2;
        OSLogHandleForTransportCategory();
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          participantID = self->_participantID;
          objc_msgSend_base64EncodedStringWithOptions_(self->_relaySessionToken, v98, 0, v99);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v121 = participantID;
          *(_WORD *)&v121[8] = 2112;
          *(_QWORD *)v122 = v101;
          _os_log_impl(&dword_19B949000, v97, OS_LOG_TYPE_DEFAULT, "failed participant:[%16llX], token:[%@]", buf, 0x16u);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v102 = self->_participantID;
            objc_msgSend_base64EncodedStringWithOptions_(self->_relaySessionToken, v49, 0, v50);
            v112 = v102;
            *(_QWORD *)&v116 = objc_claimAutoreleasedReturnValue();
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed participant:[%16llX], token:[%@]"));

            if (_IDSShouldLog())
            {
              v103 = self->_participantID;
              objc_msgSend_base64EncodedStringWithOptions_(self->_relaySessionToken, v49, 0, v50, v112, (_QWORD)v116);
              v112 = v103;
              *(_QWORD *)&v116 = objc_claimAutoreleasedReturnValue();
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed participant:[%16llX], token:[%@]"));

            }
          }
        }
      }
      else if (var32 == 7)
      {
        OSLogHandleForTransportCategory();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_candidatePairToken(self, v52, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v121 = v55;
          _os_log_impl(&dword_19B949000, v51, OS_LOG_TYPE_DEFAULT, "receive participant update error response for %@.", buf, 0xCu);

        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            objc_msgSend_candidatePairToken(self, v56, v57, v58);
            v112 = objc_claimAutoreleasedReturnValue();
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive participant update error response for %@."));

            if (_IDSShouldLog())
            {
              objc_msgSend_candidatePairToken(self, v56, v57, v58, v112);
              v112 = objc_claimAutoreleasedReturnValue();
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive participant update error response for %@."));

            }
          }
        }
        objc_msgSend_participantUpdateResponse(v10, v56, v57, v58, v112, v116, v117);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v59;
        if (v59)
        {
          ProtoUtilProcessParticipantUpdate(v59, var33_low, 7);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v61;
          if (v61 && objc_msgSend_count(v61, v62, v63, v64))
          {
            v66 = sub_19BAA3C70(var33_low);
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend_candidatePair_didReceiveParticipantUpdate_status_(WeakRetained, v68, (uint64_t)self, v69, v65, v66);

            v35 = 1;
          }
          else
          {
            OSLogHandleForTransportCategory();
            v110 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B949000, v110, OS_LOG_TYPE_DEFAULT, "receive participant update error response: invalid participantUpdateInfo", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive participant update error response: invalid participantUpdateInfo"));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive participant update error response: invalid participantUpdateInfo"));
              }
            }
            v35 = 0;
          }

        }
        else
        {
          OSLogHandleForTransportCategory();
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B949000, v111, OS_LOG_TYPE_DEFAULT, "processQUICErrorResponse failed due to invalid participantUpdateResponse.", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processQUICErrorResponse failed due to invalid participantUpdateResponse."));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processQUICErrorResponse failed due to invalid participantUpdateResponse."));
            }
          }
          v35 = 0;
        }

        goto LABEL_67;
      }
      v104 = objc_msgSend__didLocalExternalAddressChange_(self, v49, (uint64_t)&a4->var19, v50, v112, v116);
      v105 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend_candidatePair_didReceiveStunErrorResponse_errorCode_didLocalExternalAddressChange_(v105, v106, (uint64_t)self, v107, v23, var33_low, v104);

LABEL_66:
      v35 = 1;
LABEL_67:

      goto LABEL_68;
    }
    OSLogHandleForTransportCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_candidatePairToken(self, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v121 = v28;
      *(_WORD *)&v121[8] = 1024;
      *(_DWORD *)v122 = (unsigned __int16)var32;
      _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, "%@ is already in error state, ignore error response %04x.", buf, 0x12u);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        objc_msgSend_candidatePairToken(self, v29, v30, v31);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("%@ is already in error state, ignore error response %04x."));

        if (_IDSShouldLog())
        {
          objc_msgSend_candidatePairToken(self, v32, v33, v34, v113, (unsigned __int16)var32);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("%@ is already in error state, ignore error response %04x."));
          goto LABEL_66;
        }
      }
    }
  }
  v35 = 1;
LABEL_68:

  return v35;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (IDSStunCandidate)local
{
  return (IDSStunCandidate *)objc_getProperty(self, a2, 16, 1);
}

- (IDSStunCandidate)remote
{
  return (IDSStunCandidate *)objc_getProperty(self, a2, 24, 1);
}

- (IDSStunCandidate)relayRemote
{
  return (IDSStunCandidate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRelayRemote:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isNominated
{
  return self->_isNominated;
}

- (void)setIsNominated:(BOOL)a3
{
  self->_isNominated = a3;
}

- (char)linkID
{
  return self->_linkID;
}

- (void)setLinkID:(char)a3
{
  self->_linkID = a3;
}

- (BOOL)hbStarted
{
  return self->_hbStarted;
}

- (void)setHbStarted:(BOOL)a3
{
  self->_hbStarted = a3;
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSData)relaySessionToken
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (NSData)relaySessionKey
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)isAcceptedRelaySession
{
  return self->_isAcceptedRelaySession;
}

- (void)setIsAcceptedRelaySession:(BOOL)a3
{
  self->_isAcceptedRelaySession = a3;
}

- (unint64_t)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(unint64_t)a3
{
  self->_participantID = a3;
}

- (NSString)pskTransportParameters
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (NSString)pskH3Settings
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (NSUUID)defaultLocalDeviceCBUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 320, 1);
}

- (void)setDefaultLocalDeviceCBUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (NSUUID)defaultRemoteDeviceCBUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 328, 1);
}

- (void)setDefaultRemoteDeviceCBUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 328);
}

- (int64_t)relayProviderType
{
  return self->_relayProviderType;
}

- (void)setRelayProviderType:(int64_t)a3
{
  self->_relayProviderType = a3;
}

- (int64_t)allocateType
{
  return self->_allocateType;
}

- (void)setAllocateType:(int64_t)a3
{
  self->_allocateType = a3;
}

- (double)allocateTime
{
  return self->_allocateTime;
}

- (void)setAllocateTime:(double)a3
{
  self->_allocateTime = a3;
}

- (double)selfAllocateStartTime
{
  return self->_selfAllocateStartTime;
}

- (void)setSelfAllocateStartTime:(double)a3
{
  self->_selfAllocateStartTime = a3;
}

- (double)serverLatency
{
  return self->_serverLatency;
}

- (void)setServerLatency:(double)a3
{
  self->_serverLatency = a3;
}

- (BOOL)pendingRealloc
{
  return self->_pendingRealloc;
}

- (BOOL)recvConnected
{
  return self->_recvConnected;
}

- (void)setRecvConnected:(BOOL)a3
{
  self->_recvConnected = a3;
}

- (BOOL)recvConnectedAck
{
  return self->_recvConnectedAck;
}

- (void)setRecvConnectedAck:(BOOL)a3
{
  self->_recvConnectedAck = a3;
}

- (BOOL)recvDisconnected
{
  return self->_recvDisconnected;
}

- (void)setRecvDisconnected:(BOOL)a3
{
  self->_recvDisconnected = a3;
}

- (BOOL)recvDisconnectedAck
{
  return self->_recvDisconnectedAck;
}

- (void)setRecvDisconnectedAck:(BOOL)a3
{
  self->_recvDisconnectedAck = a3;
}

- (NSData)skeData
{
  return (NSData *)objc_getProperty(self, a2, 392, 1);
}

- (void)setSkeData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 392);
}

- (double)testStartTime
{
  return self->_testStartTime;
}

- (BOOL)isDisconnecting
{
  return self->_isDisconnecting;
}

- (void)setIsDisconnecting:(BOOL)a3
{
  self->_isDisconnecting = a3;
}

- (BOOL)pendingNoSessionStateAllocbind
{
  return self->_pendingNoSessionStateAllocbind;
}

- (void)setPendingNoSessionStateAllocbind:(BOOL)a3
{
  self->_pendingNoSessionStateAllocbind = a3;
}

- (unsigned)testOptions
{
  return self->_testOptions;
}

- (NSString)testSubOperation
{
  return (NSString *)objc_getProperty(self, a2, 544, 1);
}

- (double)triggeredCheckTime
{
  return self->_triggeredCheckTime;
}

- (void)setTriggeredCheckTime:(double)a3
{
  self->_triggeredCheckTime = a3;
}

- (unsigned)remoteRelayLinkID
{
  return self->_remoteRelayLinkID;
}

- (char)delegatedLinkID
{
  return self->_delegatedLinkID;
}

- (NSDictionary)URIToParticipantIDs
{
  return self->_URIToParticipantIDs;
}

- (BOOL)isConnectToQRIPv6Enabled
{
  return self->_isConnectToQRIPv6Enabled;
}

- (void)setIsConnectToQRIPv6Enabled:(BOOL)a3
{
  self->_isConnectToQRIPv6Enabled = a3;
}

- (double)lastIncomingPacketTime
{
  return self->_lastIncomingPacketTime;
}

- (void)setLastIncomingPacketTime:(double)a3
{
  self->_lastIncomingPacketTime = a3;
}

- (double)lastOutgoingPacketTime
{
  return self->_lastOutgoingPacketTime;
}

- (void)setLastOutgoingPacketTime:(double)a3
{
  self->_lastOutgoingPacketTime = a3;
}

- (double)lastStatsReport
{
  return self->_lastStatsReport;
}

- (void)setLastStatsReport:(double)a3
{
  self->_lastStatsReport = a3;
}

- (unsigned)totalPacketsSentOnLink
{
  return self->_totalPacketsSentOnLink;
}

- (void)setTotalPacketsSentOnLink:(unsigned int)a3
{
  self->_totalPacketsSentOnLink = a3;
}

- (unsigned)totalPacketsReceivedOnLink
{
  return self->_totalPacketsReceivedOnLink;
}

- (void)setTotalPacketsReceivedOnLink:(unsigned int)a3
{
  self->_totalPacketsReceivedOnLink = a3;
}

- (double)hbStartTime
{
  return self->_hbStartTime;
}

- (void)setHbStartTime:(double)a3
{
  self->_hbStartTime = a3;
}

- (unsigned)statsIntervalInSeconds
{
  return self->_statsIntervalInSeconds;
}

- (NSData)hbhSalt
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (NSData)hbhEncKey
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHbhEncKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSData)hbhDecKey
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setHbhDecKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSUUID)linkUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLinkUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (OS_dispatch_source)allocbindFailoverTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 608, 1);
}

- (void)setAllocbindFailoverTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 608);
}

- (IDSQuickRelaySessionInfo)relaySessionInfo
{
  return (IDSQuickRelaySessionInfo *)objc_getProperty(self, a2, 200, 1);
}

- (NSDictionary)sessionInfoDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (unsigned)channelNumber
{
  return self->_channelNumber;
}

- (void)setChannelNumber:(unsigned __int16)a3
{
  self->_channelNumber = a3;
}

- (unsigned)relayLinkID
{
  return self->_relayLinkID;
}

- (unint64_t)capabilityFlags
{
  return self->_capabilityFlags;
}

- (unsigned)stateFlags
{
  return self->_stateFlags;
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (BOOL)enableSKE
{
  return self->_enableSKE;
}

- (NSData)softwareData
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (NSMutableArray)pendingStunRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 272, 1);
}

- (NSMutableArray)repliedStunRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 280, 1);
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (BOOL)isQUIC
{
  return self->_isQUIC;
}

- (unsigned)sessionInfoReqCount
{
  return self->_sessionInfoReqCount;
}

- (BOOL)recvSKEData
{
  return self->_recvSKEData;
}

- (void)setRecvSKEData:(BOOL)a3
{
  self->_recvSKEData = a3;
}

- (BOOL)sentSKEData
{
  return self->_sentSKEData;
}

- (void)setSentSKEData:(BOOL)a3
{
  self->_sentSKEData = a3;
}

- (BOOL)isNAT64
{
  return self->_isNAT64;
}

- (void)setIsNAT64:(BOOL)a3
{
  self->_isNAT64 = a3;
}

- (BOOL)isRealloc
{
  return self->_isRealloc;
}

- (void)setIsRealloc:(BOOL)a3
{
  self->_isRealloc = a3;
}

- (NSData)encKey
{
  return (NSData *)objc_getProperty(self, a2, 488, 1);
}

- (NSData)decKey
{
  return (NSData *)objc_getProperty(self, a2, 496, 1);
}

- (NSData)hmacKey
{
  return (NSData *)objc_getProperty(self, a2, 504, 1);
}

- (NSDictionary)participantIDMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 512, 1);
}

- (BOOL)serverIsDegraded
{
  return self->_serverIsDegraded;
}

- (unsigned)testRequestedErrorCode
{
  return self->_testRequestedErrorCode;
}

- (IDSQUICConnectionIDs)QUICConnectionIDs
{
  return self->_QUICConnectionIDs;
}

- (void)setQUICConnectionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_QUICConnectionIDs, a3);
}

- (NSMutableDictionary)connections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 624, 1);
}

- (unint64_t)remoteParticipantID
{
  return self->_remoteParticipantID;
}

- (void)setRemoteParticipantID:(unint64_t)a3
{
  self->_remoteParticipantID = a3;
}

- (IDSGlobalLinkP2PKeyNegotiationProtocol)p2pNegotiation
{
  return self->_p2pNegotiation;
}

- (void)setP2pNegotiation:(id)a3
{
  objc_storeStrong((id *)&self->_p2pNegotiation, a3);
}

- (IDSGlobalLinkP2PNegotiatedKeysProtocol)p2pNegotiatedKeys
{
  return self->_p2pNegotiatedKeys;
}

- (void)setP2pNegotiatedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_p2pNegotiatedKeys, a3);
}

- (IDSGFTMetricsLink)linkMetrics
{
  return self->_linkMetrics;
}

- (void)setLinkMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetrics, 0);
  objc_storeStrong((id *)&self->_p2pNegotiatedKeys, 0);
  objc_storeStrong((id *)&self->_p2pNegotiation, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_QUICConnectionIDs, 0);
  objc_storeStrong((id *)&self->_allocbindFailoverTimer, 0);
  objc_storeStrong((id *)&self->_URIToParticipantIDs, 0);
  objc_storeStrong((id *)&self->_probingTimer, 0);
  objc_storeStrong((id *)&self->_testSubOperation, 0);
  objc_storeStrong((id *)&self->_participantIDMap, 0);
  objc_storeStrong((id *)&self->_hmacKey, 0);
  objc_storeStrong((id *)&self->_decKey, 0);
  objc_storeStrong((id *)&self->_encKey, 0);
  objc_storeStrong((id *)&self->_noSessionStateTimer, 0);
  objc_storeStrong((id *)&self->_reallocTimer, 0);
  objc_storeStrong(&self->_sessionGoAwayBlock, 0);
  objc_storeStrong((id *)&self->_sessionGoAwayTimer, 0);
  objc_storeStrong(&self->_sessionConvergenceBlock, 0);
  objc_storeStrong((id *)&self->_sessionConvergenceTimer, 0);
  objc_storeStrong(&self->_sessionConnectedTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_sessionConnectedTimer, 0);
  objc_storeStrong((id *)&self->_skeData, 0);
  objc_storeStrong((id *)&self->_requestIDToStatsIDs, 0);
  objc_storeStrong((id *)&self->_defaultRemoteDeviceCBUUID, 0);
  objc_storeStrong((id *)&self->_defaultLocalDeviceCBUUID, 0);
  objc_storeStrong((id *)&self->_pluginNameToStunReqID, 0);
  objc_storeStrong((id *)&self->_stunSentBytesToRequestID, 0);
  objc_storeStrong((id *)&self->_requestIDToSessionInfoReqType, 0);
  objc_storeStrong((id *)&self->_requestIDToQueryLinkIDs, 0);
  objc_storeStrong((id *)&self->_repliedStunRequests, 0);
  objc_storeStrong((id *)&self->_pendingStunRequests, 0);
  objc_storeStrong((id *)&self->_pendingProtoRequests, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_softwareData, 0);
  objc_storeStrong((id *)&self->_sessionInfoDict, 0);
  objc_storeStrong((id *)&self->_relaySessionInfo, 0);
  objc_storeStrong((id *)&self->_pskH3Settings, 0);
  objc_storeStrong((id *)&self->_pskTransportParameters, 0);
  objc_storeStrong((id *)&self->_relaySessionKey, 0);
  objc_storeStrong((id *)&self->_relaySessionToken, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_linkUUID, 0);
  objc_storeStrong((id *)&self->_hbhDecKey, 0);
  objc_storeStrong((id *)&self->_hbhEncKey, 0);
  objc_storeStrong((id *)&self->_hbhSalt, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_relayRemote, 0);
  objc_storeStrong((id *)&self->_remote, 0);
  objc_storeStrong((id *)&self->_local, 0);
}

@end
