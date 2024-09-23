@implementation IKDataBindingPropertyPath

+ (id)pathStringForAccessorSequence:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = a3;
  objc_msgSend(v3, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__IKDataBindingPropertyPath_pathStringForAccessorSequence___block_invoke;
  v9[3] = &unk_1E9F4F410;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __59__IKDataBindingPropertyPath_pathStringForAccessorSequence___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3)
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("."));
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v8, "property");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%ld]"), objc_msgSend(v8, "subscriptIndex"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "appendString:", v6);

}

- (IKDataBindingPropertyPath)initWithString:(id)a3
{
  id v4;
  IKDataBindingPropertyPath *v5;
  uint64_t v6;
  NSString *string;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  id v12;
  IKDataProperty *v13;
  IKDataSubscript *v14;
  IKDataSubscript *v15;
  uint64_t v16;
  void *v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IKDataBindingPropertyPath;
  v5 = -[IKDataBindingPropertyPath init](&v28, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    string = v5->_string;
    v5->_string = (NSString *)v6;

    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v8;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v21)
    {
      v20 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(obj);
          objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0;
          objc_msgSend(v11, "scanUpToString:intoString:", CFSTR("["), &v23);
          v12 = v23;
          if (objc_msgSend(v12, "length"))
          {
            v13 = -[IKDataProperty initWithProperty:]([IKDataProperty alloc], "initWithProperty:", v12);
            objc_msgSend(v9, "addObject:", v13);

          }
          if ((objc_msgSend(v11, "isAtEnd") & 1) == 0)
          {
            do
            {
              objc_msgSend(v11, "scanString:intoString:", CFSTR("["), 0);
              v22 = 0xFFFFFFFF80000000;
              if (objc_msgSend(v11, "scanInteger:", &v22))
                objc_msgSend(v11, "scanUpToString:intoString:", CFSTR("]"), 0);
              if (v22 > 0x7FFFFFFE)
                break;
              if ((objc_msgSend(v11, "scanString:intoString:", CFSTR("]"), 0) & 1) == 0)
                break;
              v14 = [IKDataSubscript alloc];
              v15 = -[IKDataSubscript initWithSubscriptIndex:](v14, "initWithSubscriptIndex:", v22);
              objc_msgSend(v9, "addObject:", v15);

            }
            while (!objc_msgSend(v11, "isAtEnd"));
          }

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v21);
    }

    v16 = objc_msgSend(v9, "count");
    if (v16)
      v17 = (void *)objc_msgSend(v9, "copy");
    else
      v17 = 0;
    objc_storeStrong((id *)&v5->_accessorSequence, v17);
    if (v16)

  }
  return v5;
}

- (IKDataBindingPropertyPath)initWithAccessorSequence:(id)a3
{
  id v4;
  IKDataBindingPropertyPath *v5;
  uint64_t v6;
  NSArray *accessorSequence;
  uint64_t v8;
  NSString *string;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKDataBindingPropertyPath;
  v5 = -[IKDataBindingPropertyPath init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    accessorSequence = v5->_accessorSequence;
    v5->_accessorSequence = (NSArray *)v6;

    objc_msgSend((id)objc_opt_class(), "pathStringForAccessorSequence:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    string = v5->_string;
    v5->_string = (NSString *)v8;

  }
  return v5;
}

- (id)propertyPathByCombiningAccessorSequence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[IKDataBindingPropertyPath accessorSequence](self, "accessorSequence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addObjectsFromArray:", v4);
  v7 = objc_alloc((Class)objc_opt_class());
  v8 = (void *)objc_msgSend(v6, "copy");
  v9 = (void *)objc_msgSend(v7, "_initWithAccessorSequence:", v8);

  return v9;
}

- (id)propertyPathByRemovingFirstAccessor
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[IKDataBindingPropertyPath accessorSequence](self, "accessorSequence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObjectAtIndex:", 0);
  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v3, "copy");
  v6 = (void *)objc_msgSend(v4, "_initWithAccessorSequence:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IKDataBindingPropertyPath string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDataBindingPropertyPath string](self, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_initWithAccessorSequence:(id)a3
{
  id v4;
  IKDataBindingPropertyPath *v5;
  uint64_t v6;
  NSString *string;
  uint64_t v8;
  NSArray *accessorSequence;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKDataBindingPropertyPath;
  v5 = -[IKDataBindingPropertyPath init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "pathStringForAccessorSequence:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    string = v5->_string;
    v5->_string = (NSString *)v6;

    v8 = objc_msgSend(v4, "copy");
    accessorSequence = v5->_accessorSequence;
    v5->_accessorSequence = (NSArray *)v8;

  }
  return v5;
}

- (NSString)string
{
  return self->_string;
}

- (NSArray)accessorSequence
{
  return self->_accessorSequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorSequence, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
