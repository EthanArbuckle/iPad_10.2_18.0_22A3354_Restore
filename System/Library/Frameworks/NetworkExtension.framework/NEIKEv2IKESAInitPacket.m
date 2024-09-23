@implementation NEIKEv2IKESAInitPacket

+ (NSObject)createIKESAInitForInitiatorIKESA:(uint64_t)a1
{
  _BYTE *v2;
  const char *v3;
  void *v4;
  const char *v5;
  NSObject *v6;
  id v7;
  const char *v8;
  id v9;
  NEIKEv2NotifyPayload *v10;
  SEL v11;
  SEL v12;
  void *v13;
  NEIKEv2IKESAPayload *v14;
  SEL v15;
  SEL v16;
  id v17;
  void *v18;
  SEL v19;
  void *v20;
  const char *v21;
  void *v22;
  SEL v23;
  void *v24;
  char v25;
  NEIKEv2KeyExchangePayload *v26;
  SEL v27;
  const char *v28;
  void *v29;
  SEL v30;
  void *v31;
  const char *v32;
  void *v33;
  SEL v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  SEL v39;
  void *v40;
  const char *v41;
  void *v42;
  SEL v43;
  void *v44;
  char v45;
  NEIKEv2NoncePayload *v46;
  SEL v47;
  SEL v48;
  id v49;
  SEL v50;
  void *v51;
  const char *v52;
  void *v53;
  SEL v54;
  void *v55;
  char v56;
  const char *v57;
  id v58;
  void *v59;
  const char *v60;
  NEIKEv2NotifyPayload *v61;
  const char *v62;
  NSObject *p_super;
  id v64;
  void *v65;
  uint64_t v66;
  SEL v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  const char *v77;
  NSObject *v78;
  uint32_t v79;
  const char *v80;
  id v81;
  int v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  id v86;
  void *v87;
  uint64_t v88;
  const char *v89;
  void *v90;
  const char *v91;
  void *v92;
  SEL v93;
  id v94;
  const char *v95;
  void *v96;
  const char *v97;
  void *v98;
  SEL v99;
  id v100;
  NSObject *v101;
  const char *v102;
  id v103;
  void *v104;
  const char *v105;
  id v106;
  NSObject *v107;
  SEL v108;
  id v109;
  void *v110;
  NSObject *v111;
  const char *v112;
  id v113;
  void *v114;
  char v115;
  NSObject *v116;
  NSObject *v117;
  const char *v119;
  SEL v120;
  id v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t i;
  _QWORD *v127;
  _QWORD *v128;
  SEL v129;
  id v130;
  void *v131;
  const char *v132;
  id v133;
  int v134;
  const char *v135;
  id v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t j;
  void *v142;
  SEL v143;
  id v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t k;
  void *v150;
  NEIKEv2VendorIDPayload *v151;
  const char *v152;
  void *v153;
  SEL v154;
  void *v155;
  const char *v156;
  void *v157;
  void *v158;
  SEL v159;
  SEL v160;
  SEL v161;
  id v162;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  NEIKEv2CustomPayload *v169;
  uint64_t v170;
  void *v171;
  SEL v172;
  SEL v173;
  void *v174;
  const char *v175;
  void *v176;
  void *v177;
  SEL v178;
  SEL v179;
  uint64_t v180;
  const char *v181;
  NSObject *v182;
  const char *v183;
  NSObject *v184;
  void *v185;
  NSObject *v186;
  NSObject *v187;
  NSObject *v188;
  id obj;
  id obja;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  uint8_t v207[16];
  NEIKEv2CustomPayload *v208;
  _BYTE v209[128];
  NEIKEv2VendorIDPayload *v210;
  _BYTE v211[128];
  _BYTE v212[128];
  uint8_t v213[128];
  uint8_t buf[4];
  const char *v215;
  __int16 v216;
  void *v217;
  uint64_t v218;

  v218 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (!v2)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 136315138;
    v215 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitForInitiatorIKESA:]";
    v80 = "%s called with null ikeSA";
    goto LABEL_40;
  }
  -[NEIKEv2IKESA preferredKEMProtocol](v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v6 = -[NEIKEv2Packet initOutbound]([NEIKEv2IKESAInitPacket alloc]);
    if (v6)
    {
      v7 = objc_getProperty(v2, v5, 280, 1);

      if (!v7)
        goto LABEL_6;
      v9 = objc_getProperty(v2, v8, 280, 1);
      v10 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]((uint64_t)NEIKEv2NotifyPayload, 0x4006uLL, v9);
      objc_setProperty_atomic(v6, v11, v10, 88);

      objc_getProperty(v6, v12, 88, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
LABEL_6:
        v14 = objc_alloc_init(NEIKEv2IKESAPayload);
        objc_setProperty_atomic(v6, v15, v14, 96);

        v17 = objc_getProperty(v2, v16, 80, 1);
        objc_msgSend(v17, "proposals");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_getProperty(v6, v19, 96, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v20;
        if (v20)
          objc_setProperty_atomic(v20, v21, v18, 24);

        objc_getProperty(v6, v23, 96, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[NEIKEv2Payload isValid]((uint64_t)v24);

        if ((v25 & 1) != 0)
        {
          v26 = objc_alloc_init(NEIKEv2KeyExchangePayload);
          objc_setProperty_atomic(v6, v27, v26, 104);

          -[NEIKEv2IKESA preferredKEMProtocol](v2, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_getProperty(v6, v30, 104, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v31;
          if (v31)
            objc_setProperty_atomic(v31, v32, v29, 24);

          v35 = objc_getProperty(v2, v34, 160, 1);
          v36 = v35;
          if (v35)
            v37 = (void *)*((_QWORD *)v35 + 2);
          else
            v37 = 0;
          v38 = v37;
          objc_getProperty(v6, v39, 104, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v40;
          if (v40)
            objc_setProperty_atomic(v40, v41, v38, 32);

          objc_getProperty(v6, v43, 104, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[NEIKEv2Payload isValid]((uint64_t)v44);

          if ((v45 & 1) != 0)
          {
            v46 = objc_alloc_init(NEIKEv2NoncePayload);
            objc_setProperty_atomic(v6, v47, v46, 112);

            v49 = objc_getProperty(v2, v48, 128, 1);
            objc_getProperty(v6, v50, 112, 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v51;
            if (v51)
              objc_setProperty_atomic(v51, v52, v49, 24);

            objc_getProperty(v6, v54, 112, 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = -[NEIKEv2Payload isValid]((uint64_t)v55);

            if ((v56 & 1) != 0)
            {
              v58 = objc_getProperty(v2, v57, 80, 1);
              objc_msgSend(v58, "redirectedFromServer");
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              if (v59)
              {
                v61 = objc_alloc_init(NEIKEv2NotifyPayload);
                p_super = &v61->super.super;
                if (v61)
                  v61->_notifyType = 16408;
                v64 = objc_getProperty(v2, v62, 80, 1);
                objc_msgSend(v64, "redirectedFromServer");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v65, "addressFamily");

                v68 = objc_getProperty(v2, v67, 80, 1);
                objc_msgSend(v68, "redirectedFromServer");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = v69;
                if (v66 == 2)
                {
                  v71 = objc_msgSend(v69, "address");

                  buf[0] = 1;
                  v207[0] = 4;
                  v72 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
                  objc_msgSend(v72, "appendBytes:length:", buf, 1);
                  objc_msgSend(v72, "appendBytes:length:", v207, 1);
                  v73 = v71 + 4;
                  v74 = v72;
                  v75 = 4;
                }
                else
                {
                  v84 = objc_msgSend(v69, "addressFamily");

                  if (v84 != 30)
                  {
LABEL_50:
                    if (-[NEIKEv2Packet addNotifyPayload:](v6, p_super))
                    {

                      goto LABEL_52;
                    }
                    ne_log_obj();
                    v117 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v117, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_19BD16000, v117, OS_LOG_TYPE_FAULT, "[packet addNotifyPayload:redirectFromPayload] failed", buf, 2u);
                    }

                    goto LABEL_63;
                  }
                  v86 = objc_getProperty(v2, v85, 80, 1);
                  objc_msgSend(v86, "redirectedFromServer");
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  v88 = objc_msgSend(v87, "address");

                  buf[0] = 2;
                  v207[0] = 16;
                  v72 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
                  objc_msgSend(v72, "appendBytes:length:", buf, 1);
                  objc_msgSend(v72, "appendBytes:length:", v207, 1);
                  v73 = v88 + 8;
                  v74 = v72;
                  v75 = 16;
                }
                objc_msgSend(v74, "appendBytes:length:", v73, v75);
                if (p_super)
                  objc_setProperty_atomic(p_super, v89, v72, 32);

                goto LABEL_50;
              }
              v81 = objc_getProperty(v2, v60, 80, 1);
              v82 = objc_msgSend(v81, "allowRedirect");

              if (!v82 || -[NEIKEv2Packet addNotification:data:](v6, 0x4016uLL, 0))
              {
LABEL_52:
                -[NEIKEv2IKESA initiatorSPI](v2, v83);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                -[NEIKEv2IKESA responderSPI](v2, v91);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = objc_getProperty(v2, v93, 64, 1);
                p_super = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v90, v92, v94);

                if (!-[NEIKEv2Packet addNotification:data:](v6, 0x4004uLL, p_super))
                {
                  ne_log_obj();
                  v101 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl(&dword_19BD16000, v101, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeNATDetectionSourceIP] failed", buf, 2u);
                  }
                  v76 = 0;
                  goto LABEL_144;
                }
                -[NEIKEv2IKESA initiatorSPI](v2, v95);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                -[NEIKEv2IKESA responderSPI](v2, v97);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v100 = objc_getProperty(v2, v99, 72, 1);
                v101 = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v96, v98, v100);

                if (-[NEIKEv2Packet addNotification:data:](v6, 0x4005uLL, v101))
                {
                  if (-[NEIKEv2Packet addNotification:data:](v6, 0x402EuLL, 0))
                  {
                    v103 = objc_getProperty(v2, v102, 88, 1);
                    objc_msgSend(v103, "authenticationProtocol");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v104)
                    {
                      v106 = objc_getProperty(v2, v105, 88, 1);
                      objc_msgSend(v106, "authenticationProtocol");
                      v107 = objc_claimAutoreleasedReturnValue();

                      v109 = objc_getProperty(v2, v108, 80, 1);
                      objc_msgSend(v109, "extraSupportedSignatureHashes");
                      v110 = (void *)objc_claimAutoreleasedReturnValue();
                      v111 = +[NEIKEv2Crypto copySignHashDataForSet:authentication:]((uint64_t)NEIKEv2Crypto, v110, v107);

                      if (-[NSObject isSecurePassword](v107, "isSecurePassword"))
                      {
                        v113 = objc_getProperty(v2, v112, 88, 1);
                        objc_msgSend(v113, "remoteAuthentication");
                        v114 = (void *)objc_claimAutoreleasedReturnValue();
                        v115 = -[NSObject isEqual:](v107, "isEqual:", v114);

                        if ((v115 & 1) != 0)
                        {
                          *(_WORD *)buf = 0;
                          *(_WORD *)buf = bswap32(-[NSObject securePasswordMethod](v107, "securePasswordMethod")) >> 16;
                          v116 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", buf, 2);
                          if (-[NEIKEv2Packet addNotification:data:](v6, 0x4028uLL, v116))
                          {

                            goto LABEL_84;
                          }
                          ne_log_obj();
                          v184 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v184, OS_LOG_TYPE_FAULT))
                          {
                            *(_WORD *)v207 = 0;
                            _os_log_fault_impl(&dword_19BD16000, v184, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeSecurePasswordMethods] failed", v207, 2u);
                          }
                        }
                        else
                        {
                          ne_log_obj();
                          v116 = objc_claimAutoreleasedReturnValue();
                          if (!os_log_type_enabled(v116, OS_LOG_TYPE_FAULT))
                          {
LABEL_140:

                            goto LABEL_141;
                          }
                          v184 = objc_getProperty(v2, v183, 88, 1);
                          -[NSObject remoteAuthentication](v184, "remoteAuthentication");
                          v185 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412546;
                          v215 = (const char *)v107;
                          v216 = 2112;
                          v217 = v185;
                          _os_log_fault_impl(&dword_19BD16000, v116, OS_LOG_TYPE_FAULT, "Local authentication %@ is GSPM but doesn't match remote authentication %@", buf, 0x16u);

                        }
                        goto LABEL_140;
                      }
                    }
                    else
                    {
                      v187 = v101;
                      v107 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                      v203 = 0u;
                      v204 = 0u;
                      v205 = 0u;
                      v206 = 0u;
                      v121 = objc_getProperty(v2, v120, 80, 1);
                      objc_msgSend(v121, "proposals");
                      v122 = (void *)objc_claimAutoreleasedReturnValue();

                      v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v203, v213, 16);
                      if (v123)
                      {
                        v124 = v123;
                        v125 = *(_QWORD *)v204;
                        do
                        {
                          for (i = 0; i != v124; ++i)
                          {
                            if (*(_QWORD *)v204 != v125)
                              objc_enumerationMutation(v122);
                            v127 = *(_QWORD **)(*((_QWORD *)&v203 + 1) + 8 * i);
                            if (v127)
                              v127 = (_QWORD *)v127[16];
                            v128 = v127;
                            -[NSObject addObject:](v107, "addObject:", v128);

                          }
                          v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v203, v213, 16);
                        }
                        while (v124);
                      }

                      v130 = objc_getProperty(v2, v129, 80, 1);
                      objc_msgSend(v130, "extraSupportedSignatureHashes");
                      v131 = (void *)objc_claimAutoreleasedReturnValue();
                      v111 = +[NEIKEv2Crypto copySignHashDataForSet:authenticationSet:]((uint64_t)NEIKEv2Crypto, v131, v107);

                      v101 = v187;
                    }
LABEL_84:

                    if (v111 && !-[NEIKEv2Packet addNotification:data:](v6, 0x402FuLL, v111))
                    {
                      ne_log_obj();
                      v107 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v107, OS_LOG_TYPE_FAULT))
                      {
LABEL_141:

                        goto LABEL_142;
                      }
                      *(_WORD *)buf = 0;
                      v181 = "[packet addNotification:NEIKEv2NotifyTypeSignatureHashAlgorithms] failed";
                    }
                    else
                    {
                      v133 = objc_getProperty(v2, v132, 80, 1);
                      v134 = objc_msgSend(v133, "requestPPK");

                      if (!v134 || -[NEIKEv2Packet addNotification:data:](v6, 0x4033uLL, 0))
                      {
                        v186 = v111;
                        v188 = v101;
                        v201 = 0u;
                        v202 = 0u;
                        v199 = 0u;
                        v200 = 0u;
                        v136 = objc_getProperty(v2, v135, 80, 1);
                        objc_msgSend(v136, "proposals");
                        v137 = (void *)objc_claimAutoreleasedReturnValue();

                        v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v199, v212, 16);
                        if (v138)
                        {
                          v139 = v138;
                          v140 = *(_QWORD *)v200;
                          while (2)
                          {
                            for (j = 0; j != v139; ++j)
                            {
                              if (*(_QWORD *)v200 != v140)
                                objc_enumerationMutation(v137);
                              objc_msgSend(*(id *)(*((_QWORD *)&v199 + 1) + 8 * j), "additionalKEMProtocols");
                              v142 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v142 && !-[NEIKEv2Packet addNotification:data:](v6, 0x4036uLL, 0))
                              {
                                ne_log_obj();
                                v182 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v182, OS_LOG_TYPE_FAULT))
                                {
                                  *(_WORD *)buf = 0;
                                  _os_log_fault_impl(&dword_19BD16000, v182, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeIntermediateExchangeSupported] failed", buf, 2u);
                                }

                                v76 = 0;
                                goto LABEL_129;
                              }
                            }
                            v139 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v199, v212, 16);
                            if (v139)
                              continue;
                            break;
                          }
                        }

                        v197 = 0u;
                        v198 = 0u;
                        v195 = 0u;
                        v196 = 0u;
                        v144 = objc_getProperty(v2, v143, 80, 1);
                        objc_msgSend(v144, "customIKESAInitVendorPayloads");
                        v145 = (void *)objc_claimAutoreleasedReturnValue();

                        obj = v145;
                        v146 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v195, v211, 16);
                        if (v146)
                        {
                          v147 = v146;
                          v148 = *(_QWORD *)v196;
                          do
                          {
                            for (k = 0; k != v147; ++k)
                            {
                              if (*(_QWORD *)v196 != v148)
                                objc_enumerationMutation(obj);
                              v150 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * k);
                              v151 = objc_alloc_init(NEIKEv2VendorIDPayload);
                              objc_msgSend(v150, "vendorData");
                              v153 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v151)
                                objc_setProperty_atomic(v151, v152, v153, 24);

                              objc_getProperty(v6, v154, 120, 1);
                              v155 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v155)
                              {
                                objc_getProperty(v6, v156, 120, 1);
                                v157 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v157, "arrayByAddingObject:", v151);
                                v158 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_setProperty_atomic(v6, v159, v158, 120);

                              }
                              else
                              {
                                v210 = v151;
                                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v210, 1);
                                v157 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_setProperty_atomic(v6, v160, v157, 120);
                              }

                            }
                            v147 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v211, 16);
                          }
                          while (v147);
                        }

                        v193 = 0u;
                        v194 = 0u;
                        v191 = 0u;
                        v192 = 0u;
                        v162 = objc_getProperty(v2, v161, 80, 1);
                        objc_msgSend(v162, "customIKESAInitPayloads");
                        v163 = (void *)objc_claimAutoreleasedReturnValue();

                        obja = v163;
                        v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v191, v209, 16);
                        if (v164)
                        {
                          v165 = v164;
                          v166 = *(_QWORD *)v192;
                          do
                          {
                            v167 = 0;
                            do
                            {
                              if (*(_QWORD *)v192 != v166)
                                objc_enumerationMutation(obja);
                              v168 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * v167);
                              v169 = objc_alloc_init(NEIKEv2CustomPayload);
                              v170 = objc_msgSend(v168, "customType");
                              if (v169)
                              {
                                v169->_customType = v170;
                                objc_msgSend(v168, "customData");
                                v171 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_setProperty_atomic(v169, v172, v171, 32);
                              }
                              else
                              {
                                objc_msgSend(v168, "customData");
                                v171 = (void *)objc_claimAutoreleasedReturnValue();
                              }

                              objc_getProperty(v6, v173, 56, 1);
                              v174 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v174)
                              {
                                objc_getProperty(v6, v175, 56, 1);
                                v176 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v176, "arrayByAddingObject:", v169);
                                v177 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_setProperty_atomic(v6, v178, v177, 56);

                              }
                              else
                              {
                                v208 = v169;
                                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v208, 1);
                                v176 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_setProperty_atomic(v6, v179, v176, 56);
                              }

                              ++v167;
                            }
                            while (v165 != v167);
                            v180 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v191, v209, 16);
                            v165 = v180;
                          }
                          while (v180);
                        }

                        v76 = v6;
LABEL_129:
                        v111 = v186;
                        v101 = v188;
                        goto LABEL_143;
                      }
                      ne_log_obj();
                      v107 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v107, OS_LOG_TYPE_FAULT))
                        goto LABEL_141;
                      *(_WORD *)buf = 0;
                      v181 = "[packet addNotification:NEIKEv2NotifyTypeUsePPK] failed";
                    }
                    _os_log_fault_impl(&dword_19BD16000, v107, OS_LOG_TYPE_FAULT, v181, buf, 2u);
                    goto LABEL_141;
                  }
                  ne_log_obj();
                  v111 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v111, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    v119 = "[packet addNotification:NEIKEv2NotifyTypeIKEv2FragmentationSupported] failed";
                    goto LABEL_73;
                  }
                }
                else
                {
                  ne_log_obj();
                  v111 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v111, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    v119 = "[packet addNotification:NEIKEv2NotifyTypeNATDetectionDestinationIP] failed";
LABEL_73:
                    _os_log_fault_impl(&dword_19BD16000, v111, OS_LOG_TYPE_FAULT, v119, buf, 2u);
                  }
                }
LABEL_142:
                v76 = 0;
LABEL_143:

LABEL_144:
                goto LABEL_64;
              }
              ne_log_obj();
              p_super = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
              {
LABEL_63:
                v76 = 0;
LABEL_64:

                goto LABEL_65;
              }
              *(_WORD *)buf = 0;
              v77 = "[packet addNotification:NEIKEv2NotifyTypeRedirectSupported] failed";
              goto LABEL_32;
            }
            ne_log_obj();
            p_super = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
              goto LABEL_63;
            *(_DWORD *)buf = 136315138;
            v215 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitForInitiatorIKESA:]";
            v77 = "%s called with null packet.nonce.isValid";
          }
          else
          {
            ne_log_obj();
            p_super = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
              goto LABEL_63;
            *(_DWORD *)buf = 136315138;
            v215 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitForInitiatorIKESA:]";
            v77 = "%s called with null packet.ke.isValid";
          }
        }
        else
        {
          ne_log_obj();
          p_super = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
            goto LABEL_63;
          *(_DWORD *)buf = 136315138;
          v215 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitForInitiatorIKESA:]";
          v77 = "%s called with null packet.sa.isValid";
        }
        v78 = p_super;
        v79 = 12;
        goto LABEL_38;
      }
      ne_log_obj();
      p_super = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
        goto LABEL_63;
      *(_WORD *)buf = 0;
      v77 = "[NEIKEv2NotifyPayload createNotifyPayloadType:NEIKEv2NotifyTypeCookie] failed";
    }
    else
    {
      ne_log_obj();
      p_super = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
        goto LABEL_63;
      *(_WORD *)buf = 0;
      v77 = "[[NEIKEv2IKESAInitPacket alloc] initOutbound:] failed";
    }
LABEL_32:
    v78 = p_super;
    v79 = 2;
LABEL_38:
    _os_log_fault_impl(&dword_19BD16000, v78, OS_LOG_TYPE_FAULT, v77, buf, v79);
    goto LABEL_63;
  }
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v215 = "+[NEIKEv2IKESAInitPacket(Exchange) createIKESAInitForInitiatorIKESA:]";
    v80 = "%s called with null ikeSA.preferredKEMProtocol";
LABEL_40:
    _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, v80, buf, 0xCu);
  }
LABEL_25:
  v76 = 0;
LABEL_65:

  return v76;
}

+ (id)createIKESAInitResponse:(unint64_t)a3 errorCode:(void *)a4 errorData:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v6 = a2;
  v7 = a4;
  objc_opt_self();
  v8 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2IKESAInitPacket alloc], v6);
  if (!v8)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, v11, OS_LOG_TYPE_FAULT, "[[NEIKEv2IKESAInitPacket alloc] initResponse:] failed", buf, 2u);
    }

    v9 = 0;
    goto LABEL_10;
  }
  v9 = v8;
  if (!-[NEIKEv2Packet addNotification:data:](v8, a3, v7))
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, "[packet addNotification:data:] failed", v14, 2u);
    }

LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v9 = v9;
  v10 = v9;
LABEL_11:

  return v10;
}

- (uint64_t)validateSAInitAsInitiator:(uint64_t)a1
{
  _BYTE *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _QWORD *v12;
  const char *v13;
  NSObject *v14;
  NSObject *Error;
  void *v16;
  const char *v17;
  NSObject *Property;
  const char *v19;
  __CFString *v20;
  SEL v21;
  NSObject *v22;
  const char *v23;
  id v24;
  void *v25;
  NEIKEv2KEMProtocol *v26;
  NEIKEv2KEMProtocol *v27;
  SEL v28;
  id v29;
  uint64_t v30;
  const char *v31;
  id v32;
  SEL v33;
  void *v34;
  const char *v35;
  void *v36;
  NEIKEv2AuthenticationProtocol *ErrorPeerInvalidSyntax;
  const char *v38;
  const char *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  char *v75;
  NSObject *v76;
  SEL v77;
  SEL v78;
  id v79;
  const char *v80;
  id v81;
  const char *v82;
  void *v83;
  id v84;
  const char *v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  void *v90;
  id v91;
  const char *v92;
  void *v93;
  const char *v94;
  void *v95;
  id v96;
  const char *v97;
  void *v98;
  const char *v99;
  void *v100;
  id v101;
  SEL v102;
  id v103;
  const char *v104;
  void *v105;
  uint64_t v106;
  const char *v107;
  void *v108;
  const char *v109;
  void *v110;
  id v111;
  SEL v112;
  SEL v113;
  void *v114;
  const char *v115;
  void *v116;
  const char *v117;
  void *v118;
  id v119;
  const char *v120;
  id v121;
  int v122;
  const char *v123;
  void *v124;
  const char *v125;
  void *v126;
  id v127;
  uint64_t v128;
  const char *v129;
  NSObject *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  NSObject *v139;
  SEL v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  id v149;
  NSObject *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  char *v159;
  char *v160;
  int v161;
  NSObject *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  __CFString *v170;
  char *v171;
  NSObject *v172;
  char *v173;
  SEL v174;
  id v175;
  void *v176;
  NSObject *v177;
  NSObject *v178;
  int *v179;
  SEL v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  SEL v184;
  id v185;
  const char *v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  NSObject *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  __CFString *v205;
  char *v206;
  NSObject *v207;
  char *v208;
  char *v209;
  id v210;
  const char *v211;
  void *v212;
  unsigned int v213;
  NSObject *v214;
  SEL v215;
  const char *v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  void *v226;
  const char *v227;
  void *v228;
  id v229;
  SEL v230;
  _QWORD *v231;
  const char *v232;
  id v233;
  void *v234;
  id v235;
  void *v236;
  int v237;
  _QWORD *v238;
  const char *v239;
  id v240;
  NEIKEv2AuthenticationProtocol *v241;
  NEIKEv2AuthenticationProtocol *v242;
  SEL v243;
  id v244;
  void *v245;
  BOOL v246;
  NSObject *v247;
  NSObject *v248;
  SEL v249;
  id v250;
  int v251;
  const char *v252;
  id v253;
  char v254;
  NSObject *v255;
  char *v256;
  id v257;
  int v258;
  NSObject *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  __CFString *v267;
  _QWORD *v268;
  _QWORD *v269;
  const char *v270;
  void *v271;
  const char *v272;
  void *v273;
  SEL v274;
  id v275;
  const char *v276;
  void *v277;
  const char *v278;
  void *v279;
  SEL v280;
  id v281;
  void *v282;
  SEL v283;
  id v284;
  const char *v285;
  NSObject *v286;
  id v287;
  char v288;
  const char *v289;
  NSObject *v290;
  id v291;
  const char *v292;
  const char *v293;
  char *v294;
  NSObject *v295;
  SEL v296;
  id v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  SEL v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  SEL v310;
  id v311;
  const char *v312;
  void *v313;
  uint64_t v314;
  NSObject *v315;
  id v316;
  char v317;
  char *v318;
  id v319;
  SEL v320;
  char *v321;
  char *v322;
  char *v323;
  char *v324;
  SEL v325;
  id v326;
  void *v327;
  char *v328;
  SEL v329;
  id v330;
  const char *v331;
  void *v332;
  char *v333;
  char *v334;
  char *v335;
  NSObject *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  char *v344;
  char *v345;
  char *v346;
  NSObject *v347;
  NSObject *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  void *v357;
  char *v358;
  char *v359;
  uint64_t v360;
  uint64_t v361;
  void *v362;
  void *v363;
  id v364;
  id v365;
  id v366;
  char *v367;
  id selfd;
  NEIKEv2AuthenticationProtocol *self;
  id selfa;
  id selfb;
  id selfc;
  id v373;
  unsigned __int16 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  int buf;
  const char *v384;
  __int16 v385;
  NEIKEv2AuthenticationProtocol *v386;
  __int16 v387;
  uint64_t v388;
  _BYTE v389[128];
  _BYTE v390[128];
  uint64_t v391;

  v391 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = (uint64_t)v3;
  if (!a1)
    goto LABEL_49;
  if (!v3)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      buf = 136315138;
      v384 = "-[NEIKEv2IKESAInitPacket(Exchange) validateSAInitAsInitiator:]";
      v196 = "%s called with null ikeSA";
LABEL_118:
      _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, v196, (uint8_t *)&buf, 0xCu);
    }
LABEL_47:
    a1 = 0;
    goto LABEL_48;
  }
  if ((v3[9] & 1) == 0)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      buf = 136315138;
      v384 = "-[NEIKEv2IKESAInitPacket(Exchange) validateSAInitAsInitiator:]";
      v196 = "%s called with null ikeSA.isInitiator";
      goto LABEL_118;
    }
    goto LABEL_47;
  }
  if (!-[NEIKEv2Packet hasErrors]((void *)a1, v4))
    goto LABEL_15;
  v381 = 0u;
  v382 = 0u;
  v379 = 0u;
  v380 = 0u;
  v7 = objc_getProperty((id)a1, v6, 64, 1);
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v379, v390, 16);
  if (!v8)
    goto LABEL_14;
  v9 = v8;
  v10 = *(_QWORD *)v380;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v380 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD **)(*((_QWORD *)&v379 + 1) + 8 * i);
      if (v12 && (unint64_t)(v12[3] - 1) <= 0x3FFE)
      {
        v20 = (__CFString *)-[NEIKEv2NotifyPayload copyError](*(const __CFString **)(*((_QWORD *)&v379 + 1) + 8 * i));
        ne_log_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v75 = (char *)objc_msgSend((id)a1, "copyShortDescription");
          buf = 138412546;
          v384 = v75;
          v385 = 2112;
          v386 = (NEIKEv2AuthenticationProtocol *)v20;
          _os_log_error_impl(&dword_19BD16000, v22, OS_LOG_TYPE_ERROR, "%@ Initiator init received notify error %@", (uint8_t *)&buf, 0x16u);

        }
        if (v12[3] == 17)
        {
          v24 = objc_getProperty(v12, v23, 32, 1);
          v25 = v24;
          if (v24)
          {
            LOWORD(buf) = 0;
            objc_msgSend(v24, "getBytes:length:", &buf, 2);
            v26 = [NEIKEv2KEMProtocol alloc];
            v27 = -[NEIKEv2KEMProtocol initWithMethod:](v26, "initWithMethod:", bswap32((unsigned __int16)buf) >> 16);
            objc_setProperty_atomic((id)v5, v28, v27, 144);

          }
          else
          {
            -[NEIKEv2IKESA setState:error:](v5, 3uLL, v20);
          }

        }
        else
        {
          -[NEIKEv2IKESA setState:error:](v5, 3uLL, v20);
        }
LABEL_46:

        goto LABEL_47;
      }
    }
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v379, v390, 16);
  }
  while (v9);
LABEL_14:

LABEL_15:
  if (-[NEIKEv2Packet hasNotification:]((void *)a1, (const char *)0x4017))
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v65 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      buf = 138412290;
      v384 = v65;
      _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "%@ Received notify server redirect", (uint8_t *)&buf, 0xCu);

    }
    Error = NEIKEv2CreateError(5);
    goto LABEL_19;
  }
  objc_getProperty((id)a1, v13, 88, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_getProperty((id)a1, v17, 88, 1);
    Property = objc_claimAutoreleasedReturnValue();
    v7 = Property;
    if (Property)
      Property = objc_getProperty(Property, v19, 32, 1);
    v20 = Property;
    objc_setProperty_atomic((id)v5, v21, v20, 280);
    goto LABEL_46;
  }
  v29 = objc_getProperty((id)a1, v17, 40, 1);
  v30 = objc_msgSend(v29, "value");

  if (!v30)
  {
    ne_log_obj();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v159 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      buf = 138412290;
      v384 = v159;
      _os_log_error_impl(&dword_19BD16000, v48, OS_LOG_TYPE_ERROR, "%@ Received no remote SPI on SA_INIT", (uint8_t *)&buf, 0xCu);

    }
    Error = NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Received no remote SPI on SA_INIT"), v49, v50, v51, v52, v53, v54, v55, v361);
LABEL_19:
    v7 = Error;
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, Error);
    goto LABEL_47;
  }
  v32 = objc_getProperty((id)a1, v31, 40, 1);
  -[NEIKEv2IKESA assignRemoteSPI:]((void *)v5, v32);

  objc_getProperty((id)a1, v33, 96, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v34;
  if (v34)
    v34 = objc_getProperty(v34, v35, 24, 1);
  v7 = v34;

  if (-[NSObject count](v7, "count") != 1)
  {
    ne_log_obj();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v160 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      v161 = -[NSObject count](v7, "count");
      buf = 138412546;
      v384 = v160;
      v385 = 1024;
      LODWORD(v386) = v161;
      _os_log_error_impl(&dword_19BD16000, v56, OS_LOG_TYPE_ERROR, "%@ Received %u SA proposals, require 1", (uint8_t *)&buf, 0x12u);

    }
    v57 = -[NSObject count](v7, "count");
    ErrorPeerInvalidSyntax = (NEIKEv2AuthenticationProtocol *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Invalid SA proposal count %u"), v58, v59, v60, v61, v62, v63, v64, v57);
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, ErrorPeerInvalidSyntax);
    a1 = 0;
    goto LABEL_109;
  }
  -[NSObject firstObject](v7, "firstObject");
  ErrorPeerInvalidSyntax = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
  if ((-[NEIKEv2IKESAProposal isAValidResponse](ErrorPeerInvalidSyntax, v38) & 1) == 0)
  {
    ne_log_obj();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      v171 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      buf = 138412546;
      v384 = v171;
      v385 = 2112;
      v386 = ErrorPeerInvalidSyntax;
      _os_log_error_impl(&dword_19BD16000, v66, OS_LOG_TYPE_ERROR, "%@ Received invalid SA proposal %@", (uint8_t *)&buf, 0x16u);

    }
    v74 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Received invalid SA proposal"), v67, v68, v69, v70, v71, v72, v73, v361);
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, v74);
    a1 = 0;
    goto LABEL_108;
  }
  v377 = 0u;
  v378 = 0u;
  v375 = 0u;
  v376 = 0u;
  v40 = objc_getProperty((id)v5, v39, 80, 1);
  objc_msgSend(v40, "proposals");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v375, v389, 16);
  if (!v42)
  {
LABEL_43:

LABEL_88:
    ne_log_obj();
    v139 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
    {
      v173 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      v175 = objc_getProperty((id)v5, v174, 80, 1);
      objc_msgSend(v175, "proposals");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138412802;
      v384 = v173;
      v385 = 2112;
      v386 = ErrorPeerInvalidSyntax;
      v387 = 2112;
      v388 = (uint64_t)v176;
      _os_log_error_impl(&dword_19BD16000, v139, OS_LOG_TYPE_ERROR, "%@ Received proposal %@ does not match config %@", (uint8_t *)&buf, 0x20u);

    }
    v74 = objc_getProperty((id)v5, v140, 80, 1);
    objc_msgSend(v74, "proposals");
    v141 = (id)objc_claimAutoreleasedReturnValue();
    v149 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Received proposal %@ does not match config %@"), v142, v143, v144, v145, v146, v147, v148, (uint64_t)ErrorPeerInvalidSyntax);
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, v149);
LABEL_91:

LABEL_106:
    a1 = 0;
    goto LABEL_107;
  }
  v43 = v42;
  v44 = *(_QWORD *)v376;
LABEL_37:
  v45 = 0;
  while (1)
  {
    if (*(_QWORD *)v376 != v44)
      objc_enumerationMutation(v41);
    v46 = *(void **)(*((_QWORD *)&v375 + 1) + 8 * v45);
    if ((-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:](v46, ErrorPeerInvalidSyntax, 0) & 1) != 0)break;
    if (v43 == ++v45)
    {
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v375, v389, 16);
      if (v43)
        goto LABEL_37;
      goto LABEL_43;
    }
  }
  v74 = v46;

  if (!v74)
    goto LABEL_88;
  v76 = -[NEIKEv2IKESAProposal copyFromRemote:preferRemoteProposal:](v74, ErrorPeerInvalidSyntax, 0);
  objc_setProperty_atomic((id)v5, v77, v76, 96);

  v79 = objc_getProperty((id)v5, v78, 96, 1);
  if (!v79)
  {
    ne_log_obj();
    v150 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
    {
      v206 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      buf = 138412546;
      v384 = v206;
      v385 = 2112;
      v386 = ErrorPeerInvalidSyntax;
      _os_log_error_impl(&dword_19BD16000, v150, OS_LOG_TYPE_ERROR, "%@ Could not set chosen proposal values %@", (uint8_t *)&buf, 0x16u);

    }
    v158 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Could not set chosen proposal values %@"), v151, v152, v153, v154, v155, v156, v157, (uint64_t)ErrorPeerInvalidSyntax);
    goto LABEL_105;
  }
  v81 = objc_getProperty((id)v5, v80, 96, 1);
  v83 = v81;
  if (v81)
    v81 = objc_getProperty(v81, v82, 120, 1);
  v84 = v81;

  if (v84 && (-[NEIKEv2Packet hasNotification:]((void *)a1, (const char *)0x4036) & 1) == 0)
  {
    ne_log_obj();
    v336 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v336, OS_LOG_TYPE_ERROR))
    {
      v346 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      buf = 138412546;
      v384 = v346;
      v385 = 2112;
      v386 = ErrorPeerInvalidSyntax;
      _os_log_error_impl(&dword_19BD16000, v336, OS_LOG_TYPE_ERROR, "%@ Chosen proposal requires IKE_INTERMEDIATE but peer does not support it %@ ", (uint8_t *)&buf, 0x16u);

    }
    v158 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Chosen proposal requires IKE_INTERMEDIATE but peer does not support it %@"), v337, v338, v339, v340, v341, v342, v343, (uint64_t)ErrorPeerInvalidSyntax);
    goto LABEL_105;
  }
  objc_getProperty((id)a1, v85, 104, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v86)
  {
    ne_log_obj();
    v162 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
    {
      v208 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      buf = 138412290;
      v384 = v208;
      _os_log_error_impl(&dword_19BD16000, v162, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload", (uint8_t *)&buf, 0xCu);

    }
    v170 = CFSTR("Did not receive KE payload");
    goto LABEL_104;
  }
  objc_getProperty((id)a1, v87, 104, 1);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v88;
  if (v88)
    v88 = objc_getProperty(v88, v89, 24, 1);
  v91 = v88;

  if (!v91)
  {
    ne_log_obj();
    v172 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR))
    {
      v209 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      buf = 138412290;
      v384 = v209;
      _os_log_error_impl(&dword_19BD16000, v172, OS_LOG_TYPE_ERROR, "%@ Did not receive method in KE payload", (uint8_t *)&buf, 0xCu);

    }
    v170 = CFSTR("Did not receive method in KE payload");
    goto LABEL_104;
  }
  objc_getProperty((id)a1, v92, 104, 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v93;
  if (v93)
    v93 = objc_getProperty(v93, v94, 32, 1);
  v96 = v93;

  if (!v96)
  {
    ne_log_obj();
    v177 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
    {
      v294 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      buf = 138412290;
      v384 = v294;
      _os_log_error_impl(&dword_19BD16000, v177, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload", (uint8_t *)&buf, 0xCu);

    }
    v170 = CFSTR("Did not receive data in KE payload");
LABEL_104:
    v158 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v170, v163, v164, v165, v166, v167, v168, v169, v361);
LABEL_105:
    v141 = v158;
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, v158);
    goto LABEL_106;
  }
  objc_getProperty((id)a1, v97, 104, 1);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v98;
  v373 = v74;
  if (v98)
    v98 = objc_getProperty(v98, v99, 24, 1);
  v101 = v98;
  selfd = (id)objc_msgSend(v101, "method");
  v103 = objc_getProperty((id)v5, v102, 96, 1);
  -[NEIKEv2IKESAProposal kemProtocol](v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v105, "method");

  if (selfd != (id)v106)
  {
    ne_log_obj();
    v178 = objc_claimAutoreleasedReturnValue();
    v74 = v373;
    v179 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
    if (os_log_type_enabled(v178, OS_LOG_TYPE_ERROR))
    {
      v367 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      objc_getProperty((id)a1, v306, 104, 1);
      v307 = (void *)objc_claimAutoreleasedReturnValue();
      selfc = v307;
      if (v307)
        v307 = objc_getProperty(v307, v308, 24, 1);
      v364 = v307;
      v309 = objc_msgSend(v364, "method");
      v311 = objc_getProperty((id)v5, v310, 96, 1);
      -[NEIKEv2IKESAProposal kemProtocol](v311, v312);
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      v314 = objc_msgSend(v313, "method");
      buf = 138412802;
      v384 = v367;
      v385 = 2048;
      v386 = (NEIKEv2AuthenticationProtocol *)v309;
      v387 = 2048;
      v388 = v314;
      _os_log_error_impl(&dword_19BD16000, v178, OS_LOG_TYPE_ERROR, "%@ Did not receive matching method from KE payload (%zu != %zu)", (uint8_t *)&buf, 0x20u);

      v74 = v373;
      v179 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
    }

    objc_getProperty((id)a1, v180, v179[271], 1);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = v181;
    if (v181)
      v181 = objc_getProperty(v181, v182, 24, 1);
    v149 = v181;
    v183 = objc_msgSend(v149, "method");
    v185 = objc_getProperty((id)v5, v184, 96, 1);
    -[NEIKEv2IKESAProposal kemProtocol](v185, v186);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "method");
    v195 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Did not receive matching method from KE payload (%zu != %zu)"), v188, v189, v190, v191, v192, v193, v194, v183);
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, v195);

    goto LABEL_91;
  }
  objc_getProperty((id)a1, v107, 104, 1);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v108;
  if (v108)
    v108 = objc_getProperty(v108, v109, 32, 1);
  v111 = v108;
  objc_setProperty_atomic((id)v5, v112, v111, 152);

  objc_getProperty((id)a1, v113, 112, 1);
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v114)
  {
    ne_log_obj();
    v197 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR))
    {
      v318 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      buf = 138412290;
      v384 = v318;
      _os_log_error_impl(&dword_19BD16000, v197, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE payload", (uint8_t *)&buf, 0xCu);

    }
    v205 = CFSTR("Did not receive NONCE payload");
    goto LABEL_125;
  }
  objc_getProperty((id)a1, v115, 112, 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v116;
  if (v116)
    v116 = objc_getProperty(v116, v117, 24, 1);
  v119 = v116;

  if (!v119)
  {
    ne_log_obj();
    v207 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
    {
      v321 = (char *)objc_msgSend((id)a1, "copyShortDescription");
      buf = 138412290;
      v384 = v321;
      _os_log_error_impl(&dword_19BD16000, v207, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE data", (uint8_t *)&buf, 0xCu);

    }
    v205 = CFSTR("Did not receive NONCE data");
LABEL_125:
    v138 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v205, v198, v199, v200, v201, v202, v203, v204, v361);
    goto LABEL_126;
  }
  v121 = objc_getProperty((id)v5, v120, 80, 1);
  v122 = objc_msgSend(v121, "strictNonceSizeChecks");

  if (!v122)
    goto LABEL_133;
  objc_getProperty((id)a1, v123, 112, 1);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v124;
  if (v124)
    v124 = objc_getProperty(v124, v125, 24, 1);
  v127 = v124;
  v128 = objc_msgSend(v127, "length");

  self = (NEIKEv2AuthenticationProtocol *)v128;
  if ((unint64_t)(v128 - 257) > 0xFFFFFFFFFFFFFF0ELL)
  {
    v210 = objc_getProperty((id)v5, v129, 96, 1);
    -[NEIKEv2IKESAProposal prfProtocol](v210, v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v213 = objc_msgSend(v212, "nonceSize");

    if ((unint64_t)self < v213)
    {
      ne_log_obj();
      v214 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
      {
        v328 = (char *)objc_msgSend((id)a1, "copyShortDescription");
        v330 = objc_getProperty((id)v5, v329, 96, 1);
        -[NEIKEv2IKESAProposal prfProtocol](v330, v331);
        v332 = (void *)objc_claimAutoreleasedReturnValue();
        buf = 138412802;
        v384 = v328;
        v385 = 2048;
        v386 = self;
        v387 = 2112;
        v388 = (uint64_t)v332;
        _os_log_error_impl(&dword_19BD16000, v214, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is shorter than the minimum for PRF protocol %@", (uint8_t *)&buf, 0x20u);

      }
      v141 = objc_getProperty((id)v5, v215, 96, 1);
      -[NEIKEv2IKESAProposal prfProtocol](v141, v216);
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      v225 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("NONCE data length %zu is shorter than the minimum for PRF protocol %@"), v218, v219, v220, v221, v222, v223, v224, (uint64_t)self);
      -[NEIKEv2IKESA setState:error:](v5, 3uLL, v225);

      goto LABEL_184;
    }
LABEL_133:
    objc_getProperty((id)a1, v123, 112, 1);
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    v228 = v226;
    if (v226)
      v226 = objc_getProperty(v226, v227, 24, 1);
    v229 = v226;
    objc_setProperty_atomic((id)v5, v230, v229, 136);

    v231 = -[NEIKEv2Packet copyNotification:]((void *)a1, (const char *)0x402F);
    v141 = v231;
    if (v231)
    {
      v233 = objc_getProperty(v231, v232, 32, 1);
      v234 = +[NEIKEv2Crypto copySignHashSetForData:]((uint64_t)NEIKEv2Crypto, v233);
      objc_storeStrong((id *)(v5 + 112), v234);

    }
    v235 = objc_getProperty((id)v5, v232, 88, 1);
    objc_msgSend(v235, "authenticationProtocol");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    v237 = objc_msgSend(v236, "isSecurePassword");

    if (v237)
    {
      v238 = -[NEIKEv2Packet copyNotification:]((void *)a1, (const char *)0x4028);
      if (!v238)
      {
        ne_log_obj();
        v347 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v347, OS_LOG_TYPE_ERROR))
        {
          v358 = (char *)objc_msgSend((id)a1, "copyShortDescription");
          buf = 138412290;
          v384 = v358;
          _os_log_error_impl(&dword_19BD16000, v347, OS_LOG_TYPE_ERROR, "%@ Did not receive secure password methods notify", (uint8_t *)&buf, 0xCu);

        }
        v267 = CFSTR("Did not receive secure password methods notify");
        goto LABEL_183;
      }
      selfa = v238;
      v240 = objc_getProperty(v238, v239, 32, 1);
      if (objc_msgSend(v240, "length") == 2)
      {
        v374 = 0;
        v365 = v240;
        objc_msgSend(v240, "getBytes:length:", &v374, 2);
        v241 = [NEIKEv2AuthenticationProtocol alloc];
        v242 = -[NEIKEv2AuthenticationProtocol initWithSecurePassword:](v241, "initWithSecurePassword:", bswap32(v374) >> 16);
        v244 = objc_getProperty((id)v5, v243, 88, 1);
        objc_msgSend(v244, "authenticationProtocol");
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        v246 = -[NEIKEv2AuthenticationProtocol isEqual:](v242, "isEqual:", v245);

        if (v246)
        {
          objc_storeStrong((id *)(v5 + 104), v242);

          goto LABEL_142;
        }
        ne_log_obj();
        v295 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v295, OS_LOG_TYPE_ERROR))
        {
          v324 = (char *)objc_msgSend((id)a1, "copyShortDescription");
          v326 = objc_getProperty((id)v5, v325, 88, 1);
          objc_msgSend(v326, "authenticationProtocol");
          v327 = (void *)objc_claimAutoreleasedReturnValue();
          buf = 138412802;
          v384 = v324;
          v385 = 2112;
          v386 = v242;
          v387 = 2112;
          v388 = (uint64_t)v327;
          _os_log_error_impl(&dword_19BD16000, v295, OS_LOG_TYPE_ERROR, "%@ Secure password method %@ does not match configured %@", (uint8_t *)&buf, 0x20u);

        }
        v297 = objc_getProperty((id)v5, v296, 88, 1);
        objc_msgSend(v297, "authenticationProtocol");
        v362 = (void *)objc_claimAutoreleasedReturnValue();
        v305 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Secure password method %@ does not match configured %@"), v298, v299, v300, v301, v302, v303, v304, (uint64_t)v242);
        -[NEIKEv2IKESA setState:error:](v5, 3uLL, v305);

      }
      else
      {
        ne_log_obj();
        v348 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v348, OS_LOG_TYPE_ERROR))
        {
          v359 = (char *)objc_msgSend((id)a1, "copyShortDescription");
          v360 = objc_msgSend(v240, "length");
          buf = 138412546;
          v384 = v359;
          v385 = 2048;
          v386 = (NEIKEv2AuthenticationProtocol *)v360;
          _os_log_error_impl(&dword_19BD16000, v348, OS_LOG_TYPE_ERROR, "%@ Secure password methods notify has incorrect length %zu != sizeof(uint16_t)", (uint8_t *)&buf, 0x16u);

        }
        v349 = objc_msgSend(v240, "length");
        v357 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Secure password methods notify has incorrect length %zu != sizeof(uint16_t)"), v350, v351, v352, v353, v354, v355, v356, v349);
        -[NEIKEv2IKESA setState:error:](v5, 3uLL, v357);

      }
      goto LABEL_127;
    }
LABEL_142:
    if (-[NEIKEv2Packet hasNotification:]((void *)a1, (const char *)0x402E)
      && (*(_BYTE *)(v5 + 13) & 1) == 0)
    {
      *(_BYTE *)(v5 + 10) = 1;
      ne_log_obj();
      v247 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v247, OS_LOG_TYPE_DEBUG))
      {
        v333 = (char *)objc_msgSend((id)a1, "copyShortDescription");
        buf = 138412290;
        v384 = v333;
        _os_log_debug_impl(&dword_19BD16000, v247, OS_LOG_TYPE_DEBUG, "%@ IKEv2 fragmentation supported", (uint8_t *)&buf, 0xCu);

      }
    }
    if (-[NEIKEv2Packet hasNotification:]((void *)a1, (const char *)0x4022))
    {
      ne_log_obj();
      v248 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v248, OS_LOG_TYPE_DEBUG))
      {
        v323 = (char *)objc_msgSend((id)a1, "copyShortDescription");
        buf = 138412290;
        v384 = v323;
        _os_log_debug_impl(&dword_19BD16000, v248, OS_LOG_TYPE_DEBUG, "%@ Childless IKEv2 supported", (uint8_t *)&buf, 0xCu);

      }
      v250 = objc_getProperty((id)v5, v249, 80, 1);
      v251 = objc_msgSend(v250, "requestChildlessSA");

      if (v251)
        *(_BYTE *)(v5 + 23) = 1;
    }
    if (-[NEIKEv2Packet hasNotification:]((void *)a1, (const char *)0x4033))
    {
      v253 = objc_getProperty((id)v5, v252, 80, 1);
      v254 = objc_msgSend(v253, "requestPPK");

      if ((v254 & 1) != 0)
      {
        *(_BYTE *)(v5 + 24) = 1;
        ne_log_obj();
        v255 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v255, OS_LOG_TYPE_INFO))
        {
          v256 = (char *)objc_msgSend((id)a1, "copyShortDescription");
          buf = 138412290;
          v384 = v256;
          _os_log_impl(&dword_19BD16000, v255, OS_LOG_TYPE_INFO, "%@ PPK use requested", (uint8_t *)&buf, 0xCu);

        }
LABEL_161:
        v268 = -[NEIKEv2Packet copyNotification:]((void *)a1, (const char *)0x4004);
        v269 = -[NEIKEv2Packet copyNotification:]((void *)a1, (const char *)0x4005);
        selfb = v268;
        if (!v268 || !v269)
          goto LABEL_192;
        v366 = v269;
        -[NEIKEv2IKESA initiatorSPI]((_BYTE *)v5, v270);
        v271 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2IKESA responderSPI]((_BYTE *)v5, v272);
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        v275 = objc_getProperty((id)v5, v274, 72, 1);
        v363 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v271, v273, v275);

        -[NEIKEv2IKESA initiatorSPI]((_BYTE *)v5, v276);
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2IKESA responderSPI]((_BYTE *)v5, v278);
        v279 = (void *)objc_claimAutoreleasedReturnValue();
        v281 = objc_getProperty((id)v5, v280, 64, 1);
        v282 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v277, v279, v281);

        v284 = objc_getProperty(selfb, v283, 32, 1);
        LOBYTE(v281) = objc_msgSend(v363, "isEqualToData:", v284);

        if ((v281 & 1) == 0)
        {
          *(_BYTE *)(v5 + 15) = 1;
          ne_log_obj();
          v286 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v286, OS_LOG_TYPE_DEBUG))
          {
            v344 = (char *)objc_msgSend((id)a1, "copyShortDescription");
            buf = 138412290;
            v384 = v344;
            _os_log_debug_impl(&dword_19BD16000, v286, OS_LOG_TYPE_DEBUG, "%@ Detected incoming NAT", (uint8_t *)&buf, 0xCu);

          }
        }
        v287 = objc_getProperty(v366, v285, 32, 1);
        v288 = objc_msgSend(v282, "isEqualToData:", v287);

        if ((v288 & 1) == 0)
        {
          *(_BYTE *)(v5 + 14) = 1;
          ne_log_obj();
          v290 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v290, OS_LOG_TYPE_DEBUG))
          {
            v345 = (char *)objc_msgSend((id)a1, "copyShortDescription");
            buf = 138412290;
            v384 = v345;
            _os_log_debug_impl(&dword_19BD16000, v290, OS_LOG_TYPE_DEBUG, "%@ Detected outgoing NAT", (uint8_t *)&buf, 0xCu);

          }
        }
        v291 = objc_getProperty((id)v5, v289, 80, 1);
        if (objc_msgSend(v291, "disableSwitchToNATTPorts"))
        {

        }
        else
        {
          v316 = objc_getProperty((id)v5, v292, 88, 1);
          if ((objc_msgSend(v316, "negotiateMOBIKE") & 1) != 0 || (*(_BYTE *)(v5 + 15) & 1) != 0)
          {

          }
          else
          {
            v317 = *(_BYTE *)(v5 + 14);

            if ((v317 & 1) == 0)
              goto LABEL_191;
          }
          -[NEIKEv2IKESA switchToNATTraversalPorts](v5, v293);
        }
LABEL_191:
        v319 = objc_getProperty(v366, v293, 32, 1);
        objc_setProperty_atomic((id)v5, v320, v319, 496);

        v269 = v366;
LABEL_192:

        a1 = 1;
        goto LABEL_128;
      }
      ne_log_obj();
      v315 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v315, OS_LOG_TYPE_ERROR))
      {
        v335 = (char *)objc_msgSend((id)a1, "copyShortDescription");
        buf = 138412290;
        v384 = v335;
        _os_log_error_impl(&dword_19BD16000, v315, OS_LOG_TYPE_ERROR, "%@ PPK use requested but PPK use is not configured", (uint8_t *)&buf, 0xCu);

      }
      v267 = CFSTR("PPK use requested but PPK use is not configured");
    }
    else
    {
      v257 = objc_getProperty((id)v5, v252, 88, 1);
      v258 = objc_msgSend(v257, "ppkMandatory");

      if (!v258)
        goto LABEL_161;
      ne_log_obj();
      v259 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v259, OS_LOG_TYPE_ERROR))
      {
        v334 = (char *)objc_msgSend((id)a1, "copyShortDescription");
        buf = 138412290;
        v384 = v334;
        _os_log_error_impl(&dword_19BD16000, v259, OS_LOG_TYPE_ERROR, "%@ PPK use not requested but PPK use is mandatory", (uint8_t *)&buf, 0xCu);

      }
      v267 = CFSTR("PPK use not requested but PPK use is mandatory");
    }
LABEL_183:
    v217 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v267, v260, v261, v262, v263, v264, v265, v266, v361);
    -[NEIKEv2IKESA setState:error:](v5, 3uLL, v217);
LABEL_184:

    goto LABEL_127;
  }
  ne_log_obj();
  v130 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
  {
    v322 = (char *)objc_msgSend((id)a1, "copyShortDescription");
    buf = 138412546;
    v384 = v322;
    v385 = 2048;
    v386 = (NEIKEv2AuthenticationProtocol *)v128;
    _os_log_error_impl(&dword_19BD16000, v130, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is out of bounds", (uint8_t *)&buf, 0x16u);

  }
  v138 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("NONCE data length %zu is out of bounds"), v131, v132, v133, v134, v135, v136, v137, v128);
LABEL_126:
  v141 = v138;
  -[NEIKEv2IKESA setState:error:](v5, 3uLL, v138);
LABEL_127:
  a1 = 0;
LABEL_128:
  v74 = v373;
LABEL_107:

LABEL_108:
LABEL_109:

LABEL_48:
LABEL_49:

  return a1;
}

- (uint64_t)validateSAInitAsResponder:(_QWORD *)a3 errorCodeToSend:
{
  _BYTE *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  id Property;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  SEL v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  id v25;
  id v26;
  void *v27;
  const char *v28;
  id v29;
  id v30;
  NSObject *v31;
  SEL v32;
  NSObject *v33;
  const char *v34;
  char *v35;
  id v36;
  id v37;
  const char *v38;
  id v39;
  id v40;
  const char *v41;
  id v42;
  const char *v43;
  void *v44;
  id v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  void *v51;
  id v52;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  id v57;
  const char *v58;
  void *v59;
  const char *v60;
  void *v61;
  id v62;
  const char *v63;
  uint64_t v64;
  id v65;
  id v66;
  const char *v67;
  void *v68;
  uint64_t v69;
  const char *v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  id v75;
  SEL v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  void *v81;
  id v82;
  const char *v83;
  id v84;
  id v85;
  int v86;
  const char *v87;
  void *v88;
  const char *v89;
  void *v90;
  id v91;
  unint64_t v92;
  const char *v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  __CFString *v103;
  NSObject *v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSObject *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  __CFString *v122;
  NSObject *v123;
  NSObject *v124;
  NSObject *v125;
  NSObject *v126;
  id v127;
  NSObject *v129;
  char *v130;
  char *v131;
  char *v132;
  NSObject *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  __CFString *v141;
  char *v142;
  NSObject *v143;
  id v144;
  char *v145;
  char *v146;
  id v147;
  id v148;
  const char *v149;
  void *v150;
  unsigned int v151;
  NSObject *v152;
  const char *v153;
  id v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  void *v164;
  const char *v165;
  void *v166;
  id v167;
  SEL v168;
  _QWORD *v169;
  const char *v170;
  void *v171;
  id v172;
  void *v173;
  _QWORD *v174;
  void *v175;
  NSObject *v176;
  const char *v177;
  id v178;
  char v179;
  NSObject *v180;
  char *v181;
  const char *v182;
  char *v183;
  _QWORD *v184;
  _QWORD *v185;
  const char *v186;
  void *v187;
  void *v188;
  SEL v189;
  id v190;
  void *v191;
  const char *v192;
  void *v193;
  SEL v194;
  id v195;
  void *v196;
  SEL v197;
  id v198;
  const char *v199;
  NSObject *v200;
  id v201;
  char v202;
  const char *v203;
  NSObject *v204;
  id v205;
  const char *v206;
  id v207;
  char v208;
  const char *v209;
  char *v210;
  SEL v211;
  void *v212;
  const char *v213;
  void *v214;
  id v215;
  const char *v216;
  uint64_t v217;
  id v218;
  id v219;
  const char *v220;
  void *v221;
  uint64_t v222;
  char *v223;
  char *v224;
  char *v225;
  char *v226;
  char *v227;
  char *v228;
  const char *v229;
  char *v230;
  id v231;
  id v232;
  const char *v233;
  void *v234;
  NSObject *v235;
  const char *v236;
  id v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *ErrorPeerInvalidSyntax;
  const char *v246;
  char *v247;
  id v248;
  id v249;
  uint64_t v250;
  void *v251;
  void *v252;
  void *v253;
  _QWORD *v254;
  void *v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  uint8_t buf[4];
  const char *v261;
  __int16 v262;
  unint64_t v263;
  __int16 v264;
  uint64_t v265;
  _BYTE v266[128];
  uint64_t v267;

  v267 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = (uint64_t)v5;
  if (v5 && (v5[9] & 1) != 0)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v261 = "-[NEIKEv2IKESAInitPacket(Exchange) validateSAInitAsResponder:errorCodeToSend:]";
      _os_log_fault_impl(&dword_19BD16000, v10, OS_LOG_TYPE_FAULT, "%s called with null !ikeSA.isInitiator", buf, 0xCu);
    }
  }
  else
  {
    if (-[NEIKEv2Packet hasErrors](a1, v6))
    {
      v258 = 0u;
      v259 = 0u;
      v256 = 0u;
      v257 = 0u;
      if (a1)
        Property = objc_getProperty(a1, v8, 64, 1);
      else
        Property = 0;
      v10 = Property;
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v256, v266, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v257;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v257 != v13)
              objc_enumerationMutation(v10);
            v15 = *(const __CFString **)(*((_QWORD *)&v256 + 1) + 8 * i);
            if (v15 && (unint64_t)(v15->length - 1) <= 0x3FFE)
            {
              v103 = (__CFString *)-[NEIKEv2NotifyPayload copyError](v15);
              ne_log_obj();
              v104 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                v130 = (char *)objc_msgSend(a1, "copyShortDescription");
                *(_DWORD *)buf = 138412546;
                v261 = v130;
                v262 = 2112;
                v263 = (unint64_t)v103;
                _os_log_error_impl(&dword_19BD16000, v104, OS_LOG_TYPE_ERROR, "%@ Responder init received notify error %@", buf, 0x16u);

              }
              -[NEIKEv2IKESA setState:error:](v7, 3uLL, v103);

              goto LABEL_71;
            }
          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v256, v266, 16);
          if (v12)
            continue;
          break;
        }
      }

    }
    objc_getProperty(a1, v8, 32, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "value");

    if (v17)
    {
      objc_getProperty(a1, v18, 32, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2IKESA assignRemoteSPI:]((void *)v7, v19);

      objc_getProperty(a1, v20, 96, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21;
      if (v21)
        v21 = objc_getProperty(v21, v22, 24, 1);
      v10 = v21;

      if (v7)
        v25 = objc_getProperty((id)v7, v24, 80, 1);
      else
        v25 = 0;
      v26 = v25;
      objc_msgSend(v26, "proposals");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NSObject count](v10, "count"))
      {
        if (v7)
          v29 = objc_getProperty((id)v7, v28, 80, 1);
        else
          v29 = 0;
        v30 = v29;
        v31 = +[NEIKEv2IKESAProposal chooseSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:]((uint64_t)NEIKEv2IKESAProposal, v27, v10, objc_msgSend(v30, "preferInitiatorProposalOrder"));
        objc_setProperty_atomic((id)v7, v32, v31, 96);

        ne_log_obj();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v35 = (char *)objc_msgSend(a1, "copyShortDescription");
          if (v7)
            v36 = objc_getProperty((id)v7, v34, 96, 1);
          else
            v36 = 0;
          v37 = v36;
          *(_DWORD *)buf = 138412802;
          v261 = v35;
          v262 = 2112;
          v263 = (unint64_t)v37;
          v264 = 2112;
          v265 = (uint64_t)v10;
          _os_log_impl(&dword_19BD16000, v33, OS_LOG_TYPE_INFO, "%@ Choosing SA proposal %@ from %@", buf, 0x20u);

        }
        if (v7)
          v39 = objc_getProperty((id)v7, v38, 96, 1);
        else
          v39 = 0;
        v40 = v39;

        if (v40)
        {
          if (v7)
          {
            v42 = objc_getProperty((id)v7, v41, 96, 1);
            v44 = v42;
            if (v42)
              v42 = objc_getProperty(v42, v43, 120, 1);
          }
          else
          {
            v44 = 0;
            v42 = 0;
          }
          v45 = v42;

          if (v45 && (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x4036) & 1) == 0)
          {
            ne_log_obj();
            v235 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
            {
              v247 = (char *)objc_msgSend(a1, "copyShortDescription");
              if (v7)
                v248 = objc_getProperty((id)v7, v246, 96, 1);
              else
                v248 = 0;
              v249 = v248;
              *(_DWORD *)buf = 138412546;
              v261 = v247;
              v262 = 2112;
              v263 = (unint64_t)v249;
              _os_log_error_impl(&dword_19BD16000, v235, OS_LOG_TYPE_ERROR, "%@ Chosen proposal requires IKE_INTERMEDIATE but peer does not support it %@", buf, 0x16u);

            }
            if (v7)
              v237 = objc_getProperty((id)v7, v236, 96, 1);
            else
              v237 = 0;
            v127 = v237;
            ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Chosen proposal requires IKE_INTERMEDIATE but peer does not support it %@"), v238, v239, v240, v241, v242, v243, v244, (uint64_t)v127);
            -[NEIKEv2IKESA setState:error:](v7, 3uLL, ErrorPeerInvalidSyntax);

            goto LABEL_90;
          }
          objc_getProperty(a1, v46, 104, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            objc_getProperty(a1, v48, 104, 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v49;
            if (v49)
              v49 = objc_getProperty(v49, v50, 24, 1);
            v52 = v49;

            if (v52)
            {
              objc_getProperty(a1, v53, 104, 1);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = v54;
              if (v54)
                v54 = objc_getProperty(v54, v55, 32, 1);
              v57 = v54;

              if (v57)
              {
                objc_getProperty(a1, v58, 104, 1);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = v59;
                if (v59)
                  v59 = objc_getProperty(v59, v60, 24, 1);
                v62 = v59;
                v64 = objc_msgSend(v62, "method");
                v255 = v27;
                if (v7)
                  v65 = objc_getProperty((id)v7, v63, 96, 1);
                else
                  v65 = 0;
                v66 = v65;
                -[NEIKEv2IKESAProposal kemProtocol](v66, v67);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = objc_msgSend(v68, "method");

                if (v64 == v69)
                {
                  objc_getProperty(a1, v70, 104, 1);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v73 = v71;
                  v27 = v255;
                  if (v71)
                    v71 = objc_getProperty(v71, v72, 32, 1);
                  v75 = v71;
                  if (v7)
                    objc_setProperty_atomic((id)v7, v74, v75, 152);

                  objc_getProperty(a1, v76, 112, 1);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v77)
                  {
                    objc_getProperty(a1, v78, 112, 1);
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    v81 = v79;
                    if (v79)
                      v79 = objc_getProperty(v79, v80, 24, 1);
                    v82 = v79;

                    if (v82)
                    {
                      if (v7)
                        v84 = objc_getProperty((id)v7, v83, 80, 1);
                      else
                        v84 = 0;
                      v85 = v84;
                      v86 = objc_msgSend(v85, "strictNonceSizeChecks");

                      if (v86)
                      {
                        objc_getProperty(a1, v87, 112, 1);
                        v88 = (void *)objc_claimAutoreleasedReturnValue();
                        v90 = v88;
                        if (v88)
                          v88 = objc_getProperty(v88, v89, 24, 1);
                        v91 = v88;
                        v92 = objc_msgSend(v91, "length");

                        if (v92 - 257 <= 0xFFFFFFFFFFFFFF0ELL)
                        {
                          ne_log_obj();
                          v94 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                          {
                            v225 = (char *)objc_msgSend(a1, "copyShortDescription");
                            *(_DWORD *)buf = 138412546;
                            v261 = v225;
                            v262 = 2048;
                            v263 = v92;
                            _os_log_error_impl(&dword_19BD16000, v94, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is out of bounds", buf, 0x16u);

                          }
                          v102 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("NONCE data length %zu is out of bounds"), v95, v96, v97, v98, v99, v100, v101, v92);
                          goto LABEL_104;
                        }
                        if (v7)
                          v147 = objc_getProperty((id)v7, v93, 96, 1);
                        else
                          v147 = 0;
                        v148 = v147;
                        -[NEIKEv2IKESAProposal prfProtocol](v148, v149);
                        v150 = (void *)objc_claimAutoreleasedReturnValue();
                        v151 = objc_msgSend(v150, "nonceSize");

                        if (v92 < v151)
                        {
                          ne_log_obj();
                          v152 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
                          {
                            v230 = (char *)objc_msgSend(a1, "copyShortDescription");
                            if (v7)
                              v231 = objc_getProperty((id)v7, v229, 96, 1);
                            else
                              v231 = 0;
                            v232 = v231;
                            -[NEIKEv2IKESAProposal prfProtocol](v232, v233);
                            v234 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412802;
                            v261 = v230;
                            v262 = 2048;
                            v263 = v92;
                            v264 = 2112;
                            v265 = (uint64_t)v234;
                            _os_log_error_impl(&dword_19BD16000, v152, OS_LOG_TYPE_ERROR, "%@ NONCE data length %zu is shorter than the minimum for PRF protocol %@", buf, 0x20u);

                          }
                          if (v7)
                            v154 = objc_getProperty((id)v7, v153, 96, 1);
                          else
                            v154 = 0;
                          v144 = v154;
                          -[NEIKEv2IKESAProposal prfProtocol](v144, v155);
                          v251 = (void *)objc_claimAutoreleasedReturnValue();
                          v163 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("NONCE data length %zu is shorter than the minimum for PRF protocol %@"), v156, v157, v158, v159, v160, v161, v162, v92);
                          -[NEIKEv2IKESA setState:error:](v7, 3uLL, v163);

                          goto LABEL_105;
                        }
                      }
                      objc_getProperty(a1, v87, 112, 1);
                      v164 = (void *)objc_claimAutoreleasedReturnValue();
                      v166 = v164;
                      if (v164)
                        v164 = objc_getProperty(v164, v165, 24, 1);
                      v167 = v164;
                      objc_setProperty_atomic((id)v7, v168, v167, 136);

                      v169 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x402F);
                      v171 = v169;
                      if (v169)
                      {
                        v172 = objc_getProperty(v169, v170, 32, 1);
                        v173 = +[NEIKEv2Crypto copySignHashSetForData:]((uint64_t)NEIKEv2Crypto, v172);
                        objc_storeStrong((id *)(v7 + 112), v173);

                      }
                      v174 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4028);
                      v175 = (void *)-[NEIKEv2IKESA selectSecurePasswordMethod:]((void *)v7, v174);
                      objc_storeStrong((id *)(v7 + 104), v175);

                      if (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x402E)
                        && (*(_BYTE *)(v7 + 13) & 1) == 0)
                      {
                        *(_BYTE *)(v7 + 10) = 1;
                        ne_log_obj();
                        v176 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
                        {
                          v226 = (char *)objc_msgSend(a1, "copyShortDescription");
                          *(_DWORD *)buf = 138412290;
                          v261 = v226;
                          _os_log_debug_impl(&dword_19BD16000, v176, OS_LOG_TYPE_DEBUG, "%@ IKEv2 fragmentation supported", buf, 0xCu);

                        }
                      }
                      if (!-[NEIKEv2Packet hasNotification:](a1, (const char *)0x4033))
                      {
LABEL_130:
                        v184 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4004);
                        v185 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4005);
                        v187 = v185;
                        if (!v184 || !v185)
                          goto LABEL_154;
                        v252 = v171;
                        v254 = v174;
                        -[NEIKEv2IKESA initiatorSPI]((_BYTE *)v7, v186);
                        v188 = (void *)objc_claimAutoreleasedReturnValue();
                        v190 = objc_getProperty((id)v7, v189, 72, 1);
                        v191 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v188, 0, v190);

                        -[NEIKEv2IKESA initiatorSPI]((_BYTE *)v7, v192);
                        v193 = (void *)objc_claimAutoreleasedReturnValue();
                        v195 = objc_getProperty((id)v7, v194, 64, 1);
                        v196 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v193, 0, v195);

                        v198 = objc_getProperty(v184, v197, 32, 1);
                        v253 = v191;
                        LOBYTE(v195) = objc_msgSend(v191, "isEqualToData:", v198);

                        if ((v195 & 1) == 0)
                        {
                          *(_BYTE *)(v7 + 15) = 1;
                          ne_log_obj();
                          v200 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v200, OS_LOG_TYPE_DEBUG))
                          {
                            v227 = (char *)objc_msgSend(a1, "copyShortDescription");
                            *(_DWORD *)buf = 138412290;
                            v261 = v227;
                            _os_log_debug_impl(&dword_19BD16000, v200, OS_LOG_TYPE_DEBUG, "%@ Detected incoming NAT", buf, 0xCu);

                          }
                        }
                        v201 = objc_getProperty(v187, v199, 32, 1);
                        v202 = objc_msgSend(v196, "isEqualToData:", v201);

                        v171 = v252;
                        if ((v202 & 1) == 0)
                        {
                          *(_BYTE *)(v7 + 14) = 1;
                          ne_log_obj();
                          v204 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v204, OS_LOG_TYPE_DEBUG))
                          {
                            v228 = (char *)objc_msgSend(a1, "copyShortDescription");
                            *(_DWORD *)buf = 138412290;
                            v261 = v228;
                            _os_log_debug_impl(&dword_19BD16000, v204, OS_LOG_TYPE_DEBUG, "%@ Detected outgoing NAT", buf, 0xCu);

                          }
                        }
                        v205 = objc_getProperty((id)v7, v203, 80, 1);
                        if (objc_msgSend(v205, "disableSwitchToNATTPorts"))
                        {

                        }
                        else
                        {
                          v207 = objc_getProperty((id)v7, v206, 88, 1);
                          if ((objc_msgSend(v207, "negotiateMOBIKE") & 1) != 0 || (*(_BYTE *)(v7 + 15) & 1) != 0)
                          {

                          }
                          else
                          {
                            v208 = *(_BYTE *)(v7 + 14);

                            if ((v208 & 1) == 0)
                              goto LABEL_153;
                          }
                          -[NEIKEv2IKESA switchToNATTraversalPorts](v7, v209);
                        }
LABEL_153:

                        v174 = v254;
                        v27 = v255;
LABEL_154:

                        v113 = 1;
                        goto LABEL_92;
                      }
                      v178 = objc_getProperty((id)v7, v177, 80, 1);
                      v179 = objc_msgSend(v178, "requestPPK");

                      if ((v179 & 1) != 0)
                      {
                        *(_BYTE *)(v7 + 24) = 1;
                        ne_log_obj();
                        v180 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
                        {
                          v181 = (char *)objc_msgSend(a1, "copyShortDescription");
                          *(_DWORD *)buf = 138412290;
                          v261 = v181;
                          v182 = "%@ PPK use requested";
LABEL_128:
                          _os_log_impl(&dword_19BD16000, v180, OS_LOG_TYPE_INFO, v182, buf, 0xCu);

                        }
                      }
                      else
                      {
                        ne_log_obj();
                        v180 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
                        {
                          v181 = (char *)objc_msgSend(a1, "copyShortDescription");
                          *(_DWORD *)buf = 138412290;
                          v261 = v181;
                          v182 = "%@ PPK use requested but PPK use is not configured";
                          goto LABEL_128;
                        }
                      }

                      goto LABEL_130;
                    }
                    ne_log_obj();
                    v143 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
                    {
                      v224 = (char *)objc_msgSend(a1, "copyShortDescription");
                      *(_DWORD *)buf = 138412290;
                      v261 = v224;
                      _os_log_error_impl(&dword_19BD16000, v143, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE data", buf, 0xCu);

                    }
                    v141 = CFSTR("Did not receive NONCE data");
                  }
                  else
                  {
                    ne_log_obj();
                    v133 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                    {
                      v223 = (char *)objc_msgSend(a1, "copyShortDescription");
                      *(_DWORD *)buf = 138412290;
                      v261 = v223;
                      _os_log_error_impl(&dword_19BD16000, v133, OS_LOG_TYPE_ERROR, "%@ Did not receive NONCE payload", buf, 0xCu);

                    }
                    v141 = CFSTR("Did not receive NONCE payload");
                  }
                  v102 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v141, v134, v135, v136, v137, v138, v139, v140, v250);
LABEL_104:
                  v144 = v102;
                  -[NEIKEv2IKESA setState:error:](v7, 3uLL, v102);
LABEL_105:

                  goto LABEL_91;
                }
                ne_log_obj();
                v129 = objc_claimAutoreleasedReturnValue();
                v27 = v255;
                if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
                {
                  v210 = (char *)objc_msgSend(a1, "copyShortDescription");
                  objc_getProperty(a1, v211, 104, 1);
                  v212 = (void *)objc_claimAutoreleasedReturnValue();
                  v214 = v212;
                  if (v212)
                    v212 = objc_getProperty(v212, v213, 24, 1);
                  v215 = v212;
                  v217 = objc_msgSend(v215, "method");
                  if (v7)
                    v218 = objc_getProperty((id)v7, v216, 96, 1);
                  else
                    v218 = 0;
                  v219 = v218;
                  -[NEIKEv2IKESAProposal kemProtocol](v219, v220);
                  v221 = (void *)objc_claimAutoreleasedReturnValue();
                  v222 = objc_msgSend(v221, "method");
                  *(_DWORD *)buf = 138412802;
                  v261 = v210;
                  v262 = 2048;
                  v263 = v217;
                  v264 = 2048;
                  v265 = v222;
                  _os_log_error_impl(&dword_19BD16000, v129, OS_LOG_TYPE_ERROR, "%@ Received KE method %zu does not match KE method %zu in SA proposal", buf, 0x20u);

                  v27 = v255;
                }

                if (a3)
                {
                  v113 = 0;
                  *a3 = 17;
                  goto LABEL_92;
                }
LABEL_91:
                v113 = 0;
LABEL_92:

                goto LABEL_93;
              }
              ne_log_obj();
              v126 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
              {
                v183 = (char *)objc_msgSend(a1, "copyShortDescription");
                *(_DWORD *)buf = 138412290;
                v261 = v183;
                _os_log_error_impl(&dword_19BD16000, v126, OS_LOG_TYPE_ERROR, "%@ Did not receive data in KE payload", buf, 0xCu);

              }
              v122 = CFSTR("Did not receive data in KE payload");
            }
            else
            {
              ne_log_obj();
              v125 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
              {
                v146 = (char *)objc_msgSend(a1, "copyShortDescription");
                *(_DWORD *)buf = 138412290;
                v261 = v146;
                _os_log_error_impl(&dword_19BD16000, v125, OS_LOG_TYPE_ERROR, "%@ Did not receive method in KE payload", buf, 0xCu);

              }
              v122 = CFSTR("Did not receive method in KE payload");
            }
          }
          else
          {
            ne_log_obj();
            v124 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
            {
              v145 = (char *)objc_msgSend(a1, "copyShortDescription");
              *(_DWORD *)buf = 138412290;
              v261 = v145;
              _os_log_error_impl(&dword_19BD16000, v124, OS_LOG_TYPE_ERROR, "%@ Did not receive KE payload", buf, 0xCu);

            }
            v122 = CFSTR("Did not receive KE payload");
          }
        }
        else
        {
          ne_log_obj();
          v123 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
          {
            v142 = (char *)objc_msgSend(a1, "copyShortDescription");
            *(_DWORD *)buf = 138412290;
            v261 = v142;
            _os_log_error_impl(&dword_19BD16000, v123, OS_LOG_TYPE_ERROR, "%@ No matching proposal found", buf, 0xCu);

          }
          if (a3)
            *a3 = 14;
          v122 = CFSTR("No matching proposal found");
        }
      }
      else
      {
        ne_log_obj();
        v114 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        {
          v132 = (char *)objc_msgSend(a1, "copyShortDescription");
          *(_DWORD *)buf = 138412290;
          v261 = v132;
          _os_log_error_impl(&dword_19BD16000, v114, OS_LOG_TYPE_ERROR, "%@ Received no SA proposals", buf, 0xCu);

        }
        v122 = CFSTR("Received no SA proposals");
      }
      v127 = (id)NEIKEv2CreateErrorPeerInvalidSyntax(v122, v115, v116, v117, v118, v119, v120, v121, v250);
      -[NEIKEv2IKESA setState:error:](v7, 3uLL, v127);
LABEL_90:

      goto LABEL_91;
    }
    ne_log_obj();
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      v131 = (char *)objc_msgSend(a1, "copyShortDescription");
      *(_DWORD *)buf = 138412290;
      v261 = v131;
      _os_log_error_impl(&dword_19BD16000, v105, OS_LOG_TYPE_ERROR, "%@ Received no remote SPI on SA_INIT", buf, 0xCu);

    }
    v10 = NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Received no remote SPI on SA_INIT"), v106, v107, v108, v109, v110, v111, v112, v250);
    -[NEIKEv2IKESA setState:error:](v7, 3uLL, v10);
  }
LABEL_71:
  v113 = 0;
LABEL_93:

  return v113;
}

- (void)gatherPayloads
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  SEL v8;
  SEL v9;
  SEL v10;
  id newValue;

  newValue = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self)
  {
    if (objc_getProperty(self, v3, 88, 1))
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v4, 88, 1));
    if (objc_getProperty(self, v4, 96, 1))
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v5, 96, 1));
    if (objc_getProperty(self, v5, 104, 1))
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v6, 104, 1));
    if (objc_getProperty(self, v6, 112, 1))
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v7, 112, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v7, 120, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v8, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v9, 56, 1));
    objc_setProperty_atomic(self, v10, newValue, 80);
  }
  else
  {
    objc_msgSend(newValue, "addObjectsFromArray:", 0);
    objc_msgSend(newValue, "addObjectsFromArray:", 0);
    objc_msgSend(newValue, "addObjectsFromArray:", 0);
  }

}

- (void)filloutPayloads
{
  NEIKEv2IKESAInitPacket *v2;
  NEIKEv2IKESAInitPacket *v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  ptrdiff_t v12;
  int *v13;
  int *v14;
  const char *v15;
  _QWORD *v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  ptrdiff_t v27;
  NEIKEv2IKESAInitPacket *v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  _BYTE v38[128];
  uint64_t v39;

  v2 = self;
  v39 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  if (self)
    self = (NEIKEv2IKESAInitPacket *)objc_getProperty(self, a2, 80, 1);
  v3 = self;
  v4 = -[NEIKEv2IKESAInitPacket countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
    v7 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
    v8 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_18;
          v12 = v6[270];
LABEL_17:
          objc_setProperty_atomic(v2, v11, v10, v12);
          goto LABEL_18;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_18;
          v12 = v7[271];
          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_18;
          v12 = 112;
          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v2 && objc_getProperty(v2, v20, 120, 1))
            {
              objc_msgSend(objc_getProperty(v2, v21, 120, 1), "arrayByAddingObject:", v10);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_40;
            }
            v36 = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1, (_QWORD)v31);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2)
            {
LABEL_40:
              v27 = 120;
              v28 = v2;
              v29 = v23;
              goto LABEL_43;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_18;
            if (v2 && objc_getProperty(v2, v24, 56, 1))
            {
              objc_msgSend(objc_getProperty(v2, v25, 56, 1), "arrayByAddingObject:", v10);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v35 = v10;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1, (_QWORD)v31);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v2)
                goto LABEL_44;
            }
            v28 = v2;
            v29 = v23;
            v27 = 56;
LABEL_43:
            objc_setProperty_atomic(v28, v22, v29, v27);
          }
LABEL_44:

          goto LABEL_18;
        }
        v13 = v6;
        v14 = v7;
        v16 = v10;
        if (v2 && objc_getProperty(v2, v15, 64, 1))
        {
          objc_msgSend(objc_getProperty(v2, v17, 64, 1), "arrayByAddingObject:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v37 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1, (_QWORD)v31);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v2)
            goto LABEL_34;
        }
        objc_setProperty_atomic(v2, v18, v19, 64);
LABEL_34:

        if (v16 && v2 && v16[3] == 16390)
          objc_setProperty_atomic(v2, v26, v16, 88);

        v7 = v14;
        v6 = v13;
LABEL_18:
        ++v9;
      }
      while (v5 != v9);
      v30 = -[NEIKEv2IKESAInitPacket countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      v5 = v30;
    }
    while (v30);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIDs, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_ke, 0);
  objc_storeStrong((id *)&self->_sa, 0);
  objc_storeStrong((id *)&self->_cookie, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("IKE_SA_INIT");
}

+ (unint64_t)exchangeType
{
  return 34;
}

+ (BOOL)encryptPayloads
{
  return 0;
}

@end
