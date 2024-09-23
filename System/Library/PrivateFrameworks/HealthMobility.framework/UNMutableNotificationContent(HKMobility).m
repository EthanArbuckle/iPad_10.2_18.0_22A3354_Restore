@implementation UNMutableNotificationContent(HKMobility)

+ (id)_hkmobility_contentWithCategory:()HKMobility shouldHidePregnancyContent:expirationDate:
{
  id v8;
  id v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(a1);
  v11 = v8;
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessInitial.Low")) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessRepeat.Low")))
  {
    v12 = CFSTR("WALKING_STEADINESS_NOTIFICATION_TITLE_LOW");
LABEL_7:
    HKMobilityLocalizedNotificationString((uint64_t)v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessInitial.VeryLow")) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessRepeat.VeryLow")))
  {
    v12 = CFSTR("WALKING_STEADINESS_NOTIFICATION_TITLE_VERY_LOW");
    goto LABEL_7;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_FAULT))
    +[UNMutableNotificationContent(HKMobility) _hkmobility_contentWithCategory:shouldHidePregnancyContent:expirationDate:].cold.1();
  v13 = 0;
LABEL_8:

  objc_msgSend(v10, "setTitle:", v13);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "features");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "seahorse");

  if (v16 && !a4)
  {
    HKMobilityLocalizedNotificationDuringPregnancyBodyForCategory(v11);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HKMobilityLocalizedNotificationBodyForCategory(v11);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  objc_msgSend(v10, "setBody:", v17);

  objc_msgSend(v10, "setCategoryIdentifier:", v11);
  objc_msgSend(v10, "setExpirationDate:", v9);

  objc_msgSend(v10, "setThreadIdentifier:", CFSTR("com.apple.health.Mobility"));
  -[objc_class _makeUserInfoForCategory:](a1, "_makeUserInfoForCategory:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInfo:", v19);

  objc_msgSend(MEMORY[0x1E0CEC760], "soundWithAlertType:", 25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSound:", v20);

  return v10;
}

+ (id)_makeUserInfoForCategory:()HKMobility
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E9C39B00, *MEMORY[0x1E0CB7760]);
  v6 = v4;
  HKMobilityAllWalkingSteadinessNotificationCategories();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8
    && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-apple-health://summary")),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9;
    objc_msgSend(v9, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB7770]);

  }
  else
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB5328];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_ERROR))
      +[UNMutableNotificationContent(HKMobility) _makeUserInfoForCategory:].cold.1(v12, a1, (uint64_t)v6);
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("mobilityNotificationCatgoryKey"));
  v13 = (void *)objc_msgSend(v5, "copy");

  return v13;
}

+ (void)_hkmobility_contentWithCategory:()HKMobility shouldHidePregnancyContent:expirationDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7804000, v0, v1, "[UNNotificationRequest+HKMobility] Unable to localize notification title for category: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_makeUserInfoForCategory:()HKMobility .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  v6 = 2112;
  v7 = a3;
  _os_log_error_impl(&dword_1D7804000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to determine URL for category: %@", v5, 0x16u);

}

@end
