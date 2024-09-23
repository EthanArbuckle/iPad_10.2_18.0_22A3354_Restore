@implementation HFAnalyticsEnergyCategoryViewDurationEvent

- (HFAnalyticsEnergyCategoryViewDurationEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HFAnalyticsEnergyCategoryViewDurationEvent *v7;
  HFAnalyticsEnergyCategoryViewDurationEvent *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("energyViewDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("HFAnalyticsEnergyViewDurationEvent energyViewDuration is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userHasAccessories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    NSLog(CFSTR("HFAnalyticsEnergyViewDurationEvent userHasAccessories is nil"));
  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsEnergyCategoryViewDurationEvent;
  v7 = -[HFAnalyticsEvent initWithEventType:](&v10, sel_initWithEventType_, 47);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_energyViewDuration, v5);
    v8->_userHasAccessories = objc_msgSend(v6, "BOOLValue");
  }

  return v8;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (-[NSNumber integerValue](self->_energyViewDuration, "integerValue") < 1)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsEnergyCategoryViewDurationEvent;
  -[HFAnalyticsEvent payload](&v8, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsEnergyCategoryViewDurationEvent energyViewDuration](self, "energyViewDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("energyViewDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsEnergyCategoryViewDurationEvent userHasAccessories](self, "userHasAccessories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("energyViewUserHasAccessories"));

  objc_msgSend(v4, "na_safeSetObject:forKey:", &unk_1EA7CB6B0, CFSTR("homeAppEventCount"));
  return v4;
}

- (NSNumber)energyViewDuration
{
  return self->_energyViewDuration;
}

- (void)setEnergyViewDuration:(id)a3
{
  objc_storeStrong((id *)&self->_energyViewDuration, a3);
}

- (BOOL)userHasAccessories
{
  return self->_userHasAccessories;
}

- (void)setUserHasAccessories:(BOOL)a3
{
  self->_userHasAccessories = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyViewDuration, 0);
}

@end
