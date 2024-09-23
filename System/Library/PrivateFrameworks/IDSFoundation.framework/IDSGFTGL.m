@implementation IDSGFTGL

- (void)startWithOptions:(id)a3
{
  const __CFDictionary *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  NSString *idsSessionID;
  void *Value;
  int v11;
  const char *v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  NSObject *v23;
  _BOOL4 isReliableUnicastSession;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *reliableUnicastServerMaterialToProtoMessageTransactionID;
  NSObject *v30;
  const __CFString *v31;
  _BOOL4 receivedRemoteDeviceVersion;
  const __CFString *v33;
  const __CFString *v34;
  NSObject *v35;
  objc_super v36;
  uint8_t buf[4];
  IDSGFTGL *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFDictionary *)a3;
  objc_msgSend_GFTGL(IDSFoundationLog, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    idsSessionID = self->super._idsSessionID;
    *(_DWORD *)buf = 138412546;
    v38 = self;
    v39 = 2112;
    v40 = (const __CFString *)idsSessionID;
    _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "Start GL %@ for IDSSessionID: %@ (FaceTime:YES, isMultiway:YES).", buf, 0x16u);
  }

  Value = 0;
  if (v4 && CFSTR("gl-option-timebase"))
    Value = (void *)CFDictionaryGetValue(v4, CFSTR("gl-option-timebase"));
  objc_storeStrong((id *)&self->super._timeBase, Value);
  self->super._startPort = 16393;
  self->super._portRange = 10;
  v36.receiver = self;
  v36.super_class = (Class)IDSGFTGL;
  -[IDSGlobalLink startWithOptions:](&v36, sel_startWithOptions_, v4);
  if (self->super._isUPlusOneSession)
  {
    v11 = IMGetDomainBoolForKeyWithDefaultValue();
    self->super._allowP2P = v11 ^ 1;
    if (((v11 ^ 1) & 1) == 0)
    {
      objc_msgSend_GFTGL(IDSFoundationLog, v12, v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "disableP2PLinks default is set to YES.", buf, 2u);
      }

    }
    v16 = 0;
    if (v4)
    {
      v12 = CFSTR("gl-option-disable-p2p");
      if (CFSTR("gl-option-disable-p2p"))
        v16 = (void *)CFDictionaryGetValue(v4, CFSTR("gl-option-disable-p2p"));
    }
    if ((objc_msgSend_BOOLValue(v16, v12, v13, v14) & 1) != 0 || self->super._isReliableUnicastSession)
    {
      objc_msgSend_setDisableP2P_(self->super._nwLink, v17, 1, v19);
      self->super._allowP2P = 0;
      self->_allowE2E = 1;
      objc_msgSend_GFTGL(IDSFoundationLog, v20, v21, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        isReliableUnicastSession = self->super._isReliableUnicastSession;
        if (self->super._allowP2P)
          v25 = CFSTR("YES");
        else
          v25 = CFSTR("NO");
        if (self->_allowE2E)
          v26 = CFSTR("YES");
        else
          v26 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v38 = (IDSGFTGL *)v25;
        if (isReliableUnicastSession)
          v27 = CFSTR("YES");
        else
          v27 = CFSTR("NO");
        v39 = 2112;
        v40 = v26;
        v41 = 2112;
        v42 = v27;
        _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "disableP2PLinks is set to YES; _allowP2P = %@, _allowE2E = %@, _isReliableUnicastSession: %@",
          buf,
          0x20u);
      }

      if (self->super._isReliableUnicastSession)
      {
        if (!self->_reliableUnicastServerMaterialToProtoMessageTransactionID)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          reliableUnicastServerMaterialToProtoMessageTransactionID = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
          self->_reliableUnicastServerMaterialToProtoMessageTransactionID = Mutable;

        }
        self->super._receivedRemoteDeviceVersion = 1;
        objc_msgSend_GFTGL(IDSFoundationLog, v17, v18, v19);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = CFSTR("YES");
          receivedRemoteDeviceVersion = self->super._receivedRemoteDeviceVersion;
          if (self->super._allowP2P)
            v33 = CFSTR("YES");
          else
            v33 = CFSTR("NO");
          if (self->_allowE2E)
            v34 = CFSTR("YES");
          else
            v34 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          v38 = (IDSGFTGL *)v33;
          v39 = 2112;
          if (!receivedRemoteDeviceVersion)
            v31 = CFSTR("NO");
          v40 = v34;
          v41 = 2112;
          v42 = v31;
          _os_log_impl(&dword_19B949000, v30, OS_LOG_TYPE_DEFAULT, "Enabled Reliable Unicast Session - _allowP2P = %@, _allowE2E = %@, _receivedRemoteDeviceVersion = %@", buf, 0x20u);
        }

      }
    }
    self->super._useSecureControlMessage = 1;
    objc_msgSend_GFTGL(IDSFoundationLog, v17, v18, v19);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "Enable secure control message for U + 1 Session.", buf, 2u);
    }

  }
  else
  {
    self->super._allowP2P = 0;
  }
  self->super._allowOnlyOneQR = 0;
  self->super._enableSKE = 0;
  self->super._allowConcurrentQRSetup = 1;
  self->super._shouldProcessBasebandNotification = 1;
  self->super._supportChannelData = 1;
  self->_keyMaterialDataCounter = -1;

}

- (void)invalidate
{
  NSArray *remoteCandidatePairs;
  NSMutableArray *virtualCandidatePairs;
  NSMutableDictionary *localRemoteRelayLinkIDToVirtualCandidatePairs;
  objc_super v6;

  remoteCandidatePairs = self->_remoteCandidatePairs;
  self->_remoteCandidatePairs = 0;

  virtualCandidatePairs = self->_virtualCandidatePairs;
  self->_virtualCandidatePairs = 0;

  localRemoteRelayLinkIDToVirtualCandidatePairs = self->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
  self->super._localRemoteRelayLinkIDToVirtualCandidatePairs = 0;

  v6.receiver = self;
  v6.super_class = (Class)IDSGFTGL;
  -[IDSGlobalLink invalidate](&v6, sel_invalidate);
}

- (void)disconnectWithCompletionHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IDSGFTGL;
  -[IDSGlobalLink disconnectWithCompletionHandler:](&v7, sel_disconnectWithCompletionHandler_, a3);
  objc_msgSend__handleDisconnectTimer(self, v4, v5, v6);
}

- (void)setDefaultUnderlyingLink:(char)a3
{
  double v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *linkIDToCandidatePairs;
  void *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  const __CFString *v17;
  int v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->super._isUPlusOneSession)
  {
    objc_msgSend_GFTGL(IDSFoundationLog, a2, a3, v3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    LOWORD(v18) = 0;
    v14 = "setDefaultUnderlyingLink not allowed when not in U+1 mode";
    v15 = v10;
    v16 = 2;
LABEL_16:
    _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v16);
    goto LABEL_17;
  }
  v4 = a3;
  if (!self->super._isInitiator)
  {
    objc_msgSend_GFTGL(IDSFoundationLog, a2, a3, v3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    if (self->super._isInitiator)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    v18 = 67109378;
    v19 = v4;
    v20 = 2112;
    v21 = v17;
    v14 = "set default underlying link (linkID:%d) failed (isInitiator:%@).";
    v15 = v10;
    v16 = 18;
    goto LABEL_16;
  }
  if (!self->super._linkIDToCandidatePairs)
    goto LABEL_9;
  objc_msgSend_numberWithChar_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        linkIDToCandidatePairs = self->super._linkIDToCandidatePairs,
        objc_msgSend_numberWithChar_(MEMORY[0x1E0CB37E8], a2, v4, v3),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = (id)CFDictionaryGetValue((CFDictionaryRef)linkIDToCandidatePairs, v9),
        v9,
        v7,
        !v10))
  {
LABEL_9:
    objc_msgSend_GFTGL(IDSFoundationLog, a2, a3, v3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v18 = 67109120;
    v19 = v4;
    v14 = "failed to find candidate pair for linkID:%d.";
    v15 = v10;
    v16 = 8;
    goto LABEL_16;
  }
  objc_msgSend_candidatePairToken(v10, a2, a3, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__nominateCandidatePair_(self, v12, (uint64_t)v11, v13);

LABEL_17:
}

- (void)_setupVirtualCandidatePairs:(id)a3 remoteCandidatePair:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  char isEqualToString;
  const char *v26;
  uint64_t v27;
  double v28;
  NSMutableArray *v29;
  const char *v30;
  double v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  NSMutableArray *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  const char *v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  double v52;
  int v53;
  const char *v54;
  uint64_t v55;
  double v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  double v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  double v64;
  void *v65;
  const char *v66;
  double v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  double v71;
  uint64_t isNAT64;
  const char *v73;
  double v74;
  const char *v75;
  double v76;
  const char *v77;
  double v78;
  const char *v79;
  double v80;
  const char *v81;
  uint64_t v82;
  double v83;
  const char *v84;
  uint64_t v85;
  double v86;
  uint64_t v87;
  const char *v88;
  double v89;
  const char *v90;
  uint64_t v91;
  double v92;
  uint64_t v93;
  const char *v94;
  double v95;
  const char *v96;
  double v97;
  const char *v98;
  uint64_t v99;
  double v100;
  uint64_t IsDegraded;
  const char *v102;
  double v103;
  const char *v104;
  uint64_t v105;
  double v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  double v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  double v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  double v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  double v122;
  uint64_t v123;
  const char *v124;
  double v125;
  const char *v126;
  uint64_t v127;
  double v128;
  __CFArray *virtualCandidatePairs;
  NSMutableArray *v130;
  NSMutableArray *v131;
  unsigned int v132;
  const char *v133;
  uint64_t v134;
  double v135;
  const char *v136;
  double v137;
  const void *v138;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *localRemoteRelayLinkIDToVirtualCandidatePairs;
  const char *v141;
  uint64_t v142;
  double v143;
  NSMutableArray *v144;
  const char *v145;
  uint64_t v146;
  double v147;
  void *v148;
  NSObject *v149;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  double v160;
  NSObject *v161;
  const char *v162;
  uint64_t v163;
  double v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  double v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  double v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  double v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  double v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  double v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  double v188;
  const char *v189;
  double v190;
  IDSNWLink *v191;
  const char *v192;
  uint64_t v193;
  double v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  double v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  double v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  double v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  double v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  double v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  double v218;
  const char *v219;
  double v220;
  void *v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  double v225;
  void *v226;
  const char *v227;
  double v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  double v232;
  void *v233;
  const char *v234;
  double v235;
  const char *v236;
  double v237;
  const char *v238;
  uint64_t v239;
  double v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  double v244;
  const char *v245;
  double v246;
  char isCellularStunCandidate;
  uint64_t v248;
  IDSNWLink *nwLink;
  void *v250;
  IDSGFTGL *v251;
  void *v252;
  unsigned int v253;
  void *v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  uint8_t v259[128];
  uint8_t buf[4];
  NSMutableArray *v261;
  __int16 v262;
  void *v263;
  uint64_t v264;

  v264 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11 = objc_msgSend_relayLinkID(v6, v8, v9, v10);
  v253 = objc_msgSend_relayLinkID(v7, v12, v13, v14);
  objc_msgSend_sessionID(v6, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sessionID(v7, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v18, v23, (uint64_t)v22, v24);

  if ((isEqualToString & 1) != 0)
  {
    v251 = self;
    v252 = v7;
    v257 = 0u;
    v258 = 0u;
    v255 = 0u;
    v256 = 0u;
    v29 = self->_virtualCandidatePairs;
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v255, v31, v259, 16);
    if (v32)
    {
      v36 = v32;
      v37 = *(_QWORD *)v256;
      while (2)
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v256 != v37)
            objc_enumerationMutation(v29);
          v39 = *(NSMutableArray **)(*((_QWORD *)&v255 + 1) + 8 * i);
          objc_msgSend_sessionID(v39, v33, v34, v35);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_sessionID(v6, v41, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqualToString_(v40, v45, (uint64_t)v44, v46)
            && objc_msgSend_relayLinkID(v39, v47, v48, v49) == (_DWORD)v11)
          {
            v53 = objc_msgSend_remoteRelayLinkID(v39, v50, v51, v52);

            if (v53 == v253)
            {
              objc_msgSend_GFTGL(IDSFoundationLog, v33, v34, v35);
              v149 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v261 = v39;
                _os_log_impl(&dword_19B949000, v149, OS_LOG_TYPE_DEFAULT, "[U+1] Virtual candidate pair exists %@, no need to set up virtual candidate pairs, return", buf, 0xCu);
              }

              goto LABEL_33;
            }
          }
          else
          {

          }
        }
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v33, (uint64_t)&v255, v35, v259, 16);
        if (v36)
          continue;
        break;
      }
    }

    objc_msgSend_local(v6, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remote(v252, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sessionID(v6, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_candidatePairWithLocalCandidate_remoteCandidate_sessionID_delegate_(IDSStunCandidatePair, v66, (uint64_t)v57, v67, v61, v65, v251);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    isNAT64 = objc_msgSend_isNAT64(v6, v69, v70, v71);
    objc_msgSend_setIsNAT64_(v68, v73, isNAT64, v74);
    objc_msgSend_setState_(v68, v75, 4, v76);
    objc_msgSend_setRelayLinkID_(v68, v77, v11, v78);
    objc_msgSend_setRemoteRelayLinkID_(v68, v79, v253, v80);
    objc_msgSend_setLinkUUIDWithRelayLinkIDs(v68, v81, v82, v83);
    v87 = objc_msgSend_linkID(v6, v84, v85, v86);
    objc_msgSend_setDelegatedLinkID_(v68, v88, v87, v89);
    v93 = objc_msgSend_channelNumber(v6, v90, v91, v92);
    objc_msgSend_setChannelNumber_(v68, v94, v93, v95);
    objc_msgSend_setRelayProviderType_(v68, v96, 2, v97);
    IsDegraded = objc_msgSend_serverIsDegraded(v6, v98, v99, v100);
    objc_msgSend_setServerIsDegraded_(v68, v102, IsDegraded, v103);
    objc_msgSend_remote(v68, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remote(v6, v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend_address(v111, v112, v113, v114);
    objc_msgSend_remote(v6, v116, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend_external(v119, v120, v121, v122);
    objc_msgSend_setAddress_external_(v107, v124, v115, v125, v123);

    virtualCandidatePairs = (__CFArray *)v251->_virtualCandidatePairs;
    if (!virtualCandidatePairs)
    {
      v130 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v131 = v251->_virtualCandidatePairs;
      v251->_virtualCandidatePairs = v130;

      virtualCandidatePairs = (__CFArray *)v251->_virtualCandidatePairs;
    }
    if (virtualCandidatePairs && v68)
      CFArrayAppendValue(virtualCandidatePairs, v68);
    v132 = objc_msgSend_relayLinkID(v6, v126, v127, v128);
    v136 = (const char *)objc_msgSend_relayLinkID(v252, v133, v134, v135);
    localRemoteRelayLinkIDForVirtualStunCandidatePair(v132, v136, v137);
    v138 = (const void *)objc_claimAutoreleasedReturnValue();
    if (!v251->super._localRemoteRelayLinkIDToVirtualCandidatePairs)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      localRemoteRelayLinkIDToVirtualCandidatePairs = v251->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
      v251->super._localRemoteRelayLinkIDToVirtualCandidatePairs = (NSMutableDictionary *)Mutable;

    }
    v29 = v68;
    if (v68)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v251->super._localRemoteRelayLinkIDToVirtualCandidatePairs, v138, v29);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAF62F4((uint64_t)v138, v151, v152, v153, v154, v155, v156, v157);
    }
    v254 = (void *)v138;

    objc_msgSend_GFTGL(IDSFoundationLog, v158, v159, v160);
    v161 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v261 = v29;
      _os_log_impl(&dword_19B949000, v161, OS_LOG_TYPE_DEFAULT, "[U+1] set up virtual candidate pair: %@", buf, 0xCu);
    }

    nwLink = v251->super._nwLink;
    objc_msgSend_local(v29, v162, v163, v164);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = objc_msgSend_address(v165, v166, v167, v168);
    objc_msgSend_remote(v29, v170, v171, v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = objc_msgSend_external(v173, v174, v175, v176);
    objc_msgSend_sessionID(v29, v178, v179, v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_local(v29, v182, v183, v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    isCellularStunCandidate = objc_msgSend_isCellularStunCandidate(v185, v186, v187, v188);
    objc_msgSend_connectionInfoForLocalAddress_remoteAddress_clientUniquePID_sessionID_type_isRelay_isCellular_(nwLink, v189, v169, v190, v177, 0, v181, 7, 1, isCellularStunCandidate);
    v250 = (void *)objc_claimAutoreleasedReturnValue();

    v191 = v251->super._nwLink;
    objc_msgSend_local(v29, v192, v193, v194);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = objc_msgSend_address(v195, v196, v197, v198);
    objc_msgSend_remote(v29, v200, v201, v202);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = objc_msgSend_external(v203, v204, v205, v206);
    objc_msgSend_sessionID(v29, v208, v209, v210);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_local(v29, v212, v213, v214);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v248) = objc_msgSend_isCellularStunCandidate(v215, v216, v217, v218);
    objc_msgSend_connectionInfoForLocalAddress_remoteAddress_clientUniquePID_sessionID_type_isRelay_isCellular_(v191, v219, v199, v220, v207, 0, v211, 0, 1, v248);
    v221 = (void *)objc_claimAutoreleasedReturnValue();

    GLUtilConnectionDictionaryForNWConnectionInfo(v221, 1);
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_connections(v29, v223, v224, v225);
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v226, v227, (uint64_t)v222, v228, CFSTR("udp"));

    GLUtilConnectionDictionaryForNWConnectionInfo(v250, v251->super._allowTLEOverVRLinks);
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_connections(v29, v230, v231, v232);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v233, v234, (uint64_t)v229, v235, CFSTR("qpod"));

    objc_msgSend__setCandidatePairConnected_(v251, v236, (uint64_t)v29, v237);
    objc_msgSend_linkMetrics(v29, v238, v239, v240);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_virtualRelayLinkConnected(v241, v242, v243, v244);

    objc_msgSend__sendRegisterRequest_(v251, v245, (uint64_t)v29, v246);
LABEL_33:
    v7 = v252;
  }
  else
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v26, v27, v28);
    v29 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v29->super.super, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_sessionID(v6, v141, v142, v143);
      v144 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sessionID(v7, v145, v146, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v261 = v144;
      v262 = 2112;
      v263 = v148;
      _os_log_impl(&dword_19B949000, &v29->super.super, OS_LOG_TYPE_DEFAULT, "[U+1]: _setupVirtualCandidatePairs local sessionID: %@ doesn't match remote sessionID: %@, return", buf, 0x16u);

    }
  }

}

- (void)_sendRegisterRequest:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  CFMutableDictionaryRef Mutable;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  const char *v33;
  uint64_t v34;
  double v35;
  NSObject *v36;
  const char *v37;
  double v38;
  const char *v39;
  uint64_t v40;
  double v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  id *v47;
  id v48;
  id *v49;
  __CFDictionary *v50;
  const char *v51;
  double v52;
  id v53;
  __CFDictionary *v54;
  const char *v55;
  double v56;
  _QWORD v57[5];
  id v58;
  CFMutableDictionaryRef v59;
  _QWORD v60[5];
  id v61;
  CFMutableDictionaryRef v62;
  uint8_t buf[16];

  v4 = a3;
  v8 = v4;
  if (self->super._isReliableUnicastSession
    && objc_msgSend_isVirtualRelayStunCandidatePair(v4, v5, v6, v7))
  {
    if (self->super._isReliableUnicastClient)
    {
      v12 = objc_msgSend_relayLinkID(v8, v9, v10, v11);
      if ((_DWORD)v12)
      {
        v16 = v12;
        v17 = objc_msgSend_remoteRelayLinkID(v8, v13, v14, v15);
        if ((_DWORD)v17)
        {
          v21 = v17;
          Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v23, v16, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v26, (uint64_t)v25, v27, CFSTR("gl-option-reliable-unicast-local-relay-id"));

          objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v28, v21, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v31, (uint64_t)v30, v32, CFSTR("gl-option-reliable-unicast-remote-relay-id"));

          objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v33, v34, v35);
          v36 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v37, (uint64_t)v36, v38, CFSTR("gl-option-reliable-unicast-reliable-link-uuid"));
          objc_msgSend_local(v8, v39, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend_transport(v42, v43, v44, v45);

          if (v46 == 2)
          {
            v60[0] = MEMORY[0x1E0C809B0];
            v60[1] = 3221225472;
            v60[2] = sub_19BA30A4C;
            v60[3] = &unk_1E3C1FE50;
            v60[4] = self;
            v47 = &v61;
            v48 = v8;
            v49 = (id *)&v62;
            v61 = v48;
            v62 = Mutable;
            v50 = Mutable;
            objc_msgSend__connectNWLink_disconnectAfterUse_connectedHandler_(self, v51, (uint64_t)v48, v52, 0, v60);
          }
          else
          {
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = sub_19BA30A94;
            v57[3] = &unk_1E3C1FE50;
            v57[4] = self;
            v47 = &v58;
            v53 = v8;
            v49 = (id *)&v59;
            v58 = v53;
            v59 = Mutable;
            v54 = Mutable;
            objc_msgSend__connectNWTCPLink_disconnectAfterUse_connectedHandler_(self, v55, (uint64_t)v53, v56, 0, v57);
          }

        }
        else
        {
          objc_msgSend_GFTGL(IDSFoundationLog, v18, v19, v20);
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            sub_19BAF63A0();
        }
      }
      else
      {
        objc_msgSend_GFTGL(IDSFoundationLog, v13, v14, v15);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          sub_19BAF6374();
      }
    }
    else
    {
      objc_msgSend_GFTGL(IDSFoundationLog, v9, v10, v11);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v36, OS_LOG_TYPE_DEFAULT, "Will not send register request, not a client device. Remote will kick-off registration!", buf, 2u);
      }
    }

  }
}

- (void)_sendQUICRegisterRequest:(id)a3 withOptions:(id)a4
{
  __CFString *v6;
  id v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  NSMutableDictionary *tokenToCandidatePairs;
  void *v12;
  void *v13;
  IDSQRProtoMessage *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  double v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  NSString *idsSessionID;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  const char *v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *reliableUnicastServerMaterialToProtoMessageTransactionID;
  const char *v40;
  uint64_t v41;
  void *v42;
  double v43;
  NSMutableDictionary *v44;
  void *v45;
  uint64_t v46;
  const char *v47;
  double v48;
  const void *v49;
  NSObject *v50;
  NSObject *v51;
  NSMutableDictionary *v52;
  NSObject *v53;
  uint8_t buf[4];
  const __CFString *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  NSString *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  __CFString *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  if (v6)
  {
    if (self->super._state < 5)
    {
      tokenToCandidatePairs = self->super._tokenToCandidatePairs;
      if (tokenToCandidatePairs
        && (v12 = (id)CFDictionaryGetValue((CFDictionaryRef)tokenToCandidatePairs, v6)) != 0)
      {
        v13 = v12;
        v14 = [IDSQRProtoMessage alloc];
        v19 = (void *)objc_msgSend_initWithType_candidatePair_options_(v14, v15, 29, v16, v13, v7);
        if (v19)
        {
          objc_msgSend_GFTGL(IDSFoundationLog, v17, v18, v20);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            idsSessionID = self->super._idsSessionID;
            objc_msgSend_sessionID(v13, v22, v23, v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v55 = CFSTR("register_request");
            v56 = 2112;
            v57 = v19;
            v58 = 2112;
            v59 = idsSessionID;
            v60 = 2112;
            v61 = v26;
            v62 = 2112;
            v63 = v6;
            _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "Send %@ %@ for IDSSessionID: %@ QRSessionID: %@ candidatePairToken: %@", buf, 0x34u);

          }
          objc_msgSend__sendProtoMessage_candidatePair_(self, v27, (uint64_t)v19, v28, v13);
          v32 = objc_msgSend_transactionID(v19, v29, v30, v31);
          objc_msgSend_addProtoRequest_(v13, v33, v32, v34);
          if (!self->_reliableUnicastServerMaterialToProtoMessageTransactionID)
          {
            Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            reliableUnicastServerMaterialToProtoMessageTransactionID = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
            self->_reliableUnicastServerMaterialToProtoMessageTransactionID = Mutable;

          }
          v42 = (void *)objc_msgSend_copy(v7, v35, v36, v37);
          if (v42)
          {
            v44 = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
            v45 = (void *)MEMORY[0x1E0CB37E8];
            v46 = objc_msgSend_transactionID(v19, v40, v41, v43);
            v49 = (const void *)objc_msgSend_numberWithUnsignedLongLong_(v45, v47, v46, v48);
            CFDictionarySetValue((CFMutableDictionaryRef)v44, v49, v42);
          }

        }
        else
        {
          OSLogHandleForTransportCategory();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v55 = CFSTR("register_request");
            _os_log_impl(&dword_19B949000, v53, OS_LOG_TYPE_DEFAULT, "failed to create proto message (%@)!", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create proto message (%@)!"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create proto message (%@)!"));
            }
          }
        }

      }
      else
      {
        OSLogHandleForTransportCategory();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v50, OS_LOG_TYPE_DEFAULT, "Will not send register request due to invalid candidate pair!", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register request due to invalid candidate pair!"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register request due to invalid candidate pair!"));
          }
        }
        OSLogHandleForTransportCategory();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = self->super._tokenToCandidatePairs;
          *(_DWORD *)buf = 138412546;
          v55 = v6;
          v56 = 2112;
          v57 = v52;
          _os_log_impl(&dword_19B949000, v51, OS_LOG_TYPE_DEFAULT, "_sendQUICRegisterRequest: Token: %@, _tokenToCandidatePairs:%@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_sendQUICRegisterRequest: Token: %@, _tokenToCandidatePairs:%@"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_sendQUICRegisterRequest: Token: %@, _tokenToCandidatePairs:%@"));
          }
        }
      }
    }
    else
    {
      OSLogHandleForTransportCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = _IDSLinkStateStrings[self->super._state];
        *(_DWORD *)buf = 138412546;
        v55 = v6;
        v56 = 2080;
        v57 = v9;
        _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "Will not send register request for %@, GL state [%s]!", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register request for %@, GL state [%s]!"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register request for %@, GL state [%s]!"));
        }
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "Will not send register request due to invalid candidatePairToken!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register request due to invalid candidatePairToken!"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register request due to invalid candidatePairToken!"));
      }
    }
  }

}

- (BOOL)_processRegisterIndication:(id)a3 candidatePairToken:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  double v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  double v24;
  id v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  const char *v31;
  double v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  double v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  double v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  double v48;
  const char *v49;
  uint64_t v50;
  NSObject *v51;
  double v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  unsigned int v58;
  const char *v59;
  uint64_t v60;
  double v61;
  CFMutableDictionaryRef Mutable;
  const char *v63;
  double v64;
  const char *v65;
  double v66;
  const char *v67;
  double v68;
  void *v69;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  void *v74;
  const char *v75;
  double v76;
  const char *v77;
  double v78;
  const char *v79;
  double v80;
  NSObject *v81;
  NSObject *v82;
  BOOL v83;
  const char *v84;
  const char *v85;
  unsigned int v87;
  uint64_t v88;
  _QWORD block[5];
  id v90;
  CFMutableDictionaryRef v91;
  uint8_t buf[4];
  uint64_t v93;
  __int16 v94;
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend_registerIndication(a3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GFTGL(IDSFoundationLog, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v93 = objc_msgSend_txnId(v10, v15, v16, v17);
    v94 = 2112;
    v95 = v6;
    _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_DEFAULT, "received register-indication(%llu) for %@.", buf, 0x16u);
  }

  if (v10)
  {
    if (self->super._isReliableUnicastSession)
    {
      objc_msgSend_e2eChannelUuid(v10, v18, v19, v20);
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        objc_msgSend_GFTGL(IDSFoundationLog, v21, v22, v24);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "processRegisterIndication failed due to invalid channelUUDData!", buf, 2u);
        }
        v83 = 0;
        goto LABEL_44;
      }
      v25 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v26 = objc_retainAutorelease(v23);
      v30 = objc_msgSend_bytes(v26, v27, v28, v29);
      v35 = objc_msgSend_initWithUUIDBytes_(v25, v31, v30, v32);
      if (!v35)
      {
        objc_msgSend_GFTGL(IDSFoundationLog, v33, v34, v36);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v39, OS_LOG_TYPE_DEFAULT, "processRegisterIndication failed due to invalid reliableLinkUUID!", buf, 2u);
        }
        v83 = 0;
        goto LABEL_43;
      }
      objc_msgSend_virtualQuicClientConnectionId(v10, v33, v34, v36);
      v39 = objc_claimAutoreleasedReturnValue();
      if (!v39)
      {
        objc_msgSend_GFTGL(IDSFoundationLog, v37, v38, v40);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v41, OS_LOG_TYPE_DEFAULT, "processRegisterIndication failed due to invalid virtualConnectionID!", buf, 2u);
        }
        v83 = 0;
        goto LABEL_42;
      }
      objc_msgSend_channelInfo(v10, v37, v38, v40);
      v41 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_quicServerConnectionId(v41, v42, v43, v44);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v47)
      {
        objc_msgSend_GFTGL(IDSFoundationLog, v45, v46, v48);
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v51, OS_LOG_TYPE_DEFAULT, "processRegisterIndication failed due to invalid local connection ID!", buf, 2u);
        }
        v83 = 0;
        goto LABEL_41;
      }
      objc_msgSend_quicClientConnectionId(v41, v45, v46, v48);
      v51 = objc_claimAutoreleasedReturnValue();
      if (!v51)
      {
        objc_msgSend_GFTGL(IDSFoundationLog, v49, v50, v52);
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v82, OS_LOG_TYPE_DEFAULT, "processRegisterIndication failed due to invalid remote connection ID!", buf, 2u);
        }
        v83 = 0;
        goto LABEL_40;
      }
      v88 = (uint64_t)v47;
      v53 = objc_msgSend_quicServerLinkId(v41, v49, v50, v52);
      if ((_DWORD)v53)
      {
        v57 = v53;
        v58 = objc_msgSend_quicClientLinkId(v41, v54, v55, v56);
        if (v58)
        {
          v87 = v58;
          Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v63, v88, v64, CFSTR("gl-option-reliable-unicast-local-connection-id"));
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v65, (uint64_t)v51, v66, CFSTR("gl-option-reliable-unicast-remote-connection-id"));
          objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v67, v57, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v70, (uint64_t)v69, v71, CFSTR("gl-option-reliable-unicast-local-relay-id"));

          objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v72, v87, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v75, (uint64_t)v74, v76, CFSTR("gl-option-reliable-unicast-remote-relay-id"));

          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v77, (uint64_t)v39, v78, CFSTR("gl-option-reliable-unicast-virtual-connection-id"));
          objc_msgSend_setObject_forKeyedSubscript_(Mutable, v79, (uint64_t)v35, v80, CFSTR("gl-option-reliable-unicast-reliable-link-uuid"));
          im_primary_queue();
          v81 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_19BA31748;
          block[3] = &unk_1E3C1FE50;
          block[4] = self;
          v90 = v6;
          v91 = Mutable;
          v82 = Mutable;
          dispatch_async(v81, block);

          v47 = (void *)v88;
          v83 = 1;
LABEL_40:

LABEL_41:
LABEL_42:

LABEL_43:
LABEL_44:

          goto LABEL_45;
        }
        objc_msgSend_GFTGL(IDSFoundationLog, v59, v60, v61);
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v85 = "processRegisterIndication failed due to invalid remote relay link ID!";
          goto LABEL_38;
        }
      }
      else
      {
        objc_msgSend_GFTGL(IDSFoundationLog, v54, v55, v56);
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v85 = "processRegisterIndication failed due to invalid local relay link ID!";
LABEL_38:
          _os_log_impl(&dword_19B949000, v82, OS_LOG_TYPE_DEFAULT, v85, buf, 2u);
        }
      }
      v83 = 0;
      v47 = (void *)v88;
      goto LABEL_40;
    }
    objc_msgSend_GFTGL(IDSFoundationLog, v18, v19, v20);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v84 = "processRegisterIndication failed, not a Reliable Unicast Session!";
      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v18, v19, v20);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v84 = "processRegisterIndication failed due to invalid registerIndication!";
LABEL_17:
      _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, v84, buf, 2u);
    }
  }
  v83 = 0;
LABEL_45:

  return v83;
}

- (void)_sendQUICRegisterAckRequest:(id)a3 withOptions:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  NSMutableDictionary *tokenToCandidatePairs;
  void *v14;
  void *v15;
  IDSQRProtoMessage *v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  char *v21;
  double v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  NSString *idsSessionID;
  void *v28;
  const char *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  const char *v35;
  double v36;
  const char *v37;
  uint64_t v38;
  double v39;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *reliableUnicastServerMaterialToProtoMessageTransactionID;
  const char *v42;
  uint64_t v43;
  void *v44;
  double v45;
  NSMutableDictionary *v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  double v50;
  const void *v51;
  NSObject *v52;
  NSObject *v53;
  uint8_t buf[4];
  const __CFString *v55;
  __int16 v56;
  char *v57;
  __int16 v58;
  NSString *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  __CFString *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      if (self->super._state < 5)
      {
        tokenToCandidatePairs = self->super._tokenToCandidatePairs;
        if (tokenToCandidatePairs
          && (v14 = (id)CFDictionaryGetValue((CFDictionaryRef)tokenToCandidatePairs, v6)) != 0)
        {
          v15 = v14;
          v16 = [IDSQRProtoMessage alloc];
          v21 = (char *)objc_msgSend_initWithType_candidatePair_options_(v16, v17, 32, v18, v15, v8);
          if (v21)
          {
            objc_msgSend_GFTGL(IDSFoundationLog, v19, v20, v22);
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              idsSessionID = self->super._idsSessionID;
              objc_msgSend_sessionID(v15, v24, v25, v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v55 = CFSTR("registerAck_request");
              v56 = 2112;
              v57 = v21;
              v58 = 2112;
              v59 = idsSessionID;
              v60 = 2112;
              v61 = v28;
              v62 = 2112;
              v63 = v6;
              _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "Send %@ %@ for IDSSessionID: %@ QRSessionID: %@ candidatePairToken: %@", buf, 0x34u);

            }
            objc_msgSend__sendProtoMessage_candidatePair_(self, v29, (uint64_t)v21, v30, v15);
            v34 = objc_msgSend_transactionID(v21, v31, v32, v33);
            objc_msgSend_addProtoRequest_(v15, v35, v34, v36);
            if (!self->_reliableUnicastServerMaterialToProtoMessageTransactionID)
            {
              Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
              reliableUnicastServerMaterialToProtoMessageTransactionID = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
              self->_reliableUnicastServerMaterialToProtoMessageTransactionID = Mutable;

            }
            v44 = (void *)objc_msgSend_copy(v8, v37, v38, v39);
            if (v44)
            {
              v46 = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
              v47 = (void *)MEMORY[0x1E0CB37E8];
              v48 = objc_msgSend_transactionID(v21, v42, v43, v45);
              v51 = (const void *)objc_msgSend_numberWithUnsignedLongLong_(v47, v49, v48, v50);
              CFDictionarySetValue((CFMutableDictionaryRef)v46, v51, v44);
            }

          }
          else
          {
            OSLogHandleForTransportCategory();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v55 = CFSTR("registerAck_request");
              _os_log_impl(&dword_19B949000, v53, OS_LOG_TYPE_DEFAULT, "failed to create proto message (%@).", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create proto message (%@)."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create proto message (%@)."));
              }
            }
          }

        }
        else
        {
          OSLogHandleForTransportCategory();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B949000, v52, OS_LOG_TYPE_DEFAULT, "Will not send register ack request due to invalid candidatePair!", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register ack request due to invalid candidatePair!"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register ack request due to invalid candidatePair!"));
            }
          }
        }
      }
      else
      {
        OSLogHandleForTransportCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = _IDSLinkStateStrings[self->super._state];
          *(_DWORD *)buf = 138412546;
          v55 = v6;
          v56 = 2080;
          v57 = v10;
          _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "Will not send register ack request for %@, GL state [%s]!", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register ack request for %@, GL state [%s]!"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register ack request for %@, GL state [%s]!"));
          }
        }
      }
    }
    else
    {
      OSLogHandleForTransportCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "Will not send register ack request due to invalid options!", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register ack request due to invalid options!"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register ack request due to invalid options!"));
        }
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "Will not send register ack request due to invalid candidatePairToken!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register ack request due to invalid candidatePairToken!"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register ack request due to invalid candidatePairToken!"));
      }
    }
  }

}

- (BOOL)_processRegisterAckResponse:(id)a3 candidatePairToken:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  double v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  double v25;
  NSMutableDictionary *reliableUnicastServerMaterialToProtoMessageTransactionID;
  void *v27;
  uint64_t v28;
  const char *v29;
  double v30;
  void *v31;
  void *Value;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  BOOL v39;
  const char *v40;
  double v41;
  const char *v42;
  void *v43;
  double v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  unsigned __int16 v49;
  const char *v50;
  uint64_t v51;
  double v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  double v56;
  unsigned __int16 v57;
  const char *v58;
  uint64_t v59;
  double v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  double v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  const char *v70;
  double v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  double v75;
  const char *v76;
  uint64_t v77;
  double v78;
  const char *v79;
  uint64_t v80;
  double v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  double v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  double v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  double v97;
  const char *v98;
  double v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  double v103;
  void *v104;
  id WeakRetained;
  char v106;
  id v107;
  const char *v108;
  double v109;
  NSObject *v110;
  NSObject *v111;
  NSObject *v112;
  NSObject *v113;
  char isCellularStunCandidate;
  uint64_t v116;
  IDSNWLink *nwLink;
  void *v118;
  void *v119;
  uint8_t buf[4];
  uint64_t v121;
  __int16 v122;
  id v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_GFTGL(IDSFoundationLog, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v121 = objc_msgSend_transactionID(v6, v12, v13, v14);
    v122 = 2112;
    v123 = v7;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "received registerAck-response(%llu) for %@.", buf, 0x16u);
  }

  if (v7)
  {
    if (self->_reliableUnicastServerMaterialToProtoMessageTransactionID)
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      v19 = objc_msgSend_transactionID(v6, v15, v16, v17);
      objc_msgSend_numberWithUnsignedLongLong_(v18, v20, v19, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        reliableUnicastServerMaterialToProtoMessageTransactionID = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
        v27 = (void *)MEMORY[0x1E0CB37E8];
        v28 = objc_msgSend_transactionID(v6, v22, v23, v25);
        objc_msgSend_numberWithUnsignedLongLong_(v27, v29, v28, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)reliableUnicastServerMaterialToProtoMessageTransactionID, v31);
        v36 = (void *)objc_msgSend_mutableCopy(Value, v33, v34, v35);

      }
      else
      {
        v36 = (void *)objc_msgSend_mutableCopy(0, v22, v23, v25);
      }

      if (!v36)
      {
        OSLogHandleForTransportCategory();
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v110, OS_LOG_TYPE_DEFAULT, "processRegisterAckResponse failed due to invalid options!", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processRegisterAckResponse failed due to invalid options!"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processRegisterAckResponse failed due to invalid options!"));
          }
        }
        v39 = 0;
        goto LABEL_61;
      }
      objc_msgSend_objectForKeyedSubscript_(v36, v40, (uint64_t)CFSTR("gl-option-reliable-unicast-local-connection-id"), v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        objc_msgSend_objectForKeyedSubscript_(v36, v42, (uint64_t)CFSTR("gl-option-reliable-unicast-local-relay-id"), v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend_unsignedIntValue(v45, v46, v47, v48);

        if (v49)
        {
          objc_msgSend_objectForKeyedSubscript_(v36, v50, (uint64_t)CFSTR("gl-option-reliable-unicast-remote-relay-id"), v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend_unsignedIntValue(v53, v54, v55, v56);

          if (v57)
          {
            objc_msgSend__virtualCandidatePairFromLocalLinkID_remoteRelayLinkID_(self, v58, v49, v60, v57);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v119 = v61;
            v39 = v61 != 0;
            if (v61)
            {
              objc_msgSend_remote(v61, v62, v63, v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = objc_msgSend_radioAccessTechnology(v65, v66, v67, v68);

              objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v70, v69, v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              if (v72)
                CFDictionarySetValue((CFMutableDictionaryRef)v36, CFSTR("gl-option-reliable-unicast-remote-type"), v72);

              nwLink = self->super._nwLink;
              objc_msgSend_local(v119, v73, v74, v75);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              v116 = objc_msgSend_address(v118, v76, v77, v78);
              objc_msgSend_remote(v119, v79, v80, v81);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = objc_msgSend_external(v82, v83, v84, v85);
              objc_msgSend_sessionID(v119, v87, v88, v89);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_local(v119, v91, v92, v93);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              isCellularStunCandidate = objc_msgSend_isCellularStunCandidate(v94, v95, v96, v97);
              objc_msgSend_connectionInfoForLocalAddress_remoteAddress_clientUniquePID_sessionID_type_isRelay_isCellular_(nwLink, v98, v116, v99, v86, 0, v90, 5, 1, isCellularStunCandidate);
              v100 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_connection(v100, v101, v102, v103);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              if (v104)
                CFDictionarySetValue((CFMutableDictionaryRef)v36, CFSTR("gl-option-reliable-unicast-parent-connection"), v104);

              WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
              v106 = objc_opt_respondsToSelector();

              if ((v106 & 1) != 0)
              {
                v107 = objc_loadWeakRetained((id *)&self->super._delegate);
                objc_msgSend_link_didReceiveReliableUnicastServerMaterial_(v107, v108, (uint64_t)self, v109, v36);

              }
            }
            else
            {
              OSLogHandleForTransportCategory();
              v113 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19B949000, v113, OS_LOG_TYPE_DEFAULT, "processRegisterAckResponse failed due to invalid candidatePair!", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processRegisterAckResponse failed due to invalid candidatePair!"));
                  if (_IDSShouldLog())
                    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processRegisterAckResponse failed due to invalid candidatePair!"));
                }
              }
            }

            goto LABEL_60;
          }
          objc_msgSend_GFTGL(IDSFoundationLog, v58, v59, v60);
          v112 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
            sub_19BAF63F8();
        }
        else
        {
          objc_msgSend_GFTGL(IDSFoundationLog, v50, v51, v52);
          v112 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
            sub_19BAF63CC();
        }

      }
      else
      {
        OSLogHandleForTransportCategory();
        v111 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v111, OS_LOG_TYPE_DEFAULT, "processRegisterAckResponse failed due to invalid localConnectionID!", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processRegisterAckResponse failed due to invalid localConnectionID!"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processRegisterAckResponse failed due to invalid localConnectionID!"));
          }
        }
      }
      v39 = 0;
LABEL_60:

LABEL_61:
      goto LABEL_62;
    }
    OSLogHandleForTransportCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v38, OS_LOG_TYPE_DEFAULT, "processRegisterAckResponse failed due to invalid _reliableUnicastServerMaterialToProtoMessageTransactionID!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processRegisterAckResponse failed due to invalid _reliableUnicastServerMaterialToProtoMessageTransactionID!"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processRegisterAckResponse failed due to invalid _reliableUnicastServerMaterialToProtoMessageTransactionID!"));
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v37, OS_LOG_TYPE_DEFAULT, "processRegisterAckResponse failed due to invalid candidatePairToken!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("processRegisterAckResponse failed due to invalid candidatePairToken!"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("processRegisterAckResponse failed due to invalid candidatePairToken!"));
      }
    }
  }
  v39 = 0;
LABEL_62:

  return v39;
}

- (BOOL)_processRegisterResponse:(id)a3 candidatePairToken:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  double v25;
  id v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  double v34;
  NSMutableDictionary *reliableUnicastServerMaterialToProtoMessageTransactionID;
  void *v36;
  uint64_t v37;
  const char *v38;
  double v39;
  void *v40;
  void *Value;
  const char *v42;
  uint64_t v43;
  double v44;
  __CFDictionary *v45;
  BOOL v46;
  const char *v47;
  uint64_t v48;
  double v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  const char *v54;
  uint64_t v55;
  double v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  double v60;
  const char *v61;
  uint64_t v62;
  double v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  double v67;
  NSMutableDictionary *v68;
  void *v69;
  uint64_t v70;
  const char *v71;
  double v72;
  const void *v73;
  const char *v74;
  double v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  double v79;
  unsigned __int16 v80;
  const char *v81;
  uint64_t v82;
  double v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  double v87;
  unsigned __int16 v88;
  const char *v89;
  uint64_t v90;
  double v91;
  NSObject *v92;
  const char *v93;
  uint64_t v94;
  double v95;
  NSObject *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  double v100;
  uint64_t v101;
  const char *v102;
  double v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  double v107;
  const char *v108;
  uint64_t v109;
  double v110;
  const char *v111;
  uint64_t v112;
  double v113;
  const char *v114;
  uint64_t v115;
  double v116;
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
  const char *v127;
  double v128;
  NSObject *v129;
  const char *v130;
  uint64_t v131;
  double v132;
  void *v133;
  id WeakRetained;
  char v135;
  id v136;
  const char *v137;
  uint64_t v138;
  double v139;
  void *v140;
  const char *v141;
  double v142;
  char isCellularStunCandidate;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  IDSNWLink *nwLink;
  id *location;
  os_log_t loga;
  NSObject *log;
  id v152;
  NSObject *v153;
  uint8_t buf[4];
  uint64_t v155;
  __int16 v156;
  id v157;
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_registerResponse(v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GFTGL(IDSFoundationLog, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v155 = objc_msgSend_transactionID(v6, v16, v17, v18);
    v156 = 2112;
    v157 = v7;
    _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "received register-response(%llu) for %@.", buf, 0x16u);
  }

  if (v11)
  {
    objc_msgSend_channelInfo(v11, v19, v20, v21);
    v24 = objc_claimAutoreleasedReturnValue();
    if (self->_reliableUnicastServerMaterialToProtoMessageTransactionID)
    {
      v26 = v7;
      v27 = (void *)MEMORY[0x1E0CB37E8];
      v28 = objc_msgSend_transactionID(v6, v22, v23, v25);
      objc_msgSend_numberWithUnsignedLongLong_(v27, v29, v28, v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        reliableUnicastServerMaterialToProtoMessageTransactionID = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
        v36 = (void *)MEMORY[0x1E0CB37E8];
        v37 = objc_msgSend_transactionID(v6, v31, v32, v34);
        objc_msgSend_numberWithUnsignedLongLong_(v36, v38, v37, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)reliableUnicastServerMaterialToProtoMessageTransactionID, v40);
        v45 = (__CFDictionary *)objc_msgSend_mutableCopy(Value, v42, v43, v44);

      }
      else
      {
        v45 = (__CFDictionary *)objc_msgSend_mutableCopy(0, v31, v32, v34);
      }

      v7 = v26;
      if (v45)
      {
LABEL_16:
        objc_msgSend_quicClientConnectionId(v24, v47, v48, v49);
        v50 = objc_claimAutoreleasedReturnValue();
        if (!v50)
        {
          objc_msgSend_GFTGL(IDSFoundationLog, v51, v52, v53);
          v153 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
            sub_19BAF6424();
          v46 = 0;
          goto LABEL_45;
        }
        CFDictionarySetValue(v45, CFSTR("gl-option-reliable-unicast-local-connection-id"), v50);
        objc_msgSend_quicServerConnectionId(v24, v54, v55, v56);
        v57 = objc_claimAutoreleasedReturnValue();
        v153 = v57;
        if (!v57)
        {
          objc_msgSend_GFTGL(IDSFoundationLog, v58, v59, v60);
          v96 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
            sub_19BAF6450();
          v46 = 0;
          goto LABEL_44;
        }
        v152 = v7;
        CFDictionarySetValue(v45, CFSTR("gl-option-reliable-unicast-remote-connection-id"), v57);
        v66 = (void *)objc_msgSend_copy(v45, v61, v62, v63);
        if (v66)
        {
          v68 = self->_reliableUnicastServerMaterialToProtoMessageTransactionID;
          v69 = (void *)MEMORY[0x1E0CB37E8];
          v70 = objc_msgSend_transactionID(v6, v64, v65, v67);
          v73 = (const void *)objc_msgSend_numberWithUnsignedLongLong_(v69, v71, v70, v72);
          CFDictionarySetValue((CFMutableDictionaryRef)v68, v73, v66);
        }

        objc_msgSend_objectForKeyedSubscript_(v45, v74, (uint64_t)CFSTR("gl-option-reliable-unicast-local-relay-id"), v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend_unsignedIntValue(v76, v77, v78, v79);

        if (v80)
        {
          objc_msgSend_objectForKeyedSubscript_(v45, v81, (uint64_t)CFSTR("gl-option-reliable-unicast-remote-relay-id"), v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend_unsignedIntValue(v84, v85, v86, v87);

          if (v88)
          {
            objc_msgSend__virtualCandidatePairFromLocalLinkID_remoteRelayLinkID_(self, v89, v80, v91, v88);
            v92 = objc_claimAutoreleasedReturnValue();
            v96 = v92;
            v46 = v92 != 0;
            if (v92)
            {
              objc_msgSend_remote(v92, v93, v94, v95);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = objc_msgSend_radioAccessTechnology(v97, v98, v99, v100);

              objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v102, v101, v103);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              if (v104)
                CFDictionarySetValue(v45, CFSTR("gl-option-reliable-unicast-remote-type"), v104);

              nwLink = self->super._nwLink;
              objc_msgSend_local(v96, v105, v106, v107);
              loga = (os_log_t)objc_claimAutoreleasedReturnValue();
              v147 = objc_msgSend_address(loga, v108, v109, v110);
              objc_msgSend_remote(v96, v111, v112, v113);
              location = (id *)objc_claimAutoreleasedReturnValue();
              v146 = objc_msgSend_external(location, v114, v115, v116);
              objc_msgSend_sessionID(v96, v117, v118, v119);
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_local(v96, v120, v121, v122);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              isCellularStunCandidate = objc_msgSend_isCellularStunCandidate(v123, v124, v125, v126);
              objc_msgSend_connectionInfoForLocalAddress_remoteAddress_clientUniquePID_sessionID_type_isRelay_isCellular_(nwLink, v127, v147, v128, v146, 0, v145, 5, 1, isCellularStunCandidate);
              v129 = objc_claimAutoreleasedReturnValue();

              log = v129;
              objc_msgSend_connection(v129, v130, v131, v132);
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              if (v133)
                CFDictionarySetValue(v45, CFSTR("gl-option-reliable-unicast-parent-connection"), v133);

              WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
              v135 = objc_opt_respondsToSelector();

              if ((v135 & 1) != 0)
              {
                v136 = objc_loadWeakRetained((id *)&self->super._delegate);
                v140 = (void *)objc_msgSend_copy(v45, v137, v138, v139);
                objc_msgSend_link_didReceiveReliableUnicastServerMaterial_(v136, v141, (uint64_t)self, v142, v140);

              }
              v7 = v152;
            }
            else
            {
              objc_msgSend_GFTGL(IDSFoundationLog, v93, v94, v95);
              log = objc_claimAutoreleasedReturnValue();
              v7 = v152;
              if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19B949000, log, OS_LOG_TYPE_DEFAULT, "processRegisterResponse failed due to invalid candidatePair!", buf, 2u);
              }
            }

            goto LABEL_44;
          }
          objc_msgSend_GFTGL(IDSFoundationLog, v89, v90, v91);
          v96 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
            sub_19BAF63F8();
        }
        else
        {
          objc_msgSend_GFTGL(IDSFoundationLog, v81, v82, v83);
          v96 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
            sub_19BAF63CC();
        }
        v46 = 0;
        v7 = v152;
LABEL_44:

LABEL_45:
LABEL_46:

        goto LABEL_47;
      }
    }
    else
    {
      v45 = (__CFDictionary *)objc_msgSend_mutableCopy(0, v22, v23, v25);
      if (v45)
        goto LABEL_16;
    }
    objc_msgSend_GFTGL(IDSFoundationLog, v47, v48, v49);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v50, OS_LOG_TYPE_DEFAULT, "processRegisterResponse failed due to invalid _reliableUnicastServerMaterialToProtoMessageTransactionID!", buf, 2u);
    }
    v46 = 0;
    goto LABEL_46;
  }
  objc_msgSend_GFTGL(IDSFoundationLog, v19, v20, v21);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, "processRegisterResponse failed due to invalid registerResponse!", buf, 2u);
  }
  v46 = 0;
LABEL_47:

  return v46;
}

- (BOOL)_processReliableUnicastRegistrationErrorResponse:(id)a3 packetBuffer:(id *)a4 startTime:(double)a5 candidatePair:(id)a6
{
  id v10;
  id v11;
  unint64_t var30;
  const char *v13;
  double v14;
  void *v15;
  int var33_low;
  uint64_t var32_low;
  const char *v18;
  double v19;
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
  NSObject *v31;
  void *v33;
  void *v34;
  uint8_t buf[4];
  _BYTE v36[10];
  _BYTE v37[10];
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  var30 = a4->var30;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v13, (uint64_t)CFSTR("%llu"), v14, var30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  var33_low = LOWORD(a4->var33);
  var32_low = LOWORD(a4->var32);
  if (objc_msgSend_removeProtoRequest_(v11, v18, var30, v19))
  {
    if (self->super._state == 2)
    {
      OSLogHandleForTransportCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_candidatePairToken(v11, v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v36 = v24;
        *(_WORD *)&v36[8] = 1024;
        *(_DWORD *)v37 = var32_low;
        _os_log_impl(&dword_19B949000, v20, OS_LOG_TYPE_DEFAULT, "%@ is already in error state, ignore error response %04x.", buf, 0x12u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_candidatePairToken(v11, v25, v26, v27);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("%@ is already in error state, ignore error response %04x."));

          if (_IDSShouldLog())
          {
            objc_msgSend_candidatePairToken(v11, v28, v29, v30, v33, var32_low);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("%@ is already in error state, ignore error response %04x."));

          }
        }
      }
    }
    else
    {
      OSLogHandleForTransportCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v36 = var32_low;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)&v36[6] = var33_low;
        *(_WORD *)v37 = 2112;
        *(_QWORD *)&v37[2] = v15;
        v38 = 2048;
        v39 = (ids_monotonic_time() - a5) * 1000.0;
        _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_DEFAULT, "receive error response - type(%04x) error_code(%u) txn_id(%@) after %0.3lf ms.", buf, 0x22u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          ids_monotonic_time();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive error response - type(%04x) error_code(%u) txn_id(%@) after %0.3lf ms."));
          if (_IDSShouldLog())
          {
            ids_monotonic_time();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive error response - type(%04x) error_code(%u) txn_id(%@) after %0.3lf ms."));
          }
        }
      }
    }
  }

  return 1;
}

- (id)_findVirtualCandidatePair:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  id v10;
  double v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  char isEqualToString;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_virtualCandidatePairs;
  v10 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v20, v7, v24, 16);
  if (v10)
  {
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend_candidatePairToken(v14, v8, v9, v11, (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v15, v16, (uint64_t)v4, v17);

        if ((isEqualToString & 1) != 0)
        {
          v10 = v14;
          goto LABEL_11;
        }
      }
      v10 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v20, v11, v24, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)_virtualCandidatePairFromLocalLinkID:(unsigned __int16)a3 remoteRelayLinkID:(unsigned __int16)a4
{
  double v4;
  void *v6;
  const char *v7;
  double v8;
  void *v9;

  localRemoteRelayLinkIDForVirtualStunCandidatePair(a3, (const char *)a4, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->super._localRemoteRelayLinkIDToVirtualCandidatePairs, v7, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_processReceivedRemoteCandidatePairs:(id)a3
{
  const char *v4;
  double v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __CFArray *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  int v32;
  const char *v33;
  uint64_t v34;
  double v35;
  __CFArray *v36;
  const char *v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  __CFArray *v44;
  NSObject *v45;
  id v46;
  const char *v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  void *v60;
  const char *v61;
  double v62;
  const char *v63;
  uint64_t v64;
  double v65;
  int v66;
  const char *v67;
  uint64_t v68;
  double v69;
  __CFArray *v70;
  const char *v71;
  uint64_t v72;
  double v73;
  const char *v74;
  uint64_t v75;
  double v76;
  NSObject *v77;
  const char *v78;
  double v79;
  __CFArray *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  NSMutableArray *v84;
  const char *v85;
  double v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  uint64_t n;
  void *v93;
  int v94;
  const char *v95;
  uint64_t v96;
  double v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  double v101;
  void *v102;
  const char *v103;
  double v104;
  int isEqualToString;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  double v109;
  __CFArray *v110;
  const char *v111;
  double v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  double v117;
  unsigned int v118;
  const char *v119;
  uint64_t v120;
  double v121;
  const char *v122;
  double v123;
  void *v124;
  __CFDictionary *localRemoteRelayLinkIDToVirtualCandidatePairs;
  const char *v126;
  double v127;
  const char *v128;
  double v129;
  const char *v130;
  uint64_t v131;
  double v132;
  NSObject *v133;
  const char *v134;
  uint64_t v135;
  double v136;
  const char *v137;
  double v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t ii;
  uint64_t v142;
  id v143;
  const char *v144;
  double v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  double v149;
  uint64_t v150;
  uint64_t jj;
  void *v152;
  const char *v153;
  double v154;
  NSObject *v155;
  const char *v156;
  uint64_t v157;
  double v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  double v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  double v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  double v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  double v174;
  NSObject *v175;
  NSMutableArray *virtualCandidatePairs;
  const char *v177;
  uint64_t v178;
  double v179;
  NSObject *v180;
  NSMutableDictionary *v181;
  void *v182;
  __CFArray *v183;
  id v185;
  uint64_t v186;
  NSArray *obj;
  uint64_t obja;
  __CFArray *objb;
  id *location;
  id v191;
  id v192;
  id v193;
  __CFArray *v194;
  CFMutableArrayRef theArray;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  IDSGFTGL *v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  uint8_t buf[4];
  __CFArray *v233;
  __int16 v234;
  uint64_t v235;
  __int16 v236;
  uint64_t v237;
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  uint64_t v246;

  v246 = *MEMORY[0x1E0C80C00];
  v193 = a3;
  v228 = 0u;
  v229 = 0u;
  v230 = 0u;
  v231 = 0u;
  v199 = self;
  location = (id *)&self->_remoteCandidatePairs;
  obj = self->_remoteCandidatePairs;
  v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v228, v5, v245, 16);
  if (v196)
  {
    theArray = 0;
    v191 = *(id *)v229;
    v8 = 138412290;
    do
    {
      for (i = 0; i != v196; ++i)
      {
        if (*(id *)v229 != v191)
          objc_enumerationMutation(obj);
        v10 = *(__CFArray **)(*((_QWORD *)&v228 + 1) + 8 * i);
        objc_msgSend_GFTGL(IDSFoundationLog, v6, v7, *(double *)&v8);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v233 = v10;
          _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "_processReceivedRemoteCandidatePairs: found existing: %@", buf, 0xCu);
        }

        v226 = 0u;
        v227 = 0u;
        v224 = 0u;
        v225 = 0u;
        v12 = v193;
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v224, v14, v244, 16);
        if (v17)
        {
          v19 = *(_QWORD *)v225;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v225 != v19)
                objc_enumerationMutation(v12);
              v21 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * j);
              objc_msgSend_sessionID(v21, v15, v16, v18);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_sessionID(v10, v23, v24, v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_isEqualToString_(v22, v27, (uint64_t)v26, v28))
              {
                v32 = objc_msgSend_relayLinkID(v10, v29, v30, v31);
                LOBYTE(v32) = v32 == objc_msgSend_relayLinkID(v21, v33, v34, v35);

                if ((v32 & 1) != 0)
                {

                  goto LABEL_24;
                }
              }
              else
              {

              }
            }
            v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v224, v18, v244, 16);
          }
          while (v17);
        }

        v36 = theArray;
        if (!theArray)
          v36 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        theArray = v36;
        if (v36 && v10)
          CFArrayAppendValue(v36, v10);
LABEL_24:
        ;
      }
      v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v228, *(double *)&v8, v245, 16);
    }
    while (v196);
  }
  else
  {
    theArray = 0;
  }

  v222 = 0u;
  v223 = 0u;
  v220 = 0u;
  v221 = 0u;
  v192 = v193;
  v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v192, v37, (uint64_t)&v220, v38, v243, 16);
  if (v41)
  {
    v194 = 0;
    v197 = *(_QWORD *)v221;
    v42 = 138412290;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v221 != v197)
          objc_enumerationMutation(v192);
        v44 = *(__CFArray **)(*((_QWORD *)&v220 + 1) + 8 * k);
        objc_msgSend_GFTGL(IDSFoundationLog, v39, v40, *(double *)&v42);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v233 = v44;
          _os_log_impl(&dword_19B949000, v45, OS_LOG_TYPE_DEFAULT, "_processReceivedRemoteCandidatePairs: received: %@", buf, 0xCu);
        }

        v218 = 0u;
        v219 = 0u;
        v216 = 0u;
        v217 = 0u;
        v46 = *location;
        v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v216, v48, v242, 16);
        if (v51)
        {
          v53 = *(_QWORD *)v217;
          do
          {
            for (m = 0; m != v51; ++m)
            {
              if (*(_QWORD *)v217 != v53)
                objc_enumerationMutation(v46);
              v55 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * m);
              objc_msgSend_sessionID(v44, v49, v50, v52);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_sessionID(v55, v57, v58, v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_isEqualToString_(v56, v61, (uint64_t)v60, v62))
              {
                v66 = objc_msgSend_relayLinkID(v55, v63, v64, v65);
                LOBYTE(v66) = v66 == objc_msgSend_relayLinkID(v44, v67, v68, v69);

                if ((v66 & 1) != 0)
                {

                  goto LABEL_51;
                }
              }
              else
              {

              }
            }
            v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v216, v52, v242, 16);
          }
          while (v51);
        }

        v70 = v194;
        if (!v194)
          v70 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v194 = v70;
        if (v70 && v44)
          CFArrayAppendValue(v70, v44);
LABEL_51:
        ;
      }
      v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v192, v39, (uint64_t)&v220, *(double *)&v42, v243, 16);
    }
    while (v41);
  }
  else
  {
    v194 = 0;
  }

  objc_storeStrong(location, a3);
  if (!objc_msgSend_count(theArray, v71, v72, v73))
  {
    v80 = 0;
    goto LABEL_94;
  }
  objc_msgSend_GFTGL(IDSFoundationLog, v74, v75, v76);
  v77 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v233 = theArray;
    _os_log_impl(&dword_19B949000, v77, OS_LOG_TYPE_DEFAULT, "[U+1] _processReceivedRemoteCandidatePairs: removed remote candidate pairs: %@", buf, 0xCu);
  }

  v214 = 0u;
  v215 = 0u;
  v212 = 0u;
  v213 = 0u;
  v183 = theArray;
  v186 = objc_msgSend_countByEnumeratingWithState_objects_count_(v183, v78, (uint64_t)&v212, v79, v241, 16);
  if (!v186)
  {
    v80 = 0;
    goto LABEL_93;
  }
  v80 = 0;
  v185 = *(id *)v213;
  do
  {
    v81 = 0;
    do
    {
      if (*(id *)v213 != v185)
      {
        v82 = v81;
        objc_enumerationMutation(v183);
        v81 = v82;
      }
      obja = v81;
      v83 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * v81);
      v208 = 0u;
      v209 = 0u;
      v210 = 0u;
      v211 = 0u;
      v84 = v199->_virtualCandidatePairs;
      v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v208, v86, v240, 16);
      if (v89)
      {
        v91 = *(_QWORD *)v209;
        do
        {
          for (n = 0; n != v89; ++n)
          {
            if (*(_QWORD *)v209 != v91)
              objc_enumerationMutation(v84);
            v93 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * n);
            v94 = objc_msgSend_remoteRelayLinkID(v93, v87, v88, v90);
            if (v94 == objc_msgSend_relayLinkID(v83, v95, v96, v97))
            {
              objc_msgSend_sessionID(v93, v87, v88, v90);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_sessionID(v83, v99, v100, v101);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToString = objc_msgSend_isEqualToString_(v98, v103, (uint64_t)v102, v104);

              if (isEqualToString)
              {
                if (v80)
                {
                  if (!v93)
                    goto LABEL_76;
                }
                else
                {
                  v80 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  if (!v93)
                  {
LABEL_76:
                    OSLogHandleForTransportCategory();
                    v106 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend_candidatePairToken(v93, v107, v108, v109);
                      v110 = (__CFArray *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v233 = v110;
                      _os_log_impl(&dword_19B949000, v106, OS_LOG_TYPE_DEFAULT, "[U+1] _processReceivedRemoteCandidatePairs: remove virtual candidate pair %@.", buf, 0xCu);

                    }
                    if (os_log_shim_legacy_logging_enabled())
                    {
                      if (_IDSShouldLogTransport())
                      {
                        objc_msgSend_candidatePairToken(v93, v111, v113, v112);
                        v182 = (void *)objc_claimAutoreleasedReturnValue();
                        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("[U+1] _processReceivedRemoteCandidatePairs: remove virtual candidate pair %@."));

                        if (_IDSShouldLog())
                        {
                          objc_msgSend_candidatePairToken(v93, v111, v114, v112, v182);
                          v182 = (void *)objc_claimAutoreleasedReturnValue();
                          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("[U+1] _processReceivedRemoteCandidatePairs: remove virtual candidate pair %@."));

                        }
                      }
                    }
                    objc_msgSend__notifyCandidatePairDisconnected_withReason_(v199, v111, (uint64_t)v93, v112, 2, v182);
                    v118 = objc_msgSend_relayLinkID(v93, v115, v116, v117);
                    v122 = (const char *)objc_msgSend_remoteRelayLinkID(v93, v119, v120, v121);
                    localRemoteRelayLinkIDForVirtualStunCandidatePair(v118, v122, v123);
                    v124 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v124)
                    {
                      localRemoteRelayLinkIDToVirtualCandidatePairs = (__CFDictionary *)v199->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
                      if (localRemoteRelayLinkIDToVirtualCandidatePairs)
                        CFDictionaryRemoveValue(localRemoteRelayLinkIDToVirtualCandidatePairs, v124);
                    }

                    continue;
                  }
                }
                if (v80)
                  CFArrayAppendValue(v80, v93);
                goto LABEL_76;
              }
            }
          }
          v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v87, (uint64_t)&v208, v90, v240, 16);
        }
        while (v89);
      }

      v81 = obja + 1;
    }
    while (obja + 1 != v186);
    v186 = objc_msgSend_countByEnumeratingWithState_objects_count_(v183, v126, (uint64_t)&v212, v127, v241, 16);
  }
  while (v186);
LABEL_93:

  objc_msgSend_removeObjectsInArray_(v199->_virtualCandidatePairs, v128, (uint64_t)v80, v129);
LABEL_94:
  if (objc_msgSend_count(v194, v74, v75, v76))
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v130, v131, v132);
    v133 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v233 = v194;
      _os_log_impl(&dword_19B949000, v133, OS_LOG_TYPE_DEFAULT, "[U+1] _processReceivedRemoteCandidatePairs: new remote candidate pairs: %@", buf, 0xCu);
    }

    objc_msgSend_allValues(v199->super._tokenToCandidatePairs, v134, v135, v136);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = 0u;
    v207 = 0u;
    v204 = 0u;
    v205 = 0u;
    objb = v194;
    v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(objb, v137, (uint64_t)&v204, v138, v239, 16);
    if (v139)
    {
      v140 = *(_QWORD *)v205;
      do
      {
        for (ii = 0; ii != v139; ++ii)
        {
          if (*(_QWORD *)v205 != v140)
            objc_enumerationMutation(objb);
          v142 = *(_QWORD *)(*((_QWORD *)&v204 + 1) + 8 * ii);
          v200 = 0u;
          v201 = 0u;
          v202 = 0u;
          v203 = 0u;
          v143 = v198;
          v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v144, (uint64_t)&v200, v145, v238, 16);
          if (v148)
          {
            v150 = *(_QWORD *)v201;
            do
            {
              for (jj = 0; jj != v148; ++jj)
              {
                if (*(_QWORD *)v201 != v150)
                  objc_enumerationMutation(v143);
                v152 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * jj);
                if (objc_msgSend_isSharedQRSession(v152, v146, v147, v149)
                  && objc_msgSend_state(v152, v146, v147, v149) == 4)
                {
                  objc_msgSend__setupVirtualCandidatePairs_remoteCandidatePair_(v199, v146, (uint64_t)v152, v149, v142);
                }
              }
              v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v146, (uint64_t)&v200, v149, v238, 16);
            }
            while (v148);
          }

        }
        v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(objb, v153, (uint64_t)&v204, v154, v239, 16);
      }
      while (v139);
    }

  }
  objc_msgSend_GFTGL(IDSFoundationLog, v130, v131, v132);
  v155 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_allValues(v199->super._tokenToCandidatePairs, v156, v157, v158);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = objc_msgSend_count(v159, v160, v161, v162);
    v167 = objc_msgSend_count(*location, v164, v165, v166);
    v171 = objc_msgSend_count(v199->_virtualCandidatePairs, v168, v169, v170);
    *(_DWORD *)buf = 134218496;
    v233 = (__CFArray *)v163;
    v234 = 2048;
    v235 = v167;
    v236 = 2048;
    v237 = v171;
    _os_log_impl(&dword_19B949000, v155, OS_LOG_TYPE_DEFAULT, "[U+1] _processReceivedRemoteCandidatePairs: local candidate pairs: %ld, remote candidate pairs: %ld, all virtual candidate pairs: %ld", buf, 0x20u);

  }
  objc_msgSend_GFTGL(IDSFoundationLog, v172, v173, v174);
  v175 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
  {
    virtualCandidatePairs = v199->_virtualCandidatePairs;
    *(_DWORD *)buf = 138412290;
    v233 = (__CFArray *)virtualCandidatePairs;
    _os_log_impl(&dword_19B949000, v175, OS_LOG_TYPE_DEFAULT, "[U+1] _processReceivedRemoteCandidatePairs: virtual candidate pairs: %@", buf, 0xCu);
  }

  objc_msgSend_GFTGL(IDSFoundationLog, v177, v178, v179);
  v180 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
  {
    v181 = v199->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
    *(_DWORD *)buf = 138412290;
    v233 = (__CFArray *)v181;
    _os_log_impl(&dword_19B949000, v180, OS_LOG_TYPE_DEFAULT, "[U+1] _processReceivedRemoteCandidatePairs: localRemoteRelayLinkID map: %@", buf, 0xCu);
  }

}

- (void)_processCommandRelayInterfaceInfo:(id)a3 candidatePairToken:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  NSMutableDictionary *tokenToCandidatePairs;
  NSObject *v16;
  NSObject *v17;
  int remoteCapabilityFlag_low;
  unsigned int v19;
  double v20;
  NSObject *v21;
  unsigned int acceptDelayU32;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  const char *v28;
  double v29;
  const char *v30;
  uint64_t v31;
  double v32;
  NSObject *v33;
  const char *v34;
  double v35;
  const char *v36;
  uint64_t v37;
  double v38;
  const char *v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  double v46;
  const char *v47;
  double v48;
  const char *v49;
  uint64_t v50;
  double v51;
  const char *v52;
  uint64_t v53;
  double v54;
  void *v55;
  const char *v56;
  double v57;
  char isEqualToString;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  id pendingCommandRelayInterfaceInfoBlock;
  NSObject *v65;
  const char *v66;
  NSObject *v67;
  uint32_t v68;
  unsigned int v69;
  NSObject *v70;
  unsigned int keyMaterialDataCounter;
  const char *v72;
  double v73;
  unsigned int localRelayInterfaceCounter;
  unsigned int v75;
  unsigned int v76;
  void *v77;
  const char *v78;
  double v79;
  _BOOL4 v80;
  NSObject *v81;
  unsigned int remoteRelayInterfaceCounter;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  double v86;
  const char *v87;
  double v88;
  NSObject *v89;
  id v90;
  const char *v91;
  double v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  uint64_t v97;
  uint64_t k;
  void *v99;
  void *v100;
  const char *v101;
  double v102;
  const char *v103;
  uint64_t v104;
  double v105;
  BOOL v106;
  const char *v107;
  uint64_t v108;
  double v109;
  NSObject *v110;
  const char *v111;
  NSObject *v112;
  uint64_t v113;
  const char *v114;
  double v115;
  const char *v116;
  uint64_t v117;
  double v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  double v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  double v126;
  NSObject *v127;
  const char *v128;
  double v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t i;
  void *v133;
  id v134;
  const char *v135;
  double v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  double v140;
  uint64_t v141;
  uint64_t j;
  char v143;
  const char *v144;
  uint64_t v145;
  double v146;
  const char *v147;
  double v148;
  char v149;
  id v150;
  const char *v151;
  uint64_t v152;
  double v153;
  NSObject *v154;
  NSObject *WeakRetained;
  const char *v156;
  double v157;
  const char *v158;
  uint64_t v159;
  double v160;
  const char *v161;
  uint64_t v162;
  id v163;
  double v164;
  void *v165;
  const char *v166;
  double v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  double v171;
  NSObject *v172;
  NSObject *v173;
  const char *v174;
  double v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  double v179;
  uint64_t v180;
  uint64_t m;
  void *v182;
  void *v183;
  const char *v184;
  double v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  double v189;
  const char *v190;
  uint64_t v191;
  double v192;
  NSObject *v193;
  NSObject *v195;
  uint64_t v196;
  double v197;
  uint64_t v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  uint64_t v203;
  id obj;
  NSObject *v205;
  void *v206;
  id key;
  uint8_t v208[16];
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  int v225;
  unsigned int v226;
  unsigned __int16 v227;
  unsigned int v228;
  unsigned __int16 v229;
  _QWORD aBlock[4];
  id v231;
  id v232;
  id v233;
  uint8_t v234[128];
  uint8_t v235[4];
  uint64_t v236;
  __int16 v237;
  void *v238;
  __int16 v239;
  uint64_t v240;
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  uint8_t __b[1024];
  uint8_t buf[1032];
  uint64_t v246;

  v246 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  key = a4;
  v10 = objc_msgSend_command(v6, v7, v8, v9);
  if (self->super._isUPlusOneSession)
  {
    if (self->super._receivedRemoteDeviceVersion)
    {
      if (!key
        || (v14 = v10, (tokenToCandidatePairs = self->super._tokenToCandidatePairs) == 0)
        || (v16 = (id)CFDictionaryGetValue((CFDictionaryRef)tokenToCandidatePairs, key)) == 0)
      {
        objc_msgSend_GFTGL(IDSFoundationLog, v11, v12, v13);
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v61, OS_LOG_TYPE_DEFAULT, "[U+1] failed to find candidate pair.", buf, 2u);
        }
        goto LABEL_158;
      }
      v205 = v16;
      v229 = 0;
      v228 = 0;
      if (GLUtilHasValidUInt16Attr(v6, 12, &v229) && self->super._remoteCapabilityFlag != v229)
      {
        self->super._remoteCapabilityFlag = v229;
        OSLogHandleForTransportCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          remoteCapabilityFlag_low = LOWORD(self->super._remoteCapabilityFlag);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = remoteCapabilityFlag_low;
          _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "update remote capability: %04X.", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v196 = LOWORD(self->super._remoteCapabilityFlag);
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("update remote capability: %04X."));
            if (_IDSShouldLog())
            {
              v196 = LOWORD(self->super._remoteCapabilityFlag);
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("update remote capability: %04X."));
            }
          }
        }
      }
      if (self->super._isInitiator
        && !self->super._acceptDelayU32
        && GLUtilHasValidUInt32Attr(v6, 7, &v228))
      {
        v19 = v228;
        self->super._acceptDelayU32 = v228;
        v20 = (double)(unsigned __int16)v19 * 0.0000152587891 + (double)HIWORD(v19);
        OSLogHandleForTransportCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          acceptDelayU32 = self->super._acceptDelayU32;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = acceptDelayU32;
          *(_WORD *)&buf[8] = 2048;
          *(double *)&buf[10] = v20;
          _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "receive accept delay: %08x/%.6f", buf, 0x12u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v197 = v20;
            v196 = self->super._acceptDelayU32;
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive accept delay: %08x/%.6f"));
            if (_IDSShouldLog())
            {
              v197 = v20;
              v196 = self->super._acceptDelayU32;
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive accept delay: %08x/%.6f"));
            }
          }
        }
      }
      v227 = 0;
      if ((GLUtilHasValidUInt16Attr(v6, 1, &v227) & 1) != 0)
      {
        if (v14 != 32774)
        {
          if (v14 != 6)
          {
LABEL_157:
            v61 = v205;
LABEL_158:

            goto LABEL_159;
          }
          if (!self->super._isUPlusOneSession)
            objc_msgSend_enableUPlusOneSessionForTransition_(self, v23, 1, v25);
          v26 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v23, v227, v25, v196, *(_QWORD *)&v197);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dictionaryWithObject_forKey_(v26, v28, (uint64_t)v27, v29, CFSTR("gl-attr-counter"));
          v203 = objc_claimAutoreleasedReturnValue();

          objc_msgSend_GFTGL(IDSFoundationLog, v30, v31, v32);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v227;
            *(_WORD *)&buf[8] = 2112;
            *(_QWORD *)&buf[10] = key;
            _os_log_impl(&dword_19B949000, v33, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo: send RelayInterfaceInfoAck (counter: %u) using %@", buf, 0x12u);
          }

          objc_msgSend__sendCommandMessage_stunMessage_options_candidatePairToken_(self, v34, 32774, v35, 0, v203, key);
          if (self->super._remoteRelayInterfaceCounter >= v227)
          {
            objc_msgSend_GFTGL(IDSFoundationLog, v36, v37, v38);
            v81 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              remoteRelayInterfaceCounter = self->super._remoteRelayInterfaceCounter;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v227;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = remoteRelayInterfaceCounter;
              _os_log_impl(&dword_19B949000, v81, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo: received old counter: %u, current counter: %u, ignore", buf, 0xEu);
            }

          }
          else
          {
            self->super._remoteRelayInterfaceCounter = v227;
            memset(buf, 170, 0x400uLL);
            v226 = 0;
            if ((GLUtilHasValidBinaryDataAttr(v6, 21, buf, &v226) & 1) != 0)
            {
              memset(__b, 170, sizeof(__b));
              v225 = 0;
              if (!GLUtilHasValidBinaryDataAttr(v6, 22, __b, &v225)
                || !self->super._shouldAcceptIncomingMKMOverQR)
              {
                goto LABEL_122;
              }
              objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v42, (uint64_t)__b, v44, v225);
              v200 = (void *)objc_claimAutoreleasedReturnValue();
              JWDecodeDictionary();
              v201 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend__dataForKey_(v201, v45, (uint64_t)CFSTR("p"), v46);
              v199 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend__stringForKey_(v201, v47, (uint64_t)CFSTR("r"), v48);
              v202 = (void *)objc_claimAutoreleasedReturnValue();
              if (v202)
              {
                if (objc_msgSend_isSharedQRSession(v205, v49, v50, v51))
                {
                  objc_msgSend_groupID(v205, v52, v53, v54);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  isEqualToString = objc_msgSend_isEqualToString_(v55, v56, (uint64_t)v202, v57);

                  if ((isEqualToString & 1) != 0)
                  {
                    v59 = v205;
LABEL_88:
                    v205 = v59;
                    v113 = objc_msgSend_participantID(v59, v52, v53, v54);
                    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v114, v113, v115);
                    v198 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend_URIToParticipantIDs(v205, v116, v117, v118);
                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_allValues(v119, v120, v121, v122);
                    v123 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend_GFTGL(IDSFoundationLog, v124, v125, v126);
                    v127 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v235 = 134218242;
                      v236 = v113;
                      v237 = 2112;
                      v238 = v123;
                      _os_log_impl(&dword_19B949000, v127, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo localParticipantID = %llu participantIDSets = %@", v235, 0x16u);
                    }

                    v219 = 0u;
                    v220 = 0u;
                    v217 = 0u;
                    v218 = 0u;
                    obj = v123;
                    v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v128, (uint64_t)&v217, v129, v242, 16);
                    if (v130)
                    {
                      v206 = 0;
                      v131 = *(_QWORD *)v218;
                      do
                      {
                        for (i = 0; i != v130; ++i)
                        {
                          if (*(_QWORD *)v218 != v131)
                            objc_enumerationMutation(obj);
                          v133 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * i);
                          v213 = 0u;
                          v214 = 0u;
                          v215 = 0u;
                          v216 = 0u;
                          v134 = v133;
                          v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v213, v136, v241, 16);
                          if (v139)
                          {
                            v141 = *(_QWORD *)v214;
                            while (2)
                            {
                              for (j = 0; j != v139; ++j)
                              {
                                if (*(_QWORD *)v214 != v141)
                                  objc_enumerationMutation(v134);
                                if (objc_msgSend_unsignedLongLongValue(*(void **)(*((_QWORD *)&v213 + 1) + 8 * j), v137, v138, v140) == v113)
                                {
                                  v143 = 1;
                                  goto LABEL_105;
                                }
                              }
                              v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v137, (uint64_t)&v213, v140, v241, 16);
                              if (v139)
                                continue;
                              break;
                            }
                          }
                          v143 = 0;
LABEL_105:

                          if (objc_msgSend_count(v134, v144, v145, v146))
                            v149 = v143;
                          else
                            v149 = 1;
                          if ((v149 & 1) == 0)
                          {
                            v150 = v134;

                            v206 = v150;
                          }
                        }
                        v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v147, (uint64_t)&v217, v148, v242, 16);
                      }
                      while (v130);

                      if (v206)
                      {
                        objc_msgSend_GFTGL(IDSFoundationLog, v151, v152, v153);
                        v154 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v235 = 138412802;
                          v236 = (uint64_t)v201;
                          v237 = 2112;
                          v238 = v206;
                          v239 = 2112;
                          v240 = v198;
                          _os_log_impl(&dword_19B949000, v154, OS_LOG_TYPE_DEFAULT, "[U+1] received remote key material %@ from fromParticipantIDs %@ to local participantIDs %@", v235, 0x20u);
                        }

                        WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
                        objc_msgSend_link_didReceiveKeyMaterialMessageData_fromParticipantIDs_toParticipantID_(WeakRetained, v156, (uint64_t)self, v157, v199, v206, v198);
LABEL_120:

                        v110 = v198;
                        goto LABEL_121;
                      }
                    }
                    else
                    {

                    }
                    objc_msgSend_GFTGL(IDSFoundationLog, v151, v152, v153);
                    WeakRetained = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)v235 = 0;
                      _os_log_impl(&dword_19B949000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo couldn't find fromParticipantID - ignoring this key material message", v235, 2u);
                    }
                    v206 = 0;
                    goto LABEL_120;
                  }
                }
                objc_msgSend_allValues(self->super._tokenToCandidatePairs, v52, v53, v54);
                v223 = 0u;
                v224 = 0u;
                v221 = 0u;
                v222 = 0u;
                v90 = (id)objc_claimAutoreleasedReturnValue();
                v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v91, (uint64_t)&v221, v92, v243, 16);
                if (v95)
                {
                  v97 = *(_QWORD *)v222;
                  do
                  {
                    for (k = 0; k != v95; ++k)
                    {
                      if (*(_QWORD *)v222 != v97)
                        objc_enumerationMutation(v90);
                      v99 = *(void **)(*((_QWORD *)&v221 + 1) + 8 * k);
                      if (objc_msgSend_isSharedQRSession(v99, v93, v94, v96))
                      {
                        objc_msgSend_groupID(v99, v93, v94, v96);
                        v100 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend_isEqualToString_(v100, v101, (uint64_t)v202, v102) & 1) != 0)
                        {
                          v106 = objc_msgSend_state(v99, v103, v104, v105) == 4;

                          if (v106)
                          {
                            v112 = v99;

                            v59 = v112;
                            goto LABEL_88;
                          }
                        }
                        else
                        {

                        }
                      }
                    }
                    v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v93, (uint64_t)&v221, v96, v243, 16);
                  }
                  while (v95);
                }

                objc_msgSend_GFTGL(IDSFoundationLog, v107, v108, v109);
                v110 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_121;
                *(_DWORD *)v235 = 138412290;
                v236 = (uint64_t)v202;
                v111 = "[U+1] _processCommandRelayInterfaceInfo couldn't find a matching candidatePair with relayGroupID "
                       "%@ - ignoring this key material message";
              }
              else
              {
                objc_msgSend_GFTGL(IDSFoundationLog, v49, v50, v51);
                v110 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
                {
LABEL_121:

LABEL_122:
                  if (objc_msgSend_isSharedQRSession(v205, v42, v43, v44))
                  {
                    objc_msgSend_sessionID(v205, v158, v159, v160);
                    v163 = (id)objc_claimAutoreleasedReturnValue();
LABEL_124:
                    *(_DWORD *)v235 = 0;
                    objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v161, v162, v164);
                    v165 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_candidatePairsFromRelayInterfaceInfo_bufferLength_token_sessionID_error_(v165, v166, (uint64_t)buf, v167, v226, self->super._cbuuid, v163, v235);
                    v168 = (void *)objc_claimAutoreleasedReturnValue();

                    if (*(_DWORD *)v235)
                    {
                      objc_msgSend_GFTGL(IDSFoundationLog, v169, v170, v171);
                      v172 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)v208 = 0;
                        _os_log_impl(&dword_19B949000, v172, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo: couldn't get any candidate pairs, return", v208, 2u);
                      }

                    }
                    else
                    {
                      objc_msgSend__processReceivedRemoteCandidatePairs_(self, v169, (uint64_t)v168, v171);
                    }

                  }
                  else
                  {
                    objc_msgSend_allValues(self->super._tokenToCandidatePairs, v158, v159, v160);
                    v211 = 0u;
                    v212 = 0u;
                    v209 = 0u;
                    v210 = 0u;
                    v173 = (id)objc_claimAutoreleasedReturnValue();
                    v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v173, v174, (uint64_t)&v209, v175, v234, 16);
                    if (v178)
                    {
                      v163 = 0;
                      v180 = *(_QWORD *)v210;
                      while (2)
                      {
                        for (m = 0; m != v178; ++m)
                        {
                          if (*(_QWORD *)v210 != v180)
                            objc_enumerationMutation(v173);
                          v182 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * m);
                          if (objc_msgSend_isSharedQRSession(v182, v176, v177, v179)
                            && objc_msgSend_state(v182, v176, v177, v179) == 4)
                          {
                            objc_msgSend_sessionID(v182, v176, v177, v179);
                            v183 = (void *)objc_claimAutoreleasedReturnValue();
                            v186 = v183;
                            if (v163)
                            {
                              if ((objc_msgSend_isEqualToString_(v163, v184, (uint64_t)v183, v185) & 1) == 0)
                              {
                                objc_msgSend_GFTGL(IDSFoundationLog, v187, v188, v189);
                                v193 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_WORD *)v235 = 0;
                                  _os_log_impl(&dword_19B949000, v193, OS_LOG_TYPE_DEFAULT, "[U+1] There are multiple relaySessionIDs - ignore this relayInterface Info", v235, 2u);
                                }

                                v195 = v173;
                                goto LABEL_153;
                              }
                            }
                            else
                            {
                              v163 = v183;
                            }

                          }
                        }
                        v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v173, v176, (uint64_t)&v209, v179, v234, 16);
                        if (v178)
                          continue;
                        break;
                      }

                      if (v163)
                      {

                        goto LABEL_124;
                      }
                    }
                    else
                    {

                    }
                    objc_msgSend_GFTGL(IDSFoundationLog, v190, v191, v192);
                    v195 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)v235 = 0;
                      _os_log_impl(&dword_19B949000, v195, OS_LOG_TYPE_DEFAULT, "[U+1] There is no relaySessionID found - ignore this relayInterface Info", v235, 2u);
                    }
                    v163 = 0;
LABEL_153:

                  }
                  goto LABEL_155;
                }
                *(_DWORD *)v235 = 138412290;
                v236 = 0;
                v111 = "[U+1] _processCommandRelayInterfaceInfo bad relayGroupID %@ in key material message";
              }
              _os_log_impl(&dword_19B949000, v110, OS_LOG_TYPE_DEFAULT, v111, v235, 0xCu);
              goto LABEL_121;
            }
            objc_msgSend_GFTGL(IDSFoundationLog, v39, v40, v41);
            v89 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__b = 0;
              _os_log_impl(&dword_19B949000, v89, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo failed due to invalid data.", __b, 2u);
            }

          }
LABEL_155:
          v65 = v203;
          goto LABEL_156;
        }
        v69 = v227;
        if (self->_keyMaterialData && self->_keyMaterialDataCounter <= v227)
        {
          objc_msgSend_GFTGL(IDSFoundationLog, v23, v24, v25);
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            keyMaterialDataCounter = self->_keyMaterialDataCounter;
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = v227;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = keyMaterialDataCounter;
            _os_log_impl(&dword_19B949000, v70, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo: received relay link interface ack(counter:%u >= %u) - key material data delivery success", buf, 0xEu);
          }

          objc_msgSend__discardKeyMaterialMessage_(self, v72, 0, v73);
          v69 = v227;
        }
        localRelayInterfaceCounter = self->super._localRelayInterfaceCounter;
        if (localRelayInterfaceCounter > v69)
        {
          objc_msgSend_GFTGL(IDSFoundationLog, v23, v24, v25);
          v65 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            goto LABEL_156;
          v75 = self->super._localRelayInterfaceCounter;
          v76 = self->_keyMaterialDataCounter;
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)&buf[4] = v227;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v75;
          *(_WORD *)&buf[14] = 1024;
          *(_DWORD *)&buf[16] = v76;
          v66 = "[U+1] _processCommandRelayInterfaceInfo: received old relay link interface ack(counter:%u), _localRelayI"
                "nterfaceCounter: %u, _keyMaterialDataCounter: %u, ignore.";
          v67 = v65;
          v68 = 20;
          goto LABEL_49;
        }
        if (localRelayInterfaceCounter != v69
          || (objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v23, v24, v25),
              v77 = (void *)objc_claimAutoreleasedReturnValue(),
              v80 = objc_msgSend_relayInterfaceInfoDeliveryStatus_(v77, v78, (uint64_t)self->super._cbuuid, v79) == 3,
              v77,
              !v80))
        {
          objc_msgSend_GFTGL(IDSFoundationLog, v23, v24, v25, v196, *(_QWORD *)&v197);
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v227;
            _os_log_impl(&dword_19B949000, v83, OS_LOG_TYPE_DEFAULT, "[U+1] _processCommandRelayInterfaceInfo: receive RelayInterfaceInfoAck (counter:%u).", buf, 8u);
          }

          objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v84, v85, v86);
          v65 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRelayInterfaceInfoDeliveryStatus_status_(v65, v87, (uint64_t)self->super._cbuuid, v88, 3);
          goto LABEL_156;
        }
        objc_msgSend_GFTGL(IDSFoundationLog, v23, v24, v25);
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v66 = "[U+1] _processCommandRelayInterfaceInfo: current status is success, ignore.";
          goto LABEL_48;
        }
      }
      else
      {
        objc_msgSend_GFTGL(IDSFoundationLog, v23, v24, v25);
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v66 = "[U+1] _processCommandRelayInterfaceInfo failed due to invalid counter.";
LABEL_48:
          v67 = v65;
          v68 = 2;
LABEL_49:
          _os_log_impl(&dword_19B949000, v67, OS_LOG_TYPE_DEFAULT, v66, buf, v68);
        }
      }
LABEL_156:

      goto LABEL_157;
    }
    objc_msgSend_GFTGL(IDSFoundationLog, v11, v12, v13);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v62, OS_LOG_TYPE_DEFAULT, "[U+1] no remote device version received yet. Saving incoming RelayInterfaceInfo[Ack] for later", buf, 2u);
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_19BA34FA4;
    aBlock[3] = &unk_1E3C1FFF0;
    objc_copyWeak(&v233, (id *)buf);
    v231 = v6;
    v232 = key;
    v63 = _Block_copy(aBlock);
    pendingCommandRelayInterfaceInfoBlock = self->super._pendingCommandRelayInterfaceInfoBlock;
    self->super._pendingCommandRelayInterfaceInfoBlock = v63;

    objc_destroyWeak(&v233);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v11, v12, v13);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v60, OS_LOG_TYPE_DEFAULT, "[U+1] not processing CommandRelayInterfaceInfo because we are not in U+1 mode.", buf, 2u);
    }

  }
LABEL_159:

}

- (BOOL)_postProcessAllocbindResponse:(id)a3 candidatePair:(id)a4 candidatePairToken:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
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
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  double v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  unint64_t v55;
  const char *v56;
  uint64_t v57;
  double v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  double v63;
  NSObject *v64;
  const char *v65;
  double v66;
  void *v67;
  const char *v68;
  double v69;
  const char *v70;
  double v71;
  const char *v72;
  uint64_t v73;
  double v74;
  IDSGFTGL *v75;
  NSArray *v76;
  const char *v77;
  double v78;
  const char *v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  uint64_t i;
  void *v84;
  const char *v85;
  uint64_t v86;
  double v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  double v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  double v95;
  __CFString *v96;
  __CFString *v97;
  NSObject *v98;
  id WeakRetained;
  char v100;
  id v101;
  const char *v102;
  double v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  double v107;
  void *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  double v112;
  float v113;
  void *v114;
  NSObject *v115;
  id v116;
  char v117;
  id v118;
  const char *v119;
  double v120;
  const char *v121;
  uint64_t v122;
  double v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  double v127;
  void *v128;
  const char *v129;
  double v130;
  const char *v131;
  uint64_t v132;
  double v133;
  void *v134;
  const char *v135;
  double v136;
  const char *v137;
  uint64_t v138;
  double v139;
  void *v140;
  __CFString *v141;
  const char *v142;
  double v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  double v147;
  uint64_t v148;
  uint64_t j;
  void *v150;
  void *v151;
  const char *v152;
  double v153;
  const char *v154;
  uint64_t v155;
  double v156;
  void *v157;
  const char *v158;
  double v159;
  const char *v160;
  uint64_t v161;
  double v162;
  const char *v163;
  uint64_t v164;
  double v165;
  int isSharedQRSession;
  const char *v167;
  double v168;
  const char *v169;
  uint64_t v170;
  double v171;
  NSObject *v172;
  __CFDictionary *v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  double v177;
  uint64_t SessionInfoReqID;
  const char *v179;
  double v180;
  void *v181;
  const char *v182;
  double v183;
  void *v184;
  const char *v185;
  double v186;
  int HasValidUInt32Attr;
  int v188;
  id v189;
  char v190;
  id v191;
  const char *v192;
  double v193;
  NSObject *v195;
  const char *v196;
  double v197;
  __CFString *v198;
  id v199;
  void *value;
  void *v201;
  void *v202;
  __CFDictionary *v203;
  const __CFDictionary *theDict;
  __CFString *v205;
  void *v206;
  void *v207;
  id v208;
  _QWORD v210[5];
  id v211;
  unsigned int v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  unsigned int v221;
  _BYTE v222[128];
  uint8_t v223[128];
  uint8_t buf[4];
  __CFString *v225;
  __int16 v226;
  uint64_t v227;
  __int16 v228;
  id v229;
  uint64_t v230;

  v230 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v208 = a4;
  v199 = a5;
  v221 = 0;
  v207 = v7;
  if (StunUtilHasValidUInt32Attr((uint64_t)v7, 65512, &v221))
    objc_msgSend_setChannelSettings_(v208, v8, v221, v10);
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v8, v9, v10);
  v205 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GFTGL(IDSFoundationLog, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v225 = v205;
    _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_DEFAULT, "current candidate pairs: %@", buf, 0xCu);
  }

  GLUtilGetDifferentRelayCandidatePairSucceeded(v208, v205);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_local(v206, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_transport(v18, v19, v20, v21);

  objc_msgSend_local(v208, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_transport(v26, v27, v28, v29);

  if (v206)
  {
    if (v22 <= v30 && (objc_msgSend_isRealloc(v208, v31, v32, v33) & 1) == 0)
    {
      objc_msgSend_GFTGL(IDSFoundationLog, v31, v32, v33);
      v195 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v225 = (__CFString *)v22;
        v226 = 2048;
        v227 = v30;
        v228 = 2112;
        v229 = v208;
        _os_log_impl(&dword_19B949000, v195, OS_LOG_TYPE_DEFAULT, "succeededTransport %ld currentTransport %ld discard current pair: %@", buf, 0x20u);
      }

      objc_msgSend__sendUnallocbindRequest_stunMessage_reason_(self, v196, (uint64_t)v199, v197, 0, 8);
      goto LABEL_93;
    }
    objc_msgSend_GFTGL(IDSFoundationLog, v31, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v225 = (__CFString *)v22;
      v226 = 2048;
      v227 = v30;
      v228 = 2112;
      v229 = v206;
      _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "succeededTransport %ld currentTransport %ld discard existing pair: %@.", buf, 0x20u);
    }

    objc_msgSend_candidatePairToken(v206, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__sendUnallocbindRequest_stunMessage_reason_(self, v39, (uint64_t)v38, v40, 0, 8);

  }
  objc_msgSend_hbhEncKey(v208, v31, v32, v33);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v43
    || (objc_msgSend_hbhDecKey(v208, v41, v42, v44),
        v45 = (void *)objc_claimAutoreleasedReturnValue(),
        v46 = v45 == 0,
        v45,
        v43,
        v46))
  {
    objc_msgSend_relaySessionKey(v208, v41, v42, v44);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sessionID(v208, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend_participantID(v208, v52, v53, v54);
    objc_msgSend_transactionID(v207, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    IDSLinkHBHDeriveHKDFSha256Keys(v47, v51, v55, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      objc_msgSend_subdataWithRange_(v60, v61, 0, v63, 32);
      v64 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_subdataWithRange_(v60, v65, 32, v66, 32);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setHbhEncKey_(v208, v68, (uint64_t)v64, v69);
      objc_msgSend_setHbhDecKey_(v208, v70, (uint64_t)v67, v71);

    }
    else
    {
      objc_msgSend_GFTGL(IDSFoundationLog, v61, v62, v63);
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        sub_19BAF64FC();
    }

  }
  objc_msgSend__notifyQRSessionConnected_(self, v41, (uint64_t)v208, v44);
  v75 = self;
  if (self->super._isUPlusOneSession)
  {
    objc_msgSend__sendRelayInterfaceInfo_(self, v72, (uint64_t)v199, v74);
    v219 = 0u;
    v220 = 0u;
    v218 = 0u;
    v217 = 0u;
    v76 = self->_remoteCandidatePairs;
    v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v77, (uint64_t)&v217, v78, v223, 16);
    if (v80)
    {
      v82 = *(_QWORD *)v218;
      do
      {
        for (i = 0; i != v80; ++i)
        {
          if (*(_QWORD *)v218 != v82)
            objc_enumerationMutation(v76);
          objc_msgSend__setupVirtualCandidatePairs_remoteCandidatePair_(self, v79, (uint64_t)v208, v81, *(_QWORD *)(*((_QWORD *)&v217 + 1) + 8 * i));
        }
        v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v79, (uint64_t)&v217, v81, v223, 16);
      }
      while (v80);
    }

    v75 = self;
  }
  objc_msgSend_allValues(v75->super._tokenToCandidatePairs, v72, v73, v74);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  GLUtilGetRelayCandidatePairNotSucceededForOppositeIPVersion(v208, v84);
  v201 = (void *)objc_claimAutoreleasedReturnValue();

  if (v201)
  {
    GLUCreateIPVersionFailureEvent(v201);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_local(v201, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(objc_msgSend_address(v92, v93, v94, v95) + 1) == 2)
      v96 = CFSTR("IPv4");
    else
      v96 = CFSTR("IPv6");
    v97 = v96;

    OSLogHandleForTransportCategory();
    v98 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v225 = v97;
      _os_log_impl(&dword_19B949000, v98, OS_LOG_TYPE_DEFAULT, "RTC reports: add %@ setup failure", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v198 = v97;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("RTC reports: add %@ setup failure"));
        if (_IDSShouldLog())
        {
          v198 = v97;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("RTC reports: add %@ setup failure"));
        }
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    v100 = objc_opt_respondsToSelector();

    if ((v100 & 1) != 0)
    {
      v101 = objc_loadWeakRetained((id *)&self->super._delegate);
      objc_msgSend_link_didAddQREvent_(v101, v102, (uint64_t)self, v103, v88);

    }
  }
  v104 = objc_msgSend_linkID(v208, v85, v86, v87, v198);
  StunUtilProcessStreamInfo(v207, v104, v104);
  theDict = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v108 = 0;
  if (theDict)
  {
    v105 = CFSTR("stream-info-peer-published-streams");
    if (CFSTR("stream-info-peer-published-streams"))
      v108 = (void *)CFDictionaryGetValue(theDict, CFSTR("stream-info-peer-published-streams"));
  }
  v109 = objc_msgSend_participantID(v208, v105, v106, v107);
  StunUtilProcessParticipants(v108, v109, self->super._isLightweightParticipant);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  StunUtilProcessLightweightParticipants(v207);
  value = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_count(v202, v110, v111, v112) >= 2)
  {
    self->super._isSecondOrLaterParticipant = 1;
    if (!self->super._receivedAllocbindResponse)
    {
      v113 = ids_monotonic_time();
      GLUCreateQRClientTimeEvent(311, 0, v208, 0, v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      OSLogHandleForTransportCategory();
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v115, OS_LOG_TYPE_DEFAULT, "RTC reports: add first allocbind response", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("RTC reports: add first allocbind response"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("RTC reports: add first allocbind response"));
        }
      }
      v116 = objc_loadWeakRetained((id *)&self->super._delegate);
      v117 = objc_opt_respondsToSelector();

      if ((v117 & 1) != 0)
      {
        v118 = objc_loadWeakRetained((id *)&self->super._delegate);
        objc_msgSend_link_didAddQREvent_(v118, v119, (uint64_t)self, v120, v114);

      }
      self->super._receivedAllocbindResponse = 1;

    }
  }
  v203 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (theDict)
    CFDictionarySetValue(v203, CFSTR("gl-option-sessioninfo-response-streaminfo-key"), theDict);
  if (v202)
    CFDictionarySetValue(v203, CFSTR("gl-option-sessioninfo-response-participants-key"), v202);
  if (value)
    CFDictionarySetValue(v203, CFSTR("gl-option-sessioninfo-response-lightweight-participants-key"), value);
  objc_msgSend_groupID(v208, v121, v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sessionID(v208, v125, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__notifySessionInfoReceived_relayGroupID_relaySessionID_status_(self, v129, (uint64_t)v203, v130, v124, v128, 0);

  objc_msgSend_sessionID(v208, v131, v132, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_initParticipantIDMap_(v208, v135, 0, v136);
  objc_msgSend_groupID(v208, v137, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v215 = 0u;
  v216 = 0u;
  v213 = 0u;
  v214 = 0u;
  v141 = v205;
  v146 = objc_msgSend_countByEnumeratingWithState_objects_count_(v141, v142, (uint64_t)&v213, v143, v222, 16);
  if (v146)
  {
    v148 = *(_QWORD *)v214;
    do
    {
      for (j = 0; j != v146; ++j)
      {
        if (*(_QWORD *)v214 != v148)
          objc_enumerationMutation(v141);
        v150 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * j);
        objc_msgSend_sessionID(v150, v144, v145, v147);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v151, v152, (uint64_t)v134, v153))
        {
          objc_msgSend_groupID(v150, v154, v155, v156);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqualToString_(v157, v158, (uint64_t)v140, v159)
            && objc_msgSend_state(v150, v160, v161, v162) == 4)
          {
            isSharedQRSession = objc_msgSend_isSharedQRSession(v150, v163, v164, v165);

            if (!isSharedQRSession)
              continue;
            objc_msgSend_allKeys(self->super._pluginParticipantIDs, v144, v145, v147);
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_updateParticipantIDMap_(v150, v167, (uint64_t)v151, v168);
          }
          else
          {

          }
        }

      }
      v146 = objc_msgSend_countByEnumeratingWithState_objects_count_(v141, v144, (uint64_t)&v213, v147, v222, 16);
    }
    while (v146);
  }

  v212 = 0;
  if (StunUtilHasValidUInt32Attr((uint64_t)v207, 65513, &v212))
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v169, v170, v171);
    v172 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v225) = v212;
      _os_log_impl(&dword_19B949000, v172, OS_LOG_TYPE_DEFAULT, "receive channel cookie %08x.", buf, 8u);
    }

    v173 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v174 = (void *)MEMORY[0x1E0CB37E8];
    SessionInfoReqID = objc_msgSend_nextSessionInfoReqID(v208, v175, v176, v177);
    objc_msgSend_numberWithUnsignedInt_(v174, v179, SessionInfoReqID, v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    if (v181)
    {
      CFDictionarySetValue(v173, CFSTR("gl-option-sessioninfo-request-id"), v181);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAF3B34();
    }

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v182, v212, v183);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    if (v184)
    {
      CFDictionarySetValue(v173, CFSTR("gl-option-sessioninfo-cookie"), v184);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAF647C();
    }

    objc_msgSend_sendSessionInfoRequest_options_(v208, v185, 0, v186, v173);
  }
  *(_DWORD *)buf = 0;
  HasValidUInt32Attr = StunUtilHasValidUInt32Attr((uint64_t)v207, 65489, buf);
  if (*(_DWORD *)buf)
    v188 = HasValidUInt32Attr;
  else
    v188 = 0;
  if (v188 == 1)
  {
    v189 = objc_loadWeakRetained((id *)&self->super._delegate);
    v190 = objc_opt_respondsToSelector();

    if ((v190 & 1) != 0)
    {
      v191 = objc_loadWeakRetained((id *)&self->super._delegate);
      objc_msgSend_link_didReceiveSessionStateCounter_(v191, v192, (uint64_t)self, v193, *(unsigned int *)buf);

    }
  }
  v210[0] = MEMORY[0x1E0C809B0];
  v210[1] = 3221225472;
  v210[2] = sub_19BA35D14;
  v210[3] = &unk_1E3C1FA08;
  v210[4] = self;
  v211 = v208;
  IDSTransportThreadAddBlockAfter(v210, 1.0);

LABEL_93:
  return 1;
}

- (int64_t)_getQRAllocateType
{
  return 3;
}

- (void)_sendRelayInterfaceInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  NSMutableDictionary *tokenToCandidatePairs;
  uint64_t v23;
  const char *v24;
  double v25;
  void *v26;
  void *v27;
  NSObject *v28;
  const __CFString *v29;
  const __CFString *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  id v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  double v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  double v55;
  int v56;
  unsigned int keyMaterialDataCounter;
  void *v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  void *v64;
  void *v65;
  const char *v66;
  double v67;
  const char *v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  double v74;
  NSObject *v75;
  unsigned int localRelayInterfaceCounter;
  const char *v77;
  double v78;
  const char *v79;
  uint64_t v80;
  double v81;
  void *v82;
  const char *v83;
  double v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  uint64_t v91;
  uint8_t buf[4];
  _BYTE v93[18];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_relayInterfaceInfoDeliveryStatus_(v8, v9, (uint64_t)self->super._cbuuid, v10);

  if (v11 >= 3)
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v93 = v11;
      _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "[U+1] _sendRelayInterfaceInfo status was %lu. Resetting", buf, 0xCu);
    }

    objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeCache_(v19, v20, (uint64_t)self->super._cbuuid, v21);

  }
  if (!self->_allowE2E || !self->super._receivedRemoteDeviceVersion)
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v12, v13, v14);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = CFSTR("YES");
      if (self->_allowE2E)
        v30 = CFSTR("YES");
      else
        v30 = CFSTR("NO");
      if (!self->super._receivedRemoteDeviceVersion)
        v29 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v93 = v30;
      *(_WORD *)&v93[8] = 2112;
      *(_QWORD *)&v93[10] = v29;
      _os_log_impl(&dword_19B949000, v28, OS_LOG_TYPE_DEFAULT, "[U+1] _sendRelayInterfaceInfo can't send relayInterfaceInfo yet. allowE2E = %@, receivedRemoteDeviceVersion = %@", buf, 0x16u);
    }

    objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v31, v32, v33);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRelayInterfaceInfoDeliveryStatus_status_(v34, v35, (uint64_t)self->super._cbuuid, v36, 1);
    goto LABEL_48;
  }
  tokenToCandidatePairs = self->super._tokenToCandidatePairs;
  if (v4)
  {
    objc_msgSend_objectForKeyedSubscript_(tokenToCandidatePairs, v12, (uint64_t)v4, v14);
    v23 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v23;
    if (v23)
    {
      v91 = v23;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v24, (uint64_t)&v91, v25, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    objc_msgSend_allValues(tokenToCandidatePairs, v12, v13, v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v34 = v27;
  v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v86, v38, v90, 16);
  if (v39)
  {
    v42 = v39;
    v43 = 0;
    v44 = *(_QWORD *)v87;
    v45 = 67109376;
    while (1)
    {
      v46 = 0;
      v85 = v42;
      do
      {
        if (*(_QWORD *)v87 != v44)
          objc_enumerationMutation(v34);
        v47 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v46);
        v48 = objc_msgSend_state(v47, v40, v41, *(double *)&v45);
        if (objc_msgSend_isRelayStunCandidatePair(v47, v49, v50, v51))
        {
          if (v48 != 4)
            goto LABEL_42;
        }
        else if (v48 != 3)
        {
          goto LABEL_42;
        }
        if ((v43 & 1) == 0)
          ++self->super._localRelayInterfaceCounter;
        if (self->_keyMaterialData)
        {
          if (self->_keyMaterialDataCounter == -1)
            self->_keyMaterialDataCounter = self->super._localRelayInterfaceCounter;
          objc_msgSend_GFTGL(IDSFoundationLog, v40, v41, *(double *)&v45);
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v56 = objc_msgSend_length(self->_keyMaterialData, v53, v54, v55);
            keyMaterialDataCounter = self->_keyMaterialDataCounter;
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v93 = v56;
            *(_WORD *)&v93[4] = 1024;
            *(_DWORD *)&v93[6] = keyMaterialDataCounter;
            _os_log_impl(&dword_19B949000, v52, OS_LOG_TYPE_DEFAULT, "[U+1] _sendRelayInterfaceInfo piggybacking key material message %d bytes. keyMaterialDataCounter = %u", buf, 0xEu);
          }

          v58 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v59, self->super._localRelayInterfaceCounter, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dictionaryWithObjectsAndKeys_(v58, v62, (uint64_t)v61, v63, CFSTR("gl-attr-counter"), self->_keyMaterialData, CFSTR("gl-attr-mkm"), 0);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v65 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v40, self->super._localRelayInterfaceCounter, *(double *)&v45);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dictionaryWithObjectsAndKeys_(v65, v66, (uint64_t)v61, v67, CFSTR("gl-attr-counter"), 0);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend_candidatePairToken(v47, v68, v69, v70);
        v71 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_GFTGL(IDSFoundationLog, v72, v73, v74);
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          localRelayInterfaceCounter = self->super._localRelayInterfaceCounter;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v93 = localRelayInterfaceCounter;
          *(_WORD *)&v93[4] = 2112;
          *(_QWORD *)&v93[6] = v71;
          _os_log_impl(&dword_19B949000, v75, OS_LOG_TYPE_DEFAULT, "[U+1] _sendRelayInterfaceInfo: send RelayInterfaceInfo (counter: %u) on %@", buf, 0x12u);
        }

        objc_msgSend__sendCommandMessage_stunMessage_options_candidatePairToken_(self, v77, 6, v78, 0, v64, v71);
        v43 = 1;
        v4 = (id)v71;
        v42 = v85;
LABEL_42:
        ++v46;
      }
      while (v42 != v46);
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v40, (uint64_t)&v86, *(double *)&v45, v90, 16);
      if (!v42)
      {

        if ((v43 & 1) != 0)
        {
          objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v79, v80, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRelayInterfaceInfoDeliveryStatus_status_(v82, v83, (uint64_t)self->super._cbuuid, v84, 2);
          goto LABEL_47;
        }
        goto LABEL_48;
      }
    }
  }
  v82 = v34;
LABEL_47:

LABEL_48:
}

- (BOOL)_setupNewQRLinkIfNecessary:(id)a3
{
  unsigned int v5;
  const char *v6;
  uint64_t v7;
  double v8;
  BOOL v9;
  NSObject *v10;
  NSString *idsSessionID;
  NSObject *v12;
  _QWORD block[5];
  objc_super v15;
  uint8_t buf[4];
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)IDSGFTGL;
  v5 = -[IDSGlobalLink _setupNewQRLinkIfNecessary:](&v15, sel__setupNewQRLinkIfNecessary_);
  v9 = v5;
  if (!a3 && v5)
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      idsSessionID = self->super._idsSessionID;
      *(_DWORD *)buf = 138412290;
      v17 = idsSessionID;
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "set up new QR link for group %@.", buf, 0xCu);
    }

    im_primary_queue();
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19BA36448;
    block[3] = &unk_1E3C1F898;
    block[4] = self;
    dispatch_async(v12, block);

  }
  return v9;
}

- (void)setAllowP2P:(BOOL)a3
{
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  IDSNWLink *nwLink;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (IMGetDomainBoolForKeyWithDefaultValue())
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v5, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "Ignore setAllowP2P due to defaults", (uint8_t *)&v15, 2u);
    }

  }
  else
  {
    self->super._allowP2P = a3;
    objc_msgSend_GFTGL(IDSFoundationLog, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->super._allowP2P)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "[U+1] setAllowP2P: %@", (uint8_t *)&v15, 0xCu);
    }

    nwLink = self->super._nwLink;
    if (nwLink)
      objc_msgSend_setDisableP2P_(nwLink, v11, !self->super._allowP2P, v13);
    if (self->super._allowP2P)
      objc_msgSend__startExtIPDiscovery(self, v11, v12, v13);
  }
}

- (void)_enableE2E
{
  uint64_t v2;
  double v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_allowE2E)
  {
    objc_msgSend_GFTGL(IDSFoundationLog, a2, v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend_relayInterfaceInfoDeliveryStatus_(v9, v10, (uint64_t)self->super._cbuuid, v11);
      v23 = 134217984;
      v24 = v12;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "[U+1] _enableE2E: now can set up E2E links, VR status: %ld", (uint8_t *)&v23, 0xCu);

    }
    self->_allowE2E = 1;
    objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_relayInterfaceInfoDeliveryStatus_(v16, v17, (uint64_t)self->super._cbuuid, v18);

    if (v19 == 1)
      objc_msgSend__sendRelayInterfaceInfo_(self, v20, 0, v22);
    objc_msgSend__startExtIPDiscovery(self, v20, v21, v22);
  }
}

- (void)_disableE2E
{
  uint64_t v2;
  double v3;
  unint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  NSMutableArray *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  NSMutableArray *virtualCandidatePairs;
  NSArray *remoteCandidatePairs;
  NSMutableDictionary *localRemoteRelayLinkIDToVirtualCandidatePairs;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __CFArray *v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  double v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  IDSGFTGL *v47;
  __CFArray *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  const char *v52;
  double v53;
  NSMutableDictionary *tokenToStunCheckPairs;
  NSMutableArray *remoteCandidateList;
  const char *v56;
  uint64_t v57;
  double v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  double v62;
  void *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = 0x1E3C19000uLL;
  objc_msgSend_GFTGL(IDSFoundationLog, a2, v2, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "[U+1] _disableE2E: disconnect all E2E links", buf, 2u);
  }

  self->_allowE2E = 0;
  objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeCache_(v10, v11, (uint64_t)self->super._cbuuid, v12);

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v13 = self->_virtualCandidatePairs;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v69, v15, v76, 16);
  if (v16)
  {
    v19 = v16;
    v20 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v70 != v20)
          objc_enumerationMutation(v13);
        objc_msgSend__notifyCandidatePairDisconnected_withReason_(self, v17, *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i), v18, 7);
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v69, v18, v76, 16);
    }
    while (v19);
  }

  virtualCandidatePairs = self->_virtualCandidatePairs;
  self->_virtualCandidatePairs = 0;

  remoteCandidatePairs = self->_remoteCandidatePairs;
  self->_remoteCandidatePairs = 0;

  localRemoteRelayLinkIDToVirtualCandidatePairs = self->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
  self->super._localRemoteRelayLinkIDToVirtualCandidatePairs = 0;

  self->super._receivedRemoteDeviceVersion = 0;
  self->super._remoteRelayInterfaceCounter = 0;
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v65, 0.0, v75, 16);
  if (v30)
  {
    v34 = v30;
    v35 = 0;
    v36 = *(_QWORD *)v66;
    v33 = 138412290;
    v64 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v66 != v36)
          objc_enumerationMutation(v28);
        v38 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
        if ((objc_msgSend_isRelayStunCandidatePair(v38, v31, v32, *(double *)&v33) & 1) == 0
          && objc_msgSend_state(v38, v31, v32, *(double *)&v33) == 3)
        {
          objc_msgSend_candidatePairToken(v38, v31, v32, *(double *)&v33);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v35)
            v35 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (v35 && v41)
            CFArrayAppendValue(v35, v41);
          objc_msgSend_GFTGL(*(void **)(v5 + 2856), v39, v40, v42);
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_candidatePairToken(v38, v44, v45, v46);
            v47 = self;
            v48 = v35;
            v49 = v28;
            v50 = v5;
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v74 = v51;
            _os_log_impl(&dword_19B949000, v43, OS_LOG_TYPE_DEFAULT, "[U+1] removing P2P candidate pair %@", buf, 0xCu);

            v5 = v50;
            v28 = v49;
            v35 = v48;
            self = v47;
            v36 = v64;
          }

          objc_msgSend__notifyCandidatePairDisconnected_withReason_(self, v52, (uint64_t)v38, v53, 7);
        }
      }
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v65, *(double *)&v33, v75, 16);
    }
    while (v34);
  }
  else
  {
    v35 = 0;
  }
  objc_msgSend_removeObjectsForKeys_(self->super._tokenToCandidatePairs, v31, (uint64_t)v35, *(double *)&v33);
  tokenToStunCheckPairs = self->super._tokenToStunCheckPairs;
  self->super._tokenToStunCheckPairs = 0;

  remoteCandidateList = self->super._remoteCandidateList;
  self->super._remoteCandidateList = 0;

  objc_msgSend_GFTGL(*(void **)(v5 + 2856), v56, v57, v58);
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_allValues(self->super._tokenToCandidatePairs, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v74 = v63;
    _os_log_impl(&dword_19B949000, v59, OS_LOG_TYPE_DEFAULT, "[U+1] remaining candidate pairs: %@", buf, 0xCu);

  }
}

- (void)_sendConnectionDataWithRemovedAddressList:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  objc_super v11;
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_allowE2E && self->super._receivedRemoteDeviceVersion)
  {
    v11.receiver = self;
    v11.super_class = (Class)IDSGFTGL;
    -[IDSGlobalLink _sendConnectionDataWithRemovedAddressList:](&v11, sel__sendConnectionDataWithRemovedAddressList_, v6);
  }
  else
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v4, v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("YES");
      if (self->_allowE2E)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      if (!self->super._receivedRemoteDeviceVersion)
        v9 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "[U+1] cannot send connection data yet. allowE2E = %@, receivedRemoteDeviceVersion = %@", buf, 0x16u);
    }

  }
}

- (void)receiveJoinNotificationFromAParticipant
{
  uint64_t v2;
  double v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint8_t v9[16];

  if (self->super._isUPlusOneSession)
  {
    objc_msgSend_GFTGL(IDSFoundationLog, a2, v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "[U+1] remote joined the U + 1 session", v9, 2u);
    }

    objc_msgSend__enableE2E(self, v6, v7, v8);
  }
}

- (void)setIsUPlusOneSession:(BOOL)a3
{
  double v3;
  _BOOL4 v4;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  const char *v9;
  uint64_t v10;
  double v11;
  NSObject *v12;
  void *v13;
  id WeakRetained;
  char v15;
  id v16;
  const char *v17;
  double v18;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  if (self->super._isUPlusOneSession != a3)
  {
    v4 = a3;
    self->super._isUPlusOneSession = a3;
    objc_msgSend_GFTGL(IDSFoundationLog, a2, a3, v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "[U+1] enabled", buf, 2u);
      }

      v8 = IMGetDomainBoolForKeyWithDefaultValue();
      self->super._allowP2P = v8 ^ 1;
      if (((v8 ^ 1) & 1) == 0)
      {
        objc_msgSend_GFTGL(IDSFoundationLog, v9, v10, v11);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "disableP2PLinks default is set to YES.", v20, 2u);
        }

      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "[U+1] disabled", v19, 2u);
      }

      self->super._shouldReportAcceptDelay = 0;
      self->super._allowP2P = 0;
    }
    GLUCreateSetUPlusOneEvent(v4, self->super._timeBase);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        v16 = objc_loadWeakRetained((id *)&self->super._delegate);
        objc_msgSend_link_didAddQREvent_(v16, v17, (uint64_t)self, v18, v13);

      }
    }

  }
}

- (void)enableUPlusOneSessionForTransition:(BOOL)a3
{
  double v3;
  _BOOL8 v4;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  id pendingCommandRelayInterfaceInfoBlock;
  int v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v4 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend_GFTGL(IDSFoundationLog, a2, a3, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    if (self->super._isUPlusOneSession)
      v7 = CFSTR("YES");
    v21 = 138412546;
    v22 = v8;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "[U+1] enableUPlusOneSessionForTransition: enableUPlusOneSession: %@, _isUPlusOneSession: %@", (uint8_t *)&v21, 0x16u);
  }

  if (self->super._isUPlusOneSession != v4)
  {
    objc_msgSend_setIsUPlusOneSession_(self, v9, v4, v10);
    if (v4)
    {
      objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRelayInterfaceInfoDeliveryStatus_status_(v14, v15, (uint64_t)self->super._cbuuid, v16, 1);

      objc_msgSend__enableE2E(self, v17, v18, v19);
    }
    else
    {
      objc_msgSend__disableE2E(self, v11, v12, v13);
      pendingCommandRelayInterfaceInfoBlock = self->super._pendingCommandRelayInterfaceInfoBlock;
      self->super._pendingCommandRelayInterfaceInfoBlock = 0;

    }
  }
}

- (void)_discardCandidatePairsWithOption:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  const char *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *localRemoteRelayLinkIDToVirtualCandidatePairs;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_virtualCandidatePairs;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, v7, v20, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v5);
        objc_msgSend__notifyCandidatePairDisconnected_withReason_(self, v9, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++), v10, 11);
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v16, v10, v20, 16);
    }
    while (v11);
  }

  localRemoteRelayLinkIDToVirtualCandidatePairs = self->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
  self->super._localRemoteRelayLinkIDToVirtualCandidatePairs = 0;

  v15.receiver = self;
  v15.super_class = (Class)IDSGFTGL;
  -[IDSGlobalLink _discardCandidatePairsWithOption:](&v15, sel__discardCandidatePairsWithOption_, v3);
}

- (BOOL)_processRemovedLocalAddressList:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  uint64_t v8;
  __CFArray *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  NSMutableArray *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  _BOOL4 v33;
  BOOL v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  const char *v42;
  uint64_t v43;
  double v44;
  unsigned int v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  double v50;
  void *v51;
  NSMutableDictionary *localRemoteRelayLinkIDToVirtualCandidatePairs;
  const char *v53;
  uint64_t v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  uint64_t v59;
  double v60;
  NSObject *v61;
  NSMutableArray *virtualCandidatePairs;
  const char *v63;
  uint64_t v64;
  double v65;
  NSObject *v66;
  NSMutableDictionary *v67;
  const char *v68;
  double v69;
  BOOL v71;
  id obj;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  uint8_t buf[4];
  void *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)IDSGFTGL;
  v71 = -[IDSGlobalLink _processRemovedLocalAddressList:](&v84, sel__processRemovedLocalAddressList_, v4);
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v4;
  v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v80, v6, v88, 16);
  v9 = 0;
  if (v74)
  {
    v73 = *(_QWORD *)v81;
    v10 = 138412290;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v81 != v73)
          objc_enumerationMutation(obj);
        v75 = v11;
        objc_msgSend_address(*(void **)(*((_QWORD *)&v80 + 1) + 8 * v11), v7, v8, *(double *)&v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend_sa(v12, v13, v14, v15);

        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v17 = self->_virtualCandidatePairs;
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v76, v19, v87, 16);
        if (v20)
        {
          v24 = v20;
          v25 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v77 != v25)
                objc_enumerationMutation(v17);
              v27 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
              objc_msgSend_local(v27, v21, v22, v23);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend_address(v28, v29, v30, v31);
              v33 = IsSameIP(v16, v32);

              if (v33)
              {
                if (!v9)
                  v9 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                if (v27)
                  v34 = v9 == 0;
                else
                  v34 = 1;
                if (!v34)
                  CFArrayAppendValue(v9, v27);
                objc_msgSend_GFTGL(IDSFoundationLog, v21, v22, v23);
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_candidatePairToken(v27, v36, v37, v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v86 = v39;
                  _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "[U+1] _processRemovedLocalAddressList: remove virtual candidate pair %@.", buf, 0xCu);

                }
                objc_msgSend__notifyCandidatePairDisconnected_withReason_(self, v40, (uint64_t)v27, v41, 1);
                v45 = objc_msgSend_relayLinkID(v27, v42, v43, v44);
                v49 = (const char *)objc_msgSend_remoteRelayLinkID(v27, v46, v47, v48);
                localRemoteRelayLinkIDForVirtualStunCandidatePair(v45, v49, v50);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                if (v51)
                {
                  localRemoteRelayLinkIDToVirtualCandidatePairs = self->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
                  if (localRemoteRelayLinkIDToVirtualCandidatePairs)
                    CFDictionaryRemoveValue((CFMutableDictionaryRef)localRemoteRelayLinkIDToVirtualCandidatePairs, v51);
                }

              }
            }
            v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v21, (uint64_t)&v76, v23, v87, 16);
          }
          while (v24);
        }

        v11 = v75 + 1;
      }
      while (v75 + 1 != v74);
      v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v80, *(double *)&v10, v88, 16);
    }
    while (v74);
  }

  if (objc_msgSend_count(v9, v53, v54, v55))
  {
    objc_msgSend_removeObjectsInArray_(self->_virtualCandidatePairs, v56, (uint64_t)v9, v57);
    objc_msgSend_GFTGL(IDSFoundationLog, v58, v59, v60);
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      virtualCandidatePairs = self->_virtualCandidatePairs;
      *(_DWORD *)buf = 138412290;
      v86 = virtualCandidatePairs;
      _os_log_impl(&dword_19B949000, v61, OS_LOG_TYPE_DEFAULT, "[U+1] _processRemovedLocalAddressList: virtual candidate pairs: %@", buf, 0xCu);
    }

    objc_msgSend_GFTGL(IDSFoundationLog, v63, v64, v65);
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = self->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
      *(_DWORD *)buf = 138412290;
      v86 = v67;
      _os_log_impl(&dword_19B949000, v66, OS_LOG_TYPE_DEFAULT, "[U+1] _processRemovedLocalAddressList: localRemoteRelayLinkID map: %@", buf, 0xCu);
    }

    objc_msgSend__sendRelayInterfaceInfo_(self, v68, 0, v69);
  }

  return v71;
}

- (void)manageDesignatedDestinations:(id)a3 relayGroupID:(id)a4 withType:(unsigned __int16)a5 sessionStateCounter:(unsigned int)a6
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const char *v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  NSObject *v34;
  __CFDictionary *v35;
  const char *v36;
  double v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  const char *v47;
  double v48;
  uint64_t v49;
  const char *v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  uint64_t v55;
  void *v56;
  const char *v57;
  double v58;
  void *v59;
  const char *v60;
  double v61;
  const char *v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  double v68;
  NSObject *v69;
  _BOOL4 v70;
  id v71;
  __CFDictionary *v72;
  const char *v73;
  double v74;
  void *v75;
  const char *v76;
  double v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  double v81;
  const char *v82;
  uint64_t v83;
  double v84;
  NSObject *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  double v89;
  const char *v90;
  double v91;
  id WeakRetained;
  char v93;
  id v94;
  const char *v95;
  double v96;
  CFMutableDictionaryRef theDict;
  NSObject *v98;
  id v99;
  id v100;
  IDSGFTGL *v101;
  unsigned int v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t buf[4];
  id v113;
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v103 = a5;
  v116 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v101 = self;
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v10, v11, v12);
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v108, v15, v115, 16);
  if (!v16)
    goto LABEL_12;
  v20 = v16;
  v21 = *(_QWORD *)v109;
  while (2)
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v109 != v21)
        objc_enumerationMutation(v13);
      v23 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
      objc_msgSend_groupID(v23, v17, v18, v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v24, v25, (uint64_t)v9, v26))
      {
        v30 = objc_msgSend_state(v23, v27, v28, v29);

        if (v30 == 4)
        {
          v35 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v36, v103, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v38)
          {
            CFDictionarySetValue(v35, CFSTR("gl-option-participant-update-request-type"), v38);
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            sub_19BAF66A8();
          }

          if ((unsigned __int16)(v103 - 1) <= 3u)
          {
            theDict = v35;
            v98 = v13;
            v99 = v9;
            objc_msgSend_URIToParticipantIDs(v23, v40, v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v104 = 0u;
            v105 = 0u;
            v106 = 0u;
            v107 = 0u;
            v100 = v8;
            v46 = v8;
            v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v104, v48, v114, 16);
            if (v49)
            {
              v52 = v49;
              v53 = *(_QWORD *)v105;
              do
              {
                for (j = 0; j != v52; ++j)
                {
                  if (*(_QWORD *)v105 != v53)
                    objc_enumerationMutation(v46);
                  v55 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j);
                  objc_msgSend_objectForKey_(v43, v50, v55, v51);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v56)
                  {
                    objc_msgSend_objectForKeyedSubscript_(v43, v57, v55, v58);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_addObjectsFromArray_(v44, v60, (uint64_t)v59, v61);

                  }
                  else
                  {
                    objc_msgSend_addObject_(v45, v57, v55, v58);
                  }
                }
                v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v50, (uint64_t)&v104, v51, v114, 16);
              }
              while (v52);
            }

            v65 = objc_msgSend_count(v44, v62, v63, v64);
            objc_msgSend_GFTGL(IDSFoundationLog, v66, v67, v68);
            v69 = objc_claimAutoreleasedReturnValue();
            v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
            if (!v65)
            {
              if (v70)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19B949000, v69, OS_LOG_TYPE_DEFAULT, "manageDesignatedDestinations: couldn't find blocked participantIDs", buf, 2u);
              }

              v72 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v73, v103, v74);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              if (v75)
                CFDictionarySetValue(v72, CFSTR("ids-stun-attribute-session-state-type"), v75);

              objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v76, 6, v77);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              if (v78)
              {
                CFDictionarySetValue(v72, CFSTR("ids-stun-message-type"), v78);
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                sub_19BAF6528();
              }

              WeakRetained = objc_loadWeakRetained((id *)&v101->super._delegate);
              v93 = objc_opt_respondsToSelector();

              if ((v93 & 1) != 0)
              {
                v94 = objc_loadWeakRetained((id *)&v101->super._delegate);
                objc_msgSend_link_didReceiveParticipantUpdate_status_(v94, v95, (uint64_t)v101, v96, v72, 6);

              }
              v13 = v98;
              v9 = v99;
              v34 = v98;
              v8 = v100;
              goto LABEL_55;
            }
            if (v70)
            {
              *(_DWORD *)buf = 138412290;
              v113 = v44;
              _os_log_impl(&dword_19B949000, v69, OS_LOG_TYPE_DEFAULT, "manageDesignatedDestinations: blockedParticipantIDs: %@", buf, 0xCu);
            }

            v71 = v44;
            if (v71)
            {
              v35 = theDict;
              CFDictionarySetValue(theDict, CFSTR("gl-option-participant-update-blocked-participantIDs"), v71);
            }
            else
            {
              v35 = theDict;
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                sub_19BAF6628();
            }

            if (objc_msgSend_count(v45, v79, v80, v81))
            {
              objc_msgSend_GFTGL(IDSFoundationLog, v82, v83, v84);
              v85 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v113 = v45;
                _os_log_impl(&dword_19B949000, v85, OS_LOG_TYPE_DEFAULT, "manageDesignatedDestinations: couldn't find participantIDs for failureBlockedDestinations: %@", buf, 0xCu);
              }

            }
            v9 = v99;
            v8 = v100;
            v13 = v98;
          }
          objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v40, a6, v42);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (v86)
          {
            CFDictionarySetValue(v35, CFSTR("gl-option-participant-update-request-counter"), v86);
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            sub_19BAF65A8();
          }

          if (objc_msgSend_isQUIC(v23, v87, v88, v89))
            objc_msgSend_sendQUICParticipantUpdateRequestWithOptions_(v23, v90, (uint64_t)v35, v91);
          else
            objc_msgSend_sendParticipantUpdateRequest_options_(v23, v90, 0, v91, v35);

          v34 = v13;
          goto LABEL_55;
        }
      }
      else
      {

      }
    }
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v108, v19, v115, 16);
    if (v20)
      continue;
    break;
  }
LABEL_12:

  objc_msgSend_GFTGL(IDSFoundationLog, v31, v32, v33);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "manageDesignatedDestinations: couldn't find a connected candidatePair for sendParticipantUpdateRequest", buf, 2u);
  }
LABEL_55:

}

- (void)removeParticipantIDs:(id)a3 relayGroupID:(id)a4 sessionStateCounter:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const char *v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  NSObject *v34;
  __CFDictionary *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  id v39;
  void *v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  const char *v47;
  double v48;
  uint8_t v49[16];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v5 = *(_QWORD *)&a5;
  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v10, v11, v12);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v50, v15, v54, 16);
  if (v16)
  {
    v20 = v16;
    v21 = *(_QWORD *)v51;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v51 != v21)
          objc_enumerationMutation(v13);
        v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend_groupID(v23, v17, v18, v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v24, v25, (uint64_t)v9, v26))
        {
          v30 = objc_msgSend_state(v23, v27, v28, v29);

          if (v30 == 4)
          {
            v35 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            CFDictionarySetValue(v35, CFSTR("gl-option-participant-update-request-type"), &unk_1E3C869E8);
            objc_msgSend_allObjects(v8, v36, v37, v38);
            v39 = (id)objc_claimAutoreleasedReturnValue();
            v40 = v39;
            if (v39)
            {
              CFDictionarySetValue(v35, CFSTR("gl-option-participant-update-blocked-participantIDs"), v39);
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              sub_19BAF6628();
            }

            objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v41, v5, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              CFDictionarySetValue(v35, CFSTR("gl-option-participant-update-request-counter"), v43);
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              sub_19BAF65A8();
            }

            if (objc_msgSend_isQUIC(v23, v44, v45, v46))
              objc_msgSend_sendQUICParticipantUpdateRequestWithOptions_(v23, v47, (uint64_t)v35, v48);
            else
              objc_msgSend_sendParticipantUpdateRequest_options_(v23, v47, 0, v48, v35);

            v34 = v13;
            goto LABEL_26;
          }
        }
        else
        {

        }
      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v50, v19, v54, 16);
      if (v20)
        continue;
      break;
    }
  }

  objc_msgSend_GFTGL(IDSFoundationLog, v31, v32, v33);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v49 = 0;
    _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "removeParticipantIDs: couldn't find a connected candidatePair for sendParticipantUpdateRequest", v49, 2u);
  }
LABEL_26:

}

- (void)_destroyVirtualRelayLinksForCandidatePair:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  NSMutableArray *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  int v29;
  const char *v30;
  uint64_t v31;
  double v32;
  int v33;
  __CFArray *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  NSMutableArray *v39;
  const char *v40;
  double v41;
  const char *v42;
  uint64_t v43;
  double v44;
  unsigned int v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  double v50;
  __CFDictionary *localRemoteRelayLinkIDToVirtualCandidatePairs;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  uint64_t v59;
  double v60;
  NSObject *v61;
  NSMutableArray *virtualCandidatePairs;
  const char *v63;
  double v64;
  IDSGFTGL *v65;
  CFMutableArrayRef theArray;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  NSMutableArray *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = self;
    v8 = self->_virtualCandidatePairs;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v67, v10, v73, 16);
    if (v11)
    {
      v14 = v11;
      theArray = 0;
      v15 = *(_QWORD *)v68;
      v16 = 138412290;
      while (1)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v68 != v15)
            objc_enumerationMutation(v8);
          v18 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend_sessionID(v18, v12, v13, *(double *)&v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_sessionID(v6, v20, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqualToString_(v19, v24, (uint64_t)v23, v25))
          {
            v29 = objc_msgSend_relayLinkID(v18, v26, v27, v28);
            v33 = objc_msgSend_relayLinkID(v6, v30, v31, v32);

            if (v29 != v33)
              continue;
            v34 = theArray;
            if (!theArray)
              v34 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            theArray = v34;
            if (v18 && v34)
              CFArrayAppendValue(v34, v18);
            objc_msgSend_GFTGL(IDSFoundationLog, v12, v13, *(double *)&v16);
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend_candidatePairToken(v18, v36, v37, v38);
              v39 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v72 = v39;
              _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "[U+1] _destroyVirtualRelayLinksForCandidatePair: remove virtual candidate pair %@.", buf, 0xCu);

            }
            objc_msgSend__notifyCandidatePairDisconnected_withReason_(v65, v40, (uint64_t)v18, v41, 4);
            v45 = objc_msgSend_relayLinkID(v18, v42, v43, v44);
            v49 = (const char *)objc_msgSend_remoteRelayLinkID(v18, v46, v47, v48);
            localRemoteRelayLinkIDForVirtualStunCandidatePair(v45, v49, v50);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              localRemoteRelayLinkIDToVirtualCandidatePairs = (__CFDictionary *)v65->super._localRemoteRelayLinkIDToVirtualCandidatePairs;
              if (localRemoteRelayLinkIDToVirtualCandidatePairs)
                CFDictionaryRemoveValue(localRemoteRelayLinkIDToVirtualCandidatePairs, v19);
            }
          }
          else
          {

          }
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v67, *(double *)&v16, v73, 16);
        if (!v14)
          goto LABEL_27;
      }
    }
    theArray = 0;
LABEL_27:

    if (objc_msgSend_count(theArray, v53, v54, v55))
    {
      objc_msgSend_removeObjectsInArray_(v65->_virtualCandidatePairs, v56, (uint64_t)theArray, v57);
      objc_msgSend_GFTGL(IDSFoundationLog, v58, v59, v60);
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        virtualCandidatePairs = v65->_virtualCandidatePairs;
        *(_DWORD *)buf = 138412290;
        v72 = virtualCandidatePairs;
        _os_log_impl(&dword_19B949000, v61, OS_LOG_TYPE_DEFAULT, "[U+1] _destroyVirtualRelayLinksForCandidatePair: virtual candidate pairs: %@", buf, 0xCu);
      }

      objc_msgSend__sendRelayInterfaceInfo_(v65, v63, 0, v64);
    }
  }
  else
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v4, v5, v7);
    v52 = objc_claimAutoreleasedReturnValue();
    theArray = (CFMutableArrayRef)v52;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v52, OS_LOG_TYPE_DEFAULT, "[U+1] _destroyVirtualRelayLinksForCandidatePair: invalid candidatePair, return", buf, 2u);
    }
  }

}

- (void)updateURIToParticipantIDs:(id)a3 relaySessionID:(id)a4 sessionInfo:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  IDSQuickRelaySessionInfo *v23;
  const char *v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  int isEqualToString;
  NSObject *v33;
  const char *v34;
  double v35;
  const char *v36;
  double v37;
  const char *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  const char *v42;
  double v43;
  __int128 v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v10, v11, v12);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v46, 0.0, v54, 16);
  if (v15)
  {
    v19 = v15;
    v20 = *(_QWORD *)v47;
    *(_QWORD *)&v18 = 138412546;
    v44 = v18;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(v13);
        v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend_sessionID(v22, v16, v17, *(double *)&v18, v44);
        v23 = (IDSQuickRelaySessionInfo *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v23, v24, (uint64_t)v8, v25))
        {
          objc_msgSend_groupID(v22, v26, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v29, v30, (uint64_t)v45, v31);

          if (!isEqualToString)
            continue;
          objc_msgSend_GFTGL(IDSFoundationLog, v16, v17, *(double *)&v18);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v44;
            v51 = v45;
            v52 = 2112;
            v53 = v8;
            _os_log_impl(&dword_19B949000, v33, OS_LOG_TYPE_DEFAULT, "updateURIToParticipantIDs for group %@, session %@.", buf, 0x16u);
          }

          objc_msgSend_updateURIToParticipantIDMapping_(v22, v34, (uint64_t)v9, v35);
          v23 = objc_alloc_init(IDSQuickRelaySessionInfo);
          if (!objc_msgSend_parseSessionInfo_(v23, v36, (uint64_t)v9, v37))
          {
            v41 = objc_msgSend_enableSKE(v22, v38, v39, v40);
            objc_msgSend_setPropertiesWithRelaySessionInfo_sessionInfoDict_enableSKE_(v22, v42, (uint64_t)v23, v43, v9, v41);
          }
        }

      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v46, *(double *)&v18, v54, 16);
    }
    while (v19);
  }

}

- (void)setTimeBase:(id)a3
{
  objc_storeStrong((id *)&self->super._timeBase, a3);
}

- (void)setIsReliableUnicastSession:(BOOL)a3 isClient:(BOOL)a4
{
  self->super._isReliableUnicastSession = a3;
  self->super._isReliableUnicastClient = a4;
}

- (void)setPluginCache:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *pluginNameToPluginOptionsDict;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_GFTGL(IDSFoundationLog, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "setPluginCache: pluginNameToPluginOptionsDict %@", (uint8_t *)&v14, 0xCu);
  }

  v12 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v4, v9, v10, v11);
  pluginNameToPluginOptionsDict = self->super._pluginNameToPluginOptionsDict;
  self->super._pluginNameToPluginOptionsDict = v12;

}

- (void)setParticipantType:(unsigned __int16)a3 relayGroupID:(id)a4 sessionStateCounter:(unsigned int)a5
{
  uint64_t v5;
  int v6;
  _BOOL4 isLightweightParticipant;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  const char *v16;
  double v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v5 = *(_QWORD *)&a5;
  v6 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  isLightweightParticipant = self->super._isLightweightParticipant;
  self->super._isLightweightParticipant = a3 == 0;
  v9 = a4;
  objc_msgSend_GFTGL(IDSFoundationLog, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("YES");
    if (isLightweightParticipant)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    if (!self->super._isLightweightParticipant)
      v14 = CFSTR("NO");
    v18 = 138412546;
    v19 = v15;
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "setParticipantType: lightweight %@ -> lightweight %@", (uint8_t *)&v18, 0x16u);
  }

  if (v6)
    objc_msgSend_manageDesignatedDestinations_relayGroupID_withType_sessionStateCounter_(self, v16, 0, v17, v9, 8, v5);
  else
    objc_msgSend_manageDesignatedDestinations_relayGroupID_withType_sessionStateCounter_(self, v16, 0, v17, v9, 7, v5);

}

- (void)sendKeyMaterialMessageData:(id)a3 relayGroupID:(id)a4 destinationURIs:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t);
  const char *v14;
  uint64_t v15;
  double v16;
  NSObject *v17;
  _BOOL4 isUPlusOneSession;
  const __CFString *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id keyMaterialSentHandler;
  const char *v27;
  uint64_t v28;
  double v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  int v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  id v48;
  const char *v49;
  double v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const char *v60;
  double v61;
  const char *v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  double v68;
  NSObject *v69;
  const char *v70;
  double v71;
  uint64_t v72;
  const char *v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i;
  void *v78;
  void *v79;
  const char *v80;
  double v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  double v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  double v89;
  const char *v90;
  uint64_t v91;
  double v92;
  NSObject *v93;
  const char *v94;
  NSObject *v95;
  uint32_t v96;
  NSObject *v97;
  const char *v98;
  uint64_t v99;
  double v100;
  void *v101;
  const char *v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  void (**v106)(id, uint64_t);
  id v107;
  IDSGFTGL *v108;
  id v109;
  id v110;
  id v111;
  void *v112;
  void *v113;
  id obj;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _QWORD v125[2];
  _QWORD v126[2];
  uint8_t buf[4];
  _BYTE v128[18];
  __int16 v129;
  id v130;
  __int16 v131;
  id v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t))a6;
  objc_msgSend_GFTGL(IDSFoundationLog, v14, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    isUPlusOneSession = self->super._isUPlusOneSession;
    *(_DWORD *)buf = 138413058;
    if (isUPlusOneSession)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    *(_QWORD *)v128 = v19;
    *(_WORD *)&v128[8] = 2112;
    *(_QWORD *)&v128[10] = v11;
    v129 = 2112;
    v130 = v12;
    v131 = 2112;
    v132 = v10;
    _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessageData isUPlusOneSession %@ relayGroupID %@ destinationURIs %@ keyMaterialMessageData %@", buf, 0x2Au);
  }

  if (!self->super._isUPlusOneSession)
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v20, v21, v22);
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v94 = "[U+1] sendKeyMaterialMessageData This is not U+1, returning.";
      v95 = v93;
      v96 = 2;
LABEL_42:
      _os_log_impl(&dword_19B949000, v95, OS_LOG_TYPE_DEFAULT, v94, buf, v96);
    }
LABEL_43:

    v13[2](v13, 2);
    goto LABEL_48;
  }
  if (!v10 || !v11)
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v20, v21, v22);
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v128 = v10;
      *(_WORD *)&v128[8] = 2112;
      *(_QWORD *)&v128[10] = v11;
      v94 = "[U+1] sendKeyMaterialMessageData Invalid params {keyMaterialMessageData: %@, relayGroupID: %@}";
      v95 = v93;
      v96 = 22;
      goto LABEL_42;
    }
    goto LABEL_43;
  }
  v125[0] = CFSTR("p");
  v125[1] = CFSTR("r");
  v126[0] = v10;
  v126[1] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v126, v22, v125, 2);
  v23 = objc_claimAutoreleasedReturnValue();
  JWEncodeDictionary();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_keyMaterialData, v24);
  v25 = _Block_copy(v13);
  keyMaterialSentHandler = self->_keyMaterialSentHandler;
  self->_keyMaterialSentHandler = v25;

  objc_msgSend_GFTGL(IDSFoundationLog, v27, v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v34 = objc_msgSend_length(v24, v31, v32, v33);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v128 = v34;
    *(_WORD *)&v128[4] = 2112;
    *(_QWORD *)&v128[6] = v23;
    _os_log_impl(&dword_19B949000, v30, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessageData keyMaterialData size = %d from %@", buf, 0x12u);
  }
  v112 = v24;
  v113 = (void *)v23;

  objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_relayInterfaceInfoDeliveryStatus_(v38, v39, (uint64_t)self->super._cbuuid, v40);

  if (!v41)
  {
    objc_msgSend_sharedInstance(IDSStunRelayInterfaceInfoController, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRelayInterfaceInfoDeliveryStatus_status_(v45, v46, (uint64_t)self->super._cbuuid, v47, 1);

  }
  v108 = self;
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v42, v43, v44);
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v119, v50, v124, 16);
  if (v51)
  {
    v54 = v51;
    v55 = *(_QWORD *)v120;
    v56 = 138412802;
    v106 = v13;
    v107 = v10;
    v110 = v12;
    v111 = v11;
    v109 = v48;
    v104 = *(_QWORD *)v120;
    do
    {
      v57 = 0;
      v105 = v54;
      do
      {
        if (*(_QWORD *)v120 != v55)
          objc_enumerationMutation(v48);
        v58 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v57);
        if (objc_msgSend_isSharedQRSession(v58, v52, v53, *(double *)&v56))
        {
          objc_msgSend_groupID(v58, v52, v53, *(double *)&v56);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqualToString_(v59, v60, (uint64_t)v11, v61))
          {
            v65 = objc_msgSend_state(v58, v62, v63, v64);

            if (v65 != 4)
              goto LABEL_35;
            objc_msgSend_URIToParticipantIDs(v58, v52, v53, *(double *)&v56);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_GFTGL(IDSFoundationLog, v66, v67, v68);
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v128 = v59;
              _os_log_impl(&dword_19B949000, v69, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessageData URIToParticipantIDs = %@", buf, 0xCu);
            }

            v117 = 0u;
            v118 = 0u;
            v115 = 0u;
            v116 = 0u;
            obj = v12;
            v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v115, v71, v123, 16);
            if (v72)
            {
              v75 = v72;
              v76 = *(_QWORD *)v116;
              while (2)
              {
                for (i = 0; i != v75; ++i)
                {
                  if (*(_QWORD *)v116 != v76)
                    objc_enumerationMutation(obj);
                  v78 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
                  objc_msgSend__stripPotentialTokenURIWithToken_(v78, v73, 0, v74);
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKey_(v59, v80, (uint64_t)v79, v81);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_GFTGL(IDSFoundationLog, v83, v84, v85);
                  v86 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    *(_QWORD *)v128 = v78;
                    *(_WORD *)&v128[8] = 2112;
                    *(_QWORD *)&v128[10] = v79;
                    v129 = 2112;
                    v130 = v82;
                    _os_log_impl(&dword_19B949000, v86, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessageData destinationURI = %@, strippedDestinationURI = %@, participantIDs = %@", buf, 0x20u);
                  }

                  if (objc_msgSend_count(v82, v87, v88, v89))
                  {
                    objc_msgSend_GFTGL(IDSFoundationLog, v90, v91, v92);
                    v97 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend_candidatePairToken(v58, v98, v99, v100);
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)v128 = v101;
                      *(_WORD *)&v128[8] = 2112;
                      *(_QWORD *)&v128[10] = v82;
                      v129 = 2112;
                      v130 = v79;
                      _os_log_impl(&dword_19B949000, v97, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessageData found candidatePair %@ with participantIDs %@ for destinationURI %@", buf, 0x20u);

                    }
                    objc_msgSend__sendRelayInterfaceInfo_(v108, v102, 0, v103);

                    v13 = v106;
                    v10 = v107;
                    v12 = v110;
                    v11 = v111;
                    v48 = v109;
                    goto LABEL_47;
                  }

                }
                v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v73, (uint64_t)&v115, v74, v123, 16);
                if (v75)
                  continue;
                break;
              }
            }

            v12 = v110;
            v11 = v111;
            v48 = v109;
            v55 = v104;
            v54 = v105;
          }

        }
LABEL_35:
        ++v57;
      }
      while (v57 != v54);
      v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v52, (uint64_t)&v119, *(double *)&v56, v124, 16);
      v13 = v106;
      v10 = v107;
    }
    while (v54);
  }
LABEL_47:

LABEL_48:
}

- (void)_discardKeyMaterialMessage:(int64_t)a3
{
  NSData *keyMaterialData;
  void (**keyMaterialSentHandler)(id, int64_t);
  id v7;

  keyMaterialData = self->_keyMaterialData;
  self->_keyMaterialData = 0;

  self->_keyMaterialDataCounter = -1;
  keyMaterialSentHandler = (void (**)(id, int64_t))self->_keyMaterialSentHandler;
  if (keyMaterialSentHandler)
  {
    keyMaterialSentHandler[2](keyMaterialSentHandler, a3);
    v7 = self->_keyMaterialSentHandler;
    self->_keyMaterialSentHandler = 0;

  }
}

- (void)reportLinkMetricsForLinkID:(unsigned __int8)a3 lastPacketReceivedTime:(double)a4 lastPacketSentTime:(double)a5
{
  NSMutableDictionary *linkIDToCandidatePairs;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double lastP2PPacketReceivedTime;
  NSObject *v18;

  linkIDToCandidatePairs = self->super._linkIDToCandidatePairs;
  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], a2, a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(linkIDToCandidatePairs, v9, (uint64_t)v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend_isP2P(v11, v12, v13, v14))
    {
      lastP2PPacketReceivedTime = self->_lastP2PPacketReceivedTime;
      if (lastP2PPacketReceivedTime < a4)
        lastP2PPacketReceivedTime = a4;
      self->_lastP2PPacketReceivedTime = lastP2PPacketReceivedTime;
      objc_msgSend__checkIfQRLinkIsDownButP2PLinkIsUp(self, v15, v16, lastP2PPacketReceivedTime);
    }
  }
  else
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v12, v13, v14);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_19BAF6728();

  }
}

- (void)didReceiveProtobufPacketForLinkID:(unsigned __int8)a3
{
  double v3;
  NSMutableDictionary *linkIDToCandidatePairs;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double lastQRPacketReceivedTime;
  const char *v17;
  uint64_t v18;
  double v19;
  NSObject *v20;

  linkIDToCandidatePairs = self->super._linkIDToCandidatePairs;
  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(linkIDToCandidatePairs, v7, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v10, v11, v12);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_19BAF6788();
    goto LABEL_10;
  }
  if ((objc_msgSend_isQUIC(v9, v10, v11, v12) & 1) == 0)
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v13, v14, v15);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_19BAF67E8();
LABEL_10:

    goto LABEL_11;
  }
  lastQRPacketReceivedTime = self->_lastQRPacketReceivedTime;
  v19 = ids_monotonic_time();
  if (lastQRPacketReceivedTime >= v19)
    v19 = lastQRPacketReceivedTime;
  self->_lastQRPacketReceivedTime = v19;
  objc_msgSend__checkIfQRLinkIsDownButP2PLinkIsUp(self, v17, v18, v19);
LABEL_11:

}

- (void)_checkIfQRLinkIsDownButP2PLinkIsUp
{
  double v3;
  double lastP2PPacketReceivedTime;
  double lastQRPacketReceivedTime;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  char v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = ids_monotonic_time();
  lastP2PPacketReceivedTime = self->_lastP2PPacketReceivedTime;
  lastQRPacketReceivedTime = self->_lastQRPacketReceivedTime;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v6, v7, 0.0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v29, v10, v39, 16);
  if (!v11)
  {
LABEL_16:

    return;
  }
  v15 = v11;
  v16 = 0;
  v17 = v3 - lastP2PPacketReceivedTime;
  v18 = v3 - lastQRPacketReceivedTime;
  v19 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v30 != v19)
        objc_enumerationMutation(v8);
      v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      if (objc_msgSend_isQUIC(v21, v12, v13, v14))
        v16 |= objc_msgSend_state(v21, v12, v13, v14) == 4;
    }
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v29, v14, v39, 16);
  }
  while (v15);

  if ((v16 & 1) != 0 && v17 < 5.0 && v18 >= 25.0)
  {
    objc_msgSend_GFTGL(IDSFoundationLog, v22, v23, 25.0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v34 = CFSTR("YES");
      v35 = 2048;
      v36 = v17;
      v37 = 2048;
      v38 = v18;
      _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, "_checkIfQRLinkIsDownButP2PLinkIsUp: has active QUIC: %@, last P2P: %f, last QR: %f", buf, 0x20u);
    }

    objc_msgSend_error_(self->super._metricsCollector, v25, (uint64_t)CFSTR("gl"), v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_event_(v8, v27, (uint64_t)CFSTR("p2p-but-no-qr"), v28);
    goto LABEL_16;
  }
}

- (BOOL)_postProcessQUICAllocbindResponse:(id)a3 candidatePair:(id)a4
{
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  double v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  double v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  double v58;
  unint64_t v59;
  const char *v60;
  uint64_t v61;
  double v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  NSObject *v68;
  const char *v69;
  double v70;
  void *v71;
  const char *v72;
  double v73;
  const char *v74;
  double v75;
  const char *v76;
  uint64_t v77;
  double v78;
  IDSGFTGL *v79;
  NSArray *v80;
  const char *v81;
  double v82;
  const char *v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  uint64_t i;
  void *v88;
  const char *v89;
  uint64_t v90;
  double v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  double v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  double v99;
  __CFString *v100;
  __CFString *v101;
  NSObject *v102;
  id WeakRetained;
  char v104;
  id v105;
  const char *v106;
  double v107;
  unsigned int v108;
  const char *v109;
  uint64_t v110;
  double v111;
  void *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  double v116;
  float v117;
  void *v118;
  NSObject *v119;
  id v120;
  char v121;
  id v122;
  const char *v123;
  double v124;
  const char *v125;
  uint64_t v126;
  double v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  double v131;
  void *v132;
  const char *v133;
  double v134;
  const char *v135;
  uint64_t v136;
  double v137;
  void *v138;
  const char *v139;
  double v140;
  const char *v141;
  uint64_t v142;
  double v143;
  void *v144;
  __CFString *v145;
  const char *v146;
  double v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  double v151;
  uint64_t v152;
  uint64_t j;
  void *v154;
  void *v155;
  const char *v156;
  double v157;
  const char *v158;
  uint64_t v159;
  double v160;
  void *v161;
  const char *v162;
  double v163;
  const char *v164;
  uint64_t v165;
  double v166;
  const char *v167;
  uint64_t v168;
  double v169;
  int isSharedQRSession;
  const char *v171;
  double v172;
  const char *v173;
  uint64_t v174;
  double v175;
  const char *v176;
  uint64_t v177;
  double v178;
  uint64_t v179;
  id v180;
  char v181;
  id v182;
  const char *v183;
  double v184;
  NSObject *v186;
  const char *v187;
  double v188;
  __CFString *v189;
  void *v190;
  void *value;
  void *v192;
  void *v193;
  __CFDictionary *v194;
  const __CFDictionary *theDict;
  __CFString *v196;
  void *v197;
  id v198;
  id v199;
  _QWORD v201[5];
  id v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  _BYTE v211[128];
  uint8_t v212[128];
  uint8_t buf[4];
  __CFString *v214;
  __int16 v215;
  uint64_t v216;
  __int16 v217;
  id v218;
  uint64_t v219;

  v219 = *MEMORY[0x1E0C80C00];
  v198 = a3;
  v199 = a4;
  objc_msgSend_candidatePairToken(v199, v5, v6, v7);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_channelSettings(v198, v8, v9, v10);
  if ((_DWORD)v11)
    objc_msgSend_setChannelSettings_(v199, v12, v11, v14);
  objc_msgSend_allValues(self->super._tokenToCandidatePairs, v12, v13, v14);
  v196 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GFTGL(IDSFoundationLog, v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v214 = v196;
    _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "current candidate pairs: %@", buf, 0xCu);
  }

  GLUtilGetDifferentRelayCandidatePairSucceeded(v199, v196);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_local(v197, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_transport(v22, v23, v24, v25);

  objc_msgSend_local(v199, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_transport(v30, v31, v32, v33);

  if (v197)
  {
    if (v26 <= v34 && (objc_msgSend_isRealloc(v199, v35, v36, v37) & 1) == 0)
    {
      objc_msgSend_GFTGL(IDSFoundationLog, v35, v36, v37);
      v186 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v214 = (__CFString *)v26;
        v215 = 2048;
        v216 = v34;
        v217 = 2112;
        v218 = v199;
        _os_log_impl(&dword_19B949000, v186, OS_LOG_TYPE_DEFAULT, "succeededTransport %ld currentTransport %ld discard current pair: %@", buf, 0x20u);
      }

      objc_msgSend__sendUnallocbindRequest_stunMessage_reason_(self, v187, (uint64_t)v190, v188, 0, 8);
      goto LABEL_79;
    }
    objc_msgSend_GFTGL(IDSFoundationLog, v35, v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v214 = (__CFString *)v26;
      v215 = 2048;
      v216 = v34;
      v217 = 2112;
      v218 = v197;
      _os_log_impl(&dword_19B949000, v38, OS_LOG_TYPE_DEFAULT, "succeededTransport %ld currentTransport %ld discard existing pair: %@.", buf, 0x20u);
    }

    objc_msgSend_candidatePairToken(v197, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__sendUnallocbindRequest_stunMessage_reason_(self, v43, (uint64_t)v42, v44, 0, 8);

  }
  objc_msgSend_hbhEncKey(v199, v35, v36, v37);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v47
    || (objc_msgSend_hbhDecKey(v199, v45, v46, v48),
        v49 = (void *)objc_claimAutoreleasedReturnValue(),
        v50 = v49 == 0,
        v49,
        v47,
        v50))
  {
    objc_msgSend_relaySessionKey(v199, v45, v46, v48);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sessionID(v199, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend_participantID(v199, v56, v57, v58);
    objc_msgSend_hbhSalt(v199, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    IDSLinkHBHDeriveHKDFSha256Keys(v51, v55, v59, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      objc_msgSend_subdataWithRange_(v64, v65, 0, v67, 32);
      v68 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_subdataWithRange_(v64, v69, 32, v70, 32);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setHbhEncKey_(v199, v72, (uint64_t)v68, v73);
      objc_msgSend_setHbhDecKey_(v199, v74, (uint64_t)v71, v75);

    }
    else
    {
      objc_msgSend_GFTGL(IDSFoundationLog, v65, v66, v67);
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        sub_19BAF6848();
    }

  }
  objc_msgSend__notifyQRSessionConnected_(self, v45, (uint64_t)v199, v48);
  v79 = self;
  if (self->super._isUPlusOneSession)
  {
    objc_msgSend__sendRelayInterfaceInfo_(self, v76, (uint64_t)v190, v78);
    v209 = 0u;
    v210 = 0u;
    v207 = 0u;
    v208 = 0u;
    v80 = self->_remoteCandidatePairs;
    v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v81, (uint64_t)&v207, v82, v212, 16);
    if (v84)
    {
      v86 = *(_QWORD *)v208;
      do
      {
        for (i = 0; i != v84; ++i)
        {
          if (*(_QWORD *)v208 != v86)
            objc_enumerationMutation(v80);
          objc_msgSend__setupVirtualCandidatePairs_remoteCandidatePair_(self, v83, (uint64_t)v199, v85, *(_QWORD *)(*((_QWORD *)&v207 + 1) + 8 * i));
        }
        v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v83, (uint64_t)&v207, v85, v212, 16);
      }
      while (v84);
    }

    v79 = self;
  }
  objc_msgSend_allValues(v79->super._tokenToCandidatePairs, v76, v77, v78);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  GLUtilGetRelayCandidatePairNotSucceededForOppositeIPVersion(v199, v88);
  v192 = (void *)objc_claimAutoreleasedReturnValue();

  if (v192)
  {
    GLUCreateIPVersionFailureEvent(v192);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_local(v192, v93, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(objc_msgSend_address(v96, v97, v98, v99) + 1) == 2)
      v100 = CFSTR("IPv4");
    else
      v100 = CFSTR("IPv6");
    v101 = v100;

    OSLogHandleForTransportCategory();
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v214 = v101;
      _os_log_impl(&dword_19B949000, v102, OS_LOG_TYPE_DEFAULT, "RTC reports: add %@ setup failure", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v189 = v101;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("RTC reports: add %@ setup failure"));
        if (_IDSShouldLog())
        {
          v189 = v101;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("RTC reports: add %@ setup failure"));
        }
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    v104 = objc_opt_respondsToSelector();

    if ((v104 & 1) != 0)
    {
      v105 = objc_loadWeakRetained((id *)&self->super._delegate);
      objc_msgSend_link_didAddQREvent_(v105, v106, (uint64_t)self, v107, v92);

    }
  }
  v108 = objc_msgSend_linkID(v199, v89, v90, v91, v189);
  ProtoUtilProcessStreamInfo(v198, v108, v108);
  theDict = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v112 = 0;
  if (theDict)
  {
    v109 = CFSTR("stream-info-peer-published-streams");
    if (CFSTR("stream-info-peer-published-streams"))
      v112 = (void *)CFDictionaryGetValue(theDict, CFSTR("stream-info-peer-published-streams"));
  }
  v113 = objc_msgSend_participantID(v199, v109, v110, v111);
  StunUtilProcessParticipants(v112, v113, self->super._isLightweightParticipant);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  ProtoUtilProcessLightweightParticipants(v198);
  value = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_count(v193, v114, v115, v116) >= 2)
  {
    self->super._isSecondOrLaterParticipant = 1;
    if (!self->super._receivedAllocbindResponse)
    {
      v117 = ids_monotonic_time();
      GLUCreateQRClientTimeEvent(311, 0, v199, 0, v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      OSLogHandleForTransportCategory();
      v119 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v119, OS_LOG_TYPE_DEFAULT, "RTC reports: add first allocbind response", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("RTC reports: add first allocbind response"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("RTC reports: add first allocbind response"));
        }
      }
      v120 = objc_loadWeakRetained((id *)&self->super._delegate);
      v121 = objc_opt_respondsToSelector();

      if ((v121 & 1) != 0)
      {
        v122 = objc_loadWeakRetained((id *)&self->super._delegate);
        objc_msgSend_link_didAddQREvent_(v122, v123, (uint64_t)self, v124, v118);

      }
      self->super._receivedAllocbindResponse = 1;

    }
  }
  v194 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (theDict)
    CFDictionarySetValue(v194, CFSTR("gl-option-sessioninfo-response-streaminfo-key"), theDict);
  if (v193)
    CFDictionarySetValue(v194, CFSTR("gl-option-sessioninfo-response-participants-key"), v193);
  if (value)
    CFDictionarySetValue(v194, CFSTR("gl-option-sessioninfo-response-lightweight-participants-key"), value);
  objc_msgSend_groupID(v199, v125, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sessionID(v199, v129, v130, v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__notifySessionInfoReceived_relayGroupID_relaySessionID_status_(self, v133, (uint64_t)v194, v134, v128, v132, 0);

  objc_msgSend_sessionID(v199, v135, v136, v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_initParticipantIDMap_(v199, v139, 0, v140);
  objc_msgSend_groupID(v199, v141, v142, v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = 0u;
  v206 = 0u;
  v203 = 0u;
  v204 = 0u;
  v145 = v196;
  v150 = objc_msgSend_countByEnumeratingWithState_objects_count_(v145, v146, (uint64_t)&v203, v147, v211, 16);
  if (v150)
  {
    v152 = *(_QWORD *)v204;
    do
    {
      for (j = 0; j != v150; ++j)
      {
        if (*(_QWORD *)v204 != v152)
          objc_enumerationMutation(v145);
        v154 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * j);
        objc_msgSend_sessionID(v154, v148, v149, v151);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v155, v156, (uint64_t)v138, v157))
        {
          objc_msgSend_groupID(v154, v158, v159, v160);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqualToString_(v161, v162, (uint64_t)v144, v163)
            && objc_msgSend_state(v154, v164, v165, v166) == 4)
          {
            isSharedQRSession = objc_msgSend_isSharedQRSession(v154, v167, v168, v169);

            if (!isSharedQRSession)
              continue;
            objc_msgSend_allKeys(self->super._pluginParticipantIDs, v148, v149, v151);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_updateParticipantIDMap_(v154, v171, (uint64_t)v155, v172);
          }
          else
          {

          }
        }

      }
      v150 = objc_msgSend_countByEnumeratingWithState_objects_count_(v145, v148, (uint64_t)&v203, v151, v211, 16);
    }
    while (v150);
  }

  if (objc_msgSend_hasSessionStateCounter(v198, v173, v174, v175))
  {
    v179 = objc_msgSend_sessionStateCounter(v198, v176, v177, v178);
    if ((_DWORD)v179)
    {
      v180 = objc_loadWeakRetained((id *)&self->super._delegate);
      v181 = objc_opt_respondsToSelector();

      if ((v181 & 1) != 0)
      {
        v182 = objc_loadWeakRetained((id *)&self->super._delegate);
        objc_msgSend_link_didReceiveSessionStateCounter_(v182, v183, (uint64_t)self, v184, v179);

      }
    }
  }
  v201[0] = MEMORY[0x1E0C809B0];
  v201[1] = 3221225472;
  v201[2] = sub_19BA39EF0;
  v201[3] = &unk_1E3C1FA08;
  v201[4] = self;
  v202 = v199;
  IDSTransportThreadAddBlockAfter(v201, 1.0);

LABEL_79:
  return 1;
}

- (BOOL)_IsExtIPDiscoveryNeeded:(sockaddr *)a3 candidatePairList:(id)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  BOOL v11;
  objc_super v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->super._sharedSessionHasJoined && self->super._isUPlusOneSession && !self->super._ipDiscoveryDisabled)
  {
    v13.receiver = self;
    v13.super_class = (Class)IDSGFTGL;
    v11 = -[IDSGlobalLink _IsExtIPDiscoveryNeeded:candidatePairList:](&v13, sel__IsExtIPDiscoveryNeeded_candidatePairList_, a3, v6);
  }
  else
  {
    OSLogHandleForTransportCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("YES");
      if (self->super._sharedSessionHasJoined)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      if (self->super._isUPlusOneSession)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      if (!self->super._ipDiscoveryDisabled)
        v8 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "external IP discovery is not needed: _sharedSessionHasJoined: %@, _isUPlusOneSession: %@, _ipDiscoveryDisabled: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("external IP discovery is not needed: _sharedSessionHasJoined: %@, _isUPlusOneSession: %@, _ipDiscoveryDisabled: %@"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("external IP discovery is not needed: _sharedSessionHasJoined: %@, _isUPlusOneSession: %@, _ipDiscoveryDisabled: %@"));
      }
    }
    v11 = 0;
  }

  return v11;
}

- (void)setSharedSessionHasJoined:(BOOL)a3
{
  self->super._sharedSessionHasJoined = a3;
}

- (void)setCellInterfaceName:(id)a3
{
  ((void (*)(IDSNWLink *, char *, id))MEMORY[0x1E0DE7D20])(self->super._nwLink, sel_setCellInterfaceName_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reliableUnicastServerMaterialToProtoMessageTransactionID, 0);
  objc_storeStrong(&self->_keyMaterialSentHandler, 0);
  objc_storeStrong((id *)&self->_keyMaterialData, 0);
  objc_storeStrong((id *)&self->_virtualCandidatePairs, 0);
  objc_storeStrong((id *)&self->_remoteCandidatePairs, 0);
}

@end
