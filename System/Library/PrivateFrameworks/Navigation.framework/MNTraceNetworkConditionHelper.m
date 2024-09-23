@implementation MNTraceNetworkConditionHelper

+ (id)getCurrentState
{
  MNTraceNetworkEvent *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MNTraceNetworkEvent);
  -[MNTraceNetworkEvent setWifiEnabled:](v3, "setWifiEnabled:", objc_msgSend(a1, "isWiFiEnabled"));
  -[MNTraceNetworkEvent setCellEnabled:](v3, "setCellEnabled:", objc_msgSend(a1, "isCellDataEnabled"));
  objc_msgSend(a1, "activeNLCProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTraceNetworkEvent setNlcProfile:](v3, "setNlcProfile:", v4);

  -[MNTraceNetworkEvent nlcProfile](v3, "nlcProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTraceNetworkEvent setNlcEnabled:](v3, "setNlcEnabled:", objc_msgSend(v5, "length") != 0);

  return v3;
}

+ (BOOL)setCurrentState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  char v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(a1, "setWiFiEnabled:", objc_msgSend(v4, "wifiEnabled"));
    v7 = v6 & objc_msgSend(a1, "setCellDataEnabled:", objc_msgSend(v5, "cellEnabled"));
    if (objc_msgSend(v5, "nlcEnabled")
      && (objc_msgSend(v5, "nlcProfile"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "length"),
          v8,
          v9))
    {
      objc_msgSend(v5, "nlcProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(a1, "enableNLC:", v10);

    }
    else
    {
      v11 = objc_msgSend(a1, "disableNLC");
    }
    v12 = v7 & v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)setWiFiEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[16];
  Class (*v22)(uint64_t);
  void *v23;
  void **v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  if (!qword_1ED0C40D0)
  {
    *(_OWORD *)buf = xmmword_1E61D7C68;
    v22 = 0;
    qword_1ED0C40D0 = _sl_dlopen();
    if (!qword_1ED0C40D0)
    {
      v16 = (void *)abort_report_np();
      __break(1u);
      free(v16);
    }
  }
  CoreAutomationDeviceLibrary();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v4 = (void *)_MergedGlobals_43;
  v20 = _MergedGlobals_43;
  if (!_MergedGlobals_43)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    v22 = __getCAMDEmbeddedDeviceServiceClass_block_invoke;
    v23 = &unk_1E61D36B0;
    v24 = &v17;
    __getCAMDEmbeddedDeviceServiceClass_block_invoke((uint64_t)buf);
    v4 = v18[3];
  }
  v5 = v4;
  _Block_object_dispose(&v17, 8);
  v6 = (void *)objc_msgSend(objc_alloc((Class)v5), "initAsMobile");
  objc_msgSend(v6, "setDirectInvocations:", 0);
  objc_msgSend(v6, "start");
  objc_msgSend(v6, "WiFi");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
    objc_msgSend(v7, "on");
  else
    objc_msgSend(v7, "off");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  GEOFindOrCreateLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "Unable to change WiFi state: %@", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14 = "OFF";
    if (v3)
      v14 = "ON";
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v14;
    _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_INFO, "WiFi power set to %s", buf, 0xCu);
  }

  return v10 == 0;
}

+ (BOOL)isWiFiEnabled
{
  void *v2;
  id v3;
  id v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  CoreWiFiLibrary();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getCWFInterfaceClass_softClass;
  v11 = getCWFInterfaceClass_softClass;
  if (!getCWFInterfaceClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getCWFInterfaceClass_block_invoke;
    v7[3] = &unk_1E61D36B0;
    v7[4] = &v8;
    __getCWFInterfaceClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = v2;
  _Block_object_dispose(&v8, 8);
  v4 = objc_alloc_init((Class)v3);
  objc_msgSend(v4, "activate");
  v5 = objc_msgSend(v4, "powerOn");
  objc_msgSend(v4, "invalidate");

  return v5;
}

+ (BOOL)setCellDataEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t IsEnabled;
  char *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  ctConnection();
  IsEnabled = _CTServerConnectionSetCellularDataIsEnabled();
  errorFromCTError(IsEnabled);
  v5 = (char *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v5;
      v8 = "Couldn't set cell data state: %@";
      v9 = v7;
      v10 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_1B0AD7000, v9, v10, v8, (uint8_t *)&v13, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = "dis";
    if (v3)
      v11 = "en";
    v13 = 136315138;
    v14 = v11;
    v8 = "Cell Data %sabled";
    v9 = v7;
    v10 = OS_LOG_TYPE_INFO;
    goto LABEL_8;
  }

  return v5 == 0;
}

+ (BOOL)isCellDataEnabled
{
  uint64_t IsEnabled;
  void *v3;
  NSObject *v4;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ctConnection();
  IsEnabled = _CTServerConnectionGetCellularDataIsEnabled();
  errorFromCTError(IsEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "Couldn't get cell data state: %@", buf, 0xCu);
    }

  }
  return 0;
}

+ (BOOL)deviceSupportsCellularData
{
  return MGGetBoolAnswer();
}

+ (BOOL)hasActiveNetworkConditionInducer
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  ConditionInducerLibrary();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v2 = (void *)getCOConditionSessionClass_softClass;
  v19 = getCOConditionSessionClass_softClass;
  if (!getCOConditionSessionClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getCOConditionSessionClass_block_invoke;
    v15[3] = &unk_1E61D36B0;
    v15[4] = &v16;
    __getCOConditionSessionClass_block_invoke((uint64_t)v15);
    v2 = (void *)v17[3];
  }
  v3 = v2;
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v3, "getActiveConditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "containsString:", CFSTR("SlowNetwork")) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

+ (BOOL)enableNLC:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  unsigned int v16;
  BOOL v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  unsigned int v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  int v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  int v36;
  int started;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  double v41;
  unint64_t v42;
  const char *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint32_t v46;
  NSObject *v47;
  uint64_t v50;
  int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[108];
  uint8_t buf[4];
  id v60;
  __int128 v61;
  __int128 v62;
  _OWORD v63[2];
  __int128 v64;
  __int128 v65;
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(a1, "hasActiveNetworkConditionInducer") & 1) == 0)
  {
    objc_msgSend(a1, "getNLCProfile:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      v5 = 0;
LABEL_46:

      goto LABEL_47;
    }
    memset(v58, 0, sizeof(v58));
    v57 = 0u;
    v56 = 0u;
    v55 = 0u;
    v54 = 0u;
    v53 = 0u;
    v52 = 0u;
    v51 = 21;
    v66 = 0;
    v64 = 0u;
    v65 = 0u;
    memset(v63, 0, sizeof(v63));
    v61 = 0u;
    v62 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DownlinkBandwidth"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DownlinkBandwidthUnit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DownlinkPacketLossRatio"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13 / 100.0;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DownlinkDelay"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntValue");

    if (!v9 && (v14 == 0.0 ? (v17 = v16 == 0) : (v17 = 0), v17))
    {
      v18 = 5;
    }
    else
    {
      LODWORD(v61) = 9;
      *(_QWORD *)&v64 = __PAIR64__(v11, v9);
      *((_QWORD *)&v64 + 1) = __PAIR64__(v16, LODWORD(v14));
      v65 = 0uLL;
      v18 = 13;
      v66 = 0;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UplinkBandwidth"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UplinkBandwidthUnit"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UplinkPacketLossRatio"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    v25 = v24 / 100.0;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UplinkDelay"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedIntValue");

    if (v20 || (v25 == 0.0 ? (v28 = v27 == 0) : (v28 = 0), !v28))
    {
      LODWORD(v61) = v18;
      HIDWORD(v62) = v20;
      *(_QWORD *)&v63[0] = __PAIR64__(LODWORD(v25), v22);
      memset((char *)v63 + 12, 0, 20);
      DWORD2(v63[0]) = v27;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RunOnInterface"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "length"))
    {
      objc_msgSend(objc_retainAutorelease(v29), "cStringUsingEncoding:", 1);
      __strlcpy_chk();
      LODWORD(v61) = v61 | 1;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ProtocolFamily"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    DWORD1(v61) = objc_msgSend(v30, "unsignedIntValue");

    if (DWORD1(v61))
      LODWORD(v61) = v61 | 1;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ExcludeLoopback"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    DWORD2(v61) = objc_msgSend(v31, "unsignedIntValue");

    if ((v61 & 1) != 0)
    {
      *(_OWORD *)&v58[56] = v63[1];
      *(_OWORD *)&v58[72] = v64;
      *(_OWORD *)&v58[88] = v65;
      *(_DWORD *)&v58[104] = v66;
      *(_OWORD *)&v58[8] = v61;
      *(_OWORD *)&v58[24] = v62;
      *(_OWORD *)&v58[40] = v63[0];
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DNSDelayValue"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "unsignedIntValue");

    if (v33)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ExcludeLoopback"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "unsignedIntValue");

      *(_QWORD *)((char *)&v52 + 4) = 6;
      HIDWORD(v52) = v35;
      v53 = 0uLL;
      *(_QWORD *)&v54 = 0;
      DWORD2(v54) = 0;
      HIDWORD(v54) = v33;
      *(_QWORD *)&v55 = 0;
      *((_QWORD *)&v55 + 1) = 0x3500000011;
      v56 = 0u;
      v57 = 0u;
      *(_QWORD *)v58 = 0;
    }
    v50 = 0;
    v36 = _nlc_connect(&v50);
    v5 = v36 == 1;
    if (v36 == 1)
    {
      started = _nlc_start_simulation((mach_port_name_t *)&v50, (__int128 *)&v51);
      if (started != 1)
      {
        GEOFindOrCreateLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B0AD7000, v38, OS_LOG_TYPE_ERROR, "_nlc_start_simulation failed", buf, 2u);
        }

      }
      if (_nlc_disconnect((int *)&v50) != 1)
      {
        GEOFindOrCreateLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B0AD7000, v39, OS_LOG_TYPE_ERROR, "_nlc_disconnect failed", buf, 2u);
        }

      }
      if (started != 1)
      {
        v5 = 0;
        goto LABEL_45;
      }
      _CFPreferencesSetValueWithContainer();
      _CFPreferencesSetValueWithContainer();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "timeIntervalSince1970");
      v42 = (unint64_t)v41;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v42);
      _CFPreferencesSetValueWithContainer();
      CFPreferencesAppSynchronize(CFSTR("com.apple.network.prefPaneSimulate"));
      GEOFindOrCreateLog();
      v47 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
LABEL_43:

LABEL_45:
        goto LABEL_46;
      }
      *(_DWORD *)buf = 138412290;
      v60 = v4;
      v43 = "Network Link Conditioner set to \"%@\";
      v44 = v47;
      v45 = OS_LOG_TYPE_INFO;
      v46 = 12;
    }
    else
    {
      GEOFindOrCreateLog();
      v47 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        goto LABEL_43;
      *(_WORD *)buf = 0;
      v43 = "_nlc_connect failed";
      v44 = v47;
      v45 = OS_LOG_TYPE_ERROR;
      v46 = 2;
    }
    _os_log_impl(&dword_1B0AD7000, v44, v45, v43, buf, v46);
    goto LABEL_43;
  }
  v5 = 0;
LABEL_47:

  return v5;
}

+ (BOOL)disableNLC
{
  int v2;
  BOOL v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  uint8_t v13[8];
  uint64_t v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _DWORD v27[7];

  memset(v27, 0, sizeof(v27));
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 21;
  v14 = 0;
  v2 = _nlc_connect(&v14);
  v3 = v2 == 1;
  if (v2 != 1)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)v13 = 0;
    v7 = "_nlc_connect failed";
    v8 = v10;
    v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_16;
  }
  v4 = _nlc_stop_simulation((mach_port_name_t *)&v14, (__int128 *)&v15);
  if (v4 != 1)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "_nlc_stop_simulation failed", v13, 2u);
    }

  }
  if (_nlc_disconnect((int *)&v14) != 1)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "_nlc_disconnect failed", v13, 2u);
    }

  }
  if (v4 != 1)
    return 0;
  _CFPreferencesSetValueWithContainer();
  GEOFindOrCreateLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    v7 = "Network Link Conditioner disabled";
    v8 = v10;
    v9 = OS_LOG_TYPE_INFO;
LABEL_16:
    _os_log_impl(&dword_1B0AD7000, v8, v9, v7, v13, 2u);
  }
LABEL_17:

  return v3;
}

+ (id)activeNLCProfile
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  void *v13;
  id v14;

  v2 = (void *)_CFPreferencesCopyValueWithContainer();
  v3 = (void *)_CFPreferencesCopyValueWithContainer();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = (void *)_CFPreferencesCopyValueWithContainer();
  v6 = (double)objc_msgSend(v5, "longValue");

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemUptime");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  v12 = v11 - v6 <= v9;

  if ((v12 & v4) != 0)
    v13 = v2;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

+ (id)nlcProfiles
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)_CFPreferencesCopyValueWithContainer();
  if (!objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", CFSTR("/Developer/Library/PreferenceBundles/Developer Settings.bundle/com.apple.network.prefPaneSimulate.plist"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Profiles"));
    v4 = objc_claimAutoreleasedReturnValue();

    _CFPreferencesSetValueWithContainer();
    v2 = (void *)v4;
  }
  return v2;
}

+ (id)availableNLCProfiles
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "nlcProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)getNLCProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "nlcProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
