@implementation CSManagedUserQuery

+ (void)prepareProtectionClasses:(id)a3 path:(id)a4
{
  +[CSManagedSearchQuery preheat:path:](CSManagedSearchQuery, "preheat:path:", a3, a4);
  objc_msgSend(a1, "prepareLocalResources");
}

+ (void)preheat:(id)a3 path:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a4;
    +[CSManagedSearchQuery preheat:path:](CSManagedSearchQuery, "preheat:path:", a3, v6);
  }
  else
  {
    v9 = *MEMORY[0x1E0CB2AE0];
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a4;
    objc_msgSend(v7, "arrayWithObjects:count:", &v9, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CSManagedSearchQuery preheat:path:](CSManagedSearchQuery, "preheat:path:", v6, v8, v9, v10);

  }
  objc_msgSend(a1, "prepareLocalResources");
}

- (id)initialConnection
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[CSUnhousedUserQuery resolvedIndexPath](self, "resolvedIndexPath");
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
