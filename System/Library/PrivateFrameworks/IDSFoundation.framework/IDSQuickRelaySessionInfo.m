@implementation IDSQuickRelaySessionInfo

- (const)serverAddress
{
  return &self->_serverAddress;
}

- (const)serverAddressIPv6
{
  return &self->_serverAddressIPv6;
}

- (const)highPriorityServerAddress
{
  return &self->_highPriorityServerAddress;
}

- (const)highPriorityServerAddressIPv6
{
  return &self->_highPriorityServerAddressIPv6;
}

- (int64_t)parseSessionInfo:(id)a3
{
  const char *v4;
  uint64_t v5;
  const __CFDictionary *v6;
  double v7;
  void *Value;
  unsigned int v9;
  const char *v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  int64_t v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  double v27;
  const char *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  unsigned int v37;
  unsigned int v38;
  void *v39;
  const char *v40;
  double v41;
  uint64_t v42;
  double v43;
  __int16 v44;
  const char *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  double v50;
  const char *v51;
  void *v52;
  unsigned int v53;
  unsigned int v54;
  NSObject *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  const char *v60;
  uint64_t v61;
  double v62;
  NSObject *v63;
  int v64;
  uint64_t v65;
  __int128 v66;
  const char *v67;
  uint64_t v68;
  double v69;
  __int128 *v70;
  NSObject *v71;
  const char *v72;
  void *v73;
  int v74;
  void *v75;
  uint64_t v76;
  double v77;
  const char *v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  const char *v87;
  const char *v88;
  __CFString *v89;
  uint64_t v90;
  double v91;
  const char *v92;
  void *v93;
  uint64_t v94;
  double v95;
  const char *v96;
  void *v97;
  uint64_t v98;
  double v99;
  const char *v100;
  void *v101;
  uint64_t v102;
  double v103;
  const char *v104;
  void *v105;
  uint64_t v106;
  double v107;
  const char *v108;
  void *v109;
  uint64_t v110;
  double v111;
  const char *v112;
  void *v113;
  uint64_t v114;
  double v115;
  const char *v116;
  void *v117;
  uint64_t v118;
  double v119;
  const char *v120;
  void *v121;
  uint64_t v122;
  double v123;
  const char *v124;
  void *v125;
  __CFString *v126;
  __CFString *v127;
  __CFString *v128;
  uint64_t v129;
  double v130;
  const char *v131;
  void *v132;
  void *v133;
  id v134;
  const char *v135;
  double v136;
  const char *v137;
  double v138;
  uint64_t v139;
  __CFArray *v140;
  uint64_t v141;
  uint64_t i;
  const __CFDictionary *v143;
  BOOL v144;
  void *v145;
  id v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  double v150;
  uint64_t v151;
  const char *v152;
  double v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  double v157;
  void *v158;
  id v159;
  const char *v160;
  double v161;
  NSObject *v162;
  const char *v163;
  uint64_t v164;
  double v165;
  id v166;
  void *v167;
  id v168;
  id v169;
  const char *v170;
  double v171;
  NSUUID *v172;
  NSUUID *defaultDeviceLocalCBUUID;
  void *v174;
  id v175;
  id v176;
  const char *v177;
  double v178;
  NSUUID *v179;
  NSUUID *defaultDeviceRemoteCBUUID;
  __CFString *v181;
  __CFString *v182;
  __CFString *v183;
  __CFString *v184;
  uint64_t v185;
  double v186;
  const char *v187;
  void *v188;
  uint64_t v189;
  double v190;
  const char *v191;
  void *v192;
  __CFString *v193;
  __CFString *v194;
  const void *v195;
  void *v196;
  id initialServerDesiredMaterialSigner;
  __CFString *v198;
  uint64_t v199;
  double v200;
  const char *v201;
  void *v202;
  uint64_t v203;
  double v204;
  const char *v205;
  void *v206;
  uint64_t v207;
  double v208;
  const char *v209;
  void *v210;
  uint64_t v212;
  id v213;
  id v214;
  void *v215;
  id v216;
  id v217;
  void *v218;
  void *v219;
  id obj;
  void *v221;
  id v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  int v227;
  uint8_t v228[128];
  uint8_t buf[4];
  uint64_t v230;
  uint64_t v231;

  v231 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFDictionary *)a3;
  Value = 0;
  if (v6)
  {
    v4 = CFSTR("qat");
    if (CFSTR("qat"))
      Value = (void *)CFDictionaryGetValue(v6, CFSTR("qat"));
  }
  v9 = objc_msgSend_unsignedIntValue(Value, v4, v5, v7);
  self->_allocateType = v9;
  if (v9 - 5 <= 0xFFFFFFFB)
  {
    OSLogHandleForTransportCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "failed to get allocate-type from sessionInfo.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get allocate-type from sessionInfo."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get allocate-type from sessionInfo."));
      }
    }
    v14 = 27;
    goto LABEL_272;
  }
  v15 = 0;
  if (v6)
  {
    v10 = CFSTR("qsat");
    if (CFSTR("qsat"))
      v15 = (void *)CFDictionaryGetValue(v6, CFSTR("qsat"));
  }
  objc_msgSend_doubleValue(v15, v10, v11, v12);
  self->_allocateTime = v16;
  if (v16 <= 0.0)
  {
    OSLogHandleForTransportCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v30, OS_LOG_TYPE_DEFAULT, "failed to get allocate-time from sessionInfo.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get allocate-time from sessionInfo."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get allocate-time from sessionInfo."));
      }
    }
    v14 = 28;
  }
  else
  {
    if (v6)
    {
      if (CFSTR("U"))
      {
        v17 = (void *)CFDictionaryGetValue(v6, CFSTR("U"));
        v222 = v17;
        if (v222)
        {
          objc_storeStrong((id *)&self->_allocateRequestID, v17);
          if (!CFSTR("qrsi")
            || (v18 = (void *)CFDictionaryGetValue(v6, CFSTR("qrsi")),
                (v19 = v18) == 0))
          {
            OSLogHandleForTransportCategory();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B949000, v32, OS_LOG_TYPE_DEFAULT, "failed to get relay-session-id from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get relay-session-id from sessionInfo."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get relay-session-id from sessionInfo."));
              }
            }
            v14 = 1;
            goto LABEL_271;
          }
          v221 = v19;
          objc_storeStrong((id *)&self->_relaySessionID, v18);
          if (!CFSTR("qrst")
            || (v20 = (void *)CFDictionaryGetValue(v6, CFSTR("qrst")),
                (v21 = v20) == 0))
          {
            OSLogHandleForTransportCategory();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B949000, v33, OS_LOG_TYPE_DEFAULT, "failed to get relay-session-token from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get relay-session-token from sessionInfo."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get relay-session-token from sessionInfo."));
              }
            }
            v14 = 2;
            goto LABEL_270;
          }
          v219 = v21;
          objc_storeStrong((id *)&self->_relaySessionToken, v20);
          if (!CFSTR("qrsk")
            || (v22 = (void *)CFDictionaryGetValue(v6, CFSTR("qrsk")),
                (v23 = v22) == 0))
          {
            OSLogHandleForTransportCategory();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "failed to get relay-session-key from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get relay-session-key from sessionInfo."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get relay-session-key from sessionInfo."));
              }
            }
            v14 = 3;
            goto LABEL_269;
          }
          v218 = v23;
          objc_storeStrong((id *)&self->_relaySessionKey, v22);
          if (!CFSTR("qr-software-id")
            || (v24 = (void *)CFDictionaryGetValue(v6, CFSTR("qr-software-id")),
                (v25 = v24) == 0))
          {
            OSLogHandleForTransportCategory();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "failed to get software-data from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get software-data from sessionInfo."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get software-data from sessionInfo."));
              }
            }
            v36 = 0;
            v14 = 29;
            goto LABEL_268;
          }
          v217 = v25;
          objc_storeStrong((id *)&self->_softwareData, v24);
          v28 = CFSTR("qrp");
          if (CFSTR("qrp"))
            v29 = (void *)CFDictionaryGetValue(v6, CFSTR("qrp"));
          else
            v29 = 0;
          v37 = objc_msgSend_unsignedShortValue(v29, v28, v26, v27);
          if (!v37)
          {
            OSLogHandleForTransportCategory();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B949000, v48, OS_LOG_TYPE_DEFAULT, "failed to get relay-port from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get relay-port from sessionInfo."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get relay-port from sessionInfo."));
              }
            }
            v14 = 5;
            goto LABEL_267;
          }
          v227 = -1431655766;
          if (!CFSTR("qrip")
            || (v38 = v37, (v39 = (id)CFDictionaryGetValue(v6, CFSTR("qrip"))) == 0))
          {
            OSLogHandleForTransportCategory();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B949000, v47, OS_LOG_TYPE_DEFAULT, "failed to get relay-address from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get relay-address from sessionInfo."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get relay-address from sessionInfo."));
              }
            }
            v14 = 4;
            goto LABEL_267;
          }
          v215 = v39;
          objc_msgSend_getBytes_length_(v39, v40, (uint64_t)&v227, v41, 4);
          *(_WORD *)&self->_serverAddress.ss_len = 528;
          *(_DWORD *)&self->_serverAddress.__ss_pad1[2] = v227;
          v44 = __rev16(v38);
          *(_WORD *)self->_serverAddress.__ss_pad1 = v44;
          v45 = CFSTR("qipp");
          if (CFSTR("qipp"))
            v46 = (void *)CFDictionaryGetValue(v6, CFSTR("qipp"));
          else
            v46 = 0;
          self->_ipPreference = objc_msgSend_unsignedCharValue(v46, v45, v42, v43);
          v51 = CFSTR("qrhpp");
          if (CFSTR("qrhpp"))
            v52 = (void *)CFDictionaryGetValue(v6, CFSTR("qrhpp"));
          else
            v52 = 0;
          v53 = objc_msgSend_unsignedShortValue(v52, v51, v49, v50);
          v54 = v53;
          *(_DWORD *)&self->_highPriorityServerAddressIPv6.__ss_pad2[8] = 0;
          *(_QWORD *)self->_highPriorityServerAddressIPv6.__ss_pad2 = 0;
          *(_OWORD *)&self->_highPriorityServerAddressIPv6.ss_len = 0u;
          *(_OWORD *)&self->_highPriorityServerAddress.ss_len = 0u;
          if (v53)
          {
            *(_WORD *)&self->_highPriorityServerAddress.ss_len = 528;
            *(_DWORD *)&self->_highPriorityServerAddress.__ss_pad1[2] = v227;
            *(_WORD *)self->_highPriorityServerAddress.__ss_pad1 = __rev16(v53);
          }
          else
          {
            OSLogHandleForTransportCategory();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B949000, v55, OS_LOG_TYPE_DEFAULT, "failed to get high priority relay-port from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get high priority relay-port from sessionInfo."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get high priority relay-port from sessionInfo."));
              }
            }
          }
          if (CFSTR("qrip6")
            && (v56 = (id)CFDictionaryGetValue(v6, CFSTR("qrip6"))) != 0)
          {
            v216 = v56;
            if (objc_msgSend_length(v56, v57, v58, v59) == 16)
            {
              *(_QWORD *)&self->_serverAddressIPv6.ss_len = 0;
              self->_serverAddressIPv6.__ss_align = 0;
              *(_DWORD *)&self->_serverAddressIPv6.__ss_pad2[8] = 0;
              *(_QWORD *)self->_serverAddressIPv6.__ss_pad2 = 0;
              *(_WORD *)&self->_serverAddressIPv6.ss_len = 7708;
              *(_WORD *)self->_serverAddressIPv6.__ss_pad1 = v44;
              v216 = objc_retainAutorelease(v216);
              *(_OWORD *)&self->_serverAddressIPv6.__ss_align = *(_OWORD *)objc_msgSend_bytes(v216, v60, v61, v62);
              OSLogHandleForTransportCategory();
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                v64 = *(unsigned __int16 *)self->_serverAddressIPv6.__ss_pad1;
                *(_DWORD *)buf = 67109120;
                LODWORD(v230) = v64;
                _os_log_impl(&dword_19B949000, v63, OS_LOG_TYPE_DEFAULT, "QR IPv6 port number: %d", buf, 8u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v212 = *(unsigned __int16 *)self->_serverAddressIPv6.__ss_pad1;
                  _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("QR IPv6 port number: %d"));
                  if (_IDSShouldLog())
                  {
                    v212 = *(unsigned __int16 *)self->_serverAddressIPv6.__ss_pad1;
                    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("QR IPv6 port number: %d"));
                  }
                }
              }
              if (v54)
              {
                *(_WORD *)&self->_highPriorityServerAddressIPv6.ss_len = 7708;
                *(_WORD *)self->_highPriorityServerAddressIPv6.__ss_pad1 = __rev16(v54);
                v216 = objc_retainAutorelease(v216);
                v70 = (__int128 *)objc_msgSend_bytes(v216, v67, v68, v69);
                v66 = *v70;
                *(_OWORD *)&self->_highPriorityServerAddressIPv6.__ss_align = *v70;
              }
            }
            else
            {
              OSLogHandleForTransportCategory();
              v82 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                v86 = objc_msgSend_length(v216, v83, v84, v85);
                *(_DWORD *)buf = 134217984;
                v230 = v86;
                _os_log_impl(&dword_19B949000, v82, OS_LOG_TYPE_DEFAULT, "QR IPv6 address length is: %lu != 16", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v212 = objc_msgSend_length(v216, v87, v65, *(double *)&v66);
                  _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("QR IPv6 address length is: %lu != 16"));
                  if (_IDSShouldLog())
                  {
                    v212 = objc_msgSend_length(v216, v88, v65, *(double *)&v66, v212);
                    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("QR IPv6 address length is: %lu != 16"));
                  }
                }
              }
            }
          }
          else
          {
            OSLogHandleForTransportCategory();
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B949000, v71, OS_LOG_TYPE_DEFAULT, "No IPV6 relay-address from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("No IPV6 relay-address from sessionInfo."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("No IPV6 relay-address from sessionInfo."));
              }
            }
            v216 = 0;
          }
          v72 = CFSTR("qv");
          if (CFSTR("qv"))
            v73 = (void *)CFDictionaryGetValue(v6, CFSTR("qv"));
          else
            v73 = 0;
          v74 = objc_msgSend_unsignedCharValue(v73, v72, v65, *(double *)&v66, v212);
          if (!v74)
          {
            OSLogHandleForTransportCategory();
            v81 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B949000, v81, OS_LOG_TYPE_DEFAULT, "invalid QR protocol version.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid QR protocol version."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid QR protocol version."));
              }
            }
            v14 = 13;
            goto LABEL_266;
          }
          self->_protocolVersion = v74;
          if (!CFSTR("qids")
            || (v75 = (void *)CFDictionaryGetValue(v6, CFSTR("qids")),
                (v213 = v75) == 0))
          {
            OSLogHandleForTransportCategory();
            v80 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B949000, v80, OS_LOG_TYPE_DEFAULT, "failed to get ids-session-id from sessionInfo.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get ids-session-id from sessionInfo."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get ids-session-id from sessionInfo."));
              }
            }
            v14 = 25;
            goto LABEL_266;
          }
          objc_storeStrong((id *)&self->_idsSessionID, v75);
          v78 = CFSTR("qrpr");
          if (CFSTR("qrpr"))
            v79 = (void *)CFDictionaryGetValue(v6, CFSTR("qrpr"));
          else
            v79 = 0;
          self->_relayServerProviderType = objc_msgSend_unsignedIntValue(v79, v78, v76, v77);
          v89 = CFSTR("qrep");
          if (CFSTR("qrep"))
            v89 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("qrep"));
          objc_storeStrong((id *)&self->_reportingDataBlob, v89);
          v92 = CFSTR("qri");
          if (CFSTR("qri"))
            v93 = (void *)CFDictionaryGetValue(v6, CFSTR("qri"));
          else
            v93 = 0;
          self->_participantID = objc_msgSend_unsignedLongLongValue(v93, v92, v90, v91);
          v96 = CFSTR("IsInitiator");
          if (CFSTR("IsInitiator"))
            v97 = (void *)CFDictionaryGetValue(v6, CFSTR("IsInitiator"));
          else
            v97 = 0;
          self->_isInitiator = objc_msgSend_BOOLValue(v97, v96, v94, v95);
          v100 = CFSTR("link-protocol");
          if (CFSTR("link-protocol"))
            v101 = (void *)CFDictionaryGetValue(v6, CFSTR("link-protocol"));
          else
            v101 = 0;
          self->_linkProtocol = (int)objc_msgSend_intValue(v101, v100, v98, v99);
          v104 = CFSTR("ls");
          if (CFSTR("ls"))
            v105 = (void *)CFDictionaryGetValue(v6, CFSTR("ls"));
          else
            v105 = 0;
          self->_linkSuggestion = objc_msgSend_unsignedCharValue(v105, v104, v102, v103);
          v108 = CFSTR("lc");
          if (CFSTR("lc"))
            v109 = (void *)CFDictionaryGetValue(v6, CFSTR("lc"));
          else
            v109 = 0;
          self->_linkScore = objc_msgSend_unsignedCharValue(v109, v108, v106, v107);
          v112 = CFSTR("und2");
          if (CFSTR("und2"))
            v113 = (void *)CFDictionaryGetValue(v6, CFSTR("und2"));
          else
            v113 = 0;
          self->_uplinkNackDisabled = objc_msgSend_BOOLValue(v113, v112, v110, v111);
          v116 = CFSTR("h2fdv2");
          if (CFSTR("h2fdv2"))
            v117 = (void *)CFDictionaryGetValue(v6, CFSTR("h2fdv2"));
          else
            v117 = 0;
          self->_h2FallbackDisabled = objc_msgSend_BOOLValue(v117, v116, v114, v115);
          v120 = CFSTR("tled");
          if (CFSTR("tled"))
            v121 = (void *)CFDictionaryGetValue(v6, CFSTR("tled"));
          else
            v121 = 0;
          self->_transportLayerEncryptionDisabled = objc_msgSend_BOOLValue(v121, v120, v118, v119);
          v124 = CFSTR("ipdd");
          if (CFSTR("ipdd"))
            v125 = (void *)CFDictionaryGetValue(v6, CFSTR("ipdd"));
          else
            v125 = 0;
          self->_ipDiscoveryDisabled = objc_msgSend_BOOLValue(v125, v124, v122, v123);
          v126 = CFSTR("qrexp");
          if (CFSTR("qrexp"))
            v126 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("qrexp"));
          objc_storeStrong((id *)&self->_qrSessionExperiments, v126);
          v127 = CFSTR("qptp");
          if (CFSTR("qptp"))
            v127 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("qptp"));
          objc_storeStrong((id *)&self->_pskTransportParameters, v127);
          v128 = CFSTR("qph3");
          if (CFSTR("qph3"))
            v128 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("qph3"));
          objc_storeStrong((id *)&self->_pskH3Settings, v128);
          v131 = CFSTR("x-internal");
          if (CFSTR("x-internal"))
            v132 = (void *)CFDictionaryGetValue(v6, CFSTR("x-internal"));
          else
            v132 = 0;
          self->_isInternal = objc_msgSend_BOOLValue(v132, v131, v129, v130);
          if (CFSTR("qal"))
            v133 = (void *)CFDictionaryGetValue(v6, CFSTR("qal"));
          else
            v133 = 0;
          v214 = v133;
          v134 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend_addObjectsFromArray_(v134, v135, (uint64_t)v214, v136);
          v225 = 0u;
          v226 = 0u;
          v223 = 0u;
          v224 = 0u;
          obj = v134;
          v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v137, (uint64_t)&v223, v138, v228, 16);
          if (v139)
          {
            v140 = 0;
            v141 = *(_QWORD *)v224;
            do
            {
              for (i = 0; i != v139; ++i)
              {
                if (*(_QWORD *)v224 != v141)
                  objc_enumerationMutation(obj);
                v143 = *(const __CFDictionary **)(*((_QWORD *)&v223 + 1) + 8 * i);
                if (v143)
                  v144 = CFSTR("qri") == 0;
                else
                  v144 = 1;
                if (v144)
                  v145 = 0;
                else
                  v145 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(*((_QWORD *)&v223 + 1) + 8 * i), CFSTR("qri"));
                v146 = v145;
                v147 = (void *)MEMORY[0x1E0CB37E8];
                v151 = objc_msgSend_unsignedLongLongValue(v146, v148, v149, v150);
                objc_msgSend_numberWithUnsignedLongLong_(v147, v152, v151, v153);
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v140)
                  v140 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                if (v140 && v156)
                  CFArrayAppendValue(v140, v156);
                if (objc_msgSend_unsignedLongLongValue(v146, v154, v155, v157) == self->_participantID)
                {
                  v158 = 0;
                  if (v143 && CFSTR("tP"))
                    v158 = (void *)CFDictionaryGetValue(v143, CFSTR("tP"));
                  v159 = v158;
                  self->_isPseudoParticipant = MEMORY[0x1A1AC7344]();

                }
              }
              v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v160, (uint64_t)&v223, v161, v228, 16);
            }
            while (v139);

            if (v140)
              goto LABEL_226;
          }
          else
          {

          }
          if (self->_allocateType == 3)
          {
            OSLogHandleForTransportCategory();
            v162 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B949000, v162, OS_LOG_TYPE_DEFAULT, "failed to get recipient participant-id list.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get recipient participant-id list."));
                if (_IDSShouldLog())
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get recipient participant-id list."));
              }
            }
            v140 = 0;
            v14 = 31;
LABEL_265:

LABEL_266:
LABEL_267:
            v36 = v217;
LABEL_268:

LABEL_269:
LABEL_270:

LABEL_271:
            goto LABEL_272;
          }
          v140 = 0;
LABEL_226:
          objc_storeStrong((id *)&self->_allParticipantIDs, v140);
          objc_msgSend_description(v140, v163, v164, v165);
          v166 = (id)objc_claimAutoreleasedReturnValue();
          cut_dispatch_log_queue();
          if (CFSTR("default-local-device-cbuuid"))
            v167 = (void *)CFDictionaryGetValue(v6, CFSTR("default-local-device-cbuuid"));
          else
            v167 = 0;
          v168 = v167;
          v169 = objc_alloc(MEMORY[0x1E0CB3A28]);
          v172 = (NSUUID *)objc_msgSend_initWithUUIDString_(v169, v170, (uint64_t)v168, v171);
          defaultDeviceLocalCBUUID = self->_defaultDeviceLocalCBUUID;
          self->_defaultDeviceLocalCBUUID = v172;

          if (CFSTR("default-remote-device-cbuuid"))
            v174 = (void *)CFDictionaryGetValue(v6, CFSTR("default-remote-device-cbuuid"));
          else
            v174 = 0;
          v175 = v174;
          v176 = objc_alloc(MEMORY[0x1E0CB3A28]);
          v179 = (NSUUID *)objc_msgSend_initWithUUIDString_(v176, v177, (uint64_t)v175, v178);
          defaultDeviceRemoteCBUUID = self->_defaultDeviceRemoteCBUUID;
          self->_defaultDeviceRemoteCBUUID = v179;

          v181 = CFSTR("qgid");
          if (CFSTR("qgid"))
            v181 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("qgid"));
          objc_storeStrong((id *)&self->_groupID, v181);
          v182 = CFSTR("qsgid");
          if (CFSTR("qsgid"))
            v182 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("qsgid"));
          objc_storeStrong((id *)&self->_stableGroupID, v182);
          v183 = CFSTR("stream-info-published-streams");
          if (CFSTR("stream-info-published-streams"))
            v183 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("stream-info-published-streams"));
          objc_storeStrong((id *)&self->_publishedStreams, v183);
          v184 = CFSTR("stream-info-subscribed-streams");
          if (CFSTR("stream-info-subscribed-streams"))
            v184 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("stream-info-subscribed-streams"));
          objc_storeStrong((id *)&self->_subscribedStreams, v184);
          v187 = CFSTR("stream-info-generation-counter");
          if (CFSTR("stream-info-generation-counter"))
            v188 = (void *)CFDictionaryGetValue(v6, CFSTR("stream-info-generation-counter"));
          else
            v188 = 0;
          self->_generationCounter = objc_msgSend_unsignedIntValue(v188, v187, v185, v186);
          v191 = CFSTR("stream-info-max-concurrent-streams");
          if (CFSTR("stream-info-max-concurrent-streams"))
            v192 = (void *)CFDictionaryGetValue(v6, CFSTR("stream-info-max-concurrent-streams"));
          else
            v192 = 0;
          self->_maxConcurrentStreams = objc_msgSend_unsignedIntValue(v192, v191, v189, v190);
          v193 = CFSTR("participant-data-key");
          if (CFSTR("participant-data-key"))
            v193 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("participant-data-key"));
          objc_storeStrong((id *)&self->_avcDataBlob, v193);
          v194 = CFSTR("initial-materials-key");
          if (CFSTR("initial-materials-key"))
            v194 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("initial-materials-key"));
          objc_storeStrong((id *)&self->_initialServerDesiredMaterial, v194);
          if (CFSTR("initial-materials-signer-key"))
            v195 = CFDictionaryGetValue(v6, CFSTR("initial-materials-signer-key"));
          else
            v195 = 0;
          v196 = _Block_copy(v195);
          initialServerDesiredMaterialSigner = self->_initialServerDesiredMaterialSigner;
          self->_initialServerDesiredMaterialSigner = v196;

          v198 = CFSTR("quic-exchange-provider-key");
          if (CFSTR("quic-exchange-provider-key"))
            v198 = (__CFString *)CFDictionaryGetValue(v6, CFSTR("quic-exchange-provider-key"));
          objc_storeStrong((id *)&self->_quicMaterialExchangeProvider, v198);
          v201 = CFSTR("gl-option-session-is-user-participant-initiated");
          if (CFSTR("gl-option-session-is-user-participant-initiated"))
            v202 = (void *)CFDictionaryGetValue(v6, CFSTR("gl-option-session-is-user-participant-initiated"));
          else
            v202 = 0;
          self->_sessionIsNonUserParticipantInitiated = objc_msgSend_unsignedIntValue(v202, v201, v199, v200) != 0;
          v205 = CFSTR("gl-option-session-hand-off-over-qr-enabled");
          if (CFSTR("gl-option-session-hand-off-over-qr-enabled"))
            v206 = (void *)CFDictionaryGetValue(v6, CFSTR("gl-option-session-hand-off-over-qr-enabled"));
          else
            v206 = 0;
          self->_handOffOverQREnabled = objc_msgSend_BOOLValue(v206, v205, v203, v204);
          v209 = CFSTR("gl-option-call-type");
          if (CFSTR("gl-option-call-type"))
            v210 = (void *)CFDictionaryGetValue(v6, CFSTR("gl-option-call-type"));
          else
            v210 = 0;
          self->_callType = objc_msgSend_unsignedIntValue(v210, v209, v207, v208);

          v14 = 0;
          goto LABEL_265;
        }
      }
    }
    OSLogHandleForTransportCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_DEFAULT, "failed to get allocate-request-id from sessionInfo.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to get allocate-request-id from sessionInfo."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to get allocate-request-id from sessionInfo."));
      }
    }
    v14 = 12;
  }
LABEL_272:

  return v14;
}

- (int64_t)allocateType
{
  return self->_allocateType;
}

- (double)allocateTime
{
  return self->_allocateTime;
}

- (NSString)allocateRequestID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)idsSessionID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)relaySessionID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)relaySessionToken
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)relaySessionKey
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (NSData)softwareData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (int64_t)relayServerProviderType
{
  return self->_relayServerProviderType;
}

- (NSString)reportingDataBlob
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (unint64_t)participantID
{
  return self->_participantID;
}

- (NSArray)allParticipantIDs
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (int64_t)linkProtocol
{
  return self->_linkProtocol;
}

- (unsigned)linkSuggestion
{
  return self->_linkSuggestion;
}

- (unsigned)linkScore
{
  return self->_linkScore;
}

- (BOOL)uplinkNackDisabled
{
  return self->_uplinkNackDisabled;
}

- (BOOL)isPseudoParticipant
{
  return self->_isPseudoParticipant;
}

- (BOOL)h2FallbackDisabled
{
  return self->_h2FallbackDisabled;
}

- (BOOL)handOffOverQREnabled
{
  return self->_handOffOverQREnabled;
}

- (BOOL)transportLayerEncryptionDisabled
{
  return self->_transportLayerEncryptionDisabled;
}

- (BOOL)ipDiscoveryDisabled
{
  return self->_ipDiscoveryDisabled;
}

- (NSDictionary)qrSessionExperiments
{
  return (NSDictionary *)objc_getProperty(self, a2, 704, 1);
}

- (BOOL)sessionIsUserParticipantInitiated
{
  return self->_sessionIsUserParticipantInitiated;
}

- (NSString)pskTransportParameters
{
  return (NSString *)objc_getProperty(self, a2, 720, 1);
}

- (NSString)pskH3Settings
{
  return (NSString *)objc_getProperty(self, a2, 728, 1);
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (unint64_t)callType
{
  return self->_callType;
}

- (NSUUID)defaultDeviceLocalCBUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 656, 1);
}

- (NSUUID)defaultDeviceRemoteCBUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 664, 1);
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 640, 1);
}

- (NSString)stableGroupID
{
  return (NSString *)objc_getProperty(self, a2, 648, 1);
}

- (NSArray)publishedStreams
{
  return (NSArray *)objc_getProperty(self, a2, 672, 1);
}

- (NSArray)subscribedStreams
{
  return (NSArray *)objc_getProperty(self, a2, 680, 1);
}

- (unsigned)generationCounter
{
  return self->_generationCounter;
}

- (unsigned)maxConcurrentStreams
{
  return self->_maxConcurrentStreams;
}

- (NSData)avcDataBlob
{
  return (NSData *)objc_getProperty(self, a2, 744, 1);
}

- (unsigned)ipPreference
{
  return self->_ipPreference;
}

- (NSSet)initialServerDesiredMaterial
{
  return (NSSet *)objc_getProperty(self, a2, 768, 1);
}

- (id)initialServerDesiredMaterialSigner
{
  return objc_getProperty(self, a2, 776, 1);
}

- (IDSGroupQUICMaterialExchangeProvider)quicMaterialExchangeProvider
{
  return (IDSGroupQUICMaterialExchangeProvider *)objc_getProperty(self, a2, 792, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quicMaterialExchangeProvider, 0);
  objc_storeStrong(&self->_initialServerDesiredMaterialSigner, 0);
  objc_storeStrong((id *)&self->_initialServerDesiredMaterial, 0);
  objc_storeStrong((id *)&self->_avcDataBlob, 0);
  objc_storeStrong((id *)&self->_pskH3Settings, 0);
  objc_storeStrong((id *)&self->_pskTransportParameters, 0);
  objc_storeStrong((id *)&self->_qrSessionExperiments, 0);
  objc_storeStrong((id *)&self->_subscribedStreams, 0);
  objc_storeStrong((id *)&self->_publishedStreams, 0);
  objc_storeStrong((id *)&self->_defaultDeviceRemoteCBUUID, 0);
  objc_storeStrong((id *)&self->_defaultDeviceLocalCBUUID, 0);
  objc_storeStrong((id *)&self->_stableGroupID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_allParticipantIDs, 0);
  objc_storeStrong((id *)&self->_reportingDataBlob, 0);
  objc_storeStrong((id *)&self->_softwareData, 0);
  objc_storeStrong((id *)&self->_relaySessionKey, 0);
  objc_storeStrong((id *)&self->_relaySessionToken, 0);
  objc_storeStrong((id *)&self->_relaySessionID, 0);
  objc_storeStrong((id *)&self->_idsSessionID, 0);
  objc_storeStrong((id *)&self->_allocateRequestID, 0);
}

@end
