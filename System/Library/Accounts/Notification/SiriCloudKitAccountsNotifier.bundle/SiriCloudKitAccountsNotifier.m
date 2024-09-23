id AFLogDirectory()
{
  void *v0;
  void *v1;

  MEMORY[0x2348CAE5C]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("/Library/Logs/CrashReporter/Assistant/"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AFSpeechLogsDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  AFLogDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("SpeechLogs"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v3 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, 0, &v7);
  v4 = v7;

  if ((v3 & 1) == 0)
  {
    v5 = AFSiriLogContextSpeech;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v9 = "AFSpeechLogsDirectory";
      v10 = 2114;
      v11 = v1;
      v12 = 2114;
      v13 = v4;
      _os_log_error_impl(&dword_230F65000, v5, OS_LOG_TYPE_ERROR, "%s Couldn't create speech log directory at path %{public}@ %{public}@", buf, 0x20u);
    }
  }

  return v1;
}

id AFAnalyticsLogsDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  AFLogDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Analytics"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v3 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, 0, &v7);
  v4 = v7;

  if ((v3 & 1) == 0)
  {
    v5 = AFSiriLogContextSpeech;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v9 = "AFAnalyticsLogsDirectory";
      v10 = 2114;
      v11 = v1;
      v12 = 2114;
      v13 = v4;
      _os_log_error_impl(&dword_230F65000, v5, OS_LOG_TYPE_ERROR, "%s Couldn't create analytics log directory at path %{public}@ %{public}@", buf, 0x20u);
    }
  }

  return v1;
}

void AFClearInternalLogFiles()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v18;
  NSObject *v19;
  __int128 v20;
  void *v21;
  int v22;
  char *v23;
  uint64_t v24;
  id obj;
  void *v26;
  void *v27;
  id v28;
  id v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  const __CFString *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if ((AFIsInternalInstall() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "dateByAddingTimeInterval:", -1296000.0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = objc_alloc_init(MEMORY[0x24BDD1580]);
    AFSpeechLogsDirectory();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v29[1] = 0;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v2;
    objc_msgSend(v2, "contentsOfDirectoryAtPath:error:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (__CFString *)0;
    obj = v3;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v5)
    {
      v7 = v5;
      v23 = 0;
      v8 = *(_QWORD *)v31;
      v24 = *MEMORY[0x24BDD0C58];
      *(_QWORD *)&v6 = 136315650;
      v20 = v6;
      v21 = v1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v10, "pathExtension", v20);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "compare:options:", CFSTR("opx"), 1)
            || !objc_msgSend(v11, "compare:options:", CFSTR("pcm"), 1))
          {
            objc_msgSend(v26, "stringByAppendingPathComponent:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v29[0] = v4;
            objc_msgSend(v27, "attributesOfItemAtPath:error:", v12, v29);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (const __CFString *)v29[0];

            if (!v14)
            {
              objc_msgSend(v13, "objectForKey:", v24);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "compare:", v1) == -1)
              {
                v28 = 0;
                v22 = objc_msgSend(v27, "removeItemAtPath:error:", v12, &v28);
                v14 = (const __CFString *)v28;
                v16 = AFSiriLogContextUtility;
                if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v20;
                  v17 = &stru_24FFBFEE0;
                  if (!v22)
                    v17 = v14;
                  v35 = "AFClearInternalLogFiles";
                  v36 = 2112;
                  v37 = v10;
                  v38 = 2112;
                  v39 = v17;
                  _os_log_impl(&dword_230F65000, v16, OS_LOG_TYPE_INFO, "%s Removing speech log %@ %@", buf, 0x20u);
                }
                ++v23;
                v1 = v21;
              }
              else
              {
                v14 = 0;
              }

            }
            v4 = (__CFString *)v14;
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v7);
    }
    else
    {
      v23 = 0;
    }

    v19 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "AFClearInternalLogFiles";
      v36 = 2048;
      v37 = v23;
      _os_log_impl(&dword_230F65000, v19, OS_LOG_TYPE_INFO, "%s Finished, and removed %ld files", buf, 0x16u);
    }

  }
  else
  {
    v18 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "AFClearInternalLogFiles";
      _os_log_impl(&dword_230F65000, v18, OS_LOG_TYPE_INFO, "%s Nothing to do on non-internal install", buf, 0xCu);
    }
  }
}

void AFLogInitIfNeeded()
{
  if (qword_255EADCE8 != -1)
    dispatch_once(&qword_255EADCE8, &unk_24FFBFCF8);
}

void sub_230F66BE0()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;
  os_log_t v26;
  void *v27;
  os_log_t v28;
  void *v29;
  os_log_t v30;
  void *v31;
  os_log_t v32;
  void *v33;
  os_log_t v34;
  void *v35;
  os_log_t v36;
  void *v37;
  os_log_t v38;
  void *v39;
  os_log_t v40;
  void *v41;
  os_log_t v42;
  void *v43;
  os_log_t v44;
  void *v45;
  os_log_t v46;
  void *v47;
  os_log_t v48;
  void *v49;
  os_log_t v50;
  void *v51;
  os_log_t v52;
  void *v53;
  os_log_t v54;
  void *v55;
  os_log_t v56;
  void *v57;
  os_log_t v58;
  void *v59;
  os_log_t v60;
  void *v61;

  v0 = os_log_create("com.apple.siri", (const char *)kAFLogContextConnection);
  v1 = (void *)AFSiriLogContextConnection;
  AFSiriLogContextConnection = (uint64_t)v0;

  v2 = os_log_create("com.apple.siri", (const char *)kAFLogContextClientFlow);
  v3 = (void *)AFSiriLogContextClientFlow;
  AFSiriLogContextClientFlow = (uint64_t)v2;

  v4 = os_log_create("com.apple.siri", (const char *)kAFLogContextDaemon);
  v5 = (void *)AFSiriLogContextDaemon;
  AFSiriLogContextDaemon = (uint64_t)v4;

  v6 = os_log_create("com.apple.siri", (const char *)kAFLogContextPersisted);
  v7 = (void *)AFSiriLogContextPersisted;
  AFSiriLogContextPersisted = (uint64_t)v6;

  v8 = os_log_create("com.apple.siri", (const char *)kAFLogContextSession);
  v9 = (void *)AFSiriLogContextSession;
  AFSiriLogContextSession = (uint64_t)v8;

  v10 = os_log_create("com.apple.siri", (const char *)kAFLogContextSpeech);
  v11 = (void *)AFSiriLogContextSpeech;
  AFSiriLogContextSpeech = (uint64_t)v10;

  v12 = os_log_create("com.apple.siri", (const char *)kAFLogContextFides);
  v13 = (void *)AFSiriLogContextFides;
  AFSiriLogContextFides = (uint64_t)v12;

  v14 = os_log_create("com.apple.siri", (const char *)kAFLogContextLocation);
  v15 = (void *)AFSiriLogContextLocation;
  AFSiriLogContextLocation = (uint64_t)v14;

  v16 = os_log_create("com.apple.siri", (const char *)kAFLogContextDaemonAce);
  v17 = (void *)AFSiriLogContextDaemonAce;
  AFSiriLogContextDaemonAce = (uint64_t)v16;

  v18 = os_log_create("com.apple.siri", (const char *)kAFLogContextService);
  v19 = (void *)AFSiriLogContextService;
  AFSiriLogContextService = (uint64_t)v18;

  v20 = os_log_create("com.apple.siri", (const char *)kAFLogContextPlugin);
  v21 = (void *)AFSiriLogContextPlugin;
  AFSiriLogContextPlugin = (uint64_t)v20;

  v22 = os_log_create("com.apple.siri", (const char *)kAFLogContextUtility);
  v23 = (void *)AFSiriLogContextUtility;
  AFSiriLogContextUtility = (uint64_t)v22;

  v24 = os_log_create("com.apple.siri", (const char *)kAFLogContextAnalysis);
  v25 = (void *)AFSiriLogContextAnalysis;
  AFSiriLogContextAnalysis = (uint64_t)v24;

  v26 = os_log_create("com.apple.siri", (const char *)kAFLogContextPerformance);
  v27 = (void *)AFSiriLogContextPerformance;
  AFSiriLogContextPerformance = (uint64_t)v26;

  v28 = os_log_create("com.apple.siri", (const char *)kAFLogContextIDS);
  v29 = (void *)AFSiriLogContextIDS;
  AFSiriLogContextIDS = (uint64_t)v28;

  v30 = os_log_create("com.apple.siri", (const char *)kAFLogContextProxy);
  v31 = (void *)AFSiriLogContextProxy;
  AFSiriLogContextProxy = (uint64_t)v30;

  v32 = os_log_create("com.apple.siri", (const char *)kAFLogContextDispatch);
  v33 = (void *)AFSiriLogContextDispatch;
  AFSiriLogContextDispatch = (uint64_t)v32;

  v34 = os_log_create("com.apple.siri", (const char *)kAFLogContextAnalytics);
  v35 = (void *)AFSiriLogContextAnalytics;
  AFSiriLogContextAnalytics = (uint64_t)v34;

  v36 = os_log_create("com.apple.siri", (const char *)kAFLogContextTinyCDB);
  v37 = (void *)AFSiriLogContextTinyCDB;
  AFSiriLogContextTinyCDB = (uint64_t)v36;

  v38 = os_log_create("com.apple.siri", (const char *)kAFLogContextMediaSupport);
  v39 = (void *)AFSiriLogContextMediaSupport;
  AFSiriLogContextMediaSupport = (uint64_t)v38;

  v40 = os_log_create("com.apple.siri", (const char *)kAFLogContextMockServer);
  v41 = (void *)AFSiriLogContextMockServer;
  AFSiriLogContextMockServer = (uint64_t)v40;

  v42 = os_log_create("com.apple.siri", (const char *)kAFLogContextMusicIndexer);
  v43 = (void *)AFSiriLogContextMusicIndexer;
  AFSiriLogContextMusicIndexer = (uint64_t)v42;

  v44 = os_log_create("com.apple.siri", (const char *)kAFLogContextDatabase);
  v45 = (void *)AFSiriLogContextDatabase;
  AFSiriLogContextDatabase = (uint64_t)v44;

  v46 = os_log_create("com.apple.siri", (const char *)kAFLogContextSync);
  v47 = (void *)AFSiriLogContextSync;
  AFSiriLogContextSync = (uint64_t)v46;

  v48 = os_log_create("com.apple.siri", (const char *)kAFLogContextDeviceSync);
  v49 = (void *)AFSiriLogContextDeviceSync;
  AFSiriLogContextDeviceSync = (uint64_t)v48;

  v50 = os_log_create("com.apple.siri", (const char *)kAFLogContextInternalAuth);
  v51 = (void *)AFSiriLogContextInternalAuth;
  AFSiriLogContextInternalAuth = (uint64_t)v50;

  v52 = os_log_create("com.apple.siri", (const char *)kAFLogContextMyriad);
  v53 = (void *)AFSiriLogContextMyriad;
  AFSiriLogContextMyriad = (uint64_t)v52;

  v54 = os_log_create("com.apple.siri", (const char *)kAFLogContextPower);
  v55 = (void *)AFSiriLogContextPower;
  AFSiriLogContextPower = (uint64_t)v54;

  v56 = os_log_create("com.apple.siri", (const char *)AFLogContextNetworkingFunctional);
  v57 = (void *)AFNetworkingLogContextFunctional;
  AFNetworkingLogContextFunctional = (uint64_t)v56;

  v58 = os_log_create("com.apple.siri", (const char *)AFLogContextNetworkingPerformance);
  v59 = (void *)AFNetworkingLogContextPerformance;
  AFNetworkingLogContextPerformance = (uint64_t)v58;

  v60 = os_log_create("com.apple.siri", (const char *)kAFSiriLogContextMUXReverseSync);
  v61 = (void *)AFSiriLogContextMUXReverseSync;
  AFSiriLogContextMUXReverseSync = (uint64_t)v60;

}

uint64_t AFLogWantsToLogParsedCommandObjects()
{
  return 0;
}

void AFLogParsedCommandObject(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v26[2];
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a1;
  v11 = a2;
  AFLogDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("CommandLogs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v15 = objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v28);
  v16 = v28;

  if ((v15 & 1) != 0)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v10, 200, 0, &v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v27;

    if (v17)
    {
      v26[1] = &a9;
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v11, &a9);
      objc_msgSend(v13, "stringByAppendingPathComponent:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR("plist"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v26[0] = v18;
      v22 = objc_msgSend(v17, "writeToFile:options:error:", v21, 1, v26);
      v16 = v26[0];

      if ((v22 & 1) == 0)
      {
        v23 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v30 = "AFLogParsedCommandObject";
          v31 = 2112;
          v32 = v21;
          v33 = 2112;
          v34 = v16;
          _os_log_impl(&dword_230F65000, v23, OS_LOG_TYPE_INFO, "%s Couldn't write to %@: %@", buf, 0x20u);
        }
      }

    }
    else
    {
      v25 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "AFLogParsedCommandObject";
        v31 = 2112;
        v32 = v18;
        _os_log_impl(&dword_230F65000, v25, OS_LOG_TYPE_INFO, "%s Couldn't serialize: %@", buf, 0x16u);
      }
      v16 = v18;
    }

  }
  else
  {
    v24 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "AFLogParsedCommandObject";
      v31 = 2112;
      v32 = v13;
      v33 = 2112;
      v34 = v16;
      _os_log_impl(&dword_230F65000, v24, OS_LOG_TYPE_INFO, "%s Couldn't create %@: %@", buf, 0x20u);
    }
  }

}

unint64_t AFTruncateMachTimeToTenthOfASecond(uint64_t a1)
{
  if (qword_255EADCF8 != -1)
    dispatch_once(&qword_255EADCF8, &unk_24FFBFD18);
  return 1000000000
       * (unint64_t)dword_255EADCF0
       * a1
       / *(unsigned int *)algn_255EADCF4
       / 0x3B9ACA00
       * *(unsigned int *)algn_255EADCF4
       / dword_255EADCF0;
}

uint64_t sub_230F67370()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_255EADCF0);
}

void AFDispatchSyncLogged(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v9;
  id v10;
  const char *label;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  label = dispatch_queue_get_label(v9);
  v12 = AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "AFDispatchSyncLogged";
    v22 = 2080;
    v23 = a3;
    v24 = 2048;
    v25 = a4;
    v26 = 2080;
    v27 = label;
    _os_log_impl(&dword_230F65000, v12, OS_LOG_TYPE_INFO, "%s Queue block at %s line %lu (queue: %s)", buf, 0x2Au);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230F674DC;
  block[3] = &unk_24FFBFD40;
  v17 = a4;
  v18 = label;
  v19 = a5;
  v15 = v10;
  v16 = a3;
  v13 = v10;
  dispatch_sync(v9, block);

}

void sub_230F674DC(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    v3 = a1[5];
    v4 = a1[6];
    v5 = a1[7];
    v6 = v2;
    v7 = mach_absolute_time();
    v8 = sub_230F67684(v7 - a1[8]);
    v17 = 136316162;
    v18 = "AFDispatchSyncLogged_block_invoke";
    v19 = 2080;
    v20 = v3;
    v21 = 2048;
    v22 = v4;
    v23 = 2080;
    v24 = v5;
    v25 = 2048;
    v26 = v8;
    _os_log_impl(&dword_230F65000, v6, OS_LOG_TYPE_INFO, "%s Enter block at %s line %lu (queue: %s, waitingTime: %llums)", (uint8_t *)&v17, 0x34u);

  }
  v9 = mach_absolute_time();
  (*(void (**)(void))(a1[4] + 16))();
  v10 = (void *)AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    v11 = a1[5];
    v12 = a1[6];
    v13 = a1[7];
    v14 = v10;
    v15 = mach_absolute_time();
    v16 = sub_230F67684(v15 - v9);
    v17 = 136316162;
    v18 = "AFDispatchSyncLogged_block_invoke";
    v19 = 2080;
    v20 = v11;
    v21 = 2048;
    v22 = v12;
    v23 = 2080;
    v24 = v13;
    v25 = 2048;
    v26 = v16;
    _os_log_impl(&dword_230F65000, v14, OS_LOG_TYPE_INFO, "%s Leave block at %s line %lu (queue: %s, executionTime: %llums)", (uint8_t *)&v17, 0x34u);

  }
}

unint64_t sub_230F67684(uint64_t a1)
{
  if (qword_255EADD08 != -1)
    dispatch_once(&qword_255EADD08, &unk_24FFBFD60);
  return (unint64_t)dword_255EADD00 * a1 / *(unsigned int *)algn_255EADD04 / 0xF4240;
}

uint64_t sub_230F676F4()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_255EADD00);
}

void AFDispatchAsyncLogged(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v9;
  id v10;
  const char *label;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  label = dispatch_queue_get_label(v9);
  v12 = AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "AFDispatchAsyncLogged";
    v22 = 2080;
    v23 = a3;
    v24 = 2048;
    v25 = a4;
    v26 = 2080;
    v27 = label;
    _os_log_impl(&dword_230F65000, v12, OS_LOG_TYPE_INFO, "%s Queue block at %s line %lu (queue: %s)", buf, 0x2Au);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230F67860;
  block[3] = &unk_24FFBFD40;
  v17 = a4;
  v18 = label;
  v19 = a5;
  v15 = v10;
  v16 = a3;
  v13 = v10;
  dispatch_async(v9, block);

}

void sub_230F67860(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    v3 = a1[5];
    v4 = a1[6];
    v5 = a1[7];
    v6 = v2;
    v7 = mach_absolute_time();
    v8 = sub_230F67684(v7 - a1[8]);
    v17 = 136316162;
    v18 = "AFDispatchAsyncLogged_block_invoke";
    v19 = 2080;
    v20 = v3;
    v21 = 2048;
    v22 = v4;
    v23 = 2080;
    v24 = v5;
    v25 = 2048;
    v26 = v8;
    _os_log_impl(&dword_230F65000, v6, OS_LOG_TYPE_INFO, "%s Enter block at %s line %lu (queue: %s, waitingTime: %llums)", (uint8_t *)&v17, 0x34u);

  }
  v9 = mach_absolute_time();
  (*(void (**)(void))(a1[4] + 16))();
  v10 = (void *)AFSiriLogContextDispatch;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDispatch, OS_LOG_TYPE_INFO))
  {
    v11 = a1[5];
    v12 = a1[6];
    v13 = a1[7];
    v14 = v10;
    v15 = mach_absolute_time();
    v16 = sub_230F67684(v15 - v9);
    v17 = 136316162;
    v18 = "AFDispatchAsyncLogged_block_invoke";
    v19 = 2080;
    v20 = v11;
    v21 = 2048;
    v22 = v12;
    v23 = 2080;
    v24 = v13;
    v25 = 2048;
    v26 = v16;
    _os_log_impl(&dword_230F65000, v14, OS_LOG_TYPE_INFO, "%s Leave block at %s line %lu (queue: %s, executionTime: %llums)", (uint8_t *)&v17, 0x34u);

  }
}

void sub_230F67BA8(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SiriCloudKitAccountsNotifier account:didChangeWithType:inStore:oldAccount:]_block_invoke";
    _os_log_impl(&dword_230F65000, v2, OS_LOG_TYPE_INFO, "%s Responding to CloudKit Account Update", (uint8_t *)&v8, 0xCu);
  }
  if (*(_BYTE *)(a1 + 32))
  {
    if (*(_BYTE *)(a1 + 33))
      return;
    v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[SiriCloudKitAccountsNotifier account:didChangeWithType:inStore:oldAccount:]_block_invoke";
      _os_log_impl(&dword_230F65000, v3, OS_LOG_TYPE_INFO, "%s Disabling Siri Cloud Sync.", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 0;
  }
  else
  {
    if (!*(_BYTE *)(a1 + 33))
      return;
    v7 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[SiriCloudKitAccountsNotifier account:didChangeWithType:inStore:oldAccount:]_block_invoke";
      _os_log_impl(&dword_230F65000, v7, OS_LOG_TYPE_INFO, "%s Enabling Siri Cloud Sync.", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 1;
  }
  objc_msgSend(v4, "setCloudSyncEnabled:", v6);

}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x24BE08DA8]();
}

uint64_t AFSharedResourcesDirectory()
{
  return MEMORY[0x24BE08F58]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

