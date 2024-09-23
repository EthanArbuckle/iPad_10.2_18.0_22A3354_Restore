@implementation NSFileProviderDomain

- (id)plistDictionary
{
  NSString *pathRelativeToDocumentStorage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *spotlightDomainIdentifier;
  void *v13;
  void *v14;
  void *v15;
  NSError *error;
  void *v17;
  id v18;
  NSObject *v19;
  NSDictionary *userInfo;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  NSString *disconnectionReason;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  _QWORD v34[7];
  _QWORD v35[8];

  v35[7] = *MEMORY[0x1E0C80C00];
  v34[0] = CFSTR("DisplayName");
  v34[1] = CFSTR("Path");
  pathRelativeToDocumentStorage = self->_pathRelativeToDocumentStorage;
  v35[0] = self->_displayName;
  v35[1] = pathRelativeToDocumentStorage;
  v34[2] = CFSTR("Hidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hidden);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v4;
  v34[3] = CFSTR("Replicated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_replicated);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v5;
  v34[4] = CFSTR("SupportsSyncingTrash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsSyncingTrash);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v6;
  v34[5] = CFSTR("SupportsSearch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsSearch);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v7;
  v34[6] = CFSTR("SupportsRemoteVersions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsRemoteVersions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  if (self->_containsPhotos)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("ContainsPhotos"));

  }
  spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
  if (spotlightDomainIdentifier)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", spotlightDomainIdentifier, CFSTR("SpotlightDomain"));
  if (self->_readOnly)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("ReadOnly"));

  }
  if (self->_erasable)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("Erasable"));

  }
  if (self->_isContentManaged)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("IsContentManaged"));

  }
  error = self->_error;
  if (error)
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", error, 1, &v33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v33;
    if (!v17)
    {
      fp_current_or_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[NSFileProviderDomain plistDictionary].cold.2();

    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("Error"));

  }
  userInfo = self->_userInfo;
  if (userInfo)
  {
    v32 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", userInfo, 1, &v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v32;
    if (!v21)
    {
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[NSFileProviderDomain plistDictionary].cold.1();

    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("UserInfo"));

  }
  if (self->_disconnected)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, CFSTR("Disconnected"));

  }
  disconnectionReason = self->_disconnectionReason;
  if (disconnectionReason)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", disconnectionReason, CFSTR("DisconnectionReason"));
  if (self->_disconnectionOptions)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, CFSTR("DisconnectionOptions"));

  }
  if (self->_testingModes)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, CFSTR("TestingModes"));

  }
  if (self->_hiddenByUser)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v28, CFSTR("UserHidden"));

  }
  if (self->_supportedKnownFolders)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, CFSTR("SupportedKnownFolders"));

  }
  if (self->_replicatedKnownFolders)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v30, CFSTR("ReplicatedKnownFolders"));

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *spotlightDomainIdentifier;
  void *v5;
  NSString *personaIdentifier;
  NSUUID *volumeUUID;
  void *v8;
  NSFileProviderDomain *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_displayName, CFSTR("_displayName"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_pathRelativeToDocumentStorage, CFSTR("_pathRelativeToDocumentStorage"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_hidden, CFSTR("_hidden"));
  spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
  if (spotlightDomainIdentifier)
    objc_msgSend(v10, "encodeObject:forKey:", spotlightDomainIdentifier, CFSTR("_spotlightDomainIdentifier"));
  if (self->_containsPhotos)
    objc_msgSend(v10, "encodeBool:forKey:", 1, CFSTR("_containsPhotos"));
  v5 = v10;
  if (self->_readOnly)
  {
    objc_msgSend(v10, "encodeBool:forKey:", 1, CFSTR("_readOnly"));
    v5 = v10;
  }
  if (self->_erasable)
  {
    objc_msgSend(v10, "encodeBool:forKey:", 1, CFSTR("_erasable"));
    v5 = v10;
  }
  if (self->_isContentManaged)
  {
    objc_msgSend(v10, "encodeBool:forKey:", 1, CFSTR("_isContentManaged"));
    v5 = v10;
  }
  personaIdentifier = self->_personaIdentifier;
  if (personaIdentifier)
  {
    objc_msgSend(v10, "encodeObject:forKey:", personaIdentifier, CFSTR("personaIdentifier"));
    v5 = v10;
  }
  volumeUUID = self->_volumeUUID;
  if (volumeUUID)
  {
    objc_msgSend(v10, "encodeObject:forKey:", volumeUUID, CFSTR("_volumeUUID"));
    v5 = v10;
  }
  objc_msgSend(v5, "encodeBool:forKey:", self->_isEnterpriseDomain, CFSTR("_isEnterpriseDomain"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_isDataSeparatedDomain, CFSTR("_isDataSeparatedDomain"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_disconnected, CFSTR("_disconnected"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_disconnectionReason, CFSTR("_disconnectionReason"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_disconnectionOptions, CFSTR("_disconnectionOptions"));
  -[NSError fp_strippedError](self->_error, "fp_strippedError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("_error"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_userInfo, CFSTR("_userInfo"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_userEnabled, CFSTR("_userEnabled"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_replicated, CFSTR("_replicated"));
  objc_msgSend(v10, "encodeInteger:forKey:", self->_testingModes, CFSTR("_testingModes"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_supportsSyncingTrash, CFSTR("_supportsSyncingTrash"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_supportsSearch, CFSTR("_supportsSearch"));
  v9 = self;
  objc_sync_enter(v9);
  objc_msgSend(v10, "encodeObject:forKey:", v9->_backingStoreIdentity, CFSTR("_backingStoreIdentity"));
  objc_sync_exit(v9);

  objc_msgSend(v10, "encodeBool:forKey:", v9->_hiddenByUser, CFSTR("_hiddenByUser"));
  objc_msgSend(v10, "encodeInteger:forKey:", v9->_supportedKnownFolders, CFSTR("_supportedKnownFolders"));
  objc_msgSend(v10, "encodeInteger:forKey:", v9->_replicatedKnownFolders, CFSTR("_replicatedKnownFolders"));
  objc_msgSend(v10, "encodeBool:forKey:", v9->_supportsRemoteVersions, CFSTR("_supportsRemoteVersions"));

}

- (BOOL)isDisconnected
{
  return self->_disconnected;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (id)description
{
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  unint64_t testingModes;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;

  v28 = (void *)MEMORY[0x1E0CB3940];
  v27 = objc_opt_class();
  -[NSString fp_obfuscatedFilename](self->_displayName, "fp_obfuscatedFilename");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString fp_obfuscatedFilename](self->_identifier, "fp_obfuscatedFilename");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID fp_UUID](self->_volumeUUID, "fp_UUID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (self->_userEnabled)
    v4 = CFSTR("enabled");
  else
    v4 = CFSTR("disabled");
  v23 = v4;
  v24 = (void *)v3;
  if (self->_hidden)
    v5 = CFSTR(",hidden");
  else
    v5 = &stru_1E4450B40;
  if (self->_hiddenByUser)
    v6 = CFSTR(",hiddenByUser");
  else
    v6 = &stru_1E4450B40;
  v21 = v6;
  v22 = v5;
  if (self->_disconnected)
    v7 = CFSTR(",disconnected");
  else
    v7 = &stru_1E4450B40;
  v20 = v7;
  if (self->_replicated)
    v8 = CFSTR(",replicated");
  else
    v8 = &stru_1E4450B40;
  if (self->_supportsSyncingTrash)
    v9 = CFSTR(",syncTrash");
  else
    v9 = &stru_1E4450B40;
  if (self->_supportsSearch)
    v10 = CFSTR(",search");
  else
    v10 = &stru_1E4450B40;
  if (self->_supportsRemoteVersions)
    v11 = CFSTR(",remoteVersions");
  else
    v11 = &stru_1E4450B40;
  if (self->_userInfo)
    v12 = CFSTR(",userInfo");
  else
    v12 = &stru_1E4450B40;
  testingModes = self->_testingModes;
  if ((testingModes & 1) != 0)
    v14 = CFSTR(",test:alwaysEnabled");
  else
    v14 = &stru_1E4450B40;
  if ((testingModes & 2) != 0)
    v15 = CFSTR(",test:interactive");
  else
    v15 = &stru_1E4450B40;
  FPKnownFoldersDescription(CFSTR(" supportedKF:"), self->_supportedKnownFolders);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  FPKnownFoldersDescription(CFSTR(" replicatedKF:"), self->_replicatedKnownFolders);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p, %@ id=%@ vid=%@ (%@%@%@%@%@%@%@%@%@%@%@)%@%@>"), v27, self, v26, v25, v24, v23, v22, v21, v20, v8, v9, v10, v11, v12, v14, v15,
    v16,
    v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isReplicated
{
  return self->_replicated;
}

- (NSFileProviderDomainTestingModes)testingModes
{
  return self->_testingModes;
}

- (void)copyValuesFromExistingDomain:(id)a3
{
  id v4;
  NSString *v5;
  NSString *personaIdentifier;
  NSUUID *v7;
  NSUUID *volumeUUID;
  NSString *v9;
  NSString *spotlightDomainIdentifier;
  unint64_t v11;

  v4 = a3;
  self->_userEnabled = objc_msgSend(v4, "userEnabled");
  objc_msgSend(v4, "personaIdentifier");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  personaIdentifier = self->_personaIdentifier;
  self->_personaIdentifier = v5;

  self->_isContentManaged = objc_msgSend(v4, "isContentManaged");
  self->_isEnterpriseDomain = objc_msgSend(v4, "isEnterpriseDomain");
  self->_isDataSeparatedDomain = objc_msgSend(v4, "isDataSeparatedDomain");
  objc_msgSend(v4, "volumeUUID");
  v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  volumeUUID = self->_volumeUUID;
  self->_volumeUUID = v7;

  self->_hiddenByUser = objc_msgSend(v4, "isHiddenByUser");
  objc_msgSend(v4, "spotlightDomainIdentifier");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
  self->_spotlightDomainIdentifier = v9;

  v11 = objc_msgSend(v4, "replicatedKnownFolders");
  self->_replicatedKnownFolders = v11;
}

- (NSString)spotlightDomainIdentifier
{
  NSString *spotlightDomainIdentifier;

  spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
  if (!spotlightDomainIdentifier)
    spotlightDomainIdentifier = self->_identifier;
  return spotlightDomainIdentifier;
}

- (BOOL)userEnabled
{
  return self->_userEnabled;
}

- (BOOL)supportsSyncingTrash
{
  return self->_supportsSyncingTrash;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)supportsSearch
{
  return self->_supportsSearch;
}

- (BOOL)isHiddenByUser
{
  return self->_hiddenByUser;
}

- (NSUUID)volumeUUID
{
  return self->_volumeUUID;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (BOOL)isDataSeparatedDomain
{
  return self->_isDataSeparatedDomain;
}

- (BOOL)isEnterpriseDomain
{
  return self->_isEnterpriseDomain;
}

- (NSFileProviderDomainIdentifier)identifier
{
  return (NSFileProviderDomainIdentifier)objc_getProperty(self, a2, 40, 1);
}

- (void)setIsEnterpriseDomain:(BOOL)a3
{
  self->_isEnterpriseDomain = a3;
}

- (void)setIsDataSeparatedDomain:(BOOL)a3
{
  self->_isDataSeparatedDomain = a3;
}

- (void)setPersonaIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_personaIdentifier, a3);
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainUserInfo, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_disconnectionReason, 0);
  objc_storeStrong((id *)&self->_symLinkName, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_pathRelativeToDocumentStorage, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_spotlightDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_backingStoreIdentity, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderDomain)initWithCoder:(id)a3
{
  id v4;
  NSFileProviderDomain *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSString *pathRelativeToDocumentStorage;
  uint64_t v12;
  NSString *spotlightDomainIdentifier;
  uint64_t v14;
  NSString *personaIdentifier;
  uint64_t v16;
  NSString *disconnectionReason;
  uint64_t v18;
  NSError *error;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *userInfo;
  uint64_t v24;
  NSData *backingStoreIdentity;
  uint64_t v26;
  NSUUID *volumeUUID;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NSFileProviderDomain;
  v5 = -[NSFileProviderDomain init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pathRelativeToDocumentStorage"));
    v10 = objc_claimAutoreleasedReturnValue();
    pathRelativeToDocumentStorage = v5->_pathRelativeToDocumentStorage;
    v5->_pathRelativeToDocumentStorage = (NSString *)v10;

    v5->_hidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hidden"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_spotlightDomainIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    spotlightDomainIdentifier = v5->_spotlightDomainIdentifier;
    v5->_spotlightDomainIdentifier = (NSString *)v12;

    v5->_containsPhotos = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_containsPhotos"));
    v5->_readOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_readOnly"));
    v5->_erasable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_erasable"));
    v5->_isContentManaged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isContentManaged"));
    v5->_isEnterpriseDomain = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isEnterpriseDomain"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    personaIdentifier = v5->_personaIdentifier;
    v5->_personaIdentifier = (NSString *)v14;

    v5->_isDataSeparatedDomain = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isDataSeparatedDomain"));
    v5->_disconnected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_disconnected"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_disconnectionReason"));
    v16 = objc_claimAutoreleasedReturnValue();
    disconnectionReason = v5->_disconnectionReason;
    v5->_disconnectionReason = (NSString *)v16;

    v5->_disconnectionOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_disconnectionOptions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_error"));
    v18 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v18;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSFileProviderDomain _userInfoAllowedClasses](NSFileProviderDomain, "_userInfoAllowedClasses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v20, v21, CFSTR("_userInfo"));
    v22 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v22;

    v5->_userEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_userEnabled"));
    v5->_replicated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_replicated"));
    v5->_testingModes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_testingModes"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStoreIdentity"));
    v24 = objc_claimAutoreleasedReturnValue();
    backingStoreIdentity = v5->_backingStoreIdentity;
    v5->_backingStoreIdentity = (NSData *)v24;

    v5->_supportsSyncingTrash = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsSyncingTrash"));
    v5->_supportsSearch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsSearch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_volumeUUID"));
    v26 = objc_claimAutoreleasedReturnValue();
    volumeUUID = v5->_volumeUUID;
    v5->_volumeUUID = (NSUUID *)v26;

    v5->_hiddenByUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hiddenByUser"));
    v5->_supportedKnownFolders = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_supportedKnownFolders"));
    v5->_replicatedKnownFolders = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_replicatedKnownFolders"));
    v5->_supportsRemoteVersions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsRemoteVersions"));
  }

  return v5;
}

+ (id)_userInfoAllowedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSFileProviderDomain)initWithIdentifier:(id)a3 displayName:(id)a4 pathRelativeToDocumentStorage:(id)a5 hidden:(BOOL)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return -[NSFileProviderDomain initWithIdentifier:displayName:userInfo:volumeURL:pathRelativeToDocumentStorage:hidden:replicated:](self, "initWithIdentifier:displayName:userInfo:volumeURL:pathRelativeToDocumentStorage:hidden:replicated:", a3, a4, MEMORY[0x1E0C9AA70], 0, a5, a6, v7);
}

- (NSFileProviderDomain)initWithIdentifier:(id)a3 displayName:(id)a4 userInfo:(id)a5 volumeURL:(id)a6 pathRelativeToDocumentStorage:(id)a7 hidden:(BOOL)a8 replicated:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  NSFileProviderDomain *v20;
  NSFileProviderDomain *v21;
  void *v22;
  void *v23;
  NSUUID *v24;
  NSUUID *volumeUUID;
  char v26;
  id v28;
  objc_super v29;

  v16 = a3;
  v28 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v29.receiver = self;
  v29.super_class = (Class)NSFileProviderDomain;
  v20 = -[NSFileProviderDomain init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    objc_storeStrong((id *)&v21->_displayName, a4);
    objc_storeStrong((id *)&v21->_pathRelativeToDocumentStorage, a7);
    v21->_hidden = a8;
    objc_storeStrong((id *)&v21->_userInfo, a5);
    if (v18)
    {
      objc_msgSend(v18, "fp_volumeUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
        v24 = v22;
      else
        v24 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
      volumeUUID = v21->_volumeUUID;
      v21->_volumeUUID = v24;

    }
    v26 = 1;
    if (!a9)
      v26 = objc_msgSend(v19, "isEqualToString:", CFSTR("FPFS_SHOULD_NOT_BE_USED"));
    v21->_replicated = v26;
    v21->_supportsSyncingTrash = 1;
    *(_WORD *)&v21->_supportsSearch = 0;
  }

  return v21;
}

- (void)setBackingStoreIdentity:(id)a3
{
  NSData *v4;
  NSData *backingStoreIdentity;
  NSFileProviderDomain *obj;

  v4 = (NSData *)a3;
  obj = self;
  objc_sync_enter(obj);
  backingStoreIdentity = obj->_backingStoreIdentity;
  obj->_backingStoreIdentity = v4;

  objc_sync_exit(obj);
}

- (BOOL)isErasable
{
  return self->_erasable;
}

- (NSData)backingStoreIdentity
{
  NSFileProviderDomain *v2;
  NSData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_backingStoreIdentity;
  objc_sync_exit(v2);

  return v3;
}

- (NSFileProviderDomain)initWithIdentifier:(NSFileProviderDomainIdentifier)identifier displayName:(NSString *)displayName pathRelativeToDocumentStorage:(NSString *)pathRelativeToDocumentStorage
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  return -[NSFileProviderDomain initWithIdentifier:displayName:userInfo:volumeURL:pathRelativeToDocumentStorage:hidden:replicated:](self, "initWithIdentifier:displayName:userInfo:volumeURL:pathRelativeToDocumentStorage:hidden:replicated:", identifier, displayName, MEMORY[0x1E0C9AA70], 0, pathRelativeToDocumentStorage, 0, v6);
}

- (NSFileProviderDomain)initWithIdentifier:(NSFileProviderDomainIdentifier)identifier displayName:(NSString *)displayName
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  return -[NSFileProviderDomain initWithIdentifier:displayName:userInfo:volumeURL:pathRelativeToDocumentStorage:hidden:replicated:](self, "initWithIdentifier:displayName:userInfo:volumeURL:pathRelativeToDocumentStorage:hidden:replicated:", identifier, displayName, MEMORY[0x1E0C9AA70], 0, CFSTR("FPFS_SHOULD_NOT_BE_USED"), 0, v5);
}

- (NSFileProviderDomain)initWithDisplayName:(id)a3 userInfo:(id)a4 volumeURL:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSFileProviderDomain *v16;
  uint64_t v18;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (void *)MEMORY[0x1E0CB3A28];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), CFSTR("NSFPExternal-"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v18) = 1;
  v16 = -[NSFileProviderDomain initWithIdentifier:displayName:userInfo:volumeURL:pathRelativeToDocumentStorage:hidden:replicated:](self, "initWithIdentifier:displayName:userInfo:volumeURL:pathRelativeToDocumentStorage:hidden:replicated:", v15, v12, v11, v10, CFSTR("FPFS_SHOULD_NOT_BE_USED"), 0, v18);

  return v16;
}

- (NSFileProviderDomain)initWithIdentifier:(id)a3 displayName:(id)a4 userInfo:(id)a5 volumeURL:(id)a6
{
  uint64_t v7;

  LOBYTE(v7) = 1;
  return -[NSFileProviderDomain initWithIdentifier:displayName:userInfo:volumeURL:pathRelativeToDocumentStorage:hidden:replicated:](self, "initWithIdentifier:displayName:userInfo:volumeURL:pathRelativeToDocumentStorage:hidden:replicated:", a3, a4, a5, a6, CFSTR("FPFS_SHOULD_NOT_BE_USED"), 0, v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)domainFromPlistDictionary:(id)a3 identifier:(id)a4 volumeURL:(id)a5 replicatedByDefault:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73[2];

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NSFileProviderDomainDefaultIdentifier")) & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DisplayName"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Path"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Hidden"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Replicated"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v71 = v17;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ContainsPhotos"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ReadOnly"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Erasable"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IsContentManaged"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Error"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Disconnected"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DisconnectionReason"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DisconnectionOptions"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TestingModes"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SupportsSyncingTrash"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SupportsSearch"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("UserHidden"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = (void *)MEMORY[0x1E0C9AAA0];
    if (v19)
      v21 = (void *)v19;
    v22 = v21;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SpotlightDomain"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("UserInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SupportedKnownFolders"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ReplicatedKnownFolders"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SupportsRemoteVersions"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v25 = (void *)v14;
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v64 = 0;
        }
        objc_opt_class();
        v56 = v18;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v68 = 0;
        }
        objc_opt_class();
        v25 = (void *)v14;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v67 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v66 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v70 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v23 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v56 = 0;
        }
        objc_opt_class();
        v26 = v69;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v65 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v26 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v24 = 0;
        }
        v69 = v26;
        v27 = objc_alloc((Class)a1);
        v28 = objc_msgSend(v72, "BOOLValue");
        LOBYTE(v50) = objc_msgSend(v71, "BOOLValue");
        v13 = (void *)objc_msgSend(v27, "initWithIdentifier:displayName:userInfo:volumeURL:pathRelativeToDocumentStorage:hidden:replicated:", v11, v63, MEMORY[0x1E0C9AA70], v12, v14, v28, v50);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = objc_msgSend(v61, "BOOLValue");
        else
          v29 = 1;
        objc_msgSend(v13, "setSupportsSyncingTrash:", v29);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v31 = objc_msgSend(v60, "BOOLValue");
        else
          v31 = 0;
        objc_msgSend(v13, "setSupportsSearch:", v31);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v32 = objc_msgSend(v59, "BOOLValue");
        else
          v32 = 0;
        v18 = v56;
        objc_msgSend(v13, "setSupportsRemoteVersions:", v32);
        objc_msgSend(v13, "setSpotlightDomainIdentifier:", v64);
        if (v68)
          objc_msgSend(v13, "setContainsPhotos:", objc_msgSend(v68, "BOOLValue"));
        if (v62)
          objc_msgSend(v13, "setReadOnly:", objc_msgSend(v62, "BOOLValue"));
        if (v67)
          objc_msgSend(v13, "setErasable:", objc_msgSend(v67, "BOOLValue"));
        if (v66)
          objc_msgSend(v13, "setIsContentManaged:", objc_msgSend(v66, "BOOLValue"));
        objc_msgSend(v13, "setHiddenByUser:", objc_msgSend(v22, "BOOLValue"));
        objc_msgSend(v13, "setSupportedKnownFolders:", objc_msgSend(v69, "unsignedIntegerValue"));
        objc_msgSend(v13, "setReplicatedKnownFolders:", objc_msgSend(v24, "unsignedIntegerValue"));
        if (v70)
        {
          v73[0] = 0;
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v70, v73);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v73[0];
          if (!v33)
          {
            fp_current_or_default_log();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              +[NSFileProviderDomain domainFromPlistDictionary:identifier:volumeURL:replicatedByDefault:].cold.2((uint64_t)v53, v34, v35, v36, v37, v38, v39, v40);

            v33 = 0;
          }
          objc_msgSend(v13, "setError:", v33);

        }
        if (v23)
        {
          v54 = (void *)MEMORY[0x1E0CB3710];
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          +[NSFileProviderDomain _userInfoAllowedClasses](NSFileProviderDomain, "_userInfoAllowedClasses");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:", v51);
          v55 = objc_claimAutoreleasedReturnValue();
          v52 = 0;

          v42 = (void *)v55;
          if (!v55)
          {
            fp_current_or_default_log();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              +[NSFileProviderDomain domainFromPlistDictionary:identifier:volumeURL:replicatedByDefault:].cold.1((uint64_t)v52, v43, v44, v45, v46, v47, v48, v49);

            v42 = 0;
          }
          objc_msgSend(v13, "setUserInfo:", v42);

        }
        if (v56)
        {
          objc_msgSend(v13, "setDisconnected:", objc_msgSend(v56, "BOOLValue"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v13, "_setDisconnectionReason:", v58);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v13, "_setDisconnectionOptions:", objc_msgSend(v57, "intValue") & 1);
        }
        if (v65)
          objc_msgSend(v13, "setTestingModes:", objc_msgSend(v65, "unsignedIntegerValue"));
        if (v71)
          objc_msgSend(v13, "setReplicated:", objc_msgSend(v71, "BOOLValue"));
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
      v25 = (void *)v14;
    }

  }
  return v13;
}

- (void)setUserInfo:(id)a3
{
  NSDictionary **p_userInfo;
  void *v7;
  id v8;
  NSDictionary *v9;
  _QWORD v10[5];
  id v11;
  SEL v12;

  p_userInfo = &self->_userInfo;
  v9 = (NSDictionary *)a3;
  if (*p_userInfo != v9)
  {
    +[NSFileProviderDomain _userInfoAllowedClasses](NSFileProviderDomain, "_userInfoAllowedClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__NSFileProviderDomain_setUserInfo___block_invoke;
    v10[3] = &unk_1E444FFE8;
    v11 = v7;
    v12 = a2;
    v10[4] = self;
    v8 = v7;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", v10);
    objc_storeStrong((id *)p_userInfo, a3);

  }
}

void __36__NSFileProviderDomain_setUserInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("NSFileProviderDomain.m"), 683, CFSTR("userInfo keys must be strings, key %@ is %@"), v5, objc_opt_class());

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v8)
  {

LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("NSFileProviderDomain.m"), 691, CFSTR("userInfo values must be of classes %@, %@ is %@"), *(_QWORD *)(a1 + 40), v6, objc_opt_class());

    goto LABEL_14;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v7);
      v10 |= objc_opt_isKindOfClass();
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v9);

  if ((v10 & 1) == 0)
    goto LABEL_13;
LABEL_14:

}

- (void)setSpotlightDomainIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightDomainIdentifier, a3);
}

- (NSString)pathRelativeToDocumentStorage
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDisconnected:(BOOL)a3
{
  self->_disconnected = a3;
}

- (void)setUserEnabled:(BOOL)a3
{
  self->_userEnabled = a3;
}

- (void)setReplicated:(BOOL)a3
{
  self->_replicated = a3;
}

- (void)setTestingModes:(NSFileProviderDomainTestingModes)testingModes
{
  self->_testingModes = testingModes;
}

- (void)setSupportsSyncingTrash:(BOOL)supportsSyncingTrash
{
  self->_supportsSyncingTrash = supportsSyncingTrash;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (unint64_t)replicatedKnownFolders
{
  return self->_replicatedKnownFolders;
}

- (void)setReplicatedKnownFolders:(unint64_t)a3
{
  self->_replicatedKnownFolders = a3;
}

- (unint64_t)supportedKnownFolders
{
  return self->_supportedKnownFolders;
}

- (void)setSupportedKnownFolders:(unint64_t)a3
{
  self->_supportedKnownFolders = a3;
}

- (NSString)symLinkName
{
  return self->_symLinkName;
}

- (void)setSymLinkName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)containsPhotos
{
  return self->_containsPhotos;
}

- (void)setContainsPhotos:(BOOL)a3
{
  self->_containsPhotos = a3;
}

- (NSString)_disconnectionReason
{
  return self->_disconnectionReason;
}

- (void)_setDisconnectionReason:(id)a3
{
  objc_storeStrong((id *)&self->_disconnectionReason, a3);
}

- (unint64_t)_disconnectionOptions
{
  return self->_disconnectionOptions;
}

- (void)_setDisconnectionOptions:(unint64_t)a3
{
  self->_disconnectionOptions = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isEjectable
{
  return self->_ejectable;
}

- (void)setEjectable:(BOOL)a3
{
  self->_ejectable = a3;
}

- (NSDictionary)domainUserInfo
{
  return self->_domainUserInfo;
}

- (void)setDomainUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void)setErasable:(BOOL)a3
{
  self->_erasable = a3;
}

- (void)setHiddenByUser:(BOOL)a3
{
  self->_hiddenByUser = a3;
}

- (BOOL)owningApplicationIsHidden
{
  return self->_owningApplicationIsHidden;
}

- (void)setOwningApplicationIsHidden:(BOOL)a3
{
  self->_owningApplicationIsHidden = a3;
}

- (void)setSupportsSearch:(BOOL)a3
{
  self->_supportsSearch = a3;
}

- (BOOL)supportsRemoteVersions
{
  return self->_supportsRemoteVersions;
}

- (void)setSupportsRemoteVersions:(BOOL)a3
{
  self->_supportsRemoteVersions = a3;
}

- (void)plistDictionary
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_3_4(&dword_1A0A34000, v0, v1, "[ERROR] Failed to archive domain error %@: %@");
  OUTLINED_FUNCTION_3();
}

+ (void)domainFromPlistDictionary:(uint64_t)a3 identifier:(uint64_t)a4 volumeURL:(uint64_t)a5 replicatedByDefault:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, a2, a3, "[ERROR] Failed to unarchive domain userInfo %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)domainFromPlistDictionary:(uint64_t)a3 identifier:(uint64_t)a4 volumeURL:(uint64_t)a5 replicatedByDefault:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, a2, a3, "[ERROR] Failed to unarchive domain error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
