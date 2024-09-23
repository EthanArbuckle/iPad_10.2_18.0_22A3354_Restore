@implementation MSDKPeerDemoGKMetrics

- (MSDKPeerDemoGKMetrics)initWithGKDataList:(id)a3
{
  id v4;
  MSDKPeerDemoGKMetrics *v5;
  MSDKPeerDemoGKMetrics *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSDKPeerDemoGKMetrics;
  v5 = -[MSDKPeerDemoGKMetrics init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MSDKPeerDemoGKMetrics setGKDataList:](v5, "setGKDataList:", v4);

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoGKMetrics GKDataList](self, "GKDataList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@[%p]: GKDataList=%@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoGKMetrics)initWithCoder:(id)a3
{
  id v4;
  MSDKPeerDemoGKMetrics *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoGKMetrics;
  v5 = -[MSDKPeerDemoGKMetrics init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("GKDataList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoGKMetrics setGKDataList:](v5, "setGKDataList:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MSDKPeerDemoGKMetrics GKDataList](self, "GKDataList");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("GKDataList"));

}

- (NSArray)GKDataList
{
  return self->_GKDataList;
}

- (void)setGKDataList:(id)a3
{
  objc_storeStrong((id *)&self->_GKDataList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_GKDataList, 0);
}

@end
