@implementation NSSQLRTreeIndexQueryIntermediate

- (id)initForIndexNamed:(id)a3 onEntity:(id)a4 properties:(id)a5 ranges:(id)a6 inScope:(id)a7
{
  NSSQLRTreeIndexQueryIntermediate *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NSSQLRTreeIndexQueryIntermediate;
  v11 = -[NSSQLIntermediate initWithScope:](&v13, sel_initWithScope_, a7);
  if (v11)
  {
    v11->_indexName = (NSExpression *)a3;
    v11->_entity = (NSSQLEntity *)a4;
    v11->_properties = (NSArray *)a5;
    v11->_ranges = (NSArray *)a6;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  self->_indexName = 0;
  self->_entity = 0;

  self->_properties = 0;
  self->_ranges = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLRTreeIndexQueryIntermediate;
  -[NSSQLRTreeIndexQueryIntermediate dealloc](&v3, sel_dealloc);
}

- (uint64_t)_validateCollection:(void *)a3 context:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    if ((objc_msgSend(a2, "isNSArray") & 1) != 0)
    {
      if (objc_msgSend(a2, "count") == 2)
        return 1;
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99778];
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid RHS for rtree query (array should have 2 elements) %@"), a2);
      v14[0] = CFSTR("entity");
      v13 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 16), "entityDescription"), "name");
      v14[1] = CFSTR("properties");
      v15[0] = v13;
      v15[1] = objc_msgSend(*(id *)(v5 + 32), "valueForKey:", CFSTR("name"));
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v15;
      v12 = v14;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99778];
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid RHS for rtree query (should be an array but isn't) %@"), a2);
      v16[0] = CFSTR("entity");
      v9 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 16), "entityDescription"), "name");
      v16[1] = CFSTR("properties");
      v17[0] = v9;
      v17[1] = objc_msgSend(*(id *)(v5 + 32), "valueForKey:", CFSTR("name"));
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v17;
      v12 = v16;
    }
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 2)), CFSTR("NSUnderlyingException"));
    return 0;
  }
  return result;
}

- (uint64_t)_validateExpression:(void *)a3 context:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    if (objc_msgSend(a2, "expressionType"))
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99778];
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid RHS  element for rtree query (should be a constant value) %@"), a2);
      v10[0] = CFSTR("entity");
      v9 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 16), "entityDescription"), "name");
      v10[1] = CFSTR("properties");
      v11[0] = v9;
      v11[1] = objc_msgSend(*(id *)(v5 + 32), "valueForKey:", CFSTR("name"));
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2)), CFSTR("NSUnderlyingException"));
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (id)generateSQLStringInContext:(id)a3
{
  NSUInteger v5;
  NSExpression *indexName;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  NSArray *properties;
  NSArray *ranges;
  void *v16;
  uint64_t v17;
  id v18;
  NSSQLAliasGenerator *v19;
  uint64_t v20;
  id v21;
  id v22;
  NSSQLKeypathExpressionIntermediate *v23;
  NSSQLKeypathExpressionIntermediate *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSSQLEntity *entity;
  NSSQLEntity *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  _QWORD *v58;
  _QWORD *v59;
  NSArray *v60;
  NSArray *v61;
  uint64_t v62;
  const __CFString *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _BYTE v87[128];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  const __CFString *v94;
  id v95;
  const __CFString *v96;
  NSExpression *v97;
  _QWORD v98[2];
  _QWORD v99[4];

  v99[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  v5 = -[NSArray count](self->_properties, "count");
  if (v5 != -[NSArray count](self->_ranges, "count"))
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    properties = self->_properties;
    v98[0] = CFSTR("properties");
    v98[1] = CFSTR("ranges");
    ranges = self->_ranges;
    v99[0] = properties;
    v99[1] = ranges;
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
    v11 = CFSTR("Mismatch between number of properties and number of ranges for rtree query");
LABEL_7:
    v16 = v12;
    v17 = v13;
    goto LABEL_56;
  }
  indexName = self->_indexName;
  if (indexName)
  {
    v7 = -[NSExpression expressionType](indexName, "expressionType");
    indexName = self->_indexName;
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v96 = CFSTR("indexNameExpression");
      v97 = indexName;
      v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
      v11 = CFSTR("Invalid index name expression (should be a constant value)");
LABEL_55:
      v16 = v8;
      v17 = v9;
      goto LABEL_56;
    }
  }
  v18 = -[NSExpression constantValue](indexName, "constantValue");
  if ((objc_msgSend(v18, "isNSString") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v94 = CFSTR("indexName");
    v95 = v18;
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
    v11 = CFSTR("Invalid index name (should be a string)");
    goto LABEL_55;
  }
  v19 = -[NSSQLAliasGenerator initWithNestingLevel:]([NSSQLAliasGenerator alloc], "initWithNestingLevel:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("nestingLevel")), "integerValue") + 1);
  v70 = -[NSSQLAliasGenerator generateTableAlias](v19, "generateTableAlias");

  v69 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!-[NSArray count](self->_properties, "count"))
  {
    v73 = 0;
    v74 = 0;
LABEL_59:
    v52 = objc_msgSend(v69, "componentsJoinedByString:", CFSTR(" AND "));
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@ IN (SELECT %@.Z_PK FROM %@ %@ WHERE (%@))"), v73, v70, v74, v70, v52);
  }
  v73 = 0;
  v74 = 0;
  v20 = 0;
  v68 = (uint64_t)v18;
  while (1)
  {
    v21 = -[NSArray objectAtIndex:](self->_properties, "objectAtIndex:", v20);
    v22 = -[NSArray objectAtIndex:](self->_ranges, "objectAtIndex:", v20);
    if ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v21) & 1) == 0)
    {
      v53 = (void *)MEMORY[0x1E0C99DA0];
      v54 = *MEMORY[0x1E0C99778];
      v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid LHS for rtree query %@"), v21);
      v92[0] = CFSTR("entity");
      v56 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
      v92[1] = CFSTR("properties");
      v93[0] = v56;
      v93[1] = -[NSArray valueForKey:](self->_properties, "valueForKey:", CFSTR("name"));
      v57 = (void *)MEMORY[0x1E0C99D80];
      v58 = v93;
      v59 = v92;
      goto LABEL_70;
    }
    if (!-[NSSQLIntermediate keypathExpressionIsSafeLHSForIn:](self, "keypathExpressionIsSafeLHSForIn:", v21))
    {
      v53 = (void *)MEMORY[0x1E0C99DA0];
      v54 = *MEMORY[0x1E0C99778];
      v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported predicate; can't generate SQL for %@"),
              v21);
      v60 = self->_properties;
      v90[0] = CFSTR("properties");
      v90[1] = CFSTR("ranges");
      v61 = self->_ranges;
      v91[0] = v60;
      v91[1] = v61;
      v57 = (void *)MEMORY[0x1E0C99D80];
      v58 = v91;
      v59 = v90;
      goto LABEL_70;
    }
    if (!v73)
    {
      v23 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLKeypathExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", v21, 0, self->super._scope);
      v24 = v23;
      if (v23)
        *(&v23->super._allowToMany + 1) = 1;
      v25 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v23, "generateSQLStringInContext:", a3);

      v73 = v25;
      if (!v25)
        break;
    }
    v71 = v20;
    if (objc_msgSend(v21, "expressionType"))
      v26 = (void *)objc_msgSend(v21, "keyPath");
    else
      v26 = (void *)objc_msgSend(v21, "constantValue");
    v27 = v26;
    v28 = (void *)objc_msgSend(v26, "componentsSeparatedByString:", CFSTR("."));
    entity = self->_entity;
    v72 = v22;
    if (objc_msgSend(v28, "count") == 1)
    {
      v30 = self->_entity;
      if (v30)
      {
        v31 = (void *)-[NSMutableDictionary objectForKey:](v30->_properties, "objectForKey:", v27);
        goto LABEL_38;
      }
LABEL_37:
      v31 = 0;
      goto LABEL_38;
    }
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v32 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    if (!v32)
      goto LABEL_37;
    v33 = v32;
    v34 = *(_QWORD *)v76;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v76 != v34)
          objc_enumerationMutation(v28);
        if (entity)
          v31 = (void *)-[NSMutableDictionary objectForKey:](entity->_properties, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v35));
        else
          v31 = 0;
        if (objc_msgSend(v31, "propertyType") != 1)
          entity = (NSSQLEntity *)objc_msgSend(v31, "destinationEntity");
        ++v35;
      }
      while (v33 != v35);
      v36 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
      v33 = v36;
    }
    while (v36);
LABEL_38:
    if (objc_msgSend(v31, "propertyType") != 1)
    {
      v53 = (void *)MEMORY[0x1E0C99DA0];
      v54 = *MEMORY[0x1E0C99778];
      v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid ranged property (relationship?!?) %@"), v21);
      v85[0] = CFSTR("entity");
      v62 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
      v85[1] = CFSTR("properties");
      v86[0] = v62;
      v86[1] = -[NSArray valueForKey:](self->_properties, "valueForKey:", CFSTR("name"));
      v57 = (void *)MEMORY[0x1E0C99D80];
      v58 = v86;
      v59 = v85;
      goto LABEL_70;
    }
    v37 = -[NSSQLEntity rtreeIndexForIndexNamed:]((uint64_t)entity, v68);
    if (!v37)
    {
      if (v68)
        v63 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(no index found for name %@)"), v68);
      else
        v63 = CFSTR("(no index name specified, multiple indices available)");
      v53 = (void *)MEMORY[0x1E0C99DA0];
      v54 = *MEMORY[0x1E0C99778];
      v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find index for rtree query %@"), v63);
      v83[0] = CFSTR("entity");
      v67 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
      v83[1] = CFSTR("properties");
      v84[0] = v67;
      v84[1] = -[NSArray valueForKey:](self->_properties, "valueForKey:", CFSTR("name"));
      v57 = (void *)MEMORY[0x1E0C99D80];
      v58 = v84;
      v59 = v83;
      goto LABEL_70;
    }
    v38 = v74;
    if (v74)
    {
      v39 = v72;
      if ((objc_msgSend(v74, "isEqual:", *(_QWORD *)(v37 + 48)) & 1) == 0)
      {
        v12 = (void *)MEMORY[0x1E0C99DA0];
        v13 = *MEMORY[0x1E0C99768];
        v81[0] = CFSTR("entity");
        v64 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
        v81[1] = CFSTR("properties");
        v82[0] = v64;
        v82[1] = -[NSArray valueForKey:](self->_properties, "valueForKey:", CFSTR("name"));
        v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
        v11 = CFSTR("Can't generate SQL; crosscheck failed");
        goto LABEL_7;
      }
    }
    else
    {
      v38 = *(void **)(v37 + 48);
      v39 = v72;
    }
    v40 = objc_msgSend(v39, "expressionType");
    v74 = v38;
    if (v40 == 14)
    {
      v44 = (void *)objc_msgSend(v39, "collection");
      if (!-[NSSQLRTreeIndexQueryIntermediate _validateCollection:context:]((uint64_t)self, v44, a3))
        return 0;
      v45 = (void *)objc_msgSend(v44, "firstObject");
      v46 = (void *)objc_msgSend(v44, "lastObject");
      if (!-[NSSQLRTreeIndexQueryIntermediate _validateExpression:context:]((uint64_t)self, v45, a3)
        || !-[NSSQLRTreeIndexQueryIntermediate _validateExpression:context:]((uint64_t)self, v46, a3))
      {
        return 0;
      }
      v42 = objc_msgSend(v45, "constantValue");
      v43 = objc_msgSend(v46, "constantValue");
    }
    else
    {
      if (v40)
      {
        v53 = (void *)MEMORY[0x1E0C99DA0];
        v54 = *MEMORY[0x1E0C99778];
        v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid RHS for rtree query %@"), v39);
        v79[0] = CFSTR("entity");
        v65 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
        v79[1] = CFSTR("properties");
        v80[0] = v65;
        v80[1] = -[NSArray valueForKey:](self->_properties, "valueForKey:", CFSTR("name"));
        v57 = (void *)MEMORY[0x1E0C99D80];
        v58 = v80;
        v59 = v79;
        goto LABEL_70;
      }
      v41 = (void *)objc_msgSend(v39, "constantValue");
      if (!-[NSSQLRTreeIndexQueryIntermediate _validateCollection:context:]((uint64_t)self, v41, a3))
        return 0;
      v42 = objc_msgSend(v41, "firstObject");
      v43 = objc_msgSend(v41, "lastObject");
    }
    v47 = v43;
    v48 = (void *)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)self, v42, (uint64_t)a3);
    v49 = (void *)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)self, v47, (uint64_t)a3);
    v50 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <= %@.%@_MIN AND %@.%@_MAX <= %@"), v48, v70, objc_msgSend(v31, "columnName"), v70, objc_msgSend(v31, "columnName"), v49);

    objc_msgSend(v69, "addObject:", v50);
    v20 = v71 + 1;
    if (v71 + 1 >= -[NSArray count](self->_properties, "count"))
      goto LABEL_59;
  }
  if (objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
    return 0;
  v53 = (void *)MEMORY[0x1E0C99DA0];
  v54 = *MEMORY[0x1E0C99778];
  v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to generate SQL for keypath %@"), v21);
  v88[0] = CFSTR("entity");
  v66 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
  v88[1] = CFSTR("properties");
  v89[0] = v66;
  v89[1] = -[NSArray valueForKey:](self->_properties, "valueForKey:", CFSTR("name"));
  v57 = (void *)MEMORY[0x1E0C99D80];
  v58 = v89;
  v59 = v88;
LABEL_70:
  v10 = objc_msgSend(v57, "dictionaryWithObjects:forKeys:count:", v58, v59, 2);
  v16 = v53;
  v17 = v54;
  v11 = (const __CFString *)v55;
LABEL_56:
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v11, v10), CFSTR("NSUnderlyingException"));
  return 0;
}

@end
