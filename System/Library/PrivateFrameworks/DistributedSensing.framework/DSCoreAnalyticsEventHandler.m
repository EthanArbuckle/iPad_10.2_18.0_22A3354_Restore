@implementation DSCoreAnalyticsEventHandler

- (DSCoreAnalyticsEventHandler)init
{
  DSCoreAnalyticsEventHandler *v2;
  DSCoreAnalyticsEventHandler *v3;
  DSSessionMetric *sessionMetric;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DSCoreAnalyticsEventHandler;
  v2 = -[DSCoreAnalyticsEventHandler init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    sessionMetric = v2->_sessionMetric;
    v2->_sessionMetric = 0;

  }
  return v3;
}

- (void)dsSessionStartedWithDeviceRole:(int)a3 numPotentialProviders:(unint64_t)a4 unterminatedSession:(BOOL)a5
{
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  _BOOL8 v9;
  uint64_t v11;
  DSSessionMetric *v13;
  DSSessionMetric *sessionMetric;
  void *v15;
  __int16 v16;
  __int16 v17;

  if (self->_sessionMetric)
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance", *(_QWORD *)&a3, a4, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dsLogger");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v7 = "[DSCoreAnalytics] session metric already exists\n";
      v8 = (uint8_t *)&v17;
LABEL_6:
      _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    v9 = a5;
    v11 = *(_QWORD *)&a3;
    v13 = objc_alloc_init(DSSessionMetric);
    sessionMetric = self->_sessionMetric;
    self->_sessionMetric = v13;

    -[DSSessionMetric dsSessionStartedWithDeviceRole:numPotentialProviders:unterminatedSession:](self->_sessionMetric, "dsSessionStartedWithDeviceRole:numPotentialProviders:unterminatedSession:", v11, a4, v9);
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dsLogger");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v7 = "[DSCoreAnalytics] session metric collection started\n";
      v8 = (uint8_t *)&v16;
      goto LABEL_6;
    }
  }

}

- (void)dsProviderAvailable
{
  DSSessionMetric *sessionMetric;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  sessionMetric = self->_sessionMetric;
  if (sessionMetric)
  {
    -[DSSessionMetric dsProviderAvailable](sessionMetric, "dsProviderAvailable");
  }
  else
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dsLogger");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] null metric during provider availability update\n", v5, 2u);
    }

  }
}

- (void)dsProviderUnavailable
{
  DSSessionMetric *sessionMetric;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  sessionMetric = self->_sessionMetric;
  if (sessionMetric)
  {
    -[DSSessionMetric dsProviderUnavailable](sessionMetric, "dsProviderUnavailable");
  }
  else
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dsLogger");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] null metric during provider unavailability update\n", v5, 2u);
    }

  }
}

- (void)dsFirstListenerSessionSetUnsuccessful
{
  DSSessionMetric *sessionMetric;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  sessionMetric = self->_sessionMetric;
  if (sessionMetric)
  {
    -[DSSessionMetric dsFirstListenerSessionSetUnsuccessful](sessionMetric, "dsFirstListenerSessionSetUnsuccessful");
  }
  else
  {
    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dsLogger");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] null metric during first listener session update\n", v5, 2u);
    }

  }
}

- (void)dsSessionCompletedWithStopReason:(int)a3 numHeartbeats:(unint64_t)a4 numMotionStateMessages:(unint64_t)a5 activeProviderLostCount:(unint64_t)a6 dataLinkType:(int)a7 maxListenerClients:(unint64_t)a8 avgListenerStartInterval:(double)a9
{
  DSSessionMetric *sessionMetric;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  sessionMetric = self->_sessionMetric;
  if (sessionMetric)
  {
    -[DSSessionMetric dsSessionCompletedWithStopReason:numHeartbeats:numMotionStateMessages:activeProviderLostCount:dataLinkType:maxListenerClients:avgListenerStartInterval:](sessionMetric, "dsSessionCompletedWithStopReason:numHeartbeats:numMotionStateMessages:activeProviderLostCount:dataLinkType:maxListenerClients:avgListenerStartInterval:", *(_QWORD *)&a3, a4, a5, a6, *(_QWORD *)&a7, a8, a9);
    -[DSSessionMetric sessionMetricFinalize](self->_sessionMetric, "sessionMetricFinalize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");

    +[DSLogging sharedInstance](DSLogging, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dsLogger");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217E3C000, v14, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] session metric collection completed\n", buf, 2u);
    }

    -[DSSessionMetric eventName](self->_sessionMetric, "eventName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    if (v12)
    {
      if (v16)
      {
        if (!-[NSObject count](v12, "count"))
        {
LABEL_11:

          goto LABEL_14;
        }
        +[DSLogging sharedInstance](DSLogging, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dsLogger");
        v18 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v16;
          _os_log_impl(&dword_217E3C000, v18, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] submitting Event %@ to Core Analytics\n", buf, 0xCu);
        }

        v24 = v12;
        AnalyticsSendEventLazy();
        v19 = v24;
LABEL_10:

        goto LABEL_11;
      }
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dsLogger");
      v19 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      *(_WORD *)buf = 0;
      v22 = "[DSCoreAnalytics] null event name\n";
    }
    else
    {
      +[DSLogging sharedInstance](DSLogging, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dsLogger");
      v19 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      *(_WORD *)buf = 0;
      v22 = "[DSCoreAnalytics] null event dictionary\n";
    }
    _os_log_impl(&dword_217E3C000, v19, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
    goto LABEL_10;
  }
  +[DSLogging sharedInstance](DSLogging, "sharedInstance", *(_QWORD *)&a3, a4, a5, a6, *(_QWORD *)&a7, a8, a9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dsLogger");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v12, OS_LOG_TYPE_DEFAULT, "[DSCoreAnalytics] null metric during session stop\n", buf, 2u);
  }
LABEL_14:

}

id __182__DSCoreAnalyticsEventHandler_dsSessionCompletedWithStopReason_numHeartbeats_numMotionStateMessages_activeProviderLostCount_dataLinkType_maxListenerClients_avgListenerStartInterval___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionMetric, 0);
}

@end
