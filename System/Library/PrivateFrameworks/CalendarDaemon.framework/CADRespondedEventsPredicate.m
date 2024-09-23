@implementation CADRespondedEventsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicate
{
  objc_opt_class();
  return (id)objc_opt_new();
}

- (id)defaultPropertiesToLoad
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  CADEKPersistentEventDefaultPropertiesToLoad();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D0B820];
  v8[0] = *MEMORY[0x1E0D0B408];
  v8[1] = v3;
  v4 = *MEMORY[0x1E0D0B6C8];
  v8[2] = *MEMORY[0x1E0D0B6A8];
  v8[3] = v4;
  v8[4] = *MEMORY[0x1E0D0B6A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)predicateFormat
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
