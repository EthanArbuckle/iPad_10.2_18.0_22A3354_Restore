@implementation CalculateError

- (CalculateError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CalculateError *v16;
  objc_super v18;

  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  v10 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[Localize systemLocale](Localize, "systemLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[Localize localizationForLocale:](Localize, "localizationForLocale:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[Localize localizedStringForKey:value:table:localization:](Localize, "localizedStringForKey:value:table:localization:", v12, 0, CFSTR("LocalizableErrors"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v10);

  }
  v18.receiver = self;
  v18.super_class = (Class)CalculateError;
  v16 = -[CalculateError initWithDomain:code:userInfo:](&v18, sel_initWithDomain_code_userInfo_, CalculateErrorDomain, a3, v9);

  return v16;
}

- (id)initIncorrectArguments:(int)a3 correctArguments:(int)a4 inFunction:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CalculateError *v18;
  uint64_t v20;
  _QWORD v21[2];

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a5;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%d"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0CB2D50];
  v12 = (void *)MEMORY[0x1E0CB3940];
  +[Localize systemLocale](Localize, "systemLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[Localize localizationForLocale:](Localize, "localizationForLocale:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[Localize localizedStringForKey:value:table:localization:](Localize, "localizedStringForKey:value:table:localization:", CFSTR("INCORRECT_ARGUMENTS_SPECIFIC"), 0, CFSTR("LocalizableErrors"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v15, v9, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CalculateError initWithCode:userInfo:](self, "initWithCode:userInfo:", -1006, v17);

  return v18;
}

- (id)initIncorrectArguments:(int)a3 minArguments:(int)a4 maxArguments:(int)a5 inFunction:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CalculateError *v21;
  uint64_t v23;
  _QWORD v24[2];

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = a6;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%d"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0CB2D50];
  v15 = (void *)MEMORY[0x1E0CB3940];
  +[Localize systemLocale](Localize, "systemLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[Localize localizationForLocale:](Localize, "localizationForLocale:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[Localize localizedStringForKey:value:table:localization:](Localize, "localizedStringForKey:value:table:localization:", CFSTR("INCORRECT_ARGUMENTS_RANGE"), 0, CFSTR("LocalizableErrors"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v18, v11, v13, v14, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CalculateError initWithCode:userInfo:](self, "initWithCode:userInfo:", -1006, v20);

  return v21;
}

- (id)initUndefinedSymbol:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CalculateError *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("CalculateErrorKeySuggestions");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CalculateError initWithCode:userInfo:](self, "initWithCode:userInfo:", -1003, v6);
  return v7;
}

- (id)initUnbalancedSymbol:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CalculateError *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = initUnbalancedSymbol__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&initUnbalancedSymbol__onceToken, &__block_literal_global_49);
  objc_msgSend((id)initUnbalancedSymbol__normalizeMap, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unbalanced %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[Localize systemLocale](Localize, "systemLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[Localize localizationForLocale:](Localize, "localizationForLocale:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[Localize localizedStringForKey:value:table:localization:](Localize, "localizedStringForKey:value:table:localization:", v10, 0, CFSTR("LocalizableErrors"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    +[Localize systemLocale](Localize, "systemLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[Localize localizationForLocale:](Localize, "localizationForLocale:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[Localize localizedStringForKey:value:table:localization:](Localize, "localizedStringForKey:value:table:localization:", CFSTR("Unbalanced Unknown"), 0, CFSTR("LocalizableErrors"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v17, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v21 = *MEMORY[0x1E0CB2D50];
  v22[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[CalculateError initWithCode:userInfo:](self, "initWithCode:userInfo:", -1001, v18);

  return v19;
}

void __39__CalculateError_initUnbalancedSymbol___block_invoke()
{
  void *v0;

  v0 = (void *)initUnbalancedSymbol__normalizeMap;
  initUnbalancedSymbol__normalizeMap = (uint64_t)&unk_1E6EAD1A8;

}

+ (id)errorWithResultError:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  if (errorWithResultError__onceToken[0] != -1)
    dispatch_once(errorWithResultError__onceToken, &__block_literal_global_468);
  v4 = (void *)errorWithResultError__mapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[CalculateError errorWithCode:userInfo:](CalculateError, "errorWithCode:userInfo:", objc_msgSend(v6, "integerValue"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v5;
  CalculateError *v6;

  v5 = a4;
  v6 = -[CalculateError initWithCode:userInfo:]([CalculateError alloc], "initWithCode:userInfo:", a3, v5);

  return v6;
}

void __39__CalculateError_errorWithResultError___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[15];
  _QWORD v3[16];

  v3[15] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6EABF10;
  v2[1] = &unk_1E6EABF40;
  v3[0] = &unk_1E6EABF28;
  v3[1] = &unk_1E6EABF58;
  v2[2] = &unk_1E6EABF70;
  v2[3] = &unk_1E6EABFA0;
  v3[2] = &unk_1E6EABF88;
  v3[3] = &unk_1E6EABFB8;
  v2[4] = &unk_1E6EABFD0;
  v2[5] = &unk_1E6EAC000;
  v3[4] = &unk_1E6EABFE8;
  v3[5] = &unk_1E6EAC018;
  v2[6] = &unk_1E6EAC030;
  v2[7] = &unk_1E6EAC048;
  v3[6] = &unk_1E6EAC018;
  v3[7] = &unk_1E6EAC060;
  v2[8] = &unk_1E6EAC078;
  v2[9] = &unk_1E6EAC0A8;
  v3[8] = &unk_1E6EAC090;
  v3[9] = &unk_1E6EAC0C0;
  v2[10] = &unk_1E6EAC0D8;
  v2[11] = &unk_1E6EAC108;
  v3[10] = &unk_1E6EAC0F0;
  v3[11] = &unk_1E6EAC120;
  v2[12] = &unk_1E6EAC138;
  v2[13] = &unk_1E6EAC168;
  v3[12] = &unk_1E6EAC150;
  v3[13] = &unk_1E6EAC180;
  v2[14] = &unk_1E6EAC198;
  v3[14] = &unk_1E6EAC1B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)errorWithResultError__mapping;
  errorWithResultError__mapping = v0;

}

@end
