@implementation FPDProviderDescriptor

- (BOOL)allowsUserControlledEviction
{
  return self->_allowsUserControlledEviction;
}

- (BOOL)allowsContextualMenuDownloadEntry
{
  return self->_allowsContextualMenuDownloadEntry;
}

- (BOOL)disallowedByMDM
{
  return self->_disallowedByMDM;
}

- (BOOL)usesUniqueItemIdentifiersAcrossDevices
{
  return self->_usesUniqueItemIdentifiersAcrossDevices;
}

- (NSURL)topLevelBundleURL
{
  return self->_topLevelBundleURL;
}

- (BOOL)supportsEnumeration
{
  return self->_supportsEnumeration;
}

- (NSArray)supportedSearchFilters
{
  return self->_supportedSearchFilters;
}

- (NSArray)supportedFileTypes
{
  return self->_supportedFileTypes;
}

- (BOOL)shouldHideExtensionName
{
  return self->_shouldHideExtensionName;
}

- (BOOL)readonly
{
  return self->_readonly;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isAvailableSystemWide
{
  return self->_isAvailableSystemWide;
}

- (NSString)extensionPointVersion
{
  return self->_extensionPointVersion;
}

- (NSURL)extensionBundleURL
{
  return self->_extensionBundleURL;
}

- (BOOL)canToggleDomainVisibility
{
  return self->_canToggleDomainVisibility;
}

- (BOOL)appliesChangesAtomically
{
  return self->_appliesChangesAtomically;
}

- (BOOL)allowsSystemDeleteAlerts
{
  return self->_allowsSystemDeleteAlerts;
}

- (BOOL)supportsPickingFolders
{
  return self->_supportsPickingFolders;
}

- (NSString)topLevelBundleIdentifier
{
  return self->_topLevelBundleIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)defaultDomainVisible
{
  return self->_defaultDomainVisible;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (BOOL)owningApplicationIsManaged
{
  return self->_owningApplicationIsManaged;
}

- (BOOL)enabledByDefault
{
  return self->_enabledByDefault;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPDProviderDescriptor)initWithCoder:(id)a3
{
  id v4;
  FPDProviderDescriptor *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *localizedName;
  uint64_t v10;
  NSString *topLevelBundleIdentifier;
  uint64_t v12;
  NSURL *topLevelBundleURL;
  uint64_t v14;
  NSString *bundleVersion;
  uint64_t v16;
  NSString *extensionPointVersion;
  uint64_t v18;
  NSNumber *downloadPipelineDepth;
  uint64_t v20;
  NSNumber *uploadPipelineDepth;
  uint64_t v22;
  NSNumber *metadataOnlyUploadPipelineDepth;
  uint64_t v24;
  NSURL *extensionBundleURL;
  uint64_t v26;
  NSString *purposeIdentifier;
  uint64_t v28;
  NSString *bundleIdentifierForPushes;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *supportedFileTypes;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSArray *supportedSearchFilters;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSArray *requestedExtendedAttributes;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSArray *extensionStorageURLs;
  uint64_t v50;
  NSUUID *extensionUUID;
  uint64_t v52;
  NSString *documentGroupName;
  void *v54;
  uint64_t v55;
  NSString *personaIdentifier;
  FPDProviderDescriptor *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSString *v64;
  void *v65;
  uint64_t v66;
  NSString *v67;
  objc_super v68;
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[3];

  v72[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)FPDProviderDescriptor;
  v5 = -[FPDProviderDescriptor init](&v68, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localizedName"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_topLevelBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    topLevelBundleIdentifier = v5->_topLevelBundleIdentifier;
    v5->_topLevelBundleIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_topLevelBundleURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    topLevelBundleURL = v5->_topLevelBundleURL;
    v5->_topLevelBundleURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleVersion"));
    v14 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_extensionPointVersion"));
    v16 = objc_claimAutoreleasedReturnValue();
    extensionPointVersion = v5->_extensionPointVersion;
    v5->_extensionPointVersion = (NSString *)v16;

    v5->_readonly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_readonly"));
    v5->_enabledByDefault = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enabledByDefault"));
    v5->_supportsEnumeration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsEnumeration"));
    v5->_defaultDomainVisible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_defaultDomainVisible"));
    v5->_shouldHideExtensionName = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldHideExtensionName"));
    v5->_canToggleDomainVisibility = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_canToggleDomainVisibility"));
    v5->_isAvailableSystemWide = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isAvailableSystemWide"));
    v5->_supportsUnzippedPackages = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsUnzippedPackages"));
    v5->_supportsPickingFolders = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsPickingFolders"));
    v5->_wantsFlattenedPackages = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_wantsFlattenedPackages"));
    v5->_allowsUserControlledEviction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowsUserControlledEviction"));
    v5->_allowsSystemDeleteAlerts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowsSystemDeleteAlerts"));
    v5->_allowsContextualMenuDownloadEntry = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowsContextualMenuDownloadEntry"));
    v5->_appliesChangesAtomically = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_appliesChangesAtomically"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_downloadPipelineDepth"));
    v18 = objc_claimAutoreleasedReturnValue();
    downloadPipelineDepth = v5->_downloadPipelineDepth;
    v5->_downloadPipelineDepth = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uploadPipelineDepth"));
    v20 = objc_claimAutoreleasedReturnValue();
    uploadPipelineDepth = v5->_uploadPipelineDepth;
    v5->_uploadPipelineDepth = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_metadataOnlyUploadPipelineDepth"));
    v22 = objc_claimAutoreleasedReturnValue();
    metadataOnlyUploadPipelineDepth = v5->_metadataOnlyUploadPipelineDepth;
    v5->_metadataOnlyUploadPipelineDepth = (NSNumber *)v22;

    v5->_owningApplicationIsManaged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_owningApplicationIsManaged"));
    v5->_owningApplicationIsHidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_owningApplicationIsHidden"));
    v5->_usesUniqueItemIdentifiersAcrossDevices = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_usesUniqueItemIdentifiersAcrossDevices"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_extensionBundleURL"));
    v24 = objc_claimAutoreleasedReturnValue();
    extensionBundleURL = v5->_extensionBundleURL;
    v5->_extensionBundleURL = (NSURL *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_purposeIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    purposeIdentifier = v5->_purposeIdentifier;
    v5->_purposeIdentifier = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifierForPushes"));
    v28 = objc_claimAutoreleasedReturnValue();
    bundleIdentifierForPushes = v5->_bundleIdentifierForPushes;
    v5->_bundleIdentifierForPushes = (NSString *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v72[0] = objc_opt_class();
    v72[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("_supportedFileTypes"));
    v33 = objc_claimAutoreleasedReturnValue();
    supportedFileTypes = v5->_supportedFileTypes;
    v5->_supportedFileTypes = (NSArray *)v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v71[0] = objc_opt_class();
    v71[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWithArray:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("_supportedSearchFilters"));
    v38 = objc_claimAutoreleasedReturnValue();
    supportedSearchFilters = v5->_supportedSearchFilters;
    v5->_supportedSearchFilters = (NSArray *)v38;

    v40 = (void *)MEMORY[0x1E0C99E60];
    v70[0] = objc_opt_class();
    v70[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setWithArray:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("_requestedExtendedAttributes"));
    v43 = objc_claimAutoreleasedReturnValue();
    requestedExtendedAttributes = v5->_requestedExtendedAttributes;
    v5->_requestedExtendedAttributes = (NSArray *)v43;

    v45 = (void *)MEMORY[0x1E0C99E60];
    v69[0] = objc_opt_class();
    v69[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setWithArray:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("_extensionStorageURLs"));
    v48 = objc_claimAutoreleasedReturnValue();
    extensionStorageURLs = v5->_extensionStorageURLs;
    v5->_extensionStorageURLs = (NSArray *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_extensionUUID"));
    v50 = objc_claimAutoreleasedReturnValue();
    extensionUUID = v5->_extensionUUID;
    v5->_extensionUUID = (NSUUID *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_documentGroupName"));
    v52 = objc_claimAutoreleasedReturnValue();
    documentGroupName = v5->_documentGroupName;
    v5->_documentGroupName = (NSString *)v52;

    v5->_managedPersona = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_managedPersona"));
    if (-[NSString isEqualToString:](v5->_identifier, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"))|| -[NSString isEqualToString:](v5->_identifier, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"))|| v5->_managedPersona)
    {
      objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "userPersonaUniqueString");
      v55 = objc_claimAutoreleasedReturnValue();
      personaIdentifier = v5->_personaIdentifier;
      v5->_personaIdentifier = (NSString *)v55;

      v5->_managedPersona = 1;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_personaIdentifier"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaUniqueString:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v60;
        if (v60 && objc_msgSend(v60, "isEnterprisePersona"))
        {
          objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 2);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "userPersonaUniqueString");
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = v5->_personaIdentifier;
          v5->_personaIdentifier = (NSString *)v63;

          v5->_managedPersona = 1;
        }

      }
      if (!v5->_managedPersona)
      {
        objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "userPersonaUniqueString");
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = v5->_personaIdentifier;
        v5->_personaIdentifier = (NSString *)v66;

      }
    }
    if (!-[FPDProviderDescriptor isPersonaLegit](v5, "isPersonaLegit"))
    {
      v57 = 0;
      goto LABEL_10;
    }
    v5->_wantsBundleBitOnlyPackageDetection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_wantsBundleBitOnlyPackageDetection"));
    v5->_allowsExternalVolumes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowsExternalVolumes"));
  }
  v57 = v5;
LABEL_10:

  return v57;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedName, CFSTR("_localizedName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topLevelBundleIdentifier, CFSTR("_topLevelBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topLevelBundleURL, CFSTR("_topLevelBundleURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleVersion, CFSTR("_bundleVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionPointVersion, CFSTR("_extensionPointVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_readonly, CFSTR("_readonly"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabledByDefault, CFSTR("_enabledByDefault"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsEnumeration, CFSTR("_supportsEnumeration"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_defaultDomainVisible, CFSTR("_defaultDomainVisible"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldHideExtensionName, CFSTR("_shouldHideExtensionName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canToggleDomainVisibility, CFSTR("_canToggleDomainVisibility"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAvailableSystemWide, CFSTR("_isAvailableSystemWide"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsUnzippedPackages, CFSTR("_supportsUnzippedPackages"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_usesUniqueItemIdentifiersAcrossDevices, CFSTR("_usesUniqueItemIdentifiersAcrossDevices"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsPickingFolders, CFSTR("_supportsPickingFolders"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wantsFlattenedPackages, CFSTR("_wantsFlattenedPackages"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsUserControlledEviction, CFSTR("_allowsUserControlledEviction"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsSystemDeleteAlerts, CFSTR("_allowsSystemDeleteAlerts"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsContextualMenuDownloadEntry, CFSTR("_allowsContextualMenuDownloadEntry"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_appliesChangesAtomically, CFSTR("_appliesChangesAtomically"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downloadPipelineDepth, CFSTR("_downloadPipelineDepth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uploadPipelineDepth, CFSTR("_uploadPipelineDepth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadataOnlyUploadPipelineDepth, CFSTR("_metadataOnlyUploadPipelineDepth"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_owningApplicationIsManaged, CFSTR("_owningApplicationIsManaged"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_owningApplicationIsHidden, CFSTR("_owningApplicationIsHidden"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionBundleURL, CFSTR("_extensionBundleURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purposeIdentifier, CFSTR("_purposeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifierForPushes, CFSTR("_bundleIdentifierForPushes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedFileTypes, CFSTR("_supportedFileTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedSearchFilters, CFSTR("_supportedSearchFilters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestedExtendedAttributes, CFSTR("_requestedExtendedAttributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionStorageURLs, CFSTR("_extensionStorageURLs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionUUID, CFSTR("_extensionUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_documentGroupName, CFSTR("_documentGroupName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_managedPersona, CFSTR("_managedPersona"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wantsBundleBitOnlyPackageDetection, CFSTR("_wantsBundleBitOnlyPackageDetection"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsExternalVolumes, CFSTR("_allowsExternalVolumes"));

}

- (FPDProviderDescriptor)initWithExtension:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  FPDProviderDescriptor *v10;
  NSObject *v11;
  id v13;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CA5848]);
  objc_msgSend(v4, "_extensionBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = (void *)objc_msgSend(v5, "initWithURL:error:", v7, &v13);
  v9 = v13;

  if (v8)
  {
    self = -[FPDProviderDescriptor initWithExtensionRecord:](self, "initWithExtensionRecord:", v8);
    v10 = self;
  }
  else
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FPDProviderDescriptor initWithExtension:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (FPDProviderDescriptor)initWithExtensionRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  int v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t j;
  NSObject *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  NSObject *v103;
  NSString *v104;
  NSString *v105;
  NSString **p_personaIdentifier;
  void *v107;
  id v108;
  id v109;
  NSObject *v110;
  NSObject *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  _QWORD *v120;
  _QWORD *v121;
  uint64_t k;
  void *v123;
  char v124;
  _QWORD *v125;
  int v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  NSObject *v131;
  NSObject *v132;
  FPDProviderDescriptor *v133;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  NSObject *v153;
  id obj;
  NSObject *oslog;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  FPDProviderDescriptor *v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  id v166;
  id v167;
  _OWORD v168[4];
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  unsigned __int8 v177;
  objc_super v178;
  uint8_t v179[128];
  uint8_t buf[4];
  void *v181;
  char v182[128];
  void *v183;
  _BYTE v184[128];
  _BYTE v185[128];
  _QWORD v186[5];

  v186[3] = *MEMORY[0x1E0C80C00];
  v160 = a3;
  v178.receiver = self;
  v178.super_class = (Class)FPDProviderDescriptor;
  v161 = -[FPDProviderDescriptor init](&v178, sel_init);

  if (!v161)
    goto LABEL_204;
  objc_msgSend(v160, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProviderDescriptor setExtensionBundleURL:](v161, "setExtensionBundleURL:", v4);

  objc_msgSend(v160, "uniqueIdentifier");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v159)
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[FPDProviderDescriptor initWithExtensionRecord:].cold.1(v161, v14);

    goto LABEL_203;
  }
  objc_msgSend(v160, "bundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProviderDescriptor setBundleVersion:](v161, "setBundleVersion:", v5);

  -[FPDProviderDescriptor setExtensionUUID:](v161, "setExtensionUUID:", v159);
  objc_msgSend(v160, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProviderDescriptor setIdentifier:](v161, "setIdentifier:", v6);

  -[FPDProviderDescriptor identifier](v161, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple."));

  v9 = *MEMORY[0x1E0CAAAA0];
  v10 = (_QWORD *)MEMORY[0x1E0CAAAA8];
  if (v8)
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    v186[0] = *MEMORY[0x1E0CAAB10];
    v186[1] = v9;
    v186[2] = *MEMORY[0x1E0CAAAA8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v186, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v160, "entitlements");
    v156 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v156 = 0;
  }
  objc_msgSend(v156, "objectForKey:ofClass:", v9, objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[FPDProviderDescriptor setPurposeIdentifier:](v161, "setPurposeIdentifier:", v15);
  }
  else
  {
    -[FPDProviderDescriptor identifier](v161, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDProviderDescriptor setPurposeIdentifier:](v161, "setPurposeIdentifier:", v16);

  }
  objc_msgSend(v160, "containingBundleRecord");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v17;
  if (v17)
  {
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDProviderDescriptor setTopLevelBundleIdentifier:](v161, "setTopLevelBundleIdentifier:", v18);

    objc_msgSend(v157, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDProviderDescriptor setTopLevelBundleURL:](v161, "setTopLevelBundleURL:", v19);

    if (v8)
    {
      objc_msgSend(v160, "infoDictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:ofClass:", CFSTR("CFBundleDisplayName"), objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[FPDProviderDescriptor setLocalizedName:](v161, "setLocalizedName:", v21);
      }
      else
      {
        objc_msgSend(v157, "localizedName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPDProviderDescriptor setLocalizedName:](v161, "setLocalizedName:", v28);

      }
    }
    else
    {
      objc_msgSend(v157, "localizedName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDProviderDescriptor setLocalizedName:](v161, "setLocalizedName:", v21);
    }

    -[FPDProviderDescriptor localizedName](v161, "localizedName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length") == 0;

    if (v30)
    {
      fp_current_or_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        -[FPDProviderDescriptor initWithExtensionRecord:].cold.17((uint64_t)v157, v161, v31);

    }
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDProviderDescriptor topLevelBundleIdentifier](v161, "topLevelBundleIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v161->_owningApplicationIsManaged = objc_msgSend(v32, "isAppManaged:", v33);

    v34 = (void *)MEMORY[0x1E0CF9688];
    -[FPDProviderDescriptor topLevelBundleIdentifier](v161, "topLevelBundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "applicationWithBundleIdentifier:", v27);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v161->_owningApplicationIsHidden = objc_msgSend(v35, "isHidden");

  }
  else
  {
    objc_msgSend(v160, "localizedName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDProviderDescriptor setLocalizedName:](v161, "setLocalizedName:", v22);

    -[FPDProviderDescriptor localizedName](v161, "localizedName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23 == 0;

    if (v24)
    {
      fp_current_or_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[FPDProviderDescriptor initWithExtensionRecord:].cold.16(v161, v25);

    }
    -[FPDProviderDescriptor identifier](v161, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDProviderDescriptor setTopLevelBundleIdentifier:](v161, "setTopLevelBundleIdentifier:", v26);

    -[FPDProviderDescriptor extensionBundleURL](v161, "extensionBundleURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDProviderDescriptor setTopLevelBundleURL:](v161, "setTopLevelBundleURL:", v27);
  }

  objc_msgSend(v156, "objectForKey:ofClass:", *v10, objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    -[FPDProviderDescriptor setBundleIdentifierForPushes:](v161, "setBundleIdentifierForPushes:", v36);
  }
  else
  {
    -[FPDProviderDescriptor topLevelBundleIdentifier](v161, "topLevelBundleIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDProviderDescriptor setBundleIdentifierForPushes:](v161, "setBundleIdentifierForPushes:", v37);

  }
  v177 = 0;
  +[FPDProviderDescriptor personaFromExtensionRecord:managedPersona:](FPDProviderDescriptor, "personaFromExtensionRecord:managedPersona:", v160, &v177);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDProviderDescriptor setPersonaIdentifier:](v161, "setPersonaIdentifier:", v38);

  -[FPDProviderDescriptor setManagedPersona:](v161, "setManagedPersona:", v177);
  fp_current_or_default_log();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    -[FPDProviderDescriptor initWithExtensionRecord:].cold.15(v161, v39);

  if (v8)
  {
    -[FPDProviderDescriptor personaIdentifier](v161, "personaIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40 == 0;

    if (v41)
    {
      objc_msgSend(v160, "bundleIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v50, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged")))
      {

      }
      else
      {
        objc_msgSend(v160, "bundleIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));

        if (!v54)
          goto LABEL_35;
      }
      fp_current_or_default_log();
      oslog = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        -[FPDProviderDescriptor identifier](v161, "identifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v181 = v55;
        _os_log_impl(&dword_1CF55F000, oslog, OS_LOG_TYPE_DEFAULT, "[NOTICE] No enterprise enrolment, dropping %{public}@ registration", buf, 0xCu);

      }
      v49 = 1;
      goto LABEL_201;
    }
  }
LABEL_35:
  if (!-[FPDProviderDescriptor isPersonaLegit](v161, "isPersonaLegit"))
  {
    v49 = 1;
    goto LABEL_202;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  oslog = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "infoDictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  if (v158)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
      v153 = objc_claimAutoreleasedReturnValue();
      if (v153)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_44;
        fp_current_or_default_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[FPDProviderDescriptor initWithExtensionRecord:].cold.13((uint64_t)v153, v43);

      }
      v153 = 0;
LABEL_44:
      objc_opt_class();
      objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderSupportsEnumeration"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDProviderDescriptor setSupportsEnumeration:](v161, "setSupportsEnumeration:", objc_msgSend(v44, "BOOLValue"));

      objc_opt_class();
      objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderOnlyVisibleInParentApplication"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDProviderDescriptor setIsAvailableSystemWide:](v161, "setIsAvailableSystemWide:", objc_msgSend(v45, "BOOLValue") ^ 1);

      objc_opt_class();
      objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderReadOnly"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDProviderDescriptor setReadonly:](v161, "setReadonly:", objc_msgSend(v46, "BOOLValue"));

      objc_opt_class();
      objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderEnabledByDefault"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = v47;
      if (v47)
        v48 = objc_msgSend(v47, "BOOLValue");
      else
        v48 = 0;
      -[FPDProviderDescriptor setEnabledByDefault:](v161, "setEnabledByDefault:", v48);
      objc_opt_class();
      objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderWantsFlattenedPackages"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = v56;
      if (v56)
        v57 = objc_msgSend(v56, "BOOLValue");
      else
        v57 = 0;
      -[FPDProviderDescriptor setWantsFlattenedPackages:](v161, "setWantsFlattenedPackages:", v57);
      objc_opt_class();
      objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderAllowsUserControlledEviction"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = v58;
      if (v58)
        v59 = objc_msgSend(v58, "BOOLValue");
      else
        v59 = 1;
      -[FPDProviderDescriptor setAllowsUserControlledEviction:](v161, "setAllowsUserControlledEviction:", v59);
      objc_opt_class();
      objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderAllowsSystemDeleteAlerts"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = v60;
      if (v60)
        v61 = objc_msgSend(v60, "BOOLValue");
      else
        v61 = 1;
      -[FPDProviderDescriptor setAllowsSystemDeleteAlerts:](v161, "setAllowsSystemDeleteAlerts:", v61);
      objc_opt_class();
      objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderAllowsContextualMenuDownloadEntry"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = v62;
      if (v62)
        v63 = objc_msgSend(v62, "BOOLValue");
      else
        v63 = 1;
      -[FPDProviderDescriptor setAllowsContextualMenuDownloadEntry:](v161, "setAllowsContextualMenuDownloadEntry:", v63);
      objc_opt_class();
      objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderAppliesChangesAtomically"));
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDProviderDescriptor setAppliesChangesAtomically:](v161, "setAppliesChangesAtomically:", objc_msgSend(v144, "BOOLValue"));
      objc_opt_class();
      objectForKeyOfClass(v158, (uint64_t)CFSTR("NSFileProviderDefaultDomainVisible"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v151)
      {
        objc_opt_class();
        objectForKeyOfClass(v158, (uint64_t)CFSTR("NSFileProviderDefaultDomainEnabled"));
        v151 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[FPDProviderDescriptor identifier](v161, "identifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));

      if (v65)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", FPIsCloudDocsWithFPFSEnabled() ^ 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[FPDProviderDescriptor identifier](v161, "identifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));

        if (!v68)
        {
LABEL_79:
          v69 = 0;
          v66 = v151;
          if (!v151)
          {
            -[FPDProviderDescriptor setDefaultDomainVisible:](v161, "setDefaultDomainVisible:", 1, 0);
LABEL_81:
            objc_opt_class();
            objectForKeyOfClass(v158, (uint64_t)CFSTR("NSFileProviderHideExtensionName"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[FPDProviderDescriptor setShouldHideExtensionName:](v161, "setShouldHideExtensionName:", objc_msgSend(v71, "BOOLValue"));

            objc_opt_class();
            objectForKeyOfClass(v158, (uint64_t)CFSTR("NSFileProviderCanToggleDomainVisibility"));
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v143 = v72;
            if (v72)
              v73 = objc_msgSend(v72, "BOOLValue");
            else
              v73 = 1;
            -[FPDProviderDescriptor setCanToggleDomainVisibility:](v161, "setCanToggleDomainVisibility:", v73);
            objc_opt_class();
            objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionPointVersion"));
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v142, "isEqualToString:", CFSTR("2.0")))
            {
              -[FPDProviderDescriptor setSupportsEnumeration:](v161, "setSupportsEnumeration:", 1);
              -[FPDProviderDescriptor setIsAvailableSystemWide:](v161, "setIsAvailableSystemWide:", 1);
            }
            objc_opt_class();
            objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderSupportsUnzippedPackages"));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v141 = v74;
            if (v74)
              v75 = objc_msgSend(v74, "BOOLValue");
            else
              v75 = 0;
            -[FPDProviderDescriptor setSupportsUnzippedPackages:](v161, "setSupportsUnzippedPackages:", v75);
            objc_opt_class();
            objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderSupportsPickingFolders"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v140 = v76;
            if (v76)
              v77 = objc_msgSend(v76, "BOOLValue");
            else
              v77 = 0;
            -[FPDProviderDescriptor setSupportsPickingFolders:](v161, "setSupportsPickingFolders:", v77);
            objc_opt_class();
            objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionWantsBundleBitOnlyPackageDetection"));
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            if (v150
              && (objc_msgSend(v160, "bundleIdentifier"),
                  v78 = (void *)objc_claimAutoreleasedReturnValue(),
                  v79 = objc_msgSend(v78, "hasPrefix:", CFSTR("com.apple.")),
                  v78,
                  v79))
            {
              v80 = objc_msgSend(v150, "BOOLValue");
            }
            else
            {
              v80 = 0;
            }
            -[FPDProviderDescriptor setWantsBundleBitOnlyPackageDetection:](v161, "setWantsBundleBitOnlyPackageDetection:", v80);
            objc_opt_class();
            objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderAllowsExternalVolumes"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = v81;
            if (v81)
              v82 = objc_msgSend(v81, "BOOLValue");
            else
              v82 = 0;
            -[FPDProviderDescriptor setAllowsExternalVolumes:](v161, "setAllowsExternalVolumes:", v82);
            objc_opt_class();
            objectForKeyOfClass(v158, (uint64_t)CFSTR("NSExtensionFileProviderAdditionalSyncableExtendedAttributes"));
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            -[FPDProviderDescriptor setRequestedExtendedAttributes:](v161, "setRequestedExtendedAttributes:", v83);

            -[FPDProviderDescriptor requestedExtendedAttributes](v161, "requestedExtendedAttributes");
            v84 = (void *)objc_claimAutoreleasedReturnValue();

            if (v84)
            {
              v175 = 0u;
              v176 = 0u;
              v173 = 0u;
              v174 = 0u;
              -[FPDProviderDescriptor requestedExtendedAttributes](v161, "requestedExtendedAttributes");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v173, v185, 16);
              if (v86)
              {
                v87 = *(_QWORD *)v174;
                while (2)
                {
                  for (i = 0; i != v86; ++i)
                  {
                    if (*(_QWORD *)v174 != v87)
                      objc_enumerationMutation(v85);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      fp_current_or_default_log();
                      v89 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                        -[FPDProviderDescriptor initWithExtensionRecord:].cold.12();

                      -[FPDProviderDescriptor setRequestedExtendedAttributes:](v161, "setRequestedExtendedAttributes:", 0);
                      goto LABEL_112;
                    }
                  }
                  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v173, v185, 16);
                  if (v86)
                    continue;
                  break;
                }
              }
LABEL_112:

            }
            -[NSObject objectForKeyedSubscript:](v153, "objectForKeyedSubscript:", CFSTR("NSFileProviderSupportedFileTypes"));
            obj = (id)objc_claimAutoreleasedReturnValue();
            if (obj)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v171 = 0u;
                v172 = 0u;
                v169 = 0u;
                v170 = 0u;
                obj = obj;
                v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v184, 16);
                if (v90)
                {
                  v91 = *(_QWORD *)v170;
                  while (2)
                  {
                    for (j = 0; j != v90; ++j)
                    {
                      if (*(_QWORD *)v170 != v91)
                        objc_enumerationMutation(obj);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        fp_current_or_default_log();
                        v94 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                          -[FPDProviderDescriptor initWithExtensionRecord:].cold.10();

                        objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
                        v95 = (void *)objc_claimAutoreleasedReturnValue();
                        v183 = v95;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v183, 1);
                        v96 = (void *)objc_claimAutoreleasedReturnValue();
                        -[FPDProviderDescriptor setSupportedFileTypes:](v161, "setSupportedFileTypes:", v96);

                        goto LABEL_131;
                      }
                    }
                    v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v184, 16);
                    if (v90)
                      continue;
                    break;
                  }
                }

                -[FPDProviderDescriptor setSupportedFileTypes:](v161, "setSupportedFileTypes:", obj);
              }
              else
              {
                fp_current_or_default_log();
                v93 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  -[FPDProviderDescriptor initWithExtensionRecord:].cold.11((uint64_t)obj, v161, v93);

              }
            }
            else
            {
LABEL_131:
              obj = 0;
            }
            v137 = (void *)objc_opt_new();
            objc_msgSend(v156, "objectForKey:ofClass:", *MEMORY[0x1E0CAAB10], objc_opt_class());
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v138 = v97;
            if (v97)
            {
              memset(v168, 0, sizeof(v168));
              v152 = v97;
              if (!objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", v168, v182, 16))
              {
LABEL_138:

                -[FPDProviderDescriptor setHasExplicitExtensionStorageURLs:](v161, "setHasExplicitExtensionStorageURLs:", 1);
                goto LABEL_158;
              }
              v98 = **((id **)&v168[0] + 1);
              if (objc_msgSend(v98, "hasPrefix:", CFSTR("/")))
              {
                objc_msgSend(v98, "substringFromIndex:", 1);
                v99 = objc_claimAutoreleasedReturnValue();

                v98 = (id)v99;
              }
              objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "URLByAppendingPathComponent:isDirectory:", v98, 1);
              v101 = (void *)objc_claimAutoreleasedReturnValue();

              if (v101)
              {
                objc_msgSend(v137, "addObject:", v101);

                goto LABEL_138;
              }
              fp_current_or_default_log();
              v103 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
                -[FPDProviderDescriptor initWithExtensionRecord:].cold.9();
LABEL_198:
              v49 = 1;
LABEL_199:

              v52 = v153;
              goto LABEL_200;
            }
            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("NSExtensionFileProviderDocumentGroup"));
            v152 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "currentPersona");
            v103 = objc_claimAutoreleasedReturnValue();

            v167 = 0;
            -[NSObject userPersonaUniqueString](v103, "userPersonaUniqueString");
            v104 = (NSString *)objc_claimAutoreleasedReturnValue();
            v105 = v104;
            p_personaIdentifier = &v161->_personaIdentifier;
            if (v104 == v161->_personaIdentifier
              || -[NSString isEqualToString:](v104, "isEqualToString:")
              || !voucher_process_can_use_arbitrary_personas())
            {
              v98 = 0;
            }
            else
            {
              v166 = 0;
              v107 = (void *)-[NSObject copyCurrentPersonaContextWithError:](v103, "copyCurrentPersonaContextWithError:", &v166);
              v108 = v166;
              v109 = v167;
              v167 = v107;

              if (v108)
              {
                fp_current_or_default_log();
                v110 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
                  -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:].cold.2();

              }
              -[NSObject generateAndRestorePersonaContextWithPersonaUniqueString:](v103, "generateAndRestorePersonaContextWithPersonaUniqueString:", *p_personaIdentifier);
              v98 = (id)objc_claimAutoreleasedReturnValue();

              if (v98)
              {
                fp_current_or_default_log();
                v111 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                  -[FPDProviderDescriptor initWithExtensionRecord:].cold.7(p_personaIdentifier, (uint64_t)v98, v111);

              }
            }
            if (v152)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "fp_uncachedContainerURLForSecurityApplicationGroupIdentifier:", v152);
                v112 = objc_claimAutoreleasedReturnValue();
                if (v112)
                {
                  objc_msgSend(v160, "groupContainerURLs");
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v113, "objectForKeyedSubscript:", v152);
                  v114 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v114)
                  {
                    -[NSObject URLByAppendingPathComponent:isDirectory:](v112, "URLByAppendingPathComponent:isDirectory:", CFSTR("File Provider Storage"), 1);
                    v115 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v115)
                    {
                      objc_msgSend(v137, "addObject:", v115);
                      -[FPDProviderDescriptor setDocumentGroupName:](v161, "setDocumentGroupName:", v152);

                      goto LABEL_157;
                    }
                    fp_current_or_default_log();
                    v132 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
                      -[FPDProviderDescriptor initWithExtensionRecord:].cold.5();

                  }
                  else
                  {
                    fp_current_or_default_log();
                    v131 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
                      -[FPDProviderDescriptor initWithExtensionRecord:].cold.4();

                  }
                }
                else
                {
                  fp_current_or_default_log();
                  v112 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                    -[FPDProviderDescriptor initWithExtensionRecord:].cold.3();
                }
              }
              else
              {
                fp_current_or_default_log();
                v112 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                {
                  v129 = (id)objc_opt_class();
                  -[FPDProviderDescriptor identifier](v161, "identifier");
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FPDProviderDescriptor initWithExtensionRecord:].cold.6(v129, v130, (uint64_t)buf, v112);
                }
              }

              _FPRestorePersona();
              goto LABEL_198;
            }
LABEL_157:

            _FPRestorePersona();
LABEL_158:
            -[FPDProviderDescriptor setExtensionStorageURLs:](v161, "setExtensionStorageURLs:", v137);
            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("NSExtensionFileProviderSupportedSearchCapabilities"));
            v152 = (id)objc_claimAutoreleasedReturnValue();
            if (v152)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "addObject:", *MEMORY[0x1E0CAABB8]);
                v164 = 0u;
                v165 = 0u;
                v162 = 0u;
                v163 = 0u;
                v117 = v152;
                v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v162, v179, 16);
                if (v118)
                {
                  v119 = *(_QWORD *)v163;
                  v120 = (_QWORD *)MEMORY[0x1E0CAABB0];
                  v121 = (_QWORD *)MEMORY[0x1E0CAABC0];
                  do
                  {
                    for (k = 0; k != v118; ++k)
                    {
                      if (*(_QWORD *)v163 != v119)
                        objc_enumerationMutation(v117);
                      v123 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * k);
                      v124 = objc_msgSend(v123, "isEqualToString:", CFSTR("NSExtensionFileProviderSearchByContentType"));
                      v125 = v120;
                      if ((v124 & 1) == 0)
                      {
                        v126 = objc_msgSend(v123, "isEqualToString:", CFSTR("NSExtensionFileProviderSearchScopedToDirectory"));
                        v125 = v121;
                        if (!v126)
                          continue;
                      }
                      objc_msgSend(v116, "addObject:", *v125);
                    }
                    v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v162, v179, 16);
                  }
                  while (v118);
                }

                -[FPDProviderDescriptor setSupportedSearchFilters:](v161, "setSupportedSearchFilters:", v116);
              }
            }
            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("NSFileProviderUsesUniqueItemIdentifiersAcrossDevices"));
            v98 = (id)objc_claimAutoreleasedReturnValue();
            if (v98)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                -[FPDProviderDescriptor setUsesUniqueItemIdentifiersAcrossDevices:](v161, "setUsesUniqueItemIdentifiersAcrossDevices:", objc_msgSend(v98, "BOOLValue"));
            }
            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("NSExtensionFileProviderDownloadPipelineDepth"));
            v103 = objc_claimAutoreleasedReturnValue();
            if (v103)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                -[FPDProviderDescriptor setDownloadPipelineDepth:](v161, "setDownloadPipelineDepth:", v103);
            }
            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("NSExtensionFileProviderUploadPipelineDepth"));
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            if (v127)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                -[FPDProviderDescriptor setUploadPipelineDepth:](v161, "setUploadPipelineDepth:", v127);
            }
            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("NSExtensionFileProviderMetadataOnlyUploadPipelineDepth"));
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            if (v128)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                -[FPDProviderDescriptor setMetadataOnlyUploadPipelineDepth:](v161, "setMetadataOnlyUploadPipelineDepth:", v128);
            }

            v49 = 0;
            goto LABEL_199;
          }
LABEL_80:
          v70 = objc_msgSend(v66, "BOOLValue", v69);
          -[FPDProviderDescriptor setDefaultDomainVisible:](v161, "setDefaultDomainVisible:", v70, v135);
          goto LABEL_81;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", FPIsCloudDocsWithFPFSEnabled());
        v66 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v69 = v66;
      if (v66)
        goto LABEL_80;
      goto LABEL_79;
    }
    fp_current_or_default_log();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      -[FPDProviderDescriptor initWithExtensionRecord:].cold.14((uint64_t)v158, v161, v51);
      goto LABEL_53;
    }
LABEL_54:
    v49 = 1;
    goto LABEL_200;
  }
  fp_current_or_default_log();
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    goto LABEL_54;
  -[FPDProviderDescriptor initWithExtensionRecord:].cold.2(v161, v51);
LABEL_53:
  v49 = 1;
  v52 = v51;
LABEL_200:

LABEL_201:
LABEL_202:

  if (!v49)
  {
LABEL_204:
    v133 = v161;
    goto LABEL_205;
  }
LABEL_203:
  v133 = 0;
LABEL_205:

  return v133;
}

- (BOOL)isEqual:(id)a3
{
  FPDProviderDescriptor *v4;
  uint64_t v5;
  BOOL v6;
  FPDProviderDescriptor *v7;
  NSUUID *extensionUUID;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _BOOL4 owningApplicationIsHidden;

  v4 = (FPDProviderDescriptor *)a3;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_14;
  }
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    extensionUUID = self->_extensionUUID;
    -[FPDProviderDescriptor extensionUUID](v7, "extensionUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(extensionUUID) = -[NSUUID isEqual:](extensionUUID, "isEqual:", v9);

    if ((_DWORD)extensionUUID)
    {
      -[FPDProviderDescriptor personaIdentifier](self, "personaIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        -[FPDProviderDescriptor personaIdentifier](v7, "personaIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_10;
      }
      -[FPDProviderDescriptor personaIdentifier](self, "personaIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDProviderDescriptor personaIdentifier](v7, "personaIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (v10)
      {

        if (v13)
        {
LABEL_10:
          owningApplicationIsHidden = self->_owningApplicationIsHidden;
          v6 = owningApplicationIsHidden == -[FPDProviderDescriptor owningApplicationIsHidden](v7, "owningApplicationIsHidden");
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {

        if ((v13 & 1) != 0)
          goto LABEL_10;
      }
    }
    v6 = 0;
    goto LABEL_13;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

+ (id)personaFromExtensionRecord:(id)a3 managedPersona:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  *a4 = 0;
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged")))
  {

LABEL_4:
    v9 = (void *)MEMORY[0x1E0DC5F00];
    v10 = 2;
LABEL_5:
    objc_msgSend(v9, "personaAttributesForPersonaType:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userPersonaUniqueString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));

  if (v8)
    goto LABEL_4;
  objc_msgSend(v5, "managedPersonas");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  v9 = (void *)MEMORY[0x1E0DC5F00];
  if (!v15)
  {
    v10 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userPersonaUniqueString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "managedPersonas");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "managedPersonas");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20 >= 2)
  {
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      +[FPDProviderDescriptor personaFromExtensionRecord:managedPersona:].cold.1(v5, v21);

  }
  if ((objc_msgSend(v12, "isEqualToString:", v17) & 1) == 0)
  {
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v23 = 138412802;
      v24 = v5;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v17;
      _os_log_fault_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_FAULT, "[CRIT] extension record %@ has a persona %@ not matching the managed persona %@", (uint8_t *)&v23, 0x20u);
    }

  }
  *a4 = 1;

LABEL_6:
  return v12;
}

- (BOOL)isPersonaLegit
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[FPDProviderDescriptor personaIdentifier](self, "personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    return 1;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSharedIPad");

  if ((v5 & 1) != 0)
    return 1;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[FPDProviderDescriptor identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Extension without persona out of the EDU case, dropping %{public}@ registration", (uint8_t *)&v9, 0xCu);

  }
  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FPDProviderDescriptor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (void)setTopLevelBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelBundleIdentifier, a3);
}

- (void)setTopLevelBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelBundleURL, a3);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bundleVersion, a3);
}

- (void)setExtensionPointVersion:(id)a3
{
  objc_storeStrong((id *)&self->_extensionPointVersion, a3);
}

- (void)setReadonly:(BOOL)a3
{
  self->_readonly = a3;
}

- (void)setEnabledByDefault:(BOOL)a3
{
  self->_enabledByDefault = a3;
}

- (void)setSupportsEnumeration:(BOOL)a3
{
  self->_supportsEnumeration = a3;
}

- (void)setDefaultDomainVisible:(BOOL)a3
{
  self->_defaultDomainVisible = a3;
}

- (void)setShouldHideExtensionName:(BOOL)a3
{
  self->_shouldHideExtensionName = a3;
}

- (void)setCanToggleDomainVisibility:(BOOL)a3
{
  self->_canToggleDomainVisibility = a3;
}

- (void)setIsAvailableSystemWide:(BOOL)a3
{
  self->_isAvailableSystemWide = a3;
}

- (void)setUsesUniqueItemIdentifiersAcrossDevices:(BOOL)a3
{
  self->_usesUniqueItemIdentifiersAcrossDevices = a3;
}

- (BOOL)supportsUnzippedPackages
{
  return self->_supportsUnzippedPackages;
}

- (void)setSupportsUnzippedPackages:(BOOL)a3
{
  self->_supportsUnzippedPackages = a3;
}

- (BOOL)hasExplicitExtensionStorageURLs
{
  return self->_hasExplicitExtensionStorageURLs;
}

- (void)setHasExplicitExtensionStorageURLs:(BOOL)a3
{
  self->_hasExplicitExtensionStorageURLs = a3;
}

- (void)setSupportsPickingFolders:(BOOL)a3
{
  self->_supportsPickingFolders = a3;
}

- (BOOL)wantsFlattenedPackages
{
  return self->_wantsFlattenedPackages;
}

- (void)setWantsFlattenedPackages:(BOOL)a3
{
  self->_wantsFlattenedPackages = a3;
}

- (void)setAllowsUserControlledEviction:(BOOL)a3
{
  self->_allowsUserControlledEviction = a3;
}

- (void)setAllowsContextualMenuDownloadEntry:(BOOL)a3
{
  self->_allowsContextualMenuDownloadEntry = a3;
}

- (void)setAllowsSystemDeleteAlerts:(BOOL)a3
{
  self->_allowsSystemDeleteAlerts = a3;
}

- (void)setAppliesChangesAtomically:(BOOL)a3
{
  self->_appliesChangesAtomically = a3;
}

- (NSNumber)downloadPipelineDepth
{
  return self->_downloadPipelineDepth;
}

- (void)setDownloadPipelineDepth:(id)a3
{
  objc_storeStrong((id *)&self->_downloadPipelineDepth, a3);
}

- (NSNumber)uploadPipelineDepth
{
  return self->_uploadPipelineDepth;
}

- (void)setUploadPipelineDepth:(id)a3
{
  objc_storeStrong((id *)&self->_uploadPipelineDepth, a3);
}

- (NSNumber)metadataOnlyUploadPipelineDepth
{
  return self->_metadataOnlyUploadPipelineDepth;
}

- (void)setMetadataOnlyUploadPipelineDepth:(id)a3
{
  objc_storeStrong((id *)&self->_metadataOnlyUploadPipelineDepth, a3);
}

- (void)setOwningApplicationIsManaged:(BOOL)a3
{
  self->_owningApplicationIsManaged = a3;
}

- (void)setDisallowedByMDM:(BOOL)a3
{
  self->_disallowedByMDM = a3;
}

- (BOOL)owningApplicationIsHidden
{
  return self->_owningApplicationIsHidden;
}

- (void)setOwningApplicationIsHidden:(BOOL)a3
{
  self->_owningApplicationIsHidden = a3;
}

- (NSString)purposeIdentifier
{
  return self->_purposeIdentifier;
}

- (void)setPurposeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_purposeIdentifier, a3);
}

- (NSString)bundleIdentifierForPushes
{
  return self->_bundleIdentifierForPushes;
}

- (void)setBundleIdentifierForPushes:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifierForPushes, a3);
}

- (void)setExtensionBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_extensionBundleURL, a3);
}

- (NSUUID)extensionUUID
{
  return self->_extensionUUID;
}

- (void)setExtensionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_extensionUUID, a3);
}

- (void)setSupportedFileTypes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedFileTypes, a3);
}

- (void)setSupportedSearchFilters:(id)a3
{
  objc_storeStrong((id *)&self->_supportedSearchFilters, a3);
}

- (NSArray)extensionStorageURLs
{
  return self->_extensionStorageURLs;
}

- (void)setExtensionStorageURLs:(id)a3
{
  objc_storeStrong((id *)&self->_extensionStorageURLs, a3);
}

- (NSString)documentGroupName
{
  return self->_documentGroupName;
}

- (void)setDocumentGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_documentGroupName, a3);
}

- (NSArray)requestedExtendedAttributes
{
  return self->_requestedExtendedAttributes;
}

- (void)setRequestedExtendedAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_requestedExtendedAttributes, a3);
}

- (void)setPersonaIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_personaIdentifier, a3);
}

- (BOOL)wantsBundleBitOnlyPackageDetection
{
  return self->_wantsBundleBitOnlyPackageDetection;
}

- (void)setWantsBundleBitOnlyPackageDetection:(BOOL)a3
{
  self->_wantsBundleBitOnlyPackageDetection = a3;
}

- (BOOL)allowsExternalVolumes
{
  return self->_allowsExternalVolumes;
}

- (void)setAllowsExternalVolumes:(BOOL)a3
{
  self->_allowsExternalVolumes = a3;
}

- (BOOL)managedPersona
{
  return self->_managedPersona;
}

- (void)setManagedPersona:(BOOL)a3
{
  self->_managedPersona = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedExtendedAttributes, 0);
  objc_storeStrong((id *)&self->_documentGroupName, 0);
  objc_storeStrong((id *)&self->_extensionStorageURLs, 0);
  objc_storeStrong((id *)&self->_supportedSearchFilters, 0);
  objc_storeStrong((id *)&self->_supportedFileTypes, 0);
  objc_storeStrong((id *)&self->_extensionUUID, 0);
  objc_storeStrong((id *)&self->_extensionBundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForPushes, 0);
  objc_storeStrong((id *)&self->_purposeIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataOnlyUploadPipelineDepth, 0);
  objc_storeStrong((id *)&self->_uploadPipelineDepth, 0);
  objc_storeStrong((id *)&self->_downloadPipelineDepth, 0);
  objc_storeStrong((id *)&self->_extensionPointVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_topLevelBundleURL, 0);
  objc_storeStrong((id *)&self->_topLevelBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithExtension:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_1CF55F000, v0, v1, "[ERROR] extension %@ doesn't have a record (%@)");
  OUTLINED_FUNCTION_8_0();
}

- (void)initWithExtensionRecord:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "extensionBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v5, "[ERROR] extension at %@ has no uuid", v6);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExtensionRecord:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] \"NSExtension\" does not exist -- extension identifier: %@", v5);

  OUTLINED_FUNCTION_10_1();
}

- (void)initWithExtensionRecord:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] Cannot deduce the provided items URL for %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)initWithExtensionRecord:.cold.4()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2114;
  v4 = v0;
  v5 = 2114;
  v6 = CFSTR("NSExtensionFileProviderDocumentGroup");
  OUTLINED_FUNCTION_9_1(&dword_1CF55F000, v1, (uint64_t)v1, "[ERROR] Extension %@ doesn't have a group container for document group %{public}@ specified via %{public}@. Ignoring the extension.", v2);
  OUTLINED_FUNCTION_10_1();
}

- (void)initWithExtensionRecord:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] Cannot deduce the provider storage URL for %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)initWithExtensionRecord:(uint64_t)a3 .cold.6(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543874;
  *(_QWORD *)(a3 + 4) = CFSTR("NSExtensionFileProviderDocumentGroup");
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a1;
  *(_WORD *)(a3 + 22) = 2114;
  *(_QWORD *)(a3 + 24) = a2;
  OUTLINED_FUNCTION_9_1(&dword_1CF55F000, a4, a3, "[ERROR] invalid type for key \"%{public}@\" (expected: NSString, actual: %{public}@) -- extension identifier: %{public}@", (uint8_t *)a3);

}

- (void)initWithExtensionRecord:(NSObject *)a3 .cold.7(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_1(&dword_1CF55F000, a2, a3, "[ERROR] Can't adopt persona %@: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_8_0();
}

- (void)initWithExtensionRecord:.cold.9()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1CF55F000, v0, OS_LOG_TYPE_FAULT, "[CRIT] got nil URL for directory at path %@", v1, 0xCu);
  OUTLINED_FUNCTION_8_0();
}

- (void)initWithExtensionRecord:.cold.10()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_1CF55F000, v0, v1, "[ERROR] %@ contains supported file type that's not of type NSString: %@");
  OUTLINED_FUNCTION_8_0();
}

- (void)initWithExtensionRecord:(NSObject *)a3 .cold.11(uint64_t a1, void *a2, NSObject *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (id)objc_opt_class();
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a3, v7, "[ERROR] invalid type for key \"NSFileProviderSupportedFileTypes\" (expected: NSArray, actual: %@) -- extension identifier: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExtensionRecord:.cold.12()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_1CF55F000, v0, v1, "[ERROR] %@ contains an interesting extended attribute that is not a string: %@");
  OUTLINED_FUNCTION_8_0();
}

- (void)initWithExtensionRecord:(uint64_t)a1 .cold.13(uint64_t a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (id)objc_opt_class();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] extension attributes of bad type %@", v5);

  OUTLINED_FUNCTION_10_1();
}

- (void)initWithExtensionRecord:(NSObject *)a3 .cold.14(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a3, v6, "[ERROR] invalid type for key \"NSExtension\" (expected: NSDictionary, actual: %@) -- extension identifier: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExtensionRecord:(void *)a1 .cold.15(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "personaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "managedPersona");
  v7 = CFSTR("FP deduced");
  v8 = 138543874;
  v9 = v4;
  v10 = 2112;
  if (v6)
    v7 = CFSTR("LS provided");
  v11 = v5;
  v12 = 2112;
  v13 = v7;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Extension %{public}@ has persona %@ (%@)", (uint8_t *)&v8, 0x20u);

}

- (void)initWithExtensionRecord:(void *)a1 .cold.16(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "extensionBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v5, "[ERROR] embedded extension at %{public}@ has no display name", v6);

  OUTLINED_FUNCTION_2();
}

- (void)initWithExtensionRecord:(NSObject *)a3 .cold.17(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "extensionBundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_8_2(&dword_1CF55F000, a3, v7, "[CRIT] containing bundle %{public}@ for extension at %{public}@ has empty display name", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

+ (void)personaFromExtensionRecord:(void *)a1 managedPersona:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "managedPersonas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_2(&dword_1CF55F000, a2, v5, "[CRIT] extension record %@ has more than one persona associated (%@)", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2();
}

@end
