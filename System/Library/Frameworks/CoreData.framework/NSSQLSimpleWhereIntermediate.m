@implementation NSSQLSimpleWhereIntermediate

- (id)_lastScopedItem
{
  return (id)-[NSMutableArray lastObject](self->_comparisonPredicateScopedItem, "lastObject");
}

- (id)generateSQLStringInContext:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  __CFString *v9;
  NSExpression *effectiveLeftExpression;
  unint64_t v12;
  NSExpression *v13;
  NSExpression *effectiveRightExpression;
  uint64_t v15;
  NSExpression *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  NSExpression *v24;
  NSExpression *v25;
  NSExpression *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSExpression *v30;
  NSExpression *v31;
  uint64_t v32;
  const __CFString *v33;
  NSExpression *v34;
  NSExpression *v35;
  uint64_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  __CFString *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  const __CFString *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  id v54;
  void *v55;
  __CFString *v56;
  _BOOL4 v57;
  uint64_t v58;
  int v59;
  NSExpression *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSExpression *v65;
  uint64_t v66;
  uint64_t v67;
  _BOOL8 v68;
  __CFString *v69;
  id v70;
  void *v71;
  __CFString *v72;
  void *v73;
  __CFString *v74;
  NSSQLSimpleWhereIntermediate *v75;
  NSExpression *v76;
  _BOOL8 v77;
  void *v78;
  __CFString *v79;
  id v80;
  __CFString *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  char v93;
  char v94;
  uint64_t v95;
  void *v96;
  id *v97;
  uint64_t v98;
  id v99;
  char v100;
  id v101;
  unint64_t v102;
  void *v103;
  id v104;
  id *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  __CFString *v109;
  __CFString *v110;
  __CFString *v111;
  __CFString *v112;
  id v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t i;
  void *v119;
  id v120;
  uint64_t v121;
  NSSQLBindIntarray *v122;
  uint64_t v123;
  id v124;
  char *obj;
  id obja;
  BOOL v127;
  uint64_t v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  v5 = -[NSPredicate predicateOperatorType](self->super._predicate, "predicateOperatorType");
  if (-[NSPredicate comparisonPredicateModifier](self->super._predicate, "comparisonPredicateModifier") != 1)
  {
    effectiveLeftExpression = self->_effectiveLeftExpression;
    if (-[NSExpression expressionType](effectiveLeftExpression, "expressionType") == NSConstantValueExpressionType)
    {
      v20 = -[NSExpression constantValue](effectiveLeftExpression, "constantValue");
      if (!v20 || objc_msgSend(MEMORY[0x1E0C99E38], "null") == v20)
      {
        v6 = (void *)MEMORY[0x1E0C99DA0];
        v7 = *MEMORY[0x1E0C99778];
        v8 = CFSTR("can't use NULL on left hand side");
        goto LABEL_4;
      }
    }
    v12 = 0x1ECD87000uLL;
    if (v5 <= 98)
    {
      switch(v5)
      {
        case 0:
        case 1:
        case 2:
        case 3:
          v13 = self->_effectiveLeftExpression;
          effectiveRightExpression = self->_effectiveRightExpression;
          v15 = -[NSPredicate comparisonPredicateModifier](self->super._predicate, "comparisonPredicateModifier");
          if (-[NSExpression expressionType](v13, "expressionType") == NSConstantValueExpressionType
            && ((v38 = -[NSExpression constantValue](v13, "constantValue")) == 0
             || objc_msgSend(MEMORY[0x1E0C99E38], "null") == v38)
            || -[NSExpression expressionType](effectiveRightExpression, "expressionType") == NSConstantValueExpressionType
            && ((v39 = -[NSExpression constantValue](effectiveRightExpression, "constantValue")) == 0
             || objc_msgSend(MEMORY[0x1E0C99E38], "null") == v39))
          {
            v40 = (void *)MEMORY[0x1E0C99DA0];
            v41 = *MEMORY[0x1E0C99778];
            v42 = CFSTR("illegal comparison with NULL");
            goto LABEL_48;
          }
          if (-[NSPredicate options](self->super._predicate, "options"))
            goto LABEL_103;
          if (!self->_comparisonPredicateScopedItem)
            self->_comparisonPredicateScopedItem = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (-[NSExpression expressionType](v13, "expressionType") == NSKeyPathExpressionType
            && (v17 = -[NSExpression expressionType](effectiveRightExpression, "expressionType"), v16 = v13, !v17)
            || -[NSExpression expressionType](effectiveRightExpression, "expressionType", v16) == NSKeyPathExpressionType
            && (v18 = -[NSExpression expressionType](v13, "expressionType"), v16 = effectiveRightExpression, !v18))
          {
            -[NSMutableArray addObject:](self->_comparisonPredicateScopedItem, "addObject:", v16);
            v19 = 1;
          }
          else
          {
            v19 = 0;
          }
          v53 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v13, v15 == 2, a3);
          if (!v53)
            goto LABEL_105;
          v9 = v53;
          v54 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, effectiveRightExpression, v15 == 2, a3);
          if (v54)
          {
            v55 = v54;
            v56 = -[NSSQLSimpleWhereIntermediate _sqlTokenForPredicateOperator:inContext:](-[NSPredicate predicateOperatorType](self->super._predicate, "predicateOperatorType"), a3);
            if (v56)
              goto LABEL_143;

          }
          else
          {

          }
          goto LABEL_105;
        case 4:
        case 5:
          if (-[NSPredicate predicateOperatorType](self->super._predicate, "predicateOperatorType") == 5)
            v33 = CFSTR("IS NOT NULL");
          else
            v33 = CFSTR("IS NULL");
          v34 = self->_effectiveLeftExpression;
          v35 = self->_effectiveRightExpression;
          v36 = -[NSPredicate comparisonPredicateModifier](self->super._predicate, "comparisonPredicateModifier");
          if (-[NSExpression expressionType](v34, "expressionType"))
          {
            v37 = 0;
          }
          else
          {
            v47 = -[NSExpression constantValue](v34, "constantValue");
            if (v47)
              v37 = objc_msgSend(MEMORY[0x1E0C99E38], "null") == v47;
            else
              v37 = 1;
          }
          if (-[NSExpression expressionType](v35, "expressionType"))
          {
            v57 = 0;
          }
          else
          {
            v58 = -[NSExpression constantValue](v35, "constantValue");
            if (!v58)
            {
              if (v37)
                v60 = v35;
              else
                v60 = v34;
LABEL_122:
              v70 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v60, v36 == 2, a3);
              if (v70)
              {
                v71 = v70;
                -[NSSQLIntermediate promoteJoinsInKeypathsForExpression:]((uint64_t)self, v60);
                v9 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v71);
                -[__CFString appendString:](v9, "appendString:", CFSTR(" "));
                -[__CFString appendString:](v9, "appendString:", v33);

                if (v9)
                  goto LABEL_110;
              }
              goto LABEL_105;
            }
            v57 = objc_msgSend(MEMORY[0x1E0C99E38], "null") == v58;
          }
          v59 = v37 || v57;
          if (v37)
            v60 = v35;
          else
            v60 = v34;
          if (v59 != 1)
          {
            if (-[NSPredicate options](self->super._predicate, "options"))
            {
LABEL_103:
              v21 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLType3InContext:]((uint64_t)self, a3);
              goto LABEL_104;
            }
            if (!self->_comparisonPredicateScopedItem)
              self->_comparisonPredicateScopedItem = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            if (-[NSExpression expressionType](v34, "expressionType") == NSKeyPathExpressionType
              && (v66 = -[NSExpression expressionType](v35, "expressionType"), v65 = v34, !v66)
              || -[NSExpression expressionType](v35, "expressionType", v65) == NSKeyPathExpressionType
              && (v67 = -[NSExpression expressionType](v34, "expressionType"), v65 = v35, !v67))
            {
              -[NSMutableArray addObject:](self->_comparisonPredicateScopedItem, "addObject:", v65);
              v68 = v36 == 2;
              v79 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v34, v68, a3);
              if (v79)
              {
                v9 = v79;
                v19 = 1;
                goto LABEL_141;
              }
              -[NSMutableArray removeLastObject](self->_comparisonPredicateScopedItem, "removeLastObject");
            }
            else
            {
              v68 = v36 == 2;
              v69 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v34, v68, a3);
              if (v69)
              {
                v9 = v69;
                v19 = 0;
LABEL_141:
                v80 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v35, v68, a3);
                if (v80)
                {
                  v55 = v80;
                  v56 = -[NSSQLSimpleWhereIntermediate _sqlTokenForPredicateOperator:inContext:](-[NSPredicate predicateOperatorType](self->super._predicate, "predicateOperatorType"), a3);
                  if (v56)
                  {
LABEL_143:
                    v81 = v56;
                    -[__CFString appendString:](v9, "appendString:", CFSTR(" "));
                    -[__CFString appendString:](v9, "appendString:", v81);
                    -[__CFString appendString:](v9, "appendString:", CFSTR(" "));
                    -[__CFString appendString:](v9, "appendString:", v55);

                    if (v19)
                      -[NSMutableArray removeLastObject](self->_comparisonPredicateScopedItem, "removeLastObject");
                    goto LABEL_110;
                  }
                  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate SQL for predicate (%@) (problem with operator)"), self->super._predicate), 0), CFSTR("NSUnderlyingException"));

                  if (v19)
                    -[NSMutableArray removeLastObject](self->_comparisonPredicateScopedItem, "removeLastObject");
                  goto LABEL_105;
                }

                if (v19)
                  -[NSMutableArray removeLastObject](self->_comparisonPredicateScopedItem, "removeLastObject");
                if (objc_msgSend(a3, "objectForKey:", CFSTR("LastKeyPathWasTransientProperty"))
                  || objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
                {
                  goto LABEL_105;
                }
                v83 = (void *)MEMORY[0x1E0C99DA0];
                v84 = *MEMORY[0x1E0C99778];
                v85 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate SQL for predicate (%@) (problem on RHS)"), self->super._predicate);
LABEL_173:
                v42 = (const __CFString *)v85;
                v40 = v83;
                v41 = v84;
LABEL_48:
                v43 = 0;
                goto LABEL_57;
              }
            }
            if (objc_msgSend(a3, "objectForKey:", CFSTR("LastKeyPathWasTransientProperty"))
              || objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
            {
              goto LABEL_105;
            }
            v83 = (void *)MEMORY[0x1E0C99DA0];
            v84 = *MEMORY[0x1E0C99778];
            v85 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate SQL for predicate (%@) (problem on LHS)"), self->super._predicate);
            goto LABEL_173;
          }
          goto LABEL_122;
        case 6:
          v44 = CFSTR(" NSCoreDataMatches(");
          goto LABEL_54;
        case 7:
          v44 = CFSTR(" NSCoreDataLike(");
LABEL_54:
          v21 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLForMatchingOperator:inContext:]((uint64_t)self, v44, a3);
          goto LABEL_104;
        case 8:
          v21 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLBeginsWithStringInContext:]((uint64_t)self, a3);
          goto LABEL_104;
        case 9:
          v21 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLSubstringWildStart:wildEnd:inContext:]((uint64_t)self, 1, 0, a3);
          goto LABEL_104;
        case 10:
          goto LABEL_27;
        default:
          goto LABEL_56;
      }
    }
    if (v5 != 99)
    {
      if (v5 == 100)
      {
        v21 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLBetweenStringInContext:]((uint64_t)self, a3);
      }
      else
      {
        if (v5 != 2000)
        {
LABEL_56:
          v45 = (void *)MEMORY[0x1E0C99DA0];
          v46 = *MEMORY[0x1E0C99778];
          v43 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", self->super._predicate, CFSTR("predicate"));
          v42 = CFSTR("Unknown/unsupported comparison predicate operator type");
          v40 = v45;
          v41 = v46;
LABEL_57:
          objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v40, "exceptionWithName:reason:userInfo:", v41, v42, v43), CFSTR("NSUnderlyingException"));
          goto LABEL_105;
        }
        v21 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLBoundByStringInContext:]((uint64_t)self, a3);
      }
LABEL_104:
      v9 = v21;
      if (!v21)
      {
LABEL_105:
        if (objc_msgSend(a3, "objectForKey:", CFSTR("LastKeyPathWasTransientProperty")))
        {
          objc_msgSend(a3, "removeObjectForKey:", CFSTR("NSUnderlyingException"));
          objc_msgSend(a3, "removeObjectForKey:", CFSTR("LastKeyPathWasTransientProperty"));
        }
        else if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
        {
          v61 = (void *)MEMORY[0x1E0C99DA0];
          v62 = *MEMORY[0x1E0C99778];
          v63 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate where clause for predicate (%@) (unknown problem)"), self->super._predicate);
          objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v61, "exceptionWithName:reason:userInfo:", v62, v63, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", self->super._predicate, CFSTR("predicate"))), CFSTR("NSUnderlyingException"));
        }
        v9 = 0;
      }
LABEL_110:
      v64 = *(int *)(v12 + 1408);

      *(Class *)((char *)&self->super.super.super.isa + v64) = 0;
      objc_msgSend(a3, "setValue:forKey:", 0, CFSTR("entitySpecificationKeypath"));
      objc_msgSend(a3, "setValue:forKey:", 0, CFSTR("entitySpecificationKeypathContainsToMany"));
      objc_msgSend(a3, "setValue:forKey:", 0, CFSTR("generatePairs"));
      return v9;
    }
LABEL_27:
    v22 = -[NSPredicate predicateOperatorType](self->super._predicate, "predicateOperatorType");
    v23 = -[NSPredicate comparisonPredicateModifier](self->super._predicate, "comparisonPredicateModifier");
    v24 = self->_effectiveLeftExpression;
    v25 = self->_effectiveRightExpression;
    if (!self->_comparisonPredicateScopedItem)
      self->_comparisonPredicateScopedItem = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v22 == 99)
      v26 = v25;
    else
      v26 = v24;
    if (v22 != 99)
      v24 = v25;
    v27 = -[NSExpression expressionType](v26, "expressionType");
    v28 = -[NSExpression expressionType](v24, "expressionType");
    if (v28 == 2)
    {
      v29 = -[NSExpression variable](v24, "variable");
      v30 = (NSExpression *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("substitutionVariables")), "objectForKey:", v29);
      if (v30)
      {
        v31 = v30;
        v128 = v29;
        v32 = -[NSExpression expressionType](v30, "expressionType");
        v127 = objc_msgSend(a3, "objectForKey:", CFSTR("duringPrefetching")) != 0;
        v24 = v31;
      }
      else
      {
        v128 = 0;
        v127 = 0;
        v32 = 2;
      }
      v12 = 0x1ECD87000uLL;
    }
    else
    {
      v32 = v28;
      v128 = 0;
      v127 = 0;
    }
    if (v27 >= 5
      && (objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v26) & 1) == 0
      && (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v26) & 1) == 0
      && !-[NSSQLIntermediate isSimpleNoIndexFunction:]((uint64_t)self, v26))
    {
      v9 = 0;
      v49 = CFSTR("unimplemented SQL generation for predicate : (%@) (bad LHS)");
LABEL_75:
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v49, self->super._predicate), 0), CFSTR("NSUnderlyingException"));
      if (!v9)
        goto LABEL_105;
      goto LABEL_110;
    }
    v48 = (unint64_t)v32 > 0x32 || ((1 << v32) & 0x400000000600DLL) == 0;
    if (v48
      && (objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v26) & 1) == 0
      && (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v24) & 1) == 0
      && !-[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:]((_BOOL8)self, v24))
    {
      v9 = 0;
      v49 = CFSTR("unimplemented SQL generation for predicate : (%@) (bad RHS)");
      goto LABEL_75;
    }
    if ((v27 == 3 || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v26))
      && (v32 == 3 || (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v24) & 1) != 0))
    {
      v9 = 0;
      v49 = CFSTR("unimplemented SQL generation for predicate : (%@) (LHS and RHS both keypaths)");
      goto LABEL_75;
    }
    -[NSMutableArray addObject:](self->_comparisonPredicateScopedItem, "addObject:", v26);
    if (v32 > 13)
    {
      if (v32 == 50)
        goto LABEL_134;
      if (v32 == 14)
      {
        v50 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v26, v23 == 2, a3);
        v9 = v50;
        if (v50)
        {
          -[__CFString appendString:](v50, "appendString:", CFSTR(" IN "));
          v51 = -[NSSQLIntermediate _generateSQLForExpressionCollection:allowToMany:inContext:](self, -[NSExpression constantValue](v24, "constantValue"), 0, a3);
          if (v51)
          {
LABEL_137:
            v78 = v51;
            -[__CFString appendString:](v9, "appendString:", v51);

LABEL_195:
            LODWORD(v52) = 1;
            goto LABEL_223;
          }
          goto LABEL_85;
        }
        goto LABEL_222;
      }
LABEL_133:
      if (-[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:]((_BOOL8)self, v24))
      {
LABEL_134:
        v74 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v26, v23 == 2, a3);
        v9 = v74;
        if (v74)
        {
          -[__CFString appendString:](v74, "appendString:", CFSTR(" IN "));
          v75 = self;
          v76 = v24;
          v77 = 1;
          goto LABEL_136;
        }
LABEL_222:
        LODWORD(v52) = 0;
        goto LABEL_223;
      }
      if (((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v26) & 1) != 0
         || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v26))
        && !-[NSSQLIntermediate keypathExpressionIsSafeLHSForIn:](self->super.super._scope, "keypathExpressionIsSafeLHSForIn:", v26))
      {
        goto LABEL_86;
      }
      if (v27 || v32 == 2)
      {
        if (v27 || v32 != 2)
        {
          v110 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v24, 1, a3);
          v9 = v110;
          if (!v110)
            goto LABEL_222;
          -[__CFString appendString:](v110, "appendString:", CFSTR(" = "));
          v75 = self;
          v76 = v26;
          v77 = v23 == 2;
        }
        else
        {
          v101 = -[NSExpression constantValue](v26, "constantValue");
          if (objc_msgSend(v101, "isNSString"))
          {
            LODWORD(v52) = 1;
            v9 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLForString:expressionPath:wildStart:wildEnd:allowToMany:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v101, v24, 1, 1, 1, a3);
            goto LABEL_223;
          }
          v111 = -[NSSQLIntermediate _generateSQLForVariableExpression:allowToMany:inContext:](self, "_generateSQLForVariableExpression:allowToMany:inContext:", v24, 0, a3);
          v9 = v111;
          if (!v111)
            goto LABEL_222;
          -[__CFString appendString:](v111, "appendString:", CFSTR(" = "));
          v75 = self;
          v76 = v26;
          v77 = 0;
        }
LABEL_136:
        v51 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](v75, v76, v77, a3);
        if (v51)
          goto LABEL_137;
LABEL_85:

LABEL_86:
        LODWORD(v52) = 0;
        goto LABEL_87;
      }
      -[NSMutableArray addObject:](self->_comparisonPredicateScopedItem, "addObject:", v24);
      if (v32 == 3)
        v82 = -[NSExpression keyPath](v24, "keyPath");
      else
        v82 = objc_msgSend(-[NSArray objectAtIndex:](-[NSExpression arguments](v24, "arguments"), "objectAtIndex:", 0), "constantValue");
      v103 = (void *)v82;
      v104 = -[NSExpression constantValue](v26, "constantValue");
      if (objc_msgSend(v103, "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v105 = -[NSSQLIntermediate governingEntityForKeypathExpression:](self, "governingEntityForKeypathExpression:", v24);
        if (v105)
        {
          v9 = (__CFString *)objc_msgSend(v105[5], "objectForKey:", v103);
          v106 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("explicitRestrictingEntityQualifier"));
          if (v9)
            goto LABEL_214;
        }
        else
        {
          v106 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("explicitRestrictingEntityQualifier"));
        }
        v107 = v106;
        if (objc_msgSend(v106, "count"))
        {
          v108 = objc_msgSend(v107, "lastObject");
          if (v108)
          {
            v9 = (__CFString *)objc_msgSend(*(id *)(v108 + 40), "objectForKey:", v103);
            objc_msgSend(v107, "removeLastObject");
            if (v9)
            {
LABEL_214:
              if (LOBYTE(v9->length) == 9)
              {
                v109 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLForConst:inManyToMany:expression:inContext:](self, (uint64_t)v104, v9, (uint64_t)v24, a3);
LABEL_259:
                v9 = v109;
                goto LABEL_260;
              }
              if (!-[__CFString isToMany](v9, "isToMany"))
              {
                if (LOBYTE(v9->length) == 1)
                {
                  v109 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLForConst:inAttribute:expression:inContext:]((uint64_t)self, (uint64_t)v104, (uint64_t)v24, (uint64_t)a3);
                  goto LABEL_259;
                }
                goto LABEL_254;
              }
LABEL_258:
              v109 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLForConst:inToMany:inContext:](self, (uint64_t)v104, v9, a3);
              goto LABEL_259;
            }
          }
          else
          {
            objc_msgSend(v107, "removeLastObject");
          }
        }
        v9 = 0;
        if ((objc_msgSend(0, "isToMany") & 1) != 0)
          goto LABEL_258;
      }
      else
      {
        if (objc_msgSend(v104, "isNSString"))
        {
          LODWORD(v52) = 1;
          v9 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLForString:expressionPath:wildStart:wildEnd:allowToMany:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v104, v24, 1, 1, 1, a3);
LABEL_262:
          -[NSMutableArray removeLastObject](self->_comparisonPredicateScopedItem, "removeLastObject");
          goto LABEL_223;
        }
        v112 = -[NSSQLIntermediate _generateSQLForKeyPathExpression:allowToMany:inContext:](self, "_generateSQLForKeyPathExpression:allowToMany:inContext:", v24, 1, a3);
        v9 = v112;
        if (v112)
        {
          -[__CFString appendString:](v112, "appendString:", CFSTR(" = "));
          v113 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v26, 0, a3);
          if (v113)
          {
            v114 = v113;
            -[__CFString appendString:](v9, "appendString:", v113);

LABEL_260:
            LODWORD(v52) = 1;
            goto LABEL_262;
          }

LABEL_254:
          LODWORD(v52) = 0;
          v9 = 0;
          goto LABEL_262;
        }
      }
      LODWORD(v52) = 0;
      goto LABEL_262;
    }
    if (v32)
    {
      if (v32 == 13)
        goto LABEL_134;
      goto LABEL_133;
    }
    v72 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v26, v23 == 2, a3);
    v9 = v72;
    if (!v72)
      goto LABEL_222;
    -[__CFString appendString:](v72, "appendString:", CFSTR(" IN "));
    if (-[NSExpression expressionType](v26, "expressionType") == NSEvaluatedObjectExpressionType)
    {
      v73 = (void *)objc_msgSend((id)objc_msgSend(-[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate"), "governingEntity"), "entityDescription");
    }
    else if (objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v26)
           && (v86 = (void *)-[NSExpression predicateFormat](v26, "predicateFormat"),
               v73 = (void *)objc_msgSend(-[NSSQLIntermediate governingEntityForKeypathExpression:](self, "governingEntityForKeypathExpression:", v26), "entityDescription"), v87 = (void *)objc_msgSend(v86, "componentsSeparatedByString:", CFSTR(".")), (v88 = objc_msgSend(v87, "count")) != 0))
    {
      v89 = 0;
      obj = (char *)(v88 - 1);
      while (1)
      {
        v90 = objc_msgSend(v87, "objectAtIndex:", v89);
        v91 = v73 ? (void *)objc_msgSend((id)objc_msgSend(v73, "propertiesByName"), "objectForKey:", v90) : 0;
        v92 = objc_msgSend(v91, "_propertyType");
        v73 = 0;
        if (!v91)
          break;
        if (v92 != 4)
          break;
        v73 = (void *)objc_msgSend(v91, "destinationEntity");
        if (obj == v89)
          break;
        ++v89;
      }
    }
    else
    {
      v73 = 0;
    }
    v93 = v127;
    v94 = !v127;
    if (v73)
      v94 = 1;
    if ((v94 & 1) == 0)
    {
      v95 = v128;
      if (!objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v26))
        goto LABEL_187;
      v96 = (void *)-[NSExpression predicateFormat](v26, "predicateFormat");
      v97 = -[NSSQLIntermediate governingEntityForKeypathExpression:](self, "governingEntityForKeypathExpression:", v26);
      v98 = objc_msgSend((id)objc_msgSend(v96, "componentsSeparatedByString:", CFSTR(".")), "firstObject");
      if (v97)
        v97 = (id *)objc_msgSend(v97[5], "objectForKey:", v98);
      if (objc_msgSend(v97, "propertyType") != 7 || objc_msgSend(v97, "propertyDescription"))
        goto LABEL_187;
      v73 = (void *)objc_msgSend((id)objc_msgSend(v97, "destinationEntity"), "entityDescription");
    }
    v95 = v128;
    if (v73)
    {
      v99 = -[NSExpression constantValue](v24, "constantValue");
      v12 = 0x1ECD87000;
      if ((int)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("nestingLevel")), "intValue") <= 0
        && ((objc_msgSend(v99, "isNSArray") & 1) != 0
         || (objc_msgSend(v99, "isNSSet") & 1) != 0
         || objc_msgSend(v99, "isNSOrderedSet")))
      {
        obja = v99;
        v102 = objc_msgSend(v99, "count");
        if (v128 || v102 >= 0x64)
        {
          +[_PFRoutines anyObjectFromCollection:]((uint64_t)_PFRoutines, v99);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            obja = (id)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v99);
          v131 = 0u;
          v132 = 0u;
          v129 = 0u;
          v130 = 0u;
          v115 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v129, v133, 16);
          if (v115)
          {
            v116 = v115;
            v117 = *(_QWORD *)v130;
            while (2)
            {
              for (i = 0; i != v116; ++i)
              {
                if (*(_QWORD *)v130 != v117)
                  objc_enumerationMutation(obja);
                v119 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || !objc_msgSend((id)objc_msgSend(v119, "entity"), "isKindOfEntity:", v73))
                {
                  v52 = 0;
                  goto LABEL_251;
                }
              }
              v116 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v129, v133, 16);
              if (v116)
                continue;
              break;
            }
          }
          v120 = (id)objc_msgSend(a3, "objectForKey:", CFSTR("bindIntarrays"));
          if (!v120)
          {
            v120 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(a3, "setObject:forKey:", v120, CFSTR("bindIntarrays"));

          }
          v121 = objc_msgSend(v120, "count");
          v122 = -[NSSQLBindIntarray initWithValue:]([NSSQLBindIntarray alloc], "initWithValue:", obja);
          -[NSSQLBindIntarray setTableName:](v122, "setTableName:", -[NSSQLAliasGenerator generateTempTableName](objc_msgSend(a3, "objectForKey:", CFSTR("aliasGenerator"))));
          v123 = objc_msgSend(v120, "count");
          objc_msgSend(v120, "addObject:", v122);
          -[NSSQLBindIntarray setIndex:](v122, "setIndex:", v123);

          if (v128)
          {
            v124 = (id)objc_msgSend(a3, "objectForKey:", CFSTR("bindIntarraysSubstitutionOrder"));
            if (!v124)
            {
              v124 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(a3, "setObject:forKey:", v124, CFSTR("bindIntarraysSubstitutionOrder"));

            }
            objc_msgSend(v124, "addObject:", v128);
            objc_msgSend(v124, "addObject:", v73);
            objc_msgSend(v124, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v121));
          }
          v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("(SELECT * FROM %@) "), -[NSSQLBindIntarray tableName](v122, "tableName"));
LABEL_251:
          v12 = 0x1ECD87000;
        }
        else
        {
          v52 = 0;
        }
        v95 = v128;
        v93 = v127;
      }
      else
      {
        v52 = 0;
      }
      goto LABEL_188;
    }
LABEL_187:
    v52 = 0;
    v12 = 0x1ECD87000;
LABEL_188:
    if (v52)
      v100 = 1;
    else
      v100 = v93;
    if ((v100 & 1) == 0)
      v52 = (void *)-[NSSQLIntermediate _generateSQLForConstantCollection:reboundFrom:inContext:]((uint64_t)self, -[NSExpression constantValue](v24, "constantValue"), v95, a3);
    if (v52)
    {
      -[__CFString appendString:](v9, "appendString:", v52);

      goto LABEL_195;
    }

LABEL_87:
    v9 = 0;
LABEL_223:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *(int *)(v12 + 1408)), "removeLastObject");
    v49 = CFSTR("unimplemented SQL generation for predicate : (%@)");
    if ((_DWORD)v52 && v9)
      goto LABEL_110;
    goto LABEL_75;
  }
  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  v8 = CFSTR("ALL modifier is not implemented");
LABEL_4:
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0), CFSTR("NSUnderlyingException"));
  return 0;
}

- (__CFString)_sqlTokenForPredicateOperator:(unint64_t)a1 inContext:(void *)a2
{
  if (!objc_msgSend(a2, "objectForKey:", CFSTR("NSUnderlyingException")))
  {
    if (a1 < 6)
      return off_1E1EE0430[a1];
    objc_msgSend(a2, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unknown predicate operator type parameter"), 0), CFSTR("NSUnderlyingException"));
  }
  return 0;
}

- (id)_generateSQLType3InContext:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = objc_msgSend(*(id *)(a1 + 16), "comparisonPredicateModifier");
  v7 = objc_msgSend(*(id *)(a1 + 16), "options");
  v8 = objc_msgSend(*(id *)(a1 + 16), "predicateOperatorType");
  if (!*(_QWORD *)(a1 + 24))
    *(_QWORD *)(a1 + 24) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "expressionType") == 3 && (v10 = objc_msgSend(v5, "expressionType"), v9 = v4, !v10)
    || objc_msgSend(v5, "expressionType", v9) == 3 && (v11 = objc_msgSend(v4, "expressionType"), v9 = v5, !v11))
  {
    objc_msgSend(*(id *)(a1 + 24), "addObject:", v9);
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  v13 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]((void *)a1, v4, v6 == 2, a2);
  if (!v13)
    return 0;
  v14 = v13;
  v15 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]((void *)a1, v5, v6 == 2, a2);
  if (!v15)
  {

    return 0;
  }
  v16 = v15;
  if ((v7 & 4) != 0)
  {
    v21 = (void *)objc_msgSend(*(id *)(a1 + 16), "predicateOperator");
    v20 = v14;
    objc_msgSend(v20, "appendString:", CFSTR(" "));
    objc_msgSend(v20, "appendString:", objc_msgSend(v21, "symbol"));
    objc_msgSend(v20, "appendString:", CFSTR(" "));
    objc_msgSend(v20, "appendString:", v16);
  }
  else
  {
    v17 = (v7 << 63 >> 63) & 0x101;
    if ((v7 & 2) != 0)
      v17 = (v7 << 63 >> 63) & 1 | 0x180;
    if ((v7 & 8) != 0)
      v18 = v17 | 0x120;
    else
      v18 = v17;
    if (v8 >= 6)
    {
      NSLog((NSString *)CFSTR("You really shouldn't be here"));
      v19 = 7;
    }
    else
    {
      v19 = dword_18A50A2AC[v8];
    }
    v20 = (id)objc_msgSend(CFSTR("NSCoreDataStringCompare("), "mutableCopy");
    objc_msgSend(v20, "appendString:", v14);
    objc_msgSend(v20, "appendString:", CFSTR(" , "));
    objc_msgSend(v20, "appendString:", v16);
    objc_msgSend(v20, "appendFormat:", CFSTR(" , %d, %lu, %d)"), v19, v18, (v7 >> 3) & 1);
  }

  if (v12)
    objc_msgSend(*(id *)(a1 + 24), "removeLastObject");
  return v20;
}

- (void)_generateSQLSubstringWildStart:(int)a3 wildEnd:(void *)a4 inContext:
{
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    if (((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v8) & 1) != 0
       || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v8))
      && !objc_msgSend(v9, "expressionType"))
    {
      v10 = (void *)objc_msgSend(v9, "constantValue");
      if (objc_msgSend(v10, "isNSString"))
        return -[NSSQLSimpleWhereIntermediate _generateSQLForString:expressionPath:wildStart:wildEnd:allowToMany:inContext:]((id *)a1, (uint64_t)v10, v8, a2, a3, objc_msgSend(*(id *)(a1 + 16), "comparisonPredicateModifier") == 2, a4);
    }
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unimplemented SQL generation for predicate (%@)."), *(_QWORD *)(a1 + 16)), 0), CFSTR("NSUnderlyingException"));
  }
  return 0;
}

- (NSSQLSimpleWhereIntermediate)initWithPredicate:(id)a3 inScope:(id)a4
{
  NSSQLSimpleWhereIntermediate *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSSQLSimpleWhereIntermediate;
  v5 = -[NSSQLWhereIntermediate initWithPredicate:inScope:](&v11, sel_initWithPredicate_inScope_, a3, a4);
  if (v5)
  {
    v5->_effectiveLeftExpression = (NSExpression *)(id)objc_msgSend(a3, "leftExpression");
    v5->_effectiveRightExpression = (NSExpression *)(id)objc_msgSend(a3, "rightExpression");
    if (-[NSExpression expressionType](v5->_effectiveLeftExpression, "expressionType") == NSFunctionExpressionType
      && -[NSExpression expressionType](-[NSExpression operand](v5->_effectiveLeftExpression, "operand"), "expressionType") == NSConstantValueExpressionType&& (sel_valueForKey_ == (char *)-[NSExpression selector](v5->_effectiveLeftExpression, "selector")|| sel_valueForKeyPath_ == (char *)-[NSExpression selector](v5->_effectiveLeftExpression, "selector")))
    {
      v6 = -[NSExpression expressionValueWithObject:context:](v5->_effectiveLeftExpression, "expressionValueWithObject:context:", 0, 0);
      v7 = (void *)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v6);

      v5->_effectiveLeftExpression = (NSExpression *)v7;
    }
    if (-[NSExpression expressionType](v5->_effectiveRightExpression, "expressionType") == NSFunctionExpressionType
      && -[NSExpression expressionType](-[NSExpression operand](v5->_effectiveRightExpression, "operand"), "expressionType") == NSConstantValueExpressionType&& (sel_valueForKey_ == (char *)-[NSExpression selector](v5->_effectiveRightExpression, "selector")|| sel_valueForKeyPath_ == (char *)-[NSExpression selector](v5->_effectiveRightExpression, "selector")))
    {
      v8 = -[NSExpression expressionValueWithObject:context:](v5->_effectiveRightExpression, "expressionValueWithObject:context:", 0, 0);
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v8);

      v5->_effectiveRightExpression = (NSExpression *)v9;
    }
  }
  return v5;
}

- (id)_generateSQLBeginsWithStringInContext:(uint64_t)a1
{
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  NSSQLSimpleWhereIntermediate *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 16), "predicateOperator");
  if (objc_msgSend(*(id *)(a1 + 40), "expressionType")
    || (objc_msgSend(v4, "options") & 4) == 0
    || (v5 = (__CFString *)objc_msgSend(*(id *)(a1 + 40), "constantValue"),
        !-[__CFString isNSString](v5, "isNSString"))
    || (v6 = -[NSSQLSimpleWhereIntermediate _upperBoundSearchStringForString:context:](v5, a2)) == 0)
  {
    v9 = 0;
    goto LABEL_11;
  }
  v7 = (void *)v6;
  v8 = -[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]([NSSQLSimpleWhereIntermediate alloc], "initWithPredicate:inScope:", objc_msgSend(MEMORY[0x1E0CB3518], "predicateWithLeftExpression:rightExpression:modifier:type:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 16), "comparisonPredicateModifier"), 3, 0), a1);
  v9 = -[NSSQLSimpleWhereIntermediate generateSQLStringInContext:](v8, "generateSQLStringInContext:", a2);

  if (v9)
  {
    v10 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]((void *)a1, (void *)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v7), 0, a2);
    if (!v10)
    {
      v13 = v9;
      v9 = 0;
      goto LABEL_18;
    }
    v11 = v10;
    v12 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "rangeOfString:", CFSTR(">")) - 1);
    objc_msgSend(v9, "appendString:", CFSTR(" AND "));
    objc_msgSend(v9, "appendString:", v12);
    objc_msgSend(v9, "appendString:", CFSTR(" < "));
    objc_msgSend(v9, "appendString:", v11);

  }
  v13 = 0;
LABEL_18:

LABEL_11:
  if (objc_msgSend(a2, "objectForKey:", CFSTR("NSUnderlyingException")))
  {

    return 0;
  }
  if (v9)
    return v9;
  return -[NSSQLSimpleWhereIntermediate _generateSQLSubstringWildStart:wildEnd:inContext:](a1, 0, 1, a2);
}

- (uint64_t)_upperBoundSearchStringForString:(__CFString *)a1 context:(void *)a2
{
  uint64_t Length;
  uint64_t result;
  int v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UniChar *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  int v19;
  _QWORD v20[2];
  CFRange v21;

  v20[1] = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(a1);
  result = 0;
  if (a1 && Length <= 0x3FFFFFFF)
  {
    if (CFStringGetCharactersPtr(a1))
    {
      v6 = CFStringEncodingUnicodeToBytes();
      if (v6)
      {
        v7 = CFSTR("Unknown error during string conversion");
        if (v6 == 1)
          v7 = CFSTR("Invalid input string");
        v8 = (void *)MEMORY[0x1E0C99DA0];
        v9 = *MEMORY[0x1E0C99778];
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed string (%@)"), v7);
        objc_msgSend(a2, "setValue:forKey:", objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a1, CFSTR("Bad string"))), CFSTR("NSUnderlyingException"));
        return 0;
      }
    }
    else
    {
      MEMORY[0x1E0C80A78]();
      v12 = (UniChar *)((char *)v20 - v11);
      if (Length >= 256)
        v12 = (UniChar *)malloc_type_malloc(4 * Length, 0x9C60114FuLL);
      v21.location = 0;
      v21.length = Length;
      CFStringGetCharacters(a1, v21, v12);
      v13 = CFStringEncodingUnicodeToBytes();
      if (v13)
      {
        if (v13 == 1)
          v14 = CFSTR("Invalid input string");
        else
          v14 = CFSTR("Unknown error during string conversion");
        if (Length >= 256)
          free(v12);
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99778];
        v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed string 2 (%@)"), v14);
        objc_msgSend(a2, "setValue:forKey:", objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v17, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a1, CFSTR("Bad string"))), CFSTR("NSUnderlyingException"));
        return 0;
      }
      if (Length >= 256)
        free(v12);
    }
    if (Length < 2)
      v18 = &stru_1E1EE23F0;
    else
      v18 = (const __CFString *)-[__CFString substringToIndex:](a1, "substringToIndex:", Length - 1);
    v19 = -[__CFString characterAtIndex:](a1, "characterAtIndex:", Length - 1);
    result = 0;
    if (v19 != 55295 && v19 != 57343 && v19 != 0xFFFF)
      return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%C"), v18, (unsigned __int16)(v19 + 1));
  }
  return result;
}

- (void)_generateSQLForConst:(__CFString *)a3 inManyToMany:(uint64_t)a4 expression:(void *)a5 inContext:
{
  void *v10;
  _QWORD *v11;
  void *v12;
  NSSQLForeignKeyIntermediate *v14;
  id v15;
  void *v16;

  if (objc_msgSend(a1, "isUpdateScoped"))
  {
    objc_msgSend(a5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported join (not allowed in updates): %@"), a4), 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", -[__CFString name](a3, "name"), 0);
  v11 = +[NSSQLJoinIntermediate createJoinIntermediatesForKeypath:startEntity:startAlias:forScope:inStatementIntermediate:inContext:]((uint64_t)NSSQLJoinIntermediate, v10, -[__CFString entity](a3, "entity"), (void *)objc_msgSend(a1, "governingAlias"), a1, objc_msgSend(a1, "fetchIntermediateForKeypathExpression:", a4), a5);

  if (objc_msgSend(a5, "objectForKey:", CFSTR("NSUnderlyingException")))
  {

    return 0;
  }
  v14 = -[NSSQLForeignKeyIntermediate initWithConstantValue:inScope:]([NSSQLForeignKeyIntermediate alloc], "initWithConstantValue:inScope:", a2, a1);
  v15 = -[NSSQLForeignKeyIntermediate generateSQLStringInContext:](v14, "generateSQLStringInContext:", a5);
  if (v11)
    v16 = (void *)v11[5];
  else
    v16 = 0;
  v12 = (void *)objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v12, "appendString:", CFSTR("."));
  objc_msgSend(v12, "appendString:", -[NSSQLManyToMany inverseColumnName](a3));
  objc_msgSend(v12, "appendString:", CFSTR(" = "));
  objc_msgSend(v12, "appendString:", v15);

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  self->_comparisonPredicateScopedItem = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLSimpleWhereIntermediate;
  -[NSSQLSimpleWhereIntermediate dealloc](&v3, sel_dealloc);
}

- (void)_generateSQLForString:(void *)a3 expressionPath:(int)a4 wildStart:(int)a5 wildEnd:(uint64_t)a6 allowToMany:(void *)a7 inContext:
{
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  NSSQLConstantValueIntermediate *v21;
  id v22;

  v14 = objc_msgSend((id)objc_msgSend(a1[2], "predicateOperator"), "options");
  v15 = v14;
  if ((v14 & 4) != 0)
  {
    v17 = 2;
    if (!a5)
      goto LABEL_12;
  }
  else
  {
    v16 = (v14 << 63 >> 63) & 0x101;
    if ((v14 & 2) != 0)
      v16 = (v14 << 63 >> 63) & 1 | 0x180;
    if ((v14 & 8) != 0)
      v17 = v16 | 0x120;
    else
      v17 = v16;
    if (!a5)
      goto LABEL_12;
  }
  if ((a4 & 1) == 0)
  {
    v17 |= 8uLL;
    goto LABEL_18;
  }
LABEL_12:
  if (!a4 || (a5 & 1) != 0)
  {
    if ((a4 & 1) == 0 && (a5 & 1) == 0)
    {
      objc_msgSend(a7, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unimplemented SQL generatio for predicate (%@)"), a1[2]), 0), CFSTR("NSUnderlyingException"));
      return 0;
    }
  }
  else
  {
    v17 |= 0xCuLL;
  }
LABEL_18:
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" NSCoreDataStringSearch("));
  if (objc_msgSend(a3, "expressionType") == 2)
    v19 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, a3, a6, a7);
  else
    v19 = (id)objc_msgSend(a1, "_generateSQLForKeyPathExpression:allowToMany:inContext:", a3, a6, a7);
  v20 = v19;
  if (!v19)
  {

    return 0;
  }
  objc_msgSend(v18, "appendString:", v19);

  objc_msgSend(v18, "appendString:", CFSTR(", "));
  v21 = -[NSSQLConstantValueIntermediate initWithConstantValue:ofType:inScope:context:]([NSSQLConstantValueIntermediate alloc], "initWithConstantValue:ofType:inScope:context:", a2, 5, a1, a7);
  v22 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v21, "generateSQLStringInContext:", a7);
  objc_msgSend(v18, "appendString:", v22);

  objc_msgSend(v18, "appendString:", CFSTR(", "));
  objc_msgSend(v18, "appendFormat:", CFSTR("%lu, %u)"), v17, (v15 >> 3) & 1);
  return v18;
}

- (BOOL)isWhereScoped
{
  return 1;
}

- (void)_generateSQLForMatchingOperator:(void *)a3 inContext:
{
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v16;
  uint64_t v17;
  void *v18;
  NSSQLConstantValueIntermediate *v19;
  id v20;

  if (!a1)
    return 0;
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v6) & 1) == 0
    && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v6))
  {
    goto LABEL_12;
  }
  if (!objc_msgSend(v7, "expressionType"))
  {
    v14 = (void *)objc_msgSend(v7, "constantValue");
    if ((objc_msgSend(v14, "isNSString") & 1) != 0 || !v14)
    {
      v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "predicateOperator"), "options");
      v17 = objc_msgSend((id)a1, "_generateSQLForKeyPathExpression:allowToMany:inContext:", v6, objc_msgSend(*(id *)(a1 + 16), "comparisonPredicateModifier") == 2, a3);
      if (v17)
      {
        v18 = (void *)v17;
        v11 = (void *)objc_msgSend(a2, "mutableCopy");
        objc_msgSend(v11, "appendString:", v18);

        v19 = -[NSSQLConstantValueIntermediate initWithConstantValue:ofType:inScope:context:]([NSSQLConstantValueIntermediate alloc], "initWithConstantValue:ofType:inScope:context:", v14, 5, a1, a3);
        v20 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v19, "generateSQLStringInContext:", a3);
        objc_msgSend(v11, "appendString:", CFSTR(", "));
        objc_msgSend(v11, "appendString:", v20);
        objc_msgSend(v11, "appendString:", CFSTR(", "));
        objc_msgSend(v11, "appendFormat:", CFSTR("%lu) "), v16 & 3);

        return v11;
      }
      return 0;
    }
    goto LABEL_12;
  }
  if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v7) & 1) == 0
    && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v7))
  {
LABEL_12:
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unimplemented SQL generation for predicate (%@)"), *(_QWORD *)(a1 + 16)), 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "predicateOperator"), "options");
  v9 = objc_msgSend((id)a1, "_generateSQLForKeyPathExpression:allowToMany:inContext:", v6, objc_msgSend(*(id *)(a1 + 16), "comparisonPredicateModifier") == 2, a3);
  if (!v9)
    return 0;
  v10 = (void *)v9;
  v11 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v11, "appendString:", v10);

  v12 = objc_msgSend((id)a1, "_generateSQLForKeyPathExpression:allowToMany:inContext:", v7, 0, a3);
  if (!v12)
  {

    return 0;
  }
  v13 = (void *)v12;
  objc_msgSend(v11, "appendString:", CFSTR(", "));
  objc_msgSend(v11, "appendString:", v13);
  objc_msgSend(v11, "appendString:", CFSTR(", "));
  objc_msgSend(v11, "appendFormat:", CFSTR("%lu) "), v8 & 3);

  return v11;
}

- (id)_generateSQLForConst:(_QWORD *)a3 inToMany:(void *)a4 inContext:
{
  id v8;
  NSSQLKeypathExpressionIntermediate *v9;
  void *v10;
  _QWORD *v11;
  NSSQLKeypathExpressionIntermediate *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSSQLForeignKeyIntermediate *v16;
  id v17;

  if (objc_msgSend(a1, "isUpdateScoped"))
  {
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported clause (not allowed in updates): %@."), a1[4]), 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  else
  {
    v9 = [NSSQLKeypathExpressionIntermediate alloc];
    v10 = (void *)MEMORY[0x1E0CB35D0];
    v11 = (_QWORD *)objc_msgSend(a3, "entity");
    if (v11)
      v11 = (_QWORD *)v11[16];
    v12 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:](v9, "initWithExpression:allowToMany:inScope:", objc_msgSend(v10, "expressionForKeyPath:", objc_msgSend(v11, "name")), 0, a1);
    v8 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v12, "generateSQLStringInContext:", a4);

    if (v8)
    {
      objc_msgSend(v8, "appendString:", CFSTR(" IN (SELECT "));
      if (a3)
        v13 = (void *)a3[7];
      else
        v13 = 0;
      v14 = objc_msgSend(a3, "destinationEntity");
      objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(v13, "foreignKey"), "columnName"));
      objc_msgSend(v8, "appendString:", CFSTR(" FROM "));
      objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(v13, "entity"), "tableName"));
      objc_msgSend(v8, "appendString:", CFSTR(" WHERE "));
      if (v14)
        v15 = *(void **)(v14 + 128);
      else
        v15 = 0;
      objc_msgSend(v8, "appendString:", objc_msgSend(v15, "columnName"));
      v16 = -[NSSQLForeignKeyIntermediate initWithConstantValue:inScope:]([NSSQLForeignKeyIntermediate alloc], "initWithConstantValue:inScope:", a2, a1);
      v17 = -[NSSQLForeignKeyIntermediate generateSQLStringInContext:](v16, "generateSQLStringInContext:", a4);
      objc_msgSend(v8, "appendString:", CFSTR(" = "));
      objc_msgSend(v8, "appendString:", v17);
      objc_msgSend(v8, "appendString:", CFSTR(") "));

    }
  }
  return v8;
}

- (void)_generateSQLForConst:(uint64_t)a1 inAttribute:(uint64_t)a2 expression:(uint64_t)a3 inContext:(uint64_t)a4
{
  NSSQLKeypathExpressionIntermediate *v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSSQLForeignKeyIntermediate *v14;
  id v15;

  v7 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLKeypathExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", a3, 0, a1);
  v8 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v7, "generateSQLStringInContext:", a4);

  if (!v8)
    return 0;
  v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "predicateOperator"), "options");
  v10 = v9;
  v11 = (v9 << 63 >> 63) & 0x101;
  if ((v9 & 2) != 0)
    v11 = (v9 << 63 >> 63) & 1 | 0x180;
  if ((v9 & 8) != 0)
    v11 |= 0x120uLL;
  if ((v9 & 4) != 0)
    v12 = 2;
  else
    v12 = v11;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" NSCoreDataStringSearch("));
  objc_msgSend(v13, "appendString:", v8);

  v14 = -[NSSQLForeignKeyIntermediate initWithConstantValue:inScope:]([NSSQLForeignKeyIntermediate alloc], "initWithConstantValue:inScope:", a2, a1);
  v15 = -[NSSQLForeignKeyIntermediate generateSQLStringInContext:](v14, "generateSQLStringInContext:", a4);
  objc_msgSend(v13, "appendString:", CFSTR(", "));
  objc_msgSend(v13, "appendString:", v15);
  objc_msgSend(v13, "appendString:", CFSTR(", "));
  objc_msgSend(v13, "appendFormat:", CFSTR("%lu, %u)"), v12, (v10 >> 3) & 1);

  return v13;
}

- (void)_generateSQLBetweenStringInContext:(uint64_t)a1
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSSQLConstantValueIntermediate *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  NSSQLConstantValueIntermediate *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t i;
  NSSQLConstantValueIntermediate *v32;
  id v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  id v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = objc_msgSend(v3, "expressionType");
  v6 = *(id *)(a1 + 24);
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)(a1 + 24) = v6;
  }
  objc_msgSend(v6, "addObject:", v3);
  if (v5)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v3) & 1) == 0
      && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v3))
    {
      if (v5 != 4 || sel_indexed_by_ != (char *)objc_msgSend(*(id *)(a1 + 32), "selector"))
      {
        objc_msgSend(*(id *)(a1 + 24), "removeLastObject");
        v7 = 0;
        goto LABEL_45;
      }
      v36 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "arguments"), "lastObject");
      v51[0] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "arguments"), "firstObject");
      v37 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v50 = *(_QWORD *)(a1 + 40);
      v38 = -[NSSQLRTreeIndexQueryIntermediate initForIndexNamed:onEntity:properties:ranges:inScope:]([NSSQLRTreeIndexQueryIntermediate alloc], "initForIndexNamed:onEntity:properties:ranges:inScope:", v36, objc_msgSend(*(id *)(a1 + 8), "governingEntity"), v37, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1), *(_QWORD *)(a1 + 8));
      v7 = (void *)objc_msgSend(v38, "generateSQLStringInContext:", a2);

      v34 = *(void **)(a1 + 24);
      goto LABEL_53;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("("));
    v8 = objc_msgSend((id)a1, "_generateSQLForKeyPathExpression:allowToMany:inContext:", v3, 0, a2);
    if (!v8)
    {
LABEL_46:

      return 0;
    }
    v9 = (void *)v8;
    objc_msgSend(v7, "appendString:", v8);

  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("("));
    objc_msgSend(*(id *)(a1 + 24), "addObject:", a1);
    v11 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]([NSSQLConstantValueIntermediate alloc], "initWithConstantValue:inScope:context:", objc_msgSend(v3, "constantValue"), a1, a2);
    v12 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v11, "generateSQLStringInContext:", a2);
    objc_msgSend(v10, "appendString:", v12);

    v7 = v10;
    objc_msgSend(*(id *)(a1 + 24), "removeLastObject");
  }
  objc_msgSend(v7, "appendString:", CFSTR(" BETWEEN "));
  v13 = objc_msgSend(v4, "expressionType");
  if (!v13)
  {
    v25 = (void *)objc_msgSend(v4, "constantValue");
    if (objc_msgSend(v25, "count") != 2)
      goto LABEL_44;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (!v26)
      goto LABEL_44;
    v27 = v26;
    v28 = a1;
    v29 = *(_QWORD *)v41;
    v30 = 1;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(v25);
        v32 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]([NSSQLConstantValueIntermediate alloc], "initWithConstantValue:inScope:context:", objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "constantValue"), v28, a2);
        v33 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v32, "generateSQLStringInContext:", a2);
        objc_msgSend(v7, "appendString:", v33);

        if ((v30 & 1) != 0)
          objc_msgSend(v7, "appendString:", CFSTR(" AND "));
        v30 = 0;
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      v30 = 0;
    }
    while (v27);
    objc_msgSend(v7, "appendString:", CFSTR(")"));
    v34 = *(void **)(v28 + 24);
LABEL_53:
    objc_msgSend(v34, "removeLastObject");
    return v7;
  }
  if (v13 != 14
    || (v14 = (void *)objc_msgSend(v4, "constantValue"), objc_msgSend(v14, "count") != 2)
    || (v46 = 0u,
        v47 = 0u,
        v44 = 0u,
        v45 = 0u,
        (v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16)) == 0))
  {
LABEL_44:
    objc_msgSend(v7, "appendString:", CFSTR(")"));
    objc_msgSend(*(id *)(a1 + 24), "removeLastObject");
LABEL_45:
    objc_msgSend(a2, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unimplemented SQL generation for predicate : (%@)"), *(_QWORD *)(a1 + 16)), 0), CFSTR("NSUnderlyingException"));
    goto LABEL_46;
  }
  v16 = v15;
  v17 = 0;
  v18 = 0;
  v19 = *(_QWORD *)v45;
  do
  {
    for (j = 0; j != v16; ++j)
    {
      if (*(_QWORD *)v45 != v19)
        objc_enumerationMutation(v14);
      v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
      if (objc_msgSend(v21, "expressionType"))
      {
        if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v21) & 1) == 0
          && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v21))
        {
          v17 = -12;
          continue;
        }
        v22 = objc_msgSend((id)a1, "_generateSQLForKeyPathExpression:allowToMany:inContext:", v21, 0, a2);
        if (!v22)
          goto LABEL_46;
        v23 = (NSSQLConstantValueIntermediate *)v22;
        objc_msgSend(v7, "appendString:", v22);
      }
      else
      {
        v23 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]([NSSQLConstantValueIntermediate alloc], "initWithConstantValue:inScope:context:", objc_msgSend(v21, "constantValue"), a1, a2);
        v24 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v23, "generateSQLStringInContext:", a2);
        objc_msgSend(v7, "appendString:", v24);

      }
      if (v17)
      {
        v18 = 1;
      }
      else
      {
        objc_msgSend(v7, "appendString:", CFSTR(" AND "));
        v18 = 1;
        v17 = 1;
      }
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  }
  while (v16);
  objc_msgSend(v7, "appendString:", CFSTR(")"));
  objc_msgSend(*(id *)(a1 + 24), "removeLastObject");
  if (v17 <= 0 && (v18 & 1) == 0)
    goto LABEL_45;
  return v7;
}

- (id)_generateSQLBoundByStringInContext:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSSQLBoundedByIntermediate *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSSQLKeypathExpressionIntermediate *v32;
  NSSQLKeypathExpressionIntermediate *v33;
  void *v34;
  uint64_t v35;

  if (!a1)
    return 0;
  if (objc_msgSend(*(id *)(a1 + 32), "expressionType") != 3)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("Unsupported predicate, LHS of boundedBy: must be a keypath");
    goto LABEL_27;
  }
  v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "keyPath"), "componentsSeparatedByString:", CFSTR("."));
  if (!v4 || (v5 = v4, !objc_msgSend(v4, "count")))
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("Unsupported predicate, LHS of boundedBy: is a bad keypath a keypath");
    goto LABEL_27;
  }
  v6 = (void *)objc_msgSend((id)a1, "governingEntityForKeypathExpression:", *(_QWORD *)(a1 + 32));
  v7 = objc_msgSend(v5, "count");
  v8 = objc_msgSend(v6, "entityDescription");
  if (!v7)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("Unsupported predicate, LHS of boundedBy: can't find location attribute");
LABEL_27:
    v22 = objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0);
    v23 = a2;
LABEL_28:
    objc_msgSend(v23, "setObject:forKey:", v22, CFSTR("NSUnderlyingException"));
    return 0;
  }
  v9 = (void *)v8;
  v34 = a2;
  v10 = 0;
  v11 = 0;
  v35 = v7 - 1;
  do
  {
    v12 = objc_msgSend(v5, "objectAtIndex:", v11);
    if (!v9 || (v13 = (void *)objc_msgSend((id)objc_msgSend(v9, "propertiesByName"), "objectForKey:", v12)) == 0)
    {
      v28 = (void *)MEMORY[0x1E0C99DA0];
      v29 = *MEMORY[0x1E0C99778];
      v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported predicate, LHS of boundedBy: has a keypath (can't find %@)"), v12);
LABEL_35:
      v27 = (const __CFString *)v30;
      v25 = v28;
      v26 = v29;
      goto LABEL_38;
    }
    v14 = v13;
    v15 = objc_msgSend(v13, "_propertyType");
    if (!objc_msgSend(v14, "_isAttribute"))
    {
      if (v15 != 4)
      {
        v25 = (void *)MEMORY[0x1E0C99DA0];
        v26 = *MEMORY[0x1E0C99778];
        v27 = CFSTR("Unsupported predicate, LHS of boundedBy: does not terminate with a location");
        goto LABEL_38;
      }
      v9 = (void *)objc_msgSend(v14, "destinationEntity");
      goto LABEL_20;
    }
    if (v35 != v11)
    {
      v28 = (void *)MEMORY[0x1E0C99DA0];
      v29 = *MEMORY[0x1E0C99778];
      v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed keypath: non-terminal attribute %@"), v12);
      goto LABEL_35;
    }
    if (objc_msgSend(v14, "attributeType"))
    {
      v25 = (void *)MEMORY[0x1E0C99DA0];
      v26 = *MEMORY[0x1E0C99778];
      v27 = CFSTR("Unsupported predicate, LHS of boundedBy: does not terminate with a location attribute");
      goto LABEL_38;
    }
    v10 = (void *)objc_msgSend((id)objc_msgSend(v14, "userInfo"), "objectForKey:", CFSTR("_NSLocationAttributeDerivedComponents"));
    if ((objc_msgSend(v10, "isNSArray") & 1) == 0)
    {
      if (!objc_msgSend(v10, "isNSString"))
        goto LABEL_32;
      v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "description"), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E1EE23F0), "componentsSeparatedByString:", CFSTR(","));
    }
    if (!v10 || objc_msgSend(v10, "count") != 2)
    {
LABEL_32:
      v25 = (void *)MEMORY[0x1E0C99DA0];
      v26 = *MEMORY[0x1E0C99778];
      v27 = CFSTR("Bad LHS attribute, missing derived lat/long names");
LABEL_38:
      v22 = objc_msgSend(v25, "exceptionWithName:reason:userInfo:", v26, v27, 0);
      v23 = v34;
      goto LABEL_28;
    }
LABEL_20:
    ++v11;
  }
  while (v7 != v11);
  v16 = -[NSSQLBoundedByIntermediate initWithWorkingEntity:target:bounds:scope:]([NSSQLBoundedByIntermediate alloc], "initWithWorkingEntity:target:bounds:scope:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "objectForKey:", CFSTR("persistentStore")), "model"), "entityNamed:", objc_msgSend(v9, "name")), v14, *(_QWORD *)(a1 + 40), a1);
  v17 = -[NSSQLBoundedByIntermediate generateSQLStringInContext:](v16, "generateSQLStringInContext:", v34);

  if (!v17)
    return 0;
  if (v7 == 1)
  {
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@.Z_PK IN "), objc_msgSend((id)a1, "governingAliasForKeypathExpression:", *(_QWORD *)(a1 + 32)));
    if (!v18)
      goto LABEL_44;
LABEL_43:
    objc_msgSend(v18, "appendFormat:", CFSTR("(%@) "), v17);
    goto LABEL_44;
  }
  v31 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "subarrayWithRange:", 0, v35), "componentsJoinedByString:", CFSTR(".")), "stringByAppendingFormat:", CFSTR(".%@"), objc_msgSend(v10, "firstObject"));
  v32 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLKeypathExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v31), 1, a1);
  v33 = v32;
  if (v32)
    *(&v32->super._allowToMany + 1) = 1;
  v18 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v32, "generateSQLStringInContext:", v34);

  if (v18)
  {
    objc_msgSend(v18, "appendString:", CFSTR(" IN "));
    goto LABEL_43;
  }
LABEL_44:

  return v18;
}

@end
