@implementation _HKFactorization

- (BOOL)isEqual:(id)a3
{
  _HKFactorization *v4;
  char v5;

  v4 = (_HKFactorization *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSMapTable isEqual:](self->_factors, "isEqual:", v4->_factors);
    else
      v5 = 0;
  }

  return v5;
}

- (void)enumerateFactorsWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMapTable keyEnumerator](self->_factors, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      -[NSMapTable objectForKey:](self->_factors, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v10, objc_msgSend(v11, "integerValue"), &v16);

      if (v16)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (int64_t)_exponentForFactor:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMapTable objectForKey:](self->_factors, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)unitString
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __30___HKFactorization_unitString__block_invoke;
  v14 = &unk_1E37F0720;
  v17 = &v23;
  v5 = v3;
  v15 = v5;
  v18 = &v19;
  v6 = v4;
  v16 = v6;
  -[_HKFactorization enumerateFactorsWithHandler:](self, "enumerateFactorsWithHandler:", &v11);
  v7 = v20[3];
  if (v24[3])
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v5, v6, v11, v12, v13, v14, v15);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (__CFString *)v5;
    }
  }
  else
  {
    if (!v7)
    {
      v9 = CFSTR("()");
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("1/%@"), v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
LABEL_8:

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v9;
}

+ (id)factorizationFromString:(id)a3 factorGrammar:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[5];
  _QWORD v31[3];
  void *v32;
  _QWORD v33[3];
  void *v34;
  _QWORD v35[5];

  v35[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_FactorizationGrammarWithFactorGrammar_lock);
  v7 = (void *)_FactorizationGrammarWithFactorGrammar_cache;
  if (!_FactorizationGrammarWithFactorGrammar_cache)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)_FactorizationGrammarWithFactorGrammar_cache;
    _FactorizationGrammarWithFactorGrammar_cache = v8;

    v7 = (void *)_FactorizationGrammarWithFactorGrammar_cache;
  }
  objc_msgSend(v7, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v27 = v6;
    +[_HKCFGNonTerminal nonTerminalWithLabel:](_HKCFGNonTerminal, "nonTerminalWithLabel:", CFSTR("Q"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_HKCFGNonTerminal nonTerminalWithLabel:](_HKCFGNonTerminal, "nonTerminalWithLabel:", CFSTR("P"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rootNonTerminal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[_HKCFGTerminal terminalMatchingCharacterInString:](_HKCFGTerminal, "terminalMatchingCharacterInString:", CFSTR("*.·"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[_HKCFGTerminal terminalMatchingAnyInteger](_HKCFGTerminal, "terminalMatchingAnyInteger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addReplacementRuleWithExpressions:nodeEvaluator:", &unk_1E389DD68, &__block_literal_global_69);
    v35[0] = CFSTR("(");
    v35[1] = v11;
    v35[2] = CFSTR(")");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addReplacementRuleWithExpressions:nodeEvaluator:", v15, &__block_literal_global_102);

    v34 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addReplacementRuleWithExpressions:nodeEvaluator:", v16, &__block_literal_global_103);

    v33[0] = v12;
    v33[1] = CFSTR("/");
    v33[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addReplacementRuleWithExpressions:nodeEvaluator:", v17, &__block_literal_global_106);

    objc_msgSend(v12, "addReplacementRuleWithExpressions:nodeEvaluator:", &unk_1E389DD80, &__block_literal_global_111);
    v32 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addReplacementRuleWithExpressions:nodeEvaluator:", v18, &__block_literal_global_112);

    v31[0] = v13;
    v31[1] = CFSTR("^");
    v31[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addReplacementRuleWithExpressions:nodeEvaluator:", v19, &__block_literal_global_115);

    v30[0] = CFSTR("(");
    v30[1] = v12;
    v30[2] = CFSTR(")");
    v30[3] = CFSTR("^");
    v30[4] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addReplacementRuleWithExpressions:nodeEvaluator:", v20, &__block_literal_global_116);

    v29[0] = CFSTR("(");
    v29[1] = v12;
    v29[2] = CFSTR(")");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addReplacementRuleWithExpressions:nodeEvaluator:", v21, &__block_literal_global_117);

    v28[0] = v12;
    v28[1] = v26;
    v28[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addReplacementRuleWithExpressions:nodeEvaluator:", v22, &__block_literal_global_118);

    +[_HKContextFreeGrammar grammarWithRootNonTerminal:emptyStringEvaluator:](_HKContextFreeGrammar, "grammarWithRootNonTerminal:emptyStringEvaluator:", v11, &__block_literal_global_121);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)_FactorizationGrammarWithFactorGrammar_cache, "setObject:forKey:", v10, v27);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_FactorizationGrammarWithFactorGrammar_lock);

  objc_msgSend(v10, "parseTreeForString:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unable to parse factorization string %@"), v5);
  objc_msgSend(v23, "evaluate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (_HKFactorization)factorizationWithFactor:(id)a3 exponent:(int64_t)a4
{
  return (_HKFactorization *)objc_msgSend(a1, "factorizationWithFactorsAndExponents:", a3, a4, 0);
}

+ (_HKFactorization)factorizationWithFactorsAndExponents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  uint64_t *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a1, "factorization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = &v13;
  v6 = v4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    do
    {
      objc_msgSend(v5, "_multiplyByFactor:exponent:", v8, *v12);
      v9 = (id *)(v12 + 1);
      v12 += 2;
      v10 = *v9;

      v8 = v10;
    }
    while (v10);
  }

  return (_HKFactorization *)v5;
}

+ (id)factorization
{
  return objc_alloc_init((Class)a1);
}

- (_HKFactorization)init
{
  _HKFactorization *v2;
  uint64_t v3;
  NSMapTable *factors;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKFactorization;
  v2 = -[_HKFactorization init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    factors = v2->_factors;
    v2->_factors = (NSMapTable *)v3;

  }
  return v2;
}

- (void)_multiplyByFactor:(id)a3 exponent:(int64_t)a4
{
  int64_t v6;
  NSMapTable *factors;
  void *v8;
  id v9;

  v9 = a3;
  v6 = -[_HKFactorization _exponentForFactor:](self, "_exponentForFactor:");
  factors = self->_factors;
  if (v6 + a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6 + a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](factors, "setObject:forKey:", v8, v9);

  }
  else
  {
    -[NSMapTable removeObjectForKey:](factors, "removeObjectForKey:", v9);
  }

}

- (unint64_t)factorCount
{
  return -[NSMapTable count](self->_factors, "count");
}

- (id)anyFactor
{
  void *v2;
  void *v3;

  -[NSMapTable keyEnumerator](self->_factors, "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)exponentForFactor:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMapTable objectForKey:](self->_factors, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factors, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33___HKFactorization_copyWithZone___block_invoke;
  v7[3] = &unk_1E37F06D0;
  v5 = v4;
  v8 = v5;
  -[_HKFactorization enumerateFactorsWithHandler:](self, "enumerateFactorsWithHandler:", v7);

  return v5;
}

- (id)factorizationByDividing:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "reciprocal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFactorization factorizationByMultiplying:](self, "factorizationByMultiplying:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)reciprocal
{
  return -[_HKFactorization factorizationByRaisingToExponent:](self, "factorizationByRaisingToExponent:", -1);
}

- (id)factorizationByRaisingToExponent:(int64_t)a3
{
  void *v4;

  v4 = (void *)-[_HKFactorization copy](self, "copy");
  objc_msgSend(v4, "_raiseToExponent:", a3);
  return v4;
}

- (void)_raiseToExponent:(int64_t)a3
{
  NSMapTable *factors;
  void *v6;
  NSMapTable *v7;
  NSMapTable *v8;
  NSMapTable *v9;
  _QWORD v10[4];
  NSMapTable *v11;
  int64_t v12;

  factors = self->_factors;
  if (a3)
  {
    v6 = (void *)-[NSMapTable copy](factors, "copy");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37___HKFactorization__raiseToExponent___block_invoke;
    v10[3] = &unk_1E37F0770;
    v7 = v6;
    v11 = v7;
    v12 = a3;
    -[_HKFactorization enumerateFactorsWithHandler:](self, "enumerateFactorsWithHandler:", v10);
    v8 = self->_factors;
    self->_factors = v7;
    v9 = v7;

  }
  else
  {
    -[NSMapTable removeAllObjects](factors, "removeAllObjects");
  }
}

- (id)factorizationByMultiplying:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[_HKFactorization copy](self, "copy");
  objc_msgSend(v5, "_multiplyByFactorization:", v4);

  return v5;
}

- (void)_multiplyByFactorization:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45___HKFactorization__multiplyByFactorization___block_invoke;
  v3[3] = &unk_1E37F06D0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateFactorsWithHandler:", v3);
}

- (unint64_t)hash
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24___HKFactorization_hash__block_invoke;
  v4[3] = &unk_1E37F06F8;
  v4[4] = &v5;
  -[_HKFactorization _enumerateFactorsWithHandler:](self, "_enumerateFactorsWithHandler:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_enumerateFactorsWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, void *, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMapTable keyEnumerator](self->_factors, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      -[NSMapTable objectForKey:](self->_factors, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v10, v11, &v16);

      if (v16)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __36___HKFactorization_encodeWithCoder___block_invoke;
  v13 = &unk_1E37F0748;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  -[_HKFactorization _enumerateFactorsWithHandler:](self, "_enumerateFactorsWithHandler:", &v10);
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("HKFactorizationFactorsKey"), v10, v11, v12, v13);
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("HKFactorizationExponentsKey"));

}

- (_HKFactorization)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _HKFactorization *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v23;
  id v24;
  void *v25;

  v4 = a3;
  objc_msgSend(v4, "allowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("HKFactorizationFactorsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("HKFactorizationExponentsKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "count");
  if (v12 != objc_msgSend(v11, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("_HKFactorization unequal number of factors and exponents"));
  v13 = -[_HKFactorization init](self, "init");
  if (v13)
  {
    v25 = v7;
    objc_msgSend(v7, "objectEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectEnumerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nextObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      v23 = v6;
      v24 = v4;
      v18 = 0;
      v19 = *MEMORY[0x1E0CB2C78];
      do
      {
        v20 = v18;
        objc_msgSend(v15, "nextObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v19, CFSTR("_HKFactorization exponent is not of class NSNumber: %@"), v18);
        -[_HKFactorization _multiplyByFactor:exponent:](v13, "_multiplyByFactor:exponent:", v17, objc_msgSend(v18, "integerValue"));
        objc_msgSend(v14, "nextObject");
        v21 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v21;
      }
      while (v21);

      v6 = v23;
      v4 = v24;
    }

    v7 = v25;
  }

  return v13;
}

@end
