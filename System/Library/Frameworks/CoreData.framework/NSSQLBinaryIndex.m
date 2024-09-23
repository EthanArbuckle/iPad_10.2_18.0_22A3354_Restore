@implementation NSSQLBinaryIndex

- (id)generateStatementsForStore:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  NSSQLBinaryIndex *v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  int v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSSQLiteStatement *v36;
  NSSQLiteStatement *v37;
  NSSQLiteStatement *v38;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)MEMORY[0x18D76B4E4]();
  if (-[NSFetchIndexDescription _isMappedSinglePropertyIndex]((uint64_t)-[NSSQLIndex indexDescription](self, "indexDescription"))&& objc_msgSend((id)objc_msgSend(-[NSArray firstObject](-[NSFetchIndexDescription elements](-[NSSQLIndex indexDescription](self, "indexDescription"), "elements"), "firstObject"), "property"), "_propertyType") == 4&& !-[NSFetchIndexDescription _isUnique]((uint64_t)-[NSSQLIndex indexDescription](self, "indexDescription")))
  {
    goto LABEL_54;
  }
  if (!-[NSFetchIndexDescription partialIndexPredicate](-[NSSQLIndex indexDescription](self, "indexDescription"), "partialIndexPredicate")&& (-[NSFetchIndexDescription _isPurelyModeledIndex]((uint64_t)-[NSSQLIndex indexDescription](self, "indexDescription")) & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37A0];
    if (-[NSSQLIndex isUnique](self, "isUnique"))
      v8 = CFSTR("UNIQUE ");
    else
      v8 = &stru_1E1EE23F0;
    v42 = (void *)objc_msgSend(v7, "stringWithFormat:", CFSTR("CREATE %@INDEX IF NOT EXISTS Z_%@_%@ ON %@ ("), v8, -[NSSQLEntity name](-[NSSQLIndex sqlEntity](self, "sqlEntity"), "name"), -[NSFetchIndexDescription name](-[NSSQLIndex indexDescription](self, "indexDescription"), "name"), -[NSSQLEntity tableName](-[NSSQLIndex sqlEntity](self, "sqlEntity"), "tableName"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v9 = -[NSFetchIndexDescription elements](-[NSSQLIndex indexDescription](self, "indexDescription"), "elements");
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (!v10)
      goto LABEL_54;
    v11 = v10;
    v12 = self;
    v40 = v6;
    v41 = v5;
    v13 = 0;
    v14 = *(_QWORD *)v44;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x18D76B4E4]();
        v18 = (void *)objc_msgSend(v16, "property");
        v19 = objc_msgSend(v18, "_propertyType");
        if (objc_msgSend(v18, "isTransient"))
          v20 = v19 == 5;
        else
          v20 = 1;
        if (v20)
        {
          if (objc_msgSend(v18, "_isAttribute"))
          {
            if (v18 && objc_msgSend(v18, "superCompositeAttribute"))
            {
              v21 = objc_msgSend(v18, "_qualifiedName");
              v22 = -[NSSQLIndex sqlEntity](v12, "sqlEntity");
              if (!v22)
                goto LABEL_47;
              v23 = *(void **)(v22 + 40);
              v24 = v21;
LABEL_29:
              v27 = (void *)objc_msgSend(v23, "objectForKey:", v24);
              if (!v27)
                goto LABEL_47;
LABEL_30:
              v28 = objc_msgSend(v27, "columnName");
              if ((v13 & 1) != 0)
                objc_msgSend(v42, "appendString:", CFSTR(", "));
              v29 = objc_msgSend(v16, "isAscending");
              v30 = CFSTR("DESC");
              if (v29)
                v30 = CFSTR("ASC");
              objc_msgSend(v42, "appendFormat:", CFSTR("%@ COLLATE BINARY %@"), v28, v30);
              v13 = 1;
              goto LABEL_47;
            }
LABEL_27:
            v25 = -[NSSQLIndex sqlEntity](v12, "sqlEntity");
            v26 = objc_msgSend(v18, "name");
            if (!v25)
              goto LABEL_47;
            v24 = v26;
            v23 = *(void **)(v25 + 40);
            goto LABEL_29;
          }
          if (objc_msgSend(v18, "_isRelationship"))
          {
            if (objc_msgSend(v18, "inverseRelationship") && (objc_msgSend(v18, "isToMany") & 1) != 0)
              goto LABEL_47;
            goto LABEL_27;
          }
          if (v19 != 5)
            goto LABEL_47;
          v31 = (void *)objc_msgSend(v18, "expression");
          v32 = objc_msgSend(v31, "expressionType");
          if (v32 == 3)
          {
            v33 = objc_msgSend(v31, "keyPath");
            if (objc_msgSend(CFSTR("self"), "isEqual:", v33))
              goto LABEL_40;
            if (!objc_msgSend(CFSTR("entity"), "isEqual:", v33))
              goto LABEL_47;
            v34 = -[NSSQLIndex sqlEntity](v12, "sqlEntity");
            if (!v34)
              goto LABEL_47;
            v35 = 136;
          }
          else
          {
            if (v32 != 1)
              goto LABEL_47;
LABEL_40:
            v34 = -[NSSQLIndex sqlEntity](v12, "sqlEntity");
            if (!v34)
              goto LABEL_47;
            v35 = 128;
          }
          v27 = *(void **)(v34 + v35);
          if (!v27)
            goto LABEL_47;
          goto LABEL_30;
        }
LABEL_47:
        objc_autoreleasePoolPop(v17);
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (!v11)
      {
        v6 = v40;
        v5 = v41;
        if ((v13 & 1) != 0)
        {
          objc_msgSend(v42, "appendString:", CFSTR(")"));
          v36 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", -[NSSQLIndex sqlEntity](v12, "sqlEntity"), v42);
          objc_msgSend(v41, "addObject:", v36);
          goto LABEL_53;
        }
        goto LABEL_54;
      }
    }
  }
  v36 = -[NSSQLGenerator initWithPersistentStore:]([NSSQLGenerator alloc], "initWithPersistentStore:", a3);
  v37 = -[NSSQLGenerator newSQLStatmentForBinaryIndex:inStore:](v36, self, (uint64_t)a3);
  if (v37)
  {
    v38 = v37;
    objc_msgSend(v5, "addObject:", v37);

  }
LABEL_53:

LABEL_54:
  objc_autoreleasePoolPop(v6);
  return v5;
}

- (id)dropStatementsForStore:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", -[NSSQLIndex sqlEntity](self, "sqlEntity"), objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("DROP INDEX IF EXISTS Z_%@_%@"), -[NSSQLEntity name](-[NSSQLIndex sqlEntity](self, "sqlEntity", a3), "name"), -[NSFetchIndexDescription name](-[NSSQLIndex indexDescription](self, "indexDescription"), "name")));
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
}

- (id)bulkUpdateStatementsForStore:(id)a3
{
  return (id)NSArray_EmptyArray;
}

@end
