@implementation CSManagedSearchQuery

+ (void)preheat:(id)a3 path:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  +[CSUnhousedSearchConnection connectionWithToken:](CSManagedSearchConnection, "connectionWithToken:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preheat:", v5);

}

- (id)initialConnection
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[CSUnhousedSearchQuery resolvedIndexPath](self, "resolvedIndexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[CSUnhousedSearchConnection connectionWithToken:](CSManagedSearchConnection, "connectionWithToken:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
