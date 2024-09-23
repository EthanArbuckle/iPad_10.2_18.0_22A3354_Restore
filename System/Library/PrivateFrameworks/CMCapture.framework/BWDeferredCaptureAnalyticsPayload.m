@implementation BWDeferredCaptureAnalyticsPayload

- (BWDeferredCaptureAnalyticsPayload)init
{
  BWDeferredCaptureAnalyticsPayload *v2;
  BWDeferredCaptureAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWDeferredCaptureAnalyticsPayload;
  v2 = -[BWDeferredCaptureAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWDeferredCaptureAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWDeferredCaptureAnalyticsPayload;
  -[BWDeferredCaptureAnalyticsPayload dealloc](&v2, sel_dealloc);
}

- (void)reset
{
  self->_commitDurationInMilliseconds = 0;
  self->_flushDurationInMilliseconds = 0;
  *(_QWORD *)&self->_error = 0;
  self->_fileBacked = 0;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.DeferredCapture");
}

- (id)eventDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_error), CFSTR("error"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_processingType), CFSTR("processingType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fileBacked), CFSTR("fileBacked"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_commitDurationInMilliseconds), CFSTR("commitDurationInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_flushDurationInMilliseconds), CFSTR("flushDurationInMilliseconds"));
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

- (unsigned)commitDurationInMilliseconds
{
  return self->_commitDurationInMilliseconds;
}

- (void)setCommitDurationInMilliseconds:(unsigned int)a3
{
  self->_commitDurationInMilliseconds = a3;
}

- (unsigned)flushDurationInMilliseconds
{
  return self->_flushDurationInMilliseconds;
}

- (void)setFlushDurationInMilliseconds:(unsigned int)a3
{
  self->_flushDurationInMilliseconds = a3;
}

@end
