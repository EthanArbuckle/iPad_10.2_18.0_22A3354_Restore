@implementation HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent

- (HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent *v11;
  HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("energyForecastGridID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    NSLog(CFSTR("HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent gridID is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("energyIndicatorAdviceText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
    NSLog(CFSTR("HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent adviceText is nil"));
  v14.receiver = self;
  v14.super_class = (Class)HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent;
  v11 = -[HFAnalyticsEvent initWithEventType:](&v14, sel_initWithEventType_, 51);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_gridID, v6);
    objc_storeStrong((id *)&v12->_adviceText, v9);
  }

  return v12;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent;
  -[HFAnalyticsEvent payload](&v8, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent gridID](self, "gridID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("energyForecastGridID"));

  -[HFAnalyticsEnergyIndicatorAccessoryViewVisitEvent adviceText](self, "adviceText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("energyIndicatorAdviceText"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CBA40, CFSTR("homeAppEventCount"));
  return v4;
}

- (NSString)gridID
{
  return self->_gridID;
}

- (NSString)adviceText
{
  return self->_adviceText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adviceText, 0);
  objc_storeStrong((id *)&self->_gridID, 0);
}

- (void)setGridID:(id)a3
{
  objc_storeStrong((id *)&self->_gridID, a3);
}

- (void)setAdviceText:(id)a3
{
  objc_storeStrong((id *)&self->_adviceText, a3);
}

@end
