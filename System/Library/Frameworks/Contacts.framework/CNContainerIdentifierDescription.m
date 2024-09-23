@implementation CNContainerIdentifierDescription

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF6300];
}

- (id)CNValueFromABValue:(void *)a3
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  return v5;
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  objc_msgSend(a4, "setIdentifier:", a3);
}

- (id)key
{
  return CFSTR("identifier");
}

- (BOOL)isNonnull
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContainer:(id)a3
{
  return (id)objc_msgSend(a3, "identifier");
}

- (void)ABValueFromCNValue:(id)a3
{
  return a3;
}

@end
