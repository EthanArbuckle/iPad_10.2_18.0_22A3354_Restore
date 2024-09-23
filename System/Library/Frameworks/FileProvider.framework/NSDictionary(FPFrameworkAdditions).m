@implementation NSDictionary(FPFrameworkAdditions)

- (id)fp_filter:()FPFrameworkAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__NSDictionary_FPFrameworkAdditions__fp_filter___block_invoke;
  v11[3] = &unk_1E444FDE8;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)fp_removingObjectsNotKindOfClasses:()FPFrameworkAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__NSDictionary_FPFrameworkAdditions__fp_removingObjectsNotKindOfClasses___block_invoke;
  v11[3] = &unk_1E444DC58;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)fp_valueForKeyPath:()FPFrameworkAdditions
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  char *v15;
  char *v16;
  void *v17;
  unint64_t v18;
  id v19;
  int v20;
  char *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;

  v4 = a3;
  objc_msgSend(a1, "allKeys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "length"))
  {
    v15 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    if (!objc_msgSend(v8, "count"))
    {
LABEL_8:
      v12 = v7;
      v13 = objc_msgSend(v8, "count");
      v14 = v12;
      if ((objc_msgSend(v5, "containsObject:", v12) & 1) != 0)
      {
LABEL_12:
        v15 = objc_retainAutorelease(v14);
        v18 = objc_msgSend(v15, "length");
        if (v18 >= objc_msgSend(v12, "length"))
        {
          v19 = 0;
        }
        else
        {
          objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v15, "length") + 1);
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        v20 = 1;
        v16 = v15;
      }
      else
      {
        v15 = (char *)(v13 - 1);
        v16 = (char *)v12;
        while (v15)
        {
          objc_msgSend(v8, "objectAtIndex:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "substringWithRange:", 0, objc_msgSend(v16, "length") + ~objc_msgSend(v17, "length"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          --v15;
          v16 = (char *)v14;
          if (objc_msgSend(v5, "containsObject:", v14))
            goto LABEL_12;
        }
        v19 = 0;
        v20 = 0;
      }

      goto LABEL_20;
    }
    v9 = 0;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (!v11)
        break;
      if (++v9 >= (unint64_t)objc_msgSend(v8, "count"))
        goto LABEL_8;
    }
  }
  v15 = 0;
  v19 = 0;
  v20 = 0;
LABEL_20:

LABEL_21:
  v21 = v15;
  v22 = v19;

  if (v20)
  {
    objc_msgSend(a1, "objectForKey:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      if (!v22)
      {
        v25 = v23;
        goto LABEL_29;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v24, "fp_valueForKeyPath:", v22);
        v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
        v26 = v25;
        goto LABEL_30;
      }
    }
    v26 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v26 = 0;
LABEL_31:

  return v26;
}

@end
