@implementation LNDeferredLocalizedString(CATSupport)

- (id)localizedKeyWithParameters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD v17[4];
  _QWORD v18[4];

  if (localizedKeyWithParameters_onceToken != -1)
    dispatch_once(&localizedKeyWithParameters_onceToken, &__block_literal_global_2255);
  objc_msgSend(a1, "localizedKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ln_stringByEscapingForXML");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v5 = (void *)localizedKeyWithParameters_regularExpression;
  objc_msgSend(a1, "localizedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__LNDeferredLocalizedString_CATSupport__localizedKeyWithParameters__block_invoke_2;
  v13[3] = &unk_1E45DC240;
  v13[4] = a1;
  v15 = v17;
  v16 = v18;
  v9 = v4;
  v14 = v9;
  objc_msgSend(v5, "enumerateMatchesInString:options:range:usingBlock:", v6, 0, 0, v8, v13);

  v10 = v14;
  v11 = v9;

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v18, 8);
  return v11;
}

- (id)parameterDefinitions
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "arguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  objc_msgSend(a1, "arguments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__LNDeferredLocalizedString_CATSupport__parameterDefinitions__block_invoke;
  v8[3] = &unk_1E45DC268;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

- (id)parametersForCAT
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "arguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__LNDeferredLocalizedString_CATSupport__parametersForCAT__block_invoke;
  v6[3] = &unk_1E45DC268;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

@end
