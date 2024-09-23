@implementation MIPluginKitBundle

- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  -[MIBundle parentBundle](self, "parentBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isWatchApp"))
  {
    objc_msgSend(v7, "currentOSVersionForValidationUsingPlatform:withError:", a3, a4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MIPluginKitBundle;
    -[MIBundle currentOSVersionForValidationUsingPlatform:withError:](&v11, sel_currentOSVersionForValidationUsingPlatform_withError_, a3, a4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)bundlesInParentBundle:(id)a3 overrideParentBundleIDForValidation:(id)a4 subDirectory:(id)a5 matchingPredicate:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS___MIPluginKitBundle;
  objc_msgSendSuper2(&v24, sel_bundlesInParentBundle_subDirectory_matchingPredicate_error_, a3, a5, a6, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18++), "setValidationOverrideParentBundleID:", v12);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v16);
    }
  }

  return v14;
}

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a1, "bundlesInParentBundle:overrideParentBundleIDForValidation:subDirectory:matchingPredicate:error:", a3, 0, a4, a5, a6);
}

- (NSString)nsExtensionPointIdentifier
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSExtensionPointIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return (NSString *)v8;
}

- (NSString)exExtensionPointIdentifier
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("EXAppExtensionAttributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EXExtensionPointIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return (NSString *)v8;
}

- (id)extensionPointIdentifier
{
  NSString *extensionPointIdentifier;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  extensionPointIdentifier = self->_extensionPointIdentifier;
  if (!extensionPointIdentifier)
  {
    -[MIPluginKitBundle exExtensionPointIdentifier](self, "exExtensionPointIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_extensionPointIdentifier;
    self->_extensionPointIdentifier = v4;

    extensionPointIdentifier = self->_extensionPointIdentifier;
    if (!extensionPointIdentifier)
    {
      -[MIPluginKitBundle nsExtensionPointIdentifier](self, "nsExtensionPointIdentifier");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_extensionPointIdentifier;
      self->_extensionPointIdentifier = v6;

      extensionPointIdentifier = self->_extensionPointIdentifier;
    }
  }
  return extensionPointIdentifier;
}

- (NSDictionary)extensionAttributes
{
  NSDictionary *extensionAttributes;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSDictionary *v10;
  NSDictionary *v11;

  extensionAttributes = self->_extensionAttributes;
  if (!extensionAttributes)
  {
    -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSExtension"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v9 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = (NSDictionary *)v9;
      else
        v10 = 0;

      v11 = self->_extensionAttributes;
      self->_extensionAttributes = v10;

    }
    extensionAttributes = self->_extensionAttributes;
  }
  return extensionAttributes;
}

- (BOOL)isWatchKitExtension
{
  void *v2;
  char v3;

  -[MIPluginKitBundle extensionPointIdentifier](self, "extensionPointIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.watchkit"));

  return v3;
}

- (BOOL)isSiriIntentsExtension
{
  void *v2;
  char v3;

  -[MIPluginKitBundle extensionPointIdentifier](self, "extensionPointIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.intents-service"));

  return v3;
}

- (BOOL)isSiriIntentsUIExtension
{
  void *v2;
  char v3;

  -[MIPluginKitBundle extensionPointIdentifier](self, "extensionPointIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.intents-ui-service"));

  return v3;
}

- (BOOL)isMessagePayloadProviderExtension
{
  void *v2;
  char v3;

  -[MIPluginKitBundle extensionPointIdentifier](self, "extensionPointIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.message-payload-provider"));

  return v3;
}

- (BOOL)isFileProviderNonUIExtension
{
  void *v2;
  char v3;

  -[MIPluginKitBundle extensionPointIdentifier](self, "extensionPointIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.fileprovider-nonui"));

  return v3;
}

- (BOOL)isMapsGeoServicesExtension
{
  void *v2;
  char v3;

  -[MIPluginKitBundle extensionPointIdentifier](self, "extensionPointIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.geoservices.mapdata"));

  return v3;
}

- (BOOL)mayContainFrameworks
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MIPluginKitBundle;
  return -[MIBundle mayContainFrameworks](&v4, sel_mayContainFrameworks)
      || -[MIPluginKitBundle isWatchKitExtension](self, "isWatchKitExtension");
}

- (id)_overlayDictionary:(id)a3 onDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  MIPluginKitBundle *v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__MIPluginKitBundle__overlayDictionary_onDictionary___block_invoke;
  v13[3] = &unk_1E6CB7158;
  v14 = v6;
  v15 = v8;
  v16 = self;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);

  v11 = (void *)objc_msgSend(v9, "copy");
  return v11;
}

void __53__MIPluginKitBundle__overlayDictionary_onDictionary___block_invoke(id *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  *a4 = 0;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1[6], "_overlayDictionary:onDictionary:", v7, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v9, v10);

      }
    }
  }
  else
  {
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v7, v10);
  }

}

- (id)overlaidInfoPlistWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  -[MIPluginKitBundle overlaidInfoPlist](self, "overlaidInfoPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
    goto LABEL_3;
  }
  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  if (!v11)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 177, CFSTR("MIInstallerErrorDomain"), 39, 0, &unk_1E6CD3A00, CFSTR("Appex bundle at %@ with id %@ does not define an NSExtension dictionary in its Info.plist"), v17, (uint64_t)v16);
    v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
    goto LABEL_23;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSExtensionPointIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  if (!v14)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 184, CFSTR("MIInstallerErrorDomain"), 45, 0, &unk_1E6CD3A28, CFSTR("Appex bundle at %@ with id %@ does not define a NSExtensionPointIdentifier key with a string value in the NSExtension dictionary in its Info.plist"), v24, (uint64_t)v22);
LABEL_19:
    v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
LABEL_21:

    goto LABEL_22;
  }
  if ((MIIsValidRDNSString(v13) & 1) == 0)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 190, CFSTR("MIInstallerErrorDomain"), 46, 0, &unk_1E6CD3A50, CFSTR("Appex bundle at %@ with id %@ does not have a legal value for the NSExtensionPointIdentifier key in the NSExtension dictionary in its Info.plist; found: %@"),
      v25,
      (uint64_t)v22);
    goto LABEL_19;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("EXAppExtensionAttributes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v19 = v18;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("EXExtensionPointIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_opt_class();
    v27 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((MIIsValidRDNSString(v27) & 1) != 0)
      {

        goto LABEL_32;
      }
      v48 = v20;
      -[MIBundle bundleURL](self, "bundleURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "path");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 202, CFSTR("MIInstallerErrorDomain"), 46, 0, &unk_1E6CD3A78, CFSTR("Appex bundle at %@ with id %@ does not have a legal value for the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist; found: %@"),
        v39,
        (uint64_t)v34);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      v32 = v27;
    }
    else
    {
      v48 = v20;

      -[MIBundle bundleURL](self, "bundleURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 206, CFSTR("MIInstallerErrorDomain"), 45, 0, &unk_1E6CD3AA0, CFSTR("Appex bundle at %@ with id %@ defines an EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist with a value that is not a string."), v35, (uint64_t)v33);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_21;
  }
LABEL_32:
  -[MIPluginKitBundle extensionPointIdentifier](self, "extensionPointIdentifier");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "path");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 215, CFSTR("MIInstallerErrorDomain"), 45, 0, &unk_1E6CD3AC8, CFSTR("Appex bundle at %@ with id %@ does not define an extension point in its Info.plist"), v38, (uint64_t)v37);
    v21 = v20;
    v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  v29 = (void *)v28;
  v47 = v20;
  v49 = 0;
  -[MIAppExtensionBundle extensionCacheEntryWithError:](self, "extensionCacheEntryWithError:", &v49);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v49;
  if (v30)
  {
    -[MIPluginKitBundle _overlayDictionary:onDictionary:](self, "_overlayDictionary:onDictionary:", v30, v8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIPluginKitBundle setOverlaidInfoPlist:](self, "setOverlaidInfoPlist:", v31);
  }
  else
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "path");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 223, CFSTR("MIInstallerErrorDomain"), 59, v6, &unk_1E6CD3AF0, CFSTR("Appex bundle at %@ with id %@ specifies a value (%@) for the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist that does not correspond to a known extension point."), v40, (uint64_t)v46);
    else
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]", 225, CFSTR("MIInstallerErrorDomain"), 59, v6, &unk_1E6CD3B18, CFSTR("Appex bundle at %@ with id %@ specifies a value (%@) for the NSExtensionPointIdentifier key in the NSExtension dictionary in its Info.plist that does not correspond to a known extension point."), v40, (uint64_t)v46);
    v45 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v45;
  }

  if (!v30)
  {
LABEL_23:
    v7 = 0;
    if (!a3)
      goto LABEL_26;
    goto LABEL_24;
  }
LABEL_3:
  -[MIPluginKitBundle overlaidInfoPlist](self, "overlaidInfoPlist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
    goto LABEL_26;
LABEL_24:
  if (!v7)
    *a3 = objc_retainAutorelease(v6);
LABEL_26:

  return v7;
}

- (BOOL)_validateXPCServiceWithOverlaidDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("XPCService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]", 250, CFSTR("MIInstallerErrorDomain"), 38, 0, &unk_1E6CD3B40, CFSTR("Appex bundle at %@ with id %@ defines a value for the \"XPCService\" key in its Info.plist that is not a dictionary."), v16, (uint64_t)v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v11 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RunLoopType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v8, "length"))
    {
      -[MIBundle bundleURL](self, "bundleURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]", 260, CFSTR("MIInstallerErrorDomain"), 50, 0, &unk_1E6CD3B68, CFSTR("Appex bundle at %@ with id %@ has an illegal value for the RunLoopType key in the XPCService dictionary in its Info.plist"), v19, (uint64_t)v15);
LABEL_19:
      v12 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("_UIApplicationMain")))
  {
    -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MIHasRequiredStringValueOfNonZeroLengthCF(v9, *MEMORY[0x1E0C9AAC8]);

    if (!v10)
    {
      -[MIBundle bundleURL](self, "bundleURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]", 266, CFSTR("MIInstallerErrorDomain"), 53, 0, &unk_1E6CD3B90, CFSTR("Appex bundle at %@ with ID %@ does not have a CFBundleDisplayName key with a non-zero length string value in its Info.plist"), v21, (uint64_t)v15);
      goto LABEL_19;
    }
  }
  if (!MIHasStringValueOfNonZeroLengthIfDefined(v7, (uint64_t)CFSTR("ServiceType")))
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]", 272, CFSTR("MIInstallerErrorDomain"), 51, 0, &unk_1E6CD3BB8, CFSTR("Appex bundle at %@ with id %@ has an illegal value for the ServiceType key in the XPCService dictionary in its Info.plist"), v20, (uint64_t)v15);
    goto LABEL_19;
  }

LABEL_10:
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAE0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v11, "isEqualToString:", CFSTR("XPC!")) & 1) != 0)
  {
    v12 = 0;
    v13 = 1;
    goto LABEL_24;
  }
  -[MIBundle bundleURL](self, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:]", 280, CFSTR("MIInstallerErrorDomain"), 41, 0, &unk_1E6CD3BE0, CFSTR("Appex bundle at %@ with id %@ has an illegal value for the CFBundlePackageType key in its Info.plist: %@"), v17, (uint64_t)v14);
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

  if (a4)
  {
    v12 = objc_retainAutorelease(v12);
    v13 = 0;
    *a4 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_24:

  return v13;
}

- (BOOL)_validateNSExtensionWithOverlaidDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  id obj;
  unint64_t v88;
  id v89;
  unint64_t v90;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[MIBundle parentBundle](self, "parentBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isWatchApp");

  if (v7)
    v8 = CFSTR("7.0");
  else
    v8 = CFSTR("14.0");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  if (!v11)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 331, CFSTR("MIInstallerErrorDomain"), 39, 0, &unk_1E6CD3C08, CFSTR("Appex bundle at %@ with id %@ does not define an NSExtension dictionary in its Info.plist"), v16, (uint64_t)v15);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    goto LABEL_65;
  }
  v89 = v5;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSExtensionMainStoryboard"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v90 = (unint64_t)v13;
  else
    v90 = 0;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSExtensionPrincipalClass"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v24 = v23;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v24;
  else
    v20 = 0;

  v96 = 0;
  -[MIAppExtensionBundle extensionCacheEntryWithError:](self, "extensionCacheEntryWithError:", &v96);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v96;
  if (!v21)
  {
    v18 = 0;
    v22 = 0;
    v19 = (void *)v90;
    goto LABEL_65;
  }
  v88 = (unint64_t)v20;
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v22 = v25;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v22;
  else
    v26 = 0;

  if (!v26)
  {
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 345, CFSTR("MIInstallerErrorDomain"), 154, 0, 0, CFSTR("Extension cache does not define an NSExtension dictionary in its Info.plist: %@"), v27, (uint64_t)v21);
    v34 = objc_claimAutoreleasedReturnValue();

    goto LABEL_30;
  }
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("NSExtensionPrincipalClassProhibited"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MIBooleanValue(v28, 0);

  if (v29 && !-[MIBundle isApplicableToOSVersionEarlierThan:](self, "isApplicableToOSVersionEarlierThan:", v8))
  {
    if (v90 | v88)
    {
      -[MIBundle bundleURL](self, "bundleURL");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "path");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIPluginKitBundle extensionPointIdentifier](self, "extensionPointIdentifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 362, CFSTR("MIInstallerErrorDomain"), 152, 0, &unk_1E6CD3C58, CFSTR("Appex bundle at %@ with id %@ defines either an NSExtensionMainStoryboard or NSExtensionPrincipalClass key, which is not allowed for the extension point %@"), v40, (uint64_t)v38);
      v41 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v90;
      v20 = (id)v88;

      v18 = 0;
      v17 = (id)v41;
      goto LABEL_65;
    }
    goto LABEL_36;
  }
  if (v90 | v88 && (!v90 || objc_msgSend((id)v90, "length")) && (!v88 || objc_msgSend((id)v88, "length")))
  {
LABEL_36:
    if (!MIHasStringValueOfNonZeroLengthIfDefined(v11, (uint64_t)CFSTR("NSExtensionContextClass")))
    {
      -[MIBundle bundleURL](self, "bundleURL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 369, CFSTR("MIInstallerErrorDomain"), 43, 0, &unk_1E6CD3C80, CFSTR("Appex bundle at %@ with id %@ does not have a string value for the NSExtensionContextClass key in the NSExtension dictionary in its Info.plist"), v52, (uint64_t)v31);
      goto LABEL_64;
    }
    if (!MIHasStringValueOfNonZeroLengthIfDefined(v11, (uint64_t)CFSTR("NSExtensionContextHostClass")))
    {
      -[MIBundle bundleURL](self, "bundleURL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 375, CFSTR("MIInstallerErrorDomain"), 44, 0, &unk_1E6CD3CA8, CFSTR("Appex bundle at %@ with id %@ does not have a string value for the NSExtensionContextHostClass key in the NSExtension dictionary in its Info.plist"), v53, (uint64_t)v31);
      goto LABEL_64;
    }
    if (MIHasStringValueOfNonZeroLengthIfDefined(v11, (uint64_t)CFSTR("NSExtensionViewControllerHostClass")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
LABEL_61:
        v36 = 1;
        v5 = v89;
        v19 = (void *)v90;
        v20 = (id)v88;
        goto LABEL_67;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = a4;
        if (MIHasStringValueOfNonZeroLengthIfDefined(v18, (uint64_t)CFSTR("NSExtensionPointName")))
        {
          if (MIHasStringValueOfNonZeroLengthIfDefined(v18, (uint64_t)CFSTR("NSExtensionPointVersion")))
          {
            if (!-[MIPluginKitBundle isSiriIntentsExtension](self, "isSiriIntentsExtension")
              && !-[MIPluginKitBundle isSiriIntentsUIExtension](self, "isSiriIntentsUIExtension"))
            {
              goto LABEL_61;
            }
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("IntentsSupported"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            _MIValidateObject(v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v43 && (objc_opt_class(), MIArrayContainsOnlyClass(v43)) && objc_msgSend(v43, "count"))
            {
              objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("IntentsRestrictedWhileLocked"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v44)
              {
LABEL_60:

                goto LABEL_61;
              }
              v85 = v43;
              objc_opt_class();
              v86 = v44;
              _MIValidateObject(v44);
              v45 = objc_claimAutoreleasedReturnValue();
              if (v45)
              {
                v46 = (void *)v45;
                objc_opt_class();
                v47 = MIArrayContainsOnlyClass(v44);

                if ((v47 & 1) != 0)
                {
                  v94 = 0u;
                  v95 = 0u;
                  v92 = 0u;
                  v93 = 0u;
                  obj = v86;
                  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
                  if (v48)
                  {
                    v49 = v48;
                    v50 = *(_QWORD *)v93;
                    while (2)
                    {
                      for (i = 0; i != v49; ++i)
                      {
                        if (*(_QWORD *)v93 != v50)
                          objc_enumerationMutation(obj);
                        if (!objc_msgSend(v85, "containsObject:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i)))
                        {
                          -[MIBundle bundleURL](self, "bundleURL");
                          v74 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v74, "path");
                          v75 = (void *)objc_claimAutoreleasedReturnValue();
                          -[MIBundle identifier](self, "identifier");
                          v83 = objc_claimAutoreleasedReturnValue();
                          _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 429, CFSTR("MIInstallerErrorDomain"), 116, 0, &unk_1E6CD3DC0, CFSTR("Siri Intents Appex bundle at %@ with id %@ specifies a value in the IntentsRestrictedWhileLocked key's array value in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist that is not a listed in the the IntentsSupported key's array."), v78, (uint64_t)v75);
                          v77 = objc_claimAutoreleasedReturnValue();

                          v17 = (id)v83;
                          goto LABEL_76;
                        }
                      }
                      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
                      if (v49)
                        continue;
                      break;
                    }
                  }

                  v43 = v85;
                  v44 = v86;
                  goto LABEL_60;
                }
              }
              -[MIBundle bundleURL](self, "bundleURL");
              obj = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "path");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              -[MIBundle identifier](self, "identifier");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 421, CFSTR("MIInstallerErrorDomain"), 115, 0, &unk_1E6CD3D98, CFSTR("Siri Intents Appex bundle at %@ with id %@ defines an IntentsRestrictedWhileLocked key in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist, but that key's value is not an array of strings."), v76, (uint64_t)v74);
              v77 = objc_claimAutoreleasedReturnValue();
LABEL_76:

              v17 = (id)v77;
            }
            else
            {
              -[MIBundle bundleURL](self, "bundleURL");
              v69 = v43;
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "path");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              -[MIBundle identifier](self, "identifier");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 412, CFSTR("MIInstallerErrorDomain"), 114, 0, &unk_1E6CD3D70, CFSTR("Siri Intents Appex bundle at %@ with id %@ does not define an IntentsSupported key with an array value containing strings in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist."), v72, (uint64_t)v71);
              v73 = objc_claimAutoreleasedReturnValue();

              v17 = (id)v73;
            }
            goto LABEL_31;
          }
          -[MIBundle bundleURL](self, "bundleURL");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "path");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIBundle identifier](self, "identifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 403, CFSTR("MIInstallerErrorDomain"), 49, 0, &unk_1E6CD3D48, CFSTR("Appex bundle at %@ with id %@ does not define a NSExtensionPointVersion key with a string value in the NSExtensionAttributes dictionary in the NSExtension dictionary in its Info.plist"), v67, (uint64_t)v64);
        }
        else
        {
          -[MIBundle bundleURL](self, "bundleURL");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "path");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIBundle identifier](self, "identifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 397, CFSTR("MIInstallerErrorDomain"), 48, 0, &unk_1E6CD3D20, CFSTR("Appex bundle at %@ with id %@ does not define a NSExtensionPointName key with a string value in the NSExtensionAttributes dictionary in the NSExtension dictionary in its Info.plist"), v66, (uint64_t)v64);
        }
        v68 = objc_claimAutoreleasedReturnValue();

        v17 = (id)v68;
        v5 = v89;
LABEL_32:
        v19 = (void *)v90;
        v20 = (id)v88;
        if (v35)
        {
LABEL_66:
          v17 = objc_retainAutorelease(v17);
          v36 = 0;
          *v35 = v17;
          goto LABEL_67;
        }
        goto LABEL_33;
      }
      -[MIBundle bundleURL](self, "bundleURL");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "path");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 390, CFSTR("MIInstallerErrorDomain"), 47, 0, &unk_1E6CD3CF8, CFSTR("Appex bundle at %@ with id %@ does not define a NSExtensionAttributes key with a dictionary value in the NSExtension dictionary in its Info.plist"), v61, (uint64_t)v60);
      v62 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v62;
LABEL_31:
      v5 = v89;
      v35 = a4;
      goto LABEL_32;
    }
    -[MIBundle bundleURL](self, "bundleURL");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "path");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 381, CFSTR("MIInstallerErrorDomain"), 68, 0, &unk_1E6CD3CD0, CFSTR("Appex bundle at %@ with id %@ does not have a string value for the NSExtensionViewControllerHostClass key in the NSExtension dictionary in its Info.plist"), v58, (uint64_t)v57);
    v34 = objc_claimAutoreleasedReturnValue();

LABEL_30:
    v18 = 0;
    v17 = (id)v34;
    goto LABEL_31;
  }
  -[MIBundle bundleURL](self, "bundleURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError((uint64_t)"-[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:]", 357, CFSTR("MIInstallerErrorDomain"), 42, 0, &unk_1E6CD3C30, CFSTR("Appex bundle at %@ with id %@ does not define either an NSExtensionMainStoryboard or NSExtensionPrincipalClass key with a string value in the NSExtension dictionary in its Info.plist"), v33, (uint64_t)v31);
LABEL_64:
  v54 = objc_claimAutoreleasedReturnValue();

  v20 = (id)v88;
  v18 = 0;
  v17 = (id)v54;
  v19 = (void *)v90;
LABEL_65:
  v35 = a4;
  if (a4)
    goto LABEL_66;
LABEL_33:
  v36 = 0;
LABEL_67:

  return v36;
}

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  _BOOL4 v10;
  BOOL v11;
  id v13;
  id v14;
  objc_super v15;
  id v16;
  id v17;

  v17 = 0;
  -[MIPluginKitBundle overlaidInfoPlistWithError:](self, "overlaidInfoPlistWithError:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  v7 = v6;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)MIPluginKitBundle;
    v16 = v6;
    v8 = -[MIAppExtensionBundle validateBundleMetadataWithError:](&v15, sel_validateBundleMetadataWithError_, &v16);
    v9 = v16;

    if (!v8)
    {
      v11 = 0;
LABEL_8:
      v7 = v9;
      if (!a3)
        goto LABEL_11;
      goto LABEL_9;
    }
    v14 = v9;
    v10 = -[MIPluginKitBundle _validateXPCServiceWithOverlaidDictionary:error:](self, "_validateXPCServiceWithOverlaidDictionary:error:", v5, &v14);
    v7 = v14;

    if (v10)
    {
      v13 = v7;
      v11 = -[MIPluginKitBundle _validateNSExtensionWithOverlaidDictionary:error:](self, "_validateNSExtensionWithOverlaidDictionary:error:", v5, &v13);
      v9 = v13;

      goto LABEL_8;
    }
  }
  v11 = 0;
  if (!a3)
    goto LABEL_11;
LABEL_9:
  if (!v11)
    *a3 = objc_retainAutorelease(v7);
LABEL_11:

  return v11;
}

- (NSDictionary)overlaidInfoPlist
{
  return self->_overlaidInfoPlist;
}

- (void)setOverlaidInfoPlist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlaidInfoPlist, 0);
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
}

@end
