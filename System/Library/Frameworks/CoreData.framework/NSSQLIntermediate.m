@implementation NSSQLIntermediate

- (BOOL)isIndexScoped
{
  NSSQLIntermediate *scope;

  scope = self->_scope;
  if (scope)
    LOBYTE(scope) = -[NSSQLIntermediate isIndexScoped](scope, "isIndexScoped");
  return (char)scope;
}

- (id)governingEntityForKeypathExpression:(id)a3
{
  return -[NSSQLIntermediate governingEntityForKeypathExpression:](self->_scope, "governingEntityForKeypathExpression:", a3);
}

- (id)governingAliasForKeypathExpression:(id)a3
{
  return -[NSSQLIntermediate governingAliasForKeypathExpression:](self->_scope, "governingAliasForKeypathExpression:", a3);
}

- (BOOL)isTargetColumnsScoped
{
  NSSQLIntermediate *scope;

  scope = self->_scope;
  if (scope)
    LOBYTE(scope) = -[NSSQLIntermediate isTargetColumnsScoped](scope, "isTargetColumnsScoped");
  return (char)scope;
}

- (NSSQLEntity)disambiguatingEntity
{
  return -[NSSQLIntermediate disambiguatingEntity](self->_scope, "disambiguatingEntity");
}

- (BOOL)isOrScoped
{
  NSSQLIntermediate *scope;

  scope = self->_scope;
  if (scope)
    LOBYTE(scope) = -[NSSQLIntermediate isOrScoped](scope, "isOrScoped");
  return (char)scope;
}

- (NSArray)disambiguationKeypath
{
  return -[NSSQLIntermediate disambiguationKeypath](self->_scope, "disambiguationKeypath");
}

- (BOOL)isUpdateScoped
{
  NSSQLIntermediate *scope;

  scope = self->_scope;
  if (scope)
    LOBYTE(scope) = -[NSSQLIntermediate isUpdateScoped](scope, "isUpdateScoped");
  return (char)scope;
}

- (id)fetchIntermediateForKeypathExpression:(id)a3
{
  return -[NSSQLIntermediate fetchIntermediateForKeypathExpression:](self->_scope, "fetchIntermediateForKeypathExpression:", a3);
}

- (BOOL)isFunctionScoped
{
  NSSQLIntermediate *scope;

  scope = self->_scope;
  if (scope)
    LOBYTE(scope) = -[NSSQLIntermediate isFunctionScoped](scope, "isFunctionScoped");
  return (char)scope;
}

- (id)_lastScopedItem
{
  id result;

  result = self->_scope;
  if (result)
    return (id)objc_msgSend(result, "_lastScopedItem");
  return result;
}

+ (BOOL)isSimpleKeypath:(id)a3
{
  if (objc_msgSend(a3, "expressionType") == 3)
    return 1;
  else
    return objc_msgSend(a1, "expressionIsBasicKeypath:", a3);
}

- (id)_generateSQLForExpression:(uint64_t)a3 allowToMany:(void *)a4 inContext:
{
  id v4;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSSQLTernaryExpressionIntermediate *v17;
  uint64_t v18;
  NSSQLFunctionExpressionIntermediate *v19;

  v4 = a1;
  if (a1)
  {
    if (!objc_msgSend(a4, "objectForKey:", CFSTR("NSUnderlyingException")))
    {
      v9 = objc_msgSend(a2, "expressionType");
      switch(v9)
      {
        case 0:
          return (id)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)v4, objc_msgSend(a2, "constantValue"), (uint64_t)a4);
        case 1:
          v11 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("_pk"));
          v10 = v4;
          v12 = 0;
          return (id)objc_msgSend(v10, "_generateSQLForKeyPathExpression:allowToMany:inContext:", v11, v12, a4);
        case 2:
          return (id)objc_msgSend(v4, "_generateSQLForVariableExpression:allowToMany:inContext:", a2, a3, a4);
        case 3:
        case 10:
          goto LABEL_7;
        case 4:
          if ((objc_msgSend((id)objc_opt_class(), "expressionIsBasicKeypath:", a2) & 1) != 0
            || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)v4, a2))
          {
LABEL_7:
            v10 = v4;
            v11 = (uint64_t)a2;
            v12 = a3;
            return (id)objc_msgSend(v10, "_generateSQLForKeyPathExpression:allowToMany:inContext:", v11, v12, a4);
          }
          else
          {
            if (!-[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:]((_BOOL8)v4, a2))
            {
              v19 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLFunctionExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", a2, 0, v4);
              v4 = -[NSSQLFunctionExpressionIntermediate generateSQLStringInContext:](v19, "generateSQLStringInContext:", a4);
              if (!v4 && !objc_msgSend(a4, "objectForKey:", CFSTR("NSUnderlyingExceptionKey")))
                objc_msgSend(a4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported function expression %@"), a2), 0), CFSTR("NSUnderlyingException"));

              return v4;
            }
            v13 = objc_msgSend(a2, "operand");
            v14 = objc_msgSend((id)objc_msgSend(a2, "arguments"), "objectAtIndex:", 0);
            v15 = (uint64_t)v4;
            v16 = (void *)v13;
            return (id)-[NSSQLIntermediate _generateSQLForSubqueryExpression:trailingKeypath:inContext:](v15, v16, v14, a4);
          }
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 11:
        case 12:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
          goto LABEL_10;
        case 13:
          v15 = (uint64_t)v4;
          v16 = a2;
          v14 = 0;
          return (id)-[NSSQLIntermediate _generateSQLForSubqueryExpression:trailingKeypath:inContext:](v15, v16, v14, a4);
        case 14:
          return -[NSSQLIntermediate _generateSQLForExpressionCollection:allowToMany:inContext:](v4, (void *)objc_msgSend(a2, "constantValue"), a3, a4);
        case 20:
          v17 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLTernaryExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", a2, a3, v4);
          v18 = -[NSSQLTernaryExpressionIntermediate generateSQLStringInContext:](v17, "generateSQLStringInContext:", a4);

          return (id)v18;
        default:
          if (v9 == 50)
            return (id)-[NSSQLIntermediate _generateSQLForFetchExpression:allowToMany:inContext:](v4, a2, 0, a4);
LABEL_10:
          objc_msgSend(a4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported expression type (%u, %@)"), objc_msgSend(a2, "expressionType"), a2), 0), CFSTR("NSUnderlyingException"));
          break;
      }
    }
    return 0;
  }
  return v4;
}

- (uint64_t)_generateSQLForConstantValue:(uint64_t)a3 inContext:
{
  NSSQLConstantValueIntermediate *v4;
  uint64_t v5;

  if (result)
  {
    v4 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]([NSSQLConstantValueIntermediate alloc], "initWithConstantValue:inScope:context:", a2, result, a3);
    v5 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v4, "generateSQLStringInContext:", a3);

    return v5;
  }
  return result;
}

- (id)_generateSQLForKeyPathExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5
{
  _BOOL8 v6;
  NSSQLKeypathExpressionIntermediate *v9;
  id v10;
  void *v12;

  v6 = a4;
  if (objc_msgSend((id)objc_msgSend(a3, "operand"), "expressionType"))
  {
    v9 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLKeypathExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", a3, v6, self);
    v10 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v9, "generateSQLStringInContext:", a5);

    return v10;
  }
  else
  {
    v12 = (void *)objc_msgSend(a3, "constantValue");
    if ((objc_msgSend(v12, "isNSArray") & 1) != 0
      || (objc_msgSend(v12, "isNSSet") & 1) != 0
      || objc_msgSend(v12, "isNSOrderedSet"))
    {
      return (id)-[NSSQLIntermediate _generateSQLForConstantCollection:reboundFrom:inContext:]((uint64_t)self, v12, 0, a5);
    }
    else
    {
      return (id)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)self, (uint64_t)v12, (uint64_t)a5);
    }
  }
}

- (void)_promoteJoinsForSubqueryScopedKeypaths
{
  -[NSSQLIntermediate _promoteJoinsForSubqueryScopedKeypaths](self->_scope, "_promoteJoinsForSubqueryScopedKeypaths");
}

- (uint64_t)_generateSQLForConstantCollection:(uint64_t)a3 reboundFrom:(void *)a4 inContext:
{
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  unsigned int v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSSQLBindIntarray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t i;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("nestingLevel")), "intValue");
  if ((objc_msgSend(a2, "isNSArray") & 1) != 0 || (objc_msgSend(a2, "isNSSet") & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(a2, "isNSOrderedSet");
  if (v8 <= 0 && v9 && (unint64_t)objc_msgSend(a2, "count") >= 0x65)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (!v10)
    {
LABEL_34:
      v26 = (id)objc_msgSend(a4, "objectForKey:", CFSTR("bindIntarrays"));
      if (!v26)
      {
        v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(a4, "setObject:forKey:", v26, CFSTR("bindIntarrays"));

      }
      v27 = -[NSSQLBindIntarray initWithValue:]([NSSQLBindIntarray alloc], "initWithValue:", a2);
      -[NSSQLBindIntarray setTableName:](v27, "setTableName:", -[NSSQLAliasGenerator generateTempTableName](objc_msgSend(a4, "objectForKey:", CFSTR("aliasGenerator"))));
      v28 = objc_msgSend(v26, "count");
      objc_msgSend(v26, "addObject:", v27);
      -[NSSQLBindIntarray setIndex:](v27, "setIndex:", v28);

      if (a3)
      {
        v29 = objc_msgSend(v26, "count");
        v30 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("entity")), "entityDescription");
        v31 = (id)objc_msgSend(a4, "objectForKey:", CFSTR("bindIntarraysSubstitutionOrder"));
        if (!v31)
        {
          v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(a4, "setObject:forKey:", v31, CFSTR("bindIntarraysSubstitutionOrder"));

        }
        objc_msgSend(v31, "addObject:", a3);
        objc_msgSend(v31, "addObject:", v30);
        objc_msgSend(v31, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29));
      }
      return objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("(SELECT * FROM %@) "), -[NSSQLBindIntarray tableName](v27, "tableName"));
    }
    v11 = v10;
    v12 = *(_QWORD *)v51;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v12)
        objc_enumerationMutation(a2);
      v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v13);
      if (!objc_msgSend(v14, "isNSNumber"))
        break;
      v15 = (char *)objc_msgSend(v14, "objCType");
      if (v15)
      {
        v16 = *v15 - 66;
        v17 = v16 > 0x31;
        v18 = (1 << v16) & 0x2848200028483;
        if (v17 || v18 == 0)
          break;
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v11)
          goto LABEL_11;
        goto LABEL_34;
      }
    }
    +[_PFRoutines anyObjectFromCollection:]((uint64_t)_PFRoutines, a2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      a2 = (id)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, a2);
    v20 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("entity")), "entityDescription");
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v21 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (!v21)
      goto LABEL_34;
    v22 = v21;
    v23 = *(_QWORD *)v47;
LABEL_27:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v23)
        objc_enumerationMutation(a2);
      v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v24);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || !objc_msgSend((id)objc_msgSend(v25, "entity"), "isKindOfEntity:", v20))
      {
        break;
      }
      if (v22 == ++v24)
      {
        v22 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v22)
          goto LABEL_27;
        goto LABEL_34;
      }
    }
  }
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" ("));
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("generatePairs")), "BOOLValue"))
    objc_msgSend(v32, "appendString:", CFSTR("VALUES "));
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v33 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v43;
    v36 = 1;
    while (2)
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v43 != v35)
          objc_enumerationMutation(a2);
        v38 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        if ((v36 & 1) == 0)
          objc_msgSend(v32, "appendString:", CFSTR(","));
        v39 = -[NSSQLIntermediate _generateSQLForConstantValue:inContext:](a1, v38, (uint64_t)a4);
        if (!v39)
        {

          return 0;
        }
        v40 = (void *)v39;
        objc_msgSend(v32, "appendString:", v39);

        v36 = 0;
      }
      v34 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      v36 = 0;
      if (v34)
        continue;
      break;
    }
  }
  objc_msgSend(v32, "appendString:", CFSTR(") "));
  return (uint64_t)v32;
}

- (id)_generateSQLForVariableExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5
{
  NSSQLIntermediate *scope;
  NSSQLVariableExpressionIntermediate *v10;
  id v11;

  scope = self->_scope;
  if (scope)
    return -[NSSQLIntermediate _generateSQLForVariableExpression:allowToMany:inContext:](scope, "_generateSQLForVariableExpression:allowToMany:inContext:", a3, a4, a5);
  v10 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLVariableExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", a3, a4, self);
  v11 = -[NSSQLVariableExpressionIntermediate generateSQLStringInContext:](v10, "generateSQLStringInContext:", a5);

  if (!v11)
  {
    if (!objc_msgSend(a5, "objectForKey:", CFSTR("NSUnderlyingException")))
      objc_msgSend(a5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Undefined variable expression %@"), a3), 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  return v11;
}

- (uint64_t)isVariableBasedKeypathScopedBySubquery:(uint64_t)result
{
  void *v3;

  if (result)
  {
    v3 = (void *)result;
    if (objc_msgSend(a2, "expressionType") == 4 && objc_msgSend((id)objc_msgSend(a2, "operand"), "expressionType") == 2)
    {
      result = objc_msgSend(v3, "governingEntityForKeypathExpression:", a2);
      if (result)
        return sel_valueForKey_ == (char *)objc_msgSend(a2, "selector")
            || sel_valueForKeyPath_ == (char *)objc_msgSend(a2, "selector");
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)promoteJoinsInKeypathsForExpression:(uint64_t)result
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (void *)result;
    while (1)
    {
      result = objc_msgSend(a2, "expressionType");
      if (result != 20)
        break;
      -[NSSQLIntermediate promoteJoinsInKeypathsForExpression:](v3, objc_msgSend(a2, "trueExpression"));
      a2 = (void *)objc_msgSend(a2, "falseExpression");
    }
    if (result > 9)
    {
      if (result == 14)
      {
        v12 = 0u;
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v4 = (void *)objc_msgSend(a2, "constantValue", 0);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (result)
        {
          v5 = result;
          v6 = *(_QWORD *)v13;
          do
          {
            v7 = 0;
            do
            {
              if (*(_QWORD *)v13 != v6)
                objc_enumerationMutation(v4);
              -[NSSQLIntermediate promoteJoinsInKeypathsForExpression:](v3, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7++));
            }
            while (v5 != v7);
            result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
            v5 = result;
          }
          while (result);
        }
      }
      else if (result == 10)
      {
        return -[NSSQLFetchIntermediate promoteToOuterJoinsAlongKeypathWithComponents:](objc_msgSend(v3, "fetchIntermediate"), (void *)objc_msgSend((id)objc_msgSend(a2, "predicateFormat"), "componentsSeparatedByString:", CFSTR(".")));
      }
    }
    else
    {
      if (result == 3)
        return -[NSSQLFetchIntermediate promoteToOuterJoinsAlongKeypathWithComponents:](objc_msgSend(v3, "fetchIntermediate"), (void *)objc_msgSend((id)objc_msgSend(a2, "predicateFormat"), "componentsSeparatedByString:", CFSTR(".")));
      if (result == 4)
      {
        result = objc_msgSend(a2, "selector");
        if (sel_max_ != (char *)result && sel_min_ != (char *)result && sel_count_ != (char *)result)
        {
          if (objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", a2))
            return -[NSSQLFetchIntermediate promoteToOuterJoinsAlongKeypathWithComponents:](objc_msgSend(v3, "fetchIntermediate"), (void *)objc_msgSend((id)objc_msgSend(a2, "predicateFormat"), "componentsSeparatedByString:", CFSTR(".")));
          if (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)v3, a2))
          {
            return objc_msgSend(v3, "_promoteJoinsForSubqueryScopedKeypath:", a2);
          }
          else
          {
            v14 = 0u;
            v15 = 0u;
            v12 = 0u;
            v13 = 0u;
            v8 = (void *)objc_msgSend(a2, "arguments", 0);
            result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
            if (result)
            {
              v9 = result;
              v10 = *(_QWORD *)v13;
              do
              {
                v11 = 0;
                do
                {
                  if (*(_QWORD *)v13 != v10)
                    objc_enumerationMutation(v8);
                  -[NSSQLIntermediate promoteJoinsInKeypathsForExpression:](v3, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
                }
                while (v9 != v11);
                result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
                v9 = result;
              }
              while (result);
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)fetchIntermediate
{
  return -[NSSQLIntermediate fetchIntermediate](self->_scope, "fetchIntermediate");
}

- (NSSQLIntermediate)initWithScope:(id)a3
{
  NSSQLIntermediate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLIntermediate;
  result = -[NSSQLIntermediate init](&v5, sel_init);
  if (result)
    result->_scope = (NSSQLIntermediate *)a3;
  return result;
}

- (id)governingAlias
{
  return -[NSSQLIntermediate governingAlias](self->_scope, "governingAlias");
}

- (uint64_t)_generateSQLForSubqueryExpression:(uint64_t)a3 trailingKeypath:(void *)a4 inContext:
{
  NSSQLSubqueryExpressionIntermediate *v8;
  uint64_t v9;

  if (a1)
  {
    if (objc_msgSend((id)objc_msgSend(a2, "collection"), "expressionType") - 3 <= 1)
    {
      v8 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", a2, a3, a1);
      v9 = -[NSSQLSubqueryExpressionIntermediate generateSQLStringInContext:](v8, "generateSQLStringInContext:", a4);

      return v9;
    }
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unsupported subquery collection expression type"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a2, CFSTR("subquery"))), CFSTR("NSUnderlyingException"));
  }
  return 0;
}

- (BOOL)isUpdateColumnsScoped
{
  NSSQLIntermediate *scope;

  scope = self->_scope;
  if (scope)
    LOBYTE(scope) = -[NSSQLIntermediate isUpdateColumnsScoped](scope, "isUpdateColumnsScoped");
  return (char)scope;
}

+ (BOOL)expressionIsBasicKeypath:(id)a3
{
  if (objc_msgSend(a3, "expressionType") != 4
    || objc_msgSend((id)objc_msgSend(a3, "operand"), "expressionType") != 1
    && objc_msgSend((id)objc_msgSend(a3, "operand"), "expressionType"))
  {
    return 0;
  }
  if (sel_valueForKey_ == (char *)objc_msgSend(a3, "selector"))
    return 1;
  return sel_valueForKeyPath_ == (char *)objc_msgSend(a3, "selector");
}

- (BOOL)_functionExpressionIsSubqueryFollowedByKeypath:(_BOOL8)result
{
  if (result)
    return objc_msgSend(a2, "expressionType") == 4
        && objc_msgSend((id)objc_msgSend(a2, "operand"), "expressionType") == 13
        && (sel_valueForKey_ == (char *)objc_msgSend(a2, "selector")
         || sel_valueForKeyPath_ == (char *)objc_msgSend(a2, "selector"))
        && objc_msgSend((id)objc_msgSend(a2, "arguments"), "count") == 1;
  return result;
}

- (id)generateSQLStringInContext:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (BOOL)isHavingScoped
{
  NSSQLIntermediate *scope;

  scope = self->_scope;
  if (scope)
    LOBYTE(scope) = -[NSSQLIntermediate isHavingScoped](scope, "isHavingScoped");
  return (char)scope;
}

- (BOOL)isWhereScoped
{
  NSSQLIntermediate *scope;

  scope = self->_scope;
  if (scope)
    LOBYTE(scope) = -[NSSQLIntermediate isWhereScoped](scope, "isWhereScoped");
  return (char)scope;
}

- (BOOL)isIndexExpressionScoped
{
  NSSQLIntermediate *scope;

  scope = self->_scope;
  if (scope)
    LOBYTE(scope) = -[NSSQLIntermediate isIndexExpressionScoped](scope, "isIndexExpressionScoped");
  return (char)scope;
}

- (BOOL)disambiguationKeypathHasToMany
{
  return -[NSSQLIntermediate disambiguationKeypathHasToMany](self->_scope, "disambiguationKeypathHasToMany");
}

- (void)setDisambiguatingEntity:(id)a3 withKeypath:(id)a4 hasToMany:(BOOL)a5
{
  -[NSSQLIntermediate setDisambiguatingEntity:withKeypath:hasToMany:](self->_scope, "setDisambiguatingEntity:withKeypath:hasToMany:", a3, a4, a5);
}

- (uint64_t)isSimpleNoIndexFunction:(uint64_t)a1
{
  void *v4;
  void *v5;

  if (a1
    && objc_msgSend(a2, "expressionType") == 4
    && sel_noindex_ == (char *)objc_msgSend(a2, "selector")
    && (v4 = (void *)objc_msgSend(a2, "arguments")) != 0
    && (v5 = v4, objc_msgSend(v4, "count") == 1))
  {
    return objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", objc_msgSend(v5, "lastObject"));
  }
  else
  {
    return 0;
  }
}

- (id)governingEntity
{
  return -[NSSQLIntermediate governingEntity](self->_scope, "governingEntity");
}

- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3
{
  return -[NSSQLIntermediate keypathExpressionIsSafeLHSForIn:](self->_scope, "keypathExpressionIsSafeLHSForIn:", a3);
}

- (void)_promoteJoinsForSubqueryScopedKeypath:(id)a3
{
  NSSQLIntermediate *scope;

  scope = self->_scope;
  if (scope)
    -[NSSQLIntermediate _promoteJoinsForSubqueryScopedKeypath:](scope, "_promoteJoinsForSubqueryScopedKeypath:", a3);
}

- (void)_generateSQLForExpressionCollection:(uint64_t)a3 allowToMany:(void *)a4 inContext:
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (objc_msgSend(a1, "isIndexExpressionScoped"))
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unsupported: collections not allowed in index expressions."), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a2, CFSTR("Bad value"))), CFSTR("NSUnderlyingException"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" ("));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    v12 = 1;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(a2);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        if ((v12 & 1) == 0)
          objc_msgSend(v8, "appendString:", CFSTR(","));
        v15 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, v14, a3, a4);
        if (!v15)
        {

          objc_msgSend(a4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported element in aggregate expression %@"), v14), 0), CFSTR("NSUnderlyingException"));
          return 0;
        }
        v16 = (void *)v15;
        objc_msgSend(v8, "appendString:", v15);

        v12 = 0;
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v12 = 0;
      if (v10)
        continue;
      break;
    }
  }
  objc_msgSend(v8, "appendString:", CFSTR(") "));
  return v8;
}

- (uint64_t)_generateSQLForFetchExpression:(uint64_t)a3 allowToMany:(void *)a4 inContext:
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSSQLGenerator *v30;
  int v31;
  int v32;
  NSSQLiteStatement *v33;
  void *v34;
  uint64_t v35;

  if (!a1 || objc_msgSend(a4, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  if (objc_msgSend(a1, "isIndexScoped"))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a2, CFSTR("expression"));
    v10 = CFSTR("Fetch request expressions not allowed in indexes");
    v11 = v7;
    v12 = v8;
LABEL_5:
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v10, v9), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v15 = (void *)objc_msgSend(a2, "requestExpression");
  v16 = (void *)objc_msgSend(v15, "expressionValueWithObject:context:", 0, 0);
  v17 = objc_msgSend(a4, "objectForKey:", CFSTR("persistentStore"));
  v18 = (void *)objc_msgSend(a2, "requestExpression");
  v19 = (void *)objc_msgSend(a2, "contextExpression");
  if (!objc_msgSend(v18, "expressionType"))
  {
    v20 = (void *)objc_msgSend((id)objc_msgSend(v18, "constantValue"), "affectedStores");
    v21 = v20;
    if ((!v20 || !objc_msgSend(v20, "count")) && !objc_msgSend(v19, "expressionType"))
      v21 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "constantValue"), "persistentStoreCoordinator"), "persistentStores");
    if (objc_msgSend(v21, "count") == 1 && (objc_msgSend(v21, "containsObject:", v17) & 1) != 0)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v23 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("nestingLevel"));
      v24 = objc_msgSend(a4, "objectForKey:", CFSTR("persistentStore"));
      v25 = (objc_msgSend(a2, "isCountOnlyRequest") & 1) != 0 || objc_msgSend(v16, "resultType") == 4;
      v30 = -[NSSQLGenerator initWithPersistentStore:]([NSSQLGenerator alloc], "initWithPersistentStore:", v24);
      objc_msgSend(v16, "_resolveEntityWithContext:", objc_msgSend((id)objc_msgSend(a2, "contextExpression"), "expressionValueWithObject:context:", 0, 0));
      v31 = objc_msgSend(v23, "unsignedIntValue");
      v32 = objc_msgSend(a1, "isWhereScoped");
      if (v30)
        v33 = -[NSSQLGenerator newSQLStatementForRequest:ignoreInheritance:countOnly:nestingLevel:nestIsWhereScoped:requestContext:]((uint64_t)v30, v16, 0, v25, (v31 + 1), v32, 0);
      else
        v33 = 0;

      if (v33)
      {
        v13 = (void *)objc_msgSend(CFSTR("("), "mutableCopy");
        objc_msgSend(v13, "appendString:", -[NSSQLiteStatement sqlString](v33, "sqlString"));
        objc_msgSend(v13, "appendString:", CFSTR(")"));
        objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("bindVars")), "addObjectsFromArray:", -[NSSQLiteStatement bindVariables](v33, "bindVariables"));

      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v22, "drain");
      return (uint64_t)v13;
    }
  }
  v26 = (void *)objc_msgSend(a2, "expressionValueWithObject:context:", 0, objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
  v27 = v26;
  if (!v26 || objc_msgSend(v26, "isNSNumber"))
  {
    v28 = (uint64_t)a1;
    v29 = (uint64_t)v27;
    return -[NSSQLIntermediate _generateSQLForConstantValue:inContext:](v28, v29, (uint64_t)a4);
  }
  if (objc_msgSend(a1, "isUpdateScoped"))
  {
    if (objc_msgSend(v27, "count"))
    {
      if (objc_msgSend(v27, "count") != 1)
      {
        v34 = (void *)MEMORY[0x1E0C99DA0];
        v35 = *MEMORY[0x1E0C99778];
        v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v15, CFSTR("expression"));
        v10 = CFSTR("Unsupported fetch request expression in update - too many results");
        v11 = v34;
        v12 = v35;
        goto LABEL_5;
      }
      v29 = objc_msgSend(v27, "objectAtIndex:", 0);
      v28 = (uint64_t)a1;
    }
    else
    {
      v28 = (uint64_t)a1;
      v29 = 0;
    }
    return -[NSSQLIntermediate _generateSQLForConstantValue:inContext:](v28, v29, (uint64_t)a4);
  }
  return -[NSSQLIntermediate _generateSQLForConstantCollection:reboundFrom:inContext:]((uint64_t)a1, v27, 0, a4);
}

@end
