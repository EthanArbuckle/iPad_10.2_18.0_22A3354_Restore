@implementation NSSQLiteAdapter

- (uint64_t)sqlTypeForExpressionConstantValue:(uint64_t)result
{
  char *v3;
  unsigned int v4;

  if (result)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return 4;
    if (objc_msgSend(a2, "isNSNumber"))
    {
      v3 = (char *)objc_msgSend(a2, "objCType");
      if (!v3)
        return 2;
      v4 = *v3 - 66;
      if (v4 <= 0x31)
      {
        if (((1 << v4) & 0x2008200020083) != 0)
          return 1;
        if (((1 << v4) & 0x840000008400) != 0)
          return 2;
        if (((1 << v4) & 0x1400000000) != 0)
          return 7;
      }
      return 6;
    }
    if ((objc_msgSend(a2, "isNSString") & 1) != 0)
      return 6;
    if ((objc_msgSend(a2, "isNSDate") & 1) != 0)
    {
      return 8;
    }
    else if ((objc_msgSend(a2, "isNSData") & 1) != 0)
    {
      return 10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        return 12;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          return 11;
        else
          return 0;
      }
    }
  }
  return result;
}

- (NSSQLiteStatement)newStatementWithEntity:(NSSQLiteStatement *)result
{
  if (result)
  {
    if (!a2)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("entity required"), 0));
    return -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", a2);
  }
  return result;
}

- (void)_useModel:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 16) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 16) = a2;
    }
  }
}

- (NSSQLiteStatement)newStatementWithSQLString:(NSSQLiteStatement *)result
{
  if (result)
    return -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, a2);
  return result;
}

- (NSSQLiteStatement)newSelectStatementWithFetchRequestContext:(int)a3 ignoreInheritance:
{
  void *v6;

  if (!a1)
    return 0;
  v6 = (void *)objc_msgSend(a2, "request");
  if (!v6)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("missing fetch request"), 0));
  if (_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (_QWORD *)objc_msgSend(v6, "entity")))
    return -[NSSQLiteAdapter _newStatementForFetchRequestContext:ignoreInheritance:countOnly:nestingLevel:](a1, a2, a3, 0);
  else
    return 0;
}

- (NSSQLiteStatement)newCountStatementWithFetchRequestContext:(uint64_t)a1
{
  void *v4;

  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(a2, "request");
  if (!v4)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("missing fetch request"), 0));
  if (_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (_QWORD *)objc_msgSend(v4, "entity")))
    return -[NSSQLiteAdapter _newStatementForFetchRequestContext:ignoreInheritance:countOnly:nestingLevel:](a1, a2, 0, 1);
  else
    return 0;
}

- (NSSQLiteStatement)newDeleteStatementWithRow:(NSSQLiteStatement *)a1
{
  uint64_t v4;
  NSSQLiteStatement *v5;
  _QWORD *v6;
  NSString *v7;
  NSString *sqlString;

  if (!a1)
    return 0;
  if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
  v5 = -[NSSQLiteAdapter newStatementWithEntity:](a1, v4);
  v6 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v5);
  -[_NSSQLGenerator prepareDeleteStatementWithRow:]((uint64_t)v6, a2);
  if (v6)
  {
    v7 = (NSString *)v6[3];
    if (v5)
      goto LABEL_8;
  }
  else
  {
    v7 = 0;
    if (v5)
    {
LABEL_8:
      sqlString = v5->_sqlString;
      if (sqlString != v7)
      {

        v5->_sqlString = (NSString *)-[NSString copy](v7, "copy");
      }
    }
  }

  return v5;
}

- (NSSQLiteStatement)newUpdateStatementWithRow:(uint64_t)a3 originalRow:(const __CFBitVector *)a4 withMask:
{
  uint64_t v8;
  NSSQLiteStatement *v9;
  _QWORD *v10;
  NSString *v11;
  NSString *sqlString;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!a2)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99768];
    v16 = CFSTR("empty row");
    v17 = 0;
    goto LABEL_16;
  }
  if (!a3)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v20 = CFSTR("objectID");
    v21[0] = objc_msgSend((id)a2, "objectID");
    v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v16 = CFSTR("missing original");
    v14 = v18;
    v15 = v19;
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, v17));
  }
  if ((*(_BYTE *)(a2 + 16) & 2) != 0)
    v8 = 0;
  else
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
  v9 = -[NSSQLiteAdapter newStatementWithEntity:](a1, v8);
  v10 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v9);
  -[_NSSQLGenerator prepareUpdateStatementWithRow:originalRow:withMask:]((uint64_t)v10, a2, a3, a4);
  if (v10)
  {
    v11 = (NSString *)v10[3];
    if (v9)
      goto LABEL_9;
  }
  else
  {
    v11 = 0;
    if (v9)
    {
LABEL_9:
      sqlString = v9->_sqlString;
      if (sqlString != v11)
      {

        v9->_sqlString = (NSString *)-[NSString copy](v11, "copy");
      }
    }
  }

  return v9;
}

- (_QWORD)newGeneratorWithStatement:(_QWORD *)result
{
  if (result)
  {
    if (!a2)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("statement required"), 0));
    return -[_NSSQLGenerator initWithStatement:forAdapter:]([_NSSQLGenerator alloc], a2, (uint64_t)result);
  }
  return result;
}

- (id)sqlCore
{
  return self->_sqlCore;
}

- (NSSQLiteStatement)newInsertStatementWithRow:(NSSQLiteStatement *)a1
{
  uint64_t v4;
  NSSQLiteStatement *v5;
  _QWORD *v6;
  _QWORD *v7;
  NSString *v8;
  NSString *sqlString;

  if (!a1)
    return 0;
  if (!a2 || (*(_BYTE *)(a2 + 16) & 2) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
  v5 = -[NSSQLiteAdapter newStatementWithEntity:](a1, v4);
  v6 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v5);
  v7 = v6;
  if (v6)
  {
    -[_NSSQLGenerator prepareInsertStatementWithRow:includeConstraints:includeOnConflict:onConflictKeys:]((uint64_t)v6, a2, 0, 0, (void *)NSArray_EmptyArray);
    v8 = (NSString *)v7[3];
    if (v5)
      goto LABEL_8;
  }
  else
  {
    v8 = 0;
    if (v5)
    {
LABEL_8:
      sqlString = v5->_sqlString;
      if (sqlString != v8)
      {

        v5->_sqlString = (NSString *)-[NSString copy](v8, "copy");
      }
    }
  }

  return v5;
}

- (uint64_t)generateTriggerForEntity:(const __CFDictionary *)a3 alreadyCreated:(const __CFDictionary *)a4 correlations:(const __CFDictionary *)a5 batchHistory:(void *)a6 fragments:(uint64_t *)a7 error:
{
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const __CFDictionary *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  const __CFDictionary *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t j;
  NSString *v76;
  NSSQLiteStatement *v77;
  NSSQLiteStatement *v78;
  NSString *sqlString;
  NSString *v80;
  NSSQLiteStatement *v81;
  NSSQLiteStatement *v82;
  NSString *v83;
  uint64_t *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *Value;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  const void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  _QWORD *v111;
  const __CFDictionary *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t *v117;
  const __CFDictionary *v118;
  uint64_t v119;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  _BYTE v131[128];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[3];
  _QWORD v136[3];
  _QWORD v137[16];
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if ((*(_BYTE *)(a2 + 120) & 4) != 0)
    {
      v14 = *(_QWORD **)(a2 + 72);
    }
    else
    {
      v13 = (_QWORD *)a2;
      do
      {
        v14 = v13;
        v13 = (_QWORD *)objc_msgSend(v13, "superentity");
      }
      while (v13);
    }
  }
  else
  {
    v14 = 0;
  }
  if (CFDictionaryGetValue(a3, (const void *)a2))
    return 1;
  CFDictionarySetValue(a3, (const void *)a2, (const void *)objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  v112 = a5;
  v110 = a6;
  if (a6)
    v16 = a6;
  else
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v113 = v16;
  v17 = (void *)objc_msgSend((id)objc_msgSend((id)a2, "superentity"), "relationshipsByName");
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v111 = (_QWORD *)a2;
  v18 = (void *)objc_msgSend((id)objc_msgSend((id)a2, "relationshipsByName"), "allValues");
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v126, v131, 16);
  v118 = a3;
  v119 = a1;
  if (v19)
  {
    v20 = v19;
    v121 = *(_QWORD *)v127;
    v117 = a7;
    v114 = v18;
    v115 = v17;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v127 != v121)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v21);
        if ((objc_msgSend(v22, "isTransient") & 1) == 0
          && !objc_msgSend(v17, "objectForKey:", objc_msgSend(v22, "name")))
        {
          v23 = (_QWORD *)objc_msgSend(v22, "entity");
          v24 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), v23);
          if (!v24)
          {
            v84 = v117;
            if (!v117)
              goto LABEL_127;
            v85 = (void *)MEMORY[0x1E0CB35C8];
            v86 = *MEMORY[0x1E0CB28A8];
            *(_QWORD *)&v138 = CFSTR("Reason");
            v137[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entity named:%@ not found for relationship named:%@"), objc_msgSend(v23, "name"), objc_msgSend(v22, "name"));
            *((_QWORD *)&v138 + 1) = CFSTR("MissingEntity");
            v137[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), objc_msgSend(v23, "name"), v23);
            *(_QWORD *)&v139 = CFSTR("Relationship");
            v137[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Name: %@ Destination Entity:%@"), objc_msgSend(v22, "name"), objc_msgSend((id)objc_msgSend(v22, "destinationEntity"), "name"));
            v87 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, &v138, 3);
            v88 = v85;
            v89 = v86;
LABEL_122:
            *v84 = objc_msgSend(v88, "errorWithDomain:code:userInfo:", v89, 134060, v87);
            goto LABEL_127;
          }
          v25 = objc_msgSend(*(id *)(v24 + 40), "objectForKey:", objc_msgSend(v22, "name"));
          v26 = objc_msgSend(v22, "destinationEntity");
          v27 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (_QWORD *)v26);
          if (!v27)
          {
            if (v117)
            {
              v90 = (void *)MEMORY[0x1E0CB35C8];
              v91 = *MEMORY[0x1E0CB28A8];
              v135[0] = CFSTR("Reason");
              v136[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entity named:%@ not found for relationship named:%@"), objc_msgSend((id)v26, "name"), objc_msgSend(v22, "name"));
              v135[1] = CFSTR("MissingEntity");
              v136[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), objc_msgSend((id)v26, "name"), v26);
              v135[2] = CFSTR("Relationship");
              v136[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Name: %@ Destination Entity:%@"), objc_msgSend(v22, "name"), objc_msgSend((id)objc_msgSend(v22, "entity"), "name"));
              *v117 = objc_msgSend(v90, "errorWithDomain:code:userInfo:", v91, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v135, 3));
            }
            goto LABEL_127;
          }
          v28 = (void *)v27;
          v29 = (void *)objc_msgSend(v22, "inverseRelationship");
          if (v25)
          {
            v30 = *(_QWORD *)(v25 + 56);
            if (v29)
              goto LABEL_23;
LABEL_25:
            v31 = 0;
          }
          else
          {
            v30 = 0;
            if (!v29)
              goto LABEL_25;
LABEL_23:
            v31 = objc_msgSend(v29, "isOptional") ^ 1;
          }
          v32 = objc_msgSend(v22, "deleteRule");
          if (v32 == 2)
          {
            v116 = 2;
            if (v25 && *(_BYTE *)(v25 + 24) == 7)
            {
              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE Z_PK = OLD.%@"), objc_msgSend(v28, "tableName"), objc_msgSend((id)v25, "columnName"), 0);
              v35 = v118;
              v34 = v119;
              v36 = v117;
            }
            else
            {
              v36 = v117;
              v35 = v118;
              if (v30 && *(_BYTE *)(v30 + 24) == 7)
              {
                v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = OLD.Z_PK"), objc_msgSend(v28, "tableName"), objc_msgSend((id)v30, "columnName"), 0);
                v34 = v119;
              }
              else
              {
                v34 = v119;
                if (v25 && *(_BYTE *)(v25 + 24) == 9)
                {
                  if (!-[NSSQLiteAdapter generateCorrelationTableTriggerStatementsForRelationship:existing:correlationTableTriggers:error:](v119, v22, a4, v117))goto LABEL_127;
                  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = OLD.Z_PK"), objc_msgSend((id)v25, "correlationTableName"), objc_msgSend((id)v25, "columnName"), 0);
                  v35 = v118;
                  v34 = v119;
                }
                else
                {
                  v33 = 0;
                }
              }
            }
            if (v26)
            {
              if ((*(_BYTE *)(v26 + 120) & 4) != 0)
              {
                v40 = *(const void **)(v26 + 72);
              }
              else
              {
                v39 = (void *)v26;
                do
                {
                  v40 = v39;
                  v39 = (void *)objc_msgSend(v39, "superentity");
                }
                while (v39);
              }
            }
            else
            {
              v40 = 0;
            }
            if (!CFDictionaryContainsKey(v35, v40)
              && (-[NSSQLiteAdapter generateTriggerForEntity:alreadyCreated:correlations:batchHistory:fragments:error:](v34, v26, v35, a4, v112, 0, v36) & 1) == 0)
            {

LABEL_127:
              v15 = 0;
LABEL_128:
              v65 = v113;
              goto LABEL_129;
            }
LABEL_82:
            v37 = v116;
LABEL_83:
            if (v33)
            {
              v60 = &unk_1E1F4B690;
              if (v37 == 2)
                v60 = &unk_1E1F4B678;
              v132[0] = v60;
              v132[1] = v33;
              v15 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 2);

              if (!v15)
                goto LABEL_128;
              goto LABEL_89;
            }
LABEL_88:
            v15 = (uint64_t)&unk_1E1F524B8;
LABEL_89:
            a3 = v118;
            a1 = v119;
            a7 = v117;
            v18 = v114;
            v17 = v115;
            if ((unint64_t)objc_msgSend((id)v15, "count") >= 2)
              objc_msgSend(v113, "addObject:", v15);
            goto LABEL_91;
          }
          if (!v32)
            goto LABEL_88;
          if (v32 != 1)
          {
            v84 = v117;
            if (!v117)
              goto LABEL_127;
            v92 = (void *)MEMORY[0x1E0CB35C8];
            v93 = *MEMORY[0x1E0CB28A8];
            v134[0] = CFSTR("Delete rule is not supported for batch deletes");
            v133[0] = CFSTR("Reason");
            v133[1] = CFSTR("Relationship");
            v134[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), objc_msgSend((id)objc_msgSend(v22, "entity"), "name"), objc_msgSend(v22, "name"));
            v87 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, v133, 2);
            v88 = v92;
            v89 = v93;
            goto LABEL_122;
          }
          if (v25 && *(_BYTE *)(v25 + 24) == 7)
          {
            if (v31)
            {
              v37 = 1;
              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT RAISE(FAIL, 'Batch delete failed due to mandatory OTO nullify inverse on %@/%@') FROM %@ WHERE Z_PK = OLD.%@"), objc_msgSend(v23, "name"), objc_msgSend(v22, "name"), objc_msgSend(v28, "tableName"), objc_msgSend((id)v25, "columnName"), 0);
              goto LABEL_83;
            }
            v116 = 1;
            if (!v30 || *(_BYTE *)(v30 + 24) != 7)
            {
              if (objc_msgSend((id)v30, "isToMany"))
              {
                v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET Z_OPT = (Z_OPT + 1) WHERE Z_PK = OLD.%@"), objc_msgSend(v28, "tableName"), objc_msgSend((id)v25, "columnName"), 0);
                v51 = *(_BYTE **)(v119 + 8);
                if (v51 && (v51[193] & 4) != 0)
                {
                  v52 = (void *)-[NSSQLiteAdapter generateBatchDeleteUpdateHistoryStatementEntity:andRelationship:useInverse:](v51, v28, v25, 0);
                  v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@; %@"), v52, v33);

                  v33 = (void *)v53;
                }
                goto LABEL_82;
              }
              goto LABEL_88;
            }
            v45 = *(_QWORD *)(v30 + 72);
            v46 = objc_alloc(MEMORY[0x1E0CB3940]);
            v47 = objc_msgSend(v28, "tableName");
            v48 = objc_msgSend((id)v30, "columnName");
            if (v45)
            {
              v49 = objc_msgSend(*(id *)(v30 + 72), "columnName");
              v102 = objc_msgSend((id)v30, "columnName");
              v103 = 0;
              v50 = objc_msgSend(v46, "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = NULL , %@ = NULL, Z_OPT = (Z_OPT + 1) WHERE %@ = OLD.Z_PK"), v47, v48, v49);
            }
            else
            {
              v102 = 0;
              v50 = objc_msgSend(v46, "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = NULL , Z_OPT = (Z_OPT + 1) WHERE %@ = OLD.Z_PK"), v47, v48, objc_msgSend((id)v30, "columnName"));
            }
LABEL_79:
            v33 = (void *)v50;
            v59 = *(_BYTE **)(v119 + 8);
            if (v59 && (v59[193] & 4) != 0)
              -[NSSQLiteAdapter generateBatchDeleteUpdateHistoryTriggerForEntity:andRelationship:batchHistory:error:](v59, v28, (void *)v30, v112);
            goto LABEL_82;
          }
          if (!v30 || *(_BYTE *)(v30 + 24) != 7)
          {
            if (v25 && *(_BYTE *)(v25 + 24) == 9)
            {
              if (!-[NSSQLiteAdapter generateCorrelationTableTriggerStatementsForRelationship:existing:correlationTableTriggers:error:](v119, v22, a4, v117))goto LABEL_127;
              if (v31)
              {
                v41 = objc_msgSend((id)v25, "correlationTableName");
                v42 = objc_msgSend((id)v25, "columnName");
                v43 = objc_msgSend((id)v30, "columnName");
                v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WITH ZCTE_INTERMEDIATE AS (SELECT %@, %@ FROM %@ WHERE %@ = OLD.Z_PK) SELECT RAISE(FAIL, 'Batch delete failed due to mandatory MTM nullify inverse on %@/%@') FROM ZCTE_INTERMEDIATE T0 WHERE (0 == (SELECT COUNT(*) FROM %@ T1 where T1.%@ = T0.%@ and T1.%@ != OLD.Z_PK))"), v42, v43, v41, v42, objc_msgSend(v23, "name"), objc_msgSend(v22, "name"), v41, v43, v43, v42, 0);
              }
              else
              {
                v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = OLD.Z_PK"), objc_msgSend((id)v25, "correlationTableName"), objc_msgSend((id)v25, "columnName"), 0, v102, v103, v104, v105, v106, v107, v108, v109);
              }
              v33 = (void *)v44;
              v37 = 1;
              goto LABEL_83;
            }
            goto LABEL_88;
          }
          v116 = 1;
          if (v31)
          {
            v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT RAISE(FAIL, 'Batch delete failed due to manadatory OTM nullify inverse on %@/%@') FROM %@ WHERE %@ = OLD.Z_PK"), objc_msgSend(v23, "name"), objc_msgSend(v22, "name"), objc_msgSend(v28, "tableName"), objc_msgSend((id)v30, "columnName"), 0);
          }
          else
          {
            if (!objc_msgSend(v22, "isOrdered"))
            {
              v54 = *(_QWORD *)(v30 + 72);
              v55 = objc_alloc(MEMORY[0x1E0CB3940]);
              v56 = objc_msgSend(v28, "tableName");
              v57 = objc_msgSend((id)v30, "columnName");
              if (v54)
              {
                v58 = objc_msgSend(*(id *)(v30 + 72), "columnName");
                v102 = objc_msgSend((id)v30, "columnName");
                v103 = 0;
                v50 = objc_msgSend(v55, "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = NULL, %@ = NULL, Z_OPT = (Z_OPT + 1) WHERE %@ = OLD.Z_PK"), v56, v57, v58);
              }
              else
              {
                v102 = 0;
                v50 = objc_msgSend(v55, "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = NULL, Z_OPT = (Z_OPT + 1) WHERE %@ = OLD.Z_PK"), v56, v57, objc_msgSend((id)v30, "columnName"));
              }
              goto LABEL_79;
            }
            v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = NULL, %@ = NULL, Z_OPT = (Z_OPT + 1) WHERE %@ = OLD.Z_PK"), objc_msgSend(v28, "tableName"), objc_msgSend((id)v30, "columnName"), objc_msgSend(*(id *)(v30 + 80), "columnName"), objc_msgSend((id)v30, "columnName"), 0);
          }
          v33 = (void *)v38;
          goto LABEL_82;
        }
LABEL_91:
        ++v21;
      }
      while (v21 != v20);
      v61 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v126, v131, 16);
      v20 = v61;
    }
    while (v61);
  }
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v62 = (void *)objc_msgSend(v111, "subentities");
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v122, v130, 16);
  v64 = v112;
  v65 = v113;
  if (v63)
  {
    v66 = v63;
    v67 = *(_QWORD *)v123;
    while (2)
    {
      for (i = 0; i != v66; ++i)
      {
        if (*(_QWORD *)v123 != v67)
          objc_enumerationMutation(v62);
        if (!-[NSSQLiteAdapter generateTriggerForEntity:alreadyCreated:correlations:batchHistory:fragments:error:](a1, *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * i), a3, a4, v112, v113, a7))
        {
          v15 = 0;
          goto LABEL_129;
        }
      }
      v66 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v122, v130, 16);
      if (v66)
        continue;
      break;
    }
  }
  if (!v110)
  {
    if (objc_msgSend(v113, "count"))
    {
      v69 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), v111);
      v70 = objc_msgSend(v69, "tableName");
      v71 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      objc_msgSend(v113, "sortUsingComparator:", &__block_literal_global_17);
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v72 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v138, v137, 16);
      if (v72)
      {
        v73 = v72;
        v74 = *(_QWORD *)v139;
        do
        {
          for (j = 0; j != v73; ++j)
          {
            if (*(_QWORD *)v139 != v74)
              objc_enumerationMutation(v113);
            objc_msgSend(v71, "appendString:", objc_msgSend(*(id *)(*((_QWORD *)&v138 + 1) + 8 * j), "lastObject"));
            objc_msgSend(v71, "appendString:", CFSTR("; "));
          }
          v73 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v138, v137, 16);
        }
        while (v73);
      }
      v76 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_%@_TRIGGER AFTER DELETE ON %@ FOR EACH ROW BEGIN %@ END"), v70, v70, v71);

      v77 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", v69);
      v78 = v77;
      if (v77)
      {
        sqlString = v77->_sqlString;
        if (sqlString != v76)
        {

          v78->_sqlString = (NSString *)-[NSString copy](v76, "copy");
        }
      }
      v80 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER IF EXISTS ZQ_%@_TRIGGER"), v70);
      v81 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", v69);
      v82 = v81;
      a3 = v118;
      if (v81)
      {
        v83 = v81->_sqlString;
        if (v83 != v80)
        {

          v82->_sqlString = (NSString *)-[NSString copy](v80, "copy");
        }
      }
      v15 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v78, v82, 0);

      v64 = v112;
      a1 = v119;
    }
    else
    {
      v15 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    }

    if (!v15)
      return v15;
    if (objc_msgSend((id)v15, "count"))
    {
      Value = (void *)CFDictionaryGetValue(a3, v14);
      if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == Value)
        CFDictionarySetValue(a3, v14, (const void *)v15);
      else
        objc_msgSend(Value, "addObjectsFromArray:", v15);
    }
    if (v64)
    {
      v96 = *(_QWORD *)(a1 + 8);
      v97 = v96
          ? (void *)objc_msgSend(*(id *)(v96 + 232), "objectForKey:", CFSTR("NSPersistentHistoryTrackingEntitiesToInclude")): 0;
      if (objc_msgSend(v97, "containsObject:", objc_msgSend(v14, "name")))
      {
        v98 = objc_msgSend((id)objc_msgSend(v14, "managedObjectModel"), "_modelsReferenceIDOffset");
        if (v98 != +[_PFPersistentHistoryModel ancillaryEntityOffset](_PFPersistentHistoryModel, "ancillaryEntityOffset"))
        {
          v99 = (const void *)-[NSSQLiteAdapter generateDeleteHistoryTriggerForEntity:error:](a1, v14);
          v100 = (void *)CFDictionaryGetValue(v64, v14);
          v101 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
          if (!v100 || (void *)v101 == v100)
            CFDictionarySetValue(v64, v14, v99);
          else
            objc_msgSend(v100, "addObjectsFromArray:", v99);
        }
      }
    }
    v65 = 0;
  }
  v15 = 1;
LABEL_129:

  return v15;
}

- (uint64_t)generateCorrelationTableTriggerStatementsForRelationship:(uint64_t)a1 existing:(void *)a2 correlationTableTriggers:(const __CFDictionary *)a3 error:(uint64_t *)a4
{
  void *v6;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  _BYTE *v26;
  void *v27;
  uint64_t v28;
  id v29;
  const __CFString *v30;
  const __CFString *v31;
  NSString *v32;
  uint64_t v33;
  NSSQLiteStatement *v34;
  NSSQLiteStatement *v35;
  NSString *sqlString;
  NSString *v37;
  NSSQLiteStatement *v38;
  NSSQLiteStatement *v39;
  NSString *v40;
  uint64_t v41;
  uint64_t *v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[3];

  v6 = a2;
  v47[2] = *MEMORY[0x1E0C80C00];
  v8 = (id *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (_QWORD *)objc_msgSend(a2, "entity"));
  v9 = objc_msgSend(v6, "name");
  if (!v8 || (v10 = objc_msgSend(v8[5], "objectForKey:", v9)) == 0 || (v11 = (__CFString *)v10, !*(_QWORD *)(v10 + 64)))
  {
    v6 = (void *)objc_msgSend(v6, "inverseRelationship");
    v8 = (id *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (_QWORD *)objc_msgSend(v6, "entity"));
    v12 = objc_msgSend(v6, "name");
    if (v8)
      v11 = (__CFString *)objc_msgSend(v8[5], "objectForKey:", v12);
    else
      v11 = 0;
  }
  if (CFDictionaryGetValue(a3, v6))
    return 1;
  v42 = a4;
  v13 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (_QWORD *)objc_msgSend(v6, "destinationEntity"));
  v14 = (void *)objc_msgSend(v6, "inverseRelationship");
  v15 = objc_msgSend(v6, "deleteRule");
  v16 = objc_msgSend(v14, "deleteRule");
  v41 = -[__CFString correlationTableName](v11, "correlationTableName");
  if (v15 == 1)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET Z_OPT = (Z_OPT + 1) WHERE Z_PK = OLD.%@ ; "),
            objc_msgSend(v13, "tableName"),
            -[NSSQLManyToMany inverseColumnName](v11),
            0);
    v18 = *(_BYTE **)(a1 + 8);
    if (v18 && (v18[193] & 4) != 0)
    {
      v19 = (void *)-[NSSQLiteAdapter generateBatchDeleteUpdateHistoryStatementEntity:andRelationship:useInverse:](v18, v13, (uint64_t)v11, 1);
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@; %@"), v19, v17);

      v17 = v20;
    }
  }
  else
  {
    if (v15 != 2)
    {
      if (v42)
      {
        v23 = *MEMORY[0x1E0CB28A8];
        v46[0] = CFSTR("Reason");
        v46[1] = CFSTR("Relationship");
        v47[0] = CFSTR("Delete rule is not supported for batch deletes");
        v47[1] = v6;
        v24 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v23, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2));
        result = 0;
        *v42 = v24;
        return result;
      }
      return 0;
    }
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE Z_PK = OLD.%@ ; "),
            objc_msgSend(v13, "tableName"),
            -[NSSQLManyToMany inverseColumnName](v11),
            0);
  }
  if (v16 != 1)
  {
    if (v16 == 2)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE Z_PK = OLD.%@ ; "),
              objc_msgSend(v8, "tableName"),
              -[__CFString columnName](v11, "columnName"),
              0);
      goto LABEL_16;
    }
    if (v42)
    {
      v33 = *MEMORY[0x1E0CB28A8];
      v44[0] = CFSTR("Reason");
      v44[1] = CFSTR("Relationship");
      v45[0] = CFSTR("Delete rule is not supported for batch deletes");
      v45[1] = v14;
      *v42 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v33, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2));
    }

    return 0;
  }
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET Z_OPT = (Z_OPT + 1) WHERE Z_PK = OLD.%@ ; "),
          objc_msgSend(v8, "tableName"),
          -[__CFString columnName](v11, "columnName"),
          0);
  v26 = *(_BYTE **)(a1 + 8);
  if (v26)
  {
    v22 = v41;
    if ((v26[193] & 4) != 0)
    {
      v27 = (void *)-[NSSQLiteAdapter generateBatchDeleteUpdateHistoryStatementEntity:andRelationship:useInverse:](v26, v8, (uint64_t)v11, 0);
      v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@; %@"), v27, v21);

      v21 = v28;
    }
    goto LABEL_22;
  }
LABEL_16:
  v22 = v41;
LABEL_22:
  if (v17 | v21)
  {
    v29 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v30 = &stru_1E1EE23F0;
    if (v17)
      v31 = (const __CFString *)v17;
    else
      v31 = &stru_1E1EE23F0;
    if (v21)
      v30 = (const __CFString *)v21;
    v32 = (NSString *)objc_msgSend(v29, "initWithFormat:", CFSTR("CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_%@_TRIGGER AFTER DELETE ON %@ FOR EACH ROW BEGIN %@%@ END"), v22, v22, v31, v30, 0);

  }
  else
  {
    v32 = 0;
  }
  v34 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", v8);
  v35 = v34;
  if (v34)
  {
    sqlString = v34->_sqlString;
    if (sqlString != v32)
    {

      v35->_sqlString = (NSString *)-[NSString copy](v32, "copy");
    }
  }

  v37 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS ZQ_%@_TRIGGER"), v22, 0);
  v38 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", v8);
  v39 = v38;
  if (v38)
  {
    v40 = v38->_sqlString;
    if (v40 != v37)
    {

      v39->_sqlString = (NSString *)-[NSString copy](v37, "copy");
    }
  }

  v43[0] = v35;
  v43[1] = v39;
  CFDictionarySetValue(a3, v6, (const void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2));

  return 1;
}

- (uint64_t)generateBatchDeleteUpdateHistoryStatementEntity:(uint64_t)a3 andRelationship:(int)a4 useInverse:
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;

  v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("CHANGE"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_msgSend(*(id *)(v7 + 40), "objectForKey:", CFSTR("COLUMNS"));
    v10 = (void *)objc_msgSend(*(id *)(v8 + 40), "objectForKey:", CFSTR("ENTITYPK"));
    v11 = (void *)objc_msgSend(*(id *)(v8 + 40), "objectForKey:", CFSTR("ENTITY"));
    v46 = (void *)objc_msgSend(*(id *)(v8 + 40), "objectForKey:", CFSTR("CHANGETYPE"));
  }
  else
  {
    v11 = 0;
    v9 = 0;
    v10 = 0;
    v46 = 0;
  }
  v45 = v10;
  v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ON CONFLICT(%@, %@) DO UPDATE SET %@ = NSPersistentHistoryBatchDeleteUpdateTriggerDataBlobOperator(%@, excluded.%@)"), objc_msgSend(v10, "columnName"), objc_msgSend(v11, "columnName"), objc_msgSend(v9, "columnName"), objc_msgSend(v9, "columnName"), objc_msgSend(v9, "columnName"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (v12 = (void *)a3, a4))
  {
    if (a3)
      v12 = *(void **)(a3 + 56);
    else
      v12 = 0;
  }
  v13 = objc_msgSend(v12, "name");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3)
    {
      if (objc_msgSend(*(id *)(a3 + 56), "isToMany")
        && *(_QWORD *)(a3 + 72)
        && objc_msgSend((id)objc_msgSend((id)a3, "propertyDescription"), "deleteRule") == 1)
      {
        v14 = *(void **)(a3 + 56);
        if (v14)
          v14 = (void *)objc_msgSend(v14, "propertyDescription");
        if (objc_msgSend(v14, "deleteRule") == 1)
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("(SELECT NSPersistentHistoryBatchDeleteUpdateTrigger(OLD.%@, '%@'))"), objc_msgSend(*(id *)(a3 + 72), "columnName"), v13);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WHERE OLD.%@ > 0 AND OLD.%@ > 0"), objc_msgSend((id)a3, "columnName"), objc_msgSend(*(id *)(a3 + 72), "columnName"));
          v43 = objc_alloc(MEMORY[0x1E0CB3940]);
          v42 = -[NSSQLEntity tempTableName](v8);
          if (v8)
            v17 = *(void **)(v8 + 136);
          else
            v17 = 0;
          v44 = objc_msgSend(v17, "columnName");
          v18 = objc_msgSend(v10, "columnName");
          v19 = objc_msgSend(v11, "columnName");
          v20 = objc_msgSend(v46, "columnName");
          v21 = objc_msgSend(v9, "columnName");
          if (v8)
            v22 = *(unsigned int *)(v8 + 184);
          else
            v22 = 0;
          v39 = v21;
          v23 = (void *)v47;
          v24 = objc_msgSend(v43, "initWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@) SELECT %u, OLD.%@, OLD.%@, %ld, %@ %@ %@"), v42, v44, v18, v19, v20, v39, v22, objc_msgSend((id)a3, "columnName"), objc_msgSend(*(id *)(a3 + 72), "columnName"), 1, v15, v16, v47);
          goto LABEL_31;
        }
      }
    }
    else
    {
      objc_msgSend(0, "isToMany");
    }
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("(SELECT NSPersistentHistoryBatchDeleteUpdateTrigger(%@.Z_ENT, '%@'))"), objc_msgSend(a2, "tableName"), v13);
  v25 = objc_alloc(MEMORY[0x1E0CB3940]);
  v26 = objc_msgSend(a2, "tableName");
  if (a4)
    v27 = -[NSSQLManyToMany inverseColumnName]((const __CFString *)a3);
  else
    v27 = (const __CFString *)objc_msgSend((id)a3, "columnName");
  v16 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("FROM %@ WHERE Z_PK = OLD.%@"), v26, v27);
  v28 = objc_alloc(MEMORY[0x1E0CB3940]);
  v29 = -[NSSQLEntity tempTableName](v8);
  if (v8)
    v30 = *(void **)(v8 + 136);
  else
    v30 = 0;
  v31 = objc_msgSend(v30, "columnName");
  v32 = objc_msgSend(v45, "columnName");
  v33 = objc_msgSend(v11, "columnName");
  v34 = objc_msgSend(v46, "columnName");
  v35 = objc_msgSend(v9, "columnName");
  if (v8)
    v36 = *(unsigned int *)(v8 + 184);
  else
    v36 = 0;
  v23 = (void *)v47;
  v24 = objc_msgSend(v28, "initWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@) SELECT %u, Z_PK, Z_ENT, %ld, %@ %@ %@"), v29, v31, v32, v33, v34, v35, v36, 1, v15, v16, v47, v40, v41);
LABEL_31:
  v37 = v24;

  return v37;
}

- (NSSQLiteStatement)newConstrainedValuesUpdateStatementWithRow:(NSSQLiteStatement *)a1
{
  uint64_t v4;
  NSSQLiteStatement *v5;
  _QWORD *v6;
  NSString *v7;
  NSString *sqlString;

  if (!a1)
    return 0;
  if (!a2)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("empty row"), 0));
  if ((*(_BYTE *)(a2 + 16) & 2) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a2 + 40) + 16), "_storeInfo1");
  v5 = -[NSSQLiteAdapter newStatementWithEntity:](a1, v4);
  v6 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v5);
  -[_NSSQLGenerator prepareConstrainedValuesUpdateStatementWithRow:]((uint64_t)v6, a2);
  if (v6)
  {
    v7 = (NSString *)v6[3];
    if (v5)
      goto LABEL_8;
  }
  else
  {
    v7 = 0;
    if (v5)
    {
LABEL_8:
      sqlString = v5->_sqlString;
      if (sqlString != v7)
      {

        v5->_sqlString = (NSString *)-[NSString copy](v7, "copy");
      }
    }
  }

  return v5;
}

- (void)dealloc
{
  __CFDictionary *cachedDeleteTriggersByEntity;
  objc_super v4;

  cachedDeleteTriggersByEntity = self->_cachedDeleteTriggersByEntity;
  if (cachedDeleteTriggersByEntity)
  {
    CFRelease(cachedDeleteTriggersByEntity);
    self->_cachedDeleteTriggersByEntity = 0;
  }
  self->_sqlCore = 0;

  self->_model = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSSQLiteAdapter;
  -[NSSQLiteAdapter dealloc](&v4, sel_dealloc);
}

- (NSSQLiteAdapter)initWithSQLCore:(id)a3
{
  NSSQLiteAdapter *v4;
  NSSQLiteAdapter *v5;
  CFDictionaryKeyCallBacks v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSSQLiteAdapter;
  v4 = -[NSSQLiteAdapter init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_sqlCore = (NSSQLCore *)a3;
    v4->_model = (NSSQLModel *)(id)objc_msgSend(a3, "model");
    memset(&v7, 0, sizeof(v7));
    v7.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E0C9B390] + 24);
    v5->_cachedDeleteTriggersByEntity = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 4, &v7, MEMORY[0x1E0C9B3A0]);
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

uint64_t __88__NSSQLiteAdapter_generateTriggerStatementsForEntity_usingRelationshipCleanupSQL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "firstObject"), "compare:", objc_msgSend(a3, "firstObject"));
}

- (uint64_t)generateDeleteStatementsForRequest:(uint64_t *)a3 error:
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  NSSQLiteStatement *v18;
  NSSQLiteStatement *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString *v27;
  NSString *sqlString;
  const void *v29;
  void *Value;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  CFIndex v37;
  const __CFAllocator *v38;
  uint64_t v39;
  void *v40;
  CFIndex v41;
  uint64_t v42;
  const __CFDictionary *v43;
  uint64_t v44;
  void *v45;
  CFIndex v46;
  id v47;
  const char *v48;
  id v49;
  id v50;
  NSSQLiteStatement *v51;
  NSSQLiteStatement *v52;
  NSSQLiteStatement *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t m;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t n;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t ii;
  void *v83;
  void *v84;
  const void *v85;
  const __CFDictionary *v87;
  int v88;
  const __CFDictionary *Mutable;
  const __CFDictionary *cf;
  NSSQLiteStatement *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[8];
  _QWORD v117[2];
  NSSQLiteStatement *v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _QWORD v125[2];
  _QWORD v126[2];
  NSSQLiteStatement *v127;
  _QWORD v128[3];

  v128[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = (void *)objc_msgSend((id)a2, "request");
  v7 = (void *)-[NSSQLBatchDeleteRequestContext fetchRequestForObjectsToDelete](a2);
  v8 = objc_msgSend(v6, "resultType");
  v9 = v8;
  if (a2)
  {
    if (v8 == 1)
    {
      v10 = *(void **)(a2 + 112);
      if (v10)
      {
        if (!objc_msgSend(v10, "count"))
          return NSArray_EmptyArray;
        objc_msgSend(v7, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), *(_QWORD *)(a2 + 112)));
        objc_msgSend(v7, "setSortDescriptors:", 0);
        objc_msgSend(v7, "setFetchOffset:", 0);
        goto LABEL_7;
      }
      goto LABEL_124;
    }
  }
  else if (v8 == 1)
  {
LABEL_124:
    if (a3)
    {
      v20 = 0;
      *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F4AF98);
      return (uint64_t)v20;
    }
    return 0;
  }
LABEL_7:
  v11 = objc_msgSend(v7, "entity");
  v12 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (_QWORD *)v11);
  v13 = (void *)v12;
  if (a3 && !v12)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v125[0] = CFSTR("Reason");
    v125[1] = CFSTR("Model Configuration");
    v126[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSBatchDeleteRequest could not locate an Entity for entity name '%@'"), objc_msgSend((id)v11, "name"));
    v15 = objc_msgSend(*(id *)(a1 + 16), "configurationName");
    v16 = CFSTR("Default");
    if (v15)
      v16 = (const __CFString *)v15;
    v126[1] = v16;
    v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 2);
    *a3 = objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v17);
  }
  v18 = -[NSSQLiteAdapter newSelectStatementWithFetchRequest:ignoreInheritance:](a1, v7, 0);
  v19 = v18;
  if (!v18)
    goto LABEL_22;
  if (v18->_isImpossibleCondition)
  {

    return objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  }
  v21 = -[NSSQLiteStatement sqlString](v18, "sqlString");
  v23 = objc_msgSend(v21, "rangeOfString:", CFSTR("t0.Z_ENT, "));
  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    v21 = (id)objc_msgSend(v21, "stringByReplacingCharactersInRange:withString:", v23, v22, &stru_1E1EE23F0);
  v25 = objc_msgSend(v21, "rangeOfString:", CFSTR("0, "));
  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    v21 = (id)objc_msgSend(v21, "stringByReplacingCharactersInRange:withString:", v25, v24, &stru_1E1EE23F0);
  if (v21)
    v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE Z_PK IN (%@)"), objc_msgSend(v13, "tableName", v25), v21);
  else
LABEL_22:
    v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@"), objc_msgSend(v13, "tableName"));
  v27 = (NSString *)v26;
  v91 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", v13);
  if (v91)
  {
    sqlString = v91->_sqlString;
    if (sqlString != v27)
    {

      v91->_sqlString = (NSString *)-[NSString copy](v27, "copy");
    }
    if (v9 == 2)
      v91->_trackChangedRowCount = 1;
  }
  if (v19)
  {
    -[NSSQLiteStatement setBindIntarrays:]((uint64_t)v91, -[NSSQLiteStatement bindIntarrays](v19, "bindIntarrays"));
    -[NSSQLiteAdapter _useModel:]((uint64_t)v91, -[NSSQLiteStatement bindVariables](v19, "bindVariables"));

  }
  if (v11)
  {
    if ((*(_BYTE *)(v11 + 120) & 4) != 0)
    {
      v29 = *(const void **)(v11 + 72);
    }
    else
    {
      do
      {
        v29 = (const void *)v11;
        v11 = objc_msgSend((id)v11, "superentity");
      }
      while (v11);
    }
  }
  else
  {
    v29 = 0;
  }
  os_unfair_lock_lock_with_options();
  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), v29);
  v31 = Value;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  v32 = Value;
  if (v32)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(v20, "addObject:", objc_msgSend(v32, "firstObject"));
    objc_msgSend(v20, "addObject:", v91);
    objc_msgSend(v20, "addObject:", objc_msgSend(v32, "lastObject"));
  }
  else
  {
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = *(_QWORD *)(a1 + 16);
    if (v35)
      v36 = *(void **)(v35 + 40);
    else
      v36 = 0;
    v37 = objc_msgSend(v36, "count");
    v38 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    cf = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v37, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v39 = *(_QWORD *)(a1 + 16);
    if (v39)
      v40 = *(void **)(v39 + 40);
    else
      v40 = 0;
    v41 = objc_msgSend(v40, "count");
    Mutable = CFDictionaryCreateMutable(v38, v41, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v42 = *(_QWORD *)(a1 + 8);
    if (v42 && (*(_BYTE *)(v42 + 193) & 4) != 0)
    {
      v44 = *(_QWORD *)(a1 + 16);
      if (v44)
        v45 = *(void **)(v44 + 40);
      else
        v45 = 0;
      v46 = objc_msgSend(v45, "count");
      v43 = CFDictionaryCreateMutable(v38, v46, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    }
    else
    {
      v43 = 0;
    }
    v87 = v43;
    v88 = -[NSSQLiteAdapter generateTriggerForEntity:alreadyCreated:correlations:batchHistory:fragments:error:](a1, (uint64_t)v29, cf, Mutable, v43, 0, a3);
    if (v88)
    {
      if (!a2 || !*(_BYTE *)(a2 + 83))
      {
        v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (-[__CFDictionary count](cf, "count"))
        {
          if (a2)
            objc_setProperty_nonatomic((id)a2, v48, CFSTR("ZQ_BATCH_DELETE_MARSHALLING"), 88);
          v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v116[0] = MEMORY[0x1E0C809B0];
          v116[1] = 3221225472;
          v116[2] = __82__NSSQLiteAdapter__generateExternalDataRefStatementsForEntities_inRequestContext___block_invoke;
          v116[3] = &unk_1E1EDFE68;
          v116[4] = a1;
          v116[5] = CFSTR("ZQ_BATCH_DELETE_MARSHALLING");
          v116[6] = v49;
          v116[7] = v50;
          -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](cf, "enumerateKeysAndObjectsUsingBlock:", v116);
          if (objc_msgSend(v49, "count"))
          {
            v51 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, CFSTR("CREATE TEMP TABLE ZQ_BATCH_DELETE_MARSHALLING(refToDelete)"));
            objc_msgSend(v49, "insertObject:atIndex:", v51, 0);

            objc_msgSend(v47, "addObject:", v49);
            objc_msgSend(v47, "addObject:", v50);
            v52 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, CFSTR("SELECT refToDelete FROM ZQ_BATCH_DELETE_MARSHALLING"));
            v128[0] = v52;
            objc_msgSend(v47, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 1));

            v53 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, CFSTR("DROP TABLE ZQ_BATCH_DELETE_MARSHALLING"));
            v127 = v53;
            objc_msgSend(v47, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v127, 1));

          }
        }
        if (a2)
          objc_setProperty_nonatomic((id)a2, v48, v47, 128);

      }
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v54 = (void *)-[__CFDictionary allValues](cf, "allValues");
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
      if (v55)
      {
        v56 = *(_QWORD *)v113;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v113 != v56)
              objc_enumerationMutation(v54);
            v58 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
            if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") != v58)
              objc_msgSend(v33, "addObject:", objc_msgSend(v58, "firstObject"));
          }
          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
        }
        while (v55);
      }
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v59 = (void *)-[__CFDictionary allValues](Mutable, "allValues");
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
      if (v60)
      {
        v61 = *(_QWORD *)v109;
        do
        {
          for (j = 0; j != v60; ++j)
          {
            if (*(_QWORD *)v109 != v61)
              objc_enumerationMutation(v59);
            v63 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * j);
            if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") != v63)
              objc_msgSend(v33, "addObject:", objc_msgSend(v63, "firstObject"));
          }
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
        }
        while (v60);
      }
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v64 = (void *)-[__CFDictionary allValues](v87, "allValues");
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
      if (v65)
      {
        v66 = *(_QWORD *)v105;
        do
        {
          for (k = 0; k != v65; ++k)
          {
            if (*(_QWORD *)v105 != v66)
              objc_enumerationMutation(v64);
            v68 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * k);
            if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") != v68)
              objc_msgSend(v33, "addObject:", objc_msgSend(v68, "firstObject"));
          }
          v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
        }
        while (v65);
      }
      objc_msgSend(0, "addObject:", v91);
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v69 = (void *)-[__CFDictionary allValues](cf, "allValues");
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
      if (v70)
      {
        v71 = *(_QWORD *)v101;
        do
        {
          for (m = 0; m != v70; ++m)
          {
            if (*(_QWORD *)v101 != v71)
              objc_enumerationMutation(v69);
            v73 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * m);
            if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") != v73)
              objc_msgSend(v34, "addObject:", objc_msgSend(v73, "lastObject"));
          }
          v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
        }
        while (v70);
      }
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v74 = (void *)-[__CFDictionary allValues](Mutable, "allValues");
      v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v96, v120, 16);
      if (v75)
      {
        v76 = *(_QWORD *)v97;
        do
        {
          for (n = 0; n != v75; ++n)
          {
            if (*(_QWORD *)v97 != v76)
              objc_enumerationMutation(v74);
            v78 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * n);
            if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") != v78)
              objc_msgSend(v34, "addObject:", objc_msgSend(v78, "lastObject"));
          }
          v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v96, v120, 16);
        }
        while (v75);
      }
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v79 = (void *)-[__CFDictionary allValues](v87, "allValues");
      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v92, v119, 16);
      if (v80)
      {
        v81 = *(_QWORD *)v93;
        do
        {
          for (ii = 0; ii != v80; ++ii)
          {
            if (*(_QWORD *)v93 != v81)
              objc_enumerationMutation(v79);
            v83 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * ii);
            if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") != v83)
              objc_msgSend(v34, "addObject:", objc_msgSend(v83, "lastObject"));
          }
          v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v92, v119, 16);
        }
        while (v80);
      }
    }
    if (cf)
      CFRelease(cf);
    if (Mutable)
      CFRelease(Mutable);
    if (v87)
      CFRelease(v87);
    v84 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = v84;
    if (v88)
    {
      objc_msgSend(v84, "addObject:", v33);
      v118 = v91;
      objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1));
      objc_msgSend(v20, "addObject:", v34);
      v117[0] = v33;
      v117[1] = v34;
      v85 = (const void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
      os_unfair_lock_lock_with_options();
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), v85, v29);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    }

  }
  return (uint64_t)v20;
}

- (NSSQLiteStatement)newSelectStatementWithFetchRequest:(int)a3 ignoreInheritance:
{
  uint64_t v6;
  void *v7;
  NSSQLFetchRequestContext *v8;
  NSSQLiteStatement *v9;

  if (!a1)
    return 0;
  v6 = MEMORY[0x18D76B4E4]();
  if (!a2)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("missing fetch request"), 0));
  v7 = (void *)v6;
  if (_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (_QWORD *)objc_msgSend(a2, "entity")))
  {
    v8 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]([NSSQLFetchRequestContext alloc], "initWithRequest:context:sqlCore:", a2, 0, 0);
    v9 = -[NSSQLiteAdapter _newStatementForFetchRequestContext:ignoreInheritance:countOnly:nestingLevel:](a1, v8, a3, 0);

  }
  else
  {
    v9 = 0;
  }
  objc_autoreleasePoolPop(v7);
  return v9;
}

- (NSSQLiteStatement)newDropTableStatementForTableNamed:(NSSQLiteStatement *)result
{
  void *v3;
  NSSQLiteStatement *v4;

  if (result)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("DROP TABLE IF EXISTS "));
    objc_msgSend(v3, "appendString:", a2);
    v4 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v3);

    return v4;
  }
  return result;
}

- (NSSQLiteStatement)newCreateTempTableStatementForEntity:(void *)a3 withAttributesToConstrain:
{
  NSSQLiteStatement *v3;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _WORD *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t k;
  void *v29;
  id obj;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v3 = 0;
  v45 = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    if (*(_QWORD *)(a2 + 160))
    {
      return 0;
    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("CREATE TEMP TABLE "));
      objc_msgSend(v7, "appendString:", -[NSSQLEntity tempTableName](a2));
      v34 = v7;
      objc_msgSend(v7, "appendString:", CFSTR("("));
      v8 = a2;
      v32 = a2;
      while (v8)
      {
        v9 = v8;
        v8 = *(_QWORD *)(v8 + 168);
        if (v8 == v9)
        {
          v10 = a3;
          v11 = *(void **)(v9 + 72);
          goto LABEL_9;
        }
      }
      v10 = a3;
      v11 = 0;
LABEL_9:
      v12 = (void *)objc_msgSend(v11, "sortedArrayUsingFunction:context:hint:", sortColumnsByType, 0, 0);
      v13 = objc_msgSend(v12, "count");
      if (v13)
      {
        v14 = v13;
        for (i = 0; i != v14; ++i)
        {
          v16 = (_WORD *)objc_msgSend(v12, "objectAtIndex:", i);
          if (i)
            objc_msgSend(v34, "appendString:", CFSTR(", "));
          if (objc_msgSend(v16, "propertyType") != 1
            || !v16
            || (v17 = CFSTR("%@ %@ UNIQUE"), (v16[16] & 2) == 0))
          {
            v17 = CFSTR("%@ %@");
          }
          objc_msgSend(v34, "appendFormat:", v17, objc_msgSend(v16, "columnName"), -[NSSQLiteAdapter typeStringForColumn:](a1, v16));
        }
      }
      if (!v10)
        v10 = *(void **)(v32 + 216);
      if (objc_msgSend(v10, "count"))
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v18)
        {
          v19 = v18;
          obj = v10;
          v33 = *(_QWORD *)v40;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v40 != v33)
                objc_enumerationMutation(obj);
              v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
              v22 = objc_msgSend((id)objc_msgSend(v21, "valueForKey:", CFSTR("columnName")), "componentsJoinedByString:", CFSTR("_"));
              v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(", CONSTRAINT %@ UNIQUE ("), v22);
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v38 = 0u;
              v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              if (v24)
              {
                v25 = v24;
                v26 = *(_QWORD *)v36;
                v27 = 1;
                do
                {
                  for (k = 0; k != v25; ++k)
                  {
                    if (*(_QWORD *)v36 != v26)
                      objc_enumerationMutation(v21);
                    v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
                    if ((v27 & 1) == 0)
                      objc_msgSend(v23, "appendString:", CFSTR(", "));
                    objc_msgSend(v23, "appendString:", objc_msgSend(v29, "columnName"));
                    v27 = 0;
                  }
                  v25 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                  v27 = 0;
                }
                while (v25);
              }
              objc_msgSend(v23, "appendString:", CFSTR(")"));
              objc_msgSend(v34, "appendString:", v23);

            }
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          }
          while (v19);
        }
      }
      else
      {
        objc_msgSend(v34, "appendString:", CFSTR(" "));
      }
      objc_msgSend(v34, "appendString:", CFSTR(") "));
      v3 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v34);

    }
  }
  return v3;
}

- (const)typeStringForColumn:(const __CFString *)result
{
  int v3;

  if (result)
  {
    v3 = objc_msgSend(a2, "sqlType");
    if ((v3 & 0xFE) == 2)
    {
      result = CFSTR("INTEGER");
      if (a2)
      {
        if (a2[24] == 2)
          return CFSTR("INTEGER PRIMARY KEY");
      }
    }
    else
    {
      return NSSQLiteAdapter_typeStringForSQLType(v3);
    }
  }
  return result;
}

uint64_t __82__NSSQLiteAdapter__generateExternalDataRefStatementsForEntities_inRequestContext___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  unint64_t v14;
  uint64_t v15;
  NSSQLiteStatement *v16;
  NSSQLiteStatement *v17;
  uint64_t v18;
  _QWORD *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v2 = (_QWORD *)a2;
  v26 = *MEMORY[0x1E0C80C00];
  result = -[NSEntityDescription _hasAttributesWithExternalDataReferences](a2);
  if ((_DWORD)result)
  {
    v4 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(*(_QWORD *)(a1 + 32) + 8), v2);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (result)
    {
      v5 = result;
      v6 = 0x1E0CB3000uLL;
      v7 = *(_QWORD *)v22;
      v18 = *(_QWORD *)v22;
      v19 = v2;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v2);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
          if (objc_msgSend(v9, "_propertyType") == 2 && objc_msgSend(v9, "storesBinaryDataExternally"))
          {
            v10 = objc_msgSend(v9, "name");
            if (v4)
              v11 = (void *)objc_msgSend(*(id *)(v4 + 40), "objectForKey:", v10);
            else
              v11 = 0;
            v12 = objc_msgSend((id)objc_msgSend((id)v4, "rootEntity"), "tableName");
            if (v4 && !*(_QWORD *)(v4 + 160))
              v13 = &stru_1E1EE23F0;
            else
              v13 = (const __CFString *)objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", CFSTR("_%@"), objc_msgSend((id)v4, "name"));
            v14 = v6;
            v15 = objc_msgSend(v11, "columnName");
            v16 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v4, objc_msgSend(*(id *)(v6 + 2368), "stringWithFormat:", CFSTR("CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_EDR_%@_%@%@ BEFORE DELETE ON %@ FOR EACH ROW WHEN OLD.%@ IS NOT NULL BEGIN INSERT INTO %@ VALUES (OLD.%@); END"),
                      v12,
                      v15,
                      v13,
                      v12,
                      v15,
                      *(_QWORD *)(a1 + 40),
                      v15));
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);

            v17 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v4, objc_msgSend(*(id *)(v14 + 2368), "stringWithFormat:", CFSTR("DROP TRIGGER IF EXISTS ZQ_EDR_%@_%@%@"), v12, v15, v13));
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v17);

            v6 = v14;
            v7 = v18;
            v2 = v19;
          }
          ++v8;
        }
        while (v5 != v8);
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v5 = result;
      }
      while (result);
    }
  }
  return result;
}

+ (NSSQLiteStatement)generateStatementForCheckingUniqueProperties:(void *)a3 onObjects:(void *)a4 usingSQLCore:
{
  uint64_t v6;
  _QWORD *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void *v24;
  uint64_t j;
  void *v26;
  NSSQLBindVariable *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t k;
  void *v49;
  NSSQLBindVariable *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t m;
  uint64_t v57;
  NSSQLiteStatement *v58;
  void *v60;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[128];
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v6 = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "entity");
  if (v6)
  {
    if ((*(_BYTE *)(v6 + 120) & 4) != 0)
    {
      v7 = *(_QWORD **)(v6 + 72);
    }
    else
    {
      do
      {
        v7 = (_QWORD *)v6;
        v6 = objc_msgSend((id)v6, "superentity");
      }
      while (v6);
    }
  }
  else
  {
    v7 = 0;
  }
  v60 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(a4, v7);
  v8 = objc_alloc(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend((id)objc_msgSend(v7, "subentities"), "count"))
    v9 = CFSTR("Z_PK, Z_ENT");
  else
    v9 = CFSTR("Z_PK");
  v10 = (void *)objc_msgSend(v8, "initWithString:", v9);
  v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v65 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
  if (v65)
  {
    v64 = *(_QWORD *)v82;
    v63 = v10;
    do
    {
      for (i = 0; i != v65; ++i)
      {
        if (*(_QWORD *)v82 != v64)
          objc_enumerationMutation(a2);
        v12 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i);
        if (!v12)
          goto LABEL_29;
        v13 = *(unsigned __int8 *)(v12 + 24);
        if (v13 != 7)
        {
          if (v13 == 1)
          {
            v62 = i;
            v14 = (void *)objc_msgSend((id)v12, "propertyDescription");
            v67 = objc_msgSend(v14, "name");
            v15 = (void *)v12;
            v16 = objc_msgSend((id)v12, "columnName");
            v17 = v14;
            v18 = objc_msgSend(v14, "entity");
            objc_msgSend(v10, "appendFormat:", CFSTR(", %@"), v16);
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@ IN ("), v16);
            v77 = 0u;
            v78 = 0u;
            v79 = 0u;
            v80 = 0u;
            v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v78;
              v23 = 1;
              do
              {
                v24 = a3;
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v78 != v22)
                    objc_enumerationMutation(v24);
                  v26 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
                  if (objc_msgSend((id)objc_msgSend(v26, "entity"), "isKindOfEntity:", v18))
                  {
                    if ((v23 & 1) == 0)
                      objc_msgSend(v19, "appendString:", CFSTR(", "));
                    objc_msgSend(v19, "appendString:", CFSTR("? "));
                    v27 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", objc_msgSend(v26, "valueForKey:", v67), objc_msgSend(v15, "sqlType"), v17);
                    objc_msgSend(v68, "addObject:", v27);

                    v23 = 0;
                  }
                }
                a3 = v24;
                v21 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
              }
              while (v21);
            }
            objc_msgSend(v19, "appendString:", CFSTR(")"));
            objc_msgSend(v66, "addObject:", v19);

            i = v62;
            v10 = v63;
            continue;
          }
LABEL_29:
          v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unsupported property type for unique attribute on entity '%@': %@");
          v29 = objc_msgSend(v60, "name");
          _NSCoreDataLog(17, v28, v30, v31, v32, v33, v34, v35, v29);
          v36 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v37 = objc_msgSend(v60, "name");
            *(_DWORD *)buf = 138412546;
            v87 = v37;
            v88 = 2112;
            v89 = v12;
            _os_log_fault_impl(&dword_18A253000, v36, OS_LOG_TYPE_FAULT, "CoreData: Unsupported property type for unique attribute on entity '%@': %@", buf, 0x16u);
          }
          continue;
        }
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "propertyDescription");
        v39 = objc_msgSend(v38, "name");
        v40 = objc_msgSend((id)v12, "columnName");
        v41 = objc_msgSend(v38, "entity");
        objc_msgSend(v10, "appendFormat:", CFSTR(", %@"), v40);
        v42 = *(void **)(v12 + 72);
        if (v42)
          objc_msgSend(v10, "appendFormat:", CFSTR(", %@"), objc_msgSend(v42, "columnName"));
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@ IN ("), v40);
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v44 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v74;
          v47 = 1;
          do
          {
            for (k = 0; k != v45; ++k)
            {
              if (*(_QWORD *)v74 != v46)
                objc_enumerationMutation(a3);
              v49 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * k);
              if (objc_msgSend((id)objc_msgSend(v49, "entity"), "isKindOfEntity:", v41))
              {
                if ((v47 & 1) == 0)
                  objc_msgSend(v43, "appendString:", CFSTR(", "));
                objc_msgSend(v43, "appendString:", CFSTR("? "));
                v50 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v49, "valueForKey:", v39), "objectID"), "_referenceData64"), 2);
                objc_msgSend(v68, "addObject:", v50);

                v47 = 0;
              }
            }
            v45 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
          }
          while (v45);
        }
        objc_msgSend(v43, "appendString:", CFSTR(")"));
        objc_msgSend(v66, "addObject:", v43);

        v10 = v63;
      }
      v65 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
    }
    while (v65);
  }
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE ("), v10, objc_msgSend(v60, "tableName"));

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v52 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v70;
    v55 = 1;
    do
    {
      for (m = 0; m != v53; ++m)
      {
        if (*(_QWORD *)v70 != v54)
          objc_enumerationMutation(v66);
        v57 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * m);
        if ((v55 & 1) == 0)
          objc_msgSend(v51, "appendString:", CFSTR(" OR "));
        objc_msgSend(v51, "appendFormat:", CFSTR("%@"), v57);
        v55 = 0;
      }
      v53 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
      v55 = 0;
    }
    while (v53);
  }

  objc_msgSend(v51, "appendString:", CFSTR(")"));
  v58 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v60, v51);

  -[NSSQLiteAdapter _useModel:]((uint64_t)v58, v68);
  return v58;
}

- (NSSQLiteStatement)_newStatementForFetchRequestContext:(uint64_t)a1 ignoreInheritance:(void *)a2 countOnly:(int)a3 nestingLevel:(int)a4
{
  void *v8;
  void *v9;
  NSSQLGenerator *v10;
  NSSQLiteStatement *v11;

  v8 = (void *)MEMORY[0x18D76B4E4]();
  v9 = (void *)objc_msgSend(a2, "request");
  v10 = -[NSSQLGenerator initWithPersistentStore:]([NSSQLGenerator alloc], "initWithPersistentStore:", *(_QWORD *)(a1 + 8));
  if (v10)
    v11 = -[NSSQLGenerator newSQLStatementForRequest:ignoreInheritance:countOnly:nestingLevel:nestIsWhereScoped:requestContext:]((uint64_t)v10, v9, a3, a4, 0, 0, (uint64_t)a2);
  else
    v11 = 0;
  objc_autoreleasePoolPop(v8);
  return v11;
}

- (NSSQLiteStatement)newCorrelationInsertStatementForRelationship:(_QWORD *)a1
{
  NSSQLiteStatement *v4;
  _QWORD *v5;
  NSString *v6;
  NSString *sqlString;

  if (!a1)
    return 0;
  v4 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", 0);
  v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareInsertStatementForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    v6 = (NSString *)v5[3];
    if (v4)
      goto LABEL_4;
  }
  else
  {
    v6 = 0;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)-[NSString copy](v6, "copy");
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCorrelationDeleteStatementForRelationship:(_QWORD *)a1
{
  NSSQLiteStatement *v4;
  _QWORD *v5;
  NSString *v6;
  NSString *sqlString;

  if (!a1)
    return 0;
  v4 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", 0);
  v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareDeleteStatementForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    v6 = (NSString *)v5[3];
    if (v4)
      goto LABEL_4;
  }
  else
  {
    v6 = 0;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)-[NSString copy](v6, "copy");
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCorrelationMasterReorderStatementForRelationship:(_QWORD *)a1
{
  NSSQLiteStatement *v4;
  _QWORD *v5;
  NSString *v6;
  NSString *sqlString;

  if (!a1)
    return 0;
  v4 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", 0);
  v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareMasterReorderStatementForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    v6 = (NSString *)v5[3];
    if (v4)
      goto LABEL_4;
  }
  else
  {
    v6 = 0;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)-[NSString copy](v6, "copy");
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCorrelationMasterReorderStatementPart2ForRelationship:(_QWORD *)a1
{
  NSSQLiteStatement *v4;
  _QWORD *v5;
  NSString *v6;
  NSString *sqlString;

  if (!a1)
    return 0;
  v4 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", 0);
  v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareMasterReorderStatementPart2ForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    v6 = (NSString *)v5[3];
    if (v4)
      goto LABEL_4;
  }
  else
  {
    v6 = 0;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)-[NSString copy](v6, "copy");
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCorrelationReorderStatementForRelationship:(_QWORD *)a1
{
  NSSQLiteStatement *v4;
  _QWORD *v5;
  NSString *v6;
  NSString *sqlString;

  if (!a1)
    return 0;
  v4 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", 0);
  v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareReorderStatementForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    v6 = (NSString *)v5[3];
    if (v4)
      goto LABEL_4;
  }
  else
  {
    v6 = 0;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)-[NSString copy](v6, "copy");
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCreateTableStatementForEntity:(const __CFString *)a1
{
  _QWORD *v2;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BYTE *v12;
  NSSQLiteStatement *v13;

  if (!a1)
    return 0;
  v2 = a2;
  if (!a2 || a2[20])
    return 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("CREATE TABLE "));
  objc_msgSend(v5, "appendString:", objc_msgSend(v2, "tableName"));
  objc_msgSend(v5, "appendString:", CFSTR("("));
  while (v2)
  {
    v6 = v2;
    v2 = (_QWORD *)v2[21];
    if (v2 == v6)
    {
      v7 = (void *)v6[9];
      goto LABEL_9;
    }
  }
  v7 = 0;
LABEL_9:
  v8 = (void *)objc_msgSend(v7, "sortedArrayUsingFunction:context:hint:", sortColumnsByType, 0, 0);
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
    {
      v12 = (_BYTE *)objc_msgSend(v8, "objectAtIndex:", i);
      if (i)
        objc_msgSend(v5, "appendString:", CFSTR(", "));
      objc_msgSend(v5, "appendFormat:", CFSTR("%@ %@"), objc_msgSend(v12, "columnName"), -[NSSQLiteAdapter typeStringForColumn:](a1, v12));
    }
  }
  objc_msgSend(v5, "appendString:", CFSTR(") "));
  v13 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v5);

  return v13;
}

- (NSSQLiteStatement)newCreatePrimaryKeyTableStatement
{
  void *v1;
  NSSQLiteStatement *v2;

  if (result)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("CREATE TABLE "));
    objc_msgSend(v1, "appendString:", CFSTR("Z_PRIMARYKEY"));
    objc_msgSend(v1, "appendString:", CFSTR(" ("));
    objc_msgSend(v1, "appendString:", CFSTR("Z_ENT"));
    objc_msgSend(v1, "appendString:", CFSTR(" INTEGER PRIMARY KEY, "));
    objc_msgSend(v1, "appendString:", CFSTR("Z_NAME"));
    objc_msgSend(v1, "appendString:", CFSTR(" VARCHAR, "));
    objc_msgSend(v1, "appendString:", CFSTR("Z_SUPER"));
    objc_msgSend(v1, "appendString:", CFSTR(" INTEGER, "));
    objc_msgSend(v1, "appendString:", CFSTR("Z_MAX"));
    objc_msgSend(v1, "appendString:", CFSTR(" INTEGER)"));
    v2 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v1);

    return v2;
  }
  return result;
}

- (NSSQLiteStatement)newPrimaryKeyInitializeStatementForEntity:(uint64_t)a3 withInitialMaxPK:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSSQLiteStatement *v10;

  if (result)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (a2)
    {
      v6 = *(unsigned int *)(a2 + 184);
      v7 = objc_msgSend((id)a2, "name");
      v8 = *(_QWORD *)(a2 + 160);
      if (v8)
        v8 = *(unsigned int *)(v8 + 184);
    }
    else
    {
      v7 = objc_msgSend(0, "name");
      v6 = 0;
      v8 = 0;
    }
    v9 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("INSERT INTO %@(%@, %@, %@, %@) VALUES(%u, '%@', %u, %qd)"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_ENT"), CFSTR("Z_NAME"), CFSTR("Z_SUPER"), CFSTR("Z_MAX"), v6, v7, v8, a3);
    v10 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v9);

    return v10;
  }
  return result;
}

- (NSSQLiteStatement)newSimplePrimaryKeyUpdateStatementForEntity:(NSSQLiteStatement *)result
{
  void *v2;
  NSSQLiteStatement *v3;

  if (result)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = MAX((SELECT %@ FROM %@ WHERE %@ = '%@'), (SELECT CASE WHEN (SELECT COUNT(*) FROM %@)== 0 THEN 0 ELSE (SELECT MAX(%@) FROM %@) END)) WHERE %@ = '%@'"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_MAX"), CFSTR("Z_MAX"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_NAME"), objc_msgSend(a2, "name"), objc_msgSend(a2, "tableName"), CFSTR("Z_PK"), objc_msgSend(a2, "tableName"), CFSTR("Z_NAME"), objc_msgSend(a2, "name"));
    v3 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v2);

    return v3;
  }
  return result;
}

- (uint64_t)_generateFragmentsForEntity:(_QWORD *)a1 inArray:(void *)a2
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a1;
  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_msgSend(a1, "manyToManyRelationships");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        if (v3)
          v9 = (void *)v3[20];
        else
          v9 = 0;
        if ((objc_msgSend((id)objc_msgSend(v9, "manyToManyRelationships"), "containsObject:", v8) & 1) == 0)
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT CASE WHEN (SELECT COUNT(*) FROM %@) == 0 THEN 0 ELSE (SELECT MAX (%@) FROM %@) END"), objc_msgSend(v8, "correlationTableName"), objc_msgSend(v8, "columnName"), objc_msgSend(v8, "correlationTableName"));
          objc_msgSend(a2, "addObject:", v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v5 = v11;
    }
    while (v11);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (v3)
    v3 = (_QWORD *)v3[19];
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (result)
  {
    v13 = result;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v3);
        -[NSSQLiteAdapter _generateFragmentsForEntity:inArray:](*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), a2);
      }
      while (v13 != v15);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      v13 = result;
    }
    while (result);
  }
  return result;
}

- (NSSQLiteStatement)newComplexPrimaryKeyUpdateStatementForEntity:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSSQLiteStatement *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT CASE WHEN (SELECT COUNT(*) FROM %@) == 0 THEN 0 ELSE (SELECT MAX (%@) FROM %@) END"), objc_msgSend(a2, "tableName"), CFSTR("Z_PK"), objc_msgSend(a2, "tableName"));
  objc_msgSend(v3, "addObject:", v4);

  -[NSSQLiteAdapter _generateFragmentsForEntity:inArray:](a2, v3);
  if (objc_msgSend(v3, "count") == 1)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MAX((SELECT %@ FROM %@ WHERE %@ = '%@'), (%@))"), CFSTR("Z_MAX"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_NAME"), objc_msgSend(a2, "name"), objc_msgSend(v3, "lastObject"));
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("MAX((SELECT %@ FROM %@ WHERE %@ = '%@'),"), CFSTR("Z_MAX"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_NAME"), objc_msgSend(a2, "name"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = 1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v3);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((v9 & 1) == 0)
            objc_msgSend(v5, "appendString:", CFSTR(", "));
          objc_msgSend(v5, "appendFormat:", CFSTR("(%@)"), v11);
          v9 = 0;
        }
        v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v9 = 0;
      }
      while (v7);
    }
    objc_msgSend(v5, "appendString:", CFSTR(")"));
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE OR FAIL %@ SET %@ = (%@) WHERE %@ = '%@'"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_MAX"), v5, CFSTR("Z_NAME"), objc_msgSend(a2, "name"));

  v13 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v12);
  return v13;
}

- (NSSQLiteStatement)newCopyAndInsertStatementForManyToMany:(__CFString *)a3 toManyToMany:(uint64_t)a4 intermediateTableName:(int)a5 invertColumns:
{
  void *v9;
  char *data;
  char v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  const __CFString *v15;
  char *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  NSSQLiteStatement *v23;

  if (result)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("INSERT INTO "));
    objc_msgSend(v9, "appendString:", -[__CFString correlationTableName](a3, "correlationTableName"));
    objc_msgSend(v9, "appendString:", CFSTR(" ("));
    objc_msgSend(v9, "appendString:", -[__CFString columnName](a3, "columnName"));
    objc_msgSend(v9, "appendString:", CFSTR(", "));
    objc_msgSend(v9, "appendString:", -[NSSQLManyToMany inverseColumnName](a3));
    if (a3 && (data = a3[2].data) != 0)
    {
      objc_msgSend(v9, "appendString:", CFSTR(", "));
      objc_msgSend(v9, "appendString:", data);
      v11 = 0;
    }
    else
    {
      v11 = 1;
    }
    v12 = -[NSSQLManyToMany inverseOrderColumnName](a3);
    if (v12)
    {
      objc_msgSend(v9, "appendString:", CFSTR(", "));
      objc_msgSend(v9, "appendString:", v12);
    }
    objc_msgSend(v9, "appendString:", CFSTR(") SELECT "));
    if (a5)
    {
      objc_msgSend(v9, "appendString:", -[NSSQLManyToMany inverseColumnName](a2));
      objc_msgSend(v9, "appendString:", CFSTR(", "));
      objc_msgSend(v9, "appendString:", -[__CFString columnName](a2, "columnName"));
      if (v12)
      {
        v13 = -[NSSQLManyToMany inverseOrderColumnName](a2);
        objc_msgSend(v9, "appendString:", CFSTR(", "));
        if (v13)
        {
          v14 = v9;
          v15 = v13;
        }
        else
        {
          v15 = -[NSSQLManyToMany inverseColumnName](a2);
          v14 = v9;
        }
        objc_msgSend(v14, "appendString:", v15);
      }
      if ((v11 & 1) != 0)
        goto LABEL_31;
      if (!a2)
      {
        objc_msgSend(v9, "appendString:", CFSTR(", "));
        goto LABEL_21;
      }
      v19 = (__CFString *)a2[2].data;
      objc_msgSend(v9, "appendString:", CFSTR(", "));
      if (!v19)
      {
LABEL_21:
        v20 = (const __CFString *)-[__CFString columnName](a2, "columnName");
LABEL_29:
        v22 = v20;
        v21 = v9;
        goto LABEL_30;
      }
LABEL_27:
      v21 = v9;
      v22 = v19;
LABEL_30:
      objc_msgSend(v21, "appendString:", v22);
      goto LABEL_31;
    }
    objc_msgSend(v9, "appendString:", -[__CFString columnName](a2, "columnName"));
    objc_msgSend(v9, "appendString:", CFSTR(", "));
    objc_msgSend(v9, "appendString:", -[NSSQLManyToMany inverseColumnName](a2));
    if ((v11 & 1) != 0)
    {
LABEL_25:
      if (!v12)
      {
LABEL_31:
        objc_msgSend(v9, "appendString:", CFSTR(" FROM "));
        objc_msgSend(v9, "appendString:", a4);
        v23 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v9);

        return v23;
      }
      v19 = -[NSSQLManyToMany inverseOrderColumnName](a2);
      objc_msgSend(v9, "appendString:", CFSTR(", "));
      if (!v19)
      {
        v20 = -[NSSQLManyToMany inverseColumnName](a2);
        goto LABEL_29;
      }
      goto LABEL_27;
    }
    if (a2)
    {
      v16 = a2[2].data;
      objc_msgSend(v9, "appendString:", CFSTR(", "));
      if (v16)
      {
        v17 = v9;
        v18 = (uint64_t)v16;
LABEL_24:
        objc_msgSend(v17, "appendString:", v18);
        goto LABEL_25;
      }
    }
    else
    {
      objc_msgSend(v9, "appendString:", CFSTR(", "));
    }
    v18 = -[__CFString columnName](a2, "columnName");
    v17 = v9;
    goto LABEL_24;
  }
  return result;
}

- (NSSQLiteStatement)newDropTableStatementOrFailForTableNamed:(NSSQLiteStatement *)result
{
  void *v3;
  NSSQLiteStatement *v4;

  if (result)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("DROP TABLE "));
    objc_msgSend(v3, "appendString:", a2);
    v4 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v3);

    return v4;
  }
  return result;
}

- (NSSQLiteStatement)newRenameTableStatementFrom:(uint64_t)a3 to:
{
  void *v5;
  NSSQLiteStatement *v6;

  if (result)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("ALTER TABLE "));
    objc_msgSend(v5, "appendString:", a2);
    objc_msgSend(v5, "appendString:", CFSTR(" RENAME TO "));
    objc_msgSend(v5, "appendString:", a3);
    v6 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v5);

    return v6;
  }
  return result;
}

- (NSSQLiteStatement)newCreateTableStatementForManyToMany:(NSSQLiteStatement *)result
{
  void *v3;
  uint64_t v4;
  int v5;
  const __CFString *v6;
  char *data;
  __CFString *v8;
  __CFString *v9;
  NSSQLiteStatement *v10;

  if (result)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("CREATE TABLE "));
    objc_msgSend(v3, "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    objc_msgSend(v3, "appendString:", CFSTR("("));
    v4 = -[__CFString columnName](a2, "columnName");
    if (a2)
      v5 = 3;
    else
      v5 = 0;
    v6 = NSSQLiteAdapter_typeStringForSQLType(v5);
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ %@"), v4, v6);
    objc_msgSend(v3, "appendString:", CFSTR(", "));
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ %@"), -[NSSQLManyToMany inverseColumnName](a2), v6);
    if (a2)
    {
      data = a2[2].data;
      if (data)
      {
        objc_msgSend(v3, "appendString:", CFSTR(", "));
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ %@"), data, NSSQLiteAdapter_typeStringForSQLType(1));
      }
    }
    v8 = -[NSSQLManyToMany inverseOrderColumnName](a2);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v3, "appendString:", CFSTR(", "));
      objc_msgSend(v3, "appendFormat:", CFSTR("%@ %@"), v9, NSSQLiteAdapter_typeStringForSQLType(a2 != 0));
    }
    objc_msgSend(v3, "appendString:", CFSTR(", PRIMARY KEY ("));
    objc_msgSend(v3, "appendString:", -[__CFString columnName](a2, "columnName"));
    objc_msgSend(v3, "appendString:", CFSTR(", "));
    objc_msgSend(v3, "appendString:", -[NSSQLManyToMany inverseColumnName](a2));
    objc_msgSend(v3, "appendString:", CFSTR("))"));
    v10 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v3);

    return v10;
  }
  return result;
}

- (NSSQLiteStatement)newCreateIndexStatementForColumnWithName:(uint64_t)a1 inTableWithName:(uint64_t)a2
{
  void *v4;
  void *v5;
  NSSQLiteStatement *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_INDEX"), a2, a1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@ ON %@ (%@)"), v4, a2, a1);

  v6 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v5);
  return v6;
}

- (NSSQLiteStatement)newDropIndexStatementForColumn:(NSSQLiteStatement *)result
{
  if (result)
    return -[NSSQLiteAdapter newDropIndexStatementForColumnWithName:inTableWithName:](result, objc_msgSend(a2, "columnName"), objc_msgSend((id)objc_msgSend(a2, "entity"), "tableName"));
  return result;
}

- (NSSQLiteStatement)newDropIndexStatementForColumnWithName:(uint64_t)a3 inTableWithName:
{
  void *v3;
  void *v4;
  NSSQLiteStatement *v5;

  if (result)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_INDEX"), a3, a2);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP INDEX IF EXISTS %@"), v3);

    v5 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v4);
    return v5;
  }
  return result;
}

- (uint64_t)generateBinaryIndexStatementsForIndex:(uint64_t)a3 onEntity:
{
  id v4;
  uint64_t v5;

  v4 = -[NSSQLIndex initForIndexDescription:sqlEntity:]([NSSQLBinaryIndex alloc], "initForIndexDescription:sqlEntity:", a2, a3);
  v5 = objc_msgSend(v4, "generateStatementsForStore:", *(_QWORD *)(a1 + 8));

  return v5;
}

- (uint64_t)generateDropBinaryIndexStatementsForIndex:(uint64_t)a3 onEntity:
{
  id v4;
  uint64_t v5;

  v4 = -[NSSQLIndex initForIndexDescription:sqlEntity:]([NSSQLBinaryIndex alloc], "initForIndexDescription:sqlEntity:", a2, a3);
  v5 = objc_msgSend(v4, "dropStatementsForStore:", *(_QWORD *)(a1 + 8));

  return v5;
}

- (id)newCreateIndexStatementsForEntity:(char)a3 defaultIndicesOnly:
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSSQLiteStatement *v12;
  void *v13;
  uint64_t v14;
  uint64_t j;
  __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  void *v37;
  NSSQLiteStatement *v38;
  NSSQLiteStatement *v39;
  void *v40;
  void *v41;
  void *v42;
  NSSQLiteStatement *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSSQLiteStatement *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  char v70;
  id obj;
  id v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = (_QWORD *)a2;
  if (!a2)
  {
    v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    goto LABEL_4;
  }
  v4 = *(_QWORD *)(a2 + 160);
  v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
LABEL_4:
    v70 = 0;
    goto LABEL_18;
  }
  while (v3)
  {
    v5 = v3;
    v3 = (_QWORD *)v3[21];
    if (v3 == v5)
    {
      v6 = (void *)v5[9];
      goto LABEL_8;
    }
  }
  v6 = 0;
LABEL_8:
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v91 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x18D76B4E4]();
        if (objc_msgSend(v10, "propertyType") == 3)
        {
          v12 = -[NSSQLiteAdapter newCreateIndexStatementForColumnWithName:inTableWithName:](objc_msgSend(v10, "columnName"), objc_msgSend((id)objc_msgSend(v10, "entity"), "tableName"));
          objc_msgSend(v74, "addObject:", v12);

        }
        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
    }
    while (v7);
  }
  v70 = 1;
  v3 = (_QWORD *)a2;
LABEL_18:
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v13 = (void *)objc_msgSend(v3, "manyToManyRelationships");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
  if (v14)
  {
    v75 = *(_QWORD *)v87;
    obj = v13;
    do
    {
      v76 = v14;
      for (j = 0; j != v76; ++j)
      {
        if (*(_QWORD *)v87 != v75)
          objc_enumerationMutation(obj);
        v16 = *(__CFString **)(*((_QWORD *)&v86 + 1) + 8 * j);
        v17 = (void *)MEMORY[0x18D76B4E4]();
        if (v16)
        {
          if (v16[2].isa)
          {
            if (-[__CFString entity](v16, "entity") == a2)
            {
              if (v16[2].isa)
              {
                v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_INDEX"), -[__CFString correlationTableName](v16, "correlationTableName"), -[NSSQLManyToMany inverseColumnName](v16));
                v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@ ON %@ (%@, %@)"), v41, -[__CFString correlationTableName](v16, "correlationTableName"), -[NSSQLManyToMany inverseColumnName](v16), -[__CFString columnName](v16, "columnName"));

                v43 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v42);
                if (v43)
                {
                  objc_msgSend(v74, "addObject:", v43);

                }
              }
            }
          }
          if (objc_msgSend((id)-[__CFString propertyDescription](v16, "propertyDescription"), "isOrdered"))
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[__CFString propertyDescription](v16, "propertyDescription"), "userInfo"), "objectForKey:", CFSTR("NSRelationshipDescriptionOrderKeyIndexOption")), "BOOLValue"))
            {
              v18 = objc_alloc(MEMORY[0x1E0CB3940]);
              v19 = -[__CFString correlationTableName](v16, "correlationTableName");
              v20 = -[__CFString columnName](v16, "columnName");
              v21 = -[NSSQLManyToMany inverseColumnName](v16);
              v22 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("%@_%@_%@_%@_INDEX"), v19, v20, v21, -[NSSQLManyToMany inverseOrderColumnName](v16));
              v23 = objc_alloc(MEMORY[0x1E0CB3940]);
              v24 = -[__CFString correlationTableName](v16, "correlationTableName");
              v25 = -[__CFString columnName](v16, "columnName");
              v26 = -[NSSQLManyToMany inverseColumnName](v16);
              v27 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@ ON %@ (%@, %@, %@)"), v22, v24, v25, v26, -[NSSQLManyToMany inverseOrderColumnName](v16));
              v28 = objc_alloc(MEMORY[0x1E0CB3940]);
              v29 = -[__CFString correlationTableName](v16, "correlationTableName");
              v30 = -[__CFString columnName](v16, "columnName");
              v31 = -[NSSQLManyToMany inverseOrderColumnName](v16);
              v32 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("%@_%@_%@_%@_INDEX"), v29, v30, v31, -[NSSQLManyToMany inverseColumnName](v16));
              v33 = objc_alloc(MEMORY[0x1E0CB3940]);
              v34 = -[__CFString correlationTableName](v16, "correlationTableName");
              v35 = -[__CFString columnName](v16, "columnName");
              v36 = -[NSSQLManyToMany inverseOrderColumnName](v16);
              v37 = (void *)objc_msgSend(v33, "initWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@ ON %@ (%@, %@, %@)"), v32, v34, v35, v36, -[NSSQLManyToMany inverseColumnName](v16));
              v38 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v27);
              v39 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v37);
              v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v38, v39, 0);

              if (v40)
              {
                objc_msgSend(v74, "addObjectsFromArray:", v40);

              }
            }
          }
        }
        objc_autoreleasePoolPop(v17);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
    }
    while (v14);
  }
  v44 = v70 ^ 1;
  if (!a2)
    v44 = 1;
  if ((v44 & 1) == 0)
  {
    v45 = *(void **)(a2 + 152);
    if (v45)
    {
      if (objc_msgSend(v45, "count"))
      {
        v46 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a2, "entityDescription"), "userInfo"), "objectForKey:", CFSTR("_NSEntityOmitSubentityColumnIndex"));
        v47 = v46;
        if (!v46
          || !objc_msgSend(v46, "isNSString")
          || (v48 = (void *)objc_msgSend(v47, "lowercaseString"), (v49 = v48) == 0)
          || (objc_msgSend(v48, "isEqualToString:", CFSTR("yes")) & 1) == 0
          && (objc_msgSend(v49, "isEqualToString:", CFSTR("1")) & 1) == 0)
        {
          v50 = -[NSSQLiteAdapter newCreateIndexStatementForColumnWithName:inTableWithName:](objc_msgSend(*(id *)(a2 + 136), "columnName"), objc_msgSend((id)objc_msgSend(*(id *)(a2 + 136), "entity"), "tableName"));
          objc_msgSend(v74, "addObject:", v50);

        }
      }
    }
  }
  if ((a3 & 1) == 0)
  {
    v51 = (void *)objc_msgSend((id)a2, "entityDescription");
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v52 = (void *)objc_msgSend(v51, "indexes");
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
    if (v53)
    {
      v54 = *(_QWORD *)v83;
      do
      {
        v55 = 0;
        do
        {
          if (*(_QWORD *)v83 != v54)
            objc_enumerationMutation(v52);
          v56 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v55);
          v57 = (void *)MEMORY[0x18D76B4E4]();
          if (objc_msgSend((id)objc_msgSend(v56, "elements"), "count"))
          {
            v58 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v56, "elements"), "firstObject"), "collationType");
            if (v58 == 1)
            {
              if (a2)
                v60 = (void *)objc_msgSend(*(id *)(a2 + 232), "objectForKey:", objc_msgSend(v56, "name"));
              else
                v60 = 0;
              v59 = objc_msgSend(v60, "generateStatementsForStore:", *(_QWORD *)(a1 + 8));
            }
            else
            {
              if (v58)
                goto LABEL_62;
              v59 = -[NSSQLiteAdapter generateBinaryIndexStatementsForIndex:onEntity:](a1, (uint64_t)v56, a2);
            }
            if (v59)
              objc_msgSend(v74, "addObjectsFromArray:", v59);
          }
LABEL_62:
          objc_autoreleasePoolPop(v57);
          ++v55;
        }
        while (v53 != v55);
        v61 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
        v53 = v61;
      }
      while (v61);
    }
    v62 = (void *)objc_msgSend(v51, "_uniquenessConstraintsAsFetchIndexes");
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v79;
      do
      {
        for (k = 0; k != v63; ++k)
        {
          if (*(_QWORD *)v79 != v64)
            objc_enumerationMutation(v62);
          v66 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * k);
          v67 = (void *)MEMORY[0x18D76B4E4]();
          v68 = -[NSSQLiteAdapter generateBinaryIndexStatementsForIndex:onEntity:](a1, v66, a2);
          if (v68)
            objc_msgSend(v74, "addObjectsFromArray:", v68);
          objc_autoreleasePoolPop(v67);
        }
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
      }
      while (v63);
    }
  }
  return v74;
}

- (id)newDropIndexStatementsForEntity:(char)a3 defaultIndicesOnly:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSSQLiteStatement *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  NSSQLiteStatement *v21;
  uint64_t v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSSQLiteStatement *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  char v46;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!a2)
  {
    v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    goto LABEL_4;
  }
  v5 = *(_QWORD *)(a2 + 160);
  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
LABEL_4:
    v46 = 0;
    goto LABEL_19;
  }
  v6 = a2;
  while (v6)
  {
    v7 = v6;
    v6 = *(_QWORD *)(v6 + 168);
    if (v6 == v7)
    {
      v8 = *(void **)(v7 + 72);
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v62 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        if (objc_msgSend(v12, "propertyType") == 3)
        {
          v13 = -[NSSQLiteAdapter newDropIndexStatementForColumnWithName:inTableWithName:](a1, objc_msgSend(v12, "columnName"), objc_msgSend((id)objc_msgSend(v12, "entity"), "tableName"));
          objc_msgSend(v48, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    }
    while (v9);
  }
  v46 = 1;
LABEL_19:
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v14 = (void *)objc_msgSend((id)a2, "manyToManyRelationships");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v58;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v58 != v16)
          objc_enumerationMutation(v14);
        v18 = *(__CFString **)(*((_QWORD *)&v57 + 1) + 8 * v17);
        if (v18)
        {
          if (v18[2].isa)
          {
            if (objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v17), "entity") == a2)
            {
              if (v18[2].isa)
              {
                v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_INDEX"), -[__CFString correlationTableName](v18, "correlationTableName"), -[NSSQLManyToMany inverseColumnName](v18));
                v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP INDEX IF EXISTS %@"), v19);

                v21 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v20);
                if (v21)
                {
                  objc_msgSend(v48, "addObject:", v21);

                }
              }
            }
          }
        }
        ++v17;
      }
      while (v15 != v17);
      v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      v15 = v22;
    }
    while (v22);
  }
  v23 = v46 ^ 1;
  if (!a2)
    v23 = 1;
  if ((v23 & 1) == 0)
  {
    v24 = *(void **)(a2 + 152);
    if (v24)
    {
      if (objc_msgSend(v24, "count"))
      {
        v25 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a2, "entityDescription"), "userInfo"), "objectForKey:", CFSTR("_NSEntityOmitSubentityColumnIndex"));
        v26 = v25;
        if (!v25
          || !objc_msgSend(v25, "isNSString")
          || (v27 = (void *)objc_msgSend(v26, "lowercaseString"), (v28 = v27) == 0)
          || (objc_msgSend(v27, "isEqualToString:", CFSTR("yes")) & 1) == 0
          && (objc_msgSend(v28, "isEqualToString:", CFSTR("1")) & 1) == 0)
        {
          v29 = -[NSSQLiteAdapter newDropIndexStatementForColumnWithName:inTableWithName:](a1, objc_msgSend(*(id *)(a2 + 136), "columnName"), objc_msgSend((id)objc_msgSend(*(id *)(a2 + 136), "entity"), "tableName"));
          objc_msgSend(v48, "addObject:", v29);

        }
      }
    }
  }
  if ((a3 & 1) == 0)
  {
    v30 = (void *)objc_msgSend((id)a2, "entityDescription");
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v31 = (void *)objc_msgSend(v30, "indexes");
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v54;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v54 != v33)
            objc_enumerationMutation(v31);
          v35 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v34);
          if (objc_msgSend((id)objc_msgSend(v35, "elements"), "count"))
          {
            v36 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "elements"), "firstObject"), "collationType");
            if (v36 == 1)
            {
              if (a2)
                v38 = (void *)objc_msgSend(*(id *)(a2 + 232), "objectForKey:", objc_msgSend(v35, "name"));
              else
                v38 = 0;
              v37 = objc_msgSend(v38, "dropStatementsForStore:", a1->_entity);
            }
            else
            {
              if (v36)
                goto LABEL_59;
              v37 = -[NSSQLiteAdapter generateDropBinaryIndexStatementsForIndex:onEntity:]((uint64_t)a1, (uint64_t)v35, a2);
            }
            if (v37)
              objc_msgSend(v48, "addObjectsFromArray:", v37);
          }
LABEL_59:
          ++v34;
        }
        while (v32 != v34);
        v39 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
        v32 = v39;
      }
      while (v39);
    }
    v40 = (void *)objc_msgSend(v30, "_uniquenessConstraintsAsFetchIndexes");
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v50 != v42)
            objc_enumerationMutation(v40);
          v44 = -[NSSQLiteAdapter generateDropBinaryIndexStatementsForIndex:onEntity:]((uint64_t)a1, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j), a2);
          if (v44)
            objc_msgSend(v48, "addObjectsFromArray:", v44);
        }
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
      }
      while (v41);
    }
  }
  return v48;
}

- (id)newCreateTriggersForEntity:(void *)a3 existingRtreeTables:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSSQLiteStatement *v19;
  id v20;
  uint64_t v21;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id *v32;
  NSSQLLocationAttributeRTreeExtension *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "entityDescription"), "attributesByName"), "allValues");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v37;
    v31 = v4;
    v32 = a2;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v7);
        if (objc_msgSend(v8, "_propertyType") != 6)
        {
          if (objc_msgSend((id)objc_msgSend(v8, "userInfo"), "objectForKey:", CFSTR("NSTriggerKey")))
          {
            v9 = objc_msgSend(v8, "name");
            if (a2)
              v10 = (void *)objc_msgSend(a2[5], "objectForKey:", v9);
            else
              v10 = 0;
            v44 = 0;
            v46 = 0;
            v47 = &v46;
            v48 = 0x3052000000;
            v49 = __Block_byref_object_copy__324;
            v50 = __Block_byref_object_dispose__325;
            v51 = 0;
            v11 = +[NSSQLAttributeExtensionFactory newExtensionsForAttribute:error:]((uint64_t)NSSQLAttributeExtensionFactory, v10, &v44);
            v12 = v11;
            if (v11)
            {
              if (objc_msgSend(v11, "count"))
              {
                *(_QWORD *)&v40 = MEMORY[0x1E0C809B0];
                *((_QWORD *)&v40 + 1) = 3221225472;
                *(_QWORD *)&v41 = __72__NSSQLiteAdapter_createSQLStatementsForTriggerAttribute_withSQLEntity___block_invoke;
                *((_QWORD *)&v41 + 1) = &unk_1E1EDFE90;
                *(_QWORD *)&v42 = &v46;
                objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v40);
              }
              else
              {
                v20 = objc_alloc_init(MEMORY[0x1E0C99D20]);
                v47[5] = (uint64_t)v20;
              }
            }
            if (!v47[5])
            {
              v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v24 = v23;
              if (v44)
                objc_msgSend(v23, "setObject:forKey:", v44, *MEMORY[0x1E0CB3388]);
              v25 = (id)objc_msgSend(v24, "copy");

              v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 134060, (uint64_t)CFSTR("Invalid trigger configuration."), v25);
              objc_exception_throw(v26);
            }

            v14 = (id)v47[5];
            _Block_object_dispose(&v46, 8);
            if (v14)
              goto LABEL_34;
            goto LABEL_35;
          }
          if (!objc_msgSend(v8, "attributeType")
            && objc_msgSend((id)objc_msgSend(v8, "userInfo"), "objectForKey:", CFSTR("_NSLocationAttributeDerivedComponents")))
          {
            v44 = 0;
            v13 = objc_msgSend((id)objc_msgSend(v8, "userInfo"), "objectForKey:", CFSTR("_NSLocationAttributeDerivedComponents"));
            if (!v13)
              goto LABEL_45;
            v34 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]([NSSQLLocationAttributeRTreeExtension alloc], "initWithObjectFromUserInfo:onAttributeNamed:onEntity:", v13, objc_msgSend(v8, "name"), a2);
            if (!v34 || (objc_msgSend(a3, "containsObject:", v34->_rtreeTableName) & 1) != 0)
            {

LABEL_45:
              v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v28 = v27;
              if (v44)
                objc_msgSend(v27, "setObject:forKey:", v44, *MEMORY[0x1E0CB3388]);
              v29 = (id)objc_msgSend(v28, "copy");

              v30 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 134060, (uint64_t)CFSTR("Invalid location index configuration."), v29);
              objc_exception_throw(v30);
            }
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            if (-[NSSQLLocationAttributeRTreeExtension validate:](v34, "validate:", &v44))
            {
              v42 = 0u;
              v43 = 0u;
              v40 = 0u;
              v41 = 0u;
              v15 = -[NSSQLLocationAttributeRTreeExtension insertSQLStrings](v34, "insertSQLStrings");
              v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v40, &v46, 16);
              if (v16)
              {
                v17 = *(_QWORD *)v41;
                do
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v41 != v17)
                      objc_enumerationMutation(v15);
                    v19 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
                    if (v19)
                      objc_msgSend(v14, "addObject:", v19);

                  }
                  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v40, &v46, 16);
                }
                while (v16);
              }
            }

            v4 = v31;
            a2 = v32;
            if (!v14)
              goto LABEL_45;
LABEL_34:
            objc_msgSend(v35, "addObjectsFromArray:", v14);
LABEL_35:

          }
        }
        ++v7;
      }
      while (v7 != v5);
      v21 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      v5 = v21;
    }
    while (v21);
  }
  return v35;
}

- (void)generateBatchDeleteUpdateHistoryTriggerForEntity:(void *)a1 andRelationship:(void *)a2 batchHistory:(void *)a3 error:(const __CFDictionary *)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSString *v22;
  NSSQLiteStatement *v23;
  NSSQLiteStatement *v24;
  NSString *sqlString;
  NSString *v26;
  NSSQLiteStatement *v27;
  NSString *v28;
  void *v29;
  const void *v30;
  void *Value;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v38;
  NSSQLiteStatement *v39;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("CHANGE"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(*(id *)(v5 + 40), "objectForKey:", CFSTR("COLUMNS"));
    v8 = (void *)objc_msgSend(*(id *)(v6 + 40), "objectForKey:", CFSTR("ENTITYPK"));
    v9 = (void *)objc_msgSend(*(id *)(v6 + 40), "objectForKey:", CFSTR("ENTITY"));
    v33 = (void *)objc_msgSend(*(id *)(v6 + 40), "objectForKey:", CFSTR("CHANGETYPE"));
  }
  else
  {
    v9 = 0;
    v7 = 0;
    v8 = 0;
    v33 = 0;
  }
  v35 = a3;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("(SELECT NSPersistentHistoryBatchDeleteUpdateTrigger(Z_ENT, '%@'))"), objc_msgSend(a3, "name"));
  v34 = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ON CONFLICT(%@, %@) DO UPDATE SET %@ = NSPersistentHistoryBatchDeleteUpdateTriggerDataBlobOperator(%@, excluded.%@)"), objc_msgSend(v8, "columnName"), objc_msgSend(v9, "columnName"), objc_msgSend(v7, "columnName"), objc_msgSend(v7, "columnName"), objc_msgSend(v7, "columnName"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FROM %@ WHERE Z_PK = OLD.Z_PK"), objc_msgSend(a2, "tableName"));
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = -[NSSQLEntity tempTableName](v6);
  if (v6)
    v14 = *(void **)(v6 + 136);
  else
    v14 = 0;
  v15 = objc_msgSend(v14, "columnName");
  v16 = objc_msgSend(v8, "columnName");
  v17 = objc_msgSend(v34, "columnName");
  v18 = objc_msgSend(v33, "columnName");
  v19 = objc_msgSend(v7, "columnName");
  if (v6)
    v20 = *(unsigned int *)(v6 + 184);
  else
    v20 = 0;
  v21 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@, %@, %@) SELECT %u, Z_PK, Z_ENT, %ld, %@ %@ %@;"),
                  v13,
                  v15,
                  v16,
                  v17,
                  v18,
                  v19,
                  v20,
                  1,
                  v38,
                  v11,
                  v10);

  v22 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_%@_%@_HISTORYBATCHDELETEUPDATE_TRIGGER AFTER UPDATE OF %@ ON %@ FOR EACH ROW BEGIN %@ END"), objc_msgSend(a2, "tableName"), objc_msgSend(v35, "columnName"), objc_msgSend(v35, "columnName"), objc_msgSend(a2, "tableName"), v21);
  v23 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", a2);
  v24 = v23;
  if (v23)
  {
    sqlString = v23->_sqlString;
    if (sqlString != v22)
    {

      v24->_sqlString = (NSString *)-[NSString copy](v22, "copy");
    }
  }
  v26 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS ZQ_%@_%@_HISTORYBATCHDELETEUPDATE_TRIGGER"), objc_msgSend(a2, "tableName"), objc_msgSend(v35, "columnName"));
  v27 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", a2);
  v39 = v27;
  if (v27)
  {
    v28 = v27->_sqlString;
    if (v28 != v26)
    {

      v39->_sqlString = (NSString *)-[NSString copy](v26, "copy");
    }
  }

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v24, v39, 0);
  v30 = (const void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), objc_msgSend(a2, "name"), objc_msgSend(v35, "name"));
  Value = (void *)CFDictionaryGetValue(a4, v30);
  v32 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (!Value || (void *)v32 == Value)
    CFDictionarySetValue(a4, v30, v29);
  else
    objc_msgSend(Value, "addObjectsFromArray:", v29);

}

- (uint64_t)generateDeleteHistoryTriggerForEntity:(uint64_t)a1 error:(_QWORD *)a2
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  unint64_t v28;
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  NSString *v36;
  NSSQLiteStatement *v37;
  NSSQLiteStatement *v38;
  NSString *sqlString;
  NSString *v40;
  NSSQLiteStatement *v41;
  NSSQLiteStatement *v42;
  NSString *v43;
  uint64_t v44;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[7];
  _QWORD v61[6];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), a2);
  v48 = objc_msgSend((id)v3, "tableName");
  if (v3)
  {
    v50 = objc_msgSend(*(id *)(v3 + 136), "columnName");
    v4 = *(void **)(v3 + 128);
  }
  else
  {
    v50 = objc_msgSend(0, "columnName");
    v4 = 0;
  }
  v47 = objc_msgSend(v4, "columnName");
  v49 = v3;
  v5 = (void *)+[_PFPersistentHistoryModel _tombstonesColumnsForEntity:]((uint64_t)_PFPersistentHistoryModel, v3);
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "ancillarySQLModels"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")), "entityNamed:", CFSTR("CHANGE"));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(*(id *)(v6 + 40), "objectForKey:", CFSTR("ENTITYPK"));
    v9 = (void *)objc_msgSend(*(id *)(v7 + 40), "objectForKey:", CFSTR("ENTITY"));
    v10 = (void *)objc_msgSend(*(id *)(v7 + 40), "objectForKey:", CFSTR("CHANGETYPE"));
  }
  else
  {
    v9 = 0;
    v8 = 0;
    v10 = 0;
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ "), -[NSSQLEntity tempTableName](v7));
  v12 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v46 = (void *)v11;
  if (v7)
    v13 = *(void **)(v7 + 136);
  else
    v13 = 0;
  v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@, %@, %@, %@"), objc_msgSend(v13, "columnName"), objc_msgSend(v8, "columnName"), objc_msgSend(v9, "columnName"), objc_msgSend(v10, "columnName"));
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v5, "count"))
  {
    v16 = objc_msgSend(v5, "count");
    v63[3] = v16;
    if (v49)
      v17 = *(unsigned int *)(v49 + 184);
    else
      v17 = 0;
    objc_msgSend(v15, "setObject:forKey:", v5, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v17));
  }
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3052000000;
  v61[3] = __Block_byref_object_copy__28;
  v61[4] = __Block_byref_object_dispose__28;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __63__NSSQLiteAdapter_generateDeleteHistoryTriggerForEntity_error___block_invoke;
  v60[3] = &unk_1E1EDFE40;
  v60[4] = v15;
  v60[5] = &v62;
  v60[6] = v61;
  v61[5] = v60;
  __63__NSSQLiteAdapter_generateDeleteHistoryTriggerForEntity_error___block_invoke((uint64_t)v60, v49);
  if (v63[3])
  {
    v18 = 1;
    do
      objc_msgSend(v14, "appendFormat:", CFSTR(", Z%@%u"), CFSTR("TOMBSTONE"), v18 - 1);
    while (v63[3] > (unint64_t)v18++);
  }
  v20 = objc_alloc(MEMORY[0x1E0CB37A0]);
  if (v7)
    v21 = *(unsigned int *)(v7 + 184);
  else
    v21 = 0;
  v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("SELECT %d, %@, %@, %ld"), v21, v47, v50, 2);
  if (v63[3])
  {
    v23 = objc_msgSend(v5, "count");
    v24 = v63[3];
    if (v23 == v24)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v57 != v26)
              objc_enumerationMutation(v5);
            objc_msgSend(v22, "appendFormat:", CFSTR(", OLD.%@"), *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
          }
          v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
        }
        while (v25);
      }
    }
    else if (v24)
    {
      v28 = 0;
      v29 = 0;
      do
      {
        v51 = v29;
        objc_msgSend(v22, "appendFormat:", CFSTR(", CASE %@ "), v50);
        v30 = v14;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v31 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v53 != v32)
                objc_enumerationMutation(v15);
              v34 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
              v35 = (void *)objc_msgSend(v15, "objectForKey:", v34);
              if (objc_msgSend(v35, "count") > v28)
                objc_msgSend(v22, "appendFormat:", CFSTR("WHEN %@ THEN (SELECT %@) "), v34, objc_msgSend(v35, "objectAtIndexedSubscript:", v28));
            }
            v31 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
          }
          while (v31);
        }
        objc_msgSend(v22, "appendFormat:", CFSTR("ELSE NULL "));
        v14 = v30;
        objc_msgSend(v22, "appendFormat:", CFSTR("END "));
        v28 = (v51 + 1);
        v29 = v51 + 1;
      }
      while (v63[3] > v28);
    }
  }
  objc_msgSend(v46, "appendFormat:", CFSTR("(%@) %@ FROM %@ WHERE %@ = OLD.%@;"), v14, v22, v48, v47, v47);

  v36 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_%@_HISTORYBATCHDELETE_TRIGGER BEFORE DELETE ON %@ FOR EACH ROW BEGIN %@ END"), v48, v48, v46);
  v37 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", v49);
  v38 = v37;
  if (v37)
  {
    sqlString = v37->_sqlString;
    if (sqlString != v36)
    {

      v38->_sqlString = (NSString *)-[NSString copy](v36, "copy");
    }
  }
  v40 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER IF EXISTS ZQ_%@_HISTORYBATCHDELETE_TRIGGER"), v48);
  v41 = -[NSSQLiteStatement initWithEntity:]([NSSQLiteStatement alloc], "initWithEntity:", v49);
  v42 = v41;
  if (v41)
  {
    v43 = v41->_sqlString;
    if (v43 != v40)
    {

      v42->_sqlString = (NSString *)-[NSString copy](v40, "copy");
    }
  }
  v44 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v38, v42, 0);

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(&v62, 8);
  return v44;
}

uint64_t __63__NSSQLiteAdapter_generateDeleteHistoryTriggerForEntity_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v2 = a2;
  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)+[_PFPersistentHistoryModel _tombstonesColumnsForEntity:]((uint64_t)_PFPersistentHistoryModel, a2);
  if (objc_msgSend(v4, "count"))
  {
    v5 = v2 ? *(unsigned int *)(v2 + 184) : 0;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v5));
    if ((unint64_t)objc_msgSend(v4, "count") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "count");
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  if (v2)
    v2 = *(_QWORD *)(v2 + 152);
  result = objc_msgSend((id)v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation((id)v2);
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend((id)v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (NSSQLiteStatement)generateSQLStatmentForSourcesAndOrderKeysForDestination:(_QWORD *)a3 inToMany:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSSQLiteStatement *v20;

  if (result)
  {
    v5 = objc_msgSend(a3, "sourceEntity");
    if (v5)
    {
      v6 = v5;
      v7 = *(unsigned int *)(v5 + 184);
      v8 = (void *)objc_msgSend(a3, "destinationEntity");
      v9 = *(void **)(v6 + 152);
    }
    else
    {
      v8 = (void *)objc_msgSend(a3, "destinationEntity");
      v7 = 0;
      v9 = 0;
    }
    v10 = objc_msgSend(v9, "count");
    if (a3)
      v11 = (_QWORD *)a3[7];
    else
      v11 = 0;
    v12 = objc_msgSend((id)objc_msgSend(v11, "foreignKey"), "columnName");
    if (v10)
    {
      if (v11)
        v13 = (void *)v11[9];
      else
        v13 = 0;
      v14 = objc_msgSend(v13, "columnName");
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v7);
    }
    v15 = v14;
    if (v11)
      v16 = (void *)v11[10];
    else
      v16 = 0;
    v17 = objc_msgSend(v16, "columnName");
    v18 = objc_msgSend(v8, "tableName");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@ WHERE Z_PK = %u"), v12, v15, v17, v18, objc_msgSend(a2, "_referenceData64"));
    v20 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v19);

    return v20;
  }
  return result;
}

- (NSSQLiteStatement)generateSQLStatmentForSourcesAndOrderKeysForDestination:(__CFString *)a3 inManyToMany:
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSSQLiteStatement *v18;
  uint64_t v19;
  uint64_t v20;

  if (result)
  {
    v5 = -[__CFString sourceEntity](a3, "sourceEntity");
    v6 = (_QWORD *)v5;
    if (v5)
    {
      v7 = *(unsigned int *)(v5 + 184);
      v5 = *(_QWORD *)(v5 + 152);
    }
    else
    {
      v7 = 0;
    }
    v8 = objc_msgSend((id)v5, "count");
    v9 = -[__CFString correlationTableName](a3, "correlationTableName");
    v10 = objc_msgSend(v6, "tableName");
    v11 = -[__CFString columnName](a3, "columnName");
    v12 = -[NSSQLManyToMany inverseOrderColumnName](a3);
    if (v8)
    {
      if (v6)
        v13 = (void *)v6[17];
      else
        v13 = 0;
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("T1.%@"), objc_msgSend(v13, "columnName"));
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT T0.%@, %@, T0.%@ from %@ T0 JOIN %@ T1 on t0.%@ = t1.Z_PK where T0.%@ = %u"), v11, v14, v12, v9, v10, v11, -[NSSQLManyToMany inverseColumnName](a3), objc_msgSend(a2, "_referenceData64"));
    }
    else
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v7);
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@ WHERE %@ = %u"), v11, v16, v12, v9, -[NSSQLManyToMany inverseColumnName](a3), objc_msgSend(a2, "_referenceData64"), v19, v20);
    }
    v17 = (void *)v15;
    v18 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v6, v15);

    return v18;
  }
  return result;
}

+ (NSSQLiteStatement)generateStatementForCheckingMulticolumnConstraint:(void *)a3 onObjects:(void *)a4 usingSQLCore:
{
  uint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  unsigned __int8 *v14;
  int v15;
  id v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  unsigned __int8 *v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  int v24;
  uint64_t v25;
  unsigned __int8 *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t j;
  void *v37;
  NSSQLBindVariable *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSSQLiteStatement *v46;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _QWORD v74[2];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v59 = a3;
  v6 = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "entity");
  if (v6)
  {
    if ((*(_BYTE *)(v6 + 120) & 4) != 0)
    {
      v7 = *(_QWORD **)(v6 + 72);
    }
    else
    {
      do
      {
        v7 = (_QWORD *)v6;
        v6 = objc_msgSend((id)v6, "superentity");
      }
      while (v6);
    }
  }
  else
  {
    v7 = 0;
  }
  v48 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(a4, v7);
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (!v9)
    goto LABEL_20;
  v10 = v9;
  v11 = *(_QWORD *)v65;
  v12 = 1;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v65 != v11)
        objc_enumerationMutation(a2);
      v14 = *(unsigned __int8 **)(*((_QWORD *)&v64 + 1) + 8 * i);
      if ((v12 & 1) == 0)
        objc_msgSend(v8, "appendString:", CFSTR(", "));
      if (v14)
      {
        v15 = v14[24];
        if (v15 != 1)
        {
          if (v15 != 7)
            goto LABEL_18;
          v14 = (unsigned __int8 *)objc_msgSend(v14, "foreignKey");
        }
        objc_msgSend(v8, "appendString:", objc_msgSend(v14, "columnName"));
      }
LABEL_18:
      v12 = 0;
    }
    v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    v12 = 0;
  }
  while (v10);
LABEL_20:
  v16 = objc_alloc(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend((id)objc_msgSend(v7, "subentities"), "count"))
    v17 = CFSTR("Z_PK, Z_ENT");
  else
    v17 = CFSTR("Z_PK");
  v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("SELECT %@, %@ FROM %@ WHERE Z_PK IN ("), v17, v8, objc_msgSend(v48, "tableName"));

  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v52 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
  if (!v52)
  {
    objc_msgSend(v18, "appendString:", CFSTR(")"));
    goto LABEL_72;
  }
  v54 = 1;
  v50 = v18;
  v51 = *(_QWORD *)v61;
  while (2)
  {
    v19 = 0;
    while (2)
    {
      if (*(_QWORD *)v61 != v51)
        objc_enumerationMutation(a2);
      v20 = *(unsigned __int8 **)(*((_QWORD *)&v60 + 1) + 8 * v19);
      objc_opt_self();
      v21 = (void *)objc_msgSend(v20, "propertyDescription");
      v22 = objc_msgSend(v21, "entity");
      v58 = v21;
      v57 = objc_msgSend(v21, "name");
      v23 = v20 != 0;
      v55 = v19;
      if (!v20)
      {
        v27 = 0;
        v56 = 0;
        goto LABEL_33;
      }
      v24 = v20[24];
      v25 = objc_msgSend(v20, "columnName");
      if (v24 == 7)
      {
        v26 = v20;
        if (v20[24] == 3)
          v26 = (unsigned __int8 *)objc_msgSend(v20, "toOneRelationship");
        v56 = objc_msgSend((id)objc_msgSend(v26, "propertyDescription"), "name");
        v27 = (void *)objc_msgSend(v20, "foreignKey");
LABEL_33:
        v28 = objc_msgSend(v27, "columnName");
      }
      else
      {
        v28 = v25;
        v23 = 0;
        v56 = 0;
      }
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SELECT Z_PK FROM %@ WHERE %@ IN ("), objc_msgSend((id)objc_msgSend(v20, "entity"), "tableName"), v28);
      v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v31 = objc_msgSend(v20, "sqlType");
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v32 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v69;
        v35 = 1;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v69 != v34)
              objc_enumerationMutation(v59);
            v37 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
            if (objc_msgSend((id)objc_msgSend(v37, "entity"), "isKindOfEntity:", v22))
            {
              if ((v35 & 1) == 0)
                objc_msgSend(v29, "appendString:", CFSTR(", "));
              if (v30)
              {
                objc_msgSend(v29, "appendString:", CFSTR("?"));
                v38 = [NSSQLBindVariable alloc];
                if (v23)
                  v39 = -[NSSQLBindVariable initWithInt64:sqlType:](v38, "initWithInt64:sqlType:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "valueForKey:", v56), "objectID"), "_referenceData64"), 2);
                else
                  v39 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v38, "initWithValue:sqlType:propertyDescription:", objc_msgSend(v37, "valueForKey:", v57), v31, v58);
                v40 = (void *)v39;
                objc_msgSend(v30, "addObject:", v39);

              }
              v35 = 0;
            }
          }
          v33 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
        }
        while (v33);
        objc_msgSend(v29, "appendString:", CFSTR(")"));
        if ((v35 & 1) != 0)
        {
          v41 = 0;
          v18 = v50;
          goto LABEL_54;
        }
        v42 = v55;
        if (v30)
        {
          v74[0] = v29;
          v74[1] = v30;
          v43 = (void *)MEMORY[0x1E0C99D20];
          v44 = 2;
        }
        else
        {
          v74[0] = v29;
          v43 = (void *)MEMORY[0x1E0C99D20];
          v44 = 1;
        }
        v41 = (void *)objc_msgSend(v43, "arrayWithObjects:count:", v74, v44);
        v18 = v50;
      }
      else
      {
        objc_msgSend(v29, "appendString:", CFSTR(")"));
        v41 = 0;
LABEL_54:
        v42 = v55;
      }

      if (v41)
      {
        if ((v54 & 1) == 0)
          objc_msgSend(v18, "appendString:", CFSTR(" INTERSECT "));
        objc_msgSend(v18, "appendString:", objc_msgSend(v41, "objectAtIndex:", 0));
        if ((unint64_t)objc_msgSend(v41, "count") >= 2)
          objc_msgSend(v49, "addObjectsFromArray:", objc_msgSend(v41, "objectAtIndex:", 1));
        v54 = 0;
      }
      v19 = v42 + 1;
      if (v19 != v52)
        continue;
      break;
    }
    v45 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    v52 = v45;
    if (v45)
      continue;
    break;
  }
  objc_msgSend(v18, "appendString:", CFSTR(")"));
  if ((v54 & 1) != 0)
  {
LABEL_72:
    v46 = 0;
    goto LABEL_73;
  }
  v46 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v48, v18);
LABEL_73:

  -[NSSQLiteAdapter _useModel:]((uint64_t)v46, v49);
  return v46;
}

void __72__NSSQLiteAdapter_createSQLStatementsForTriggerAttribute_withSQLEntity___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSSQLiteStatement *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_msgSend(a2, "insertSQLStrings", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(v4, "copy");

}

@end
