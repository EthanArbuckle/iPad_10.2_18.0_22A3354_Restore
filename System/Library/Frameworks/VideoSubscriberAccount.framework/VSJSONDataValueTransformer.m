@implementation VSJSONDataValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v16;

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
        objc_msgSend(v6, "raise:format:", v7, CFSTR("Unexpectedly, value was %@, instead of NSData."), v9);

      }
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      v12 = v11;
      if (v10)
      {
        +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v10);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v11)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The errorOrNil parameter must not be nil."));
        +[VSFailable failableWithError:](VSFailable, "failableWithError:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v14 = (void *)v13;

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
