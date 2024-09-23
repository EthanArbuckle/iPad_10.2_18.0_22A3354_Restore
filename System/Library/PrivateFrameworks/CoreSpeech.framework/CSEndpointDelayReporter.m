@implementation CSEndpointDelayReporter

- (CSEndpointDelayReporter)initWithRequestMHUUID:(id)a3 turnIdentifier:(id)a4
{
  return -[CSEndpointDelayReporter initWithRequestMHUUID:turnIdentifier:withMedocEnabled:](self, "initWithRequestMHUUID:turnIdentifier:withMedocEnabled:", a3, a4, 0);
}

- (CSEndpointDelayReporter)initWithRequestMHUUID:(id)a3 turnIdentifier:(id)a4 withMedocEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  CSEndpointDelayReporter *v10;
  uint64_t v11;
  NSString *requestMHUUID;
  uint64_t v13;
  NSUUID *turnIdentifier;
  NSObject *v15;
  NSString *v16;
  NSUUID *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  NSUUID *v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CSEndpointDelayReporter;
  v10 = -[CSEndpointDelayReporter init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    requestMHUUID = v10->_requestMHUUID;
    v10->_requestMHUUID = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    turnIdentifier = v10->_turnIdentifier;
    v10->_turnIdentifier = (NSUUID *)v13;

    v10->_isMedocEnabled = v5;
    v15 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v10->_requestMHUUID;
      v17 = v10->_turnIdentifier;
      *(_DWORD *)buf = 136315906;
      v21 = "-[CSEndpointDelayReporter initWithRequestMHUUID:turnIdentifier:withMedocEnabled:]";
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      v26 = 1024;
      v27 = v5;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s _requestMHUUID: %@, _turnIdentifier: %@ _medocEnabled: %d", buf, 0x26u);
    }
    -[CSEndpointDelayReporter reset](v10, "reset");
  }

  return v10;
}

- (void)reset
{
  NSObject *v3;
  NSString *curTRPId;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSEndpointDelayReporter reset]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  self->_didReportEndpointDelay = 0;
  *(_OWORD *)&self->_endpointTimeInMs = 0u;
  *(_OWORD *)&self->_userSpeakingEndedTimeInMs = 0u;
  *(_OWORD *)&self->_endpointHostTime = 0u;
  *(_OWORD *)&self->_userSpeakingStartedHostTime = 0u;
  self->_stopRecordingHostTime = 0;
  curTRPId = self->_curTRPId;
  self->_curTRPId = 0;

}

- (unint64_t)estimatedUserSpeakingStartedHostTime
{
  double endpointTimeInMs;
  NSObject *v5;
  unint64_t endpointBufferHostTime;
  double userSpeakingStartedTimeInMs;
  int v8;
  const char *v9;
  __int16 v10;
  double v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  endpointTimeInMs = self->_endpointTimeInMs;
  if (endpointTimeInMs > 0.0 && self->_endpointBufferHostTime && endpointTimeInMs > self->_userSpeakingStartedTimeInMs)
    return CSMachAbsoluteTimeSubtractTimeInterval();
  v5 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_ERROR))
  {
    endpointBufferHostTime = self->_endpointBufferHostTime;
    userSpeakingStartedTimeInMs = self->_userSpeakingStartedTimeInMs;
    v8 = 136315906;
    v9 = "-[CSEndpointDelayReporter estimatedUserSpeakingStartedHostTime]";
    v10 = 2050;
    v11 = endpointTimeInMs;
    v12 = 2050;
    v13 = endpointBufferHostTime;
    v14 = 2050;
    v15 = userSpeakingStartedTimeInMs;
    _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Unable to accurately estimate userSpeakingStartedHostTime. _endpointTimeInMs: %{public}f, _endpointBufferHostTime: %{public}llu, _userSpeakingStartedTimeInMs: %{public}f", (uint8_t *)&v8, 0x2Au);
  }
  return 0;
}

- (unint64_t)estimatedUserSpeakingEndedHostTime
{
  double endpointTimeInMs;
  double userSpeakingEndedTimeInMs;
  NSObject *v6;
  unint64_t endpointBufferHostTime;
  double v9;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  endpointTimeInMs = self->_endpointTimeInMs;
  if (endpointTimeInMs > 0.0 && self->_endpointBufferHostTime)
  {
    userSpeakingEndedTimeInMs = self->_userSpeakingEndedTimeInMs;
    if (userSpeakingEndedTimeInMs > 0.0 && endpointTimeInMs > userSpeakingEndedTimeInMs)
      return CSMachAbsoluteTimeSubtractTimeInterval();
  }
  v6 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_ERROR))
  {
    v9 = self->_userSpeakingEndedTimeInMs;
    endpointBufferHostTime = self->_endpointBufferHostTime;
    v10 = 136315906;
    v11 = "-[CSEndpointDelayReporter estimatedUserSpeakingEndedHostTime]";
    v12 = 2050;
    v13 = endpointTimeInMs;
    v14 = 2050;
    v15 = endpointBufferHostTime;
    v16 = 2050;
    v17 = v9;
    _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Unable to accurately estimate userSpeakingEndedHostTime. _endpointTimeInMs: %{public}f, _endpointBufferHostTime: %{public}llu, _userSpeakingEndedTimeInMs: %{public}f", (uint8_t *)&v10, 0x2Au);
  }
  return 0;
}

- (void)setSpeechRecognizedContext:(id)a3 withEndpointerMetrics:(id)a4 withTrpId:(id)a5
{
  id v8;
  id v9;

  objc_storeStrong((id *)&self->_curTRPId, a5);
  v8 = a4;
  v9 = a3;
  -[CSEndpointDelayReporter setSpeechRecognizedContext:withEndpointerMetrics:](self, "setSpeechRecognizedContext:withEndpointerMetrics:", v9, v8);

}

- (void)setSpeechRecognizedContext:(id)a3 withEndpointerMetrics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  NSObject *v17;
  double userSpeakingStartedTimeInMs;
  double userSpeakingEndedTimeInMs;
  unint64_t stopRecordingHostTime;
  unint64_t endpointBufferHostTime;
  unint64_t endpointHostTime;
  unint64_t userSpeakingStartedHostTime;
  unint64_t audioDeliveryHostTimeDelta;
  int v25;
  const char *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  unint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    v7 = a3;
    objc_msgSend(v7, "objectForKey:", CFSTR("leadingSilence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("trailingSilence"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("endTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && v9 && v10)
    {
      objc_msgSend(v8, "doubleValue");
      self->_userSpeakingStartedTimeInMs = v11;
      objc_msgSend(v10, "doubleValue");
      v13 = v12;
      objc_msgSend(v9, "doubleValue");
      self->_userSpeakingEndedTimeInMs = v13 - v14;
      self->_endpointBufferHostTime = objc_msgSend(v6, "endpointBufferHostTime");
      self->_endpointHostTime = objc_msgSend(v6, "endpointHostTime");
      self->_audioDeliveryHostTimeDelta = objc_msgSend(v6, "audioDeliveryHostTimeDelta");
      objc_msgSend(v6, "totalAudioRecorded");
      self->_endpointTimeInMs = v15;
      self->_userSpeakingStartedHostTime = -[CSEndpointDelayReporter estimatedUserSpeakingStartedHostTime](self, "estimatedUserSpeakingStartedHostTime");
      v16 = -[CSEndpointDelayReporter estimatedUserSpeakingEndedHostTime](self, "estimatedUserSpeakingEndedHostTime");
      self->_userSpeakingEndedHostTime = v16;
      v17 = *MEMORY[0x1E0D18F40];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
      {
        userSpeakingStartedTimeInMs = self->_userSpeakingStartedTimeInMs;
        userSpeakingEndedTimeInMs = self->_userSpeakingEndedTimeInMs;
        stopRecordingHostTime = self->_stopRecordingHostTime;
        endpointBufferHostTime = self->_endpointBufferHostTime;
        endpointHostTime = self->_endpointHostTime;
        audioDeliveryHostTimeDelta = self->_audioDeliveryHostTimeDelta;
        userSpeakingStartedHostTime = self->_userSpeakingStartedHostTime;
        v25 = 136317186;
        v26 = "-[CSEndpointDelayReporter setSpeechRecognizedContext:withEndpointerMetrics:]";
        v27 = 2050;
        v28 = userSpeakingStartedTimeInMs;
        v29 = 2050;
        v30 = userSpeakingEndedTimeInMs;
        v31 = 2050;
        v32 = userSpeakingStartedHostTime;
        v33 = 2050;
        v34 = v16;
        v35 = 2050;
        v36 = stopRecordingHostTime;
        v37 = 2050;
        v38 = endpointBufferHostTime;
        v39 = 2050;
        v40 = endpointHostTime;
        v41 = 2050;
        v42 = audioDeliveryHostTimeDelta;
        _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s _userSpeakingStartedTimeInMs %{public}f, _userSpeakingEndedTimeInMs: %{public}f, _userSpeakingStartedHostTime: %{public}llu, _userSpeakingEndedHostTime: %{public}llu, _stopRecordingHostTime: %{public}llu, _endpointBufferHostTime: %{public}llu, _endpointHostTime: %{public}llu, _audioDeliveryHostTimeDelta: %{public}llu", (uint8_t *)&v25, 0x5Cu);
      }
      -[CSEndpointDelayReporter _reportUserSpeakingContext](self, "_reportUserSpeakingContext");
    }

  }
}

- (void)reportEndpointDelayIfNeed
{
  os_log_t *v3;
  unint64_t stopRecordingHostTime;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  NSObject *v33;
  double v34;
  double v35;
  unint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double userSpeakingStartedTimeInMs;
  double v43;
  double v44;
  double v45;
  double v46;
  NSObject *v47;
  NSString *requestMHUUID;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t userSpeakingEndedHostTime;
  double userSpeakingEndedTimeInMs;
  double endpointTimeInMs;
  _QWORD v56[4];
  _QWORD v57[4];
  _QWORD v58[3];
  _QWORD v59[3];
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0D18F40];
  if (self->_didReportEndpointDelay)
    goto LABEL_19;
  stopRecordingHostTime = self->_stopRecordingHostTime;
  if (!stopRecordingHostTime)
  {
LABEL_15:
    v24 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_ERROR))
    {
      userSpeakingEndedHostTime = self->_userSpeakingEndedHostTime;
      userSpeakingEndedTimeInMs = self->_userSpeakingEndedTimeInMs;
      endpointTimeInMs = self->_endpointTimeInMs;
      *(_DWORD *)buf = 136316162;
      v61 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
      v62 = 2050;
      v63 = (const char *)stopRecordingHostTime;
      v64 = 2050;
      v65 = (const char *)userSpeakingEndedHostTime;
      v66 = 2050;
      v67 = userSpeakingEndedTimeInMs;
      v68 = 2050;
      v69 = endpointTimeInMs;
      _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s Not reporting EPD due to unexpected zero or negative component values: _stopRecordingHostTime: %{public}llu, _userSpeakingEndedHostTime: %{public}llu, _userSpeakingEndedTimeInMs: %{public}f, _endpointTimeInMs: %{public}f", buf, 0x34u);
      stopRecordingHostTime = self->_stopRecordingHostTime;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", stopRecordingHostTime, CFSTR("stopRecordingHostTime"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v25;
    v56[1] = CFSTR("userSpeakingEndedHostTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_userSpeakingEndedHostTime);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v26;
    v56[2] = CFSTR("userSpeakingEndedTimeInMs");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_userSpeakingEndedTimeInMs);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v27;
    v56[3] = CFSTR("endpointTimeInMs");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endpointTimeInMs);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v57[3] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = (_QWORD *)MEMORY[0x1E0D19318];
    goto LABEL_18;
  }
  v5 = self->_userSpeakingEndedHostTime;
  if (!v5 || self->_userSpeakingEndedTimeInMs <= 0.0 || self->_endpointTimeInMs <= 0.0)
  {
    if (self->_endpointTimeInMs >= 0.0 && self->_userSpeakingEndedTimeInMs >= 0.0)
      goto LABEL_19;
    goto LABEL_15;
  }
  self->_didReportEndpointDelay = 1;
  objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToTimeInterval:", stopRecordingHostTime - v5);
  v7 = v6 * 1000.0;
  v8 = self->_endpointTimeInMs - self->_userSpeakingEndedTimeInMs;
  v9 = v6 * 1000.0 - v8;
  CSMachAbsoluteTimeGetTimeInterval();
  v11 = v10 * 1000.0;
  v12 = v8 + v10 * 1000.0;
  v13 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v61 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
    v62 = 2050;
    v63 = *(const char **)&v7;
    v64 = 2050;
    v65 = *(const char **)&v8;
    v66 = 2050;
    v67 = v9;
    v68 = 2050;
    v69 = v8 + v11;
    v70 = 2050;
    v71 = v11;
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "KeyLog - %s EPD (ms): %{public}f, EPD_Model (ms): %{public}f, EPD_Latency (ms): %{public}f, EPD_V2 (ms): %{public}f, EPD_Latency_V2 (ms): %{public}f", buf, 0x3Eu);
  }
  v14 = mach_continuous_time();
  v15 = mach_absolute_time();
  v16 = (id *)MEMORY[0x1E0D18F60];
  v17 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0D18F60]);
  v18 = *v16;
  v19 = v18;
  if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v22 = *v16;
  }
  else
  {
    v20 = v14 - v15;
    if (os_signpost_enabled(v18))
    {
      v21 = (const char *)(self->_userSpeakingEndedHostTime + v20);
      *(_DWORD *)buf = 134349570;
      v61 = v21;
      v62 = 2080;
      v63 = "SiriX";
      v64 = 2080;
      v65 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl(&dword_1C2614000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "EndpointDelay", "%{public, signpost.description:begin_time}llu, %s %s", buf, 0x20u);
    }

    v22 = *v16;
    if (os_signpost_enabled(v22))
    {
      v23 = (const char *)(self->_stopRecordingHostTime + v20);
      *(_DWORD *)buf = 134349570;
      v61 = v23;
      v62 = 2080;
      v63 = "SiriX";
      v64 = 2080;
      v65 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl(&dword_1C2614000, v22, OS_SIGNPOST_INTERVAL_END, v17, "EndpointDelay", "%{public, signpost.description:end_time}llu, %s %s", buf, 0x20u);
    }
  }

  *(float *)&v38 = v7;
  v39 = (double)(unint64_t)objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v38);
  *(float *)&v40 = v8;
  v41 = (double)(unint64_t)objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v40);
  userSpeakingStartedTimeInMs = self->_userSpeakingStartedTimeInMs;
  *(float *)&userSpeakingStartedTimeInMs = userSpeakingStartedTimeInMs;
  v43 = (double)(unint64_t)objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", userSpeakingStartedTimeInMs);
  v44 = self->_userSpeakingEndedTimeInMs;
  *(float *)&v44 = v44;
  v45 = (double)(unint64_t)objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v44);
  *(float *)&v46 = v12;
  -[CSEndpointDelayReporter _emitEndpointDelayMessage:epdModel:speakingStart:speakingEnd:epdV2:](self, "_emitEndpointDelayMessage:epdModel:speakingStart:speakingEnd:epdV2:", v39, v41, v43, v45, (double)(unint64_t)objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v46));
  v47 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    requestMHUUID = self->_requestMHUUID;
    *(_DWORD *)buf = 136315394;
    v61 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
    v62 = 2112;
    v63 = (const char *)requestMHUUID;
    _os_log_impl(&dword_1C2614000, v47, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointDelayContextEvent to SELF for MH ID: %@", buf, 0x16u);
  }
  if (v7 < 0.0 || v8 < 0.0 || v9 < 0.0)
  {
    v49 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v61 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
      v62 = 2048;
      v63 = *(const char **)&v7;
      v64 = 2048;
      v65 = *(const char **)&v8;
      v66 = 2048;
      v67 = v9;
      _os_log_error_impl(&dword_1C2614000, v49, OS_LOG_TYPE_ERROR, "%s One or more EPD values are negative: EPD: %f, EPD_Model: %f, EPD_Latency: %f", buf, 0x2Au);
    }
    v58[0] = CFSTR("EPD");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v50;
    v58[1] = CFSTR("EPD_Model");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v51;
    v58[2] = CFSTR("EPD_Latency");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v32 = (_QWORD *)MEMORY[0x1E0D19328];
LABEL_18:
    objc_msgSend(v30, "submitEndpointerIssueReport:withContext:", *v32, v29);

  }
LABEL_19:
  v33 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v34 = self->_endpointTimeInMs;
    v35 = self->_userSpeakingEndedTimeInMs;
    v36 = self->_userSpeakingEndedHostTime;
    v37 = *(double *)&self->_stopRecordingHostTime;
    *(_DWORD *)buf = 136316162;
    v61 = "-[CSEndpointDelayReporter reportEndpointDelayIfNeed]";
    v62 = 2050;
    v63 = *(const char **)&v34;
    v64 = 2050;
    v65 = *(const char **)&v35;
    v66 = 2050;
    v67 = *(double *)&v36;
    v68 = 2050;
    v69 = v37;
    _os_log_impl(&dword_1C2614000, v33, OS_LOG_TYPE_DEFAULT, "%s endpointTimeInMs %{public}f, userSpeakingEndedTime: %{public}f, _userSpeakingEndedMachAbsTime: %{public}llu, stopRecordingMachAbsTime: %{public}llu", buf, 0x34u);
  }
}

- (void)instrumentEndpointSignpostsForServerEndpointWithEndTime:(double)a3 leadingSilence:(double)a4 trailingSilence:(double)a5 stopRecordingMachContinuousTime:(unint64_t)a6 skippedSamplesTimeInSec:(double)a7 firstAudioSampleSensorHostTime:(unint64_t)a8
{
  double v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  NSString *requestMHUUID;
  id *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  int v33;
  const char *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  CSMachAbsoluteTimeToMachContinuousTime();
  CSMachAbsoluteTimeAddTimeInterval();
  v14 = a3 - a5;
  v15 = CSMachAbsoluteTimeAddTimeInterval();
  if (a6 >= v15)
  {
    v19 = (void *)MEMORY[0x1E0D19118];
    CSMachAbsoluteTimeGetTimeInterval();
    *(float *)&v20 = v20;
    v21 = (double)(unint64_t)objc_msgSend(v19, "secondsToNs:", v20);
    *(float *)&v22 = a5;
    v23 = (double)(unint64_t)objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v22);
    *(float *)&v24 = a4;
    v25 = (double)(unint64_t)objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v24);
    *(float *)&v26 = v14;
    -[CSEndpointDelayReporter _emitEndpointDelayMessage:epdModel:speakingStart:speakingEnd:epdV2:](self, "_emitEndpointDelayMessage:epdModel:speakingStart:speakingEnd:epdV2:", v21, v23, v25, (double)(unint64_t)objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v26), 0.0);
    v27 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      requestMHUUID = self->_requestMHUUID;
      v33 = 136316418;
      v34 = "-[CSEndpointDelayReporter instrumentEndpointSignpostsForServerEndpointWithEndTime:leadingSilence:trailingSil"
            "ence:stopRecordingMachContinuousTime:skippedSamplesTimeInSec:firstAudioSampleSensorHostTime:]";
      v35 = 2112;
      v36 = *(double *)&requestMHUUID;
      v37 = 2050;
      v38 = v21 / 1000000.0;
      v39 = 2050;
      v40 = v23 / 1000000.0;
      v41 = 2050;
      v42 = (v21 - v23) / 1000000.0;
      v43 = 2050;
      v44 = a7;
      _os_log_impl(&dword_1C2614000, v27, OS_LOG_TYPE_DEFAULT, "KeyLog - %s Submitted SEP to SELF for MH ID: %@ - EPD (ms): %{public}f, EPD_Model (ms): %{public}f, EPD_Latency (ms): %{public}f, Skipped Samples (sec): %{public}f", (uint8_t *)&v33, 0x3Eu);
    }
    self->_userSpeakingStartedHostTime = CSMachAbsoluteTimeAddTimeInterval();
    self->_userSpeakingEndedHostTime = CSMachAbsoluteTimeAddTimeInterval();
    -[CSEndpointDelayReporter _reportUserSpeakingContext](self, "_reportUserSpeakingContext");
    v29 = (id *)MEMORY[0x1E0D18F60];
    v30 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0D18F60]);
    v31 = *v29;
    v32 = v31;
    if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v17 = *v29;
    }
    else
    {
      if (os_signpost_enabled(v31))
      {
        v33 = 134349570;
        v34 = (const char *)v15;
        v35 = 2080;
        v36 = COERCE_DOUBLE("SiriX");
        v37 = 2080;
        v38 = COERCE_DOUBLE("enableTelemetry=YES");
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "EndpointDelay", "%{public, signpost.description:begin_time}llu, %s %s", (uint8_t *)&v33, 0x20u);
      }

      v17 = *v29;
      if (os_signpost_enabled(v17))
      {
        v33 = 134349570;
        v34 = (const char *)a6;
        v35 = 2080;
        v36 = COERCE_DOUBLE("SiriX");
        v37 = 2080;
        v38 = COERCE_DOUBLE("enableTelemetry=YES");
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v17, OS_SIGNPOST_INTERVAL_END, v30, "EndpointDelay", "%{public, signpost.description:end_time}llu, %s %s", (uint8_t *)&v33, 0x20u);
      }
    }
  }
  else
  {
    v16 = (void *)*MEMORY[0x1E0D18F40];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
      return;
    v17 = v16;
    CSMachAbsoluteTimeGetTimeInterval();
    v33 = 136315650;
    v34 = "-[CSEndpointDelayReporter instrumentEndpointSignpostsForServerEndpointWithEndTime:leadingSilence:trailingSilen"
          "ce:stopRecordingMachContinuousTime:skippedSamplesTimeInSec:firstAudioSampleSensorHostTime:]";
    v35 = 2050;
    v36 = a3 / 1000.0;
    v37 = 2050;
    v38 = v18;
    _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Server End Time - %{public}f, Host Recording Time - %{public}f", (uint8_t *)&v33, 0x20u);
  }

}

- (void)_emitEndpointDelayMessage:(double)a3 epdModel:(double)a4 speakingStart:(double)a5 speakingEnd:(double)a6 epdV2:(double)a7
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v13 = objc_alloc_init(MEMORY[0x1E0D99A90]);
  objc_msgSend(v13, "setEndpointDelayInNs:", (unint64_t)a3);
  objc_msgSend(v13, "setEndpointModelDelayInNs:", (unint64_t)a4);
  objc_msgSend(v13, "setSpeakingStartInNs:", (unint64_t)a5);
  objc_msgSend(v13, "setSpeakingEndInNs:", (unint64_t)a6);
  if (a7 != 0.0)
    objc_msgSend(v13, "setEndpointDelayInNsV2:", (unint64_t)a7);
  +[CSEndpointLoggingHelper getMHClientEventByMhUUID:](CSEndpointLoggingHelper, "getMHClientEventByMhUUID:", self->_requestMHUUID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEndpointDelayContext:", v13);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emitMessage:", v14);

  if (a3 >= 3.0e10)
  {
    objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0D19320];
    v20 = CFSTR("EPD");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "submitEndpointerIssueReport:withContext:", v17, v19);

  }
}

- (void)_reportUserSpeakingContext
{
  os_log_t *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSString *curTRPId;
  NSString *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSString *v28;
  void *v29;
  int v30;
  const char *v31;
  __int16 v32;
  NSString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self->_turnIdentifier || self->_requestMHUUID)
  {
    v3 = (os_log_t *)MEMORY[0x1E0D18F40];
    if (self->_userSpeakingStartedHostTime)
    {
      if (self->_curTRPId && self->_isMedocEnabled)
      {
        v4 = objc_alloc_init(MEMORY[0x1E0D99AE0]);
        v5 = objc_alloc_init(MEMORY[0x1E0D99AF0]);
        objc_msgSend(v5, "setExists:", 1);
        objc_msgSend(v4, "setStartedOrChanged:", v5);
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_curTRPId);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v6);
        objc_msgSend(v4, "setTrpId:", v7);

        v8 = objc_alloc_init(MEMORY[0x1E0D99A60]);
        v9 = objc_alloc_init(MEMORY[0x1E0D99A68]);
        v10 = objc_alloc(MEMORY[0x1E0D9A500]);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_requestMHUUID);
        v12 = (void *)objc_msgSend(v10, "initWithNSUUID:", v11);
        objc_msgSend(v9, "setMhId:", v12);

        objc_msgSend(v8, "setEventMetadata:", v9);
        objc_msgSend(v8, "setUserSpeakingContext:", v4);
        objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "emitMessage:timestamp:", v8, self->_userSpeakingStartedHostTime);

      }
      else
      {
        v4 = objc_alloc_init(MEMORY[0x1E0D9A4E0]);
        v5 = objc_alloc_init(MEMORY[0x1E0D9A4F0]);
        objc_msgSend(v5, "setExists:", 1);
        objc_msgSend(v4, "setStartedOrChanged:", v5);
        objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v4, self->_userSpeakingStartedHostTime, self->_turnIdentifier);
      }

      v14 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        curTRPId = self->_curTRPId;
        v30 = 136315394;
        v31 = "-[CSEndpointDelayReporter _reportUserSpeakingContext]";
        v32 = 2112;
        v33 = curTRPId;
        _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s logInstrumentation for speakingStarted, trpId: %@", (uint8_t *)&v30, 0x16u);
      }
    }
    v16 = self->_curTRPId;
    if (self->_userSpeakingEndedHostTime)
    {
      if (v16 && self->_isMedocEnabled)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0D99AE0]);
        v18 = objc_alloc_init(MEMORY[0x1E0D99AE8]);
        objc_msgSend(v18, "setExists:", 1);
        objc_msgSend(v17, "setEnded:", v18);
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_curTRPId);
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v19);
        objc_msgSend(v17, "setTrpId:", v20);

        v21 = objc_alloc_init(MEMORY[0x1E0D99A60]);
        v22 = objc_alloc_init(MEMORY[0x1E0D99A68]);
        v23 = objc_alloc(MEMORY[0x1E0D9A500]);
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_requestMHUUID);
        v25 = (void *)objc_msgSend(v23, "initWithNSUUID:", v24);
        objc_msgSend(v22, "setMhId:", v25);

        objc_msgSend(v21, "setEventMetadata:", v22);
        objc_msgSend(v21, "setUserSpeakingContext:", v17);
        objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "emitMessage:timestamp:", v21, self->_userSpeakingEndedHostTime);

      }
      else
      {
        v17 = objc_alloc_init(MEMORY[0x1E0D9A4E0]);
        v18 = objc_alloc_init(MEMORY[0x1E0D9A4E8]);
        objc_msgSend(v18, "setExists:", 1);
        objc_msgSend(v17, "setEnded:", v18);
        objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v17, self->_userSpeakingEndedHostTime, self->_turnIdentifier);
      }

      v27 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v28 = self->_curTRPId;
        v30 = 136315394;
        v31 = "-[CSEndpointDelayReporter _reportUserSpeakingContext]";
        v32 = 2112;
        v33 = v28;
        _os_log_impl(&dword_1C2614000, v27, OS_LOG_TYPE_DEFAULT, "%s logInstrumentation for speakingEnded, trpId: %@", (uint8_t *)&v30, 0x16u);
      }
    }
    else if (v16 && self->_isMedocEnabled)
    {
      objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "submitSELFIssueReport:", *MEMORY[0x1E0D19350]);

    }
  }
}

- (double)endpointTimeInMs
{
  return self->_endpointTimeInMs;
}

- (void)setEndpointTimeInMs:(double)a3
{
  self->_endpointTimeInMs = a3;
}

- (double)userSpeakingStartedTimeInMs
{
  return self->_userSpeakingStartedTimeInMs;
}

- (void)setUserSpeakingStartedTimeInMs:(double)a3
{
  self->_userSpeakingStartedTimeInMs = a3;
}

- (double)userSpeakingEndedTimeInMs
{
  return self->_userSpeakingEndedTimeInMs;
}

- (void)setUserSpeakingEndedTimeInMs:(double)a3
{
  self->_userSpeakingEndedTimeInMs = a3;
}

- (unint64_t)endpointBufferHostTime
{
  return self->_endpointBufferHostTime;
}

- (void)setEndpointBufferHostTime:(unint64_t)a3
{
  self->_endpointBufferHostTime = a3;
}

- (unint64_t)endpointHostTime
{
  return self->_endpointHostTime;
}

- (void)setEndpointHostTime:(unint64_t)a3
{
  self->_endpointHostTime = a3;
}

- (unint64_t)audioDeliveryHostTimeDelta
{
  return self->_audioDeliveryHostTimeDelta;
}

- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3
{
  self->_audioDeliveryHostTimeDelta = a3;
}

- (unint64_t)userSpeakingStartedHostTime
{
  return self->_userSpeakingStartedHostTime;
}

- (void)setUserSpeakingStartedHostTime:(unint64_t)a3
{
  self->_userSpeakingStartedHostTime = a3;
}

- (unint64_t)userSpeakingEndedHostTime
{
  return self->_userSpeakingEndedHostTime;
}

- (void)setUserSpeakingEndedHostTime:(unint64_t)a3
{
  self->_userSpeakingEndedHostTime = a3;
}

- (unint64_t)stopRecordingHostTime
{
  return self->_stopRecordingHostTime;
}

- (void)setStopRecordingHostTime:(unint64_t)a3
{
  self->_stopRecordingHostTime = a3;
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setRequestMHUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestMHUUID, a3);
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (void)setTurnIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_turnIdentifier, a3);
}

- (BOOL)didReportEndpointDelay
{
  return self->_didReportEndpointDelay;
}

- (void)setDidReportEndpointDelay:(BOOL)a3
{
  self->_didReportEndpointDelay = a3;
}

- (NSString)curTRPId
{
  return self->_curTRPId;
}

- (void)setCurTRPId:(id)a3
{
  objc_storeStrong((id *)&self->_curTRPId, a3);
}

- (BOOL)isMedocEnabled
{
  return self->_isMedocEnabled;
}

- (void)setIsMedocEnabled:(BOOL)a3
{
  self->_isMedocEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curTRPId, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
  objc_storeStrong((id *)&self->_requestMHUUID, 0);
}

@end
