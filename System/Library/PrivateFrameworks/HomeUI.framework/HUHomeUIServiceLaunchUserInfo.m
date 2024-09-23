@implementation HUHomeUIServiceLaunchUserInfo

+ (BOOL)isInSetupContext:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

+ (id)userInfoForResumeAccessorySetupInHome:(id)a3 accessoryUUIDs:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v11[0] = HUHomeUIServiceLaunchReasonValueResumeSetup;
  v10[0] = HUHomeUIServiceLaunchReasonKey;
  v10[1] = HUHomeUIServiceLaunchHomeUUIDString;
  v5 = a4;
  objc_msgSend(a3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = HUHomeUIServiceLaunchAccessoryUUIDsArray;
  v11[1] = v7;
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)userInfoForSafetyAndSecurityInHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = HUHomeUIServiceLaunchReasonKey;
  v7[1] = HUHomeUIServiceLaunchHomeUUIDString;
  v8[0] = HUHomeUIServiceLaunchReasonValueSafetyAndSecurity;
  objc_msgSend(a3, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)userInfoForSiriEndpointInHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = HUHomeUIServiceLaunchReasonKey;
  v7[1] = HUHomeUIServiceLaunchHomeUUIDString;
  v8[0] = HUHomeUIServiceLaunchReasonValueSiriEndpoint;
  objc_msgSend(a3, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)userInfoForLockAccessFirmwareUpgradeSetupInHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = HUHomeUIServiceLaunchReasonKey;
  v7[1] = HUHomeUIServiceLaunchHomeUUIDString;
  v8[0] = HUHomeUIServiceLaunchReasonValueLockAccessFirmwareUpdate;
  objc_msgSend(a3, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)userInfoForLockAccessWalletKeySetupInHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = HUHomeUIServiceLaunchReasonKey;
  v7[1] = HUHomeUIServiceLaunchHomeUUIDString;
  v8[0] = HUHomeUIServiceLaunchReasonValueLockAccessUserOnboardingAll;
  objc_msgSend(a3, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)userInfoForLockAccessPinCodeSetupInHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = HUHomeUIServiceLaunchReasonKey;
  v7[1] = HUHomeUIServiceLaunchHomeUUIDString;
  v8[0] = HUHomeUIServiceLaunchReasonValueLockAccessUserOnboardingPinCodeOnly;
  objc_msgSend(a3, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)userInfoForUpgradeOfferResults:(id)a3
{
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = HUHomeUIServiceLaunchReasonKey;
  v5[0] = HUHomeUIServiceLaunchReasonValueCameraUpgradeOffer;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)launchReasonFromUserInfo:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", HUHomeUIServiceLaunchReasonKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", HUHomeUIServiceLaunchReasonValueResumeSetup) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", HUHomeUIServiceLaunchReasonValueSafetyAndSecurity) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", HUHomeUIServiceLaunchReasonValueSiriEndpoint) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", HUHomeUIServiceLaunchReasonValueLockAccessFirmwareUpdate) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", HUHomeUIServiceLaunchReasonValueLockAccessUserOnboardingAll) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", HUHomeUIServiceLaunchReasonValueLockAccessUserOnboardingPinCodeOnly) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", HUHomeUIServiceLaunchReasonValueCameraUpgradeOffer))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)launchReasonDescription:(int64_t)a3
{
  void *v3;
  id result;

  switch(a3)
  {
    case 0:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueAddAccessory;
      goto LABEL_11;
    case 1:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueResumeSetup;
      goto LABEL_11;
    case 2:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueSafetyAndSecurity;
      goto LABEL_11;
    case 3:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueSiriEndpoint;
      goto LABEL_11;
    case 4:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueLockAccessFirmwareUpdate;
      goto LABEL_11;
    case 5:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueLockAccessUserOnboardingAll;
      goto LABEL_11;
    case 6:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueLockAccessUserOnboardingPinCodeOnly;
      goto LABEL_11;
    case 7:
      v3 = (void *)HUHomeUIServiceLaunchReasonValueCameraUpgradeOffer;
LABEL_11:
      result = v3;
      break;
    case 8:
      result = CFSTR("HUHomeUIServiceLaunchReasonValueMax");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

@end
