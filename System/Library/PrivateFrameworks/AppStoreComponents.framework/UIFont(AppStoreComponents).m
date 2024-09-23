@implementation UIFont(AppStoreComponents)

+ (id)asc_fontDerivedFromTextStyle:()AppStoreComponents byApplyingFontWeight:compatibleWithTraitCollection:
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0DC37F0]);
  v18[0] = *MEMORY[0x1E0DC4A30];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "pointSize");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v18[1] = *MEMORY[0x1E0DC4A40];
  v8 = *MEMORY[0x1E0DC4A80];
  v17[0] = *MEMORY[0x1E0DC4A78];
  v9 = *MEMORY[0x1E0DC4BA8];
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithFontAttributes:", v12);

  objc_msgSend(a1, "fontWithDescriptor:size:", v13, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)asc_fontDerivedFromTextStyle:()AppStoreComponents byApplyingFontWeight:
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "fontAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDictionary:", v6);

  v8 = *MEMORY[0x1E0DC4A78];
  v9 = *MEMORY[0x1E0DC4BA8];
  v15[0] = *MEMORY[0x1E0DC4A80];
  v15[1] = v9;
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0DC4A40]);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC37F0]), "initWithFontAttributes:", v7);
  objc_msgSend(a1, "fontWithDescriptor:size:", v12, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (uint64_t)asc_preferredFontForTextStyle:()AppStoreComponents compatibleWithTraitCollection:
{
  return objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:compatibleWithTraitCollection:");
}

+ (id)asc_preferredFontForTextStyle:()AppStoreComponents withTraits:compatibleWithTraitCollection:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = a1;
    v12 = v10;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[UIFont(AppStoreComponents) asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:].cold.1();
    v11 = a1;
    v12 = v9;
  }
  objc_msgSend(v11, "fontWithDescriptor:size:", v12, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)asc_preferredFontForTextStyle:()AppStoreComponents withTraits:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = a1;
    v10 = v8;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[UIFont(AppStoreComponents) asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:].cold.1();
    v9 = a1;
    v10 = v7;
  }
  objc_msgSend(v9, "fontWithDescriptor:size:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)asc_preferredFontForTextStyle:()AppStoreComponents withTraits:compatibleWithTraitCollection:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_1BCB7B000, MEMORY[0x1E0C81028], v0, "Could not apply symbolic traits %d to %@", v1, v2, v3, v4, v5);
}

@end
