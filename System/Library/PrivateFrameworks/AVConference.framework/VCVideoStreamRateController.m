@implementation VCVideoStreamRateController

- (VCVideoStreamRateController)initWithDumpID:(unsigned int)a3
{
  uint64_t v3;
  VCVideoStreamRateController *v4;
  VCVideoStreamRateController *v5;
  int algorithm;
  __objc2_class *v7;
  NSObject *CustomRootQueue;
  uint64_t v10;
  NSObject *v11;
  objc_super v12;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCVideoStreamRateController;
  v4 = -[VCVideoStreamRateController init](&v12, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  v4->_minBitrate = 10000;
  v4->_maxBitrate = 1949000;
  *(_QWORD *)&v4->_algorithm = 0x1A00000002;
  algorithm = -[VCDefaults videoStreamRateControlAlgorithm](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "videoStreamRateControlAlgorithm");
  if (algorithm < 0)
    algorithm = v5->_algorithm;
  else
    v5->_algorithm = algorithm;
  if (algorithm == 2)
  {
    v7 = VCVideoStreamNOWRDLossEventRateControl;
  }
  else if (algorithm == 1)
  {
    v7 = VCVideoStreamOWRDLossEventRateControl;
  }
  else
  {
    if (algorithm)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoStreamRateController initWithDumpID:].cold.1(v10, v11);
      }
      goto LABEL_12;
    }
    v7 = VCVideoStreamRTTPLRRateControl;
  }
  v5->_rateControl = (VCVideoStreamRateControlProtocol *)objc_alloc_init(v7);
LABEL_12:
  if (-[VCDefaults videoStreamRateControlDumpEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "videoStreamRateControlDumpEnabled"))
  {
    -[VCVideoStreamRateController createLogDumpFile:](v5, "createLogDumpFile:", v3);
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v5->_videoStreamRateControllerQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoStreamRateController.videoStreamRateControllerQueue", 0, CustomRootQueue);
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCVideoStreamRateController releaseLogDumpFile](self, "releaseLogDumpFile");

  dispatch_release((dispatch_object_t)self->_videoStreamRateControllerQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCVideoStreamRateController;
  -[VCVideoStreamRateController dealloc](&v3, sel_dealloc);
}

- (void)setMaxTargetBitrate:(unsigned int)a3 minTargetBitrate:(unsigned int)a4
{
  NSObject *videoStreamRateControllerQueue;
  _QWORD block[5];
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  videoStreamRateControllerQueue = self->_videoStreamRateControllerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VCVideoStreamRateController_setMaxTargetBitrate_minTargetBitrate___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  v6 = a4;
  v7 = a3;
  dispatch_sync(videoStreamRateControllerQueue, block);
}

uint64_t __68__VCVideoStreamRateController_setMaxTargetBitrate_minTargetBitrate___block_invoke(uint64_t a1)
{
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 22) = objc_msgSend(*(id *)(a1 + 32), "minTierIndex:", *(unsigned int *)(a1 + 40));
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 20) = objc_msgSend(*(id *)(a1 + 32), "maxTierIndex:", *(unsigned int *)(a1 + 44));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = g_adwTxRateTiers[*(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 22)];
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = g_adwTxRateTiers[*(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 20)];
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMaxTierIndex:minTierIndex:", *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 20), *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 22));
}

- (void)setRateControlInterval:(double)a3
{
  NSObject *videoStreamRateControllerQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  videoStreamRateControllerQueue = self->_videoStreamRateControllerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCVideoStreamRateController_setRateControlInterval___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  *(double *)&block[5] = a3;
  dispatch_sync(videoStreamRateControllerQueue, block);
}

uint64_t __54__VCVideoStreamRateController_setRateControlInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRateControlInterval:", *(double *)(a1 + 40));
}

- (void)doRateControlWithTime:(double)a3 roundTripTime:(double)a4 packetLossRate:(double)a5 operatingBitrate:(unsigned int)a6 averageReceivedBitrate:(unsigned int)a7
{
  NSObject *videoStreamRateControllerQueue;
  _QWORD v8[8];
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  videoStreamRateControllerQueue = self->_videoStreamRateControllerQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __122__VCVideoStreamRateController_doRateControlWithTime_roundTripTime_packetLossRate_operatingBitrate_averageReceivedBitrate___block_invoke;
  v8[3] = &unk_1E9E56898;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  *(double *)&v8[6] = a4;
  *(double *)&v8[7] = a5;
  v9 = a6;
  v10 = a7;
  dispatch_sync(videoStreamRateControllerQueue, v8);
}

void __122__VCVideoStreamRateController_doRateControlWithTime_roundTripTime_packetLossRate_operatingBitrate_averageReceivedBitrate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 40);
  if (v3 != 0.0)
  {
    v4 = *(double *)(a1 + 40);
    if (v4 > v3)
    {
      objc_msgSend((id)v2, "updateAverageTargetBitrate:interval:", *(unsigned int *)(v2 + 36), v4 - v3);
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_QWORD *)(v2 + 40) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setOperatingTierIndexWithBitrate:", *(unsigned int *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "doRateControlWithTime:roundTripTime:packetLossRate:operatingTierIndex:averageReceivedBitrate:", *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(a1 + 68), *(double *)(*(_QWORD *)(a1 + 32) + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "targetBitrate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "className"), "UTF8String");
      v8 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "description"), "UTF8String");
      v9 = *(_QWORD *)(a1 + 32);
      v10 = g_adwTxRateTiers[*(unsigned __int16 *)(v9 + 24)];
      v12 = *(_DWORD *)(v9 + 28);
      v11 = *(_DWORD *)(v9 + 32);
      LODWORD(v9) = *(_DWORD *)(v9 + 36);
      v13 = *(_DWORD *)(a1 + 68);
      v14 = 136317442;
      v15 = v5;
      v16 = 2080;
      v17 = "-[VCVideoStreamRateController doRateControlWithTime:roundTripTime:packetLossRate:operatingBitrate:averageRec"
            "eivedBitrate:]_block_invoke";
      v18 = 1024;
      v19 = 126;
      v20 = 2080;
      v21 = v7;
      v22 = 2080;
      v23 = v8;
      v24 = 1024;
      v25 = v11;
      v26 = 1024;
      v27 = v12;
      v28 = 1024;
      v29 = v10;
      v30 = 1024;
      v31 = v9;
      v32 = 1024;
      v33 = v13;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s doRateControlWithTime - %s maxTierBitrate:%u minTierBitrate:%u operatingTierBitrate:%u targetBitrate:%u rxBitrate:%u", (uint8_t *)&v14, 0x4Eu);
    }
  }
}

- (void)updateRTPReceiveWithTimestamp:(unsigned int)a3 sampleRate:(unsigned int)a4 time:(double)a5
{
  NSObject *videoStreamRateControllerQueue;
  _QWORD v6[6];
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  videoStreamRateControllerQueue = self->_videoStreamRateControllerQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__VCVideoStreamRateController_updateRTPReceiveWithTimestamp_sampleRate_time___block_invoke;
  v6[3] = &unk_1E9E52910;
  v6[4] = self;
  v7 = a3;
  v8 = a4;
  *(double *)&v6[5] = a5;
  dispatch_async(videoStreamRateControllerQueue, v6);
}

uint64_t __77__VCVideoStreamRateController_updateRTPReceiveWithTimestamp_sampleRate_time___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "updateRTPReceiveWithTimestamp:sampleRate:time:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(double *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v3 + 56) != *(_DWORD *)(a1 + 48))
  {
    result = objc_msgSend(*(id *)(v3 + 8), "printRateControlFullInfoWithLogDump:time:videoStall:videoFrozenDuration:averageTargetBitrate:", *(_QWORD *)(v3 + 96), *(unsigned __int8 *)(v3 + 88), *(unsigned int *)(v3 + 60), *(double *)(a1 + 40), *(double *)(v3 + 80));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_DWORD *)(a1 + 48);
  }
  return result;
}

- (void)updateVideoStall:(BOOL)a3 withStallDuration:(unsigned int)a4
{
  NSObject *videoStreamRateControllerQueue;
  _QWORD block[5];
  unsigned int v6;
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  videoStreamRateControllerQueue = self->_videoStreamRateControllerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VCVideoStreamRateController_updateVideoStall_withStallDuration___block_invoke;
  block[3] = &unk_1E9E55ED0;
  block[4] = self;
  v7 = a3;
  v6 = a4;
  dispatch_async(videoStreamRateControllerQueue, block);
}

double __66__VCVideoStreamRateController_updateVideoStall_withStallDuration___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  double result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = *(_BYTE *)(a1 + 44);
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(v2 + 80) + (double)*(unint64_t *)&a2 / 1000.0;
  *(double *)(v2 + 80) = result;
  return result;
}

- (double)owrd
{
  double result;

  -[VCVideoStreamRateControlProtocol owrd](self->_rateControl, "owrd");
  return result;
}

- (double)nowrd
{
  double result;

  -[VCVideoStreamRateControlProtocol nowrd](self->_rateControl, "nowrd");
  return result;
}

- (double)nowrdShort
{
  double result;

  -[VCVideoStreamRateControlProtocol nowrdShort](self->_rateControl, "nowrdShort");
  return result;
}

- (double)nowrdAcc
{
  double result;

  -[VCVideoStreamRateControlProtocol nowrdAcc](self->_rateControl, "nowrdAcc");
  return result;
}

- (unsigned)minTierIndex:(unsigned int)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3 <= 0x1DBD48)
  {
    v5 = 0;
    while (g_adwTxRateTiers[v5] < a3)
    {
      if (++v5 == 27)
        goto LABEL_8;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamRateController minTierIndex:].cold.1(v4, self);
    }
LABEL_8:
    LOWORD(v5) = 26;
  }
  return v5;
}

- (unsigned)maxTierIndex:(unsigned int)a3
{
  uint64_t v4;
  int v5;

  if (a3 >= 0x2710)
  {
    v5 = 26;
    while (g_adwTxRateTiers[v5] > a3)
    {
      if (--v5 == -1)
        goto LABEL_8;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamRateController maxTierIndex:].cold.1(v4, self);
    }
LABEL_8:
    LOWORD(v5) = 0;
  }
  return v5;
}

- (void)setOperatingTierIndexWithBitrate:(unsigned int)a3
{
  uint64_t v4;
  NSObject *v5;
  unsigned __int16 minTierIndex;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unsigned int maxBitrate;
  uint64_t v11;
  unsigned int minBitrate;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_maxBitrate >= a3)
  {
    if (self->_minBitrate <= a3)
    {
      minTierIndex = -[VCVideoStreamRateController minTierIndex:](self, "minTierIndex:");
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v11 = objc_msgSend(-[VCVideoStreamRateController className](self, "className"), "UTF8String");
          minBitrate = self->_minBitrate;
          v13 = 136316162;
          v14 = v7;
          v15 = 2080;
          v16 = "-[VCVideoStreamRateController setOperatingTierIndexWithBitrate:]";
          v17 = 1024;
          v18 = 212;
          v19 = 2080;
          v20 = v11;
          v21 = 1024;
          v22 = minBitrate;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s: operating bitrate is less than the configured min bitrate: %u!", (uint8_t *)&v13, 0x2Cu);
        }
      }
      minTierIndex = self->_minTierIndex;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v9 = objc_msgSend(-[VCVideoStreamRateController className](self, "className"), "UTF8String");
        maxBitrate = self->_maxBitrate;
        v13 = 136316162;
        v14 = v4;
        v15 = 2080;
        v16 = "-[VCVideoStreamRateController setOperatingTierIndexWithBitrate:]";
        v17 = 1024;
        v18 = 209;
        v19 = 2080;
        v20 = v9;
        v21 = 1024;
        v22 = maxBitrate;
        _os_log_error_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s: operating bitrate is greater than the configured max bitrate: %u!", (uint8_t *)&v13, 0x2Cu);
      }
    }
    minTierIndex = self->_maxTierIndex;
  }
  self->_operatingTierIndex = minTierIndex;
}

- (void)updateAverageTargetBitrate:(unsigned int)a3 interval:(double)a4
{
  double totalTime;

  totalTime = self->_totalTime;
  if (a4 > 0.0)
  {
    totalTime = totalTime + a4;
    self->_totalTime = totalTime;
    self->_accumulatedTargetDataSize = (unint64_t)((double)self->_accumulatedTargetDataSize
                                                        + (double)(a3 / 0x3E8) * a4);
  }
  if (totalTime > 0.0)
    self->_averageTargetBitrate = ((double)self->_accumulatedTargetDataSize / totalTime * 1000.0);
}

- (void)createLogDumpFile:(unsigned int)a3
{
  FILE **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12[16];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  memset(v12, 170, 12);
  __sprintf_chk(v12, 0, 0xCuLL, "%010u", a3);
  v4 = VRLogfileAlloc(0, (uint64_t)v12, (uint64_t)"VCVideoRC", (uint64_t)".afrcdump", "com.apple.VideoConference.AFRClog.VideoStream", 9);
  self->_logDump = v4;
  VRLogfilePrintSync(v4, "STime\t\tdTime/ETxTS\tOWRD\tNOWRD\tNOWRDS\tNOWRDA\tUp\tRTT\tPLR/FEC\tRRx\tMBL\tBR/TR\tMQIn: A/V\tMQOut: A/V\tABRL\tQD\tBDL\tTxAT\tMODE\tTxSTATE\n", v5, v6, v7, v8, v9, v10, v11);
}

- (void)releaseLogDumpFile
{
  void **p_logDump;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[8];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_logDump = &self->_logDump;
  if (self->_logDump)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v10[6] = v3;
    v10[7] = v3;
    v10[4] = v3;
    v10[5] = v3;
    v10[2] = v3;
    v10[3] = v3;
    v10[0] = v3;
    v10[1] = v3;
    micro();
    VRLogfileGetTimestamp((char *)v10, 0x80u);
    VRLogfilePrintSync((FILE **)*p_logDump, "%s\t%8.3f\tEndOfFile\n", v4, v5, v6, v7, v8, v9, (char)v10);
    VRLogfileFree((uint64_t *)p_logDump);
    *p_logDump = 0;
  }
}

- (id)className
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (unsigned)minBitrate
{
  return self->_minBitrate;
}

- (unsigned)maxBitrate
{
  return self->_maxBitrate;
}

- (void)initWithDumpID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCVideoStreamRateController initWithDumpID:]";
  v6 = 1024;
  v7 = 75;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Creating a VCVideoStreamRateController with unknown algorithm.", (uint8_t *)&v2, 0x1Cu);
}

- (void)minTierIndex:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_9(a2, *MEMORY[0x1E0C80C00]), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4_8(&dword_1D8A54000, v2, v3, " [%s] %s:%d %s:%d bitrate is greater than the maximum possible tier!", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_11_11();
}

- (void)maxTierIndex:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_2_9(a2, *MEMORY[0x1E0C80C00]), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4_8(&dword_1D8A54000, v2, v3, " [%s] %s:%d %s:%d bitrate is less than the minimum possible tier!", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_11_11();
}

@end
