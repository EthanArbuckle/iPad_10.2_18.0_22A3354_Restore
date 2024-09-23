@implementation DMFDevice

- (id)initPrivate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMFDevice;
  return -[DMFDevice init](&v3, sel_init);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  NSString *v7;
  SEL v8;
  objc_super v9;
  objc_super v10;

  v6 = a3;
  +[DMFDevice propertyNameForKey:](DMFDevice, "propertyNameForKey:", a4);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = NSSelectorFromString(v7);
  v10.receiver = self;
  v10.super_class = (Class)DMFDevice;
  if (-[DMFDevice respondsToSelector:](&v10, sel_respondsToSelector_, v8))
  {
    v9.receiver = self;
    v9.super_class = (Class)DMFDevice;
    -[DMFDevice setValue:forKey:](&v9, sel_setValue_forKey_, v6, v7);
  }

}

- (id)valueForUndefinedKey:(id)a3
{
  NSString *v4;
  void *v5;
  objc_super v7;

  +[DMFDevice propertyNameForKey:](DMFDevice, "propertyNameForKey:", a3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSSelectorFromString(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)DMFDevice;
    -[DMFDevice valueForKey:](&v7, sel_valueForKey_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)propertyNameForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  if (propertyNameForKey__onceToken != -1)
    dispatch_once(&propertyNameForKey__onceToken, &__block_literal_global_3);
  objc_msgSend((id)propertyNameForKey__mappedKeys, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "_sanitizedDeviceKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

void __32__DMFDevice_propertyNameForKey___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[18];
  _QWORD v3[19];

  v3[18] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("DMFDeviceBluetoothMACKey");
  v2[1] = CFSTR("DMFDeviceNameKey");
  v3[0] = CFSTR("bluetoothAddress");
  v3[1] = CFSTR("deviceName");
  v2[2] = CFSTR("DMFDeviceTypeKey");
  v2[3] = CFSTR("DMFDeviceAwaitingConfigurationKey");
  v3[2] = CFSTR("deviceType");
  v3[3] = CFSTR("isAwaitingConfiguration");
  v2[4] = CFSTR("DMFDeviceIsDNDInEffectKey");
  v2[5] = CFSTR("DMFDeviceOSVersionKey");
  v3[4] = CFSTR("isDoNotDisturbInEffect");
  v3[5] = CFSTR("osVersion");
  v2[6] = CFSTR("DMFDeviceWiFiMACKey");
  v2[7] = CFSTR("DMFDeviceAppAnalyticsEnabledKey");
  v3[6] = CFSTR("wifiAddress");
  v3[7] = CFSTR("isAppAnalyticsEnabled");
  v2[8] = CFSTR("DMFDeviceDiagnosticSubmissionEnabledKey");
  v2[9] = CFSTR("DMFDeviceEASIdentifierKey");
  v3[8] = CFSTR("isDiagnosticSubmissionEnabled");
  v3[9] = CFSTR("EASIdentifier");
  v2[10] = CFSTR("DMFDeviceICCIDKey");
  v2[11] = CFSTR("DMFDeviceIMEIKey");
  v3[10] = CFSTR("ICCID");
  v3[11] = CFSTR("IMEI");
  v2[12] = CFSTR("DMFDeviceMEIDKey");
  v2[13] = CFSTR("DMFDeviceDataRoamingEnabledKey");
  v3[12] = CFSTR("MEID");
  v3[13] = CFSTR("isDataRoamingEnabled");
  v2[14] = CFSTR("DMFDevicePersonalHotspotEnabledKey");
  v2[15] = CFSTR("DMFDeviceVoiceRoamingEnabledKey");
  v3[14] = CFSTR("isPersonalHotspotEnabled");
  v3[15] = CFSTR("isVoiceRoamingEnabled");
  v2[16] = CFSTR("DMFDeviceSystemIntegrityProtectionEnabledKey");
  v2[17] = CFSTR("DMFDeviceOSUpdateSettingsKey");
  v3[16] = CFSTR("isSystemIntegrityProtectionEnabled");
  v3[17] = CFSTR("osUpdateSettings");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertyNameForKey__mappedKeys;
  propertyNameForKey__mappedKeys = v0;

}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  NSString *v6;
  uint64_t v7;
  NSString *v8;
  SEL v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  id *v15;

  v6 = (NSString *)a3;
  v15 = a4;
  NSSelectorFromString(v6);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    +[DMFDevice propertyNameForKey:](DMFDevice, "propertyNameForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (NSString *)v7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@WithError:"), v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = NSSelectorFromString(v8);

  NSSelectorFromString(v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[DMFDevice methodSignatureForSelector:](self, "methodSignatureForSelector:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTarget:", self);
    objc_msgSend(v11, "setSelector:", v9);
    objc_msgSend(v11, "setArgument:atIndex:", &v15, 2);
    objc_msgSend(v11, "invoke");
    v14 = 0;
    objc_msgSend(v11, "getReturnValue:", &v14);
    v12 = v14;

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[DMFDevice valueForKey:](self, "valueForKey:", v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    DMFErrorWithCodeAndUserInfo();
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_sanitizedDeviceKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("^DMFDevice(.*)Key$"), CFSTR("$1"), 1024, 0, objc_msgSend(v3, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "substringToIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)availableCapacity
{
  return self->_availableCapacity;
}

- (NSNumber)batteryLevel
{
  return self->_batteryLevel;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSNumber)capacity
{
  return self->_capacity;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSNumber)deviceType
{
  return self->_deviceType;
}

- (NSNumber)isAppleInternal
{
  return self->_isAppleInternal;
}

- (NSNumber)isAwaitingConfiguration
{
  return self->_isAwaitingConfiguration;
}

- (NSNumber)isDeviceLocatorServiceEnabled
{
  return self->_isDeviceLocatorServiceEnabled;
}

- (NSNumber)isDoNotDisturbInEffect
{
  return self->_isDoNotDisturbInEffect;
}

- (NSNumber)isInSingleAppMode
{
  return self->_isInSingleAppMode;
}

- (NSNumber)isLostModeEnabled
{
  return self->_isLostModeEnabled;
}

- (NSString)iTunesStoreAccountHash
{
  return self->_iTunesStoreAccountHash;
}

- (NSNumber)iTunesStoreAccountIsActive
{
  return self->_iTunesStoreAccountIsActive;
}

- (NSString)marketingName
{
  return self->_marketingName;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)wifiAddress
{
  return self->_wifiAddress;
}

- (NSNumber)isAppAnalyticsEnabled
{
  return self->_isAppAnalyticsEnabled;
}

- (NSNumber)isCloudBackupEnabled
{
  return self->_isCloudBackupEnabled;
}

- (NSNumber)isDiagnosticSubmissionEnabled
{
  return self->_isDiagnosticSubmissionEnabled;
}

- (NSNumber)isSupervised
{
  return self->_isSupervised;
}

- (NSDate)lastCloudBackupDate
{
  return self->_lastCloudBackupDate;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)carrierSettingsVersion
{
  return self->_carrierSettingsVersion;
}

- (NSNumber)cellularTechnology
{
  return self->_cellularTechnology;
}

- (NSString)currentCarrierNetwork
{
  return self->_currentCarrierNetwork;
}

- (NSString)currentMCC
{
  return self->_currentMCC;
}

- (NSString)currentMNC
{
  return self->_currentMNC;
}

- (NSString)EASIdentifier
{
  return self->_EASIdentifier;
}

- (NSNumber)enforcedSoftwareUpdateDelay
{
  return self->_enforcedSoftwareUpdateDelay;
}

- (NSString)ICCID
{
  return self->_ICCID;
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (NSNumber)isActivationLockEnabled
{
  return self->_isActivationLockEnabled;
}

- (NSNumber)isDataRoamingEnabled
{
  return self->_isDataRoamingEnabled;
}

- (NSNumber)isEphemeralMultiUser
{
  return self->_isEphemeralMultiUser;
}

- (NSNumber)isNetworkTethered
{
  return self->_isNetworkTethered;
}

- (NSNumber)isPersonalHotspotEnabled
{
  return self->_isPersonalHotspotEnabled;
}

- (NSNumber)isRoaming
{
  return self->_isRoaming;
}

- (NSNumber)isVoiceRoamingEnabled
{
  return self->_isVoiceRoamingEnabled;
}

- (NSNumber)maximumResidentUsers
{
  return self->_maximumResidentUsers;
}

- (NSString)MEID
{
  return self->_MEID;
}

- (NSString)modemFirmwareVersion
{
  return self->_modemFirmwareVersion;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSDictionary)serviceSubscriptions
{
  return self->_serviceSubscriptions;
}

- (NSArray)skippedSetupPanes
{
  return self->_skippedSetupPanes;
}

- (NSString)subscriberCarrierNetwork
{
  return self->_subscriberCarrierNetwork;
}

- (NSString)subscriberMCC
{
  return self->_subscriberMCC;
}

- (NSString)subscriberMNC
{
  return self->_subscriberMNC;
}

- (NSArray)activeManagedUsers
{
  return self->_activeManagedUsers;
}

- (NSArray)autoSetupAdminAccounts
{
  return self->_autoSetupAdminAccounts;
}

- (NSString)hostName
{
  return self->_hostName;
}

- (NSDictionary)installedExtensions
{
  return self->_installedExtensions;
}

- (NSNumber)isSystemIntegrityProtectionEnabled
{
  return self->_isSystemIntegrityProtectionEnabled;
}

- (NSString)localHostName
{
  return self->_localHostName;
}

- (NSDictionary)osUpdateSettings
{
  return self->_osUpdateSettings;
}

- (NSDictionary)xsanConfiguration
{
  return self->_xsanConfiguration;
}

- (NSString)destinationIdentifier
{
  return self->_destinationIdentifier;
}

- (NSDictionary)errorsForKeys
{
  return self->_errorsForKeys;
}

- (void)setErrorsForKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsForKeys, 0);
  objc_storeStrong((id *)&self->_destinationIdentifier, 0);
  objc_storeStrong((id *)&self->_xsanConfiguration, 0);
  objc_storeStrong((id *)&self->_osUpdateSettings, 0);
  objc_storeStrong((id *)&self->_localHostName, 0);
  objc_storeStrong((id *)&self->_isSystemIntegrityProtectionEnabled, 0);
  objc_storeStrong((id *)&self->_installedExtensions, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_autoSetupAdminAccounts, 0);
  objc_storeStrong((id *)&self->_activeManagedUsers, 0);
  objc_storeStrong((id *)&self->_subscriberMNC, 0);
  objc_storeStrong((id *)&self->_subscriberMCC, 0);
  objc_storeStrong((id *)&self->_subscriberCarrierNetwork, 0);
  objc_storeStrong((id *)&self->_skippedSetupPanes, 0);
  objc_storeStrong((id *)&self->_serviceSubscriptions, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_modemFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_MEID, 0);
  objc_storeStrong((id *)&self->_maximumResidentUsers, 0);
  objc_storeStrong((id *)&self->_isVoiceRoamingEnabled, 0);
  objc_storeStrong((id *)&self->_isRoaming, 0);
  objc_storeStrong((id *)&self->_isPersonalHotspotEnabled, 0);
  objc_storeStrong((id *)&self->_isNetworkTethered, 0);
  objc_storeStrong((id *)&self->_isEphemeralMultiUser, 0);
  objc_storeStrong((id *)&self->_isDataRoamingEnabled, 0);
  objc_storeStrong((id *)&self->_isActivationLockEnabled, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_ICCID, 0);
  objc_storeStrong((id *)&self->_enforcedSoftwareUpdateDelay, 0);
  objc_storeStrong((id *)&self->_EASIdentifier, 0);
  objc_storeStrong((id *)&self->_currentMNC, 0);
  objc_storeStrong((id *)&self->_currentMCC, 0);
  objc_storeStrong((id *)&self->_currentCarrierNetwork, 0);
  objc_storeStrong((id *)&self->_cellularTechnology, 0);
  objc_storeStrong((id *)&self->_carrierSettingsVersion, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_lastCloudBackupDate, 0);
  objc_storeStrong((id *)&self->_isSupervised, 0);
  objc_storeStrong((id *)&self->_isDiagnosticSubmissionEnabled, 0);
  objc_storeStrong((id *)&self->_isCloudBackupEnabled, 0);
  objc_storeStrong((id *)&self->_isAppAnalyticsEnabled, 0);
  objc_storeStrong((id *)&self->_wifiAddress, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_marketingName, 0);
  objc_storeStrong((id *)&self->_iTunesStoreAccountIsActive, 0);
  objc_storeStrong((id *)&self->_iTunesStoreAccountHash, 0);
  objc_storeStrong((id *)&self->_isLostModeEnabled, 0);
  objc_storeStrong((id *)&self->_isInSingleAppMode, 0);
  objc_storeStrong((id *)&self->_isDoNotDisturbInEffect, 0);
  objc_storeStrong((id *)&self->_isDeviceLocatorServiceEnabled, 0);
  objc_storeStrong((id *)&self->_isAwaitingConfiguration, 0);
  objc_storeStrong((id *)&self->_isAppleInternal, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_capacity, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_batteryLevel, 0);
  objc_storeStrong((id *)&self->_availableCapacity, 0);
}

@end
