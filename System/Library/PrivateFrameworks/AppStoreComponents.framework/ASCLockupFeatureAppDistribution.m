@implementation ASCLockupFeatureAppDistribution

- (ASCLockupFeatureAppDistribution)initWithDistributorBundleId:(id)a3 appVersionId:(id)a4
{
  id v6;
  id v7;
  ASCLockupFeatureAppDistribution *v8;
  uint64_t v9;
  NSString *distributorBundleId;
  uint64_t v11;
  NSString *appVersionId;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCLockupFeatureAppDistribution;
  v8 = -[ASCLockupFeatureAppDistribution init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    distributorBundleId = v8->_distributorBundleId;
    v8->_distributorBundleId = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    appVersionId = v8->_appVersionId;
    v8->_appVersionId = (NSString *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureAppDistribution)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ASCLockupFeatureAppDistribution *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distributorBundleId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appVersionId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ASCLockupFeatureAppDistribution initWithDistributorBundleId:appVersionId:](self, "initWithDistributorBundleId:appVersionId:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ASCLockupFeatureAppDistribution distributorBundleId](self, "distributorBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("distributorBundleId"));

  -[ASCLockupFeatureAppDistribution appVersionId](self, "appVersionId");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("appVersionId"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCLockupFeatureAppDistribution distributorBundleId](self, "distributorBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCLockupFeatureAppDistribution appVersionId](self, "appVersionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockupFeatureAppDistribution *v4;
  ASCLockupFeatureAppDistribution *v5;
  ASCLockupFeatureAppDistribution *v6;
  char v7;
  ASCLockupFeatureAppDistribution *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = (ASCLockupFeatureAppDistribution *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (!v8)
    {
      v7 = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[ASCLockupFeatureAppDistribution distributorBundleId](self, "distributorBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupFeatureAppDistribution distributorBundleId](v8, "distributorBundleId");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if (objc_msgSend(v9, "isEqual:", v10))
        goto LABEL_12;
    }
    else if (v9 == (void *)v10)
    {
LABEL_12:
      -[ASCLockupFeatureAppDistribution appVersionId](self, "appVersionId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCLockupFeatureAppDistribution appVersionId](v8, "appVersionId");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v12 && v13)
        v7 = objc_msgSend(v12, "isEqual:", v13);
      else
        v7 = v12 == (void *)v13;

      goto LABEL_20;
    }
    v7 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v7 = 1;
LABEL_22:

  return v7;
}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupFeatureAppDistribution distributorBundleId](self, "distributorBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("distributorBundleId"));

  -[ASCLockupFeatureAppDistribution appVersionId](self, "appVersionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("appVersionId"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)distributorBundleId
{
  return self->_distributorBundleId;
}

- (NSString)appVersionId
{
  return self->_appVersionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersionId, 0);
  objc_storeStrong((id *)&self->_distributorBundleId, 0);
}

@end
