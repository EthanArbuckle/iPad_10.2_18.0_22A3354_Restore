@implementation MIInstallOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIInstallOptions)initWithCoder:(id)a3
{
  id v4;
  MIInstallOptions *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  uint64_t v10;
  MIStoreMetadata *iTunesMetadata;
  uint64_t v12;
  NSData *sinfData;
  void *v14;
  uint64_t v15;
  NSData *iTunesArtworkData;
  uint64_t v17;
  NSData *geoJSONData;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *provisioningProfiles;
  uint64_t v24;
  NSString *alternateIconName;
  void *v26;
  uint64_t v27;
  NSString *linkedParentBundleID;
  void *v29;
  uint64_t v30;
  NSString *personaUniqueString;
  void *v32;

  v4 = a3;
  v5 = -[MIInstallOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installTargetType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installTargetType = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v5->_developerInstall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("developerInstall"));
    v5->_systemAppInstall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("systemAppInstall"));
    v5->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInitiated"));
    v5->_waitForDeletion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("waitForDeletion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lsInstallType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lsInstallType = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iTunesMetadata"));
    v10 = objc_claimAutoreleasedReturnValue();
    iTunesMetadata = v5->_iTunesMetadata;
    v5->_iTunesMetadata = (MIStoreMetadata *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sinfData"));
    v12 = objc_claimAutoreleasedReturnValue();
    sinfData = v5->_sinfData;
    v5->_sinfData = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sinfDataType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sinfDataType = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iTunesArtworkData"));
    v15 = objc_claimAutoreleasedReturnValue();
    iTunesArtworkData = v5->_iTunesArtworkData;
    v5->_iTunesArtworkData = (NSData *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geoJSONData"));
    v17 = objc_claimAutoreleasedReturnValue();
    geoJSONData = v5->_geoJSONData;
    v5->_geoJSONData = (NSData *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("provisioningProfiles"));
    v22 = objc_claimAutoreleasedReturnValue();
    provisioningProfiles = v5->_provisioningProfiles;
    v5->_provisioningProfiles = (NSArray *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alternateIconName"));
    v24 = objc_claimAutoreleasedReturnValue();
    alternateIconName = v5->_alternateIconName;
    v5->_alternateIconName = (NSString *)v24;

    v5->_skipWatchAppInstall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("skipWatchAppInstall"));
    v5->_allowLocalProvisioned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowLocalProvisioned"));
    v5->_performAPFSClone = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("performAPFSClone"));
    v5->_provisioningProfileInstallFailureIsFatal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("provisioningProfileInstallFailureIsFatal"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoInstallOverride"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoInstallOverride = objc_msgSend(v26, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkedParentBundleID"));
    v27 = objc_claimAutoreleasedReturnValue();
    linkedParentBundleID = v5->_linkedParentBundleID;
    v5->_linkedParentBundleID = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stashMode"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_stashMode = objc_msgSend(v29, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaUniqueString"));
    v30 = objc_claimAutoreleasedReturnValue();
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v30;

    v5->_preservePlaceholderAsParallel = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preservePlaceholderAsParallel"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installIntent"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installIntent = objc_msgSend(v32, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
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
  id v20;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[MIInstallOptions installTargetType](self, "installTargetType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("installTargetType"));

  -[MIInstallOptions bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("bundleIdentifier"));

  objc_msgSend(v5, "encodeBool:forKey:", -[MIInstallOptions isDeveloperInstall](self, "isDeveloperInstall"), CFSTR("developerInstall"));
  objc_msgSend(v5, "encodeBool:forKey:", -[MIInstallOptions isSystemAppInstall](self, "isSystemAppInstall"), CFSTR("systemAppInstall"));
  objc_msgSend(v5, "encodeBool:forKey:", -[MIInstallOptions isUserInitiated](self, "isUserInitiated"), CFSTR("userInitiated"));
  objc_msgSend(v5, "encodeBool:forKey:", -[MIInstallOptions waitForDeletion](self, "waitForDeletion"), CFSTR("waitForDeletion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MIInstallOptions lsInstallType](self, "lsInstallType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("lsInstallType"));

  -[MIInstallOptions iTunesMetadata](self, "iTunesMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("iTunesMetadata"));

  -[MIInstallOptions sinfData](self, "sinfData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("sinfData"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MIInstallOptions sinfDataType](self, "sinfDataType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("sinfDataType"));

  -[MIInstallOptions iTunesArtworkData](self, "iTunesArtworkData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("iTunesArtworkData"));

  -[MIInstallOptions geoJSONData](self, "geoJSONData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("geoJSONData"));

  -[MIInstallOptions provisioningProfiles](self, "provisioningProfiles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("provisioningProfiles"));

  -[MIInstallOptions alternateIconName](self, "alternateIconName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("alternateIconName"));

  objc_msgSend(v5, "encodeBool:forKey:", -[MIInstallOptions skipWatchAppInstall](self, "skipWatchAppInstall"), CFSTR("skipWatchAppInstall"));
  objc_msgSend(v5, "encodeBool:forKey:", -[MIInstallOptions allowLocalProvisioned](self, "allowLocalProvisioned"), CFSTR("allowLocalProvisioned"));
  objc_msgSend(v5, "encodeBool:forKey:", -[MIInstallOptions performAPFSClone](self, "performAPFSClone"), CFSTR("performAPFSClone"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MIInstallOptions autoInstallOverride](self, "autoInstallOverride"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("autoInstallOverride"));

  -[MIInstallOptions linkedParentBundleID](self, "linkedParentBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("linkedParentBundleID"));

  objc_msgSend(v5, "encodeBool:forKey:", -[MIInstallOptions provisioningProfileInstallFailureIsFatal](self, "provisioningProfileInstallFailureIsFatal"), CFSTR("provisioningProfileInstallFailureIsFatal"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MIInstallOptions stashMode](self, "stashMode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("stashMode"));

  -[MIInstallOptions personaUniqueString](self, "personaUniqueString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v19, CFSTR("personaUniqueString"));

  objc_msgSend(v5, "encodeBool:forKey:", -[MIInstallOptions preservePlaceholderAsParallel](self, "preservePlaceholderAsParallel"), CFSTR("preservePlaceholderAsParallel"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MIInstallOptions installIntent](self, "installIntent"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v20, CFSTR("installIntent"));

}

- (MIInstallOptions)initWithLegacyOptionsDictionary:(id)a3
{
  id v4;
  MIInstallOptions *v5;
  void *v6;
  MIInstallOptions *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  MIInstallOptions *v60;
  void *v62;
  int v63;
  void *v64;
  id v65;

  v4 = a3;
  v5 = -[MIInstallOptions init](self, "init");
  if (!v5)
  {
LABEL_59:
    v60 = v5;
    goto LABEL_60;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PackageType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Customer")))
    goto LABEL_3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Developer")))
  {
    -[MIInstallOptions setInstallTargetType:](v5, "setInstallTargetType:", 1);
    -[MIInstallOptions setDeveloperInstall:](v5, "setDeveloperInstall:", 1);
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("System")))
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("Placeholder")))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DowngradeToPlaceholder"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = MIBooleanValue(v62, 0);

        v7 = v5;
        if (v63)
          v8 = 3;
        else
          v8 = 2;
        goto LABEL_4;
      }
LABEL_3:
      v7 = v5;
      v8 = 1;
LABEL_4:
      -[MIInstallOptions setInstallTargetType:](v7, "setInstallTargetType:", v8);
      goto LABEL_9;
    }
    -[MIInstallOptions setInstallTargetType:](v5, "setInstallTargetType:", 1);
    -[MIInstallOptions setSystemAppInstall:](v5, "setSystemAppInstall:", 1);
  }
LABEL_9:
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  if (v11)
    -[MIInstallOptions setBundleIdentifier:](v5, "setBundleIdentifier:", v11);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsUserInitiated"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIInstallOptions setUserInitiated:](v5, "setUserInitiated:", MIBooleanValue(v12, 0));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WaitForStorageDeletion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIInstallOptions setWaitForDeletion:](v5, "setWaitForDeletion:", MIBooleanValue(v13, 0));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LSInstallType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;

  -[MIInstallOptions setLsInstallType:](v5, "setLsInstallType:", objc_msgSend(v16, "unsignedIntegerValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iTunesMetadata"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v18 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;

  if (!v19)
  {
    v64 = v6;
    v21 = 0;
    goto LABEL_24;
  }
  v65 = 0;
  objc_msgSend(MEMORY[0x1E0D3AD68], "metadataFromPlistData:error:", v19, &v65);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v65;
  -[MIInstallOptions setITunesMetadata:](v5, "setITunesMetadata:", v20);

  -[MIInstallOptions iTunesMetadata](v5, "iTunesMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v64 = v6;
LABEL_24:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ApplicationSINF"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v24 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;

    -[MIInstallOptions setSinfData:](v5, "setSinfData:", v25);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ApplicationSINFDataType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v27 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;

    -[MIInstallOptions setSinfDataType:](v5, "setSinfDataType:", objc_msgSend(v28, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iTunesArtwork"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v30 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;

    -[MIInstallOptions setITunesArtworkData:](v5, "setITunesArtworkData:", v31);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GeoJSON"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v33 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;

    -[MIInstallOptions setGeoJSONData:](v5, "setGeoJSONData:", v34);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProvisioningProfiles"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;

    -[MIInstallOptions setProvisioningProfiles:](v5, "setProvisioningProfiles:", v37);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AlternateIconName"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = v39;
    else
      v40 = 0;

    -[MIInstallOptions setAlternateIconName:](v5, "setAlternateIconName:", v40);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SkipWatchAppInstall"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIInstallOptions setSkipWatchAppInstall:](v5, "setSkipWatchAppInstall:", MIBooleanValue(v41, 0));

    if (-[MIInstallOptions skipWatchAppInstall](v5, "skipWatchAppInstall"))
      -[MIInstallOptions setAutoInstallOverride:](v5, "setAutoInstallOverride:", 1);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AutoInstallWatchApp"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = MIBooleanValue(v42, 0);

    if (v43)
      -[MIInstallOptions setAutoInstallOverride:](v5, "setAutoInstallOverride:", 2);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AllowInstallLocalProvisioned"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIInstallOptions setAllowLocalProvisioned:](v5, "setAllowLocalProvisioned:", MIBooleanValue(v44, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PerformAPFSClone"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIInstallOptions setPerformAPFSClone:](v5, "setPerformAPFSClone:", MIBooleanValue(v45, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProvisioningProfileInstallFailureIsFatal"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIInstallOptions setProvisioningProfileInstallFailureIsFatal:](v5, "setProvisioningProfileInstallFailureIsFatal:", MIBooleanValue(v46, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StashMode"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = v47;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v49 = v48;
    else
      v49 = 0;

    -[MIInstallOptions setStashMode:](v5, "setStashMode:", objc_msgSend(v49, "unsignedIntegerValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LinkedParentBundleID"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = v50;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v52 = v51;
    else
      v52 = 0;

    -[MIInstallOptions setLinkedParentBundleID:](v5, "setLinkedParentBundleID:", v52);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PersonaUniqueStringForInstall"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = v53;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v55 = v54;
    else
      v55 = 0;

    -[MIInstallOptions setPersonaUniqueString:](v5, "setPersonaUniqueString:", v55);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreservePlaceholderAsParallel"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIInstallOptions setPreservePlaceholderAsParallel:](v5, "setPreservePlaceholderAsParallel:", MIBooleanValue(v56, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Intent"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = v57;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v59 = v58;
    else
      v59 = 0;

    -[MIInstallOptions setInstallIntent:](v5, "setInstallIntent:", objc_msgSend(v59, "unsignedIntegerValue"));
    goto LABEL_59;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();

  v60 = 0;
LABEL_60:

  return v60;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setInstallTargetType:", -[MIInstallOptions installTargetType](self, "installTargetType"));
  -[MIInstallOptions bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setBundleIdentifier:", v7);

  objc_msgSend(v5, "setDeveloperInstall:", -[MIInstallOptions isDeveloperInstall](self, "isDeveloperInstall"));
  objc_msgSend(v5, "setSystemAppInstall:", -[MIInstallOptions isSystemAppInstall](self, "isSystemAppInstall"));
  objc_msgSend(v5, "setUserInitiated:", -[MIInstallOptions isUserInitiated](self, "isUserInitiated"));
  objc_msgSend(v5, "setWaitForDeletion:", -[MIInstallOptions waitForDeletion](self, "waitForDeletion"));
  objc_msgSend(v5, "setLsInstallType:", -[MIInstallOptions lsInstallType](self, "lsInstallType"));
  -[MIInstallOptions iTunesMetadata](self, "iTunesMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setITunesMetadata:", v9);

  -[MIInstallOptions sinfData](self, "sinfData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setSinfData:", v11);

  objc_msgSend(v5, "setSinfDataType:", -[MIInstallOptions sinfDataType](self, "sinfDataType"));
  -[MIInstallOptions iTunesArtworkData](self, "iTunesArtworkData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setITunesArtworkData:", v13);

  -[MIInstallOptions geoJSONData](self, "geoJSONData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setGeoJSONData:", v15);

  -[MIInstallOptions provisioningProfiles](self, "provisioningProfiles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setProvisioningProfiles:", v17);

  -[MIInstallOptions alternateIconName](self, "alternateIconName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setAlternateIconName:", v19);

  objc_msgSend(v5, "setSkipWatchAppInstall:", -[MIInstallOptions skipWatchAppInstall](self, "skipWatchAppInstall"));
  objc_msgSend(v5, "setAllowLocalProvisioned:", -[MIInstallOptions allowLocalProvisioned](self, "allowLocalProvisioned"));
  objc_msgSend(v5, "setPerformAPFSClone:", -[MIInstallOptions performAPFSClone](self, "performAPFSClone"));
  objc_msgSend(v5, "setAutoInstallOverride:", -[MIInstallOptions autoInstallOverride](self, "autoInstallOverride"));
  -[MIInstallOptions linkedParentBundleID](self, "linkedParentBundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLinkedParentBundleID:", v20);

  objc_msgSend(v5, "setProvisioningProfileInstallFailureIsFatal:", -[MIInstallOptions provisioningProfileInstallFailureIsFatal](self, "provisioningProfileInstallFailureIsFatal"));
  objc_msgSend(v5, "setStashMode:", -[MIInstallOptions stashMode](self, "stashMode"));
  -[MIInstallOptions personaUniqueString](self, "personaUniqueString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersonaUniqueString:", v21);

  objc_msgSend(v5, "setPreservePlaceholderAsParallel:", -[MIInstallOptions preservePlaceholderAsParallel](self, "preservePlaceholderAsParallel"));
  objc_msgSend(v5, "setInstallIntent:", -[MIInstallOptions installIntent](self, "installIntent"));
  return v5;
}

- (NSDictionary)legacyOptionsDictionary
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  id v31;

  v3 = (void *)objc_opt_new();
  v4 = -[MIInstallOptions installTargetType](self, "installTargetType");
  if (v4 == 3)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Placeholder"), CFSTR("PackageType"));
    v5 = (const __CFString *)MEMORY[0x1E0C9AAB0];
    v6 = CFSTR("DowngradeToPlaceholder");
  }
  else
  {
    if (v4 == 2)
    {
      v5 = CFSTR("Placeholder");
    }
    else
    {
      if (v4 != 1)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          -[MIInstallOptions installTargetType](self, "installTargetType");
          MOLogWrite();
        }
        goto LABEL_62;
      }
      if (-[MIInstallOptions isDeveloperInstall](self, "isDeveloperInstall"))
      {
        v5 = CFSTR("Developer");
      }
      else if (-[MIInstallOptions isSystemAppInstall](self, "isSystemAppInstall"))
      {
        v5 = CFSTR("System");
      }
      else
      {
        v5 = CFSTR("Customer");
      }
    }
    v6 = CFSTR("PackageType");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);
  -[MIInstallOptions bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MIInstallOptions bundleIdentifier](self, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C9AE78]);

  }
  if (-[MIInstallOptions isUserInitiated](self, "isUserInitiated"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsUserInitiated"));
  if (-[MIInstallOptions waitForDeletion](self, "waitForDeletion"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("WaitForStorageDeletion"));
  if (-[MIInstallOptions lsInstallType](self, "lsInstallType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MIInstallOptions lsInstallType](self, "lsInstallType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("LSInstallType"));

  }
  -[MIInstallOptions iTunesMetadata](self, "iTunesMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MIInstallOptions iTunesMetadata](self, "iTunesMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v11, "propertyListDataWithError:", &v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v31;

    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("iTunesMetadata"));

      goto LABEL_20;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();

LABEL_62:
    v29 = 0;
    goto LABEL_63;
  }
LABEL_20:
  -[MIInstallOptions sinfData](self, "sinfData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("ApplicationSINF"));

  v15 = -[MIInstallOptions sinfDataType](self, "sinfDataType");
  if ((_DWORD)v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("ApplicationSINFDataType"));

  }
  -[MIInstallOptions iTunesArtworkData](self, "iTunesArtworkData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("iTunesArtwork"));

  -[MIInstallOptions geoJSONData](self, "geoJSONData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("GeoJSON"));

  -[MIInstallOptions provisioningProfiles](self, "provisioningProfiles");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("ProvisioningProfiles"));

  -[MIInstallOptions alternateIconName](self, "alternateIconName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("AlternateIconName"));

  if (-[MIInstallOptions skipWatchAppInstall](self, "skipWatchAppInstall")
    || -[MIInstallOptions autoInstallOverride](self, "autoInstallOverride") == 1)
  {
    v21 = CFSTR("SkipWatchAppInstall");
  }
  else
  {
    if (-[MIInstallOptions autoInstallOverride](self, "autoInstallOverride") != 2)
      goto LABEL_38;
    v21 = CFSTR("AutoInstallWatchApp");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v21);
LABEL_38:
  if (-[MIInstallOptions allowLocalProvisioned](self, "allowLocalProvisioned"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("AllowInstallLocalProvisioned"));
  if (-[MIInstallOptions performAPFSClone](self, "performAPFSClone"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PerformAPFSClone"));
  if (-[MIInstallOptions provisioningProfileInstallFailureIsFatal](self, "provisioningProfileInstallFailureIsFatal"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ProvisioningProfileInstallFailureIsFatal"));
  v22 = -[MIInstallOptions stashMode](self, "stashMode");
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("StashMode"));

  }
  -[MIInstallOptions linkedParentBundleID](self, "linkedParentBundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("LinkedParentBundleID"));
  -[MIInstallOptions personaUniqueString](self, "personaUniqueString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[MIInstallOptions personaUniqueString](self, "personaUniqueString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("PersonaUniqueStringForInstall"));

  }
  if (-[MIInstallOptions preservePlaceholderAsParallel](self, "preservePlaceholderAsParallel"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PreservePlaceholderAsParallel"));
  v27 = -[MIInstallOptions installIntent](self, "installIntent");
  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("Intent"));

  }
  v29 = (void *)objc_msgSend(v3, "copy");

LABEL_63:
  return (NSDictionary *)v29;
}

- (BOOL)isEqual:(id)a3
{
  MIInstallOptions *v4;
  MIInstallOptions *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  _BOOL4 v10;
  BOOL v11;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  unint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  BOOL v22;
  unsigned int v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  BOOL v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  unint64_t v39;
  void *v40;
  void *v41;
  BOOL v42;
  _BOOL4 v43;
  unint64_t v44;
  void *v45;
  void *v46;
  BOOL v47;
  _BOOL4 v48;
  unint64_t v49;

  v4 = (MIInstallOptions *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MIInstallOptions installTargetType](self, "installTargetType");
      if (v6 == -[MIInstallOptions installTargetType](v5, "installTargetType"))
      {
        -[MIInstallOptions bundleIdentifier](self, "bundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIInstallOptions bundleIdentifier](v5, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = MICompareObjects(v7, v8);

        if (v9)
        {
          v10 = -[MIInstallOptions isDeveloperInstall](self, "isDeveloperInstall");
          if (v10 == -[MIInstallOptions isDeveloperInstall](v5, "isDeveloperInstall"))
          {
            v13 = -[MIInstallOptions isSystemAppInstall](self, "isSystemAppInstall");
            if (v13 == -[MIInstallOptions isSystemAppInstall](v5, "isSystemAppInstall"))
            {
              v14 = -[MIInstallOptions isUserInitiated](self, "isUserInitiated");
              if (v14 == -[MIInstallOptions isUserInitiated](v5, "isUserInitiated"))
              {
                v15 = -[MIInstallOptions waitForDeletion](self, "waitForDeletion");
                if (v15 == -[MIInstallOptions waitForDeletion](v5, "waitForDeletion"))
                {
                  v16 = -[MIInstallOptions lsInstallType](self, "lsInstallType");
                  if (v16 == -[MIInstallOptions lsInstallType](v5, "lsInstallType"))
                  {
                    -[MIInstallOptions iTunesMetadata](self, "iTunesMetadata");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MIInstallOptions iTunesMetadata](v5, "iTunesMetadata");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    v19 = MICompareObjects(v17, v18);

                    if (v19)
                    {
                      -[MIInstallOptions sinfData](self, "sinfData");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      -[MIInstallOptions sinfData](v5, "sinfData");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      v22 = MICompareObjects(v20, v21);

                      if (v22)
                      {
                        v23 = -[MIInstallOptions sinfDataType](self, "sinfDataType");
                        if (v23 == -[MIInstallOptions sinfDataType](v5, "sinfDataType"))
                        {
                          -[MIInstallOptions iTunesArtworkData](self, "iTunesArtworkData");
                          v24 = (void *)objc_claimAutoreleasedReturnValue();
                          -[MIInstallOptions iTunesArtworkData](v5, "iTunesArtworkData");
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          v26 = MICompareObjects(v24, v25);

                          if (v26)
                          {
                            -[MIInstallOptions geoJSONData](self, "geoJSONData");
                            v27 = (void *)objc_claimAutoreleasedReturnValue();
                            -[MIInstallOptions geoJSONData](v5, "geoJSONData");
                            v28 = (void *)objc_claimAutoreleasedReturnValue();
                            v29 = MICompareObjects(v27, v28);

                            if (v29)
                            {
                              -[MIInstallOptions provisioningProfiles](self, "provisioningProfiles");
                              v30 = (void *)objc_claimAutoreleasedReturnValue();
                              -[MIInstallOptions provisioningProfiles](v5, "provisioningProfiles");
                              v31 = (void *)objc_claimAutoreleasedReturnValue();
                              v32 = MICompareObjects(v30, v31);

                              if (v32)
                              {
                                -[MIInstallOptions alternateIconName](self, "alternateIconName");
                                v33 = (void *)objc_claimAutoreleasedReturnValue();
                                -[MIInstallOptions alternateIconName](v5, "alternateIconName");
                                v34 = (void *)objc_claimAutoreleasedReturnValue();
                                v35 = MICompareObjects(v33, v34);

                                if (v35)
                                {
                                  v36 = -[MIInstallOptions skipWatchAppInstall](self, "skipWatchAppInstall");
                                  if (v36 == -[MIInstallOptions skipWatchAppInstall](v5, "skipWatchAppInstall"))
                                  {
                                    v37 = -[MIInstallOptions allowLocalProvisioned](self, "allowLocalProvisioned");
                                    if (v37 == -[MIInstallOptions allowLocalProvisioned](v5, "allowLocalProvisioned"))
                                    {
                                      v38 = -[MIInstallOptions performAPFSClone](self, "performAPFSClone");
                                      if (v38 == -[MIInstallOptions performAPFSClone](v5, "performAPFSClone"))
                                      {
                                        v39 = -[MIInstallOptions autoInstallOverride](self, "autoInstallOverride");
                                        if (v39 == -[MIInstallOptions autoInstallOverride](v5, "autoInstallOverride"))
                                        {
                                          -[MIInstallOptions linkedParentBundleID](self, "linkedParentBundleID");
                                          v40 = (void *)objc_claimAutoreleasedReturnValue();
                                          -[MIInstallOptions linkedParentBundleID](v5, "linkedParentBundleID");
                                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                                          v42 = MICompareObjects(v40, v41);

                                          if (v42)
                                          {
                                            v43 = -[MIInstallOptions provisioningProfileInstallFailureIsFatal](self, "provisioningProfileInstallFailureIsFatal");
                                            if (v43 == -[MIInstallOptions provisioningProfileInstallFailureIsFatal](v5, "provisioningProfileInstallFailureIsFatal"))
                                            {
                                              v44 = -[MIInstallOptions stashMode](self, "stashMode");
                                              if (v44 == -[MIInstallOptions stashMode](v5, "stashMode"))
                                              {
                                                -[MIInstallOptions personaUniqueString](self, "personaUniqueString");
                                                v45 = (void *)objc_claimAutoreleasedReturnValue();
                                                -[MIInstallOptions personaUniqueString](v5, "personaUniqueString");
                                                v46 = (void *)objc_claimAutoreleasedReturnValue();
                                                v47 = MICompareObjects(v45, v46);

                                                if (v47)
                                                {
                                                  v48 = -[MIInstallOptions preservePlaceholderAsParallel](self, "preservePlaceholderAsParallel");
                                                  if (v48 == -[MIInstallOptions preservePlaceholderAsParallel](v5, "preservePlaceholderAsParallel"))
                                                  {
                                                    v49 = -[MIInstallOptions installIntent](self, "installIntent");
                                                    if (v49 == -[MIInstallOptions installIntent](v5, "installIntent"))
                                                    {
                                                      v11 = 1;
                                                      goto LABEL_18;
                                                    }
                                                    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                    {
LABEL_17:
                                                      v11 = 0;
LABEL_18:

                                                      goto LABEL_19;
                                                    }
                                                  }
                                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                  {
                                                    goto LABEL_17;
                                                  }
                                                }
                                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                {
                                                  goto LABEL_17;
                                                }
                                              }
                                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                              {
                                                goto LABEL_17;
                                              }
                                            }
                                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                            {
                                              goto LABEL_17;
                                            }
                                          }
                                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                          {
                                            goto LABEL_17;
                                          }
                                        }
                                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                        {
                                          goto LABEL_17;
                                        }
                                      }
                                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                      {
                                        goto LABEL_17;
                                      }
                                    }
                                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                    {
                                      goto LABEL_17;
                                    }
                                  }
                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                  {
                                    goto LABEL_17;
                                  }
                                }
                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                {
                                  goto LABEL_17;
                                }
                              }
                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                              {
                                goto LABEL_17;
                              }
                            }
                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                            {
                              goto LABEL_17;
                            }
                          }
                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                          {
                            goto LABEL_17;
                          }
                        }
                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                        {
                          goto LABEL_17;
                        }
                      }
                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                      {
                        goto LABEL_17;
                      }
                    }
                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                    {
                      goto LABEL_17;
                    }
                  }
                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                  {
                    goto LABEL_17;
                  }
                }
                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                {
                  goto LABEL_17;
                }
              }
              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
                goto LABEL_17;
              }
            }
            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_17;
            }
          }
          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_17;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_17;
        }
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_17;
      }
      MOLogWrite();
      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_19:

  return v11;
}

- (id)description
{
  void *v2;
  void *v3;

  -[MIInstallOptions legacyOptionsDictionary](self, "legacyOptionsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)installTypeSummaryString
{
  unint64_t v3;

  v3 = -[MIInstallOptions installTargetType](self, "installTargetType");
  if (v3 == 3)
    return (NSString *)CFSTR("Offload");
  if (v3 == 2)
    return (NSString *)CFSTR("Placeholder");
  if (v3 != 1)
    return (NSString *)CFSTR("Unknown");
  if (-[MIInstallOptions isDeveloperInstall](self, "isDeveloperInstall"))
    return (NSString *)CFSTR("Developer");
  if (-[MIInstallOptions isSystemAppInstall](self, "isSystemAppInstall"))
    return (NSString *)CFSTR("System");
  return (NSString *)CFSTR("Customer");
}

- (unint64_t)installTargetType
{
  return self->_installTargetType;
}

- (void)setInstallTargetType:(unint64_t)a3
{
  self->_installTargetType = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isDeveloperInstall
{
  return self->_developerInstall;
}

- (void)setDeveloperInstall:(BOOL)a3
{
  self->_developerInstall = a3;
}

- (BOOL)isSystemAppInstall
{
  return self->_systemAppInstall;
}

- (void)setSystemAppInstall:(BOOL)a3
{
  self->_systemAppInstall = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)waitForDeletion
{
  return self->_waitForDeletion;
}

- (void)setWaitForDeletion:(BOOL)a3
{
  self->_waitForDeletion = a3;
}

- (unint64_t)lsInstallType
{
  return self->_lsInstallType;
}

- (void)setLsInstallType:(unint64_t)a3
{
  self->_lsInstallType = a3;
}

- (unint64_t)stashMode
{
  return self->_stashMode;
}

- (void)setStashMode:(unint64_t)a3
{
  self->_stashMode = a3;
}

- (unint64_t)installLocation
{
  return self->_installLocation;
}

- (void)setInstallLocation:(unint64_t)a3
{
  self->_installLocation = a3;
}

- (MIStoreMetadata)iTunesMetadata
{
  return self->_iTunesMetadata;
}

- (void)setITunesMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)iTunesArtworkData
{
  return self->_iTunesArtworkData;
}

- (void)setITunesArtworkData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)geoJSONData
{
  return self->_geoJSONData;
}

- (void)setGeoJSONData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)provisioningProfiles
{
  return self->_provisioningProfiles;
}

- (void)setProvisioningProfiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)alternateIconName
{
  return self->_alternateIconName;
}

- (void)setAlternateIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (void)setSinfData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unsigned)sinfDataType
{
  return self->_sinfDataType;
}

- (void)setSinfDataType:(unsigned int)a3
{
  self->_sinfDataType = a3;
}

- (BOOL)skipWatchAppInstall
{
  return self->_skipWatchAppInstall;
}

- (void)setSkipWatchAppInstall:(BOOL)a3
{
  self->_skipWatchAppInstall = a3;
}

- (BOOL)skipBlacklist
{
  return self->_skipBlacklist;
}

- (void)setSkipBlacklist:(BOOL)a3
{
  self->_skipBlacklist = a3;
}

- (BOOL)installForMigrator
{
  return self->_installForMigrator;
}

- (void)setInstallForMigrator:(BOOL)a3
{
  self->_installForMigrator = a3;
}

- (BOOL)allowLocalProvisioned
{
  return self->_allowLocalProvisioned;
}

- (void)setAllowLocalProvisioned:(BOOL)a3
{
  self->_allowLocalProvisioned = a3;
}

- (BOOL)performAPFSClone
{
  return self->_performAPFSClone;
}

- (void)setPerformAPFSClone:(BOOL)a3
{
  self->_performAPFSClone = a3;
}

- (unint64_t)autoInstallOverride
{
  return self->_autoInstallOverride;
}

- (void)setAutoInstallOverride:(unint64_t)a3
{
  self->_autoInstallOverride = a3;
}

- (NSString)linkedParentBundleID
{
  return self->_linkedParentBundleID;
}

- (void)setLinkedParentBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)provisioningProfileInstallFailureIsFatal
{
  return self->_provisioningProfileInstallFailureIsFatal;
}

- (void)setProvisioningProfileInstallFailureIsFatal:(BOOL)a3
{
  self->_provisioningProfileInstallFailureIsFatal = a3;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void)setPersonaUniqueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)preservePlaceholderAsParallel
{
  return self->_preservePlaceholderAsParallel;
}

- (void)setPreservePlaceholderAsParallel:(BOOL)a3
{
  self->_preservePlaceholderAsParallel = a3;
}

- (unint64_t)installIntent
{
  return self->_installIntent;
}

- (void)setInstallIntent:(unint64_t)a3
{
  self->_installIntent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_linkedParentBundleID, 0);
  objc_storeStrong((id *)&self->_sinfData, 0);
  objc_storeStrong((id *)&self->_alternateIconName, 0);
  objc_storeStrong((id *)&self->_provisioningProfiles, 0);
  objc_storeStrong((id *)&self->_geoJSONData, 0);
  objc_storeStrong((id *)&self->_iTunesArtworkData, 0);
  objc_storeStrong((id *)&self->_iTunesMetadata, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
