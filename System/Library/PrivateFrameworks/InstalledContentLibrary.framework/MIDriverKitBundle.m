@implementation MIDriverKitBundle

- (MIDriverKitBundle)initWithBundleParentURL:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  MIDriverKitBundle *result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  result = (MIDriverKitBundle *)_os_crash();
  __break(1u);
  return result;
}

- (id)minimumOSVersion
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("OSMinimumDriverKitVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4
{
  int *v6;
  int v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  utsname v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  bzero(&v16, 0x500uLL);
  if (uname(&v16))
  {
    v6 = __error();
    v7 = *v6;
    _CreateError((uint64_t)"-[MIDriverKitBundle currentOSVersionForValidationUsingPlatform:withError:]", 47, (void *)*MEMORY[0x1E0CB2FE0], *v6, 0, 0, CFSTR("uname() failed"), v8, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = strerror(v7);
    _CreateAndLogError((uint64_t)"-[MIDriverKitBundle currentOSVersionForValidationUsingPlatform:withError:]", 47, CFSTR("MIInstallerErrorDomain"), 4, v9, &unk_1E6CD4298, CFSTR("Failed to get DriverKit support version: %s"), v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16.release);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (!v13)
  {
    *a4 = objc_retainAutorelease(v12);
    goto LABEL_10;
  }
LABEL_7:
  if (a3 && v13)
    *a3 = 1;
LABEL_10:

  return v13;
}

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MIDriverKitBundle;
  objc_msgSendSuper2(&v7, sel_bundlesInParentBundle_subDirectory_matchingPredicate_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  BOOL v15;

  -[MIBundle parentBundleID](self, "parentBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle bundleURL](self, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasPrefix:", v7))
  {
    v11 = objc_msgSend(v6, "length");
    if (v11 > objc_msgSend(v7, "length"))
    {
      objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v7, "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "containsString:", CFSTR(".")))
      {
        v14 = 0;
        v15 = 1;
        goto LABEL_9;
      }
      _CreateAndLogError((uint64_t)"-[MIDriverKitBundle validateBundleMetadataWithError:]", 89, CFSTR("MIInstallerErrorDomain"), 177, 0, &unk_1E6CD42E8, CFSTR("DriverKit extension bundle at \"%@\" with identifier \"%@\" contains a '.' in the portion after the parent app's prefix (prefix: \"%@\" ; dot in: \"%@\").'"),
        v13,
        (uint64_t)v9);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (!a3)
        goto LABEL_5;
LABEL_7:
      v14 = objc_retainAutorelease(v14);
      v15 = 0;
      *a3 = v14;
      goto LABEL_9;
    }
  }
  _CreateAndLogError((uint64_t)"-[MIDriverKitBundle validateBundleMetadataWithError:]", 82, CFSTR("MIInstallerErrorDomain"), 176, 0, &unk_1E6CD42C0, CFSTR("DriverKit extension bundle at \"%@\" with identifier \"%@\" does not have expected identifier prefix \"%@\"), v10, (uint64_t)v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (a3)
    goto LABEL_7;
LABEL_5:
  v15 = 0;
LABEL_9:

  return v15;
}

@end
