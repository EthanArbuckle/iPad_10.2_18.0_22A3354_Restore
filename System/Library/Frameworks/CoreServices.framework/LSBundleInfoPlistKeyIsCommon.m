@implementation LSBundleInfoPlistKeyIsCommon

void ___LSBundleInfoPlistKeyIsCommon_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[9];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0C9AAD0];
  v12[0] = *MEMORY[0x1E0C9AB38];
  v12[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_LSBundleInfoPlistKeyIsCommon::explicitlyIgnoredKeys;
  _LSBundleInfoPlistKeyIsCommon::explicitlyIgnoredKeys = v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E10759C8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_LSBundleInfoPlistKeyIsCommon::prefixes;
  _LSBundleInfoPlistKeyIsCommon::prefixes = v5;

  v7 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = CFSTR("Capabilities");
  v11[1] = CFSTR("DeviceFamily");
  v11[2] = CFSTR("ProductType");
  v11[3] = CFSTR("disabled");
  v11[4] = CFSTR("MallocBehavior");
  v11[5] = CFSTR("AVInitialRouteSharingPolicy");
  v11[6] = CFSTR("LSEligibilityInstallPredicate");
  v11[7] = CFSTR("LSEligibilityUninstallPredicate");
  v11[8] = CFSTR("LSRequiredFeatureFlags");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_LSBundleInfoPlistKeyIsCommon::explicitlyIncludedKeys;
  _LSBundleInfoPlistKeyIsCommon::explicitlyIncludedKeys = v9;

}

@end
