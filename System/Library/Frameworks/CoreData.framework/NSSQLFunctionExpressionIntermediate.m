@implementation NSSQLFunctionExpressionIntermediate

- (BOOL)isFunctionScoped
{
  return 1;
}

- (void)generateType3SQLString:(int)a3 keypathOnly:(void *)a4 inContext:
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;

  if (!a1)
    return 0;
  v8 = objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "count");
  if (v8 != 1)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    if (v8)
    {
      v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid number of parameters passed to function (%@)"), a1[2]);
      v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a1[2], CFSTR("Bad value"));
      v12 = v9;
      v13 = v10;
      v11 = v18;
    }
    else
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate sql for %@, empty expression"), a1[2]);
      v12 = v9;
      v13 = v10;
      v14 = 0;
    }
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v11, v14), CFSTR("NSUnderlyingException"));
    return 0;
  }
  if (a3)
  {
    v15 = (void *)objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 0);
    if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v15) & 1) == 0
      && (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)a1, v15) & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(a4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate sql for %@, can't drop index on non-keypath"), a1[2]), 0), CFSTR("NSUnderlyingException"));
    }
  }
  v16 = (void *)objc_msgSend(a2, "mutableCopy");
  v17 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, (void *)objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 0), 0, a4);
  if (!v17)
  {

    v16 = 0;
  }
  objc_msgSend(v16, "appendString:", v17);
  objc_msgSend(v16, "appendString:", CFSTR(")"));

  return v16;
}

- (void)_generateMathStringWithSymbol:(void *)a3 inContext:
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v16;
  uint64_t v17;

  if (!a1)
    return 0;
  v6 = (void *)objc_msgSend(a1[2], "arguments");
  if (objc_msgSend(v6, "count") != 2)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = (void *)MEMORY[0x1E0CB3940];
    v17 = (uint64_t)v6;
    v14 = CFSTR("Wrong number of arguments to function add:to: (%@)");
LABEL_7:
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, objc_msgSend(v13, "stringWithFormat:", v14, v17), 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v7 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, (void *)objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 0), 0, a3);
  if (!v7)
  {
    if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
      return 0;
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_msgSend(v6, "objectAtIndex:", 0);
    v14 = CFSTR("Unable to generate sql for add:to: argument 0(%@)");
    goto LABEL_14;
  }
  v8 = v7;
  objc_msgSend(v7, "insertString:atIndex:", CFSTR("("), 0);
  objc_msgSend(v8, "appendString:", a2);
  v9 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, (void *)objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 1), 0, a3);
  if (!v9)
  {

    if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
      return 0;
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_msgSend(v6, "objectAtIndex:", 1);
    v14 = CFSTR("Unable to generate sql for add:to: argument 1(%@)");
LABEL_14:
    v13 = v16;
    goto LABEL_7;
  }
  v10 = v9;
  objc_msgSend(v8, "appendString:", v9);
  objc_msgSend(v8, "appendString:", CFSTR(")"));

  return v8;
}

+ (BOOL)functionIsAcceptableAsAggregate:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL8 result;

  objc_opt_self();
  if (!_MergedGlobals_81)
  {
    _MergedGlobals_81 = (uint64_t)sel_count_;
    *(_QWORD *)algn_1ECD8DAA8 = sel_max_;
    qword_1ECD8DAB0 = (uint64_t)sel_min_;
    unk_1ECD8DAB8 = sel_average_;
    qword_1ECD8DAC0 = (uint64_t)sel_sum_;
  }
  v3 = objc_msgSend(a2, "selector");
  if (v3 != _MergedGlobals_81
    && v3 != *(_QWORD *)algn_1ECD8DAA8
    && v3 != qword_1ECD8DAB0
    && v3 != unk_1ECD8DAB8
    && v3 != qword_1ECD8DAC0)
  {
    return 0;
  }
  v8 = v3;
  v9 = (void *)objc_msgSend(a2, "arguments");
  if (objc_msgSend(v9, "count") != 1)
    return 0;
  v10 = (void *)objc_msgSend(v9, "objectAtIndex:", 0);
  if (objc_msgSend(v10, "expressionType") == 1 && v8 == _MergedGlobals_81)
    return 1;
  result = +[NSSQLIntermediate isSimpleKeypath:](NSSQLIntermediate, "isSimpleKeypath:", v10);
  if (result)
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "arguments"), "objectAtIndex:", 0), "predicateFormat"), "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (uint64_t)_generateCorrelatedSubqueryStringWithSymbol:(void *)a3 forExpression:(void *)a4 inContext:
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  id v28;
  unint64_t v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  id v37;
  BOOL v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSSQLSubqueryExpressionIntermediate *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  _QWORD *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  unint64_t v58;
  const __CFString *v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isIndexScoped"))
  {
    if (objc_msgSend(a4, "objectForKey:", CFSTR("NSUnderlyingException")))
      return 0;
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported expression in index description (%@), '%@' not supported in this context"), a1[2], a2);
    v11 = a1[2];
    v59 = CFSTR("expression");
    v60[0] = v11;
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
    v13 = v8;
    v14 = v9;
    v15 = v10;
LABEL_7:
    v19 = objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v15, v12);
    v20 = a4;
LABEL_8:
    objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("NSUnderlyingException"));
    return 0;
  }
  if (objc_msgSend(a1, "isUpdateScoped"))
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported join (min/max(key.path) not allowed in updates)"), v51);
LABEL_6:
    v15 = v18;
    v13 = v16;
    v14 = v17;
    v12 = 0;
    goto LABEL_7;
  }
  v56 = a2;
  v54 = a1;
  v23 = objc_msgSend(a1, "governingEntityForKeypathExpression:", a3);
  v24 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0), "constantValue"), "componentsSeparatedByString:", CFSTR("."));
  v25 = objc_msgSend(v24, "count");
  if (v25)
  {
    v26 = v25;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v57 = 0;
    v58 = v25 - 1;
    v55 = a4;
    v53 = a3;
    while (1)
    {
      v52 = v28;
      v30 = v28;
      v31 = v29;
      while (1)
      {
        v32 = objc_msgSend(v24, "objectAtIndex:", v31);
        if (!v23)
        {
          v30 = v52;
LABEL_56:

          v39 = (void *)MEMORY[0x1E0C99DA0];
          v40 = *MEMORY[0x1E0C99778];
          v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath element (not a relationship or attribute): %@"), v32);
LABEL_57:
          v19 = objc_msgSend(v39, "exceptionWithName:reason:userInfo:", v40, v41, 0);
          v20 = v55;
          goto LABEL_8;
        }
        v33 = (void *)objc_msgSend(*(id *)(v23 + 40), "objectForKey:", v32);
        if (!v33)
          goto LABEL_56;
        v34 = v33;
        v35 = objc_msgSend(v33, "propertyType");
        if (v35 != 1)
          break;
        if (v29 < v58)
        {

          v39 = (void *)MEMORY[0x1E0C99DA0];
          v40 = *MEMORY[0x1E0C99778];
          v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath (continues after attribute name): %@"), v32);
          goto LABEL_57;
        }
        if ((v27 & 1) == 0)
        {

          v39 = (void *)MEMORY[0x1E0C99DA0];
          v40 = *MEMORY[0x1E0C99778];
          v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath (request for aggregate operation on a toOne-only keypath): %@"), v53);
          goto LABEL_57;
        }
        if (v30)
          objc_msgSend(v30, "appendString:", CFSTR("."));
        else
          v30 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        objc_msgSend(v30, "appendString:", v32);
        ++v31;
        v27 = 1;
        if (v26 == v31)
        {
          a4 = v55;
          a3 = v53;
          goto LABEL_49;
        }
      }
      if (v35 == 7)
      {
        if ((v27 & 1) != 0)
        {
          if (v30)
          {
            objc_msgSend(v30, "appendString:", CFSTR("."));
            v36 = v30;
          }
          else
          {
            v36 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v30 = v36;
          }
        }
        else if (v57)
        {
          objc_msgSend(v57, "appendString:", CFSTR("."));
          v36 = v57;
        }
        else
        {
          v36 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v57 = v36;
        }
        objc_msgSend(v36, "appendString:", v32);
        v23 = objc_msgSend(v34, "destinationEntity");
        v29 = v31 + 1;
        v28 = v30;
        v38 = v58 == v31;
        a4 = v55;
        a3 = v53;
        if (v38)
          goto LABEL_45;
      }
      else
      {
        if ((v35 & 0xFE) == 8)
        {
          if ((v27 & 1) != 0)
          {

            v39 = (void *)MEMORY[0x1E0C99DA0];
            v40 = *MEMORY[0x1E0C99778];
            v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath (too many toMany relationships): %@"), v53);
            goto LABEL_57;
          }
          v37 = v57;
          if (v57)
            objc_msgSend(v57, "appendString:", CFSTR("."));
          else
            v37 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v57 = v37;
          objc_msgSend(v37, "appendString:", v32);
          v23 = objc_msgSend(v34, "destinationEntity");
          v27 = 1;
        }
        v29 = v31 + 1;
        v28 = v30;
        v38 = v58 == v31;
        a4 = v55;
        a3 = v53;
        if (v38)
          goto LABEL_45;
      }
    }
  }
  v57 = 0;
  v30 = 0;
LABEL_45:
  if ((objc_msgSend(CFSTR("count"), "isEqual:", v56) & 1) == 0)
  {

    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath (no terminal attribute in call to math aggregate): %@"), a3);
    goto LABEL_6;
  }
LABEL_49:
  if (v30)
  {
    objc_msgSend(v30, "appendString:", CFSTR(".@"));
    v42 = v30;
  }
  else
  {
    v42 = (void *)objc_msgSend(CFSTR(".@"), "mutableCopy");
    v30 = v42;
  }
  objc_msgSend(v42, "appendString:", v56);
  v43 = objc_msgSend(a3, "operand");
  v44 = (void *)objc_msgSend((id)objc_opt_class(), "_newKeyPathExpressionForString:", v57);

  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v44, 0);
  v46 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForFunction:selectorName:arguments:", v43, CFSTR("valueForKeyPath:"), v45);

  v47 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("aliasGenerator")), "generateSubqueryVariableAlias");
  v48 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForSubquery:usingIteratorVariable:predicate:", v46, v47, objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1));
  v49 = (void *)objc_msgSend((id)objc_opt_class(), "_newKeyPathExpressionForString:", v30);

  v50 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", v48, v49, v54[1]);
  v21 = -[NSSQLSubqueryExpressionIntermediate generateSQLStringInContext:](v50, "generateSQLStringInContext:", a4);

  if (!v21)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to generate SQL for function expression: %@"), a3);
    goto LABEL_6;
  }
  return v21;
}

- (id)generateSQLStringInContext:(id)a3
{
  char *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  NSSQLFunctionExpressionIntermediate *v15;
  int v16;
  __CFString *v17;
  const __CFString *v18;

  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  v6 = (char *)-[NSExpression selector](self->super._expression, "selector");
  if (sel_max_ == v6)
  {
    v12 = CFSTR("max");
    return -[NSSQLFunctionExpressionIntermediate generateType1SQLString:inContext:]((uint64_t)self, v12, a3);
  }
  if (sel_min_ == v6)
  {
    v12 = CFSTR("min");
    return -[NSSQLFunctionExpressionIntermediate generateType1SQLString:inContext:]((uint64_t)self, v12, a3);
  }
  if (sel_uppercase_ == v6)
  {
    v13 = CFSTR("NSCoreDataToUpper(");
    return -[NSSQLFunctionExpressionIntermediate generateType2SQLString:inContext:]((id *)&self->super.super.super.isa, v13, a3);
  }
  if (sel_lowercase_ == v6)
  {
    v13 = CFSTR("NSCoreDataToLower(");
    return -[NSSQLFunctionExpressionIntermediate generateType2SQLString:inContext:]((id *)&self->super.super.super.isa, v13, a3);
  }
  if (sel_onesComplement_ == v6)
  {
    v14 = CFSTR("(~");
LABEL_37:
    v15 = self;
    v16 = 0;
    return -[NSSQLFunctionExpressionIntermediate generateType3SQLString:keypathOnly:inContext:]((id *)&v15->super.super.super.isa, v14, v16, a3);
  }
  if (sel_abs_ == v6)
  {
    v14 = CFSTR("abs(");
    goto LABEL_37;
  }
  if (sel_noindex_ == v6)
  {
    v14 = CFSTR("+(");
    v15 = self;
    v16 = 1;
    return -[NSSQLFunctionExpressionIntermediate generateType3SQLString:keypathOnly:inContext:]((id *)&v15->super.super.super.isa, v14, v16, a3);
  }
  if (sel_average_ == v6)
  {
    v17 = CFSTR("avg");
    return -[NSSQLFunctionExpressionIntermediate _generateType4SQLForSymbol:inContext:]((uint64_t)self, v17, a3);
  }
  if (sel_sum_ == v6)
  {
    v17 = CFSTR("total");
    return -[NSSQLFunctionExpressionIntermediate _generateType4SQLForSymbol:inContext:]((uint64_t)self, v17, a3);
  }
  if (sel_count_ == v6)
    return (id)-[NSSQLFunctionExpressionIntermediate _generateSQLForCountInContext:]((uint64_t)self, a3);
  if (sel_add_to_ == v6)
  {
    v18 = CFSTR(" + ");
    return -[NSSQLFunctionExpressionIntermediate _generateMathStringWithSymbol:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v18, a3);
  }
  if (sel_from_subtract_ == v6)
  {
    v18 = CFSTR(" - ");
    return -[NSSQLFunctionExpressionIntermediate _generateMathStringWithSymbol:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v18, a3);
  }
  if (sel_multiply_by_ == v6)
  {
    v18 = CFSTR(" * ");
    return -[NSSQLFunctionExpressionIntermediate _generateMathStringWithSymbol:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v18, a3);
  }
  if (sel_divide_by_ == v6)
  {
    v18 = CFSTR(" / ");
    return -[NSSQLFunctionExpressionIntermediate _generateMathStringWithSymbol:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v18, a3);
  }
  if (sel_modulus_by_ == v6)
  {
    v18 = CFSTR(" % ");
    return -[NSSQLFunctionExpressionIntermediate _generateMathStringWithSymbol:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v18, a3);
  }
  if (sel_bitwiseAnd_with_ == v6)
  {
    v18 = CFSTR(" & ");
    return -[NSSQLFunctionExpressionIntermediate _generateMathStringWithSymbol:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v18, a3);
  }
  if (sel_bitwiseOr_with_ == v6)
  {
    v18 = CFSTR(" | ");
    return -[NSSQLFunctionExpressionIntermediate _generateMathStringWithSymbol:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v18, a3);
  }
  if (sel_leftshift_by_ == v6)
  {
    v18 = CFSTR(" << ");
    return -[NSSQLFunctionExpressionIntermediate _generateMathStringWithSymbol:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v18, a3);
  }
  if (sel_rightshift_by_ == v6)
  {
    v18 = CFSTR(" >> ");
    return -[NSSQLFunctionExpressionIntermediate _generateMathStringWithSymbol:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v18, a3);
  }
  if (sel_distinct_ == v6)
    return -[NSSQLFunctionExpressionIntermediate _generateDistinctStringInContext:]((id *)&self->super.super.super.isa, a3);
  if (sel_now == v6)
    return (id)-[NSSQLFunctionExpressionIntermediate _generateNowStringInContext:]((id *)&self->super.super.super.isa, a3);
  if (sel_length_ != v6)
  {
    if (sel_indexed_by_ == v6)
    {
      -[NSSQLFunctionExpressionIntermediate _generateRtreeIndexStringInContext:]((uint64_t)self, a3);
    }
    else if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    {
      v7 = -[NSSQLIntermediate isIndexScoped](self, "isIndexScoped");
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", self->super._expression, CFSTR("Bad value"));
      if (v7)
        v11 = CFSTR("Unsupported function type passed as index component (either not a valid function at all, or just not valid in this context).");
      else
        v11 = CFSTR("Unsupported function type passed to SQL store");
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v11, v10), CFSTR("NSUnderlyingException"));
    }
    return 0;
  }
  return -[NSSQLFunctionExpressionIntermediate _generateLengthStringInContext:]((id *)&self->super.super.super.isa, a3);
}

- (uint64_t)_generateSQLForCountInContext:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  uint64_t v21;
  NSSQLKeypathExpressionIntermediate *v22;
  NSSQLSubqueryExpressionIntermediate *v23;
  __CFString *v24;
  void *v25;
  NSSQLSubqueryExpressionIntermediate *v26;
  void *v27;
  void *v28;
  id v29;
  __CFString *v30;
  NSSQLFunctionExpressionIntermediate *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (objc_msgSend((id)a1, "isIndexScoped"))
  {
    if (objc_msgSend(a2, "objectForKey:", CFSTR("NSUnderlyingException")))
      return 0;
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported expression in index description (%@), 'count' not supported in this context"), *(_QWORD *)(a1 + 16));
    v7 = *(_QWORD *)(a1 + 16);
    v32 = CFSTR("expression");
    v33[0] = v7;
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    goto LABEL_5;
  }
  v13 = (void *)objc_msgSend(*(id *)(a1 + 16), "arguments");
  v14 = objc_msgSend(v13, "count");
  if (!objc_msgSend(v13, "count"))
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = CFSTR("Invalid number of arguments to count (requires at least 1 argument)");
    goto LABEL_12;
  }
  if (v14 >= 2)
  {
    v15 = (id)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:](a1, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14), (uint64_t)a2);
    if (v15)
      return (uint64_t)v15;
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate SQL for count expression %@"), *(_QWORD *)(a1 + 16));
LABEL_10:
    v12 = (const __CFString *)v18;
    v10 = v16;
    v11 = v17;
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  v20 = (void *)objc_msgSend(v13, "objectAtIndex:", 0);
  v21 = objc_msgSend(v20, "expressionType");
  if (objc_msgSend((id)a1, "isTargetColumnsScoped")
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "fetchIntermediate"), "selectIntermediate"), "onlyFetchesAggregates")&& (void *)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject") == v20)
  {
    v24 = CFSTR("count(*)");
    return -[__CFString mutableCopy](v24, "mutableCopy");
  }
  if (objc_msgSend((id)a1, "isTargetColumnsScoped")
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "fetchIntermediate"), "selectIntermediate"), "onlyFetchesAggregates")&& ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v20) & 1) != 0|| -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v20))&& objc_msgSend((id)objc_msgSend(v20, "keyPath"), "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLKeypathExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", v20, 1, a1);
    v23 = (NSSQLSubqueryExpressionIntermediate *)v22;
    goto LABEL_39;
  }
  if (v21 == 1 && objc_msgSend((id)a1, "isHavingScoped"))
  {
    v24 = CFSTR("COUNT(*)");
    return -[__CFString mutableCopy](v24, "mutableCopy");
  }
  if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v20) & 1) == 0
    && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v20))
  {
    if (v21 == 4)
    {
      if (-[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:](a1, v20))
      {
        v27 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "arguments"), "objectAtIndex:", 0), "constantValue"), "mutableCopy");
        objc_msgSend(v27, "appendString:", CFSTR(".@count"));
        v28 = (void *)objc_msgSend((id)objc_opt_class(), "_newKeyPathExpressionForString:", v27);

        v23 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", objc_msgSend(v20, "operand"), v28, *(_QWORD *)(a1 + 8));
        v22 = (NSSQLKeypathExpressionIntermediate *)v23;
LABEL_39:
        v29 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v22, "generateSQLStringInContext:", a2);

        if (v29)
        {
          v30 = CFSTR("COUNT(");
          goto LABEL_41;
        }
LABEL_42:
        if (objc_msgSend(a2, "objectForKey:", CFSTR("NSUnderlyingException")))
          return 0;
        v16 = (void *)MEMORY[0x1E0C99DA0];
        v17 = *MEMORY[0x1E0C99778];
        v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported expression %@"), *(_QWORD *)(a1 + 16));
        goto LABEL_10;
      }
      if (objc_msgSend(CFSTR("distinct:"), "isEqual:", objc_msgSend(v20, "function")))
      {
        v31 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLFunctionExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", v20, 1, a1);
        v29 = -[NSSQLFunctionExpressionIntermediate generateSQLStringInContext:](v31, "generateSQLStringInContext:", a2);

        if (!v29)
        {
          if (objc_msgSend(a2, "objectForKey:", CFSTR("NSUnderlyingException")))
            return 0;
          v16 = (void *)MEMORY[0x1E0C99DA0];
          v17 = *MEMORY[0x1E0C99778];
          v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate SQL for expression: %@"), *(_QWORD *)(a1 + 16));
          goto LABEL_10;
        }
        v30 = CFSTR("COUNT (");
LABEL_41:
        v15 = (id)-[__CFString mutableCopy](v30, "mutableCopy");
        objc_msgSend(v15, "appendString:", v29);

        objc_msgSend(v15, "appendString:", CFSTR(")"));
        return (uint64_t)v15;
      }
    }
    else if (v21 == 13)
    {
      v25 = (void *)objc_msgSend((id)objc_opt_class(), "_newKeyPathExpressionForString:", CFSTR(".@count"));
      v26 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", v20, v25, *(_QWORD *)(a1 + 8));

      v15 = -[NSSQLSubqueryExpressionIntermediate generateSQLStringInContext:](v26, "generateSQLStringInContext:", a2);
      if (v15)
        return (uint64_t)v15;
      goto LABEL_42;
    }
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported function expression : %@"), *(_QWORD *)(a1 + 16));
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *(_QWORD *)(a1 + 16), CFSTR("Bad value"));
LABEL_5:
    v9 = v8;
    v10 = v4;
    v11 = v5;
    v12 = (const __CFString *)v6;
LABEL_13:
    objc_msgSend(a2, "setObject:forKey:", objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, v9), CFSTR("NSUnderlyingException"));
    return 0;
  }
  return -[NSSQLFunctionExpressionIntermediate _generateCorrelatedSubqueryStringWithSymbol:forExpression:inContext:]((_QWORD *)a1, (uint64_t)CFSTR("count"), v20, a2);
}

- (void)_generateArgumentStringForCollection:(void *)a3 inContext:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  v6 = (void *)objc_msgSend(&stru_1E1EE23F0, "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      v12 = v9;
      v17 = v9 + v8;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(a2);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        if (v12 + (int)v11 >= 1)
          objc_msgSend(v6, "appendString:", CFSTR(", "));
        v14 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, v13, 1, a3);
        if (!v14)
        {
          if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
            objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate sql for %@ as part of  expression (%@)"), v13, a1[2]), 0), CFSTR("NSUnderlyingException"));

          return 0;
        }
        v15 = v14;
        objc_msgSend(v6, "appendString:", v14);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v9 = v17;
      if (v8)
        continue;
      break;
    }
  }
  return v6;
}

- (void)_generateUncorrelatedSubqueryStringWithSymbol:(void *)a3 forAttribute:(void *)a4 inContext:
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isIndexScoped"))
  {
    if (objc_msgSend(a4, "objectForKey:", CFSTR("NSUnderlyingException")))
      return 0;
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported expression in index description (%@)"), a1[2]);
    v11 = a1[2];
    v32 = CFSTR("expression");
    v33[0] = v11;
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v13 = v8;
    v14 = v9;
    v15 = (const __CFString *)v10;
LABEL_14:
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v15, v12), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v16 = (void *)objc_msgSend(a3, "entity");
  v17 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("aliasGenerator")), "generateTableAlias");
  v18 = (void *)objc_msgSend(CFSTR("(SELECT "), "mutableCopy");
  objc_msgSend(v18, "appendString:", a2);
  objc_msgSend(v18, "appendString:", CFSTR("("));
  objc_msgSend(v18, "appendString:", v17);
  objc_msgSend(v18, "appendString:", CFSTR("."));
  objc_msgSend(v18, "appendString:", objc_msgSend(a3, "columnName"));
  objc_msgSend(v18, "appendString:", CFSTR(") FROM "));
  objc_msgSend(v18, "appendString:", objc_msgSend(v16, "tableName"));
  objc_msgSend(v18, "appendString:", CFSTR(" "));
  objc_msgSend(v18, "appendString:", v17);
  v19 = objc_msgSend(a4, "objectForKey:", CFSTR("restrictingEntityPredicate"));
  if (v19)
  {
    v20 = (void *)v19;
    if (objc_msgSend(a1, "isTargetColumnsScoped"))
    {
      v21 = objc_opt_self();
      if (v21 == objc_opt_class())
      {
        v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "subpredicates"), "objectAtIndex:", 0), "rightExpression"), "constantValue");
        v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "subpredicates"), "objectAtIndex:", 1), "rightExpression"), "constantValue");
        objc_msgSend(v18, "appendString:", CFSTR(" WHERE ("));
        objc_msgSend(v18, "appendString:", v17);
        objc_msgSend(v18, "appendString:", CFSTR("."));
        objc_msgSend(v18, "appendString:", CFSTR("Z_ENT"));
        objc_msgSend(v18, "appendString:", CFSTR(" >= "));
        v27 = -[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)a1, v25, (uint64_t)a4);
        if (v27)
        {
          v28 = (void *)v27;
          objc_msgSend(v18, "appendString:", v27);

          objc_msgSend(v18, "appendString:", CFSTR(" AND "));
          objc_msgSend(v18, "appendString:", v17);
          objc_msgSend(v18, "appendString:", CFSTR("."));
          objc_msgSend(v18, "appendString:", CFSTR("Z_ENT"));
          objc_msgSend(v18, "appendString:", CFSTR(" <= "));
          v29 = -[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)a1, v26, (uint64_t)a4);
          if (v29)
          {
            v30 = (void *)v29;
            objc_msgSend(v18, "appendString:", v29);

            objc_msgSend(v18, "appendString:", CFSTR(")"));
            goto LABEL_12;
          }
        }
      }
      else
      {
        v22 = objc_msgSend((id)objc_msgSend(v20, "rightExpression"), "constantValue");
        objc_msgSend(v18, "appendString:", CFSTR(" WHERE "));
        objc_msgSend(v18, "appendString:", v17);
        objc_msgSend(v18, "appendString:", CFSTR("."));
        objc_msgSend(v18, "appendString:", CFSTR("Z_ENT"));
        objc_msgSend(v18, "appendString:", CFSTR(" = "));
        v23 = -[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)a1, v22, (uint64_t)a4);
        if (v23)
        {
          v24 = (void *)v23;
          objc_msgSend(v18, "appendString:", v23);

          goto LABEL_12;
        }
      }

      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99768];
      v15 = CFSTR("Can't generate sql for entityID");
      v12 = 0;
      goto LABEL_14;
    }
  }
LABEL_12:
  objc_msgSend(v18, "appendString:", CFSTR(")"));
  return v18;
}

- (id)generateType1SQLString:(void *)a3 inContext:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  const __CFString **v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSSQLKeypathExpressionIntermediate *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v27;
  _QWORD *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSSQLSubqueryExpressionIntermediate *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (objc_msgSend((id)a1, "isIndexScoped"))
  {
    if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99778];
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported expression in index description (%@), aggregate operations not allowed here"), *(_QWORD *)(a1 + 16));
      v9 = *(_QWORD *)(a1 + 16);
      v51 = CFSTR("expression");
      v52 = v9;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = &v52;
      v12 = &v51;
LABEL_5:
      v13 = objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
      v14 = v6;
      v15 = v7;
      v16 = v8;
LABEL_18:
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, v13), CFSTR("NSUnderlyingException"));
      return 0;
    }
    return 0;
  }
  v17 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "arguments"), "count");
  if (!v17)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate sql for %@, empty %@ expression"), *(_QWORD *)(a1 + 16), a2);
    v14 = v24;
LABEL_16:
    v15 = v25;
LABEL_17:
    v13 = 0;
    goto LABEL_18;
  }
  v18 = v17;
  if (objc_msgSend((id)a1, "isTargetColumnsScoped")
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "fetchIntermediate"), "selectIntermediate"), "onlyFetchesAggregates"))
  {
    v19 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLKeypathExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "arguments"), "objectAtIndex:", 0), 1, a1);
    v20 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v19, "generateSQLStringInContext:", a3);

    if (!v20)
      return 0;
    v21 = (id)objc_msgSend(a2, "mutableCopy");
    objc_msgSend(v21, "appendString:", CFSTR("("));
LABEL_24:
    objc_msgSend(v21, "appendString:", v20);

    objc_msgSend(v21, "appendString:", CFSTR(")"));
    return v21;
  }
  if (v18 != 1)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v21, "appendString:", a2);
    objc_msgSend(v21, "appendString:", CFSTR("("));
    v27 = (void *)objc_msgSend(*(id *)(a1 + 16), "arguments");
    v28 = (_QWORD *)a1;
    goto LABEL_22;
  }
  v22 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "arguments"), "objectAtIndex:", 0);
  if (!objc_msgSend((id)a1, "isIndexScoped"))
  {
    v30 = objc_msgSend(v22, "expressionType");
    if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v22) & 1) != 0
      || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v22))
    {
      v31 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "arguments"), "objectAtIndex:", 0), "constantValue");
      if (objc_msgSend(v31, "rangeOfString:", CFSTR(".")) != 0x7FFFFFFFFFFFFFFFLL)
        return (id)-[NSSQLFunctionExpressionIntermediate _generateCorrelatedSubqueryStringWithSymbol:forExpression:inContext:]((_QWORD *)a1, (uint64_t)a2, v22, a3);
      v32 = objc_msgSend((id)a1, "governingEntityForKeypathExpression:", v22);
      if (v32)
        v33 = (void *)objc_msgSend(*(id *)(v32 + 40), "objectForKey:", v31);
      else
        v33 = 0;
      if (objc_msgSend(v33, "propertyType") == 1)
        return -[NSSQLFunctionExpressionIntermediate _generateUncorrelatedSubqueryStringWithSymbol:forAttribute:inContext:]((_QWORD *)a1, (uint64_t)a2, v33, a3);
      v37 = (void *)MEMORY[0x1E0C99DA0];
      v38 = *MEMORY[0x1E0C99778];
      v39 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Non-attribute property passed to math function: %@"), v22);
      goto LABEL_42;
    }
    if (v30 <= 12)
    {
      if (!v30)
      {
        v46 = (void *)objc_msgSend(v22, "constantValue");
        if ((objc_msgSend(v46, "isNSSet") & 1) != 0
          || (objc_msgSend(v46, "isNSArray") & 1) != 0
          || (objc_msgSend(v46, "isNSOrderedSet") & 1) != 0)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 16), "allowEvaluation");
          v47 = objc_msgSend(*(id *)(a1 + 16), "expressionValueWithObject:context:", 0, 0);
          v48 = a1;
        }
        else
        {
          v48 = a1;
          v47 = (uint64_t)v46;
        }
        return (id)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:](v48, v47, (uint64_t)a3);
      }
      if (v30 == 4 && -[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:](a1, v22))
      {
        v35 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", objc_msgSend(*(id *)(a1 + 16), "operand"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "arguments"), "objectAtIndex:", 0), *(_QWORD *)(a1 + 8));
        v36 = -[NSSQLSubqueryExpressionIntermediate generateSQLStringInContext:](v35, "generateSQLStringInContext:", a3);

        if (v36)
        {
          v21 = (id)objc_msgSend(a2, "mutableCopy");
          objc_msgSend(v21, "appendString:", v36);

          return v21;
        }
        if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
          return 0;
        v42 = (void *)MEMORY[0x1E0C99DA0];
        v43 = *MEMORY[0x1E0C99778];
        v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported expression %@"), *(_QWORD *)(a1 + 16));
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    if (v30 == 13)
    {
      v49 = -[NSSQLIntermediate _generateSQLForSubqueryExpression:trailingKeypath:inContext:](a1, v22, 0, a3);
      if (v49)
      {
        v50 = (void *)v49;
        v21 = (id)objc_msgSend(a2, "mutableCopy");
        objc_msgSend(v21, "appendString:", v50);

        return v21;
      }
      if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
        return 0;
      v37 = (void *)MEMORY[0x1E0C99DA0];
      v38 = *MEMORY[0x1E0C99778];
      v39 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate sql for subquery: %@"), v22);
LABEL_42:
      v16 = v39;
      v14 = v37;
      v15 = v38;
      goto LABEL_17;
    }
    if (v30 != 14)
    {
LABEL_49:
      v45 = (void *)MEMORY[0x1E0C99DA0];
      v25 = *MEMORY[0x1E0C99778];
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate sql for %@() : argument (%@) not supported"), a2, v22);
      v14 = v45;
      goto LABEL_16;
    }
    v40 = (void *)objc_msgSend(v22, "constantValue");
    v41 = objc_msgSend(v40, "count");
    if (v41 == 1)
    {
      v21 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]((void *)a1, (void *)objc_msgSend(v40, "objectAtIndex:", 0), 1, a3);
      if (v21)
        return v21;
      if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
        return 0;
      v42 = (void *)MEMORY[0x1E0C99DA0];
      v43 = *MEMORY[0x1E0C99778];
      v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate sql for %@"), *(_QWORD *)(a1 + 16));
      goto LABEL_48;
    }
    if (!v41)
    {
      v42 = (void *)MEMORY[0x1E0C99DA0];
      v43 = *MEMORY[0x1E0C99778];
      v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate sql for %@, empty max/etc expression"), *(_QWORD *)(a1 + 16));
LABEL_48:
      v16 = v44;
      v14 = v42;
      v15 = v43;
      goto LABEL_17;
    }
    v21 = (id)objc_msgSend(a2, "mutableCopy");
    objc_msgSend(v21, "appendString:", CFSTR("("));
    v28 = (_QWORD *)a1;
    v27 = v40;
LABEL_22:
    v29 = -[NSSQLFunctionExpressionIntermediate _generateArgumentStringForCollection:inContext:](v28, v27, a3);
    if (!v29)
    {

      return 0;
    }
    v20 = v29;
    goto LABEL_24;
  }
  if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported expression in index description (%@), aggregates not allowed here."), *(_QWORD *)(a1 + 16));
    v23 = *(_QWORD *)(a1 + 16);
    v53 = CFSTR("expression");
    v54[0] = v23;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v54;
    v12 = &v53;
    goto LABEL_5;
  }
  return 0;
}

- (void)generateType2SQLString:(void *)a3 inContext:
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  if (!a1)
    return 0;
  v6 = objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "count");
  if (v6 != 1)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    if (v6)
    {
      v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a1[2], CFSTR("Bad value"));
      v9 = CFSTR("Invalid number of parameters passed to uppercase: function");
      v10 = v7;
      v11 = v8;
    }
    else
    {
      v9 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate sql for %@, empty expression"), a1[2]);
      v10 = v7;
      v11 = v8;
      v12 = 0;
    }
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v9, v12), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v13 = (void *)objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 0);
  v14 = objc_msgSend(v13, "expressionType");
  if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v13) & 1) == 0
    && (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)a1, v13) & 1) == 0
    && (v14 || !objc_msgSend((id)objc_msgSend(v13, "constantValue"), "isNSString")))
  {
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad argument to upper/lower function (needs to be a keypath or a string) : %@"), v13), 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v15 = (void *)objc_msgSend(a2, "mutableCopy");
  v16 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, v13, 0, a3);
  if (!v16)
  {

    v15 = 0;
  }
  objc_msgSend(v15, "appendString:", v16);
  objc_msgSend(v15, "appendString:", CFSTR(")"));

  return v15;
}

- (id)_generateType4SQLForSymbol:(void *)a3 inContext:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSSQLKeypathExpressionIntermediate *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSSQLSubqueryExpressionIntermediate *v36;
  void *v37;
  uint64_t v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (objc_msgSend((id)a1, "isIndexScoped"))
  {
    if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported expression in index description (%@), aggregate operations not allowed here"), *(_QWORD *)(a1 + 16));
      v8 = *(_QWORD *)(a1 + 16);
      v39 = CFSTR("expression");
      v40[0] = v8;
      v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v7, v9), CFSTR("NSUnderlyingException"));
    }
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "arguments"), "count") != 1)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = (void *)MEMORY[0x1E0CB3940];
    v38 = *(_QWORD *)(a1 + 16);
    v17 = CFSTR("Invalid number of arguments to avg function : %@");
LABEL_15:
    v18 = objc_msgSend(v16, "stringWithFormat:", v17, v38);
    goto LABEL_16;
  }
  v10 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "arguments"), "objectAtIndex:", 0);
  if (!objc_msgSend(v10, "expressionType"))
  {
    v23 = (void *)objc_msgSend(v10, "constantValue");
    if ((objc_msgSend(v23, "isNSArray") & 1) != 0
      || (objc_msgSend(v23, "isNSSet") & 1) != 0
      || objc_msgSend(v23, "isNSOrderedSet"))
    {
      if (objc_msgSend(v23, "count"))
      {
        if (objc_msgSend(CFSTR("avg"), "isEqual:", a2))
          v24 = -[objc_class average:](NSClassFromString((NSString *)CFSTR("_NSPredicateUtilities")), "average:", v23);
        else
          v24 = -[objc_class sum:](NSClassFromString((NSString *)CFSTR("_NSPredicateUtilities")), "sum:", v23);
      }
      else
      {
        v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      }
      v31 = a1;
    }
    else
    {
      if (!objc_msgSend(v23, "isNSNumber"))
      {
        v14 = (void *)MEMORY[0x1E0C99DA0];
        v15 = *MEMORY[0x1E0C99778];
        v37 = (void *)MEMORY[0x1E0CB3940];
        v38 = objc_msgSend(*(id *)(a1 + 16), "arguments");
        v17 = CFSTR("Bad argument to sum (non-numeric, non-collection argument) : %@");
LABEL_51:
        v16 = v37;
        goto LABEL_15;
      }
      v31 = a1;
      v24 = (uint64_t)v23;
    }
    return (id)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:](v31, v24, (uint64_t)a3);
  }
  if (objc_msgSend((id)a1, "isTargetColumnsScoped")
    && (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "fetchIntermediate"), "selectIntermediate"), "onlyFetchesAggregates") & 1) != 0|| objc_msgSend((id)a1, "isHavingScoped"))
  {
    if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v10) & 1) != 0
      || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v10))
    {
      v11 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLKeypathExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", v10, 1, a1);
      v12 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v11, "generateSQLStringInContext:", a3);

      if (v12)
      {
        v13 = (id)objc_msgSend(a2, "mutableCopy");
        objc_msgSend(v13, "appendString:", CFSTR("("));
        objc_msgSend(v13, "appendString:", v12);

        objc_msgSend(v13, "appendString:", CFSTR(")"));
        return v13;
      }
      if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
      {
        v28 = (void *)MEMORY[0x1E0C99DA0];
        v29 = *MEMORY[0x1E0C99778];
        v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate SQL for keypath: %@"), *(_QWORD *)(a1 + 16));
LABEL_36:
        objc_msgSend(a3, "setValue:forKey:", objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v30, 0), CFSTR("NSUnderlyingException"));
      }
      return 0;
    }
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad argument to aggregate %@ in select (must be a keypath or constant value) : %@"), a2, objc_msgSend(*(id *)(a1 + 16), "arguments"));
    v20 = v32;
    v21 = v33;
LABEL_17:
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v19, 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v10) & 1) == 0
    && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v10))
  {
    if (objc_msgSend(v10, "expressionType") == 13)
    {
      v34 = (void *)objc_msgSend(CFSTR(".@"), "mutableCopy");
      objc_msgSend(v34, "appendString:", a2);
      v35 = (void *)objc_msgSend((id)objc_opt_class(), "_newKeyPathExpressionForString:", v34);

      v36 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", v10, v35, *(_QWORD *)(a1 + 8));
      v13 = -[NSSQLSubqueryExpressionIntermediate generateSQLStringInContext:](v36, "generateSQLStringInContext:", a3);

      if (v13)
        return v13;
      if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
        return 0;
      v28 = (void *)MEMORY[0x1E0C99DA0];
      v29 = *MEMORY[0x1E0C99778];
      v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate SQL for subquery: %@"), *(_QWORD *)(a1 + 16));
      goto LABEL_36;
    }
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v37 = (void *)MEMORY[0x1E0CB3940];
    v38 = objc_msgSend(*(id *)(a1 + 16), "arguments");
    v17 = CFSTR("Unsupported argument to sum : %@");
    goto LABEL_51;
  }
  v25 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "arguments"), "objectAtIndex:", 0), "constantValue");
  if (objc_msgSend(v25, "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v26 = objc_msgSend((id)a1, "governingEntityForKeypathExpression:", v10);
    if (v26)
      v27 = (void *)objc_msgSend(*(id *)(v26 + 40), "objectForKey:", v25);
    else
      v27 = 0;
    if (objc_msgSend(v27, "propertyType") == 1)
      return -[NSSQLFunctionExpressionIntermediate _generateUncorrelatedSubqueryStringWithSymbol:forAttribute:inContext:]((_QWORD *)a1, (uint64_t)a2, v27, a3);
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Non-attribute property passed to sum: %@"), *(_QWORD *)(a1 + 16));
LABEL_16:
    v19 = v18;
    v20 = v14;
    v21 = v15;
    goto LABEL_17;
  }
  return (id)-[NSSQLFunctionExpressionIntermediate _generateCorrelatedSubqueryStringWithSymbol:forExpression:inContext:]((_QWORD *)a1, (uint64_t)a2, v10, a3);
}

- (void)_generateDistinctStringInContext:(id *)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (objc_msgSend(a1, "isIndexScoped"))
  {
    if (objc_msgSend(a2, "objectForKey:", CFSTR("NSUnderlyingException")))
      return 0;
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported expression in index description (%@), 'distinct' not allowed here"), a1[2]);
    v7 = a1[2];
    v21 = CFSTR("expression");
    v22[0] = v7;
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v9 = v4;
    v10 = v5;
    v11 = v6;
LABEL_13:
    objc_msgSend(a2, "setObject:forKey:", objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, v8), CFSTR("NSUnderlyingException"));
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "count") != 1)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid number of arguments to distinct : %@"), a1[2]);
    v9 = v16;
LABEL_12:
    v10 = v17;
    v8 = 0;
    goto LABEL_13;
  }
  v12 = (void *)objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 0);
  if (objc_msgSend(v12, "expressionType") != 1
    && (objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v12) & 1) == 0
    && (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)a1, v12) & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid argument to distinct : %@"), v12);
LABEL_19:
    v11 = v20;
    v9 = v19;
    goto LABEL_12;
  }
  v13 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, v12, 1, a2);
  if (!v13)
  {
    if (objc_msgSend(a2, "objectForKey:", CFSTR("NSUnderlyingException")))
      return 0;
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate SQL for distinct : %@"), v12);
    goto LABEL_19;
  }
  v14 = v13;
  v15 = (void *)objc_msgSend(CFSTR("DISTINCT "), "mutableCopy");
  objc_msgSend(v15, "appendString:", v14);

  return v15;
}

- (uint64_t)_generateNowStringInContext:(id *)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (objc_msgSend(a1, "isIndexScoped"))
  {
    if (objc_msgSend(a2, "objectForKey:", CFSTR("NSUnderlyingException")))
      return 0;
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported expression in index description (%@), 'now' not allowed here"), a1[2]);
    v7 = a1[2];
    v15 = CFSTR("expression");
    v16[0] = v7;
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = v4;
    v10 = v5;
    v11 = v6;
LABEL_7:
    objc_msgSend(a2, "setObject:forKey:", objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, v8), CFSTR("NSUnderlyingException"));
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "count"))
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid number of arguments to now function : %@"), a1[2]);
    v9 = v12;
    v10 = v13;
    v8 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return -[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)a1, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), (uint64_t)a2);
}

- (void)_generateLengthStringInContext:(id *)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  if (!a1)
    return 0;
  if (objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "count") != 1)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid number of arguments to length: function : %@"), a1[2]);
    v11 = v8;
LABEL_13:
    objc_msgSend(a2, "setObject:forKey:", objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v9, v10, 0), CFSTR("NSUnderlyingException"));
    return 0;
  }
  v4 = (void *)objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 0);
  if (objc_msgSend(v4, "expressionType")
    && (objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v4) & 1) == 0
    && (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)a1, v4) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid argument to length: : %@"), v4);
LABEL_12:
    v10 = v13;
    v11 = v12;
    goto LABEL_13;
  }
  v5 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, v4, 0, a2);
  if (!v5)
  {
    if (objc_msgSend(a2, "objectForKey:", CFSTR("NSUnderlyingException")))
      return 0;
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate SQL for length : %@"), v4);
    goto LABEL_12;
  }
  v6 = v5;
  v7 = (void *)objc_msgSend(CFSTR("length("), "mutableCopy");
  objc_msgSend(v7, "appendString:", v6);
  objc_msgSend(v7, "appendString:", CFSTR(")"));

  return v7;
}

- (uint64_t)_generateRtreeIndexStringInContext:(uint64_t)result
{
  if (result)
    return objc_msgSend(a2, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("You should not have made it here, scope failed at its job : %@"), *(_QWORD *)(result + 16)), 0), CFSTR("NSUnderlyingException"));
  return result;
}

@end
