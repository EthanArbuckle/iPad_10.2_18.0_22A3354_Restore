@implementation FPAppLibraryCollection

- (BOOL)isRootItem:(id)a3
{
  return 0;
}

- (BOOL)isCollectionValidForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isValidAppLibrary"))
  {
    objc_msgSend(v4, "providerDomainID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPExtensionCollection enumeratedItemID](self, "enumeratedItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "providerDomainID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FPExtensionCollection settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p settings: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
