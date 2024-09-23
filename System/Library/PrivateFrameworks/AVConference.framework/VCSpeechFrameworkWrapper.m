@implementation VCSpeechFrameworkWrapper

+ (id)defaultSpeechFrameworkWrapper
{
  id result;
  void *v3;

  result = (id)defaultSpeechFrameworkWrapper__VCSpeechFrameworkWrapper;
  if (!defaultSpeechFrameworkWrapper__VCSpeechFrameworkWrapper)
  {
    v3 = (void *)objc_opt_class();
    objc_sync_enter(v3);
    if (!defaultSpeechFrameworkWrapper__VCSpeechFrameworkWrapper)
      defaultSpeechFrameworkWrapper__VCSpeechFrameworkWrapper = objc_alloc_init(VCSpeechFrameworkWrapper);
    objc_sync_exit(v3);
    return (id)defaultSpeechFrameworkWrapper__VCSpeechFrameworkWrapper;
  }
  return result;
}

- (VCSpeechFrameworkWrapper)init
{
  VCSpeechFrameworkWrapper *v2;
  VCSpeechFrameworkWrapper *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCSpeechFrameworkWrapper;
  v2 = -[VCSpeechFrameworkWrapper init](&v5, sel_init);
  v3 = v2;
  if (v2)
    v2->_isFrameworkLoaded = -[VCSpeechFrameworkWrapper loadSpeechFramework](v2, "loadSpeechFramework");
  return v3;
}

- (id)findSpeechFrameworkPath
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  if (!-[NSArray count](v2, "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = v8;
        v18 = 2080;
        v19 = "-[VCSpeechFrameworkWrapper findSpeechFrameworkPath]";
        v20 = 1024;
        v21 = 54;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed search path initialization. Captions will not be available", buf, 0x1Cu);
      }
    }
    return 0;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(&unk_1E9EFA3D0, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *(_QWORD *)v13;
LABEL_4:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v5)
      objc_enumerationMutation(&unk_1E9EFA3D0);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@%s"), -[NSArray objectAtIndex:](v2, "objectAtIndex:", 0), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6), "Speech.framework");
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", v7, 0) & 1) != 0)return v7;
    if (v4 == ++v6)
    {
      v4 = objc_msgSend(&unk_1E9EFA3D0, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      v7 = 0;
      if (v4)
        goto LABEL_4;
      return v7;
    }
  }
}

- (BOOL)loadSpeechFramework
{
  id v2;
  void *v3;
  void *v4;
  BOOL result;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = -[VCSpeechFrameworkWrapper findSpeechFrameworkPath](self, "findSpeechFrameworkPath");
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v2);
    if (v3)
    {
      v4 = v3;
      if ((objc_msgSend(v3, "isLoaded") & 1) != 0 || (objc_msgSend(v4, "load") & 1) != 0)
        return 1;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 0;
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v8)
        return result;
      v14 = 136315650;
      v15 = v6;
      v16 = 2080;
      v17 = "-[VCSpeechFrameworkWrapper loadSpeechFramework]";
      v18 = 1024;
      v19 = 81;
      v9 = " [%s] %s:%d Failed to load the Speech framework";
      goto LABEL_9;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v12 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v13)
    {
      v14 = 136315650;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCSpeechFrameworkWrapper loadSpeechFramework]";
      v18 = 1024;
      v19 = 75;
      v9 = " [%s] %s:%d Failed to initialize Speech bundle. Captions will not be available";
      goto LABEL_9;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v10 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v11)
    {
      v14 = 136315650;
      v15 = v10;
      v16 = 2080;
      v17 = "-[VCSpeechFrameworkWrapper loadSpeechFramework]";
      v18 = 1024;
      v19 = 72;
      v9 = " [%s] %s:%d Failed to find the Speech framework. Captions will not be available";
LABEL_9:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, 0x1Cu);
      return 0;
    }
  }
  return result;
}

- (id)newSFSpeechRecognizerWithLocale:(id)a3
{
  objc_class *v4;

  if (!self->_isFrameworkLoaded)
    return 0;
  v4 = NSClassFromString(CFSTR("SFSpeechRecognizer"));
  if (a3)
    return (id)objc_msgSend([v4 alloc], "initWithLocale:", a3);
  else
    return objc_alloc_init(v4);
}

- (id)newSFSpeechAudioBufferRecognitionRequest
{
  if (self->_isFrameworkLoaded)
    return objc_alloc_init(NSClassFromString(CFSTR("SFSpeechAudioBufferRecognitionRequest")));
  else
    return 0;
}

- (id)supportedLocales
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_isFrameworkLoaded)
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)-[objc_class supportedLocales](NSClassFromString(CFSTR("SFSpeechRecognizer")), "supportedLocales");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("SFSpeechRecognizer"))), "initWithLocale:", v8);
        v10 = v9;
        if (v9 && objc_msgSend(v9, "_isAvailableForForcedOfflineRecognition"))
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v5);
  }
  if (objc_msgSend(v2, "count"))
    return v2;
  else
    return 0;
}

- (id)newSFSpeechAnalyzerWithConfig:(tagVCSFSpeechAnalyzerConfig *)a3 didChangeVolatileRange:(id)a4
{
  id v6;
  uint64_t v8;

  if (!self->_isFrameworkLoaded)
    return 0;
  v6 = objc_alloc(NSClassFromString(CFSTR("SFSpeechAnalyzer")));
  LOBYTE(v8) = a3->var7;
  return (id)objc_msgSend(v6, "initWithClientIdentifier:audioFormat:transcriberResultDelegate:endpointingResultDelegate:queue:transcriberOptions:options:restrictedLogging:geoLMRegionID:contextualNamedEntities:didChangeVolatileRange:", a3->var0, a3->var1, a3->var2, a3->var3, a3->var4, a3->var5, a3->var6, v8, a3->var8, a3->var9, a4);
}

- (id)newSFSpeechAnalyzerOptionsWithHighPriority:(BOOL)a3 loggingInfo:(id)a4 powerContext:(id)a5
{
  if (self->_isFrameworkLoaded)
    return (id)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("SFSpeechAnalyzerOptions"))), "initWithHighPriority:loggingInfo:powerContext:", a3, a4, a5);
  else
    return 0;
}

- (id)newSFSpeechAnalyzerTranscriberOptions
{
  if (self->_isFrameworkLoaded)
    return objc_alloc_init(NSClassFromString(CFSTR("SFSpeechAnalyzerTranscriberOptions")));
  else
    return 0;
}

- (BOOL)frameworkLoaded
{
  return self->_isFrameworkLoaded;
}

@end
