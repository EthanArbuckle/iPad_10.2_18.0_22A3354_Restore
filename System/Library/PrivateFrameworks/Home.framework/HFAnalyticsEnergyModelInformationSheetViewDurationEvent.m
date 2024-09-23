@implementation HFAnalyticsEnergyModelInformationSheetViewDurationEvent

- (HFAnalyticsEnergyModelInformationSheetViewDurationEvent)initWithData:(id)a3
{
  void *v4;
  HFAnalyticsEnergyModelInformationSheetViewDurationEvent *v5;
  HFAnalyticsEnergyModelInformationSheetViewDurationEvent *v6;
  objc_super v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("energyModelInformationSheetViewDuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    NSLog(CFSTR("HFAnalyticsEnergyModelInformationSheetViewDurationEvent modelInformationSheetViewDuration is nil"));
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsEnergyModelInformationSheetViewDurationEvent;
  v5 = -[HFAnalyticsEvent initWithEventType:](&v8, sel_initWithEventType_, 50);
  v6 = v5;
  if (v5)
    objc_storeStrong((id *)&v5->_modelInformationSheetViewDuration, v4);

  return v6;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (-[NSNumber integerValue](self->_modelInformationSheetViewDuration, "integerValue") < 1)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsEnergyModelInformationSheetViewDurationEvent;
  -[HFAnalyticsEvent payload](&v7, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsEnergyModelInformationSheetViewDurationEvent modelInformationSheetViewDuration](self, "modelInformationSheetViewDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("energyModelInformationSheetViewDuration"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CD498, CFSTR("homeAppEventCount"));
  return v4;
}

- (NSNumber)modelInformationSheetViewDuration
{
  return self->_modelInformationSheetViewDuration;
}

- (void)setModelInformationSheetViewDuration:(id)a3
{
  objc_storeStrong((id *)&self->_modelInformationSheetViewDuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelInformationSheetViewDuration, 0);
}

@end
