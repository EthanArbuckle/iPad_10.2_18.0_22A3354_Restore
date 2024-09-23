@implementation UTTypeRecord(IconServicesAdditions)

+ (uint64_t)_IS_tagFromTypeCode:()IconServicesAdditions
{
  return 0;
}

+ (uint64_t)_IS_typeCodeFromTag:()IconServicesAdditions
{
  return 0;
}

- (id)_IS_iconProvidingRecordAcceptingWildCard:()IconServicesAdditions
{
  id v5;
  uint64_t v6;
  unsigned int (**v7)(_QWORD, _QWORD);
  id v8;
  id v9;
  _QWORD v11[4];
  unsigned int (**v12)(_QWORD, _QWORD);
  uint64_t *v13;
  _QWORD v14[4];
  char v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a1;
  v16 = 0;
  v17 = (id *)&v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v6 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__UTTypeRecord_IconServicesAdditions___IS_iconProvidingRecordAcceptingWildCard___block_invoke;
  v14[3] = &__block_descriptor_33_e22_B16__0__UTTypeRecord_8l;
  v15 = a3;
  v7 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1AF4232B8](v14);
  if (((unsigned int (**)(_QWORD, id))v7)[2](v7, v5))
    objc_storeStrong(v17 + 5, a1);
  v8 = v17[5];
  if (!v8)
  {
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __80__UTTypeRecord_IconServicesAdditions___IS_iconProvidingRecordAcceptingWildCard___block_invoke_2;
    v11[3] = &unk_1E58006B0;
    v12 = v7;
    v13 = &v16;
    objc_msgSend(v5, "enumeratePedigreeWithBlock:", v11);

    v8 = v17[5];
  }
  v9 = v8;

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)_IS_symbolName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "iconDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_IF_stringForKey:", 0x1E5802BF8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_IS_symbolNameForVariantKey:()IconServicesAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "iconDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_IF_dictionaryForKey:", 0x1E5802C18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_IF_stringForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_IS_symbolHeroName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "iconDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_IF_stringForKey:", 0x1E5802C38);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_IS_symbolProvidingRecord
{
  return objc_msgSend(a1, "_IS_symbolProvidingRecordWithVariantKey:allowNonVariantMatch:preferHeroOverBaseSymbol:", 0, 1, 0);
}

- (uint64_t)_IS_symbolProvidingRecordWithVariantKey:()IconServicesAdditions allowNonVariantMatch:
{
  return objc_msgSend(a1, "_IS_symbolProvidingRecordWithVariantKey:allowNonVariantMatch:preferHeroOverBaseSymbol:", a3, a4, 0);
}

- (id)_IS_symbolProvidingRecordWithVariantKey:()IconServicesAdditions allowNonVariantMatch:preferHeroOverBaseSymbol:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  unsigned int (**v12)(_QWORD, _QWORD);
  id v13;
  id v14;
  _QWORD v16[4];
  unsigned int (**v17)(_QWORD, _QWORD);
  uint64_t *v18;
  _QWORD v19[4];
  id v20;
  char v21;
  char v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a1;
  v23 = 0;
  v24 = (id *)&v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __125__UTTypeRecord_IconServicesAdditions___IS_symbolProvidingRecordWithVariantKey_allowNonVariantMatch_preferHeroOverBaseSymbol___block_invoke;
  v19[3] = &unk_1E58006D8;
  v11 = v8;
  v20 = v11;
  v21 = a4;
  v22 = a5;
  v12 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1AF4232B8](v19);
  if (((unsigned int (**)(_QWORD, id))v12)[2](v12, v9))
    objc_storeStrong(v24 + 5, a1);
  v13 = v24[5];
  if (!v13)
  {
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __125__UTTypeRecord_IconServicesAdditions___IS_symbolProvidingRecordWithVariantKey_allowNonVariantMatch_preferHeroOverBaseSymbol___block_invoke_2;
    v16[3] = &unk_1E58006B0;
    v17 = v12;
    v18 = &v23;
    objc_msgSend(v9, "enumeratePedigreeWithBlock:", v16);

    v13 = v24[5];
  }
  v14 = v13;

  _Block_object_dispose(&v23, 8);
  return v14;
}

- (uint64_t)_IS_allowsArbitraryExtensionAsText
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "iconDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", 0x1E5802BD8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqual:", CFSTR("*"));
  return v3;
}

- (uint64_t)_IS_primaryFilenameExtension
{
  return objc_msgSend(a1, "preferredTagOfClass:", *MEMORY[0x1E0CA5A88]);
}

- (id)_ICP_filenameExtensions
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "tagSpecification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CA5A88];
  objc_msgSend(v2, "objectForKey:ofClass:", *MEMORY[0x1E0CA5A88], objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "tagSpecification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:ofClass:valuesOfClass:", v3, v7, objc_opt_class());
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0C9AA60];
    if (v8)
      v10 = (void *)v8;
    v5 = v10;

  }
  return v5;
}

@end
