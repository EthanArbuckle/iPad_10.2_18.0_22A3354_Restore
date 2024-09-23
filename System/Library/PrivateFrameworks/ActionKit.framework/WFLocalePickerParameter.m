@implementation WFLocalePickerParameter

+ (id)availableLocaleIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEA0], "availableLocaleIdentifiers");
}

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    objc_msgSend((id)objc_opt_class(), "availableLocaleIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_38086);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_map:", &__block_literal_global_111_38087);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_possibleStates;
    self->_possibleStates = v6;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedPlaceholder
{
  return WFLocalizedString(CFSTR("Default"));
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDBCEA0];
  v4 = a3;
  objc_msgSend(v3, "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDBCB18];
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayNameForKey:value:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "capitalizedStringWithLocale:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __41__WFLocalePickerParameter_possibleStates__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

uint64_t __41__WFLocalePickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = (void *)MEMORY[0x24BDBCEA0];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDBCB18];
  objc_msgSend(v7, "displayNameForKey:value:", *MEMORY[0x24BDBCB18], v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayNameForKey:value:", v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v9, "compare:", v11);
  return v12;
}

@end
