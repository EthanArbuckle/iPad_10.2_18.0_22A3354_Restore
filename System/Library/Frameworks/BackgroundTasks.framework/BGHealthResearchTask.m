@implementation BGHealthResearchTask

- (id)_initWithIdentifier:(id)a3 activity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BGHealthResearchTask;
  return -[BGProcessingTask _initWithIdentifier:activity:](&v5, sel__initWithIdentifier_activity_, a3, a4);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[BGTask identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<BGHealthResearchTask: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
