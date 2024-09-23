@implementation NSDictionary

- (id)ds_numberFromKey:(id)a3 lowerBound:(id)a4 upperBound:(id)a5 defaultValue:(id)a6 failed:(BOOL *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  if (v15)
  {
    v16 = (void *)v15;
    v17 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0
      && (v18 = objc_msgSend(v16, "compare:", v13), (unint64_t)objc_msgSend(v16, "compare:", v12) <= 1)
      && (unint64_t)v18 + 1 < 2)
    {
      v19 = v16;
    }
    else
    {
      v19 = v14;

      if (a7)
        *a7 = 1;
    }
  }
  else
  {
    v19 = v14;
  }

  return v19;
}

- (id)ds_numberFromKey:(id)a3 defaultValue:(id)a4 failed:(BOOL *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  if (!v9)
  {
    v13 = v8;

    return v13;
  }
  v10 = (void *)v9;
  v11 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
  {
    v12 = v10;
  }
  else
  {
    v12 = v8;

    if (a5)
    {
      *a5 = 1;

      return v12;
    }
  }

  return v12;
}

- (BOOL)ds_BOOLFromKey:(id)a3 defaultValue:(BOOL)a4 failed:(BOOL *)a5
{
  uint64_t v7;
  void *v8;

  v7 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  v8 = (void *)v7;
  if (!v7)
    goto LABEL_4;
  if ((objc_opt_respondsToSelector(v7, "BOOLValue") & 1) != 0)
  {
    a4 = objc_msgSend(v8, "BOOLValue");
LABEL_4:

    return a4;
  }
  if (!a5)
    goto LABEL_4;
  *a5 = 1;

  return a4;
}

@end
