@implementation VCMockIDSDatagramChannel

- (BOOL)setupMockIDSDatagramChannelRequiresOptions:(BOOL)a3 sourcePort:(signed __int16)a4
{
  VCMockIDSDataChannelLinkContext *v6;
  NSLock *v7;
  NSLock *v8;
  NSLock *v9;
  double v10;
  tagVCRealTimeThread *v11;
  _BOOL4 v12;

  v6 = -[VCMockIDSDataChannelLinkContext initWithSourcePort:]([VCMockIDSDataChannelLinkContext alloc], "initWithSourcePort:", a4);
  self->_linkContext = v6;
  if (v6)
  {
    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    self->_blockSettingLock = v7;
    if (v7)
    {
      v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
      self->_writeDirectPathIDSLock = v8;
      if (v8)
      {
        v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
        self->_flushDatagramPacketsLock = v9;
        if (v9)
        {
          if (VCAllocatorFirstCome_Create((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (uint64_t)"com.apple.AVConference.VCMockIDSDatagramChannel.MOCKDatagramChannelPacketAllocator", &self->_datagramPacketAllocator))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v12)
                return v12;
              -[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:].cold.6();
            }
          }
          else
          {
            VCSingleLinkedListInitialize((uint64_t)&self->_datagramPackets, (uint64_t)_VCMockIDSDatagramChannel_ComparePacket);
            VCSingleLinkedListInitialize((uint64_t)&self->_datagramPacketsDirectIDSPath, (uint64_t)_VCMockIDSDatagramChannel_ComparePacket);
            self->_usingOptions = a3;
            objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "emulatedRxPLR");
            self->_emulatedRxPLR = v10;
            pthread_mutex_init(&self->_streamSubscriptionLock, 0);
            self->_subscribedStreamsByParticipantID = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            self->_doNotDropNackOrRetransmitted = +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableMockDatagramChannelDoNotDropNack"), 0);
            self->_isSourceParticipantIDOnFanOutPacketsEnabled = +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("mockDatagramChannelAddSourceParticipantIDOnFanOutPackets"), 0);
            self->_isWrongParticipantIDOnFanOutPacketsEnabled = +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("mockDatagramChannelAddWrongParticipantIDOnFanOutPackets"), 0);
            self->_isECNEnabled = VCDefaults_GetBoolValueForKey(CFSTR("ecnEnabled"), 0);
            self->_isShortMKIEnabled = VCFeatureFlagManager_UseShortMKI();
            self->_isTestNetworkRouterEnabled = VCDefaults_GetBoolValueForKey(CFSTR("enableTestNetworkRouter"), 0);
            self->_isTwoWayFaceTimeTestUsingSocketsEnabled = VCDefaults_GetBoolValueForKey(CFSTR("twoWayFaceTimeTestUsingSocketsEnabled"), 0);
            bzero(self->_packetBuffer, 0x2EE000uLL);
            if (!self->_isTwoWayFaceTimeTestUsingSocketsEnabled
              || (v11 = (tagVCRealTimeThread *)VCRealTimeThread_Initialize(20, (uint64_t)VCMockIDSDatagramChannelReceiveThread, (uint64_t)self, "com.apple.avconference.mockdatagramchannel.recvproc", 3), (self->_packetReceiveThread = v11) != 0))
            {
              LOBYTE(v12) = 1;
              return v12;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v12)
                return v12;
              -[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:].cold.5();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v12)
            return v12;
          -[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:].cold.4();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v12)
          return v12;
        -[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v12)
        return v12;
      -[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v12)
      return v12;
    -[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:].cold.1();
  }
  LOBYTE(v12) = 0;
  return v12;
}

- (id)initRequiresOptions:(BOOL)a3
{
  _BOOL8 v3;
  VCMockIDSDatagramChannel *v4;
  VCMockIDSDatagramChannel *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  VCMockIDSDatagramChannel *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCMockIDSDatagramChannel;
  v4 = -[IDSDatagramChannel initWithSocketDescriptor:](&v10, sel_initWithSocketDescriptor_, 0);
  v5 = v4;
  if (v4)
  {
    if (-[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:](v4, "setupMockIDSDatagramChannelRequiresOptions:sourcePort:", v3, 16430))
    {
      v5->_isValid = 1;
      v5->_isNackEnabled = VCDefaults_GetIntValueForKey(CFSTR("suppressNackFulfillmentByMockIDSDatagramChannel"), 0) == 0;
    }
    else
    {

      v5 = 0;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    v8 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v12 = v6;
        v13 = 2080;
        v14 = "-[VCMockIDSDatagramChannel initRequiresOptions:]";
        v15 = 1024;
        v16 = 260;
        v17 = 2048;
        v18 = v5;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMockIDSDatagramChannel=%p created", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[VCMockIDSDatagramChannel initRequiresOptions:].cold.1();
    }
  }
  return v5;
}

- (id)initCreateSocketRequiresOptions:(BOOL)a3 dataPath:(int)a4 destination:(id)a5
{
  _BOOL8 v7;
  VCMockIDSDatagramChannel *v8;
  void *v9;
  void *v10;
  __int16 v11;
  int v12;
  BOOL v13;
  int ErrorLogLevelForModule;
  uint64_t v15;
  NSObject *v16;
  int socket;
  NSObject *CustomRootQueue;
  dispatch_queue_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v7 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)VCMockIDSDatagramChannel;
  v8 = -[IDSDatagramChannel initWithSocketDescriptor:](&v25, sel_initWithSocketDescriptor_, 0);
  if (v8)
  {
    if (a5
      && (v9 = (void *)objc_msgSend(a5, "componentsSeparatedByString:", CFSTR(":"))) != 0
      && (v10 = v9, (unint64_t)objc_msgSend(v9, "count") >= 2)
      && (int)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 1), "intValue") >= 1)
    {
      v11 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 1), "intValue");
    }
    else
    {
      v11 = 16430;
    }
    v12 = v11;
    if (-[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:](v8, "setupMockIDSDatagramChannelRequiresOptions:sourcePort:", v7, v11))
    {
      v13 = -[VCMockIDSDatagramChannel createSocketWithSourcePort:](v8, "createSocketWithSourcePort:", v11);
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v13)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            socket = v8->_socket;
            *(_DWORD *)buf = 136316162;
            v27 = v15;
            v28 = 2080;
            v29 = "-[VCMockIDSDatagramChannel initCreateSocketRequiresOptions:dataPath:destination:]";
            v30 = 1024;
            v31 = 276;
            v32 = 1024;
            v33 = socket;
            v34 = 1024;
            v35 = v12;
            _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created socket=%d for sourcePort=%u", buf, 0x28u);
          }
        }
        CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(58);
        v19 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMockIDSDatagramChannel.directPathReadQueue", 0, CustomRootQueue);
        v8->_directPathReadQueue = (OS_dispatch_queue *)v19;
        if (v19)
        {
          v20 = VCDispatchQueue_GetCustomRootQueue(56);
          v21 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMockIDSDatagramChannel.directPathRTXQueue", 0, v20);
          v8->_directPathRTXQueue = (OS_dispatch_queue *)v21;
          if (v21)
          {
            v8->_isValid = 1;
            v8->_isNackEnabled = VCDefaults_GetIntValueForKey(CFSTR("suppressNackFulfillmentByMockIDSDatagramChannel"), 0) == 0;
            v8->_dataPath = a4;
            return v8;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMockIDSDatagramChannel initCreateSocketRequiresOptions:dataPath:destination:].cold.2();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMockIDSDatagramChannel initCreateSocketRequiresOptions:dataPath:destination:].cold.1();
        }
      }
      else if (ErrorLogLevelForModule >= 3)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMockIDSDatagramChannel initCreateSocketRequiresOptions:dataPath:destination:].cold.3(v24);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMockIDSDatagramChannel initCreateSocketRequiresOptions:dataPath:destination:].cold.4(v23);
    }

    return 0;
  }
  return v8;
}

- (void)flushDatagramPacketsList
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Datagram packet queue has remaining elements", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)flushDatagramPacketsListDIrectIDSPath
{
  uint64_t *p_datagramPacketsDirectIDSPath;
  uint64_t *v4;
  uint64_t *v5;

  p_datagramPacketsDirectIDSPath = (uint64_t *)&self->_datagramPacketsDirectIDSPath;
  v4 = VCSingleLinkedListPop((uint64_t *)&self->_datagramPacketsDirectIDSPath);
  if (v4)
  {
    v5 = v4;
    do
    {
      CFAllocatorDeallocate(self->_datagramPacketAllocator, v5);
      v5 = VCSingleLinkedListPop(p_datagramPacketsDirectIDSPath);
    }
    while (v5);
  }
}

- (void)cleanup
{
  id eventHandler;
  __CFAllocator *datagramPacketAllocator;
  id readHandlerWithOptions;
  id readHandler;
  id sharedWriteCompletionHandler;
  VCMockIDSDataChannelLinkContext *linkContext;
  id writeDatagramsBlock;
  id writeDatagramBlock;
  id readyToReadBlock;
  NSDictionary *subscribedStreamsByParticipantID;

  VCCloseSocketIfValid(self->_socket);
  self->_socket = -1;
  eventHandler = self->_eventHandler;
  if (eventHandler)
  {
    CFRelease(eventHandler);
    self->_eventHandler = 0;
  }
  -[VCMockIDSDatagramChannel flushDatagramPacketsList](self, "flushDatagramPacketsList");
  -[NSLock lock](self->_flushDatagramPacketsLock, "lock");
  -[VCMockIDSDatagramChannel flushDatagramPacketsListDIrectIDSPath](self, "flushDatagramPacketsListDIrectIDSPath");
  -[NSLock unlock](self->_flushDatagramPacketsLock, "unlock");
  datagramPacketAllocator = self->_datagramPacketAllocator;
  if (datagramPacketAllocator)
  {
    CFRelease(datagramPacketAllocator);
    self->_datagramPacketAllocator = 0;
  }
  readHandlerWithOptions = self->_readHandlerWithOptions;
  if (readHandlerWithOptions)
  {
    CFRelease(readHandlerWithOptions);
    self->_readHandlerWithOptions = 0;
  }
  readHandler = self->_readHandler;
  if (readHandler)
  {
    CFRelease(readHandler);
    self->_readHandler = 0;
  }
  sharedWriteCompletionHandler = self->_sharedWriteCompletionHandler;
  if (sharedWriteCompletionHandler)
  {
    CFRelease(sharedWriteCompletionHandler);
    self->_sharedWriteCompletionHandler = 0;
  }
  linkContext = self->_linkContext;
  if (linkContext)
  {
    CFRelease(linkContext);
    self->_linkContext = 0;
  }
  writeDatagramsBlock = self->_writeDatagramsBlock;
  if (writeDatagramsBlock)
  {
    CFRelease(writeDatagramsBlock);
    self->_writeDatagramsBlock = 0;
  }
  writeDatagramBlock = self->_writeDatagramBlock;
  if (writeDatagramBlock)
  {
    CFRelease(writeDatagramBlock);
    self->_writeDatagramBlock = 0;
  }
  readyToReadBlock = self->_readyToReadBlock;
  if (readyToReadBlock)
  {
    CFRelease(readyToReadBlock);
    self->_readyToReadBlock = 0;
  }
  subscribedStreamsByParticipantID = self->_subscribedStreamsByParticipantID;
  if (subscribedStreamsByParticipantID)
  {
    CFRelease(subscribedStreamsByParticipantID);
    self->_subscribedStreamsByParticipantID = 0;
  }
}

- (void)dealloc
{
  NSObject *directPathReadQueue;
  NSObject *directPathRTXQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_isValid)
    -[VCMockIDSDatagramChannel cleanup](self, "cleanup");
  self->_isValid = 0;

  self->_blockSettingLock = 0;
  self->_writeDirectPathIDSLock = 0;

  self->_flushDatagramPacketsLock = 0;
  directPathReadQueue = self->_directPathReadQueue;
  if (directPathReadQueue)
  {
    dispatch_release(directPathReadQueue);
    self->_directPathReadQueue = 0;
  }
  directPathRTXQueue = self->_directPathRTXQueue;
  if (directPathRTXQueue)
  {
    dispatch_release(directPathRTXQueue);
    self->_directPathRTXQueue = 0;
  }
  pthread_mutex_destroy(&self->_streamSubscriptionLock);
  v5.receiver = self;
  v5.super_class = (Class)VCMockIDSDatagramChannel;
  -[IDSDatagramChannel dealloc](&v5, sel_dealloc);
}

- (BOOL)idsUPlusOneMode
{
  return -[VCMockIDSDataChannelLinkContext idsUPlusOneMode](self->_linkContext, "idsUPlusOneMode");
}

- (void)readDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramOptions:(id *)a5
{
  uint64_t v6;
  uint64_t isECNEnabled;
  unsigned __int8 v10;
  uint64_t v11;
  void (**readHandler)(id, const void *, uint64_t, uint64_t, uint64_t, _QWORD);
  void (**readHandlerWithOptions)(id, const void *, uint64_t, uint64_t, uint64_t, $064201D6FEA54BB76D3D1A900A0960B3 *, _QWORD);

  v6 = *(_QWORD *)&a4;
  isECNEnabled = self->_isECNEnabled;
  v10 = -[VCMockIDSDataChannelLinkContext linkID](self->_linkContext, "linkID");
  if ((_DWORD)v6 || a5 && a5->var7)
  {
    v11 = isECNEnabled << 32;
    readHandler = (void (**)(id, const void *, uint64_t, uint64_t, uint64_t, _QWORD))self->_readHandler;
    if (readHandler)
      readHandler[2](readHandler, a3, v6, v11 | 0xAA000000AA00 | v10, 43520, 0);
    readHandlerWithOptions = (void (**)(id, const void *, uint64_t, uint64_t, uint64_t, $064201D6FEA54BB76D3D1A900A0960B3 *, _QWORD))self->_readHandlerWithOptions;
    if (readHandlerWithOptions)
      readHandlerWithOptions[2](readHandlerWithOptions, a3, v6, v11 | 0xAA000000AA00 | v10, 43520, a5, 0);
  }
}

- (void)setWriteDatagramsBlock:(id)a3
{
  id writeDatagramsBlock;

  -[NSLock lock](self->_blockSettingLock, "lock");
  writeDatagramsBlock = self->_writeDatagramsBlock;
  if (writeDatagramsBlock)
  {
    CFRelease(writeDatagramsBlock);
    self->_writeDatagramsBlock = 0;
  }
  self->_writeDatagramsBlock = (id)objc_msgSend(a3, "copy");
  -[NSLock unlock](self->_blockSettingLock, "unlock");
}

- (void)setWriteDatagramBlock:(id)a3
{
  id writeDatagramBlock;

  -[NSLock lock](self->_blockSettingLock, "lock");
  writeDatagramBlock = self->_writeDatagramBlock;
  if (writeDatagramBlock)
  {
    CFRelease(writeDatagramBlock);
    self->_writeDatagramBlock = 0;
  }
  self->_writeDatagramBlock = (id)objc_msgSend(a3, "copy");
  -[NSLock unlock](self->_blockSettingLock, "unlock");
}

- (void)setReadyToReadBlock:(id)a3
{
  id readyToReadBlock;

  -[NSLock lock](self->_blockSettingLock, "lock");
  readyToReadBlock = self->_readyToReadBlock;
  if (readyToReadBlock)
  {
    CFRelease(readyToReadBlock);
    self->_readyToReadBlock = 0;
  }
  self->_readyToReadBlock = (id)objc_msgSend(a3, "copy");
  -[NSLock unlock](self->_blockSettingLock, "unlock");
}

- (void)signalUnderlyingFileDescriptor
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11_15();
  OUTLINED_FUNCTION_4_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Send failed %d errno %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9_5();
}

+ (void)extractRTPData:(char *)a3 ssrc:(unsigned int *)a4 sequenceNumber:(unsigned __int16 *)a5
{
  if (a3 && a5)
    *a5 = bswap32(*((unsigned __int16 *)a3 + 1)) >> 16;
  if (a3)
  {
    if (a4)
      *a4 = bswap32(*((_DWORD *)a3 + 2));
  }
}

- (BOOL)enqueueDatagramPacket:(const void *)a3 datagramSize:(unsigned int)a4 options:(id *)a5 error:(id *)a6
{
  uint64_t v8;
  void *v11;
  _VCMockIDSDatagramChannelPacket *v12;
  _BOOL4 v13;
  char v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  BOOL v18;
  uint64_t v19;
  NSObject *v20;
  int v22;
  unsigned __int16 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v8 = *(_QWORD *)&a4;
  v38 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_blockSettingLock, "lock");
  if (!self->_isValid)
  {
    if (a6)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = CFSTR("Trying to enqueue to invalidated VCMockIDSDatagramChannel");
LABEL_12:
      v18 = 0;
      *a6 = (id)objc_msgSend(v16, "AVConferenceServiceError:detailCode:description:", 32000, 0, v17);
      goto LABEL_19;
    }
LABEL_13:
    v18 = 0;
    goto LABEL_19;
  }
  v11 = CFAllocatorAllocate(self->_datagramPacketAllocator, 1656, 0);
  if (!v11)
  {
    if (a6)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = CFSTR("Failed to allocate packet");
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v12 = -[VCMockIDSDatagramChannel constructPacket:datagram:datagramSize:datagramOptions:](self, "constructPacket:datagram:datagramSize:datagramOptions:", v11, a3, v8, a5);
  v13 = -[VCMockIDSDatagramChannel isNACKPacket:length:](self, "isNACKPacket:length:", v12->var1, v12->var2);
  v14 = VCSingleLinkedListPush((uint64_t)&self->_datagramPackets, v12);
  -[VCMockIDSDatagramChannel signalUnderlyingFileDescriptor](self, "signalUnderlyingFileDescriptor");
  if ((v14 & 1) == 0)
  {
    if (v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMockIDSDatagramChannel enqueueDatagramPacket:datagramSize:options:error:].cold.1(v15);
      }
    }
    else
    {
      v23 = 0;
      v22 = 0;
      +[VCMockIDSDatagramChannel extractRTPData:ssrc:sequenceNumber:](VCMockIDSDatagramChannel, "extractRTPData:ssrc:sequenceNumber:", v12->var1, &v22, &v23);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          v25 = v19;
          v26 = 2080;
          v27 = "-[VCMockIDSDatagramChannel enqueueDatagramPacket:datagramSize:options:error:]";
          v28 = 1024;
          v29 = 452;
          v30 = 1024;
          v31 = v22;
          v32 = 1024;
          v33 = v22;
          v34 = 1024;
          v35 = v23;
          v36 = 1024;
          v37 = v23;
          _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d failing to enqueue Media ssrc=%u ssrc_hex=%x seq=%d seq_hex=%x", buf, 0x34u);
        }
      }
    }
    CFAllocatorDeallocate(self->_datagramPacketAllocator, v12);
  }
  v18 = 1;
LABEL_19:
  -[NSLock unlock](self->_blockSettingLock, "unlock");
  return v18;
}

- (BOOL)isControlChannelDatagram:(_VCMockIDSDatagramChannelPacket *)a3
{
  return (a3->var1[0] & 0xC3) == 64;
}

- (id)newArrayOfStreamIdsForPacket:(_VCMockIDSDatagramChannelPacket *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3->var4.var4);
  if (a3->var4.var4 >= 1)
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedShort:", a3->var4.var5[v5]);
      objc_msgSend(v4, "addObject:", v6);

      ++v5;
    }
    while (v5 < a3->var4.var4);
  }
  return v4;
}

- (BOOL)shouldReadPacket:(_VCMockIDSDatagramChannelPacket *)a3
{
  BOOL v5;
  id v6;
  NSDictionary *subscribedStreamsByParticipantID;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _opaque_pthread_mutex_t *p_streamSubscriptionLock;
  char v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (-[VCMockIDSDatagramChannel isControlChannelDatagram:](self, "isControlChannelDatagram:"))
    return 1;
  if (!a3->var3)
    goto LABEL_7;
  if (!a3->var4.var4)
    return 1;
  if (a3->var4.var7 && (a3->var4.var0 & 0x40) != 0)
  {
    self->_datagramOptionsCached.statsID = a3->var4.var7;
    self->_datagramOptionsCached.statsPayload.totalServerPacketSent = self->numPacketSent;
    self->_datagramOptionsCached.statsPayload.totalServerPacketReceived = self->numPacketReceived;
    self->_datagramOptionsCached.statsPayload.serverTimestamp = (int)(micro() * 1000.0);
    v21 = 1;
    self->_isServerStatsCached = 1;
    a3->var4.var7 = 0;
    a3->var4.var0 &= ~0x40u;
    a3->var4.var8.var4 = 0;
    *(_QWORD *)&a3->var4.var8.var0 = 0;
  }
  else
  {
LABEL_7:
    v21 = 0;
  }
  pthread_mutex_lock(&self->_streamSubscriptionLock);
  v5 = -[VCMockIDSDataChannelLinkContext idsUPlusOneMode](self->_linkContext, "idsUPlusOneMode");
  v6 = -[VCMockIDSDatagramChannel newArrayOfStreamIdsForPacket:](self, "newArrayOfStreamIdsForPacket:", a3);
  p_streamSubscriptionLock = &self->_streamSubscriptionLock;
  if (-[NSDictionary count](self->_subscribedStreamsByParticipantID, "count") && objc_msgSend(v6, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    subscribedStreamsByParticipantID = self->_subscribedStreamsByParticipantID;
    v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](subscribedStreamsByParticipantID, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(subscribedStreamsByParticipantID);
          if (v5)
          {
            v5 = 1;
            goto LABEL_26;
          }
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", -[NSDictionary objectForKeyedSubscript:](self->_subscribedStreamsByParticipantID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i)));
          objc_msgSend(v12, "intersectSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6));
          v13 = objc_msgSend(v12, "count");
          v5 = v13 != 0;
          if (v13)
          {
            v14 = v21;
            if (!self->_isServerStatsCached)
              v14 = 1;
            if ((v14 & 1) == 0 && a3->var3)
            {
              a3->var4.var0 |= 0x40u;
              a3->var4.var7 = self->_datagramOptionsCached.statsID;
              v15 = *(_QWORD *)&self->_datagramOptionsCached.statsPayload.serverTimestamp;
              a3->var4.var8.var4 = self->_datagramOptionsCached.statsPayload.uplinkBandwidth;
              *(_QWORD *)&a3->var4.var8.var0 = v15;
              self->_isServerStatsCached = 0;
            }
          }

        }
        v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](subscribedStreamsByParticipantID, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
        if (v9)
          continue;
        break;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    v19 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v28 = v17;
        v29 = 2080;
        v30 = "-[VCMockIDSDatagramChannel shouldReadPacket:]";
        v31 = 1024;
        v32 = 513;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Trying to filter packet when there is either no stream subscription or packet's streamID isnt set", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      -[VCMockIDSDatagramChannel shouldReadPacket:].cold.1();
    }
  }
LABEL_26:

  pthread_mutex_unlock(p_streamSubscriptionLock);
  return v5;
}

- (void)dequeueDatagramPacket:(id)a3
{
  uint64_t *v5;
  uint64_t *v6;

  -[NSLock lock](self->_blockSettingLock, "lock");
  while (self->_isValid)
  {
    v5 = VCSingleLinkedListPop((uint64_t *)&self->_datagramPackets);
    if (!v5)
      break;
    v6 = v5;
    -[VCMockIDSDatagramChannel processPacket:packetHandler:](self, "processPacket:packetHandler:", v5, a3);
    CFAllocatorDeallocate(self->_datagramPacketAllocator, v6);
  }
  -[NSLock unlock](self->_blockSettingLock, "unlock");
}

- (BOOL)isMediaPacket:(char *)a3 length:(unint64_t)a4
{
  BOOL result;

  result = 0;
  if (a3)
  {
    if (a4)
      return (*a3 & 0xC0) == 128;
  }
  return result;
}

- (BOOL)isRTCPPacket:(char *)a3 length:(unint64_t)a4
{
  BOOL result;

  result = 0;
  if (a3)
  {
    if (a4)
      return (*a3 & 0xC0) == 64;
  }
  return result;
}

- (BOOL)isNACKPacket:(char *)a3 length:(unint64_t)a4
{
  BOOL result;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  result = 0;
  v38 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    if (a3[1] << 8 == 52480)
    {
      v7 = *((unsigned __int16 *)a3 + 1);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = bswap32(*((_DWORD *)a3 + 1));
          v11 = bswap32(*((_DWORD *)a3 + 2));
          v12 = bswap32(*((unsigned __int16 *)a3 + 6));
          v13 = bswap32(*((unsigned __int16 *)a3 + 7));
          v14 = 136317954;
          v15 = v8;
          v16 = 2080;
          v17 = "-[VCMockIDSDatagramChannel isNACKPacket:length:]";
          v18 = 1024;
          v19 = 580;
          v20 = 1024;
          v21 = v10;
          v22 = 1024;
          v23 = v10;
          v24 = 1024;
          v25 = v11;
          v26 = 1024;
          v27 = v11;
          v28 = 1024;
          v29 = HIWORD(v12);
          v30 = 1024;
          v31 = HIWORD(v12);
          v32 = 1024;
          v33 = HIWORD(v13);
          v34 = 2048;
          v35 = a4;
          v36 = 2048;
          v37 = bswap32(v7) >> 16;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Generic NACK packet received, ssrc=%u ssrc_hex=%x source_ssrc=%u source_ssrc_hex=%x highestSeqNum=%d highestSeqNum_hex=%x bitMask=%x length passed=%zu length in pkt=%zu", (uint8_t *)&v14, 0x5Au);
        }
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)readDatagramWithCompletionHandler:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCMockIDSDatagramChannel readDatagramWithCompletionHandler:]";
      v9 = 1024;
      v10 = 589;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: readDatagramWithCompletionHandler NOT SUPPORTED", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)processWriteCompletionCallback:(id)a3 forDatagramWithSize:(unint64_t)a4 error:(id)a5
{
  void (**sharedWriteCompletionHandler)(id, id, unint64_t);

  -[NSLock lock](self->_writeDirectPathIDSLock, "lock");
  if (a3)
  {
    (*((void (**)(id, id))a3 + 2))(a3, a5);
  }
  else
  {
    sharedWriteCompletionHandler = (void (**)(id, id, unint64_t))self->_sharedWriteCompletionHandler;
    if (sharedWriteCompletionHandler)
      sharedWriteCompletionHandler[2](sharedWriteCompletionHandler, a5, a4);
  }
  -[NSLock unlock](self->_writeDirectPathIDSLock, "unlock");
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 flags:(id)a5 completionHandler:(id)a6
{
  id writeDatagramBlock;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  writeDatagramBlock = self->_writeDatagramBlock;
  if (writeDatagramBlock)
  {
    (*((void (**)(id, const void *, _QWORD, _QWORD, _QWORD, _QWORD, id, id))writeDatagramBlock + 2))(writeDatagramBlock, a3, *(_QWORD *)&a4, *(_QWORD *)&a5.var0, *(unsigned __int16 *)&a5.var4, 0, a6, self->_sharedWriteCompletionHandler);
  }
  else
  {
    v10 = 0;
    if (self->_dataPath == 1)
      -[VCMockIDSDatagramChannel processDirectIDSPathWithDatagram:datagramSize:datagramOptions:error:](self, "processDirectIDSPathWithDatagram:datagramSize:datagramOptions:error:", a3, *(_QWORD *)&a4, 0, &v10);
    else
      -[VCMockIDSDatagramChannel enqueueDatagramPacket:datagramSize:options:error:](self, "enqueueDatagramPacket:datagramSize:options:error:", a3, *(_QWORD *)&a4, 0, &v10);
    -[VCMockIDSDatagramChannel processWriteCompletionCallback:forDatagramWithSize:error:](self, "processWriteCompletionCallback:forDatagramWithSize:error:", a6, a4, v10, v10, v11);
  }
}

- (void)readDatagramsWithCompletionHandler:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCMockIDSDatagramChannel readDatagramsWithCompletionHandler:]";
      v9 = 1024;
      v10 = 621;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: call to readDatagramsWithCompletionHandler NOT SUPPORTED", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7
{
  id writeDatagramBlock;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_isValid)
  {
    writeDatagramBlock = self->_writeDatagramBlock;
    if (writeDatagramBlock)
    {
      (*((void (**)(id, const void *, _QWORD, _QWORD, _QWORD, $064201D6FEA54BB76D3D1A900A0960B3 *, id, id))writeDatagramBlock
       + 2))(writeDatagramBlock, a3, *(_QWORD *)&a4, *(_QWORD *)&a5.var0, *(unsigned __int16 *)&a5.var4, a6, a7, self->_sharedWriteCompletionHandler);
    }
    else
    {
      v11 = 0;
      if (self->_dataPath == 1)
        -[VCMockRouter routeDatagram:datagramSize:datagramOptions:fromDatagramChannel:error:](+[VCMockRouter sharedInstance](VCMockRouter, "sharedInstance", a3, *(_QWORD *)&a4, *(_QWORD *)&a5.var0, *(_QWORD *)&a5.var4), "routeDatagram:datagramSize:datagramOptions:fromDatagramChannel:error:", a3, *(_QWORD *)&a4, a6, self, &v11);
      else
        -[VCMockIDSDatagramChannel enqueueDatagramPacket:datagramSize:options:error:](self, "enqueueDatagramPacket:datagramSize:options:error:", a3, *(_QWORD *)&a4, a6, &v11);
      -[VCMockIDSDatagramChannel processWriteCompletionCallback:forDatagramWithSize:error:](self, "processWriteCompletionCallback:forDatagramWithSize:error:", a7, a4, v11, v11, v12);
    }
  }
}

- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8
{
  void (**writeDatagramsBlock)(id, const void **, unsigned int *, $C835DF2C905B2D2BE81B7C33CDF61FEE *, _QWORD, $8EF4127CF77ECA3DDB612FCF233DC3A8 **, id, id);
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const void *v17;
  uint64_t v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  _BOOL4 v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_isValid)
  {
    writeDatagramsBlock = (void (**)(id, const void **, unsigned int *, $C835DF2C905B2D2BE81B7C33CDF61FEE *, _QWORD, $8EF4127CF77ECA3DDB612FCF233DC3A8 **, id, id))self->_writeDatagramsBlock;
    if (writeDatagramsBlock)
    {
      writeDatagramsBlock[2](writeDatagramsBlock, a3, a4, a5, *(_QWORD *)&a6, a7, a8, self->_sharedWriteCompletionHandler);
    }
    else
    {
      v23 = 0;
      if (a6 < 1)
      {
        v22 = 0;
        v15 = 0;
      }
      else
      {
        v14 = 0;
        v15 = 0;
        v16 = a6;
        do
        {
          v17 = a3[v14];
          v18 = a4[v14];
          v19 = a7[v14];
          if (self->_dataPath == 1)
            v20 = -[VCMockIDSDatagramChannel processDirectIDSPathWithDatagram:datagramSize:datagramOptions:error:](self, "processDirectIDSPathWithDatagram:datagramSize:datagramOptions:error:", v17, v18, v19, &v23);
          else
            v20 = -[VCMockIDSDatagramChannel enqueueDatagramPacket:datagramSize:options:error:](self, "enqueueDatagramPacket:datagramSize:options:error:", v17, v18, v19, &v23);
          v15 += a4[v14++];
        }
        while (v20 && v14 < v16);
        v22 = v23;
      }
      -[VCMockIDSDatagramChannel processWriteCompletionCallback:forDatagramWithSize:error:](self, "processWriteCompletionCallback:forDatagramWithSize:error:", a8, v15, v22, v23, v24);
    }
  }
}

- (BOOL)processDirectIDSPathWithDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramOptions:(id *)a5 error:(id *)a6
{
  uint64_t v8;
  void *v11;
  void *v13;
  const __CFString *v14;

  v8 = *(_QWORD *)&a4;
  -[NSLock lock](self->_writeDirectPathIDSLock, "lock");
  if (self->_isValid)
  {
    v11 = CFAllocatorAllocate(self->_datagramPacketAllocator, 1656, 0);
    if (v11)
    {
      -[VCMockIDSDatagramChannel constructPacket:datagram:datagramSize:datagramOptions:](self, "constructPacket:datagram:datagramSize:datagramOptions:", v11, a3, v8, a5);
LABEL_4:
      -[VCMockIDSDatagramChannel processPacket:packetHandler:](self, "processPacket:packetHandler:");
      -[NSLock unlock](self->_writeDirectPathIDSLock, "unlock");
      return 1;
    }
    if (!a6)
      goto LABEL_4;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = CFSTR("Failed to allocate packet");
    goto LABEL_9;
  }
  if (a6)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = CFSTR("Trying to process datagrams using invalidated VCMockIDSDatagramChannel");
LABEL_9:
    *a6 = (id)objc_msgSend(v13, "AVConferenceServiceError:detailCode:description:", 32000, 0, v14);
  }
  -[NSLock unlock](self->_writeDirectPathIDSLock, "unlock");
  return 0;
}

void __96__VCMockIDSDatagramChannel_processDirectIDSPathWithDatagram_datagramSize_datagramOptions_error___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __int128 v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2 && a3 && a4)
  {
    v4 = *(_OWORD *)(a1 + 32);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 3322304);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __96__VCMockIDSDatagramChannel_processDirectIDSPathWithDatagram_datagramSize_datagramOptions_error___block_invoke_2;
    v7[3] = &unk_1E9E57590;
    v8 = v4;
    v11 = a3;
    v9 = a2;
    v10 = a4;
    dispatch_async(v5, v7);
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    if (v6)
      CFAllocatorDeallocate(*(CFAllocatorRef *)(*(_QWORD *)(a1 + 32) + 192), v6);
  }
}

void __96__VCMockIDSDatagramChannel_processDirectIDSPathWithDatagram_datagramSize_datagramOptions_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 36))
  {
    objc_msgSend((id)v2, "readDatagram:datagramSize:datagramOptions:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v3 + 184) >= 0x5DDuLL)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315650;
          v8 = v4;
          v9 = 2080;
          v10 = "-[VCMockIDSDatagramChannel processDirectIDSPathWithDatagram:datagramSize:datagramOptions:error:]_block_invoke_2";
          v11 = 1024;
          v12 = 717;
          _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Empyting _datagramPacketsDirectIDSPath for next set of packets", (uint8_t *)&v7, 0x1Cu);
        }
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "lock");
      objc_msgSend(*(id *)(a1 + 32), "flushDatagramPacketsListDIrectIDSPath");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "unlock");
      v3 = *(_QWORD *)(a1 + 32);
    }
    if ((VCSingleLinkedListPush(v3 + 160, *(_QWORD **)(a1 + 40)) & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __96__VCMockIDSDatagramChannel_processDirectIDSPathWithDatagram_datagramSize_datagramOptions_error___block_invoke_2_cold_1(v6);
      }
      CFAllocatorDeallocate(*(CFAllocatorRef *)(*(_QWORD *)(a1 + 32) + 192), *(void **)(a1 + 40));
    }
  }
  else
  {
    CFAllocatorDeallocate(*(CFAllocatorRef *)(v2 + 192), *(void **)(a1 + 40));
  }
}

- (void)invalidate
{
  BOOL *p_isReceiveThreadTerminating;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  VCMockIDSDataChannelLinkContext *linkContext;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  VCMockIDSDataChannelLinkContext *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  VCMockIDSDatagramChannel *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_packetReceiveThread)
  {
    p_isReceiveThreadTerminating = &self->_isReceiveThreadTerminating;
    while (!__ldaxr((unsigned __int8 *)p_isReceiveThreadTerminating))
    {
      if (!__stlxr(1u, (unsigned __int8 *)p_isReceiveThreadTerminating))
      {
        VCRealTimeThread_Stop((uint64_t)self->_packetReceiveThread);
        VCRealTimeThread_Finalize((uint64_t)self->_packetReceiveThread);
        goto LABEL_7;
      }
    }
    __clrex();
  }
LABEL_7:
  -[NSLock lock](self->_blockSettingLock, "lock");
  -[NSLock lock](self->_writeDirectPathIDSLock, "lock");
  if (!self->_isValid)
  {
    -[NSLock unlock](self->_writeDirectPathIDSLock, "unlock");
    -[NSLock unlock](self->_blockSettingLock, "unlock");
    return;
  }
  if ((VCMockIDSDatagramChannel *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_20;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 136315650;
    v22 = v6;
    v23 = 2080;
    v24 = "-[VCMockIDSDatagramChannel invalidate]";
    v25 = 1024;
    v26 = 748;
    v8 = " [%s] %s:%d Unit Test: Invalidating VCMockIDSDatagramChannel";
    v9 = v7;
    v10 = 28;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCMockIDSDatagramChannel performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_20;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 136316162;
    v22 = v11;
    v23 = 2080;
    v24 = "-[VCMockIDSDatagramChannel invalidate]";
    v25 = 1024;
    v26 = 748;
    v27 = 2112;
    v28 = v5;
    v29 = 2048;
    v30 = self;
    v8 = " [%s] %s:%d %@(%p) Unit Test: Invalidating VCMockIDSDatagramChannel";
    v9 = v12;
    v10 = 48;
  }
  _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_20:
  self->_isValid = 0;
  if (self->_eventHandler)
  {
    linkContext = self->_linkContext;
    if (linkContext)
    {
      v14 = *MEMORY[0x1E0D33EB8];
      v20[0] = &unk_1E9EF6518;
      v15 = *MEMORY[0x1E0D33E70];
      v19[0] = v14;
      v19[1] = v15;
      v18 = linkContext;
      v20[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      (*((void (**)(void))self->_eventHandler + 2))();
    }
  }
  -[VCMockIDSDatagramChannel cleanup](self, "cleanup");
  self->_isValid = 0;
  -[NSLock unlock](self->_writeDirectPathIDSLock, "unlock");
  -[NSLock unlock](self->_blockSettingLock, "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v22 = v16;
      v23 = 2080;
      v24 = "-[VCMockIDSDatagramChannel invalidate]";
      v25 = 1024;
      v26 = 762;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: Invalidated VCMockIDSDatagramChannel", buf, 0x1Cu);
    }
  }
}

- (void)start
{
  if (self->_packetReceiveThread)
  {
    self->_isReceiveThreadTerminating = 0;
    VCRealTimeThread_Start((uint64_t)self->_packetReceiveThread);
  }
}

- (id)encryptionInfoEventWithIsLocalKey:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v3 = a3;
  v14[6] = *MEMORY[0x1E0C80C00];
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("mockDatagramChannelRemoteParticipantID"), CFSTR("com.apple.VideoConference"));
  if (v3)
    v6 = 1;
  else
    v6 = 2;
  v7 = +[NetworkUtils encryptionInfoForKey:](NetworkUtils, "encryptionInfoForKey:", v6);
  v8 = *MEMORY[0x1E0D33EB8];
  v14[0] = &unk_1E9EF6530;
  v9 = *MEMORY[0x1E0D340C8];
  v13[0] = v8;
  v13[1] = v9;
  v14[1] = objc_msgSend(v7, "objectForKeyedSubscript:");
  v13[2] = *MEMORY[0x1E0D340D0];
  v14[2] = objc_msgSend(v7, "objectForKeyedSubscript:");
  v13[3] = *MEMORY[0x1E0D340C0];
  v14[3] = objc_msgSend(v7, "objectForKeyedSubscript:");
  v13[4] = *MEMORY[0x1E0D340B8];
  v14[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v13[5] = *MEMORY[0x1E0D340E0];
  v14[5] = -[VCMockIDSDatagramChannel shortMKIPrefixLength](self, "shortMKIPrefixLength");
  v10 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6), "mutableCopy");
  v11 = v10;
  if (v5)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D340D8]);

  }
  return v11;
}

- (void)setEventHandler:(id)a3
{
  id v5;
  id v6;
  VCMockIDSDataChannelLinkContext *linkContext;
  uint64_t v8;
  uint64_t v9;
  id eventHandler;
  VCMockIDSDataChannelLinkContext *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = -[VCMockIDSDatagramChannel encryptionInfoEventWithIsLocalKey:](self, "encryptionInfoEventWithIsLocalKey:", 1);
  v6 = -[VCMockIDSDatagramChannel encryptionInfoEventWithIsLocalKey:](self, "encryptionInfoEventWithIsLocalKey:", 0);
  (*((void (**)(id, id))a3 + 2))(a3, v5);
  (*((void (**)(id, id))a3 + 2))(a3, v6);
  linkContext = self->_linkContext;
  if (linkContext)
  {
    v8 = *MEMORY[0x1E0D33EB8];
    v13[0] = &unk_1E9EF6548;
    v9 = *MEMORY[0x1E0D33E60];
    v12[0] = v8;
    v12[1] = v9;
    v11 = linkContext;
    v13[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    (*((void (**)(id, uint64_t))a3 + 2))(a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  }
  eventHandler = self->_eventHandler;
  if (eventHandler)
  {
    CFRelease(eventHandler);
    self->_eventHandler = 0;
  }
  self->_eventHandler = (id)objc_msgSend(a3, "copy");
}

- (void)setWriteCompletionHandler:(id)a3
{
  id sharedWriteCompletionHandler;

  sharedWriteCompletionHandler = self->_sharedWriteCompletionHandler;
  if (sharedWriteCompletionHandler)
  {
    CFRelease(sharedWriteCompletionHandler);
    self->_sharedWriteCompletionHandler = 0;
  }
  self->_sharedWriteCompletionHandler = (id)objc_msgSend(a3, "copy");
}

- (void)setReadHandler:(id)a3
{
  id readHandler;

  readHandler = self->_readHandler;
  if (readHandler)
  {
    CFRelease(readHandler);
    self->_readHandler = 0;
  }
  self->_readHandler = (id)objc_msgSend(a3, "copy");
}

- (void)setReadHandlerWithOptions:(id)a3
{
  id readHandlerWithOptions;

  readHandlerWithOptions = self->_readHandlerWithOptions;
  if (readHandlerWithOptions)
  {
    CFRelease(readHandlerWithOptions);
    self->_readHandlerWithOptions = 0;
  }
  self->_readHandlerWithOptions = (id)objc_msgSend(a3, "copy");
}

- (id)shortMKIPrefixLength
{
  if (self->_isShortMKIEnabled)
    return &unk_1E9EF6560;
  else
    return &unk_1E9EF6578;
}

- (void)setChannelPreferences:(id)a3
{
  id v4;
  void (**eventHandler)(id, id);
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33F48]))
  {
    v4 = -[VCMockIDSDatagramChannel encryptionInfoEventWithIsLocalKey:](self, "encryptionInfoEventWithIsLocalKey:", 1);
    -[VCMockIDSDatagramChannel encryptionInfoEventWithIsLocalKey:](self, "encryptionInfoEventWithIsLocalKey:", 0);
    eventHandler = (void (**)(id, id))self->_eventHandler;
    if (eventHandler)
    {
      eventHandler[2](eventHandler, v4);
      (*((void (**)(void))self->_eventHandler + 2))();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCMockIDSDatagramChannel setChannelPreferences:]";
      v12 = 1024;
      v13 = 839;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: call to setChannelPreferences", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)requestSessionInfoWithOptions:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSDictionary *v11;
  id v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  int v20;
  NSUInteger v21;
  NSUInteger v22;
  void (**eventHandler)(id, uint64_t);
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v6 = *MEMORY[0x1E0D33E78];
  v49 = *MEMORY[0x1E0CB2D68];
  v50[0] = CFSTR("Could not serialize provided metadata.");
  v7 = 0x1E0C99000uLL;
  v8 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 8, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1));
  pthread_mutex_lock(&self->_streamSubscriptionLock);

  v9 = *MEMORY[0x1E0D33FE8];
  if (objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33FE8])
    && (v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v9),
        objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D33E38])))
  {
    v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
  }
  else
  {
    v11 = (NSDictionary *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", v9);
  }
  self->_subscribedStreamsByParticipantID = v11;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v13 = -[NSDictionary allValues](self->_subscribedStreamsByParticipantID, "allValues");
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
  if (v14)
  {
    v15 = v14;
    v31 = v8;
    v16 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v12, "addObjectsFromArray:", v18);
        v19 = objc_msgSend(v18, "containsObject:", &unk_1E9EF6578);
      }
      v20 = v19;
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
    }
    while (v15);
    v7 = 0x1E0C99000;
    v8 = v31;
  }
  else
  {
    v20 = 0;
  }
  v21 = -[NSDictionary count](self->_subscribedStreamsByParticipantID, "count");
  v22 = -[NSDictionary count](self->_subscribedStreamsByParticipantID, "count");
  pthread_mutex_unlock(&self->_streamSubscriptionLock);
  eventHandler = (void (**)(id, uint64_t))self->_eventHandler;
  if (eventHandler)
  {
    if (v22 == 1)
      v24 = v20;
    else
      v24 = 0;
    v25 = *MEMORY[0x1E0D33EB8];
    if (!v21 || v24)
    {
      v28 = *MEMORY[0x1E0D33E80];
      v42[0] = *MEMORY[0x1E0D33EB8];
      v42[1] = v28;
      v43[0] = &unk_1E9EF6590;
      v43[1] = v8;
      eventHandler[2](eventHandler, objc_msgSend(*(id *)(v7 + 3456), "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v37 = v29;
          v38 = 2080;
          v39 = "-[VCMockIDSDatagramChannel requestSessionInfoWithOptions:]";
          v40 = 1024;
          v41 = 872;
          _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: call to requestSessionInfoWithOptions only supported for stream subscription updates", buf, 0x1Cu);
        }
      }
    }
    else
    {
      v35[0] = &unk_1E9EF6590;
      v26 = *MEMORY[0x1E0D33EA8];
      v34[0] = v25;
      v34[1] = v26;
      v32[0] = *MEMORY[0x1E0D33F00];
      v27 = (void *)MEMORY[0x1E0CB37E8];
      ++self->_participantGenerationCounter;
      v33[0] = objc_msgSend(v27, "numberWithInteger:");
      v32[1] = *MEMORY[0x1E0D33F10];
      v33[1] = objc_msgSend(v12, "allObjects");
      v35[1] = objc_msgSend(*(id *)(v7 + 3456), "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      eventHandler[2](eventHandler, objc_msgSend(*(id *)(v7 + 3456), "dictionaryWithObjects:forKeys:count:", v35, v34, 2));
    }
  }

}

- (void)reportFirstPacketTimeForMKI:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCMockIDSDatagramChannel reportFirstPacketTimeForMKI:]";
      v9 = 1024;
      v10 = 884;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: call to reportFirstPacketTimeForMKI NOT SUPPORTED", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (BOOL)createSocketWithSourcePort:(signed __int16)a3
{
  int v4;

  v4 = +[NetworkUtils socketWithIPAddress:srcPort:shouldConnect:error:](NetworkUtils, "socketWithIPAddress:srcPort:shouldConnect:error:", CFSTR("127.0.0.1"), a3, 1, 0);
  self->_socket = v4;
  if (v4 == -1 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMockIDSDatagramChannel createSocketWithSourcePort:].cold.1();
  }
  return v4 != -1;
}

- (int)underlyingFileDescriptor
{
  uint64_t v3;
  NSObject *v4;
  int socket;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      socket = self->_socket;
      v7 = 136315906;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCMockIDSDatagramChannel underlyingFileDescriptor]";
      v11 = 1024;
      v12 = 898;
      v13 = 1024;
      v14 = socket;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Returning underlyingFD %d", (uint8_t *)&v7, 0x22u);
    }
  }
  return self->_socket;
}

- (int)drainUnderlyingFileDescriptor
{
  int v2;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = -1431655766;
  v2 = recv(self->_socket, &v4, 4uLL, 0);
  if (v2 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMockIDSDatagramChannel drainUnderlyingFileDescriptor].cold.1();
  }
  return v2;
}

- (int)readyToRead
{
  void (**readyToReadBlock)(id, id);
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  readyToReadBlock = (void (**)(id, id))self->_readyToReadBlock;
  if (readyToReadBlock)
  {
    readyToReadBlock[2](readyToReadBlock, self->_readHandlerWithOptions);
  }
  else if ((-[VCMockIDSDatagramChannel drainUnderlyingFileDescriptor](self, "drainUnderlyingFileDescriptor") & 0x80000000) == 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__VCMockIDSDatagramChannel_readyToRead__block_invoke;
    v5[3] = &unk_1E9E575E0;
    v5[4] = self;
    -[VCMockIDSDatagramChannel dequeueDatagramPacket:](self, "dequeueDatagramPacket:", v5);
  }
  return 0;
}

uint64_t __39__VCMockIDSDatagramChannel_readyToRead__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "readDatagram:datagramSize:datagramOptions:", a2, a3, a4);
}

- (_VCMockIDSDatagramChannelPacket)constructPacket:(_VCMockIDSDatagramChannelPacket *)a3 datagram:(const void *)a4 datagramSize:(unsigned int)a5 datagramOptions:(id *)a6
{
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unint64_t datagramPacketNextSequenceNumber;

  v9 = a5;
  memcpy(a3->var1, a4, a5);
  a3->var2 = v9;
  if (a6 && !self->_usingOptions)
  {
    a3->var3 = 1;
    v10 = *(_OWORD *)&a6->var0;
    v11 = *(_OWORD *)&a6->var2;
    v12 = *(_OWORD *)&a6->var8.var0;
    *(_OWORD *)&a3->var4.var5[6] = *(_OWORD *)&a6->var5[6];
    *(_OWORD *)&a3->var4.var8.var0 = v12;
    *(_OWORD *)&a3->var4.var0 = v10;
    *(_OWORD *)&a3->var4.var2 = v11;
    v13 = *(_OWORD *)&a6->var9;
    v14 = *(_OWORD *)&a6->var11;
    v15 = *(_OWORD *)a6->var13;
    *(_QWORD *)&a3->var4.var14 = *(_QWORD *)&a6->var14;
    *(_OWORD *)&a3->var4.var11 = v14;
    *(_OWORD *)a3->var4.var13 = v15;
    *(_OWORD *)&a3->var4.var9 = v13;
  }
  else
  {
    a3->var3 = 0;
  }
  datagramPacketNextSequenceNumber = self->_datagramPacketNextSequenceNumber;
  self->_datagramPacketNextSequenceNumber = datagramPacketNextSequenceNumber + 1;
  a3->var5 = datagramPacketNextSequenceNumber;
  return a3;
}

- (void)printDroppedPacketInfo:(_VCMockIDSDatagramChannelPacket *)a3
{
  unsigned __int8 *var1;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t var2;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  NSObject *v22;
  float emulatedRxPLR;
  _BOOL4 var14;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  unsigned __int16 v29;
  _BYTE buf[64];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  var1 = a3->var1;
  if (-[VCMockIDSDatagramChannel isNACKPacket:length:](self, "isNACKPacket:length:", a3->var1, a3->var2))
  {
    v6 = *(unsigned __int16 *)&a3->var1[2];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = bswap32(*(_DWORD *)&a3->var1[4]);
        v10 = bswap32(*(_DWORD *)&a3->var1[8]);
        v11 = bswap32(*(unsigned __int16 *)&a3->var1[12]);
        v12 = bswap32(*(unsigned __int16 *)&a3->var1[14]);
        var2 = a3->var2;
        *(_DWORD *)buf = 136317954;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCMockIDSDatagramChannel printDroppedPacketInfo:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 943;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v9;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = v9;
        *(_WORD *)&buf[40] = 1024;
        *(_DWORD *)&buf[42] = v10;
        *(_WORD *)&buf[46] = 1024;
        *(_DWORD *)&buf[48] = v10;
        *(_WORD *)&buf[52] = 1024;
        *(_DWORD *)&buf[54] = HIWORD(v11);
        *(_WORD *)&buf[58] = 1024;
        *(_DWORD *)&buf[60] = HIWORD(v11);
        LOWORD(v31) = 1024;
        *(_DWORD *)((char *)&v31 + 2) = HIWORD(v12);
        WORD3(v31) = 2048;
        *((_QWORD *)&v31 + 1) = var2;
        LOWORD(v32) = 2048;
        *(_QWORD *)((char *)&v32 + 2) = bswap32(v6) >> 16;
        v14 = " [%s] %s:%d Unit Test: emulating loss by dropping packet GGeneric NACK packet received, ssrc=%u ssrc_hex=%"
              "x source_ssrc=%u source_ssrc_hex=%x highestSeqNum=%d highestSeqNum_hex=%x bitMask=%x length passed=%zu length in pkt=%zu";
        v15 = v8;
        v16 = 90;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else if (-[VCMockIDSDatagramChannel isMediaPacket:length:](self, "isMediaPacket:length:", var1, a3->var2))
  {
    v17 = a3->var2;
    v18 = *(_OWORD *)&a3->var4.var11;
    v31 = *(_OWORD *)&a3->var4.var9;
    v32 = v18;
    v33 = *(_OWORD *)a3->var4.var13;
    v34 = *(_QWORD *)&a3->var4.var14;
    v19 = *(_OWORD *)&a3->var4.var2;
    *(_OWORD *)buf = *(_OWORD *)&a3->var4.var0;
    *(_OWORD *)&buf[16] = v19;
    v20 = *(_OWORD *)&a3->var4.var8.var0;
    *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var4.var5[6];
    *(_OWORD *)&buf[48] = v20;
    -[VCMockIDSDatagramChannel addMediaPacketToBuffer:length:datagramOptions:](self, "addMediaPacketToBuffer:length:datagramOptions:", var1, v17, buf);
    if (a3->var2 >= 0xC)
    {
      v29 = 0;
      v28 = 0;
      +[VCMockIDSDatagramChannel extractRTPData:ssrc:sequenceNumber:](VCMockIDSDatagramChannel, "extractRTPData:ssrc:sequenceNumber:", var1, &v28, &v29);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          emulatedRxPLR = self->_emulatedRxPLR;
          var14 = a3->var4.var14;
          v25 = a3->var2;
          *(_DWORD *)buf = 136316930;
          *(_QWORD *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCMockIDSDatagramChannel printDroppedPacketInfo:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 950;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = emulatedRxPLR;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = v28;
          *(_WORD *)&buf[44] = 1024;
          *(_DWORD *)&buf[46] = v29;
          *(_WORD *)&buf[50] = 1024;
          *(_DWORD *)&buf[52] = var14;
          *(_WORD *)&buf[56] = 1024;
          *(_DWORD *)&buf[58] = v25;
          v14 = " [%s] %s:%d Unit Test: emulating loss by dropping packet _emulatedRxPLR=%f ssrc=%u seqNum=%hu retransmit"
                "tedPacket=%d dataLength=%d";
          v15 = v22;
          v16 = 62;
          goto LABEL_13;
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCMockIDSDatagramChannel printDroppedPacketInfo:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 953;
      v14 = " [%s] %s:%d Unit Test: emulating loss by dropping packet";
      v15 = v27;
      v16 = 28;
      goto LABEL_13;
    }
  }
}

- (void)processPacket:(_VCMockIDSDatagramChannelPacket *)a3 packetHandler:(id)a4
{
  double v7;
  int v8;
  _BOOL4 v9;
  BOOL v10;
  double emulatedRxPLR;
  BOOL v12;
  uint64_t v13;
  unint64_t var2;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[7];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (0xAF8AF8AF8AF8AF8BLL * a3->var5 <= 0x750750750750750)
  {
    objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "emulatedRxPLR");
    self->_emulatedRxPLR = v7;
  }
  if (a3->var3)
    v8 = (LOWORD(a3->var4.var0) >> 2) & 1;
  else
    LOWORD(v8) = 0;
  self->numPacketSent += v8;
  v9 = -[VCMockIDSDatagramChannel isNACKPacket:length:](self, "isNACKPacket:length:", a3->var1, a3->var2);
  v10 = !v9 && !a3->var4.var14 || !self->_doNotDropNackOrRetransmitted;
  emulatedRxPLR = self->_emulatedRxPLR;
  if (emulatedRxPLR > *(double *)""
    && ((double)(unsigned __int16)arc4random_uniform(0xFFFFu) / 65535.0 <= emulatedRxPLR ? (v12 = v10) : (v12 = 0), v12))
  {
    v13 = 1;
  }
  else
  {
    self->numPacketReceived += v8;
    if (v9 && self->_isNackEnabled)
    {
      -[VCMockIDSDatagramChannel retrieveAndProcessMediaPacketsFromBuffer:packetHandler:](self, "retrieveAndProcessMediaPacketsFromBuffer:packetHandler:", a3->var1, a4);
    }
    else if (-[VCMockIDSDatagramChannel isMediaPacket:length:](self, "isMediaPacket:length:", a3->var1, a3->var2))
    {
      var2 = a3->var2;
      v15 = *(_OWORD *)&a3->var4.var11;
      v18[4] = *(_OWORD *)&a3->var4.var9;
      v18[5] = v15;
      v18[6] = *(_OWORD *)a3->var4.var13;
      v19 = *(_QWORD *)&a3->var4.var14;
      v16 = *(_OWORD *)&a3->var4.var2;
      v18[0] = *(_OWORD *)&a3->var4.var0;
      v18[1] = v16;
      v17 = *(_OWORD *)&a3->var4.var8.var0;
      v18[2] = *(_OWORD *)&a3->var4.var5[6];
      v18[3] = v17;
      -[VCMockIDSDatagramChannel addMediaPacketToBuffer:length:datagramOptions:](self, "addMediaPacketToBuffer:length:datagramOptions:", a3->var1, var2, v18);
    }
    if (self->_isSourceParticipantIDOnFanOutPacketsEnabled && a3->var3 && a3->var4.var4 >= 1)
      -[VCMockIDSDatagramChannel setParticipantIDOnOptions:](self, "setParticipantIDOnOptions:", &a3->var4);
    v13 = 0;
  }
  -[VCMockIDSDatagramChannel handlePacket:packetHandler:shouldDropThisPacket:](self, "handlePacket:packetHandler:shouldDropThisPacket:", a3, a4, v13);
}

- (void)addMediaPacketToBuffer:(char *)a3 length:(unint64_t)a4 datagramOptions:(id *)a5
{
  uint64_t v9;
  $0E151F6AB193623D62D94789525DAA8A *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  NSObject *v18;
  unsigned __int16 v19;
  int v20;
  unsigned __int16 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (self->_isNackEnabled)
  {
    v21 = 0;
    v20 = 0;
    +[VCMockIDSDatagramChannel extractRTPData:ssrc:sequenceNumber:](VCMockIDSDatagramChannel, "extractRTPData:ssrc:sequenceNumber:", a3, &v20, &v21);
    v9 = v21 & 0x1FF | ((v20 & 3) << 9);
    if (a4 > 0x5DB)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          v23 = v17;
          v24 = 2080;
          v25 = "-[VCMockIDSDatagramChannel addMediaPacketToBuffer:length:datagramOptions:]";
          v26 = 1024;
          v27 = 1011;
          v28 = 2048;
          v29 = v9;
          v30 = 1024;
          v31 = v20;
          v32 = 1024;
          v33 = v21;
          v34 = 2048;
          v35 = a4;
          _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d IGNORING! Add media packet to the buffer at index=%llu for ssrc=%u and seqNum=%u length=%zu", buf, 0x3Cu);
        }
      }
    }
    else
    {
      v19 = 0;
      *(_DWORD *)buf = 0;
      +[VCMockIDSDatagramChannel extractRTPData:ssrc:sequenceNumber:](VCMockIDSDatagramChannel, "extractRTPData:ssrc:sequenceNumber:", self->_packetBuffer[v9], buf, &v19);
      if (*(_DWORD *)buf != v20 || v21 != v19)
      {
        memcpy(self->_packetBuffer[v9], a3, a4);
        self->_packetBufferDataSize[v9] = a4;
        v10 = &self->_packetDatagramOptions[v9];
        v11 = *(_OWORD *)&a5->var8.var0;
        v13 = *(_OWORD *)&a5->var0;
        v12 = *(_OWORD *)&a5->var2;
        *(_OWORD *)&v10->streamIDs[6] = *(_OWORD *)&a5->var5[6];
        *(_OWORD *)&v10->statsPayload.serverTimestamp = v11;
        *(_OWORD *)&v10->options_flags = v13;
        *(_OWORD *)&v10->probeGroupID = v12;
        v15 = *(_OWORD *)&a5->var11;
        v14 = *(_OWORD *)a5->var13;
        v16 = *(_OWORD *)&a5->var9;
        *(_QWORD *)&v10->retransmittedPacket = *(_QWORD *)&a5->var14;
        *(_OWORD *)&v10->encryptedHBH = v15;
        *(_OWORD *)v10->packetUUID = v14;
        *(_OWORD *)&v10->arrivalTime = v16;
      }
    }
  }
}

- (void)retrieveAndProcesOnePacket:(unsigned int)a3 seq:(unsigned __int16)a4 count:(int)a5 index:(int)a6
{
  unsigned int v7;
  uint64_t v9;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v22;
  int v23;
  int ErrorLogLevelForModule;
  uint64_t v25;
  NSObject *v26;
  $0E151F6AB193623D62D94789525DAA8A *v27;
  NSObject *directPathRTXQueue;
  uint64_t v29;
  NSObject *v30;
  _QWORD block[6];
  unsigned int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  __int16 v38;
  unsigned __int16 v39;
  __int16 v40;
  int v41;
  unsigned __int16 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  unsigned int v52;
  __int16 v53;
  unsigned int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  unsigned int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  unsigned int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  uint64_t v75;

  v7 = a4;
  v75 = *MEMORY[0x1E0C80C00];
  v9 = a4 & 0x1FF | ((a3 & 3) << 9);
  if (!self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 136316674;
    v44 = v17;
    v45 = 2080;
    v46 = "-[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:]";
    v47 = 1024;
    v48 = 1048;
    v49 = 2048;
    v50 = v9;
    v51 = 1024;
    v52 = a3;
    v53 = 1024;
    v54 = v7;
    v55 = 1024;
    v56 = a6;
    v19 = " [%s] %s:%d RTX/NACK Retrieval failed because _packetBuffer[packetBufferIndex=%llu = nil for ssrc=%u and highest=%u index=%d";
    v20 = v18;
    v21 = 56;
LABEL_22:
    _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    return;
  }
  v12 = self->_packetBufferDataSize[v9];
  v42 = 0;
  v41 = 0;
  +[VCMockIDSDatagramChannel extractRTPData:ssrc:sequenceNumber:](VCMockIDSDatagramChannel, "extractRTPData:ssrc:sequenceNumber:", self->_packetBuffer[v9], &v41, &v42);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136318978;
      v44 = v13;
      v45 = 2080;
      v46 = "-[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:]";
      v47 = 1024;
      v48 = 1023;
      v49 = 2048;
      v50 = v9;
      v51 = 1024;
      v52 = a3;
      v53 = 1024;
      v54 = a3;
      v55 = 1024;
      v56 = v7;
      v57 = 1024;
      v58 = v7;
      v59 = 1024;
      v60 = a5;
      v61 = 1024;
      v62 = v41;
      v63 = 1024;
      v64 = v41;
      v65 = 1024;
      v66 = v42;
      v67 = 1024;
      v68 = v42;
      v69 = 1024;
      v70 = v12;
      v71 = 1024;
      v72 = v9;
      v73 = 1024;
      v74 = a6;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RTX/NACK: Retrieve media packet from buffer at index=%llu for ssrc=%u ssrc_hex=%x and seq=%u seq_hex=%x nCount=%u cached_ssrc2=%u cached_ssrc_hex=%x cached_seqNum2=%u cached_seqNum2=%x packetLen=%u packetBufferIndex=%d index=%d", buf, 0x6Eu);
    }
  }
  if (v12 >= 0x5DD)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136318978;
        v44 = v15;
        v45 = 2080;
        v46 = "-[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:]";
        v47 = 1024;
        v48 = 1025;
        v49 = 2048;
        v50 = v9;
        v51 = 1024;
        v52 = a3;
        v53 = 1024;
        v54 = a3;
        v55 = 1024;
        v56 = v7;
        v57 = 1024;
        v58 = v7;
        v59 = 1024;
        v60 = a5;
        v61 = 1024;
        v62 = v41;
        v63 = 1024;
        v64 = v41;
        v65 = 1024;
        v66 = v42;
        v67 = 1024;
        v68 = v42;
        v69 = 1024;
        v70 = v12;
        v71 = 1024;
        v72 = v9;
        v73 = 1024;
        v74 = a6;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RTX/NACK: INVALID PACKET LEN cached packet does not match with NACK ssrc and seq num index=%llu for ssrc=%u ssrc_hex=%x and seq_hex=%u seq_hex=%x nCount=%u ssrc2=%u ssrc2_hex=%x seqNum2=%u seqNum2_hex=%x packetLen=%u packetBufferIndex=%d index=%d", buf, 0x6Eu);
      }
    }
    return;
  }
  v22 = v42;
  v23 = v41;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v22 != v7 || v23 != a3)
  {
    if (ErrorLogLevelForModule < 3)
      return;
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 136318978;
    v44 = v29;
    v45 = 2080;
    v46 = "-[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:]";
    v47 = 1024;
    v48 = 1027;
    v49 = 2048;
    v50 = v9;
    v51 = 1024;
    v52 = a3;
    v53 = 1024;
    v54 = a3;
    v55 = 1024;
    v56 = v7;
    v57 = 1024;
    v58 = v7;
    v59 = 1024;
    v60 = a5;
    v61 = 1024;
    v62 = v41;
    v63 = 1024;
    v64 = v41;
    v65 = 1024;
    v66 = v42;
    v67 = 1024;
    v68 = v42;
    v69 = 1024;
    v70 = v12;
    v71 = 1024;
    v72 = v9;
    v73 = 1024;
    v74 = a6;
    v19 = " [%s] %s:%d RTX/NACK: INVALID PACKET NACK packet does not match with cached ssrc and seqnum index=%llu for ssr"
          "c=%u ssrc_hex=%x and seq=%u seq_hex=%x nCount=%u cached_ssrc2=%u cached_ssrc2_hex=%x cached_seqNum2=%u cached_"
          "seqNum2_hex=%x packetLen=%u packetBufferIndex=%d index=%d";
    v20 = v30;
    v21 = 110;
    goto LABEL_22;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136318978;
      v44 = v25;
      v45 = 2080;
      v46 = "-[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:]";
      v47 = 1024;
      v48 = 1029;
      v49 = 2048;
      v50 = v9;
      v51 = 1024;
      v52 = a3;
      v53 = 1024;
      v54 = a3;
      v55 = 1024;
      v56 = v7;
      v57 = 1024;
      v58 = v7;
      v59 = 1024;
      v60 = a5;
      v61 = 1024;
      v62 = v41;
      v63 = 1024;
      v64 = v41;
      v65 = 1024;
      v66 = v42;
      v67 = 1024;
      v68 = v42;
      v69 = 1024;
      v70 = v12;
      v71 = 1024;
      v72 = v9;
      v73 = 1024;
      v74 = a6;
      _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RTX/NACK: successfully retrieved packet num index=%llu for ssrc=%u ssrc_hex=%x and seq=%u seq_hex=%x nCount=%u cached_ssrc2=%u cached_ssrc2_hex=%x cached_seqNum2=%u cached_seqNum2=%x packetLen=%u packetBufferIndex=%d index=%d", buf, 0x6Eu);
    }
  }
  v27 = &self->_packetDatagramOptions[v9];
  v27->options_flags |= 0x10000u;
  v27->retransmittedPacket = 1;
  v36 = 0;
  directPathRTXQueue = self->_directPathRTXQueue;
  v37 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__VCMockIDSDatagramChannel_retrieveAndProcesOnePacket_seq_count_index___block_invoke;
  block[3] = &unk_1E9E57628;
  block[4] = self;
  block[5] = v9;
  v38 = v7;
  v32 = a3;
  v33 = a5;
  v39 = v42;
  v40 = v12;
  v34 = v41;
  v35 = a6;
  dispatch_async(directPathRTXQueue, block);
}

_BYTE *__71__VCMockIDSDatagramChannel_retrieveAndProcesOnePacket_seq_count_index___block_invoke(uint64_t a1)
{
  _BYTE *result;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  __int128 v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = *(_BYTE **)(a1 + 32);
  if (result[36])
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(unsigned __int16 *)&result[2 * v3 + 3072314];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__VCMockIDSDatagramChannel_retrieveAndProcesOnePacket_seq_count_index___block_invoke_2;
    v5[3] = &__block_descriptor_62_e17_v16__0__NSError_8l;
    v5[4] = v3;
    v7 = *(_WORD *)(a1 + 74);
    v8 = *(_DWORD *)(a1 + 76);
    v6 = *(_OWORD *)(a1 + 48);
    return (_BYTE *)objc_msgSend(result, "writeDatagram:datagramSize:datagramInfo:options:completionHandler:", &result[1500 * v3 + 313], v4, *(_QWORD *)(a1 + 64), *(unsigned __int16 *)(a1 + 72), &result[120 * v3 + 3076416], v5);
  }
  return result;
}

void __71__VCMockIDSDatagramChannel_retrieveAndProcesOnePacket_seq_count_index___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
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
  int v23;
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
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (a2 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(unsigned __int16 *)(a1 + 56);
      v8 = *(_DWORD *)(a1 + 40);
      v9 = *(_DWORD *)(a1 + 44);
      v10 = *(unsigned __int16 *)(a1 + 58);
      v11 = *(unsigned __int16 *)(a1 + 60);
      v12 = *(_DWORD *)(a1 + 48);
      v13 = *(_DWORD *)(a1 + 52);
      v14 = 136319234;
      v15 = v4;
      v16 = 2080;
      v17 = "-[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:]_block_invoke_2";
      v18 = 1024;
      v19 = 1042;
      v20 = 2048;
      v21 = v6;
      v22 = 1024;
      v23 = v8;
      v24 = 1024;
      v25 = v8;
      v26 = 1024;
      v27 = v7;
      v28 = 1024;
      v29 = v7;
      v30 = 1024;
      v31 = v9;
      v32 = 1024;
      v33 = v12;
      v34 = 1024;
      v35 = v12;
      v36 = 1024;
      v37 = v10;
      v38 = 1024;
      v39 = v10;
      v40 = 1024;
      v41 = v11;
      v42 = 1024;
      v43 = v6;
      v44 = 1024;
      v45 = v13;
      v46 = 2112;
      v47 = a2;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RTX/NACK: DATAGRAM WRITE FAILED index=%llu for ssrc=%u ssrc_hex=%x and seq_hex=%u seq_hex=%x nCount=%u ssrc2=%u ssrc2_hex=%x seqNum2=%u seqNum2_hex=%x packetLen=%u packetBufferIndex=%d index=%d error=%@", (uint8_t *)&v14, 0x78u);
    }
  }
}

- (void)retrieveAndProcessMediaPacketsFromBuffer:(tagRTCPPACKET *)a3 packetHandler:(id)a4
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int16 v9;
  uint64_t v10;
  unsigned int v11;

  v5 = *(_WORD *)&a3->var0 & 0x1F;
  v6 = a3->var1.var6.var1[3];
  v7 = bswap32(a3->var1.var0.var1);
  v8 = bswap32(a3->var1.var6.var1[2]) >> 16;
  -[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:](self, "retrieveAndProcesOnePacket:seq:count:index:", v7, v8, v5, 0);
  if (v6)
  {
    v9 = __rev16(v6);
    v10 = 1;
    do
    {
      if ((v9 & 1) != 0)
        -[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:](self, "retrieveAndProcesOnePacket:seq:count:index:", v7, (unsigned __int16)(v8 + v10), v5, v10);
      v11 = v9;
      v9 >>= 1;
      v10 = (v10 + 1);
    }
    while (v11 > 1);
  }
}

- (void)handlePacket:(_VCMockIDSDatagramChannelPacket *)a3 packetHandler:(id)a4 shouldDropThisPacket:(BOOL)a5
{
  void (*v7)(id, unsigned __int8 *, uint64_t, $064201D6FEA54BB76D3D1A900A0960B3 *);
  id v8;
  unsigned __int8 *var1;
  uint64_t var2_low;
  $064201D6FEA54BB76D3D1A900A0960B3 *p_var4;

  if (a5)
  {
    -[VCMockIDSDatagramChannel printDroppedPacketInfo:](self, "printDroppedPacketInfo:", a3);
LABEL_3:
    v7 = (void (*)(id, unsigned __int8 *, uint64_t, $064201D6FEA54BB76D3D1A900A0960B3 *))*((_QWORD *)a4 + 2);
    v8 = a4;
    var1 = 0;
    var2_low = 0;
LABEL_9:
    p_var4 = 0;
    goto LABEL_10;
  }
  if (!a3->var3)
  {
LABEL_8:
    var1 = a3->var1;
    var2_low = LODWORD(a3->var2);
    v7 = (void (*)(id, unsigned __int8 *, uint64_t, $064201D6FEA54BB76D3D1A900A0960B3 *))*((_QWORD *)a4 + 2);
    v8 = a4;
    goto LABEL_9;
  }
  if (!-[VCMockIDSDatagramChannel shouldReadPacket:](self, "shouldReadPacket:", a3))
  {
    if (a3->var3)
      goto LABEL_3;
    goto LABEL_8;
  }
  var1 = a3->var1;
  var2_low = LODWORD(a3->var2);
  p_var4 = &a3->var4;
  v7 = (void (*)(id, unsigned __int8 *, uint64_t, $064201D6FEA54BB76D3D1A900A0960B3 *))*((_QWORD *)a4 + 2);
  v8 = a4;
LABEL_10:
  v7(v8, var1, var2_low, p_var4);
}

- (void)setUPlusOneMode:(BOOL)a3 isInitiator:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v4 = a4;
  v5 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[VCMockIDSDataChannelLinkContext setIdsUPlusOneMode:](self->_linkContext, "setIdsUPlusOneMode:");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCMockIDSDatagramChannel setUPlusOneMode:isInitiator:]";
      v12 = 1024;
      v13 = 1123;
      v14 = 1024;
      v15 = v5;
      v16 = 1024;
      v17 = v4;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setUPlusOneMode: isUPlusOneEnabled=%d isInitiator=%d", (uint8_t *)&v8, 0x28u);
    }
  }
}

- (void)setParticipantIDOnOptions:(id *)a3
{
  uint64_t v5;
  unint64_t v6;

  if (-[NSArray count](-[NSDictionary allKeys](self->_subscribedStreamsByParticipantID, "allKeys"), "count"))
  {
    v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[NSDictionary allKeys](self->_subscribedStreamsByParticipantID, "allKeys"), "objectAtIndexedSubscript:", 0), "unsignedLongLongValue");
    v6 = 3735928559;
    if (!self->_isWrongParticipantIDOnFanOutPacketsEnabled)
      v6 = v5;
    a3->var1 = v6;
    a3->var0 |= 1u;
  }
}

- (void)setupMockIDSDatagramChannelRequiresOptions:sourcePort:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate link context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupMockIDSDatagramChannelRequiresOptions:sourcePort:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate _blockSettingLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupMockIDSDatagramChannelRequiresOptions:sourcePort:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate _writeDirectPathIDSLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupMockIDSDatagramChannelRequiresOptions:sourcePort:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate _flushDatagramPacketsLock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupMockIDSDatagramChannelRequiresOptions:sourcePort:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create packet receive thread", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupMockIDSDatagramChannelRequiresOptions:sourcePort:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create allocator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initRequiresOptions:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v3 = 260;
  v4 = 2048;
  v5 = v0;
  _os_log_debug_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCMockIDSDatagramChannel=%p created", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)initCreateSocketRequiresOptions:dataPath:destination:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create VCMockIDSDatagram Channel read queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initCreateSocketRequiresOptions:dataPath:destination:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create VCMockIDSDatagram Channel write queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initCreateSocketRequiresOptions:(uint64_t)a1 dataPath:destination:.cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;
  int v4;
  int v5;

  LODWORD(v3) = 136315906;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to create underlying file descriptor using sourcePort=%u", (const char *)v3, *((const char **)&v3 + 1), v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)initCreateSocketRequiresOptions:(uint64_t)a1 dataPath:destination:.cold.4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;
  int v4;
  int v5;

  LODWORD(v3) = 136315906;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to setup mock IDS datagram channel using sourcePort=%u", (const char *)v3, *((const char **)&v3 + 1), v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueDatagramPacket:(uint64_t)a1 datagramSize:options:error:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;
  int v4;
  int v5;

  LODWORD(v3) = 136315906;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d failing to enqueue NACK seq=%d", (const char *)v3, *((const char **)&v3 + 1), v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)shouldReadPacket:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v2 = 513;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Trying to filter packet when there is either no stream subscription or packet's streamID isnt set", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

void __96__VCMockIDSDatagramChannel_processDirectIDSPathWithDatagram_datagramSize_datagramOptions_error___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9();
  v5 = 724;
  v6 = 2112;
  v7 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Packet=%@ did not get enqueued in direct IDS Path", (uint8_t *)&v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)createSocketWithSourcePort:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Create socket for srcPort=%d failed with error=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9_5();
}

- (void)drainUnderlyingFileDescriptor
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11_15();
  OUTLINED_FUNCTION_4_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d recv failed %d errno %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9_5();
}

@end
