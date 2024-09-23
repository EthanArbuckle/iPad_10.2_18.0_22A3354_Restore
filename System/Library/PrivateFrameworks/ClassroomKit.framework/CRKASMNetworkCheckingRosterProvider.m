@implementation CRKASMNetworkCheckingRosterProvider

- (CRKASMNetworkCheckingRosterProvider)initWithRosterProvider:(id)a3
{
  CRKASMNetworkCheckingRosterProvider *v3;
  uint64_t v4;
  CATNetworkReachability *networkReachability;
  CATNetworkReachability *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRKASMNetworkCheckingRosterProvider;
  v3 = -[CRKASMRosterProviderDecoratorBase initWithRosterProvider:](&v9, sel_initWithRosterProvider_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE2C748], "reachabilityForInternetConnection");
    v4 = objc_claimAutoreleasedReturnValue();
    networkReachability = v3->_networkReachability;
    v3->_networkReachability = (CATNetworkReachability *)v4;

    v6 = v3->_networkReachability;
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATNetworkReachability scheduleInRunLoop:forMode:](v6, "scheduleInRunLoop:forMode:", v7, *MEMORY[0x24BDBCA90]);

  }
  return v3;
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *))a4;
  -[CRKASMNetworkCheckingRosterProvider networkReachability](self, "networkReachability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isReachable");

  if ((v8 & 1) != 0)
  {
    -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createCourseWithProperties:completion:", v10, v6);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "reachabilityError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v9);
  }

}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  -[CRKASMNetworkCheckingRosterProvider networkReachability](self, "networkReachability");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isReachable");

  if ((v11 & 1) != 0)
  {
    -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateCourseWithIdentifier:properties:completion:", v13, v8, v9);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "reachabilityError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v12);
  }

}

- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, void *))a4;
  -[CRKASMNetworkCheckingRosterProvider networkReachability](self, "networkReachability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isReachable");

  if ((v8 & 1) != 0)
  {
    -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeCourseWithIdentifier:completion:", v10, v6);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "reachabilityError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v9);
  }

}

+ (id)reachabilityError
{
  return CRKErrorWithCodeAndUserInfo(156, 0);
}

- (CATNetworkReachability)networkReachability
{
  return self->_networkReachability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkReachability, 0);
}

@end
