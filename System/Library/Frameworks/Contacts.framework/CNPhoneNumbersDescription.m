@implementation CNPhoneNumbersDescription

- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (a3)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, a4, 4);
    if (v5)
    {
      v6 = (void *)v5;
      +[CNPhoneNumber phoneNumberWithCopiedStringValue:](CNPhoneNumber, "phoneNumberWithCopiedStringValue:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setPhoneNumbers:", a3);
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF61A0];
  return a3 != 0;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 48), CFSTR("_phoneNumbers"));
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "phoneNumbers");
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  return objc_msgSend(a3, "isLikePhoneNumberForSamePerson:", a4);
}

- (id)equivalentLabelSets
{
  if (equivalentLabelSets_cn_once_token_2 != -1)
    dispatch_once(&equivalentLabelSets_cn_once_token_2, &__block_literal_global_429);
  return (id)equivalentLabelSets_cn_once_object_2;
}

- (CNPhoneNumbersDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("phoneNumbers"), sel_phoneNumbers, sel_setPhoneNumbers_);
}

void __48__CNPhoneNumbersDescription_equivalentLabelSets__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("iPhone"), CFSTR("Apple Watch"), CFSTR("_$!<Mobile>!$_"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_$!<Main>!$_"), CFSTR("_$!<Home>!$_"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithObjects:", v4, v1, 0);
  v3 = (void *)equivalentLabelSets_cn_once_object_2;
  equivalentLabelSets_cn_once_object_2 = v2;

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

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_phoneNumbers"), v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v6[48];
  v6[48] = v10;

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
  objc_msgSend(v6, "phoneNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "phoneNumbers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phoneNumbers");
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

- (id)standardLabels
{
  if (standardLabels_cn_once_token_3 != -1)
    dispatch_once(&standardLabels_cn_once_token_3, &__block_literal_global_430);
  return (id)standardLabels_cn_once_object_3;
}

void __43__CNPhoneNumbersDescription_standardLabels__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("_$!<Mobile>!$_"), CFSTR("_$!<Home>!$_"), CFSTR("_$!<Work>!$_"), CFSTR("_$!<School>!$_"), CFSTR("iPhone"), CFSTR("Apple Watch"), CFSTR("_$!<Main>!$_"), CFSTR("_$!<HomeFAX>!$_"), CFSTR("_$!<WorkFAX>!$_"), CFSTR("_$!<Pager>!$_"), CFSTR("_$!<Other>!$_"), 0);
  v1 = (void *)standardLabels_cn_once_object_3;
  standardLabels_cn_once_object_3 = v0;

}

- (id)stringForIndexingForContact:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "phoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v3;
    objc_msgSend(v3, "phoneNumbers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "digits");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "countryCode");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)_PNCopyIndexStringsForAddressBookSearch();

          if (v15)
          {
            objc_msgSend(v15, "componentsJoinedByString:", CFSTR(" "));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendString:", v16);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    v3 = v18;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)plistTransform
{
  return +[CN phoneNumberToStringTransform](CN, "phoneNumberToStringTransform");
}

- (id)fromPlistTransform
{
  return +[CN phoneNumberFromStringTransform](CN, "phoneNumberFromStringTransform");
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  CFTypeID v4;
  void *v5;

  if (a3)
  {
    v4 = CFGetTypeID(a3);
    if (v4 == CFStringGetTypeID())
    {
      +[CNPhoneNumber phoneNumberWithCopiedStringValue:](CNPhoneNumber, "phoneNumberWithCopiedStringValue:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
