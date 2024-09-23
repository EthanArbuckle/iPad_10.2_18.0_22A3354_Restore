@implementation NRDevicePairingManagerMuxEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAuthRequestCompletionBlocks, 0);
  objc_storeStrong(&self->_pendingPairingResultCompletionBlock, 0);
  objc_storeStrong(&self->_pendingRegistrationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_activePairingCandidates, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
}

- (_QWORD)initWithPairingManager:(_QWORD *)a1
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
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
  objc_super v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)NRDevicePairingManagerMuxEntry;
    v5 = objc_msgSendSuper2(&v22, sel_init);
    if (v5)
    {
      a1 = v5;
      objc_storeStrong((id *)v5 + 1, a2);
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = (void *)a1[2];
      a1[2] = v6;

      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = (void *)a1[5];
      a1[5] = v8;

      goto LABEL_4;
    }
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
        *(_QWORD *)(v20 + 4) = "-[NRDevicePairingManagerMuxEntry initWithPairingManager:]";
        v21 = nrCopyLogObj_1274();
        _NRLogAbortWithPack(v21);
      }
    }
    v14 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v14, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v15, v16, v17, v18, v19, (uint64_t)");

    goto LABEL_10;
  }
LABEL_4:

  return a1;
}

- (void)handleStartPairingRequestUpdate:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  int64_t value;
  uint64_t v7;
  void *v8;
  void *v9;
  const unsigned __int8 *uuid;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const unsigned __int8 *v16;
  id *v17;
  void *v18;
  uint64_t v19;
  id *v20;
  const unsigned __int8 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const unsigned __int8 *v27;
  id v28;
  void *v29;
  id v30;
  const void *bytes_ptr;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NRDeviceIdentifier *v39;
  SEL v40;
  void *v41;
  void *v42;
  id *v43;
  _QWORD *v44;
  uint64_t v45;
  const char *v46;
  id *v47;
  id v48;
  SEL v49;
  id v50;
  id v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  uint64_t v56;
  id v57;
  void *v58;
  _BOOL4 v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  _BOOL4 v68;
  id v69;
  NSObject *v70;
  NSObject *v71;
  _BOOL4 v72;
  NSObject *v73;
  NSObject *v74;
  _BOOL4 v75;
  NSObject *v76;
  NSObject *v77;
  _BOOL4 v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  NSObject *v92;
  _BOOL4 v93;
  NSObject *v94;
  NSObject *v95;
  _BOOL4 v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  NSObject *v119;
  id v120;
  _QWORD block[5];
  id *v122;
  id v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  xpc_dictionary_get_value(v3, "Result");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4)
  {
    v52 = nrCopyLogObj_1274();
    v53 = v52;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v59 = os_log_type_enabled(v52, OS_LOG_TYPE_FAULT);

      if (!v59)
        goto LABEL_55;
    }
    v60 = nrCopyLogObj_1274();
    v66 = v60;
    v67 = "Start Pairing request received response without result code";
LABEL_54:
    _NRLogWithArgs((uint64_t)v60, 17, (uint64_t)v67, v61, v62, v63, v64, v65, v118);

    goto LABEL_55;
  }
  if (MEMORY[0x1DF0BA7A8](v4) != MEMORY[0x1E0C81328])
  {
    v54 = nrCopyLogObj_1274();
    v55 = v54;
    if (sNRCopyLogToStdErr)
    {

LABEL_53:
      v60 = nrCopyLogObj_1274();
      v66 = v60;
      v67 = "Start Pairing received invalid result type";
      goto LABEL_54;
    }
    v68 = os_log_type_enabled(v54, OS_LOG_TYPE_FAULT);

    if (v68)
      goto LABEL_53;
LABEL_55:
    v69 = *(id *)(a1 + 8);
    v58 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, -3002);
    -[NRDevicePairingManager pairingFailedWithError:](v69, v58);

    goto LABEL_56;
  }
  value = xpc_int64_get_value(v5);
  if (value)
  {
    v56 = value;
    v57 = *(id *)(a1 + 8);
    v58 = (void *)+[NRDevicePairingManager copyErrorForCode:]((uint64_t)NRDevicePairingManager, v56);
    -[NRDevicePairingManager pairingFailedWithError:](v57, v58);

LABEL_56:
    goto LABEL_44;
  }
  xpc_dictionary_get_value(v3, "PairingTarget");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7 || MEMORY[0x1DF0BA7A8](v7) != MEMORY[0x1E0C812E8])
  {
    v9 = 0;
    goto LABEL_7;
  }
  v30 = objc_alloc(MEMORY[0x1E0C99D50]);
  bytes_ptr = xpc_data_get_bytes_ptr(v8);
  v32 = objc_msgSend(v30, "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v8));
  if (!v32)
  {
    v76 = nrCopyLogObj_1274();
    v77 = v76;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v78 = os_log_type_enabled(v76, OS_LOG_TYPE_ERROR);

      if (!v78)
        goto LABEL_78;
    }
    v97 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v97, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (data) != ((void *)0)", v98, v99, v100, v101, v102, (uint64_t)");

LABEL_78:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v103 = _os_log_pack_fill();
    *(_DWORD *)v103 = 136446210;
    *(_QWORD *)(v103 + 4) = "-[NRDevicePairingManagerMuxEntry handleStartPairingRequestUpdate:]";
    goto LABEL_84;
  }
  v18 = (void *)v32;
  v120 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v32, &v120);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id *)v120;
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || v17)
  {
    if (nrCopyLogObj_onceToken_1285 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 17, (uint64_t)"Failed to unarchive NRDevicePairingTarget %@", v33, v34, v35, v36, v37, (uint64_t)v17);
    -[NRDevicePairingManager pairingFailedWithError:](*(void **)(a1 + 8), v17);
    goto LABEL_43;
  }

LABEL_7:
  uuid = xpc_dictionary_get_uuid(v3, "TargetPairingCandidate");
  if (!uuid || (v16 = uuid, uuid_is_null(uuid)))
  {
    if (nrCopyLogObj_onceToken_1285 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 17, (uint64_t)"Start Pairing request result missing pairing target UUID", v11, v12, v13, v14, v15, v118);
    v17 = (id *)*(id *)(a1 + 8);
    objc_opt_self();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -3002, 0);
    -[NRDevicePairingManager pairingFailedWithError:](v17, v18);
    goto LABEL_43;
  }
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v16);
  if (!v19)
  {
    v70 = nrCopyLogObj_1274();
    v71 = v70;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v72 = os_log_type_enabled(v70, OS_LOG_TYPE_ERROR);

      if (!v72)
        goto LABEL_83;
    }
    v79 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v79, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (targetUUID) != ((void *)0)", v80, v81, v82, v83, v84, (uint64_t)");

LABEL_83:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v116 = _os_log_pack_fill();
    *(_DWORD *)v116 = 136446210;
    *(_QWORD *)(v116 + 4) = "-[NRDevicePairingManagerMuxEntry handleStartPairingRequestUpdate:]";
LABEL_84:
    v117 = nrCopyLogObj_1274();
    _NRLogAbortWithPack(v117);
  }
  v18 = (void *)v19;
  v20 = (id *)-[NRPairedDevice initInternal]([NRPairedDevice alloc]);
  if (!v20)
  {
    v73 = nrCopyLogObj_1274();
    v74 = v73;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v75 = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);

      if (!v75)
        goto LABEL_83;
    }
    v85 = nrCopyLogObj_1274();
    _NRLogWithArgs((uint64_t)v85, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (pairedDevice) != ((void *)0)", v86, v87, v88, v89, v90, (uint64_t)");

    goto LABEL_83;
  }
  v17 = v20;
  objc_storeStrong(v20 + 1, v9);
  v21 = xpc_dictionary_get_uuid(v3, "NRUUID");
  if (v21)
  {
    v27 = v21;
    if (!uuid_is_null(v21))
    {
      v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v27);
      if (v38)
      {
        v29 = (void *)v38;
        v39 = -[NRDeviceIdentifier initWithUUID:]([NRDeviceIdentifier alloc], "initWithUUID:", v38);
        objc_setProperty_nonatomic_copy(v17, v40, v39, 16);

        objc_msgSend(v17, "nrDeviceIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          v42 = *(void **)(a1 + 8);
          v43 = v17;
          if (v42)
          {
            v44 = v42;
            objc_sync_enter(v44);
            v45 = v44[1];
            objc_sync_exit(v44);

            if (v45 == 8)
            {
              v47 = v43;
              v48 = objc_getProperty(v44, v46, 80, 1);
              objc_setProperty_atomic_copy(v44, v49, 0, 80);
              -[NRDevicePairingManager setInternalManagerState:](v44, 3);
              v119 = v44[7];
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __59__NRDevicePairingManager_pairingSucceededWithPairedDevice___block_invoke;
              block[3] = &unk_1EA3F73B8;
              block[4] = v44;
              v123 = v48;
              v122 = v47;
              v50 = v48;
              v43 = v47;
              v51 = v50;
              dispatch_async(v119, block);

            }
          }

          goto LABEL_42;
        }
        v94 = nrCopyLogObj_1274();
        v95 = v94;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v96 = os_log_type_enabled(v94, OS_LOG_TYPE_ERROR);

          if (!v96)
            goto LABEL_83;
        }
        v110 = nrCopyLogObj_1274();
        _NRLogWithArgs((uint64_t)v110, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (pairedDevice.nrDeviceIdentifier) != ((void *)0)", v111, v112, v113, v114, v115, (uint64_t)");

      }
      else
      {
        v91 = nrCopyLogObj_1274();
        v92 = v91;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v93 = os_log_type_enabled(v91, OS_LOG_TYPE_ERROR);

          if (!v93)
            goto LABEL_83;
        }
        v104 = nrCopyLogObj_1274();
        _NRLogWithArgs((uint64_t)v104, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (nrUUID) != ((void *)0)", v105, v106, v107, v108, v109, (uint64_t)");

      }
      goto LABEL_83;
    }
  }
  if (nrCopyLogObj_onceToken_1285 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1287, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1287, 17, (uint64_t)"Missing or All-zero NRUUID from %@", v22, v23, v24, v25, v26, (uint64_t)v3);
  v28 = *(id *)(a1 + 8);
  objc_opt_self();
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NRDevicePairingErrorDomain"), -2008, 0);
  -[NRDevicePairingManager pairingFailedWithError:](v28, v29);

LABEL_42:
LABEL_43:

LABEL_44:
}

@end
