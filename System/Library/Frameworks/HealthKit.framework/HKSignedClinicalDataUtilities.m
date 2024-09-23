@implementation HKSignedClinicalDataUtilities

+ (id)recordTypeDisplayNameWithTypes:(id)a3
{
  id v3;
  int v4;
  void *v5;
  const __CFString *v6;
  int v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("https://smarthealth.cards#covid19"));
  if (objc_msgSend(v3, "containsObject:", CFSTR("https://smarthealth.cards#immunization")))
  {
    HKHealthKitFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v4 & 1) != 0)
      v6 = CFSTR("HEALTH_CARD_TYPE_COVID_IMMUNIZATION");
    else
      v6 = CFSTR("HEALTH_CARD_TYPE_IMMUNIZATION");
  }
  else
  {
    v7 = objc_msgSend(v3, "containsObject:", CFSTR("https://smarthealth.cards#laboratory"));
    HKHealthKitFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if ((v4 & 1) != 0)
        v6 = CFSTR("HEALTH_CARD_TYPE_COVID_LABORATORY");
      else
        v6 = CFSTR("HEALTH_CARD_TYPE_LABORATORY");
    }
    else if (v4)
    {
      v6 = CFSTR("HEALTH_CARD_TYPE_COVID_CARD");
    }
    else
    {
      v6 = CFSTR("HEALTH_CARD_TYPE_SMART_HEALTH_CARD");
    }
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1E37FD4C0, CFSTR("Localizable-Pasadena"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)recordItemsDisplayNameWithItems:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithArray:", v21);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v3, "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v10 = objc_msgSend(v3, "countForObject:", v9);
        if (v10 == 1)
        {
          objc_msgSend(v4, "addObject:", v9);
        }
        else
        {
          v11 = v10;
          v12 = (void *)MEMORY[0x1E0CB3940];
          HKHealthKitFrameworkBundle();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("HEALTH_CARD_DISPLAY_NAME_COUNTED"), &stru_1E37FD4C0, CFSTR("Localizable-Pasadena"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", v14, v9, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObject:", v16);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
    HKHealthKitFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("HEALTH_CARD_DISPLAY_NAME_JOIN_STRING"), &stru_1E37FD4C0, CFSTR("Localizable-Pasadena"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "componentsJoinedByString:", v18);
  }
  else
  {
    HKHealthKitFrameworkBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("HEALTH_CARD_DISPLAY_NAME_EMPTY_CARD"), &stru_1E37FD4C0, CFSTR("Localizable-Pasadena"));
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)recordIssuerDisplayNameWithIssuerIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a3;
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v4;
  v8 = v6;

  return v8;
}

+ (id)preferredRecordIssuerDisplayNameWithIssuerIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("http://www.iso.org/3166-1/a2/")))
  {
    objc_msgSend(v3, "substringWithRange:", objc_msgSend(CFSTR("http://www.iso.org/3166-1/a2/"), "length"), objc_msgSend(v3, "length") - objc_msgSend(CFSTR("http://www.iso.org/3166-1/a2/"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableCurrentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForCountryCode:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
      v7 = v6;
    else
      v7 = v4;
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
