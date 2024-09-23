@implementation FCStatelessPersonalizationEnablementRequirements

- (int64_t)minimumEventCount
{
  return self->_minimumEventCount;
}

- (FCStatelessPersonalizationEnablementRequirements)initWithDictionary:(id)a3
{
  id v4;
  FCStatelessPersonalizationEnablementRequirements *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t v14[16];
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FCStatelessPersonalizationEnablementRequirements;
  v5 = -[FCStatelessPersonalizationEnablementRequirements init](&v15, sel_init);
  if (v5)
  {
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("minimumAggregateCount"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    FCAppConfigurationNumberValue(v4, (uint64_t)CFSTR("minumumEventCount"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 | v7)
    {
      if (v6)
        v8 = objc_msgSend((id)v6, "longLongValue");
      else
        v8 = -1;
      v5->_minimumAggregateCount = v8;
      if (NFInternalBuild()
        && (NewsCoreUserDefaults(),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "integerForKey:", CFSTR("news.features.statelessPersonalization")),
            v9,
            v10 == 1))
      {
        v11 = FCStatelessPersonalizationLog;
        if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Stateless Personalization Enabled, overriding enablement requirements to have minimum event count of 10", v14, 2u);
        }
        v5->_minimumEventCount = 10;
      }
      else
      {
        if (v7)
          v12 = objc_msgSend((id)v7, "longLongValue");
        else
          v12 = -1;
        v5->_minimumEventCount = v12;
      }
    }
    else
    {

      v5 = 0;
    }

  }
  return v5;
}

- (int64_t)minimumAggregateCount
{
  return self->_minimumAggregateCount;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; minimumAggregateCount: %lld"),
    -[FCStatelessPersonalizationEnablementRequirements minimumAggregateCount](self, "minimumAggregateCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; minimumEventCount: %lld"),
    -[FCStatelessPersonalizationEnablementRequirements minimumEventCount](self, "minimumEventCount"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)setMinimumAggregateCount:(int64_t)a3
{
  self->_minimumAggregateCount = a3;
}

- (void)setMinimumEventCount:(int64_t)a3
{
  self->_minimumEventCount = a3;
}

@end
