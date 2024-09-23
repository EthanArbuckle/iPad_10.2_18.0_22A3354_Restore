@implementation CNPostalAddressStreetEquivalance

+ (BOOL)isStreetAddress:(id)a3 equivalentToStreetAddress:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  BOOL v11;

  v6 = a4;
  objc_msgSend(a1, "normalizeAddress:", a3);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "normalizeAddress:", v6);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v9 = v7;
  else
    v9 = &stru_1E29BCC70;
  if (v8)
    v10 = v8;
  else
    v10 = &stru_1E29BCC70;
  v11 = -[__CFString localizedCaseInsensitiveCompare:](v9, "localizedCaseInsensitiveCompare:", v10) == 0;

  return v11;
}

+ (id)normalizeAddress:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(a1, "prepareStringForNormalization:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__CNPostalAddressStreetEquivalance_normalizeAddress___block_invoke;
  v9[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
  v9[4] = a1;
  objc_msgSend(v5, "_cn_map:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __53__CNPostalAddressStreetEquivalance_normalizeAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "normalizeComponent:", a2);
}

+ (id)prepareStringForNormalization:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("#"), CFSTR("Apt "));
}

+ (id)normalizeComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_stringByDeletingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "normalizationMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = v4;
  v10 = v9;

  return v10;
}

+ (id)_normalizationMap
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("StreetAbbreviations"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v3);
  return v4;
}

+ (id)normalizationMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CNPostalAddressStreetEquivalance_normalizationMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (normalizationMap_cn_once_token_0 != -1)
    dispatch_once(&normalizationMap_cn_once_token_0, block);
  return (id)normalizationMap_cn_once_object_0;
}

void __52__CNPostalAddressStreetEquivalance_normalizationMap__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_normalizationMap");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)normalizationMap_cn_once_object_0;
  normalizationMap_cn_once_object_0 = v1;

}

@end
