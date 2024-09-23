@implementation NSSQLOrderIntermediate

- (NSSQLOrderIntermediate)initWithSortDescriptors:(id)a3 inScope:(id)a4
{
  NSSQLOrderIntermediate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSSQLOrderIntermediate;
  v5 = -[NSSQLIntermediate initWithScope:](&v7, sel_initWithScope_, a4);
  if (v5)
    v5->_sortDescriptors = (NSArray *)a3;
  return v5;
}

- (id)generateSQLStringInContext:(id)a3
{
  void *v5;
  id v7;
  uint64_t v8;
  id v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSSQLKeypathExpressionIntermediate *v24;
  NSSQLKeypathExpressionIntermediate *v25;
  const __CFString *v26;
  NSSQLKeypathExpressionIntermediate *v27;
  NSSQLKeypathExpressionIntermediate *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t i;
  uint64_t v36;
  char *v37;
  const __CFString *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  uint64_t v43;
  NSSQLOrderIntermediate *v44;
  id v45;
  NSUInteger v46;
  int v47;

  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  v46 = -[NSArray count](self->_sortDescriptors, "count");
  if (!v46)
    return objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v45 = a3;
  v7 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("ORDER BY"));
  v8 = 0;
  v44 = self;
  v43 = *MEMORY[0x1E0C99778];
  while (1)
  {
    v9 = -[NSArray objectAtIndex:](self->_sortDescriptors, "objectAtIndex:", v8);
    v10 = (__CFString *)objc_msgSend(v9, "key");
    v47 = objc_msgSend(v9, "ascending");
    if (v8)
      objc_msgSend(v5, "appendString:", CFSTR(","));
    if (-[__CFString rangeOfString:](v10, "rangeOfString:", CFSTR(".")) != 0x7FFFFFFFFFFFFFFFLL
      || (v11 = objc_msgSend(v7, "governingEntity")) == 0)
    {
LABEL_15:
      LOBYTE(v13) = 0;
      goto LABEL_39;
    }
    v12 = objc_msgSend(*(id *)(v11 + 40), "objectForKey:", v10);
    v13 = v12;
    if (!v12)
      goto LABEL_39;
    v14 = *(unsigned __int8 *)(v12 + 24);
    if (v14 == 9)
    {
      if (!*(_QWORD *)(v12 + 80))
        goto LABEL_15;
      if (-[NSSQLIntermediate isUpdateScoped](self, "isUpdateScoped"))
      {
        objc_msgSend(v45, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v43, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported join (ordering by mtm not allowed in updates): %@"), self->_sortDescriptors), 0), CFSTR("NSUnderlyingException"));
      }
      else
      {
        v17 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate");
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", objc_msgSend((id)v13, "name"), 0);
        v19 = (id)-[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:]((uint64_t)v17, v18);
        if (!v19)
          v19 = +[NSSQLJoinIntermediate createJoinIntermediatesForKeypath:startEntity:startAlias:forScope:inStatementIntermediate:inContext:]((uint64_t)NSSQLJoinIntermediate, v18, objc_msgSend((id)v13, "entity"), -[NSSQLIntermediate governingAlias](v44, "governingAlias"), v44, (uint64_t)-[NSSQLIntermediate fetchIntermediate](v44, "fetchIntermediate"), v45);

        if (!objc_msgSend(v45, "objectForKey:", CFSTR("NSUnderlyingException")))
        {
          if (v19)
            v22 = (void *)v19[5];
          else
            v22 = 0;
          v15 = (id)objc_msgSend(v22, "mutableCopy");

          objc_msgSend(v15, "appendString:", CFSTR("."));
          objc_msgSend(v15, "appendString:", *(_QWORD *)(v13 + 80));
          goto LABEL_22;
        }

      }
      v15 = 0;
LABEL_22:
      v16 = v15 != 0;
      v14 = *(unsigned __int8 *)(v13 + 24);
      goto LABEL_23;
    }
    v15 = 0;
    v16 = 0;
LABEL_23:
    if (v14 == 7)
    {
      v20 = *(void **)(v13 + 56);
      if (objc_msgSend(v20, "isToMany"))
      {
        v21 = v20 ? (void *)objc_msgSend(v20, "propertyDescription") : 0;
        if (objc_msgSend(v21, "isOrdered"))
        {

          if (-[NSSQLIntermediate isUpdateScoped](v44, "isUpdateScoped"))
          {
            objc_msgSend(v45, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v43, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported join (ordering by tm not allowed in updates): %@"), v44->_sortDescriptors), 0), CFSTR("NSUnderlyingException"));
            v15 = 0;
          }
          else
          {
            v23 = objc_msgSend(*(id *)(v13 + 80), "name");
            v24 = [NSSQLKeypathExpressionIntermediate alloc];
            v25 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:](v24, "initWithExpression:allowToMany:inScope:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v23), 0, v44);
            v15 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v25, "generateSQLStringInContext:", v45);

          }
          if (v15)
            v16 = 1;
        }
      }
    }
    LOBYTE(v13) = v16;
    if (v15)
    {
      objc_msgSend(v5, "appendString:", CFSTR(" "));
      self = v44;
      goto LABEL_44;
    }
    self = v44;
LABEL_39:
    v26 = CFSTR("_pk");
    if (-[__CFString caseInsensitiveCompare:](v10, "caseInsensitiveCompare:", CFSTR("self")))
    {
      if (-[__CFString compare:](v10, "compare:", CFSTR("objectID")))
        v26 = v10;
      else
        v26 = CFSTR("_pk");
    }
    v27 = [NSSQLKeypathExpressionIntermediate alloc];
    v28 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:](v27, "initWithExpression:allowToMany:inScope:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v26), 0, self);
    v15 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v28, "generateSQLStringInContext:", v45);

    if (!v15)
      goto LABEL_88;
LABEL_44:
    objc_msgSend(v5, "appendString:", v15);

    if ((v13 & 1) != 0)
      goto LABEL_73;
    v29 = (void *)objc_msgSend((id)objc_msgSend(v7, "governingEntity"), "entityDescription");
    v30 = (void *)-[__CFString componentsSeparatedByString:](v10, "componentsSeparatedByString:", CFSTR("."));
    v31 = objc_msgSend(v30, "count");
    v32 = objc_msgSend(v30, "objectAtIndex:", 0);
    if (v29)
      v33 = (void *)objc_msgSend((id)objc_msgSend(v29, "propertiesByName"), "objectForKey:", v32);
    else
      v33 = 0;
    if (objc_msgSend(v33, "_propertyType") != 2
      && objc_msgSend(v33, "_propertyType") != 6
      && objc_msgSend(v33, "_propertyType") != 7)
    {
      v29 = (void *)objc_msgSend(v33, "destinationEntity");
    }
    v34 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(v34, "addObject:", v32);
    if (v31 >= 2)
    {
      for (i = 1; i != v31; ++i)
      {
        -[NSSQLFetchIntermediate promoteToOuterJoinAtKeypathWithComponents:]((uint64_t)v7, v34);
        v36 = objc_msgSend(v30, "objectAtIndex:", i);
        if (v29)
          v29 = (void *)objc_msgSend((id)objc_msgSend(v29, "propertiesByName"), "objectForKey:", v36);
        if ((objc_msgSend(v29, "_isAttribute") & 1) != 0)
          break;
        objc_msgSend(v34, "addObject:", v36);
        v29 = (void *)objc_msgSend(v29, "destinationEntity");
      }
    }
    v37 = (char *)objc_msgSend(v9, "selector");
    if (!v37 || v37 == sel_compare_)
      break;
    self = v44;
    if (v37 == sel_caseInsensitiveCompare_)
    {
      v38 = CFSTR(" COLLATE NSCollateNoCase ");
    }
    else if (v37 == sel__caseInsensitiveNumericCompare_)
    {
      v38 = CFSTR(" COLLATE NSCollateNumericallyNoCase ");
    }
    else if (v37 == sel_localizedCompare_)
    {
      v38 = CFSTR(" COLLATE NSCollateLocaleSensitive ");
    }
    else if (v37 == sel_localizedCaseInsensitiveCompare_)
    {
      v38 = CFSTR(" COLLATE NSCollateLocaleSensitiveNoCase ");
    }
    else
    {
      v38 = CFSTR(" COLLATE NSCollateFinderlike ");
      if (v37 != sel_localizedStandardCompare_)
      {
        v40 = (void *)MEMORY[0x1E0C99DA0];
        v41 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported NSSortDescriptor selector: %@"), NSStringFromSelector(v37));
        v42 = v40;
        goto LABEL_87;
      }
    }
    objc_msgSend(v5, "appendString:", v38);
LABEL_73:
    if ((v47 & 1) == 0)
      objc_msgSend(v5, "appendString:", CFSTR(" DESC"));
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "reverseNullOrder"))
    {
      if (v47)
        v39 = CFSTR(" ASC NULLS LAST");
      else
        v39 = CFSTR(" NULLS FIRST");
      objc_msgSend(v5, "appendString:", v39);
    }
    if (++v8 == v46)
      return v5;
  }
  self = v44;
  if (!objc_msgSend(v9, "comparator") || !HIBYTE(z9dsptsiQ80etb9782fsrs98bfdle88))
    goto LABEL_73;
  v42 = (void *)MEMORY[0x1E0C99DA0];
  v41 = CFSTR("unsupported NSSortDescriptor (comparator blocks are not supported)");
LABEL_87:
  objc_msgSend(v45, "setObject:forKey:", objc_msgSend(v42, "exceptionWithName:reason:userInfo:", v43, v41, 0), CFSTR("NSUnderlyingException"));
LABEL_88:

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLOrderIntermediate;
  -[NSSQLOrderIntermediate dealloc](&v3, sel_dealloc);
}

@end
