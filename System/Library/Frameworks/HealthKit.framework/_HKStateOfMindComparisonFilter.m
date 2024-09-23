@implementation _HKStateOfMindComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return objc_msgSend(&unk_1E389DC78, "containsObject:", a3);
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("reflectiveInterval"))
    || objc_msgSend(v5, "isEqualToString:", CFSTR("valence")))
  {
    +[_HKStateOfMindComparisonFilter _allowedValueClassesForReflectiveInterval]();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("labels"))
         || objc_msgSend(v5, "isEqualToString:", CFSTR("domains")))
  {
    +[_HKStateOfMindComparisonFilter _allowedValueClassesForLabelsAndDomains]();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKStateOfMindComparisonFilter.m"), 81, CFSTR("Unreachable code has been executed"));

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  return v8;
}

+ (id)_allowedValueClassesForReflectiveInterval
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)_allowedValueClassesForLabelsAndDomains
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v7;
  BOOL v8;
  BOOL v9;
  void *v11;

  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("reflectiveInterval")))
  {
    objc_opt_self();
    v8 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("valence")))
    {
      objc_opt_self();
      v9 = a3 < 6;
      goto LABEL_13;
    }
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("labels"))
      && !objc_msgSend(v7, "isEqualToString:", CFSTR("domains")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKStateOfMindComparisonFilter.m"), 97, CFSTR("Unreachable code has been executed"));

      v9 = 0;
      goto LABEL_13;
    }
    objc_opt_self();
    v8 = a3 == 4 || a3 == 10;
  }
  v9 = v8;
LABEL_13:

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS____HKStateOfMindComparisonFilter;
  if (!objc_msgSendSuper2(&v20, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v13, v14, a5, a6, a7))goto LABEL_11;
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("reflectiveInterval")))
  {
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("valence")))
    {
      v15 = +[_HKStateOfMindComparisonFilter _isValidValence:]((uint64_t)a1, v13);
      goto LABEL_9;
    }
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("labels"))
      || objc_msgSend(v14, "isEqualToString:", CFSTR("domains")))
    {
      v16 = objc_opt_class();
      v15 = HKIsValueOrContainerValidForOperatorType(a5, v13, v16, (uint64_t)a7);
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKStateOfMindComparisonFilter.m"), 119, CFSTR("Unreachable code has been executed"));

LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  v15 = +[_HKStateOfMindComparisonFilter _isValidReflectiveInterval:]((uint64_t)a1, v13);
LABEL_9:
  v17 = v15;
LABEL_12:

  return v17;
}

+ (BOOL)_isValidReflectiveInterval:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  void *v7;

  v2 = a2;
  v3 = objc_opt_self();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__isValidReflectiveInterval_, v3, CFSTR("_HKStateOfMindComparisonFilter.m"), 173, CFSTR("Reflective interval can only be an NSNumber"));

  }
  +[HKStateOfMind validateKind:](HKStateOfMind, "validateKind:", HKStateOfMindKindFromReflectiveInterval(objc_msgSend(v2, "integerValue")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

+ (BOOL)_isValidValence:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  void *v7;

  v2 = a2;
  v3 = objc_opt_self();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__isValidValence_, v3, CFSTR("_HKStateOfMindComparisonFilter.m"), 220, CFSTR("Valence can only be an NSNumber"));

  }
  objc_msgSend(v2, "doubleValue");
  +[HKStateOfMind validateValence:](HKStateOfMind, "validateValence:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("reflectiveInterval")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("valence")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("labels")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("domains")) & 1) != 0)
  {
    v6 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKStateOfMindComparisonFilter.m"), 133, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKStateOfMindComparisonFilter;
    v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5;
  id v6;
  unsigned __int8 v7;
  char v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    switch(-[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue"))
    {
      case 0:
        v7 = -[_HKStateOfMindComparisonFilter _acceptsStateOfMindWithReflectiveInterval:](self, objc_msgSend(v6, "reflectiveInterval"));
        goto LABEL_7;
      case 1:
        objc_msgSend(v6, "valence");
        v7 = -[_HKStateOfMindComparisonFilter _acceptsStateOfMindWithValence:](self, v10);
LABEL_7:
        v8 = v7;
        break;
      case 2:
        objc_msgSend(v6, "labels");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 3:
        objc_msgSend(v6, "domains");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v12 = v11;
        v8 = -[_HKStateOfMindComparisonFilter _acceptsStateOfMindWithLabelsOrDomains:](self, v11);

        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKStateOfMindComparisonFilter.m"), 152, CFSTR("Unreachable code has been executed"));

        v8 = 0;
        break;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_acceptsStateOfMindWithReflectiveInterval:(void *)result
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;

  if (result)
  {
    v3 = result;
    objc_msgSend(result, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__acceptsStateOfMindWithReflectiveInterval_, v3, CFSTR("_HKStateOfMindComparisonFilter.m"), 189, CFSTR("Our comparison filter on reflective interval must only store an NSNumber value"));

    }
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = HKComparisonResultMatchesPredicateOperator(objc_msgSend(v7, "compare:", v6), objc_msgSend(v3, "operatorType"));

    return (void *)v8;
  }
  return result;
}

- (void)_acceptsStateOfMindWithValence:(void *)result
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;

  if (result)
  {
    v3 = result;
    objc_msgSend(result, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__acceptsStateOfMindWithValence_, v3, CFSTR("_HKStateOfMindComparisonFilter.m"), 233, CFSTR("Our comparison filter on valence must only store an NSNumber value"));

    }
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = HKComparisonResultMatchesPredicateOperator(objc_msgSend(v7, "compare:", v6), objc_msgSend(v3, "operatorType"));

    return (void *)v8;
  }
  return result;
}

- (uint64_t)_acceptsStateOfMindWithLabelsOrDomains:(void *)a1
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
    goto LABEL_20;
  objc_msgSend(a1, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(a1, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(a1, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = a1;
        v11 = 279;
        goto LABEL_19;
      }
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(a1, "value", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i)))
          {

            v7 = 1;
            goto LABEL_21;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v16)
          continue;
        break;
      }
    }

    goto LABEL_20;
  }
  v7 = objc_msgSend(v3, "containsObject:", v6);

  if (objc_msgSend(a1, "operatorType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = a1;
    v11 = 266;
LABEL_19:
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__acceptsStateOfMindWithLabelsOrDomains_, v10, CFSTR("_HKStateOfMindComparisonFilter.m"), v11, CFSTR("Unreachable code has been executed"));

LABEL_20:
    v7 = 0;
  }
LABEL_21:

  return v7;
}

@end
