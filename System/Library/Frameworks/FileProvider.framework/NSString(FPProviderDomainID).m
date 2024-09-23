@implementation NSString(FPProviderDomainID)

+ (id)fp_providerDomainIDFromProviderID:()FPProviderDomainID domainIdentifier:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPProviderDomain.m"), 63, CFSTR("domain identifier shouldn't be nil"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPProviderDomain.m"), 64, CFSTR("provider identifier shouldn't be nil"));

LABEL_3:
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("NSFileProviderDomainDefaultIdentifier")))
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (__CFString)fp_toDomainIdentifier
{
  uint64_t v2;
  uint64_t v3;
  __CFString *v4;

  v2 = objc_msgSend(a1, "rangeOfString:", CFSTR("/"));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  }
  else
  {
    objc_msgSend(a1, "substringFromIndex:", v2 + v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)fp_toProviderID
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(a1, "rangeOfString:", CFSTR("/"));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = a1;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (uint64_t)fp_isCiconiaDomain
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fp_toProviderID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged")))
  {
    objc_msgSend(a1, "fp_toDomainIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("Ciconia-"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
