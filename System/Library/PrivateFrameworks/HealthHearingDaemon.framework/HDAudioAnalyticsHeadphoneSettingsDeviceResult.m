@implementation HDAudioAnalyticsHeadphoneSettingsDeviceResult

+ (id)requiredSettingsWithSaveForEightDays:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_alloc((Class)a1);
  if (v3)
    v5 = MEMORY[0x24BDBD1C8];
  else
    v5 = MEMORY[0x24BDBD1C0];
  return (id)objc_msgSend(v4, "initWithHAENRequired:hasHAENEnabled:hasMeasureLevelsEnabled:hasIncludeOtherHeadphonesEnabled:haeRetention:", 1, 0, 0, 0, v5);
}

+ (id)optInSettingsWithHasHAENEnabled:(BOOL)a3 hasMeasureLevelsEnabled:(BOOL)a4 hasIncludeOtherHeadphonesEnabled:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithHAENRequired:hasHAENEnabled:hasMeasureLevelsEnabled:hasIncludeOtherHeadphonesEnabled:haeRetention:", 0, v9, v10, v11, 0);

  return v12;
}

- (HDAudioAnalyticsHeadphoneSettingsDeviceResult)initWithHAENRequired:(BOOL)a3 hasHAENEnabled:(id)a4 hasMeasureLevelsEnabled:(id)a5 hasIncludeOtherHeadphonesEnabled:(id)a6 haeRetention:(id)a7
{
  _BOOL8 v11;
  id v13;
  id v14;
  id v15;
  id v16;
  HDAudioAnalyticsHeadphoneSettingsDeviceResult *v17;
  uint64_t v18;
  NSNumber *hasHAENRequired;
  HDAudioAnalyticsHeadphoneSettingsDeviceResult *v20;
  objc_super v22;

  v11 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HDAudioAnalyticsHeadphoneSettingsDeviceResult;
  v17 = -[HDAudioAnalyticsHeadphoneSettingsDeviceResult init](&v22, sel_init);
  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
    v18 = objc_claimAutoreleasedReturnValue();
    hasHAENRequired = v17->_hasHAENRequired;
    v17->_hasHAENRequired = (NSNumber *)v18;

    objc_storeStrong((id *)&v17->_hasHAENEnabled, a4);
    objc_storeStrong((id *)&v17->_hasMeasureLevelsEnabled, a5);
    objc_storeStrong((id *)&v17->_hasIncludeOtherHeadphonesEnabled, a6);
    objc_storeStrong((id *)&v17->_haeRetention, a7);
    v20 = v17;
  }

  return v17;
}

- (NSNumber)hasHAENRequired
{
  return self->_hasHAENRequired;
}

- (NSNumber)hasHAENEnabled
{
  return self->_hasHAENEnabled;
}

- (NSNumber)hasMeasureLevelsEnabled
{
  return self->_hasMeasureLevelsEnabled;
}

- (NSNumber)hasIncludeOtherHeadphonesEnabled
{
  return self->_hasIncludeOtherHeadphonesEnabled;
}

- (NSNumber)haeRetention
{
  return self->_haeRetention;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_haeRetention, 0);
  objc_storeStrong((id *)&self->_hasIncludeOtherHeadphonesEnabled, 0);
  objc_storeStrong((id *)&self->_hasMeasureLevelsEnabled, 0);
  objc_storeStrong((id *)&self->_hasHAENEnabled, 0);
  objc_storeStrong((id *)&self->_hasHAENRequired, 0);
}

@end
