@implementation MTWidgetProvider

- (BOOL)throttleTimelineReload
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;

  -[MTBaseAlarmWidgetProvider lastReloadRequestDate](self, "lastReloadRequestDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTBaseAlarmWidgetProvider lastReloadRequestDate](self, "lastReloadRequestDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (v7 >= 2.0)
    return 0;
  MTLogForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MTWidgetProvider throttleTimelineReload].cold.1((uint64_t)self, v8);

  return 1;
}

- (id)broadcastWidgetTimelineReload
{
  return +[MTWidgetUtilities reloadAlarmWidgetTimeline](MTWidgetUtilities, "reloadAlarmWidgetTimeline");
}

- (void)throttleTimelineReload
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "%{public}@ widget refresh requested within throttle interval, dropping", (uint8_t *)&v2, 0xCu);
}

@end
