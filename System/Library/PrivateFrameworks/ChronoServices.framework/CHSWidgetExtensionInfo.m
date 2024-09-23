@implementation CHSWidgetExtensionInfo

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHSWidgetExtensionInfo;
  return -[CHSWidgetExtensionInfo init](&v3, sel_init);
}

- (id)_initWithInfo:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;

  v4 = (id *)a3;
  v5 = -[CHSWidgetExtensionInfo _init](self, "_init");
  if (v5)
  {
    v6 = objc_msgSend(v4[1], "copy");
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    v8 = objc_msgSend(v4[2], "copy");
    v9 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v8;

    v10 = objc_msgSend(v4[3], "copy");
    v11 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v10;

    v12 = objc_msgSend(v4[4], "copy");
    v13 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v12;

    objc_storeStrong((id *)v5 + 5, v4[5]);
    v14 = objc_msgSend(v4[6], "copy");
    v15 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v14;

    v16 = objc_msgSend(v4[7], "copy");
    v17 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v16;

    v18 = objc_msgSend(v4[8], "copy");
    v19 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v18;

    v20 = objc_msgSend(v4[9], "copy");
    v21 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v20;

    *((_BYTE *)v5 + 81) = *((_BYTE *)v4 + 81);
    *((_BYTE *)v5 + 82) = *((_BYTE *)v4 + 82);
    v22 = objc_msgSend(v4[11], "copy");
    v23 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v22;

    *((_BYTE *)v5 + 96) = *((_BYTE *)v4 + 96);
    objc_storeStrong((id *)v5 + 14, v4[14]);
    v24 = objc_msgSend(v4[15], "copy");
    v25 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v24;

    v26 = objc_msgSend(v4[16], "copy");
    v27 = (void *)*((_QWORD *)v5 + 16);
    *((_QWORD *)v5 + 16) = v26;

    v28 = objc_msgSend(v4[17], "copy");
    v29 = (void *)*((_QWORD *)v5 + 17);
    *((_QWORD *)v5 + 17) = v28;

    v30 = objc_msgSend(v4[19], "copy");
    v31 = (void *)*((_QWORD *)v5 + 19);
    *((_QWORD *)v5 + 19) = v30;

    v32 = objc_msgSend(v4[20], "copy");
    v33 = (void *)*((_QWORD *)v5 + 20);
    *((_QWORD *)v5 + 20) = v32;

    v34 = objc_msgSend(v4[21], "copy");
    v35 = (void *)*((_QWORD *)v5 + 21);
    *((_QWORD *)v5 + 21) = v34;

    v36 = objc_msgSend(v4[22], "copy");
    v37 = (void *)*((_QWORD *)v5 + 22);
    *((_QWORD *)v5 + 22) = v36;

    v38 = objc_msgSend(v4[23], "copy");
    v39 = (void *)*((_QWORD *)v5 + 23);
    *((_QWORD *)v5 + 23) = v38;

    v40 = objc_msgSend(v4[24], "copy");
    v41 = (void *)*((_QWORD *)v5 + 24);
    *((_QWORD *)v5 + 24) = v40;

    v42 = objc_msgSend(v4[25], "copy");
    v43 = (void *)*((_QWORD *)v5 + 25);
    *((_QWORD *)v5 + 25) = v42;

    v44 = objc_msgSend(v4[13], "copy");
    v45 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v44;

    *((_BYTE *)v5 + 80) = *((_BYTE *)v4 + 80);
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetExtensionInfo _initWithInfo:]([CHSMutableWidgetExtensionInfo alloc], "_initWithInfo:", self);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bi"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_containerBundleIdentifier, CFSTR("cbi"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_effectiveContainerBundleIdentifier, CFSTR("ecbi"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_version, CFSTR("v"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_lastModifiedDate, CFSTR("lmd"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleURL, CFSTR("bu"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_containerURL, CFSTR("cu"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_systemDataContainerURL, CFSTR("sdcu"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_dataProtectionLevel, CFSTR("dpl"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isDevelopmentExtension, CFSTR("ide"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_wantsLocation, CFSTR("wl"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_availableLocalizations, CFSTR("al"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_allowsMixedLocalizations, CFSTR("aml"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_entitlements, CFSTR("ent"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sdkVersion, CFSTR("sdkVersion"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeObject:forKey:", self->_descriptors, CFSTR("desc"));
  objc_msgSend(v4, "finishEncoding");
  objc_msgSend(v4, "encodedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("desc"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_widgetConfigurations, CFSTR("widgetConfigurations"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_controlConfigurations, CFSTR("controlConfigurations"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_snapshotURLs, CFSTR("snu"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_placeholderURLs, CFSTR("plu"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_timelineURLs, CFSTR("tlu"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_liveControlURLs, CFSTR("liveControlURLs"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_livePlaceholderControlURLs, CFSTR("livePlaceholderControlURLs"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_previewControlURLs, CFSTR("previewControlURLs"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nominatedContainerBundleIdentifiers, CFSTR("ncbi"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_disablesImplicitDiscovery, CFSTR("disablesImplicitDiscovery"));

}

- (CHSWidgetExtensionInfo)initWithBSXPCCoder:(id)a3
{
  id v4;
  CHSWidgetExtensionInfo *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *containerBundleIdentifier;
  uint64_t v10;
  NSString *effectiveContainerBundleIdentifier;
  uint64_t v12;
  NSString *version;
  uint64_t v14;
  NSDate *lastModifiedDate;
  uint64_t v16;
  NSURL *bundleURL;
  uint64_t v18;
  NSURL *containerURL;
  uint64_t v20;
  NSURL *systemDataContainerURL;
  uint64_t v22;
  NSString *dataProtectionLevel;
  uint64_t v24;
  uint64_t v25;
  NSArray *availableLocalizations;
  uint64_t v27;
  NSString *sdkVersion;
  uint64_t v29;
  CHSEntitlementCollection *entitlements;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSArray *descriptors;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  NSArray *widgetConfigurations;
  uint64_t v44;
  uint64_t v45;
  NSArray *controlConfigurations;
  uint64_t v47;
  uint64_t v48;
  NSArray *snapshotURLs;
  uint64_t v50;
  uint64_t v51;
  NSArray *placeholderURLs;
  uint64_t v53;
  uint64_t v54;
  NSArray *timelineURLs;
  uint64_t v56;
  uint64_t v57;
  NSArray *liveControlURLs;
  uint64_t v59;
  uint64_t v60;
  NSArray *livePlaceholderControlURLs;
  uint64_t v62;
  uint64_t v63;
  NSArray *previewControlURLs;
  uint64_t v65;
  uint64_t v66;
  NSArray *nominatedContainerBundleIdentifiers;
  id v69;
  uint8_t buf[4];
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CHSWidgetExtensionInfo _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("bi"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("cbi"));
    v8 = objc_claimAutoreleasedReturnValue();
    containerBundleIdentifier = v5->_containerBundleIdentifier;
    v5->_containerBundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("ecbi"));
    v10 = objc_claimAutoreleasedReturnValue();
    effectiveContainerBundleIdentifier = v5->_effectiveContainerBundleIdentifier;
    v5->_effectiveContainerBundleIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("v"));
    v12 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lmd"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bu"));
    v16 = objc_claimAutoreleasedReturnValue();
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cu"));
    v18 = objc_claimAutoreleasedReturnValue();
    containerURL = v5->_containerURL;
    v5->_containerURL = (NSURL *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sdcu"));
    v20 = objc_claimAutoreleasedReturnValue();
    systemDataContainerURL = v5->_systemDataContainerURL;
    v5->_systemDataContainerURL = (NSURL *)v20;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("dpl"));
    v22 = objc_claimAutoreleasedReturnValue();
    dataProtectionLevel = v5->_dataProtectionLevel;
    v5->_dataProtectionLevel = (NSString *)v22;

    v5->_isDevelopmentExtension = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ide"));
    v5->_wantsLocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wl"));
    v24 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v24, objc_opt_class(), CFSTR("al"));
    v25 = objc_claimAutoreleasedReturnValue();
    availableLocalizations = v5->_availableLocalizations;
    v5->_availableLocalizations = (NSArray *)v25;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("sdkVersion"));
    v27 = objc_claimAutoreleasedReturnValue();
    sdkVersion = v5->_sdkVersion;
    v5->_sdkVersion = (NSString *)v27;

    v5->_allowsMixedLocalizations = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("aml"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ent"));
    v29 = objc_claimAutoreleasedReturnValue();
    entitlements = v5->_entitlements;
    v5->_entitlements = (CHSEntitlementCollection *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("desc"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0;
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v31, &v69);
    v33 = v69;
    v34 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "decodeObjectOfClasses:forKey:", v37, CFSTR("desc"));
    v38 = objc_claimAutoreleasedReturnValue();
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v38;

    if (v33)
    {
      CHSLogChronoServices();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v71 = v33;
        _os_log_impl(&dword_18FB18000, v40, OS_LOG_TYPE_DEFAULT, "Error decoding widget info: %{public}@", buf, 0xCu);
      }

    }
    v41 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v41, objc_opt_class(), CFSTR("widgetConfigurations"));
    v42 = objc_claimAutoreleasedReturnValue();
    widgetConfigurations = v5->_widgetConfigurations;
    v5->_widgetConfigurations = (NSArray *)v42;

    v44 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v44, objc_opt_class(), CFSTR("controlConfigurations"));
    v45 = objc_claimAutoreleasedReturnValue();
    controlConfigurations = v5->_controlConfigurations;
    v5->_controlConfigurations = (NSArray *)v45;

    v47 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v47, objc_opt_class(), CFSTR("snu"));
    v48 = objc_claimAutoreleasedReturnValue();
    snapshotURLs = v5->_snapshotURLs;
    v5->_snapshotURLs = (NSArray *)v48;

    v50 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v50, objc_opt_class(), CFSTR("plu"));
    v51 = objc_claimAutoreleasedReturnValue();
    placeholderURLs = v5->_placeholderURLs;
    v5->_placeholderURLs = (NSArray *)v51;

    v53 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v53, objc_opt_class(), CFSTR("tlu"));
    v54 = objc_claimAutoreleasedReturnValue();
    timelineURLs = v5->_timelineURLs;
    v5->_timelineURLs = (NSArray *)v54;

    v56 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v56, objc_opt_class(), CFSTR("liveControlURLs"));
    v57 = objc_claimAutoreleasedReturnValue();
    liveControlURLs = v5->_liveControlURLs;
    v5->_liveControlURLs = (NSArray *)v57;

    v59 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v59, objc_opt_class(), CFSTR("livePlaceholderControlURLs"));
    v60 = objc_claimAutoreleasedReturnValue();
    livePlaceholderControlURLs = v5->_livePlaceholderControlURLs;
    v5->_livePlaceholderControlURLs = (NSArray *)v60;

    v62 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v62, objc_opt_class(), CFSTR("previewControlURLs"));
    v63 = objc_claimAutoreleasedReturnValue();
    previewControlURLs = v5->_previewControlURLs;
    v5->_previewControlURLs = (NSArray *)v63;

    v65 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v65, objc_opt_class(), CFSTR("ncbi"));
    v66 = objc_claimAutoreleasedReturnValue();
    nominatedContainerBundleIdentifiers = v5->_nominatedContainerBundleIdentifiers;
    v5->_nominatedContainerBundleIdentifiers = (NSArray *)v66;

    v5->_disablesImplicitDiscovery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disablesImplicitDiscovery"));
  }

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)effectiveContainerBundleIdentifier
{
  return self->_effectiveContainerBundleIdentifier;
}

- (NSString)version
{
  return self->_version;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (NSURL)systemDataContainerURL
{
  return self->_systemDataContainerURL;
}

- (NSString)dataProtectionLevel
{
  return self->_dataProtectionLevel;
}

- (BOOL)disablesImplicitDiscovery
{
  return self->_disablesImplicitDiscovery;
}

- (BOOL)isDevelopmentExtension
{
  return self->_isDevelopmentExtension;
}

- (BOOL)wantsLocation
{
  return self->_wantsLocation;
}

- (NSArray)availableLocalizations
{
  return self->_availableLocalizations;
}

- (BOOL)allowsMixedLocalizations
{
  return self->_allowsMixedLocalizations;
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (NSObject)entitlements
{
  return &self->_entitlements->super;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (NSArray)widgetConfigurations
{
  return self->_widgetConfigurations;
}

- (NSArray)controlConfigurations
{
  return self->_controlConfigurations;
}

- (NSArray)snapshotURLs
{
  return self->_snapshotURLs;
}

- (NSArray)placeholderURLs
{
  return self->_placeholderURLs;
}

- (NSArray)timelineURLs
{
  return self->_timelineURLs;
}

- (NSArray)liveControlURLs
{
  return self->_liveControlURLs;
}

- (NSArray)livePlaceholderControlURLs
{
  return self->_livePlaceholderControlURLs;
}

- (NSArray)previewControlURLs
{
  return self->_previewControlURLs;
}

- (NSArray)nominatedContainerBundleIdentifiers
{
  return self->_nominatedContainerBundleIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nominatedContainerBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_previewControlURLs, 0);
  objc_storeStrong((id *)&self->_livePlaceholderControlURLs, 0);
  objc_storeStrong((id *)&self->_liveControlURLs, 0);
  objc_storeStrong((id *)&self->_timelineURLs, 0);
  objc_storeStrong((id *)&self->_placeholderURLs, 0);
  objc_storeStrong((id *)&self->_snapshotURLs, 0);
  objc_storeStrong((id *)&self->_controlTemplates, 0);
  objc_storeStrong((id *)&self->_controlConfigurations, 0);
  objc_storeStrong((id *)&self->_widgetConfigurations, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_availableLocalizations, 0);
  objc_storeStrong((id *)&self->_dataProtectionLevel, 0);
  objc_storeStrong((id *)&self->_systemDataContainerURL, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_effectiveContainerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
