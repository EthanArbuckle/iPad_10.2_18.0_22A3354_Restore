@implementation LNRelevantContext

- (LNRelevantContext)init
{
  int v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  v3 = -[LNRelevantContext isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("LNRelevantContext cannot be initialized directly with -init, initialize a subclass instead."));
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ cannot be initialized directly with -init, use the designated initializer instead."), v7);

  }
  return (LNRelevantContext *)-[LNRelevantContext _init](self, "_init");
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LNRelevantContext;
  return -[LNRelevantContext init](&v3, sel_init);
}

- (LNRelevantContext)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LNRelevantContext;
  return -[LNRelevantContext init](&v4, sel_init, a3);
}

- (NSString)analyticsDescription
{
  return (NSString *)CFSTR("<anonymous context>");
}

- (id)asCondition
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Invoking %@ on abstract base class %@"), v4, v6);

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)conditions
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[LNRelevantContext asCondition](self, "asCondition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

@end
