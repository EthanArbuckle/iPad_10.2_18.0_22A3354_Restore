@implementation MIAppExtensionBundle

- (id)initForTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIAppExtensionBundle;
  return -[MIExecutableBundle initForTesting](&v3, sel_initForTesting);
}

- (id)minimumOSVersion
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIAppExtensionBundle;
  -[MIBundle minimumOSVersion](&v6, sel_minimumOSVersion);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MIBundle parentBundle](self, "parentBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minimumOSVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (Class)dataContainerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)targetsAppleExtensionPoint
{
  void *v2;
  char v3;

  -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple."));

  return v3;
}

- (unint64_t)extensionPoint
{
  unint64_t extensionPoint;
  void *v4;

  extensionPoint = self->_extensionPoint;
  if (!extensionPoint)
  {
    -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.web-browser-engine.content")) & 1) != 0)
    {
      extensionPoint = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.web-browser-engine.networking")) & 1) != 0)
    {
      extensionPoint = 3;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.web-browser-engine.rendering")))
    {
      extensionPoint = 2;
    }
    else
    {
      extensionPoint = -1;
    }
    self->_extensionPoint = extensionPoint;

  }
  return extensionPoint;
}

- (BOOL)targetsBrowserExtensionPoint
{
  return -[MIAppExtensionBundle extensionPoint](self, "extensionPoint") - 1 < 3;
}

- (void)setBundleParentDirectoryURL:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIAppExtensionBundle;
  -[MIExecutableBundle setBundleParentDirectoryURL:](&v3, sel_setBundleParentDirectoryURL_, a3);
}

- (id)dataContainerForPersona:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIAppExtensionBundle;
  -[MIExecutableBundle dataContainerForPersona:error:](&v5, sel_dataContainerForPersona_error_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  BOOL v12;
  void *v13;
  objc_super v15;
  BOOL v16;

  v16 = 0;
  v15.receiver = self;
  v15.super_class = (Class)MIAppExtensionBundle;
  -[MIExecutableBundle dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:](&v15, sel_dataContainerCreatingIfNeeded_forPersona_makeLive_created_error_, a3, a4, a5, &v16, a7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = v16;
  if (a6)
    *a6 = v16;
  if (v9)
    v12 = !v11;
  else
    v12 = 1;
  if (!v12)
  {
    -[MIBundle parentBundleID](self, "parentBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setParentBundleID:", v13);

  }
  return v10;
}

- (BOOL)validateHasNoDotInBundleIDSuffix:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v17;

  -[MIBundle parentBundleID](self, "parentBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIAppExtensionBundle validationOverrideParentBundleID](self, "validationOverrideParentBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MIAppExtensionBundle validationOverrideParentBundleID](self, "validationOverrideParentBundleID");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v8, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "containsString:", CFSTR("."));
  if (v11)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle validateHasNoDotInBundleIDSuffix:]", 218, CFSTR("MIInstallerErrorDomain"), 89, 0, &unk_1E6CD4310, CFSTR("Appex bundle at \"%@\" with identifier \"%@\" contains a '.' in the portion after the parent app's prefix (prefix: \"%@\" ; dot in: \"%@\").'"),
      v14,
      (uint64_t)v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v15 = objc_retainAutorelease(v15);
      *a3 = v15;
    }
  }
  else
  {
    v15 = 0;
  }

  return v11 ^ 1;
}

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  -[MIBundle parentBundleID](self, "parentBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIAppExtensionBundle validationOverrideParentBundleID](self, "validationOverrideParentBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;

    v5 = v8;
  }
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "hasPrefix:", v9) & 1) == 0)
  {

    goto LABEL_10;
  }
  -[MIBundle identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  v13 = objc_msgSend(v9, "length");

  if (v12 <= v13)
  {
LABEL_10:
    -[MIBundle bundleURL](self, "bundleURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle validateBundleMetadataWithError:]", 269, CFSTR("MIInstallerErrorDomain"), 37, 0, &unk_1E6CD4338, CFSTR("Appex bundle at \"%@\" with identifier \"%@\" does not have expected identifier prefix \"%@\"), v25, (uint64_t)v23);
    goto LABEL_11;
  }
  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MIHasStringValueOfNonZeroLength(v14, *MEMORY[0x1E0C9AE90], 0);

  if (v15)
  {
    -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MIHasStringValueOfNonZeroLength(v16, *MEMORY[0x1E0C9AAF0], 1);

    if (v17)
    {
      -[MIBundle infoPlistSubset](self, "infoPlistSubset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MIHasStringValueOfNonZeroLength(v18, *MEMORY[0x1E0C9AE88], 0);

      if (v19)
      {
        v20 = 0;
        v21 = 1;
        goto LABEL_14;
      }
      -[MIBundle bundleURL](self, "bundleURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle validateBundleMetadataWithError:]", 287, CFSTR("MIInstallerErrorDomain"), 52, 0, &unk_1E6CD43B0, CFSTR("Appex bundle at %@ with ID %@ does not have a CFBundleName key with a non-zero length string value in its Info.plist"), v29, (uint64_t)v23);
    }
    else
    {
      -[MIBundle bundleURL](self, "bundleURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle validateBundleMetadataWithError:]", 281, CFSTR("MIInstallerErrorDomain"), 40, 0, &unk_1E6CD4388, CFSTR("Appex bundle at %@ with ID %@ has a CFBundleShortVersionString key with a non-string value in its Info.plist"), v28, (uint64_t)v23);
    }
  }
  else
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle validateBundleMetadataWithError:]", 275, CFSTR("MIInstallerErrorDomain"), 33, 0, &unk_1E6CD4360, CFSTR("Appex bundle at %@ with ID %@ does not have a CFBundleVersion key with a non-zero length string value in its Info.plist"), v27, (uint64_t)v23);
  }
LABEL_11:
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    v20 = objc_retainAutorelease(v20);
    v21 = 0;
    *a3 = v20;
  }
  else
  {
    v21 = 0;
  }
LABEL_14:

  return v21;
}

- (BOOL)validateHasCorrespondingEntitlements:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  BOOL v17;
  void *v18;
  uint64_t v20;

  v6 = a3;
  -[MIBundle parentBundleID](self, "parentBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MIAppExtensionBundle extensionPoint](self, "extensionPoint");
  if (MIHasBrowserEngineContentEntitlement(v6))
  {
    if (v8 != 1)
    {
      -[MIBundle relativePath](self, "relativePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (uint64_t)v9;
      v12 = CFSTR("The app extension at \"%@\" has the entitlement \"%@\" which is not allowed for an extension targeting the extension point \"%@\".");
      v13 = 317;
LABEL_21:
      v15 = 205;
      goto LABEL_22;
    }
  }
  else if (v8 == 1)
  {
    -[MIBundle relativePath](self, "relativePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (uint64_t)v9;
    v12 = CFSTR("The app extension at \"%@\" targets the extension point \"%@\" but is missing the corresponding required \"%@\" = TRUE (BOOLean) entitlement.");
    v13 = 322;
    goto LABEL_19;
  }
  if (MIHasBrowserEngineNetworkingEntitlement(v6))
  {
    if (v8 != 3)
    {
      -[MIBundle relativePath](self, "relativePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (uint64_t)v9;
      v12 = CFSTR("The app extension at \"%@\" has the entitlement \"%@\" which is not allowed for an extension targeting the extension point \"%@\".");
      v13 = 329;
      goto LABEL_21;
    }
  }
  else if (v8 == 3)
  {
    -[MIBundle relativePath](self, "relativePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (uint64_t)v9;
    v12 = CFSTR("The app extension at \"%@\" targets the extension point \"%@\" but is missing the corresponding required \"%@\" = TRUE (BOOLean) entitlement.");
    v13 = 334;
    goto LABEL_19;
  }
  if (!MIHasBrowserEngineRenderingEntitlement(v6))
  {
    if (v8 != 2)
    {
      if (v8 != 1)
      {
LABEL_30:
        v16 = 0;
        v17 = 1;
        goto LABEL_31;
      }
      MICopyMemoryTransferAcceptEntitlement(v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v18;
      if (v18 && v7 && !objc_msgSend(v18, "isEqualToString:", v7))
      {
        -[MIBundle relativePath](self, "relativePath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (uint64_t)v11;
        v12 = CFSTR("The app extension at \"%@\" specifies the entitlement \"%@\" = \"%@\" where the value does not match the parent app bundle's CFBundleIdentifier, \"%@\". This entitlement, if set, must have a value that matches the bundle identifier of the parent app.");
        v13 = 357;
        goto LABEL_33;
      }
LABEL_29:

      goto LABEL_30;
    }
    -[MIBundle relativePath](self, "relativePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (uint64_t)v9;
    v12 = CFSTR("The app extension at \"%@\" targets the extension point \"%@\" but is missing the corresponding required \"%@\" = TRUE (BOOLean) entitlement.");
    v13 = 346;
LABEL_19:
    v15 = 206;
    goto LABEL_22;
  }
  if (v8 != 2)
  {
    -[MIBundle relativePath](self, "relativePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (uint64_t)v9;
    v12 = CFSTR("The app extension at \"%@\" has the entitlement \"%@\" which is not allowed for an extension targeting the extension point \"%@\".");
    v13 = 341;
    goto LABEL_21;
  }
  MICopyMemoryTransferSendEntitlement(v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  if (!v14 || !v7 || objc_msgSend(v14, "isEqualToString:", v7))
    goto LABEL_29;
  -[MIBundle relativePath](self, "relativePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (uint64_t)v11;
  v12 = CFSTR("The app extension at \"%@\" specifies the entitlement \"%@\" = \"%@\" where the value does not match the parent app bundle's CFBundleIdentifier, \"%@\". This entitlement, if set, must have a value that matches the bundle identifier of the parent app.");
  v13 = 365;
LABEL_33:
  v15 = 207;
LABEL_22:
  _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle validateHasCorrespondingEntitlements:error:]", v13, CFSTR("MIInstallerErrorDomain"), v15, 0, 0, v12, v10, v20);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v16 = objc_retainAutorelease(v16);
    v17 = 0;
    *a4 = v16;
  }
  else
  {
    v17 = 0;
  }
LABEL_31:

  return v17;
}

- (id)extensionCacheEntryWithError:(id *)a3
{
  void *v5;
  NSDictionary **p_extensionCacheEntry;
  NSDictionary *v7;
  NSDictionary *v8;
  uint64_t active_platform;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v15;

  -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_extensionCacheEntry = &self->_extensionCacheEntry;
  v7 = self->_extensionCacheEntry;
  if (!v7)
  {
    if (v5)
    {
      active_platform = dyld_get_active_platform();
      v15 = 0;
      MICopyExtensionCacheEntryWithPlatform(v5, active_platform, &v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;
      if (v10)
      {
        objc_storeStrong((id *)p_extensionCacheEntry, v10);
LABEL_10:
        v8 = v10;

        goto LABEL_11;
      }
    }
    else
    {
      -[MIBundle identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIAppExtensionBundle extensionCacheEntryWithError:]", 391, CFSTR("MIInstallerErrorDomain"), 45, 0, 0, CFSTR("Extension point identifier was not set for app extension with bundle ID \"%@\"."), v13, (uint64_t)v12);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (a3)
    {
      v11 = objc_retainAutorelease(v11);
      v10 = 0;
      *a3 = v11;
    }
    else
    {
      v10 = 0;
    }
    goto LABEL_10;
  }
  v8 = v7;
LABEL_11:

  return v8;
}

- (void)setExtensionCacheEntry:(id)a3
{
  objc_storeStrong((id *)&self->_extensionCacheEntry, a3);
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (void)setExtensionPoint:(unint64_t)a3
{
  self->_extensionPoint = a3;
}

- (NSString)validationOverrideParentBundleID
{
  return self->_validationOverrideParentBundleID;
}

- (void)setValidationOverrideParentBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSDictionary)extensionCacheEntry
{
  return self->_extensionCacheEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionCacheEntry, 0);
  objc_storeStrong((id *)&self->_validationOverrideParentBundleID, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
}

@end
