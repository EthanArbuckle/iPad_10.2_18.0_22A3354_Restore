@implementation OTClique

- (OTClique)initWithContextData:(id)a3
{
  id v4;
  OTClique *v5;
  OTConfigurationContext *v6;
  OTConfigurationContext *ctx;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)OTClique;
  v5 = -[OTClique init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(OTConfigurationContext);
    ctx = v5->_ctx;
    v5->_ctx = v6;

    objc_msgSend(v4, "context");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = v8;
    else
      v10 = OTDefaultContext;
    -[OTConfigurationContext setContext:](v5->_ctx, "setContext:", v10);

    objc_msgSend(v4, "containerName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTConfigurationContext setContainerName:](v5->_ctx, "setContainerName:", v11);

    objc_msgSend(v4, "dsid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    -[OTConfigurationContext setDsid:](v5->_ctx, "setDsid:", v13);

    objc_msgSend(v4, "altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    -[OTConfigurationContext setAltDSID:](v5->_ctx, "setAltDSID:", v15);

    objc_msgSend(v4, "otControl");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTConfigurationContext setOtControl:](v5->_ctx, "setOtControl:", v16);

    objc_msgSend(v4, "ckksControl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTConfigurationContext setCkksControl:](v5->_ctx, "setCkksControl:", v17);

    -[OTConfigurationContext setEscrowFetchSource:](v5->_ctx, "setEscrowFetchSource:", objc_msgSend(v4, "escrowFetchSource"));
    -[OTConfigurationContext setOverrideForSetupAccountScript:](v5->_ctx, "setOverrideForSetupAccountScript:", objc_msgSend(v4, "overrideForSetupAccountScript"));
    objc_msgSend(v4, "sbd");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTConfigurationContext setSbd:](v5->_ctx, "setSbd:", v18);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctx, 0);
  objc_storeStrong((id *)&self->_cliqueMemberIdentifier, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[OTClique ctx](self, "ctx");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTClique ctx](self, "ctx");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTClique cliqueMemberIdentifier](self, "cliqueMemberIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<OTClique: altDSID:%@ contextID:%@ memberID:%@>"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)cliqueMemberIdentifier
{
  return (NSString *)-[OTClique cliqueMemberIdentifier:](self, "cliqueMemberIdentifier:", 0);
}

- (id)cliqueMemberIdentifier:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  OTControlArguments *v20;
  void *v21;
  OTControlArguments *v22;
  void *v23;
  unint64_t Nanoseconds;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  os_signpost_id_t v30;
  unint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  uint64_t v37;
  unint64_t v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  void *v43;
  void *v44;
  uint64_t v45;
  unint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  os_signpost_id_t spid;
  _QWORD v53[4];
  id v54;
  __int128 *p_buf;
  uint64_t *v56;
  id obj;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t v64[4];
  os_signpost_id_t v65;
  __int16 v66;
  double v67;
  __int16 v68;
  _BOOL4 v69;
  __int128 buf;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74[3];

  v74[1] = *(id *)MEMORY[0x1E0C80C00];
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__4162;
  v62 = __Block_byref_object_dispose__4163;
  v63 = 0;
  _OctagonSignpostLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v4);
  v48 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v47 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "FetchEgoPeer", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = spid;
    _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchEgoPeer  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  v49 = objc_alloc((Class)getAAFAnalyticsEventSecurityClass());
  -[OTClique ctx](self, "ctx");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTClique ctx](self, "ctx");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTClique ctx](self, "ctx");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceSessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v71 = 0x2020000000;
  v13 = (id *)getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_ptr;
  v72 = (uint64_t (*)(uint64_t, uint64_t))getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_ptr;
  if (!getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_ptr)
  {
    v14 = KeychainCircleLibrary();
    v13 = (id *)dlsym(v14, "kSecurityRTCEventNameCliqueMemberIdentifier");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v13;
    getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&buf, 8);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSecurityRTCEventNameCliqueMemberIdentifier(void)");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("OTClique.m"), 73, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v15 = *v13;
  -[OTClique ctx](self, "ctx");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "testsEnabled");
  getkSecurityRTCEventCategoryAccountDataAccessRecovery();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v45) = 1;
  v50 = (void *)objc_msgSend(v49, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v8, v10, v12, v15, v17, v45, v18);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__4162;
  v73 = __Block_byref_object_dispose__4163;
  v74[0] = 0;
  obj = 0;
  -[OTClique makeOTControl:](self, "makeOTControl:", &obj);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v74, obj);
  if (v19)
  {
    v20 = [OTControlArguments alloc];
    -[OTClique ctx](self, "ctx");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[OTControlArguments initWithConfiguration:](v20, "initWithConfiguration:", v21);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __35__OTClique_cliqueMemberIdentifier___block_invoke;
    v53[3] = &unk_1E1FCDE10;
    p_buf = &buf;
    v54 = v50;
    v56 = &v58;
    objc_msgSend(v19, "fetchEgoPeerID:reply:", v22, v53);

    v23 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v23)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v23);
      Nanoseconds = _OctagonSignpostGetNanoseconds(spid, v48);
      _OctagonSignpostLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_DWORD *)v64 = 67240192;
        LODWORD(v65) = 0;
        _os_signpost_emit_with_name_impl(&dword_18A900000, v26, OS_SIGNPOST_INTERVAL_END, spid, "FetchEgoPeer", " OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ", v64, 8u);
      }

      _OctagonSignpostLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v64 = 134218496;
        v65 = spid;
        v66 = 2048;
        v67 = (double)Nanoseconds / 1000000000.0;
        v68 = 1026;
        v69 = 0;
        _os_log_impl(&dword_18A900000, v27, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEgoPeer  OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ", v64, 0x1Cu);
      }

      v28 = 0;
    }
    else
    {
      secLogObjForScope("clique");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = v59[5];
        *(_DWORD *)v64 = 138412290;
        v65 = v36;
        _os_log_impl(&dword_18A900000, v35, OS_LOG_TYPE_DEFAULT, "cliqueMemberIdentifier complete: %@", v64, 0xCu);
      }

      v37 = v59[5];
      v38 = _OctagonSignpostGetNanoseconds(spid, v48);
      _OctagonSignpostLogSystem();
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_DWORD *)v64 = 67240192;
        LODWORD(v65) = v37 != 0;
        _os_signpost_emit_with_name_impl(&dword_18A900000, v40, OS_SIGNPOST_INTERVAL_END, spid, "FetchEgoPeer", " OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ", v64, 8u);
      }

      _OctagonSignpostLogSystem();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v64 = 134218496;
        v65 = spid;
        v66 = 2048;
        v67 = (double)v38 / 1000000000.0;
        v68 = 1026;
        v69 = v37 != 0;
        _os_log_impl(&dword_18A900000, v41, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEgoPeer  OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ", v64, 0x1Cu);
      }

      v28 = (id)v59[5];
    }

  }
  else
  {
    secLogObjForScope("SecError");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v64 = 138412290;
      v65 = v30;
      _os_log_impl(&dword_18A900000, v29, OS_LOG_TYPE_DEFAULT, "octagon: Failed to create OTControl: %@", v64, 0xCu);
    }

    v31 = _OctagonSignpostGetNanoseconds(spid, v48);
    _OctagonSignpostLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)v64 = 67240192;
      LODWORD(v65) = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v33, OS_SIGNPOST_INTERVAL_END, spid, "FetchEgoPeer", " OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ", v64, 8u);
    }

    _OctagonSignpostLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v64 = 134218496;
      v65 = spid;
      v66 = 2048;
      v67 = (double)v31 / 1000000000.0;
      v68 = 1026;
      v69 = 0;
      _os_log_impl(&dword_18A900000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEgoPeer  OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ", v64, 0x1Cu);
    }

    objc_msgSend(getSecurityAnalyticsReporterRTCClass(), "sendMetricWithEvent:success:error:", v50, 0, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v28 = 0;
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v58, 8);

  return v28;
}

- (id)makeOTControl:(id *)a3
{
  void *v4;
  void *v5;

  -[OTClique ctx](self, "ctx");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeOTControl:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)establish:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  int64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  BOOL v25;
  OTControlArguments *v27;
  void *v28;
  OTControlArguments *v29;
  void *v30;
  NSObject *v31;
  int v32;
  int v33;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  const __CFString *v39;
  unint64_t v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  _QWORD v44[6];
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint8_t v50[4];
  os_signpost_id_t v51;
  __int16 v52;
  double v53;
  __int16 v54;
  int v55;
  _BYTE buf[24];
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  secLogObjForScope("clique-establish");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "establish started", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);
  v8 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Establish", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v7;
    _os_log_impl(&dword_18A900000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: Establish  enableTelemetry=YES ", buf, 0xCu);
  }

  -[OTClique makeOTControl:](self, "makeOTControl:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    Nanoseconds = _OctagonSignpostGetNanoseconds(v7, v8);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v7, "Establish", " OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)Nanoseconds / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v57) = 0;
      _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: Establish  OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", buf, 0x1Cu);
    }
    goto LABEL_25;
  }
  v45 = 0;
  v14 = -[OTClique fetchCliqueStatus:](self, "fetchCliqueStatus:", &v45);
  v15 = v45;
  if (v15)
  {
    v16 = v15;
    secLogObjForScope("clique-establish");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "fetching clique status failed: %@", buf, 0xCu);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v16);
    v18 = _OctagonSignpostGetNanoseconds(v7, v8);
    _OctagonSignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v20, OS_SIGNPOST_INTERVAL_END, v7, "Establish", " OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)v18 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v57) = 0;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: Establish  OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", buf, 0x1Cu);
    }

LABEL_25:
    v25 = 0;
    goto LABEL_26;
  }
  if (v14 == 3)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v57 = __Block_byref_object_copy__4162;
    v58 = __Block_byref_object_dispose__4163;
    v59 = 0;
    v27 = [OTControlArguments alloc];
    -[OTClique ctx](self, "ctx");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[OTControlArguments initWithConfiguration:](v27, "initWithConfiguration:", v28);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __22__OTClique_establish___block_invoke;
    v44[3] = &unk_1E1FCDE38;
    v44[4] = &v46;
    v44[5] = buf;
    objc_msgSend(v13, "establish:reply:", v29, v44);

    if (a3)
    {
      v30 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v30)
        *a3 = objc_retainAutorelease(v30);
    }
    secLogObjForScope("clique-establish");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = *((unsigned __int8 *)v47 + 24);
      *(_DWORD *)v50 = 67109120;
      LODWORD(v51) = v32;
      _os_log_impl(&dword_18A900000, v31, OS_LOG_TYPE_DEFAULT, "establish complete: %{BOOL}d", v50, 8u);
    }

    v33 = *((unsigned __int8 *)v47 + 24);
    v34 = _OctagonSignpostGetNanoseconds(v7, v8);
    _OctagonSignpostLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_DWORD *)v50 = 67240192;
      LODWORD(v51) = v33;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v36, OS_SIGNPOST_INTERVAL_END, v7, "Establish", " OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", v50, 8u);
    }

    _OctagonSignpostLogSystem();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v50 = 134218496;
      v51 = v7;
      v52 = 2048;
      v53 = (double)v34 / 1000000000.0;
      v54 = 1026;
      v55 = v33;
      _os_log_impl(&dword_18A900000, v37, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: Establish  OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", v50, 0x1Cu);
    }

    v25 = *((_BYTE *)v47 + 24) != 0;
    _Block_object_dispose(buf, 8);

    v16 = 0;
  }
  else
  {
    secLogObjForScope("clique-establish");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(v14 + 1) > 5)
        v39 = CFSTR("CliqueStatusIn");
      else
        v39 = off_1E1FCE178[v14 + 1];
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v39;
      _os_log_impl(&dword_18A900000, v38, OS_LOG_TYPE_DEFAULT, "clique status is %@; performing no Octagon actions",
        buf,
        0xCu);
    }

    v40 = _OctagonSignpostGetNanoseconds(v7, v8);
    _OctagonSignpostLogSystem();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v42, OS_SIGNPOST_INTERVAL_END, v7, "Establish", " OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)v40 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v57) = 0;
      _os_log_impl(&dword_18A900000, v43, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: Establish  OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ", buf, 0x1Cu);
    }

    v16 = 0;
    v25 = 1;
  }
LABEL_26:

  _Block_object_dispose(&v46, 8);
  return v25;
}

- (BOOL)resetAndEstablish:(int64_t)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 accountSettings:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  OTControlArguments *v24;
  void *v25;
  OTControlArguments *v26;
  void *v27;
  NSObject *v28;
  int v29;
  int v30;
  unint64_t Nanoseconds;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  BOOL v35;
  unint64_t v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  id v41;
  id v42;
  _QWORD v43[6];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t v48[4];
  os_signpost_id_t v49;
  __int16 v50;
  double v51;
  __int16 v52;
  int v53;
  _BYTE buf[24];
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;

  v10 = a6;
  v58 = *MEMORY[0x1E0C80C00];
  v41 = a4;
  v42 = a5;
  v14 = a7;
  secLogObjForScope("clique-resetandestablish");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "resetAndEstablish started", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);
  v18 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = v17 - 1;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v17, "ResetAndEstablish", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v17;
    _os_log_impl(&dword_18A900000, v22, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ResetAndEstablish  enableTelemetry=YES ", buf, 0xCu);
  }

  -[OTClique makeOTControl:](self, "makeOTControl:", a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v55 = __Block_byref_object_copy__4162;
    v56 = __Block_byref_object_dispose__4163;
    v57 = 0;
    v24 = [OTControlArguments alloc];
    -[OTClique ctx](self, "ctx");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[OTControlArguments initWithConfiguration:](v24, "initWithConfiguration:", v25);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __104__OTClique_resetAndEstablish_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_error___block_invoke;
    v43[3] = &unk_1E1FCDE38;
    v43[4] = &v44;
    v43[5] = buf;
    objc_msgSend(v23, "resetAndEstablish:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:reply:", v26, a3, v41, v42, v10, v14, v43);

    if (a8)
    {
      v27 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v27)
        *a8 = objc_retainAutorelease(v27);
    }
    secLogObjForScope("clique-resetandestablish");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *((unsigned __int8 *)v45 + 24);
      *(_DWORD *)v48 = 67109120;
      LODWORD(v49) = v29;
      _os_log_impl(&dword_18A900000, v28, OS_LOG_TYPE_DEFAULT, "establish complete: %{BOOL}d", v48, 8u);
    }

    v30 = *((unsigned __int8 *)v45 + 24);
    Nanoseconds = _OctagonSignpostGetNanoseconds(v17, v18);
    _OctagonSignpostLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)v48 = 67240192;
      LODWORD(v49) = v30;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v33, OS_SIGNPOST_INTERVAL_END, v17, "ResetAndEstablish", " OctagonSignpostNameResetAndEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameResetAndEstablish}d ", v48, 8u);
    }

    _OctagonSignpostLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v48 = 134218496;
      v49 = v17;
      v50 = 2048;
      v51 = (double)Nanoseconds / 1000000000.0;
      v52 = 1026;
      v53 = v30;
      _os_log_impl(&dword_18A900000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: ResetAndEstablish  OctagonSignpostNameResetAndEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameResetAndEstablish}d ", v48, 0x1Cu);
    }

    v35 = *((_BYTE *)v45 + 24) != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v44, 8);
  }
  else
  {
    v36 = _OctagonSignpostGetNanoseconds(v17, v18);
    _OctagonSignpostLogSystem();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v21 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v37))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v38, OS_SIGNPOST_INTERVAL_END, v17, "ResetAndEstablish", " OctagonSignpostNameResetAndEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameResetAndEstablish}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)v36 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v55) = 0;
      _os_log_impl(&dword_18A900000, v39, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: ResetAndEstablish  OctagonSignpostNameResetAndEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameResetAndEstablish}d ", buf, 0x1Cu);
    }

    v35 = 0;
  }

  return v35;
}

- (id)setupPairingChannelAsInitiator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[OTClique ctx](self, "ctx");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "altDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      secLogObjForScope("octagon-account");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[OTClique ctx](self, "ctx");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "altDSID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412290;
        v25 = v18;
        _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, "Configuring pairing channel with configured altDSID: %@", (uint8_t *)&v24, 0xCu);

      }
      -[OTClique ctx](self, "ctx");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject altDSID](v11, "altDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAltDSID:", v13);
      goto LABEL_11;
    }
  }
  objc_msgSend(v4, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    secLogObjForScope("octagon-account");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v10)
    {
      if (v12)
      {
        objc_msgSend(v4, "altDSID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTClique ctx](self, "ctx");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "altDSID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v19;
        v26 = 2112;
        v27 = v21;
        _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "Pairing channel context configured with altDSID (%@) which does not match Clique altDSID (%@), possible issues ahead", (uint8_t *)&v24, 0x16u);

      }
      goto LABEL_14;
    }
    if (!v12)
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v4, "altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v13;
    _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "Pairing channel context already configured with altDSID: %@", (uint8_t *)&v24, 0xCu);
LABEL_11:

    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(getKCPairingChannelClass(), "pairingChannelInitiator:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)setupPairingChannelAsInitator:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  return -[OTClique setupPairingChannelAsInitiator:](self, "setupPairingChannelAsInitiator:", a3);
}

- (id)setupPairingChannelAsAcceptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[OTClique ctx](self, "ctx");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "altDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      secLogObjForScope("octagon-account");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[OTClique ctx](self, "ctx");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "altDSID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412290;
        v25 = v18;
        _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, "Configuring pairing channel with configured altDSID: %@", (uint8_t *)&v24, 0xCu);

      }
      -[OTClique ctx](self, "ctx");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject altDSID](v11, "altDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAltDSID:", v13);
      goto LABEL_11;
    }
  }
  objc_msgSend(v4, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    secLogObjForScope("octagon-account");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v10)
    {
      if (v12)
      {
        objc_msgSend(v4, "altDSID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTClique ctx](self, "ctx");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "altDSID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v19;
        v26 = 2112;
        v27 = v21;
        _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "Pairing channel context configured with altDSID (%@) which does not match Clique altDSID (%@), possible issues ahead", (uint8_t *)&v24, 0x16u);

      }
      goto LABEL_14;
    }
    if (!v12)
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v4, "altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v13;
    _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "Pairing channel context already configured with altDSID: %@", (uint8_t *)&v24, 0xCu);
LABEL_11:

    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(getKCPairingChannelClass(), "pairingChannelAcceptor:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)setupPairingChannelAsAcceptor:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  return -[OTClique setupPairingChannelAsAcceptor:](self, "setupPairingChannelAsAcceptor:", a3);
}

- (int64_t)_fetchCliqueStatus:(id)a3 error:(id *)a4
{
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  OTControlArguments *v13;
  void *v14;
  OTControlArguments *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  const __CFString *v25;
  NSObject *v26;
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  int64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  unint64_t Nanoseconds;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  const char *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  unint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  _QWORD block[7];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  _QWORD v56[6];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE buf[12];
  __int16 v68;
  double v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = -1;
  _OctagonSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);
  v49 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchCliqueStatus", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v7;
    _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchCliqueStatus  enableTelemetry=YES ", buf, 0xCu);
  }

  -[OTClique makeOTControl:](self, "makeOTControl:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__4162;
    v61 = __Block_byref_object_dispose__4163;
    v62 = 0;
    v13 = [OTControlArguments alloc];
    -[OTClique ctx](self, "ctx");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[OTControlArguments initWithConfiguration:](v13, "initWithConfiguration:", v14);
    v16 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __37__OTClique__fetchCliqueStatus_error___block_invoke;
    v56[3] = &unk_1E1FCDE80;
    v56[4] = &v63;
    v56[5] = &v57;
    objc_msgSend(v12, "fetchCliqueStatus:configuration:reply:", v15, v50, v56);

    if (_fetchCliqueStatus_error__onceToken != -1)
      dispatch_once(&_fetchCliqueStatus_error__onceToken, &__block_literal_global_244);
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __37__OTClique__fetchCliqueStatus_error___block_invoke_2;
    block[3] = &unk_1E1FCDEC8;
    block[4] = self;
    block[5] = &v52;
    block[6] = &v63;
    dispatch_sync((dispatch_queue_t)_fetchCliqueStatus_error__statusReturnsQueue, block);
    if (v58[5] || !objc_msgSend(v50, "useCachedAccountStatus") || *((_BYTE *)v53 + 24))
    {
      secLogObjForScope("clique-status");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(v50, "useCachedAccountStatus"))
          v18 = (const char *)&unk_18AA61AAF;
        else
          v18 = "non-";
        -[OTClique ctx](self, "ctx");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "context");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTClique ctx](self, "ctx");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "altDSID");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        v24 = v64[3] + 1;
        if (v24 > 5)
          v25 = CFSTR("CliqueStatusIn");
        else
          v25 = off_1E1FCE148[v24];
        v32 = v58[5];
        *(_DWORD *)buf = 136447234;
        *(_QWORD *)&buf[4] = v18;
        v68 = 2112;
        v69 = *(double *)&v20;
        v70 = 2112;
        v71 = v22;
        v72 = 2112;
        v73 = v25;
        v74 = 2112;
        v75 = v32;
        _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "cliqueStatus(%{public}scached)(context:%@, altDSID:%@) returning %@ (error: %@)", buf, 0x34u);

      }
    }
    else
    {
      secLogObjForScope("clique-status");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        if (objc_msgSend(v50, "useCachedAccountStatus"))
          v40 = (const char *)&unk_18AA61AAF;
        else
          v40 = "non-";
        -[OTClique ctx](self, "ctx");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "context");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTClique ctx](self, "ctx");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "altDSID");
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = (void *)v44;
        v46 = v64[3] + 1;
        if (v46 > 5)
          v47 = CFSTR("CliqueStatusIn");
        else
          v47 = off_1E1FCE148[v46];
        v48 = v58[5];
        *(_DWORD *)buf = 136447234;
        *(_QWORD *)&buf[4] = v40;
        v68 = 2112;
        v69 = *(double *)&v42;
        v70 = 2112;
        v71 = v44;
        v72 = 2112;
        v73 = v47;
        v74 = 2112;
        v75 = v48;
        _os_log_debug_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEBUG, "cliqueStatus(%{public}scached)(context:%@, altDSID:%@) returning %@ (error: %@)", buf, 0x34u);

      }
    }

    _Block_object_dispose(&v52, 8);
    v33 = 1;
    if (a4)
    {
      v34 = (void *)v58[5];
      if (v34)
      {
        v33 = 0;
        *a4 = objc_retainAutorelease(v34);
      }
    }
    Nanoseconds = _OctagonSignpostGetNanoseconds(v7, v49);
    _OctagonSignpostLogSystem();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = v33;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v37, OS_SIGNPOST_INTERVAL_END, v7, "FetchCliqueStatus", " OctagonSignpostNameFetchCliqueStatus=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchCliqueStatus}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v7;
      v68 = 2048;
      v69 = (double)Nanoseconds / 1000000000.0;
      v70 = 1026;
      LODWORD(v71) = v33;
      _os_log_impl(&dword_18A900000, v38, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCliqueStatus  OctagonSignpostNameFetchCliqueStatus=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchCliqueStatus}d ", buf, 0x1Cu);
    }

    v31 = v64[3];
    _Block_object_dispose(&v57, 8);

  }
  else
  {
    secLogObjForScope("clique-status");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "cliqueStatus noOTControl", buf, 2u);
    }

    v27 = _OctagonSignpostGetNanoseconds(v7, v49);
    _OctagonSignpostLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_QWORD *)buf = 67240192;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v29, OS_SIGNPOST_INTERVAL_END, v7, "FetchCliqueStatus", " OctagonSignpostNameFetchCliqueStatus=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchCliqueStatus}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v7;
      v68 = 2048;
      v69 = (double)v27 / 1000000000.0;
      v70 = 1026;
      LODWORD(v71) = 0;
      _os_log_impl(&dword_18A900000, v30, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchCliqueStatus  OctagonSignpostNameFetchCliqueStatus=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchCliqueStatus}d ", buf, 0x1Cu);
    }

    v31 = -1;
  }

  _Block_object_dispose(&v63, 8);
  return v31;
}

- (int64_t)fetchCliqueStatus:(id *)a3
{
  OTOperationConfiguration *v5;
  int64_t v6;

  v5 = objc_alloc_init(OTOperationConfiguration);
  -[OTOperationConfiguration setTimeoutWaitForCKAccount:](v5, "setTimeoutWaitForCKAccount:", 0);
  v6 = -[OTClique _fetchCliqueStatus:error:](self, "_fetchCliqueStatus:error:", v5, a3);

  return v6;
}

- (int64_t)cachedCliqueStatus:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  OTOperationConfiguration *v7;
  int64_t v8;

  v5 = a3;
  v7 = objc_alloc_init(OTOperationConfiguration);
  -[OTOperationConfiguration setTimeoutWaitForCKAccount:](v7, "setTimeoutWaitForCKAccount:", 0);
  if (v5)
    -[OTOperationConfiguration setUseCachedAccountStatus:](v7, "setUseCachedAccountStatus:", 1);
  v8 = -[OTClique _fetchCliqueStatus:error:](self, "_fetchCliqueStatus:error:", v7, a4);

  return v8;
}

- (BOOL)removeFriendsInClique:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  OTControlArguments *v26;
  void *v27;
  OTControlArguments *v28;
  void *v29;
  NSObject *v30;
  unint64_t Nanoseconds;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  BOOL v35;
  unint64_t v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  unint64_t v41;
  uint64_t v42;
  _QWORD v44[4];
  id v45;
  _BYTE *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[4];
  os_signpost_id_t v52;
  __int16 v53;
  double v54;
  __int16 v55;
  int v56;
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope("clique-removefriends");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "altDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "removeFriendsInClique invoked using context:%@, altdsid:%@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v42 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v41 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "RemoveFriendsInClique", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v12;
    _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveFriendsInClique  enableTelemetry=YES ", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v48 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (objc_msgSend(v22, "hasPrefix:", CFSTR("SHA256:")))
          v23 = v16;
        else
          v23 = v17;
        objc_msgSend(v23, "addObject:", v22);
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v19);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v58 = __Block_byref_object_copy__4162;
  v59 = __Block_byref_object_dispose__4163;
  v60 = 0;
  if (!objc_msgSend(v16, "count"))
    goto LABEL_23;
  -[OTClique makeOTControl:](self, "makeOTControl:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    secLogObjForScope("clique-removefriends");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v51 = 138412290;
      v52 = (os_signpost_id_t)v16;
      _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "octagon: removing octagon friends: %@", v51, 0xCu);
    }

    v26 = [OTControlArguments alloc];
    -[OTClique ctx](self, "ctx");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[OTControlArguments initWithConfiguration:](v26, "initWithConfiguration:", v27);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __40__OTClique_removeFriendsInClique_error___block_invoke;
    v44[3] = &unk_1E1FCDEF0;
    v46 = buf;
    v45 = v16;
    objc_msgSend(v24, "removeFriendsInClique:peerIDs:reply:", v28, v45, v44);

LABEL_23:
    if (a4)
    {
      v29 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v29)
        *a4 = objc_retainAutorelease(v29);
    }
    secLogObjForScope("clique-removefriends");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v51 = 67109120;
      LODWORD(v52) = 1;
      _os_log_impl(&dword_18A900000, v30, OS_LOG_TYPE_DEFAULT, "removeFriendsInClique complete: %d", v51, 8u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v12, v42);
    _OctagonSignpostLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)v51 = 67240192;
      LODWORD(v52) = 1;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v33, OS_SIGNPOST_INTERVAL_END, v12, "RemoveFriendsInClique", " OctagonSignpostNameRemoveFriendsInClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveFriendsInClique}d ", v51, 8u);
    }

    _OctagonSignpostLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v51 = 134218496;
      v52 = v12;
      v53 = 2048;
      v54 = (double)Nanoseconds / 1000000000.0;
      v55 = 1026;
      v56 = 1;
      _os_log_impl(&dword_18A900000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveFriendsInClique  OctagonSignpostNameRemoveFriendsInClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveFriendsInClique}d ", v51, 0x1Cu);
    }

    v35 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;
    goto LABEL_40;
  }
  v36 = _OctagonSignpostGetNanoseconds(v12, v42);
  _OctagonSignpostLogSystem();
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_DWORD *)v51 = 67240192;
    LODWORD(v52) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v38, OS_SIGNPOST_INTERVAL_END, v12, "RemoveFriendsInClique", " OctagonSignpostNameRemoveFriendsInClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveFriendsInClique}d ", v51, 8u);
  }

  _OctagonSignpostLogSystem();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v51 = 134218496;
    v52 = v12;
    v53 = 2048;
    v54 = (double)v36 / 1000000000.0;
    v55 = 1026;
    v56 = 0;
    _os_log_impl(&dword_18A900000, v39, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveFriendsInClique  OctagonSignpostNameRemoveFriendsInClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveFriendsInClique}d ", v51, 0x1Cu);
  }

  v35 = 0;
LABEL_40:
  _Block_object_dispose(buf, 8);

  return v35;
}

- (BOOL)leaveClique:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  OTOperationConfiguration *v18;
  id *v19;
  int64_t v20;
  NSObject *v21;
  os_signpost_id_t v22;
  unint64_t Nanoseconds;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  BOOL v27;
  unint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  OTControlArguments *v36;
  void *v37;
  OTControlArguments *v38;
  uint64_t v39;
  NSObject *v40;
  unint64_t v41;
  NSObject *v42;
  NSObject *v43;
  _QWORD v45[5];
  id obj;
  uint8_t v47[4];
  os_signpost_id_t v48;
  __int16 v49;
  double v50;
  __int16 v51;
  _BOOL4 v52;
  _BYTE buf[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  secLogObjForScope("clique-leaveClique");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "leaveClique invoked using context:%@, altdsid:%@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "LeaveClique", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: LeaveClique  enableTelemetry=YES ", buf, 0xCu);
  }

  -[OTClique makeOTControl:](self, "makeOTControl:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v54 = __Block_byref_object_copy__4162;
    v55 = __Block_byref_object_dispose__4163;
    v56 = 0;
    v18 = objc_alloc_init(OTOperationConfiguration);
    v19 = (id *)(*(_QWORD *)&buf[8] + 40);
    obj = *(id *)(*(_QWORD *)&buf[8] + 40);
    v20 = -[OTClique fetchCliqueStatus:error:](self, "fetchCliqueStatus:error:", v18, &obj);
    objc_storeStrong(v19, obj);

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      secLogObjForScope("clique-leaveClique");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v47 = 138412290;
        v48 = v22;
        _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "fetching current status errored: %@", v47, 0xCu);
      }

      if (a3)
        *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
      _OctagonSignpostLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_DWORD *)v47 = 67240192;
        LODWORD(v48) = 0;
        _os_signpost_emit_with_name_impl(&dword_18A900000, v25, OS_SIGNPOST_INTERVAL_END, v11, "LeaveClique", " OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", v47, 8u);
      }

      _OctagonSignpostLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v47 = 134218496;
        v48 = v11;
        v49 = 2048;
        v50 = (double)Nanoseconds / 1000000000.0;
        v51 = 1026;
        v52 = 0;
        _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LeaveClique  OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", v47, 0x1Cu);
      }
      v27 = 0;
    }
    else
    {
      if (v20 == 1)
      {
        secLogObjForScope("clique-leaveClique");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v47 = 0;
          _os_log_impl(&dword_18A900000, v32, OS_LOG_TYPE_DEFAULT, "current status is Not In; no need to leave",
            v47,
            2u);
        }

        v33 = _OctagonSignpostGetNanoseconds(v11, v12);
        _OctagonSignpostLogSystem();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          *(_DWORD *)v47 = 67240192;
          LODWORD(v48) = 1;
          _os_signpost_emit_with_name_impl(&dword_18A900000, v35, OS_SIGNPOST_INTERVAL_END, v11, "LeaveClique", " OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", v47, 8u);
        }

        _OctagonSignpostLogSystem();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 1;
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
        *(_DWORD *)v47 = 134218496;
        v48 = v11;
        v49 = 2048;
        v50 = (double)v33 / 1000000000.0;
        v51 = 1026;
        v52 = 1;
      }
      else
      {
        v36 = [OTControlArguments alloc];
        -[OTClique ctx](self, "ctx");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[OTControlArguments initWithConfiguration:](v36, "initWithConfiguration:", v37);
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __24__OTClique_leaveClique___block_invoke;
        v45[3] = &unk_1E1FD8560;
        v45[4] = buf;
        objc_msgSend(v17, "leaveClique:reply:", v38, v45);

        if (a3)
          *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
        v39 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        v27 = v39 == 0;
        secLogObjForScope("clique-leaveClique");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v47 = 67109120;
          LODWORD(v48) = v39 == 0;
          _os_log_impl(&dword_18A900000, v40, OS_LOG_TYPE_DEFAULT, "leaveClique complete: %d", v47, 8u);
        }

        v41 = _OctagonSignpostGetNanoseconds(v11, v12);
        _OctagonSignpostLogSystem();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          *(_DWORD *)v47 = 67240192;
          LODWORD(v48) = v39 == 0;
          _os_signpost_emit_with_name_impl(&dword_18A900000, v43, OS_SIGNPOST_INTERVAL_END, v11, "LeaveClique", " OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", v47, 8u);
        }

        _OctagonSignpostLogSystem();
        v26 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
        *(_DWORD *)v47 = 134218496;
        v48 = v11;
        v49 = 2048;
        v50 = (double)v41 / 1000000000.0;
        v51 = 1026;
        v52 = v39 == 0;
      }
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LeaveClique  OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", v47, 0x1Cu);
    }
LABEL_44:

    _Block_object_dispose(buf, 8);
    goto LABEL_45;
  }
  v28 = _OctagonSignpostGetNanoseconds(v11, v12);
  _OctagonSignpostLogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v29))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v30, OS_SIGNPOST_INTERVAL_END, v11, "LeaveClique", " OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", buf, 8u);
  }

  _OctagonSignpostLogSystem();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (double)v28 / 1000000000.0;
    *(_WORD *)&buf[22] = 1026;
    LODWORD(v54) = 0;
    _os_log_impl(&dword_18A900000, v31, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LeaveClique  OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ", buf, 0x1Cu);
  }

  v27 = 0;
LABEL_45:

  return v27;
}

- (id)peerDeviceNamesByPeerID:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  OTControlArguments *v19;
  void *v20;
  OTControlArguments *v21;
  uint64_t v22;
  void *v23;
  unint64_t Nanoseconds;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  unint64_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  unint64_t v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t v47[4];
  os_signpost_id_t v48;
  __int16 v49;
  double v50;
  __int16 v51;
  int v52;
  _BYTE buf[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  secLogObjForScope("clique");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "peerDeviceNamesByPeerID invoked using context:%@, altdsid:%@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PeerDeviceNamesByPeerID", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PeerDeviceNamesByPeerID  enableTelemetry=YES ", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTClique makeOTControl:](self, "makeOTControl:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v54 = __Block_byref_object_copy__4162;
    v55 = __Block_byref_object_dispose__4163;
    v56 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__4162;
    v45 = __Block_byref_object_dispose__4163;
    v46 = 0;
    v19 = [OTControlArguments alloc];
    -[OTClique ctx](self, "ctx");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[OTControlArguments initWithConfiguration:](v19, "initWithConfiguration:", v20);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __36__OTClique_peerDeviceNamesByPeerID___block_invoke;
    v40[3] = &unk_1E1FCDF18;
    v40[4] = buf;
    v40[5] = &v41;
    objc_msgSend(v18, "peerDeviceNamesByPeerID:reply:", v21, v40);

    v22 = *(_QWORD *)&buf[8];
    if (a3)
    {
      v23 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v23)
      {
        *a3 = objc_retainAutorelease(v23);
        v22 = *(_QWORD *)&buf[8];
      }
    }
    if (*(_QWORD *)(v22 + 40))
    {
      Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
      _OctagonSignpostLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_DWORD *)v47 = 67240192;
        LODWORD(v48) = 0;
        _os_signpost_emit_with_name_impl(&dword_18A900000, v26, OS_SIGNPOST_INTERVAL_END, v11, "PeerDeviceNamesByPeerID", " OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ", v47, 8u);
      }

      _OctagonSignpostLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v47 = 134218496;
        v48 = v11;
        v49 = 2048;
        v50 = (double)Nanoseconds / 1000000000.0;
        v51 = 1026;
        v52 = 0;
        _os_log_impl(&dword_18A900000, v27, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PeerDeviceNamesByPeerID  OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ", v47, 0x1Cu);
      }

      v28 = 0;
    }
    else
    {
      objc_msgSend(v17, "addEntriesFromDictionary:", v42[5]);
      secLogObjForScope("clique");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = objc_msgSend((id)v42[5], "count");
        *(_DWORD *)v47 = 134217984;
        v48 = v34;
        _os_log_impl(&dword_18A900000, v33, OS_LOG_TYPE_DEFAULT, "Received %lu Octagon peers", v47, 0xCu);
      }

      v35 = _OctagonSignpostGetNanoseconds(v11, v12);
      _OctagonSignpostLogSystem();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_DWORD *)v47 = 67240192;
        LODWORD(v48) = 0;
        _os_signpost_emit_with_name_impl(&dword_18A900000, v37, OS_SIGNPOST_INTERVAL_END, v11, "PeerDeviceNamesByPeerID", " OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ", v47, 8u);
      }

      _OctagonSignpostLogSystem();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v47 = 134218496;
        v48 = v11;
        v49 = 2048;
        v50 = (double)v35 / 1000000000.0;
        v51 = 1026;
        v52 = 0;
        _os_log_impl(&dword_18A900000, v38, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PeerDeviceNamesByPeerID  OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ", v47, 0x1Cu);
      }

      v28 = v17;
    }
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v29 = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v31, OS_SIGNPOST_INTERVAL_END, v11, "PeerDeviceNamesByPeerID", " OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)v29 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v54) = 0;
      _os_log_impl(&dword_18A900000, v32, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PeerDeviceNamesByPeerID  OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ", buf, 0x1Cu);
    }

    v28 = 0;
  }

  return v28;
}

- (BOOL)joinAfterRestore:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  const __CFString *v27;
  unint64_t Nanoseconds;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v33;
  uint64_t v34;
  const __CFString *v35;
  uint8_t buf[4];
  _BYTE v37[18];
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  secLogObjForScope("clique-recovery");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v37 = v7;
    *(_WORD *)&v37[8] = 2112;
    *(_QWORD *)&v37[10] = v9;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "joinAfterRestore for context:%@, altdsid:%@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "JoinAfterRestore", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v37 = v11;
    _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: JoinAfterRestore  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS](OTClique, "platformSupportsSOS"))
  {
    v33 = 0;
    v17 = SOSCCRequestToJoinCircleAfterRestore((CFTypeRef *)&v33);
    if (a3)
      *a3 = v33;
    else

    secLogObjForScope("clique-recovery");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v27 = (const __CFString *)*a3;
      else
        v27 = CFSTR("no error pointer provided");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v37 = v17;
      *(_WORD *)&v37[4] = 2112;
      *(_QWORD *)&v37[6] = v27;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "joinAfterRestore complete: %d %@", buf, 0x12u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v37 = v17;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v30, OS_SIGNPOST_INTERVAL_END, v11, "JoinAfterRestore", " OctagonSignpostNameJoinAfterRestore=%{public,signpost.telemetry:number1,name=OctagonSignpostNameJoinAfterRestore}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v37 = v11;
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = v17;
      _os_log_impl(&dword_18A900000, v31, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: JoinAfterRestore  OctagonSignpostNameJoinAfterRestore=%{public,signpost.telemetry:number1,name=OctagonSignpostNameJoinAfterRestore}d ", buf, 0x1Cu);
    }

  }
  else
  {
    secLogObjForScope("clique-recovery");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a3)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2F90];
      v34 = *MEMORY[0x1E0CB2D50];
      v35 = CFSTR("join after restore unimplemented");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, -4, v21);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v22 = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v37 = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v11, "JoinAfterRestore", " OctagonSignpostNameJoinAfterRestore=%{public,signpost.telemetry:number1,name=OctagonSignpostNameJoinAfterRestore}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v37 = v11;
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)v22 / 1000000000.0;
      v38 = 1026;
      v39 = 0;
      _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: JoinAfterRestore  OctagonSignpostNameJoinAfterRestore=%{public,signpost.telemetry:number1,name=OctagonSignpostNameJoinAfterRestore}d ", buf, 0x1Cu);
    }

    LOBYTE(v17) = 0;
  }
  return v17;
}

- (BOOL)setOctagonUserControllableViewsSyncEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  OTControlArguments *v10;
  void *v11;
  OTControlArguments *v12;
  uint64_t *v13;
  void *v14;
  BOOL v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  const __CFString *v25;
  uint64_t v26;

  v5 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  -[OTClique makeOTControl:](self, "makeOTControl:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__4162;
    v22 = __Block_byref_object_dispose__4163;
    v23 = 0;
    secLogObjForScope("clique-user-sync");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("paused");
      if (v5)
        v9 = CFSTR("enabled");
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "setting user-controllable-sync status to %@", buf, 0xCu);
    }

    v10 = [OTControlArguments alloc];
    -[OTClique ctx](self, "ctx");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[OTControlArguments initWithConfiguration:](v10, "initWithConfiguration:", v11);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__OTClique_setOctagonUserControllableViewsSyncEnabled_error___block_invoke;
    v17[3] = &unk_1E1FCDF40;
    v17[4] = &v18;
    objc_msgSend(v7, "setUserControllableViewsSyncStatus:enabled:reply:", v12, v5, v17);

    v13 = v19;
    if (a4)
    {
      v14 = (void *)v19[5];
      if (v14)
      {
        *a4 = objc_retainAutorelease(v14);
        v13 = v19;
      }
    }
    v15 = v13[5] == 0;
    _Block_object_dispose(&v18, 8);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)fetchUserControllableViewsSyncingEnabled:(id *)a3
{
  void *v5;
  OTControlArguments *v6;
  void *v7;
  OTControlArguments *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4162;
  v17 = __Block_byref_object_dispose__4163;
  v18 = 0;
  -[OTClique makeOTControl:](self, "makeOTControl:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [OTControlArguments alloc];
    -[OTClique ctx](self, "ctx");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[OTControlArguments initWithConfiguration:](v6, "initWithConfiguration:", v7);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__OTClique_fetchUserControllableViewsSyncingEnabled___block_invoke;
    v12[3] = &unk_1E1FCDF68;
    v12[4] = &v19;
    v12[5] = &v13;
    objc_msgSend(v5, "fetchUserControllableViewsSyncStatus:reply:", v8, v12);

    v9 = (void *)v14[5];
    if (v9 && a3)
      *a3 = objc_retainAutorelease(v9);
    v10 = *((_BYTE *)v20 + 24) != 0;
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)fetchUserControllableViewsSyncingEnabledAsync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  OTControlArguments *v7;
  void *v8;
  OTControlArguments *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v12 = 0;
  -[OTClique makeOTControl:](self, "makeOTControl:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    v7 = [OTControlArguments alloc];
    -[OTClique ctx](self, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[OTControlArguments initWithConfiguration:](v7, "initWithConfiguration:", v8);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__OTClique_fetchUserControllableViewsSyncingEnabledAsync___block_invoke;
    v10[3] = &unk_1E1FD6060;
    v11 = v4;
    objc_msgSend(v5, "fetchUserControllableViewsSyncStatusAsync:reply:", v9, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v6);
  }

}

- (BOOL)waitForInitialSync:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  const __CFString *v27;
  unint64_t Nanoseconds;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v33;
  uint64_t v34;
  const __CFString *v35;
  uint8_t buf[4];
  _BYTE v37[18];
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  secLogObjForScope("clique-legacy");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v37 = v7;
    *(_WORD *)&v37[8] = 2112;
    *(_QWORD *)&v37[10] = v9;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "waitForInitialSync for context:%@, altdsid:%@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "WaitForInitialSync", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v37 = v11;
    _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: WaitForInitialSync  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS](OTClique, "platformSupportsSOS"))
  {
    v33 = 0;
    v17 = SOSCCWaitForInitialSync((CFTypeRef *)&v33);
    if (a3)
      *a3 = v33;
    else

    secLogObjForScope("clique-legacy");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v27 = (const __CFString *)*a3;
      else
        v27 = CFSTR("no error pointer provided");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v37 = v17;
      *(_WORD *)&v37[4] = 2112;
      *(_QWORD *)&v37[6] = v27;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "waitForInitialSync waited: %d %@", buf, 0x12u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v37 = v17;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v30, OS_SIGNPOST_INTERVAL_END, v11, "WaitForInitialSync", " OctagonSignpostNameWaitForInitialSync=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForInitialSync}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v37 = v11;
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = v17;
      _os_log_impl(&dword_18A900000, v31, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: WaitForInitialSync  OctagonSignpostNameWaitForInitialSync=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForInitialSync}d ", buf, 0x1Cu);
    }

  }
  else
  {
    secLogObjForScope("clique-legacy");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a3)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2F90];
      v34 = *MEMORY[0x1E0CB2D50];
      v35 = CFSTR("wait for initial sync unimplemented");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, -4, v21);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v22 = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v37 = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v11, "WaitForInitialSync", " OctagonSignpostNameWaitForInitialSync=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForInitialSync}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v37 = v11;
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)v22 / 1000000000.0;
      v38 = 1026;
      v39 = 0;
      _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: WaitForInitialSync  OctagonSignpostNameWaitForInitialSync=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForInitialSync}d ", buf, 0x1Cu);
    }

    LOBYTE(v17) = 0;
  }
  return v17;
}

- (id)copyViewUnawarePeerInfo:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  unint64_t Nanoseconds;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  uint8_t buf[4];
  os_signpost_id_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  secLogObjForScope("clique-legacy");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v35 = (os_signpost_id_t)v7;
    v36 = 2112;
    v37 = *(double *)&v9;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "copyViewUnawarePeerInfo for context:%@, altdsid:%@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CopyViewUnawarePeerInfo", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = v11;
    _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CopyViewUnawarePeerInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS](OTClique, "platformSupportsSOS"))
  {
    v31 = 0;
    v17 = (void *)SOSCCCopyViewUnawarePeerInfo((CFTypeRef *)&v31);
    if (a3)
      *a3 = v31;
    else

    Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v35) = v17 != 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v28, OS_SIGNPOST_INTERVAL_END, v11, "CopyViewUnawarePeerInfo", " OctagonSignpostNameCopyViewUnawarePeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyViewUnawarePeerInfo}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v35 = v11;
      v36 = 2048;
      v37 = (double)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = v17 != 0;
      _os_log_impl(&dword_18A900000, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CopyViewUnawarePeerInfo  OctagonSignpostNameCopyViewUnawarePeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyViewUnawarePeerInfo}d ", buf, 0x1Cu);
    }

  }
  else
  {
    secLogObjForScope("clique-legacy");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NULL", buf, 2u);
    }

    if (a3)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2F90];
      v32 = *MEMORY[0x1E0CB2D50];
      v33 = CFSTR("copy view unaware peer info unimplemented");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, -4, v21);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v22 = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v35) = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v11, "CopyViewUnawarePeerInfo", " OctagonSignpostNameCopyViewUnawarePeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyViewUnawarePeerInfo}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v35 = v11;
      v36 = 2048;
      v37 = (double)v22 / 1000000000.0;
      v38 = 1026;
      v39 = 0;
      _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CopyViewUnawarePeerInfo  OctagonSignpostNameCopyViewUnawarePeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyViewUnawarePeerInfo}d ", buf, 0x1Cu);
    }

    return 0;
  }
  return v17;
}

- (BOOL)setUserCredentialsWithLabel:(id)a3 password:(id)a4 dsid:(id)a5 error:(id *)a6
{
  __CFString *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  unint64_t Nanoseconds;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  id v40;
  uint64_t v41;
  const __CFString *v42;
  uint8_t buf[4];
  _BYTE v44[18];
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  secLogObjForScope("clique-legacy");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "altDSID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v44 = v15;
    *(_WORD *)&v44[8] = 2112;
    *(_QWORD *)&v44[10] = v17;
    _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "setUserCredentialsAndDSID for context:%@, altdsid:%@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_generate(v18);
  v20 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v23 = v19 - 1;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v19, "SetUserCredentialsAndDSID", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v44 = v19;
    _os_log_impl(&dword_18A900000, v24, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetUserCredentialsAndDSID  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS](OTClique, "platformSupportsSOS"))
  {
    v40 = 0;
    v25 = SOSCCSetUserCredentialsAndDSID(v10, (uint64_t)v11, (uint64_t)v12, (CFTypeRef *)&v40);
    secLogObjForScope("clique-legacy");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v44 = v25;
      *(_WORD *)&v44[4] = 2112;
      *(_QWORD *)&v44[6] = v40;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "setUserCredentialsAndDSID results: %d %@", buf, 0x12u);
    }

    if (a6)
      *a6 = v40;
    else

    Nanoseconds = _OctagonSignpostGetNanoseconds(v19, v20);
    _OctagonSignpostLogSystem();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v44 = v25;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v37, OS_SIGNPOST_INTERVAL_END, v19, "SetUserCredentialsAndDSID", " OctagonSignpostNameSetUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetUserCredentialsAndDSID}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v44 = v19;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = (double)Nanoseconds / 1000000000.0;
      v45 = 1026;
      v46 = v25;
      _os_log_impl(&dword_18A900000, v38, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetUserCredentialsAndDSID  OctagonSignpostNameSetUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetUserCredentialsAndDSID}d ", buf, 0x1Cu);
    }

  }
  else
  {
    secLogObjForScope("clique-legacy");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v27, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a6)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2F90];
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = CFSTR("set user credentials unimplemented");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, -4, v30);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v31 = _OctagonSignpostGetNanoseconds(v19, v20);
    _OctagonSignpostLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v44 = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v33, OS_SIGNPOST_INTERVAL_END, v19, "SetUserCredentialsAndDSID", " OctagonSignpostNameSetUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetUserCredentialsAndDSID}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v44 = v19;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = (double)v31 / 1000000000.0;
      v45 = 1026;
      v46 = 0;
      _os_log_impl(&dword_18A900000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetUserCredentialsAndDSID  OctagonSignpostNameSetUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetUserCredentialsAndDSID}d ", buf, 0x1Cu);
    }

    LOBYTE(v25) = 0;
  }

  return v25;
}

- (BOOL)setUserCredentialsAndDSID:(id)a3 password:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[OTClique ctx](self, "ctx");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dsid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[OTClique setUserCredentialsWithLabel:password:dsid:error:](self, "setUserCredentialsWithLabel:password:dsid:error:", v9, v8, v11, a5);

  return (char)a5;
}

- (BOOL)tryUserCredentialsWithLabel:(id)a3 password:(id)a4 dsid:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  unint64_t Nanoseconds;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  id v40;
  uint64_t v41;
  const __CFString *v42;
  uint8_t buf[4];
  _BYTE v44[18];
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  secLogObjForScope("clique-legacy");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "altDSID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v44 = v15;
    *(_WORD *)&v44[8] = 2112;
    *(_QWORD *)&v44[10] = v17;
    _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "tryUserCredentialsAndDSID for context:%@, altdsid:%@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_generate(v18);
  v20 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v23 = v19 - 1;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v19, "TryUserCredentialsAndDSID", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v44 = v19;
    _os_log_impl(&dword_18A900000, v24, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TryUserCredentialsAndDSID  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS](OTClique, "platformSupportsSOS"))
  {
    v40 = 0;
    v25 = SOSCCTryUserCredentialsAndDSID((uint64_t)v10, (uint64_t)v11, v12, (CFTypeRef *)&v40);
    secLogObjForScope("clique-legacy");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v44 = v25;
      *(_WORD *)&v44[4] = 2112;
      *(_QWORD *)&v44[6] = v40;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "tryUserCredentialsAndDSID results: %d %@", buf, 0x12u);
    }

    if (a6)
      *a6 = v40;
    else

    Nanoseconds = _OctagonSignpostGetNanoseconds(v19, v20);
    _OctagonSignpostLogSystem();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v44 = v25;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v37, OS_SIGNPOST_INTERVAL_END, v19, "TryUserCredentialsAndDSID", " OctagonSignpostNameTryUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameTryUserCredentialsAndDSID}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v44 = v19;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = (double)Nanoseconds / 1000000000.0;
      v45 = 1026;
      v46 = v25;
      _os_log_impl(&dword_18A900000, v38, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TryUserCredentialsAndDSID  OctagonSignpostNameTryUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameTryUserCredentialsAndDSID}d ", buf, 0x1Cu);
    }

  }
  else
  {
    secLogObjForScope("clique-legacy");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v27, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a6)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2F90];
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = CFSTR("try user credentials unimplemented");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, -4, v30);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v31 = _OctagonSignpostGetNanoseconds(v19, v20);
    _OctagonSignpostLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v44 = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v33, OS_SIGNPOST_INTERVAL_END, v19, "TryUserCredentialsAndDSID", " OctagonSignpostNameTryUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameTryUserCredentialsAndDSID}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v44 = v19;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = (double)v31 / 1000000000.0;
      v45 = 1026;
      v46 = 0;
      _os_log_impl(&dword_18A900000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: TryUserCredentialsAndDSID  OctagonSignpostNameTryUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameTryUserCredentialsAndDSID}d ", buf, 0x1Cu);
    }

    LOBYTE(v25) = 0;
  }

  return v25;
}

- (BOOL)tryUserCredentialsAndDSID:(id)a3 password:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[OTClique ctx](self, "ctx");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dsid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[OTClique tryUserCredentialsWithLabel:password:dsid:error:](self, "tryUserCredentialsWithLabel:password:dsid:error:", v9, v8, v11, a5);

  return (char)a5;
}

- (id)copyPeerPeerInfo:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  unint64_t Nanoseconds;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  id v32;
  uint64_t v33;
  const __CFString *v34;
  uint8_t buf[4];
  os_signpost_id_t v36;
  __int16 v37;
  double v38;
  __int16 v39;
  _BOOL4 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  secLogObjForScope("clique-legacy");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v36 = (os_signpost_id_t)v7;
    v37 = 2112;
    v38 = *(double *)&v9;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "copyPeerPeerInfo for context:%@, altdsid:%@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CopyPeerPeerInfo", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v36 = v11;
    _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CopyPeerPeerInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS](OTClique, "platformSupportsSOS"))
  {
    v32 = 0;
    v17 = (void *)SOSCCCopyPeerPeerInfo((CFTypeRef *)&v32);
    secLogObjForScope("clique-legacy");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = (os_signpost_id_t)v17;
      v37 = 2112;
      v38 = *(double *)&v32;
      _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, "copyPeerPeerInfo results: %@ (%@)", buf, 0x16u);
    }

    if (a3)
      *a3 = v32;
    else

    Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v36) = v17 != 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v29, OS_SIGNPOST_INTERVAL_END, v11, "CopyPeerPeerInfo", " OctagonSignpostNameCopyPeerPeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyPeerPeerInfo}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v36 = v11;
      v37 = 2048;
      v38 = (double)Nanoseconds / 1000000000.0;
      v39 = 1026;
      v40 = v17 != 0;
      _os_log_impl(&dword_18A900000, v30, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CopyPeerPeerInfo  OctagonSignpostNameCopyPeerPeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyPeerPeerInfo}d ", buf, 0x1Cu);
    }

  }
  else
  {
    secLogObjForScope("clique-legacy");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v19, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a3)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2F90];
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = CFSTR("copy peer peer info unimplemented");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, -4, v22);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v23 = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v36) = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v25, OS_SIGNPOST_INTERVAL_END, v11, "CopyPeerPeerInfo", " OctagonSignpostNameCopyPeerPeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyPeerPeerInfo}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v36 = v11;
      v37 = 2048;
      v38 = (double)v23 / 1000000000.0;
      v39 = 1026;
      v40 = 0;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CopyPeerPeerInfo  OctagonSignpostNameCopyPeerPeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyPeerPeerInfo}d ", buf, 0x1Cu);
    }

    return 0;
  }
  return v17;
}

- (BOOL)peersHaveViewsEnabled:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  const __CFBoolean *HaveViewsEnabled;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  unint64_t Nanoseconds;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  uint8_t buf[4];
  _BYTE v39[18];
  __int16 v40;
  _BOOL4 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  secLogObjForScope("clique-legacy");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v39 = v9;
    *(_WORD *)&v39[8] = 2112;
    *(_QWORD *)&v39[10] = v11;
    _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "peersHaveViewsEnabled for context:%@, altdsid:%@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PeersHaveViewsEnabled", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v39 = v13;
    _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PeersHaveViewsEnabled  enableTelemetry=YES ", buf, 0xCu);
  }

  if (+[OTClique platformSupportsSOS](OTClique, "platformSupportsSOS"))
  {
    v35 = 0;
    HaveViewsEnabled = (const __CFBoolean *)SOSCCPeersHaveViewsEnabled((uint64_t)v6, (CFTypeRef *)&v35);
    if (HaveViewsEnabled)
      v20 = CFBooleanGetValue(HaveViewsEnabled) != 0;
    else
      v20 = 0;
    secLogObjForScope("clique-legacy");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v39 = v20;
      *(_WORD *)&v39[4] = 2112;
      *(_QWORD *)&v39[6] = v35;
      _os_log_impl(&dword_18A900000, v29, OS_LOG_TYPE_DEFAULT, "peersHaveViewsEnabled results: %{BOOL}d (%@)", buf, 0x12u);
    }

    if (a4)
      *a4 = v35;
    else

    Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v39 = v20;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v32, OS_SIGNPOST_INTERVAL_END, v13, "PeersHaveViewsEnabled", " OctagonSignpostNamePeersHaveViewsEnabled=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeersHaveViewsEnabled}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v39 = v13;
      *(_WORD *)&v39[8] = 2048;
      *(double *)&v39[10] = (double)Nanoseconds / 1000000000.0;
      v40 = 1026;
      v41 = v20;
      _os_log_impl(&dword_18A900000, v33, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PeersHaveViewsEnabled  OctagonSignpostNamePeersHaveViewsEnabled=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeersHaveViewsEnabled}d ", buf, 0x1Cu);
    }

  }
  else
  {
    secLogObjForScope("clique-legacy");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a4)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2F90];
      v36 = *MEMORY[0x1E0CB2D50];
      v37 = CFSTR("peers have views enabled unimplemented");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, -4, v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v25 = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v39 = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v27, OS_SIGNPOST_INTERVAL_END, v13, "PeersHaveViewsEnabled", " OctagonSignpostNamePeersHaveViewsEnabled=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeersHaveViewsEnabled}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v39 = v13;
      *(_WORD *)&v39[8] = 2048;
      *(double *)&v39[10] = (double)v25 / 1000000000.0;
      v40 = 1026;
      v41 = 0;
      _os_log_impl(&dword_18A900000, v28, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PeersHaveViewsEnabled  OctagonSignpostNamePeersHaveViewsEnabled=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeersHaveViewsEnabled}d ", buf, 0x1Cu);
    }

    LOBYTE(v20) = 0;
  }

  return v20;
}

- (BOOL)requestToJoinCircle:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t Nanoseconds;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  const __CFString *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  NSObject *v36;
  NSObject *v37;
  unint64_t v38;
  NSObject *v39;
  NSObject *v40;
  unint64_t v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  _BYTE v48[18];
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  _OctagonSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "RequestToJoinCircle", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v48 = v6;
    _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RequestToJoinCircle  enableTelemetry=YES ", buf, 0xCu);
  }

  secLogObjForScope("clique-legacy");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "altDSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v48 = v14;
    *(_WORD *)&v48[8] = 2112;
    *(_QWORD *)&v48[10] = v16;
    _os_log_impl(&dword_18A900000, v12, OS_LOG_TYPE_DEFAULT, "requestToJoinCircle for context:%@, altdsid:%@", buf, 0x16u);

  }
  v46 = 0;
  v17 = -[OTClique fetchCliqueStatus:](self, "fetchCliqueStatus:", &v46);
  v18 = v46;
  if (v18)
  {
    v19 = v18;
    secLogObjForScope("clique-legacy");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v48 = v19;
      _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "fetching clique status failed: %@", buf, 0xCu);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v19);
    Nanoseconds = _OctagonSignpostGetNanoseconds(v6, v7);
    _OctagonSignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v48 = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v23, OS_SIGNPOST_INTERVAL_END, v6, "RequestToJoinCircle", " OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    goto LABEL_17;
  }
  secLogObjForScope("clique-legacy");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v17 != 3)
  {
    if (!v28)
      goto LABEL_39;
    if ((unint64_t)(v17 + 1) > 5)
      v32 = CFSTR("CliqueStatusIn");
    else
      v32 = off_1E1FCE178[v17 + 1];
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v48 = v32;
    v33 = "clique status is %@; performing no Octagon actions";
    v34 = v27;
    v35 = 12;
    goto LABEL_38;
  }
  if (v28)
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v48 = CFSTR("CliqueStatusAbsent");
    _os_log_impl(&dword_18A900000, v27, OS_LOG_TYPE_DEFAULT, "clique status is %@; beginning an establish", buf, 0xCu);
  }

  v45 = 0;
  -[OTClique establish:](self, "establish:", &v45);
  v29 = v45;
  if (v29)
  {
    v19 = v29;
    if (a3)
      *a3 = objc_retainAutorelease(v29);
    Nanoseconds = _OctagonSignpostGetNanoseconds(v6, v7);
    _OctagonSignpostLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v48 = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v31, OS_SIGNPOST_INTERVAL_END, v6, "RequestToJoinCircle", " OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
LABEL_17:
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v48 = v6;
    *(_WORD *)&v48[8] = 2048;
    *(double *)&v48[10] = (double)Nanoseconds / 1000000000.0;
    v49 = 1026;
    v50 = 0;
    _os_log_impl(&dword_18A900000, v24, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RequestToJoinCircle  OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ", buf, 0x1Cu);
LABEL_18:

    LOBYTE(v25) = 0;
    goto LABEL_19;
  }
  secLogObjForScope("clique-legacy");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v33 = "establish succeeded";
    v34 = v27;
    v35 = 2;
LABEL_38:
    _os_log_impl(&dword_18A900000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
  }
LABEL_39:

  if (+[OTClique platformSupportsSOS](OTClique, "platformSupportsSOS"))
  {
    if (+[OTClique platformSupportsSOS](OTClique, "platformSupportsSOS"))
    {
      v44 = 0;
      v25 = SOSCCRequestToJoinCircle((CFTypeRef *)&v44);
      secLogObjForScope("clique-legacy");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v48 = v25;
        *(_WORD *)&v48[4] = 2112;
        *(_QWORD *)&v48[6] = v44;
        _os_log_impl(&dword_18A900000, v36, OS_LOG_TYPE_DEFAULT, "sos requestToJoinCircle complete: %d %@", buf, 0x12u);
      }

      if (a3)
        *a3 = v44;
      else

    }
    else
    {
      v25 = 0;
    }
    v41 = _OctagonSignpostGetNanoseconds(v6, v7);
    _OctagonSignpostLogSystem();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v48 = v25;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v43, OS_SIGNPOST_INTERVAL_END, v6, "RequestToJoinCircle", " OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v48 = v6;
      *(_WORD *)&v48[8] = 2048;
      *(double *)&v48[10] = (double)v41 / 1000000000.0;
      v49 = 1026;
      v50 = v25;
      goto LABEL_59;
    }
  }
  else
  {
    secLogObjForScope("clique-legacy");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v37, OS_LOG_TYPE_DEFAULT, "requestToJoinCircle platform does not support SOS", buf, 2u);
    }

    v38 = _OctagonSignpostGetNanoseconds(v6, v7);
    _OctagonSignpostLogSystem();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v48 = 1;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v40, OS_SIGNPOST_INTERVAL_END, v6, "RequestToJoinCircle", " OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = 1;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v48 = v6;
      *(_WORD *)&v48[8] = 2048;
      *(double *)&v48[10] = (double)v38 / 1000000000.0;
      v49 = 1026;
      v50 = 1;
LABEL_59:
      _os_log_impl(&dword_18A900000, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RequestToJoinCircle  OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ", buf, 0x1Cu);
    }
  }
LABEL_19:

  return v25;
}

- (BOOL)accountUserKeyAvailable
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  unint64_t Nanoseconds;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  int v26;
  os_signpost_id_t v27;
  __int16 v28;
  double v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  secLogObjForScope("clique-legacy");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412546;
    v27 = (os_signpost_id_t)v5;
    v28 = 2112;
    v29 = *(double *)&v7;
    _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, "accountUserKeyAvailable for context:%@, altdsid:%@", (uint8_t *)&v26, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AccountUserKeyAvailable", " enableTelemetry=YES ", (uint8_t *)&v26, 2u);
  }

  _OctagonSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 134217984;
    v27 = v9;
    _os_log_impl(&dword_18A900000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AccountUserKeyAvailable  enableTelemetry=YES ", (uint8_t *)&v26, 0xCu);
  }

  if (+[OTClique platformSupportsSOS](OTClique, "platformSupportsSOS"))
  {
    v15 = SOSCCCanAuthenticate(0);
    if ((v15 & 1) == 0)
    {
      secLogObjForScope("clique-legacy");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, "Security requires credentials...", (uint8_t *)&v26, 2u);
      }

    }
    Nanoseconds = _OctagonSignpostGetNanoseconds(v9, v10);
    _OctagonSignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      v26 = 67240192;
      LODWORD(v27) = v15;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v19, OS_SIGNPOST_INTERVAL_END, v9, "AccountUserKeyAvailable", " OctagonSignpostNameAccountUserKeyAvailable=%{public,signpost.telemetry:number1,name=OctagonSignpostNameAccountUserKeyAvailable}d ", (uint8_t *)&v26, 8u);
    }

    _OctagonSignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 134218496;
      v27 = v9;
      v28 = 2048;
      v29 = (double)Nanoseconds / 1000000000.0;
      v30 = 1026;
      v31 = v15;
      _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: AccountUserKeyAvailable  OctagonSignpostNameAccountUserKeyAvailable=%{public,signpost.telemetry:number1,name=OctagonSignpostNameAccountUserKeyAvailable}d ", (uint8_t *)&v26, 0x1Cu);
    }
  }
  else
  {
    secLogObjForScope("clique-legacy");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", (uint8_t *)&v26, 2u);
    }

    v22 = _OctagonSignpostGetNanoseconds(v9, v10);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v26 = 67240192;
      LODWORD(v27) = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v9, "AccountUserKeyAvailable", " OctagonSignpostNameAccountUserKeyAvailable=%{public,signpost.telemetry:number1,name=OctagonSignpostNameAccountUserKeyAvailable}d ", (uint8_t *)&v26, 8u);
    }

    _OctagonSignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 134218496;
      v27 = v9;
      v28 = 2048;
      v29 = (double)v22 / 1000000000.0;
      v30 = 1026;
      v31 = 0;
      _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: AccountUserKeyAvailable  OctagonSignpostNameAccountUserKeyAvailable=%{public,signpost.telemetry:number1,name=OctagonSignpostNameAccountUserKeyAvailable}d ", (uint8_t *)&v26, 0x1Cu);
    }
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)fetchEscrowContents:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  OTControlArguments *v18;
  void *v19;
  OTControlArguments *v20;
  unint64_t Nanoseconds;
  NSObject *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  int v26;
  _QWORD v27[4];
  id v28;
  _BYTE *v29;
  os_signpost_id_t v30;
  uint64_t v31;
  id v32;
  uint8_t v33[4];
  os_signpost_id_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  int v38;
  _BYTE buf[24];
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  secLogObjForScope("clique-fetchescrow");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "fetching entropy for bottling for context:%@, altdsid:%@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FetchEscrowContents", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchEscrowContents  enableTelemetry=YES ", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v40 = 0;
  v32 = 0;
  -[OTClique makeOTControl:](self, "makeOTControl:", &v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v32;
  if (v16)
  {
    v18 = [OTControlArguments alloc];
    -[OTClique ctx](self, "ctx");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[OTControlArguments initWithConfiguration:](v18, "initWithConfiguration:", v19);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __32__OTClique_fetchEscrowContents___block_invoke;
    v27[3] = &unk_1E1FCDFE0;
    v29 = buf;
    v30 = v11;
    v31 = v12;
    v28 = v4;
    objc_msgSend(v16, "fetchEscrowContents:reply:", v20, v27);

  }
  else
  {
    Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v24 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
      *(_DWORD *)v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v23, OS_SIGNPOST_INTERVAL_END, v11, "FetchEscrowContents", " OctagonSignpostNameFetchEscrowContents=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowContents}d ", v33, 8u);
    }

    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 134218496;
      v26 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
      v34 = v11;
      v35 = 2048;
      v36 = (double)Nanoseconds / 1000000000.0;
      v37 = 1026;
      v38 = v26;
      _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEscrowContents  OctagonSignpostNameFetchEscrowContents=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowContents}d ", v33, 0x1Cu);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v4 + 2))(v4, 0, 0, 0, v17);
  }

  _Block_object_dispose(buf, 8);
}

- (void)performedCDPStateMachineRun:(id)a3 success:(BOOL)a4 error:(id)a5 reply:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  OTControlArguments *v20;
  void *v21;
  OTControlArguments *v22;
  NSObject *v23;
  unint64_t Nanoseconds;
  NSObject *v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  __int128 *p_buf;
  os_signpost_id_t v36;
  uint64_t v37;
  BOOL v38;
  id v39;
  uint8_t v40[4];
  os_signpost_id_t v41;
  __int16 v42;
  double v43;
  __int16 v44;
  int v45;
  __int128 buf;
  uint64_t v47;
  char v48;
  uint64_t v49;

  v8 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v10 = a5;
  v11 = a6;
  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PerformedCDPStateMachineRun", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformedCDPStateMachineRun  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v47 = 0x2020000000;
  v48 = 0;
  v39 = 0;
  -[OTClique makeOTControl:](self, "makeOTControl:", &v39);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v39;
  if (v18)
  {
    v20 = [OTControlArguments alloc];
    -[OTClique ctx](self, "ctx");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[OTControlArguments initWithConfiguration:](v20, "initWithConfiguration:", v21);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __60__OTClique_performedCDPStateMachineRun_success_error_reply___block_invoke;
    v31[3] = &unk_1E1FCE0D0;
    v36 = v13;
    v37 = v14;
    v32 = v30;
    p_buf = &buf;
    v34 = v11;
    v38 = v8;
    v33 = v10;
    objc_msgSend(v18, "postCDPFollowupResult:success:type:error:reply:", v22, v8, v32, v33, v31);

  }
  else
  {
    secLogObjForScope("clique-cdp-sm");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v40 = 138412290;
      v41 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18A900000, v23, OS_LOG_TYPE_DEFAULT, "octagon, failed to fetch OTControl object: %@", v40, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      v27 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v40 = 67240192;
      LODWORD(v41) = v27;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v26, OS_SIGNPOST_INTERVAL_END, v13, "PerformedCDPStateMachineRun", " OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ", v40, 8u);
    }

    _OctagonSignpostLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v40 = 134218496;
      v29 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v41 = v13;
      v42 = 2048;
      v43 = (double)Nanoseconds / 1000000000.0;
      v44 = 1026;
      v45 = v29;
      _os_log_impl(&dword_18A900000, v28, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformedCDPStateMachineRun  OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ", v40, 0x1Cu);
    }

    (*((void (**)(id, id))v11 + 2))(v11, v19);
  }

  _Block_object_dispose(&buf, 8);
}

- (BOOL)waitForOctagonUpgrade:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  OTControlArguments *v14;
  void *v15;
  OTControlArguments *v16;
  void *v17;
  int v18;
  unint64_t Nanoseconds;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  BOOL v23;
  NSObject *v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  id v35;
  uint8_t v36[4];
  os_signpost_id_t v37;
  __int16 v38;
  double v39;
  __int16 v40;
  int v41;
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  _OctagonSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "WaitForOctagonUpgrade", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: WaitForOctagonUpgrade  enableTelemetry=YES ", buf, 0xCu);
  }

  v35 = 0;
  -[OTClique makeOTControl:](self, "makeOTControl:", &v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v35;
  if (v12)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v43 = __Block_byref_object_copy__4162;
    v44 = __Block_byref_object_dispose__4163;
    v45 = 0;
    v14 = [OTControlArguments alloc];
    -[OTClique ctx](self, "ctx");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[OTControlArguments initWithConfiguration:](v14, "initWithConfiguration:", v15);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __34__OTClique_waitForOctagonUpgrade___block_invoke;
    v30[3] = &unk_1E1FCDE38;
    v30[4] = buf;
    v30[5] = &v31;
    objc_msgSend(v12, "waitForOctagonUpgrade:reply:", v16, v30);

    if (a3)
    {
      v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v17)
        *a3 = objc_retainAutorelease(v17);
    }
    v18 = *((unsigned __int8 *)v32 + 24);
    Nanoseconds = _OctagonSignpostGetNanoseconds(v6, v7);
    _OctagonSignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_DWORD *)v36 = 67240192;
      LODWORD(v37) = v18;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v21, OS_SIGNPOST_INTERVAL_END, v6, "WaitForOctagonUpgrade", " OctagonSignpostNameWaitForOctagonUpgrade=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForOctagonUpgrade}d ", v36, 8u);
    }

    _OctagonSignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v36 = 134218496;
      v37 = v6;
      v38 = 2048;
      v39 = (double)Nanoseconds / 1000000000.0;
      v40 = 1026;
      v41 = v18;
      _os_log_impl(&dword_18A900000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: WaitForOctagonUpgrade  OctagonSignpostNameWaitForOctagonUpgrade=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForOctagonUpgrade}d ", v36, 0x1Cu);
    }

    v23 = *((_BYTE *)v32 + 24) != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    secLogObjForScope("clique-waitforoctagonupgrade");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_18A900000, v24, OS_LOG_TYPE_DEFAULT, "octagon, failed to fetch OTControl object: %@", buf, 0xCu);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v13);
    v25 = _OctagonSignpostGetNanoseconds(v6, v7);
    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v10 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v26))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v27, OS_SIGNPOST_INTERVAL_END, v6, "WaitForOctagonUpgrade", " OctagonSignpostNameWaitForOctagonUpgrade=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForOctagonUpgrade}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)v25 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v43) = 0;
      _os_log_impl(&dword_18A900000, v28, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: WaitForOctagonUpgrade  OctagonSignpostNameWaitForOctagonUpgrade=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForOctagonUpgrade}d ", buf, 0x1Cu);
    }

    v23 = 0;
  }

  return v23;
}

- (void)performedFailureCDPStateMachineRun:(id)a3 error:(id)a4 reply:(id)a5
{
  -[OTClique performedCDPStateMachineRun:success:error:reply:](self, "performedCDPStateMachineRun:success:error:reply:", a3, 0, a4, a5);
}

- (void)performedSuccessfulCDPStateMachineRun:(id)a3 reply:(id)a4
{
  -[OTClique performedCDPStateMachineRun:success:error:reply:](self, "performedCDPStateMachineRun:success:error:reply:", a3, 1, 0, a4);
}

- (void)setCliqueMemberIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OTConfigurationContext)ctx
{
  return self->_ctx;
}

void __34__OTClique_waitForOctagonUpgrade___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  char v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("clique-waitforoctagonupgrade");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "error from control: %@", (uint8_t *)&v9, 0xCu);
    }

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = v3;
    v8 = 0;
    v4 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    if (v5)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "successfully upgraded to octagon", (uint8_t *)&v9, 2u);
    }
    v8 = 1;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
}

void __60__OTClique_performedCDPStateMachineRun_success_error_reply___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  NSObject *v4;
  uint64_t v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  NSObject *v11;
  int v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = COERCE_DOUBLE(a2);
  if (v3 != 0.0)
  {
    secLogObjForScope("clique-cdp-sm");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v28 = 138412546;
      v29 = v5;
      v30 = 2112;
      v31 = v3;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "failed to post %@ result: %@ ", (uint8_t *)&v28, 0x16u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    _OctagonSignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 64);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v28 = 67240192;
      LODWORD(v29) = v10;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PerformedCDPStateMachineRun", " OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ", (uint8_t *)&v28, 8u);
    }

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 134218496;
      v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v29 = *(_QWORD *)(a1 + 64);
      v30 = 2048;
      v31 = (double)Nanoseconds / 1000000000.0;
      v32 = 1026;
      v33 = v12;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformedCDPStateMachineRun  OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ", (uint8_t *)&v28, 0x1Cu);
    }
    goto LABEL_21;
  }
  v13 = *(unsigned __int8 *)(a1 + 80);
  secLogObjForScope("clique-cdp-sm");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (!v15)
      goto LABEL_16;
    v16 = *(_QWORD *)(a1 + 32);
    v28 = 138412290;
    v29 = v16;
    v17 = "posted success: %@";
    v18 = v14;
    v19 = 12;
  }
  else
  {
    if (!v15)
      goto LABEL_16;
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(double *)(a1 + 40);
    v28 = 138412546;
    v29 = v20;
    v30 = 2112;
    v31 = v21;
    v17 = "posted error: %@:  %@";
    v18 = v14;
    v19 = 22;
  }
  _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v28, v19);
LABEL_16:

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(a1 + 80);
  v22 = _OctagonSignpostGetNanoseconds(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  _OctagonSignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v25 = *(_QWORD *)(a1 + 64);
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    v26 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v28 = 67240192;
    LODWORD(v29) = v26;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PerformedCDPStateMachineRun", " OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ", (uint8_t *)&v28, 8u);
  }

  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 134218496;
    v27 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v29 = *(_QWORD *)(a1 + 64);
    v30 = 2048;
    v31 = (double)v22 / 1000000000.0;
    v32 = 1026;
    v33 = v27;
    _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformedCDPStateMachineRun  OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ", (uint8_t *)&v28, 0x1Cu);
  }
LABEL_21:

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __32__OTClique_fetchEscrowContents___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  unint64_t Nanoseconds;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  int v22;
  NSObject *v23;
  int v24;
  int v25;
  id v26;
  __int16 v27;
  double v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  secLogObjForScope("clique-fetchescrow");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v25 = 138412290;
      v26 = v12;
      v15 = "fetchEscrowContents errored: %@";
      v16 = v13;
      v17 = 12;
LABEL_6:
      _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v25, v17);
    }
  }
  else if (v14)
  {
    LOWORD(v25) = 0;
    v15 = "fetchEscrowContents succeeded";
    v16 = v13;
    v17 = 2;
    goto LABEL_6;
  }

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v12 == 0;
  Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
  _OctagonSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = a1[6];
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    v22 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
    v25 = 67240192;
    LODWORD(v26) = v22;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v20, OS_SIGNPOST_INTERVAL_END, v21, "FetchEscrowContents", " OctagonSignpostNameFetchEscrowContents=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowContents}d ", (uint8_t *)&v25, 8u);
  }

  _OctagonSignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 134218496;
    v24 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
    v26 = (id)a1[6];
    v27 = 2048;
    v28 = (double)Nanoseconds / 1000000000.0;
    v29 = 1026;
    v30 = v24;
    _os_log_impl(&dword_18A900000, v23, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEscrowContents  OctagonSignpostNameFetchEscrowContents=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowContents}d ", (uint8_t *)&v25, 0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __58__OTClique_fetchUserControllableViewsSyncingEnabledAsync___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope("clique-user-sync-async");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v10 = 138412290;
      v11 = v5;
      v8 = "fetching user-controllable-sync-async status errored: %@";
LABEL_8:
      _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v7)
  {
    v9 = CFSTR("paused");
    if ((_DWORD)a2)
      v9 = CFSTR("enabled");
    v10 = 138412290;
    v11 = v9;
    v8 = "fetched user-controllable-sync-async status as : %@";
    goto LABEL_8;
  }

  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);
}

void __53__OTClique_fetchUserControllableViewsSyncingEnabled___block_invoke(uint64_t a1, int a2, void *a3)
{
  const __CFString *v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope("clique-user-sync");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v12 = 138412290;
      v13 = v5;
      v8 = "fetching user-controllable-sync status errored: %@";
LABEL_8:
      _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (v7)
  {
    v9 = CFSTR("paused");
    if (a2)
      v9 = CFSTR("enabled");
    v12 = 138412290;
    v13 = v9;
    v8 = "fetched user-controllable-sync status as : %@";
    goto LABEL_8;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

void __61__OTClique_setOctagonUserControllableViewsSyncEnabled_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope("clique-user-sync");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "setting user-controllable-sync status errored: %@", (uint8_t *)&v11, 0xCu);
    }

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = v5;
    v6 = *(NSObject **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }
  else if (v7)
  {
    v10 = CFSTR("paused");
    if (a2)
      v10 = CFSTR("enabled");
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "setting user-controllable-sync status succeeded, now : %@", (uint8_t *)&v11, 0xCu);
  }

}

void __36__OTClique_peerDeviceNamesByPeerID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  secLogObjForScope("clique");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v15 = 138412290;
      v16 = v6;
      v9 = "peerDeviceNamesByPeerID errored: %@";
LABEL_6:
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v8)
  {
    v15 = 138412290;
    v16 = v5;
    v9 = "peerDeviceNamesByPeerID succeeded: %@";
    goto LABEL_6;
  }

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v5;

}

void __24__OTClique_leaveClique___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("clique-leaveClique");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "leaveClique errored: %@", (uint8_t *)&v8, 0xCu);
    }

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = v3;
    v4 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "leaveClique success.", (uint8_t *)&v8, 2u);
  }

}

void __40__OTClique_removeFriendsInClique_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("clique-removefriends");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "removeFriendsInClique failed: unable to remove friends: %@", (uint8_t *)&v9, 0xCu);
    }

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = v3;
    v4 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    v8 = *(void **)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "octagon: friends removed: %@", (uint8_t *)&v9, 0xCu);
  }

}

void __37__OTClique__fetchCliqueStatus_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6)
  {
    *(_QWORD *)(v7 + 24) = -1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    secLogObjForScope("clique-status");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_debug_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEBUG, "octagon clique status errored: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    *(_QWORD *)(v7 + 24) = a2;
  }

}

void __37__OTClique__fetchCliqueStatus_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "ctx");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v9 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)v9;
  if (v9)
  {
    objc_msgSend((id)_fetchCliqueStatus_error__statusReturns, "objectForKeyedSubscript:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "integerValue");
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v6 == v7)
        goto LABEL_8;
    }
    else
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_fetchCliqueStatus_error__statusReturns, "setObject:forKeyedSubscript:", v8, v9);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_8:

    v3 = (void *)v9;
    goto LABEL_9;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_9:

}

void __37__OTClique__fetchCliqueStatus_error___block_invoke_243()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("status_returns", 0);
  v1 = (void *)_fetchCliqueStatus_error__statusReturnsQueue;
  _fetchCliqueStatus_error__statusReturnsQueue = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_fetchCliqueStatus_error__statusReturns;
  _fetchCliqueStatus_error__statusReturns = v2;

}

void __104__OTClique_resetAndEstablish_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope("clique-resetandestablish");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "resetAndEstablish returned an error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3 == 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __22__OTClique_establish___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope("clique-establish");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "establish returned an error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3 == 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __35__OTClique_cliqueMemberIdentifier___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id SecurityAnalyticsReporterRTCClass;
  uint64_t v10;
  _BOOL8 v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    secLogObjForScope("SecError");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "octagon: Failed to fetch octagon peer ID: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    SecurityAnalyticsReporterRTCClass = getSecurityAnalyticsReporterRTCClass();
    v10 = a1[4];
    v11 = 0;
    v12 = v7;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    SecurityAnalyticsReporterRTCClass = getSecurityAnalyticsReporterRTCClass();
    v10 = a1[4];
    v11 = v6 != 0;
    v12 = 0;
  }
  objc_msgSend(SecurityAnalyticsReporterRTCClass, "sendMetricWithEvent:success:error:", v10, v11, v12);

}

+ (BOOL)platformSupportsSOS
{
  int IsSOSFeatureEnabled;

  IsSOSFeatureEnabled = OctagonIsSOSFeatureEnabled();
  if (IsSOSFeatureEnabled)
    LOBYTE(IsSOSFeatureEnabled) = !SOSCompatibilityModeEnabled();
  return IsSOSFeatureEnabled;
}

+ (id)newFriendsWithContextData:(id)a3 error:(id *)a4
{
  return +[OTClique newFriendsWithContextData:resetReason:error:](OTClique, "newFriendsWithContextData:resetReason:error:", a3, 1, a4);
}

+ (id)newFriendsWithContextData:(id)a3 resetReason:(int64_t)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  OTClique *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  OTClique *v26;
  NSObject *v27;
  unint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v33;
  uint8_t buf[4];
  os_signpost_id_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  secLogObjForScope("clique-newfriends");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "altDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v35 = (os_signpost_id_t)v9;
    v36 = 2112;
    v37 = *(double *)&v10;
    _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "makeNewFriends invoked using context: %@, altdsid: %@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MakeNewFriends", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = v12;
    _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: MakeNewFriends  enableTelemetry=YES ", buf, 0xCu);
  }

  v18 = -[OTClique initWithContextData:]([OTClique alloc], "initWithContextData:", v7);
  v33 = 0;
  -[OTClique resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:error:](v18, "resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:error:", a4, 0, 0, 0, 0, &v33);
  v19 = v33;
  secLogObjForScope("clique-newfriends");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      *(_DWORD *)buf = 138412290;
      v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "account reset failed: %@", buf, 0xCu);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v19);
    Nanoseconds = _OctagonSignpostGetNanoseconds(v12, v13);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v35) = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v12, "MakeNewFriends", " OctagonSignpostNameMakeNewFriends=%{public,signpost.telemetry:number1,name=OctagonSignpostNameMakeNewFriends}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v35 = v12;
      v36 = 2048;
      v37 = (double)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = 0;
      _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: MakeNewFriends  OctagonSignpostNameMakeNewFriends=%{public,signpost.telemetry:number1,name=OctagonSignpostNameMakeNewFriends}d ", buf, 0x1Cu);
    }

    v26 = 0;
  }
  else
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "Octagon account reset succeeded", buf, 2u);
    }

    secLogObjForScope("clique-newfriends");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v27, OS_LOG_TYPE_DEFAULT, "makeNewFriends complete", buf, 2u);
    }

    v28 = _OctagonSignpostGetNanoseconds(v12, v13);
    _OctagonSignpostLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v35) = 1;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v30, OS_SIGNPOST_INTERVAL_END, v12, "MakeNewFriends", " OctagonSignpostNameMakeNewFriends=%{public,signpost.telemetry:number1,name=OctagonSignpostNameMakeNewFriends}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v35 = v12;
      v36 = 2048;
      v37 = (double)v28 / 1000000000.0;
      v38 = 1026;
      v39 = 1;
      _os_log_impl(&dword_18A900000, v31, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: MakeNewFriends  OctagonSignpostNameMakeNewFriends=%{public,signpost.telemetry:number1,name=OctagonSignpostNameMakeNewFriends}d ", buf, 0x1Cu);
    }

    v26 = v18;
  }

  return v26;
}

+ (BOOL)isCloudServicesAvailable
{
  uint64_t v2;

  if (!CloudServicesLibraryCore_frameworkLibrary)
    CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = CloudServicesLibraryCore_frameworkLibrary;
  if (!CloudServicesLibraryCore_frameworkLibrary && isCloudServicesAvailable_onceToken != -1)
    dispatch_once(&isCloudServicesAvailable_onceToken, &__block_literal_global_4218);
  return v2 != 0;
}

+ (id)performEscrowRecoveryWithContextData:(id)a3 escrowArguments:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  OTClique *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  unint64_t Nanoseconds;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  _QWORD *v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  unint64_t v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  os_signpost_id_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  OTControlArguments *v57;
  uint64_t v58;
  unint64_t v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  unint64_t v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  os_signpost_id_t v70;
  uint64_t v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  id v75;
  unint64_t v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  _BOOL4 v81;
  unint64_t v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  NSObject *v86;
  unint64_t v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  unint64_t v92;
  NSObject *v93;
  NSObject *v94;
  NSObject *v95;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  id v109;
  id v110;
  id v111;
  OTClique *v112;
  id v113;
  _QWORD v114[5];
  id v115;
  id v116;
  id v117;
  uint8_t v118[4];
  os_signpost_id_t v119;
  __int16 v120;
  double v121;
  __int16 v122;
  _BOOL4 v123;
  _BYTE buf[24];
  uint64_t (*v125)(uint64_t, uint64_t);
  void (*v126)(uint64_t);
  id v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (+[OTClique isCloudServicesAvailable](OTClique, "isCloudServicesAvailable"))
  {
    _OctagonSignpostLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);
    v107 = mach_continuous_time();

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v108 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PerformEscrowRecovery", " enableTelemetry=YES ", buf, 2u);
    }

    _OctagonSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformEscrowRecovery  enableTelemetry=YES ", buf, 0xCu);
    }

    v112 = -[OTClique initWithContextData:]([OTClique alloc], "initWithContextData:", v7);
    secLogObjForScope("clique-recovery");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "altDSID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_18A900000, v14, OS_LOG_TYPE_DEFAULT, "attempting an escrow recovery for context:%@, altdsid:%@", buf, 0x16u);

    }
    objc_msgSend(v7, "sbd");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      v111 = v17;
    else
      v111 = objc_alloc_init((Class)getSecureBackupClass());

    _OctagonSignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_id_generate(v20);
    v22 = mach_continuous_time();

    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PerformRecoveryFromSBD", " enableTelemetry=YES ", buf, 2u);
    }

    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v21;
      _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformRecoveryFromSBD  enableTelemetry=YES ", buf, 0xCu);
    }

    v117 = 0;
    objc_msgSend(v111, "recoverWithInfo:results:", v8, &v117);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v117;
    Nanoseconds = _OctagonSignpostGetNanoseconds(v21, v22);
    _OctagonSignpostLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v21 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v28))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = v26 == 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v29, OS_SIGNPOST_INTERVAL_END, v21, "PerformRecoveryFromSBD", " OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)Nanoseconds / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v125) = v26 == 0;
      _os_log_impl(&dword_18A900000, v30, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformRecoveryFromSBD  OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ", buf, 0x1Cu);
    }

    if (v26)
    {
      secLogObjForScope("clique-recovery");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v26;
        _os_log_impl(&dword_18A900000, v31, OS_LOG_TYPE_DEFAULT, "sbd escrow recovery failed: %@", buf, 0xCu);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v26);
      v32 = _OctagonSignpostGetNanoseconds(v10, v107);
      _OctagonSignpostLogSystem();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v108 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v33))
      {
        *(_QWORD *)buf = 67240192;
        _os_signpost_emit_with_name_impl(&dword_18A900000, v34, OS_SIGNPOST_INTERVAL_END, v10, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)v32 / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v125) = 0;
        _os_log_impl(&dword_18A900000, v35, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 0x1Cu);
      }
      v19 = 0;
      v109 = 0;
      goto LABEL_131;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v36 = (_QWORD *)getkSecureBackupRecoveryKeyKeySymbolLoc_ptr;
    v125 = (uint64_t (*)(uint64_t, uint64_t))getkSecureBackupRecoveryKeyKeySymbolLoc_ptr;
    if (!getkSecureBackupRecoveryKeyKeySymbolLoc_ptr)
    {
      v37 = CloudServicesLibrary();
      v36 = dlsym(v37, "kSecureBackupRecoveryKeyKey");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v36;
      getkSecureBackupRecoveryKeyKeySymbolLoc_ptr = (uint64_t)v36;
    }
    _Block_object_dispose(buf, 8);
    if (v36)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *v36);
      v106 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v38 = (_QWORD *)getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr;
      v125 = (uint64_t (*)(uint64_t, uint64_t))getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr;
      if (!getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr)
      {
        v39 = CloudServicesLibrary();
        v38 = dlsym(v39, "kSecureBackupUsesRecoveryKeyKey");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v38;
        getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr = (uint64_t)v38;
      }
      _Block_object_dispose(buf, 8);
      if (v38)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", *v38);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        if (v106 || objc_msgSend(v105, "BOOLValue"))
        {
          v116 = 0;
          v40 = -[OTClique fetchCliqueStatus:](v112, "fetchCliqueStatus:", &v116);
          v41 = v116;
          if (!v40)
          {
            v109 = v41;
            secLogObjForScope("clique-recovery");
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18A900000, v43, OS_LOG_TYPE_DEFAULT, "recovery key used during secure backup recovery, skipping bottle check", buf, 2u);
            }

            secLogObjForScope("clique-recovery");
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v112;
              _os_log_impl(&dword_18A900000, v44, OS_LOG_TYPE_DEFAULT, "recovery complete: %@", buf, 0xCu);
            }

            v45 = _OctagonSignpostGetNanoseconds(v10, v107);
            _OctagonSignpostLogSystem();
            v46 = objc_claimAutoreleasedReturnValue();
            v47 = v46;
            if (v108 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v46))
            {
              *(_DWORD *)buf = 67240192;
              *(_DWORD *)&buf[4] = v112 != 0;
              _os_signpost_emit_with_name_impl(&dword_18A900000, v47, OS_SIGNPOST_INTERVAL_END, v10, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
            }

            _OctagonSignpostLogSystem();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218496;
              *(_QWORD *)&buf[4] = v10;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = (double)v45 / 1000000000.0;
              *(_WORD *)&buf[22] = 1026;
              LODWORD(v125) = v112 != 0;
              _os_log_impl(&dword_18A900000, v48, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 0x1Cu);
            }

            v19 = v112;
            goto LABEL_130;
          }
          v42 = v41;
        }
        else
        {
          v42 = 0;
        }
        v115 = v42;
        -[OTClique makeOTControl:](v112, "makeOTControl:", &v115);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v115;

        if (!v104)
        {
          secLogObjForScope("clique-recovery");
          v86 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v109;
            _os_log_impl(&dword_18A900000, v86, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", buf, 0xCu);
          }

          if (a5)
            *a5 = objc_retainAutorelease(v109);
          v87 = _OctagonSignpostGetNanoseconds(v10, v107);
          _OctagonSignpostLogSystem();
          v88 = objc_claimAutoreleasedReturnValue();
          v89 = v88;
          if (v108 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v88))
          {
            *(_QWORD *)buf = 67240192;
            _os_signpost_emit_with_name_impl(&dword_18A900000, v89, OS_SIGNPOST_INTERVAL_END, v10, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
          }

          _OctagonSignpostLogSystem();
          v90 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)&buf[4] = v10;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = (double)v87 / 1000000000.0;
            *(_WORD *)&buf[22] = 1026;
            LODWORD(v125) = 0;
            _os_log_impl(&dword_18A900000, v90, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 0x1Cu);
          }
          v19 = 0;
          goto LABEL_129;
        }
        objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("bottleID"));
        v103 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("bottleValid"));
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("EscrowServiceEscrowData"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("BottledPeerEntropy"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        if (v102 && v103 && objc_msgSend(v101, "isEqualToString:", CFSTR("valid")))
        {
          secLogObjForScope("clique-recovery");
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v103;
            _os_log_impl(&dword_18A900000, v50, OS_LOG_TYPE_DEFAULT, "recovering from bottle: %@", buf, 0xCu);
          }

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v125 = __Block_byref_object_copy__4162;
          v126 = __Block_byref_object_dispose__4163;
          v127 = 0;
          _OctagonSignpostLogSystem();
          v51 = objc_claimAutoreleasedReturnValue();
          v52 = os_signpost_id_generate(v51);
          v53 = mach_continuous_time();

          _OctagonSignpostLogSystem();
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = v54;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
          {
            *(_WORD *)v118 = 0;
            _os_signpost_emit_with_name_impl(&dword_18A900000, v55, OS_SIGNPOST_INTERVAL_BEGIN, v52, "PerformOctagonJoin", " enableTelemetry=YES ", v118, 2u);
          }

          _OctagonSignpostLogSystem();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v118 = 134217984;
            v119 = v52;
            _os_log_impl(&dword_18A900000, v56, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformOctagonJoin  enableTelemetry=YES ", v118, 0xCu);
          }

          v57 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
          v114[0] = MEMORY[0x1E0C809B0];
          v114[1] = 3221225472;
          v114[2] = __71__OTClique_performEscrowRecoveryWithContextData_escrowArguments_error___block_invoke;
          v114[3] = &unk_1E1FD8560;
          v114[4] = buf;
          objc_msgSend(v104, "restoreFromBottle:entropy:bottleID:reply:", v57, v102, v103, v114);

          v58 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          v59 = _OctagonSignpostGetNanoseconds(v52, v53);
          _OctagonSignpostLogSystem();
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = v60;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
          {
            *(_DWORD *)v118 = 67240192;
            LODWORD(v119) = v58 == 0;
            _os_signpost_emit_with_name_impl(&dword_18A900000, v61, OS_SIGNPOST_INTERVAL_END, v52, "PerformOctagonJoin", " OctagonSignpostNamePerformOctagonJoin=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoin}d ", v118, 8u);
          }

          _OctagonSignpostLogSystem();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v118 = 134218496;
            v119 = v52;
            v120 = 2048;
            v121 = (double)v59 / 1000000000.0;
            v122 = 1026;
            v123 = v58 == 0;
            _os_log_impl(&dword_18A900000, v62, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformOctagonJoin  OctagonSignpostNamePerformOctagonJoin=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoin}d ", v118, 0x1Cu);
          }

          v63 = *(void **)(*(_QWORD *)&buf[8] + 40);
          if (v63)
          {
            if (a5)
              *a5 = objc_retainAutorelease(v63);
            v64 = _OctagonSignpostGetNanoseconds(v10, v107);
            _OctagonSignpostLogSystem();
            v65 = objc_claimAutoreleasedReturnValue();
            v66 = v65;
            if (v108 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
            {
              *(_DWORD *)v118 = 67240192;
              LODWORD(v119) = 0;
              _os_signpost_emit_with_name_impl(&dword_18A900000, v66, OS_SIGNPOST_INTERVAL_END, v10, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", v118, 8u);
            }

            _OctagonSignpostLogSystem();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v118 = 134218496;
              v119 = v10;
              v120 = 2048;
              v121 = (double)v64 / 1000000000.0;
              v122 = 1026;
              v123 = 0;
              _os_log_impl(&dword_18A900000, v67, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", v118, 0x1Cu);
            }

            _Block_object_dispose(buf, 8);
LABEL_105:
            v19 = 0;
LABEL_128:

            v90 = v103;
LABEL_129:

LABEL_130:
            v35 = v106;
LABEL_131:

            goto LABEL_132;
          }
          _Block_object_dispose(buf, 8);

        }
        else
        {
          secLogObjForScope("clique-recovery");
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v103;
            _os_log_impl(&dword_18A900000, v68, OS_LOG_TYPE_DEFAULT, "bottle %@ is not valid, resetting octagon", buf, 0xCu);
          }

          _OctagonSignpostLogSystem();
          v69 = objc_claimAutoreleasedReturnValue();
          v70 = os_signpost_id_generate(v69);
          v71 = mach_continuous_time();

          _OctagonSignpostLogSystem();
          v72 = objc_claimAutoreleasedReturnValue();
          v73 = v72;
          if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18A900000, v73, OS_SIGNPOST_INTERVAL_BEGIN, v70, "PerformResetAndEstablishAfterFailedBottle", " enableTelemetry=YES ", buf, 2u);
          }

          _OctagonSignpostLogSystem();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v70;
            _os_log_impl(&dword_18A900000, v74, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformResetAndEstablishAfterFailedBottle  enableTelemetry=YES ", buf, 0xCu);
          }

          v113 = 0;
          -[OTClique resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:error:](v112, "resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:error:", 3, 0, 0, 0, 0, &v113);
          v75 = v113;
          v76 = _OctagonSignpostGetNanoseconds(v70, v71);
          _OctagonSignpostLogSystem();
          v77 = objc_claimAutoreleasedReturnValue();
          v78 = v77;
          if (v70 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v77))
          {
            *(_DWORD *)buf = 67240192;
            *(_DWORD *)&buf[4] = v75 == 0;
            _os_signpost_emit_with_name_impl(&dword_18A900000, v78, OS_SIGNPOST_INTERVAL_END, v70, "PerformResetAndEstablishAfterFailedBottle", " OctagonSignpostNamePerformResetAndEstablishAfterFailedBottle=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformResetAndEstablishAfterFailedBottle}d ", buf, 8u);
          }

          _OctagonSignpostLogSystem();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)&buf[4] = v70;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = (double)v76 / 1000000000.0;
            *(_WORD *)&buf[22] = 1026;
            LODWORD(v125) = v75 == 0;
            _os_log_impl(&dword_18A900000, v79, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformResetAndEstablishAfterFailedBottle  OctagonSignpostNamePerformResetAndEstablishAfterFailedBottle=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformResetAndEstablishAfterFailedBottle}d ", buf, 0x1Cu);
          }

          secLogObjForScope("clique-recovery");
          v80 = objc_claimAutoreleasedReturnValue();
          v81 = os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT);
          if (v75)
          {
            if (v81)
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v75;
              _os_log_impl(&dword_18A900000, v80, OS_LOG_TYPE_DEFAULT, "failed to reset octagon: %@", buf, 0xCu);
            }

            if (a5)
              *a5 = objc_retainAutorelease(v75);
            v82 = _OctagonSignpostGetNanoseconds(v10, v107);
            _OctagonSignpostLogSystem();
            v83 = objc_claimAutoreleasedReturnValue();
            v84 = v83;
            if (v108 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v83))
            {
              *(_QWORD *)buf = 67240192;
              _os_signpost_emit_with_name_impl(&dword_18A900000, v84, OS_SIGNPOST_INTERVAL_END, v10, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
            }

            _OctagonSignpostLogSystem();
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218496;
              *(_QWORD *)&buf[4] = v10;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = (double)v82 / 1000000000.0;
              *(_WORD *)&buf[22] = 1026;
              LODWORD(v125) = 0;
              _os_log_impl(&dword_18A900000, v85, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 0x1Cu);
            }

            goto LABEL_105;
          }
          if (v81)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18A900000, v80, OS_LOG_TYPE_DEFAULT, "reset octagon succeeded", buf, 2u);
          }

        }
        secLogObjForScope("clique-recovery");
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v112;
          _os_log_impl(&dword_18A900000, v91, OS_LOG_TYPE_DEFAULT, "recovery complete: %@", buf, 0xCu);
        }

        v92 = _OctagonSignpostGetNanoseconds(v10, v107);
        _OctagonSignpostLogSystem();
        v93 = objc_claimAutoreleasedReturnValue();
        v94 = v93;
        if (v108 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v93))
        {
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&buf[4] = v112 != 0;
          _os_signpost_emit_with_name_impl(&dword_18A900000, v94, OS_SIGNPOST_INTERVAL_END, v10, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
        }

        _OctagonSignpostLogSystem();
        v95 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (double)v92 / 1000000000.0;
          *(_WORD *)&buf[22] = 1026;
          LODWORD(v125) = v112 != 0;
          _os_log_impl(&dword_18A900000, v95, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 0x1Cu);
        }

        v19 = v112;
        goto LABEL_128;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSecureBackupUsesRecoveryKeyKey(void)");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "handleFailureInFunction:file:lineNumber:description:", v100, CFSTR("OTClique.m"), 83, CFSTR("%s"), dlerror());

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSecureBackupRecoveryKeyKey(void)");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "handleFailureInFunction:file:lineNumber:description:", v98, CFSTR("OTClique.m"), 82, CFSTR("%s"), dlerror());

    }
    __break(1u);
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, 0);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
LABEL_132:

  return v19;
}

+ (id)fetchEscrowRecordsInternal:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  OTControlArguments *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v18[6];
  id obj;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t v26[4];
  uint64_t v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31[3];

  v31[2] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope("clique-fetchrecords");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "fetching escrow records for context:%@, altdsid:%@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__4162;
  v30 = __Block_byref_object_dispose__4163;
  v31[0] = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4162;
  v24 = __Block_byref_object_dispose__4163;
  v25 = 0;
  obj = 0;
  objc_msgSend(v5, "makeOTControl:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v31, obj);
  if (v9)
  {
    v10 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v5);
    v11 = objc_msgSend(v5, "escrowFetchSource");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __45__OTClique_fetchEscrowRecordsInternal_error___block_invoke;
    v18[3] = &unk_1E1FCDF90;
    v18[4] = buf;
    v18[5] = &v20;
    objc_msgSend(v9, "fetchEscrowRecords:source:reply:", v10, v11, v18);

    if (a4)
    {
      v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v12)
        *a4 = objc_retainAutorelease(v12);
    }
    secLogObjForScope("clique-fetchrecords");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "fetchEscrowRecords complete", v26, 2u);
    }

    v14 = (id)v21[5];
  }
  else
  {
    secLogObjForScope("clique-fetchrecords");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v26 = 138412290;
      v27 = v16;
      _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v26, 0xCu);
    }

    v14 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(buf, 8);

  return v14;
}

+ (id)findOptimalBottleIDsWithContextData:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  OTControlArguments *v17;
  uint64_t v18;
  void *v19;
  OTBottleIDs *v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t Nanoseconds;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  unint64_t v29;
  NSObject *v30;
  NSObject *v31;
  _QWORD v33[7];
  id obj;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t v47[4];
  os_signpost_id_t v48;
  __int16 v49;
  double v50;
  __int16 v51;
  _BOOL4 v52;
  _BYTE buf[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56[3];

  v56[2] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  secLogObjForScope("clique-findbottle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "finding optimal bottles for context:%@, altdsid:%@", buf, 0x16u);

  }
  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FindOptimalBottleIDsWithContextData", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FindOptimalBottleIDsWithContextData  enableTelemetry=YES ", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v54 = __Block_byref_object_copy__4162;
  v55 = __Block_byref_object_dispose__4163;
  v56[0] = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__4162;
  v45 = __Block_byref_object_dispose__4163;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__4162;
  v39 = __Block_byref_object_dispose__4163;
  v40 = 0;
  obj = 0;
  objc_msgSend(v5, "makeOTControl:", &obj);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v56, obj);
  if (v16)
  {
    v17 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v5);
    v18 = objc_msgSend(v5, "escrowFetchSource");
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __54__OTClique_findOptimalBottleIDsWithContextData_error___block_invoke;
    v33[3] = &unk_1E1FCDFB8;
    v33[4] = buf;
    v33[5] = &v41;
    v33[6] = &v35;
    objc_msgSend(v16, "fetchAllViableBottles:source:reply:", v17, v18, v33);

    if (a4)
    {
      v19 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v19)
        *a4 = objc_retainAutorelease(v19);
    }
    v20 = objc_alloc_init(OTBottleIDs);
    -[OTBottleIDs setPreferredBottleIDs:](v20, "setPreferredBottleIDs:", v42[5]);
    -[OTBottleIDs setPartialRecoveryBottleIDs:](v20, "setPartialRecoveryBottleIDs:", v36[5]);
    secLogObjForScope("clique-findbottle");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "findOptimalBottleIDsWithContextData complete", v47, 2u);
    }

    v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    Nanoseconds = _OctagonSignpostGetNanoseconds(v10, v11);
    _OctagonSignpostLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)v47 = 67240192;
      LODWORD(v48) = v22 == 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v25, OS_SIGNPOST_INTERVAL_END, v10, "FindOptimalBottleIDsWithContextData", " OctagonSignpostNameFindOptimalBottleIDsWithContextData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFindOptimalBottleIDsWithContextData}d ", v47, 8u);
    }

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v47 = 134218496;
      v48 = v10;
      v49 = 2048;
      v50 = (double)Nanoseconds / 1000000000.0;
      v51 = 1026;
      v52 = v22 == 0;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FindOptimalBottleIDsWithContextData  OctagonSignpostNameFindOptimalBottleIDsWithContextData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFindOptimalBottleIDsWithContextData}d ", v47, 0x1Cu);
    }
  }
  else
  {
    secLogObjForScope("clique-findbottle");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v47 = 138412290;
      v48 = v28;
      _os_log_impl(&dword_18A900000, v27, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v47, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v29 = _OctagonSignpostGetNanoseconds(v10, v11);
    _OctagonSignpostLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_DWORD *)v47 = 67240192;
      LODWORD(v48) = 0;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v31, OS_SIGNPOST_INTERVAL_END, v10, "FindOptimalBottleIDsWithContextData", " OctagonSignpostNameFindOptimalBottleIDsWithContextData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFindOptimalBottleIDsWithContextData}d ", v47, 8u);
    }

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v47 = 134218496;
      v48 = v10;
      v49 = 2048;
      v50 = (double)v29 / 1000000000.0;
      v51 = 1026;
      v52 = 0;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FindOptimalBottleIDsWithContextData  OctagonSignpostNameFindOptimalBottleIDsWithContextData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFindOptimalBottleIDsWithContextData}d ", v47, 0x1Cu);
    }
    v20 = 0;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(buf, 8);
  return v20;
}

+ (id)recoverWithContextData:(id)a3 bottleID:(id)a4 escrowedEntropy:(id)a5 error:(id *)a6
{
  NSObject *v6;
  uint8_t v8[16];

  secLogObjForScope("octagon");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "replaced by performEscrowRecoveryWithContextData:escrowArguments:error: remove call", v8, 2u);
  }

  return 0;
}

+ (void)setNewRecoveryKeyWithData:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  OTControlArguments *v22;
  NSObject *v23;
  BOOL v24;
  void *v25;
  id *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  unint64_t Nanoseconds;
  NSObject *v32;
  NSObject *v33;
  int v34;
  NSObject *v35;
  int v36;
  unint64_t v37;
  NSObject *v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  int v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint64_t *v50;
  os_signpost_id_t v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  _BYTE buf[24];
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v45 = a4;
  v7 = a5;
  secLogObjForScope("octagon-setrecoverykey");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v46, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "setNewRecoveryKeyWithData invoked for context: %@", buf, 0xCu);

  }
  v10 = (void *)objc_opt_new();
  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SetNewRecoveryKeyWithData", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v12;
    _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SetNewRecoveryKeyWithData  enableTelemetry=YES ", buf, 0xCu);
  }

  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v54 = 0;
  SecRKCreateRecoveryKeyWithError(v45, &v54);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v54;
  if (v18)
  {
    v53 = 0;
    objc_msgSend(v46, "makeOTControl:", &v53);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v53;
    if (v20)
    {
      v22 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v46);
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __56__OTClique_setNewRecoveryKeyWithData_recoveryKey_reply___block_invoke;
      v47[3] = &unk_1E1FCE008;
      v51 = v12;
      v52 = v13;
      v50 = &v55;
      v49 = v7;
      v48 = v18;
      objc_msgSend(v20, "createRecoveryKey:recoveryKey:reply:", v22, v45, v47);

    }
    else
    {
      secLogObjForScope("octagon-setrecoverykey");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v21;
        _os_log_impl(&dword_18A900000, v30, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", buf, 0xCu);
      }

      Nanoseconds = _OctagonSignpostGetNanoseconds(v12, v13);
      _OctagonSignpostLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        v34 = *((unsigned __int8 *)v56 + 24);
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v34;
        _os_signpost_emit_with_name_impl(&dword_18A900000, v33, OS_SIGNPOST_INTERVAL_END, v12, "SetNewRecoveryKeyWithData", " OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v36 = *((unsigned __int8 *)v56 + 24);
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)Nanoseconds / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v60) = v36;
        _os_log_impl(&dword_18A900000, v35, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetNewRecoveryKeyWithData  OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", buf, 0x1Cu);
      }

      (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v21);
    }

    v29 = 0;
  }
  else
  {
    secLogObjForScope("SecError");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl(&dword_18A900000, v23, OS_LOG_TYPE_DEFAULT, "octagon-setrecoverykey, SecRKCreateRecoveryKeyWithError() failed: %@", buf, 0xCu);
    }

    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("SecRKCreateRecoveryKeyWithError() failed"), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CB3388]);
    v24 = +[OTClique isCloudServicesAvailable](OTClique, "isCloudServicesAvailable");
    v25 = (void *)MEMORY[0x1E0CB35C8];
    if (v24)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v26 = (id *)getkSecureBackupErrorDomainSymbolLoc_ptr;
      v60 = getkSecureBackupErrorDomainSymbolLoc_ptr;
      if (!getkSecureBackupErrorDomainSymbolLoc_ptr)
      {
        v27 = CloudServicesLibrary();
        v26 = (id *)dlsym(v27, "kSecureBackupErrorDomain");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v26;
        getkSecureBackupErrorDomainSymbolLoc_ptr = (uint64_t)v26;
      }
      _Block_object_dispose(buf, 8);
      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSErrorDomain getkSecureBackupErrorDomain(void)");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("OTClique.m"), 77, CFSTR("%s"), dlerror());

        __break(1u);
      }
      v28 = *v26;
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", v28, 24, v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v37 = _OctagonSignpostGetNanoseconds(v12, v13);
    _OctagonSignpostLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      v40 = *((unsigned __int8 *)v56 + 24);
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = v40;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v39, OS_SIGNPOST_INTERVAL_END, v12, "SetNewRecoveryKeyWithData", " OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v42 = *((unsigned __int8 *)v56 + 24);
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)v37 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v60) = v42;
      _os_log_impl(&dword_18A900000, v41, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetNewRecoveryKeyWithData  OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", buf, 0x1Cu);
    }

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v29);
  }

  _Block_object_dispose(&v55, 8);
}

+ (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  OTControlArguments *v20;
  NSObject *v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  _QWORD v28[4];
  id v29;
  __int128 *p_buf;
  os_signpost_id_t v31;
  uint64_t v32;
  id v33;
  uint8_t v34[4];
  os_signpost_id_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  secLogObjForScope("octagon-createcustodianrecoverykey");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "createCustodianRecoveryKey invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CreateCustodianRecoveryKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CreateCustodianRecoveryKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  objc_msgSend(v7, "makeOTControl:", &v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v33;
  if (v18)
  {
    v20 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __50__OTClique_createCustodianRecoveryKey_uuid_reply___block_invoke;
    v28[3] = &unk_1E1FCE030;
    v31 = v13;
    v32 = v14;
    p_buf = &buf;
    v29 = v9;
    objc_msgSend(v18, "createCustodianRecoveryKey:uuid:reply:", v20, v8, v28);

  }
  else
  {
    secLogObjForScope("octagon-createcustodianrecoverykey");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v13, "CreateCustodianRecoveryKey", " OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ", v34, 8u);
    }

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 134218496;
      v27 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v35 = v13;
      v36 = 2048;
      v37 = (double)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = v27;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateCustodianRecoveryKey  OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)recoverOctagonUsingCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  OTControlArguments *v19;
  NSObject *v20;
  unint64_t Nanoseconds;
  NSObject *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  int v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  id v32;
  uint8_t v33[4];
  os_signpost_id_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  int v38;
  __int128 buf;
  uint64_t v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RecoverOctagonUsingCustodianRecoveryKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecoverOctagonUsingCustodianRecoveryKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  objc_msgSend(v7, "makeOTControl:", &v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v32;
  secLogObjForScope("clique-custodianrecoverykey");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, "join using custodian recovery key", v33, 2u);
  }

  if (v16)
  {
    v19 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __79__OTClique_recoverOctagonUsingCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke;
    v27[3] = &unk_1E1FCE058;
    v30 = v11;
    v31 = v12;
    p_buf = &buf;
    v28 = v9;
    objc_msgSend(v16, "joinWithCustodianRecoveryKey:custodianRecoveryKey:reply:", v19, v8, v27);

  }
  else
  {
    secLogObjForScope("clique-custodianrecoverykey");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 138412290;
      v34 = (os_signpost_id_t)v17;
      _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v33, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v24 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v23, OS_SIGNPOST_INTERVAL_END, v11, "RecoverOctagonUsingCustodianRecoveryKey", " OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ", v33, 8u);
    }

    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 134218496;
      v26 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v34 = v11;
      v35 = 2048;
      v36 = (double)Nanoseconds / 1000000000.0;
      v37 = 1026;
      v38 = v26;
      _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ", v33, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v17);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)preflightRecoverOctagonUsingCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  OTControlArguments *v19;
  NSObject *v20;
  unint64_t Nanoseconds;
  NSObject *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  int v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  id v32;
  uint8_t v33[4];
  os_signpost_id_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  int v38;
  __int128 buf;
  uint64_t v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PreflightRecoverOctagonUsingCustodianRecoveryKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PreflightRecoverOctagonUsingCustodianRecoveryKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  objc_msgSend(v7, "makeOTControl:", &v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v32;
  secLogObjForScope("clique-custodianrecoverykey");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, "preflight join using custodian recovery key", v33, 2u);
  }

  if (v16)
  {
    v19 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __88__OTClique_preflightRecoverOctagonUsingCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke;
    v27[3] = &unk_1E1FCE058;
    v30 = v11;
    v31 = v12;
    p_buf = &buf;
    v28 = v9;
    objc_msgSend(v16, "preflightJoinWithCustodianRecoveryKey:custodianRecoveryKey:reply:", v19, v8, v27);

  }
  else
  {
    secLogObjForScope("clique-custodianrecoverykey");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 138412290;
      v34 = (os_signpost_id_t)v17;
      _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v33, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v24 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v23, OS_SIGNPOST_INTERVAL_END, v11, "PreflightRecoverOctagonUsingCustodianRecoveryKey", " OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ", v33, 8u);
    }

    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 134218496;
      v26 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v34 = v11;
      v35 = 2048;
      v36 = (double)Nanoseconds / 1000000000.0;
      v37 = 1026;
      v38 = v26;
      _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightRecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ", v33, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v17);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)removeCustodianRecoveryKey:(id)a3 custodianRecoveryKeyUUID:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  OTControlArguments *v20;
  NSObject *v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  _QWORD v28[4];
  id v29;
  __int128 *p_buf;
  os_signpost_id_t v31;
  uint64_t v32;
  id v33;
  uint8_t v34[4];
  os_signpost_id_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  secLogObjForScope("octagon-removecustodianrecoverykey");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "removeCustodianRecoveryKey invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RemoveCustodianRecoveryKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveCustodianRecoveryKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  objc_msgSend(v7, "makeOTControl:", &v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v33;
  if (v18)
  {
    v20 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __70__OTClique_removeCustodianRecoveryKey_custodianRecoveryKeyUUID_reply___block_invoke;
    v28[3] = &unk_1E1FCE058;
    v31 = v13;
    v32 = v14;
    p_buf = &buf;
    v29 = v9;
    objc_msgSend(v18, "removeCustodianRecoveryKey:uuid:reply:", v20, v8, v28);

  }
  else
  {
    secLogObjForScope("octagon-removecustodianrecoverykey");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v13, "RemoveCustodianRecoveryKey", " OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ", v34, 8u);
    }

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 134218496;
      v27 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v35 = v13;
      v36 = 2048;
      v37 = (double)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = v27;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveCustodianRecoveryKey  OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)checkCustodianRecoveryKey:(id)a3 custodianRecoveryKeyUUID:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  OTControlArguments *v20;
  NSObject *v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  _QWORD v28[4];
  id v29;
  __int128 *p_buf;
  os_signpost_id_t v31;
  uint64_t v32;
  id v33;
  uint8_t v34[4];
  os_signpost_id_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  secLogObjForScope("octagon-checkcustodianrecoverykey");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "checkCustodianRecoveryKey invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CheckCustodianRecoveryKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CheckCustodianRecoveryKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  objc_msgSend(v7, "makeOTControl:", &v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v33;
  if (v18)
  {
    v20 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __69__OTClique_checkCustodianRecoveryKey_custodianRecoveryKeyUUID_reply___block_invoke;
    v28[3] = &unk_1E1FCE080;
    v31 = v13;
    v32 = v14;
    p_buf = &buf;
    v29 = v9;
    objc_msgSend(v18, "checkCustodianRecoveryKey:uuid:reply:", v20, v8, v28);

  }
  else
  {
    secLogObjForScope("octagon-checkcustodianrecoverykey");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v13, "CheckCustodianRecoveryKey", " OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ", v34, 8u);
    }

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 134218496;
      v27 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v35 = v13;
      v36 = 2048;
      v37 = (double)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = v27;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CheckCustodianRecoveryKey  OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  OTControlArguments *v20;
  NSObject *v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  _QWORD v28[4];
  id v29;
  __int128 *p_buf;
  os_signpost_id_t v31;
  uint64_t v32;
  id v33;
  uint8_t v34[4];
  os_signpost_id_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  secLogObjForScope("octagon-createinheritancekey");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "createInheritanceKey invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CreateInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CreateInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  objc_msgSend(v7, "makeOTControl:", &v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v33;
  if (v18)
  {
    v20 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __44__OTClique_createInheritanceKey_uuid_reply___block_invoke;
    v28[3] = &unk_1E1FCE0A8;
    v31 = v13;
    v32 = v14;
    p_buf = &buf;
    v29 = v9;
    objc_msgSend(v18, "createInheritanceKey:uuid:reply:", v20, v8, v28);

  }
  else
  {
    secLogObjForScope("octagon-createinheritancekey");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v13, "CreateInheritanceKey", " OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ", v34, 8u);
    }

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 134218496;
      v27 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v35 = v13;
      v36 = 2048;
      v37 = (double)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = v27;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateInheritanceKey  OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  OTControlArguments *v20;
  NSObject *v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  _QWORD v28[4];
  id v29;
  __int128 *p_buf;
  os_signpost_id_t v31;
  uint64_t v32;
  id v33;
  uint8_t v34[4];
  os_signpost_id_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  secLogObjForScope("octagon-generateinheritancekey");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "generateInheritanceKey invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "GenerateInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GenerateInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  objc_msgSend(v7, "makeOTControl:", &v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v33;
  if (v18)
  {
    v20 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __46__OTClique_generateInheritanceKey_uuid_reply___block_invoke;
    v28[3] = &unk_1E1FCE0A8;
    v31 = v13;
    v32 = v14;
    p_buf = &buf;
    v29 = v9;
    objc_msgSend(v18, "generateInheritanceKey:uuid:reply:", v20, v8, v28);

  }
  else
  {
    secLogObjForScope("octagon-generateinheritancekey");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v13, "GenerateInheritanceKey", " OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateInheritanceKey}d ", v34, 8u);
    }

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 134218496;
      v27 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v35 = v13;
      v36 = 2048;
      v37 = (double)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = v27;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GenerateInheritanceKey  OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateInheritanceKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  OTControlArguments *v20;
  NSObject *v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  _QWORD v28[4];
  id v29;
  __int128 *p_buf;
  os_signpost_id_t v31;
  uint64_t v32;
  id v33;
  uint8_t v34[4];
  os_signpost_id_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  secLogObjForScope("octagon-storeinheritancekey");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "storeInheritanceKey invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "StoreInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StoreInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  objc_msgSend(v7, "makeOTControl:", &v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v33;
  if (v18)
  {
    v20 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __41__OTClique_storeInheritanceKey_ik_reply___block_invoke;
    v28[3] = &unk_1E1FCE058;
    v31 = v13;
    v32 = v14;
    p_buf = &buf;
    v29 = v9;
    objc_msgSend(v18, "storeInheritanceKey:ik:reply:", v20, v8, v28);

  }
  else
  {
    secLogObjForScope("octagon-storeinheritancekey");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v13, "StoreInheritanceKey", " OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ", v34, 8u);
    }

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 134218496;
      v27 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v35 = v13;
      v36 = 2048;
      v37 = (double)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = v27;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StoreInheritanceKey  OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)recoverOctagonUsingInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  OTControlArguments *v19;
  NSObject *v20;
  unint64_t Nanoseconds;
  NSObject *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  int v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  id v32;
  uint8_t v33[4];
  os_signpost_id_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  int v38;
  __int128 buf;
  uint64_t v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RecoverOctagonUsingInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecoverOctagonUsingInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  objc_msgSend(v7, "makeOTControl:", &v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v32;
  secLogObjForScope("clique-inheritancekey");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, "join using inheritance key", v33, 2u);
  }

  if (v16)
  {
    v19 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __67__OTClique_recoverOctagonUsingInheritanceKey_inheritanceKey_reply___block_invoke;
    v27[3] = &unk_1E1FCE058;
    v30 = v11;
    v31 = v12;
    p_buf = &buf;
    v28 = v9;
    objc_msgSend(v16, "joinWithInheritanceKey:inheritanceKey:reply:", v19, v8, v27);

  }
  else
  {
    secLogObjForScope("clique-inheritancekey");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 138412290;
      v34 = (os_signpost_id_t)v17;
      _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v33, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v24 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v23, OS_SIGNPOST_INTERVAL_END, v11, "RecoverOctagonUsingInheritanceKey", " OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ", v33, 8u);
    }

    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 134218496;
      v26 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v34 = v11;
      v35 = 2048;
      v36 = (double)Nanoseconds / 1000000000.0;
      v37 = 1026;
      v38 = v26;
      _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverOctagonUsingInheritanceKey  OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ", v33, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v17);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)preflightRecoverOctagonUsingInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  OTControlArguments *v19;
  NSObject *v20;
  unint64_t Nanoseconds;
  NSObject *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  int v26;
  _QWORD v27[4];
  id v28;
  __int128 *p_buf;
  os_signpost_id_t v30;
  uint64_t v31;
  id v32;
  uint8_t v33[4];
  os_signpost_id_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  int v38;
  __int128 buf;
  uint64_t v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PreflightRecoverOctagonUsingInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PreflightRecoverOctagonUsingInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  objc_msgSend(v7, "makeOTControl:", &v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v32;
  secLogObjForScope("clique-inheritancekey");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_18A900000, v18, OS_LOG_TYPE_DEFAULT, "preflight join using inheritance key", v33, 2u);
  }

  if (v16)
  {
    v19 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __76__OTClique_preflightRecoverOctagonUsingInheritanceKey_inheritanceKey_reply___block_invoke;
    v27[3] = &unk_1E1FCE058;
    v30 = v11;
    v31 = v12;
    p_buf = &buf;
    v28 = v9;
    objc_msgSend(v16, "preflightJoinWithInheritanceKey:inheritanceKey:reply:", v19, v8, v27);

  }
  else
  {
    secLogObjForScope("clique-inheritancekey");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 138412290;
      v34 = (os_signpost_id_t)v17;
      _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v33, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v24 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v23, OS_SIGNPOST_INTERVAL_END, v11, "PreflightRecoverOctagonUsingInheritanceKey", " OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ", v33, 8u);
    }

    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 134218496;
      v26 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v34 = v11;
      v35 = 2048;
      v36 = (double)Nanoseconds / 1000000000.0;
      v37 = 1026;
      v38 = v26;
      _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightRecoverOctagonUsingInheritanceKey  OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ", v33, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v17);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)removeInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  OTControlArguments *v20;
  NSObject *v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  _QWORD v28[4];
  id v29;
  __int128 *p_buf;
  os_signpost_id_t v31;
  uint64_t v32;
  id v33;
  uint8_t v34[4];
  os_signpost_id_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  secLogObjForScope("octagon-removeinheritancekey");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "removeInheritanceKey invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RemoveInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RemoveInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  objc_msgSend(v7, "makeOTControl:", &v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v33;
  if (v18)
  {
    v20 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __58__OTClique_removeInheritanceKey_inheritanceKeyUUID_reply___block_invoke;
    v28[3] = &unk_1E1FCE058;
    v31 = v13;
    v32 = v14;
    p_buf = &buf;
    v29 = v9;
    objc_msgSend(v18, "removeInheritanceKey:uuid:reply:", v20, v8, v28);

  }
  else
  {
    secLogObjForScope("octagon-removeinheritancekey");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v13, "RemoveInheritanceKey", " OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ", v34, 8u);
    }

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 134218496;
      v27 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v35 = v13;
      v36 = 2048;
      v37 = (double)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = v27;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveInheritanceKey  OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)checkInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  OTControlArguments *v20;
  NSObject *v21;
  unint64_t Nanoseconds;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  _QWORD v28[4];
  id v29;
  __int128 *p_buf;
  os_signpost_id_t v31;
  uint64_t v32;
  id v33;
  uint8_t v34[4];
  os_signpost_id_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  secLogObjForScope("octagon-checkinheritancekey");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "checkInheritanceKey invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CheckInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CheckInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  objc_msgSend(v7, "makeOTControl:", &v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v33;
  if (v18)
  {
    v20 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v7);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __57__OTClique_checkInheritanceKey_inheritanceKeyUUID_reply___block_invoke;
    v28[3] = &unk_1E1FCE080;
    v31 = v13;
    v32 = v14;
    p_buf = &buf;
    v29 = v9;
    objc_msgSend(v18, "checkInheritanceKey:uuid:reply:", v20, v8, v28);

  }
  else
  {
    secLogObjForScope("octagon-checkinheritancekey");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 138412290;
      v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v24, OS_SIGNPOST_INTERVAL_END, v13, "CheckInheritanceKey", " OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ", v34, 8u);
    }

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 134218496;
      v27 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v35 = v13;
      v36 = 2048;
      v37 = (double)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = v27;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CheckInheritanceKey  OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ", v34, 0x1Cu);
    }

    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  OTControlArguments *v23;
  NSObject *v24;
  unint64_t Nanoseconds;
  NSObject *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  int v30;
  _QWORD v31[4];
  id v32;
  __int128 *p_buf;
  os_signpost_id_t v34;
  uint64_t v35;
  id v36;
  uint8_t v37[4];
  os_signpost_id_t v38;
  __int16 v39;
  double v40;
  __int16 v41;
  int v42;
  __int128 buf;
  uint64_t v44;
  char v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  secLogObjForScope("octagon-recreateinheritancekey");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "recreateInheritanceKey invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_generate(v15);
  v17 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v16, "RecreateInheritanceKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecreateInheritanceKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = 0;
  objc_msgSend(v9, "makeOTControl:", &v36);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v36;
  if (v21)
  {
    v23 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v9);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __52__OTClique_recreateInheritanceKey_uuid_oldIK_reply___block_invoke;
    v31[3] = &unk_1E1FCE0A8;
    v34 = v16;
    v35 = v17;
    p_buf = &buf;
    v32 = v12;
    objc_msgSend(v21, "recreateInheritanceKey:uuid:oldIK:reply:", v23, v10, v11, v31);

  }
  else
  {
    secLogObjForScope("octagon-recreateinheritancekey");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v37 = 138412290;
      v38 = (os_signpost_id_t)v22;
      _os_log_impl(&dword_18A900000, v24, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v37, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v16, v17);
    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      v28 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v37 = 67240192;
      LODWORD(v38) = v28;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v27, OS_SIGNPOST_INTERVAL_END, v16, "RecreateInheritanceKey", " OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateInheritanceKey}d ", v37, 8u);
    }

    _OctagonSignpostLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v37 = 134218496;
      v30 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v38 = v16;
      v39 = 2048;
      v40 = (double)Nanoseconds / 1000000000.0;
      v41 = 1026;
      v42 = v30;
      _os_log_impl(&dword_18A900000, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecreateInheritanceKey  OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateInheritanceKey}d ", v37, 0x1Cu);
    }

    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v22);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  OTControlArguments *v25;
  NSObject *v26;
  unint64_t Nanoseconds;
  NSObject *v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  int v32;
  id v33;
  _QWORD v34[4];
  id v35;
  __int128 *p_buf;
  os_signpost_id_t v37;
  uint64_t v38;
  id v39;
  uint8_t v40[4];
  os_signpost_id_t v41;
  __int16 v42;
  double v43;
  __int16 v44;
  int v45;
  __int128 buf;
  uint64_t v47;
  char v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v33 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  secLogObjForScope("octagon-createinheritancekeyclaimtokenwrappingkey");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "createInheritanceKey w/claimToken+wrappingKey invoked for context: %@", (uint8_t *)&buf, 0xCu);

  }
  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_generate(v17);
  v19 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_18A900000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v18, "CreateInheritanceKeyWithClaimTokenAndWrappingKey", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_18A900000, v22, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: CreateInheritanceKeyWithClaimTokenAndWrappingKey  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v47 = 0x2020000000;
  v48 = 0;
  v39 = 0;
  objc_msgSend(v11, "makeOTControl:", &v39);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v39;
  if (v23)
  {
    v25 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v11);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __75__OTClique_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply___block_invoke;
    v34[3] = &unk_1E1FCE0A8;
    v37 = v18;
    v38 = v19;
    p_buf = &buf;
    v35 = v14;
    objc_msgSend(v23, "createInheritanceKey:uuid:claimTokenData:wrappingKeyData:reply:", v25, v33, v12, v13, v34);

  }
  else
  {
    secLogObjForScope("octagon-createinheritancekeyclaimtokenwrappingkey");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v40 = 138412290;
      v41 = (os_signpost_id_t)v24;
      _os_log_impl(&dword_18A900000, v26, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v40, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(v18, v19);
    _OctagonSignpostLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      v30 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v40 = 67240192;
      LODWORD(v41) = v30;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v29, OS_SIGNPOST_INTERVAL_END, v18, "CreateInheritanceKeyWithClaimTokenAndWrappingKey", " OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ", v40, 8u);
    }

    _OctagonSignpostLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v40 = 134218496;
      v32 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      v41 = v18;
      v42 = 2048;
      v43 = (double)Nanoseconds / 1000000000.0;
      v44 = 1026;
      v45 = v32;
      _os_log_impl(&dword_18A900000, v31, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateInheritanceKeyWithClaimTokenAndWrappingKey  OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ", v40, 0x1Cu);
    }

    (*((void (**)(id, _QWORD, id))v14 + 2))(v14, 0, v24);
  }

  _Block_object_dispose(&buf, 8);
}

+ (BOOL)setCDPEnabled:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  OTControlArguments *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  __int128 buf;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0;
  objc_msgSend(v5, "makeOTControl:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v6)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__4162;
    v18 = __Block_byref_object_dispose__4163;
    v19 = 0;
    v8 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v5);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __32__OTClique_setCDPEnabled_error___block_invoke;
    v13[3] = &unk_1E1FD8560;
    v13[4] = &buf;
    objc_msgSend(v6, "setCDPEnabled:reply:", v8, v13);

    v9 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (a4 && v9)
    {
      *a4 = objc_retainAutorelease(v9);
      v9 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    }
    v10 = v9 == 0;
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    secLogObjForScope("SecError");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "octagon-setcdpenabled: failed to fetch OTControl object: %@", (uint8_t *)&buf, 0xCu);
    }

    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v10;
}

+ (int64_t)getCDPStatus:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  OTControlArguments *v8;
  void *v9;
  int64_t v10;
  NSObject *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __int128 buf;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0;
  objc_msgSend(v5, "makeOTControl:", &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (v6)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__4162;
    v22 = __Block_byref_object_dispose__4163;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v8 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v5);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __31__OTClique_getCDPStatus_error___block_invoke;
    v13[3] = &unk_1E1FCDE80;
    v13[4] = &buf;
    v13[5] = &v14;
    objc_msgSend(v6, "getCDPStatus:reply:", v8, v13);

    if (a4)
    {
      v9 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v9)
        *a4 = objc_retainAutorelease(v9);
    }
    v10 = v15[3];
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    secLogObjForScope("SecError");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "octagon-cdp-status: failed to fetch OTControl object: %@", (uint8_t *)&buf, 0xCu);
    }

    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v10;
}

+ (id)resetProtectedData:(id)a3 error:(id *)a4
{
  return +[OTClique resetProtectedData:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:error:](OTClique, "resetProtectedData:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:error:", a3, 0, 0, 0, a4);
}

+ (id)resetProtectedData:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 error:(id *)a7
{
  id v10;
  id v11;
  OTControlArguments *v12;
  void *v13;
  void *v14;
  OTClique *v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  char v44;
  char v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  CFTypeRef v49;
  OTClique *v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  _BOOL4 v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  CFTypeRef cf;
  _QWORD v67[5];
  id v68;
  _QWORD v69[4];
  _QWORD v70[4];
  __int128 buf;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v61 = a6;
  v79 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v64 = a4;
  v11 = a5;
  if (+[OTClique isCloudServicesAvailable](OTClique, "isCloudServicesAvailable"))
  {
    v68 = 0;
    objc_msgSend(v10, "makeOTControl:", &v68);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v68;
    if (!v63)
    {
      secLogObjForScope("SecError");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v62;
        _os_log_impl(&dword_18A900000, v16, OS_LOG_TYPE_DEFAULT, "clique-reset-protected-data: unable to create otcontrol: %@", (uint8_t *)&buf, 0xCu);
      }

      v15 = 0;
      if (a7)
        *a7 = objc_retainAutorelease(v62);
      goto LABEL_59;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__4162;
    v74 = __Block_byref_object_dispose__4163;
    v75 = 0;
    v12 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v10);
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __89__OTClique_resetProtectedData_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_error___block_invoke;
    v67[3] = &unk_1E1FCE0F8;
    v67[4] = &buf;
    objc_msgSend(v63, "fetchAccountWideSettingsWithForceFetch:arguments:reply:", 1, v12, v67);

    objc_msgSend(v10, "sbd");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v60 = v13;
    else
      v60 = objc_alloc_init((Class)getSecureBackupClass());

    objc_msgSend(v10, "authenticationAppleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (v18)
    {
      secLogObjForScope("SecError");
      v41 = objc_claimAutoreleasedReturnValue();
      v59 = v41;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v76) = 0;
        v42 = "clique-reset-protected-data: authenticationAppleID not set on configuration context";
LABEL_28:
        _os_log_impl(&dword_18A900000, v41, OS_LOG_TYPE_DEFAULT, v42, (uint8_t *)&v76, 2u);
      }
    }
    else
    {
      objc_msgSend(v10, "passwordEquivalentToken");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;

      if (!v20)
      {
        v21 = objc_alloc((Class)getAAFAnalyticsEventSecurityClass());
        objc_msgSend(v10, "altDSID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "flowID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deviceSessionID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v76 = 0;
        *((_QWORD *)&v76 + 1) = &v76;
        v77 = 0x2020000000;
        v25 = (id *)getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_ptr;
        v78 = getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_ptr;
        if (!getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_ptr)
        {
          v26 = KeychainCircleLibrary();
          v25 = (id *)dlsym(v26, "kSecurityRTCEventNameRPDDeleteAllRecords");
          *(_QWORD *)(*((_QWORD *)&v76 + 1) + 24) = v25;
          getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_ptr = (uint64_t)v25;
        }
        _Block_object_dispose(&v76, 8);
        if (!v25)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSecurityRTCEventNameRPDDeleteAllRecords(void)");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("OTClique.m"), 75, CFSTR("%s"), dlerror());

          __break(1u);
        }
        v27 = *v25;
        v28 = objc_msgSend(v10, "testsEnabled");
        getkSecurityRTCEventCategoryAccountDataAccessRecovery();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v58) = 1;
        v59 = objc_msgSend(v21, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v22, v23, v24, v27, v28, v58, v29);

        getkSecureBackupAuthenticationAppleID();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = v30;
        objc_msgSend(v10, "authenticationAppleID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = v31;
        getkSecureBackupAuthenticationPassword();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v69[1] = v32;
        objc_msgSend(v10, "passwordEquivalentToken");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v70[1] = v33;
        getkSecureBackupiCloudDataProtectionDeleteAllRecordsKey();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v69[2] = v34;
        v35 = MEMORY[0x1E0C9AAB0];
        v70[2] = MEMORY[0x1E0C9AAB0];
        getkSecureBackupContainsiCDPDataKey();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v69[3] = v36;
        v70[3] = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 4);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v60, "disableWithInfo:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          secLogObjForScope("SecError");
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v76) = 138412290;
            *(_QWORD *)((char *)&v76 + 4) = v38;
            _os_log_impl(&dword_18A900000, v39, OS_LOG_TYPE_DEFAULT, "clique-reset-protected-data: secure backup escrow record deletion failed: %@", (uint8_t *)&v76, 0xCu);
          }

          if (a7)
            *a7 = objc_retainAutorelease(v38);
          objc_msgSend(getSecurityAnalyticsReporterRTCClass(), "sendMetricWithEvent:success:error:", v59, 0, v38);
          v40 = 0;
          v15 = 0;
        }
        else
        {
          secLogObjForScope("clique-reset-protected-data");
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v76) = 0;
            _os_log_impl(&dword_18A900000, v43, OS_LOG_TYPE_DEFAULT, "sbd disableWithInfo succeeded", (uint8_t *)&v76, 2u);
          }

          objc_msgSend(getSecurityAnalyticsReporterRTCClass(), "sendMetricWithEvent:success:error:", v59, 1, 0);
          if (SOSCCIsSOSTrustAndSyncingEnabledCachedValue())
          {
            cf = 0;
            v44 = SOSCCResetToOffering(&cf);
            if (cf)
              v45 = 0;
            else
              v45 = v44;
            if ((v45 & 1) != 0)
            {
              secLogObjForScope("clique-reset-protected-data");
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v76) = 0;
                _os_log_impl(&dword_18A900000, v46, OS_LOG_TYPE_DEFAULT, "sos reset succeeded", (uint8_t *)&v76, 2u);
              }

            }
            else
            {
              secLogObjForScope("SecError");
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(v76) = 138412290;
                *(_QWORD *)((char *)&v76 + 4) = cf;
                _os_log_impl(&dword_18A900000, v48, OS_LOG_TYPE_DEFAULT, "clique-reset-protected-data: sos reset failed: %@, ignoring error and continuing with reset", (uint8_t *)&v76, 0xCu);
              }

              v49 = cf;
              if (cf)
              {
                cf = 0;
                CFRelease(v49);
              }
            }
          }
          else
          {
            secLogObjForScope("clique-reset-protected-data");
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v76) = 0;
              _os_log_impl(&dword_18A900000, v47, OS_LOG_TYPE_DEFAULT, "platform does not support sos", (uint8_t *)&v76, 2u);
            }

          }
          v50 = -[OTClique initWithContextData:]([OTClique alloc], "initWithContextData:", v10);
          v51 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          v65 = 0;
          -[OTClique resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:error:](v50, "resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:error:", 1, v64, v11, v61, v51, &v65);
          v40 = v65;
          if (v40)
          {
            secLogObjForScope("SecError");
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v76) = 138412290;
              *(_QWORD *)((char *)&v76 + 4) = v40;
              _os_log_impl(&dword_18A900000, v52, OS_LOG_TYPE_DEFAULT, "clique-reset-protected-data: account reset failed: %@", (uint8_t *)&v76, 0xCu);
            }

            v15 = 0;
            if (a7)
              *a7 = objc_retainAutorelease(v40);
          }
          else
          {
            secLogObjForScope("clique-reset-protected-data");
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v76) = 0;
              _os_log_impl(&dword_18A900000, v53, OS_LOG_TYPE_DEFAULT, "Octagon account reset succeeded", (uint8_t *)&v76, 2u);
            }

            objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.security.resetprotecteddata.complete"), 0, 0, 1);

            v15 = v50;
          }

        }
        goto LABEL_58;
      }
      secLogObjForScope("SecError");
      v41 = objc_claimAutoreleasedReturnValue();
      v59 = v41;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v76) = 0;
        v42 = "clique-reset-protected-data: passwordEquivalentToken not set on configuration context";
        goto LABEL_28;
      }
    }
    v40 = 0;
    v15 = 0;
LABEL_58:

    _Block_object_dispose(&buf, 8);
LABEL_59:

    goto LABEL_60;
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, 0);
    v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_60:

  return v15;
}

+ (BOOL)resetAcountData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  OTControlArguments *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  id v31;
  id v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  uint8_t v36[4];
  uint64_t v37;
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[4];
  _QWORD v44[6];

  v44[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (+[OTClique isCloudServicesAvailable](OTClique, "isCloudServicesAvailable"))
  {
    v35 = 0;
    objc_msgSend(v5, "makeOTControl:", &v35);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v35;
    if (!v33)
    {
      secLogObjForScope("SecError");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v32;
        _os_log_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEFAULT, "clique-reset-account-data: unable to create otcontrol: %@", (uint8_t *)&buf, 0xCu);
      }

      v8 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v32);
      goto LABEL_37;
    }
    objc_msgSend(v5, "sbd");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v31 = v6;
    else
      v31 = objc_alloc_init((Class)getSecureBackupClass());

    objc_msgSend(v5, "authenticationAppleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (v11)
    {
      secLogObjForScope("SecError");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        v24 = "clique-reset-account-data: authenticationAppleID not set on configuration context";
LABEL_24:
        _os_log_impl(&dword_18A900000, v21, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v5, "passwordEquivalentToken");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == 0;

      if (!v13)
      {
        getkSecureBackupAuthenticationAppleID();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v14;
        objc_msgSend(v5, "authenticationAppleID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v15;
        getkSecureBackupAuthenticationPassword();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v16;
        objc_msgSend(v5, "passwordEquivalentToken");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v44[1] = v17;
        getkSecureBackupiCloudDataProtectionDeleteAllRecordsKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v43[2] = v18;
        v19 = MEMORY[0x1E0C9AAB0];
        v44[2] = MEMORY[0x1E0C9AAB0];
        getkSecureBackupContainsiCDPDataKey();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v43[3] = v20;
        v44[3] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
        v21 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "disableWithInfo:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          secLogObjForScope("SecError");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v22;
            _os_log_impl(&dword_18A900000, v23, OS_LOG_TYPE_DEFAULT, "clique-reset-account-data: secure backup escrow record deletion failed: %@", (uint8_t *)&buf, 0xCu);
          }

          v8 = 0;
          if (a4)
            *a4 = objc_retainAutorelease(v22);
        }
        else
        {
          secLogObjForScope("clique-reset-account-data");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_18A900000, v25, OS_LOG_TYPE_DEFAULT, "sbd disableWithInfo succeeded", (uint8_t *)&buf, 2u);
          }

          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v39 = 0x3032000000;
          v40 = __Block_byref_object_copy__4162;
          v41 = __Block_byref_object_dispose__4163;
          v42 = 0;
          v26 = -[OTControlArguments initWithConfiguration:]([OTControlArguments alloc], "initWithConfiguration:", v5);
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __34__OTClique_resetAcountData_error___block_invoke;
          v34[3] = &unk_1E1FD8560;
          v34[4] = &buf;
          objc_msgSend(v33, "resetAcountData:resetReason:reply:", v26, 1, v34);

          v27 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          v8 = v27 == 0;
          if (v27)
          {
            secLogObjForScope("SecError");
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
              *(_DWORD *)v36 = 138412290;
              v37 = v29;
              _os_log_impl(&dword_18A900000, v28, OS_LOG_TYPE_DEFAULT, "clique-reset-account-data: account reset failed: %@", v36, 0xCu);
            }

            if (a4)
              *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
          }
          _Block_object_dispose(&buf, 8);

        }
        goto LABEL_36;
      }
      secLogObjForScope("SecError");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        v24 = "clique-reset-account-data: passwordEquivalentToken not set on configuration context";
        goto LABEL_24;
      }
    }
    v8 = 0;
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, 0);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_38:

  return v8;
}

void __34__OTClique_resetAcountData_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "clique-reset-account-data: failed to reset: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = v3;
    v7 = *(NSObject **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6;
  }
  else
  {
    secLogObjForScope("clique-reset-account-data");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "reset octagon", (uint8_t *)&v8, 2u);
    }
  }

}

void __89__OTClique_resetProtectedData_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "clique-reset-protected-data: failed to fetch account settings: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    secLogObjForScope("clique-reset-protected-data");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_DEFAULT, "fetched account settings: %@", (uint8_t *)&v11, 0xCu);
    }

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = v5;
    v7 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

}

void __31__OTClique_getCDPStatus_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v6;
  NSObject *v7;
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  secLogObjForScope("octagon-cdp-status");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "failed to fetch CDP status: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    if (v8)
    {
      v9 = CFSTR("unknown");
      if (a2 == 1)
        v9 = CFSTR("disabled");
      if (a2 == 2)
        v9 = CFSTR("enabled");
      v10 = v9;
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "successfully fetched CDP status as %@", (uint8_t *)&v11, 0xCu);

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void __32__OTClique_setCDPEnabled_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("octagon-setcdpenabled");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "failed to set CDP bit: %@", (uint8_t *)&v8, 0xCu);
    }

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = v3;
    v4 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else if (v5)
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "successfully set CDP bit", (uint8_t *)&v8, 2u);
  }

}

void __75__OTClique_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "octagon-createinheritancekeyclaimtokenwrappingkey, failed to create octagon inheritance recovery key (w/claim+wrappingkey)", (uint8_t *)&v22, 2u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CreateInheritanceKeyWithClaimTokenAndWrappingKey", " OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)Nanoseconds / 1000000000.0;
      v26 = 1026;
      v27 = v14;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateInheritanceKeyWithClaimTokenAndWrappingKey  OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }
  else
  {
    secLogObjForScope("octagon-createinheritancekeyclaimtokenwrappingkey");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "successfully created octagon inheritance recovery key (w/claim+wrappingkey)", (uint8_t *)&v22, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v20 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v18, OS_SIGNPOST_INTERVAL_END, v19, "CreateInheritanceKeyWithClaimTokenAndWrappingKey", " OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v21 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)v16 / 1000000000.0;
      v26 = 1026;
      v27 = v21;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateInheritanceKeyWithClaimTokenAndWrappingKey  OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __52__OTClique_recreateInheritanceKey_uuid_oldIK_reply___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "octagon-recreateinheritancekey, failed to recreate octagon inheritance recovery key", (uint8_t *)&v22, 2u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v10, OS_SIGNPOST_INTERVAL_END, v11, "RecreateInheritanceKey", " OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)Nanoseconds / 1000000000.0;
      v26 = 1026;
      v27 = v14;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecreateInheritanceKey  OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }
  else
  {
    secLogObjForScope("octagon-recreateinheritancekey");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "successfully recreated octagon inheritance recovery key", (uint8_t *)&v22, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v20 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v18, OS_SIGNPOST_INTERVAL_END, v19, "RecreateInheritanceKey", " OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v21 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)v16 / 1000000000.0;
      v26 = 1026;
      v27 = v21;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecreateInheritanceKey  OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __57__OTClique_checkInheritanceKey_inheritanceKeyUUID_reply___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  NSObject *v11;
  int v12;
  void (*v13)(void);
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  int v19;
  NSObject *v20;
  int v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    secLogObjForScope("SecError");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "octagon-checkinheritancekey, failed to check inheritance key", (uint8_t *)&v22, 2u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v10 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v10;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CheckInheritanceKey", " OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)Nanoseconds / 1000000000.0;
      v26 = 1026;
      v27 = v12;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CheckInheritanceKey  OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }

    v13 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    secLogObjForScope("octagon-checkinheritancekey");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v14, OS_LOG_TYPE_DEFAULT, "successfully checked inerhitance key", (uint8_t *)&v22, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v15 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = a1[6];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      v19 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v19;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v17, OS_SIGNPOST_INTERVAL_END, v18, "CheckInheritanceKey", " OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v21 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)v15 / 1000000000.0;
      v26 = 1026;
      v27 = v21;
      _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CheckInheritanceKey  OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }

    v13 = *(void (**)(void))(a1[4] + 16);
  }
  v13();

}

void __58__OTClique_removeInheritanceKey_inheritanceKeyUUID_reply___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t Nanoseconds;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "octagon-removeinheritancekey, failed to remove inheritance key", (uint8_t *)&v19, 2u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = a1[6];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      v9 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v9;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v7, OS_SIGNPOST_INTERVAL_END, v8, "RemoveInheritanceKey", " OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v11 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = a1[6];
      v21 = 2048;
      v22 = (double)Nanoseconds / 1000000000.0;
      v23 = 1026;
      v24 = v11;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveInheritanceKey  OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    secLogObjForScope("octagon-removeinheritancekey");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18A900000, v12, OS_LOG_TYPE_DEFAULT, "successfully removed inerhitance key", (uint8_t *)&v19, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v17 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v15, OS_SIGNPOST_INTERVAL_END, v16, "RemoveInheritanceKey", " OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v18 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = a1[6];
      v21 = 2048;
      v22 = (double)v13 / 1000000000.0;
      v23 = 1026;
      v24 = v18;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveInheritanceKey  OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __76__OTClique_preflightRecoverOctagonUsingInheritanceKey_inheritanceKey_reply___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  NSObject *v11;
  int v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  int v17;
  int v18;
  int v19;
  id v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("clique-inheritancekey");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v19 = 138412290;
      v20 = v3;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "failed to preflight join using inheritance key: %@", (uint8_t *)&v19, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v10 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v10;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PreflightRecoverOctagonUsingInheritanceKey", " OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = (id)a1[6];
      v21 = 2048;
      v22 = (double)Nanoseconds / 1000000000.0;
      v23 = 1026;
      v24 = v12;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightRecoverOctagonUsingInheritanceKey  OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "successful preflight join using inheritance key", (uint8_t *)&v19, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v17 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PreflightRecoverOctagonUsingInheritanceKey", " OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v18 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = (id)a1[6];
      v21 = 2048;
      v22 = (double)v13 / 1000000000.0;
      v23 = 1026;
      v24 = v18;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightRecoverOctagonUsingInheritanceKey  OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __67__OTClique_recoverOctagonUsingInheritanceKey_inheritanceKey_reply___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  NSObject *v11;
  int v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  int v17;
  int v18;
  int v19;
  id v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("clique-inheritancekey");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v19 = 138412290;
      v20 = v3;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "failed to join using inheritance key: %@", (uint8_t *)&v19, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v10 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v10;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecoverOctagonUsingInheritanceKey", " OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = (id)a1[6];
      v21 = 2048;
      v22 = (double)Nanoseconds / 1000000000.0;
      v23 = 1026;
      v24 = v12;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverOctagonUsingInheritanceKey  OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "successfully joined using inheritance key", (uint8_t *)&v19, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v17 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v15, OS_SIGNPOST_INTERVAL_END, v16, "RecoverOctagonUsingInheritanceKey", " OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v18 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = (id)a1[6];
      v21 = 2048;
      v22 = (double)v13 / 1000000000.0;
      v23 = 1026;
      v24 = v18;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverOctagonUsingInheritanceKey  OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __41__OTClique_storeInheritanceKey_ik_reply___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t Nanoseconds;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "octagon-storeinheritancekey, failed to store octagon inheritance recovery key", (uint8_t *)&v19, 2u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = a1[6];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      v9 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v9;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v7, OS_SIGNPOST_INTERVAL_END, v8, "StoreInheritanceKey", " OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v11 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = a1[6];
      v21 = 2048;
      v22 = (double)Nanoseconds / 1000000000.0;
      v23 = 1026;
      v24 = v11;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StoreInheritanceKey  OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    secLogObjForScope("octagon-storeinheritancekey");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18A900000, v12, OS_LOG_TYPE_DEFAULT, "successfully stored octagon inheritance recovery key", (uint8_t *)&v19, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v17 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v15, OS_SIGNPOST_INTERVAL_END, v16, "StoreInheritanceKey", " OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v18 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = a1[6];
      v21 = 2048;
      v22 = (double)v13 / 1000000000.0;
      v23 = 1026;
      v24 = v18;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StoreInheritanceKey  OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __46__OTClique_generateInheritanceKey_uuid_reply___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "octagon-generateinheritancekey, failed to generate octagon inheritance recovery key", (uint8_t *)&v22, 2u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v10, OS_SIGNPOST_INTERVAL_END, v11, "GenerateInheritanceKey", " OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)Nanoseconds / 1000000000.0;
      v26 = 1026;
      v27 = v14;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GenerateInheritanceKey  OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }
  else
  {
    secLogObjForScope("octagon-generateinheritancekey");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "successfully generated octagon inheritance recovery key", (uint8_t *)&v22, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v20 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v18, OS_SIGNPOST_INTERVAL_END, v19, "GenerateInheritanceKey", " OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v21 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)v16 / 1000000000.0;
      v26 = 1026;
      v27 = v21;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GenerateInheritanceKey  OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __44__OTClique_createInheritanceKey_uuid_reply___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "octagon-createinheritancekey, failed to create octagon inheritance recovery key", (uint8_t *)&v22, 2u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CreateInheritanceKey", " OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)Nanoseconds / 1000000000.0;
      v26 = 1026;
      v27 = v14;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateInheritanceKey  OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }
  else
  {
    secLogObjForScope("octagon-createinheritancekey");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "successfully created octagon inheritance recovery key", (uint8_t *)&v22, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v20 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v18, OS_SIGNPOST_INTERVAL_END, v19, "CreateInheritanceKey", " OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v21 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)v16 / 1000000000.0;
      v26 = 1026;
      v27 = v21;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateInheritanceKey  OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __69__OTClique_checkCustodianRecoveryKey_custodianRecoveryKeyUUID_reply___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  NSObject *v11;
  int v12;
  void (*v13)(void);
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  int v19;
  NSObject *v20;
  int v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    secLogObjForScope("SecError");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "octagon-checkcustodianrecoverykey, failed to check custodian recovery key", (uint8_t *)&v22, 2u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v10 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v10;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CheckCustodianRecoveryKey", " OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)Nanoseconds / 1000000000.0;
      v26 = 1026;
      v27 = v12;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CheckCustodianRecoveryKey  OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ", (uint8_t *)&v22, 0x1Cu);
    }

    v13 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    secLogObjForScope("octagon-checkcheckcustodianrecoverykey");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v14, OS_LOG_TYPE_DEFAULT, "successfully checked custodian recovery key", (uint8_t *)&v22, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v15 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = a1[6];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      v19 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v19;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v17, OS_SIGNPOST_INTERVAL_END, v18, "CheckCustodianRecoveryKey", " OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v21 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)v15 / 1000000000.0;
      v26 = 1026;
      v27 = v21;
      _os_log_impl(&dword_18A900000, v20, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CheckCustodianRecoveryKey  OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ", (uint8_t *)&v22, 0x1Cu);
    }

    v13 = *(void (**)(void))(a1[4] + 16);
  }
  v13();

}

void __70__OTClique_removeCustodianRecoveryKey_custodianRecoveryKeyUUID_reply___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t Nanoseconds;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "octagon-removecustodianrecoverykey, failed to remove custodian recovery key", (uint8_t *)&v19, 2u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = a1[6];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      v9 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v9;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v7, OS_SIGNPOST_INTERVAL_END, v8, "RemoveCustodianRecoveryKey", " OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v11 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = a1[6];
      v21 = 2048;
      v22 = (double)Nanoseconds / 1000000000.0;
      v23 = 1026;
      v24 = v11;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveCustodianRecoveryKey  OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    secLogObjForScope("octagon-removecustodianrecoverykey");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18A900000, v12, OS_LOG_TYPE_DEFAULT, "successfully removed custodian recovery key", (uint8_t *)&v19, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v17 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v15, OS_SIGNPOST_INTERVAL_END, v16, "RemoveCustodianRecoveryKey", " OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v18 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = a1[6];
      v21 = 2048;
      v22 = (double)v13 / 1000000000.0;
      v23 = 1026;
      v24 = v18;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RemoveCustodianRecoveryKey  OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __88__OTClique_preflightRecoverOctagonUsingCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  NSObject *v11;
  int v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  int v17;
  int v18;
  int v19;
  id v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("clique-custodianrecoverykey");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v19 = 138412290;
      v20 = v3;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "failed to preflight join using custodian recovery key: %@", (uint8_t *)&v19, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v10 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v10;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PreflightRecoverOctagonUsingCustodianRecoveryKey", " OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = (id)a1[6];
      v21 = 2048;
      v22 = (double)Nanoseconds / 1000000000.0;
      v23 = 1026;
      v24 = v12;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightRecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "successful preflight join using custodian recovery key", (uint8_t *)&v19, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v17 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PreflightRecoverOctagonUsingCustodianRecoveryKey", " OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v18 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = (id)a1[6];
      v21 = 2048;
      v22 = (double)v13 / 1000000000.0;
      v23 = 1026;
      v24 = v18;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PreflightRecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __79__OTClique_recoverOctagonUsingCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  NSObject *v11;
  int v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  int v17;
  int v18;
  int v19;
  id v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("clique-custodianrecoverykey");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v19 = 138412290;
      v20 = v3;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "failed to join using custodian recovery key: %@", (uint8_t *)&v19, 0xCu);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v10 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v10;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RecoverOctagonUsingCustodianRecoveryKey", " OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = (id)a1[6];
      v21 = 2048;
      v22 = (double)Nanoseconds / 1000000000.0;
      v23 = 1026;
      v24 = v12;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "successfully joined using custodian recovery key", (uint8_t *)&v19, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v17 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v15, OS_SIGNPOST_INTERVAL_END, v16, "RecoverOctagonUsingCustodianRecoveryKey", " OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v18 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v20 = (id)a1[6];
      v21 = 2048;
      v22 = (double)v13 / 1000000000.0;
      v23 = 1026;
      v24 = v18;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __50__OTClique_createCustodianRecoveryKey_uuid_reply___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "octagon-createcustodianrecoverykey, failed to create octagon custodian recovery key", (uint8_t *)&v22, 2u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CreateCustodianRecoveryKey", " OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)Nanoseconds / 1000000000.0;
      v26 = 1026;
      v27 = v14;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateCustodianRecoveryKey  OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }
  else
  {
    secLogObjForScope("octagon-createcustodianrecoverykey");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "successfully created octagon custodian recovery key", (uint8_t *)&v22, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v20 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v18, OS_SIGNPOST_INTERVAL_END, v19, "CreateCustodianRecoveryKey", " OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ", (uint8_t *)&v22, 8u);
    }

    _OctagonSignpostLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218496;
      v21 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      v23 = a1[6];
      v24 = 2048;
      v25 = (double)v16 / 1000000000.0;
      v26 = 1026;
      v27 = v21;
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: CreateCustodianRecoveryKey  OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ", (uint8_t *)&v22, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __56__OTClique_setNewRecoveryKeyWithData_recoveryKey_reply___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t Nanoseconds;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "octagon-setrecoverykey, failed to create octagon recovery key", (uint8_t *)&v19, 2u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds(a1[7], a1[8]);
    _OctagonSignpostLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = a1[7];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      v9 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v9;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SetNewRecoveryKeyWithData", " OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v11 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
      v20 = a1[7];
      v21 = 2048;
      v22 = (double)Nanoseconds / 1000000000.0;
      v23 = 1026;
      v24 = v11;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetNewRecoveryKeyWithData  OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    secLogObjForScope("octagon-setrecoverykey");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18A900000, v12, OS_LOG_TYPE_DEFAULT, "successfully set octagon recovery key", (uint8_t *)&v19, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    v13 = _OctagonSignpostGetNanoseconds(a1[7], a1[8]);
    _OctagonSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = a1[7];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v17 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
      v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl(&dword_18A900000, v15, OS_SIGNPOST_INTERVAL_END, v16, "SetNewRecoveryKeyWithData", " OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", (uint8_t *)&v19, 8u);
    }

    _OctagonSignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218496;
      v18 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
      v20 = a1[7];
      v21 = 2048;
      v22 = (double)v13 / 1000000000.0;
      v23 = 1026;
      v24 = v18;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SetNewRecoveryKeyWithData  OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ", (uint8_t *)&v19, 0x1Cu);
    }
  }

  (*(void (**)(void))(a1[5] + 16))();
}

void __54__OTClique_findOptimalBottleIDsWithContextData_error___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  secLogObjForScope("clique-findbottle");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v23 = 138412290;
      v24 = v9;
      v12 = "findOptimalBottleIDsWithContextData errored: %@";
      v13 = v10;
      v14 = 12;
LABEL_6:
      _os_log_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v23, v14);
    }
  }
  else if (v11)
  {
    v23 = 138412546;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    v12 = "findOptimalBottleIDsWithContextData succeeded: %@, %@";
    v13 = v10;
    v14 = 22;
    goto LABEL_6;
  }

  v15 = *(_QWORD *)(a1[4] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;
  v17 = v9;

  v18 = *(_QWORD *)(a1[5] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v7;
  v20 = v7;

  v21 = *(_QWORD *)(a1[6] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v8;

}

void __45__OTClique_fetchEscrowRecordsInternal_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  secLogObjForScope("clique-fetchrecords");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v15 = 138412290;
      v16 = v6;
      v9 = "fetchEscrowRecords errored: %@";
LABEL_6:
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v8)
  {
    v15 = 138412290;
    v16 = v5;
    v9 = "fetchEscrowRecords succeeded: %@";
    goto LABEL_6;
  }

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v5;

}

void __71__OTClique_performEscrowRecoveryWithContextData_escrowArguments_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  secLogObjForScope("clique-recovery");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v11 = 138412290;
      v12 = v3;
      v6 = "restore bottle errored: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    v6 = "restoring bottle succeeded";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v3;

}

void __36__OTClique_isCloudServicesAvailable__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  secLogObjForScope("octagon");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18A900000, v0, OS_LOG_TYPE_DEFAULT, "CloudServices is unavailable on this platform", v1, 2u);
  }

}

@end
