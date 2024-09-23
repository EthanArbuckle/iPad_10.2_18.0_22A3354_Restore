@implementation _DKPredicateValidator

+ (BOOL)validatePredicate:(id)a3 allowedKeys:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v8 = a4;
    v9 = a3;
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredicate:allowedKeys:", v9, v8);

    if (v10)
    {
      LOBYTE(a5) = objc_msgSend(v10, "validateWithError:", a5);
    }
    else if (a5)
    {
      v13 = *MEMORY[0x1E0CB2D50];
      v14[0] = CFSTR("Predicate was invalid because it was nil.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMQueryErrorDomain"), 2, v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }

  }
  else
  {
    LOBYTE(a5) = 1;
  }
  return (char)a5;
}

- (_DKPredicateValidator)initWithPredicate:(id)a3 allowedKeys:(id)a4
{
  id v6;
  id v7;
  _DKPredicateValidator *v8;
  uint64_t v9;
  NSPredicate *predicate;
  uint64_t v11;
  NSSet *allowedKeys;
  _DKPredicateValidator *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)_DKPredicateValidator;
    v8 = -[_DKPredicateValidator init](&v15, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v6, "copy");
      predicate = v8->_predicate;
      v8->_predicate = (NSPredicate *)v9;

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
        v11 = objc_claimAutoreleasedReturnValue();
        allowedKeys = v8->_allowedKeys;
        v8->_allowedKeys = (NSSet *)v11;

      }
    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)validateWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[_DKPredicateValidator setValidated:](self, "setValidated:", 1);
  -[_DKPredicateValidator predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_DKPredicateValidator predicate](self, "predicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acceptVisitor:flags:", self, 3);

    if (a3)
    {
      -[_DKPredicateValidator error](self, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[_DKPredicateValidator error](self, "error");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return -[_DKPredicateValidator validated](self, "validated");
}

- (void)visitPredicateExpression:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  id v41;
  void *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_DKPredicateValidator validated](self, "validated"))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E60]);
    v42 = (void *)objc_msgSend(v5, "initWithObjects:", *MEMORY[0x1E0CB2880], *MEMORY[0x1E0CB28E0], *MEMORY[0x1E0CB2970], *MEMORY[0x1E0CB2978], *MEMORY[0x1E0CB2980], *MEMORY[0x1E0CB2DD0], *MEMORY[0x1E0CB2F68], *MEMORY[0x1E0CB3248], *MEMORY[0x1E0CB33E0], *MEMORY[0x1E0CB33E8], *MEMORY[0x1E0CB33F0], 0);
    v6 = objc_msgSend(v4, "expressionType");
    v41 = v4;
    if (v6 == 10)
    {
LABEL_5:
      objc_msgSend(v4, "keyPath");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v55 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath class: %@"), objc_opt_class());
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
        obj = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMQueryErrorDomain"), 2, obj);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKPredicateValidator setError:](self, "setError:", v28);

        -[_DKPredicateValidator setValidated:](self, "setValidated:", 0);
        goto LABEL_38;
      }
      objc_msgSend(v4, "keyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      obj = v8;
      v9 = 0;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      if (!v10)
        goto LABEL_24;
      v11 = *(_QWORD *)v45;
      while (1)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v45 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasPrefix:", CFSTR("@")))
          {
            if ((unint64_t)objc_msgSend(v13, "length") < 2)
              goto LABEL_21;
            objc_msgSend(v13, "substringFromIndex:", 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v42, "containsObject:", v14) & 1) == 0)
              -[_DKPredicateValidator setValidated:](self, "setValidated:", 0);

          }
          else
          {
            -[_DKPredicateValidator allowedKeys](self, "allowedKeys");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              -[_DKPredicateValidator allowedKeys](self, "allowedKeys");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "containsObject:", v13);

              if ((v17 & 1) == 0)
              {
LABEL_21:
                -[_DKPredicateValidator setValidated:](self, "setValidated:", 0);
                continue;
              }
            }
            if (!v9)
              v9 = (void *)objc_opt_new();
            objc_msgSend(v9, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (!v10)
        {
LABEL_24:

          if (!-[_DKPredicateValidator validated](self, "validated"))
          {
            v52 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Used keys: %@"), v9);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v18;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMQueryErrorDomain"), 2, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKPredicateValidator setError:](self, "setError:", v20);

          }
          goto LABEL_38;
        }
      }
    }
    if (v6 != 4)
    {
      if (v6 == 3)
        goto LABEL_5;
      goto LABEL_39;
    }
    objc_msgSend(v4, "function");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("valueForKey:"), CFSTR("valueForKeyPath:"), CFSTR("value"), 0);
    if ((objc_msgSend(obj, "containsObject:", v40) & 1) != 0)
      goto LABEL_38;
    if (!objc_msgSend(v40, "isEqual:", CFSTR("castObject:toType:")))
    {
      v29 = (void *)MEMORY[0x1E0CB35D0];
      objc_msgSend(v4, "function");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arguments");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "expressionForFunction:arguments:", v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        -[_DKPredicateValidator setValidated:](self, "setValidated:", 0);
        v48 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid function: %@"), v40);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BMQueryErrorDomain"), 2, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKPredicateValidator setError:](self, "setError:", v35);

        v32 = 0;
      }

LABEL_38:
LABEL_39:

      v4 = v41;
      goto LABEL_40;
    }
    objc_msgSend(v4, "arguments");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count") == 2)
    {
      objc_msgSend(v4, "arguments");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v23, "expressionType"))
      {
        objc_msgSend(v4, "arguments");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectAtIndexedSubscript:", 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "constantValue");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqual:", CFSTR("NSDate"));

        if ((v39 & 1) != 0)
          goto LABEL_38;
LABEL_33:
        -[_DKPredicateValidator setValidated:](self, "setValidated:", 0);
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v50 = *MEMORY[0x1E0CB2D50];
        v51 = CFSTR("Unsupported cast");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("BMQueryErrorDomain"), 3, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKPredicateValidator setError:](self, "setError:", v26);

        goto LABEL_38;
      }

    }
    goto LABEL_33;
  }
LABEL_40:

}

+ (BOOL)validateSortDescriptors:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("alloc"), CFSTR("new"), CFSTR("init"), CFSTR("mutableCopy"), CFSTR("release"), CFSTR("retain"), CFSTR("autorelease"), CFSTR("dealloc"), CFSTR("finalize"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              if ((objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j)) & 1) != 0)
              {

                v17 = 0;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v17 = 1;
    }
    while (v7);
  }
  else
  {
    v17 = 1;
  }
LABEL_19:

  return v17;
}

- (BOOL)validated
{
  return self->_validated;
}

- (void)setValidated:(BOOL)a3
{
  self->_validated = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (NSSet)allowedKeys
{
  return self->_allowedKeys;
}

- (void)setAllowedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_allowedKeys, a3);
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
  objc_storeStrong((id *)&self->_allowedKeys, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
