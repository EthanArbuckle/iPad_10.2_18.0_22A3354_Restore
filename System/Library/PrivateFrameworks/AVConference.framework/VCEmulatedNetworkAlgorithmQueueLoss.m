@implementation VCEmulatedNetworkAlgorithmQueueLoss

- (VCEmulatedNetworkAlgorithmQueueLoss)init
{
  VCEmulatedNetworkAlgorithmQueueLoss *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCEmulatedNetworkAlgorithmQueueLoss;
  result = -[VCEmulatedNetworkAlgorithmQueueLoss init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->_networkQueueMaxSize = 4000;
  return result;
}

- (void)updateSettingsAtTime:(double)a3 impairments:(id)a4
{
  void *v7;
  void *v8;
  int v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  double networkQueueLossRate;
  unsigned int networkQueueLossPattern;
  unsigned int networkQueueMaxSize;
  unsigned int networkQueueMaxSizeBytes;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  double v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  double v44;
  __int16 v45;
  _BYTE v46[10];
  double v47;
  __int16 v48;
  unsigned int v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  unsigned int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("FixedPLR")), "objectForKeyedSubscript:", CFSTR("time"));
  v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("FixedPLR")), "objectForKeyedSubscript:", CFSTR("value"));
  v9 = objc_msgSend(v8, "count");
  if (v9 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v7, &self->_currentIndexForLossRate, &self->_lastNetworkQueueLossRateLoadTime, v9, a3);
    objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", self->_currentIndexForLossRate), "doubleValue");
    self->_networkQueueLossRate = v10;
  }
  v11 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("LossPattern")), "objectForKeyedSubscript:", CFSTR("time"));
  v12 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("LossPattern")), "objectForKeyedSubscript:", CFSTR("value"));
  v13 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("LossPattern")), "objectForKeyedSubscript:", CFSTR("type"));
  v14 = objc_msgSend(v12, "count");
  if (v14 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v11, &self->_currentIndexForLossPattern, &self->_lastNetworkQueueLossPatternLoadTime, v14, a3);
    self->_networkQueueLossPattern = objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", self->_currentIndexForLossPattern), "unsignedIntValue");
    self->_packetTypeForNetworkQueueLossPattern = (int)objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", self->_currentIndexForLossPattern), "intValue");
  }
  v15 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("QueueSize")), "objectForKeyedSubscript:", CFSTR("time"));
  v16 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("QueueSize")), "objectForKeyedSubscript:", CFSTR("value"));
  v17 = objc_msgSend(v16, "count");
  if (v17 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v15, &self->_currentIndexForQueueSize, &self->_lastNetworkQueueSizeLoadTime, v17, a3);
    self->_networkQueueMaxSize = objc_msgSend((id)objc_msgSend(v16, "objectAtIndexedSubscript:", self->_currentIndexForQueueSize), "intValue");
  }
  v18 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("QueueSizeBytes")), "objectForKeyedSubscript:", CFSTR("time"));
  v19 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("QueueSizeBytes")), "objectForKeyedSubscript:", CFSTR("value"));
  v20 = objc_msgSend(v19, "count");
  if (v20 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v18, &self->_currentIndexForQueueSizeBytes, &self->_lastNetworkQueueSizeBytesLoadTime, v20, a3);
    self->_networkQueueMaxSizeBytes = objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", self->_currentIndexForQueueSizeBytes), "intValue");
  }
  if ((VCEmulatedNetworkAlgorithmQueueLoss *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        networkQueueLossRate = self->_networkQueueLossRate;
        networkQueueLossPattern = self->_networkQueueLossPattern;
        networkQueueMaxSize = self->_networkQueueMaxSize;
        networkQueueMaxSizeBytes = self->_networkQueueMaxSizeBytes;
        v37 = 136316674;
        v38 = v22;
        v39 = 2080;
        v40 = "-[VCEmulatedNetworkAlgorithmQueueLoss updateSettingsAtTime:impairments:]";
        v41 = 1024;
        v42 = 80;
        v43 = 2048;
        v44 = networkQueueLossRate;
        v45 = 1024;
        *(_DWORD *)v46 = networkQueueLossPattern;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = networkQueueMaxSize;
        LOWORD(v47) = 1024;
        *(_DWORD *)((char *)&v47 + 2) = networkQueueMaxSizeBytes;
        v28 = " [%s] %s:%d Current emulated network packet loss=%f, lossPattern=%X, queueSize=%u packets, queue size=%u bytes";
        v29 = v23;
        v30 = 56;
LABEL_19:
        _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v37, v30);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCEmulatedNetworkAlgorithmQueueLoss performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v33 = self->_networkQueueLossRate;
        v34 = self->_networkQueueLossPattern;
        v35 = self->_networkQueueMaxSize;
        v36 = self->_networkQueueMaxSizeBytes;
        v37 = 136317186;
        v38 = v31;
        v39 = 2080;
        v40 = "-[VCEmulatedNetworkAlgorithmQueueLoss updateSettingsAtTime:impairments:]";
        v41 = 1024;
        v42 = 80;
        v43 = 2112;
        v44 = *(double *)&v21;
        v45 = 2048;
        *(_QWORD *)v46 = self;
        *(_WORD *)&v46[8] = 2048;
        v47 = v33;
        v48 = 1024;
        v49 = v34;
        v50 = 1024;
        v51 = v35;
        v52 = 1024;
        v53 = v36;
        v28 = " [%s] %s:%d %@(%p) Current emulated network packet loss=%f, lossPattern=%X, queueSize=%u packets, queue size=%u bytes";
        v29 = v32;
        v30 = 76;
        goto LABEL_19;
      }
    }
  }
}

- (void)process:(id)a3
{
  double networkQueueLossRate;
  uint64_t v6;
  NSObject *v7;
  unsigned int packetCountInNetworkQueue;
  unsigned int networkQueueMaxSize;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  signed int networkQueueMaxSizeBytes;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  int packetCountBytesInNetworkQueue;
  unsigned int v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  unsigned int v42;
  const __CFString *v43;
  uint64_t v44;
  NSObject *v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  NSObject *v53;
  uint32_t v54;
  uint64_t v55;
  NSObject *v56;
  int v57;
  int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[24];
  __int128 v64;
  VCEmulatedNetworkAlgorithmQueueLoss *v65;
  uint64_t v66;
  _BYTE v67[32];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  networkQueueLossRate = self->_networkQueueLossRate;
  if (networkQueueLossRate > *(double *)""
    && (double)(unsigned __int16)arc4random_uniform(0xFFFFu) / 65535.0 <= networkQueueLossRate)
  {
    objc_msgSend(a3, "setIsLost:", 1);
  }
  if (objc_msgSend(a3, "type") && objc_msgSend(a3, "type") == self->_packetTypeForNetworkQueueLossPattern)
  {
    objc_msgSend(a3, "setIsLost:", (self->_networkQueueLossPattern >> self->_currentLossPatternShift) & 1);
    self->_currentLossPatternShift = (self->_currentLossPatternShift + 1) & 0x1F;
  }
  if (self->_packetCountInNetworkQueue > self->_networkQueueMaxSize && !self->_networkQueueMaxSizeBytes)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        packetCountInNetworkQueue = self->_packetCountInNetworkQueue;
        networkQueueMaxSize = self->_networkQueueMaxSize;
        *(_DWORD *)v63 = 136316162;
        *(_QWORD *)&v63[4] = v6;
        *(_WORD *)&v63[12] = 2080;
        *(_QWORD *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
        *(_WORD *)&v63[22] = 1024;
        LODWORD(v64) = 94;
        WORD2(v64) = 1024;
        *(_DWORD *)((char *)&v64 + 6) = packetCountInNetworkQueue;
        WORD5(v64) = 1024;
        HIDWORD(v64) = networkQueueMaxSize;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d network queue is full with packet count=%u, limit=%u", v63, 0x28u);
      }
    }
    if ((VCEmulatedNetworkAlgorithmQueueLoss *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_23;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v13 = objc_msgSend(a3, "packetID");
      v14 = objc_msgSend(a3, "sequenceNumber");
      v15 = objc_msgSend(a3, "size");
      objc_msgSend(a3, "arrivalTime");
      v17 = v16;
      objc_msgSend(a3, "departureTime");
      *(_DWORD *)v63 = 136316930;
      *(_QWORD *)&v63[4] = v11;
      *(_WORD *)&v63[12] = 2080;
      *(_QWORD *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
      *(_WORD *)&v63[22] = 1024;
      LODWORD(v64) = 95;
      WORD2(v64) = 1024;
      *(_DWORD *)((char *)&v64 + 6) = v13;
      WORD5(v64) = 1024;
      HIDWORD(v64) = v14;
      LOWORD(v65) = 1024;
      *(_DWORD *)((char *)&v65 + 2) = v15;
      HIWORD(v65) = 2048;
      v66 = v17;
      *(_WORD *)v67 = 2048;
      *(_QWORD *)&v67[2] = v18;
      v19 = " [%s] %s:%d dropped packet packetID=%d, sequenceNumber=%d, packet size=%d, arrivalTime=%f, departureTime=%f";
      v20 = v12;
      v21 = 66;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCEmulatedNetworkAlgorithmQueueLoss performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_23;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v24 = objc_msgSend(a3, "packetID");
      v25 = objc_msgSend(a3, "sequenceNumber");
      v26 = objc_msgSend(a3, "size");
      objc_msgSend(a3, "arrivalTime");
      v28 = v27;
      objc_msgSend(a3, "departureTime");
      *(_DWORD *)v63 = 136317442;
      *(_QWORD *)&v63[4] = v22;
      *(_WORD *)&v63[12] = 2080;
      *(_QWORD *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
      *(_WORD *)&v63[22] = 1024;
      LODWORD(v64) = 95;
      WORD2(v64) = 2112;
      *(_QWORD *)((char *)&v64 + 6) = v10;
      HIWORD(v64) = 2048;
      v65 = self;
      LOWORD(v66) = 1024;
      *(_DWORD *)((char *)&v66 + 2) = v24;
      HIWORD(v66) = 1024;
      *(_DWORD *)v67 = v25;
      *(_WORD *)&v67[4] = 1024;
      *(_DWORD *)&v67[6] = v26;
      *(_WORD *)&v67[10] = 2048;
      *(_QWORD *)&v67[12] = v28;
      *(_WORD *)&v67[20] = 2048;
      *(_QWORD *)&v67[22] = v29;
      v19 = " [%s] %s:%d %@(%p) dropped packet packetID=%d, sequenceNumber=%d, packet size=%d, arrivalTime=%f, departureTime=%f";
      v20 = v23;
      v21 = 86;
    }
    _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, v63, v21);
LABEL_23:
    objc_msgSend(a3, "setIsLost:", 1, *(_OWORD *)v63, *(_QWORD *)&v63[16], v64, v65, v66, *(_QWORD *)v67, *(_OWORD *)&v67[8], *(_QWORD *)&v67[24], v68);
  }
  networkQueueMaxSizeBytes = self->_networkQueueMaxSizeBytes;
  if (self->_packetCountBytesInNetworkQueue > networkQueueMaxSizeBytes && networkQueueMaxSizeBytes)
  {
    if ((VCEmulatedNetworkAlgorithmQueueLoss *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          packetCountBytesInNetworkQueue = self->_packetCountBytesInNetworkQueue;
          v35 = self->_networkQueueMaxSizeBytes;
          *(_DWORD *)v63 = 136316162;
          *(_QWORD *)&v63[4] = v32;
          *(_WORD *)&v63[12] = 2080;
          *(_QWORD *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
          *(_WORD *)&v63[22] = 1024;
          LODWORD(v64) = 100;
          WORD2(v64) = 1024;
          *(_DWORD *)((char *)&v64 + 6) = packetCountBytesInNetworkQueue;
          WORD5(v64) = 1024;
          HIDWORD(v64) = v35;
          v36 = " [%s] %s:%d network queue is full with current size=%d (bytes), limit=%u (bytes)";
          v37 = v33;
          v38 = 40;
LABEL_36:
          _os_log_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEFAULT, v36, v63, v38);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v31 = (const __CFString *)-[VCEmulatedNetworkAlgorithmQueueLoss performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v31 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v39 = VRTraceErrorLogLevelToCSTR();
        v40 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v41 = self->_packetCountBytesInNetworkQueue;
          v42 = self->_networkQueueMaxSizeBytes;
          *(_DWORD *)v63 = 136316674;
          *(_QWORD *)&v63[4] = v39;
          *(_WORD *)&v63[12] = 2080;
          *(_QWORD *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
          *(_WORD *)&v63[22] = 1024;
          LODWORD(v64) = 100;
          WORD2(v64) = 2112;
          *(_QWORD *)((char *)&v64 + 6) = v31;
          HIWORD(v64) = 2048;
          v65 = self;
          LOWORD(v66) = 1024;
          *(_DWORD *)((char *)&v66 + 2) = v41;
          HIWORD(v66) = 1024;
          *(_DWORD *)v67 = v42;
          v36 = " [%s] %s:%d %@(%p) network queue is full with current size=%d (bytes), limit=%u (bytes)";
          v37 = v40;
          v38 = 60;
          goto LABEL_36;
        }
      }
    }
    if ((VCEmulatedNetworkAlgorithmQueueLoss *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_48;
      v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_48;
      v46 = objc_msgSend(a3, "packetID");
      v47 = objc_msgSend(a3, "sequenceNumber");
      v48 = objc_msgSend(a3, "size");
      objc_msgSend(a3, "arrivalTime");
      v50 = v49;
      objc_msgSend(a3, "departureTime");
      *(_DWORD *)v63 = 136316930;
      *(_QWORD *)&v63[4] = v44;
      *(_WORD *)&v63[12] = 2080;
      *(_QWORD *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
      *(_WORD *)&v63[22] = 1024;
      LODWORD(v64) = 101;
      WORD2(v64) = 1024;
      *(_DWORD *)((char *)&v64 + 6) = v46;
      WORD5(v64) = 1024;
      HIDWORD(v64) = v47;
      LOWORD(v65) = 1024;
      *(_DWORD *)((char *)&v65 + 2) = v48;
      HIWORD(v65) = 2048;
      v66 = v50;
      *(_WORD *)v67 = 2048;
      *(_QWORD *)&v67[2] = v51;
      v52 = " [%s] %s:%d dropped packet packetID=%d, sequenceNumber=%d, packet size=%d, arrivalTime=%f, departureTime=%f";
      v53 = v45;
      v54 = 66;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v43 = (const __CFString *)-[VCEmulatedNetworkAlgorithmQueueLoss performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v43 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_48;
      v55 = VRTraceErrorLogLevelToCSTR();
      v56 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_48;
      v57 = objc_msgSend(a3, "packetID");
      v58 = objc_msgSend(a3, "sequenceNumber");
      v59 = objc_msgSend(a3, "size");
      objc_msgSend(a3, "arrivalTime");
      v61 = v60;
      objc_msgSend(a3, "departureTime");
      *(_DWORD *)v63 = 136317442;
      *(_QWORD *)&v63[4] = v55;
      *(_WORD *)&v63[12] = 2080;
      *(_QWORD *)&v63[14] = "-[VCEmulatedNetworkAlgorithmQueueLoss process:]";
      *(_WORD *)&v63[22] = 1024;
      LODWORD(v64) = 101;
      WORD2(v64) = 2112;
      *(_QWORD *)((char *)&v64 + 6) = v43;
      HIWORD(v64) = 2048;
      v65 = self;
      LOWORD(v66) = 1024;
      *(_DWORD *)((char *)&v66 + 2) = v57;
      HIWORD(v66) = 1024;
      *(_DWORD *)v67 = v58;
      *(_WORD *)&v67[4] = 1024;
      *(_DWORD *)&v67[6] = v59;
      *(_WORD *)&v67[10] = 2048;
      *(_QWORD *)&v67[12] = v61;
      *(_WORD *)&v67[20] = 2048;
      *(_QWORD *)&v67[22] = v62;
      v52 = " [%s] %s:%d %@(%p) dropped packet packetID=%d, sequenceNumber=%d, packet size=%d, arrivalTime=%f, departureTime=%f";
      v53 = v56;
      v54 = 86;
    }
    _os_log_impl(&dword_1D8A54000, v53, OS_LOG_TYPE_DEFAULT, v52, v63, v54);
LABEL_48:
    objc_msgSend(a3, "setIsLost:", 1, *(_QWORD *)v63, *(_OWORD *)&v63[8], v64, v65, v66, *(_QWORD *)v67, *(_QWORD *)&v67[8], *(_OWORD *)&v67[16]);
  }
}

- (double)expectedProcessEndTime
{
  return self->_expectedProcessEndTime;
}

- (unsigned)packetCountInNetworkQueue
{
  return self->_packetCountInNetworkQueue;
}

- (void)setPacketCountInNetworkQueue:(unsigned int)a3
{
  self->_packetCountInNetworkQueue = a3;
}

- (int)packetCountBytesInNetworkQueue
{
  return self->_packetCountBytesInNetworkQueue;
}

- (void)setPacketCountBytesInNetworkQueue:(int)a3
{
  self->_packetCountBytesInNetworkQueue = a3;
}

@end
