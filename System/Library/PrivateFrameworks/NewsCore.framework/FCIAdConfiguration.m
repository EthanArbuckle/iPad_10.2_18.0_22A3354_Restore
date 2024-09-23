@implementation FCIAdConfiguration

- (FCIAdConfiguration)initWithConfigDictionary:(id)a3
{
  id v5;
  FCIAdConfiguration *v6;
  FCIAdConfiguration *v7;
  void *v8;
  uint64_t v9;
  NSArray *iAdSegmentIDs;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *adStatusConditionsByType;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCIAdConfiguration;
  v6 = -[FCIAdConfiguration init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configDict, a3);
    v7->_segmentsEnabled = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("segmentsEnabled"), 1);
    v7->_segmentsThreshold = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("segmentsThreshold"), 0.15);
    v7->_segmentsSubmissionFrequency = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("segmentsSubmissionFrequency"), 1296000);
    v7->_segmentsHistoryWindowInterval = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("segmentsHistoryWindowInterval"), 1296000);
    v7->_segmentsMinimumArticleCount = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("segmentsMinimumArticleCount"), 10);
    v7->_segmentsMinimumEventCount = FCAppConfigurationIntegerValue(v5, (uint64_t)CFSTR("segmentsMinimumEventCount"), 20);
    v7->_segmentsMinRelativeRate = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("segmentsMinimumEventCount"), 0.75);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("iAdSegmentIds"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    iAdSegmentIDs = v7->_iAdSegmentIDs;
    v7->_iAdSegmentIDs = (NSArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v5, (uint64_t)CFSTR("adStatusConditions"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[FCAdStatusCondition adStatusConditionsFromConditionsArray:](FCAdStatusCondition, "adStatusConditionsFromConditionsArray:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    adStatusConditionsByType = v7->_adStatusConditionsByType;
    v7->_adStatusConditionsByType = (NSDictionary *)v13;

    v7->_feedNumberOfViewportsBetweenAds = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("feedNumberofViewportsBetweenAds"), 1.0);
    v7->_articleNumberOfViewportsBetweenAds = FCAppConfigurationDoubleValue(v5, (uint64_t)CFSTR("articleNumberofViewportsBetweenAds"), 1.0);
    v7->_preRequestPolicyValidationEnabled = FCAppConfigurationBoolValue(v5, (uint64_t)CFSTR("preRequestPolicyValidationEnabled"), 0);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adStatusConditionsByType, 0);
  objc_storeStrong((id *)&self->_iAdSegmentIDs, 0);
  objc_storeStrong((id *)&self->_configDict, 0);
  objc_storeStrong((id *)&self->_pbConfig, 0);
}

- (FCIAdConfiguration)initWithPBIAdConfig:(id)a3
{
  id v5;
  FCIAdConfiguration *v6;
  FCIAdConfiguration *v7;
  double v8;
  NSArray *iAdSegmentIDs;
  NSDictionary *adStatusConditionsByType;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCIAdConfiguration;
  v6 = -[FCIAdConfiguration init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_pbConfig, a3);
      v7->_segmentsEnabled = objc_msgSend(v5, "segmentsEnabled");
      objc_msgSend(v5, "segmentsThreshold");
      v7->_segmentsThreshold = v8;
      v7->_segmentsSubmissionFrequency = objc_msgSend(v5, "segmentsSubmissionFrequency");
      v7->_segmentsHistoryWindowInterval = objc_msgSend(v5, "segmentsHistoryWindowInterval");
      v7->_segmentsMinimumArticleCount = objc_msgSend(v5, "segmentsMinimumArticleCount");
      iAdSegmentIDs = v7->_iAdSegmentIDs;
      v7->_iAdSegmentIDs = 0;

      adStatusConditionsByType = v7->_adStatusConditionsByType;
      v7->_adStatusConditionsByType = 0;

      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&v7->_feedNumberOfViewportsBetweenAds = _Q0;
      v7->_preRequestPolicyValidationEnabled = 0;
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
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

  if (v6 && objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", self->_pbConfig, v6[1]))
    v7 = objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", self->_configDict, v6[2]);
  else
    v7 = 0;

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NTPBIAdConfig hash](self->_pbConfig, "hash");
  return -[NSDictionary hash](self->_configDict, "hash") ^ v3;
}

- (BOOL)areSegmentsEnabled
{
  return self->_segmentsEnabled;
}

- (double)segmentsThreshold
{
  return self->_segmentsThreshold;
}

- (int64_t)segmentsSubmissionFrequency
{
  return self->_segmentsSubmissionFrequency;
}

- (int64_t)segmentsHistoryWindowInterval
{
  return self->_segmentsHistoryWindowInterval;
}

- (int64_t)segmentsMinimumArticleCount
{
  return self->_segmentsMinimumArticleCount;
}

- (int64_t)segmentsMinimumEventCount
{
  return self->_segmentsMinimumEventCount;
}

- (double)segmentsMinRelativeRate
{
  return self->_segmentsMinRelativeRate;
}

- (NSArray)iAdSegmentIDs
{
  return self->_iAdSegmentIDs;
}

- (NSDictionary)adStatusConditionsByType
{
  return self->_adStatusConditionsByType;
}

- (double)feedNumberOfViewportsBetweenAds
{
  return self->_feedNumberOfViewportsBetweenAds;
}

- (double)articleNumberOfViewportsBetweenAds
{
  return self->_articleNumberOfViewportsBetweenAds;
}

- (BOOL)isPreRequestPolicyValidationEnabled
{
  return self->_preRequestPolicyValidationEnabled;
}

@end
