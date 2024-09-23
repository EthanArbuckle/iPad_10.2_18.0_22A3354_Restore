@implementation AVCBasebandCongestionDetector

- (AVCBasebandCongestionDetector)init
{
  AVCBasebandCongestionDetector *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)AVCBasebandCongestionDetector;
  v2 = -[AVCBasebandCongestionDetector init](&v4, sel_init);
  if (v2)
    v2->_basebandMetrics = objc_alloc_init(VCBasebandMetrics);
  return v2;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  AVCBasebandCongestionDetector *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVCBasebandCongestionDetector dealloc]";
      v10 = 1024;
      v11 = 349;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Releasing baseband congestion detector:%p", buf, 0x26u);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCBasebandCongestionDetector;
  -[AVCBasebandCongestionDetector dealloc](&v5, sel_dealloc);
}

- (void)setMediaController:(id)a3
{
  VCRateControlMediaController *v4;

  v4 = (VCRateControlMediaController *)a3;
  self->_mediaController = v4;
  -[VCBasebandMetrics setMediaController:](self->_basebandMetrics, "setMediaController:", v4);
}

- (void)setRadioAccessTechnology:(unsigned int)a3
{
  uint64_t v3;
  BOOL v5;
  _BOOL4 v6;

  v3 = *(_QWORD *)&a3;
  v5 = -[AVCBasebandCongestionDetector isRadioAccessTechnologyOnCellular:](self, "isRadioAccessTechnologyOnCellular:", self->_radioAccessTechnology);
  v6 = -[AVCBasebandCongestionDetector isRadioAccessTechnologyOnCellular:](self, "isRadioAccessTechnologyOnCellular:", v3);
  if (!v5 && v6)
    -[VCBasebandMetrics resetBBNoteHistoryList](self->_basebandMetrics, "resetBBNoteHistoryList");
  self->_radioAccessTechnology = v3;
}

- (BOOL)processBasebandNotification:(id)a3 metaData:(id)a4 error:(id *)a5
{
  id v7;
  unint64_t v9;
  double v10;
  double v11;
  _BYTE v13[6048];
  uint64_t v14;

  v7 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a3, "bytes");
  LODWORD(v7) = objc_msgSend(v7, "length");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("MetaDataMessageArrivalTime")), "doubleValue");
  v11 = v10;
  self->_notificationArrivalTime = v10;
  bzero(v13, 0x17A0uLL);
  VCBasebandNotificationParser_ParseNotification(v9, v7, (uint64_t)v13, v11);
  return -[AVCBasebandCongestionDetector processBasebandNotification:arrivalTime:error:](self, "processBasebandNotification:arrivalTime:error:", v13, a5, self->_notificationArrivalTime);
}

- (BOOL)processBasebandNotification:(id *)a3 arrivalTime:(double)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  VCBasebandMetrics *basebandMetrics;
  double v11;
  int v12;
  void *logBasebandDump;
  const char *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  _OWORD v25[5];
  __int128 v26;
  __int128 v27;
  _OWORD v28[2];
  __int128 v29;
  __int128 v30;
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  self->_notificationArrivalTime = a4;
  if (a3->var0 != 1)
  {
    if (a3->var0 == 2)
      -[AVCBasebandCongestionDetector processBasebandAck:](self, "processBasebandAck:");
    return 1;
  }
  v29 = unk_1D910D2B0;
  v30 = xmmword_1D910D2C0;
  memset(v31, 170, sizeof(v31));
  v26 = unk_1D910D270;
  v27 = xmmword_1D910D280;
  memset(v28, 170, sizeof(v28));
  v25[0] = xmmword_1D910D220;
  memset(&v25[1], 170, 64);
  basebandMetrics = self->_basebandMetrics;
  if (basebandMetrics)
  {
    -[VCBasebandMetrics getBasebandMetricsWithNotification:](basebandMetrics, "getBasebandMetricsWithNotification:");
  }
  else
  {
    v30 = 0u;
    memset(v31, 0, sizeof(v31));
    v29 = 0u;
    v27 = 0u;
    memset(v28, 0, sizeof(v28));
    v26 = 0u;
    memset(v25, 0, sizeof(v25));
  }
  if (self->_mode - 1 <= 3)
    BYTE2(v25[1]) = 1;
  v11 = *(double *)&v25[4];
  *(_QWORD *)&self->_basebandTxBitrate = *(_QWORD *)&v25[2];
  v12 = v25[0];
  self->_basebandQueueDepth = HIDWORD(v25[1]) + DWORD2(v25[1]);
  self->_basebandExpectedQueuingDelay = v11;
  if (v12 != 1)
  {
    logBasebandDump = self->_logBasebandDump;
    if (!logBasebandDump)
      return 1;
    v14 = "[Bogus baseband notification, discard]\n";
    goto LABEL_15;
  }
  if (*((double *)v25 + 1) == 0.0)
  {
    logBasebandDump = self->_logBasebandDump;
    if (!logBasebandDump)
      return 1;
    v14 = "[Baseband notification too close to the previous one, discard]\n";
LABEL_15:
    VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, v14, (uint64_t)a3, (uint64_t)a5, v5, v6, v7, v8, v24);
    return 1;
  }
  if (-[VCRateControlMediaController basebandFlushCount](self->_mediaController, "basebandFlushCount", *((double *)v25 + 1)) > 0|| !DWORD1(v25[2]))
  {
    -[VCBasebandMetrics resetBDCDList](self->_basebandMetrics, "resetBDCDList");
    v15 = self->_logBasebandDump;
    if (v15)
    {
      v16 = -[VCRateControlMediaController basebandFlushCount](self->_mediaController, "basebandFlushCount");
      VRLogfilePrintWithTimestamp((uint64_t)v15, "Start re-collecting BDCD samples [flushCount %d, BBAvgTxRate %d].\n", v17, v18, v19, v20, v21, v22, v16);
    }
  }
  AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v25);
  return 1;
}

- (void)setTargetBitrate:(unsigned int)a3
{
  self->_targetBitrate = a3;
  -[VCBasebandMetrics setTargetBitrate:](self->_basebandMetrics, "setTargetBitrate:");
}

- (void)setIsTargetBitrateStabilized:(BOOL)a3
{
  self->_isTargetBitrateStabilized = a3;
  -[VCBasebandMetrics setIsTargetBitrateStabilized:](self->_basebandMetrics, "setIsTargetBitrateStabilized:");
}

- (void)enableBasebandLogDump:(void *)a3
{
  self->_logBasebandDump = a3;
  -[VCBasebandMetrics enableBasebandLogDump:](self->_basebandMetrics, "enableBasebandLogDump:");
}

- (BOOL)isRadioAccessTechnologyOnCellular:(unsigned int)a3
{
  return a3 - 2 < 5;
}

- (void)processBasebandAck:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void *logBasebandDump;
  void *v14;
  unsigned int var2;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;

  -[VCRateControlMediaController decreaseFlushCount:](self->_mediaController, "decreaseFlushCount:", 1);
  v11 = bswap32(a3->var3.var0.var0);
  v12 = HIWORD(v11);
  if (a3->var3.var1.var1)
  {
    if (a3->var3.var1.var1 == 0xFFFF)
    {
      logBasebandDump = self->_logBasebandDump;
      if (logBasebandDump)
        VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "TID[%04X] Baseband Drop ACK reported failure\n", v5, v6, v7, v8, v9, v10, SBYTE2(v11));
    }
    else
    {
      var2 = a3->var3.var0.var2;
      if (a3->var3.var0.var2)
      {
        v16 = 0;
        v17 = (char *)&a3->var3.var2 + 10;
        do
        {
          v18 = *((unsigned __int16 *)v17 - 1);
          if (v18 <= 0x1F3)
          {
            v19 = *(v17 - 4);
            -[VCRateControlMediaController didMediaGetFlushedWithPayloadType:transactionID:packetDropped:sequenceNumberArray:](self->_mediaController, "didMediaGetFlushedWithPayloadType:transactionID:packetDropped:sequenceNumberArray:", v19, v12, *((unsigned __int16 *)v17 - 1), v17);
            -[AVCBasebandCongestionDetector printFlushAckToBasebandDump:transactionID:packetDropped:sequenceNumberArray:](self, "printFlushAckToBasebandDump:transactionID:packetDropped:sequenceNumberArray:", v19, v12, v18, v17);
            var2 = a3->var3.var0.var2;
          }
          ++v16;
          v17 += 1004;
        }
        while (v16 < var2);
      }
    }
  }
  else
  {
    v14 = self->_logBasebandDump;
    if (v14)
      VRLogfilePrintWithTimestamp((uint64_t)v14, "TID[%04X] Baseband Drop ACK no packet dropped\n", v5, v6, v7, v8, v9, v10, SBYTE2(v11));
  }
}

- (void)printFlushAckToBasebandDump:(unsigned __int8)a3 transactionID:(unsigned __int16)a4 packetDropped:(unsigned __int16)a5 sequenceNumberArray:(unsigned __int16 *)a6
{
  void *logBasebandDump;
  char v7;
  uint64_t v10;
  __CFString *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  logBasebandDump = self->_logBasebandDump;
  if (logBasebandDump)
  {
    v7 = a4;
    if (a5)
    {
      v10 = a5;
      v11 = &stru_1E9E58EE0;
      do
      {
        v12 = *a6++;
        v11 = (__CFString *)-[__CFString stringByAppendingFormat:](v11, "stringByAppendingFormat:", CFSTR("%04X "), v12);
        --v10;
      }
      while (v10);
      logBasebandDump = self->_logBasebandDump;
      if (!v11)
        goto LABEL_9;
    }
    else
    {
      v11 = &stru_1E9E58EE0;
    }
    objc_msgSend((id)-[__CFString description](v11, "description"), "UTF8String");
LABEL_9:
    VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "TID[%04X] Baseband Drop ACK for PT %u: %2u packets dropped [%s]\n", v13, v14, v15, v16, v17, v18, v7);
  }
}

- (unsigned)radioAccessTechnology
{
  return self->_radioAccessTechnology;
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (BOOL)isTargetBitrateStabilized
{
  return self->_isTargetBitrateStabilized;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (VCRateControlMediaController)mediaController
{
  return self->_mediaController;
}

- (unsigned)basebandTxBitrate
{
  return self->_basebandTxBitrate;
}

- (unsigned)basebandAverageBitrate
{
  return self->_basebandAverageBitrate;
}

- (unsigned)basebandQueueDepth
{
  return self->_basebandQueueDepth;
}

- (double)basebandExpectedQueuingDelay
{
  return self->_basebandExpectedQueuingDelay;
}

@end
