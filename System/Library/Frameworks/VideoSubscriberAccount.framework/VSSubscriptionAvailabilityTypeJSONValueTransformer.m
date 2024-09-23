@implementation VSSubscriptionAvailabilityTypeJSONValueTransformer

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
  uint64_t v3;
  const __CFString *v4;

  v3 = objc_msgSend(a3, "integerValue");
  v4 = CFSTR("Account");
  if (v3 != 1)
    v4 = 0;
  if (v3 == 2)
    return CFSTR("Subscription");
  else
    return (id)v4;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("Account")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("Subscription")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
