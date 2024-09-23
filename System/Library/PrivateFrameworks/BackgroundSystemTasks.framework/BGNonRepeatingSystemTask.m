@implementation BGNonRepeatingSystemTask

- (BGNonRepeatingSystemTask)initWithIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BGNonRepeatingSystemTask;
  return -[BGSystemTask initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[BGSystemTask identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<BGNonRepeatingSystemTask: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
