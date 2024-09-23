@implementation CSAdamSpeechMetricsManager

- (CSAdamSpeechMetricsManager)init
{
  CSAdamSpeechMetricsManager *v2;
  uint64_t v3;
  NSObject *v4;
  CSAdamSpeechMetricsManager *v5;
  void *__p;
  void *v8;
  uint64_t v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)CSAdamSpeechMetricsManager;
  v2 = -[CSAdamSpeechMetricsManager init](&v10, sel_init);
  if (!v2)
    goto LABEL_14;
  __p = 0;
  v8 = 0;
  v9 = 0;
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_9303);
  if (!AudioDataAnalysisManagerLibraryLoader(void)::libSym)
  {
    v2->_adamClientSessionId = 560033897;
LABEL_14:
    v5 = v2;
    goto LABEL_15;
  }
  v3 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(4, &__p);
  v2->_adamClientSessionId = v3;
  if (v3 != 561211748)
  {
    if (__p)
    {
      v8 = __p;
      operator delete(__p);
    }
    goto LABEL_14;
  }
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSAdamSpeechMetricsManager init]";
    _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Failed to create Adam client", buf, 0xCu);
  }
  if (__p)
  {
    v8 = __p;
    operator delete(__p);
  }
  v5 = 0;
LABEL_15:

  return v5;
}

- (void)dealloc
{
  unint64_t adamClientSessionId;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  adamClientSessionId = self->_adamClientSessionId;
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_9303);
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
    AudioDataAnalysisManagerLibraryLoader(void)::libSym(adamClientSessionId);
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSAdamSpeechMetricsManager dealloc]";
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAdamSpeechMetricsManager dealloc", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSAdamSpeechMetricsManager;
  -[CSAdamSpeechMetricsManager dealloc](&v5, sel_dealloc);
}

- (void)updateWithNewReporterID
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;
  unint64_t adamClientSessionId;
  int v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint8_t buf[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AF0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "reporterID");

  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSAdamSpeechMetricsManager updateWithNewReporterID]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s New reporterId is generated: %lld", buf, 0x16u);
  }
  memset(buf, 0, sizeof(buf));
  if (v4)
  {
    v6 = operator new(8uLL);
    *v6 = v4;
    *(_QWORD *)&buf[8] = v6 + 1;
    *(_QWORD *)&buf[16] = v6 + 1;
    *(_QWORD *)buf = v6;
  }
  adamClientSessionId = self->_adamClientSessionId;
  if (adamClientSessionId != 561211748)
  {
    if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
      dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_9303);
    if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
    {
      v8 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(adamClientSessionId, buf);
      if (!v8)
        goto LABEL_14;
    }
    else
    {
      v8 = 560033897;
    }
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[CSAdamSpeechMetricsManager updateWithNewReporterID]";
      v12 = 1024;
      v13 = v8;
      _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s ADAMClientUpdateReportingSessions is failing with error: %d", (uint8_t *)&v10, 0x12u);
    }
  }
LABEL_14:
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
}

- (int)setAudioIssueDetectorFormat:(AudioStreamBasicDescription *)a3 numFrames:(unsigned int)a4
{
  unint64_t adamClientSessionId;
  int v5;
  uint64_t v6;
  int v9;
  NSObject *v10;
  unint64_t v12;
  const char *v13;
  _BYTE __p[18];
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  adamClientSessionId = self->_adamClientSessionId;
  if (adamClientSessionId == 561211748)
    return 0;
  v6 = *(_QWORD *)&a4;
  v15 = 16;
  strcpy(__p, "avvc-recordQueue");
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_9303);
  if (!AudioDataAnalysisManagerLibraryLoader(void)::libSym)
  {
    v5 = 560033897;
    goto LABEL_11;
  }
  v9 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(adamClientSessionId, 0, __p, a3, v6, 0);
  v5 = v9;
  if (v15 < 0)
  {
    operator delete(*(void **)__p);
    if (!v5)
      goto LABEL_13;
LABEL_11:
    v10 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      return v5;
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = "-[CSAdamSpeechMetricsManager setAudioIssueDetectorFormat:numFrames:]";
    *(_WORD *)&__p[12] = 1024;
    *(_DWORD *)&__p[14] = v5;
    v13 = "%s ADAMClientCreateNodePCM is failing with error: %d";
LABEL_22:
    _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, v13, __p, 0x12u);
    return v5;
  }
  if (v9)
    goto LABEL_11;
LABEL_13:
  v12 = self->_adamClientSessionId;
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_9303);
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
  {
    v5 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(v12);
    if (!v5)
      return v5;
  }
  else
  {
    v5 = 560033897;
  }
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = "-[CSAdamSpeechMetricsManager setAudioIssueDetectorFormat:numFrames:]";
    *(_WORD *)&__p[12] = 1024;
    *(_DWORD *)&__p[14] = v5;
    v13 = "%s ADAMClientInitialize is failing with error: %d";
    goto LABEL_22;
  }
  return v5;
}

- (int)audioIssueDetectorAnalyzeBuffer:(AudioBufferList *)a3 numFrames:(unsigned int)a4 hostTime:(unint64_t)a5
{
  unint64_t adamClientSessionId;
  int v6;
  uint64_t v7;
  NSObject *v9;
  _QWORD v11[2];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v11[0] = 0;
  v12 = 0u;
  v11[1] = a5;
  v14 = 0;
  v15 = 2;
  adamClientSessionId = self->_adamClientSessionId;
  if (adamClientSessionId == 561211748)
    return 0;
  v7 = *(_QWORD *)&a4;
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_9303);
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
  {
    v6 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(adamClientSessionId, 0, a3, v7, v11);
    if (!v6)
      return v6;
  }
  else
  {
    v6 = 560033897;
  }
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[CSAdamSpeechMetricsManager audioIssueDetectorAnalyzeBuffer:numFrames:hostTime:]";
    v18 = 1024;
    v19 = v6;
    _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s ADAMClientProcessAudio is failing with error: %d", buf, 0x12u);
  }
  return v6;
}

- (unint64_t)adamClientSessionId
{
  return self->_adamClientSessionId;
}

- (void)setAdamClientSessionId:(unint64_t)a3
{
  self->_adamClientSessionId = a3;
}

- (CAReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
}

@end
