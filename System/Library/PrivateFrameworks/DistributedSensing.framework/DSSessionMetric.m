@implementation DSSessionMetric

- (DSSessionMetric)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DSSessionMetric;
  v2 = -[DSSessionMetric init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", CFSTR("com.apple.distributedsensing.sessionMetric"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v3;

    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = 0;

    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 2) = 0;
    *((_QWORD *)v2 + 3) = 0;

    *((_QWORD *)v2 + 4) = 0;
    *((_QWORD *)v2 + 5) = 0;
    *((_DWORD *)v2 + 12) = 0;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *((_QWORD *)v2 + 12) = 0;
    *((_QWORD *)v2 + 13) = 0;
    *((_WORD *)v2 + 56) = 0;
  }
  return (DSSessionMetric *)v2;
}

- (void)dsSessionStartedWithDeviceRole:(int)a3 numPotentialProviders:(unint64_t)a4 unterminatedSession:(BOOL)a5
{
  NSDate *v6;
  NSDate *sessionStartTime;

  self->_deviceRole = a3;
  self->_numPotentialProviders = a4;
  self->_unterminatedSession = a5;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  sessionStartTime = self->_sessionStartTime;
  self->_sessionStartTime = v6;

}

- (void)dsProviderAvailable
{
  void *v2;
  NSObject *v3;
  NSDate *v5;
  NSDate *providerAvailableStartTime;
  uint8_t v7[16];

  if (self->_providerAvailableStartTime)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dsLogger");
    v3 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] start time already initialized\n", v7, 2u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    providerAvailableStartTime = self->_providerAvailableStartTime;
    self->_providerAvailableStartTime = v5;

  }
}

- (void)dsProviderUnavailable
{
  void *v3;
  double v4;
  NSDate *providerAvailableStartTime;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  if (self->_providerAvailableStartTime)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_providerAvailableStartTime);
    self->_totalProviderAvailableDuration = v4 + self->_totalProviderAvailableDuration;

    providerAvailableStartTime = self->_providerAvailableStartTime;
    self->_providerAvailableStartTime = 0;

  }
  else
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dsLogger");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] Invalid provider availability start time\n", v8, 2u);
    }

  }
}

- (void)dsFirstListenerSessionSetUnsuccessful
{
  self->_isSessionStartUnsuccessful = 1;
}

- (void)dsSessionCompletedWithStopReason:(int)a3 numHeartbeats:(unint64_t)a4 numMotionStateMessages:(unint64_t)a5 activeProviderLostCount:(unint64_t)a6 dataLinkType:(int)a7 maxListenerClients:(unint64_t)a8 avgListenerStartInterval:(double)a9
{
  void *v17;
  double v18;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", self->_sessionStartTime);
  self->_sessionDuration = v18;

  self->_sessionStopReason = a3;
  self->_numHeartbeats = a4;
  self->_numMotionStateMessages = a5;
  self->_activeProviderLostCount = a6;
  self->_linkType = a7;
  self->_maxListenerClients = a8;
  self->_avgListenerStartInterval = a9;
}

- (id)sessionMetricFinalize
{
  void *v3;
  uint64_t deviceRole;
  const char *v5;
  void *v6;
  uint64_t linkType;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t sessionStopReason;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  deviceRole = self->_deviceRole;
  if (deviceRole > 2)
    v5 = "?";
  else
    v5 = off_24D910CF0[deviceRole];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceRole"));

  linkType = self->_linkType;
  if (linkType > 0xB)
    v8 = "?";
  else
    v8 = off_24D910D08[linkType];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dataLinkType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_numHeartbeats);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numHeartbeats"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_numMotionStateMessages);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numMotionStateMessages"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_sessionDuration);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("sessionDuration"));

  v13 = self->_deviceRole;
  if (v13 == 1)
  {
    sessionStopReason = self->_sessionStopReason;
    if (sessionStopReason > 4)
      v15 = "?";
    else
      v15 = off_24D910D68[sessionStopReason];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("sessionStopReason"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_unterminatedSession);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("unterminatedSession"));

    v13 = self->_deviceRole;
  }
  if (v13 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_numPotentialProviders);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("numPotentialProviders"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_activeProviderLostCount);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("activeProviderLostCount"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_totalProviderAvailableDuration);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("providerAvailabilityDuration"));

    self->_providerAvailability = (self->_totalProviderAvailableDuration / self->_sessionDuration * 100.0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("providerAvailability"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_maxListenerClients);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("maxListenerClients"));

    if (self->_avgListenerStartInterval != 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("avgListenerStartInterval"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSessionStartUnsuccessful);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("unsuccessfulSessionStart"));

  }
  return v3;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  objc_storeStrong((id *)&self->_eventName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_providerAvailableStartTime, 0);
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
}

@end
