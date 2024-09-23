@implementation CRKCurrentPlatformIPAddressProvider

- (CRKCurrentPlatformIPAddressProvider)init
{
  void *v3;
  CRKCurrentPlatformIPAddressProvider *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[CRKCurrentPlatformIPAddressProvider initWithNetworkPrimitives:](self, "initWithNetworkPrimitives:", v3);

  return v4;
}

- (CRKCurrentPlatformIPAddressProvider)initWithNetworkPrimitives:(id)a3
{
  id v4;
  CRKCurrentPlatformIPAddressProvider *v5;
  uint64_t v6;
  CRKNetworkPathMonitor *pathMonitor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKCurrentPlatformIPAddressProvider;
  v5 = -[CRKCurrentPlatformIPAddressProvider init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "makePathMonitorWithPrimitives:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    pathMonitor = v5->_pathMonitor;
    v5->_pathMonitor = (CRKNetworkPathMonitor *)v6;

    -[CRKNetworkPathMonitor resume](v5->_pathMonitor, "resume");
  }

  return v5;
}

- (NSString)IPAddress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CRKCurrentPlatformIPAddressProvider pathMonitor](self, "pathMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isSatisfied"))
  {
    objc_msgSend(v3, "interfaces");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_30);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "crk_firstMatching:", &__block_literal_global_3_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "ipv4Endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "IPAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return (NSString *)v8;
}

uint64_t __48__CRKCurrentPlatformIPAddressProvider_IPAddress__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

BOOL __48__CRKCurrentPlatformIPAddressProvider_IPAddress__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "ipv4Endpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "IPAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)makePathMonitorWithPrimitives:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("CRKPreferEthernet"));

  if ((v6 & 1) != 0)
    objc_msgSend(v4, "ethernetNetworkPathMonitor");
  else
    objc_msgSend(v4, "wifiNetworkPathMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)keyPathsForValuesAffectingIPAddress
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("pathMonitor.path"));
}

- (CRKNetworkPathMonitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

@end
