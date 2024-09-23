@implementation ARUICountdownDefaultAnimation

+ (id)identifier
{
  return CFSTR("ARUICountdownDefaultTimeline");
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<ARUICountdownDefaultAnimation: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
