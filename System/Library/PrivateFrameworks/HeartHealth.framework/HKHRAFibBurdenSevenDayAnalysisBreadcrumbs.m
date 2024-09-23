@implementation HKHRAFibBurdenSevenDayAnalysisBreadcrumbs

- (HKHRAFibBurdenSevenDayAnalysisBreadcrumbs)initWithAlarmFiredDate:(id)a3 xpcActivityFiredDate:(id)a4 maintenanceOperationRunDate:(id)a5 analysisStartedDate:(id)a6 tachogramsClassifiedDate:(id)a7 analysisEndedDate:(id)a8 analysisRetryLaterRequestedDate:(id)a9 lastAnalysisResultDate:(id)a10 lastAnalysisResultContext:(id)a11
{
  id v18;
  HKHRAFibBurdenSevenDayAnalysisBreadcrumbs *v19;
  HKHRAFibBurdenSevenDayAnalysisBreadcrumbs *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisBreadcrumbs;
  v19 = -[HKHRAFibBurdenSevenDayAnalysisBreadcrumbs init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_alarmFiredDate, a3);
    objc_storeStrong((id *)&v20->_xpcActivityFiredDate, a4);
    objc_storeStrong((id *)&v20->_maintenanceOperationRunDate, a5);
    objc_storeStrong((id *)&v20->_analysisStartedDate, a6);
    objc_storeStrong((id *)&v20->_tachogramsClassifiedDate, a7);
    objc_storeStrong((id *)&v20->_analysisEndedDate, a8);
    objc_storeStrong((id *)&v20->_analysisRetryLaterRequestedDate, a9);
    objc_storeStrong((id *)&v20->_lastAnalysisResultDate, a10);
    objc_storeStrong((id *)&v20->_lastAnalysisResultContext, a11);
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  HKHRAFibBurdenSevenDayAnalysisBreadcrumbs *v4;
  HKHRAFibBurdenSevenDayAnalysisBreadcrumbs *v5;
  BOOL v6;

  v4 = (HKHRAFibBurdenSevenDayAnalysisBreadcrumbs *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSDate isEqualToDate:](self->_alarmFiredDate, "isEqualToDate:", v5->_alarmFiredDate)
        && -[NSDate isEqualToDate:](self->_xpcActivityFiredDate, "isEqualToDate:", v5->_xpcActivityFiredDate)
        && -[NSDate isEqualToDate:](self->_maintenanceOperationRunDate, "isEqualToDate:", v5->_maintenanceOperationRunDate)&& -[NSDate isEqualToDate:](self->_analysisStartedDate, "isEqualToDate:", v5->_analysisStartedDate)&& -[NSDate isEqualToDate:](self->_tachogramsClassifiedDate, "isEqualToDate:", v5->_tachogramsClassifiedDate)&& -[NSDate isEqualToDate:](self->_analysisEndedDate, "isEqualToDate:", v5->_analysisEndedDate)&& -[NSDate isEqualToDate:](self->_analysisRetryLaterRequestedDate, "isEqualToDate:", v5->_analysisRetryLaterRequestedDate)&& -[NSDate isEqualToDate:](self->_lastAnalysisResultDate, "isEqualToDate:", v5->_lastAnalysisResultDate)&& -[NSString isEqualToString:](self->_lastAnalysisResultContext, "isEqualToString:", v5->_lastAnalysisResultContext);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSDate hash](self->_alarmFiredDate, "hash");
  v4 = -[NSDate hash](self->_xpcActivityFiredDate, "hash") ^ v3;
  v5 = -[NSDate hash](self->_maintenanceOperationRunDate, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_analysisStartedDate, "hash");
  v7 = -[NSDate hash](self->_tachogramsClassifiedDate, "hash");
  v8 = v7 ^ -[NSDate hash](self->_analysisEndedDate, "hash");
  v9 = v6 ^ v8 ^ -[NSDate hash](self->_analysisRetryLaterRequestedDate, "hash");
  v10 = -[NSDate hash](self->_lastAnalysisResultDate, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_lastAnalysisResultContext, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *alarmFiredDate;
  id v5;

  alarmFiredDate = self->_alarmFiredDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", alarmFiredDate, CFSTR("AlarmFiredDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_xpcActivityFiredDate, CFSTR("XpcActivityFiredDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maintenanceOperationRunDate, CFSTR("MaintenanceOperationRunDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_analysisStartedDate, CFSTR("AnalysisStartedDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tachogramsClassifiedDate, CFSTR("TachogramsClassifiedDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_analysisEndedDate, CFSTR("AnalysisEndedDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_analysisRetryLaterRequestedDate, CFSTR("AnalysisRetryLaterRequestedDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastAnalysisResultDate, CFSTR("LastAnalysisResultDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastAnalysisResultContext, CFSTR("LastAnalysisResultContextKey"));

}

- (HKHRAFibBurdenSevenDayAnalysisBreadcrumbs)initWithCoder:(id)a3
{
  id v4;
  HKHRAFibBurdenSevenDayAnalysisBreadcrumbs *v5;
  uint64_t v6;
  NSDate *alarmFiredDate;
  uint64_t v8;
  NSDate *xpcActivityFiredDate;
  uint64_t v10;
  NSDate *maintenanceOperationRunDate;
  uint64_t v12;
  NSDate *analysisStartedDate;
  uint64_t v14;
  NSDate *tachogramsClassifiedDate;
  uint64_t v16;
  NSDate *analysisEndedDate;
  uint64_t v18;
  NSDate *analysisRetryLaterRequestedDate;
  uint64_t v20;
  NSDate *lastAnalysisResultDate;
  uint64_t v22;
  NSString *lastAnalysisResultContext;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisBreadcrumbs;
  v5 = -[HKHRAFibBurdenSevenDayAnalysisBreadcrumbs init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AlarmFiredDateKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    alarmFiredDate = v5->_alarmFiredDate;
    v5->_alarmFiredDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("XpcActivityFiredDateKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    xpcActivityFiredDate = v5->_xpcActivityFiredDate;
    v5->_xpcActivityFiredDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MaintenanceOperationRunDateKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    maintenanceOperationRunDate = v5->_maintenanceOperationRunDate;
    v5->_maintenanceOperationRunDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnalysisStartedDateKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    analysisStartedDate = v5->_analysisStartedDate;
    v5->_analysisStartedDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TachogramsClassifiedDateKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    tachogramsClassifiedDate = v5->_tachogramsClassifiedDate;
    v5->_tachogramsClassifiedDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnalysisEndedDateKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    analysisEndedDate = v5->_analysisEndedDate;
    v5->_analysisEndedDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnalysisRetryLaterRequestedDateKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    analysisRetryLaterRequestedDate = v5->_analysisRetryLaterRequestedDate;
    v5->_analysisRetryLaterRequestedDate = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastAnalysisResultDateKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    lastAnalysisResultDate = v5->_lastAnalysisResultDate;
    v5->_lastAnalysisResultDate = (NSDate *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastAnalysisResultContextKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    lastAnalysisResultContext = v5->_lastAnalysisResultContext;
    v5->_lastAnalysisResultContext = (NSString *)v22;

  }
  return v5;
}

- (NSDate)alarmFiredDate
{
  return self->_alarmFiredDate;
}

- (void)setAlarmFiredDate:(id)a3
{
  objc_storeStrong((id *)&self->_alarmFiredDate, a3);
}

- (NSDate)xpcActivityFiredDate
{
  return self->_xpcActivityFiredDate;
}

- (void)setXpcActivityFiredDate:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityFiredDate, a3);
}

- (NSDate)maintenanceOperationRunDate
{
  return self->_maintenanceOperationRunDate;
}

- (void)setMaintenanceOperationRunDate:(id)a3
{
  objc_storeStrong((id *)&self->_maintenanceOperationRunDate, a3);
}

- (NSDate)analysisStartedDate
{
  return self->_analysisStartedDate;
}

- (void)setAnalysisStartedDate:(id)a3
{
  objc_storeStrong((id *)&self->_analysisStartedDate, a3);
}

- (NSDate)tachogramsClassifiedDate
{
  return self->_tachogramsClassifiedDate;
}

- (void)setTachogramsClassifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_tachogramsClassifiedDate, a3);
}

- (NSDate)analysisEndedDate
{
  return self->_analysisEndedDate;
}

- (void)setAnalysisEndedDate:(id)a3
{
  objc_storeStrong((id *)&self->_analysisEndedDate, a3);
}

- (NSDate)analysisRetryLaterRequestedDate
{
  return self->_analysisRetryLaterRequestedDate;
}

- (void)setAnalysisRetryLaterRequestedDate:(id)a3
{
  objc_storeStrong((id *)&self->_analysisRetryLaterRequestedDate, a3);
}

- (NSDate)lastAnalysisResultDate
{
  return self->_lastAnalysisResultDate;
}

- (void)setLastAnalysisResultDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastAnalysisResultDate, a3);
}

- (NSString)lastAnalysisResultContext
{
  return self->_lastAnalysisResultContext;
}

- (void)setLastAnalysisResultContext:(id)a3
{
  objc_storeStrong((id *)&self->_lastAnalysisResultContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAnalysisResultContext, 0);
  objc_storeStrong((id *)&self->_lastAnalysisResultDate, 0);
  objc_storeStrong((id *)&self->_analysisRetryLaterRequestedDate, 0);
  objc_storeStrong((id *)&self->_analysisEndedDate, 0);
  objc_storeStrong((id *)&self->_tachogramsClassifiedDate, 0);
  objc_storeStrong((id *)&self->_analysisStartedDate, 0);
  objc_storeStrong((id *)&self->_maintenanceOperationRunDate, 0);
  objc_storeStrong((id *)&self->_xpcActivityFiredDate, 0);
  objc_storeStrong((id *)&self->_alarmFiredDate, 0);
}

@end
