@implementation HFCondition

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ doesn't implement hf_naturalLanguageSummaryWithOptions"), v4);

  return 0;
}

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFCondition)initWithPredicate:(id)a3
{
  id v5;
  HFCondition *v6;
  HFCondition *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFCondition;
  v6 = -[HFCondition init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_predicate, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HFCondition *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HFCondition *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HFCondition predicate](self, "predicate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCondition predicate](v4, "predicate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFCondition predicate](self, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCondition predicate](self, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("predicate"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
