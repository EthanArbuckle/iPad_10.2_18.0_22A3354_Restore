@implementation VCDatagramChannelIDS

- (id)sharedIDSService
{
  if (sharedIDSService_onceToken != -1)
    dispatch_once(&sharedIDSService_onceToken, &__block_literal_global_21);
  return (id)sharedIDSService_service;
}

uint64_t __40__VCDatagramChannelIDS_sharedIDSService__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.avconference.icloud"));
  sharedIDSService_service = result;
  return result;
}

- (VCDatagramChannelIDS)initWithDestination:(id)a3 token:(unsigned int)a4 dataPath:(int)a5 error:(id *)a6
{
  VCDatagramChannelIDS *v10;
  VCDatagramChannelIDS *v11;
  IDSDatagramChannel *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCDatagramChannelIDS;
  v10 = -[VCObject init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_dataPath = a5;
    v12 = (IDSDatagramChannel *)-[VCDatagramChannelIDS datagramChannelWithDestination:error:](v10, "datagramChannelWithDestination:error:", a3, a6);
    v11->_idsChannel = v12;
    if (v12)
    {
      v11->_destination = (NSString *)objc_msgSend(a3, "copy");
      v11->_token = a4;
      v11->_vtpSocket = -1;
    }
    else
    {

      return 0;
    }
  }
  return v11;
}

- (id)VTPConnectionContext
{
  +[VCVTPWrapper targetQueue](VCVTPWrapper, "targetQueue");
  return +[VCVTPWrapper connectionContext](VCVTPWrapper, "connectionContext");
}

- (id)datagramChannelOptions
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = self->_dataPath == 1;
  v4 = (void *)MEMORY[0x1E0C99E08];
  v8[0] = *MEMORY[0x1E0D34000];
  v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v8[1] = *MEMORY[0x1E0D34008];
  v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_msgSend(v4, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  v6 = -[VCDatagramChannelIDS VTPConnectionContext](self, "VTPConnectionContext");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D33FF8]);
  return v5;
}

- (id)datagramChannelWithDestination:(id)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "hasPrefix:", CFSTR("loopback:")))
    return (id)objc_msgSend(-[VCDatagramChannelIDS sharedIDSService](self, "sharedIDSService"), "datagramChannelForSessionDestination:options:error:", a3, -[VCDatagramChannelIDS datagramChannelOptions](self, "datagramChannelOptions"), a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = v7;
      v12 = 2080;
      v13 = "-[VCDatagramChannelIDS datagramChannelWithDestination:error:]";
      v14 = 1024;
      v15 = 89;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: Using VCMockIDSDatagramChannel instead of IDSDatagramChannel", (uint8_t *)&v10, 0x1Cu);
    }
  }
  return -[VCMockIDSDatagramChannelController datagramChannelWithDestination:dataPath:](+[VCMockIDSDatagramChannelController sharedInstance](VCMockIDSDatagramChannelController, "sharedInstance"), "datagramChannelWithDestination:dataPath:", a3, self->_dataPath);
}

- (VCDatagramChannelIDS)initWithSocketDescriptor:(int)a3 token:(unsigned int)a4 error:(id *)a5
{
  uint64_t v7;
  VCDatagramChannelIDS *v8;
  VCDatagramChannelIDS *v9;
  IDSDatagramChannel *v10;
  objc_super v12;
  uint64_t v13;

  v7 = *(_QWORD *)&a3;
  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCDatagramChannelIDS;
  v8 = -[VCObject init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = (IDSDatagramChannel *)(id)objc_msgSend(-[VCDatagramChannelIDS sharedIDSService](v8, "sharedIDSService"), "datagramChannelForSocketDescriptor:error:", v7, a5);
    v9->_idsChannel = v10;
    if (v10)
    {
      v9->_token = a4;
      v9->_vtpSocket = -1;
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  id eventHandler;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  eventHandler = self->_eventHandler;
  if (eventHandler)
    _Block_release(eventHandler);
  -[VCDatagramChannelIDS invalidate](self, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)VCDatagramChannelIDS;
  -[VCObject dealloc](&v4, sel_dealloc);
}

- (void)setReadHandler:(id)a3
{
  -[IDSDatagramChannel setReadHandlerWithOptions:](self->_idsChannel, "setReadHandlerWithOptions:", a3);
}

- (void)setWriteCompletionHandler:(id)a3
{
  -[IDSDatagramChannel setWriteCompletionHandler:](self->_idsChannel, "setWriteCompletionHandler:", a3);
}

- (void)setEventHandler:(id)a3
{
  id eventHandler;
  void *v6;

  eventHandler = self->_eventHandler;
  if (eventHandler)
    _Block_release(eventHandler);
  if (a3)
    v6 = _Block_copy(a3);
  else
    v6 = 0;
  self->_eventHandler = v6;
  -[IDSDatagramChannel setEventHandler:](self->_idsChannel, "setEventHandler:", a3);
}

- (void)readyToRead
{
  -[IDSDatagramChannel readyToRead](self->_idsChannel, "readyToRead");
}

- (void)osChannelInfoLog
{
  -[VCObject lock](self, "lock");
  -[IDSDatagramChannel osChannelInfoLog](self->_idsChannel, "osChannelInfoLog");
  -[VCObject unlock](self, "unlock");
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7
{
  -[IDSDatagramChannel writeDatagram:datagramSize:datagramInfo:options:completionHandler:](self->_idsChannel, "writeDatagram:datagramSize:datagramInfo:options:completionHandler:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5.var0, *(unsigned __int16 *)&a5.var4, a6, a7);
}

- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8
{
  -[IDSDatagramChannel writeDatagrams:datagramsSize:datagramsInfo:datagramsCount:options:completionHandler:](self->_idsChannel, "writeDatagrams:datagramsSize:datagramsInfo:datagramsCount:options:completionHandler:", a3, a4, a5, *(_QWORD *)&a6, a7, a8);
}

- (void)setChannelPreferences:(id)a3
{
  -[IDSDatagramChannel setChannelPreferences:](self->_idsChannel, "setChannelPreferences:", a3);
}

- (void)setWiFiAssist:(BOOL)a3
{
  -[IDSDatagramChannel setWiFiAssist:](self->_idsChannel, "setWiFiAssist:", a3);
}

- (void)startActiveProbingWithOptions:(id)a3
{
  -[IDSDatagramChannel startActiveProbingWithOptions:](self->_idsChannel, "startActiveProbingWithOptions:", a3);
}

- (void)stopActiveProbingWithOptions:(id)a3
{
  -[IDSDatagramChannel stopActiveProbingWithOptions:](self->_idsChannel, "stopActiveProbingWithOptions:", a3);
}

- (void)queryProbingResultsWithOptions:(id)a3
{
  -[IDSDatagramChannel queryStatusWithOptions:](self->_idsChannel, "queryStatusWithOptions:", a3);
}

- (void)flushLinkProbingStatusWithOptions:(id)a3
{
  -[IDSDatagramChannel flushLinkProbingStatusWithOptions:](self->_idsChannel, "flushLinkProbingStatusWithOptions:", a3);
}

- (void)setOneToOneModeEnabled:(BOOL)a3 isInitiator:(BOOL)a4
{
  -[IDSDatagramChannel setUPlusOneMode:isInitiator:](self->_idsChannel, "setUPlusOneMode:isInitiator:", a3, a4);
}

- (void)startMKMRecoveryForParticipantIDs:(id)a3
{
  -[IDSDatagramChannel startMKMRecoveryForParticipantIDs:](self->_idsChannel, "startMKMRecoveryForParticipantIDs:", a3);
}

- (void)requestSessionInfoWithOptions:(id)a3
{
  -[IDSDatagramChannel requestSessionInfoWithOptions:](self->_idsChannel, "requestSessionInfoWithOptions:", a3);
}

- (void)requestStatsWithOptions:(id)a3
{
  -[IDSDatagramChannel requestStatsWithOptions:](self->_idsChannel, "requestStatsWithOptions:", a3);
}

- (int)start
{
  int *p_dataPath;
  int dataPath;
  int v6;
  uint64_t v7;
  NSObject *v8;

  p_dataPath = &self->_dataPath;
  dataPath = self->_dataPath;
  if (dataPath == 1)
  {
    v6 = -[VCDatagramChannelIDS setupVTPSocketWithFileDescriptor:](self, "setupVTPSocketWithFileDescriptor:", 4294967294);
    if (!v6)
      -[IDSDatagramChannel start](self->_idsChannel, "start");
  }
  else
  {
    if (!dataPath)
      return -[VCDatagramChannelIDS setupVTPSocketWithFileDescriptor:](self, "setupVTPSocketWithFileDescriptor:", -[IDSDatagramChannel underlyingFileDescriptor](self->_idsChannel, "underlyingFileDescriptor"));
    v6 = -2144600048;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCDatagramChannelIDS start].cold.1(v7, p_dataPath, v8);
    }
  }
  return v6;
}

- (void)invalidate
{
  int vtpSocket;

  vtpSocket = self->_vtpSocket;
  if (vtpSocket != -1)
  {
    VTP_Close(vtpSocket);
    self->_vtpSocket = -1;
  }
  -[VCObject lock](self, "lock");
  -[IDSDatagramChannel invalidate](self->_idsChannel, "invalidate");

  self->_idsChannel = 0;
  -[VCObject unlock](self, "unlock");
}

- (IDSDataChannelLinkContext)defaultLink
{
  return -[IDSDatagramChannel defaultLink](self->_idsChannel, "defaultLink");
}

- (NSArray)connectedLinks
{
  return -[IDSDatagramChannel connectedLinks](self->_idsChannel, "connectedLinks");
}

- (int)setupVTPSocketWithFileDescriptor:(int)a3
{
  int v4;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (self->_vtpSocket != -1)
    return 0;
  v4 = VTP_SocketForIDSWithFileDescriptor(a3, self->_token);
  self->_vtpSocket = v4;
  if (v4 != -1)
    return 0;
  v6 = __error();
  return VCSignalErrorAt(*v6 | 0xC02E0000, "Signalled error at %s: Failed to create VTP socket", v7, v8, v9, v10, v11, v12, (char)"-[VCDatagramChannelIDS setupVTPSocketWithFileDescriptor:]");
}

- (NSString)destination
{
  return self->_destination;
}

- (int)dataPath
{
  return self->_dataPath;
}

- (id)idsDatagramChannel
{
  return self->_idsChannel;
}

- (void)start
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
  v7 = "-[VCDatagramChannelIDS start]";
  v8 = 1024;
  v9 = 222;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Can not start VCDatagramChannel due to invalid dataPath value=%d", (uint8_t *)&v4, 0x22u);
}

@end
