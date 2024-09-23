@implementation VSSubscriptionSourceKindPropertyListValueTransformer

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
  v4 = CFSTR("PSSSIdentifierTypeURL");
  if (v3 != 1)
    v4 = 0;
  if (v3)
    return (id)v4;
  else
    return CFSTR("PSSSIdentifierTypeBundle");
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("PSSSIdentifierTypeBundle")) & 1) != 0)
  {
    v4 = &unk_1E93CC6F0;
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("PSSSIdentifierTypeURL")))
  {
    v4 = &unk_1E93CC708;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
