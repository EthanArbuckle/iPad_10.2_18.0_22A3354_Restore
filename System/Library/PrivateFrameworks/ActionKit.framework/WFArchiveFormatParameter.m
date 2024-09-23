@implementation WFArchiveFormatParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)defaultSerializedRepresentation
{
  return +[WFStringSubstitutableState serializedRepresentationFromValue:](WFArchiveFormatSubstitutableState, "serializedRepresentationFromValue:", *MEMORY[0x24BE196C0]);
}

- (id)possibleStates
{
  void *v2;
  void *v3;

  WFSupportedArchiveFormats();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_22793);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFArchiveFormatFileExtension();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("."), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

WFArchiveFormatSubstitutableState *__42__WFArchiveFormatParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFArchiveFormatSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFArchiveFormatSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

@end
