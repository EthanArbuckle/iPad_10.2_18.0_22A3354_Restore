@implementation MNNotificationManager

- (void)showPredictedRouteTrafficIncidentBulletinForCommuteDetails:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_opt_class();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136316162;
    v8 = "-[MNNotificationManager showPredictedRouteTrafficIncidentBulletinForCommuteDetails:]";
    v9 = 2080;
    v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Misc/MNNotificationManager.m";
    v11 = 1024;
    v12 = 20;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: %@ must implement '%@'", (uint8_t *)&v7, 0x30u);

  }
}

@end
