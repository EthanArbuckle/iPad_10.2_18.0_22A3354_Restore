@implementation CNPreviousFamilyNameDescription

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF61E0];
  return a3 != 0;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 9), CFSTR("_previousFamilyName"));
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "previousFamilyName");
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setPreviousFamilyName:", a3);
}

- (CNPreviousFamilyNameDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("previousFamilyName"), sel_previousFamilyName, sel_setPreviousFamilyName_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  _QWORD *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_previousFamilyName"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v9, "copy");
  v8 = (void *)v5[9];
  v5[9] = v7;

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
  objc_msgSend(v6, "previousFamilyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "previousFamilyName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "previousFamilyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousFamilyName");
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

@end
