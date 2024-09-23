@implementation CNPostalAddressesDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 55), CFSTR("_postalAddresses"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setPostalAddresses:", a3);
}

void __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[8];
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v11[0] = *MEMORY[0x1E0CF5EC8];
  v0 = (void *)objc_msgSend(&__block_literal_global_85, "copy");
  v12[0] = v0;
  v11[1] = *MEMORY[0x1E0CF5ED8];
  v1 = (void *)objc_msgSend(&__block_literal_global_86, "copy");
  v12[1] = v1;
  v11[2] = *MEMORY[0x1E0CF5EA0];
  v2 = (void *)objc_msgSend(&__block_literal_global_87_0, "copy");
  v12[2] = v2;
  v11[3] = *MEMORY[0x1E0CF5ED0];
  v3 = (void *)objc_msgSend(&__block_literal_global_88, "copy");
  v12[3] = v3;
  v11[4] = *MEMORY[0x1E0CF5EC0];
  v4 = (void *)objc_msgSend(&__block_literal_global_89_0, "copy");
  v12[4] = v4;
  v11[5] = *MEMORY[0x1E0CF5EE0];
  v5 = (void *)objc_msgSend(&__block_literal_global_90, "copy");
  v12[5] = v5;
  v11[6] = *MEMORY[0x1E0CF5EB0];
  v6 = (void *)objc_msgSend(&__block_literal_global_91, "copy");
  v12[6] = v6;
  v11[7] = *MEMORY[0x1E0CF5EA8];
  v7 = (void *)objc_msgSend(&__block_literal_global_92, "copy");
  v12[7] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)CNLabeledValueValueFromABMultiValueValue__cn_once_object_4;
  CNLabeledValueValueFromABMultiValueValue__cn_once_object_4 = v9;

}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "postalAddresses");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF5EB8];
  return a3 != 0;
}

- (CNPostalAddressesDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("postalAddresses"), sel_postalAddresses, sel_setPostalAddresses_);
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setISOCountryCode:");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCountry:");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPostalCode:");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setState:");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCity:");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStreet:");
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  id v5;
  void *v6;

  if (CNLabeledValueValueFromABMultiValueValue__cn_once_token_4 != -1)
    dispatch_once(&CNLabeledValueValueFromABMultiValueValue__cn_once_token_4, &__block_literal_global_84_2);
  v5 = (id)CNLabeledValueValueFromABMultiValueValue__cn_once_object_4;
  -[CNMultiValuePropertyDescription CNLabeledValueValueFromABMultiValueValue:destinationClass:settersByABKeys:](self, "CNLabeledValueValueFromABMultiValueValue:destinationClass:settersByABKeys:", a3, objc_opt_class(), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("_postalAddresses"), v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v6[55];
  v6[55] = v10;

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
  objc_msgSend(v6, "postalAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "postalAddresses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "postalAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postalAddresses");
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

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (id)dictionaryTransform
{
  return +[CN postalAddressToDictionaryTransform](CN, "postalAddressToDictionaryTransform");
}

- (id)fromDictionaryTransform
{
  return +[CN postalAddressFromDictionaryTransform](CN, "postalAddressFromDictionaryTransform");
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[8];

  v25[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v25[0] = CFSTR("street");
  v25[1] = CFSTR("subLocality");
  v25[2] = CFSTR("city");
  v25[3] = CFSTR("subAdministrativeArea");
  v25[4] = CFSTR("state");
  v25[5] = CFSTR("postalCode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v5, "valueForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", v13);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
          v17 = v15 == 0;
        else
          v17 = 1;
        if (!v17)
        {
          if (!-[CNPostalAddressesDescription isValue:equivalentToValue:forKey:](self, "isValue:equivalentToValue:forKey:", v14, v15, v13))
          {

            goto LABEL_16;
          }
          v10 = 1;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
LABEL_16:
    v10 = 0;
  }

  return v10 & 1;
}

- (BOOL)isValue:(id)a3 equivalentToValue:(id)a4 forKey:(id)a5
{
  __CFString *v8;
  __CFString *v9;
  id v10;
  __CFString *v11;
  const __CFString *v12;
  char v13;
  BOOL v14;

  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  if (v8)
    v11 = v8;
  else
    v11 = &stru_1E29FF900;
  if (v9)
    v12 = v9;
  else
    v12 = &stru_1E29FF900;
  if (-[__CFString localizedCaseInsensitiveCompare:](v11, "localizedCaseInsensitiveCompare:", v12))
  {
    if (objc_msgSend(v10, "isEqual:", CFSTR("state")))
    {
      v13 = -[CNPostalAddressesDescription isStateValue:equivalentToValue:](self, "isStateValue:equivalentToValue:", v8, v9);
    }
    else if (objc_msgSend(v10, "isEqual:", CFSTR("postalCode")))
    {
      v13 = -[CNPostalAddressesDescription isPostalCodeValue:equivalentToValue:](self, "isPostalCodeValue:equivalentToValue:", v8, v9);
    }
    else
    {
      if (!objc_msgSend(v10, "isEqual:", CFSTR("street")))
      {
        v14 = 0;
        goto LABEL_16;
      }
      v13 = objc_msgSend(MEMORY[0x1E0D13B10], "isStreetAddress:equivalentToStreetAddress:", v8, v9);
    }
    v14 = v13;
  }
  else
  {
    v14 = 1;
  }
LABEL_16:

  return v14;
}

- (BOOL)isStateValue:(id)a3 equivalentToValue:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;

  v6 = a4;
  v7 = -[CNPostalAddressesDescription indexOfUSState:](self, "indexOfUSState:", a3);
  v8 = -[CNPostalAddressesDescription indexOfUSState:](self, "indexOfUSState:", v6);

  return v7 == v8;
}

- (unint64_t)indexOfUSState:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = a3;
  +[CNAddressFormats usaStateAbbreviations](CNAddressFormats, "usaStateAbbreviations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v3);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CNAddressFormats usaStateNames](CNAddressFormats, "usaStateNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "indexOfObject:", v3);

  }
  return v5;
}

- (BOOL)isPostalCodeValue:(id)a3 equivalentToValue:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    if ((objc_msgSend(v5, "hasPrefix:", v6) & 1) != 0 || (objc_msgSend(v6, "hasPrefix:", v5) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E29FF900);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E29FF900);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "localizedCaseInsensitiveCompare:", v10) == 0;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  v8 = -[CNPostalAddressesDescription preferenceScoreForAddress:](self, "preferenceScoreForAddress:", v6);
  v9 = -[CNPostalAddressesDescription preferenceScoreForAddress:](self, "preferenceScoreForAddress:", v7);
  if (v8 == v9)
    v10 = -[CNPostalAddressesDescription address:winsTieBreakerAgainstAddress:](self, "address:winsTieBreakerAgainstAddress:", v6, v7);
  else
    v10 = v8 > v9;

  return v10;
}

- (unint64_t)preferenceScoreForAddress:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[9];

  v19[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19[0] = CFSTR("street");
  v19[1] = CFSTR("subLocality");
  v19[2] = CFSTR("city");
  v19[3] = CFSTR("subAdministrativeArea");
  v19[4] = CFSTR("state");
  v19[5] = CFSTR("postalCode");
  v19[6] = CFSTR("ISOCountryCode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 7);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "valueForKey:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v8 += -[CNPostalAddressesDescription preferenceScoreForKey:](self, "preferenceScoreForKey:", v11);
          if (objc_msgSend(CFSTR("postalCode"), "isEqualToString:", v11))
            v8 += -[CNPostalAddressesDescription postalCodeIsMoreComplete:](self, "postalCodeIsMoreComplete:", v12);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)preferenceScoreForKey:(id)a3
{
  if (objc_msgSend(CFSTR("street"), "isEqual:", a3))
    return 2;
  else
    return 1;
}

- (BOOL)postalCodeIsMoreComplete:(id)a3
{
  return objc_msgSend(a3, "rangeOfString:", CFSTR("-")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)address:(id)a3 winsTieBreakerAgainstAddress:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = -[CNPostalAddressesDescription address:winsTieBreakerAgainstAddressUsingPostalCodeCompleteness:](self, "address:winsTieBreakerAgainstAddressUsingPostalCodeCompleteness:", v6, v7)|| -[CNPostalAddressesDescription address:winsTieBreakerAgainstAddressUsingStateNameCompleteness:](self, "address:winsTieBreakerAgainstAddressUsingStateNameCompleteness:", v6, v7);

  return v8;
}

- (BOOL)address:(id)a3 winsTieBreakerAgainstAddressUsingPostalCodeCompleteness:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  unint64_t v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "street");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {

LABEL_5:
    objc_msgSend(v5, "postalCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(v5, "postalCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postalCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if ((v14 & 1) != 0)
      {
        v10 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v5, "postalCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v11, "length");
      objc_msgSend(v6, "postalCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v15 > objc_msgSend(v16, "length");

    }
    else
    {
      v10 = 0;
    }

    goto LABEL_11;
  }
  objc_msgSend(v6, "street");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
    goto LABEL_5;
  v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)address:(id)a3 winsTieBreakerAgainstAddressUsingStateNameCompleteness:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v5 = a4;
  v6 = a3;
  +[CNAddressFormats usaStateNames](CNAddressFormats, "usaStateNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "containsObject:", v8))
  {
    objc_msgSend(v5, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsObject:", v9) ^ 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)summarizationKeys
{
  if (summarizationKeys_cn_once_token_11 != -1)
    dispatch_once(&summarizationKeys_cn_once_token_11, &__block_literal_global_600);
  return (id)summarizationKeys_cn_once_object_11;
}

void __49__CNPostalAddressesDescription_summarizationKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("street"), CFSTR("subLocality"), CFSTR("city"), CFSTR("subAdministrativeArea"), CFSTR("state"), CFSTR("postalCode"), CFSTR("country"), 0);
  v1 = (void *)summarizationKeys_cn_once_object_11;
  summarizationKeys_cn_once_object_11 = v0;

}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSubLocality:");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSubAdministrativeArea:");
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = ABMultiValueValueFromCNLabeledValueValue__cn_once_token_5;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&ABMultiValueValueFromCNLabeledValueValue__cn_once_token_5, &__block_literal_global_94);
  v6 = -[CNMultiValuePropertyDescription ABMultiValueValueFromCNLabeledValueValue:gettersByABKeys:](self, "ABMultiValueValueFromCNLabeledValueValue:gettersByABKeys:", v5, ABMultiValueValueFromCNLabeledValueValue__cn_once_object_5);

  return v6;
}

void __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[8];
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v11[0] = *MEMORY[0x1E0CF5EC8];
  v0 = (void *)objc_msgSend(&__block_literal_global_95, "copy");
  v12[0] = v0;
  v11[1] = *MEMORY[0x1E0CF5ED8];
  v1 = (void *)objc_msgSend(&__block_literal_global_96, "copy");
  v12[1] = v1;
  v11[2] = *MEMORY[0x1E0CF5EA0];
  v2 = (void *)objc_msgSend(&__block_literal_global_97, "copy");
  v12[2] = v2;
  v11[3] = *MEMORY[0x1E0CF5ED0];
  v3 = (void *)objc_msgSend(&__block_literal_global_98, "copy");
  v12[3] = v3;
  v11[4] = *MEMORY[0x1E0CF5EC0];
  v4 = (void *)objc_msgSend(&__block_literal_global_99, "copy");
  v12[4] = v4;
  v11[5] = *MEMORY[0x1E0CF5EE0];
  v5 = (void *)objc_msgSend(&__block_literal_global_100, "copy");
  v12[5] = v5;
  v11[6] = *MEMORY[0x1E0CF5EB0];
  v6 = (void *)objc_msgSend(&__block_literal_global_101, "copy");
  v12[6] = v6;
  v11[7] = *MEMORY[0x1E0CF5EA8];
  v7 = (void *)objc_msgSend(&__block_literal_global_102_0, "copy");
  v12[7] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)ABMultiValueValueFromCNLabeledValueValue__cn_once_object_5;
  ABMultiValueValueFromCNLabeledValueValue__cn_once_object_5 = v9;

}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "street");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subLocality");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "city");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subAdministrativeArea");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "postalCode");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "country");
}

uint64_t __80__CNPostalAddressesDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ISOCountryCode");
}

@end
