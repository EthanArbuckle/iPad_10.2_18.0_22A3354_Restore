@implementation _NSSQLTableMigrationDescription

- (_QWORD)initWithRootEntity:(int)a3 migrationType:
{
  _QWORD *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)_NSSQLTableMigrationDescription;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = a2;
    *((_DWORD *)v5 + 6) = a3;
    v5[8] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
    v5[12] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    v5[14] = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5[15] = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5[16] = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5[17] = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5[22] = objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_rootEntity = 0;
  self->_sourceRootEntity = 0;

  self->_migrationByEntity = 0;
  self->_addedEntityMigrations = 0;

  self->_removedEntityMigrations = 0;
  self->_copiedEntityMigrations = 0;

  self->_transformedEntityMigrations = 0;
  self->_addedManyToManys = 0;

  self->_removedManyToManys = 0;
  self->_transformedManyToManys = 0;

  self->_tempTableNames = 0;
  self->_hasComplexSchemaTransformations = 0;

  self->_addedColumnSet = 0;
  self->_renamedTableSet = 0;

  self->_renamedColumnSet = 0;
  self->_renamedMTMSet = 0;

  self->_delayedDropColumnSet = 0;
  self->_raisedColumnSet = 0;

  self->_droppedEntitySet = 0;
  self->_collapsedEntitySet = 0;

  self->_columnsUpgradedToMandatory = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSSQLTableMigrationDescription;
  -[_NSSQLTableMigrationDescription dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSSQLTableMigrationDescription;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ : %@ "), -[_NSSQLTableMigrationDescription description](&v3, sel_description), -[NSSQLEntity name](self->_rootEntity, "name"));
}

- (uint64_t)addEntityMigrationDescription:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (result)
  {
    v3 = result;
    if (a2)
    {
      if (*(_DWORD *)(a2 + 48) == 1)
        v4 = (void *)objc_msgSend((id)a2, "sourceEntity");
      else
        v4 = *(void **)(a2 + 32);
      objc_msgSend(*(id *)(v3 + 64), "setObject:forKey:", a2, objc_msgSend(v4, "name"));
      if (*(_BYTE *)(a2 + 96) && !*(_QWORD *)(v3 + 104))
        *(_QWORD *)(v3 + 104) = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      switch(*(_DWORD *)(a2 + 48))
      {
        case 0:
          goto LABEL_10;
        case 1:
          v5 = *(void **)(v3 + 40);
          if (!v5)
          {
            v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
            *(_QWORD *)(v3 + 40) = v5;
          }
          return objc_msgSend(v5, "addObject:", a2);
        case 2:
          v5 = *(void **)(v3 + 48);
          if (!v5)
          {
            v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
            *(_QWORD *)(v3 + 48) = v5;
          }
          return objc_msgSend(v5, "addObject:", a2);
        case 3:
          v5 = *(void **)(v3 + 56);
          if (!v5)
          {
            v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
            *(_QWORD *)(v3 + 56) = v5;
          }
          return objc_msgSend(v5, "addObject:", a2);
        default:
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unrecognized entity migration type"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a2, CFSTR("entityMigration"))));
      }
    }
    objc_msgSend(*(id *)(result + 64), "setObject:forKey:", 0, objc_msgSend(0, "name"));
LABEL_10:
    v5 = *(void **)(v3 + 32);
    if (!v5)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
      *(_QWORD *)(v3 + 32) = v5;
    }
    return objc_msgSend(v5, "addObject:", a2);
  }
  return result;
}

- (uint64_t)_doAttributesHaveChangesRequiringCopyForMigration:(uint64_t)a3 withContext:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  id v13;
  int v14;
  int v15;
  uint64_t result;
  void *v17;
  int v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a2)
    v4 = (void *)a2[4];
  else
    v4 = 0;
  v5 = objc_msgSend(a2, "sourceEntity");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  if (v4)
    v4 = -[NSSQLEntity entitySpecificPropertiesPassing:]((uint64_t)v4, (uint64_t)&__block_literal_global_15_0);
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (!v6)
    return 0;
  v7 = *(_QWORD *)v33;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v33 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      v10 = objc_msgSend((id)objc_msgSend(v9, "propertyDescription"), "renamingIdentifier");
      if (objc_msgSend((id)objc_msgSend(v9, "propertyDescription"), "_namespace"))
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), objc_msgSend((id)objc_msgSend(v9, "propertyDescription"), "_namespace"), v10);
      v11 = (_BYTE *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](v5, v10);
      if (v11)
      {
        v12 = v9;
LABEL_18:
        v14 = objc_msgSend(v11, "propertyType");
        if (v14 != objc_msgSend(v12, "propertyType"))
          return 1;
        v15 = objc_msgSend((id)objc_msgSend(v11, "columnName"), "isEqual:", objc_msgSend(v12, "columnName"));
        if ((v15 & 1) == 0)
        {
          if (!v12)
            return 1;
          result = 1;
          if (!v11 || v12[24] != 1 || v11[24] != 1)
            return result;
          if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "propertyDescription"), "renamingIdentifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v11, "propertyDescription"), "renamingIdentifier")))return 1;
          v17 = *(void **)(a1 + 128);
          v36[0] = v11;
          v36[1] = v12;
          objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2));
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "propertyDescription"), "userInfo"), "objectForKey:", CFSTR("NSMigrationAllowTypeTransformation")))
        {
          v18 = 0;
        }
        else
        {
          v18 = v15;
        }
        if (v18 == 1
          && !objc_msgSend((id)objc_msgSend(v11, "propertyDescription"), "_isSchemaEqual:", objc_msgSend(v12, "propertyDescription")))
        {
          return 1;
        }
        if (v15
          && objc_msgSend((id)objc_msgSend(v11, "propertyDescription"), "isOptional")
          && (objc_msgSend((id)objc_msgSend(v12, "propertyDescription"), "isOptional") & 1) == 0)
        {
          v19 = *(id *)(a1 + 168);
          if (!v19)
          {
            v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            *(_QWORD *)(a1 + 168) = v19;
          }
          objc_msgSend(v19, "addObject:", v12);
        }
        continue;
      }
      v12 = -[NSSQLEntity subhierarchyColumnMatching:](v5, v9);
      if (v12)
      {
        v13 = *(id *)(a1 + 144);
        if (!v13)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          *(_QWORD *)(a1 + 144) = v13;
        }
        objc_msgSend(v13, "addObject:", v12);
        goto LABEL_18;
      }
      if (a3)
      {
        v20 = *(void **)(a3 + 48);
        if (v20)
        {
          v26 = 0;
          v27 = &v26;
          v28 = 0x3052000000;
          v29 = __Block_byref_object_copy__34;
          v30 = __Block_byref_object_dispose__34;
          v31 = 0;
          v21 = -[NSSQLiteConnection fetchTableCreationSQL](v20);
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __97___NSSQLTableMigrationDescription__doAttributesHaveChangesRequiringCopyForMigration_withContext___block_invoke;
          v25[3] = &unk_1E1EE0698;
          v25[4] = v5;
          v25[5] = &v26;
          objc_msgSend(v21, "enumerateObjectsUsingBlock:", v25);
          v22 = (void *)v27[5];
          if (!v22
          {
            _Block_object_dispose(&v26, 8);
            return 1;
          }
          _Block_object_dispose(&v26, 8);
        }
      }
      objc_msgSend(*(id *)(a1 + 112), "addObject:", v9);
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    result = 0;
    if (v6)
      continue;
    return result;
  }
}

- (uint64_t)_doRelationshipsHaveChangesRequiringCopyForMigration:(uint64_t)a3 inContext:
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  BOOL v49;
  void *v50;
  void *v51;
  void **v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  int v56;
  void *v57;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[2];
  void *v65;
  _QWORD v66[2];
  uint64_t v67;
  _QWORD v68[2];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (a2)
    v4 = a2[4];
  else
    v4 = 0;
  v5 = objc_msgSend(a2, "sourceEntity");
  if (a3)
    v6 = *(void **)(a3 + 32);
  else
    v6 = 0;
  v56 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "sqlCore"), "options"), "objectForKey:", CFSTR("NSPersistentStoreDeferredLightweightMigrationOptionKey")), "BOOLValue");
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  if (v4)
    v7 = -[NSSQLEntity entitySpecificPropertiesPassing:](v4, (uint64_t)&__block_literal_global_14);
  else
    v7 = 0;
  result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  v9 = a1;
  if (result)
  {
    v10 = result;
    v55 = a3;
    v59 = *(_QWORD *)v61;
    v57 = v7;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v61 != v59)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v11);
        v13 = -[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](v5, objc_msgSend((id)objc_msgSend((id)v12, "propertyDescription"), "renamingIdentifier"));
        if (!v13)
        {
          if (objc_msgSend((id)v12, "propertyType") != 7)
          {
            if (!v12)
              goto LABEL_79;
            goto LABEL_38;
          }
          if (!v12)
            goto LABEL_79;
          if (!*(_BYTE *)(v12 + 88))
            goto LABEL_38;
          v31 = objc_msgSend((id)v12, "name");
          if (!v5 || (v13 = objc_msgSend(*(id *)(v5 + 40), "objectForKey:", v31)) == 0)
          {
            v32 = *(void **)(v12 + 56);
            v33 = objc_msgSend((id)-[_NSSQLiteStoreMigrator entityMigrationDescriptionForEntity:](v55, (void *)objc_msgSend(v32, "sourceEntity")), "sourceEntity");
            v34 = objc_msgSend((id)objc_msgSend(v32, "propertyDescription"), "renamingIdentifier");
            v35 = v33;
            v7 = v57;
            v36 = -[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](v35, v34);
            if (v36 && *(_QWORD *)(v36 + 56))
              return 1;
LABEL_38:
            if (*(_BYTE *)(v12 + 24) == 7)
            {
              objc_msgSend(*(id *)(v9 + 112), "addObject:", objc_msgSend((id)v12, "foreignKey"));
              if (*(_QWORD *)(v12 + 72))
                objc_msgSend(*(id *)(v9 + 112), "addObject:");
              if (*(_QWORD *)(v12 + 80))
                objc_msgSend(*(id *)(v9 + 112), "addObject:");
            }
            goto LABEL_79;
          }
        }
        v14 = objc_msgSend((id)v13, "propertyType");
        if (v14 != objc_msgSend((id)v12, "propertyType"))
          return 1;
        v15 = objc_msgSend((id)v12, "destinationEntity");
        v16 = objc_msgSend((id)v13, "destinationEntity");
        if (v14 == 7)
        {
          v17 = v16;
          if (objc_msgSend((id)objc_msgSend((id)v13, "propertyDescription"), "isOptional")
            && !objc_msgSend((id)objc_msgSend((id)v12, "propertyDescription"), "isOptional"))
          {
            return 1;
          }
          v18 = (void *)objc_msgSend((id)v13, "foreignKey");
          v19 = objc_msgSend((id)v12, "foreignKey");
          if (v18)
          {
            v20 = (void *)v19;
            if (v19)
            {
              v21 = objc_msgSend(v18, "columnName");
              v22 = objc_msgSend(v20, "columnName");
              v23 = (void *)v21;
              v9 = a1;
              if ((objc_msgSend(v23, "isEqual:", v22) & 1) == 0)
              {
                v24 = *(void **)(a1 + 128);
                v68[0] = v18;
                v68[1] = v20;
                v25 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
                v26 = v24;
                v9 = a1;
                objc_msgSend(v26, "addObject:", v25);
              }
            }
          }
          if (v15 && *(_DWORD *)(v15 + 188) != *(_DWORD *)(v15 + 184))
          {
            if (v17)
              v37 = *(void **)(v17 + 152);
            else
              v37 = 0;
            if (!objc_msgSend(v37, "count"))
            {
              if (v12)
                v29 = *(_QWORD *)(v12 + 72);
              else
                v29 = 0;
              v30 = *(void **)(v9 + 112);
              goto LABEL_55;
            }
            if (v12)
            {
              v38 = *(_QWORD *)(v13 + 72);
              if (v38)
              {
                v39 = *(void **)(v12 + 72);
                if (v39)
                {
                  v40 = objc_msgSend(*(id *)(v13 + 72), "columnName");
                  v41 = objc_msgSend(v39, "columnName");
                  v42 = (void *)v40;
                  v9 = a1;
                  if ((objc_msgSend(v42, "isEqual:", v41) & 1) == 0)
                  {
                    v43 = *(void **)(a1 + 128);
                    v66[0] = v38;
                    v66[1] = v39;
                    v44 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
                    v45 = v43;
                    v9 = a1;
                    objc_msgSend(v45, "addObject:", v44);
                  }
                }
              }
              v46 = *(void **)(v13 + 80);
              goto LABEL_57;
            }
            v49 = 0;
            v48 = 0;
            v46 = *(void **)(v13 + 80);
          }
          else
          {
            if (v17 && *(_DWORD *)(v17 + 188) != *(_DWORD *)(v17 + 184))
            {
              v27 = v56;
              if (!*(_QWORD *)(v13 + 72))
                v27 = 0;
              if (v27 != 1)
                return 1;
              v28 = *(void **)(v9 + 176);
              v67 = *(_QWORD *)(v13 + 72);
              v29 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
              v30 = v28;
LABEL_55:
              objc_msgSend(v30, "addObject:", v29);
            }
            v46 = *(void **)(v13 + 80);
            if (v12)
            {
LABEL_57:
              v47 = 0;
              v48 = *(void **)(v12 + 80);
              v49 = v48 != 0;
              if (!v46 && v48)
              {
                objc_msgSend(*(id *)(v9 + 112), "addObject:", v48);
LABEL_75:
                if (*(_BYTE *)(v12 + 88))
                {
                  v7 = v57;
                  if (!*(_BYTE *)(v13 + 88))
                    return 1;
                  goto LABEL_79;
                }
LABEL_78:
                v7 = v57;
                if (*(_BYTE *)(v13 + 88))
                  return 1;
                goto LABEL_79;
              }
LABEL_64:
              if (!v46 || v48)
              {
                v54 = !v49;
                if (!v46)
                  v54 = 1;
                if ((v54 & 1) == 0
                  && (objc_msgSend((id)objc_msgSend(v46, "columnName"), "isEqual:", objc_msgSend(v48, "columnName")) & 1) == 0)
                {
                  v50 = *(void **)(v9 + 128);
                  v64[0] = v46;
                  v64[1] = v48;
                  v51 = (void *)MEMORY[0x1E0C99D20];
                  v52 = (void **)v64;
                  v53 = 2;
                  goto LABEL_73;
                }
              }
              else
              {
                if (!v56)
                  return 1;
                v50 = *(void **)(v9 + 176);
                v65 = v46;
                v51 = (void *)MEMORY[0x1E0C99D20];
                v52 = &v65;
                v53 = 1;
LABEL_73:
                objc_msgSend(v50, "addObject:", objc_msgSend(v51, "arrayWithObjects:count:", v52, v53));
              }
              if ((v47 & 1) == 0)
                goto LABEL_75;
              goto LABEL_78;
            }
            v49 = 0;
            v48 = 0;
          }
          v47 = 1;
          goto LABEL_64;
        }
LABEL_79:
        ++v11;
      }
      while (v10 != v11);
      result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      v10 = result;
    }
    while (result);
  }
  return result;
}

- (void)_determineSchemaTransformationComplexityInMigrationContext:(id *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  id *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  int v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  _QWORD *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  void *v45;
  int v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id obj;
  id obja;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
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
  _BYTE *v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  int8x16_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  if (a1[13])
    return;
  if ((objc_msgSend((id)objc_msgSend(a1[1], "tableName"), "isEqualToString:", objc_msgSend(-[_NSSQLTableMigrationDescription _sourceRootEntity]((uint64_t)a1), "tableName")) & 1) == 0)
  {
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[1], "entityDescription"), "renamingIdentifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a1[2], "entityDescription"), "renamingIdentifier")))
    {
      v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
      goto LABEL_100;
    }
    v3 = a1[15];
    v91 = vextq_s8(*(int8x16_t *)(a1 + 1), *(int8x16_t *)(a1 + 1), 8uLL);
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 2));
  }
  if (!objc_msgSend(a1[5], "count")
    || objc_msgSend(a1[4], "count")
    || objc_msgSend(a1[7], "count")
    || objc_msgSend(a1[6], "count"))
  {
    a1[19] = objc_alloc_init(MEMORY[0x1E0C99E20]);
    a1[20] = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v4 = a1[5];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v81;
LABEL_11:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v81 != v6)
          objc_enumerationMutation(v4);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * v7), "sourceEntity");
        v9 = (void *)v8;
        v10 = v8 ? -[NSSQLEntity entitySpecificPropertiesPassing:](v8, (uint64_t)&__block_literal_global_14) : 0;
        if (objc_msgSend(v10, "count"))
          break;
        v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "entityDescription"), "userInfo"), "objectForKey:", CFSTR("NSEntityRenamingShouldRebaseKey"));
        if (!v11
          || (v12 = objc_msgSend((id)objc_msgSend(v9, "name"), "isEqualToString:", v11), v13 = a1 + 20, (v12 & 1) == 0))
        {
          v13 = a1 + 19;
        }
        objc_msgSend(*v13, "addObject:", v9);
        if (v5 == ++v7)
        {
          v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
          v5 = v14;
          if (v14)
            goto LABEL_11;
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      if (!objc_msgSend(a1[4], "count")
        || objc_msgSend(a1[5], "count")
        || objc_msgSend(a1[7], "count")
        || objc_msgSend(a1[6], "count"))
      {
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        obj = a1[4];
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
        if (v15)
        {
          v57 = *(_QWORD *)v77;
          do
          {
            v16 = 0;
            v59 = v15;
            do
            {
              if (*(_QWORD *)v77 != v57)
                objc_enumerationMutation(obj);
              v17 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v16);
              if (v17)
              {
                v18 = *(_QWORD *)(v17 + 32);
                v72 = 0u;
                v73 = 0u;
                v74 = 0u;
                v75 = 0u;
                if (v18)
                  v19 = -[NSSQLEntity entitySpecificPropertiesPassing:](v18, (uint64_t)&__block_literal_global_14);
                else
                  v19 = 0;
              }
              else
              {
                v19 = 0;
                v74 = 0u;
                v75 = 0u;
                v72 = 0u;
                v73 = 0u;
              }
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
              if (v20)
              {
                v21 = *(_QWORD *)v73;
                do
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v73 != v21)
                      objc_enumerationMutation(v19);
                    v23 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
                    if (v23)
                    {
                      v24 = *(unsigned __int8 *)(v23 + 24);
                      if (v24 == 1)
                        goto LABEL_47;
                      if (v24 == 7)
                      {
                        objc_msgSend(a1[14], "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "foreignKey"));
                        if (*(_QWORD *)(v23 + 72))
                          objc_msgSend(a1[14], "addObject:");
                        v23 = *(_QWORD *)(v23 + 80);
                        if (v23)
LABEL_47:
                          objc_msgSend(a1[14], "addObject:", v23);
                      }
                    }
                  }
                  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
                }
                while (v20);
              }
              ++v16;
            }
            while (v16 != v59);
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
            v15 = v25;
          }
          while (v25);
        }
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v26 = a1[6];
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v69;
          while (2)
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v69 != v28)
                objc_enumerationMutation(v26);
              v30 = *(_QWORD **)(*((_QWORD *)&v68 + 1) + 8 * j);
              if (-[_NSSQLTableMigrationDescription _doAttributesHaveChangesRequiringCopyForMigration:withContext:]((uint64_t)a1, v30, a2)|| -[_NSSQLTableMigrationDescription _doRelationshipsHaveChangesRequiringCopyForMigration:inContext:]((uint64_t)a1, v30, a2))
              {
                v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
                goto LABEL_100;
              }
            }
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
            if (v27)
              continue;
            break;
          }
        }
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v31 = a1[7];
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
        if (v32)
        {
          v53 = v32;
          v33 = *(id *)v65;
          v34 = &__block_literal_global_14;
          obja = *(id *)v65;
          do
          {
            v35 = 0;
            do
            {
              if (*(id *)v65 != v33)
                objc_enumerationMutation(v31);
              v36 = *(_QWORD **)(*((_QWORD *)&v64 + 1) + 8 * v35);
              if (v36)
                v37 = v36[4];
              else
                v37 = 0;
              v38 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v35), "sourceEntity");
              v62 = 0u;
              v63 = 0u;
              v60 = 0u;
              v61 = 0u;
              v58 = v35;
              v39 = v34;
              if (v38)
                v40 = -[NSSQLEntity entitySpecificPropertiesPassing:](v38, (uint64_t)v34);
              else
                v40 = 0;
              v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v85, 16);
              if (v41)
              {
                v42 = *(_QWORD *)v61;
                v52 = v31;
                do
                {
                  v43 = 0;
                  do
                  {
                    if (*(_QWORD *)v61 != v42)
                      objc_enumerationMutation(v40);
                    v44 = *(_BYTE **)(*((_QWORD *)&v60 + 1) + 8 * v43);
                    if (!-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](v37, objc_msgSend((id)objc_msgSend(v44, "propertyDescription", v52), "renamingIdentifier")))
                    {
                      if (a2)
                        v45 = *(void **)(a2 + 32);
                      else
                        v45 = 0;
                      v46 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v45, "sqlCore"), "options"), "objectForKey:", CFSTR("NSPersistentStoreDeferredLightweightMigrationOptionKey")), "BOOLValue") ^ 1;
                      if (!v44)
                        LOBYTE(v46) = 1;
                      if ((v46 & 1) != 0 || v44[24] != 1)
                        goto LABEL_121;
                      v47 = a1[22];
                      v84 = v44;
                      objc_msgSend(v47, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1));
                    }
                    ++v43;
                  }
                  while (v41 != v43);
                  v48 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v85, 16);
                  v41 = v48;
                  v31 = v52;
                }
                while (v48);
              }
              v34 = v39;
              v33 = obja;
              if (-[_NSSQLTableMigrationDescription _doAttributesHaveChangesRequiringCopyForMigration:withContext:]((uint64_t)a1, v36, a2)|| -[_NSSQLTableMigrationDescription _doRelationshipsHaveChangesRequiringCopyForMigration:inContext:]((uint64_t)a1, v36, a2))
              {
LABEL_121:
                v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
                goto LABEL_100;
              }
              v35 = v58 + 1;
            }
            while (v58 + 1 != v53);
            v49 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
            v50 = 1;
            v53 = v49;
          }
          while (v49);
        }
        else
        {
          v50 = 1;
        }
        goto LABEL_101;
      }
    }
    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
  }
  else
  {
    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
  }
LABEL_100:
  v50 = 0;
  a1[13] = (id)v51;
LABEL_101:
  if ((objc_msgSend(a1[13], "BOOLValue") & 1) != 0
    || !objc_msgSend(a1[19], "count")
    && !objc_msgSend(a1[14], "count")
    && !objc_msgSend(a1[15], "count")
    && !objc_msgSend(a1[16], "count")
    && !objc_msgSend(a1[21], "count")
    && !objc_msgSend(a1[18], "count")
    && !objc_msgSend(a1[20], "count")
    && !objc_msgSend(a1[22], "count"))
  {

    a1[19] = 0;
    a1[14] = 0;

    a1[15] = 0;
    a1[16] = 0;

    a1[21] = 0;
    a1[18] = 0;

    a1[20] = 0;
    a1[22] = 0;
  }
  if ((v50 & 1) != 0 && !a1[13])
    a1[13] = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 0);
}

- (id)_sourceRootEntity
{
  id result;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = *(id *)(a1 + 16);
  if (!result)
  {
    v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", objc_msgSend(*(id *)(a1 + 8), "name")), "sourceEntity");
    if (!v3)
    {
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      v4 = *(void **)(a1 + 64);
      v3 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
      {
        v5 = (uint64_t)v3;
        v6 = *(_QWORD *)v9;
LABEL_7:
        v7 = 0;
        while (1)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7)), "sourceEntity");
          if (v3)
            break;
          if (v5 == ++v7)
          {
            v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
            v3 = 0;
            if (v5)
              goto LABEL_7;
            break;
          }
        }
      }
    }
    result = (id)objc_msgSend(v3, "rootEntity");
    *(_QWORD *)(a1 + 16) = result;
  }
  return result;
}

- (uint64_t)_ownSourceRootTableNeedsRenameInMigrationContext:(uint64_t)a1
{
  void *v4;

  if (*(_DWORD *)(a1 + 24) < 2u)
    return 0;
  v4 = *(void **)(a1 + 104);
  if (!v4)
  {
    -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)a1, a2);
    v4 = *(void **)(a1 + 104);
  }
  return objc_msgSend(v4, "BOOLValue");
}

- (void)_sourceRootTableNameInMigrationContext:(uint64_t)a1
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  do
  {
    if (!a1)
      return 0;
    v3 = a1;
    v4 = -[_NSSQLTableMigrationDescription _sourceRootEntity](a1);
    a1 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a2, v4);
  }
  while (a1 != v3);
  v5 = objc_msgSend(v4, "tableName");
  if (-[_NSSQLTableMigrationDescription _ownSourceRootTableNeedsRenameInMigrationContext:](v3, a2))
    return -[_NSSQLTableMigrationDescription _tempNameForTableName:](v3, v5);
  return (void *)v5;
}

- (void)_tempNameForTableName:(uint64_t)a1
{
  void *v4;

  v4 = (void *)objc_msgSend(*(id *)(a1 + 96), "objectForKey:", a2);
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("_T_%@"), a2);
    objc_msgSend(*(id *)(a1 + 96), "setObject:forKey:", v4, a2);

  }
  return v4;
}

- (uint64_t)appendStatementsToRenameTables:(uint64_t)a3 migrationContext:
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  id v11;
  __CFString *v12;
  _BYTE *v13;
  _BYTE *v14;
  int v15;
  int v16;
  void *length;
  int v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  NSSQLiteStatement *v23;
  NSSQLiteStatement *v24;
  char v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  __CFString *v29;
  _QWORD *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  _QWORD *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t ii;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSSQLiteStatement *v46;
  uint64_t v47;
  void *v48;
  NSSQLiteStatement *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  NSSQLiteStatement *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  NSSQLiteStatement *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t m;
  void *v80;
  void *v81;
  void *v82;
  NSSQLiteStatement *v83;
  void *v84;
  NSSQLiteStatement *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t n;
  void *v93;
  NSSQLiteStatement *v94;
  uint64_t v95;
  void *v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSSQLiteStatement *v103;
  id obj;
  id obja;
  id objb;
  id objc;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  _QWORD v137[2];
  _QWORD v138[2];
  _QWORD v139[2];
  _QWORD v140[2];
  _QWORD v141[2];
  _QWORD v142[2];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    if (a3)
      v103 = *(NSSQLiteStatement **)(a3 + 32);
    else
      v103 = 0;
    v6 = -[_NSSQLTableMigrationDescription _sourceRootEntity](result);
    v99 = v5;
    if (-[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a3, v6) == v5)
    {
      if (-[_NSSQLTableMigrationDescription _ownSourceRootTableNeedsRenameInMigrationContext:](v5, a3))
      {
        v47 = objc_msgSend(-[_NSSQLTableMigrationDescription _sourceRootEntity](v5), "tableName");
        v48 = -[_NSSQLTableMigrationDescription _tempNameForTableName:](v5, v47);
        v49 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](v103, v47, (uint64_t)v48);
        objc_msgSend(a2, "addObject:", v49);

        v134 = 0u;
        v135 = 0u;
        v132 = 0u;
        v133 = 0u;
        v50 = *(void **)(v5 + 56);
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v132, v148, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v133;
          do
          {
            for (i = 0; i != v52; ++i)
            {
              if (*(_QWORD *)v133 != v53)
                objc_enumerationMutation(v50);
              v55 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v132 + 1) + 8 * i), "sourceEntity"), "rootEntity");
              if ((objc_msgSend(v55, "isEqual:", -[_NSSQLTableMigrationDescription _sourceRootEntity](v5)) & 1) == 0)
              {
                v95 = *MEMORY[0x1E0C99768];
                v96 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Cannot merge multiple root entity source tables into one destination entity root table"), CFSTR("message"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend((id)objc_msgSend(v55, "entityDescription"), "name"), objc_msgSend((id)objc_msgSend(-[_NSSQLTableMigrationDescription _sourceRootEntity](v5), "entityDescription"), "name"), 0), CFSTR("sourceRootEntities"), objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "entityDescription"), "name"), CFSTR("destinationRootEntity"), 0);
                v97 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v95, 134190, (uint64_t)CFSTR("Cannot merge multiple root entity source tables into one destination entity root table"), v96);
                objc_exception_throw(v97);
              }
            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v132, v148, 16);
          }
          while (v52);
        }
      }
      else
      {
        if (objc_msgSend(*(id *)(v5 + 176), "count"))
        {
          v102 = a3;
          v56 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E1EE23F0);
          v57 = -[_NSSQLTableMigrationDescription _sourceRootEntity](v5);
          v58 = objc_msgSend(v57, "tableName");
          v128 = 0u;
          v129 = 0u;
          v130 = 0u;
          v131 = 0u;
          obja = *(id *)(v5 + 176);
          v59 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v128, v147, 16);
          if (v59)
          {
            v60 = v59;
            v61 = *(_QWORD *)v129;
            do
            {
              for (j = 0; j != v60; ++j)
              {
                if (*(_QWORD *)v129 != v61)
                  objc_enumerationMutation(obja);
                v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ALTER TABLE %@ RENAME COLUMN %@ TO _DEFERRED_%@__%@"), v58, objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * j), "firstObject"), "columnName"), v56, objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * j), "firstObject"), "columnName"));
                v64 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v57, v63);

                objc_msgSend(a2, "addObject:", v64);
              }
              v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v128, v147, 16);
            }
            while (v60);
          }
          v5 = v99;
          if (v102)
            *(_BYTE *)(v102 + 217) = 1;
        }
        v65 = *(void **)(v5 + 120);
        if (v65)
        {
          if (objc_msgSend(v65, "count"))
          {
            v126 = 0u;
            v127 = 0u;
            v124 = 0u;
            v125 = 0u;
            v66 = *(void **)(v5 + 120);
            v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v124, v146, 16);
            if (v67)
            {
              v68 = v67;
              v69 = *(_QWORD *)v125;
              do
              {
                for (k = 0; k != v68; ++k)
                {
                  if (*(_QWORD *)v125 != v69)
                    objc_enumerationMutation(v66);
                  v71 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](v103, objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * k), "objectAtIndexedSubscript:", 0), "tableName"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * k), "objectAtIndexedSubscript:", 1), "tableName"));
                  objc_msgSend(a2, "addObject:", v71);

                }
                v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v124, v146, 16);
              }
              while (v68);
            }
          }
        }
        v72 = *(void **)(v5 + 128);
        if (v72)
        {
          if (objc_msgSend(v72, "count"))
          {
            v73 = (void *)objc_msgSend((id)v99, "rootEntity");
            v74 = objc_msgSend(v73, "tableName");
            v75 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v99 + 128), "sortedArrayUsingDescriptors:", MEMORY[0x1E0C9AA60]), "sortedArrayUsingComparator:", &__block_literal_global_19);
            v120 = 0u;
            v121 = 0u;
            v122 = 0u;
            v123 = 0u;
            objb = v75;
            v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v120, v145, 16);
            if (v76)
            {
              v77 = v76;
              v78 = *(_QWORD *)v121;
              do
              {
                for (m = 0; m != v77; ++m)
                {
                  if (*(_QWORD *)v121 != v78)
                    objc_enumerationMutation(objb);
                  v80 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * m);
                  v81 = (void *)objc_msgSend(v80, "firstObject");
                  v82 = (void *)objc_msgSend(v80, "lastObject");
                  if (objc_msgSend(v81, "propertyType") == 3)
                  {
                    v83 = -[NSSQLiteAdapter newDropIndexStatementForColumn:](v103, v81);
                    objc_msgSend(a2, "addObject:", v83);

                  }
                  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ALTER TABLE %@ RENAME COLUMN %@ TO %@"), v74, objc_msgSend(v81, "columnName"), objc_msgSend(v82, "columnName"));
                  v85 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v73, v84);

                  objc_msgSend(a2, "addObject:", v85);
                }
                v77 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v120, v145, 16);
              }
              while (v77);
            }
          }
        }
        v5 = v99;
        v86 = *(void **)(v99 + 112);
        if (v86)
        {
          if (objc_msgSend(v86, "count"))
          {
            v87 = (void *)objc_msgSend((id)v99, "rootEntity");
            v88 = objc_msgSend(v87, "tableName");
            v116 = 0u;
            v117 = 0u;
            v118 = 0u;
            v119 = 0u;
            objc = *(id *)(v99 + 112);
            v89 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v116, v144, 16);
            if (v89)
            {
              v90 = v89;
              v91 = *(_QWORD *)v117;
              do
              {
                for (n = 0; n != v90; ++n)
                {
                  if (*(_QWORD *)v117 != v91)
                    objc_enumerationMutation(objc);
                  v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ALTER TABLE %@ ADD COLUMN %@ %@"), v88, objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * n), "columnName"), NSSQLiteAdapter_typeStringForSQLType(objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1)+ 8 * n), "sqlType")));
                  v94 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v87, v93);

                  objc_msgSend(a2, "addObject:", v94);
                }
                v90 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v116, v144, 16);
                v5 = v99;
              }
              while (v90);
            }
          }
        }
      }
    }
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v7 = (void *)-[_NSSQLTableMigrationDescription _transformedManyToManys](v5);
    result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v112, v143, 16);
    if (result)
    {
      v8 = result;
      v9 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
      v10 = *(_QWORD *)v113;
      v101 = *(_QWORD *)v113;
      v98 = v7;
      do
      {
        v11 = 0;
        v100 = v8;
        do
        {
          if (*(_QWORD *)v113 != v10)
            objc_enumerationMutation(v7);
          v12 = *(__CFString **)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)v11);
          if (v12 && *(void **)((char *)&v12->isa + v9[590]))
          {
            obj = v11;
            v13 = (_BYTE *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](objc_msgSend((id)objc_msgSend(*(id *)(v5 + 64), "objectForKey:", objc_msgSend((id)-[__CFString entity](v12, "entity"), "name")), "sourceEntity"), objc_msgSend((id)-[__CFString propertyDescription](v12, "propertyDescription"), "renamingIdentifier"));
            v14 = v13;
            if (v13)
            {
              if (v13[24] == 9)
              {
                v15 = objc_msgSend((id)-[__CFString propertyDescription](v12, "propertyDescription"), "isOrdered");
                if (v15 == objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "isOrdered"))
                {
                  v16 = 0;
                }
                else if (objc_msgSend((id)-[__CFString propertyDescription](v12, "propertyDescription"), "isOrdered"))
                {
                  v16 = objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "isOrdered");
                }
                else
                {
                  v16 = 1;
                }
                length = (void *)v12[1].length;
                if (length)
                {
                  v18 = objc_msgSend((id)objc_msgSend(length, "propertyDescription"), "isOrdered");
                  v19 = v18;
                  v20 = (void *)*((_QWORD *)v14 + 7);
                  if (v20)
                    goto LABEL_24;
                  if ((v18 & 1) == 0)
                  {
LABEL_34:
                    LODWORD(length) = 0;
                    goto LABEL_35;
                  }
LABEL_25:
                  v21 = (void *)v12[1].length;
                  if (v21 && objc_msgSend((id)objc_msgSend(v21, "propertyDescription"), "isOrdered"))
                  {
                    length = (void *)*((_QWORD *)v14 + 7);
                    if (length)
                      LODWORD(length) = objc_msgSend((id)objc_msgSend(length, "propertyDescription"), "isOrdered");
                    goto LABEL_35;
                  }
                  goto LABEL_36;
                }
                v19 = 0;
                v20 = (void *)*((_QWORD *)v14 + 7);
                if (v20)
                {
LABEL_24:
                  if (v19 == objc_msgSend((id)objc_msgSend(v20, "propertyDescription"), "isOrdered"))
                    goto LABEL_34;
                  goto LABEL_25;
                }
LABEL_35:
                if (((v16 | length) & 1) != 0)
                {
LABEL_36:
                  v22 = -[_NSSQLTableMigrationDescription _tempNameForTableName:](v5, objc_msgSend(v14, "correlationTableName"));
                  v23 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](v103, objc_msgSend(v14, "correlationTableName"), (uint64_t)v22);
                  objc_msgSend(a2, "addObject:", v23);

                }
                else
                {
                  if ((objc_msgSend((id)objc_msgSend(v14, "correlationTableName"), "isEqualToString:", -[__CFString correlationTableName](v12, "correlationTableName")) & 1) == 0)
                  {
                    v24 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](v103, objc_msgSend(v14, "correlationTableName"), -[__CFString correlationTableName](v12, "correlationTableName"));
                    objc_msgSend(a2, "addObject:", v24);

                  }
                  v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "renamingIdentifier"), "isEqualToString:", objc_msgSend((id)-[__CFString propertyDescription](v12, "propertyDescription"), "renamingIdentifier"));
                  v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
                  v142[0] = -[__CFString columnName](v12, "columnName");
                  if ((v25 & 1) != 0)
                    v27 = (const __CFString *)objc_msgSend(v14, "columnName");
                  else
                    v27 = -[NSSQLManyToMany inverseColumnName]((const __CFString *)v14);
                  v142[1] = v27;
                  objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 2));
                  v141[0] = -[NSSQLManyToMany inverseColumnName](v12);
                  if ((v25 & 1) != 0)
                    v28 = -[NSSQLManyToMany inverseColumnName]((const __CFString *)v14);
                  else
                    v28 = (const __CFString *)objc_msgSend(v14, "columnName");
                  v141[1] = v28;
                  objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 2));
                  if (v12[2].data)
                  {
                    if (*((_QWORD *)v14 + 10))
                    {
                      v140[0] = v12[2].data;
                      if ((v25 & 1) != 0)
                      {
                        v29 = (__CFString *)*((_QWORD *)v14 + 10);
                        if (!v29)
                          v29 = (__CFString *)objc_msgSend(v14, "columnName");
                      }
                      else
                      {
                        v29 = -[NSSQLManyToMany inverseOrderColumnName]((__CFString *)v14);
                        if (!v29)
                          v29 = (__CFString *)-[NSSQLManyToMany inverseColumnName]((const __CFString *)v14);
                      }
                      v140[1] = v29;
                      v30 = v140;
                    }
                    else
                    {
                      v139[0] = v12[2].data;
                      v139[1] = &stru_1E1EE23F0;
                      v30 = v139;
                    }
                    objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2));
                  }
                  v31 = -[NSSQLManyToMany inverseOrderColumnName](v12);
                  if (v31)
                  {
                    v32 = v31;
                    if (-[NSSQLManyToMany inverseOrderColumnName]((__CFString *)v14))
                    {
                      v138[0] = v32;
                      if ((v25 & 1) != 0)
                      {
                        v33 = -[NSSQLManyToMany inverseOrderColumnName]((__CFString *)v14);
                        if (!v33)
                          v33 = (__CFString *)-[NSSQLManyToMany inverseColumnName]((const __CFString *)v14);
                      }
                      else
                      {
                        v33 = (__CFString *)*((_QWORD *)v14 + 10);
                        if (!v33)
                          v33 = (__CFString *)objc_msgSend(v14, "columnName");
                      }
                      v138[1] = v33;
                      v34 = v138;
                    }
                    else
                    {
                      v137[0] = v32;
                      v137[1] = &stru_1E1EE23F0;
                      v34 = v137;
                    }
                    objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2));
                  }
                  v35 = (void *)objc_msgSend(v26, "sortedArrayUsingComparator:", &__block_literal_global_47);
                  v108 = 0u;
                  v109 = 0u;
                  v110 = 0u;
                  v111 = 0u;
                  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v108, v136, 16);
                  if (v36)
                  {
                    v37 = v36;
                    v38 = *(_QWORD *)v109;
                    do
                    {
                      for (ii = 0; ii != v37; ++ii)
                      {
                        if (*(_QWORD *)v109 != v38)
                          objc_enumerationMutation(v35);
                        v40 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * ii);
                        if ((objc_msgSend((id)objc_msgSend(v40, "lastObject"), "isEqualToString:", objc_msgSend(v40, "firstObject")) & 1) == 0)
                        {
                          v41 = objc_msgSend((id)objc_msgSend(v40, "lastObject"), "length");
                          v42 = objc_alloc(MEMORY[0x1E0CB3940]);
                          v43 = -[__CFString correlationTableName](v12, "correlationTableName");
                          if (v41)
                            v44 = objc_msgSend(v42, "initWithFormat:", CFSTR("ALTER TABLE %@ RENAME COLUMN %@ TO %@"), v43, objc_msgSend(v40, "lastObject"), objc_msgSend(v40, "firstObject"));
                          else
                            v44 = objc_msgSend(v42, "initWithFormat:", CFSTR("ALTER TABLE %@ ADD COLUMN %@ %@"), v43, objc_msgSend(v40, "firstObject"), CFSTR("INTEGER"));
                          v45 = (void *)v44;
                          v46 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v44);

                          objc_msgSend(a2, "addObject:", v46);
                        }
                      }
                      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v108, v136, 16);
                    }
                    while (v37);
                  }
                  v5 = v99;
                  objc_msgSend(*(id *)(v99 + 136), "addObject:", v12);
                  v7 = v98;
                  v8 = v100;
                  v9 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
                }
                v10 = v101;
                v11 = obj;
                goto LABEL_79;
              }
              if ((objc_msgSend(v13, "isToMany") & 1) == 0 && v14[24] != 7)
LABEL_133:
                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unrecognized source property type for many-to-many migration"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v14, CFSTR("sourceRelationship"))));
            }
            else if ((objc_msgSend(0, "isToMany") & 1) == 0)
            {
              goto LABEL_133;
            }
          }
LABEL_79:
          v11 = (char *)v11 + 1;
        }
        while (v11 != (id)v8);
        result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v112, v143, 16);
        v8 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_transformedManyToManys
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 24) < 2u)
    return 0;
  if (!*(_QWORD *)(a1 + 88))
  {
    *(_QWORD *)(a1 + 88) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = *(void **)(a1 + 48);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(a1 + 88), "addObjectsFromArray:", -[_NSSQLEntityMigrationDescription transformedManyToManys](*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i)));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v5);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = *(void **)(a1 + 56);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(a1 + 88), "addObjectsFromArray:", -[_NSSQLEntityMigrationDescription transformedManyToManys](*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * j)));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }
  }
  return *(_QWORD *)(a1 + 88);
}

- (uint64_t)appendStatementsToCreateOrDropTables:(uint64_t)a3 migrationContext:
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSSQLiteStatement *v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  _QWORD *v25;
  NSSQLiteStatement *v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  NSSQLiteStatement *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t n;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t jj;
  __CFString *v52;
  NSSQLiteStatement *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __CFString *v58;
  NSSQLiteStatement *v59;
  void *v61;
  id obj;
  id obja;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
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
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = a3;
    v4 = a2;
    v5 = result;
    if (a3)
      v6 = *(NSSQLiteStatement **)(a3 + 32);
    else
      v6 = 0;
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    if (*(_DWORD *)(result + 24))
    {
      if (!*(_QWORD *)(result + 80))
      {
        *(_QWORD *)(result + 80) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        obj = *(id *)(v5 + 40);
        v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
        if (v67)
        {
          v65 = *(_QWORD *)v90;
          do
          {
            for (i = 0; i != v67; ++i)
            {
              if (*(_QWORD *)v90 != v65)
                objc_enumerationMutation(obj);
              v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "sourceEntity");
              v85 = 0u;
              v86 = 0u;
              v87 = 0u;
              v88 = 0u;
              v9 = (void *)objc_msgSend(v8, "manyToManyRelationships");
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
              if (v10)
              {
                v11 = v10;
                v12 = *(_QWORD *)v86;
                do
                {
                  for (j = 0; j != v11; ++j)
                  {
                    if (*(_QWORD *)v86 != v12)
                      objc_enumerationMutation(v9);
                    v14 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j);
                    if (v14
                      && *(_QWORD *)(v14 + 64)
                      && (void *)objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * j), "entity") == v8)
                    {
                      objc_msgSend(*(id *)(v5 + 80), "addObject:", v14);
                    }
                  }
                  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
                }
                while (v11);
              }
            }
            v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
          }
          while (v67);
        }
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v15 = *(void **)(v5 + 56);
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
        v4 = a2;
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v82;
          do
          {
            for (k = 0; k != v17; ++k)
            {
              if (*(_QWORD *)v82 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(v5 + 80), "addObjectsFromArray:", -[_NSSQLEntityMigrationDescription removedManyToManys](*(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * k)));
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
          }
          while (v17);
        }
      }
      v20 = *(void **)(v5 + 80);
      v3 = a3;
    }
    else
    {
      v20 = 0;
    }
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v78;
      do
      {
        for (m = 0; m != v22; ++m)
        {
          if (*(_QWORD *)v78 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD **)(*((_QWORD *)&v77 + 1) + 8 * m);
          if (v25 && v25[8])
          {
            v26 = -[NSSQLiteAdapter newDropTableStatementOrFailForTableNamed:](v6, objc_msgSend(v25, "correlationTableName"));
            objc_msgSend(v4, "addObject:", v26);

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
      }
      while (v22);
    }
    v27 = *(void **)(v5 + 104);
    if (!v27)
    {
      -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)v5, v3);
      v27 = *(void **)(v5 + 104);
    }
    v28 = objc_msgSend(v27, "BOOLValue");
    v29 = *(_DWORD *)(v5 + 24);
    if (v29 == 1)
      v30 = 0;
    else
      v30 = v28;
    if (!v29 || v30)
    {
      v31 = -[NSSQLiteAdapter newCreateTableStatementForEntity:]((const __CFString *)v6, *(_QWORD **)(v5 + 8));
      objc_msgSend(v4, "addObject:", v31);

      v29 = *(_DWORD *)(v5 + 24);
    }
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    if (v29 == 1)
    {
      v32 = 0;
    }
    else
    {
      if (!*(_QWORD *)(v5 + 72))
      {
        v61 = v4;
        *(_QWORD *)(v5 + 72) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        obja = *(id *)(v5 + 32);
        v68 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
        if (v68)
        {
          v66 = *(_QWORD *)v90;
          do
          {
            v33 = 0;
            do
            {
              if (*(_QWORD *)v90 != v66)
                objc_enumerationMutation(obja);
              v34 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v33);
              if (v34)
                v35 = *(void **)(v34 + 32);
              else
                v35 = 0;
              v87 = 0u;
              v88 = 0u;
              v85 = 0u;
              v86 = 0u;
              v36 = (void *)objc_msgSend(v35, "manyToManyRelationships");
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
              if (v37)
              {
                v38 = v37;
                v39 = *(_QWORD *)v86;
                do
                {
                  for (n = 0; n != v38; ++n)
                  {
                    if (*(_QWORD *)v86 != v39)
                      objc_enumerationMutation(v36);
                    v41 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * n);
                    if (v41
                      && *(_QWORD *)(v41 + 64)
                      && (void *)objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * n), "entity") == v35)
                    {
                      objc_msgSend(*(id *)(v5 + 72), "addObject:", v41);
                    }
                  }
                  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
                }
                while (v38);
              }
              ++v33;
            }
            while (v33 != v68);
            v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
            v68 = v42;
          }
          while (v42);
        }
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v43 = *(void **)(v5 + 56);
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
        v4 = v61;
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v82;
          do
          {
            for (ii = 0; ii != v45; ++ii)
            {
              if (*(_QWORD *)v82 != v46)
                objc_enumerationMutation(v43);
              objc_msgSend(*(id *)(v5 + 72), "addObjectsFromArray:", -[_NSSQLEntityMigrationDescription addedManyToManys](*(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * ii)));
            }
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
          }
          while (v45);
        }
      }
      v32 = *(void **)(v5 + 72);
    }
    v48 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v74;
      do
      {
        for (jj = 0; jj != v49; ++jj)
        {
          if (*(_QWORD *)v74 != v50)
            objc_enumerationMutation(v32);
          v52 = *(__CFString **)(*((_QWORD *)&v73 + 1) + 8 * jj);
          if (v52 && v52[2].isa)
          {
            v53 = -[NSSQLiteAdapter newCreateTableStatementForManyToMany:](v6, v52);
            objc_msgSend(v4, "addObject:", v53);

          }
        }
        v49 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
      }
      while (v49);
    }
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v54 = (void *)-[_NSSQLTableMigrationDescription _transformedManyToManys](v5);
    result = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v69, v93, 16);
    if (result)
    {
      v55 = result;
      v56 = *(_QWORD *)v70;
      do
      {
        v57 = 0;
        do
        {
          if (*(_QWORD *)v70 != v56)
            objc_enumerationMutation(v54);
          v58 = *(__CFString **)(*((_QWORD *)&v69 + 1) + 8 * v57);
          if (v58
            && v58[2].isa
            && (objc_msgSend(*(id *)(v5 + 136), "containsObject:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v57)) & 1) == 0)
          {
            v59 = -[NSSQLiteAdapter newCreateTableStatementForManyToMany:](v6, v58);
            objc_msgSend(v4, "addObject:", v59);

          }
          ++v57;
        }
        while (v55 != v57);
        result = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v69, v93, 16);
        v55 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)appendStatementsToPerformMigration:(uint64_t)a3 migrationContext:
{
  int v3;
  NSSQLiteStatement *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  NSSQLiteStatement *sqlString;
  NSSQLiteStatement *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  _QWORD *v23;
  NSSQLiteStatement *v24;
  id v25;
  NSSQLiteStatement *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  NSSQLiteStatement *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  uint64_t v42;
  id v43;
  NSSQLiteStatement *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  void *v52;
  int v53;
  NSSQLiteStatement *v54;
  NSSQLiteStatement *v55;
  _QWORD *length;
  uint64_t v57;
  void *v58;
  void *v59;
  NSSQLiteStatement *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id obj;
  id v67;
  NSSQLiteStatement *v69;
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
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v3 = *(_DWORD *)(a1 + 24);
  if (!v3)
    return;
  v4 = (NSSQLiteStatement *)a3;
  if (v3 == 1)
  {
    if (a3)
      v4 = *(NSSQLiteStatement **)(a3 + 32);
    v69 = -[NSSQLiteAdapter newDropTableStatementOrFailForTableNamed:](v4, objc_msgSend(*(id *)(a1 + 8), "tableName"));
    objc_msgSend(a2, "addObject:");

    return;
  }
  v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v64 = v5;
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    obj = *(id *)(a1 + 40);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("DELETE FROM "));
    objc_msgSend(v7, "appendString:", objc_msgSend(*(id *)(a1 + 8), "tableName"));
    objc_msgSend(v7, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v7, "appendString:", CFSTR("Z_ENT"));
    objc_msgSend(v7, "appendString:", CFSTR(" IN ("));
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v91;
      v10 = 1;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v91 != v9)
            objc_enumerationMutation(obj);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v11), "sourceEntity");
          if (v12)
            v13 = *(unsigned int *)(v12 + 184);
          else
            v13 = 0;
          if ((v10 & 1) != 0)
            v14 = CFSTR("%d");
          else
            v14 = CFSTR(",%d");
          objc_msgSend(v7, "appendFormat:", v14, v13);
          v10 = 0;
          ++v11;
        }
        while (v8 != v11);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
        v8 = v15;
        v10 = 0;
      }
      while (v15);
    }
    v5 = v64;
    objc_msgSend(v7, "appendString:", CFSTR(")"));
    if (v4)
      sqlString = (NSSQLiteStatement *)v4->_sqlString;
    else
      sqlString = 0;
    v17 = -[NSSQLiteAdapter newStatementWithSQLString:](sqlString, (uint64_t)v7);

    objc_msgSend(v67, "addObject:", v17);
  }
  v18 = *(void **)(a1 + 104);
  if (!v18)
  {
    -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)a1, (uint64_t)v4);
    v18 = *(void **)(a1 + 104);
  }
  if (objc_msgSend(v18, "BOOLValue"))
  {
    if (objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v19 = *(void **)(a1 + 56);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v87;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v87 != v21)
              objc_enumerationMutation(v19);
            v23 = *(_QWORD **)(*((_QWORD *)&v86 + 1) + 8 * i);
            v24 = -[_NSSQLTableMigrationDescription createInsertStatementForEntityMigration:migrationContext:](a1, v23, (uint64_t)v4);
            objc_msgSend(v67, "addObject:", v24);

            v25 = -[_NSSQLTableMigrationDescription createFEKUpdateStatementsForEntityMigration:migrationContext:]((uint64_t)v23, (uint64_t)v4);
            if (v25)
            {
              objc_msgSend(v5, "addObjectsFromArray:", v25);

            }
            while (1)
            {
              v26 = -[_NSSQLTableMigrationDescription createUpdateStatementForEntityMigration:migrationContext:]((uint64_t)v23, (uint64_t)v4);
              if (!v26)
                break;
              objc_msgSend(v6, "addObject:", v26);

            }
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
        }
        while (v20);
      }
    }
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v27 = *(void **)(a1 + 48);
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v83;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v83 != v29)
            objc_enumerationMutation(v27);
          v31 = -[_NSSQLTableMigrationDescription createInsertStatementForEntityMigration:migrationContext:](a1, *(_QWORD **)(*((_QWORD *)&v82 + 1) + 8 * j), (uint64_t)v4);
          objc_msgSend(v67, "addObject:", v31);

        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
        v5 = v64;
      }
      while (v28);
    }
  }
  else
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v32 = *(void **)(a1 + 48);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v79;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v79 != v34)
            objc_enumerationMutation(v32);
          v36 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * k);
          if (v36 && !*(_QWORD *)(v36 + 16))
            -[_NSSQLEntityMigrationDescription _generateSQLValueMappingsWithMigrationContext:](*(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * k), (uint64_t)v4);
          v37 = -[_NSSQLTableMigrationDescription createFEKUpdateStatementsForEntityMigration:migrationContext:](v36, (uint64_t)v4);
          if (v37)
          {
            objc_msgSend(v64, "addObjectsFromArray:", v37);

          }
        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
      }
      while (v33);
    }
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v38 = *(void **)(a1 + 56);
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
    v5 = v64;
    if (v39)
    {
      v40 = *(_QWORD *)v75;
      do
      {
        for (m = 0; m != v39; ++m)
        {
          if (*(_QWORD *)v75 != v40)
            objc_enumerationMutation(v38);
          v42 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * m);
          if (v42 && !*(_QWORD *)(v42 + 16))
            -[_NSSQLEntityMigrationDescription _generateSQLValueMappingsWithMigrationContext:](*(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * m), (uint64_t)v4);
          v43 = -[_NSSQLTableMigrationDescription createFEKUpdateStatementsForEntityMigration:migrationContext:](v42, (uint64_t)v4);
          if (v43)
          {
            objc_msgSend(v64, "addObjectsFromArray:", v43);

          }
          while (1)
          {
            v44 = -[_NSSQLTableMigrationDescription createUpdateStatementForEntityMigration:migrationContext:](v42, (uint64_t)v4);
            if (!v44)
              break;
            objc_msgSend(v6, "addObject:", v44);

          }
        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
      }
      while (v39);
    }
  }
  objc_msgSend(a2, "addObjectsFromArray:", v67);
  objc_msgSend(a2, "addObjectsFromArray:", v5);
  objc_msgSend(a2, "addObjectsFromArray:", v6);

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v45 = (void *)-[_NSSQLTableMigrationDescription _transformedManyToManys](a1);
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v71;
    do
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v71 != v47)
          objc_enumerationMutation(v45);
        v49 = *(__CFString **)(*((_QWORD *)&v70 + 1) + 8 * v48);
        if (v49 && v49[2].isa)
        {
          v50 = (__CFString *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v48), "entity"), "name")), "sourceEntity"), objc_msgSend((id)-[__CFString propertyDescription](v49, "propertyDescription"), "renamingIdentifier"));
          v51 = v50;
          if (v50)
          {
            if (LOBYTE(v50->length) == 9)
            {
              if ((objc_msgSend(*(id *)(a1 + 136), "containsObject:", v49) & 1) != 0)
                goto LABEL_93;
              v52 = -[_NSSQLTableMigrationDescription _tempNameForTableName:](a1, -[__CFString correlationTableName](v51, "correlationTableName"));
              v53 = objc_msgSend((id)objc_msgSend((id)-[__CFString propertyDescription](v51, "propertyDescription"), "renamingIdentifier"), "isEqualToString:", objc_msgSend((id)-[__CFString propertyDescription](v49, "propertyDescription"), "renamingIdentifier"));
              if (v4)
                v54 = (NSSQLiteStatement *)v4->_sqlString;
              else
                v54 = 0;
              v55 = -[NSSQLiteAdapter newCopyAndInsertStatementForManyToMany:toManyToMany:intermediateTableName:invertColumns:](v54, v51, v49, (uint64_t)v52, v53 ^ 1u);
              goto LABEL_92;
            }
            if (-[__CFString isToMany](v50, "isToMany"))
            {
              length = (_QWORD *)v51[1].length;
              goto LABEL_89;
            }
            if (LOBYTE(v51->length) != 7)
              goto LABEL_100;
            v59 = -[_NSSQLTableMigrationDescription _sourceRootTableNameInMigrationContext:](a1, (uint64_t)v4);
            v55 = -[_NSSQLTableMigrationDescription newCopyAndInsertStatementForToOne:toManyToMany:fromTableName:invertColumns:migrationContext:](v51, v49, (uint64_t)v59, 0, (uint64_t)v4);
          }
          else
          {
            if ((objc_msgSend(0, "isToMany") & 1) == 0)
            {
LABEL_100:
              v62 = (void *)MEMORY[0x1E0C99DA0];
              v63 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v51, CFSTR("sourceRelationship"));
              objc_exception_throw((id)objc_msgSend(v62, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unrecognized source property type for many-to-many migration"), v63));
            }
            length = 0;
LABEL_89:
            v57 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:]((uint64_t)v4, (void *)objc_msgSend(length, "entity"));
            v58 = -[_NSSQLTableMigrationDescription _sourceRootTableNameInMigrationContext:](v57, (uint64_t)v4);
            v55 = -[_NSSQLTableMigrationDescription newCopyAndInsertStatementForToOne:toManyToMany:fromTableName:invertColumns:migrationContext:](length, v49, (uint64_t)v58, 1, (uint64_t)v4);
          }
LABEL_92:
          v60 = v55;
          objc_msgSend(a2, "addObject:", v55);

        }
LABEL_93:
        ++v48;
      }
      while (v46 != v48);
      v61 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
      v46 = v61;
    }
    while (v61);
  }
}

- (NSSQLiteStatement)createInsertStatementForEntityMigration:(uint64_t)a3 migrationContext:
{
  id v6;
  id v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  int v18;
  int *v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  NSSQLBindVariable *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _DWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _DWORD *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  NSSQLiteStatement *v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  unsigned int *v53;
  int v54;
  int v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  NSSQLiteStatement *v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a2)
    v8 = (_DWORD *)a2[4];
  else
    v8 = 0;
  v9 = objc_msgSend(a2, "sourceEntity");
  v10 = *(_QWORD *)(a1 + 8);
  v63 = a1;
  v64 = a3;
  v65 = (uint64_t)a2;
  if (v10)
  {
    while (v10)
    {
      v11 = v10;
      v10 = *(_QWORD *)(v10 + 168);
      if (v10 == v11)
      {
        v12 = *(void **)(v11 + 72);
        goto LABEL_7;
      }
    }
  }
  v12 = 0;
LABEL_7:
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v13 = (void *)objc_msgSend(v12, "sortedArrayUsingFunction:context:", sortColumnsByType, 0);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (!v14)
    goto LABEL_42;
  v15 = *(_QWORD *)v73;
  while (2)
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v73 != v15)
        objc_enumerationMutation(v13);
      v17 = *(unsigned __int8 **)(*((_QWORD *)&v72 + 1) + 8 * v16);
      if (!v17)
      {
LABEL_18:
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * v16), "entity");
        if (v8)
        {
          v21 = v8[46];
          if (v20)
          {
            if (v21 < *(_DWORD *)(v20 + 184))
              goto LABEL_23;
            v22 = *(_DWORD *)(v20 + 188);
          }
          else
          {
            v22 = 0;
          }
          if (v21 <= v22)
          {
            v26 = objc_msgSend(v17, "columnName");
            if (!v65)
              goto LABEL_41;
            v27 = v26;
            v28 = *(void **)(v65 + 16);
            if (!v28)
            {
              -[_NSSQLEntityMigrationDescription _generateSQLValueMappingsWithMigrationContext:](v65, v64);
              v28 = *(void **)(v65 + 16);
            }
            v24 = (const __CFString *)objc_msgSend(v28, "objectForKey:", v27);
            if (!v24)
            {
LABEL_41:
              v30 = (void *)MEMORY[0x1E0C99DA0];
              v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v8, CFSTR("entity"), objc_msgSend(v17, "columnName"), CFSTR("column"), 0);
              v32 = (void *)objc_msgSend(v30, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unrecognized column in entity"), v31);
              if (v32)
                goto LABEL_51;
              goto LABEL_42;
            }
            objc_msgSend(v6, "addObject:", objc_msgSend(v17, "columnName"));
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v67, "addObject:", v24);
              v24 = CFSTR("?");
            }
            goto LABEL_24;
          }
        }
LABEL_23:
        objc_msgSend(v6, "addObject:", objc_msgSend(v17, "columnName"));
        v23 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", 0, objc_msgSend(v17, "sqlType"), 0);
        objc_msgSend(v67, "addObject:", v23);

        v24 = CFSTR("?");
LABEL_24:
        objc_msgSend(v7, "addObject:", v24);
        goto LABEL_28;
      }
      v18 = v17[24];
      switch(v18)
      {
        case 6:
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * v16), "columnName"));
          v19 = &OBJC_IVAR___NSSQLEntity__optLockKey;
          if (!v9)
            goto LABEL_31;
          break;
        case 5:
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * v16), "columnName"));
          v19 = &OBJC_IVAR___NSSQLEntity__entityKey;
          if (!v9)
            goto LABEL_31;
          break;
        case 2:
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * v16), "columnName"));
          v19 = &OBJC_IVAR___NSSQLEntity__primaryKey;
          if (!v9)
          {
LABEL_31:
            v25 = 0;
            goto LABEL_27;
          }
          break;
        default:
          goto LABEL_18;
      }
      v25 = *(void **)(v9 + *v19);
LABEL_27:
      objc_msgSend(v7, "addObject:", objc_msgSend(v25, "columnName"));
LABEL_28:
      ++v16;
    }
    while (v14 != v16);
    v29 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    v14 = v29;
    if (v29)
      continue;
    break;
  }
LABEL_42:
  v33 = v8;
  v35 = v63;
  v34 = v64;
  while (v33)
  {
    v36 = v33;
    v33 = (_DWORD *)*((_QWORD *)v33 + 21);
    if (v33 == v36)
    {
      v37 = (void *)*((_QWORD *)v36 + 9);
      goto LABEL_46;
    }
  }
  v37 = 0;
LABEL_46:
  v38 = objc_msgSend(v37, "count");
  if (v38 == objc_msgSend(v6, "count"))
  {
    v39 = objc_msgSend(v6, "count");
    if (v39 != objc_msgSend(v7, "count"))
    {
      v40 = (void *)MEMORY[0x1E0C99DA0];
      v41 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v8, CFSTR("entity"));
      v42 = *MEMORY[0x1E0C99768];
      v43 = CFSTR("Mismatched columns and values in migration insert statement");
      goto LABEL_50;
    }
    goto LABEL_52;
  }
  v40 = (void *)MEMORY[0x1E0C99DA0];
  v41 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v8, CFSTR("entity"));
  v42 = *MEMORY[0x1E0C99768];
  v43 = CFSTR("Wrong number of columns in migration insert statement");
LABEL_50:
  v32 = (void *)objc_msgSend(v40, "exceptionWithName:reason:userInfo:", v42, v43, v41);
  if (v32)
  {
LABEL_51:
    v44 = 0;
  }
  else
  {
LABEL_52:
    v62 = objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v66 = -[_NSSQLTableMigrationDescription _sourceRootTableNameInMigrationContext:](v63, v64);
    v45 = 0x1E0CB3000uLL;
    if (v9 && (*(_QWORD *)(v9 + 160) || (v56 = *(void **)(v9 + 152)) != 0 && objc_msgSend(v56, "count")))
    {
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" WHERE "));
      objc_msgSend(v46, "appendString:", v66);
      objc_msgSend(v46, "appendString:", CFSTR("."));
      objc_msgSend(v46, "appendString:", CFSTR("Z_ENT"));
      objc_msgSend(v46, "appendString:", CFSTR(" = "));
      v47 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "entityDescription"), "userInfo"), "objectForKey:", CFSTR("NSEntityRenamingShouldRebaseKey"));
      if (!v47)
        goto LABEL_70;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v48 = *(void **)(v9 + 152);
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      if (!v49)
        goto LABEL_70;
      v50 = 0;
      v51 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v69 != v51)
            objc_enumerationMutation(v48);
          if (!(_DWORD)v50)
          {
            v53 = *(unsigned int **)(*((_QWORD *)&v68 + 1) + 8 * i);
            v54 = objc_msgSend((id)objc_msgSend(v53, "name"), "isEqualToString:", v47);
            if (v53)
              v55 = v54;
            else
              v55 = 0;
            if (v55 == 1)
              v50 = v53[46];
            else
              v50 = 0;
          }
        }
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      }
      while (v49);
      v45 = 0x1E0CB3000;
      if (!(_DWORD)v50)
LABEL_70:
        v50 = *(unsigned int *)(v9 + 184);
      objc_msgSend(v46, "appendFormat:", CFSTR("%d"), v50);
      v35 = v63;
      v34 = v64;
    }
    else
    {
      v46 = 0;
    }
    v57 = objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
    v58 = v66;
    v59 = (void *)objc_msgSend(objc_alloc(*(Class *)(v45 + 1952)), "initWithString:", CFSTR("INSERT INTO "));
    objc_msgSend(v59, "appendString:", objc_msgSend(*(id *)(v35 + 8), "tableName"));
    objc_msgSend(v59, "appendString:", CFSTR(" ("));
    objc_msgSend(v59, "appendString:", v62);
    objc_msgSend(v59, "appendString:", CFSTR(") SELECT "));
    objc_msgSend(v59, "appendString:", v57);
    objc_msgSend(v59, "appendString:", CFSTR(" FROM "));
    objc_msgSend(v59, "appendString:", v58);
    if (v46)
    {
      objc_msgSend(v59, "appendString:", v46);

    }
    if (v34)
      v60 = *(NSSQLiteStatement **)(v34 + 32);
    else
      v60 = 0;
    v44 = -[NSSQLiteAdapter newStatementWithSQLString:](v60, (uint64_t)v59);
    -[NSSQLiteAdapter _useModel:]((uint64_t)v44, v67);

    v32 = 0;
  }

  if (v32)
  {

    objc_exception_throw(v32);
  }
  return v44;
}

- (id)createFEKUpdateStatementsForEntityMigration:(uint64_t)a1 migrationContext:(uint64_t)a2
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSSQLiteStatement *v21;
  NSSQLiteStatement *v22;
  uint64_t v23;
  uint64_t v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
    v4 = *(void **)(a1 + 24);
  else
    v4 = 0;
  if (!objc_msgSend(v4, "count"))
    return 0;
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a1)
  {
    v5 = *(_QWORD **)(a1 + 32);
    if (v5)
    {
      v26 = (void *)v5[5];
      goto LABEL_7;
    }
  }
  else
  {
    v5 = 0;
  }
  v26 = 0;
LABEL_7:
  v6 = objc_msgSend(v5, "tableName");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v25 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9);
        v11 = (void *)objc_msgSend(v4, "objectForKey:", v10);
        v12 = (_QWORD *)objc_msgSend(v26, "objectForKey:", v10);
        v13 = (void *)objc_msgSend(v12, "foreignKey");
        if (v12)
          v14 = (void *)v12[9];
        else
          v14 = 0;
        v15 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a2, v11);
        if (!v15)
          goto LABEL_19;
        v16 = v15;
        v17 = *(void **)(v15 + 104);
        if (!v17)
        {
          -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)v16, a2);
          v17 = *(void **)(v16 + 104);
        }
        if (objc_msgSend(v17, "BOOLValue"))
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("_T_%@"), objc_msgSend(v11, "tableName"));
        else
LABEL_19:
          v18 = (id)objc_msgSend((id)objc_msgSend(v12, "destinationEntity"), "tableName");
        v19 = v18;
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("UPDATE OR FAIL "));
        objc_msgSend(v20, "appendString:", v6);
        objc_msgSend(v20, "appendString:", CFSTR(" SET "));
        objc_msgSend(v20, "appendString:", objc_msgSend(v14, "columnName"));
        objc_msgSend(v20, "appendString:", CFSTR(" = (SELECT _EKT."));
        objc_msgSend(v20, "appendString:", CFSTR("Z_ENT"));
        objc_msgSend(v20, "appendString:", CFSTR(" FROM "));
        objc_msgSend(v20, "appendString:", v19);
        objc_msgSend(v20, "appendString:", CFSTR(" _EKT WHERE "));
        objc_msgSend(v20, "appendString:", v6);
        objc_msgSend(v20, "appendString:", CFSTR("."));
        objc_msgSend(v20, "appendString:", objc_msgSend(v13, "columnName"));
        objc_msgSend(v20, "appendString:", CFSTR(" = _EKT."));
        objc_msgSend(v20, "appendString:", CFSTR("Z_PK"));
        objc_msgSend(v20, "appendString:", CFSTR(")"));
        if (a2)
          v21 = *(NSSQLiteStatement **)(a2 + 32);
        else
          v21 = 0;
        v22 = -[NSSQLiteAdapter newStatementWithSQLString:](v21, (uint64_t)v20);

        objc_msgSend(v27, "addObject:", v22);
        ++v9;
      }
      while (v8 != v9);
      v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v8 = v23;
    }
    while (v23);
  }
  return v27;
}

- (NSSQLiteStatement)createUpdateStatementForEntityMigration:(uint64_t)a1 migrationContext:(uint64_t)a2
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  NSSQLBindVariable *v11;
  const __CFString *v12;
  NSSQLiteStatement *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSSQLiteStatement *v19;
  NSSQLiteStatement *v20;
  void *v22;
  void *v23;

  v3 = (_QWORD *)a1;
  v4 = -[_NSSQLEntityMigrationDescription nextPropertyTransform](a1);
  if (!v4)
    return 0;
  v5 = v4;
  if (v3)
  {
    v6 = v3[4];
    v7 = objc_msgSend(v3, "sourceEntity");
    if (v6)
    {
      v3 = (_QWORD *)objc_msgSend(*(id *)(v6 + 40), "objectForKey:", *(_QWORD *)(v5 + 16));
      v8 = 0;
      goto LABEL_5;
    }
    v3 = 0;
  }
  else
  {
    v7 = objc_msgSend(0, "sourceEntity");
    v6 = 0;
  }
  v8 = 1;
LABEL_5:
  v9 = *(void **)(v5 + 8);
  v10 = objc_msgSend(v9, "expressionType");
  if (v10 != 3)
  {
    if (!v10)
    {
      v11 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", objc_msgSend(v9, "constantValue"), objc_msgSend(v3, "sqlType"), 0);
      v12 = CFSTR("?");
      goto LABEL_12;
    }
    return 0;
  }
  v14 = objc_msgSend(v9, "keyPath");
  if ((v8 & 1) != 0)
    v15 = 0;
  else
    v15 = (void *)objc_msgSend(*(id *)(v6 + 40), "objectForKey:", v14);
  v12 = (const __CFString *)objc_msgSend(v15, "columnName");
  v11 = 0;
LABEL_12:
  if (*(_BYTE *)(v5 + 32))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" WHERE %@ is NULL"), objc_msgSend(v3, "columnName"), 0);
    if ((v8 & 1) != 0)
      goto LABEL_23;
    if (!*(_QWORD *)(v6 + 160))
    {
      v22 = *(void **)(v6 + 152);
      if (!v22 || !objc_msgSend(v22, "count"))
        goto LABEL_23;
    }
    if (v16)
    {
      objc_msgSend(v16, "appendString:", CFSTR(" AND "));
LABEL_20:
      objc_msgSend(v16, "appendString:", CFSTR("Z_ENT"));
      objc_msgSend(v16, "appendString:", CFSTR(" = "));
      if (v7)
        v17 = *(unsigned int *)(v7 + 184);
      else
        v17 = 0;
      objc_msgSend(v16, "appendFormat:", CFSTR("%d"), v17);
      goto LABEL_23;
    }
LABEL_19:
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" WHERE "));
    goto LABEL_20;
  }
  if ((v8 & 1) == 0)
  {
    if (*(_QWORD *)(v6 + 160))
      goto LABEL_19;
    v23 = *(void **)(v6 + 152);
    if (v23)
    {
      if (objc_msgSend(v23, "count"))
        goto LABEL_19;
    }
  }
  v16 = 0;
LABEL_23:
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("UPDATE OR FAIL "));
  objc_msgSend(v18, "appendString:", objc_msgSend((id)v6, "tableName"));
  objc_msgSend(v18, "appendString:", CFSTR(" SET "));
  objc_msgSend(v18, "appendString:", objc_msgSend(v3, "columnName"));
  objc_msgSend(v18, "appendString:", CFSTR(" = "));
  objc_msgSend(v18, "appendString:", v12);
  if (v16)
    objc_msgSend(v18, "appendString:", v16);
  if (a2)
    v19 = *(NSSQLiteStatement **)(a2 + 32);
  else
    v19 = 0;
  v20 = -[NSSQLiteAdapter newStatementWithSQLString:](v19, (uint64_t)v18);
  v13 = v20;
  if (v11)
  {
    -[NSSQLiteStatement addBindVariable:]((uint64_t)v20, v11);

  }
  if (v16)

  return v13;
}

- (NSSQLiteStatement)newCopyAndInsertStatementForToOne:(_QWORD *)a1 toManyToMany:(__CFString *)a2 fromTableName:(uint64_t)a3 invertColumns:(int)a4 migrationContext:(uint64_t)a5
{
  void *v10;
  char *data;
  __CFString *v12;
  __CFString *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSSQLiteStatement *v44;
  NSSQLiteStatement *v45;
  _QWORD *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("INSERT INTO "));
  objc_msgSend(v10, "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
  objc_msgSend(v10, "appendString:", CFSTR(" ("));
  if (a2)
    data = a2[2].data;
  else
    data = 0;
  v12 = -[NSSQLManyToMany inverseOrderColumnName](a2);
  if (a4)
  {
    objc_msgSend(v10, "appendString:", -[NSSQLManyToMany inverseColumnName](a2));
    objc_msgSend(v10, "appendString:", CFSTR(", "));
    objc_msgSend(v10, "appendString:", -[__CFString columnName](a2, "columnName"));
    if (v12)
    {
      objc_msgSend(v10, "appendString:", CFSTR(", "));
      objc_msgSend(v10, "appendString:", v12);
    }
    v13 = (__CFString *)data;
    if (!data)
      goto LABEL_12;
LABEL_11:
    objc_msgSend(v10, "appendString:", CFSTR(", "));
    objc_msgSend(v10, "appendString:", v13);
    goto LABEL_12;
  }
  objc_msgSend(v10, "appendString:", -[__CFString columnName](a2, "columnName"));
  objc_msgSend(v10, "appendString:", CFSTR(", "));
  objc_msgSend(v10, "appendString:", -[NSSQLManyToMany inverseColumnName](a2));
  if (data)
  {
    objc_msgSend(v10, "appendString:", CFSTR(", "));
    objc_msgSend(v10, "appendString:", data);
  }
  v13 = v12;
  if (v12)
    goto LABEL_11;
LABEL_12:
  v14 = (_QWORD *)objc_msgSend(a1, "entity");
  if (v14)
    v14 = (_QWORD *)v14[16];
  v15 = objc_msgSend(v14, "columnName");
  objc_msgSend(v10, "appendString:", CFSTR(") SELECT "));
  objc_msgSend(v10, "appendString:", v15);
  objc_msgSend(v10, "appendString:", CFSTR(", "));
  v16 = objc_msgSend((id)objc_msgSend(a1, "foreignKey"), "columnName");
  objc_msgSend(v10, "appendString:", v16);
  if (a1)
    v17 = (void *)a1[10];
  else
    v17 = 0;
  v18 = objc_msgSend(v17, "columnName");
  if (data)
  {
    v19 = v18;
    objc_msgSend(v10, "appendString:", CFSTR(", "));
    if (v19)
      v20 = v19;
    else
      v20 = v15;
    objc_msgSend(v10, "appendString:", v20);
  }
  if (v12)
    objc_msgSend(v10, "appendString:", CFSTR(", 2000"));
  objc_msgSend(v10, "appendString:", CFSTR(" FROM "));
  objc_msgSend(v10, "appendString:", a3);
  objc_msgSend(v10, "appendString:", CFSTR(" WHERE "));
  objc_msgSend(v10, "appendString:", v16);
  objc_msgSend(v10, "appendString:", CFSTR(" IS NOT NULL"));
  v21 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a5, (void *)objc_msgSend(a1, "entity"));
  v22 = -[_NSSQLTableMigrationDescription _retainedRemovedSubEntitiesOfEntity:](v21, objc_msgSend(a1, "entity"));
  v48 = a5;
  if (objc_msgSend(v22, "count"))
  {
    v23 = (_QWORD *)objc_msgSend(a1, "entity");
    v47 = a1;
    if (v23)
      v23 = (_QWORD *)v23[17];
    v24 = objc_msgSend(v23, "columnName");
    objc_msgSend(v10, "appendString:", CFSTR(" AND "));
    objc_msgSend(v10, "appendString:", v24);
    objc_msgSend(v10, "appendString:", CFSTR(" NOT IN ("));
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v54;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v54 != v28)
            objc_enumerationMutation(v22);
          v30 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v29);
          if ((v27 & 1) != 0)
            objc_msgSend(v10, "appendString:", CFSTR(","));
          if (v30)
            v31 = *(unsigned int *)(v30 + 184);
          else
            v31 = 0;
          objc_msgSend(v10, "appendFormat:", CFSTR("%d"), v31);
          ++v29;
          v27 = 1;
        }
        while (v26 != v29);
        v32 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        v26 = v32;
      }
      while (v32);
    }
    objc_msgSend(v10, "appendString:", CFSTR(")"));
    a1 = v47;
    a5 = v48;
  }

  if (a1)
  {
    v33 = (void *)a1[9];
    if (v33)
    {
      v34 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a5, (void *)objc_msgSend(a1, "destinationEntity"));
      v35 = -[_NSSQLTableMigrationDescription _retainedRemovedSubEntitiesOfEntity:](v34, objc_msgSend(a1, "destinationEntity"));
      if (objc_msgSend(v35, "count"))
      {
        objc_msgSend(v10, "appendString:", CFSTR(" AND "));
        objc_msgSend(v10, "appendString:", objc_msgSend(v33, "columnName"));
        objc_msgSend(v10, "appendString:", CFSTR(" NOT IN ("));
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        if (v36)
        {
          v37 = v36;
          v38 = 0;
          v39 = *(_QWORD *)v50;
          do
          {
            v40 = 0;
            do
            {
              if (*(_QWORD *)v50 != v39)
                objc_enumerationMutation(v35);
              v41 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v40);
              if ((v38 & 1) != 0)
                objc_msgSend(v10, "appendString:", CFSTR(","));
              if (v41)
                v42 = *(unsigned int *)(v41 + 184);
              else
                v42 = 0;
              objc_msgSend(v10, "appendFormat:", CFSTR("%d"), v42);
              ++v40;
              v38 = 1;
            }
            while (v37 != v40);
            v43 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            v37 = v43;
          }
          while (v43);
        }
        objc_msgSend(v10, "appendString:", CFSTR(")"));
        a5 = v48;
      }

    }
  }
  if (a5)
    v44 = *(NSSQLiteStatement **)(a5 + 32);
  else
    v44 = 0;
  v45 = -[NSSQLiteAdapter newStatementWithSQLString:](v44, (uint64_t)v10);

  return v45;
}

- (uint64_t)appendStatementsToCompleteMigration:(uint64_t)a3 migrationContext:
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSQLiteStatement *v9;
  NSSQLiteStatement *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)objc_msgSend(*(id *)(result + 96), "allValues", 0);
    result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (result)
    {
      v6 = result;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          if (a3)
            v9 = *(NSSQLiteStatement **)(a3 + 32);
          else
            v9 = 0;
          v10 = -[NSSQLiteAdapter newDropTableStatementOrFailForTableNamed:](v9, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
          objc_msgSend(a2, "addObject:", v10);

          ++v8;
        }
        while (v6 != v8);
        result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v6 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)appendDefaultValueStatementsToCompleteMigration:(uint64_t)a3 migrationContext:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  _BYTE *v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1 && *(_DWORD *)(a1 + 24) >= 2u)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = *(void **)(a1 + 104);
    if (!v7)
    {
      -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)a1, a3);
      v7 = *(void **)(a1 + 104);
    }
    if ((objc_msgSend(v7, "BOOLValue") & 1) == 0)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v8 = *(void **)(a1 + 56);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v26 != v10)
              objc_enumerationMutation(v8);
            v12 = -[_NSSQLTableMigrationDescription createDefaultValuePopulationStatementsForAddedColumnsEntityMigration:migrationContext:](a1, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), a3);
            v13 = v12;
            if (v12)
            {
              if (objc_msgSend(v12, "count"))
                objc_msgSend(v6, "addObjectsFromArray:", v13);

            }
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v9);
      }
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = *(void **)(a1 + 112);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v22 != v16)
              objc_enumerationMutation(v14);
            v18 = *(_BYTE **)(*((_QWORD *)&v21 + 1) + 8 * j);
            if (v18)
            {
              if (v18[24] == 10)
              {
                v19 = -[_NSSQLTableMigrationDescription createDefaultValuePopulationStatementsForAddedColumnsEntityMigration:migrationContext:](a1, objc_msgSend(*(id *)(a1 + 64), "objectForKey:", objc_msgSend((id)objc_msgSend(v18, "entity"), "name")), a3);
                v20 = v19;
                if (v19)
                {
                  if (objc_msgSend(v19, "count"))
                    objc_msgSend(v6, "addObjectsFromArray:", v20);

                }
              }
            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v15);
      }
      objc_msgSend(a2, "addObjectsFromArray:", v6);
    }

  }
}

- (id)createDefaultValuePopulationStatementsForAddedColumnsEntityMigration:(uint64_t)a3 migrationContext:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char isKindOfClass;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int *v36;
  void *v37;
  void *v38;
  NSSQLiteStatement *v39;
  NSSQLiteStatement *v40;
  uint64_t v42;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v47 = a1;
  v6 = *(void **)(a1 + 112);
  if (v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v8 = *(void **)(a1 + 112);
    v9 = objc_msgSend(*(id *)(v47 + 112), "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v53 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          if (!v13
            || *(_BYTE *)(v13 + 24) != 1
            || objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "attributeDescription"), "defaultValue"))
          {
            objc_msgSend(v7, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v10);
    }
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v7, "allObjects"));
  }
  v14 = *(void **)(v47 + 168);
  if (v14)
    objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v14, "allObjects"));
  v15 = *(void **)(v47 + 144);
  if (v15)
    objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v15, "allObjects"));
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    v44 = v5;
    v45 = *(_QWORD *)v49;
    do
    {
      v19 = 0;
      v42 = v17;
      do
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v5);
        v20 = *(unsigned __int8 **)(*((_QWORD *)&v48 + 1) + 8 * v19);
        if (v20)
        {
          v21 = v20[24];
          if (v21 == 10 || v21 == 1)
          {
            v23 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v19), "columnName");
            if (a2)
            {
              v24 = v23;
              v25 = *(void **)(a2 + 16);
              if (!v25)
              {
                -[_NSSQLEntityMigrationDescription _generateSQLValueMappingsWithMigrationContext:](a2, a3);
                v25 = *(void **)(a2 + 16);
              }
              v26 = objc_msgSend(v25, "objectForKey:", v24);
              if (v26)
              {
                v27 = v26;
                v28 = objc_msgSend((id)objc_msgSend(v20, "entity"), "rootEntity");
                v29 = objc_msgSend((id)v28, "tableName");
                v30 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("UPDATE %@ SET "), v29);
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();
                v32 = objc_msgSend(v20, "columnName");
                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v30, "appendFormat:", CFSTR("%@ = ?"), v32);
                  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v27, 0);
                }
                else
                {
                  objc_msgSend(v30, "appendFormat:", CFSTR("%@ = %@"), v32, v27);
                  v33 = 0;
                }
                if (!v28)
                  goto LABEL_49;
                if (*(_QWORD *)(v28 + 160) || (v37 = *(void **)(v28 + 152)) != 0 && objc_msgSend(v37, "count"))
                {
                  v34 = *(void **)(v28 + 152);
                  if (!v34 || !objc_msgSend(v34, "count"))
                  {
                    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" WHERE "));
                    objc_msgSend(v35, "appendString:", v29);
                    objc_msgSend(v35, "appendString:", CFSTR("."));
                    objc_msgSend(v35, "appendString:", CFSTR("Z_ENT"));
                    objc_msgSend(v35, "appendString:", CFSTR(" = "));
                    v36 = &OBJC_IVAR___NSSQLEntity__entityID;
                    goto LABEL_48;
                  }
                }
                if (*(_QWORD *)(v28 + 160) && (v38 = *(void **)(v28 + 152)) != 0 && objc_msgSend(v38, "count"))
                {
                  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" WHERE "));
                  objc_msgSend(v35, "appendFormat:", CFSTR("%d"), *(unsigned int *)(v28 + 184));
                  objc_msgSend(v35, "appendString:", CFSTR(" <= "));
                  objc_msgSend(v35, "appendString:", v29);
                  objc_msgSend(v35, "appendString:", CFSTR("."));
                  objc_msgSend(v35, "appendString:", CFSTR("Z_ENT"));
                  objc_msgSend(v35, "appendString:", CFSTR(" AND "));
                  objc_msgSend(v35, "appendString:", v29);
                  objc_msgSend(v35, "appendString:", CFSTR("."));
                  v17 = v42;
                  objc_msgSend(v35, "appendString:", CFSTR("Z_ENT"));
                  objc_msgSend(v35, "appendString:", CFSTR(" <= "));
                  v36 = &OBJC_IVAR___NSSQLEntity__subentityMaxID;
LABEL_48:
                  objc_msgSend(v35, "appendFormat:", CFSTR("%d"), *(unsigned int *)(v28 + *v36));
                }
                else
                {
LABEL_49:
                  v35 = 0;
                }
                if (objc_msgSend(*(id *)(v47 + 168), "containsObject:", v20))
                {
                  if (v35)
                    objc_msgSend(v35, "appendString:", CFSTR(" AND "));
                  else
                    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(" WHERE "));
                  objc_msgSend(v35, "appendFormat:", CFSTR("%@ IS NULL"), objc_msgSend(v20, "columnName"));
                }
                if (v35)
                  objc_msgSend(v30, "appendString:", v35);

                v39 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", 0, v30);
                v40 = v39;
                if (v33)
                {
                  -[NSSQLiteAdapter _useModel:]((uint64_t)v39, v33);

                }
                objc_msgSend(v46, "addObject:", v40);

                v5 = v44;
                v18 = v45;
              }
            }
          }
        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v17);
  }

  return v46;
}

- (void)_retainedRemovedSubEntitiesOfEntity:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(void **)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v17;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v4);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "sourceEntity");
      if (v10)
      {
        v11 = v10;
        v12 = *(_DWORD *)(v10 + 184);
        if (a2)
        {
          if (v12 < *(_DWORD *)(a2 + 184))
            goto LABEL_15;
          v13 = *(_DWORD *)(a2 + 188);
        }
        else
        {
          v13 = 0;
        }
        if (v12 <= v13)
        {
          if (!v7)
            v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
          objc_msgSend(v7, "addObject:", v11);
        }
      }
LABEL_15:
      ++v9;
    }
    while (v6 != v9);
    v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v6 = v14;
  }
  while (v14);
  return v7;
}

- (uint64_t)newCloudKitMetadataUpdateStatements:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSSQLiteStatement *v24;
  NSSQLiteStatement *v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  NSSQLiteStatement *v43;
  NSSQLiteStatement *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
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
  _QWORD v85[2];
  _BYTE v86[128];
  _BYTE v87[128];
  _QWORD v88[2];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (*(_DWORD *)(a1 + 24) == 1)
  {
    v3 = objc_msgSend(*(id *)(a1 + 8), "tableName");
    _NSCoreDataLog(4, (uint64_t)CFSTR("Migration: CloudKit tables detected. Adding migration statements for removed table: %@"), v4, v5, v6, v7, v8, v9, v3);
    v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v11 = *(_QWORD *)(a1 + 8);
    if (v11)
      v12 = *(void **)(v11 + 152);
    else
      v12 = 0;
    v13 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v12, "count") + 1);
    v14 = *(_QWORD *)(a1 + 8);
    if (v14)
      v15 = *(unsigned int *)(v14 + 184);
    else
      v15 = 0;
    objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15));
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v16 = *(_QWORD *)(a1 + 8);
    if (v16)
      v17 = *(void **)(v16 + 152);
    else
      v17 = 0;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v82;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v82 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v20);
          if (v21)
            v22 = *(unsigned int *)(v21 + 184);
          else
            v22 = 0;
          objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v22));
          ++v20;
        }
        while (v18 != v20);
        v23 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
        v18 = v23;
      }
      while (v23);
    }
    v24 = [NSSQLiteStatement alloc];
    v25 = -[NSSQLiteStatement initWithEntity:sqlString:](v24, "initWithEntity:sqlString:", 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM ANSCKRECORDMETADATA WHERE ZENTITYID IN %@"), v13));
    objc_msgSend(v68, "addObject:", v25);

    goto LABEL_76;
  }
  v62 = a1;
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = *(id *)(a1 + 56);
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    if (v26)
    {
      v64 = *(_QWORD *)v78;
      v27 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
      do
      {
        v28 = 0;
        v65 = v26;
        do
        {
          if (*(_QWORD *)v78 != v64)
            objc_enumerationMutation(obj);
          v29 = *(_QWORD **)(*((_QWORD *)&v77 + 1) + 8 * v28);
          objc_msgSend(v29, "validateCloudKitEntityMigration");
          v30 = objc_msgSend(v29, "sourceEntity");
          if (v30)
          {
            v31 = *(_DWORD *)(v30 + v27[465]);
            if (!v29)
              goto LABEL_48;
          }
          else
          {
            v31 = 0;
            if (!v29)
            {
LABEL_48:
              LODWORD(v32) = 0;
              goto LABEL_31;
            }
          }
          v32 = v29[4];
          if (v32)
            LODWORD(v32) = *(_DWORD *)(v32 + v27[465]);
LABEL_31:
          if (v31 != (_DWORD)v32)
          {
            v33 = (void *)MEMORY[0x1E0CB37E8];
            v34 = objc_msgSend(v29, "sourceEntity");
            if (v34)
              v35 = *(unsigned int *)(v34 + v27[465]);
            else
              v35 = 0;
            v88[0] = objc_msgSend(v33, "numberWithUnsignedInt:", v35);
            if (v29 && (v36 = v29[4]) != 0)
              v37 = *(unsigned int *)(v36 + v27[465]);
            else
              v37 = 0;
            v88[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v37);
            objc_msgSend(a2, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2));
          }
          v66 = v28;
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v38 = (void *)-[_NSSQLEntityMigrationDescription removedManyToManys]((uint64_t)v29);
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
          if (v39)
          {
            v40 = *(_QWORD *)v74;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v74 != v40)
                  objc_enumerationMutation(v38);
                v42 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
                v43 = [NSSQLiteStatement alloc];
                v44 = -[NSSQLiteStatement initWithEntity:sqlString:](v43, "initWithEntity:sqlString:", 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM ANSCKMIRROREDRELATIONSHIP WHERE ZCDENTITYNAME = '%@' AND ZRELATIONSHIPNAME = '%@'"), objc_msgSend((id)objc_msgSend(v29, "sourceEntity"), "name"), objc_msgSend(v42, "name")));
                objc_msgSend(v68, "addObject:", v44);

              }
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
            }
            while (v39);
          }
          v28 = v66 + 1;
          v27 = &OBJC_IVAR___NSEntityMapping__sourceExpression;
        }
        while (v66 + 1 != v65);
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
        v26 = v45;
      }
      while (v45);
    }
  }
  if (objc_msgSend(*(id *)(v62 + 48), "count"))
  {
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v46 = *(void **)(v62 + 48);
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v70;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v70 != v48)
            objc_enumerationMutation(v46);
          v50 = *(_QWORD **)(*((_QWORD *)&v69 + 1) + 8 * v49);
          objc_msgSend(v50, "validateCloudKitEntityMigration");
          v51 = objc_msgSend(v50, "sourceEntity");
          if (v51)
          {
            v52 = *(_DWORD *)(v51 + 184);
            if (!v50)
              goto LABEL_72;
          }
          else
          {
            v52 = 0;
            if (!v50)
            {
LABEL_72:
              LODWORD(v53) = 0;
              goto LABEL_62;
            }
          }
          v53 = v50[4];
          if (v53)
            LODWORD(v53) = *(_DWORD *)(v53 + 184);
LABEL_62:
          if (v52 != (_DWORD)v53)
          {
            v54 = (void *)MEMORY[0x1E0CB37E8];
            v55 = objc_msgSend(v50, "sourceEntity");
            if (v55)
              v56 = *(unsigned int *)(v55 + 184);
            else
              v56 = 0;
            v85[0] = objc_msgSend(v54, "numberWithUnsignedInt:", v56);
            if (v50 && (v57 = v50[4]) != 0)
              v58 = *(unsigned int *)(v57 + 184);
            else
              v58 = 0;
            v85[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v58);
            objc_msgSend(a2, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2));
          }
          ++v49;
        }
        while (v47 != v49);
        v59 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
        v47 = v59;
      }
      while (v59);
    }
  }
LABEL_76:
  v60 = objc_msgSend(v68, "copy");

  return v60;
}

- (NSSQLEntity)rootEntity
{
  return self->_rootEntity;
}

@end
