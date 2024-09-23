@implementation ASCLockupFeatureProductVariants

- (ASCLockupFeatureProductVariants)initWithProductVariantID:(id)a3
{
  id v4;
  ASCLockupFeatureProductVariants *v5;
  uint64_t v6;
  NSString *productVariantID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCLockupFeatureProductVariants;
  v5 = -[ASCLockupFeatureProductVariants init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    productVariantID = v5->_productVariantID;
    v5->_productVariantID = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureProductVariants)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASCLockupFeatureProductVariants *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productVariantID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ASCLockupFeatureProductVariants initWithProductVariantID:](self, "initWithProductVariantID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCLockupFeatureProductVariants productVariantID](self, "productVariantID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("productVariantID"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCLockupFeatureProductVariants productVariantID](self, "productVariantID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  v5 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockupFeatureProductVariants *v4;
  ASCLockupFeatureProductVariants *v5;
  ASCLockupFeatureProductVariants *v6;
  char v7;
  ASCLockupFeatureProductVariants *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (ASCLockupFeatureProductVariants *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
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

    if (v8)
    {
      -[ASCLockupFeatureProductVariants productVariantID](self, "productVariantID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCLockupFeatureProductVariants productVariantID](v8, "productVariantID");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9 && v10)
        v7 = objc_msgSend(v9, "isEqual:", v10);
      else
        v7 = v9 == (void *)v10;

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupFeatureProductVariants productVariantID](self, "productVariantID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("productVariantID"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)productVariantID
{
  return self->_productVariantID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productVariantID, 0);
}

@end
