@implementation MIExtensionKitBundle

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MIExtensionKitBundle;
  objc_msgSendSuper2(&v7, sel_bundlesInParentBundle_subDirectory_matchingPredicate_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)extensionPointIdentifier
{
  NSString *extensionPointIdentifier;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSString *v8;
  NSString *v9;

  extensionPointIdentifier = self->_extensionPointIdentifier;
  if (!extensionPointIdentifier)
  {
    -[MIExtensionKitBundle extensionAttributes](self, "extensionAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EXExtensionPointIdentifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v7 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = (NSString *)v7;
      else
        v8 = 0;

      v9 = self->_extensionPointIdentifier;
      self->_extensionPointIdentifier = v8;

    }
    extensionPointIdentifier = self->_extensionPointIdentifier;
  }
  return extensionPointIdentifier;
}

- (NSDictionary)extensionAttributes
{
  NSDictionary *extensionAttributes;
  void *v4;
  void *v5;
  id v6;
  NSDictionary *v7;
  NSDictionary *v8;

  extensionAttributes = self->_extensionAttributes;
  if (!extensionAttributes)
  {
    -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EXAppExtensionAttributes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = (NSDictionary *)v6;
    else
      v7 = 0;

    v8 = self->_extensionAttributes;
    self->_extensionAttributes = v7;

    extensionAttributes = self->_extensionAttributes;
  }
  return extensionAttributes;
}

- (BOOL)getMayTargetThirdPartyExtensionPoint:(BOOL *)a3 withError:(id *)a4
{
  BOOL v5;

  v5 = -[MIBundle isApplicableToOSVersionEarlierThan:](self, "isApplicableToOSVersionEarlierThan:", CFSTR("17.0"), a4);
  if (a3)
    *a3 = !v5;
  return 1;
}

- (BOOL)_validatePresenceOfSwiftEntrySectionInFile:(int)a3 shouldHaveSwiftEntry:(BOOL)a4 withError:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  int v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  _QWORD v18[5];
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[MIExecutableBundle executableURL](self, "executableURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__MIExtensionKitBundle__validatePresenceOfSwiftEntrySectionInFile_shouldHaveSwiftEntry_withError___block_invoke;
  v18[3] = &unk_1E6CB71A8;
  v18[4] = &v20;
  v19 = a4;
  v9 = (void *)MEMORY[0x1BCCAA218](v18);
  v10 = objc_retainAutorelease(v8);
  if ((parse_macho_iterate_slices_fd(a3, objc_msgSend(v10, "fileSystemRepresentation"), (uint64_t)v9) & 1) != 0)
  {
    if (*((_BYTE *)v21 + 24))
    {
      v12 = 0;
      v13 = 1;
      goto LABEL_9;
    }
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle _validatePresenceOfSwiftEntrySectionInFile:shouldHaveSwiftEntry:withError:]", 137, CFSTR("MIInstallerErrorDomain"), 73, 0, &unk_1E6CD3E10, CFSTR("Expected executable at \"%@\" %@to have a __swift5_entry section"), v11, (uint64_t)v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = *((unsigned __int8 *)v21 + 24);
    if (!a5)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(v10, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle _validatePresenceOfSwiftEntrySectionInFile:shouldHaveSwiftEntry:withError:]", 131, CFSTR("MIInstallerErrorDomain"), 73, 0, &unk_1E6CD3DE8, CFSTR("Could not iterate slices in macho %@"), v15, (uint64_t)v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    *((_BYTE *)v21 + 24) = 0;
    if (!a5)
      goto LABEL_9;
  }
  if (!v13)
  {
    v12 = objc_retainAutorelease(v12);
    *a5 = v12;
    v13 = *((unsigned __int8 *)v21 + 24);
  }
LABEL_9:
  v16 = v13 != 0;

  _Block_object_dispose(&v20, 8);
  return v16;
}

uint64_t __98__MIExtensionKitBundle__validatePresenceOfSwiftEntrySectionInFile_shouldHaveSwiftEntry_withError___block_invoke(uint64_t a1, int a2, mach_header_64 *mhp)
{
  uint8_t *v4;
  unint64_t size;

  size = 0;
  v4 = getsectiondata(mhp, "__TEXT", "__swift5_entry", &size);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_BYTE *)(a1 + 40) == (((unint64_t)v4 | size) != 0);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (BOOL)_validateDelegateClassWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;
  id v18;
  _BOOL4 v19;
  uint64_t v20;
  int v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v30;
  id v31;

  -[MIExecutableBundle executableURL](self, "executableURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExtensionKitBundle extensionAttributes](self, "extensionAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EXPrincipalClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    v8 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v8, "length"))
      {

        goto LABEL_5;
      }
      -[MIBundle bundleURL](self, "bundleURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle _validateDelegateClassWithError:]", 167, CFSTR("MIInstallerErrorDomain"), 185, 0, &unk_1E6CD3E38, CFSTR("Appex bundle at %@ with id %@ defines an EXPrincipalClass key in the EXAppExtensionAttributes dictionary in its Info.plist with a zero length string."), v20, (uint64_t)v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {

      -[MIBundle bundleURL](self, "bundleURL");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle _validateDelegateClassWithError:]", 171, CFSTR("MIInstallerErrorDomain"), 183, 0, &unk_1E6CD3E60, CFSTR("Appex bundle at %@ with id %@ defines an EXPrincipalClass key in the EXAppExtensionAttributes dictionary in its Info.plist with a value that is not a string."), v13, (uint64_t)v11);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_17;
  }
LABEL_5:
  if (-[MIBundle isPlaceholder](self, "isPlaceholder"))
  {
    v9 = 0;
    v10 = 1;
    goto LABEL_20;
  }
  v14 = objc_retainAutorelease(v5);
  v15 = open((const char *)objc_msgSend(v14, "fileSystemRepresentation"), 256);
  if ((v15 & 0x80000000) != 0)
  {
    v21 = *__error();
    v22 = (void *)*MEMORY[0x1E0CB2FE0];
    v23 = objc_retainAutorelease(v14);
    v24 = objc_msgSend(v23, "fileSystemRepresentation");
    strerror(v21);
    _CreateError((uint64_t)"-[MIExtensionKitBundle _validateDelegateClassWithError:]", 181, v22, v21, 0, 0, CFSTR("Failed to open %s: %s"), v25, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle _validateDelegateClassWithError:]", 181, CFSTR("MIInstallerErrorDomain"), 73, v26, &unk_1E6CD3E88, CFSTR("Failed to open executable %@ to validate sections."), v28, (uint64_t)v27);
    v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
    v10 = 0;
    if (!a3)
      goto LABEL_20;
    goto LABEL_18;
  }
  v16 = v15;
  v31 = 0;
  v17 = -[MIExtensionKitBundle _validatePresenceOfSwiftEntrySectionInFile:shouldHaveSwiftEntry:withError:](self, "_validatePresenceOfSwiftEntrySectionInFile:shouldHaveSwiftEntry:withError:", v15, v7 == 0, &v31);
  v18 = v31;
  v19 = v18 == 0;
  v10 = v17 && v19;
  if (v17 && v19)
    v9 = 0;
  else
    v9 = v18;
  close(v16);
  if (a3)
  {
LABEL_18:
    if ((v10 & 1) == 0)
    {
      v9 = objc_retainAutorelease(v9);
      v10 = 0;
      *a3 = v9;
    }
  }
LABEL_20:

  return v10 & 1;
}

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  unsigned int v8;
  id v9;
  id v10;
  _BOOL4 v11;
  id v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  id v16;
  _BOOL4 v17;
  char v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  char v49;
  id v50;
  id v51;
  objc_super v52;
  id v53;

  -[MIExtensionKitBundle extensionAttributes](self, "extensionAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExtensionKitBundle extensionPointIdentifier](self, "extensionPointIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MIAppExtensionBundle targetsAppleExtensionPoint](self, "targetsAppleExtensionPoint");
  v52.receiver = self;
  v52.super_class = (Class)MIExtensionKitBundle;
  v53 = 0;
  v8 = -[MIAppExtensionBundle validateBundleMetadataWithError:](&v52, sel_validateBundleMetadataWithError_, &v53);
  v9 = v53;
  v10 = v9;
  if (!v8)
    goto LABEL_17;
  v51 = v9;
  v11 = -[MIAppExtensionBundle validateHasNoDotInBundleIDSuffix:](self, "validateHasNoDotInBundleIDSuffix:", &v51);
  v12 = v51;

  if (!v11)
  {
    v16 = 0;
    if (!a3)
    {
LABEL_28:
      v20 = 0;
      v19 = 0;
      goto LABEL_29;
    }
LABEL_20:
    v12 = objc_retainAutorelease(v12);
    v20 = 0;
    v19 = 0;
    *a3 = v12;
    goto LABEL_29;
  }
  if (!v5)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 225, CFSTR("MIInstallerErrorDomain"), 182, 0, &unk_1E6CD3EB0, CFSTR("Appex bundle at %@ with id %@ does not define an EXAppExtensionAttributes dictionary in its Info.plist"), v23, (uint64_t)v22);
    v24 = objc_claimAutoreleasedReturnValue();

    v16 = 0;
    v12 = (id)v24;
    goto LABEL_27;
  }
  v50 = v12;
  v13 = -[MIExtensionKitBundle _validateDelegateClassWithError:](self, "_validateDelegateClassWithError:", &v50);
  v10 = v50;

  if (!v13)
  {
LABEL_17:
    v16 = 0;
    v12 = v10;
    if (!a3)
      goto LABEL_28;
    goto LABEL_20;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EXExtensionPointIdentifier"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 258, CFSTR("MIInstallerErrorDomain"), 45, 0, &unk_1E6CD3F50, CFSTR("Appex bundle at %@ with id %@ does not define the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist."), v26, (uint64_t)v25);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    goto LABEL_27;
  }
  v15 = (void *)v14;
  objc_opt_class();
  v16 = v15;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    -[MIBundle bundleURL](self, "bundleURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 254, CFSTR("MIInstallerErrorDomain"), 45, 0, &unk_1E6CD3F28, CFSTR("Appex bundle at %@ with id %@ defines an EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist with a value that is not a string."), v29, (uint64_t)v27);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if ((MIIsValidRDNSString(v16) & 1) == 0)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v43 = objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 240, CFSTR("MIInstallerErrorDomain"), 46, 0, &unk_1E6CD3ED8, CFSTR("Appex bundle at %@ with id %@ does not have a legal value for the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist; found: %@"),
      v30,
      (uint64_t)v28);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (id)v43;
    v21 = v16;
    goto LABEL_25;
  }
  v49 = 0;
  v48 = v10;
  v17 = -[MIExtensionKitBundle getMayTargetThirdPartyExtensionPoint:withError:](self, "getMayTargetThirdPartyExtensionPoint:withError:", &v49, &v48);
  v12 = v48;

  if (!v17)
  {
LABEL_31:
    v21 = v16;
    goto LABEL_27;
  }
  if (v49)
    v18 = 1;
  else
    v18 = v7;
  if ((v18 & 1) == 0)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "path");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 250, CFSTR("MIInstallerErrorDomain"), 59, 0, &unk_1E6CD3F00, CFSTR("Appex bundle at %@ with id %@ does not specify an Apple extension point as the value of the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist; found: %@"),
      v34,
      (uint64_t)v33);
    v35 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v35;
    goto LABEL_31;
  }

  if (!v6)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 264, CFSTR("MIInstallerErrorDomain"), 45, 0, &unk_1E6CD3F78, CFSTR("Appex bundle at %@ with id %@ does not define an extension point in its Info.plist"), v37, (uint64_t)v36);
    v38 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v38;
LABEL_27:

    if (!a3)
      goto LABEL_28;
    goto LABEL_20;
  }
  if (v7
    && !-[MIExecutableBundle allowsAppleAppExtensionsNotInExtensionCache](self, "allowsAppleAppExtensionsNotInExtensionCache"))
  {
    v47 = v12;
    -[MIAppExtensionBundle extensionCacheEntryWithError:](self, "extensionCacheEntryWithError:", &v47);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v47;

    if (v19)
    {
      v20 = 1;
      v12 = v39;
      goto LABEL_29;
    }
    -[MIBundle bundleURL](self, "bundleURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]", 272, CFSTR("MIInstallerErrorDomain"), 59, v39, &unk_1E6CD3FA0, CFSTR("Appex bundle at %@ with id %@ specifies a value (%@) for the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist that does not correspond to a known extension point."), v40, (uint64_t)v27);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_26;
  }
  v19 = 0;
  v20 = 1;
LABEL_29:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
}

@end
