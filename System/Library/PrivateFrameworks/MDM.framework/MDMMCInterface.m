@implementation MDMMCInterface

+ (BOOL)isPasscodeSet
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

+ (BOOL)isLimitedAppsMode
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEffectivelyInAppAllowListMode");

  return v3;
}

+ (BOOL)isAwaitingDeviceConfigured
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAwaitingDeviceConfigured");

  return v3;
}

+ (id)managedAppIDs
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedAppIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)profiledCheckIn
{
  id v2;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkIn");

}

+ (void)flush
{
  id v2;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush");

}

+ (BOOL)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 outError:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x24BE63CB0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "clearPasscodeWithEscrowKeybagData:secret:outError:", v9, v8, a5);

  return (char)a5;
}

+ (void)storeCertificateData:(id)a3 forHostIdentifier:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeCertificateData:forHostIdentifier:", v7, v6);

}

+ (id)mdmQueryableRestrictions
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("MDMQueryableRestrictionKeys"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)filterMDMRestrictions:(id)a3 acceptingKeysFromDictionary:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE63CD0], "filterRestrictionDictionary:acceptedKeysDict:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "MCFixUpRestrictionsDictionaryForMDMReporting");
  return v5;
}

+ (BOOL)isAutomaticDateAndTimeForced
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE63808]);

  return v3;
}

+ (BOOL)isDiagnosticsSubmissionRestricted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE638E0]);

  return v3;
}

+ (BOOL)isEnterpriseBookBackupAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnterpriseBookBackupAllowed");

  return v3;
}

+ (id)profileIdentifierForProfileData:(id)a3 allowEmptyPayload:(BOOL)a4 outIsSupervisionProfile:(BOOL *)a5 outProfileSigner:(__SecCertificate *)a6 outMayInstallCloudProfile:(BOOL *)a7 outError:(id *)a8
{
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE63CA8], "profileWithData:fileName:allowEmptyPayload:outError:", a3, 0, a4, a8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (a5)
      *a5 = objc_msgSend(v12, "isSupervisionProfile");
    if (a7)
    {
      v18 = *MEMORY[0x24BE63DE0];
      v19[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *a7 = objc_msgSend(v13, "mayInstallWithOptions:hasInteractionClient:outError:", v14, 0, a8);

    }
    v15 = objc_msgSend(v13, "signerCertificate");
    if (a6 && v15)
      *a6 = (__SecCertificate *)CFRetain((CFTypeRef)objc_msgSend(v13, "signerCertificate"));
    objc_msgSend(v13, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)mdmProfileIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installedMDMProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)profileIdentifiersWithFilterFlags:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(a1, "_mcFilterFlagsForMDMFlags:", *(_QWORD *)&a3);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installedProfileIdentifiersWithFilterFlags:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isProfileWithIdentifier:(id)a3 managedByProfileWithIdentifier:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;

  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isProfileWithIdentifier:managedByProfileWithIdentifier:", v7, v6);

  return v9;
}

+ (id)profileListWithFilterFlags:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  int v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v3 = *(_QWORD *)&a3;
  v53 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "installedProfilesWithFilterFlags:", objc_msgSend(a1, "_mcFilterFlagsForMDMFlags:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v7)
  {
    v8 = v7;
    v46 = *(_QWORD *)v49;
    v45 = *MEMORY[0x24BE61380];
    v44 = *MEMORY[0x24BE61318];
    v43 = *MEMORY[0x24BE61388];
    v42 = *MEMORY[0x24BE61308];
    v41 = *MEMORY[0x24BE61358];
    v40 = *MEMORY[0x24BE61300];
    v39 = *MEMORY[0x24BE61368];
    v38 = *MEMORY[0x24BE61310];
    v37 = *MEMORY[0x24BE61328];
    v9 = *MEMORY[0x24BE61330];
    v10 = *MEMORY[0x24BE63E10];
    v33 = *MEMORY[0x24BE2A878];
    v32 = *MEMORY[0x24BE61378];
    v36 = *MEMORY[0x24BE61370];
    v35 = *MEMORY[0x24BE61360];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v49 != v46)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v11);
        v13 = (void *)objc_opt_new();
        objc_msgSend(v12, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v45);

        objc_msgSend(v12, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, v44);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "version"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v43);

        objc_msgSend(v12, "displayName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, v42);

        objc_msgSend(v12, "organization");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v41);

        objc_msgSend(v12, "profileDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v40);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "isLocked"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, v39);

        v21 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v12, "removalPasscode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithBool:", v22 != 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, v38);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "isEncrypted"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, v37);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "isManagedByMDM"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, v9);

        objc_msgSend(v12, "installOptions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "BOOLValue");

        if (v28)
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v33, v32);
        objc_msgSend(v12, "signerCertificatesData", v32, v33);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v29, v36);
        objc_msgSend(v12, "payloadsContentInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, v35);
        objc_msgSend(v47, "addObject:", v13);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v8);
  }

  return v47;
}

+ (id)provisioningProfileUUIDsWithManagedOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listInstalledProvisioningProfileUUIDsWithManagedOnly:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isProvisioningProfileWithUUID:(id)a3 managedByProfileWithIdentifier:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;

  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isProvisioningProfilesWithUUID:managedByProfileWithIdentifier:", v7, v6);

  return v9;
}

+ (BOOL)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 outError:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x24BE63CB0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "installProvisioningProfileData:managingProfileIdentifier:outError:", v9, v8, a5);

  return (char)a5;
}

+ (BOOL)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 outError:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x24BE63CB0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "removeProvisioningProfileWithUUID:managingProfileIdentifier:outError:", v9, v8, a5);

  return (char)a5;
}

+ (id)ipcuProfileList
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  _QWORD v40[4];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installedProfilesWithFilterFlags:", 69);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)objc_opt_new();
  v33 = (void *)objc_opt_new();
  v32 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v4)
  {
    v5 = v4;
    v31 = *(_QWORD *)v36;
    v30 = *MEMORY[0x24BE61320];
    v29 = *MEMORY[0x24BE612F8];
    v28 = *MEMORY[0x24BE61380];
    v27 = *MEMORY[0x24BE61308];
    v26 = *MEMORY[0x24BE61358];
    v25 = *MEMORY[0x24BE61300];
    v6 = *MEMORY[0x24BE61388];
    v7 = *MEMORY[0x24BE61368];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_opt_new();
        v12 = (void *)objc_opt_new();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v30);
        objc_msgSend(v9, "displayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v29);

        objc_msgSend(v9, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v28);

        objc_msgSend(v9, "displayName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v27);

        objc_msgSend(v9, "organization");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v26);

        objc_msgSend(v9, "profileDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v25);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "version"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v6);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "isLocked"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v7);

        objc_msgSend(v34, "setObject:forKeyedSubscript:", v11, v10);
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v12, v10);
        objc_msgSend(v33, "addObject:", v10);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v5);
  }

  v20 = *MEMORY[0x24BE61340];
  v39[0] = CFSTR("Status");
  v39[1] = v20;
  v40[0] = CFSTR("Acknowledged");
  v40[1] = v34;
  v21 = *MEMORY[0x24BE61350];
  v39[2] = *MEMORY[0x24BE61348];
  v39[3] = v21;
  v40[2] = v32;
  v40[3] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)ipcuRemoveProfileWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  const void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint8_t buf[16];
  id v23;
  CFTypeRef cf2;

  v3 = a3;
  cf2 = 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = 0;
    +[MDMMCInterface profileIdentifierForProfileData:allowEmptyPayload:outIsSupervisionProfile:outProfileSigner:outMayInstallCloudProfile:outError:](MDMMCInterface, "profileIdentifierForProfileData:allowEmptyPayload:outIsSupervisionProfile:outProfileSigner:outMayInstallCloudProfile:outError:", v3, 1, 0, &cf2, 0, &v23);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v23;
    if (v6)
      goto LABEL_18;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BE2A628];
      DMCErrorArray();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "DMCErrorWithDomain:code:descriptionArray:errorType:", v14, 4000, v15, *MEMORY[0x24BE2A588], 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      v5 = 0;
      goto LABEL_18;
    }
    v5 = v3;
  }
  objc_msgSend(v4, "installedProfileIdentifiersWithFilterFlags:", 69);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", v5) & 1) != 0)
  {
    objc_msgSend(v4, "installedProfileWithIdentifier:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isLocked")
      && objc_msgSend(v8, "isSigned")
      && (!cf2 || (v9 = (const void *)objc_msgSend(v8, "signerCertificate"), !CFEqual(v9, cf2))))
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BE2A628];
      objc_msgSend(v8, "friendlyName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      DMCErrorArray();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "DMCErrorWithDomain:code:descriptionArray:errorType:", v19, 4008, v11, *MEMORY[0x24BE2A588], v10, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v20, "DMCCopyAsPrimaryError");

    }
    else
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setType:", 0);
      objc_msgSend(v10, "setProfileIdentifier:", v5);
      objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v12 = (id)objc_msgSend(v11, "performRequest:error:", v10, &v21);
      v6 = v21;
    }

  }
  else
  {
    v16 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v16, OS_LOG_TYPE_ERROR, "iPCU tried to uninstall a profile that was not found", buf, 2u);
    }
    v6 = 0;
  }

LABEL_18:
  if (cf2)
    CFRelease(cf2);

  return v6;
}

+ (void)storeProfileData:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeProfileData:completion:", v7, v6);

}

+ (void)storedProfileDataWithCompletion:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storedProfileDataWithCompletion:", v4);

}

+ (void)installStoredProfileDataWithCompletion:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "installStoredProfileDataWithCompletion:", v4);

}

+ (id)cloudConfigurationDetails
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudConfigurationDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)retrieveCloudConfigurationDetailsCompletion:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "retrieveCloudConfigurationDetailsCompletionBlock:", v4);

}

+ (void)retrieveCloudConfigurationFromURL:(id)a3 username:(id)a4 password:(id)a5 anchorCertificates:(id)a6 completion:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v11 = (void *)MEMORY[0x24BE63CB0];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v11, "sharedConnection");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "retrieveCloudConfigurationFromURL:username:password:anchorCertificates:completionBlock:", v16, v15, v14, v13, v12);

}

+ (void)storeCloudConfigurationDetails:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeCloudConfigurationDetails:completion:", v7, v6);

}

+ (void)enrollProvisionallyWithNonce:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enrollProvisionallyWithNonce:completionBlock:", v7, v6);

}

+ (int)_mcFilterFlagsForMDMFlags:(int)a3
{
  char v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3 & 0xFFFFFF80;
  if ((a3 & 0xFFFFFF80) != 0)
  {
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7 = 134217984;
      v8 = v4;
      _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_FAULT, "Untranslated profile filter flags will be ignored: %llx", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3 & 0x7F;
}

@end
