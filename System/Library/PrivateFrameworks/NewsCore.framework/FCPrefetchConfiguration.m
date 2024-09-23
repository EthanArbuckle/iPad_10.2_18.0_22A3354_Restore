@implementation FCPrefetchConfiguration

- (FCPrefetchConfiguration)initWithConfigDictionary:(id)a3
{
  id v5;
  FCPrefetchConfiguration *v6;
  FCPrefetchConfiguration *v7;
  uint64_t v8;
  NSDictionary *scheduledBGFetchTimes;
  void *v10;
  uint64_t v11;
  NSDictionary *scheduledMicroUpdateTimes;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPrefetchConfiguration;
  v6 = -[FCPrefetchConfiguration init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configDict, a3);
    v7->_backgroundFetchEnabled = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("backgroundFetchEnabled2"), 1);
    v7->_minimumBackgroundFetchInterval = (double)FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("backgroundFetchMinimumInterval"), 0);
    v7->_shouldPrefetchForYouFeed = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("feedPrefetchForYou"), 1);
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("scheduledBGFetchTimes"), &unk_1E470D4C0);
    v8 = objc_claimAutoreleasedReturnValue();
    scheduledBGFetchTimes = v7->_scheduledBGFetchTimes;
    v7->_scheduledBGFetchTimes = (NSDictionary *)v8;

    v7->_scheduledBGFetchTimeJitter = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("scheduledBGFetchJitter"), 3600);
    FCDefaultScheduledMicroUpdateTimes();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationDictionaryValueWithDefaultValue(v5, (uint64_t)CFSTR("scheduledMicroUpdateTimes"), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    scheduledMicroUpdateTimes = v7->_scheduledMicroUpdateTimes;
    v7->_scheduledMicroUpdateTimes = (NSDictionary *)v11;

    v7->_scheduledMicroUpdateTimeJitter = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("scheduledMicroUpdateJitter"), 3600);
  }

  return v7;
}

- (double)minimumBackgroundFetchInterval
{
  return self->_minimumBackgroundFetchInterval;
}

- (BOOL)isBackgroundFetchEnabled
{
  return self->_backgroundFetchEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledMicroUpdateTimes, 0);
  objc_storeStrong((id *)&self->_scheduledBGFetchTimes, 0);
  objc_storeStrong((id *)&self->_configDict, 0);
}

- (FCPrefetchConfiguration)initWithDefaults
{
  FCPrefetchConfiguration *v2;
  FCPrefetchConfiguration *v3;
  NSDictionary *scheduledBGFetchTimes;
  uint64_t v5;
  NSDictionary *scheduledMicroUpdateTimes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FCPrefetchConfiguration;
  v2 = -[FCPrefetchConfiguration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_backgroundFetchEnabled = 257;
    scheduledBGFetchTimes = v2->_scheduledBGFetchTimes;
    v2->_minimumBackgroundFetchInterval = 0.0;
    v2->_scheduledBGFetchTimes = (NSDictionary *)&unk_1E470D498;

    v3->_scheduledBGFetchTimeJitter = 3600;
    FCDefaultScheduledMicroUpdateTimes();
    v5 = objc_claimAutoreleasedReturnValue();
    scheduledMicroUpdateTimes = v3->_scheduledMicroUpdateTimes;
    v3->_scheduledMicroUpdateTimes = (NSDictionary *)v5;

    v3->_scheduledMicroUpdateTimeJitter = 3600;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    v7 = objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", self->_configDict, v6[1]);
  else
    v7 = 0;

  return v7;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_configDict, "hash");
}

- (BOOL)shouldPrefetchForYouFeed
{
  return self->_shouldPrefetchForYouFeed;
}

- (NSDictionary)scheduledBGFetchTimes
{
  return self->_scheduledBGFetchTimes;
}

- (int64_t)scheduledBGFetchTimeJitter
{
  return self->_scheduledBGFetchTimeJitter;
}

- (NSDictionary)scheduledMicroUpdateTimes
{
  return self->_scheduledMicroUpdateTimes;
}

- (int64_t)scheduledMicroUpdateTimeJitter
{
  return self->_scheduledMicroUpdateTimeJitter;
}

@end
