@implementation FPTrashedItemsQueryDescriptor

- (BOOL)supportsQueryingAllMountPoints
{
  return 0;
}

- (id)queryStringForMountPoint:(id)a3
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

  -[FPSpotlightQueryDescriptor settings](self, "settings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "excludedParentOIDs");

  v5 = (void *)MEMORY[0x1E0CB3940];
  FPIsTrashedQueryStringFragment(1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allowedProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FPFileProviderOriginatedItemsQueryStringFragment(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "excludedParentOIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  FPExcludedOIDParentsQueryStringFragment(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ && %@ && (%@)"), v6, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)name
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TRSH");
}

@end
