@implementation CRKDevice

+ (NSDictionary)keyTranslations
{
  if (keyTranslations_onceToken != -1)
    dispatch_once(&keyTranslations_onceToken, &__block_literal_global_28);
  return (NSDictionary *)(id)keyTranslations_translations;
}

void __42__CRKDevice_Translations__keyTranslations__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[12];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[34];

  v39[33] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE2C660];
  v17[0] = *MEMORY[0x24BE2C578];
  v17[1] = v0;
  v39[0] = CFSTR("identifier");
  v39[1] = CFSTR("serialNumber");
  v1 = *MEMORY[0x24BE2C5F0];
  v17[2] = *MEMORY[0x24BE2C630];
  v17[3] = v1;
  v39[2] = CFSTR("platform");
  v39[3] = CFSTR("model");
  v2 = *MEMORY[0x24BE2C6B0];
  v17[4] = *MEMORY[0x24BE2C608];
  v17[5] = v2;
  v39[4] = CFSTR("name");
  v39[5] = CFSTR("systemName");
  v3 = *MEMORY[0x24BE2C500];
  v17[6] = *MEMORY[0x24BE2C6B8];
  v17[7] = v3;
  v39[6] = CFSTR("systemVersion");
  v39[7] = CFSTR("buildVersion");
  v4 = *MEMORY[0x24BE2C5A8];
  v17[8] = *MEMORY[0x24BE2C5C8];
  v17[9] = v4;
  v39[8] = CFSTR("supervised");
  v39[9] = CFSTR("ephemeralMultiUser");
  v5 = *MEMORY[0x24BE2C520];
  v17[10] = *MEMORY[0x24BE2C4F0];
  v17[11] = v5;
  v39[10] = CFSTR("batteryLevel");
  v39[11] = CFSTR("chargingState");
  v6 = *MEMORY[0x24BE2C650];
  v18 = *MEMORY[0x24BE2C5D8];
  v19 = v6;
  v39[12] = CFSTR("lockState");
  v39[13] = CFSTR("screenState");
  v7 = *MEMORY[0x24BE2C4D8];
  v20 = *MEMORY[0x24BE2C700];
  v21 = v7;
  v39[14] = CFSTR("volume");
  v39[15] = CFSTR("availableBytes");
  v8 = *MEMORY[0x24BE2C580];
  v22 = *MEMORY[0x24BE2C548];
  v23 = v8;
  v39[16] = CFSTR("deviceOrientation");
  v39[17] = CFSTR("interfaceOrientation");
  v9 = *MEMORY[0x24BE2C658];
  v24 = *MEMORY[0x24BE2C638];
  v25 = v9;
  v39[18] = CFSTR("primaryOpenApplication");
  v39[19] = CFSTR("secondaryOpenApplication");
  v10 = *MEMORY[0x24BE2C6E0];
  v26 = v18;
  v27 = v10;
  v39[20] = CFSTR("lockState");
  v39[21] = CFSTR("userIdentifier");
  v11 = *MEMORY[0x24BE2C6D8];
  v28 = *MEMORY[0x24BE2C6C8];
  v29 = v11;
  v39[22] = CFSTR("userDisplayName");
  v39[23] = CFSTR("userGivenName");
  v12 = *MEMORY[0x24BE2C6E8];
  v30 = *MEMORY[0x24BE2C6D0];
  v31 = v12;
  v39[24] = CFSTR("userFamilyName");
  v39[25] = CFSTR("userImageURL");
  v13 = *MEMORY[0x24BE2C618];
  v32 = *MEMORY[0x24BE2C6F0];
  v33 = v13;
  v39[26] = CFSTR("loginState");
  v39[27] = CFSTR("passcodeEnabled");
  v14 = *MEMORY[0x24BE2C4D0];
  v34 = *MEMORY[0x24BE2C4C0];
  v35 = v14;
  v39[28] = CFSTR("activeAirPlayRoute");
  v39[29] = CFSTR("availableAirPlayRoutes");
  v36 = *MEMORY[0x24BE2C5E8];
  v37 = v11;
  v39[30] = CFSTR("managementLockPasscode");
  v39[31] = CFSTR("userGivenName");
  v38 = v30;
  v39[32] = CFSTR("userFamilyName");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v17, 33);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)keyTranslations_translations;
  keyTranslations_translations = v15;

}

+ (id)CRKKeyForDMFKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[CRKDevice keyTranslations](CRKDevice, "keyTranslations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)allPropertyKeys
{
  _QWORD v3[53];

  v3[52] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("identifier");
  v3[1] = CFSTR("serialNumber");
  v3[2] = CFSTR("trustedExchangeIdentifier");
  v3[3] = CFSTR("platform");
  v3[4] = CFSTR("model");
  v3[5] = CFSTR("name");
  v3[6] = CFSTR("systemName");
  v3[7] = CFSTR("systemVersion");
  v3[8] = CFSTR("buildVersion");
  v3[9] = CFSTR("supervised");
  v3[10] = CFSTR("ephemeralMultiUser");
  v3[11] = CFSTR("batteryLevel");
  v3[12] = CFSTR("chargingState");
  v3[13] = CFSTR("lockState");
  v3[14] = CFSTR("screenState");
  v3[15] = CFSTR("screenSaverActive");
  v3[16] = CFSTR("volume");
  v3[17] = CFSTR("muted");
  v3[18] = CFSTR("availableBytes");
  v3[19] = CFSTR("deviceOrientation");
  v3[20] = CFSTR("interfaceOrientation");
  v3[21] = CFSTR("displays");
  v3[22] = CFSTR("displayBackingScaleFactor");
  v3[23] = CFSTR("displayHeight");
  v3[24] = CFSTR("displayWidth");
  v3[25] = CFSTR("primaryOpenApplication");
  v3[26] = CFSTR("secondaryOpenApplication");
  v3[27] = CFSTR("allOpenApplications");
  v3[28] = CFSTR("appLocked");
  v3[29] = CFSTR("installedApplications");
  v3[30] = CFSTR("installedApplicationInfo");
  v3[31] = CFSTR("userIdentifier");
  v3[32] = CFSTR("userDisplayName");
  v3[33] = CFSTR("userGivenName");
  v3[34] = CFSTR("userFamilyName");
  v3[35] = CFSTR("userImageURL");
  v3[36] = CFSTR("loginState");
  v3[37] = CFSTR("passcodeEnabled");
  v3[38] = CFSTR("studentImageIdentifier");
  v3[39] = CFSTR("instructorImageIdentifier");
  v3[40] = CFSTR("activeAirPlayRoute");
  v3[41] = CFSTR("availableAirPlayRoutes");
  v3[42] = CFSTR("managementLockPasscode");
  v3[43] = CFSTR("stagedAdHocIdentityCertificateFingerprint");
  v3[44] = CFSTR("trustedAnchorCertificateFingerprints");
  v3[45] = CFSTR("userPhoneticGivenName");
  v3[46] = CFSTR("userPhoneticFamilyName");
  v3[47] = CFSTR("studentImageIdentifier");
  v3[48] = CFSTR("instructorImageIdentifier");
  v3[49] = CFSTR("requestingUnenroll");
  v3[50] = CFSTR("currentLocaleIdentifier");
  v3[51] = CFSTR("lowBattery");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 52);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)installedApplications
{
  void *v2;
  void *v3;

  -[CRKDevice installedApplicationInfo](self, "installedApplicationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKApplicationInfo bundleIdentifiersFromDictionaryRepresentations:](CRKApplicationInfo, "bundleIdentifiersFromDictionaryRepresentations:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setInstalledApplications:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "applicationInfoFromBundleIdentifiers:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CRKDevice setInstalledApplicationInfo:](self, "setInstalledApplicationInfo:", v5);
}

- (BOOL)isApplicationOpen:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CRKDevice allOpenApplications](self, "allOpenApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)isApplicationInstalled:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CRKDevice installedApplicationInfo](self, "installedApplicationInfo", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        +[CRKApplicationInfo bundleIdentifierFromDictionaryRepresentation:](CRKApplicationInfo, "bundleIdentifierFromDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)CRKDevice;
  -[CRKDevice description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKDevice name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (identifier: %@ name: %@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CRKDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CRKDevice *v4;
  BOOL v5;

  v4 = (CRKDevice *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CRKDevice isEqualToDevice:](self, "isEqualToDevice:", v4);
  }

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  -[CRKDevice identifier](self, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v5 | v6)
    v7 = objc_msgSend((id)v5, "isEqual:", v6);
  else
    v7 = 1;

  return v7;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  +[CRKDevice CRKKeyForDMFKey:](CRKDevice, "CRKKeyForDMFKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CRKDevice setValue:forKey:](self, "setValue:forKey:", v7, v8);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRKDevice;
    -[CRKDevice setValue:forUndefinedKey:](&v9, sel_setValue_forUndefinedKey_, v7, v6);
  }

}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  +[CRKDevice CRKKeyForDMFKey:](CRKDevice, "CRKKeyForDMFKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CRKDevice valueForKey:](self, "valueForKey:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRKDevice;
    -[CRKDevice valueForUndefinedKey:](&v9, sel_valueForUndefinedKey_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = objc_alloc((Class)objc_opt_class());
  -[CRKDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithIdentifier:", v5);

  if (v6)
  {
    -[CRKDevice serialNumber](self, "serialNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSerialNumber:", v7);

    -[CRKDevice trustedExchangeIdentifier](self, "trustedExchangeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTrustedExchangeIdentifier:", v8);

    objc_msgSend(v6, "setPlatform:", -[CRKDevice platform](self, "platform"));
    -[CRKDevice model](self, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setModel:", v9);

    -[CRKDevice name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v10);

    -[CRKDevice systemName](self, "systemName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSystemName:", v11);

    -[CRKDevice systemVersion](self, "systemVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSystemVersion:", v12);

    -[CRKDevice buildVersion](self, "buildVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBuildVersion:", v13);

    objc_msgSend(v6, "setSupervised:", -[CRKDevice isSupervised](self, "isSupervised"));
    objc_msgSend(v6, "setEphemeralMultiUser:", -[CRKDevice isEphemeralMultiUser](self, "isEphemeralMultiUser"));
    -[CRKDevice batteryLevel](self, "batteryLevel");
    objc_msgSend(v6, "setBatteryLevel:");
    objc_msgSend(v6, "setLowBattery:", -[CRKDevice isLowBattery](self, "isLowBattery"));
    objc_msgSend(v6, "setChargingState:", -[CRKDevice chargingState](self, "chargingState"));
    objc_msgSend(v6, "setLockState:", -[CRKDevice lockState](self, "lockState"));
    objc_msgSend(v6, "setScreenState:", -[CRKDevice screenState](self, "screenState"));
    objc_msgSend(v6, "setScreenSaverActive:", -[CRKDevice isScreenSaverActive](self, "isScreenSaverActive"));
    -[CRKDevice volume](self, "volume");
    objc_msgSend(v6, "setVolume:");
    objc_msgSend(v6, "setMuted:", -[CRKDevice isMuted](self, "isMuted"));
    objc_msgSend(v6, "setAvailableBytes:", -[CRKDevice availableBytes](self, "availableBytes"));
    objc_msgSend(v6, "setDeviceOrientation:", -[CRKDevice deviceOrientation](self, "deviceOrientation"));
    objc_msgSend(v6, "setInterfaceOrientation:", -[CRKDevice interfaceOrientation](self, "interfaceOrientation"));
    -[CRKDevice displays](self, "displays");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisplays:", v14);

    -[CRKDevice displayBackingScaleFactor](self, "displayBackingScaleFactor");
    objc_msgSend(v6, "setDisplayBackingScaleFactor:");
    -[CRKDevice displayWidth](self, "displayWidth");
    objc_msgSend(v6, "setDisplayWidth:");
    -[CRKDevice displayHeight](self, "displayHeight");
    objc_msgSend(v6, "setDisplayHeight:");
    -[CRKDevice primaryOpenApplication](self, "primaryOpenApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrimaryOpenApplication:", v15);

    -[CRKDevice secondaryOpenApplication](self, "secondaryOpenApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSecondaryOpenApplication:", v16);

    -[CRKDevice pipOpenApplication](self, "pipOpenApplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPipOpenApplication:", v17);

    -[CRKDevice allOpenApplications](self, "allOpenApplications");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllOpenApplications:", v18);

    objc_msgSend(v6, "setAppLocked:", -[CRKDevice isAppLocked](self, "isAppLocked"));
    -[CRKDevice installedApplicationInfo](self, "installedApplicationInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInstalledApplicationInfo:", v19);

    -[CRKDevice stagedAdHocIdentityCertificateFingerprint](self, "stagedAdHocIdentityCertificateFingerprint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStagedAdHocIdentityCertificateFingerprint:", v20);

    -[CRKDevice trustedAnchorCertificateFingerprints](self, "trustedAnchorCertificateFingerprints");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTrustedAnchorCertificateFingerprints:", v21);

    -[CRKDevice userIdentifier](self, "userIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserIdentifier:", v22);

    -[CRKDevice userDisplayName](self, "userDisplayName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserDisplayName:", v23);

    -[CRKDevice userGivenName](self, "userGivenName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserGivenName:", v24);

    -[CRKDevice userFamilyName](self, "userFamilyName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserFamilyName:", v25);

    -[CRKDevice userPhoneticGivenName](self, "userPhoneticGivenName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserPhoneticGivenName:", v26);

    -[CRKDevice userPhoneticFamilyName](self, "userPhoneticFamilyName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserPhoneticFamilyName:", v27);

    -[CRKDevice userImageURL](self, "userImageURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserImageURL:", v28);

    objc_msgSend(v6, "setLoginState:", -[CRKDevice loginState](self, "loginState"));
    objc_msgSend(v6, "setPasscodeEnabled:", -[CRKDevice isPasscodeEnabled](self, "isPasscodeEnabled"));
    -[CRKDevice studentImageIdentifier](self, "studentImageIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStudentImageIdentifier:", v29);

    -[CRKDevice instructorImageIdentifier](self, "instructorImageIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInstructorImageIdentifier:", v30);

    objc_msgSend(v6, "setRequestingUnenroll:", -[CRKDevice isRequestingUnenroll](self, "isRequestingUnenroll"));
    -[CRKDevice currentLocaleIdentifier](self, "currentLocaleIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCurrentLocaleIdentifier:", v31);

    -[CRKDevice activeAirPlayRoute](self, "activeAirPlayRoute");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActiveAirPlayRoute:", v32);

    -[CRKDevice availableAirPlayRoutes](self, "availableAirPlayRoutes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAvailableAirPlayRoutes:", v33);

    -[CRKDevice managementLockPasscode](self, "managementLockPasscode");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setManagementLockPasscode:", v34);

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CRKDevice *v6;
  void *v7;
  uint64_t v8;
  NSString *serialNumber;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *model;
  void *v14;
  uint64_t v15;
  NSString *name;
  void *v17;
  uint64_t v18;
  NSString *systemName;
  void *v20;
  uint64_t v21;
  NSString *systemVersion;
  void *v23;
  uint64_t v24;
  NSString *buildVersion;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSArray *displays;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  uint64_t v55;
  NSString *primaryOpenApplication;
  void *v57;
  uint64_t v58;
  NSString *secondaryOpenApplication;
  void *v60;
  uint64_t v61;
  NSString *pipOpenApplication;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  NSArray *allOpenApplications;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSArray *installedApplicationInfo;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  NSArray *v84;
  void *v85;
  uint64_t v86;
  NSString *stagedAdHocIdentityCertificateFingerprint;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  NSArray *trustedAnchorCertificateFingerprints;
  void *v93;
  uint64_t v94;
  NSString *userIdentifier;
  void *v96;
  uint64_t v97;
  NSString *userDisplayName;
  void *v99;
  uint64_t v100;
  NSString *userGivenName;
  void *v102;
  uint64_t v103;
  NSString *userFamilyName;
  void *v105;
  uint64_t v106;
  NSString *userPhoneticGivenName;
  void *v108;
  uint64_t v109;
  NSString *userPhoneticFamilyName;
  void *v111;
  uint64_t v112;
  NSString *userImageURL;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  NSString *studentImageIdentifier;
  void *v119;
  uint64_t v120;
  NSString *instructorImageIdentifier;
  void *v122;
  void *v123;
  uint64_t v124;
  NSString *currentLocaleIdentifier;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  NSDictionary *activeAirPlayRoute;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  NSArray *availableAirPlayRoutes;
  void *v146;
  uint64_t v147;
  NSString *managementLockPasscode;
  void *v149;
  uint64_t v150;
  NSString *trustedExchangeIdentifier;
  CRKDevice *v152;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  _QWORD v167[4];

  v167[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[CRKDevice initWithIdentifier:](self, "initWithIdentifier:", v5);
    if (v6)
    {
      v166 = v5;
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("serialNumber"));
      v8 = objc_claimAutoreleasedReturnValue();
      serialNumber = v6->_serialNumber;
      v6->_serialNumber = (NSString *)v8;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platform"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_platform = objc_msgSend(v10, "integerValue");

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("model"));
      v12 = objc_claimAutoreleasedReturnValue();
      model = v6->_model;
      v6->_model = (NSString *)v12;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("name"));
      v15 = objc_claimAutoreleasedReturnValue();
      name = v6->_name;
      v6->_name = (NSString *)v15;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("systemName"));
      v18 = objc_claimAutoreleasedReturnValue();
      systemName = v6->_systemName;
      v6->_systemName = (NSString *)v18;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("systemVersion"));
      v21 = objc_claimAutoreleasedReturnValue();
      systemVersion = v6->_systemVersion;
      v6->_systemVersion = (NSString *)v21;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("buildVersion"));
      v24 = objc_claimAutoreleasedReturnValue();
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = (NSString *)v24;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supervised"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_supervised = objc_msgSend(v26, "BOOLValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ephemeralMultiUser"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_ephemeralMultiUser = objc_msgSend(v27, "BOOLValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batteryLevel"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      *(float *)&v29 = v29;
      v6->_batteryLevel = *(float *)&v29;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lowBattery"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_lowBattery = objc_msgSend(v30, "BOOLValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chargingState"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_chargingState = objc_msgSend(v31, "integerValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockState"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_lockState = objc_msgSend(v32, "integerValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("screenState"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_screenState = objc_msgSend(v33, "integerValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("screenSaverActive"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_screenSaverActive = objc_msgSend(v34, "BOOLValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("volume"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "doubleValue");
      *(float *)&v36 = v36;
      v6->_volume = *(float *)&v36;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("muted"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_muted = objc_msgSend(v37, "BOOLValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availableBytes"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_availableBytes = objc_msgSend(v38, "unsignedLongLongValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceOrientation"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_deviceOrientation = objc_msgSend(v39, "integerValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interfaceOrientation"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_interfaceOrientation = objc_msgSend(v40, "integerValue");

      v41 = (void *)MEMORY[0x24BDBCF20];
      v42 = objc_opt_class();
      v43 = objc_opt_class();
      v44 = objc_opt_class();
      objc_msgSend(v41, "setWithObjects:", v42, v43, v44, objc_opt_class(), 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("displays"));
      v46 = objc_claimAutoreleasedReturnValue();
      displays = v6->_displays;
      v6->_displays = (NSArray *)v46;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayBackingScaleFactor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "doubleValue");
      *(float *)&v49 = v49;
      v6->_displayBackingScaleFactor = *(float *)&v49;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayWidth"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "doubleValue");
      *(float *)&v51 = v51;
      v6->_displayWidth = *(float *)&v51;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayHeight"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "doubleValue");
      *(float *)&v53 = v53;
      v6->_displayHeight = *(float *)&v53;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v54, CFSTR("primaryOpenApplication"));
      v55 = objc_claimAutoreleasedReturnValue();
      primaryOpenApplication = v6->_primaryOpenApplication;
      v6->_primaryOpenApplication = (NSString *)v55;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v57, CFSTR("secondaryOpenApplication"));
      v58 = objc_claimAutoreleasedReturnValue();
      secondaryOpenApplication = v6->_secondaryOpenApplication;
      v6->_secondaryOpenApplication = (NSString *)v58;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v60, CFSTR("pipOpenApplication"));
      v61 = objc_claimAutoreleasedReturnValue();
      pipOpenApplication = v6->_pipOpenApplication;
      v6->_pipOpenApplication = (NSString *)v61;

      v63 = (void *)MEMORY[0x24BDBCF20];
      v64 = objc_opt_class();
      objc_msgSend(v63, "setWithObjects:", v64, objc_opt_class(), 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v65, CFSTR("allOpenApplications"));
      v66 = objc_claimAutoreleasedReturnValue();
      allOpenApplications = v6->_allOpenApplications;
      v6->_allOpenApplications = (NSArray *)v66;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appLocked"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_appLocked = objc_msgSend(v68, "BOOLValue");

      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("installedApplicationInfo")))
      {
        v163 = (void *)MEMORY[0x24BDBCF20];
        v160 = objc_opt_class();
        v157 = objc_opt_class();
        v154 = objc_opt_class();
        v69 = objc_opt_class();
        v70 = objc_opt_class();
        v71 = objc_opt_class();
        v72 = objc_opt_class();
        v73 = objc_opt_class();
        v74 = objc_opt_class();
        v75 = objc_opt_class();
        objc_msgSend(v163, "setWithObjects:", v160, v157, v154, v69, v70, v71, v72, v73, v74, v75, objc_opt_class(), 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v76, CFSTR("installedApplicationInfo"));
        v77 = objc_claimAutoreleasedReturnValue();
        installedApplicationInfo = v6->_installedApplicationInfo;
        v6->_installedApplicationInfo = (NSArray *)v77;

      }
      if (!v6->_installedApplicationInfo)
      {
        v79 = (void *)MEMORY[0x24BDBCF20];
        v167[0] = objc_opt_class();
        v167[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v167, 2);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setWithArray:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v81, CFSTR("installedApplications"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "applicationInfoFromBundleIdentifiers:", v82);
        v83 = objc_claimAutoreleasedReturnValue();
        v84 = v6->_installedApplicationInfo;
        v6->_installedApplicationInfo = (NSArray *)v83;

      }
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v85, CFSTR("stagedAdHocIdentityCertificateFingerprint"));
      v86 = objc_claimAutoreleasedReturnValue();
      stagedAdHocIdentityCertificateFingerprint = v6->_stagedAdHocIdentityCertificateFingerprint;
      v6->_stagedAdHocIdentityCertificateFingerprint = (NSString *)v86;

      v88 = (void *)MEMORY[0x24BDBCF20];
      v89 = objc_opt_class();
      objc_msgSend(v88, "setWithObjects:", v89, objc_opt_class(), 0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v90, CFSTR("trustedAnchorCertificateFingerprints"));
      v91 = objc_claimAutoreleasedReturnValue();
      trustedAnchorCertificateFingerprints = v6->_trustedAnchorCertificateFingerprints;
      v6->_trustedAnchorCertificateFingerprints = (NSArray *)v91;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v93, CFSTR("userIdentifier"));
      v94 = objc_claimAutoreleasedReturnValue();
      userIdentifier = v6->_userIdentifier;
      v6->_userIdentifier = (NSString *)v94;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v96, CFSTR("userDisplayName"));
      v97 = objc_claimAutoreleasedReturnValue();
      userDisplayName = v6->_userDisplayName;
      v6->_userDisplayName = (NSString *)v97;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v99, CFSTR("userGivenName"));
      v100 = objc_claimAutoreleasedReturnValue();
      userGivenName = v6->_userGivenName;
      v6->_userGivenName = (NSString *)v100;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v102, CFSTR("userFamilyName"));
      v103 = objc_claimAutoreleasedReturnValue();
      userFamilyName = v6->_userFamilyName;
      v6->_userFamilyName = (NSString *)v103;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v105, CFSTR("userPhoneticGivenName"));
      v106 = objc_claimAutoreleasedReturnValue();
      userPhoneticGivenName = v6->_userPhoneticGivenName;
      v6->_userPhoneticGivenName = (NSString *)v106;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v108, CFSTR("userPhoneticFamilyName"));
      v109 = objc_claimAutoreleasedReturnValue();
      userPhoneticFamilyName = v6->_userPhoneticFamilyName;
      v6->_userPhoneticFamilyName = (NSString *)v109;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v111, CFSTR("userImageURL"));
      v112 = objc_claimAutoreleasedReturnValue();
      userImageURL = v6->_userImageURL;
      v6->_userImageURL = (NSString *)v112;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loginState"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_loginState = objc_msgSend(v114, "integerValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passcodeEnabled"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_passcodeEnabled = objc_msgSend(v115, "BOOLValue");

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v116, CFSTR("studentImageIdentifier"));
      v117 = objc_claimAutoreleasedReturnValue();
      studentImageIdentifier = v6->_studentImageIdentifier;
      v6->_studentImageIdentifier = (NSString *)v117;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v119, CFSTR("instructorImageIdentifier"));
      v120 = objc_claimAutoreleasedReturnValue();
      instructorImageIdentifier = v6->_instructorImageIdentifier;
      v6->_instructorImageIdentifier = (NSString *)v120;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestingUnenroll"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_requestingUnenroll = objc_msgSend(v122, "BOOLValue");

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v123, CFSTR("currentLocaleIdentifier"));
      v124 = objc_claimAutoreleasedReturnValue();
      currentLocaleIdentifier = v6->_currentLocaleIdentifier;
      v6->_currentLocaleIdentifier = (NSString *)v124;

      v164 = (void *)MEMORY[0x24BDBCF20];
      v161 = objc_opt_class();
      v158 = objc_opt_class();
      v155 = objc_opt_class();
      v126 = objc_opt_class();
      v127 = objc_opt_class();
      v128 = objc_opt_class();
      v129 = objc_opt_class();
      v130 = objc_opt_class();
      v131 = objc_opt_class();
      v132 = objc_opt_class();
      objc_msgSend(v164, "setWithObjects:", v161, v158, v155, v126, v127, v128, v129, v130, v131, v132, objc_opt_class(), 0);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v133, CFSTR("activeAirPlayRoute"));
      v134 = objc_claimAutoreleasedReturnValue();
      activeAirPlayRoute = v6->_activeAirPlayRoute;
      v6->_activeAirPlayRoute = (NSDictionary *)v134;

      v165 = (void *)MEMORY[0x24BDBCF20];
      v162 = objc_opt_class();
      v159 = objc_opt_class();
      v156 = objc_opt_class();
      v136 = objc_opt_class();
      v137 = objc_opt_class();
      v138 = objc_opt_class();
      v139 = objc_opt_class();
      v140 = objc_opt_class();
      v141 = objc_opt_class();
      v142 = objc_opt_class();
      objc_msgSend(v165, "setWithObjects:", v162, v159, v156, v136, v137, v138, v139, v140, v141, v142, objc_opt_class(), 0);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v143, CFSTR("availableAirPlayRoutes"));
      v144 = objc_claimAutoreleasedReturnValue();
      availableAirPlayRoutes = v6->_availableAirPlayRoutes;
      v6->_availableAirPlayRoutes = (NSArray *)v144;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v146, CFSTR("managementLockPasscode"));
      v147 = objc_claimAutoreleasedReturnValue();
      managementLockPasscode = v6->_managementLockPasscode;
      v6->_managementLockPasscode = (NSString *)v147;

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v149, CFSTR("trustedExchangeIdentifier"));
      v150 = objc_claimAutoreleasedReturnValue();
      trustedExchangeIdentifier = v6->_trustedExchangeIdentifier;
      v6->_trustedExchangeIdentifier = (NSString *)v150;

      v5 = v166;
    }
    self = v6;
    v152 = self;
  }
  else
  {
    v152 = 0;
  }

  return v152;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;

  v4 = a3;
  -[CRKDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[CRKDevice serialNumber](self, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serialNumber"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKDevice platform](self, "platform"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("platform"));

  -[CRKDevice model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("model"));

  -[CRKDevice name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("name"));

  -[CRKDevice systemName](self, "systemName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("systemName"));

  -[CRKDevice systemVersion](self, "systemVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("systemVersion"));

  -[CRKDevice buildVersion](self, "buildVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("buildVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKDevice isSupervised](self, "isSupervised"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("supervised"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKDevice isEphemeralMultiUser](self, "isEphemeralMultiUser"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("ephemeralMultiUser"));

  v15 = (void *)MEMORY[0x24BDD16E0];
  -[CRKDevice batteryLevel](self, "batteryLevel");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("batteryLevel"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKDevice isLowBattery](self, "isLowBattery"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("lowBattery"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKDevice chargingState](self, "chargingState"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("chargingState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKDevice lockState](self, "lockState"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("lockState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKDevice screenState](self, "screenState"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("screenState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKDevice isScreenSaverActive](self, "isScreenSaverActive"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("screenSaverActive"));

  v22 = (void *)MEMORY[0x24BDD16E0];
  -[CRKDevice volume](self, "volume");
  objc_msgSend(v22, "numberWithFloat:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("volume"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKDevice isMuted](self, "isMuted"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("muted"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[CRKDevice availableBytes](self, "availableBytes"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("availableBytes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKDevice deviceOrientation](self, "deviceOrientation"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("deviceOrientation"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKDevice interfaceOrientation](self, "interfaceOrientation"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("interfaceOrientation"));

  -[CRKDevice displays](self, "displays");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("displays"));

  v29 = (void *)MEMORY[0x24BDD16E0];
  -[CRKDevice displayBackingScaleFactor](self, "displayBackingScaleFactor");
  objc_msgSend(v29, "numberWithFloat:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("displayBackingScaleFactor"));

  v31 = (void *)MEMORY[0x24BDD16E0];
  -[CRKDevice displayWidth](self, "displayWidth");
  objc_msgSend(v31, "numberWithFloat:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("displayWidth"));

  v33 = (void *)MEMORY[0x24BDD16E0];
  -[CRKDevice displayHeight](self, "displayHeight");
  objc_msgSend(v33, "numberWithFloat:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("displayHeight"));

  -[CRKDevice primaryOpenApplication](self, "primaryOpenApplication");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("primaryOpenApplication"));

  -[CRKDevice secondaryOpenApplication](self, "secondaryOpenApplication");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v36, CFSTR("secondaryOpenApplication"));

  -[CRKDevice pipOpenApplication](self, "pipOpenApplication");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("pipOpenApplication"));

  -[CRKDevice allOpenApplications](self, "allOpenApplications");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("allOpenApplications"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKDevice isAppLocked](self, "isAppLocked"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, CFSTR("appLocked"));

  -[CRKDevice installedApplications](self, "installedApplications");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v40, CFSTR("installedApplications"));

  -[CRKDevice installedApplicationInfo](self, "installedApplicationInfo");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v41, CFSTR("installedApplicationInfo"));

  -[CRKDevice stagedAdHocIdentityCertificateFingerprint](self, "stagedAdHocIdentityCertificateFingerprint");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v42, CFSTR("stagedAdHocIdentityCertificateFingerprint"));

  -[CRKDevice trustedAnchorCertificateFingerprints](self, "trustedAnchorCertificateFingerprints");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v43, CFSTR("trustedAnchorCertificateFingerprints"));

  -[CRKDevice userIdentifier](self, "userIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v44, CFSTR("userIdentifier"));

  -[CRKDevice userDisplayName](self, "userDisplayName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v45, CFSTR("userDisplayName"));

  -[CRKDevice userGivenName](self, "userGivenName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v46, CFSTR("userGivenName"));

  -[CRKDevice userFamilyName](self, "userFamilyName");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v47, CFSTR("userFamilyName"));

  -[CRKDevice userPhoneticGivenName](self, "userPhoneticGivenName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v48, CFSTR("userPhoneticGivenName"));

  -[CRKDevice userPhoneticFamilyName](self, "userPhoneticFamilyName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v49, CFSTR("userPhoneticFamilyName"));

  -[CRKDevice userImageURL](self, "userImageURL");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v50, CFSTR("userImageURL"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKDevice loginState](self, "loginState"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v51, CFSTR("loginState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKDevice isPasscodeEnabled](self, "isPasscodeEnabled"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v52, CFSTR("passcodeEnabled"));

  -[CRKDevice studentImageIdentifier](self, "studentImageIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v53, CFSTR("studentImageIdentifier"));

  -[CRKDevice instructorImageIdentifier](self, "instructorImageIdentifier");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v54, CFSTR("instructorImageIdentifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKDevice isRequestingUnenroll](self, "isRequestingUnenroll"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v55, CFSTR("requestingUnenroll"));

  -[CRKDevice currentLocaleIdentifier](self, "currentLocaleIdentifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v56, CFSTR("currentLocaleIdentifier"));

  -[CRKDevice activeAirPlayRoute](self, "activeAirPlayRoute");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v57, CFSTR("activeAirPlayRoute"));

  -[CRKDevice availableAirPlayRoutes](self, "availableAirPlayRoutes");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v58, CFSTR("availableAirPlayRoutes"));

  -[CRKDevice managementLockPasscode](self, "managementLockPasscode");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v59, CFSTR("managementLockPasscode"));

  -[CRKDevice trustedExchangeIdentifier](self, "trustedExchangeIdentifier");
  v60 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v60, CFSTR("trustedExchangeIdentifier"));

}

+ (id)applicationInfoFromBundleIdentifiers:(id)a3
{
  return (id)objc_msgSend(a3, "crk_mapUsingBlock:", &__block_literal_global_107);
}

id __50__CRKDevice_applicationInfoFromBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CRKApplicationInfo *v3;
  void *v4;

  v2 = a2;
  v3 = -[CRKApplicationInfo initWithBundleIdentifier:shortVersionString:]([CRKApplicationInfo alloc], "initWithBundleIdentifier:shortVersionString:", v2, 0);

  -[CRKApplicationInfo dictionaryRepresentation](v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)trustedExchangeIdentifier
{
  return self->_trustedExchangeIdentifier;
}

- (void)setTrustedExchangeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_platform = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)systemName
{
  return self->_systemName;
}

- (void)setSystemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isSupervised
{
  return self->_supervised;
}

- (void)setSupervised:(BOOL)a3
{
  self->_supervised = a3;
}

- (BOOL)isEphemeralMultiUser
{
  return self->_ephemeralMultiUser;
}

- (void)setEphemeralMultiUser:(BOOL)a3
{
  self->_ephemeralMultiUser = a3;
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(float)a3
{
  self->_batteryLevel = a3;
}

- (BOOL)isLowBattery
{
  return self->_lowBattery;
}

- (void)setLowBattery:(BOOL)a3
{
  self->_lowBattery = a3;
}

- (unint64_t)chargingState
{
  return self->_chargingState;
}

- (void)setChargingState:(unint64_t)a3
{
  self->_chargingState = a3;
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
}

- (unint64_t)screenState
{
  return self->_screenState;
}

- (void)setScreenState:(unint64_t)a3
{
  self->_screenState = a3;
}

- (BOOL)isScreenSaverActive
{
  return self->_screenSaverActive;
}

- (void)setScreenSaverActive:(BOOL)a3
{
  self->_screenSaverActive = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (unint64_t)availableBytes
{
  return self->_availableBytes;
}

- (void)setAvailableBytes:(unint64_t)a3
{
  self->_availableBytes = a3;
}

- (unint64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(unint64_t)a3
{
  self->_deviceOrientation = a3;
}

- (unint64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(unint64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (NSArray)displays
{
  return self->_displays;
}

- (void)setDisplays:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (float)displayBackingScaleFactor
{
  return self->_displayBackingScaleFactor;
}

- (void)setDisplayBackingScaleFactor:(float)a3
{
  self->_displayBackingScaleFactor = a3;
}

- (float)displayWidth
{
  return self->_displayWidth;
}

- (void)setDisplayWidth:(float)a3
{
  self->_displayWidth = a3;
}

- (float)displayHeight
{
  return self->_displayHeight;
}

- (void)setDisplayHeight:(float)a3
{
  self->_displayHeight = a3;
}

- (NSString)primaryOpenApplication
{
  return self->_primaryOpenApplication;
}

- (void)setPrimaryOpenApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)secondaryOpenApplication
{
  return self->_secondaryOpenApplication;
}

- (void)setSecondaryOpenApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)allOpenApplications
{
  return self->_allOpenApplications;
}

- (void)setAllOpenApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (BOOL)isAppLocked
{
  return self->_appLocked;
}

- (void)setAppLocked:(BOOL)a3
{
  self->_appLocked = a3;
}

- (NSArray)installedApplicationInfo
{
  return self->_installedApplicationInfo;
}

- (void)setInstalledApplicationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)stagedAdHocIdentityCertificateFingerprint
{
  return self->_stagedAdHocIdentityCertificateFingerprint;
}

- (void)setStagedAdHocIdentityCertificateFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)trustedAnchorCertificateFingerprints
{
  return self->_trustedAnchorCertificateFingerprints;
}

- (void)setTrustedAnchorCertificateFingerprints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)userDisplayName
{
  return self->_userDisplayName;
}

- (void)setUserDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)userGivenName
{
  return self->_userGivenName;
}

- (void)setUserGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)userPhoneticGivenName
{
  return self->_userPhoneticGivenName;
}

- (void)setUserPhoneticGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)userFamilyName
{
  return self->_userFamilyName;
}

- (void)setUserFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)userPhoneticFamilyName
{
  return self->_userPhoneticFamilyName;
}

- (void)setUserPhoneticFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)userImageURL
{
  return self->_userImageURL;
}

- (void)setUserImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (unint64_t)loginState
{
  return self->_loginState;
}

- (void)setLoginState:(unint64_t)a3
{
  self->_loginState = a3;
}

- (BOOL)isPasscodeEnabled
{
  return self->_passcodeEnabled;
}

- (void)setPasscodeEnabled:(BOOL)a3
{
  self->_passcodeEnabled = a3;
}

- (NSString)studentImageIdentifier
{
  return self->_studentImageIdentifier;
}

- (void)setStudentImageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)instructorImageIdentifier
{
  return self->_instructorImageIdentifier;
}

- (void)setInstructorImageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (BOOL)isRequestingUnenroll
{
  return self->_requestingUnenroll;
}

- (void)setRequestingUnenroll:(BOOL)a3
{
  self->_requestingUnenroll = a3;
}

- (NSString)currentLocaleIdentifier
{
  return self->_currentLocaleIdentifier;
}

- (void)setCurrentLocaleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSDictionary)activeAirPlayRoute
{
  return self->_activeAirPlayRoute;
}

- (void)setActiveAirPlayRoute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSArray)availableAirPlayRoutes
{
  return self->_availableAirPlayRoutes;
}

- (void)setAvailableAirPlayRoutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSString)managementLockPasscode
{
  return self->_managementLockPasscode;
}

- (void)setManagementLockPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (BOOL)isOrientationLocked
{
  return self->_orientationLocked;
}

- (void)setOrientationLocked:(BOOL)a3
{
  self->_orientationLocked = a3;
}

- (NSString)pipOpenApplication
{
  return self->_pipOpenApplication;
}

- (void)setPipOpenApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipOpenApplication, 0);
  objc_storeStrong((id *)&self->_managementLockPasscode, 0);
  objc_storeStrong((id *)&self->_availableAirPlayRoutes, 0);
  objc_storeStrong((id *)&self->_activeAirPlayRoute, 0);
  objc_storeStrong((id *)&self->_currentLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_instructorImageIdentifier, 0);
  objc_storeStrong((id *)&self->_studentImageIdentifier, 0);
  objc_storeStrong((id *)&self->_userImageURL, 0);
  objc_storeStrong((id *)&self->_userPhoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_userFamilyName, 0);
  objc_storeStrong((id *)&self->_userPhoneticGivenName, 0);
  objc_storeStrong((id *)&self->_userGivenName, 0);
  objc_storeStrong((id *)&self->_userDisplayName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_trustedAnchorCertificateFingerprints, 0);
  objc_storeStrong((id *)&self->_stagedAdHocIdentityCertificateFingerprint, 0);
  objc_storeStrong((id *)&self->_installedApplicationInfo, 0);
  objc_storeStrong((id *)&self->_allOpenApplications, 0);
  objc_storeStrong((id *)&self->_secondaryOpenApplication, 0);
  objc_storeStrong((id *)&self->_primaryOpenApplication, 0);
  objc_storeStrong((id *)&self->_displays, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_trustedExchangeIdentifier, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (CRKDevice)initWithIdentifier:(id)a3
{
  id v5;
  CRKDevice *v6;
  uint64_t v7;
  NSString *identifier;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKDevice.m"), 473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CRKDevice;
  v6 = -[CRKDevice init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

  }
  return v6;
}

@end
