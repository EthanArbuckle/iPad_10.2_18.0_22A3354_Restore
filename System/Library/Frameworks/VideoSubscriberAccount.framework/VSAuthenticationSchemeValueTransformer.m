@implementation VSAuthenticationSchemeValueTransformer

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
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
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
  id v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v22 = v10;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v19, "length"))
                objc_msgSend(v11, "addObject:", v19);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v14);
        }

        if (objc_msgSend(v11, "count"))
          v20 = v11;
        else
          v20 = 0;

        v10 = v22;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
