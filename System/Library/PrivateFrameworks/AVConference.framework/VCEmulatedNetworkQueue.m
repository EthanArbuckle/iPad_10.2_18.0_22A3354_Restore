@implementation VCEmulatedNetworkQueue

- (VCEmulatedNetworkQueue)initWithPolicies:(id)a3
{
  VCEmulatedNetworkQueue *v3;
  uint64_t v4;
  NSObject *v5;
  NSDictionary *policies;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  NSDictionary *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCEmulatedNetworkQueue;
  v3 = -[VCEmulatedNetworkElement initWithPolicies:](&v8, sel_initWithPolicies_, a3);
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        policies = v3->super._policies;
        *(_DWORD *)buf = 136315906;
        v10 = v4;
        v11 = 2080;
        v12 = "-[VCEmulatedNetworkQueue initWithPolicies:]";
        v13 = 1024;
        v14 = 22;
        v15 = 2112;
        v16 = policies;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Network queue policies: %@", buf, 0x26u);
      }
    }
    v3->_queueBandwidthAlgorithm = objc_alloc_init(VCEmulatedNetworkAlgorithmQueueBandwidth);
    v3->_queueLossAlgorithm = objc_alloc_init(VCEmulatedNetworkAlgorithmQueueLoss);
    v3->_queueDelayAlgorithm = objc_alloc_init(VCEmulatedNetworkAlgorithmQueueDelay);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCEmulatedNetworkQueue;
  -[VCEmulatedNetworkElement dealloc](&v3, sel_dealloc);
}

- (void)updateSettingsAtTime:(double)a3
{
  if (a3 - self->_lastPolicyLoadingTime >= 0.1)
  {
    self->_lastPolicyLoadingTime = a3;
    -[VCEmulatedNetworkAlgorithmQueueBandwidth updateSettingsAtTime:impairments:](self->_queueBandwidthAlgorithm, "updateSettingsAtTime:impairments:", self->super._policies, a3);
    -[VCEmulatedNetworkAlgorithmQueueLoss updateSettingsAtTime:impairments:](self->_queueLossAlgorithm, "updateSettingsAtTime:impairments:", self->super._policies, a3);
    -[VCEmulatedNetworkAlgorithmQueueDelay updateSettingsAtTime:impairments:](self->_queueDelayAlgorithm, "updateSettingsAtTime:impairments:", self->super._policies, a3);
  }
}

- (void)markPacketLoss:(id)a3
{
  -[VCEmulatedNetworkAlgorithmQueueLoss process:](self->_queueLossAlgorithm, "process:", a3);
}

- (int)write:(id)a3
{
  opaqueCMSimpleQueue *v5;
  uint64_t v7;
  NSObject *v8;
  opaqueCMSimpleQueue *networkElementQueue;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  opaqueCMSimpleQueue *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 && (v5 = self->super._networkElementQueue) != 0)
  {
    if (!CMSimpleQueueGetCount(v5))
    {
      objc_msgSend(a3, "arrivalTime");
      objc_msgSend(a3, "setNetworkServiceTime:");
    }
    -[VCEmulatedNetworkQueue markPacketLoss:](self, "markPacketLoss:", a3);
    return -[VCEmulatedNetworkQueue enqueuePacket:](self, "enqueuePacket:", a3);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        networkElementQueue = self->super._networkElementQueue;
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCEmulatedNetworkQueue write:]";
        v14 = 1024;
        v15 = 56;
        v16 = 2048;
        v17 = networkElementQueue;
        v18 = 2048;
        v19 = a3;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d networkElementQueue %p and packet %p cannot not be nil!", (uint8_t *)&v10, 0x30u);
      }
    }
    return -1;
  }
}

- (int)enqueuePacket:(id)a3
{
  int result;
  int v6;
  uint64_t v7;
  NSObject *v8;

  if ((objc_msgSend(a3, "isLost") & 1) == 0)
  {
    -[VCEmulatedNetworkAlgorithmQueueLoss setPacketCountInNetworkQueue:](self->_queueLossAlgorithm, "setPacketCountInNetworkQueue:", -[VCEmulatedNetworkAlgorithmQueueLoss packetCountInNetworkQueue](self->_queueLossAlgorithm, "packetCountInNetworkQueue")+ 1);
    -[VCEmulatedNetworkAlgorithmQueueLoss setPacketCountBytesInNetworkQueue:](self->_queueLossAlgorithm, "setPacketCountBytesInNetworkQueue:", -[VCEmulatedNetworkAlgorithmQueueLoss packetCountBytesInNetworkQueue](self->_queueLossAlgorithm, "packetCountBytesInNetworkQueue")+ objc_msgSend(a3, "size"));
  }
  result = CMSimpleQueueEnqueue(self->super._networkElementQueue, a3);
  if (result)
  {
    v6 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCEmulatedNetworkQueue enqueuePacket:].cold.1(v7, v6, v8);
    }

    return -1;
  }
  return result;
}

- (void)runUntilTime:(double)a3
{
  void *Head;
  __int128 v6;
  void *v7;
  double v8;
  os_log_t *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[VCEmulatedNetworkQueue updateSettingsAtTime:](self, "updateSettingsAtTime:");
  Head = (void *)CMSimpleQueueGetHead(self->super._networkElementQueue);
  if (Head)
  {
    v7 = Head;
    v8 = 0.0;
    v9 = (os_log_t *)MEMORY[0x1E0CF2758];
    *(_QWORD *)&v6 = 136316162;
    v17 = v6;
    do
    {
      objc_msgSend(v7, "arrivalTime", v17);
      v11 = v10;
      objc_msgSend(v7, "networkServiceTime");
      if (v11 >= v12)
        v12 = v11;
      if (v8 >= v12)
        v12 = v8;
      objc_msgSend(v7, "setNetworkServiceTime:", v12);
      -[VCEmulatedNetworkAlgorithmQueueBandwidth process:](self->_queueBandwidthAlgorithm, "process:", v7);
      -[VCEmulatedNetworkAlgorithmQueueDelay process:](self->_queueDelayAlgorithm, "process:", v7);
      -[VCEmulatedNetworkAlgorithmQueueDelay expectedProcessEndTime](self->_queueDelayAlgorithm, "expectedProcessEndTime");
      if (v13 >= a3)
        break;
      v8 = v13;
      if (-[VCEmulatedNetworkQueue dequeuePacket:time:](self, "dequeuePacket:time:", v7)
        && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          v16 = objc_msgSend(v7, "packetID");
          *(_DWORD *)buf = v17;
          v19 = v14;
          v20 = 2080;
          v21 = "-[VCEmulatedNetworkQueue runUntilTime:]";
          v22 = 1024;
          v23 = 105;
          v24 = 1024;
          v25 = v16;
          v26 = 2048;
          v27 = a3;
          _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to dequeue the packet ID %u at time: %f!", buf, 0x2Cu);
        }
      }
      v7 = (void *)CMSimpleQueueGetHead(self->super._networkElementQueue);
    }
    while (v7);
  }
}

- (int)dequeuePacket:(id)a3 time:(double)a4
{
  void (**processCompleteHandler)(id, const void *);
  const void *v7;
  uint64_t v8;
  NSObject *v9;
  int32_t Count;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int32_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setDepartureTime:", a4);
  processCompleteHandler = (void (**)(id, const void *))self->super._processCompleteHandler;
  if (processCompleteHandler)
  {
    v7 = CMSimpleQueueDequeue(self->super._networkElementQueue);
    processCompleteHandler[2](processCompleteHandler, v7);
    if ((objc_msgSend(a3, "isLost") & 1) == 0 || objc_msgSend(a3, "isDroppedByAQM"))
    {
      if (-[VCEmulatedNetworkAlgorithmQueueLoss packetCountInNetworkQueue](self->_queueLossAlgorithm, "packetCountInNetworkQueue"))
      {
        -[VCEmulatedNetworkAlgorithmQueueLoss setPacketCountInNetworkQueue:](self->_queueLossAlgorithm, "setPacketCountInNetworkQueue:", -[VCEmulatedNetworkAlgorithmQueueLoss packetCountInNetworkQueue](self->_queueLossAlgorithm, "packetCountInNetworkQueue")- 1);
        -[VCEmulatedNetworkAlgorithmQueueLoss setPacketCountBytesInNetworkQueue:](self->_queueLossAlgorithm, "setPacketCountBytesInNetworkQueue:", -[VCEmulatedNetworkAlgorithmQueueLoss packetCountBytesInNetworkQueue](self->_queueLossAlgorithm, "packetCountBytesInNetworkQueue")- objc_msgSend(a3, "size"));
      }
      else
      {
        Count = CMSimpleQueueGetCount(self->super._networkElementQueue);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v14 = 136316418;
            v15 = v12;
            v16 = 2080;
            v17 = "-[VCEmulatedNetworkQueue dequeuePacket:time:]";
            v18 = 1024;
            v19 = 126;
            v20 = 1024;
            v21 = Count;
            v22 = 1024;
            v23 = objc_msgSend(a3, "isLost");
            v24 = 1024;
            v25 = objc_msgSend(a3, "sequenceNumber");
            _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d PacketCountInQueue is bad, size=%d, isLost=%d, seq=%u ", (uint8_t *)&v14, 0x2Eu);
          }
        }
      }
    }

    return 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCEmulatedNetworkQueue dequeuePacket:time:].cold.1(v8, v9);
    }
    return -1;
  }
}

- (void)enqueuePacket:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[VCEmulatedNetworkQueue enqueuePacket:]";
  v7 = 1024;
  v8 = 77;
  v9 = 1024;
  v10 = a2;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to enqueue! status: %d", (uint8_t *)&v3, 0x22u);
}

- (void)dequeuePacket:(uint64_t)a1 time:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCEmulatedNetworkQueue dequeuePacket:time:]";
  v6 = 1024;
  v7 = 119;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d _processCompleteHandler is nil. Network element is not connected correctly!", (uint8_t *)&v2, 0x1Cu);
}

@end
