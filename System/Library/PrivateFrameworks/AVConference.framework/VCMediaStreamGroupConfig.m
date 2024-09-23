@implementation VCMediaStreamGroupConfig

- (VCMediaStreamGroupConfig)init
{
  VCMediaStreamGroupConfig *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaStreamGroupConfig;
  v2 = -[VCMediaStreamGroupConfig init](&v4, sel_init);
  if (v2)
  {
    v2->_mediaStreamInfoArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_groupEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pthread_mutex_init(&v2->_mutex, 0);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *delegateQueue;
  tagVCJBTargetEstimatorSynchronizer *jbTargetEstimatorSynchronizer;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];

  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  jbTargetEstimatorSynchronizer = self->_jbTargetEstimatorSynchronizer;
  if (jbTargetEstimatorSynchronizer)
  {
    CFRelease(jbTargetEstimatorSynchronizer);
    self->_jbTargetEstimatorSynchronizer = 0;
  }
  pthread_mutex_destroy(&self->_mutex);
  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamGroupConfig;
  -[VCMediaStreamGroupConfig dealloc](&v5, sel_dealloc);
}

- (void)lock
{
  pthread_mutex_lock(&self->_mutex);
}

- (void)unlock
{
  pthread_mutex_unlock(&self->_mutex);
}

- (void)setDelegateQueue:(id)a3
{
  OS_dispatch_queue *delegateQueue;

  delegateQueue = self->_delegateQueue;
  if (delegateQueue != a3)
  {
    if (delegateQueue)
    {
      CFRelease(delegateQueue);
      self->_delegateQueue = 0;
    }
    if (a3)
    {
      dispatch_retain((dispatch_object_t)a3);
      self->_delegateQueue = (OS_dispatch_queue *)a3;
    }
  }
}

- (BOOL)addMediaStreamInfo:(id)a3
{
  uint64_t v5;
  NSObject *v6;

  if (a3)
  {
    -[VCMediaStreamGroupConfig lock](self, "lock");
    self->_shouldSetupStreams = 1;
    -[NSMutableArray addObject:](self->_mediaStreamInfoArray, "addObject:", a3);
    -[VCMediaStreamGroupConfig unlock](self, "unlock");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaStreamGroupConfig addMediaStreamInfo:].cold.1(v5, v6);
  }
  return a3 != 0;
}

- (NSArray)mediaStreams
{
  NSArray *v3;

  -[VCMediaStreamGroupConfig lock](self, "lock");
  if (self->_shouldSetupStreams)
    -[VCMediaStreamGroupConfig setupStreams](self, "setupStreams");
  v3 = self->_mediaStreams;
  -[VCMediaStreamGroupConfig unlock](self, "unlock");
  return v3;
}

- (NSDictionary)streamIDToMediaStreamMap
{
  NSDictionary *v3;

  -[VCMediaStreamGroupConfig lock](self, "lock");
  if (self->_shouldSetupStreams)
    -[VCMediaStreamGroupConfig setupStreams](self, "setupStreams");
  v3 = self->_streamIDToMediaStreamMap;
  -[VCMediaStreamGroupConfig unlock](self, "unlock");
  return v3;
}

- (NSDictionary)groupEntries
{
  NSMutableDictionary *v3;

  -[VCMediaStreamGroupConfig lock](self, "lock");
  if (self->_shouldSetupStreams)
    -[VCMediaStreamGroupConfig setupStreams](self, "setupStreams");
  v3 = self->_groupEntries;
  -[VCMediaStreamGroupConfig unlock](self, "unlock");
  return &v3->super;
}

- (BOOL)hasRepairedStreams
{
  BOOL hasRepairedStreams;

  -[VCMediaStreamGroupConfig lock](self, "lock");
  if (self->_shouldSetupStreams)
    -[VCMediaStreamGroupConfig setupStreams](self, "setupStreams");
  hasRepairedStreams = self->_hasRepairedStreams;
  -[VCMediaStreamGroupConfig unlock](self, "unlock");
  return hasRepairedStreams;
}

- (unsigned)rtpTimestampRate
{
  unsigned int rtpTimestampRate;

  -[VCMediaStreamGroupConfig lock](self, "lock");
  if (self->_shouldSetupStreams)
    -[VCMediaStreamGroupConfig setupStreams](self, "setupStreams");
  rtpTimestampRate = self->_rtpTimestampRate;
  -[VCMediaStreamGroupConfig unlock](self, "unlock");
  return rtpTimestampRate;
}

- (void)setupStreams
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[VCMediaStreamGroupConfig setupStreams]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the stream map for streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaStreamGroupConfig setupStreams]" >> 16, 199);
  OUTLINED_FUNCTION_3();
}

- (tagVCJBTargetEstimatorSynchronizer)jbTargetEstimatorSynchronizer
{
  return self->_jbTargetEstimatorSynchronizer;
}

- (void)setJbTargetEstimatorSynchronizer:(tagVCJBTargetEstimatorSynchronizer *)a3
{
  tagVCJBTargetEstimatorSynchronizer *jbTargetEstimatorSynchronizer;

  jbTargetEstimatorSynchronizer = self->_jbTargetEstimatorSynchronizer;
  if (jbTargetEstimatorSynchronizer)
    CFRelease(jbTargetEstimatorSynchronizer);
  self->_jbTargetEstimatorSynchronizer = a3;
  if (a3)
    CFRetain(a3);
}

- (unsigned)streamGroupID
{
  return self->_streamGroupID;
}

- (void)setStreamGroupID:(unsigned int)a3
{
  self->_streamGroupID = a3;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unsigned int)a3
{
  self->_mediaType = a3;
}

- (unsigned)mediaSubtype
{
  return self->_mediaSubtype;
}

- (void)setMediaSubtype:(unsigned int)a3
{
  self->_mediaSubtype = a3;
}

- (unsigned)syncGroupID
{
  return self->_syncGroupID;
}

- (void)setSyncGroupID:(unsigned int)a3
{
  self->_syncGroupID = a3;
}

- (VCMediaStreamGroupDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (void)setStreamToken:(int64_t)a3
{
  self->_streamToken = a3;
}

- (VCMediaCaptureController)captureController
{
  return self->_captureController;
}

- (void)setCaptureController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSArray)mediaStreamInfoArray
{
  return &self->_mediaStreamInfoArray->super;
}

- (NSString)participantUUID
{
  return self->_participantUUID;
}

- (void)setParticipantUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (unint64_t)idsParticipantID
{
  return self->_idsParticipantID;
}

- (void)setIdsParticipantID:(unint64_t)a3
{
  self->_idsParticipantID = a3;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (VCNetworkFeedbackController)networkFeedbackController
{
  return self->_networkFeedbackController;
}

- (void)setNetworkFeedbackController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (int)captureSource
{
  return self->_captureSource;
}

- (void)setCaptureSource:(int)a3
{
  self->_captureSource = a3;
}

- (void)addMediaStreamInfo:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCMediaStreamGroupConfig addMediaStreamInfo:]";
  v6 = 1024;
  v7 = 124;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d media stream is nil", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

@end
