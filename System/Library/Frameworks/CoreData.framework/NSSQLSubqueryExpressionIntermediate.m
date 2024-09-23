@implementation NSSQLSubqueryExpressionIntermediate

- (void)_promoteJoinsForSubqueryScopedKeypaths
{
  NSMutableArray *keypathsToPromote;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  keypathsToPromote = self->_keypathsToPromote;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keypathsToPromote, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(keypathsToPromote);
        -[NSSQLFetchIntermediate promoteToOuterJoinsAlongKeypathWithComponents:]((uint64_t)self->_fetchIntermediate, *(void **)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keypathsToPromote, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSSQLIntermediate _promoteJoinsForSubqueryScopedKeypaths](self->super.super._scope, "_promoteJoinsForSubqueryScopedKeypaths");
}

- (id)_generateSQLForVariableExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5
{
  _BOOL8 v6;
  void *v9;

  v6 = a4;
  if (!objc_msgSend(a3, "isEqual:", -[NSExpression variableExpression](self->super._expression, "variableExpression")))return -[NSSQLIntermediate _generateSQLForVariableExpression:allowToMany:inContext:](self->super.super._scope, "_generateSQLForVariableExpression:allowToMany:inContext:", a3, v6, a5);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" "));
  objc_msgSend(v9, "appendString:", self->_variableAlias);
  objc_msgSend(v9, "appendString:", CFSTR("."));
  objc_msgSend(v9, "appendString:", -[NSSQLColumn columnName](self->_variableColumn, "columnName"));
  return v9;
}

- (NSSQLSubqueryExpressionIntermediate)initWithExpression:(id)a3 trailingKeypath:(id)a4 inScope:(id)a5
{
  NSSQLSubqueryExpressionIntermediate *v7;
  int v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSSQLSubqueryExpressionIntermediate;
  v7 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:](&v11, sel_initWithExpression_allowToMany_inScope_, a3, 0, a5);
  if (v7)
  {
    v7->_trailingKeypath = (NSExpression *)a4;
    if (a4)
    {
      if (objc_msgSend((id)objc_msgSend(a4, "constantValue"), "rangeOfString:", CFSTR("@")) != 0x7FFFFFFFFFFFFFFFLL)
        v7->_hasTrailingFunction = 1;
      v8 = objc_msgSend((id)objc_msgSend(a4, "constantValue"), "hasSuffix:", CFSTR("@count"));
      v7->_isCount = v8;
      if (v8)
      {
        v7->_onlyTrailIsCount = objc_msgSend((id)objc_msgSend(a4, "constantValue"), "isEqualToString:", CFSTR(".@count"));
        v9 = objc_msgSend(MEMORY[0x1E0CB3980], "defaultInstance");
        v7->_subqueryHasTruePredicate = v9 == objc_msgSend(a3, "predicate");
      }
    }
    v7->_variableExpression = (NSExpression *)objc_msgSend(a3, "variableExpression");
    v7->_useDistinct = 0;
  }
  return v7;
}

- (id)generateSQLStringInContext:(id)a3
{
  id v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  NSExpression *trailingKeypath;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;
  void *v20;
  uint64_t v21;
  NSSQLEntity *v22;
  _BOOL4 v23;
  NSSQLIntermediate *scope;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  int v34;
  NSSQLEntity *v35;
  void *v36;
  NSSQLEntity *selectFromEntity;
  NSSQLPrimaryKey *primaryKey;
  uint64_t v39;
  NSSQLEntity *v40;
  void *v41;
  void *v42;
  NSSQLPrimaryKey *v43;
  __CFString *v44;
  NSExpression *v45;
  NSArray *v46;
  _BOOL4 v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  NSSQLEntity *v61;
  uint64_t v62;
  NSSQLColumn *v63;
  NSSQLColumn *v64;
  int v65;
  NSSQLSubqueryExpressionIntermediate *v66;
  NSSQLPrimaryKey *v67;
  NSSQLEntity *v68;
  NSSQLEntity *v69;
  void *v70;
  NSSQLPrimaryKey *v71;
  NSMutableString *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  NSMutableString *v77;
  NSString *v78;
  NSMutableString *selectFromCorrelationTarget;
  _QWORD *v80;
  uint64_t v81;
  NSSQLColumn *v82;
  char v83;
  uint64_t v84;
  id v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  NSString *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  objc_class *selectEntityAlias;
  int *v95;
  NSPredicate *v96;
  NSPredicate *v97;
  NSSQLSimpleWhereIntermediate *v98;
  NSExpression *v99;
  NSArray *v100;
  uint64_t v101;
  void *v102;
  NSSQLColumn *variableColumn;
  void *v104;
  void *v105;
  const __CFString *v106;
  const __CFString *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  NSMutableString *v111;
  NSSQLSelectIntermediate *v112;
  NSString *v113;
  uint64_t v114;
  _BYTE *v115;
  id v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  NSString *v127;
  NSSQLColumn *v128;
  __CFString *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  NSString *v136;
  uint64_t v137;
  NSString *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  _BOOL4 v142;
  void *v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  char v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _BYTE v153[128];
  uint64_t v154;

  v3 = a3;
  v154 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  if (!-[NSSQLIntermediate isIndexScoped](self, "isIndexScoped"))
  {
    trailingKeypath = self->_trailingKeypath;
    if (trailingKeypath)
    {
      v12 = (void *)-[NSExpression predicateFormat](trailingKeypath, "predicateFormat");
      v13 = objc_msgSend(v12, "rangeOfString:", CFSTR(".@"));
      if (v13 != objc_msgSend(v12, "rangeOfString:options:", CFSTR(".@"), 4))
      {
        v14 = (void *)MEMORY[0x1E0C99DA0];
        v15 = *MEMORY[0x1E0C99778];
        v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported subquery (too many functions): %@"), self->super._expression);
LABEL_7:
        v8 = (const __CFString *)v16;
        v9 = v14;
        v10 = v15;
        v7 = 0;
        goto LABEL_8;
      }
    }
    else
    {
      v12 = 0;
    }
    if ((-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped")
       || -[NSSQLIntermediate isUpdateScoped](self, "isUpdateScoped"))
      && !self->_trailingKeypath
      && (objc_msgSend(v12, "hasSuffix:", CFSTR(".@count")) & 1) == 0
      && (objc_msgSend(v12, "hasSuffix:", CFSTR(".@min")) & 1) == 0
      && (objc_msgSend(v12, "hasSuffix:", CFSTR(".@max")) & 1) == 0
      && (objc_msgSend(v12, "hasSuffix:", CFSTR(".@sum")) & 1) == 0
      && (objc_msgSend(v12, "hasSuffix:", CFSTR(".@avg")) & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported subquery (non-aggregate not allowed in select or update column): %@"), self->super._expression);
      goto LABEL_7;
    }
    self->_fetchIntermediate = -[NSSQLFetchIntermediate initWithScope:]([NSSQLFetchIntermediate alloc], "initWithScope:", self);
    v19 = -[NSExpression collection](self->super._expression, "collection");
    if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v19) & 1) == 0
      && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v19))
    {
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported subquery collection type (%@)"), v19), 0), CFSTR("NSUnderlyingException"));
      goto LABEL_139;
    }
    v20 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "arguments"), "objectAtIndex:", 0), "constantValue"), "componentsSeparatedByString:", CFSTR("."));
    if ((unint64_t)objc_msgSend(v20, "count") < 2)
      v21 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
    else
      v21 = objc_msgSend(v20, "subarrayWithRange:", 1, objc_msgSend(v20, "count") - 1);
    v147 = (void *)v21;
    v22 = -[NSSQLIntermediate governingEntityForKeypathExpression:](self->super.super._scope, "governingEntityForKeypathExpression:", v19);
    self->_selectFromEntity = v22;
    v23 = -[NSSQLIntermediate isUpdateColumnsScoped](self, "isUpdateColumnsScoped");
    scope = self->super.super._scope;
    if (v23)
    {
      v25 = -[NSSQLIntermediate governingAlias](scope, "governingAlias");
      if (v25)
        goto LABEL_30;
      v26 = -[NSSQLEntity tableName](v22, "tableName");
    }
    else
    {
      v26 = -[NSSQLIntermediate governingAliasForKeypathExpression:](scope, "governingAliasForKeypathExpression:", v19);
    }
    v25 = (id)v26;
LABEL_30:
    v144 = v19;
    v27 = objc_msgSend(v20, "objectAtIndex:", 0);
    if (v22)
    {
      v28 = (_QWORD *)-[NSMutableDictionary objectForKey:](v22->_properties, "objectForKey:", v27);
      v29 = (void *)objc_msgSend(v3, "valueForKey:", CFSTR("explicitRestrictingEntityQualifier"));
      if (v28)
        goto LABEL_38;
    }
    else
    {
      v29 = (void *)objc_msgSend(v3, "valueForKey:", CFSTR("explicitRestrictingEntityQualifier"));
    }
    v30 = v29;
    if (objc_msgSend(v29, "count"))
    {
      v31 = objc_msgSend(v30, "lastObject");
      v32 = objc_msgSend(v20, "objectAtIndex:", 0);
      if (v31)
        v28 = (_QWORD *)objc_msgSend(*(id *)(v31 + 40), "objectForKey:", v32);
      else
        v28 = 0;
      objc_msgSend(v30, "removeLastObject");
    }
    else
    {
      v28 = 0;
    }
LABEL_38:
    v33 = (NSString *)(id)objc_msgSend((id)objc_msgSend(v3, "objectForKey:", CFSTR("aliasGenerator")), "generateTableAlias");
    self->_selectEntityAlias = v33;
    self->_variableAlias = v33;
    self->_governingEntityForVariable = self->_selectFromEntity;
    v34 = objc_msgSend(v28, "propertyType");
    -[NSSQLStatementIntermediate setGoverningAlias:](self->_fetchIntermediate, "setGoverningAlias:", self->_selectEntityAlias);
    switch(v34)
    {
      case 7:
        v148 = 1;
        v35 = (NSSQLEntity *)objc_msgSend(v28, "destinationEntity");
        self->_selectFromEntity = v35;
        self->_governingEntityForVariable = v35;
        v36 = (void *)objc_msgSend(v25, "mutableCopy");
        objc_msgSend(v36, "appendString:", CFSTR("."));
        objc_msgSend(v36, "appendString:", objc_msgSend((id)objc_msgSend(v28, "foreignKey"), "columnName"));
        objc_msgSend(v36, "appendString:", CFSTR(" = "));
        objc_msgSend(v36, "appendString:", self->_selectEntityAlias);
        objc_msgSend(v36, "appendString:", CFSTR("."));
        selectFromEntity = self->_selectFromEntity;
        if (selectFromEntity)
          primaryKey = selectFromEntity->_primaryKey;
        else
          primaryKey = 0;
        objc_msgSend(v36, "appendString:", -[NSSQLColumn columnName](primaryKey, "columnName"));
        -[NSSQLStatementIntermediate setCorrelationToken:]((uint64_t)self->_fetchIntermediate, v36);

        break;
      case 9:
        v148 = 0;
        v69 = (NSSQLEntity *)objc_msgSend(v28, "destinationEntity");
        self->_selectFromEntity = v69;
        self->_governingEntityForVariable = v69;
        if (v28)
          v44 = (__CFString *)v28[7];
        else
          v44 = 0;
        v70 = (void *)objc_msgSend(v25, "mutableCopy");
        objc_msgSend(v70, "appendString:", CFSTR("."));
        if (v22)
          v71 = v22->_primaryKey;
        else
          v71 = 0;
        objc_msgSend(v70, "appendString:", -[NSSQLColumn columnName](v71, "columnName"));
        objc_msgSend(v70, "appendString:", CFSTR(" = "));
        objc_msgSend(v70, "appendString:", self->_selectEntityAlias);
        objc_msgSend(v70, "appendString:", CFSTR("."));
        objc_msgSend(v70, "appendString:", -[NSSQLManyToMany inverseColumnName](v44));
        -[NSSQLStatementIntermediate setCorrelationToken:]((uint64_t)self->_fetchIntermediate, v70);

        if (self->_onlyTrailIsCount && self->_subqueryHasTruePredicate)
        {
          v72 = (NSMutableString *)objc_msgSend((id)objc_msgSend(v28, "correlationTableName"), "mutableCopy");
          self->_selectFromCorrelationTarget = v72;
          -[NSMutableString appendString:](v72, "appendString:", CFSTR(" "));
          -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", self->_selectEntityAlias);
          goto LABEL_52;
        }
        v77 = (NSMutableString *)objc_msgSend((id)objc_msgSend(v28, "correlationTableName"), "mutableCopy");
        self->_selectFromCorrelationTarget = v77;
        -[NSMutableString appendString:](v77, "appendString:", CFSTR(" "));
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", self->_selectEntityAlias);
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", CFSTR(" JOIN "));
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", objc_msgSend((id)objc_msgSend(v28, "destinationEntity"), "tableName"));
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", CFSTR(" "));
        v78 = (NSString *)(id)objc_msgSend((id)objc_msgSend(v3, "objectForKey:", CFSTR("aliasGenerator")), "generateTableAlias");
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", v78);
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", CFSTR(" ON "));
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", self->_selectEntityAlias);
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", CFSTR("."));
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", -[__CFString columnName](v44, "columnName"));
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", CFSTR(" = "));
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", v78);
        -[NSMutableString appendString:](self->_selectFromCorrelationTarget, "appendString:", CFSTR("."));
        selectFromCorrelationTarget = self->_selectFromCorrelationTarget;
        v80 = (_QWORD *)objc_msgSend(v28, "destinationEntity");
        if (v80)
          v80 = (_QWORD *)v80[16];
        -[NSMutableString appendString:](selectFromCorrelationTarget, "appendString:", objc_msgSend(v80, "columnName"));

        self->_selectEntityAlias = v78;
        self->_variableAlias = self->_selectEntityAlias;
        break;
      case 8:
        v148 = 0;
        v40 = (NSSQLEntity *)objc_msgSend(v28, "destinationEntity");
        self->_selectFromEntity = v40;
        self->_governingEntityForVariable = v40;
        if (v28)
          v41 = (void *)v28[7];
        else
          v41 = 0;
        v42 = (void *)objc_msgSend(v25, "mutableCopy");
        objc_msgSend(v42, "appendString:", CFSTR("."));
        if (v22)
          v43 = v22->_primaryKey;
        else
          v43 = 0;
        objc_msgSend(v42, "appendString:", -[NSSQLColumn columnName](v43, "columnName"));
        objc_msgSend(v42, "appendString:", CFSTR(" = "));
        objc_msgSend(v42, "appendString:", self->_selectEntityAlias);
        objc_msgSend(v42, "appendString:", CFSTR("."));
        objc_msgSend(v42, "appendString:", objc_msgSend((id)objc_msgSend(v41, "foreignKey"), "columnName"));
        -[NSSQLStatementIntermediate setCorrelationToken:]((uint64_t)self->_fetchIntermediate, v42);

        v39 = objc_msgSend(v28, "destinationEntity");
        if (v39)
          goto LABEL_51;
        goto LABEL_226;
      default:
        objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't have a non-relationship collection element in a subquery%@"), self->super._expression), 0), CFSTR("NSUnderlyingException"));
        goto LABEL_139;
    }
    v39 = objc_msgSend(v28, "destinationEntity");
    if (v39)
    {
LABEL_51:
      v44 = *(__CFString **)(v39 + 128);
LABEL_52:
      -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)self, v44);
      -[NSSQLStatementIntermediate setGoverningEntity:](self->_fetchIntermediate, "setGoverningEntity:", self->_selectFromEntity);
      v45 = self->_trailingKeypath;
      if (v45)
        v46 = -[NSString componentsSeparatedByString:](-[NSExpression keyPath](v45, "keyPath"), "componentsSeparatedByString:", CFSTR("."));
      else
        v46 = 0;
      if (objc_msgSend(-[NSArray objectAtIndex:](v46, "objectAtIndex:", 0), "isEqualToString:", &stru_1E1EE23F0))v46 = -[NSArray subarrayWithRange:](v46, "subarrayWithRange:", 1, -[NSArray count](v46, "count") - 1);
      if (!self->_hasTrailingFunction)
        goto LABEL_62;
      if (-[NSArray count](v46, "count") >= 2)
      {
        objc_msgSend(v147, "count");
LABEL_66:
        v48 = (id)objc_msgSend(v147, "mutableCopy");
        v149 = 0u;
        v150 = 0u;
        v151 = 0u;
        v152 = 0u;
        v49 = -[NSArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v149, v153, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v150;
          do
          {
            for (i = 0; i != v50; ++i)
            {
              if (*(_QWORD *)v150 != v51)
                objc_enumerationMutation(v46);
              v53 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
              if ((objc_msgSend(v53, "hasPrefix:", CFSTR("@")) & 1) == 0)
                objc_msgSend(v48, "addObject:", v53);
            }
            v50 = -[NSArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v149, v153, 16);
          }
          while (v50);
        }
        v54 = objc_msgSend(v147, "count");
        v55 = v54 - 1;
        v56 = objc_msgSend(v48, "count");
        v57 = v56;
        v145 = v56 - 1;
        v146 = v54;
        if (!v56)
        {
          v64 = 0;
          v59 = 0;
          goto LABEL_114;
        }
        v143 = v3;
        v58 = 0;
        v59 = 0;
        v60 = 0;
        v61 = self->_selectFromEntity;
        v142 = v56 == v54;
        while (1)
        {
          v62 = objc_msgSend(v48, "objectAtIndex:", v58);
          if (!v61)
            break;
          v63 = (NSSQLColumn *)-[NSMutableDictionary objectForKey:](v61->_properties, "objectForKey:", v62);
          if (!v63)
            break;
          v64 = v63;
          v65 = -[NSSQLProperty propertyType](v63, "propertyType");
          if ((v65 - 7) > 2)
          {
            if (v145 != v58)
            {
              v73 = (void *)MEMORY[0x1E0C99DA0];
              v74 = *MEMORY[0x1E0C99778];
              v75 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad collection keypath in subquery %@ (attribute in non-terminal position)"), self->super._expression, v141);
              goto LABEL_112;
            }
            v59 |= v57 == v146;
            v60 = 1;
          }
          else
          {
            if (!(((v65 & 0xFE) != 8) | v148 & 1))
            {
              v73 = (void *)MEMORY[0x1E0C99DA0];
              v74 = *MEMORY[0x1E0C99778];
              v75 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Only allowed one toMany/manyToMany relationship in subquery expression collection (%@)"), self->super._expression, v141);
              goto LABEL_112;
            }
            v148 &= (v65 & 0xFE) != 8;
            v61 = (NSSQLEntity *)-[NSSQLColumn destinationEntity](v64, "destinationEntity");
          }
          if (v55 == v58)
          {
            if ((v59 & 1) != 0)
            {
              self->_governingEntityForVariable = v61;
              v66 = self;
              v67 = (NSSQLPrimaryKey *)v64;
            }
            else
            {
              v68 = (NSSQLEntity *)-[NSSQLColumn destinationEntity](v64, "destinationEntity");
              self->_governingEntityForVariable = v68;
              if (v68)
                v67 = v68->_primaryKey;
              else
                v67 = 0;
              v66 = self;
            }
            -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)v66, v67);
          }
          if (v57 == ++v58)
          {
            if ((v60 & 1) != 0)
            {
              self->_targetColumn = v64;
              v3 = v143;
              if (v57 > 1)
              {

                self->_variableAlias = 0;
                v76 = 1;
                goto LABEL_120;
              }
              v83 = 1;
LABEL_117:

              self->_variableAlias = 0;
              if (!v57 || (v83 & 1) != 0)
                goto LABEL_137;
              v76 = 0;
LABEL_120:
              if (-[NSSQLIntermediate isUpdateColumnsScoped](self, "isUpdateColumnsScoped"))
              {
                objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported subquery with multiple joins in update columns %@"), v144), 0), CFSTR("NSUnderlyingException"));
                goto LABEL_139;
              }
              v84 = objc_msgSend(v3, "objectForKey:", CFSTR("subqueryCollectionContext"));
              objc_msgSend(v3, "setObject:forKey:", self, CFSTR("subqueryCollectionContext"));
              v85 = +[NSSQLJoinIntermediate createJoinIntermediatesForKeypath:startEntity:startAlias:forScope:inStatementIntermediate:inContext:]((uint64_t)NSSQLJoinIntermediate, v48, (uint64_t)self->_selectFromEntity, self->_selectEntityAlias, self, (uint64_t)self->_fetchIntermediate, v3);
              if (v84)
                objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("subqueryCollectionContext"));
              else
                objc_msgSend(v3, "removeObjectForKey:", CFSTR("subqueryCollectionContext"));
              if (objc_msgSend(v3, "objectForKey:", CFSTR("NSUnderlyingException")))
              {

                goto LABEL_139;
              }
              if (!v85)
              {
LABEL_137:
                v85 = 0;
                self->_variableAlias = self->_selectEntityAlias;
                selectEntityAlias = (objc_class *)self->_selectEntityAlias;
                v95 = &OBJC_IVAR___NSSQLSubqueryExpressionIntermediate__targetAlias;
                goto LABEL_138;
              }
              if (v142)
              {
                v86 = v147;
                if ((v59 & 1) != 0)
                  v86 = (void *)objc_msgSend(v147, "subarrayWithRange:", 0, v55);
                v87 = -[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:]((uint64_t)self->_fetchIntermediate, v86);
                v88 = v87;
                if (v87)
                {
                  if ((v76 & 1) != 0)
                  {
                    v89 = *(void **)(v87 + 32);
                    goto LABEL_134;
                  }
                  v126 = *(_QWORD *)(v87 + 16);
                  if (v126 && *(_BYTE *)(v126 + 24) == 9)
                  {
                    if (-[NSSQLSubqueryExpressionIntermediate canDoDirectJoinGivenPredicate:](self, (uint64_t)-[NSExpression predicate](self->super._expression, "predicate")))
                    {
                      *(_BYTE *)(v88 + 56) = 1;
                      v127 = (NSString *)*(id *)(v88 + 40);
                      self->_variableAlias = v127;
                      self->_targetAlias = v127;
                      v128 = objc_alloc_init(NSSQLColumn);
                      v129 = (__CFString *)-[NSSQLManyToMany inverseColumnName]((const __CFString *)v126);
                      -[NSSQLColumn _setColumnName:]((uint64_t)v128, v129);
                      if (v128)
                        *(_WORD *)&v128->super._flags |= 1u;
                      -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)self, v128);

LABEL_221:
                      v95 = &OBJC_IVAR___NSSQLSubqueryExpressionIntermediate__targetColumn;
                      selectEntityAlias = (objc_class *)self->_variableColumn;
                    }
                    else
                    {
                      v138 = (NSString *)*(id *)(v88 + 32);
                      self->_variableAlias = v138;
                      self->_targetAlias = v138;
                      v139 = objc_msgSend(*(id *)(v88 + 16), "destinationEntity");
                      if (v139)
                        v140 = *(void **)(v139 + 128);
                      else
                        v140 = 0;
                      -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)self, v140);
                      v95 = &OBJC_IVAR___NSSQLSubqueryExpressionIntermediate__targetColumn;
                      selectEntityAlias = (objc_class *)self->_variableColumn;
                    }
LABEL_138:
                    *(Class *)((char *)&self->super.super.super.isa + *v95) = selectEntityAlias;

LABEL_139:
                    if (objc_msgSend(v3, "objectForKey:", CFSTR("NSUnderlyingException")))
                    {
LABEL_140:

                      v17 = 0;
                      self->_fetchIntermediate = 0;
                      return v17;
                    }
                    v96 = -[NSExpression predicate](self->super._expression, "predicate");
                    if (v96)
                    {
                      v97 = v96;
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v98 = -[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]([NSSQLSimpleWhereIntermediate alloc], "initWithPredicate:inScope:", -[NSExpression predicate](self->super._expression, "predicate"), self);
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v98 = -[NSSQLCompoundWhereIntermediate initWithPredicate:inScope:inContext:]([NSSQLCompoundWhereIntermediate alloc], "initWithPredicate:inScope:inContext:", -[NSExpression predicate](self->super._expression, "predicate"), self, v3);
                          if (!v98)
                            goto LABEL_140;
                        }
                        else
                        {
                          if ((NSPredicate *)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1) != v97)
                          {

                            self->_fetchIntermediate = 0;
                            objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unknown predicate type"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", self->super._expression, CFSTR("subquery"))), CFSTR("NSUnderlyingException"));
                          }
                          v98 = 0;
                        }
                      }
                      if (objc_msgSend(v3, "objectForKey:", CFSTR("NSUnderlyingException")))
                      {

                        return 0;
                      }
                      -[NSSQLStatementIntermediate setWhereIntermediate:]((uint64_t)self->_fetchIntermediate, v98);

                    }
                    v99 = self->_trailingKeypath;
                    if (!v99)
                    {
                      variableColumn = self->_variableColumn;
                      goto LABEL_183;
                    }
                    v100 = -[NSString componentsSeparatedByString:](-[NSExpression keyPath](v99, "keyPath"), "componentsSeparatedByString:", CFSTR("."));
                    if (objc_msgSend(-[NSArray objectAtIndex:](v100, "objectAtIndex:", 0), "isEqual:", &stru_1E1EE23F0))
                    {
                      v100 = (NSArray *)(id)-[NSArray mutableCopy](v100, "mutableCopy");
                      -[NSArray removeObjectAtIndex:](v100, "removeObjectAtIndex:", 0);
                    }
                    v101 = -[NSArray objectAtIndex:](v100, "objectAtIndex:", -[NSArray count](v100, "count") - 1);
                    if (self->_hasTrailingFunction)
                    {
                      v102 = (void *)v101;
                      if (objc_msgSend(CFSTR("@count"), "isEqual:", v101))
                      {
                        variableColumn = objc_alloc_init(NSSQLColumn);
                        if (-[NSSQLIntermediate isUpdateColumnsScoped](self, "isUpdateColumnsScoped"))
                          v104 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("COUNT(%@)"), -[NSSQLColumn columnName](self->_targetColumn, "columnName"), v141);
                        else
                          v104 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("COUNT(%@.%@)"), self->_targetAlias, -[NSSQLColumn columnName](self->_targetColumn, "columnName"));
                        -[NSSQLColumn _setColumnName:]((uint64_t)variableColumn, v104);
                        if (!variableColumn)
                        {
LABEL_183:
                          v111 = self->_selectFromCorrelationTarget;
                          v112 = [NSSQLSelectIntermediate alloc];
                          v113 = self->_selectEntityAlias;
                          if (v111)
                            v114 = -[NSSQLSelectIntermediate initForCorrelationTarget:alias:fetchColumns:inScope:](v112, "initForCorrelationTarget:alias:fetchColumns:inScope:", self->_selectFromCorrelationTarget, v113, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", variableColumn), self);
                          else
                            v114 = -[NSSQLSelectIntermediate initWithEntity:alias:fetchColumns:inScope:](v112, "initWithEntity:alias:fetchColumns:inScope:", self->_selectFromEntity, v113, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", variableColumn), self);
                          v115 = (_BYTE *)v114;
                          -[NSSQLSelectIntermediate setColumnAlias:](v114, self->_variableAlias);
                          if (v115)
                            v115[48] = self->_useDistinct;
                          -[NSSQLFetchIntermediate setSelectIntermediate:]((uint64_t)self->_fetchIntermediate, v115);

LABEL_189:
                          v116 = -[NSSQLFetchIntermediate generateSQLStringInContext:](self->_fetchIntermediate, "generateSQLStringInContext:", v3);
                          if (v116)
                          {
                            v117 = v116;
                            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("("));
                            objc_msgSend(v17, "appendString:", v117);
                            objc_msgSend(v17, "appendString:", CFSTR(")"));

                            return v17;
                          }
                          return 0;
                        }
LABEL_182:
                        *(_WORD *)&variableColumn->super._flags &= ~1u;
                        goto LABEL_183;
                      }
                      if ((objc_msgSend((id)objc_msgSend(v3, "objectForKey:", CFSTR("supportedKVCAggregates")), "containsObject:", v102) & 1) != 0|| objc_msgSend(v102, "isEqual:", CFSTR("@total")))
                      {
                        if (-[NSSQLProperty propertyType](self->_targetColumn, "propertyType") == 1)
                        {
                          if (objc_msgSend(v102, "characterAtIndex:", 1) == 97)
                            v107 = CFSTR("AVG");
                          else
                            v107 = (const __CFString *)objc_msgSend((id)objc_msgSend(v102, "substringFromIndex:", 1), "uppercaseString");
                          variableColumn = objc_alloc_init(NSSQLColumn);
                          v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E1EE23F0);
                          objc_msgSend(v105, "appendString:", v107);
                          objc_msgSend(v105, "appendString:", CFSTR("("));
                          if (!-[NSSQLIntermediate isUpdateColumnsScoped](self, "isUpdateColumnsScoped"))
                          {
                            objc_msgSend(v105, "appendString:", self->_targetAlias);
                            objc_msgSend(v105, "appendString:", CFSTR("."));
                          }
                          objc_msgSend(v105, "appendString:", -[NSSQLColumn columnName](self->_targetColumn, "columnName"));
                          v106 = CFSTR(") ");
                          goto LABEL_181;
                        }
                        v108 = (void *)MEMORY[0x1E0C99DA0];
                        v109 = *MEMORY[0x1E0C99778];
                        v110 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Aggregate functions need to work on attributes: %@"), self->super._expression, v141);
                      }
                      else
                      {
                        v108 = (void *)MEMORY[0x1E0C99DA0];
                        v109 = *MEMORY[0x1E0C99778];
                        v110 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported KVC function in trailing keypath %@, %@"), self->super._expression, self->_trailingKeypath);
                      }
                      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v108, "exceptionWithName:reason:userInfo:", v109, v110, 0), CFSTR("NSUnderlyingException"));
                      goto LABEL_189;
                    }
                    variableColumn = objc_alloc_init(NSSQLColumn);
                    v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E1EE23F0);
                    if (!-[NSSQLIntermediate isUpdateColumnsScoped](self, "isUpdateColumnsScoped"))
                    {
                      objc_msgSend(v105, "appendString:", self->_targetAlias);
                      objc_msgSend(v105, "appendString:", CFSTR("."));
                    }
                    v106 = -[NSSQLColumn columnName](self->_targetColumn, "columnName");
LABEL_181:
                    objc_msgSend(v105, "appendString:", v106);
                    -[NSSQLColumn _setColumnName:]((uint64_t)variableColumn, v105);

                    if (!variableColumn)
                      goto LABEL_183;
                    goto LABEL_182;
                  }
                  v135 = *(void **)(v87 + 32);
LABEL_217:
                  v136 = v135;
                  self->_variableAlias = v136;
                  self->_targetAlias = v136;
                  if (v88)
                  {
                    v137 = objc_msgSend(*(id *)(v88 + 16), "destinationEntity");
                    if (v137)
                    {
                      v93 = *(void **)(v137 + 128);
                      goto LABEL_220;
                    }
                    goto LABEL_244;
                  }
                }
                else
                {
                  v135 = 0;
                  v89 = 0;
                  if ((v76 & 1) == 0)
                    goto LABEL_217;
LABEL_134:
                  v90 = v89;
                  self->_variableAlias = v90;
                  self->_targetAlias = v90;
                  if (v88)
                  {
                    v91 = objc_msgSend(*(id *)(v88 + 16), "destinationEntity");
                    v92 = objc_msgSend(v147, "lastObject");
                    if (v91)
                    {
                      v93 = (void *)objc_msgSend(*(id *)(v91 + 40), "objectForKey:", v92);
LABEL_220:
                      -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)self, v93);
                      goto LABEL_221;
                    }
LABEL_244:
                    v93 = 0;
                    goto LABEL_220;
                  }
                  objc_msgSend(v147, "lastObject");
                }
                v93 = 0;
                goto LABEL_220;
              }
              if (v146)
              {
                v118 = -[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:]((uint64_t)self->_fetchIntermediate, v147);
                if (v118)
                {
                  v119 = v118;
                  v120 = objc_msgSend(*(id *)(v118 + 16), "destinationEntity");
                  if (v120)
                    v121 = *(void **)(v120 + 128);
                  else
                    v121 = 0;
                  -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)self, v121);
                  v122 = *(void **)(v119 + 32);
                }
                else
                {
                  -[NSSQLSubqueryExpressionIntermediate _setVariableColumn:]((uint64_t)self, 0);
                  v122 = 0;
                }
                self->_variableAlias = (NSString *)v122;
                v123 = v48;
                if (v76)
                  v123 = (void *)objc_msgSend(v48, "subarrayWithRange:", 0, v145);
                v124 = -[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:]((uint64_t)self->_fetchIntermediate, v123);
                if (v124)
                {
                  self->_targetAlias = *(NSString **)(v124 + 32);
                  v125 = *(void **)(v124 + 16);
                  goto LABEL_210;
                }
LABEL_236:
                v95 = &OBJC_IVAR___NSSQLSubqueryExpressionIntermediate__targetColumn;
                self->_targetAlias = 0;
                if (v76)
                {
                  objc_msgSend(v48, "lastObject");
                  selectEntityAlias = 0;
                  v95 = &OBJC_IVAR___NSSQLSubqueryExpressionIntermediate__targetColumn;
                }
                else
                {
                  selectEntityAlias = 0;
                }
                goto LABEL_138;
              }
              v130 = v48;
              if (v76)
                v130 = (void *)objc_msgSend(v48, "subarrayWithRange:", 0, v145);
              v131 = -[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:]((uint64_t)self->_fetchIntermediate, v130);
              self->_variableAlias = self->_selectEntityAlias;
              if (!v131)
                goto LABEL_236;
              self->_targetAlias = *(NSString **)(v131 + 32);
              v125 = *(void **)(v131 + 16);
LABEL_210:
              v132 = objc_msgSend(v125, "destinationEntity");
              v133 = v132;
              if ((v76 & 1) != 0)
              {
                v134 = objc_msgSend(v48, "lastObject");
                if (v133)
                {
                  selectEntityAlias = (objc_class *)objc_msgSend(*(id *)(v133 + 40), "objectForKey:", v134);
LABEL_215:
                  v95 = &OBJC_IVAR___NSSQLSubqueryExpressionIntermediate__targetColumn;
                  goto LABEL_138;
                }
              }
              else if (v132)
              {
                selectEntityAlias = *(objc_class **)(v132 + 128);
                goto LABEL_215;
              }
              selectEntityAlias = 0;
              goto LABEL_215;
            }
            v3 = v143;
LABEL_114:
            v81 = -[NSSQLColumn destinationEntity](v64, "destinationEntity");
            if (v81)
              v82 = *(NSSQLColumn **)(v81 + 128);
            else
              v82 = 0;
            v83 = 0;
            self->_targetColumn = v82;
            v142 = v57 == v146;
            goto LABEL_117;
          }
        }
        v73 = (void *)MEMORY[0x1E0C99DA0];
        v74 = *MEMORY[0x1E0C99778];
        v75 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad collection keypath (%@) can't find property named (%@) "), self->super._expression, v62);
LABEL_112:
        v3 = v143;
        objc_msgSend(v143, "setObject:forKey:", objc_msgSend(v73, "exceptionWithName:reason:userInfo:", v74, v75, 0), CFSTR("NSUnderlyingException"));
        goto LABEL_139;
      }
      if (self->_hasTrailingFunction)
        v47 = 0;
      else
LABEL_62:
        v47 = -[NSArray count](v46, "count") != 0;
      if (!objc_msgSend(v147, "count") && !v47)
      {
        self->_targetAlias = self->_variableAlias;
        self->_targetColumn = self->_variableColumn;
        goto LABEL_139;
      }
      goto LABEL_66;
    }
LABEL_226:
    v44 = 0;
    goto LABEL_52;
  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", self->super._expression, CFSTR("expression"));
  v8 = CFSTR("Subquery expressions not allowed in indexes");
  v9 = v5;
  v10 = v6;
LABEL_8:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v8, v7), CFSTR("NSUnderlyingException"));
  return 0;
}

- (void)_setVariableColumn:(uint64_t)a1
{
  id v4;

  if (*(void **)(a1 + 88) != a2)
  {
    v4 = a2;

    *(_QWORD *)(a1 + 88) = a2;
  }
}

- (void)dealloc
{
  objc_super v3;

  self->_trailingKeypath = 0;
  self->_selectFromEntity = 0;
  self->_variableExpression = 0;
  self->_governingEntityForVariable = 0;

  self->_selectFromCorrelationTarget = 0;
  self->_fetchIntermediate = 0;

  self->_selectEntityAlias = 0;
  self->_variableAlias = 0;

  self->_variableColumn = 0;
  self->_keypathsToPromote = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLSubqueryExpressionIntermediate;
  -[NSSQLSubqueryExpressionIntermediate dealloc](&v3, sel_dealloc);
}

- (id)fetchIntermediateForKeypathExpression:(id)a3
{
  if (-[NSSQLSubqueryExpressionIntermediate _isKeypathScopedToSubquery:]((_BOOL8)self, a3))
    return self->_fetchIntermediate;
  else
    return -[NSSQLIntermediate fetchIntermediateForKeypathExpression:](self->super.super._scope, "fetchIntermediateForKeypathExpression:", a3);
}

- (id)governingAliasForKeypathExpression:(id)a3
{
  objc_super v6;

  if (-[NSSQLSubqueryExpressionIntermediate _isKeypathScopedToSubquery:]((_BOOL8)self, a3))
    return self->_variableAlias;
  v6.receiver = self;
  v6.super_class = (Class)NSSQLSubqueryExpressionIntermediate;
  return -[NSSQLIntermediate governingAliasForKeypathExpression:](&v6, sel_governingAliasForKeypathExpression_, a3);
}

- (id)governingEntityForKeypathExpression:(id)a3
{
  objc_super v6;

  if (-[NSSQLSubqueryExpressionIntermediate _isKeypathScopedToSubquery:]((_BOOL8)self, a3))
    return self->_governingEntityForVariable;
  v6.receiver = self;
  v6.super_class = (Class)NSSQLSubqueryExpressionIntermediate;
  return -[NSSQLIntermediate governingEntityForKeypathExpression:](&v6, sel_governingEntityForKeypathExpression_, a3);
}

- (BOOL)_isKeypathScopedToSubquery:(_BOOL8)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    return objc_msgSend(a2, "expressionType") == 4
        && objc_msgSend((id)objc_msgSend(a2, "operand"), "expressionType") == 2
        && (sel_valueForKey_ == (char *)objc_msgSend(a2, "selector")
         || sel_valueForKeyPath_ == (char *)objc_msgSend(a2, "selector"))
        && (objc_msgSend((id)objc_msgSend(a2, "operand"), "isEqual:", *(_QWORD *)(v3 + 40)) & 1) != 0;
  }
  return result;
}

- (void)_promoteJoinsForSubqueryScopedKeypath:(id)a3
{
  void *v5;
  uint64_t v6;
  NSMutableArray *keypathsToPromote;

  if (objc_msgSend((id)objc_msgSend(a3, "operand"), "isEqual:", -[NSExpression variableExpression](self->super._expression, "variableExpression")))
  {
    if (objc_msgSend(a3, "expressionType") == 3)
      v5 = (void *)objc_msgSend(a3, "keyPath");
    else
      v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0), "constantValue");
    v6 = objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    keypathsToPromote = self->_keypathsToPromote;
    if (!keypathsToPromote)
    {
      keypathsToPromote = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      self->_keypathsToPromote = keypathsToPromote;
    }
    -[NSMutableArray addObject:](keypathsToPromote, "addObject:", v6);
  }
  -[NSSQLIntermediate _promoteJoinsForSubqueryScopedKeypath:](self->super.super._scope, "_promoteJoinsForSubqueryScopedKeypath:", a3);
}

- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3
{
  id *v5;
  void *v6;
  BOOL result;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  uint64_t v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[NSSQLSubqueryExpressionIntermediate _isKeypathScopedToSubquery:]((_BOOL8)self, a3))
  {
    v5 = -[NSSQLSubqueryExpressionIntermediate governingEntityForKeypathExpression:](self, "governingEntityForKeypathExpression:", a3);
    if (objc_msgSend(a3, "expressionType") == 3)
      v6 = (void *)objc_msgSend(a3, "keyPath");
    else
      v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0), "constantValue");
    v8 = (void *)objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v20;
LABEL_8:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        if (!v5)
          return 1;
        v14 = (unsigned __int8 *)objc_msgSend(v5[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13));
        if (!v14)
          return 1;
        v15 = v14;
        if ((objc_msgSend(v14, "isToMany") & 1) != 0)
          break;
        v16 = v15[24];
        if (v16 == 7)
        {
          v5 = (id *)objc_msgSend(v15, "destinationEntity");
        }
        else
        {
          if (v16 == 9)
            break;
          v5 = 0;
        }
LABEL_20:
        if (v10 == ++v13)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          result = 1;
          if (v10)
            goto LABEL_8;
          return result;
        }
      }
      v17 = objc_msgSend(v15, "destinationEntity");
      if (v11)
        return 0;
      v5 = (id *)v17;
      v11 = 1;
      goto LABEL_20;
    }
    return 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)NSSQLSubqueryExpressionIntermediate;
    return -[NSSQLIntermediate keypathExpressionIsSafeLHSForIn:](&v18, sel_keypathExpressionIsSafeLHSForIn_, a3);
  }
}

- (uint64_t)canDoDirectJoinGivenPredicate:(void *)a1
{
  NSSQLSubqueryExpressionIntermediatePredicateVisitor *v4;
  _QWORD *v5;
  uint64_t v6;
  objc_super v8;

  v4 = [NSSQLSubqueryExpressionIntermediatePredicateVisitor alloc];
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)NSSQLSubqueryExpressionIntermediatePredicateVisitor;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    if (v5)
    {
      v5[1] = a1;
      *((_BYTE *)v5 + 16) = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v5, "checkPredicate:", a2);

  return v6;
}

@end
