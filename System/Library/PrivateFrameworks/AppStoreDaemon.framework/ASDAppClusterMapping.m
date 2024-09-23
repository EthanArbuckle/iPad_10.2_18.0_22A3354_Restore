@implementation ASDAppClusterMapping

- (id)copyWithZone:(_NSZone *)a3
{
  ASDAppClusterMapping *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = -[ASDAppClusterMapping init](+[ASDAppClusterMapping allocWithZone:](ASDAppClusterMapping, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  -[ASDAppClusterMapping setBundleID:](v5, "setBundleID:", v6);

  v7 = (void *)-[NSNumber copyWithZone:](self->_clusterID, "copyWithZone:", a3);
  -[ASDAppClusterMapping setClusterID:](v5, "setClusterID:", v7);

  v8 = (void *)-[NSNumber copyWithZone:](self->_clusterVersion, "copyWithZone:", a3);
  -[ASDAppClusterMapping setClusterVersion:](v5, "setClusterVersion:", v8);

  v9 = (void *)-[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  -[ASDAppClusterMapping setItemID:](v5, "setItemID:", v9);

  v10 = (void *)-[NSNumber copyWithZone:](self->_launchesWeight, "copyWithZone:", a3);
  -[ASDAppClusterMapping setLaunchesWeight:](v5, "setLaunchesWeight:", v10);

  v11 = (void *)-[NSNumber copyWithZone:](self->_usageWeight, "copyWithZone:", a3);
  -[ASDAppClusterMapping setUsageWeight:](v5, "setUsageWeight:", v11);

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ bundleID: %@ clusterID: %@ clusterVersion: %@ itemID: %@ launches weight: %@ usage weight: %@ }"), self->_bundleID, self->_clusterID, self->_clusterVersion, self->_itemID, self->_launchesWeight, self->_usageWeight);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[ASDAppClusterMapping bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleID"));

  -[ASDAppClusterMapping clusterID](self, "clusterID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("clusterID"));

  -[ASDAppClusterMapping clusterVersion](self, "clusterVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("clusterVersion"));

  -[ASDAppClusterMapping itemID](self, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("itemID"));

  -[ASDAppClusterMapping launchesWeight](self, "launchesWeight");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("launchesWeight"));

  -[ASDAppClusterMapping usageWeight](self, "usageWeight");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("usageWeight"));

}

- (ASDAppClusterMapping)initWithCoder:(id)a3
{
  id v4;
  ASDAppClusterMapping *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSNumber *clusterID;
  uint64_t v10;
  NSNumber *clusterVersion;
  uint64_t v12;
  NSNumber *itemID;
  uint64_t v14;
  NSNumber *launchesWeight;
  uint64_t v16;
  NSNumber *usageWeight;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASDAppClusterMapping;
  v5 = -[ASDAppClusterMapping init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clusterID"));
    v8 = objc_claimAutoreleasedReturnValue();
    clusterID = v5->_clusterID;
    v5->_clusterID = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clusterVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    clusterVersion = v5->_clusterVersion;
    v5->_clusterVersion = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemID"));
    v12 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchesWeight"));
    v14 = objc_claimAutoreleasedReturnValue();
    launchesWeight = v5->_launchesWeight;
    v5->_launchesWeight = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usageWeight"));
    v16 = objc_claimAutoreleasedReturnValue();
    usageWeight = v5->_usageWeight;
    v5->_usageWeight = (NSNumber *)v16;

  }
  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)clusterID
{
  return self->_clusterID;
}

- (void)setClusterID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)clusterVersion
{
  return self->_clusterVersion;
}

- (void)setClusterVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)launchesWeight
{
  return self->_launchesWeight;
}

- (void)setLaunchesWeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)usageWeight
{
  return self->_usageWeight;
}

- (void)setUsageWeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageWeight, 0);
  objc_storeStrong((id *)&self->_launchesWeight, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_clusterVersion, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
