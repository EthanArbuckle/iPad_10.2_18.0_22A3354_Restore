@implementation IPOSXABNamePreferenceInfoProvider

+ (id)domain
{
  return CFSTR("com.apple.AddressBook");
}

+ (id)nativeKeyNameToCanonicalKeyName
{
  if (nativeKeyNameToCanonicalKeyName_onceToken_113 != -1)
    dispatch_once(&nativeKeyNameToCanonicalKeyName_onceToken_113, &__block_literal_global_114);
  return (id)nativeKeyNameToCanonicalKeyName_sMapping_112;
}

void __68__IPOSXABNamePreferenceInfoProvider_nativeKeyNameToCanonicalKeyName__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("ABNameDisplay");
  v2[1] = CFSTR("ABShortNameStyle");
  v3[0] = CFSTR("nameOrder");
  v3[1] = CFSTR("shortNameFormat");
  v2[2] = CFSTR("ABShortNamePrefersNickname");
  v3[2] = CFSTR("preferNicknames");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nativeKeyNameToCanonicalKeyName_sMapping_112;
  nativeKeyNameToCanonicalKeyName_sMapping_112 = v0;

}

+ (id)canonicalNameToNativeKeyName
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__IPOSXABNamePreferenceInfoProvider_canonicalNameToNativeKeyName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (canonicalNameToNativeKeyName_onceToken_122 != -1)
    dispatch_once(&canonicalNameToNativeKeyName_onceToken_122, block);
  return (id)canonicalNameToNativeKeyName_sMapping_121;
}

void __65__IPOSXABNamePreferenceInfoProvider_canonicalNameToNativeKeyName__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "nativeKeyNameToCanonicalKeyName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedDictionary");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)canonicalNameToNativeKeyName_sMapping_121;
  canonicalNameToNativeKeyName_sMapping_121 = v1;

}

+ (id)valueIdentifierToValueMapFromCanonicalKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "canonicalKeyToValueIdentifierToNumericValueMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)valueToValueIdentifierMapFromCanonicalKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "canonicalKeyToValueIdentifierToNumericValueMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "invertedDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)canonicalKeyToValueIdentifierToNumericValueMap
{
  if (canonicalKeyToValueIdentifierToNumericValueMap_onceToken_124 != -1)
    dispatch_once(&canonicalKeyToValueIdentifierToNumericValueMap_onceToken_124, &__block_literal_global_125);
  return (id)canonicalKeyToValueIdentifierToNumericValueMap_sMapping_123;
}

void __83__IPOSXABNamePreferenceInfoProvider_canonicalKeyToValueIdentifierToNumericValueMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("givenFirst");
  v12[1] = CFSTR("familyFirst");
  v13[0] = &unk_1E706D940;
  v13[1] = &unk_1E706D958;
  v14[0] = CFSTR("nameOrder");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("shortNameFormat");
  v10[0] = CFSTR("unset");
  v10[1] = CFSTR("givenNameFamilyInitial");
  v10[2] = CFSTR("familyNameGivenInitial");
  v10[3] = CFSTR("givenOnly");
  v15[0] = v0;
  v11[2] = &unk_1E706D970;
  v11[3] = &unk_1E706D988;
  v11[0] = &unk_1E706D940;
  v11[1] = &unk_1E706D958;
  v10[4] = CFSTR("familyOnly");
  v11[4] = &unk_1E706D9A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v1;
  v14[2] = CFSTR("preferNicknames");
  v8[0] = CFSTR("preferNicknamesEnabled");
  v8[1] = CFSTR("preferNicknamesDisabled");
  v9[0] = &unk_1E706D958;
  v9[1] = &unk_1E706D940;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v2;
  v14[3] = CFSTR("shortNameEnabled");
  v6[0] = CFSTR("shortNamesEnabled");
  v6[1] = CFSTR("shortNamesDisabled");
  v7[0] = &unk_1E706D958;
  v7[1] = &unk_1E706D940;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)canonicalKeyToValueIdentifierToNumericValueMap_sMapping_123;
  canonicalKeyToValueIdentifierToNumericValueMap_sMapping_123 = v4;

}

@end
