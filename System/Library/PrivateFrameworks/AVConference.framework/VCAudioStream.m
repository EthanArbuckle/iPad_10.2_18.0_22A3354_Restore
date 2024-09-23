@implementation VCAudioStream

- (void)setOverlayToken:(int64_t)a3
{
  tagVCAudioReceiver *audioReceiver;

  if (self->_overlayToken != a3)
  {
    self->_overlayToken = a3;
    if (VCOverlayManager_isOverlayEnabled())
    {
      audioReceiver = self->_sourceContext.audioReceiver;
      if (audioReceiver)
        VCAudioReceiver_SetOverlayToken((uint64_t)audioReceiver, self->_overlayToken);
    }
  }
}

- (unsigned)computePacketTimestampWithInputTimestamp:(unsigned int)a3 numSamples:(int)a4 hostTime:(double)a5
{
  double dAudioHostTime;
  double v9;
  float v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  unsigned int lastInputAudioTimeStamp;
  double v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  double v33;
  __int16 v34;
  int v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (self->super._operatingMode != 6)
  {
    dAudioHostTime = self->dAudioHostTime;
    if (dAudioHostTime == 0.0)
    {
      v14 = 0;
    }
    else
    {
      v9 = a5 - dAudioHostTime;
      v10 = self->_vpioFormat.format.mSampleRate / (double)a4;
      v11 = llround(v9 * v10) * a4;
      if (v11 != a4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            lastInputAudioTimeStamp = self->lastInputAudioTimeStamp;
            v17 = self->dAudioHostTime;
            v18 = 136317954;
            v19 = v12;
            v20 = 2080;
            v21 = "-[VCAudioStream computePacketTimestampWithInputTimestamp:numSamples:hostTime:]";
            v22 = 1024;
            v23 = 250;
            v24 = 2080;
            v25 = "-[VCAudioStream computePacketTimestampWithInputTimestamp:numSamples:hostTime:]";
            v26 = 1024;
            v27 = a3 - lastInputAudioTimeStamp;
            v28 = 1024;
            v29 = lastInputAudioTimeStamp;
            v30 = 1024;
            v31 = a3;
            v32 = 2048;
            v33 = v9;
            v34 = 1024;
            v35 = v11;
            v36 = 2048;
            v37 = v17;
            v38 = 2048;
            v39 = a5;
            v40 = 1024;
            v41 = v11;
            _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %s Timestamp jumped: %u (%u to %u), host time: %f (%d samples) (%f to %f). Adjustment: %d", (uint8_t *)&v18, 0x62u);
          }
        }
        a4 = v11;
      }
      v14 = (int)((double)(-[VCAudioPayloadConfig codecSampleRate](-[VCAudioTransmitter currentAudioPayloadConfig](-[VCAudioStream audioTransmitter](self, "audioTransmitter"), "currentAudioPayloadConfig"), "codecSampleRate")* (uint64_t)a4)/ self->_vpioFormat.format.mSampleRate);
    }
    return self->lastSentAudioSampleTime + v14;
  }
  return a3;
}

- (unsigned)internalSampleRateForCodecType:(int64_t)a3
{
  int operatingMode;
  unsigned int result;

  operatingMode = self->super._operatingMode;
  if (operatingMode == 6 || self->_isVoiceProcessingAt24KSupported)
    return 24000;
  result = 8000;
  switch(a3)
  {
    case 1:
    case 5:
    case 6:
    case 13:
    case 14:
    case 17:
      return result;
    case 2:
    case 3:
    case 7:
    case 12:
    case 15:
      result = 16000;
      break;
    case 4:
      if (operatingMode == 3)
        result = 32000;
      else
        result = 24000;
      break;
    case 8:
    case 11:
    case 18:
    case 20:
      return 24000;
    case 16:
    case 19:
      result = 48000;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)_computeInternalFormatForStreamConfigurations:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  unsigned int v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  BOOL v20;
  int v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = +[VCAudioStream audioChannelCountForMode:](VCAudioStream, "audioChannelCountForMode:", objc_msgSend(a3, "firstObject"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(v10, "useExternalIO") & 1) != 0)
        {
          v17 = (_OWORD *)objc_msgSend(v10, "externalIOFormat");
          v19 = v17[1];
          v18 = v17[2];
          *(_OWORD *)&self->_vpioFormat.format.mSampleRate = *v17;
          *(_OWORD *)&self->_vpioFormat.format.mBytesPerPacket = v19;
          *(_OWORD *)&self->_vpioFormat.format.mBitsPerChannel = v18;
          v20 = 1;
          goto LABEL_24;
        }
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "allCodecConfigurations"), "allValues");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v24 != v14)
                objc_enumerationMutation(v11);
              v16 = -[VCAudioStream internalSampleRateForCodecType:](self, "internalSampleRateForCodecType:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "codecType"));
              if (v7 <= v16)
                v7 = v16;
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
          }
          while (v13);
        }
        if (self->super._operatingMode == 11)
          v21 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "channelCount");
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
  Format_Float((uint64_t)&self->_vpioFormat, v21, v7);
  v20 = 0;
LABEL_24:
  self->_useExternalIO = v20;
}

- (BOOL)generateRTCPXRSummaryReports:(tagVCRTCPXRSummaryReport *)a3 reportCount:(char *)a4
{
  char v6;
  NSMutableArray *transportArray;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unsigned __int8 v15;
  NSObject *v16;
  __int128 v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = *a4;
  *a4 = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  transportArray = self->super._transportArray;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  if (!v8)
    return 0;
  v10 = v8;
  v11 = 0;
  v12 = *(_QWORD *)v29;
  *(_QWORD *)&v9 = 136315650;
  v18 = v9;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v29 != v12)
        objc_enumerationMutation(transportArray);
      v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      if (objc_msgSend(v14, "isRTCPXREnabled", v18))
      {
        v20 = v6;
        if ((objc_msgSend(v14, "generateRTCPXRSummaryReport:reportCount:", a3, &v20) & 1) != 0)
        {
          v15 = v20;
          a3 += v20;
          *a4 += v20;
          v6 -= v15;
          v11 = 1;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v19 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v22 = v19;
            v23 = 2080;
            v24 = "-[VCAudioStream generateRTCPXRSummaryReports:reportCount:]";
            v25 = 1024;
            v26 = 550;
            _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d Failed to generate the RTCP XR statistics summary report.", buf, 0x1Cu);
          }
        }
      }
    }
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  }
  while (v10);
  return v11;
}

- (BOOL)generateRTCPXRVoIPMetricsReports:(tagVCRTCPXRVoIPMetricsReport *)a3 reportCount:(char *)a4
{
  tagVCAudioReceiver *audioReceiver;
  char v7;
  NSMutableArray *transportArray;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  float DiscardRate;
  int TargetTime;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned __int8 v21;
  unsigned __int16 v22;
  uint64_t v23;
  NSObject *v24;
  unint64_t v25;
  unint64_t v26;
  int var20;
  int var21;
  int var0;
  int var1;
  int var4;
  int var5;
  int var6;
  int var7;
  int var11;
  int var16;
  int var17;
  int var18;
  int var19;
  unsigned __int8 v40;
  NSObject *v41;
  __int128 v43;
  uint64_t v44;
  char *v45;
  unsigned __int8 v46;
  _BYTE v47[128];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE buf[12];
  _BYTE v53[10];
  __int16 v54;
  int v55;
  __int16 v56;
  tagVCAudioReceiver *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  int v71;
  __int16 v72;
  int v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  __int16 v80;
  int v81;
  __int16 v82;
  int v83;
  __int16 v84;
  int v85;
  __int16 v86;
  int v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  audioReceiver = self->_sourceContext.audioReceiver;
  if (!audioReceiver)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStream generateRTCPXRVoIPMetricsReports:reportCount:].cold.1();
    }
    return 0;
  }
  v7 = *a4;
  *a4 = 0;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  transportArray = self->super._transportArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v48, v47, 16);
  if (!v9)
    return 0;
  v11 = v9;
  v45 = a4;
  v12 = 0;
  v13 = *(_QWORD *)v49;
  *(_QWORD *)&v10 = 136315650;
  v43 = v10;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v49 != v13)
        objc_enumerationMutation(transportArray);
      v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
      if (objc_msgSend(v15, "isRTCPXREnabled", v43))
      {
        v46 = v7;
        if ((objc_msgSend(v15, "generateRTCPXRVoIPMetricsReport:reportCount:", a3, &v46) & 1) != 0)
        {
          DiscardRate = VCJitterBuffer_GetDiscardRate((uint64_t)audioReceiver->var2);
          TargetTime = VCJitterBuffer_GetTargetTime(audioReceiver->var2);
          a3->var1 = (int)(float)(DiscardRate * 255.0);
          *(_QWORD *)buf = -1;
          v18 = *(_DWORD *)&a3->var20;
          *(_DWORD *)&buf[8] = -1431655766;
          *(_DWORD *)v53 = v18;
          VCJitterBuffer_GetBurstMetrics((uint64_t)audioReceiver->var2, (uint64_t)buf);
          v19 = vcvtd_n_s64_f64(*(float *)buf, 8uLL);
          v20 = vcvtd_n_s64_f64(*(float *)&buf[4], 8uLL);
          if (v19 >= 0xFF)
            LOBYTE(v19) = -1;
          a3->var2 = v19;
          if (v20 >= 0xFF)
            v21 = -1;
          else
            v21 = v20;
          a3->var3 = v21;
          *(_DWORD *)&a3->var4 = *(_DWORD *)&buf[8];
          v22 = TargetTime + 3;
          if ((TargetTime + 3) >= 0xFFFF)
            v22 = -1;
          a3->var7 = v22;
          *(_DWORD *)&a3->var12 = 2139062143;
          *(_DWORD *)&a3->var8 = 276791167;
          a3->var16 = -16;
          VCJitterBuffer_GetRTCPXRJitterBufferParameters((uint64_t)audioReceiver->var2, &a3->var17, &a3->var18, &a3->var19);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v23 = VRTraceErrorLogLevelToCSTR();
            v24 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              var20 = a3->var20;
              var21 = a3->var21;
              var0 = a3->var0;
              var1 = a3->var1;
              LOBYTE(v25) = a3->var2;
              LOBYTE(v26) = a3->var3;
              var4 = a3->var4;
              var5 = a3->var5;
              var6 = a3->var6;
              var7 = a3->var7;
              var11 = a3->var11;
              var16 = a3->var16;
              var17 = a3->var17;
              var18 = a3->var18;
              var19 = a3->var19;
              *(_DWORD *)buf = 136319746;
              *(_QWORD *)&buf[4] = v23;
              *(_WORD *)v53 = 2080;
              *(_QWORD *)&v53[2] = "_VCAudioStream_FillRTCPXRVoIPMetricsReport";
              v54 = 1024;
              v55 = 619;
              v56 = 2048;
              v57 = audioReceiver;
              v58 = 1024;
              v59 = var20;
              v60 = 1024;
              v61 = var21;
              v62 = 1024;
              v63 = var0;
              v64 = 1024;
              v65 = var1;
              v66 = 2048;
              v67 = (double)v25 * 0.00390625 * 100.0;
              v68 = 2048;
              v69 = (double)v26 * 0.00390625 * 100.0;
              v70 = 1024;
              v71 = var4;
              v72 = 1024;
              v73 = var5;
              v74 = 1024;
              v75 = var6;
              v76 = 1024;
              v77 = var7;
              v78 = 1024;
              v79 = var11;
              v80 = 1024;
              v81 = var16;
              v82 = 1024;
              v83 = var17;
              v84 = 1024;
              v85 = var18;
              v86 = 1024;
              v87 = var19;
              _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d RTCP XR VOIP Metrics report audioReceiver=%p startSeq=%d endSeq=%d lossRate=%d discardRate=%d burstDensity=%f gapDensity=%f burstDuration=%d gapDuration=%d roundTripDelay=%d endSystemDelay=%d gmin=%d rxConfig=%d jbNominal=%d jbMax=%d jbAbsMax=%d", buf, 0x88u);
            }
          }
          v40 = v46;
          a3 += v46;
          *v45 += v46;
          v7 -= v40;
          v12 = 1;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v44 = VRTraceErrorLogLevelToCSTR();
          v41 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v43;
            *(_QWORD *)&buf[4] = v44;
            *(_WORD *)v53 = 2080;
            *(_QWORD *)&v53[2] = "-[VCAudioStream generateRTCPXRVoIPMetricsReports:reportCount:]";
            v54 = 1024;
            v55 = 638;
            _os_log_error_impl(&dword_1D8A54000, v41, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d Failed to generate the RTCP XR VoIP metrics report.", buf, 0x1Cu);
          }
        }
      }
    }
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v48, v47, 16);
  }
  while (v11);
  return v12;
}

- (void)startAudioWithCompletionHandler:(id)a3
{
  VCAudioPayload *currentAudioPayload;
  int ErrorLogLevelForModule;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  VCAudioIO *audioIO;
  uint64_t v12;
  uint8_t v13[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  VCAudioStream *v20;
  __int16 v21;
  VCAudioIO *v22;
  uint8_t buf[48];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  UInt32 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  VCMediaStream_Lock((uint64_t)self);
  v12 = 0;
  currentAudioPayload = self->currentAudioPayload;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (currentAudioPayload)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAudioStream startAudioWithCompletionHandler:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 668;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = -[VCMediaStream state](self, "state") == 2;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d alreadyStarted = %d", buf, 0x22u);
      }
    }
    if (-[VCAudioStream audioTransmitter](self, "audioTransmitter")
      && !-[VCAudioTransmitter setupAudio:](-[VCAudioStream audioTransmitter](self, "audioTransmitter"), "setupAudio:", &v12))
    {
      VCMediaStream_Unlock((uint64_t)self);
      if (a3)
        (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v12);
    }
    else
    {

      self->_allowedAudioPayloads = (NSMutableArray *)-[NSArray mutableCopy](-[VCAudioTransmitter audioPayloads](-[VCAudioStream audioTransmitter](self, "audioTransmitter"), "audioPayloads"), "mutableCopy");
      if (self->super._operatingMode == 6)
      {
        if (a3)
          (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
      }
      else
      {
        v29 = 0;
        v27 = 0u;
        v28 = 0u;
        v26 = 0u;
        v24 = 0u;
        v25 = 0u;
        memset(buf, 0, sizeof(buf));
        AUIOGetAUNumber(&v29);
        -[VCAudioIO setFarEndVersionInfo:](self->_audioIO, "setFarEndVersionInfo:", buf);
        -[VCAudioIO setRemoteCodecType:sampleRate:](self->_audioIO, "setRemoteCodecType:sampleRate:", +[VCPayloadUtils audioCodecTypeForPayload:](VCPayloadUtils, "audioCodecTypeForPayload:", -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload")), (double)-[VCAudioPayloadConfig codecSampleRate](-[VCAudioPayload config](self->currentAudioPayload, "config"), "codecSampleRate"));
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            audioIO = self->_audioIO;
            *(_DWORD *)v13 = 136316162;
            v14 = v9;
            v15 = 2080;
            v16 = "-[VCAudioStream startAudioWithCompletionHandler:]";
            v17 = 1024;
            v18 = 687;
            v19 = 2048;
            v20 = self;
            v21 = 2048;
            v22 = audioIO;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d (%p) starting audioIO=%p", v13, 0x30u);
          }
        }
        -[VCAudioIO startWithCompletionHandler:](self->_audioIO, "startWithCompletionHandler:", a3);
      }
      -[VCAudioStream reportingAlgosAudioStreamEvent:](self, "reportingAlgosAudioStreamEvent:", 0);
      -[VCAudioTransmitter start](-[VCAudioStream audioTransmitter](self, "audioTransmitter"), "start");
      VCMediaStream_Unlock((uint64_t)self);
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStream startAudioWithCompletionHandler:].cold.1();
    }
    VCMediaStream_Unlock((uint64_t)self);
    if (a3)
      (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
  }
}

- (void)stopAudioWithCompletionHandler:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  VCAudioIO *audioIO;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  VCAudioStream *v15;
  __int16 v16;
  VCAudioIO *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  VCMediaStream_Lock((uint64_t)self);
  if (self->super._operatingMode == 6)
  {
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
  }
  else
  {
    if (-[VCAudioIO state](self->_audioIO, "state"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          audioIO = self->_audioIO;
          v8 = 136316162;
          v9 = v5;
          v10 = 2080;
          v11 = "-[VCAudioStream stopAudioWithCompletionHandler:]";
          v12 = 1024;
          v13 = 705;
          v14 = 2048;
          v15 = self;
          v16 = 2048;
          v17 = audioIO;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d [%p] stopping audioIO=%p", (uint8_t *)&v8, 0x30u);
        }
      }
      -[VCAudioIO stopWithCompletionHandler:](self->_audioIO, "stopWithCompletionHandler:", a3);
    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
    }
    if ((self->super._operatingMode - 1) >= 2)
      -[VCMediaStream deregisterAggregationHandlers](self, "deregisterAggregationHandlers");
  }
  -[VCAudioTransmitter stop](-[VCAudioStream audioTransmitter](self, "audioTransmitter"), "stop");
  VCMediaStream_Unlock((uint64_t)self);
}

- (id)getSupportedPayloads
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSMutableArray *obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = self->super._transportArray;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v32;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(obj);
        v18 = v4;
        v5 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v4), "streamConfig");
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "allCodecConfigurations"), "allValues");
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v27 != v9)
                objc_enumerationMutation(v6);
              v11 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "codecType"));
              if ((_DWORD)v11 == 117)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v12 = VRTraceErrorLogLevelToCSTR();
                  v13 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v20 = v12;
                    v21 = 2080;
                    v22 = "-[VCAudioStream getSupportedPayloads]";
                    v23 = 1024;
                    v24 = 729;
                    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d Skip DTMF from supported payloads for AudioStream", buf, 0x1Cu);
                  }
                }
              }
              else
              {
                objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11));
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
          }
          while (v8);
        }
        v4 = v18 + 1;
      }
      while (v18 + 1 != v17);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    }
    while (v17);
  }
  return v3;
}

- (BOOL)setupPayloads
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  VCAudioPayload *v9;
  VCAudioPayload *currentAudioPayload;
  double v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  _BOOL4 v15;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[VCAudioStream getSupportedPayloads](self, "getSupportedPayloads");
  -[NSMutableArray removeAllObjects](self->audioPayloads, "removeAllObjects");
  self->currentAudioPayload = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "unsignedIntValue");
        v9 = -[VCAudioStream addAudioPayload:](self, "addAudioPayload:", v8);
        if ((_DWORD)v8 == self->preferredAudioCodec)
          self->currentAudioPayload = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v5);
  }
  currentAudioPayload = self->currentAudioPayload;
  if (currentAudioPayload)
    goto LABEL_13;
  if (-[NSMutableArray count](self->audioPayloads, "count"))
  {
    currentAudioPayload = (VCAudioPayload *)-[NSMutableArray objectAtIndexedSubscript:](self->audioPayloads, "objectAtIndexedSubscript:", 0);
    self->currentAudioPayload = currentAudioPayload;
LABEL_13:
    if (!self->_useExternalIO)
    {
      v11 = (double)-[VCAudioPayloadConfig samplesPerFrame](-[VCAudioPayload config](currentAudioPayload, "config"), "samplesPerFrame");
      if (v11
         / (double)-[VCAudioPayloadConfig inputSampleRate](-[VCAudioPayload config](self->currentAudioPayload, "config"), "inputSampleRate") >= 0.02)
      {
        v13 = -[VCAudioPayloadConfig samplesPerFrame](-[VCAudioPayload config](self->currentAudioPayload, "config"), "samplesPerFrame");
      }
      else
      {
        v12 = -[VCAudioStream getPacketsPerBundleForStreamConfig:](self, "getPacketsPerBundleForStreamConfig:", -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"));
        v13 = -[VCAudioPayloadConfig samplesPerFrame](-[VCAudioPayload config](self->currentAudioPayload, "config"), "samplesPerFrame")* v12;
      }
      self->_vpioFormat.samplesPerFrame = v13;
    }
    v14 = -[VCAudioStream preferredAudioBitrateForPayload:](self, "preferredAudioBitrateForPayload:", -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload"));
    if ((_DWORD)v14)
      -[VCAudioPayload setBitrate:](self->currentAudioPayload, "setBitrate:", v14);
    LOBYTE(v15) = self->currentAudioPayload != 0;
    return v15;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v15)
      return v15;
    -[VCAudioStream setupPayloads].cold.1();
  }
  LOBYTE(v15) = 0;
  return v15;
}

- (id)codecConfigForOpusWithStreamConfig:(id)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(a3, "codecConfigurations"), "objectForKeyedSubscript:", &unk_1E9EF3FC8);
  if (!result)
    return (id)objc_msgSend((id)objc_msgSend(a3, "codecConfigurations"), "objectForKeyedSubscript:", &unk_1E9EF3FE0);
  return result;
}

- (void)getCodecConfigForPayload:(int)a3 block:(id)a4
{
  int64_t v6;
  NSMutableArray *transportArray;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  VCAudioStream *v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  transportArray = self->super._transportArray;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(transportArray);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "streamConfig");
        v13 = (void *)objc_msgSend(v12, "allCodecConfigurations");
        v14 = objc_msgSend(v13, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6));
        v15 = (id)v14;
        if (a3 == 119 && !v14)
          v15 = -[VCAudioStream codecConfigForOpusWithStreamConfig:](self, "codecConfigForOpusWithStreamConfig:", v12);
        if (v15)
        {
          (*((void (**)(id, void *))a4 + 2))(a4, v12);
          return;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
      if (v9)
        continue;
      break;
    }
  }
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStream getCodecConfigForPayload:block:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = v17;
        v22 = 2080;
        v23 = "-[VCAudioStream getCodecConfigForPayload:block:]";
        v24 = 1024;
        v25 = 809;
        v26 = 2112;
        v27 = v16;
        v28 = 2048;
        v29 = self;
        _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to retrieve codec config.", buf, 0x30u);
      }
    }
  }
}

- (unsigned)preferredAudioBitrateForPayload:(int)a3
{
  unsigned int preferredMediaBitrate;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  preferredMediaBitrate = self->_preferredMediaBitrate;
  if (!preferredMediaBitrate)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__VCAudioStream_preferredAudioBitrateForPayload___block_invoke;
    v5[3] = &unk_1E9E53BF8;
    v5[4] = &v6;
    -[VCAudioStream getCodecConfigForPayload:block:](self, "getCodecConfigForPayload:block:", *(_QWORD *)&a3, v5);
    preferredMediaBitrate = *((_DWORD *)v7 + 6);
    _Block_object_dispose(&v6, 8);
  }
  return preferredMediaBitrate;
}

uint64_t __49__VCAudioStream_preferredAudioBitrateForPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = +[VCPayloadUtils bitrateForCodecType:mode:](VCPayloadUtils, "bitrateForCodecType:mode:", objc_msgSend(a3, "codecType"), objc_msgSend(a3, "preferredMode"));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (BOOL)shouldUseAACELDSBRForMode:(int64_t)a3
{
  return a3 != 11 && (a3 & 0xFFFFFFFFFFFFFFFELL) != 8;
}

+ (unsigned)audioChannelCountForMode:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "audioStreamMode");
  if (v4 == 8)
  {
    if (objc_msgSend(a3, "channelCount"))
      return objc_msgSend(a3, "channelCount");
  }
  else if (v4 == 11 || v4 == 9)
  {
    return 2;
  }
  return 1;
}

+ (unsigned)audioIOTypeForMode:(int64_t)a3
{
  unsigned int result;

  if ((unint64_t)(a3 - 1) < 0xB)
    return dword_1D910B100[a3 - 1];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    +[VCAudioStream audioIOTypeForMode:].cold.1();
  }
  return 0;
}

+ (id)newPayloadConfigForCodecConfig:(id)a3 streamConfig:(id)a4 inputSampleRate:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __CFString **v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t IntValueForKey;
  _BOOL8 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  VCAudioPayloadConfig *v31;
  int v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v5 = *(_QWORD *)&a5;
  v44 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(a3, "codecType"));
  v10 = v9;
  if ((_DWORD)v9 == 108)
  {
    v11 = objc_msgSend(a4, "forceEVSWideBand");
    v12 = kVCAudioPayloadConfigKeyPayloadType;
    v13 = v10;
    if (v11)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E9EF3FF8, CFSTR("vcAudioPayloadConfigKeyPayloadType"));
      v12 = kVCAudioPayloadConfigKeyPayloadTypeOverride;
      v13 = 108;
    }
  }
  else
  {
    v12 = kVCAudioPayloadConfigKeyPayloadType;
    v13 = v9;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13), *v12);
  if (objc_msgSend(a3, "codecType") == 12)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 320), CFSTR("vcAudioPayloadConfigKeyBlockSize"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 16000), CFSTR("vcPayloadConfigKeySampleRate"));
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5), CFSTR("vcAudioPayloadConfigKeyInputSampleRate"));
  if ((v10 - 97) <= 0x16 && ((1 << (v10 - 97)) & 0x404C03) != 0)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pTime") / 0x14uLL), CFSTR("vcPayloadConfigKeyInternalBundleFactor"));
  if (objc_msgSend(a3, "codecType") == 19)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 480), CFSTR("vcAudioPayloadConfigKeyBlockSize"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E9EF4010, CFSTR("vcPayloadConfigKeySampleRate"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E9EF4028, CFSTR("vcPayloadConfigKeyInternalBundleFactor"));
  }
  if ((v10 - 107) <= 4 && ((1 << (v10 - 107)) & 0x13) != 0)
  {
    if (+[VCAudioStream isTelephony:](VCAudioStream, "isTelephony:", objc_msgSend(a4, "audioStreamMode")))
      v15 = 0;
    else
      v15 = 8;
    IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("EVSSIDDuration"), v15);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(a3, "evsChannelAwareOffset")), CFSTR("vcPayloadConfigKeyEVSChannelAwareOffset"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "evsHeaderFullOnly")), CFSTR("vcPayloadConfigKeyEVSHeaderFullOnly"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", IntValueForKey), CFSTR("vcPayloadConfigKeyEVSSIDPeriod"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "evsCMRMode")), CFSTR("vcPayloadConfigKeyEVSCMRMode"));
  }
  if (VCPayloadUtils_supportsInternalDTXForPayload(v10))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isDTXEnabled")), CFSTR("vcPayloadConfigKeyDTXEnabled"));
  if ((v10 - 97) <= 1)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isOctetAligned")), CFSTR("vcPayloadConfigKeyOctetAligned"));
  if ((v10 - 101) <= 5 && ((1 << (v10 - 101)) & 0x39) != 0)
  {
    v17 = +[VCAudioStream shouldUseAACELDSBRForMode:](VCAudioStream, "shouldUseAACELDSBRForMode:", objc_msgSend(a4, "audioStreamMode"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17), CFSTR("vcPayloadConfigKeyUseSBR"));
  }
  if (objc_msgSend(a3, "supportedModes")
    && +[VCPayloadUtils supportsCodecRateModesForCodecType:](VCPayloadUtils, "supportsCodecRateModesForCodecType:", objc_msgSend(a3, "codecType")))
  {
    v33 = v10;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "supportedModes"), "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v19 = (void *)objc_msgSend(a3, "supportedModes");
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v41 != v22)
            objc_enumerationMutation(v19);
          v24 = +[VCPayloadUtils bitrateForCodecType:mode:](VCPayloadUtils, "bitrateForCodecType:mode:", objc_msgSend(a3, "codecType"), objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "unsignedIntValue"));
          objc_msgSend(v18, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24), objc_msgSend(v18, "count"));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
      }
      while (v21);
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("vcPayloadConfigKeyCodecBitrates"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", +[VCPayloadUtils bitrateForCodecType:mode:](VCPayloadUtils, "bitrateForCodecType:mode:", objc_msgSend(a3, "codecType"), objc_msgSend(a3, "preferredMode"))), CFSTR("vcPayloadConfigKeyPreferredBitrate"));

    LODWORD(v10) = v33;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "supportedBandwidths"), "count")
    && +[VCPayloadUtils supportsCodecBandwidthUpdateForCodecType:](VCPayloadUtils, "supportsCodecBandwidthUpdateForCodecType:", objc_msgSend(a3, "codecType")))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "supportedBandwidths"), "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = (void *)objc_msgSend(a3, "supportedBandwidths");
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(v25, "setObject:atIndexedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), objc_msgSend(v25, "count"));
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
      }
      while (v28);
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("vcAudioPayloadConfigKeySupportedBandwidths"));

  }
  if ((_DWORD)v10 == 119)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isOpusInBandFecEnabled")), CFSTR("vcAudioPayloadConfigKeyOPUSInBandFecEnabled"));
  v31 = -[VCAudioPayloadConfig initWithConfigDict:]([VCAudioPayloadConfig alloc], "initWithConfigDict:", v8);

  return v31;
}

- (id)configForPayloadType:(int)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__VCAudioStream_configForPayloadType___block_invoke;
  v5[3] = &unk_1E9E53C20;
  v5[4] = self;
  v5[5] = &v6;
  -[VCAudioStream getCodecConfigForPayload:block:](self, "getCodecConfigForPayload:block:", *(_QWORD *)&a3, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __38__VCAudioStream_configForPayloadType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result;

  result = +[VCAudioStream newPayloadConfigForCodecConfig:streamConfig:inputSampleRate:](VCAudioStream, "newPayloadConfigForCodecConfig:streamConfig:inputSampleRate:", a3, a2, *(double *)(*(_QWORD *)(a1 + 32) + 1072));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)addAudioPayload:(int)a3
{
  VCAudioPayload *v4;

  v4 = -[VCAudioPayload initWithConfig:]([VCAudioPayload alloc], "initWithConfig:", -[VCAudioStream configForPayloadType:](self, "configForPayloadType:", *(_QWORD *)&a3));
  if (v4)
    -[NSMutableArray addObject:](self->audioPayloads, "addObject:", v4);

  return v4;
}

- (void)setDTXPayload:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  NSMutableArray *audioPayloads;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  VCAudioPayload *v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = (void *)objc_msgSend((id)objc_msgSend(a3, "codecConfigurations"), "allValues");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v9, "isComfortNoise"))
        {
          v10 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(v9, "codecType"));
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          audioPayloads = self->audioPayloads;
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v19;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v19 != v14)
                  objc_enumerationMutation(audioPayloads);
                v16 = *(VCAudioPayload **)(*((_QWORD *)&v18 + 1) + 8 * j);
                if (-[VCAudioPayloadConfig payload](-[VCAudioPayload config](v16, "config"), "payload") == v10)
                {
                  self->currentDTXPayload = v16;
                  goto LABEL_20;
                }
              }
              v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
              if (v13)
                continue;
              break;
            }
          }
LABEL_20:
          if (!self->currentDTXPayload)
            self->currentDTXPayload = (VCAudioPayload *)-[VCAudioStream addAudioPayload:](self, "addAudioPayload:", +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(v9, "codecType")));
          return;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
}

- (BOOL)setReceiverPayloads
{
  NSMutableArray *transportArray;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  int *v9;
  int *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 BoolValueForKey;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  int v21;
  id v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  BOOL v28;
  const __CFString *v29;
  uint64_t v30;
  NSObject *v31;
  int *v33;
  NSMutableArray *obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  VCAudioStream *v38;
  int *v39;
  uint64_t v40;
  _BOOL4 v41;
  _BOOL4 v42;
  uint64_t v43;
  id v44;
  void *v45;
  int v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  _BYTE v54[10];
  VCAudioStream *v55;
  _BYTE v56[128];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  transportArray = self->super._transportArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v38 = self;
  v6 = 0;
  v7 = *(_QWORD *)v68;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v68 != v7)
        objc_enumerationMutation(transportArray);
      v6 += objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "streamConfig"), "codecConfigurations"), "count");
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
  }
  while (v5);
  if (!v6)
    return 0;
  v9 = (int *)malloc_type_calloc(v6, 0x24uLL, 0x1000040A310BA97uLL);
  if (!v9)
    return 0;
  v10 = v9;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v38->super._transportArray;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v61, 16);
  v33 = v10;
  if (v36)
  {
    v46 = 0;
    v39 = v10 + 1;
    v35 = *(_QWORD *)v63;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v63 != v35)
          objc_enumerationMutation(obj);
        v37 = v11;
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * v11), "streamConfig");
        BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("dtmfTonePlaybackEnabled"), objc_msgSend(v12, "dtmfTonePlaybackEnabled"));
        v14 = VCDefaults_GetBoolValueForKey(CFSTR("dtmfEventCallbacksEnabled"), objc_msgSend(v12, "dtmfEventCallbacksEnabled"));
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v45 = v12;
        v44 = (id)objc_msgSend((id)objc_msgSend(v12, "codecConfigurations"), "allValues");
        v15 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v58;
          v41 = v14;
          v42 = BoolValueForKey;
          v40 = *(_QWORD *)v58;
          do
          {
            v18 = 0;
            v43 = v16;
            do
            {
              if (*(_QWORD *)v58 != v17)
                objc_enumerationMutation(v44);
              v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v18);
              if ((objc_msgSend(v19, "isDTMF") ^ 1 | (BoolValueForKey || v14)) == 1)
              {
                v20 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(v19, "codecType"));
                v21 = v20;
                if (objc_msgSend(v19, "networkPayload") != 0xFFFF)
                  v21 = objc_msgSend(v19, "networkPayload");
                if (v20 == 117)
                  v22 = 0;
                else
                  v22 = +[VCAudioStream newPayloadConfigForCodecConfig:streamConfig:inputSampleRate:](VCAudioStream, "newPayloadConfigForCodecConfig:streamConfig:inputSampleRate:", v19, v45, v38->_vpioFormat.format.mSampleRate);
                if (v46 >= 1)
                {
                  v23 = v46;
                  v24 = v39;
                  do
                  {
                    if (*(v24 - 1) == v20)
                    {
                      if (*v24 == v21)
                        goto LABEL_38;
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                      {
                        v25 = VRTraceErrorLogLevelToCSTR();
                        v26 = *MEMORY[0x1E0CF2758];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                        {
                          v27 = *v24;
                          *(_DWORD *)buf = 136316418;
                          v48 = v25;
                          v49 = 2080;
                          v50 = "-[VCAudioStream setReceiverPayloads]";
                          v51 = 1024;
                          v52 = 1054;
                          v53 = 1024;
                          *(_DWORD *)v54 = v27;
                          *(_WORD *)&v54[4] = 1024;
                          *(_DWORD *)&v54[6] = v21;
                          LOWORD(v55) = 1024;
                          *(_DWORD *)((char *)&v55 + 2) = v20;
                          _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d Multiple network payloads=%d, %d for internal payload=%d. Creating decoders for both", buf, 0x2Eu);
                        }
                      }
                    }
                    v24 += 9;
                    --v23;
                  }
                  while (v23);
                }
                *v10 = v20;
                v10[1] = v21;
                *((_BYTE *)v10 + 16) = objc_msgSend(v19, "isOctetAligned");
                *((_BYTE *)v10 + 32) = objc_msgSend(v19, "evsHeaderFullOnly");
                *((_BYTE *)v10 + 25) = objc_msgSend(v19, "isOpusInBandFecEnabled");
                v10[7] = 0;
                if (v20 == 119 && objc_msgSend(v22, "codecSampleRate") == 48000)
                  v10[7] = objc_msgSend(v22, "codecSampleRate");
                v10[5] = objc_msgSend(v45, "bundlingScheme");
                v10[3] = objc_msgSend(v22, "flags");
                v10[2] = objc_msgSend(v22, "samplesPerFrame");
                *((_BYTE *)v10 + 24) = objc_msgSend(v45, "forceEVSWideBand");
                *((_BYTE *)v10 + 17) = v38->_sourceContext.audioReceiver->var0.var21;
                ++v46;
                v10 += 9;
LABEL_38:
                v14 = v41;
                BoolValueForKey = v42;
                v17 = v40;
                v16 = v43;
              }
              ++v18;
            }
            while (v18 != v16);
            v16 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
          }
          while (v16);
        }
        v11 = v37 + 1;
      }
      while (v37 + 1 != v36);
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v61, 16);
    }
    while (v36);
  }
  else
  {
    v46 = 0;
  }
  v28 = VCAudioReceiver_SetupDecoders((uint64_t)v38->_sourceContext.audioReceiver, (uint64_t)v33, v46, (__int128 *)&v38->_vpioFormat, 0);
  if (!v28)
  {
    if ((VCAudioStream *)objc_opt_class() == v38)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStream setReceiverPayloads].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v29 = (const __CFString *)-[VCAudioStream performSelector:](v38, "performSelector:", sel_logPrefix);
      else
        v29 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v48 = v30;
          v49 = 2080;
          v50 = "-[VCAudioStream setReceiverPayloads]";
          v51 = 1024;
          v52 = 1082;
          v53 = 2112;
          *(_QWORD *)v54 = v29;
          *(_WORD *)&v54[8] = 2048;
          v55 = v38;
          _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to setup receiver decoders.", buf, 0x30u);
        }
      }
    }
  }
  free(v33);
  return v28;
}

- (double)lastReceivedRTPPacketTime
{
  return VCAudioReceiver_GetLatestAudioTimestamp((uint64_t)self->_sourceContext.audioReceiver);
}

- (double)lastReceivedRTCPPacketTime
{
  NSMutableArray *transportArray;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  transportArray = self->super._transportArray;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (!v3)
    return NAN;
  v4 = v3;
  v5 = *(_QWORD *)v14;
  v6 = NAN;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v14 != v5)
        objc_enumerationMutation(transportArray);
      v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      objc_msgSend(v8, "lastReceivedRTCPPacketTime");
      objc_msgSend(v8, "lastReceivedRTCPPacketTime");
      if (v9 > v6)
      {
        objc_msgSend(v8, "lastReceivedRTCPPacketTime");
        v6 = v10;
      }
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  }
  while (v4);
  return v6;
}

- (void)updateSyncSourceState:(int)a3
{
  os_unfair_lock_s *p_delegateLock;
  __CFArray *syncSourceDelegates;
  int Count;
  CFIndex v8;
  const void *ValueAtIndex;

  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  syncSourceDelegates = self->_syncSourceDelegates;
  if (syncSourceDelegates)
  {
    Count = CFArrayGetCount(syncSourceDelegates);
    v8 = (Count - 1);
    if (Count - 1 >= 0)
    {
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->_syncSourceDelegates, v8);
        VCMediaStreamSyncSourceDelegate_updateSourceState((uint64_t)ValueAtIndex, a3);
        --v8;
        --Count;
      }
      while (Count);
    }
  }
  os_unfair_lock_unlock(p_delegateLock);
}

- (void)willExitState:(int)a3 newState:(int)a4
{
  if (a3 == 2)
    -[VCAudioStream updateSyncSourceState:](self, "updateSyncSourceState:", 1, *(_QWORD *)&a4);
}

- (void)didEnterState:(int)a3 oldState:(int)a4
{
  if (a3 == 2 && self->super._operatingMode != 5)
    -[VCAudioStream updateSyncSourceState:](self, "updateSyncSourceState:", 0, *(_QWORD *)&a4);
}

+ (int)operatingModeForAudioStreamMode:(int64_t)a3
{
  int result;

  if ((unint64_t)a3 < 0xC)
    return dword_1D910B12C[a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    +[VCAudioStream operatingModeForAudioStreamMode:].cold.1();
  }
  return 0;
}

+ (unsigned)audioIODirectionWithMediaStreamDirection:(int64_t)a3
{
  unsigned int v3;

  v3 = 0x3010200u >> (8 * a3);
  if ((unint64_t)a3 >= 4)
    LOBYTE(v3) = 0;
  return v3 & 3;
}

- (void)setDeviceRoleForAudioStreamMode:(int64_t)a3 direction:(int64_t)a4
{
  uint64_t v4;

  if ((unint64_t)a3 > 0xB)
    goto LABEL_12;
  if (((1 << a3) & 0xAB2) != 0)
  {
LABEL_3:
    v4 = 0;
LABEL_6:
    -[VCAudioStream setDeviceRole:](self, "setDeviceRole:", v4);
    return;
  }
  if (((1 << a3) & 0x44C) != 0)
  {
    v4 = 3;
    goto LABEL_6;
  }
  if (a3 == 8)
  {
    if ((unint64_t)(a4 - 2) < 2)
    {
      v4 = 7;
      goto LABEL_6;
    }
    if (!a4)
      goto LABEL_3;
    if (a4 == 1)
    {
      v4 = 8;
      goto LABEL_6;
    }
  }
  else
  {
LABEL_12:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStream setDeviceRoleForAudioStreamMode:direction:].cold.1();
    }
  }
}

- (void)setupAudioPowerSpectrum
{
  self->_audioPowerSpectrumSourceUplink = -[VCAudioPowerSpectrumSource initWithStreamToken:delegate:]([VCAudioPowerSpectrumSource alloc], "initWithStreamToken:delegate:", self->super._streamTokenUplink, 0);
  -[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:](+[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance"), "registerAudioPowerMeterSource:", self->_audioPowerSpectrumSourceUplink);
  self->_audioPowerSpectrumSourceDownlink = -[VCAudioPowerSpectrumSource initWithStreamToken:delegate:]([VCAudioPowerSpectrumSource alloc], "initWithStreamToken:delegate:", self->super._streamTokenDownlink, 0);
  -[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:](+[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance"), "registerAudioPowerMeterSource:", self->_audioPowerSpectrumSourceDownlink);
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
  VCTerminateProcess((uint64_t)a3, a4, (uint64_t)a5);
}

- (void)setUpMediaRecorder
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to allocate the media recorder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)cleanUpMediaRecorder
{
  if (self->_mediaRecorder)
  {
    -[VCMediaRecorderManager unregisterMediaRecorderWithStreamToken:](+[VCMediaRecorderManager sharedInstance](VCMediaRecorderManager, "sharedInstance"), "unregisterMediaRecorderWithStreamToken:", self->super._streamToken);
    -[VCMediaRecorder invalidate](self->_mediaRecorder, "invalidate");

    self->_mediaRecorder = 0;
  }
}

- (void)setupCaptionsCoordinatorsWithFormat:(tagVCAudioFrameFormat *)a3 direction:(int64_t)a4
{
  VCAudioCaptionsCoordinator *v6;
  __int128 v7;
  __int128 v8;
  int *v9;
  __int128 v10;
  __int128 v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  _BYTE v15[48];
  unint64_t v16;
  _BYTE buf[48];
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->_shouldSetUpCaptions)
  {
LABEL_22:
    -[VCAudioStream cleanUpCaptionsCoordinators](self, "cleanUpCaptionsCoordinators", a3, a4);
    return;
  }
  if (self->_isCaptionsFormatValid)
  {
    if (!memcmp(&self->_captionsFormat, a3, 0x30uLL))
      return;
    -[VCAudioStream cleanUpCaptionsCoordinators](self, "cleanUpCaptionsCoordinators");
  }
  v6 = -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]([VCAudioCaptionsCoordinator alloc], "initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:", 1, 0, CFSTR("callrecordingcaptions"), -[VCObject reportingAgent](self, "reportingAgent"));
  self->_captionsCoordinator = v6;
  if (!v6)
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStream setupCaptionsCoordinatorsWithFormat:direction:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAudioStream setupCaptionsCoordinatorsWithFormat:direction:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 1285;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v12;
          *(_WORD *)&buf[38] = 2048;
          *(_QWORD *)&buf[40] = self;
          _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to allocate the captions coordinator", buf, 0x30u);
        }
      }
    }
    goto LABEL_22;
  }
  self->_isCaptionsFormatValid = 1;
  v8 = *(_OWORD *)&self->_vpioFormat.format.mBytesPerPacket;
  v7 = *(_OWORD *)&self->_vpioFormat.format.mBitsPerChannel;
  *(_OWORD *)&self->_captionsFormat.format.mSampleRate = *(_OWORD *)&self->_vpioFormat.format.mSampleRate;
  *(_OWORD *)&self->_captionsFormat.format.mBytesPerPacket = v8;
  *(_OWORD *)&self->_captionsFormat.format.mBitsPerChannel = v7;
  v9 = &OBJC_IVAR___VCMediaStream__streamTokenUplink;
  if (a4 != 1)
  {
    if (a4 == 3)
    {
      memset(&buf[16], 170, 32);
      *(_OWORD *)buf = xmmword_1D910B0C8;
      v10 = *(_OWORD *)&self->_vpioFormat.format.mSampleRate;
      *(_OWORD *)&buf[24] = *(_OWORD *)&self->_vpioFormat.format.mBytesPerPacket;
      *(_QWORD *)buf = self->super._streamTokenUplink;
      *(_QWORD *)&buf[40] = *(_QWORD *)&self->_vpioFormat.format.mBitsPerChannel;
      v18 = 0xAAAAAAAAAAAAAA01;
      *(_OWORD *)&buf[8] = v10;
      -[VCAudioCaptionsCoordinator registerStreamWithConfig:](self->_captionsCoordinator, "registerStreamWithConfig:", buf);
    }
    v9 = &OBJC_IVAR___VCMediaStream__streamTokenDownlink;
  }
  *(_OWORD *)v15 = xmmword_1D910B0C8;
  memset(&v15[16], 170, 32);
  v11 = *(_OWORD *)&self->_captionsFormat.format.mBytesPerPacket;
  *(_OWORD *)&v15[8] = *(_OWORD *)&self->_captionsFormat.format.mSampleRate;
  *(_QWORD *)v15 = *(Class *)((char *)&self->super.super.super.isa + *v9);
  *(_OWORD *)&v15[24] = v11;
  *(_QWORD *)&v15[40] = *(_QWORD *)&self->_captionsFormat.format.mBitsPerChannel;
  v16 = 0xAAAAAAAAAAAAAA00;
  -[VCAudioCaptionsCoordinator registerStreamWithConfig:](self->_captionsCoordinator, "registerStreamWithConfig:", v15);
}

- (void)cleanUpCaptionsCoordinators
{
  -[VCAudioCaptionsCoordinator invalidate](self->_captionsCoordinator, "invalidate");

  self->_captionsCoordinator = 0;
  self->_isCaptionsFormatValid = 0;
}

- (VCAudioStream)initWithClientPid:(int)a3
{
  uint64_t v3;
  VCAudioStream *v4;
  VCAudioStream *v5;
  objc_super v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioStream;
  v4 = -[VCMediaStream initWithTransportSessionID:](&v7, sel_initWithTransportSessionID_, 0);
  v5 = v4;
  if (v4
    && !-[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:](v4, "setupAudioStreamWithClientPid:enableAudioPowerSpectrum:", v3, 1))
  {

    return 0;
  }
  return v5;
}

- (VCAudioStream)initWithClientPid:(int)a3 ssrc:(unsigned int)a4 transportSessionID:(unsigned int)a5 streamToken:(int64_t)a6
{
  uint64_t v6;
  VCAudioStream *v7;
  VCAudioStream *v8;
  objc_super v10;
  uint64_t v11;

  v6 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCAudioStream;
  v7 = -[VCMediaStream initWithTransportSessionID:localSSRC:streamToken:](&v10, sel_initWithTransportSessionID_localSSRC_streamToken_, *(_QWORD *)&a5, *(_QWORD *)&a4, a6);
  v8 = v7;
  if (v7
    && !-[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:](v7, "setupAudioStreamWithClientPid:enableAudioPowerSpectrum:", v6, 0))
  {

    return 0;
  }
  return v8;
}

- (id)setLocalParticipantInfo:(id)a3 networkSockets:(id)a4 withError:(id *)a5
{
  id v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCAudioStream;
  v12[0] = 0;
  v8 = -[VCMediaStream setLocalParticipantInfo:networkSockets:withError:](&v11, sel_setLocalParticipantInfo_networkSockets_withError_, a3, a4, v12);
  if (v12[0])
  {
    v9 = 0;
    if (!a5)
      return v9;
    goto LABEL_7;
  }
  v9 = v8;
  if (self->_enableAudioPowerSpectrum)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->super._streamTokenUplink), CFSTR("avcKeyAudioPowerSpectrumTokenInput"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->super._streamTokenDownlink), CFSTR("avcKeyAudioPowerSpectrumTokenOutput"));
  }
  self->_shouldSetUpCaptions = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSetUpCaptioning")), "BOOLValue");
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSetUpRecording")), "BOOLValue"))-[VCAudioStream setUpMediaRecorder](self, "setUpMediaRecorder");
  if (a5)
LABEL_7:
    *a5 = (id)v12[0];
  return v9;
}

- (BOOL)setupAudioStreamWithClientPid:(int)a3 enableAudioPowerSpectrum:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  const __CFAllocator *v8;
  DTMFEventHandler *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  _BOOL4 v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  VCAudioStream *v35;
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  VRTraceReset();
  VRTracePrintLoggingInfo();
  if ((AVConferenceServer_ProcessIsAvconferenced() & 1) == 0)
    SoundDec_PrepareAudioConverter();
  self->_clientPid = a3;
  self->_currentDTXEnable = 1;
  self->_audioSessionId = VCUniqueIDGenerator_GenerateID();
  pthread_rwlock_init(&self->stateLock, 0);
  +[GKSConnectivitySettings getRemoteMediaStallTimeout](GKSConnectivitySettings, "getRemoteMediaStallTimeout");
  self->_remoteMediaStallTimeout = v7;
  self->_sourceContext.volume = -1.0;
  self->_sourceContext.self = self;
  self->_sourceContext.remoteMediaStallTimeout = v7;
  VCSingleLinkedListInitialize((uint64_t)&self->_sourceContext.transports, (uint64_t)_VCAudioStreamSourceContextTransportCompare);
  self->audioPayloads = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  self->_allowedAudioPayloads = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  self->_syncSourceDelegates = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  CMSimpleQueueCreate(v8, 100, &self->_syncSourceDelegateQueue);
  self->_delegateLock._os_unfair_lock_opaque = 0;
  self->_runLock = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  VCSingleLinkedListInitialize((uint64_t)&self->_sourceContext.syncDelegateList, (uint64_t)_VCAudioStreamSyncDelegateCompare);
  if (self->audioPayloads)
  {
    self->preferredAudioCodec = 98;
    v9 = objc_alloc_init(DTMFEventHandler);
    self->dtmfEventHandler = v9;
    if (v9)
    {
      -[VCObject setReportingAgent:](self, "setReportingAgent:", 0);
      self->_enableAudioPowerSpectrum = v4;
      if (v4)
        -[VCAudioStream setupAudioPowerSpectrum](self, "setupAudioPowerSpectrum");
      -[VCAudioStream registerForThermalNotifications](self, "registerForThermalNotifications");
      self->super._notificationHandler = _VCAudioStream_NWConnectionNotificationHandler;
      if ((VCAudioStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_27;
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        v26 = 136315650;
        v27 = v13;
        v28 = 2080;
        v29 = "-[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:]";
        v30 = 1024;
        v31 = 1428;
        v15 = "VCAudioStream [%s] %s:%d ";
        v16 = v14;
        v17 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v10 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v10 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_27;
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        v26 = 136316162;
        v27 = v19;
        v28 = 2080;
        v29 = "-[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:]";
        v30 = 1024;
        v31 = 1428;
        v32 = 2112;
        v33 = v10;
        v34 = 2048;
        v35 = self;
        v15 = "VCAudioStream [%s] %s:%d %@(%p) ";
        v16 = v20;
        v17 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v26, v17);
LABEL_27:
      LOBYTE(v18) = 1;
      return v18;
    }
    if ((VCAudioStream *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_40;
      v24 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v18)
        return v18;
      v26 = 136316162;
      v27 = v24;
      v28 = 2080;
      v29 = "-[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:]";
      v30 = 1024;
      v31 = 1413;
      v32 = 2112;
      v33 = v12;
      v34 = 2048;
      v35 = self;
      v23 = "VCAudioStream [%s] %s:%d %@(%p) Failed to allocate the DTMF event handler";
      goto LABEL_39;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v18)
        return v18;
      -[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:].cold.2();
    }
    goto LABEL_40;
  }
  if ((VCAudioStream *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_40;
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v18)
      return v18;
    v26 = 136316162;
    v27 = v21;
    v28 = 2080;
    v29 = "-[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:]";
    v30 = 1024;
    v31 = 1406;
    v32 = 2112;
    v33 = v11;
    v34 = 2048;
    v35 = self;
    v23 = "VCAudioStream [%s] %s:%d %@(%p) Failed to allocate audio payloads";
LABEL_39:
    _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v26, 0x30u);
    goto LABEL_40;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_40:
    LOBYTE(v18) = 0;
    return v18;
  }
  VRTraceErrorLogLevelToCSTR();
  v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v18)
  {
    -[VCAudioStream setupAudioStreamWithClientPid:enableAudioPowerSpectrum:].cold.1();
    goto LABEL_40;
  }
  return v18;
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t *v11;
  NSObject *pausedAudioHeartBeat;
  tagVCAudioReceiver *audioReceiver;
  __CFArray *syncSourceDelegates;
  opaqueCMSimpleQueue *syncSourceDelegateQueue;
  NSObject *runLock;
  unsigned int *reportingSSRCList;
  unsigned int operatingMode;
  VCAudioPowerSpectrumManager *v19;
  VCAudioPowerSpectrumManager *v20;
  AVCStatisticsCollector *statsCollector;
  objc_super v22;
  _BYTE buf[12];
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  VCAudioStream *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v4;
        v24 = 2080;
        v25 = "-[VCAudioStream dealloc]";
        v26 = 1024;
        v27 = 1434;
        v6 = "VCAudioStream [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v9;
        v24 = 2080;
        v25 = "-[VCAudioStream dealloc]";
        v26 = 1024;
        v27 = 1434;
        v28 = 2112;
        v29 = v3;
        v30 = 2048;
        v31 = self;
        v6 = "VCAudioStream [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  -[VCAudioStream reportingAlgosAudioStreamEvent:](self, "reportingAlgosAudioStreamEvent:", 4);
  while (1)
  {
    v11 = VCSingleLinkedListPop((uint64_t *)&self->_sourceContext.transports);
    if (!v11)
      break;
    free(v11);
  }
  _VCAudioStream_ProcessDelegateEventQueue((uint64_t)self);
  while (1)
  {
    *(_QWORD *)buf = VCSingleLinkedListPop((uint64_t *)&self->_sourceContext.syncDelegateList);
    if (!*(_QWORD *)buf)
      break;
    _VCAudioStream_ReleaseSyncDelegateEvent((uint64_t *)buf, 0);
  }
  pthread_rwlock_destroy(&self->stateLock);
  pausedAudioHeartBeat = self->pausedAudioHeartBeat;
  if (pausedAudioHeartBeat)
    dispatch_release(pausedAudioHeartBeat);

  audioReceiver = self->_sourceContext.audioReceiver;
  if (audioReceiver)
  {
    VCAudioReceiver_Finalize(&audioReceiver->var0.var0);
    self->_sourceContext.audioReceiver = 0;
  }
  syncSourceDelegates = self->_syncSourceDelegates;
  if (syncSourceDelegates)
    CFRelease(syncSourceDelegates);
  syncSourceDelegateQueue = self->_syncSourceDelegateQueue;
  if (syncSourceDelegateQueue)
    CFRelease(syncSourceDelegateQueue);
  runLock = self->_runLock;
  if (runLock)
    dispatch_release(runLock);

  reportingSSRCList = self->_reportingSSRCList;
  if (reportingSSRCList)
  {
    free(reportingSSRCList);
    self->_reportingSSRCList = 0;
  }

  -[VCAudioStream setFrequencyMeteringEnabled:meterType:](self, "setFrequencyMeteringEnabled:meterType:", 0, 0);
  -[VCAudioStream setFrequencyMeteringEnabled:meterType:](self, "setFrequencyMeteringEnabled:meterType:", 0, 1);
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingCacheModuleSpecificInfo();

  operatingMode = self->super._operatingMode;
  if (operatingMode > 6 || ((1 << operatingMode) & 0x46) == 0)
    -[VCMediaStream deregisterAggregationHandlers](self, "deregisterAggregationHandlers");
  -[VCAudioStream unregisterForThermalNotifications](self, "unregisterForThermalNotifications");
  if (self->_enableAudioPowerSpectrum)
  {
    v19 = +[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance");
    -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v19, "unregisterAudioPowerSpectrumSourceForStreamToken:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->super._streamTokenUplink));
    v20 = +[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance");
    -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v20, "unregisterAudioPowerSpectrumSourceForStreamToken:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->super._streamTokenDownlink));
    -[VCAudioPowerSpectrumSource invalidate](self->_audioPowerSpectrumSourceUplink, "invalidate");

    -[VCAudioPowerSpectrumSource invalidate](self->_audioPowerSpectrumSourceDownlink, "invalidate");
  }
  statsCollector = self->_statsCollector;
  if (statsCollector)
  {
    CFRelease(statsCollector);
    self->_statsCollector = 0;
  }

  -[VCAudioStream cleanUpCaptionsCoordinators](self, "cleanUpCaptionsCoordinators");
  -[VCAudioStream cleanUpMediaRecorder](self, "cleanUpMediaRecorder");
  v22.receiver = self;
  v22.super_class = (Class)VCAudioStream;
  -[VCMediaStream dealloc](&v22, sel_dealloc);
}

- (void)handleThermalPressureNotification:(id)a3
{
  uint64_t v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("VCVideoCaptureServer_NotificationKeyThermalPressureLevel")), "intValue");
  v4 = CFSTR("Thermal");
  v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  reportingGenericEvent();
}

- (void)registerForThermalNotifications
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_handleThermalPressureNotification_, CFSTR("VCVideoCaptureServer_NotificationNameThermalPressureLevel"), 0);
}

- (void)unregisterForThermalNotifications
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("VCVideoCaptureServer_NotificationNameThermalPressureLevel"), 0);
}

- (int)getPacketsPerBundleForStreamConfig:(id)a3
{
  int64_t v5;
  void *v6;
  uint64_t v7;
  int v9;
  int v10;
  int v11;

  v5 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload"));
  v6 = (void *)objc_msgSend(a3, "allCodecConfigurations");
  v7 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5)), "pTime");
  if (-[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload") == 106)
  {
    if (v7 == 60)
      return 2;
    else
      return 1;
  }
  else if (-[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload") == 104)
  {
    if (v7 == 60)
      v9 = 3;
    else
      v9 = 1;
    if (v7 == 40)
      return 2;
    else
      return v9;
  }
  else
  {
    v10 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload");
    if (v7 == 40)
      v11 = 4;
    else
      v11 = 1;
    if (v7 == 20)
      v11 = 2;
    if (v10 == 101)
      return v11;
    else
      return 1;
  }
}

- (void)configureAudioJBAlgos:(tagVCAudioReceiverConfig *)a3
{
  VCMediaStreamConfig *v5;
  VCMediaStreamConfig *v6;
  _BOOL4 isTelephony;
  uint64_t v8;
  _BOOL8 v9;
  unsigned int v10;
  _BOOL4 var11;
  _BOOL8 v12;

  v5 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  v6 = v5;
  isTelephony = self->_isTelephony;
  v8 = 2;
  if (self->_isTelephony)
  {
    v9 = 1;
  }
  else
  {
    v10 = -[VCMediaStreamConfig channelCount](v5, "channelCount");
    v9 = v10 < 2;
    if (v10 >= 2)
      v8 = 2;
    else
      v8 = 3;
  }
  a3->var6 = VCDefaults_GetIntValueForKey(CFSTR("audioTimescaleAlgorithm"), v8);
  a3->var20 = VCDefaults_GetIntValueForKey(CFSTR("audioJitterBufferQueueManagementAlgo"), v9);
  a3->var18 = VCDefaults_GetBoolValueForKey(CFSTR("audioJitterBufferDisableSpikeManagement"), isTelephony);
  var11 = a3->var11;
  if (a3->var11)
    var11 = -[VCMediaStreamConfig channelCount](v6, "channelCount") < 2;
  a3->var7 = var11;
  if (+[GKSConnectivitySettings supportsEVSCodec](GKSConnectivitySettings, "supportsEVSCodec"))
    v12 = +[VCAudioStream isVoLTE:](VCAudioStream, "isVoLTE:", -[VCMediaStreamConfig audioStreamMode](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "audioStreamMode"));
  else
    v12 = 0;
  a3->var21 = VCDefaults_GetBoolValueForKey(CFSTR("enableEVSWidebandDecodeForAMRWideband"), v12);
}

- (BOOL)createAudioReceiver
{
  unsigned int v3;
  __int128 v4;
  uint64_t v5;
  NSString *callID;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  char v17;
  __int16 v18;
  char v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  AVCStatisticsCollector *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  VCMediaStreamConfig *v31;
  BOOL BoolValueForKey;
  int v33;
  BOOL v34;
  _BOOL4 v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  BOOL isNWMonitorSignalEnabled;
  BOOL isVoiceProcessingAt24KSupported;
  tagVCAudioReceiver *Receiver;
  const __CFString *v42;
  _BOOL4 v43;
  uint64_t v44;
  NSObject *v45;
  tagVCAudioReceiver *audioReceiver;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  uint64_t v50;
  NSObject *v51;
  tagVCAudioReceiver *v52;
  int operatingMode;
  int isOverlayEnabled;
  double v55;
  tagVCAudioReceiver *v56;
  int64_t overlayToken;
  __int128 v59;
  unsigned int v60;
  NSMutableArray *obj;
  _BYTE buf[12];
  __int16 v63;
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  VCAudioStream *v70;
  __int16 v71;
  tagVCAudioReceiver *v72;
  _BYTE v73[128];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _OWORD v78[14];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v79 = 0u;
  memset(v78, 0, sizeof(v78));
  v3 = -[VCMediaStreamConfig remoteSSRC](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "remoteSSRC");
  v4 = 0uLL;
  if (!v3)
  {
    if (self->super._callID)
    {
      *(_QWORD *)buf = 0;
      v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^\\d{1,10}$"), 0, buf, 0.0), "numberOfMatchesInString:options:range:", self->super._callID, 0, 0, -[NSString length](self->super._callID, "length"));
      callID = self->super._callID;
      if (v5 == 1)
        v3 = -[NSString integerValue](callID, "integerValue");
      else
        v3 = -[NSString hash](callID, "hash");
      v4 = 0uLL;
    }
    else
    {
      v3 = 0;
    }
  }
  v60 = v3;
  v76 = v4;
  v77 = v4;
  v74 = v4;
  v75 = v4;
  obj = self->super._transportArray;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v74, v73, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v75;
    *(_QWORD *)&v8 = 136315650;
    v59 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v75 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v11);
        v13 = (void *)objc_msgSend((id)objc_msgSend(v12, "streamConfig", v59), "multiwayConfig");
        v14 = v13;
        if (v13)
          v15 = 0;
        else
          v15 = !self->_sourceContext.isMultiwayConfig;
        v16 = !v15;
        self->_sourceContext.isMultiwayConfig = v16;
        v17 = objc_msgSend(v13, "hasIdsStreamID");
        *((_BYTE *)&v78[1] + 56 * LODWORD(v78[0]) + 2) = v17;
        if (objc_msgSend(v14, "hasIdsStreamID"))
        {
          v18 = objc_msgSend(v12, "idsStreamId");
          *((_WORD *)&v78[1] + 28 * LODWORD(v78[0])) = v18;
        }
        v19 = objc_msgSend(v14, "isOneToOne");
        v20 = (char *)v78 + 56 * LODWORD(v78[0]) + 8;
        v20[11] = v19;
        *((_DWORD *)v20 + 6) = 1;
        v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "streamConfig"), "rateControlConfig"), "mediaControlInfoGenerator");
        *((_QWORD *)&v78[3] + 7 * LODWORD(v78[0])) = v21;
        v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "streamConfig"), "rateControlConfig"), "statisticsCollector");
        *((_QWORD *)&v78[3] + 7 * LODWORD(v78[0]) + 1) = v22;
        if (objc_msgSend(v14, "isOneToOne"))
        {
          *((_DWORD *)&v78[2] + 14 * LODWORD(v78[0])) = 0;
          v23 = objc_msgSend(v14, "shouldIgnoreRTPHeaderExtensions");
          *((_BYTE *)&v78[2] + 56 * LODWORD(v78[0]) + 4) = v23;
          self->_sourceContext.oneToOneStreamID = objc_msgSend(v12, "idsStreamId");
          self->_sourceContext.oneToOneStatisticsCollector = -[VCMediaStreamRateControlConfig statisticsCollector](-[VCMediaStreamConfig rateControlConfig](-[VCMediaStream oneToOneStreamConfig](self, "oneToOneStreamConfig"), "rateControlConfig"), "statisticsCollector");
          v24 = -[VCMediaStreamRateControlConfig statisticsCollector](-[VCMediaStreamConfig rateControlConfig](-[VCMediaStream oneToOneStreamConfig](self, "oneToOneStreamConfig"), "rateControlConfig"), "statisticsCollector");
          *((_QWORD *)&v78[3] + 7 * LODWORD(v78[0]) + 1) = v24;
          if (!self->super._isWRMinitialized)
          {
            if (-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"))
            {
              -[VCMediaStream initializeWRMUsingRtpHandle:](self, "initializeWRMUsingRtpHandle:", objc_msgSend(v12, "rtpHandle"));
              self->super._isWRMinitialized = 1;
            }
            else if (!self->super._isWRMinitialized
                   && !-[VCMediaStream networkFeedbackController](self, "networkFeedbackController")
                   && (int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v28 = VRTraceErrorLogLevelToCSTR();
              v29 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v59;
                *(_QWORD *)&buf[4] = v28;
                v63 = 2080;
                v64 = "-[VCAudioStream createAudioReceiver]";
                v65 = 1024;
                v66 = 1634;
                _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d NetworkFeedbackController is nil in AudioStream", buf, 0x1Cu);
              }
            }
          }
        }
        else
        {
          *((_QWORD *)&v87 + 1) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "streamConfig"), "rateControlConfig"), "statisticsCollector");
        }
        v25 = objc_msgSend(v12, "rtpHandle");
        *((_QWORD *)v78 + 7 * LODWORD(v78[0]) + 1) = v25;
        v26 = objc_msgSend(v12, "receiverSframeCryptor");
        v27 = LODWORD(v78[0])++;
        *((_QWORD *)&v78[1] + 7 * v27 + 1) = v26;
        ++v11;
      }
      while (v9 != v11);
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v74, v73, 16);
      v9 = v30;
    }
    while (v30);
  }
  v31 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("useErasureSensitiveMode"), 0);
  v33 = 0;
  if (!BoolValueForKey)
    v33 = -[VCMediaStreamConfig jitterBufferMode](v31, "jitterBufferMode");
  DWORD1(v80) = v33;
  DWORD2(v80) = -[VCMediaStreamConfig fixedJitterBufferSize](v31, "fixedJitterBufferSize");
  v34 = (-[VCMediaStreamConfig isLowLatency](v31, "isLowLatency") & 1) != 0
     || -[VCMediaStreamConfig audioStreamMode](v31, "audioStreamMode") == 9;
  BYTE8(v89) = v34;
  LODWORD(v80) = v60;
  *((_QWORD *)&v79 + 1) = -[VCMediaStream mediaControlInfoGenerator](self, "mediaControlInfoGenerator");
  BYTE4(v81) = self->super._operatingMode == 6;
  *((_QWORD *)&v81 + 1) = -[VCObject reportingAgent](self, "reportingAgent");
  BYTE4(v82) = self->super._operatingMode == 6;
  LODWORD(v82) = self->_reportingModuleID;
  BYTE11(v83) = -[VCMediaStreamConfig enableMaxBitrateOnNoChangeCMR](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "enableMaxBitrateOnNoChangeCMR");
  BYTE10(v83) = 0;
  *((_QWORD *)&v84 + 1) = self;
  *(_QWORD *)&v85 = _VCAudioStream_UpdateSourceNTPToRTPTimeMappingCallback;
  *((_QWORD *)&v85 + 1) = _VCAudioStream_StreamSwitchCallback;
  *(_QWORD *)&v86 = VCMediaStream_RTCPPacketsCallback;
  *(_QWORD *)&v87 = -[VCMediaStreamConfig jbTargetEstimatorSynchronizer](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "jbTargetEstimatorSynchronizer");
  BYTE14(v83) = VCDefaults_GetBoolValueForKey(CFSTR("dtmfTonePlaybackEnabled"), -[VCMediaStreamConfig dtmfTonePlaybackEnabled](v31, "dtmfTonePlaybackEnabled"));
  v35 = VCDefaults_GetBoolValueForKey(CFSTR("dtmfEventCallbacksEnabled"), -[VCMediaStreamConfig dtmfEventCallbacksEnabled](v31, "dtmfEventCallbacksEnabled"));
  BYTE9(v91) = v35;
  if (v35)
  {
    -[VCMediaStream delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *((_QWORD *)&v86 + 1) = _VCAudioStream_DTMFEventCallback;
  }
  LODWORD(v89) = -[VCMediaStreamConfig dtmfSampleRate](v31, "dtmfSampleRate");
  BYTE9(v90) = -[VCMediaStreamConfig outOfProcessCodecsEnabled](v31, "outOfProcessCodecsEnabled");
  *(_QWORD *)&v91 = self->super._callID;
  WORD4(v83) = -[VCMediaStreamConfig direction](v31, "direction");
  -[VCAudioStream configureAudioJBAlgos:](self, "configureAudioJBAlgos:", v78);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v36 = VRTraceErrorLogLevelToCSTR();
    v37 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v36;
      v63 = 2080;
      v64 = "-[VCAudioStream createAudioReceiver]";
      v65 = 1024;
      v66 = 1672;
      v67 = 2048;
      v68 = (void *)v87;
      _os_log_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d Creating Audio Receiver with jbTargetEstimatorSynchronizer=%p", buf, 0x26u);
    }
  }
  if (BYTE4(v82))
  {
    DWORD2(v88) = -[VCMediaStreamMultiwayConfig streamGroupID](-[VCMediaStreamConfig multiwayConfig](v31, "multiwayConfig"), "streamGroupID");
    *((_QWORD *)&v82 + 1) = -[VCMediaStreamMultiwayConfig participantId](-[VCMediaStreamConfig multiwayConfig](v31, "multiwayConfig"), "participantId");
    *(_QWORD *)&v83 = -[VCMediaStreamMultiwayConfig sessionId](-[VCMediaStreamConfig multiwayConfig](v31, "multiwayConfig"), "sessionId");
    BYTE12(v83) = -[VCMediaStreamMultiwayConfig shouldIgnoreRTPHeaderExtensions](-[VCMediaStreamConfig multiwayConfig](v31, "multiwayConfig"), "shouldIgnoreRTPHeaderExtensions");
    *(_QWORD *)&v90 = -[VCMediaStreamMultiwayConfig remoteIDSParticipantID](-[VCMediaStreamConfig multiwayConfig](v31, "multiwayConfig"), "remoteIDSParticipantID");
  }
  if (self->_isTelephony)
    BYTE12(v88) = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-audio-issue-detector-enabled"), CFSTR("audioIssueDetectorEnabled"), "AVConference", "UseAudioIssueDetectors");
  v38 = -[VCAudioStream getConnectionTypeForStreamMode:](self, "getConnectionTypeForStreamMode:", -[VCMediaStreamConfig audioStreamMode](v31, "audioStreamMode"));
  isNWMonitorSignalEnabled = self->super._isNWMonitorSignalEnabled;
  DWORD1(v89) = v38;
  BYTE9(v89) = isNWMonitorSignalEnabled;
  isVoiceProcessingAt24KSupported = self->_isVoiceProcessingAt24KSupported;
  if (isVoiceProcessingAt24KSupported)
    isVoiceProcessingAt24KSupported = self->_isRamStadSRCEnabled;
  BYTE8(v91) = isVoiceProcessingAt24KSupported;
  BYTE8(v90) = VCDefaults_GetBoolValueForKey(CFSTR("audioDumpEnabled"), 0);
  BYTE10(v91) = -[VCMediaStreamConfig isEnhancedJBAdaptationsEnabled](v31, "isEnhancedJBAdaptationsEnabled");
  HIDWORD(v91) = objc_msgSend(+[GKSConnectivitySettings readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-reporting-audio-erasure-percentage-symptom-threshold"), 0, &unk_1E9EF4040, 0), "intValue");
  Receiver = (tagVCAudioReceiver *)VCAudioReceiver_CreateReceiver((uint64_t)v78);
  self->_sourceContext.audioReceiver = Receiver;
  if (Receiver)
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v44 = VRTraceErrorLogLevelToCSTR();
        v45 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          audioReceiver = self->_sourceContext.audioReceiver;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v44;
          v63 = 2080;
          v64 = "-[VCAudioStream createAudioReceiver]";
          v65 = 1024;
          v66 = 1699;
          v67 = 2048;
          v68 = audioReceiver;
          v47 = "VCAudioStream [%s] %s:%d audioReceiver=%p";
          v48 = v45;
          v49 = 38;
LABEL_66:
          _os_log_impl(&dword_1D8A54000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v42 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v42 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v50 = VRTraceErrorLogLevelToCSTR();
        v51 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v52 = self->_sourceContext.audioReceiver;
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = v50;
          v63 = 2080;
          v64 = "-[VCAudioStream createAudioReceiver]";
          v65 = 1024;
          v66 = 1699;
          v67 = 2112;
          v68 = (void *)v42;
          v69 = 2048;
          v70 = self;
          v71 = 2048;
          v72 = v52;
          v47 = "VCAudioStream [%s] %s:%d %@(%p) audioReceiver=%p";
          v48 = v51;
          v49 = 58;
          goto LABEL_66;
        }
      }
    }
    self->_sourceContext.audioReceiver->var64 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload");
    self->_sourceContext.audioReceiver->var68 = -[VCAudioPayloadConfig codecSampleRate](-[VCAudioPayload config](self->currentAudioPayload, "config"), "codecSampleRate");
    if (self->_sourceContext.isSendOnly || -[VCAudioStream setReceiverPayloads](self, "setReceiverPayloads"))
    {
      operatingMode = self->super._operatingMode;
      if (operatingMode == 6)
      {
        -[VCAudioStream registerActiveAudioStreamChangeNotifications](self, "registerActiveAudioStreamChangeNotifications");
      }
      else if (operatingMode == 3)
      {
        -[VCAudioStream registerCodecRateModeChangeNotifications](self, "registerCodecRateModeChangeNotifications");
      }
      isOverlayEnabled = VCOverlayManager_isOverlayEnabled();
      v56 = self->_sourceContext.audioReceiver;
      if (isOverlayEnabled)
      {
        if (v56)
        {
          overlayToken = self->_overlayToken;
          if (overlayToken)
          {
            VCAudioReceiver_SetOverlayToken((uint64_t)v56, overlayToken);
            v56 = self->_sourceContext.audioReceiver;
          }
        }
      }
      VCAudioReceiver_SetAudioPlayoutDelay((uint64_t)v56, self->_audioPlayoutDelay, v55);
      LOBYTE(v43) = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStream createAudioReceiver].cold.2();
      }
      VCAudioReceiver_Finalize(&self->_sourceContext.audioReceiver->var0.var0);
      LOBYTE(v43) = 0;
      self->_sourceContext.audioReceiver = 0;
    }
    return v43;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v43 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v43)
      return v43;
    -[VCAudioStream createAudioReceiver].cold.1();
  }
  LOBYTE(v43) = 0;
  return v43;
}

- (unsigned)packetExpirationTimeForStreamConfig:(id)a3 codecType:(int64_t)a4
{
  void *v7;
  uint64_t v8;

  if (objc_msgSend(a3, "audioStreamMode") != 8)
    return 0;
  v7 = (void *)objc_msgSend(a3, "allCodecConfigurations");
  v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4)), "pTime");
  if (!v8)
  {
    if (-[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload") == 119)
      LODWORD(v8) = objc_msgSend(-[VCAudioStream codecConfigForOpusWithStreamConfig:](self, "codecConfigForOpusWithStreamConfig:", a3), "pTime");
    else
      LODWORD(v8) = 0;
  }
  if (self->_preferredMediaBitrate == 900000)
    return 50;
  else
    return 2 * v8;
}

- (BOOL)createAudioTransmitter:(int64_t)a3 streamIDs:(id)a4
{
  VCAudioTransmitterConfig *v7;
  VCMediaStreamConfig *v8;
  unsigned __int8 v9;
  int64_t v10;
  __int128 v11;
  uint64_t operatingMode;
  uint64_t cachedConnectionMTU;
  uint64_t constantTransportOverhead;
  uint64_t v15;
  uint64_t v16;
  uint64_t IntValueForKey;
  _BOOL8 v18;
  _BOOL8 v19;
  VCAudioTransmitter *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  VCAudioTransmitter *audioTransmitter;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  NSObject *v29;
  VCAudioTransmitter *v30;
  _OWORD v32[3];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  VCAudioStream *v42;
  __int16 v43;
  VCAudioTransmitter *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(VCAudioTransmitterConfig);
  v8 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  v9 = -[VCAudioStream getPacketsPerBundleForStreamConfig:](self, "getPacketsPerBundleForStreamConfig:", v8);
  v10 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload"));
  -[VCAudioTransmitterConfig setRtpHandle:](v7, "setRtpHandle:", -[VCMediaStreamTransport rtpHandle](-[VCMediaStream defaultTransport](self, "defaultTransport"), "rtpHandle"));
  -[VCAudioTransmitterConfig setControlInfoGenerator:](v7, "setControlInfoGenerator:", -[VCMediaStream mediaControlInfoGenerator](self, "mediaControlInfoGenerator"));
  -[VCAudioTransmitterConfig setAudioPayloads:](v7, "setAudioPayloads:", self->audioPayloads);
  -[VCAudioTransmitterConfig setChosenAudioPayload:](v7, "setChosenAudioPayload:", self->currentAudioPayload);
  -[VCAudioTransmitterConfig setChosenDTXPayload:](v7, "setChosenDTXPayload:", self->currentDTXPayload);
  v11 = *(_OWORD *)&self->_vpioFormat.format.mBytesPerPacket;
  v32[0] = *(_OWORD *)&self->_vpioFormat.format.mSampleRate;
  v32[1] = v11;
  v32[2] = *(_OWORD *)&self->_vpioFormat.format.mBitsPerChannel;
  -[VCAudioTransmitterConfig setInputFormat:](v7, "setInputFormat:", v32);
  -[VCAudioTransmitterConfig setAfrcHandle:](v7, "setAfrcHandle:", 0xFFFFFFFFLL);
  -[VCAudioTransmitterConfig setUseRateControl:](v7, "setUseRateControl:", -[VCMediaStreamMultiwayConfig isOneToOne](-[VCMediaStreamConfig multiwayConfig](v8, "multiwayConfig"), "isOneToOne"));
  -[VCAudioTransmitterConfig setBundlingScheme:](v7, "setBundlingScheme:", -[VCMediaStreamConfig bundlingScheme](v8, "bundlingScheme"));
  -[VCAudioTransmitterConfig setAllowAudioSwitching:](v7, "setAllowAudioSwitching:", self->super._operatingMode == 6);
  if (-[VCMediaStreamMultiwayConfig isOneToOne](-[VCMediaStreamConfig multiwayConfig](v8, "multiwayConfig"), "isOneToOne"))
  {
    operatingMode = -[VCMediaStreamConfig oneToOneOperatingMode](v8, "oneToOneOperatingMode");
  }
  else
  {
    operatingMode = self->super._operatingMode;
  }
  -[VCAudioTransmitterConfig setOperatingMode:](v7, "setOperatingMode:", operatingMode);
  cachedConnectionMTU = self->_cachedConnectionMTU;
  if (!(_DWORD)cachedConnectionMTU)
    cachedConnectionMTU = -[VCMediaStreamConfig recommendedMTU](v8, "recommendedMTU");
  -[VCAudioTransmitterConfig setMaxAudioPacketSize:](v7, "setMaxAudioPacketSize:", cachedConnectionMTU);
  if (self->super._operatingMode == 6)
    constantTransportOverhead = self->_constantTransportOverhead;
  else
    constantTransportOverhead = 0;
  -[VCAudioTransmitterConfig setConstantTransportOverhead:](v7, "setConstantTransportOverhead:", constantTransportOverhead);
  -[VCAudioTransmitterConfig setSupportsAdaptation:](v7, "setSupportsAdaptation:", -[VCMediaStreamConfig supportsAdaptation](v8, "supportsAdaptation"));
  -[VCAudioTransmitterConfig setNeedsPacketThread:](v7, "setNeedsPacketThread:", 0);
  -[VCAudioTransmitterConfig setReportingAgent:](v7, "setReportingAgent:", -[VCObject reportingAgent](self, "reportingAgent"));
  -[VCAudioTransmitterConfig setReportingParentID:](v7, "setReportingParentID:", self->_reportingModuleID);
  -[VCAudioTransmitterConfig setPacketsPerBundle:](v7, "setPacketsPerBundle:", v9);
  v15 = 0;
  if (self->super._operatingMode == 6)
    v15 = -[VCMediaStreamMultiwayConfig isOneToOne](-[VCMediaStreamConfig multiwayConfig](v8, "multiwayConfig", 0), "isOneToOne") ^ 1;
  -[VCAudioTransmitterConfig setTransmitROC:](v7, "setTransmitROC:", v15);
  -[VCAudioTransmitterConfig setIgnoreSilence:](v7, "setIgnoreSilence:", 0);
  -[VCAudioTransmitterConfig setChosenRedPayloadType:](v7, "setChosenRedPayloadType:", 20);
  -[VCAudioTransmitterConfig setRedEnabled:](v7, "setRedEnabled:", -[VCMediaStreamConfig isRedEnabled](v8, "isRedEnabled"));
  -[VCAudioTransmitterConfig setIncludeRedSequenceOffset:](v7, "setIncludeRedSequenceOffset:", self->super._operatingMode == 6);
  -[VCAudioTransmitterConfig setRedNumPayloads:](v7, "setRedNumPayloads:", -[VCMediaStreamConfig numRedundantPayloads](v8, "numRedundantPayloads"));
  -[VCAudioTransmitterConfig setRedMaxDelay20ms:](v7, "setRedMaxDelay20ms:", -[VCMediaStreamConfig numRedundantPayloads](v8, "numRedundantPayloads"));
  -[VCAudioTransmitterConfig setStatisticsCollector:](v7, "setStatisticsCollector:", -[VCMediaStreamRateControlConfig statisticsCollector](-[VCMediaStreamConfig rateControlConfig](v8, "rateControlConfig"), "statisticsCollector"));
  -[VCAudioTransmitterConfig setStreamIDs:](v7, "setStreamIDs:", a4);
  -[VCAudioTransmitterConfig setTierNetworkBitrate:](v7, "setTierNetworkBitrate:", -[VCMediaStreamMultiwayConfig maxNetworkBitrate](-[VCMediaStreamConfig multiwayConfig](v8, "multiwayConfig"), "maxNetworkBitrate"));
  -[VCAudioTransmitterConfig setMaxIDSStreamIdCount:](v7, "setMaxIDSStreamIdCount:", -[VCMediaStreamMultiwayConfig maxIDSStreamIdCount](-[VCMediaStreamConfig multiwayConfig](v8, "multiwayConfig"), "maxIDSStreamIdCount"));
  -[VCAudioTransmitterConfig setSupportedNumRedundantPayload:](v7, "setSupportedNumRedundantPayload:", -[VCMediaStreamConfig supportedNumRedundantPayload](v8, "supportedNumRedundantPayload"));
  -[VCAudioTransmitterConfig setSendActiveVoiceOnly:](v7, "setSendActiveVoiceOnly:", self->_sendActiveVoiceOnly);
  -[VCAudioTransmitterConfig setCurrentDTXEnable:](v7, "setCurrentDTXEnable:", self->_currentDTXEnable);
  -[VCAudioTransmitterConfig setAlwaysOnAudioRedundancyEnabled:](v7, "setAlwaysOnAudioRedundancyEnabled:", 1);
  -[VCAudioTransmitterConfig setCellularAllowRedLowBitratesEnabled:](v7, "setCellularAllowRedLowBitratesEnabled:", 0);
  -[VCAudioTransmitterConfig setWifiAllowRedLowBitratesEnabled:](v7, "setWifiAllowRedLowBitratesEnabled:", 0);
  -[VCAudioTransmitterConfig setRemoteIDSParticipantID:](v7, "setRemoteIDSParticipantID:", -[VCMediaStreamMultiwayConfig remoteIDSParticipantID](-[VCMediaStreamConfig multiwayConfig](v8, "multiwayConfig"), "remoteIDSParticipantID"));
  if (-[VCMediaStreamConfig rateControlConfig](v8, "rateControlConfig"))
    v16 = -[VCMediaStreamRateControlConfig mediaQueue](-[VCMediaStreamConfig rateControlConfig](v8, "rateControlConfig"), "mediaQueue");
  else
    v16 = 0xFFFFFFFFLL;
  -[VCAudioTransmitterConfig setMediaQueue:](v7, "setMediaQueue:", v16);
  -[VCAudioTransmitterConfig setShouldCreateRedundancyController:](v7, "setShouldCreateRedundancyController:", self->super._operatingMode != 6);
  -[VCAudioTransmitterConfig setUseChannelDataFormat:](v7, "setUseChannelDataFormat:", self->super._operatingMode == 6);
  -[VCAudioTransmitterConfig setPacketExpirationTime:](v7, "setPacketExpirationTime:", -[VCAudioStream packetExpirationTimeForStreamConfig:codecType:](self, "packetExpirationTimeForStreamConfig:codecType:", v8, v10));
  IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("forceAudioPacketExpirationTime"), 0xFFFFFFFFLL);
  if ((IntValueForKey & 0x80000000) == 0)
    -[VCAudioTransmitterConfig setPacketExpirationTime:](v7, "setPacketExpirationTime:", IntValueForKey);
  if (+[VCAudioStream isVoLTE:](VCAudioStream, "isVoLTE:", a3))
    v18 = +[VCPayloadUtils supportsCodecBandwidthUpdateForCodecType:](VCPayloadUtils, "supportsCodecBandwidthUpdateForCodecType:", v10);
  else
    v18 = 0;
  -[VCAudioTransmitterConfig setSupportsCodecBandwidthUpdate:](v7, "setSupportsCodecBandwidthUpdate:", v18);
  if (-[VCMediaStreamMultiwayConfig isOneToOne](-[VCMediaStreamConfig multiwayConfig](v8, "multiwayConfig"), "isOneToOne"))
  {
    -[VCAudioTransmitterConfig setUseChannelDataFormat:](v7, "setUseChannelDataFormat:", 0);
  }
  -[VCAudioTransmitterConfig setShouldApplyRedAsBoolean:](v7, "setShouldApplyRedAsBoolean:", -[VCMediaStreamConfig shouldApplyRedAsBoolean](v8, "shouldApplyRedAsBoolean"));
  -[VCAudioTransmitterConfig setUseWifiTiers:](v7, "setUseWifiTiers:", -[VCMediaStreamConfig useWifiTiers](v8, "useWifiTiers"));
  if (-[VCMediaStreamMultiwayConfig hasQualityIndex](-[VCMediaStreamConfig multiwayConfig](v8, "multiwayConfig"), "hasQualityIndex"))
  {
    -[VCAudioTransmitterConfig setQualityIndex:](v7, "setQualityIndex:", -[VCMediaStreamMultiwayConfig qualityIndex](-[VCMediaStreamConfig multiwayConfig](v8, "multiwayConfig"), "qualityIndex"));
  }
  -[VCAudioTransmitterConfig setSframeCryptor:](v7, "setSframeCryptor:", -[VCMediaStreamTransport transmitterSframeCryptor](-[VCMediaStream defaultTransport](self, "defaultTransport"), "transmitterSframeCryptor"));
  -[VCAudioTransmitterConfig setRatType:](v7, "setRatType:", -[VCAudioStream getConnectionTypeForStreamMode:](self, "getConnectionTypeForStreamMode:", -[VCMediaStreamConfig audioStreamMode](v8, "audioStreamMode")));
  if (self->_isTelephony)
    -[VCAudioTransmitterConfig setAudioIssueDetectorEnabled:](v7, "setAudioIssueDetectorEnabled:", +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-audio-issue-detector-enabled"), CFSTR("audioIssueDetectorEnabled"), "AVConference", "UseAudioIssueDetectors"));
  -[VCAudioTransmitterConfig setTargetBitrateIsAudioOnly:](v7, "setTargetBitrateIsAudioOnly:", -[VCAudioStream bitrateIsAudioOnly](self, "bitrateIsAudioOnly"));
  -[VCAudioTransmitterConfig setAudioDumpEnabled:](v7, "setAudioDumpEnabled:", VCDefaults_GetBoolValueForKey(CFSTR("audioDumpEnabled"), 0));
  -[VCAudioTransmitterConfig setTierPickerMode:](v7, "setTierPickerMode:", +[VCAudioTierPicker operatingModeToTierPickerMode:isLowLatency:preferPlistForTierTable:](VCAudioTierPicker, "operatingModeToTierPickerMode:isLowLatency:preferPlistForTierTable:", -[VCAudioTransmitterConfig operatingMode](v7, "operatingMode"), -[VCMediaStreamConfig isLowLatency](v8, "isLowLatency"), !self->_isTelephony));
  v19 = self->_isVoiceProcessingAt24KSupported && self->_isRamStadSRCEnabled;
  -[VCAudioTransmitterConfig setRamStadSRCEnabled:](v7, "setRamStadSRCEnabled:", v19);
  -[VCAudioTransmitterConfig setIsHigherAudioREDCutoverU1Enabled:](v7, "setIsHigherAudioREDCutoverU1Enabled:", -[VCMediaStreamConfig isHigherAudioREDCutoverU1Enabled](v8, "isHigherAudioREDCutoverU1Enabled"));
  self->_audioTransmitter = -[VCAudioTransmitter initWithConfig:]([VCAudioTransmitter alloc], "initWithConfig:", v7);

  v20 = -[VCAudioStream audioTransmitter](self, "audioTransmitter");
  if (v20)
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          audioTransmitter = self->_audioTransmitter;
          *(_DWORD *)buf = 136315906;
          v34 = v22;
          v35 = 2080;
          v36 = "-[VCAudioStream createAudioTransmitter:streamIDs:]";
          v37 = 1024;
          v38 = 1834;
          v39 = 2048;
          v40 = audioTransmitter;
          v25 = "VCAudioStream [%s] %s:%d audioTransmitter=%p";
          v26 = v23;
          v27 = 38;
LABEL_42:
          _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v21 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v30 = self->_audioTransmitter;
          *(_DWORD *)buf = 136316418;
          v34 = v28;
          v35 = 2080;
          v36 = "-[VCAudioStream createAudioTransmitter:streamIDs:]";
          v37 = 1024;
          v38 = 1834;
          v39 = 2112;
          v40 = (void *)v21;
          v41 = 2048;
          v42 = self;
          v43 = 2048;
          v44 = v30;
          v25 = "VCAudioStream [%s] %s:%d %@(%p) audioTransmitter=%p";
          v26 = v29;
          v27 = 58;
          goto LABEL_42;
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioStream createAudioTransmitter:streamIDs:].cold.1();
  }
  return v20 != 0;
}

- (BOOL)bitrateIsAudioOnly
{
  return (self->super._operatingMode < 7u) & (0x46u >> self->super._operatingMode);
}

- (void)sendDTMFEvent:(id)a3
{
  -[DTMFEventHandler sendDTMFEvent:atTimestamp:withSampleRate:](self->dtmfEventHandler, "sendDTMFEvent:atTimestamp:withSampleRate:", a3, self->lastSentAudioSampleTime, -[VCAudioPayloadConfig codecSampleRate](-[VCAudioTransmitter currentAudioPayloadConfig](self->_audioTransmitter, "currentAudioPayloadConfig"), "codecSampleRate"));
}

- (void)stopSendDTMFEvent
{
  -[DTMFEventHandler stopDTMFEventAtTimestamp:withSampleRate:](self->dtmfEventHandler, "stopDTMFEventAtTimestamp:withSampleRate:", self->lastSentAudioSampleTime, -[VCAudioPayloadConfig codecSampleRate](-[VCAudioTransmitter currentAudioPayloadConfig](self->_audioTransmitter, "currentAudioPayloadConfig"), "codecSampleRate"));
}

+ (id)supportedAudioPayloads
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", &unk_1E9EF4058, &unk_1E9EF4070, &unk_1E9EF4088, &unk_1E9EF3FC8, &unk_1E9EF40A0, &unk_1E9EF40B8, &unk_1E9EF40D0, &unk_1E9EF40E8, &unk_1E9EF4100, 0);
  objc_msgSend(v2, "addObject:", &unk_1E9EF4118);
  objc_msgSend(v2, "addObject:", &unk_1E9EF4130);
  objc_msgSend(v2, "addObject:", &unk_1E9EF4148);
  objc_msgSend(v2, "addObject:", &unk_1E9EF4160);
  objc_msgSend(v2, "addObject:", &unk_1E9EF4178);
  return v2;
}

+ (id)capabilities
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("avcKeySupportedAudioCodecs");
  v4[0] = +[VCAudioStream supportedAudioPayloads](VCAudioStream, "supportedAudioPayloads");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
}

- (_METER_INFO)meterWithType:(int)a3
{
  if (a3)
    return &self->_sourceContext.soundMeter;
  else
    return &self->_sinkContext.soundMeter;
}

- (BOOL)isFrequencyMeteringEnabled:(int)a3
{
  return *(_BYTE *)-[VCAudioStream meterWithType:](self, "meterWithType:", *(_QWORD *)&a3);
}

- (void)setFrequencyMeteringEnabled:(BOOL)a3 meterType:(int)a4
{
  _BOOL4 v4;
  _METER_INFO *v5;
  _METER_INFO *v6;

  v4 = a3;
  v5 = -[VCAudioStream meterWithType:](self, "meterWithType:", *(_QWORD *)&a4);
  if (v5->frequencyMeteringEnabled != v4)
  {
    v6 = v5;
    if (v4)
    {
      v5->fftMeter = (opaqueVCFFTMeter *)VCFFTMeter_Create();
    }
    else
    {
      VCFFTMeter_Destroy((uint64_t *)&v5->fftMeter);
      v6->fftMeter = 0;
    }
    v6->frequencyMeteringEnabled = v4;
  }
}

- (void)prepareAudio
{
  double v3;

  VCMediaStream_Lock((uint64_t)self);
  VCAudioReceiver_Start(&self->_sourceContext.audioReceiver->var0.var0, v3);
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)cleanupAudio
{
  VCMediaStream_Lock((uint64_t)self);
  VCAudioReceiver_Stop((uint64_t)self->_sourceContext.audioReceiver);

  self->_sourceContext.delegate = 0;
  self->_sourceContext.momentsCollectorDelegate = 0;
  VCMediaStream_Unlock((uint64_t)self);
}

- (BOOL)generateReceptionReportList:(_RTCP_RECEPTION_REPORT *)a3 reportCount:(char *)a4
{
  _BOOL4 v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCAudioStream;
  v6 = -[VCMediaStream generateReceptionReportList:reportCount:](&v8, sel_generateReceptionReportList_reportCount_, a3, a4);
  if (v6)
    a3->var7 = VCAudioReceiver_CalculateBurstLoss((uint64_t)self->_sourceContext.audioReceiver);
  return v6;
}

- (void)setStreamDirection:(int64_t)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  VCMediaStream_Lock((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)VCAudioStream;
  -[VCMediaStream setStreamDirection:](&v5, sel_setStreamDirection_, a3);
  -[VCAudioIO setDirection:](self->_audioIO, "setDirection:", +[VCAudioStream audioIODirectionWithMediaStreamDirection:](VCAudioStream, "audioIODirectionWithMediaStreamDirection:", a3));
  VCMediaStream_Unlock((uint64_t)self);
}

- (BOOL)sendActiveVoiceOnly
{
  return self->_sendActiveVoiceOnly;
}

- (void)setSendActiveVoiceOnly:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  VCMediaStream_Lock((uint64_t)self);
  self->_sendActiveVoiceOnly = v3;
  -[VCAudioTransmitter setSendActiveVoiceOnly:](self->_audioTransmitter, "setSendActiveVoiceOnly:", v3);
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)setCurrentDTXEnable:(BOOL)a3
{
  VCMediaStream_Lock((uint64_t)self);
  self->_currentDTXEnable = a3;
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)setMuted:(BOOL)a3
{
  self->_isMuted = a3;
  -[VCAudioIO setMuted:](self->_audioIO, "setMuted:");
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setRemoteMuted:(BOOL)a3
{
  self->_sourceContext.isRemoteMuted = a3;
}

- (BOOL)isRemoteMuted
{
  return self->_sourceContext.isRemoteMuted;
}

- (void)setVolume:(float)a3
{
  uint64_t v5;
  NSObject *v6;
  double volume;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      volume = self->_sourceContext.volume;
      v8 = 136316162;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCAudioStream setVolume:]";
      v12 = 1024;
      v13 = 1980;
      v14 = 2048;
      v15 = volume;
      v16 = 2048;
      v17 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d Setting volume from %f to %f", (uint8_t *)&v8, 0x30u);
    }
  }
  self->_sourceContext.volume = a3;
}

- (float)volume
{
  return self->_sourceContext.volume;
}

- (void)realtimeSourceContext
{
  return &self->_sourceContext;
}

- (void)pullSamplesCallback
{
  return VCAudioStream_PullAudioSamples;
}

- (void)setVCStatistics:(tagVCStatisticsMessage *)a3
{
  AVCStatisticsCollector_SetVCStatistics((uint64_t)-[VCMediaStreamRateControlConfig statisticsCollector](-[VCMediaStreamConfig rateControlConfig](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "rateControlConfig"), "statisticsCollector"), (uint64_t)a3);
}

- (void)setTargetBitrate:(unsigned int)a3 rateChangeCounter:(unsigned int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  -[VCAudioTransmitter setTargetBitrate:](self->_audioTransmitter, "setTargetBitrate:", *(_QWORD *)&a3);
  -[VCAudioTransmitter setRateChangeCounter:](self->_audioTransmitter, "setRateChangeCounter:", v4);
}

- (unsigned)actualAudioSendingBitrate
{
  return -[VCAudioTransmitter actualAudioSendingBitrate](self->_audioTransmitter, "actualAudioSendingBitrate");
}

- (BOOL)shouldUseNWConnectionBackingSocket
{
  return 0;
}

- (id)supportedPayloads
{
  return +[VCAudioStream supportedAudioPayloads](VCAudioStream, "supportedAudioPayloads");
}

- (void)onCallIDChanged
{
  NSInteger v3;
  NSMutableArray *transportArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString integerValue](self->super._callID, "integerValue");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  transportArray = self->super._transportArray;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(transportArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setWRMCallId:", v3);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (BOOL)validateAudioStreamConfigurations:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCAudioStream validateAudioStreamConfigurations:].cold.1();
    }
    goto LABEL_20;
  }
  v4 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  if ((unint64_t)objc_msgSend(a3, "count") < 2 || objc_msgSend(v4, "direction") == 2)
  {
    if ((unint64_t)objc_msgSend(a3, "count") < 2)
    {
LABEL_9:
      LOBYTE(v9) = 1;
    }
    else
    {
      v5 = 1;
      while (1)
      {
        v6 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v5);
        v7 = objc_msgSend(v6, "audioStreamMode");
        if (v7 != objc_msgSend(v4, "audioStreamMode"))
          break;
        v8 = objc_msgSend(v6, "direction");
        if (v8 != objc_msgSend(v4, "direction"))
          break;
        v5 = (v5 + 1);
        if (objc_msgSend(a3, "count") <= v5)
          goto LABEL_9;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_20;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v9)
      {
        v18 = 136317698;
        v19 = v10;
        v20 = 2080;
        v21 = "-[VCAudioStream validateAudioStreamConfigurations:]";
        v22 = 1024;
        v23 = 2068;
        v24 = 1024;
        v25 = v5;
        v26 = 1024;
        *(_DWORD *)v27 = objc_msgSend(a3, "count");
        *(_WORD *)&v27[4] = 2048;
        *(_QWORD *)&v27[6] = objc_msgSend(v6, "audioStreamMode");
        v28 = 2048;
        v29 = objc_msgSend(v4, "audioStreamMode");
        v30 = 1024;
        v31 = objc_msgSend(v6, "jitterBufferMode");
        v32 = 1024;
        v33 = objc_msgSend(v4, "jitterBufferMode");
        v34 = 2048;
        v35 = objc_msgSend(v6, "direction");
        v36 = 2048;
        v37 = objc_msgSend(v4, "direction");
        v12 = "VCAudioStream [%s] %s:%d Failure at index i=%u of streamConfigArray.count=%u audioStreamConfig.audioStream"
              "Mode=%ld firstAudioStreamConfig.audioStreamMode=%ld audioStreamConfig.jitterBufferMode=%u firstAudioStream"
              "Config.jitterBufferMode=%u audioStreamConfig.direction=%ld firstAudioStreamConfig.direction=%ld";
        v13 = v11;
        v14 = 92;
LABEL_19:
        _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v18, v14);
        goto LABEL_20;
      }
    }
    return v9;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_20:
    LOBYTE(v9) = 0;
    return v9;
  }
  v15 = VRTraceErrorLogLevelToCSTR();
  v16 = *MEMORY[0x1E0CF2758];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v9)
  {
    v18 = 136316162;
    v19 = v15;
    v20 = 2080;
    v21 = "-[VCAudioStream validateAudioStreamConfigurations:]";
    v22 = 1024;
    v23 = 2058;
    v24 = 1024;
    v25 = objc_msgSend(a3, "count");
    v26 = 2048;
    *(_QWORD *)v27 = objc_msgSend(v4, "direction");
    v12 = "VCAudioStream [%s] %s:%d streamConfigArray.count=%u, but firstAudioStreamConfig.direction=%ld";
    v13 = v16;
    v14 = 44;
    goto LABEL_19;
  }
  return v9;
}

- (BOOL)setupSourceTransport:(id)a3
{
  _QWORD *v5;
  _QWORD *v6;
  _BOOL4 v7;

  v5 = malloc_type_calloc(1uLL, 0x10uLL, 0xA0040AFF93C70uLL);
  if (v5)
  {
    v6 = v5;
    v5[1] = objc_msgSend(a3, "realtimeContext");
    if ((VCSingleLinkedListPush((uint64_t)&self->_sourceContext.transports, v6) & 1) != 0)
    {
      LOBYTE(v7) = 1;
      return v7;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStream setupSourceTransport:].cold.2();
    }
    free(v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    -[VCAudioStream setupSourceTransport:].cold.1();
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (id)createTransportWithStreamConfig:(id)a3
{
  tagHANDLE *v5;
  uint64_t v6;
  uint64_t v7;
  VCAudioStreamTransport *v8;
  VCAudioStreamTransport *v9;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  VCAudioStream *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = -[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:](self, "createRTPHandleWithStreamConfig:payloadType:localSSRC:", a3, 0, self->super._localSSRC);
  if (v5 == (tagHANDLE *)0xFFFFFFFFLL)
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStream createTransportWithStreamConfig:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v20 = 136316162;
          v21 = v14;
          v22 = 2080;
          v23 = "-[VCAudioStream createTransportWithStreamConfig:]";
          v24 = 1024;
          v25 = 2096;
          v26 = 2112;
          v27 = v11;
          v28 = 2048;
          v29 = self;
          _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to create RTP handle", (uint8_t *)&v20, 0x30u);
        }
      }
    }
    goto LABEL_41;
  }
  v6 = (uint64_t)v5;
  if (objc_msgSend(a3, "rateControlConfig"))
  {
    v7 = objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "mediaQueue");
    if (v7 != 0xFFFFFFFFLL)
      MediaQueue_SetRTPHandle(v7, v6);
  }
  v8 = -[VCAudioStreamTransport initWithHandle:callId:localSSRC:enableNetworkMonitor:]([VCAudioStreamTransport alloc], "initWithHandle:callId:localSSRC:enableNetworkMonitor:", v6, -[NSString integerValue](self->super._callID, "integerValue"), self->super._localSSRC, self->super._operatingMode != 6);
  if (!v8)
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStream createTransportWithStreamConfig:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v20 = 136316162;
          v21 = v16;
          v22 = 2080;
          v23 = "-[VCAudioStream createTransportWithStreamConfig:]";
          v24 = 1024;
          v25 = 2105;
          v26 = 2112;
          v27 = v12;
          v28 = 2048;
          v29 = self;
          _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to create RTP extension", (uint8_t *)&v20, 0x30u);
        }
      }
    }
    RTPCloseHandle();
    goto LABEL_41;
  }
  v9 = v8;
  if (!-[VCAudioStream setupSourceTransport:](self, "setupSourceTransport:", v8))
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStream createTransportWithStreamConfig:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v20 = 136316162;
          v21 = v18;
          v22 = 2080;
          v23 = "-[VCAudioStream createTransportWithStreamConfig:]";
          v24 = 1024;
          v25 = 2108;
          v26 = 2112;
          v27 = v13;
          v28 = 2048;
          v29 = self;
          _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to setup the transport", (uint8_t *)&v20, 0x30u);
        }
      }
    }

LABEL_41:
    v9 = 0;
    return v9;
  }
  -[NSMutableArray addObject:](self->super._transportArray, "addObject:", v9);
  return v9;
}

- (void)createReportSSRCListWithStreamConfigs:(id)a3
{
  unsigned int *reportingSSRCList;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned int localSSRC;
  unsigned int *v13;
  uint64_t reportingSSRCCount;
  unsigned int v15;
  uint64_t v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  reportingSSRCList = self->_reportingSSRCList;
  if (reportingSSRCList)
  {
    free(reportingSSRCList);
    self->_reportingSSRCList = 0;
  }
  self->_reportingSSRCCount = 0;
  if (objc_msgSend(a3, "count"))
  {
    v6 = (unsigned int *)malloc_type_calloc(objc_msgSend(a3, "count"), 4uLL, 0x100004052888210uLL);
    self->_reportingSSRCList = v6;
    if (self->super._operatingMode == 6)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(a3);
            v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            if (objc_msgSend(v11, "direction") == 2)
              localSSRC = objc_msgSend(v11, "remoteSSRC");
            else
              localSSRC = self->super._localSSRC;
            v13 = self->_reportingSSRCList;
            reportingSSRCCount = self->_reportingSSRCCount;
            self->_reportingSSRCCount = reportingSSRCCount + 1;
            v13[reportingSSRCCount] = localSSRC;
          }
          v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        }
        while (v8);
      }
    }
    else
    {
      v15 = self->super._localSSRC;
      v16 = self->_reportingSSRCCount;
      self->_reportingSSRCCount = v16 + 1;
      v6[v16] = v15;
    }
  }
}

- (void)cleanupBeforeReconfigure:(id)a3
{
  tagVCAudioReceiver *audioReceiver;
  int v6;
  int v7;
  uint64_t v8;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCAudioStream *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[VCAudioStream setAudioTransmitter:](self, "setAudioTransmitter:", 0);
  audioReceiver = self->_sourceContext.audioReceiver;
  if (audioReceiver)
  {
    VCAudioReceiver_Finalize(&audioReceiver->var0.var0);
    self->_sourceContext.audioReceiver = 0;
  }
  if (-[NSMutableArray count](self->super._transportArray, "count"))
    v6 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->super._transportArray, "objectAtIndexedSubscript:", 0), "streamConfig"), "localSSRC");
  else
    v6 = 0;
  if (objc_msgSend(a3, "count"))
    v7 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "localSSRC");
  else
    v7 = 0;
  v8 = objc_msgSend(a3, "count");
  if (v8 != -[NSMutableArray count](self->super._transportArray, "count") || v7 != v6)
  {
    if (-[NSMutableArray count](self->super._transportArray, "count"))
    {
      if ((VCAudioStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioStream cleanupBeforeReconfigure:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v10 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v10 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v14 = 136316162;
            v15 = v11;
            v16 = 2080;
            v17 = "-[VCAudioStream cleanupBeforeReconfigure:]";
            v18 = 1024;
            v19 = 2154;
            v20 = 2112;
            v21 = v10;
            v22 = 2048;
            v23 = self;
            _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Reconfiguring VCAudioStream with a different number of transports.", (uint8_t *)&v14, 0x30u);
          }
        }
      }
      -[NSMutableArray removeAllObjects](self->super._transportArray, "removeAllObjects");
    }
    while (1)
    {
      v13 = VCSingleLinkedListPop((uint64_t *)&self->_sourceContext.transports);
      if (!v13)
        break;
      free(v13);
    }
    -[VCAudioStream createReportSSRCListWithStreamConfigs:](self, "createReportSSRCListWithStreamConfigs:", a3);
  }
}

- (id)streamIDsFromTransport
{
  void *v3;
  NSMutableArray *transportArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->super._operatingMode != 6)
    return 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->super._transportArray, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  transportArray = self->super._transportArray;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(transportArray);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfig"), "multiwayConfig"), "isOneToOne") & 1) == 0)
        {
          objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfig"), "multiwayConfig"), "idsStreamID")));
          v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfig"), "multiwayConfig"), "v2StreamID");
          if ((_DWORD)v10)
            objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v10));
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v6);
  }
  return v3;
}

+ (BOOL)shouldUseRandomRTPTimestampForMode:(int)a3
{
  return a3 != 11 && a3 != 6 || VCDefaults_GetBoolValueForKey(CFSTR("simulateWebRTCOnlyClient"), 0);
}

- (void)setPreferredMediaBitrateWithConfiguration:(id)a3
{
  unsigned int v5;

  self->_preferredMediaBitrate = 0;
  if (objc_msgSend(a3, "audioStreamMode") == 5)
  {
    v5 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "preferredMediaBitrate");
LABEL_10:
    self->_preferredMediaBitrate = v5;
    goto LABEL_11;
  }
  if (objc_msgSend(a3, "audioStreamMode") == 8)
  {
    self->_preferredMediaBitrate = 80000;
    if (objc_msgSend(a3, "audioStreamMode") == 8 && objc_msgSend(a3, "channelCount") == 4)
    {
      v5 = 900000;
      goto LABEL_10;
    }
  }
  else if (objc_msgSend(a3, "audioStreamMode") == 9 || objc_msgSend(a3, "audioStreamMode") == 11)
  {
    v5 = objc_msgSend(a3, "preferredMediaBitRate");
    goto LABEL_10;
  }
LABEL_11:
  self->_preferredMediaBitrate = VCDefaults_GetIntValueForKey(CFSTR("audioStreamPreferredMediaBitrate"), self->_preferredMediaBitrate);
}

- (int)getRTPTimeStampRateScaleFactor
{
  int v2;
  int result;

  v2 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload");
  result = 5;
  if (v2 <= 106)
  {
    if (v2 != 97)
    {
      if (v2 == 98)
        return result;
      return 0;
    }
    return 4;
  }
  else
  {
    if (v2 == 107)
      return result;
    if (v2 != 111)
    {
      if (v2 == 108)
        return 7;
      return 0;
    }
    return 6;
  }
}

- (BOOL)networkUplinkClockUsesBaseband:(int64_t)a3
{
  BOOL result;

  result = +[VCHardwareSettings supportsOptimizedHandoversForTelephony](VCHardwareSettings, "supportsOptimizedHandoversForTelephony");
  if (a3 != 7)
    return 0;
  return result;
}

- (int)preferredAudioCodecWithStreamConfig:(id)a3
{
  if (self->super._operatingMode == 6 && (objc_msgSend(a3, "isLowLatency") & 1) != 0)
    return 101;
  else
    return 98;
}

- (BOOL)onConfigureStreamWithConfiguration:(id)a3 error:(id *)a4
{
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  AVCStatisticsCollector *v18;
  AVCStatisticsCollector *statsCollector;
  _BOOL4 v20;
  DTMFEventHandler *dtmfEventHandler;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  uint32_t v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  int operatingMode;
  int *v39;
  _BOOL4 v40;
  BOOL v41;
  _BOOL4 v42;
  uint64_t v43;
  signed int v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int *v48;
  int v49;
  const __CFString *v50;
  uint64_t v51;
  char v52;
  NSObject *v53;
  const __CFString *v54;
  uint64_t v55;
  char IsOSFaultDisabled;
  NSObject *v57;
  const char *v58;
  const __CFString *v59;
  const char *v60;
  id *v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  char v65;
  NSObject *v66;
  const char *v67;
  NSObject *v68;
  const char *v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  VCAudioHALPluginRemoteDeviceInfo *remoteDeviceInfo;
  const char *v74;
  NSObject *v75;
  uint32_t v76;
  uint64_t v77;
  NSObject *v78;
  VCAudioHALPluginRemoteDeviceInfo *v79;
  __int128 v80;
  int deviceRole;
  uint64_t v82;
  int64_t streamToken;
  VCAudioIO *audioIO;
  uint64_t v85;
  NSObject *v86;
  VCAudioIO *v87;
  int v88;
  int v89;
  const char *v90;
  VCAudioIO *v91;
  uint64_t v92;
  VCAudioIO *v93;
  int v94;
  int v95;
  BOOL v96;
  unsigned int **v97;
  VCTelephonyInterface *v98;
  const __CFString *v99;
  uint64_t v100;
  NSObject *v101;
  const char *v102;
  NSObject *v103;
  uint32_t v104;
  uint64_t v105;
  NSObject *v106;
  tagVCAudioFrameFormat *p_vpioFormat;
  id obj;
  id *v110;
  NSMutableArray *transportArray;
  void *v112;
  uint8_t v113[128];
  UInt32 v114[4];
  _BYTE buf[48];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 p_sourceContext;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  if (!-[VCAudioStream validateAudioStreamConfigurations:](self, "validateAudioStreamConfigurations:"))
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioStream.m", 2244), CFSTR("Invalid Parameter"), CFSTR("Called with an invalid parameter"));
    if ((VCAudioStream *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 2)
        goto LABEL_154;
      v55 = VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v57 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (v20)
        {
          if (*a4)
            v58 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          else
            v58 = "<nil>";
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = v55;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 2247;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v9;
          *(_WORD *)&buf[38] = 2048;
          *(_QWORD *)&buf[40] = self;
          LOWORD(v116) = 2080;
          *(_QWORD *)((char *)&v116 + 2) = v58;
          v67 = "VCAudioStream [%s] %s:%d %@(%p) error[%s]";
          v68 = v57;
LABEL_166:
          _os_log_error_impl(&dword_1D8A54000, v68, OS_LOG_TYPE_ERROR, v67, buf, 0x3Au);
          goto LABEL_154;
        }
      }
      else
      {
        v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
        if (v20)
        {
          if (*a4)
            v60 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          else
            v60 = "<nil>";
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = v55;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 2247;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v9;
          *(_WORD *)&buf[38] = 2048;
          *(_QWORD *)&buf[40] = self;
          LOWORD(v116) = 2080;
          *(_QWORD *)((char *)&v116 + 2) = v60;
          v69 = "VCAudioStream [%s] %s:%d %@(%p) error[%s]";
          v70 = v57;
          goto LABEL_169;
        }
      }
      return v20;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      v51 = VRTraceErrorLogLevelToCSTR();
      v52 = VRTraceIsOSFaultDisabled();
      v53 = *MEMORY[0x1E0CF2758];
      if ((v52 & 1) != 0)
      {
        v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v20)
          return v20;
        -[VCAudioStream onConfigureStreamWithConfiguration:error:].cold.5(v51, a4, v53);
      }
      else
      {
        v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
        if (!v20)
          return v20;
        -[VCAudioStream onConfigureStreamWithConfiguration:error:].cold.6(v51, a4, v53);
      }
    }
    goto LABEL_154;
  }
  v7 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  -[VCAudioStream cleanupBeforeReconfigure:](self, "cleanupBeforeReconfigure:", a3);
  -[VCAudioStream setDeviceRoleForAudioStreamMode:direction:](self, "setDeviceRoleForAudioStreamMode:direction:", objc_msgSend(v7, "audioStreamMode"), objc_msgSend(v7, "direction"));
  self->_isTelephony = +[VCAudioStream isTelephony:](VCAudioStream, "isTelephony:", objc_msgSend(v7, "audioStreamMode"));
  -[VCMediaStream setOperatingMode:](self, "setOperatingMode:", +[VCAudioStream operatingModeForAudioStreamMode:](VCAudioStream, "operatingModeForAudioStreamMode:", objc_msgSend(v7, "audioStreamMode")));
  v112 = v7;
  v8 = +[VCAudioStream isVoLTE:](VCAudioStream, "isVoLTE:", objc_msgSend(v7, "audioStreamMode"));
  if (v8)
    LOBYTE(v8) = +[VCHardwareSettings isVoiceProcessingAt24KSupported](VCHardwareSettings, "isVoiceProcessingAt24KSupported");
  self->_isVoiceProcessingAt24KSupported = v8;
  self->_isRamStadSRCEnabled = VCDefaults_GetBoolValueForKey(CFSTR("enableRamStadSRC"), 1);
  if (self->super._operatingMode == 6)
  {
    if ((self->_reportingModuleID + 1) <= 1)
    {
      -[VCObject reportingAgent](self, "reportingAgent");
      self->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
      -[VCObject reportingAgent](self, "reportingAgent");
      -[VCAudioStream getReportingServiceID](self, "getReportingServiceID");
      -[VCAudioStream getClientSpecificUserInfo:](self, "getClientSpecificUserInfo:", a3);
      reportingCacheModuleSpecificInfo();
    }
  }
  else if (!-[VCObject reportingAgent](self, "reportingAgent"))
  {
    -[VCAudioStream setupReportingAgent:](self, "setupReportingAgent:", a3);
  }
  v110 = a4;
  -[VCAudioStream setPreferredMediaBitrateWithConfiguration:](self, "setPreferredMediaBitrateWithConfiguration:", v7);
  self->preferredAudioCodec = -[VCAudioStream preferredAudioCodecWithStreamConfig:](self, "preferredAudioCodecWithStreamConfig:", v7);
  -[VCAudioStream _computeInternalFormatForStreamConfigurations:](self, "_computeInternalFormatForStreamConfigurations:", a3);
  p_vpioFormat = &self->_vpioFormat;
  self->super._transportSetupInfo.sourceRate = self->_vpioFormat.format.mSampleRate;
  self->super._useRandomTS = +[VCAudioStream shouldUseRandomRTPTimestampForMode:](VCAudioStream, "shouldUseRandomRTPTimestampForMode:", self->super._operatingMode);
  if (-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"))
  {
    self->_sourceContext.wrmInfo = -[VCNetworkFeedbackController wrmInfo](-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"), "wrmInfo");
    self->_sourceContext.defaultRtpHandle = -[VCMediaStreamTransport rtpHandle](-[VCMediaStream defaultTransport](self, "defaultTransport"), "rtpHandle");
  }
  v10 = -[NSMutableArray count](self->super._transportArray, "count");
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  obj = a3;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v133, v132, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v134;
LABEL_16:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v134 != v13)
        objc_enumerationMutation(a3);
      v15 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v14);
      if (v10)
        v16 = (id)-[NSMutableArray objectAtIndexedSubscript:](self->super._transportArray, "objectAtIndexedSubscript:", 0);
      else
        v16 = -[VCAudioStream createTransportWithStreamConfig:](self, "createTransportWithStreamConfig:", *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * v14));
      v17 = v16;
      if (!v16)
      {
        if ((VCAudioStream *)objc_opt_class() == self)
        {
          v61 = v110;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioStream onConfigureStreamWithConfiguration:error:].cold.2();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v54 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v54 = &stru_1E9E58EE0;
          v61 = v110;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v62 = VRTraceErrorLogLevelToCSTR();
            v63 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = v62;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 2294;
              *(_WORD *)&buf[28] = 2112;
              *(_QWORD *)&buf[30] = v54;
              *(_WORD *)&buf[38] = 2048;
              *(_QWORD *)&buf[40] = self;
              _os_log_error_impl(&dword_1D8A54000, v63, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Failed to create transport", buf, 0x30u);
            }
          }
        }
        +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v61, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioStream.m", 2298), CFSTR("Failed to create transport"), CFSTR("Create transport failed"));
        goto LABEL_154;
      }
      v18 = (AVCStatisticsCollector *)objc_msgSend((id)objc_msgSend(v15, "rateControlConfig"), "statisticsCollector");
      if ((objc_msgSend(v17, "configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:", v15, &self->super._transportSetupInfo, self->super._operatingMode == 6, self->super._operatingMode == 6, v18, objc_msgSend((id)objc_msgSend(v15, "rateControlConfig"), "basebandCongestionDetector"), v110) & 1) == 0)break;
      statsCollector = self->_statsCollector;
      self->_statsCollector = v18;
      if (v18)
        CFRetain(v18);
      if (statsCollector)
        CFRelease(statsCollector);
      VCAudioReceiver_FlushQueues((uint64_t)self->_sourceContext.audioReceiver);
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v133, v132, 16);
        if (!v12)
          goto LABEL_30;
        goto LABEL_16;
      }
    }
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 2)
        goto LABEL_154;
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v20)
          return v20;
        -[VCAudioStream onConfigureStreamWithConfiguration:error:].cold.3();
      }
      else
      {
        v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
        if (!v20)
          return v20;
        -[VCAudioStream onConfigureStreamWithConfiguration:error:].cold.4();
      }
      goto LABEL_154;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v59 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v59 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 2)
      goto LABEL_154;
    v64 = VRTraceErrorLogLevelToCSTR();
    v65 = VRTraceIsOSFaultDisabled();
    v66 = *MEMORY[0x1E0CF2758];
    if ((v65 & 1) != 0)
    {
      v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v20)
        return v20;
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v64;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 2313;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v59;
      *(_WORD *)&buf[38] = 2048;
      *(_QWORD *)&buf[40] = self;
      LOWORD(v116) = 2048;
      *(_QWORD *)((char *)&v116 + 2) = v15;
      v67 = "VCAudioStream [%s] %s:%d %@(%p) Failed to configure transport for streamConfig=%p";
      v68 = v66;
      goto LABEL_166;
    }
    v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
    if (!v20)
      return v20;
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = v64;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 2313;
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v59;
    *(_WORD *)&buf[38] = 2048;
    *(_QWORD *)&buf[40] = self;
    LOWORD(v116) = 2048;
    *(_QWORD *)((char *)&v116 + 2) = v15;
    v69 = "VCAudioStream [%s] %s:%d %@(%p) Failed to configure transport for streamConfig=%p";
    v70 = v66;
LABEL_169:
    _os_log_fault_impl(&dword_1D8A54000, v70, OS_LOG_TYPE_FAULT, v69, buf, 0x3Au);
    goto LABEL_154;
  }
LABEL_30:
  v20 = -[VCAudioStream setupPayloads](self, "setupPayloads");
  if (!v20)
    return v20;
  -[VCAudioStream setDTXPayload:](self, "setDTXPayload:", v112);
  dtmfEventHandler = self->dtmfEventHandler;
  if (dtmfEventHandler)
    -[DTMFEventHandler setDTMFRTPEventDurationForPayload:](dtmfEventHandler, "setDTMFRTPEventDurationForPayload:", -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload"));
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  transportArray = self->super._transportArray;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v128, v127, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v129;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v129 != v24)
          objc_enumerationMutation(transportArray);
        v26 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * i);
        if (self->_isTelephony)
        {
          v27 = objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * i), "realtimeContext");
          *(_DWORD *)(v27 + 220) = +[VCAudioStream isVoLTE:](VCAudioStream, "isVoLTE:", objc_msgSend(v112, "audioStreamMode"));
          if ((VCAudioStream *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 7)
              goto LABEL_49;
            v35 = VRTraceErrorLogLevelToCSTR();
            v36 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              goto LABEL_49;
            v37 = *(_DWORD *)(v27 + 220);
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v35;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 2334;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v37;
            v32 = v36;
            v33 = "VCAudioStream [%s] %s:%d Telephony calling isLocalCellular=%d";
            v34 = 34;
            goto LABEL_48;
          }
          v28 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v28 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v29 = VRTraceErrorLogLevelToCSTR();
            v30 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v31 = *(_DWORD *)(v27 + 220);
              *(_DWORD *)buf = 136316418;
              *(_QWORD *)&buf[4] = v29;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 2334;
              *(_WORD *)&buf[28] = 2112;
              *(_QWORD *)&buf[30] = v28;
              *(_WORD *)&buf[38] = 2048;
              *(_QWORD *)&buf[40] = self;
              LOWORD(v116) = 1024;
              *(_DWORD *)((char *)&v116 + 2) = v31;
              v32 = v30;
              v33 = "VCAudioStream [%s] %s:%d %@(%p) Telephony calling isLocalCellular=%d";
              v34 = 54;
LABEL_48:
              _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, v34);
            }
          }
        }
LABEL_49:
        operatingMode = self->super._operatingMode;
        if (operatingMode == 3)
        {
          v39 = &OBJC_IVAR___AVCRTCPReceiverReport__reportedSourceSSRC;
          v40 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload") == 108;
          operatingMode = self->super._operatingMode;
          if (operatingMode == 3)
          {
            v41 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload") == 111;
            operatingMode = self->super._operatingMode;
          }
          else
          {
            v41 = 0;
          }
        }
        else
        {
          v40 = 0;
          v41 = 0;
          v39 = &OBJC_IVAR___AVCRTCPReceiverReport__reportedSourceSSRC;
        }
        v42 = operatingMode == 6
           && objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v39[505]), "config"), "inputSampleRate") == 48000&& objc_msgSend((id)objc_msgSend(v26, "streamConfig"), "rtpTimestampRate") == 24000;
        if (self->_isVoiceProcessingAt24KSupported)
        {
          v43 = objc_msgSend(v26, "rtpHandle");
          v44 = -[VCAudioStream getRTPTimeStampRateScaleFactor](self, "getRTPTimeStampRateScaleFactor");
          v45 = v43;
        }
        else if (v40 || v42)
        {
          v45 = objc_msgSend(v26, "rtpHandle");
          v44 = 1;
        }
        else if (v41
               || (v46 = v39[505], self->super._operatingMode != 5)
               && objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v46), "config"), "payload") == 119&& objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v46), "config"), "inputSampleRate") == 24000&& objc_msgSend((id)objc_msgSend(v26, "streamConfig"), "rtpTimestampRate") == 48000)
        {
          v45 = objc_msgSend(v26, "rtpHandle");
          v44 = 2;
        }
        else
        {
          v47 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v46), "config"), "inputSampleRate");
          v45 = objc_msgSend(v26, "rtpHandle");
          if (v47 == 32000)
            v44 = 3;
          else
            v44 = 0;
        }
        RTPSetTimestampRateScale(v45, v44);
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v128, v127, 16);
    }
    while (v23);
  }
  v48 = &OBJC_IVAR___AVCRTCPReceiverReport__reportedSourceSSRC;
  if (!self->_useExternalIO)
  {
    -[VCAudioStream setupCaptionsCoordinatorsWithFormat:direction:](self, "setupCaptionsCoordinatorsWithFormat:direction:", p_vpioFormat, objc_msgSend(v112, "direction"));

    self->_remoteDeviceInfo = objc_alloc_init(VCAudioHALPluginRemoteDeviceInfo);
    -[VCAudioHALPluginRemoteDeviceInfo setDeviceName:](self->_remoteDeviceInfo, "setDeviceName:", objc_msgSend((id)objc_msgSend(v112, "remoteDeviceInfo"), "deviceName"));
    -[VCAudioHALPluginRemoteDeviceInfo setDeviceUID:](self->_remoteDeviceInfo, "setDeviceUID:", objc_msgSend((id)objc_msgSend(v112, "remoteDeviceInfo"), "deviceUID"));
    -[VCAudioHALPluginRemoteDeviceInfo setModelUID:](self->_remoteDeviceInfo, "setModelUID:", objc_msgSend((id)objc_msgSend(v112, "remoteDeviceInfo"), "modelUID"));
    v49 = +[VCAudioStream audioIODirectionWithMediaStreamDirection:](VCAudioStream, "audioIODirectionWithMediaStreamDirection:", objc_msgSend(v112, "direction"));
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_127;
      v71 = VRTraceErrorLogLevelToCSTR();
      v72 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_127;
      remoteDeviceInfo = self->_remoteDeviceInfo;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v71;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 2362;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = remoteDeviceInfo;
      v74 = "VCAudioStream [%s] %s:%d configuring remoteDeviceInfo=%p";
      v75 = v72;
      v76 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v50 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v50 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_127;
      v77 = VRTraceErrorLogLevelToCSTR();
      v78 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_127;
      v79 = self->_remoteDeviceInfo;
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v77;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 2362;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v50;
      *(_WORD *)&buf[38] = 2048;
      *(_QWORD *)&buf[40] = self;
      LOWORD(v116) = 2048;
      *(_QWORD *)((char *)&v116 + 2) = v79;
      v74 = "VCAudioStream [%s] %s:%d %@(%p) configuring remoteDeviceInfo=%p";
      v75 = v78;
      v76 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v75, OS_LOG_TYPE_DEFAULT, v74, buf, v76);
LABEL_127:
    *(_QWORD *)&v80 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v80 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v125 = v80;
    v126 = v80;
    v123 = v80;
    v124 = v80;
    v121 = v80;
    v122 = v80;
    v119 = v80;
    p_sourceContext = v80;
    v117 = v80;
    v118 = v80;
    *(_OWORD *)&buf[32] = v80;
    v116 = v80;
    *(_OWORD *)buf = v80;
    *(_OWORD *)&buf[16] = v80;
    *(_DWORD *)buf = VCUniqueIDGenerator_GenerateID();
    *(_DWORD *)&buf[4] = 0;
    deviceRole = self->deviceRole;
    *(_DWORD *)&buf[8] = self->super._operatingMode;
    *(_DWORD *)&buf[12] = deviceRole;
    *(_DWORD *)&buf[16] = +[VCAudioStream audioIOTypeForMode:](VCAudioStream, "audioIOTypeForMode:", objc_msgSend(v112, "audioStreamMode"));
    buf[20] = v49;
    buf[21] = 0;
    *(_QWORD *)&buf[24] = self;
    *(_DWORD *)&buf[32] = self->_clientPid;
    *(_QWORD *)&buf[36] = 0;
    buf[44] = 0;
    *(_QWORD *)&v116 = self->super._streamToken;
    DWORD2(v116) = +[VCAudioStream audioChannelCountForMode:](VCAudioStream, "audioChannelCountForMode:", objc_msgSend(obj, "firstObject"));
    v82 = objc_msgSend(v112, "streamInputID");
    streamToken = self->super._streamToken;
    *(_QWORD *)&v117 = v82;
    *((_QWORD *)&v117 + 1) = streamToken;
    *(_QWORD *)&v118 = objc_msgSend(v112, "networkClockID");
    WORD4(v118) = 256;
    *(_QWORD *)&v119 = 0;
    *((_QWORD *)&v119 + 1) = VCAudioStream_PullAudioSamples;
    *(_QWORD *)&v121 = 0;
    p_sourceContext = (unint64_t)&self->_sourceContext;
    BYTE8(v121) = 0;
    *(_QWORD *)&v122 = 0;
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    *((_QWORD *)&v122 + 1) = self;
    *(_QWORD *)&v126 = self->_remoteDeviceInfo;
    BYTE8(v126) = -[VCAudioStream networkUplinkClockUsesBaseband:](self, "networkUplinkClockUsesBaseband:", objc_msgSend(v112, "audioStreamMode"));
    BYTE9(v126) = objc_msgSend(v112, "audioStreamMode") == 11;
    audioIO = self->_audioIO;
    if (audioIO)
    {
      if (!-[VCAudioIO reconfigureWithConfig:](audioIO, "reconfigureWithConfig:", buf))
      {
        -[VCAudioStream setAudioIO:](self, "setAudioIO:", 0);
        goto LABEL_154;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_137;
      v85 = VRTraceErrorLogLevelToCSTR();
      v86 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_137;
      v87 = self->_audioIO;
      v88 = self->super._operatingMode;
      v89 = self->deviceRole;
      *(_DWORD *)v113 = 136316930;
      *(_QWORD *)&v113[4] = v85;
      *(_WORD *)&v113[12] = 2080;
      *(_QWORD *)&v113[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&v113[22] = 1024;
      *(_DWORD *)&v113[24] = 2406;
      *(_WORD *)&v113[28] = 2048;
      *(_QWORD *)&v113[30] = self;
      *(_WORD *)&v113[38] = 2048;
      *(_QWORD *)&v113[40] = v87;
      *(_WORD *)&v113[48] = 1024;
      *(_DWORD *)&v113[50] = v88;
      *(_WORD *)&v113[54] = 1024;
      *(_DWORD *)&v113[56] = v89;
      *(_WORD *)&v113[60] = 1024;
      *(_DWORD *)&v113[62] = v49;
      v90 = "VCAudioStream [%s] %s:%d (%p) reconfigured audioIO=%p operatingMode:%d deviceRole:%d direction:%d";
      goto LABEL_136;
    }
    v91 = -[VCAudioIO initWithConfiguration:]([VCAudioIO alloc], "initWithConfiguration:", buf);
    self->_audioIO = v91;
    if (v91)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_137;
      v92 = VRTraceErrorLogLevelToCSTR();
      v86 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_137;
      v93 = self->_audioIO;
      v94 = self->super._operatingMode;
      v95 = self->deviceRole;
      *(_DWORD *)v113 = 136316930;
      *(_QWORD *)&v113[4] = v92;
      *(_WORD *)&v113[12] = 2080;
      *(_QWORD *)&v113[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&v113[22] = 1024;
      *(_DWORD *)&v113[24] = 2400;
      *(_WORD *)&v113[28] = 2048;
      *(_QWORD *)&v113[30] = self;
      *(_WORD *)&v113[38] = 2048;
      *(_QWORD *)&v113[40] = v93;
      *(_WORD *)&v113[48] = 1024;
      *(_DWORD *)&v113[50] = v94;
      *(_WORD *)&v113[54] = 1024;
      *(_DWORD *)&v113[56] = v95;
      *(_WORD *)&v113[60] = 1024;
      *(_DWORD *)&v113[62] = v49;
      v90 = "VCAudioStream [%s] %s:%d (%p) created audioIO=%p operatingMode:%d deviceRole:%d direction:%d";
LABEL_136:
      _os_log_impl(&dword_1D8A54000, v86, OS_LOG_TYPE_DEFAULT, v90, v113, 0x42u);
LABEL_137:
      v114[0] = 0;
      memset(v113, 0, sizeof(v113));
      AUIOGetAUNumber(v114);
      -[VCAudioIO setMuted:](self->_audioIO, "setMuted:", self->_isMuted);
      -[VCAudioIO setClientFormat:](self->_audioIO, "setClientFormat:", p_vpioFormat);
      -[VCAudioIO setRemoteCodecType:sampleRate:](self->_audioIO, "setRemoteCodecType:sampleRate:", +[VCPayloadUtils audioCodecTypeForPayload:](VCPayloadUtils, "audioCodecTypeForPayload:", -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload")), (double)-[VCAudioPayloadConfig codecSampleRate](-[VCAudioPayload config](self->currentAudioPayload, "config"), "codecSampleRate"));
      -[VCAudioIO setFarEndVersionInfo:](self->_audioIO, "setFarEndVersionInfo:", v113);
      v48 = &OBJC_IVAR___AVCRTCPReceiverReport__reportedSourceSSRC;
      goto LABEL_138;
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v110, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioStream.m", 2394), CFSTR("Failed to create VCAudioIO"), CFSTR("Invalid config caused VCAudioIO init to fail"));
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_154;
      v100 = VRTraceErrorLogLevelToCSTR();
      v101 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_154;
      *(_DWORD *)v113 = 136315650;
      *(_QWORD *)&v113[4] = v100;
      *(_WORD *)&v113[12] = 2080;
      *(_QWORD *)&v113[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&v113[22] = 1024;
      *(_DWORD *)&v113[24] = 2397;
      v102 = "VCAudioStream [%s] %s:%d VCAudioIO initWithConfiguration failed";
      v103 = v101;
      v104 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v99 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v99 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_154;
      v105 = VRTraceErrorLogLevelToCSTR();
      v106 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_154;
      *(_DWORD *)v113 = 136316162;
      *(_QWORD *)&v113[4] = v105;
      *(_WORD *)&v113[12] = 2080;
      *(_QWORD *)&v113[14] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
      *(_WORD *)&v113[22] = 1024;
      *(_DWORD *)&v113[24] = 2397;
      *(_WORD *)&v113[28] = 2112;
      *(_QWORD *)&v113[30] = v99;
      *(_WORD *)&v113[38] = 2048;
      *(_QWORD *)&v113[40] = self;
      v102 = "VCAudioStream [%s] %s:%d %@(%p) VCAudioIO initWithConfiguration failed";
      v103 = v106;
      v104 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v103, OS_LOG_TYPE_DEFAULT, v102, v113, v104);
LABEL_154:
    LOBYTE(v20) = 0;
    return v20;
  }
LABEL_138:
  v96 = -[VCMediaStreamConfig direction](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "direction") == 1;
  v97 = (unsigned int **)((char *)self + v48[498]);
  *((_BYTE *)v97 + 41) = v96;
  *((_BYTE *)v97 + 40) = self->super._operatingMode != 6;
  -[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:](self, "registerMediaControlInfoGeneratorWithConfigs:", obj);
  if (!-[VCAudioStream createAudioReceiver](self, "createAudioReceiver"))
  {
    -[VCAudioStream setAudioIO:](self, "setAudioIO:", 0);
LABEL_153:
    -[VCMediaStream unregisterMediaControlInfoGenerator](self, "unregisterMediaControlInfoGenerator");
    goto LABEL_154;
  }
  if ((self->super._operatingMode != 6 || -[VCMediaStream isSendingMedia](self, "isSendingMedia"))
    && !-[VCAudioStream createAudioTransmitter:streamIDs:](self, "createAudioTransmitter:streamIDs:", objc_msgSend(v112, "audioStreamMode"), -[VCAudioStream streamIDsFromTransport](self, "streamIDsFromTransport")))
  {
    -[VCAudioStream setAudioIO:](self, "setAudioIO:", 0);
    VCAudioReceiver_Finalize(v97[3]);
    v97[3] = 0;
    goto LABEL_153;
  }
  if (self->_constantTransportOverhead && self->super._operatingMode == 6)
    -[VCMediaStream updateTransportsWithConstantConnectionOverhead:](self, "updateTransportsWithConstantConnectionOverhead:");
  if (!self->_isTelephony)
    goto LABEL_148;
  v98 = -[VCTelephonyInterface initWithTelephonySubscriptionSlot:]([VCTelephonyInterface alloc], "initWithTelephonySubscriptionSlot:", objc_msgSend(v112, "subscriptionSlot"));
  self->_telephonyInterface = v98;
  if (v98)
  {
    -[VCTelephonyInterface setDelegate:](v98, "setDelegate:", self);
LABEL_148:
    if (+[VCAudioStream isVoLTE:](VCAudioStream, "isVoLTE:", -[VCMediaStreamConfig audioStreamMode](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "audioStreamMode")))
    {
      -[VCAudioStream configureCellularFeatures](self, "configureCellularFeatures");
    }
    -[VCTransportSession setShouldIgnoreConnectionRefusedError:](self->super._transportSession, "setShouldIgnoreConnectionRefusedError:", self->_isTelephony);
    LOBYTE(v20) = 1;
    return v20;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioStream onConfigureStreamWithConfiguration:error:].cold.1();
  }
  -[VCAudioStream setAudioIO:](self, "setAudioIO:", 0);
  VCAudioReceiver_Finalize(v97[3]);
  v97[3] = 0;
  -[VCMediaStream unregisterMediaControlInfoGenerator](self, "unregisterMediaControlInfoGenerator");

  LOBYTE(v20) = 0;
  self->_audioTransmitter = 0;
  return v20;
}

- (void)updateRateAdaptationWithNetworkNotification:(tagVCNWConnectionNotification *)a3
{
  -[VCMediaStreamRateAdaptation updateRateControlWithNetworkNotification:](self->super._rateAdaptation, "updateRateControlWithNetworkNotification:", a3);
}

- (BOOL)shouldResetRTPTimestampOnStart
{
  return self->super._operatingMode == 11;
}

- (BOOL)shouldReportNetworkInterfaceType
{
  return self->super._operatingMode == 11;
}

- (BOOL)shouldRegisterReportingPeriodicTask
{
  return (self->super._operatingMode < 0xDu) & (0x1808u >> self->super._operatingMode);
}

- (void)onStartWithCompletionHandler:(id)a3
{
  int operatingMode;
  VCAudioPayloadConfig *v6;
  tagVCAudioReceiver *audioReceiver;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  -[VCAudioStream prepareAudio](self, "prepareAudio");
  if (-[VCAudioStream shouldResetRTPTimestampOnStart](self, "shouldResetRTPTimestampOnStart"))
  {
    self->lastSentAudioSampleTime = 0;
    self->lastInputAudioTimeStamp = 0;
    self->dAudioHostTime = 0.0;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__VCAudioStream_onStartWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E9E53C70;
  v8[4] = self;
  v8[5] = a3;
  -[VCAudioStream startAudioWithCompletionHandler:](self, "startAudioWithCompletionHandler:", v8);
  if (-[VCAudioStream shouldRegisterReportingPeriodicTask](self, "shouldRegisterReportingPeriodicTask"))
    -[VCAudioStream setupPeriodicReporting](self, "setupPeriodicReporting");
  operatingMode = self->super._operatingMode;
  if ((operatingMode - 1) < 2)
    goto LABEL_8;
  if (operatingMode != 6)
  {
    -[VCMediaStream registerAggregationHandlers](self, "registerAggregationHandlers");
LABEL_8:
    -[VCObject reportingAgent](self, "reportingAgent");
    reportingStartTimer();
  }
  -[VCAudioStream reportingAudioStreamEvent:](self, "reportingAudioStreamEvent:", 182);
  self->_sourceContext.delegate = -[VCMediaStream delegate](self, "delegate");
  self->_sourceContext.delegateFunctions.updateFrequencyLevel = (void *)-[VCMediaStream delegateFunctions](self, "delegateFunctions");
  self->_sourceContext.momentsCollectorDelegate = -[VCMediaStream momentsCollectorDelegate](self, "momentsCollectorDelegate");
  v6 = -[VCAudioTransmitter currentAudioPayloadConfig](-[VCAudioStream audioTransmitter](self, "audioTransmitter"), "currentAudioPayloadConfig");
  audioReceiver = self->_sourceContext.audioReceiver;
  -[VCAudioPayloadConfig payload](v6, "payload");
  -[VCAudioTransmitter audioTxBitrate](-[VCAudioStream audioTransmitter](self, "audioTransmitter"), "audioTxBitrate");
  -[VCAudioPayloadConfig codecSampleRate](v6, "codecSampleRate");
  VCAudioReceiver_SendStartCallReport((uint64_t)audioReceiver);
  -[VCMediaStream registerStatistics:](self, "registerStatistics:", self->_statsCollector);
}

uint64_t __46__VCAudioStream_onStartWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _DWORD v14[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "reportingAgent");
    reportingSymptom();
    objc_msgSend(*(id *)(a1 + 32), "cleanupAudio");
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isVoLTERateAdaptationEnabled"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "start");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 1704))
  {
    v4 = VCPayloadUtils_AudioCodecRateModeForBitrate(objc_msgSend((id)objc_msgSend(*(id *)(v3 + 1160), "currentAudioPayloadConfig"), "payload"), objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "currentAudioPayloadConfig"), "bitrate"));
    v5 = VCPayloadUtils_DefaultAudioCodecBandwidthCodecForSampleRate(objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "currentAudioPayloadConfig"), "codecSampleRate"));
    v6 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "currentAudioPayloadConfig"), "payload");
    v7 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "currentAudioPayloadConfig"), "bitrate");
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 1176);
    v14[0] = v6;
    v14[1] = v4;
    v14[2] = v5;
    v14[3] = v7;
    v15 = 0;
    objc_msgSend(v8, "notifyCodecModeChangeEventToCT:", v14);
    v9 = *(_QWORD *)(a1 + 32) + 1548;
    *(_DWORD *)v9 = v6;
    *(_DWORD *)(v9 + 4) = v4;
    *(_DWORD *)(v9 + 8) = v5;
    *(_DWORD *)(v9 + 12) = v7;
    *(_QWORD *)(v9 + 16) = 0;
    v10 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v10 + 1544))
    {
      v11 = *(void **)(v10 + 1176);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __46__VCAudioStream_onStartWithCompletionHandler___block_invoke_2;
      v13[3] = &unk_1E9E53C48;
      v13[4] = v10;
      objc_msgSend(v11, "getAnbrActivationStateWithCompletionHandler:", v13);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __46__VCAudioStream_onStartWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315906;
        v7 = v4;
        v8 = 2080;
        v9 = "-[VCAudioStream onStartWithCompletionHandler:]_block_invoke_2";
        v10 = 1024;
        v11 = 2580;
        v12 = 2112;
        v13 = a3;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d VCTelephonyInterface returned error=%@", (uint8_t *)&v6, 0x26u);
      }
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1545) = a2;
  }
}

- (void)onStopWithCompletionHandler:(id)a3
{
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  VCAudioTransmitter_ReportAWDMetrics((uint64_t)-[VCAudioStream audioTransmitter](self, "audioTransmitter"));
  VCAudioReceiver_ReportAWDMetrics(&self->_sourceContext.audioReceiver->var0.var0);
  VCAudioReceiver_SendEndCallReport((uint64_t)self->_sourceContext.audioReceiver);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__VCAudioStream_onStopWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E9E53C70;
  v5[4] = self;
  v5[5] = a3;
  -[VCAudioStream stopAudioWithCompletionHandler:](self, "stopAudioWithCompletionHandler:", v5);
}

uint64_t __45__VCAudioStream_onStopWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cleanupAudio");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 712), "stop");
  if (objc_msgSend(*(id *)(a1 + 32), "shouldRegisterReportingPeriodicTask"))
  {
    objc_msgSend(*(id *)(a1 + 32), "reportingAgent");
    reportingUnregisterPeriodicTask();
  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldStopReportingTimer"))
  {
    objc_msgSend(*(id *)(a1 + 32), "reportingAgent");
    reportingStopTimer();
  }
  objc_msgSend(*(id *)(a1 + 32), "reportingAlgosAudioStreamEvent:", 2);
  objc_msgSend(*(id *)(a1 + 32), "reportingAudioStreamEvent:", 183);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  -[VCAudioTransmitter redundancyController:redundancyPercentageDidChange:](self->_audioTransmitter, "redundancyController:redundancyPercentageDidChange:", a3, *(_QWORD *)&a4);
}

- (void)onPauseWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  VCAudioIO *audioIO;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t, char);
  void *v10;
  VCAudioStream *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  VCAudioStream *v20;
  __int16 v21;
  VCAudioIO *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __46__VCAudioStream_onPauseWithCompletionHandler___block_invoke;
  v10 = &unk_1E9E53C70;
  v11 = self;
  v12 = a3;
  v4 = (id)objc_msgSend(v8, "copy");
  if (self->super._operatingMode == 6)
  {
    -[VCAudioTransmitter setPeriodicReportingEnabled:](-[VCAudioStream audioTransmitter](self, "audioTransmitter"), "setPeriodicReportingEnabled:", 0);
    ((void (*)(_QWORD *, uint64_t, _QWORD))v9)(v8, 1, 0);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        audioIO = self->_audioIO;
        *(_DWORD *)buf = 136316162;
        v14 = v5;
        v15 = 2080;
        v16 = "-[VCAudioStream onPauseWithCompletionHandler:]";
        v17 = 1024;
        v18 = 2655;
        v19 = 2048;
        v20 = self;
        v21 = 2048;
        v22 = audioIO;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d (%p) pausing audioIO=%p", buf, 0x30u);
      }
    }
    -[VCAudioIO stopWithCompletionHandler:](self->_audioIO, "stopWithCompletionHandler:", v8);
  }
}

uint64_t __46__VCAudioStream_onPauseWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  VCMediaStream_Lock(*(_QWORD *)(a1 + 32));
  if ((a2 & 1) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __46__VCAudioStream_onPauseWithCompletionHandler___block_invoke_cold_1();
  }
  objc_msgSend(*(id *)(a1 + 32), "reportingAudioStreamEvent:", 184);
  objc_msgSend(*(id *)(a1 + 32), "reportingAlgosAudioStreamEvent:", 2);
  VCMediaStream_Unlock(*(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)onResumeWithCompletionHandler:(id)a3
{
  NSMutableArray *transportArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  VCAudioIO *audioIO;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, char);
  void *v16;
  VCAudioStream *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  VCAudioStream *v26;
  __int16 v27;
  VCAudioIO *v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  transportArray = self->super._transportArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(transportArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "reset");
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
    }
    while (v7);
  }
  VCAudioReceiver_Reset((uint64_t)self->_sourceContext.audioReceiver);
  -[VCPacketBundler resetBuffer](-[VCAudioTransmitter audioBundler](self->_audioTransmitter, "audioBundler"), "resetBuffer");
  -[VCPacketBundler resetBuffer](-[VCAudioTransmitter audioBundlerShortRED](self->_audioTransmitter, "audioBundlerShortRED"), "resetBuffer");
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __47__VCAudioStream_onResumeWithCompletionHandler___block_invoke;
  v16 = &unk_1E9E53C70;
  v17 = self;
  v18 = a3;
  if (self->super._operatingMode == 6)
  {
    -[VCAudioTransmitter setPeriodicReportingEnabled:](-[VCAudioStream audioTransmitter](self, "audioTransmitter", v13, v14), "setPeriodicReportingEnabled:", 1);
    ((void (*)(uint64_t *, uint64_t, _QWORD))v15)(&v13, 1, 0);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        audioIO = self->_audioIO;
        *(_DWORD *)buf = 136316162;
        v20 = v10;
        v21 = 2080;
        v22 = "-[VCAudioStream onResumeWithCompletionHandler:]";
        v23 = 1024;
        v24 = 2686;
        v25 = 2048;
        v26 = self;
        v27 = 2048;
        v28 = audioIO;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d (%p) resume audioIO=%p", buf, 0x30u);
      }
    }
    -[VCAudioIO startWithCompletionHandler:](self->_audioIO, "startWithCompletionHandler:", &v13);
  }
}

uint64_t __47__VCAudioStream_onResumeWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  VCMediaStream_Lock(*(_QWORD *)(a1 + 32));
  if ((a2 & 1) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __47__VCAudioStream_onResumeWithCompletionHandler___block_invoke_cold_1();
  }
  objc_msgSend(*(id *)(a1 + 32), "reportingAudioStreamEvent:", 185);
  objc_msgSend(*(id *)(a1 + 32), "reportingAlgosAudioStreamEvent:", 0);
  VCMediaStream_Unlock(*(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)onRTCPTimeout
{
  if (self->super._operatingMode == 11)
    -[VCAudioStream reportingAudioStreamEvent:](self, "reportingAudioStreamEvent:", 242);
}

- (void)onSendRTCPPacket
{
  _BOOL4 v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  VCWeakObjectHolder *rtcpReportProvider;
  VCAudioTransmitter *audioTransmitter;
  unsigned __int8 v9;
  _BYTE v10[1260];
  _BYTE v11[1120];
  _BYTE __b[1540];
  _DWORD v13[12];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  memset(v13, 0, sizeof(v13));
  memset(__b, 170, sizeof(__b));
  memset(v11, 170, sizeof(v11));
  v9 = 35;
  v3 = -[VCAudioStream generateRTCPXRSummaryReports:reportCount:](self, "generateRTCPXRSummaryReports:reportCount:", __b, &v9);
  v4 = v9;
  if (v3)
  {
    *(_QWORD *)&v16 = __b;
    BYTE8(v16) = v9;
    v13[0] = 256;
  }
  if (v9)
  {
    v5 = &__b[14];
    v6 = &v11[30];
    do
    {
      *(_DWORD *)(v6 - 2) = *(_DWORD *)(v5 - 2);
      v5 += 44;
      v6 += 32;
      --v4;
    }
    while (v4);
  }
  v9 = 35;
  if (-[VCAudioStream generateRTCPXRVoIPMetricsReports:reportCount:](self, "generateRTCPXRVoIPMetricsReports:reportCount:", v11, &v9))
  {
    *(_QWORD *)&v17 = v11;
    BYTE8(v17) = v9;
    v13[0] = 256;
  }
  memset(v10, 170, sizeof(v10));
  rtcpReportProvider = self->super._rtcpReportProvider;
  if (rtcpReportProvider)
  {
    v9 = 35;
    objc_msgSend((id)-[VCWeakObjectHolder strong](rtcpReportProvider, "strong"), "generateReceptionReportList:reportCount:", v10, &v9);
    if (v9)
    {
      *((_QWORD *)&v14 + 1) = v10;
      LOBYTE(v15) = v9;
    }
  }
  -[VCMediaStream sendControlPacketWithParameters:](self, "sendControlPacketWithParameters:", v13);
  audioTransmitter = self->_audioTransmitter;
  if (audioTransmitter)
    -[VCAudioTransmitter reportRTCPPacket](audioTransmitter, "reportRTCPPacket");
}

- (double)rtcpHeartbeatLeeway
{
  return 0.001;
}

- (void)setStreamIDs:(id)a3 repairStreamIDs:(id)a4
{
  -[VCAudioTransmitter setStreamIDs:](self->_audioTransmitter, "setStreamIDs:", a3, a4);
}

- (void)setTargetStreamID:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  tagVCAudioReceiver *audioReceiver;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  VCAudioStream *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[NSNumber isEqualToNumber:](self->_targetStreamID, "isEqualToNumber:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      v7 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136315906;
          v18 = v5;
          v19 = 2080;
          v20 = "-[VCAudioStream setTargetStreamID:]";
          v21 = 1024;
          v22 = 2756;
          v23 = 2112;
          v24 = a3;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d TargetStreamID didn't change %@", (uint8_t *)&v17, 0x26u);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[VCAudioStream setTargetStreamID:].cold.1();
      }
    }
    return;
  }
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_17;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v17 = 136315906;
    v18 = v9;
    v19 = 2080;
    v20 = "-[VCAudioStream setTargetStreamID:]";
    v21 = 1024;
    v22 = 2759;
    v23 = 2112;
    v24 = a3;
    v11 = "VCAudioStream [%s] %s:%d Setting target stream id: %@";
    v12 = v10;
    v13 = 38;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_17;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v17 = 136316418;
    v18 = v14;
    v19 = 2080;
    v20 = "-[VCAudioStream setTargetStreamID:]";
    v21 = 1024;
    v22 = 2759;
    v23 = 2112;
    v24 = (id)v8;
    v25 = 2048;
    v26 = self;
    v27 = 2112;
    v28 = a3;
    v11 = "VCAudioStream [%s] %s:%d %@(%p) Setting target stream id: %@";
    v12 = v15;
    v13 = 58;
  }
  _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
LABEL_17:

  self->_targetStreamID = (NSNumber *)a3;
  VCMediaStream_Lock((uint64_t)self);
  audioReceiver = self->_sourceContext.audioReceiver;
  if (audioReceiver)
    VCAudioReceiver_SetTargetStreamID((uint64_t)audioReceiver, objc_msgSend(a3, "unsignedShortValue"));
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)setupPeriodicReporting
{
  if (-[VCObject reportingAgent](self, "reportingAgent"))
  {
    -[VCObject reportingAgent](self, "reportingAgent");
    reportingRegisterPeriodicTaskWeak();
  }
}

uint64_t __39__VCAudioStream_setupPeriodicReporting__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  VCMediaStream_Lock((uint64_t)a2);
  if (objc_msgSend(a2, "state") == 2)
    objc_msgSend(a2, "gatherRealtimeStats:", a3);
  return VCMediaStream_Unlock((uint64_t)a2);
}

- (void)setupReportingAgent:(id)a3
{
  uint64_t v5;
  const void *Agent;

  self->super._isReportingAgentOwner = 1;
  v5 = -[VCAudioStream getReportingClientType](self, "getReportingClientType");
  -[VCMediaStream applyClientSessionID:clientUserInfo:](self, "applyClientSessionID:clientUserInfo:", v5, objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
  -[VCAudioStream getReportingClientName](self, "getReportingClientName");
  -[VCAudioStream getReportingServiceID](self, "getReportingServiceID");
  Agent = (const void *)reportingCreateAgent();
  -[VCObject setReportingAgent:](self, "setReportingAgent:", Agent);
  if (Agent)
    CFRelease(Agent);
  -[VCObject reportingAgent](self, "reportingAgent");
  self->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
  objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  -[VCObject reportingAgent](self, "reportingAgent");
  -[VCAudioStream getReportingClientName](self, "getReportingClientName");
  -[VCAudioStream getReportingServiceID](self, "getReportingServiceID");
  -[VCAudioStream getClientSpecificUserInfo:](self, "getClientSpecificUserInfo:", a3);
  reportingSetUserInfo();
}

void __37__VCAudioStream_setupReportingAgent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "strong");
    v3 = objc_opt_class();
    if (v3 == objc_msgSend(*(id *)(a1 + 32), "strong"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __37__VCAudioStream_setupReportingAgent___block_invoke_cold_1();
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "strong");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v7 = objc_msgSend(*(id *)(a1 + 32), "strong");
          v8 = 136316162;
          v9 = v5;
          v10 = 2080;
          v11 = "-[VCAudioStream setupReportingAgent:]_block_invoke";
          v12 = 1024;
          v13 = 2828;
          v14 = 2112;
          v15 = v4;
          v16 = 2048;
          v17 = v7;
          _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) Reporting not available (no backends)", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
}

- (BOOL)isStandaloneStreamClientSpecificUserInfoSupported
{
  return (self->super._operatingMode < 0xDu) & (0x1820u >> self->super._operatingMode);
}

- (__CFDictionary)getClientSpecificUserInfo:(id)a3
{
  void *v5;
  NSString *callID;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[VCAudioStream isStandaloneStreamClientSpecificUserInfoSupported](self, "isStandaloneStreamClientSpecificUserInfoSupported")&& objc_msgSend(a3, "count"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->super._streamToken), CFSTR("VCVSStreamToken"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "direction")), CFSTR("VCMSDirection"));
    callID = self->super._callID;
    if (callID)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", callID, CFSTR("CallID"));
    -[VCMediaStream applyClientSessionID:clientUserInfo:](self, "applyClientSessionID:clientUserInfo:", -[VCAudioStream getReportingClientType](self, "getReportingClientType"), v5);
  }
  else if (self->super._operatingMode == 6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(a3);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v13 = objc_msgSend((id)objc_msgSend(v12, "multiwayConfig"), "idsStreamID");
          v14 = (void *)MEMORY[0x1E0CB37E8];
          v15 = (void *)objc_msgSend(v12, "multiwayConfig");
          if (v13)
            v16 = objc_msgSend(v14, "numberWithUnsignedShort:", objc_msgSend(v15, "idsStreamID"));
          else
            v16 = objc_msgSend(v14, "numberWithUnsignedInt:", objc_msgSend(v15, "streamGroupID"));
          objc_msgSend(v7, "addObject:", v16);
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
      }
      while (v9);
    }
    v17 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "streamGroupID");
    v18 = reportingStreamGroupFromStreamGroupID();
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "sessionId"), CFSTR("VCSUUID"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "participantId"), CFSTR("VCSPUUID"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v7, "componentsJoinedByString:", CFSTR(",")), CFSTR("VCASStreamIDs"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "direction")), "stringValue"), CFSTR("VCMSDirection"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18), CFSTR("VCMSStreamGroup"));
    -[VCMediaStream applyClientSessionID:clientUserInfo:](self, "applyClientSessionID:clientUserInfo:", -[VCAudioStream getReportingClientType](self, "getReportingClientType"), v5);

  }
  else
  {
    return 0;
  }
  return (__CFDictionary *)v5;
}

- (int)getReportingClientType
{
  int operatingMode;
  int result;

  operatingMode = self->super._operatingMode;
  result = -1;
  switch(operatingMode)
  {
    case 3:
      result = 1;
      break;
    case 5:
      result = 2;
      break;
    case 6:
      result = 4;
      break;
    case 11:
      if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", *MEMORY[0x1E0CF2A18]))
        result = 17;
      else
        result = 11;
      break;
    case 12:
      if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", CFSTR("CoreDeviceScreenSharing")))
      {
        result = 14;
      }
      else if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", CFSTR("RemoteDesktopScreenSharing"))|| -[NSString isEqualToString:](self->super._clientName, "isEqualToString:", *MEMORY[0x1E0CF29D0]))
      {
        result = 18;
      }
      else if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", CFSTR("NearbyScreenSharing")))
      {
        result = 20;
      }
      else
      {
        result = -1;
      }
      break;
    default:
      return result;
  }
  return result;
}

- (__CFString)getReportingClientName
{
  __CFString *v2;
  __CFString **v4;
  __CFString **v5;
  NSString *clientName;
  __CFString **v8;

  v2 = &stru_1E9E58EE0;
  switch(self->super._operatingMode)
  {
    case 3:
      v4 = (__CFString **)MEMORY[0x1E0CF2A50];
      return *v4;
    case 5:
      v4 = (__CFString **)MEMORY[0x1E0CF29F8];
      return *v4;
    case 6:
      v4 = (__CFString **)MEMORY[0x1E0CF2A08];
      return *v4;
    case 8:
      v4 = (__CFString **)MEMORY[0x1E0CF2A40];
      return *v4;
    case 0xB:
      v5 = (__CFString **)MEMORY[0x1E0CF2A18];
      if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", *MEMORY[0x1E0CF2A18]))
        return *v5;
      v4 = (__CFString **)MEMORY[0x1E0CF2A38];
      return *v4;
    case 0xC:
      if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", CFSTR("CoreDeviceScreenSharing")))
      {
        v4 = (__CFString **)MEMORY[0x1E0CF29E0];
        return *v4;
      }
      if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", CFSTR("RemoteDesktopScreenSharing")))
      {
        v4 = (__CFString **)MEMORY[0x1E0CF2A30];
        return *v4;
      }
      if (-[NSString isEqualToString:](self->super._clientName, "isEqualToString:", CFSTR("NearbyScreenSharing")))
      {
        v4 = (__CFString **)MEMORY[0x1E0CF2A10];
        return *v4;
      }
      clientName = self->super._clientName;
      v8 = (__CFString **)MEMORY[0x1E0CF29D0];
      if (-[NSString isEqualToString:](clientName, "isEqualToString:", *MEMORY[0x1E0CF29D0]))
        return *v8;
      return v2;
    default:
      return v2;
  }
}

- (id)getReportingServiceID
{
  unsigned int operatingMode;
  id result;

  operatingMode = self->super._operatingMode;
  result = &stru_1E9E58EE0;
  if (operatingMode <= 0xC)
  {
    if (((1 << operatingMode) & 0x1848) != 0)
    {
      return CFSTR("Audio");
    }
    else if (operatingMode == 5)
    {
      return (id)*MEMORY[0x1E0CF2A00];
    }
  }
  return result;
}

- (void)reportTimestampJumpsWithReportingDictionary:(__CFDictionary *)a3
{
  void *v5;
  tagVCAudioStreamPeriodicReportingMetrics *p_periodicReportingMetrics;
  unint64_t *p_timestampJumpDuration;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  p_periodicReportingMetrics = &self->_periodicReportingMetrics;
  p_timestampJumpDuration = &self->_periodicReportingMetrics.timestampJumpDuration;
  do
    v8 = __ldaxr(p_timestampJumpDuration);
  while (__stlxr(0, p_timestampJumpDuration));
  CFDictionaryAddValue(a3, CFSTR("VCASTimestampJumpDuration"), (const void *)objc_msgSend(v5, "numberWithUnsignedLong:", v8));
  v9 = (void *)MEMORY[0x1E0CB37E8];
  do
    v10 = __ldaxr(&p_periodicReportingMetrics->timestampJumpCount);
  while (__stlxr(0, &p_periodicReportingMetrics->timestampJumpCount));
  CFDictionaryAddValue(a3, CFSTR("VCASTimestampJumpCount"), (const void *)objc_msgSend(v9, "numberWithUnsignedInt:", v10));
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = atomic_load(&p_periodicReportingMetrics->timestampJumpMax);
  CFDictionaryAddValue(a3, CFSTR("VCASTimestampJumpMax"), (const void *)objc_msgSend(v11, "numberWithUnsignedLong:", v12));
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  NSDictionary *v5;

  v5 = -[VCAudioIO reportingStats](self->_audioIO, "reportingStats");
  if (v5)
    VCUtil_AppendFromDictionary(a3, (CFDictionaryRef)v5);
  -[VCAudioStream reportTimestampJumpsWithReportingDictionary:](self, "reportTimestampJumpsWithReportingDictionary:", a3);
  -[VCMediaStream collectChannelSequenceMetrics:](self, "collectChannelSequenceMetrics:", a3);
}

- (void)updateCodecPayloadAndBitrateForStartEvent:(int *)a3 bitrate:(unsigned int *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  unsigned int v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSMutableArray *obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  VCAudioStream *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      obj = self->super._transportArray;
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
      if (v24)
      {
        v23 = *(_QWORD *)v34;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v34 != v23)
              objc_enumerationMutation(obj);
            v25 = v6;
            v7 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v6), "streamConfig");
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "allCodecConfigurations"), "allValues");
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
            if (v9)
            {
              v10 = v9;
              v11 = *(_QWORD *)v29;
              do
              {
                for (i = 0; i != v10; ++i)
                {
                  if (*(_QWORD *)v29 != v11)
                    objc_enumerationMutation(v8);
                  v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                  v14 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(v13, "codecType"));
                  v15 = +[VCPayloadUtils bitrateForCodecType:mode:](VCPayloadUtils, "bitrateForCodecType:mode:", objc_msgSend(v13, "codecType"), objc_msgSend(v13, "preferredMode"));
                  if (v15 > *a4)
                  {
                    *a4 = v15;
                    *a3 = v14;
                  }
                }
                v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
              }
              while (v10);
            }
            v6 = v25 + 1;
          }
          while (v25 + 1 != v24);
          v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
        }
        while (v24);
      }
      return;
    }
    if ((VCAudioStream *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v21 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)buf = 136316162;
      v38 = v21;
      v39 = 2080;
      v40 = "-[VCAudioStream updateCodecPayloadAndBitrateForStartEvent:bitrate:]";
      v41 = 1024;
      v42 = 3003;
      v43 = 2112;
      v44 = v17;
      v45 = 2048;
      v46 = self;
      v20 = "VCAudioStream [%s] %s:%d %@(%p) Bitrate is null";
      goto LABEL_40;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStream updateCodecPayloadAndBitrateForStartEvent:bitrate:].cold.2();
    }
  }
  else
  {
    if ((VCAudioStream *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)buf = 136316162;
      v38 = v18;
      v39 = 2080;
      v40 = "-[VCAudioStream updateCodecPayloadAndBitrateForStartEvent:bitrate:]";
      v41 = 1024;
      v42 = 3002;
      v43 = 2112;
      v44 = v16;
      v45 = 2048;
      v46 = self;
      v20 = "VCAudioStream [%s] %s:%d %@(%p) Payload is null";
LABEL_40:
      _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x30u);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStream updateCodecPayloadAndBitrateForStartEvent:bitrate:].cold.1();
    }
  }
}

- (void)addStreamStartingMetricsToReport:(const __CFDictionary *)a3
{
  VCMediaStreamConfig *v5;
  NSString *callID;
  VCCallInfoBlob *remoteEndpointInfo;
  NSString *v8;
  const __CFString *v9;

  v5 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  CFDictionaryAddValue(a3, CFSTR("VCASMaxNetworkBitRate"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCMediaStreamMultiwayConfig maxNetworkBitrate](-[VCMediaStreamConfig multiwayConfig](v5, "multiwayConfig"), "maxNetworkBitrate")));
  if (!-[VCAudioStream isStandaloneStreamClientSpecificUserInfoSupported](self, "isStandaloneStreamClientSpecificUserInfoSupported"))
  {
    if (self->super._operatingMode != 3)
      return;
    v8 = (NSString *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCMediaStreamConfig outOfProcessCodecsEnabled](v5, "outOfProcessCodecsEnabled"));
    v9 = CFSTR("VCMSOOPCodecs");
    goto LABEL_8;
  }
  CFDictionaryAddValue(a3, CFSTR("VCVSStreamToken"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->super._streamToken));
  CFDictionaryAddValue(a3, CFSTR("VCMSDirection"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStreamConfig direction](v5, "direction")));
  callID = self->super._callID;
  if (callID)
    CFDictionaryAddValue(a3, CFSTR("CallID"), callID);
  remoteEndpointInfo = self->super._remoteEndpointInfo;
  if (remoteEndpointInfo)
  {
    CFDictionaryAddValue(a3, CFSTR("VCVSRemoteDeviceModel"), -[VCCallInfoBlob deviceType](remoteEndpointInfo, "deviceType"));
    v8 = -[VCCallInfoBlob osVersion](self->super._remoteEndpointInfo, "osVersion");
    v9 = CFSTR("VCVSRemoteOSBuildVersion");
LABEL_8:
    CFDictionaryAddValue(a3, v9, v8);
  }
}

- (void)reportingAudioStreamEvent:(unsigned __int16)a3
{
  int v3;
  __CFDictionary *Mutable;
  VCMediaStreamConfig *v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v6 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  v7 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload");
  HIDWORD(v12) = v7;
  LODWORD(v12) = -[VCAudioPayload bitrate](self->currentAudioPayload, "bitrate");
  if (self->super._operatingMode == 6)
  {
    v8 = -[VCMediaStreamConfig direction](v6, "direction");
    if (v3 == 182 && v8 == 1)
    {
      -[VCAudioStream updateCodecPayloadAndBitrateForStartEvent:bitrate:](self, "updateCodecPayloadAndBitrateForStartEvent:bitrate:", (char *)&v12 + 4, &v12);
LABEL_8:
      -[VCAudioStream addStreamStartingMetricsToReport:](self, "addStreamStartingMetricsToReport:", Mutable, v12, v13);
      v7 = HIDWORD(v12);
      goto LABEL_9;
    }
  }
  if (v3 != 187)
  {
    if (v3 == 183)
    {
      v11 = -[VCMediaStream endReason](self, "endReason");
      v9 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
      v10 = CFSTR("VCMSEndReason");
      goto LABEL_11;
    }
    if (v3 != 182)
      goto LABEL_12;
    goto LABEL_8;
  }
LABEL_9:
  CFDictionaryAddValue(Mutable, CFSTR("VCASCurrentPayload"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7, v12));
  CFDictionaryAddValue(Mutable, CFSTR("VCASCodecBitRate"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12));
  CFDictionaryAddValue(Mutable, CFSTR("VCASRedundancyLevel"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCAudioTransmitter redNumPayloads](self->_audioTransmitter, "redNumPayloads")));
  v9 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCAudioTransmitter redMaxDelay20ms](self->_audioTransmitter, "redMaxDelay20ms"));
  v10 = CFSTR("VCASRedundancyDelay");
LABEL_11:
  CFDictionaryAddValue(Mutable, v10, v9);
LABEL_12:
  -[VCObject reportingAgent](self, "reportingAgent", v12);
  reportingAudioStreamEvent();
  if (Mutable)
    CFRelease(Mutable);
}

- (void)reportingAlgosAudioStreamEvent:(unsigned __int16)a3
{
  VCMediaStreamConfig *v4;
  VCMediaStreamConfig *v5;
  __CFDictionary *Mutable;

  v4 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  if (self->super._operatingMode == 6)
  {
    v5 = v4;
    if (-[VCMediaStreamConfig direction](v4, "direction") == 2)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFDictionaryAddValue(Mutable, CFSTR("VCSPUUID"), -[VCMediaStreamMultiwayConfig participantId](-[VCMediaStreamConfig multiwayConfig](v5, "multiwayConfig"), "participantId"));
      -[VCObject reportingAgent](self, "reportingAgent");
      reportingGenericEvent();
      if (Mutable)
        CFRelease(Mutable);
    }
  }
}

- (int)getConnectionTypeForStreamMode:(int64_t)a3
{
  int result;

  result = -1;
  switch(a3)
  {
    case 0:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStream getConnectionTypeForStreamMode:].cold.1();
      }
      result = -1;
      break;
    case 1:
    case 3:
      result = 3;
      break;
    case 7:
    case 10:
      result = 2;
      break;
    default:
      return result;
  }
  return result;
}

- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3
{
  VCAudioStream_PullAudioSamples((uint64_t)&self->_sourceContext, (unsigned int *)a3);
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  VCAudioStream_PushAudioSamples((uint64_t)self, (unsigned int *)a3);
}

- (void)addSyncSourceDelegate:(id)a3
{
  _DWORD *v5;
  int v6;
  OSStatus v7;
  OSStatus v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  _DWORD *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCAudioStream *v22;
  __int16 v23;
  OSStatus v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = _VCAudioStream_NewSyncDelegateEvent(0, (uint64_t)self, a3);
  v12 = v5;
  VCMediaStream_Lock((uint64_t)self);
  os_unfair_lock_lock(&self->_delegateLock);
  CFArrayAppendValue(self->_syncSourceDelegates, a3);
  v6 = -[VCMediaStream state](self, "state");
  if (v6 != 2)
  {
    _VCAudioStream_RegisterSyncDelegateEvent((uint64_t)self, (uint64_t)v5);
LABEL_7:
    if (self->super._operatingMode != 5)
      VCMediaStreamSyncSourceDelegate_updateSourceState((uint64_t)a3, v6 != 2);
    os_unfair_lock_unlock(&self->_delegateLock);
    VCMediaStream_Unlock((uint64_t)self);
    return;
  }
  v7 = CMSimpleQueueEnqueue(self->_syncSourceDelegateQueue, v5);
  if (!v7)
    goto LABEL_7;
  v8 = v7;
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStream addSyncSourceDelegate:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v14 = v10;
        v15 = 2080;
        v16 = "-[VCAudioStream addSyncSourceDelegate:]";
        v17 = 1024;
        v18 = 3281;
        v19 = 2112;
        v20 = v9;
        v21 = 2048;
        v22 = self;
        v23 = 1024;
        v24 = v8;
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) CMSimpleQueueEnqueue enqueue failed with error=%d", buf, 0x36u);
      }
    }
  }
  _VCAudioStream_ReleaseSyncDelegateEvent((uint64_t *)&v12, 1);
  os_unfair_lock_unlock(&self->_delegateLock);
  VCMediaStream_Unlock((uint64_t)self);
  -[VCAudioStream waitIdleForSyncSourceDelegates](self, "waitIdleForSyncSourceDelegates");
}

- (void)removeSyncSourceDelegate:(id)a3
{
  _DWORD *v5;
  OSStatus v6;
  OSStatus v7;
  const __CFString *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  int Count;
  CFIndex v13;
  _DWORD *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCAudioStream *v24;
  __int16 v25;
  OSStatus v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = _VCAudioStream_NewSyncDelegateEvent(1, (uint64_t)self, a3);
  v14 = v5;
  VCMediaStream_Lock((uint64_t)self);
  os_unfair_lock_lock(&self->_delegateLock);
  if (-[VCMediaStream state](self, "state") != 2)
  {
    _VCAudioStream_DeregisterSyncDelegateEvent((uint64_t)self, (uint64_t)v5);
    goto LABEL_7;
  }
  v6 = CMSimpleQueueEnqueue(self->_syncSourceDelegateQueue, v5);
  if (!v6)
  {
LABEL_7:
    v9 = 1;
    goto LABEL_16;
  }
  v7 = v6;
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStream removeSyncSourceDelegate:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v16 = v10;
        v17 = 2080;
        v18 = "-[VCAudioStream removeSyncSourceDelegate:]";
        v19 = 1024;
        v20 = 3306;
        v21 = 2112;
        v22 = v8;
        v23 = 2048;
        v24 = self;
        v25 = 1024;
        v26 = v7;
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d %@(%p) CMSimpleQueueEnqueue enqueue failed with error=%d", buf, 0x36u);
      }
    }
  }
  _VCAudioStream_ReleaseSyncDelegateEvent((uint64_t *)&v14, 1);
  v9 = 0;
LABEL_16:
  Count = CFArrayGetCount(self->_syncSourceDelegates);
  v13 = (Count - 1);
  if (Count - 1 >= 0)
  {
    do
    {
      if (CFArrayGetValueAtIndex(self->_syncSourceDelegates, v13) == a3)
        CFArrayRemoveValueAtIndex(self->_syncSourceDelegates, v13);
      --Count;
      --v13;
    }
    while (Count > 0);
  }
  VCMediaStreamSyncSourceDelegate_updateSourceState((uint64_t)a3, 1);
  os_unfair_lock_unlock(&self->_delegateLock);
  VCMediaStream_Unlock((uint64_t)self);
  if ((v9 & 1) == 0)
    -[VCAudioStream waitIdleForSyncSourceDelegates](self, "waitIdleForSyncSourceDelegates");
}

- (void)waitIdleForSyncSourceDelegates
{
  const __CFString *v3;
  dispatch_time_t v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  VCAudioStream *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("skipAudioManagerIdleWait"), 0))
  {
    v4 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_runLock, v4))
    {
      if ((VCAudioStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_25;
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        v20 = 136315650;
        v21 = v13;
        v22 = 2080;
        v23 = "-[VCAudioStream waitIdleForSyncSourceDelegates]";
        v24 = 1024;
        v25 = 3335;
        v15 = "VCAudioStream [%s] %s:%d Sink run lock semaphore was not signaled!";
        v16 = v14;
        v17 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v5 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_25;
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        v20 = 136316162;
        v21 = v18;
        v22 = 2080;
        v23 = "-[VCAudioStream waitIdleForSyncSourceDelegates]";
        v24 = 1024;
        v25 = 3335;
        v26 = 2112;
        v27 = v5;
        v28 = 2048;
        v29 = self;
        v15 = "VCAudioStream [%s] %s:%d %@(%p) Sink run lock semaphore was not signaled!";
        v16 = v19;
        v17 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, v17);
    }
LABEL_25:
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_runLock);
    return;
  }
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315906;
        v21 = v6;
        v22 = 2080;
        v23 = "-[VCAudioStream waitIdleForSyncSourceDelegates]";
        v24 = 1024;
        v25 = 3329;
        v26 = 2112;
        v27 = CFSTR("skipAudioManagerIdleWait");
        v8 = "VCAudioStream [%s] %s:%d %@ set. Skipping idle wait";
        v9 = v7;
        v10 = 38;
LABEL_16:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v20, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136316418;
        v21 = v11;
        v22 = 2080;
        v23 = "-[VCAudioStream waitIdleForSyncSourceDelegates]";
        v24 = 1024;
        v25 = 3329;
        v26 = 2112;
        v27 = v3;
        v28 = 2048;
        v29 = self;
        v30 = 2112;
        v31 = CFSTR("skipAudioManagerIdleWait");
        v8 = "VCAudioStream [%s] %s:%d %@(%p) %@ set. Skipping idle wait";
        v9 = v12;
        v10 = 58;
        goto LABEL_16;
      }
    }
  }
}

- (int64_t)getSyncSourceSampleRate
{
  return (uint64_t)self->_vpioFormat.format.mSampleRate;
}

- (void)registerCodecRateModeChangeNotifications
{
  __int128 v2;
  uint64_t (*v3)(_QWORD);
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2 = self;
  *((_QWORD *)&v2 + 1) = MEMORY[0x1E0C98BD0];
  v3 = MEMORY[0x1E0C98BC0];
  VCAudioReceiver_RegisterCodecRateModeRequestCallback((uint64_t)self->_sourceContext.audioReceiver, (uint64_t)CodecRateModeChangeNotificationCallback, &v2);
}

- (void)registerActiveAudioStreamChangeNotifications
{
  __int128 v2;
  uint64_t (*v3)(_QWORD);
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2 = self;
  *((_QWORD *)&v2 + 1) = MEMORY[0x1E0C98BD0];
  v3 = MEMORY[0x1E0C98BC0];
  VCAudioReceiver_RegisterActiveAudioStreamRequestCallback((uint64_t)self->_sourceContext.audioReceiver, (uint64_t)_VCAudioStream_ActiveStreamChangeCallback, &v2);
}

- (void)unregisterCodecRateModeChangeNotifications
{
  VCAudioReceiver_RegisterCodecRateModeRequestCallback((uint64_t)self->_sourceContext.audioReceiver, 0, 0);
}

- (void)didSuspendAudioIO:(id)a3
{
  VCMediaStream_Lock((uint64_t)self);
  VCAudioReceiver_Reset((uint64_t)self->_sourceContext.audioReceiver);
  -[VCPacketBundler resetBuffer](-[VCAudioTransmitter audioBundler](self->_audioTransmitter, "audioBundler"), "resetBuffer");
  -[VCPacketBundler resetBuffer](-[VCAudioTransmitter audioBundlerShortRED](self->_audioTransmitter, "audioBundlerShortRED"), "resetBuffer");
  self->_rtpEnabledBeforeInterrupt = -[VCMediaStreamTransport isRTPTimeoutEnabled](-[VCMediaStream defaultTransport](self, "defaultTransport"), "isRTPTimeoutEnabled");
  -[VCMediaStream setRtpTimeOutEnabled:](self, "setRtpTimeOutEnabled:", 0);
  self->_rtcpEnabledBeforeInterrupt = -[VCMediaStreamTransport isRTCPTimeoutEnabled](-[VCMediaStream defaultTransport](self, "defaultTransport"), "isRTCPTimeoutEnabled");
  -[VCMediaStream setRtcpTimeOutEnabled:](self, "setRtcpTimeOutEnabled:", 0);
  -[VCAudioStream reportingAudioStreamEvent:](self, "reportingAudioStreamEvent:", 184);
  -[VCAudioStream reportingAlgosAudioStreamEvent:](self, "reportingAlgosAudioStreamEvent:", 2);
  -[VCMediaStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VCMediaStreamDelegate vcMediaStreamDidInterruptionBegin:](-[VCMediaStream delegate](self, "delegate"), "vcMediaStreamDidInterruptionBegin:", self);
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)didResumeAudioIO:(id)a3
{
  VCMediaStream_Lock((uint64_t)self);
  -[VCMediaStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VCMediaStreamDelegate vcMediaStreamDidInterruptionEnd:](-[VCMediaStream delegate](self, "delegate"), "vcMediaStreamDidInterruptionEnd:", self);
  -[VCAudioStream reportingAudioStreamEvent:](self, "reportingAudioStreamEvent:", 185);
  -[VCAudioStream reportingAlgosAudioStreamEvent:](self, "reportingAlgosAudioStreamEvent:", 0);
  -[VCMediaStream setRtpTimeOutEnabled:](self, "setRtpTimeOutEnabled:", self->_rtpEnabledBeforeInterrupt);
  -[VCMediaStream setRtcpTimeOutEnabled:](self, "setRtcpTimeOutEnabled:", self->_rtcpEnabledBeforeInterrupt);
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)serverDidDie
{
  void *v3;

  VCMediaStream_Lock((uint64_t)self);
  v3 = (void *)MEMORY[0x1DF086F1C](&self->super._delegate);
  VCMediaStream_Unlock((uint64_t)self);
  objc_msgSend(v3, "vcMediaStreamServerDidDie:", self);
  if (v3)
    CFRelease(v3);
}

- (void)collectRxChannelMetrics:(id *)a3
{
  _VCAudioStreamSourceContext *p_sourceContext;
  uint64_t v5;
  NSObject *v6;
  unsigned int framesProcessed;
  int v8;
  NSString *v9;
  tagVCAudioReceiver *audioReceiver;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  VCAudioStream *v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  tagVCAudioReceiver *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_sourceContext = &self->_sourceContext;
  VCAudioReceiver_CollectChannelMetrics((uint64_t)self->_sourceContext.audioReceiver, a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      framesProcessed = p_sourceContext->framesProcessed;
      v8 = -[VCMediaStream state](self, "state");
      v9 = -[VCMediaStreamMultiwayConfig participantId](-[VCMediaStreamConfig multiwayConfig](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "multiwayConfig"), "participantId");
      audioReceiver = p_sourceContext->audioReceiver;
      v11 = 136316930;
      v12 = v5;
      v13 = 2080;
      v14 = "-[VCAudioStream collectRxChannelMetrics:]";
      v15 = 1024;
      v16 = 3484;
      v17 = 2048;
      v18 = self;
      v19 = 1024;
      v20 = framesProcessed;
      v21 = 1024;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      v25 = 2048;
      v26 = audioReceiver;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d VCAudioStream[%p] PullAudioSamples count:%u, state:%d, participantID:[%@], audioReceiver[%p]", (uint8_t *)&v11, 0x46u);
    }
  }
}

- (void)collectTxChannelMetrics:(id *)a3
{
  VCAudioTransmitter *audioTransmitter;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  audioTransmitter = self->_audioTransmitter;
  if (audioTransmitter)
  {
    -[VCAudioTransmitter currentChannelMetrics](audioTransmitter, "currentChannelMetrics");
  }
  else
  {
    v10 = 0;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v5 = 0u;
  }
  *(_OWORD *)&a3->var3 = v7;
  *(_OWORD *)&a3->var4.height = v8;
  *(_OWORD *)&a3->var6 = v9;
  *(_QWORD *)&a3->var8 = v10;
  *(_OWORD *)&a3->var0 = v5;
  *(_OWORD *)&a3->var1[3] = v6;
}

- (void)handleActiveConnectionChange:(id)a3
{
  tagVCAudioReceiver *audioReceiver;
  int v6;
  int v7;

  VCMediaStream_Lock((uint64_t)self);
  self->_cachedConnectionMTU = objc_msgSend(a3, "maxConnectionMTU");
  self->_constantTransportOverhead = VCConnection_PerPacketConnectionOverhead((uint64_t)a3);
  if (self->super._operatingMode == 6)
    -[VCMediaStream updateTransportsWithConstantConnectionOverhead:](self, "updateTransportsWithConstantConnectionOverhead:");
  -[VCAudioTransmitter handleActiveConnectionChange:](self->_audioTransmitter, "handleActiveConnectionChange:", a3);
  audioReceiver = self->_sourceContext.audioReceiver;
  v6 = VCConnection_LocalCellTech((uint64_t)a3);
  v7 = VCConnection_RemoteCellTech((uint64_t)a3);
  VCAudioReceiver_UpdateCellTech((uint64_t)audioReceiver, v6, v7);
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioStream didUpdateBasebandCodec:].cold.1();
  }
}

- (unsigned)conferenceID
{
  return self->conferenceID;
}

- (BOOL)isValid
{
  return self->isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->isValid = a3;
}

- (int)deviceRole
{
  return self->deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->deviceRole = a3;
}

- (VCAudioTransmitter)audioTransmitter
{
  return (VCAudioTransmitter *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setAudioTransmitter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (VCAudioIO)audioIO
{
  return (VCAudioIO *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setAudioIO:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (BOOL)isCurrentDTXEnabled
{
  return self->_currentDTXEnable;
}

- (NSNumber)targetStreamID
{
  return self->_targetStreamID;
}

- (unsigned)lastNoVoiceActivityPacketCount
{
  return self->_lastNoVoiceActivityPacketCount;
}

- (void)setLastNoVoiceActivityPacketCount:(unsigned int)a3
{
  self->_lastNoVoiceActivityPacketCount = a3;
}

- (int64_t)overlayToken
{
  return self->_overlayToken;
}

void ___VCAudioStream_DTMFEventCallback_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF086F1C](*(_QWORD *)(a1 + 32) + 256);
  objc_msgSend(v2, "vcMediaStream:didReceiveDTMFEventWithDigit:", *(_QWORD *)(a1 + 32), *(char *)(a1 + 40));
  if (v2)
    CFRelease(v2);
}

uint64_t ___VCAudioStream_ActiveStreamChangeCallback_block_invoke(uint64_t a1)
{
  int Count;
  CFIndex v3;
  const void *ValueAtIndex;
  uint64_t v5;
  NSObject *v6;
  uint64_t result;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  VCMediaStream_Lock(*(_QWORD *)(a1 + 32));
  Count = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 1696));
  v3 = (Count - 1);
  if (Count - 1 >= 0)
  {
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 1696), v3);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v9 = v5;
          v10 = 2080;
          v11 = "_VCAudioStream_ActiveStreamChangeCallback_block_invoke";
          v12 = 1024;
          v13 = 3410;
          v14 = 1024;
          v15 = 3410;
          v16 = 2048;
          v17 = ValueAtIndex;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioStream [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioStream.m:%d: resetting SourceState for syncSourceDelegate=%p", buf, 0x2Cu);
        }
      }
      VCMediaStreamSyncSourceDelegate_resetSourceState((uint64_t)ValueAtIndex);
      --Count;
      --v3;
    }
    while (Count > 0);
  }
  VCMediaStream_Unlock(*(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStream:didSwitchToAudioStreamWithID:", *(_QWORD *)(a1 + 32), *(unsigned __int16 *)(a1 + 40));
  return result;
}

+ (BOOL)isTelephony:(int64_t)a3
{
  return ((unint64_t)a3 < 0xB) & (0x48Au >> a3);
}

+ (BOOL)isVoLTE:(int64_t)a3
{
  return a3 == 7 || a3 == 10;
}

- (void)setIsLocalCelluar:(unsigned int)a3
{
  NSMutableArray *transportArray;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  VCAudioStream *v29;
  __int16 v30;
  unsigned int v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  transportArray = self->super._transportArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v34;
    *(_QWORD *)&v7 = 136315906;
    v19 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(transportArray);
        *(_DWORD *)(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "realtimeContext", v19) + 220) = a3;
        if ((VCAudioStream *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v17 = VRTraceErrorLogLevelToCSTR();
            v18 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              v21 = v17;
              v22 = 2080;
              v23 = "-[VCAudioStream(Telephony) setIsLocalCelluar:]";
              v24 = 1024;
              v25 = 32;
              v26 = 1024;
              LODWORD(v27) = a3;
              v14 = v18;
              v15 = " [%s] %s:%d WiFi<->Cellular handover isLocalCellular=%d";
              v16 = 34;
              goto LABEL_15;
            }
          }
        }
        else
        {
          v11 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v11 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v12 = VRTraceErrorLogLevelToCSTR();
            v13 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316418;
              v21 = v12;
              v22 = 2080;
              v23 = "-[VCAudioStream(Telephony) setIsLocalCelluar:]";
              v24 = 1024;
              v25 = 32;
              v26 = 2112;
              v27 = v11;
              v28 = 2048;
              v29 = self;
              v30 = 1024;
              v31 = a3;
              v14 = v13;
              v15 = " [%s] %s:%d %@(%p) WiFi<->Cellular handover isLocalCellular=%d";
              v16 = 54;
LABEL_15:
              _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
              continue;
            }
          }
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    }
    while (v8);
  }
}

- (void)handleCellularToWiFiHandover
{
  -[VCAudioStream setIsLocalCelluar:](self, "setIsLocalCelluar:", 0);
  -[VCMediaStreamConfig setAudioStreamMode:](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "setAudioStreamMode:", 1);
  VCAudioTransmitter_ProcessConnectionType((uint64_t)self->_audioTransmitter, 3);
  VCAudioReceiver_ProcessConnectionType((uint64_t)self->_sourceContext.audioReceiver, 3);
  -[VCTransportSession destroyNWMonitor](self->super._transportSession, "destroyNWMonitor");
  -[VCMediaStreamRateAdaptation stop](self->super._rateAdaptation, "stop");
}

- (void)handleWiFiToCelluarHandover
{
  -[VCAudioStream setIsLocalCelluar:](self, "setIsLocalCelluar:", 1);
  -[VCMediaStreamConfig setAudioStreamMode:](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "setAudioStreamMode:", 7);
  VCAudioTransmitter_ProcessConnectionType((uint64_t)self->_audioTransmitter, 2);
  VCAudioReceiver_ProcessConnectionType((uint64_t)self->_sourceContext.audioReceiver, 2);
  -[VCAudioStream configureCellularFeatures](self, "configureCellularFeatures");
  -[VCTransportSession setupNWMonitor](self->super._transportSession, "setupNWMonitor");
  -[VCMediaStreamRateAdaptation start](self->super._rateAdaptation, "start");
}

- (void)setJitterBufferMode:(int)a3
{
  tagVCAudioReceiver *audioReceiver;

  VCMediaStream_Lock((uint64_t)self);
  audioReceiver = self->_sourceContext.audioReceiver;
  if (audioReceiver)
  {
    audioReceiver->var73 = 1;
    audioReceiver->var0.var4 = a3;
    if (a3 == 1)
    {
      if (self->_isTelephony)
        -[VCAudioStream handleWiFiToCelluarHandover](self, "handleWiFiToCelluarHandover");
    }
    else if (!a3 && self->_isTelephony)
    {
      -[VCAudioStream handleCellularToWiFiHandover](self, "handleCellularToWiFiHandover");
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioStream(Telephony) setJitterBufferMode:].cold.1();
  }
  VCMediaStream_Unlock((uint64_t)self);
}

- (BOOL)isVoLTERateAdaptationEnabled
{
  _BOOL4 v3;

  v3 = -[VCMediaStreamConfig isRateAdaptationEnabled](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "isRateAdaptationEnabled");
  if (v3)
  {
    v3 = +[VCAudioStream isVoLTE:](VCAudioStream, "isVoLTE:", -[VCMediaStreamConfig audioStreamMode](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "audioStreamMode"));
    if (v3)
    {
      v3 = +[VCPayloadUtils isEVSPayload:](VCPayloadUtils, "isEVSPayload:", -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload"));
      if (v3)
        LOBYTE(v3) = -[VCAudioPayloadConfig bitrate](-[VCAudioTransmitter currentAudioPayloadConfig](self->_audioTransmitter, "currentAudioPayloadConfig"), "bitrate") == 24400;
    }
  }
  return v3;
}

- (void)configureCellularFeatures
{
  uint64_t v3;
  __int128 v4;
  _OWORD v5[4];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  self->_anbrEnabled = -[VCMediaStreamConfig anbrEnabled](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "anbrEnabled");
  -[VCTransportSession setShouldSetupNWMonitor:](self->super._transportSession, "setShouldSetupNWMonitor:", 1);
  if (-[VCAudioStream isVoLTERateAdaptationEnabled](self, "isVoLTERateAdaptationEnabled") && !self->_anbrEnabled)
  {
    memset(v5, 0, sizeof(v5));
    v4 = 0u;
    v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stream_%ld"), self->super._streamToken);
    *((_QWORD *)&v4 + 1) = -[VCObject reportingAgent](self, "reportingAgent");
    LODWORD(v5[0]) = 1;
    -[VCTelephonyInterface setupVCMediaStreamRateAdaptationConfig:](self->_telephonyInterface, "setupVCMediaStreamRateAdaptationConfig:", (char *)v5 + 8);
    if (*((_QWORD *)&v5[0] + 1) == 1)
    {

      self->super._rateAdaptation = -[VCMediaStreamRateAdaptation initWithDelegate:params:]([VCMediaStreamRateAdaptation alloc], "initWithDelegate:params:", self, &v3);
      self->_uplinkRateAdaptationMaxAllowedBitrate = 24400;
    }
  }
}

- (void)notifyCodecModeChangeToCT:(_VCAudioCodecModeChangeEvent *)a3
{
  VCTelephonyInterface *telephonyInterface;
  _VCAudioCodecModeChangeEvent v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_isTelephony)
  {
    telephonyInterface = self->_telephonyInterface;
    v4 = *a3;
    -[VCTelephonyInterface notifyCodecModeChangeEventToCT:](telephonyInterface, "notifyCodecModeChangeEventToCT:", &v4);
  }
}

- (void)setRemoteCodecTypeAndSampleRate:(_VCAudioCodecModeChangeEvent *)a3
{
  -[VCAudioIO setRemoteCodecType:sampleRate:](self->_audioIO, "setRemoteCodecType:sampleRate:", +[VCPayloadUtils audioCodecTypeForPayload:](VCPayloadUtils, "audioCodecTypeForPayload:", a3->payload), (double)+[VCPayloadUtils sampleRateForCodecBandwidth:](VCPayloadUtils, "sampleRateForCodecBandwidth:", a3->codecBandwidth));
}

- (void)queryAnbrBitrate:(unsigned int)a3 forDirection:(int64_t)a4
{
  VCTelephonyInterface *telephonyInterface;
  _QWORD v5[6];
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  telephonyInterface = self->_telephonyInterface;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__VCAudioStream_Telephony__queryAnbrBitrate_forDirection___block_invoke;
  v5[3] = &unk_1E9E56708;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  -[VCTelephonyInterface queryAnbrBitrateRecommendation:direction:completionHandler:](telephonyInterface, "queryAnbrBitrateRecommendation:direction:completionHandler:", *(_QWORD *)&a3, a4, v5);
}

void __58__VCAudioStream_Telephony__queryAnbrBitrate_forDirection___block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BYTE v24[24];
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return;
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    v7 = *(_DWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 40);
    v17 = 136316418;
    v18 = v5;
    v19 = 2080;
    v20 = "-[VCAudioStream(Telephony) queryAnbrBitrate:forDirection:]_block_invoke";
    v21 = 1024;
    v22 = 119;
    v23 = 1024;
    *(_DWORD *)v24 = v7;
    *(_WORD *)&v24[4] = 2048;
    *(_QWORD *)&v24[6] = v8;
    *(_WORD *)&v24[14] = 2112;
    *(_QWORD *)&v24[16] = a2;
    v9 = " [%s] %s:%d Failed querying Telephony Interface for ANBR bitrate recommendation, bitrate=%u, direction=%ld, error=%@";
    v10 = v6;
    v11 = 54;
LABEL_13:
    _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v17, v11);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
  else
    v4 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v14 = *(_DWORD *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      v17 = 136316930;
      v18 = v12;
      v19 = 2080;
      v20 = "-[VCAudioStream(Telephony) queryAnbrBitrate:forDirection:]_block_invoke";
      v21 = 1024;
      v22 = 119;
      v23 = 2112;
      *(_QWORD *)v24 = v4;
      *(_WORD *)&v24[8] = 2048;
      *(_QWORD *)&v24[10] = v15;
      *(_WORD *)&v24[18] = 1024;
      *(_DWORD *)&v24[20] = v14;
      v25 = 2048;
      v26 = v16;
      v27 = 2112;
      v28 = a2;
      v9 = " [%s] %s:%d %@(%p) Failed querying Telephony Interface for ANBR bitrate recommendation, bitrate=%u, direction=%ld, error=%@";
      v10 = v13;
      v11 = 74;
      goto LABEL_13;
    }
  }
}

- (void)notifyCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3 didUpdateBandwidth:(BOOL)a4 didUpdateBitrate:(BOOL)a5
{
  _VCAudioCodecModeChangeEvent v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v7 = *a3;
    -[VCAudioStream setRemoteCodecTypeAndSampleRate:](self, "setRemoteCodecTypeAndSampleRate:", &v7, a4, a5);
  }
  else if (!a5)
  {
    return;
  }
  v7 = *a3;
  -[VCAudioStream notifyCodecModeChangeToCT:](self, "notifyCodecModeChangeToCT:", &v7);
}

- (void)handleCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3
{
  int64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  NSArray *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  unsigned int uplinkRateAdaptationMaxAllowedBitrate;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  int payload;
  NSArray *codecRateMode;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  NSArray *v28;
  unsigned int codecBitrate;
  _BYTE v30[24];
  int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  NSArray *v35;
  __int16 v36;
  unsigned int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", a3->payload);
  v6 = +[VCAudioStream isVoLTE:](VCAudioStream, "isVoLTE:", -[VCMediaStreamConfig audioStreamMode](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "audioStreamMode"));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStream(Telephony) handleCodecModeChangeEvent:].cold.1(v16, &a3->payload, v17);
    }
    return;
  }
  if (a3->codecRateMode == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    payload = a3->payload;
    codecRateMode = (NSArray *)a3->codecRateMode;
    *(_DWORD *)v30 = 136316162;
    *(_QWORD *)&v30[4] = v18;
    *(_WORD *)&v30[12] = 2080;
    *(_QWORD *)&v30[14] = "-[VCAudioStream(Telephony) handleCodecModeChangeEvent:]";
    *(_WORD *)&v30[22] = 1024;
    v31 = 140;
    v32 = 1024;
    v33 = payload;
    v34 = 2048;
    v35 = codecRateMode;
    v22 = " [%s] %s:%d codecRateMode is invalid for payload=%d, codecRateMode=%ld";
    v23 = v19;
    v24 = 44;
LABEL_30:
    _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v22, v30, v24);
    return;
  }
  v7 = v6;
  v8 = -[VCAudioPayloadConfig supportedBitrates](-[VCAudioPayload config](self->currentAudioPayload, "config"), "supportedBitrates");
  if (!-[NSArray containsObject:](v8, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->codecBitrate)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    v27 = a3->payload;
    v28 = -[VCAudioPayloadConfig supportedBitrates](-[VCAudioPayload config](self->currentAudioPayload, "config"), "supportedBitrates");
    codecBitrate = a3->codecBitrate;
    *(_DWORD *)v30 = 136316418;
    *(_QWORD *)&v30[4] = v25;
    *(_WORD *)&v30[12] = 2080;
    *(_QWORD *)&v30[14] = "-[VCAudioStream(Telephony) handleCodecModeChangeEvent:]";
    *(_WORD *)&v30[22] = 1024;
    v31 = 142;
    v32 = 1024;
    v33 = v27;
    v34 = 2112;
    v35 = v28;
    v36 = 1024;
    v37 = codecBitrate;
    v22 = " [%s] %s:%d Requested bitrate is not in the configurred bitrates: payload=%d, supportedBitrates=%@, bitrate=%d";
    v23 = v26;
    v24 = 50;
    goto LABEL_30;
  }
  if (v7 && self->_anbrActive && self->_anbrEnabled)
  {
    v9 = a3->codecBitrate;
    if (v9 > -[VCAudioPayload bitrate](self->currentAudioPayload, "bitrate"))
    {
      -[VCAudioStream queryAnbrBitrate:forDirection:](self, "queryAnbrBitrate:forDirection:", a3->codecBitrate, 1);
      return;
    }
  }
  *(_OWORD *)v30 = *(_OWORD *)&a3->payload;
  *(EVSRFParams *)&v30[16] = a3->RFParams;
  if (-[VCAudioStream handleUplinkBitrateChange:reason:](self, "handleUplinkBitrateChange:reason:", v30, 1)
    && +[VCPayloadUtils isEVSPayload:](VCPayloadUtils, "isEVSPayload:", a3->payload)
    && self->super._rateAdaptation)
  {
    if (VCPayloadUtils_AudioCodecRateModeForBitrate(a3->payload, -[VCAudioPayload bitrate](self->currentAudioPayload, "bitrate")) > 8)
    {
      self->_uplinkRateAdaptationMaxAllowedBitrate = -[VCAudioPayload bitrate](self->currentAudioPayload, "bitrate");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          uplinkRateAdaptationMaxAllowedBitrate = self->_uplinkRateAdaptationMaxAllowedBitrate;
          *(_DWORD *)v30 = 136315906;
          *(_QWORD *)&v30[4] = v14;
          *(_WORD *)&v30[12] = 2080;
          *(_QWORD *)&v30[14] = "-[VCAudioStream(Telephony) handleCodecModeChangeEvent:]";
          *(_WORD *)&v30[22] = 1024;
          v31 = 158;
          v32 = 1024;
          v33 = uplinkRateAdaptationMaxAllowedBitrate;
          v13 = " [%s] %s:%d Updated uplink rate adaptation max allowed bitrate=%d";
          goto LABEL_19;
        }
      }
    }
    else
    {
      -[VCMediaStreamRateAdaptation stop](self->super._rateAdaptation, "stop");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = -[VCAudioPayload bitrate](self->currentAudioPayload, "bitrate");
          *(_DWORD *)v30 = 136315906;
          *(_QWORD *)&v30[4] = v10;
          *(_WORD *)&v30[12] = 2080;
          *(_QWORD *)&v30[14] = "-[VCAudioStream(Telephony) handleCodecModeChangeEvent:]";
          *(_WORD *)&v30[22] = 1024;
          v31 = 155;
          v32 = 1024;
          v33 = v12;
          v13 = " [%s] %s:%d Disabling uplink rate adaptation due to EVS AMRWB-IO bitrate=%u";
LABEL_19:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v13, v30, 0x22u);
        }
      }
    }
  }
}

- (void)storeLastCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3
{
  __int128 v3;

  self->_cmrBitrateActive = 1;
  v3 = *(_OWORD *)&a3->payload;
  self->_lastCodecModeChangeEvent.RFParams = a3->RFParams;
  *(_OWORD *)&self->_lastCodecModeChangeEvent.payload = v3;
}

- (BOOL)handleUplinkBitrateChange:(_VCAudioCodecModeChangeEvent *)a3 reason:(unsigned __int8)a4
{
  int v4;
  VCAudioTransmitter *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  int payload;
  unsigned int codecBitrate;
  int codecBandwidth;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  unsigned int v20;
  int v21;
  __int16 v23;
  _BYTE buf[24];
  int v25;
  __int16 v26;
  _BYTE v27[10];
  VCAudioStream *v28;
  _BYTE v29[6];
  __int16 v30;
  int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  if (a4 != 4 && self->_basebandThermalMitigationsEnabled)
    goto LABEL_16;
  v7 = -[VCAudioStream audioTransmitter](self, "audioTransmitter");
  *(_OWORD *)buf = *(_OWORD *)&a3->payload;
  *(EVSRFParams *)&buf[16] = a3->RFParams;
  -[VCAudioTransmitter handleCodecModeChangeEvent:didUpdateBandwidth:didUpdateBitrate:](v7, "handleCodecModeChangeEvent:didUpdateBandwidth:didUpdateBitrate:", buf, &v23, (char *)&v23 + 1);
  *(_OWORD *)buf = *(_OWORD *)&a3->payload;
  *(EVSRFParams *)&buf[16] = a3->RFParams;
  -[VCAudioStream notifyCodecModeChangeEvent:didUpdateBandwidth:didUpdateBitrate:](self, "notifyCodecModeChangeEvent:didUpdateBandwidth:didUpdateBitrate:", buf, v23, HIBYTE(v23));
  if (HIBYTE(v23) | v23)
  {
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          payload = a3->payload;
          codecBandwidth = a3->codecBandwidth;
          codecBitrate = a3->codecBitrate;
          *(_DWORD *)buf = 136316674;
          *(_QWORD *)&buf[4] = v9;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAudioStream(Telephony) handleUplinkBitrateChange:reason:]";
          *(_WORD *)&buf[22] = 1024;
          v25 = 187;
          v26 = 1024;
          *(_DWORD *)v27 = v4;
          *(_WORD *)&v27[4] = 1024;
          *(_DWORD *)&v27[6] = payload;
          LOWORD(v28) = 1024;
          *(_DWORD *)((char *)&v28 + 2) = codecBitrate;
          HIWORD(v28) = 1024;
          *(_DWORD *)v29 = codecBandwidth;
          v14 = " [%s] %s:%d Bitrate adaptation performed: reason=%d, payload=%d, suggestedBitrate=%d, suggestedBandwidth=%d";
          v15 = v10;
          v16 = 52;
LABEL_14:
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v19 = a3->payload;
          v21 = a3->codecBandwidth;
          v20 = a3->codecBitrate;
          *(_DWORD *)buf = 136317186;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAudioStream(Telephony) handleUplinkBitrateChange:reason:]";
          *(_WORD *)&buf[22] = 1024;
          v25 = 187;
          v26 = 2112;
          *(_QWORD *)v27 = v8;
          *(_WORD *)&v27[8] = 2048;
          v28 = self;
          *(_WORD *)v29 = 1024;
          *(_DWORD *)&v29[2] = v4;
          v30 = 1024;
          v31 = v19;
          v32 = 1024;
          v33 = v20;
          v34 = 1024;
          v35 = v21;
          v14 = " [%s] %s:%d %@(%p) Bitrate adaptation performed: reason=%d, payload=%d, suggestedBitrate=%d, suggestedBandwidth=%d";
          v15 = v18;
          v16 = 72;
          goto LABEL_14;
        }
      }
    }
    if (v4 != 4)
    {
LABEL_16:
      *(_OWORD *)buf = *(_OWORD *)&a3->payload;
      *(EVSRFParams *)&buf[16] = a3->RFParams;
      -[VCAudioStream storeLastCodecModeChangeEvent:](self, "storeLastCodecModeChangeEvent:", buf);
    }
  }
  return HIBYTE(v23);
}

- (BOOL)getCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3 forCodecBitrate:(unsigned int)a4 payload:(int)a5
{
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v11)
        return v11;
      -[VCAudioStream(Telephony) getCodecModeChangeEvent:forCodecBitrate:payload:].cold.1();
    }
    goto LABEL_17;
  }
  if (!a4 || a5 == 128)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v11)
        return v11;
      v14 = -[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](self->_audioTransmitter, "currentAudioPayloadConfig"), "payload");
      v22 = 136316162;
      v23 = v12;
      v24 = 2080;
      v25 = "-[VCAudioStream(Telephony) getCodecModeChangeEvent:forCodecBitrate:payload:]";
      v26 = 1024;
      v27 = 201;
      v28 = 1024;
      v29 = v14;
      v30 = 1024;
      v31 = a4;
      v15 = " [%s] %s:%d Input parameter error payload=%d, codecBitrate=%u";
      v16 = v13;
      v17 = 40;
      goto LABEL_16;
    }
  }
  else
  {
    v9 = VCPayloadUtils_AudioCodecRateModeForBitrate(a5, a4);
    v10 = -[VCAudioStream selectCodecBandwidthForCodecRateMode:](self, "selectCodecBandwidthForCodecRateMode:", v9);
    if (+[VCPayloadUtils isCodecModeSupported:forBandwidth:withPayload:](VCPayloadUtils, "isCodecModeSupported:forBandwidth:withPayload:", v9, v10, -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload")))
    {
      a3->codecBandwidth = v10;
      a3->codecBitrate = a4;
      LOBYTE(v11) = 1;
      a3->payload = a5;
      a3->codecRateMode = v9;
      return v11;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v11)
        return v11;
      v20 = -[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](self->_audioTransmitter, "currentAudioPayloadConfig"), "payload");
      v22 = 136316674;
      v23 = v18;
      v24 = 2080;
      v25 = "-[VCAudioStream(Telephony) getCodecModeChangeEvent:forCodecBitrate:payload:]";
      v26 = 1024;
      v27 = 208;
      v28 = 1024;
      v29 = v20;
      v30 = 1024;
      v31 = a4;
      v32 = 1024;
      v33 = v9;
      v34 = 1024;
      v35 = v10;
      v15 = " [%s] %s:%d Codec Rate Mode and Codec Bandwidth selected are not supported for payload=%d, codecBitrate=%u, "
            "codecRateMode=%u, codecBandwidth=%u";
      v16 = v19;
      v17 = 52;
LABEL_16:
      _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v22, v17);
    }
  }
LABEL_17:
  LOBYTE(v11) = 0;
  return v11;
}

- (void)handleBasebandRateTrendSuggestion:(int)a3
{
  VCAudioTransmitter **p_audioTransmitter;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int codecBitrate;
  _BOOL4 v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v21;
  EVSRFParams RFParams;
  _BYTE buf[24];
  int v24;
  __int16 v25;
  _BYTE v26[10];
  VCAudioStream *v27;
  _BYTE v28[6];
  _BYTE v29[6];
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v21 = 0uLL;
  RFParams = 0;
  p_audioTransmitter = &self->_audioTransmitter;
  if (+[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", -[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](self->_audioTransmitter, "currentAudioPayloadConfig"), "payload")))
  {
    v6 = +[VCPayloadUtils allowedBitratesForPayload:supportedBitrates:supportedBandwidths:](VCPayloadUtils, "allowedBitratesForPayload:supportedBitrates:supportedBandwidths:", -[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](*p_audioTransmitter, "currentAudioPayloadConfig"), "payload"), -[VCAudioPayloadConfig supportedBitrates](-[VCAudioTransmitter currentAudioPayloadConfig](*p_audioTransmitter, "currentAudioPayloadConfig"), "supportedBitrates"), -[VCAudioPayloadConfig supportedBandwidths](-[VCAudioTransmitter currentAudioPayloadConfig](*p_audioTransmitter, "currentAudioPayloadConfig"), "supportedBandwidths"));
    v7 = v6;
    if (a3 == 0x80000000)
    {
      v8 = 0;
    }
    else
    {
      if (a3 != 0x7FFFFFFF)
      {
        v12 = 0;
        v21 = *(_OWORD *)&self->_lastCodecModeChangeEvent.payload;
        RFParams = self->_lastCodecModeChangeEvent.RFParams;
        goto LABEL_13;
      }
      v8 = objc_msgSend(v6, "count") - 1;
    }
    v9 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", v8), "intValue");
    v10 = v9;
    if (self->_cmrBitrateActive)
    {
      codecBitrate = self->_lastCodecModeChangeEvent.codecBitrate;
      if (v9 >= codecBitrate)
        v10 = codecBitrate;
      else
        v10 = v9;
    }
    v12 = 1;
    if (!-[VCAudioStream getCodecModeChangeEvent:forCodecBitrate:payload:](self, "getCodecModeChangeEvent:forCodecBitrate:payload:", &v21, v10, -[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](*p_audioTransmitter, "currentAudioPayloadConfig"), "payload")))goto LABEL_25;
LABEL_13:
    if ((VCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_24;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)buf = 136316930;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioStream(Telephony) handleBasebandRateTrendSuggestion:]";
      *(_WORD *)&buf[22] = 1024;
      v24 = 258;
      v25 = 1024;
      *(_DWORD *)v26 = v12;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = a3;
      LOWORD(v27) = 1024;
      *(_DWORD *)((char *)&v27 + 2) = v21;
      HIWORD(v27) = 1024;
      *(_DWORD *)v28 = HIDWORD(v21);
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)v29 = DWORD2(v21);
      v16 = " [%s] %s:%d Baseband Thermal Mitigations: enabled=%d suggestion=0x%08x, payload=%d, suggestedBitrate=%d, sug"
            "gestedBandwidth=%d";
      v17 = v15;
      v18 = 58;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_24;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)buf = 136317442;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioStream(Telephony) handleBasebandRateTrendSuggestion:]";
      *(_WORD *)&buf[22] = 1024;
      v24 = 258;
      v25 = 2112;
      *(_QWORD *)v26 = v13;
      *(_WORD *)&v26[8] = 2048;
      v27 = self;
      *(_WORD *)v28 = 1024;
      *(_DWORD *)&v28[2] = v12;
      *(_WORD *)v29 = 1024;
      *(_DWORD *)&v29[2] = a3;
      v30 = 1024;
      v31 = v21;
      v32 = 1024;
      v33 = HIDWORD(v21);
      v34 = 1024;
      v35 = DWORD2(v21);
      v16 = " [%s] %s:%d %@(%p) Baseband Thermal Mitigations: enabled=%d suggestion=0x%08x, payload=%d, suggestedBitrate="
            "%d, suggestedBandwidth=%d";
      v17 = v20;
      v18 = 78;
    }
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_24:
    *(_OWORD *)buf = v21;
    *(EVSRFParams *)&buf[16] = RFParams;
    -[VCAudioStream handleUplinkBitrateChange:reason:](self, "handleUplinkBitrateChange:reason:", buf, 4, (_QWORD)v21);
    goto LABEL_25;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioStream(Telephony) handleBasebandRateTrendSuggestion:].cold.1();
  }
  LOBYTE(v12) = 0;
LABEL_25:
  self->_basebandThermalMitigationsEnabled = v12;
}

- (void)handleUplinkANBR:(_VCAudioCodecModeChangeEvent *)a3
{
  _VCAudioCodecModeChangeEvent v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = *a3;
  -[VCAudioStream handleUplinkBitrateChange:reason:](self, "handleUplinkBitrateChange:reason:", &v3, 3);
}

- (void)handleDownlinkANBR:(_VCAudioCodecModeChangeEvent *)a3
{
  VCAudioTransmitter *v4;
  _VCAudioCodecModeChangeEvent v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = -[VCAudioStream audioTransmitter](self, "audioTransmitter");
  v5 = *a3;
  -[VCAudioTransmitter sendCodecModeChangeEvent:](v4, "sendCodecModeChangeEvent:", &v5);
}

- (int)selectCodecBandwidthForCodecRateMode:(int)a3
{
  uint64_t v3;
  void *v5;
  int64_t v6;
  NSEnumerator *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)VCPayloadUtils_DefaultAudioCodecBandwidthCodecForSampleRate(-[VCAudioPayloadConfig codecSampleRate](-[VCAudioTransmitter currentAudioPayloadConfig](self->_audioTransmitter, "currentAudioPayloadConfig"), "codecSampleRate"));
  v6 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", -[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](self->_audioTransmitter, "currentAudioPayloadConfig"), "payload"));
  if (!+[VCPayloadUtils isCodecModeSupported:forBandwidth:withPayload:](VCPayloadUtils, "isCodecModeSupported:forBandwidth:withPayload:", v3, v5, -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload")))
  {
    if (-[NSArray count](-[VCAudioPayloadConfig supportedBandwidths](-[VCAudioPayload config](self->currentAudioPayload, "config"), "supportedBandwidths"), "count"))
    {
      if (+[VCPayloadUtils supportsCodecBandwidthUpdateForCodecType:](VCPayloadUtils, "supportsCodecBandwidthUpdateForCodecType:", v6))
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v7 = -[NSArray reverseObjectEnumerator](-[VCAudioPayloadConfig supportedBandwidths](-[VCAudioPayload config](self->currentAudioPayload, "config"), "supportedBandwidths"), "reverseObjectEnumerator");
        v8 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
        if (v8)
        {
          v9 = v8;
          v13 = (int)v5;
          v10 = *(_QWORD *)v16;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v16 != v10)
                objc_enumerationMutation(v7);
              v5 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
              if (+[VCPayloadUtils isCodecModeSupported:forBandwidth:withPayload:](VCPayloadUtils, "isCodecModeSupported:forBandwidth:withPayload:", v3, objc_msgSend(v5, "unsignedIntValue"), -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload")))
              {
                LODWORD(v5) = objc_msgSend(v5, "unsignedIntValue");
                return (int)v5;
              }
            }
            v9 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
            if (v9)
              continue;
            break;
          }
          LODWORD(v5) = v13;
        }
      }
    }
  }
  return (int)v5;
}

- (void)handleANBR:(unsigned int)a3 forDirection:(int64_t)a4
{
  uint64_t v5;
  VCAudioTransmitter **p_audioTransmitter;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  int v17;
  unint64_t v18;
  _BYTE v19[12];
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v5 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  p_audioTransmitter = &self->_audioTransmitter;
  if (+[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", -[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](self->_audioTransmitter, "currentAudioPayloadConfig"), "payload")))
  {
    v8 = +[VCPayloadUtils codecRateModeForDesiredANBR:payload:supportedBitrates:supportedBandwidths:](VCPayloadUtils, "codecRateModeForDesiredANBR:payload:supportedBitrates:supportedBandwidths:", v5, -[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](*p_audioTransmitter, "currentAudioPayloadConfig"), "payload"), -[VCAudioPayloadConfig supportedBitrates](-[VCAudioTransmitter currentAudioPayloadConfig](*p_audioTransmitter, "currentAudioPayloadConfig"), "supportedBitrates"), -[VCAudioPayloadConfig supportedBandwidths](-[VCAudioTransmitter currentAudioPayloadConfig](*p_audioTransmitter, "currentAudioPayloadConfig"), "supportedBandwidths"));
    if ((_DWORD)v8 == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStream(Telephony) handleANBR:forDirection:].cold.2();
      }
    }
    else
    {
      v9 = v8;
      v10 = VCPayloadUtils_BitrateForAudioCodecRateMode(-[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](*p_audioTransmitter, "currentAudioPayloadConfig"), "payload"), v8);
      if (v10)
      {
        v11 = v10;
        v12 = -[VCAudioStream selectCodecBandwidthForCodecRateMode:](self, "selectCodecBandwidthForCodecRateMode:", v9);
        if (+[VCPayloadUtils isCodecModeSupported:forBandwidth:withPayload:](VCPayloadUtils, "isCodecModeSupported:forBandwidth:withPayload:", v9, v12, -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload")))
        {
          v13 = -[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](*p_audioTransmitter, "currentAudioPayloadConfig"), "payload");
          if (a4 == 2)
          {
            v17 = v13;
            v18 = __PAIR64__(v12, v9);
            *(_DWORD *)v19 = v11;
            *(_QWORD *)&v19[4] = 0;
            -[VCAudioStream handleDownlinkANBR:](self, "handleDownlinkANBR:", &v17);
          }
          else if (a4 == 1)
          {
            v17 = v13;
            v18 = __PAIR64__(v12, v9);
            *(_DWORD *)v19 = v11;
            *(_QWORD *)&v19[4] = 0;
            -[VCAudioStream handleUplinkANBR:](self, "handleUplinkANBR:", &v17);
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v16 = -[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](*p_audioTransmitter, "currentAudioPayloadConfig"), "payload");
            v17 = 136316674;
            v18 = v14;
            *(_WORD *)v19 = 2080;
            *(_QWORD *)&v19[2] = "-[VCAudioStream(Telephony) handleANBR:forDirection:]";
            *(_WORD *)&v19[10] = 1024;
            v20 = 310;
            v21 = 1024;
            v22 = v16;
            v23 = 1024;
            v24 = v11;
            v25 = 1024;
            v26 = v9;
            v27 = 1024;
            v28 = v12;
            _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d Codec Rate Mode and Codec Bandwidth selected are not supported for payload=%d, codecBitrate=%u, codecRateMode=%u, codecBandwidth=%u", (uint8_t *)&v17, 0x34u);
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStream(Telephony) handleANBR:forDirection:].cold.3();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioStream(Telephony) handleANBR:forDirection:].cold.1();
  }
}

- (void)telephonyInterface:(id)a3 anbrActivationUpdate:(BOOL)a4
{
  VCMediaStream_Lock((uint64_t)self);
  self->_anbrActive = a4;
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)telephonyInterface:(id)a3 anbrRecommendation:(unsigned int)a4 forDirection:(int64_t)a5
{
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 anbrEnabled;
  _BOOL4 anbrActive;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v6 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x1E0C80C00];
  VCMediaStream_Lock((uint64_t)self);
  if (self->_anbrEnabled)
  {
    -[VCAudioStream handleANBR:forDirection:](self, "handleANBR:forDirection:", v6, a5);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      anbrEnabled = self->_anbrEnabled;
      anbrActive = self->_anbrActive;
      v12 = 136316674;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCAudioStream(Telephony) telephonyInterface:anbrRecommendation:forDirection:]";
      v16 = 1024;
      v17 = 343;
      v18 = 1024;
      v19 = anbrEnabled;
      v20 = 1024;
      v21 = anbrActive;
      v22 = 1024;
      v23 = v6;
      v24 = 2048;
      v25 = a5;
      _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d Received a bitrate recommendation when ANBR is not enabled. anbrEnabled=%d, anbrActive=%d, bitrate=%u, direction=%ld", (uint8_t *)&v12, 0x38u);
    }
  }
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)rateAdaptation:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5
{
  unsigned int uplinkRateAdaptationMaxAllowedBitrate;
  VCMediaStreamRateAdaptation *rateAdaptation;
  uint64_t v10;
  unsigned int v11;
  VCAudioStream *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  unsigned int v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  const __CFString *v33;
  const __CFString *v34;
  uint64_t v35;
  NSObject *v36;
  VCMediaStreamRateAdaptation *v37;
  _BOOL4 anbrEnabled;
  const __CFString *v39;
  uint64_t v40;
  NSObject *v41;
  VCMediaStreamRateAdaptation *v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  unsigned int v47;
  uint64_t v48;
  NSObject *v49;
  unsigned int v50;
  _BYTE v51[24];
  __int128 v52;
  VCAudioStream *v53;
  _BYTE v54[24];
  uint64_t v55;

  uplinkRateAdaptationMaxAllowedBitrate = a4;
  v55 = *MEMORY[0x1E0C80C00];
  -[VCMediaStream lock](self, "lock", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  rateAdaptation = self->super._rateAdaptation;
  if (rateAdaptation)
  {
    if (rateAdaptation == a3 && !self->_anbrEnabled)
    {
      v10 = -[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](self->_audioTransmitter, "currentAudioPayloadConfig"), "payload");
      if (+[VCPayloadUtils isEVSPayload:](VCPayloadUtils, "isEVSPayload:", v10)
        && +[VCAudioStream isVoLTE:](VCAudioStream, "isVoLTE:", -[VCMediaStreamConfig audioStreamMode](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "audioStreamMode")))
      {
        if (uplinkRateAdaptationMaxAllowedBitrate == 13200 || uplinkRateAdaptationMaxAllowedBitrate == 24400)
        {
          if (self->_uplinkRateAdaptationMaxAllowedBitrate < uplinkRateAdaptationMaxAllowedBitrate)
            uplinkRateAdaptationMaxAllowedBitrate = self->_uplinkRateAdaptationMaxAllowedBitrate;
          v11 = -[VCAudioPayload bitrate](self->currentAudioPayload, "bitrate");
          v12 = (VCAudioStream *)objc_opt_class();
          if (v11 == uplinkRateAdaptationMaxAllowedBitrate)
          {
            if (v12 == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                v45 = VRTraceErrorLogLevelToCSTR();
                v46 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                {
                  v47 = self->_uplinkRateAdaptationMaxAllowedBitrate;
                  *(_DWORD *)v51 = 136316162;
                  *(_QWORD *)&v51[4] = v45;
                  *(_WORD *)&v51[12] = 2080;
                  *(_QWORD *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
                  *(_WORD *)&v51[22] = 1024;
                  LODWORD(v52) = 358;
                  WORD2(v52) = 1024;
                  *(_DWORD *)((char *)&v52 + 6) = uplinkRateAdaptationMaxAllowedBitrate;
                  WORD5(v52) = 1024;
                  HIDWORD(v52) = v47;
                  v30 = " [%s] %s:%d Current and target bitrates are same uplinkTargetBitrate=%d maxAllowedBitrate=%d";
                  v31 = v46;
                  v32 = 40;
                  goto LABEL_38;
                }
              }
            }
            else
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v39 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
              else
                v39 = &stru_1E9E58EE0;
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                v48 = VRTraceErrorLogLevelToCSTR();
                v49 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                {
                  v50 = self->_uplinkRateAdaptationMaxAllowedBitrate;
                  *(_DWORD *)v51 = 136316674;
                  *(_QWORD *)&v51[4] = v48;
                  *(_WORD *)&v51[12] = 2080;
                  *(_QWORD *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
                  *(_WORD *)&v51[22] = 1024;
                  LODWORD(v52) = 358;
                  WORD2(v52) = 2112;
                  *(_QWORD *)((char *)&v52 + 6) = v39;
                  HIWORD(v52) = 2048;
                  v53 = self;
                  *(_WORD *)v54 = 1024;
                  *(_DWORD *)&v54[2] = uplinkRateAdaptationMaxAllowedBitrate;
                  *(_WORD *)&v54[6] = 1024;
                  *(_DWORD *)&v54[8] = v50;
                  v30 = " [%s] %s:%d %@(%p) Current and target bitrates are same uplinkTargetBitrate=%d maxAllowedBitrate=%d";
                  v31 = v49;
                  v32 = 60;
                  goto LABEL_38;
                }
              }
            }
            goto LABEL_29;
          }
          if (v12 == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 6)
              goto LABEL_28;
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              goto LABEL_28;
            v17 = -[VCAudioPayload bitrate](self->currentAudioPayload, "bitrate");
            v18 = self->_uplinkRateAdaptationMaxAllowedBitrate;
            *(_DWORD *)v51 = 136316418;
            *(_QWORD *)&v51[4] = v15;
            *(_WORD *)&v51[12] = 2080;
            *(_QWORD *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
            *(_WORD *)&v51[22] = 1024;
            LODWORD(v52) = 359;
            WORD2(v52) = 1024;
            *(_DWORD *)((char *)&v52 + 6) = v17;
            WORD5(v52) = 1024;
            HIDWORD(v52) = v18;
            LOWORD(v53) = 1024;
            *(_DWORD *)((char *)&v53 + 2) = uplinkRateAdaptationMaxAllowedBitrate;
            v19 = " [%s] %s:%d Applying uplink rate adaptation recommendation currentBitrate=%u maxAllowedBitrate=%d upli"
                  "nkTargetBitrate=%d";
            v20 = v16;
            v21 = 46;
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v13 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v13 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 6)
              goto LABEL_28;
            v22 = VRTraceErrorLogLevelToCSTR();
            v23 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              goto LABEL_28;
            v24 = -[VCAudioPayload bitrate](self->currentAudioPayload, "bitrate");
            v25 = self->_uplinkRateAdaptationMaxAllowedBitrate;
            *(_DWORD *)v51 = 136316930;
            *(_QWORD *)&v51[4] = v22;
            *(_WORD *)&v51[12] = 2080;
            *(_QWORD *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
            *(_WORD *)&v51[22] = 1024;
            LODWORD(v52) = 359;
            WORD2(v52) = 2112;
            *(_QWORD *)((char *)&v52 + 6) = v13;
            HIWORD(v52) = 2048;
            v53 = self;
            *(_WORD *)v54 = 1024;
            *(_DWORD *)&v54[2] = v24;
            *(_WORD *)&v54[6] = 1024;
            *(_DWORD *)&v54[8] = v25;
            *(_WORD *)&v54[12] = 1024;
            *(_DWORD *)&v54[14] = uplinkRateAdaptationMaxAllowedBitrate;
            v19 = " [%s] %s:%d %@(%p) Applying uplink rate adaptation recommendation currentBitrate=%u maxAllowedBitrate="
                  "%d uplinkTargetBitrate=%d";
            v20 = v23;
            v21 = 66;
          }
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, v51, v21);
LABEL_28:
          v26 = VCPayloadUtils_AudioCodecRateModeForBitrate(v10, uplinkRateAdaptationMaxAllowedBitrate);
          v27 = -[VCAudioPayload bandwidth](self->currentAudioPayload, "bandwidth");
          *(_DWORD *)v51 = v10;
          *(_DWORD *)&v51[4] = v26;
          *(_DWORD *)&v51[8] = v27;
          *(_DWORD *)&v51[12] = uplinkRateAdaptationMaxAllowedBitrate;
          *(_QWORD *)&v51[16] = 0;
          -[VCAudioStream handleUplinkBitrateChange:reason:](self, "handleUplinkBitrateChange:reason:", v51, 2);
          goto LABEL_29;
        }
        if ((VCAudioStream *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:].cold.1();
          }
          goto LABEL_29;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v14 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v14 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_29;
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_29;
        *(_DWORD *)v51 = 136316418;
        *(_QWORD *)&v51[4] = v28;
        *(_WORD *)&v51[12] = 2080;
        *(_QWORD *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
        *(_WORD *)&v51[22] = 1024;
        LODWORD(v52) = 356;
        WORD2(v52) = 2112;
        *(_QWORD *)((char *)&v52 + 6) = v14;
        HIWORD(v52) = 2048;
        v53 = self;
        *(_WORD *)v54 = 1024;
        *(_DWORD *)&v54[2] = uplinkRateAdaptationMaxAllowedBitrate;
        v30 = " [%s] %s:%d %@(%p) Target bitrate change not supported targetBitrate=%d";
      }
      else
      {
        if ((VCAudioStream *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:].cold.2();
          }
          goto LABEL_29;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v34 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v34 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_29;
        v44 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_29;
        *(_DWORD *)v51 = 136316418;
        *(_QWORD *)&v51[4] = v44;
        *(_WORD *)&v51[12] = 2080;
        *(_QWORD *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
        *(_WORD *)&v51[22] = 1024;
        LODWORD(v52) = 355;
        WORD2(v52) = 2112;
        *(_QWORD *)((char *)&v52 + 6) = v34;
        HIWORD(v52) = 2048;
        v53 = self;
        *(_WORD *)v54 = 1024;
        *(_DWORD *)&v54[2] = v10;
        v30 = " [%s] %s:%d %@(%p) Bitrate adaptation not supported payload=%d";
      }
      v31 = v29;
      v32 = 54;
      goto LABEL_38;
    }
  }
  if ((VCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_29;
    v35 = VRTraceErrorLogLevelToCSTR();
    v36 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v37 = self->super._rateAdaptation;
    anbrEnabled = self->_anbrEnabled;
    *(_DWORD *)v51 = 136316162;
    *(_QWORD *)&v51[4] = v35;
    *(_WORD *)&v51[12] = 2080;
    *(_QWORD *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
    *(_WORD *)&v51[22] = 1024;
    LODWORD(v52) = 353;
    WORD2(v52) = 2112;
    *(_QWORD *)((char *)&v52 + 6) = v37;
    HIWORD(v52) = 1024;
    LODWORD(v53) = anbrEnabled;
    v30 = " [%s] %s:%d Received unexpected bitrate change _rateAdaptation=%@, anbrEnabled=%d";
    v31 = v36;
    v32 = 44;
LABEL_38:
    _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, v30, v51, v32);
    goto LABEL_29;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v33 = (const __CFString *)-[VCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v33 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v40 = VRTraceErrorLogLevelToCSTR();
    v41 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v42 = self->super._rateAdaptation;
      v43 = self->_anbrEnabled;
      *(_DWORD *)v51 = 136316674;
      *(_QWORD *)&v51[4] = v40;
      *(_WORD *)&v51[12] = 2080;
      *(_QWORD *)&v51[14] = "-[VCAudioStream(Telephony) rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
      *(_WORD *)&v51[22] = 1024;
      LODWORD(v52) = 353;
      WORD2(v52) = 2112;
      *(_QWORD *)((char *)&v52 + 6) = v33;
      HIWORD(v52) = 2048;
      v53 = self;
      *(_WORD *)v54 = 2112;
      *(_QWORD *)&v54[2] = v42;
      *(_WORD *)&v54[10] = 1024;
      *(_DWORD *)&v54[12] = v43;
      v30 = " [%s] %s:%d %@(%p) Received unexpected bitrate change _rateAdaptation=%@, anbrEnabled=%d";
      v31 = v41;
      v32 = 64;
      goto LABEL_38;
    }
  }
LABEL_29:
  -[VCMediaStream unlock](self, "unlock", *(_OWORD *)v51, *(_QWORD *)&v51[16], v52, v53, *(_OWORD *)v54, *(_QWORD *)&v54[16]);
}

- (void)generateRTCPXRVoIPMetricsReports:reportCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d audio receiver is not ready", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startAudioWithCompletionHandler:.cold.1()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCAudioStream startAudioWithCompletionHandler:]";
  OUTLINED_FUNCTION_4();
  v4 = 660;
  v5 = v0;
  v6 = 660;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioStream.m:%d: Benign Error (possibly not): We started audio before we negotiated our codec.", v2, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)setupPayloads
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d No Audio Payloads, returning false", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getCodecConfigForPayload:block:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to retrieve codec config.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)audioIOTypeForMode:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "+[VCAudioStream audioIOTypeForMode:]";
  OUTLINED_FUNCTION_4();
  v5 = 874;
  v6 = v0;
  v7 = v1;
  v8 = v0;
  v9 = 0;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d Invalid audioStreamMode=%d defaulting to VCAudioIOAudioType=%d", v3, 0x28u);
  OUTLINED_FUNCTION_3();
}

- (void)setReceiverPayloads
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to setup receiver decoders.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)operatingModeForAudioStreamMode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCAudioStream operatingModeForAudioStreamMode:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Invalid mode=%ld", v2, *(const char **)v3, (unint64_t)"+[VCAudioStream operatingModeForAudioStreamMode:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setDeviceRoleForAudioStreamMode:direction:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioStream setDeviceRoleForAudioStreamMode:direction:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Invalid mode=%ld", v2, *(const char **)v3, (unint64_t)"-[VCAudioStream setDeviceRoleForAudioStreamMode:direction:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupCaptionsCoordinatorsWithFormat:direction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to allocate the captions coordinator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamWithClientPid:enableAudioPowerSpectrum:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to allocate audio payloads", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamWithClientPid:enableAudioPowerSpectrum:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to allocate the DTMF event handler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createAudioReceiver
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioStream createAudioReceiver]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d VCAudioStream[%p] Failed to set audio receiver payloads", v2, *(const char **)v3, (unint64_t)"-[VCAudioStream createAudioReceiver]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)createAudioTransmitter:streamIDs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioStream createAudioTransmitter:streamIDs:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d VCAudioStream[%p] Failed to create the audio transmitter", v2, *(const char **)v3, (unint64_t)"-[VCAudioStream createAudioTransmitter:streamIDs:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)validateAudioStreamConfigurations:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d The VCMediaStreamConfig array is empty!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupSourceTransport:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to allocate source transport", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupSourceTransport:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to insert source transport", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createTransportWithStreamConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to create RTP handle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createTransportWithStreamConfig:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to create RTP extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createTransportWithStreamConfig:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to setup the transport", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)cleanupBeforeReconfigure:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Reconfiguring VCAudioStream with a different number of transports.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to create telephony interface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to create transport", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Failed to configure transport for streamConfig=%p", v2, *(const char **)v3, (unint64_t)"-[VCAudioStream onConfigureStreamWithConfiguration:error:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.4()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCAudioStream onConfigureStreamWithConfiguration:error:]";
  v3 = 1024;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_1(&dword_1D8A54000, v0, (uint64_t)v0, "VCAudioStream [%s] %s:%d Failed to configure transport for streamConfig=%p", v1);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:(NSObject *)a3 error:.cold.5(uint64_t a1, id *a2, NSObject *a3)
{
  uint8_t v4[40];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (*a2)
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11_2();
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, "VCAudioStream [%s] %s:%d error[%s]", v4, 0x26u);
  OUTLINED_FUNCTION_3_0();
}

- (void)onConfigureStreamWithConfiguration:(NSObject *)a3 error:.cold.6(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[40];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*a2)
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_14_1(&dword_1D8A54000, a3, v4, "VCAudioStream [%s] %s:%d error[%s]", v5);
  OUTLINED_FUNCTION_3_0();
}

void __46__VCAudioStream_onPauseWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d VCAudioStream[%p] setPauseAudio: error pausing audio", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __47__VCAudioStream_onResumeWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d VCAudioStream[%p] setPauseAudio: error unpausing audio", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setTargetStreamID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCAudioStream setTargetStreamID:]";
  OUTLINED_FUNCTION_4();
  v4 = 2756;
  v5 = 2112;
  v6 = v0;
  _os_log_debug_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_DEBUG, "VCAudioStream [%s] %s:%d TargetStreamID didn't change %@", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

void __37__VCAudioStream_setupReportingAgent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Reporting not available (no backends)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateCodecPayloadAndBitrateForStartEvent:bitrate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Payload is null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateCodecPayloadAndBitrateForStartEvent:bitrate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Bitrate is null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getConnectionTypeForStreamMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Unexpected mode VCAudioStreamModeInvalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addSyncSourceDelegate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioStream addSyncSourceDelegate:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d CMSimpleQueueEnqueue enqueue failed with error=%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioStream addSyncSourceDelegate:]" >> 16, 3281);
  OUTLINED_FUNCTION_3();
}

- (void)removeSyncSourceDelegate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioStream removeSyncSourceDelegate:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d CMSimpleQueueEnqueue enqueue failed with error=%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioStream removeSyncSourceDelegate:]" >> 16, 3306);
  OUTLINED_FUNCTION_3();
}

- (void)didUpdateBasebandCodec:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCAudioStream [%s] %s:%d Unexpected SPI call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
