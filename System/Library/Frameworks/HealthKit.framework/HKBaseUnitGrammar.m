@implementation HKBaseUnitGrammar

id ___HKBaseUnitGrammar_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evaluate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL ___HKBaseUnitGrammar_block_invoke_4(uint64_t a1, uint64_t a2)
{
  return a2 == 10;
}

id ___HKBaseUnitGrammar_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evaluate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "evaluate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void ___HKBaseUnitGrammar_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char **v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  char **v32;
  char *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD aBlock[4];
  id v52;
  _QWORD v53[4];
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  _QWORD v61[3];
  _QWORD v62[2];
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  +[_HKCFGNonTerminal nonTerminalWithLabel:](_HKCFGNonTerminal, "nonTerminalWithLabel:", CFSTR("U"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKCFGNonTerminal nonTerminalWithLabel:](_HKCFGNonTerminal, "nonTerminalWithLabel:", CFSTR("R"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKCFGNonTerminal nonTerminalWithLabel:](_HKCFGNonTerminal, "nonTerminalWithLabel:", CFSTR("P"));
  v2 = objc_claimAutoreleasedReturnValue();
  +[_HKCFGNonTerminal nonTerminalWithLabel:](_HKCFGNonTerminal, "nonTerminalWithLabel:", CFSTR("Q"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCharactersToBeSkipped:", 0);
  +[_HKCFGNonTerminal nonTerminalWithLabel:](_HKCFGNonTerminal, "nonTerminalWithLabel:", CFSTR("M"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setCharactersToBeSkipped:", 0);
  v63[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addReplacementRuleWithExpressions:nodeEvaluator:", v4, &__block_literal_global_757);

  v46 = (void *)v2;
  v62[0] = v2;
  v62[1] = v3;
  v5 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addReplacementRuleWithExpressions:nodeEvaluator:", v6, &__block_literal_global_759);

  +[_HKCFGTerminal terminalMatchingIntegerWithCondition:](_HKCFGTerminal, "terminalMatchingIntegerWithCondition:", &__block_literal_global_762);
  v7 = objc_claimAutoreleasedReturnValue();
  +[_HKCFGTerminal terminalMatchingIntegerWithCondition:](_HKCFGTerminal, "terminalMatchingIntegerWithCondition:", &__block_literal_global_763);
  v8 = objc_claimAutoreleasedReturnValue();
  v61[0] = v7;
  v61[1] = CFSTR("^");
  v61[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addReplacementRuleWithExpressions:nodeEvaluator:", v9, &__block_literal_global_766);

  v41 = (void *)v8;
  v42 = (void *)v7;
  v60[0] = v7;
  v60[1] = CFSTR("^");
  v60[2] = v8;
  v60[3] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addReplacementRuleWithExpressions:nodeEvaluator:", v10, &__block_literal_global_767);

  v11 = 0;
  v12 = &__SIUnitDefinitions;
  do
  {
    v13 = *v12;
    v12 += 6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_HKCFGTerminal terminalMatchingString:caseSensitive:](_HKCFGTerminal, "terminalMatchingString:caseSensitive:", v14, v11 != 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIsPrivate:", (0x1D080uLL >> v11) & 1);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = ___HKBaseUnitGrammar_block_invoke_8;
    aBlock[3] = &unk_1E37F4628;
    v52 = v14;
    v16 = v14;
    v17 = _Block_copy(aBlock);
    v59 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "addReplacementRuleWithExpressions:nodeEvaluator:", v18, v17);

    v58 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addReplacementRuleWithExpressions:nodeEvaluator:", v19, v17);

    ++v11;
  }
  while (v11 != 17);
  v57 = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addReplacementRuleWithExpressions:nodeEvaluator:", v20, &__block_literal_global_768);

  v56 = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v5;
  objc_msgSend(v5, "addReplacementRuleWithExpressions:nodeEvaluator:", v21, &__block_literal_global_768);

  v22 = 0;
  v23 = MEMORY[0x1E0C809B0];
  do
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (&__OtherUnitDefinitions)[v22]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[_HKCFGTerminal terminalMatchingString:caseSensitive:](_HKCFGTerminal, "terminalMatchingString:caseSensitive:", v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setIsPrivate:", v22 == 192);
    v55 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v23;
    v49[1] = 3221225472;
    v49[2] = ___HKBaseUnitGrammar_block_invoke_10;
    v49[3] = &unk_1E37F4628;
    v50 = v24;
    v27 = v24;
    objc_msgSend(v1, "addReplacementRuleWithExpressions:nodeEvaluator:", v26, v49);

    v22 += 6;
  }
  while (v22 != 222);
  v44 = v1;
  for (i = 0; i != 28; i += 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (&__PrefixDefinitions)[i]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addReplacementRuleWithExpressions:nodeEvaluator:", v30, &__block_literal_global_769);

  }
  v31 = 0;
  v32 = &__ContextSpecificUnitDefinitions;
  do
  {
    v33 = *v32;
    v32 += 6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[_HKCFGTerminal terminalMatchingString:caseSensitive:](_HKCFGTerminal, "terminalMatchingString:caseSensitive:", v34, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setIsPrivate:", (0x1D080uLL >> v31) & 1);
    +[_HKCFGTerminal terminalMatchingDoubleWithCondition:](_HKCFGTerminal, "terminalMatchingDoubleWithCondition:", &__block_literal_global_771);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setIsPrivate:", v31 != 0);
    v53[0] = v35;
    v53[1] = CFSTR("<");
    v53[2] = v36;
    v53[3] = CFSTR(">");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = ___HKBaseUnitGrammar_block_invoke_13;
    v47[3] = &unk_1E37EE898;
    v48 = v34;
    v38 = v34;
    objc_msgSend(v45, "addReplacementRuleWithExpressions:nodeEvaluator:", v37, v47);

    ++v31;
  }
  while (v31 != 4);
  +[_HKContextFreeGrammar grammarWithRootNonTerminal:emptyStringEvaluator:](_HKContextFreeGrammar, "grammarWithRootNonTerminal:emptyStringEvaluator:", v0, &__block_literal_global_778);
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)_HKBaseUnitGrammar___grammar;
  _HKBaseUnitGrammar___grammar = v39;

}

BOOL ___HKBaseUnitGrammar_block_invoke_5(uint64_t a1, uint64_t a2)
{
  return a2 > 0;
}

id ___HKBaseUnitGrammar_block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  long double v6;
  void *v7;
  void *v8;
  long double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evaluate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "evaluate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = pow(v6, v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBaseUnit _uniquedUnitWithPrefix:conversionConstant:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:conversionConstant:rootUnit:", 0, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id ___HKBaseUnitGrammar_block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  long double v6;
  void *v7;
  void *v8;
  long double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evaluate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evaluate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = pow(v6, v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "evaluate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBaseUnit _uniquedUnitWithPrefix:conversionConstant:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:conversionConstant:rootUnit:", 0, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id ___HKBaseUnitGrammar_block_invoke_8(uint64_t a1)
{
  return +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", *(_QWORD *)(a1 + 32));
}

id ___HKBaseUnitGrammar_block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evaluate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ___HKBaseUnitGrammar_block_invoke_10(uint64_t a1)
{
  return +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", *(_QWORD *)(a1 + 32));
}

id ___HKBaseUnitGrammar_block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "evaluate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL ___HKBaseUnitGrammar_block_invoke_12(double a1)
{
  return a1 > 0.0;
}

id ___HKBaseUnitGrammar_block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "evaluate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBaseUnit _uniquedUnitWithPrefix:conversionConstant:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:conversionConstant:rootUnit:", 0, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id ___HKBaseUnitGrammar_block_invoke_14()
{
  return +[HKUnit _nullUnit](HKUnit, "_nullUnit");
}

@end
