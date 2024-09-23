@implementation _HKContextFreeGrammar

- (id)parseTreeForString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSCharacterSet *terminalCharacters;
  id v8;
  _HKCFGParseContext *v9;
  void *v10;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCharactersToBeSkipped:", 0);
    v6 = 0;
    if ((objc_msgSend(v5, "isAtEnd") & 1) == 0)
    {
      v6 = 0;
      do
      {
        objc_msgSend(v5, "scanUpToCharactersFromSet:intoString:", self->_terminalCharacters, 0);
        terminalCharacters = self->_terminalCharacters;
        v12 = 0;
        objc_msgSend(v5, "scanCharactersFromSet:intoString:", terminalCharacters, &v12);
        v8 = v12;
        v6 += objc_msgSend(v8, "length");

      }
      while (!objc_msgSend(v5, "isAtEnd"));
    }
    objc_msgSend(v5, "setScanLocation:", 0);
    v9 = -[_HKCFGParseContext initWithScanner:lengthAllowance:]([_HKCFGParseContext alloc], "initWithScanner:lengthAllowance:", v5, v6);
    -[_HKCFGNonTerminal _parseTreeWithContext:](self->_rootNonTerminal, "_parseTreeWithContext:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (self->_emptyStringEvaluator)
  {
    +[_HKCFGEmptyStringNode nodeWithEvaluator:](_HKCFGEmptyStringNode, "nodeWithEvaluator:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)grammarWithRootNonTerminal:(id)a3
{
  return (id)objc_msgSend(a1, "grammarWithRootNonTerminal:emptyStringEvaluator:", a3, 0);
}

+ (id)grammarWithRootNonTerminal:(id)a3 emptyStringEvaluator:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRootNonTerminal:emptyStringEvaluator:", v7, v6);

  return v8;
}

- (_HKContextFreeGrammar)initWithRootNonTerminal:(id)a3 emptyStringEvaluator:(id)a4
{
  id v7;
  id v8;
  _HKContextFreeGrammar *v9;
  NSMutableSet *v10;
  NSMutableSet *nonTerminals;
  NSMutableSet *v12;
  NSMutableSet *terminals;
  uint64_t v14;
  id emptyStringEvaluator;
  id v16;
  NSMutableSet *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSCharacterSet *terminalCharacters;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)_HKContextFreeGrammar;
  v9 = -[_HKContextFreeGrammar init](&v30, sel_init);
  if (v9)
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    nonTerminals = v9->_nonTerminals;
    v9->_nonTerminals = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    terminals = v9->_terminals;
    v9->_terminals = v12;

    objc_storeStrong((id *)&v9->_rootNonTerminal, a3);
    v14 = objc_msgSend(v8, "copy");
    emptyStringEvaluator = v9->_emptyStringEvaluator;
    v9->_emptyStringEvaluator = (id)v14;

    -[_HKContextFreeGrammar _gatherExpressions](v9, "_gatherExpressions");
    -[NSMutableSet makeObjectsPerformSelector:](v9->_nonTerminals, "makeObjectsPerformSelector:", sel__checkForCycles);
    v16 = objc_alloc_init(MEMORY[0x1E0CB3780]);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v9->_terminals;
    v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v21), "characterSet", (_QWORD)v26);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "formUnionWithCharacterSet:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v19);
    }

    v23 = objc_msgSend(v16, "copy");
    terminalCharacters = v9->_terminalCharacters;
    v9->_terminalCharacters = (NSCharacterSet *)v23;

  }
  return v9;
}

- (void)invalidate
{
  -[NSMutableSet makeObjectsPerformSelector:](self->_nonTerminals, "makeObjectsPerformSelector:", sel__invalidate);
}

- (void)_gatherExpressions
{
  -[_HKContextFreeGrammar _gatherExpressionsStartingAt:](self, "_gatherExpressionsStartingAt:", self->_rootNonTerminal);
}

- (void)_gatherExpressionsStartingAt:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_nonTerminals, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_nonTerminals, "addObject:", v4);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v4;
    objc_msgSend(v4, "_replacementRules");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          objc_msgSend(v9, "rightHandSide");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v19;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v19 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  -[_HKContextFreeGrammar _gatherExpressionsStartingAt:](self, "_gatherExpressionsStartingAt:", v15);
                else
                  -[NSMutableSet addObject:](self->_terminals, "addObject:", v15);
                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

    v4 = v16;
  }

}

- (_HKCFGNonTerminal)rootNonTerminal
{
  return self->_rootNonTerminal;
}

- (id)emptyStringEvaluator
{
  return self->_emptyStringEvaluator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_emptyStringEvaluator, 0);
  objc_storeStrong((id *)&self->_rootNonTerminal, 0);
  objc_storeStrong((id *)&self->_terminalCharacters, 0);
  objc_storeStrong((id *)&self->_terminals, 0);
  objc_storeStrong((id *)&self->_nonTerminals, 0);
}

@end
