@implementation AFLogInitIfNeeded

void __AFLogInitIfNeeded_block_invoke()
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

@end
