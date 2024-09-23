@implementation MNSpeechResourceController

- (MNSpeechResourceController)initWithLanguage:(id)a3
{
  id v4;
  MNSpeechResourceController *v5;
  MNSpeechResourceController *v6;
  SiriTTSDaemonSession *v7;
  SiriTTSDaemonSession *session;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  MNSpeechResourceController *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int audioSessionID;
  objc_super v18;
  uint8_t buf[4];
  unsigned int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    GetAudioLogForMNSpeechResourceControllerCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "⒮ Invalid language", buf, 2u);
    }
    v13 = 0;
    goto LABEL_13;
  }
  v18.receiver = self;
  v18.super_class = (Class)MNSpeechResourceController;
  v5 = -[MNSpeechResourceController init](&v18, sel_init);
  if (v5)
  {
    v6 = v5;
    v7 = (SiriTTSDaemonSession *)objc_alloc_init(MEMORY[0x1E0DA78B0]);
    session = v6->_session;
    v6->_session = v7;

    objc_msgSend(MEMORY[0x1E0CFF1C8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_audioSessionID = objc_msgSend(v9, "opaqueSessionID");

    objc_msgSend(MEMORY[0x1E0CFE858], "outputVoice");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject languageCode](v10, "languageCode");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v4)
    {
      -[NSObject name](v10, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

    v14 = -[NSObject gender](v10, "gender");
    GetAudioLogForMNSpeechResourceControllerCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      audioSessionID = v6->_audioSessionID;
      *(_DWORD *)buf = 67109890;
      v20 = audioSessionID;
      v21 = 2112;
      v22 = v4;
      v23 = 2112;
      v24 = v12;
      v25 = 1024;
      v26 = v14;
      _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_INFO, "ⓢ On init : AVAudioSession id : %d, Language : '%@', Voice Name : '%@', Voice Gender : %d", buf, 0x22u);
    }

    -[MNSpeechResourceController _prepareSynthesizerWithLanguage:andVoiceName:andGender:andAudioSessionID:](v6, "_prepareSynthesizerWithLanguage:andVoiceName:andGender:andAudioSessionID:", v4, v12, v14, v6->_audioSessionID);
    -[MNSpeechResourceController _registerForObservation](v6, "_registerForObservation");
    self = v6;

    v13 = self;
LABEL_13:

    goto LABEL_14;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (void)_prepareSynthesizerWithLanguage:(id)a3 andVoiceName:(id)a4 andGender:(int64_t)a5 andAudioSessionID:(unsigned int)a6
{
  uint64_t v6;
  id v11;
  id v12;
  NSObject *v13;
  NSString *cachedVoiceLanguage;
  NSString *cachedVoiceName;
  int64_t cachedVoiceGender;
  int v17;
  NSString *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v6 = *(_QWORD *)&a6;
  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_storeStrong((id *)&self->_cachedVoiceLanguage, a3);
  objc_storeStrong((id *)&self->_cachedVoiceName, a4);
  self->_cachedVoiceGender = a5;
  GetAudioLogForMNSpeechResourceControllerCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    cachedVoiceLanguage = self->_cachedVoiceLanguage;
    cachedVoiceName = self->_cachedVoiceName;
    cachedVoiceGender = self->_cachedVoiceGender;
    v17 = 138412802;
    v18 = cachedVoiceLanguage;
    v19 = 2112;
    v20 = cachedVoiceName;
    v21 = 1024;
    v22 = cachedVoiceGender;
    _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_INFO, "ⓢ Caching language %@, name %@, and gender %d", (uint8_t *)&v17, 0x1Cu);
  }

  -[MNSpeechResourceController _warmUpTTSForLanguage:andVoiceName:andGender:andAudioSessionID:](self, "_warmUpTTSForLanguage:andVoiceName:andGender:andAudioSessionID:", self->_cachedVoiceLanguage, self->_cachedVoiceName, self->_cachedVoiceGender, v6);
  -[MNSpeechResourceController _markVoiceForDownloadingWithLanguage:andVoiceName:andGender:](self, "_markVoiceForDownloadingWithLanguage:andVoiceName:andGender:", self->_cachedVoiceLanguage, self->_cachedVoiceName, self->_cachedVoiceGender);

}

- (void)_warmUpTTSForLanguage:(id)a3 andVoiceName:(id)a4 andGender:(int64_t)a5 andAudioSessionID:(unsigned int)a6
{
  void *v7;
  NSObject *v8;
  SiriTTSDaemonSession *session;
  id v10;
  _QWORD v11[4];
  id v12;
  MNSpeechResourceController *v13;
  uint8_t buf[16];

  -[MNSpeechResourceController _synthesisRequestForUtterance:withLanguage:andVoiceName:andPrivacySensitive:](self, "_synthesisRequestForUtterance:withLanguage:andVoiceName:andPrivacySensitive:", CFSTR("prewarm kick"), a3, a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GetAudioLogForMNSpeechResourceControllerCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "Ⓢ Attempting to prewarm SiriTTSDaemonSession", buf, 2u);
  }

  -[SiriTTSDaemonSession setKeepActive:](self->_session, "setKeepActive:", 1);
  session = self->_session;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__MNSpeechResourceController__warmUpTTSForLanguage_andVoiceName_andGender_andAudioSessionID___block_invoke;
  v11[3] = &unk_1E61D79A8;
  v12 = v7;
  v13 = self;
  v10 = v7;
  -[SiriTTSDaemonSession prewarmWithRequest:didFinish:](session, "prewarmWithRequest:didFinish:", v10, v11);

}

void __93__MNSpeechResourceController__warmUpTTSForLanguage_andVoiceName_andGender_andAudioSessionID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GetAudioLogForMNSpeechResourceControllerCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "⒮    Error submitting prewarm request (this is a problem in SiriTTSDaemonSession): %@ - %@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setKeepActive:", 0);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "Ⓢ    Prewarm request succeeded: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)_markVoiceForDownloadingWithLanguage:(id)a3 andVoiceName:(id)a4 andGender:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  SiriTTSDaemonSession *session;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[MNUserOptionsEngine sharedInstance](MNUserOptionsEngine, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentVoiceLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v7);

  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA7900]), "initWithLanguage:name:", v7, v8);
    GetAudioLogForMNSpeechResourceControllerCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_INFO, "ⓢ Marking voice asset to auto-download %@", buf, 0xCu);
    }

    session = self->_session;
    v19 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __90__MNSpeechResourceController__markVoiceForDownloadingWithLanguage_andVoiceName_andGender___block_invoke;
    v17[3] = &unk_1E61D3258;
    v18 = v12;
    v16 = v12;
    -[SiriTTSDaemonSession subscribeWithVoices:reply:](session, "subscribeWithVoices:reply:", v15, v17);

  }
}

void __90__MNSpeechResourceController__markVoiceForDownloadingWithLanguage_andVoiceName_andGender___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    GetAudioLogForMNSpeechResourceControllerCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "⒮    Error marking voice asset to auto-download %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)_registerForObservation
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  GetAudioLogForMNSpeechResourceControllerCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "ⓢ Registering for observeration", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__audioSessionInterruption_, *MEMORY[0x1E0CFF008], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__mediaSessionServicesWereReset_, *MEMORY[0x1E0CFF070], 0);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  GetAudioLogForMNSpeechResourceControllerCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "ⓢ Deallocating", buf, 2u);
  }

  -[MNSpeechResourceController _cancelTimer](self, "_cancelTimer");
  v4.receiver = self;
  v4.super_class = (Class)MNSpeechResourceController;
  -[MNSpeechResourceController dealloc](&v4, sel_dealloc);
}

- (BOOL)speaking
{
  return self->_currentlySpeaking;
}

- (BOOL)cache:(id)a3 withDisclosure:(unint64_t)a4 andReport:(id *)a5
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  SiriTTSDaemonSession *session;
  NSObject *v23;
  uint8_t v25[16];
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[5];
  id from;
  id location;
  _BYTE buf[24];
  unint64_t v33;
  void (*v34)(uint64_t);
  id v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  GetAudioLogForMNSpeechResourceControllerCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[MNSpeechResourceController cache:withDisclosure:andReport:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2048;
    v33 = a4;
    _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEBUG, "%s : %@ : %lu", buf, 0x20u);
  }

  if (!objc_msgSend(v9, "length"))
  {
    GetAudioLogForMNSpeechResourceControllerCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_ERROR, "⒮ Invalid utterance", buf, 2u);
    }

    if (a5)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      NAVAudioErrorDomain();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v13, 3600, 0);
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_19:
    v16 = 0;
    goto LABEL_20;
  }
  if (a4 < 2)
  {
    -[SiriTTSDaemonSession setKeepActive:](self->_session, "setKeepActive:", 1);
    GetAudioLogForMNSpeechResourceControllerCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_INFO, "Ⓢ Attempting to start caching '%{private}@'", buf, 0xCu);
    }

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA7900]), "initWithLanguage:name:", self->_cachedVoiceLanguage, self->_cachedVoiceName);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA78F8]), "initWithText:voice:", v9, v13);
    objc_msgSend(v20, "setPrivacySensitive:", a4 == 0);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v20);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v33 = (unint64_t)__Block_byref_object_copy__14;
    v34 = __Block_byref_object_dispose__14;
    v21 = MEMORY[0x1E0C809B0];
    v35 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __61__MNSpeechResourceController_cache_withDisclosure_andReport___block_invoke;
    v29[3] = &unk_1E61D79D0;
    v29[4] = buf;
    objc_msgSend(v20, "setDidReportInstrument:", v29);
    session = self->_session;
    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __61__MNSpeechResourceController_cache_withDisclosure_andReport___block_invoke_2;
    v26[3] = &unk_1E61D79F8;
    objc_copyWeak(&v27, &location);
    objc_copyWeak(&v28, &from);
    v26[4] = buf;
    -[SiriTTSDaemonSession synthesizeWithRequest:didFinish:](session, "synthesizeWithRequest:didFinish:", v20, v26);
    GetAudioLogForMNSpeechResourceControllerCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_INFO, "Ⓢ    Synthesis request submitted", v25, 2u);
    }

    objc_storeStrong((id *)&self->_utterance, a3);
    -[MNSpeechResourceController _createTimerForUtterance:andIsCaching:](self, "_createTimerForUtterance:andIsCaching:", v9, 1);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    v16 = 1;
    goto LABEL_18;
  }
  GetAudioLogForMNSpeechResourceControllerCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = a4;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "⒮ Invalid disclosure level: %lu", buf, 0xCu);
  }

  if (!a5)
    goto LABEL_19;
  v12 = (void *)MEMORY[0x1E0CB35C8];
  NAVAudioErrorDomain();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = CFSTR("InvalidDisclosure");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 3601, v15);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  v16 = 0;
LABEL_18:

LABEL_20:
  return v16;
}

void __61__MNSpeechResourceController_cache_withDisclosure_andReport___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __61__MNSpeechResourceController_cache_withDisclosure_andReport___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "didFinishSynthesisRequest:withInstrumentMetrics:error:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v4);

}

- (double)durationOf:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  int v12;
  double v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if (!-[MNSpeechResourceController _createDurationCacheIfNecessary](self, "_createDurationCacheIfNecessary"))
    {
      -[NSCache objectForKey:](self->_durations, "objectForKey:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        -[NSObject doubleValue](v5, "doubleValue");
        if (v7 > 0.0)
        {
          v9 = v7;
          GetAudioLogForMNSpeechResourceControllerCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            v12 = 134218243;
            v13 = v9;
            v14 = 2113;
            v15 = v4;
            _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_INFO, "ⓢ Duration is using a cached value of %f for '%{private}@'", (uint8_t *)&v12, 0x16u);
          }

          goto LABEL_12;
        }
      }

    }
    -[MNSpeechResourceController _estimateDurationForUtterance:](self, "_estimateDurationForUtterance:", v4);
    v9 = v8;
    -[MNSpeechResourceController _addDurationToCache:forUtterance:](self, "_addDurationToCache:forUtterance:", v4);
    GetAudioLogForMNSpeechResourceControllerCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v12 = 134218243;
      v13 = v9;
      v14 = 2113;
      v15 = v4;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "ⓢ Duration is using an estimated value of %f for '%{private}@'", (uint8_t *)&v12, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  v9 = 0.0;
LABEL_13:

  return v9;
}

- (BOOL)speak:(id)a3 withDisclosure:(unint64_t)a4 andReport:(id *)a5
{
  char *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  SiriTTSDaemonSession *session;
  NSObject *v28;
  uint8_t v30[8];
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  char *v46;
  __int16 v47;
  unint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = (char *)a3;
  GetAudioLogForMNSpeechResourceControllerCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v44 = "-[MNSpeechResourceController speak:withDisclosure:andReport:]";
    v45 = 2112;
    v46 = v9;
    v47 = 2048;
    v48 = a4;
    _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEBUG, "ⓢ %s : %@ : %lu", buf, 0x20u);
  }

  if (!GEOConfigGetBOOL())
  {
    if (objc_msgSend(v9, "length"))
    {
      if (a4 < 2)
      {
        -[MNSpeechResourceController stopSpeakingAndReport:](self, "stopSpeakingAndReport:", 0);
        -[SiriTTSDaemonSession setKeepActive:](self->_session, "setKeepActive:", 1);
        GetAudioLogForMNSpeechResourceControllerCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v44 = v9;
          _os_log_impl(&dword_1B0AD7000, v25, OS_LOG_TYPE_INFO, "Ⓢ Attempting to start speaking '%{private}@'", buf, 0xCu);
        }

        -[MNSpeechResourceController _speechRequestForUtterance:withLanguage:andVoiceName:andAudioSessionID:andPrivacySensitive:](self, "_speechRequestForUtterance:withLanguage:andVoiceName:andAudioSessionID:andPrivacySensitive:", v9, self->_cachedVoiceLanguage, self->_cachedVoiceName, self->_audioSessionID, a4 == 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)buf, self);
        objc_initWeak(&location, v17);
        v26 = MEMORY[0x1E0C809B0];
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __61__MNSpeechResourceController_speak_withDisclosure_andReport___block_invoke;
        v37[3] = &unk_1E61D7A20;
        objc_copyWeak(&v38, (id *)buf);
        objc_copyWeak(&v39, &location);
        objc_msgSend(v17, "setDidStartSpeaking:", v37);
        v34[0] = v26;
        v34[1] = 3221225472;
        v34[2] = __61__MNSpeechResourceController_speak_withDisclosure_andReport___block_invoke_2;
        v34[3] = &unk_1E61D7A48;
        objc_copyWeak(&v35, (id *)buf);
        objc_copyWeak(&v36, &location);
        objc_msgSend(v17, "setDidReportInstrument:", v34);
        session = self->_session;
        v31[0] = v26;
        v31[1] = 3221225472;
        v31[2] = __61__MNSpeechResourceController_speak_withDisclosure_andReport___block_invoke_3;
        v31[3] = &unk_1E61D7A70;
        objc_copyWeak(&v32, (id *)buf);
        objc_copyWeak(&v33, &location);
        -[SiriTTSDaemonSession speakWithSpeechRequest:didFinish:](session, "speakWithSpeechRequest:didFinish:", v17, v31);
        GetAudioLogForMNSpeechResourceControllerCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v30 = 0;
          _os_log_impl(&dword_1B0AD7000, v28, OS_LOG_TYPE_INFO, "Ⓢ    Speech request submitted", v30, 2u);
        }

        objc_storeStrong((id *)&self->_onGoingRequest, v17);
        objc_storeStrong((id *)&self->_utterance, a3);
        -[MNSpeechResourceController _createTimerForUtterance:andIsCaching:](self, "_createTimerForUtterance:andIsCaching:", v9, 0);
        objc_destroyWeak(&v33);
        objc_destroyWeak(&v32);
        objc_destroyWeak(&v36);
        objc_destroyWeak(&v35);
        objc_destroyWeak(&v39);
        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
        goto LABEL_26;
      }
      GetAudioLogForMNSpeechResourceControllerCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v44 = (const char *)a4;
        _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "⒮ Invalid disclosure level: %lu", buf, 0xCu);
      }

      if (a5)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        NAVAudioErrorDomain();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = CFSTR("InvalidDisclosure");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", v17, 3601, v21);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v22 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      GetAudioLogForMNSpeechResourceControllerCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_ERROR, "⒮ Invalid utterance", buf, 2u);
      }

      if (a5)
      {
        v24 = (void *)MEMORY[0x1E0CB35C8];
        NAVAudioErrorDomain();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", v17, 3600, 0);
        v22 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
    }
    v22 = 0;
    goto LABEL_28;
  }
  GetAudioLogForMNSpeechResourceControllerCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v44 = CFSTR("ⓢ Debug Panel has the Mute Voice switch ON");
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_INFO, "%{private}@", buf, 0xCu);
  }

  -[MNSpeechResourceController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[MNSpeechResourceController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "speechResourceController:willStartSpeakingUtterance:", self, v9);

  }
  -[MNSpeechResourceController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[MNSpeechResourceController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "speechResourceController:didFinishSpeakingUtterance:withDuration:", self, v9, 2.0);
LABEL_26:
    v22 = 1;
    goto LABEL_27;
  }
  v22 = 1;
LABEL_28:

  return v22;
}

void __61__MNSpeechResourceController_speak_withDisclosure_andReport___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didStartSpeakingRequest:", v2);

}

void __61__MNSpeechResourceController_speak_withDisclosure_andReport___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didReceiveSpeakingRequest:withInstrumentMetrics:", v5, v4);

}

void __61__MNSpeechResourceController_speak_withDisclosure_andReport___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didFinishSpeakingRequest:withError:", v5, v4);

}

- (BOOL)stopSpeakingAndReport:(id *)a3
{
  NSString *utterance;
  SiriTTSSpeechRequest *onGoingRequest;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  -[MNSpeechResourceController _cancelTimer](self, "_cancelTimer", a3);
  if (-[MNSpeechResourceController speaking](self, "speaking"))
  {
    self->_currentlySpeaking = 0;
    utterance = self->_utterance;
    self->_utterance = 0;

    -[SiriTTSDaemonSession setKeepActive:](self->_session, "setKeepActive:", 0);
    onGoingRequest = self->_onGoingRequest;
    GetAudioLogForMNSpeechResourceControllerCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (onGoingRequest)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "Ⓢ Attempting to immediately stop current speech", buf, 2u);
      }

      -[SiriTTSDaemonSession cancelWithRequest:](self->_session, "cancelWithRequest:", self->_onGoingRequest);
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "Ⓢ No speech currently in progress", v11, 2u);
      }

    }
    GetAudioLogForMNSpeechResourceControllerCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEBUG, "Ⓢ    Stop speaking request was successful", v10, 2u);
    }

  }
  return 1;
}

- (id)_synthesisRequestForUtterance:(id)a3 withLanguage:(id)a4 andVoiceName:(id)a5 andPrivacySensitive:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v6 = a6;
  v18 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if (GEOConfigGetBOOL())
  {
    GetAudioLogForMNSpeechResourceControllerCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = 138477827;
      v17 = CFSTR("ⓢ Debug Panel has the Disable Server TTS switch ON");
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_INFO, "%{private}@", (uint8_t *)&v16, 0xCu);
    }

    v6 = 1;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA7900]), "initWithLanguage:name:", v10, v9);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA78F8]), "initWithText:voice:", v11, v13);
  objc_msgSend(v14, "setPrivacySensitive:", v6);

  return v14;
}

- (id)_speechRequestForUtterance:(id)a3 withLanguage:(id)a4 andVoiceName:(id)a5 andAudioSessionID:(unsigned int)a6 andPrivacySensitive:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  double v18;
  int v20;
  const __CFString *v21;
  uint64_t v22;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v22 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  if (GEOConfigGetBOOL())
  {
    GetAudioLogForMNSpeechResourceControllerCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = 138477827;
      v21 = CFSTR("ⓢ Debug Panel has the Disable Server TTS switch ON");
      _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_INFO, "%{private}@", (uint8_t *)&v20, 0xCu);
    }

    v7 = 1;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA7900]), "initWithLanguage:name:", v13, v12);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA78F0]), "initWithText:voice:", v14, v16);
  objc_msgSend(v17, "setAudioSessionId:", v8);
  objc_msgSend(v17, "setPrivacySensitive:", v7);
  -[MNSpeechResourceController _volumeFromUserPreference](self, "_volumeFromUserPreference");
  *(float *)&v18 = v18;
  objc_msgSend(v17, "setPlaybackVolume:", v18);

  return v17;
}

- (double)_volumeFromUserPreference
{
  double result;

  if ((GEOConfigGetBOOL() & 1) == 0)
    GEOConfigGetInteger();
  GEOConfigGetDouble();
  return result;
}

- (BOOL)_createDurationCacheIfNecessary
{
  NSCache *durations;
  NSCache *v4;
  NSCache *v5;

  durations = self->_durations;
  if (!durations)
  {
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v5 = self->_durations;
    self->_durations = v4;

  }
  return durations == 0;
}

- (void)_addDurationToCache:(double)a3 forUtterance:(id)a4
{
  NSCache *durations;
  void *v6;
  id v7;
  id v8;

  durations = self->_durations;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSCache setObject:forKey:](durations, "setObject:forKey:", v8, v7);

}

- (double)_estimateDurationForUtterance:(id)a3
{
  void *v4;
  void *v5;
  unint64_t charactersSpokenCount;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a3, "_navigation_stripTagsFromSpokenString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  charactersSpokenCount = self->_charactersSpokenCount;
  if (charactersSpokenCount < 0x33)
  {
    if (objc_msgSend(v4, "_navigation_isCJK"))
      v8 = 0.2;
    else
      v8 = 0.07;
  }
  else
  {
    v7 = self->_charactersSpokenDuration / (double)charactersSpokenCount;
    if (v7 > 0.4)
      v7 = 0.4;
    v8 = fmax(v7, 0.04);
  }
  v9 = v8 * (double)(unint64_t)objc_msgSend(v5, "length");

  return v9;
}

- (void)_createTimerForUtterance:(id)a3 andIsCaching:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  char **v11;
  NSTimer *v12;
  NSTimer *timer;
  int v14;
  double v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  -[MNSpeechResourceController durationOf:](self, "durationOf:", a3);
  v7 = v6 * 1.5;
  v8 = v6 + 2.0;
  if (v7 >= v8)
    v9 = v7;
  else
    v9 = v8;
  GetAudioLogForMNSpeechResourceControllerCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v14 = 134217984;
    v15 = v9;
    _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_INFO, "ⓢ Creating timer with timeout: %f", (uint8_t *)&v14, 0xCu);
  }

  -[MNSpeechResourceController _cancelTimer](self, "_cancelTimer");
  v11 = &selRef__cachingTimeoutOccurred_;
  if (!v4)
    v11 = &selRef__speakingTimeoutOccurred_;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, *v11, 0, 0, v9);
  v12 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timer = self->_timer;
  self->_timer = v12;

}

- (void)_cancelTimer
{
  NSObject *v3;
  NSTimer *timer;
  uint8_t v5[16];

  if (self->_timer)
  {
    GetAudioLogForMNSpeechResourceControllerCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "ⓢ Stopping timer", v5, 2u);
    }

    -[NSTimer invalidate](self->_timer, "invalidate");
    timer = self->_timer;
    self->_timer = 0;

  }
}

- (void)_cachingTimeoutOccurred:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  GetAudioLogForMNSpeechResourceControllerCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "⒮ Synthesizer could not cache within specified time", v11, 2u);
  }

  -[MNSpeechResourceController _cancelTimer](self, "_cancelTimer");
  -[SiriTTSDaemonSession setKeepActive:](self->_session, "setKeepActive:", 0);
  -[MNSpeechResourceController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    NAVAudioErrorDomain();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 3605, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MNSpeechResourceController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "speechResourceController:didTimeoutWhileSpeakingUtterance:withError:", self, self->_utterance, v9);

  }
}

- (void)_speakingTimeoutOccurred:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GetAudioLogForMNSpeechResourceControllerCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "timeInterval");
    v13 = 134217984;
    v14 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "⒮ Synthesizer could not speak within specified time (%.3f) or nothing was spoken", (uint8_t *)&v13, 0xCu);
  }

  -[MNSpeechResourceController _cancelTimer](self, "_cancelTimer");
  -[SiriTTSDaemonSession setKeepActive:](self->_session, "setKeepActive:", 0);
  -[MNSpeechResourceController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    NAVAudioErrorDomain();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 3609, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[MNSpeechResourceController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "speechResourceController:didTimeoutWhileSpeakingUtterance:withError:", self, self->_utterance, v11);

  }
}

- (void)didFinishSynthesisRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SiriTTSDaemonSession *session;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  SiriTTSDaemonSession *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  GetAudioLogForMNSpeechResourceControllerCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    session = self->_session;
    *(_DWORD *)buf = 136316162;
    v30 = "-[MNSpeechResourceController didFinishSynthesisRequest:withInstrumentMetrics:error:]";
    v31 = 2112;
    v32 = session;
    v33 = 2112;
    v34 = v8;
    v35 = 2112;
    v36 = v9;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEBUG, "%s : %@ : %@ : %@ : %@", buf, 0x34u);
  }

  -[MNSpeechResourceController _cancelTimer](self, "_cancelTimer");
  objc_msgSend(v9, "audioDuration");
  v14 = v13;
  objc_msgSend(v8, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriTTSDaemonSession setKeepActive:](self->_session, "setKeepActive:", 0);
  if (v10)
  {
    GetAudioLogForMNSpeechResourceControllerCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = (const char *)v8;
      v31 = 2112;
      v32 = (SiriTTSDaemonSession *)v10;
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "⒮    Error while processing synthesis request : %@ - %@", buf, 0x16u);
    }

    -[MNSpeechResourceController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      if (objc_msgSend(v10, "code") == 1)
        v19 = 3604;
      else
        v19 = 3603;
      v20 = (void *)MEMORY[0x1E0CB35C8];
      NAVAudioErrorDomain();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *MEMORY[0x1E0CB3388];
      v28 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v19, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[MNSpeechResourceController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "speechResourceController:didFailWhileCachingUtterance:withError:", self, v15, v23);

      goto LABEL_13;
    }
  }
  else
  {
    -[MNSpeechResourceController _addDurationToCache:forUtterance:](self, "_addDurationToCache:forUtterance:", v15, v14);
    -[MNSpeechResourceController _updateEstimatorWithDuration:andUtterance:](self, "_updateEstimatorWithDuration:andUtterance:", v15, v14);
    -[MNSpeechResourceController delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      -[MNSpeechResourceController delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "speechResourceController:didCacheUtterance:withDuration:", self, v15, v14);
LABEL_13:

    }
  }

}

- (void)didStartSpeakingRequest:(id)a3
{
  id v4;
  NSObject *v5;
  SiriTTSDaemonSession *session;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  SiriTTSDaemonSession *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GetAudioLogForMNSpeechResourceControllerCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    session = self->_session;
    v11 = 136315650;
    v12 = "-[MNSpeechResourceController didStartSpeakingRequest:]";
    v13 = 2112;
    v14 = session;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEBUG, "%s : %@ : %@", (uint8_t *)&v11, 0x20u);
  }

  self->_currentlySpeaking = 1;
  -[MNSpeechResourceController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[MNSpeechResourceController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "speechResourceController:willStartSpeakingUtterance:", self, v10);

  }
}

- (void)didReceiveSpeakingRequest:(id)a3 withInstrumentMetrics:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SiriTTSDaemonSession *session;
  double v10;
  double v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  SiriTTSDaemonSession *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GetAudioLogForMNSpeechResourceControllerCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    session = self->_session;
    v16 = 136315906;
    v17 = "-[MNSpeechResourceController didReceiveSpeakingRequest:withInstrumentMetrics:]";
    v18 = 2112;
    v19 = session;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEBUG, "%s : %@ : %@ : %@", (uint8_t *)&v16, 0x2Au);
  }

  -[MNSpeechResourceController _cancelTimer](self, "_cancelTimer");
  self->_currentlySpeaking = 0;
  -[SiriTTSDaemonSession setKeepActive:](self->_session, "setKeepActive:", 0);
  objc_msgSend(v7, "audioDuration");
  v11 = v10;
  objc_msgSend(v6, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNSpeechResourceController _addDurationToCache:forUtterance:](self, "_addDurationToCache:forUtterance:", v12, v11);
  -[MNSpeechResourceController _updateEstimatorWithDuration:andUtterance:](self, "_updateEstimatorWithDuration:andUtterance:", v12, v11);
  -[MNSpeechResourceController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[MNSpeechResourceController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "speechResourceController:didFinishSpeakingUtterance:withDuration:", self, v12, v11);

  }
}

- (void)didFinishSpeakingRequest:(id)a3 withError:(id)a4
{
  char *v6;
  id v7;
  NSObject *v8;
  SiriTTSDaemonSession *session;
  NSObject *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  SiriTTSDaemonSession *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  if (v7)
  {
    GetAudioLogForMNSpeechResourceControllerCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      session = self->_session;
      *(_DWORD *)buf = 136315906;
      v23 = "-[MNSpeechResourceController didFinishSpeakingRequest:withError:]";
      v24 = 2112;
      v25 = session;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEBUG, "%s : %@ : %@  : %@", buf, 0x2Au);
    }

    -[MNSpeechResourceController _cancelTimer](self, "_cancelTimer");
    self->_currentlySpeaking = 0;
    -[SiriTTSDaemonSession setKeepActive:](self->_session, "setKeepActive:", 0);
    GetAudioLogForMNSpeechResourceControllerCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v6;
      v24 = 2112;
      v25 = (SiriTTSDaemonSession *)v7;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "⒮    Error while processing speech request : %@ - %@", buf, 0x16u);
    }

    -[MNSpeechResourceController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      if (objc_msgSend(v7, "code") == 1)
        v13 = 3608;
      else
        v13 = 3607;
      v14 = (void *)MEMORY[0x1E0CB35C8];
      NAVAudioErrorDomain();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0CB3388];
      v21 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v13, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[MNSpeechResourceController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "text");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "speechResourceController:didFailWhileSpeakingUtterance:withError:", self, v19, v17);

    }
  }

}

- (void)_updateEstimatorWithDuration:(double)a3 andUtterance:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  NSObject *v13;
  unint64_t v14;
  double v15;
  const char *v16;
  unint64_t charactersSpokenCount;
  double charactersSpokenDuration;
  int v19;
  unint64_t v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  v8 = a3 >= 1.0 && a3 <= 60.0;
  if (v8 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(v7, "_navigation_stripTagsFromSpokenString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    v11 = self->_charactersSpokenCount + v10;
    self->_charactersSpokenCount = v11;
    v12 = self->_charactersSpokenDuration + a3;
    self->_charactersSpokenDuration = v12;
    if (v11 < 0x2711)
    {
      GetAudioLogForMNSpeechResourceControllerCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        charactersSpokenCount = self->_charactersSpokenCount;
        charactersSpokenDuration = self->_charactersSpokenDuration;
        v19 = 134218240;
        v20 = charactersSpokenCount;
        v21 = 2048;
        v22 = charactersSpokenDuration;
        v16 = "ⓢ Updated estimator: chars spoken %lu : duration %f";
        goto LABEL_12;
      }
    }
    else
    {
      self->_charactersSpokenCount = v11 >> 1;
      self->_charactersSpokenDuration = v12 * 0.5;
      GetAudioLogForMNSpeechResourceControllerCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = self->_charactersSpokenCount;
        v15 = self->_charactersSpokenDuration;
        v19 = 134218240;
        v20 = v14;
        v21 = 2048;
        v22 = v15;
        v16 = "ⓢ Updated estimator (clamped): chars spoken %lu : duration %f";
LABEL_12:
        _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v19, 0x16u);
      }
    }

  }
}

- (void)_audioSessionInterruption:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD *v9;
  void *v10;
  NSString *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFF038]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == 1 && -[MNSpeechResourceController speaking](self, "speaking"))
  {
    GetAudioLogForMNSpeechResourceControllerCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    v9 = (_QWORD *)MEMORY[0x1E0CFF028];
    if (v8)
    {
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFF028]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "ⓢ Media services were interrupted - %@", buf, 0xCu);

    }
    v11 = self->_utterance;
    -[MNSpeechResourceController stopSpeakingAndReport:](self, "stopSpeakingAndReport:", 0);
    -[MNSpeechResourceController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      NAVAudioErrorDomain();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", *v9, *MEMORY[0x1E0CB3388]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[MNSpeechResourceController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "speechResourceController:wasInterruptedWhileSpeakingUtterance:withError:", self, v11, v18);

    }
  }

}

- (void)_mediaSessionServicesWereReset:(id)a3
{
  void *v4;
  NSObject *v5;
  unsigned int audioSessionID;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CFF1C8], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_audioSessionID = objc_msgSend(v4, "opaqueSessionID");

  GetAudioLogForMNSpeechResourceControllerCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    audioSessionID = self->_audioSessionID;
    v7[0] = 67109120;
    v7[1] = audioSessionID;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "ⓢ Media services were reset. New session id: %d", (uint8_t *)v7, 8u);
  }

}

- (MNSpeechControllerDelegate)delegate
{
  return (MNSpeechControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_cachedVoiceName, 0);
  objc_storeStrong((id *)&self->_cachedVoiceLanguage, 0);
  objc_storeStrong((id *)&self->_onGoingRequest, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
