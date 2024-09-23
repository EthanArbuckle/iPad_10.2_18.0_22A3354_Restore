@implementation INIntentHomeAttributeValueSlotValueTransformer

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
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "transformedValueClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    INIntentSlotValueTransformToHomeAttributeValue(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "reverseTransformedValueClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    INIntentSlotValueTransformFromHomeAttributeValue(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
