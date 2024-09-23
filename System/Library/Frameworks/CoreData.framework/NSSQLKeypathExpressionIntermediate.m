@implementation NSSQLKeypathExpressionIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id *v15;
  uint64_t v16;
  unsigned __int8 *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSExpression *v21;
  _QWORD *v22;
  NSExpression *v23;
  _BOOL8 allowToMany;
  NSSQLKeypathExpressionIntermediate *v25;
  NSExpression *v26;
  int v27;
  NSExpression *expression;
  NSExpression *v29;
  NSExpression *v30;
  const __CFString *v31;
  NSExpression *v32;
  const __CFString *v33;
  NSExpression *v34;
  const __CFString *v35;
  NSExpression *v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  v5 = (void *)objc_msgSend(-[NSArray objectAtIndex:](-[NSExpression arguments](self->super._expression, "arguments"), "objectAtIndex:", 0), "constantValue");
  objc_msgSend(v5, "rangeOfString:", CFSTR(".@"));
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keypath containing KVC aggregate where there shouldn't be one; failed to handle %@"),
           self->super._expression);
LABEL_4:
    v10 = (const __CFString *)v9;
    v11 = v7;
    v12 = v8;
    v13 = 0;
LABEL_5:
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v10, v13), CFSTR("NSUnderlyingException"));
    return 0;
  }
  if (-[NSSQLIntermediate isIndexScoped](self, "isIndexScoped"))
  {
    v15 = -[NSSQLIntermediate governingEntity](self, "governingEntity");
    if (!v15 || (v16 = objc_msgSend(v15[5], "objectForKey:", v5)) == 0)
    {
      v19 = (void *)MEMORY[0x1E0C99DA0];
      v20 = *MEMORY[0x1E0C99768];
      expression = self->super._expression;
      v37 = CFSTR("expression");
      v38[0] = expression;
      v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v10 = CFSTR("Bad keypath: can't find property");
      goto LABEL_29;
    }
    v17 = (unsigned __int8 *)v16;
    if ((*(_WORD *)(v16 + 32) & 0x20) == 0)
    {
      objc_msgSend(v5, "rangeOfString:", CFSTR("."));
      if (v18)
      {
        v19 = (void *)MEMORY[0x1E0C99DA0];
        v20 = *MEMORY[0x1E0C99768];
        v21 = self->super._expression;
        v35 = CFSTR("expression");
        v36 = v21;
        v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v10 = CFSTR("Bad keypath: too many joins for an index");
LABEL_29:
        v11 = v19;
        v12 = v20;
        goto LABEL_5;
      }
    }
    v27 = v17[24];
    if (v27 != 1)
    {
      if ((v27 - 7) >= 3)
      {
        v19 = (void *)MEMORY[0x1E0C99DA0];
        v20 = *MEMORY[0x1E0C99768];
        v29 = self->super._expression;
        v33 = CFSTR("expression");
        v34 = v29;
        v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v10 = CFSTR("Unable to generate SQL for keypath");
        goto LABEL_29;
      }
      if (v27 != 7)
      {
        v19 = (void *)MEMORY[0x1E0C99DA0];
        v20 = *MEMORY[0x1E0C99768];
        v30 = self->super._expression;
        v31 = CFSTR("expression");
        v32 = v30;
        v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v10 = CFSTR("Bad keypath: indexes may not contain to many relationshps");
        goto LABEL_29;
      }
    }
    return (id)objc_msgSend((id)objc_msgSend(v17, "columnName"), "mutableCopy");
  }
  else
  {
    if (-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped"))
    {
      v22 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate");
      if (v22
        && v22[9]
        && !-[NSSQLIntermediate isFunctionScoped](self, "isFunctionScoped")
        && (-[NSSQLFetchIntermediate groupByClauseContainsKeypath:]((uint64_t)-[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate"), (void *)-[NSExpression predicateFormat](self->super._expression, "predicateFormat")) & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99778];
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT clauses in queries with GROUP BY components can only contain properties named in the GROUP BY or aggregate functions (%@ is not in the GROUP BY)"), self->super._expression);
        goto LABEL_4;
      }
      v23 = self->super._expression;
      allowToMany = -[NSSQLIntermediate isFunctionScoped](self, "isFunctionScoped");
      v25 = self;
      v26 = v23;
    }
    else
    {
      v26 = self->super._expression;
      allowToMany = self->super._allowToMany;
      v25 = self;
    }
    return -[NSSQLKeypathExpressionIntermediate _generateSQLForKeyPathExpression:allowToMany:inContext:](v25, "_generateSQLForKeyPathExpression:allowToMany:inContext:", v26, allowToMany, a3);
  }
}

- (id)_generateSQLForKeyPathExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5
{
  _BOOL4 v6;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  unsigned __int8 *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  NSSQLEntity *v22;
  uint64_t v23;
  NSArray *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t *v46;
  const __CFString **v47;
  unsigned int v48;
  void *v49;
  uint64_t v50;
  id v51;
  const __CFString **v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  int v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  uint64_t v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  unsigned __int8 *v68;
  id v69;
  void *context;
  uint64_t v71;
  const __CFString *v72;
  uint64_t v73;
  const __CFString *v74;
  _QWORD v75[2];

  v6 = a4;
  v75[1] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x18D76B4E4](self, a2);
  v10 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("storeRequest"));
  v11 = objc_msgSend(v10, "requestType");
  if (v11 != 8)
  {
    if (v11 == 6)
    {
      context = v9;
      goto LABEL_8;
    }
    if (v11 != 1)
    {
      objc_msgSend(a5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("this should be inside a fetch or an update"), 0), CFSTR("NSUnderlyingException"));
      objc_autoreleasePoolPop(v9);
      return 0;
    }
  }
  context = v9;
  if (!v6)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v10, "returnsDistinctResults") & 1) != 0
    || (v32 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate")) == 0)
  {
    v12 = 1;
  }
  else
  {
    v33 = v32[8];
    v12 = 1;
    if (v33)
      *(_BYTE *)(v33 + 48) = 1;
  }
LABEL_9:
  v13 = -[NSSQLIntermediate governingEntityForKeypathExpression:](self, "governingEntityForKeypathExpression:", a3);
  v14 = -[NSSQLIntermediate governingAliasForKeypathExpression:](self, "governingAliasForKeypathExpression:", a3);
  v15 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0), "constantValue");
  v16 = (void *)objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("."));
  v71 = 0;
  v17 = -[NSSQLKeypathExpressionIntermediate _propertyDescriptionForKeypath:startingAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:]((uint64_t)self, v16, (uint64_t)v13, v12, 1, &v71, a5);
  if (objc_msgSend((id)objc_msgSend(v17, "propertyDescription"), "_propertyType") != 7)
  {
    v18 = (void *)objc_msgSend(v17, "propertyDescription");
    if ((!v18 || !objc_msgSend(v18, "superCompositeAttribute"))
      && -[NSSQLIntermediate isUpdateScoped](self, "isUpdateScoped")
      && (unint64_t)objc_msgSend(v16, "count") >= 2)
    {
      v19 = (void *)MEMORY[0x1E0C99DA0];
      v20 = *MEMORY[0x1E0C99778];
      v21 = CFSTR("keypaths (joins) not supported in batch update statements");
LABEL_35:
      v34 = 0;
LABEL_36:
      v35 = objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, v34);
      v36 = CFSTR("NSUnderlyingException");
LABEL_37:
      objc_msgSend(a5, "setObject:forKey:", v35, v36);
      goto LABEL_38;
    }
  }
  v22 = -[NSSQLIntermediate disambiguatingEntity](self, "disambiguatingEntity");
  if (v17 || (v23 = (uint64_t)v22) == 0)
  {
    v23 = (uint64_t)v13;
  }
  else
  {
    v24 = -[NSSQLIntermediate disambiguationKeypath](self, "disambiguationKeypath");
    if (-[NSArray count](v24, "count"))
    {
      if (!objc_msgSend(v15, "hasPrefix:", -[NSArray componentsJoinedByString:](v24, "componentsJoinedByString:", CFSTR("."))))
      {
        v25 = (void *)MEMORY[0x1E0C99DA0];
        v26 = *MEMORY[0x1E0C99778];
        v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid keypath %@"), self->super._expression);
LABEL_34:
        v21 = (const __CFString *)v27;
        v19 = v25;
        v20 = v26;
        goto LABEL_35;
      }
      v17 = -[NSSQLKeypathExpressionIntermediate _propertyDescriptionForKeypath:startingAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:]((uint64_t)self, (void *)objc_msgSend(v16, "subarrayWithRange:", -[NSArray count](v24, "count"), objc_msgSend(v16, "count") - -[NSArray count](v24, "count")), v23, v12 & !-[NSSQLIntermediate disambiguationKeypathHasToMany](self, "disambiguationKeypathHasToMany"), 1, &v71, a5);
      v23 = (uint64_t)v13;
      if (!v17)
      {
        if (objc_msgSend(a5, "objectForKey:", CFSTR("NSUnderlyingException")))
        {
LABEL_38:
          v30 = 0;
LABEL_39:
          objc_autoreleasePoolPop(context);
          return v30;
        }
        v25 = (void *)MEMORY[0x1E0C99DA0];
        v26 = *MEMORY[0x1E0C99778];
        v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid keypath : %@"), self->super._expression);
        goto LABEL_34;
      }
      goto LABEL_53;
    }
    v71 = 0;
    v31 = -[NSSQLKeypathExpressionIntermediate _propertyDescriptionForKeypath:startingAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:]((uint64_t)self, v16, v23, v12, 1, &v71, a5);
    if (v31)
    {
      v17 = v31;
      v13 = (id)v23;
      goto LABEL_53;
    }
    v71 = 0;
    v40 = (void *)-[NSSQLKeypathExpressionIntermediate _propertyDescriptionsForKeypath:rootedAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:]((uint64_t)self, v16, v23, v12, 1, &v71, a5);
    if (!v40)
    {
      if (objc_msgSend(a5, "valueForKey:", CFSTR("NSUnderlyingException")))
        goto LABEL_38;
      goto LABEL_24;
    }
    v41 = v40;
    if (objc_msgSend(v40, "count") != 1)
    {
      if ((unint64_t)objc_msgSend(v41, "count") >= 2)
      {
        v42 = (void *)MEMORY[0x1E0C99DA0];
        v43 = *MEMORY[0x1E0C99778];
        v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ambiguous keypath %@"), self->super._expression);
        v74 = CFSTR("found");
        v75[0] = objc_msgSend(v41, "valueForKey:", CFSTR("propertyDescription"));
        v45 = (void *)MEMORY[0x1E0C99D80];
        v46 = v75;
        v47 = &v74;
        goto LABEL_115;
      }
LABEL_24:
      v71 = 0;
      v28 = (void *)-[NSSQLKeypathExpressionIntermediate _propertyDescriptionsForKeypath:rootedAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:]((uint64_t)self, v16, (uint64_t)v13, v12, (unint64_t)objc_msgSend(v16, "count") < 2, &v71, a5);
      if (!v28)
      {
        if (v23
          && *(_DWORD *)(v23 + 184) == 16001
          && objc_msgSend(v15, "isEqualToString:", CFSTR("changedObjectID")))
        {
          objc_msgSend(a5, "setValue:forKey:", &unk_1E1F4B6D8, CFSTR("generatePairs"));
          v38 = (void *)objc_msgSend(*(id *)(v23 + 40), "objectForKey:", CFSTR("ENTITY"));
          v39 = (void *)objc_msgSend(*(id *)(v23 + 40), "objectForKey:", CFSTR("ENTITYPK"));
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("(%@,%@)"), objc_msgSend(v38, "columnName"), objc_msgSend(v39, "columnName"));
          goto LABEL_39;
        }
        v17 = 0;
        v30 = 0;
        if (objc_msgSend(a5, "valueForKey:", CFSTR("NSUnderlyingException")))
          goto LABEL_39;
        goto LABEL_53;
      }
      v29 = v28;
      if (objc_msgSend(v28, "count") == 1)
      {
        v17 = (unsigned __int8 *)objc_msgSend(v29, "anyObject");
        goto LABEL_53;
      }
      if ((unint64_t)objc_msgSend(v29, "count") < 2)
      {
        v17 = 0;
        goto LABEL_53;
      }
      v42 = (void *)MEMORY[0x1E0C99DA0];
      v43 = *MEMORY[0x1E0C99778];
      v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ambiguous keypath %@"), self->super._expression);
      v72 = CFSTR("found");
      v73 = objc_msgSend(v29, "valueForKey:", CFSTR("propertyDescription"));
      v45 = (void *)MEMORY[0x1E0C99D80];
      v46 = &v73;
      v47 = &v72;
LABEL_115:
      v34 = objc_msgSend(v45, "dictionaryWithObjects:forKeys:count:", v46, v47, 1);
      v19 = v42;
      v20 = v43;
      v21 = (const __CFString *)v44;
      goto LABEL_36;
    }
    v17 = (unsigned __int8 *)objc_msgSend(v41, "anyObject");
  }
  v13 = (id)v23;
  if (!v17)
    goto LABEL_24;
LABEL_53:
  v48 = objc_msgSend(v17, "propertyType");
  v49 = (void *)objc_msgSend((id)v23, "entityDescription");
  if (v48 > 0xA)
    goto LABEL_85;
  if (((1 << v48) & 0x42E) != 0)
    goto LABEL_62;
  if (((1 << v48) & 0x300) != 0)
  {
    v50 = objc_msgSend(v17, "entity");
    if (v50)
    {
      v17 = *(unsigned __int8 **)(v50 + 128);
      if (!self)
        goto LABEL_73;
    }
    else
    {
      v17 = 0;
      if (!self)
        goto LABEL_73;
    }
    goto LABEL_63;
  }
  if (v48 != 7)
  {
LABEL_85:
    v61 = objc_msgSend(v16, "firstObject");
    if (v61 && (v62 = (void *)objc_msgSend((id)objc_msgSend(v49, "propertiesByName"), "objectForKey:", v61)) != 0)
      v63 = objc_msgSend(v62, "isTransient");
    else
      v63 = 0;
    if (objc_msgSend(a5, "objectForKey:", CFSTR("NSUnderlyingException")))
      goto LABEL_38;
    objc_msgSend(a5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("keypath %@ not found in entity %@"), a3, objc_msgSend(v13, "name")), 0), CFSTR("NSUnderlyingException"));
    v30 = 0;
    if (!v63)
      goto LABEL_39;
    v35 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v36 = CFSTR("LastKeyPathWasTransientProperty");
    goto LABEL_37;
  }
  if (!-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped"))
    v17 = (unsigned __int8 *)objc_msgSend(v17, "foreignKey");
LABEL_62:
  if (!self)
    goto LABEL_73;
LABEL_63:
  if (-[NSSQLIntermediate isUpdateScoped](self, "isUpdateScoped"))
    v51 = (id)objc_msgSend(a5, "objectForKey:", CFSTR("outerFetch"));
  else
    v51 = -[NSSQLIntermediate fetchIntermediateForKeypathExpression:](self, "fetchIntermediateForKeypathExpression:", self->super._expression);
  v52 = (const __CFString **)+[NSSQLJoinIntermediate createJoinIntermediatesForKeypath:startEntity:startAlias:forScope:inStatementIntermediate:inContext:]((uint64_t)NSSQLJoinIntermediate, v16, (uint64_t)v13, v14, self, (uint64_t)v51, a5);
  if (!-[NSSQLIntermediate isUpdateScoped](self, "isUpdateScoped"))
  {
    if (objc_msgSend(a5, "objectForKey:", CFSTR("NSUnderlyingException")))
    {

      goto LABEL_73;
    }
    if (v52 && *((_BYTE *)v52 + 56))
    {
      v56 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" "));
      objc_msgSend(v56, "appendString:", v52[5]);
      objc_msgSend(v56, "appendString:", CFSTR("."));
      v59 = -[NSSQLManyToMany inverseColumnName](v52[2]);
    }
    else
    {
      if (-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped")
        && objc_msgSend(v17, "propertyType") == 7)
      {
        if (v52)
          v14 = (__CFString *)v52[4];
        v56 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" "));
        v64 = objc_msgSend(v17, "destinationEntity");
        if (v64)
        {
          v65 = *(void **)(v64 + 152);
          if (v65)
          {
            if (objc_msgSend(v65, "count"))
            {
              objc_msgSend(v56, "appendString:", v14);
              objc_msgSend(v56, "appendString:", CFSTR("."));
              if (v17)
                v66 = (void *)*((_QWORD *)v17 + 9);
              else
                v66 = 0;
              objc_msgSend(v56, "appendString:", objc_msgSend(v66, "columnName"));
              objc_msgSend(v56, "appendString:", CFSTR(", "));
            }
          }
        }
        objc_msgSend(v56, "appendString:", v14);
        objc_msgSend(v56, "appendString:", CFSTR("."));
        objc_msgSend(v56, "appendString:", objc_msgSend((id)objc_msgSend(v17, "foreignKey"), "columnName"));
        objc_msgSend(a5, "setObject:forKey:", v17, CFSTR("keypathExpressionDestinationRelationship"));
        goto LABEL_84;
      }
      v56 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" "));
      if (!objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("fabricatedSQLEntityForReadOnlyFetch"))
        || (v67 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("fabricatedSQLEntityForReadOnlyFetch")),
            v67 != objc_msgSend(v17, "entity")))
      {
        if (v52)
          v14 = (__CFString *)v52[4];
        objc_msgSend(v56, "appendString:", v14);
        objc_msgSend(v56, "appendString:", CFSTR("."));
      }
      if (*(&self->super._allowToMany + 1))
      {
        v60 = CFSTR("Z_PK");
        goto LABEL_83;
      }
      v59 = (const __CFString *)objc_msgSend(v17, "columnName");
    }
    v60 = v59;
LABEL_83:
    objc_msgSend(v56, "appendString:", v60);
LABEL_84:

    goto LABEL_120;
  }
  if (!v52)
  {
    v56 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v57 = objc_msgSend(v17, "propertyType");
    if ((v57 - 1) >= 3)
    {
      if (v57 == 7)
      {
        if (v17)
          v68 = (unsigned __int8 *)*((_QWORD *)v17 + 9);
        else
          v68 = 0;
        goto LABEL_118;
      }
      if (v57 != 5)
      {

        if (objc_msgSend(a5, "objectForKey:", CFSTR("NSUnderlyingException")))
          goto LABEL_73;
        v53 = (void *)MEMORY[0x1E0C99DA0];
        v54 = *MEMORY[0x1E0C99778];
        v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported property %@ in update"), v17);
        goto LABEL_70;
      }
    }
    if (*(&self->super._allowToMany + 1))
    {
      v58 = CFSTR("Z_PK");
LABEL_119:
      objc_msgSend(v56, "appendString:", v58);
      goto LABEL_120;
    }
    v68 = v17;
LABEL_118:
    v58 = (const __CFString *)objc_msgSend(v68, "columnName");
    goto LABEL_119;
  }

  if (!objc_msgSend(a5, "objectForKey:", CFSTR("NSUnderlyingException")))
  {
    v53 = (void *)MEMORY[0x1E0C99DA0];
    v54 = *MEMORY[0x1E0C99778];
    v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported property %@ in update - no joins allowed here"), v17);
LABEL_70:
    objc_msgSend(a5, "setObject:forKey:", objc_msgSend(v53, "exceptionWithName:reason:userInfo:", v54, v55, 0), CFSTR("NSUnderlyingException"));
  }
LABEL_73:
  v56 = 0;
LABEL_120:
  v69 = v56;
  objc_autoreleasePoolPop(context);
  return v56;
}

- (unsigned)_propertyDescriptionForKeypath:(uint64_t)a3 startingAtEntity:(char)a4 allowToMany:(char)a5 allowToOne:(uint64_t *)a6 lastKeyVisited:(void *)a7 inContext:
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;

  if (!a1)
    return 0;
  v13 = objc_msgSend(a2, "count");
  if (!v13)
    return 0;
  v14 = v13;
  v36 = a7;
  v15 = 0;
  v16 = 0;
  v17 = v13 - 1;
  while (1)
  {
    v18 = objc_msgSend(a2, "objectAtIndex:", v15);
    *a6 = v18;
    v19 = objc_msgSend(CFSTR("entity"), "compare:options:", v18, 1);
    if (v17 == v15 && !v19)
      break;
    v20 = -[NSEntityDescription _attributeNamed:](objc_msgSend((id)a3, "entityDescription"), *a6);
    if (v20 && objc_msgSend(v20, "attributeType") == 2100)
      v21 = objc_msgSend(a2, "componentsJoinedByString:", CFSTR("."));
    else
      v21 = *a6;
    if (a3)
      v22 = (unsigned __int8 *)objc_msgSend(*(id *)(a3 + 40), "objectForKey:", v21);
    else
      v22 = 0;
    if (v14 != 1 || v22)
      goto LABEL_22;
    v23 = objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("fabricatedSQLEntityForReadOnlyFetch"));
    if (v23)
    {
      v24 = *(_DWORD *)(v23 + 184);
      if (a3)
        goto LABEL_16;
    }
    else
    {
      v24 = 0;
      if (a3)
      {
LABEL_16:
        v25 = *(_DWORD *)(a3 + 184);
        goto LABEL_17;
      }
    }
    v25 = 0;
LABEL_17:
    if (v24 == v25)
    {
      if (v23)
        v23 = *(_QWORD *)(v23 + 40);
      v22 = (unsigned __int8 *)objc_msgSend((id)v23, "objectForKeyedSubscript:", *a6);
    }
    else
    {
      v22 = 0;
    }
LABEL_22:
    v26 = objc_msgSend(v22, "propertyType");
    if (objc_msgSend((id)objc_msgSend(v22, "propertyDescription"), "isTransient"))
    {
      v28 = (void *)MEMORY[0x1E0C99DA0];
      v29 = *MEMORY[0x1E0C99778];
      v30 = CFSTR("transient property used in fetch request");
      goto LABEL_46;
    }
    if ((objc_msgSend(v22, "isToMany") & 1) != 0)
      goto LABEL_26;
    if (!v22)
      goto LABEL_32;
    v27 = v22[24];
    if (v27 == 9)
    {
LABEL_26:
      if ((a4 & 1) == 0)
      {
        v28 = (void *)MEMORY[0x1E0C99DA0];
        v29 = *MEMORY[0x1E0C99778];
        v30 = CFSTR("to-many key not allowed here");
        goto LABEL_46;
      }
      if (v16)
      {
        v28 = (void *)MEMORY[0x1E0C99DA0];
        v29 = *MEMORY[0x1E0C99778];
        v30 = CFSTR("multiple to-many keys not allowed here");
LABEL_46:
        objc_msgSend(v36, "setObject:forKey:", objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v30, 0), CFSTR("NSUnderlyingException"));
        return 0;
      }
      if (!v22)
      {
        v16 = 1;
        goto LABEL_32;
      }
      v27 = v22[24];
      v16 = 1;
    }
    if (v27 == 7 && (a5 & 1) == 0)
    {
      v28 = (void *)MEMORY[0x1E0C99DA0];
      v29 = *MEMORY[0x1E0C99778];
      v30 = CFSTR("to-one key not allowed here");
      goto LABEL_46;
    }
LABEL_32:
    if ((v26 - 7) <= 2)
    {
      a3 = objc_msgSend(v22, "destinationEntity");
      if (v14 != ++v15)
        continue;
    }
    return v22;
  }
  if (a3)
  {
    v31 = v36;
    if (*(_DWORD *)(a3 + 184) == 16001)
      v22 = (unsigned __int8 *)objc_msgSend(*(id *)(a3 + 40), "objectForKey:", *a6);
    else
      v22 = *(unsigned __int8 **)(a3 + 136);
  }
  else
  {
    v22 = 0;
    v31 = v36;
  }
  objc_msgSend(v31, "setValue:forKey:", objc_msgSend(a2, "subarrayWithRange:", 0, v17), CFSTR("entitySpecificationKeypath"));
  if (v16)
    v33 = MEMORY[0x1E0C9AAB0];
  else
    v33 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v31, "setValue:forKey:", v33, CFSTR("entitySpecificationKeypathContainsToMany"));
  v34 = (void *)objc_msgSend(v31, "valueForKey:", CFSTR("explicitRestrictingEntityQualifier"));
  if (v34)
  {
    objc_msgSend(v34, "addObject:", MEMORY[0x1E0C9AAB0]);
  }
  else
  {
    v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v35, "addObject:", MEMORY[0x1E0C9AAB0]);
    objc_msgSend(v31, "setValue:forKey:", v35, CFSTR("explicitRestrictingEntityQualifier"));

  }
  return v22;
}

- (uint64_t)_propertyDescriptionsForKeypath:(uint64_t)a3 rootedAtEntity:(uint64_t)a4 allowToMany:(uint64_t)a5 allowToOne:(uint64_t *)a6 lastKeyVisited:(void *)a7 inContext:
{
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  unsigned __int8 *v19;
  void *v20;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v12 = result;
    v13 = a3 ? *(void **)(a3 + 152) : 0;
    result = objc_msgSend(v13, "count");
    if (result)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v15)
      {
        v16 = v15;
        obj = v13;
        v22 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v24 != v22)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            v19 = -[NSSQLKeypathExpressionIntermediate _propertyDescriptionForKeypath:startingAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:](v12, a2, v18, a4, a5, a6, a7);
            if (v19)
            {
              objc_msgSend(v14, "addObject:", v19);
            }
            else if (objc_msgSend(a7, "objectForKey:", CFSTR("NSUnderlyingException")))
            {
              return 0;
            }
            v20 = (void *)-[NSSQLKeypathExpressionIntermediate _propertyDescriptionsForKeypath:rootedAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:](v12, a2, v18, a4, a5, a6, a7);
            if (v20)
            {
              objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(v20, "allObjects"));
            }
            else if (objc_msgSend(a7, "objectForKey:", CFSTR("NSUnderlyingException")))
            {
              return 0;
            }
          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v16)
            continue;
          break;
        }
      }
      if (objc_msgSend(v14, "count", obj))
        return (uint64_t)v14;
      else
        return 0;
    }
  }
  return result;
}

@end
