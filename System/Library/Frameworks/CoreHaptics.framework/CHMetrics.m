@implementation CHMetrics

- (id).cxx_construct
{
  *((_QWORD *)self + 18) = 0;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 38) = 1065353216;
  return self;
}

- (void)logMetric:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (kHMETScope)
  {
    v7 = *(id *)kHMETScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v11 = "CHMetrics.mm";
    v12 = 1024;
    v13 = 432;
    v14 = 2080;
    v15 = "-[CHMetrics logMetric:value:]";
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: logging metrics for \"%@\", buf, 0x26u);
  }

LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v6, v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CAReportingClientSendMessage();

}

- (CHMetrics)initWithEngine:(id)a3 audioSessionID:(unsigned int)a4 sessionIsShared:(BOOL)a5 isSPI:(BOOL)a6
{
  id v10;
  char *v11;
  id v12;
  NSObject *v13;
  id v14;
  dispatch_queue_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  CHMetrics *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t i;
  void *v34;
  objc_super v36;
  uint8_t buf[40];
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  const __CFString *v62;
  uint64_t v63;
  const __CFString *v64;
  uint64_t v65;
  const __CFString *v66;
  uint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  const __CFString *v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  const __CFString *v78;
  uint64_t v79;
  const __CFString *v80;
  uint64_t v81;
  const __CFString *v82;
  uint64_t v83;
  const __CFString *v84;
  uint64_t v85;
  const __CFString *v86;
  uint64_t v87;
  const __CFString *v88;
  unint64_t v89[2];

  v89[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CHMetrics;
  v11 = -[CHMetrics init](&v36, sel_init);
  v12 = v11;
  if (!v11)
  {
LABEL_29:
    v25 = (CHMetrics *)v12;
    goto LABEL_30;
  }
  if (kHMETScope)
  {
    v13 = *(id *)kHMETScope;
    if (!v13)
      goto LABEL_9;
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "CHMetrics.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 123;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[CHMetrics initWithEngine:audioSessionID:sessionIsShared:isSPI:]";
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v10;
    _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: initializing metrics for engine %@", buf, 0x26u);
  }

LABEL_9:
  if (objc_msgSend(v11, "isEnabled"))
  {
    v15 = dispatch_queue_create("CHMetricsDispatchQueue", 0);
    v16 = (void *)*((_QWORD *)v11 + 4);
    *((_QWORD *)v11 + 4) = v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p"), v10);
    v18 = (void *)*((_QWORD *)v11 + 2);
    *((_QWORD *)v11 + 2) = v17;

    *((_QWORD *)v11 + 1) = 1;
    *((_DWORD *)v11 + 6) = a4;
    v11[28] = a5;
    v11[29] = a6;
    objc_msgSend(v11, "setReporter");
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = (void *)*((_QWORD *)v11 + 21);
    *((_QWORD *)v11 + 21) = v19;

    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = (void *)*((_QWORD *)v11 + 20);
    *((_QWORD *)v11 + 20) = v21;

    *((_QWORD *)v11 + 5) = 0x3F3333333ECCCCCDLL;
    objc_msgSend(v10, "serverConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
      objc_msgSend(v23, "hapticTransientIDs");
    else
      memset(buf, 0, 24);
    v26 = (void *)*((_QWORD *)v11 + 6);
    if (v26)
    {
      *((_QWORD *)v11 + 7) = v26;
      operator delete(v26);
      *((_QWORD *)v11 + 6) = 0;
      *((_QWORD *)v11 + 7) = 0;
      *((_QWORD *)v11 + 8) = 0;
    }
    *((_OWORD *)v11 + 3) = *(_OWORD *)buf;
    *((_QWORD *)v11 + 8) = *(_QWORD *)&buf[16];
    memset(buf, 0, 24);

    objc_msgSend(v10, "serverConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      objc_msgSend(v27, "hapticContinuousSustainedIDs");
    else
      memset(buf, 0, 24);
    v29 = (void *)*((_QWORD *)v11 + 9);
    if (v29)
    {
      *((_QWORD *)v11 + 10) = v29;
      operator delete(v29);
      *((_QWORD *)v11 + 9) = 0;
      *((_QWORD *)v11 + 10) = 0;
      *((_QWORD *)v11 + 11) = 0;
    }
    *(_OWORD *)(v11 + 72) = *(_OWORD *)buf;
    *((_QWORD *)v11 + 11) = *(_QWORD *)&buf[16];
    memset(buf, 0, 24);

    objc_msgSend(v10, "serverConfig");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
      objc_msgSend(v30, "hapticContinuousNonsustainedIDs");
    else
      memset(buf, 0, 24);
    v32 = (void *)*((_QWORD *)v11 + 12);
    if (v32)
    {
      *((_QWORD *)v11 + 13) = v32;
      operator delete(v32);
      *((_QWORD *)v11 + 12) = 0;
      *((_QWORD *)v11 + 13) = 0;
      *((_QWORD *)v11 + 14) = 0;
    }
    *((_OWORD *)v11 + 6) = *(_OWORD *)buf;
    *((_QWORD *)v11 + 14) = *(_QWORD *)&buf[16];
    memset(buf, 0, 24);

    *(_QWORD *)buf = 8021;
    *(_QWORD *)&buf[8] = CFSTR("MicroTap2");
    *(_QWORD *)&buf[16] = 11093;
    *(_QWORD *)&buf[24] = CFSTR("MicroTap3");
    *(_QWORD *)&buf[32] = 14165;
    v38 = CFSTR("MicroTap4");
    v39 = 17237;
    v40 = CFSTR("MicroTap5");
    v41 = 20309;
    v42 = CFSTR("MicroTap6");
    v43 = 23381;
    v44 = CFSTR("MicroTap7");
    v45 = 26453;
    v46 = CFSTR("MicroTap8");
    v47 = 29525;
    v48 = CFSTR("MicroTap9");
    v49 = 8022;
    v50 = CFSTR("MiniTap2");
    v51 = 11094;
    v52 = CFSTR("MiniTap3");
    v53 = 14166;
    v54 = CFSTR("MiniTap4");
    v55 = 17238;
    v56 = CFSTR("MiniTap5");
    v57 = 20310;
    v58 = CFSTR("MiniTap6");
    v59 = 23382;
    v60 = CFSTR("MiniTap7");
    v61 = 26454;
    v62 = CFSTR("MiniTap8");
    v63 = 29526;
    v64 = CFSTR("MiniTap9");
    v65 = 8023;
    v66 = CFSTR("FullTap2");
    v67 = 11095;
    v68 = CFSTR("FullTap3");
    v69 = 14167;
    v70 = CFSTR("FullTap4");
    v71 = 17239;
    v72 = CFSTR("FullTap5");
    v73 = 20311;
    v74 = CFSTR("FullTap6");
    v75 = 23383;
    v76 = CFSTR("FullTap7");
    v77 = 26455;
    v78 = CFSTR("FullTap8");
    v79 = 29527;
    v80 = CFSTR("FullTap9");
    v81 = 32512;
    v82 = CFSTR("KBKey");
    v83 = 32557;
    v84 = CFSTR("KBDown");
    v85 = 29485;
    v86 = CFSTR("KBModifier");
    v87 = 32556;
    v88 = CFSTR("WoT");
    std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__assign_unique<std::pair<AVHapticPlayerEventType const,NSString * {__strong}> const*>((_QWORD *)v11 + 15, (unint64_t *)buf, v89);
    for (i = 440; i != -8; i -= 16)

    v34 = (void *)*((_QWORD *)v12 + 23);
    *((_QWORD *)v12 + 23) = 0;

    *((_BYTE *)v12 + 176) = 0;
    goto LABEL_29;
  }
  v25 = 0;
LABEL_30:

  return v25;
}

- (void)setReporter
{
  void *v2;
  void *v4;
  void *v5;
  NSObject *v6;
  int64_t reporterID;
  id v8;
  int v9;
  id v10;
  int64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  id v21;
  NSString *engineID;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  int v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CFF1C8], "retrieveSessionWithID:", self->_audioSessionID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!self->_sessionIsShared)
  {
    self->_reporterID = CAReportingClientCreateReporterID();
    CAReportingClientSetAudioServiceType();
    reporterID = self->_reporterID;
    v25 = 0;
    objc_msgSend(v5, "setReporterID:error:", reporterID, &v25);
    v8 = v25;
    v24 = v8;
    if (v8)
      v9 = objc_msgSend(v8, "code");
    else
      v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13
      && (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"),
          v14 = v9,
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v23, "bundleIdentifier"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v2, "isEqual:", CFSTR("Unknown")) & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v9;
      objc_msgSend(v15, "processName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
LABEL_18:

        v36 = CFSTR("HostApplicationDisplayID");
        v37[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        CAReportingClientSetConfiguration();

        v19 = v14;
        if (v14)
          goto LABEL_21;
        goto LABEL_19;
      }
    }

    goto LABEL_18;
  }
  self->_reporterID = objc_msgSend(v4, "reporterID");
  if (!kHMETScope)
  {
    v6 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_8;
  }
  v6 = *(id *)kHMETScope;
  if (v6)
  {
LABEL_8:
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v11 = self->_reporterID;
      *(_DWORD *)buf = 136315906;
      v27 = "CHMetrics.mm";
      v28 = 1024;
      v29 = 361;
      v30 = 2080;
      v31 = "-[CHMetrics setReporter]";
      v32 = 2048;
      v33 = v11;
      _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: updating haptics reporter with audio session reporter id %lld", buf, 0x26u);
    }

  }
LABEL_19:
  if (self->_reporterID > 0)
    goto LABEL_28;
  v19 = 0;
LABEL_21:
  if (kHMETScope)
  {
    v20 = *(id *)kHMETScope;
    if (!v20)
      goto LABEL_28;
  }
  else
  {
    v20 = MEMORY[0x1E0C81028];
    v21 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    engineID = self->_engineID;
    *(_DWORD *)buf = 136316162;
    v27 = "CHMetrics.mm";
    v28 = 1024;
    v29 = 378;
    v30 = 2080;
    v31 = "-[CHMetrics setReporter]";
    v32 = 2112;
    v33 = (int64_t)engineID;
    v34 = 1024;
    v35 = v19;
    _os_log_impl(&dword_1B573F000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: unable to set reporter for engine %@: error %d", buf, 0x2Cu);
  }

LABEL_28:
}

- (BOOL)isEnabled
{
  int AppBooleanValue;
  NSObject *v3;
  id v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("hapticmetrics_client_disabled"), CFSTR("com.apple.corehaptics"), 0);
  if (AppBooleanValue)
  {
    if (kHMETScope)
    {
      v3 = *(id *)kHMETScope;
      if (!v3)
        return AppBooleanValue == 0;
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 136315650;
      v7 = "CHMetrics.mm";
      v8 = 1024;
      v9 = 409;
      v10 = 2080;
      v11 = "-[CHMetrics isEnabled]";
      _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d %s: client side metrics DISABLED (defaults write com.apple.corehaptics hapticmetrics_client_disabled == true)", (uint8_t *)&v6, 0x1Cu);
    }

  }
  return AppBooleanValue == 0;
}

- (void)handleStartForPlayer:(id)a3 time:(double)a4 isAdvanced:(BOOL)a5 patternID:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;

  v7 = a5;
  v11 = a3;
  v10 = a6;
  if (!v10)
    -[CHMetrics handleActionForPlayer:action:time:isAdvanced:](self, "handleActionForPlayer:action:time:isAdvanced:", v11, 0, v7, a4);
  -[CHMetrics addPatternLibraryMetric:](self, "addPatternLibraryMetric:", v10);

}

- (void)handleInitForPlayer:(id)a3 events:(id)a4 isAdvanced:(BOOL)a5 patternID:(id)a6
{
  id v10;
  id v11;
  id v12;
  const __CFString *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (self->_isSPI)
    v13 = CFSTR("initPatternPlayer_SPI");
  else
    v13 = CFSTR("initPatternPlayer");
  -[CHMetrics logMetric:value:](self, "logMetric:value:", v13, &unk_1E6969880);
  if (!v12)
  {
    -[CHMetrics getIDForPlayer:](self, "getIDForPlayer:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__CHMetrics_handleInitForPlayer_events_isAdvanced_patternID___block_invoke;
    v16[3] = &unk_1E69600D8;
    objc_copyWeak(&v19, &location);
    v20 = a5;
    v17 = v14;
    v18 = v11;
    v15 = v14;
    -[CHMetrics dispatchOnLocal:](self, "dispatchOnLocal:", v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

- (void)handleActionForPlayer:(id)a3 action:(int64_t)a4 time:(double)a5 isAdvanced:(BOOL)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15[3];
  BOOL v16;
  id location;

  v10 = a3;
  -[CHMetrics getIDForPlayer:](self, "getIDForPlayer:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__CHMetrics_handleActionForPlayer_action_time_isAdvanced___block_invoke;
  v13[3] = &unk_1E6960100;
  objc_copyWeak(v15, &location);
  v16 = a6;
  v14 = v11;
  v15[1] = (id)a4;
  v15[2] = *(id *)&a5;
  v12 = v11;
  -[CHMetrics dispatchOnLocal:](self, "dispatchOnLocal:", v13);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

}

- (void)dispatchOnLocal:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHMETScope)
  {
    if ((*(_BYTE *)(kHMETScope + 8) & 1) != 0)
    {
      v5 = *(id *)kHMETScope;
      if (v5)
      {
        v6 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          v7 = (void *)MEMORY[0x1B5E4F2B4](v4);
          *(_DWORD *)buf = 136315906;
          v13 = "CHMetrics.mm";
          v14 = 1024;
          v15 = 423;
          v16 = 2080;
          v17 = "-[CHMetrics dispatchOnLocal:]";
          v18 = 2048;
          v19 = v7;
          _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Dispatching block %p async...>", buf, 0x26u);

        }
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CHMetrics_dispatchOnLocal___block_invoke;
  block[3] = &unk_1E6960150;
  v11 = v4;
  v9 = v4;
  dispatch_async(dispatchQueue, block);

}

- (id)getIDForPlayer:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addPatternLibraryMetric:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[NSMutableDictionary objectForKey:](self->_patternLibraryData, "objectForKey:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      -[NSMutableDictionary objectForKeyedSubscript:](self->_patternLibraryData, "objectForKeyedSubscript:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_patternLibraryData, "setObject:forKeyedSubscript:", v7, v8);

    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_patternLibraryData, "setObject:forKeyedSubscript:", &unk_1E6969880, v8);
    }
  }

}

- (void)stopReporter
{
  NSObject *v3;
  id v4;
  NSString *engineID;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_sessionIsShared)
  {
    if (kHMETScope)
    {
      v3 = *(id *)kHMETScope;
      if (!v3)
      {
LABEL_9:
        CAReportingClientStopReporter();
        return;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      engineID = self->_engineID;
      v6 = 136315906;
      v7 = "CHMetrics.mm";
      v8 = 1024;
      v9 = 395;
      v10 = 2080;
      v11 = "-[CHMetrics stopReporter]";
      v12 = 2112;
      v13 = engineID;
      _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: stopping reporter for engine %@", (uint8_t *)&v6, 0x26u);
    }

    goto LABEL_9;
  }
}

- (void)handleFinishedForPlayersAtTime:(double)a3
{
  NSObject *v5;
  id v6;
  NSString *engineID;
  _QWORD v8[4];
  id v9[2];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (kHMETScope)
  {
    v5 = *(id *)kHMETScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    *(_DWORD *)buf = 136315906;
    v11 = "CHMetrics.mm";
    v12 = 1024;
    v13 = 324;
    v14 = 2080;
    v15 = "-[CHMetrics handleFinishedForPlayersAtTime:]";
    v16 = 2112;
    v17 = engineID;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: flushing all player data for engine %@", buf, 0x26u);
  }

LABEL_8:
  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__CHMetrics_handleFinishedForPlayersAtTime___block_invoke;
  v8[3] = &unk_1E6960128;
  objc_copyWeak(v9, (id *)buf);
  v9[1] = *(id *)&a3;
  -[CHMetrics dispatchOnLocal:](self, "dispatchOnLocal:", v8);
  objc_destroyWeak(v9);
  objc_destroyWeak((id *)buf);
}

- (void)handleEngineStop
{
  -[CHMetrics logPowerLogMetric:](self, "logPowerLogMetric:", CFSTR("EngineOff"));
  -[CHMetrics sendPatternLibraryMetrics](self, "sendPatternLibraryMetrics");
  -[CHMetrics stopReporter](self, "stopReporter");
}

- (void)sendPatternLibraryMetrics
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[3];
  _QWORD v20[3];
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (kHMETScope)
  {
    v3 = *(id *)kHMETScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = (id)MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = -[NSMutableDictionary count](self->_patternLibraryData, "count");
    *(_DWORD *)buf = 136315906;
    v23 = "CHMetrics.mm";
    v24 = 1024;
    v25 = 468;
    v26 = 2080;
    v27 = "-[CHMetrics sendPatternLibraryMetrics]";
    v28 = 2048;
    v29 = v6;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: sending %lu pattern library metrics", buf, 0x26u);
  }

LABEL_8:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = self->_patternLibraryData;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v20[0] = v10;
        v19[0] = CFSTR("patternID");
        v19[1] = CFSTR("Count");
        -[NSMutableDictionary objectForKeyedSubscript:](self->_patternLibraryData, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = v11;
        v19[2] = CFSTR("SPI");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSPI);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[2] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        CAReportingClientSendMessage();
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

  -[NSMutableDictionary removeAllObjects](self->_patternLibraryData, "removeAllObjects");
}

- (void)handleEngineStart
{
  const __CFString *v3;

  -[CHMetrics startReporter](self, "startReporter");
  -[CHMetrics logPowerLogMetric:](self, "logPowerLogMetric:", CFSTR("EngineOn"));
  if (self->_isSPI)
    v3 = CFSTR("startHapticEngine_SPI");
  else
    v3 = CFSTR("startHapticEngine");
  -[CHMetrics logMetric:value:](self, "logMetric:value:", v3, &unk_1E6969880);
}

- (void)logPowerLogMetric:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (kHMETScope)
  {
    v4 = *(id *)kHMETScope;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v10 = "CHMetrics.mm";
    v11 = 1024;
    v12 = 439;
    v13 = 2080;
    v14 = "-[CHMetrics logPowerLogMetric:]";
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: logging PowerLog metrics for \"%@\", buf, 0x26u);
  }

LABEL_8:
  v7 = CFSTR("EngineState");
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CAReportingClientSendMessage();

}

- (void)startReporter
{
  NSObject *v3;
  id v4;
  NSString *engineID;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_sessionIsShared)
  {
    if (kHMETScope)
    {
      v3 = *(id *)kHMETScope;
      if (!v3)
      {
LABEL_9:
        CAReportingClientStartReporter();
        return;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      engineID = self->_engineID;
      v6 = 136315906;
      v7 = "CHMetrics.mm";
      v8 = 1024;
      v9 = 386;
      v10 = 2080;
      v11 = "-[CHMetrics startReporter]";
      v12 = 2112;
      v13 = engineID;
      _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: starting reporter for engine %@", (uint8_t *)&v6, 0x26u);
    }

    goto LABEL_9;
  }
}

void __29__CHMetrics_dispatchOnLocal___block_invoke(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (kHMETScope)
  {
    if ((*(_BYTE *)(kHMETScope + 8) & 1) != 0)
    {
      v1 = *(id *)kHMETScope;
      if (v1)
      {
        v2 = v1;
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
        {
          v3 = 136315650;
          v4 = "CHMetrics.mm";
          v5 = 1024;
          v6 = 426;
          v7 = 2080;
          v8 = "-[CHMetrics dispatchOnLocal:]_block_invoke";
          _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: <Block async dispatch complete>", (uint8_t *)&v3, 0x1Cu);
        }

      }
    }
  }
}

void __61__CHMetrics_handleInitForPlayer_events_isAdvanced_patternID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(WeakRetained, "prepareAdvancedPlaybackData:events:", v2, v3);
    else
      objc_msgSend(WeakRetained, "preparePlaybackData:events:", v2, v3);
  }

}

void __58__CHMetrics_handleActionForPlayer_action_time_isAdvanced___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(double *)(a1 + 56);
    *(float *)&v4 = v4;
    if (*(_BYTE *)(a1 + 64))
      objc_msgSend(WeakRetained, "markAdvancedPlaybackAction:action:time:", v2, v3, v4);
    else
      objc_msgSend(WeakRetained, "markPlaybackAction:action:time:", v2, v3, v4);
  }

}

- (float)getLoopsForPlayer:(id)a3 endTime:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  NSObject *v20;
  float v21;
  NSObject *v22;
  id v23;
  id v24;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("playback"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("edgeCase"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (!v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playbackDuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstStartTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("patternDuration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v18;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playbackLastAction"));
    v20 = objc_claimAutoreleasedReturnValue();
    v9 = v20;
    v21 = a4 - v16;
    if (v13 == 0.0 && !-[NSObject action](v20, "action") && v19 > v21)
    {
      v13 = v21;
LABEL_26:
      v10 = v13 / v19;
LABEL_27:

      goto LABEL_28;
    }
    if (v13 < (float)(v19 + v21) && !-[NSObject action](v9, "action"))
    {
      v13 = v13 + v19;
      goto LABEL_26;
    }
    if (v13 < v21 && -[NSObject action](v9, "action") == 3 || -[NSObject action](v9, "action") == 3)
      goto LABEL_26;
    if (kHMETScope)
    {
      v22 = *(id *)kHMETScope;
      if (!v22)
      {
LABEL_25:
        v13 = 0.0;
        goto LABEL_26;
      }
    }
    else
    {
      v22 = MEMORY[0x1E0C81028];
      v24 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136315650;
      v27 = "CHMetrics.mm";
      v28 = 1024;
      v29 = 861;
      v30 = 2080;
      v31 = "-[CHMetrics getLoopsForPlayer:endTime:]";
      _os_log_impl(&dword_1B573F000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: edge case - no case found", (uint8_t *)&v26, 0x1Cu);
    }

    goto LABEL_25;
  }
  if (!kHMETScope)
  {
    v9 = MEMORY[0x1E0C81028];
    v23 = MEMORY[0x1E0C81028];
LABEL_18:
    v10 = 1.0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136315650;
      v27 = "CHMetrics.mm";
      v28 = 1024;
      v29 = 837;
      v30 = 2080;
      v31 = "-[CHMetrics getLoopsForPlayer:endTime:]";
      _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: edge case - no loop multiplier, log once", (uint8_t *)&v26, 0x1Cu);
    }
    goto LABEL_27;
  }
  v9 = *(id *)kHMETScope;
  if (v9)
    goto LABEL_18;
  v10 = 1.0;
LABEL_28:

  return v10;
}

- (void)markPlaybackAction:(id)a3 action:(int64_t)a4 time:(float)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSString *engineID;
  double v12;
  double v13;
  void *v14;
  void *v15;
  PlaybackAction *v16;
  void *v17;
  char v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  _BOOL4 v23;
  double v24;
  void *v25;
  float v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  float v32;
  double v33;
  float v34;
  double v35;
  void *v36;
  void *v37;
  float v38;
  double v39;
  void *v40;
  id v41;
  NSObject *v42;
  float v43;
  id v44;
  id v45;
  int v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (kHMETScope)
  {
    v9 = *(id *)kHMETScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    v46 = 136316418;
    v47 = "CHMetrics.mm";
    v48 = 1024;
    v49 = 576;
    v50 = 2080;
    v51 = "-[CHMetrics markPlaybackAction:action:time:]";
    v52 = 2048;
    v53 = *(double *)&a4;
    v54 = 2112;
    v55 = *(double *)&engineID;
    v56 = 2048;
    v57 = v8;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: marking action %ld for engine %@ player %p", (uint8_t *)&v46, 0x3Au);
  }

LABEL_8:
  +[CHMetrics currentTime](CHMetrics, "currentTime");
  if (v12 > a5)
  {
    +[CHMetrics currentTime](CHMetrics, "currentTime");
    a5 = v13;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_playerData, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("playback"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("playbackLastAction"));
  v16 = (PlaybackAction *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("edgeCase"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if ((v18 & 1) == 0)
  {
    if (*(double *)&a4 != 0.0)
      goto LABEL_17;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("firstStartTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    if (v20 < 0.0)
    {

    }
    else
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("firstStartTime"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      v23 = a5 < v22;

      if (!v23)
      {
LABEL_17:
        if (v16)
        {
          -[PlaybackAction time](v16, "time");
          if (a5 < v26)
          {
            if (kHMETScope)
            {
              v27 = *(id *)kHMETScope;
              if (!v27)
                goto LABEL_44;
            }
            else
            {
              v27 = (id)MEMORY[0x1E0C81028];
              v41 = MEMORY[0x1E0C81028];
            }
            v42 = v27;
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              -[PlaybackAction time](v16, "time");
              v46 = 136316162;
              v47 = "CHMetrics.mm";
              v48 = 1024;
              v49 = 612;
              v50 = 2080;
              v51 = "-[CHMetrics markPlaybackAction:action:time:]";
              v52 = 2048;
              v53 = a5;
              v54 = 2048;
              v55 = v43;
              _os_log_impl(&dword_1B573F000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: edge case: action time out of order %g < %g", (uint8_t *)&v46, 0x30u);
            }

LABEL_39:
LABEL_44:
            objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E6969880, CFSTR("edgeCase"));
            goto LABEL_45;
          }
          v29 = -[PlaybackAction action](v16, "action");
          if (a4 == 3 && !v29 || !(-[PlaybackAction action](v16, "action") | a4))
          {
            -[PlaybackAction time](v16, "time");
            v32 = v31;
            -[PlaybackAction setAction:](v16, "setAction:", a4);
            *(float *)&v33 = a5;
            -[PlaybackAction setTime:](v16, "setTime:", v33);
            v34 = (float)(a5 - v32) + 0.0;
LABEL_34:
            v36 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("playbackDuration"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "floatValue");
            *(float *)&v39 = v34 + v38;
            objc_msgSend(v36, "numberWithFloat:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v40, CFSTR("playbackDuration"));

            goto LABEL_45;
          }
          v30 = -[PlaybackAction action](v16, "action");
          if (*(double *)&a4 != 0.0 || v30 != 3)
          {
            if (kHMETScope)
            {
              v42 = *(id *)kHMETScope;
              if (!v42)
                goto LABEL_44;
            }
            else
            {
              v42 = MEMORY[0x1E0C81028];
              v45 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              v46 = 136315650;
              v47 = "CHMetrics.mm";
              v48 = 1024;
              v49 = 628;
              v50 = 2080;
              v51 = "-[CHMetrics markPlaybackAction:action:time:]";
              _os_log_impl(&dword_1B573F000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: edge case: unknown case", (uint8_t *)&v46, 0x1Cu);
            }
            goto LABEL_39;
          }
        }
        else
        {
          v16 = objc_alloc_init(PlaybackAction);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("playbackLastAction"));
          if (*(double *)&a4 != 0.0)
          {
            if (kHMETScope)
            {
              v28 = *(id *)kHMETScope;
              if (!v28)
                goto LABEL_44;
            }
            else
            {
              v28 = MEMORY[0x1E0C81028];
              v44 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              v46 = 136315650;
              v47 = "CHMetrics.mm";
              v48 = 1024;
              v49 = 605;
              v50 = 2080;
              v51 = "-[CHMetrics markPlaybackAction:action:time:]";
              _os_log_impl(&dword_1B573F000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: edge case: did not see startAtTime as first call", (uint8_t *)&v46, 0x1Cu);
            }

            goto LABEL_44;
          }
        }
        -[PlaybackAction setAction:](v16, "setAction:", 0);
        v34 = 0.0;
        *(float *)&v35 = a5;
        -[PlaybackAction setTime:](v16, "setTime:", v35);
        goto LABEL_34;
      }
    }
    *(float *)&v24 = a5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, CFSTR("firstStartTime"));

    goto LABEL_17;
  }
LABEL_45:

}

+ (double)currentTime
{
  return (double)mach_absolute_time() * 0.0000000416666667;
}

- (void)sendDetailedMetricsForPlayerID:(id)a3 endTime:(float)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  NSObject *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  id v17;
  const char *v18;
  id v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  id v24;
  id v25;
  NSObject *v26;
  NSString *engineID;
  void *v28;
  uint64_t v29;
  double v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  void *v38;
  NSString *v39;
  NSObject *v40;
  id v41;
  void *v42;
  uint64_t v43;
  double v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  float v51;
  void *v52;
  void *v53;
  void *v54;
  float v55;
  double v56;
  void *v57;
  NSString *v58;
  NSObject *v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id obj;
  NSObject *obja;
  uint64_t v69;
  uint64_t v70;
  id v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[5];
  _QWORD v82[5];
  _BYTE v83[128];
  _QWORD v84[4];
  _QWORD v85[4];
  uint8_t v86[128];
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  NSString *v94;
  __int16 v95;
  id v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v71 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_playerData, "objectForKeyedSubscript:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("transientData"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("continuousData"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("isAdvanced"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("advancedPlayback"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v72
      || (objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("playbackLastAction")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v8))
    {
      if (kHMETScope)
      {
        v12 = *(id *)kHMETScope;
        if (!v12)
          goto LABEL_79;
      }
      else
      {
        v12 = MEMORY[0x1E0C81028];
        v17 = MEMORY[0x1E0C81028];
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        goto LABEL_78;
      *(_DWORD *)buf = 136315650;
      v88 = "CHMetrics.mm";
      v89 = 1024;
      v90 = 530;
      v91 = 2080;
      v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
      v18 = "%25s:%-5d %s: skipping metrics - no advanced playback actions recorded";
      goto LABEL_77;
    }
    objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("firstStartTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    if (v11 > a4)
    {
      if (kHMETScope)
      {
        v12 = *(id *)kHMETScope;
        if (!v12)
          goto LABEL_79;
      }
      else
      {
        v12 = MEMORY[0x1E0C81028];
        v62 = MEMORY[0x1E0C81028];
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        goto LABEL_78;
      *(_DWORD *)buf = 136315650;
      v88 = "CHMetrics.mm";
      v89 = 1024;
      v90 = 534;
      v91 = 2080;
      v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
      v18 = "%25s:%-5d %s: skipping metrics - first start time > end time";
LABEL_77:
      _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEBUG, v18, buf, 0x1Cu);
      goto LABEL_78;
    }
    -[CHMetrics getLoopsForAdvancedPlayer:endTime:](self, "getLoopsForAdvancedPlayer:endTime:", v66, a4);
    v21 = v20;
    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("advancedPlayback"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHMetrics resetAdvancedPlaybackData:](self, "resetAdvancedPlaybackData:", v22);
  }
  else
  {
    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("playback"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v72
      || (objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("playbackLastAction")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          !v13))
    {
      if (kHMETScope)
      {
        v12 = *(id *)kHMETScope;
        if (!v12)
          goto LABEL_79;
      }
      else
      {
        v12 = MEMORY[0x1E0C81028];
        v19 = MEMORY[0x1E0C81028];
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        goto LABEL_78;
      *(_DWORD *)buf = 136315650;
      v88 = "CHMetrics.mm";
      v89 = 1024;
      v90 = 516;
      v91 = 2080;
      v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
      v18 = "%25s:%-5d %s: skipping metrics - no playback actions recorded";
      goto LABEL_77;
    }
    objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("firstStartTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;

    if (v16 > a4)
    {
      if (kHMETScope)
      {
        v12 = *(id *)kHMETScope;
        if (!v12)
          goto LABEL_79;
      }
      else
      {
        v12 = MEMORY[0x1E0C81028];
        v63 = MEMORY[0x1E0C81028];
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        goto LABEL_78;
      *(_DWORD *)buf = 136315650;
      v88 = "CHMetrics.mm";
      v89 = 1024;
      v90 = 520;
      v91 = 2080;
      v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
      v18 = "%25s:%-5d %s: skipping metrics - first start time > end time";
      goto LABEL_77;
    }
    -[CHMetrics getLoopsForPlayer:endTime:](self, "getLoopsForPlayer:endTime:", v66, a4);
    v21 = v23;
    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("playback"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHMetrics resetPlaybackData:](self, "resetPlaybackData:", v22);
  }

  if (!kHMETScope)
  {
    v24 = (id)MEMORY[0x1E0C81028];
    v25 = MEMORY[0x1E0C81028];
    goto LABEL_32;
  }
  v24 = *(id *)kHMETScope;
  if (v24)
  {
LABEL_32:
    v26 = v24;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      engineID = self->_engineID;
      v88 = "CHMetrics.mm";
      v89 = 1024;
      v90 = 541;
      v91 = 2080;
      *(_DWORD *)buf = 136316674;
      v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
      v93 = 2112;
      v94 = engineID;
      v95 = 2112;
      v96 = v71;
      v97 = 2048;
      v98 = objc_msgSend(v65, "count");
      v99 = 2048;
      v100 = objc_msgSend(v64, "count");
      _os_log_impl(&dword_1B573F000, v26, OS_LOG_TYPE_INFO, "%25s:%-5d %s: sending metrics for engine %@ player %@ - %lu transient, %lu continuous", buf, 0x44u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSPI);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v65, "count"))
    goto LABEL_53;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v65, "allValues");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v28;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
  if (!v29)
    goto LABEL_52;
  v69 = *(_QWORD *)v78;
  v30 = fmax(v21, 1.0);
  do
  {
    for (i = 0; i != v29; ++i)
    {
      if (*(_QWORD *)v78 != v69)
        objc_enumerationMutation(obj);
      v32 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
      v84[0] = CFSTR("EventType");
      objc_msgSend(v32, "objectForKeyedSubscript:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = v33;
      v84[1] = CFSTR("Intensity");
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Intensity"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v85[1] = v34;
      v84[2] = CFSTR("EventCount");
      v35 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("EventCount"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "floatValue");
      objc_msgSend(v35, "numberWithInt:", (int)(v30 * v37));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v84[3] = CFSTR("SPI");
      v85[2] = v38;
      v85[3] = v72;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 4);
      v39 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (kHMETScope)
      {
        v40 = *(id *)kHMETScope;
        if (!v40)
          goto LABEL_48;
      }
      else
      {
        v40 = MEMORY[0x1E0C81028];
        v41 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v88 = "CHMetrics.mm";
        v89 = 1024;
        v90 = 550;
        v91 = 2080;
        v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
        v93 = 2112;
        v94 = v39;
        _os_log_impl(&dword_1B573F000, v40, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: logging metrics data for HapticTransient : %@", buf, 0x26u);
      }

LABEL_48:
      CAReportingClientSendMessage();
      if (self->_retainDataForTesting)
      {
        v42 = (void *)-[NSString mutableCopy](v39, "mutableCopy");
        -[CHMetrics retainData:forTestingPlayer:](self, "retainData:forTestingPlayer:", v42, v71);

      }
    }
    v28 = obj;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
  }
  while (v29);
LABEL_52:

LABEL_53:
  if (objc_msgSend(v64, "count"))
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    objc_msgSend(v64, "allValues");
    v12 = objc_claimAutoreleasedReturnValue();
    obja = v12;
    v43 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    if (!v43)
      goto LABEL_78;
    v70 = *(_QWORD *)v74;
    v44 = fmax(v21, 1.0);
    while (1)
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v74 != v70)
          objc_enumerationMutation(obja);
        v46 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        v81[0] = CFSTR("EventType");
        objc_msgSend(v46, "objectForKeyedSubscript:");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v82[0] = v47;
        v81[1] = CFSTR("Intensity");
        objc_msgSend(v46, "objectForKeyedSubscript:");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v82[1] = v48;
        v81[2] = CFSTR("EventCount");
        v49 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v46, "objectForKeyedSubscript:");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "floatValue");
        objc_msgSend(v49, "numberWithInt:", (int)(v44 * v51));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v82[2] = v52;
        v81[3] = CFSTR("Duration");
        v53 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v46, "objectForKeyedSubscript:");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "floatValue");
        *(float *)&v56 = v21 * v55;
        objc_msgSend(v53, "numberWithFloat:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v81[4] = CFSTR("SPI");
        v82[3] = v57;
        v82[4] = v72;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 5);
        v58 = (NSString *)objc_claimAutoreleasedReturnValue();

        if (kHMETScope)
        {
          v59 = *(id *)kHMETScope;
          if (!v59)
            goto LABEL_66;
        }
        else
        {
          v59 = MEMORY[0x1E0C81028];
          v60 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v88 = "CHMetrics.mm";
          v89 = 1024;
          v90 = 565;
          v91 = 2080;
          v92 = "-[CHMetrics sendDetailedMetricsForPlayerID:endTime:]";
          v93 = 2112;
          v94 = v58;
          _os_log_impl(&dword_1B573F000, v59, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: logging metrics data for HapticContinuous : %@", buf, 0x26u);
        }

LABEL_66:
        CAReportingClientSendMessage();
        if (self->_retainDataForTesting)
        {
          v61 = (void *)-[NSString mutableCopy](v58, "mutableCopy");
          -[CHMetrics retainData:forTestingPlayer:](self, "retainData:forTestingPlayer:", v61, v71);

        }
      }
      v12 = obja;
      v43 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      if (!v43)
      {
LABEL_78:

        break;
      }
    }
  }
LABEL_79:

}

- (void)prepareData:(id)a3 events:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  float v36;
  uint64_t v37;
  _BOOL4 v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  float v42;
  unint64_t v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  float v48;
  float v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  float v59;
  unint64_t v60;
  double v61;
  void *v62;
  uint64_t v63;
  double v64;
  void *v65;
  NSObject *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *__p;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE buf[12];
  __int16 v86;
  int v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  void *v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v68 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v70 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v7 = v68;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v82 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        if (!objc_msgSend(v11, "eventCategory"))
        {
          v12 = objc_msgSend(v11, "fixedParamCount");
          if (v12 < 1)
          {
            v15 = 0.0;
          }
          else
          {
            v13 = v12 + 1;
            v14 = 16 * v12;
            v15 = 0.0;
            do
            {
              v16 = objc_msgSend(v11, "fixedParams") + v14;
              v17 = *(_QWORD *)(v16 - 16);
              if (v17 == 2012 || v17 == 1012)
                v15 = pow(1.8204, (float)(*(float *)(v16 - 8) * 10.0)) * 0.02;
              --v13;
              v14 -= 16;
            }
            while (v13 > 1);
          }
          objc_msgSend(v6, "doubleValue");
          v19 = v18;
          objc_msgSend(v11, "time");
          v21 = v20;
          objc_msgSend(v11, "duration");
          v23 = v21 + v22;
          v24 = v15;
          if (v19 < v23 + v15)
          {
            v25 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v11, "time");
            v27 = v26;
            objc_msgSend(v11, "duration");
            objc_msgSend(v25, "numberWithDouble:", v27 + v28 + v24);
            v29 = objc_claimAutoreleasedReturnValue();

            v6 = (void *)v29;
          }
          v30 = objc_msgSend(v11, "eventType");
          v78 = 0;
          v79 = 0;
          v80 = 0;
          std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v78, self->_hapticContinuousSustainedIDs.__begin_, (uint64_t)self->_hapticContinuousSustainedIDs.__end_, self->_hapticContinuousSustainedIDs.__end_ - self->_hapticContinuousSustainedIDs.__begin_);
          if (-[CHMetrics isEventType:inList:](self, "isEventType:inList:", v30, &v78))
          {
            v31 = 1;
          }
          else
          {
            v32 = objc_msgSend(v11, "eventType");
            __p = 0;
            v76 = 0;
            v77 = 0;
            std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, self->_hapticContinuousNonsustainedIDs.__begin_, (uint64_t)self->_hapticContinuousNonsustainedIDs.__end_, self->_hapticContinuousNonsustainedIDs.__end_ - self->_hapticContinuousNonsustainedIDs.__begin_);
            v31 = -[CHMetrics isEventType:inList:](self, "isEventType:inList:", v32, &__p);
            if (__p)
            {
              v76 = __p;
              operator delete(__p);
            }
          }
          if (v78)
          {
            v79 = v78;
            operator delete(v78);
          }
          if (v31)
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 0.0;
            while (v35 < objc_msgSend(v11, "fixedParamCount"))
            {
              if (*(_QWORD *)(objc_msgSend(v11, "fixedParams") + v33) == 2000)
              {
                v36 = *(float *)(objc_msgSend(v11, "fixedParams") + v33 + 8);
                v34 = 1;
              }
              ++v35;
              v33 += 16;
            }
            v43 = objc_msgSend(v11, "eventType");
            if ((v34 & 1) != 0)
              *(float *)&v44 = v36;
            else
              *(float *)&v44 = 1.0;
            -[CHMetrics continousDictionary:slot:intensity:](self, "continousDictionary:slot:intensity:", v71, v43 >> 8, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("Duration"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "floatValue");
            v49 = v48;
            objc_msgSend(v11, "duration");
            v51 = v50 + v49 + v24;
            *(float *)&v51 = v51;
            objc_msgSend(v46, "numberWithFloat:", v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v52, CFSTR("Duration"));

            v53 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("EventCount"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "numberWithInteger:", (int)(objc_msgSend(v54, "intValue") + 1));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v55, CFSTR("EventCount"));
          }
          else
          {
            v37 = objc_msgSend(v11, "eventType");
            v72 = 0;
            v73 = 0;
            v74 = 0;
            std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v72, self->_hapticTransientIDs.__begin_, (uint64_t)self->_hapticTransientIDs.__end_, self->_hapticTransientIDs.__end_ - self->_hapticTransientIDs.__begin_);
            v38 = -[CHMetrics isEventType:inList:](self, "isEventType:inList:", v37, &v72);
            if (v72)
            {
              v73 = v72;
              operator delete(v72);
            }
            if (v38)
            {
              v39 = 0;
              v40 = 0;
              v41 = 0;
              v42 = 0.0;
              while (v41 < objc_msgSend(v11, "fixedParamCount"))
              {
                if (*(_QWORD *)(objc_msgSend(v11, "fixedParams") + v39) == 2000)
                {
                  v42 = *(float *)(objc_msgSend(v11, "fixedParams") + v39 + 8);
                  v40 = 1;
                }
                ++v41;
                v39 += 16;
              }
              v60 = objc_msgSend(v11, "eventType");
              if ((v40 & 1) != 0)
                *(float *)&v61 = v42;
              else
                *(float *)&v61 = 1.0;
              -[CHMetrics transientDictionary:index:intensity:](self, "transientDictionary:index:intensity:", v70, v60 >> 8, v61);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("EventCount"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "numberWithInteger:", (int)(objc_msgSend(v54, "intValue") + 1));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "setObject:forKeyedSubscript:", v55, CFSTR("EventCount"));
            }
            else
            {
              *(_QWORD *)buf = objc_msgSend(v11, "eventType");
              if (!std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::find<AVHapticPlayerEventType>(&self->_legacyHapticTransientEventTypeMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)buf))continue;
              v56 = 0;
              v57 = 0;
              v58 = 0;
              v59 = 0.0;
              while (v58 < objc_msgSend(v11, "fixedParamCount"))
              {
                if (*(_QWORD *)(objc_msgSend(v11, "fixedParams") + v56) == 2000)
                {
                  v59 = *(float *)(objc_msgSend(v11, "fixedParams") + v56 + 8);
                  v57 = 1;
                }
                ++v58;
                v56 += 16;
              }
              v63 = objc_msgSend(v11, "eventType");
              if ((v57 & 1) != 0)
                *(float *)&v64 = v59;
              else
                *(float *)&v64 = 1.0;
              -[CHMetrics legacyTransientDictionary:eventType:intensity:](self, "legacyTransientDictionary:eventType:intensity:", v70, v63, v64);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("EventCount"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "numberWithInteger:", (int)(objc_msgSend(v54, "intValue") + 1));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "setObject:forKeyedSubscript:", v55, CFSTR("EventCount"));
            }
          }

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
    }
    while (v8);
  }

  if (kHMETScope)
  {
    v66 = *(id *)kHMETScope;
    if (!v66)
      goto LABEL_65;
  }
  else
  {
    v66 = MEMORY[0x1E0C81028];
    v67 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "CHMetrics.mm";
    v86 = 1024;
    v87 = 795;
    v88 = 2080;
    v89 = "-[CHMetrics prepareData:events:]";
    v90 = 2112;
    v91 = v6;
    _os_log_impl(&dword_1B573F000, v66, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: calculated pattern duration: %@", buf, 0x26u);
  }

LABEL_65:
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v71, CFSTR("continuousData"));
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v70, CFSTR("transientData"));
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v6, CFSTR("patternDuration"));

}

- (BOOL)isEventType:(unint64_t)a3 inList:(vector<unsigned)long
{
  unint64_t *begin;
  unint64_t *end;

  begin = a4->__begin_;
  end = a4->__end_;
  if (a4->__begin_ != end)
  {
    while (*begin != a3)
    {
      if (++begin == end)
      {
        begin = a4->__end_;
        return begin != end;
      }
    }
  }
  return begin != end;
}

- (id)transientDictionary:(id)a3 index:(unint64_t)a4 intensity:(float)a5
{
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  -[CHMetrics transientSharpnessIndexKeyFromIndexValue:](self, "transientSharpnessIndexKeyFromIndexValue:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a5;
  -[CHMetrics intensityBinKeyFromValue:](self, "intensityBinKeyFromValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("EventType"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("Intensity"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E6969898, CFSTR("EventCount"));
    objc_msgSend(v8, "setObject:forKey:", v13, v12);
  }

  return v13;
}

- (id)transientSharpnessIndexKeyFromIndexValue:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SharpnessIndex%lu"), a3);
}

- (void)preparePlaybackData:(id)a3 events:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSString *engineID;
  id v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (kHMETScope)
  {
    v8 = *(id *)kHMETScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    v13 = 136316162;
    v14 = "CHMetrics.mm";
    v15 = 1024;
    v16 = 805;
    v17 = 2080;
    v18 = "-[CHMetrics preparePlaybackData:events:]";
    v19 = 2112;
    v20 = engineID;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: preparing playback data for engine %@ player %@", (uint8_t *)&v13, 0x30u);
  }

LABEL_8:
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("isAdvanced"));
  -[CHMetrics prepareData:events:](self, "prepareData:events:", v11, v7);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("playback"));
  -[CHMetrics resetPlaybackData:](self, "resetPlaybackData:", v12);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_playerData, "setObject:forKeyedSubscript:", v11, v6);

}

- (void)resetPlaybackData:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E6969860, CFSTR("playbackDuration"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("playbackLastAction"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("edgeCase"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E6969870, CFSTR("firstStartTime"));

}

- (id)intensityBinKeyFromValue:(float)a3
{
  if (self->_CHMetricsIntensityBin1To2Value > a3)
    return CFSTR("IntensityBin1");
  if (self->_CHMetricsIntensityBin2To3Value <= a3)
    return CFSTR("IntensityBin3");
  return CFSTR("IntensityBin2");
}

void __44__CHMetrics_handleFinishedForPlayersAtTime___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = WeakRetained[20];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          v8 = *(double *)(a1 + 40);
          *(float *)&v8 = v8;
          objc_msgSend(v3, "sendDetailedMetricsForPlayerID:endTime:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), v8, (_QWORD)v9);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  NSString *engineID;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_sessionIsShared && self->_reporterID >= 2)
    CAReportingClientDestroyReporterID();
  if (kHMETScope)
  {
    v3 = *(id *)kHMETScope;
    if (!v3)
      goto LABEL_11;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    *(_DWORD *)buf = 136315906;
    v8 = "CHMetrics.mm";
    v9 = 1024;
    v10 = 206;
    v11 = 2080;
    v12 = "-[CHMetrics dealloc]";
    v13 = 2112;
    v14 = engineID;
    _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: deallocating metrics for engine %@", buf, 0x26u);
  }

LABEL_11:
  v6.receiver = self;
  v6.super_class = (Class)CHMetrics;
  -[CHMetrics dealloc](&v6, sel_dealloc);
}

- (void)handleParamCurveEncountered
{
  const __CFString *v2;

  if (self->_isSPI)
    v2 = CFSTR("initParameterCurve_SPI");
  else
    v2 = CFSTR("initParameterCurve");
  -[CHMetrics logMetric:value:](self, "logMetric:value:", v2, &unk_1E6969880);
}

- (void)logPatternLibraryMetric:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[3];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    if (kHMETScope)
    {
      v6 = *(id *)kHMETScope;
      if (!v6)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSPI, CFSTR("patternID"), CFSTR("Count"), CFSTR("SPI"), v5, &unk_1E6969880);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        CAReportingClientSendMessage();
        goto LABEL_11;
      }
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v13 = "CHMetrics.mm";
      v14 = 1024;
      v15 = 489;
      v16 = 2080;
      v17 = "-[CHMetrics logPatternLibraryMetric:]";
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: logging metrics for pattern library \"%@\", buf, 0x26u);
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (void)markAdvancedPlaybackAction:(id)a3 action:(int64_t)a4 time:(float)a5
{
  double v8;
  NSObject *v9;
  id v10;
  NSString *engineID;
  double v12;
  double v13;
  void *v14;
  void *v15;
  PlaybackAction *v16;
  void *v17;
  char v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  _BOOL4 v23;
  double v24;
  void *v25;
  float v26;
  id v27;
  NSObject *v28;
  float v29;
  float v30;
  id v31;
  double v32;
  id v33;
  NSObject *v34;
  float v35;
  id v36;
  id v37;
  NSObject *v38;
  float v39;
  void *v40;
  void *v41;
  float v42;
  double v43;
  void *v44;
  double v45;
  int v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = COERCE_DOUBLE(a3);
  if (kHMETScope)
  {
    v9 = *(id *)kHMETScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    v46 = 136316418;
    v47 = "CHMetrics.mm";
    v48 = 1024;
    v49 = 639;
    v50 = 2080;
    v51 = "-[CHMetrics markAdvancedPlaybackAction:action:time:]";
    v52 = 2048;
    v53 = *(double *)&a4;
    v54 = 2112;
    v55 = *(double *)&engineID;
    v56 = 2112;
    v57 = v8;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: marking advanced action %ld for engine %@ player %@", (uint8_t *)&v46, 0x3Au);
  }

LABEL_8:
  +[CHMetrics currentTime](CHMetrics, "currentTime");
  if (v12 > a5)
  {
    +[CHMetrics currentTime](CHMetrics, "currentTime");
    a5 = v13;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_playerData, "objectForKeyedSubscript:", *(_QWORD *)&v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("advancedPlayback"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("playbackLastAction"));
  v16 = (PlaybackAction *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("edgeCase"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if ((v18 & 1) == 0)
  {
    if (*(double *)&a4 != 0.0)
      goto LABEL_17;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("firstStartTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    if (v20 < 0.0)
    {

    }
    else
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("firstStartTime"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      v23 = a5 < v22;

      if (!v23)
      {
LABEL_17:
        if (v16)
        {
          -[PlaybackAction time](v16, "time");
          if (a5 < v26)
          {
            if (kHMETScope)
            {
              v27 = *(id *)kHMETScope;
              if (!v27)
              {
LABEL_36:
                objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E6969880, CFSTR("edgeCase"));
                goto LABEL_46;
              }
            }
            else
            {
              v27 = (id)MEMORY[0x1E0C81028];
              v33 = MEMORY[0x1E0C81028];
            }
            v34 = v27;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              -[PlaybackAction time](v16, "time");
              v46 = 136316162;
              v47 = "CHMetrics.mm";
              v48 = 1024;
              v49 = 675;
              v50 = 2080;
              v51 = "-[CHMetrics markAdvancedPlaybackAction:action:time:]";
              v52 = 2048;
              v53 = a5;
              v54 = 2048;
              v55 = v35;
              _os_log_impl(&dword_1B573F000, v34, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: edge case: action time out of order %g < %g", (uint8_t *)&v46, 0x30u);
            }

            goto LABEL_36;
          }
          v29 = 0.0;
          if (-[PlaybackAction action](v16, "action") == 1 && (a4 | 2) == 2)
          {
            -[PlaybackAction time](v16, "time");
            v29 = a5 - v30;
            if (kHMETScope)
            {
              v31 = *(id *)kHMETScope;
              if (!v31)
                goto LABEL_45;
            }
            else
            {
              v31 = (id)MEMORY[0x1E0C81028];
              v37 = MEMORY[0x1E0C81028];
            }
            v38 = v31;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              -[PlaybackAction time](v16, "time");
              v46 = 136316418;
              v47 = "CHMetrics.mm";
              v48 = 1024;
              v49 = 683;
              v50 = 2080;
              v51 = "-[CHMetrics markAdvancedPlaybackAction:action:time:]";
              v52 = 2048;
              v53 = v29;
              v54 = 2048;
              v55 = a5;
              v56 = 2048;
              v57 = v39;
              _os_log_impl(&dword_1B573F000, v38, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: paused duration: %g = %g - %g", (uint8_t *)&v46, 0x3Au);
            }

          }
        }
        else
        {
          v16 = objc_alloc_init(PlaybackAction);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("playbackLastAction"));
          if (*(double *)&a4 != 0.0)
          {
            if (kHMETScope)
            {
              v28 = *(id *)kHMETScope;
              if (!v28)
                goto LABEL_36;
            }
            else
            {
              v28 = MEMORY[0x1E0C81028];
              v36 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              v46 = 136315650;
              v47 = "CHMetrics.mm";
              v48 = 1024;
              v49 = 667;
              v50 = 2080;
              v51 = "-[CHMetrics markAdvancedPlaybackAction:action:time:]";
              _os_log_impl(&dword_1B573F000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: edge case: did not see startAtTime as first call", (uint8_t *)&v46, 0x1Cu);
            }

            goto LABEL_36;
          }
          -[PlaybackAction setAction:](v16, "setAction:", 0);
          v29 = 0.0;
          *(float *)&v32 = a5;
          -[PlaybackAction setTime:](v16, "setTime:", v32);
        }
LABEL_45:
        v40 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("pausedDuration"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "floatValue");
        *(float *)&v43 = v29 + v42;
        objc_msgSend(v40, "numberWithFloat:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v44, CFSTR("pausedDuration"));

        -[PlaybackAction setAction:](v16, "setAction:", a4);
        *(float *)&v45 = a5;
        -[PlaybackAction setTime:](v16, "setTime:", v45);
        goto LABEL_46;
      }
    }
    *(float *)&v24 = a5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, CFSTR("firstStartTime"));

    goto LABEL_17;
  }
LABEL_46:

}

- (void)resetAdvancedPlaybackData:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E6969860, CFSTR("pausedDuration"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("playbackLastAction"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("edgeCase"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E6969870, CFSTR("firstStartTime"));

}

- (void)prepareAdvancedPlaybackData:(id)a3 events:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSString *engineID;
  id v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (kHMETScope)
  {
    v8 = *(id *)kHMETScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    v13 = 136316162;
    v14 = "CHMetrics.mm";
    v15 = 1024;
    v16 = 817;
    v17 = 2080;
    v18 = "-[CHMetrics prepareAdvancedPlaybackData:events:]";
    v19 = 2112;
    v20 = engineID;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: preparing advanced playback data for engine %@ player %@", (uint8_t *)&v13, 0x30u);
  }

LABEL_8:
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isAdvanced"));
  -[CHMetrics prepareData:events:](self, "prepareData:events:", v11, v7);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("advancedPlayback"));
  -[CHMetrics resetAdvancedPlaybackData:](self, "resetAdvancedPlaybackData:", v12);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_playerData, "setObject:forKeyedSubscript:", v11, v6);

}

- (void)removePlaybackData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSString *engineID;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHMETScope)
  {
    v5 = *(id *)kHMETScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    v8 = 136316162;
    v9 = "CHMetrics.mm";
    v10 = 1024;
    v11 = 829;
    v12 = 2080;
    v13 = "-[CHMetrics removePlaybackData:]";
    v14 = 2112;
    v15 = engineID;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: removing playback data for engine %@ player %@", (uint8_t *)&v8, 0x30u);
  }

LABEL_8:
  -[NSMutableDictionary removeObjectForKey:](self->_playerData, "removeObjectForKey:", v4);

}

- (float)getLoopsForAdvancedPlayer:(id)a3 endTime:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  id v24;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("advancedPlayback"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("edgeCase"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    if (kHMETScope)
    {
      v9 = *(id *)kHMETScope;
      if (!v9)
      {
LABEL_14:
        v23 = 1.0;
        goto LABEL_15;
      }
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v24 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136315650;
      v27 = "CHMetrics.mm";
      v28 = 1024;
      v29 = 871;
      v30 = 2080;
      v31 = "-[CHMetrics getLoopsForAdvancedPlayer:endTime:]";
      _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: edge case - no loop multiplier, log once", (uint8_t *)&v26, 0x1Cu);
    }

    goto LABEL_14;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstStartTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("patternDuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pausedDuration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playbackLastAction"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "action") == 3 && (objc_msgSend(v19, "time"), v20 < a4))
  {
    objc_msgSend(v19, "time");
    v22 = (float)(v21 - v12) - v18;
  }
  else
  {
    v22 = a4 - v12 - v18;
  }
  v23 = v22 / v15;

LABEL_15:
  return v23;
}

- (id)continousDictionary:(id)a3 slot:(unint64_t)a4 intensity:(float)a5
{
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  -[CHMetrics continuousSharpnessSlotKeyFromSlotValue:](self, "continuousSharpnessSlotKeyFromSlotValue:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a5;
  -[CHMetrics intensityBinKeyFromValue:](self, "intensityBinKeyFromValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("EventType"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("Intensity"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E6969860, CFSTR("Duration"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E6969898, CFSTR("EventCount"));
    objc_msgSend(v8, "setObject:forKey:", v13, v12);
  }

  return v13;
}

- (id)continuousSharpnessSlotKeyFromSlotValue:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SharpnessSlot%lu"), a3);
}

- (id)legacyTransientDictionary:(id)a3 eventType:(unint64_t)a4 intensity:(float)a5
{
  id v8;
  _QWORD *v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v16;

  v8 = a3;
  v16 = a4;
  v9 = std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::find<AVHapticPlayerEventType>(&self->_legacyHapticTransientEventTypeMap.__table_.__bucket_list_.__ptr_.__value_, &v16);
  if (!v9)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  v10 = (id)v9[3];
  *(float *)&v11 = a5;
  -[CHMetrics intensityBinKeyFromValue:](self, "intensityBinKeyFromValue:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("EventType"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("Intensity"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E6969898, CFSTR("EventCount"));
    objc_msgSend(v8, "setObject:forKey:", v14, v13);
  }

  return v14;
}

- (void)setMetricsTestModeEnabled
{
  NSObject *v3;
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *dataForTesting;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (kHMETScope)
  {
    v3 = *(id *)kHMETScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315650;
    v8 = "CHMetrics.mm";
    v9 = 1024;
    v10 = 992;
    v11 = 2080;
    v12 = "-[CHMetrics setMetricsTestModeEnabled]";
    _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: test mode ENABLED", (uint8_t *)&v7, 0x1Cu);
  }

LABEL_8:
  self->_retainDataForTesting = 1;
  if (!self->_dataForTesting)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dataForTesting = self->_dataForTesting;
    self->_dataForTesting = v5;

  }
}

- (id)getMetricsForPlayer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSString *engineID;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHMETScope)
  {
    v5 = *(id *)kHMETScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    v11 = 136316162;
    v12 = "CHMetrics.mm";
    v13 = 1024;
    v14 = 1001;
    v15 = 2080;
    v16 = "-[CHMetrics getMetricsForPlayer:]";
    v17 = 2112;
    v18 = engineID;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: retrieving metrics for engine %@ player %@", (uint8_t *)&v11, 0x30u);
  }

LABEL_8:
  -[CHMetrics getIDForPlayer:](self, "getIDForPlayer:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForTesting, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)retainData:(id)a3 forTestingPlayer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (kHMETScope)
  {
    v8 = *(id *)kHMETScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v52 = "CHMetrics.mm";
    v53 = 1024;
    v54 = 1009;
    v55 = 2080;
    v56 = "-[CHMetrics retainData:forTestingPlayer:]";
    v57 = 2112;
    v58 = v7;
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s: adding test player data for player %@", buf, 0x26u);
  }

LABEL_8:
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForTesting, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataForTesting, "setObject:forKeyedSubscript:", v12, v7);

  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EventType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Intensity"));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForTesting, "objectForKeyedSubscript:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = v18 == 0;

  if ((v15 & 1) != 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForTesting, "objectForKeyedSubscript:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forKey:", v6, v16);
    goto LABEL_29;
  }
  if (kHMETScope)
  {
    v19 = *(id *)kHMETScope;
    if (!v19)
      goto LABEL_19;
  }
  else
  {
    v19 = (id)MEMORY[0x1E0C81028];
    v21 = MEMORY[0x1E0C81028];
  }
  v22 = v19;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForTesting, "objectForKeyedSubscript:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v52 = "CHMetrics.mm";
    v53 = 1024;
    v54 = 1016;
    v55 = 2080;
    v56 = "-[CHMetrics retainData:forTestingPlayer:]";
    v57 = 2112;
    v58 = v24;
    _os_log_impl(&dword_1B573F000, v22, OS_LOG_TYPE_INFO, "%25s:%-5d %s: %@", buf, 0x26u);

  }
LABEL_19:
  if (!kHMETScope)
  {
    v25 = MEMORY[0x1E0C81028];
    v26 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  v25 = *(id *)kHMETScope;
  if (v25)
  {
LABEL_23:
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v52 = "CHMetrics.mm";
      v53 = 1024;
      v54 = 1017;
      v55 = 2080;
      v56 = "-[CHMetrics retainData:forTestingPlayer:]";
      v57 = 2112;
      v58 = v6;
      _os_log_impl(&dword_1B573F000, v25, OS_LOG_TYPE_INFO, "%25s:%-5d %s: %@", buf, 0x26u);
    }

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForTesting, "objectForKeyedSubscript:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Duration"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29 == 0;

  if (!v30)
  {
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForTesting, "objectForKeyedSubscript:", v7);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKeyedSubscript:", v16);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Duration"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "floatValue");
    v35 = v34;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Duration"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    *(float *)&v38 = v35 + v37;
    objc_msgSend(v31, "numberWithFloat:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForTesting, "objectForKeyedSubscript:", v7);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", v16);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v39, CFSTR("Duration"));

  }
  v42 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForTesting, "objectForKeyedSubscript:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v16);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("EventCount"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "intValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EventCount"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "numberWithInt:", objc_msgSend(v46, "intValue") + v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataForTesting, "objectForKeyedSubscript:", v7);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKeyedSubscript:", v16);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setObject:forKeyedSubscript:", v47, CFSTR("EventCount"));

LABEL_29:
}

- (void).cxx_destruct
{
  unint64_t *begin;
  unint64_t *v4;
  unint64_t *v5;

  objc_storeStrong((id *)&self->_dataForTesting, 0);
  objc_storeStrong((id *)&self->_patternLibraryData, 0);
  objc_storeStrong((id *)&self->_playerData, 0);
  std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::~__hash_table((uint64_t)&self->_legacyHapticTransientEventTypeMap);
  begin = self->_hapticContinuousNonsustainedIDs.__begin_;
  if (begin)
  {
    self->_hapticContinuousNonsustainedIDs.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_hapticContinuousSustainedIDs.__begin_;
  if (v4)
  {
    self->_hapticContinuousSustainedIDs.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_hapticTransientIDs.__begin_;
  if (v5)
  {
    self->_hapticTransientIDs.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_engineID, 0);
}

@end
