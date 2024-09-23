@implementation BWOpportunisticInferenceAnalyticsPayload

- (BWOpportunisticInferenceAnalyticsPayload)init
{
  BWOpportunisticInferenceAnalyticsPayload *v2;
  BWOpportunisticInferenceAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWOpportunisticInferenceAnalyticsPayload;
  v2 = -[BWOpportunisticInferenceAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWOpportunisticInferenceAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)reset
{
  self->_facesProcessedCount = 0;
  self->_totalInferenceExecutionTime = 0;
  self->_inferenceDeadlineOverdue = 0;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.OpportunisticInference");
}

- (id)eventDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_totalInferenceExecutionTime), CFSTR("totalInferenceExecutionTimeMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_inferenceDeadlineOverdue), CFSTR("inferenceDeadlineOverdueMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_facesProcessedCount), CFSTR("facesProcessedCount"));
  return v3;
}

- (int64_t)totalInferenceExecutionTime
{
  return self->_totalInferenceExecutionTime;
}

- (void)setTotalInferenceExecutionTime:(int64_t)a3
{
  self->_totalInferenceExecutionTime = a3;
}

- (int64_t)inferenceDeadlineOverdue
{
  return self->_inferenceDeadlineOverdue;
}

- (void)setInferenceDeadlineOverdue:(int64_t)a3
{
  self->_inferenceDeadlineOverdue = a3;
}

- (unsigned)facesProcessedCount
{
  return self->_facesProcessedCount;
}

- (void)setFacesProcessedCount:(unsigned int)a3
{
  self->_facesProcessedCount = a3;
}

@end
