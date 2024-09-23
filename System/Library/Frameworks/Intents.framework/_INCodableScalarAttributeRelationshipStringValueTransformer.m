@implementation _INCodableScalarAttributeRelationshipStringValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  v6 = v5;
  if (!v5)
    v5 = &stru_1E2295770;
  v7 = v5;

  return v7;
}

@end
