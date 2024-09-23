@implementation FHCategorySpendInsight

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FHCategorySpendInsight;
  v4 = a3;
  -[FHFeatureInsight encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[FHCategorySpendInsight merchantCategory](self, "merchantCategory", v5.receiver, v5.super_class), CFSTR("merchantCategory"));

}

- (FHCategorySpendInsight)initWithCoder:(id)a3
{
  id v4;
  FHCategorySpendInsight *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FHCategorySpendInsight;
  v5 = -[FHFeatureInsight initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->merchantCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantCategory"));

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)FHCategorySpendInsight;
  -[FHFeatureInsight description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("merchantCategory"), self->merchantCategory);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)merchantCategory
{
  return self->merchantCategory;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->merchantCategory = a3;
}

@end
