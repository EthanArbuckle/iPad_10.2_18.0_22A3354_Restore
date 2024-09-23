@implementation CNPredicateValidator

- (BOOL)validateWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CNPredicateValidator setValidated:](self, "setValidated:", 1);
  -[CNPredicateValidator predicate](self, "predicate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CNPredicateValidator allowedKeys](self, "allowedKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CNPredicateValidator predicate](self, "predicate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "acceptVisitor:flags:", self, 3);

      if (a3)
      {
        -[CNPredicateValidator error](self, "error");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[CNPredicateValidator error](self, "error");
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  return -[CNPredicateValidator validated](self, "validated");
}

- (void)setAllowedKeys:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  int v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {

LABEL_11:
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __39__CNPredicateValidator_setAllowedKeys___block_invoke;
          v14[3] = &unk_1E29FD900;
          v15 = v4;
          objc_msgSend(v10, "_cn_executeGetterForRepresentedKeys:", v14);

          goto LABEL_12;
        }
        v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EE191798);

        if (v11)
          goto LABEL_11;
LABEL_12:
        ++v9;
      }
      while (v7 != v9);
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v7 = v12;
    }
    while (v12);
  }

  -[CNPredicateValidator setAllowedKeysSet:](self, "setAllowedKeysSet:", v4);
}

uint64_t __39__CNPredicateValidator_setAllowedKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 0;
}

- (NSArray)allowedKeys
{
  void *v2;
  void *v3;

  -[CNPredicateValidator allowedKeysSet](self, "allowedKeysSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)visitPredicateExpression:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSMutableSet *usedKeysSet;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[CNPredicateValidator validated](self, "validated"))
    goto LABEL_34;
  if (visitPredicateExpression__cn_once_token_0 != -1)
    dispatch_once(&visitPredicateExpression__cn_once_token_0, &__block_literal_global_138);
  v5 = (id)visitPredicateExpression__cn_once_object_0;
  v6 = objc_msgSend(v4, "expressionType");
  v29 = v4;
  if (v6 != 10)
  {
    if (v6 == 4)
    {
      v22 = (void *)MEMORY[0x1E0CB35D0];
      objc_msgSend(v4, "function");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arguments");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "expressionForFunction:arguments:", v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        -[CNPredicateValidator setValidated:](self, "setValidated:", 0);
        +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPredicateValidator setError:](self, "setError:", v26);

        v25 = 0;
      }

      goto LABEL_33;
    }
    if (v6 != 3)
      goto LABEL_33;
  }
  objc_msgSend(v4, "keyPath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPredicateValidator setError:](self, "setError:", v27);

    -[CNPredicateValidator setValidated:](self, "setValidated:", 0);
    goto LABEL_32;
  }
  objc_msgSend(v4, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (!v10)
    goto LABEL_25;
  v11 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v31 != v11)
        objc_enumerationMutation(v9);
      v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      if (objc_msgSend(v13, "hasPrefix:", CFSTR("@"), v28))
      {
        if ((unint64_t)objc_msgSend(v13, "length") < 2)
          goto LABEL_22;
        objc_msgSend(v13, "substringFromIndex:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "containsObject:", v14) & 1) == 0)
          -[CNPredicateValidator setValidated:](self, "setValidated:", 0);

      }
      else
      {
        -[CNPredicateValidator allowedKeysSet](self, "allowedKeysSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v13);

        if ((v16 & 1) == 0)
        {
LABEL_22:
          -[CNPredicateValidator setValidated:](self, "setValidated:", 0);
          continue;
        }
        usedKeysSet = self->_usedKeysSet;
        if (!usedKeysSet)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNPredicateValidator setUsedKeysSet:](self, "setUsedKeysSet:", v18);

          usedKeysSet = self->_usedKeysSet;
        }
        -[NSMutableSet addObject:](usedKeysSet, "addObject:", v13);
      }
    }
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  }
  while (v10);
LABEL_25:

  if (!-[CNPredicateValidator validated](self, "validated"))
  {
    v34 = v28;
    v35 = CFSTR("CNKeyPaths");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPredicateValidator setError:](self, "setError:", v21);

  }
LABEL_32:

LABEL_33:
  v4 = v29;
LABEL_34:

}

void __49__CNPredicateValidator_visitPredicateExpression___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0CB2880], *MEMORY[0x1E0CB28E0], *MEMORY[0x1E0CB2970], *MEMORY[0x1E0CB2978], *MEMORY[0x1E0CB2980], *MEMORY[0x1E0CB2DD0], *MEMORY[0x1E0CB2F68], *MEMORY[0x1E0CB3248], *MEMORY[0x1E0CB33E0], *MEMORY[0x1E0CB33E8], *MEMORY[0x1E0CB33F0], 0);
  v2 = (void *)visitPredicateExpression__cn_once_object_0;
  visitPredicateExpression__cn_once_object_0 = v1;

}

- (NSArray)usedKeys
{
  void *v2;
  void *v3;

  -[NSMutableSet allObjects](self->_usedKeysSet, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)resetUsedKeys
{
  -[CNPredicateValidator setUsedKeysSet:](self, "setUsedKeysSet:", 0);
}

- (void)visitPredicateOperator:(id)a3
{
  if (objc_msgSend(a3, "operatorType") == 11)
    -[CNPredicateValidator setValidated:](self, "setValidated:", 0);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (NSSet)allowedKeysSet
{
  return self->_allowedKeysSet;
}

- (void)setAllowedKeysSet:(id)a3
{
  objc_storeStrong((id *)&self->_allowedKeysSet, a3);
}

- (NSMutableSet)usedKeysSet
{
  return self->_usedKeysSet;
}

- (void)setUsedKeysSet:(id)a3
{
  objc_storeStrong((id *)&self->_usedKeysSet, a3);
}

- (BOOL)validated
{
  return self->_validated;
}

- (void)setValidated:(BOOL)a3
{
  self->_validated = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_usedKeysSet, 0);
  objc_storeStrong((id *)&self->_allowedKeysSet, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
