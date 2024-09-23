@implementation NSValueTransformer(CodableUtilities)

+ (uint64_t)_intents_valueType
{
  return 0;
}

+ (Class)_intents_resolutionResultClass
{
  void *v1;
  void *v2;
  void *v3;
  NSString *v4;
  Class v5;
  void *v6;
  void *v7;
  int v8;

  v1 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass((Class)objc_msgSend(a1, "transformedValueClass"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringFromIndex:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("IN%@ResolutionResult"), v3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = NSClassFromString(v4);
  if (v5)
  {
    if (-[objc_class isSubclassOfClass:](v5, "isSubclassOfClass:", objc_opt_class())
      && (objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v5),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v6, "isEqual:", v7),
          v7,
          v6,
          v8))
    {
      v5 = v5;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end
