@implementation FPFavoriteFoldersQueryDescriptor

- (id)queryStringForMountPoint:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[FPSpotlightQueryDescriptor settings](self, "settings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "excludedParentOIDs");

  v5 = (void *)MEMORY[0x1E0CB3940];
  FPIsTrashedQueryStringFragment(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "excludedParentOIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FPExcludedOIDParentsQueryStringFragment(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("(kMDItemFavoriteRank == \"*\" && kMDItemContentTypeTree == \"public.folder\") && (%@) && (%@)"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)name
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "FAVD");
}

@end
