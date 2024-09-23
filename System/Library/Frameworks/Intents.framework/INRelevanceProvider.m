@implementation INRelevanceProvider

- (INRelevanceProvider)init
{
  int v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  v3 = -[INRelevanceProvider isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("INRelevanceProvider cannot be initialized directly with -init, initialize a subclass instead."));
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ cannot be initialized directly with -init, use the designated initializer instead."), v7);

  }
  return (INRelevanceProvider *)-[INRelevanceProvider _init](self, "_init");
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INRelevanceProvider;
  return -[INRelevanceProvider init](&v3, sel_init);
}

- (INRelevanceProvider)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INRelevanceProvider;
  return -[INRelevanceProvider init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
