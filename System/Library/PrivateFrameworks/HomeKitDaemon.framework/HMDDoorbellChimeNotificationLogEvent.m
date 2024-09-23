@implementation HMDDoorbellChimeNotificationLogEvent

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.DoorbellChimeController.NotificationLogEvent");
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDDoorbellChimeNotificationLogEvent coordinationLatency](self, "coordinationLatency"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("coordinationLatency"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDDoorbellChimeNotificationLogEvent coreUtilsLatency](self, "coreUtilsLatency"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("coreUtilsLatency"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDDoorbellChimeNotificationLogEvent coordinationMode](self, "coordinationMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("coordinationMode"));

  v7 = (void *)MEMORY[0x24BDD16E0];
  -[HMDDoorbellChimeNotificationLogEvent coordinationError](self, "coordinationError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "code"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("coordinationErrorCode"));

  -[HMDDoorbellChimeNotificationLogEvent coordinationError](self, "coordinationError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("coordinationErrorDomain"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDDoorbellChimeNotificationLogEvent coordinationPathTriggered](self, "coordinationPathTriggered"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("coordinationPathTriggered"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDDoorbellChimeNotificationLogEvent coreUtilsDestinationCount](self, "coreUtilsDestinationCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("coreUtilsDestinationCount"));

  v14 = (void *)MEMORY[0x24BDD16E0];
  -[HMMLogEvent error](self, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "code"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("coreUtilErrorCode"));

  -[HMMLogEvent error](self, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("coreUtilErrorDomain"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDDoorbellChimeNotificationLogEvent numHomePodsWithDoorbellChimeEnabled](self, "numHomePodsWithDoorbellChimeEnabled"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("numHomePodsWithDoorbellChimeEnabled"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24E96A6E8, CFSTR("numEventsFromThisDevice"));
  v20 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v20;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (unint64_t)coreUtilsLatency
{
  return self->_coreUtilsLatency;
}

- (void)setCoreUtilsLatency:(unint64_t)a3
{
  self->_coreUtilsLatency = a3;
}

- (unint64_t)coreUtilsDestinationCount
{
  return self->_coreUtilsDestinationCount;
}

- (void)setCoreUtilsDestinationCount:(unint64_t)a3
{
  self->_coreUtilsDestinationCount = a3;
}

- (BOOL)coordinationPathTriggered
{
  return self->_coordinationPathTriggered;
}

- (void)setCoordinationPathTriggered:(BOOL)a3
{
  self->_coordinationPathTriggered = a3;
}

- (int64_t)coordinationLatency
{
  return self->_coordinationLatency;
}

- (void)setCoordinationLatency:(int64_t)a3
{
  self->_coordinationLatency = a3;
}

- (NSError)coordinationError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCoordinationError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (unint64_t)coordinationMode
{
  return self->_coordinationMode;
}

- (void)setCoordinationMode:(unint64_t)a3
{
  self->_coordinationMode = a3;
}

- (unint64_t)numHomePodsWithDoorbellChimeEnabled
{
  return self->_numHomePodsWithDoorbellChimeEnabled;
}

- (void)setNumHomePodsWithDoorbellChimeEnabled:(unint64_t)a3
{
  self->_numHomePodsWithDoorbellChimeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinationError, 0);
}

@end
