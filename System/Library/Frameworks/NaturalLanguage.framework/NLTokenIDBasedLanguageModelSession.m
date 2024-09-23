@implementation NLTokenIDBasedLanguageModelSession

- (id)conditionalProbabilityForTokenID:(unsigned int)a3 contextTokenIDs:(const unsigned int *)a4 length:(unint64_t)a5
{
  return -[NLProbabilityInfo initWithInvalidProbability]([NLProbabilityInfo alloc], "initWithInvalidProbability");
}

- (id)conditionalProbabilitiesForTokenIDs:(const unsigned int *)a3 count:(unint64_t)a4 contextTokenIDs:(const unsigned int *)a5 length:(unint64_t)a6
{
  void *i;
  unsigned int v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a4; --a4)
  {
    v12 = *a3++;
    -[NLTokenIDBasedLanguageModelSession conditionalProbabilityForTokenID:contextTokenIDs:length:](self, "conditionalProbabilityForTokenID:contextTokenIDs:length:", v12, a5, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v13);

  }
  return i;
}

- (int64_t)blocklistStatusForTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4 matchType:(int64_t)a5
{
  return 0;
}

- (id)stateWithOptions:(id)a3
{
  id v4;
  NLTokenIDBasedLanguageModelState *v5;
  NLTokenIDBasedLanguageModelState *v6;

  v4 = a3;
  v5 = [NLTokenIDBasedLanguageModelState alloc];
  v6 = -[NLTokenIDBasedLanguageModelState initWithSession:options:context:contextTokenIDArray:](v5, "initWithSession:options:context:contextTokenIDArray:", self, v4, &stru_1E4A3BA10, MEMORY[0x1E0C9AA60]);

  return v6;
}

@end
