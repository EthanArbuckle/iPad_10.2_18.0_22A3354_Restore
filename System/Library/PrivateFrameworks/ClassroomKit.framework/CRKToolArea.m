@implementation CRKToolArea

+ (id)subareaPath
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)aliases
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)subareaSummary
{
  return &stru_24D9CB490;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "subareaPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" --> "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "subareaSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
