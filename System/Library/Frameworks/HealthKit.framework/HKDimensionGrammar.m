@implementation HKDimensionGrammar

void ___HKDimensionGrammar_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  +[_HKCFGNonTerminal nonTerminalWithLabel:](_HKCFGNonTerminal, "nonTerminalWithLabel:", CFSTR("D"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = 0;
  v2 = MEMORY[0x1E0C809B0];
  do
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (&__DimensionDefinitions)[v1]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = ___HKDimensionGrammar_block_invoke_2;
    v9[3] = &unk_1E37EE898;
    v10 = v3;
    v5 = v3;
    objc_msgSend(v0, "addReplacementRuleWithExpressions:nodeEvaluator:", v4, v9);

    v1 += 4;
  }
  while (v1 != 84);
  v11 = CFSTR("(null)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addReplacementRuleWithExpressions:nodeEvaluator:", v6, &__block_literal_global_216);

  +[_HKContextFreeGrammar grammarWithRootNonTerminal:](_HKContextFreeGrammar, "grammarWithRootNonTerminal:", v0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_HKDimensionGrammar___grammar;
  _HKDimensionGrammar___grammar = v7;

}

id ___HKDimensionGrammar_block_invoke_2(uint64_t a1)
{
  return +[_HKBaseDimension _uniquedDefinedDimensionWithName:](_HKBaseDimension, "_uniquedDefinedDimensionWithName:", *(_QWORD *)(a1 + 32));
}

id ___HKDimensionGrammar_block_invoke_3()
{
  return +[_HKBaseDimension nullDimension](_HKBaseDimension, "nullDimension");
}

@end
