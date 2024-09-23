@implementation ATXSmartPauseDatabaseQueryResult

- (ATXSmartPauseDatabaseQueryResult)initWithBundleId:(id)a3 threadId:(id)a4
{
  id v6;
  id v7;
  ATXSmartPauseDatabaseQueryResult *v8;
  ATXSmartPauseDatabaseQueryResult *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATXSmartPauseDatabaseQueryResult;
  v8 = -[ATXSmartPauseDatabaseQueryResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ATXSmartPauseDatabaseQueryResult setBundleId:](v8, "setBundleId:", v6);
    -[ATXSmartPauseDatabaseQueryResult setThreadId:](v9, "setThreadId:", v7);
  }

  return v9;
}

- (void)mergeWithOther:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[ATXSmartPauseDatabaseQueryResult setCountLastFiveMinutesNotifications:](self, "setCountLastFiveMinutesNotifications:", -[ATXSmartPauseDatabaseQueryResult countLastFiveMinutesNotifications](self, "countLastFiveMinutesNotifications")+ objc_msgSend(v4, "countLastFiveMinutesNotifications"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastFiveMinutesPositiveEngagements:](self, "setCountLastFiveMinutesPositiveEngagements:", -[ATXSmartPauseDatabaseQueryResult countLastFiveMinutesPositiveEngagements](self, "countLastFiveMinutesPositiveEngagements")+ objc_msgSend(v4, "countLastFiveMinutesPositiveEngagements"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastHourNotifications:](self, "setCountLastHourNotifications:", -[ATXSmartPauseDatabaseQueryResult countLastHourNotifications](self, "countLastHourNotifications")+ objc_msgSend(v4, "countLastHourNotifications"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastHourPositiveEngagements:](self, "setCountLastHourPositiveEngagements:", -[ATXSmartPauseDatabaseQueryResult countLastHourPositiveEngagements](self, "countLastHourPositiveEngagements")+ objc_msgSend(v4, "countLastHourPositiveEngagements"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastDayNotifications:](self, "setCountLastDayNotifications:", -[ATXSmartPauseDatabaseQueryResult countLastDayNotifications](self, "countLastDayNotifications")+ objc_msgSend(v4, "countLastDayNotifications"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastDayPositiveEngagements:](self, "setCountLastDayPositiveEngagements:", -[ATXSmartPauseDatabaseQueryResult countLastDayPositiveEngagements](self, "countLastDayPositiveEngagements")+ objc_msgSend(v4, "countLastDayPositiveEngagements"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastWeekNotifications:](self, "setCountLastWeekNotifications:", -[ATXSmartPauseDatabaseQueryResult countLastWeekNotifications](self, "countLastWeekNotifications")+ objc_msgSend(v4, "countLastWeekNotifications"));
  -[ATXSmartPauseDatabaseQueryResult setCountLastWeekPositiveEngagements:](self, "setCountLastWeekPositiveEngagements:", -[ATXSmartPauseDatabaseQueryResult countLastWeekPositiveEngagements](self, "countLastWeekPositiveEngagements")+ objc_msgSend(v4, "countLastWeekPositiveEngagements"));
  -[ATXSmartPauseDatabaseQueryResult setCountNotifications:](self, "setCountNotifications:", -[ATXSmartPauseDatabaseQueryResult countNotifications](self, "countNotifications")+ objc_msgSend(v4, "countNotifications"));
  v5 = objc_msgSend(v4, "countPositiveEngagements");

  -[ATXSmartPauseDatabaseQueryResult setCountPositiveEngagements:](self, "setCountPositiveEngagements:", -[ATXSmartPauseDatabaseQueryResult countPositiveEngagements](self, "countPositiveEngagements") + v5);
}

+ (id)groupByBundleId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXSmartPauseDatabaseQueryResult *v14;
  void *v15;
  ATXSmartPauseDatabaseQueryResult *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "bundleId", (_QWORD)v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "bundleId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v14 = [ATXSmartPauseDatabaseQueryResult alloc];
            objc_msgSend(v10, "bundleId");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[ATXSmartPauseDatabaseQueryResult initWithBundleId:threadId:](v14, "initWithBundleId:threadId:", v15, 0);
            objc_msgSend(v10, "bundleId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v17);

          }
          objc_msgSend(v10, "bundleId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "mergeWithOther:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)threadId
{
  return self->_threadId;
}

- (void)setThreadId:(id)a3
{
  objc_storeStrong((id *)&self->_threadId, a3);
}

- (unint64_t)countLastFiveMinutesNotifications
{
  return self->_countLastFiveMinutesNotifications;
}

- (void)setCountLastFiveMinutesNotifications:(unint64_t)a3
{
  self->_countLastFiveMinutesNotifications = a3;
}

- (unint64_t)countLastFiveMinutesPositiveEngagements
{
  return self->_countLastFiveMinutesPositiveEngagements;
}

- (void)setCountLastFiveMinutesPositiveEngagements:(unint64_t)a3
{
  self->_countLastFiveMinutesPositiveEngagements = a3;
}

- (unint64_t)countLastHourNotifications
{
  return self->_countLastHourNotifications;
}

- (void)setCountLastHourNotifications:(unint64_t)a3
{
  self->_countLastHourNotifications = a3;
}

- (unint64_t)countLastHourPositiveEngagements
{
  return self->_countLastHourPositiveEngagements;
}

- (void)setCountLastHourPositiveEngagements:(unint64_t)a3
{
  self->_countLastHourPositiveEngagements = a3;
}

- (unint64_t)countLastDayNotifications
{
  return self->_countLastDayNotifications;
}

- (void)setCountLastDayNotifications:(unint64_t)a3
{
  self->_countLastDayNotifications = a3;
}

- (unint64_t)countLastDayPositiveEngagements
{
  return self->_countLastDayPositiveEngagements;
}

- (void)setCountLastDayPositiveEngagements:(unint64_t)a3
{
  self->_countLastDayPositiveEngagements = a3;
}

- (unint64_t)countLastWeekNotifications
{
  return self->_countLastWeekNotifications;
}

- (void)setCountLastWeekNotifications:(unint64_t)a3
{
  self->_countLastWeekNotifications = a3;
}

- (unint64_t)countLastWeekPositiveEngagements
{
  return self->_countLastWeekPositiveEngagements;
}

- (void)setCountLastWeekPositiveEngagements:(unint64_t)a3
{
  self->_countLastWeekPositiveEngagements = a3;
}

- (unint64_t)countNotifications
{
  return self->_countNotifications;
}

- (void)setCountNotifications:(unint64_t)a3
{
  self->_countNotifications = a3;
}

- (unint64_t)countPositiveEngagements
{
  return self->_countPositiveEngagements;
}

- (void)setCountPositiveEngagements:(unint64_t)a3
{
  self->_countPositiveEngagements = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
