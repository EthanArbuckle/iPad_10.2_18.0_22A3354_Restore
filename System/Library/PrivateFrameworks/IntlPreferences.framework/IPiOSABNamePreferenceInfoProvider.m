@implementation IPiOSABNamePreferenceInfoProvider

+ (id)domain
{
  return CFSTR("com.apple.PeoplePicker");
}

+ (id)nativeKeyNameToCanonicalKeyName
{
  if (nativeKeyNameToCanonicalKeyName_onceToken != -1)
    dispatch_once(&nativeKeyNameToCanonicalKeyName_onceToken, &__block_literal_global_2);
  return (id)nativeKeyNameToCanonicalKeyName_sMapping;
}

void __68__IPiOSABNamePreferenceInfoProvider_nativeKeyNameToCanonicalKeyName__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("personNameOrdering");
  v2[1] = CFSTR("personShortNameFormat");
  v3[0] = CFSTR("nameOrder");
  v3[1] = CFSTR("shortNameFormat");
  v2[2] = CFSTR("personShortNamePreferNicknames");
  v2[3] = CFSTR("personShortNameFormatEnabled");
  v3[2] = CFSTR("preferNicknames");
  v3[3] = CFSTR("shortNameEnabled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nativeKeyNameToCanonicalKeyName_sMapping;
  nativeKeyNameToCanonicalKeyName_sMapping = v0;

}

+ (id)canonicalNameToNativeKeyName
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__IPiOSABNamePreferenceInfoProvider_canonicalNameToNativeKeyName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (canonicalNameToNativeKeyName_onceToken != -1)
    dispatch_once(&canonicalNameToNativeKeyName_onceToken, block);
  return (id)canonicalNameToNativeKeyName_sMapping;
}

void __65__IPiOSABNamePreferenceInfoProvider_canonicalNameToNativeKeyName__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "nativeKeyNameToCanonicalKeyName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedDictionary");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)canonicalNameToNativeKeyName_sMapping;
  canonicalNameToNativeKeyName_sMapping = v1;

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
  if (canonicalKeyToValueIdentifierToNumericValueMap_onceToken != -1)
    dispatch_once(&canonicalKeyToValueIdentifierToNumericValueMap_onceToken, &__block_literal_global_53);
  return (id)canonicalKeyToValueIdentifierToNumericValueMap_sMapping;
}

void __83__IPiOSABNamePreferenceInfoProvider_canonicalKeyToValueIdentifierToNumericValueMap__block_invoke()
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
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("nameOrder");
  v12[0] = CFSTR("givenFirst");
  v12[1] = CFSTR("familyFirst");
  v13[0] = &unk_1E706D940;
  v13[1] = &unk_1E706D958;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v0;
  v14[1] = CFSTR("shortNameFormat");
  v10[0] = CFSTR("givenNameFamilyInitial");
  v10[1] = CFSTR("familyNameGivenInitial");
  v11[0] = &unk_1E706D940;
  v11[1] = &unk_1E706D958;
  v10[2] = CFSTR("givenOnly");
  v10[3] = CFSTR("familyOnly");
  v11[2] = &unk_1E706D970;
  v11[3] = &unk_1E706D988;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
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
  v5 = (void *)canonicalKeyToValueIdentifierToNumericValueMap_sMapping;
  canonicalKeyToValueIdentifierToNumericValueMap_sMapping = v4;

}

@end
