@implementation IXPlaceholderAttributes

- (IXPlaceholderAttributes)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IXPlaceholderAttributes;
  return -[IXPlaceholderAttributes init](&v3, sel_init);
}

- (IXPlaceholderAttributes)initWithCoder:(id)a3
{
  id v4;
  IXPlaceholderAttributes *v5;
  uint64_t v6;
  NSString *bundleVersion;
  uint64_t v8;
  NSDictionary *extensionDictionary;
  uint64_t v10;
  NSDictionary *exAppExtensionAttributes;
  uint64_t v12;
  NSString *minimumOSVersion;
  uint64_t v14;
  NSDictionary *requiredDeviceCapabilities;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *sbAppTags;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *lsCounterpartIdentifiers;
  uint64_t v26;
  NSString *sbIconMasqueradeIdentifier;
  uint64_t v28;
  NSString *companionBundleIdentifierForWatchApp;
  uint64_t v30;
  NSDictionary *webKitPushBundleMetadata;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *uiDeviceFamily;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)IXPlaceholderAttributes;
  v5 = -[IXPlaceholderAttributes init](&v38, sel_init);
  if (v5)
  {
    v5->_launchProhibited = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("launchProhibited"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v6;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("extensionDictionary"));
    v8 = objc_claimAutoreleasedReturnValue();
    extensionDictionary = v5->_extensionDictionary;
    v5->_extensionDictionary = (NSDictionary *)v8;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("exAppExtensionAttributes"));
    v10 = objc_claimAutoreleasedReturnValue();
    exAppExtensionAttributes = v5->_exAppExtensionAttributes;
    v5->_exAppExtensionAttributes = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumOSVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    minimumOSVersion = v5->_minimumOSVersion;
    v5->_minimumOSVersion = (NSString *)v12;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("requiredDeviceCapabilities"));
    v14 = objc_claimAutoreleasedReturnValue();
    requiredDeviceCapabilities = v5->_requiredDeviceCapabilities;
    v5->_requiredDeviceCapabilities = (NSDictionary *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("sbAppTags"));
    v19 = objc_claimAutoreleasedReturnValue();
    sbAppTags = v5->_sbAppTags;
    v5->_sbAppTags = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("lsCounterpartIdentifiers"));
    v24 = objc_claimAutoreleasedReturnValue();
    lsCounterpartIdentifiers = v5->_lsCounterpartIdentifiers;
    v5->_lsCounterpartIdentifiers = (NSArray *)v24;

    v5->_lsRequiresPostProcessing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lsRequiresPostProcessing"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sbIconMasqueradeIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    sbIconMasqueradeIdentifier = v5->_sbIconMasqueradeIdentifier;
    v5->_sbIconMasqueradeIdentifier = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companionBundleIdentifierForWatchApp"));
    v28 = objc_claimAutoreleasedReturnValue();
    companionBundleIdentifierForWatchApp = v5->_companionBundleIdentifierForWatchApp;
    v5->_companionBundleIdentifierForWatchApp = (NSString *)v28;

    v5->_watchOnlyApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("watchOnlyApp"));
    v5->_runsIndependentlyOfCompanionApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("runsIndependentlyOfCompanionApp"));
    v5->_arcadeApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("arcadeApp"));
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("webKitPushBundleMetadata"));
    v30 = objc_claimAutoreleasedReturnValue();
    webKitPushBundleMetadata = v5->_webKitPushBundleMetadata;
    v5->_webKitPushBundleMetadata = (NSDictionary *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("uiDeviceFamily"));
    v35 = objc_claimAutoreleasedReturnValue();
    uiDeviceFamily = v5->_uiDeviceFamily;
    v5->_uiDeviceFamily = (NSArray *)v35;

  }
  return v5;
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
  id v15;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[IXPlaceholderAttributes launchProhibited](self, "launchProhibited"), CFSTR("launchProhibited"));
  -[IXPlaceholderAttributes bundleVersion](self, "bundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleVersion"));

  -[IXPlaceholderAttributes extensionDictionary](self, "extensionDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("extensionDictionary"));

  -[IXPlaceholderAttributes exAppExtensionAttributes](self, "exAppExtensionAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("exAppExtensionAttributes"));

  -[IXPlaceholderAttributes minimumOSVersion](self, "minimumOSVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("minimumOSVersion"));

  -[IXPlaceholderAttributes requiredDeviceCapabilities](self, "requiredDeviceCapabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("requiredDeviceCapabilities"));

  -[IXPlaceholderAttributes sbAppTags](self, "sbAppTags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("sbAppTags"));

  -[IXPlaceholderAttributes lsCounterpartIdentifiers](self, "lsCounterpartIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("lsCounterpartIdentifiers"));

  objc_msgSend(v4, "encodeBool:forKey:", -[IXPlaceholderAttributes lsRequiresPostProcessing](self, "lsRequiresPostProcessing"), CFSTR("lsRequiresPostProcessing"));
  -[IXPlaceholderAttributes sbIconMasqueradeIdentifier](self, "sbIconMasqueradeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("sbIconMasqueradeIdentifier"));

  -[IXPlaceholderAttributes companionBundleIdentifierForWatchApp](self, "companionBundleIdentifierForWatchApp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("companionBundleIdentifierForWatchApp"));

  objc_msgSend(v4, "encodeBool:forKey:", -[IXPlaceholderAttributes watchOnlyApp](self, "watchOnlyApp"), CFSTR("watchOnlyApp"));
  objc_msgSend(v4, "encodeBool:forKey:", -[IXPlaceholderAttributes runsIndependentlyOfCompanionApp](self, "runsIndependentlyOfCompanionApp"), CFSTR("runsIndependentlyOfCompanionApp"));
  objc_msgSend(v4, "encodeBool:forKey:", -[IXPlaceholderAttributes arcadeApp](self, "arcadeApp"), CFSTR("arcadeApp"));
  -[IXPlaceholderAttributes webKitPushBundleMetadata](self, "webKitPushBundleMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("webKitPushBundleMetadata"));

  -[IXPlaceholderAttributes uiDeviceFamily](self, "uiDeviceFamily");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("uiDeviceFamily"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  int v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  int v39;
  int v40;
  int v41;
  void *v42;
  void *v43;
  _BOOL4 v44;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[IXPlaceholderAttributes launchProhibited](self, "launchProhibited");
    if (v6 != objc_msgSend(v5, "launchProhibited"))
    {
LABEL_3:
      v7 = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[IXPlaceholderAttributes bundleVersion](self, "bundleVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v11 = v9;
    v12 = v11;
    if ((v10 != 0) != (v11 != 0) || v10 && v11 && !objc_msgSend(v10, "isEqual:", v11))
      goto LABEL_18;

    -[IXPlaceholderAttributes extensionDictionary](self, "extensionDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    v15 = v14;
    v12 = v15;
    if ((v10 != 0) != (v15 != 0) || v10 && v15 && !objc_msgSend(v10, "isEqual:", v15))
      goto LABEL_18;

    -[IXPlaceholderAttributes exAppExtensionAttributes](self, "exAppExtensionAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exAppExtensionAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    v18 = v17;
    v12 = v18;
    if ((v10 != 0) != (v18 != 0) || v10 && v18 && !objc_msgSend(v10, "isEqual:", v18))
      goto LABEL_18;

    -[IXPlaceholderAttributes minimumOSVersion](self, "minimumOSVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minimumOSVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;
    v21 = v20;
    v12 = v21;
    if ((v10 != 0) != (v21 != 0) || v10 && v21 && !objc_msgSend(v10, "isEqual:", v21))
    {
LABEL_18:

      v7 = 0;
    }
    else
    {

      -[IXPlaceholderAttributes requiredDeviceCapabilities](self, "requiredDeviceCapabilities");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requiredDeviceCapabilities");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = _CompareObjects(v23, v24);

      if (!v25)
        goto LABEL_3;
      -[IXPlaceholderAttributes sbAppTags](self, "sbAppTags");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sbAppTags");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = _CompareObjects(v26, v27);

      if (!v28)
        goto LABEL_3;
      -[IXPlaceholderAttributes lsCounterpartIdentifiers](self, "lsCounterpartIdentifiers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lsCounterpartIdentifiers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = _CompareObjects(v29, v30);

      if (!v31)
        goto LABEL_3;
      v32 = -[IXPlaceholderAttributes lsRequiresPostProcessing](self, "lsRequiresPostProcessing");
      if (v32 != objc_msgSend(v5, "lsRequiresPostProcessing"))
        goto LABEL_3;
      -[IXPlaceholderAttributes sbIconMasqueradeIdentifier](self, "sbIconMasqueradeIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sbIconMasqueradeIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = _CompareObjects(v33, v34);

      if (!v35)
        goto LABEL_3;
      -[IXPlaceholderAttributes companionBundleIdentifierForWatchApp](self, "companionBundleIdentifierForWatchApp");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "companionBundleIdentifierForWatchApp");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = _CompareObjects(v36, v37);

      if (!v38)
        goto LABEL_3;
      v39 = -[IXPlaceholderAttributes watchOnlyApp](self, "watchOnlyApp");
      if (v39 != objc_msgSend(v5, "watchOnlyApp"))
        goto LABEL_3;
      v40 = -[IXPlaceholderAttributes runsIndependentlyOfCompanionApp](self, "runsIndependentlyOfCompanionApp");
      if (v40 != objc_msgSend(v5, "runsIndependentlyOfCompanionApp"))
        goto LABEL_3;
      v41 = -[IXPlaceholderAttributes arcadeApp](self, "arcadeApp");
      if (v41 != objc_msgSend(v5, "arcadeApp"))
        goto LABEL_3;
      -[IXPlaceholderAttributes webKitPushBundleMetadata](self, "webKitPushBundleMetadata");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "webKitPushBundleMetadata");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = _CompareObjects(v42, v43);

      if (!v44)
        goto LABEL_3;
      -[IXPlaceholderAttributes uiDeviceFamily](self, "uiDeviceFamily");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uiDeviceFamily");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = _CompareObjects(v10, v12);
    }

    goto LABEL_20;
  }
  v7 = 0;
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;

  v3 = -[IXPlaceholderAttributes launchProhibited](self, "launchProhibited");
  -[IXPlaceholderAttributes bundleVersion](self, "bundleVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[IXPlaceholderAttributes extensionDictionary](self, "extensionDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 | objc_msgSend(v6, "hash") | v3;

  -[IXPlaceholderAttributes exAppExtensionAttributes](self, "exAppExtensionAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  -[IXPlaceholderAttributes minimumOSVersion](self, "minimumOSVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 | objc_msgSend(v10, "hash");

  -[IXPlaceholderAttributes requiredDeviceCapabilities](self, "requiredDeviceCapabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 | v11 | objc_msgSend(v12, "hash");

  -[IXPlaceholderAttributes sbAppTags](self, "sbAppTags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");

  -[IXPlaceholderAttributes lsCounterpartIdentifiers](self, "lsCounterpartIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 | objc_msgSend(v16, "hash");

  v18 = v17 | -[IXPlaceholderAttributes lsRequiresPostProcessing](self, "lsRequiresPostProcessing");
  -[IXPlaceholderAttributes sbIconMasqueradeIdentifier](self, "sbIconMasqueradeIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v13 | v18 | objc_msgSend(v19, "hash");

  -[IXPlaceholderAttributes companionBundleIdentifierForWatchApp](self, "companionBundleIdentifierForWatchApp");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hash");

  v23 = v22 | -[IXPlaceholderAttributes watchOnlyApp](self, "watchOnlyApp");
  v24 = v23 | -[IXPlaceholderAttributes runsIndependentlyOfCompanionApp](self, "runsIndependentlyOfCompanionApp");
  v25 = v20 | v24 | -[IXPlaceholderAttributes arcadeApp](self, "arcadeApp");
  -[IXPlaceholderAttributes webKitPushBundleMetadata](self, "webKitPushBundleMetadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hash");

  -[IXPlaceholderAttributes uiDeviceFamily](self, "uiDeviceFamily");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v25 | v27 | objc_msgSend(v28, "hash");

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setLaunchProhibited:", -[IXPlaceholderAttributes launchProhibited](self, "launchProhibited"));
  -[IXPlaceholderAttributes bundleVersion](self, "bundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleVersion:", v5);

  -[IXPlaceholderAttributes extensionDictionary](self, "extensionDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtensionDictionary:", v6);

  -[IXPlaceholderAttributes exAppExtensionAttributes](self, "exAppExtensionAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExAppExtensionAttributes:", v7);

  -[IXPlaceholderAttributes minimumOSVersion](self, "minimumOSVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumOSVersion:", v8);

  -[IXPlaceholderAttributes requiredDeviceCapabilities](self, "requiredDeviceCapabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequiredDeviceCapabilities:", v9);

  -[IXPlaceholderAttributes sbAppTags](self, "sbAppTags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSbAppTags:", v10);

  -[IXPlaceholderAttributes lsCounterpartIdentifiers](self, "lsCounterpartIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLsCounterpartIdentifiers:", v11);

  objc_msgSend(v4, "setLsRequiresPostProcessing:", -[IXPlaceholderAttributes lsRequiresPostProcessing](self, "lsRequiresPostProcessing"));
  -[IXPlaceholderAttributes sbIconMasqueradeIdentifier](self, "sbIconMasqueradeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSbIconMasqueradeIdentifier:", v12);

  -[IXPlaceholderAttributes companionBundleIdentifierForWatchApp](self, "companionBundleIdentifierForWatchApp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompanionBundleIdentifierForWatchApp:", v13);

  objc_msgSend(v4, "setWatchOnlyApp:", -[IXPlaceholderAttributes watchOnlyApp](self, "watchOnlyApp"));
  objc_msgSend(v4, "setRunsIndependentlyOfCompanionApp:", -[IXPlaceholderAttributes runsIndependentlyOfCompanionApp](self, "runsIndependentlyOfCompanionApp"));
  objc_msgSend(v4, "setArcadeApp:", -[IXPlaceholderAttributes arcadeApp](self, "arcadeApp"));
  -[IXPlaceholderAttributes uiDeviceFamily](self, "uiDeviceFamily");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUiDeviceFamily:", v14);

  return v4;
}

- (id)_plistKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C9AE90], CFSTR("LSApplicationLaunchProhibited"), CFSTR("NSExtension"), CFSTR("EXAppExtensionAttributes"), CFSTR("MinimumOSVersion"), CFSTR("UIRequiredDeviceCapabilities"), CFSTR("SBAppTags"), CFSTR("LSCounterpartIdentifiers"), CFSTR("LSRequiresPostProcessing"), CFSTR("SBIconMasqueradeIdentifier"), CFSTR("WKCompanionAppBundleIdentifier"), CFSTR("WKWatchOnly"), CFSTR("WKRunsIndependentlyOfCompanionApp"), CFSTR("NSApplicationRequiresArcade"), CFSTR("WKPushBundleMetadata"), CFSTR("UIDeviceFamily"), 0);
}

- (IXPlaceholderAttributes)initWithInfoPlistFromBundleURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  IXPlaceholderAttributes *v9;

  v6 = a3;
  -[IXPlaceholderAttributes _plistKeys](self, "_plistKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LoadInfoPlistFromBundleAtURL(v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[IXPlaceholderAttributes initWithInfoPlistDictionary:](self, "initWithInfoPlistDictionary:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (IXPlaceholderAttributes)initWithInfoPlistFromBundle:(__CFBundle *)a3 error:(id *)a4
{
  IXPlaceholderAttributes *v6;
  void *v7;
  void *v8;
  IXPlaceholderAttributes *v9;

  v6 = self;
  -[IXPlaceholderAttributes _plistKeys](self, "_plistKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LoadInfoPlistFromBundle(a3, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v6 = -[IXPlaceholderAttributes initWithInfoPlistDictionary:](v6, "initWithInfoPlistDictionary:", v8);
    v9 = v6;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (IXPlaceholderAttributes)initWithInfoPlistDictionary:(id)a3
{
  id v4;
  IXPlaceholderAttributes *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v63;
  IXPlaceholderAttributes *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IXPlaceholderAttributes init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LSApplicationLaunchProhibited"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXPlaceholderAttributes setLaunchProhibited:](v5, "setLaunchProhibited:", IXBooleanValue(v6, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    -[IXPlaceholderAttributes setBundleVersion:](v5, "setBundleVersion:", v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSExtension"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    -[IXPlaceholderAttributes setExtensionDictionary:](v5, "setExtensionDictionary:", v12);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EXAppExtensionAttributes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    -[IXPlaceholderAttributes setExAppExtensionAttributes:](v5, "setExAppExtensionAttributes:", v15);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinimumOSVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v17 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    -[IXPlaceholderAttributes setMinimumOSVersion:](v5, "setMinimumOSVersion:", v18);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SBAppTags"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    objc_opt_class();
    IXFilterArrayForClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXPlaceholderAttributes setSbAppTags:](v5, "setSbAppTags:", v22);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LSCounterpartIdentifiers"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v24 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;

    objc_opt_class();
    IXFilterArrayForClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXPlaceholderAttributes setLsCounterpartIdentifiers:](v5, "setLsCounterpartIdentifiers:", v26);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LSRequiresPostProcessing"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXPlaceholderAttributes setLsRequiresPostProcessing:](v5, "setLsRequiresPostProcessing:", IXBooleanValue(v27, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SBIconMasqueradeIdentifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;

    -[IXPlaceholderAttributes setSbIconMasqueradeIdentifier:](v5, "setSbIconMasqueradeIdentifier:", v30);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WKCompanionAppBundleIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;

    -[IXPlaceholderAttributes setCompanionBundleIdentifierForWatchApp:](v5, "setCompanionBundleIdentifierForWatchApp:", v33);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIRequiredDeviceCapabilities"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v35;
    else
      v36 = 0;

    if (v36)
    {
      v37 = v35;
      v38 = objc_opt_class();
      v39 = objc_opt_class();
      IXFilterDictionaryForClass(v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[IXPlaceholderAttributes setRequiredDeviceCapabilities:](v5, "setRequiredDeviceCapabilities:", v40);
    }
    else
    {
      objc_opt_class();
      v41 = v35;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v42 = v41;
      else
        v42 = 0;

      if (v42)
        -[IXPlaceholderAttributes setRequiredDeviceCapabilitiesWithArray:](v5, "setRequiredDeviceCapabilitiesWithArray:", v41);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WKWatchOnly"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXPlaceholderAttributes setWatchOnlyApp:](v5, "setWatchOnlyApp:", IXBooleanValue(v43, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WKRunsIndependentlyOfCompanionApp"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXPlaceholderAttributes setRunsIndependentlyOfCompanionApp:](v5, "setRunsIndependentlyOfCompanionApp:", IXBooleanValue(v44, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSApplicationRequiresArcade"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXPlaceholderAttributes setArcadeApp:](v5, "setArcadeApp:", IXBooleanValue(v45, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WKPushBundleMetadata"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v48 = v47;
    else
      v48 = 0;

    -[IXPlaceholderAttributes setWebKitPushBundleMetadata:](v5, "setWebKitPushBundleMetadata:", v48);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIDeviceFamily"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = v49;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v51 = v50;
    else
      v51 = 0;

    if (v51)
    {
      v63 = v35;
      v64 = v5;
      v52 = (void *)objc_opt_new();
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v53 = v51;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v66 != v56)
              objc_enumerationMutation(v53);
            v58 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v59 = objc_msgSend(v58, "intValue");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "addObject:", v60);

            }
          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
        }
        while (v55);
      }

      v61 = (void *)objc_msgSend(v52, "copy");
      v5 = v64;
      -[IXPlaceholderAttributes setUiDeviceFamily:](v64, "setUiDeviceFamily:", v61);

      v35 = v63;
    }

  }
  return v5;
}

- (void)setRequiredDeviceCapabilitiesWithArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = MEMORY[0x1E0C9AAB0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        v13 = v12;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;

        if (v14)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v13, (_QWORD)v16);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v15 = (void *)objc_msgSend(v5, "copy");
    -[IXPlaceholderAttributes setRequiredDeviceCapabilities:](self, "setRequiredDeviceCapabilities:", v15);

  }
}

- (id)infoPlistContent
{
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

  v3 = (void *)objc_opt_new();
  if (-[IXPlaceholderAttributes launchProhibited](self, "launchProhibited"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("LSApplicationLaunchProhibited"));
  -[IXPlaceholderAttributes bundleVersion](self, "bundleVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0C9AE90]);

  -[IXPlaceholderAttributes extensionDictionary](self, "extensionDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("NSExtension"));

  -[IXPlaceholderAttributes exAppExtensionAttributes](self, "exAppExtensionAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("EXAppExtensionAttributes"));

  -[IXPlaceholderAttributes minimumOSVersion](self, "minimumOSVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("MinimumOSVersion"));

  -[IXPlaceholderAttributes requiredDeviceCapabilities](self, "requiredDeviceCapabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("UIRequiredDeviceCapabilities"));

  -[IXPlaceholderAttributes sbAppTags](self, "sbAppTags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("SBAppTags"));

  -[IXPlaceholderAttributes lsCounterpartIdentifiers](self, "lsCounterpartIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("LSCounterpartIdentifiers"));

  -[IXPlaceholderAttributes sbIconMasqueradeIdentifier](self, "sbIconMasqueradeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("SBIconMasqueradeIdentifier"));

  -[IXPlaceholderAttributes companionBundleIdentifierForWatchApp](self, "companionBundleIdentifierForWatchApp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("WKCompanionAppBundleIdentifier"));

  -[IXPlaceholderAttributes webKitPushBundleMetadata](self, "webKitPushBundleMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("WKPushBundleMetadata"));

  -[IXPlaceholderAttributes uiDeviceFamily](self, "uiDeviceFamily");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("UIDeviceFamily"));

  if (-[IXPlaceholderAttributes watchOnlyApp](self, "watchOnlyApp"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("WKWatchOnly"));
  if (-[IXPlaceholderAttributes runsIndependentlyOfCompanionApp](self, "runsIndependentlyOfCompanionApp"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("WKRunsIndependentlyOfCompanionApp"));
  if (-[IXPlaceholderAttributes arcadeApp](self, "arcadeApp"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("NSApplicationRequiresArcade"));
  if (-[IXPlaceholderAttributes lsRequiresPostProcessing](self, "lsRequiresPostProcessing"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("LSRequiresPostProcessing"));
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXPlaceholderAttributes infoPlistContent](self, "infoPlistContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@<%p> : %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)launchProhibited
{
  return self->_launchProhibited;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)extensionDictionary
{
  return self->_extensionDictionary;
}

- (void)setExtensionDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)exAppExtensionAttributes
{
  return self->_exAppExtensionAttributes;
}

- (void)setExAppExtensionAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)minimumOSVersion
{
  return self->_minimumOSVersion;
}

- (void)setMinimumOSVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)requiredDeviceCapabilities
{
  return self->_requiredDeviceCapabilities;
}

- (void)setRequiredDeviceCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)sbAppTags
{
  return self->_sbAppTags;
}

- (void)setSbAppTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)lsCounterpartIdentifiers
{
  return self->_lsCounterpartIdentifiers;
}

- (void)setLsCounterpartIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)sbIconMasqueradeIdentifier
{
  return self->_sbIconMasqueradeIdentifier;
}

- (void)setSbIconMasqueradeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)companionBundleIdentifierForWatchApp
{
  return self->_companionBundleIdentifierForWatchApp;
}

- (void)setCompanionBundleIdentifierForWatchApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)watchOnlyApp
{
  return self->_watchOnlyApp;
}

- (void)setWatchOnlyApp:(BOOL)a3
{
  self->_watchOnlyApp = a3;
}

- (BOOL)runsIndependentlyOfCompanionApp
{
  return self->_runsIndependentlyOfCompanionApp;
}

- (void)setRunsIndependentlyOfCompanionApp:(BOOL)a3
{
  self->_runsIndependentlyOfCompanionApp = a3;
}

- (BOOL)arcadeApp
{
  return self->_arcadeApp;
}

- (void)setArcadeApp:(BOOL)a3
{
  self->_arcadeApp = a3;
}

- (NSDictionary)webKitPushBundleMetadata
{
  return self->_webKitPushBundleMetadata;
}

- (void)setWebKitPushBundleMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)lsRequiresPostProcessing
{
  return self->_lsRequiresPostProcessing;
}

- (void)setLsRequiresPostProcessing:(BOOL)a3
{
  self->_lsRequiresPostProcessing = a3;
}

- (NSArray)uiDeviceFamily
{
  return self->_uiDeviceFamily;
}

- (void)setUiDeviceFamily:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiDeviceFamily, 0);
  objc_storeStrong((id *)&self->_webKitPushBundleMetadata, 0);
  objc_storeStrong((id *)&self->_companionBundleIdentifierForWatchApp, 0);
  objc_storeStrong((id *)&self->_sbIconMasqueradeIdentifier, 0);
  objc_storeStrong((id *)&self->_lsCounterpartIdentifiers, 0);
  objc_storeStrong((id *)&self->_sbAppTags, 0);
  objc_storeStrong((id *)&self->_requiredDeviceCapabilities, 0);
  objc_storeStrong((id *)&self->_minimumOSVersion, 0);
  objc_storeStrong((id *)&self->_exAppExtensionAttributes, 0);
  objc_storeStrong((id *)&self->_extensionDictionary, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
}

@end
