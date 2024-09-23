@implementation NSSQLDerivedAttributeSQLGenerator

+ (uint64_t)_parameterPropertyTokenForDerivedAttribute:(void *)a3 andKeypath:(id *)a4 onEntity:
{
  uint64_t v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = objc_msgSend(a2, "propertyDescription");
  if (objc_msgSend(a3, "count") != 2)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("derived attribute");
    v17[0] = v7;
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = CFSTR("Unsupported: (multi-step keypath)");
    goto LABEL_8;
  }
  v8 = objc_msgSend(a3, "objectAtIndexedSubscript:", 1);
  if (a4)
    a4 = (id *)objc_msgSend(a4[5], "objectForKey:", v8);
  if (objc_msgSend(a4, "propertyType") != 1)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v14 = CFSTR("derived attribute");
    v15 = v7;
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v13 = CFSTR("Unsupported: (bad keypath, should be toOne.attribute)");
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v13, v12));
  }
  return objc_msgSend(a4, "columnName");
}

+ (uint64_t)_generateSQLForToOneDerivationForDerivedAttribute:(void *)a3 toOneKeypath:
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSSQLiteStatement *v26;
  NSSQLiteStatement *v27;
  NSSQLiteStatement *v28;
  NSSQLiteStatement *v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  id v44;
  const __CFString *v45;
  id v46;
  unint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  id v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  NSSQLiteStatement *v55;
  NSSQLiteStatement *v56;
  NSSQLiteStatement *v57;
  NSSQLiteStatement *v58;
  void *v59;
  NSSQLiteStatement *v60;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  _QWORD v78[2];
  _QWORD v79[4];
  NSSQLiteStatement *v80;
  _QWORD v81[4];
  const __CFString *v82;
  void *v83;
  const __CFString *v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = objc_msgSend(a2, "entity");
  v6 = (void *)objc_msgSend(a2, "propertyDescription");
  v7 = (void *)objc_msgSend(v6, "derivationExpression");
  v8 = objc_msgSend(v7, "expressionType");
  v9 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  if (v5)
    v10 = (void *)objc_msgSend(*(id *)(v5 + 40), "objectForKey:", v9);
  else
    v10 = 0;
  v11 = (id *)objc_msgSend(v10, "destinationEntity");
  v76 = a2;
  v77 = objc_msgSend(a2, "columnName");
  if (v8 != 4)
  {
    if (v8 == 3)
    {
      v12 = +[NSSQLDerivedAttributeSQLGenerator _parameterPropertyTokenForDerivedAttribute:andKeypath:onEntity:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, a3, v11);
      v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NEW.%@"), v12);
      v72 = v12;
      v70 = v12;
      goto LABEL_13;
    }
    v62 = (void *)MEMORY[0x1E0C99DA0];
    v63 = *MEMORY[0x1E0C99778];
    v82 = CFSTR("derived attribute");
    v83 = v6;
    v64 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    v65 = CFSTR("Unsupported: (unsupported expression for to one)");
LABEL_49:
    objc_exception_throw((id)objc_msgSend(v62, "exceptionWithName:reason:userInfo:", v63, v65, v64));
  }
  v13 = +[NSSQLDerivedAttributeSQLGenerator _parameterPropertyTokenForDerivedAttribute:andKeypath:onEntity:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, a3, v11);
  v14 = (char *)objc_msgSend(v7, "selector");
  v70 = v13;
  if (sel_canonical_ == v14)
  {
    v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSCoreDataCanonical(NEW.%@)"), v13);
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSCoreDataCanonical(%@)"), v13);
  }
  else if (sel_uppercase_ == v14)
  {
    v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSCoreDataToUpper(NEW.%@)"), v13);
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSCoreDataToUpper(%@)"), v13);
  }
  else
  {
    if (sel_lowercase_ != v14)
    {
      v62 = (void *)MEMORY[0x1E0C99DA0];
      v63 = *MEMORY[0x1E0C99778];
      v84 = CFSTR("derived attribute");
      v85[0] = v6;
      v64 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
      v65 = CFSTR("Unsupported: (unsupported function for to one)");
      goto LABEL_49;
    }
    v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSCoreDataToLower(NEW.%@)"), v13);
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSCoreDataToLower(%@)"), v13);
  }
  v72 = v15;
LABEL_13:
  v16 = objc_msgSend((id)v5, "tableName");
  v17 = objc_msgSend(v11, "tableName");
  v74 = objc_msgSend(v10, "columnName");
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Z_DA_%@_%@_%@_SOURCE"), v16, objc_msgSend((id)objc_msgSend(v6, "entity"), "name"), objc_msgSend(v6, "name"));
  v75 = v17;
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Z_DA_%@_%@_%@_PARAMETER"), v17, objc_msgSend((id)objc_msgSend(v6, "entity"), "name"), objc_msgSend(v6, "name"));
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_INSERT"), v18);
  v71 = (void *)v18;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_UPDATE"), v18);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_INSERT"), v19);
  v73 = (void *)v19;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_UPDATE"), v19);
  v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v5, v20);

  objc_msgSend(v24, "addObject:", v26);
  v27 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v5, v21);

  objc_msgSend(v24, "addObject:", v27);
  v28 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v5, v22);

  objc_msgSend(v24, "addObject:", v28);
  v29 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v5, v23);

  objc_msgSend(v24, "addObject:", v29);
  v81[0] = v26;
  v81[1] = v27;
  v81[2] = v28;
  v81[3] = v29;
  v68 = v25;
  objc_msgSend(v25, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 4), CFSTR("dropStatements"));
  v69 = v24;
  if (v5)
  {
    v30 = v71;
    v31 = 0x1E0CB3000uLL;
    v32 = v74;
    if (*(_QWORD *)(v5 + 160)
      || (v38 = *(void **)(v5 + 152)) != 0 && objc_msgSend(v38, "count") && *(_QWORD *)(v5 + 160))
    {
      v33 = *(unsigned int *)(v5 + 184);
      v34 = *(unsigned int *)(v5 + 188);
      v35 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v33 >= v34)
      {
        v36 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("%d = NEW.Z_ENT"), v33);
        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d = Z_ENT"), v33, v66);
      }
      else
      {
        v36 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("%d <= NEW.Z_ENT AND NEW.Z_ENT <= %d"), v33, v34);
        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d <= Z_ENT AND Z_ENT <= %d"), v33, v34);
      }
      v39 = (void *)v37;
    }
    else
    {
      v36 = 0;
      v39 = 0;
    }
  }
  else
  {
    v36 = 0;
    v39 = 0;
    v30 = v71;
    v31 = 0x1E0CB3000;
    v32 = v74;
  }
  v40 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v40, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW"), v30, v16);
  objc_msgSend(v40, "appendString:", CFSTR(" BEGIN"));
  if (v36)
    v41 = (const __CFString *)objc_msgSend(*(id *)(v31 + 2368), "stringWithFormat:", CFSTR(" AND %@"), v36);
  else
    v41 = &stru_1E1EE23F0;
  objc_msgSend(v40, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = (SELECT %@ FROM %@ WHERE Z_PK = NEW.%@) WHERE Z_PK = NEW.Z_PK%@;"),
    v16,
    v77,
    v72,
    v75,
    v32,
    v41);
  v42 = objc_msgSend(v76, "name");
  if (v36)
    v43 = (const __CFString *)objc_msgSend(*(id *)(v31 + 2368), "stringWithFormat:", CFSTR(" AND %@"), v36);
  else
    v43 = &stru_1E1EE23F0;
  objc_msgSend(v40, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK%@;"),
    v16,
    v42,
    v77,
    v16,
    v43);
  objc_msgSend(v40, "appendFormat:", CFSTR(" END"));
  v44 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (v36)
    v45 = (const __CFString *)objc_msgSend(*(id *)(v31 + 2368), "stringWithFormat:", CFSTR(" WHEN %@"), v36);
  else
    v45 = &stru_1E1EE23F0;
  objc_msgSend(v44, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE OF %@ ON %@ FOR EACH ROW%@"), v30, v74, v16, v45);
  objc_msgSend(v44, "appendString:", CFSTR(" BEGIN"));
  objc_msgSend(v44, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = (SELECT %@ FROM %@ WHERE Z_PK = NEW.%@) WHERE Z_PK = NEW.Z_PK;"),
    v16,
    v77,
    v72,
    v75,
    v74);
  objc_msgSend(v44, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;"),
    v16,
    objc_msgSend(v76, "name"),
    v77,
    v16);
  objc_msgSend(v44, "appendFormat:", CFSTR(" END"));
  v46 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v46, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW"), v73, v75);
  objc_msgSend(v46, "appendString:", CFSTR(" BEGIN"));
  if (v39)
  {
    v47 = v31;
    v48 = (const __CFString *)objc_msgSend(*(id *)(v31 + 2368), "stringWithFormat:", CFSTR(" AND %@"), v39);
  }
  else
  {
    v48 = &stru_1E1EE23F0;
    v47 = v31;
  }
  objc_msgSend(v46, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = %@ WHERE %@ = NEW.Z_PK%@;"), v16, v77, v67, v74, v48);
  v49 = objc_msgSend(v76, "name");
  if (v39)
    v50 = (const __CFString *)objc_msgSend(*(id *)(v47 + 2368), "stringWithFormat:", CFSTR(" AND %@"), v39);
  else
    v50 = &stru_1E1EE23F0;
  objc_msgSend(v46, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE %@ = NEW.Z_PK%@;"),
    v16,
    v49,
    v77,
    v16,
    v74,
    v50);
  objc_msgSend(v46, "appendFormat:", CFSTR(" END"));
  v51 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v51, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE OF %@ ON %@ FOR EACH ROW"), v73, v70, v75);
  objc_msgSend(v51, "appendString:", CFSTR(" BEGIN"));
  if (v39)
    v52 = (const __CFString *)objc_msgSend(*(id *)(v47 + 2368), "stringWithFormat:", CFSTR(" AND %@"), v39);
  else
    v52 = &stru_1E1EE23F0;
  objc_msgSend(v51, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = %@ WHERE %@ = NEW.Z_PK%@;"), v16, v77, v67, v74, v52);
  v53 = objc_msgSend(v76, "name");
  if (v39)
    v54 = (const __CFString *)objc_msgSend(*(id *)(v47 + 2368), "stringWithFormat:", CFSTR(" AND %@"), v39);
  else
    v54 = &stru_1E1EE23F0;
  objc_msgSend(v51, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE %@ = NEW.Z_PK%@;"),
    v16,
    v53,
    v77,
    v16,
    v74,
    v54);
  objc_msgSend(v51, "appendFormat:", CFSTR(" END"));

  v55 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v5, v40);
  objc_msgSend(v69, "addObject:", v55);

  v56 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v5, v44);
  objc_msgSend(v69, "addObject:", v56);

  v57 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v5, v46);
  objc_msgSend(v69, "addObject:", v57);

  v58 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v5, v51);
  objc_msgSend(v69, "addObject:", v58);

  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE %@ SET %@ = (SELECT %@ FROM %@ WHERE Z_PK = %@.%@)%@"), v16, v77, v72, v75, v16, v74, &stru_1E1EE23F0);
  v60 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v5, v59);

  v80 = v60;
  objc_msgSend(v68, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1), CFSTR("dataStatements"));

  v79[0] = v55;
  v79[1] = v56;
  v79[2] = v57;
  v79[3] = v58;
  objc_msgSend(v68, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 4), CFSTR("triggerCreationStatements"));
  v78[0] = v69;
  v78[1] = v68;
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
}

+ (uint64_t)_generateTriggerForAttribute:(uint64_t)a1 newToken:(void *)a2 updateToken:(uint64_t)a3 triggerColumnListComponent:(uint64_t)a4 triggerColumnWhereComponent:(void *)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSSQLiteStatement *v20;
  NSSQLiteStatement *v21;
  NSSQLiteStatement *v22;
  NSSQLiteStatement *v23;
  __CFString *v24;
  void *v25;
  __CFString *v26;
  id v27;
  uint64_t v28;
  void *v29;
  NSSQLiteStatement *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v41;
  _QWORD v42[2];
  _QWORD v43[2];
  NSSQLiteStatement *v44;
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = objc_msgSend(a2, "entity");
  v8 = (void *)objc_msgSend(a2, "propertyDescription");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Z_DA_%@_%@_%@"), objc_msgSend((id)v7, "tableName"), objc_msgSend((id)objc_msgSend(v8, "entity"), "name"), objc_msgSend(v8, "name"));
  v10 = objc_msgSend((id)v7, "tableName");
  v11 = objc_msgSend(a2, "columnName");
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_INSERT"), v9);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_UPDATE"), v9);
  if (objc_msgSend((id)objc_msgSend(v8, "derivationExpression"), "expressionType") == 3
    && (v13 = objc_msgSend((id)objc_msgSend(v8, "derivationExpression"), "keyPath"), v7)
    && (v14 = (void *)objc_msgSend(*(id *)(v7 + 40), "objectForKey:", v13)) != 0)
  {
    v41 = objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "usesMergeableStorage");
  }
  else
  {
    v41 = 0;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v15, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW"), v9, v10);
  if (objc_msgSend(a5, "length"))
    objc_msgSend(v15, "appendFormat:", CFSTR(" WHEN (NEW.%@ NOT NULL)"), a5);
  objc_msgSend(v15, "appendString:", CFSTR(" BEGIN"));
  if (v41)
    objc_msgSend(v15, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = NSCoreDataDATriggerMergeableString('%@', Z_ENT, Z_PK, '%@', %@) WHERE Z_PK = NEW.Z_PK;"),
      v10,
      v11,
      v10,
      objc_msgSend(a2, "name"),
      a4);
  else
    objc_msgSend(v15, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = %@ WHERE Z_PK = NEW.Z_PK;"), v10, v11, a3, v32, v34);
  objc_msgSend(v15, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;"),
    v10,
    objc_msgSend(a2, "name"),
    v11,
    v10);
  objc_msgSend(v15, "appendFormat:", CFSTR(" END"));
  v16 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v16, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE OF %@ ON %@ FOR EACH ROW"), v9, a5, v10);
  if (objc_msgSend(&stru_1E1EE23F0, "length"))
    objc_msgSend(v16, "appendFormat:", CFSTR(" %@"), &stru_1E1EE23F0);
  objc_msgSend(v16, "appendString:", CFSTR(" BEGIN"));
  if (v41)
    objc_msgSend(v16, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = NSCoreDataDATriggerMergeableString('%@', Z_ENT, Z_PK, '%@', %@) WHERE Z_PK = NEW.Z_PK;"),
      v10,
      v11,
      v10,
      objc_msgSend(a2, "name"),
      a4);
  else
    objc_msgSend(v16, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = %@ WHERE Z_PK = NEW.Z_PK;"), v10, v11, a3, v33, v35);
  v17 = (void *)v12;
  objc_msgSend(v16, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;"),
    v10,
    objc_msgSend(a2, "name"),
    v11,
    v10);
  objc_msgSend(v16, "appendFormat:", CFSTR(" END"));

  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v7, v12);
  objc_msgSend(v18, "addObject:", v20);

  v21 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v7, v38);
  objc_msgSend(v18, "addObject:", v21);

  v45[0] = v20;
  v45[1] = v21;
  objc_msgSend(v19, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2), CFSTR("dropStatements"));

  v22 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v7, v15);
  objc_msgSend(v18, "addObject:", v22);

  v23 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v7, v16);
  objc_msgSend(v18, "addObject:", v23);

  if (v7
    && (*(_QWORD *)(v7 + 160)
     || (v25 = *(void **)(v7 + 152)) != 0 && objc_msgSend(v25, "count") && *(_QWORD *)(v7 + 160)))
  {
    v24 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WHERE %d <= Z_ENT AND Z_ENT <= %d"), *(unsigned int *)(v7 + 184), *(unsigned int *)(v7 + 188));
  }
  else
  {
    v24 = &stru_1E1EE23F0;
  }
  v26 = v24;
  v27 = objc_alloc(MEMORY[0x1E0CB37A0]);
  if (v41)
    v28 = objc_msgSend(v27, "initWithFormat:", CFSTR("UPDATE %@ SET %@ = NSCoreDataDATriggerMergeableString('%@', Z_ENT, Z_PK, '%@', %@) %@"), v10, v11, v10, objc_msgSend(a2, "name"), a4, v26);
  else
    v28 = objc_msgSend(v27, "initWithFormat:", CFSTR("UPDATE %@ SET %@ = %@ %@"), v10, v11, a4, v26, v36, v37);
  v29 = (void *)v28;

  v30 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v7, v29);
  v44 = v30;
  objc_msgSend(v19, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1), CFSTR("dataStatements"));
  v43[0] = v22;
  v43[1] = v23;
  objc_msgSend(v19, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2), CFSTR("triggerCreationStatements"));

  v42[0] = v18;
  v42[1] = v19;
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
}

+ (uint64_t)_computeNewColumnTokenForKeypathExpression:(uint64_t)a3 governingEntity:
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = objc_msgSend(a2, "keyPath");
  if (!a3 || (v6 = (void *)objc_msgSend(*(id *)(a3 + 40), "objectForKey:", v5)) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v19 = CFSTR("bad keypath");
    v20[0] = a2;
    v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = v9;
    v13 = v10;
    v14 = CFSTR("bad keypath");
    goto LABEL_7;
  }
  v7 = v6;
  if (objc_msgSend((id)objc_msgSend(v6, "propertyDescription"), "_propertyType") != 2)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("bad keypath");
    v18 = a2;
    v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v14 = CFSTR("currently unsupported (bad root property type)");
    v12 = v15;
    v13 = v16;
LABEL_7:
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, v11));
  }
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NEW.%@"), objc_msgSend(v7, "columnName"));
}

+ (uint64_t)_computeSingleParameterTokenForFunctionAttribute:(uint64_t)a3 functionName:
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = (void *)objc_msgSend(a2, "propertyDescription");
  v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "derivationExpression"), "arguments");
  if (objc_msgSend(v6, "count") != 1)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("derived attribute");
    v17[0] = v5;
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = CFSTR("currently unsupported (wrong number of arguments)");
    goto LABEL_6;
  }
  v7 = objc_msgSend(a2, "entity");
  v8 = (void *)objc_msgSend(v6, "firstObject");
  if (objc_msgSend(v8, "expressionType") != 3)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v14 = CFSTR("derived attribute");
    v15 = v5;
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v13 = CFSTR("bad parameter to function expression canonical: (not a keypath expression)");
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v13, v12));
  }
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), a3, +[NSSQLDerivedAttributeSQLGenerator _computeNewColumnTokenForKeypathExpression:governingEntity:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, v8, v7));
}

+ (const)_triggerColumnListComponentForAttributeKeypaths:(uint64_t)a3 startingAt:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!objc_msgSend(a2, "count")
    || objc_msgSend(a2, "count") == 1 && !objc_msgSend((id)objc_msgSend(a2, "anyObject"), "count"))
  {
    return CFSTR("Z_OPT");
  }
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = 1;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(a2);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        if ((unint64_t)objc_msgSend(v11, "count") >= 2)
        {
          v17 = *MEMORY[0x1E0C99778];
          v22 = CFSTR("problem keypath");
          v23 = v11;
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v17, CFSTR("currently unsupported (extended keypath)"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1)));
        }
        v12 = objc_msgSend(v11, "firstObject");
        if (a3)
          v13 = (void *)objc_msgSend(*(id *)(a3 + 40), "objectForKey:", v12);
        else
          v13 = 0;
        v14 = objc_msgSend(v13, "columnName");
        if ((v9 & 1) == 0)
          objc_msgSend(v5, "appendString:", CFSTR(" , "));
        objc_msgSend(v5, "appendString:", v14);
        v9 = 0;
        ++v10;
      }
      while (v7 != v10);
      v15 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      v7 = v15;
      v9 = 0;
    }
    while (v15);
  }
  return (const __CFString *)v5;
}

+ (uint64_t)_generateSQLForAttributeFunctionDerivationForDerivedAttribute:(void *)a3 keypaths:
{
  __CFString *v5;
  void *v6;
  char *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = (__CFString *)+[NSSQLDerivedAttributeSQLGenerator _triggerColumnListComponentForAttributeKeypaths:startingAt:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a3, objc_msgSend(a2, "entity"));
  objc_msgSend(a2, "entity");
  objc_opt_self();
  objc_opt_self();
  v6 = (void *)objc_msgSend(a2, "propertyDescription");
  v7 = (char *)objc_msgSend((id)objc_msgSend(v6, "derivationExpression"), "selector");
  if (sel_canonical_ == v7)
  {
    v9 = CFSTR("NSCoreDataCanonical");
LABEL_11:
    v8 = (void *)+[NSSQLDerivedAttributeSQLGenerator _computeSingleParameterTokenForFunctionAttribute:functionName:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, (uint64_t)v9);
    return +[NSSQLDerivedAttributeSQLGenerator _generateTriggerForAttribute:newToken:updateToken:triggerColumnListComponent:triggerColumnWhereComponent:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, (uint64_t)v8, objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("NEW."), &stru_1E1EE23F0), v5);
  }
  if (sel_uppercase_ == v7)
  {
    v9 = CFSTR("NSCoreDataToUpper");
    goto LABEL_11;
  }
  if (sel_lowercase_ == v7)
  {
    v9 = CFSTR("NSCoreDataToLower");
    goto LABEL_11;
  }
  if (sel_random == v7)
  {
    v9 = CFSTR("random");
    goto LABEL_11;
  }
  if (sel_now != v7)
  {
    v11 = *MEMORY[0x1E0C99778];
    v12 = CFSTR("derived attribute");
    v13[0] = v6;
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v11, CFSTR("currently unsupported (unsupported function)"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1)));
  }
  objc_opt_self();
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSCoreDataNow()"));
  return +[NSSQLDerivedAttributeSQLGenerator _generateTriggerForAttribute:newToken:updateToken:triggerColumnListComponent:triggerColumnWhereComponent:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, (uint64_t)v8, objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("NEW."), &stru_1E1EE23F0), v5);
}

+ (uint64_t)_generateSQLForDerivedAttributeWithOneParameterKeypath:(void *)a3 keypaths:
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  __CFString *v15;
  void *v16;
  void *v17;
  char *v18;
  void *v19;
  id *v20;
  NSSQLiteStatement *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  NSSQLiteStatement *v30;
  char *v31;
  char *v32;
  void *v33;
  uint64_t v34;
  NSSQLiteStatement *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSSQLiteStatement *v47;
  NSSQLiteStatement *v48;
  NSSQLiteStatement *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  __CFString *v57;
  __CFString *v58;
  void *v59;
  uint64_t v60;
  NSSQLiteStatement *v61;
  void *v62;
  uint64_t v63;
  _QWORD *v64;
  id *v65;
  void *v66;
  _BOOL4 v67;
  const __CFString *v68;
  void *v69;
  id v70;
  uint64_t v71;
  id v72;
  id v73;
  NSSQLiteStatement *v74;
  NSSQLiteStatement *v75;
  void *v76;
  NSSQLiteStatement *v77;
  void *v78;
  uint64_t v79;
  _BYTE *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSSQLiteStatement *v90;
  NSSQLiteStatement *v91;
  NSSQLiteStatement *v92;
  NSSQLiteStatement *v93;
  NSSQLiteStatement *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  id v98;
  uint64_t v99;
  __CFString *v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  __CFString *v107;
  __CFString *v108;
  void *v109;
  uint64_t v110;
  id v111;
  __CFString *v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  id v122;
  NSSQLiteStatement *v123;
  NSSQLiteStatement *v124;
  void *v125;
  NSSQLiteStatement *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  NSSQLiteStatement *v140;
  NSSQLiteStatement *v141;
  NSSQLiteStatement *v142;
  NSSQLiteStatement *v143;
  NSSQLiteStatement *v144;
  uint64_t v145;
  uint64_t v146;
  id v147;
  __CFString *v148;
  __CFString *v149;
  void *v150;
  id v151;
  uint64_t v152;
  uint64_t v153;
  id v154;
  id v155;
  id v156;
  id v157;
  const __CFString *v158;
  NSSQLiteStatement *v159;
  NSSQLiteStatement *v160;
  NSSQLiteStatement *v161;
  void *v162;
  NSSQLiteStatement *v163;
  void *v164;
  void **v165;
  const __CFString **v166;
  void *v167;
  NSSQLiteStatement **v168;
  const __CFString **v169;
  void *v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  __CFString *v178;
  void *v179;
  __CFString *v180;
  void *v181;
  __CFString *v182;
  const __CFString *v183;
  void *v184;
  void *v185;
  void *v186;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  __CFString *v192;
  uint64_t v193;
  uint64_t v194;
  __CFString *v195;
  uint64_t v196;
  int v197;
  __CFString *v198;
  void *v199;
  _BOOL4 v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  __CFString *v206;
  const __CFString *v207;
  void *v208;
  void *v209;
  uint64_t v210;
  const __CFString *v211;
  id *v212;
  uint64_t v213;
  id *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  NSSQLiteStatement *v218;
  uint64_t v219;
  __CFString *v220;
  uint64_t v221;
  void *v222;
  NSSQLiteStatement *v223;
  NSSQLiteStatement *v224;
  uint64_t v225;
  void *v226;
  const __CFString *v227;
  void *v228;
  NSSQLiteStatement *v229;
  NSSQLiteStatement *v230;
  NSSQLiteStatement *v231;
  const __CFString *v232;
  void *v233;
  const __CFString *v234;
  void *v235;
  const __CFString *v236;
  void *v237;
  const __CFString *v238;
  void *v239;
  const __CFString *v240;
  void *v241;
  const __CFString *v242;
  NSSQLiteStatement *v243;
  NSSQLiteStatement *v244;
  NSSQLiteStatement *v245;
  NSSQLiteStatement *v246;
  NSSQLiteStatement *v247;
  NSSQLiteStatement *v248;
  NSSQLiteStatement *v249;
  NSSQLiteStatement *v250;
  NSSQLiteStatement *v251;
  void *v252;
  void *v253;
  _QWORD v254[3];

  v254[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = (void *)objc_msgSend(a2, "propertyDescription");
  v6 = objc_msgSend((id)objc_msgSend(v5, "derivationExpression"), "expressionType");
  v7 = objc_msgSend((id)objc_msgSend(a3, "anyObject"), "objectAtIndexedSubscript:", 0);
  v228 = a2;
  v8 = (id *)objc_msgSend(a2, "entity");
  if (v8)
    v8 = (id *)objc_msgSend(v8[5], "objectForKey:", v7);
  v9 = objc_msgSend(v8, "propertyType");
  if (v6 == 4)
  {
    switch(v9)
    {
      case 1:
        return +[NSSQLDerivedAttributeSQLGenerator _generateSQLForAttributeFunctionDerivationForDerivedAttribute:keypaths:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, a3);
      case 7:
        goto LABEL_11;
      case 8:
        objc_opt_self();
        v17 = (void *)objc_msgSend(a2, "propertyDescription");
        v18 = (char *)objc_msgSend((id)objc_msgSend(v17, "derivationExpression"), "selector");
        if (sel_count_ != v18 && sel_sum_ != v18)
        {
          if (sel_min_ == v18 || sel_max_ == v18)
          {
            v19 = (void *)objc_msgSend(a3, "anyObject");
            objc_opt_self();
            v20 = (id *)objc_msgSend(v228, "entity");
            v21 = (NSSQLiteStatement *)objc_msgSend(v228, "propertyDescription");
            v22 = (void *)-[NSSQLiteStatement derivationExpression](v21, "derivationExpression");
            v23 = objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
            if (v20)
              v24 = (_QWORD *)objc_msgSend(v20[5], "objectForKey:", v23);
            else
              v24 = 0;
            v225 = objc_msgSend(v24, "destinationEntity");
            v191 = objc_msgSend(v228, "columnName");
            if (v24)
              v25 = (void *)v24[7];
            else
              v25 = 0;
            v26 = objc_msgSend(v25, "columnName");
            v27 = objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
            if (v225)
              v28 = (void *)objc_msgSend(*(id *)(v225 + 40), "objectForKey:", v27);
            else
              v28 = 0;
            v193 = objc_msgSend(v28, "columnName");
            v203 = v26;
            v201 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), v26, v193);
            if (sel_min_ == (char *)objc_msgSend(v22, "selector"))
            {
              v207 = CFSTR("<");
              v29 = CFSTR("MIN");
            }
            else
            {
              if (sel_max_ != (char *)objc_msgSend(v22, "selector"))
              {
                v172 = (void *)MEMORY[0x1E0C99DA0];
                v173 = *MEMORY[0x1E0C99778];
                v242 = CFSTR("derived attribute");
                v247 = v21;
                v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v247, &v242, 1);
                v13 = CFSTR("Unsupported: (unsupported function)");
                v170 = v172;
                v171 = v173;
LABEL_112:
                objc_exception_throw((id)objc_msgSend(v170, "exceptionWithName:reason:userInfo:", v171, v13, v12));
              }
              v207 = CFSTR(">");
              v29 = CFSTR("MAX");
            }
            v211 = v29;
            v189 = objc_msgSend(v20, "tableName");
            v217 = objc_msgSend((id)v225, "tableName");
            v81 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Z_DA_%@_%@_%@"), objc_msgSend((id)v225, "tableName"), objc_msgSend(v20, "name"), -[NSSQLiteStatement name](v21, "name"));
            v82 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Z_DA_%@_%@_%@"), objc_msgSend(v20, "tableName"), objc_msgSend(v20, "name"), -[NSSQLiteStatement name](v21, "name"));
            v214 = v20;
            v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_INSERT"), v81);
            v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_UPDATE_SET"), v81);
            v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_UPDATE_UNSET"), v81);
            v222 = (void *)v81;
            v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_DELETE"), v81);
            v184 = (void *)v82;
            v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_INSERT"), v82);
            v88 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v89 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v90 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v225, v83);
            objc_msgSend(v88, "addObject:", v90);

            v91 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v225, v84);
            objc_msgSend(v88, "addObject:", v91);

            v92 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v225, v85);
            objc_msgSend(v88, "addObject:", v92);

            v93 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v225, v86);
            objc_msgSend(v88, "addObject:", v93);

            v94 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v214, v87);
            objc_msgSend(v88, "addObject:", v94);

            v247 = v90;
            v248 = v91;
            v249 = v92;
            v250 = v93;
            v251 = v94;
            v186 = v89;
            objc_msgSend(v89, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v247, 5), CFSTR("dropStatements"));

            if (v214 && (v214[20] || (v102 = v214[19]) != 0 && objc_msgSend(v102, "count") && v214[20]))
            {
              v95 = *((unsigned int *)v214 + 46);
              v96 = *((unsigned int *)v214 + 47);
              v97 = 0x1E0CB3000uLL;
              v98 = objc_alloc(MEMORY[0x1E0CB3940]);
              v99 = v203;
              if (v95 >= v96)
              {
                v180 = (__CFString *)objc_msgSend(v98, "initWithFormat:", CFSTR(" WHEN %d = NEW.Z_ENT"), v95);
                v100 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" AND %d = Z_ENT"), v95);
                v101 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" WHERE %d = Z_ENT"), v95, v175);
              }
              else
              {
                v180 = (__CFString *)objc_msgSend(v98, "initWithFormat:", CFSTR(" WHEN %d <= NEW.Z_ENT AND NEW.Z_ENT <= %d"), v95, v96);
                v100 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" AND %d <= Z_ENT AND Z_ENT <= %d"), v95, v96);
                v101 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" WHERE %d <= Z_ENT AND Z_ENT <= %d"), v95, v96);
              }
              v182 = (__CFString *)v101;
            }
            else
            {
              v180 = &stru_1E1EE23F0;
              v100 = &stru_1E1EE23F0;
              v182 = &stru_1E1EE23F0;
              v97 = 0x1E0CB3000;
              v99 = v203;
            }
            v103 = v225;
            v188 = v88;
            if (v225
              && (*(_QWORD *)(v225 + 160)
               || (v109 = *(void **)(v225 + 152)) != 0
               && (v110 = objc_msgSend(v109, "count"), v103 = v225, v110)
               && *(_QWORD *)(v225 + 160)))
            {
              v104 = *(unsigned int *)(v103 + 184);
              v105 = *(unsigned int *)(v103 + 188);
              v106 = objc_alloc(*(Class *)(v97 + 2368));
              if (v104 >= v105)
              {
                v107 = (__CFString *)objc_msgSend(v106, "initWithFormat:", CFSTR(" AND %d = Z_ENT"), v104);
                v108 = (__CFString *)objc_msgSend(objc_alloc(*(Class *)(v97 + 2368)), "initWithFormat:", CFSTR(" WHERE %d = Z_ENT"), v104, v175);
              }
              else
              {
                v107 = (__CFString *)objc_msgSend(v106, "initWithFormat:", CFSTR(" AND %d <= Z_ENT AND Z_ENT <= %d"), v104, v105);
                v108 = (__CFString *)objc_msgSend(objc_alloc(*(Class *)(v97 + 2368)), "initWithFormat:", CFSTR(" WHERE %d <= Z_ENT AND Z_ENT <= %d"), v104, v105);
              }
            }
            else
            {
              v107 = &stru_1E1EE23F0;
              v108 = &stru_1E1EE23F0;
            }
            v178 = v108;
            v111 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            objc_msgSend(v111, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW WHEN (NEW.%@ NOT NULL AND NEW.%@ NOT NULL%@)"), v222, v217, v99, v193, v107);
            objc_msgSend(v111, "appendString:", CFSTR(" BEGIN"));
            v112 = v107;
            v206 = v107;
            v113 = v191;
            v114 = v189;
            v177 = v111;
            objc_msgSend(v111, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = NEW.%@ WHERE Z_PK = NEW.%@%@ AND %@;"),
              v189,
              v191,
              v193,
              v99,
              v100,
              objc_msgSend(*(id *)(v97 + 2368), "stringWithFormat:", CFSTR("(%@ IS NULL OR NEW.%@ %@ %@)"), v191, v193, v207, v191));
            objc_msgSend(v111, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@ AND %@;"),
              v114,
              objc_msgSend(v228, "name"),
              v113,
              v114,
              v99,
              v100,
              objc_msgSend(*(id *)(v97 + 2368), "stringWithFormat:", CFSTR("(%@ IS NULL OR NEW.%@ %@= %@)"), v113, v193, v207, v113));
            objc_msgSend(v111, "appendFormat:", CFSTR(" END"));
            v115 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            objc_msgSend(v115, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_UPDATE_SET AFTER UPDATE OF %@ ON %@ FOR EACH ROW WHEN (NEW.%@ NOT NULL AND NEW.%@ NOT NULL%@)"), v222, v201, v217, v99, v193, v112);
            v199 = v115;
            objc_msgSend(v115, "appendString:", CFSTR(" BEGIN"));
            objc_msgSend(v115, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = OLD.%@) WHERE Z_PK = OLD.%@%@ AND %@;"),
              v189,
              v191,
              v211,
              v193,
              v217,
              v99,
              v99,
              v99,
              v100,
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OLD.%@ %@= %@"), v193, v207, v191));
            v116 = objc_msgSend(v228, "name");
            objc_msgSend(v199, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@ AND %@;"),
              v114,
              v116,
              v191,
              v114,
              v99,
              v100,
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OLD.%@ %@= %@"), v193, v207, v191));
            objc_msgSend(v199, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = NEW.%@ WHERE Z_PK = NEW.%@%@ AND %@;"),
              v189,
              v113,
              v193,
              v99,
              v100,
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ IS NULL OR NEW.%@ %@ %@)"), v113, v193, v207, v113));
            v117 = objc_msgSend(v228, "name");
            objc_msgSend(v199, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@ AND %@;"),
              v114,
              v117,
              v191,
              v114,
              v99,
              v100,
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NEW.%@ %@= %@"), v193, v207, v191));
            objc_msgSend(v199, "appendFormat:", CFSTR(" END"));
            v118 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            objc_msgSend(v118, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_UPDATE_UNSET AFTER UPDATE OF %@ ON %@ FOR EACH ROW WHEN (OLD.%@ NOT NULL AND OLD.%@ NOT NULL AND (NEW.%@ IS NULL OR NEW.%@ IS NULL)%@)"), v222, v201, v217, v99, v193, v99, v193, v206);
            objc_msgSend(v118, "appendString:", CFSTR(" BEGIN"));
            objc_msgSend(v118, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = OLD.%@) WHERE Z_PK = OLD.%@%@ AND %@;"),
              v189,
              v191,
              v211,
              v193,
              v217,
              v99,
              v99,
              v99,
              v100,
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OLD.%@ %@= %@"), v193, v207, v191));
            v119 = objc_msgSend(v228, "name");
            objc_msgSend(v118, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@ AND %@;"),
              v114,
              v119,
              v113,
              v114,
              v99,
              v100,
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ IS NULL OR OLD.%@ %@= %@)"), v113, v193, v207, v113));
            objc_msgSend(v118, "appendFormat:", CFSTR(" END"));
            v120 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            objc_msgSend(v120, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW WHEN (OLD.%@ NOT NULL AND OLD.%@ NOT NULL%@)"), v222, v217, v99, v193, v206);
            objc_msgSend(v120, "appendString:", CFSTR(" BEGIN"));
            objc_msgSend(v120, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = OLD.%@) WHERE Z_PK = OLD.%@%@ AND %@;"),
              v189,
              v191,
              v211,
              v193,
              v217,
              v99,
              v99,
              v99,
              v100,
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OLD.%@ %@= %@"), v193, v207, v191));
            v121 = objc_msgSend(v228, "name");
            objc_msgSend(v120, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@ AND %@;"),
              v114,
              v121,
              v113,
              v114,
              v99,
              v100,
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ IS NULL OR OLD.%@ %@= %@)"), v113, v193, v207, v113));
            objc_msgSend(v120, "appendFormat:", CFSTR(" END"));
            v122 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            objc_msgSend(v122, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW%@"), v184, v189, v180);
            objc_msgSend(v122, "appendString:", CFSTR(" BEGIN"));
            objc_msgSend(v122, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = NEW.Z_PK) WHERE Z_PK = NEW.Z_PK;"),
              v189,
              v191,
              v211,
              v193,
              objc_msgSend((id)v225, "tableName"),
              v99);
            objc_msgSend(v122, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;"),
              v114,
              objc_msgSend(v228, "name"),
              v191,
              v114);
            objc_msgSend(v122, "appendFormat:", CFSTR(" END"));

            v230 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v225, v177);
            objc_msgSend(v188, "addObject:", v230);

            v223 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v225, v199);
            objc_msgSend(v188, "addObject:", v223);

            v218 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v225, v118);
            objc_msgSend(v188, "addObject:", v218);

            v123 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v225, v120);
            objc_msgSend(v188, "addObject:", v123);

            v124 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v214, v122);
            objc_msgSend(v188, "addObject:", v124);

            v125 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = %@.Z_PK)%@;"),
                             v114,
                             v191,
                             v211,
                             v193,
                             objc_msgSend((id)v225, "tableName"),
                             v99,
                             v114,
                             v178);

            v126 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v214, v125);
            v254[0] = v126;
            objc_msgSend(v186, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v254, 1), CFSTR("dataStatements"));
            v242 = (const __CFString *)v230;
            v243 = v223;
            v244 = v218;
            v245 = v123;
            v246 = v124;
            objc_msgSend(v186, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v242, 5), CFSTR("triggerCreationStatements"));

            v252 = v188;
            v253 = v186;
            goto LABEL_93;
          }
          v10 = (void *)MEMORY[0x1E0C99DA0];
          v11 = *MEMORY[0x1E0C99778];
          v240 = CFSTR("derived attribute");
          v241 = v17;
          v167 = (void *)MEMORY[0x1E0C99D80];
          v168 = (NSSQLiteStatement **)&v241;
          v169 = &v240;
LABEL_103:
          v12 = objc_msgSend(v167, "dictionaryWithObjects:forKeys:count:", v168, v169, 1);
          v13 = CFSTR("currently unsupported (unsupported function on to many (not count or sum))");
          goto LABEL_111;
        }
        v59 = (void *)objc_msgSend(a3, "anyObject");
        objc_opt_self();
        v60 = objc_msgSend(a2, "entity");
        v61 = (NSSQLiteStatement *)objc_msgSend(a2, "propertyDescription");
        v62 = (void *)-[NSSQLiteStatement derivationExpression](v61, "derivationExpression");
        v63 = objc_msgSend(v59, "objectAtIndexedSubscript:", 0);
        if (v60)
          v64 = (_QWORD *)objc_msgSend(*(id *)(v60 + 40), "objectForKey:", v63);
        else
          v64 = 0;
        v65 = (id *)objc_msgSend(v64, "destinationEntity");
        v202 = objc_msgSend(v228, "columnName");
        if (v64)
          v66 = (void *)v64[7];
        else
          v66 = 0;
        v205 = objc_msgSend(v66, "columnName");
        if (sel_count_ != (char *)objc_msgSend(v62, "selector"))
          goto LABEL_39;
        if ((unint64_t)objc_msgSend(v59, "count") < 2)
        {
          v67 = 0;
          v197 = 1;
          v221 = v205;
          v227 = CFSTR("+ 1");
          v68 = CFSTR("- 1");
        }
        else
        {
          v79 = objc_msgSend(v59, "objectAtIndexedSubscript:", 1);
          if (v65 && (v80 = (_BYTE *)objc_msgSend(v65[5], "objectForKey:", v79)) != 0 && v80[24] == 1)
          {
            v68 = 0;
            v221 = 0;
            v227 = 0;
            v67 = objc_msgSend((id)objc_msgSend(v80, "propertyDescription"), "attributeType") == 800;
            v197 = v67;
          }
          else
          {
LABEL_39:
            v67 = 0;
            v197 = 0;
            v68 = 0;
            v221 = 0;
            v227 = 0;
          }
        }
        v127 = (char *)objc_msgSend(v62, "selector");
        if (v67 || (v128 = v221, sel_sum_ == v127))
        {
          v129 = objc_msgSend(v59, "objectAtIndexedSubscript:", 1);
          if (v65)
            v130 = (void *)objc_msgSend(v65[5], "objectForKey:", v129);
          else
            v130 = 0;
          v128 = objc_msgSend(v130, "columnName");
          v227 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+ IFNULL(NEW.%@, 0)"), v128);
          v68 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("- IFNULL(OLD.%@, 0)"), v128);
          v221 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), v205, v128);
        }
        v200 = v67;
        v219 = v128;
        if (v227 && v68)
        {
          v183 = v68;
          v187 = objc_msgSend((id)v60, "tableName");
          v215 = objc_msgSend(v65, "tableName");
          v212 = v65;
          v131 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Z_DA_%@_%@_%@_PARAMETER"), objc_msgSend(v65, "tableName"), objc_msgSend((id)v60, "name"), -[NSSQLiteStatement name](v61, "name"));
          v132 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Z_DA_%@_%@_%@_SOURCE"), objc_msgSend((id)v60, "tableName"), objc_msgSend((id)v60, "name"), -[NSSQLiteStatement name](v61, "name"));
          v133 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_INSERT"), v131);
          v134 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_UPDATE_INCREMENT"), v131);
          v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_UPDATE_DECREMENT"), v131);
          v209 = (void *)v131;
          v136 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_DELETE"), v131);
          v181 = (void *)v132;
          v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_INSERT"), v132);
          v138 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v139 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v140 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v60, v133);
          objc_msgSend(v138, "addObject:", v140);

          v141 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v60, v134);
          objc_msgSend(v138, "addObject:", v141);

          v142 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v60, v135);
          objc_msgSend(v138, "addObject:", v142);

          v143 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v60, v136);
          objc_msgSend(v138, "addObject:", v143);

          v144 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v60, v137);
          objc_msgSend(v138, "addObject:", v144);

          v247 = v140;
          v248 = v141;
          v249 = v142;
          v250 = v143;
          v251 = v144;
          v185 = v139;
          objc_msgSend(v139, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v247, 5), CFSTR("dropStatements"));
          v190 = v60;
          if (v60
            && (*(_QWORD *)(v60 + 160)
             || (v150 = *(void **)(v60 + 152)) != 0 && objc_msgSend(v150, "count") && *(_QWORD *)(v60 + 160)))
          {
            v145 = *(unsigned int *)(v60 + 184);
            v146 = *(unsigned int *)(v60 + 188);
            v147 = objc_alloc(MEMORY[0x1E0CB3940]);
            if (v145 >= v146)
            {
              v192 = (__CFString *)objc_msgSend(v147, "initWithFormat:", CFSTR(" WHEN %d = NEW.Z_ENT"), v145);
              v148 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" AND %d = Z_ENT"), v145);
              v149 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" WHERE %d = Z_ENT"), v145, v176);
            }
            else
            {
              v192 = (__CFString *)objc_msgSend(v147, "initWithFormat:", CFSTR(" WHEN %d <= NEW.Z_ENT AND NEW.Z_ENT <= %d"), v145, v146);
              v148 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" AND %d <= Z_ENT AND Z_ENT <= %d"), v145, v146);
              v149 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" WHERE %d <= Z_ENT AND Z_ENT <= %d"), v145, v146);
            }
          }
          else
          {
            v192 = &stru_1E1EE23F0;
            v148 = &stru_1E1EE23F0;
            v149 = &stru_1E1EE23F0;
          }
          v195 = v149;
          v151 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          objc_msgSend(v151, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW WHEN (NEW.%@ NOT NULL)"), v209, v215, v205);
          v179 = v151;
          objc_msgSend(v151, "appendString:", CFSTR(" BEGIN"));
          v152 = v202;
          v153 = v187;
          objc_msgSend(v151, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL(%@, 0) %@ WHERE Z_PK = NEW.%@%@;"),
            v187,
            v202,
            v202,
            v227,
            v205,
            v148);
          objc_msgSend(v151, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@;"),
            v153,
            objc_msgSend(v228, "name"),
            v202,
            v153,
            v205,
            v148);
          objc_msgSend(v151, "appendFormat:", CFSTR(" END"));
          v154 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          objc_msgSend(v154, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_UPDATE_INCREMENT AFTER UPDATE OF %@ ON %@ FOR EACH ROW WHEN (NEW.%@ NOT NULL)"), v209, v221, v215, v205);
          objc_msgSend(v154, "appendString:", CFSTR(" BEGIN"));
          objc_msgSend(v154, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = %@ %@ WHERE Z_PK = NEW.%@%@;"),
            v187,
            v152,
            v152,
            v227,
            v205,
            v148);
          objc_msgSend(v154, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@;"),
            v153,
            objc_msgSend(v228, "name"),
            v202,
            v153,
            v205,
            v148);
          objc_msgSend(v154, "appendFormat:", CFSTR(" END"));
          v155 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          objc_msgSend(v155, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_UPDATE_DECREMENT AFTER UPDATE OF %@ ON %@ FOR EACH ROW WHEN (OLD.%@ NOT NULL)"), v209, v221, v215, v205);
          objc_msgSend(v155, "appendString:", CFSTR(" BEGIN"));
          objc_msgSend(v155, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = %@ %@ WHERE Z_PK = OLD.%@%@;"),
            v187,
            v152,
            v152,
            v183,
            v205,
            v148);
          objc_msgSend(v155, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@;"),
            v153,
            objc_msgSend(v228, "name"),
            v202,
            v153,
            v205,
            v148);
          objc_msgSend(v155, "appendFormat:");
          v156 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          objc_msgSend(v156, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW WHEN (OLD.%@ NOT NULL)"), v209, v215, v205);
          objc_msgSend(v156, "appendString:", CFSTR(" BEGIN"));
          objc_msgSend(v156, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = %@ %@ WHERE Z_PK = OLD.%@%@;"),
            v187,
            v152,
            v152,
            v183,
            v205,
            v148);
          objc_msgSend(v156, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@;"),
            v153,
            objc_msgSend(v228, "name"),
            v202,
            v153,
            v205,
            v148);
          objc_msgSend(v156, "appendFormat:", CFSTR(" END"));
          v157 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          objc_msgSend(v157, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW%@"), v181, v187, v192);
          objc_msgSend(v157, "appendString:", CFSTR(" BEGIN"));
          if ((v197 & !v200) != 0)
            v158 = CFSTR("COUNT");
          else
            v158 = CFSTR("SUM");
          objc_msgSend(v157, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = (SELECT IFNULL(%@(%@), 0) FROM %@ WHERE %@ = NEW.Z_PK) WHERE Z_PK = NEW.Z_PK;"),
            v187,
            v202,
            v158,
            v219,
            objc_msgSend(v212, "tableName"),
            v205);
          objc_msgSend(v157, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;"),
            v187,
            objc_msgSend(v228, "name"),
            v202,
            v187);
          objc_msgSend(v157, "appendFormat:", CFSTR(" END"));

          v231 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v190, v179);
          objc_msgSend(v138, "addObject:", v231);

          v224 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v190, v154);
          objc_msgSend(v138, "addObject:", v224);

          v159 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v190, v155);
          objc_msgSend(v138, "addObject:", v159);

          v160 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v190, v156);
          objc_msgSend(v138, "addObject:", v160);

          v161 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v190, v157);
          objc_msgSend(v138, "addObject:", v161);

          v162 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE %@ SET %@ = (SELECT IFNULL(%@(%@), 0) FROM %@ WHERE %@ = %@.Z_PK)%@;"),
                           v187,
                           v202,
                           v158,
                           v219,
                           objc_msgSend(v212, "tableName"),
                           v205,
                           v187,
                           v195);

          v163 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v190, v162);
          v254[0] = v163;
          objc_msgSend(v185, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v254, 1), CFSTR("dataStatements"));
          v242 = (const __CFString *)v231;
          v243 = v224;
          v244 = v159;
          v245 = v160;
          v246 = v161;
          objc_msgSend(v185, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v242, 5), CFSTR("triggerCreationStatements"));

          v252 = v138;
          v253 = v185;
LABEL_93:
          v78 = (void *)MEMORY[0x1E0C99D20];
          return objc_msgSend(v78, "arrayWithObjects:count:", &v252, 2);
        }
        v10 = (void *)MEMORY[0x1E0C99DA0];
        v11 = *MEMORY[0x1E0C99778];
        v242 = CFSTR("derived attribute");
        v247 = v61;
LABEL_110:
        v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v247, &v242, 1);
        v13 = CFSTR("Unsupported: (unsupported function)");
        goto LABEL_111;
      case 9:
        objc_opt_self();
        v30 = (NSSQLiteStatement *)objc_msgSend(a2, "propertyDescription");
        v31 = (char *)objc_msgSend((id)-[NSSQLiteStatement derivationExpression](v30, "derivationExpression"), "selector");
        if (sel_count_ != v31)
        {
          v10 = (void *)MEMORY[0x1E0C99DA0];
          v11 = *MEMORY[0x1E0C99778];
          v242 = CFSTR("derived attribute");
          v247 = v30;
          v167 = (void *)MEMORY[0x1E0C99D80];
          v168 = &v247;
          v169 = &v242;
          goto LABEL_103;
        }
        v32 = v31;
        v33 = (void *)objc_msgSend(a3, "anyObject");
        objc_opt_self();
        v34 = objc_msgSend(a2, "entity");
        v35 = (NSSQLiteStatement *)objc_msgSend(a2, "propertyDescription");
        v36 = (void *)-[NSSQLiteStatement derivationExpression](v35, "derivationExpression");
        v37 = objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
        if (v34)
          v38 = (void *)objc_msgSend(*(id *)(v34 + 40), "objectForKey:", v37);
        else
          v38 = 0;
        v216 = objc_msgSend(v228, "columnName");
        v213 = objc_msgSend(v38, "columnName");
        if (v32 == (char *)objc_msgSend(v36, "selector"))
        {
          v196 = objc_msgSend((id)v34, "tableName");
          v39 = objc_msgSend(v38, "correlationTableName");
          v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Z_DA_%@_%@_%@_PARAMETER"), v39, objc_msgSend((id)v34, "name"), -[NSSQLiteStatement name](v35, "name"));
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Z_DA_%@_%@_%@_SOURCE"), objc_msgSend((id)v34, "tableName"), objc_msgSend((id)v34, "name"), -[NSSQLiteStatement name](v35, "name"));
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_INSERT"), v40);
          v226 = (void *)v40;
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_DELETE"), v40);
          v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_INSERT"), v41);
          v45 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v46 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v47 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v34, v42);
          objc_msgSend(v45, "addObject:", v47);

          v48 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v34, v43);
          objc_msgSend(v45, "addObject:", v48);

          v49 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v34, v44);
          objc_msgSend(v45, "addObject:", v49);

          v247 = v47;
          v248 = v48;
          v249 = v49;
          v208 = v46;
          objc_msgSend(v46, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v247, 3), CFSTR("dropStatements"));
          v210 = v34;
          v204 = v45;
          if (v34
            && (*(_QWORD *)(v34 + 160)
             || (v69 = *(void **)(v34 + 152)) != 0 && objc_msgSend(v69, "count") && *(_QWORD *)(v34 + 160)))
          {
            v50 = v34;
            v51 = v196;
            v52 = *(unsigned int *)(v50 + 184);
            v53 = *(unsigned int *)(v50 + 188);
            v54 = objc_alloc(MEMORY[0x1E0CB3940]);
            v55 = v39;
            v56 = v213;
            if (v52 >= v53)
            {
              v220 = (__CFString *)objc_msgSend(v54, "initWithFormat:", CFSTR(" WHEN %d = NEW.Z_ENT"), v52);
              v57 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" AND %d = Z_ENT"), v52);
              v58 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" WHERE %d = Z_ENT"), v52, v174);
            }
            else
            {
              v220 = (__CFString *)objc_msgSend(v54, "initWithFormat:", CFSTR(" WHEN %d <= NEW.Z_ENT AND NEW.Z_ENT <= %d"), v52, v53);
              v57 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" AND %d <= Z_ENT AND Z_ENT <= %d"), v52, v53);
              v58 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" WHERE %d <= Z_ENT AND Z_ENT <= %d"), v52, v53);
            }
          }
          else
          {
            v51 = v196;
            v55 = v39;
            v56 = v213;
            v220 = &stru_1E1EE23F0;
            v57 = &stru_1E1EE23F0;
            v58 = &stru_1E1EE23F0;
          }
          v198 = v58;
          v70 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v71 = v55;
          objc_msgSend(v70, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW"), v226, v55);
          objc_msgSend(v70, "appendString:", CFSTR(" BEGIN"));
          objc_msgSend(v70, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL(%@, 0) + 1 WHERE Z_PK = NEW.%@%@;"),
            v51,
            v216,
            v216,
            v56,
            v57);
          objc_msgSend(v70, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@;"),
            v51,
            objc_msgSend(v228, "name"),
            v216,
            v51,
            v56,
            v57);
          objc_msgSend(v70, "appendFormat:", CFSTR(" END"));
          v72 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          v194 = v71;
          objc_msgSend(v72, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW"), v226, v71);
          objc_msgSend(v72, "appendString:", CFSTR(" BEGIN"));
          objc_msgSend(v72, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = %@ - 1 WHERE Z_PK = OLD.%@%@;"),
            v51,
            v216,
            v216,
            v56,
            v57);
          objc_msgSend(v72, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@;"),
            v51,
            objc_msgSend(v228, "name"),
            v216,
            v51,
            v56,
            v57);
          objc_msgSend(v72, "appendFormat:", CFSTR(" END"));
          v73 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          objc_msgSend(v73, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW%@"), v41, v51, v220);
          objc_msgSend(v73, "appendString:", CFSTR(" BEGIN"));
          objc_msgSend(v73, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = (SELECT IFNULL(COUNT(%@), 0) FROM %@ WHERE %@ = NEW.Z_PK) WHERE Z_PK = NEW.Z_PK;"),
            v51,
            v216,
            v56,
            v71,
            v56);
          objc_msgSend(v73, "appendFormat:", CFSTR(" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;"),
            v51,
            objc_msgSend(v228, "name"),
            v216,
            v51);
          objc_msgSend(v73, "appendFormat:", CFSTR(" END"));

          v229 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v210, v70);
          objc_msgSend(v204, "addObject:", v229);

          v74 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v210, v72);
          objc_msgSend(v204, "addObject:", v74);

          v75 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v210, v73);
          objc_msgSend(v204, "addObject:", v75);

          v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UPDATE %@ SET %@ = (SELECT IFNULL(COUNT(%@), 0) FROM %@ WHERE %@ = %@.Z_PK)%@;"),
                          v51,
                          v216,
                          v56,
                          v194,
                          v56,
                          v51,
                          v198);

          v77 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v210, v76);
          v254[0] = v77;
          objc_msgSend(v208, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v254, 1), CFSTR("dataStatements"));
          v242 = (const __CFString *)v229;
          v243 = v74;
          v244 = v75;
          objc_msgSend(v208, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v242, 3), CFSTR("triggerCreationStatements"));

          v252 = v204;
          v253 = v208;
          v78 = (void *)MEMORY[0x1E0C99D20];
          return objc_msgSend(v78, "arrayWithObjects:count:", &v252, 2);
        }
        v10 = (void *)MEMORY[0x1E0C99DA0];
        v11 = *MEMORY[0x1E0C99778];
        v242 = CFSTR("derived attribute");
        v247 = v35;
        goto LABEL_110;
      default:
        v10 = (void *)MEMORY[0x1E0C99DA0];
        v11 = *MEMORY[0x1E0C99778];
        v234 = CFSTR("derived attribute");
        v235 = v5;
        v164 = (void *)MEMORY[0x1E0C99D80];
        v165 = &v235;
        v166 = &v234;
        goto LABEL_98;
    }
  }
  if (v6 != 3)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v232 = CFSTR("derived attribute");
    v233 = v5;
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v233, &v232, 1);
    v13 = CFSTR("currently unsupported (unsupported expression type)");
LABEL_111:
    v170 = v10;
    v171 = v11;
    goto LABEL_112;
  }
  if (v9 == 1)
  {
    objc_opt_self();
    v15 = (__CFString *)+[NSSQLDerivedAttributeSQLGenerator _triggerColumnListComponentForAttributeKeypaths:startingAt:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a3, objc_msgSend(a2, "entity"));
    objc_msgSend(a2, "entity");
    objc_opt_self();
    objc_opt_self();
    v16 = (void *)+[NSSQLDerivedAttributeSQLGenerator _computeNewColumnTokenForKeypathExpression:governingEntity:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, (void *)objc_msgSend((id)objc_msgSend(a2, "propertyDescription"), "derivationExpression"), objc_msgSend(a2, "entity"));
    return +[NSSQLDerivedAttributeSQLGenerator _generateTriggerForAttribute:newToken:updateToken:triggerColumnListComponent:triggerColumnWhereComponent:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, (uint64_t)v16, objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("NEW."), &stru_1E1EE23F0), v15);
  }
  else
  {
    if (v9 != 7)
    {
      if (v9 == 8)
      {
        v10 = (void *)MEMORY[0x1E0C99DA0];
        v11 = *MEMORY[0x1E0C99778];
        v238 = CFSTR("derived attribute");
        v239 = v5;
        v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v239, &v238, 1);
        v13 = CFSTR("malformed expression (dependent property is to many, derivation expression is not a function)");
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0C99DA0];
        v11 = *MEMORY[0x1E0C99778];
        v236 = CFSTR("derived attribute");
        v237 = v5;
        v164 = (void *)MEMORY[0x1E0C99D80];
        v165 = &v237;
        v166 = &v236;
LABEL_98:
        v12 = objc_msgSend(v164, "dictionaryWithObjects:forKeys:count:", v165, v166, 1);
        v13 = CFSTR("currently unsupported (unsupported keypath property type)");
      }
      goto LABEL_111;
    }
LABEL_11:
    objc_opt_self();
    return +[NSSQLDerivedAttributeSQLGenerator _generateSQLForToOneDerivationForDerivedAttribute:toOneKeypath:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, (void *)objc_msgSend(a3, "anyObject"));
  }
}

+ (uint64_t)generateSQLForDerivedAttribute:(void *)a3 keypaths:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = objc_msgSend(a2, "propertyDescription");
  v6 = v5;
  if (v5 && *(_QWORD *)(v5 + 128))
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("derived attribute");
    v18[0] = v5;
    v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = CFSTR("currently unsupported (predicate)");
    goto LABEL_12;
  }
  if (objc_msgSend(a3, "count"))
  {
    if (objc_msgSend(a3, "count") == 1)
    {
      v7 = (void *)objc_msgSend(a3, "anyObject");
      if (objc_msgSend(v7, "count") == 1 || objc_msgSend(v7, "count") == 2)
        return +[NSSQLDerivedAttributeSQLGenerator _generateSQLForDerivedAttributeWithOneParameterKeypath:keypaths:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, a3);
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99778];
      v15 = CFSTR("derived attribute");
      v16 = v6;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v12 = CFSTR("currently unsupported (too many steps)");
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99778];
      v13 = CFSTR("derived attribute");
      v14 = v6;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v12 = CFSTR("currently unsupported (too many keypaths)");
    }
LABEL_12:
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v12, v11));
  }
  return +[NSSQLDerivedAttributeSQLGenerator _generateSQLForAttributeFunctionDerivationForDerivedAttribute:keypaths:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, a3);
}

@end
