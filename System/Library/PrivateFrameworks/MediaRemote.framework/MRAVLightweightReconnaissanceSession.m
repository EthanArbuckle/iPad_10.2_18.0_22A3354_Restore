@implementation MRAVLightweightReconnaissanceSession

- (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  MRRequestDetails *v14;

  v11 = a7;
  v12 = a6;
  v13 = a3;
  v14 = -[MRRequestDetails initWithName:requestID:reason:]([MRRequestDetails alloc], "initWithName:requestID:reason:", CFSTR("searchEndpointsForOutputDeviceUID"), 0, CFSTR("API"));
  -[MRAVLightweightReconnaissanceSession searchEndpointsForOutputDeviceUID:timeout:details:queue:completion:](self, "searchEndpointsForOutputDeviceUID:timeout:details:queue:completion:", v13, v14, v12, v11, a4);

}

- (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  MRBlockGuard *v25;
  void *v26;
  id v27;
  MRBlockGuard *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  BOOL v34;
  id v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  BOOL v41;
  id v42;
  void *v43;
  __CFString *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  __CFString *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  unsigned int (**v56)(void);
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  NSObject *v62;
  void *v63;
  int v64;
  void *v65;
  _BOOL4 v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v79;
  id v80;
  id v81;
  id v82;
  MRBlockGuard *v83;
  id v84;
  __CFString *v85;
  _QWORD v86[4];
  void (**v87)(_QWORD, _QWORD, _QWORD);
  _QWORD v88[4];
  const __CFString *v89;
  id v90;
  void (**v91)(_QWORD, _QWORD, _QWORD);
  uint64_t *v92;
  _QWORD v93[5];
  _QWORD v94[4];
  __CFString *v95;
  id v96;
  id v97;
  _QWORD v98[4];
  MRBlockGuard *v99;
  id v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[4];
  __CFString *v104;
  id v105;
  id v106;
  id v107;
  id v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  uint8_t buf[4];
  const __CFString *v131;
  __int16 v132;
  id v133;
  __int16 v134;
  const __CFString *v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVLightweightReconnaissanceSession.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("details"));

  if (!v14)
  {
LABEL_3:
    v14 = (id)MEMORY[0x1E0C80D38];
    v16 = MEMORY[0x1E0C80D38];
  }
LABEL_4:
  v124 = 0;
  v125 = &v124;
  v126 = 0x3032000000;
  v127 = __Block_byref_object_copy__35;
  v128 = __Block_byref_object_dispose__35;
  v129 = 0;
  v118 = 0;
  v119 = &v118;
  v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__35;
  v122 = __Block_byref_object_dispose__35;
  v123 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = 0;
  v113 = &v112;
  v114 = 0x3032000000;
  v115 = __Block_byref_object_copy__35;
  v116 = __Block_byref_object_dispose__35;
  v81 = v12;
  v117 = v81;
  v85 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchEndpointsForOutputDeviceUID"), v18);
  if (v113[5])
    -[__CFString appendFormat:](v85, "appendFormat:", CFSTR(" for %@"), v113[5]);
  objc_msgSend(v13, "reason");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v13, "reason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendFormat:](v85, "appendFormat:", CFSTR(" because %@"), v20);

  }
  _MRLogForCategory(0xAuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v131 = v85;
    _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v22 = MEMORY[0x1E0C809B0];
  v103[0] = MEMORY[0x1E0C809B0];
  v103[1] = 3221225472;
  v103[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke;
  v103[3] = &unk_1E30CD920;
  v109 = &v112;
  v104 = CFSTR("searchEndpointsForOutputDeviceUID");
  v23 = v18;
  v105 = v23;
  v80 = v17;
  v106 = v80;
  v84 = v14;
  v107 = v84;
  v79 = v15;
  v108 = v79;
  v110 = &v118;
  v111 = &v124;
  v24 = (void *)MEMORY[0x194036C44](v103);
  v25 = [MRBlockGuard alloc];
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchEndpointsForOutputDeviceUID"), v23);
  v101[0] = v22;
  v101[1] = 3221225472;
  v101[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_2;
  v101[3] = &unk_1E30C6798;
  v27 = v24;
  v102 = v27;
  v28 = -[MRBlockGuard initWithTimeout:reason:handler:](v25, "initWithTimeout:reason:handler:", v26, v101, a4);

  v98[0] = v22;
  v98[1] = 3221225472;
  v98[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_3;
  v98[3] = &unk_1E30C7C28;
  v83 = v28;
  v99 = v83;
  v82 = v27;
  v100 = v82;
  v29 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v98);
  +[MRDeviceInfoRequest localDeviceInfo](MRDeviceInfoRequest, "localDeviceInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v113[5];
  +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "compare:options:", v32, 1))
    goto LABEL_15;
  objc_msgSend(v30, "deviceUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33 == 0;

  if (!v34)
  {
    v35 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v30, "deviceUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (__CFString *)objc_msgSend(v35, "initWithFormat:", CFSTR("substituting deviceUID <%@> for outputDeviceUID..."), v36);

    _MRLogForCategory(0xAuLL);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v131 = CFSTR("searchEndpointsForOutputDeviceUID");
      v132 = 2114;
      v133 = v23;
      v134 = 2112;
      v135 = v32;
      _os_log_impl(&dword_193827000, v37, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    objc_msgSend(v30, "deviceUID");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v113[5];
    v113[5] = v38;

LABEL_15:
  }
  if (!v113[5])
  {
    objc_msgSend(v30, "deviceUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40 == 0;

    if (!v41)
    {
      v42 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v30, "deviceUID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (__CFString *)objc_msgSend(v42, "initWithFormat:", CFSTR("substituting deviceUID <%@> for outputDeviceUID..."), v43);

      _MRLogForCategory(0xAuLL);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v131 = CFSTR("searchEndpointsForOutputDeviceUID");
        v132 = 2114;
        v133 = v23;
        v134 = 2112;
        v135 = v44;
        _os_log_impl(&dword_193827000, v45, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      objc_msgSend(v30, "deviceUID");
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v113[5];
      v113[5] = v46;

    }
  }
  if (!v113[5])
  {
    v48 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (__CFString *)objc_msgSend(v48, "initWithFormat:", CFSTR("substituting deviceUID <%@> for outputDeviceUID..."), v49);

    _MRLogForCategory(0xAuLL);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v131 = CFSTR("searchEndpointsForOutputDeviceUID");
      v132 = 2114;
      v133 = v23;
      v134 = 2112;
      v135 = v50;
      _os_log_impl(&dword_193827000, v51, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)v113[5];
    v113[5] = v52;

    if (!v113[5])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVLightweightReconnaissanceSession.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDeviceUID"));

    }
  }
  v94[0] = v22;
  v94[1] = 3221225472;
  v94[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_34;
  v94[3] = &unk_1E30CD948;
  v95 = CFSTR("searchEndpointsForOutputDeviceUID");
  v54 = v23;
  v96 = v54;
  v55 = v30;
  v97 = v55;
  v56 = (unsigned int (**)(void))MEMORY[0x194036C44](v94);
  if (v56[2]())
  {
    +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:](MRAVLocalEndpoint, "sharedLocalEndpointForRoutingContextWithUID:", 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)v113[5];
    +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v58) = objc_msgSend(v58, "compare:options:", v59, 1) == 0;

    if ((_DWORD)v58)
    {
      _MRLogForCategory(0xAuLL);
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v131 = CFSTR("searchEndpointsForOutputDeviceUID");
        v132 = 2114;
        v133 = v54;
        v134 = 2112;
        v135 = CFSTR("searching for local, using localEndpoint...");
        goto LABEL_39;
      }
LABEL_40:

      ((void (**)(_QWORD, void *, _QWORD))v29)[2](v29, v57, 0);
      goto LABEL_45;
    }
    objc_msgSend(v55, "deviceUID");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "isEqualToString:", v113[5]);

    if (v61)
    {
      _MRLogForCategory(0xAuLL);
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v131 = CFSTR("searchEndpointsForOutputDeviceUID");
        v132 = 2114;
        v133 = v54;
        v134 = 2112;
        v135 = CFSTR("searching for localDeviceUID, using localEndpoint...");
LABEL_39:
        _os_log_impl(&dword_193827000, v62, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        goto LABEL_40;
      }
      goto LABEL_40;
    }
    objc_msgSend(v55, "identifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "isEqualToString:", v113[5]);

    if (v64)
    {
      _MRLogForCategory(0xAuLL);
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v131 = CFSTR("searchEndpointsForOutputDeviceUID");
        v132 = 2114;
        v133 = v54;
        v134 = 2112;
        v135 = CFSTR("searching for localIdentifier, using localEndpoint...");
        goto LABEL_39;
      }
      goto LABEL_40;
    }
    v93[0] = v22;
    v93[1] = 3221225472;
    v93[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_51;
    v93[3] = &unk_1E30CD970;
    v93[4] = &v112;
    objc_msgSend(v57, "outputDevicesMatchingPredicate:", v93);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "count") == 0;

    if (!v66)
    {
      _MRLogForCategory(0xAuLL);
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v131 = CFSTR("searchEndpointsForOutputDeviceUID");
        v132 = 2114;
        v133 = v54;
        v134 = 2112;
        v135 = CFSTR("found device in localEndpoint, using localEndpoint...");
        goto LABEL_39;
      }
      goto LABEL_40;
    }

  }
  if (MRProcessIsMediaRemoteDaemon())
  {
    +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:](MRAVRoutingDiscoverySession, "discoverySessionWithEndpointFeatures:", 8);
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = (void *)v119[5];
    v119[5] = v67;

    objc_msgSend((id)v119[5], "setDiscoveryMode:", 3);
    v69 = (void *)v119[5];
    v88[0] = v22;
    v88[1] = 3221225472;
    v88[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_56;
    v88[3] = &unk_1E30CD998;
    v92 = &v112;
    v89 = CFSTR("searchEndpointsForOutputDeviceUID");
    v90 = v54;
    v91 = v29;
    objc_msgSend(v69, "addEndpointsChangedCallback:", v88);
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = (void *)v125[5];
    v125[5] = v70;

    v57 = (void *)v89;
  }
  else
  {
    MRCreateXPCMessage(0x300000000000030uLL);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_double(v57, "timeout", a4);
    objc_msgSend(v13, "data");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    MRAddDataToXPCMessage(v57, v72, "MRXPC_REQUEST_DETAILS");

    MRAddStringToXPCMessage(v57, (id)v113[5], "outputDeviceID");
    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "service");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "mrXPCConnection");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v22;
    v86[1] = 3221225472;
    v86[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_64;
    v86[3] = &unk_1E30C6C80;
    v87 = v29;
    objc_msgSend(v75, "sendMessage:queue:reply:", v57, v84, v86);

  }
LABEL_45:

  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v118, 8);

  _Block_object_dispose(&v124, 8);
}

void __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  _QWORD block[4];
  id v44;
  id v45;
  id v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "debugName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v26 = *(_QWORD *)(a1 + 32);
        v27 = *(_QWORD *)(a1 + 40);
        v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138544130;
        v49 = v26;
        v50 = 2114;
        v51 = v27;
        v52 = 2114;
        v53 = v28;
        v54 = 2048;
        v55 = v29;
        v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v31 = v8;
        v32 = 42;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v36 = *(_QWORD *)(a1 + 32);
        v37 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138543874;
        v49 = v36;
        v50 = 2114;
        v51 = v37;
        v52 = 2048;
        v53 = v38;
        v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v31 = v8;
        v32 = 32;
      }
      _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      goto LABEL_20;
    }
    if (v16)
    {
      if (!v17)
        goto LABEL_21;
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "debugName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544386;
      v49 = v18;
      v50 = 2114;
      v51 = v19;
      v52 = 2112;
      v53 = v13;
      v54 = 2114;
      v55 = v20;
      v56 = 2048;
      v57 = v22;
      v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v24 = v8;
      v25 = 52;
    }
    else
    {
      if (!v17)
        goto LABEL_21;
      v33 = *(_QWORD *)(a1 + 32);
      v34 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "debugName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      v49 = v33;
      v50 = 2114;
      v51 = v34;
      v52 = 2112;
      v53 = v13;
      v54 = 2048;
      v55 = v35;
      v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v24 = v8;
      v25 = 42;
    }
    _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

    goto LABEL_20;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544386;
      v49 = v10;
      v50 = 2114;
      v51 = v11;
      v52 = 2114;
      v53 = v6;
      v54 = 2114;
      v55 = v12;
      v56 = 2048;
      v57 = v14;
      _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    }
  }
  else if (v9)
  {
    __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_cold_1(a1, v6, v8);
  }
LABEL_21:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_22;
  block[3] = &unk_1E30CD8F8;
  v39 = *(NSObject **)(a1 + 56);
  v40 = *(id *)(a1 + 64);
  v45 = v6;
  v46 = v40;
  v44 = v5;
  v47 = *(_OWORD *)(a1 + 80);
  v41 = v6;
  v42 = v5;
  dispatch_async(v39, block);

}

uint64_t __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_22(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = a1[6];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, a1[4], a1[5]);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setDiscoveryMode:", 0);
  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "removeEndpointsChangedCallback:");
  return result;
}

uint64_t __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_34(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[MRAVClusterController sharedController](MRAVClusterController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "clusterStatus");

  if (v3 == 2)
  {
    _MRLogForCategory(0xAuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v14 = 138543874;
      v15 = v5;
      v16 = 2114;
      v17 = v6;
      v18 = 2112;
      v19 = CFSTR("Not short-circuiting because cluster secondary");
LABEL_10:
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else if ((objc_msgSend(*(id *)(a1 + 48), "isGroupLeader") & 1) != 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 48), "isAirPlayActive"))
    {
      +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "supportMultiplayerHost");

      return v13 ^ 1u;
    }
    _MRLogForCategory(0xAuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v14 = 138543874;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      v18 = 2112;
      v19 = CFSTR("Not short-circuiting because secondary");
      goto LABEL_10;
    }
  }
  else
  {
    _MRLogForCategory(0xAuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v14 = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v18 = 2112;
      v19 = CFSTR("Not short-circuiting not group leader");
      goto LABEL_10;
    }
  }

  return 0;
}

uint64_t __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_51(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

void __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_56(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "containsOutputDeviceWithUID:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), (_QWORD)v11))
        {
          _MRLogForCategory(0xAuLL);
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v9 = a1[4];
            v10 = a1[5];
            *(_DWORD *)buf = 138543874;
            v16 = v9;
            v17 = 2114;
            v18 = v10;
            v19 = 2112;
            v20 = CFSTR("found device in discovery");
            _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
          }

          (*(void (**)(void))(a1[6] + 16))();
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

}

void __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  MREndpointFromXPCMessage(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)searchEndpointsForString:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  MRAVLightweightReconnaissanceSession *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  __CFString *v34;
  id v35;
  id v36;
  id v37;
  __int128 *v38;
  _QWORD v39[4];
  id v40;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVLightweightReconnaissanceSession.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchEndpointsWithString"), v19);
  v21 = v20;
  if (v13)
    objc_msgSend(v20, "appendFormat:", CFSTR(" for %@"), v13);
  if (v14)
    objc_msgSend(v21, "appendFormat:", CFSTR(" because %@"), v14);
  _MRLogForCategory(0xAuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v21;
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v31 = v21;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__35;
  v45 = __Block_byref_object_dispose__35;
  v46 = 0;
  v23 = v15;
  v24 = self;
  v25 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __97__MRAVLightweightReconnaissanceSession_searchEndpointsForString_timeout_reason_queue_completion___block_invoke;
  v39[3] = &unk_1E30CD9C0;
  v40 = v13;
  p_buf = &buf;
  v32[0] = v25;
  v32[1] = 3221225472;
  v32[2] = __97__MRAVLightweightReconnaissanceSession_searchEndpointsForString_timeout_reason_queue_completion___block_invoke_2;
  v32[3] = &unk_1E30CD9E8;
  v26 = v40;
  v33 = v26;
  v34 = CFSTR("searchEndpointsWithString");
  v27 = v19;
  v35 = v27;
  v28 = v17;
  v36 = v28;
  v29 = v16;
  v37 = v29;
  v38 = &buf;
  -[MRAVLightweightReconnaissanceSession searchEndpointsWithPredicate:timeout:reason:queue:completion:](v24, "searchEndpointsWithPredicate:timeout:reason:queue:completion:", v39, v14, v23, v32, a4);

  _Block_object_dispose(&buf, 8);
}

uint64_t __97__MRAVLightweightReconnaissanceSession_searchEndpointsForString_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  MRAVDistantOutputDevice *v34;
  void *v35;
  MRAVDistantOutputDevice *v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  char v49;
  void *v50;
  char v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
    goto LABEL_4;
  objc_msgSend(v3, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7
    || (objc_msgSend(v3, "debugName"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32)),
        v8,
        v9))
  {
LABEL_4:
    objc_msgSend(v3, "groupLeader");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

LABEL_5:
    v13 = 1;
  }
  else
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v3, "outputDevices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v68;
      v55 = *(_QWORD *)v68;
      while (2)
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v68 != v18)
            objc_enumerationMutation(v15);
          v56 = v19;
          v20 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v19);
          objc_msgSend(v20, "uid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if (v22)
            goto LABEL_40;
          objc_msgSend(v20, "groupID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if (v24)
            goto LABEL_40;
          objc_msgSend(v20, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if (v26
            || (objc_msgSend(v20, "bluetoothID"),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                v28 = objc_msgSend(v27, "isEqualToString:", *(_QWORD *)(a1 + 32)),
                v27,
                v28))
          {
LABEL_40:
            v52 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v53 = v20;
            obj = *(id *)(v52 + 40);
            *(_QWORD *)(v52 + 40) = v53;
LABEL_41:

            goto LABEL_5;
          }
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          objc_msgSend(v20, "clusterComposition");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v64;
            v57 = v15;
            v54 = v17;
            while (2)
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v64 != v31)
                  objc_enumerationMutation(obj);
                v33 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                v34 = [MRAVDistantOutputDevice alloc];
                objc_msgSend(v33, "descriptor");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = -[MRAVDistantOutputDevice initWithDescriptor:](v34, "initWithDescriptor:", v35);

                objc_msgSend(v33, "uid");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "isEqualToString:", *(_QWORD *)(a1 + 32));

                if ((v38 & 1) != 0
                  || (objc_msgSend(v33, "name"),
                      v39 = (void *)objc_claimAutoreleasedReturnValue(),
                      v40 = objc_msgSend(v39, "isEqualToString:", *(_QWORD *)(a1 + 32)),
                      v39,
                      (v40 & 1) != 0))
                {
                  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v36);

                  v15 = v57;
                  goto LABEL_41;
                }

              }
              v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
              v15 = v57;
              v17 = v54;
              if (v30)
                continue;
              break;
            }
          }

          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          objc_msgSend(v20, "roomOutputDevices");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v60;
            while (2)
            {
              for (j = 0; j != v42; ++j)
              {
                if (*(_QWORD *)v60 != v43)
                  objc_enumerationMutation(obj);
                v45 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
                objc_msgSend(v45, "uid");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v46, "isEqualToString:", *(_QWORD *)(a1 + 32));

                if ((v47 & 1) != 0)
                  goto LABEL_39;
                objc_msgSend(v45, "name");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend(v48, "isEqualToString:", *(_QWORD *)(a1 + 32));

                if ((v49 & 1) == 0)
                {
                  objc_msgSend(v45, "roomID");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = objc_msgSend(v50, "isEqualToString:", *(_QWORD *)(a1 + 32));

                  if ((v51 & 1) == 0)
                    continue;
                }
LABEL_39:
                objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v45);
                goto LABEL_41;
              }
              v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
              if (v42)
                continue;
              break;
            }
          }

          v18 = v55;
          v19 = v56 + 1;
        }
        while (v56 + 1 != v17);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
        if (v17)
          continue;
        break;
      }
    }

    v13 = 0;
  }

  return v13;
}

void __97__MRAVLightweightReconnaissanceSession_searchEndpointsForString_timeout_reason_queue_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "debugName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = a1[4];
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v27 = a1[5];
        v26 = a1[6];
        v28 = (void *)a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
        v39 = 138544130;
        v40 = v27;
        v41 = 2114;
        v42 = v26;
        v43 = 2114;
        v44 = v28;
        v45 = 2048;
        v46 = v29;
        v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v31 = v8;
        v32 = 42;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v36 = a1[5];
        v37 = a1[6];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
        v39 = 138543874;
        v40 = v36;
        v41 = 2114;
        v42 = v37;
        v43 = 2048;
        v44 = v38;
        v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v31 = v8;
        v32 = 32;
      }
      _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v39, v32);
      goto LABEL_20;
    }
    if (v16)
    {
      if (!v17)
        goto LABEL_21;
      v18 = a1[5];
      v19 = a1[6];
      objc_msgSend(v5, "debugName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", a1[7]);
      v39 = 138544386;
      v40 = v18;
      v41 = 2114;
      v42 = v19;
      v43 = 2112;
      v44 = v13;
      v45 = 2114;
      v46 = v20;
      v47 = 2048;
      v48 = v22;
      v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v24 = v8;
      v25 = 52;
    }
    else
    {
      if (!v17)
        goto LABEL_21;
      v33 = a1[5];
      v34 = a1[6];
      objc_msgSend(v5, "debugName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", a1[7]);
      v39 = 138544130;
      v40 = v33;
      v41 = 2114;
      v42 = v34;
      v43 = 2112;
      v44 = v13;
      v45 = 2048;
      v46 = v35;
      v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v24 = v8;
      v25 = 42;
    }
    _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v39, v25);

    goto LABEL_20;
  }
  v7 = a1[4];
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      v11 = a1[5];
      v10 = a1[6];
      v12 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
      v39 = 138544386;
      v40 = v11;
      v41 = 2114;
      v42 = v10;
      v43 = 2114;
      v44 = v6;
      v45 = 2114;
      v46 = v12;
      v47 = 2048;
      v48 = v14;
      _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v39, 0x34u);
LABEL_20:

    }
  }
  else if (v9)
  {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v8);
  }
LABEL_21:

  (*(void (**)(void))(a1[8] + 16))();
}

- (void)searchEndpointsWithPredicate:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  MRBlockGuard *v22;
  id v23;
  MRBlockGuard *v24;
  id v25;
  MRBlockGuard *v26;
  id v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  MRBlockGuard *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (!v13)
  {
    v13 = (id)MEMORY[0x1E0C80D38];
    v15 = MEMORY[0x1E0C80D38];
  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__35;
  v45 = __Block_byref_object_dispose__35;
  v46 = 0;
  +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:](MRAVRoutingDiscoverySession, "discoverySessionWithEndpointFeatures:", 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDiscoveryMode:", 3);
  v17 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke;
  v36[3] = &unk_1E30CDA38;
  v18 = v13;
  v37 = v18;
  v19 = v14;
  v39 = v19;
  v20 = v16;
  v38 = v20;
  v40 = &v41;
  v21 = (void *)MEMORY[0x194036C44](v36);
  v22 = [MRBlockGuard alloc];
  v34[0] = v17;
  v34[1] = 3221225472;
  v34[2] = __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke_3;
  v34[3] = &unk_1E30C6798;
  v23 = v21;
  v35 = v23;
  v24 = -[MRBlockGuard initWithTimeout:reason:handler:](v22, "initWithTimeout:reason:handler:", v12, v34, a4);
  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke_4;
  v30[3] = &unk_1E30CDA60;
  v25 = v11;
  v32 = v25;
  v26 = v24;
  v31 = v26;
  v27 = v23;
  v33 = v27;
  objc_msgSend(v20, "addEndpointsChangedCallback:", v30);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v42[5];
  v42[5] = v28;

  _Block_object_dispose(&v41, 8);
}

void __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke_2;
  block[3] = &unk_1E30CDA10;
  v16 = *(id *)(a1 + 48);
  v13 = v5;
  v14 = v6;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 56);
  v15 = v8;
  v17 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

uint64_t __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 48), "setDiscoveryMode:", 0);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    return objc_msgSend(*(id *)(a1 + 48), "removeEndpointsChangedCallback:");
  return result;
}

uint64_t __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __101__MRAVLightweightReconnaissanceSession_searchEndpointsWithPredicate_timeout_reason_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40)))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "disarm", (_QWORD)v8))
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)searchEndpointsForGroupUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  MRBlockGuard *v25;
  void *v26;
  id v27;
  MRBlockGuard *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  MRBlockGuard *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  MRBlockGuard *v60;
  __CFString *v61;
  id v62;
  id v63;
  uint64_t *v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  __CFString *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint8_t buf[4];
  const __CFString *v89;
  __int16 v90;
  id v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v58 = a5;
  v12 = a6;
  v13 = a7;
  if (!v12)
  {
    v12 = (id)MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
  }
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__35;
  v86 = __Block_byref_object_dispose__35;
  v57 = v11;
  v87 = v57;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__35;
  v80 = __Block_byref_object_dispose__35;
  v81 = 0;
  +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:](MRAVRoutingDiscoverySession, "discoverySessionWithEndpointFeatures:", 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDiscoveryMode:", 2);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchEndpointsForGroupUID"), v18);
  v20 = v19;
  if (v83[5])
    -[__CFString appendFormat:](v19, "appendFormat:", CFSTR(" for %@"), v83[5]);
  if (v58)
    -[__CFString appendFormat:](v20, "appendFormat:", CFSTR(" because %@"), v58);
  _MRLogForCategory(0xAuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v89 = v20;
    _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke;
  v67[3] = &unk_1E30CDA88;
  v74 = &v82;
  v68 = CFSTR("searchEndpointsForGroupUID");
  v22 = v18;
  v69 = v22;
  v56 = v16;
  v70 = v56;
  v54 = v12;
  v71 = v54;
  v55 = v13;
  v73 = v55;
  v23 = v15;
  v72 = v23;
  v75 = &v76;
  v24 = (void *)MEMORY[0x194036C44](v67);
  v25 = [MRBlockGuard alloc];
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchEndpointsForGroupUID"), v22);
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke_2;
  v65[3] = &unk_1E30C6798;
  v27 = v24;
  v66 = v27;
  v28 = -[MRBlockGuard initWithTimeout:reason:handler:](v25, "initWithTimeout:reason:handler:", v26, v65, a4);

  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRDeviceInfoRequest deviceInfoForOrigin:](MRDeviceInfoRequest, "deviceInfoForOrigin:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v83[5])
  {
    objc_msgSend(v30, "groupUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31 == 0;

    if (!v32)
    {
      v33 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v30, "groupUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v33, "initWithFormat:", CFSTR("substituting groupID <%@> for nil..."), v34);

      _MRLogForCategory(0xAuLL);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v89 = CFSTR("searchEndpointsForGroupUID");
        v90 = 2114;
        v91 = v22;
        v92 = 2112;
        v93 = v35;
        _os_log_impl(&dword_193827000, v36, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      objc_msgSend(v30, "groupUID");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v83[5];
      v83[5] = v37;

    }
  }
  objc_msgSend(v30, "groupUID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v83[5];
    +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = objc_msgSend(v40, "compare:options:", v41, 1) == 0;

    if ((_DWORD)v40)
    {
      v42 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v30, "groupUID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v42, "initWithFormat:", CFSTR("substituting group <%@> for %@..."), v43, v44);

      _MRLogForCategory(0xAuLL);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v89 = CFSTR("searchEndpointsForGroupUID");
        v90 = 2114;
        v91 = v22;
        v92 = 2112;
        v93 = v45;
        _os_log_impl(&dword_193827000, v46, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      objc_msgSend(v30, "groupUID");
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v83[5];
      v83[5] = v47;

    }
  }
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke_81;
  v59[3] = &unk_1E30CDAB0;
  v64 = &v82;
  v49 = v28;
  v60 = v49;
  v61 = CFSTR("searchEndpointsForGroupUID");
  v50 = v22;
  v62 = v50;
  v51 = v27;
  v63 = v51;
  objc_msgSend(v23, "addEndpointsChangedCallback:", v59);
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v77[5];
  v77[5] = v52;

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v82, 8);

}

void __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "debugName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v26 = *(_QWORD *)(a1 + 32);
        v27 = *(_QWORD *)(a1 + 40);
        v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138544130;
        v51 = v26;
        v52 = 2114;
        v53 = v27;
        v54 = 2114;
        v55 = v28;
        v56 = 2048;
        v57 = v29;
        v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v31 = v8;
        v32 = 42;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v36 = *(_QWORD *)(a1 + 32);
        v37 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138543874;
        v51 = v36;
        v52 = 2114;
        v53 = v37;
        v54 = 2048;
        v55 = v38;
        v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v31 = v8;
        v32 = 32;
      }
      _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      goto LABEL_20;
    }
    if (v16)
    {
      if (!v17)
        goto LABEL_21;
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "debugName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544386;
      v51 = v18;
      v52 = 2114;
      v53 = v19;
      v54 = 2112;
      v55 = v13;
      v56 = 2114;
      v57 = v20;
      v58 = 2048;
      v59 = v22;
      v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v24 = v8;
      v25 = 52;
    }
    else
    {
      if (!v17)
        goto LABEL_21;
      v33 = *(_QWORD *)(a1 + 32);
      v34 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "debugName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      v51 = v33;
      v52 = 2114;
      v53 = v34;
      v54 = 2112;
      v55 = v13;
      v56 = 2048;
      v57 = v35;
      v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v24 = v8;
      v25 = 42;
    }
    _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

    goto LABEL_20;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544386;
      v51 = v10;
      v52 = 2114;
      v53 = v11;
      v54 = 2114;
      v55 = v6;
      v56 = 2114;
      v57 = v12;
      v58 = 2048;
      v59 = v14;
      _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    }
  }
  else if (v9)
  {
    __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_cold_1(a1, v6, v8);
  }
LABEL_21:

  v39 = *(NSObject **)(a1 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke_75;
  block[3] = &unk_1E30CDA10;
  v48 = *(id *)(a1 + 72);
  v45 = v5;
  v46 = v6;
  v40 = *(id *)(a1 + 64);
  v41 = *(_QWORD *)(a1 + 88);
  v47 = v40;
  v49 = v41;
  v42 = v6;
  v43 = v5;
  dispatch_async(v39, block);

}

uint64_t __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke_75(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 48), "setDiscoveryMode:", 0);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    return objc_msgSend(*(id *)(a1 + 48), "removeEndpointsChangedCallback:");
  return result;
}

uint64_t __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __99__MRAVLightweightReconnaissanceSession_searchEndpointsForGroupUID_timeout_reason_queue_completion___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "outputDevices", (_QWORD)v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "groupID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

        if (v11)
        {
          if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
          {
            _MRLogForCategory(0xAuLL);
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v13 = *(_QWORD *)(a1 + 40);
              v14 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 138543874;
              v20 = v13;
              v21 = 2114;
              v22 = v14;
              v23 = 2112;
              v24 = CFSTR("found device in discovery");
              _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }

            (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          }
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

}

- (void)searchEndpointsForCompanionWithTimeout:(double)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  MRBlockGuard *v24;
  void *v25;
  id v26;
  MRBlockGuard *v27;
  MRBlockGuard *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  MRBlockGuard *v36;
  __CFString *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  __CFString *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v34 = a4;
  v9 = a5;
  v10 = a6;
  if (!v9)
  {
    v9 = (id)MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
  }
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__35;
  v54 = __Block_byref_object_dispose__35;
  v55 = 0;
  +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:](MRAVRoutingDiscoverySession, "discoverySessionWithEndpointFeatures:", 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDiscoveryMode:", 2);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchEndpointsForCompanion"), v15);
  if (v34)
    objc_msgSend(v33, "appendFormat:", CFSTR(" because %@"), v34);
  _MRLogForCategory(0xAuLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v57 = v33;
    _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke;
  v42[3] = &unk_1E30CDAD8;
  v43 = CFSTR("searchEndpointsForCompanion");
  v18 = v15;
  v44 = v18;
  v19 = v13;
  v45 = v19;
  v20 = v9;
  v46 = v20;
  v21 = v10;
  v48 = v21;
  v22 = v12;
  v47 = v22;
  v49 = &v50;
  v23 = (void *)MEMORY[0x194036C44](v42);
  v24 = [MRBlockGuard alloc];
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchEndpointsForCompanion"), v18);
  v40[0] = v17;
  v40[1] = 3221225472;
  v40[2] = __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke_2;
  v40[3] = &unk_1E30C6798;
  v26 = v23;
  v41 = v26;
  v27 = -[MRBlockGuard initWithTimeout:reason:handler:](v24, "initWithTimeout:reason:handler:", v25, v40, a3);

  v35[0] = v17;
  v35[1] = 3221225472;
  v35[2] = __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke_3;
  v35[3] = &unk_1E30CB0E8;
  v28 = v27;
  v36 = v28;
  v37 = CFSTR("searchEndpointsForCompanion");
  v29 = v18;
  v38 = v29;
  v30 = v26;
  v39 = v30;
  objc_msgSend(v22, "addEndpointsChangedCallback:", v35);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v51[5];
  v51[5] = v31;

  _Block_object_dispose(&v50, 8);
}

void __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "debugName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _MRLogForCategory(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (!v9)
        goto LABEL_10;
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "debugName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      v30 = v10;
      v31 = 2114;
      v32 = v11;
      v33 = 2112;
      v34 = v12;
      v35 = 2048;
      v36 = v14;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", buf, 0x2Au);

    }
    else
    {
      if (!v9)
        goto LABEL_10;
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138543874;
      v30 = v15;
      v31 = 2114;
      v32 = v16;
      v33 = 2048;
      v34 = v17;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
    }

    goto LABEL_10;
  }
  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_cold_1(a1, v6, v7);
LABEL_10:

  v18 = *(NSObject **)(a1 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke_84;
  block[3] = &unk_1E30CDA10;
  v27 = *(id *)(a1 + 72);
  v24 = v5;
  v25 = v6;
  v19 = *(id *)(a1 + 64);
  v20 = *(_QWORD *)(a1 + 80);
  v26 = v19;
  v28 = v20;
  v21 = v6;
  v22 = v5;
  dispatch_async(v18, block);

}

uint64_t __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke_84(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 48), "setDiscoveryMode:", 0);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    return objc_msgSend(*(id *)(a1 + 48), "removeEndpointsChangedCallback:");
  return result;
}

uint64_t __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __103__MRAVLightweightReconnaissanceSession_searchEndpointsForCompanionWithTimeout_reason_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isCompanionEndpoint", (_QWORD)v11))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
          {
            _MRLogForCategory(0xAuLL);
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              v9 = *(_QWORD *)(a1 + 40);
              v10 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 138543874;
              v16 = v9;
              v17 = 2114;
              v18 = v10;
              v19 = 2112;
              v20 = CFSTR("found device in discovery");
              _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }

            (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          }
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

}

- (void)searchEndpointsForLeaderOutputDeviceUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  MRBlockGuard *v26;
  void *v27;
  id v28;
  MRBlockGuard *v29;
  void *v30;
  id v31;
  MRBlockGuard *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  MRBlockGuard *v43;
  __CFString *v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  __CFString *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[4];
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v39 = a5;
  v12 = a6;
  v13 = a7;
  if (!v12)
  {
    v12 = (id)MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
  }
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__35;
  v62 = __Block_byref_object_dispose__35;
  v63 = 0;
  +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:](MRAVRoutingDiscoverySession, "discoverySessionWithEndpointFeatures:", 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDiscoveryMode:", 3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchEndpointsForLeaderOutputDeviceUID"), v18);
  if (v11)
    objc_msgSend(v40, "appendFormat:", CFSTR(" for %@"), v11);
  if (v39)
    objc_msgSend(v40, "appendFormat:", CFSTR(" because %@"), v39);
  _MRLogForCategory(0xAuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v65 = v40;
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v20 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke;
  v49[3] = &unk_1E30CDB00;
  v21 = v11;
  v50 = v21;
  v51 = CFSTR("searchEndpointsForLeaderOutputDeviceUID");
  v22 = v18;
  v52 = v22;
  v23 = v16;
  v53 = v23;
  v37 = v12;
  v54 = v37;
  v38 = v13;
  v56 = v38;
  v24 = v15;
  v55 = v24;
  v57 = &v58;
  v25 = (void *)MEMORY[0x194036C44](v49);
  v26 = [MRBlockGuard alloc];
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchEndpointsForLeaderOutputDeviceUID"), v22);
  v47[0] = v20;
  v47[1] = 3221225472;
  v47[2] = __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_2;
  v47[3] = &unk_1E30C6798;
  v28 = v25;
  v48 = v28;
  v29 = -[MRBlockGuard initWithTimeout:reason:handler:](v26, "initWithTimeout:reason:handler:", v27, v47, a4);

  +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:](MRAVLocalEndpoint, "sharedLocalEndpointForRoutingContextWithUID:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    (*((void (**)(id, void *, _QWORD))v28 + 2))(v28, v30, 0);
  v41[0] = v20;
  v41[1] = 3221225472;
  v41[2] = __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_3;
  v41[3] = &unk_1E30CB110;
  v31 = v21;
  v42 = v31;
  v32 = v29;
  v43 = v32;
  v44 = CFSTR("searchEndpointsForLeaderOutputDeviceUID");
  v33 = v22;
  v45 = v33;
  v34 = v28;
  v46 = v34;
  objc_msgSend(v24, "addEndpointsChangedCallback:", v41);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v59[5];
  v59[5] = v35;

  _Block_object_dispose(&v58, 8);
}

void __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "debugName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(a1 + 32);
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v27 = *(_QWORD *)(a1 + 40);
        v26 = *(_QWORD *)(a1 + 48);
        v28 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544130;
        v51 = v27;
        v52 = 2114;
        v53 = v26;
        v54 = 2114;
        v55 = v28;
        v56 = 2048;
        v57 = v29;
        v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v31 = v8;
        v32 = 42;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v36 = *(_QWORD *)(a1 + 40);
        v37 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138543874;
        v51 = v36;
        v52 = 2114;
        v53 = v37;
        v54 = 2048;
        v55 = v38;
        v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v31 = v8;
        v32 = 32;
      }
      _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      goto LABEL_20;
    }
    if (v16)
    {
      if (!v17)
        goto LABEL_21;
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "debugName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v51 = v18;
      v52 = 2114;
      v53 = v19;
      v54 = 2112;
      v55 = v13;
      v56 = 2114;
      v57 = v20;
      v58 = 2048;
      v59 = v22;
      v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v24 = v8;
      v25 = 52;
    }
    else
    {
      if (!v17)
        goto LABEL_21;
      v33 = *(_QWORD *)(a1 + 40);
      v34 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "debugName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v51 = v33;
      v52 = 2114;
      v53 = v34;
      v54 = 2112;
      v55 = v13;
      v56 = 2048;
      v57 = v35;
      v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v24 = v8;
      v25 = 42;
    }
    _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

    goto LABEL_20;
  }
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      v11 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v51 = v11;
      v52 = 2114;
      v53 = v10;
      v54 = 2114;
      v55 = v6;
      v56 = 2114;
      v57 = v12;
      v58 = 2048;
      v59 = v14;
      _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    }
  }
  else if (v9)
  {
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v8);
  }
LABEL_21:

  v39 = *(NSObject **)(a1 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_87;
  block[3] = &unk_1E30CDA10;
  v48 = *(id *)(a1 + 80);
  v45 = v5;
  v46 = v6;
  v40 = *(id *)(a1 + 72);
  v41 = *(_QWORD *)(a1 + 88);
  v47 = v40;
  v49 = v41;
  v42 = v6;
  v43 = v5;
  dispatch_async(v39, block);

}

uint64_t __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_87(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 48), "setDiscoveryMode:", 0);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    return objc_msgSend(*(id *)(a1 + 48), "removeEndpointsChangedCallback:");
  return result;
}

uint64_t __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v25;
    *(_QWORD *)&v5 = 138543874;
    v22 = v5;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "designatedGroupLeader", v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "supportsMultiplayer");

        if (v11)
        {
          objc_msgSend(v9, "outputDevices");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_4;
          v23[3] = &unk_1E30C5F68;
          v23[4] = v9;
          objc_msgSend(v12, "msv_firstWhere:", v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v13, "containsUID:", *(_QWORD *)(a1 + 32))
            && objc_msgSend(*(id *)(a1 + 40), "disarm"))
          {
            _MRLogForCategory(0xAuLL);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = *(_QWORD *)(a1 + 48);
              v16 = *(_QWORD *)(a1 + 56);
              *(_DWORD *)buf = v22;
              v29 = v15;
              v30 = 2114;
              v31 = v16;
              v32 = 2112;
              v33 = CFSTR("found multiplayer device in discovery");
              _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }

            (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          }

        }
        else
        {
          objc_msgSend(v9, "designatedGroupLeader");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsUID:", *(_QWORD *)(a1 + 32));

          if (v18)
          {
            if (objc_msgSend(*(id *)(a1 + 40), "disarm"))
            {
              _MRLogForCategory(0xAuLL);
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                v20 = *(_QWORD *)(a1 + 48);
                v21 = *(_QWORD *)(a1 + 56);
                *(_DWORD *)buf = v22;
                v29 = v20;
                v30 = 2114;
                v31 = v21;
                v32 = 2112;
                v33 = CFSTR("found device in discovery");
                _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
              }

              (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
            }
            goto LABEL_21;
          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_21:

}

uint64_t __112__MRAVLightweightReconnaissanceSession_searchEndpointsForLeaderOutputDeviceUID_timeout_reason_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "designatedGroupLeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsUID:", v5);

  return v6;
}

- (void)searchForOutputDeviceUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  MRBlockGuard *v26;
  void *v27;
  id v28;
  MRBlockGuard *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  id v35;
  void *v36;
  __CFString *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  MRBlockGuard *v52;
  __CFString *v53;
  id v54;
  id v55;
  uint64_t *v56;
  _QWORD v57[5];
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  __CFString *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint8_t buf[4];
  const __CFString *v82;
  __int16 v83;
  id v84;
  __int16 v85;
  const __CFString *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v50 = a5;
  v12 = a6;
  v13 = a7;
  if (!v12)
  {
    v12 = (id)MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
  }
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__35;
  v79 = __Block_byref_object_dispose__35;
  v49 = v11;
  v80 = v49;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__35;
  v73 = __Block_byref_object_dispose__35;
  v74 = 0;
  +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:](MRAVRoutingDiscoverySession, "discoverySessionWithEndpointFeatures:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchForOutputDeviceUID"), v18);
  v20 = v19;
  if (v76[5])
    -[__CFString appendFormat:](v19, "appendFormat:", CFSTR(" for %@"), v76[5]);
  if (v50)
    -[__CFString appendFormat:](v20, "appendFormat:", CFSTR(" because %@"), v50);
  _MRLogForCategory(0xAuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v82 = v20;
    _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v22 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke;
  v60[3] = &unk_1E30CDB28;
  v67 = &v75;
  v61 = CFSTR("searchForOutputDeviceUID");
  v23 = v18;
  v62 = v23;
  v48 = v16;
  v63 = v48;
  v24 = v15;
  v64 = v24;
  v68 = &v69;
  v47 = v13;
  v66 = v47;
  v46 = v12;
  v65 = v46;
  v25 = (void *)MEMORY[0x194036C44](v60);
  v26 = [MRBlockGuard alloc];
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchForOutputDeviceUID"), v23);
  v58[0] = v22;
  v58[1] = 3221225472;
  v58[2] = __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_2;
  v58[3] = &unk_1E30C6798;
  v28 = v25;
  v59 = v28;
  v29 = -[MRBlockGuard initWithTimeout:reason:handler:](v26, "initWithTimeout:reason:handler:", v27, v58, a4);

  +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:](MRAVLocalEndpoint, "sharedLocalEndpointForRoutingContextWithUID:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRDeviceInfoRequest deviceInfoForOrigin:](MRDeviceInfoRequest, "deviceInfoForOrigin:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v76[5])
  {
    objc_msgSend(v32, "deviceUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33 == 0;

    if (!v34)
    {
      v35 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v32, "deviceUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (__CFString *)objc_msgSend(v35, "initWithFormat:", CFSTR("substituting deviceUID <%@> for outputDeviceUID..."), v36);

      _MRLogForCategory(0xAuLL);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v82 = CFSTR("searchForOutputDeviceUID");
        v83 = 2114;
        v84 = v23;
        v85 = 2112;
        v86 = v37;
        _os_log_impl(&dword_193827000, v38, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      objc_msgSend(v32, "deviceUID");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v76[5];
      v76[5] = v39;

    }
  }
  v57[0] = v22;
  v57[1] = 3221225472;
  v57[2] = __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_94;
  v57[3] = &unk_1E30CD970;
  v57[4] = &v75;
  objc_msgSend(v30, "outputDevicesMatchingPredicate:", v57);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v41, "count"))
  {
    objc_msgSend(v24, "setDiscoveryMode:", 3);
    v51[0] = v22;
    v51[1] = 3221225472;
    v51[2] = __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_97;
    v51[3] = &unk_1E30CDAB0;
    v56 = &v75;
    v52 = v29;
    v53 = CFSTR("searchForOutputDeviceUID");
    v54 = v23;
    v55 = v28;
    objc_msgSend(v24, "addOutputDevicesChangedCallback:", v51);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v70[5];
    v70[5] = v44;

    v43 = v52;
LABEL_20:

    goto LABEL_21;
  }
  if (-[MSVBlockGuard disarm](v29, "disarm"))
  {
    _MRLogForCategory(0xAuLL);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v82 = CFSTR("searchForOutputDeviceUID");
      v83 = 2114;
      v84 = v23;
      v85 = 2112;
      v86 = CFSTR("found device in localEndpoint...");
      _os_log_impl(&dword_193827000, v42, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    objc_msgSend(v41, "firstObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v28 + 2))(v28, v43, 0);
    goto LABEL_20;
  }
LABEL_21:

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);

}

void __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "debugName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5, "debugName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138544386;
        v46 = v18;
        v47 = 2114;
        v48 = v19;
        v49 = 2112;
        v50 = v13;
        v51 = 2114;
        v52 = v20;
        v53 = 2048;
        v54 = v22;
        v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v24 = v8;
        v25 = 52;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v33 = *(_QWORD *)(a1 + 32);
        v34 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5, "debugName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138544130;
        v46 = v33;
        v47 = 2114;
        v48 = v34;
        v49 = 2112;
        v50 = v13;
        v51 = 2048;
        v52 = v35;
        v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v24 = v8;
        v25 = 42;
      }
      _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

    }
    else
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v26 = *(_QWORD *)(a1 + 32);
        v27 = *(_QWORD *)(a1 + 40);
        v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138544130;
        v46 = v26;
        v47 = 2114;
        v48 = v27;
        v49 = 2114;
        v50 = v28;
        v51 = 2048;
        v52 = v29;
        v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v31 = v8;
        v32 = 42;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v36 = *(_QWORD *)(a1 + 32);
        v37 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138543874;
        v46 = v36;
        v47 = 2114;
        v48 = v37;
        v49 = 2048;
        v50 = v38;
        v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v31 = v8;
        v32 = 32;
      }
      _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    }
    goto LABEL_20;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9)
      goto LABEL_21;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544386;
    v46 = v10;
    v47 = 2114;
    v48 = v11;
    v49 = 2114;
    v50 = v6;
    v51 = 2114;
    v52 = v12;
    v53 = 2048;
    v54 = v14;
    _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9)
    __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_cold_1(a1, v6, v8);
LABEL_21:

  objc_msgSend(*(id *)(a1 + 56), "setDiscoveryMode:", 0);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 56), "removeOutputDevicesChangedCallback:");
  v39 = *(void **)(a1 + 72);
  if (v39)
  {
    v40 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_92;
    block[3] = &unk_1E30C6658;
    v44 = v39;
    v42 = v5;
    v43 = v6;
    dispatch_async(v40, block);

  }
}

uint64_t __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_92(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_94(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

void __97__MRAVLightweightReconnaissanceSession_searchForOutputDeviceUID_timeout_reason_queue_completion___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "containsUID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), (_QWORD)v11))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
          {
            _MRLogForCategory(0xAuLL);
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              v9 = *(_QWORD *)(a1 + 40);
              v10 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 138543874;
              v16 = v9;
              v17 = 2114;
              v18 = v10;
              v19 = 2112;
              v20 = CFSTR("found device in discovery");
              _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }

            (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          }
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

}

- (void)searchForLogicalOutputDeviceUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  MRBlockGuard *v26;
  void *v27;
  id v28;
  MRBlockGuard *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  MRBlockGuard *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __CFString *v45;
  id v46;
  MRBlockGuard *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  __CFString *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint8_t buf[4];
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v40 = a5;
  v12 = a6;
  v13 = a7;
  if (!v12)
  {
    v12 = (id)MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
  }
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__35;
  v64 = __Block_byref_object_dispose__35;
  v65 = 0;
  +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:](MRAVRoutingDiscoverySession, "discoverySessionWithEndpointFeatures:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDiscoveryMode:", 3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchForLogicalOutputDeviceUID"), v18);
  if (v11)
    objc_msgSend(v41, "appendFormat:", CFSTR(" for %@"), v11);
  if (v40)
    objc_msgSend(v41, "appendFormat:", CFSTR(" because %@"), v40);
  _MRLogForCategory(0xAuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v67 = v41;
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v20 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke;
  v51[3] = &unk_1E30CDB50;
  v21 = v11;
  v52 = v21;
  v53 = CFSTR("searchForLogicalOutputDeviceUID");
  v22 = v18;
  v54 = v22;
  v23 = v16;
  v55 = v23;
  v24 = v15;
  v56 = v24;
  v59 = &v60;
  v39 = v13;
  v58 = v39;
  v38 = v12;
  v57 = v38;
  v25 = (void *)MEMORY[0x194036C44](v51);
  v26 = [MRBlockGuard alloc];
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchForLogicalOutputDeviceUID"), v22);
  v49[0] = v20;
  v49[1] = 3221225472;
  v49[2] = __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke_2;
  v49[3] = &unk_1E30C6798;
  v28 = v25;
  v50 = v28;
  v29 = -[MRBlockGuard initWithTimeout:reason:handler:](v26, "initWithTimeout:reason:handler:", v27, v49, a4);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v42[0] = v20;
  v42[1] = 3221225472;
  v42[2] = __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke_3;
  v42[3] = &unk_1E30CDB78;
  v31 = v21;
  v43 = v31;
  v32 = v30;
  v44 = v32;
  v45 = CFSTR("searchForLogicalOutputDeviceUID");
  v33 = v22;
  v46 = v33;
  v34 = v29;
  v47 = v34;
  v35 = v28;
  v48 = v35;
  objc_msgSend(v24, "addOutputDevicesChangedCallback:", v42);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v61[5];
  v61[5] = v36;

  _Block_object_dispose(&v60, 8);
}

void __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    MRAVOutputDeviceArrayDescription(v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(a1 + 32);
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(_QWORD *)(a1 + 48);
        MRAVOutputDeviceArrayDescription(v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544386;
        v46 = v18;
        v47 = 2114;
        v48 = v19;
        v49 = 2112;
        v50 = v13;
        v51 = 2114;
        v52 = v20;
        v53 = 2048;
        v54 = v22;
        v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v24 = v8;
        v25 = 52;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v33 = *(_QWORD *)(a1 + 40);
        v34 = *(_QWORD *)(a1 + 48);
        MRAVOutputDeviceArrayDescription(v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544130;
        v46 = v33;
        v47 = 2114;
        v48 = v34;
        v49 = 2112;
        v50 = v13;
        v51 = 2048;
        v52 = v35;
        v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v24 = v8;
        v25 = 42;
      }
      _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

    }
    else
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v27 = *(_QWORD *)(a1 + 40);
        v26 = *(_QWORD *)(a1 + 48);
        v28 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544130;
        v46 = v27;
        v47 = 2114;
        v48 = v26;
        v49 = 2114;
        v50 = v28;
        v51 = 2048;
        v52 = v29;
        v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v31 = v8;
        v32 = 42;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v36 = *(_QWORD *)(a1 + 40);
        v37 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138543874;
        v46 = v36;
        v47 = 2114;
        v48 = v37;
        v49 = 2048;
        v50 = v38;
        v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v31 = v8;
        v32 = 32;
      }
      _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    }
    goto LABEL_20;
  }
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9)
      goto LABEL_21;
    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544386;
    v46 = v11;
    v47 = 2114;
    v48 = v10;
    v49 = 2114;
    v50 = v6;
    v51 = 2114;
    v52 = v12;
    v53 = 2048;
    v54 = v14;
    _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9)
    __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v8);
LABEL_21:

  objc_msgSend(*(id *)(a1 + 64), "setDiscoveryMode:", 0);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 64), "removeOutputDevicesChangedCallback:");
  v39 = *(void **)(a1 + 80);
  if (v39)
  {
    v40 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke_100;
    block[3] = &unk_1E30C6658;
    v44 = v39;
    v42 = v5;
    v43 = v6;
    dispatch_async(v40, block);

  }
}

uint64_t __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke_100(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __104__MRAVLightweightReconnaissanceSession_searchForLogicalOutputDeviceUID_timeout_reason_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v8, "logicalDeviceID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v10)
        {
          v11 = *(void **)(a1 + 40);
          objc_msgSend(v8, "uid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v14 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v8, "debugName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("found outputDevice %@"), v15);

            _MRLogForCategory(0xAuLL);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = *(_QWORD *)(a1 + 48);
              v19 = *(_QWORD *)(a1 + 56);
              *(_DWORD *)buf = 138543874;
              v29 = v18;
              v30 = 2114;
              v31 = v19;
              v32 = 2112;
              v33 = v16;
              _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }

            v20 = *(void **)(a1 + 40);
            objc_msgSend(v8, "uid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v8, v21);

          }
        }
        if (objc_msgSend(*(id *)(a1 + 40), "count") == 2 && objc_msgSend(*(id *)(a1 + 64), "disarm"))
        {
          v22 = *(_QWORD *)(a1 + 72);
          objc_msgSend(*(id *)(a1 + 40), "allValues");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, _QWORD))(v22 + 16))(v22, v23, 0);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v5);
  }

}

- (void)searchEndpointsForRoutingContextUID:(id)a3 timeout:(double)a4 reason:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MRAVLightweightReconnaissanceSession *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  __CFString *v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v31 = a6;
  v15 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVLightweightReconnaissanceSession.m"), 551, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("routingContextUID"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchEndpointsForRoutingContextUID"), v18);
  v20 = v19;
  if (v13)
    objc_msgSend(v19, "appendFormat:", CFSTR(" for %@"), v13);
  if (v14)
    objc_msgSend(v20, "appendFormat:", CFSTR(" because %@"), v14);
  v21 = self;
  _MRLogForCategory(0xAuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v41 = v20;
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v23 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __108__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_reason_queue_completion___block_invoke;
  v34[3] = &unk_1E30CDBA0;
  v24 = v13;
  v35 = v24;
  v36 = CFSTR("searchEndpointsForRoutingContextUID");
  v37 = v18;
  v38 = v16;
  v39 = v15;
  v25 = v15;
  v26 = v16;
  v27 = v18;
  v28 = (void *)MEMORY[0x194036C44](v34);
  v32[0] = v23;
  v32[1] = 3221225472;
  v32[2] = __108__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_reason_queue_completion___block_invoke_109;
  v32[3] = &unk_1E30C6FB0;
  v33 = v24;
  v29 = v24;
  -[MRAVLightweightReconnaissanceSession searchEndpointsWithPredicate:timeout:reason:queue:completion:](v21, "searchEndpointsWithPredicate:timeout:reason:queue:completion:", v32, v14, v31, v28, a4);

}

void __108__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_reason_queue_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v10)
        goto LABEL_22;
      v12 = a1[5];
      v11 = a1[6];
      v13 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
      v36 = 138544386;
      v37 = v12;
      v38 = 2114;
      v39 = v11;
      v40 = 2112;
      v41 = v5;
      v42 = 2114;
      v43 = v13;
      v44 = 2048;
      v45 = v15;
      v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v17 = v9;
      v18 = 52;
      goto LABEL_16;
    }
    if (!v10)
      goto LABEL_22;
    v29 = a1[5];
    v30 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
    v36 = 138544130;
    v37 = v29;
    v38 = 2114;
    v39 = v30;
    v40 = 2112;
    v41 = v5;
    v42 = 2048;
    v43 = v31;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  if (v6)
  {
    v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (!v19)
        goto LABEL_22;
      v21 = a1[5];
      v20 = a1[6];
      v22 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
      v36 = 138544386;
      v37 = v21;
      v38 = 2114;
      v39 = v20;
      v40 = 2114;
      v41 = v6;
      v42 = 2114;
      v43 = v22;
      v44 = 2048;
      v45 = v23;
      _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v36, 0x34u);
      goto LABEL_17;
    }
    if (v19)
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v6, v9);
  }
  else
  {
    v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v24)
        goto LABEL_22;
      v26 = a1[5];
      v25 = a1[6];
      v27 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
      v36 = 138544130;
      v37 = v26;
      v38 = 2114;
      v39 = v25;
      v40 = 2114;
      v41 = v27;
      v42 = 2048;
      v43 = v28;
      v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      v17 = v9;
      v18 = 42;
LABEL_16:
      _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v36, v18);
LABEL_17:

      goto LABEL_22;
    }
    if (v24)
    {
      v32 = a1[5];
      v33 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
      v36 = 138543874;
      v37 = v32;
      v38 = 2114;
      v39 = v33;
      v40 = 2048;
      v41 = v34;
      v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v17 = v9;
      v18 = 32;
      goto LABEL_16;
    }
  }
LABEL_22:

  v35 = a1[8];
  if (v35)
    (*(void (**)(uint64_t, id, id))(v35 + 16))(v35, v5, v6);

}

uint64_t __108__MRAVLightweightReconnaissanceSession_searchEndpointsForRoutingContextUID_timeout_reason_queue_completion___block_invoke_109(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "externalDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routingContextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v6;
}

- (void)searchEndpointsForMyGroupLeaderWithTimeout:(double)a3 reason:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  MRAVReconnaissanceSession *v20;
  void *v21;
  MRAVReconnaissanceSession *v22;
  MRAVReconnaissanceSession *v23;
  _QWORD v24[4];
  MRAVReconnaissanceSession *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  _QWORD v27[4];
  __CFString *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForMyGroupLeaderWithTimeout_reason_queue_completion___block_invoke;
  v27[3] = &unk_1E30CDBC8;
  v28 = CFSTR("searchEndpointsForMyGroupLeader");
  v14 = v12;
  v29 = v14;
  v15 = v10;
  v30 = v15;
  v16 = v9;
  v32 = v16;
  v17 = v8;
  v31 = v17;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v27);
  v19 = (void *)MRMediaRemoteCopyDeviceUID();
  if (v19)
  {
    v20 = [MRAVReconnaissanceSession alloc];
    v33[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:](v20, "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", v21, 0, 8);

    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForMyGroupLeaderWithTimeout_reason_queue_completion___block_invoke_2;
    v24[3] = &unk_1E30CDBF0;
    v25 = v22;
    v26 = v18;
    v23 = v22;
    -[MRAVReconnaissanceSession beginSearchWithTimeout:completion:](v23, "beginSearchWithTimeout:completion:", v24, a3);

  }
  else
  {
    v23 = (MRAVReconnaissanceSession *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 33);
    ((void (**)(_QWORD, _QWORD, MRAVReconnaissanceSession *))v18)[2](v18, 0, v23);
  }

}

void __107__MRAVLightweightReconnaissanceSession_searchEndpointsForMyGroupLeaderWithTimeout_reason_queue_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 && !v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v9 = a1[4];
    v10 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", a1[6]);
    *(_DWORD *)buf = 138544130;
    v26 = v9;
    v27 = 2114;
    v28 = v10;
    v29 = 2112;
    v30 = v5;
    v31 = 2048;
    v32 = v12;
    v13 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v14 = v8;
    v15 = 42;
LABEL_10:
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);

    goto LABEL_11;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v16 = a1[4];
    v17 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", a1[6]);
    *(_DWORD *)buf = 138543874;
    v26 = v16;
    v27 = 2114;
    v28 = v17;
    v29 = 2048;
    v30 = v18;
    v13 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v14 = v8;
    v15 = 32;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __107__MRAVLightweightReconnaissanceSession_searchEndpointsForOutputDeviceUID_timeout_details_queue_completion___block_invoke_cold_1(a1, v6, v8);
LABEL_11:

  v19 = (void *)a1[8];
  if (v19)
  {
    v20 = a1[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __107__MRAVLightweightReconnaissanceSession_searchEndpointsForMyGroupLeaderWithTimeout_reason_queue_completion___block_invoke_112;
    block[3] = &unk_1E30C6658;
    v24 = v19;
    v22 = v5;
    v23 = v6;
    dispatch_async(v20, block);

  }
}

uint64_t __107__MRAVLightweightReconnaissanceSession_searchEndpointsForMyGroupLeaderWithTimeout_reason_queue_completion___block_invoke_112(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __107__MRAVLightweightReconnaissanceSession_searchEndpointsForMyGroupLeaderWithTimeout_reason_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  id v8;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v8 = *(id *)(a1 + 32);
  v7(v6, a3, a4);

}

- (void)searchOutputDevices:(id)a3 reason:(id)a4 timeout:(double)a5 queue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  MRBlockGuard *v26;
  id v27;
  MRBlockGuard *v28;
  MRBlockGuard *v29;
  id v30;
  MRAVReconnaissanceSession *v31;
  MRAVReconnaissanceSession *v32;
  id v33;
  MRBlockGuard *v34;
  MRAVReconnaissanceSession *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  MRAVReconnaissanceSession *v41;
  MRBlockGuard *v42;
  id v43;
  _QWORD v44[4];
  MRAVReconnaissanceSession *v45;
  MRBlockGuard *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  __CFString *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0C99D68];
  v15 = a3;
  objc_msgSend(v14, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchOutputDevices"), v18);
  v20 = v19;
  if (v11)
    objc_msgSend(v19, "appendFormat:", CFSTR(" for %@"), v11);
  _MRLogForCategory(0xAuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v58 = v20;
    _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v39 = v20;
  v22 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke;
  v50[3] = &unk_1E30CDC18;
  v51 = v11;
  v52 = CFSTR("searchOutputDevices");
  v53 = v18;
  v54 = v16;
  v55 = v12;
  v56 = v13;
  v38 = v12;
  v37 = v13;
  v36 = v16;
  v23 = v18;
  v24 = v11;
  v25 = (void *)MEMORY[0x194036C44](v50);
  v26 = [MRBlockGuard alloc];
  v48[0] = v22;
  v48[1] = 3221225472;
  v48[2] = __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_2;
  v48[3] = &unk_1E30C6798;
  v27 = v25;
  v49 = v27;
  v28 = -[MRBlockGuard initWithTimeout:reason:handler:](v26, "initWithTimeout:reason:handler:", v24, v48, a5);
  v44[0] = v22;
  v44[1] = 3221225472;
  v44[2] = __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_3;
  v44[3] = &unk_1E30CDC40;
  v45 = -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:]([MRAVReconnaissanceSession alloc], "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", v15, 0, 8);
  v29 = v28;
  v46 = v29;
  v30 = v27;
  v47 = v30;
  v31 = v45;
  -[MRAVReconnaissanceSession beginSearchWithTimeout:endpointsCompletion:](v31, "beginSearchWithTimeout:endpointsCompletion:", v44, a5);
  v32 = -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:]([MRAVReconnaissanceSession alloc], "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", v15, 0, 1);

  v40[0] = v22;
  v40[1] = 3221225472;
  v40[2] = __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_4;
  v40[3] = &unk_1E30CDC40;
  v41 = v32;
  v42 = v29;
  v43 = v30;
  v33 = v30;
  v34 = v29;
  v35 = v32;
  -[MRAVReconnaissanceSession beginSearchWithTimeout:endpointsCompletion:](v35, "beginSearchWithTimeout:endpointsCompletion:", v40, a5);

}

void __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = a1[4];
  _MRLogForCategory(0xAuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7 && !v9)
  {
    v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v13)
        goto LABEL_22;
      v15 = a1[5];
      v14 = a1[6];
      v16 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", a1[7]);
      *(_DWORD *)buf = 138544386;
      v46 = v15;
      v47 = 2114;
      v48 = v14;
      v49 = 2112;
      v50 = v7;
      v51 = 2114;
      v52 = v16;
      v53 = 2048;
      v54 = v18;
      v19 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v20 = v12;
      v21 = 52;
      goto LABEL_16;
    }
    if (!v13)
      goto LABEL_22;
    v32 = a1[5];
    v33 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", a1[7]);
    *(_DWORD *)buf = 138544130;
    v46 = v32;
    v47 = 2114;
    v48 = v33;
    v49 = 2112;
    v50 = v7;
    v51 = 2048;
    v52 = v34;
    v19 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  if (v9)
  {
    v22 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (!v22)
        goto LABEL_22;
      v24 = a1[5];
      v23 = a1[6];
      v25 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", a1[7]);
      *(_DWORD *)buf = 138544386;
      v46 = v24;
      v47 = 2114;
      v48 = v23;
      v49 = 2114;
      v50 = v9;
      v51 = 2114;
      v52 = v25;
      v53 = 2048;
      v54 = v26;
      _os_log_error_impl(&dword_193827000, v12, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
      goto LABEL_17;
    }
    if (v22)
      __86__MRV2NowPlayingController__loadNowPlayingStateForConfiguration_requestID_completion___block_invoke_40_cold_1(a1, v9, v12);
  }
  else
  {
    v27 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v27)
        goto LABEL_22;
      v29 = a1[5];
      v28 = a1[6];
      v30 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", a1[7]);
      *(_DWORD *)buf = 138544130;
      v46 = v29;
      v47 = 2114;
      v48 = v28;
      v49 = 2114;
      v50 = v30;
      v51 = 2048;
      v52 = v31;
      v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      v20 = v12;
      v21 = 42;
LABEL_16:
      _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_17:

      goto LABEL_22;
    }
    if (v27)
    {
      v35 = a1[5];
      v36 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", a1[7]);
      *(_DWORD *)buf = 138543874;
      v46 = v35;
      v47 = 2114;
      v48 = v36;
      v49 = 2048;
      v50 = v37;
      v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v20 = v12;
      v21 = 32;
      goto LABEL_16;
    }
  }
LABEL_22:

  v38 = (void *)a1[9];
  if (v38)
  {
    v39 = a1[8];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_119;
    v40[3] = &unk_1E30C8540;
    v44 = v38;
    v41 = v7;
    v42 = v8;
    v43 = v9;
    dispatch_async(v39, v40);

  }
}

uint64_t __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_119(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  v8 = a4;
  v9 = a5;
  v10 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  if (objc_msgSend(v10, "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(a2, "msv_filter:", &__block_literal_global_86);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") && objc_msgSend(*(id *)(a1 + 40), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

BOOL __92__MRAVLightweightReconnaissanceSession_searchOutputDevices_reason_timeout_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "deviceType") == 1 && !objc_msgSend(v2, "supportsBufferedAirPlay")
    || objc_msgSend(v2, "deviceSubtype") == 18;

  return v3;
}

- (void)searchForOutputDevices:(id)a3 categories:(id)a4 timeout:(double)a5 reason:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  MRBlockGuard *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void (**v39)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void (**v49)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  MRBlockGuard *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  MRBlockGuard *v70;
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  id v83;
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v19)
  {
    if (v18)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVLightweightReconnaissanceSession.m"), 646, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  if (!v18)
  {
LABEL_3:
    v18 = (id)MEMORY[0x1E0C80D38];
    v20 = MEMORY[0x1E0C80D38];
  }
LABEL_4:
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ - %@"), v15, v16);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("searchForOutputDevicesWithCategories"), v24);
  v26 = v25;
  if (v21)
    objc_msgSend(v25, "appendFormat:", CFSTR(" for %@"), v21);
  if (v17)
    objc_msgSend(v26, "appendFormat:", CFSTR(" because %@"), v17);
  _MRLogForCategory(0xAuLL);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v86 = v26;
    _os_log_impl(&dword_193827000, v27, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke;
  v79[3] = &unk_1E30CDC68;
  v28 = v24;
  v80 = v28;
  v60 = v22;
  v81 = v60;
  v29 = v18;
  v82 = v29;
  v59 = v19;
  v83 = v59;
  v30 = (void *)MEMORY[0x194036C44](v79);
  v61 = v26;
  if (!objc_msgSend(v16, "count"))
  {

    v16 = &unk_1E3143C80;
  }
  v31 = MEMORY[0x1E0C809B0];
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_2;
  v76[3] = &unk_1E30CDC90;
  v58 = v28;
  v77 = v58;
  v32 = v15;
  v78 = v32;
  objc_msgSend(v16, "msv_compactMap:", v76);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = [MRBlockGuard alloc];
  v73[0] = v31;
  v73[1] = 3221225472;
  v73[2] = __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_137;
  v73[3] = &unk_1E30C6590;
  v35 = v30;
  v75 = v35;
  v36 = v33;
  v74 = v36;
  v69[0] = v31;
  v69[1] = 3221225472;
  v69[2] = __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_2_138;
  v69[3] = &unk_1E30CDCB8;
  v57 = -[MRBlockGuard initWithTimeout:reason:handler:](v34, "initWithTimeout:reason:handler:", v17, v73, a5);
  v70 = v57;
  v37 = v35;
  v72 = v37;
  v38 = v36;
  v71 = v38;
  v39 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v69);
  if (objc_msgSend(v38, "count"))
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v40 = v38;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
    if (v41)
    {
      v42 = v41;
      v52 = v37;
      v53 = v32;
      v54 = v21;
      v55 = v17;
      v56 = v16;
      v43 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v66 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_msgSend(v45, "first");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "second");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "category");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_3;
          v62[3] = &unk_1E30CBCD8;
          v49 = v39;
          v63 = v48;
          v64 = v49;
          v50 = v48;
          objc_msgSend(v46, "beginSearchWithTimeout:completion:", v62, 7.0);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
      }
      while (v42);
      v17 = v55;
      v16 = v56;
      v21 = v54;
      v37 = v52;
      v32 = v53;
    }
  }
  else
  {
    v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 39, CFSTR("Could not resolve the input categories to anything"));
    ((void (**)(_QWORD, _QWORD, _QWORD, id))v39)[2](v39, 0, 0, v40);
  }

}

void __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  __CFString *v9;
  __CFString *v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSObject *v33;
  id v34;
  __CFString *v35;
  __CFString *v36;
  _QWORD block[4];
  __CFString *v38;
  __CFString *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const __CFString *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  __CFString *v51;
  __int16 v52;
  __CFString *v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = CFSTR("activeCategory");
  if (v10)
    v13 = v10;
  v14 = v13;
  _MRLogForCategory(0xAuLL);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v9 || v12)
  {
    if (v12)
    {
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v23 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138544386;
      v47 = CFSTR("searchForOutputDevicesWithCategories");
      v48 = 2114;
      v49 = v23;
      v50 = 2114;
      v51 = v12;
      v52 = 2114;
      v53 = v14;
      v54 = 2048;
      v55 = v24;
      _os_log_error_impl(&dword_193827000, v16, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
      goto LABEL_13;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v25 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 138544130;
    v47 = CFSTR("searchForOutputDevicesWithCategories");
    v48 = 2114;
    v49 = v25;
    v50 = 2114;
    v51 = v14;
    v52 = 2048;
    v53 = v26;
    v20 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    v21 = v16;
    v22 = 42;
  }
  else
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v17 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 138544386;
    v47 = CFSTR("searchForOutputDevicesWithCategories");
    v48 = 2114;
    v49 = v17;
    v50 = 2112;
    v51 = v9;
    v52 = 2114;
    v53 = v14;
    v54 = 2048;
    v55 = v19;
    v20 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
    v21 = v16;
    v22 = 52;
  }
  _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
LABEL_13:

LABEL_14:
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = v11;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "first");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "cancelSearch");

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v29);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_129;
  block[3] = &unk_1E30C6658;
  v33 = *(NSObject **)(a1 + 48);
  v34 = *(id *)(a1 + 56);
  v39 = v12;
  v40 = v34;
  v38 = v9;
  v35 = v12;
  v36 = v9;
  dispatch_async(v33, block);

}

uint64_t __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_129(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

id __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  MRRequestDetails *v4;
  void *v5;
  MRRequestDetails *v6;
  MRAVReconnaissanceSession *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [MRRequestDetails alloc];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), v3, *(_QWORD *)(a1 + 32));
  v6 = -[MRRequestDetails initWithName:requestID:reason:](v4, "initWithName:requestID:reason:", CFSTR("searchForOutputDevicesWithCategories"), 0, v5);

  v7 = -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:details:]([MRAVReconnaissanceSession alloc], "initWithOutputDeviceUIDs:outputDeviceGroupID:features:details:", *(_QWORD *)(a1 + 40), 0, 1, v6);
  if (!objc_msgSend(v3, "length"))
  {
    v8 = 0;
    goto LABEL_5;
  }
  objc_msgSend((Class)getAVAudioSessionClass_2[0](), "auxiliarySession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v9 = objc_msgSend(v8, "setCategory:error:", v3, &v18);
  v10 = v18;
  if ((v9 & 1) != 0)
  {
    v11 = objc_msgSend(v8, "opaqueSessionID");
    -[MRAVReconnaissanceSession discoverySession](v7, "discoverySession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTargetAudioSessionID:", v11);

LABEL_5:
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0B8]), "initWithFirst:second:", v7, v8);
    goto LABEL_9;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to set %@ category on aux content %@"), v3, v10);
  _MRLogForCategory(0xAuLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v20 = CFSTR("searchForOutputDevicesWithCategories");
    v21 = 2114;
    v22 = v16;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v13 = 0;
LABEL_9:

  return v13;
}

uint64_t __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_137(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32), a2);
}

void __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_2_138(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __106__MRAVLightweightReconnaissanceSession_searchForOutputDevices_categories_timeout_reason_queue_completion___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(result + 40) + 16))(*(_QWORD *)(result + 40), a2, *(_QWORD *)(result + 32));
  return result;
}

@end
