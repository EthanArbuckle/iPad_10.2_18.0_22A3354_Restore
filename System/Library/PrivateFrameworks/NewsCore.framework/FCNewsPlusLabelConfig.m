@implementation FCNewsPlusLabelConfig

- (FCNewsPlusLabelConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCNewsPlusLabelConfig *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *toolTipTitle;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *toolTipBody;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *toolTipAlternativeBodyForVoiceOver;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCNewsPlusLabelConfig;
  v5 = -[FCNewsPlusLabelConfig init](&v19, sel_init);
  if (v5)
  {
    v5->_enabled = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("enabled"), 0);
    v5->_toolTipDisplayQuiescenceInterval = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("toolTipDisplayQuiescenceInterval"), 86400);
    v5->_toolTipDisplayMaxCount = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("toolTipDisplayMaxCount"), 0);
    FCBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Welcome to News+"), &stru_1E464BC40, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("toolTipTitle"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    toolTipTitle = v5->_toolTipTitle;
    v5->_toolTipTitle = (NSString *)v8;

    FCBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Stories with this badge are part of your subscription."), &stru_1E464BC40, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("toolTipBody"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    toolTipBody = v5->_toolTipBody;
    v5->_toolTipBody = (NSString *)v12;

    FCBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Stories with an Apple News+ badge are part of your subscription."), &stru_1E464BC40, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("toolTipAlternativeBodyForVoiceOver"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    toolTipAlternativeBodyForVoiceOver = v5->_toolTipAlternativeBodyForVoiceOver;
    v5->_toolTipAlternativeBodyForVoiceOver = (NSString *)v16;

  }
  return v5;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)toolTipDisplayQuiescenceInterval
{
  return self->_toolTipDisplayQuiescenceInterval;
}

- (int)toolTipDisplayMaxCount
{
  return self->_toolTipDisplayMaxCount;
}

- (NSString)toolTipTitle
{
  return self->_toolTipTitle;
}

- (NSString)toolTipBody
{
  return self->_toolTipBody;
}

- (NSString)toolTipAlternativeBodyForVoiceOver
{
  return self->_toolTipAlternativeBodyForVoiceOver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolTipAlternativeBodyForVoiceOver, 0);
  objc_storeStrong((id *)&self->_toolTipBody, 0);
  objc_storeStrong((id *)&self->_toolTipTitle, 0);
}

@end
