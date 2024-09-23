@implementation WFiTunesStoreCountryPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDBCAE8];
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayNameForKey:value:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    +[WFStringSubstitutableState serializedRepresentationFromValue:](WFiTunesStoreCountrySubstitutableState, "serializedRepresentationFromValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "ISOCountryCodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_3500);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_possibleStates;
    self->_possibleStates = v5;

    -[NSArray sortedArrayUsingComparator:](self->_possibleStates, "sortedArrayUsingComparator:", &__block_literal_global_112);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_possibleStates;
    self->_possibleStates = v7;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)objc_msgSend(a3, "value");
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

uint64_t __53__WFiTunesStoreCountryPickerParameter_possibleStates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

WFiTunesStoreCountrySubstitutableState *__53__WFiTunesStoreCountryPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  WFiTunesStoreCountrySubstitutableState *v6;

  v2 = (void *)MEMORY[0x24BDBCEA0];
  v3 = a2;
  objc_msgSend(v2, "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameForKey:value:", *MEMORY[0x24BDBCAE8], v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    v6 = -[WFVariableSubstitutableParameterState initWithValue:]([WFiTunesStoreCountrySubstitutableState alloc], "initWithValue:", v5);
  else
    v6 = 0;

  return v6;
}

@end
