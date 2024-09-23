@implementation BWDeferredProcessingAnalyticsPayload

- (BWDeferredProcessingAnalyticsPayload)init
{
  BWDeferredProcessingAnalyticsPayload *v2;
  BWDeferredProcessingAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWDeferredProcessingAnalyticsPayload;
  v2 = -[BWDeferredProcessingAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWDeferredProcessingAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredProcessingAnalyticsPayload;
  -[BWDeferredProcessingAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  self->_error = 0;
  -[BWDeferredProcessingAnalyticsPayload setProcessingResult:](self, "setProcessingResult:", CFSTR("Unknown"));
  self->_processingType = 0;
  self->_fileBacked = 0;
  self->_containerAgeInSeconds = 0;
  self->_containerSizeInBytes = 0;
  self->_interactiveQoS = 0;
  *(_QWORD *)&self->_jobDurationInMilliseconds = 0;
  self->_graphPrepareDurationInMilliseconds = 0;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.DeferredProcessing");
}

- (id)eventDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_error), CFSTR("error"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_processingResult, CFSTR("processingResult"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_processingType), CFSTR("processingType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fileBacked), CFSTR("fileBacked"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_containerAgeInSeconds), CFSTR("containerAgeInSeconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_containerSizeInBytes), CFSTR("containerSizeInBytes"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_interactiveQoS), CFSTR("interactiveQoS"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_graphPrepareDurationInMilliseconds), CFSTR("graphPrepareDurationInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_jobDurationInMilliseconds), CFSTR("jobDurationInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_containerProcessingCount), CFSTR("containerProcessingCount"));
  return v3;
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (NSString)processingResult
{
  return self->_processingResult;
}

- (void)setProcessingResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)processingType
{
  return self->_processingType;
}

- (void)setProcessingType:(int)a3
{
  self->_processingType = a3;
}

- (BOOL)fileBacked
{
  return self->_fileBacked;
}

- (void)setFileBacked:(BOOL)a3
{
  self->_fileBacked = a3;
}

- (unsigned)containerAgeInSeconds
{
  return self->_containerAgeInSeconds;
}

- (void)setContainerAgeInSeconds:(unsigned int)a3
{
  self->_containerAgeInSeconds = a3;
}

- (unint64_t)containerSizeInBytes
{
  return self->_containerSizeInBytes;
}

- (void)setContainerSizeInBytes:(unint64_t)a3
{
  self->_containerSizeInBytes = a3;
}

- (BOOL)interactiveQoS
{
  return self->_interactiveQoS;
}

- (void)setInteractiveQoS:(BOOL)a3
{
  self->_interactiveQoS = a3;
}

- (unsigned)graphPrepareDurationInMilliseconds
{
  return self->_graphPrepareDurationInMilliseconds;
}

- (void)setGraphPrepareDurationInMilliseconds:(unsigned int)a3
{
  self->_graphPrepareDurationInMilliseconds = a3;
}

- (unsigned)jobDurationInMilliseconds
{
  return self->_jobDurationInMilliseconds;
}

- (void)setJobDurationInMilliseconds:(unsigned int)a3
{
  self->_jobDurationInMilliseconds = a3;
}

- (int)containerProcessingCount
{
  return self->_containerProcessingCount;
}

- (void)setContainerProcessingCount:(int)a3
{
  self->_containerProcessingCount = a3;
}

@end
