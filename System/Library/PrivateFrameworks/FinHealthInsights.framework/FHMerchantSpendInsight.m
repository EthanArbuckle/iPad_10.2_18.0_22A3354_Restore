@implementation FHMerchantSpendInsight

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FHMerchantSpendInsight;
  v4 = a3;
  -[FHFeatureInsight encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[FHMerchantSpendInsight merchantName](self, "merchantName", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("merchantName"));

}

- (FHMerchantSpendInsight)initWithCoder:(id)a3
{
  id v4;
  FHMerchantSpendInsight *v5;
  uint64_t v6;
  NSString *merchantName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FHMerchantSpendInsight;
  v5 = -[FHFeatureInsight initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantName"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchantName = v5->merchantName;
    v5->merchantName = (NSString *)v6;

  }
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
  v6.super_class = (Class)FHMerchantSpendInsight;
  -[FHFeatureInsight description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("merchantName"), self->merchantName);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)merchantName
{
  return self->merchantName;
}

- (void)setMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->merchantName, 0);
}

@end
