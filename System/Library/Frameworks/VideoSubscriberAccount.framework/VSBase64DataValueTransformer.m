@implementation VSBase64DataValueTransformer

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
  return (id)objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = (void *)MEMORY[0x1E0C99DA0];
        v7 = *MEMORY[0x1E0C99778];
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "raise:format:", v7, CFSTR("Unexpectedly, value was %@, instead of NSString."), v9);

      }
      v10 = (objc_class *)MEMORY[0x1E0C99D50];
      v11 = v5;
      v12 = (void *)objc_msgSend([v10 alloc], "initWithBase64EncodedString:options:", v11, 0);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
