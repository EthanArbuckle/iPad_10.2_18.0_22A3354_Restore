@implementation AVCRateControlFeedbackController

- (AVCRateControlFeedbackController)initWithStatisticsCollector:(id)a3
{
  AVCRateControlFeedbackController *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)AVCRateControlFeedbackController;
  result = -[AVCRateControlFeedbackController init](&v5, sel_init);
  if (result)
  {
    result->_statisticsCollector = (AVCStatisticsCollector *)a3;
    result->_isECNEnabled = 0;
    result->_txLinkType = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCRateControlFeedbackController;
  -[AVCRateControlFeedbackController dealloc](&v3, sel_dealloc);
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
}

- (BOOL)getFeedbackMessage:(id *)a3 type:(unsigned int)a4 metaData:(id *)a5 error:(id *)a6
{
  unsigned int mode;
  BOOL v7;
  int v8;

  mode = self->_mode;
  v7 = mode > 7;
  v8 = (1 << mode) & 0x8E;
  return !v7
      && v8 != 0
      && -[AVCRateControlFeedbackController getRateControlFeedbackMessage:type:metaData:error:](self, "getRateControlFeedbackMessage:type:metaData:error:", a3, *(_QWORD *)&a4, a5, a6);
}

- (BOOL)processFeedbackMessage:(id)a3 type:(unsigned int)a4 metaData:(id)a5 error:(id *)a6
{
  double v10;
  unsigned int mode;
  unsigned __int16 *v12;
  int v13;
  unsigned int v14;
  int v15;
  _DWORD *v16;
  double v17;
  unsigned __int16 *v18;
  int v19;
  unsigned int v20;
  int v21;
  _DWORD v23[2];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _DWORD v35[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = micro();
  mode = self->_mode;
  if (mode - 1 < 3)
  {
    v46 = 0;
    v45 = 0u;
    v44 = 0u;
    v43 = 0u;
    v42 = 0u;
    v41 = 0u;
    v40 = 0u;
    v39 = 0u;
    v38 = 0u;
    v37 = 0u;
    v36 = 0u;
    v12 = (unsigned __int16 *)objc_msgSend(a3, "bytes");
    v13 = v12[1];
    v14 = v12[2];
    DWORD2(v36) = v14 >> 12;
    DWORD1(v38) = *v12;
    DWORD1(v37) = v14 & 0xFFF;
    v15 = v12[4];
    v35[1] = v12[3];
    LODWORD(v36) = v13;
    v35[0] = v15;
    *(_QWORD *)&v39 = RTPUnpackDouble(v12[5]);
    v16 = v35;
    return _AVCRateControlFeedbackController_ProcessRateControlFeedbackMessage((uint64_t)self, (uint64_t)v16, a4, v10);
  }
  if (mode == 7)
  {
    if (a5)
    {
      if (objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("MetaDataTestSimulationTime")))
      {
        objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("MetaDataTestSimulationTime")), "doubleValue");
        v10 = v17;
      }
    }
    v34 = 0;
    v33 = 0u;
    v32 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = (unsigned __int16 *)objc_msgSend(a3, "bytes");
    v19 = v18[1];
    v20 = v18[2];
    DWORD2(v24) = v20 >> 12;
    DWORD1(v26) = *v18;
    DWORD1(v25) = v20 & 0xFFF;
    v21 = v18[4];
    v23[1] = v18[3];
    LODWORD(v24) = v19;
    v23[0] = v21;
    *(_QWORD *)&v27 = RTPUnpackDouble(v18[5]);
    v16 = v23;
    return _AVCRateControlFeedbackController_ProcessRateControlFeedbackMessage((uint64_t)self, (uint64_t)v16, a4, v10);
  }
  return 0;
}

- (BOOL)processRateControlServerStats:(id *)a3 type:(unsigned int)a4 error:(id *)a5 time:(double)a6
{
  _OWORD v8[12];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  memset(v8, 0, sizeof(v8));
  ++self->_feedbackMessageCount;
  if (a4 == 3)
  {
    LODWORD(v8[0]) = 5;
    *((double *)v8 + 1) = a6;
    *(_QWORD *)((char *)&v8[1] + 12) = *(_QWORD *)&a3->var1;
    DWORD2(v8[2]) = a3->var4;
    AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v8);
  }
  return a4 == 3;
}

- (BOOL)processRateControlPacketReceived:(id *)a3 type:(unsigned int)a4 error:(id *)a5 time:(double)a6
{
  unsigned int var9;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
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
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  if (a4 == 4)
  {
    *((double *)&v9 + 1) = a6;
    LODWORD(v9) = 7;
    var9 = a3->var9;
    DWORD2(v10) = 2;
    HIDWORD(v13) = var9;
    AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)&v9);
  }
  return a4 == 4;
}

- (BOOL)processRateControlPacketSent:(id *)a3 type:(unsigned int)a4 error:(id *)a5 time:(double)a6
{
  $D7FA8F090387725AC85E473621BE088E v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  memset(v8, 0, sizeof(v8));
  if (a4 == 5)
  {
    *(double *)&v8[0].var2 = a6;
    v8[0].var0 = 6;
    v8[1] = *a3;
    AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v8);
  }
  return a4 == 5;
}

- (BOOL)processRateControlLocalRCEvent:(tagVCStatisticsLocalRCEvent *)a3 type:(unsigned int)a4 error:(id *)a5 time:(double)a6
{
  tagVCStatisticsLocalRCEvent v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  memset(v8, 0, sizeof(v8));
  if (a4 == 6)
  {
    v8[0].recentFeedbackTime = a6;
    LODWORD(v8[0].recentSendTime) = 14;
    v8[1] = *a3;
    AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v8);
  }
  return a4 == 6;
}

- (BOOL)processRateControlMessageArray:(id)a3 type:(unsigned int)a4
{
  double v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  BOOL result;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _OWORD v26[10];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = micro();
  switch(a4)
  {
    case 1u:
      DWORD2(v26[1]) = 0;
      *(_QWORD *)&v26[1] = 0;
      memset(&v26[3], 0, 112);
      v8 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 5), "unsignedIntValue");
      v9 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "unsignedIntValue");
      v10 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "unsignedIntValue");
      v11 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 4), "unsignedIntValue");
      v12 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
      LODWORD(v24) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
      HIDWORD(v24) = v12;
      v25 = v9;
      LODWORD(v26[0]) = v10;
      *(_QWORD *)((char *)v26 + 4) = 0;
      HIDWORD(v26[0]) = v11;
      HIDWORD(v26[1]) = v8;
      *(_QWORD *)&v26[2] = 0;
      *((double *)&v26[2] + 1) = (double)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 6), "unsignedIntValue");
      result = _AVCRateControlFeedbackController_ProcessRateControlFeedbackMessage((uint64_t)self, (uint64_t)&v24, 1, v7);
      break;
    case 2u:
      BYTE4(v24) = 0;
      LODWORD(v24) = 0;
      memset((char *)v26 + 12, 0, 48);
      *(_OWORD *)((char *)&v26[3] + 8) = 0u;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0, v24), "doubleValue");
      v15 = v14;
      v16 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
      BYTE5(v24) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "BOOLValue");
      HIWORD(v24) = 0;
      LODWORD(v25) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "unsignedIntValue");
      HIDWORD(v25) = v16;
      *(_QWORD *)&v26[0] = v15;
      DWORD2(v26[0]) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 4), "unsignedIntValue");
      result = -[AVCRateControlFeedbackController processRateControlProbingMessage:type:error:](self, "processRateControlProbingMessage:type:error:", &v24, 2, 0);
      break;
    case 3u:
      memset((char *)v26 + 4, 0, 68);
      LODWORD(v24) = 0;
      HIDWORD(v24) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
      v25 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
      LODWORD(v26[0]) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "unsignedIntValue");
      result = -[AVCRateControlFeedbackController processRateControlServerStats:type:error:time:](self, "processRateControlServerStats:type:error:time:", &v24, 3, 0, v7);
      break;
    case 4u:
      LODWORD(v26[2]) = 0;
      DWORD1(v26[2]) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0, 0, 0, 0, 0, 0, 0, *(_QWORD *)&v26[2]), "unsignedIntValue");
      result = -[AVCRateControlFeedbackController processRateControlPacketReceived:type:error:time:](self, "processRateControlPacketReceived:type:error:time:", &v24, 4, 0, v7);
      break;
    case 5u:
      v17 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
      v18 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
      v19 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "unsignedIntValue");
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "doubleValue");
      v24 = __PAIR64__(v18, v17);
      v25 = v19;
      *(_QWORD *)&v26[0] = v20;
      result = -[AVCRateControlFeedbackController processRateControlPacketSent:type:error:time:](self, "processRateControlPacketSent:type:error:time:", &v24, 5, 0, v7);
      break;
    case 6u:
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "doubleValue");
      v22 = v21;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "doubleValue");
      v24 = v22;
      v25 = v23;
      *(_QWORD *)&v26[0] = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "unsignedIntValue");
      result = -[AVCRateControlFeedbackController processRateControlLocalRCEvent:type:error:time:](self, "processRateControlLocalRCEvent:type:error:time:", &v24, 6, 0, v7);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)getRateControlFeedbackMessage:(id *)a3 type:(unsigned int)a4 metaData:(id *)a5 error:(id *)a6
{
  double v9;
  _BOOL4 v10;
  _OWORD v12[11];
  _BYTE v13[200];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a4 == 2)
  {
    LOBYTE(v10) = 1;
  }
  else if (a4 == 1 && a3)
  {
    memset(v13, 0, sizeof(v13));
    v9 = micro();
    if (a5 && *a5)
      objc_msgSend((id)objc_msgSend(*a5, "objectForKeyedSubscript:", CFSTR("MetaDataTestSimulationTime"), v9), "doubleValue");
    v10 = -[AVCRateControlFeedbackController getVCStatisticsFeedbackMessage:time:](self, "getVCStatisticsFeedbackMessage:time:", v13, v9);
    if (v10)
    {
      v12[8] = *(_OWORD *)&v13[152];
      v12[9] = *(_OWORD *)&v13[168];
      v12[10] = *(_OWORD *)&v13[184];
      v12[4] = *(_OWORD *)&v13[88];
      v12[5] = *(_OWORD *)&v13[104];
      v12[6] = *(_OWORD *)&v13[120];
      v12[7] = *(_OWORD *)&v13[136];
      v12[0] = *(_OWORD *)&v13[24];
      v12[1] = *(_OWORD *)&v13[40];
      v12[2] = *(_OWORD *)&v13[56];
      v12[3] = *(_OWORD *)&v13[72];
      *a3 = -[AVCRateControlFeedbackController translateRateControlDataWithFeedbackMessage:](self, "translateRateControlDataWithFeedbackMessage:", v12);
      -[AVCRateControlFeedbackController resetBurstyLossStatistics](self, "resetBurstyLossStatistics");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCRateControlFeedbackController getRateControlFeedbackMessage:type:metaData:error:].cold.1();
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)getVCStatisticsFeedbackMessage:(tagVCStatisticsMessage *)a3 time:(double)a4
{
  AVCStatisticsCollector *statisticsCollector;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  if (a3)
  {
    statisticsCollector = self->_statisticsCollector;
    if (statisticsCollector)
    {
      -[AVCStatisticsCollector getVCStatisticsWithType:time:](statisticsCollector, "getVCStatisticsWithType:time:", 2, a4);
    }
    else
    {
      v19 = 0;
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v7 = 0u;
      v8 = 0u;
    }
    *(_OWORD *)((char *)&a3->var0.localRCEvent + 136) = v17;
    *(_OWORD *)((char *)&a3->var0.localRCEvent + 152) = v18;
    *((_QWORD *)&a3->var0.localRCEvent + 21) = v19;
    *(_OWORD *)(&a3->var0.localRCEvent + 3) = v13;
    *(_OWORD *)((char *)&a3->var0.localRCEvent + 88) = v14;
    *(_OWORD *)((char *)&a3->var0.localRCEvent + 104) = v15;
    *(_OWORD *)(&a3->var0.localRCEvent + 5) = v16;
    *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber = v9;
    *(_OWORD *)(&a3->var0.localRCEvent + 1) = v10;
    *(_OWORD *)((char *)&a3->var0.localRCEvent + 40) = v11;
    *(_OWORD *)((char *)&a3->var0.localRCEvent + 56) = v12;
    *(_OWORD *)&a3->type = v7;
    *(_OWORD *)&a3->isVCRCInternal = v8;
  }
  return a3 != 0;
}

- (unsigned)getConnectionStatsBlob
{
  return -[VCConnectionHealthMonitor generateStatsBlob](self->_connectionHealthMonitor, "generateStatsBlob");
}

- (BOOL)processRateControlProbingMessage:(id *)a3 type:(unsigned int)a4 error:(id *)a5
{
  __int128 v6;
  __int128 v7;
  _OWORD v9[12];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  if (a4 == 2)
  {
    *((_QWORD *)&v9[0] + 1) = *(_QWORD *)&a3->var6;
    v6 = *(_OWORD *)&a3->var6;
    *(_OWORD *)((char *)&v9[3] + 8) = *(_OWORD *)&a3->var9.var0;
    v7 = *(_OWORD *)&a3->var9.var6;
    *(_OWORD *)((char *)&v9[4] + 8) = *(_OWORD *)&a3->var9.var4;
    *(_OWORD *)((char *)&v9[5] + 8) = v7;
    *(_OWORD *)((char *)&v9[1] + 8) = *(_OWORD *)&a3->var0;
    LODWORD(v9[0]) = 4;
    BYTE3(v9[1]) = 1;
    *((_QWORD *)&v9[6] + 1) = *(_QWORD *)&a3->var9.var8;
    *(_OWORD *)((char *)&v9[2] + 8) = v6;
    AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v9);
  }
  return a4 == 2;
}

- (id)translateRateControlDataWithFeedbackMessage:(id *)a3
{
  unsigned int var0;
  _WORD v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5[0] = a3->var11;
  v5[1] = a3->var2;
  v5[2] = a3->var7 & 0xFFF | (LOWORD(a3->var4) << 12);
  var0 = a3->var0;
  v5[3] = a3->var1;
  v5[4] = var0;
  v5[5] = RTPPackDouble(a3->var13);
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, 12);
}

- (void)resetBurstyLossStatistics
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = 0u;
  v4 = 0u;
  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  LODWORD(v3) = 7;
  BYTE3(v4) = 1;
  DWORD2(v4) = 1;
  AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)&v3);
  DWORD2(v4) = 2;
  AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)&v3);
}

- (unsigned)mode
{
  return self->_mode;
}

- (VCConnectionHealthMonitor)connectionHealthMonitor
{
  return self->_connectionHealthMonitor;
}

- (void)setConnectionHealthMonitor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)isFeedbackReceived
{
  return self->_isFeedbackReceived;
}

- (void)setIsFeedbackReceived:(BOOL)a3
{
  self->_isFeedbackReceived = a3;
}

- (BOOL)isECNEnabled
{
  return self->_isECNEnabled;
}

- (void)getRateControlFeedbackMessage:type:metaData:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCRC [%s] %s:%d Cannot get rate control feedback message!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
