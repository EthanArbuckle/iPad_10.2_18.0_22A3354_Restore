@implementation HFAnalyticsEnergyDashboardVisitEvent

- (HFAnalyticsEnergyDashboardVisitEvent)initWithData:(id)a3
{
  id v4;
  NSNumber *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HFAnalyticsEnergyDashboardVisitEvent *v10;
  HFAnalyticsEnergyDashboardVisitEvent *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("energyDashboardStatus"));
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("HFAnalyticsEnergyDashboardVisitEvent status is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("energyForecastGridID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (!v8)
    NSLog(CFSTR("HFAnalyticsEnergyDashboardVisitEvent gridID is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("energyDashboardDoublePaneEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    NSLog(CFSTR("HFAnalyticsEnergyDashboardVisitEvent isDoublePaneEnabled is nil"));
  v13.receiver = self;
  v13.super_class = (Class)HFAnalyticsEnergyDashboardVisitEvent;
  v10 = -[HFAnalyticsEvent initWithEventType:](&v13, sel_initWithEventType_, 44);
  v11 = v10;
  if (v10)
  {
    v10->_status = v5;
    objc_storeStrong((id *)&v10->_gridID, v7);
    v11->_isDoublePaneEnabled = objc_msgSend(v9, "BOOLValue");
  }

  return v11;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsEnergyDashboardVisitEvent;
  -[HFAnalyticsEvent payload](&v9, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsEnergyDashboardVisitEvent status](self, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("energyDashboardStatus"));

  -[HFAnalyticsEnergyDashboardVisitEvent gridID](self, "gridID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("energyForecastGridID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsEnergyDashboardVisitEvent isDoublePaneEnabled](self, "isDoublePaneEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("energyDashboardDoublePaneEnabled"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CD5A0, CFSTR("homeAppEventCount"));
  return v4;
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  self->_status = (NSNumber *)a3;
}

- (NSString)gridID
{
  return self->_gridID;
}

- (void)setGridID:(id)a3
{
  objc_storeStrong((id *)&self->_gridID, a3);
}

- (BOOL)isDoublePaneEnabled
{
  return self->_isDoublePaneEnabled;
}

- (void)setIsDoublePaneEnabled:(BOOL)a3
{
  self->_isDoublePaneEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridID, 0);
}

@end
