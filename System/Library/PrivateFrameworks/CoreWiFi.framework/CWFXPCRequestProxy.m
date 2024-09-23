@implementation CWFXPCRequestProxy

- (void)__setLinkQualityMetric:(id)a3 interfaceName:(id)a4
{
  id v6;
  id v7;
  NSObject *mutexQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CWFXPCRequestProxy *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0622E20;
  block[3] = &unk_1E6133340;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(mutexQueue, block);

}

- (void)XPCManager:(id)a3 invalidatedXPCConnection:(id)a4
{
  id v5;
  NSObject *mutexQueue;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  CWFXPCRequestProxy *v21;

  v5 = a4;
  mutexQueue = self->_mutexQueue;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = sub_1B06275AC;
  v19 = &unk_1E61333E0;
  v7 = v5;
  v20 = v7;
  v21 = self;
  dispatch_async(mutexQueue, &v16);
  objc_msgSend_delegate(self, v8, v9, v10, v11, v16, v17, v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  if (v12)
    objc_msgSend_XPCRequestProxy_invalidatedXPCConnection_(v12, v13, (uint64_t)self, (uint64_t)v7, v14);

}

- (void)__updateEventMonitoring:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  NSObject *mutexQueue;
  id v8;
  _QWORD block[5];
  id v10;

  objc_msgSend_registeredEventIDs(a3, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0626F64;
  block[3] = &unk_1E61333E0;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(mutexQueue, block);

}

- (id)__apple80211WithInterfaceName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSMutableDictionary *apple80211Map;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;

  v7 = a3;
  apple80211Map = self->_apple80211Map;
  if (v7)
    objc_msgSend_objectForKeyedSubscript_(apple80211Map, v4, (uint64_t)v7, v5, v6);
  else
    objc_msgSend_objectForKeyedSubscript_(apple80211Map, v4, (uint64_t)&stru_1E613B710, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CWFGetOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      _os_log_send_and_compose_impl();

  }
  return v9;
}

- (void)XPCManager:(id)a3 XPCConnection:(id)a4 updatedRegisteredEventIDs:(id)a5
{
  id v6;
  NSObject *eventQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  eventQueue = self->_eventQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B0628754;
  v9[3] = &unk_1E61333E0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(eventQueue, v9);

}

- (void)__updateEventRegistration:(id)a3 XPCManager:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  id v47;

  v47 = a3;
  v9 = a4;
  v10 = v47;
  if (!v47)
  {
    v28 = 0;
    goto LABEL_13;
  }
  objc_msgSend_info(v47, v5, v6, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)CFSTR("EventID"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (objc_msgSend_type(v15, v16, v17, v18, v19) == 12)
    {
      objc_msgSend_supportedRequestTypes(v9, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v25, (uint64_t)&unk_1E61609F8, v26, v27);
LABEL_8:
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isSubsetOfSet_(v36, v37, (uint64_t)v24, v38, v39) & 1) != 0)
      {
        v28 = 0;
      }
      else
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v40, *MEMORY[0x1E0CB2FE0], 45, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_12;
    }
    if (objc_msgSend_type(v15, v20, v21, v22, v23) == 13)
    {
      objc_msgSend_supportedRequestTypes(v9, v29, v30, v31, v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v33, (uint64_t)&unk_1E6160A10, v34, v35);
      goto LABEL_8;
    }
    v28 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v16, *MEMORY[0x1E0CB2FE0], 22, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  v10 = v47;
LABEL_13:
  objc_msgSend_response(v10, v5, v6, v7, v8);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend_response(v47, v42, v43, v44, v45);
    v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v46)[2](v46, v28, 0);

  }
}

- (void)__getApple80211:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (**v48)(_QWORD, _QWORD, _QWORD);
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (**v59)(_QWORD, _QWORD, _QWORD);
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;

  v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = objc_msgSend_type(v4, v18, v19, v20, v21);
    switch(v23)
    {
      case 1:
        objc_msgSend_interfaceNames(self, v24, v25, v26, v27);
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 2:
        objc_msgSend_virtualInterfaceNames(self, v24, v25, v26, v27);
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v33 = (void *)v28;
        goto LABEL_88;
      case 3:
      case 6:
      case 8:
      case 10:
      case 12:
      case 13:
      case 14:
      case 17:
      case 23:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
LABEL_8:
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v24, *MEMORY[0x1E0CB2FE0], 45, 0);
        goto LABEL_9;
      case 4:
        v138 = 0;
        objc_msgSend_capabilities_(v22, v24, (uint64_t)&v138, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v138;
        goto LABEL_84;
      case 5:
        v137 = 0;
        objc_msgSend_powerOn_(v22, v24, (uint64_t)&v137, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v137;
        goto LABEL_84;
      case 7:
        v136 = 0;
        objc_msgSend_SSID_(v22, v24, (uint64_t)&v136, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v136;
        goto LABEL_84;
      case 9:
        v135 = 0;
        objc_msgSend_BSSID_(v22, v24, (uint64_t)&v135, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v135;
        goto LABEL_84;
      case 11:
        v134 = 0;
        objc_msgSend_authType_(v22, v24, (uint64_t)&v134, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v134;
        goto LABEL_84;
      case 15:
        objc_msgSend_info(v4, v24, v25, v26, v27);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v36, v37, (uint64_t)CFSTR("CountryCode"), v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = 0;
        objc_msgSend_supportedChannelsWithCountryCode_error_(v22, v41, (uint64_t)v40, (uint64_t)&v130, v42);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v130;

        break;
      case 16:
        v132 = 0;
        objc_msgSend_channel_(v22, v24, (uint64_t)&v132, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v132;
        goto LABEL_84;
      case 18:
        v128 = 0;
        objc_msgSend_perAntennaRSSI_(v22, v24, (uint64_t)&v128, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v128;
        goto LABEL_84;
      case 19:
        v127 = 0;
        objc_msgSend_noise_(v22, v24, (uint64_t)&v127, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v127;
        goto LABEL_84;
      case 20:
        v123 = 0;
        objc_msgSend_txRate_(v22, v24, (uint64_t)&v123, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v123;
        goto LABEL_84;
      case 21:
        v122 = 0;
        objc_msgSend_txPower_(v22, v24, (uint64_t)&v122, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v122;
        goto LABEL_84;
      case 22:
        v133 = 0;
        objc_msgSend_countryCode_(v22, v24, (uint64_t)&v133, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v133;
        goto LABEL_84;
      case 24:
        v121 = 0;
        objc_msgSend_DTIMInterval_(v22, v24, (uint64_t)&v121, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v121;
        goto LABEL_84;
      case 25:
        v120 = 0;
        objc_msgSend_guardInterval_(v22, v24, (uint64_t)&v120, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v120;
        goto LABEL_84;
      case 26:
        v119 = 0;
        objc_msgSend_MCSIndex_(v22, v24, (uint64_t)&v119, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v119;
        goto LABEL_84;
      case 27:
        v118 = 0;
        objc_msgSend_numberOfSpatialStreams_(v22, v24, (uint64_t)&v118, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v118;
        goto LABEL_84;
      case 28:
        v125 = 0;
        objc_msgSend_supportedPHYModes_(v22, v24, (uint64_t)&v125, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v125;
        goto LABEL_84;
      case 29:
        v126 = 0;
        objc_msgSend_activePHYMode_(v22, v24, (uint64_t)&v126, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v126;
        goto LABEL_84;
      case 30:
        v124 = 0;
        objc_msgSend_opMode_(v22, v24, (uint64_t)&v124, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v124;
        goto LABEL_84;
      case 31:
        v117 = 0;
        objc_msgSend_virtualInterfaceRole_(v22, v24, (uint64_t)&v117, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v117;
        goto LABEL_84;
      case 32:
        v116 = 0;
        objc_msgSend_virtualInterfaceParent_(v22, v24, (uint64_t)&v116, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v116;
        goto LABEL_84;
      case 38:
        v131 = 0;
        objc_msgSend_wowEnabled_(v22, v24, (uint64_t)&v131, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v131;
        goto LABEL_84;
      case 39:
        v115 = 0;
        objc_msgSend_AWDLSyncEnabled_(v22, v24, (uint64_t)&v115, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v115;
        goto LABEL_84;
      case 40:
        v101 = 0;
        objc_msgSend_AWDLPreferredChannels_(v22, v24, (uint64_t)&v101, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v101;
        goto LABEL_84;
      case 41:
        v113 = 0;
        objc_msgSend_AWDLSyncState_(v22, v24, (uint64_t)&v113, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v113;
        goto LABEL_84;
      case 42:
        v114 = 0;
        objc_msgSend_AWDLSyncChannelSequence_(v22, v24, (uint64_t)&v114, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v114;
        goto LABEL_84;
      case 43:
        v112 = 0;
        objc_msgSend_AWDLSyncParameters_(v22, v24, (uint64_t)&v112, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v112;
        goto LABEL_84;
      case 44:
        v105 = 0;
        objc_msgSend_AWDLStrategy_(v22, v24, (uint64_t)&v105, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v105;
        goto LABEL_84;
      case 45:
        v110 = 0;
        objc_msgSend_AWDLElectionParameters_(v22, v24, (uint64_t)&v110, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v110;
        goto LABEL_84;
      case 46:
        v111 = 0;
        objc_msgSend_AWDLElectionID_(v22, v24, (uint64_t)&v111, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v111;
        goto LABEL_84;
      case 47:
        v109 = 0;
        objc_msgSend_AWDLElectionRSSIThresholds_(v22, v24, (uint64_t)&v109, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v109;
        goto LABEL_84;
      case 48:
        v107 = 0;
        objc_msgSend_AWDLPeerDatabase_(v22, v24, (uint64_t)&v107, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v107;
        goto LABEL_84;
      case 49:
        v108 = 0;
        objc_msgSend_AWDLSocialTimeSlots_(v22, v24, (uint64_t)&v108, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v108;
        goto LABEL_84;
      case 50:
        v103 = 0;
        objc_msgSend_AWDLMasterChannel_(v22, v24, (uint64_t)&v103, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v103;
        goto LABEL_84;
      case 51:
        v102 = 0;
        objc_msgSend_AWDLSecondaryMasterChannel_(v22, v24, (uint64_t)&v102, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v102;
        goto LABEL_84;
      case 52:
        v104 = 0;
        objc_msgSend_AWDLOpMode_(v22, v24, (uint64_t)&v104, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v104;
        goto LABEL_84;
      case 53:
        v106 = 0;
        objc_msgSend_AWDLStatistics_(v22, v24, (uint64_t)&v106, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v106;
        goto LABEL_84;
      default:
        switch(v23)
        {
          case 146:
            v100 = 0;
            objc_msgSend_AWDLSidecarDiagnostics_(v22, v24, (uint64_t)&v100, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v100;
            break;
          case 147:
            v99 = 0;
            objc_msgSend_powerState_(v22, v24, (uint64_t)&v99, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v99;
            break;
          case 148:
            v98 = 0;
            objc_msgSend_chainAck_(v22, v24, (uint64_t)&v98, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v98;
            break;
          case 149:
            v97 = 0;
            objc_msgSend_txChainPower_(v22, v24, (uint64_t)&v97, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v97;
            break;
          case 150:
            v96 = 0;
            objc_msgSend_desense_(v22, v24, (uint64_t)&v96, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v96;
            break;
          case 151:
            v95 = 0;
            objc_msgSend_desenseLevel_(v22, v24, (uint64_t)&v95, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v95;
            break;
          case 152:
            v94 = 0;
            objc_msgSend_bluetoothCoexistenceConfig_(v22, v24, (uint64_t)&v94, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v94;
            break;
          case 153:
            v93 = 0;
            objc_msgSend_bluetoothCoexistenceProfiles2GHz_(v22, v24, (uint64_t)&v93, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v93;
            break;
          case 154:
            v92 = 0;
            objc_msgSend_bluetoothCoexistenceProfiles5GHz_(v22, v24, (uint64_t)&v92, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v92;
            break;
          case 155:
            v91 = 0;
            objc_msgSend_bluetoothCoexistenceMode_(v22, v24, (uint64_t)&v91, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v91;
            break;
          case 156:
            v90 = 0;
            objc_msgSend_leakyAPStats_(v22, v24, (uint64_t)&v90, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v90;
            break;
          case 157:
            v88 = 0;
            objc_msgSend_AWDLExtensionStateMachineParameters_(v22, v24, (uint64_t)&v88, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v88;
            break;
          case 158:
            v87 = 0;
            objc_msgSend_AWDLElectionMetric_(v22, v24, (uint64_t)&v87, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v87;
            break;
          case 159:
            v86 = 0;
            objc_msgSend_AWDLPresenceMode_(v22, v24, (uint64_t)&v86, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v86;
            break;
          case 160:
            v85 = 0;
            objc_msgSend_AWDLGuardTime_(v22, v24, (uint64_t)&v85, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v85;
            break;
          case 161:
            v84 = 0;
            objc_msgSend_AWDLAvailabilityWindowAPAlignment_(v22, v24, (uint64_t)&v84, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v84;
            break;
          case 162:
            v83 = 0;
            objc_msgSend_AWDLContinuousElectionAlgorithmEnabled_(v22, v24, (uint64_t)&v83, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v83;
            break;
          case 163:
            v82 = 0;
            objc_msgSend_AWDLAFTxMode_(v22, v24, (uint64_t)&v82, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v82;
            break;
          case 164:
            v81 = 0;
            objc_msgSend_AWDLPeerTrafficRegistration_(v22, v24, (uint64_t)&v81, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v81;
            break;
          case 165:
            v80 = 0;
            objc_msgSend_AWDLEncryptionType_(v22, v24, (uint64_t)&v80, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v80;
            break;
          case 166:
            v79 = 0;
            objc_msgSend_AWDLBTLEStateParameters_(v22, v24, (uint64_t)&v79, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v79;
            break;
          case 167:
          case 168:
          case 169:
          case 170:
          case 171:
          case 172:
          case 173:
          case 174:
          case 177:
          case 179:
          case 180:
          case 181:
          case 182:
          case 183:
          case 184:
          case 185:
          case 186:
          case 188:
          case 189:
          case 190:
          case 191:
          case 192:
          case 193:
          case 194:
          case 195:
          case 196:
          case 198:
          case 199:
          case 200:
          case 201:
          case 202:
          case 203:
          case 204:
          case 205:
          case 206:
          case 207:
          case 208:
          case 209:
          case 218:
          case 219:
          case 220:
          case 221:
          case 222:
          case 223:
          case 224:
          case 225:
          case 226:
          case 227:
          case 228:
          case 229:
          case 230:
          case 231:
          case 232:
            goto LABEL_8;
          case 175:
            v89 = 0;
            objc_msgSend_LQMSummary_(v22, v24, (uint64_t)&v89, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v89;
            break;
          case 176:
            v78 = 0;
            objc_msgSend_powerDebugInfo_(v22, v24, (uint64_t)&v78, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v78;
            break;
          case 178:
            v77 = 0;
            objc_msgSend_cca_(v22, v24, (uint64_t)&v77, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v77;
            break;
          case 187:
            v76 = 0;
            objc_msgSend_rxRate_(v22, v24, (uint64_t)&v76, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v76;
            break;
          case 197:
            v70 = 0;
            objc_msgSend_countryBandSupport_(v22, v24, (uint64_t)&v70, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v70;
            break;
          case 210:
            v129 = 0;
            objc_msgSend_hardwareSupportedChannels_(v22, v24, (uint64_t)&v129, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v129;
            break;
          case 211:
            v75 = 0;
            objc_msgSend_maxLinkSpeed_(v22, v24, (uint64_t)&v75, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v75;
            break;
          case 212:
            v74 = 0;
            objc_msgSend_state_(v22, v24, (uint64_t)&v74, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v74;
            break;
          case 213:
            v72 = 0;
            objc_msgSend_powersave_(v22, v24, (uint64_t)&v72, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v72;
            break;
          case 214:
            v73 = 0;
            objc_msgSend_maxNSSForAP_(v22, v24, (uint64_t)&v73, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v73;
            break;
          case 215:
            v71 = 0;
            objc_msgSend_txNSS_(v22, v24, (uint64_t)&v71, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v71;
            break;
          case 216:
            v69 = 0;
            objc_msgSend_beaconCache_(v22, v24, (uint64_t)&v69, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v69;
            break;
          case 217:
            v68 = 0;
            objc_msgSend_blockedBands_(v22, v24, (uint64_t)&v68, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v68;
            break;
          case 233:
            v67 = 0;
            objc_msgSend_hostAPStationList_(v22, v24, (uint64_t)&v67, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v67;
            break;
          case 234:
            v66 = 0;
            objc_msgSend_LQMConfig_(v22, v24, (uint64_t)&v66, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v66;
            break;
          default:
            if (v23 != 241)
              goto LABEL_8;
            v65 = 0;
            objc_msgSend_backgroundScanCache_(v22, v24, (uint64_t)&v65, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v65;
            break;
        }
LABEL_84:
        v35 = v34;
        break;
    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 6, 0);
LABEL_9:
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v33 = 0;
  }
  if (!v35)
  {
LABEL_88:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v29, v30, v31, v32);
    v48 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v48, v49, (uint64_t)v33, (uint64_t)CFSTR("Result"), v50);
    objc_msgSend_response(v4, v51, v52, v53, v54);
    v35 = (id)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend_response(v4, v55, v56, v57, v58);
      v59 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v64 = (void *)objc_msgSend_copy(v48, v60, v61, v62, v63);
      ((void (**)(_QWORD, _QWORD, void *))v59)[2](v59, 0, v64);

      v35 = 0;
    }
    goto LABEL_90;
  }
  objc_msgSend_response(v4, v29, v30, v31, v32);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend_response(v4, v44, v45, v46, v47);
    v48 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v48)[2](v48, v35, 0);
LABEL_90:

  }
}

- (id)apple80211WithInterfaceName:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1B063EAA0;
  v16 = sub_1B063EA18;
  v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B062B2C4;
  block[3] = &unk_1E6133698;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)XPCManager:(id)a3 XPCConnection:(id)a4 receivedXPCRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  int Matching80211InterfaceForXPCRequest;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void (**v61)(_QWORD, _QWORD, _QWORD);
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  void *v92;
  _QWORD v93[5];
  id v94;
  id v95;
  id v96;
  id v97;
  int v98;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_requestParameters(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_requestParameters(v10, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_virtualInterfaceRole(v25, v26, v27, v28, v29);

  if (objc_msgSend___allowXPCRequestWithoutAvailableInterface_(self, v31, (uint64_t)v10, v32, v33))
  {
    CWFGetOSLog();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      CWFGetOSLog();
      v38 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = MEMORY[0x1E0C81028];
      v43 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      goto LABEL_15;
    goto LABEL_14;
  }
  Matching80211InterfaceForXPCRequest = objc_msgSend___didFindMatching80211InterfaceForXPCRequest_(self, v34, (uint64_t)v10, v35, v36);
  CWFGetOSLog();
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v40;
  if (Matching80211InterfaceForXPCRequest)
  {
    if (v40)
    {
      CWFGetOSLog();
      v38 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = MEMORY[0x1E0C81028];
      v48 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      goto LABEL_15;
LABEL_14:
    objc_msgSend_UUID(v10, v44, v45, v46, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v49, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringToIndex_(v54, v55, 5, v56, v57);
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

LABEL_15:
    objc_msgSend___queueForXPCRequest_(self, v58, (uint64_t)v10, v59, v60);
    v61 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, v10);
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = sub_1B062F074;
    v93[3] = &unk_1E61341C0;
    objc_copyWeak(&v97, location);
    v93[4] = self;
    v94 = v9;
    v95 = v8;
    v96 = v20;
    v98 = v30;
    objc_msgSend_addExecutionBlock_(v10, v62, (uint64_t)v93, v63, v64);
    objc_msgSend_addOperation_(v61, v65, (uint64_t)v10, v66, v67);

    objc_destroyWeak(&v97);
    objc_destroyWeak(location);
LABEL_16:

    goto LABEL_17;
  }
  if (v40)
  {
    CWFGetOSLog();
    v42 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = MEMORY[0x1E0C81028];
    v68 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_UUID(v10, v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v73, v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringToIndex_(v78, v79, 5, v80, v81);
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

  }
  objc_msgSend_response(v10, v82, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    objc_msgSend_response(v10, v87, v88, v89, v90);
    v61 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v91, *MEMORY[0x1E0CB2FE0], 45, 0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v61)[2](v61, v92, 0);

    goto LABEL_16;
  }
LABEL_17:

}

- (id)apple80211WithVirtualInterfaceRole:(int)a3 parentInterfaceName:(id)a4
{
  id v6;
  NSObject *mutexQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1B063EAA0;
  v19 = sub_1B063EA18;
  v20 = 0;
  mutexQueue = self->_mutexQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B062B278;
  v11[3] = &unk_1E6133480;
  v12 = v6;
  v13 = &v15;
  v14 = a3;
  v11[4] = self;
  v8 = v6;
  dispatch_sync(mutexQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (int)__defaultInterfaceRoleForRequestType:(int64_t)a3
{
  int result;

  if ((unint64_t)(a3 - 39) <= 0x30 && ((1 << (a3 - 39)) & 0x1C00018007FFFLL) != 0)
    return 6;
  result = 0;
  if ((unint64_t)(a3 - 146) <= 0x14 && ((1 << (a3 + 110)) & 0x1FF801) != 0)
    return 6;
  return result;
}

- (id)__apple80211WithVirtualInterfaceRole:(int)a3 parentInterfaceName:(id)a4
{
  uint64_t v4;
  id v6;
  __uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  NSMutableDictionary *apple80211Map;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int isEqual;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  id v68;
  void *v69;
  __uint64_t v70;
  void *v71;
  NSObject *v72;
  id v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  __uint64_t v84;
  void *v85;
  NSObject *v86;
  id v87;
  __uint64_t v88;
  void *v89;
  NSObject *v90;
  id v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  int *v98;
  uint64_t v99;
  id v100;
  id obj;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  int v107;
  unint64_t v108;
  __int16 v109;
  unint64_t v110;
  __int16 v111;
  const char *v112;
  __int16 v113;
  const char *v114;
  __int16 v115;
  int v116;
  __int16 v117;
  void *v118;
  __int16 v119;
  id v120;
  __int16 v121;
  NSMutableDictionary *v122;
  uint64_t v123;

  v4 = *(_QWORD *)&a3;
  v123 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    CWFGetOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v15 = v7 / 0x3B9ACA00;
    v16 = v7 % 0x3B9ACA00 / 0x3E8;
    sub_1B06353E8(v4, v11, v12, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    apple80211Map = self->_apple80211Map;
    v107 = 134219778;
    v108 = v15;
    v109 = 2048;
    v110 = v16;
    v111 = 2082;
    v112 = "-[CWFXPCRequestProxy __apple80211WithVirtualInterfaceRole:parentInterfaceName:]";
    v113 = 2082;
    v114 = "CWFXPCRequestProxy.m";
    v115 = 1024;
    v116 = 3836;
    v117 = 2114;
    v118 = v17;
    v119 = 2114;
    v120 = v6;
    v121 = 2114;
    v122 = apple80211Map;
    LODWORD(v99) = 78;
    v98 = &v107;
    _os_log_send_and_compose_impl();

  }
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  objc_msgSend_allValues(self->_apple80211Map, v19, v20, v21, v22);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v102, (uint64_t)v106, 16);
  if (!v24)
  {
    v69 = 0;
    v68 = 0;
    goto LABEL_40;
  }
  v29 = v24;
  v100 = 0;
  v30 = *(_QWORD *)v103;
  while (2)
  {
    for (i = 0; i != v29; ++i)
    {
      if (*(_QWORD *)v103 != v30)
        objc_enumerationMutation(obj);
      v32 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
      objc_msgSend_interfaceName(v32, v25, v26, v27, v28, v98, v99);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        if (objc_msgSend_virtualInterfaceRole(v32, v25, v26, v27, v28) == (_DWORD)v4)
        {
          if (!v6)
            goto LABEL_34;
          objc_msgSend_virtualInterfaceParent(v32, v25, v26, v27, v28);
          v34 = objc_claimAutoreleasedReturnValue();
          if ((id)v34 == v6)
          {

LABEL_34:
            v70 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
            CWFGetOSLog();
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            if (v71)
            {
              CWFGetOSLog();
              v72 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v72 = MEMORY[0x1E0C81028];
              v73 = MEMORY[0x1E0C81028];
            }
            v69 = v100;

            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              v107 = 134219266;
              v108 = v70 / 0x3B9ACA00;
              v109 = 2048;
              v110 = v70 % 0x3B9ACA00 / 0x3E8;
              v111 = 2082;
              v112 = "-[CWFXPCRequestProxy __apple80211WithVirtualInterfaceRole:parentInterfaceName:]";
              v113 = 2082;
              v114 = "CWFXPCRequestProxy.m";
              v115 = 1024;
              v116 = 3847;
              v117 = 2114;
              v118 = v32;
              _os_log_send_and_compose_impl();
            }

            v68 = v32;
            goto LABEL_40;
          }
          v39 = (void *)v34;
          objc_msgSend_virtualInterfaceParent(v32, v35, v36, v37, v38);
          v40 = objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            v45 = (void *)v40;
            objc_msgSend_virtualInterfaceParent(v32, v41, v42, v43, v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            isEqual = objc_msgSend_isEqual_(v6, v47, (uint64_t)v46, v48, v49);

            if (isEqual)
              goto LABEL_34;
          }
          else
          {

          }
        }
        if ((_DWORD)v4 == 7 && !objc_msgSend_virtualInterfaceRole(v32, v25, v26, v27, v28))
        {
          if (!v6)
            goto LABEL_27;
          objc_msgSend_interfaceName(v32, v25, v26, v27, v28);
          v51 = objc_claimAutoreleasedReturnValue();
          if ((id)v51 == v6)
          {

LABEL_27:
            v56 = v100;
            v100 = v32;
LABEL_28:

            continue;
          }
          v56 = (void *)v51;
          objc_msgSend_interfaceName(v32, v52, v53, v54, v55);
          v57 = objc_claimAutoreleasedReturnValue();
          if (!v57)
            goto LABEL_28;
          v62 = (void *)v57;
          objc_msgSend_interfaceName(v32, v58, v59, v60, v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend_isEqual_(v6, v64, (uint64_t)v63, v65, v66);

          if (v67)
            goto LABEL_27;
        }
      }
    }
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v102, (uint64_t)v106, 16);
    if (v29)
      continue;
    break;
  }
  v68 = 0;
  v69 = v100;
LABEL_40:

  if ((_DWORD)v4 == 7 && !v68 && v69)
  {
    objc_msgSend_capabilities_(v69, v74, 0, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_containsObject_(v77, v78, (uint64_t)&unk_1E615EC40, v79, v80) & 1) != 0
      || objc_msgSend_containsObject_(v77, v81, (uint64_t)&unk_1E615EC58, v82, v83))
    {
      v84 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      CWFGetOSLog();
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      if (v85)
      {
        CWFGetOSLog();
        v86 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v86 = MEMORY[0x1E0C81028];
        v87 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
      {
        v107 = 134219266;
        v108 = v84 / 0x3B9ACA00;
        v109 = 2048;
        v110 = v84 % 0x3B9ACA00 / 0x3E8;
        v111 = 2082;
        v112 = "-[CWFXPCRequestProxy __apple80211WithVirtualInterfaceRole:parentInterfaceName:]";
        v113 = 2082;
        v114 = "CWFXPCRequestProxy.m";
        v115 = 1024;
        v116 = 3866;
        v117 = 2114;
        v118 = v69;
        _os_log_send_and_compose_impl();
      }

      v68 = v69;
    }
    else
    {
      v68 = 0;
    }

  }
  if (!v68)
  {
    v88 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      CWFGetOSLog();
      v90 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v90 = MEMORY[0x1E0C81028];
      v91 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      sub_1B06353E8(v4, v92, v93, v94, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = 134219522;
      v108 = v88 / 0x3B9ACA00;
      v109 = 2048;
      v110 = v88 % 0x3B9ACA00 / 0x3E8;
      v111 = 2082;
      v112 = "-[CWFXPCRequestProxy __apple80211WithVirtualInterfaceRole:parentInterfaceName:]";
      v113 = 2082;
      v114 = "CWFXPCRequestProxy.m";
      v115 = 1024;
      v116 = 3874;
      v117 = 2114;
      v118 = v96;
      v119 = 2114;
      v120 = v6;
      _os_log_send_and_compose_impl();

    }
  }

  return v68;
}

- (id)__queueForXPCRequest:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  CWFXPCRequestProxy *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1B063EAA0;
  v17 = sub_1B063EA18;
  v18 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0633C50;
  block[3] = &unk_1E6134148;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__interfaceSpecificEventIDs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v61;
  uint64_t v62;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_set(MEMORY[0x1E0C99E20], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(self->_apple80211Map, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_mutableCopy(v14, v15, v16, v17, v18);

  objc_msgSend_removeObject_(v19, v20, (uint64_t)&stru_1E613B710, v21, v22);
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v4;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v68, (uint64_t)v73, 16);
  if (v24)
  {
    v29 = v24;
    v30 = *(_QWORD *)v69;
    v61 = *(_QWORD *)v69;
    do
    {
      v31 = 0;
      v62 = v29;
      do
      {
        if (*(_QWORD *)v69 != v30)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v31);
        objc_msgSend_interfaceName(v32, v25, v26, v27, v28, v61);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          objc_msgSend_addObject_(v9, v34, (uint64_t)v32, v35, v36);
        }
        else
        {
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v37 = v19;
          v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v64, (uint64_t)v72, 16);
          if (v39)
          {
            v44 = v39;
            v45 = *(_QWORD *)v65;
            do
            {
              for (i = 0; i != v44; ++i)
              {
                if (*(_QWORD *)v65 != v45)
                  objc_enumerationMutation(v37);
                v47 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
                v48 = objc_msgSend_type(v32, v40, v41, v42, v43);
                objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v49, v48, v47, v50);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if (v54)
                  objc_msgSend_addObject_(v9, v51, (uint64_t)v54, v52, v53);

              }
              v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v64, (uint64_t)v72, 16);
            }
            while (v44);
          }

          v30 = v61;
          v29 = v62;
        }
        ++v31;
      }
      while (v31 != v29);
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v68, (uint64_t)v73, 16);
    }
    while (v29);
  }

  v59 = (void *)objc_msgSend_copy(v9, v55, v56, v57, v58);
  return v59;
}

- (void)__cancelRequestsWithNamePrefix:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  int hasPrefix;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  CWFXPCRequestProxy *v61;
  id obj;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v61 = self;
  objc_msgSend_allValues(self->_mutableQueueMap, v5, v6, v7, v8);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v80, (uint64_t)v87, 16);
  if (v64)
  {
    v63 = *(_QWORD *)v81;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v81 != v63)
          objc_enumerationMutation(obj);
        v65 = v14;
        v15 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v14);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        objc_msgSend_allValues(v15, v10, v11, v12, v13);
        v66 = (id)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v16, (uint64_t)&v76, (uint64_t)v86, 16);
        if (v17)
        {
          v22 = v17;
          v67 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v77 != v67)
                objc_enumerationMutation(v66);
              v24 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
              v72 = 0u;
              v73 = 0u;
              v74 = 0u;
              v75 = 0u;
              objc_msgSend_operations(v24, v18, v19, v20, v21);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v72, (uint64_t)v85, 16);
              if (v27)
              {
                v32 = v27;
                v33 = *(_QWORD *)v73;
                do
                {
                  for (j = 0; j != v32; ++j)
                  {
                    if (*(_QWORD *)v73 != v33)
                      objc_enumerationMutation(v25);
                    v35 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
                    objc_msgSend_name(v35, v28, v29, v30, v31);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    hasPrefix = objc_msgSend_hasPrefix_(v36, v37, (uint64_t)v4, v38, v39);

                    if (hasPrefix)
                      objc_msgSend_cancel(v35, v28, v29, v30, v31);
                  }
                  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v72, (uint64_t)v85, 16);
                }
                while (v32);
              }

            }
            v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v18, (uint64_t)&v76, (uint64_t)v86, 16);
          }
          while (v22);
        }

        v14 = v65 + 1;
      }
      while (v65 + 1 != v64);
      v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v80, (uint64_t)v87, 16);
    }
    while (v64);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend_operations(v61->_defaultQueue, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v68, (uint64_t)v84, 16);
  if (v47)
  {
    v52 = v47;
    v53 = *(_QWORD *)v69;
    do
    {
      for (k = 0; k != v52; ++k)
      {
        if (*(_QWORD *)v69 != v53)
          objc_enumerationMutation(v45);
        v55 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * k);
        objc_msgSend_name(v55, v48, v49, v50, v51);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend_hasPrefix_(v56, v57, (uint64_t)v4, v58, v59);

        if (v60)
          objc_msgSend_cancel(v55, v48, v49, v50, v51);
      }
      v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v68, (uint64_t)v84, 16);
    }
    while (v52);
  }

}

- (CWFXPCRequestProxyDelegate)delegate
{
  return (CWFXPCRequestProxyDelegate *)objc_getProperty(self, a2, 272, 1);
}

- (CWFXPCRequestProxy)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  CWFXPCRequestProxy *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *mutexQueue;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *eventQueue;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  NSObject *v36;
  dispatch_queue_t v37;
  OS_dispatch_queue *interfaceQueue;
  NSMutableDictionary *v39;
  NSMutableDictionary *mutableLinkDownStatusMap;
  NSMutableDictionary *v41;
  NSMutableDictionary *mutableLinkDownNetworkMap;
  NSMutableDictionary *v43;
  NSMutableDictionary *mutableRoamStatusMap;
  NSMutableDictionary *v45;
  NSMutableDictionary *mutableJoinStatusMap;
  NSMutableDictionary *v47;
  NSMutableDictionary *mutableAutoJoinTriggerMap;
  NSMutableDictionary *v49;
  NSMutableDictionary *mutableAutoJoinStatusMap;
  NSMutableDictionary *v51;
  NSMutableDictionary *mutableLinkQualityMap;
  NSMutableDictionary *v53;
  NSMutableDictionary *mutableQueueMap;
  NSOperationQueue *v55;
  NSOperationQueue *defaultQueue;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  NSOperationQueue *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  NSMutableDictionary *v67;
  NSMutableDictionary *apple80211Map;
  CWFApple80211 *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  NSMutableSet *v76;
  NSMutableSet *nonApple80211InterfaceList;
  NSMutableSet *v78;
  NSMutableSet *apple80211EligibleRemovalList;
  NSMutableDictionary *v80;
  NSMutableDictionary *EAP8021XMap;
  NSMutableDictionary *v82;
  NSMutableDictionary *SCNetworkServiceMap;
  NSMutableDictionary *v84;
  NSMutableDictionary *SCNetworkInterfaceMap;
  CWFSCNetworkConfiguration *v86;
  CWFSCNetworkConfiguration *SCNetworkConfiguration;
  CWFSCNetworkReachability *v88;
  CWFSCNetworkReachability *SCNetworkReachability;
  CWFIO80211 *v90;
  CWFIO80211 *IO80211;
  CWFKernelEventMonitor *v92;
  CWFKernelEventMonitor *keventMonitor;
  CWFXPCConnection *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  CWFXPCConnection *internalRequestXPCConnection;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __uint64_t v107;
  void *v108;
  NSObject *p_super;
  id v110;
  CWFKernelEventMonitor *v111;
  objc_super v113;
  int v114;
  unint64_t v115;
  __int16 v116;
  unint64_t v117;
  __int16 v118;
  const char *v119;
  __int16 v120;
  const char *v121;
  __int16 v122;
  int v123;
  __int16 v124;
  CWFKernelEventMonitor *v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v113.receiver = self;
  v113.super_class = (Class)CWFXPCRequestProxy;
  v5 = -[CWFXPCRequestProxy init](&v113, sel_init);
  if (!v5)
  {
    p_super = 0;
    v75 = 0;
    goto LABEL_31;
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("com.apple.corewifi.XPC-common-mutex"), v3, v4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend_UTF8String(v6, v7, v8, v9, v10);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create(v11, v12);
  mutexQueue = v5->_mutexQueue;
  v5->_mutexQueue = (OS_dispatch_queue *)v13;

  if (!v5->_mutexQueue)
    goto LABEL_32;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("com.apple.corewifi.XPC-common-event"), v16, v17);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = dispatch_queue_create(v23, v24);
  eventQueue = v5->_eventQueue;
  v5->_eventQueue = (OS_dispatch_queue *)v25;

  if (!v5->_eventQueue)
    goto LABEL_32;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v27, (uint64_t)CFSTR("com.apple.corewifi.XPC-common-intf"), v28, v29);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v35 = (const char *)objc_msgSend_UTF8String(v30, v31, v32, v33, v34);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = dispatch_queue_create(v35, v36);
  interfaceQueue = v5->_interfaceQueue;
  v5->_interfaceQueue = (OS_dispatch_queue *)v37;

  if (!v5->_interfaceQueue)
    goto LABEL_32;
  v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableLinkDownStatusMap = v5->_mutableLinkDownStatusMap;
  v5->_mutableLinkDownStatusMap = v39;

  if (!v5->_mutableLinkDownStatusMap)
    goto LABEL_32;
  v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableLinkDownNetworkMap = v5->_mutableLinkDownNetworkMap;
  v5->_mutableLinkDownNetworkMap = v41;

  if (!v5->_mutableLinkDownNetworkMap)
    goto LABEL_32;
  v43 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableRoamStatusMap = v5->_mutableRoamStatusMap;
  v5->_mutableRoamStatusMap = v43;

  if (!v5->_mutableRoamStatusMap)
    goto LABEL_32;
  v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableJoinStatusMap = v5->_mutableJoinStatusMap;
  v5->_mutableJoinStatusMap = v45;

  if (!v5->_mutableJoinStatusMap)
    goto LABEL_32;
  v47 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableAutoJoinTriggerMap = v5->_mutableAutoJoinTriggerMap;
  v5->_mutableAutoJoinTriggerMap = v47;

  if (!v5->_mutableAutoJoinTriggerMap)
    goto LABEL_32;
  v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableAutoJoinStatusMap = v5->_mutableAutoJoinStatusMap;
  v5->_mutableAutoJoinStatusMap = v49;

  if (!v5->_mutableAutoJoinStatusMap)
    goto LABEL_32;
  v51 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableLinkQualityMap = v5->_mutableLinkQualityMap;
  v5->_mutableLinkQualityMap = v51;

  if (!v5->_mutableLinkQualityMap)
    goto LABEL_32;
  v53 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableQueueMap = v5->_mutableQueueMap;
  v5->_mutableQueueMap = v53;

  if (!v5->_mutableQueueMap)
    goto LABEL_32;
  v55 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
  defaultQueue = v5->_defaultQueue;
  v5->_defaultQueue = v55;

  v60 = v5->_defaultQueue;
  if (!v60
    || (objc_msgSend_setName_(v60, v57, (uint64_t)CFSTR("default-concurrent"), v58, v59),
        objc_msgSend_setMaxConcurrentOperationCount_(v5->_defaultQueue, v61, -1, v62, v63),
        objc_msgSend_setQualityOfService_(v5->_defaultQueue, v64, -1, v65, v66),
        v67 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]),
        apple80211Map = v5->_apple80211Map,
        v5->_apple80211Map = v67,
        apple80211Map,
        !v5->_apple80211Map))
  {
LABEL_32:
    v75 = 0;
LABEL_33:
    p_super = &v5->super;
    v5 = 0;
    goto LABEL_31;
  }
  v69 = [CWFApple80211 alloc];
  v75 = (void *)objc_msgSend_initWithInterfaceName_(v69, v70, 0, v71, v72);
  if (!v75)
    goto LABEL_33;
  objc_msgSend_setObject_forKeyedSubscript_(v5->_apple80211Map, v73, (uint64_t)v75, (uint64_t)&stru_1E613B710, v74);
  v76 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  nonApple80211InterfaceList = v5->_nonApple80211InterfaceList;
  v5->_nonApple80211InterfaceList = v76;

  if (!v5->_nonApple80211InterfaceList)
    goto LABEL_33;
  v78 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  apple80211EligibleRemovalList = v5->_apple80211EligibleRemovalList;
  v5->_apple80211EligibleRemovalList = v78;

  if (!v5->_apple80211EligibleRemovalList)
    goto LABEL_33;
  v80 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  EAP8021XMap = v5->_EAP8021XMap;
  v5->_EAP8021XMap = v80;

  if (!v5->_EAP8021XMap)
    goto LABEL_33;
  v82 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  SCNetworkServiceMap = v5->_SCNetworkServiceMap;
  v5->_SCNetworkServiceMap = v82;

  if (!v5->_SCNetworkServiceMap)
    goto LABEL_33;
  v84 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  SCNetworkInterfaceMap = v5->_SCNetworkInterfaceMap;
  v5->_SCNetworkInterfaceMap = v84;

  if (!v5->_SCNetworkInterfaceMap)
    goto LABEL_33;
  v86 = objc_alloc_init(CWFSCNetworkConfiguration);
  SCNetworkConfiguration = v5->_SCNetworkConfiguration;
  v5->_SCNetworkConfiguration = v86;

  if (!v5->_SCNetworkConfiguration)
    goto LABEL_33;
  v88 = objc_alloc_init(CWFSCNetworkReachability);
  SCNetworkReachability = v5->_SCNetworkReachability;
  v5->_SCNetworkReachability = v88;

  if (!v5->_SCNetworkReachability)
    goto LABEL_33;
  v90 = objc_alloc_init(CWFIO80211);
  IO80211 = v5->_IO80211;
  v5->_IO80211 = v90;

  if (!v5->_IO80211)
    goto LABEL_33;
  v92 = objc_alloc_init(CWFKernelEventMonitor);
  keventMonitor = v5->_keventMonitor;
  v5->_keventMonitor = v92;

  if (!v5->_keventMonitor)
    goto LABEL_33;
  v94 = [CWFXPCConnection alloc];
  CWFBootArgs();
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend_initWithServiceType_XPCConnection_bootArgs_(v94, v96, 1, 0, (uint64_t)v95);
  internalRequestXPCConnection = v5->_internalRequestXPCConnection;
  v5->_internalRequestXPCConnection = (CWFXPCConnection *)v97;

  if (!v5->_internalRequestXPCConnection)
    goto LABEL_33;
  objc_msgSend___setupEventHandlers(v5, v99, v100, v101, v102);
  objc_msgSend_startEventMonitoring(v5->_keventMonitor, v103, v104, v105, v106);
  v107 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    CWFGetOSLog();
    p_super = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    p_super = MEMORY[0x1E0C81028];
    v110 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    v111 = v5->_keventMonitor;
    v114 = 134219266;
    v115 = v107 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v107 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFXPCRequestProxy init]";
    v120 = 2082;
    v121 = "CWFXPCRequestProxy.m";
    v122 = 1024;
    v123 = 228;
    v124 = 2048;
    v125 = v111;
    _os_log_send_and_compose_impl();
  }
LABEL_31:

  return v5;
}

- (void)XPCManager:(id)a3 sendXPCEvent:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  v13 = objc_msgSend_type(v7, v9, v10, v11, v12);
  if (v13 == 30)
  {
    objc_msgSend___handleKnownNetworkProfileChangedEvent_(self, v14, (uint64_t)v7, v16, v17);
LABEL_8:
    objc_msgSend_delegate(self, v14, v15, v16, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      CWFGetOSLog();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        CWFGetOSLog();
        v26 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = MEMORY[0x1E0C81028];
        v27 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v32 = objc_msgSend_type(v7, v28, v29, v30, v31);
      sub_1B062BEE0(v32, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_9:
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v24, v23, (uint64_t)self, (uint64_t)v7, (uint64_t)v8);
LABEL_18:

    goto LABEL_19;
  }
  if (v13)
    goto LABEL_8;
  v18 = objc_msgSend_internalType(v7, v14, v15, v16, v17);
  if (v18 == 1)
  {
    objc_msgSend___handleAutoJoinStateChangedInternalEvent_(self, v19, (uint64_t)v7, v21, v22);
    goto LABEL_19;
  }
  if (v18 == 3)
  {
    objc_msgSend___handleAssocDoneInternalEvent_(self, v19, (uint64_t)v7, v21, v22);
    goto LABEL_19;
  }
  if (v18 != 2)
  {
    objc_msgSend_delegate(self, v19, v20, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      CWFGetOSLog();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        CWFGetOSLog();
        v26 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = MEMORY[0x1E0C81028];
        v39 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v44 = objc_msgSend_internalType(v7, v40, v41, v42, v43);
      sub_1B0641438(v44, v45, v46, v47, v48);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      _os_log_send_and_compose_impl();

LABEL_16:
      if (v8)
        v8[2](v8);
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  objc_msgSend___handleWillAssocInternalEvent_(self, v19, (uint64_t)v7, v21, v22);
LABEL_19:

}

- (BOOL)__didFindMatching80211InterfaceForXPCRequest:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  __uint64_t v44;
  void *v45;
  NSObject *v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  __uint64_t v96;
  void *v97;
  id v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  int isNon80211InterfaceName;
  __uint64_t v139;
  void *v140;
  NSObject *v141;
  NSObject *interfaceQueue;
  NSObject *v143;
  id v144;
  __uint64_t v145;
  void *v146;
  NSObject *v147;
  id v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  id v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  id v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  dispatch_block_t v224;
  id v225;
  const char *v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  __uint64_t v243;
  void *v244;
  NSObject *v245;
  __uint64_t v246;
  void *v247;
  id v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  id v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  id v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  id v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  BOOL v288;
  int *v290;
  int v291;
  void *v292;
  void *v293;
  void *v294;
  uint64_t v295;
  void *v296;
  _QWORD v297[4];
  id v298;
  _QWORD *v299;
  _QWORD v300[3];
  int v301;
  _QWORD block[4];
  NSObject *v303;
  CWFXPCRequestProxy *v304;
  id v305;
  uint64_t *v306;
  uint64_t v307;
  uint64_t *v308;
  uint64_t v309;
  uint64_t (*v310)(uint64_t, uint64_t);
  void (*v311)(uint64_t);
  id v312;
  int v313;
  unint64_t v314;
  __int16 v315;
  unint64_t v316;
  __int16 v317;
  const char *v318;
  __int16 v319;
  const char *v320;
  __int16 v321;
  int v322;
  __int16 v323;
  uint64_t v324;
  __int16 v325;
  id v326;
  __int16 v327;
  void *v328;
  uint64_t v329;

  v329 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v307 = 0;
  v308 = &v307;
  v309 = 0x3032000000;
  v310 = sub_1B063EAA0;
  v311 = sub_1B063EA18;
  v312 = 0;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_requestParameters(v4, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_virtualInterfaceRole(v19, v20, v21, v22, v23);

  if (v14)
  {
    objc_msgSend_apple80211WithInterfaceName_(self, v25, (uint64_t)v14, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v308[5];
    v308[5] = v29;
  }
  else
  {
    if (!v24)
    {
      v31 = objc_msgSend_type(v4, v25, v26, v27, v28);
      v35 = objc_msgSend___defaultInterfaceRoleForRequestType_(self, v32, v31, v33, v34);
      objc_msgSend_requestParameters(v4, v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setVirtualInterfaceRole_(v40, v41, v35, v42, v43);

      v44 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      CWFGetOSLog();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        CWFGetOSLog();
        v46 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v46 = MEMORY[0x1E0C81028];
        v47 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_requestParameters(v4, v48, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend_virtualInterfaceRole(v52, v53, v54, v55, v56);
        sub_1B06353E8(v57, v58, v59, v60, v61);
        v62 = (id)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend_type(v4, v63, v64, v65, v66);
        sub_1B063544C(v67, v68, v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v313 = 134219522;
        v314 = v44 / 0x3B9ACA00;
        v315 = 2048;
        v316 = v44 % 0x3B9ACA00 / 0x3E8;
        v317 = 2082;
        v318 = "-[CWFXPCRequestProxy __didFindMatching80211InterfaceForXPCRequest:]";
        v319 = 2082;
        v320 = "CWFXPCRequestProxy.m";
        v321 = 1024;
        v322 = 404;
        v323 = 2114;
        v324 = (uint64_t)v62;
        v325 = 2114;
        v326 = v72;
        v291 = 68;
        v290 = &v313;
        _os_log_send_and_compose_impl();

      }
    }
    objc_msgSend_requestParameters(v4, v25, v26, v27, v28, v290, v291);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend_virtualInterfaceRole(v73, v74, v75, v76, v77);
    objc_msgSend_apple80211WithVirtualInterfaceRole_parentInterfaceName_(self, v79, v78, 0, v80);
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = (void *)v308[5];
    v308[5] = v81;

    objc_msgSend_interfaceName((void *)v308[5], v83, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestParameters(v4, v88, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInterfaceName_(v92, v93, (uint64_t)v87, v94, v95);

    v96 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v97)
    {
      CWFGetOSLog();
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = MEMORY[0x1E0C81028];
      v98 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_requestParameters(v4, v99, v100, v101, v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_interfaceName(v103, v104, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_requestParameters(v4, v109, v110, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend_virtualInterfaceRole(v113, v114, v115, v116, v117);
      sub_1B06353E8(v118, v119, v120, v121, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v313 = 134219522;
      v314 = v96 / 0x3B9ACA00;
      v315 = 2048;
      v316 = v96 % 0x3B9ACA00 / 0x3E8;
      v317 = 2082;
      v318 = "-[CWFXPCRequestProxy __didFindMatching80211InterfaceForXPCRequest:]";
      v319 = 2082;
      v320 = "CWFXPCRequestProxy.m";
      v321 = 1024;
      v322 = 411;
      v323 = 2114;
      v324 = (uint64_t)v108;
      v325 = 2114;
      v326 = v123;
      _os_log_send_and_compose_impl();

    }
  }

  v128 = v308[5];
  if (!v128 && !v24)
  {
    objc_msgSend_requestParameters(v4, v124, v125, v126, v127);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceName(v129, v130, v131, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    isNon80211InterfaceName = objc_msgSend_isNon80211InterfaceName_(self, v135, (uint64_t)v134, v136, v137);

    if (isNon80211InterfaceName)
    {
      v139 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      CWFGetOSLog();
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      if (v140)
      {
        CWFGetOSLog();
        v141 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v141 = MEMORY[0x1E0C81028];
        v148 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_requestParameters(v4, v149, v150, v151, v152);
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_interfaceName(v296, v153, v154, v155, v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_requestParameters(v4, v158, v159, v160, v161);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v167 = objc_msgSend_virtualInterfaceRole(v162, v163, v164, v165, v166);
        sub_1B06353E8(v167, v168, v169, v170, v171);
        v172 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v4, v173, v174, v175, v176);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUIDString(v177, v178, v179, v180, v181);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v182, v183, 5, v184, v185);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        v313 = 134219778;
        v314 = v139 / 0x3B9ACA00;
        v315 = 2048;
        v316 = v139 % 0x3B9ACA00 / 0x3E8;
        v317 = 2082;
        v318 = "-[CWFXPCRequestProxy __didFindMatching80211InterfaceForXPCRequest:]";
        v319 = 2082;
        v320 = "CWFXPCRequestProxy.m";
        v321 = 1024;
        v322 = 429;
        v323 = 2114;
        v324 = (uint64_t)v157;
        v325 = 2114;
        v326 = v172;
        v327 = 2114;
        v328 = v186;
        _os_log_send_and_compose_impl();

      }
    }
    else
    {
      interfaceQueue = self->_interfaceQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06A4028;
      block[3] = &unk_1E6134170;
      v143 = v14;
      v306 = &v307;
      v303 = v143;
      v304 = self;
      v144 = v4;
      v305 = v144;
      dispatch_sync(interfaceQueue, block);
      if (!v308[5])
      {
        v295 = (uint64_t)v143;
        v145 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        CWFGetOSLog();
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        if (v146)
        {
          CWFGetOSLog();
          v147 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v147 = MEMORY[0x1E0C81028];
          v187 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_requestParameters(v144, v188, v189, v190, v191);
          v294 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_interfaceName(v294, v192, v193, v194, v195);
          v292 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_requestParameters(v144, v196, v197, v198, v199);
          v293 = (void *)objc_claimAutoreleasedReturnValue();
          v204 = objc_msgSend_virtualInterfaceRole(v293, v200, v201, v202, v203);
          sub_1B06353E8(v204, v205, v206, v207, v208);
          v209 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUID(v144, v210, v211, v212, v213);
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUIDString(v214, v215, v216, v217, v218);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_substringToIndex_(v219, v220, 5, v221, v222);
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          v313 = 134219778;
          v314 = v145 / 0x3B9ACA00;
          v315 = 2048;
          v316 = v145 % 0x3B9ACA00 / 0x3E8;
          v317 = 2082;
          v318 = "-[CWFXPCRequestProxy __didFindMatching80211InterfaceForXPCRequest:]";
          v319 = 2082;
          v320 = "CWFXPCRequestProxy.m";
          v321 = 1024;
          v322 = 448;
          v323 = 2114;
          v324 = (uint64_t)v292;
          v325 = 2114;
          v326 = v209;
          v327 = 2114;
          v328 = v223;
          _os_log_send_and_compose_impl();

        }
        v300[0] = 0;
        v300[1] = v300;
        v300[2] = 0x2020000000;
        v301 = 0;
        v224 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E61327A0);
        v297[0] = MEMORY[0x1E0C809B0];
        v297[1] = 3221225472;
        v297[2] = sub_1B06A40C4;
        v297[3] = &unk_1E6134198;
        v299 = v300;
        v225 = v224;
        v298 = v225;
        objc_msgSend___updateWiFiNetworkInterfaces_reply_(self, v226, (uint64_t)CFSTR("CoreWiFi API force refresh"), (uint64_t)v297, v227);
        dispatch_block_wait(v225, 0xFFFFFFFFFFFFFFFFLL);
        if (v14)
        {
          objc_msgSend_apple80211WithInterfaceName_(self, v228, v295, v230, v231);
          v232 = objc_claimAutoreleasedReturnValue();
          v233 = (void *)v308[5];
          v308[5] = v232;
        }
        else
        {
          objc_msgSend_requestParameters(v144, v228, v229, v230, v231);
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          v238 = objc_msgSend_virtualInterfaceRole(v233, v234, v235, v236, v237);
          objc_msgSend_apple80211WithVirtualInterfaceRole_parentInterfaceName_(self, v239, v238, 0, v240);
          v241 = objc_claimAutoreleasedReturnValue();
          v242 = (void *)v308[5];
          v308[5] = v241;

        }
        if (v308[5])
        {
          v243 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          CWFGetOSLog();
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          if (v244)
          {
            CWFGetOSLog();
            v245 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v245 = MEMORY[0x1E0C81028];
            v248 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
          {
            sub_1B06353E8(0, v249, v250, v251, v252);
            v253 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UUID(v144, v254, v255, v256, v257);
            v258 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UUIDString(v258, v259, v260, v261, v262);
            v263 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_substringToIndex_(v263, v264, 5, v265, v266);
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            v313 = 134219778;
            v314 = v243 / 0x3B9ACA00;
            v315 = 2048;
            v316 = v243 % 0x3B9ACA00 / 0x3E8;
            v317 = 2082;
            v318 = "-[CWFXPCRequestProxy __didFindMatching80211InterfaceForXPCRequest:]";
            v319 = 2082;
            v320 = "CWFXPCRequestProxy.m";
            v321 = 1024;
            v322 = 468;
            v323 = 2114;
            v324 = v295;
            v325 = 2114;
            v326 = v253;
            v327 = 2114;
            v328 = v267;
            _os_log_send_and_compose_impl();

          }
        }
        else
        {
          v246 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          CWFGetOSLog();
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          if (v247)
          {
            CWFGetOSLog();
            v245 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v245 = MEMORY[0x1E0C81028];
            v268 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR))
          {
            sub_1B06353E8(0, v269, v270, v271, v272);
            v273 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UUID(v144, v274, v275, v276, v277);
            v278 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_UUIDString(v278, v279, v280, v281, v282);
            v283 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_substringToIndex_(v283, v284, 5, v285, v286);
            v287 = (void *)objc_claimAutoreleasedReturnValue();
            v313 = 134219778;
            v314 = v246 / 0x3B9ACA00;
            v315 = 2048;
            v316 = v246 % 0x3B9ACA00 / 0x3E8;
            v317 = 2082;
            v318 = "-[CWFXPCRequestProxy __didFindMatching80211InterfaceForXPCRequest:]";
            v319 = 2082;
            v320 = "CWFXPCRequestProxy.m";
            v321 = 1024;
            v322 = 472;
            v323 = 2114;
            v324 = v295;
            v325 = 2114;
            v326 = v273;
            v327 = 2114;
            v328 = v287;
            _os_log_send_and_compose_impl();

          }
        }

        _Block_object_dispose(v300, 8);
      }

      v141 = v303;
    }

    v128 = v308[5];
  }
  v288 = v128 != 0;

  _Block_object_dispose(&v307, 8);
  return v288;
}

- (BOOL)__allowXPCRequestWithoutAvailableInterface:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v3 = a3;
  objc_msgSend_type(v3, v4, v5, v6, v7);
  v12 = objc_msgSend_type(v3, v8, v9, v10, v11);
  if ((sub_1B06414D0(v12) & 1) != 0)
  {
    v17 = 1;
  }
  else
  {
    v18 = objc_msgSend_type(v3, v13, v14, v15, v16);
    v17 = sub_1B0641488(v18);
  }

  return v17;
}

- (void)XPCManager:(id)a3 XPCConnection:(id)a4 canceledXPCRequestsWithUUID:(id)a5
{
  id v7;
  id v8;
  NSObject *mutexQueue;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  id v21;
  CWFXPCRequestProxy *v22;

  v7 = a4;
  v8 = a5;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A422C;
  block[3] = &unk_1E6133340;
  v10 = v7;
  v20 = v10;
  v11 = v8;
  v21 = v11;
  v22 = self;
  dispatch_async(mutexQueue, block);
  objc_msgSend_delegate(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  if (v16)
    objc_msgSend_XPCRequestProxy_XPCConnection_canceledXPCRequestsWithUUID_(v16, v17, (uint64_t)self, (uint64_t)v10, (uint64_t)v11);

}

- (id)__privateMACManager
{
  _os_feature_enabled_impl();
  return 0;
}

- (CWFPrivateMACManager)privateMACManager
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EAA0;
  v10 = sub_1B063EA18;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A44D4;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CWFPrivateMACManager *)v3;
}

- (void)setTargetQueue:(id)a3 requestType:(int64_t)a4 interfaceName:(id)a5
{
  id v8;
  id v9;
  NSObject *mutexQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A45D4;
  block[3] = &unk_1E6133D40;
  block[4] = self;
  v14 = v9;
  v15 = v8;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_sync(mutexQueue, block);

}

- (void)startEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A46DC;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A486C;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  NSObject *mutexQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A4A30;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)invalidate
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A4AB8;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (id)__deviceUUID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  dispatch_block_t v7;
  CWFXPCRequest *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  dispatch_time_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD v28[3];
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  int v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1B063EAA0;
  v34 = sub_1B063EA18;
  v35 = 0;
  objc_msgSend_delegate(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6131BA0);
  v8 = objc_alloc_init(CWFXPCRequest);
  objc_msgSend_setType_(v8, v9, 145, v10, v11);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1B06A4EC8;
  v24[3] = &unk_1E61341E8;
  v26 = &v30;
  v27 = v28;
  v12 = v7;
  v25 = v12;
  objc_msgSend_setResponse_(v8, v13, (uint64_t)v24, v14, v15);
  objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v6, v16, (uint64_t)self, (uint64_t)self->_internalRequestXPCConnection, (uint64_t)v8);
  v17 = dispatch_time(0, 4000000000);
  if (!dispatch_block_wait(v12, v17))
  {

    _Block_object_dispose(v28, 8);
LABEL_6:
    v20 = (void *)v31[5];
    goto LABEL_11;
  }
  CWFGetOSLog();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    CWFGetOSLog();
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = MEMORY[0x1E0C81028];
    v21 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v36 = 136446978;
    v37 = "-[CWFXPCRequestProxy __deviceUUID]";
    v38 = 2082;
    v39 = "CWFXPCRequestProxy.m";
    v40 = 1024;
    v41 = 1441;
    v42 = 2048;
    v43 = 4000000000;
    _os_log_send_and_compose_impl();
  }

  _Block_object_dispose(v28, 8);
  v20 = 0;
LABEL_11:
  v22 = v20;

  _Block_object_dispose(&v30, 8);
  return v22;
}

- (id)__vendorSpecificIdentifierForXPCConnection:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  Class (*v62)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v63;
  uint64_t *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___deviceUUID(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_appendFormat_(v9, v20, (uint64_t)CFSTR("%@,"), v21, v22, v19);
    objc_msgSend_bundleID(v4, v23, v24, v25, v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31)
      goto LABEL_11;
    if (!qword_1ECFD6AC8)
    {
      v61 = xmmword_1E6134638;
      v62 = 0;
      qword_1ECFD6AC8 = _sl_dlopen();
    }
    if (qword_1ECFD6AC8)
    {
      v57 = 0;
      v58 = &v57;
      v59 = 0x2050000000;
      v32 = (void *)qword_1ECFD6AD0;
      v60 = qword_1ECFD6AD0;
      if (!qword_1ECFD6AD0)
      {
        *(_QWORD *)&v61 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v61 + 1) = 3221225472;
        v62 = sub_1B06BD10C;
        v63 = &unk_1E61329A8;
        v64 = &v57;
        sub_1B06BD10C((uint64_t)&v61, v27, v28, v29, v30);
        v32 = (void *)v58[3];
      }
      v33 = objc_retainAutorelease(v32);
      _Block_object_dispose(&v57, 8);
      objc_msgSend_applicationProxyForIdentifier_(v33, v34, (uint64_t)v31, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceIdentifierForVendor(v37, v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUIDString(v42, v43, v44, v45, v46);
      v47 = objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        objc_msgSend_appendFormat_(v9, v48, (uint64_t)CFSTR("%@"), v49, v50, v47);
        v55 = (void *)objc_msgSend_copy(v9, v51, v52, v53, v54);
        v19 = (void *)v47;
      }
      else
      {
        v55 = 0;
        v19 = 0;
      }
    }
    else
    {
LABEL_11:
      v55 = 0;
    }
  }
  else
  {
    v55 = 0;
    v31 = 0;
  }

  return v55;
}

- (id)__hashedSSID:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  size_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v12 = a4;
  if (v8)
  {
    objc_msgSend___vendorSpecificIdentifierForXPCConnection_(self, v9, (uint64_t)v12, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    if (v13)
    {
      objc_msgSend_dataUsingEncoding_(v13, v9, 4, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = objc_retainAutorelease(v17);
        v23 = (const void *)objc_msgSend_bytes(v18, v19, v20, v21, v22, 0, 0, 0, 0);
        v28 = objc_msgSend_length(v18, v24, v25, v26, v27);
        v29 = objc_retainAutorelease(v8);
        v34 = (const void *)objc_msgSend_bytes(v29, v30, v31, v32, v33);
        v39 = objc_msgSend_length(v29, v35, v36, v37, v38);
        CCHmac(2u, v23, v28, v34, v39, &v50);
        objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v40, (uint64_t)&v50, 32, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_base64EncodedStringWithOptions_(v42, v43, 0, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0;
        goto LABEL_5;
      }
    }
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v9, *MEMORY[0x1E0CB2FE0], 22, 0);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  if (a5 && v47)
  {
    v47 = objc_retainAutorelease(v47);
    v46 = 0;
    v18 = 0;
    v42 = 0;
    *a5 = v47;
  }
  else
  {
    v18 = 0;
    v42 = 0;
  }
LABEL_5:
  v48 = v46;

  return v48;
}

- (id)__hashedBSSID:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  size_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  CWFEthernetAddressDataFromString(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend___vendorSpecificIdentifierForXPCConnection_(self, v9, (uint64_t)v8, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    if (v13)
    {
      objc_msgSend_dataUsingEncoding_(v13, v9, 4, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = objc_retainAutorelease(v17);
        v23 = (const void *)objc_msgSend_bytes(v18, v19, v20, v21, v22, 0, 0, 0, 0);
        v28 = objc_msgSend_length(v18, v24, v25, v26, v27);
        v29 = objc_retainAutorelease(v12);
        v34 = (const void *)objc_msgSend_bytes(v29, v30, v31, v32, v33);
        v39 = objc_msgSend_length(v29, v35, v36, v37, v38);
        CCHmac(2u, v23, v28, v34, v39, &v50);
        objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v40, (uint64_t)&v50, 32, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_base64EncodedStringWithOptions_(v42, v43, 0, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0;
        goto LABEL_5;
      }
    }
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v9, *MEMORY[0x1E0CB2FE0], 22, 0);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  if (a5 && v47)
  {
    v47 = objc_retainAutorelease(v47);
    v46 = 0;
    v18 = 0;
    v42 = 0;
    *a5 = v47;
  }
  else
  {
    v18 = 0;
    v42 = 0;
  }
LABEL_5:
  v48 = v46;

  return v48;
}

- (void)__startMonitoringDefaultEventIDs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend_startEventMonitoring(self->_IO80211, a2, v2, v3, v4);
  objc_msgSend_startEventMonitoring(self->_SCNetworkConfiguration, v6, v7, v8, v9);
  objc_msgSend_startEventMonitoring(self->_SCNetworkReachability, v10, v11, v12, v13);
}

- (void)__stopMonitoringDefaultEventIDs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend_stopEventMonitoring(self->_IO80211, a2, v2, v3, v4);
  objc_msgSend_stopEventMonitoring(self->_SCNetworkConfiguration, v6, v7, v8, v9);
  objc_msgSend_stopEventMonitoring(self->_SCNetworkReachability, v10, v11, v12, v13);
}

- (void)__startMonitoringDefaultEventIDsForInterfaceName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;

  v46 = a3;
  objc_msgSend___apple80211WithInterfaceName_(self, v4, (uint64_t)v46, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v8, 191, (uint64_t)v46, v9);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v8, 4, (uint64_t)v46, v9);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v10, 3, (uint64_t)v46, v11);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v12, 20, (uint64_t)v46, v13);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v14, 76, (uint64_t)v46, v15);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v16, 70, (uint64_t)v46, v17);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v18, 71, (uint64_t)v46, v19);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v20, 80, (uint64_t)v46, v21);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v22, 39, (uint64_t)v46, v23);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v24, 17, (uint64_t)v46, v25);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v26, 12, (uint64_t)v46, v27);
  objc_msgSend_startMonitoringEventWithType_interfaceName_(v7, v28, 13, (uint64_t)v46, v29);
  objc_msgSend___SCNetworkServiceWithInterfaceName_(self, v30, (uint64_t)v46, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startEventMonitoring(v33, v34, v35, v36, v37);
  objc_msgSend___EAP8021XWithInterfaceName_(self, v38, (uint64_t)v46, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startEventMonitoring(v41, v42, v43, v44, v45);

}

- (void)__stopMonitoringDefaultEventIDsForInterfaceName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;

  v46 = a3;
  objc_msgSend___apple80211WithInterfaceName_(self, v4, (uint64_t)v46, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v8, 191, (uint64_t)v46, v9);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v8, 4, (uint64_t)v46, v9);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v10, 3, (uint64_t)v46, v11);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v12, 20, (uint64_t)v46, v13);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v14, 76, (uint64_t)v46, v15);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v16, 70, (uint64_t)v46, v17);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v18, 71, (uint64_t)v46, v19);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v20, 80, (uint64_t)v46, v21);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v22, 39, (uint64_t)v46, v23);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v24, 17, (uint64_t)v46, v25);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v26, 12, (uint64_t)v46, v27);
  objc_msgSend_stopMonitoringEventWithType_interfaceName_(v7, v28, 13, (uint64_t)v46, v29);
  objc_msgSend___SCNetworkServiceWithInterfaceName_(self, v30, (uint64_t)v46, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopEventMonitoring(v33, v34, v35, v36, v37);
  objc_msgSend___EAP8021XWithInterfaceName_(self, v38, (uint64_t)v46, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopEventMonitoring(v41, v42, v43, v44, v45);

}

- (id)__wifiInterfaceNames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend_allKeys(self->_apple80211Map, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_mutableCopy(v5, v6, v7, v8, v9);

  objc_msgSend_removeObject_(v10, v11, (uint64_t)&stru_1E613B710, v12, v13);
  return v10;
}

- (id)wifiInterfaceNames
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EAA0;
  v10 = sub_1B063EA18;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A5958;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)__interfaceNames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend_allKeys(self->_apple80211Map, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_mutableCopy(v6, v7, v8, v9, v10);

  objc_msgSend_removeObject_(v11, v12, (uint64_t)&stru_1E613B710, v13, v14);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend_allValues(self->_apple80211Map, v15, v16, v17, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v21)
  {
    v26 = v21;
    v27 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v19);
        v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend_virtualInterfaceRole(v29, v22, v23, v24, v25))
        {
          objc_msgSend_interfaceName(v29, v22, v23, v24, v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObject_(v11, v31, (uint64_t)v30, v32, v33);

        }
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v35, (uint64_t)v39, 16);
    }
    while (v26);
  }

  return v11;
}

- (id)interfaceNames
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EAA0;
  v10 = sub_1B063EA18;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A5BB8;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)__virtualInterfaceNames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend_allKeys(self->_apple80211Map, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_mutableCopy(v6, v7, v8, v9, v10);

  objc_msgSend_removeObject_(v11, v12, (uint64_t)&stru_1E613B710, v13, v14);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend_allValues(self->_apple80211Map, v15, v16, v17, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v21)
  {
    v26 = v21;
    v27 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v19);
        v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (!objc_msgSend_virtualInterfaceRole(v29, v22, v23, v24, v25))
        {
          objc_msgSend_interfaceName(v29, v22, v23, v24, v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObject_(v11, v31, (uint64_t)v30, v32, v33);

        }
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v35, (uint64_t)v39, 16);
    }
    while (v26);
  }

  return v11;
}

- (id)virtualInterfaceNames
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EAA0;
  v10 = sub_1B063EA18;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A5E18;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)__updateMonitoring:(BOOL)a3 eventIDs:(id)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  uint64_t v117;

  v4 = a3;
  v117 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v112, (uint64_t)v116, 16);
  if (v8)
  {
    v13 = v8;
    v14 = *(_QWORD *)v113;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v113 != v14)
          objc_enumerationMutation(v6);
        v16 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
        v17 = objc_msgSend_type(v16, v9, v10, v11, v12);
        if (v17 > 30)
        {
          if ((unint64_t)(v17 - 35) < 2)
          {
LABEL_13:
            objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend___SCNetworkInterfaceWithInterfaceName_(self, v41, (uint64_t)v40, v42, v43);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v4)
              objc_msgSend_startEventMonitoring(v22, v44, v45, v46, v47);
            else
              objc_msgSend_stopEventMonitoring(v22, v44, v45, v46, v47);
          }
          else
          {
            if (v17 == 31)
            {
              objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___apple80211WithInterfaceName_(self, v105, (uint64_t)v104, v106, v107);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_interfaceName(v16, v108, v109, v110, v111);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v22;
              v31 = 20;
            }
            else
            {
              if (v17 != 37)
                continue;
              objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___apple80211WithInterfaceName_(self, v33, (uint64_t)v32, v34, v35);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_interfaceName(v16, v36, v37, v38, v39);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v22;
              v31 = 63;
            }
LABEL_24:
            if (v4)
              objc_msgSend_startMonitoringEventWithType_interfaceName_(v30, v27, v31, (uint64_t)v29, v28);
            else
              objc_msgSend_stopMonitoringEventWithType_interfaceName_(v30, v27, v31, (uint64_t)v29, v28);

          }
        }
        else
        {
          switch(v17)
          {
            case 1:
              objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___apple80211WithInterfaceName_(self, v19, (uint64_t)v18, v20, v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_interfaceName(v16, v23, v24, v25, v26);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v22;
              v31 = 1;
              goto LABEL_24;
            case 2:
              objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___apple80211WithInterfaceName_(self, v57, (uint64_t)v56, v58, v59);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_interfaceName(v16, v60, v61, v62, v63);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v22;
              v31 = 2;
              goto LABEL_24;
            case 4:
              objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___apple80211WithInterfaceName_(self, v65, (uint64_t)v64, v66, v67);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_interfaceName(v16, v68, v69, v70, v71);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v22;
              v31 = 11;
              goto LABEL_24;
            case 5:
              objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___apple80211WithInterfaceName_(self, v73, (uint64_t)v72, v74, v75);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_interfaceName(v16, v76, v77, v78, v79);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v22;
              v31 = 15;
              goto LABEL_24;
            case 8:
              objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___apple80211WithInterfaceName_(self, v81, (uint64_t)v80, v82, v83);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_interfaceName(v16, v84, v85, v86, v87);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v22;
              v31 = 8;
              goto LABEL_24;
            case 15:
              objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___apple80211WithInterfaceName_(self, v49, (uint64_t)v48, v50, v51);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_interfaceName(v16, v52, v53, v54, v55);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v22;
              v31 = 67;
              goto LABEL_24;
            case 16:
              objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___apple80211WithInterfaceName_(self, v89, (uint64_t)v88, v90, v91);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_interfaceName(v16, v92, v93, v94, v95);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v22;
              v31 = 68;
              goto LABEL_24;
            case 17:
              objc_msgSend_interfaceName(v16, v9, v10, v11, v12);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend___apple80211WithInterfaceName_(self, v97, (uint64_t)v96, v98, v99);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_interfaceName(v16, v100, v101, v102, v103);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v22;
              v31 = 46;
              goto LABEL_24;
            case 19:
            case 20:
              goto LABEL_13;
            default:
              continue;
          }
        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v112, (uint64_t)v116, 16);
    }
    while (v13);
  }

}

- (id)__linkDownStatusWithInterfaceName:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  CWFXPCRequestProxy *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1B063EAA0;
  v17 = sub_1B063EA18;
  v18 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A6390;
  block[3] = &unk_1E6134148;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__autojoinStatusWithInterfaceName:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  CWFXPCRequestProxy *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1B063EAA0;
  v17 = sub_1B063EA18;
  v18 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A64CC;
  block[3] = &unk_1E6134148;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__joinStatusWithInterfaceName:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  CWFXPCRequestProxy *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1B063EAA0;
  v17 = sub_1B063EA18;
  v18 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A660C;
  block[3] = &unk_1E6134148;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__roamStatusWithInterfaceName:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  CWFXPCRequestProxy *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1B063EAA0;
  v17 = sub_1B063EA18;
  v18 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A6748;
  block[3] = &unk_1E6134148;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__linkQualityMetricWithInterfaceName:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  CWFXPCRequestProxy *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1B063EAA0;
  v17 = sub_1B063EA18;
  v18 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A6884;
  block[3] = &unk_1E6134148;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__linkDownNetworkWithInterfaceName:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  CWFXPCRequestProxy *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1B063EAA0;
  v17 = sub_1B063EA18;
  v18 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A69C0;
  block[3] = &unk_1E6134148;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)__cachedKnownNetwork
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EAA0;
  v10 = sub_1B063EA18;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A6ADC;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)__setCachedKnownNetwork:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mutexQueue = self->_mutexQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1B06A6BA0;
  v7[3] = &unk_1E61333E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(mutexQueue, v7);

}

- (void)__setLinkDownStatus:(id)a3 interfaceName:(id)a4
{
  id v6;
  id v7;
  NSObject *mutexQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CWFXPCRequestProxy *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A6C8C;
  block[3] = &unk_1E6133340;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(mutexQueue, block);

}

- (void)__setJoinStatus:(id)a3 interfaceName:(id)a4
{
  id v6;
  id v7;
  NSObject *mutexQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CWFXPCRequestProxy *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A6DB4;
  block[3] = &unk_1E6133340;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(mutexQueue, block);

}

- (void)__setAutoJoinStatus:(id)a3 interfaceName:(id)a4
{
  id v6;
  id v7;
  NSObject *mutexQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CWFXPCRequestProxy *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A6EB8;
  block[3] = &unk_1E6133340;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(mutexQueue, block);

}

- (void)__setRoamStatus:(id)a3 interfaceName:(id)a4
{
  id v6;
  id v7;
  NSObject *mutexQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CWFXPCRequestProxy *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A6FC0;
  block[3] = &unk_1E6133340;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(mutexQueue, block);

}

- (void)__setupEventHandlersWithInterfaceName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[4];
  id v51;
  CWFXPCRequestProxy *v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[4];
  id v56;
  CWFXPCRequestProxy *v57;

  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_apple80211Map, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (v8)
  {
    objc_msgSend_eventHandler(v8, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = sub_1B062950C;
      v55[3] = &unk_1E6134260;
      v56 = v4;
      v57 = self;
      objc_msgSend_setEventHandler_(v13, v15, (uint64_t)v55, v16, v17);

    }
  }
  objc_msgSend___SCNetworkServiceWithInterfaceName_(self, v9, (uint64_t)v4, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v18;
  if (v18)
  {
    objc_msgSend_eventHandler(v18, v19, v20, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = sub_1B06A755C;
      v53[3] = &unk_1E6134288;
      v53[4] = self;
      v54 = v4;
      objc_msgSend_setEventHandler_(v23, v25, (uint64_t)v53, v26, v27);

    }
  }
  objc_msgSend___SCNetworkInterfaceWithInterfaceName_(self, v19, (uint64_t)v4, v21, v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v28;
  if (v28)
  {
    objc_msgSend_eventHandler(v28, v29, v30, v31, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = sub_1B06A7BC0;
      v50[3] = &unk_1E61342B0;
      v51 = v4;
      v52 = self;
      objc_msgSend_setEventHandler_(v33, v35, (uint64_t)v50, v36, v37);

    }
  }
  objc_msgSend___EAP8021XWithInterfaceName_(self, v29, (uint64_t)v4, v31, v32);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v38;
  if (v38)
  {
    objc_msgSend_eventHandler(v38, v39, v40, v41, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = sub_1B06A7F74;
      v48[3] = &unk_1E61342D8;
      v48[4] = self;
      v49 = v4;
      objc_msgSend_setEventHandler_(v43, v45, (uint64_t)v48, v46, v47);

    }
  }

}

- (void)__updateWiFiNetworkServices
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A80F4;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_async(mutexQueue, block);
}

- (void)__updateWiFiNetworkInterfaces:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  __uint64_t v8;
  NSObject *interfaceQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD *v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;

  v6 = a3;
  v7 = a4;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v43[3] = v8;
  v47[3] = v8;
  v51[3] = v8;
  v55[3] = v8;
  v38[3] = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  interfaceQueue = self->_interfaceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A8698;
  block[3] = &unk_1E6134328;
  v16 = &v37;
  v17 = v35;
  v18 = v31;
  v19 = v30;
  v20 = v29;
  v21 = v34;
  v22 = v33;
  v23 = v32;
  v24 = &v46;
  v25 = &v50;
  v26 = &v54;
  v27 = &v42;
  v28 = v41;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = v36;
  v10 = v7;
  v11 = v6;
  dispatch_async(interfaceQueue, block);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
}

- (void)__setupEventHandlers
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  __uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  int v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1B06AA578;
  v28[3] = &unk_1E6134350;
  objc_copyWeak(&v29, &location);
  objc_msgSend_setEventHandler_(self->_keventMonitor, v4, (uint64_t)v28, v5, v6);
  v26[0] = v3;
  v26[1] = 3221225472;
  v26[2] = sub_1B06AABB0;
  v26[3] = &unk_1E6134378;
  objc_copyWeak(&v27, &location);
  objc_msgSend_setEventHandler_(self->_IO80211, v7, (uint64_t)v26, v8, v9);
  v24[0] = v3;
  v24[1] = 3221225472;
  v24[2] = sub_1B06AAEF4;
  v24[3] = &unk_1E61343A0;
  objc_copyWeak(&v25, &location);
  objc_msgSend_setEventHandler_(self->_SCNetworkConfiguration, v10, (uint64_t)v24, v11, v12);
  v22[0] = v3;
  v22[1] = 3221225472;
  v22[2] = sub_1B06AB928;
  v22[3] = &unk_1E61343C8;
  objc_copyWeak(&v23, &location);
  objc_msgSend_setEventHandler_(self->_SCNetworkReachability, v13, (uint64_t)v22, v14, v15);
  v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  CWFGetOSLog();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    CWFGetOSLog();
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 134219010;
    v32 = v16 / 0x3B9ACA00;
    v33 = 2048;
    v34 = v16 % 0x3B9ACA00 / 0x3E8;
    v35 = 2082;
    v36 = "-[CWFXPCRequestProxy __setupEventHandlers]";
    v37 = 2082;
    v38 = "CWFXPCRequestProxy.m";
    v39 = 1024;
    v40 = 3067;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend___updateWiFiNetworkInterfaces_reply_(self, v20, (uint64_t)CFSTR("Initial update"), 0, v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)__addJoinStatusWithScanResult:(id)a3 knownNetworkProfile:(id)a4 isAutoJoin:(BOOL)a5 interfaceName:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  CWFJoinStatus *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  CWFXPCEvent *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *eventQueue;
  CWFXPCEvent *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD block[5];
  CWFXPCEvent *v67;
  const __CFString *v68;
  _QWORD v69[2];

  v6 = a5;
  v69[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(CWFJoinStatus);
  objc_msgSend_date(MEMORY[0x1E0C99D68], v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartedAt_(v13, v19, (uint64_t)v18, v20, v21);

  objc_msgSend_setScanResult_(v13, v22, (uint64_t)v12, v23, v24);
  objc_msgSend_setKnownNetworkProfile_(v13, v25, (uint64_t)v11, v26, v27);

  objc_msgSend_setInterfaceName_(v13, v28, (uint64_t)v10, v29, v30);
  objc_msgSend_setAutoJoin_(v13, v31, v6, v32, v33);
  objc_msgSend_setObject_forKeyedSubscript_(self->_mutableJoinStatusMap, v34, (uint64_t)v13, (uint64_t)v10, v35);
  v36 = objc_alloc_init(CWFXPCEvent);
  objc_msgSend_setType_(v36, v37, 13, v38, v39);
  objc_msgSend_setInterfaceName_(v36, v40, (uint64_t)v10, v41, v42);
  objc_msgSend_startedAt(v13, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimestamp_(v36, v48, (uint64_t)v47, v49, v50);

  v68 = CFSTR("JoinStatus");
  v55 = (void *)objc_msgSend_copy(v13, v51, v52, v53, v54);
  v69[0] = v55;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v56, (uint64_t)v69, (uint64_t)&v68, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInfo_(v36, v58, (uint64_t)v57, v59, v60);

  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06ABBD0;
  block[3] = &unk_1E61333E0;
  block[4] = self;
  v67 = v36;
  v62 = v36;
  dispatch_async(eventQueue, block);
  objc_msgSend___updateAutoJoinStatusWithJoin_(self, v63, (uint64_t)v10, v64, v65);

}

- (void)__updateJoinStatusWithAssoc:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CWFXPCEvent *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *eventQueue;
  CWFXPCEvent *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD block[5];
  CWFXPCEvent *v54;
  const __CFString *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (v8)
  {
    objc_msgSend_associationEndedAt(v8, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend_date(MEMORY[0x1E0C99D68], v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAssociationEndedAt_(v13, v20, (uint64_t)v19, v21, v22);
      v23 = objc_alloc_init(CWFXPCEvent);
      objc_msgSend_setType_(v23, v24, 13, v25, v26);
      objc_msgSend_setInterfaceName_(v23, v27, (uint64_t)v4, v28, v29);
      objc_msgSend_associationEndedAt(v13, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimestamp_(v23, v35, (uint64_t)v34, v36, v37);

      v55 = CFSTR("JoinStatus");
      v42 = (void *)objc_msgSend_copy(v13, v38, v39, v40, v41);
      v56[0] = v42;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v43, (uint64_t)v56, (uint64_t)&v55, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v23, v45, (uint64_t)v44, v46, v47);

      eventQueue = self->_eventQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06ABDEC;
      block[3] = &unk_1E61333E0;
      block[4] = self;
      v54 = v23;
      v49 = v23;
      dispatch_async(eventQueue, block);
      objc_msgSend___updateAutoJoinStatusWithJoin_(self, v50, (uint64_t)v4, v51, v52);

    }
  }

}

- (void)__updateJoinStatusWithError:(id)a3 interaceName:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  CWFXPCEvent *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *eventQueue;
  CWFXPCEvent *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD block[5];
  CWFXPCEvent *v60;
  const __CFString *v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v8, (uint64_t)v7, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v11;
  if (v6 && v11)
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v12, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_associationEndedAt(v16, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      objc_msgSend_setAssociationEndedAt_(v16, v23, (uint64_t)v17, v24, v25);
    objc_msgSend_setError_(v16, v23, (uint64_t)v6, v24, v25);
    objc_msgSend_setEndedAt_(v16, v26, (uint64_t)v17, v27, v28);
    v29 = objc_alloc_init(CWFXPCEvent);
    objc_msgSend_setType_(v29, v30, 13, v31, v32);
    objc_msgSend_setInterfaceName_(v29, v33, (uint64_t)v7, v34, v35);
    objc_msgSend_associationEndedAt(v16, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimestamp_(v29, v41, (uint64_t)v40, v42, v43);

    v61 = CFSTR("JoinStatus");
    v48 = (void *)objc_msgSend_copy(v16, v44, v45, v46, v47);
    v62[0] = v48;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v49, (uint64_t)v62, (uint64_t)&v61, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v29, v51, (uint64_t)v50, v52, v53);

    eventQueue = self->_eventQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B06AC034;
    block[3] = &unk_1E61333E0;
    block[4] = self;
    v60 = v29;
    v55 = v29;
    dispatch_async(eventQueue, block);
    objc_msgSend___updateAutoJoinStatusWithJoin_(self, v56, (uint64_t)v7, v57, v58);

  }
}

- (void)__updateJoinStatusWithIPv4:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  __uint64_t v46;
  void *v47;
  NSObject *v48;
  id v49;
  CWFXPCEvent *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *eventQueue;
  CWFXPCEvent *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  _QWORD block[5];
  CWFXPCEvent *v78;
  const __CFString *v79;
  void *v80;
  int v81;
  unint64_t v82;
  __int16 v83;
  unint64_t v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  id v92;
  __int16 v93;
  int v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v8, v9, v10, v11);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___SCNetworkServiceWithInterfaceName_(self, v13, (uint64_t)v4, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_IPv4Addresses(v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_IPv4Router(v16, v22, v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v75 = (void *)v26;
    if (v21 && v26)
    {
      objc_msgSend_IPv4AssignedAt(v12, v27, v28, v29, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v31 = 0;
      }
      else
      {
        objc_msgSend_setIPv4AssignedAt_(v12, v27, (uint64_t)v76, v29, v30);
        v31 = 1;
      }
    }
    objc_msgSend_IPv4InterfaceName(self->_SCNetworkConfiguration, v27, v28, v29, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v33;
    if (v33)
    {
      if (objc_msgSend_isEqualToString_(v33, v34, (uint64_t)v4, v35, v36))
      {
        objc_msgSend_IPv4PrimaryAt(v12, v38, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
        {
          objc_msgSend_setIPv4PrimaryAt_(v12, v43, (uint64_t)v76, v44, v45);
          v31 = 1;
        }
      }
    }
    v46 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      CWFGetOSLog();
      v48 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = MEMORY[0x1E0C81028];
      v49 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v81 = 134220034;
      v82 = v46 / 0x3B9ACA00;
      v83 = 2048;
      v84 = v46 % 0x3B9ACA00 / 0x3E8;
      v85 = 2082;
      v86 = "-[CWFXPCRequestProxy __updateJoinStatusWithIPv4:]";
      v87 = 2082;
      v88 = "CWFXPCRequestProxy.m";
      v89 = 1024;
      v90 = 3189;
      v91 = 2114;
      v92 = v4;
      v93 = 1024;
      v94 = v31;
      v95 = 2114;
      v96 = v21;
      v97 = 2114;
      v98 = v75;
      _os_log_send_and_compose_impl();
    }

    if (v31)
    {
      v50 = objc_alloc_init(CWFXPCEvent);
      objc_msgSend_setType_(v50, v51, 13, v52, v53);
      objc_msgSend_setInterfaceName_(v50, v54, (uint64_t)v4, v55, v56);
      objc_msgSend_setTimestamp_(v50, v57, (uint64_t)v76, v58, v59);
      v79 = CFSTR("JoinStatus");
      v64 = (void *)objc_msgSend_copy(v12, v60, v61, v62, v63);
      v80 = v64;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v65, (uint64_t)&v80, (uint64_t)&v79, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v50, v67, (uint64_t)v66, v68, v69);

      eventQueue = self->_eventQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06AC434;
      block[3] = &unk_1E61333E0;
      block[4] = self;
      v78 = v50;
      v71 = v50;
      dispatch_async(eventQueue, block);
      objc_msgSend___updateAutoJoinStatusWithJoin_(self, v72, (uint64_t)v4, v73, v74);

    }
  }

}

- (void)__updateJoinStatusWithIPv6:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  __uint64_t v46;
  void *v47;
  NSObject *v48;
  id v49;
  CWFXPCEvent *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *eventQueue;
  CWFXPCEvent *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  _QWORD block[5];
  CWFXPCEvent *v78;
  const __CFString *v79;
  void *v80;
  int v81;
  unint64_t v82;
  __int16 v83;
  unint64_t v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  id v92;
  __int16 v93;
  int v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v8, v9, v10, v11);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___SCNetworkServiceWithInterfaceName_(self, v13, (uint64_t)v4, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_IPv6Addresses(v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_IPv6Router(v16, v22, v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v75 = (void *)v26;
    if (v21 && v26)
    {
      objc_msgSend_IPv6AssignedAt(v12, v27, v28, v29, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v31 = 0;
      }
      else
      {
        objc_msgSend_setIPv6AssignedAt_(v12, v27, (uint64_t)v76, v29, v30);
        v31 = 1;
      }
    }
    objc_msgSend_IPv4InterfaceName(self->_SCNetworkConfiguration, v27, v28, v29, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v33;
    if (v33)
    {
      if (objc_msgSend_isEqualToString_(v33, v34, (uint64_t)v4, v35, v36))
      {
        objc_msgSend_IPv6PrimaryAt(v12, v38, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
        {
          objc_msgSend_setIPv6PrimaryAt_(v12, v43, (uint64_t)v76, v44, v45);
          v31 = 1;
        }
      }
    }
    v46 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      CWFGetOSLog();
      v48 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = MEMORY[0x1E0C81028];
      v49 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v81 = 134220034;
      v82 = v46 / 0x3B9ACA00;
      v83 = 2048;
      v84 = v46 % 0x3B9ACA00 / 0x3E8;
      v85 = 2082;
      v86 = "-[CWFXPCRequestProxy __updateJoinStatusWithIPv6:]";
      v87 = 2082;
      v88 = "CWFXPCRequestProxy.m";
      v89 = 1024;
      v90 = 3237;
      v91 = 2114;
      v92 = v4;
      v93 = 1024;
      v94 = v31;
      v95 = 2114;
      v96 = v21;
      v97 = 2114;
      v98 = v75;
      _os_log_send_and_compose_impl();
    }

    if (v31)
    {
      v50 = objc_alloc_init(CWFXPCEvent);
      objc_msgSend_setType_(v50, v51, 13, v52, v53);
      objc_msgSend_setInterfaceName_(v50, v54, (uint64_t)v4, v55, v56);
      objc_msgSend_setTimestamp_(v50, v57, (uint64_t)v76, v58, v59);
      v79 = CFSTR("JoinStatus");
      v64 = (void *)objc_msgSend_copy(v12, v60, v61, v62, v63);
      v80 = v64;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v65, (uint64_t)&v80, (uint64_t)&v79, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v50, v67, (uint64_t)v66, v68, v69);

      eventQueue = self->_eventQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06AC834;
      block[3] = &unk_1E61333E0;
      block[4] = self;
      v78 = v50;
      v71 = v50;
      dispatch_async(eventQueue, block);
      objc_msgSend___updateAutoJoinStatusWithJoin_(self, v72, (uint64_t)v4, v73, v74);

    }
  }

}

- (void)__updateJoinStatusWithAuth:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CWFXPCEvent *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *eventQueue;
  CWFXPCEvent *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD block[5];
  CWFXPCEvent *v54;
  const __CFString *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (v8)
  {
    objc_msgSend_authenticationEndedAt(v8, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend_date(MEMORY[0x1E0C99D68], v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAuthenticationEndedAt_(v13, v20, (uint64_t)v19, v21, v22);
      v23 = objc_alloc_init(CWFXPCEvent);
      objc_msgSend_setType_(v23, v24, 13, v25, v26);
      objc_msgSend_setInterfaceName_(v23, v27, (uint64_t)v4, v28, v29);
      objc_msgSend_authenticationEndedAt(v13, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimestamp_(v23, v35, (uint64_t)v34, v36, v37);

      v55 = CFSTR("JoinStatus");
      v42 = (void *)objc_msgSend_copy(v13, v38, v39, v40, v41);
      v56[0] = v42;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v43, (uint64_t)v56, (uint64_t)&v55, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v23, v45, (uint64_t)v44, v46, v47);

      eventQueue = self->_eventQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06ACA50;
      block[3] = &unk_1E61333E0;
      block[4] = self;
      v54 = v23;
      v49 = v23;
      dispatch_async(eventQueue, block);
      objc_msgSend___updateAutoJoinStatusWithJoin_(self, v50, (uint64_t)v4, v51, v52);

    }
  }

}

- (void)__updateJoinStatusWithLinkUp:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  CWFXPCEvent *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *eventQueue;
  CWFXPCEvent *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD block[5];
  CWFXPCEvent *v57;
  const __CFString *v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (v8)
  {
    objc_msgSend_linkUpAt(v8, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend_date(MEMORY[0x1E0C99D68], v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLinkUpAt_(v13, v20, (uint64_t)v19, v21, v22);
      objc_msgSend_setEndedAt_(v13, v23, (uint64_t)v19, v24, v25);
      v26 = objc_alloc_init(CWFXPCEvent);
      objc_msgSend_setType_(v26, v27, 13, v28, v29);
      objc_msgSend_setInterfaceName_(v26, v30, (uint64_t)v4, v31, v32);
      objc_msgSend_associationEndedAt(v13, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimestamp_(v26, v38, (uint64_t)v37, v39, v40);

      v58 = CFSTR("JoinStatus");
      v45 = (void *)objc_msgSend_copy(v13, v41, v42, v43, v44);
      v59[0] = v45;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v46, (uint64_t)v59, (uint64_t)&v58, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v26, v48, (uint64_t)v47, v49, v50);

      eventQueue = self->_eventQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06ACC78;
      block[3] = &unk_1E61333E0;
      block[4] = self;
      v57 = v26;
      v52 = v26;
      dispatch_async(eventQueue, block);
      objc_msgSend___updateAutoJoinStatusWithJoin_(self, v53, (uint64_t)v4, v54, v55);

    }
  }

}

- (void)__updateJoinStatusWithEAP8021X:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  CWFXPCEvent *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *eventQueue;
  CWFXPCEvent *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD block[5];
  CWFXPCEvent *v99;
  const __CFString *v100;
  _QWORD v101[2];

  v101[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend___EAP8021XWithInterfaceName_(self, v8, (uint64_t)v4, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_supplicantState_(v12, v13, 0, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_unsignedIntValue(v16, v17, v18, v19, v20);

    objc_msgSend_controlMode_(v12, v22, 0, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_unsignedIntValue(v25, v26, v27, v28, v29);

    objc_msgSend_controlState_(v12, v31, 0, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_unsignedIntValue(v34, v35, v36, v37, v38);

    objc_msgSend_clientStatus_(v12, v40, 0, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_intValue(v43, v44, v45, v46, v47);

    if ((_DWORD)v21 != objc_msgSend_EAP8021XSupplicantState(v11, v49, v50, v51, v52)
      || (_DWORD)v30 != objc_msgSend_EAP8021XControlMode(v11, v53, v54, v55, v56)
      || (_DWORD)v39 != objc_msgSend_EAP8021XControlState(v11, v53, v57, v55, v56)
      || (_DWORD)v48 != objc_msgSend_EAP8021XClientStatus(v11, v53, v58, v55, v56))
    {
      objc_msgSend_setEAP8021XSupplicantState_(v11, v53, v21, v55, v56);
      objc_msgSend_setEAP8021XControlMode_(v11, v59, v30, v60, v61);
      objc_msgSend_setEAP8021XControlState_(v11, v62, v39, v63, v64);
      objc_msgSend_setEAP8021XClientStatus_(v11, v65, v48, v66, v67);
      v68 = objc_alloc_init(CWFXPCEvent);
      objc_msgSend_setType_(v68, v69, 13, v70, v71);
      objc_msgSend_setInterfaceName_(v68, v72, (uint64_t)v4, v73, v74);
      objc_msgSend_date(MEMORY[0x1E0C99D68], v75, v76, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimestamp_(v68, v80, (uint64_t)v79, v81, v82);

      v100 = CFSTR("JoinStatus");
      v87 = (void *)objc_msgSend_copy(v11, v83, v84, v85, v86);
      v101[0] = v87;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v88, (uint64_t)v101, (uint64_t)&v100, 1);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v68, v90, (uint64_t)v89, v91, v92);

      eventQueue = self->_eventQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06ACF68;
      block[3] = &unk_1E61333E0;
      block[4] = self;
      v99 = v68;
      v94 = v68;
      dispatch_async(eventQueue, block);
      objc_msgSend___updateAutoJoinStatusWithJoin_(self, v95, (uint64_t)v4, v96, v97);

    }
  }

}

- (void)__updateAutoJoinStatusWithJoin:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  char isEqual;
  unint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  CWFXPCEvent *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *eventQueue;
  CWFXPCEvent *v140;
  unint64_t v141;
  _QWORD block[5];
  CWFXPCEvent *v143;
  const __CFString *v144;
  _QWORD v145[2];

  v145[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableAutoJoinStatusMap, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(self->_mutableJoinStatusMap, v9, (uint64_t)v4, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12;
  if (v8)
    v18 = v12 == 0;
  else
    v18 = 1;
  if (!v18)
  {
    objc_msgSend_startedAt(v12, v13, v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v19, v20, v21, v22, v23);
    v25 = v24;
    objc_msgSend_startedAt(v8, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v30, v31, v32, v33, v34);
    if (v25 >= v39)
    {
      objc_msgSend_endedAt(v8, v35, v36, v37, v38);
      v40 = objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v45 = (void *)v40;
        objc_msgSend_startedAt(v17, v41, v42, v43, v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v46, v47, v48, v49, v50);
        v52 = v51;
        objc_msgSend_endedAt(v8, v53, v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v57, v58, v59, v60, v61);
        v63 = v62;

        if (v52 > v63)
          goto LABEL_24;
      }
      else
      {

      }
      objc_msgSend_joinAttempts(v8, v64, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend_mutableCopy(v68, v69, v70, v71, v72);

      if (!v19)
      {
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v73, v74, v75, v76);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v77 = objc_msgSend_count(v19, v73, v74, v75, v76);
      if (objc_msgSend_count(v19, v78, v79, v80, v81))
      {
        v141 = v77;
        v86 = 0;
        while (1)
        {
          objc_msgSend_objectAtIndexedSubscript_(v19, v82, v86, v84, v85, v141);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUID(v87, v88, v89, v90, v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUID(v17, v93, v94, v95, v96);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v92, v98, (uint64_t)v97, v99, v100);

          if ((isEqual & 1) != 0)
            break;
          if (++v86 >= (unint64_t)objc_msgSend_count(v19, v82, v83, v84, v85))
          {
            v77 = v141;
            goto LABEL_19;
          }
        }
        v77 = v86;
      }
LABEL_19:
      v102 = objc_msgSend_count(v19, v82, v83, v84, v85);
      v110 = (void *)objc_msgSend_copy(v17, v103, v104, v105, v106);
      if (v77 >= v102)
        objc_msgSend_addObject_(v19, v107, (uint64_t)v110, v108, v109);
      else
        objc_msgSend_replaceObjectAtIndex_withObject_(v19, v107, v77, (uint64_t)v110, v109);

      objc_msgSend_setJoinAttempts_(v8, v111, (uint64_t)v19, v112, v113);
      v114 = objc_alloc_init(CWFXPCEvent);
      objc_msgSend_setType_(v114, v115, 12, v116, v117);
      objc_msgSend_setInterfaceName_(v114, v118, (uint64_t)v4, v119, v120);
      objc_msgSend_date(MEMORY[0x1E0C99D68], v121, v122, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimestamp_(v114, v126, (uint64_t)v125, v127, v128);

      v144 = CFSTR("AutoJoinStatus");
      objc_msgSend_deepCopy(v8, v129, v130, v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v145[0] = v133;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v134, (uint64_t)v145, (uint64_t)&v144, 1);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v114, v136, (uint64_t)v135, v137, v138);

      eventQueue = self->_eventQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06AD330;
      block[3] = &unk_1E61333E0;
      block[4] = self;
      v143 = v114;
      v140 = v114;
      dispatch_async(eventQueue, block);

    }
    else
    {

    }
  }
LABEL_24:

}

- (void)__autoJoinStartedWithTrigger:(int64_t)a3 interfaceName:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  CWFAutoJoinStatus *v23;

  v6 = a4;
  v23 = objc_alloc_init(CWFAutoJoinStatus);
  objc_msgSend_date(MEMORY[0x1E0C99D68], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStartedAt_(v23, v12, (uint64_t)v11, v13, v14);

  objc_msgSend_setTrigger_(v23, v15, a3, v16, v17);
  objc_msgSend_setInterfaceName_(v23, v18, (uint64_t)v6, v19, v20);
  objc_msgSend_setObject_forKeyedSubscript_(self->_mutableAutoJoinTriggerMap, v21, (uint64_t)v23, (uint64_t)v6, v22);

}

- (void)__updateAutoJoinState:(int64_t)a3 interfaceName:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  CWFXPCEvent *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *eventQueue;
  CWFXPCEvent *v53;
  _QWORD block[5];
  CWFXPCEvent *v55;
  const __CFString *v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableAutoJoinStatusMap, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_state(v10, v11, v12, v13, v14))
  {
    objc_msgSend_objectForKeyedSubscript_(self->_mutableAutoJoinTriggerMap, v15, (uint64_t)v6, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_setObject_forKeyedSubscript_(self->_mutableAutoJoinStatusMap, v20, v19, (uint64_t)v6, v21);
    objc_msgSend_setObject_forKeyedSubscript_(self->_mutableAutoJoinTriggerMap, v22, 0, (uint64_t)v6, v23);
    v10 = (void *)v19;
  }
  if (v10 && objc_msgSend_state(v10, v15, v16, v17, v18) != a3)
  {
    objc_msgSend_setState_(v10, v24, a3, v25, v26);
    v27 = objc_alloc_init(CWFXPCEvent);
    objc_msgSend_setType_(v27, v28, 12, v29, v30);
    objc_msgSend_setInterfaceName_(v27, v31, (uint64_t)v6, v32, v33);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimestamp_(v27, v39, (uint64_t)v38, v40, v41);

    v56 = CFSTR("AutoJoinStatus");
    objc_msgSend_deepCopy(v10, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v46;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v47, (uint64_t)v57, (uint64_t)&v56, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v27, v49, (uint64_t)v48, v50, v51);

    eventQueue = self->_eventQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B06AD608;
    block[3] = &unk_1E61333E0;
    block[4] = self;
    v55 = v27;
    v53 = v27;
    dispatch_async(eventQueue, block);

  }
}

- (void)__autoJoinEndedWithResult:(BOOL)a3 interfaceName:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  CWFXPCEvent *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *eventQueue;
  CWFXPCEvent *v57;
  _QWORD block[5];
  CWFXPCEvent *v59;
  const __CFString *v60;
  _QWORD v61[2];

  v4 = a3;
  v61[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend_objectForKeyedSubscript_(self->_mutableAutoJoinStatusMap, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  if (v10)
  {
    objc_msgSend_endedAt(v10, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend_setState_(v15, v17, 0, v18, v19);
      objc_msgSend_setResult_(v15, v20, v4, v21, v22);
      objc_msgSend_date(MEMORY[0x1E0C99D68], v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setEndedAt_(v15, v28, (uint64_t)v27, v29, v30);

      v31 = objc_alloc_init(CWFXPCEvent);
      objc_msgSend_setType_(v31, v32, 12, v33, v34);
      objc_msgSend_setInterfaceName_(v31, v35, (uint64_t)v6, v36, v37);
      objc_msgSend_endedAt(v15, v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTimestamp_(v31, v43, (uint64_t)v42, v44, v45);

      v60 = CFSTR("AutoJoinStatus");
      objc_msgSend_deepCopy(v15, v46, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v50;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v51, (uint64_t)v61, (uint64_t)&v60, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v31, v53, (uint64_t)v52, v54, v55);

      eventQueue = self->_eventQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06AD830;
      block[3] = &unk_1E61333E0;
      block[4] = self;
      v59 = v31;
      v57 = v31;
      dispatch_async(eventQueue, block);

    }
  }

}

- (void)__handleWillAssocInternalEvent:(id)a3
{
  id v4;
  NSOperationQueue *defaultQueue;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  CWFXPCRequestProxy *v12;

  v4 = a3;
  defaultQueue = self->_defaultQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B06AD904;
  v10[3] = &unk_1E61333E0;
  v11 = v4;
  v12 = self;
  v6 = v4;
  objc_msgSend_addOperationWithBlock_(defaultQueue, v7, (uint64_t)v10, v8, v9);

}

- (void)__handleAssocDoneInternalEvent:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CWFXPCRequestProxy *v9;

  v4 = a3;
  mutexQueue = self->_mutexQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1B06ADB20;
  v7[3] = &unk_1E61333E0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(mutexQueue, v7);

}

- (void)__handleAutoJoinStateChangedInternalEvent:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CWFXPCRequestProxy *v9;

  v4 = a3;
  mutexQueue = self->_mutexQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1B06ADC68;
  v7[3] = &unk_1E61333E0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(mutexQueue, v7);

}

- (void)__handleKnownNetworkProfileChangedEvent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *mutexQueue;
  id v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSOperationQueue *defaultQueue;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSOperationQueue *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD block[5];
  id v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_info(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("Type"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_integerValue(v13, v14, v15, v16, v17);

  objc_msgSend_objectForKeyedSubscript_(v9, v19, (uint64_t)CFSTR("Profile"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v23, (uint64_t)CFSTR("PreviousProfile"), v24, v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v18)
  {
    case 3:
      objc_msgSend_networkName(v22, v26, v27, v28, v29);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        defaultQueue = self->_defaultQueue;
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = sub_1B06AE16C;
        v69[3] = &unk_1E61333E0;
        v70 = v22;
        v71 = v4;
        objc_msgSend_addOperationWithBlock_(defaultQueue, v48, (uint64_t)v69, v49, v50);

      }
      objc_msgSend_SSID(v22, v43, v44, v45, v46);
      v51 = objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        v52 = (void *)v51;
        if (!qword_1ECFD6AB8)
        {
          v74 = xmmword_1E6134620;
          v75 = 0;
          qword_1ECFD6AB8 = _sl_dlopen();
        }
        v53 = qword_1ECFD6AB8;

        if (v53)
        {
          v54 = self->_defaultQueue;
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = sub_1B06AE29C;
          v67[3] = &unk_1E6133138;
          v68 = v22;
          objc_msgSend_addOperationWithBlock_(v54, v55, (uint64_t)v67, v56, v57);

        }
      }
      break;
    case 2:
      objc_msgSend_apple80211WithVirtualInterfaceRole_parentInterfaceName_(self, v26, 0, 0, v29);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_interfaceName(v58, v59, v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___updateCurrentKnownBSSWithIPConfigurationForInterfaceName_(self, v64, (uint64_t)v63, v65, v66);

      _os_feature_enabled_impl();
      break;
    case 1:
      objc_msgSend_apple80211WithVirtualInterfaceRole_parentInterfaceName_(self, v26, 0, 0, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_interfaceName(v31, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___updateCurrentKnownBSSWithIPConfigurationForInterfaceName_(self, v37, (uint64_t)v36, v38, v39);

      mutexQueue = self->_mutexQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06AE078;
      block[3] = &unk_1E61333E0;
      block[4] = self;
      v73 = v31;
      v41 = v31;
      dispatch_async(mutexQueue, block);

      break;
  }

}

- (id)__currentScanResultWithInterfaceName:(id)a3 forceNoCache:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  dispatch_block_t v7;
  id v8;
  const char *v9;
  dispatch_time_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD v21[3];
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  int v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1B063EAA0;
  v27 = sub_1B063EA18;
  v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6134410);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1B06AE634;
  v17[3] = &unk_1E6134438;
  v19 = &v23;
  v20 = v21;
  v8 = v7;
  v18 = v8;
  objc_msgSend___currentScanResultWithInterfaceName_forceNoCache_reply_(self, v9, (uint64_t)v6, v4, (uint64_t)v17);
  v10 = dispatch_time(0, 4000000000);
  if (dispatch_block_wait(v8, v10))
  {
    CWFGetOSLog();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      CWFGetOSLog();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v29 = 136446978;
      v30 = "-[CWFXPCRequestProxy __currentScanResultWithInterfaceName:forceNoCache:]";
      v31 = 2082;
      v32 = "CWFXPCRequestProxy.m";
      v33 = 1024;
      v34 = 3682;
      v35 = 2048;
      v36 = 4000000000;
      _os_log_send_and_compose_impl();
    }

    v13 = 0;
  }
  else
  {
    v13 = (void *)v24[5];
  }
  v15 = v13;

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v15;
}

- (void)__currentScanResultWithInterfaceName:(id)a3 forceNoCache:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  CWFXPCRequest *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  CWFRequestParameters *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  _QWORD v53[4];
  id v54;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend_delegate(self, v10, v11, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v20, v6, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v19, v24, (uint64_t)v23, (uint64_t)CFSTR("ForceNoCache"), v25);

    v26 = objc_alloc_init(CWFXPCRequest);
    objc_msgSend_setType_(v26, v27, 57, v28, v29);
    objc_msgSend_setInfo_(v26, v30, (uint64_t)v19, v31, v32);
    v33 = objc_alloc_init(CWFRequestParameters);
    objc_msgSend_setInterfaceName_(v33, v34, (uint64_t)v8, v35, v36);
    objc_msgSend_setRequestParameters_(v26, v37, (uint64_t)v33, v38, v39);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReceivedAt_(v26, v45, (uint64_t)v44, v46, v47);

    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = sub_1B06AE8A4;
    v53[3] = &unk_1E6133760;
    v54 = v9;
    objc_msgSend_setResponse_(v26, v48, (uint64_t)v53, v49, v50);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v18, v51, (uint64_t)self, (uint64_t)self->_internalRequestXPCConnection, (uint64_t)v26);

  }
  else if (v9)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v52, 0);

  }
}

- (id)__userAutoJoinDisabled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  dispatch_block_t v7;
  CWFXPCRequest *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  dispatch_time_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD v28[3];
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  int v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1B063EAA0;
  v34 = sub_1B063EA18;
  v35 = 0;
  objc_msgSend_delegate(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6134458);
  v8 = objc_alloc_init(CWFXPCRequest);
  objc_msgSend_setType_(v8, v9, 179, v10, v11);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1B06AEC18;
  v24[3] = &unk_1E61341E8;
  v26 = &v30;
  v27 = v28;
  v12 = v7;
  v25 = v12;
  objc_msgSend_setResponse_(v8, v13, (uint64_t)v24, v14, v15);
  objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v6, v16, (uint64_t)self, (uint64_t)self->_internalRequestXPCConnection, (uint64_t)v8);
  v17 = dispatch_time(0, 4000000000);
  if (!dispatch_block_wait(v12, v17))
  {

    _Block_object_dispose(v28, 8);
LABEL_6:
    v20 = (void *)v31[5];
    goto LABEL_11;
  }
  CWFGetOSLog();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    CWFGetOSLog();
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = MEMORY[0x1E0C81028];
    v21 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v36 = 136446978;
    v37 = "-[CWFXPCRequestProxy __userAutoJoinDisabled]";
    v38 = 2082;
    v39 = "CWFXPCRequestProxy.m";
    v40 = 1024;
    v41 = 3742;
    v42 = 2048;
    v43 = 4000000000;
    _os_log_send_and_compose_impl();
  }

  _Block_object_dispose(v28, 8);
  v20 = 0;
LABEL_11:
  v22 = v20;

  _Block_object_dispose(&v30, 8);
  return v22;
}

- (id)__currentNetworkProfileWithInterfaceName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  dispatch_block_t v10;
  CWFRequestParameters *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFXPCRequest *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  dispatch_time_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  _QWORD *v37;
  _QWORD v38[3];
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  int v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_1B063EAA0;
  v44 = sub_1B063EA18;
  v45 = 0;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_6;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  v10 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6131620);
  v11 = objc_alloc_init(CWFRequestParameters);
  objc_msgSend_setInterfaceName_(v11, v12, (uint64_t)v4, v13, v14);
  v15 = objc_alloc_init(CWFXPCRequest);
  objc_msgSend_setRequestParameters_(v15, v16, (uint64_t)v11, v17, v18);
  objc_msgSend_setType_(v15, v19, 58, v20, v21);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1B06AEFF0;
  v34[3] = &unk_1E61341E8;
  v36 = &v40;
  v37 = v38;
  v22 = v10;
  v35 = v22;
  objc_msgSend_setResponse_(v15, v23, (uint64_t)v34, v24, v25);
  objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v9, v26, (uint64_t)self, (uint64_t)self->_internalRequestXPCConnection, (uint64_t)v15);
  v27 = dispatch_time(0, 4000000000);
  if (!dispatch_block_wait(v22, v27))
  {

    _Block_object_dispose(v38, 8);
LABEL_6:
    v30 = (void *)v41[5];
    goto LABEL_11;
  }
  CWFGetOSLog();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    CWFGetOSLog();
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = MEMORY[0x1E0C81028];
    v31 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v46 = 136446978;
    v47 = "-[CWFXPCRequestProxy __currentNetworkProfileWithInterfaceName:]";
    v48 = 2082;
    v49 = "CWFXPCRequestProxy.m";
    v50 = 1024;
    v51 = 3778;
    v52 = 2048;
    v53 = 4000000000;
    _os_log_send_and_compose_impl();
  }

  _Block_object_dispose(v38, 8);
  v30 = 0;
LABEL_11:
  v32 = v30;

  _Block_object_dispose(&v40, 8);
  return v32;
}

- (id)__knownNetworkProfiles
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  dispatch_block_t v7;
  CWFXPCRequest *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  dispatch_time_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD v28[3];
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  int v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1B063EAA0;
  v34 = sub_1B063EA18;
  v35 = 0;
  objc_msgSend_delegate(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E61318C0);
  v8 = objc_alloc_init(CWFXPCRequest);
  objc_msgSend_setType_(v8, v9, 54, v10, v11);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1B06AF380;
  v24[3] = &unk_1E61341E8;
  v26 = &v30;
  v27 = v28;
  v12 = v7;
  v25 = v12;
  objc_msgSend_setResponse_(v8, v13, (uint64_t)v24, v14, v15);
  objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v6, v16, (uint64_t)self, (uint64_t)self->_internalRequestXPCConnection, (uint64_t)v8);
  v17 = dispatch_time(0, 4000000000);
  if (!dispatch_block_wait(v12, v17))
  {

    _Block_object_dispose(v28, 8);
LABEL_6:
    v20 = (void *)v31[5];
    goto LABEL_11;
  }
  CWFGetOSLog();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    CWFGetOSLog();
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = MEMORY[0x1E0C81028];
    v21 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v36 = 136446978;
    v37 = "-[CWFXPCRequestProxy __knownNetworkProfiles]";
    v38 = 2082;
    v39 = "CWFXPCRequestProxy.m";
    v40 = 1024;
    v41 = 3809;
    v42 = 2048;
    v43 = 4000000000;
    _os_log_send_and_compose_impl();
  }

  _Block_object_dispose(v28, 8);
  v20 = 0;
LABEL_11:
  v22 = v20;

  _Block_object_dispose(&v30, 8);
  return v22;
}

- (BOOL)isNon80211InterfaceName:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  _QWORD block[4];
  id v9;
  CWFXPCRequestProxy *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06AF4D8;
  block[3] = &unk_1E6134148;
  v10 = self;
  v11 = &v12;
  v9 = v4;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  LOBYTE(mutexQueue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)mutexQueue;
}

- (id)__EAP8021XWithInterfaceName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_EAP8021XMap, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      CWFGetOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      _os_log_send_and_compose_impl();

  }
  return v8;
}

- (id)EAP8021XWithInterfaceName:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1B063EAA0;
  v16 = sub_1B063EA18;
  v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06AF79C;
  block[3] = &unk_1E6133698;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)__SCNetworkServiceWithInterfaceName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_SCNetworkServiceMap, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      CWFGetOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      _os_log_send_and_compose_impl();

  }
  return v8;
}

- (id)SCNetworkServiceWithInterfaceName:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1B063EAA0;
  v16 = sub_1B063EA18;
  v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06AFA60;
  block[3] = &unk_1E6133698;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)__SCNetworkInterfaceWithInterfaceName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_SCNetworkInterfaceMap, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      CWFGetOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      _os_log_send_and_compose_impl();

  }
  return v8;
}

- (id)SCNetworkInterfaceWithInterfaceName:(id)a3
{
  id v4;
  NSObject *mutexQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1B063EAA0;
  v16 = sub_1B063EA18;
  v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06AFD24;
  block[3] = &unk_1E6133698;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(mutexQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)__getSystemEventIDs:(id)a3 XPCManager:(id)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  id v29;

  v29 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  objc_msgSend_dictionary(v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registeredEventIDs(v6, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, (uint64_t)CFSTR("Result"), v18);
  objc_msgSend_response(v29, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_response(v29, v24, v25, v26, v27);
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v28)[2](v28, 0, v11);

  }
}

- (void)__getSystemActivities:(id)a3 XPCManager:(id)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  id v29;

  v29 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  objc_msgSend_dictionary(v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registeredActivities(v6, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, (uint64_t)CFSTR("Result"), v18);
  objc_msgSend_response(v29, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_response(v29, v24, v25, v26, v27);
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v28)[2](v28, 0, v11);

  }
}

- (void)__performScan:(id)a3 XPCConnection:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  NSObject *v81;
  id v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  void *v141;
  id v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t j;
  void *v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  CWFXPCRequest *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  NSObject *v197;
  void *v198;
  NSObject *v199;
  id v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  id v210;
  void *v211;
  const char *v212;
  void *v213;
  id v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  void *v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  void (**v242)(_QWORD, _QWORD, _QWORD);
  int *v243;
  uint64_t v244;
  void *v245;
  id v246;
  void *v247;
  id v248;
  CWFXPCRequestProxy *v249;
  void *v250;
  void *v251;
  void *v252;
  _QWORD v253[4];
  id v254;
  id v255;
  id v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  int v265;
  id v266;
  _BYTE v267[128];
  _BYTE v268[128];
  uint64_t v269;

  v269 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_requestParameters(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v18, (uint64_t)v17, v19, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v249 = self;
    objc_msgSend_info(v6, v21, v22, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)CFSTR("ScanParams"), v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      if (!objc_msgSend_scanType(v30, v31, v32, v33, v34))
        objc_msgSend_setScanType_(v30, v35, 1, v37, v38);
      if (!objc_msgSend_BSSType(v30, v35, v36, v37, v38))
        objc_msgSend_setBSSType_(v30, v39, 3, v41, v42);
      if (!objc_msgSend_PHYMode(v30, v39, v40, v41, v42))
        objc_msgSend_setPHYMode_(v30, v43, 1, v45, v46);
      if (!objc_msgSend_numberOfScans(v30, v43, v44, v45, v46))
        objc_msgSend_setNumberOfScans_(v30, v47, 1, v49, v50);
      objc_msgSend_channels(v30, v47, v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v247 = v25;
      v248 = v7;
      if (v51)
      {
        v245 = v17;
        v246 = v6;
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v52, v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v57, v58, v59, v60);
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        v257 = 0u;
        v258 = 0u;
        v259 = 0u;
        v260 = 0u;
        v250 = v30;
        objc_msgSend_channels(v30, v61, v62, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v257, (uint64_t)v267, 16);
        if (v67)
        {
          v68 = v67;
          v69 = *(_QWORD *)v258;
          do
          {
            for (i = 0; i != v68; ++i)
            {
              if (*(_QWORD *)v258 != v69)
                objc_enumerationMutation(v65);
              v71 = *(id *)(*((_QWORD *)&v257 + 1) + 8 * i);
              if (objc_msgSend_width(v71, v72, v73, v74, v75) != 20)
              {
                CWFGetOSLog();
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                if (v80)
                {
                  CWFGetOSLog();
                  v81 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v81 = MEMORY[0x1E0C81028];
                  v82 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
                {
                  v265 = 138543362;
                  v266 = v71;
                  LODWORD(v244) = 12;
                  v243 = &v265;
                  _os_log_send_and_compose_impl();
                }

                v87 = objc_msgSend_channel(v71, v83, v84, v85, v86);
                v92 = objc_msgSend_band(v71, v88, v89, v90, v91);
                objc_msgSend_channelWithNumber_band_width_(CWFChannel, v93, v87, v92, 20);
                v94 = objc_claimAutoreleasedReturnValue();

                v71 = (id)v94;
              }
              v95 = objc_msgSend_band(v71, v76, v77, v78, v79, v243, v244);
              objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v96, v95, v97, v98);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v56, v100, (uint64_t)v99, v101, v102);
              v103 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v103)
              {
                objc_msgSend_set(MEMORY[0x1E0C99E20], v104, v105, v106, v107);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v108, v95, v109, v110);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v56, v112, (uint64_t)v103, (uint64_t)v111, v113);

              }
              v114 = (void *)MEMORY[0x1E0CB37E8];
              v115 = objc_msgSend_channel(v71, v104, v105, v106, v107);
              objc_msgSend_numberWithUnsignedInteger_(v114, v116, v115, v117, v118);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = objc_msgSend_containsObject_(v103, v120, (uint64_t)v119, v121, v122);

              if ((v123 & 1) == 0)
              {
                v128 = (void *)MEMORY[0x1E0CB37E8];
                v129 = objc_msgSend_channel(v71, v124, v125, v126, v127);
                objc_msgSend_numberWithUnsignedInteger_(v128, v130, v129, v131, v132);
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v103, v134, (uint64_t)v133, v135, v136);

                objc_msgSend_addObject_(v252, v137, (uint64_t)v71, v138, v139);
              }

            }
            v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v140, (uint64_t)&v257, (uint64_t)v267, 16);
          }
          while (v68);
        }

        v141 = v250;
        v142 = v252;
        objc_msgSend_setChannels_(v250, v143, (uint64_t)v252, v144, v145);
        v17 = v245;
        v6 = v246;
      }
      else
      {
        objc_msgSend_countryCode_(v25, v52, 0, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_supportedChannelsWithCountryCode_error_(v25, v146, (uint64_t)v56, 0, v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v149, v150, v151, v152);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v261 = 0u;
        v262 = 0u;
        v263 = 0u;
        v264 = 0u;
        v142 = v148;
        v155 = objc_msgSend_countByEnumeratingWithState_objects_count_(v142, v154, (uint64_t)&v261, (uint64_t)v268, 16);
        if (v155)
        {
          v160 = v155;
          v161 = *(_QWORD *)v262;
          do
          {
            for (j = 0; j != v160; ++j)
            {
              if (*(_QWORD *)v262 != v161)
                objc_enumerationMutation(v142);
              v163 = *(void **)(*((_QWORD *)&v261 + 1) + 8 * j);
              if (objc_msgSend_width(v163, v156, v157, v158, v159) == 20
                && (!objc_msgSend_is6GHz(v163, v156, v157, v158, v159)
                 || objc_msgSend_is6GHzPSC(v163, v156, v157, v158, v159)
                 && (objc_msgSend_exclude6GChannels(v30, v156, v157, v158, v159) & 1) == 0)
                && (!objc_msgSend_is6GHz(v163, v156, v157, v158, v159)
                 || objc_msgSend_scanType(v30, v156, v164, v158, v159) != 9))
              {
                objc_msgSend_addObject_(v153, v156, (uint64_t)v163, v158, v159);
              }
            }
            v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(v142, v156, (uint64_t)&v261, (uint64_t)v268, 16);
          }
          while (v160);
        }

        v141 = v30;
        objc_msgSend_setChannels_(v30, v165, (uint64_t)v153, v166, v167);

      }
      v7 = v248;

      v25 = v247;
      self = v249;
LABEL_47:
      objc_msgSend_delegate(self, v168, v169, v170, v171);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      if (v172)
      {
        v173 = objc_alloc_init(CWFXPCRequest);
        objc_msgSend_setType_(v173, v174, 64, v175, v176);
        objc_msgSend_requestParameters(v6, v177, v178, v179, v180);
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRequestParameters_(v173, v182, (uint64_t)v181, v183, v184);

        objc_msgSend_info(v6, v185, v186, v187, v188);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setInfo_(v173, v190, (uint64_t)v189, v191, v192);

        v253[0] = MEMORY[0x1E0C809B0];
        v253[1] = 3221225472;
        v253[2] = sub_1B06B07F0;
        v253[3] = &unk_1E6134480;
        v251 = v141;
        v254 = v141;
        v255 = v6;
        v256 = v25;
        objc_msgSend_setResponse_(v173, v193, (uint64_t)v253, v194, v195);
        CWFGetOSLog();
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        if (v196)
        {
          CWFGetOSLog();
          v197 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v197 = MEMORY[0x1E0C81028];
          v200 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v197, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_info(v173, v201, v202, v203, v204);
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v205, v206, (uint64_t)CFSTR("ScanParams"), v207, v208);
          v209 = v17;
          v210 = v7;
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          v265 = 138543362;
          v266 = v211;
          _os_log_send_and_compose_impl();

          v7 = v210;
          v17 = v209;

        }
        objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v172, v212, (uint64_t)self, (uint64_t)v7, (uint64_t)v173);

        v213 = v254;
        v141 = v251;
      }
      else
      {
        CWFGetOSLog();
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        if (v198)
        {
          CWFGetOSLog();
          v199 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v199 = MEMORY[0x1E0C81028];
          v214 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
        {
          v219 = objc_msgSend_type(v6, v215, v216, v217, v218);
          sub_1B063544C(v219, v220, v221, v222, v223);
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          v265 = 138543362;
          v266 = v224;
          _os_log_send_and_compose_impl();

        }
        objc_msgSend_response(v6, v225, v226, v227, v228);
        v229 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v229)
          goto LABEL_62;
        objc_msgSend_response(v6, v230, v231, v232, v233);
        v173 = (CWFXPCRequest *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v234, *MEMORY[0x1E0CB2FE0], 45, 0);
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(CWFXPCRequest *, void *, _QWORD))v173->super.super._iop.__nextOp)(v173, v213, 0);
      }

LABEL_62:
      v235 = 0;
      goto LABEL_63;
    }
    self = v249;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v31, *MEMORY[0x1E0CB2FE0], 22, 0);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v21, *MEMORY[0x1E0CB2FE0], 6, 0);
  }
  v236 = objc_claimAutoreleasedReturnValue();
  if (!v236)
  {
    v141 = 0;
    goto LABEL_47;
  }
  v235 = (void *)v236;
  objc_msgSend_response(v6, v168, v169, v170, v171);
  v237 = (void *)objc_claimAutoreleasedReturnValue();

  if (v237)
  {
    objc_msgSend_response(v6, v238, v239, v240, v241);
    v242 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v242)[2](v242, v235, 0);

  }
LABEL_63:

}

- (void)__setChannel:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  id v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (**v66)(_QWORD, _QWORD, _QWORD);
  id v67;

  v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_info(v4, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)CFSTR("Channel"), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_apple80211WithInterfaceName_(self, v24, (uint64_t)v14, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v31 = v27;
      objc_msgSend_countryCode_(v27, v28, 0, v29, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_supportedChannelsWithCountryCode_error_(v31, v33, (uint64_t)v32, 0, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_containsObject_(v35, v36, (uint64_t)v23, v37, v38);

      if ((v39 & 1) != 0)
      {
        objc_msgSend_powerOn_(v31, v40, 0, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend_BOOLValue(v43, v44, v45, v46, v47);

        if ((v48 & 1) != 0)
        {
          objc_msgSend_BSSID_(v31, v49, 0, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v52)
          {
            v67 = 0;
            objc_msgSend_setChannel_error_(v31, v53, (uint64_t)v23, (uint64_t)&v67, v54);
            v55 = v67;
LABEL_7:
            v56 = v55;

            goto LABEL_8;
          }
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v53, *MEMORY[0x1E0CB2FE0], 1, 0);
        }
        else
        {
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v49, *MEMORY[0x1E0CB2FE0], 82, 0);
        }
      }
      else
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v40, *MEMORY[0x1E0CB2FE0], 45, 0);
      }
      v55 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v28, *MEMORY[0x1E0CB2FE0], 6, 0);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v24, *MEMORY[0x1E0CB2FE0], 22, 0);
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  objc_msgSend_response(v4, v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend_response(v4, v62, v63, v64, v65);
    v66 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v66)[2](v66, v56, 0);

  }
}

- (void)__getWEPSubtype:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (**v41)(_QWORD, _QWORD, _QWORD);
  void *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (**v78)(_QWORD, _QWORD, _QWORD);
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;

  v89 = a3;
  objc_msgSend_requestParameters(v89, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v17;
  if (v17)
  {
    objc_msgSend_SSID_(v17, v18, 0, v19, v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend_authType_(v21, v22, 0, v24, v25);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v27, v28, v29, v30, v31) == 16
        && (v27 = objc_retainAutorelease(v27),
            (*(_DWORD *)(objc_msgSend_bytes(v27, v32, v33, v34, v35) + 4) - 3) >= 0xFFFFFFFE))
      {
        objc_msgSend___currentNetworkProfileWithInterfaceName_(self, v22, (uint64_t)v13, v24, v25);
        v36 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        if (!v36)
        {
          objc_msgSend___currentScanResultWithInterfaceName_forceNoCache_(self, v37, (uint64_t)v13, 0, v40);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_EAP8021XWithInterfaceName_(self, v49, (uint64_t)v13, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_supplicantState_(v52, v53, 0, v54, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend_unsignedIntValue(v56, v57, v58, v59, v60);

          v41 = 0;
          if ((objc_msgSend_isWEP(v48, v62, v63, v64, v65) & (v61 == 4)) != 0)
            v47 = &unk_1E615ECB8;
          else
            v47 = &unk_1E615EBF8;
          goto LABEL_11;
        }
        v41 = v36;
        v42 = (void *)MEMORY[0x1E0CB37E8];
        v43 = objc_msgSend_WEPSubtype(v36, v37, v38, v39, v40);
        objc_msgSend_numberWithInteger_(v42, v44, v43, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v41 = 0;
        v47 = 0;
      }
LABEL_7:
      v48 = 0;
LABEL_11:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v66, v67, (uint64_t)v47, (uint64_t)CFSTR("Result"), v68);
      objc_msgSend_response(v89, v69, v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      if (v73)
      {
        objc_msgSend_response(v89, v74, v75, v76, v77);
        v78 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v83 = (void *)objc_msgSend_copy(v66, v79, v80, v81, v82);
        ((void (**)(_QWORD, _QWORD, void *))v78)[2](v78, 0, v83);

      }
      v26 = 0;
      goto LABEL_14;
    }
LABEL_20:
    v41 = 0;
    v47 = 0;
    v27 = 0;
    goto LABEL_7;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 6, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
    goto LABEL_20;
  objc_msgSend_response(v89, v22, v23, v24, v25);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v84)
    goto LABEL_15;
  objc_msgSend_response(v89, v85, v86, v87, v88);
  v41 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v41)[2](v41, v26, 0);
LABEL_14:

LABEL_15:
}

- (void)__getWAPISubtype:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int isEqualToData;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (**v64)(_QWORD, _QWORD, _QWORD);
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;

  v75 = a3;
  objc_msgSend_requestParameters(v75, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v17;
  if (v17)
  {
    objc_msgSend_SSID_(v17, v18, 0, v19, v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend___currentScanResultWithInterfaceName_forceNoCache_(self, v22, (uint64_t)v13, 0, v25);
      v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_SSID(v27, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToData = objc_msgSend_isEqualToData_(v32, v33, (uint64_t)v26, v34, v35);

      if (isEqualToData)
      {
        objc_msgSend_authType_(v21, v22, 0, v24, v25);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_length(v37, v38, v39, v40, v41) == 16
          && (v37 = objc_retainAutorelease(v37), *(_DWORD *)(objc_msgSend_bytes(v37, v42, v43, v44, v45) + 8) == 512))
        {
          v46 = (void *)MEMORY[0x1E0CB37E8];
          v47 = objc_msgSend_WAPISubtype(v27, v22, v23, v24, v25);
          objc_msgSend_numberWithInteger_(v46, v48, v47, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v51 = 0;
        }
LABEL_7:
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v52, v53, (uint64_t)v51, (uint64_t)CFSTR("Result"), v54);
        objc_msgSend_response(v75, v55, v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (v59)
        {
          objc_msgSend_response(v75, v60, v61, v62, v63);
          v64 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v69 = (void *)objc_msgSend_copy(v52, v65, v66, v67, v68);
          ((void (**)(_QWORD, _QWORD, void *))v64)[2](v64, 0, v69);

        }
        v26 = 0;
        goto LABEL_10;
      }
LABEL_17:
      v51 = 0;
      v37 = 0;
      goto LABEL_7;
    }
LABEL_16:
    v27 = 0;
    goto LABEL_17;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 6, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
    goto LABEL_16;
  objc_msgSend_response(v75, v22, v23, v24, v25);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v70)
    goto LABEL_11;
  objc_msgSend_response(v75, v71, v72, v73, v74);
  v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v27)[2](v27, v26, 0);
LABEL_10:

LABEL_11:
}

- (void)__getSecurity:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  void (**v72)(_QWORD, _QWORD, _QWORD);
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v92;
  int isMFPRequired;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unsigned int isWEP;
  uint64_t v106;
  void *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void (**v120)(_QWORD, _QWORD, _QWORD);
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  int v131;
  int v132;
  void *v133;
  id v134;

  v134 = a3;
  objc_msgSend_requestParameters(v134, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v17;
  if (v17)
  {
    objc_msgSend_SSID_(v17, v18, 0, v19, v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend_currentNetwork_(v21, v22, 0, v24, v25);
      v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_authType_(v21, v28, 0, v29, v30);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v31, v32, v33, v34, v35) != 16)
      {
        v107 = 0;
        goto LABEL_35;
      }
      v133 = v21;
      v36 = v26;
      v37 = v13;
      v38 = objc_retainAutorelease(v31);
      v43 = *(unsigned int *)(objc_msgSend_bytes(v38, v39, v40, v41, v42) + 8);
      v44 = objc_retainAutorelease(v38);
      v49 = *(_DWORD *)(objc_msgSend_bytes(v44, v45, v46, v47, v48) + 4);
      v31 = objc_retainAutorelease(v44);
      v132 = *(_DWORD *)(objc_msgSend_bytes(v31, v50, v51, v52, v53) + 12);
      objc_msgSend_scanRecord(v27, v54, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v58, v59, (uint64_t)CFSTR("RSN_IE"), v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v62, v63, (uint64_t)CFSTR("IE_KEY_RSN_MCIPHER"), v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend_intValue(v66, v67, v68, v69, v70);

      v72 = v27;
      objc_msgSend_scanRecord(v27, v73, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v77, v78, (uint64_t)CFSTR("SCAN_RESULT_OWE_MULTI_SSID"), v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend_BOOLValue(v81, v82, v83, v84, v85);

      if (v49 == 2)
      {
        v13 = v37;
        v26 = v36;
        v27 = v72;
        v21 = v133;
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v87, 1, v89, v90);
LABEL_34:
        v107 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v108, v109, (uint64_t)v107, (uint64_t)CFSTR("Result"), v110);
        objc_msgSend_response(v134, v111, v112, v113, v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();

        if (v115)
        {
          objc_msgSend_response(v134, v116, v117, v118, v119);
          v120 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v125 = (void *)objc_msgSend_copy(v108, v121, v122, v123, v124);
          ((void (**)(_QWORD, _QWORD, void *))v120)[2](v120, 0, v125);

        }
        v26 = 0;
        goto LABEL_38;
      }
      v131 = v86;
      v91 = v49 == 1;
      v13 = v37;
      v26 = v36;
      v27 = v72;
      v21 = v133;
      if (!v91)
      {
LABEL_31:
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v87, 512, v89, v90);
        goto LABEL_34;
      }
      v92 = (__rbit32(v43) >> 28) & 0xC;
      if ((v43 & 0x884) != 0)
      {
        if (v71 == 2)
        {
          v92 |= 0x28uLL;
        }
        else if (objc_msgSend_isMFPCapable(v72, v87, v88, v89, v90)
               && (isMFPRequired = objc_msgSend_isMFPRequired(v72, v87, v88, v89, v90), (v43 & 4) == 0)
               && isMFPRequired)
        {
          v92 |= 0x80uLL;
        }
        else
        {
          v92 |= 0x20uLL;
        }
      }
      v94 = 16;
      if (v71 == 2)
        v94 = 20;
      if ((v43 & 0x418) == 0)
        v94 = 0;
      v95 = v92 | v94;
      if ((v43 & 0xC000) != 0)
        v95 |= 0x80uLL;
      if ((v43 & 0x33000) != 0)
        v95 |= 0x40uLL;
      v96 = v95 | (v43 >> 8) & 2;
      objc_msgSend_SSID(v72, v87, v88, v89, v90);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToData_(v97, v98, (uint64_t)v26, v99, v100))
      {
        isWEP = objc_msgSend_isWEP(v72, v101, v102, v103, v104);

        v96 |= isWEP;
      }
      else
      {

      }
      v106 = 256;
      if (v131)
        v106 = 768;
      if ((v132 & 1) != 0)
      {
        v96 = v106;
      }
      else if (!v96)
      {
        goto LABEL_31;
      }
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v87, v96, v89, v90);
      goto LABEL_34;
    }
LABEL_43:
    v27 = 0;
    v107 = 0;
    v31 = 0;
    goto LABEL_35;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 6, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
    goto LABEL_43;
  objc_msgSend_response(v134, v22, v23, v24, v25);
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v126)
    goto LABEL_39;
  objc_msgSend_response(v134, v127, v128, v129, v130);
  v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v27)[2](v27, v26, 0);
LABEL_38:

LABEL_39:
}

- (void)__getKnownNetworkMatchingNetworkProfile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (**v77)(_QWORD, _QWORD, _QWORD);
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (**v90)(_QWORD, _QWORD, _QWORD);
  id v91;
  void *v92;
  id obj;
  int isEqual;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_info(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("NetworkProfile"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 22, 0);
    v84 = objc_claimAutoreleasedReturnValue();
    if (v84)
    {
      v83 = (void *)v84;
      objc_msgSend_response(v4, v19, v20, v21, v22);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (v85)
      {
        objc_msgSend_response(v4, v86, v87, v88, v89);
        v90 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v90)[2](v90, v83, 0);

      }
      goto LABEL_25;
    }
LABEL_29:
    v28 = 0;
    obj = 0;
    goto LABEL_22;
  }
  objc_msgSend___knownNetworkProfiles(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_29;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = v18;
  v28 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v95, (uint64_t)v99, 16);
  if (!v28)
    goto LABEL_21;
  v91 = v4;
  v92 = v13;
  v29 = *(_QWORD *)v96;
  while (2)
  {
    for (i = 0; i != v28; i = (char *)i + 1)
    {
      if (*(_QWORD *)v96 != v29)
        objc_enumerationMutation(obj);
      v31 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i);
      objc_msgSend_identifier(v13, v24, v25, v26, v27, v91);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v31, v33, v34, v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v37)
      {

LABEL_19:
        v28 = v31;
        goto LABEL_20;
      }
      v42 = (void *)v37;
      objc_msgSend_identifier(v13, v38, v39, v40, v41);
      v43 = objc_claimAutoreleasedReturnValue();
      if (!v43)
        goto LABEL_14;
      v48 = (void *)v43;
      objc_msgSend_identifier(v31, v44, v45, v46, v47);
      v49 = objc_claimAutoreleasedReturnValue();
      if (!v49)
      {

LABEL_14:
        continue;
      }
      v54 = (void *)v49;
      objc_msgSend_identifier(v13, v50, v51, v52, v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v31, v56, v57, v58, v59);
      v60 = v29;
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v55, v62, (uint64_t)v61, v63, v64);

      v29 = v60;
      v13 = v92;

      if (isEqual)
        goto LABEL_19;
    }
    v28 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v95, (uint64_t)v99, 16);
    if (v28)
      continue;
    break;
  }
LABEL_20:
  v4 = v91;
LABEL_21:

LABEL_22:
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v19, v20, v21, v22);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v65, v66, (uint64_t)v28, (uint64_t)CFSTR("Result"), v67);
  objc_msgSend_response(v4, v68, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    objc_msgSend_response(v4, v73, v74, v75, v76);
    v77 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v82 = (void *)objc_msgSend_copy(v65, v78, v79, v80, v81);
    ((void (**)(_QWORD, _QWORD, void *))v77)[2](v77, 0, v82);

  }
  v83 = 0;
LABEL_25:

}

- (void)__getKnownNetworkMatchingScanResult:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;

  v48 = a3;
  objc_msgSend_info(v48, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("ScanResult"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend___knownNetworkProfiles(self, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B06420C0(v12, v17);
    v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)v18, (uint64_t)CFSTR("Result"), v25);
    objc_msgSend_response(v48, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend_response(v48, v31, v32, v33, v34);
      v35 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend_copy(v23, v36, v37, v38, v39);
      ((void (**)(_QWORD, _QWORD, void *))v35)[2](v35, 0, v40);

    }
    v41 = 0;
    goto LABEL_6;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 22, 0);
  v42 = objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    v18 = 0;
    goto LABEL_3;
  }
  v41 = (void *)v42;
  objc_msgSend_response(v48, v19, v20, v21, v22);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
    goto LABEL_7;
  objc_msgSend_response(v48, v44, v45, v46, v47);
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v18)[2](v18, v41, 0);
LABEL_6:

LABEL_7:
}

- (void)__addKnownNetwork:(id)a3 XPCConnection:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (**v53)(_QWORD, _QWORD, _QWORD);
  const char *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (**v63)(_QWORD, _QWORD, _QWORD);
  void *v64;

  v6 = a3;
  v7 = a4;
  objc_msgSend_info(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)CFSTR("NetworkProfile"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_SSID(v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v21;
    if (!v21
      || objc_msgSend_length(v21, v17, v22, v23, v24)
      && (unint64_t)objc_msgSend_length(v25, v17, v26, v27, v28) < 0x21)
    {
      goto LABEL_5;
    }
  }
  else
  {
    v25 = 0;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v17, *MEMORY[0x1E0CB2FE0], 22, 0);
  v57 = objc_claimAutoreleasedReturnValue();
  if (!v57)
  {
LABEL_5:
    objc_msgSend_delegate(self, v17, v22, v23, v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v29;
    if (v29)
    {
      objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v29, v30, (uint64_t)self, (uint64_t)v7, (uint64_t)v6);
    }
    else
    {
      CWFGetOSLog();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        CWFGetOSLog();
        v33 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = MEMORY[0x1E0C81028];
        v34 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v39 = objc_msgSend_type(v6, v35, v36, v37, v38);
        sub_1B063544C(v39, v40, v41, v42, v43);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();

      }
      objc_msgSend_response(v6, v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        objc_msgSend_response(v6, v49, v50, v51, v52);
        v53 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v54, *MEMORY[0x1E0CB2FE0], 45, 0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v53)[2](v53, v55, 0);

      }
    }

    v56 = 0;
    goto LABEL_15;
  }
  v56 = (void *)v57;
  objc_msgSend_response(v6, v17, v22, v23, v24);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend_response(v6, v59, v60, v61, v62);
    v63 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v63)[2](v63, v56, 0);

  }
LABEL_15:

}

- (void)__getWiFiUIStateFlags:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  NSObject *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (**v78)(_QWORD, _QWORD, _QWORD);
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void (**v89)(_QWORD, _QWORD, _QWORD);
  int *v90;
  int *v91;
  int v92;
  uint64_t v93;
  id v94;
  id v95;
  int v96;
  id v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v18;
  if (v18)
  {
    v95 = 0;
    objc_msgSend_powerOn_(v18, v19, (uint64_t)&v95, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v95;
    if (!v23)
    {
      CWFGetOSLog();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        CWFGetOSLog();
        v30 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = MEMORY[0x1E0C81028];
        v31 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v96 = 138543362;
        v97 = v28;
        v92 = 12;
        v90 = &v96;
        _os_log_send_and_compose_impl();
      }

    }
    if (objc_msgSend_BOOLValue(v23, v24, v25, v26, v27, v90, v92))
      v35 = 2;
    else
      v35 = 0;
    v94 = v28;
    objc_msgSend_opMode_(v22, v32, (uint64_t)&v94, v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v94;

    if (!v36)
    {
      CWFGetOSLog();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        CWFGetOSLog();
        v43 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v43 = MEMORY[0x1E0C81028];
        v44 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v96 = 138543362;
        v97 = v37;
        LODWORD(v93) = 12;
        v91 = &v96;
        _os_log_send_and_compose_impl();
      }

    }
    if (objc_msgSend_unsignedIntegerValue(v36, v38, v39, v40, v41, v91, v93) == 8)
      v35 |= 8uLL;
    objc_msgSend___userAutoJoinDisabled(self, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend_BOOLValue(v49, v50, v51, v52, v53);

    objc_msgSend___currentScanResultWithInterfaceName_forceNoCache_(self, v55, (uint64_t)v14, 0, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v58, v35 | v54 | 4, v59, v60);
    else
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v58, v35 | v54, v59, v60);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v19, *MEMORY[0x1E0CB2FE0], 6, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    v37 = 0;
    v65 = 0;
    v36 = 0;
LABEL_25:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v61, v62, v63, v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v66, v67, (uint64_t)v65, (uint64_t)CFSTR("Result"), v68);
    objc_msgSend_response(v4, v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend_response(v4, v74, v75, v76, v77);
      v78 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v83 = (void *)objc_msgSend_copy(v66, v79, v80, v81, v82);
      ((void (**)(_QWORD, _QWORD, void *))v78)[2](v78, 0, v83);

    }
    v23 = 0;
    goto LABEL_28;
  }
  objc_msgSend_response(v4, v61, v62, v63, v64);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    objc_msgSend_response(v4, v85, v86, v87, v88);
    v89 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v89)[2](v89, v23, 0);

  }
LABEL_28:

}

- (id)__networkStackMACAddressWithInterfaceName:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  int v11;
  char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  ether_addr v18;
  size_t size;
  int v20[4];
  int v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  size = 0;
  *(_OWORD *)v20 = xmmword_1B0711BB0;
  v21 = 3;
  v3 = objc_retainAutorelease(a3);
  v8 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6, v7);
  v22 = if_nametoindex(v8);
  sysctl(v20, 6u, 0, &size, 0, 0);
  if (!size)
  {
LABEL_7:
    v9 = 0;
    return v9;
  }
  v9 = (unsigned __int8 *)malloc_type_malloc(size, 0x5D12C205uLL);
  if (v9)
  {
    if (sysctl(v20, 6u, v9, &size, 0, 0) < 0)
    {
      free(v9);
    }
    else
    {
      v10 = &v9[v9[117]];
      v11 = *((_DWORD *)v10 + 30);
      *(_WORD *)&v18.octet[4] = *((_WORD *)v10 + 62);
      *(_DWORD *)v18.octet = v11;
      v12 = ether_ntoa(&v18);
      free(v9);
      if (v12)
      {
        objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v13, (uint64_t)v12, 4, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        CWFCorrectEthernetAddressString(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        return v16;
      }
    }
    goto LABEL_7;
  }
  return v9;
}

- (void)__getMACAddress:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;

  v47 = a3;
  objc_msgSend_requestParameters(v47, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend___networkStackMACAddressWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v21, (uint64_t)CFSTR("Result"), v24);
    objc_msgSend_response(v47, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_response(v47, v30, v31, v32, v33);
      v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend_copy(v22, v35, v36, v37, v38);
      ((void (**)(_QWORD, _QWORD, void *))v34)[2](v34, 0, v39);

    }
    v40 = 0;
    goto LABEL_6;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
  v41 = objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    v21 = 0;
    goto LABEL_3;
  }
  v40 = (void *)v41;
  objc_msgSend_response(v47, v17, v18, v19, v20);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
    goto LABEL_7;
  objc_msgSend_response(v47, v43, v44, v45, v46);
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v21)[2](v21, v40, 0);
LABEL_6:

LABEL_7:
}

- (void)__getHardwareMACAddress:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (**v56)(_QWORD, _QWORD, _QWORD);
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  NSObject *v63;
  id v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (**v70)(_QWORD, _QWORD, _QWORD);
  int *v71;
  int v72;
  int v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_apple80211WithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend_SCNetworkInterfaceWithInterfaceName_(self, v15, (uint64_t)v14, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v25 = v21;
        objc_msgSend_hardwareAddress(v21, v15, v22, v23, v24);
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
          goto LABEL_17;
        CWFGetOSLog();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          CWFGetOSLog();
          v32 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v32 = MEMORY[0x1E0C81028];
          v33 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v73 = 138543362;
          v74 = v14;
          v72 = 12;
          v71 = &v73;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend___networkStackMACAddressWithInterfaceName_(self, v34, (uint64_t)v14, v35, v36);
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
          goto LABEL_17;
        CWFGetOSLog();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          CWFGetOSLog();
          v38 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v38 = MEMORY[0x1E0C81028];
          v39 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v73 = 138543362;
          v74 = v14;
          v72 = 12;
          v71 = &v73;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend_hardwareMACAddress_(v20, v40, 0, v41, v42);
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
LABEL_17:
          v43 = (void *)v26;
LABEL_18:
          objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v27, v28, v29, v30, v71, v72);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v44, v45, (uint64_t)v43, (uint64_t)CFSTR("Result"), v46);
          objc_msgSend_response(v4, v47, v48, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
          {
            objc_msgSend_response(v4, v52, v53, v54, v55);
            v56 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v61 = (void *)objc_msgSend_copy(v44, v57, v58, v59, v60);
            ((void (**)(_QWORD, _QWORD, void *))v56)[2](v56, 0, v61);

          }
          v25 = 0;
          goto LABEL_21;
        }
        CWFGetOSLog();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          CWFGetOSLog();
          v63 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v63 = MEMORY[0x1E0C81028];
          v64 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v73 = 138543362;
          v74 = v14;
          v72 = 12;
          v71 = &v73;
          _os_log_send_and_compose_impl();
        }

LABEL_28:
        v43 = 0;
        goto LABEL_18;
      }
    }
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v15, *MEMORY[0x1E0CB2FE0], 6, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
    goto LABEL_28;
  objc_msgSend_response(v4, v27, v28, v29, v30);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    objc_msgSend_response(v4, v66, v67, v68, v69);
    v70 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v70)[2](v70, v25, 0);

  }
LABEL_21:

}

- (void)__getEventIDs:(id)a3 XPCConnection:(id)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  id v29;

  v29 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  objc_msgSend_dictionary(v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registeredEventIDs(v6, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, (uint64_t)CFSTR("Result"), v18);
  objc_msgSend_response(v29, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_response(v29, v24, v25, v26, v27);
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v28)[2](v28, 0, v11);

  }
}

- (void)__getActivities:(id)a3 XPCConnection:(id)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  id v29;

  v29 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  objc_msgSend_dictionary(v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registeredActivities(v6, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, (uint64_t)CFSTR("Result"), v18);
  objc_msgSend_response(v29, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_response(v29, v24, v25, v26, v27);
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v28)[2](v28, 0, v11);

  }
}

- (void)__getIO80211ControllerInfo:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;

  v48 = a3;
  objc_msgSend_requestParameters(v48, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_IO80211ControllerInfo(self->_IO80211, v14, v15, v16, v17);
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v22)
    {
LABEL_3:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v18, v19, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)v22, (uint64_t)CFSTR("Result"), v25);
      objc_msgSend_response(v48, v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend_response(v48, v31, v32, v33, v34);
        v35 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend_copy(v23, v36, v37, v38, v39);
        ((void (**)(_QWORD, _QWORD, void *))v35)[2](v35, 0, v40);

      }
      v41 = 0;
      goto LABEL_6;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 19, 0);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
  }
  v42 = objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    v22 = 0;
    goto LABEL_3;
  }
  v41 = (void *)v42;
  objc_msgSend_response(v48, v18, v19, v20, v21);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
    goto LABEL_7;
  objc_msgSend_response(v48, v44, v45, v46, v47);
  v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v22)[2](v22, v41, 0);
LABEL_6:

LABEL_7:
}

- (void)__getIO80211InterfaceInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  CWFIO80211 *IO80211;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (**v41)(_QWORD, _QWORD, _QWORD);
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;

  v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    IO80211 = self->_IO80211;
    v47 = 0;
    objc_msgSend_IO80211InterfaceInfo_error_(IO80211, v15, (uint64_t)v14, (uint64_t)&v47, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v47;
    if (v23)
      goto LABEL_3;
LABEL_6:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v19, v20, v21, v22);
    v29 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v29, v30, (uint64_t)v18, (uint64_t)CFSTR("Result"), v31);
    objc_msgSend_response(v4, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend_response(v4, v37, v38, v39, v40);
      v41 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend_copy(v29, v42, v43, v44, v45);
      ((void (**)(_QWORD, _QWORD, void *))v41)[2](v41, 0, v46);

    }
    goto LABEL_8;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v15, *MEMORY[0x1E0CB2FE0], 6, 0);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  if (!v23)
    goto LABEL_6;
LABEL_3:
  objc_msgSend_response(v4, v19, v20, v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_response(v4, v25, v26, v27, v28);
    v29 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v29)[2](v29, v23, 0);
LABEL_8:

  }
}

- (void)__getIPv4Addresses:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (**v53)(_QWORD, _QWORD, _QWORD);
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;

  v59 = a3;
  objc_msgSend_requestParameters(v59, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv4Addresses(v17, v18, v19, v20, v21);
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v26)
    goto LABEL_10;
  objc_msgSend_SCNetworkInterfaceWithInterfaceName_(self, v22, (uint64_t)v13, v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv4Addresses(v27, v28, v29, v30, v31);
  v32 = objc_claimAutoreleasedReturnValue();
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))v32;
  if (v27 || v17 || v32)
  {

LABEL_10:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v41, v42, (uint64_t)v26, (uint64_t)CFSTR("Result"), v43);
    objc_msgSend_response(v59, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend_response(v59, v49, v50, v51, v52);
      v53 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend_copy(v41, v54, v55, v56, v57);
      ((void (**)(_QWORD, _QWORD, void *))v53)[2](v53, 0, v58);

    }
    v35 = 0;
    goto LABEL_13;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v33, *MEMORY[0x1E0CB2FE0], 6, 0);
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
  {
    v26 = 0;
    goto LABEL_10;
  }
  v35 = (void *)v34;
  objc_msgSend_response(v59, v22, v23, v24, v25);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend_response(v59, v37, v38, v39, v40);
    v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v26)[2](v26, v35, 0);
LABEL_13:

  }
}

- (void)__getIPv4SubnetMasks:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (**v53)(_QWORD, _QWORD, _QWORD);
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;

  v59 = a3;
  objc_msgSend_requestParameters(v59, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv4SubnetMasks(v17, v18, v19, v20, v21);
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v26)
    goto LABEL_10;
  objc_msgSend_SCNetworkInterfaceWithInterfaceName_(self, v22, (uint64_t)v13, v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv4SubnetMasks(v27, v28, v29, v30, v31);
  v32 = objc_claimAutoreleasedReturnValue();
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))v32;
  if (v27 || v17 || v32)
  {

LABEL_10:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v41, v42, (uint64_t)v26, (uint64_t)CFSTR("Result"), v43);
    objc_msgSend_response(v59, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend_response(v59, v49, v50, v51, v52);
      v53 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend_copy(v41, v54, v55, v56, v57);
      ((void (**)(_QWORD, _QWORD, void *))v53)[2](v53, 0, v58);

    }
    v35 = 0;
    goto LABEL_13;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v33, *MEMORY[0x1E0CB2FE0], 6, 0);
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
  {
    v26 = 0;
    goto LABEL_10;
  }
  v35 = (void *)v34;
  objc_msgSend_response(v59, v22, v23, v24, v25);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend_response(v59, v37, v38, v39, v40);
    v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v26)[2](v26, v35, 0);
LABEL_13:

  }
}

- (void)__getGlobalIPv4Addresses:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend_IPv4Addresses(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)CFSTR("Result"), v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v30);

  }
}

- (void)__getIPv6Addresses:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (**v53)(_QWORD, _QWORD, _QWORD);
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;

  v59 = a3;
  objc_msgSend_requestParameters(v59, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv6Addresses(v17, v18, v19, v20, v21);
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v26)
    goto LABEL_10;
  objc_msgSend_SCNetworkInterfaceWithInterfaceName_(self, v22, (uint64_t)v13, v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv6Addresses(v27, v28, v29, v30, v31);
  v32 = objc_claimAutoreleasedReturnValue();
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))v32;
  if (v27 || v17 || v32)
  {

LABEL_10:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v41, v42, (uint64_t)v26, (uint64_t)CFSTR("Result"), v43);
    objc_msgSend_response(v59, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend_response(v59, v49, v50, v51, v52);
      v53 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend_copy(v41, v54, v55, v56, v57);
      ((void (**)(_QWORD, _QWORD, void *))v53)[2](v53, 0, v58);

    }
    v35 = 0;
    goto LABEL_13;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v33, *MEMORY[0x1E0CB2FE0], 6, 0);
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
  {
    v26 = 0;
    goto LABEL_10;
  }
  v35 = (void *)v34;
  objc_msgSend_response(v59, v22, v23, v24, v25);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend_response(v59, v37, v38, v39, v40);
    v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v26)[2](v26, v35, 0);
LABEL_13:

  }
}

- (void)__getGlobalIPv6Addresses:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend_IPv6Addresses(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)CFSTR("Result"), v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v30);

  }
}

- (void)__getIPv4ARPResolvedHardwareAddress:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;

  v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv4ARPResolvedHardwareAddress((void *)v17, v18, v19, v20, v21);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, *MEMORY[0x1E0CB2FE0], 6, 0),
        (v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)CFSTR("Result"), v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      v45 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(_QWORD, _QWORD, void *))v45)[2](v45, 0, v50);

      v28 = 0;
    }
    goto LABEL_7;
  }
  v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v34)[2](v34, v28, 0);
LABEL_7:

  }
}

- (void)__getIPv4ARPResolvedIPAddress:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;

  v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv4ARPResolvedIPAddress((void *)v17, v18, v19, v20, v21);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, *MEMORY[0x1E0CB2FE0], 6, 0),
        (v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)CFSTR("Result"), v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      v45 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(_QWORD, _QWORD, void *))v45)[2](v45, 0, v50);

      v28 = 0;
    }
    goto LABEL_7;
  }
  v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v34)[2](v34, v28, 0);
LABEL_7:

  }
}

- (void)__getIPv4Router:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;

  v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv4Router((void *)v17, v18, v19, v20, v21);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, *MEMORY[0x1E0CB2FE0], 6, 0),
        (v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)CFSTR("Result"), v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      v45 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(_QWORD, _QWORD, void *))v45)[2](v45, 0, v50);

      v28 = 0;
    }
    goto LABEL_7;
  }
  v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v34)[2](v34, v28, 0);
LABEL_7:

  }
}

- (void)__getGlobalIPv4Router:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend_IPv4Router(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)CFSTR("Result"), v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v30);

  }
}

- (void)__getIPv6Router:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;

  v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv6Router((void *)v17, v18, v19, v20, v21);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, *MEMORY[0x1E0CB2FE0], 6, 0),
        (v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)CFSTR("Result"), v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      v45 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(_QWORD, _QWORD, void *))v45)[2](v45, 0, v50);

      v28 = 0;
    }
    goto LABEL_7;
  }
  v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v34)[2](v34, v28, 0);
LABEL_7:

  }
}

- (void)__getGlobalIPv6Router:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend_IPv6Router(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)CFSTR("Result"), v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v30);

  }
}

- (void)__getGlobalIPv4InterfaceName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend_IPv4InterfaceName(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)CFSTR("Result"), v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v30);

  }
}

- (void)__getGlobalIPv6InterfaceName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend_IPv6InterfaceName(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)CFSTR("Result"), v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v30);

  }
}

- (void)__getNetServiceID:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;

  v50 = a3;
  objc_msgSend_requestParameters(v50, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v21 = v17;
      objc_msgSend_serviceID(v17, v14, v18, v19, v20);
      v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_4:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v26, (uint64_t)CFSTR("Result"), v29);
      objc_msgSend_response(v50, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend_response(v50, v35, v36, v37, v38);
        v39 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend_copy(v27, v40, v41, v42, v43);
        ((void (**)(_QWORD, _QWORD, void *))v39)[2](v39, 0, v44);

      }
      v21 = 0;
      goto LABEL_7;
    }
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v26 = 0;
    goto LABEL_4;
  }
  objc_msgSend_response(v50, v22, v23, v24, v25);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
    goto LABEL_8;
  objc_msgSend_response(v50, v46, v47, v48, v49);
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v26)[2](v26, v21, 0);
LABEL_7:

LABEL_8:
}

- (void)__getNetServiceName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;

  v50 = a3;
  objc_msgSend_requestParameters(v50, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v21 = v17;
      objc_msgSend_serviceName(v17, v14, v18, v19, v20);
      v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_4:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v26, (uint64_t)CFSTR("Result"), v29);
      objc_msgSend_response(v50, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend_response(v50, v35, v36, v37, v38);
        v39 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend_copy(v27, v40, v41, v42, v43);
        ((void (**)(_QWORD, _QWORD, void *))v39)[2](v39, 0, v44);

      }
      v21 = 0;
      goto LABEL_7;
    }
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v26 = 0;
    goto LABEL_4;
  }
  objc_msgSend_response(v50, v22, v23, v24, v25);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
    goto LABEL_8;
  objc_msgSend_response(v50, v46, v47, v48, v49);
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v26)[2](v26, v21, 0);
LABEL_7:

LABEL_8:
}

- (void)__getNetServiceEnabled:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (**v43)(_QWORD, _QWORD, _QWORD);
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;

  v54 = a3;
  objc_msgSend_requestParameters(v54, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v21 = v17;
      objc_msgSend_serviceID(v17, v14, v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 != 0;

      goto LABEL_4;
    }
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
LABEL_4:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v24, v25, v26, v27);
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v29, v23, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v28, v33, (uint64_t)v32, (uint64_t)CFSTR("Result"), v34);

    objc_msgSend_response(v54, v35, v36, v37, v38);
    v23 = objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend_response(v54, v39, v40, v41, v42);
      v43 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend_copy(v28, v44, v45, v46, v47);
      ((void (**)(_QWORD, _QWORD, void *))v43)[2](v43, 0, v48);

      v23 = 0;
    }
    goto LABEL_6;
  }
  objc_msgSend_response(v54, v24, v25, v26, v27);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
    goto LABEL_7;
  objc_msgSend_response(v54, v50, v51, v52, v53);
  v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v28[2](v28, v23, 0);
LABEL_6:

LABEL_7:
}

- (void)__getGlobalIPv4NetServiceID:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend_IPv4ServiceID(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)CFSTR("Result"), v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v30);

  }
}

- (void)__getGlobalIPv6NetServiceID:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend_IPv6ServiceID(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)CFSTR("Result"), v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v30);

  }
}

- (void)__getGlobalIPv4NetServiceName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend_IPv4ServiceName(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)CFSTR("Result"), v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v30);

  }
}

- (void)__getGlobalIPv6NetServiceName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend_IPv6ServiceName(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)CFSTR("Result"), v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v30);

  }
}

- (void)__getGlobalDNSServerAddresses:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend_DNSServerAddresses(self->_SCNetworkConfiguration, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v8, (uint64_t)CFSTR("Result"), v15);
  objc_msgSend_response(v31, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_response(v31, v21, v22, v23, v24);
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend_copy(v13, v26, v27, v28, v29);
    ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v30);

  }
}

- (void)__getDNSServerAddresses:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;

  v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_DNSServerAddresses((void *)v17, v18, v19, v20, v21);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, *MEMORY[0x1E0CB2FE0], 6, 0),
        (v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)CFSTR("Result"), v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      v45 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(_QWORD, _QWORD, void *))v45)[2](v45, 0, v50);

      v28 = 0;
    }
    goto LABEL_7;
  }
  v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v34)[2](v34, v28, 0);
LABEL_7:

  }
}

- (void)__getNetworkReachability:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;

  v36 = a3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend_flags(self->_SCNetworkReachability, v5, v6, v7, v8);
  objc_msgSend_numberWithUnsignedInt_(v4, v10, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v18, v19, (uint64_t)v13, (uint64_t)CFSTR("Result"), v20);
  objc_msgSend_response(v36, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend_response(v36, v26, v27, v28, v29);
    v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend_copy(v18, v31, v32, v33, v34);
    ((void (**)(_QWORD, _QWORD, void *))v30)[2](v30, 0, v35);

  }
}

- (void)__getDHCPLeaseStartTime:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;

  v50 = a3;
  objc_msgSend_requestParameters(v50, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v21 = v17;
      objc_msgSend_DHCPLeaseStartTimestamp(v17, v14, v18, v19, v20);
      v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_4:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v26, (uint64_t)CFSTR("Result"), v29);
      objc_msgSend_response(v50, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend_response(v50, v35, v36, v37, v38);
        v39 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend_copy(v27, v40, v41, v42, v43);
        ((void (**)(_QWORD, _QWORD, void *))v39)[2](v39, 0, v44);

      }
      v21 = 0;
      goto LABEL_7;
    }
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v26 = 0;
    goto LABEL_4;
  }
  objc_msgSend_response(v50, v22, v23, v24, v25);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
    goto LABEL_8;
  objc_msgSend_response(v50, v46, v47, v48, v49);
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v26)[2](v26, v21, 0);
LABEL_7:

LABEL_8:
}

- (void)__getDHCPLeaseExpirationTime:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;

  v50 = a3;
  objc_msgSend_requestParameters(v50, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v21 = v17;
      objc_msgSend_DHCPLeaseExpirationTimestamp(v17, v14, v18, v19, v20);
      v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_4:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v26, (uint64_t)CFSTR("Result"), v29);
      objc_msgSend_response(v50, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend_response(v50, v35, v36, v37, v38);
        v39 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend_copy(v27, v40, v41, v42, v43);
        ((void (**)(_QWORD, _QWORD, void *))v39)[2](v39, 0, v44);

      }
      v21 = 0;
      goto LABEL_7;
    }
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v26 = 0;
    goto LABEL_4;
  }
  objc_msgSend_response(v50, v22, v23, v24, v25);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
    goto LABEL_8;
  objc_msgSend_response(v50, v46, v47, v48, v49);
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v26)[2](v26, v21, 0);
LABEL_7:

LABEL_8:
}

- (void)__getDHCPServerID:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;

  v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_DHCPServerID((void *)v17, v18, v19, v20, v21);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, *MEMORY[0x1E0CB2FE0], 6, 0),
        (v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)CFSTR("Result"), v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      v45 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(_QWORD, _QWORD, void *))v45)[2](v45, 0, v50);

      v28 = 0;
    }
    goto LABEL_7;
  }
  v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v34)[2](v34, v28, 0);
LABEL_7:

  }
}

- (void)__getDHCPv6ServerID:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;

  v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_DHCPv6ServerID((void *)v17, v18, v19, v20, v21);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, *MEMORY[0x1E0CB2FE0], 6, 0),
        (v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)CFSTR("Result"), v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      v45 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(_QWORD, _QWORD, void *))v45)[2](v45, 0, v50);

      v28 = 0;
    }
    goto LABEL_7;
  }
  v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v34)[2](v34, v28, 0);
LABEL_7:

  }
}

- (void)__getIPv4NetworkSignature:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;

  v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv4NetworkSignature((void *)v17, v18, v19, v20, v21);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, *MEMORY[0x1E0CB2FE0], 6, 0),
        (v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)CFSTR("Result"), v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      v45 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(_QWORD, _QWORD, void *))v45)[2](v45, 0, v50);

      v28 = 0;
    }
    goto LABEL_7;
  }
  v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v34)[2](v34, v28, 0);
LABEL_7:

  }
}

- (void)__getIPv6NetworkSignature:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;

  v51 = a3;
  objc_msgSend_requestParameters(v51, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_SCNetworkServiceWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_IPv6NetworkSignature((void *)v17, v18, v19, v20, v21);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v17 | v26
    || (objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, *MEMORY[0x1E0CB2FE0], 6, 0),
        (v27 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, v26, (uint64_t)CFSTR("Result"), v36);
    objc_msgSend_response(v51, v37, v38, v39, v40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend_response(v51, v41, v42, v43, v44);
      v45 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend_copy(v34, v46, v47, v48, v49);
      ((void (**)(_QWORD, _QWORD, void *))v45)[2](v45, 0, v50);

      v28 = 0;
    }
    goto LABEL_7;
  }
  v28 = (void *)v27;
  objc_msgSend_response(v51, v22, v23, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v51, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v34)[2](v34, v28, 0);
LABEL_7:

  }
}

- (void)__getEAP8021XSupplicantState:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;

  v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_EAP8021XWithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v18;
    if (v18)
    {
      v52 = 0;
      objc_msgSend_supplicantState_(v18, v19, (uint64_t)&v52, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v52;
      if (v28)
        goto LABEL_4;
LABEL_9:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v24, v25, v26, v27);
      v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v23, (uint64_t)CFSTR("Result"), v36);
      objc_msgSend_response(v4, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend_response(v4, v42, v43, v44, v45);
        v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend_copy(v34, v47, v48, v49, v50);
        ((void (**)(_QWORD, _QWORD, void *))v46)[2](v46, 0, v51);

      }
      goto LABEL_11;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v19, *MEMORY[0x1E0CB2FE0], 6, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v15, *MEMORY[0x1E0CB2FE0], 6, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
  }
  v23 = 0;
  if (!v28)
    goto LABEL_9;
LABEL_4:
  objc_msgSend_response(v4, v24, v25, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v4, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v34)[2](v34, v28, 0);
LABEL_11:

  }
}

- (void)__getEAP8021XControlMode:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;

  v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_EAP8021XWithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v18;
    if (v18)
    {
      v52 = 0;
      objc_msgSend_controlMode_(v18, v19, (uint64_t)&v52, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v52;
      if (v28)
        goto LABEL_4;
LABEL_9:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v24, v25, v26, v27);
      v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v23, (uint64_t)CFSTR("Result"), v36);
      objc_msgSend_response(v4, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend_response(v4, v42, v43, v44, v45);
        v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend_copy(v34, v47, v48, v49, v50);
        ((void (**)(_QWORD, _QWORD, void *))v46)[2](v46, 0, v51);

      }
      goto LABEL_11;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v19, *MEMORY[0x1E0CB2FE0], 6, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v15, *MEMORY[0x1E0CB2FE0], 6, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
  }
  v23 = 0;
  if (!v28)
    goto LABEL_9;
LABEL_4:
  objc_msgSend_response(v4, v24, v25, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v4, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v34)[2](v34, v28, 0);
LABEL_11:

  }
}

- (void)__getEAP8021XControlState:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;

  v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_EAP8021XWithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v18;
    if (v18)
    {
      v52 = 0;
      objc_msgSend_controlState_(v18, v19, (uint64_t)&v52, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v52;
      if (v28)
        goto LABEL_4;
LABEL_9:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v24, v25, v26, v27);
      v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v23, (uint64_t)CFSTR("Result"), v36);
      objc_msgSend_response(v4, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend_response(v4, v42, v43, v44, v45);
        v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend_copy(v34, v47, v48, v49, v50);
        ((void (**)(_QWORD, _QWORD, void *))v46)[2](v46, 0, v51);

      }
      goto LABEL_11;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v19, *MEMORY[0x1E0CB2FE0], 6, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v15, *MEMORY[0x1E0CB2FE0], 6, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
  }
  v23 = 0;
  if (!v28)
    goto LABEL_9;
LABEL_4:
  objc_msgSend_response(v4, v24, v25, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v4, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v34)[2](v34, v28, 0);
LABEL_11:

  }
}

- (void)__getEAP8021XClientStatus:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;

  v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_EAP8021XWithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v18;
    if (v18)
    {
      v52 = 0;
      objc_msgSend_clientStatus_(v18, v19, (uint64_t)&v52, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v52;
      if (v28)
        goto LABEL_4;
LABEL_9:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v24, v25, v26, v27);
      v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v23, (uint64_t)CFSTR("Result"), v36);
      objc_msgSend_response(v4, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend_response(v4, v42, v43, v44, v45);
        v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend_copy(v34, v47, v48, v49, v50);
        ((void (**)(_QWORD, _QWORD, void *))v46)[2](v46, 0, v51);

      }
      goto LABEL_11;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v19, *MEMORY[0x1E0CB2FE0], 6, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v15, *MEMORY[0x1E0CB2FE0], 6, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
  }
  v23 = 0;
  if (!v28)
    goto LABEL_9;
LABEL_4:
  objc_msgSend_response(v4, v24, v25, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_response(v4, v30, v31, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v34)[2](v34, v28, 0);
LABEL_11:

  }
}

- (void)__getRoamStatus:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;

  v47 = a3;
  objc_msgSend_requestParameters(v47, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend___roamStatusWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v21, (uint64_t)CFSTR("Result"), v24);
    objc_msgSend_response(v47, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_response(v47, v30, v31, v32, v33);
      v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend_copy(v22, v35, v36, v37, v38);
      ((void (**)(_QWORD, _QWORD, void *))v34)[2](v34, 0, v39);

    }
    v40 = 0;
    goto LABEL_6;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
  v41 = objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    v21 = 0;
    goto LABEL_3;
  }
  v40 = (void *)v41;
  objc_msgSend_response(v47, v17, v18, v19, v20);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
    goto LABEL_7;
  objc_msgSend_response(v47, v43, v44, v45, v46);
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v21)[2](v21, v40, 0);
LABEL_6:

LABEL_7:
}

- (void)__getJoinStatus:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;

  v47 = a3;
  objc_msgSend_requestParameters(v47, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend___joinStatusWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v21, (uint64_t)CFSTR("Result"), v24);
    objc_msgSend_response(v47, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_response(v47, v30, v31, v32, v33);
      v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend_copy(v22, v35, v36, v37, v38);
      ((void (**)(_QWORD, _QWORD, void *))v34)[2](v34, 0, v39);

    }
    v40 = 0;
    goto LABEL_6;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
  v41 = objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    v21 = 0;
    goto LABEL_3;
  }
  v40 = (void *)v41;
  objc_msgSend_response(v47, v17, v18, v19, v20);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
    goto LABEL_7;
  objc_msgSend_response(v47, v43, v44, v45, v46);
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v21)[2](v21, v40, 0);
LABEL_6:

LABEL_7:
}

- (void)__getAutoJoinStatus:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;

  v47 = a3;
  objc_msgSend_requestParameters(v47, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend___autojoinStatusWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v21, (uint64_t)CFSTR("Result"), v24);
    objc_msgSend_response(v47, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_response(v47, v30, v31, v32, v33);
      v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend_copy(v22, v35, v36, v37, v38);
      ((void (**)(_QWORD, _QWORD, void *))v34)[2](v34, 0, v39);

    }
    v40 = 0;
    goto LABEL_6;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
  v41 = objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    v21 = 0;
    goto LABEL_3;
  }
  v40 = (void *)v41;
  objc_msgSend_response(v47, v17, v18, v19, v20);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
    goto LABEL_7;
  objc_msgSend_response(v47, v43, v44, v45, v46);
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v21)[2](v21, v40, 0);
LABEL_6:

LABEL_7:
}

- (void)__getLinkDownStatus:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;

  v47 = a3;
  objc_msgSend_requestParameters(v47, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend___linkDownStatusWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v21, (uint64_t)CFSTR("Result"), v24);
    objc_msgSend_response(v47, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_response(v47, v30, v31, v32, v33);
      v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend_copy(v22, v35, v36, v37, v38);
      ((void (**)(_QWORD, _QWORD, void *))v34)[2](v34, 0, v39);

    }
    v40 = 0;
    goto LABEL_6;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
  v41 = objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    v21 = 0;
    goto LABEL_3;
  }
  v40 = (void *)v41;
  objc_msgSend_response(v47, v17, v18, v19, v20);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
    goto LABEL_7;
  objc_msgSend_response(v47, v43, v44, v45, v46);
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v21)[2](v21, v40, 0);
LABEL_6:

LABEL_7:
}

- (void)__getSSID:(id)a3 XPCConnection:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  char isEqualToData;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  char isEqualToString;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (**v66)(_QWORD, _QWORD, _QWORD);
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (**v78)(_QWORD, _QWORD, _QWORD);
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;

  v6 = a3;
  v7 = a4;
  objc_msgSend_requestParameters(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 6, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v53 = 0;
    v26 = 0;
    v60 = 0;
    v25 = 0;
    goto LABEL_12;
  }
  objc_msgSend_apple80211WithInterfaceName_(self, v18, (uint64_t)v17, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v21;
  if (!v21)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, *MEMORY[0x1E0CB2FE0], 6, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v53 = 0;
    v26 = 0;
LABEL_23:
    v60 = 0;
    goto LABEL_12;
  }
  v89 = 0;
  objc_msgSend_SSID_(v21, v22, (uint64_t)&v89, v23, v24);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v31 = v89;
  if (!v26)
  {
    v35 = 0;
    v53 = 0;
    goto LABEL_23;
  }
  if (objc_msgSend_serviceType(v7, v27, v28, v29, v30) == 4)
  {
    objc_msgSend___currentNetworkProfileWithInterfaceName_(self, v32, (uint64_t)v17, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v35, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToData = objc_msgSend_isEqualToData_(v40, v41, (uint64_t)v26, v42, v43);

    if ((isEqualToData & 1) == 0)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v45, *MEMORY[0x1E0CB2FE0], 1, 0);
      v59 = objc_claimAutoreleasedReturnValue();

      v53 = 0;
      goto LABEL_9;
    }
    objc_msgSend_bundleID(v7, v45, v46, v47, v48);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v53
      || (objc_msgSend_bundleID(v35, v49, v50, v51, v52),
          v54 = (void *)objc_claimAutoreleasedReturnValue(),
          isEqualToString = objc_msgSend_isEqualToString_(v54, v55, (uint64_t)v53, v56, v57),
          v54,
          (isEqualToString & 1) == 0))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v49, *MEMORY[0x1E0CB2FE0], 1, 0);
      v59 = objc_claimAutoreleasedReturnValue();

LABEL_9:
      v60 = 0;
      v31 = (id)v59;
      goto LABEL_12;
    }
  }
  else
  {
    v35 = 0;
    v53 = 0;
  }
  v26 = v26;
  v60 = v26;
LABEL_12:
  if (!v31)
  {
    v88 = v7;
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v27, v28, v29, v30);
    v66 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v66, v67, (uint64_t)v60, (uint64_t)CFSTR("Result"), v68);
    objc_msgSend_response(v6, v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend_response(v6, v74, v75, v76, v77);
      v78 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v87 = v17;
      v83 = v25;
      v84 = v6;
      v85 = v35;
      v86 = (void *)objc_msgSend_copy(v66, v79, v80, v81, v82);
      ((void (**)(_QWORD, _QWORD, void *))v78)[2](v78, 0, v86);

      v35 = v85;
      v6 = v84;
      v25 = v83;
      v17 = v87;

    }
    v7 = v88;
    goto LABEL_18;
  }
  objc_msgSend_response(v6, v27, v28, v29, v30);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend_response(v6, v62, v63, v64, v65);
    v66 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v66)[2](v66, v31, 0);
LABEL_18:

  }
}

- (void)__getSSIDForVendor:(id)a3 XPCConnection:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  char isEqualToData;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  char isEqualToString;
  id v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (**v64)(_QWORD, _QWORD, _QWORD);
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (**v76)(_QWORD, _QWORD, _QWORD);
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v83;
  id v84;
  id v85;
  id v86;

  v83 = a3;
  v84 = a4;
  objc_msgSend_requestParameters(v83, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v16, *MEMORY[0x1E0CB2FE0], 6, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v50 = 0;
    v24 = 0;
    v58 = 0;
    v23 = 0;
    goto LABEL_12;
  }
  objc_msgSend_apple80211WithInterfaceName_(self, v16, (uint64_t)v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19;
  if (!v19)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v20, *MEMORY[0x1E0CB2FE0], 6, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v50 = 0;
    v24 = 0;
LABEL_22:
    v58 = 0;
    goto LABEL_12;
  }
  v86 = 0;
  objc_msgSend_SSID_(v19, v20, (uint64_t)&v86, v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v86;
  if (!v24)
  {
    v51 = 0;
    v50 = 0;
    goto LABEL_22;
  }
  if (objc_msgSend_serviceType(v84, v25, v26, v27, v28) != 4)
  {
    v51 = 0;
    v50 = 0;
    goto LABEL_10;
  }
  objc_msgSend___currentNetworkProfileWithInterfaceName_(self, v30, (uint64_t)v15, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v33, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToData = objc_msgSend_isEqualToData_(v38, v39, (uint64_t)v24, v40, v41);

  if ((isEqualToData & 1) != 0)
  {
    objc_msgSend_bundleID(v84, v43, v44, v45, v46);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v33;
    if (!v50
      || (objc_msgSend_bundleID(v33, v30, v47, v48, v49),
          v52 = (void *)objc_claimAutoreleasedReturnValue(),
          isEqualToString = objc_msgSend_isEqualToString_(v52, v53, (uint64_t)v50, v54, v55),
          v52,
          (isEqualToString & 1) == 0))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v30, *MEMORY[0x1E0CB2FE0], 1, 0);
      v57 = (id)objc_claimAutoreleasedReturnValue();

      v58 = 0;
LABEL_11:
      v29 = v57;
      goto LABEL_12;
    }
LABEL_10:
    v85 = v29;
    objc_msgSend___hashedSSID_XPCConnection_error_(self, v30, (uint64_t)v24, (uint64_t)v84, (uint64_t)&v85);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v85;

    goto LABEL_11;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v43, *MEMORY[0x1E0CB2FE0], 1, 0);
  v82 = objc_claimAutoreleasedReturnValue();

  v50 = 0;
  v58 = 0;
  v29 = (id)v82;
  v51 = v33;
LABEL_12:
  if (!v29)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v25, v26, v27, v28);
    v64 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v64, v65, (uint64_t)v58, (uint64_t)CFSTR("Result"), v66);
    objc_msgSend_response(v83, v67, v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v71)
    {
      objc_msgSend_response(v83, v72, v73, v74, v75);
      v76 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v81 = (void *)objc_msgSend_copy(v64, v77, v78, v79, v80);
      ((void (**)(_QWORD, _QWORD, void *))v76)[2](v76, 0, v81);

    }
    goto LABEL_17;
  }
  objc_msgSend_response(v83, v25, v26, v27, v28);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend_response(v83, v60, v61, v62, v63);
    v64 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v64)[2](v64, v29, 0);
LABEL_17:

  }
}

- (void)__getBSSID:(id)a3 XPCConnection:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  char isEqualToData;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  char isEqualToString;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  id v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (**v81)(_QWORD, _QWORD, _QWORD);
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (**v93)(_QWORD, _QWORD, _QWORD);
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  id v103;

  v6 = a3;
  v7 = a4;
  objc_msgSend_requestParameters(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_apple80211WithInterfaceName_(self, v18, (uint64_t)v17, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v21;
    if (v21)
    {
      v103 = 0;
      objc_msgSend_SSID_(v21, v22, (uint64_t)&v103, v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v103;
      if (v26)
      {
        if (objc_msgSend_serviceType(v7, v27, v28, v29, v30) == 4)
        {
          objc_msgSend___currentNetworkProfileWithInterfaceName_(self, v32, (uint64_t)v17, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_SSID(v35, v36, v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToData = objc_msgSend_isEqualToData_(v40, v41, (uint64_t)v26, v42, v43);

          if ((isEqualToData & 1) == 0)
          {
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v45, *MEMORY[0x1E0CB2FE0], 1, 0);
            v74 = (id)objc_claimAutoreleasedReturnValue();

            v52 = 0;
            goto LABEL_11;
          }
          objc_msgSend_bundleID(v7, v45, v46, v47, v48);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v52)
            goto LABEL_10;
          objc_msgSend_bundleID(v35, v32, v49, v50, v51);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v53, v54, (uint64_t)v52, v55, v56);

          if ((isEqualToString & 1) == 0
            || (objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v32, v58, v59, v60),
                v62 = v61,
                objc_msgSend_addedAt(v35, v63, v64, v65, v66),
                v67 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend_timeIntervalSinceReferenceDate(v67, v68, v69, v70, v71),
                v73 = v62 - v72,
                v67,
                v73 <= 0.0)
            || v73 > 300.0)
          {
LABEL_10:
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v32, *MEMORY[0x1E0CB2FE0], 1, 0);
            v74 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
            v75 = 0;
LABEL_14:
            v31 = v74;
            goto LABEL_15;
          }
        }
        else
        {
          v52 = 0;
          v35 = 0;
        }
        v102 = v31;
        objc_msgSend_BSSID_(v25, v32, (uint64_t)&v102, v33, v34);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v102;

        goto LABEL_14;
      }
      v52 = 0;
    }
    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, *MEMORY[0x1E0CB2FE0], 6, 0);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v52 = 0;
      v26 = 0;
    }
    v75 = 0;
    v35 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 6, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    v26 = 0;
    v75 = 0;
    v35 = 0;
    v25 = 0;
  }
LABEL_15:
  if (!v31)
  {
    v100 = v7;
    v101 = v26;
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v27, v28, v29, v30);
    v81 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v81, v82, (uint64_t)v75, (uint64_t)CFSTR("Result"), v83);
    objc_msgSend_response(v6, v84, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    if (v88)
    {
      objc_msgSend_response(v6, v89, v90, v91, v92);
      v93 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v98 = v35;
      v99 = (void *)objc_msgSend_copy(v81, v94, v95, v96, v97);
      ((void (**)(_QWORD, _QWORD, void *))v93)[2](v93, 0, v99);

      v35 = v98;
    }
    v7 = v100;
    v26 = v101;
    goto LABEL_21;
  }
  objc_msgSend_response(v6, v27, v28, v29, v30);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    objc_msgSend_response(v6, v77, v78, v79, v80);
    v81 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v81)[2](v81, v31, 0);
LABEL_21:

  }
}

- (void)__getBSSIDForVendor:(id)a3 XPCConnection:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  char isEqualToData;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  char isEqualToString;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (**v66)(_QWORD, _QWORD, _QWORD);
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (**v78)(_QWORD, _QWORD, _QWORD);
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;

  v88 = a3;
  v89 = a4;
  objc_msgSend_requestParameters(v88, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v16, *MEMORY[0x1E0CB2FE0], 6, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v54 = 0;
    v24 = 0;
    v31 = 0;
    v60 = 0;
    v23 = 0;
    goto LABEL_13;
  }
  objc_msgSend_apple80211WithInterfaceName_(self, v16, (uint64_t)v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19;
  if (!v19)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v20, *MEMORY[0x1E0CB2FE0], 6, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v54 = 0;
    v24 = 0;
LABEL_24:
    v31 = 0;
LABEL_27:
    v60 = 0;
    goto LABEL_13;
  }
  v92 = 0;
  objc_msgSend_SSID_(v19, v20, (uint64_t)&v92, v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v92;
  v30 = v25;
  if (!v24)
  {
    v36 = 0;
    v54 = 0;
    goto LABEL_24;
  }
  v91 = v25;
  objc_msgSend_BSSID_(v23, v26, (uint64_t)&v91, v28, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v91;

  if (!v31)
  {
    v36 = 0;
    v54 = 0;
    v60 = 0;
    v30 = v32;
    goto LABEL_13;
  }
  if (objc_msgSend_serviceType(v89, v26, v27, v28, v29) != 4)
  {
    v36 = 0;
    v54 = 0;
    goto LABEL_11;
  }
  objc_msgSend___currentNetworkProfileWithInterfaceName_(self, v33, (uint64_t)v15, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v36, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToData = objc_msgSend_isEqualToData_(v41, v42, (uint64_t)v24, v43, v44);

  if ((isEqualToData & 1) == 0)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v46, *MEMORY[0x1E0CB2FE0], 1, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    v54 = 0;
    goto LABEL_27;
  }
  v50 = v24;
  objc_msgSend_bundleID(v89, v46, v47, v48, v49);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    objc_msgSend_bundleID(v36, v33, v51, v52, v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v55, v56, (uint64_t)v54, v57, v58);

    if ((isEqualToString & 1) != 0)
    {
      v24 = v50;
LABEL_11:
      v90 = v32;
      objc_msgSend___hashedBSSID_XPCConnection_error_(self, v33, (uint64_t)v31, (uint64_t)v89, (uint64_t)&v90);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v90;

      goto LABEL_13;
    }
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v33, *MEMORY[0x1E0CB2FE0], 1, 0);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  v60 = 0;
  v24 = v50;
LABEL_13:
  if (!v30)
  {
    v87 = v24;
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v26, v27, v28, v29);
    v66 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v66, v67, (uint64_t)v60, (uint64_t)CFSTR("Result"), v68);
    objc_msgSend_response(v88, v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend_response(v88, v74, v75, v76, v77);
      v78 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v86 = v31;
      v83 = v54;
      v84 = v36;
      v85 = (void *)objc_msgSend_copy(v66, v79, v80, v81, v82);
      ((void (**)(_QWORD, _QWORD, void *))v78)[2](v78, 0, v85);

      v36 = v84;
      v54 = v83;
      v31 = v86;

    }
    v24 = v87;
    goto LABEL_19;
  }
  objc_msgSend_response(v88, v26, v27, v28, v29);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend_response(v88, v62, v63, v64, v65);
    v66 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v66)[2](v66, v30, 0);
LABEL_19:

  }
}

- (void)__getLinkQualityMetric:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;

  v47 = a3;
  objc_msgSend_requestParameters(v47, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend___linkQualityMetricWithInterfaceName_(self, v14, (uint64_t)v13, v15, v16);
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v21, (uint64_t)CFSTR("Result"), v24);
    objc_msgSend_response(v47, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_response(v47, v30, v31, v32, v33);
      v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend_copy(v22, v35, v36, v37, v38);
      ((void (**)(_QWORD, _QWORD, void *))v34)[2](v34, 0, v39);

    }
    v40 = 0;
    goto LABEL_6;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v14, *MEMORY[0x1E0CB2FE0], 6, 0);
  v41 = objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    v21 = 0;
    goto LABEL_3;
  }
  v40 = (void *)v41;
  objc_msgSend_response(v47, v17, v18, v19, v20);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
    goto LABEL_7;
  objc_msgSend_response(v47, v43, v44, v45, v46);
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v21)[2](v21, v40, 0);
LABEL_6:

LABEL_7:
}

- (void)__getPlatformCapabilities:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const __CFDictionary *v60;
  const char *v61;
  uint64_t v62;
  io_service_t MatchingService;
  io_object_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void (**v112)(_QWORD, _QWORD, _QWORD);
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  void *v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_set(MEMORY[0x1E0C99E20], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apple80211WithInterfaceName_(self, v10, 0, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceNames_(v13, v14, 0, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_apple80211WithInterfaceName_(self, v18, 0, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_virtualInterfaceNames_(v21, v22, 0, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v26 = v17;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v122, (uint64_t)v128, 16);
  if (v28)
  {
    v32 = v28;
    v33 = *(_QWORD *)v123;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v123 != v33)
          objc_enumerationMutation(v26);
        objc_msgSend_apple80211WithInterfaceName_(self, v29, *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * i), v30, v31);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_capabilities_(v35, v36, 0, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
          objc_msgSend_addObjectsFromArray_(v9, v40, (uint64_t)v39, v41, v42);

      }
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v122, (uint64_t)v128, 16);
    }
    while (v32);
  }

  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v43 = v25;
  v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v118, (uint64_t)v127, 16);
  if (v45)
  {
    v49 = v45;
    v50 = *(_QWORD *)v119;
    do
    {
      for (j = 0; j != v49; ++j)
      {
        if (*(_QWORD *)v119 != v50)
          objc_enumerationMutation(v43);
        objc_msgSend_apple80211WithInterfaceName_(self, v46, *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * j), v47, v48, (_QWORD)v118);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_capabilities_(v52, v53, 0, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
          objc_msgSend_addObjectsFromArray_(v9, v57, (uint64_t)v56, v58, v59);

      }
      v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v118, (uint64_t)v127, 16);
    }
    while (v49);
  }

  v60 = IOServiceNameMatching("pci14e4,4464");
  if (v60)
  {
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v60);
    if (MatchingService)
    {
      v64 = MatchingService;
      v65 = (void *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("WiFiCapability"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3u);
      if (v65)
      {
        v69 = v65;
        objc_msgSend_objectForKey_(v65, v66, (uint64_t)CFSTR("awdl"), v67, v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend_BOOLValue(v70, v71, v72, v73, v74);

        if (v75)
          objc_msgSend_addObject_(v9, v76, (uint64_t)&unk_1E615ECD0, v77, v78);
        objc_msgSend_objectForKey_(v69, v76, (uint64_t)CFSTR("ranging"), v77, v78, (_QWORD)v118);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend_BOOLValue(v79, v80, v81, v82, v83);

        if (v84)
          objc_msgSend_addObject_(v9, v85, (uint64_t)&unk_1E615ECE8, v86, v87);
        CFRelease(v69);
      }
      IOObjectRelease(v64);
    }
  }
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v61, (uint64_t)CFSTR("integerValue"), 1, v62, (_QWORD)v118);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v88;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v89, (uint64_t)&v126, 1, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingDescriptors_(v9, v92, (uint64_t)v91, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v96, v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v100, v101, (uint64_t)v95, (uint64_t)CFSTR("Result"), v102);
  objc_msgSend_response(v4, v103, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  if (v107)
  {
    objc_msgSend_response(v4, v108, v109, v110, v111);
    v112 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v117 = (void *)objc_msgSend_copy(v100, v113, v114, v115, v116);
    ((void (**)(_QWORD, _QWORD, void *))v112)[2](v112, 0, v117);

  }
}

- (void)__updateCurrentKnownBSSWithIPConfigurationForInterfaceName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *mutexQueue;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB34C8];
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1B06B71FC;
  v19[3] = &unk_1E61333E0;
  v19[4] = self;
  v20 = v4;
  v7 = v4;
  objc_msgSend_blockOperationWithBlock_(v5, v8, (uint64_t)v19, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v11, v12, (uint64_t)CFSTR("updateKnownBSS"), v13, v14);
  mutexQueue = self->_mutexQueue;
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = sub_1B06B7D94;
  v17[3] = &unk_1E61333E0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  dispatch_async(mutexQueue, v17);

}

- (void)__getPrivateMACAddress:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;

  v50 = a3;
  objc_msgSend_info(v50, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("NetworkProfile"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_privateMACManager(self, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v21 = v17;
      objc_msgSend_privateMACAddressForNetworkProfile_(v17, v18, (uint64_t)v12, v19, v20);
      v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_4:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v26, (uint64_t)CFSTR("Result"), v29);
      objc_msgSend_response(v50, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend_response(v50, v35, v36, v37, v38);
        v39 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend_copy(v27, v40, v41, v42, v43);
        ((void (**)(_QWORD, _QWORD, void *))v39)[2](v39, 0, v44);

      }
      v21 = 0;
      goto LABEL_7;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 6, 0);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 22, 0);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v26 = 0;
    goto LABEL_4;
  }
  objc_msgSend_response(v50, v22, v23, v24, v25);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
    goto LABEL_8;
  objc_msgSend_response(v50, v46, v47, v48, v49);
  v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v26)[2](v26, v21, 0);
LABEL_7:

LABEL_8:
}

- (void)__getPrivateMACAddressMode:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;

  v53 = a3;
  objc_msgSend_info(v53, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("NetworkProfile"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_privateMACManager(self, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v21 = v17;
      v22 = (void *)objc_msgSend_privateMACAddressModeForNetworkProfile_(v17, v18, (uint64_t)v12, v19, v20);

      goto LABEL_4;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 6, 0);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 22, 0);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
LABEL_4:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v23, v24, v25, v26);
    v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v28, (uint64_t)v22, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, (uint64_t)CFSTR("Result"), v33);

    objc_msgSend_response(v53, v34, v35, v36, v37);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend_response(v53, v38, v39, v40, v41);
      v42 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend_copy(v27, v43, v44, v45, v46);
      ((void (**)(_QWORD, _QWORD, void *))v42)[2](v42, 0, v47);

      v22 = 0;
    }
    goto LABEL_6;
  }
  objc_msgSend_response(v53, v23, v24, v25, v26);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v48)
    goto LABEL_7;
  objc_msgSend_response(v53, v49, v50, v51, v52);
  v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v27)[2](v27, v22, 0);
LABEL_6:

LABEL_7:
}

- (void)__getPrivateMACAddressModeSystemSetting:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;

  v45 = a3;
  objc_msgSend_privateMACManager(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (v8)
  {
    v18 = (void *)objc_msgSend_systemSetting(v8, v9, v10, v11, v12);
    goto LABEL_3;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v9, *MEMORY[0x1E0CB2FE0], 6, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
LABEL_3:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v14, v15, v16, v17);
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v20, (uint64_t)v18, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v19, v24, (uint64_t)v23, (uint64_t)CFSTR("Result"), v25);

    objc_msgSend_response(v45, v26, v27, v28, v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend_response(v45, v30, v31, v32, v33);
      v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend_copy(v19, v35, v36, v37, v38);
      ((void (**)(_QWORD, _QWORD, void *))v34)[2](v34, 0, v39);

      v18 = 0;
    }
    goto LABEL_5;
  }
  objc_msgSend_response(v45, v14, v15, v16, v17);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
    goto LABEL_6;
  objc_msgSend_response(v45, v41, v42, v43, v44);
  v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v19)[2](v19, v18, 0);
LABEL_5:

LABEL_6:
}

- (void)__setPrivateMACAddressModeSystemSetting:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  id v38;

  v38 = a3;
  objc_msgSend_info(v38, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("PrivateMACMode"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_privateMACManager(self, v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v22 = (void *)v17;
      v23 = objc_msgSend_integerValue(v12, v18, v19, v20, v21);
      objc_msgSend_setSystemSetting_(v22, v24, v23, v25, v26);

      v31 = 0;
      goto LABEL_4;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 6, 0);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 22, 0);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
  objc_msgSend_response(v38, v27, v28, v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend_response(v38, v33, v34, v35, v36);
    v37 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v37)[2](v37, v31, 0);

  }
}

- (void)__setPrivateMACAddressUserJoinFailureUIState:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (**v44)(_QWORD, _QWORD, _QWORD);
  id v45;

  v45 = a3;
  objc_msgSend_info(v45, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("NetworkProfile"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    && (objc_msgSend_info(v45, v13, v14, v15, v16),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)CFSTR("State"), v19, v20),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v21))
  {
    objc_msgSend_privateMACManager(self, v13, v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v30 = (void *)v25;
      v31 = objc_msgSend_BOOLValue(v21, v26, v27, v28, v29);
      objc_msgSend_setUserJoinFailureUIState_networkProfile_(v30, v32, v31, (uint64_t)v12, v33);

      v38 = 0;
    }
    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v26, *MEMORY[0x1E0CB2FE0], 6, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 22, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_response(v45, v34, v35, v36, v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend_response(v45, v40, v41, v42, v43);
    v44 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v44)[2](v44, v38, 0);

  }
}

- (void)__setPrivateMACAddressMode:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (**v75)(_QWORD, _QWORD, _QWORD);
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void (**v84)(_QWORD, _QWORD, _QWORD);
  _QWORD v85[4];
  id v86;

  v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v21 = 0;
    goto LABEL_13;
  }
  objc_msgSend_apple80211WithInterfaceName_(self, v15, (uint64_t)v14, v16, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
LABEL_13:
    v26 = 0;
    v35 = 0;
    goto LABEL_14;
  }
  objc_msgSend_info(v4, v15, v18, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)CFSTR("NetworkProfile"), v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v35 = 0;
    goto LABEL_16;
  }
  objc_msgSend_info(v4, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)CFSTR("PrivateMACMode"), v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
LABEL_16:
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v27, *MEMORY[0x1E0CB2FE0], 22, 0);
LABEL_17:
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      objc_msgSend_response(v4, v76, v77, v78, v79);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
        goto LABEL_11;
      objc_msgSend_response(v4, v80, v81, v82, v83);
      v84 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v84)[2](v84, v70, 0);

    }
    v43 = 0;
    goto LABEL_11;
  }
  objc_msgSend_privateMACManager(self, v27, v36, v37, v38);
  v39 = objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
LABEL_14:
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v15, *MEMORY[0x1E0CB2FE0], 6, 0);
    goto LABEL_17;
  }
  v43 = (void *)v39;
  objc_msgSend_addedAt(v26, v15, v40, v41, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = objc_msgSend_integerValue(v35, v45, v46, v47, v48);
  if (v44)
  {
    objc_msgSend_setPrivateMACAddressModeUserSetting_(v26, v49, v50, v51, v52);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPrivateMACAddressModeUserSettingUpdatedAt_(v26, v58, (uint64_t)v57, v59, v60);

    objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], v61, (uint64_t)&unk_1E615ED30, v62, v63, &unk_1E615ED48, 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = sub_1B06B88E0;
    v85[3] = &unk_1E61344A8;
    v86 = v4;
    objc_msgSend___updateNetworkProfile_updateProperties_interfaceName_reply_(self, v65, (uint64_t)v26, (uint64_t)v64, (uint64_t)v14, v85);

LABEL_10:
    v70 = 0;
    goto LABEL_11;
  }
  objc_msgSend_setTemporaryUserSetting_networkProfile_(v43, v49, v50, (uint64_t)v26, v52);
  objc_msgSend_response(v4, v66, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    objc_msgSend_response(v4, v71, v72, v73, v74);
    v75 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v75[2](v75, 0, 0);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)__getQuickProbeRequired:(id)a3
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;

  v36 = a3;
  _os_feature_enabled_impl();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v3, *MEMORY[0x1E0CB2FE0], 45, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5, v6, v7);
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v15, 0, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v14, v19, (uint64_t)v18, (uint64_t)CFSTR("Result"), v20);

    objc_msgSend_response(v36, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend_response(v36, v26, v27, v28, v29);
      v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend_copy(v14, v31, v32, v33, v34);
      ((void (**)(_QWORD, _QWORD, void *))v30)[2](v30, 0, v35);

    }
    goto LABEL_6;
  }
  objc_msgSend_response(v36, v4, v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_response(v36, v10, v11, v12, v13);
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v14)[2](v14, v8, 0);
LABEL_6:

  }
}

- (void)__performAutoJoinWithParameters:(id)a3 interfaceName:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CWFXPCRequest *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  CWFRequestParameters *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_delegate(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_alloc_init(CWFXPCRequest);
    objc_msgSend_setType_(v13, v14, 177, v15, v16);
    v41 = CFSTR("AutoJoinParams");
    v42[0] = v6;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)v42, (uint64_t)&v41, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v13, v19, (uint64_t)v18, v20, v21);

    v22 = objc_alloc_init(CWFRequestParameters);
    objc_msgSend_setInterfaceName_(v22, v23, (uint64_t)v7, v24, v25);
    objc_msgSend_setRequestParameters_(v13, v26, (uint64_t)v22, v27, v28);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReceivedAt_(v13, v34, (uint64_t)v33, v35, v36);

    objc_msgSend_setResponse_(v13, v37, (uint64_t)&unk_1E61344E8, v38, v39);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v12, v40, (uint64_t)self, (uint64_t)self->_internalRequestXPCConnection, (uint64_t)v13);

  }
}

- (void)__disassocWithReason:(int64_t)a3 interfaceName:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CWFXPCRequest *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  CWFRequestParameters *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend_delegate(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc_init(CWFXPCRequest);
    objc_msgSend_setType_(v12, v13, 63, v14, v15);
    v41 = CFSTR("DisassocReason");
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v16, a3, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v42, (uint64_t)&v41, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v12, v22, (uint64_t)v21, v23, v24);

    v25 = objc_alloc_init(CWFRequestParameters);
    objc_msgSend_setInterfaceName_(v25, v26, (uint64_t)v6, v27, v28);
    objc_msgSend_setRequestParameters_(v12, v29, (uint64_t)v25, v30, v31);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReceivedAt_(v12, v37, (uint64_t)v36, v38, v39);

    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v11, v40, (uint64_t)self, (uint64_t)self->_internalRequestXPCConnection, (uint64_t)v12);
  }

}

- (void)__updateNetworkProfile:(id)a3 updateProperties:(id)a4 interfaceName:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  CWFXPCRequest *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  CWFRequestParameters *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  _QWORD v55[4];
  id v56;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_delegate(self, v14, v15, v16, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v18, v19, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)v10, (uint64_t)CFSTR("NetworkProfile"), v25);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v26, (uint64_t)v11, (uint64_t)CFSTR("NetworkProfileProperties"), v27);
    v28 = objc_alloc_init(CWFXPCRequest);
    objc_msgSend_setType_(v28, v29, 61, v30, v31);
    objc_msgSend_setInfo_(v28, v32, (uint64_t)v23, v33, v34);
    v35 = objc_alloc_init(CWFRequestParameters);
    objc_msgSend_setInterfaceName_(v35, v36, (uint64_t)v12, v37, v38);
    objc_msgSend_setRequestParameters_(v28, v39, (uint64_t)v35, v40, v41);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReceivedAt_(v28, v47, (uint64_t)v46, v48, v49);

    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = sub_1B06B8F5C;
    v55[3] = &unk_1E6133760;
    v56 = v13;
    objc_msgSend_setResponse_(v28, v50, (uint64_t)v55, v51, v52);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v22, v53, (uint64_t)self, (uint64_t)self->_internalRequestXPCConnection, (uint64_t)v28);

  }
  else if (v13)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 6, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v13 + 2))(v13, v54);

  }
}

- (void)__privateMACEvaluationCompletedWithState:(int64_t)a3 knownNetwork:(id)a4 interfaceName:(id)a5
{
  _os_feature_enabled_impl();
}

- (void)__reportQuickProbeResult:(id)a3
{
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;

  v15 = a3;
  _os_feature_enabled_impl();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v3, *MEMORY[0x1E0CB2FE0], 45, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v15, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_response(v15, v10, v11, v12, v13);
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v14)[2](v14, v4, 0);

  }
}

- (void)__setLQMConfig:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (**v41)(_QWORD, _QWORD, _QWORD);
  id v42;

  v4 = a3;
  objc_msgSend_requestParameters(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_info(v4, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)CFSTR("LQMConfiguration"), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_apple80211WithInterfaceName_(self, v24, (uint64_t)v14, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v30 = v27;
      v42 = 0;
      objc_msgSend_setLQMConfig_error_(v27, v28, (uint64_t)v23, (uint64_t)&v42, v29);
      v31 = v42;

      goto LABEL_4;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v28, *MEMORY[0x1E0CB2FE0], 6, 0);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v24, *MEMORY[0x1E0CB2FE0], 22, 0);
  }
  v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
  objc_msgSend_response(v4, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend_response(v4, v37, v38, v39, v40);
    v41 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v41)[2](v41, v31, 0);

  }
}

- (void)__privateMACSettingChangedForNetworkProfile:(id)a3 interfaceName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *mutexQueue;
  id v17;
  _QWORD block[5];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB34C8];
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1B06B9288;
  v20[3] = &unk_1E6133340;
  v20[4] = self;
  v21 = v7;
  v22 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend_blockOperationWithBlock_(v8, v12, (uint64_t)v20, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  mutexQueue = self->_mutexQueue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = sub_1B06B9694;
  block[3] = &unk_1E61333E0;
  block[4] = self;
  v19 = v15;
  v17 = v15;
  dispatch_async(mutexQueue, block);

}

- (void)__privateMACEvaluationCheckConnectivity
{
  _os_feature_enabled_impl();
}

- (void)__startNetworkRelayBridgeWithHostAPConfiguration:(id)a3 interfaceName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  id netRBStartServiceReply;
  NETRBClient *Internal;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t v23;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  id v64;
  const char *v65;
  uint64_t v66;
  id v67;
  const char *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  const char *v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  const char *v78;
  void *v79;
  NSObject *v80;
  id v81;
  id v82;
  int v83;
  _BYTE location[12];
  __int16 v85;
  const char *v86;
  __int16 v87;
  int v88;
  __int16 v89;
  int v90;
  __int16 v91;
  int v92;
  int v93;
  int v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = (void (**)(_QWORD, _QWORD))v10;
  if (self->_netRBClient)
  {
    CWFGetOSLog();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      CWFGetOSLog();
      v50 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = MEMORY[0x1E0C81028];
      v64 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)location = 0;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v65, *MEMORY[0x1E0CB2FE0], 37, 0);
    v66 = objc_claimAutoreleasedReturnValue();
    goto LABEL_70;
  }
  if (!v8)
  {
    CWFGetOSLog();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      CWFGetOSLog();
      v52 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = MEMORY[0x1E0C81028];
      v67 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446722;
      *(_QWORD *)&location[4] = "-[CWFXPCRequestProxy __startNetworkRelayBridgeWithHostAPConfiguration:interfaceName:reply:]";
      v85 = 2082;
      v86 = "CWFXPCRequestProxy.m";
      v87 = 1024;
      v88 = 7034;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_38;
  }
  if (!v9)
  {
    CWFGetOSLog();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      CWFGetOSLog();
      v52 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = MEMORY[0x1E0C81028];
      v69 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446722;
      *(_QWORD *)&location[4] = "-[CWFXPCRequestProxy __startNetworkRelayBridgeWithHostAPConfiguration:interfaceName:reply:]";
      v85 = 2082;
      v86 = "CWFXPCRequestProxy.m";
      v87 = 1024;
      v88 = 7039;
      _os_log_send_and_compose_impl();
    }
LABEL_38:

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v68, *MEMORY[0x1E0CB2FE0], 22, 0);
    v66 = objc_claimAutoreleasedReturnValue();
LABEL_70:
    v48 = (void *)v66;
    v23 = 0;
    goto LABEL_71;
  }
  v16 = (void *)objc_msgSend_copy(v10, v11, v12, v13, v14);
  netRBStartServiceReply = self->_netRBStartServiceReply;
  self->_netRBStartServiceReply = v16;

  objc_initWeak((id *)location, self);
  v83 = 0;
  objc_copyWeak(&v82, (id *)location);
  Internal = (NETRBClient *)_NETRBClientCreateInternal();
  self->_netRBClient = Internal;
  if (!Internal)
  {
    CWFGetOSLog();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      CWFGetOSLog();
      v55 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v55 = MEMORY[0x1E0C81028];
      v70 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v93 = 67109120;
      v94 = v83;
      _os_log_send_and_compose_impl();
    }

    objc_destroyWeak(&v82);
    objc_destroyWeak((id *)location);
    goto LABEL_51;
  }
  objc_destroyWeak(&v82);
  objc_destroyWeak((id *)location);
  if (objc_msgSend_bridgeMode(v8, v19, v20, v21, v22) == 201)
  {
    v93 = 0;
    v83 = 1020;
    if ((_NETRBClientGetGlobalServiceState() & 1) == 0)
    {
      CWFGetOSLog();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        CWFGetOSLog();
        v61 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v61 = MEMORY[0x1E0C81028];
        v74 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136446722;
        *(_QWORD *)&location[4] = "-[CWFXPCRequestProxy __startNetworkRelayBridgeWithHostAPConfiguration:interfaceName:reply:]";
        v85 = 2082;
        v86 = "CWFXPCRequestProxy.m";
        v87 = 1024;
        v88 = 7115;
        _os_log_send_and_compose_impl();
      }
      v75 = 6;
      goto LABEL_69;
    }
    if (v83 == 1023)
    {
      if ((_NETRBClientIsAllowedMoreHost() & 1) != 0)
        goto LABEL_9;
      CWFGetOSLog();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (v63)
      {
        CWFGetOSLog();
        v61 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v61 = MEMORY[0x1E0C81028];
        v77 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136446722;
        *(_QWORD *)&location[4] = "-[CWFXPCRequestProxy __startNetworkRelayBridgeWithHostAPConfiguration:interfaceName:reply:]";
        v85 = 2082;
        v86 = "CWFXPCRequestProxy.m";
        v87 = 1024;
        v88 = 7124;
        goto LABEL_67;
      }
    }
    else
    {
      CWFGetOSLog();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        CWFGetOSLog();
        v61 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v61 = MEMORY[0x1E0C81028];
        v76 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136447234;
        *(_QWORD *)&location[4] = "-[CWFXPCRequestProxy __startNetworkRelayBridgeWithHostAPConfiguration:interfaceName:reply:]";
        v85 = 2082;
        v86 = "CWFXPCRequestProxy.m";
        v87 = 1024;
        v88 = 7119;
        v89 = 1024;
        v90 = v83;
        v91 = 1024;
        v92 = v93;
LABEL_67:
        v75 = 1;
        _os_log_send_and_compose_impl();
LABEL_69:

        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v78, *MEMORY[0x1E0CB2FE0], v75, 0);
        v66 = objc_claimAutoreleasedReturnValue();
        goto LABEL_70;
      }
    }
    v75 = 1;
    goto LABEL_69;
  }
LABEL_9:
  v23 = xpc_dictionary_create(0, 0, 0);
  if (!v23)
  {
    CWFGetOSLog();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      CWFGetOSLog();
      v57 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = MEMORY[0x1E0C81028];
      v71 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446722;
      *(_QWORD *)&location[4] = "-[CWFXPCRequestProxy __startNetworkRelayBridgeWithHostAPConfiguration:interfaceName:reply:]";
      v85 = 2082;
      v86 = "CWFXPCRequestProxy.m";
      v87 = 1024;
      v88 = 7131;
      _os_log_send_and_compose_impl();
    }

LABEL_51:
    v48 = 0;
    v23 = 0;
    goto LABEL_12;
  }
  v24 = (const char *)*MEMORY[0x1E0D51A88];
  v25 = objc_retainAutorelease(v9);
  v30 = (const char *)objc_msgSend_UTF8String(v25, v26, v27, v28, v29);
  xpc_dictionary_set_string(v23, v24, v30);
  xpc_dictionary_set_uint64(v23, (const char *)*MEMORY[0x1E0D51A80], 3uLL);
  objc_msgSend_bridgeInterfaceName(v8, v31, v32, v33, v34);
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v35, v36, v37, v38, v39);
  objc_msgSend_bridgeMode(v8, v40, v41, v42, v43);
  objc_msgSend_bridgeType(v8, v44, v45, v46, v47);
  LOBYTE(v24) = _NETRBClientStartService();

  if ((v24 & 1) != 0)
  {
    v48 = 0;
    goto LABEL_12;
  }
  CWFGetOSLog();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    CWFGetOSLog();
    v59 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = MEMORY[0x1E0C81028];
    v72 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 136446722;
    *(_QWORD *)&location[4] = "-[CWFXPCRequestProxy __startNetworkRelayBridgeWithHostAPConfiguration:interfaceName:reply:]";
    v85 = 2082;
    v86 = "CWFXPCRequestProxy.m";
    v87 = 1024;
    v88 = 7138;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v73, *MEMORY[0x1E0CB2FE0], 6, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NETRBClientDestroy() & 1) == 0)
  {
    CWFGetOSLog();
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (v79)
    {
      CWFGetOSLog();
      v80 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v80 = MEMORY[0x1E0C81028];
      v81 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446722;
      *(_QWORD *)&location[4] = "-[CWFXPCRequestProxy __startNetworkRelayBridgeWithHostAPConfiguration:interfaceName:reply:]";
      v85 = 2082;
      v86 = "CWFXPCRequestProxy.m";
      v87 = 1024;
      v88 = 7140;
      _os_log_send_and_compose_impl();
    }

  }
  self->_netRBClient = 0;
LABEL_71:
  if (v15 && v48)
    ((void (**)(_QWORD, void *))v15)[2](v15, v48);
LABEL_12:

}

- (void)__stopNetworkRelayBridgeForInterfaceName:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  id netRBStopServiceReply;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  id v25;
  const char *v26;
  id v27;
  const char *v28;
  id v29;
  const char *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  int *v37;
  int v38;
  int v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = (void (**)(_QWORD, _QWORD))v7;
  if (!self->_netRBClient)
  {
    CWFGetOSLog();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      CWFGetOSLog();
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = MEMORY[0x1E0C81028];
      v25 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v39) = 0;
      v38 = 2;
      v37 = &v39;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v26, *MEMORY[0x1E0CB2FE0], 6, 0, v37, v38);
    goto LABEL_27;
  }
  if (!v6)
  {
    CWFGetOSLog();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      CWFGetOSLog();
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = MEMORY[0x1E0C81028];
      v27 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v39 = 136446722;
      v40 = "-[CWFXPCRequestProxy __stopNetworkRelayBridgeForInterfaceName:reply:]";
      v41 = 2082;
      v42 = "CWFXPCRequestProxy.m";
      v43 = 1024;
      v44 = 7170;
      v38 = 28;
      v37 = &v39;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v28, *MEMORY[0x1E0CB2FE0], 22, 0, v37, v38);
LABEL_27:
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v13 = (void *)objc_msgSend_copy(v7, v8, v9, v10, v11);
  netRBStopServiceReply = self->_netRBStopServiceReply;
  self->_netRBStopServiceReply = v13;

  if (IOPMAssertionRelease(self->_netRBAssertionID))
  {
    CWFGetOSLog();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      CWFGetOSLog();
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v39 = 136446722;
      v40 = "-[CWFXPCRequestProxy __stopNetworkRelayBridgeForInterfaceName:reply:]";
      v41 = 2082;
      v42 = "CWFXPCRequestProxy.m";
      v43 = 1024;
      v44 = 7176;
      _os_log_send_and_compose_impl();
    }

  }
  if ((_NETRBClientStopService() & 1) != 0)
  {
    v18 = 0;
    goto LABEL_12;
  }
  CWFGetOSLog();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    CWFGetOSLog();
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = MEMORY[0x1E0C81028];
    v29 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v39 = 136446722;
    v40 = "-[CWFXPCRequestProxy __stopNetworkRelayBridgeForInterfaceName:reply:]";
    v41 = 2082;
    v42 = "CWFXPCRequestProxy.m";
    v43 = 1024;
    v44 = 7180;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v30, *MEMORY[0x1E0CB2FE0], 6, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NETRBClientSetHostCount() & 1) == 0)
  {
    CWFGetOSLog();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      CWFGetOSLog();
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = MEMORY[0x1E0C81028];
      v35 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v39 = 136446722;
      v40 = "-[CWFXPCRequestProxy __stopNetworkRelayBridgeForInterfaceName:reply:]";
      v41 = 2082;
      v42 = "CWFXPCRequestProxy.m";
      v43 = 1024;
      v44 = 7183;
      _os_log_send_and_compose_impl();
    }

  }
  if ((_NETRBClientDestroy() & 1) == 0)
  {
    CWFGetOSLog();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      CWFGetOSLog();
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = MEMORY[0x1E0C81028];
      v36 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v39 = 136446722;
      v40 = "-[CWFXPCRequestProxy __stopNetworkRelayBridgeForInterfaceName:reply:]";
      v41 = 2082;
      v42 = "CWFXPCRequestProxy.m";
      v43 = 1024;
      v44 = 7185;
      _os_log_send_and_compose_impl();
    }

  }
  self->_netRBClient = 0;
LABEL_34:
  if (v12 && v18)
    ((void (**)(_QWORD, void *))v12)[2](v12, v18);
LABEL_12:

}

- (void)__startHostAPMode:(id)a3 XPCConnection:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CWFXPCRequest *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  _QWORD v71[4];
  id v72;
  CWFXPCRequestProxy *v73;
  id v74;
  id v75;
  id v76;
  int v77;
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_info(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)CFSTR("HostAPConfiguration"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_delegate(self, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = objc_alloc_init(CWFXPCRequest);
    objc_msgSend_setType_(v22, v23, 220, v24, v25);
    objc_msgSend_requestParameters(v6, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestParameters_(v22, v31, (uint64_t)v30, v32, v33);

    objc_msgSend_info(v6, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v22, v39, (uint64_t)v38, v40, v41);

    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = sub_1B06BAEBC;
    v71[3] = &unk_1E6134588;
    v72 = v16;
    v73 = self;
    v74 = v6;
    v42 = v21;
    v75 = v42;
    v43 = v7;
    v76 = v43;
    objc_msgSend_setResponse_(v22, v44, (uint64_t)v71, v45, v46);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v42, v47, (uint64_t)self, (uint64_t)v43, (uint64_t)v22);

    v48 = v72;
LABEL_10:

    goto LABEL_11;
  }
  CWFGetOSLog();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    CWFGetOSLog();
    v50 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = MEMORY[0x1E0C81028];
    v51 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    v56 = objc_msgSend_type(v6, v52, v53, v54, v55);
    sub_1B063544C(v56, v57, v58, v59, v60);
    v77 = 138543362;
    v78 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

  }
  objc_msgSend_response(v6, v61, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    objc_msgSend_response(v6, v66, v67, v68, v69);
    v22 = (CWFXPCRequest *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v70, *MEMORY[0x1E0CB2FE0], 45, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(CWFXPCRequest *, void *, _QWORD))v22->super.super._iop.__nextOp)(v22, v48, 0);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)__stopHostAPMode:(id)a3 XPCConnection:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CWFXPCRequest *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  NSObject *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  _QWORD v52[5];
  id v53;
  int v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_delegate(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_alloc_init(CWFXPCRequest);
    objc_msgSend_setType_(v13, v14, 221, v15, v16);
    objc_msgSend_requestParameters(v6, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestParameters_(v13, v22, (uint64_t)v21, v23, v24);

    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = sub_1B06BB774;
    v52[3] = &unk_1E61336C0;
    v52[4] = self;
    v53 = v6;
    objc_msgSend_setResponse_(v13, v25, (uint64_t)v52, v26, v27);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v12, v28, (uint64_t)self, (uint64_t)v7, (uint64_t)v13);

LABEL_10:
    goto LABEL_11;
  }
  CWFGetOSLog();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    CWFGetOSLog();
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = MEMORY[0x1E0C81028];
    v31 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v36 = objc_msgSend_type(v6, v32, v33, v34, v35);
    sub_1B063544C(v36, v37, v38, v39, v40);
    v54 = 138543362;
    v55 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

  }
  objc_msgSend_response(v6, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend_response(v6, v46, v47, v48, v49);
    v13 = (CWFXPCRequest *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v50, *MEMORY[0x1E0CB2FE0], 45, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(CWFXPCRequest *, void *, _QWORD))v13->super.super._iop.__nextOp)(v13, v51, 0);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)__logLqmSummary:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;

  objc_msgSend___apple80211WithInterfaceName_(self, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v5 && !objc_msgSend_virtualInterfaceRole(v5, v6, v7, v8, v9))
  {
    objc_msgSend_LQMSummary_(v10, v11, 0, v12, v13);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v14 = objc_retainAutorelease(v30);
      v19 = 0;
      v29 = objc_msgSend_bytes(v14, v15, v16, v17, v18);
      v20 = MEMORY[0x1E0C81028];
      do
      {
        if (*(_BYTE *)(v29 + 160 + v19))
        {
          CWFGetOSLog();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            CWFGetOSLog();
            v22 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = v20;
            v22 = v20;
          }

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            _os_log_send_and_compose_impl();

        }
        v19 += 256;
      }
      while (v19 != 4096);
      v24 = 0;
      v25 = MEMORY[0x1E0C81028];
      do
      {
        if (*(_BYTE *)(v29 + 4256 + v24))
        {
          CWFGetOSLog();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            CWFGetOSLog();
            v27 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v28 = v25;
            v27 = v25;
          }

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            _os_log_send_and_compose_impl();

        }
        v24 += 256;
      }
      while (v24 != 1280);
    }

  }
}

- (void)__getCurrentScanResult:(id)a3 XPCConnection:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CWFXPCRequest *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  NSObject *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  _QWORD v53[4];
  id v54;
  int v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_delegate(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = objc_alloc_init(CWFXPCRequest);
    objc_msgSend_setType_(v16, v17, 57, v18, v19);
    objc_msgSend_requestParameters(v8, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestParameters_(v16, v25, (uint64_t)v24, v26, v27);

    objc_msgSend_info(v8, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v16, v33, (uint64_t)v32, v34, v35);

    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = sub_1B06BBF18;
    v53[3] = &unk_1E6133760;
    v54 = v10;
    objc_msgSend_setResponse_(v16, v36, (uint64_t)v53, v37, v38);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v15, v39, (uint64_t)self, (uint64_t)v9, (uint64_t)v16);

LABEL_10:
    goto LABEL_11;
  }
  CWFGetOSLog();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    CWFGetOSLog();
    v41 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = MEMORY[0x1E0C81028];
    v42 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    v47 = objc_msgSend_type(v8, v43, v44, v45, v46);
    sub_1B063544C(v47, v48, v49, v50, v51);
    v55 = 138543362;
    v56 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

  }
  if (v10)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v52, *MEMORY[0x1E0CB2FE0], 45, 0);
    v16 = (CWFXPCRequest *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, CWFXPCRequest *, _QWORD))v10 + 2))(v10, v16, 0);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)__getCurrentScanResult:(id)a3 XPCConnection:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  const char *v28;
  void (**v29)(id, id, _QWORD);
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  void (**v40)(id, id, _QWORD);
  uint64_t *v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v6 = a3;
  v7 = a4;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1B063EAA0;
  v47 = sub_1B063EA18;
  v48 = 0;
  objc_msgSend_requestParameters(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17
    && (objc_msgSend_apple80211WithInterfaceName_(self, v18, (uint64_t)v17, v19, v20),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        (v24 = v21) != 0))
  {
    v42 = 0;
    objc_msgSend_currentNetwork_(v21, v18, (uint64_t)&v42, v22, v23);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v42;
    v27 = (void *)v44[5];
    v44[5] = v25;

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = sub_1B06BC198;
    v39[3] = &unk_1E61345B0;
    v41 = &v43;
    v40 = (void (**)(id, id, _QWORD))v6;
    objc_msgSend___getCurrentScanResult_XPCConnection_reply_(self, v28, (uint64_t)v40, (uint64_t)v7, (uint64_t)v39);
    v29 = v40;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB2FE0], 6, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_response(v6, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      v24 = 0;
      goto LABEL_5;
    }
    objc_msgSend_response(v6, v35, v36, v37, v38);
    v29 = (void (**)(id, id, _QWORD))objc_claimAutoreleasedReturnValue();
    v29[2](v29, v26, 0);
    v24 = 0;
  }

LABEL_5:
  _Block_object_dispose(&v43, 8);

}

- (void)__getKnownNetworkInfoForLocalNetworkPrompt:(id)a3 XPCConnection:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  CWFLocalDeviceDiscovery *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  CWFKnownNetworkPreparer *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (**v63)(_QWORD, _QWORD, _QWORD);
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (**v74)(_QWORD, _QWORD, _QWORD);
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  CWFLocalDeviceDiscovery *v85;
  _QWORD v86[4];
  id v87;

  v6 = a3;
  v7 = a4;
  objc_msgSend_info(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)CFSTR("KnownNetworkInfoOptions"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)CFSTR("DeviceDiscovery"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_objectForKeyedSubscript_(v16, v21, (uint64_t)CFSTR("DeviceDiscovery"), v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_BOOLValue(v24, v25, v26, v27, v28);

    if (v29)
    {
      v30 = objc_alloc_init(CWFLocalDeviceDiscovery);
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = sub_1B06BC7C0;
      v86[3] = &unk_1E61345D8;
      v87 = v6;
      objc_msgSend_setHandler_(v30, v31, (uint64_t)v86, v32, v33);
      objc_msgSend_activate(v30, v34, v35, v36, v37);

      v38 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
  v42 = [CWFKnownNetworkPreparer alloc];
  objc_msgSend___knownNetworkProfiles(self, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (id)objc_msgSend_initWithNetworkProfiles_(v42, v48, (uint64_t)v47, v49, v50);

  if (v40)
  {
    objc_msgSend_localNetworkPromptProfiles(v40, v51, v52, v53, v54);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_prepareLocalNetworkProfilesForPresentation_(v40, v55, (uint64_t)v39, v56, v57);
    v58 = objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      v41 = (id)v58;
      goto LABEL_7;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v59, *MEMORY[0x1E0CB2FE0], 2, 0);
  }
  else
  {
    v39 = 0;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v51, *MEMORY[0x1E0CB2FE0], 6, 0);
  }
  v80 = objc_claimAutoreleasedReturnValue();
  if (!v80)
  {
    v41 = 0;
LABEL_7:
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v59, v60, v61, v62);
    v63 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v63, v64, (uint64_t)v41, (uint64_t)CFSTR("Result"), v65);
    objc_msgSend_response(v6, v66, v67, v68, v69);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend_response(v6, v70, v71, v72, v73);
      v74 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v79 = (void *)objc_msgSend_copy(v63, v75, v76, v77, v78);
      ((void (**)(_QWORD, _QWORD, void *))v74)[2](v74, 0, v79);

      v38 = 0;
    }
    goto LABEL_9;
  }
  v38 = (void *)v80;
  objc_msgSend_response(v6, v59, v60, v61, v62);
  v41 = (id)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend_response(v6, v81, v82, v83, v84);
    v63 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v63)[2](v63, v38, 0);
    v41 = 0;
LABEL_9:

  }
  if (objc_opt_class())
  {
    v85 = (CWFLocalDeviceDiscovery *)v7;
    v39 = v39;
    v41 = v41;
    v40 = v40;
    AnalyticsSendEventLazy();

    v30 = v85;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong(&self->_netRBStopServiceReply, 0);
  objc_storeStrong(&self->_netRBStartServiceReply, 0);
  objc_storeStrong((id *)&self->_internalRequestXPCConnection, 0);
  objc_storeStrong((id *)&self->_privateMACManager, 0);
  objc_storeStrong((id *)&self->_privateMACConnectivityTimer, 0);
  objc_storeStrong((id *)&self->_cachedKnownNetwork, 0);
  objc_storeStrong((id *)&self->_mutableLinkDownNetworkMap, 0);
  objc_storeStrong((id *)&self->_defaultQueue, 0);
  objc_storeStrong((id *)&self->_mutableQueueMap, 0);
  objc_storeStrong((id *)&self->_mutableLinkQualityMap, 0);
  objc_storeStrong((id *)&self->_mutableAutoJoinStatusMap, 0);
  objc_storeStrong((id *)&self->_mutableAutoJoinTriggerMap, 0);
  objc_storeStrong((id *)&self->_mutableJoinStatusMap, 0);
  objc_storeStrong((id *)&self->_mutableRoamStatusMap, 0);
  objc_storeStrong((id *)&self->_mutableLinkDownStatusMap, 0);
  objc_storeStrong((id *)&self->_mutableEventIDs, 0);
  objc_storeStrong((id *)&self->_keventMonitor, 0);
  objc_storeStrong((id *)&self->_IO80211, 0);
  objc_storeStrong((id *)&self->_SCNetworkReachability, 0);
  objc_storeStrong((id *)&self->_SCNetworkConfiguration, 0);
  objc_storeStrong((id *)&self->_EAP8021XMap, 0);
  objc_storeStrong((id *)&self->_SCNetworkInterfaceMap, 0);
  objc_storeStrong((id *)&self->_SCNetworkServiceMap, 0);
  objc_storeStrong((id *)&self->_apple80211EligibleRemovalList, 0);
  objc_storeStrong((id *)&self->_apple80211Map, 0);
  objc_storeStrong((id *)&self->_nonApple80211InterfaceList, 0);
  objc_storeStrong((id *)&self->_interfaceQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end
