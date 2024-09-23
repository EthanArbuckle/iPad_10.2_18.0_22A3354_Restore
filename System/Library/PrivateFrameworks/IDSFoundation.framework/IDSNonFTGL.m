@implementation IDSNonFTGL

- (void)startWithOptions:(id)a3
{
  const char *v4;
  uint64_t v5;
  const __CFDictionary *v6;
  double v7;
  void *Value;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  NSObject *v14;
  NSString *idsSessionID;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;
  uint8_t buf[4];
  IDSNonFTGL *v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFDictionary *)a3;
  Value = 0;
  if (v6)
  {
    v4 = CFSTR("gl-option-client-type");
    if (CFSTR("gl-option-client-type"))
      Value = (void *)CFDictionaryGetValue(v6, CFSTR("gl-option-client-type"));
  }
  v9 = objc_msgSend_unsignedIntValue(Value, v4, v5, v7);
  self->super._clientType = v9;
  self->super._useSecureControlMessage = 1;
  OSLogHandleForTransportCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v9;
    _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "enable secure control message for client type: %u.", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v18 = v9;
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("enable secure control message for client type: %u."));
      if (_IDSShouldLog())
      {
        v18 = v9;
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("enable secure control message for client type: %u."));
      }
    }
  }
  objc_msgSend_NonFTGL(IDSFoundationLog, v11, v12, v13, v18);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    idsSessionID = self->super._idsSessionID;
    *(_DWORD *)buf = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = idsSessionID;
    _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_DEFAULT, "Start GL %@ for IDSSessionID: %@ (FaceTime:NO, isMultiway:NO).", buf, 0x16u);
  }

  if (IMGetDomainBoolForKey())
  {
    self->super._startPort = 16393;
    self->super._portRange = 10;
    OSLogHandleForTransportCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = (unsigned __int16)v9;
      _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "Use FaceTime port range (with UseFaceTimePortRange defaults) for clientType %u.", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v19 = (unsigned __int16)v9;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Use FaceTime port range (with UseFaceTimePortRange defaults) for clientType %u."));
        if (_IDSShouldLog())
        {
          v19 = (unsigned __int16)v9;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Use FaceTime port range (with UseFaceTimePortRange defaults) for clientType %u."));
        }
      }
    }
  }
  else
  {
    self->super._startPort = 16403;
    self->super._portRange = 70;
    OSLogHandleForTransportCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = (unsigned __int16)v9;
      _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "Use GameKit port range for clientType %u.", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v19 = (unsigned __int16)v9;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Use GameKit port range for clientType %u."));
        if (_IDSShouldLog())
        {
          v19 = (unsigned __int16)v9;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Use GameKit port range for clientType %u."));
        }
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)IDSNonFTGL;
  -[IDSGlobalLink startWithOptions:](&v20, sel_startWithOptions_, v6, v19);
  self->super._enableSKE = 0;
  self->super._reduceCellularUsage = 0;
  self->super._reduceRelayLinkCreation = 0;
  self->super._shouldProcessBasebandNotification = 0;
  self->super._supportChannelData = 0;

}

- (void)disconnectWithCompletionHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IDSNonFTGL;
  -[IDSGlobalLink disconnectWithCompletionHandler:](&v10, sel_disconnectWithCompletionHandler_, a3);
  objc_msgSend__sendSessionDisconnectedCommand(self, v4, v5, v6);
  objc_msgSend__startDisconnectTimer(self, v7, v8, v9);
}

- (void)_notifyCandidatePairConnected:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  double v7;
  uint8_t v8[16];

  v4 = a3;
  if (v4 && self->super._delayedConnData)
  {
    OSLogHandleForTransportCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "connection data is delayed, send it now.", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("connection data is delayed, send it now."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("connection data is delayed, send it now."));
      }
    }
    objc_msgSend__sendConnectionDataWithRemovedAddressList_(self, v6, 0, v7);
  }

}

- (void)_setFirstDefaultCandidatePair:(id)a3
{
  _QWORD *v4;
  const char *v5;
  double v6;
  id v7;

  v7 = a3;
  v4 = IDSQRSendInfoList_ItemAtIndex(self->super._sendInfoList, 0);
  if (v4 && !*((_DWORD *)v4 + 1))
    objc_msgSend__updateDefaultCandidatePair_(self, v5, (uint64_t)v7, v6);

}

- (BOOL)_isBetterCandidatePair:(id)a3 newCandidatePair:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  int v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  int v22;
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
  int v38;
  const char *v39;
  uint64_t v40;
  double v41;
  int v42;
  const char *v43;
  uint64_t v44;
  double v45;
  int v46;
  const char *v47;
  uint64_t v48;
  double v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  int v54;
  const char *v55;
  uint64_t v56;
  double v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  double v61;
  int v62;
  const char *v63;
  uint64_t v64;
  double v65;
  BOOL v66;
  int v67;
  BOOL v68;
  int v69;
  BOOL v70;
  int v71;
  BOOL v72;
  int v73;
  int v74;
  int v75;
  char v76;
  void *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  double v81;
  unsigned int v82;
  const char *v83;
  uint64_t v84;
  double v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  double v89;
  unsigned int v90;
  const char *v91;
  uint64_t v92;
  double v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  double v97;
  unsigned int v98;
  const char *v99;
  uint64_t v100;
  double v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  double v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  void *v111;

  v5 = a3;
  v6 = a4;
  objc_msgSend_local(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_radioAccessTechnology(v10, v11, v12, v13);

  objc_msgSend_remote(v5, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_radioAccessTechnology(v18, v19, v20, v21);

  objc_msgSend_local(v6, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_radioAccessTechnology(v26, v27, v28, v29);

  objc_msgSend_remote(v6, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_radioAccessTechnology(v34, v35, v36, v37);

  v42 = objc_msgSend_channelNumber(v5, v39, v40, v41);
  v46 = objc_msgSend_channelNumber(v6, v43, v44, v45);
  v111 = v5;
  objc_msgSend_local(v5, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = *(unsigned __int8 *)(objc_msgSend_address(v50, v51, v52, v53) + 1);

  objc_msgSend_local(v6, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = *(unsigned __int8 *)(objc_msgSend_address(v58, v59, v60, v61) + 1);

  if (v14)
    v66 = v14 == 9;
  else
    v66 = 1;
  v67 = !v66;
  if (v30)
    v68 = v30 == 9;
  else
    v68 = 1;
  v69 = !v68;
  if (v22)
    v70 = v22 == 9;
  else
    v70 = 1;
  v71 = !v70;
  if (v38)
    v72 = v38 == 9;
  else
    v72 = 1;
  if (!v72)
    v71 = 0;
  if (v67 == v69)
    v67 = v71;
  v73 = (v42 != 0) & ~v67;
  if (v46)
    v73 = 0;
  v74 = v67 | v73;
  v75 = (v54 == 30) & ~v74;
  if (v62 != 2)
    v75 = 0;
  v76 = v74 | v75;
  if ((v74 | v75) == 1 || v62 != 2)
  {
    v77 = v111;
  }
  else
  {
    v77 = v111;
    objc_msgSend_local(v111, v63, v64, v65);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = *(_DWORD *)(objc_msgSend_address(v78, v79, v80, v81) + 4);

    objc_msgSend_remote(v111, v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = *(_DWORD *)(objc_msgSend_external(v86, v87, v88, v89) + 4);

    objc_msgSend_local(v6, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = bswap32(*(_DWORD *)(objc_msgSend_address(v94, v95, v96, v97) + 4));

    objc_msgSend_remote(v6, v99, v100, v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = *(_DWORD *)(objc_msgSend_external(v102, v103, v104, v105) + 4);

    if (HIBYTE(v98) == 10 || (v98 & 0xFFF00000) == 0xAC100000 || (v98 & 0xFFFF0000) == 0xC0A80000)
    {
      v107 = bswap32(v106);
      if ((v107 & 0xFFFF0000) == 0xC0A80000 || (v107 & 0xFF000000) == 0xA000000 || (v107 & 0xFFF00000) == 0xAC100000)
      {
        if ((v108 = bswap32(v82), HIBYTE(v108) != 10)
          && (v108 & 0xFFF00000) != 0xAC100000
          && (v108 & 0xFFFF0000) != 0xC0A80000
          || (v109 = bswap32(v90), HIBYTE(v109) != 10)
          && (v109 & 0xFFF00000) != 0xAC100000
          && (v109 & 0xFFFF0000) != 0xC0A80000)
        {
          v76 = 1;
        }
      }
    }
  }

  return v76;
}

- (void)_selectBetterDefaultCandidatePair:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  id v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  id v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  double v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  double v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->super._allowOnlyOneQR && self->super._isInitiator)
  {
    objc_msgSend_allValues(self->super._tokenToCandidatePairs, v4, v5, v7);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v28, v10, v34, 16);
    if (v13)
    {
      v15 = *(_QWORD *)v29;
LABEL_5:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v8);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v16);
        if ((objc_msgSend_isNominated(v17, v11, v12, v14) & 1) != 0)
          break;
        if (v13 == (id)++v16)
        {
          v13 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v28, v14, v34, 16);
          if (v13)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v13 = v17;

      if (!v13
        || !objc_msgSend__isBetterCandidatePair_newCandidatePair_(self, v19, (uint64_t)v13, v20, v6))
      {
        goto LABEL_22;
      }
      OSLogHandleForTransportCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v6;
        _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "select better candidate pair %@.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v27 = v6;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("select better candidate pair %@."));
          if (_IDSShouldLog())
          {
            v27 = v6;
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("select better candidate pair %@."));
          }
        }
      }
      objc_msgSend_candidatePairToken(v6, v22, v23, v24, v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__nominateCandidatePair_(self, v25, (uint64_t)v18, v26);
    }
    else
    {
LABEL_11:
      v18 = v8;
    }

LABEL_22:
  }

}

- (id)_nextConnectedCandidatePair
{
  uint64_t v2;
  double v3;
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int isRelayStunCandidatePair;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, a2, v2, v3);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v23, v6, v27, 16);
  if (v7)
  {
    v11 = v7;
    v12 = *(_QWORD *)v24;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v12)
        objc_enumerationMutation(v4);
      v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
      isRelayStunCandidatePair = objc_msgSend_isRelayStunCandidatePair(v14, v8, v9, v10, (_QWORD)v23);
      v19 = objc_msgSend_state(v14, v16, v17, v18);
      if (isRelayStunCandidatePair)
      {
        if (v19 == 4)
          goto LABEL_10;
      }
      else if (v19 == 3)
      {
LABEL_10:
        v20 = v14;
        if (v20)
        {
          v21 = v20;
          goto LABEL_15;
        }
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v8, (uint64_t)&v23, v10, v27, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }
  v21 = 0;
LABEL_15:

  return v21;
}

- (void)_selectDefaultCandidatePair
{
  uint64_t v2;
  double v3;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  const char *v21;
  double v22;
  char isRelayStunCandidatePair;
  char v24;
  int v25;
  int v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!self->super._allowOnlyOneQR && self->super._isInitiator)
  {
    objc_msgSend__nextConnectedCandidatePair(self, a2, v2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      OSLogHandleForTransportCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v5;
        _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "currentBestPair: %@.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v36 = v5;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("currentBestPair: %@."));
          if (_IDSShouldLog())
          {
            v36 = v5;
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("currentBestPair: %@."));
          }
        }
      }
      objc_msgSend_allValues(self->super._tokenToCandidatePairs, v7, v8, v9, v36);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v38, v12, v42, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v39;
        v17 = 138412290;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v39 != v16)
              objc_enumerationMutation(v10);
            v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            v20 = objc_msgSend_state(v19, v13, v14, *(double *)&v17, v37);
            if ((objc_msgSend_isEqual_(v19, v21, (uint64_t)v5, v22) & 1) == 0)
            {
              isRelayStunCandidatePair = objc_msgSend_isRelayStunCandidatePair(v19, v13, v14, *(double *)&v17);
              v24 = v20 == 4 ? 0 : isRelayStunCandidatePair;
              if ((v24 & 1) == 0)
              {
                v25 = objc_msgSend_isRelayStunCandidatePair(v19, v13, v14, *(double *)&v17);
                v26 = v20 == 3 ? 1 : v25;
                if (v26 == 1
                  && objc_msgSend__isBetterCandidatePair_newCandidatePair_(self, v13, (uint64_t)v5, *(double *)&v17, v19))
                {
                  v27 = v19;

                  OSLogHandleForTransportCategory();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v44 = v27;
                    _os_log_impl(&dword_19B949000, v28, OS_LOG_TYPE_DEFAULT, "new currentBestPair: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled())
                  {
                    if (_IDSShouldLogTransport())
                    {
                      v37 = v27;
                      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("new currentBestPair: %@"));
                      if (_IDSShouldLog())
                      {
                        v37 = v27;
                        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("new currentBestPair: %@"));
                      }
                    }
                  }
                  v5 = v27;
                }
              }
            }
          }
          v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v38, *(double *)&v17, v42, 16);
        }
        while (v15);
      }

      OSLogHandleForTransportCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v5;
        _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "selected best candidate pair %@.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        v37 = v5;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("selected best candidate pair %@."));
        if (_IDSShouldLog())
        {
          v37 = v5;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("selected best candidate pair %@."));
        }
      }
      objc_msgSend_candidatePairToken(v5, v30, v31, v32, v37);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__nominateCandidatePair_(self, v34, (uint64_t)v33, v35);

    }
  }
}

- (BOOL)_processRemovedLocalAddressList:(id)a3
{
  const char *v4;
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IDSNonFTGL;
  if (-[IDSGlobalLink _processRemovedLocalAddressList:](&v10, sel__processRemovedLocalAddressList_, a3)
    && objc_msgSend__hasCandidatePairInState_anotherState_relayCandidatePairsOnly_excludeSelfAlloc_(self, v4, 3, v5, 4, 0, 0))
  {
    objc_msgSend__setDefaultCandidatePairForNonFT(self, v6, v7, v8);
  }
  return 0;
}

- (void)_startHB:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  double v11;
  id v12;

  v4 = a3;
  objc_msgSend_setHbStarted_(v4, v5, 1, v6);
  objc_msgSend_candidatePairToken(v4, v7, v8, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__sendCommandMessage_stunMessage_options_candidatePairToken_(self, v10, 3, v11, 0, 0, v12);
}

- (void)_handleNoRemotePacket
{
  const char *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  NSObject *v11;
  id v12;
  id WeakRetained;
  char v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;

  v4 = _Block_copy(self->super._connectReadyHandler);
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E0C99D80], v3, (uint64_t)CFSTR("No remote packet time out."), v5, *MEMORY[0x1E0CB2D50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v6, v8, (uint64_t)CFSTR("GlobalLink"), v9, 11, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    im_primary_queue();
    v11 = objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = sub_19B9A4860;
    v23 = &unk_1E3C1C7E8;
    v24 = v10;
    v25 = v4;
    v12 = v10;
    dispatch_async(v11, &v20);

LABEL_5:
    goto LABEL_6;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend_link_didFailToConnectOverCloud_cbuuid_(v12, v18, (uint64_t)self, v19, 0, self->super._cbuuid);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend__stopActivityTimer(self, v15, v16, v17, v20, v21, v22, v23);

}

- (void)_setDefaultCandidatePairForNonFT
{
  uint64_t v2;
  double v3;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->super._allowOnlyOneQR)
  {
    objc_msgSend__nextConnectedCandidatePair(self, a2, v2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      OSLogHandleForTransportCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(v5, v7, v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "default candidate pair is removed, switch to %@.", buf, 0xCu);

      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        objc_msgSend_candidatePairToken(v5, v11, v13, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("default candidate pair is removed, switch to %@."));

        if (_IDSShouldLog())
        {
          objc_msgSend_candidatePairToken(v5, v11, v14, v12, v15);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("default candidate pair is removed, switch to %@."));

        }
      }
      objc_msgSend__updateDefaultCandidatePair_(self, v11, (uint64_t)v5, v12, v15);
    }

  }
  else
  {
    ((void (*)(IDSNonFTGL *, char *))MEMORY[0x1E0DE7D20])(self, sel__selectDefaultCandidatePair);
  }
}

- (BOOL)_setupNewQRLinkIfNecessary:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  NSObject *v8;
  const __CFString *v9;
  BOOL v10;
  unsigned int v11;
  objc_super v13;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->super._hasPendingAllocation)
  {
    objc_msgSend_NonFTGL(IDSFoundationLog, v4, v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self->super._hasPendingAllocation)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "skip set up new QR link, relaySessionID: %@, _hasPendingAllocation: %@", buf, 0x16u);
    }

    v10 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)IDSNonFTGL;
    v11 = -[IDSGlobalLink _setupNewQRLinkIfNecessary:](&v14, sel__setupNewQRLinkIfNecessary_, v6);
    v10 = v11;
    if (!v6 && v11)
    {
      v13.receiver = self;
      v13.super_class = (Class)IDSNonFTGL;
      -[IDSGlobalLink _requestNewTwoWayQRAllocation:](&v13, sel__requestNewTwoWayQRAllocation_, 0);
      v10 = 1;
    }
  }

  return v10;
}

@end
