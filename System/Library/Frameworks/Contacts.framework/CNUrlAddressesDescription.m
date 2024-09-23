@implementation CNUrlAddressesDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 50), CFSTR("_urlAddresses"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setUrlAddresses:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "urlAddresses");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF6288];
  return a3 != 0;
}

- (CNUrlAddressesDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("urlAddresses"), sel_urlAddresses, sel_setUrlAddresses_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v5;
  _QWORD *v6;
  void *v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v12 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", &v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 16; i != -8; i -= 8)

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_urlAddresses"), v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v6[50];
  v6[50] = v10;

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "urlAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "urlAddresses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "urlAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlAddresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v8)
    goto LABEL_6;
LABEL_7:

  return v11;
}

- (BOOL)isNonnull
{
  return 1;
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  __CFString *v4;
  const __CFString *v5;

  if (a3)
    v4 = (__CFString *)a3;
  else
    v4 = &stru_1E29FF900;
  if (a4)
    v5 = (const __CFString *)a4;
  else
    v5 = &stru_1E29FF900;
  return -[__CFString localizedCaseInsensitiveCompare:](v4, "localizedCaseInsensitiveCompare:", v5) == 0;
}

- (id)standardLabels
{
  if (standardLabels_cn_once_token_5 != -1)
    dispatch_once(&standardLabels_cn_once_token_5, &__block_literal_global_449);
  return (id)standardLabels_cn_once_object_5;
}

void __43__CNUrlAddressesDescription_standardLabels__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("_$!<HomePage>!$_"), CFSTR("_$!<Home>!$_"), CFSTR("_$!<Work>!$_"), CFSTR("_$!<School>!$_"), CFSTR("_$!<Other>!$_"), 0);
  v1 = (void *)standardLabels_cn_once_object_5;
  standardLabels_cn_once_object_5 = v0;

}

@end
