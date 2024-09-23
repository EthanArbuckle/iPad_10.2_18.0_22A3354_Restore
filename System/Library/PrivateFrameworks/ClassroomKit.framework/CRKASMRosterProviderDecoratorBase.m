@implementation CRKASMRosterProviderDecoratorBase

- (CRKASMRosterProviderDecoratorBase)initWithRosterProvider:(id)a3
{
  id v5;
  CRKASMRosterProviderDecoratorBase *v6;
  CRKASMRosterProviderDecoratorBase *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMRosterProviderDecoratorBase;
  v6 = -[CRKASMRosterProviderDecoratorBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingRosterProvider, a3);

  return v7;
}

- (CRKASMRoster)roster
{
  void *v2;
  void *v3;

  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "roster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRKASMRoster *)v3;
}

+ (id)keyPathsForValuesAffectingRoster
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("underlyingRosterProvider.roster"));
}

- (BOOL)isPopulated
{
  void *v2;
  char v3;

  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPopulated");

  return v3;
}

+ (id)keyPathsForValuesAffectingPopulated
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("underlyingRosterProvider.populated"));
}

- (CRKASMUserFetching)userFetcher
{
  void *v2;
  void *v3;

  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userFetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRKASMUserFetching *)v3;
}

- (id)studentDirectoryForLocationIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "studentDirectoryForLocationIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)instructorDirectoryForLocationIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instructorDirectoryForLocationIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)locationsWithManagePermissions
{
  void *v2;
  void *v3;

  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationsWithManagePermissions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)keyPathsForValuesAffectingLocationsWithManagePermissions
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("underlyingRosterProvider.locationsWithManagePermissions"));
}

- (void)refresh
{
  id v2;

  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refresh");

}

- (BOOL)ingestCertificates:(id)a3 forTrustedUserIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "ingestCertificates:forTrustedUserIdentifier:error:", v9, v8, a5);

  return (char)a5;
}

- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeCourseWithIdentifier:completion:", v7, v6);

}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createCourseWithProperties:completion:", v7, v6);

}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateCourseWithIdentifier:properties:completion:", v10, v9, v8);

}

- (CRKASMRosterProviding)underlyingRosterProvider
{
  return self->_underlyingRosterProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRosterProvider, 0);
}

@end
