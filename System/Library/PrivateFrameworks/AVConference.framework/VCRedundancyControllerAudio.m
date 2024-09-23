@implementation VCRedundancyControllerAudio

- (VCRedundancyControllerAudio)initWithDelegate:(id)a3 statisticsCollector:(id)a4 mode:(unsigned int)a5
{
  VCRedundancyControllerAudio *v8;
  VCRedundancyControllerAudio *v9;
  AVCStatisticsCollector *v10;
  VCRedundancyControlAlgorithmAudio *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  char v16;
  AVCStatisticsCollector *statisticsCollector;
  uint64_t v18;
  uint64_t networkStatisticsType;
  int v20;
  AVCStatisticsCollector *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  objc_super v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)VCRedundancyControllerAudio;
  v8 = -[VCRedundancyControllerAudio init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_redundancyControllerDelegate, a3);
    v10 = (AVCStatisticsCollector *)a4;
    v9->_mode = a5;
    v9->_statisticsCollector = v10;
    v9->_networkStatisticsType = 0;
    switch(a5)
    {
      case 0u:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v27 = v14;
            v28 = 2080;
            v29 = "-[VCRedundancyControllerAudio initWithDelegate:statisticsCollector:mode:]";
            v30 = 1024;
            v31 = 55;
            _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio redundancy is disabled.", buf, 0x1Cu);
          }
        }
        goto LABEL_11;
      case 1u:
        v9->_algorithm = (VCRedundancyControlAlgorithm *)objc_alloc_init(VCRedundancyControlAlgorithmAudioLegacy);
        v9->_networkStatisticsType = 3;
        goto LABEL_11;
      case 2u:
      case 3u:
        v11 = -[VCRedundancyControlAlgorithmAudio initWithMode:]([VCRedundancyControlAlgorithmAudio alloc], "initWithMode:", v9->_mode);
        goto LABEL_13;
      case 4u:
        v11 = objc_alloc_init(VCRedundancyControlAlgorithmAudioMultiWay);
LABEL_13:
        v16 = 0;
        v9->_algorithm = (VCRedundancyControlAlgorithm *)v11;
        v9->_networkStatisticsType = 3;
        break;
      default:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCRedundancyControllerAudio initWithDelegate:statisticsCollector:mode:].cold.1(v12, (int *)&v9->_mode, v13);
        }
LABEL_11:
        v16 = 1;
        break;
    }
    statisticsCollector = v9->_statisticsCollector;
    v18 = MEMORY[0x1E0C809B0];
    networkStatisticsType = v9->_networkStatisticsType;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __73__VCRedundancyControllerAudio_initWithDelegate_statisticsCollector_mode___block_invoke;
    v24[3] = &unk_1E9E523A0;
    v24[4] = v9;
    v9->_statisticRegistrationIndexNetwork = -[AVCStatisticsCollector registerStatisticsChangeHandlerWithType:handler:](statisticsCollector, "registerStatisticsChangeHandlerWithType:handler:", networkStatisticsType, v24);
    v20 = _os_feature_enabled_impl();
    v9->_isNWConnectionEnabled = v20;
    v9->_statisticRegistrationIndexNWConnection = -1;
    if ((v16 & 1) == 0 && v20)
    {
      v21 = v9->_statisticsCollector;
      v23[0] = v18;
      v23[1] = 3221225472;
      v23[2] = __73__VCRedundancyControllerAudio_initWithDelegate_statisticsCollector_mode___block_invoke_2;
      v23[3] = &unk_1E9E523A0;
      v23[4] = v9;
      v9->_statisticRegistrationIndexNWConnection = -[AVCStatisticsCollector registerStatisticsChangeHandlerWithType:handler:](v21, "registerStatisticsChangeHandlerWithType:handler:", 11, v23);
    }
  }
  return v9;
}

uint64_t __73__VCRedundancyControllerAudio_initWithDelegate_statisticsCollector_mode___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[12];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v3;
  v11 = *(_QWORD *)(a2 + 192);
  v4 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v4;
  v5 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v5;
  v6 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v6;
  v7 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v7;
  v8 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v8;
  return objc_msgSend(v2, "updateRedundancyStrategyWithNetworkStatistics:", v10);
}

uint64_t __73__VCRedundancyControllerAudio_initWithDelegate_statisticsCollector_mode___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[12];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v3;
  v11 = *(_QWORD *)(a2 + 192);
  v4 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v4;
  v5 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v5;
  v6 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v6;
  v7 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v7;
  v8 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v8;
  return objc_msgSend(v2, "updateRedundancyStrategyWithNetworkStatistics:", v10);
}

- (void)unregisterStatistics
{
  -[AVCStatisticsCollector unregisterStatisticsChangeHandlerWithType:handlerIndex:](self->_statisticsCollector, "unregisterStatisticsChangeHandlerWithType:handlerIndex:", self->_networkStatisticsType, self->_statisticRegistrationIndexNetwork);
  if ((self->_statisticRegistrationIndexNWConnection & 0x80000000) == 0)
    -[AVCStatisticsCollector unregisterStatisticsChangeHandlerWithType:handlerIndex:](self->_statisticsCollector, "unregisterStatisticsChangeHandlerWithType:handlerIndex:", 11);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_redundancyControllerDelegate, 0);

  v3.receiver = self;
  v3.super_class = (Class)VCRedundancyControllerAudio;
  -[VCRedundancyControllerAudio dealloc](&v3, sel_dealloc);
}

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  VCRedundancyControlAlgorithm *algorithm;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  _OWORD v12[12];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  algorithm = self->_algorithm;
  v5 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
  v12[10] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
  v12[11] = v5;
  v13 = *((_QWORD *)&a3->var0.localRCEvent + 21);
  v6 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
  v12[6] = *(_OWORD *)(&a3->var0.localRCEvent + 3);
  v12[7] = v6;
  v7 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
  v12[8] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
  v12[9] = v7;
  v8 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
  v12[2] = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
  v12[3] = v8;
  v9 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
  v12[4] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
  v12[5] = v9;
  v10 = *(_OWORD *)&a3->isVCRCInternal;
  v12[0] = *(_OWORD *)&a3->type;
  v12[1] = v10;
  -[VCRedundancyControlAlgorithm updateRedundancyStrategyWithNetworkStatistics:](algorithm, "updateRedundancyStrategyWithNetworkStatistics:", v12);
  v11 = -[VCRedundancyControlAlgorithm redundancyPercentage](self->_algorithm, "redundancyPercentage");
  -[VCRedundancyControlAlgorithm redundancyInterval](self->_algorithm, "redundancyInterval");
  -[VCRedundancyControllerAudio reportRedundancyPercentage:redundancyInterval:](self, "reportRedundancyPercentage:redundancyInterval:", v11);
}

- (void)reportRedundancyPercentage:(unsigned int)a3 redundancyInterval:(double)a4
{
  uint64_t IntValueForKey;
  double v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int currentRedundancyPercentage;
  unsigned int mode;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  double currentRedundancyInterval;
  unsigned int v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BYTE v25[10];
  double v26;
  VCRedundancyControllerAudio *v27;
  VCRedundancyControllerAudio *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("forceAudioRedundancyPercentage"), *(uint64_t *)&a3);
  v7 = (double)(int)VCDefaults_GetIntValueForKey(CFSTR("forceAudioRedundancyInterval"), (int)a4);
  if (self->_currentRedundancyPercentage != (_DWORD)IntValueForKey)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        currentRedundancyPercentage = self->_currentRedundancyPercentage;
        mode = self->_mode;
        v18 = 136316674;
        v19 = v8;
        v20 = 2080;
        v21 = "-[VCRedundancyControllerAudio reportRedundancyPercentage:redundancyInterval:]";
        v22 = 1024;
        v23 = 104;
        v24 = 1024;
        *(_DWORD *)v25 = currentRedundancyPercentage;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&v25[6] = IntValueForKey;
        LOWORD(v26) = 1024;
        *(_DWORD *)((char *)&v26 + 2) = mode;
        HIWORD(v26) = 2048;
        v27 = self;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio redundancy percentage changed from %d to %d with mode %d, 0x%p", (uint8_t *)&v18, 0x38u);
      }
    }
    self->_currentRedundancyPercentage = IntValueForKey;
    v12 = (void *)MEMORY[0x1DF086F1C](&self->_redundancyControllerDelegate);
    objc_msgSend(v12, "redundancyController:redundancyPercentageDidChange:", self, IntValueForKey);
    if (v12)
      CFRelease(v12);
  }
  if (self->_currentRedundancyInterval != v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        currentRedundancyInterval = self->_currentRedundancyInterval;
        v16 = self->_mode;
        v18 = 136316674;
        v19 = v13;
        v20 = 2080;
        v21 = "-[VCRedundancyControllerAudio reportRedundancyPercentage:redundancyInterval:]";
        v22 = 1024;
        v23 = 112;
        v24 = 2048;
        *(double *)v25 = currentRedundancyInterval;
        *(_WORD *)&v25[8] = 2048;
        v26 = v7;
        LOWORD(v27) = 1024;
        *(_DWORD *)((char *)&v27 + 2) = v16;
        HIWORD(v27) = 2048;
        v28 = self;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio redundancy interval changed from %f to %f with mode %d, 0x%p", (uint8_t *)&v18, 0x40u);
      }
    }
    self->_currentRedundancyInterval = v7;
    v17 = (void *)MEMORY[0x1DF086F1C](&self->_redundancyControllerDelegate);
    objc_msgSend(v17, "redundancyController:redundancyIntervalDidChange:", self, v7);
    if (v17)
      CFRelease(v17);
  }
}

- (void)initWithDelegate:(uint64_t)a1 statisticsCollector:(int *)a2 mode:(os_log_t)log .cold.1(uint64_t a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCRedundancyControllerAudio initWithDelegate:statisticsCollector:mode:]";
  v8 = 1024;
  v9 = 58;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d In-appropriate mode %d for VCRedundancyController", (uint8_t *)&v4, 0x22u);
}

@end
