@implementation CNInstantMessageAddressesDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 52), CFSTR("_instantMessageAddresses"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setInstantMessageAddresses:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "instantMessageAddresses");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF6020];
  return a3 != 0;
}

- (CNInstantMessageAddressesDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("instantMessageAddresses"), sel_instantMessageAddresses, sel_setInstantMessageAddresses_);
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

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_instantMessageAddresses"), v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v6[52];
  v6[52] = v10;

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
  objc_msgSend(v6, "instantMessageAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "instantMessageAddresses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "instantMessageAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "instantMessageAddresses");
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
  id v5;
  id v6;
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "username");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "username");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v11 = v9;
  else
    v11 = &stru_1E29FF900;
  if (v10)
    v12 = v10;
  else
    v12 = &stru_1E29FF900;
  v13 = -[__CFString localizedCaseInsensitiveCompare:](v11, "localizedCaseInsensitiveCompare:", v12);

  objc_msgSend(v7, "service");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "service");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v16 = v14;
  else
    v16 = &stru_1E29FF900;
  if (v15)
    v17 = v15;
  else
    v17 = &stru_1E29FF900;
  v18 = -[__CFString localizedCaseInsensitiveCompare:](v16, "localizedCaseInsensitiveCompare:", v17);

  objc_msgSend(v7, "userIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 || (objc_msgSend(v8, "userIdentifier"), (v15 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v7, "userIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (v19)
      goto LABEL_19;
  }
  else
  {
    v22 = 1;
  }

LABEL_19:
  if (v13 | v18)
    v23 = 0;
  else
    v23 = v22;

  return v23;
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (id)dictionaryTransform
{
  return +[CN instantMessageAddressToDictionaryTransform](CN, "instantMessageAddressToDictionaryTransform");
}

- (id)fromDictionaryTransform
{
  return +[CN instantMessageAddressFromDictionaryTransform](CN, "instantMessageAddressFromDictionaryTransform");
}

- (id)summarizationKeys
{
  if (summarizationKeys_cn_once_token_9 != -1)
    dispatch_once(&summarizationKeys_cn_once_token_9, &__block_literal_global_575);
  return (id)summarizationKeys_cn_once_object_9;
}

void __57__CNInstantMessageAddressesDescription_summarizationKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("username"), CFSTR("service"), 0);
  v1 = (void *)summarizationKeys_cn_once_object_9;
  summarizationKeys_cn_once_object_9 = v0;

}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  id v5;
  void *v6;

  if (CNLabeledValueValueFromABMultiValueValue__cn_once_token_0 != -1)
    dispatch_once(&CNLabeledValueValueFromABMultiValueValue__cn_once_token_0, &__block_literal_global_80);
  v5 = (id)CNLabeledValueValueFromABMultiValueValue__cn_once_object_0;
  -[CNMultiValuePropertyDescription CNLabeledValueValueFromABMultiValueValue:destinationClass:settersByABKeys:](self, "CNLabeledValueValueFromABMultiValueValue:destinationClass:settersByABKeys:", a3, objc_opt_class(), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __88__CNInstantMessageAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0CF6088];
  v0 = (void *)objc_msgSend(&__block_literal_global_53, "copy");
  v9[0] = v0;
  v8[1] = *MEMORY[0x1E0CF6080];
  v1 = (void *)objc_msgSend(&__block_literal_global_54_3, "copy");
  v9[1] = v1;
  v8[2] = *MEMORY[0x1E0CF6058];
  v2 = (void *)objc_msgSend(&__block_literal_global_55_0, "copy");
  v9[2] = v2;
  v8[3] = *MEMORY[0x1E0CF5F88];
  v3 = (void *)objc_msgSend(&__block_literal_global_56_0, "copy");
  v9[3] = v3;
  v8[4] = *MEMORY[0x1E0CF5F80];
  v4 = (void *)objc_msgSend(&__block_literal_global_57, "copy");
  v9[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)CNLabeledValueValueFromABMultiValueValue__cn_once_object_0;
  CNLabeledValueValueFromABMultiValueValue__cn_once_object_0 = v6;

}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUsername:");
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserIdentifier:");
}

void __88__CNInstantMessageAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v4 = a3;
  +[CNiOSABConstantsMapping ABToCNPersonInstantMessageConstantsMapping](CNiOSABConstantsMapping, "ABToCNPersonInstantMessageConstantsMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  if (v5)
  {
    +[CNiOSABConstantsMapping ABToCNPersonInstantMessageConstantsMapping](CNiOSABConstantsMapping, "ABToCNPersonInstantMessageConstantsMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mappedConstant:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "setService:", v6);

}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTeamIdentifier:");
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBundleIdentifiers:");
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = ABMultiValueValueFromCNLabeledValueValue__cn_once_token_1;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&ABMultiValueValueFromCNLabeledValueValue__cn_once_token_1, &__block_literal_global_60_1);
  v6 = -[CNMultiValuePropertyDescription ABMultiValueValueFromCNLabeledValueValue:gettersByABKeys:](self, "ABMultiValueValueFromCNLabeledValueValue:gettersByABKeys:", v5, ABMultiValueValueFromCNLabeledValueValue__cn_once_object_1);

  return v6;
}

void __88__CNInstantMessageAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0CF6088];
  v0 = (void *)objc_msgSend(&__block_literal_global_62_0, "copy");
  v9[0] = v0;
  v8[1] = *MEMORY[0x1E0CF6080];
  v1 = (void *)objc_msgSend(&__block_literal_global_63, "copy");
  v9[1] = v1;
  v8[2] = *MEMORY[0x1E0CF6058];
  v2 = (void *)objc_msgSend(&__block_literal_global_64_1, "copy");
  v9[2] = v2;
  v8[3] = *MEMORY[0x1E0CF5F88];
  v3 = (void *)objc_msgSend(&__block_literal_global_65_0, "copy");
  v9[3] = v3;
  v8[4] = *MEMORY[0x1E0CF5F80];
  v4 = (void *)objc_msgSend(&__block_literal_global_66_0, "copy");
  v9[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)ABMultiValueValueFromCNLabeledValueValue__cn_once_object_1;
  ABMultiValueValueFromCNLabeledValueValue__cn_once_object_1 = v6;

}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "username");
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userIdentifier");
}

id __88__CNInstantMessageAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNiOSABConstantsMapping CNToABPersonInstantMessageConstantsMapping](CNiOSABConstantsMapping, "CNToABPersonInstantMessageConstantsMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[CNiOSABConstantsMapping CNToABPersonInstantMessageConstantsMapping](CNiOSABConstantsMapping, "CNToABPersonInstantMessageConstantsMapping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mappedConstant:", v2);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  return v2;
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "teamIdentifier");
}

uint64_t __88__CNInstantMessageAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifiers");
}

@end
