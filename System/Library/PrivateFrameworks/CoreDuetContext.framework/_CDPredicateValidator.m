@implementation _CDPredicateValidator

+ (BOOL)validatePredicate:(id)a3 allowedKeys:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
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
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C00], v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (_CDPredicateValidator)initWithPredicate:(id)a3 allowedKeys:(id)a4
{
  id v6;
  id v7;
  _CDPredicateValidator *v8;
  uint64_t v9;
  NSPredicate *predicate;
  uint64_t v11;
  NSSet *allowedKeys;
  _CDPredicateValidator *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)_CDPredicateValidator;
    v8 = -[_CDPredicateValidator init](&v15, sel_init);
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
  NSObject *v8;

  -[_CDPredicateValidator setValidated:](self, "setValidated:", 1);
  -[_CDPredicateValidator predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_CDPredicateValidator predicate](self, "predicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acceptVisitor:flags:", self, 3);

    if (a3)
    {
      -[_CDPredicateValidator error](self, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[_CDPredicateValidator error](self, "error");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  if (!-[_CDPredicateValidator validated](self, "validated"))
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_CDPredicateValidator validateWithError:].cold.1(self, v8);

  }
  return -[_CDPredicateValidator validated](self, "validated");
}

- (void)_cd_validateKeypath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _CDPredicateValidator *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[_CDPredicateValidator setValidated:](self, "setValidated:", 0);
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0D15BF0];
      v30 = *MEMORY[0x1E0D15C00];
      v41 = *MEMORY[0x1E0CB2D50];
      v42[0] = CFSTR("Invalid keypath type");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, v30);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDPredicateValidator setError:](self, "setError:", v6);
      goto LABEL_29;
    }
  }
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v33 = (void *)objc_msgSend(v5, "initWithObjects:", *MEMORY[0x1E0CB2880], *MEMORY[0x1E0CB28E0], *MEMORY[0x1E0CB2970], *MEMORY[0x1E0CB2978], *MEMORY[0x1E0CB2980], *MEMORY[0x1E0CB2DD0], *MEMORY[0x1E0CB2F68], *MEMORY[0x1E0CB3248], *MEMORY[0x1E0CB33E0], *MEMORY[0x1E0CB33E8], *MEMORY[0x1E0CB33F0], 0);
  v31 = v4;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (!v7)
  {
    v9 = 0;
    goto LABEL_25;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v35;
  v11 = CFSTR("@");
  do
  {
    v12 = 0;
    v32 = v8;
    do
    {
      if (*(_QWORD *)v35 != v10)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
      if (objc_msgSend(v13, "hasPrefix:", v11))
      {
        if ((unint64_t)objc_msgSend(v13, "length") < 2)
          goto LABEL_20;
        objc_msgSend(v13, "substringFromIndex:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v33, "containsObject:", v14) & 1) == 0)
          -[_CDPredicateValidator setValidated:](self, "setValidated:", 0);

      }
      else
      {
        if (objc_msgSend(v13, "isEqual:", CFSTR("class")))
          goto LABEL_20;
        -[_CDPredicateValidator allowedKeys](self, "allowedKeys");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[_CDPredicateValidator allowedKeys](self, "allowedKeys");
          v17 = v10;
          v18 = self;
          v19 = v11;
          v20 = v6;
          v21 = v9;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "containsObject:", v13);

          v9 = v21;
          v6 = v20;
          v11 = v19;
          self = v18;
          v10 = v17;
          v8 = v32;

          if ((v23 & 1) == 0)
          {
LABEL_20:
            -[_CDPredicateValidator setValidated:](self, "setValidated:", 0);
            goto LABEL_21;
          }
        }
        if (!v9)
          v9 = (void *)objc_opt_new();
        objc_msgSend(v9, "addObject:", v13);
      }
LABEL_21:
      ++v12;
    }
    while (v8 != v12);
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  }
  while (v8);
LABEL_25:
  if (!-[_CDPredicateValidator validated](self, "validated"))
  {
    v38 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Used keys: %@"), v9);
    v24 = v9;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C00], v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDPredicateValidator setError:](self, "setError:", v27);

    v9 = v24;
  }

  v4 = v31;
LABEL_29:

}

- (void)visitPredicateExpression:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[_CDPredicateValidator validated](self, "validated"))
    goto LABEL_34;
  v5 = objc_msgSend(v4, "expressionType");
  switch(v5)
  {
    case 10:
LABEL_5:
      objc_msgSend(v4, "keyPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDPredicateValidator _cd_validateKeypath:](self, "_cd_validateKeypath:", v6);

      break;
    case 4:
      objc_msgSend(v4, "function");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqual:", CFSTR("objectFrom:withIndex:")) & 1) != 0)
      {
LABEL_33:

        break;
      }
      if (objc_msgSend(v7, "isEqual:", CFSTR("castObject:toType:")))
      {
        objc_msgSend(v4, "arguments");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count") == 2)
        {
          objc_msgSend(v4, "arguments");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "expressionType"))
          {
            objc_msgSend(v4, "arguments");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "constantValue");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqual:", CFSTR("NSDate"));

            if ((v31 & 1) != 0)
              goto LABEL_33;
            goto LABEL_12;
          }

        }
LABEL_12:
        -[_CDPredicateValidator setValidated:](self, "setValidated:", 0);
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v39 = *MEMORY[0x1E0CB2D50];
        v40[0] = CFSTR("Unsupported cast");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C00], v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDPredicateValidator setError:](self, "setError:", v13);

LABEL_32:
        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("valueForKey:"), CFSTR("valueForKeyPath:"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "containsObject:", v7))
      {
        v16 = (void *)MEMORY[0x1E0CB35D0];
        objc_msgSend(v4, "function");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "arguments");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = v18;
        else
          v20 = MEMORY[0x1E0C9AA60];
        objc_msgSend(v16, "expressionForFunction:arguments:", v17, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          -[_CDPredicateValidator setValidated:](self, "setValidated:", 0);
          v22 = (void *)MEMORY[0x1E0CB35C8];
          v35 = *MEMORY[0x1E0CB2D50];
          v36 = CFSTR("Unsupported function");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C00], v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDPredicateValidator setError:](self, "setError:", v24);

          v21 = 0;
        }

        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "pathExpression");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "expressionType") || objc_msgSend(v14, "expressionType") == 10)
        {
          objc_msgSend(v14, "constantValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDPredicateValidator _cd_validateKeypath:](self, "_cd_validateKeypath:", v15);
LABEL_27:

          goto LABEL_32;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "arguments");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          if (v26 == 1)
          {
            objc_msgSend(v4, "arguments");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "firstObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "constantValue");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CDPredicateValidator _cd_validateKeypath:](self, "_cd_validateKeypath:", v27);

            goto LABEL_27;
          }
        }
      }
      -[_CDPredicateValidator setValidated:](self, "setValidated:", 0);
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB2D50];
      v38 = CFSTR("Unsupported format");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C00], v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDPredicateValidator setError:](self, "setError:", v34);

      goto LABEL_32;
    case 3:
      goto LABEL_5;
  }
LABEL_34:

}

- (void)visitPredicateOperator:(id)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString **v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "operatorType");
  if (v4 >= 0xB && v4 - 99 >= 2)
  {
    if (v4 == 11)
    {
      -[_CDPredicateValidator setValidated:](self, "setValidated:", 0);
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = *MEMORY[0x1E0D15BF0];
      v7 = *MEMORY[0x1E0D15C00];
      v15 = *MEMORY[0x1E0CB2D50];
      v16[0] = CFSTR("Unsupported operator type");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = (const __CFString **)v16;
      v10 = &v15;
    }
    else
    {
      -[_CDPredicateValidator setValidated:](self, "setValidated:", 0);
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = *MEMORY[0x1E0D15BF0];
      v7 = *MEMORY[0x1E0D15C00];
      v13 = *MEMORY[0x1E0CB2D50];
      v14 = CFSTR("Unhandled operator type");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v14;
      v10 = &v13;
    }
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDPredicateValidator setError:](self, "setError:", v12);

  }
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

- (void)validateWithError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_18DD73000, a2, OS_LOG_TYPE_ERROR, "Rejecting predicate: %@, error: %@", (uint8_t *)&v6, 0x16u);

}

@end
