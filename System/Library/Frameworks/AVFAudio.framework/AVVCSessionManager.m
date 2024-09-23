@implementation AVVCSessionManager

- (AVVCSessionManager)initWithSession:(id)a3
{
  id v5;
  char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  PlatformUtilities_iOS *v12;
  char v13;
  PlatformUtilities_iOS *ProductType;
  PlatformUtilities_iOS *v15;
  PlatformUtilities_iOS *v16;
  BOOL v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AVVCSessionManager;
  v6 = -[AVVCSessionManager init](&v19, sel_init);
  if (v6)
  {
    if (isAudioSessionAvailable(void)::onceToken != -1)
      dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
    if (isAudioSessionAvailable(void)::audioSessionAvailable)
    {
      objc_storeStrong((id *)v6 + 25, a3);
      v6[8] = 0;
      *(_QWORD *)(v6 + 10) = 0;
      *((_WORD *)v6 + 9) = 0;
      *((_DWORD *)v6 + 5) = 1;
      *((_DWORD *)v6 + 36) = 0;
      objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v6[141] = v7 == v5;

      v6[142] = 0;
      *((_DWORD *)v6 + 37) = 1065353216;
      v8 = (void *)*((_QWORD *)v6 + 26);
      *((_QWORD *)v6 + 26) = 0;

      v6[143] = 0;
      *(_OWORD *)(v6 + 152) = 0u;
      *(_OWORD *)(v6 + 168) = 0u;
      *(_OWORD *)(v6 + 184) = 0u;
      *(_OWORD *)(v6 + 88) = xmmword_19B85A300;
      v9 = (void *)*((_QWORD *)v6 + 14);
      *((_QWORD *)v6 + 14) = &stru_1E3BED4C0;

      v10 = (void *)*((_QWORD *)v6 + 15);
      *((_QWORD *)v6 + 15) = &stru_1E3BED4C0;

      *((_QWORD *)v6 + 16) = -1;
      *((_DWORD *)v6 + 34) = 0;
      v6[140] = objc_msgSend(*((id *)v6 + 25), "eligibleForBTSmartRoutingConsideration");
      v11 = MGGetSInt32Answer();
      v12 = (PlatformUtilities_iOS *)MGGetBoolAnswer();
      if (v11 == 7)
        v13 = 1;
      else
        v13 = (char)v12;
      v6[18] = v13;
      ProductType = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType(v12);
      v17 = (_DWORD)ProductType == 111
         || (v15 = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType(ProductType), (_DWORD)v15 == 112)
         || (v16 = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType(v15), (_DWORD)v16 == 96)
         || PlatformUtilities_iOS::GetProductType(v16) == 97;
      v6[19] = v17;
    }
  }

  return (AVVCSessionManager *)v6;
}

- (void)dealloc
{
  AVAudioSession *audioSession;
  NSString *playbackRoute;
  objc_super v5;

  audioSession = self->_audioSession;
  self->_audioSession = 0;

  playbackRoute = self->_playbackRoute;
  self->_playbackRoute = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVVCSessionManager;
  -[AVVCSessionManager dealloc](&v5, sel_dealloc);
}

- (int)setupOneTimeSessionSettingsForClient:(int64_t)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  AVAudioSession *audioSession;
  char v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  int v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  int v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  __CFString *v24;
  void *v25;
  id v26;
  AVAudioSession *v27;
  NSObject *v28;
  NSObject *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  id v33;
  AVAudioSession *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  AVAudioSession *v38;
  BOOL v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  id v44;
  int v45;
  id v46;
  AVAudioSession *v47;
  char v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  AVAudioSession *v53;
  BOOL v54;
  NSObject *v55;
  NSObject *v56;
  id v57;
  AVAudioSession *v58;
  char v59;
  NSObject *v60;
  NSObject *v61;
  id v62;
  recursive_mutex *p_mSessionManagerLock;
  std::recursive_mutex *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  id v72;
  uint8_t v73[4];
  const char *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  NSObject *v78;
  __int16 v79;
  int v80;
  uint8_t buf[4];
  const char *v82;
  __int16 v83;
  int v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  int v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12)
        return 0;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v82 = "AVVCSessionManager.mm";
      v83 = 1024;
      v84 = 212;
      v85 = 2080;
      v86 = "setupOneTimeSessionSettingsForClient";
      v87 = 1024;
      v88 = 0;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    return 0;
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setupOneTimeSessionSettingsForClient:]", "setupOneTimeSessionSettingsForClient", 0);
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v5 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  if (IsMetricsOwnedByAVVC(void)::onceToken != -1)
    dispatch_once(&IsMetricsOwnedByAVVC(void)::onceToken, &__block_literal_global_141);
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (!IsMetricsOwnedByAVVC(void)::owned)
  {
    v10 = 0;
    self->_reporterID = -[AVAudioSession reporterID](self->_audioSession, "reporterID", p_mSessionManagerLock);
    goto LABEL_43;
  }
  +[AVVCMetricsManager sharedManager](AVVCMetricsManager, "sharedManager", p_mSessionManagerLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "reporterID");

  if (v7)
  {
    audioSession = self->_audioSession;
    v72 = 0;
    v9 = -[AVAudioSession setReporterID:error:](audioSession, "setReporterID:error:", v7, &v72);
    v10 = v72;
    if ((v9 & 1) != 0)
    {
      if (kAVVCScope)
      {
        v11 = *(id *)kAVVCScope;
        if (!v11)
          goto LABEL_43;
      }
      else
      {
        v11 = (id)MEMORY[0x1E0C81028];
        v17 = MEMORY[0x1E0C81028];
      }
      v18 = v11;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = -[AVAudioSession opaqueSessionID](self->_audioSession, "opaqueSessionID");
        *(_DWORD *)v73 = 136315906;
        v74 = "AVVCSessionManager.mm";
        v75 = 1024;
        v76 = 231;
        v77 = 2048;
        v78 = v7;
        v79 = 1024;
        v80 = v19;
        _os_log_impl(&dword_19B733000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Set reporterID(%lld) on session(0x%x)", v73, 0x22u);
      }

    }
    else
    {
      if (kAVVCScope)
      {
        v15 = *(id *)kAVVCScope;
        if (!v15)
          goto LABEL_43;
      }
      else
      {
        v15 = MEMORY[0x1E0C81028];
        v20 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v73 = 136315650;
        v74 = "AVVCSessionManager.mm";
        v75 = 1024;
        v76 = 228;
        v77 = 2112;
        v78 = v10;
        _os_log_impl(&dword_19B733000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: setReporterID failed with error: %@", v73, 0x1Cu);
      }

    }
  }
  else
  {
    if (kAVVCScope)
    {
      v10 = *(id *)kAVVCScope;
      if (!v10)
        goto LABEL_43;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v73 = 136315394;
      v74 = "AVVCSessionManager.mm";
      v75 = 1024;
      v76 = 235;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCMetricsManager returned invalid reporterID", v73, 0x12u);
    }

    v10 = 0;
  }
LABEL_43:
  v21 = (void *)*MEMORY[0x1E0CFF078];
  v22 = (id)*MEMORY[0x1E0CFF078];
  if (a3 == 3)
    goto LABEL_46;
  if (a3 == 2)
  {
    v31 = (void *)*MEMORY[0x1E0CFEFC0];
    v24 = (__CFString *)(id)*MEMORY[0x1E0CFEFC0];
    v32 = (void *)*MEMORY[0x1E0CFF0E8];
    v33 = (id)*MEMORY[0x1E0CFF0E8];

    v22 = v33;
    v34 = self->_audioSession;
    v66 = v10;
    LOBYTE(v33) = -[AVAudioSession setCategory:mode:routeSharingPolicy:options:error:](v34, "setCategory:mode:routeSharingPolicy:options:error:", v24, v33, 0, 12, &v66);
    v35 = v66;

    v10 = v35;
    if ((v33 & 1) != 0)
    {
      objc_storeStrong((id *)&self->mPreviousSessionCategory, v31);
      objc_storeStrong((id *)&self->mPreviousSessionMode, v32);
      self->mPreviousSessionCategoryOptions = 12;
      goto LABEL_112;
    }
    if (kAVVCScope)
    {
      v41 = *(id *)kAVVCScope;
      if (!v41)
      {
LABEL_74:
        v45 = -[NSObject code](v35, "code");
        goto LABEL_111;
      }
    }
    else
    {
      v41 = MEMORY[0x1E0C81028];
      v44 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v73 = 136315650;
      v74 = "AVVCSessionManager.mm";
      v75 = 1024;
      v76 = 386;
      v77 = 2112;
      v78 = v35;
      _os_log_impl(&dword_19B733000, v41, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setupOneTimeSessionSettings setCategoryModeRouteSharingPolicyOptions failed with error: %@", v73, 0x1Cu);
    }

    goto LABEL_74;
  }
  if (a3 != 1)
  {
    v24 = &stru_1E3BED4C0;
    goto LABEL_112;
  }
LABEL_46:
  if (MGGetSInt32Answer() != 4 || (MGGetBoolAnswer() & 1) != 0)
  {
    v23 = (void *)*MEMORY[0x1E0CFEFC0];
    v24 = (__CFString *)(id)*MEMORY[0x1E0CFEFC0];
    v25 = (void *)*MEMORY[0x1E0CFF0B8];
    v26 = (id)*MEMORY[0x1E0CFF0B8];

    v22 = v26;
    v27 = self->_audioSession;
    v70 = v10;
    LOBYTE(v26) = -[AVAudioSession setCategory:mode:routeSharingPolicy:options:error:](v27, "setCategory:mode:routeSharingPolicy:options:error:", v24, v26, 0, 4, &v70);
    v28 = v70;

    v29 = v28;
    if ((v26 & 1) != 0)
    {
      objc_storeStrong((id *)&self->mPreviousSessionCategory, v23);
      objc_storeStrong((id *)&self->mPreviousSessionMode, v25);
      v14 = 0;
      v30 = 4;
LABEL_58:
      self->mPreviousSessionCategoryOptions = v30;
      goto LABEL_80;
    }
    if (kAVVCScope)
    {
      v36 = *(id *)kAVVCScope;
      if (!v36)
      {
LABEL_66:
        v14 = -[NSObject code](v28, "code");
        goto LABEL_80;
      }
    }
    else
    {
      v36 = MEMORY[0x1E0C81028];
      v42 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v73 = 136315650;
      v74 = "AVVCSessionManager.mm";
      v75 = 1024;
      v76 = 324;
      v77 = 2112;
      v78 = v28;
      _os_log_impl(&dword_19B733000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setupOneTimeSessionSettings setCategoryModeOptions failed with error: %@", v73, 0x1Cu);
    }

    goto LABEL_66;
  }
  v37 = (void *)*MEMORY[0x1E0CFEFC8];
  v24 = (__CFString *)(id)*MEMORY[0x1E0CFEFC8];
  v38 = self->_audioSession;
  v71 = v10;
  v39 = -[AVAudioSession setCategory:withOptions:error:](v38, "setCategory:withOptions:error:", v24, 19, &v71);
  v40 = v71;

  v29 = v40;
  if (v39)
  {
    objc_storeStrong((id *)&self->mPreviousSessionCategory, v37);
    objc_storeStrong((id *)&self->mPreviousSessionMode, v21);
    v14 = 0;
    v30 = 19;
    goto LABEL_58;
  }
  if (!kAVVCScope)
  {
    v43 = MEMORY[0x1E0C81028];
    v46 = MEMORY[0x1E0C81028];
    goto LABEL_76;
  }
  v43 = *(id *)kAVVCScope;
  if (v43)
  {
LABEL_76:
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v73 = 136315650;
      v74 = "AVVCSessionManager.mm";
      v75 = 1024;
      v76 = 262;
      v77 = 2112;
      v78 = v40;
      _os_log_impl(&dword_19B733000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setupOneTimeSessionSettings setCategoryModeOptions failed with error: %@", v73, 0x1Cu);
    }

  }
  v14 = -[NSObject code](v40, "code");
LABEL_80:
  v47 = self->_audioSession;
  v69 = v29;
  v48 = -[AVAudioSession setIAmTheAssistant:error:](v47, "setIAmTheAssistant:error:", 1, &v69);
  v49 = v69;

  v50 = v49;
  if ((v48 & 1) != 0)
    goto LABEL_89;
  if (!kAVVCScope)
  {
    v51 = MEMORY[0x1E0C81028];
    v52 = MEMORY[0x1E0C81028];
    goto LABEL_85;
  }
  v51 = *(id *)kAVVCScope;
  if (v51)
  {
LABEL_85:
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v73 = 136315650;
      v74 = "AVVCSessionManager.mm";
      v75 = 1024;
      v76 = 336;
      v77 = 2112;
      v78 = v49;
      _os_log_impl(&dword_19B733000, v51, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setIAmTheAssistant failed with error: %@", v73, 0x1Cu);
    }

  }
  v14 = -[NSObject code](v49, "code");
LABEL_89:
  v53 = self->_audioSession;
  v68 = v49;
  v54 = -[AVAudioSession setAllowHapticsAndSystemSoundsDuringRecording:error:](v53, "setAllowHapticsAndSystemSoundsDuringRecording:error:", 1, &v68);
  v55 = v68;

  v10 = v55;
  if (v54)
    goto LABEL_98;
  if (!kAVVCScope)
  {
    v56 = MEMORY[0x1E0C81028];
    v57 = MEMORY[0x1E0C81028];
    goto LABEL_94;
  }
  v56 = *(id *)kAVVCScope;
  if (v56)
  {
LABEL_94:
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v73 = 136315650;
      v74 = "AVVCSessionManager.mm";
      v75 = 1024;
      v76 = 343;
      v77 = 2112;
      v78 = v55;
      _os_log_impl(&dword_19B733000, v56, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAllowHapticsAndSystemSoundsDuringRecording failed with error: %@", v73, 0x1Cu);
    }

  }
  v14 = -[NSObject code](v55, "code");
LABEL_98:
  if (a3 != 1)
    goto LABEL_101;
  v58 = self->_audioSession;
  v67 = v55;
  v59 = -[AVAudioSession setEligibleForBTSmartRoutingConsideration:error:](v58, "setEligibleForBTSmartRoutingConsideration:error:", 0, &v67);
  v60 = v67;

  v10 = v60;
  if ((v59 & 1) == 0)
  {
    if (kAVVCScope)
    {
      v61 = *(id *)kAVVCScope;
      if (!v61)
      {
LABEL_110:
        v45 = -[NSObject code](v60, "code");
LABEL_111:
        v14 = v45;
        if (v45)
          goto LABEL_113;
LABEL_112:
        -[AVVCSessionManager setSessionStateWithoutLock:](self, "setSessionStateWithoutLock:", 1);
        v14 = 0;
        goto LABEL_113;
      }
    }
    else
    {
      v61 = MEMORY[0x1E0C81028];
      v62 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v73 = 136315650;
      v74 = "AVVCSessionManager.mm";
      v75 = 1024;
      v76 = 350;
      v77 = 2112;
      v78 = v60;
      _os_log_impl(&dword_19B733000, v61, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ERROR: AVVCSessionManager::setEligibleForBTSmartRoutingConsideration failed with error: %@", v73, 0x1Cu);
    }

    goto LABEL_110;
  }
  self->mEnableSmartRoutingConsideration = 0;
LABEL_101:
  if (!v14)
    goto LABEL_112;
LABEL_113:

  if (v5)
    std::recursive_mutex::unlock(v65);
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  return v14;
}

- (int)setSessionActivationContext:(id)a3
{
  id v4;
  int v5;
  recursive_mutex *p_mSessionManagerLock;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  signed int v13;
  NSString *v14;
  NSString **p_mPreviousActivationDeviceUID;
  int64_t mPreviousActivationMode;
  char v17;
  char v18;
  id v19;
  AVAudioSession *audioSession;
  char v21;
  NSObject *v22;
  id v23;
  int v24;
  NSObject *v25;
  id v26;
  NSString *v27;
  id v28;
  NSObject *v29;
  NSString *v30;
  id v31;
  id v33;
  _BYTE v34[16];
  uint8_t v35[16];
  uint8_t v36[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BYTE v41[18];
  __int16 v42;
  _BYTE *v43;
  __int16 v44;
  NSString *v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
      {
LABEL_19:
        v10 = 0;
        goto LABEL_58;
      }
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v47 = "AVVCSessionManager.mm";
      v48 = 1024;
      v49 = 414;
      v50 = 2080;
      v51 = "setSessionActivationContext";
      v52 = 1024;
      v53 = 0;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_19;
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setSessionActivationContext:]", "setSessionActivationContext", 0);
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v5 = IsSerializationEnabled(void)::enable;
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  if (!v4)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_24:
        v4 = objc_alloc_init(MEMORY[0x1E0C99D80]);
        goto LABEL_25;
      }
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v36 = 136315394;
      v37 = "AVVCSessionManager.mm";
      v38 = 1024;
      v39 = 420;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionActivationContext : passed 'nil' dictionary, creating empty one.", v36, 0x12u);
    }

    goto LABEL_24;
  }
LABEL_25:
  objc_msgSend(v4, "objectForKey:", CFSTR("activation trigger"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("activation device uid"));
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  p_mPreviousActivationDeviceUID = &self->mPreviousActivationDeviceUID;
  mPreviousActivationMode = self->mPreviousActivationMode;
  v17 = areNSStringsEqual(v14, self->mPreviousActivationDeviceUID);
  if (mPreviousActivationMode == v13)
    v18 = v17;
  else
    v18 = 0;
  if ((v18 & 1) == 0)
  {
    audioSession = self->_audioSession;
    v33 = 0;
    v21 = -[AVAudioSession setActivationContext:error:](audioSession, "setActivationContext:error:", v4, &v33);
    v22 = v33;
    if ((v21 & 1) != 0)
    {
      if (kAVVCScope)
      {
        v23 = *(id *)kAVVCScope;
        if (!v23)
        {
LABEL_47:
          self->mPreviousActivationMode = v13;
          objc_storeStrong((id *)&self->mPreviousActivationDeviceUID, v14);
LABEL_48:
          v10 = 0;
LABEL_54:

          goto LABEL_55;
        }
      }
      else
      {
        v23 = (id)MEMORY[0x1E0C81028];
        v28 = MEMORY[0x1E0C81028];
      }
      v29 = v23;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        CAX4CCString::CAX4CCString((CAX4CCString *)v35, v13);
        CAX4CCString::CAX4CCString((CAX4CCString *)v34, self->mPreviousActivationMode);
        v30 = *p_mPreviousActivationDeviceUID;
        *(_DWORD *)v36 = 136316418;
        v37 = "AVVCSessionManager.mm";
        v38 = 1024;
        v39 = 438;
        v40 = 2080;
        *(_QWORD *)v41 = v35;
        *(_WORD *)&v41[8] = 2112;
        *(_QWORD *)&v41[10] = v14;
        v42 = 2080;
        v43 = v34;
        v44 = 2112;
        v45 = v30;
        _os_log_impl(&dword_19B733000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionActivationContext : Setting new activation context. Previous: { activationMode(%s), deviceUID(%@) }. Current: { activationMode(%s), deviceUID(%@) }.", v36, 0x3Au);
      }

      goto LABEL_47;
    }
    v24 = -[AVAudioSession opaqueSessionID](self->_audioSession, "opaqueSessionID");
    if (kAVVCScope)
    {
      v25 = *(id *)kAVVCScope;
      if (!v25)
      {
LABEL_53:
        v10 = -[NSObject code](v22, "code");
        goto LABEL_54;
      }
    }
    else
    {
      v25 = MEMORY[0x1E0C81028];
      v31 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v36 = 136315906;
      v37 = "AVVCSessionManager.mm";
      v38 = 1024;
      v39 = 434;
      v40 = 1024;
      *(_DWORD *)v41 = v24;
      *(_WORD *)&v41[4] = 2112;
      *(_QWORD *)&v41[6] = v22;
      _os_log_impl(&dword_19B733000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setActivationContext of sessionID(0x%x) failed with error: %@", v36, 0x22u);
    }

    goto LABEL_53;
  }
  if (!kAVVCScope)
  {
    v19 = (id)MEMORY[0x1E0C81028];
    v26 = MEMORY[0x1E0C81028];
    goto LABEL_40;
  }
  v19 = *(id *)kAVVCScope;
  if (v19)
  {
LABEL_40:
    v22 = v19;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v35, v13);
      CAX4CCString::CAX4CCString((CAX4CCString *)v34, self->mPreviousActivationMode);
      v27 = *p_mPreviousActivationDeviceUID;
      *(_DWORD *)v36 = 136316418;
      v37 = "AVVCSessionManager.mm";
      v38 = 1024;
      v39 = 444;
      v40 = 2080;
      *(_QWORD *)v41 = v35;
      *(_WORD *)&v41[8] = 2112;
      *(_QWORD *)&v41[10] = v14;
      v42 = 2080;
      v43 = v34;
      v44 = 2112;
      v45 = v27;
      _os_log_impl(&dword_19B733000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionActivationContext : No change - not setting activationMode and deviceUID. Previous: { activationMode(%s), deviceUID(%@) }. Current: { activationMode(%s), deviceUID(%@) }. No op.", v36, 0x3Au);
    }

    goto LABEL_48;
  }
  v10 = 0;
LABEL_55:

  if (v5)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
LABEL_58:

  return v10;
}

- (void)shouldEnableMiniDucking:(BOOL)a3 withOptions:(unint64_t)a4
{
  char v4;
  _BOOL4 v5;
  NSObject *v7;
  id v8;
  int v9;
  recursive_mutex *p_mSessionManagerLock;
  NSObject *v11;
  BOOL mShouldEnableMiniDucking;
  BOOL *p_mShouldDisableMiniDucking;
  int64_t mPreviousActivationMode;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v4 = a4;
  v5 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
    return;
  if (MGGetSInt32Answer() != 4 && !self->mDeviceIsIOSAccessory)
  {
    ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager shouldEnableMiniDucking:withOptions:]", "shouldEnableMiniDucking", 0);
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v9 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    if (self->mIsMiniDuckingEnabled == v5)
    {
      if (kAVVCScope)
      {
        v11 = *(id *)kAVVCScope;
        if (!v11)
          goto LABEL_44;
      }
      else
      {
        v11 = MEMORY[0x1E0C81028];
        v19 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315394;
        v21 = "AVVCSessionManager.mm";
        v22 = 1024;
        v23 = 473;
        _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d shouldEnableMiniDucking: No change, no-op", (uint8_t *)&v20, 0x12u);
      }

      goto LABEL_44;
    }
    if (v5)
    {
      mShouldEnableMiniDucking = 1;
      self->mShouldEnableMiniDucking = 1;
      p_mShouldDisableMiniDucking = &self->mShouldDisableMiniDucking;
    }
    else
    {
      mShouldEnableMiniDucking = self->mShouldEnableMiniDucking;
      if (!mShouldEnableMiniDucking)
      {
LABEL_43:
        self->mIsMiniDuckingEnabled = mShouldEnableMiniDucking;
LABEL_44:
        if (v9)
          std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
        ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
        return;
      }
      *(_WORD *)&self->mShouldEnableMiniDucking = 256;
      p_mShouldDisableMiniDucking = &self->mShouldDisableMiniDucking;
      mPreviousActivationMode = self->mPreviousActivationMode;
      v16 = mPreviousActivationMode == 1987012963 || mPreviousActivationMode == 1751414371;
      if ((v4 & 1) != 0 && v16)
      {
        CALog::LogObjIfEnabled(3, kAVVCScope);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 136315394;
          v21 = "AVVCSessionManager.mm";
          v22 = 1024;
          v23 = 491;
          _os_log_impl(&dword_19B733000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d shouldEnableMiniDucking: Announce calls enabled. Will not set session properties while disabling miniDucking", (uint8_t *)&v20, 0x12u);
        }

      }
      else
      {
        -[AVVCSessionManager setSessionCategoryModeOptionsForActivationMode:withOptions:](self, "setSessionCategoryModeOptionsForActivationMode:withOptions:");
        -[AVVCSessionManager setSessionAudioHWControlFlagsForActivationMode:withOptions:](self, "setSessionAudioHWControlFlagsForActivationMode:withOptions:", self->mPreviousActivationMode, 0);
      }
      mShouldEnableMiniDucking = 0;
    }
    *p_mShouldDisableMiniDucking = 0;
    goto LABEL_43;
  }
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      return;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "AVVCSessionManager.mm";
    v26 = 1024;
    v27 = 464;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d shouldEnableMiniDucking not available on this device", buf, 0x12u);
  }

}

- (BOOL)isMiniDuckingEnabled
{
  recursive_mutex *p_mSessionManagerLock;
  _BOOL4 mIsMiniDuckingEnabled;

  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    mIsMiniDuckingEnabled = self->mIsMiniDuckingEnabled;
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    return self->mIsMiniDuckingEnabled;
  }
  return mIsMiniDuckingEnabled;
}

- (void)getHypotheticalRouteAndUpdateStates
{
  void *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  _BOOL4 mIsOtherAudioPlaying;
  void *v9;
  void *v10;
  BOOL v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  _BOOL4 mShouldDuckOthers;
  _BOOL4 mSessionNeedsVolumeControl;
  NSObject *v17;
  id v18;
  _BOOL4 mOutputSupportsSWVolume;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _QWORD v25[2];
  _BYTE v26[160];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    ElapsedTime::ElapsedTime((ElapsedTime *)v26, "-[AVVCSessionManager getHypotheticalRouteAndUpdateStates]", "getHypotheticalRouteAndUpdateStates", 0);
    -[AVAudioSession pickedRoute](self->_audioSession, "pickedRoute");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (kAVVCScope)
    {
      v4 = *(id *)kAVVCScope;
      if (!v4)
        goto LABEL_11;
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315650;
      v21 = "AVVCSessionManager.mm";
      v22 = 1024;
      v23 = 526;
      v24 = 2112;
      v25[0] = v3;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d pickedRoute from AudioSession: %@", (uint8_t *)&v20, 0x1Cu);
    }

LABEL_11:
    self->mIsOtherAudioPlaying = -[AVAudioSession isOtherAudioPlaying](self->_audioSession, "isOtherAudioPlaying");
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_18;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      mIsOtherAudioPlaying = self->mIsOtherAudioPlaying;
      v20 = 136315650;
      v21 = "AVVCSessionManager.mm";
      v22 = 1024;
      v23 = 529;
      v24 = 1024;
      LODWORD(v25[0]) = mIsOtherAudioPlaying;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d isSomeOtherAudioPlaying: %d", (uint8_t *)&v20, 0x18u);
    }

LABEL_18:
    objc_msgSend(v3, "objectForKey:", CFSTR("BTDetails_SupportsDoAP"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->mRouteHasDoAPSupport = objc_msgSend(v9, "BOOLValue");

    if (_os_feature_enabled_impl())
      objc_msgSend(v3, "objectForKey:", CFSTR("SoftwareVolumeEnabled"));
    else
      objc_msgSend(v3, "objectForKey:", CFSTR("BTDetails_SupportsSoftwareVolume"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->mOutputSupportsSWVolume = objc_msgSend(v10, "BOOLValue");

    if (self->mIsOtherAudioPlaying)
    {
      if (!self->mRouteHasDoAPSupport)
      {
        if (_os_feature_enabled_impl())
        {
          self->mShouldDuckOthers = self->mOutputSupportsSWVolume;
          if (kAVVCScope)
          {
            v17 = *(id *)kAVVCScope;
            if (!v17)
              goto LABEL_29;
          }
          else
          {
            v17 = MEMORY[0x1E0C81028];
            v18 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            mOutputSupportsSWVolume = self->mOutputSupportsSWVolume;
            v20 = 136315650;
            v21 = "AVVCSessionManager.mm";
            v22 = 1024;
            v23 = 551;
            v24 = 1024;
            LODWORD(v25[0]) = mOutputSupportsSWVolume;
            _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Non-BT route OutputSupportsVolume: %d", (uint8_t *)&v20, 0x18u);
          }

          goto LABEL_29;
        }
        self->mShouldDuckOthers = 0;
LABEL_29:
        v11 = 1;
LABEL_30:
        self->mSessionNeedsVolumeControl = v11;
        if (kAVVCScope)
        {
          v13 = *(id *)kAVVCScope;
          if (!v13)
          {
LABEL_37:

            ElapsedTime::~ElapsedTime((ElapsedTime *)v26);
            return;
          }
        }
        else
        {
          v13 = MEMORY[0x1E0C81028];
          v14 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          mShouldDuckOthers = self->mShouldDuckOthers;
          mSessionNeedsVolumeControl = self->mSessionNeedsVolumeControl;
          v20 = 136315906;
          v21 = "AVVCSessionManager.mm";
          v22 = 1024;
          v23 = 594;
          v24 = 1024;
          LODWORD(v25[0]) = mShouldDuckOthers;
          WORD2(v25[0]) = 1024;
          *(_DWORD *)((char *)v25 + 6) = mSessionNeedsVolumeControl;
          _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d shouldDuckOthers(%d), sessionNeedsVolumeControl(%d)", (uint8_t *)&v20, 0x1Eu);
        }

        goto LABEL_37;
      }
      if (self->mShouldEnableMiniDucking)
      {
        self->mShouldDuckOthers = 1;
        v11 = self->mOutputSupportsSWVolume;
        goto LABEL_30;
      }
    }
    else if (self->_sessionState == 7)
    {
      v12 = (LOBYTE(self->mPreviousSessionCategoryOptions) >> 1) & 1;
LABEL_28:
      self->mShouldDuckOthers = v12;
      goto LABEL_29;
    }
    LOBYTE(v12) = self->mOutputSupportsSWVolume;
    goto LABEL_28;
  }
}

- (int)setSessionCategoryModeOptionsForActivationMode:(int64_t)a3 withOptions:(unint64_t)a4
{
  char v4;
  int v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  id v12;
  int v13;
  id v14;
  id v15;
  _BOOL4 mShouldDuckOthers;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  _BOOL4 v25;
  id v26;
  id v27;
  id v28;
  _BOOL4 v30;
  id v31;
  id v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  NSString *mPreviousSessionCategory;
  NSString *mPreviousSessionMode;
  unint64_t mPreviousSessionCategoryOptions;
  int64_t mPreviousActivationMode;
  AVAudioSession *audioSession;
  BOOL v44;
  NSObject *v45;
  NSObject *v46;
  id v47;
  NSString *v48;
  NSString *v49;
  unint64_t v50;
  int64_t v51;
  id v52;
  NSString *v53;
  NSString *v54;
  unint64_t v55;
  int64_t v56;
  AVAudioSession *v57;
  char v58;
  NSObject *v59;
  NSObject *v60;
  id v61;
  id v62;
  AVAudioSession *v63;
  char v64;
  NSObject *v65;
  NSObject *v66;
  id v67;
  recursive_mutex *p_mSessionManagerLock;
  std::recursive_mutex *v70;
  NSObject *v71;
  id v72;
  id v73;
  uint8_t v74[4];
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  _BYTE v79[24];
  __int16 v80;
  _BYTE v81[10];
  NSString *v82;
  __int16 v83;
  int v84;
  __int16 v85;
  int v86;
  __int16 v87;
  int v88;
  uint8_t v89[16];
  uint8_t buf[4];
  const char *v91;
  __int16 v92;
  int v93;
  __int16 v94;
  const char *v95;
  __int16 v96;
  int v97;
  uint64_t v98;

  v4 = a4;
  v98 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v9 = *(id *)kAVVCScope;
      if (!v9)
        return 0;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v91 = "AVVCSessionManager.mm";
      v92 = 1024;
      v93 = 609;
      v94 = 2080;
      v95 = "setSessionCategoryModeOptionsForActivationMode";
      v96 = 1024;
      v97 = 0;
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    return 0;
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setSessionCategoryModeOptionsForActivationMode:withOptions:]", "setSessionCategoryModeOptionsFromActivationMode", 0);
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v7 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (self->mDeviceIsIOSAccessory)
  {
    self->mShouldDuckOthers = 1;
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_40;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v74 = 136315394;
      v75 = "AVVCSessionManager.mm";
      v76 = 1024;
      v77 = 624;
      v11 = "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: on 'audioOS'. Duck others.";
LABEL_38:
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, v11, v74, 0x12u);
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  if (!self->mDeviceIsOlderWatch)
  {
    if (!-[AVVCSessionManager isSessionOutputInWirelessSplitterMode](self, "isSessionOutputInWirelessSplitterMode", p_mSessionManagerLock))
    {
      -[AVVCSessionManager getHypotheticalRouteAndUpdateStates](self, "getHypotheticalRouteAndUpdateStates");
      goto LABEL_40;
    }
    self->mShouldDuckOthers = 0;
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_39;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v74 = 136315394;
      v75 = "AVVCSessionManager.mm";
      v76 = 1024;
      v77 = 634;
      v11 = "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: (wireless splitter mode). Interrupt others.";
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  self->mShouldDuckOthers = 0;
  if (!kAVVCScope)
  {
    v8 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
LABEL_32:
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v74 = 136315394;
      v75 = "AVVCSessionManager.mm";
      v76 = 1024;
      v77 = 629;
      v11 = "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: on older watchOS. Interrupt others.";
      goto LABEL_38;
    }
LABEL_39:

    goto LABEL_40;
  }
  v8 = *(id *)kAVVCScope;
  if (v8)
    goto LABEL_32;
LABEL_40:
  mShouldDuckOthers = self->mShouldDuckOthers;
  if (a3 > 1768764004)
  {
    if (a3 != 1768764005 && a3 != 1768780647)
      goto LABEL_54;
    v17 = (id)*MEMORY[0x1E0CFEFC0];
    v18 = (id)*MEMORY[0x1E0CFF0E8];
    if (kAVVCScope)
    {
      v20 = *(id *)kAVVCScope;
      if (!v20)
      {
LABEL_66:
        v25 = 0;
        v22 = 1;
        v21 = 12;
        goto LABEL_78;
      }
    }
    else
    {
      v20 = MEMORY[0x1E0C81028];
      v26 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v74 = 136315394;
      v75 = "AVVCSessionManager.mm";
      v76 = 1024;
      v77 = 680;
      _os_log_impl(&dword_19B733000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: iMessage -- setting P&R category, clearing preferred input, etc.", v74, 0x12u);
    }

    goto LABEL_66;
  }
  if (a3 != 1651797093)
  {
    if (a3 == 1752396914)
    {
      v17 = (id)*MEMORY[0x1E0CFEFC0];
      v18 = (id)*MEMORY[0x1E0CFF0B8];
      if (kAVVCScope)
      {
        v19 = *(id *)kAVVCScope;
        if (!v19)
        {
LABEL_71:
          v22 = 0;
          v25 = 0;
LABEL_72:
          v21 = 4;
          goto LABEL_78;
        }
      }
      else
      {
        v19 = MEMORY[0x1E0C81028];
        v27 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v74 = 136315394;
        v75 = "AVVCSessionManager.mm";
        v76 = 1024;
        v77 = 659;
        _os_log_impl(&dword_19B733000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: Interrupt other audio during Siri Training", v74, 0x12u);
      }

      goto LABEL_71;
    }
LABEL_54:
    if (!self->mDeviceIsIOSAccessory && !self->mDeviceIsOlderWatch && supportsCarPlayMixableStream())
    {
      CALog::LogObjIfEnabled(3, kAVVCScope);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v74 = 136315394;
        v75 = "AVVCSessionManager.mm";
        v76 = 1024;
        v77 = 688;
        _os_log_impl(&dword_19B733000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: Carplay Supports Mixable Siri", v74, 0x12u);
      }

      mShouldDuckOthers = 1;
    }
    v17 = (id)*MEMORY[0x1E0CFEFC0];
    v18 = (id)*MEMORY[0x1E0CFF0B8];
    v22 = 0;
    v25 = mShouldDuckOthers;
    goto LABEL_72;
  }
  v17 = (id)*MEMORY[0x1E0CFEFC8];
  v18 = (id)*MEMORY[0x1E0CFF078];
  if (!kAVVCScope)
  {
    v21 = MEMORY[0x1E0C81028];
    v28 = MEMORY[0x1E0C81028];
    goto LABEL_74;
  }
  v21 = (unint64_t)*(id *)kAVVCScope;
  if (v21)
  {
LABEL_74:
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v74 = 136315394;
      v75 = "AVVCSessionManager.mm";
      v76 = 1024;
      v77 = 670;
      _os_log_impl(&dword_19B733000, (os_log_t)v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: ATV Activation  -- setting Playback category and Duck/Mix Options.", v74, 0x12u);
    }

    v22 = 0;
    v21 = 0;
    goto LABEL_77;
  }
  v22 = 0;
LABEL_77:
  v25 = 1;
LABEL_78:
  v30 = a3 == 1987012963 || a3 == 1751414371;
  if ((v4 & 1) != 0 && v30)
  {
    if (kAVVCScope)
    {
      v31 = *(id *)kAVVCScope;
      if (!v31)
        goto LABEL_95;
    }
    else
    {
      v31 = (id)MEMORY[0x1E0C81028];
      v32 = MEMORY[0x1E0C81028];
    }
    v33 = v31;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v89, a3);
      *(_DWORD *)v74 = 136315650;
      v75 = "AVVCSessionManager.mm";
      v76 = 1024;
      v77 = 713;
      v78 = 2080;
      *(_QWORD *)v79 = v89;
      _os_log_impl(&dword_19B733000, v33, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: announce mode for %s context - duck others", v74, 0x1Cu);
    }

    goto LABEL_95;
  }
  if (v25)
LABEL_95:
    v21 |= 0x13uLL;
  v34 = -[NSString isEqualToString:](self->mPreviousSessionCategory, "isEqualToString:", v17, p_mSessionManagerLock);
  if ((v34 & -[NSString isEqualToString:](self->mPreviousSessionMode, "isEqualToString:", v18) & 1) == 0)
  {
    if (kAVVCScope)
    {
      v36 = *(id *)kAVVCScope;
      if (!v36)
      {
LABEL_111:
        audioSession = self->_audioSession;
        v73 = 0;
        v44 = -[AVAudioSession setCategory:mode:routeSharingPolicy:options:error:](audioSession, "setCategory:mode:routeSharingPolicy:options:error:", v17, v18, 0, v21, &v73);
        v45 = v73;
        v35 = v45;
        if (v44)
        {
          objc_storeStrong((id *)&self->mPreviousSessionCategory, v17);
          objc_storeStrong((id *)&self->mPreviousSessionMode, v18);
LABEL_126:
          v13 = 0;
          self->mPreviousSessionCategoryOptions = v21;
          goto LABEL_138;
        }
        v13 = -[NSObject code](v45, "code");
        if (kAVVCScope)
        {
          v46 = *(id *)kAVVCScope;
          if (!v46)
            goto LABEL_138;
        }
        else
        {
          v46 = MEMORY[0x1E0C81028];
          v61 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v74 = 136315650;
          v75 = "AVVCSessionManager.mm";
          v76 = 1024;
          v77 = 743;
          v78 = 2112;
          *(_QWORD *)v79 = v35;
          _os_log_impl(&dword_19B733000, v46, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setSessionCategoryModeOptions: setCategoryModeRouteSharingPolicyOptions failed with error: %@", v74, 0x1Cu);
        }

        goto LABEL_138;
      }
    }
    else
    {
      v36 = MEMORY[0x1E0C81028];
      v38 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      mPreviousSessionCategory = self->mPreviousSessionCategory;
      mPreviousSessionMode = self->mPreviousSessionMode;
      mPreviousSessionCategoryOptions = self->mPreviousSessionCategoryOptions;
      mPreviousActivationMode = self->mPreviousActivationMode;
      *(_DWORD *)v74 = 136317442;
      v75 = "AVVCSessionManager.mm";
      v76 = 1024;
      v77 = 734;
      v78 = 2112;
      *(_QWORD *)v79 = v17;
      *(_WORD *)&v79[8] = 2112;
      *(_QWORD *)&v79[10] = v18;
      *(_WORD *)&v79[18] = 1024;
      *(_DWORD *)&v79[20] = v21;
      v80 = 2112;
      *(_QWORD *)v81 = mPreviousSessionCategory;
      *(_WORD *)&v81[8] = 2112;
      v82 = mPreviousSessionMode;
      v83 = 1024;
      v84 = mPreviousSessionCategoryOptions;
      v85 = 1024;
      v86 = a3;
      v87 = 1024;
      v88 = mPreviousActivationMode;
      _os_log_impl(&dword_19B733000, v36, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: Setting new category: %@, mode: %@, options: 0x%x. Previous category: %@, mode: %@, options: 0x%x. (Current activation: %d, Previous activation: %d)", v74, 0x52u);
    }

    goto LABEL_111;
  }
  if (self->mPreviousSessionCategoryOptions == v21)
  {
    if (kAVVCScope)
    {
      v35 = *(id *)kAVVCScope;
      if (!v35)
      {
LABEL_120:
        v13 = 0;
        goto LABEL_138;
      }
    }
    else
    {
      v35 = MEMORY[0x1E0C81028];
      v47 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v48 = self->mPreviousSessionCategory;
      v49 = self->mPreviousSessionMode;
      v50 = self->mPreviousSessionCategoryOptions;
      v51 = self->mPreviousActivationMode;
      *(_DWORD *)v74 = 136316674;
      v75 = "AVVCSessionManager.mm";
      v76 = 1024;
      v77 = 764;
      v78 = 2112;
      *(_QWORD *)v79 = v48;
      *(_WORD *)&v79[8] = 2112;
      *(_QWORD *)&v79[10] = v49;
      *(_WORD *)&v79[18] = 1024;
      *(_DWORD *)&v79[20] = v50;
      v80 = 1024;
      *(_DWORD *)v81 = a3;
      *(_WORD *)&v81[4] = 1024;
      *(_DWORD *)&v81[6] = v51;
      _os_log_impl(&dword_19B733000, v35, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: No change - category, mode and options are the same. No op. Current category: %@, mode: %@, options: 0x%x. (Current activation: %d, Previous activation: %d)", v74, 0x38u);
    }

    v35 = 0;
    goto LABEL_120;
  }
  if (!kAVVCScope)
  {
    v37 = MEMORY[0x1E0C81028];
    v52 = MEMORY[0x1E0C81028];
    goto LABEL_122;
  }
  v37 = *(id *)kAVVCScope;
  if (v37)
  {
LABEL_122:
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v53 = self->mPreviousSessionCategory;
      v54 = self->mPreviousSessionMode;
      v55 = self->mPreviousSessionCategoryOptions;
      v56 = self->mPreviousActivationMode;
      *(_DWORD *)v74 = 136316930;
      v75 = "AVVCSessionManager.mm";
      v76 = 1024;
      v77 = 754;
      v78 = 1024;
      *(_DWORD *)v79 = v21;
      *(_WORD *)&v79[4] = 2112;
      *(_QWORD *)&v79[6] = v53;
      *(_WORD *)&v79[14] = 2112;
      *(_QWORD *)&v79[16] = v54;
      v80 = 1024;
      *(_DWORD *)v81 = v55;
      *(_WORD *)&v81[4] = 1024;
      *(_DWORD *)&v81[6] = a3;
      LOWORD(v82) = 1024;
      *(_DWORD *)((char *)&v82 + 2) = v56;
      _os_log_impl(&dword_19B733000, v37, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: Setting new options: 0x%x. Previous category: %@, mode: %@, options: 0x%x. (Current activation: %d, Previous activation: %d)", v74, 0x3Eu);
    }

  }
  v57 = self->_audioSession;
  v72 = 0;
  v58 = -[AVAudioSession setCategoryOptions:error:](v57, "setCategoryOptions:error:", v21, &v72);
  v59 = v72;
  v35 = v59;
  if ((v58 & 1) != 0)
    goto LABEL_126;
  v13 = -[NSObject code](v59, "code");
  if (kAVVCScope)
  {
    v60 = *(id *)kAVVCScope;
    if (!v60)
      goto LABEL_138;
  }
  else
  {
    v60 = MEMORY[0x1E0C81028];
    v62 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v74 = 136315650;
    v75 = "AVVCSessionManager.mm";
    v76 = 1024;
    v77 = 757;
    v78 = 2112;
    *(_QWORD *)v79 = v35;
    _os_log_impl(&dword_19B733000, v60, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setSessionCategoryModeOptions: setCategoryOptions failed with error: %@", v74, 0x1Cu);
  }

LABEL_138:
  if (v22)
  {
    v63 = self->_audioSession;
    v71 = v35;
    v64 = -[AVAudioSession clearInputPreferences:](v63, "clearInputPreferences:", &v71);
    v65 = v71;

    if ((v64 & 1) == 0)
    {
      v13 = -[NSObject code](v65, "code");
      if (kAVVCScope)
      {
        v66 = *(id *)kAVVCScope;
        if (!v66)
          goto LABEL_148;
      }
      else
      {
        v66 = MEMORY[0x1E0C81028];
        v67 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v74 = 136315650;
        v75 = "AVVCSessionManager.mm";
        v76 = 1024;
        v77 = 770;
        v78 = 2112;
        *(_QWORD *)v79 = v65;
        _os_log_impl(&dword_19B733000, v66, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::clearInputPreferences failed with error: %@", v74, 0x1Cu);
      }

    }
  }
  else
  {
    v65 = v35;
  }
LABEL_148:

  if (v7)
    std::recursive_mutex::unlock(v70);
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  return v13;
}

- (int)setSessionAudioHWControlFlagsForActivationMode:(int64_t)a3 withOptions:(unint64_t)a4
{
  char v4;
  int v7;
  recursive_mutex *p_mSessionManagerLock;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  AVAudioSession *audioSession;
  char v13;
  uint8_t *v14;
  uint8_t *v15;
  int v16;
  id v17;
  id v18;
  uint8_t *v19;
  AVAudioSession *v20;
  char v21;
  uint8_t *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  unsigned int mSessionActivationOptions;
  unsigned int v28;
  id v29;
  id v30;
  _BOOL4 v33;
  AVAudioSession *v34;
  char v35;
  uint8_t *v36;
  uint8_t *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  AVAudioSession *v41;
  char v42;
  uint8_t *v43;
  uint8_t *v44;
  NSObject *v45;
  NSObject *v46;
  AVAudioSession *v47;
  char v48;
  uint8_t *v49;
  uint8_t *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  AVAudioSession *v55;
  char v56;
  uint8_t *v57;
  uint8_t *v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  _BOOL4 mSessionNeedsVolumeControl;
  void *v67;
  void *v68;
  _BOOL4 v69;
  NSObject *v70;
  NSObject *v71;
  unint64_t v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  const char *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  AVAudioSession *v83;
  char v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  uint8_t v95[16];
  uint8_t v96[4];
  const char *v97;
  __int16 v98;
  int v99;
  __int16 v100;
  uint8_t *v101;
  uint8_t buf[4];
  const char *v103;
  __int16 v104;
  int v105;
  __int16 v106;
  const char *v107;
  __int16 v108;
  int v109;
  uint64_t v110;

  v4 = a4;
  v110 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setSessionAudioHWControlFlagsForActivationMode:withOptions:]", "setSessionAudioHWControlFlagsFromActivationMode", 0);
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v7 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    if (MGGetSInt32Answer() == 4 && (MGGetBoolAnswer() & 1) == 0)
    {
      if (IsPluginActivationContext(a3))
      {
        if (self->mPreviousHardwareControlFlags == 0x100000)
          goto LABEL_112;
        audioSession = self->_audioSession;
        v94 = 0;
        v13 = -[AVAudioSession setAudioHardwareControlFlags:error:](audioSession, "setAudioHardwareControlFlags:error:", 0x100000, &v94);
        v14 = (uint8_t *)v94;
        v15 = v14;
        if ((v13 & 1) != 0)
        {
          v16 = 0;
          self->mPreviousHardwareControlFlags = 0x100000;
        }
        else
        {
          v16 = -[uint8_t code](v14, "code");
          CALog::LogObjIfEnabled(1, kAVVCScope);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v38 && os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v96 = 136315650;
            v97 = "AVVCSessionManager.mm";
            v98 = 1024;
            v99 = 826;
            v100 = 2112;
            v101 = v15;
            _os_log_impl(&dword_19B733000, v39, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags (ATV + Plugin) : %@", v96, 0x1Cu);
          }

        }
        goto LABEL_66;
      }
      self->mSessionActivationOptions &= ~0x4000u;
      if (kAVVCScope)
      {
        v23 = *(id *)kAVVCScope;
        if (!v23)
          goto LABEL_112;
      }
      else
      {
        v23 = MEMORY[0x1E0C81028];
        v29 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v96 = 136315394;
        v97 = "AVVCSessionManager.mm";
        v98 = 1024;
        v99 = 833;
        _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setSessionAudioHWControlFlags: Take Audio HW control on tvOS", v96, 0x12u);
      }
    }
    else
    {
      if (self->mDeviceIsIOSAccessory)
      {
        if (kAVVCScope)
        {
          v9 = *(id *)kAVVCScope;
          if (!v9)
            goto LABEL_34;
        }
        else
        {
          v9 = MEMORY[0x1E0C81028];
          v18 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v96 = 136315394;
          v97 = "AVVCSessionManager.mm";
          v98 = 1024;
          v99 = 844;
          _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setSessionAudioHWControlFlags: iOS Audio Accessory Product (HomePod), setting volume desired HW control flag.", v96, 0x12u);
        }

LABEL_34:
        if (self->mPreviousHardwareControlFlags == 0x100000)
        {
          v19 = 0;
          v16 = 0;
        }
        else
        {
          v20 = self->_audioSession;
          v93 = 0;
          v21 = -[AVAudioSession setAudioHardwareControlFlags:error:](v20, "setAudioHardwareControlFlags:error:", 0x100000, &v93);
          v22 = (uint8_t *)v93;
          v19 = v22;
          if ((v21 & 1) == 0)
          {
            v16 = -[uint8_t code](v22, "code");
            if (kAVVCScope)
            {
              v24 = *(id *)kAVVCScope;
              if (!v24)
                goto LABEL_65;
            }
            else
            {
              v24 = MEMORY[0x1E0C81028];
              v30 = MEMORY[0x1E0C81028];
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v96 = 136315650;
              v97 = "AVVCSessionManager.mm";
              v98 = 1024;
              v99 = 850;
              v100 = 2112;
              v101 = v19;
              _os_log_impl(&dword_19B733000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags (HomePod) : %@", v96, 0x1Cu);
            }

            goto LABEL_65;
          }
          v16 = 0;
          self->mPreviousHardwareControlFlags = 0x100000;
        }
LABEL_65:
        self->mSessionActivationOptions &= ~0x4000u;

        goto LABEL_66;
      }
      if (self->mDeviceIsOlderWatch)
      {
        if (kAVVCScope)
        {
          v11 = *(id *)kAVVCScope;
          if (!v11)
            goto LABEL_52;
        }
        else
        {
          v11 = MEMORY[0x1E0C81028];
          v26 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v96 = 136315394;
          v97 = "AVVCSessionManager.mm";
          v98 = 1024;
          v99 = 863;
          _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags on older watch hardware: will never take control of HW on activation", v96, 0x12u);
        }

LABEL_52:
        mSessionActivationOptions = self->mSessionActivationOptions;
        v16 = 0;
        if (a3 == 1768780647)
          v28 = mSessionActivationOptions & 0xFFFFBFFF;
        else
          v28 = mSessionActivationOptions | 0x4000;
        self->mSessionActivationOptions = v28;
        if (!v7)
          goto LABEL_68;
        goto LABEL_67;
      }
      if (self->mSessionOutputIsWirelessSplitter)
      {
        if (kAVVCScope)
        {
          v25 = *(id *)kAVVCScope;
          if (!v25)
          {
LABEL_90:
            self->mSessionActivationOptions &= ~0x4000u;
            if (self->mPreviousHardwareControlFlags == 2)
              goto LABEL_112;
            v41 = self->_audioSession;
            v92 = 0;
            v42 = -[AVAudioSession setAudioHardwareControlFlags:error:](v41, "setAudioHardwareControlFlags:error:", 2, &v92);
            v43 = (uint8_t *)v92;
            v44 = v43;
            if ((v42 & 1) != 0)
            {
              self->mPreviousHardwareControlFlags = 2;

              goto LABEL_112;
            }
            v16 = -[uint8_t code](v43, "code");
            CALog::LogObjIfEnabled(1, kAVVCScope);
            v51 = objc_claimAutoreleasedReturnValue();
            v52 = v51;
            if (v51 && os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v96 = 136315650;
              v97 = "AVVCSessionManager.mm";
              v98 = 1024;
              v99 = 880;
              v100 = 2112;
              v101 = v44;
              _os_log_impl(&dword_19B733000, v52, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags (wireless splitter) : %@", v96, 0x1Cu);
            }

LABEL_66:
            if (!v7)
            {
LABEL_68:
              ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
              return v16;
            }
LABEL_67:
            std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
            goto LABEL_68;
          }
        }
        else
        {
          v25 = MEMORY[0x1E0C81028];
          v40 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v96 = 136315394;
          v97 = "AVVCSessionManager.mm";
          v98 = 1024;
          v99 = 873;
          _os_log_impl(&dword_19B733000, v25, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: wireless splitter mode, no volume control, yes routing control.", v96, 0x12u);
        }

        goto LABEL_90;
      }
      v33 = a3 == 1987012963 || a3 == 1751414371;
      if ((v4 & 1) != 0 && v33)
      {
        if (self->mPreviousHardwareControlFlags)
        {
          v34 = self->_audioSession;
          v91 = 0;
          v35 = -[AVAudioSession setAudioHardwareControlFlags:error:](v34, "setAudioHardwareControlFlags:error:", 0, &v91);
          v36 = (uint8_t *)v91;
          v37 = v36;
          if ((v35 & 1) != 0)
          {
            v16 = 0;
            self->mPreviousHardwareControlFlags = 0;
          }
          else
          {
            v16 = -[uint8_t code](v36, "code");
            CALog::LogObjIfEnabled(1, kAVVCScope);
            v59 = objc_claimAutoreleasedReturnValue();
            v60 = v59;
            if (v59 && os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v96 = 136315650;
              v97 = "AVVCSessionManager.mm";
              v98 = 1024;
              v99 = 899;
              v100 = 2112;
              v101 = v37;
              _os_log_impl(&dword_19B733000, v60, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags : %@", v96, 0x1Cu);
            }

          }
        }
        else
        {
          v37 = 0;
          v16 = 0;
        }
        CALog::LogObjIfEnabled(3, kAVVCScope);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v61;
        if (v61)
        {
          v63 = v61;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            CAX4CCString::CAX4CCString((CAX4CCString *)v95, a3);
            *(_DWORD *)v96 = 136315650;
            v97 = "AVVCSessionManager.mm";
            v98 = 1024;
            v99 = 904;
            v100 = 2080;
            v101 = v95;
            _os_log_impl(&dword_19B733000, v63, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setAudioHardwareControlFlags: announce mode for %s context - set HW control flags to 0", v96, 0x1Cu);
          }

        }
        goto LABEL_66;
      }
      if (self->mShouldEnableMiniDucking)
      {
        CALog::LogObjIfEnabled(3, kAVVCScope);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if (v45 && os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v96 = 136315394;
          v97 = "AVVCSessionManager.mm";
          v98 = 1024;
          v99 = 909;
          _os_log_impl(&dword_19B733000, v46, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: mini-ducking enabled. Not setting volume control flag", v96, 0x12u);
        }

        if (self->mPreviousHardwareControlFlags != 2)
        {
          v47 = self->_audioSession;
          v90 = 0;
          v48 = -[AVAudioSession setAudioHardwareControlFlags:error:](v47, "setAudioHardwareControlFlags:error:", 2, &v90);
          v49 = (uint8_t *)v90;
          v50 = v49;
          if ((v48 & 1) == 0)
          {
            v16 = -[uint8_t code](v49, "code");
            CALog::LogObjIfEnabled(1, kAVVCScope);
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = v64;
            if (v64 && os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v96 = 136315650;
              v97 = "AVVCSessionManager.mm";
              v98 = 1024;
              v99 = 915;
              v100 = 2112;
              v101 = v50;
              _os_log_impl(&dword_19B733000, v65, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags (enable mini-ducking) : %@", v96, 0x1Cu);
            }

            goto LABEL_66;
          }
          self->mPreviousHardwareControlFlags = 2;

        }
        goto LABEL_112;
      }
      if (self->mShouldDisableMiniDucking)
      {
        CALog::LogObjIfEnabled(3, kAVVCScope);
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (v53 && os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v96 = 136315394;
          v97 = "AVVCSessionManager.mm";
          v98 = 1024;
          v99 = 924;
          _os_log_impl(&dword_19B733000, v54, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: disable mini-ducking. Set all HW control flags", v96, 0x12u);
        }

        if (self->mPreviousHardwareControlFlags != 18)
        {
          v55 = self->_audioSession;
          v89 = 0;
          v56 = -[AVAudioSession setAudioHardwareControlFlags:error:](v55, "setAudioHardwareControlFlags:error:", 18, &v89);
          v57 = (uint8_t *)v89;
          v58 = v57;
          if ((v56 & 1) == 0)
          {
            v16 = -[uint8_t code](v57, "code");
            CALog::LogObjIfEnabled(1, kAVVCScope);
            v73 = objc_claimAutoreleasedReturnValue();
            v74 = v73;
            if (v73 && os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v96 = 136315650;
              v97 = "AVVCSessionManager.mm";
              v98 = 1024;
              v99 = 931;
              v100 = 2112;
              v101 = v58;
              _os_log_impl(&dword_19B733000, v74, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags (disable mini-ducking) : %@", v96, 0x1Cu);
            }

            goto LABEL_66;
          }
          self->mPreviousHardwareControlFlags = 18;

        }
LABEL_112:
        v16 = 0;
        if (!v7)
          goto LABEL_68;
        goto LABEL_67;
      }
      mSessionNeedsVolumeControl = self->mSessionNeedsVolumeControl;
      if (a3 == 1651795060)
      {
        if (self->mSessionNeedsVolumeControl)
        {
LABEL_167:
          v72 = 18;
          goto LABEL_168;
        }
        goto LABEL_156;
      }
      if (a3 == 1987012963)
      {
        -[AVAudioSession currentRoute](self->_audioSession, "currentRoute");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "outputs");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = -[AVVCSessionManager isAirplayOneOfTheOutputRoutes:](self, "isAirplayOneOfTheOutputRoutes:", v68);

        if (v69)
        {
          self->mSessionActivationOptions |= 0x4000u;
          CALog::LogObjIfEnabled(3, kAVVCScope);
          v70 = objc_claimAutoreleasedReturnValue();
          v71 = v70;
          if (v70 && os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v96 = 136315394;
            v97 = "AVVCSessionManager.mm";
            v98 = 1024;
            v99 = 965;
            _os_log_impl(&dword_19B733000, v71, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: will not take control of hardware upon activation for AirPlay output (voic/rais)", v96, 0x12u);
          }

          v72 = 0;
          goto LABEL_168;
        }
        CALog::LogObjIfEnabled(3, kAVVCScope);
        v78 = objc_claimAutoreleasedReturnValue();
        v76 = v78;
        if (!v78 || !os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          goto LABEL_166;
        *(_DWORD *)v96 = 136315394;
        v97 = "AVVCSessionManager.mm";
        v98 = 1024;
        v99 = 973;
        v77 = "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: setting volume/routing required hardware cont"
              "rol flag for 'voic' activation mode (output is not Airplay)";
        goto LABEL_165;
      }
      if ((IsPluginActivationContext(a3) & 1) != 0)
      {
LABEL_141:
        CALog::LogObjIfEnabled(3, kAVVCScope);
        v75 = objc_claimAutoreleasedReturnValue();
        v76 = v75;
        if (mSessionNeedsVolumeControl)
        {
          if (!v75 || !os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            goto LABEL_166;
          *(_DWORD *)v96 = 136315394;
          v97 = "AVVCSessionManager.mm";
          v98 = 1024;
          v99 = 990;
          v77 = "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: (plugin activation context / (post->hdvc) :"
                " set all hw control flags";
LABEL_165:
          _os_log_impl(&dword_19B733000, v76, OS_LOG_TYPE_DEFAULT, v77, v96, 0x12u);
LABEL_166:

          goto LABEL_167;
        }
        if (v75 && os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v96 = 136315394;
          v97 = "AVVCSessionManager.mm";
          v98 = 1024;
          v99 = 993;
          _os_log_impl(&dword_19B733000, v76, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: (plugin activation context / (post->hdvc) : not setting volume control flag", v96, 0x12u);
        }

LABEL_156:
        v72 = 2;
LABEL_168:
        if (v72 == self->mPreviousHardwareControlFlags)
        {
          CALog::LogObjIfEnabled(3, kAVVCScope);
          v81 = objc_claimAutoreleasedReturnValue();
          v82 = v81;
          if (v81 && os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v96 = 136315394;
            v97 = "AVVCSessionManager.mm";
            v98 = 1024;
            v99 = 1028;
            _os_log_impl(&dword_19B733000, v82, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: No change - not setting hardware control flags. No op.", v96, 0x12u);
          }
          v16 = 0;
        }
        else
        {
          v83 = self->_audioSession;
          v88 = 0;
          v84 = -[AVAudioSession setAudioHardwareControlFlags:error:](v83, "setAudioHardwareControlFlags:error:", v72, &v88);
          v85 = v88;
          v82 = v85;
          if ((v84 & 1) != 0)
          {
            v16 = 0;
            self->mPreviousHardwareControlFlags = v72;
          }
          else
          {
            v16 = -[NSObject code](v85, "code");
            CALog::LogObjIfEnabled(1, kAVVCScope);
            v86 = objc_claimAutoreleasedReturnValue();
            v87 = v86;
            if (v86 && os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v96 = 136315650;
              v97 = "AVVCSessionManager.mm";
              v98 = 1024;
              v99 = 1022;
              v100 = 2112;
              v101 = (uint8_t *)v82;
              _os_log_impl(&dword_19B733000, v87, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags : %@", v96, 0x1Cu);
            }

          }
        }

        goto LABEL_66;
      }
      if (a3 != 1635087471)
      {
        if (a3 == 1886352244 && self->mPreviousActivationMode == 1751414371)
          goto LABEL_141;
LABEL_162:
        CALog::LogObjIfEnabled(3, kAVVCScope);
        v80 = objc_claimAutoreleasedReturnValue();
        v76 = v80;
        if (!v80 || !os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          goto LABEL_166;
        *(_DWORD *)v96 = 136315394;
        v97 = "AVVCSessionManager.mm";
        v98 = 1024;
        v99 = 1004;
        v77 = "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: default mode - set all HW control flags";
        goto LABEL_165;
      }
      if (!self->mIsMiniDuckingEnabled)
        goto LABEL_162;
      CALog::LogObjIfEnabled(3, kAVVCScope);
      v79 = objc_claimAutoreleasedReturnValue();
      v23 = v79;
      if (v79 && os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v96 = 136315394;
        v97 = "AVVCSessionManager.mm";
        v98 = 1024;
        v99 = 998;
        _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: post followed by BluetoothVoiceTrigger (or auto context) should not control volume, so not setting any hw control flags.", v96, 0x12u);
      }
    }

    goto LABEL_112;
  }
  if (!kAVVCScope)
  {
    v10 = MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
    goto LABEL_26;
  }
  v10 = *(id *)kAVVCScope;
  if (v10)
  {
LABEL_26:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v103 = "AVVCSessionManager.mm";
      v104 = 1024;
      v105 = 810;
      v106 = 2080;
      v107 = "setSessionAudioHWControlFlagsForActivationMode";
      v108 = 1024;
      v109 = 0;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

  }
  return 0;
}

- (int)setSessionSampleRateForActivationMode:(int64_t)a3
{
  int v5;
  recursive_mutex *p_mSessionManagerLock;
  int v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  AVAudioSession *audioSession;
  BOOL v18;
  id v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  id v24;
  AVAudioSession *v25;
  BOOL v26;
  id v27;
  NSObject *v28;
  id v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  id v33;
  id v35;
  id v36;
  uint8_t v37[4];
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v11 = *(id *)kAVVCScope;
      if (!v11)
        return 0;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v46 = "AVVCSessionManager.mm";
      v47 = 1024;
      v48 = 1043;
      v49 = 2080;
      v50 = "setSessionSampleRateForActivationMode";
      v51 = 1024;
      v52 = 0;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    return 0;
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setSessionSampleRateForActivationMode:]", "setSessionSampleRateForActivationMode", 0);
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v5 = IsSerializationEnabled(void)::enable;
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  v7 = 0;
  if ((IsPluginActivationContext(a3) & 1) != 0 || a3 == 1684108899)
    goto LABEL_61;
  -[AVAudioSession sampleRate](self->_audioSession, "sampleRate");
  v9 = *(_QWORD *)&v8;
  if (a3 == 1986357346)
  {
    if (v8 != 24000.0)
    {
      if (kAVVCScope)
      {
        v10 = *(id *)kAVVCScope;
        if (!v10)
          goto LABEL_37;
      }
      else
      {
        v10 = MEMORY[0x1E0C81028];
        v16 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v37 = 136315394;
        v38 = "AVVCSessionManager.mm";
        v39 = 1024;
        v40 = 1057;
        _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCSessionManager::setSessionSampleRateForActivationMode: forcing 22050k audio for car audio", v37, 0x12u);
      }

LABEL_37:
      audioSession = self->_audioSession;
      v36 = 0;
      v18 = -[AVAudioSession setPreferredSampleRate:error:](audioSession, "setPreferredSampleRate:error:", &v36, 24000.0);
      v19 = v36;
      v15 = v19;
      if (!v18)
      {
        v7 = objc_msgSend(v19, "code");
        CALog::LogObjIfEnabled(1, kAVVCScope);
        v20 = objc_claimAutoreleasedReturnValue();
        v14 = v20;
        if (!v20 || !os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_59;
        *(_DWORD *)v37 = 136315650;
        v38 = "AVVCSessionManager.mm";
        v39 = 1024;
        v40 = 1060;
        v41 = 2112;
        v42 = (uint64_t)v15;
        v21 = "%25s:%-5d ERROR: AVVCSessionManager::setPreferredSampleRate for VehicleButtonPress : %@";
        v22 = v14;
        v23 = 28;
        goto LABEL_50;
      }
      goto LABEL_46;
    }
    if (kAVVCScope)
    {
      v14 = *(id *)kAVVCScope;
      if (!v14)
      {
LABEL_32:
        v15 = 0;
        goto LABEL_46;
      }
    }
    else
    {
      v14 = MEMORY[0x1E0C81028];
      v33 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v37 = 136315394;
      v38 = "AVVCSessionManager.mm";
      v39 = 1024;
      v40 = 1064;
      v30 = "%25s:%-5d AVVCSessionManager::setSessionSampleRateForActivationMode: No change - not setting preferred sample rate. No op.";
      v31 = v14;
      v32 = 18;
      goto LABEL_57;
    }
    goto LABEL_58;
  }
  if (v8 >= 22050.0)
  {
    if (kAVVCScope)
    {
      v14 = *(id *)kAVVCScope;
      if (!v14)
        goto LABEL_32;
    }
    else
    {
      v14 = MEMORY[0x1E0C81028];
      v29 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v37 = 136315650;
      v38 = "AVVCSessionManager.mm";
      v39 = 1024;
      v40 = 1078;
      v41 = 2048;
      v42 = v9;
      v30 = "%25s:%-5d AVVCSessionManager::setSessionSampleRateForActivationMode: SR remains at %f";
      v31 = v14;
      v32 = 28;
LABEL_57:
      _os_log_impl(&dword_19B733000, v31, OS_LOG_TYPE_DEFAULT, v30, v37, v32);
    }
LABEL_58:
    v15 = 0;
    v7 = 0;
    goto LABEL_59;
  }
  if (kAVVCScope)
  {
    v12 = *(id *)kAVVCScope;
    if (!v12)
      goto LABEL_45;
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v24 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v37 = 136315906;
    v38 = "AVVCSessionManager.mm";
    v39 = 1024;
    v40 = 1070;
    v41 = 2048;
    v42 = v9;
    v43 = 2048;
    v44 = 0x40D5888000000000;
    _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionSampleRateForActivationMode: SR changes from %f to %f", v37, 0x26u);
  }

LABEL_45:
  v25 = self->_audioSession;
  v35 = 0;
  v26 = -[AVAudioSession setPreferredSampleRate:error:](v25, "setPreferredSampleRate:error:", &v35, 22050.0);
  v27 = v35;
  v15 = v27;
  if (!v26)
  {
    v7 = objc_msgSend(v27, "code");
    CALog::LogObjIfEnabled(1, kAVVCScope);
    v28 = objc_claimAutoreleasedReturnValue();
    v14 = v28;
    if (!v28 || !os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_59;
    *(_DWORD *)v37 = 136315906;
    v38 = "AVVCSessionManager.mm";
    v39 = 1024;
    v40 = 1074;
    v41 = 2048;
    v42 = 0x40D5888000000000;
    v43 = 2112;
    v44 = (uint64_t)v15;
    v21 = "%25s:%-5d ERROR: AVVCSessionManager::setPreferredSampleRate to %f : %@";
    v22 = v14;
    v23 = 38;
LABEL_50:
    _os_log_impl(&dword_19B733000, v22, OS_LOG_TYPE_ERROR, v21, v37, v23);
LABEL_59:

    goto LABEL_60;
  }
LABEL_46:
  v7 = 0;
LABEL_60:

LABEL_61:
  if (v5)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  return v7;
}

- (int)setSessionBufferSize:(int)a3
{
  int v5;
  NSObject *v6;
  NSObject *v7;
  AVAudioSession *audioSession;
  char v9;
  NSObject *v10;
  int v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  int mPreviousIOBufferFrameSize;
  id v22;
  uint8_t v23[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        return 0;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "AVVCSessionManager.mm";
      v31 = 1024;
      v32 = 1091;
      v33 = 2080;
      v34 = "setSessionBufferSize";
      v35 = 1024;
      v36 = 0;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    return 0;
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setSessionBufferSize:]", "setSessionBufferSize", 0);
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v5 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  if (self->mPreviousIOBufferFrameSize == a3)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
      {
LABEL_29:
        v11 = 0;
        goto LABEL_34;
      }
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v23 = 136315394;
      v24 = "AVVCSessionManager.mm";
      v25 = 1024;
      v26 = 1108;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionBufferSize: No change - not setting preferred IO buffer size. No op.", v23, 0x12u);
    }

    v6 = 0;
    goto LABEL_29;
  }
  audioSession = self->_audioSession;
  v22 = 0;
  v9 = -[AVAudioSession setPreferredIOBufferFrameSize:error:](audioSession, "setPreferredIOBufferFrameSize:error:", a3, &v22);
  v10 = v22;
  v6 = v10;
  if ((v9 & 1) != 0)
  {
    v11 = 0;
    self->mPreviousIOBufferFrameSize = a3;
    goto LABEL_34;
  }
  v11 = -[NSObject code](v10, "code");
  if (kAVVCScope)
  {
    v12 = *(id *)kAVVCScope;
    if (!v12)
      goto LABEL_34;
  }
  else
  {
    v12 = (id)MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }
  v16 = v12;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    -[NSObject description](v6, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v23 = 136315650;
    v24 = "AVVCSessionManager.mm";
    v25 = 1024;
    v26 = 1101;
    v27 = 2112;
    v28 = v17;
    _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setSessionBufferSize failed: %@", v23, 0x1Cu);

  }
LABEL_34:
  if (!kAVVCScope)
  {
    v18 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
    goto LABEL_38;
  }
  v18 = *(id *)kAVVCScope;
  if (v18)
  {
LABEL_38:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      mPreviousIOBufferFrameSize = self->mPreviousIOBufferFrameSize;
      *(_DWORD *)v23 = 136315650;
      v24 = "AVVCSessionManager.mm";
      v25 = 1024;
      v26 = 1111;
      v27 = 1024;
      LODWORD(v28) = mPreviousIOBufferFrameSize;
      _os_log_impl(&dword_19B733000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionBufferSize: Previous IO buffer size: %d", v23, 0x18u);
    }

  }
  if (v5)
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  return v11;
}

- (void)changeDuckOthersOption:(BOOL)a3
{
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    self->mShouldDuckOthers = a3;
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    self->mShouldDuckOthers = a3;
  }
}

- (BOOL)setDuckOthers:(id)a3 mixWithOthers:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  recursive_mutex *p_mSessionManagerLock;
  unint64_t mPreviousSessionCategoryOptions;
  unint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  char v20;
  id v21;
  unint64_t v22;
  id v23;
  id v24;
  id v26;
  NSObject *v27;
  int v28;
  void *v29;
  int v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BYTE v35[14];
  _BYTE v36[160];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v36, "-[AVVCSessionManager setDuckOthers:mixWithOthers:error:]", "setDuckOthersMixWithOthers", 0);
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v14 = *(id *)kAVVCScope;
      if (!v14)
      {
LABEL_31:
        v20 = 0;
        goto LABEL_49;
      }
    }
    else
    {
      v14 = MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v30 = 136315906;
      v31 = "AVVCSessionManager.mm";
      v32 = 1024;
      v33 = 1131;
      v34 = 2080;
      *(_QWORD *)v35 = "setDuckOthers:mixWithOthers";
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = 0;
      _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v30, 0x22u);
    }

    goto LABEL_31;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v10 = IsSerializationEnabled(void)::enable;
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  mPreviousSessionCategoryOptions = self->mPreviousSessionCategoryOptions;
  v13 = mPreviousSessionCategoryOptions;
  if (!v8)
  {
LABEL_11:
    if (!v9)
      goto LABEL_20;
    goto LABEL_17;
  }
  if (objc_msgSend(v8, "BOOLValue"))
  {
    v13 = mPreviousSessionCategoryOptions | 2;
    goto LABEL_11;
  }
  v13 = mPreviousSessionCategoryOptions & 0xFFFFFFFFFFFFFFFDLL;
  if (!v9)
    goto LABEL_20;
LABEL_17:
  v15 = objc_msgSend(v9, "BOOLValue");
  v16 = 17;
  if (!v15)
    v16 = 0;
  v13 = v16 | v13 & 0xFFFFFFFFFFFFFFEELL;
LABEL_20:
  if (mPreviousSessionCategoryOptions == v13)
  {
    if (kAVVCScope)
    {
      v17 = *(id *)kAVVCScope;
      if (!v17)
        goto LABEL_36;
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->mPreviousSessionCategoryOptions;
      v30 = 136315650;
      v31 = "AVVCSessionManager.mm";
      v32 = 1024;
      v33 = 1169;
      v34 = 1024;
      *(_DWORD *)v35 = v22;
      _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager: No change - options are the same. No op. Current options: 0x%x.", (uint8_t *)&v30, 0x18u);
    }

LABEL_36:
    v20 = 1;
    if (!v10)
      goto LABEL_49;
    goto LABEL_48;
  }
  if (!kAVVCScope)
  {
    v18 = MEMORY[0x1E0C81028];
    v23 = MEMORY[0x1E0C81028];
    goto LABEL_39;
  }
  v18 = *(id *)kAVVCScope;
  if (v18)
  {
LABEL_39:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136315906;
      v31 = "AVVCSessionManager.mm";
      v32 = 1024;
      v33 = 1158;
      v34 = 1024;
      *(_DWORD *)v35 = v13;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = mPreviousSessionCategoryOptions;
      _os_log_impl(&dword_19B733000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager: Setting new options: 0x%x. Previous options: 0x%x", (uint8_t *)&v30, 0x1Eu);
    }

  }
  v20 = -[AVAudioSession setCategoryOptions:error:](self->_audioSession, "setCategoryOptions:error:", v13, a5);
  if ((v20 & 1) == 0 && *a5)
  {
    if (kAVVCScope)
    {
      v24 = *(id *)kAVVCScope;
      if (!v24)
        goto LABEL_54;
    }
    else
    {
      v24 = (id)MEMORY[0x1E0C81028];
      v26 = MEMORY[0x1E0C81028];
    }
    v27 = v24;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_msgSend(*a5, "code");
      objc_msgSend(*a5, "description");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 136315906;
      v31 = "AVVCSessionManager.mm";
      v32 = 1024;
      v33 = 1162;
      v34 = 1024;
      *(_DWORD *)v35 = v28;
      *(_WORD *)&v35[4] = 2112;
      *(_QWORD *)&v35[6] = v29;
      _os_log_impl(&dword_19B733000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setDuckOthers:mixWithOthers failed with error: %d, %@", (uint8_t *)&v30, 0x22u);

    }
LABEL_54:
    v20 = 0;
    if (!v10)
      goto LABEL_49;
    goto LABEL_48;
  }
  self->mPreviousSessionCategoryOptions = v13;
  if (v10)
LABEL_48:
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
LABEL_49:
  ElapsedTime::~ElapsedTime((ElapsedTime *)v36);

  return v20;
}

- (BOOL)setDuckingFadeOutDuration:(id)a3 fadeInDuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  recursive_mutex *p_mSessionManagerLock;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  int v16;
  void *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BYTE v24[14];
  _BYTE v25[160];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v25, "-[AVVCSessionManager setDuckingFadeOutDuration:fadeInDuration:error:]", "setDuckingFadeDuration", 0);
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v10 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    LOBYTE(self) = -[AVAudioSession setDuckingFadeOutDuration:fadeInDuration:error:](self->_audioSession, "setDuckingFadeOutDuration:fadeInDuration:error:", v8, v9, a5);
    if ((self & 1) != 0 || !*a5)
      goto LABEL_24;
    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12)
      {
LABEL_24:
        if (v10)
          std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
        goto LABEL_26;
      }
    }
    else
    {
      v12 = (id)MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    v15 = v12;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(*a5, "code");
      objc_msgSend(*a5, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315906;
      v20 = "AVVCSessionManager.mm";
      v21 = 1024;
      v22 = 1187;
      v23 = 1024;
      *(_DWORD *)v24 = v16;
      *(_WORD *)&v24[4] = 2112;
      *(_QWORD *)&v24[6] = v17;
      _os_log_impl(&dword_19B733000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Error in setDuckingFadeDuration %d, %@", (uint8_t *)&v19, 0x22u);

    }
    goto LABEL_24;
  }
  if (kAVVCScope)
  {
    self = (AVVCSessionManager *)*(id *)kAVVCScope;
    if (!self)
      goto LABEL_26;
  }
  else
  {
    self = (AVVCSessionManager *)MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(&self->super, OS_LOG_TYPE_DEBUG))
  {
    v19 = 136315906;
    v20 = "AVVCSessionManager.mm";
    v21 = 1024;
    v22 = 1182;
    v23 = 2080;
    *(_QWORD *)v24 = "setDuckingFadeDuration";
    *(_WORD *)&v24[8] = 1024;
    *(_DWORD *)&v24[10] = 0;
    _os_log_impl(&dword_19B733000, &self->super, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v19, 0x22u);
  }

  LOBYTE(self) = 0;
LABEL_26:
  ElapsedTime::~ElapsedTime((ElapsedTime *)v25);

  return (char)self;
}

- (BOOL)isSessionOutputInWirelessSplitterMode
{
  recursive_mutex *p_mSessionManagerLock;
  int v4;
  BOOL v5;
  NSObject *v7;
  int v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  int v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t i;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  recursive_mutex *v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[160];
  uint8_t v33[4];
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  int v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v4 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)p_mSessionManagerLock);
  if (self->mDeviceIsIOSAccessory)
  {
    v5 = 0;
    if (!v4)
      return v5;
LABEL_7:
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
    return v5;
  }
  v26 = p_mSessionManagerLock;
  v27 = v4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v32, "-[AVVCSessionManager isSessionOutputInWirelessSplitterMode]", "isSessionOutputInWirelessSplitterMode", 0);
  if (isAVOutputContextAvailable(void)::onceToken1 != -1)
    dispatch_once(&isAVOutputContextAvailable(void)::onceToken1, &__block_literal_global);
  if (!isAVOutputContextAvailable(void)::wirelessSplitterModeAPIAvailable)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
      {
        v5 = 0;
        goto LABEL_51;
      }
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "AVVCCarplayRuntimeAvailability.mm";
      v43 = 1024;
      v44 = 70;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVOutputContext API not available", buf, 0x12u);
    }
    v5 = 0;
    goto LABEL_50;
  }
  objc_msgSend(getAVOutputContextClass(), "sharedSystemAudioContext");
  v7 = objc_claimAutoreleasedReturnValue();
  v25 = v7;
  v8 = -[NSObject supportsMultipleBluetoothOutputDevices](v7, "supportsMultipleBluetoothOutputDevices");
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
    {
      if (v8)
        goto LABEL_15;
LABEL_25:
      v13 = 0;
      goto LABEL_49;
    }
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v42 = "AVVCCarplayRuntimeAvailability.mm";
    v43 = 1024;
    v44 = 78;
    v45 = 1024;
    LODWORD(v46) = v8;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d supportsMultipleBTDevices: %d", buf, 0x18u);
  }

  if (!v8)
    goto LABEL_25;
LABEL_15:
  -[NSObject outputDevices](v7, "outputDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!kAVVCScope)
  {
    v11 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_31;
  }
  v11 = *(id *)kAVVCScope;
  if (v11)
  {
LABEL_31:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "AVVCCarplayRuntimeAvailability.mm";
      v43 = 1024;
      v44 = 82;
      v45 = 2112;
      v46 = v10;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Wireless Output Devices: %@", buf, 0x1Cu);
    }

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = v10;
  v13 = 0;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, buf, 16);
  if (!v17)
    goto LABEL_48;
  v18 = *(_QWORD *)v29;
  v19 = MEMORY[0x1E0C81028];
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v29 != v18)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      v22 = objc_msgSend(v21, "supportsBluetoothSharing");
      if (kAVVCScope)
      {
        v23 = *(id *)kAVVCScope;
        if (!v23)
          goto LABEL_46;
      }
      else
      {
        v24 = v19;
        v23 = v19;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v33 = 136315906;
        v34 = "AVVCCarplayRuntimeAvailability.mm";
        v35 = 1024;
        v36 = 86;
        v37 = 2048;
        v38 = v21;
        v39 = 1024;
        v40 = v22;
        _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVOutputDevice %p supports BT sharing: %d", v33, 0x22u);
      }

LABEL_46:
      v13 += v22;
    }
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, buf, 16);
  }
  while (v17);
LABEL_48:

  v7 = v25;
LABEL_49:
  v5 = v13 > 1;
LABEL_50:

  p_mSessionManagerLock = v26;
  v4 = v27;
LABEL_51:
  self->mSessionOutputIsWirelessSplitter = v5;
  ElapsedTime::~ElapsedTime((ElapsedTime *)v32);
  if (v4)
    goto LABEL_7;
  return v5;
}

- (unsigned)getSessionActivationOptions
{
  recursive_mutex *p_mSessionManagerLock;
  unsigned int mSessionActivationOptions;

  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (!IsSerializationEnabled(void)::enable)
    return self->mSessionActivationOptions;
  p_mSessionManagerLock = &self->mSessionManagerLock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  mSessionActivationOptions = self->mSessionActivationOptions;
  std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return mSessionActivationOptions;
}

- (void)setSessionActivationOptions:(unsigned int)a3
{
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    self->mSessionActivationOptions = a3;
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    self->mSessionActivationOptions = a3;
  }
}

- (int)enableSmartRoutingConsideration:(BOOL)a3
{
  _BOOL8 v3;
  recursive_mutex *p_mSessionManagerLock;
  int v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  AVAudioSession *audioSession;
  char v11;
  NSObject *v12;
  char v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t v22[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v9 = *(id *)kAVVCScope;
      if (!v9)
        return 0;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v29 = "AVVCSessionManager.mm";
      v30 = 1024;
      v31 = 1240;
      v32 = 2080;
      v33 = "enableSmartRoutingConsideration";
      v34 = 1024;
      v35 = 0;
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    return 0;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v6 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager enableSmartRoutingConsideration:]", "enableSmartRoutingConsideration", 0);
  if (self->mEnableSmartRoutingConsideration == v3)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
      {
        v8 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v22 = 136315394;
      v23 = "AVVCSessionManager.mm";
      v24 = 1024;
      v25 = 1252;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::enableSmartRoutingConsideration No-op", v22, 0x12u);
    }
  }
  else
  {
    audioSession = self->_audioSession;
    v21 = 0;
    v11 = -[AVAudioSession setEligibleForBTSmartRoutingConsideration:error:](audioSession, "setEligibleForBTSmartRoutingConsideration:error:", v3, &v21);
    v12 = v21;
    v7 = v12;
    if (v12)
      v13 = v11;
    else
      v13 = 1;
    if ((v13 & 1) == 0)
    {
      v8 = -[NSObject code](v12, "code");
      if (kAVVCScope)
      {
        v14 = *(id *)kAVVCScope;
        if (!v14)
          goto LABEL_35;
      }
      else
      {
        v14 = (id)MEMORY[0x1E0C81028];
        v17 = MEMORY[0x1E0C81028];
      }
      v18 = v14;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        -[NSObject description](v7, "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 136315650;
        v23 = "AVVCSessionManager.mm";
        v24 = 1024;
        v25 = 1260;
        v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_19B733000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::enableSmartRoutingConsideration failed: %@", v22, 0x1Cu);

      }
      goto LABEL_35;
    }
  }
  v8 = 0;
LABEL_35:

LABEL_36:
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  if (v6)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return v8;
}

- (BOOL)isAirplayOneOfTheOutputRoutes:(id)a3
{
  uint64_t v3;
  int v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  id v11;
  char v12;
  id v14;
  int v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = objc_msgSend(v14, "count");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v14;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = *(_QWORD *)v18;
    v7 = *MEMORY[0x1E0CFF100];
    while (1)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "portType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (kAVVCScope)
        {
          v10 = *(id *)kAVVCScope;
          if (!v10)
            goto LABEL_13;
        }
        else
        {
          v10 = MEMORY[0x1E0C81028];
          v11 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v22 = "AVVCSessionManager.mm";
          v23 = 1024;
          v24 = 1275;
          v25 = 1024;
          v26 = v4 + i + 1;
          v27 = 1024;
          v28 = v15;
          v29 = 2112;
          v30 = v9;
          _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Output Port[%d / %d] : %@", buf, 0x28u);
        }

LABEL_13:
        v12 = objc_msgSend(v9, "isEqualToString:", v7);

        v5 |= v12;
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
      v4 += i;
      if (!v3)
        goto LABEL_17;
    }
  }
  v5 = 0;
LABEL_17:

  return v5 & 1;
}

- (BOOL)activateAudioSessionWithPrewarm:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  int v7;
  unsigned int mSessionActivationOptions;
  const __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unsigned int v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  int v28;
  void *v30;
  std::recursive_mutex *p_mSessionManagerLock;
  _QWORD aBlock[4];
  id v33;
  uint64_t *v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t v42[16];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  uint8_t *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v5 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v10 = *(id *)kAVVCScope;
      if (!v10)
      {
LABEL_32:
        LOBYTE(v17) = 1;
        return v17;
      }
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v44 = "AVVCSessionManager.mm";
      v45 = 1024;
      v46 = 1290;
      v47 = 2080;
      v48 = "activateAudioSessionWithPrewarm";
      v49 = 1024;
      LODWORD(v50) = 1;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_32;
  }
  p_mSessionManagerLock = (std::recursive_mutex *)&self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v7 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock(p_mSessionManagerLock);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__5668;
  v40 = __Block_byref_object_dispose__5669;
  v41 = 0;
  -[AVVCSessionManager audioSession](self, "audioSession");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AVVCSessionManager setSessionStateWithoutLock:](self, "setSessionStateWithoutLock:", 5);
    mSessionActivationOptions = 0x2000;
    v9 = CFSTR("prewarmAudioSession");
  }
  else
  {
    -[AVVCSessionManager setSessionStateWithoutLock:](self, "setSessionStateWithoutLock:", 6);
    mSessionActivationOptions = self->mSessionActivationOptions;
    v9 = CFSTR("activateAudioSession");
  }
  if (kAVVCScope)
  {
    v11 = *(id *)kAVVCScope;
    if (!v11)
      goto LABEL_21;
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v44 = "AVVCSessionManager.mm";
    v45 = 1024;
    v46 = 1309;
    v47 = 2112;
    v48 = (const char *)v9;
    v49 = 1024;
    LODWORD(v50) = mSessionActivationOptions;
    _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@: session options : %d", buf, 0x22u);
  }

LABEL_21:
  ProfileMetrics(CFSTR("AVVC_PROFILE_Prop_SetSessionActiveStart"));
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager activateAudioSessionWithPrewarm:error:]", "AVAudioSessionSetActive", 0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__AVVCSessionManager_activateAudioSessionWithPrewarm_error___block_invoke;
  aBlock[3] = &unk_1E3BEC8C8;
  v13 = v30;
  v35 = mSessionActivationOptions;
  v33 = v13;
  v34 = &v36;
  v14 = _Block_copy(aBlock);
  v15 = (void *)MEMORY[0x1A1AC6084]();
  +[AVVCMetricsManager sharedManager](AVVCMetricsManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "measureElapseTimeForMetric:block:", CFSTR("SetSessionActiveTime"), v14);

  objc_autoreleasePoolPop(v15);
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  kdebug_trace();
  ProfileMetrics(CFSTR("AVVC_PROFILE_Prop_SetSessionActiveEnd"));
  v18 = objc_msgSend((id)v37[5], "code");
  if (!v17)
  {
    if (kAVVCScope)
    {
      v20 = *(id *)kAVVCScope;
      if (!v20)
      {
LABEL_42:
        v25 = v18 != 1836282486;
        goto LABEL_43;
      }
    }
    else
    {
      v20 = (id)MEMORY[0x1E0C81028];
      v26 = MEMORY[0x1E0C81028];
    }
    v27 = v20;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v42, v18);
      v28 = -[AVAudioSession opaqueSessionID](self->_audioSession, "opaqueSessionID");
      *(_DWORD *)buf = 136316162;
      v44 = "AVVCSessionManager.mm";
      v45 = 1024;
      v46 = 1333;
      v47 = 2112;
      v48 = (const char *)v9;
      v49 = 2080;
      v50 = v42;
      v51 = 1024;
      v52 = v28;
      _os_log_impl(&dword_19B733000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d %@ failed with error: %s, session id:0x%x", buf, 0x2Cu);
    }

    goto LABEL_42;
  }
  if (!kAVVCScope)
  {
    v19 = (id)MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
    goto LABEL_34;
  }
  v19 = *(id *)kAVVCScope;
  if (v19)
  {
LABEL_34:
    v23 = v19;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v42, v18);
      v24 = -[AVAudioSession opaqueSessionID](self->_audioSession, "opaqueSessionID");
      *(_DWORD *)buf = 136316162;
      v44 = "AVVCSessionManager.mm";
      v45 = 1024;
      v46 = 1329;
      v47 = 2112;
      v48 = (const char *)v9;
      v49 = 2080;
      v50 = v42;
      v51 = 1024;
      v52 = v24;
      _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ succeeded error: %s, session id:0x%x", buf, 0x2Cu);
    }

  }
  v25 = 7;
LABEL_43:
  -[AVVCSessionManager setSessionStateWithoutLock:](self, "setSessionStateWithoutLock:", v25);
  if (a4)
    *a4 = objc_retainAutorelease((id)v37[5]);

  _Block_object_dispose(&v36, 8);
  if (v7)
    std::recursive_mutex::unlock(p_mSessionManagerLock);
  return v17;
}

- (BOOL)deactivateAudioSessionWithOptions:(unsigned int)a3 error:(id *)a4
{
  int v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  unsigned int v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  int v20;
  _BOOL8 v21;
  id v22;
  NSObject *v23;
  int v24;
  id v26;
  uint8_t v27[16];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint8_t *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v10 = *(id *)kAVVCScope;
      if (!v10)
      {
LABEL_29:
        LOBYTE(v12) = 1;
        return v12;
      }
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v29 = "AVVCSessionManager.mm";
      v30 = 1024;
      v31 = 1346;
      v32 = 2080;
      v33 = (uint8_t *)"deactivateAudioSessionWithOptions";
      v34 = 1024;
      v35 = 1;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_29;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v7 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  -[AVVCSessionManager audioSession](self, "audioSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVVCSessionManager setSessionStateWithoutLock:](self, "setSessionStateWithoutLock:", 4);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_18;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "AVVCSessionManager.mm";
    v30 = 1024;
    v31 = 1354;
    v32 = 1024;
    LODWORD(v33) = a3;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d deactivateAudioSession: session options : %d", buf, 0x18u);
  }

LABEL_18:
  v26 = 0;
  v12 = objc_msgSend(v8, "setActive:withOptions:error:", 0, a3, &v26);
  v13 = v26;
  v14 = objc_msgSend(v13, "code");
  if (!v12)
  {
    if (kAVVCScope)
    {
      v16 = *(id *)kAVVCScope;
      if (!v16)
      {
LABEL_39:
        v21 = v14 != 1836282486;
        goto LABEL_40;
      }
    }
    else
    {
      v16 = (id)MEMORY[0x1E0C81028];
      v22 = MEMORY[0x1E0C81028];
    }
    v23 = v16;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v27, v14);
      v24 = -[AVAudioSession opaqueSessionID](self->_audioSession, "opaqueSessionID");
      *(_DWORD *)buf = 136315906;
      v29 = "AVVCSessionManager.mm";
      v30 = 1024;
      v31 = 1364;
      v32 = 2080;
      v33 = v27;
      v34 = 1024;
      v35 = v24;
      _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d deactivateAudioSession failed with error: %s, session id:0x%x", buf, 0x22u);
    }

    goto LABEL_39;
  }
  if (!kAVVCScope)
  {
    v15 = (id)MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
    goto LABEL_31;
  }
  v15 = *(id *)kAVVCScope;
  if (v15)
  {
LABEL_31:
    v19 = v15;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v27, v14);
      v20 = -[AVAudioSession opaqueSessionID](self->_audioSession, "opaqueSessionID");
      *(_DWORD *)buf = 136315906;
      v29 = "AVVCSessionManager.mm";
      v30 = 1024;
      v31 = 1360;
      v32 = 2080;
      v33 = v27;
      v34 = 1024;
      v35 = v20;
      _os_log_impl(&dword_19B733000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d deactivateAudioSession succeeded error: %s, session id:0x%x", buf, 0x22u);
    }

  }
  v21 = 1;
LABEL_40:
  -[AVVCSessionManager setSessionStateWithoutLock:](self, "setSessionStateWithoutLock:", v21);
  if (a4)
    *a4 = objc_retainAutorelease(v13);

  if (v7)
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return v12;
}

- (void)setSessionState:(int)a3
{
  recursive_mutex *p_mSessionManagerLock;
  int v6;
  NSObject *v7;
  id v8;
  uint64_t sessionState;
  const char *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVVCSessionManager *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v6 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)p_mSessionManagerLock);
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_18;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sessionState = self->_sessionState;
    if (sessionState > 7)
      v10 = "ILLEGAL";
    else
      v10 = off_1E3BEC8F0[sessionState];
    if (a3 > 7)
      v11 = "ILLEGAL";
    else
      v11 = off_1E3BEC8F0[a3];
    v12 = 136316162;
    v13 = "AVVCSessionManager.mm";
    v14 = 1024;
    v15 = 1379;
    v16 = 2048;
    v17 = self;
    v18 = 2080;
    v19 = v10;
    v20 = 2080;
    v21 = v11;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d session(%p) state %s => %s", (uint8_t *)&v12, 0x30u);
  }

LABEL_18:
  self->_sessionState = a3;
  if (v6)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
}

- (void)setSessionStateWithoutLock:(int)a3
{
  recursive_mutex *p_mSessionManagerLock;
  int v6;
  NSObject *v7;
  id v8;
  uint64_t sessionState;
  const char *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVVCSessionManager *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v6 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)p_mSessionManagerLock);
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_18;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sessionState = self->_sessionState;
    if (sessionState > 7)
      v10 = "ILLEGAL";
    else
      v10 = off_1E3BEC8F0[sessionState];
    if (a3 > 7)
      v11 = "ILLEGAL";
    else
      v11 = off_1E3BEC8F0[a3];
    v12 = 136316162;
    v13 = "AVVCSessionManager.mm";
    v14 = 1024;
    v15 = 1385;
    v16 = 2048;
    v17 = self;
    v18 = 2080;
    v19 = v10;
    v20 = 2080;
    v21 = v11;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d session(%p) state %s => %s", (uint8_t *)&v12, 0x30u);
  }

LABEL_18:
  self->_sessionState = a3;
  if (v6)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
}

- (int)sessionState
{
  recursive_mutex *p_mSessionManagerLock;
  int sessionState;

  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (!IsSerializationEnabled(void)::enable)
    return self->_sessionState;
  p_mSessionManagerLock = &self->mSessionManagerLock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  sessionState = self->_sessionState;
  std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return sessionState;
}

- (BOOL)isSessionActive
{
  recursive_mutex *p_mSessionManagerLock;
  int sessionState;

  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    sessionState = self->_sessionState;
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    sessionState = self->_sessionState;
  }
  return sessionState > 4;
}

- (void)setClientRequestsRecording:(BOOL)a3
{
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    self->_clientRequestsRecording = a3;
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    self->_clientRequestsRecording = a3;
  }
}

- (BOOL)getClientRequestsRecording
{
  recursive_mutex *p_mSessionManagerLock;
  _BOOL4 clientRequestsRecording;

  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    clientRequestsRecording = self->_clientRequestsRecording;
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    return self->_clientRequestsRecording;
  }
  return clientRequestsRecording;
}

- (void)setDeviceGain:(float)a3
{
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    self->_deviceGain = a3;
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    self->_deviceGain = a3;
  }
}

- (float)getDeviceGain
{
  float deviceGain;

  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (!IsSerializationEnabled(void)::enable)
    return self->_deviceGain;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  deviceGain = self->_deviceGain;
  std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return deviceGain;
}

- (void)setPlaybackRoute:(id)a3
{
  NSString *v4;
  NSString *playbackRoute;
  NSString *v6;

  v4 = (NSString *)a3;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    playbackRoute = self->_playbackRoute;
    self->_playbackRoute = v4;

    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    v6 = self->_playbackRoute;
    self->_playbackRoute = v4;

  }
}

- (id)getPlaybackRoute
{
  recursive_mutex *p_mSessionManagerLock;
  NSString *v4;

  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    v4 = self->_playbackRoute;
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    v4 = self->_playbackRoute;
  }
  return v4;
}

- (void)setForceGetSessionProperties:(BOOL)a3
{
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    self->_forceGetSessionProperties = a3;
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    self->_forceGetSessionProperties = a3;
  }
}

- (BOOL)getForceGetSessionProperties
{
  recursive_mutex *p_mSessionManagerLock;
  _BOOL4 forceGetSessionProperties;

  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    forceGetSessionProperties = self->_forceGetSessionProperties;
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    return self->_forceGetSessionProperties;
  }
  return forceGetSessionProperties;
}

- (BOOL)setEnableBTTriangleMode:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  int v7;
  id v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v5 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v7 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    LOBYTE(a4) = -[AVAudioSession setEligibleForBTTriangleConsideration:error:](self->_audioSession, "setEligibleForBTTriangleConsideration:error:", v5, a4);
    if (v7)
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    if (kAVVCScope)
    {
      a4 = (id *)*(id *)kAVVCScope;
      if (!a4)
        return (char)a4;
    }
    else
    {
      a4 = (id *)MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315906;
      v11 = "AVVCSessionManager.mm";
      v12 = 1024;
      v13 = 1457;
      v14 = 2080;
      v15 = "setEnableBTTriangleMode";
      v16 = 1024;
      v17 = 0;
      _os_log_impl(&dword_19B733000, (os_log_t)a4, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v10, 0x22u);
    }

    LOBYTE(a4) = 0;
  }
  return (char)a4;
}

- (double)inputLatency
{
  int v3;
  double v4;
  double v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        return 0.0;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315906;
      v10 = "AVVCSessionManager.mm";
      v11 = 1024;
      v12 = 1471;
      v13 = 2080;
      v14 = "inputLatency";
      v15 = 1024;
      v16 = 0;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 0.0;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v3 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  -[AVAudioSession inputLatency](self->_audioSession, "inputLatency");
  v5 = v4;
  self->_inputLatency = v4;
  if (v3)
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return v5;
}

- (double)outputLatency
{
  int v3;
  double v4;
  double v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        return 0.0;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315906;
      v10 = "AVVCSessionManager.mm";
      v11 = 1024;
      v12 = 1479;
      v13 = 2080;
      v14 = "outputLatency";
      v15 = 1024;
      v16 = 0;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 0.0;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v3 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  -[AVAudioSession outputLatency](self->_audioSession, "outputLatency");
  v5 = v4;
  self->_outputLatency = v4;
  if (v3)
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return v5;
}

- (double)outputSafetyOffset
{
  int v3;
  double v4;
  double v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        return 0.0;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315906;
      v10 = "AVVCSessionManager.mm";
      v11 = 1024;
      v12 = 1487;
      v13 = 2080;
      v14 = "outputSafetyOffset";
      v15 = 1024;
      v16 = 0;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 0.0;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v3 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  -[AVAudioSession outputSafetyOffset](self->_audioSession, "outputSafetyOffset");
  v5 = v4;
  self->_outputSafetyOffset = v4;
  if (v3)
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return v5;
}

- (double)inputSafetyOffset
{
  int v3;
  double v4;
  double v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        return 0.0;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315906;
      v10 = "AVVCSessionManager.mm";
      v11 = 1024;
      v12 = 1495;
      v13 = 2080;
      v14 = "inputSafetyOffset";
      v15 = 1024;
      v16 = 0;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 0.0;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v3 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  -[AVAudioSession inputSafetyOffset](self->_audioSession, "inputSafetyOffset");
  v5 = v4;
  self->_inputSafetyOffset = v4;
  if (v3)
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return v5;
}

- (double)outputVolume
{
  int v3;
  float v4;
  double v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        return 0.0;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315906;
      v10 = "AVVCSessionManager.mm";
      v11 = 1024;
      v12 = 1503;
      v13 = 2080;
      v14 = "outputVolume";
      v15 = 1024;
      v16 = 0;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 0.0;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v3 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  -[AVAudioSession outputVolume](self->_audioSession, "outputVolume");
  v5 = v4;
  self->_outputVolume = v4;
  if (v3)
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return v5;
}

- (double)speechDetectionDeviceSampleRate
{
  int v3;
  double v4;
  double v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        return 16000.0;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315906;
      v10 = "AVVCSessionManager.mm";
      v11 = 1024;
      v12 = 1511;
      v13 = 2080;
      v14 = "speechDetectionDeviceSampleRate";
      v15 = 1024;
      v16 = 16000;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 16000.0;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v3 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  -[AVAudioSession speechDetectionDeviceSampleRate](self->_audioSession, "speechDetectionDeviceSampleRate");
  v5 = v4;
  if (v3)
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return v5;
}

- (BOOL)setCategory:(id)a3 mode:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  int v12;
  id v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v12 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    LOBYTE(a6) = -[AVAudioSession setCategory:mode:options:error:](self->_audioSession, "setCategory:mode:options:error:", v10, v11, a5, a6);
    if (v12)
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    if (kAVVCScope)
    {
      a6 = (id *)*(id *)kAVVCScope;
      if (!a6)
        goto LABEL_17;
    }
    else
    {
      a6 = (id *)MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled((os_log_t)a6, OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315906;
      v16 = "AVVCSessionManager.mm";
      v17 = 1024;
      v18 = 1520;
      v19 = 2080;
      v20 = "setCategory:mode:options";
      v21 = 1024;
      v22 = 0;
      _os_log_impl(&dword_19B733000, (os_log_t)a6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v15, 0x22u);
    }

    LOBYTE(a6) = 0;
  }
LABEL_17:

  return (char)a6;
}

- (BOOL)setCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  int v14;
  id v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v14 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    LOBYTE(a7) = -[AVAudioSession setCategory:mode:routeSharingPolicy:options:error:](self->_audioSession, "setCategory:mode:routeSharingPolicy:options:error:", v12, v13, a5, a6, a7);
    if (v14)
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    if (kAVVCScope)
    {
      a7 = (id *)*(id *)kAVVCScope;
      if (!a7)
        goto LABEL_17;
    }
    else
    {
      a7 = (id *)MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled((os_log_t)a7, OS_LOG_TYPE_DEBUG))
    {
      v17 = 136315906;
      v18 = "AVVCSessionManager.mm";
      v19 = 1024;
      v20 = 1529;
      v21 = 2080;
      v22 = "setCategory:mode:routeSharingPolicy:options";
      v23 = 1024;
      v24 = 0;
      _os_log_impl(&dword_19B733000, (os_log_t)a7, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v17, 0x22u);
    }

    LOBYTE(a7) = 0;
  }
LABEL_17:

  return (char)a7;
}

- (BOOL)clearInputPreferences:(id *)a3
{
  int v5;
  id v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v5 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    LOBYTE(a3) = -[AVAudioSession clearInputPreferences:](self->_audioSession, "clearInputPreferences:", a3);
    if (v5)
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    if (kAVVCScope)
    {
      a3 = (id *)*(id *)kAVVCScope;
      if (!a3)
        return (char)a3;
    }
    else
    {
      a3 = (id *)MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315906;
      v9 = "AVVCSessionManager.mm";
      v10 = 1024;
      v11 = 1537;
      v12 = 2080;
      v13 = "clearInputPreferences";
      v14 = 1024;
      v15 = 0;
      _os_log_impl(&dword_19B733000, (os_log_t)a3, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v8, 0x22u);
    }

    LOBYTE(a3) = 0;
  }
  return (char)a3;
}

- (BOOL)isSessionInSiriCategoryModeAndOptions:(unsigned int)a3
{
  recursive_mutex *p_mSessionManagerLock;
  int v6;
  NSString *v7;
  NSString *v8;
  int mPreviousSessionCategoryOptions;
  NSObject *v10;
  NSObject *v11;
  id v12;
  BOOL v13;
  BOOL v14;
  id v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v11 = *(id *)kAVVCScope;
      if (!v11)
        return 0;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v17 = 136315906;
      v18 = "AVVCSessionManager.mm";
      v19 = 1024;
      v20 = 1548;
      v21 = 2080;
      v22 = "speechDetectionDeviceSampleRate";
      v23 = 1024;
      LODWORD(v24) = 0;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v17, 0x22u);
    }

    return 0;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v6 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  v7 = self->mPreviousSessionCategory;
  v8 = self->mPreviousSessionMode;
  mPreviousSessionCategoryOptions = self->mPreviousSessionCategoryOptions;
  if (!kAVVCScope)
  {
    v10 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_15;
  }
  v10 = *(id *)kAVVCScope;
  if (v10)
  {
LABEL_15:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17 = 136316162;
      v18 = "AVVCSessionManager.mm";
      v19 = 1024;
      v20 = 1554;
      v21 = 2112;
      v22 = (const char *)v7;
      v23 = 2112;
      v24 = v8;
      v25 = 1024;
      v26 = mPreviousSessionCategoryOptions;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d isSessionInSiriCategoryModeAndOptions: about to set Play&Record category, speech recognition/assistant mode. Current category: %@, mode: %@, options: 0x%x", (uint8_t *)&v17, 0x2Cu);
    }

  }
  if (-[NSString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x1E0CFEFC0]))
  {
    v13 = -[NSString isEqualToString:](v8, "isEqualToString:", *MEMORY[0x1E0CFF0B8]);
    v14 = mPreviousSessionCategoryOptions == a3 && v13;
  }
  else
  {
    v14 = 0;
  }

  if (v6)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return v14;
}

- (BOOL)isSessionInSiriCategory
{
  recursive_mutex *p_mSessionManagerLock;
  int v4;
  BOOL v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        return 0;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315906;
      v10 = "AVVCSessionManager.mm";
      v11 = 1024;
      v12 = 1568;
      v13 = 2080;
      v14 = "isSessionInSiriCategory";
      v15 = 1024;
      v16 = 0;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 0;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v4 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  v5 = -[NSString isEqualToString:](self->mPreviousSessionCategory, "isEqualToString:", *MEMORY[0x1E0CFEFC0]);
  if (v4)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return v5;
}

- (BOOL)setAudioHardwareControlFlags:(unint64_t)a3 error:(id *)a4
{
  int v7;
  id v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v7 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    LOBYTE(a4) = -[AVAudioSession setAudioHardwareControlFlags:error:](self->_audioSession, "setAudioHardwareControlFlags:error:", a3, a4);
    if (v7)
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    if (kAVVCScope)
    {
      a4 = (id *)*(id *)kAVVCScope;
      if (!a4)
        return (char)a4;
    }
    else
    {
      a4 = (id *)MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315906;
      v11 = "AVVCSessionManager.mm";
      v12 = 1024;
      v13 = 1581;
      v14 = 2080;
      v15 = "setAudioHardwareControlFlags";
      v16 = 1024;
      v17 = 0;
      _os_log_impl(&dword_19B733000, (os_log_t)a4, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v10, 0x22u);
    }

    LOBYTE(a4) = 0;
  }
  return (char)a4;
}

- (int64_t)reporterID
{
  int64_t reporterID;
  NSObject *v4;
  id v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  _BYTE v15[160];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  ElapsedTime::ElapsedTime((ElapsedTime *)v15, "-[AVVCSessionManager reporterID]", "reporterID", 0);
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v4 = *(id *)kAVVCScope;
      if (!v4)
      {
LABEL_16:
        reporterID = 0;
        goto LABEL_17;
      }
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315906;
      v8 = "AVVCSessionManager.mm";
      v9 = 1024;
      v10 = 1595;
      v11 = 2080;
      v12 = "reporterID";
      v13 = 1024;
      v14 = 0;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v7, 0x22u);
    }

    goto LABEL_16;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    reporterID = self->_reporterID;
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    reporterID = self->_reporterID;
  }
LABEL_17:
  ElapsedTime::~ElapsedTime((ElapsedTime *)v15);
  return reporterID;
}

- (BOOL)setIAmTheAssistant:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  int v7;
  char v8;
  NSObject *v9;
  id v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v9 = *(id *)kAVVCScope;
      if (!v9)
        return 1;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315906;
      v13 = "AVVCSessionManager.mm";
      v14 = 1024;
      v15 = 1604;
      v16 = 2080;
      v17 = "setIAmTheAssistant";
      v18 = 1024;
      v19 = 1;
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v12, 0x22u);
    }

    return 1;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v7 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  v8 = -[AVAudioSession setIAmTheAssistant:error:](self->_audioSession, "setIAmTheAssistant:error:", v5, a4);
  if (v7)
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return v8;
}

- (BOOL)setPreferredSampleRate:(double)a3 error:(id *)a4
{
  int v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v9 = *(id *)kAVVCScope;
      if (!v9)
        return 1;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315906;
      v13 = "AVVCSessionManager.mm";
      v14 = 1024;
      v15 = 1614;
      v16 = 2080;
      v17 = "setPreferredSampleRate:error";
      v18 = 1024;
      v19 = 1;
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v12, 0x22u);
    }

    return 1;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v7 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  v8 = -[AVAudioSession setPreferredSampleRate:error:](self->_audioSession, "setPreferredSampleRate:error:", a4, a3);
  if (v7)
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return v8;
}

- (id)currentRoute
{
  recursive_mutex *p_mSessionManagerLock;
  int v4;
  void *v5;

  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v4 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    -[AVAudioSession currentRoute](self->_audioSession, "currentRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)sessionCurrentOutputRoutes
{
  int v3;
  recursive_mutex *p_mSessionManagerLock;
  void *v5;
  void *v6;
  id v7;

  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v3 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    -[AVAudioSession currentRoute](self->_audioSession, "currentRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6;
    if (v3)
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)sessionCurrentInputRoutes
{
  int v3;
  recursive_mutex *p_mSessionManagerLock;
  void *v5;
  void *v6;
  id v7;

  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v3 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    -[AVAudioSession currentRoute](self->_audioSession, "currentRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6;
    if (v3)
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)siriInputSource
{
  recursive_mutex *p_mSessionManagerLock;
  int v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  id v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v4 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    -[AVAudioSession currentRoute](self->_audioSession, "currentRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "siriInputSource");

    if (v4)
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    v6 = 1936289391;
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        return v6;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315906;
      v11 = "AVVCSessionManager.mm";
      v12 = 1024;
      v13 = 1657;
      v14 = 2080;
      v15 = "siriInputSource";
      v16 = 1024;
      v17 = 1936289391;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v10, 0x22u);
    }

  }
  return v6;
}

- (id)siriRemoteInputIdentifier
{
  int v3;
  recursive_mutex *p_mSessionManagerLock;
  void *v5;
  void *v6;
  id v7;

  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v3 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    -[AVAudioSession currentRoute](self->_audioSession, "currentRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriRemoteInputIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6;
    if (v3)
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isPickedRouteW1
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  id v8;
  const char *v9;
  id v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  ElapsedTime::ElapsedTime((ElapsedTime *)&v12, "-[AVVCSessionManager isPickedRouteW1]", "isPickedRouteW1: pickedRoute", 0);
  -[AVAudioSession pickedRoute](self->_audioSession, "pickedRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ElapsedTime::~ElapsedTime((ElapsedTime *)&v12);
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("BTDetails_ProductID"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = -[NSObject hasSuffix:](v4, "hasSuffix:", CFSTR("76,8194"));
    else
      v6 = 0;
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "NO";
      v13 = "AVVCSessionManager.mm";
      v14 = 1024;
      v15 = 1692;
      v12 = 136315906;
      if (v6)
        v9 = "YES";
      v16 = 2080;
      v17 = v9;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d isPickedRouteW1: %s, id: %@", (uint8_t *)&v12, 0x26u);
    }

    goto LABEL_21;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_18;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
  {
LABEL_18:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "AVVCSessionManager.mm";
      v14 = 1024;
      v15 = 1695;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d isPickedRouteW1: NO. pickedRoute is nil", (uint8_t *)&v12, 0x12u);
    }
    LOBYTE(v6) = 0;
    goto LABEL_21;
  }
  LOBYTE(v6) = 0;
LABEL_22:

  return v6;
}

- (BOOL)predictIfMicrophoneShouldBeUsedForActivationMode:(int64_t)a3
{
  __objc2_class_ro **p_info;
  void *v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  char *v14;
  id *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  __objc2_class_ro **v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  int v25;
  BOOL v26;
  int v27;
  id v28;
  _BOOL4 v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  id *v34;
  NSObject *v35;
  id v36;
  int v38;
  std::recursive_mutex *p_mSessionManagerLock;
  void *v40;
  id obj;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  id v65;
  __int16 v66;
  int v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
      {
LABEL_50:
        LOBYTE(v29) = 0;
        return v29;
      }
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v28 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v53 = "AVVCSessionManager.mm";
      v54 = 1024;
      v55 = 1706;
      v56 = 2080;
      v57 = "predictIfMicrophoneShouldBeUsedForActivationMode";
      v58 = 1024;
      LODWORD(v59) = 0;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_50;
  }
  p_mSessionManagerLock = (std::recursive_mutex *)&self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v38 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock(p_mSessionManagerLock);
  -[AVAudioSession availableInputs](self->_audioSession, "availableInputs");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  p_info = &OBJC_METACLASS___AVSpeechUtterance.info;
  if (!objc_msgSend(v40, "count"))
  {
    if (kAVVCScope)
    {
      v9 = *(id *)kAVVCScope;
      if (!v9)
        goto LABEL_55;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v30 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "AVVCSessionManager.mm";
      v54 = 1024;
      v55 = 1712;
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d predictIfMicrophoneShouldBeUsedForActivationMode: No available inputs.", buf, 0x12u);
    }

    goto LABEL_55;
  }
  if (objc_msgSend(v40, "count") == 1)
  {
    objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "portType");
    v6 = (char *)objc_claimAutoreleasedReturnValue();

    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        goto LABEL_60;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v31 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v53 = "AVVCSessionManager.mm";
      v54 = 1024;
      v55 = 1716;
      v56 = 2112;
      v57 = v6;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d predictIfMicrophoneShouldBeUsedForActivationMode: Only one input available: %@", buf, 0x1Cu);
    }

LABEL_60:
    v29 = v6 == (char *)*MEMORY[0x1E0CFF118];
    if (v6 != (char *)*MEMORY[0x1E0CFF118])
    {
      if (kAVVCScope)
      {
        v32 = *(id *)kAVVCScope;
        if (!v32)
          goto LABEL_68;
      }
      else
      {
        v32 = MEMORY[0x1E0C81028];
        v33 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "AVVCSessionManager.mm";
        v54 = 1024;
        v55 = 1720;
        _os_log_impl(&dword_19B733000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d predictIfMicrophoneShouldBeUsedForActivationMode: Only one input available: Not Builtin Mic.", buf, 0x12u);
      }

    }
LABEL_68:

    goto LABEL_71;
  }
  if (a3 != 1752132965)
  {
LABEL_55:
    v29 = 0;
    goto LABEL_71;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v40;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v68, 16);
  if (!v10)
  {
    LOBYTE(v47) = 0;
    goto LABEL_70;
  }
  v47 = 0;
  v11 = *(_QWORD *)v49;
  v45 = (char *)*MEMORY[0x1E0CFF110];
  v44 = (char *)*MEMORY[0x1E0CFF160];
  v43 = (char *)*MEMORY[0x1E0CFF148];
  do
  {
    v46 = v10;
    for (i = 0; i != v46; ++i)
    {
      if (*(_QWORD *)v49 != v11)
        objc_enumerationMutation(obj);
      v13 = *(id *)(*((_QWORD *)&v48 + 1) + 8 * i);
      objc_msgSend(v13, "portType");
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      v15 = (id *)p_info[498];
      if (v15)
      {
        v16 = *v15;
        if (!v16)
          goto LABEL_32;
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0C81028];
        v18 = MEMORY[0x1E0C81028];
        v16 = v17;
      }
      v19 = v16;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "portName");
        v20 = p_info;
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UID");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v13, "portSubType");
        Get4CCFromInt(objc_msgSend(v13, "endpointType"));
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v13, "isHeadphones");
        *(_DWORD *)buf = 136316930;
        v53 = "AVVCSessionManager.mm";
        v54 = 1024;
        v55 = 1742;
        v56 = 2112;
        v57 = v14;
        v58 = 2112;
        v59 = v21;
        v60 = 2112;
        v61 = v22;
        v62 = 2048;
        v63 = v23;
        v64 = 2112;
        v65 = v24;
        v66 = 1024;
        v67 = v25;
        _os_log_impl(&dword_19B733000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d predictIfMicrophoneShouldBeUsedForActivationMode: Available input: [ portType(%@), portName(%@), portUID(%@), portSubType(%ld), endpointType(%@) isHeadphones(%d) ]", buf, 0x4Au);

        p_info = v20;
      }

LABEL_32:
      if (v14 == v45)
      {
        if (isHACProduct() && objc_msgSend(v13, "isHeadphones"))
          v27 = !-[AVVCSessionManager isPickedRouteW1](self, "isPickedRouteW1");
        else
          v27 = 1;
      }
      else
      {
        v26 = v14 == v43 || v14 == v44;
        v27 = v47;
        if (v26)
          v27 = 0;
      }
      v47 = v27;

    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v68, 16);
  }
  while (v10);
LABEL_70:

  v29 = v47 & 1;
LABEL_71:
  v34 = (id *)p_info[498];
  if (v34)
  {
    v35 = *v34;
    if (!v35)
      goto LABEL_78;
  }
  else
  {
    v35 = MEMORY[0x1E0C81028];
    v36 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v53 = "AVVCSessionManager.mm";
    v54 = 1024;
    v55 = 1780;
    v56 = 1024;
    LODWORD(v57) = v29;
    _os_log_impl(&dword_19B733000, v35, OS_LOG_TYPE_DEFAULT, "%25s:%-5d predictIfMicrophoneShouldBeUsedForActivationMode: isMicrophoneBuiltin(%d)", buf, 0x18u);
  }

LABEL_78:
  if (v38)
    std::recursive_mutex::unlock(p_mSessionManagerLock);
  return v29;
}

- (BOOL)getSiriInputSource:(unint64_t *)a3 withIdentifier:(id *)a4 withIsMicrophoneCheck:(BOOL *)a5 forActivationMode:(int64_t)a6
{
  int v11;
  void *v12;
  int64_t v13;
  BOOL v14;
  void *v15;

  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    *a3 = 1936289391;
    return 1;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v11 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  -[AVAudioSession currentRoute](self->_audioSession, "currentRoute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "siriInputSource");
  v14 = 0;
  v15 = 0;
  *a3 = v13;
  if (v13 > 1936290659)
  {
    if (v13 == 1936290660)
    {
LABEL_23:
      v14 = -[AVVCSessionManager predictIfMicrophoneShouldBeUsedForActivationMode:](self, "predictIfMicrophoneShouldBeUsedForActivationMode:", a6);
      v15 = 0;
      if (!a4)
        goto LABEL_18;
      goto LABEL_17;
    }
    if (v13 != 1936679529)
      goto LABEL_16;
LABEL_15:
    objc_msgSend(v12, "siriRemoteInputIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    goto LABEL_16;
  }
  if (v13 == 1936024681)
    goto LABEL_15;
  if (v13 == 1936286822)
    goto LABEL_23;
LABEL_16:
  if (a4)
LABEL_17:
    *a4 = objc_retainAutorelease(v15);
LABEL_18:
  if (a5)
    *a5 = v14;

  if (v11)
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return 1;
}

- (BOOL)setActivationContext:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  id v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v7 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    LOBYTE(a4) = -[AVAudioSession setActivationContext:error:](self->_audioSession, "setActivationContext:error:", v6, a4);
    if (v7)
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    if (kAVVCScope)
    {
      a4 = (id *)*(id *)kAVVCScope;
      if (!a4)
        goto LABEL_17;
    }
    else
    {
      a4 = (id *)MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315906;
      v11 = "AVVCSessionManager.mm";
      v12 = 1024;
      v13 = 1836;
      v14 = 2080;
      v15 = "setActivationContext";
      v16 = 1024;
      v17 = 0;
      _os_log_impl(&dword_19B733000, (os_log_t)a4, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v10, 0x22u);
    }

    LOBYTE(a4) = 0;
  }
LABEL_17:

  return (char)a4;
}

- (BOOL)setActive:(BOOL)a3 withOptions:(unint64_t)a4 error:(id *)a5
{
  _BOOL8 v7;
  int v9;
  BOOL v10;
  NSObject *v11;
  id v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v7 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v11 = *(id *)kAVVCScope;
      if (!v11)
        return 1;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315906;
      v15 = "AVVCSessionManager.mm";
      v16 = 1024;
      v17 = 1847;
      v18 = 2080;
      v19 = "setActive";
      v20 = 1024;
      v21 = 1;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v14, 0x22u);
    }

    return 1;
  }
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v9 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  v10 = -[AVAudioSession setActive:withOptions:error:](self->_audioSession, "setActive:withOptions:error:", v7, a4, a5);
  if (v9)
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return v10;
}

- (unsigned)getOpaqueSessionID
{
  recursive_mutex *p_mSessionManagerLock;
  int v4;
  id v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v4 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    LODWORD(self) = -[AVAudioSession opaqueSessionID](self->_audioSession, "opaqueSessionID");
    if (v4)
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    if (kAVVCScope)
    {
      self = (AVVCSessionManager *)*(id *)kAVVCScope;
      if (!self)
        return self;
    }
    else
    {
      self = (AVVCSessionManager *)MEMORY[0x1E0C81028];
      v5 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315906;
      v8 = "AVVCSessionManager.mm";
      v9 = 1024;
      v10 = 1858;
      v11 = 2080;
      v12 = "getOpaqueSessionID";
      v13 = 1024;
      v14 = 0;
      _os_log_impl(&dword_19B733000, &self->super, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v7, 0x22u);
    }

    LODWORD(self) = 0;
  }
  return self;
}

- (id)getActiveSessionDisplayIDsAsString
{
  int v3;
  recursive_mutex *p_mSessionManagerLock;
  void *v5;
  void *v6;
  __CFString *v7;

  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v3 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    -[AVAudioSession activeSessionDisplayIDs](self->_audioSession, "activeSessionDisplayIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6;
    if (v3)
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    v7 = &stru_1E3BED4C0;
  }

  return v7;
}

- (void)setupSessionNotifications:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v4 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    if (v7 && self->_audioSession)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", v7, NSSelectorFromString(CFSTR("handleInterruption:")), *MEMORY[0x1E0CFF000], self->_audioSession);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v7, NSSelectorFromString(CFSTR("handleRouteChange:")), *MEMORY[0x1E0CFF180], self->_audioSession);

    }
    if (v4)
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }

}

- (void)removeSessionNotifications:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1)
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
    v4 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable)
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    if (v7 && self->_audioSession)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:name:object:", v7, *MEMORY[0x1E0CFF000], self->_audioSession);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:name:object:", v7, *MEMORY[0x1E0CFF180], self->_audioSession);

    }
    if (v4)
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }

}

- (BOOL)setRecordingFromRemoteInput:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  recursive_mutex *p_mSessionManagerLock;
  int v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  char v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  int v17;
  void *v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BYTE v25[14];
  uint64_t v26;

  v5 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v10 = *(id *)kAVVCScope;
      if (!v10)
        return 1;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v20 = 136315906;
      v21 = "AVVCSessionManager.mm";
      v22 = 1024;
      v23 = 1917;
      v24 = 2080;
      *(_QWORD *)v25 = "setRecordingFromRemoteInput";
      *(_WORD *)&v25[8] = 1024;
      *(_DWORD *)&v25[10] = 1;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v20, 0x22u);
    }

    return 1;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v8 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_18;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315650;
    v21 = "AVVCSessionManager.mm";
    v22 = 1024;
    v23 = 1920;
    v24 = 1024;
    *(_DWORD *)v25 = v5;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setRecordingFromRemoteInput: %d", (uint8_t *)&v20, 0x18u);
  }

LABEL_18:
  ElapsedTime::ElapsedTime((ElapsedTime *)&v20, "-[AVVCSessionManager setRecordingFromRemoteInput:error:]", "setRecordingFromRemoteInput", 0);
  v12 = -[AVAudioSession setRecordingFromRemoteInput:error:](self->_audioSession, "setRecordingFromRemoteInput:error:", v5, a4);
  ElapsedTime::~ElapsedTime((ElapsedTime *)&v20);
  if ((v12 & 1) == 0 && *a4)
  {
    if (kAVVCScope)
    {
      v13 = *(id *)kAVVCScope;
      if (!v13)
        goto LABEL_32;
    }
    else
    {
      v13 = (id)MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    v16 = v13;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(*a4, "code");
      objc_msgSend(*a4, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315906;
      v21 = "AVVCSessionManager.mm";
      v22 = 1024;
      v23 = 1927;
      v24 = 1024;
      *(_DWORD *)v25 = v17;
      *(_WORD *)&v25[4] = 2112;
      *(_QWORD *)&v25[6] = v18;
      _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d Error setting recording from remote input %d, %@", (uint8_t *)&v20, 0x22u);

    }
  }
LABEL_32:
  if (v8)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return v12;
}

- (int64_t)inputNumberOfChannels
{
  recursive_mutex *p_mSessionManagerLock;
  int v4;
  int64_t v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        return 1;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315906;
      v10 = "AVVCSessionManager.mm";
      v11 = 1024;
      v12 = 1935;
      v13 = 2080;
      v14 = "inputNumberOfChannels";
      v15 = 1024;
      v16 = 1;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 1;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v4 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  v5 = -[AVAudioSession inputNumberOfChannels](self->_audioSession, "inputNumberOfChannels");
  if (v4)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return v5;
}

- (BOOL)setDuckToLevelDB:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  NSObject *v8;
  id v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
      {
LABEL_12:
        v7 = 1;
        goto LABEL_13;
      }
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315906;
      v12 = "AVVCSessionManager.mm";
      v13 = 1024;
      v14 = 1943;
      v15 = 2080;
      v16 = "setDuckToLevelDB";
      v17 = 1024;
      v18 = 1;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v11, 0x22u);
    }

    goto LABEL_12;
  }
  v7 = -[AVAudioSession setDuckToLevelDB:error:](self->_audioSession, "setDuckToLevelDB:error:", v6, a4);
LABEL_13:

  return v7;
}

- (BOOL)setDuckToLevelScalar:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  NSObject *v8;
  id v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
      {
LABEL_12:
        v7 = 1;
        goto LABEL_13;
      }
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315906;
      v12 = "AVVCSessionManager.mm";
      v13 = 1024;
      v14 = 1950;
      v15 = 2080;
      v16 = "setDuckToLevelScalar";
      v17 = 1024;
      v18 = 1;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v11, 0x22u);
    }

    goto LABEL_12;
  }
  v7 = -[AVAudioSession setDuckToLevelScalar:error:](self->_audioSession, "setDuckToLevelScalar:error:", v6, a4);
LABEL_13:

  return v7;
}

- (BOOL)isSWVolumeSupportedOnPickedRoute
{
  recursive_mutex *p_mSessionManagerLock;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_23:
        LOBYTE(v8) = 0;
        return (char)v8;
      }
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315906;
      v15 = "AVVCSessionManager.mm";
      v16 = 1024;
      v17 = 1958;
      v18 = 2080;
      v19 = "isSWVolumeSupportedOnPickedRoute";
      v20 = 1024;
      v21 = 0;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v14, 0x22u);
    }

    goto LABEL_23;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v4 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  -[AVAudioSession pickedRoute](self->_audioSession, "pickedRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (_os_feature_enabled_impl())
      objc_msgSend(v5, "objectForKey:", CFSTR("SoftwareVolumeEnabled"));
    else
      objc_msgSend(v5, "objectForKey:", CFSTR("BTDetails_SupportsSoftwareVolume"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_28;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "AVVCSessionManager.mm";
      v16 = 1024;
      v17 = 1969;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d isSWVolumeSupportedOnPickedRoute: Picked Route is nil", (uint8_t *)&v14, 0x12u);
    }

    LODWORD(v8) = 0;
  }
LABEL_28:
  if (!kAVVCScope)
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_32;
  }
  v11 = *(id *)kAVVCScope;
  if (v11)
  {
LABEL_32:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = "AVVCSessionManager.mm";
      v16 = 1024;
      v17 = 1972;
      v18 = 1024;
      LODWORD(v19) = (_DWORD)v8;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d isSWVolumeSupportedOnPickedRoute: %d", (uint8_t *)&v14, 0x18u);
    }

  }
  if (v4)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return (char)v8;
}

- (BOOL)isInputAvailable
{
  recursive_mutex *p_mSessionManagerLock;
  int v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_24:
        LOBYTE(v5) = 0;
        return v5;
      }
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315906;
      v12 = "AVVCSessionManager.mm";
      v13 = 1024;
      v14 = 1980;
      v15 = 2080;
      v16 = "isInputAvailable";
      v17 = 1024;
      v18 = 0;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v11, 0x22u);
    }

    goto LABEL_24;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v4 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  ElapsedTime::ElapsedTime((ElapsedTime *)&v11, "-[AVVCSessionManager isInputAvailable]", "isInputAvailable", 0);
  v5 = -[AVAudioSession isInputAvailable](self->_audioSession, "isInputAvailable");
  ElapsedTime::~ElapsedTime((ElapsedTime *)&v11);
  if (!kAVVCScope)
  {
    v6 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
    goto LABEL_15;
  }
  v6 = *(id *)kAVVCScope;
  if (v6)
  {
LABEL_15:
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = "AVVCSessionManager.mm";
      v13 = 1024;
      v14 = 1988;
      v15 = 1024;
      LODWORD(v16) = v5;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d input available %d", (uint8_t *)&v11, 0x18u);
    }

  }
  if (v4)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return v5;
}

- (BOOL)setMicrophoneAttribution:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  recursive_mutex *p_mSessionManagerLock;
  int v8;
  AVAudioSession *audioSession;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[10];
  int v32;
  uint64_t v33;

  v5 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v13 = *(id *)kAVVCScope;
      if (!v13)
      {
LABEL_20:
        LOBYTE(v11) = 0;
        return v11;
      }
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "AVVCSessionManager.mm";
      v28 = 1024;
      v29 = 1995;
      v30 = 2080;
      *(_QWORD *)v31 = "setMicrophoneAttribution";
      *(_WORD *)&v31[8] = 1024;
      v32 = 0;
      _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_20;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v8 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setMicrophoneAttribution:error:]", "setMicrophoneAttribution", 0);
  audioSession = self->_audioSession;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVAudioSession setMXSessionProperty:value:error:](audioSession, "setMXSessionProperty:value:error:", CFSTR("MicrophoneAttribution"), v10, a4);

  if ((v11 & 1) == 0 && *a4)
  {
    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12)
        goto LABEL_25;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = *a4;
      v20 = 136315650;
      v21 = "AVVCSessionManager.mm";
      v22 = 1024;
      v23 = 2002;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: setMicrophoneAttribution failed with error: %@", (uint8_t *)&v20, 0x1Cu);
    }

  }
LABEL_25:
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  if (!kAVVCScope)
  {
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
    goto LABEL_29;
  }
  v17 = *(id *)kAVVCScope;
  if (v17)
  {
LABEL_29:
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "AVVCSessionManager.mm";
      v28 = 1024;
      v29 = 2006;
      v30 = 1024;
      *(_DWORD *)v31 = v5;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v11;
      _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting microphone attribution : %d (bSet = %d)", buf, 0x1Eu);
    }

  }
  if (v8)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return v11;
}

- (BOOL)setPrefersBeingInterruptedByNextActiveRecordingClient:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  recursive_mutex *p_mSessionManagerLock;
  int v8;
  AVAudioSession *audioSession;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[10];
  int v32;
  uint64_t v33;

  v5 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v13 = *(id *)kAVVCScope;
      if (!v13)
      {
LABEL_20:
        LOBYTE(v11) = 0;
        return v11;
      }
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "AVVCSessionManager.mm";
      v28 = 1024;
      v29 = 2012;
      v30 = 2080;
      *(_QWORD *)v31 = "setPrefersBeingInterruptedByNextActiveRecordingClient";
      *(_WORD *)&v31[8] = 1024;
      v32 = 0;
      _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_20;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v8 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setPrefersBeingInterruptedByNextActiveRecordingClient:error:]", "setPrefersBeingInterruptedByNextActiveRecordingClient", 0);
  audioSession = self->_audioSession;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVAudioSession setMXSessionProperty:value:error:](audioSession, "setMXSessionProperty:value:error:", *MEMORY[0x1E0D49B00], v10, a4);

  if ((v11 & 1) == 0 && *a4)
  {
    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12)
        goto LABEL_25;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = *a4;
      v20 = 136315650;
      v21 = "AVVCSessionManager.mm";
      v22 = 1024;
      v23 = 2020;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: setPrefersBeingInterruptedByNextActiveRecordingClient failed with error: %@", (uint8_t *)&v20, 0x1Cu);
    }

  }
LABEL_25:
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  if (!kAVVCScope)
  {
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
    goto LABEL_29;
  }
  v17 = *(id *)kAVVCScope;
  if (v17)
  {
LABEL_29:
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "AVVCSessionManager.mm";
      v28 = 1024;
      v29 = 2025;
      v30 = 1024;
      *(_DWORD *)v31 = v5;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v11;
      _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setPrefersBeingInterruptedByNextActiveRecordingClient : %d (bSet = %d)", buf, 0x1Eu);
    }

  }
  if (v8)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return v11;
}

- (BOOL)setIsUsingBuiltInMicForRecording:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  recursive_mutex *p_mSessionManagerLock;
  int v8;
  AVAudioSession *audioSession;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[10];
  int v32;
  uint64_t v33;

  v5 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  if (isAudioSessionAvailable(void)::onceToken != -1)
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_29);
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v13 = *(id *)kAVVCScope;
      if (!v13)
      {
LABEL_20:
        LOBYTE(v11) = 0;
        return v11;
      }
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "AVVCSessionManager.mm";
      v28 = 1024;
      v29 = 2034;
      v30 = 2080;
      *(_QWORD *)v31 = "setIsUsingBuiltInMicForRecording";
      *(_WORD *)&v31[8] = 1024;
      v32 = 0;
      _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_20;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  v8 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable)
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setIsUsingBuiltInMicForRecording:error:]", "setIsUsingBuiltInMicForRecording", 0);
  audioSession = self->_audioSession;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVAudioSession setMXSessionProperty:value:error:](audioSession, "setMXSessionProperty:value:error:", *MEMORY[0x1E0D49948], v10, a4);

  if ((v11 & 1) == 0 && *a4)
  {
    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12)
        goto LABEL_25;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = *a4;
      v20 = 136315650;
      v21 = "AVVCSessionManager.mm";
      v22 = 1024;
      v23 = 2041;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: setIsUsingBuiltInMicForRecording failed with error: %@", (uint8_t *)&v20, 0x1Cu);
    }

  }
LABEL_25:
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  if (!kAVVCScope)
  {
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
    goto LABEL_29;
  }
  v17 = *(id *)kAVVCScope;
  if (v17)
  {
LABEL_29:
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "AVVCSessionManager.mm";
      v28 = 1024;
      v29 = 2045;
      v30 = 1024;
      *(_DWORD *)v31 = v5;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v11;
      _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setIsUsingBuiltInMicForRecording : %d (bSet = %d)", buf, 0x1Eu);
    }

  }
  if (v8)
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return v11;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_audioSession, a3);
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (BOOL)clientRequestsRecording
{
  return self->_clientRequestsRecording;
}

- (float)deviceGain
{
  return self->_deviceGain;
}

- (NSString)playbackRoute
{
  return self->_playbackRoute;
}

- (BOOL)forceGetSessionProperties
{
  return self->_forceGetSessionProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackRoute, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->mPreviousSessionMode, 0);
  objc_storeStrong((id *)&self->mPreviousSessionCategory, 0);
  objc_storeStrong((id *)&self->mPreviousActivationDeviceUID, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->mSessionManagerLock);
}

- (id).cxx_construct
{
  MEMORY[0x1A1AC5AE4](&self->mSessionManagerLock, a2);
  return self;
}

uint64_t __60__AVVCSessionManager_activateAudioSessionWithPrewarm_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id obj;

  v1 = *(unsigned int *)(a1 + 48);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "setActive:withOptions:error:", 1, v1, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  return v4;
}

@end
