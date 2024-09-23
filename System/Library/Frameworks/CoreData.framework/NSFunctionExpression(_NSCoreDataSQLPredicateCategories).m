@implementation NSFunctionExpression(_NSCoreDataSQLPredicateCategories)

- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories
{
  id v4;
  char *v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;

  v4 = a1;
  v5 = (char *)objc_msgSend(a1, "selector");
  if (v5 != sel_valueForKey_ && v5 != sel_valueForKeyPath_)
    return v4;
  v7 = (void *)objc_msgSend((id)objc_msgSend(v4, "operand"), "minimalFormInContext:", a3);
  v8 = objc_msgSend(v7, "expressionType");
  if (v8 == 1)
  {
    if (!objc_msgSend((id)objc_msgSend(v4, "arguments"), "count"))
      return v4;
    goto LABEL_30;
  }
  if (v8 == 3
    || v8 == 4
    && (sel_valueForKey_ == (char *)objc_msgSend(v7, "selector")
     || sel_valueForKeyPath_ == (char *)objc_msgSend(v7, "selector")))
  {
    v9 = (void *)objc_msgSend((id)objc_msgSend(v7, "arguments"), "objectAtIndex:", 0);
    v10 = (void *)objc_msgSend((id)objc_msgSend(v4, "arguments"), "objectAtIndex:", 0);
    v11 = objc_msgSend(v9, "expressionType");
    v12 = v11;
    if (v11 == 10
      || !v11
      && (objc_msgSend((id)objc_msgSend(v7, "operand"), "constantValue"),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = objc_msgSend(v10, "expressionType");
      if (v13 == 10
        || !v13 && (objc_msgSend(v10, "constantValue"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (v12 == 10)
          v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "arguments"), "objectAtIndex:", 0), "keyPath");
        else
          v14 = objc_msgSend(v9, "constantValue");
        v15 = v14;
        if (objc_msgSend(v10, "expressionType") == 10)
          v16 = objc_msgSend(v10, "keyPath");
        else
          v16 = objc_msgSend(v10, "constantValue");
        v17 = (void *)objc_msgSend((id)objc_opt_class(), "_newKeyPathExpressionForString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v15, v16));
        v18 = objc_msgSend(MEMORY[0x1E0CB3918], "defaultInstance");
        if (v18 == objc_msgSend(v7, "operand"))
        {
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36E8]), "initWithOperand:andKeyPath:", objc_msgSend(v7, "operand"), v17);
        }
        else
        {
          v19 = objc_alloc((Class)objc_opt_class());
          v20 = objc_msgSend(v7, "expressionType");
          v21 = objc_msgSend(v7, "operand");
          v22 = (void *)objc_msgSend(v19, "initWithExpressionType:operand:selector:argumentArray:", v20, v21, sel_valueForKeyPath_, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v17));
        }
        v4 = v22;

LABEL_30:
        v23 = objc_msgSend(v4, "_mapKVCOperatorsToFunctionsInContext:", a3);
        if (v23)
          return (id)v23;
      }
    }
  }
  return v4;
}

- (uint64_t)_mapKVCOperatorsToFunctionsInContext:()_NSCoreDataSQLPredicateCategories
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  __CFString *v9;
  CFIndex location;
  CFIndex v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  id v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;

  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "arguments"), "objectAtIndex:", 0);
  v6 = objc_msgSend(v5, "expressionType");
  if (v6)
  {
    v7 = 0;
    if (v6 != 10)
      return v7;
    v8 = (const __CFString *)objc_msgSend(v5, "keyPath");
  }
  else
  {
    v8 = (const __CFString *)objc_msgSend(v5, "constantValue");
  }
  v9 = (__CFString *)v8;
  location = CFStringFind(v8, CFSTR("@"), 0).location;
  if (location == -1)
    return 0;
  v11 = location;
  if (CFStringFind(v9, CFSTR("@"), 4uLL).location != location)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Too many KVC aggregates in keypath: %@"), v9);
LABEL_15:
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v18, 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  if (CFStringGetLength(v9) <= v11 + 1)
  {
LABEL_14:
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed keypath: %@"), v9);
    goto LABEL_15;
  }
  if (CFStringGetCharacterAtIndex(v9, v11 + 1) != 99)
  {
    v20 = (void *)-[__CFString componentsSeparatedByString:](v9, "componentsSeparatedByString:", CFSTR("."));
    v21 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v22 = objc_msgSend(v20, "count");
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      do
      {
        v27 = (void *)objc_msgSend(v20, "objectAtIndex:", v24);
        if (objc_msgSend(v27, "characterAtIndex:", 0) == 64)
        {
          v26 = v27;
        }
        else
        {
          if ((v25 & 1) != 0)
            objc_msgSend(v21, "appendString:", CFSTR("."));
          objc_msgSend(v21, "appendString:", v27);
          v25 = 1;
        }
        ++v24;
      }
      while (v23 != v24);
    }
    else
    {
      v26 = 0;
    }
    if ((objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("supportedKVCAggregates")), "containsObject:", v26) & 1) != 0)
    {
      if (objc_msgSend((id)objc_msgSend(a1, "operand"), "expressionType") == 1 && objc_msgSend(v21, "length"))
      {
        v28 = objc_msgSend(v26, "substringFromIndex:", 1);
        if (objc_msgSend(CFSTR("avg"), "isEqual:", v28))
          v29 = CFSTR("average");
        else
          v29 = (__CFString *)v28;
        v30 = (void *)-[__CFString mutableCopy](v29, "mutableCopy");
        objc_msgSend(v30, "appendString:", CFSTR(":"));
        v31 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v21);
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v31, 0);
        v7 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForFunction:arguments:", v30, v32);

      }
      else
      {
        v7 = 0;
      }

      return v7;
    }
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported KVC aggregate in keypath: %@"), v9), 0), CFSTR("NSUnderlyingException"));

    return 0;
  }
  v12 = objc_msgSend((id)objc_msgSend(a1, "operand"), "expressionType");
  if (v12 != 13)
  {
    if (v12 == 1)
    {
      if (v11)
      {
        v13 = -[__CFString substringWithRange:](v9, "substringWithRange:", 0, v11 - 1);
        v14 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v13);
        v15 = (objc_class *)MEMORY[0x1E0C99D20];
        goto LABEL_46;
      }
      goto LABEL_14;
    }
    return 0;
  }
  v33 = (id)objc_msgSend((id)-[__CFString componentsSeparatedByString:](v9, "componentsSeparatedByString:", CFSTR(".")), "mutableCopy");
  objc_msgSend(v33, "removeLastObject");
  if (objc_msgSend(v33, "count")
    && objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 0), "isEqualToString:", &stru_1E1EE23F0))
  {
    objc_msgSend(v33, "removeObjectAtIndex:", 0);
  }
  if (!objc_msgSend(v33, "count"))
  {
    v40 = objc_alloc(MEMORY[0x1E0C99D20]);
    v39 = objc_msgSend(a1, "operand");
    v38 = v40;
    goto LABEL_48;
  }
  v34 = objc_msgSend(v33, "componentsJoinedByString:", CFSTR("."));
  v35 = (void *)MEMORY[0x1E0CB35D0];
  v36 = objc_msgSend(a1, "operand");
  if (objc_msgSend(v33, "count") == 1)
    v37 = CFSTR("valueForKey:");
  else
    v37 = CFSTR("valueForKeyPath:");
  v14 = objc_msgSend(v35, "expressionForFunction:selectorName:arguments:", v36, v37, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v34)));
  v15 = (objc_class *)MEMORY[0x1E0C99D20];
LABEL_46:
  v38 = [v15 alloc];
  v39 = v14;
LABEL_48:
  v41 = (void *)objc_msgSend(v38, "initWithObject:", v39);
  v42 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForFunction:arguments:", CFSTR("count:"), v41);

  return v42;
}

- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  uint64_t v5;
  void *v6;
  unint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  int v35;
  uint64_t v36;
  objc_class *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id *v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  const __CFString *v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v44 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = objc_msgSend(a1, "expressionType");
  v43 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v57 = 0;
  if (v5 == 3)
  {
    v6 = (void *)objc_msgSend(a1, "keyPath");
    v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("@"));
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = objc_msgSend(v6, "rangeOfString:options:", CFSTR("."), 4);
      if (v17 != 0x7FFFFFFFFFFFFFFFLL && v7 < v17)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v61 = CFSTR("expression");
        v62[0] = a1;
        v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
        v8 = 0;
        v57 = (id)objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134097, v19);
        goto LABEL_21;
      }
    }
    objc_msgSend(v44, "addObject:", objc_msgSend(a1, "keyPath"));
    goto LABEL_4;
  }
  v9 = (void *)objc_msgSend((id)objc_msgSend(a1, "operand"), "_keypathsForDerivedPropertyValidation:", &v57);
  if (!v9)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_21;
  }
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v11 = (void *)objc_msgSend(a1, "arguments");
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v54;
LABEL_8:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v54 != v13)
        objc_enumerationMutation(v11);
      v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v14), "_keypathsForDerivedPropertyValidation:", &v57);
      if (!v15)
        goto LABEL_17;
      objc_msgSend(v10, "addObjectsFromArray:", objc_msgSend(v15, "allObjects"));
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        if (v12)
          goto LABEL_8;
        break;
      }
    }
  }
  v16 = (char *)objc_msgSend(a1, "selector");
  if (sel_valueForKey_ == v16 || sel_valueForKeyPath_ == v16)
  {
    if (objc_msgSend(v9, "count"))
    {
      if (objc_msgSend(v10, "count"))
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        if (v25)
        {
          v38 = v9;
          v39 = v25;
          v40 = *(_QWORD *)v50;
          v41 = a3;
LABEL_31:
          v26 = 0;
          v27 = v38;
          v28 = v39;
          while (1)
          {
            if (*(_QWORD *)v50 != v40)
              objc_enumerationMutation(v27);
            v29 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v26);
            v30 = MEMORY[0x18D76B4E4]();
            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v31 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
            v42 = (void *)v30;
            if (v31)
            {
              v32 = *(_QWORD *)v46;
              while (2)
              {
                for (i = 0; i != v31; ++i)
                {
                  if (*(_QWORD *)v46 != v32)
                    objc_enumerationMutation(v10);
                  v34 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                  if ((objc_msgSend(v34, "hasPrefix:", CFSTR("$")) & 1) != 0)
                  {
                    v35 = 0;
                    goto LABEL_44;
                  }
                  objc_msgSend(v44, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v29, v34));
                }
                v31 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
                if (v31)
                  continue;
                break;
              }
              v35 = 1;
LABEL_44:
              v27 = v38;
              v28 = v39;
            }
            else
            {
              v35 = 1;
            }
            a3 = v41;
            objc_autoreleasePoolPop(v42);
            if (!v35)
              goto LABEL_17;
            if (++v26 == v28)
            {
              v8 = 1;
              v39 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
              if (v39)
                goto LABEL_31;
              goto LABEL_21;
            }
          }
        }
        goto LABEL_4;
      }
      v36 = objc_msgSend(v9, "allObjects");
    }
    else
    {
      v36 = objc_msgSend(v10, "allObjects");
    }
    objc_msgSend(v44, "addObjectsFromArray:", v36);
    goto LABEL_4;
  }
  if (objc_msgSend((id)objc_msgSend(a1, "operand"), "expressionType"))
    goto LABEL_17;
  v37 = (objc_class *)objc_msgSend((id)objc_msgSend(a1, "operand"), "constantValue");
  if (NSClassFromString((NSString *)CFSTR("_NSPredicateUtilities")) == v37)
  {
    objc_msgSend(a1, "selector");
    if (!object_getMethodImplementation())
      goto LABEL_17;
    objc_msgSend(v44, "addObjectsFromArray:", objc_msgSend(v10, "allObjects"));
  }
  else if (sel_canonical_ != (char *)objc_msgSend(a1, "selector"))
  {
    goto LABEL_17;
  }
LABEL_4:
  v8 = 1;
LABEL_21:
  v20 = v57;
  if (a3 && v57)
    *a3 = v57;
  objc_msgSend(v43, "drain");
  v21 = 0;
  v22 = v57;
  v23 = v44;
  if (v8)
    return v44;
  else
    return 0;
}

@end
