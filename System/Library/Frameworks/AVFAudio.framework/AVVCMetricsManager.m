@implementation AVVCMetricsManager

- (AVVCMetricsManager)init
{
  char *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int AppBooleanValue;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  dispatch_queue_t v32;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  id v47;
  objc_super v48;
  uint8_t buf[32];
  uint64_t v50;
  void *v51;
  uint8_t v52[4];
  const char *v53;
  __int16 v54;
  int v55;
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[4];

  v59[3] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)AVVCMetricsManager;
  v2 = -[AVVCMetricsManager init](&v48, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v2, "setPublicMetrics:", v3);

    objc_msgSend(v2, "publicMetrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = CFSTR("BeginHostTime");
    v58[1] = CFSTR("EndHostTime");
    v59[0] = &unk_1E3BFCC80;
    v59[1] = &unk_1E3BFCC80;
    v58[2] = CFSTR("DurationMilliSeconds");
    v59[2] = &unk_1E3BFCC80;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("SetSessionActiveTime"));

    objc_msgSend(v2, "publicMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = CFSTR("BeginHostTime");
    v56[1] = CFSTR("EndHostTime");
    v57[0] = &unk_1E3BFCC80;
    v57[1] = &unk_1E3BFCC80;
    v56[2] = CFSTR("DurationMilliSeconds");
    v57[2] = &unk_1E3BFCC80;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("SetSessionInactiveTime"));

    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v2, "setAvvcProfilingInfoDictionary:", v8);

    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("profile_avvc"), CFSTR("com.apple.avfoundation.avvc"), 0);
    v2[40] = AppBooleanValue != 0;
    if (!AppBooleanValue)
      goto LABEL_10;
    if (kAVVCScope)
    {
      v10 = *(id *)kAVVCScope;
      if (!v10)
        goto LABEL_10;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "AVVCMetricsManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 190;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Profiling AVVC NOW.", buf, 0x12u);
    }

LABEL_10:
    *(_OWORD *)(v2 + 24) = xmmword_19B85A220;
    if (IsMetricsOwnedByAVVC(void)::onceToken != -1)
      dispatch_once(&IsMetricsOwnedByAVVC(void)::onceToken, &__block_literal_global_141);
    if (IsMetricsOwnedByAVVC(void)::owned)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DDE8C0]), "initWithNewReporterID");
      v13 = (void *)*((_QWORD *)v2 + 2);
      *((_QWORD *)v2 + 2) = v12;

      v14 = (void *)*((_QWORD *)v2 + 2);
      if (!v14)
      {
        if (kAVVCScope)
        {
          v29 = *(id *)kAVVCScope;
          if (!v29)
          {
LABEL_77:
            objc_msgSend(v2, "setVoiceTriggerStartHostTime:", 0);
            objc_msgSend(v2, "setCallToStartRecordHostTime:", 0);
            return (AVVCMetricsManager *)v2;
          }
        }
        else
        {
          v29 = MEMORY[0x1E0C81028];
          v41 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "AVVCMetricsManager.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 219;
          _os_log_impl(&dword_19B733000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d Unable to create a CAReporter", buf, 0x12u);
        }

        goto LABEL_77;
      }
      objc_msgSend(v14, "setServiceType:", 1);
      v15 = (void *)*((_QWORD *)v2 + 2);
      v50 = *MEMORY[0x1E0DDE828];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setConfiguration:", v18);

      v19 = objc_msgSend(*((id *)v2 + 2), "reporterID");
      objc_msgSend(v2, "publicMetrics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("avvcReporterID"));

      if (kAVVCScope)
      {
        v22 = *(id *)kAVVCScope;
        if (!v22)
          goto LABEL_29;
      }
      else
      {
        v22 = MEMORY[0x1E0C81028];
        v30 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AVVCMetricsManager.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 235;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v19;
        _os_log_impl(&dword_19B733000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created a reporter with id(%lld)", buf, 0x1Cu);
      }

LABEL_29:
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = dispatch_queue_create("AVVCMetricsManager Work Queue", v31);
      v33 = (void *)*((_QWORD *)v2 + 1);
      *((_QWORD *)v2 + 1) = v32;

      memset(buf, 0, 24);
      v34 = operator new(8uLL);
      *v34 = v19;
      *(_QWORD *)buf = v34;
      *(_QWORD *)&buf[8] = v34 + 1;
      *(_QWORD *)&buf[16] = v34 + 1;
      if (AudioIssueDetectorLibraryLoader(void)::once != -1)
        dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_190);
      if (AudioIssueDetectorLibraryLoader(void)::libSym)
      {
        v35 = AudioIssueDetectorLibraryLoader(void)::libSym(4, buf);
        *((_QWORD *)v2 + 3) = v35;
        if (v35)
          goto LABEL_46;
      }
      else
      {
        *((_QWORD *)v2 + 3) = 0;
      }
      if (kAVVCScope)
      {
        v36 = *(id *)kAVVCScope;
        if (!v36)
          goto LABEL_46;
      }
      else
      {
        v36 = MEMORY[0x1E0C81028];
        v38 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v52 = 136315394;
        v53 = "AVVCMetricsManager.mm";
        v54 = 1024;
        v55 = 243;
        _os_log_impl(&dword_19B733000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create AudioIssueDetector.", v52, 0x12u);
      }

LABEL_46:
      if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
        dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_208);
      if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
      {
        v39 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(4, buf);
        *((_QWORD *)v2 + 4) = v39;
        if (v39 == 561211748)
        {
          if (kAVVCScope)
          {
            v40 = *(id *)kAVVCScope;
            if (!v40)
              goto LABEL_74;
          }
          else
          {
            v40 = MEMORY[0x1E0C81028];
            v45 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v52 = 136315394;
            v53 = "AVVCMetricsManager.mm";
            v54 = 1024;
            v55 = 248;
            _os_log_impl(&dword_19B733000, v40, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create AudioDataAnalysisSiriSession.", v52, 0x12u);
          }

        }
      }
      else
      {
        *((_QWORD *)v2 + 4) = 560033897;
      }
LABEL_74:
      objc_msgSend(*((id *)v2 + 2), "start");
      goto LABEL_75;
    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("AVVCMetricsManager Work Queue", v23);
    v25 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DDE8C0]), "initWithReporterID:serviceType:", 1, 1);
    v27 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v26;

    memset(buf, 0, 24);
    if (AudioIssueDetectorLibraryLoader(void)::once != -1)
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_190);
    if (AudioIssueDetectorLibraryLoader(void)::libSym)
    {
      v28 = AudioIssueDetectorLibraryLoader(void)::libSym(4, buf);
      *((_QWORD *)v2 + 3) = v28;
      if (v28)
        goto LABEL_62;
    }
    else
    {
      *((_QWORD *)v2 + 3) = 0;
    }
    if (kAVVCScope)
    {
      v37 = *(id *)kAVVCScope;
      if (!v37)
        goto LABEL_62;
    }
    else
    {
      v37 = MEMORY[0x1E0C81028];
      v42 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v52 = 136315394;
      v53 = "AVVCMetricsManager.mm";
      v54 = 1024;
      v55 = 207;
      _os_log_impl(&dword_19B733000, v37, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create AudioIssueDetector.", v52, 0x12u);
    }

LABEL_62:
    if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
      dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_208);
    if (!AudioDataAnalysisManagerLibraryLoader(void)::libSym)
    {
      *((_QWORD *)v2 + 4) = 560033897;
      goto LABEL_75;
    }
    v43 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(4, buf);
    *((_QWORD *)v2 + 4) = v43;
    if (v43 != 561211748)
      goto LABEL_75;
    if (kAVVCScope)
    {
      v44 = *(id *)kAVVCScope;
      if (!v44)
      {
LABEL_75:
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }
        goto LABEL_77;
      }
    }
    else
    {
      v44 = MEMORY[0x1E0C81028];
      v47 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v52 = 136315394;
      v53 = "AVVCMetricsManager.mm";
      v54 = 1024;
      v55 = 211;
      _os_log_impl(&dword_19B733000, v44, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create AudioDataAnalysisSiriSession.", v52, 0x12u);
    }

    goto LABEL_75;
  }
  return (AVVCMetricsManager *)v2;
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  CAReporter *mMetricsReporter;
  CAReporter *v6;
  int64_t mAudioIssueDetector;
  unint64_t mAudioDataAnalysisSiriSession;
  OS_dispatch_queue *mWorkQueue;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "AVVCMetricsManager.mm";
    v13 = 1024;
    v14 = 266;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCMetricsManager: dealloc", buf, 0x12u);
  }

LABEL_8:
  mMetricsReporter = self->mMetricsReporter;
  if (mMetricsReporter)
  {
    -[CAReporter stop](mMetricsReporter, "stop");
    v6 = self->mMetricsReporter;
    self->mMetricsReporter = 0;

  }
  mAudioIssueDetector = self->mAudioIssueDetector;
  if (mAudioIssueDetector)
  {
    if (AudioIssueDetectorLibraryLoader(void)::once != -1)
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_190);
    if (AudioIssueDetectorLibraryLoader(void)::libSym)
      AudioIssueDetectorLibraryLoader(void)::libSym(mAudioIssueDetector);
  }
  mAudioDataAnalysisSiriSession = self->mAudioDataAnalysisSiriSession;
  if (mAudioDataAnalysisSiriSession != 561211748)
  {
    if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
      dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_208);
    if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
      AudioDataAnalysisManagerLibraryLoader(void)::libSym(mAudioDataAnalysisSiriSession);
  }
  mWorkQueue = self->mWorkQueue;
  if (mWorkQueue)
  {
    self->mWorkQueue = 0;

  }
  -[AVVCMetricsManager setPublicMetrics:](self, "setPublicMetrics:", 0);
  -[AVVCMetricsManager setAvvcProfilingInfoDictionary:](self, "setAvvcProfilingInfoDictionary:", 0);
  v10.receiver = self;
  v10.super_class = (Class)AVVCMetricsManager;
  -[AVVCMetricsManager dealloc](&v10, sel_dealloc);
}

- (void)updateWithReporterID:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD *v9;
  int64_t mAudioIssueDetector;
  int v11;
  NSObject *v12;
  id v13;
  unint64_t mAudioDataAnalysisSiriSession;
  int v15;
  NSObject *v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint8_t buf[40];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (IsMetricsOwnedByAVVC(void)::onceToken != -1)
    dispatch_once(&IsMetricsOwnedByAVVC(void)::onceToken, &__block_literal_global_141);
  if (!IsMetricsOwnedByAVVC(void)::owned)
  {
    if (!a3)
    {
      memset(buf, 0, 24);
      goto LABEL_14;
    }
    -[AVVCMetricsManager publicMetrics](self, "publicMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("avvcReporterID"));

    -[CAReporter updateWithReporterID:](self->mMetricsReporter, "updateWithReporterID:", a3);
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_13:
        memset(buf, 0, 24);
        v9 = operator new(8uLL);
        *v9 = a3;
        *(_QWORD *)buf = v9;
        *(_QWORD *)&buf[8] = v9 + 1;
        *(_QWORD *)&buf[16] = v9 + 1;
LABEL_14:
        mAudioIssueDetector = self->mAudioIssueDetector;
        if (!mAudioIssueDetector)
          goto LABEL_28;
        if (AudioIssueDetectorLibraryLoader(void)::once != -1)
          dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_190);
        if (AudioIssueDetectorLibraryLoader(void)::libSym)
        {
          v11 = AudioIssueDetectorLibraryLoader(void)::libSym(mAudioIssueDetector, buf);
          if (!v11)
            goto LABEL_28;
        }
        else
        {
          v11 = -1;
        }
        if (kAVVCScope)
        {
          v12 = *(id *)kAVVCScope;
          if (!v12)
            goto LABEL_28;
        }
        else
        {
          v12 = MEMORY[0x1E0C81028];
          v13 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v18 = 136315650;
          v19 = "AVVCMetricsManager.mm";
          v20 = 1024;
          v21 = 309;
          v22 = 1024;
          v23 = v11;
          _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioIssueDetectorClientUpdateReportingSessions returned error %d", (uint8_t *)&v18, 0x18u);
        }

LABEL_28:
        mAudioDataAnalysisSiriSession = self->mAudioDataAnalysisSiriSession;
        if (mAudioDataAnalysisSiriSession == 561211748)
          goto LABEL_42;
        if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
          dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_208);
        if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
        {
          v15 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(mAudioDataAnalysisSiriSession, buf);
          if (!v15)
            goto LABEL_42;
        }
        else
        {
          v15 = 560033897;
        }
        if (kAVVCScope)
        {
          v16 = *(id *)kAVVCScope;
          if (!v16)
          {
LABEL_42:
            if (*(_QWORD *)buf)
            {
              *(_QWORD *)&buf[8] = *(_QWORD *)buf;
              operator delete(*(void **)buf);
            }
            return;
          }
        }
        else
        {
          v16 = MEMORY[0x1E0C81028];
          v17 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v18 = 136315650;
          v19 = "AVVCMetricsManager.mm";
          v20 = 1024;
          v21 = 315;
          v22 = 1024;
          v23 = v15;
          _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d ADAMClientUpdateReportingSessions returned error %d", (uint8_t *)&v18, 0x18u);
        }

        goto LABEL_42;
      }
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AVVCMetricsManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 301;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = a3;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCMetricsManager: UpdateWithReporterID: %lld", buf, 0x1Cu);
    }

    goto LABEL_13;
  }
}

- (void)checkAndUpdateReporterID:(int64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (IsMetricsOwnedByAVVC(void)::onceToken != -1)
    dispatch_once(&IsMetricsOwnedByAVVC(void)::onceToken, &__block_literal_global_141);
  if (!IsMetricsOwnedByAVVC(void)::owned
    && (unint64_t)-[CAReporter reporterID](self->mMetricsReporter, "reporterID") <= 1)
  {
    if (kAVVCScope)
    {
      v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_12:
        if (a3)
        {
          -[CAReporter updateWithReporterID:](self->mMetricsReporter, "updateWithReporterID:", a3);
          -[AVVCMetricsManager publicMetrics](self, "publicMetrics");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("avvcReporterID"));

        }
        return;
      }
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "AVVCMetricsManager.mm";
      v11 = 1024;
      v12 = 328;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d CAReporter reporterID is Invalid", (uint8_t *)&v9, 0x12u);
    }

    goto LABEL_12;
  }
}

- (int64_t)reporterID
{
  CAReporter *mMetricsReporter;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  mMetricsReporter = self->mMetricsReporter;
  if (mMetricsReporter)
    return -[CAReporter reporterID](mMetricsReporter, "reporterID");
  if (!kAVVCScope)
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v4 = *(id *)kAVVCScope;
  if (v4)
  {
LABEL_7:
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "AVVCMetricsManager.mm";
      v8 = 1024;
      v9 = 349;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d CAReporter object is nil", (uint8_t *)&v6, 0x12u);
    }

  }
  return 0;
}

- (id)retrieveMetrics
{
  AVVCMetricsManager *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0C99D80];
  -[AVVCMetricsManager publicMetrics](v2, "publicMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v5;
}

- (id)getStringDate:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZZZZZ"));
  objc_msgSend(v4, "stringFromDate:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)resetProfileMetrics
{
  id v2;

  if (self->mProfileAVVC)
  {
    -[AVVCMetricsManager avvcProfilingInfoDictionary](self, "avvcProfilingInfoDictionary");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeAllObjects");

  }
}

- (id)retrieveProfileMetrics
{
  AVVCMetricsManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  NSObject *v103;
  id v104;
  id v105;
  id v106;
  NSObject *v107;
  void *v108;
  void *v109;
  _QWORD v111[5];
  uint8_t buf[4];
  const char *v113;
  __int16 v114;
  int v115;
  __int16 v116;
  void *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->mProfileAVVC)
    goto LABEL_52;
  -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_PrepareStart"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_PrepareEnd"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_6;
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_PrepareEnd"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_PrepareStart"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v10);
    v12 = v11;

    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12 * 1000.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("AVVC_PROFILE_Delta_PrepareAPIStartEnd"));

  }
LABEL_6:
  -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_GetPropertiesStart"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_GetPropertiesEnd"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_10;
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_GetPropertiesEnd"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_GetPropertiesStart"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", v21);
    v23 = v22;

    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23 * 1000.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v24, CFSTR("AVVC_PROFILE_Delta_GetSessionPropStartEnd"));

  }
LABEL_10:
  -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_SetSessionActiveStart"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_SetSessionActiveEnd"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
      goto LABEL_14;
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_SetSessionActiveEnd"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_SetSessionActiveStart"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeIntervalSinceDate:", v32);
    v34 = v33;

    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34 * 1000.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v35, CFSTR("AVVC_PROFILE_Delta_SetSessionActiveStartEnd"));

  }
LABEL_14:
  -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_SetupRecordQueueStart"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_SetupRecordQueueEnd"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
      goto LABEL_18;
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_SetupRecordQueueEnd"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_SetupRecordQueueStart"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "timeIntervalSinceDate:", v43);
    v45 = v44;

    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45 * 1000.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v46, CFSTR("AVVC_PROFILE_Delta_SetupRecordQueueStartEnd"));

  }
LABEL_18:
  -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_StartRecordingStart"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_StartRecordingEnd"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v50)
      goto LABEL_22;
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_StartRecordingEnd"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_StartRecordingStart"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "timeIntervalSinceDate:", v54);
    v56 = v55;

    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56 * 1000.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v57, CFSTR("AVVC_PROFILE_Delta_StartRecordAPIStartEnd"));

  }
LABEL_22:
  -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_PlayAlertStart"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_PlayAlertEnd"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v61)
      goto LABEL_26;
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_PlayAlertEnd"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_PlayAlertStart"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "timeIntervalSinceDate:", v65);
    v67 = v66;

    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v67 * 1000.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forKey:", v68, CFSTR("AVVC_PROFILE_Delta_PlayAlertQueueStartEnd"));

  }
LABEL_26:
  -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_RecordQueueStart"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_RecordQueueEnd"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v72)
      goto LABEL_30;
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_RecordQueueEnd"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_RecordQueueStart"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "timeIntervalSinceDate:", v76);
    v78 = v77;

    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v78 * 1000.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKey:", v79, CFSTR("AVVC_PROFILE_Delta_StartRecordAudioQueueStartEnd"));

  }
LABEL_30:
  -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_RecordQueueStart"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_FirstBufferReceived"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v83)
      goto LABEL_34;
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_FirstBufferReceived"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_RecordQueueStart"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "timeIntervalSinceDate:", v87);
    v89 = v88;

    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v89 * 1000.0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setObject:forKey:", v90, CFSTR("AVVC_PROFILE_Delta_RecordAudioQueueFirstBufferDelta"));

  }
LABEL_34:
  -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_FirstBufferReceived"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_RecordQueueStart"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v94)
      goto LABEL_38;
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_FirstBufferReceived"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("AVVC_PROFILE_Prop_RecordQueueStart"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "timeIntervalSinceDate:", v98);
    v100 = v99;

    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v100 * 1000.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setObject:forKey:", v101, CFSTR("AVVC_PROFILE_Delta_RecordAudioQueueFirstBufferToDelegateCallDelta"));

  }
LABEL_38:
  -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = MEMORY[0x1E0C809B0];
  v111[1] = 3221225472;
  v111[2] = __44__AVVCMetricsManager_retrieveProfileMetrics__block_invoke;
  v111[3] = &unk_1E3BEB838;
  v111[4] = v2;
  objc_msgSend(v102, "enumerateKeysAndObjectsUsingBlock:", v111);

  if (!kAVVCScope)
  {
    v103 = MEMORY[0x1E0C81028];
    v104 = MEMORY[0x1E0C81028];
    goto LABEL_42;
  }
  v103 = *(id *)kAVVCScope;
  if (v103)
  {
LABEL_42:
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v113 = "AVVCMetricsManager.mm";
      v114 = 1024;
      v115 = 445;
      _os_log_impl(&dword_19B733000, v103, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController PERF_INFO ####", buf, 0x12u);
    }

  }
  if (kAVVCScope)
  {
    v105 = *(id *)kAVVCScope;
    if (!v105)
      goto LABEL_52;
  }
  else
  {
    v105 = (id)MEMORY[0x1E0C81028];
    v106 = MEMORY[0x1E0C81028];
  }
  v107 = v105;
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v113 = "AVVCMetricsManager.mm";
    v114 = 1024;
    v115 = 446;
    v116 = 2112;
    v117 = v108;
    _os_log_impl(&dword_19B733000, v107, OS_LOG_TYPE_DEFAULT, "%25s:%-5d PROFILE %@", buf, 0x1Cu);

  }
LABEL_52:
  -[AVVCMetricsManager avvcProfilingInfoDictionary](v2, "avvcProfilingInfoDictionary");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v109;
}

- (BOOL)measureElapseTimeForMetric:(id)a3 block:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD);
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  AVVCMetricsManager *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  double v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (**)(_QWORD))a4;
  v8 = mach_absolute_time();
  v9 = v7[2](v7);
  v10 = mach_absolute_time();
  v11 = __udivti3();
  v12 = self;
  objc_sync_enter(v12);
  v30[0] = CFSTR("BeginHostTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v13;
  v30[1] = CFSTR("EndHostTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (double)(unint64_t)v11 / 1000000.0;
  v31[1] = v14;
  v30[2] = CFSTR("DurationMilliSeconds");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVVCMetricsManager publicMetrics](v12, "publicMetrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v17, v6);

  objc_sync_exit(v12);
  if (kAVVCScope)
  {
    v19 = *(id *)kAVVCScope;
    if (!v19)
      goto LABEL_8;
  }
  else
  {
    v19 = MEMORY[0x1E0C81028];
    v20 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v22 = 136315906;
    v23 = "AVVCMetricsManager.mm";
    v24 = 1024;
    v25 = 470;
    v26 = 2112;
    v27 = v6;
    v28 = 2048;
    v29 = v15;
    _os_log_impl(&dword_19B733000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d Measuring Elapsed Time for %@ : %f ms", (uint8_t *)&v22, 0x26u);
  }

LABEL_8:
  return v9;
}

- (int)setAudioIssueDetectorFormat:(CAStreamBasicDescription *)a3 numFrames:(unsigned int)a4
{
  uint64_t v4;
  __int128 v7;
  int v8;
  int64_t mAudioIssueDetector;
  int v10;
  NSObject *v11;
  int64_t v12;
  id v13;
  const char *v14;
  id v15;
  NSObject *v16;
  uint32_t v17;
  id v18;
  _OWORD v20[2];
  uint64_t v21;
  _BYTE __p[12];
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v4 = *(_QWORD *)&a4;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = *(_OWORD *)&a3->var3;
  v20[0] = *(_OWORD *)&a3->var0;
  v20[1] = v7;
  v21 = *(_QWORD *)&a3->var7;
  v8 = -[AVVCMetricsManager setADAMFormat:numFrames:](self, "setADAMFormat:numFrames:", v20);
  mAudioIssueDetector = self->mAudioIssueDetector;
  if (mAudioIssueDetector)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "avvc-recordQueue");
    if (AudioIssueDetectorLibraryLoader(void)::once != -1)
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_190);
    if (AudioIssueDetectorLibraryLoader(void)::libSym)
      v10 = AudioIssueDetectorLibraryLoader(void)::libSym(mAudioIssueDetector, __p, 0, a3, v4);
    else
      v10 = -1;
    if (SHIBYTE(v26) < 0)
    {
      operator delete(*(void **)__p);
      if (v10)
        goto LABEL_12;
    }
    else if (v10)
    {
LABEL_12:
      if (kAVVCScope)
      {
        v11 = *(id *)kAVVCScope;
        if (!v11)
          return v10;
      }
      else
      {
        v11 = MEMORY[0x1E0C81028];
        v13 = MEMORY[0x1E0C81028];
      }
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      *(_DWORD *)__p = 136315650;
      *(_QWORD *)&__p[4] = "AVVCMetricsManager.mm";
      v23 = 1024;
      v24 = 491;
      v25 = 1024;
      v26 = v10;
      v14 = "%25s:%-5d AudioIssueDetectorClientSetNodeFormat returned error %d";
LABEL_34:
      v16 = v11;
      v17 = 24;
      goto LABEL_35;
    }
    v12 = self->mAudioIssueDetector;
    if (AudioIssueDetectorLibraryLoader(void)::once != -1)
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_190);
    if (AudioIssueDetectorLibraryLoader(void)::libSym)
    {
      v10 = AudioIssueDetectorLibraryLoader(void)::libSym(v12);
      if (!v10)
        return v10;
    }
    else
    {
      v10 = -1;
    }
    if (kAVVCScope)
    {
      v11 = *(id *)kAVVCScope;
      if (!v11)
        return v10;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_DWORD *)__p = 136315650;
    *(_QWORD *)&__p[4] = "AVVCMetricsManager.mm";
    v23 = 1024;
    v24 = 496;
    v25 = 1024;
    v26 = v10;
    v14 = "%25s:%-5d AudioIssueDetectorClientInitialize returned error %d";
    goto LABEL_34;
  }
  v10 = v8;
  if (kAVVCScope)
  {
    v11 = *(id *)kAVVCScope;
    if (!v11)
      return v10;
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = "AVVCMetricsManager.mm";
    v23 = 1024;
    v24 = 500;
    v14 = "%25s:%-5d setAudioIssueDetectorFormat: Invalid AudioIssueDetector client. Not creating AudioIssueDetectorClient node.";
    v16 = v11;
    v17 = 18;
LABEL_35:
    _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, v14, __p, v17);
  }
LABEL_36:

  return v10;
}

- (int)audioIssueDetectorAnalyzeBuffer:(AudioBufferList *)a3 numFrames:(unsigned int)a4 timeStamp:(const AudioTimeStamp *)a5 shouldAnalyze:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v8;
  int v11;
  int64_t mAudioIssueDetector;
  NSObject *v13;
  id v14;
  AudioBufferList v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v6 = a6;
  v8 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x1E0C80C00];
  v16 = *a3;
  v11 = -[AVVCMetricsManager adamAnalyzeBuffer:numFrames:timeStamp:shouldAnalyze:](self, "adamAnalyzeBuffer:numFrames:timeStamp:shouldAnalyze:", &v16);
  if (v6)
  {
    mAudioIssueDetector = self->mAudioIssueDetector;
    if (mAudioIssueDetector)
    {
      if (AudioIssueDetectorLibraryLoader(void)::once != -1)
        dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_190);
      if (AudioIssueDetectorLibraryLoader(void)::libSym)
      {
        v11 = AudioIssueDetectorLibraryLoader(void)::libSym(mAudioIssueDetector, 0, 0, a3, v8, a5);
        if (!v11)
          return v11;
      }
      else
      {
        v11 = -1;
      }
      if (kAVVCScope)
      {
        v13 = *(id *)kAVVCScope;
        if (!v13)
          return v11;
      }
      else
      {
        v13 = MEMORY[0x1E0C81028];
        v14 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "AVVCMetricsManager.mm";
        v19 = 1024;
        v20 = 518;
        v21 = 1024;
        v22 = v11;
        _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioIssueDetectorClientAnalyzeBuffer Failed: %d", buf, 0x18u);
      }

    }
  }
  return v11;
}

- (int)resetAudioIssueDetector
{
  int64_t mAudioIssueDetector;
  NSObject *v3;
  id v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  mAudioIssueDetector = self->mAudioIssueDetector;
  if (mAudioIssueDetector)
  {
    if (AudioIssueDetectorLibraryLoader(void)::once != -1)
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_190);
    if (AudioIssueDetectorLibraryLoader(void)::libSym)
    {
      LODWORD(mAudioIssueDetector) = AudioIssueDetectorLibraryLoader(void)::libSym(mAudioIssueDetector);
      if (!(_DWORD)mAudioIssueDetector)
        return mAudioIssueDetector;
    }
    else
    {
      LODWORD(mAudioIssueDetector) = -1;
    }
    if (kAVVCScope)
    {
      v3 = *(id *)kAVVCScope;
      if (!v3)
        return mAudioIssueDetector;
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315650;
      v7 = "AVVCMetricsManager.mm";
      v8 = 1024;
      v9 = 532;
      v10 = 1024;
      v11 = mAudioIssueDetector;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioIssueDetectorClientReset Failed: %d", (uint8_t *)&v6, 0x18u);
    }

  }
  return mAudioIssueDetector;
}

- (int)setADAMFormat:(CAStreamBasicDescription *)a3 numFrames:(unsigned int)a4
{
  NSObject *mWorkQueue;
  __int128 v5;
  int v6;
  _QWORD v8[6];
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  mWorkQueue = self->mWorkQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__AVVCMetricsManager_setADAMFormat_numFrames___block_invoke;
  v8[3] = &unk_1E3BEB860;
  v8[4] = self;
  v8[5] = &v13;
  v5 = *(_OWORD *)&a3->var3;
  v9 = *(_OWORD *)&a3->var0;
  v10 = v5;
  v11 = *(_QWORD *)&a3->var7;
  v12 = a4;
  dispatch_async(mWorkQueue, v8);
  v6 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v6;
}

- (int)adamAnalyzeBuffer:(AudioBufferList *)a3 numFrames:(unsigned int)a4 timeStamp:(const AudioTimeStamp *)a5 shouldAnalyze:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v8;
  unint64_t mAudioDataAnalysisSiriSession;
  int v12;
  int result;
  unint64_t v14;
  NSObject *v15;
  id v16;
  char v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v6 = a6;
  v8 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x1E0C80C00];
  mAudioDataAnalysisSiriSession = self->mAudioDataAnalysisSiriSession;
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_208);
  v12 = 560033897;
  if (!AudioDataAnalysisManagerLibraryLoader(void)::libSym)
    return 560033897;
  v17 = 0;
  result = AudioDataAnalysisManagerLibraryLoader(void)::libSym(mAudioDataAnalysisSiriSession, &v17);
  if (v6)
  {
    if (v17)
    {
      v14 = self->mAudioDataAnalysisSiriSession;
      if (v14 != 561211748)
      {
        if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
          dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_208);
        if (!AudioDataAnalysisManagerLibraryLoader(void)::libSym
          || (result = AudioDataAnalysisManagerLibraryLoader(void)::libSym(v14, 0, a3, v8, a5), (v12 = result) != 0))
        {
          if (kAVVCScope)
          {
            v15 = *(id *)kAVVCScope;
            if (!v15)
              return v12;
          }
          else
          {
            v15 = MEMORY[0x1E0C81028];
            v16 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v19 = "AVVCMetricsManager.mm";
            v20 = 1024;
            v21 = 574;
            v22 = 1024;
            v23 = v12;
            _os_log_impl(&dword_19B733000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d ADAMClientProcessAudio returned error %d", buf, 0x18u);
          }

          return v12;
        }
      }
    }
  }
  return result;
}

- (int)resetADAM
{
  unint64_t mAudioDataAnalysisSiriSession;
  int v3;
  NSObject *v4;
  id v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  mAudioDataAnalysisSiriSession = self->mAudioDataAnalysisSiriSession;
  if (mAudioDataAnalysisSiriSession == 561211748)
    return 0;
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_208);
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
  {
    v3 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(mAudioDataAnalysisSiriSession);
    if (!v3)
      return v3;
  }
  else
  {
    v3 = 560033897;
  }
  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      return v3;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315650;
    v8 = "AVVCMetricsManager.mm";
    v9 = 1024;
    v10 = 589;
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d ADAMClientReset Failed %d", (uint8_t *)&v7, 0x18u);
  }

  return v3;
}

- (void)logSessionMetric:(id)a3 value:(id)a4 category:(unsigned int)a5 type:(unsigned __int16)a6 reporterID:(int64_t)a7
{
  -[AVVCMetricsManager logSessionMetric:value:category:type:context:reporterID:](self, "logSessionMetric:value:category:type:context:reporterID:", a3, a4, *(_QWORD *)&a5, a6, 0, a7);
}

- (void)logSessionMetric:(id)a3 value:(id)a4 category:(unsigned int)a5 type:(unsigned __int16)a6 context:(id)a7 reporterID:(int64_t)a8
{
  uint64_t v10;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v10 = a6;
  v29 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  if (self->mMetricsReporter)
  {
    if (kAVVCScope)
    {
      v16 = *(id *)kAVVCScope;
      if (!v16)
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v14, v13, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        v17 = v19;
        if (v15)
          -[NSObject setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v15, CFSTR("avvcLogContext"));
        -[AVVCMetricsManager checkAndUpdateReporterID:](self, "checkAndUpdateReporterID:", a8);
        -[CAReporter sendMessage:category:type:](self->mMetricsReporter, "sendMessage:category:type:", v17, 2, v10);
        goto LABEL_15;
      }
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "AVVCMetricsManager.mm";
      v23 = 1024;
      v24 = 609;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d Logging In-Session Metric %@ : %@", buf, 0x26u);
    }

    goto LABEL_12;
  }
  if (kAVVCScope)
  {
    v17 = *(id *)kAVVCScope;
    if (!v17)
      goto LABEL_16;
  }
  else
  {
    v17 = MEMORY[0x1E0C81028];
    v20 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "AVVCMetricsManager.mm";
    v23 = 1024;
    v24 = 617;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Error! No CAReporter for sending %@ message", buf, 0x1Cu);
  }
LABEL_15:

LABEL_16:
}

- (void)logSingleMetric:(id)a3 value:(id)a4 category:(unsigned int)a5 type:(unsigned __int16)a6 reporterID:(int64_t)a7
{
  uint64_t v8;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v8 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (self->mMetricsReporter)
  {
    if (kAVVCScope)
    {
      v13 = *(id *)kAVVCScope;
      if (!v13)
      {
LABEL_12:
        v17 = v11;
        v18 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v14 = objc_claimAutoreleasedReturnValue();
        -[AVVCMetricsManager checkAndUpdateReporterID:](self, "checkAndUpdateReporterID:", a7);
        -[CAReporter sendMessage:category:type:](self->mMetricsReporter, "sendMessage:category:type:", v14, 2, v8);
        goto LABEL_13;
      }
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "AVVCMetricsManager.mm";
      v21 = 1024;
      v22 = 625;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d Logging Out-of-Session Metric %@ : %@", buf, 0x26u);
    }

    goto LABEL_12;
  }
  if (kAVVCScope)
  {
    v14 = *(id *)kAVVCScope;
    if (!v14)
      goto LABEL_14;
  }
  else
  {
    v14 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "AVVCMetricsManager.mm";
    v21 = 1024;
    v22 = 630;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Error! No CAReporter for sending %@ message", buf, 0x1Cu);
  }
LABEL_13:

LABEL_14:
}

- (void)logRecordAudioFormat:(CAStreamBasicDescription *)a3 reporterID:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("avvcSampleRate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = CFSTR("avvcBitDepth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  v12[2] = CFSTR("avvcChannels");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  v12[3] = CFSTR("avvcFormatID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->mMetricsReporter)
  {
    -[AVVCMetricsManager checkAndUpdateReporterID:](self, "checkAndUpdateReporterID:", a4);
    -[CAReporter sendMessage:category:type:](self->mMetricsReporter, "sendMessage:category:type:", v11, 2, 5);
  }

}

- (void)logRecordRoute:(id)a3 andPlaybackRoute:(id)a4 reporterID:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v11[0] = CFSTR("avvcRecordRoute");
  v11[1] = CFSTR("avvcPlaybackRoute");
  v12[0] = v8;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->mMetricsReporter)
  {
    -[AVVCMetricsManager checkAndUpdateReporterID:](self, "checkAndUpdateReporterID:", a5);
    -[CAReporter sendMessage:category:type:](self->mMetricsReporter, "sendMessage:category:type:", v10, 6, 5);
  }

}

- (void)logProfileMetrics:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->mProfileAVVC)
  {
    if (kAVVCScope)
    {
      v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_9:
        -[AVVCMetricsManager avvcProfilingInfoDictionary](self, "avvcProfilingInfoDictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v8, v4);

        goto LABEL_10;
      }
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315650;
      v10 = "AVVCMetricsManager.mm";
      v11 = 1024;
      v12 = 667;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Logging PROFILE METRIC : %@", (uint8_t *)&v9, 0x1Cu);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (unint64_t)voiceTriggerStartHostTime
{
  return self->_voiceTriggerStartHostTime;
}

- (void)setVoiceTriggerStartHostTime:(unint64_t)a3
{
  self->_voiceTriggerStartHostTime = a3;
}

- (unint64_t)callToStartRecordHostTime
{
  return self->_callToStartRecordHostTime;
}

- (void)setCallToStartRecordHostTime:(unint64_t)a3
{
  self->_callToStartRecordHostTime = a3;
}

- (NSMutableDictionary)publicMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPublicMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)avvcProfilingInfoDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAvvcProfilingInfoDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avvcProfilingInfoDictionary, 0);
  objc_storeStrong((id *)&self->_publicMetrics, 0);
  objc_storeStrong((id *)&self->mMetricsReporter, 0);
  objc_storeStrong((id *)&self->mWorkQueue, 0);
}

void __46__AVVCMetricsManager_setADAMFormat_numFrames___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v4;
  int v5;
  int v6;
  id v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  id v12;
  int v13;
  id v14;
  int v15;
  _BYTE __p[12];
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v1 == 561211748)
  {
    if (kAVVCScope)
    {
      v2 = *(id *)kAVVCScope;
      if (!v2)
        return;
    }
    else
    {
      v2 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136315394;
      *(_QWORD *)&__p[4] = "AVVCMetricsManager.mm";
      v17 = 1024;
      v18 = 555;
      v8 = "%25s:%-5d setAudioIssueDetectorFormat: Invalid ADAM SessionID. Not creating ADAM client node.";
      v9 = v2;
      v10 = 18;
LABEL_33:
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, v8, __p, v10);
    }
LABEL_34:

    return;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "avvc-recordQueue");
  v4 = *(unsigned int *)(a1 + 88);
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_208);
  v5 = 560033897;
  v6 = 560033897;
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
    v6 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(v1, 0, __p, a1 + 48, v4, 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  if (SHIBYTE(v20) < 0)
    operator delete(*(void **)__p);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (kAVVCScope)
    {
      v2 = *(id *)kAVVCScope;
      if (!v2)
        return;
    }
    else
    {
      v2 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    *(_DWORD *)__p = 136315650;
    *(_QWORD *)&__p[4] = "AVVCMetricsManager.mm";
    v17 = 1024;
    v18 = 549;
    v19 = 1024;
    v20 = v13;
    v8 = "%25s:%-5d ADAMClientCreateNodePCM returned error %d";
LABEL_32:
    v9 = v2;
    v10 = 24;
    goto LABEL_33;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1)
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_208);
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
    v5 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(v11);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (kAVVCScope)
    {
      v2 = *(id *)kAVVCScope;
      if (!v2)
        return;
    }
    else
    {
      v2 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v15 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    *(_DWORD *)__p = 136315650;
    *(_QWORD *)&__p[4] = "AVVCMetricsManager.mm";
    v17 = 1024;
    v18 = 552;
    v19 = 1024;
    v20 = v15;
    v8 = "%25s:%-5d ADAMClientInitialize returned error %d";
    goto LABEL_32;
  }
}

void __44__AVVCMetricsManager_retrieveProfileMetrics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "avvcProfilingInfoDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getStringDate:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

  }
}

+ (void)getLock
{
  if (gOnceLockToken != -1)
    dispatch_once(&gOnceLockToken, &__block_literal_global_2267);
  return (void *)gMutex;
}

+ (void)createSharedManager
{
  void *v2;
  void *v3;
  int v4;
  AVVCMetricsManager *v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = +[AVVCMetricsManager getLock](AVVCMetricsManager, "getLock");
  v3 = v2;
  if (v2)
    v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 16))(v2);
  else
    v4 = 0;
  if (!gSharedInstance)
  {
    v5 = objc_alloc_init(AVVCMetricsManager);
    v6 = (void *)gSharedInstance;
    gSharedInstance = (uint64_t)v5;

  }
  ++gReferenceCount;
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_13;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "AVVCMetricsManager.mm";
    v11 = 1024;
    v12 = 122;
    v13 = 2048;
    v14 = gReferenceCount;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCMetricsManager: createSharedManager: referenceCount after incrementing = %llu", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_13:
  if (v4)
    (*(void (**)(void *))(*(_QWORD *)v3 + 24))(v3);
}

+ (void)destroySharedManager
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = +[AVVCMetricsManager getLock](AVVCMetricsManager, "getLock");
  v3 = v2;
  if (v2)
    v4 = (*(uint64_t (**)(void *))(*(_QWORD *)v2 + 16))(v2) ^ 1;
  else
    v4 = 1;
  --gReferenceCount;
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_11;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "AVVCMetricsManager.mm";
    v10 = 1024;
    v11 = 138;
    v12 = 2048;
    v13 = gReferenceCount;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCMetricsManager: destroySharedManager : referenceCount after decrementing = %llu", (uint8_t *)&v8, 0x1Cu);
  }

LABEL_11:
  if (!gReferenceCount)
  {
    v7 = (void *)gSharedInstance;
    gSharedInstance = 0;

  }
  if ((v4 & 1) == 0)
    (*(void (**)(void *))(*(_QWORD *)v3 + 24))(v3);
}

+ (id)sharedManager
{
  void *v2;
  NSObject *v3;
  id v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)gSharedInstance;
  if (!gSharedInstance)
  {
    if (kAVVCScope)
    {
      v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_9:
        v2 = (void *)gSharedInstance;
        return v2;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "AVVCMetricsManager.mm";
      v8 = 1024;
      v9 = 156;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d AVVCMetricsManager: sharedInstance is nil !!!!", (uint8_t *)&v6, 0x12u);
    }

    goto LABEL_9;
  }
  return v2;
}

CADeprecated::CAMutex *__29__AVVCMetricsManager_getLock__block_invoke()
{
  CADeprecated::CAMutex *v0;
  CADeprecated::CAMutex *result;

  v0 = (CADeprecated::CAMutex *)operator new();
  result = CADeprecated::CAMutex::CAMutex(v0, "AVVCMM");
  gMutex = (uint64_t)v0;
  return result;
}

@end
