@implementation NRDevicePairingManagerMux

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  OS_xpc_object *connection;
  OS_xpc_object *v9;
  objc_super v10;

  if (nrCopyLogObj_onceToken_1285 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 0, (uint64_t)"%s%.30s:%-4d Dealloc %@", v2, v3, v4, v5, v6, (uint64_t)");
  if (self)
  {
    connection = self->_connection;
    if (connection)
    {
      xpc_connection_cancel(connection);
      v9 = self->_connection;
      self->_connection = 0;

    }
  }
  v10.receiver = self;
  v10.super_class = (Class)NRDevicePairingManagerMux;
  -[NRDevicePairingManagerMux dealloc](&v10, sel_dealloc);
}

- (NRDevicePairingManagerMux)init
{
  NRDevicePairingManagerMux *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *muxEntries;
  NSObject *v5;
  xpc_connection_t mach_service;
  OS_xpc_object *connection;
  _xpc_connection_s *v8;
  _xpc_connection_s *v9;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD handler[4];
  id v23;
  id location;
  objc_super v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)NRDevicePairingManagerMux;
  v2 = -[NRDevicePairingManagerMux init](&v25, sel_init);
  if (!v2)
  {
    v11 = nrCopyLogObj_1274();
    v12 = v11;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (!v13)
      {
LABEL_10:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v20 = _os_log_pack_fill();
        *(_DWORD *)v20 = 136446210;
        *(_QWORD *)(v20 + 4) = "-[NRDevicePairingManagerMux init]";
        v21 = nrCopyLogObj_1274();
        _NRLogAbortWithPack(v21);
      }
    }
    v14 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v14, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v15, v16, v17, v18, v19, (uint64_t)");

    goto LABEL_10;
  }
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  muxEntries = v2->_muxEntries;
  v2->_muxEntries = v3;

  if (nrXPCCopyQueue_onceToken != -1)
    dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2127);
  objc_storeStrong((id *)&v2->_queue, (id)nrXPCCopyQueue_nrXPCQueue);
  v5 = v2->_queue;
  mach_service = xpc_connection_create_mach_service("com.apple.terminusd", v5, 2uLL);
  connection = v2->_connection;
  v2->_connection = mach_service;

  objc_initWeak(&location, v2);
  v8 = v2->_connection;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __33__NRDevicePairingManagerMux_init__block_invoke;
  handler[3] = &unk_1EA3F7400;
  objc_copyWeak(&v23, &location);
  xpc_connection_set_event_handler(v8, handler);

  v9 = v2->_connection;
  xpc_connection_activate(v9);

  -[NRDevicePairingManagerMux checkInWithRetryCount:]((id *)&v2->super.isa, 0);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_muxEntries, 0);
}

void __33__NRDevicePairingManagerMux_init__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const unsigned __int8 *uuid;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const unsigned __int8 *v23;
  id v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t value;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t uint64;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  const void *v53;
  void *v54;
  _QWORD *v55;
  id v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const unsigned __int8 *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const unsigned __int8 *v70;
  void *v71;
  void (**v72)(_QWORD);
  id *v73;
  uint64_t v74;
  id v75;
  int64_t v76;
  id v77;
  const void *bytes_ptr;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  _QWORD *v94;
  uint64_t v95;
  void *v96;
  NSObject *v97;
  unint64_t v98;
  const unsigned __int8 *v99;
  const unsigned __int8 *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  id v108;
  id v109;
  _QWORD *v110;
  uint64_t v111;
  void *v112;
  NSObject *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  NSObject *v117;
  _BOOL4 v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  _BOOL4 v127;
  NSObject *v128;
  NSObject *v129;
  NSObject *v130;
  NSObject *v131;
  _BOOL4 v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  NSObject *v138;
  NSObject *v139;
  _BOOL4 v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  NSObject *v146;
  NSObject *v147;
  NSObject *v148;
  NSObject *v149;
  NSObject *v150;
  uint64_t v151;
  _BOOL4 v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  NSObject *v158;
  NSObject *v159;
  _BOOL4 v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  _BOOL4 v166;
  id v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  NSObject *v174;
  id v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  id v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  id v190;
  void *v191;
  _BOOL4 v192;
  void *v193;
  void *v194;
  void *v195;
  xpc_object_t xdict;
  _BOOL4 xdicta;
  id *v198;
  id *v199;
  id *v200;
  id v201;
  const __CFString *block;
  uint64_t v203;
  void (*v204)(uint64_t);
  void *v205;
  _QWORD *v206;
  id v207;
  uint64_t v208;
  id v209[3];

  v209[1] = *(id *)MEMORY[0x1E0C80C00];
  v201 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1DF0BA7A8](v201);
    if (v4 != MEMORY[0x1E0C812F8])
    {
      if (v4 == MEMORY[0x1E0C81310])
      {
        if (nrCopyLogObj_onceToken_1285 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
          goto LABEL_32;
        v10 = nrCopyLogObj_sNRLogObj_1287;
        v188 = "";
        v11 = "%s%.30s:%-4d Received XPC error: %@, invalidating";
        v12 = 16;
        goto LABEL_31;
      }
      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 16, (uint64_t)"%s%.30s:%-4d Received unexpected XPC object: %@, invalidating", v5, v6, v7, v8, v9, (uint64_t)"), nrCopyLogObj_onceToken_1285 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
          {
LABEL_32:
            objc_opt_self();
            v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v209[0] = *(id *)MEMORY[0x1E0CB2D50];
            block = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &block, v209, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)objc_msgSend(v24, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v25);

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v14);
LABEL_120:

            goto LABEL_121;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      v10 = nrCopyLogObj_sNRLogObj_1287;
      v11 = "Received unexpected XPC object";
      v12 = 17;
LABEL_31:
      _NRLogWithArgs(v10, v12, (uint64_t)v11, v5, v6, v7, v8, v9, (uint64_t)v188);
      goto LABEL_32;
    }
    if (nrCopyLogObj_onceToken_1285 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_DEBUG))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 2, (uint64_t)"%s%.30s:%-4d Received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)");
    v13 = v201;
    v14 = v13;
    if (!*((_QWORD *)WeakRetained + 3))
      goto LABEL_120;
    xpc_dictionary_get_value(v13, "PairingManagerOperation");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
    {
      if (MEMORY[0x1DF0BA7A8](v15) == MEMORY[0x1E0C81398])
      {
        uuid = xpc_dictionary_get_uuid(v14, "PairingManager");
        if (!uuid || (v23 = uuid, uuid_is_null(uuid)))
        {
          if (nrCopyLogObj_onceToken_1285 == -1)
          {
            if (sNRCopyLogToStdErr)
              goto LABEL_25;
          }
          else
          {
            dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
            if (sNRCopyLogToStdErr)
              goto LABEL_25;
          }
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
          {
LABEL_119:

            goto LABEL_120;
          }
LABEL_25:
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 17, (uint64_t)"Pairing manager UUID missing", v18, v19, v20, v21, v22, (uint64_t)v188);
          goto LABEL_119;
        }
        v26 = 0x1E0CB3000uLL;
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v23);
        objc_msgSend(*((id *)WeakRetained + 2), "objectForKeyedSubscript:", v27);
        v28 = (id *)objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
          v128 = nrCopyLogObj_1274();
          v129 = v128;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v132 = os_log_type_enabled(v128, OS_LOG_TYPE_FAULT);

            if (!v132)
              goto LABEL_117;
          }
          v47 = nrCopyLogObj_1274();
          _NRLogWithArgs((uint64_t)v47, 17, (uint64_t)"Pairing manager %@ is not registered", v133, v134, v135, v136, v137, (uint64_t)v27);
LABEL_69:

          goto LABEL_117;
        }
        value = xpc_uint64_get_value(v16);
        switch(value)
        {
          case 5uLL:
            xdict = v14;
            xpc_dictionary_get_value(xdict, "DiscoveredPairingCandidate");
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = (void *)v35;
            if (!v35)
              goto LABEL_97;
            if (MEMORY[0x1DF0BA7A8](v35) != MEMORY[0x1E0C812E8])
            {
              if (nrCopyLogObj_onceToken_1285 == -1)
              {
                if (!sNRCopyLogToStdErr)
                  goto LABEL_39;
              }
              else
              {
                dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
                if (!sNRCopyLogToStdErr)
                {
LABEL_39:
                  if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
                    goto LABEL_97;
                }
              }
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 17, (uint64_t)"Failed to get pairing candidate from message", v37, v38, v39, v40, v41, (uint64_t)v188);
              goto LABEL_97;
            }
            v199 = v28;
            v194 = v27;
            v77 = objc_alloc(MEMORY[0x1E0C99D50]);
            bytes_ptr = xpc_data_get_bytes_ptr(v36);
            v209[0] = 0;
            v189 = objc_msgSend(v77, "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v36));
            objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v189, v209);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v190 = v209[0];
            if (!v190)
            {
              v80 = v199[2];
              v191 = v79;
              objc_msgSend(v79, "uuid");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "objectForKeyedSubscript:", v81);
              v82 = (void *)objc_claimAutoreleasedReturnValue();

              if (v82)
              {
                v26 = 0x1E0CB3000;
                if (nrCopyLogObj_onceToken_1285 != -1)
                  dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
                v88 = v191;
                v27 = v194;
                v89 = (void *)v189;
                if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_INFO))
                  _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 1, (uint64_t)"%s%.30s:%-4d Received duplicate candidate %@", v83, v84, v85, v86, v87, (uint64_t)");
              }
              else
              {
                if (nrCopyLogObj_onceToken_1285 != -1)
                  dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
                if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_INFO))
                  _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 1, (uint64_t)"%s%.30s:%-4d Received new candidate %@", v83, v84, v85, v86, v87, (uint64_t)");
                v90 = v199[2];
                objc_msgSend(v191, "uuid");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "setObject:forKeyedSubscript:", v191, v91);

                v92 = v199[1];
                v93 = v191;
                if (v92)
                {
                  v94 = v92;
                  objc_sync_enter(v94);
                  v95 = v94[1];
                  objc_sync_exit(v94);

                  if (v95 == 5)
                  {
                    objc_msgSend(v94, "candidateDiscoveredHandler");
                    v96 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v96)
                    {
                      v97 = v94[7];
                      block = (const __CFString *)MEMORY[0x1E0C809B0];
                      v203 = 3221225472;
                      v204 = __46__NRDevicePairingManager_discoveredCandidate___block_invoke;
                      v205 = &unk_1EA3F7368;
                      v206 = v94;
                      v207 = v93;
                      dispatch_async(v97, &block);

                    }
                  }
                }

                v88 = v191;
                v27 = v194;
                v26 = 0x1E0CB3000uLL;
                v89 = (void *)v189;
              }
              goto LABEL_96;
            }
            v88 = v79;
            v158 = nrCopyLogObj_1274();
            v159 = v158;
            if (sNRCopyLogToStdErr)
            {

              v27 = v194;
              v89 = (void *)v189;
            }
            else
            {
              v192 = os_log_type_enabled(v158, OS_LOG_TYPE_FAULT);

              v27 = v194;
              v26 = 0x1E0CB3000;
              v89 = (void *)v189;
              if (!v192)
              {
LABEL_96:

                v28 = v199;
LABEL_97:
                v98 = v26;
                v99 = xpc_dictionary_get_uuid(xdict, "LostPairingCandidate");
                if (!v99)
                  goto LABEL_116;
                v100 = v99;
                if (uuid_is_null(v99))
                  goto LABEL_116;
                v101 = (void *)objc_msgSend(objc_alloc(*(Class *)(v98 + 2600)), "initWithUUIDBytes:", v100);
                v200 = v28;
                objc_msgSend(v28[2], "objectForKeyedSubscript:", v101);
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                if (v107)
                {
                  if (nrCopyLogObj_onceToken_1285 != -1)
                    dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
                  v195 = v27;
                  if (sNRCopyLogToStdErr
                    || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_INFO))
                  {
                    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 1, (uint64_t)"%s%.30s:%-4d Lost candidate %@", v102, v103, v104, v105, v106, (uint64_t)");
                  }
                  v108 = v200[1];
                  v109 = v107;
                  if (v108)
                  {
                    v110 = v108;
                    objc_sync_enter(v110);
                    v111 = v110[1];
                    objc_sync_exit(v110);

                    if (v111 == 5)
                    {
                      objc_msgSend(v110, "candidateLostHandler");
                      v112 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v112)
                      {
                        v113 = v110[7];
                        block = (const __CFString *)MEMORY[0x1E0C809B0];
                        v203 = 3221225472;
                        v204 = __40__NRDevicePairingManager_lostCandidate___block_invoke;
                        v205 = &unk_1EA3F7368;
                        v206 = v110;
                        v207 = v109;
                        dispatch_async(v113, &block);

                      }
                    }
                  }

                  objc_msgSend(v200[2], "setObject:forKeyedSubscript:", 0, v101);
                  v27 = v195;
                  goto LABEL_115;
                }
                if (nrCopyLogObj_onceToken_1285 == -1)
                {
                  if (sNRCopyLogToStdErr)
                    goto LABEL_114;
                }
                else
                {
                  dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
                  if (sNRCopyLogToStdErr)
                    goto LABEL_114;
                }
                if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_INFO))
                {
LABEL_115:

                  v28 = v200;
LABEL_116:

                  goto LABEL_117;
                }
LABEL_114:
                _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 1, (uint64_t)"%s%.30s:%-4d Lost missing candidate %@", v102, v103, v104, v105, v106, (uint64_t)");
                goto LABEL_115;
              }
            }
            v182 = nrCopyLogObj_1274();
            _NRLogWithArgs((uint64_t)v182, 17, (uint64_t)"Failed to unarchive NRDevicePairingCandidate %@", v183, v184, v185, v186, v187, (uint64_t)v190);

            v26 = 0x1E0CB3000;
            goto LABEL_96;
          case 7uLL:
            v47 = v14;
            if (nrCopyLogObj_onceToken_1285 == -1)
            {
              if (sNRCopyLogToStdErr)
                goto LABEL_48;
            }
            else
            {
              dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
              if (sNRCopyLogToStdErr)
                goto LABEL_48;
            }
            if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_INFO))
              goto LABEL_49;
LABEL_48:
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 1, (uint64_t)"%s%.30s:%-4d Received auth method request from peer", v42, v43, v44, v45, v46, (uint64_t)");
LABEL_49:
            uint64 = xpc_dictionary_get_uint64(v47, "AuthRequestType");
            v198 = v28;
            if (uint64)
            {
              v49 = uint64;
              v193 = v27;
              xpc_dictionary_get_value(v47, "AuthData");
              v50 = objc_claimAutoreleasedReturnValue();
              v51 = (id)v50;
              if (v50 && MEMORY[0x1DF0BA7A8](v50) == MEMORY[0x1E0C812E8])
              {
                v52 = objc_alloc(MEMORY[0x1E0C99D50]);
                v53 = xpc_data_get_bytes_ptr(v51);
                v54 = (void *)objc_msgSend(v52, "initWithBytes:length:", v53, xpc_data_get_length(v51));
                v55 = v198[1];
                v56 = v54;
                if (v55)
                {
                  objc_msgSend(v55, "authRequestHandler");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v57)
                  {
                    v58 = v55[7];
                    block = (const __CFString *)MEMORY[0x1E0C809B0];
                    v203 = 3221225472;
                    v204 = __64__NRDevicePairingManager_receivedRequestForAuthMethod_authData___block_invoke;
                    v205 = &unk_1EA3F7390;
                    v206 = v55;
                    v208 = v49;
                    v207 = v56;
                    dispatch_async(v58, &block);

                  }
                }

              }
              else
              {
                v130 = nrCopyLogObj_1274();
                v131 = v130;
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v140 = os_log_type_enabled(v130, OS_LOG_TYPE_FAULT);

                  if (!v140)
                    goto LABEL_57;
                }
                v56 = nrCopyLogObj_1274();
                _NRLogWithArgs((uint64_t)v56, 17, (uint64_t)"Received request for auth method with no auth data", v141, v142, v143, v144, v145, (uint64_t)v188);
              }

LABEL_57:
              v27 = v193;
LABEL_58:

              v28 = v198;
              goto LABEL_78;
            }
            v138 = nrCopyLogObj_1274();
            v139 = v138;
            if (sNRCopyLogToStdErr)
            {

LABEL_164:
              v51 = nrCopyLogObj_1274();
              _NRLogWithArgs((uint64_t)v51, 17, (uint64_t)"Received request for invalid auth method", v153, v154, v155, v156, v157, (uint64_t)v188);
              goto LABEL_58;
            }
            v152 = os_log_type_enabled(v138, OS_LOG_TYPE_FAULT);

            if (v152)
              goto LABEL_164;
            goto LABEL_78;
          case 8uLL:
            v47 = v14;
            if (nrCopyLogObj_onceToken_1285 == -1)
            {
              if (sNRCopyLogToStdErr)
                goto LABEL_62;
            }
            else
            {
              dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
              if (sNRCopyLogToStdErr)
                goto LABEL_62;
            }
            if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_INFO))
              goto LABEL_63;
LABEL_62:
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 1, (uint64_t)"%s%.30s:%-4d Received auth method request update", v59, v60, v61, v62, v63, (uint64_t)");
LABEL_63:
            v64 = xpc_dictionary_get_uuid(v47, "TargetPairingCandidate");
            if (!v64 || (v70 = v64, uuid_is_null(v64)))
            {
              if (nrCopyLogObj_onceToken_1285 == -1)
              {
                if (!sNRCopyLogToStdErr)
                  goto LABEL_67;
              }
              else
              {
                dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
                if (!sNRCopyLogToStdErr)
                {
LABEL_67:
                  if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
                    goto LABEL_78;
                }
              }
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 17, (uint64_t)"Auth method request result missing pairing target UUID", v65, v66, v67, v68, v69, (uint64_t)v188);
              goto LABEL_69;
            }
            v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v70);
            objc_msgSend(v28[5], "objectForKeyedSubscript:", v71);
            v72 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
            if (!v72)
            {
              v73 = v28;
              v146 = nrCopyLogObj_1274();
              v147 = v146;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v160 = os_log_type_enabled(v146, OS_LOG_TYPE_ERROR);

                if (!v160)
                  goto LABEL_77;
              }
              v75 = nrCopyLogObj_1274();
              _NRLogWithArgs((uint64_t)v75, 16, (uint64_t)"%s%.30s:%-4d Pairing target %@ in auth method request result has no outstanding request", v161, v162, v163, v164, v165, (uint64_t)");
LABEL_76:

LABEL_77:
              v28 = v73;
LABEL_78:

LABEL_117:
LABEL_118:

              goto LABEL_119;
            }
            v73 = v28;
            objc_msgSend(v28[5], "setObject:forKeyedSubscript:", 0, v71);
            xpc_dictionary_get_value(v47, "Result");
            v74 = objc_claimAutoreleasedReturnValue();
            if (v74)
            {
              v75 = (id)v74;
              if (MEMORY[0x1DF0BA7A8]() == MEMORY[0x1E0C81328])
              {
                v76 = xpc_int64_get_value(v75);
                if (!v76)
                {
                  v72[2](v72);
                  goto LABEL_76;
                }
                v151 = +[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, v76);
LABEL_175:
                v181 = (void *)v151;
                ((void (*)(void (**)(_QWORD), uint64_t))v72[2])(v72, v151);

                goto LABEL_76;
              }
              v150 = nrCopyLogObj_1274();
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v174 = v150;
                xdicta = os_log_type_enabled(v150, OS_LOG_TYPE_FAULT);

                if (!xdicta)
                {
LABEL_174:
                  v151 = +[NRDevicePairingManager copyXPCError]();
                  goto LABEL_175;
                }
              }
              v175 = nrCopyLogObj_1274();
              _NRLogWithArgs((uint64_t)v175, 17, (uint64_t)"Register received invalid result type", v176, v177, v178, v179, v180, (uint64_t)v188);

              goto LABEL_174;
            }
            v148 = nrCopyLogObj_1274();
            v149 = v148;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v166 = os_log_type_enabled(v148, OS_LOG_TYPE_FAULT);

              if (!v166)
              {
LABEL_171:
                v173 = (void *)+[NRDevicePairingManager copyXPCError]();
                ((void (*)(void (**)(_QWORD), void *))v72[2])(v72, v173);

                v75 = 0;
                goto LABEL_76;
              }
            }
            v167 = nrCopyLogObj_1274();
            _NRLogWithArgs((uint64_t)v167, 17, (uint64_t)"Auth method request received response without result code", v168, v169, v170, v171, v172, (uint64_t)v188);

            goto LABEL_171;
          case 0xCuLL:
            -[NRDevicePairingManagerMuxEntry handleStartPairingRequestUpdate:]((uint64_t)v28, v14);
            goto LABEL_117;
          default:
            if (nrCopyLogObj_onceToken_1285 == -1)
            {
              if (sNRCopyLogToStdErr)
                goto LABEL_44;
            }
            else
            {
              dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
              if (sNRCopyLogToStdErr)
                goto LABEL_44;
            }
            if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
              goto LABEL_117;
LABEL_44:
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 17, (uint64_t)"Received unexpected operation code %llu", v29, v30, v31, v32, v33, value);
            goto LABEL_117;
        }
      }
      v116 = nrCopyLogObj_1274();
      v117 = v116;
      if (sNRCopyLogToStdErr)
      {

LABEL_133:
        v119 = nrCopyLogObj_1274();
        v125 = v119;
        v126 = "Received invalid operation code type";
        goto LABEL_134;
      }
      v127 = os_log_type_enabled(v116, OS_LOG_TYPE_FAULT);

      if (v127)
        goto LABEL_133;
LABEL_135:
      v27 = (void *)+[NRDevicePairingManager copyXPCError]();
      -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v27);
      goto LABEL_118;
    }
    v114 = nrCopyLogObj_1274();
    v115 = v114;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v118 = os_log_type_enabled(v114, OS_LOG_TYPE_FAULT);

      if (!v118)
        goto LABEL_135;
    }
    v119 = nrCopyLogObj_1274();
    v125 = v119;
    v126 = "Received unsolicited message without operation code";
LABEL_134:
    _NRLogWithArgs((uint64_t)v119, 17, (uint64_t)v126, v120, v121, v122, v123, v124, (uint64_t)v188);

    goto LABEL_135;
  }
LABEL_121:

}

- (void)checkInWithRetryCount:(id *)a1
{
  xpc_object_t v4;
  void *v5;
  _xpc_connection_s *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _BOOL4 v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  _BOOL4 v42;
  uint64_t v43;
  void *v44;
  _QWORD handler[4];
  id v46;
  id v47;
  unsigned int v48;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  if (a2 >= 6)
  {
    v18 = nrCopyLogObj_1274();
    v19 = v18;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v33 = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);

      if (!v33)
        goto LABEL_28;
    }
    v34 = nrCopyLogObj_1274();
    v40 = v34;
    v41 = "Failed to checkin NRDeviceMonitor after retries";
LABEL_27:
    _NRLogWithArgs((uint64_t)v34, 17, (uint64_t)v41, v35, v36, v37, v38, v39, v43);

    goto LABEL_28;
  }
  if (a1[3])
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    if (v4)
    {
      v5 = v4;
      xpc_dictionary_set_uint64(v4, "Type", 0x31uLL);
      objc_initWeak(location, a1);
      v6 = (_xpc_connection_s *)a1[3];
      v7 = a1[4];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __51__NRDevicePairingManagerMux_checkInWithRetryCount___block_invoke;
      handler[3] = &unk_1EA3F7428;
      objc_copyWeak(&v47, location);
      v8 = v5;
      v46 = v8;
      v48 = a2;
      xpc_connection_send_message_with_reply(v6, v8, v7, handler);

      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      v9 = (id)nrCopyLogObj_sNRLogObj_1287;
      v10 = v9;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v11 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

        if (!v11)
        {
LABEL_12:

          objc_destroyWeak(&v47);
          objc_destroyWeak(location);

          return;
        }
      }
      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      v12 = (id)nrCopyLogObj_sNRLogObj_1287;
      _NRLogWithArgs((uint64_t)v12, 1, (uint64_t)"%s%.30s:%-4d Sent check-in message: %@", v13, v14, v15, v16, v17, (uint64_t)");

      goto LABEL_12;
    }
    v22 = nrCopyLogObj_1274();
    v23 = v22;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v24 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (!v24)
      {
LABEL_22:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v31 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v31, (uint64_t)"nr_xpc_dictionary_create");
        v32 = nrCopyLogObj_1274();
        _NRLogAbortWithPack(v32);
      }
    }
    v25 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v25, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v26, v27, v28, v29, v30, (uint64_t)");

    goto LABEL_22;
  }
  v20 = nrCopyLogObj_1274();
  v21 = v20;
  if (sNRCopyLogToStdErr)
  {

LABEL_26:
    v34 = nrCopyLogObj_1274();
    v40 = v34;
    v41 = "Could not check in with server as no connection found";
    goto LABEL_27;
  }
  v42 = os_log_type_enabled(v20, OS_LOG_TYPE_FAULT);

  if (v42)
    goto LABEL_26;
LABEL_28:
  v44 = (void *)+[NRDevicePairingManager copyXPCError]();
  -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)a1, v44);

}

- (void)invalidateManagersWithError:(uint64_t)a1
{
  id v3;
  _xpc_connection_s *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SEL v12;
  uint64_t v13;
  SEL v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void (**v22)(_QWORD, _QWORD);
  uint64_t k;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = *(_xpc_connection_s **)(a1 + 24);
    if (v4)
    {
      xpc_connection_cancel(v4);
      v5 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = *(id *)(a1 + 16);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v6)
    {
      v7 = v6;
      v27 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v33 != v27)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            v11 = *(_QWORD *)(v9 + 24);
            if (v11)
            {
              (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
              objc_setProperty_nonatomic_copy((id)v10, v12, 0, 24);
            }
            v13 = *(_QWORD *)(v10 + 32);
            if (v13)
            {
              (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
              objc_setProperty_nonatomic_copy((id)v10, v14, 0, 32);
            }
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            v15 = *(void **)(v10 + 40);
          }
          else
          {
            v15 = 0;
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
          }
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v29;
            if (v10)
            {
              v20 = a1;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v29 != v19)
                    objc_enumerationMutation(v16);
                  objc_msgSend(*(id *)(v10 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
                  v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                  ((void (**)(_QWORD, id))v22)[2](v22, v3);

                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              }
              while (v18);

              a1 = v20;
LABEL_31:
              objc_msgSend(*(id *)(v10 + 40), "removeAllObjects");
              v25 = *(void **)(v10 + 8);
              goto LABEL_32;
            }
            do
            {
              for (k = 0; k != v18; ++k)
              {
                if (*(_QWORD *)v29 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(0, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k));
                v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, id))v24)[2](v24, v3);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v18);
          }

          if (v10)
            goto LABEL_31;
          objc_msgSend(0, "removeAllObjects");
          v25 = 0;
LABEL_32:
          -[NRDevicePairingManager invalidateWithError:](v25, v3);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(a1 + 16), "removeAllObjects");
  }

}

void __51__NRDevicePairingManagerMux_checkInWithRetryCount___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t value;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void **v26;
  id v27;
  SEL v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  _BOOL4 v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  _BOOL4 v43;
  uint64_t v44;
  xpc_object_t xdict;
  _QWORD v46[16];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  xdict = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_59;
  v4 = MEMORY[0x1DF0BA7A8](xdict);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    if (nrCopyLogObj_onceToken_1285 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_DEBUG))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 2, (uint64_t)"%s%.30s:%-4d Checkin received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)");
    xpc_dictionary_get_value(xdict, "Result");
    v13 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v13;
    if (v13)
    {
      if (MEMORY[0x1DF0BA7A8](v13) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v12);
        if (!value)
        {
          *((_BYTE *)WeakRetained + 8) = 1;
          if (nrCopyLogObj_onceToken_1285 == -1)
          {
            if (!sNRCopyLogToStdErr)
              goto LABEL_23;
          }
          else
          {
            dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
            if (!sNRCopyLogToStdErr)
            {
LABEL_23:
              if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_INFO))
                goto LABEL_25;
            }
          }
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 1, (uint64_t)"%s%.30s:%-4d Checked in with terminusd", v15, v16, v17, v18, v19, (uint64_t)");
LABEL_25:
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v20 = *((id *)WeakRetained + 2);
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v48 != v23)
                  objc_enumerationMutation(v20);
                objc_msgSend(*((id *)WeakRetained + 2), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
                v25 = objc_claimAutoreleasedReturnValue();
                v26 = (void **)v25;
                if (v25 && *(_QWORD *)(v25 + 24))
                {
                  v27 = *(id *)(v25 + 8);
                  -[NRDevicePairingManagerMux registerPairingManager:withCompletion:]((uint64_t)WeakRetained, v27, v26[3]);

                  objc_setProperty_nonatomic_copy(v26, v28, 0, 24);
                }

              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
            }
            while (v22);
          }
          goto LABEL_57;
        }
        v33 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
LABEL_56:
        v20 = v33;
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v33);
LABEL_57:

        goto LABEL_58;
      }
      v31 = nrCopyLogObj_1274();
      v32 = v31;
      if (sNRCopyLogToStdErr)
      {

LABEL_53:
        v35 = nrCopyLogObj_1274();
        v41 = v35;
        v42 = "received invalid result type";
        goto LABEL_54;
      }
      v43 = os_log_type_enabled(v31, OS_LOG_TYPE_FAULT);

      if (v43)
        goto LABEL_53;
LABEL_55:
      v33 = (void *)+[NRDevicePairingManager copyXPCError]();
      goto LABEL_56;
    }
    v29 = nrCopyLogObj_1274();
    v30 = v29;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v34 = os_log_type_enabled(v29, OS_LOG_TYPE_FAULT);

      if (!v34)
        goto LABEL_55;
    }
    v35 = nrCopyLogObj_1274();
    v41 = v35;
    v42 = "received response without result code";
LABEL_54:
    _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)v42, v36, v37, v38, v39, v40, v44);

    goto LABEL_55;
  }
  if (v4 != MEMORY[0x1E0C81310])
  {
    if (nrCopyLogObj_onceToken_1285 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
    if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
      && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 16, (uint64_t)"%s%.30s:%-4d Checkin received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)"), nrCopyLogObj_onceToken_1285 != -1))
    {
      dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      if (sNRCopyLogToStdErr)
        goto LABEL_11;
    }
    else if (sNRCopyLogToStdErr)
    {
      goto LABEL_11;
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
    {
LABEL_12:
      objc_opt_self();
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      *(_QWORD *)&v47 = *MEMORY[0x1E0CB2D50];
      v46[0] = CFSTR("An XPC connection error occurred");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v47, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v11);

      -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v12);
LABEL_58:

      goto LABEL_59;
    }
LABEL_11:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 17, (uint64_t)"Checkin received unexpected XPC object", v5, v6, v7, v8, v9, v44);
    goto LABEL_12;
  }
  if (nrCopyLogObj_onceToken_1285 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 16, (uint64_t)"%s%.30s:%-4d Checkin could not deliver message %@, error %@, retrying", v5, v6, v7, v8, v9, (uint64_t)");
  -[NRDevicePairingManagerMux checkInWithRetryCount:](WeakRetained, (*(_DWORD *)(a1 + 48) + 1));
LABEL_59:

}

- (void)registerPairingManager:(void *)a3 withCompletion:
{
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  const char *v9;
  xpc_object_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _xpc_connection_s *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  _BOOL4 v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void (**v49)(id, void *);
  void *v50;
  _QWORD handler[4];
  id v52;
  void (**v53)(id, void *);
  id v54;
  id location;
  id v56[2];

  v56[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a2;
  v49 = a3;
  if (a1)
  {
    if (!*(_QWORD *)(a1 + 24))
    {
      v27 = (void *)+[NRDevicePairingManager copyXPCError]();
      v49[2](v49, v27);

      goto LABEL_23;
    }
    if (v5)
      v6 = (void *)v5[11];
    else
      v6 = 0;
    v7 = v6;
    objc_msgSend(v7, "uuid");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v50);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = -[NRDevicePairingManagerMuxEntry initWithPairingManager:]([NRDevicePairingManagerMuxEntry alloc], v5);
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v8, v50);
      if (!*(_BYTE *)(a1 + 8))
      {
        if (!v8)
          goto LABEL_22;
        objc_setProperty_nonatomic_copy(v8, v9, v49, 24);
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
    }
    v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      v11 = v10;
      xpc_dictionary_set_uint64(v10, "PairingManagerOperation", 1uLL);
      v12 = (void *)MEMORY[0x1E0CB36F8];
      if (v5)
        v13 = (void *)v5[11];
      else
        v13 = 0;
      v14 = v13;
      v56[0] = 0;
      objc_msgSend(v12, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, v56);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v56[0];

      if (!v48)
      {
        xpc_dictionary_set_data(v11, "PairingManagerInfo", (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
        objc_initWeak(&location, (id)a1);
        v16 = (_xpc_connection_s *)*(id *)(a1 + 24);
        v17 = *(id *)(a1 + 32);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __67__NRDevicePairingManagerMux_registerPairingManager_withCompletion___block_invoke;
        handler[3] = &unk_1EA3F7450;
        objc_copyWeak(&v54, &location);
        v53 = v49;
        v52 = v11;
        xpc_connection_send_message_with_reply(v16, v52, v17, handler);

        if (nrCopyLogObj_onceToken_1285 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        v18 = (id)nrCopyLogObj_sNRLogObj_1287;
        v19 = v18;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v20 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

          if (!v20)
          {
LABEL_19:

            objc_destroyWeak(&v54);
            objc_destroyWeak(&location);
LABEL_20:

            goto LABEL_21;
          }
        }
        if (nrCopyLogObj_onceToken_1285 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        v21 = (id)nrCopyLogObj_sNRLogObj_1287;
        _NRLogWithArgs((uint64_t)v21, 1, (uint64_t)"%s%.30s:%-4d Sent registration message: %@", v22, v23, v24, v25, v26, (uint64_t)");

        goto LABEL_19;
      }
      v31 = nrCopyLogObj_1274();
      v32 = v31;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v41 = os_log_type_enabled(v31, OS_LOG_TYPE_FAULT);

        if (!v41)
        {
LABEL_37:
          v49[2](v49, v48);
          goto LABEL_20;
        }
      }
      v42 = nrCopyLogObj_1274();
      _NRLogWithArgs((uint64_t)v42, 17, (uint64_t)"Failed to archive device pairing manager info %@", v43, v44, v45, v46, v47, (uint64_t)v48);

      goto LABEL_37;
    }
    v28 = nrCopyLogObj_1274();
    v29 = v28;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v30 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

      if (!v30)
      {
LABEL_34:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v39 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v39, (uint64_t)"nr_xpc_dictionary_create");
        v40 = nrCopyLogObj_1274();
        _NRLogAbortWithPack(v40);
      }
    }
    v33 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v33, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v34, v35, v36, v37, v38, (uint64_t)");

    goto LABEL_34;
  }
LABEL_23:

}

void __67__NRDevicePairingManagerMux_registerPairingManager_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int64_t value;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  xpc_object_t xdict;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  xdict = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1DF0BA7A8](xdict);
    if (v4 != MEMORY[0x1E0C812F8])
    {
      if (v4 == MEMORY[0x1E0C81310])
      {
        if (nrCopyLogObj_onceToken_1285 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v10 = nrCopyLogObj_sNRLogObj_1287;
        v42 = "";
        v11 = "%s%.30s:%-4d Register could not deliver message %@, error %@";
        v12 = 16;
        goto LABEL_26;
      }
      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 16, (uint64_t)"%s%.30s:%-4d Register received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)"), nrCopyLogObj_onceToken_1285 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
          {
LABEL_27:
            v17 = *(_QWORD *)(a1 + 40);
            objc_opt_self();
            v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = *MEMORY[0x1E0CB2D50];
            v19 = v44;
            v45[0] = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v20);

            (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v21);
            objc_opt_self();
            v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = v19;
            v45[0] = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v23);

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v14);
            goto LABEL_28;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      v10 = nrCopyLogObj_sNRLogObj_1287;
      v11 = "Register received unexpected XPC object";
      v12 = 17;
LABEL_26:
      _NRLogWithArgs(v10, v12, (uint64_t)v11, v5, v6, v7, v8, v9, (uint64_t)v42);
      goto LABEL_27;
    }
    if (nrCopyLogObj_onceToken_1285 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_DEBUG))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 2, (uint64_t)"%s%.30s:%-4d Register received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)");
    xpc_dictionary_get_value(xdict, "Result");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      if (MEMORY[0x1DF0BA7A8](v13) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v14);
        v16 = *(_QWORD *)(a1 + 40);
        if (!value)
        {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
LABEL_28:

          goto LABEL_29;
        }
        v26 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v26);

LABEL_43:
        v41 = (void *)+[NRDevicePairingManager copyXPCError]();
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v41);

        goto LABEL_28;
      }
      v25 = nrCopyLogObj_1274();
      if (sNRCopyLogToStdErr)
      {

LABEL_40:
        v29 = nrCopyLogObj_1274();
        v35 = v29;
        v36 = "Register received invalid result type";
        goto LABEL_41;
      }
      v37 = v25;
      v38 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (v38)
        goto LABEL_40;
LABEL_42:
      v39 = *(_QWORD *)(a1 + 40);
      v40 = (void *)+[NRDevicePairingManager copyXPCError]();
      (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);

      goto LABEL_43;
    }
    v24 = nrCopyLogObj_1274();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v27 = v24;
      v28 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v28)
        goto LABEL_42;
    }
    v29 = nrCopyLogObj_1274();
    v35 = v29;
    v36 = "Register received response without result code";
LABEL_41:
    _NRLogWithArgs((uint64_t)v29, 17, (uint64_t)v36, v30, v31, v32, v33, v34, (uint64_t)v42);

    goto LABEL_42;
  }
LABEL_29:

}

- (void)unregisterPairingManager:(void *)a3 withCompletion:
{
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void (**v12)(_QWORD, _QWORD);
  id v13;
  void *v14;
  void *v15;
  SEL v16;
  xpc_object_t v17;
  void *v18;
  xpc_object_t v19;
  void *v20;
  _xpc_connection_s *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  BOOL v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  _BOOL4 v36;
  NSObject *v37;
  NSObject *v38;
  _BOOL4 v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void (**v56)(id, void *);
  _QWORD handler[4];
  id v58;
  id v59;
  void (**v60)(id, void *);
  id v61;
  unsigned __int8 uuid[8];
  uint64_t v63;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a2;
  v56 = a3;
  if (a1)
  {
    if (!a1[3])
    {
      v33 = (void *)+[NRDevicePairingManager copyXPCError]();
      v56[2](v56, v33);

      goto LABEL_21;
    }
    if (v5)
      v6 = (void *)v5[11];
    else
      v6 = 0;
    v7 = v6;
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[2], "objectForKeyedSubscript:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (!v9)
    {
      v56[2](v56, 0);
LABEL_20:

      goto LABEL_21;
    }
    v11 = *(void (***)(_QWORD, _QWORD))(v9 + 24);
    if (v11)
    {
      v12 = v11;
      objc_opt_self();
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      location[0] = *(id *)MEMORY[0x1E0CB2D50];
      *(_QWORD *)uuid = CFSTR("Manager is in invalid state for this operation");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", uuid, location, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -3001, v14);

      ((void (**)(_QWORD, void *))v11)[2](v12, v15);
      objc_setProperty_nonatomic_copy(v10, v16, 0, 24);
    }
    v17 = xpc_dictionary_create(0, 0, 0);
    if (v17)
    {
      v18 = v17;
      xpc_dictionary_set_uint64(v17, "PairingManagerOperation", 2uLL);
      *(_QWORD *)uuid = 0;
      v63 = 0;
      objc_msgSend(v8, "getUUIDBytes:", uuid);
      v19 = xpc_array_create(0, 0);
      v20 = v19;
      if (v19)
      {
        xpc_array_set_uuid(v19, 0xFFFFFFFFFFFFFFFFLL, uuid);
        xpc_dictionary_set_value(v18, "PairingManagers", v20);
        objc_initWeak(location, a1);
        v21 = (_xpc_connection_s *)a1[3];
        v22 = a1[4];
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __69__NRDevicePairingManagerMux_unregisterPairingManager_withCompletion___block_invoke;
        handler[3] = &unk_1EA3F7478;
        objc_copyWeak(&v61, location);
        v58 = v8;
        v60 = v56;
        v23 = v18;
        v59 = v23;
        xpc_connection_send_message_with_reply(v21, v23, v22, handler);

        if (nrCopyLogObj_onceToken_1285 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        v24 = (id)nrCopyLogObj_sNRLogObj_1287;
        v25 = v24;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v26 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);

          if (!v26)
          {
LABEL_19:

            objc_destroyWeak(&v61);
            objc_destroyWeak(location);

            goto LABEL_20;
          }
        }
        if (nrCopyLogObj_onceToken_1285 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        v27 = (id)nrCopyLogObj_sNRLogObj_1287;
        _NRLogWithArgs((uint64_t)v27, 1, (uint64_t)"%s%.30s:%-4d Sent unregistration message: %@", v28, v29, v30, v31, v32, (uint64_t)");

        goto LABEL_19;
      }
      v37 = nrCopyLogObj_1274();
      v38 = v37;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v39 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);

        if (!v39)
        {
LABEL_34:
          _os_log_pack_size();
          MEMORY[0x1E0C80A78]();
          __error();
          v54 = _os_log_pack_fill();
          __os_log_helper_1_2_3_8_34_8_0_4_0(v54, (uint64_t)"nr_xpc_array_create");
          v55 = nrCopyLogObj_1274();
          _NRLogAbortWithPack(v55);
        }
      }
      v48 = nrCopyLogObj_1274();
      _NRLogWithArgs((uint64_t)v48, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_array_create(%p, %u) failed", v49, v50, v51, v52, v53, (uint64_t)");

      goto LABEL_34;
    }
    v34 = nrCopyLogObj_1274();
    v35 = v34;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v36 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);

      if (!v36)
      {
LABEL_31:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v46 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v46, (uint64_t)"nr_xpc_dictionary_create");
        v47 = nrCopyLogObj_1274();
        _NRLogAbortWithPack(v47);
      }
    }
    v40 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v40, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v41, v42, v43, v44, v45, (uint64_t)");

    goto LABEL_31;
  }
LABEL_21:

}

void __69__NRDevicePairingManagerMux_unregisterPairingManager_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  int v13;
  uint64_t v14;
  void *v15;
  int64_t value;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  NSObject *v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  xpc_object_t xdict;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  xdict = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
    v5 = MEMORY[0x1DF0BA7A8](xdict);
    if (v5 != MEMORY[0x1E0C812F8])
    {
      if (v5 == MEMORY[0x1E0C81310])
      {
        if (nrCopyLogObj_onceToken_1285 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v11 = nrCopyLogObj_sNRLogObj_1287;
        v43 = "";
        v12 = "%s%.30s:%-4d Unregister could not deliver message %@, error %@";
        v13 = 16;
        goto LABEL_26;
      }
      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 16, (uint64_t)"%s%.30s:%-4d Unregister received unexpected XPC object: %@", v6, v7, v8, v9, v10, (uint64_t)"), nrCopyLogObj_onceToken_1285 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
          {
LABEL_27:
            v18 = *(_QWORD *)(a1 + 48);
            objc_opt_self();
            v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v45 = *MEMORY[0x1E0CB2D50];
            v20 = v45;
            v46[0] = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v21);

            (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v22);
            objc_opt_self();
            v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v45 = v20;
            v46[0] = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v23, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v24);

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)v4, v15);
            goto LABEL_28;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      v11 = nrCopyLogObj_sNRLogObj_1287;
      v12 = "Unregister received unexpected XPC object";
      v13 = 17;
LABEL_26:
      _NRLogWithArgs(v11, v13, (uint64_t)v12, v6, v7, v8, v9, v10, (uint64_t)v43);
      goto LABEL_27;
    }
    if (nrCopyLogObj_onceToken_1285 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_DEBUG))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 2, (uint64_t)"%s%.30s:%-4d Unregister received XPC dict: %@", v6, v7, v8, v9, v10, (uint64_t)");
    xpc_dictionary_get_value(xdict, "Result");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
    {
      if (MEMORY[0x1DF0BA7A8](v14) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v15);
        v17 = *(_QWORD *)(a1 + 48);
        if (!value)
        {
          (*(void (**)(uint64_t))(v17 + 16))(v17);
LABEL_28:

          goto LABEL_29;
        }
        v27 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
        (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v27);

LABEL_43:
        v42 = (void *)+[NRDevicePairingManager copyXPCError]();
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)v4, v42);

        goto LABEL_28;
      }
      v26 = nrCopyLogObj_1274();
      if (sNRCopyLogToStdErr)
      {

LABEL_40:
        v30 = nrCopyLogObj_1274();
        v36 = v30;
        v37 = "Unregister received invalid result type";
        goto LABEL_41;
      }
      v38 = v26;
      v39 = os_log_type_enabled(v26, OS_LOG_TYPE_FAULT);

      if (v39)
        goto LABEL_40;
LABEL_42:
      v40 = *(_QWORD *)(a1 + 48);
      v41 = (void *)+[NRDevicePairingManager copyXPCError]();
      (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v41);

      goto LABEL_43;
    }
    v25 = nrCopyLogObj_1274();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v28 = v25;
      v29 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (!v29)
        goto LABEL_42;
    }
    v30 = nrCopyLogObj_1274();
    v36 = v30;
    v37 = "received response without result code";
LABEL_41:
    _NRLogWithArgs((uint64_t)v30, 17, (uint64_t)v37, v31, v32, v33, v34, v35, (uint64_t)v43);

    goto LABEL_42;
  }
LABEL_29:

}

- (void)startDiscoveryForPairingManager:(void *)a3 withCompletion:
{
  _QWORD *v5;
  void (**v6)(id, void *);
  xpc_object_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _xpc_connection_s *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _QWORD handler[4];
  id v37;
  void (**v38)(id, void *);
  id v39;
  id location;
  unsigned __int8 uuid[8];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (!a1[3])
    {
      v24 = (void *)+[NRDevicePairingManager copyXPCError]();
      v6[2](v6, v24);

      goto LABEL_15;
    }
    v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      v8 = v7;
      *(_QWORD *)uuid = 0;
      v42 = 0;
      if (v5)
        v9 = (void *)v5[11];
      else
        v9 = 0;
      v10 = v9;
      objc_msgSend(v10, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getUUIDBytes:", uuid);

      xpc_dictionary_set_uuid(v8, "PairingManager", uuid);
      xpc_dictionary_set_uint64(v8, "PairingManagerOperation", 3uLL);
      objc_initWeak(&location, a1);
      v12 = (_xpc_connection_s *)a1[3];
      v13 = a1[4];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __76__NRDevicePairingManagerMux_startDiscoveryForPairingManager_withCompletion___block_invoke;
      handler[3] = &unk_1EA3F7450;
      objc_copyWeak(&v39, &location);
      v38 = v6;
      v14 = v8;
      v37 = v14;
      xpc_connection_send_message_with_reply(v12, v14, v13, handler);

      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      v15 = (id)nrCopyLogObj_sNRLogObj_1287;
      v16 = v15;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v17 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

        if (!v17)
        {
LABEL_14:

          objc_destroyWeak(&v39);
          objc_destroyWeak(&location);

          goto LABEL_15;
        }
      }
      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      v18 = (id)nrCopyLogObj_sNRLogObj_1287;
      _NRLogWithArgs((uint64_t)v18, 1, (uint64_t)"%s%.30s:%-4d Sent discovery start message: %@", v19, v20, v21, v22, v23, (uint64_t)");

      goto LABEL_14;
    }
    v25 = nrCopyLogObj_1274();
    v26 = v25;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v27 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (!v27)
      {
LABEL_22:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v34 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v34, (uint64_t)"nr_xpc_dictionary_create");
        v35 = nrCopyLogObj_1274();
        _NRLogAbortWithPack(v35);
      }
    }
    v28 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v28, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v29, v30, v31, v32, v33, (uint64_t)");

    goto LABEL_22;
  }
LABEL_15:

}

void __76__NRDevicePairingManagerMux_startDiscoveryForPairingManager_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int64_t value;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  xpc_object_t xdict;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  xdict = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1DF0BA7A8](xdict);
    if (v4 != MEMORY[0x1E0C812F8])
    {
      if (v4 == MEMORY[0x1E0C81310])
      {
        if (nrCopyLogObj_onceToken_1285 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v10 = nrCopyLogObj_sNRLogObj_1287;
        v42 = "";
        v11 = "%s%.30s:%-4d Start discovery could not deliver message %@, error %@";
        v12 = 16;
        goto LABEL_26;
      }
      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 16, (uint64_t)"%s%.30s:%-4d Start discovery received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)"), nrCopyLogObj_onceToken_1285 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
          {
LABEL_27:
            v17 = *(_QWORD *)(a1 + 40);
            objc_opt_self();
            v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = *MEMORY[0x1E0CB2D50];
            v19 = v44;
            v45[0] = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v20);

            (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v21);
            objc_opt_self();
            v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = v19;
            v45[0] = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v23);

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v14);
            goto LABEL_28;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      v10 = nrCopyLogObj_sNRLogObj_1287;
      v11 = "Start discovery received unexpected XPC object";
      v12 = 17;
LABEL_26:
      _NRLogWithArgs(v10, v12, (uint64_t)v11, v5, v6, v7, v8, v9, (uint64_t)v42);
      goto LABEL_27;
    }
    if (nrCopyLogObj_onceToken_1285 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_DEBUG))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 2, (uint64_t)"%s%.30s:%-4d Start discovery received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)");
    xpc_dictionary_get_value(xdict, "Result");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      if (MEMORY[0x1DF0BA7A8](v13) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v14);
        v16 = *(_QWORD *)(a1 + 40);
        if (!value)
        {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
LABEL_28:

          goto LABEL_29;
        }
        v26 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v26);

LABEL_43:
        v41 = (void *)+[NRDevicePairingManager copyXPCError]();
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v41);

        goto LABEL_28;
      }
      v25 = nrCopyLogObj_1274();
      if (sNRCopyLogToStdErr)
      {

LABEL_40:
        v29 = nrCopyLogObj_1274();
        v35 = v29;
        v36 = "Start discovery received invalid result type";
        goto LABEL_41;
      }
      v37 = v25;
      v38 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (v38)
        goto LABEL_40;
LABEL_42:
      v39 = *(_QWORD *)(a1 + 40);
      v40 = (void *)+[NRDevicePairingManager copyXPCError]();
      (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);

      goto LABEL_43;
    }
    v24 = nrCopyLogObj_1274();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v27 = v24;
      v28 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v28)
        goto LABEL_42;
    }
    v29 = nrCopyLogObj_1274();
    v35 = v29;
    v36 = "Start discovery received response without result code";
LABEL_41:
    _NRLogWithArgs((uint64_t)v29, 17, (uint64_t)v36, v30, v31, v32, v33, v34, (uint64_t)v42);

    goto LABEL_42;
  }
LABEL_29:

}

- (void)stopDiscoveryForPairingManager:(void *)a3 withCompletion:
{
  _QWORD *v5;
  void (**v6)(id, void *);
  xpc_object_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _xpc_connection_s *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _QWORD handler[4];
  id v37;
  void (**v38)(id, void *);
  id v39;
  id location;
  unsigned __int8 uuid[8];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (!a1[3])
    {
      v24 = (void *)+[NRDevicePairingManager copyXPCError]();
      v6[2](v6, v24);

      goto LABEL_15;
    }
    v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      v8 = v7;
      *(_QWORD *)uuid = 0;
      v42 = 0;
      if (v5)
        v9 = (void *)v5[11];
      else
        v9 = 0;
      v10 = v9;
      objc_msgSend(v10, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getUUIDBytes:", uuid);

      xpc_dictionary_set_uuid(v8, "PairingManager", uuid);
      xpc_dictionary_set_uint64(v8, "PairingManagerOperation", 4uLL);
      objc_initWeak(&location, a1);
      v12 = (_xpc_connection_s *)a1[3];
      v13 = a1[4];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __75__NRDevicePairingManagerMux_stopDiscoveryForPairingManager_withCompletion___block_invoke;
      handler[3] = &unk_1EA3F7450;
      objc_copyWeak(&v39, &location);
      v38 = v6;
      v14 = v8;
      v37 = v14;
      xpc_connection_send_message_with_reply(v12, v14, v13, handler);

      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      v15 = (id)nrCopyLogObj_sNRLogObj_1287;
      v16 = v15;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v17 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

        if (!v17)
        {
LABEL_14:

          objc_destroyWeak(&v39);
          objc_destroyWeak(&location);

          goto LABEL_15;
        }
      }
      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      v18 = (id)nrCopyLogObj_sNRLogObj_1287;
      _NRLogWithArgs((uint64_t)v18, 1, (uint64_t)"%s%.30s:%-4d Sent discovery stop message: %@", v19, v20, v21, v22, v23, (uint64_t)");

      goto LABEL_14;
    }
    v25 = nrCopyLogObj_1274();
    v26 = v25;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v27 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (!v27)
      {
LABEL_22:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v34 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v34, (uint64_t)"nr_xpc_dictionary_create");
        v35 = nrCopyLogObj_1274();
        _NRLogAbortWithPack(v35);
      }
    }
    v28 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v28, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v29, v30, v31, v32, v33, (uint64_t)");

    goto LABEL_22;
  }
LABEL_15:

}

void __75__NRDevicePairingManagerMux_stopDiscoveryForPairingManager_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int64_t value;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  xpc_object_t xdict;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  xdict = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1DF0BA7A8](xdict);
    if (v4 != MEMORY[0x1E0C812F8])
    {
      if (v4 == MEMORY[0x1E0C81310])
      {
        if (nrCopyLogObj_onceToken_1285 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v10 = nrCopyLogObj_sNRLogObj_1287;
        v42 = "";
        v11 = "%s%.30s:%-4d Stop discovery could not deliver message %@, error %@";
        v12 = 16;
        goto LABEL_26;
      }
      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 16, (uint64_t)"%s%.30s:%-4d Stop discovery received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)"), nrCopyLogObj_onceToken_1285 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
          {
LABEL_27:
            v17 = *(_QWORD *)(a1 + 40);
            objc_opt_self();
            v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = *MEMORY[0x1E0CB2D50];
            v19 = v44;
            v45[0] = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v20);

            (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v21);
            objc_opt_self();
            v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = v19;
            v45[0] = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v23);

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v14);
            goto LABEL_28;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      v10 = nrCopyLogObj_sNRLogObj_1287;
      v11 = "Stop discovery received unexpected XPC object";
      v12 = 17;
LABEL_26:
      _NRLogWithArgs(v10, v12, (uint64_t)v11, v5, v6, v7, v8, v9, (uint64_t)v42);
      goto LABEL_27;
    }
    if (nrCopyLogObj_onceToken_1285 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_DEBUG))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 2, (uint64_t)"%s%.30s:%-4d Stop discovery received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)");
    xpc_dictionary_get_value(xdict, "Result");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      if (MEMORY[0x1DF0BA7A8](v13) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v14);
        v16 = *(_QWORD *)(a1 + 40);
        if (!value)
        {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
LABEL_28:

          goto LABEL_29;
        }
        v26 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v26);

LABEL_43:
        v41 = (void *)+[NRDevicePairingManager copyXPCError]();
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v41);

        goto LABEL_28;
      }
      v25 = nrCopyLogObj_1274();
      if (sNRCopyLogToStdErr)
      {

LABEL_40:
        v29 = nrCopyLogObj_1274();
        v35 = v29;
        v36 = "Stop discovery received invalid result type";
        goto LABEL_41;
      }
      v37 = v25;
      v38 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (v38)
        goto LABEL_40;
LABEL_42:
      v39 = *(_QWORD *)(a1 + 40);
      v40 = (void *)+[NRDevicePairingManager copyXPCError]();
      (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);

      goto LABEL_43;
    }
    v24 = nrCopyLogObj_1274();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v27 = v24;
      v28 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v28)
        goto LABEL_42;
    }
    v29 = nrCopyLogObj_1274();
    v35 = v29;
    v36 = "Stop discovery received response without result code";
LABEL_41:
    _NRLogWithArgs((uint64_t)v29, 17, (uint64_t)v36, v30, v31, v32, v33, v34, (uint64_t)v42);

    goto LABEL_42;
  }
LABEL_29:

}

- (void)sendAuthMethodRequestForDevice:(uint64_t)a3 authMethod:(void *)a4 pairingManager:(void *)a5 withCompletion:
{
  id v9;
  _QWORD *v10;
  void (**v11)(id, void *);
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  xpc_object_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  _BOOL4 v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  _BOOL4 v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  unsigned __int8 v49[8];
  uint64_t v50;
  unsigned __int8 uuid[8];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    if (!*(_QWORD *)(a1 + 24))
    {
      v14 = (void *)+[NRDevicePairingManager copyXPCError]();
      v11[2](v11, v14);
      goto LABEL_15;
    }
    if (v10)
      v12 = (void *)v10[11];
    else
      v12 = 0;
    v13 = v12;
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (id *)v16;
    if (v16)
    {
      objc_msgSend(*(id *)(v16 + 40), "objectForKeyedSubscript:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        if (nrCopyLogObj_onceToken_1285 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_INFO))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 1, (uint64_t)"%s%.30s:%-4d %@ Sending auth method request for %@", v19, v20, v21, v22, v23, (uint64_t)");
        v24 = xpc_dictionary_create(0, 0, 0);
        if (v24)
        {
          v25 = v24;
          *(_QWORD *)uuid = 0;
          v52 = 0;
          objc_msgSend(v14, "getUUIDBytes:", uuid);
          xpc_dictionary_set_uuid(v25, "PairingManager", uuid);
          *(_QWORD *)v49 = 0;
          v50 = 0;
          objc_msgSend(v15, "getUUIDBytes:", v49);
          xpc_dictionary_set_uuid(v25, "TargetPairingCandidate", v49);
          xpc_dictionary_set_uint64(v25, "AuthRequestType", a3);
          xpc_dictionary_set_uint64(v25, "PairingManagerOperation", 6uLL);
          xpc_connection_send_message(*(xpc_connection_t *)(a1 + 24), v25);
          v26 = (void *)MEMORY[0x1DF0BA328](v11);
          objc_msgSend(v17[5], "setObject:forKeyedSubscript:", v26, v15);

LABEL_14:
LABEL_15:

          goto LABEL_16;
        }
        v30 = nrCopyLogObj_1274();
        v31 = v30;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v32 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

          if (!v32)
          {
LABEL_26:
            _os_log_pack_size();
            MEMORY[0x1E0C80A78]();
            __error();
            v39 = _os_log_pack_fill();
            __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v39, (uint64_t)"nr_xpc_dictionary_create");
            v40 = nrCopyLogObj_1274();
            _NRLogAbortWithPack(v40);
          }
        }
        v33 = nrCopyLogObj_1274();
        _NRLogWithArgs((uint64_t)v33, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v34, v35, v36, v37, v38, (uint64_t)");

        goto LABEL_26;
      }
      v29 = +[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, -3003);
LABEL_30:
      v48 = (void *)v29;
      v11[2](v11, (void *)v29);

      goto LABEL_14;
    }
    v27 = nrCopyLogObj_1274();
    v28 = v27;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v41 = os_log_type_enabled(v27, OS_LOG_TYPE_FAULT);

      if (!v41)
      {
LABEL_29:
        v29 = +[NRDevicePairingManager copyXPCError]();
        goto LABEL_30;
      }
    }
    v42 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v42, 17, (uint64_t)"Pairing manager %@ is not registered", v43, v44, v45, v46, v47, (uint64_t)v14);

    goto LABEL_29;
  }
LABEL_16:

}

- (void)startPairingForPairingManager:(void *)a3 pairingTarget:(void *)a4 withCompletion:
{
  _QWORD *v7;
  id v8;
  void (**v9)(id, void *);
  xpc_object_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _xpc_connection_s *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  BOOL v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  _BOOL4 v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  _QWORD handler[4];
  id v47;
  void (**v48)(id, void *);
  id v49;
  id location;
  id v51;
  unsigned __int8 uuid[8];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if (!a1[3])
    {
      v34 = (void *)+[NRDevicePairingManager copyXPCError]();
      v9[2](v9, v34);

      goto LABEL_25;
    }
    v10 = xpc_dictionary_create(0, 0, 0);
    if (v10)
    {
      v11 = v10;
      *(_QWORD *)uuid = 0;
      v53 = 0;
      if (v7)
        v12 = (void *)v7[11];
      else
        v12 = 0;
      v13 = v12;
      objc_msgSend(v13, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "getUUIDBytes:", uuid);

      xpc_dictionary_set_uuid(v11, "PairingManager", uuid);
      xpc_dictionary_set_uint64(v11, "PairingManagerOperation", 0xAuLL);
      if (v8)
      {
        v51 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v51);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v51;
        if (v16)
        {
          v22 = v16;
          if (nrCopyLogObj_onceToken_1285 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 17, (uint64_t)"Failed to archive pairing target %@", v17, v18, v19, v20, v21, (uint64_t)v22);
          v9[2](v9, v22);

          goto LABEL_24;
        }
        xpc_dictionary_set_data(v11, "PairingTarget", (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));

      }
      objc_initWeak(&location, a1);
      v23 = (_xpc_connection_s *)a1[3];
      v24 = a1[4];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __88__NRDevicePairingManagerMux_startPairingForPairingManager_pairingTarget_withCompletion___block_invoke;
      handler[3] = &unk_1EA3F7450;
      objc_copyWeak(&v49, &location);
      v48 = v9;
      v47 = v11;
      xpc_connection_send_message_with_reply(v23, v47, v24, handler);

      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      v25 = (id)nrCopyLogObj_sNRLogObj_1287;
      v26 = v25;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v27 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);

        if (!v27)
        {
LABEL_23:

          objc_destroyWeak(&v49);
          objc_destroyWeak(&location);
LABEL_24:

          goto LABEL_25;
        }
      }
      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      v28 = (id)nrCopyLogObj_sNRLogObj_1287;
      _NRLogWithArgs((uint64_t)v28, 1, (uint64_t)"%s%.30s:%-4d Sent pairing start message: %@", v29, v30, v31, v32, v33, (uint64_t)");

      goto LABEL_23;
    }
    v35 = nrCopyLogObj_1274();
    v36 = v35;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v37 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);

      if (!v37)
      {
LABEL_32:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v44 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v44, (uint64_t)"nr_xpc_dictionary_create");
        v45 = nrCopyLogObj_1274();
        _NRLogAbortWithPack(v45);
      }
    }
    v38 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v38, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v39, v40, v41, v42, v43, (uint64_t)");

    goto LABEL_32;
  }
LABEL_25:

}

void __88__NRDevicePairingManagerMux_startPairingForPairingManager_pairingTarget_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int64_t value;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  xpc_object_t xdict;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  xdict = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1DF0BA7A8](xdict);
    if (v4 != MEMORY[0x1E0C812F8])
    {
      if (v4 == MEMORY[0x1E0C81310])
      {
        if (nrCopyLogObj_onceToken_1285 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v10 = nrCopyLogObj_sNRLogObj_1287;
        v42 = "";
        v11 = "%s%.30s:%-4d Start pairing could not deliver message %@, error %@";
        v12 = 16;
        goto LABEL_26;
      }
      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 16, (uint64_t)"%s%.30s:%-4d Start pairing received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)"), nrCopyLogObj_onceToken_1285 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
          {
LABEL_27:
            v17 = *(_QWORD *)(a1 + 40);
            objc_opt_self();
            v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = *MEMORY[0x1E0CB2D50];
            v19 = v44;
            v45[0] = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v20);

            (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v21);
            objc_opt_self();
            v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = v19;
            v45[0] = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v23);

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v14);
            goto LABEL_28;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      v10 = nrCopyLogObj_sNRLogObj_1287;
      v11 = "Start pairing received unexpected XPC object";
      v12 = 17;
LABEL_26:
      _NRLogWithArgs(v10, v12, (uint64_t)v11, v5, v6, v7, v8, v9, (uint64_t)v42);
      goto LABEL_27;
    }
    if (nrCopyLogObj_onceToken_1285 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_DEBUG))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 2, (uint64_t)"%s%.30s:%-4d Start pairing received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)");
    xpc_dictionary_get_value(xdict, "Result");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      if (MEMORY[0x1DF0BA7A8](v13) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v14);
        v16 = *(_QWORD *)(a1 + 40);
        if (!value)
        {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
LABEL_28:

          goto LABEL_29;
        }
        v26 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v26);

LABEL_43:
        v41 = (void *)+[NRDevicePairingManager copyXPCError]();
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v41);

        goto LABEL_28;
      }
      v25 = nrCopyLogObj_1274();
      if (sNRCopyLogToStdErr)
      {

LABEL_40:
        v29 = nrCopyLogObj_1274();
        v35 = v29;
        v36 = "Start pairing received invalid result type";
        goto LABEL_41;
      }
      v37 = v25;
      v38 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (v38)
        goto LABEL_40;
LABEL_42:
      v39 = *(_QWORD *)(a1 + 40);
      v40 = (void *)+[NRDevicePairingManager copyXPCError]();
      (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);

      goto LABEL_43;
    }
    v24 = nrCopyLogObj_1274();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v27 = v24;
      v28 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v28)
        goto LABEL_42;
    }
    v29 = nrCopyLogObj_1274();
    v35 = v29;
    v36 = "Start pairing received response without result code";
LABEL_41:
    _NRLogWithArgs((uint64_t)v29, 17, (uint64_t)v36, v30, v31, v32, v33, v34, (uint64_t)v42);

    goto LABEL_42;
  }
LABEL_29:

}

- (void)stopPairingForPairingManager:(void *)a3 withCompletion:
{
  _QWORD *v5;
  void (**v6)(id, void *);
  xpc_object_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _xpc_connection_s *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _QWORD handler[4];
  id v37;
  void (**v38)(id, void *);
  id v39;
  id location;
  unsigned __int8 uuid[8];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (!a1[3])
    {
      v24 = (void *)+[NRDevicePairingManager copyXPCError]();
      v6[2](v6, v24);

      goto LABEL_15;
    }
    v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      v8 = v7;
      *(_QWORD *)uuid = 0;
      v42 = 0;
      if (v5)
        v9 = (void *)v5[11];
      else
        v9 = 0;
      v10 = v9;
      objc_msgSend(v10, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getUUIDBytes:", uuid);

      xpc_dictionary_set_uuid(v8, "PairingManager", uuid);
      xpc_dictionary_set_uint64(v8, "PairingManagerOperation", 0xBuLL);
      objc_initWeak(&location, a1);
      v12 = (_xpc_connection_s *)a1[3];
      v13 = a1[4];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __73__NRDevicePairingManagerMux_stopPairingForPairingManager_withCompletion___block_invoke;
      handler[3] = &unk_1EA3F7450;
      objc_copyWeak(&v39, &location);
      v38 = v6;
      v14 = v8;
      v37 = v14;
      xpc_connection_send_message_with_reply(v12, v14, v13, handler);

      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      v15 = (id)nrCopyLogObj_sNRLogObj_1287;
      v16 = v15;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v17 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

        if (!v17)
        {
LABEL_14:

          objc_destroyWeak(&v39);
          objc_destroyWeak(&location);

          goto LABEL_15;
        }
      }
      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      v18 = (id)nrCopyLogObj_sNRLogObj_1287;
      _NRLogWithArgs((uint64_t)v18, 1, (uint64_t)"%s%.30s:%-4d Sent pairing stop message: %@", v19, v20, v21, v22, v23, (uint64_t)");

      goto LABEL_14;
    }
    v25 = nrCopyLogObj_1274();
    v26 = v25;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v27 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (!v27)
      {
LABEL_22:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v34 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v34, (uint64_t)"nr_xpc_dictionary_create");
        v35 = nrCopyLogObj_1274();
        _NRLogAbortWithPack(v35);
      }
    }
    v28 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v28, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v29, v30, v31, v32, v33, (uint64_t)");

    goto LABEL_22;
  }
LABEL_15:

}

void __73__NRDevicePairingManagerMux_stopPairingForPairingManager_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int64_t value;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  xpc_object_t xdict;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  xdict = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1DF0BA7A8](xdict);
    if (v4 != MEMORY[0x1E0C812F8])
    {
      if (v4 == MEMORY[0x1E0C81310])
      {
        if (nrCopyLogObj_onceToken_1285 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v10 = nrCopyLogObj_sNRLogObj_1287;
        v42 = "";
        v11 = "%s%.30s:%-4d Stop pairing could not deliver message %@, error %@";
        v12 = 16;
        goto LABEL_26;
      }
      if (nrCopyLogObj_onceToken_1285 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
      if ((sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_ERROR))
        && (_NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 16, (uint64_t)"%s%.30s:%-4d Stop pairing received unexpected XPC object: %@", v5, v6, v7, v8, v9, (uint64_t)"), nrCopyLogObj_onceToken_1285 != -1))
      {
        dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
        if (!sNRCopyLogToStdErr)
        {
LABEL_10:
          if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
          {
LABEL_27:
            v17 = *(_QWORD *)(a1 + 40);
            objc_opt_self();
            v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = *MEMORY[0x1E0CB2D50];
            v19 = v44;
            v45[0] = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v20);

            (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v21);
            objc_opt_self();
            v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = v19;
            v45[0] = CFSTR("An XPC connection error occurred");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v23);

            -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v14);
            goto LABEL_28;
          }
        }
      }
      else if (!sNRCopyLogToStdErr)
      {
        goto LABEL_10;
      }
      v10 = nrCopyLogObj_sNRLogObj_1287;
      v11 = "Stop pairing received unexpected XPC object";
      v12 = 17;
LABEL_26:
      _NRLogWithArgs(v10, v12, (uint64_t)v11, v5, v6, v7, v8, v9, (uint64_t)v42);
      goto LABEL_27;
    }
    if (nrCopyLogObj_onceToken_1285 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_DEBUG))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 2, (uint64_t)"%s%.30s:%-4d Stop pairing received XPC dict: %@", v5, v6, v7, v8, v9, (uint64_t)");
    xpc_dictionary_get_value(xdict, "Result");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      if (MEMORY[0x1DF0BA7A8](v13) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v14);
        v16 = *(_QWORD *)(a1 + 40);
        if (!value)
        {
          (*(void (**)(uint64_t))(v16 + 16))(v16);
LABEL_28:

          goto LABEL_29;
        }
        v26 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v26);

LABEL_43:
        v41 = (void *)+[NRDevicePairingManager copyXPCError]();
        -[NRDevicePairingManagerMux invalidateManagersWithError:]((uint64_t)WeakRetained, v41);

        goto LABEL_28;
      }
      v25 = nrCopyLogObj_1274();
      if (sNRCopyLogToStdErr)
      {

LABEL_40:
        v29 = nrCopyLogObj_1274();
        v35 = v29;
        v36 = "Stop pairing received invalid result type";
        goto LABEL_41;
      }
      v37 = v25;
      v38 = os_log_type_enabled(v25, OS_LOG_TYPE_FAULT);

      if (v38)
        goto LABEL_40;
LABEL_42:
      v39 = *(_QWORD *)(a1 + 40);
      v40 = (void *)+[NRDevicePairingManager copyXPCError]();
      (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);

      goto LABEL_43;
    }
    v24 = nrCopyLogObj_1274();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v27 = v24;
      v28 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v28)
        goto LABEL_42;
    }
    v29 = nrCopyLogObj_1274();
    v35 = v29;
    v36 = "Stop pairing received response without result code";
LABEL_41:
    _NRLogWithArgs((uint64_t)v29, 17, (uint64_t)v36, v30, v31, v32, v33, v34, (uint64_t)v42);

    goto LABEL_42;
  }
LABEL_29:

}

- (void)unpairDevice:(void *)a3 withCompletion:
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  xpc_object_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  _xpc_connection_s *v15;
  void *v16;
  os_log_t v17;
  os_log_t v18;
  _BOOL4 v19;
  void *v20;
  os_log_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  _BOOL4 v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD handler[4];
  id v47;
  uint64_t v48;
  id v49;
  void (**v50)(_QWORD, _QWORD);
  unsigned __int8 v51[8];
  uint64_t v52;
  unsigned __int8 uuid[8];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (a1)
  {
    if (!v6)
    {
      v27 = nrCopyLogObj_1274();
      v28 = v27;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v40 = os_log_type_enabled(v27, OS_LOG_TYPE_FAULT);

        if (!v40)
          goto LABEL_11;
      }
      v14 = nrCopyLogObj_1274();
      _NRLogWithArgs((uint64_t)v14, 17, (uint64_t)"%s called with null completionBlock", v41, v42, v43, v44, v45, (uint64_t)"-[NRDevicePairingManagerMux unpairDevice:withCompletion:]");
      goto LABEL_10;
    }
    if (!*(_QWORD *)(a1 + 24))
    {
      v14 = (id)+[NRDevicePairingManager copyXPCError]();
      ((void (**)(_QWORD, id))v7)[2](v7, v14);
      goto LABEL_10;
    }
    v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      v9 = v8;
      *(_QWORD *)uuid = 0;
      v54 = 0;
      xpc_dictionary_set_uuid(v8, "PairingManager", uuid);
      xpc_dictionary_set_uint64(v9, "PairingManagerOperation", 0xDuLL);
      *(_QWORD *)v51 = 0;
      v52 = 0;
      objc_msgSend(v5, "nrDeviceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getUUIDBytes:", v51);

      xpc_dictionary_set_uuid(v9, "DeviceIdentifier", v51);
      v12 = *(void **)(a1 + 24);
      v11 = *(NSObject **)(a1 + 32);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __57__NRDevicePairingManagerMux_unpairDevice_withCompletion___block_invoke;
      handler[3] = &unk_1EA3F74A0;
      v13 = v5;
      v47 = v13;
      v50 = v7;
      v48 = a1;
      v14 = v9;
      v49 = v14;
      v15 = v12;
      xpc_connection_send_message_with_reply(v15, v14, v11, handler);

      objc_msgSend(v13, "nrDeviceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = _NRCopyLogObjectForNRUUID(v16);
      v18 = v17;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v19 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

        if (!v19)
        {
LABEL_9:

LABEL_10:
          goto LABEL_11;
        }
      }
      objc_msgSend(v13, "nrDeviceIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = _NRCopyLogObjectForNRUUID(v20);
      _NRLogWithArgs((uint64_t)v21, 1, (uint64_t)"%s%.30s:%-4d Sent unpair message: %@", v22, v23, v24, v25, v26, (uint64_t)");

      goto LABEL_9;
    }
    v29 = nrCopyLogObj_1274();
    v30 = v29;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v31 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

      if (!v31)
      {
LABEL_20:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v38 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v38, (uint64_t)"nr_xpc_dictionary_create");
        v39 = nrCopyLogObj_1274();
        _NRLogAbortWithPack(v39);
      }
    }
    v32 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v32, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v33, v34, v35, v36, v37, (uint64_t)");

    goto LABEL_20;
  }
LABEL_11:

}

void __57__NRDevicePairingManagerMux_unpairDevice_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  os_log_t v6;
  os_log_t v7;
  uint64_t v8;
  void *v9;
  os_log_t v10;
  os_log_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  os_log_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  os_log_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  int64_t value;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  os_log_t v47;
  os_log_t v48;
  void *v49;
  os_log_t v50;
  os_log_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  os_log_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  os_log_t v63;
  const char *v64;
  _BOOL4 v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  xpc_object_t xdict;
  uint64_t v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x1E0C80C00];
  xdict = a2;
  v3 = MEMORY[0x1DF0BA7A8]();
  if (v3 != MEMORY[0x1E0C812F8])
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "nrDeviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _NRCopyLogObjectForNRUUID(v5);
    v7 = v6;
    if (sNRCopyLogToStdErr)
    {
      v8 = MEMORY[0x1E0C81310];

      if (v4 == v8)
        goto LABEL_17;
LABEL_9:
      objc_msgSend(*(id *)(a1 + 32), "nrDeviceIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = _NRCopyLogObjectForNRUUID(v14);
      _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d unpair received unexpected XPC object: %@", v16, v17, v18, v19, v20, (uint64_t)");
LABEL_18:

      goto LABEL_19;
    }
    v12 = MEMORY[0x1E0C81310];
    v13 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v4 == v12)
    {
      if (v13)
      {
LABEL_17:
        objc_msgSend(*(id *)(a1 + 32), "nrDeviceIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = _NRCopyLogObjectForNRUUID(v14);
        _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d unpair could not deliver message %@, error %@", v33, v34, v35, v36, v37, (uint64_t)");
        goto LABEL_18;
      }
    }
    else if (v13)
    {
      goto LABEL_9;
    }
LABEL_19:
    v38 = *(_QWORD *)(a1 + 56);
    objc_opt_self();
    v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v72 = *MEMORY[0x1E0CB2D50];
    v40 = v72;
    v73[0] = CFSTR("An XPC connection error occurred");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v39, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v41);

    (*(void (**)(uint64_t, void *))(v38 + 16))(v38, v42);
    v43 = *(_QWORD *)(a1 + 40);
    objc_opt_self();
    v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v72 = v40;
    v73[0] = CFSTR("An XPC connection error occurred");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v44, "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2019, v45);

    -[NRDevicePairingManagerMux invalidateManagersWithError:](v43, v30);
    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 32), "nrDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _NRCopyLogObjectForNRUUID(v9);
  v11 = v10;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v21 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (!v21)
      goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "nrDeviceIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = _NRCopyLogObjectForNRUUID(v22);
  _NRLogWithArgs((uint64_t)v23, 2, (uint64_t)"%s%.30s:%-4d unpair received XPC dict: %@", v24, v25, v26, v27, v28, (uint64_t)");

LABEL_12:
  xpc_dictionary_get_value(xdict, "Result");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (!v29)
  {
    objc_msgSend(*(id *)(a1 + 32), "nrDeviceIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = _NRCopyLogObjectForNRUUID(v46);
    v48 = v47;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v55 = os_log_type_enabled(v47, OS_LOG_TYPE_FAULT);

      if (!v55)
        goto LABEL_31;
    }
    objc_msgSend(*(id *)(a1 + 32), "nrDeviceIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = _NRCopyLogObjectForNRUUID(v56);
    v63 = v57;
    v64 = "unpair received response without result code";
LABEL_30:
    _NRLogWithArgs((uint64_t)v57, 17, (uint64_t)v64, v58, v59, v60, v61, v62, v70);

    goto LABEL_31;
  }
  if (MEMORY[0x1DF0BA7A8](v29) != MEMORY[0x1E0C81328])
  {
    objc_msgSend(*(id *)(a1 + 32), "nrDeviceIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = _NRCopyLogObjectForNRUUID(v49);
    v51 = v50;
    if (sNRCopyLogToStdErr)
    {

LABEL_29:
      objc_msgSend(*(id *)(a1 + 32), "nrDeviceIdentifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = _NRCopyLogObjectForNRUUID(v56);
      v63 = v57;
      v64 = "unpair received invalid result type";
      goto LABEL_30;
    }
    v65 = os_log_type_enabled(v50, OS_LOG_TYPE_FAULT);

    if (v65)
      goto LABEL_29;
LABEL_31:
    v66 = *(_QWORD *)(a1 + 56);
    v67 = (void *)+[NRDevicePairingManager copyXPCError]();
    (*(void (**)(uint64_t, void *))(v66 + 16))(v66, v67);

    v68 = *(_QWORD *)(a1 + 40);
    v69 = (void *)+[NRDevicePairingManager copyXPCError]();
    -[NRDevicePairingManagerMux invalidateManagersWithError:](v68, v69);

    goto LABEL_20;
  }
  value = xpc_int64_get_value(v30);
  v32 = *(_QWORD *)(a1 + 56);
  if (value)
  {
    v52 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, value);
    (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v52);

    v53 = *(_QWORD *)(a1 + 40);
    v54 = (void *)+[NRDevicePairingManager copyXPCError]();
    -[NRDevicePairingManagerMux invalidateManagersWithError:](v53, v54);

  }
  else
  {
    (*(void (**)(_QWORD))(v32 + 16))(*(_QWORD *)(a1 + 56));
  }
LABEL_20:

}

@end
