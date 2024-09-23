@implementation HKEntitlements

void __67___HKEntitlements__containerAppExtensionEntitlementsForCurrentTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    v7 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
      __67___HKEntitlements__containerAppExtensionEntitlementsForCurrentTask__block_invoke_cold_1((uint64_t)v6, v7);
  }
  v8 = objc_msgSend(v5, "copy");
  v9 = (void *)_containerAppExtensionEntitlementsForCurrentTask_currentTaskEntitlements;
  _containerAppExtensionEntitlementsForCurrentTask_currentTaskEntitlements = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42___HKEntitlements__allowedEntitlementsSet__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[49];

  v4[48] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = CFSTR("com.apple.private.healthkit.analytics-agreements.control");
  v4[1] = CFSTR("com.apple.private.healthkit.os_version");
  v4[2] = CFSTR("application-identifier");
  v4[3] = CFSTR("com.apple.private.healthkit.authorization_bypass");
  v4[4] = CFSTR("com.apple.private.healthkit.authorization_manager");
  v4[5] = CFSTR("com.apple.private.healthkit.background-workout-start");
  v4[6] = CFSTR("com.apple.private.healthkit.contributor");
  v4[7] = CFSTR("com.apple.private.healthkit.hkctl");
  v4[8] = CFSTR("com.apple.private.healthkit.source.default");
  v4[9] = CFSTR("com.apple.private.healthkit.feature-availability.read");
  v4[10] = CFSTR("com.apple.private.healthkit.feature-availability.read-any");
  v4[11] = CFSTR("com.apple.private.healthkit.feature-availability.read-write");
  v4[12] = CFSTR("com.apple.private.healthkit.feature-availability.read-write-any");
  v4[13] = CFSTR("com.apple.private.healthkit.health-app-source");
  v4[14] = CFSTR("com.apple.developer.healthkit.access");
  v4[15] = CFSTR("com.apple.developer.healthkit");
  v4[16] = CFSTR("com.apple.developer.healthkit.background-delivery");
  v4[17] = CFSTR("com.apple.developer.healthkit.recalibrate-estimates");
  v4[18] = CFSTR("com.apple.private.healthkit.healthlite");
  v4[19] = CFSTR("com.apple.private.healthkit.healthrecords.account-info");
  v4[20] = CFSTR("com.apple.private.healthkit.heartbeat-series-feature-status.read-only");
  v4[21] = CFSTR("com.apple.private.healthkit.key-value.protected-local.read-write");
  v4[22] = CFSTR("com.apple.private.healthkit.key-value.protected-ubiquitous.read-write");
  v4[23] = CFSTR("com.apple.private.healthkit.key-value.ubiquitous.read-write");
  v4[24] = CFSTR("com.apple.private.healthkit.source_override");
  v4[25] = CFSTR("com.apple.private.healthkit.local-device-source");
  v4[26] = CFSTR("com.apple.private.healthkit.medicaliddata");
  v4[27] = CFSTR("com.apple.private.healthkit.medication-doseEvent.read-write");
  v4[28] = CFSTR("com.apple.private.healthkit.menstrual-cycles-diagnostics");
  v4[29] = CFSTR("com.apple.private.healthkit.mobility-walking-steadiness-feature-status.read-only");
  v4[30] = CFSTR("com.apple.developer.healthkit.nikefuel-source");
  v4[31] = CFSTR("com.apple.private.healthkit.notification-sync.read-write");
  v4[32] = CFSTR("com.apple.private.healthkit.obliteration");
  v4[33] = CFSTR("com.apple.private.healthkit.preferred_source");
  v4[34] = CFSTR("com.apple.private.healthkit.attachments");
  v4[35] = CFSTR("com.apple.private.healthkit.access");
  v4[36] = CFSTR("com.apple.private.healthkit");
  v4[37] = CFSTR("com.apple.private.healthkit.metadata.private");
  v4[38] = CFSTR("com.apple.private.healthkit.sync");
  v4[39] = CFSTR("com.apple.private.healthkit.read_authorization_bypass");
  v4[40] = CFSTR("com.apple.private.healthkit.read_authorization_override");
  v4[41] = CFSTR("com.apple.private.healthkit.source.research-study");
  v4[42] = CFSTR("com.apple.private.healthkit.skip-insertion-filter");
  v4[43] = CFSTR("com.apple.private.healthkit.source.creation");
  v4[44] = CFSTR("com.apple.private.healthkit.source.identities");
  v4[45] = CFSTR("com.apple.private.healthkit.source.owner");
  v4[46] = CFSTR("com.apple.private.healthkit.write_authorization_override");
  v4[47] = CFSTR("com.apple.private.healthkit.database-accessibility-assertion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 48);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)_allowedEntitlementsSet_entitlementKeySet;
  _allowedEntitlementsSet_entitlementKeySet = v2;

}

void __67___HKEntitlements__containerAppExtensionEntitlementsForCurrentTask__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "fetchContainerAppExtensionEntitlementsWithCompletion: failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
