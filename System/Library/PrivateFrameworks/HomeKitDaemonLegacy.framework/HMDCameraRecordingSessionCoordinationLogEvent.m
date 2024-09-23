@implementation HMDCameraRecordingSessionCoordinationLogEvent

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homekit.daemon.camerarecording.sessioncoordinationevent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDCameraRecordingSessionCoordinationLogEvent isUsingRemoteDeviceAnalysisNode](self, "isUsingRemoteDeviceAnalysisNode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("analysisNodeIsRemoteDevice"));

  -[HMMLogEvent error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errorDomain"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HMMLogEvent error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "code"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("errorCode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDCameraRecordingSessionCoordinationLogEvent retryCount](self, "retryCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("retryCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("durationInMS"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v12;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (BOOL)isUsingRemoteDeviceAnalysisNode
{
  return self->_usingRemoteDeviceAnalysisNode;
}

- (void)setUsingRemoteDeviceAnalysisNode:(BOOL)a3
{
  self->_usingRemoteDeviceAnalysisNode = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

@end
