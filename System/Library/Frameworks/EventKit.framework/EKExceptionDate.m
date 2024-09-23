@implementation EKExceptionDate

- (EKExceptionDate)initWithDate:(id)a3
{
  id v4;
  EKExceptionDate *v5;
  EKExceptionDate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKExceptionDate;
  v5 = -[EKObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[EKExceptionDate setDate:](v5, "setDate:", v4);

  return v6;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_6 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_6, &__block_literal_global_51);
  return (id)knownIdentityKeysForComparison_keys_6;
}

void __49__EKExceptionDate_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B718];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownIdentityKeysForComparison_keys_6;
  knownIdentityKeysForComparison_keys_6 = v0;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKExceptionDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> Date = %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)date
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B718]);
}

- (void)setDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B718]);
}

@end
