@implementation NSSQLIndexIntermediate

- (id)initForIndex:(id)a3 withScope:(id)a4
{
  NSSQLIndexIntermediate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSSQLIndexIntermediate;
  v5 = -[NSSQLIntermediate initWithScope:](&v7, sel_initWithScope_, a4);
  if (v5)
    v5->_index = (NSSQLBinaryIndex *)a3;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_index = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLIndexIntermediate;
  -[NSSQLIndexIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)isIndexScoped
{
  return 1;
}

- (BOOL)isIndexExpressionScoped
{
  return self->_isHandlingExpressions;
}

- (id)governingEntity
{
  return -[NSSQLIndex sqlEntity](self->_index, "sqlEntity");
}

- (id)generateSQLStringInContext:(id)a3
{
  NSSQLEntity *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSSQLKeypathExpressionIntermediate *v17;
  uint64_t v18;
  NSSQLKeypathExpressionIntermediate *v19;
  NSSQLKeypathExpressionIntermediate *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  __objc2_class *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const __CFString *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSSQLCompoundWhereIntermediate *v49;
  NSSQLCompoundWhereIntermediate *v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  unint64_t v57;
  uint64_t v58;
  NSArray *obj;
  NSSQLIndexIntermediate *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  const __CFString *v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  _BYTE v77[128];
  const __CFString *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  const __CFString *v86;
  _QWORD v87[3];

  v87[1] = *MEMORY[0x1E0C80C00];
  v5 = -[NSSQLIndex sqlEntity](self->_index, "sqlEntity");
  v6 = objc_alloc(MEMORY[0x1E0CB37A0]);
  if (-[NSSQLIndex isUnique](self->_index, "isUnique"))
    v7 = CFSTR("UNIQUE ");
  else
    v7 = &stru_1E1EE23F0;
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("CREATE %@INDEX IF NOT EXISTS Z_%@_%@ ON %@ ("), v7, -[NSSQLEntity name](v5, "name"), -[NSFetchIndexDescription name](-[NSSQLIndex indexDescription](self->_index, "indexDescription"), "name"), -[NSSQLEntity tableName](v5, "tableName"));
  obj = -[NSFetchIndexDescription elements](-[NSSQLIndex indexDescription](self->_index, "indexDescription"), "elements");
  v60 = self;
  self->_isHandlingExpressions = 1;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
  if (!v9)
    goto LABEL_58;
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v62;
  v58 = *MEMORY[0x1E0C99778];
  while (2)
  {
    v13 = 0;
LABEL_7:
    if (*(_QWORD *)v62 != v12)
      objc_enumerationMutation(obj);
    v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v13);
    v15 = (void *)objc_msgSend(v14, "property");
    switch(objc_msgSend(v15, "_propertyType"))
    {
      case 2:
      case 6:
      case 7:
        goto LABEL_10;
      case 4:
        if (!objc_msgSend(v15, "isToMany"))
        {
          v16 = objc_msgSend(v15, "name");
          if (!v16)
LABEL_10:
            v16 = objc_msgSend(v15, "_qualifiedName");
          v17 = [NSSQLKeypathExpressionIntermediate alloc];
          v18 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v16);
          v19 = v17;
LABEL_12:
          v20 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:](v19, "initWithExpression:allowToMany:inScope:", v18, 0, v60);
          v21 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v20, "generateSQLStringInContext:", a3);

LABEL_13:
          if (!v21)
            goto LABEL_54;
          if (objc_msgSend(v14, "isAscending"))
            v22 = CFSTR("ASC");
          else
            v22 = CFSTR("DESC");
          if ((v11 & 1) != 0)
            objc_msgSend(v8, "appendString:", CFSTR(", "));
          objc_msgSend(v8, "appendFormat:", CFSTR("%@ COLLATE BINARY %@"), v21, v22);

          ++v13;
          v11 = 1;
          if (v10 == v13)
          {
            v41 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
            v10 = v41;
            if (!v41)
              goto LABEL_57;
            continue;
          }
          goto LABEL_7;
        }
        v42 = (void *)MEMORY[0x1E0C99DA0];
        v75 = CFSTR("relationship");
        v76 = v15;
        v43 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
        v44 = CFSTR("Indexes cannot contain to many relationships");
LABEL_53:
        objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v42, "exceptionWithName:reason:userInfo:", v58, v44, v43), CFSTR("NSUnderlyingException"));

        v8 = 0;
LABEL_54:
        if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
        {
          v71 = CFSTR("property");
          v72 = v15;
          objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v58, CFSTR("SQL generation failure for property"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1)), CFSTR("NSUnderlyingException"));
        }

        v8 = 0;
        if ((v11 & 1) != 0)
        {
LABEL_57:
          objc_msgSend(v8, "appendString:", CFSTR(")"));
          goto LABEL_61;
        }
LABEL_58:
        if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
        {
          v45 = (void *)MEMORY[0x1E0C99DA0];
          v46 = *MEMORY[0x1E0C99778];
          v69 = CFSTR("indexDescription");
          v70 = -[NSSQLIndex indexDescription](v60->_index, "indexDescription");
          objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v45, "exceptionWithName:reason:userInfo:", v46, CFSTR("SQL generation failure for index"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1)), CFSTR("NSUnderlyingException"));
        }

        v8 = 0;
LABEL_61:
        v60->_isHandlingExpressions = 0;
        v47 = -[NSFetchIndexDescription partialIndexPredicate](-[NSSQLIndex indexDescription](v60->_index, "indexDescription"), "partialIndexPredicate");
        if (v8)
        {
          v48 = v47;
          if (v47)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v49 = -[NSSQLCompoundWhereIntermediate initWithPredicate:inScope:inContext:]([NSSQLCompoundWhereIntermediate alloc], "initWithPredicate:inScope:inContext:", v48, v60, a3);
              goto LABEL_67;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v52 = (void *)MEMORY[0x1E0C99DA0];
              v53 = *MEMORY[0x1E0C99778];
              v67 = CFSTR("predicate");
              v68 = -[NSFetchIndexDescription partialIndexPredicate](-[NSSQLIndex indexDescription](v60->_index, "indexDescription"), "partialIndexPredicate");
              objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v52, "exceptionWithName:reason:userInfo:", v53, CFSTR("SQL generation failure for index with predicate (1)"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1)), CFSTR("NSUnderlyingException"));
              return 0;
            }
            v49 = -[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]([NSSQLSimpleWhereIntermediate alloc], "initWithPredicate:inScope:", v48, v60);
LABEL_67:
            v50 = v49;
            if (v49)
            {
              v51 = -[NSSQLCompoundWhereIntermediate generateSQLStringInContext:](v49, "generateSQLStringInContext:", a3);

              if (v51)
              {
                objc_msgSend(v8, "appendFormat:", CFSTR(" WHERE %@"), v51);

                return v8;
              }
              if (!objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlyingException")))
              {
                v54 = (void *)MEMORY[0x1E0C99DA0];
                v55 = *MEMORY[0x1E0C99778];
                v65 = CFSTR("predicate");
                v66 = -[NSFetchIndexDescription partialIndexPredicate](-[NSSQLIndex indexDescription](v60->_index, "indexDescription"), "partialIndexPredicate");
                objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v54, "exceptionWithName:reason:userInfo:", v55, CFSTR("SQL generation failure for index with predicate (2)"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1)), CFSTR("NSUnderlyingException"));
              }

              return 0;
            }
          }
        }
        return v8;
      case 5:
        v23 = (void *)objc_msgSend(v15, "expression");
        v24 = objc_msgSend(v23, "expressionType");
        switch(v24)
        {
          case 4:
            v26 = NSSQLFunctionExpressionIntermediate;
LABEL_30:
            v19 = (NSSQLKeypathExpressionIntermediate *)[v26 alloc];
            v18 = (uint64_t)v23;
            goto LABEL_12;
          case 3:
            v27 = (void *)objc_msgSend(v23, "keyPath");
            objc_msgSend(v27, "rangeOfString:", CFSTR("."));
            if (v28)
            {
              v29 = (void *)MEMORY[0x1E0C99DA0];
              v86 = CFSTR("expression");
              v87[0] = v23;
              v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
              v31 = v29;
              v32 = v58;
              v33 = CFSTR("Joins not supported in index");
            }
            else
            {
              v35 = -[NSSQLEntity entityDescription](-[NSSQLIndex sqlEntity](v60->_index, "sqlEntity"), "entityDescription");
              if (v35
                && (v36 = (void *)objc_msgSend((id)objc_msgSend(v35, "propertiesByName"), "objectForKey:", v27)) != 0)
              {
                v37 = v36;
                v57 = objc_msgSend(v36, "_propertyType");
                if (objc_msgSend(v37, "_propertyType") == 4 && objc_msgSend(v37, "isToMany"))
                {
                  v38 = (void *)MEMORY[0x1E0C99DA0];
                  v82 = CFSTR("property");
                  v83 = v37;
                  v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
                  v31 = v38;
                  v32 = v58;
                  v33 = CFSTR("Indexes cannot contain to many relationships");
                }
                else
                {
                  if (v57 <= 7 && ((1 << v57) & 0xD4) != 0)
                  {
                    v26 = NSSQLKeypathExpressionIntermediate;
                    goto LABEL_30;
                  }
                  v40 = (void *)MEMORY[0x1E0C99DA0];
                  v80 = CFSTR("property");
                  v81 = v37;
                  v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
                  v31 = v40;
                  v32 = v58;
                  v33 = CFSTR("Indexes can only contain attribute/relationship properties");
                }
              }
              else
              {
                if (!objc_msgSend(CFSTR("entity"), "caseInsensitiveCompare:", v27))
                {
                  v25 = CFSTR("Z_ENT");
                  goto LABEL_28;
                }
                if (!objc_msgSend(CFSTR("self"), "caseInsensitiveCompare:", v27))
                {
LABEL_27:
                  v25 = CFSTR("Z_PK");
LABEL_28:
                  v21 = (id)-[__CFString mutableCopy](v25, "mutableCopy");
                  goto LABEL_13;
                }
                v39 = (void *)MEMORY[0x1E0C99DA0];
                v84 = CFSTR("expression");
                v85 = v23;
                v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
                v31 = v39;
                v32 = v58;
                v33 = CFSTR("Can't find property for keypath");
              }
            }
            break;
          case 1:
            goto LABEL_27;
          default:
            v34 = (void *)MEMORY[0x1E0C99DA0];
            v78 = CFSTR("expression");
            v79 = v23;
            v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
            v31 = v34;
            v32 = v58;
            v33 = CFSTR("Unsupported expression type in index");
            break;
        }
        objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v31, "exceptionWithName:reason:userInfo:", v32, v33, v30), CFSTR("NSUnderlyingException"));
        v21 = 0;
        goto LABEL_13;
      default:
        v42 = (void *)MEMORY[0x1E0C99DA0];
        v73 = CFSTR("property");
        v74 = v15;
        v43 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        v44 = CFSTR("Unsupported property in index");
        goto LABEL_53;
    }
  }
}

@end
