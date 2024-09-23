@implementation HFAnalyticsEnergyWidgetAndComplicationSettingsEvent

- (HFAnalyticsEnergyWidgetAndComplicationSettingsEvent)initWithData:(id)a3
{
  void *v4;
  HFAnalyticsEnergyWidgetAndComplicationSettingsEvent *v5;
  HFAnalyticsEnergyWidgetAndComplicationSettingsEvent *v6;
  objc_super v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("energyWidgetAndComplicationLocationSetting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    NSLog(CFSTR("HFAnalyticsEnergyWidgetAndComplicationSettingEvent location is nil"));
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsEnergyWidgetAndComplicationSettingsEvent;
  v5 = -[HFAnalyticsEvent initWithEventType:](&v8, sel_initWithEventType_, 52);
  v6 = v5;
  if (v5)
    objc_storeStrong((id *)&v5->_location, v4);

  return v6;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsEnergyWidgetAndComplicationSettingsEvent;
  -[HFAnalyticsEvent payload](&v7, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsEnergyWidgetAndComplicationSettingsEvent location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("energyWidgetAndComplicationLocation"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CBA58, CFSTR("homeAppEventCount"));
  return v4;
}

- (NSNumber)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
