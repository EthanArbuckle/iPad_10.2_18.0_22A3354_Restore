@implementation ATXScorableTimeATXModeWrapper(Training)

- (ATXUnifiedModeStreamModeEventProvider)scorableTimeEventProvider
{
  uint64_t v2;
  NSObject *v3;
  ATXUnifiedModeStreamModeEventProvider *v4;
  ATXUnifiedModeStreamModeEventProvider *v5;

  v2 = objc_msgSend(a1, "atxMode");
  if ((unint64_t)(v2 - 8) >= 4)
  {
    if (v2 == 12)
      v5 = (ATXUnifiedModeStreamModeEventProvider *)objc_opt_new();
    else
      v5 = [ATXUnifiedModeStreamModeEventProvider alloc];
    v4 = -[ATXModeTransitionModeEventProvider initWithMode:](v5, "initWithMode:", objc_msgSend(a1, "atxMode"));
  }
  else
  {
    __atxlog_handle_notification_management();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      +[ATXModeEntityModelTrainer eventProviderForMode:].cold.1(v3);

    v4 = 0;
  }
  return v4;
}

@end
