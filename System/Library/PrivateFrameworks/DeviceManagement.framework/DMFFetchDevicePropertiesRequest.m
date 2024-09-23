@implementation DMFFetchDevicePropertiesRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1E6EF4928;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchDevicePropertiesRequest)initWithCoder:(id)a3
{
  id v4;
  DMFFetchDevicePropertiesRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *propertyKeys;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMFFetchDevicePropertiesRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("propertyKeys"));
    v9 = objc_claimAutoreleasedReturnValue();
    propertyKeys = v5->_propertyKeys;
    v5->_propertyKeys = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchDevicePropertiesRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFFetchDevicePropertiesRequest propertyKeys](self, "propertyKeys", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("propertyKeys"));

}

+ (NSSet)currentDevicePropertyKeys
{
  return (NSSet *)objc_msgSend(a1, "devicePropertyKeysForPlatform:", 1);
}

+ (id)devicePropertyKeysForPlatform:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (devicePropertyKeysForPlatform__onceToken != -1)
    dispatch_once(&devicePropertyKeysForPlatform__onceToken, &__block_literal_global_8);
  v4 = (void *)devicePropertyKeysForPlatform__keysByPlatform;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __65__DMFFetchDevicePropertiesRequest_devicePropertyKeysForPlatform___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[2];
  _QWORD v26[8];
  _QWORD v27[25];
  _QWORD v28[6];
  _QWORD v29[22];

  v29[21] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v29[0] = CFSTR("DMFDeviceAvailableCapacityKey");
  v29[1] = CFSTR("DMFDeviceAwaitingConfigurationKey");
  v29[2] = CFSTR("DMFDeviceBatteryLevelKey");
  v29[3] = CFSTR("DMFDeviceBluetoothMACKey");
  v29[4] = CFSTR("DMFDeviceBuildVersionKey");
  v29[5] = CFSTR("DMFDeviceCapacityKey");
  v29[6] = CFSTR("DMFDeviceiTunesStoreAccountHashKey");
  v29[7] = CFSTR("DMFDeviceiTunesStoreAccountIsActiveKey");
  v29[8] = CFSTR("DMFDeviceIsAppleInternalKey");
  v29[9] = CFSTR("DMFDeviceIsDeviceLocatorServiceEnabledKey");
  v29[10] = CFSTR("DMFDeviceIsDNDInEffectKey");
  v29[11] = CFSTR("DMFDeviceIsLostModeEnabledKey");
  v29[12] = CFSTR("DMFDeviceMarketingNameKey");
  v29[13] = CFSTR("DMFDeviceModelKey");
  v29[14] = CFSTR("DMFDeviceModelNameKey");
  v29[15] = CFSTR("DMFDeviceNameKey");
  v29[16] = CFSTR("DMFDeviceOSVersionKey");
  v29[17] = CFSTR("DMFDeviceProductNameKey");
  v29[18] = CFSTR("DMFDeviceSerialNumberKey");
  v29[19] = CFSTR("DMFDeviceTypeKey");
  v29[20] = CFSTR("DMFDeviceWiFiMACKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 21);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0C99E60];
  v28[0] = CFSTR("DMFDeviceAppAnalyticsEnabledKey");
  v28[1] = CFSTR("DMFDeviceDiagnosticSubmissionEnabledKey");
  v28[2] = CFSTR("DMFDeviceIsCloudBackupEnabledKey");
  v28[3] = CFSTR("DMFDeviceIsSupervisedKey");
  v28[4] = CFSTR("DMFDeviceLastCloudBackupDateKey");
  v28[5] = CFSTR("DMFDeviceUniqueIdentifierKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = CFSTR("DMFDeviceCarrierSettingsVersionKey");
  v27[1] = CFSTR("DMFDeviceCellularTechnologyKey");
  v27[2] = CFSTR("DMFDeviceCurrentCarrierNetworkKey");
  v27[3] = CFSTR("DMFDeviceCurrentMCCKey");
  v27[4] = CFSTR("DMFDeviceCurrentMNCKey");
  v27[5] = CFSTR("DMFDeviceDataRoamingEnabledKey");
  v27[6] = CFSTR("DMFDeviceEnforcedSoftwareUpdateDelayKey");
  v27[7] = CFSTR("DMFDeviceIsActivationLockEnabledKey");
  v27[8] = CFSTR("DMFDeviceEASIdentifierKey");
  v27[9] = CFSTR("DMFDeviceICCIDKey");
  v27[10] = CFSTR("DMFDeviceIMEIKey");
  v27[11] = CFSTR("DMFDeviceIsEphemeralMultiUserKey");
  v27[12] = CFSTR("DMFDeviceIsNetworkTetheredKey");
  v27[13] = CFSTR("DMFDeviceIsRoamingKey");
  v27[14] = CFSTR("DMFDeviceMaximumResidentUsersKey");
  v27[15] = CFSTR("DMFDeviceMEIDKey");
  v27[16] = CFSTR("DMFDeviceModemFirmwareVersionKey");
  v27[17] = CFSTR("DMFDevicePersonalHotspotEnabledKey");
  v27[18] = CFSTR("DMFDevicePhoneNumberKey");
  v27[19] = CFSTR("DMFDeviceSkippedSetupPanesKey");
  v27[20] = CFSTR("DMFDeviceSubscriberCarrierNetworkKey");
  v27[21] = CFSTR("DMFDeviceSubscriberMCCKey");
  v27[22] = CFSTR("DMFDeviceSubscriberMNCKey");
  v27[23] = CFSTR("DMFDeviceVoiceRoamingEnabledKey");
  v27[24] = CFSTR("DMFDeviceServiceSubscriptionsKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = CFSTR("DMFDeviceActiveManagedUsersKey");
  v26[1] = CFSTR("DMFDeviceAutoSetupAdminAccountsKey");
  v26[2] = CFSTR("DMFDeviceHostNameKey");
  v26[3] = CFSTR("DMFDeviceInstalledExtensionsKey");
  v26[4] = CFSTR("DMFDeviceLocalHostNameKey");
  v26[5] = CFSTR("DMFDeviceOSUpdateSettingsKey");
  v26[6] = CFSTR("DMFDeviceSystemIntegrityProtectionEnabledKey");
  v26[7] = CFSTR("DMFDeviceXsanConfigurationKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = CFSTR("DMFDeviceDestinationIdentifierKey");
  v25[1] = CFSTR("DMFDeviceDestinationIdentifierKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", MEMORY[0x1E0C9AA60]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = &unk_1E6EF3228;
  v23[1] = &unk_1E6EF3240;
  v24[0] = v10;
  v24[1] = v14;
  v23[2] = &unk_1E6EF3270;
  v23[3] = &unk_1E6EF3258;
  v24[2] = v18;
  v24[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)devicePropertyKeysForPlatform__keysByPlatform;
  devicePropertyKeysForPlatform__keysByPlatform = v21;

}

- (NSArray)propertyKeys
{
  return self->_propertyKeys;
}

- (void)setPropertyKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyKeys, 0);
}

@end
