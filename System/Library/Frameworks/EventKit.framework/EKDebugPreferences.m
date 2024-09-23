@implementation EKDebugPreferences

+ (id)shared
{
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, &__block_literal_global_47);
  return (id)shared_sharedPreferences_0;
}

void __28__EKDebugPreferences_shared__block_invoke()
{
  EKDebugPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(EKDebugPreferences);
  v1 = (void *)shared_sharedPreferences_0;
  shared_sharedPreferences_0 = (uint64_t)v0;

}

- (EKDebugPreferences)init
{
  EKDebugPreferences *v2;
  id v3;
  uint64_t v4;
  CalPreferences *preferences;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKDebugPreferences;
  v2 = -[EKDebugPreferences init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D0C368]);
    v4 = objc_msgSend(v3, "initWithDomain:", *MEMORY[0x1E0D0C508]);
    preferences = v2->_preferences;
    v2->_preferences = (CalPreferences *)v4;

    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.overrideTravelAdvisoryHypothesis"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisTransportType"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisConservativeTravelTime"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisEstimatedTravelTime"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisAggressiveTravelTime"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisSupportsLiveTraffic"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisCurrentTrafficDensity"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisRouteName"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisTravelState"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.preventMarkingTravelAdvisoryEntriesAsDismissed"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.forceDisplayOfNewTravelAdvisoryHypotheses"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.saveGeocodedLocationsInTravelEngine"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.performAgendaEntryEqualityChecksInTravelEngine"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.verifyIntegrityOfAvailabilityTimeSearchTimelines"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.showDepartureDateForTransitTimeToLeave"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.shouldBypassTravelEngineThrottle"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkit.debug.preference.notification.syntheticTravelAdvisoriesEnabled"));
  }
  return v2;
}

- (double)availabilityFreshnessWindow
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("availabilityFreshnessWindow"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 120.0;
  }

  return v5;
}

- (void)setAvailabilityFreshnessWindow:(double)a3
{
  id v4;

  if (a3 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("availabilityFreshnessWindow"), v4, CFSTR("com.apple.eventkit.debug.preference.notification.availabilityFreshnessWindow"));

  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKDebugPreferences setAvailabilityFreshnessWindow:].cold.1();
  }
}

- (BOOL)saveGeocodedLocationsInTravelEngine
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("saveGeocodedLocationsInTravelEngine"), 0);
}

- (void)setSaveGeocodedLocationsInTravelEngine:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("saveGeocodedLocationsInTravelEngine"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.saveGeocodedLocationsInTravelEngine"));
}

- (BOOL)overrideTravelAdvisoryHypothesis
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("overrideTravelAdvisoryHypothesis"), 0);
}

- (void)setOverrideTravelAdvisoryHypothesis:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("overrideTravelAdvisoryHypothesis"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.overrideTravelAdvisoryHypothesis"));
}

- (NSString)overriddenTravelAdvisoryHypothesisTransportType
{
  return (NSString *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("overriddenTravelAdvisoryHypothesisTransportType"), objc_opt_class());
}

- (void)setOverriddenTravelAdvisoryHypothesisTransportType:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("overriddenTravelAdvisoryHypothesisTransportType"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisTransportType"));
}

- (double)overriddenTravelAdvisoryHypothesisConservativeTravelTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("overriddenTravelAdvisoryHypothesisConservativeTravelTime"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setOverriddenTravelAdvisoryHypothesisConservativeTravelTime:(double)a3
{
  id v4;

  if (a3 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("overriddenTravelAdvisoryHypothesisConservativeTravelTime"), v4, CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisConservativeTravelTime"));

  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKDebugPreferences setOverriddenTravelAdvisoryHypothesisConservativeTravelTime:].cold.1();
  }
}

- (double)overriddenTravelAdvisoryHypothesisEstimatedTravelTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("overriddenTravelAdvisoryHypothesisEstimatedTravelTime"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setOverriddenTravelAdvisoryHypothesisEstimatedTravelTime:(double)a3
{
  id v4;

  if (a3 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("overriddenTravelAdvisoryHypothesisEstimatedTravelTime"), v4, CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisEstimatedTravelTime"));

  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKDebugPreferences setOverriddenTravelAdvisoryHypothesisEstimatedTravelTime:].cold.1();
  }
}

- (double)overriddenTravelAdvisoryHypothesisAggressiveTravelTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("overriddenTravelAdvisoryHypothesisAggressiveTravelTime"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setOverriddenTravelAdvisoryHypothesisAggressiveTravelTime:(double)a3
{
  id v4;

  if (a3 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("overriddenTravelAdvisoryHypothesisAggressiveTravelTime"), v4, CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisAggressiveTravelTime"));

  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKDebugPreferences setOverriddenTravelAdvisoryHypothesisAggressiveTravelTime:].cold.1();
  }
}

- (BOOL)overriddenTravelAdvisoryHypothesisSupportsLiveTraffic
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("overriddenTravelAdvisoryHypothesisSupportsLiveTraffic"), 0);
}

- (void)setOverriddenTravelAdvisoryHypothesisSupportsLiveTraffic:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("overriddenTravelAdvisoryHypothesisSupportsLiveTraffic"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisSupportsLiveTraffic"));
}

- (NSString)overriddenTravelAdvisoryHypothesisCurrentTrafficDensity
{
  return (NSString *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("overriddenTravelAdvisoryHypothesisCurrentTrafficDensity"), objc_opt_class());
}

- (void)setOverriddenTravelAdvisoryHypothesisCurrentTrafficDensity:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("overriddenTravelAdvisoryHypothesisCurrentTrafficDensity"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisCurrentTrafficDensity"));
}

- (NSString)overriddenTravelAdvisoryHypothesisRouteName
{
  return (NSString *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("overriddenTravelAdvisoryHypothesisRouteName"), objc_opt_class());
}

- (void)setOverriddenTravelAdvisoryHypothesisRouteName:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("overriddenTravelAdvisoryHypothesisRouteName"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisRouteName"));
}

- (NSString)overriddenTravelAdvisoryHypothesisTravelState
{
  return (NSString *)-[CalPreferences getValueForPreference:expectedClass:](self->_preferences, "getValueForPreference:expectedClass:", CFSTR("overriddenTravelAdvisoryHypothesisTravelState"), objc_opt_class());
}

- (void)setOverriddenTravelAdvisoryHypothesisTravelState:(id)a3
{
  -[CalPreferences setValueForPreference:value:notificationName:](self->_preferences, "setValueForPreference:value:notificationName:", CFSTR("overriddenTravelAdvisoryHypothesisTravelState"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.overriddenTravelAdvisoryHypothesisTravelState"));
}

- (BOOL)preventMarkingTravelAdvisoryEntriesAsDismissed
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("preventMarkingTravelAdvisoryEntriesAsDismissed"), 0);
}

- (void)setPreventMarkingTravelAdvisoryEntriesAsDismissed:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("preventMarkingTravelAdvisoryEntriesAsDismissed"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.preventMarkingTravelAdvisoryEntriesAsDismissed"));
}

- (BOOL)forceDisplayOfNewTravelAdvisoryHypotheses
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("forceDisplayOfNewTravelAdvisoryHypotheses"), 0);
}

- (void)setForceDisplayOfNewTravelAdvisoryHypotheses:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("forceDisplayOfNewTravelAdvisoryHypotheses"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.forceDisplayOfNewTravelAdvisoryHypotheses"));
}

- (BOOL)performAgendaEntryEqualityChecksInTravelEngine
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("performAgendaEntryEqualityChecksInTravelEngine"), 1);
}

- (void)setPerformAgendaEntryEqualityChecksInTravelEngine:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("performAgendaEntryEqualityChecksInTravelEngine"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.performAgendaEntryEqualityChecksInTravelEngine"));
}

- (BOOL)verifyIntegrityOfAvailabilityTimeSearchTimelines
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("verifyIntegrityOfAvailabilityTimeSearchTimelines"), 0);
}

- (void)setVerifyIntegrityOfAvailabilityTimeSearchTimelines:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("verifyIntegrityOfAvailabilityTimeSearchTimelines"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.verifyIntegrityOfAvailabilityTimeSearchTimelines"));
}

- (BOOL)showDepartureDateForTransitTimeToLeave
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("showDepartureDateForTransitTimeToLeave"), 1);
}

- (void)setShowDepartureDateForTransitTimeToLeave:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("showDepartureDateForTransitTimeToLeave"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.showDepartureDateForTransitTimeToLeave"));
}

- (BOOL)shouldBypassTravelEngineThrottle
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("shouldBypassTravelEngineThrottle"), 0);
}

- (void)setShouldBypassTravelEngineThrottle:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("shouldBypassTravelEngineThrottle"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.shouldBypassTravelEngineThrottle"));
}

- (BOOL)syntheticTravelAdvisoriesEnabled
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("syntheticTravelAdvisoriesEnabled"), 0);
}

- (void)setSyntheticTravelAdvisoriesEnabled:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("syntheticTravelAdvisoriesEnabled"), a3, CFSTR("com.apple.eventkit.debug.preference.notification.syntheticTravelAdvisoriesEnabled"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

- (void)setAvailabilityFreshnessWindow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Will not set an availability freshness window of less than 0.  Given value: [%f]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setOverriddenTravelAdvisoryHypothesisConservativeTravelTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Will not set an overridden travel advisory hypothesis conservative travel time of less than 0.  Given value: [%f]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setOverriddenTravelAdvisoryHypothesisEstimatedTravelTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Will not set an overridden travel advisory hypothesis estimated travel time of less than 0.  Given value: [%f]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setOverriddenTravelAdvisoryHypothesisAggressiveTravelTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Will not set an overridden travel advisory hypothesis aggressive travel time of less than 0.  Given value: [%f]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
