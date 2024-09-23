@implementation FPProviderDomain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_purposeIdentifier, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_domainUserInfo, 0);
  objc_storeStrong((id *)&self->_supportedSearchFilters, 0);
  objc_storeStrong((id *)&self->_storageURLs, 0);
  objc_storeStrong((id *)&self->_extensionBundleURL, 0);
  objc_storeStrong((id *)&self->_topLevelBundleURL, 0);
  objc_storeStrong((id *)&self->_topLevelBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedFileTypes, 0);
  objc_storeStrong((id *)&self->_providerDisplayName, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_itemCollection, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (BOOL)supportsSyncingTrash
{
  return self->_supportsSyncingTrash;
}

- (BOOL)isMainiCloudDriveDomain
{
  void *v3;
  int v4;

  if (-[FPProviderDomain isiCloudDriveProvider](self, "isiCloudDriveProvider"))
  {
    -[FPProviderDomain domain](self, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEnterpriseDomain") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isiCloudDriveProvider
{
  return -[NSString fp_isiCloudDriveOrCloudDocsIdentifier](self->_providerID, "fp_isiCloudDriveOrCloudDocsIdentifier");
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerID, CFSTR("_providerID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domain, CFSTR("_domain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerDisplayName, CFSTR("_providerDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionBundleURL, CFSTR("_extensionBundleURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedFileTypes, CFSTR("_supportedFileTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topLevelBundleIdentifier, CFSTR("_topLevelBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topLevelBundleURL, CFSTR("_topLevelBundleURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storageURLs, CFSTR("_storageURLs"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_storageURLsAreInTransientState, CFSTR("_storageURLsAreInTransientState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("_version"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAvailableSystemWide, CFSTR("_isAvailableSystemWide"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsEnumeration, CFSTR("_supportsEnumeration"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("_enabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canDisable, CFSTR("_canDisable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldHideExtensionName, CFSTR("_shouldHideExtensionName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldHideDomainDisplayName, CFSTR("_shouldHideDomainDisplayName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ejectable, CFSTR("_ejectable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_readOnly, CFSTR("_readOnly"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedSearchFilters, CFSTR("_supportedSearchFilters"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_usesUniqueItemIdentifiersAcrossDevices, CFSTR("_usesUniqueItemIdentifiersAcrossDevices"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hiddenByUser, CFSTR("_hiddenByUser"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hiddenByProvider, CFSTR("_hiddenByProvider"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsPickingFolders, CFSTR("_supportsPickingFolders"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_needsAuthentication, CFSTR("_needsAuthentication"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domainUserInfo, CFSTR("_domainUserInfo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsUserControlledEviction, CFSTR("_allowsUserControlledEviction"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsSystemDeleteAlerts, CFSTR("_allowsSystemDeleteAlerts"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsContextualMenuDownloadEntry, CFSTR("_allowsContextualMenuDownloadEntry"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsSyncingTrash, CFSTR("_supportsSyncingTrash"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsSearch, CFSTR("_supportsSearch"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_disconnectionState, CFSTR("_disconnectionState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useFPFS, CFSTR("_useFPFS"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_appliesChangesAtomically, CFSTR("_appliesChangesAtomically"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_backgroundActivityIsPaused, CFSTR("_backgroundActivityIsPaused"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_errorGenerationCount, CFSTR("_errorGenerationCount"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isIndexed, CFSTR("_isIndexed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_owningApplicationIsHidden, CFSTR("_owningApplicationIsHidden"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_supportedKnownFolders, CFSTR("_supportedKnownFolders"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsRemoteVersions, CFSTR("_supportsRemoteVersions"));

}

- (void)setStorageURLs:(id)a3
{
  objc_storeStrong((id *)&self->_storageURLs, a3);
}

- (void)setUsesUniqueItemIdentifiersAcrossDevices:(BOOL)a3
{
  self->_usesUniqueItemIdentifiersAcrossDevices = a3;
}

- (void)setUseFPFS:(BOOL)a3
{
  self->_useFPFS = a3;
}

- (void)setSupportsSyncingTrash:(BOOL)a3
{
  self->_supportsSyncingTrash = a3;
}

- (void)setSupportsSearch:(BOOL)a3
{
  self->_supportsSearch = a3;
}

- (void)setSupportsPickingFolders:(BOOL)a3
{
  self->_supportsPickingFolders = a3;
}

- (void)setSupportsEnumeration:(BOOL)a3
{
  self->_supportsEnumeration = a3;
}

- (void)setStorageURLsAreInTransientState:(BOOL)a3
{
  self->_storageURLsAreInTransientState = a3;
}

- (void)setShouldHideExtensionName:(BOOL)a3
{
  self->_shouldHideExtensionName = a3;
}

- (void)setShouldHideDomainDisplayName:(BOOL)a3
{
  self->_shouldHideDomainDisplayName = a3;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  self->_needsAuthentication = a3;
}

- (void)setIsIndexed:(BOOL)a3
{
  self->_isIndexed = a3;
}

- (void)setIsAvailableSystemWide:(BOOL)a3
{
  self->_isAvailableSystemWide = a3;
}

- (void)setErrorGenerationCount:(int64_t)a3
{
  self->_errorGenerationCount = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setEjectable:(BOOL)a3
{
  self->_ejectable = a3;
}

- (void)setDisconnectionState:(unint64_t)a3
{
  self->_disconnectionState = a3;
}

- (void)setCanDisable:(BOOL)a3
{
  self->_canDisable = a3;
}

- (void)setBackgroundActivityIsPaused:(BOOL)a3
{
  self->_backgroundActivityIsPaused = a3;
}

- (void)setAppliesChangesAtomically:(BOOL)a3
{
  self->_appliesChangesAtomically = a3;
}

- (void)setAllowsUserControlledEviction:(BOOL)a3
{
  self->_allowsUserControlledEviction = a3;
}

- (void)setAllowsSystemDeleteAlerts:(BOOL)a3
{
  self->_allowsSystemDeleteAlerts = a3;
}

- (void)setAllowsContextualMenuDownloadEntry:(BOOL)a3
{
  self->_allowsContextualMenuDownloadEntry = a3;
}

- (NSString)providerID
{
  return self->_providerID;
}

- (NSString)topLevelBundleIdentifier
{
  return self->_topLevelBundleIdentifier;
}

- (BOOL)isHiddenByUser
{
  return self->_hiddenByUser;
}

- (BOOL)isUsingFPFS
{
  return self->_useFPFS;
}

+ (id)providerDomainForItem:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "providerDomainID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "providerDomainWithID:cachePolicy:error:", v6, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (FPProviderDomain)providerDomainWithID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  id v29;

  v8 = a3;
  if (a4)
  {
    v29 = 0;
    objc_msgSend(a1, "cachedProviderDomainWithID:cachePolicy:error:", v8, a4, &v29);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v29;
    v11 = v10;
    if (v9)
    {
      v12 = v9;
LABEL_4:

      goto LABEL_12;
    }
    if (v10)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v10);
      goto LABEL_4;
    }
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__14;
  v27 = __Block_byref_object_dispose__14;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14;
  v21 = __Block_byref_object_dispose__14;
  v22 = 0;
  +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__FPProviderDomain_providerDomainWithID_cachePolicy_error___block_invoke;
  v16[3] = &unk_1E444CFF0;
  v16[4] = &v17;
  v16[5] = &v23;
  objc_msgSend(v13, "providerDomainForIdentifier:completionHandler:", v8, v16);

  v14 = (void *)v18[5];
  if (a5 && !v14)
  {
    *a5 = objc_retainAutorelease((id)v24[5]);
    v14 = (void *)v18[5];
  }
  v9 = v14;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
LABEL_12:

  return (FPProviderDomain *)v9;
}

+ (id)cachedProviderDomainWithID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v7 = a3;
  +[FPProviderDomainChangesReceiver sharedChangesReceiverIfAvailable](FPProviderDomainChangesReceiver, "sharedChangesReceiverIfAvailable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedProviderDomainsByID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 != 3 || v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v11)
    {
      v18 = v11;
    }
    else if (a4 == 3 || a4 == 2 && v9)
    {
      FPProviderNotFoundError((uint64_t)v7, 1uLL, v12, v13, v14, v15, v16, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
    *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NSFileProviderInternalErrorDomain"), 19, 0);
  }

  return v10;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void)setTopLevelBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelBundleURL, a3);
}

- (void)setTopLevelBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelBundleIdentifier, a3);
}

- (void)setSupportedSearchFilters:(id)a3
{
  objc_storeStrong((id *)&self->_supportedSearchFilters, a3);
}

- (void)setSupportedFileTypes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedFileTypes, a3);
}

- (void)setProviderDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_providerDisplayName, a3);
}

- (void)setExtensionBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_extensionBundleURL, a3);
}

- (void)setDomainUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_domainUserInfo, a3);
}

- (BOOL)isAvailableSystemWide
{
  return self->_isAvailableSystemWide;
}

- (BOOL)isHidden
{
  return -[FPProviderDomain isHiddenByProvider](self, "isHiddenByProvider")
      || -[FPProviderDomain isHiddenByUser](self, "isHiddenByUser")
      || -[FPProviderDomain owningApplicationIsHidden](self, "owningApplicationIsHidden");
}

- (BOOL)isHiddenByProvider
{
  return self->_hiddenByProvider;
}

- (BOOL)isEnterpriseDomain
{
  void *v2;
  char v3;

  -[FPProviderDomain domain](self, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnterpriseDomain");

  return v3;
}

- (FPProviderDomain)initWithProviderID:(id)a3 domain:(id)a4
{
  id v8;
  id v9;
  FPProviderDomain *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  NSString *identifier;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPProviderDomain.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("providerID"));

  }
  v19.receiver = self;
  v19.super_class = (Class)FPProviderDomain;
  v10 = -[FPProviderDomain init](&v19, sel_init);
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = CFSTR("NSFileProviderDomainDefaultIdentifier");
    objc_msgSend(v11, "fp_providerDomainIDFromProviderID:domainIdentifier:", v8, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v15;

    objc_storeStrong((id *)&v10->_domain, a4);
    objc_storeStrong((id *)&v10->_providerID, a3);
    v10->_hiddenByUser = objc_msgSend(v9, "isHiddenByUser");
    v10->_hiddenByProvider = objc_msgSend(v9, "isHidden");
    if (v9)
    {
      v10->_supportsSyncingTrash = objc_msgSend(v9, "supportsSyncingTrash");
      v10->_supportsSearch = objc_msgSend(v9, "supportsSearch");
      v10->_supportsRemoteVersions = objc_msgSend(v9, "supportsRemoteVersions");
    }
    else
    {
      v10->_supportsSyncingTrash = 1;
      *(_WORD *)&v10->_supportsSearch = 0;
    }
  }

  return v10;
}

- (NSString)personaIdentifier
{
  void *v2;
  void *v3;

  -[FPProviderDomain domain](self, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isDataSeparatedDomain
{
  void *v2;
  char v3;

  -[FPProviderDomain domain](self, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDataSeparatedDomain");

  return v3;
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (BOOL)needsAuthentication
{
  return -[FPProviderDomain isDefaultDomain](self, "isDefaultDomain")
      && -[FPProviderDomain isFPFSiCloudDriveProvider](self, "isFPFSiCloudDriveProvider")
      || self->_needsAuthentication;
}

- (BOOL)isDefaultDomain
{
  void *v2;
  char v3;

  -[NSFileProviderDomain identifier](self->_domain, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("NSFileProviderDomainDefaultIdentifier"));

  return v3;
}

- (BOOL)isFPFSiCloudDriveProvider
{
  return -[NSString fp_isiCloudDriveIdentifier](self->_providerID, "fp_isiCloudDriveIdentifier");
}

- (BOOL)supportsEnumeration
{
  return self->_supportsEnumeration;
}

+ (id)rootURLForProviderDomainID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;

  v7 = a3;
  if (!FPIsCloudDocsWithFPFSEnabled())
    goto LABEL_8;
  objc_msgSend(v7, "fp_toProviderID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")))
  {
LABEL_7:

LABEL_8:
    +[FPProviderDomain providerDomainWithID:cachePolicy:error:](FPProviderDomain, "providerDomainWithID:cachePolicy:error:", v7, a4, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (!v15)
    {
      v12 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v15, "storageURLs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  +[FPProviderDomain providerDomainWithID:cachePolicy:error:](FPProviderDomain, "providerDomainWithID:cachePolicy:error:", v7, 3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "storageURLs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fp_lmdURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fp_fpfsProviderDomainID:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", v7);

  if ((v14 & 1) == 0)
  {

    goto LABEL_7;
  }
LABEL_12:

  return v12;
}

- (NSArray)storageURLs
{
  return self->_storageURLs;
}

+ (id)mainICloudDriveDomainID
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (FPIsCloudDocsWithFPFSEnabled())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_lmdURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fp_fpfsProviderDomainID:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(a1, "_generateDomainIDFromDSID:", v3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_providerDomainIDFromProviderID:domainIdentifier:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"), CFSTR("NSFileProviderDomainDefaultIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)canDisconnect
{
  return self->_ejectable;
}

- (NSURL)extensionBundleURL
{
  return self->_extensionBundleURL;
}

- (NSArray)supportedFileTypes
{
  return self->_supportedFileTypes;
}

- (NSString)domainFullDisplayName
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  -[FPProviderDomain providerDisplayName](self, "providerDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPProviderDomain domainDisplayName](self, "domainDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[FPProviderDomain domainFullDisplayName].cold.2((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);

  }
  if (!objc_msgSend(v3, "length"))
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[FPProviderDomain domainFullDisplayName].cold.1((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);

    if (!objc_msgSend(v4, "length"))
      goto LABEL_14;
    goto LABEL_13;
  }
  if (!objc_msgSend(v4, "length"))
  {
LABEL_14:
    v12 = v3;
    goto LABEL_15;
  }
  if (!v3)
  {
LABEL_13:
    v12 = v4;
    goto LABEL_15;
  }
  if (self->_shouldHideDomainDisplayName)
    goto LABEL_14;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v3, v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
  v20 = v12;

  return (NSString *)v20;
}

- (NSString)providerDisplayName
{
  NSString *v2;

  if (self->_shouldHideExtensionName)
  {
    -[NSFileProviderDomain displayName](self->_domain, "displayName");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self->_providerDisplayName;
  }
  return v2;
}

- (NSString)domainDisplayName
{
  id v2;
  void *v4;

  if (self->_shouldHideDomainDisplayName || self->_shouldHideExtensionName)
  {
    v2 = 0;
  }
  else
  {
    -[NSFileProviderDomain displayName](self->_domain, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v2 = v4;
    else
      v2 = 0;

  }
  return (NSString *)v2;
}

- (FPProviderDomain)initWithCoder:(id)a3
{
  id v4;
  FPProviderDomain *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *providerID;
  uint64_t v11;
  NSFileProviderDomain *domain;
  uint64_t v13;
  NSString *providerDisplayName;
  uint64_t v15;
  NSURL *extensionBundleURL;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *supportedFileTypes;
  uint64_t v22;
  NSString *topLevelBundleIdentifier;
  uint64_t v24;
  NSURL *topLevelBundleURL;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *storageURLs;
  uint64_t v31;
  NSString *version;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSArray *supportedSearchFilters;
  uint64_t v38;
  NSDictionary *domainUserInfo;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)FPProviderDomain;
  v5 = -[FPProviderDomain init](&v41, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1A1B00664]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_providerID"));
    v9 = objc_claimAutoreleasedReturnValue();
    providerID = v5->_providerID;
    v5->_providerID = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domain"));
    v11 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSFileProviderDomain *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_providerDisplayName"));
    v13 = objc_claimAutoreleasedReturnValue();
    providerDisplayName = v5->_providerDisplayName;
    v5->_providerDisplayName = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_extensionBundleURL"));
    v15 = objc_claimAutoreleasedReturnValue();
    extensionBundleURL = v5->_extensionBundleURL;
    v5->_extensionBundleURL = (NSURL *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("_supportedFileTypes"));
    v20 = objc_claimAutoreleasedReturnValue();
    supportedFileTypes = v5->_supportedFileTypes;
    v5->_supportedFileTypes = (NSArray *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_topLevelBundleIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    topLevelBundleIdentifier = v5->_topLevelBundleIdentifier;
    v5->_topLevelBundleIdentifier = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_topLevelBundleURL"));
    v24 = objc_claimAutoreleasedReturnValue();
    topLevelBundleURL = v5->_topLevelBundleURL;
    v5->_topLevelBundleURL = (NSURL *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("_storageURLs"));
    v29 = objc_claimAutoreleasedReturnValue();
    storageURLs = v5->_storageURLs;
    v5->_storageURLs = (NSArray *)v29;

    v5->_storageURLsAreInTransientState = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_storageURLsAreInTransientState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_version"));
    v31 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v31;

    v5->_isAvailableSystemWide = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isAvailableSystemWide"));
    v5->_supportsEnumeration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsEnumeration"));
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enabled"));
    v5->_canDisable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_canDisable"));
    v5->_shouldHideExtensionName = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldHideExtensionName"));
    v5->_shouldHideDomainDisplayName = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldHideDomainDisplayName"));
    v5->_ejectable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_ejectable"));
    v5->_readOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_readOnly"));
    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("_supportedSearchFilters"));
    v36 = objc_claimAutoreleasedReturnValue();
    supportedSearchFilters = v5->_supportedSearchFilters;
    v5->_supportedSearchFilters = (NSArray *)v36;

    v5->_usesUniqueItemIdentifiersAcrossDevices = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_usesUniqueItemIdentifiersAcrossDevices"));
    v5->_hiddenByProvider = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hiddenByProvider"));
    v5->_hiddenByUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hiddenByUser"));
    v5->_supportsPickingFolders = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsPickingFolders"));
    v5->_needsAuthentication = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_needsAuthentication"));
    objc_msgSend(v4, "fp_safeDecodeNSDictionaryForKey:", CFSTR("_domainUserInfo"));
    v38 = objc_claimAutoreleasedReturnValue();
    domainUserInfo = v5->_domainUserInfo;
    v5->_domainUserInfo = (NSDictionary *)v38;

    v5->_allowsUserControlledEviction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowsUserControlledEviction"));
    v5->_allowsSystemDeleteAlerts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowsSystemDeleteAlerts"));
    v5->_allowsContextualMenuDownloadEntry = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowsContextualMenuDownloadEntry"));
    v5->_supportsSyncingTrash = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsSyncingTrash"));
    v5->_supportsSearch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsSearch"));
    v5->_disconnectionState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_disconnectionState"));
    v5->_useFPFS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_useFPFS"));
    v5->_appliesChangesAtomically = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_appliesChangesAtomically"));
    v5->_backgroundActivityIsPaused = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_backgroundActivityIsPaused"));
    v5->_errorGenerationCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_errorGenerationCount"));
    v5->_isIndexed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isIndexed"));
    v5->_owningApplicationIsHidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_owningApplicationIsHidden"));
    v5->_supportedKnownFolders = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_supportedKnownFolders"));
    v5->_supportsRemoteVersions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsRemoteVersions"));
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

+ (id)beginMonitoringProviderDomainChangesWithHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[FPProviderDomainChangesReceiver sharedChangesReceiver](FPProviderDomainChangesReceiver, "sharedChangesReceiver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addChangesHandler:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)spotlightMountPoint
{
  void *v3;

  if (-[NSString isEqualToString:](self->_providerID, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider")))
  {
    -[NSFileProviderDomain identifier](self->_domain, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

+ (void)endMonitoringProviderDomainChanges:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPProviderDomain.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("monitoringContext"));

  }
  +[FPProviderDomainChangesReceiver sharedChangesReceiver](FPProviderDomainChangesReceiver, "sharedChangesReceiver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeChangesHandlerToken:", v7);

}

void __59__FPProviderDomain_providerDomainWithID_cachePolicy_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __53__FPProviderDomain_domainStateWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (a2 || v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "callNextOverrides");
  }

}

void __43__FPProviderDomain_hasProviderDomainAccess__block_invoke()
{
  const __CFAllocator *Default;
  SecTaskRef v1;
  __SecTask *v2;
  const __CFArray *v3;
  CFDictionaryRef v4;
  NSObject *v5;
  CFErrorRef error;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    v2 = v1;
    v7[0] = CFSTR("com.apple.fileprovider.acl-read");
    v7[1] = CFSTR("com.apple.fileprovider.acl-write");
    v7[2] = CFSTR("com.apple.fileprovider.enumerate");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
    v3 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    error = 0;
    v4 = SecTaskCopyValuesForEntitlements(v2, v3, &error);
    CFRelease(v2);
    if (v4)
    {
      if (-[__CFDictionary count](v4, "count"))
        hasProviderDomainAccess_hasEntitlements = 1;
    }
    else if (error)
    {
      fp_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __43__FPProviderDomain_hasProviderDomainAccess__block_invoke_cold_2((uint64_t)v2, (uint64_t *)&error, v5);

      CFRelease(error);
    }

  }
  else
  {
    fp_current_or_default_log();
    v3 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
      __43__FPProviderDomain_hasProviderDomainAccess__block_invoke_cold_1((os_log_t)v3);
  }

}

- (BOOL)usesDSCopyEngine
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[FPProviderDomain isUsingFPFS](self, "isUsingFPFS"))
    return 1;
  -[FPProviderDomain providerID](self, "providerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[FPProviderDomain providerID](self, "providerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider")) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      -[FPProviderDomain providerID](self, "providerID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SMBClientProvider.FileProvider")) & 1) != 0)
      {
        v3 = 1;
      }
      else
      {
        -[FPProviderDomain providerID](self, "providerID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) != 0)
        {
          v3 = 1;
        }
        else
        {
          -[FPProviderDomain providerID](self, "providerID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) != 0)
          {
            v3 = 1;
          }
          else
          {
            -[FPProviderDomain providerID](self, "providerID");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v3 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));

          }
        }

      }
    }

  }
  return v3;
}

- (unint64_t)testingModes
{
  return -[NSFileProviderDomain testingModes](self->_domain, "testingModes");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqual:](identifier, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)domainStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _BYTE v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPProviderDomain personaIdentifier](self, "personaIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {

LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  -[FPProviderDomain personaIdentifier](self, "personaIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if ((v10 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v30 = 0;
  v11 = (void *)objc_msgSend(v6, "copyCurrentPersonaContextWithError:", &v30);
  v12 = v30;
  v13 = v31;
  v31 = v11;

  if (v12)
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[FPProviderDomain domainStateWithCompletionHandler:].cold.2((uint64_t)v12, v14);

  }
  -[FPProviderDomain personaIdentifier](self, "personaIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generateAndRestorePersonaContextWithPersonaUniqueString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[FPProviderDomain personaIdentifier](self, "personaIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPProviderDomain domainStateWithCompletionHandler:].cold.1(v18, (uint64_t)v16, (uint64_t)v32, v17);
    }

  }
LABEL_14:
  v19 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __53__FPProviderDomain_domainStateWithCompletionHandler___block_invoke;
  v28[3] = &unk_1E444A840;
  v20 = v4;
  v29 = v20;
  v21 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:](FPFrameworkOverridesIterator, "newIteratorWithNotFoundHandler:", v28);
  -[FPProviderDomain identifier](self, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __53__FPProviderDomain_domainStateWithCompletionHandler___block_invoke_2;
  v25[3] = &unk_1E444D068;
  v23 = v21;
  v26 = v23;
  v24 = v20;
  v27 = v24;
  objc_msgSend(v23, "FPStateForDomainWithID:completionHandler:", v22, v25);

  _FPRestorePersona(&v31);
}

- (id)description
{
  char v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const char *v15;
  unint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  NSUInteger v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = -[FPProviderDomain testingModes](self, "testingModes");
  -[NSFileProviderDomain backingStoreIdentity](self->_domain, "backingStoreIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSFileProviderDomain backingStoreIdentity](self->_domain, "backingStoreIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)objc_msgSend(v5, "initWithData:encoding:", v6, 4);

  }
  else
  {
    v72 = 0;
  }
  if (self->_errorGenerationCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" errorGenCount:%lld"), self->_errorGenerationCount);
    v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v71 = &stru_1E4450B40;
  }
  v7 = (void *)objc_opt_new();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v8 = self->_storageURLs;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v74 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        if (objc_msgSend(v7, "length"))
          objc_msgSend(v7, "appendString:", CFSTR(","));
        objc_msgSend(v13, "fp_shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v14);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    }
    while (v10);
  }

  v69 = (void *)MEMORY[0x1E0CB3940];
  v67 = objc_opt_class();
  -[NSString fp_obfuscatedProviderDomainID](self->_identifier, "fp_obfuscatedProviderDomainID");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString fp_obfuscatedFilename](self->_providerDisplayName, "fp_obfuscatedFilename");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[NSArray count](self->_storageURLs, "count");
  if (self->_enabled)
  {
    if (self->_needsAuthentication)
      v15 = "needAuth";
    else
      v15 = "enabled";
  }
  else
  {
    v15 = "disabled";
  }
  v65 = v15;
  v16 = self->_disconnectionState - 2;
  v17 = "";
  if (v16 <= 7)
    v17 = off_1E444D0B0[v16];
  v52 = v17;
  if (self->_owningApplicationIsHidden)
    v18 = ",appHidden";
  else
    v18 = "";
  if (self->_hiddenByProvider)
    v19 = ",providerHidden";
  else
    v19 = "";
  v63 = v19;
  v64 = v18;
  if (self->_hiddenByUser)
    v20 = ",userHidden";
  else
    v20 = "";
  v62 = v20;
  if (self->_backgroundActivityIsPaused)
    v21 = ",backgroundPaused";
  else
    v21 = "";
  if (self->_storageURLsAreInTransientState)
    v22 = ",changing";
  else
    v22 = "";
  v60 = v21;
  v61 = v22;
  if ((v3 & 1) != 0)
    v23 = ",test:alwaysEnabled";
  else
    v23 = "";
  v24 = ",test:interactive";
  if ((v3 & 2) == 0)
    v24 = "";
  v58 = v24;
  v59 = v23;
  if (self->_supportsEnumeration)
    v25 = "enum";
  else
    v25 = "";
  if (self->_useFPFS)
    v26 = ",fpfs";
  else
    v26 = "";
  v56 = v26;
  v57 = v25;
  if (self->_canDisable)
    v27 = ",disable";
  else
    v27 = "";
  if (self->_ejectable)
    v28 = ",eject";
  else
    v28 = "";
  v54 = v28;
  v55 = v27;
  if (self->_usesUniqueItemIdentifiersAcrossDevices)
    v29 = ",uniqueID";
  else
    v29 = "";
  v53 = v29;
  if (self->_supportsPickingFolders)
    v30 = ",pickFolder";
  else
    v30 = "";
  if (self->_readOnly)
    v31 = ",RO";
  else
    v31 = "";
  v50 = v31;
  v51 = v30;
  if (-[NSFileProviderDomain isErasable](self->_domain, "isErasable"))
    v32 = ",erasable";
  else
    v32 = "";
  if (self->_isAvailableSystemWide)
    v33 = ",systemWide";
  else
    v33 = "";
  v48 = v33;
  v49 = v32;
  if (self->_supportedSearchFilters)
    v34 = ",searchFilt";
  else
    v34 = "";
  if (self->_allowsUserControlledEviction)
    v35 = ",userEvict";
  else
    v35 = "";
  v46 = v35;
  v47 = v34;
  if (self->_allowsSystemDeleteAlerts)
    v36 = "";
  else
    v36 = ",noDeleteAlert";
  if (self->_allowsContextualMenuDownloadEntry)
    v37 = ",downloadAllow";
  else
    v37 = "";
  if (self->_supportsSyncingTrash)
    v38 = ",supportsSyncingTrash";
  else
    v38 = "";
  if (self->_supportsSearch)
    v39 = ",search";
  else
    v39 = "";
  if (self->_supportsRemoteVersions)
    v40 = ",remoteVersions";
  else
    v40 = "";
  if (self->_appliesChangesAtomically)
    v41 = ",atomic";
  else
    v41 = "";
  FPKnownFoldersDescription(CFSTR(" supportedKF:"), self->_supportedKnownFolders);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  FPKnownFoldersDescription(CFSTR(" replicatedKF:"), -[NSFileProviderDomain replicatedKnownFolders](self->_domain, "replicatedKnownFolders"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "stringWithFormat:", CFSTR("<%@:%p id:\"%@\" name:\"%@\" urls(%d%s):%@ db:%@%@ state:%s%s%s%s%s%s%s%s features:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%@%@>"), v67, self, v70, v68, v66, v61, v7, v72, v71, v65, v60, v62, v63, v64, v52, v59,
    v58,
    v57,
    v56,
    v55,
    v54,
    v53,
    v51,
    v50,
    v49,
    v48,
    v47,
    v46,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

+ (BOOL)hasProviderDomainAccess
{
  if (hasProviderDomainAccess_onceToken != -1)
    dispatch_once(&hasProviderDomainAccess_onceToken, &__block_literal_global_27);
  return hasProviderDomainAccess_hasEntitlements;
}

- (id)storageURL
{
  void *v2;
  void *v3;

  -[FPProviderDomain storageURLs](self, "storageURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FPProviderDomain)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FPProviderDomain;
  return -[FPProviderDomain init](&v3, sel_init);
}

+ (void)_t_discardCache
{
  id v2;

  +[FPProviderDomainChangesReceiver sharedChangesReceiver](FPProviderDomainChangesReceiver, "sharedChangesReceiver");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_t_discardCache");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)extensionBundleIdentifier
{
  return self->_providerID;
}

- (BOOL)containsPhotos
{
  return -[NSFileProviderDomain containsPhotos](self->_domain, "containsPhotos");
}

- (BOOL)isErasable
{
  return -[NSFileProviderDomain isErasable](self->_domain, "isErasable");
}

- (NSString)iCloudAccountIdentifier
{
  void *v3;

  if (-[NSString isEqualToString:](self->_providerID, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged")))
  {
    -[NSFileProviderDomain identifier](self->_domain, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)disconnectionReason
{
  return -[NSFileProviderDomain _disconnectionReason](self->_domain, "_disconnectionReason");
}

- (BOOL)isConnectedToAppExtension
{
  return self->_disconnectionState == 1;
}

- (NSString)localizedDisconnectionBannerText
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  uint64_t v37;

  switch(self->_disconnectionState)
  {
    case 2uLL:
      v9 = CFSTR("DISCONNECTION_REASON_ERROR");
      goto LABEL_14;
    case 3uLL:
      -[NSFileProviderDomain _disconnectionReason](self->_domain, "_disconnectionReason");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_7;
      v9 = CFSTR("DISCONNECTION_REASON_TEMPORARY");
      goto LABEL_14;
    case 4uLL:
      -[NSFileProviderDomain _disconnectionReason](self->_domain, "_disconnectionReason");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
LABEL_7:
        -[NSFileProviderDomain _disconnectionReason](self->_domain, "_disconnectionReason");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      -[FPProviderDomain providerDisplayName](self, "providerDisplayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      FPLoc(CFSTR("DISCONNECTION_REASON_PERMANENT_%@"), v29, v30, v31, v32, v33, v34, v35, (uint64_t)v14);
      goto LABEL_18;
    case 5uLL:
      -[FPProviderDomain providerDisplayName](self, "providerDisplayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      FPLoc(CFSTR("DISCONNECTION_REASON_ORPHANED_%@"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)v14);
      goto LABEL_18;
    case 6uLL:
      v9 = CFSTR("DISCONNECTION_REASON_LOW_DISK_SPACE");
      goto LABEL_14;
    case 7uLL:
      v9 = CFSTR("DISCONNECTION_REASON_INCOMPATIBLE_DB");
      goto LABEL_14;
    case 8uLL:
      v9 = CFSTR("DISCONNECTION_REASON_FORBIDDEN_MDM");
      goto LABEL_14;
    case 9uLL:
      if (-[FPProviderDomain isiCloudDriveProvider](self, "isiCloudDriveProvider"))
      {
        v9 = CFSTR("DISCONNECTION_EXTERNAL_REJECTED_ICLOUDDRIVE");
LABEL_14:
        FPLoc(v9, (uint64_t)a2, v2, v3, v4, v5, v6, v7, v37);
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v10 = (void *)v13;
      }
      else
      {
        -[FPProviderDomain providerDisplayName](self, "providerDisplayName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        FPLoc(CFSTR("DISCONNECTION_EXTERNAL_REJECTED_%@"), v22, v23, v24, v25, v26, v27, v28, (uint64_t)v14);
LABEL_18:
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      return (NSString *)v10;
    default:
      v10 = 0;
      return (NSString *)v10;
  }
}

- (unint64_t)replicatedKnownFolders
{
  return -[NSFileProviderDomain replicatedKnownFolders](self->_domain, "replicatedKnownFolders");
}

+ (void)selectNewProviderDomain:(id)a3 knownFolders:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a5;
  v8 = a3;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__FPProviderDomain_selectNewProviderDomain_knownFolders_completionHandler___block_invoke;
  v11[3] = &unk_1E4449A88;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "selectNewProviderDomain:knownFolders:completionHandler:", v8, a4, v11);

}

void __75__FPProviderDomain_selectNewProviderDomain_knownFolders_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *MEMORY[0x1E0CB28A8];
  v8 = CFSTR("NSFileProviderErrorDomain");
  v9 = v3;
  v10 = *MEMORY[0x1E0CB2FE0];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_unwrappedErrorForDomains:", v6, v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v7);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (void)setEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v4 = a3;
  self->_enabled = a3;
  v6 = a4;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSFileProviderDomain identifier](self->_domain, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  objc_msgSend(v10, "setEnabled:forDomainIdentifier:providerIdentifier:completionHandler:", v4, v9, self->_providerID, v6);

}

- (void)setHiddenByUser:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v4 = a3;
  self->_hiddenByUser = a3;
  v6 = a4;
  +[FPDaemonConnection remoteObjectProxyWithErrorHandler:](FPDaemonConnection, "remoteObjectProxyWithErrorHandler:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSFileProviderDomain identifier](self->_domain, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  objc_msgSend(v10, "setHiddenByUser:forDomainIdentifier:providerIdentifier:completionHandler:", v4, v9, self->_providerID, v6);

}

- (void)setIndexingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  +[FPDaemonConnection remoteObjectProxyWithErrorHandler:](FPDaemonConnection, "remoteObjectProxyWithErrorHandler:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSFileProviderDomain identifier](self->_domain, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  objc_msgSend(v10, "setIndexingEnabled:forDomainIdentifier:providerIdentifier:completionHandler:", v4, v9, self->_providerID, v6);

}

- (BOOL)isFruitBasketProvider
{
  return -[NSString isEqualToString:](self->_providerID, "isEqualToString:", CFSTR("com.apple.FruitBasket.Provider"));
}

- (BOOL)isEmpty
{
  return 0;
}

- (NSError)error
{
  return -[NSFileProviderDomain error](self->_domain, "error");
}

+ (id)providerDomainForURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14;
  v21 = __Block_byref_object_dispose__14;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  v16 = 0;
  +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__FPProviderDomain_providerDomainForURL_error___block_invoke;
  v10[3] = &unk_1E444CFF0;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v6, "providerDomainForURL:completionHandler:", v5, v10);

  v7 = (void *)v12[5];
  if (a4 && !v7)
  {
    *a4 = objc_retainAutorelease((id)v18[5]);
    v7 = (void *)v12[5];
  }
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __47__FPProviderDomain_providerDomainForURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

+ (void)fetchProviderDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPProviderDomain.m"), 693, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("providerDomainID"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPProviderDomain.m"), 694, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a1, "providerDomainWithID:cachePolicy:completionHandler:", v10, 0, v7);

}

+ (FPProviderDomain)providerDomainWithID:(id)a3 error:(id *)a4
{
  return (FPProviderDomain *)objc_msgSend(a1, "providerDomainWithID:cachePolicy:error:", a3, 0, a4);
}

+ (id)__providerDomainWithIDBuggyNullability:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "providerDomainWithID:cachePolicy:error:", a3, 0, a4);
}

+ (FPProviderDomain)providerDomainWithID:(id)a3 allowCached:(BOOL)a4 completionHandler:(id)a5
{
  return (FPProviderDomain *)objc_msgSend(a1, "providerDomainWithID:cachePolicy:completionHandler:", a3, a4, a5);
}

+ (FPProviderDomain)providerDomainWithID:(id)a3 cachePolicy:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  id v11;
  void *v12;
  FPProviderDomain *result;
  id v14;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  if (!a4)
    goto LABEL_7;
  v14 = 0;
  objc_msgSend(a1, "cachedProviderDomainWithID:cachePolicy:error:", v8, a4, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  v12 = v11;
  if (!v10)
  {
    if (v11)
    {
      v9[2](v9, 0, v11);
      goto LABEL_6;
    }
LABEL_7:
    +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "providerDomainForIdentifier:completionHandler:", v8, v9);
    goto LABEL_8;
  }
  ((void (**)(id, void *, id))v9)[2](v9, v10, 0);
LABEL_6:

LABEL_8:
  return result;
}

+ (FPProviderDomain)providerDomainWithID:(id)a3 allowCached:(BOOL)a4 error:(id *)a5
{
  return (FPProviderDomain *)objc_msgSend(a1, "providerDomainWithID:cachePolicy:error:", a3, a4, a5);
}

+ (id)__providerDomainWithIDBuggyNullability:(id)a3 allowCached:(BOOL)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "providerDomainWithID:cachePolicy:error:", a3, a4, a5);
}

+ (id)providerDomainsWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__14;
  v19 = __Block_byref_object_dispose__14;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__14;
  v13 = __Block_byref_object_dispose__14;
  v14 = 0;
  +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__FPProviderDomain_providerDomainsWithError___block_invoke;
  v8[3] = &unk_1E444D018;
  v8[4] = &v15;
  v8[5] = &v9;
  objc_msgSend(v4, "providerDomainsCompletionHandler:", v8);

  v5 = (void *)v10[5];
  if (a3 && !v5)
  {
    *a3 = objc_retainAutorelease((id)v16[5]);
    v5 = (void *)v10[5];
  }
  v6 = v5;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __45__FPProviderDomain_providerDomainsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v6 = a3;
  objc_msgSend(v6, "allValues");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

+ (id)providerDomainForItem:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;

  objc_msgSend(a3, "providerDomainID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "providerDomainWithID:cachePolicy:error:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)__providerDomainForItemBuggyNullability:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "providerDomainID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "providerDomainWithID:cachePolicy:error:", v6, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)fetchProviderDomainForItem:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a1, "fetchProviderDomainForItem:cachePolicy:completionHandler:", a3, 0, a4);
}

+ (void)fetchProviderDomainForItem:(id)a3 allowCached:(BOOL)a4 completionHandler:(id)a5
{
  objc_msgSend(a1, "fetchProviderDomainForItem:cachePolicy:completionHandler:", a3, a4, a5);
}

+ (void)fetchProviderDomainForItem:(id)a3 cachePolicy:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  objc_msgSend(a3, "providerDomainID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "providerDomainWithID:cachePolicy:completionHandler:", v9, a4, v8);

}

+ (void)removeDomainAndPreserveDataWithID:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a5;
  v8 = a3;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__FPProviderDomain_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke;
  v11[3] = &unk_1E444D040;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "removeDomainAndPreserveDataWithID:mode:completionHandler:", v8, a4, v11);

}

void __77__FPProviderDomain_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "url");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

+ (void)removeDomainWithID:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__FPProviderDomain_removeDomainWithID_mode_completionHandler___block_invoke;
  v10[3] = &unk_1E444ADF0;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "removeDomainAndPreserveDataWithID:mode:completionHandler:", a3, a4, v10);

}

uint64_t __62__FPProviderDomain_removeDomainWithID_mode_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__FPProviderDomain_domainStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

- (void)reconnectAndReimportDomainWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)-[NSFileProviderDomain copy](self->_domain, "copy");
  objc_msgSend(v5, "setDisconnected:", 0);
  objc_msgSend(v5, "_setDisconnectionReason:", 0);
  objc_msgSend(v5, "_setDisconnectionOptions:", 0);
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPProviderDomain providerID](self, "providerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__FPProviderDomain_reconnectAndReimportDomainWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E444D090;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:", v5, v7, 0, 0, 1, MEMORY[0x1E0C9AA60], v9);

}

uint64_t __68__FPProviderDomain_reconnectAndReimportDomainWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_generateDomainIDFromDSID:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  int v7;
  ssize_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[FPProviderDomain _generateDomainIDFromDSID:].cold.2(v3, v4);

  v5 = objc_retainAutorelease(v3);
  v6 = open((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 1048836);
  if (v6 < 0)
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[FPProviderDomain _generateDomainIDFromDSID:].cold.1(v14);

    goto LABEL_13;
  }
  v7 = v6;
  v8 = fgetxattr(v6, "com.apple.ubd.prsid", 0, 0, 0, 0);
  if (v8 < 1 || (v9 = v8, (v10 = malloc_type_calloc(1uLL, v8 + 1, 0xDA64527FuLL)) == 0))
  {
    close(v7);
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v11 = v10;
  if (fpfs_fgetxattr_checked(v7, "com.apple.ubd.prsid", v10, v9) < 1)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "hasSuffix:", CFSTR(".CloudDocs")))
    {
      objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "length") - objc_msgSend(CFSTR(".CloudDocs"), "length"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  free(v11);
  v17 = close(v7);
  if (!v13)
    goto LABEL_13;
  v18 = (void *)MEMORY[0x1A1B00664](v17);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accountsWithAccountType:", v20);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v22)
  {
    v28 = v20;
    v29 = v18;
    v23 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v25, "aa_personID", v28, v29, (_QWORD)v30);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", v13);

        if (v27)
        {
          objc_msgSend(v25, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
      }
      v22 = (void *)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v22)
        continue;
      break;
    }
LABEL_29:
    v20 = v28;
    v18 = v29;
  }

  objc_autoreleasePoolPop(v18);
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_providerDomainIDFromProviderID:domainIdentifier:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"), v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

LABEL_14:
  return v15;
}

+ (id)projectedFPFSMainICloudDriveDomainID
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_lmdURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_fpfsProviderDomainID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "_generateDomainIDFromDSID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (void)accumulatedSizeOfPinnedItemsInDomain:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, _QWORD, void *))a4;
  if ((FPPinningIsEnabledForDomainID(v7) & 1) != 0)
  {
    +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accumulatedSizeOfPinnedItemsInDomain:completion:", v7, v5);
  }
  else
  {
    FPNotSupportedError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v6);
  }

}

+ (void)accumulatedSizeOfItemsInDomain:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accumulatedSizeOfItemsInDomain:completion:", v6, v5);

}

- (unint64_t)supportedKnownFolders
{
  return self->_supportedKnownFolders;
}

- (void)setSupportedKnownFolders:(unint64_t)a3
{
  self->_supportedKnownFolders = a3;
}

- (NSURL)topLevelBundleURL
{
  return self->_topLevelBundleURL;
}

- (BOOL)storageURLsAreInTransientState
{
  return self->_storageURLsAreInTransientState;
}

- (unint64_t)disconnectionState
{
  return self->_disconnectionState;
}

- (BOOL)canDisable
{
  return self->_canDisable;
}

- (BOOL)owningApplicationIsHidden
{
  return self->_owningApplicationIsHidden;
}

- (void)setOwningApplicationIsHidden:(BOOL)a3
{
  self->_owningApplicationIsHidden = a3;
}

- (BOOL)backgroundActivityIsPaused
{
  return self->_backgroundActivityIsPaused;
}

- (NSArray)supportedSearchFilters
{
  return self->_supportedSearchFilters;
}

- (BOOL)usesUniqueItemIdentifiersAcrossDevices
{
  return self->_usesUniqueItemIdentifiersAcrossDevices;
}

- (BOOL)supportsPickingFolders
{
  return self->_supportsPickingFolders;
}

- (NSDictionary)domainUserInfo
{
  return self->_domainUserInfo;
}

- (BOOL)allowsUserControlledEviction
{
  return self->_allowsUserControlledEviction;
}

- (BOOL)allowsSystemDeleteAlerts
{
  return self->_allowsSystemDeleteAlerts;
}

- (BOOL)allowsContextualMenuDownloadEntry
{
  return self->_allowsContextualMenuDownloadEntry;
}

- (BOOL)appliesChangesAtomically
{
  return self->_appliesChangesAtomically;
}

- (int64_t)errorGenerationCount
{
  return self->_errorGenerationCount;
}

- (BOOL)isIndexed
{
  return self->_isIndexed;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (NSFileProviderManager)manager
{
  return self->_manager;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (BOOL)isEjectable
{
  return self->_ejectable;
}

- (NSString)purposeIdentifier
{
  return self->_purposeIdentifier;
}

- (void)setPurposeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_purposeIdentifier, a3);
}

- (NSString)version
{
  return self->_version;
}

- (BOOL)shouldHideExtensionName
{
  return self->_shouldHideExtensionName;
}

- (BOOL)shouldHideDomainDisplayName
{
  return self->_shouldHideDomainDisplayName;
}

- (BOOL)supportsSearch
{
  return self->_supportsSearch;
}

- (BOOL)supportsRemoteVersions
{
  return self->_supportsRemoteVersions;
}

- (void)setSupportsRemoteVersions:(BOOL)a3
{
  self->_supportsRemoteVersions = a3;
}

- (void)domainFullDisplayName
{
  OUTLINED_FUNCTION_0_0(&dword_1A0A34000, a2, a3, "[CRIT] providerDisplayName was nil in domainFullDisplayName, providerId: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __43__FPProviderDomain_hasProviderDomainAccess__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "[ERROR] Cannot get SecureTask", v1, 2u);
}

void __43__FPProviderDomain_hasProviderDomainAccess__block_invoke_cold_2(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a3, (uint64_t)a3, "[ERROR] Cannot fetch entitlements from SecureTask %{public}@ error: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

- (void)domainStateWithCompletionHandler:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_19(&dword_1A0A34000, a4, a3, "[ERROR] Can't adopt persona %@: %@", (uint8_t *)a3);

}

- (void)domainStateWithCompletionHandler:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] won't restore persona: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

+ (void)_generateDomainIDFromDSID:(NSObject *)a1 .cold.1(NSObject *a1)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A0A34000, a1, OS_LOG_TYPE_ERROR, "[ERROR] Failed opening URL: %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_3();
}

+ (void)_generateDomainIDFromDSID:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_prettyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Generating domainID for %@", (uint8_t *)&v5, 0xCu);

}

@end
