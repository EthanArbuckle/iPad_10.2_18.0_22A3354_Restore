@implementation ENKeyedArchiverFromDataTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)reverseTransformedValue:(id)a3
{
  return 0;
}

@end
