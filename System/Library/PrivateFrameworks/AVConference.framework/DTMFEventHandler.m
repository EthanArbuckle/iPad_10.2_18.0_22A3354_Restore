@implementation DTMFEventHandler

- (DTMFEventHandler)init
{
  DTMFEventHandler *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)DTMFEventHandler;
  v2 = -[DTMFEventHandler init](&v5, sel_init);
  if (v2)
  {
    v2->dtmfEventQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->dtmfQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCDTMFEventHandler.dtmfQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  dispatch_release((dispatch_object_t)self->dtmfQueue);
  v3.receiver = self;
  v3.super_class = (Class)DTMFEventHandler;
  -[DTMFEventHandler dealloc](&v3, sel_dealloc);
}

- (void)setDTMFRTPEventDurationForPayload:(int)a3
{
  unsigned int v3;

  if ((a3 - 97) > 0xE)
    goto LABEL_6;
  if (((1 << (a3 - 97)) & 0x4C02) == 0)
  {
    if (a3 == 97)
    {
      v3 = 160;
      goto LABEL_7;
    }
LABEL_6:
    v3 = 0;
    goto LABEL_7;
  }
  v3 = 320;
LABEL_7:
  self->_rtpEventDuration = v3;
}

- (BOOL)insertStartBlockWithEvent:(unsigned __int8)a3 volume:(unsigned __int8)a4 timestamp:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  NSMutableArray *dtmfEventQueue;
  _QWORD v12[3];
  _QWORD v13[4];

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v7 = a3;
  v13[3] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1DF088A10](self, a2);
  dtmfEventQueue = self->dtmfEventQueue;
  v12[0] = CFSTR("event");
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7);
  v12[1] = CFSTR("volume");
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6);
  v12[2] = CFSTR("startTimestamp");
  v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  -[NSMutableArray addObject:](dtmfEventQueue, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3));
  objc_autoreleasePoolPop(v9);
  return 1;
}

- (BOOL)insertStopBlockWithEndTimestamp:(unsigned int)a3 withPauseCompleteTimestamp:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  NSMutableArray *dtmfEventQueue;
  _QWORD v10[2];
  _QWORD v11[3];

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v11[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1DF088A10](self, a2);
  dtmfEventQueue = self->dtmfEventQueue;
  v10[0] = CFSTR("endTimestamp");
  v10[1] = CFSTR("pauseCompleteTimestamp");
  v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  -[NSMutableArray addObject:](dtmfEventQueue, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  objc_autoreleasePoolPop(v7);
  return 1;
}

- (void)sendDTMFEvent:(id)a3 atTimestamp:(unsigned int)a4 withSampleRate:(unsigned int)a5
{
  NSObject *dtmfQueue;
  _QWORD v10[6];
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("event")))
  {
    dtmfQueue = self->dtmfQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__DTMFEventHandler_sendDTMFEvent_atTimestamp_withSampleRate___block_invoke;
    v10[3] = &unk_1E9E53820;
    v10[4] = a3;
    v10[5] = self;
    v11 = a4;
    v12 = a5;
    dispatch_async(dtmfQueue, v10);
  }
}

void __61__DTMFEventHandler_sendDTMFEvent_atTimestamp_withSampleRate___block_invoke(uint64_t a1)
{
  unsigned __int8 v2;
  unsigned __int16 v3;
  unsigned __int16 v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v9;
  BOOL v11;
  unsigned __int8 v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("volume")), "unsignedIntegerValue");
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("duration")), "unsignedIntegerValue");
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("interval")), "unsignedIntegerValue");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("event")));
  v6 = objc_msgSend(v5, "count");
  v7 = *(unsigned int *)(a1 + 48);
  HIDWORD(v16[0]) = -1431655766;
  if (objc_msgSend(*(id *)(a1 + 40), "shouldAdjustForLastPauseCompleteTimestamp:", (char *)v16 + 4))
  {
    if ((HIDWORD(v16[0]) - v7) >= 0x7FFFFFFF || HIDWORD(v16[0]) == (_DWORD)v7)
      v7 = v7;
    else
      v7 = HIDWORD(v16[0]);
  }
  if (v6 >= 1)
  {
    v9 = 0;
    v11 = v3 == 0xFFFF && v6 == 1;
    LODWORD(v16[0]) = v3 - 20;
    while (1)
    {
      v12 = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", v9, v16[0]), "unsignedIntegerValue");
      v13 = v12;
      if (v12 >= 0x11u)
        break;
      objc_msgSend(*(id *)(a1 + 40), "insertStartBlockWithEvent:volume:timestamp:", v12, v2, v7);
      if (!v11)
      {
        v7 = *(_DWORD *)(a1 + 52) * LODWORD(v16[0]) / 0x3E8u
           + (_DWORD)v7
           + *(_DWORD *)(a1 + 52) * v4 / 0x3E8;
        objc_msgSend(*(id *)(a1 + 40), "insertStopBlockWithEndTimestamp:withPauseCompleteTimestamp:");
      }
      if (v6 == ++v9)
        goto LABEL_24;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __61__DTMFEventHandler_sendDTMFEvent_atTimestamp_withSampleRate___block_invoke_cold_1(v14, v13, v15);
    }
  }
LABEL_24:

}

- (void)sendingDTMFEventWithTimeStamp:(unsigned int)a3 interval:(unsigned int)a4 RTPHandle:(tagHANDLE *)a5
{
  NSObject *dtmfQueue;
  uint64_t v10;
  unsigned int v11;
  BOOL v12;
  int v13;
  unsigned int currentStartTimestamp;
  double v15;
  unint64_t currentEventRetransmitFinalPacketCount;
  _QWORD block[7];
  unsigned int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  int v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = -1431655766;
  v28 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  dtmfQueue = self->dtmfQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__DTMFEventHandler_sendingDTMFEventWithTimeStamp_interval_RTPHandle___block_invoke;
  block[3] = &unk_1E9E577A8;
  block[4] = self;
  block[5] = &v23;
  v18 = a3;
  block[6] = &v19;
  dispatch_sync(dtmfQueue, block);
  if (*((_BYTE *)v24 + 24))
  {
    if (self->currentEventNeedsEndBlock)
    {
      v10 = 0;
    }
    else
    {
      v11 = self->currentEndTimestamp - a3;
      if (v11)
        v12 = v11 > 0x7FFFFFFE;
      else
        v12 = 1;
      v10 = v12;
    }
    if (-[DTMFEventHandler constructDTMFEventPacketWithEvent:volume:durationCounter:dataBuffer:isEnd:](self, "constructDTMFEventPacketWithEvent:volume:durationCounter:dataBuffer:isEnd:", self->currentEvent, self->currentVolume, self->currentDurationCounter, &v28, v10) == 1)++self->currentEventRetransmitFinalPacketCount;
    v13 = *((unsigned __int8 *)v20 + 24);
    currentStartTimestamp = self->currentStartTimestamp;
    v15 = micro();
    RTPSendRTP((uint64_t)a5, 117, v13, currentStartTimestamp, &v28, 4u, &v27, 0, v15, (float)a4, 0, 0, 0, 0, 0, 0);
    currentEventRetransmitFinalPacketCount = self->currentEventRetransmitFinalPacketCount;
    if ((v10 & 1) != 0)
    {
      if (currentEventRetransmitFinalPacketCount >= 3)
        self->_currentEventState = 2;
    }
    else if (currentEventRetransmitFinalPacketCount >= 3)
    {
      self->currentStartTimestamp = a3;
      self->currentDurationCounter = 1;
      self->currentEventRetransmitFinalPacketCount = 0;
    }
    else
    {
      ++self->currentDurationCounter;
    }
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

uint64_t __69__DTMFEventHandler_sendingDTMFEventWithTimeStamp_interval_RTPHandle___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  _BYTE v20[24];
  _BYTE v21[10];
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v1 = result;
  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(result + 32);
  if (!*(_DWORD *)(v2 + 24))
  {
    v4 = (void *)objc_msgSend(*(id *)(v2 + 16), "objectAtIndexedSubscript:", 0);
    if (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("event")))
    {
      *(_DWORD *)(*(_QWORD *)(v1 + 32) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(v1 + 32) + 28) = 1;
      *(_QWORD *)(*(_QWORD *)(v1 + 32) + 32) = 0;
      *(_BYTE *)(*(_QWORD *)(v1 + 32) + 40) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("event")), "unsignedIntegerValue");
      *(_BYTE *)(*(_QWORD *)(v1 + 32) + 41) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("volume")), "unsignedIntegerValue");
      *(_DWORD *)(*(_QWORD *)(v1 + 32) + 44) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTimestamp")), "unsignedIntegerValue");
      *(_DWORD *)(*(_QWORD *)(v1 + 32) + 64) = *(_DWORD *)(v1 + 56) - *(_DWORD *)(*(_QWORD *)(v1 + 32) + 44);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        v7 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            v8 = *(_QWORD *)(v1 + 32);
            v9 = *(_DWORD *)(v8 + 64);
            v10 = *(unsigned __int8 *)(v8 + 40);
            v11 = *(_DWORD *)(v1 + 56);
            LODWORD(v8) = *(_DWORD *)(v8 + 44);
            *(_DWORD *)v20 = 136316674;
            *(_QWORD *)&v20[4] = v5;
            *(_WORD *)&v20[12] = 2080;
            *(_QWORD *)&v20[14] = "-[DTMFEventHandler sendingDTMFEventWithTimeStamp:interval:RTPHandle:]_block_invoke";
            *(_WORD *)&v20[22] = 1024;
            *(_DWORD *)v21 = 181;
            *(_WORD *)&v21[4] = 1024;
            *(_DWORD *)&v21[6] = v9;
            v22 = 1024;
            v23 = v10;
            v24 = 1024;
            v25 = v11;
            v26 = 1024;
            v27 = v8;
            _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Timestamp delta between the current packet timestamp and the timestamp when the DTMF event was originated from IPT=%d, current event=%d, timestamp=%d, currentStartTimestamp=%d", v20, 0x34u);
          }
        }
        else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v16 = *(_QWORD *)(v1 + 32);
          v17 = *(_DWORD *)(v16 + 64);
          v18 = *(unsigned __int8 *)(v16 + 40);
          v19 = *(_DWORD *)(v1 + 56);
          LODWORD(v16) = *(_DWORD *)(v16 + 44);
          *(_DWORD *)v20 = 136316674;
          *(_QWORD *)&v20[4] = v5;
          *(_WORD *)&v20[12] = 2080;
          *(_QWORD *)&v20[14] = "-[DTMFEventHandler sendingDTMFEventWithTimeStamp:interval:RTPHandle:]_block_invoke";
          *(_WORD *)&v20[22] = 1024;
          *(_DWORD *)v21 = 181;
          *(_WORD *)&v21[4] = 1024;
          *(_DWORD *)&v21[6] = v17;
          v22 = 1024;
          v23 = v18;
          v24 = 1024;
          v25 = v19;
          v26 = 1024;
          v27 = v16;
          _os_log_debug_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Timestamp delta between the current packet timestamp and the timestamp when the DTMF event was originated from IPT=%d, current event=%d, timestamp=%d, currentStartTimestamp=%d", v20, 0x34u);
        }
      }
      *(_DWORD *)(*(_QWORD *)(v1 + 32) + 44) += *(_DWORD *)(*(_QWORD *)(v1 + 32) + 64);
      *(_QWORD *)(*(_QWORD *)(v1 + 32) + 48) = 1;
      *(_DWORD *)(*(_QWORD *)(v1 + 32) + 56) = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
      return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "removeObjectAtIndex:", 0, *(_OWORD *)v20, *(_QWORD *)&v20[16], *(_QWORD *)v21);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_19;
    v15 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)v20 = 136315650;
    *(_QWORD *)&v20[4] = v15;
    *(_WORD *)&v20[12] = 2080;
    *(_QWORD *)&v20[14] = "-[DTMFEventHandler sendingDTMFEventWithTimeStamp:interval:RTPHandle:]_block_invoke";
    *(_WORD *)&v20[22] = 1024;
    *(_DWORD *)v21 = 170;
    v14 = " [%s] %s:%d DTMF: error, not a start block";
    goto LABEL_18;
  }
  if (*(_BYTE *)(v2 + 28))
  {
    result = objc_msgSend(*(id *)(v2 + 16), "count");
    if (result)
    {
      v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "objectAtIndexedSubscript:", 0);
      if (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("endTimestamp"))
        && objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pauseCompleteTimestamp")))
      {
        *(_DWORD *)(*(_QWORD *)(v1 + 32) + 52) = *(_DWORD *)(*(_QWORD *)(v1 + 32) + 64)
                                                 + objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("endTimestamp")), "unsignedIntegerValue");
        *(_DWORD *)(*(_QWORD *)(v1 + 32) + 56) = *(_DWORD *)(*(_QWORD *)(v1 + 32) + 64)
                                                 + objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pauseCompleteTimestamp")), "unsignedIntegerValue");
        *(_BYTE *)(*(_QWORD *)(v1 + 32) + 28) = 0;
        return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "removeObjectAtIndex:", 0, *(_OWORD *)v20, *(_QWORD *)&v20[16], *(_QWORD *)v21);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (v12 = VRTraceErrorLogLevelToCSTR(),
            v13 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_19:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 0;
        return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "removeObjectAtIndex:", 0, *(_OWORD *)v20, *(_QWORD *)&v20[16], *(_QWORD *)v21);
      }
      *(_DWORD *)v20 = 136315650;
      *(_QWORD *)&v20[4] = v12;
      *(_WORD *)&v20[12] = 2080;
      *(_QWORD *)&v20[14] = "-[DTMFEventHandler sendingDTMFEventWithTimeStamp:interval:RTPHandle:]_block_invoke";
      *(_WORD *)&v20[22] = 1024;
      *(_DWORD *)v21 = 196;
      v14 = " [%s] %s:%d DTMF: error, not a stop block";
LABEL_18:
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v14, v20, 0x1Cu);
      goto LABEL_19;
    }
  }
  return result;
}

- (void)stopDTMFEventAtTimestamp:(unsigned int)a3 withSampleRate:(unsigned int)a4
{
  NSObject *dtmfQueue;
  _QWORD block[5];
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  dtmfQueue = self->dtmfQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__DTMFEventHandler_stopDTMFEventAtTimestamp_withSampleRate___block_invoke;
  block[3] = &unk_1E9E52960;
  v6 = a3;
  v7 = a4;
  block[4] = self;
  dispatch_async(dtmfQueue, block);
}

uint64_t __60__DTMFEventHandler_stopDTMFEventAtTimestamp_withSampleRate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertStopBlockWithEndTimestamp:withPauseCompleteTimestamp:", *(unsigned int *)(a1 + 40), 120 * *(_DWORD *)(a1 + 44) / 0x3E8u + *(_DWORD *)(a1 + 40));
}

- (BOOL)shouldTransmitDTMFWithTimestamp:(unsigned int)a3
{
  NSObject *dtmfQueue;
  char v4;
  _QWORD v6[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = -86;
  dtmfQueue = self->dtmfQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__DTMFEventHandler_shouldTransmitDTMFWithTimestamp___block_invoke;
  v6[3] = &unk_1E9E54D70;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(dtmfQueue, v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __52__DTMFEventHandler_shouldTransmitDTMFWithTimestamp___block_invoke(uint64_t a1)
{
  uint64_t result;
  unsigned int v3;
  BOOL v4;
  char v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  BOOL v9;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (result
    && (result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", 0), "objectForKey:", CFSTR("startTimestamp"))) != 0)
  {
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", 0), "objectForKey:", CFSTR("startTimestamp")), "unsignedIntegerValue");
    v3 = result - *(_DWORD *)(a1 + 48);
    if (v3)
      v4 = v3 > 0x7FFFFFFE;
    else
      v4 = 1;
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_DWORD *)(v6 + 24);
  if (v7 == 2)
  {
    v8 = *(_DWORD *)(v6 + 56) - *(_DWORD *)(a1 + 48);
    if (v8)
      v9 = v8 >= 0x7FFFFFFF;
    else
      v9 = 1;
    if (!v9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      return result;
    }
    *(_DWORD *)(v6 + 24) = 0;
  }
  else if (v7 == 1)
  {
    v5 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  return result;
}

- (int)constructDTMFEventPacketWithEvent:(unsigned __int8)a3 volume:(unsigned __int8)a4 durationCounter:(unsigned int)a5 dataBuffer:(char *)a6 isEnd:(BOOL)a7
{
  char v7;
  unsigned int v8;
  unsigned int v9;

  *a6 = a3;
  if (a7)
    v7 = 0x80;
  else
    v7 = 0;
  a6[1] = v7 & 0xC0 | a4 & 0x3F;
  v8 = self->_rtpEventDuration * a5;
  if (v8 >= 0xFFFF)
    v9 = 0xFFFF;
  else
    v9 = self->_rtpEventDuration * a5;
  *((_WORD *)a6 + 1) = bswap32(v9) >> 16;
  return v8 > 0xFFFE || a7;
}

- (BOOL)shouldAdjustForLastPauseCompleteTimestamp:(unsigned int *)a3
{
  void *v5;
  unsigned int currentPauseCompleteTimestamp;

  if (-[NSMutableArray count](self->dtmfEventQueue, "count")
    && (v5 = (void *)objc_msgSend((id)-[NSMutableArray lastObject](self->dtmfEventQueue, "lastObject"), "objectForKeyedSubscript:", CFSTR("pauseCompleteTimestamp"))) != 0)
  {
    currentPauseCompleteTimestamp = objc_msgSend(v5, "unsignedIntegerValue");
  }
  else
  {
    if (!self->_currentEventState || self->currentEventNeedsEndBlock)
      return 0;
    currentPauseCompleteTimestamp = self->_currentPauseCompleteTimestamp;
  }
  *a3 = currentPauseCompleteTimestamp;
  return 1;
}

void __61__DTMFEventHandler_sendDTMFEvent_atTimestamp_withSampleRate___block_invoke_cold_1(uint64_t a1, int a2, os_log_t log)
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
  v6 = "-[DTMFEventHandler sendDTMFEvent:atTimestamp:withSampleRate:]_block_invoke";
  v7 = 1024;
  v8 = 139;
  v9 = 1024;
  v10 = a2;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d DTMF: error, unsupported event %u", (uint8_t *)&v3, 0x22u);
}

@end
