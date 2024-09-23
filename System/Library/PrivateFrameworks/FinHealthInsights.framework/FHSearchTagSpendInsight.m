@implementation FHSearchTagSpendInsight

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FHSearchTagSpendInsight;
  v4 = a3;
  -[FHFeatureInsight encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[FHSearchTagSpendInsight searchTagName](self, "searchTagName", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("searchTag"));

}

- (FHSearchTagSpendInsight)initWithCoder:(id)a3
{
  id v4;
  FHSearchTagSpendInsight *v5;
  uint64_t v6;
  NSString *searchTagName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FHSearchTagSpendInsight;
  v5 = -[FHFeatureInsight initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchTag"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchTagName = v5->searchTagName;
    v5->searchTagName = (NSString *)v6;

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
  v6.super_class = (Class)FHSearchTagSpendInsight;
  -[FHFeatureInsight description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("searchTag"), self->searchTagName);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)searchTagName
{
  return self->searchTagName;
}

- (void)setSearchTagName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->searchTagName, 0);
}

@end
