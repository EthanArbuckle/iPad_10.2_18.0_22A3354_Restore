@implementation FHOverallSpendInsight

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FHOverallSpendInsight;
  -[FHFeatureInsight encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (FHOverallSpendInsight)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FHOverallSpendInsight;
  return -[FHFeatureInsight initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)FHOverallSpendInsight;
  -[FHFeatureInsight description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
