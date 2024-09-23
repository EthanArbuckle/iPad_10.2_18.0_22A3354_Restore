@implementation BWTOFAssistedAutoFocusEstimatorAnalyticsPayload

- (BWTOFAssistedAutoFocusEstimatorAnalyticsPayload)init
{
  BWTOFAssistedAutoFocusEstimatorAnalyticsPayload *v2;
  BWTOFAssistedAutoFocusEstimatorAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWTOFAssistedAutoFocusEstimatorAnalyticsPayload;
  v2 = -[BWTOFAssistedAutoFocusEstimatorAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWTOFAssistedAutoFocusEstimatorAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWTOFAssistedAutoFocusEstimatorAnalyticsPayload;
  -[BWTOFAssistedAutoFocusEstimatorAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{

  self->_portType = 0;
  self->_clientApplicationID = 0;

  self->_estimatorResults = 0;
  self->_streamingTime = 0;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.TOFAssistedAutoFocusEstimator");
}

- (id)eventDictionary
{
  void *v3;
  void *v4;
  NSString *portType;
  NSString *clientApplicationID;
  NSDictionary *estimatorResults;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = v3;
  portType = self->_portType;
  if (portType)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", portType, CFSTR("portType"));
  clientApplicationID = self->_clientApplicationID;
  if (clientApplicationID)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", clientApplicationID, CFSTR("clientApplicationID"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), CFSTR("clientIDType"));
  }
  if (self->_streamingTime)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("streamingTime"));
  estimatorResults = self->_estimatorResults;
  if (estimatorResults)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D98]), CFSTR("testingPFLError"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D78]), CFSTR("testingAvgLuxLevel"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07DA8]), CFSTR("testingRMSMotion"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07DB8]), CFSTR("testingTime"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D80]), CFSTR("testingDeltaTemperature"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D90]), CFSTR("testingMinSubjectDistance"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D88]), CFSTR("testingMaxSubjectDistance"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07DA0]), CFSTR("testingRMSDefocus"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07DB0]), CFSTR("testingStatus"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E10]), CFSTR("trainingStartPFLError"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07DE0]), CFSTR("trainingEndPFLError"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07DC8]), CFSTR("trainingAvgLuxLevel"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E08]), CFSTR("trainingRMSMotion"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E20]), CFSTR("trainingTime"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07DD8]), CFSTR("trainingDeltaTemperature"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07DF8]), CFSTR("trainingOffsetCorrection"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07DF0]), CFSTR("trainingMinSubjectDistance"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07DE8]), CFSTR("trainingMaxSubjectDistance"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E00]), CFSTR("trainingRMSDefocus"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07DC0]), CFSTR("timeSinceLastTraining"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07DD0]), CFSTR("trainingConvergenceStatus"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07E18]), CFSTR("trainingStatus"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_estimatorResults, "objectForKeyedSubscript:", *MEMORY[0x1E0D07D70]), CFSTR("APEStatus"));
  }
  return v4;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)estimatorResults
{
  return self->_estimatorResults;
}

- (void)setEstimatorResults:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)streamingTime
{
  return self->_streamingTime;
}

- (void)setStreamingTime:(unsigned int)a3
{
  self->_streamingTime = a3;
}

@end
