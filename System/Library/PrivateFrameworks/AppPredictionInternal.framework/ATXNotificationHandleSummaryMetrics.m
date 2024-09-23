@implementation ATXNotificationHandleSummaryMetrics

- (id)metricName
{
  return CFSTR("com.apple.ModeActivity.NotificationHandling.summary");
}

- (ATXNotificationHandleSummaryMetrics)initWithDimensions:(id)a3
{
  ATXNotificationHandleSummaryMetrics *v3;
  ATXNotificationHandleSummaryMetrics *v4;
  uint64_t v5;
  NSMutableDictionary *unhandledReceivedNotifications;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXNotificationHandleSummaryMetrics;
  v3 = -[_ATXCoreAnalyticsMetric initWithDimensions:](&v8, sel_initWithDimensions_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_rejectedNotificationTotalHandleTime = 0.0;
    v3->_acceptedNotificationTotalHandleTime = 0.0;
    v3->_rejectedNotificationCount = 0;
    v3->_acceptedNotificationCount = 0;
    v3->_notificationsReceivedCount = 0;
    v5 = objc_opt_new();
    unhandledReceivedNotifications = v4->_unhandledReceivedNotifications;
    v4->_unhandledReceivedNotifications = (NSMutableDictionary *)v5;

  }
  return v4;
}

- (double)rejectedNotificationAverageHandleTime
{
  unint64_t rejectedNotificationCount;

  rejectedNotificationCount = self->_rejectedNotificationCount;
  if (rejectedNotificationCount)
    return self->_rejectedNotificationTotalHandleTime / (double)rejectedNotificationCount;
  else
    return 0.0;
}

- (double)acceptedNotificationAverageHandleTime
{
  unint64_t acceptedNotificationCount;

  acceptedNotificationCount = self->_acceptedNotificationCount;
  if (acceptedNotificationCount)
    return self->_acceptedNotificationTotalHandleTime / (double)acceptedNotificationCount;
  else
    return 0.0;
}

- (double)rejectedNotificationsPercentage
{
  unint64_t notificationsReceivedCount;

  notificationsReceivedCount = self->_notificationsReceivedCount;
  if (notificationsReceivedCount)
    return (double)self->_rejectedNotificationCount / (double)notificationsReceivedCount;
  else
    return 0.0;
}

- (double)acceptedNotificationsPercentage
{
  unint64_t notificationsReceivedCount;

  notificationsReceivedCount = self->_notificationsReceivedCount;
  if (notificationsReceivedCount)
    return (double)self->_acceptedNotificationCount / (double)notificationsReceivedCount;
  else
    return 0.0;
}

- (double)unhandledNotificationsPercentage
{
  if (self->_notificationsReceivedCount)
    return (double)(unint64_t)-[NSMutableDictionary count](self->_unhandledReceivedNotifications, "count")
         / (double)self->_notificationsReceivedCount;
  else
    return 0.0;
}

- (id)coreAnalyticsDictionary
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
  _QWORD v18[8];
  _QWORD v19[9];

  v19[8] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("rejectedNotificationAverageHandleTime");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXNotificationHandleSummaryMetrics rejectedNotificationAverageHandleTime](self, "rejectedNotificationAverageHandleTime");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v18[1] = CFSTR("acceptedNotificationAverageHandleTime");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXNotificationHandleSummaryMetrics acceptedNotificationAverageHandleTime](self, "acceptedNotificationAverageHandleTime");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  v18[2] = CFSTR("rejectedNotificationCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationHandleSummaryMetrics rejectedNotificationCount](self, "rejectedNotificationCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v18[3] = CFSTR("acceptedNotificationCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationHandleSummaryMetrics acceptedNotificationCount](self, "acceptedNotificationCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v8;
  v18[4] = CFSTR("notificationsReceivedCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNotificationHandleSummaryMetrics notificationsReceivedCount](self, "notificationsReceivedCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v9;
  v18[5] = CFSTR("rejectedNotificationsPercentage");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXNotificationHandleSummaryMetrics rejectedNotificationsPercentage](self, "rejectedNotificationsPercentage");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v11;
  v18[6] = CFSTR("acceptedNotificationsPercentage");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXNotificationHandleSummaryMetrics acceptedNotificationsPercentage](self, "acceptedNotificationsPercentage");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v13;
  v18[7] = CFSTR("unhandledNotificationsPercentage");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXNotificationHandleSummaryMetrics unhandledNotificationsPercentage](self, "unhandledNotificationsPercentage");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)handleTelemetryResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  v4 = a3;
  ++self->_notificationsReceivedCount;
  v14 = v4;
  objc_msgSend(v4, "resolution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "resolutionType");

  if (!v6)
  {
    ++self->_acceptedNotificationCount;
    objc_msgSend(v14, "resolution");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolutionTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "receiveTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    self->_acceptedNotificationTotalHandleTime = v13 + self->_acceptedNotificationTotalHandleTime;
    goto LABEL_5;
  }
  objc_msgSend(v14, "resolution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "resolutionType");

  if (v8 == 1)
  {
    ++self->_rejectedNotificationCount;
    objc_msgSend(v14, "resolution");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolutionTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "receiveTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    self->_rejectedNotificationCount = (unint64_t)(v12 + (double)self->_rejectedNotificationCount);
LABEL_5:

  }
}

- (void)handleNotificationEvent:(id)a3
{
  NSMutableDictionary *unhandledReceivedNotifications;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  int *v11;
  int *v12;
  id v13;

  v13 = a3;
  if (!objc_msgSend(v13, "isReceiveEvent"))
  {
    -[ATXNotificationHandleSummaryMetrics popReceiveEventForNotification:](self, "popReceiveEventForNotification:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v13, "eventTime");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "eventTime");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      v10 = v9;

      if ((objc_msgSend(v13, "isAcceptEvent") & 1) != 0)
      {
        v11 = &OBJC_IVAR___ATXNotificationHandleSummaryMetrics__acceptedNotificationCount;
        v12 = &OBJC_IVAR___ATXNotificationHandleSummaryMetrics__acceptedNotificationTotalHandleTime;
LABEL_8:
        *(double *)((char *)&self->super.super.isa + *v12) = v10 + *(double *)((char *)&self->super.super.isa + *v12);
        ++*(Class *)((char *)&self->super.super.isa + *v11);
        goto LABEL_9;
      }
      if (objc_msgSend(v13, "isRejectEvent"))
      {
        v11 = &OBJC_IVAR___ATXNotificationHandleSummaryMetrics__rejectedNotificationCount;
        v12 = &OBJC_IVAR___ATXNotificationHandleSummaryMetrics__rejectedNotificationTotalHandleTime;
        goto LABEL_8;
      }
    }
LABEL_9:

    goto LABEL_10;
  }
  unhandledReceivedNotifications = self->_unhandledReceivedNotifications;
  objc_msgSend(v13, "notificationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](unhandledReceivedNotifications, "setObject:forKeyedSubscript:", v13, v5);

  ++self->_notificationsReceivedCount;
LABEL_10:

}

- (id)popReceiveEventForNotification:(id)a3
{
  NSMutableDictionary *unhandledReceivedNotifications;
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;

  unhandledReceivedNotifications = self->_unhandledReceivedNotifications;
  v5 = a3;
  objc_msgSend(v5, "notificationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](unhandledReceivedNotifications, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = self->_unhandledReceivedNotifications;
  objc_msgSend(v5, "notificationId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);
  return v7;
}

- (unint64_t)rejectedNotificationCount
{
  return self->_rejectedNotificationCount;
}

- (unint64_t)acceptedNotificationCount
{
  return self->_acceptedNotificationCount;
}

- (unint64_t)notificationsReceivedCount
{
  return self->_notificationsReceivedCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unhandledReceivedNotifications, 0);
}

@end
