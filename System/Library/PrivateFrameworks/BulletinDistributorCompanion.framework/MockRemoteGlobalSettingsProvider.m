@implementation MockRemoteGlobalSettingsProvider

- (int64_t)globalScheduledDeliverySetting
{
  return self->_globalScheduledDeliverySetting;
}

- (void)setGlobalScheduledDeliverySetting:(int64_t)a3
{
  self->_globalScheduledDeliverySetting = a3;
}

- (int64_t)effectiveGlobalScheduledDeliverySetting
{
  return self->_effectiveGlobalScheduledDeliverySetting;
}

- (void)setEffectiveGlobalScheduledDeliverySetting:(int64_t)a3
{
  self->_effectiveGlobalScheduledDeliverySetting = a3;
}

- (int64_t)globalSummarizationSetting
{
  return self->_globalSummarizationSetting;
}

- (void)setGlobalSummarizationSetting:(int64_t)a3
{
  self->_globalSummarizationSetting = a3;
}

- (int64_t)effectiveGlobalSummarizationSetting
{
  return self->_effectiveGlobalSummarizationSetting;
}

- (void)setEffectiveGlobalSummarizationSetting:(int64_t)a3
{
  self->_effectiveGlobalSummarizationSetting = a3;
}

@end
