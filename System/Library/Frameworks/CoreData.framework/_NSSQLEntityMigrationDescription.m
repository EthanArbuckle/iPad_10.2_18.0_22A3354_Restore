@implementation _NSSQLEntityMigrationDescription

- (_QWORD)initWithEntityMapping:(void *)a3 sourceEntity:(void *)a4 destinationEntity:
{
  _QWORD *v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)_NSSQLEntityMigrationDescription;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[1] = a2;
    v7[5] = a3;
    v7[4] = a4;
    *((_DWORD *)v7 + 12) = objc_msgSend(a2, "mappingType") - 2;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_entityMapping = 0;
  self->_srcEntity = 0;

  self->_dstEntity = 0;
  self->_sqlValuesByColumnName = 0;

  self->_addedManyToManys = 0;
  self->_removedManyToManys = 0;

  self->_transformedManyToManys = 0;
  self->_processedTransforms = 0;

  self->_pendingTransforms = 0;
  self->_sourceEntitiesByToOneWithNewEntityKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSSQLEntityMigrationDescription;
  -[_NSSQLEntityMigrationDescription dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSSQLEntityMigrationDescription;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ : %@ -> %@"), -[_NSSQLEntityMigrationDescription description](&v3, sel_description), -[NSSQLEntity name](self->_srcEntity, "name"), -[NSSQLEntity name](self->_dstEntity, "name"));
}

- (uint64_t)_generateSQLValueMappingsWithMigrationContext:(uint64_t)result
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  int v24;
  void *v25;
  void *v26;
  unsigned __int8 *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  NSSQLBindVariable *v32;
  void *v33;
  NSSQLBindVariable *v34;
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
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  unsigned __int8 *v56;
  NSSQLBindVariable *v57;
  NSSQLBindVariable *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  _QWORD *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD *v72;
  _QWORD *v73;
  void *v74;
  void *v75;
  NSSQLBindVariable *v76;
  NSSQLBindVariable *v77;
  NSSQLBindVariable *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  const __CFString *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  id v89;
  uint64_t v91;
  id obj;
  id obja;
  id objb;
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
  _BYTE v107[128];
  _BYTE v108[128];
  _QWORD v109[2];
  _QWORD v110[2];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v2 = result;
  v3 = -[NSEntityMapping _mappingsByName](*(_QWORD **)(result + 8));
  *(_QWORD *)(v2 + 80) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2 * objc_msgSend(v3, "count"));
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = (id)objc_msgSend(v3, "allValues");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v100;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v100 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v7);
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        if (v8)
          v9 = *(void **)(v8 + 24);
        else
          v9 = 0;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v96;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v96 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
              if (v14 && *(_QWORD *)(v14 + 24))
              {
                v15 = *(void **)(v2 + 88);
                if (!v15)
                {
                  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
                  *(_QWORD *)(v2 + 88) = v15;
                }
              }
              else
              {
                v15 = *(void **)(v2 + 80);
              }
              objc_msgSend(v15, "addObject:", v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
          }
          while (v11);
        }
        ++v7;
      }
      while (v7 != v5);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
      v5 = v16;
    }
    while (v16);
  }
  v17 = *(void **)(v2 + 80);
  if (!*(_QWORD *)(v2 + 16))
    *(_QWORD *)(v2 + 16) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2 * objc_msgSend(v17, "count"));
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  obja = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
  if (!obja)
    goto LABEL_88;
  v91 = *(_QWORD *)v104;
  v89 = v17;
  do
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v104 != v91)
        objc_enumerationMutation(v89);
      v19 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)v18);
      v20 = *(_QWORD *)(v2 + 32);
      if (v19)
      {
        v21 = *(_QWORD *)(v19 + 16);
        if (!v20)
          goto LABEL_82;
      }
      else
      {
        v21 = 0;
        if (!v20)
        {
LABEL_82:
          if ((objc_msgSend(0, "isToMany", v21) & 1) == 0)
            goto LABEL_117;
          goto LABEL_79;
        }
      }
      v22 = (unsigned __int8 *)objc_msgSend(*(id *)(v20 + 40), "objectForKey:", v21);
      if (!v22)
        goto LABEL_82;
      v23 = v22;
      v24 = v22[24];
      if (v24 == 1)
      {
        v26 = 0;
        v25 = 0;
        v27 = 0;
      }
      else
      {
        if (v24 != 7)
        {
          if ((objc_msgSend(v22, "isToMany") & 1) == 0 && v23[24] != 9)
          {
LABEL_117:
            v79 = (void *)MEMORY[0x1E0C99DA0];
            v80 = *MEMORY[0x1E0C99768];
            v81 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v19, CFSTR("transform"));
            v82 = CFSTR("Unrecognized destination property type in transform");
            goto LABEL_122;
          }
          goto LABEL_79;
        }
        v22 = (unsigned __int8 *)objc_msgSend(v22, "foreignKey");
        v25 = (void *)*((_QWORD *)v23 + 9);
        v26 = (void *)*((_QWORD *)v23 + 10);
        v27 = v22;
      }
      v28 = objc_msgSend(v22, "columnName");
      if (v19)
        v29 = *(void **)(v19 + 8);
      else
        v29 = 0;
      v30 = objc_msgSend(v29, "expressionType");
      if (v30 == 4)
      {
        if (objc_msgSend(CFSTR("_prependExternalBlobToken:"), "isEqual:", objc_msgSend(v29, "function")))
        {
          if (v23[24] == 1)
          {
            v36 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "arguments"), "objectAtIndex:", 0), "keyPath");
            v37 = *(_QWORD *)(v2 + 40);
            if (v37)
              v38 = (void *)objc_msgSend(*(id *)(v37 + 40), "objectForKey:", v36);
            else
              v38 = 0;
            v39 = *(void **)(v2 + 16);
            v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSCoreDataPrependExternalReferenceMarker(length(%@), %@)"), objc_msgSend(v38, "columnName"), objc_msgSend(v38, "columnName"));
            v41 = v39;
LABEL_63:
            objc_msgSend(v41, "setObject:forKey:", v40, v28);
            goto LABEL_79;
          }
          v79 = (void *)MEMORY[0x1E0C99DA0];
          v80 = *MEMORY[0x1E0C99768];
          v81 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v19, CFSTR("transform"));
          v82 = CFSTR("Invalid source property type in transform");
        }
        else
        {
LABEL_115:
          v79 = (void *)MEMORY[0x1E0C99DA0];
          v80 = *MEMORY[0x1E0C99768];
          v81 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v19, CFSTR("transform"));
          v82 = CFSTR("Unsupported value expression type in transform");
        }
LABEL_122:
        v85 = v79;
        v86 = v80;
LABEL_123:
        objc_exception_throw((id)objc_msgSend(v85, "exceptionWithName:reason:userInfo:", v86, v82, v81));
      }
      if (v30 == 3)
      {
        v42 = *(_QWORD *)(v2 + 40);
        v43 = objc_msgSend(v29, "keyPath");
        if (v42)
          v44 = (void *)objc_msgSend(*(id *)(v42 + 40), "objectForKey:", v43);
        else
          v44 = 0;
        if (a2
          && -[_NSSQLiteStoreMigrator enforceCloudKitConstraintsForEntity:](a2, (void *)objc_msgSend(v23, "entity"))&& !objc_msgSend((id)objc_msgSend(v44, "name"), "isEqualToString:", objc_msgSend(v23, "name")))
        {
          v87 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Properties cannot be renamed in stores that are used with CloudKit. Cannot rename '%@.%@' to '%@.%@'."), objc_msgSend(*(id *)(v2 + 40), "name"), objc_msgSend(v44, "name"), objc_msgSend(*(id *)(v2 + 32), "name"), objc_msgSend(v23, "name"));
          v88 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134110, v87, 0);
          objc_exception_throw(v88);
        }
        v45 = v23[24];
        if (v45 != 7)
        {
          if (v45 != 1)
          {
            v79 = (void *)MEMORY[0x1E0C99DA0];
            v80 = *MEMORY[0x1E0C99768];
            v81 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v19, CFSTR("transform"));
            v82 = CFSTR("Unrecognized source property type in transform");
            goto LABEL_122;
          }
          v46 = *(void **)(v2 + 16);
          v40 = objc_msgSend(v44, "columnName");
          v41 = v46;
          goto LABEL_63;
        }
        v55 = v2;
        v56 = v23;
        v54 = v44;
        goto LABEL_73;
      }
      if (v30)
        goto LABEL_115;
      v31 = v23[24];
      if (v31 != 7)
      {
        if (v31 != 1)
        {
          v79 = (void *)MEMORY[0x1E0C99DA0];
          v80 = *MEMORY[0x1E0C99768];
          v81 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v19, CFSTR("transform"), v23, CFSTR("property"), 0);
          v82 = CFSTR("Invalid constant expression type for property type in transform");
          goto LABEL_122;
        }
        v32 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", objc_msgSend(v29, "constantValue"), objc_msgSend(v23, "sqlType"), 0);
        v33 = *(void **)(v2 + 16);
        v34 = v32;
        v35 = v28;
        goto LABEL_78;
      }
      v47 = objc_msgSend((id)objc_msgSend(v23, "propertyDescription"), "inverseRelationship");
      if (v47)
      {
        v48 = (void *)v47;
        v49 = (id *)objc_msgSend((id)-[_NSSQLiteStoreMigrator entityMigrationDescriptionForEntity:](a2, (void *)objc_msgSend(v23, "destinationEntity")), "sourceEntity");
        v50 = (void *)objc_msgSend((id)objc_msgSend(v49, "entityDescription"), "_propertyWithRenamingIdentifier:", objc_msgSend(v48, "renamingIdentifier"));
        if (v50)
        {
          v51 = v50;
          if (!objc_msgSend(v50, "inverseRelationship"))
          {
            v52 = objc_msgSend(v51, "name");
            if (v49)
            {
              v53 = objc_msgSend(v49[5], "objectForKey:", v52);
              if (v53)
              {
                v54 = *(_BYTE **)(v53 + 56);
                if (v54)
                {
                  if (v54[24] == 7)
                  {
                    v55 = v2;
                    v56 = v23;
LABEL_73:
                    -[_NSSQLEntityMigrationDescription _populateSQLValuesForDestinationToOne:fromSourceToOne:](v55, v56, v54);
                    goto LABEL_79;
                  }
                }
              }
            }
          }
        }
      }
      v57 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, objc_msgSend(v27, "sqlType"), 0);
      objc_msgSend(*(id *)(v2 + 16), "setObject:forKey:", v57, v28);

      if (v25)
      {
        v58 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, objc_msgSend(v25, "sqlType"), 0);
        objc_msgSend(*(id *)(v2 + 16), "setObject:forKey:", v58, objc_msgSend(v25, "columnName"));

      }
      if (v26)
      {
        v32 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, objc_msgSend(v26, "sqlType"), 0);
        v59 = *(void **)(v2 + 16);
        v35 = objc_msgSend(v26, "columnName");
        v33 = v59;
        v34 = v32;
LABEL_78:
        objc_msgSend(v33, "setObject:forKey:", v34, v35);

      }
LABEL_79:
      v18 = (char *)v18 + 1;
    }
    while (obja != v18);
    v60 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
    obja = (id)v60;
  }
  while (v60);
LABEL_88:
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v61 = (void *)-[NSSQLEntity properties](*(_QWORD *)(v2 + 32));
  result = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
  if (result)
  {
    v62 = result;
    v63 = *(_QWORD *)v104;
    objb = v61;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v104 != v63)
          objc_enumerationMutation(v61);
        v65 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * v64);
        if (v65 && *(_BYTE *)(v65 + 24) == 7 && *(_BYTE *)(v65 + 88))
        {
          v66 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * v64), "foreignKey");
          v67 = *(void **)(v65 + 56);
          v68 = (_QWORD *)-[_NSSQLiteStoreMigrator entityMigrationDescriptionForEntity:](a2, (void *)objc_msgSend(v67, "entity"));
          v69 = v68;
          if (v68)
            v68 = (_QWORD *)v68[1];
          v70 = (void *)objc_msgSend(v68, "userInfo");
          if (objc_msgSend((id)objc_msgSend(v70, "objectForKey:", _NSInferredMappedPropertiesKey), "containsObject:", objc_msgSend(v67, "name")))
          {
            if (v67)
              v71 = (void *)objc_msgSend(v67, "propertyDescription");
            else
              v71 = 0;
            v72 = (_QWORD *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](objc_msgSend(v69, "sourceEntity"), objc_msgSend(v71, "renamingIdentifier"));
            if (!objc_msgSend(v72, "isToMany"))
            {
              v83 = (void *)MEMORY[0x1E0C99DA0];
              v84 = *MEMORY[0x1E0C99768];
              v109[0] = CFSTR("sourceRelationship");
              v109[1] = CFSTR("destinationRelationship");
              v110[0] = v72;
              v110[1] = v65;
              v81 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
              v82 = CFSTR("Unsupported relationship migration: A to-one's inverse to-many source must be a to-many");
              v85 = v83;
              v86 = v84;
              goto LABEL_123;
            }
            if (v72)
              v73 = (_QWORD *)v72[7];
            else
              v73 = 0;
            -[_NSSQLEntityMigrationDescription _populateSQLValuesForDestinationToOne:fromSourceToOne:](v2, (_QWORD *)v65, v73);
          }
          else
          {
            v74 = *(void **)(v65 + 72);
            v75 = *(void **)(v65 + 80);
            v76 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, objc_msgSend(v66, "sqlType"), 0);
            objc_msgSend(*(id *)(v2 + 16), "setObject:forKey:", v76, objc_msgSend(v66, "columnName"));

            if (v74)
            {
              v77 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, objc_msgSend(v74, "sqlType"), 0);
              objc_msgSend(*(id *)(v2 + 16), "setObject:forKey:", v77, objc_msgSend(v74, "columnName"));

            }
            v61 = objb;
            if (v75)
            {
              v78 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, objc_msgSend(v75, "sqlType"), 0);
              objc_msgSend(*(id *)(v2 + 16), "setObject:forKey:", v78, objc_msgSend(v75, "columnName"));

            }
          }
        }
        ++v64;
      }
      while (v62 != v64);
      result = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
      v62 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_populateSQLValuesForDestinationToOne:(_QWORD *)a3 fromSourceToOne:
{
  uint64_t result;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSQLBindVariable *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  result = objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", objc_msgSend((id)objc_msgSend(a3, "foreignKey"), "columnName"), objc_msgSend((id)objc_msgSend(a2, "foreignKey"), "columnName"));
  if (!a2)
    return result;
  v7 = (void *)a2[9];
  v8 = (void *)a2[10];
  if (!v7)
    goto LABEL_11;
  if (a3)
  {
    v9 = (void *)a3[9];
    if (v9)
    {
      v10 = *(void **)(a1 + 16);
      v11 = objc_msgSend(v9, "columnName");
      v12 = objc_msgSend(v7, "columnName");
      v13 = v10;
      v14 = v11;
LABEL_10:
      result = objc_msgSend(v13, "setObject:forKey:", v14, v12);
LABEL_11:
      if (v8)
        goto LABEL_12;
      return result;
    }
  }
  v15 = objc_msgSend(a3, "destinationEntity");
  if (v15)
    v16 = *(unsigned int *)(v15 + 184);
  else
    v16 = 0;
  v17 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", v16, objc_msgSend(v7, "sqlType"));
  objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v17, objc_msgSend(v7, "columnName"));

  v18 = objc_msgSend(a3, "destinationEntity");
  v19 = *(void **)(a1 + 24);
  if (v19)
  {
    v12 = objc_msgSend(a2, "name");
    v13 = v19;
    v14 = v18;
    goto LABEL_10;
  }
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v18, objc_msgSend(a2, "name"), 0);
  *(_QWORD *)(a1 + 24) = result;
  if (v8)
  {
LABEL_12:
    if (a3)
    {
      v20 = (void *)a3[10];
      v21 = *(void **)(a1 + 16);
      if (v20)
        return objc_msgSend(v21, "setObject:forKey:", objc_msgSend(v20, "columnName"), objc_msgSend(v8, "columnName"));
    }
    else
    {
      v21 = *(void **)(a1 + 16);
    }
    v20 = (void *)objc_msgSend(a3, "foreignKey");
    return objc_msgSend(v21, "setObject:forKey:", objc_msgSend(v20, "columnName"), objc_msgSend(v8, "columnName"));
  }
  return result;
}

- (uint64_t)addedManyToManys
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 56))
    {
      v2 = (void *)objc_msgSend(*(id *)(result + 8), "userInfo");
      v3 = (void *)objc_msgSend(v2, "objectForKey:", _NSInferredAddedPropertiesKey);
      *(_QWORD *)(v1 + 56) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v4 = (void *)objc_msgSend(*(id *)(v1 + 32), "manyToManyRelationships", 0);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v11;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD **)(*((_QWORD *)&v10 + 1) + 8 * v8);
            if (v9 && v9[8] && objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "entity") == *(_QWORD *)(v1 + 32))
            {
              if (objc_msgSend(v3, "containsObject:", objc_msgSend(v9, "name")))
                objc_msgSend(*(id *)(v1 + 56), "addObject:", v9);
            }
            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v6);
      }
    }
    return *(_QWORD *)(v1 + 56);
  }
  return result;
}

- (uint64_t)removedManyToManys
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 64))
    {
      v2 = (void *)objc_msgSend(*(id *)(result + 8), "userInfo");
      v3 = (void *)objc_msgSend(v2, "objectForKey:", _NSInferredRemovedPropertiesKey);
      *(_QWORD *)(v1 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v4 = (void *)objc_msgSend(*(id *)(v1 + 40), "manyToManyRelationships", 0);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v11;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD **)(*((_QWORD *)&v10 + 1) + 8 * v8);
            if (v9 && v9[8] && objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "entity") == *(_QWORD *)(v1 + 40))
            {
              if (objc_msgSend(v3, "containsObject:", objc_msgSend(v9, "name")))
                objc_msgSend(*(id *)(v1 + 64), "addObject:", v9);
            }
            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v6);
      }
    }
    return *(_QWORD *)(v1 + 64);
  }
  return result;
}

- (uint64_t)transformedManyToManys
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  __CFString *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 72))
    {
      v2 = (void *)objc_msgSend(*(id *)(result + 8), "userInfo");
      v3 = (void *)objc_msgSend(v2, "objectForKey:", _NSInferredMappedPropertiesKey);
      *(_QWORD *)(v1 + 72) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v4 = (void *)objc_msgSend(*(id *)(v1 + 32), "manyToManyRelationships", 0);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v12;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD **)(*((_QWORD *)&v11 + 1) + 8 * v8);
            if (v9
              && v9[8]
              && objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "entity") == *(_QWORD *)(v1 + 32)
              && objc_msgSend(v3, "containsObject:", objc_msgSend(v9, "name")))
            {
              v10 = (__CFString *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](*(_QWORD *)(v1 + 40), objc_msgSend((id)objc_msgSend(v9, "propertyDescription"), "renamingIdentifier"));
              if ((-[NSSQLManyToMany isTableSchemaEqual:]((uint64_t)v9, v10) & 1) == 0)
                objc_msgSend(*(id *)(v1 + 72), "addObject:", v9);
            }
            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v6);
      }
    }
    return *(_QWORD *)(v1 + 72);
  }
  return result;
}

- (uint64_t)nextPropertyTransform
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v2 = *(void **)(a1 + 88);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v12;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
          if (v7)
            v8 = *(_QWORD *)(v7 + 24);
          else
            v8 = 0;
          if ((objc_msgSend(*(id *)(a1 + 80), "containsObject:", v8) & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 80), "addObject:", v7);
            objc_msgSend(*(id *)(a1 + 88), "removeObject:", v7);
            return v7;
          }
          ++v6;
        }
        while (v4 != v6);
        v9 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v4 = v9;
      }
      while (v9);
    }
    if (objc_msgSend(*(id *)(a1 + 88), "count"))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Entity mapping includes property transform with unresolved prerequisite"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *(_QWORD *)(a1 + 88), CFSTR("pendingTransforms"))));
  }
  return 0;
}

- (void)validateCloudKitEntityMigration
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (void *)-[_NSSQLEntityMigrationDescription transformedManyToManys]((uint64_t)self);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
        if (v8)
          v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v7), "propertyDescription");
        else
          v9 = 0;
        if (objc_msgSend((id)objc_msgSend(v9, "renamingIdentifier"), "length"))
        {
          if (v8)
          {
            v10 = (void *)objc_msgSend((id)objc_msgSend(v8, "propertyDescription"), "name");
            v11 = (void *)objc_msgSend(v8, "propertyDescription");
          }
          else
          {
            v10 = (void *)objc_msgSend(0, "name");
            v11 = 0;
          }
          if ((objc_msgSend(v10, "isEqualToString:", objc_msgSend(v11, "renamingIdentifier")) & 1) == 0)
          {
            v13 = (void *)MEMORY[0x1E0CB3940];
            if (v8)
            {
              v14 = objc_msgSend((id)objc_msgSend(v8, "propertyDescription"), "renamingIdentifier");
              v15 = (void *)objc_msgSend(v8, "propertyDescription");
            }
            else
            {
              v14 = objc_msgSend(0, "renamingIdentifier");
              v15 = 0;
            }
            v20 = objc_msgSend(v15, "name");
            v16 = objc_msgSend(v13, "stringWithFormat:", CFSTR("CloudKit integration forbids renaming '%@' to '%@'. Older devices can't process the new relationships."), v14, v20, (_QWORD)v22);
LABEL_22:
            v17 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134110, v16, 0);
            objc_exception_throw(v17);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v12 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v5 = v12;
    }
    while (v12);
  }
  if ((objc_msgSend(-[NSSQLEntity name](self->_srcEntity, "name"), "isEqualToString:", -[NSSQLEntity name](self->_dstEntity, "name")) & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = -[NSSQLEntity name](self->_srcEntity, "name");
    v21 = -[NSSQLEntity name](self->_dstEntity, "name");
    v16 = objc_msgSend(v18, "stringWithFormat:", CFSTR("CloudKit integration forbids renaming '%@' to '%@'. Older devices can't process the new records."), v19, v21, (_QWORD)v22);
    goto LABEL_22;
  }
}

- (NSSQLEntity)sourceEntity
{
  return self->_srcEntity;
}

@end
