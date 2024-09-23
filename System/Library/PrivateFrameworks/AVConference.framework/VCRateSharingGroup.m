@implementation VCRateSharingGroup

- (VCRateSharingGroup)init
{
  VCRateSharingGroup *v2;
  VCRateControlShareProfile *v3;
  VCRateControlShareProfile *v4;
  NSObject *CustomRootQueue;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCRateSharingGroup;
  v2 = -[VCObject init](&v7, sel_init);
  if (v2)
  {
    v2->_rateSharingClientMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_shareProfileDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_rateSharingClientTargetBitrateDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = objc_alloc_init(VCRateControlShareProfile);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_shareProfileDictionary, "setObject:forKeyedSubscript:", v3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0));
    v4 = objc_alloc_init(VCRateControlShareProfile);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_shareProfileDictionary, "setObject:forKeyedSubscript:", v4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1));
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCRateSharingGroup.delegateQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (VCRateSharingGroup)initWithIdentifier:(id)a3
{
  VCRateSharingGroup *v3;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v3 = self;
  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = -[VCRateSharingGroup init](self, "init");
    if (v3)
    {
      v3->_mediaQueueIdentifier = (NSString *)objc_msgSend(a3, "copy");
      if (!-[VCRateSharingGroup createMediaQueue](v3, "createMediaQueue"))
      {
        VCMediaQueue_SetOneToOne((uint64_t)v3->_mediaQueue, 1);
        VCMediaQueue_Start((uint64_t)v3->_mediaQueue);
        return v3;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCRateSharingGroup initWithIdentifier:]";
      v12 = 1024;
      v13 = 63;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sharing group init failed due to nil identifier", (uint8_t *)&v8, 0x1Cu);
    }
  }

  return 0;
}

- (void)dealloc
{
  NSObject *delegateQueue;
  tagVCMediaQueue *mediaQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];

  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  VCMediaQueue_Stop((uint64_t)self->_mediaQueue);
  mediaQueue = self->_mediaQueue;
  if (mediaQueue)
    CFRelease(mediaQueue);
  v5.receiver = self;
  v5.super_class = (Class)VCRateSharingGroup;
  -[VCObject dealloc](&v5, sel_dealloc);
}

- (void)setVCMediaQueuePeakBitrateAndMaxTargetBitrate:(unsigned int)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  tagVCMediaQueue *mediaQueue;
  unsigned int maxBitrate;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  tagVCMediaQueue *v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  VCRateSharingGroup *v26;
  __int16 v27;
  tagVCMediaQueue *v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_maxBitrate < a3)
  {
    if (!VCMediaQueue_SetPeakBitrate(self->_mediaQueue, a3))
    {
      self->_maxBitrate = a3;
      return;
    }
    if ((VCRateSharingGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          mediaQueue = self->_mediaQueue;
          maxBitrate = self->_maxBitrate;
          v17 = 136316162;
          v18 = v6;
          v19 = 2080;
          v20 = "-[VCRateSharingGroup setVCMediaQueuePeakBitrateAndMaxTargetBitrate:]";
          v21 = 1024;
          v22 = 94;
          v23 = 2048;
          v24 = mediaQueue;
          v25 = 1024;
          LODWORD(v26) = maxBitrate;
          v10 = " [%s] %s:%d Peak bitrate set for mediaQueue=%p failed and _maxbitrate=%d did not change";
          v11 = v7;
          v12 = 44;
LABEL_14:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCRateSharingGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = self->_mediaQueue;
          v16 = self->_maxBitrate;
          v17 = 136316674;
          v18 = v13;
          v19 = 2080;
          v20 = "-[VCRateSharingGroup setVCMediaQueuePeakBitrateAndMaxTargetBitrate:]";
          v21 = 1024;
          v22 = 94;
          v23 = 2112;
          v24 = (void *)v5;
          v25 = 2048;
          v26 = self;
          v27 = 2048;
          v28 = v15;
          v29 = 1024;
          v30 = v16;
          v10 = " [%s] %s:%d %@(%p) Peak bitrate set for mediaQueue=%p failed and _maxbitrate=%d did not change";
          v11 = v14;
          v12 = 64;
          goto LABEL_14;
        }
      }
    }
  }
}

- (void)setTargetBitrate:(unsigned int)a3 fromRateSharingClient:(id)a4
{
  uint64_t v5;
  uint64_t v7;

  if (a4)
  {
    v5 = *(_QWORD *)&a3;
    -[VCObject lock](self, "lock");
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a4);
    -[NSMutableDictionary setObject:forKey:](self->_rateSharingClientTargetBitrateDict, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5), v7);
    if (self->_maxBitrate != (_DWORD)v5)
      -[VCRateSharingGroup setVCMediaQueuePeakBitrateAndMaxTargetBitrate:](self, "setVCMediaQueuePeakBitrateAndMaxTargetBitrate:", -[VCRateSharingGroup calculateMaxTargetBitrate](self, "calculateMaxTargetBitrate"));
    -[VCObject unlock](self, "unlock");
  }
}

- (BOOL)createMediaQueue
{
  int v3;
  _OWORD v5[7];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[56];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(v11, 170, sizeof(v11));
  v7 = xmmword_1D91092E8;
  v8 = unk_1D91092F8;
  v9 = xmmword_1D9109308;
  v10 = unk_1D9109318;
  *(_QWORD *)&v11[24] = -[NSString UTF8String](self->_mediaQueueIdentifier, "UTF8String", VCMediaQueue_GetPreSetConfiguration((uint64_t)&v7));
  v11[32] = -[VCDefaults mediaQueueDumpEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "mediaQueueDumpEnabled");
  v5[4] = *(_OWORD *)v11;
  v5[5] = *(_OWORD *)&v11[16];
  v5[6] = *(_OWORD *)&v11[32];
  v6 = *(_QWORD *)&v11[48];
  v5[0] = v7;
  v5[1] = v8;
  v5[2] = v9;
  v5[3] = v10;
  v3 = VCMediaQueue_Create((unint64_t *)&self->_mediaQueue, (unsigned int *)v5);
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRateSharingGroup createMediaQueue].cold.1();
    }
  }
  else
  {
    VCMediaQueue_SetMediaQueueSizeThresholdExceededBlock((uint64_t)self->_mediaQueue, (uint64_t)self, &__block_literal_global_8);
  }
  return v3 != 0;
}

uint64_t __38__VCRateSharingGroup_createMediaQueue__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    return objc_msgSend(a2, "handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:");
  return result;
}

- (void)handleMediaQueueSizeExceedThresholdWithQueueSize:(double)a3 mediaQueueStreamId:(unsigned int)a4 type:(int)a5
{
  VCRateSharingGroup *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BYTE v33[20];
  unsigned int v34;
  __int16 v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v9 = (VCRateSharingGroup *)objc_opt_class();
  if (a5 == 1)
  {
    if (v9 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_19;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v26 = 136316162;
      v27 = v12;
      v28 = 2080;
      v29 = "-[VCRateSharingGroup handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
      v30 = 1024;
      v31 = 140;
      v32 = 1024;
      *(_DWORD *)v33 = a4;
      *(_WORD *)&v33[4] = 2048;
      *(double *)&v33[6] = a3;
      v14 = " [%s] %s:%d VCMediaQueue size threshold exceeded for mediaQueueStreamId=%u queueSizeInSecond=%f - FLUSHING!";
      v15 = v13;
      v16 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCRateSharingGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_19;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v26 = 136316674;
      v27 = v22;
      v28 = 2080;
      v29 = "-[VCRateSharingGroup handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
      v30 = 1024;
      v31 = 140;
      v32 = 2112;
      *(_QWORD *)v33 = v10;
      *(_WORD *)&v33[8] = 2048;
      *(_QWORD *)&v33[10] = self;
      *(_WORD *)&v33[18] = 1024;
      v34 = a4;
      v35 = 2048;
      *(double *)v36 = a3;
      v14 = " [%s] %s:%d %@(%p) VCMediaQueue size threshold exceeded for mediaQueueStreamId=%u queueSizeInSecond=%f - FLUSHING!";
      v15 = v23;
      v16 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v26, v16);
LABEL_19:
    VCMediaQueue_FlushPacketsInStream((uint64_t)self->_mediaQueue, a4, 1);
    return;
  }
  if (v9 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    v26 = 136316418;
    v27 = v17;
    v28 = 2080;
    v29 = "-[VCRateSharingGroup handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
    v30 = 1024;
    v31 = 144;
    v32 = 1024;
    *(_DWORD *)v33 = a5;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = a4;
    *(_WORD *)&v33[10] = 2048;
    *(double *)&v33[12] = a3;
    v19 = " [%s] %s:%d Should not handle media queue threshold exceeded with type=%d for mediaQueueStreamId=%u queueSize=%f!";
    v20 = v18;
    v21 = 50;
LABEL_25:
    _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v26, v21);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = (const __CFString *)-[VCRateSharingGroup performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v11 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v26 = 136316930;
      v27 = v24;
      v28 = 2080;
      v29 = "-[VCRateSharingGroup handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
      v30 = 1024;
      v31 = 144;
      v32 = 2112;
      *(_QWORD *)v33 = v11;
      *(_WORD *)&v33[8] = 2048;
      *(_QWORD *)&v33[10] = self;
      *(_WORD *)&v33[18] = 1024;
      v34 = a5;
      v35 = 1024;
      LODWORD(v36[0]) = a4;
      WORD2(v36[0]) = 2048;
      *(double *)((char *)v36 + 6) = a3;
      v19 = " [%s] %s:%d %@(%p) Should not handle media queue threshold exceeded with type=%d for mediaQueueStreamId=%u queueSize=%f!";
      v20 = v25;
      v21 = 70;
      goto LABEL_25;
    }
  }
}

- (BOOL)registerRateSharingClient:(id)a3 forInterfaceType:(unsigned int)a4
{
  uint64_t v4;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  VCRateSharingGroup *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v4 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x1E0C80C00];
  if (a4 >= 2)
  {
    if ((VCRateSharingGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateSharingGroup registerRateSharingClient:forInterfaceType:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCRateSharingGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v15 = v11;
          v16 = 2080;
          v17 = "-[VCRateSharingGroup registerRateSharingClient:forInterfaceType:]";
          v18 = 1024;
          v19 = 151;
          v20 = 2112;
          v21 = (id)v7;
          v22 = 2048;
          v23 = self;
          v24 = 1024;
          v25 = v4;
          _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Registering with an invalid interface type=%u", buf, 0x36u);
        }
      }
    }
  }
  else
  {
    -[VCObject lock](self, "lock");
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4)))
    {
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4)), "addObject:", a3);
    }
    else
    {
      v8 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", a3, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rateSharingClientMap, "setObject:forKeyedSubscript:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
    }
    -[VCRateSharingGroup updateShareProfileForInterfaceType:](self, "updateShareProfileForInterfaceType:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
    -[VCObject unlock](self, "unlock");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v15 = v9;
        v16 = 2080;
        v17 = "-[VCRateSharingGroup registerRateSharingClient:forInterfaceType:]";
        v18 = 1024;
        v19 = 163;
        v20 = 2048;
        v21 = a3;
        v22 = 1024;
        LODWORD(v23) = v4;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Registered rateSharingClient=%p for interface type=%u", buf, 0x2Cu);
      }
    }
  }
  return v4 < 2;
}

- (void)updateShareProfileForInterfaceType:(id)a3
{
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *delegateQueue;
  _QWORD block[7];
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = -[VCRateSharingGroup countRateControllersForInterfaceType:](self, "countRateControllersForInterfaceType:");
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_shareProfileDictionary, "objectForKeyedSubscript:", a3);
  v7 = v6;
  if (v5 <= 1)
    v8 = 1;
  else
    v8 = v5;
  objc_msgSend(v6, "setRateSharingCount:", v8);
  objc_msgSend(v7, "setReservedBitrate:", 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:", a3);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
        delegateQueue = self->_delegateQueue;
        block[0] = v13;
        block[1] = 3221225472;
        block[2] = __57__VCRateSharingGroup_updateShareProfileForInterfaceType___block_invoke;
        block[3] = &unk_1E9E527D0;
        block[4] = v15;
        block[5] = self;
        block[6] = a3;
        dispatch_async(delegateQueue, block);
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v11);
  }
}

uint64_t __57__VCRateSharingGroup_updateShareProfileForInterfaceType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShareProfile:", (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)), "copy"));
}

- (unsigned)countRateControllersForInterfaceType:(id)a3
{
  uint64_t v5;

  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:");
  if (v5)
    LODWORD(v5) = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:", a3), "count");
  return v5;
}

- (unsigned)calculateMaxTargetBitrate
{
  NSMutableDictionary *rateSharingClientTargetBitrateDict;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  unsigned int v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  rateSharingClientTargetBitrateDict = self->_rateSharingClientTargetBitrateDict;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](rateSharingClientTargetBitrateDict, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(rateSharingClientTargetBitrateDict);
      v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientTargetBitrateDict, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)), "intValue");
      if (v6 <= v9)
        v6 = v9;
    }
    v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](rateSharingClientTargetBitrateDict, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  }
  while (v5);
  return v6;
}

- (BOOL)deregisterRateSharingClient:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  BOOL v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  NSMutableDictionary *obj;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  VCRateSharingGroup *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[VCObject lock](self, "lock");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = self->_rateSharingClientMap;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (!v5)
    goto LABEL_17;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v36;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v36 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:", v10), "containsObject:", a3))
      {
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a3);
        v12 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientTargetBitrateDict, "objectForKeyedSubscript:", v11), "intValue");
        -[NSMutableDictionary removeObjectForKey:](self->_rateSharingClientTargetBitrateDict, "removeObjectForKey:", v11);
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:", v10), "removeObject:", a3);
        if (v12 == self->_maxBitrate)
          -[VCRateSharingGroup setVCMediaQueuePeakBitrateAndMaxTargetBitrate:](self, "setVCMediaQueuePeakBitrateAndMaxTargetBitrate:", -[VCRateSharingGroup calculateMaxTargetBitrate](self, "calculateMaxTargetBitrate"));
        -[VCRateSharingGroup updateShareProfileForInterfaceType:](self, "updateShareProfileForInterfaceType:", v10);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v15 = objc_msgSend(v10, "unsignedIntValue");
            *(_DWORD *)buf = 136316162;
            v23 = v13;
            v24 = 2080;
            v25 = "-[VCRateSharingGroup deregisterRateSharingClient:]";
            v26 = 1024;
            v27 = 215;
            v28 = 2048;
            v29 = a3;
            v30 = 1024;
            LODWORD(v31) = v15;
            _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d De-registered rateSharingClient=%p for interface type=%u", buf, 0x2Cu);
          }
        }
        v7 = 1;
      }
    }
    v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  }
  while (v6);
  if ((v7 & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
LABEL_17:
    if ((VCRateSharingGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateSharingGroup deregisterRateSharingClient:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCRateSharingGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v23 = v18;
          v24 = 2080;
          v25 = "-[VCRateSharingGroup deregisterRateSharingClient:]";
          v26 = 1024;
          v27 = 219;
          v28 = 2112;
          v29 = (id)v17;
          v30 = 2048;
          v31 = self;
          v32 = 2048;
          v33 = a3;
          _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) De-registering an unregistered rateSharingClient=%p", buf, 0x3Au);
        }
      }
    }
    v16 = 0;
  }
  -[VCObject unlock](self, "unlock");
  return v16;
}

- (tagVCMediaQueue)mediaQueue
{
  return self->_mediaQueue;
}

- (unsigned)maxBitrate
{
  return self->_maxBitrate;
}

- (void)createMediaQueue
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaQueue failed for VCRateSharingGroup=%p", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)registerRateSharingClient:forInterfaceType:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v4 = 151;
  v5 = v0;
  v6 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Registering with an invalid interface type=%u", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)deregisterRateSharingClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d De-registering an unregistered rateSharingClient=%p", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
