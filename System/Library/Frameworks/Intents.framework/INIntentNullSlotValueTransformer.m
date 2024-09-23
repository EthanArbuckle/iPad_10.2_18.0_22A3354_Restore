@implementation INIntentNullSlotValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (Class)reverseTransformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3;
  char isKindOfClass;
  _INPBEmpty *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "transformedValueClass");
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = objc_alloc_init(_INPBEmpty);
  else
    v5 = 0;
  return v5;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  char isKindOfClass;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "reverseTransformedValueClass");
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
