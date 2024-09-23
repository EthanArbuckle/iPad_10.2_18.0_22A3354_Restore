@implementation _HKCFGNonTerminal

- (id)_parseTreeWithContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43___HKCFGNonTerminal__parseTreeWithContext___block_invoke;
  v8[3] = &unk_1E37EBE58;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[_HKCFGNonTerminal _tryNodesWithContext:solutionTest:](self, "_tryNodesWithContext:solutionTest:", v5, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_tryNodesWithContext:(id)a3 solutionTest:(id)a4
{
  id v5;
  uint64_t (**v6)(id, void *);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  void *v33;
  id v34;
  uint64_t (**v35)(id, void *);
  uint64_t *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (uint64_t (**)(id, void *))a4;
  objc_msgSend(v5, "scanner");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v29, "scanLocation");
  objc_msgSend(v5, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nodesForPosition:nonTerminal:withLengthAllowance:", v28, self, objc_msgSend(v5, "lengthAllowance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v8 = v26;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v47;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v11);
        objc_msgSend(v5, "scanner");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "rangeOfString");
        objc_msgSend(v13, "setScanLocation:", v14 + v15);

        if ((v6[2](v6, v12) & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    objc_msgSend(v29, "setCharactersToBeSkipped:", self->_charactersToBeSkipped);
    v41 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    v16 = self->_replacementRules;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v39;
LABEL_13:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v19);
        v21 = objc_msgSend(v5, "lengthAllowance");
        if (v21 >= objc_msgSend(v20, "lengthIncrease"))
        {
          objc_msgSend(v5, "decreaseLengthAllowance:", objc_msgSend(v20, "lengthIncrease"));
          objc_msgSend(v5, "incrementRecursiveDepth");
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "rightHandSide");
          v23 = objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __55___HKCFGNonTerminal__tryNodesWithContext_solutionTest___block_invoke;
          v30[3] = &unk_1E37EBE08;
          v37 = v28;
          v31 = v29;
          v24 = v22;
          v32 = v24;
          v33 = v20;
          v34 = v8;
          v36 = &v42;
          v35 = v6;
          -[_HKCFGNonTerminal _tryNodesForExpressions:nodes:context:solutionTest:](self, "_tryNodesForExpressions:nodes:context:solutionTest:", v23, v24, v5, v30);

          objc_msgSend(v5, "increaseLengthAllowance:", objc_msgSend(v20, "lengthIncrease"));
          objc_msgSend(v5, "decrementRecursiveDepth");
          LOBYTE(v23) = *((_BYTE *)v43 + 24) == 0;

          if ((v23 & 1) == 0)
            break;
        }
        if (v17 == ++v19)
        {
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          if (v17)
            goto LABEL_13;
          break;
        }
      }
    }

    objc_msgSend(v5, "cache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cacheNodes:forPosition:nonTerminal:lengthAllowance:", v8, v28, self, objc_msgSend(v5, "lengthAllowance"));

    _Block_object_dispose(&v42, 8);
  }

  objc_msgSend(v29, "setScanLocation:", v28);
}

- (BOOL)_tryNodesForExpressions:(id)a3 nodes:(id)a4 context:(id)a5 solutionTest:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t (**v13)(_QWORD);
  unint64_t v14;
  void *v15;
  char v16;
  _QWORD v18[4];
  id v19;
  _HKCFGNonTerminal *v20;
  id v21;
  id v22;
  uint64_t (**v23)(_QWORD);
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (uint64_t (**)(_QWORD))a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v14 = objc_msgSend(v11, "count");
  if (v14 >= objc_msgSend(v10, "count"))
  {
    v16 = v13[2](v13);
    *((_BYTE *)v26 + 24) = v16;
  }
  else
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72___HKCFGNonTerminal__tryNodesForExpressions_nodes_context_solutionTest___block_invoke;
    v18[3] = &unk_1E37EBE30;
    v24 = &v25;
    v19 = v11;
    v20 = self;
    v21 = v10;
    v22 = v12;
    v23 = v13;
    objc_msgSend(v15, "_tryNodesWithContext:solutionTest:", v22, v18);

    v16 = *((_BYTE *)v26 + 24) != 0;
  }
  _Block_object_dispose(&v25, 8);

  return v16;
}

+ (id)nonTerminalWithLabel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabel:", v4);

  return v5;
}

- (_HKCFGNonTerminal)initWithLabel:(id)a3
{
  id v4;
  _HKCFGNonTerminal *v5;
  uint64_t v6;
  NSString *label;
  NSMutableArray *v8;
  NSMutableArray *replacementRules;
  uint64_t v10;
  NSCharacterSet *charactersToBeSkipped;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKCFGNonTerminal;
  v5 = -[_HKCFGNonTerminal init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    replacementRules = v5->_replacementRules;
    v5->_replacementRules = v8;

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v10 = objc_claimAutoreleasedReturnValue();
    charactersToBeSkipped = v5->_charactersToBeSkipped;
    v5->_charactersToBeSkipped = (NSCharacterSet *)v10;

  }
  return v5;
}

- (void)addReplacementRuleWithExpressions:(id)a3 nodeEvaluator:(id)a4
{
  NSMutableArray *replacementRules;
  id v5;

  replacementRules = self->_replacementRules;
  +[_HKCFGReplacementRule ruleWithLHS:RHS:nodeEvaluator:](_HKCFGReplacementRule, "ruleWithLHS:RHS:nodeEvaluator:", self, a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](replacementRules, "addObject:", v5);

}

- (id)_label
{
  return self->_label;
}

- (unint64_t)_minimumLength
{
  return 1;
}

- (id)_replacementRules
{
  return self->_replacementRules;
}

- (void)_checkForCycles
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_HKCFGNonTerminal _checkForCycles:](self, "_checkForCycles:", v3);

}

- (void)_checkForCycles:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "containsObject:", self))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Grammar contains cycle involving non-terminal %@"), self->_label);
  objc_msgSend(v4, "addObject:", self);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_replacementRules;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "rightHandSide");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count") == 1)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_checkForCycles:", v4);

          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)_invalidate
{
  -[NSMutableArray removeAllObjects](self->_replacementRules, "removeAllObjects");
}

- (NSCharacterSet)charactersToBeSkipped
{
  return self->_charactersToBeSkipped;
}

- (void)setCharactersToBeSkipped:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_charactersToBeSkipped, 0);
  objc_storeStrong((id *)&self->_replacementRules, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
