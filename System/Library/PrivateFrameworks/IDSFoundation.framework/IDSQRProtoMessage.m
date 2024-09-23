@implementation IDSQRProtoMessage

- (IDSQRProtoMessage)initWithType:(int)a3 candidatePair:(id)a4 options:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  IDSQRProtoMessage *v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  IDSQRProtoH3Message *v17;
  IDSQRProtoH3Message *message;
  const char *v19;
  double v20;
  IDSQRProtoSessionInfoRequest *v21;
  const char *v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  char updated;
  NSObject *v31;
  IDSQRProtoAllocBindRequest *v32;
  const char *v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  IDSQRProtoStatsRequest *v41;
  const char *v42;
  double v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  const char *v48;
  double v49;
  IDSQRProtoTestRequest *v50;
  const char *v51;
  double v52;
  const char *v53;
  uint64_t v54;
  double v55;
  void *v56;
  const char *v57;
  double v58;
  IDSQRProtoUnAllocBindRequest *v59;
  const char *v60;
  double v61;
  const char *v62;
  uint64_t v63;
  double v64;
  void *v65;
  const char *v66;
  double v67;
  IDSQRProtoPutMaterialRequest *v68;
  const char *v69;
  double v70;
  const char *v71;
  uint64_t v72;
  double v73;
  void *v74;
  const char *v75;
  double v76;
  const char *v77;
  void *v78;
  double v79;
  IDSQRProtoH3EndToEndChannelRegisterRequest *v80;
  const char *v81;
  double v82;
  const char *v83;
  uint64_t v84;
  double v85;
  void *v86;
  const char *v87;
  double v88;
  IDSQRProtoH3EndToEndChannelRegisterAckRequest *v89;
  const char *v90;
  double v91;
  const char *v92;
  uint64_t v93;
  double v94;
  void *v95;
  const char *v96;
  double v97;
  IDSQRProtoInfoRequest *v98;
  const char *v99;
  double v100;
  const char *v101;
  uint64_t v102;
  double v103;
  void *v104;
  const char *v105;
  double v106;
  IDSQRProtoParticipantUpdateRequest *v107;
  const char *v108;
  double v109;
  const char *v110;
  uint64_t v111;
  double v112;
  void *v113;
  const char *v114;
  double v115;
  IDSQRProtoPluginControlRequest *v116;
  const char *v117;
  double v118;
  const char *v119;
  uint64_t v120;
  double v121;
  void *v122;
  const char *v123;
  double v124;
  NSObject *v125;
  const char *v126;
  double v127;
  void *v128;
  NSObject *v129;
  const char *v130;
  double v131;
  void *v132;
  const char *v133;
  double v134;
  void *v135;
  IDSQRProtoH3Message *v136;
  const char *v137;
  uint64_t v138;
  double v139;
  void *v140;
  const char *v141;
  double v142;
  void *v143;
  void *v144;
  IDSQRProtoMessage *v145;
  void *v146;
  id v147;
  id v148;
  void *v150;
  IDSQRProtoH3Message *v151;
  void *v152;
  void *v153;
  objc_super v154;
  uint8_t buf[4];
  void *v156;
  __int16 v157;
  IDSQRProtoH3Message *v158;
  uint64_t v159;

  v6 = *(_QWORD *)&a3;
  v159 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v154.receiver = self;
  v154.super_class = (Class)IDSQRProtoMessage;
  v12 = -[IDSQRProtoMessage init](&v154, sel_init);
  if (v12)
  {
    if (objc_msgSend_isRelayStunCandidatePair(v8, v10, v11, v13)
      && (objc_msgSend_isValidRelayStunCandidatePair(v8, v14, v15, v16) & 1) != 0)
    {
      v12->_startTime = ids_monotonic_time();
      v17 = objc_alloc_init(IDSQRProtoH3Message);
      message = v12->_message;
      v12->_message = v17;

      switch((int)v6)
      {
        case 15:
          v21 = objc_alloc_init(IDSQRProtoSessionInfoRequest);
          objc_msgSend_setSessioninfoRequest_(v12->_message, v22, (uint64_t)v21, v23);

          objc_msgSend_sessioninfoRequest(v12->_message, v24, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          updated = objc_msgSend__setupSessionInfoRequest_candidatePair_options_(v12, v28, (uint64_t)v27, v29, v8, v9);

          goto LABEL_25;
        case 16:
        case 17:
        case 19:
        case 21:
        case 23:
        case 25:
        case 26:
        case 28:
        case 30:
        case 31:
          goto LABEL_29;
        case 18:
          v41 = objc_alloc_init(IDSQRProtoStatsRequest);
          objc_msgSend_setStatsRequest_(v12->_message, v42, (uint64_t)v41, v43);

          objc_msgSend_statsRequest(v12->_message, v44, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          updated = objc_msgSend__setupStatsRequest_candidatePair_options_(v12, v48, (uint64_t)v47, v49, v8, v9);

          goto LABEL_25;
        case 20:
          v50 = objc_alloc_init(IDSQRProtoTestRequest);
          objc_msgSend_setTestRequest_(v12->_message, v51, (uint64_t)v50, v52);

          objc_msgSend_testRequest(v12->_message, v53, v54, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          updated = objc_msgSend__setupTestRequest_candidatePair_options_(v12, v57, (uint64_t)v56, v58, v8, v9);

          goto LABEL_25;
        case 22:
          v59 = objc_alloc_init(IDSQRProtoUnAllocBindRequest);
          objc_msgSend_setUnallocbindRequest_(v12->_message, v60, (uint64_t)v59, v61);

          objc_msgSend_unallocbindRequest(v12->_message, v62, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          updated = objc_msgSend__setupUnallocbindRequest_candidatePair_options_(v12, v66, (uint64_t)v65, v67, v8, v9);

          goto LABEL_25;
        case 24:
          v68 = objc_alloc_init(IDSQRProtoPutMaterialRequest);
          objc_msgSend_setPutmaterialRequest_(v12->_message, v69, (uint64_t)v68, v70);

          objc_msgSend_putmaterialRequest(v12->_message, v71, v72, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          updated = objc_msgSend__setupPutmaterialRequest_candidatePair_options_(v12, v75, (uint64_t)v74, v76, v8, v9);

          goto LABEL_25;
        case 27:
          objc_msgSend_objectForKeyedSubscript_(v9, v19, (uint64_t)CFSTR("gl-option-materials-request-key"), v20);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v78)
            goto LABEL_29;
          objc_msgSend_setGetmaterialRequest_(v12->_message, v77, (uint64_t)v78, v79);

          goto LABEL_26;
        case 29:
          v80 = objc_alloc_init(IDSQRProtoH3EndToEndChannelRegisterRequest);
          objc_msgSend_setRegisterRequest_(v12->_message, v81, (uint64_t)v80, v82);

          objc_msgSend_registerRequest(v12->_message, v83, v84, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          updated = objc_msgSend__setupRegisterRequest_candidatePair_options_(v12, v87, (uint64_t)v86, v88, v8, v9);

          goto LABEL_25;
        case 32:
          v89 = objc_alloc_init(IDSQRProtoH3EndToEndChannelRegisterAckRequest);
          objc_msgSend_setRegisterAckRequest_(v12->_message, v90, (uint64_t)v89, v91);

          objc_msgSend_registerAckRequest(v12->_message, v92, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          updated = objc_msgSend__setupRegisterAckRequest_candidatePair_options_(v12, v96, (uint64_t)v95, v97, v8, v9);

LABEL_25:
          if ((updated & 1) != 0)
          {
LABEL_26:
            OSLogHandleForTransportCategory();
            v125 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
            {
              if ((v6 - 1) >= 0x20)
              {
                objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v126, (uint64_t)CFSTR("(unknown: %i)"), v127, v6);
                v128 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v128 = *(&off_1E3C21080 + (int)v6 - 1);
              }
              v136 = v12->_message;
              *(_DWORD *)buf = 138412546;
              v156 = v128;
              v157 = 2112;
              v158 = v136;
              _os_log_impl(&dword_19B949000, v125, OS_LOG_TYPE_DEFAULT, "created %@ proto message %@", buf, 0x16u);

            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
            {
              if ((v6 - 1) >= 0x20)
              {
                objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v137, (uint64_t)CFSTR("(unknown: %i)"), v139, v6);
                v140 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v140 = *(&off_1E3C21080 + (int)v6 - 1);
              }
              v150 = v140;
              v151 = v12->_message;
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("created %@ proto message %@"));

              if (_IDSShouldLog())
              {
                if (v6 >= 0x25)
                {
                  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v137, (uint64_t)CFSTR("(unknown: %i)"), v139, v6, v151);
                  v144 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v144 = *(&off_1E3C21180 + (int)v6);
                }
                v150 = v144;
                v151 = v12->_message;
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("created %@ proto message %@"));

              }
            }
            if (v6 >= 0x25)
            {
              objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v137, (uint64_t)CFSTR("(unknown: %i)"), v139, v6);
              v146 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v146 = *(&off_1E3C21180 + (int)v6);
            }
            objc_msgSend_description(v12->_message, v137, v138, v139, v150, v151);
            v152 = v146;
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = v153;
            v148 = v146;
            cut_dispatch_log_queue();

            goto LABEL_61;
          }
LABEL_29:
          OSLogHandleForTransportCategory();
          v129 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
          {
            if (v6 >= 0x25)
            {
              objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v130, (uint64_t)CFSTR("(unknown: %i)"), v131, v6);
              v132 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v132 = *(&off_1E3C21180 + (int)v6);
            }
            *(_DWORD *)buf = 138412290;
            v156 = v132;
            _os_log_impl(&dword_19B949000, v129, OS_LOG_TYPE_DEFAULT, "failed to create %@ message", buf, 0xCu);

          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
          {
            if (v6 >= 0x25)
            {
              objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v133, (uint64_t)CFSTR("(unknown: %i)"), v134, v6);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v135 = *(&off_1E3C21180 + (int)v6);
            }
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create %@ message"));

            if (_IDSShouldLog())
            {
              if (v6 >= 0x25)
              {
                objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v141, (uint64_t)CFSTR("(unknown: %i)"), v142, v6);
                v143 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v143 = *(&off_1E3C21180 + (int)v6);
              }
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create %@ message"));

            }
          }
          break;
        default:
          switch((int)v6)
          {
            case 1:
              v32 = objc_alloc_init(IDSQRProtoAllocBindRequest);
              objc_msgSend_setAllocbindRequest_(v12->_message, v33, (uint64_t)v32, v34);

              objc_msgSend_allocbindRequest(v12->_message, v35, v36, v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              updated = objc_msgSend__setupAllocbindRequest_candidatePair_options_(v12, v39, (uint64_t)v38, v40, v8, v9);

              goto LABEL_25;
            case 5:
              v98 = objc_alloc_init(IDSQRProtoInfoRequest);
              objc_msgSend_setInfoRequest_(v12->_message, v99, (uint64_t)v98, v100);

              objc_msgSend_infoRequest(v12->_message, v101, v102, v103);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              updated = objc_msgSend__setupInfoRequest_candidatePair_options_(v12, v105, (uint64_t)v104, v106, v8, v9);

              goto LABEL_25;
            case 7:
              v107 = objc_alloc_init(IDSQRProtoParticipantUpdateRequest);
              objc_msgSend_setParticipantupdateRequest_(v12->_message, v108, (uint64_t)v107, v109);

              objc_msgSend_participantupdateRequest(v12->_message, v110, v111, v112);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              updated = objc_msgSend__setupParticipantUpdateRequest_candidatePair_options_(v12, v114, (uint64_t)v113, v115, v8, v9);

              goto LABEL_25;
            case 10:
              v116 = objc_alloc_init(IDSQRProtoPluginControlRequest);
              objc_msgSend_setPlugincontrolRequest_(v12->_message, v117, (uint64_t)v116, v118);

              objc_msgSend_plugincontrolRequest(v12->_message, v119, v120, v121);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              updated = objc_msgSend__setupPluginControlRequest_candidatePair_options_(v12, v123, (uint64_t)v122, v124, v8, v9);

              goto LABEL_25;
            default:
              goto LABEL_29;
          }
      }
    }
    else
    {
      OSLogHandleForTransportCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_DEFAULT, "failed to create QRProtoMessage due to invalid relay candidate pair.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to create QRProtoMessage due to invalid relay candidate pair."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to create QRProtoMessage due to invalid relay candidate pair."));
        }
      }
    }
    v145 = 0;
  }
  else
  {
LABEL_61:
    v145 = v12;
  }

  return v145;
}

- (BOOL)_setupAllocbindRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  id v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
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
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  const char *v45;
  uint64_t v46;
  double v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  const char *v52;
  double v53;
  const char *v54;
  uint64_t v55;
  double v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  void *Value;
  const char *v62;
  uint64_t v63;
  int v64;
  double v65;
  void *v66;
  unint64_t v67;
  int v68;
  const char *v69;
  uint64_t v70;
  double v71;
  const char *v72;
  uint64_t v73;
  int isSharedQRSession;
  double v75;
  void *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  int v80;
  double v81;
  void *v82;
  const char *v83;
  double v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  double v88;
  uint64_t v89;
  const char *v90;
  double v91;
  NSObject *v92;
  const char *v93;
  uint64_t v94;
  double v95;
  const char *v96;
  uint64_t v97;
  double v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  double v102;
  void *v103;
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
  void *v115;
  const char *v116;
  uint64_t v117;
  double v118;
  void *v119;
  char v120;
  const char *v121;
  uint64_t v122;
  double v123;
  const char *v124;
  uint64_t v125;
  double v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  double v130;
  unsigned int isCellularStunCandidate;
  uint64_t v132;
  double v133;
  const char *v134;
  _BOOL4 v135;
  void *v136;
  NSObject *v137;
  int v138;
  const char *v139;
  uint64_t v140;
  double v141;
  void *v142;
  const char *v143;
  double v144;
  void *v145;
  NSObject *v146;
  const __CFString *v147;
  const __CFString *v148;
  const char *v149;
  uint64_t v150;
  double v151;
  __CFString *v152;
  __CFString *v153;
  uint64_t v154;
  NSObject *v155;
  NSObject *v156;
  IDSQRProtoQuicConnectionInfo *v157;
  const char *v158;
  double v159;
  const char *v160;
  double v161;
  const char *v162;
  double v163;
  IDSQRProtoQuicConnectionInfo *v164;
  const char *v165;
  double v166;
  const char *v167;
  double v168;
  const char *v169;
  double v170;
  uint64_t v171;
  double v172;
  const char *v173;
  _BOOL4 v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  double v178;
  void *v179;
  uint64_t v180;
  IDSQRProtoExperimentOverride *v181;
  const char *v182;
  double v183;
  const char *v184;
  double v185;
  const char *v186;
  double v187;
  const __CFString *v188;
  uint64_t v189;
  double v190;
  IDSQRProtoAllocBindTestOption *v191;
  const char *v192;
  double v193;
  const char *v194;
  double v195;
  void *v196;
  void *v197;
  void *v198;
  const char *v199;
  double v200;
  id v201;
  const char *v202;
  double v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  IDSQRProtoSessionExperiment *v211;
  const char *v212;
  double v213;
  id v214;
  char isKindOfClass;
  const char *v216;
  id v217;
  double v218;
  NSObject *v219;
  const char *v220;
  uint64_t v221;
  double v222;
  void *v223;
  const char *v224;
  double v225;
  CFTypeID v226;
  const char *v227;
  uint64_t v228;
  double v229;
  uint64_t v230;
  const char *v231;
  double v232;
  const __CFNumber *v233;
  _BOOL4 v234;
  const char *v235;
  uint64_t v236;
  double v237;
  uint64_t v238;
  const char *v239;
  double v240;
  NSObject *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  double v250;
  void *v251;
  const char *v252;
  double v253;
  const char *v254;
  uint64_t v255;
  double v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  double v260;
  void *v261;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  unint64_t v275;
  id v276;
  void *v277;
  id v278;
  const __CFDictionary *theDict;
  id v280;
  id v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  uint8_t v286[128];
  uint8_t buf[4];
  uint64_t v288;
  __int16 v289;
  void *v290;
  uint64_t v291;

  v291 = *MEMORY[0x1E0C80C00];
  v280 = a3;
  v278 = a4;
  theDict = (const __CFDictionary *)a5;
  objc_msgSend_softwareData(v278, v7, v8, v9);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v275 = objc_msgSend_length(v277, v10, v11, v12);
  if (v275 <= 2)
  {
    OSLogHandleForTransportCategory();
    v137 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v288 = (uint64_t)v277;
      _os_log_impl(&dword_19B949000, v137, OS_LOG_TYPE_DEFAULT, "invalid software data %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid software data %@"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("invalid software data %@"));
      }
    }
  }
  else
  {
    v13 = objc_retainAutorelease(v277);
    v17 = objc_msgSend_bytes(v13, v14, v15, v16);
    objc_msgSend_setServiceId_(v280, v18, __rev16(*(unsigned __int16 *)(v17 + 1)), v19);
    objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_productName(v23, v24, v25, v26);
    v274 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_productVersion(v30, v31, v32, v33);
    v273 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_productBuildVersion(v37, v38, v39, v40);
    v272 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v41, (uint64_t)CFSTR("%@,%@,%@"), v42, v274, v273, v272);
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClientOsVersion_(v280, v43, (uint64_t)v271, v44);
    objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_model(v48, v49, v50, v51);
    v270 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setClientHwVersion_(v280, v52, (uint64_t)v270, v53);
    v59 = objc_msgSend_capabilityFlags(v278, v54, v55, v56);
    Value = 0;
    if (theDict)
    {
      v57 = CFSTR("gl-option-is-lightweight-participant-key");
      if (CFSTR("gl-option-is-lightweight-participant-key"))
        Value = (void *)CFDictionaryGetValue(theDict, CFSTR("gl-option-is-lightweight-participant-key"));
    }
    v64 = objc_msgSend_BOOLValue(Value, v57, v58, v60);
    v66 = 0;
    if (v64)
      v67 = v59 & 0xFFFFFFFFFFDF7FFFLL | 0x8000;
    else
      v67 = v59;
    if (theDict)
    {
      v62 = CFSTR("gl-option-is-facetime-session");
      if (CFSTR("gl-option-is-facetime-session"))
        v66 = (void *)CFDictionaryGetValue(theDict, CFSTR("gl-option-is-facetime-session"));
    }
    v68 = objc_msgSend_BOOLValue(v66, v62, v63, v65);
    isSharedQRSession = objc_msgSend_isSharedQRSession(v278, v69, v70, v71);
    v76 = 0;
    if ((isSharedQRSession & v68) != 0)
      v77 = v67 | 0x90000;
    else
      v77 = v67;
    if (theDict)
    {
      v72 = CFSTR("gl-option-uplink-nack-disabled");
      if (CFSTR("gl-option-uplink-nack-disabled"))
        v76 = (void *)CFDictionaryGetValue(theDict, CFSTR("gl-option-uplink-nack-disabled"));
    }
    v80 = objc_msgSend_BOOLValue(v76, v72, v73, v75);
    v82 = 0;
    if (v80)
      v77 &= ~0x80000uLL;
    if (theDict)
    {
      v78 = CFSTR("gs-shortmki-enabled-key");
      if (CFSTR("gs-shortmki-enabled-key"))
        v82 = (void *)CFDictionaryGetValue(theDict, CFSTR("gs-shortmki-enabled-key"));
    }
    if (objc_msgSend_BOOLValue(v82, v78, v79, v81))
      v77 |= 0x800000uLL;
    objc_msgSend_setCapabilities_(v280, v83, v77, v84);
    OSLogHandleForTransportCategory();
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v288 = v77;
      _os_log_impl(&dword_19B949000, v85, OS_LOG_TYPE_DEFAULT, "_setupAllocbindRequest: final capabilityFlags: %llx", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v263 = v77;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_setupAllocbindRequest: final capabilityFlags: %llx"));
        if (_IDSShouldLog())
        {
          v263 = v77;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_setupAllocbindRequest: final capabilityFlags: %llx"));
        }
      }
    }
    v89 = objc_msgSend_stateFlags(v278, v86, v87, v88, v263);
    objc_msgSend_setStateFlags_(v280, v90, v89, v91);
    OSLogHandleForTransportCategory();
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v288) = v89;
      _os_log_impl(&dword_19B949000, v92, OS_LOG_TYPE_DEFAULT, "_setupAllocbindRequest: final stateFlags: %x", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v264 = v89;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_setupAllocbindRequest: final stateFlags: %x"));
        if (_IDSShouldLog())
        {
          v264 = v89;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_setupAllocbindRequest: final stateFlags: %x"));
        }
      }
    }
    if (objc_msgSend_isSharedQRSession(v278, v93, v94, v95, v264))
    {
      objc_msgSend_relaySessionInfo(v278, v96, v97, v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publishedStreams(v99, v100, v101, v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_relaySessionInfo(v278, v104, v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_subscribedStreams(v107, v108, v109, v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_relaySessionInfo(v278, v112, v113, v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v107) = objc_msgSend_maxConcurrentStreams(v115, v116, v117, v118);

      sub_19BA6E2EC(v280, v103, v111, v107);
    }
    v119 = 0;
    if (theDict)
    {
      v96 = CFSTR("gl-option-additional-binding");
      if (CFSTR("gl-option-additional-binding"))
        v119 = (void *)CFDictionaryGetValue(theDict, CFSTR("gl-option-additional-binding"));
    }
    v120 = objc_msgSend_unsignedIntValue(v119, v96, v97, v98);
    if ((objc_msgSend_isSelfQRSession(v278, v121, v122, v123) & 1) == 0)
    {
      objc_msgSend_local(v278, v124, v125, v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      isCellularStunCandidate = objc_msgSend_isCellularStunCandidate(v127, v128, v129, v130);

      v134 = CFSTR("gl-option-should-auto-disconnect-for-standard-participant");
      if (CFSTR("gl-option-should-auto-disconnect-for-standard-participant"))
        v135 = theDict != 0;
      else
        v135 = 0;
      if (v135)
        v136 = (void *)CFDictionaryGetValue(theDict, CFSTR("gl-option-should-auto-disconnect-for-standard-participant"));
      else
        v136 = 0;
      v138 = objc_msgSend_BOOLValue(v136, v134, v132, v133);
      objc_msgSend_sharedInstance(IDSServerBag, v139, v140, v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v142, v143, (uint64_t)CFSTR("ids-disallow-qr-auto-disconnect"), v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();

      OSLogHandleForTransportCategory();
      v146 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
      {
        v147 = CFSTR("NO");
        if (v138)
          v148 = CFSTR("YES");
        else
          v148 = CFSTR("NO");
        if (v64)
          v147 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v288 = (uint64_t)v148;
        v289 = 2112;
        v290 = (void *)v147;
        _os_log_impl(&dword_19B949000, v146, OS_LOG_TYPE_DEFAULT, "_setupAllocbindRequest: auto disconnect supported: %@, isLightweightParticipant: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        v152 = v138 ? CFSTR("YES") : CFSTR("NO");
        v153 = v64 ? CFSTR("YES") : CFSTR("NO");
        v265 = (uint64_t)v152;
        v267 = v153;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_setupAllocbindRequest: auto disconnect supported: %@, isLightweightParticipant: %@"));
        if (_IDSShouldLog())
        {
          v265 = (uint64_t)v152;
          v267 = v153;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_setupAllocbindRequest: auto disconnect supported: %@, isLightweightParticipant: %@"));
        }
      }
      v154 = v120 & 0x30 | isCellularStunCandidate;
      if (v138)
      {
        if (objc_msgSend_BOOLValue(v145, v149, v150, v151))
        {
          OSLogHandleForTransportCategory();
          v155 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B949000, v155, OS_LOG_TYPE_DEFAULT, "disallowQRAutoDisconnectBagValue set to YES, don't set the channel binding bit", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("disallowQRAutoDisconnectBagValue set to YES, don't set the channel binding bit"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("disallowQRAutoDisconnectBagValue set to YES, don't set the channel binding bit"));
            }
          }
        }
        else
        {
          v154 = v154 | 0x200;
        }
      }
      objc_msgSend_setChannelBindingInfo_(v280, v149, v154, v151, v265, v267);
      OSLogHandleForTransportCategory();
      v156 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v288) = v154;
        _os_log_impl(&dword_19B949000, v156, OS_LOG_TYPE_DEFAULT, "channelBindingInfo: %u", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v265 = v154;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("channelBindingInfo: %u"));
          if (_IDSShouldLog())
          {
            v265 = v154;
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("channelBindingInfo: %u"));
          }
        }
      }

    }
    v269 = 0;
    if (theDict && CFSTR("gl-option-qr-connection-id-avc-key"))
    {
      v269 = (id)CFDictionaryGetValue(theDict, CFSTR("gl-option-qr-connection-id-avc-key"));
      if (v269)
      {
        v157 = objc_alloc_init(IDSQRProtoQuicConnectionInfo);
        objc_msgSend_setQuicConnectionType_(v157, v158, 0, v159);
        objc_msgSend_setQuicConnectionId_(v157, v160, (uint64_t)v269, v161);
        objc_msgSend_addQuicConnectionInfo_(v280, v162, (uint64_t)v157, v163);

      }
      else
      {
        v269 = 0;
      }
    }
    v268 = 0;
    if (theDict && CFSTR("gl-option-qr-connection-id-ids-key"))
    {
      v268 = (id)CFDictionaryGetValue(theDict, CFSTR("gl-option-qr-connection-id-ids-key"));
      if (v268)
      {
        v164 = objc_alloc_init(IDSQRProtoQuicConnectionInfo);
        objc_msgSend_setQuicConnectionType_(v164, v165, 1, v166);
        objc_msgSend_setQuicConnectionId_(v164, v167, (uint64_t)v268, v168);
        objc_msgSend_addQuicConnectionInfo_(v280, v169, (uint64_t)v164, v170);

      }
      else
      {
        v268 = 0;
      }
    }
    v276 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v173 = CFSTR("gl-option-should-override-server-test-option-tle-disabled");
    if (CFSTR("gl-option-should-override-server-test-option-tle-disabled"))
      v174 = theDict != 0;
    else
      v174 = 0;
    if (v174)
      v175 = (void *)CFDictionaryGetValue(theDict, CFSTR("gl-option-should-override-server-test-option-tle-disabled"));
    else
      v175 = 0;
    if (objc_msgSend_BOOLValue(v175, v173, v171, v172, v265))
    {
      v179 = 0;
      if (theDict)
      {
        v176 = CFSTR("gl-option-server-test-option-tle-disabled");
        if (CFSTR("gl-option-server-test-option-tle-disabled"))
          v179 = (void *)CFDictionaryGetValue(theDict, CFSTR("gl-option-server-test-option-tle-disabled"));
      }
      v180 = objc_msgSend_BOOLValue(v179, v176, v177, v178);
      v181 = objc_alloc_init(IDSQRProtoExperimentOverride);
      objc_msgSend_setExperimentName_(v181, v182, (uint64_t)CFSTR("tled"), v183);
      objc_msgSend_setValue_(v181, v184, v180, v185);
      objc_msgSend_addObject_(v276, v186, (uint64_t)v181, v187);

    }
    if (objc_msgSend_count(v276, v176, v177, v178))
    {
      v191 = objc_alloc_init(IDSQRProtoAllocBindTestOption);
      objc_msgSend_setExperimentOverrides_(v191, v192, (uint64_t)v276, v193);
      objc_msgSend_setTestOption_(v280, v194, (uint64_t)v191, v195);

    }
    if (theDict)
    {
      v188 = CFSTR("gl-option-qr-session-experiments");
      if (CFSTR("gl-option-qr-session-experiments"))
      {
        v196 = (id)CFDictionaryGetValue(theDict, CFSTR("gl-option-qr-session-experiments"));
        if (v196)
        {
          v197 = v196;
          objc_msgSend_array(MEMORY[0x1E0C99DE8], (const char *)v188, v189, v190);
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setSessionExperiments_(v280, v199, (uint64_t)v198, v200);

          v284 = 0u;
          v285 = 0u;
          v282 = 0u;
          v283 = 0u;
          v201 = v197;
          v205 = objc_msgSend_countByEnumeratingWithState_objects_count_(v201, v202, (uint64_t)&v282, v203, v286, 16);
          if (!v205)
            goto LABEL_144;
          v206 = *(_QWORD *)v283;
          v207 = 138412546;
          while (1)
          {
            v208 = 0;
            do
            {
              if (*(_QWORD *)v283 != v206)
                objc_enumerationMutation(v201);
              v209 = *(_QWORD *)(*((_QWORD *)&v282 + 1) + 8 * v208);
              objc_msgSend_objectForKeyedSubscript_(v201, v204, v209, *(double *)&v207, v266, v267);
              v210 = (void *)objc_claimAutoreleasedReturnValue();
              v211 = objc_alloc_init(IDSQRProtoSessionExperiment);
              objc_msgSend_setExperimentName_(v211, v212, v209, v213);
              v214 = v210;
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              v217 = v214;
              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend_setStringValue_(v211, v216, (uint64_t)v217, v218);

LABEL_120:
                OSLogHandleForTransportCategory();
                v219 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v288 = v209;
                  v289 = 2112;
                  v290 = v211;
                  _os_log_impl(&dword_19B949000, v219, OS_LOG_TYPE_DEFAULT, "qrexp %@=%@", buf, 0x16u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    v266 = v209;
                    v267 = v211;
                    _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("qrexp %@=%@"));
                    if (_IDSShouldLog())
                    {
                      v266 = v209;
                      v267 = v211;
                      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("qrexp %@=%@"));
                    }
                  }
                }
                objc_msgSend_sessionExperiments(v280, v220, v221, v222, v266);
                v223 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v223, v224, (uint64_t)v211, v225);

                goto LABEL_127;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v226 = CFGetTypeID(v217);
                LODWORD(v226) = v226 == CFBooleanGetTypeID();

                if ((_DWORD)v226)
                {
                  v230 = objc_msgSend_BOOLValue(v217, v227, v228, v229);
                  objc_msgSend_setBoolValue_(v211, v231, v230, v232);
                  goto LABEL_120;
                }
              }
              else
              {

              }
              v233 = (const __CFNumber *)v217;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v234 = CFNumberIsFloatType(v233) == 0;

                if (v234)
                {
                  v238 = objc_msgSend_intValue(v233, v235, v236, v237);
                  objc_msgSend_setInt32Value_(v211, v239, v238, v240);
                  goto LABEL_120;
                }
              }
              else
              {

              }
              OSLogHandleForTransportCategory();
              v241 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v288 = v209;
                v289 = 2112;
                v290 = v233;
                _os_log_impl(&dword_19B949000, v241, OS_LOG_TYPE_DEFAULT, "qrexp %@ has unknown type (raw: %@)!", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v266 = v209;
                  v267 = v233;
                  _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("qrexp %@ has unknown type (raw: %@)!"));
                  if (_IDSShouldLog())
                  {
                    v266 = v209;
                    v267 = v233;
                    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("qrexp %@ has unknown type (raw: %@)!"));
                  }
                }
              }
LABEL_127:

              ++v208;
            }
            while (v205 != v208);
            v242 = objc_msgSend_countByEnumeratingWithState_objects_count_(v201, v204, (uint64_t)&v282, *(double *)&v207, v286, 16);
            v205 = v242;
            if (!v242)
            {
LABEL_144:

              break;
            }
          }
        }
      }
    }
    if (theDict)
    {
      v188 = CFSTR("gl-option-qr-server-data-blob");
      if (CFSTR("gl-option-qr-server-data-blob"))
      {
        v243 = (id)CFDictionaryGetValue(theDict, CFSTR("gl-option-qr-server-data-blob"));
        if (v243)
        {
          v244 = v243;
          objc_msgSend_setServerBlob_(v280, (const char *)v188, (uint64_t)v243, v190);

        }
      }
    }
    if (theDict)
    {
      v188 = CFSTR("gl-option-ids-context-blob-key");
      if (CFSTR("gl-option-ids-context-blob-key"))
      {
        v245 = (id)CFDictionaryGetValue(theDict, CFSTR("gl-option-ids-context-blob-key"));
        if (v245)
        {
          v246 = v245;
          objc_msgSend_setClientContextBlob_(v280, (const char *)v188, (uint64_t)v245, v190);

        }
      }
    }
    v247 = 0;
    if (theDict)
    {
      v188 = CFSTR("gl-option-ids-context-reason-key");
      if (CFSTR("gl-option-ids-context-reason-key"))
        v247 = (void *)CFDictionaryGetValue(theDict, CFSTR("gl-option-ids-context-reason-key"));
    }
    v249 = objc_msgSend_intValue(v247, (const char *)v188, v189, v190, v266);
    if ((_DWORD)v249)
      objc_msgSend_setReason_(v280, v248, v249, v250);
    objc_msgSend_objectForKeyedSubscript_(theDict, v248, (uint64_t)CFSTR("gl-option-materials-key"), v250);
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMaterials_(v280, v252, (uint64_t)v251, v253);

    objc_msgSend_materials(v280, v254, v255, v256);
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v257, v258, v259, v260);
    v261 = (void *)objc_claimAutoreleasedReturnValue();

    v281 = v261;
    cut_dispatch_log_queue();

  }
  return v275 > 2;
}

- (BOOL)_setupInfoRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;

  v6 = a3;
  objc_msgSend_relaySessionToken(a4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessToken_(v6, v11, (uint64_t)v10, v12);
  objc_msgSend_setInfoFlags_(v6, v13, 7, v14);

  return 1;
}

- (BOOL)_setupParticipantUpdateRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const __CFDictionary *v11;
  double v12;
  void *Value;
  uint64_t v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  const char *v31;
  double v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  double v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v11 = (const __CFDictionary *)a5;
  Value = 0;
  if (v11)
  {
    v9 = CFSTR("gl-option-participant-update-request-type");
    if (CFSTR("gl-option-participant-update-request-type"))
      Value = (void *)CFDictionaryGetValue(v11, CFSTR("gl-option-participant-update-request-type"));
  }
  v14 = objc_msgSend_unsignedShortValue(Value, v9, v10, v12);
  objc_msgSend_setOperationFlags_(v7, v15, v14, v16);
  if ((_DWORD)v14)
  {
    v20 = 0;
    if (v11 && CFSTR("gl-option-participant-update-blocked-participantIDs"))
      v20 = (void *)CFDictionaryGetValue(v11, CFSTR("gl-option-participant-update-blocked-participantIDs"));
    v21 = v20;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v38, 0.0, v42, 16);
    if (v23)
    {
      v27 = v23;
      v28 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v39 != v28)
            objc_enumerationMutation(v21);
          v30 = objc_msgSend_unsignedLongLongValue(*(void **)(*((_QWORD *)&v38 + 1) + 8 * i), v24, v25, v26);
          objc_msgSend_addParticipantIdList_(v7, v31, v30, v32);
        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v38, v26, v42, 16);
      }
      while (v27);
    }

  }
  v33 = 0;
  if (v11)
  {
    v17 = CFSTR("gl-option-participant-update-request-counter");
    if (CFSTR("gl-option-participant-update-request-counter"))
      v33 = (void *)CFDictionaryGetValue(v11, CFSTR("gl-option-participant-update-request-counter"));
  }
  v34 = objc_msgSend_unsignedIntValue(v33, v17, v18, v19);
  objc_msgSend_setSessionStateCounter_(v7, v35, v34, v36);

  return 1;
}

- (BOOL)_setupRegisterRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  void *v23;
  double v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  unsigned __int16 v31;
  const char *v32;
  double v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  unsigned __int16 v39;
  IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo *v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  const char *v45;
  double v46;
  const char *v47;
  double v48;
  BOOL v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  uint8_t v56[16];
  uint8_t buf[24];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_candidatePairToken(v8, v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_objectForKeyedSubscript_(v9, v13, (uint64_t)CFSTR("gl-option-reliable-unicast-reliable-link-uuid"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v16;
    if (!v16)
    {
      OSLogHandleForTransportCategory();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v51, OS_LOG_TYPE_DEFAULT, "Will not send register request due to reliable link UUID!", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register request due to reliable link UUID!"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register request due to reliable link UUID!"));
        }
      }
      v49 = 0;
      goto LABEL_41;
    }
    memset(buf, 170, 16);
    objc_msgSend_getUUIDBytes_(v16, v17, (uint64_t)buf, v18);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v20, (uint64_t)buf, v21, 16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend_setE2eChannelUuid_(v7, v22, (uint64_t)v23, v24);
      objc_msgSend_objectForKeyedSubscript_(v9, v25, (uint64_t)CFSTR("gl-option-reliable-unicast-local-relay-id"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_unsignedIntValue(v27, v28, v29, v30);

      v34 = v31;
      if (v31)
      {
        objc_msgSend_objectForKeyedSubscript_(v9, v32, (uint64_t)CFSTR("gl-option-reliable-unicast-remote-relay-id"), v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend_unsignedIntValue(v35, v36, v37, v38);

        if (v39)
        {
          v40 = objc_alloc_init(IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo);
          objc_msgSend_setQuicClientLinkId_(v40, v41, v34, v42);
          objc_msgSend_setQuicServerLinkId_(v40, v43, v39, v44);
          objc_msgSend_setServerGeneratedConnectionIds_(v40, v45, 1, v46);
          objc_msgSend_setChannelInfo_(v7, v47, (uint64_t)v40, v48);

          v49 = 1;
LABEL_40:

LABEL_41:
          goto LABEL_42;
        }
        OSLogHandleForTransportCategory();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v56 = 0;
          _os_log_impl(&dword_19B949000, v54, OS_LOG_TYPE_DEFAULT, "Will not send register request, invalid remote relay link ID!", v56, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register request, invalid remote relay link ID!"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register request, invalid remote relay link ID!"));
          }
        }
      }
      else
      {
        OSLogHandleForTransportCategory();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v56 = 0;
          _os_log_impl(&dword_19B949000, v53, OS_LOG_TYPE_DEFAULT, "Will not send register request, invalid local relay link ID!", v56, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register request, invalid local relay link ID!"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register request, invalid local relay link ID!"));
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
        *(_WORD *)v56 = 0;
        _os_log_impl(&dword_19B949000, v52, OS_LOG_TYPE_DEFAULT, "Will not send register request, can not convert UUID to NSData!", v56, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register request, can not convert UUID to NSData!"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register request, can not convert UUID to NSData!"));
        }
      }
    }
    v49 = 0;
    goto LABEL_40;
  }
  OSLogHandleForTransportCategory();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v50, OS_LOG_TYPE_DEFAULT, "Will not send register request due to invalid candidatePairToken!", buf, 2u);
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
  v49 = 0;
LABEL_42:

  return v49;
}

- (BOOL)_setupRegisterAckRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  void *v23;
  double v24;
  BOOL v25;
  const char *v26;
  double v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint8_t v32[16];
  uint8_t buf[24];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_candidatePairToken(v8, v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend_objectForKeyedSubscript_(v9, v13, (uint64_t)CFSTR("gl-option-reliable-unicast-reliable-link-uuid"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v16;
    if (v16)
    {
      memset(buf, 170, 16);
      objc_msgSend_getUUIDBytes_(v16, v17, (uint64_t)buf, v18);
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v20, (uint64_t)buf, v21, 16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23 != 0;
      if (v23)
      {
        objc_msgSend_setE2eChannelUuid_(v7, v22, (uint64_t)v23, v24);
        objc_msgSend_setAccept_(v7, v26, 1, v27);
      }
      else
      {
        OSLogHandleForTransportCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_19B949000, v30, OS_LOG_TYPE_DEFAULT, "Will not send register ack request, can not convert UUID to NSData!", v32, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register ack request, can not convert UUID to NSData!"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register ack request, can not convert UUID to NSData!"));
          }
        }
      }

    }
    else
    {
      OSLogHandleForTransportCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "Will not send register ack request due to invalid reliable link UUID!", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Will not send register ack request due to invalid reliable link UUID!"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Will not send register ack request due to invalid reliable link UUID!"));
        }
      }
      v25 = 0;
    }

  }
  else
  {
    OSLogHandleForTransportCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v28, OS_LOG_TYPE_DEFAULT, "Will not send register ack request due to invalid candidatePairToken!", buf, 2u);
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
    v25 = 0;
  }

  return v25;
}

- (BOOL)_setupPluginControlRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const __CFDictionary *v11;
  double v12;
  void *Value;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;

  v7 = a3;
  v8 = a4;
  v11 = (const __CFDictionary *)a5;
  Value = 0;
  if (v11)
  {
    v9 = CFSTR("gl-option-plugin-operation");
    if (CFSTR("gl-option-plugin-operation"))
      Value = (void *)CFDictionaryGetValue(v11, CFSTR("gl-option-plugin-operation"));
  }
  v14 = objc_msgSend_unsignedIntValue(Value, v9, v10, v12);
  v15 = 0;
  if (v11 && CFSTR("gl-option-plugin-name"))
    v15 = (void *)CFDictionaryGetValue(v11, CFSTR("gl-option-plugin-name"));
  v16 = v15;
  v17 = 0;
  if (v11 && CFSTR("gl-option-plugin-raw-public-key"))
    v17 = (void *)CFDictionaryGetValue(v11, CFSTR("gl-option-plugin-raw-public-key"));
  v18 = v17;
  objc_msgSend_setPluginOperation_(v7, v19, v14, v20);
  objc_msgSend_setPluginName_(v7, v21, (uint64_t)v16, v22);
  objc_msgSend_setPluginClientRawPublicKey_(v7, v23, (uint64_t)v18, v24);

  return 1;
}

- (BOOL)_setupSessionInfoRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  const __CFDictionary *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  char isSharedQRSession;
  double v16;
  void *Value;
  const __CFString *v18;
  uint64_t v19;
  double v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  double v31;
  void *v32;
  unsigned int v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  double v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  double v49;
  NSObject *v50;
  uint8_t v52[16];

  v7 = a3;
  v8 = a4;
  v9 = (const __CFDictionary *)a5;
  isSharedQRSession = objc_msgSend_isSharedQRSession(v8, v10, v11, v12);
  if ((isSharedQRSession & 1) != 0)
  {
    Value = 0;
    if (v9)
    {
      v13 = CFSTR("gl-option-sessioninfo-request-type");
      if (CFSTR("gl-option-sessioninfo-request-type"))
        Value = (void *)CFDictionaryGetValue(v9, CFSTR("gl-option-sessioninfo-request-type"));
    }
    if (objc_msgSend_intValue(Value, v13, v14, v16) == 2)
    {
      v21 = 0;
      if (v9)
      {
        v18 = CFSTR("gl-option-sessioninfo-generation-counter");
        if (CFSTR("gl-option-sessioninfo-generation-counter"))
          v21 = (void *)CFDictionaryGetValue(v9, CFSTR("gl-option-sessioninfo-generation-counter"));
      }
      v22 = objc_msgSend_unsignedIntValue(v21, (const char *)v18, v19, v20);
      objc_msgSend_setGenerationCounter_(v7, v23, v22, v24);
      v25 = 0;
      if (v9 && CFSTR("gl-option-sessioninfo-published-streams"))
        v25 = (void *)CFDictionaryGetValue(v9, CFSTR("gl-option-sessioninfo-published-streams"));
      v26 = v25;
      v27 = 0;
      if (v9 && CFSTR("gl-option-sessioninfo-subscribed-streams"))
        v27 = (void *)CFDictionaryGetValue(v9, CFSTR("gl-option-sessioninfo-subscribed-streams"));
      v30 = v27;
      v32 = 0;
      if (v9)
      {
        v28 = CFSTR("gl-option-sessioninfo-max-concurrent-streams");
        if (CFSTR("gl-option-sessioninfo-max-concurrent-streams"))
          v32 = (void *)CFDictionaryGetValue(v9, CFSTR("gl-option-sessioninfo-max-concurrent-streams"));
      }
      v33 = objc_msgSend_unsignedCharValue(v32, v28, v29, v31);
      sub_19BA6E2EC(v7, v26, v30, v33);
      v37 = 0;
      if (v9)
      {
        v34 = CFSTR("gl-option-sessioninfo-relay-link-id");
        if (CFSTR("gl-option-sessioninfo-relay-link-id"))
          v37 = (void *)CFDictionaryGetValue(v9, CFSTR("gl-option-sessioninfo-relay-link-id"));
      }
      v38 = objc_msgSend_unsignedShortValue(v37, v34, v35, v36);
      if ((_DWORD)v38)
        objc_msgSend_setLinkId_(v7, v39, v38, v40);

    }
    v41 = 0;
    if (v9)
    {
      v18 = CFSTR("gl-option-sessioninfo-command-flag");
      if (CFSTR("gl-option-sessioninfo-command-flag"))
        v41 = (void *)CFDictionaryGetValue(v9, CFSTR("gl-option-sessioninfo-command-flag"));
    }
    v42 = objc_msgSend_unsignedIntValue(v41, (const char *)v18, v19, v20);
    if ((_DWORD)v42)
      objc_msgSend_setCommandFlags_(v7, v43, v42, v45);
    v46 = 0;
    if (v9)
    {
      v43 = CFSTR("gl-option-sessioninfo-request-id");
      if (CFSTR("gl-option-sessioninfo-request-id"))
        v46 = (void *)CFDictionaryGetValue(v9, CFSTR("gl-option-sessioninfo-request-id"));
    }
    v47 = objc_msgSend_unsignedIntValue(v46, v43, v44, v45);
    if ((_DWORD)v47)
      objc_msgSend_setRequestId_(v7, v48, v47, v49);
  }
  else
  {
    OSLogHandleForTransportCategory();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_19B949000, v50, OS_LOG_TYPE_DEFAULT, "session-info is not allowed in non-shared QR session", v52, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("session-info is not allowed in non-shared QR session"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("session-info is not allowed in non-shared QR session"));
      }
    }
  }

  return isSharedQRSession;
}

- (BOOL)_setupPutmaterialRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  id v20;

  v6 = a5;
  v7 = a3;
  objc_msgSend_objectForKeyedSubscript_(v6, v8, (uint64_t)CFSTR("gl-option-materials-key"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaterials_(v7, v11, (uint64_t)v10, v12);

  objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)CFSTR("gl-option-materials-key"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_description(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v19;
  cut_dispatch_log_queue();

  return 1;
}

- (BOOL)_setupStatsRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v8;
  const __CFDictionary *v9;
  double startTime;
  id v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  const char *v18;
  const char *v19;
  double v20;
  BOOL v21;
  int v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *Value;
  uint64_t v27;
  const char *v28;
  double v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  double v36;

  v8 = a3;
  v9 = (const __CFDictionary *)a5;
  startTime = self->_startTime;
  v11 = a4;
  v12 = ntpTime32(startTime);
  objc_msgSend_serverLatency(v11, v13, v14, v15);
  v17 = v16;

  objc_msgSend_setClientTimestampNtp_(v8, v18, v12, v17 * 1000.0);
  if ((v17 * 1000.0))
    objc_msgSend_setClientLatencyMs_(v8, v19, (v17 * 1000.0), v20);
  if (v9)
    v21 = CFSTR("gl-option-stats-sent-packets") == 0;
  else
    v21 = 1;
  v22 = !v21;
  if (!v21 && CFDictionaryGetValue(v9, CFSTR("gl-option-stats-sent-packets")))
    goto LABEL_15;
  if (!v9
    || !CFSTR("gl-option-stats-received-packets")
    || !CFDictionaryGetValue(v9, CFSTR("gl-option-stats-received-packets")))
  {
    goto LABEL_21;
  }
  if (v22)
LABEL_15:
    Value = (void *)CFDictionaryGetValue(v9, CFSTR("gl-option-stats-sent-packets"));
  else
    Value = 0;
  v27 = objc_msgSend_unsignedIntValue(Value, v23, v24, v25);
  objc_msgSend_setSentPackets_(v8, v28, v27, v29);
  v33 = 0;
  if (v9 && CFSTR("gl-option-stats-received-packets"))
    v33 = (void *)CFDictionaryGetValue(v9, CFSTR("gl-option-stats-received-packets"));
  v34 = objc_msgSend_unsignedIntValue(v33, v30, v31, v32);
  objc_msgSend_setReceivedPackets_(v8, v35, v34, v36);
LABEL_21:

  return 1;
}

- (BOOL)_setupTestRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const __CFDictionary *v11;
  double v12;
  void *Value;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  unsigned __int16 v21;
  double v22;
  void *v23;
  unsigned __int16 v24;
  void *v25;
  id v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  double v34;
  NSObject *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v11 = (const __CFDictionary *)a5;
  Value = 0;
  if (v11)
  {
    v9 = CFSTR("gl-option-test-options-flags");
    if (CFSTR("gl-option-test-options-flags"))
      Value = (void *)CFDictionaryGetValue(v11, CFSTR("gl-option-test-options-flags"));
  }
  v16 = objc_msgSend_unsignedIntValue(Value, v9, v10, v12);
  v18 = 0;
  if (v11)
  {
    v14 = CFSTR("gl-option-test-requested-message-type");
    if (CFSTR("gl-option-test-requested-message-type"))
      v18 = (void *)CFDictionaryGetValue(v11, CFSTR("gl-option-test-requested-message-type"));
  }
  v21 = objc_msgSend_unsignedIntValue(v18, v14, v15, v17);
  v23 = 0;
  if (v11)
  {
    v19 = CFSTR("gl-option-test-requested-error-code-type");
    if (CFSTR("gl-option-test-requested-error-code-type"))
      v23 = (void *)CFDictionaryGetValue(v11, CFSTR("gl-option-test-requested-error-code-type"));
  }
  v24 = objc_msgSend_unsignedIntValue(v23, v19, v20, v22);
  v25 = 0;
  if (v11 && CFSTR("gl-option-test-sub-operation"))
    v25 = (void *)CFDictionaryGetValue(v11, CFSTR("gl-option-test-sub-operation"));
  v26 = v25;
  objc_msgSend_setTestOptionFlags_(v7, v27, v16, v28);
  if ((_DWORD)v16 == 8)
  {
    v31 = v21;
    objc_msgSend_setRequestedMessageType_(v7, v29, v31, v30);
    v32 = v24;
    objc_msgSend_setRequestedErrorCode_(v7, v33, v32, v34);
    OSLogHandleForTransportCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      v41 = 8;
      v42 = 1024;
      v43 = v31;
      v44 = 1024;
      v45 = v32;
      _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "testOptions: %u, requestedMessageType: %u, requestedErrorCode: %u", buf, 0x14u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v38 = v31;
        v39 = v32;
        v37 = 8;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("testOptions: %u, requestedMessageType: %u, requestedErrorCode: %u"));
        if (_IDSShouldLog())
        {
          v38 = v31;
          v39 = v32;
          v37 = 8;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("testOptions: %u, requestedMessageType: %u, requestedErrorCode: %u"));
        }
      }
    }
  }
  objc_msgSend_setSubOperation_(v7, v29, (uint64_t)v26, v30, v37, v38, v39);

  return 1;
}

- (BOOL)_setupUnallocbindRequest:(id)a3 candidatePair:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  const __CFDictionary *v9;
  const __CFString *v10;
  uint64_t v11;
  double v12;
  const __CFDictionary *v13;
  void *v14;
  void *v15;
  void *Value;
  uint64_t v17;
  const char *v18;
  double v19;

  v7 = a3;
  v8 = a4;
  v9 = (const __CFDictionary *)a5;
  v13 = v9;
  if (v9)
  {
    v10 = CFSTR("gl-option-ids-context-blob-key");
    if (CFSTR("gl-option-ids-context-blob-key"))
    {
      v14 = (id)CFDictionaryGetValue(v9, CFSTR("gl-option-ids-context-blob-key"));
      if (v14)
      {
        v15 = v14;
        objc_msgSend_setClientContextBlob_(v7, (const char *)v10, (uint64_t)v14, v12);

      }
    }
  }
  Value = 0;
  if (v13)
  {
    v10 = CFSTR("gl-option-ids-context-reason-key");
    if (CFSTR("gl-option-ids-context-reason-key"))
      Value = (void *)CFDictionaryGetValue(v13, CFSTR("gl-option-ids-context-reason-key"));
  }
  v17 = objc_msgSend_intValue(Value, (const char *)v10, v11, v12);
  objc_msgSend_setReason_(v7, v18, v17, v19);

  return 1;
}

- (IDSQRProtoMessage)initWithData:(id)a3
{
  id v4;
  IDSQRProtoMessage *v5;
  IDSQRProtoH3Message *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  IDSQRProtoH3Message *message;
  NSObject *v11;
  IDSQRProtoH3Message *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  id v21;
  id v22;
  const char *v23;
  uint64_t v24;
  double v25;
  IDSQRProtoH3Message *v26;
  IDSQRProtoMessage *v27;
  IDSQRProtoH3Message *v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  IDSQRProtoH3Message *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)IDSQRProtoMessage;
  v5 = -[IDSQRProtoMessage init](&v31, sel_init);
  if (v5)
  {
    v5->_startTime = ids_monotonic_time();
    v6 = [IDSQRProtoH3Message alloc];
    v9 = objc_msgSend_initWithData_(v6, v7, (uint64_t)v4, v8);
    message = v5->_message;
    v5->_message = (IDSQRProtoH3Message *)v9;

    OSLogHandleForTransportCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v5->_message;
      *(_DWORD *)buf = 138412546;
      v33 = v12;
      v34 = 2112;
      v35 = v4;
      _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "created proto message %@ with %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v29 = v5->_message;
        v30 = v4;
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("created proto message %@ with %@"));
        if (_IDSShouldLog())
        {
          v29 = v5->_message;
          v30 = v4;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("created proto message %@ with %@"));
        }
      }
    }
    objc_msgSend_description(v5->_message, v13, v14, v15, v29, v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_debugDescription(v4, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v16;
    v22 = v20;
    cut_dispatch_log_queue();
    v26 = v5->_message;
    if (!v26 || !objc_msgSend_hasInnerMessage(v26, v23, v24, v25))
    {

      v27 = 0;
      goto LABEL_13;
    }

  }
  v27 = v5;
LABEL_13:

  return v27;
}

- (id)allocbindResponse
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;

  if (objc_msgSend_innerMessage(self->_message, a2, v2, v3) == 2
    && objc_msgSend_hasAllocbindResponse(self->_message, v5, v6, v7))
  {
    objc_msgSend_allocbindResponse(self->_message, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)infoResponse
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasInfoResponse(self->_message, a2, v2, v3))
  {
    objc_msgSend_infoResponse(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)participantUpdateResponse
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasParticipantupdateResponse(self->_message, a2, v2, v3))
  {
    objc_msgSend_participantupdateResponse(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)pluginControlResponse
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasPlugincontrolResponse(self->_message, a2, v2, v3))
  {
    objc_msgSend_plugincontrolResponse(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)sessionInfoResponse
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasSessioninfoResponse(self->_message, a2, v2, v3))
  {
    objc_msgSend_sessioninfoResponse(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)getMaterialResponse
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasGetmaterialResponse(self->_message, a2, v2, v3))
  {
    objc_msgSend_getmaterialResponse(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)putMaterialResponse
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasPutmaterialResponse(self->_message, a2, v2, v3))
  {
    objc_msgSend_putmaterialResponse(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)statsResponse
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasStatsResponse(self->_message, a2, v2, v3))
  {
    objc_msgSend_statsResponse(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)testResponse
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasTestResponse(self->_message, a2, v2, v3))
  {
    objc_msgSend_testResponse(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)unallocbindResponse
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasUnallocbindResponse(self->_message, a2, v2, v3))
  {
    objc_msgSend_unallocbindResponse(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)diagnosticIndication
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasDiagnosticIndication(self->_message, a2, v2, v3))
  {
    objc_msgSend_diagnosticIndication(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)errorIndication
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasErrorIndication(self->_message, a2, v2, v3))
  {
    objc_msgSend_errorIndication(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)goAwayIndication
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasGoawayIndication(self->_message, a2, v2, v3))
  {
    objc_msgSend_goawayIndication(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)participantUpdateIndication
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasParticipantupdateIndication(self->_message, a2, v2, v3))
  {
    objc_msgSend_participantupdateIndication(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)pluginControlIndication
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasPlugincontrolIndication(self->_message, a2, v2, v3))
  {
    objc_msgSend_plugincontrolIndication(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)reallocateIndication
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasReallocateIndication(self->_message, a2, v2, v3))
  {
    objc_msgSend_reallocateIndication(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)sessionInfoIndication
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasSessioninfoIndication(self->_message, a2, v2, v3))
  {
    objc_msgSend_sessioninfoIndication(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)putMaterialIndication
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasPutmaterialIndication(self->_message, a2, v2, v3))
  {
    objc_msgSend_putmaterialIndication(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)registerIndication
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasRegisterIndication(self->_message, a2, v2, v3))
  {
    objc_msgSend_registerIndication(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)registerResponse
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  if (objc_msgSend_hasRegisterResponse(self->_message, a2, v2, v3))
  {
    objc_msgSend_registerResponse(self->_message, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)data
{
  uint64_t v2;
  double v3;

  return (id)objc_msgSend_data(self->_message, a2, v2, v3);
}

- (int)messageType
{
  uint64_t v2;
  double v3;

  return objc_msgSend_innerMessage(self->_message, a2, v2, v3);
}

+ (id)dataWithEmptyUnAllocBindResponse
{
  IDSQRProtoH3Message *v2;
  IDSQRProtoUnAllocBindResponse *v3;
  const char *v4;
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;

  v2 = objc_alloc_init(IDSQRProtoH3Message);
  v3 = objc_alloc_init(IDSQRProtoUnAllocBindResponse);
  objc_msgSend_setUnallocbindResponse_(v2, v4, (uint64_t)v3, v5);

  objc_msgSend_data(v2, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unint64_t)a3
{
  self->_transactionID = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
