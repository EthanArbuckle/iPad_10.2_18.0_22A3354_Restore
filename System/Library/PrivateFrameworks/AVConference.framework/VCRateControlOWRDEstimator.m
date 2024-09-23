@implementation VCRateControlOWRDEstimator

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
  self->_useUINT16 = (a3 & 0xFFFFFFFE) != 8;
}

- (double)relativeSendTimeWithTimestamp:(unsigned int)a3 timestampRate:(unsigned int)a4
{
  unsigned int firstSendTimestamp;
  unsigned int v7;
  unsigned int previousSendTimestampDiff;
  double result;
  BOOL v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  firstSendTimestamp = self->_firstSendTimestamp;
  if (!firstSendTimestamp)
  {
    self->_firstSendTimestamp = a3;
    firstSendTimestamp = a3;
  }
  v7 = a3 - firstSendTimestamp;
  previousSendTimestampDiff = self->_previousSendTimestampDiff;
  if (self->_useUINT16)
  {
    if ((unsigned __int16)previousSendTimestampDiff == (unsigned __int16)v7)
      return -1.0;
  }
  else
  {
    result = -1.0;
    if (v7 == previousSendTimestampDiff)
      return result;
  }
  v10 = -[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithSendTimestamp:](self, "detectOutOfOrderAndSpikeWithSendTimestamp:");
  result = -2.0;
  if (!v10)
  {
    v11 = self->_previousSendTimestampDiff;
    if (self->_useUINT16)
    {
      v7 = (unsigned __int16)v7;
      if ((unsigned __int16)(v7 - v11) > 0x7FFEu)
      {
        v18 = 0xFFFFLL;
        goto LABEL_33;
      }
      if ((unsigned __int16)v7 < (unsigned __int16)v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          v14 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v19 = 136315650;
              v20 = v12;
              v21 = 2080;
              v22 = "-[VCRateControlOWRDEstimator relativeSendTimeWithTimestamp:timestampRate:]";
              v23 = 1024;
              v24 = 98;
              _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Time counter wrapped around", (uint8_t *)&v19, 0x1Cu);
            }
          }
          else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            -[VCRateControlOWRDEstimator relativeSendTimeWithTimestamp:timestampRate:].cold.2();
          }
        }
        v18 = 0xFFFFLL;
LABEL_31:
        ++self->_sendTimestampWrappedAround;
        goto LABEL_32;
      }
      v18 = 0xFFFFLL;
    }
    else
    {
      if (v7 - v11 > 0x7FFFFFFE)
      {
        v18 = 0xFFFFFFFFLL;
        goto LABEL_33;
      }
      if (v7 < v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          v17 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v19 = 136315650;
              v20 = v15;
              v21 = 2080;
              v22 = "-[VCRateControlOWRDEstimator relativeSendTimeWithTimestamp:timestampRate:]";
              v23 = 1024;
              v24 = 107;
              _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Time counter wrapped around", (uint8_t *)&v19, 0x1Cu);
            }
          }
          else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            -[VCRateControlOWRDEstimator relativeSendTimeWithTimestamp:timestampRate:].cold.1();
          }
        }
        v18 = 0xFFFFFFFFLL;
        goto LABEL_31;
      }
      v18 = 0xFFFFFFFFLL;
    }
LABEL_32:
    self->_previousSendTimestampDiff = v7;
LABEL_33:
    result = (double)(self->_sendTimestampWrappedAround * v18 + v7) / (double)a4;
    if (self->_firstSendTime == 0.0)
      self->_firstSendTime = result;
  }
  return result;
}

- (double)relativeReceiveTimeWithTimestamp:(unsigned int)a3 timestampRate:(unsigned int)a4
{
  unsigned int firstReceiveTimestamp;
  unsigned int v7;
  unsigned int previousReceiveTimestampDiff;
  double result;
  BOOL v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  firstReceiveTimestamp = self->_firstReceiveTimestamp;
  if (!firstReceiveTimestamp)
  {
    self->_firstReceiveTimestamp = a3;
    firstReceiveTimestamp = a3;
  }
  v7 = a3 - firstReceiveTimestamp;
  previousReceiveTimestampDiff = self->_previousReceiveTimestampDiff;
  if (self->_useUINT16)
  {
    if ((unsigned __int16)previousReceiveTimestampDiff == (unsigned __int16)v7)
      return -1.0;
  }
  else
  {
    result = -1.0;
    if (v7 == previousReceiveTimestampDiff)
      return result;
  }
  v10 = -[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithReceiveTimestamp:](self, "detectOutOfOrderAndSpikeWithReceiveTimestamp:");
  result = -2.0;
  if (!v10)
  {
    v11 = self->_previousReceiveTimestampDiff;
    if (self->_useUINT16)
    {
      v7 = (unsigned __int16)v7;
      if ((unsigned __int16)(v7 - v11) > 0x7FFEu)
      {
        v18 = 0xFFFFLL;
        goto LABEL_33;
      }
      if ((unsigned __int16)v7 < (unsigned __int16)v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          v14 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v19 = 136315650;
              v20 = v12;
              v21 = 2080;
              v22 = "-[VCRateControlOWRDEstimator relativeReceiveTimeWithTimestamp:timestampRate:]";
              v23 = 1024;
              v24 = 143;
              _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Time counter wrapped around", (uint8_t *)&v19, 0x1Cu);
            }
          }
          else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            -[VCRateControlOWRDEstimator relativeReceiveTimeWithTimestamp:timestampRate:].cold.2();
          }
        }
        v18 = 0xFFFFLL;
LABEL_31:
        ++self->_receiveTimestampWrappedAround;
        goto LABEL_32;
      }
      v18 = 0xFFFFLL;
    }
    else
    {
      if (v7 - v11 > 0x7FFFFFFE)
      {
        v18 = 0xFFFFFFFFLL;
        goto LABEL_33;
      }
      if (v7 < v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          v17 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v19 = 136315650;
              v20 = v15;
              v21 = 2080;
              v22 = "-[VCRateControlOWRDEstimator relativeReceiveTimeWithTimestamp:timestampRate:]";
              v23 = 1024;
              v24 = 152;
              _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Time counter wrapped around", (uint8_t *)&v19, 0x1Cu);
            }
          }
          else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            -[VCRateControlOWRDEstimator relativeReceiveTimeWithTimestamp:timestampRate:].cold.1();
          }
        }
        v18 = 0xFFFFFFFFLL;
        goto LABEL_31;
      }
      v18 = 0xFFFFFFFFLL;
    }
LABEL_32:
    self->_previousReceiveTimestampDiff = v7;
LABEL_33:
    result = (double)(self->_receiveTimestampWrappedAround * v18 + v7) / (double)a4;
    if (self->_firstReceiveTime == 0.0)
      self->_firstReceiveTime = result;
  }
  return result;
}

- (void)calculateOWRDWithSendTime:(double)a3 receiveTime:(double)a4 roundTripTime:(double)a5
{
  double firstSendTime;
  double firstReceiveTime;
  double v11;
  double v12;
  double v13;
  double shortAverageLag;
  double longAverageLag;
  uint64_t v17;
  NSObject *v18;
  double v19;
  double v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  NSObject *v30;
  double owrd;
  int v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0 || a4 < 0.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v32 = 136316162;
        v33 = v24;
        v34 = 2080;
        v35 = "-[VCRateControlOWRDEstimator calculateOWRDWithSendTime:receiveTime:roundTripTime:]";
        v36 = 1024;
        v37 = 168;
        v38 = 2048;
        v39 = a3;
        v40 = 2048;
        v41 = a4;
        v21 = "VCRC [%s] %s:%d Repeated or out of order timestamp detected when calculating OWRD, sendTime=%f, receiveTime=%f";
        v22 = v25;
        v23 = 48;
        goto LABEL_20;
      }
    }
  }
  else
  {
    firstSendTime = self->_firstSendTime;
    if (firstSendTime == 0.0)
    {
      self->_firstSendTime = a3;
      firstSendTime = a3;
    }
    firstReceiveTime = self->_firstReceiveTime;
    if (firstReceiveTime == 0.0)
    {
      self->_firstReceiveTime = a4;
      firstReceiveTime = a4;
    }
    v11 = a4 - firstReceiveTime;
    v12 = a3 - firstSendTime;
    v13 = a4 - firstReceiveTime - v12;
    shortAverageLag = self->_shortAverageLag;
    if (shortAverageLag == 0.0 || (longAverageLag = self->_longAverageLag, longAverageLag == 0.0))
    {
      self->_shortAverageLag = v13;
      self->_longAverageLag = v13;
      longAverageLag = v13;
      shortAverageLag = v13;
    }
    if (v13 - shortAverageLag <= 30.0 && longAverageLag - v13 <= 30.0)
    {
      v26 = v13 * 0.0001 + longAverageLag * 0.9999;
      v27 = v13 * 0.1 + shortAverageLag * 0.9;
      self->_shortAverageLag = v27;
      self->_longAverageLag = v26;
      v28 = v27 - v26;
      self->_owrd = v28;
      if (v28 < 0.0)
      {
        self->_longAverageLag = v27;
        self->_owrd = 0.0;
      }
      if (-[VCRateControlOWRDEstimator detectAbnormalOWRDWithRoundTripTime:](self, "detectAbnormalOWRDWithRoundTripTime:", a5))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v29 = VRTraceErrorLogLevelToCSTR();
          v30 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            owrd = self->_owrd;
            v32 = 136316162;
            v33 = v29;
            v34 = 2080;
            v35 = "-[VCRateControlOWRDEstimator calculateOWRDWithSendTime:receiveTime:roundTripTime:]";
            v36 = 1024;
            v37 = 204;
            v38 = 2048;
            v39 = owrd;
            v40 = 2048;
            v41 = a5;
            _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Abnormal OWRD %f detected while RTT stays low at %f for too long. Reference could be bad. Reset OWRD", (uint8_t *)&v32, 0x30u);
          }
        }
        -[VCRateControlOWRDEstimator resetOWRDEstimation](self, "resetOWRDEstimation");
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_shortAverageLag;
        v20 = self->_longAverageLag;
        v32 = 136317186;
        v33 = v17;
        v34 = 2080;
        v35 = "-[VCRateControlOWRDEstimator calculateOWRDWithSendTime:receiveTime:roundTripTime:]";
        v36 = 1024;
        v37 = 190;
        v38 = 2048;
        v39 = v13;
        v40 = 2048;
        v41 = v11;
        v42 = 2048;
        v43 = v12;
        v44 = 2048;
        v45 = v19;
        v46 = 2048;
        v47 = v20;
        v48 = 2048;
        v49 = 0x403E000000000000;
        v21 = "VCRC [%s] %s:%d Lag=%f with receiveDiff=%f and sendDiff=%f looks spurios (shortLag=%f, longLag=%f, thresho"
              "ld=%f), discarding";
        v22 = v18;
        v23 = 88;
LABEL_20:
        _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v32, v23);
      }
    }
  }
}

- (BOOL)detectAbnormalOWRDWithRoundTripTime:(double)a3
{
  double v5;
  BOOL v6;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  double owrd;
  unsigned int abnormalOWRDSampleCount;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.0 || ((v5 = self->_owrd, v5 > 2.0) ? (v6 = v5 <= a3 * 5.0) : (v6 = 1), v6))
  {
    self->_abnormalOWRDSampleCount = 0;
  }
  else
  {
    ++self->_abnormalOWRDSampleCount;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (ErrorLogLevelForModule >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        owrd = self->_owrd;
        abnormalOWRDSampleCount = self->_abnormalOWRDSampleCount;
        v13 = 136316418;
        v14 = v9;
        v15 = 2080;
        v16 = "-[VCRateControlOWRDEstimator detectAbnormalOWRDWithRoundTripTime:]";
        v17 = 1024;
        v18 = 214;
        v19 = 2048;
        v20 = owrd;
        v21 = 2048;
        v22 = a3;
        v23 = 1024;
        v24 = abnormalOWRDSampleCount;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Abnormal OWRD %f detected while RTT stays low at %f. abnormalOWRDSampleCount:%u", (uint8_t *)&v13, 0x36u);
      }
    }
  }
  return self->_abnormalOWRDSampleCount > 0x1E;
}

- (BOOL)detectOutOfOrderAndSpikeWithSendTimestamp:(unsigned int)a3
{
  unsigned int previousSendTimestamp;
  unsigned int v6;
  double averageSendInterval;
  unsigned int v8;
  unsigned int v9;
  BOOL result;
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  unsigned int v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  unsigned int v19;
  unsigned int v20;
  double v21;
  double v22;
  double v23;
  unsigned int v24;
  double v25;
  uint64_t v26;
  NSObject *v27;
  unsigned int v28;
  unsigned int v29;
  double v30;
  double owrd;
  int v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  previousSendTimestamp = self->_previousSendTimestamp;
  if (!previousSendTimestamp)
  {
    result = 0;
    self->_previousSendTimestamp = a3;
    return result;
  }
  v6 = a3 - previousSendTimestamp;
  averageSendInterval = self->_averageSendInterval;
  if (averageSendInterval <= 0.0)
    goto LABEL_25;
  v8 = (averageSendInterval * 10.0);
  if (self->_useUINT16)
  {
    v9 = (unsigned __int16)(a3 - previousSendTimestamp);
    if (v9 <= 0x7FFE)
    {
      if (v9 <= (unsigned __int16)v8)
      {
        if (!self->_sendTimestampSpikeDetected || v9 >= (unsigned __int16)(averageSendInterval * 1.2))
        {
LABEL_43:
          result = 0;
          self->_previousSendTimestamp = a3;
          self->_sendTimestampSpikeDetected = 0;
          goto LABEL_26;
        }
LABEL_36:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v26 = VRTraceErrorLogLevelToCSTR();
          v27 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v28 = self->_previousSendTimestamp;
            if (self->_useUINT16)
              v29 = (unsigned __int16)v6;
            else
              v29 = v6;
            v30 = self->_averageSendInterval;
            owrd = self->_owrd;
            v32 = 136316930;
            v33 = v26;
            v34 = 2080;
            v35 = "-[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithSendTimestamp:]";
            v36 = 1024;
            v37 = 244;
            v38 = 1024;
            v39 = a3;
            v40 = 1024;
            v41 = v28;
            v42 = 1024;
            v43 = v29;
            v44 = 2048;
            v45 = v30;
            v46 = 2048;
            v47 = owrd;
            _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Detected spike before send timestamp %X, previousTS:%X, timestampDiff:%d, average send interval:%f, current owrd:%f", (uint8_t *)&v32, 0x42u);
          }
        }
        -[VCRateControlOWRDEstimator resetOWRDEstimation](self, "resetOWRDEstimation");
        goto LABEL_43;
      }
      goto LABEL_19;
    }
LABEL_11:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_previousSendTimestamp;
        if (self->_useUINT16)
          v14 = (unsigned __int16)v6;
        else
          v14 = v6;
        v15 = self->_owrd;
        v32 = 136316674;
        v33 = v11;
        v34 = 2080;
        v35 = "-[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithSendTimestamp:]";
        v36 = 1024;
        v37 = 236;
        v38 = 1024;
        v39 = a3;
        v40 = 1024;
        v41 = v13;
        v42 = 1024;
        v43 = v14;
        v44 = 2048;
        v45 = v15;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Detected out of order at send timestamp %X, previousTS:%X, timestampDiff:%d, current owrd:%f", (uint8_t *)&v32, 0x38u);
      }
    }
    result = 1;
    goto LABEL_26;
  }
  if (v6 >= 0x7FFFFFFF)
    goto LABEL_11;
  if (v6 <= v8)
  {
    if (!self->_sendTimestampSpikeDetected || v6 >= (averageSendInterval * 1.2))
      goto LABEL_43;
    goto LABEL_36;
  }
LABEL_19:
  self->_sendTimestampSpikeDetected = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
  {
LABEL_25:
    result = 0;
    goto LABEL_26;
  }
  v16 = VRTraceErrorLogLevelToCSTR();
  v17 = *MEMORY[0x1E0CF2758];
  v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v18)
  {
    v19 = self->_previousSendTimestamp;
    if (self->_useUINT16)
      v20 = (unsigned __int16)v6;
    else
      v20 = v6;
    v21 = self->_averageSendInterval;
    v22 = self->_owrd;
    v32 = 136316930;
    v33 = v16;
    v34 = 2080;
    v35 = "-[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithSendTimestamp:]";
    v36 = 1024;
    v37 = 240;
    v38 = 1024;
    v39 = a3;
    v40 = 1024;
    v41 = v19;
    v42 = 1024;
    v43 = v20;
    v44 = 2048;
    v45 = v21;
    v46 = 2048;
    v47 = v22;
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Detected spike at send timestamp %X, previousTS:%X, timestampDiff:%d, average send interval:%f, current owrd:%f", (uint8_t *)&v32, 0x42u);
    goto LABEL_25;
  }
LABEL_26:
  v23 = self->_averageSendInterval;
  if (self->_useUINT16)
    v24 = (unsigned __int16)v6;
  else
    v24 = v6;
  if (v23 == 0.0)
    v25 = (double)v24;
  else
    v25 = (double)v24 * 0.1 + v23 * 0.9;
  self->_averageSendInterval = v25;
  return result;
}

- (BOOL)detectOutOfOrderAndSpikeWithReceiveTimestamp:(unsigned int)a3
{
  unsigned int previousReceiveTimestamp;
  unsigned int v6;
  double averageReceiveInterval;
  unsigned int v8;
  unsigned int v9;
  BOOL result;
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  unsigned int v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  unsigned int v19;
  unsigned int v20;
  double v21;
  double v22;
  double v23;
  unsigned int v24;
  double v25;
  uint64_t v26;
  NSObject *v27;
  unsigned int v28;
  unsigned int v29;
  double v30;
  double owrd;
  int v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  previousReceiveTimestamp = self->_previousReceiveTimestamp;
  if (!previousReceiveTimestamp)
  {
    result = 0;
    self->_previousReceiveTimestamp = a3;
    return result;
  }
  v6 = a3 - previousReceiveTimestamp;
  averageReceiveInterval = self->_averageReceiveInterval;
  if (averageReceiveInterval <= 0.0)
    goto LABEL_25;
  v8 = (averageReceiveInterval * 10.0);
  if (self->_useUINT16)
  {
    v9 = (unsigned __int16)(a3 - previousReceiveTimestamp);
    if (v9 <= 0x7FFE)
    {
      if (v9 <= (unsigned __int16)v8)
      {
        if (!self->_receiveTimestampSpikeDetected
          || v9 >= (unsigned __int16)(averageReceiveInterval * 1.2))
        {
LABEL_43:
          result = 0;
          self->_previousReceiveTimestamp = a3;
          self->_receiveTimestampSpikeDetected = 0;
          goto LABEL_26;
        }
LABEL_36:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v26 = VRTraceErrorLogLevelToCSTR();
          v27 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v28 = self->_previousReceiveTimestamp;
            if (self->_useUINT16)
              v29 = (unsigned __int16)v6;
            else
              v29 = v6;
            v30 = self->_averageReceiveInterval;
            owrd = self->_owrd;
            v32 = 136316930;
            v33 = v26;
            v34 = 2080;
            v35 = "-[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithReceiveTimestamp:]";
            v36 = 1024;
            v37 = 283;
            v38 = 1024;
            v39 = a3;
            v40 = 1024;
            v41 = v28;
            v42 = 1024;
            v43 = v29;
            v44 = 2048;
            v45 = v30;
            v46 = 2048;
            v47 = owrd;
            _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Detected spike before receive timestamp %X, previousTS:%X, timestampDiff:%d, average send interval:%f, current owrd:%f", (uint8_t *)&v32, 0x42u);
          }
        }
        -[VCRateControlOWRDEstimator resetOWRDEstimation](self, "resetOWRDEstimation");
        goto LABEL_43;
      }
      goto LABEL_19;
    }
LABEL_11:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_previousReceiveTimestamp;
        if (self->_useUINT16)
          v14 = (unsigned __int16)v6;
        else
          v14 = v6;
        v15 = self->_owrd;
        v32 = 136316674;
        v33 = v11;
        v34 = 2080;
        v35 = "-[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithReceiveTimestamp:]";
        v36 = 1024;
        v37 = 275;
        v38 = 1024;
        v39 = a3;
        v40 = 1024;
        v41 = v13;
        v42 = 1024;
        v43 = v14;
        v44 = 2048;
        v45 = v15;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Detected out of order at receive timestamp %X, previousTS:%X, timestampDiff:%d, current owrd:%f", (uint8_t *)&v32, 0x38u);
      }
    }
    result = 1;
    goto LABEL_26;
  }
  if (v6 >= 0x7FFFFFFF)
    goto LABEL_11;
  if (v6 <= v8)
  {
    if (!self->_receiveTimestampSpikeDetected || v6 >= (averageReceiveInterval * 1.2))
      goto LABEL_43;
    goto LABEL_36;
  }
LABEL_19:
  self->_receiveTimestampSpikeDetected = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
  {
LABEL_25:
    result = 0;
    goto LABEL_26;
  }
  v16 = VRTraceErrorLogLevelToCSTR();
  v17 = *MEMORY[0x1E0CF2758];
  v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v18)
  {
    v19 = self->_previousReceiveTimestamp;
    if (self->_useUINT16)
      v20 = (unsigned __int16)v6;
    else
      v20 = v6;
    v21 = self->_averageReceiveInterval;
    v22 = self->_owrd;
    v32 = 136316930;
    v33 = v16;
    v34 = 2080;
    v35 = "-[VCRateControlOWRDEstimator detectOutOfOrderAndSpikeWithReceiveTimestamp:]";
    v36 = 1024;
    v37 = 279;
    v38 = 1024;
    v39 = a3;
    v40 = 1024;
    v41 = v19;
    v42 = 1024;
    v43 = v20;
    v44 = 2048;
    v45 = v21;
    v46 = 2048;
    v47 = v22;
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Detected spike at receive timestamp %X, previousTS:%X, timestampDiff:%d, average send interval:%f, current owrd:%f", (uint8_t *)&v32, 0x42u);
    goto LABEL_25;
  }
LABEL_26:
  v23 = self->_averageReceiveInterval;
  if (self->_useUINT16)
    v24 = (unsigned __int16)v6;
  else
    v24 = v6;
  if (v23 == 0.0)
    v25 = (double)v24;
  else
    v25 = (double)v24 * 0.1 + v23 * 0.9;
  self->_averageReceiveInterval = v25;
  return result;
}

- (void)resetOWRDEstimation
{
  uint64_t v3;
  NSObject *v4;
  double owrd;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      owrd = self->_owrd;
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCRateControlOWRDEstimator resetOWRDEstimation]";
      v10 = 1024;
      v11 = 300;
      v12 = 2048;
      v13 = owrd;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Reset OWRD from %f to 0", (uint8_t *)&v6, 0x26u);
    }
  }
  *(_QWORD *)&self->_firstSendTimestamp = 0;
  self->_previousSendTimestampDiff = 0;
  self->_firstSendTime = 0.0;
  *(_QWORD *)&self->_firstReceiveTimestamp = 0;
  self->_previousReceiveTimestampDiff = 0;
  self->_shortAverageLag = 0.0;
  self->_longAverageLag = 0.0;
  self->_firstReceiveTime = 0.0;
  self->_averageSendInterval = 0.0;
  self->_averageReceiveInterval = 0.0;
}

- (double)owrd
{
  return self->_owrd;
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)relativeSendTimeWithTimestamp:timestampRate:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCRC [%s] %s:%d Time counter wrapped around", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)relativeSendTimeWithTimestamp:timestampRate:.cold.2()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCRC [%s] %s:%d Time counter wrapped around", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)relativeReceiveTimeWithTimestamp:timestampRate:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCRC [%s] %s:%d Time counter wrapped around", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)relativeReceiveTimeWithTimestamp:timestampRate:.cold.2()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCRC [%s] %s:%d Time counter wrapped around", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
