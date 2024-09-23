@implementation NSSQLReadOnlySelectIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  id v3;
  void *v5;
  NSUInteger v7;
  void *v8;
  _QWORD *v9;
  uint64_t i;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSSQLEntity *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  char v29;
  uint64_t v30;
  NSPropertyDescription *v31;
  NSPropertyDescription *v32;
  uint64_t v33;
  uint64_t v34;
  NSSQLToOne *v35;
  NSSQLToOne *v36;
  uint64_t v37;
  void *v38;
  NSSQLForeignEntityKey *foreignEntityKey;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSSQLToOne *v43;
  NSSQLForeignEntityKey *v44;
  void *v45;
  NSSQLConstantValueIntermediate *v46;
  id v47;
  _QWORD *v48;
  void *v49;
  NSSQLKeypathExpressionIntermediate *v50;
  NSSQLKeypathExpressionIntermediate *v51;
  id v52;
  uint64_t v53;
  NSSQLToOne *v54;
  void *v55;
  _QWORD *v56;
  void *v57;
  NSSQLTernaryExpressionIntermediate *v58;
  id v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  NSString *v66;
  _QWORD *v67;
  void *v68;
  NSNumber *columnValue;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  id obj;
  uint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  void *v99;
  char v100;
  id v101;
  void *v102;
  NSUInteger v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[7];
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  void (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  _QWORD *v118;
  _QWORD v119[2];
  void (*v120)(uint64_t, uint64_t);
  void *v121;
  void *v122;
  NSPropertyDescription *v123;
  void *v124;
  NSSQLReadOnlySelectIntermediate *v125;
  id v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v3 = a3;
  v129 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  v7 = -[NSArray count](self->super._fetchColumns, "count");
  *(&self->super._isCount + 1) = 1;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->super._fetchColumns, "count"));
  v9 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate");
  v103 = v7;
  v98 = (uint64_t)v9;
  if (!v9 || !v9[9])
  {
    if (!v7)
    {
      v15 = 1;
LABEL_37:
      v100 = 1;
      goto LABEL_38;
    }
    v16 = 0;
    while (1)
    {
      v17 = -[NSArray objectAtIndex:](self->super._fetchColumns, "objectAtIndex:", v16);
      if (objc_msgSend(v17, "_propertyType") != 5)
        goto LABEL_27;
      v12 = (void *)objc_msgSend(v17, "expression");
      v18 = objc_msgSend(v12, "expressionType");
      if (v18 == 3)
        goto LABEL_28;
      if (v18 == 4)
      {
        if (sel_valueForKey_ == (char *)objc_msgSend(v12, "selector")
          || sel_valueForKeyPath_ == (char *)objc_msgSend(v12, "selector"))
        {
LABEL_28:
          v19 = objc_msgSend(v12, "_mapKVCOperatorsToFunctionsInContext:", v3);
          if (objc_msgSend(v3, "objectForKey:", CFSTR("NSUnderlyingException")))
          {
LABEL_161:
            objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't generate select target token for expression: %@"), v12), 0), CFSTR("NSUnderlyingException"));
            return 0;
          }
          if (v19)
          {
            v17 = (id)objc_msgSend(v17, "copy");
            objc_msgSend(v17, "setExpression:", v19);
          }
          else
          {
            *(&self->super._isCount + 1) = 0;
          }
          v7 = v103;
          goto LABEL_33;
        }
        if (!+[NSSQLFunctionExpressionIntermediate functionIsAcceptableAsAggregate:]((uint64_t)NSSQLFunctionExpressionIntermediate, v12))LABEL_27:*(&self->super._isCount + 1) = 0;
      }
LABEL_33:
      objc_msgSend(v8, "addObject:", v17);
      if (v7 == ++v16)
      {
        v15 = 0;
        goto LABEL_37;
      }
    }
  }
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      v11 = -[NSArray objectAtIndex:](self->super._fetchColumns, "objectAtIndex:", i);
      if (objc_msgSend(v11, "_propertyType") == 5)
      {
        v12 = (void *)objc_msgSend(v11, "expression");
        v13 = objc_msgSend(v12, "expressionType");
        if (v13 == 3
          || v13 == 4
          && (sel_valueForKey_ == (char *)objc_msgSend(v12, "selector")
           || sel_valueForKeyPath_ == (char *)objc_msgSend(v12, "selector")))
        {
          v14 = objc_msgSend(v12, "_mapKVCOperatorsToFunctionsInContext:", v3);
          if (objc_msgSend(v3, "objectForKey:", CFSTR("NSUnderlyingException")))
            goto LABEL_161;
          if (v14)
          {
            v11 = (id)objc_msgSend(v11, "copy");
            objc_msgSend(v11, "setExpression:", v14);
          }
          v7 = v103;
        }
      }
      objc_msgSend(v8, "addObject:", v11);
    }
    v15 = 0;
    v100 = 0;
  }
  else
  {
    v100 = 0;
    v15 = 1;
  }
LABEL_38:
  v20 = objc_msgSend(v3, "objectForKey:", CFSTR("keypathExpressionDestinationRelationship"));
  v21 = objc_msgSend(v3, "objectForKey:", CFSTR("entity"));
  v22 = objc_alloc_init(NSSQLEntity);
  -[NSSQLEntity copyValuesForReadOnlyFetch:](v22, "copyValuesForReadOnlyFetch:", v21);
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("fabricatedSQLEntityForReadOnlyFetch"));
  v96 = (uint64_t)v22;

  v94 = v20;
  if (v21)
    v99 = *(void **)(v21 + 40);
  else
    v99 = 0;
  v97 = (_QWORD *)v21;
  v101 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT "));
  v5 = v23;
  if (!*(&self->super._isCount + 1) && self->super._useDistinct)
    objc_msgSend(v23, "appendString:", CFSTR("DISTINCT "));
  if ((v15 & 1) != 0)
  {
LABEL_44:
    v24 = v3;
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v104, v127, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v105;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v105 != v27)
            objc_enumerationMutation(v8);
          objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * j), "name"));
        }
        v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v104, v127, 16);
      }
      while (v26);
    }
    v29 = -[NSSQLEntity addPropertiesForReadOnlyFetch:keys:context:](v96, v101, (uint64_t)v25, v24);

    if ((v29 & 1) == 0)
    {

      return 0;
    }
    objc_msgSend(v5, "appendString:", CFSTR(" FROM "));
    objc_msgSend(v5, "appendString:", -[NSSQLEntity tableName](self->super._entity, "tableName"));
    objc_msgSend(v5, "appendString:", CFSTR(" "));
    objc_msgSend(v5, "appendString:", self->super._entityAlias);
    objc_msgSend(v5, "appendString:", CFSTR(" "));
    objc_msgSend(v24, "removeObjectForKey:", CFSTR("keypathExpressionDestinationRelationship"));
    if (v94)
      objc_msgSend(v24, "setObject:forKey:", v94, CFSTR("keypathExpressionDestinationRelationship"));
    return v5;
  }
  v30 = 0;
  v102 = v3;
  while (1)
  {
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("keypathExpressionDestinationRelationship"));
    if (v30)
      objc_msgSend(v5, "appendString:", CFSTR(", "));
    v31 = (NSPropertyDescription *)objc_msgSend(v8, "objectAtIndex:", v30);
    v32 = -[NSArray objectAtIndex:](self->super._fetchColumns, "objectAtIndex:", v30);
    v33 = -[NSPropertyDescription _propertyType](v31, "_propertyType");
    if (-[NSPropertyDescription _isAttribute](v31, "_isAttribute"))
    {
      if ((v100 & 1) == 0
        && (-[NSSQLFetchIntermediate groupByClauseContainsKeypath:](v98, -[NSPropertyDescription name](v31, "name")) & 1) == 0)
      {
        if (v5)

LABEL_168:
        v81 = (void *)MEMORY[0x1E0C99DA0];
        v82 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT clauses in queries with GROUP BY components can only contain properties named in the GROUP BY or aggregate functions (%@ is not in the GROUP BY)"), v31);
        objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v81, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v82, 0), CFSTR("NSUnderlyingException"));
        return 0;
      }
      v119[0] = MEMORY[0x1E0C809B0];
      v119[1] = 3221225472;
      v120 = __62__NSSQLReadOnlySelectIntermediate_generateSQLStringInContext___block_invoke;
      v121 = &unk_1E1EE03E8;
      v122 = v99;
      v123 = v31;
      v124 = v5;
      v125 = self;
      v126 = v101;
      v113 = 0;
      v114 = &v113;
      v115 = 0x3052000000;
      v116 = __Block_byref_object_copy__32;
      v117 = __Block_byref_object_dispose__32;
      v112[0] = MEMORY[0x1E0C809B0];
      v112[1] = 3221225472;
      v112[2] = __62__NSSQLReadOnlySelectIntermediate_generateSQLStringInContext___block_invoke_39;
      v112[3] = &unk_1E1EE0410;
      v112[6] = &v113;
      v112[4] = v5;
      v112[5] = v119;
      v118 = v112;
      if (-[NSPropertyDescription attributeType](v31, "attributeType") == 2100)
      {
        (*(void (**)(void))(v114[5] + 16))();
        objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 2, 1, &stru_1E1EE23F0);
      }
      else
      {
        if (v31 && -[NSPropertyDescription superCompositeAttribute](v31, "superCompositeAttribute"))
          v40 = -[NSPropertyDescription _qualifiedName](v31, "_qualifiedName");
        else
          v40 = -[NSPropertyDescription name](v31, "name");
        v120((uint64_t)v119, v40);
      }
      _Block_object_dispose(&v113, 8);
      goto LABEL_141;
    }
    if (v33 != 5)
    {
      if (v33 != 4)
      {

        v79 = (void *)MEMORY[0x1E0C99DA0];
        v80 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported value passed to valuesToFetch: (%@) not supported"), v31);
        objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v79, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v80, 0), CFSTR("NSUnderlyingException"));

        return 0;
      }
      if ((v100 & 1) == 0
        && (-[NSSQLFetchIntermediate groupByClauseContainsKeypath:](v98, -[NSPropertyDescription name](v31, "name")) & 1) == 0)
      {
        if (v5)

        goto LABEL_168;
      }
      v34 = objc_msgSend(v99, "objectForKey:", -[NSPropertyDescription name](v31, "name"));
      v35 = objc_alloc_init(NSSQLToOne);
      v36 = v35;
      if (v35)
        v35->super.super._propertyDescription = v31;
      -[NSSQLToOne copyValuesForReadOnlyFetch:](v35, "copyValuesForReadOnlyFetch:", v34);
      v37 = -[NSSQLRelationship destinationEntity](v36, "destinationEntity");
      if (v37)
      {
        v38 = *(void **)(v37 + 152);
        if (v38)
        {
          if (objc_msgSend(v38, "count"))
          {
            objc_msgSend(v5, "appendString:", self->super._columnAlias);
            objc_msgSend(v5, "appendString:", CFSTR("."));
            if (v36)
              foreignEntityKey = v36->_foreignEntityKey;
            else
              foreignEntityKey = 0;
            objc_msgSend(v5, "appendString:", -[NSSQLColumn columnName](foreignEntityKey, "columnName"));
            objc_msgSend(v5, "appendString:", CFSTR(", "));
          }
        }
      }
      goto LABEL_140;
    }
    v41 = (void *)-[NSPropertyDescription expression](v31, "expression");
    v42 = objc_msgSend(v41, "expressionType");
    if (!v42)
      break;
    if (v42 == 1)
    {
      v43 = -[NSSQLToOne initForReadOnlyFetchWithEntity:propertyDescription:]([NSSQLToOne alloc], "initForReadOnlyFetchWithEntity:propertyDescription:", v97, v31);
      v36 = v43;
      if (v43)
      {
        v43->super.super._propertyDescription = v31;
        if (!objc_msgSend(v102, "objectForKey:", CFSTR("nestedWhereSelect")))
        {
          v44 = v36->_foreignEntityKey;
          goto LABEL_82;
        }
      }
      else if (!objc_msgSend(v102, "objectForKey:", CFSTR("nestedWhereSelect")))
      {
        v44 = 0;
LABEL_82:
        if (v97 && (v97[20] || (v68 = (void *)v97[19]) != 0 && objc_msgSend(v68, "count")))
        {
          objc_msgSend(v5, "appendString:", self->super._columnAlias);
          objc_msgSend(v5, "appendString:", CFSTR("."));
          objc_msgSend(v5, "appendString:", -[NSSQLColumn columnName](v44, "columnName"));
        }
        else
        {
          if (v44)
            columnValue = v44->_columnValue;
          else
            columnValue = 0;
          objc_msgSend(v5, "appendFormat:", CFSTR("%u"), -[NSNumber unsignedIntValue](columnValue, "unsignedIntValue"));
        }
        objc_msgSend(v5, "appendString:", CFSTR(", "));
      }
LABEL_140:
      objc_msgSend(v5, "appendString:", self->super._columnAlias);
      objc_msgSend(v5, "appendString:", CFSTR("."));
      objc_msgSend(v5, "appendString:", -[NSSQLToOne columnName](v36, "columnName"));
      objc_msgSend(v101, "addObject:", v36);

      goto LABEL_141;
    }
    if ((unint64_t)(v42 - 3) > 1)
    {
      if (v42 == 20)
      {
        v58 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLTernaryExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", v41, 0, self);
        v59 = -[NSSQLTernaryExpressionIntermediate generateSQLStringInContext:](v58, "generateSQLStringInContext:", v102);

        if (!v59)
        {

          if (!objc_msgSend(v102, "objectForKey:", CFSTR("NSUnderlyingException")))
          {
            v89 = (void *)MEMORY[0x1E0C99DA0];
            v90 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't generate SQL for ternary expression: %@"), v41);
            objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v89, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v90, 0), CFSTR("NSUnderlyingException"));
          }
          return 0;
        }
        objc_msgSend(v5, "appendString:", v59);

        v60 = -[NSSQLAttribute initForReadOnlyFetchWithExpression:]([NSSQLAttribute alloc], "initForReadOnlyFetchWithExpression:", v31);
        v57 = v60;
        if (v60)
          v60[1] = v32;
      }
      else
      {
        if (v42 != 50
          || (objc_msgSend(v41, "isCountOnlyRequest") & 1) == 0
          && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v41, "requestExpression"), "expressionValueWithObject:context:", 0, 0), "resultType") != 4)
        {

          v85 = (void *)MEMORY[0x1E0C99DA0];
          v86 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Currently unsupported (%@), try again later"), v31);
          objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v85, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v86, 0), CFSTR("NSUnderlyingException"));

          return 0;
        }
        v55 = (void *)-[NSSQLIntermediate _generateSQLForFetchExpression:allowToMany:inContext:](self, v41, 1, v102);
        if (!v55)
        {

          if (!objc_msgSend(v102, "objectForKey:", CFSTR("NSUnderlyingException")))
          {
            v91 = (void *)MEMORY[0x1E0C99DA0];
            v92 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't generate select target token for fetch request expression: %@"), v41);
            objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v91, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v92, 0), CFSTR("NSUnderlyingException"));
          }
          return 0;
        }
        objc_msgSend(v5, "appendString:", v55);

        v56 = -[NSSQLAttribute initForReadOnlyFetchWithExpression:]([NSSQLAttribute alloc], "initForReadOnlyFetchWithExpression:", v31);
        v57 = v56;
        if (v56)
          v56[1] = v32;
      }
      goto LABEL_133;
    }
    if (sel_inverseOrderKey_ == (char *)objc_msgSend(v41, "selector"))
    {
      objc_msgSend(v5, "appendString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v41, "arguments"), "objectAtIndex:", 0), "constantValue"));
      v67 = -[NSSQLAttribute initForReadOnlyFetchWithExpression:]([NSSQLAttribute alloc], "initForReadOnlyFetchWithExpression:", v31);
      v57 = v67;
      if (v67)
        v67[1] = v32;
LABEL_133:
      objc_msgSend(v101, "addObject:", v57);

      goto LABEL_141;
    }
    if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v41) & 1) != 0
      || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v41))
    {
      v50 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLKeypathExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", v41, 0, self);
    }
    else if (-[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:]((_BOOL8)self, v41))
    {
      v50 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", objc_msgSend(v41, "operand"), objc_msgSend((id)objc_msgSend(v41, "arguments"), "objectAtIndex:", 0), self);
    }
    else
    {
      v50 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLFunctionExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", v41, 0, self);
    }
    v51 = v50;
    v52 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v50, "generateSQLStringInContext:", v102);
    if (!v52)
    {

      if (!objc_msgSend(v102, "objectForKey:", CFSTR("NSUnderlyingException")))
      {
        v87 = (void *)MEMORY[0x1E0C99DA0];
        v88 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't generate select target token for expression: %@"), v41);
        objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v87, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v88, 0), CFSTR("NSUnderlyingException"));
      }
      return 0;
    }
    objc_msgSend(v5, "appendString:", v52);

    v53 = objc_msgSend(v102, "objectForKey:", CFSTR("keypathExpressionDestinationRelationship"));
    if (v53 && -[NSPropertyDescription expressionResultType](v31, "expressionResultType") == 2000)
    {
      v54 = objc_alloc_init(NSSQLToOne);
      -[NSSQLToOne copyValuesForReadOnlyFetch:](v54, "copyValuesForReadOnlyFetch:", v53);
      if (v54)
        v54->super.super._propertyDescription = v32;
      objc_msgSend(v101, "addObject:", v54);

    }
    else
    {
      v61 = -[NSSQLAttribute initForReadOnlyFetchWithExpression:]([NSSQLAttribute alloc], "initForReadOnlyFetchWithExpression:", v31);
      v93 = v61;
      if (v61)
        v61[1] = v32;
      objc_msgSend(v101, "addObject:");
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      obj = (id)objc_msgSend((id)objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("storeRequest")), "sortDescriptors");
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v128, 16);
      if (v62)
      {
        v63 = *(_QWORD *)v109;
        while (2)
        {
          for (k = 0; k != v62; ++k)
          {
            if (*(_QWORD *)v109 != v63)
              objc_enumerationMutation(obj);
            v65 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * k);
            v66 = -[NSPropertyDescription name](v31, "name");
            if (-[NSString isEqualToString:](v66, "isEqualToString:", objc_msgSend(v65, "key")))
            {
              if (v97)
                v71 = (void *)v97[5];
              else
                v71 = 0;
              if (objc_msgSend(v71, "objectForKeyedSubscript:", v66))
              {
                _NSCoreDataLog(2, (uint64_t)CFSTR("Sort descriptor key \"%@\" may refer to a modelled property or an expression; the modelled property will be used."),
                  v72,
                  v73,
                  v74,
                  v75,
                  v76,
                  v77,
                  (uint64_t)v66);
              }
              else
              {
                v78 = (void *)-[NSSQLAliasGenerator generateVariableAlias](objc_msgSend(v102, "objectForKey:", CFSTR("aliasGenerator")));
                -[NSMutableDictionary setObject:forKey:](self->_variableToAliasMappings, "setObject:forKey:", v78, v31);
                -[NSSQLColumn _setColumnName:]((uint64_t)v93, v78);
              }
              goto LABEL_153;
            }
          }
          v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v128, 16);
          if (v62)
            continue;
          break;
        }
      }
LABEL_153:

    }
LABEL_141:
    v70 = -[NSMutableDictionary objectForKey:](self->_variableToAliasMappings, "objectForKey:", v31);
    if (v70)
      objc_msgSend(v5, "appendFormat:", CFSTR(" AS %@"), v70);
    ++v30;
    v3 = v102;
    if (v30 == v103)
      goto LABEL_44;
  }
  v45 = (void *)objc_msgSend(v41, "constantValue");
  if ((objc_msgSend(v45, "isNSArray") & 1) == 0
    && (objc_msgSend(v45, "isNSSet") & 1) == 0
    && (objc_msgSend(v45, "isNSOrderedSet") & 1) == 0
    && !objc_msgSend(v45, "isNSDictionary"))
  {
    v46 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]([NSSQLConstantValueIntermediate alloc], "initWithConstantValue:inScope:context:", v45, self, v102);
    v47 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v46, "generateSQLStringInContext:", v102);

    if (!v47)
    {
      if (v5)

      if (!objc_msgSend(v102, "objectForKey:", CFSTR("NSUnderlyingException")))
      {
        v83 = (void *)MEMORY[0x1E0C99DA0];
        v84 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't generate select target token for constant: %@"), v45);
        objc_msgSend(v102, "setObject:forKey:", objc_msgSend(v83, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v84, 0), CFSTR("NSUnderlyingException"));
      }
      return 0;
    }
    objc_msgSend(v5, "appendString:", v47);

    v48 = -[NSSQLAttribute initForReadOnlyFetchWithExpression:]([NSSQLAttribute alloc], "initForReadOnlyFetchWithExpression:", v31);
    v49 = v48;
    if (v48)
      v48[1] = v31;
    objc_msgSend(v101, "addObject:", v48);

    goto LABEL_141;
  }
  if (v5)

  objc_msgSend(v102, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Constant select targets must be values, not collections"), 0), CFSTR("NSUnderlyingException"));
  return 0;
}

void __62__NSSQLReadOnlySelectIntermediate_generateSQLStringInContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = -[NSSQLColumn initForReadOnlyFetching]([NSSQLAttribute alloc], "initForReadOnlyFetching");
  objc_msgSend(v5, "copyValuesForReadOnlyFetch:", v3);
  v4 = v5;
  if (v5)
  {
    *((_QWORD *)v5 + 1) = *(_QWORD *)(a1 + 40);
    if ((*((_WORD *)v5 + 16) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "appendString:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 56));
      objc_msgSend(*(id *)(a1 + 48), "appendString:", CFSTR("."));
      v4 = v5;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "appendString:", objc_msgSend(v4, "columnName"));
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v5);

}

- (NSSQLReadOnlySelectIntermediate)initWithScope:(id)a3
{
  NSSQLReadOnlySelectIntermediate *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLReadOnlySelectIntermediate;
  v3 = -[NSSQLIntermediate initWithScope:](&v5, sel_initWithScope_, a3);
  if (v3)
  {
    *(_QWORD *)&v3->_onlyFetchesAggregates = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_variableToAliasMappings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  *(_QWORD *)&self->_onlyFetchesAggregates = 0;
  self->_variableToAliasMappings = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLReadOnlySelectIntermediate;
  -[NSSQLSelectIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)onlyFetchesAggregates
{
  return *(&self->super._isCount + 1);
}

- (id)resolveVariableExpression:(id)a3 inContext:(id)a4
{
  void *v7;
  void *v8;
  id result;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("storeRequest"));
  v8 = (void *)objc_msgSend(*(id *)&self->_onlyFetchesAggregates, "objectForKey:", a3);
  if (v8)
    return (id)objc_msgSend(v8, "mutableCopy");
  v10 = objc_msgSend(a3, "variable");
  v11 = (void *)objc_msgSend(v7, "propertiesToFetch");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
      if (objc_msgSend(v16, "_propertyType") == 5
        && (objc_msgSend((id)objc_msgSend(v16, "name"), "isEqual:", v10) & 1) != 0)
      {
        break;
      }
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v13)
          goto LABEL_5;
        goto LABEL_14;
      }
    }
    v17 = (void *)-[NSSQLAliasGenerator generateVariableAlias](objc_msgSend(a4, "objectForKey:", CFSTR("aliasGenerator")));
    objc_msgSend(*(id *)&self->_onlyFetchesAggregates, "setObject:forKey:", v17, a3);
    -[NSMutableDictionary setObject:forKey:](self->_variableToAliasMappings, "setObject:forKey:", v17, v16);
    result = (id)objc_msgSend(v17, "mutableCopy");
    if (result)
      return result;
  }
LABEL_14:
  if (!objc_msgSend(a4, "objectForKey:", CFSTR("NSUnderlyingException")))
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to resolve variable expression: %@"), a3), 0), CFSTR("NSUnderlyingException"));
  return 0;
}

uint64_t __62__NSSQLReadOnlySelectIntermediate_generateSQLStringInContext___block_invoke_39(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = (void *)objc_msgSend(a2, "elements", 0);
    result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (result)
    {
      v6 = result;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
          ++v8;
        }
        while (v6 != v8);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v6 = result;
      }
      while (result);
    }
  }
  else
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(a2, "_qualifiedName"));
      return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

@end
